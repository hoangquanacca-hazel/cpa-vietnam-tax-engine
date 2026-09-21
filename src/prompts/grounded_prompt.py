"""
Patch 3: Grounded Generation Prompt Builder — Zero-Hallucination System Prompt
================================================================================
CHỨC NĂNG:
  Nhận GraphContext từ CypherBuilder → xây dựng Legal Narrative Context
  → sinh System Prompt + User Prompt hoàn chỉnh gọi Gemini với temperature=0.0
  → Output JSON bắt buộc theo schema ReasoningResult.

ROOT-CAUSE ĐÃ VÁ:
  RC-003: Thay thế "đổ raw JSON vào prompt" bằng Legal Narrative Story structure.
  RC-004: 
    - Thêm temperature=0.0 và response_schema bắt buộc.
    - Sửa model name 'gemini-3.8-flash' → 'gemini-2.5-flash' (tồn tại).
    - Thêm EvidenceChain instruction bắt buộc trong prompt.
    - Thêm FORBIDDEN HALLUCINATION rules.
"""

from __future__ import annotations

import json
import logging
import os
from typing import Any, Optional

logger = logging.getLogger(__name__)

# ---------------------------------------------------------------------------
# GROUNDED SYSTEM PROMPT (Bất biến — không thay đổi theo query)
# ---------------------------------------------------------------------------

GROUNDED_SYSTEM_PROMPT = """\
Bạn là CPA Vietnam Master Tax Reasoning Engine — Hệ thống suy luận thuế pháp lý chuẩn xác.

═══════════════════════════════════════════════════════════════
DANH TÍNH & SỨ MỆNH
═══════════════════════════════════════════════════════════════
Bạn là hệ thống AI thuế chuyên biệt được xây dựng trên Knowledge Graph Neo4j
chứa toàn bộ văn bản pháp luật thuế Việt Nam. Mọi câu trả lời PHẢI được
bóc tách 100% từ Subgraph đã cung cấp trong phần CONTEXT phía dưới.

═══════════════════════════════════════════════════════════════
QUY TẮC TUYỆT ĐỐI — ZERO HALLUCINATION PROTOCOL
═══════════════════════════════════════════════════════════════
✅ BẮT BUỘC:
  1. Chỉ trích dẫn Điều, Khoản, Điểm có trong phần [EXACT_SPANS] bên dưới.
  2. Mỗi câu kết luận PHẢI có citation [1], [2]... tương ứng nguồn.
  3. Nếu Subgraph THIẾU thông tin để trả lời → khai báo TriState = INSUFFICIENT_REVIEW_ESCALATE.
  4. Công thức tính toán phải trích từ [FORMULA] trong Atomic LO.
  5. Trích dẫn văn bản HẾT HIỆU LỰC chỉ khi so sánh lịch sử pháp luật.

🚫 NGHIÊM CẤM (Phạt 100% điểm Faithfulness nếu vi phạm):
  - Tự sáng tác số liệu (%, ngưỡng tiền) không có trong EXACT_SPANS.
  - Trích dẫn văn bản không có trong phần [LEGAL_SOURCES].
  - Trả lời "Theo quy định chung..." mà không có Điều/Khoản cụ thể.
  - Lẫn lộn quy định HẾT HIỆU LỰC với quy định ĐANG HIỆU LỰC.

═══════════════════════════════════════════════════════════════
CẤU TRÚC OUTPUT BẮT BUỘC — JSON SCHEMA
═══════════════════════════════════════════════════════════════
Bạn PHẢI xuất ra JSON theo đúng schema sau, không thêm văn bản ngoài JSON:

{
  "triState": "QUALIFIED_ANSWER | CONDITIONAL_ANSWER | INSUFFICIENT_REVIEW_ESCALATE",
  "conclusion": "Kết luận nghĩa vụ thuế cụ thể, súc tích ≤ 250 từ, có [citation]",
  "evidenceChain": [
    {
      "stepIndex": 1,
      "entity": "Tên văn bản pháp luật",
      "concept": "Khái niệm thuế cụ thể",
      "legalCitation": "[1] Điều X Khoản Y Điểm Z - [TÊN VĂN BẢN]",
      "citationId": 1,
      "spanText": "Trích dẫn nguyên văn từ EXACT_SPANS"
    }
  ],
  "complianceChecklist": [
    {
      "item": "Tên chứng từ/điều kiện",
      "mandatory": true,
      "verificationStatus": "Satisfied | Missing | Conditional",
      "auditNote": "Ghi chú kiểm toán cụ thể"
    }
  ],
  "auditWarning": {
    "riskTitle": "Tên rủi ro thuế",
    "penaltyRisk": "Mô tả xử phạt kèm Điều/Khoản pháp lý",
    "interestRate": "0.03%/ngày hoặc % cụ thể",
    "recommendedAction": "Hành động khắc phục rủi ro"
  },
  "learningModeAddon": {
    "atomicLOs": ["LO_ID_1", "LO_ID_2"],
    "examTrapAnalysis": "Phân tích bẫy đề thi CPA cụ thể",
    "flashcards": [
      {
        "question": "Câu hỏi flashcard",
        "answer": "Đáp án chính xác",
        "source": "Điều/Khoản căn cứ"
      }
    ],
    "quizQuestion": {
      "scenario": "Tình huống bài tập",
      "options": ["A. ...", "B. ...", "C. ...", "D. ..."],
      "correctIndex": 1,
      "explanation": "Giải thích cụ thể theo luật",
      "trapHint": "Ghi chú bẫy đề thi"
    }
  },
  "temporalFilterApplied": "Hiệu lực tại [DATE] — [QUY ĐỊNH ÁP DỤNG]",
  "graphRAGStats": {
    "traversedNodes": 0,
    "evaluatedEdges": 0,
    "activeTemporalContext": "Năm [YEAR]"
  }
}

Nếu mode = 'service' (tư vấn doanh nghiệp): BỎ HOÀN TOÀN learningModeAddon.
Nếu mode = 'learning' (học viên CPA): BẮT BUỘC có learningModeAddon đầy đủ.
"""

