"""
Patch 2: Cypher Builder Module — Multi-hop Graph Traversal Queries (3-4 hops)
================================================================================
CHỨC NĂNG:
  Nhận IntentPlan từ query_parser → sinh ra Cypher query tối ưu cho Neo4j
  với đầy đủ multi-hop traversal, temporal filter, và penalty lookup.

ROOT-CAUSE ĐÃ VÁ:
  RC-002: Thay thế flat filter() lookup bằng MATCH path traversal 3-4 hops.
  RC-005: Thêm temporal filter đầy đủ WHERE effective_date / expiration_date.

CẤU TRÚC GRAPH MẪU (5 LAYERS CPA VIETNAM):
  ┌─────────────────────────────────────────────────────────────┐
  │ L1: REGULATORY       REGULATION → LEGAL_PARAGRAPH           │
  │ L2: TAX_LIFECYCLE    BUSINESS_EVENT → TAX_LIFECYCLE_STAGE   │
  │ L3: COMPLIANCE_CALC  ATOMIC_LO → FORMULA → ACCOUNT          │
  │ L4: THE_BRIDGE       DISPATCH → QA_PAIR → EXAM_TRAP         │
  │ L5: ASSESSMENT_SVC   TAX_FORM_FIELD → RISK_FACTOR           │
  └─────────────────────────────────────────────────────────────┘
"""

from __future__ import annotations

import logging
from dataclasses import dataclass, field
from typing import Any

from .query_parser import IntentPlan, TaxType, UserMode

logger = logging.getLogger(__name__)


# ---------------------------------------------------------------------------
# Output Schema: Context Package returned from Neo4j
# ---------------------------------------------------------------------------

@dataclass
class GraphContext:
    """
    Structured output from the CypherBuilder.
    Contains all retrieved subgraph information for the PromptBuilder.
    """
    # Legal foundation (Layer 1)
    regulations: list[dict] = field(default_factory=list)
    legal_paragraphs: list[dict] = field(default_factory=list)
    exact_spans: list[dict] = field(default_factory=list)

    # Business event chain (Layer 2)
    business_events: list[dict] = field(default_factory=list)
    lifecycle_stages: list[dict] = field(default_factory=list)

    # Atomic LOs with formulas (Layer 3)
    atomic_los: list[dict] = field(default_factory=list)
    formulas: list[dict] = field(default_factory=list)
    accounting_accounts: list[dict] = field(default_factory=list)

    # Practical guidance (Layer 4)
    dispatch_guidance: list[dict] = field(default_factory=list)
    qa_pairs: list[dict] = field(default_factory=list)
    exam_traps: list[dict] = field(default_factory=list)

    # Compliance outputs (Layer 5)
    tax_form_fields: list[dict] = field(default_factory=list)
    risk_factors: list[dict] = field(default_factory=list)
    penalty_rules: list[dict] = field(default_factory=list)

    # Meta
    traversal_paths: list[str] = field(default_factory=list)   # Human-readable path traces
    temporal_context: str = ""
    total_nodes_traversed: int = 0
    total_edges_traversed: int = 0


# ---------------------------------------------------------------------------
# Core Cypher Templates
# ---------------------------------------------------------------------------

