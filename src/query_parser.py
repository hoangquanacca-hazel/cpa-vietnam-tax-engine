"""
Patch 1: Query Parser Module — Intent Extraction & Structured Query Planning
================================================================================
CHỨC NĂNG:
  Nhận raw text câu hỏi → gọi Gemini Flash để trích xuất Structured Intent JSON
  → cung cấp IntentPlan cho CypherBuilder và PromptBuilder phía sau.

ROOT-CAUSE ĐÃ VÁ:
  RC-001: Thay thế 5 if/elif qLower.includes() bằng NLU parser thực sự.

INPUT:  Câu hỏi thuần văn bản + transactionDate + mode
OUTPUT: IntentPlan (dataclass) với đầy đủ Entity, EventCodes, TaxTypes, UserMode
"""

from __future__ import annotations

import json
import logging
import os
import unicodedata
from dataclasses import dataclass, field, asdict
from enum import Enum
from typing import Optional

logger = logging.getLogger(__name__)


def _normalize_vn(text: str) -> str:
    """
    Chuẩn hoá văn bản tiếng Việt để match không phân biệt dấu/không dấu.
    Ví dụ: 'lãi vay' và 'lai vay' → đều trở thành 'lai vay' sau normalize.
    """
    nfkd = unicodedata.normalize('NFKD', text.lower())
    return ''.join(c for c in nfkd if not unicodedata.combining(c))



# ---------------------------------------------------------------------------
# Schema Definitions
# ---------------------------------------------------------------------------

class UserMode(str, Enum):
    STUDENT = "STUDENT"         # Học viên CPA / đại lý thuế đang ôn thi
    CONSULTANT = "CONSULTANT"   # Kế toán trưởng / tư vấn viên doanh nghiệp


class TaxType(str, Enum):
    CIT = "CIT"         # Thuế Thu nhập Doanh nghiệp (TNDN)
    VAT = "VAT"         # Thuế Giá trị Gia tăng (GTGT)
    PIT = "PIT"         # Thuế Thu nhập Cá nhân (TNCN)
    SCT = "SCT"         # Thuế Tiêu thụ Đặc biệt (TTĐB)
    IMPORT = "IMPORT"   # Thuế Xuất nhập khẩu
    OTHER = "OTHER"


class TriStateHint(str, Enum):
    """Gợi ý tri-state khi intent rõ ràng."""
    QUALIFIED = "QUALIFIED_ANSWER"
    CONDITIONAL = "CONDITIONAL_ANSWER"      # Cần thêm thông tin
    ESCALATE = "INSUFFICIENT_REVIEW_ESCALATE"


@dataclass
class IntentPlan:
    """Kết quả phân tích ý định câu hỏi — Input cho CypherBuilder."""

    # Core intent
    primary_tax_type: TaxType = TaxType.OTHER
    secondary_tax_types: list[TaxType] = field(default_factory=list)

    # Extracted entities
    business_event_codes: list[str] = field(default_factory=list)
    # e.g. ["EVENT_PAY_INTEREST_RELATED_PARTY", "EVENT_CIT_TRANSFER_PRICING"]

    key_entities: list[str] = field(default_factory=list)
    # e.g. ["Chi phí lãi vay", "NĐ 20/2025/NĐ-CP", "Giao dịch liên kết"]

    legal_doc_hints: list[str] = field(default_factory=list)
    # e.g. ["NĐ 20/2025/NĐ-CP", "NĐ 320/2025/NĐ-CP"]

    # Context
    transaction_year: int = 2025
    user_mode: UserMode = UserMode.STUDENT
    tri_state_hint: TriStateHint = TriStateHint.QUALIFIED

    # Flags for Cypher builder
    requires_temporal_filter: bool = True
    requires_penalty_lookup: bool = False
    requires_form_fields: bool = False
    is_exam_trap_query: bool = False
    missing_information: list[str] = field(default_factory=list)
    # Fields caller needs to ask for before answering (→ CONDITIONAL_ANSWER)

    # Raw question for fallback
    raw_question: str = ""
    parse_confidence: float = 0.0   # 0.0–1.0


