"""Step 3: Cross-Module Bridge Mapping Module (VAS & VSA Accounting Bridge).

Links Tax Atomic_LO nodes to Canonical Business Events and Chart of Accounts (TK 112, 133, 211, 214, 333, 511, 635, 642).
Edges: [:MAPS_TO_EVENT], [:MAPS_TO_ACCOUNT].
"""

import logging

logger = logging.getLogger(__name__)

# Canonical Business Events and Account Mappings
CROSS_MODULE_BRIDGES = [
    {
        "lo_id": "LO_VAT_INPUT_DEDUCTION_CONDITIONS",
        "event_code": "EVENT_BUY_GOODS_SERVICES",
        "event_name": "Mua hàng hóa dịch vụ đầu vào",
        "account_code": "TK_1331",
        "account_name": "Thuế GTGT được khấu trừ của hàng hóa, dịch vụ",
    },
    {
        "lo_id": "LO_VAT_ZERO_PERCENT_EXPORT",
        "event_code": "EVENT_EXPORT_GOODS",
        "event_name": "Xuất khẩu hàng hóa dịch vụ",
        "account_code": "TK_511",
        "account_name": "Doanh thu bán hàng và cung cấp dịch vụ",
    },
    {
        "lo_id": "LO_CIT_DEDUCTIBLE_EXPENSE_RULE",
        "event_code": "EVENT_PAY_OPERATING_EXPENSE",
        "event_name": "Chi trả chi phí hoạt động kinh doanh",
        "account_code": "TK_642",
        "account_name": "Chi phí quản lý doanh nghiệp",
    },
    {
        "lo_id": "LO_CIT_INTEREST_LIMIT_RELATED_PARTY",
        "event_code": "EVENT_PAY_INTEREST_EXPENSE",
        "event_name": "Chi trả chi phí lãi vay giao dịch liên kết",
        "account_code": "TK_635",
        "account_name": "Chi phí tài chính",
    },
    {
        "lo_id": "LO_TAX_ADMIN_INVOICE_TIMING_PENALTY",
        "event_code": "EVENT_ISSUING_E_INVOICE",
        "event_name": "Lập hóa đơn điện tử",
        "account_code": "TK_3331",
        "account_name": "Thuế GTGT phải nộp",
    },
]


def generate_bridge_mapping_cypher() -> str:
    """Generate Cypher query string for Step 3 Cross-Module Bridges."""
    statements = [
        "// ===============================================================================",
        "// STEP 3: CROSS-MODULE BRIDGE MAPPING (CANONICAL EVENTS & ACCOUNTING CONCEPTS)",
        "// ===============================================================================",
    ]

    for item in CROSS_MODULE_BRIDGES:
        stmt = f"""// Bridge: {item['lo_id']} -> {item['event_code']} -> {item['account_code']}
MERGE (lo_{item['lo_id']}:Atomic_LO {{id: '{item['lo_id']}'}})
MERGE (evt_{item['event_code']}:BusinessEvent {{event_code: '{item['event_code']}'}})
ON CREATE SET evt_{item['event_code']}.event_name = '{item['event_name']}';

MERGE (acc_{item['account_code']}:AccountCode {{account_code: '{item['account_code']}'}})
ON CREATE SET acc_{item['account_code']}.account_name = '{item['account_name']}';

MERGE (lo_{item['lo_id']})-[:MAPS_TO_EVENT]->(evt_{item['event_code']})
MERGE (lo_{item['lo_id']})-[:MAPS_TO_ACCOUNT]->(acc_{item['account_code']})
MERGE (evt_{item['event_code']})-[:MAPS_TO_ACCOUNT]->(acc_{item['account_code']});"""
        statements.append(stmt)

    return "\n\n".join(statements)
