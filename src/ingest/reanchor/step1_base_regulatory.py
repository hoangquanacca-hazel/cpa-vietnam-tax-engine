"""Step 1: Cataloging & Base Regulatory Ingestion Module.

Creates Base Regulatory Nodes:
- Tầng 1: LegalDoc (Luật, Nghị định, Thông tư), LegalParagraph (Điều, Khoản)
- Tầng 3: Atomic_LO (Atomic Learning Objects for CPA & Compliance)
- Edges: [:SUPERSEDES], [:GUIDES], [:AMENDS], [:BASED_ON]
"""

import logging
from pathlib import Path
from typing import Dict, Any, List

logger = logging.getLogger(__name__)

# Core Tax Regulations Catalog (Luật, Nghị định, Thông tư)
BASE_REGULATIONS = [
    # 1. VAT (Thuế Giá trị gia tăng)
    {
        "id": "DOC_LUAT_48_2024_QH15",
        "doc_number": "Luật số 48/2024/QH15",
        "title": "Luật Thuế Giá trị gia tăng 2024",
        "doc_type": "LUAT",
        "legal_status": "Active",
        "effective_date": "2025-07-01",
        "domain": "VAT",
        "supersedes": ["DOC_LUAT_13_2008_QH12"],
        "paragraphs": [
            {"id": "PARA_L48_D5", "number": "Điều 5", "title": "Đối tượng không chịu thuế GTGT"},
            {"id": "PARA_L48_D9", "number": "Điều 9", "title": "Thuế suất 0%"},
            {"id": "PARA_L48_D11", "number": "Điều 11", "title": "Thuế suất 10%"},
            {"id": "PARA_L48_D13", "number": "Điều 13", "title": "Điều kiện khấu trừ thuế GTGT đầu vào"},
            {"id": "PARA_L48_D14", "number": "Điều 14", "title": "Hoàn thuế GTGT"},
        ],
    },
    {
        "id": "DOC_ND_181_2025_NDCP",
        "doc_number": "Nghị định số 181/2025/NĐ-CP",
        "title": "Nghị định hướng dẫn chi tiết Luật Thuế GTGT",
        "doc_type": "NGHI_DINH",
        "legal_status": "Active",
        "effective_date": "2025-07-01",
        "domain": "VAT",
        "guides": ["DOC_LUAT_48_2024_QH15"],
        "paragraphs": [
            {"id": "PARA_ND181_D9", "number": "Điều 9", "title": "Khấu trừ thuế GTGT đầu vào cho hàng hóa xuất khẩu"},
            {"id": "PARA_ND181_D12", "number": "Điều 12", "title": "Chứng từ thanh toán không dùng tiền mặt"},
        ],
    },
    {
        "id": "DOC_TT_69_2025_TTBTC",
        "doc_number": "Thông tư số 69/2025/TT-BTC",
        "title": "Thông tư hướng dẫn thi hành Nghị định 181/2025/NĐ-CP về Thuế GTGT",
        "doc_type": "THONG_TU",
        "legal_status": "Active",
        "effective_date": "2025-07-01",
        "domain": "VAT",
        "guides": ["DOC_ND_181_2025_NDCP"],
        "paragraphs": [
            {"id": "PARA_TT69_D14", "number": "Điều 14", "title": "Nguyên tắc khấu trừ thuế GTGT đầu vào"},
            {"id": "PARA_TT69_D15", "number": "Điều 15", "title": "Điều kiện khấu trừ thuế GTGT đầu vào"},
        ],
    },

    # 2. CIT (Thuế Thu nhập doanh nghiệp)
    {
        "id": "DOC_LUAT_67_2025_QH15",
        "doc_number": "Luật số 67/2025/QH15",
        "title": "Luật Thuế Thu nhập doanh nghiệp 2025",
        "doc_type": "LUAT",
        "legal_status": "Active",
        "effective_date": "2026-01-01",
        "domain": "CIT",
        "supersedes": ["DOC_LUAT_14_2008_QH12"],
        "paragraphs": [
            {"id": "PARA_L67_D9", "number": "Điều 9", "title": "Các khoản chi được trừ và không được trừ khi xác định thu nhập chịu thuế TNDN"},
            {"id": "PARA_L67_D10", "number": "Điều 10", "title": "Thuế suất thuế TNDN"},
            {"id": "PARA_L67_D13", "number": "Điều 13", "title": "Ưu đãi thuế TNDN"},
        ],
    },
    {
        "id": "DOC_ND_320_2025_NDCP",
        "doc_number": "Nghị định số 320/2025/NĐ-CP",
        "title": "Nghị định hướng dẫn thi hành Luật Thuế TNDN",
        "doc_type": "NGHI_DINH",
        "legal_status": "Active",
        "effective_date": "2026-01-01",
        "domain": "CIT",
        "guides": ["DOC_LUAT_67_2025_QH15"],
        "paragraphs": [
            {"id": "PARA_ND320_D4", "number": "Điều 4", "title": "Chi phí được trừ khi tính thuế TNDN"},
            {"id": "PARA_ND320_D9", "number": "Điều 9", "title": "Chi phí trích lập dự phòng"},
        ],
    },
    {
        "id": "DOC_ND_132_2020_NDCP",
        "doc_number": "Nghị định số 132/2020/NĐ-CP",
        "title": "Nghị định quy định về quản lý thuế đối với doanh nghiệp có giao dịch liên kết",
        "doc_type": "NGHI_DINH",
        "legal_status": "Active",
        "effective_date": "2020-12-20",
        "domain": "TRANSFER_PRICING",
        "paragraphs": [
            {"id": "PARA_ND132_D16", "number": "Điều 16", "title": "Xác định chi phí được trừ khi tính thuế TNDN đối với doanh nghiệp có giao dịch liên kết (Khống chế lãi vay 30% EBITDA)"},
        ],
    },

    # 3. Tax Administration & Enforcement (Quản lý thuế & Xử phạt)
    {
        "id": "DOC_LUAT_38_2019_QH14",
        "doc_number": "Luật số 38/2019/QH14",
        "title": "Luật Quản lý Thuế 2019",
        "doc_type": "LUAT",
        "legal_status": "Active",
        "effective_date": "2020-07-01",
        "domain": "TAX_ADMIN",
        "paragraphs": [
            {"id": "PARA_L38_D42", "number": "Điều 42", "title": "Kê khai thuế"},
            {"id": "PARA_L38_D44", "number": "Điều 44", "title": "Thời hạn nộp hồ sơ khai thuế"},
            {"id": "PARA_L38_D59", "number": "Điều 59", "title": "Xử lý tiền chậm nộp tiền thuế"},
        ],
    },
    {
        "id": "DOC_ND_310_2025_NDCP",
        "doc_number": "Nghị định số 310/2025/NĐ-CP",
        "title": "Nghị định xử phạt vi phạm hành chính về thuế, hóa đơn",
        "doc_type": "NGHI_DINH",
        "legal_status": "Active",
        "effective_date": "2025-01-01",
        "domain": "TAX_ADMIN",
        "supersedes": ["DOC_ND_125_2020_NDCP"],
        "paragraphs": [
            {"id": "PARA_ND310_D16", "number": "Điều 16", "title": "Xử phạt hành vi khai sai dẫn đến thiếu số tiền thuế phải nộp"},
            {"id": "PARA_ND310_D17", "number": "Điều 17", "title": "Xử phạt hành vi trốn thuế"},
            {"id": "PARA_ND310_D24", "number": "Điều 24", "title": "Xử phạt hành vi vi phạm quy định về lập hóa đơn"},
        ],
    },
    {
        "id": "DOC_TT_80_2021_TTBTC",
        "doc_number": "Thông tư số 80/2021/TT-BTC",
        "title": "Thông tư hướng dẫn Luật Quản lý thuế và Nghị định 126/2020/NĐ-CP",
        "doc_type": "THONG_TU",
        "legal_status": "Active",
        "effective_date": "2022-01-01",
        "domain": "TAX_ADMIN",
        "paragraphs": [
            {"id": "PARA_TT80_D12", "number": "Điều 12", "title": "Phân bổ nghĩa vụ thuế TNDN cho cơ sở sản xuất phụ thuộc"},
            {"id": "PARA_TT80_D13", "number": "Điều 13", "title": "Kê khai và hoàn thuế GTGT"},
        ],
    },
]