# ---------------------------------------------------------------------------
# Intent Parser System Prompt
# ---------------------------------------------------------------------------

_INTENT_SYSTEM_PROMPT = """\
Bạn là Tax Intent Parser của Hệ thống CPA Vietnam GraphRAG Engine.
Nhiệm vụ: Phân tích câu hỏi thuế tiếng Việt và xuất ra 1 JSON object duy nhất, \
không có markdown, không có giải thích thêm.

Schema bắt buộc:
{
  "primary_tax_type": "CIT|VAT|PIT|SCT|IMPORT|OTHER",
  "secondary_tax_types": [],
  "business_event_codes": [],
  "key_entities": [],
  "legal_doc_hints": [],
  "user_mode": "STUDENT|CONSULTANT",
  "tri_state_hint": "QUALIFIED_ANSWER|CONDITIONAL_ANSWER|INSUFFICIENT_REVIEW_ESCALATE",
  "requires_temporal_filter": true,
  "requires_penalty_lookup": false,
  "requires_form_fields": false,
  "is_exam_trap_query": false,
  "missing_information": [],
  "parse_confidence": 0.0
}

Quy tắc trích xuất:
1. business_event_codes: Chuyển nghiệp vụ thành code dạng EVENT_[DOMAIN]_[ACTION]
   Ví dụ: "chi phí lãi vay giao dịch liên kết" → "EVENT_CIT_INTEREST_RELATED_PARTY"
   Ví dụ: "khấu trừ thuế GTGT đầu vào" → "EVENT_VAT_INPUT_DEDUCTION"
   Ví dụ: "tài khoản cá nhân giám đốc" → "EVENT_VAT_NON_REGISTERED_ACCOUNT_PAYMENT"
   Ví dụ: "phụ cấp trang phục TNCN" → "EVENT_PIT_UNIFORM_ALLOWANCE_EXEMPTION"

2. tri_state_hint = "CONDITIONAL_ANSWER" khi câu hỏi thiếu thông tin:
   - Chưa biết hình thức thanh toán (tiền mặt/chuyển khoản) → missing_information: ["payment_method"]
   - Chưa biết đây là ngân hàng liên kết hay độc lập → missing_information: ["bank_relationship_type"]

3. user_mode = "STUDENT" khi câu hỏi có từ: "bẫy", "đề thi", "CPA", "luyện thi", "phân tích", "bài tập"
   user_mode = "CONSULTANT" khi câu hỏi là tình huống thực tế doanh nghiệp

4. parse_confidence: 0.95 nếu câu hỏi rõ ràng, 0.6 nếu mơ hồ, 0.3 nếu quá ngắn

Không thêm bất kỳ văn bản nào ngoài JSON.
"""


# ---------------------------------------------------------------------------
# Main Parser Function
# ---------------------------------------------------------------------------

def parse_intent(
    question: str,
    transaction_date: str = "2025-06-15",
    mode: str = "learning",
    gemini_api_key: Optional[str] = None,
) -> IntentPlan:
    """
    Phân tích ý định câu hỏi thuế → IntentPlan.

    Thử Gemini Flash trước (chính xác cao), fallback về rule-based nếu API fail.

    Args:
        question:          Câu hỏi người dùng (tiếng Việt)
        transaction_date:  Ngày phát sinh giao dịch (YYYY-MM-DD)
        mode:              'learning' | 'service'
        gemini_api_key:    Gemini API key (từ env nếu None)

    Returns:
        IntentPlan: Kế hoạch truy vấn có cấu trúc
    """
    tx_year = int(transaction_date.split("-")[0]) if transaction_date else 2025
    api_key = gemini_api_key or os.environ.get("GEMINI_API_KEY", "")

    # ── 1. LLM-BASED INTENT PARSING (PRIMARY PATH) ─────────────────────────
    if api_key and api_key not in ("", "your_gemini_api_key_here"):
        try:
            plan = _parse_with_gemini(question, transaction_date, mode, api_key, tx_year)
            if plan and plan.parse_confidence >= 0.4:
                logger.info(
                    f"[IntentParser] Gemini parsed: tax={plan.primary_tax_type}, "
                    f"events={plan.business_event_codes}, confidence={plan.parse_confidence}"
                )
                return plan
        except Exception as exc:
            logger.warning(f"[IntentParser] Gemini parse failed: {exc}. Falling back to rule-based.")

    # ── 2. RULE-BASED FALLBACK (OFFLINE / API UNAVAILABLE) ──────────────────
    return _parse_with_rules(question, transaction_date, mode, tx_year)