class CypherTemplates:
    """All parameterized Cypher queries for the 5-layer CPA Vietnam graph."""

    # ── Query A: Core 4-hop path from BusinessEvent to Regulation ──────────
    EVENT_TO_REGULATION_PATH = """
// ═══════════════════════════════════════════════════════════════════════
// QUERY A: 4-HOP PATH → BusinessEvent → Atomic_LO → LegalParagraph → Regulation
// Temporal filter: Chỉ lấy văn bản còn hiệu lực tại $tx_date
// ═══════════════════════════════════════════════════════════════════════
MATCH path = (event:BusinessEvent)
  -[:GOVERNED_BY]->(lo:Atomic_LO)
  -[:BASED_ON]->(para:LegalParagraph)
  -[:PART_OF]->(reg:REGULATION)
WHERE event.code IN $event_codes
  AND reg.effective_date <= date($tx_date)
  AND (reg.expiration_date IS NULL OR reg.expiration_date > date($tx_date))
  AND reg.legal_status <> 'Superseded'
OPTIONAL MATCH (reg)-[:SUPERSEDES]->(old_reg:REGULATION)
OPTIONAL MATCH (lo)-[:MAPS_TO_ACCOUNT]->(acct:AccountingAccount)
OPTIONAL MATCH (lo)-[:MAPS_TO_EVENT]->(evt_stage:TaxLifecycleStage)
RETURN 
  event.code AS event_code,
  event.name AS event_name,
  lo.lo_id AS lo_id,
  lo.tax_concept AS lo_concept,
  lo.formula AS formula,
  lo.rule_conditions AS rule_conditions,
  para.id AS para_id,
  para.article AS article,
  para.clause AS clause,
  para.span_text AS span_text,
  reg.doc_number AS reg_doc_number,
  reg.title AS reg_title,
  reg.effective_date AS effective_date,
  reg.legal_status AS legal_status,
  old_reg.doc_number AS supersedes_doc,
  acct.account_code AS account_code,
  acct.account_name AS account_name,
  evt_stage.stage_name AS lifecycle_stage
ORDER BY reg.effective_date DESC
LIMIT 20
"""

    # ── Query B: Temporal Comparison (Old vs New regulation) ───────────────
    TEMPORAL_COMPARISON = """
// ═══════════════════════════════════════════════════════════════════════
// QUERY B: SO SÁNH QUY ĐỊNH CŨ vs MỚI THEO THỜI GIAN
// Tìm chuỗi SUPERSEDES để trả lời "Quy định năm X thay thế quy định nào?"
// ═══════════════════════════════════════════════════════════════════════
MATCH (new_reg:REGULATION)-[:SUPERSEDES*1..3]->(old_reg:REGULATION)
WHERE new_reg.doc_number IN $doc_hints
  AND old_reg.legal_status = 'Superseded'
MATCH (new_reg)<-[:PART_OF]-(new_para:LegalParagraph)
  <-[:BASED_ON]-(lo:Atomic_LO)
MATCH (old_reg)<-[:PART_OF]-(old_para:LegalParagraph)
RETURN
  new_reg.doc_number AS new_doc,
  new_reg.effective_date AS new_effective,
  new_para.span_text AS new_rule_text,
  old_reg.doc_number AS old_doc,
  old_reg.expiration_date AS old_expiry,
  old_para.span_text AS old_rule_text,
  lo.lo_id AS lo_id,
  lo.tax_concept AS changed_concept
ORDER BY new_reg.effective_date DESC
LIMIT 10
"""

    # ── Query C: Penalty chain lookup ──────────────────────────────────────
    PENALTY_CHAIN = """
// ═══════════════════════════════════════════════════════════════════════
// QUERY C: CHUỖI PHẠT VÀ RỦI RO (3 hops: LO → Risk → Penalty → Form)
// ═══════════════════════════════════════════════════════════════════════
MATCH (lo:Atomic_LO)-[:EVALUATES_RISK]->(risk:RiskFactor)
  -[:PENALIZED_BY]->(penalty:PenaltyRule)
WHERE lo.lo_id IN $lo_ids
OPTIONAL MATCH (risk)-[:REQUIRES_FORM]->(form:TaxFormField)
OPTIONAL MATCH (penalty)-[:PART_OF]->(penalty_reg:REGULATION)
RETURN
  lo.lo_id AS lo_id,
  lo.tax_concept AS concept,
  risk.risk_code AS risk_code,
  risk.risk_level AS risk_level,
  risk.description AS risk_description,
  penalty.penalty_formula AS penalty_formula,
  penalty.base_rate AS base_rate,
  penalty.late_payment_rate AS late_payment_rate,
  penalty_reg.doc_number AS penalty_regulation,
  form.field_code AS form_field,
  form.form_name AS form_name,
  form.line_description AS line_description
ORDER BY risk.risk_level DESC
LIMIT 15
"""

    # ── Query D: Dispatch + QA practical guidance (Layer 4 Bridge) ─────────
    DISPATCH_QA_BRIDGE = """
// ═══════════════════════════════════════════════════════════════════════
// QUERY D: CÔNG VĂN & CÂU HỎI THỰC TIỄN (THE_BRIDGE LAYER)
// Tìm công văn hướng dẫn + Q&A + bẫy đề thi liên quan đến LO
// ═══════════════════════════════════════════════════════════════════════
MATCH (lo:Atomic_LO)
WHERE lo.lo_id IN $lo_ids
OPTIONAL MATCH (dispatch:OfficialLetter)-[:APPLIES_TO]->(lo)
OPTIONAL MATCH (qa:QA_Pair)-[:ILLUSTRATES]->(lo)
OPTIONAL MATCH (trap:ExamTrap)-[:TESTS_LO]->(lo)
RETURN
  lo.lo_id AS lo_id,
  lo.tax_concept AS concept,
  collect(DISTINCT {
    dispatch_id: dispatch.id,
    dispatch_number: dispatch.dispatch_number,
    summary: dispatch.summary,
    issuing_authority: dispatch.issuing_authority,
    issue_date: dispatch.issue_date
  }) AS dispatches,
  collect(DISTINCT {
    qa_id: qa.id,
    title: qa.title,
    scenario: qa.scenario_description,
    conclusion: qa.tax_conclusion
  }) AS qa_pairs,
  collect(DISTINCT {
    trap_id: trap.id,
    trap_name: trap.trap_name,
    misconception: trap.misconception_detail,
    cpa_exam_note: trap.CPA_exam_relevance
  }) AS exam_traps
LIMIT 10
"""

    # ── Query E: Tax Form Field mapping ────────────────────────────────────
    FORM_FIELD_MAPPING = """
// ═══════════════════════════════════════════════════════════════════════
// QUERY E: MAPPING TỜ KHAI (FORM FIELDS LAYER 5)
// Tìm chỉ tiêu cần kê khai trên tờ khai thuế
// ═══════════════════════════════════════════════════════════════════════
MATCH (event:BusinessEvent)-[:TRIGGERS_FORM]->(form:TaxFormField)
  -[:PART_OF]->(tax_return:TaxReturn)
WHERE event.code IN $event_codes
OPTIONAL MATCH (form)<-[:VALIDATES]-(lo:Atomic_LO)
RETURN
  event.code AS event_code,
  tax_return.form_code AS form_code,
  tax_return.form_name AS form_name,
  form.field_code AS field_code,
  form.line_description AS line_description,
  form.field_type AS field_type,
  form.validation_rule AS validation_rule,
  lo.formula AS formula
ORDER BY form.field_code
LIMIT 20
"""

    # ── Query F: Full context aggregation (combines A+C+D) ─────────────────
    FULL_CONTEXT_AGGREGATION = """
// ═══════════════════════════════════════════════════════════════════════
// QUERY F: FULL CONTEXT AGGREGATION (MAIN RETRIEVAL QUERY)
// 4-hop: BusinessEvent → AtomicLO → LegalParagraph → Regulation
//        + penalty chain + dispatch guidance + exam traps
// ═══════════════════════════════════════════════════════════════════════
MATCH (event:BusinessEvent)-[:GOVERNED_BY]->(lo:Atomic_LO)
WHERE event.code IN $event_codes
WITH lo, event

// Layer 1: Legal basis
MATCH (lo)-[:BASED_ON]->(para:LegalParagraph)-[:PART_OF]->(reg:REGULATION)
WHERE reg.effective_date <= date($tx_date)
  AND (reg.expiration_date IS NULL OR reg.expiration_date > date($tx_date))
  AND reg.legal_status <> 'Superseded'

// Layer 2: Superseded chain (for temporal comparison)
OPTIONAL MATCH (reg)-[:SUPERSEDES]->(old_reg:REGULATION)

// Layer 3: Compliance outputs
OPTIONAL MATCH (lo)-[:EVALUATES_RISK]->(risk:RiskFactor)-[:PENALIZED_BY]->(penalty:PenaltyRule)
OPTIONAL MATCH (lo)-[:MAPS_TO_ACCOUNT]->(acct:AccountingAccount)
OPTIONAL MATCH (lo)-[:MAPS_TO_EVENT]->(lifecycle:TaxLifecycleStage)

// Layer 4: Bridge (practical guidance)
OPTIONAL MATCH (dispatch:OfficialLetter)-[:APPLIES_TO]->(lo)
OPTIONAL MATCH (trap:ExamTrap)-[:TESTS_LO]->(lo)

// Layer 5: Form fields
OPTIONAL MATCH (event)-[:TRIGGERS_FORM]->(form:TaxFormField)-[:PART_OF]->(tax_return:TaxReturn)

RETURN
  event.code                      AS event_code,
  event.name                      AS event_name,
  lo.lo_id                        AS lo_id,
  lo.tax_concept                  AS lo_concept,
  lo.formula                      AS formula,
  lo.rule_conditions              AS rule_conditions,
  lo.exam_trap_warning            AS exam_trap_warning,
  para.id                         AS para_id,
  para.article                    AS article,
  para.clause                     AS clause,
  para.point                      AS point,
  para.span_text                  AS span_text,
  reg.doc_number                  AS reg_doc_number,
  reg.title                       AS reg_title,
  reg.effective_date              AS effective_date,
  reg.issuing_authority           AS authority,
  old_reg.doc_number              AS superseded_by_old,
  risk.risk_code                  AS risk_code,
  risk.risk_level                 AS risk_level,
  risk.description                AS risk_description,
  penalty.penalty_formula         AS penalty_formula,
  penalty.late_payment_rate       AS late_payment_rate,
  acct.account_code               AS account_code,
  lifecycle.stage_name            AS lifecycle_stage,
  collect(DISTINCT dispatch.dispatch_number) AS dispatch_refs,
  collect(DISTINCT {
    trap_name: trap.trap_name,
    misconception: trap.misconception_detail
  })                              AS exam_traps,
  tax_return.form_code            AS tax_form_code,
  form.line_description           AS form_line
ORDER BY reg.effective_date DESC, risk.risk_level
LIMIT 25
"""