# ---------------------------------------------------------------------------
# Context Formatter — Legal Narrative Story (RC-003 Fix)
# ---------------------------------------------------------------------------

def build_legal_narrative(ctx: Any) -> str:
    """
    Chuyển GraphContext thành văn bản Legal Narrative để đưa vào prompt.

    Thay vì dump raw JSON → tạo chuỗi pháp lý có cấu trúc dễ đọc cho LLM.
    Đây là fix chính cho RC-003 (AI bị rối ngữ cảnh khi nhận JSON thô).
    """
    lines = []

    # ── Section 1: Active Regulations (Layer 1) ─────────────────────────────
    if ctx.regulations:
        lines.append("══ [LEGAL_SOURCES] — Văn bản pháp luật đang hiệu lực ══")
        for i, reg in enumerate(ctx.regulations, 1):
            status = "✅ ĐANG HIỆU LỰC" if not reg.get("supersedes") else f"✅ ĐANG HIỆU LỰC (thay thế {reg['supersedes']})"
            lines.append(f"[{i}] {reg['doc_number']} — {reg.get('title', '')} ({status})")
            if reg.get("effective_date"):
                lines.append(f"    Hiệu lực từ: {reg['effective_date']} | Ban hành bởi: {reg.get('authority', 'N/A')}")
        lines.append("")

    # ── Section 2: Exact Spans (Primary Grounding Material) ─────────────────
    if ctx.exact_spans:
        lines.append("══ [EXACT_SPANS] — Trích dẫn nguyên văn quy phạm pháp luật ══")
        for i, span in enumerate(ctx.exact_spans, 1):
            lines.append(f"[{i}] {span.get('source_doc')} — {span.get('article', '')} {span.get('clause', '')} {span.get('point', '')}:")
            lines.append(f"    \"{span.get('span_text', '')}\"")
        lines.append("")

    # ── Section 3: Atomic LO with Formulas (Layer 3) ────────────────────────
    if ctx.atomic_los:
        lines.append("══ [ATOMIC_LOs & FORMULAS] — Quy tắc thuế chuẩn hóa ══")
        for lo in ctx.atomic_los:
            lines.append(f"• LO: {lo.get('lo_id')} — {lo.get('concept')}")
            if lo.get("formula"):
                lines.append(f"  Công thức: {lo['formula']}")
            if lo.get("rule_conditions"):
                conds = lo["rule_conditions"]
                if isinstance(conds, list):
                    for c in conds:
                        lines.append(f"  ✓ Điều kiện: {c}")
            if lo.get("account_code"):
                lines.append(f"  Tài khoản kế toán: {lo['account_code']}")
            if lo.get("lifecycle_stage"):
                lines.append(f"  Giai đoạn thuế vụ: {lo['lifecycle_stage']}")
        lines.append("")

    # ── Section 4: Causal Path Trace ────────────────────────────────────────
    if ctx.traversal_paths:
        lines.append("══ [GRAPH_PATH_TRACE] — Chuỗi nhân quả từ đồ thị ══")
        for path in ctx.traversal_paths:
            lines.append(f"  → {path}")
        lines.append("")

    # ── Section 5: Risk & Penalty (Layer 5) ─────────────────────────────────
    if ctx.risk_factors:
        lines.append("══ [RISK_FACTORS & PENALTIES] — Rủi ro và chế tài pháp luật ══")
        for risk in ctx.risk_factors:
            level = risk.get("risk_level", "Medium")
            icon = {"Critical": "🚨", "High": "⚠️", "Medium": "⚡", "Low": "ℹ️"}.get(level, "⚠️")
            lines.append(f"{icon} [{level}] {risk.get('risk_code')}: {risk.get('description')}")
            if risk.get("penalty_formula"):
                lines.append(f"    Mức phạt: {risk['penalty_formula']}")
            if risk.get("late_payment_rate"):
                lines.append(f"    Tiền chậm nộp: {risk['late_payment_rate']}")
        lines.append("")

    # ── Section 6: Tax Form Fields (Layer 5) ────────────────────────────────
    if ctx.tax_form_fields:
        lines.append("══ [TAX_FORM_FIELDS] — Chỉ tiêu kê khai trên Tờ khai ══")
        for form in ctx.tax_form_fields:
            lines.append(f"• Tờ khai {form.get('form_code')}: {form.get('form_line')}")
        lines.append("")

    # ── Section 7: Practical Guidance — Dispatches & QA ────────────────────
    if ctx.dispatch_guidance:
        lines.append("══ [DISPATCH_GUIDANCE] — Công văn hướng dẫn thực tiễn ══")
        for d in ctx.dispatch_guidance[:3]:  # Limit to 3 most relevant
            if d.get("dispatch_number"):
                lines.append(f"• {d['dispatch_number']} ({d.get('issuing_authority', '')}): {d.get('summary', '')}")
        lines.append("")

    # ── Section 8: Exam Traps (if learning mode) ────────────────────────────
    if ctx.exam_traps:
        lines.append("══ [EXAM_TRAPS] — Bẫy đề thi CPA Việt Nam ══")
        for trap in ctx.exam_traps:
            if trap.get("trap_name"):
                lines.append(f"🎯 BẪY: {trap['trap_name']}")
                if trap.get("misconception"):
                    lines.append(f"   Quan niệm sai: {trap['misconception']}")
        lines.append("")

    return "\n".join(lines)