def _parse_with_gemini(
    question: str,
    transaction_date: str,
    mode: str,
    api_key: str,
    tx_year: int,
) -> Optional[IntentPlan]:
    """Gọi Gemini Flash để parse intent."""
    try:
        import google.generativeai as genai  # type: ignore

        genai.configure(api_key=api_key)

        # Dùng Flash vì chỉ cần classify, không cần reasoning sâu
        for model_candidate in ["gemini-2.0-flash", "gemini-1.5-flash-002", "gemini-1.5-pro"]:
            try:
                model = genai.GenerativeModel(
                    model_candidate,
                    system_instruction=_INTENT_SYSTEM_PROMPT,
                )
                break
            except Exception:
                continue

        user_prompt = (
            f"Câu hỏi: \"{question}\"\n"
            f"Ngày phát sinh: {transaction_date} (Năm {tx_year})\n"
            f"Chế độ người dùng: {'STUDENT (Học viên CPA)' if mode == 'learning' else 'CONSULTANT (Tư vấn doanh nghiệp)'}"
        )

        response = model.generate_content(
            user_prompt,
            generation_config={
                "response_mime_type": "application/json",
                "temperature": 0.0,   # Deterministic
                "max_output_tokens": 800,
            },
        )

        raw = response.text.strip()
        data = json.loads(raw)

        return IntentPlan(
            primary_tax_type=TaxType(data.get("primary_tax_type", "OTHER")),
            secondary_tax_types=[TaxType(t) for t in data.get("secondary_tax_types", []) if t in TaxType._value2member_map_],
            business_event_codes=data.get("business_event_codes", []),
            key_entities=data.get("key_entities", []),
            legal_doc_hints=data.get("legal_doc_hints", []),
            transaction_year=tx_year,
            user_mode=UserMode(data.get("user_mode", "STUDENT")),
            tri_state_hint=TriStateHint(data.get("tri_state_hint", "QUALIFIED_ANSWER")),
            requires_temporal_filter=data.get("requires_temporal_filter", True),
            requires_penalty_lookup=data.get("requires_penalty_lookup", False),
            requires_form_fields=data.get("requires_form_fields", False),
            is_exam_trap_query=data.get("is_exam_trap_query", False),
            missing_information=data.get("missing_information", []),
            raw_question=question,
            parse_confidence=float(data.get("parse_confidence", 0.8)),
        )

    except Exception as exc:
        logger.error(f"[IntentParser._parse_with_gemini] Error: {exc}")
        return None