# ---------------------------------------------------------------------------
# CypherBuilder Class
# ---------------------------------------------------------------------------

class CypherBuilder:
    """
    Builds and executes optimized Cypher queries against Neo4j.

    Flow:
      IntentPlan → select query templates → substitute params → execute → GraphContext
    """

    def __init__(self, neo4j_driver: Any = None):
        """
        Args:
            neo4j_driver: neo4j.Driver instance. If None, runs in simulation mode
                         (returns mock data for testing without Neo4j).
        """
        self._driver = neo4j_driver
        self._simulation_mode = neo4j_driver is None

    def build_context(self, intent: IntentPlan) -> GraphContext:
        """
        Main entry point: Convert IntentPlan → GraphContext via Neo4j queries.

        Args:
            intent: Structured intent from QueryParser

        Returns:
            GraphContext: All retrieved nodes/edges structured for PromptBuilder
        """
        ctx = GraphContext(temporal_context=f"Năm {intent.transaction_year} ({intent.transaction_year}-01-01 đến {intent.transaction_year}-12-31)")

        if self._simulation_mode:
            logger.warning("[CypherBuilder] Running in simulation mode (no Neo4j driver). Returning mock context.")
            return self._mock_context(intent)

        with self._driver.session() as session:
            # ── Step 1: Core 4-hop traversal ─────────────────────────────
            if intent.business_event_codes:
                rows = session.run(
                    CypherTemplates.FULL_CONTEXT_AGGREGATION,
                    event_codes=intent.business_event_codes,
                    tx_date=f"{intent.transaction_year}-12-31",  # Use end of year as temporal anchor
                ).data()

                for row in rows:
                    self._map_row_to_context(row, ctx)

            # ── Step 2: Temporal comparison (if regulation changed recently) ─
            if intent.legal_doc_hints and intent.requires_temporal_filter:
                temporal_rows = session.run(
                    CypherTemplates.TEMPORAL_COMPARISON,
                    doc_hints=intent.legal_doc_hints,
                ).data()
                for row in temporal_rows:
                    ctx.traversal_paths.append(
                        f"[TEMPORAL] {row.get('new_doc')} supersedes {row.get('old_doc')} "
                        f"from {row.get('new_effective')}"
                    )

            # ── Step 3: Penalty chain (if risk query) ────────────────────
            if intent.requires_penalty_lookup:
                lo_ids = [r.get("lo_id") for r in ctx.atomic_los if r.get("lo_id")]
                if lo_ids:
                    penalty_rows = session.run(
                        CypherTemplates.PENALTY_CHAIN,
                        lo_ids=lo_ids,
                    ).data()
                    ctx.penalty_rules.extend(penalty_rows)

            # ── Step 4: Bridge layer — dispatch + exam traps ─────────────
            lo_ids = [r.get("lo_id") for r in ctx.atomic_los if r.get("lo_id")]
            if lo_ids:
                bridge_rows = session.run(
                    CypherTemplates.DISPATCH_QA_BRIDGE,
                    lo_ids=lo_ids,
                ).data()
                for row in bridge_rows:
                    ctx.dispatch_guidance.extend(row.get("dispatches", []))
                    ctx.qa_pairs.extend(row.get("qa_pairs", []))
                    ctx.exam_traps.extend(row.get("exam_traps", []))

            # ── Step 5: Form fields (if required) ────────────────────────
            if intent.requires_form_fields and intent.business_event_codes:
                form_rows = session.run(
                    CypherTemplates.FORM_FIELD_MAPPING,
                    event_codes=intent.business_event_codes,
                ).data()
                ctx.tax_form_fields.extend(form_rows)

        ctx.total_nodes_traversed = (
            len(ctx.regulations) + len(ctx.legal_paragraphs) + len(ctx.atomic_los) +
            len(ctx.dispatch_guidance) + len(ctx.exam_traps) + len(ctx.tax_form_fields)
        )
        return ctx

    def _map_row_to_context(self, row: dict, ctx: GraphContext) -> None:
        """Map a Neo4j row result into the appropriate GraphContext lists."""
        # Regulations
        if row.get("reg_doc_number") and not any(
            r["doc_number"] == row["reg_doc_number"] for r in ctx.regulations
        ):
            ctx.regulations.append({
                "doc_number": row["reg_doc_number"],
                "title": row.get("reg_title"),
                "effective_date": str(row.get("effective_date", "")),
                "authority": row.get("authority"),
                "supersedes": row.get("superseded_by_old"),
            })

        # Legal paragraphs / Exact spans
        if row.get("para_id"):
            span = {
                "para_id": row["para_id"],
                "article": row.get("article"),
                "clause": row.get("clause"),
                "point": row.get("point"),
                "span_text": row.get("span_text"),
                "source_doc": row.get("reg_doc_number"),
            }
            ctx.exact_spans.append(span)
            ctx.legal_paragraphs.append(span)

        # Atomic LOs
        if row.get("lo_id") and not any(lo["lo_id"] == row["lo_id"] for lo in ctx.atomic_los):
            ctx.atomic_los.append({
                "lo_id": row["lo_id"],
                "concept": row.get("lo_concept"),
                "formula": row.get("formula"),
                "rule_conditions": row.get("rule_conditions", []),
                "exam_trap_warning": row.get("exam_trap_warning"),
                "account_code": row.get("account_code"),
                "lifecycle_stage": row.get("lifecycle_stage"),
            })

        # Business events
        if row.get("event_code") and not any(e["code"] == row["event_code"] for e in ctx.business_events):
            ctx.business_events.append({
                "code": row["event_code"],
                "name": row.get("event_name"),
            })

        # Risks & Penalties
        if row.get("risk_code"):
            ctx.risk_factors.append({
                "risk_code": row["risk_code"],
                "risk_level": row.get("risk_level"),
                "description": row.get("risk_description"),
                "penalty_formula": row.get("penalty_formula"),
                "late_payment_rate": row.get("late_payment_rate"),
            })

        # Exam traps (inline)
        if row.get("exam_traps"):
            for trap in row["exam_traps"]:
                if trap.get("trap_name") and trap not in ctx.exam_traps:
                    ctx.exam_traps.append(trap)

        # Tax form fields
        if row.get("tax_form_code"):
            ctx.tax_form_fields.append({
                "form_code": row["tax_form_code"],
                "form_line": row.get("form_line"),
            })

    def _mock_context(self, intent: IntentPlan) -> GraphContext:
        """
        Simulation mode: Generate realistic mock context for testing without Neo4j.
        Used when driver is None (e.g., in unit tests or offline demo).
        """
        ctx = GraphContext(temporal_context=f"Năm {intent.transaction_year}")

        MOCK_DATA = {
            TaxType.CIT: {
                "regulation": {"doc_number": "NĐ 20/2025/NĐ-CP", "title": "Quy định về giá giao dịch liên kết", "effective_date": "2025-01-01", "authority": "Chính phủ", "supersedes": "NĐ 132/2020/NĐ-CP"},
                "span": {"para_id": "PARA_ND20_D16", "article": "Điều 16", "clause": "Khoản 3", "point": "Điểm a", "span_text": "Chi phí lãi vay thuần phát sinh trong kỳ của người nộp thuế không vượt quá 30% tổng lợi nhuận thuần từ hoạt động kinh doanh trong kỳ cộng chi phí lãi vay thuần và chi phí khấu hao phát sinh trong kỳ của người nộp thuế.", "source_doc": "NĐ 20/2025/NĐ-CP"},
                "lo": {"lo_id": "LO_CIT_INTEREST_LIMIT_RELATED_PARTY", "concept": "Khống chế trần 30% EBITDA đối với chi phí lãi vay trong giao dịch liên kết", "formula": "Trần lãi vay = 30% × EBITDA; EBITDA = Lợi nhuận thuần + Lãi vay thuần + Khấu hao", "rule_conditions": ["Có giao dịch liên kết trong kỳ", "Áp dụng NĐ 20/2025/NĐ-CP từ 2025"], "account_code": "TK_635", "lifecycle_stage": "DECLARATION"},
                "risk": {"risk_code": "RISK_CIT_INTEREST_OVER_EBITDA", "risk_level": "High", "description": "Chi phí lãi vay vượt 30% EBITDA bị loại khỏi chi phí được trừ", "penalty_formula": "Truy thu 20% TNDN trên khoản vượt", "late_payment_rate": "0.03%/ngày"},
                "form": {"form_code": "01/NĐ-GDLK", "form_line": "Chỉ tiêu B4: Phần chi phí lãi vay không được trừ trong kỳ"},
                "trap": {"trap_name": "Nhầm lãi vay TỔNG vs lãi vay THUẦN khi tính EBITDA", "misconception": "Lấy toàn bộ lãi vay chưa trừ lãi tiền gửi vào mẫu số EBITDA"},
            },
            TaxType.VAT: {
                "regulation": {"doc_number": "TT 219/2013/TT-BTC", "title": "Hướng dẫn thi hành Luật Thuế GTGT", "effective_date": "2014-01-01", "authority": "Bộ Tài chính", "supersedes": None},
                "span": {"para_id": "PARA_TT219_D15_K1", "article": "Điều 15", "clause": "Khoản 1", "point": "Điểm b", "span_text": "Có chứng từ thanh toán qua ngân hàng đối với hàng hóa, dịch vụ mua vào từ hai mươi triệu đồng trở lên, trừ trường hợp tổng giá trị hàng hóa, dịch vụ mua vào từng lần theo hóa đơn dưới hai mươi triệu đồng theo giá đã có thuế GTGT.", "source_doc": "TT 219/2013/TT-BTC"},
                "lo": {"lo_id": "LO_VAT_INPUT_DEDUCTION_CONDITIONS", "concept": "Điều kiện khấu trừ thuế GTGT đầu vào ≥ 20 triệu — yêu cầu tài khoản ngân hàng đăng ký", "formula": "Không áp dụng khấu trừ nếu TK thanh toán không phải TK ngân hàng DN đã đăng ký", "rule_conditions": ["Hóa đơn điện tử hợp pháp", "Thanh toán qua TK ngân hàng đã đăng ký của DN mua (không phải TK cá nhân)"], "account_code": "TK_1331", "lifecycle_stage": "DECLARATION"},
                "risk": {"risk_code": "RISK_VAT_NON_REGISTERED_BANK_ACCOUNT", "risk_level": "Critical", "description": "TK cá nhân Giám đốc không phải TK DN đã đăng ký → bị loại khấu trừ toàn bộ GTGT + chi phí TNDN", "penalty_formula": "Truy thu 10% GTGT + 20% TNDN + phạt 20% khai sai", "late_payment_rate": "0.03%/ngày"},
                "form": {"form_code": "01/GTGT", "form_line": "[25] Thuế GTGT còn được khấu trừ kỳ này"},
                "trap": {"trap_name": "Nhầm TK cá nhân Giám đốc với TK doanh nghiệp khi thanh toán ≥ 20 triệu", "misconception": "Chuyển khoản ngân hàng qua TK cá nhân vẫn được chấp nhận vì 'đã qua ngân hàng'"},
            },
            TaxType.PIT: {
                "regulation": {"doc_number": "TT 111/2013/TT-BTC", "title": "Hướng dẫn thi hành Luật Thuế TNCN", "effective_date": "2013-10-09", "authority": "Bộ Tài chính", "supersedes": None},
                "span": {"para_id": "PARA_TT111_D2_K2_D_A_ITEM7", "article": "Điều 2", "clause": "Khoản 2", "point": "Điểm đ - Khoản phụ cấp trang phục", "span_text": "Phụ cấp trang phục: không tính vào thu nhập chịu thuế TNCN nếu được chi trả bằng tiền, mức tối đa 5.000.000 đồng/người/năm.", "source_doc": "TT 111/2013/TT-BTC"},
                "lo": {"lo_id": "LO_PIT_UNIFORM_ALLOWANCE_EXEMPTION", "concept": "Miễn TNCN phụ cấp trang phục tối đa 5tr/năm và tiền ăn ca 730.000đ/tháng", "formula": "Phần vượt mức miễn = Thu nhập chịu thuế TNCN theo biểu lũy tiến từng phần", "rule_conditions": ["Phụ cấp trang phục ≤ 5.000.000đ/năm: miễn TNCN", "Tiền ăn giữa ca ≤ 730.000đ/tháng: miễn TNCN", "Quỹ dự phòng tiền lương: miễn TNCN khi trích, tính TNCN khi chi thực tế"], "account_code": "TK_334", "lifecycle_stage": "DECLARATION"},
                "risk": {"risk_code": "RISK_PIT_SALARY_RESERVE_WRONG_TIMING", "risk_level": "High", "description": "Kê khai TNCN trên khoản trích quỹ lương sai thời điểm (trích vs chi thực tế)", "penalty_formula": "Phạt 20% số thuế TNCN khai thiếu + 0.03%/ngày chậm nộp", "late_payment_rate": "0.03%/ngày"},
                "form": {"form_code": "05/KK-TNCN", "form_line": "Chỉ tiêu [17]: Thu nhập không chịu thuế - khoản phụ cấp miễn thuế"},
                "trap": {"trap_name": "BẪY: Quỹ dự phòng tiền lương khi trích ≠ khi chi — thời điểm TNCN khác nhau", "misconception": "Trích quỹ dự phòng lương vào chi phí TNDN → thí sinh nghĩ luôn miễn TNCN. SAI! Khi chi thực tế từ quỹ mới phát sinh TNCN."},
            },
        }

        tax = intent.primary_tax_type
        data = MOCK_DATA.get(tax, MOCK_DATA[TaxType.VAT])

        ctx.regulations.append(data["regulation"])
        ctx.exact_spans.append(data["span"])
        ctx.legal_paragraphs.append(data["span"])
        ctx.atomic_los.append(data["lo"])
        ctx.risk_factors.append(data["risk"])
        ctx.tax_form_fields.append(data["form"])
        ctx.exam_traps.append(data["trap"])
        ctx.business_events = [{"code": c, "name": c} for c in intent.business_event_codes]

        ctx.traversal_paths = [
            f"BusinessEvent({intent.business_event_codes[0] if intent.business_event_codes else 'N/A'})"
            f" → AtomicLO({data['lo']['lo_id']})"
            f" → LegalParagraph({data['span']['para_id']})"
            f" → Regulation({data['regulation']['doc_number']})"
        ]
        ctx.total_nodes_traversed = 6
        ctx.total_edges_traversed = 5

        return ctx


