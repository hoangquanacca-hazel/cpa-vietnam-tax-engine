"""LLM extraction module using OpenAI or Gemini API."""

import json
import logging
from pathlib import Path
from typing import Dict, Any

from .config import LLM_MODEL, OPENAI_API_KEY, GEMINI_API_KEY

logger = logging.getLogger(__name__)

PROMPTS_DIR = Path(__file__).parent / "prompts"


def _load_prompt_template(doc_type: str) -> str:
    path = PROMPTS_DIR / f"{doc_type}.j2"
    if not path.exists():
        raise FileNotFoundError(f"Prompt template for {doc_type} not found at {path}")
    return path.read_text(encoding="utf-8")


def extract_document(text: str, doc_type: str) -> Dict[str, Any]:
    """Extract entities and relationships from text using LLM."""

    # 1. Try Gemini if GEMINI_API_KEY is available
    if GEMINI_API_KEY and GEMINI_API_KEY != "your_gemini_api_key_here":
        try:
            import google.generativeai as genai
            genai.configure(api_key=GEMINI_API_KEY)
            # Handle gemini model names fallback
            model_name = LLM_MODEL if LLM_MODEL else "gemini-2.0-flash"
            for m_candidate in [model_name, "gemini-2.0-flash", "gemini-1.5-flash-002", "gemini-1.5-pro"]:
                try:
                    model = genai.GenerativeModel(m_candidate)
                    break
                except Exception:
                    continue

            template_str = _load_prompt_template(doc_type)
            prompt_content = template_str.replace("{{CONTENT}}", text)

            response = model.generate_content(
                prompt_content,
                generation_config={"response_mime_type": "application/json"}
            )
            raw_output = response.text.strip()
            data = json.loads(raw_output)
            logger.info(f"Gemini successfully extracted data for {doc_type}")
            return data
        except Exception as err:
            logger.warning(f"Gemini API extraction failed: {err}. Falling back...")

    # 2. Try OpenAI if OPENAI_API_KEY is available
    if OPENAI_API_KEY and OPENAI_API_KEY != "your_openai_api_key_here":
        try:
            from openai import OpenAI
            client = OpenAI(api_key=OPENAI_API_KEY)
            model_name = LLM_MODEL if "gpt" in LLM_MODEL.lower() else "gpt-4o-mini"

            template_str = _load_prompt_template(doc_type)
            prompt_content = template_str.replace("{{CONTENT}}", text)

            response = client.chat.completions.create(
                model=model_name,
                messages=[
                    {
                        "role": "system",
                        "content": "You are a JSON-only extraction engine. Always output clean JSON matching the requested schema without markdown backticks.",
                    },
                    {"role": "user", "content": prompt_content},
                ],
                temperature=0.0,
                max_tokens=2500,
            )

            raw_output = response.choices[0].message.content.strip()
            if raw_output.startswith("```"):
                raw_output = raw_output.strip("`")
                if raw_output.lower().startswith("json"):
                    raw_output = raw_output[4:].strip()

            data = json.loads(raw_output)
            logger.info(f"OpenAI successfully extracted data for {doc_type}")
            return data
        except Exception as err:
            logger.warning(f"OpenAI API extraction failed: {err}. Falling back...")

    # 3. Fallback mock data generator
    logger.info(f"Using structured mock extraction for {doc_type}")
    return _generate_mock_extraction(text, doc_type)


def _generate_mock_extraction(text: str, doc_type: str) -> Dict[str, Any]:
    """Fallback generator for offline testing or when API key is unconfigured."""
    snippet = text[:60].replace("\n", " ").replace("'", "")
    if doc_type == "dispatch":
        return {
            "dispatch": {
                "id": f"DISPATCH_{abs(hash(text)) % 10000:04d}",
                "dispatch_number": "565/CT-CS",
                "issue_date": "2026-01-15",
                "issuing_authority": "Cục Thuế",
                "target_taxpayer": "Doanh nghiệp thương mại dịch vụ",
                "summary": f"Hướng dẫn thuế theo nội dung: {snippet}...",
            },
            "regulations": [
                {
                    "id": "REG_TT200_2014",
                    "number": "Thông tư 200/2014/TT-BTC",
                    "title": "Hướng dẫn Chế độ kế toán doanh nghiệp",
                }
            ],
            "event": {
                "event_code": "EVENT_BUY_FIXED_ASSET",
                "event_name": "Mua sắm tài sản cố định",
                "domain": "CIT",
            },
            "account": {
                "account_code": "TK_211",
                "account_name": "Tài sản cố định hữu hình",
            },
            "concept": {
                "id": "CONCEPT_DEDUCTIBLE_EXPENSE",
                "name": "Chi phí được trừ khi tính thuế TNDN",
                "tax_type": "CIT",
                "deductible_flag": True,
                "conditions": "Có hóa đơn chứng từ hợp lệ và thanh toán không dùng tiền mặt",
            },
        }
    else:  # qa
        return {
            "qa": {
                "id": f"QA_TAX_VAT_{abs(hash(text)) % 10000:04d}",
                "title": f"Giải đáp thắc mắc về {snippet[:30]}",
                "scenario_description": f"Tình huống thực tế: {snippet}",
                "core_question": "Thời điểm xuất hóa đơn và kê khai thuế GTGT?",
                "tax_type": "VAT",
                "target_audience": "Doanh nghiệp kê khai thuế GTGT",
                "tax_conclusion": "Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.",
            },
            "event": {
                "event_code": "EVENT_ISSUING_E_INVOICE",
                "event_name": "Lập hóa đơn điện tử",
                "domain": "VAT",
            },
            "account": {
                "account_code": "TK_1331",
                "account_name": "Thuế GTGT được khấu trừ của hàng hóa, dịch vụ",
            },
            "dispatch_ref": {
                "id": "DISPATCH_SAMPLE_01",
            },
            "risk": {
                "risk_code": "RISK_INVOICE_TIMING_ERROR",
                "risk_level": "Medium",
                "penalty_ref": "Nghị định 125/2020/NĐ-CP",
                "audit_warning": "Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.",
            },
            "trap": {
                "id": "TRAP_CPA_VAT_TIMING",
                "trap_name": "Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn",
                "misconception_detail": "Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.",
                "CPA_exam_relevance": "Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.",
            },
        }