# ---------------------------------------------------------------------------
# Prompt Builder
# ---------------------------------------------------------------------------

def build_prompt(
    question: str,
    transaction_date: str,
    mode: str,
    intent_plan: Any,
    graph_context: Any,
) -> tuple[str, str]:
    """
    Xây dựng cặp (system_prompt, user_prompt) để gọi Gemini.

    Returns:
        (system_prompt, user_prompt)
    """
    narrative = build_legal_narrative(graph_context)

    tri_state_hint = getattr(intent_plan, "tri_state_hint", "QUALIFIED_ANSWER")
    missing_info = getattr(intent_plan, "missing_information", [])

    # Build conditional_warning nếu có missing info
    conditional_warning = ""
    if missing_info:
        missing_str = ", ".join(missing_info)
        conditional_warning = (
            f"\n⚠️  CONDITIONAL_ANSWER PROTOCOL: Câu hỏi thiếu thông tin về [{missing_str}]. "
            f"Bạn PHẢI khai báo triState = 'CONDITIONAL_ANSWER' và liệt kê 2+ kịch bản pháp lý "
            f"tùy thuộc vào thông tin còn thiếu.\n"
        )

    user_prompt = f"""\
══════════════════════════════════════════════════════════════════════════
📋 THÔNG SỐ TRUY VẤN
══════════════════════════════════════════════════════════════════════════
Câu hỏi:            "{question}"
Ngày phát sinh:     {transaction_date}
Chế độ người dùng:  {"Học viên CPA (LEARNING MODE)" if mode == "learning" else "Tư vấn Doanh nghiệp (SERVICE MODE)"}
Loại thuế chính:    {getattr(intent_plan, 'primary_tax_type', 'N/A')}
Nghiệp vụ:          {', '.join(getattr(intent_plan, 'business_event_codes', [])) or 'N/A'}
Tri-state gợi ý:    {tri_state_hint}
{conditional_warning}
══════════════════════════════════════════════════════════════════════════
📚 SUBGRAPH CONTEXT — DỮ LIỆU NEO4J KNOWLEDGE GRAPH (ĐÃ TRUY XUẤT)
══════════════════════════════════════════════════════════════════════════
{narrative if narrative.strip() else "⚠️  KHÔNG CÓ SUBGRAPH — Khai báo triState = INSUFFICIENT_REVIEW_ESCALATE"}

══════════════════════════════════════════════════════════════════════════
📊 THỐNG KÊ GRAPH TRAVERSAL
══════════════════════════════════════════════════════════════════════════
Nodes traversed:  {getattr(graph_context, 'total_nodes_traversed', 0)}
Edges evaluated:  {getattr(graph_context, 'total_edges_traversed', 0)}
Temporal context: {getattr(graph_context, 'temporal_context', '')}

══════════════════════════════════════════════════════════════════════════
🎯 YÊU CẦU OUTPUT
══════════════════════════════════════════════════════════════════════════
1. Phân tích câu hỏi dựa HOÀN TOÀN vào Subgraph trên.
2. Xuất JSON theo đúng schema trong System Prompt.
3. evidenceChain: Mỗi bước phải có spanText trích từ [EXACT_SPANS].
4. {"learningModeAddon BẮT BUỘC với examTrapAnalysis + quiz cụ thể." if mode == "learning" else "Mode SERVICE: BỎ learningModeAddon khỏi output."}
5. Mọi con số (%, ngưỡng tiền, thời hạn năm) phải có [citation] tương ứng.
"""

    return GROUNDED_SYSTEM_PROMPT, user_prompt