# ---------------------------------------------------------------------------
# CLI Test Runner
# ---------------------------------------------------------------------------
if __name__ == "__main__":
    from .query_parser import parse_intent
    import json

    TEST_QUESTIONS = [
        ("Doanh nghiệp có phát sinh giao dịch liên kết năm 2025, chi phí lãi vay bị khống chế ra sao?", "2025-06-15", "service"),
        ("Mua hàng 25 triệu thanh toán bằng tài khoản cá nhân Giám đốc có được khấu trừ GTGT không?", "2025-10-01", "service"),
        ("Bẫy TNCN phụ cấp trang phục và quỹ dự phòng tiền lương", "2025-01-01", "learning"),
    ]

    builder = CypherBuilder(neo4j_driver=None)  # simulation mode

    for q, d, m in TEST_QUESTIONS:
        intent = parse_intent(q, d, m)
        ctx = builder.build_context(intent)
        print(f"\n{'='*70}")
        print(f"QUERY: {q[:70]}...")
        print(f"TAX TYPE: {intent.primary_tax_type}")
        print(f"EVENTS: {intent.business_event_codes}")
        print(f"REGULATIONS: {[r['doc_number'] for r in ctx.regulations]}")
        print(f"LOs: {[lo['lo_id'] for lo in ctx.atomic_los]}")
        print(f"EXAM TRAPS: {len(ctx.exam_traps)}")
        print(f"PATH: {ctx.traversal_paths}")