# Tầng 3: Atomic Learning Objects (Atomic LOs) Catalog
ATOMIC_LOS = [
    {
        "id": "LO_VAT_INPUT_DEDUCTION_CONDITIONS",
        "title": "Điều kiện khấu trừ thuế GTGT đầu vào",
        "tax_type": "VAT",
        "cpa_syllabus_ref": "CPA_TAX_VAT_LO1",
        "formula": "VAT_Deductible = VAT_Input if (Has_EInvoice and NonCash_Payment_Over_20M) else 0",
        "based_on_para": "PARA_L48_D13",
    },
    {
        "id": "LO_VAT_ZERO_PERCENT_EXPORT",
        "title": "Điều kiện áp dụng thuế suất GTGT 0% đối với hàng hóa, dịch vụ xuất khẩu",
        "tax_type": "VAT",
        "cpa_syllabus_ref": "CPA_TAX_VAT_LO2",
        "formula": "VAT_Rate = 0% if (Has_Contract and Has_Customs_Declaration and NonCash_Bank_Payment) else 10%",
        "based_on_para": "PARA_L48_D9",
    },
    {
        "id": "LO_CIT_DEDUCTIBLE_EXPENSE_RULE",
        "title": "3 Điều kiện chi phí được trừ khi xác định thu nhập chịu thuế TNDN",
        "tax_type": "CIT",
        "cpa_syllabus_ref": "CPA_TAX_CIT_LO1",
        "formula": "Is_Deductible = Actual_Business_Expense and Has_Valid_Invoice and NonCash_Payment_Over_20M",
        "based_on_para": "PARA_L67_D9",
    },
    {
        "id": "LO_CIT_INTEREST_LIMIT_RELATED_PARTY",
        "title": "Khống chế chi phí lãi vay giao dịch liên kết (Trần 30% EBITDA)",
        "tax_type": "CIT",
        "cpa_syllabus_ref": "CPA_TAX_TP_LO1",
        "formula": "Max_Deductible_Net_Interest = 30% * (Net_Operating_Profit + Depreciation + Amortization)",
        "based_on_para": "PARA_ND132_D16",
    },
    {
        "id": "LO_TAX_ADMIN_INVOICE_TIMING_PENALTY",
        "title": "Xử phạt hành vi lập hóa đơn sai thời điểm",
        "tax_type": "TAX_ADMIN",
        "cpa_syllabus_ref": "CPA_TAX_ADMIN_LO1",
        "formula": "Penalty_Amount = Fixed_Penalty_Schedule(Invoice_Delay_Days)",
        "based_on_para": "PARA_ND310_D24",
    },
]