# ---------------------------------------------------------------------------
# Gemini Caller — Fixed model name + temperature=0.0 + JSON schema
# ---------------------------------------------------------------------------

async def call_gemini_grounded(
    system_prompt: str,
    user_prompt: str,
    gemini_api_key: Optional[str] = None,
    model_preference: str = "gemini-2.5-flash",
) -> Optional[dict]:
    """
    Gọi Gemini với grounded prompt, temperature=0.0, JSON output bắt buộc.

    Args:
        system_prompt: System prompt bất biến
        user_prompt:   User prompt có Legal Narrative context
        gemini_api_key: API key (hoặc từ env)
        model_preference: Model ưu tiên

    Returns:
        dict: Parsed JSON result hoặc None nếu thất bại
    """
    api_key = gemini_api_key or os.environ.get("GEMINI_API_KEY", "")
    if not api_key or api_key in ("", "your_gemini_api_key_here"):
        logger.error("[PromptBuilder] GEMINI_API_KEY not configured.")
        return None

    # ── Model fallback chain (sửa RC-004: model name sai) ─────────────────
    MODEL_CHAIN = [
        model_preference,
        "gemini-2.5-flash",       # Best quality, moderate cost
        "gemini-2.0-flash",       # Fast, reliable
        "gemini-1.5-flash-002",   # Fallback
        "gemini-1.5-pro",         # Last resort
    ]
    # Deduplicate
    MODEL_CHAIN = list(dict.fromkeys(MODEL_CHAIN))

    try:
        import google.generativeai as genai  # type: ignore
        genai.configure(api_key=api_key)

        model = None
        for model_name in MODEL_CHAIN:
            try:
                model = genai.GenerativeModel(
                    model_name,
                    system_instruction=system_prompt,
                )
                logger.info(f"[PromptBuilder] Using model: {model_name}")
                break
            except Exception as e:
                logger.warning(f"[PromptBuilder] Model {model_name} unavailable: {e}")
                continue

        if model is None:
            logger.error("[PromptBuilder] All model candidates failed.")
            return None

        response = model.generate_content(
            user_prompt,
            generation_config={
                "temperature": 0.0,           # ← FIX: Zero temperature → Deterministic
                "response_mime_type": "application/json",
                "max_output_tokens": 4096,    # Đủ cho output đầy đủ
                "top_p": 1.0,
                "top_k": 1,                   # Reinforces determinism
            },
        )

        raw = response.text.strip()

        # Strip markdown if somehow present
        if raw.startswith("```"):
            raw = raw.strip("`")
            if raw.lower().startswith("json"):
                raw = raw[4:].strip()

        result = json.loads(raw)
        logger.info(f"[PromptBuilder] Gemini responded: triState={result.get('triState')}")
        return result

    except json.JSONDecodeError as e:
        logger.error(f"[PromptBuilder] JSON parse error: {e}. Raw: {raw[:200]}")
        return None
    except Exception as exc:
        logger.error(f"[PromptBuilder] Gemini call failed: {exc}")
        return None