def _parse_with_rules(
    question: str,
    transaction_date: str,
    mode: str,
    tx_year: int,
) -> IntentPlan:
    """
    Rule-based intent parser — fallback khi Gemini không available.
    Mở rộng đáng kể so với hệ thống cũ (5 buckets → dynamic rule table).
    """
    # ── Apply Vietnamese normalization (match cả có dấu lẫn không dấu) ────────
    # q_norm: câu hỏi đã chuẩn hóa (bỏ dấu) để match với keyword
    q = question.lower()
    q_norm = _normalize_vn(question)   # ← vừa lowercase + bỏ dấu

    user_mode = UserMode.STUDENT if mode == "learning" else UserMode.CONSULTANT

    # ── Keyword → (TaxType, EventCodes, DocHints) mapping ──────────────────
    RULE_TABLE = [
        # CIT Interest / Transfer Pricing
        {
            "keywords": ["lai vay", "ebitda", "giao dich lien ket", "30% ebitda", "ben lien ket", "chuyen ky sau", "khong che tran"],
            "tax": TaxType.CIT,
            "events": ["EVENT_CIT_INTEREST_RELATED_PARTY", "EVENT_CIT_EBITDA_CAP"],
            "docs": ["NĐ 20/2025/NĐ-CP", "NĐ 320/2025/NĐ-CP", "NĐ 132/2020/NĐ-CP"],
            "needs_temporal": True,
            "penalty": True,
            "form_fields": True,   # Phụ lục 01/NĐ-GDLK
        },
        # VAT Input deduction — bank transfer / personal account
        {
            "keywords": ["khau tru", "dau vao", "tai khoan", "chuyen khoan", "uy nhiem chi", "tai khoan ca nhan", "giam doc", "ca nhan giam doc"],
            "tax": TaxType.VAT,
            "events": ["EVENT_VAT_INPUT_DEDUCTION", "EVENT_VAT_NON_REGISTERED_ACCOUNT_PAYMENT"],
            "docs": ["TT 219/2013/TT-BTC", "Luật 48/2024/QH15"],
            "needs_temporal": True,
            "penalty": True,
            "form_fields": False,
            "missing": ["payment_account_type"],
        },
        # VAT Import
        {
            "keywords": ["nhap khau", "hai quan", "giay nop tien", "phan bo", "dung chung", "to khai hai quan"],
            "tax": TaxType.VAT,
            "events": ["EVENT_VAT_IMPORT_DEDUCTION", "EVENT_VAT_PRORATE_ALLOCATION"],
            "docs": ["Luật 48/2024/QH15", "TT 80/2021/TT-BTC"],
            "needs_temporal": True,
            "penalty": False,
            "form_fields": True,
        },
        # VAT cash payment ≥ 20M
        {
            "keywords": ["20 trieu", "25 trieu", "tien mat", "tiep khach", "khong dung tien mat", "toan tien mat"],
            "tax": TaxType.VAT,
            "events": ["EVENT_VAT_CASH_PAYMENT_OVER_20M", "EVENT_CIT_DEDUCTIBLE_EXPENSE"],
            "docs": ["TT 78/2014/TT-BTC", "TT 219/2013/TT-BTC"],
            "needs_temporal": False,
            "penalty": True,
            "form_fields": False,
            "missing_if_absent": {
                "payment_method": ["tien mat", "chuyen khoan", "uy nhiem chi", "qua ngan hang"]
            },
        },
        # VAT rate reduction household
        {
            "keywords": ["ho kinh doanh", "ve xe", "174/2024", "450.000", "giam thue", "ty le %", "ty le phan tram"],
            "tax": TaxType.VAT,
            "events": ["EVENT_VAT_REDUCTION_HOUSEHOLD_DIRECT", "EVENT_INVOICE_HOUSEHOLD"],
            "docs": ["NQ 174/2024/QH15", "NĐ 180/2024/NĐ-CP"],
            "needs_temporal": True,
            "penalty": False,
            "form_fields": True,
        },
        # PIT — Allowances & exempt income
        {
            "keywords": ["tncn", "thu nhap ca nhan", "phu cap", "trang phuc", "tien an", "an giua ca",
                         "quy du phong", "du phong tien luong", "bieu luy tien", "giam tru gia canh",
                         "bay thi", "bay tncn"],
            "tax": TaxType.PIT,
            "events": ["EVENT_PIT_UNIFORM_ALLOWANCE_EXEMPTION", "EVENT_PIT_MEAL_ALLOWANCE_EXEMPTION",
                       "EVENT_PIT_SALARY_RESERVE_FUND", "EVENT_PIT_PROGRESSIVE_TAXABLE"],
            "docs": ["TT 111/2013/TT-BTC", "TT 26/2016/TT-BTC", "Luật TNCN 04/2007/QH12 sửa đổi"],
            "needs_temporal": False,
            "penalty": False,
            "form_fields": True,
            "is_trap": True,
        },
        # CIT depreciation / fixed asset
        {
            "keywords": ["khau hao", "tai san co dinh", "tscd", "hao mon", "tai san"],
            "tax": TaxType.CIT,
            "events": ["EVENT_CIT_DEPRECIATION_EXPENSE"],
            "docs": ["TT 45/2013/TT-BTC", "TT 147/2016/TT-BTC"],
            "needs_temporal": True,
            "penalty": False,
            "form_fields": False,
        },
    ]

    # ── Match against rule table (using normalized query) ────────────────────
    best_rule = None
    best_score = 0

    for rule in RULE_TABLE:
        # Match normalized keywords against normalized query
        score = sum(1 for kw in rule["keywords"] if kw in q_norm)
        if score > best_score:
            best_score = score
            best_rule = rule


    if best_rule and best_score >= 1:
        # Check for conditional answer (missing info)
        missing = list(best_rule.get("missing", []))
        tri_state = TriStateHint.QUALIFIED

        if "missing_if_absent" in best_rule:
            for field_name, indicators in best_rule["missing_if_absent"].items():
                # Check indicators against normalized query
                if not any(ind in q_norm for ind in indicators):
                    missing.append(field_name)
                    tri_state = TriStateHint.CONDITIONAL


        return IntentPlan(
            primary_tax_type=best_rule["tax"],
            business_event_codes=best_rule["events"],
            legal_doc_hints=best_rule["docs"],
            transaction_year=tx_year,
            user_mode=user_mode,
            tri_state_hint=tri_state,
            requires_temporal_filter=best_rule.get("needs_temporal", True),
            requires_penalty_lookup=best_rule.get("penalty", False),
            requires_form_fields=best_rule.get("form_fields", False),
            is_exam_trap_query=best_rule.get("is_trap", False),
            missing_information=missing,
            raw_question=question,
            parse_confidence=min(0.5 + best_score * 0.15, 0.9),
        )

    # ── No match: generic fallback ───────────────────────────────────────────
    logger.warning(f"[IntentParser] No rule matched for: '{question[:80]}' — using generic fallback")
    return IntentPlan(
        primary_tax_type=TaxType.OTHER,
        transaction_year=tx_year,
        user_mode=user_mode,
        tri_state_hint=TriStateHint.ESCALATE,
        raw_question=question,
        parse_confidence=0.1,
    )


# ---------------------------------------------------------------------------
# CLI Test Runner
# ---------------------------------------------------------------------------
if __name__ == "__main__":
    TEST_CASES = [
        (
            "Doanh nghiệp có phát sinh giao dịch liên kết năm 2025, chi phí lãi vay "
            "bị khống chế ra sao và phần vượt khống chế được chuyển kỳ sau như thế nào?",
            "2025-06-15", "service"
        ),
        (
            "Doanh nghiệp mua hàng hóa trên 20 triệu đồng thanh toán bằng tài khoản cá nhân "
            "của Giám đốc thì có được khấu trừ thuế GTGT đầu vào và tính chi phí được trừ thuế TNDN không?",
            "2025-10-01", "service"
        ),
        (
            "Phân tích các bẫy thường gặp trong câu hỏi tự luận Thuế TNCN đối với khoản "
            "phụ cấp trang phục, tiền ăn giữa ca và trích quỹ dự phòng tiền lương.",
            "2025-01-01", "learning"
        ),
    ]

    for q, d, m in TEST_CASES:
        print(f"\n{'='*70}")
        print(f"QUERY: {q[:80]}...")
        result = parse_intent(q, d, m)
        print(json.dumps(asdict(result), ensure_ascii=False, indent=2, default=str))