def generate_base_regulatory_cypher() -> str:
    """Generate Cypher query string for Step 1 Base Regulatory Nodes and Atomic LOs."""
    statements = [
        "// ===============================================================================",
        "// STEP 1: BASE REGULATORY LAYER (LUẬT, NGHỊ ĐỊNH, THÔNG TƯ) & ATOMIC LOS",
        "// ===============================================================================",
    ]

    # Create LegalDoc & LegalParagraph
    for doc in BASE_REGULATIONS:
        stmt = f"""MERGE (doc_{doc['id']}:LegalDoc {{id: '{doc['id']}'}})
ON CREATE SET 
    doc_{doc['id']}.doc_number = '{doc['doc_number']}',
    doc_{doc['id']}.title = '{doc['title']}',
    doc_{doc['id']}.doc_type = '{doc['doc_type']}',
    doc_{doc['id']}.legal_status = '{doc['legal_status']}',
    doc_{doc['id']}.effective_date = '{doc['effective_date']}',
    doc_{doc['id']}.domain = '{doc['domain']}';"""
        statements.append(stmt)

        # Process paragraphs
        for p in doc["paragraphs"]:
            safe_title = p['title'].replace("'", "\\'")
            p_stmt = f"""MERGE (p_{p['id']}:LegalParagraph {{id: '{p['id']}'}})
ON CREATE SET 
    p_{p['id']}.number = '{p['number']}',
    p_{p['id']}.title = '{safe_title}';
MERGE (doc_{doc['id']})-[:CONTAINS_PARAGRAPH]->(p_{p['id']});"""
            statements.append(p_stmt)

        # Supersedes edge
        for sup_id in doc.get("supersedes", []):
            statements.append(f"MERGE (old_doc_{sup_id}:LegalDoc {{id: '{sup_id}'}})")
            statements.append(f"MERGE (doc_{doc['id']})-[:SUPERSEDES]->(old_doc_{sup_id});")

        # Guides edge
        for g_id in doc.get("guides", []):
            statements.append(f"MERGE (g_doc_{g_id}:LegalDoc {{id: '{g_id}'}})")
            statements.append(f"MERGE (doc_{doc['id']})-[:GUIDES]->(g_doc_{g_id});")

    # Create Atomic LOs
    for lo in ATOMIC_LOS:
        safe_title = lo['title'].replace("'", "\\'")
        safe_formula = lo['formula'].replace("'", "\\'")
        lo_stmt = f"""MERGE (lo_{lo['id']}:Atomic_LO {{id: '{lo['id']}'}})
ON CREATE SET 
    lo_{lo['id']}.title = '{safe_title}',
    lo_{lo['id']}.tax_type = '{lo['tax_type']}',
    lo_{lo['id']}.cpa_syllabus_ref = '{lo['cpa_syllabus_ref']}',
    lo_{lo['id']}.formula = '{safe_formula}';
MERGE (p_{lo['based_on_para']}:LegalParagraph {{id: '{lo['based_on_para']}'}})
MERGE (lo_{lo['id']})-[:BASED_ON]->(p_{lo['based_on_para']});"""
        statements.append(lo_stmt)

    return "\n\n".join(statements)