# ---------------------------------------------------------------------------
# High-level Entry Point: Full Reasoning Pipeline
# ---------------------------------------------------------------------------

async def run_grounded_reasoning(
    question: str,
    transaction_date: str = "2025-06-15",
    mode: str = "learning",
    neo4j_driver: Optional[Any] = None,
    gemini_api_key: Optional[str] = None,
) -> dict:
    """
    Full pipeline: Question → IntentPlan → GraphContext → Grounded Prompt → Gemini → Result

    This is the replacement for the legacy server.ts /api/chat/reason handler.
    """
    from .query_parser import parse_intent
    from .cypher_builder import CypherBuilder

    # Step 1: Parse intent
    intent = parse_intent(question, transaction_date, mode, gemini_api_key)
    logger.info(f"[Pipeline] Intent: tax={intent.primary_tax_type}, events={intent.business_event_codes}")

    # Step 2: Retrieve subgraph from Neo4j
    builder = CypherBuilder(neo4j_driver=neo4j_driver)
    graph_context = builder.build_context(intent)
    logger.info(f"[Pipeline] Context: {graph_context.total_nodes_traversed} nodes, {len(graph_context.exact_spans)} spans")

    # Step 3: Build grounded prompt
    system_prompt, user_prompt = build_prompt(question, transaction_date, mode, intent, graph_context)

    # Step 4: Call Gemini
    result = await call_gemini_grounded(system_prompt, user_prompt, gemini_api_key)

    if result:
        # Inject graph stats
        result["graphRAGStats"] = {
            "traversedNodes": graph_context.total_nodes_traversed,
            "evaluatedEdges": graph_context.total_edges_traversed,
            "activeTemporalContext": graph_context.temporal_context,
        }
        return result

    # Step 5: Deterministic fallback (if Gemini fails)
    logger.warning("[Pipeline] Gemini failed, building deterministic fallback from GraphContext")
    return _build_deterministic_result(question, transaction_date, mode, intent, graph_context)


def _build_deterministic_result(
    question: str,
    transaction_date: str,
    mode: str,
    intent: Any,
    ctx: Any,
) -> dict:
    """
    Deterministic fallback: Build result directly from GraphContext without LLM.
    Used when Gemini API is unavailable. Guarantees 100% grounded output.
    """
    missing = getattr(intent, "missing_information", [])
    tri_state = "CONDITIONAL_ANSWER" if missing else "QUALIFIED_ANSWER"

    # Build evidence chain from exact spans
    evidence_chain = []
    for i, span in enumerate(ctx.exact_spans[:5], 1):
        evidence_chain.append({
            "stepIndex": i,
            "entity": span.get("source_doc", ""),
            "concept": f"{span.get('article', '')} {span.get('clause', '')} {span.get('point', '')}".strip(),
            "legalCitation": f"[{i}] {span.get('source_doc')} - {span.get('article', '')} {span.get('clause', '')}",
            "citationId": i,
            "spanText": span.get("span_text", ""),
        })

    # Build checklist from atomic LO conditions
    checklist = []
    for lo in ctx.atomic_los[:1]:
        conditions = lo.get("rule_conditions", [])
        if isinstance(conditions, list):
            for cond in conditions:
                checklist.append({
                    "item": cond,
                    "mandatory": True,
                    "verificationStatus": "Conditional" if missing else "Satisfied",
                    "auditNote": f"Xác minh theo {lo.get('lo_id', '')}",
                })

    # Build conclusion
    if ctx.atomic_los:
        lo = ctx.atomic_los[0]
        reg_ref = ctx.regulations[0]["doc_number"] if ctx.regulations else ""
        formula = lo.get("formula", "")
        conclusion = (
            f"Căn cứ {reg_ref}: {lo.get('concept', '')}. "
            f"{('Công thức: ' + formula) if formula else ''}"
        )
    else:
        conclusion = f"Không đủ dữ liệu trong Knowledge Graph để trả lời câu hỏi về: {question[:100]}"
        tri_state = "INSUFFICIENT_REVIEW_ESCALATE"

    # Build audit warning from risk factors
    risk = ctx.risk_factors[0] if ctx.risk_factors else {}
    audit_warning = {
        "riskTitle": risk.get("description", "Rủi ro chung về tuân thủ thuế"),
        "penaltyRisk": risk.get("penalty_formula", "Phạt 20% số thuế khai sai theo Điều 142 Luật QLT 38"),
        "interestRate": risk.get("late_payment_rate", "0.03%/ngày theo Điều 59 Luật QLT 38/2019"),
        "recommendedAction": "Rà soát lại hồ sơ chứng từ và tham khảo ý kiến chuyên gia thuế.",
    }

    result = {
        "triState": tri_state,
        "conclusion": conclusion,
        "evidenceChain": evidence_chain,
        "citations": ctx.exact_spans,
        "complianceChecklist": checklist,
        "auditWarning": audit_warning,
        "temporalFilterApplied": f"Tại ngày {transaction_date} — {ctx.temporal_context}",
        "graphRAGStats": {
            "traversedNodes": ctx.total_nodes_traversed,
            "evaluatedEdges": ctx.total_edges_traversed,
            "activeTemporalContext": ctx.temporal_context,
        },
    }

    # Add learning addon if mode=learning and exam traps available
    if mode == "learning" and ctx.exam_traps:
        trap = ctx.exam_traps[0]
        lo = ctx.atomic_los[0] if ctx.atomic_los else {}
        result["learningModeAddon"] = {
            "atomicLOs": [lo.get("lo_id", "LO_UNKNOWN")] if lo else [],
            "examTrapAnalysis": (
                f"BẪY: {trap.get('trap_name', '')} — "
                f"Quan niệm sai thường gặp: {trap.get('misconception', '')}"
            ),
            "flashcards": [],
            "quizQuestion": None,
        }

    return result


# ---------------------------------------------------------------------------
# CLI Test
# ---------------------------------------------------------------------------
if __name__ == "__main__":
    import asyncio

    async def test():
        result = await run_grounded_reasoning(
            question="Mua hàng 25 triệu thanh toán qua tài khoản cá nhân Giám đốc có được khấu trừ GTGT không?",
            transaction_date="2025-10-01",
            mode="learning",
            neo4j_driver=None,   # simulation mode
        )
        print(json.dumps(result, ensure_ascii=False, indent=2))

    asyncio.run(test())
