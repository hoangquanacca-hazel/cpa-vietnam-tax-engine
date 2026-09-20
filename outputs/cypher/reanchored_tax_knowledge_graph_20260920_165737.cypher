// RE-ANCHORED TAX KNOWLEDGE GRAPH BATCH - 20260920_165737

// ===============================================================================

// STEP 1: BASE REGULATORY LAYER (LUẬT, NGHỊ ĐỊNH, THÔNG TƯ) & ATOMIC LOS

// ===============================================================================

MERGE (doc_DOC_LUAT_48_2024_QH15:LegalDoc {id: 'DOC_LUAT_48_2024_QH15'})
ON CREATE SET 
    doc_DOC_LUAT_48_2024_QH15.doc_number = 'Luật số 48/2024/QH15',
    doc_DOC_LUAT_48_2024_QH15.title = 'Luật Thuế Giá trị gia tăng 2024',
    doc_DOC_LUAT_48_2024_QH15.doc_type = 'LUAT',
    doc_DOC_LUAT_48_2024_QH15.legal_status = 'Active',
    doc_DOC_LUAT_48_2024_QH15.effective_date = '2025-07-01',
    doc_DOC_LUAT_48_2024_QH15.domain = 'VAT';

MERGE (p_PARA_L48_D5:LegalParagraph {id: 'PARA_L48_D5'})
ON CREATE SET 
    p_PARA_L48_D5.number = 'Điều 5',
    p_PARA_L48_D5.title = 'Đối tượng không chịu thuế GTGT';
MERGE (doc_DOC_LUAT_48_2024_QH15)-[:CONTAINS_PARAGRAPH]->(p_PARA_L48_D5);

MERGE (p_PARA_L48_D9:LegalParagraph {id: 'PARA_L48_D9'})
ON CREATE SET 
    p_PARA_L48_D9.number = 'Điều 9',
    p_PARA_L48_D9.title = 'Thuế suất 0%';
MERGE (doc_DOC_LUAT_48_2024_QH15)-[:CONTAINS_PARAGRAPH]->(p_PARA_L48_D9);

MERGE (p_PARA_L48_D11:LegalParagraph {id: 'PARA_L48_D11'})
ON CREATE SET 
    p_PARA_L48_D11.number = 'Điều 11',
    p_PARA_L48_D11.title = 'Thuế suất 10%';
MERGE (doc_DOC_LUAT_48_2024_QH15)-[:CONTAINS_PARAGRAPH]->(p_PARA_L48_D11);

MERGE (p_PARA_L48_D13:LegalParagraph {id: 'PARA_L48_D13'})
ON CREATE SET 
    p_PARA_L48_D13.number = 'Điều 13',
    p_PARA_L48_D13.title = 'Điều kiện khấu trừ thuế GTGT đầu vào';
MERGE (doc_DOC_LUAT_48_2024_QH15)-[:CONTAINS_PARAGRAPH]->(p_PARA_L48_D13);

MERGE (p_PARA_L48_D14:LegalParagraph {id: 'PARA_L48_D14'})
ON CREATE SET 
    p_PARA_L48_D14.number = 'Điều 14',
    p_PARA_L48_D14.title = 'Hoàn thuế GTGT';
MERGE (doc_DOC_LUAT_48_2024_QH15)-[:CONTAINS_PARAGRAPH]->(p_PARA_L48_D14);

MERGE (old_doc_DOC_LUAT_13_2008_QH12:LegalDoc {id: 'DOC_LUAT_13_2008_QH12'})

MERGE (doc_DOC_LUAT_48_2024_QH15)-[:SUPERSEDES]->(old_doc_DOC_LUAT_13_2008_QH12);

MERGE (doc_DOC_ND_181_2025_NDCP:LegalDoc {id: 'DOC_ND_181_2025_NDCP'})
ON CREATE SET 
    doc_DOC_ND_181_2025_NDCP.doc_number = 'Nghị định số 181/2025/NĐ-CP',
    doc_DOC_ND_181_2025_NDCP.title = 'Nghị định hướng dẫn chi tiết Luật Thuế GTGT',
    doc_DOC_ND_181_2025_NDCP.doc_type = 'NGHI_DINH',
    doc_DOC_ND_181_2025_NDCP.legal_status = 'Active',
    doc_DOC_ND_181_2025_NDCP.effective_date = '2025-07-01',
    doc_DOC_ND_181_2025_NDCP.domain = 'VAT';

MERGE (p_PARA_ND181_D9:LegalParagraph {id: 'PARA_ND181_D9'})
ON CREATE SET 
    p_PARA_ND181_D9.number = 'Điều 9',
    p_PARA_ND181_D9.title = 'Khấu trừ thuế GTGT đầu vào cho hàng hóa xuất khẩu';
MERGE (doc_DOC_ND_181_2025_NDCP)-[:CONTAINS_PARAGRAPH]->(p_PARA_ND181_D9);

MERGE (p_PARA_ND181_D12:LegalParagraph {id: 'PARA_ND181_D12'})
ON CREATE SET 
    p_PARA_ND181_D12.number = 'Điều 12',
    p_PARA_ND181_D12.title = 'Chứng từ thanh toán không dùng tiền mặt';
MERGE (doc_DOC_ND_181_2025_NDCP)-[:CONTAINS_PARAGRAPH]->(p_PARA_ND181_D12);

MERGE (g_doc_DOC_LUAT_48_2024_QH15:LegalDoc {id: 'DOC_LUAT_48_2024_QH15'})

MERGE (doc_DOC_ND_181_2025_NDCP)-[:GUIDES]->(g_doc_DOC_LUAT_48_2024_QH15);

MERGE (doc_DOC_TT_69_2025_TTBTC:LegalDoc {id: 'DOC_TT_69_2025_TTBTC'})
ON CREATE SET 
    doc_DOC_TT_69_2025_TTBTC.doc_number = 'Thông tư số 69/2025/TT-BTC',
    doc_DOC_TT_69_2025_TTBTC.title = 'Thông tư hướng dẫn thi hành Nghị định 181/2025/NĐ-CP về Thuế GTGT',
    doc_DOC_TT_69_2025_TTBTC.doc_type = 'THONG_TU',
    doc_DOC_TT_69_2025_TTBTC.legal_status = 'Active',
    doc_DOC_TT_69_2025_TTBTC.effective_date = '2025-07-01',
    doc_DOC_TT_69_2025_TTBTC.domain = 'VAT';

MERGE (p_PARA_TT69_D14:LegalParagraph {id: 'PARA_TT69_D14'})
ON CREATE SET 
    p_PARA_TT69_D14.number = 'Điều 14',
    p_PARA_TT69_D14.title = 'Nguyên tắc khấu trừ thuế GTGT đầu vào';
MERGE (doc_DOC_TT_69_2025_TTBTC)-[:CONTAINS_PARAGRAPH]->(p_PARA_TT69_D14);

MERGE (p_PARA_TT69_D15:LegalParagraph {id: 'PARA_TT69_D15'})
ON CREATE SET 
    p_PARA_TT69_D15.number = 'Điều 15',
    p_PARA_TT69_D15.title = 'Điều kiện khấu trừ thuế GTGT đầu vào';
MERGE (doc_DOC_TT_69_2025_TTBTC)-[:CONTAINS_PARAGRAPH]->(p_PARA_TT69_D15);

MERGE (g_doc_DOC_ND_181_2025_NDCP:LegalDoc {id: 'DOC_ND_181_2025_NDCP'})

MERGE (doc_DOC_TT_69_2025_TTBTC)-[:GUIDES]->(g_doc_DOC_ND_181_2025_NDCP);

MERGE (doc_DOC_LUAT_67_2025_QH15:LegalDoc {id: 'DOC_LUAT_67_2025_QH15'})
ON CREATE SET 
    doc_DOC_LUAT_67_2025_QH15.doc_number = 'Luật số 67/2025/QH15',
    doc_DOC_LUAT_67_2025_QH15.title = 'Luật Thuế Thu nhập doanh nghiệp 2025',
    doc_DOC_LUAT_67_2025_QH15.doc_type = 'LUAT',
    doc_DOC_LUAT_67_2025_QH15.legal_status = 'Active',
    doc_DOC_LUAT_67_2025_QH15.effective_date = '2026-01-01',
    doc_DOC_LUAT_67_2025_QH15.domain = 'CIT';

MERGE (p_PARA_L67_D9:LegalParagraph {id: 'PARA_L67_D9'})
ON CREATE SET 
    p_PARA_L67_D9.number = 'Điều 9',
    p_PARA_L67_D9.title = 'Các khoản chi được trừ và không được trừ khi xác định thu nhập chịu thuế TNDN';
MERGE (doc_DOC_LUAT_67_2025_QH15)-[:CONTAINS_PARAGRAPH]->(p_PARA_L67_D9);

MERGE (p_PARA_L67_D10:LegalParagraph {id: 'PARA_L67_D10'})
ON CREATE SET 
    p_PARA_L67_D10.number = 'Điều 10',
    p_PARA_L67_D10.title = 'Thuế suất thuế TNDN';
MERGE (doc_DOC_LUAT_67_2025_QH15)-[:CONTAINS_PARAGRAPH]->(p_PARA_L67_D10);

MERGE (p_PARA_L67_D13:LegalParagraph {id: 'PARA_L67_D13'})
ON CREATE SET 
    p_PARA_L67_D13.number = 'Điều 13',
    p_PARA_L67_D13.title = 'Ưu đãi thuế TNDN';
MERGE (doc_DOC_LUAT_67_2025_QH15)-[:CONTAINS_PARAGRAPH]->(p_PARA_L67_D13);

MERGE (old_doc_DOC_LUAT_14_2008_QH12:LegalDoc {id: 'DOC_LUAT_14_2008_QH12'})

MERGE (doc_DOC_LUAT_67_2025_QH15)-[:SUPERSEDES]->(old_doc_DOC_LUAT_14_2008_QH12);

MERGE (doc_DOC_ND_320_2025_NDCP:LegalDoc {id: 'DOC_ND_320_2025_NDCP'})
ON CREATE SET 
    doc_DOC_ND_320_2025_NDCP.doc_number = 'Nghị định số 320/2025/NĐ-CP',
    doc_DOC_ND_320_2025_NDCP.title = 'Nghị định hướng dẫn thi hành Luật Thuế TNDN',
    doc_DOC_ND_320_2025_NDCP.doc_type = 'NGHI_DINH',
    doc_DOC_ND_320_2025_NDCP.legal_status = 'Active',
    doc_DOC_ND_320_2025_NDCP.effective_date = '2026-01-01',
    doc_DOC_ND_320_2025_NDCP.domain = 'CIT';

MERGE (p_PARA_ND320_D4:LegalParagraph {id: 'PARA_ND320_D4'})
ON CREATE SET 
    p_PARA_ND320_D4.number = 'Điều 4',
    p_PARA_ND320_D4.title = 'Chi phí được trừ khi tính thuế TNDN';
MERGE (doc_DOC_ND_320_2025_NDCP)-[:CONTAINS_PARAGRAPH]->(p_PARA_ND320_D4);

MERGE (p_PARA_ND320_D9:LegalParagraph {id: 'PARA_ND320_D9'})
ON CREATE SET 
    p_PARA_ND320_D9.number = 'Điều 9',
    p_PARA_ND320_D9.title = 'Chi phí trích lập dự phòng';
MERGE (doc_DOC_ND_320_2025_NDCP)-[:CONTAINS_PARAGRAPH]->(p_PARA_ND320_D9);

MERGE (g_doc_DOC_LUAT_67_2025_QH15:LegalDoc {id: 'DOC_LUAT_67_2025_QH15'})

MERGE (doc_DOC_ND_320_2025_NDCP)-[:GUIDES]->(g_doc_DOC_LUAT_67_2025_QH15);

MERGE (doc_DOC_ND_132_2020_NDCP:LegalDoc {id: 'DOC_ND_132_2020_NDCP'})
ON CREATE SET 
    doc_DOC_ND_132_2020_NDCP.doc_number = 'Nghị định số 132/2020/NĐ-CP',
    doc_DOC_ND_132_2020_NDCP.title = 'Nghị định quy định về quản lý thuế đối với doanh nghiệp có giao dịch liên kết',
    doc_DOC_ND_132_2020_NDCP.doc_type = 'NGHI_DINH',
    doc_DOC_ND_132_2020_NDCP.legal_status = 'Active',
    doc_DOC_ND_132_2020_NDCP.effective_date = '2020-12-20',
    doc_DOC_ND_132_2020_NDCP.domain = 'TRANSFER_PRICING';

MERGE (p_PARA_ND132_D16:LegalParagraph {id: 'PARA_ND132_D16'})
ON CREATE SET 
    p_PARA_ND132_D16.number = 'Điều 16',
    p_PARA_ND132_D16.title = 'Xác định chi phí được trừ khi tính thuế TNDN đối với doanh nghiệp có giao dịch liên kết (Khống chế lãi vay 30% EBITDA)';
MERGE (doc_DOC_ND_132_2020_NDCP)-[:CONTAINS_PARAGRAPH]->(p_PARA_ND132_D16);

MERGE (doc_DOC_LUAT_38_2019_QH14:LegalDoc {id: 'DOC_LUAT_38_2019_QH14'})
ON CREATE SET 
    doc_DOC_LUAT_38_2019_QH14.doc_number = 'Luật số 38/2019/QH14',
    doc_DOC_LUAT_38_2019_QH14.title = 'Luật Quản lý Thuế 2019',
    doc_DOC_LUAT_38_2019_QH14.doc_type = 'LUAT',
    doc_DOC_LUAT_38_2019_QH14.legal_status = 'Active',
    doc_DOC_LUAT_38_2019_QH14.effective_date = '2020-07-01',
    doc_DOC_LUAT_38_2019_QH14.domain = 'TAX_ADMIN';

MERGE (p_PARA_L38_D42:LegalParagraph {id: 'PARA_L38_D42'})
ON CREATE SET 
    p_PARA_L38_D42.number = 'Điều 42',
    p_PARA_L38_D42.title = 'Kê khai thuế';
MERGE (doc_DOC_LUAT_38_2019_QH14)-[:CONTAINS_PARAGRAPH]->(p_PARA_L38_D42);

MERGE (p_PARA_L38_D44:LegalParagraph {id: 'PARA_L38_D44'})
ON CREATE SET 
    p_PARA_L38_D44.number = 'Điều 44',
    p_PARA_L38_D44.title = 'Thời hạn nộp hồ sơ khai thuế';
MERGE (doc_DOC_LUAT_38_2019_QH14)-[:CONTAINS_PARAGRAPH]->(p_PARA_L38_D44);

MERGE (p_PARA_L38_D59:LegalParagraph {id: 'PARA_L38_D59'})
ON CREATE SET 
    p_PARA_L38_D59.number = 'Điều 59',
    p_PARA_L38_D59.title = 'Xử lý tiền chậm nộp tiền thuế';
MERGE (doc_DOC_LUAT_38_2019_QH14)-[:CONTAINS_PARAGRAPH]->(p_PARA_L38_D59);

MERGE (doc_DOC_ND_310_2025_NDCP:LegalDoc {id: 'DOC_ND_310_2025_NDCP'})
ON CREATE SET 
    doc_DOC_ND_310_2025_NDCP.doc_number = 'Nghị định số 310/2025/NĐ-CP',
    doc_DOC_ND_310_2025_NDCP.title = 'Nghị định xử phạt vi phạm hành chính về thuế, hóa đơn',
    doc_DOC_ND_310_2025_NDCP.doc_type = 'NGHI_DINH',
    doc_DOC_ND_310_2025_NDCP.legal_status = 'Active',
    doc_DOC_ND_310_2025_NDCP.effective_date = '2025-01-01',
    doc_DOC_ND_310_2025_NDCP.domain = 'TAX_ADMIN';

MERGE (p_PARA_ND310_D16:LegalParagraph {id: 'PARA_ND310_D16'})
ON CREATE SET 
    p_PARA_ND310_D16.number = 'Điều 16',
    p_PARA_ND310_D16.title = 'Xử phạt hành vi khai sai dẫn đến thiếu số tiền thuế phải nộp';
MERGE (doc_DOC_ND_310_2025_NDCP)-[:CONTAINS_PARAGRAPH]->(p_PARA_ND310_D16);

MERGE (p_PARA_ND310_D17:LegalParagraph {id: 'PARA_ND310_D17'})
ON CREATE SET 
    p_PARA_ND310_D17.number = 'Điều 17',
    p_PARA_ND310_D17.title = 'Xử phạt hành vi trốn thuế';
MERGE (doc_DOC_ND_310_2025_NDCP)-[:CONTAINS_PARAGRAPH]->(p_PARA_ND310_D17);

MERGE (p_PARA_ND310_D24:LegalParagraph {id: 'PARA_ND310_D24'})
ON CREATE SET 
    p_PARA_ND310_D24.number = 'Điều 24',
    p_PARA_ND310_D24.title = 'Xử phạt hành vi vi phạm quy định về lập hóa đơn';
MERGE (doc_DOC_ND_310_2025_NDCP)-[:CONTAINS_PARAGRAPH]->(p_PARA_ND310_D24);

MERGE (old_doc_DOC_ND_125_2020_NDCP:LegalDoc {id: 'DOC_ND_125_2020_NDCP'})

MERGE (doc_DOC_ND_310_2025_NDCP)-[:SUPERSEDES]->(old_doc_DOC_ND_125_2020_NDCP);

MERGE (doc_DOC_TT_80_2021_TTBTC:LegalDoc {id: 'DOC_TT_80_2021_TTBTC'})
ON CREATE SET 
    doc_DOC_TT_80_2021_TTBTC.doc_number = 'Thông tư số 80/2021/TT-BTC',
    doc_DOC_TT_80_2021_TTBTC.title = 'Thông tư hướng dẫn Luật Quản lý thuế và Nghị định 126/2020/NĐ-CP',
    doc_DOC_TT_80_2021_TTBTC.doc_type = 'THONG_TU',
    doc_DOC_TT_80_2021_TTBTC.legal_status = 'Active',
    doc_DOC_TT_80_2021_TTBTC.effective_date = '2022-01-01',
    doc_DOC_TT_80_2021_TTBTC.domain = 'TAX_ADMIN';

MERGE (p_PARA_TT80_D12:LegalParagraph {id: 'PARA_TT80_D12'})
ON CREATE SET 
    p_PARA_TT80_D12.number = 'Điều 12',
    p_PARA_TT80_D12.title = 'Phân bổ nghĩa vụ thuế TNDN cho cơ sở sản xuất phụ thuộc';
MERGE (doc_DOC_TT_80_2021_TTBTC)-[:CONTAINS_PARAGRAPH]->(p_PARA_TT80_D12);

MERGE (p_PARA_TT80_D13:LegalParagraph {id: 'PARA_TT80_D13'})
ON CREATE SET 
    p_PARA_TT80_D13.number = 'Điều 13',
    p_PARA_TT80_D13.title = 'Kê khai và hoàn thuế GTGT';
MERGE (doc_DOC_TT_80_2021_TTBTC)-[:CONTAINS_PARAGRAPH]->(p_PARA_TT80_D13);

MERGE (lo_LO_VAT_INPUT_DEDUCTION_CONDITIONS:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
ON CREATE SET 
    lo_LO_VAT_INPUT_DEDUCTION_CONDITIONS.title = 'Điều kiện khấu trừ thuế GTGT đầu vào',
    lo_LO_VAT_INPUT_DEDUCTION_CONDITIONS.tax_type = 'VAT',
    lo_LO_VAT_INPUT_DEDUCTION_CONDITIONS.cpa_syllabus_ref = 'CPA_TAX_VAT_LO1',
    lo_LO_VAT_INPUT_DEDUCTION_CONDITIONS.formula = 'VAT_Deductible = VAT_Input if (Has_EInvoice and NonCash_Payment_Over_20M) else 0';
MERGE (p_PARA_L48_D13:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_LO_VAT_INPUT_DEDUCTION_CONDITIONS)-[:BASED_ON]->(p_PARA_L48_D13);

MERGE (lo_LO_VAT_ZERO_PERCENT_EXPORT:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
ON CREATE SET 
    lo_LO_VAT_ZERO_PERCENT_EXPORT.title = 'Điều kiện áp dụng thuế suất GTGT 0% đối với hàng hóa, dịch vụ xuất khẩu',
    lo_LO_VAT_ZERO_PERCENT_EXPORT.tax_type = 'VAT',
    lo_LO_VAT_ZERO_PERCENT_EXPORT.cpa_syllabus_ref = 'CPA_TAX_VAT_LO2',
    lo_LO_VAT_ZERO_PERCENT_EXPORT.formula = 'VAT_Rate = 0% if (Has_Contract and Has_Customs_Declaration and NonCash_Bank_Payment) else 10%';
MERGE (p_PARA_L48_D9:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_LO_VAT_ZERO_PERCENT_EXPORT)-[:BASED_ON]->(p_PARA_L48_D9);

MERGE (lo_LO_CIT_DEDUCTIBLE_EXPENSE_RULE:Atomic_LO {id: 'LO_CIT_DEDUCTIBLE_EXPENSE_RULE'})
ON CREATE SET 
    lo_LO_CIT_DEDUCTIBLE_EXPENSE_RULE.title = '3 Điều kiện chi phí được trừ khi xác định thu nhập chịu thuế TNDN',
    lo_LO_CIT_DEDUCTIBLE_EXPENSE_RULE.tax_type = 'CIT',
    lo_LO_CIT_DEDUCTIBLE_EXPENSE_RULE.cpa_syllabus_ref = 'CPA_TAX_CIT_LO1',
    lo_LO_CIT_DEDUCTIBLE_EXPENSE_RULE.formula = 'Is_Deductible = Actual_Business_Expense and Has_Valid_Invoice and NonCash_Payment_Over_20M';
MERGE (p_PARA_L67_D9:LegalParagraph {id: 'PARA_L67_D9'})
MERGE (lo_LO_CIT_DEDUCTIBLE_EXPENSE_RULE)-[:BASED_ON]->(p_PARA_L67_D9);

MERGE (lo_LO_CIT_INTEREST_LIMIT_RELATED_PARTY:Atomic_LO {id: 'LO_CIT_INTEREST_LIMIT_RELATED_PARTY'})
ON CREATE SET 
    lo_LO_CIT_INTEREST_LIMIT_RELATED_PARTY.title = 'Khống chế chi phí lãi vay giao dịch liên kết (Trần 30% EBITDA)',
    lo_LO_CIT_INTEREST_LIMIT_RELATED_PARTY.tax_type = 'CIT',
    lo_LO_CIT_INTEREST_LIMIT_RELATED_PARTY.cpa_syllabus_ref = 'CPA_TAX_TP_LO1',
    lo_LO_CIT_INTEREST_LIMIT_RELATED_PARTY.formula = 'Max_Deductible_Net_Interest = 30% * (Net_Operating_Profit + Depreciation + Amortization)';
MERGE (p_PARA_ND132_D16:LegalParagraph {id: 'PARA_ND132_D16'})
MERGE (lo_LO_CIT_INTEREST_LIMIT_RELATED_PARTY)-[:BASED_ON]->(p_PARA_ND132_D16);

MERGE (lo_LO_TAX_ADMIN_INVOICE_TIMING_PENALTY:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
ON CREATE SET 
    lo_LO_TAX_ADMIN_INVOICE_TIMING_PENALTY.title = 'Xử phạt hành vi lập hóa đơn sai thời điểm',
    lo_LO_TAX_ADMIN_INVOICE_TIMING_PENALTY.tax_type = 'TAX_ADMIN',
    lo_LO_TAX_ADMIN_INVOICE_TIMING_PENALTY.cpa_syllabus_ref = 'CPA_TAX_ADMIN_LO1',
    lo_LO_TAX_ADMIN_INVOICE_TIMING_PENALTY.formula = 'Penalty_Amount = Fixed_Penalty_Schedule(Invoice_Delay_Days)';
MERGE (p_PARA_ND310_D24:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_LO_TAX_ADMIN_INVOICE_TIMING_PENALTY)-[:BASED_ON]->(p_PARA_ND310_D24);

// ===============================================================================

// STEP 2: RE-ANCHORING PIPELINE (LINKING DISPATCHES & Q&A TO LEGAL PARAGRAPHS & LOS)

// ===============================================================================

// Re-anchor Dispatch: 001_565_CT-CS
MERGE (disp_1:OfficialLetter {id: '001_565_CT-CS'})
MERGE (p_disp_1:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_1:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_1)-[:INTERPRETS]->(p_disp_1)
MERGE (disp_1)-[:APPLIES_TO]->(lo_disp_1);

// Re-anchor Dispatch: 002_2025_NĐ-CP
MERGE (disp_2:OfficialLetter {id: '002_2025_NĐ-CP'})
MERGE (p_disp_2:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_2:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_2)-[:INTERPRETS]->(p_disp_2)
MERGE (disp_2)-[:APPLIES_TO]->(lo_disp_2);

// Re-anchor Dispatch: 002_820_CST-TN
MERGE (disp_3:OfficialLetter {id: '002_820_CST-TN'})
MERGE (p_disp_3:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_3:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_3)-[:INTERPRETS]->(p_disp_3)
MERGE (disp_3)-[:APPLIES_TO]->(lo_disp_3);

// Re-anchor Dispatch: 003_2014_TT-BTC
MERGE (disp_4:OfficialLetter {id: '003_2014_TT-BTC'})
MERGE (p_disp_4:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_4:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_4)-[:INTERPRETS]->(p_disp_4)
MERGE (disp_4)-[:APPLIES_TO]->(lo_disp_4);

// Re-anchor Dispatch: 003_2055_NĐ-CP
MERGE (disp_5:OfficialLetter {id: '003_2055_NĐ-CP'})
MERGE (p_disp_5:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_5:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_5)-[:INTERPRETS]->(p_disp_5)
MERGE (disp_5)-[:APPLIES_TO]->(lo_disp_5);

// Re-anchor Dispatch: 004_001_CV-JV
MERGE (disp_6:OfficialLetter {id: '004_001_CV-JV'})
MERGE (p_disp_6:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_6:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_6)-[:INTERPRETS]->(p_disp_6)
MERGE (disp_6)-[:APPLIES_TO]->(lo_disp_6);

// Re-anchor Dispatch: 004_2015_NĐ-CP
MERGE (disp_7:OfficialLetter {id: '004_2015_NĐ-CP'})
MERGE (p_disp_7:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_7:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_7)-[:INTERPRETS]->(p_disp_7)
MERGE (disp_7)-[:APPLIES_TO]->(lo_disp_7);

// Re-anchor Dispatch: 005_100_15072026_180455
MERGE (disp_8:OfficialLetter {id: '005_100_15072026_180455'})
MERGE (p_disp_8:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_8:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_8)-[:INTERPRETS]->(p_disp_8)
MERGE (disp_8)-[:APPLIES_TO]->(lo_disp_8);

// Re-anchor Dispatch: 005_2025_NĐ-CP
MERGE (disp_9:OfficialLetter {id: '005_2025_NĐ-CP'})
MERGE (p_disp_9:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_9:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_9)-[:INTERPRETS]->(p_disp_9)
MERGE (disp_9)-[:APPLIES_TO]->(lo_disp_9);

// Re-anchor Dispatch: 006_1011_QĐ-CT
MERGE (disp_10:OfficialLetter {id: '006_1011_QĐ-CT'})
MERGE (p_disp_10:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_10:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_10)-[:INTERPRETS]->(p_disp_10)
MERGE (disp_10)-[:APPLIES_TO]->(lo_disp_10);

// Re-anchor Dispatch: 007_2025_NĐ-CP
MERGE (disp_11:OfficialLetter {id: '007_2025_NĐ-CP'})
MERGE (p_disp_11:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_11:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_11)-[:INTERPRETS]->(p_disp_11)
MERGE (disp_11)-[:APPLIES_TO]->(lo_disp_11);

// Re-anchor Dispatch: 007_2025_QHL
MERGE (disp_12:OfficialLetter {id: '007_2025_QHL'})
MERGE (p_disp_12:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_12:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_12)-[:INTERPRETS]->(p_disp_12)
MERGE (disp_12)-[:APPLIES_TO]->(lo_disp_12);

// Re-anchor Dispatch: 008_2025_NĐ-CP
MERGE (disp_13:OfficialLetter {id: '008_2025_NĐ-CP'})
MERGE (p_disp_13:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_13:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_13)-[:INTERPRETS]->(p_disp_13)
MERGE (disp_13)-[:APPLIES_TO]->(lo_disp_13);

// Re-anchor Dispatch: 008_2026_ND
MERGE (disp_14:OfficialLetter {id: '008_2026_ND'})
MERGE (p_disp_14:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_14:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_14)-[:INTERPRETS]->(p_disp_14)
MERGE (disp_14)-[:APPLIES_TO]->(lo_disp_14);

// Re-anchor Dispatch: 009_105_22072026_141340
MERGE (disp_15:OfficialLetter {id: '009_105_22072026_141340'})
MERGE (p_disp_15:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_15:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_15)-[:INTERPRETS]->(p_disp_15)
MERGE (disp_15)-[:APPLIES_TO]->(lo_disp_15);

// Re-anchor Dispatch: 009_2025_NĐ-CP
MERGE (disp_16:OfficialLetter {id: '009_2025_NĐ-CP'})
MERGE (p_disp_16:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_16:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_16)-[:INTERPRETS]->(p_disp_16)
MERGE (disp_16)-[:APPLIES_TO]->(lo_disp_16);

// Re-anchor Dispatch: 010_106_23072026_143721
MERGE (disp_17:OfficialLetter {id: '010_106_23072026_143721'})
MERGE (p_disp_17:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_17:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_17)-[:INTERPRETS]->(p_disp_17)
MERGE (disp_17)-[:APPLIES_TO]->(lo_disp_17);

// Re-anchor Dispatch: 010_2026_NĐ-CP
MERGE (disp_18:OfficialLetter {id: '010_2026_NĐ-CP'})
MERGE (p_disp_18:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_18:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_18)-[:INTERPRETS]->(p_disp_18)
MERGE (disp_18)-[:APPLIES_TO]->(lo_disp_18);

// Re-anchor Dispatch: 011_13_NQ-CP
MERGE (disp_19:OfficialLetter {id: '011_13_NQ-CP'})
MERGE (p_disp_19:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_19:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_19)-[:INTERPRETS]->(p_disp_19)
MERGE (disp_19)-[:APPLIES_TO]->(lo_disp_19);

// Re-anchor Dispatch: 011_2026_NĐ-CP
MERGE (disp_20:OfficialLetter {id: '011_2026_NĐ-CP'})
MERGE (p_disp_20:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_20:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_20)-[:INTERPRETS]->(p_disp_20)
MERGE (disp_20)-[:APPLIES_TO]->(lo_disp_20);

// Re-anchor Dispatch: 012_114_04082026_165956
MERGE (disp_21:OfficialLetter {id: '012_114_04082026_165956'})
MERGE (p_disp_21:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_21:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_21)-[:INTERPRETS]->(p_disp_21)
MERGE (disp_21)-[:APPLIES_TO]->(lo_disp_21);

// Re-anchor Dispatch: 012_2025_NĐ-CP
MERGE (disp_22:OfficialLetter {id: '012_2025_NĐ-CP'})
MERGE (p_disp_22:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_22:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_22)-[:INTERPRETS]->(p_disp_22)
MERGE (disp_22)-[:APPLIES_TO]->(lo_disp_22);

// Re-anchor Dispatch: 013_1200_QĐ-CT
MERGE (disp_23:OfficialLetter {id: '013_1200_QĐ-CT'})
MERGE (p_disp_23:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_23:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_23)-[:INTERPRETS]->(p_disp_23)
MERGE (disp_23)-[:APPLIES_TO]->(lo_disp_23);

// Re-anchor Dispatch: 014_1225_QĐ-CT
MERGE (disp_24:OfficialLetter {id: '014_1225_QĐ-CT'})
MERGE (p_disp_24:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_24:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_24)-[:INTERPRETS]->(p_disp_24)
MERGE (disp_24)-[:APPLIES_TO]->(lo_disp_24);

// Re-anchor Dispatch: 015_135_2026_TT-BTC
MERGE (disp_25:OfficialLetter {id: '015_135_2026_TT-BTC'})
MERGE (p_disp_25:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_25:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_25)-[:INTERPRETS]->(p_disp_25)
MERGE (disp_25)-[:APPLIES_TO]->(lo_disp_25);

// Re-anchor Dispatch: 016_136_2026_TT-BTC
MERGE (disp_26:OfficialLetter {id: '016_136_2026_TT-BTC'})
MERGE (p_disp_26:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_26:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_26)-[:INTERPRETS]->(p_disp_26)
MERGE (disp_26)-[:APPLIES_TO]->(lo_disp_26);

// Re-anchor Dispatch: 017_1173_QĐ-BTC
MERGE (disp_27:OfficialLetter {id: '017_1173_QĐ-BTC'})
MERGE (p_disp_27:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_27:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_27)-[:INTERPRETS]->(p_disp_27)
MERGE (disp_27)-[:APPLIES_TO]->(lo_disp_27);

// Re-anchor Dispatch: 017_2025_NĐ-CP
MERGE (disp_28:OfficialLetter {id: '017_2025_NĐ-CP'})
MERGE (p_disp_28:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_28:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_28)-[:INTERPRETS]->(p_disp_28)
MERGE (disp_28)-[:APPLIES_TO]->(lo_disp_28);

// Re-anchor Dispatch: 018_185_NQ-CP
MERGE (disp_29:OfficialLetter {id: '018_185_NQ-CP'})
MERGE (p_disp_29:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_29:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_29)-[:INTERPRETS]->(p_disp_29)
MERGE (disp_29)-[:APPLIES_TO]->(lo_disp_29);

// Re-anchor Dispatch: 019_20_2026_QH16
MERGE (disp_30:OfficialLetter {id: '019_20_2026_QH16'})
MERGE (p_disp_30:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_30:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_30)-[:INTERPRETS]->(p_disp_30)
MERGE (disp_30)-[:APPLIES_TO]->(lo_disp_30);

// Re-anchor Dispatch: 020_21_2026_QH16
MERGE (disp_31:OfficialLetter {id: '020_21_2026_QH16'})
MERGE (p_disp_31:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_31:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_31)-[:INTERPRETS]->(p_disp_31)
MERGE (disp_31)-[:APPLIES_TO]->(lo_disp_31);

// Re-anchor Dispatch: 021_281_2026_NĐ-CP
MERGE (disp_32:OfficialLetter {id: '021_281_2026_NĐ-CP'})
MERGE (p_disp_32:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_32:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_32)-[:INTERPRETS]->(p_disp_32)
MERGE (disp_32)-[:APPLIES_TO]->(lo_disp_32);

// Re-anchor Dispatch: 022_33_2026_VBHN-BTC
MERGE (disp_33:OfficialLetter {id: '022_33_2026_VBHN-BTC'})
MERGE (p_disp_33:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_33:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_33)-[:INTERPRETS]->(p_disp_33)
MERGE (disp_33)-[:APPLIES_TO]->(lo_disp_33);

// Re-anchor Dispatch: 023_356_2026_NĐ-CP
MERGE (disp_34:OfficialLetter {id: '023_356_2026_NĐ-CP'})
MERGE (p_disp_34:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_34:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_34)-[:INTERPRETS]->(p_disp_34)
MERGE (disp_34)-[:APPLIES_TO]->(lo_disp_34);

// Re-anchor Dispatch: 024_2026_NĐ-CP
MERGE (disp_35:OfficialLetter {id: '024_2026_NĐ-CP'})
MERGE (p_disp_35:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_35:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_35)-[:INTERPRETS]->(p_disp_35)
MERGE (disp_35)-[:APPLIES_TO]->(lo_disp_35);

// Re-anchor Dispatch: 024_6872_CT-QLNT
MERGE (disp_36:OfficialLetter {id: '024_6872_CT-QLNT'})
MERGE (p_disp_36:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_36:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_36)-[:INTERPRETS]->(p_disp_36)
MERGE (disp_36)-[:APPLIES_TO]->(lo_disp_36);

// Re-anchor Dispatch: 025_41_2026_QĐ-TTG
MERGE (disp_37:OfficialLetter {id: '025_41_2026_QĐ-TTG'})
MERGE (p_disp_37:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_37:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_37)-[:INTERPRETS]->(p_disp_37)
MERGE (disp_37)-[:APPLIES_TO]->(lo_disp_37);

// Re-anchor Dispatch: 026_4425_CT-CS
MERGE (disp_38:OfficialLetter {id: '026_4425_CT-CS'})
MERGE (p_disp_38:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_38:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_38)-[:INTERPRETS]->(p_disp_38)
MERGE (disp_38)-[:APPLIES_TO]->(lo_disp_38);

// Re-anchor Dispatch: 027_4554_CT-CS
MERGE (disp_39:OfficialLetter {id: '027_4554_CT-CS'})
MERGE (p_disp_39:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_39:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_39)-[:INTERPRETS]->(p_disp_39)
MERGE (disp_39)-[:APPLIES_TO]->(lo_disp_39);

// Re-anchor Dispatch: 028_4614_CT-NVT
MERGE (disp_40:OfficialLetter {id: '028_4614_CT-NVT'})
MERGE (p_disp_40:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_40:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_40)-[:INTERPRETS]->(p_disp_40)
MERGE (disp_40)-[:APPLIES_TO]->(lo_disp_40);

// Re-anchor Dispatch: 029_4623_CT-CS
MERGE (disp_41:OfficialLetter {id: '029_4623_CT-CS'})
MERGE (p_disp_41:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_41:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_41)-[:INTERPRETS]->(p_disp_41)
MERGE (disp_41)-[:APPLIES_TO]->(lo_disp_41);

// Re-anchor Dispatch: 030_4631_CT-CS
MERGE (disp_42:OfficialLetter {id: '030_4631_CT-CS'})
MERGE (p_disp_42:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_42:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_42)-[:INTERPRETS]->(p_disp_42)
MERGE (disp_42)-[:APPLIES_TO]->(lo_disp_42);

// Re-anchor Dispatch: 031_4637_CT-CS
MERGE (disp_43:OfficialLetter {id: '031_4637_CT-CS'})
MERGE (p_disp_43:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_43:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_43)-[:INTERPRETS]->(p_disp_43)
MERGE (disp_43)-[:APPLIES_TO]->(lo_disp_43);

// Re-anchor Dispatch: 032_4643_CT-CS
MERGE (disp_44:OfficialLetter {id: '032_4643_CT-CS'})
MERGE (p_disp_44:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_44:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_44)-[:INTERPRETS]->(p_disp_44)
MERGE (disp_44)-[:APPLIES_TO]->(lo_disp_44);

// Re-anchor Dispatch: 033_4644_CT-CS
MERGE (disp_45:OfficialLetter {id: '033_4644_CT-CS'})
MERGE (p_disp_45:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_45:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_45)-[:INTERPRETS]->(p_disp_45)
MERGE (disp_45)-[:APPLIES_TO]->(lo_disp_45);

// Re-anchor Dispatch: 034_4657_TCT-CS
MERGE (disp_46:OfficialLetter {id: '034_4657_TCT-CS'})
MERGE (p_disp_46:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_46:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_46)-[:INTERPRETS]->(p_disp_46)
MERGE (disp_46)-[:APPLIES_TO]->(lo_disp_46);

// Re-anchor Dispatch: 035_4671_CT-CS
MERGE (disp_47:OfficialLetter {id: '035_4671_CT-CS'})
MERGE (p_disp_47:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_47:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_47)-[:INTERPRETS]->(p_disp_47)
MERGE (disp_47)-[:APPLIES_TO]->(lo_disp_47);

// Re-anchor Dispatch: 036_4673_CT-CS
MERGE (disp_48:OfficialLetter {id: '036_4673_CT-CS'})
MERGE (p_disp_48:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_48:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_48)-[:INTERPRETS]->(p_disp_48)
MERGE (disp_48)-[:APPLIES_TO]->(lo_disp_48);

// Re-anchor Dispatch: 037_4675_CT-CS
MERGE (disp_49:OfficialLetter {id: '037_4675_CT-CS'})
MERGE (p_disp_49:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_49:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_49)-[:INTERPRETS]->(p_disp_49)
MERGE (disp_49)-[:APPLIES_TO]->(lo_disp_49);

// Re-anchor Dispatch: 038_4676_CT-CS
MERGE (disp_50:OfficialLetter {id: '038_4676_CT-CS'})
MERGE (p_disp_50:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_50:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_50)-[:INTERPRETS]->(p_disp_50)
MERGE (disp_50)-[:APPLIES_TO]->(lo_disp_50);

// Re-anchor Dispatch: 039_4678_CT-CS
MERGE (disp_51:OfficialLetter {id: '039_4678_CT-CS'})
MERGE (p_disp_51:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_51:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_51)-[:INTERPRETS]->(p_disp_51)
MERGE (disp_51)-[:APPLIES_TO]->(lo_disp_51);

// Re-anchor Dispatch: 040_4683_CT-CS
MERGE (disp_52:OfficialLetter {id: '040_4683_CT-CS'})
MERGE (p_disp_52:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_52:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_52)-[:INTERPRETS]->(p_disp_52)
MERGE (disp_52)-[:APPLIES_TO]->(lo_disp_52);

// Re-anchor Dispatch: 041_4684_CT-CS
MERGE (disp_53:OfficialLetter {id: '041_4684_CT-CS'})
MERGE (p_disp_53:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_53:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_53)-[:INTERPRETS]->(p_disp_53)
MERGE (disp_53)-[:APPLIES_TO]->(lo_disp_53);

// Re-anchor Dispatch: 042_4697_CT-CS
MERGE (disp_54:OfficialLetter {id: '042_4697_CT-CS'})
MERGE (p_disp_54:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_54:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_54)-[:INTERPRETS]->(p_disp_54)
MERGE (disp_54)-[:APPLIES_TO]->(lo_disp_54);

// Re-anchor Dispatch: 043_4736_CT-CS
MERGE (disp_55:OfficialLetter {id: '043_4736_CT-CS'})
MERGE (p_disp_55:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_55:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_55)-[:INTERPRETS]->(p_disp_55)
MERGE (disp_55)-[:APPLIES_TO]->(lo_disp_55);

// Re-anchor Dispatch: 044_4782_CT-CS
MERGE (disp_56:OfficialLetter {id: '044_4782_CT-CS'})
MERGE (p_disp_56:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_56:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_56)-[:INTERPRETS]->(p_disp_56)
MERGE (disp_56)-[:APPLIES_TO]->(lo_disp_56);

// Re-anchor Dispatch: 045_4812_CT-QLTT
MERGE (disp_57:OfficialLetter {id: '045_4812_CT-QLTT'})
MERGE (p_disp_57:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_57:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_57)-[:INTERPRETS]->(p_disp_57)
MERGE (disp_57)-[:APPLIES_TO]->(lo_disp_57);

// Re-anchor Dispatch: 046_4814_CT-CS
MERGE (disp_58:OfficialLetter {id: '046_4814_CT-CS'})
MERGE (p_disp_58:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_58:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_58)-[:INTERPRETS]->(p_disp_58)
MERGE (disp_58)-[:APPLIES_TO]->(lo_disp_58);

// Re-anchor Dispatch: 047_4831_CT-CS
MERGE (disp_59:OfficialLetter {id: '047_4831_CT-CS'})
MERGE (p_disp_59:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_59:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_59)-[:INTERPRETS]->(p_disp_59)
MERGE (disp_59)-[:APPLIES_TO]->(lo_disp_59);

// Re-anchor Dispatch: 048_4937_CT-NVT
MERGE (disp_60:OfficialLetter {id: '048_4937_CT-NVT'})
MERGE (p_disp_60:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_60:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_60)-[:INTERPRETS]->(p_disp_60)
MERGE (disp_60)-[:APPLIES_TO]->(lo_disp_60);

// Re-anchor Dispatch: 049_5090_CT-CS
MERGE (disp_61:OfficialLetter {id: '049_5090_CT-CS'})
MERGE (p_disp_61:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_61:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_61)-[:INTERPRETS]->(p_disp_61)
MERGE (disp_61)-[:APPLIES_TO]->(lo_disp_61);

// Re-anchor Dispatch: 050_5093_CT-CS
MERGE (disp_62:OfficialLetter {id: '050_5093_CT-CS'})
MERGE (p_disp_62:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_62:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_62)-[:INTERPRETS]->(p_disp_62)
MERGE (disp_62)-[:APPLIES_TO]->(lo_disp_62);

// Re-anchor Dispatch: 051_5131_CT-CS
MERGE (disp_63:OfficialLetter {id: '051_5131_CT-CS'})
MERGE (p_disp_63:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_63:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_63)-[:INTERPRETS]->(p_disp_63)
MERGE (disp_63)-[:APPLIES_TO]->(lo_disp_63);

// Re-anchor Dispatch: 052_5134_CT-CS
MERGE (disp_64:OfficialLetter {id: '052_5134_CT-CS'})
MERGE (p_disp_64:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_64:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_64)-[:INTERPRETS]->(p_disp_64)
MERGE (disp_64)-[:APPLIES_TO]->(lo_disp_64);

// Re-anchor Dispatch: 053_5149_CT-CS
MERGE (disp_65:OfficialLetter {id: '053_5149_CT-CS'})
MERGE (p_disp_65:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_65:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_65)-[:INTERPRETS]->(p_disp_65)
MERGE (disp_65)-[:APPLIES_TO]->(lo_disp_65);

// Re-anchor Dispatch: 054_5150_CT-CS
MERGE (disp_66:OfficialLetter {id: '054_5150_CT-CS'})
MERGE (p_disp_66:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_66:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_66)-[:INTERPRETS]->(p_disp_66)
MERGE (disp_66)-[:APPLIES_TO]->(lo_disp_66);

// Re-anchor Dispatch: 055_5151_CT-CS
MERGE (disp_67:OfficialLetter {id: '055_5151_CT-CS'})
MERGE (p_disp_67:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_67:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_67)-[:INTERPRETS]->(p_disp_67)
MERGE (disp_67)-[:APPLIES_TO]->(lo_disp_67);

// Re-anchor Dispatch: 056_5160_CT-PC
MERGE (disp_68:OfficialLetter {id: '056_5160_CT-PC'})
MERGE (p_disp_68:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_68:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_68)-[:INTERPRETS]->(p_disp_68)
MERGE (disp_68)-[:APPLIES_TO]->(lo_disp_68);

// Re-anchor Dispatch: 057_5177_CT-CS
MERGE (disp_69:OfficialLetter {id: '057_5177_CT-CS'})
MERGE (p_disp_69:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_69:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_69)-[:INTERPRETS]->(p_disp_69)
MERGE (disp_69)-[:APPLIES_TO]->(lo_disp_69);

// Re-anchor Dispatch: 058_5200_CT-CS
MERGE (disp_70:OfficialLetter {id: '058_5200_CT-CS'})
MERGE (p_disp_70:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_70:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_70)-[:INTERPRETS]->(p_disp_70)
MERGE (disp_70)-[:APPLIES_TO]->(lo_disp_70);

// Re-anchor Dispatch: 059_5250_CT-CS
MERGE (disp_71:OfficialLetter {id: '059_5250_CT-CS'})
MERGE (p_disp_71:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_71:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_71)-[:INTERPRETS]->(p_disp_71)
MERGE (disp_71)-[:APPLIES_TO]->(lo_disp_71);

// Re-anchor Dispatch: 060_5269_CT-CS
MERGE (disp_72:OfficialLetter {id: '060_5269_CT-CS'})
MERGE (p_disp_72:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_72:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_72)-[:INTERPRETS]->(p_disp_72)
MERGE (disp_72)-[:APPLIES_TO]->(lo_disp_72);

// Re-anchor Dispatch: 061_5280_CT-NVT
MERGE (disp_73:OfficialLetter {id: '061_5280_CT-NVT'})
MERGE (p_disp_73:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_73:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_73)-[:INTERPRETS]->(p_disp_73)
MERGE (disp_73)-[:APPLIES_TO]->(lo_disp_73);

// Re-anchor Dispatch: 062_5287_CT-CS
MERGE (disp_74:OfficialLetter {id: '062_5287_CT-CS'})
MERGE (p_disp_74:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_74:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_74)-[:INTERPRETS]->(p_disp_74)
MERGE (disp_74)-[:APPLIES_TO]->(lo_disp_74);

// Re-anchor Dispatch: 063_5288_CT-CS
MERGE (disp_75:OfficialLetter {id: '063_5288_CT-CS'})
MERGE (p_disp_75:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_75:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_75)-[:INTERPRETS]->(p_disp_75)
MERGE (disp_75)-[:APPLIES_TO]->(lo_disp_75);

// Re-anchor Dispatch: 064_5318_CT-CS
MERGE (disp_76:OfficialLetter {id: '064_5318_CT-CS'})
MERGE (p_disp_76:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_76:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_76)-[:INTERPRETS]->(p_disp_76)
MERGE (disp_76)-[:APPLIES_TO]->(lo_disp_76);

// Re-anchor Dispatch: 065_5319_CT-CS
MERGE (disp_77:OfficialLetter {id: '065_5319_CT-CS'})
MERGE (p_disp_77:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_77:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_77)-[:INTERPRETS]->(p_disp_77)
MERGE (disp_77)-[:APPLIES_TO]->(lo_disp_77);

// Re-anchor Dispatch: 066_5321_CT-CS
MERGE (disp_78:OfficialLetter {id: '066_5321_CT-CS'})
MERGE (p_disp_78:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_78:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_78)-[:INTERPRETS]->(p_disp_78)
MERGE (disp_78)-[:APPLIES_TO]->(lo_disp_78);

// Re-anchor Dispatch: 067_5334_CT-CS
MERGE (disp_79:OfficialLetter {id: '067_5334_CT-CS'})
MERGE (p_disp_79:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_79:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_79)-[:INTERPRETS]->(p_disp_79)
MERGE (disp_79)-[:APPLIES_TO]->(lo_disp_79);

// Re-anchor Dispatch: 068_5344_CT-CS
MERGE (disp_80:OfficialLetter {id: '068_5344_CT-CS'})
MERGE (p_disp_80:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_80:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_80)-[:INTERPRETS]->(p_disp_80)
MERGE (disp_80)-[:APPLIES_TO]->(lo_disp_80);

// Re-anchor Dispatch: 069_5357_CT-CS
MERGE (disp_81:OfficialLetter {id: '069_5357_CT-CS'})
MERGE (p_disp_81:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_81:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_81)-[:INTERPRETS]->(p_disp_81)
MERGE (disp_81)-[:APPLIES_TO]->(lo_disp_81);

// Re-anchor Dispatch: 070_5358_CT-CS
MERGE (disp_82:OfficialLetter {id: '070_5358_CT-CS'})
MERGE (p_disp_82:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_82:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_82)-[:INTERPRETS]->(p_disp_82)
MERGE (disp_82)-[:APPLIES_TO]->(lo_disp_82);

// Re-anchor Dispatch: 071_5359_CT-CS
MERGE (disp_83:OfficialLetter {id: '071_5359_CT-CS'})
MERGE (p_disp_83:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_83:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_83)-[:INTERPRETS]->(p_disp_83)
MERGE (disp_83)-[:APPLIES_TO]->(lo_disp_83);

// Re-anchor Dispatch: 072_5360
MERGE (disp_84:OfficialLetter {id: '072_5360'})
MERGE (p_disp_84:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_84:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_84)-[:INTERPRETS]->(p_disp_84)
MERGE (disp_84)-[:APPLIES_TO]->(lo_disp_84);

// Re-anchor Dispatch: 073_5361_CT-CS
MERGE (disp_85:OfficialLetter {id: '073_5361_CT-CS'})
MERGE (p_disp_85:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_85:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_85)-[:INTERPRETS]->(p_disp_85)
MERGE (disp_85)-[:APPLIES_TO]->(lo_disp_85);

// Re-anchor Dispatch: 074_5362_CT-CS
MERGE (disp_86:OfficialLetter {id: '074_5362_CT-CS'})
MERGE (p_disp_86:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_86:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_86)-[:INTERPRETS]->(p_disp_86)
MERGE (disp_86)-[:APPLIES_TO]->(lo_disp_86);

// Re-anchor Dispatch: 075_5363_CT-CS
MERGE (disp_87:OfficialLetter {id: '075_5363_CT-CS'})
MERGE (p_disp_87:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_87:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_87)-[:INTERPRETS]->(p_disp_87)
MERGE (disp_87)-[:APPLIES_TO]->(lo_disp_87);

// Re-anchor Dispatch: 076_5371_CT-CS
MERGE (disp_88:OfficialLetter {id: '076_5371_CT-CS'})
MERGE (p_disp_88:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_88:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_88)-[:INTERPRETS]->(p_disp_88)
MERGE (disp_88)-[:APPLIES_TO]->(lo_disp_88);

// Re-anchor Dispatch: 077_5406_CT-CS
MERGE (disp_89:OfficialLetter {id: '077_5406_CT-CS'})
MERGE (p_disp_89:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_89:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_89)-[:INTERPRETS]->(p_disp_89)
MERGE (disp_89)-[:APPLIES_TO]->(lo_disp_89);

// Re-anchor Dispatch: 078_5408_CT-CS
MERGE (disp_90:OfficialLetter {id: '078_5408_CT-CS'})
MERGE (p_disp_90:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_90:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_90)-[:INTERPRETS]->(p_disp_90)
MERGE (disp_90)-[:APPLIES_TO]->(lo_disp_90);

// Re-anchor Dispatch: 079_5438_CT-CS
MERGE (disp_91:OfficialLetter {id: '079_5438_CT-CS'})
MERGE (p_disp_91:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_91:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_91)-[:INTERPRETS]->(p_disp_91)
MERGE (disp_91)-[:APPLIES_TO]->(lo_disp_91);

// Re-anchor Dispatch: 080_5477_CT-CS
MERGE (disp_92:OfficialLetter {id: '080_5477_CT-CS'})
MERGE (p_disp_92:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_92:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_92)-[:INTERPRETS]->(p_disp_92)
MERGE (disp_92)-[:APPLIES_TO]->(lo_disp_92);

// Re-anchor Dispatch: 081_5482_CT-NVT
MERGE (disp_93:OfficialLetter {id: '081_5482_CT-NVT'})
MERGE (p_disp_93:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_93:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_93)-[:INTERPRETS]->(p_disp_93)
MERGE (disp_93)-[:APPLIES_TO]->(lo_disp_93);

// Re-anchor Dispatch: 082_5493_CT-CS
MERGE (disp_94:OfficialLetter {id: '082_5493_CT-CS'})
MERGE (p_disp_94:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_94:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_94)-[:INTERPRETS]->(p_disp_94)
MERGE (disp_94)-[:APPLIES_TO]->(lo_disp_94);

// Re-anchor Dispatch: 083_5495_CT-CS
MERGE (disp_95:OfficialLetter {id: '083_5495_CT-CS'})
MERGE (p_disp_95:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_95:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_95)-[:INTERPRETS]->(p_disp_95)
MERGE (disp_95)-[:APPLIES_TO]->(lo_disp_95);

// Re-anchor Dispatch: 084_5521_CT-CS
MERGE (disp_96:OfficialLetter {id: '084_5521_CT-CS'})
MERGE (p_disp_96:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_96:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_96)-[:INTERPRETS]->(p_disp_96)
MERGE (disp_96)-[:APPLIES_TO]->(lo_disp_96);

// Re-anchor Dispatch: 085_5522_CT-CS
MERGE (disp_97:OfficialLetter {id: '085_5522_CT-CS'})
MERGE (p_disp_97:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_97:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_97)-[:INTERPRETS]->(p_disp_97)
MERGE (disp_97)-[:APPLIES_TO]->(lo_disp_97);

// Re-anchor Dispatch: 086_5524_CT-CS
MERGE (disp_98:OfficialLetter {id: '086_5524_CT-CS'})
MERGE (p_disp_98:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_98:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_98)-[:INTERPRETS]->(p_disp_98)
MERGE (disp_98)-[:APPLIES_TO]->(lo_disp_98);

// Re-anchor Dispatch: 087_5525_CT-CS
MERGE (disp_99:OfficialLetter {id: '087_5525_CT-CS'})
MERGE (p_disp_99:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_99:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_99)-[:INTERPRETS]->(p_disp_99)
MERGE (disp_99)-[:APPLIES_TO]->(lo_disp_99);

// Re-anchor Dispatch: 088_5538_CT-CS
MERGE (disp_100:OfficialLetter {id: '088_5538_CT-CS'})
MERGE (p_disp_100:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_100:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_100)-[:INTERPRETS]->(p_disp_100)
MERGE (disp_100)-[:APPLIES_TO]->(lo_disp_100);

// Re-anchor Dispatch: 089_5555_CT-CS
MERGE (disp_101:OfficialLetter {id: '089_5555_CT-CS'})
MERGE (p_disp_101:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_101:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_101)-[:INTERPRETS]->(p_disp_101)
MERGE (disp_101)-[:APPLIES_TO]->(lo_disp_101);

// Re-anchor Dispatch: 090_5556_CT-CS
MERGE (disp_102:OfficialLetter {id: '090_5556_CT-CS'})
MERGE (p_disp_102:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_102:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_102)-[:INTERPRETS]->(p_disp_102)
MERGE (disp_102)-[:APPLIES_TO]->(lo_disp_102);

// Re-anchor Dispatch: 091_5557_CT-CS
MERGE (disp_103:OfficialLetter {id: '091_5557_CT-CS'})
MERGE (p_disp_103:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_103:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_103)-[:INTERPRETS]->(p_disp_103)
MERGE (disp_103)-[:APPLIES_TO]->(lo_disp_103);

// Re-anchor Dispatch: 092_5583_CT-CS
MERGE (disp_104:OfficialLetter {id: '092_5583_CT-CS'})
MERGE (p_disp_104:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_104:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_104)-[:INTERPRETS]->(p_disp_104)
MERGE (disp_104)-[:APPLIES_TO]->(lo_disp_104);

// Re-anchor Dispatch: 093_5604_CT-CS
MERGE (disp_105:OfficialLetter {id: '093_5604_CT-CS'})
MERGE (p_disp_105:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_105:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_105)-[:INTERPRETS]->(p_disp_105)
MERGE (disp_105)-[:APPLIES_TO]->(lo_disp_105);

// Re-anchor Dispatch: 094_5607_CT-CS
MERGE (disp_106:OfficialLetter {id: '094_5607_CT-CS'})
MERGE (p_disp_106:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_106:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_106)-[:INTERPRETS]->(p_disp_106)
MERGE (disp_106)-[:APPLIES_TO]->(lo_disp_106);

// Re-anchor Dispatch: 095_5608_CT-CS
MERGE (disp_107:OfficialLetter {id: '095_5608_CT-CS'})
MERGE (p_disp_107:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_107:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_107)-[:INTERPRETS]->(p_disp_107)
MERGE (disp_107)-[:APPLIES_TO]->(lo_disp_107);

// Re-anchor Dispatch: 096_5640_CT-CS
MERGE (disp_108:OfficialLetter {id: '096_5640_CT-CS'})
MERGE (p_disp_108:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_108:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_108)-[:INTERPRETS]->(p_disp_108)
MERGE (disp_108)-[:APPLIES_TO]->(lo_disp_108);

// Re-anchor Dispatch: 097_5641_CT-CS
MERGE (disp_109:OfficialLetter {id: '097_5641_CT-CS'})
MERGE (p_disp_109:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_109:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_109)-[:INTERPRETS]->(p_disp_109)
MERGE (disp_109)-[:APPLIES_TO]->(lo_disp_109);

// Re-anchor Dispatch: 098_5642_CT-CS
MERGE (disp_110:OfficialLetter {id: '098_5642_CT-CS'})
MERGE (p_disp_110:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_110:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_110)-[:INTERPRETS]->(p_disp_110)
MERGE (disp_110)-[:APPLIES_TO]->(lo_disp_110);

// Re-anchor Dispatch: 099_5643_CT-CS
MERGE (disp_111:OfficialLetter {id: '099_5643_CT-CS'})
MERGE (p_disp_111:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_111:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_111)-[:INTERPRETS]->(p_disp_111)
MERGE (disp_111)-[:APPLIES_TO]->(lo_disp_111);

// Re-anchor Dispatch: 100_5696_CT-CS
MERGE (disp_112:OfficialLetter {id: '100_5696_CT-CS'})
MERGE (p_disp_112:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_112:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_112)-[:INTERPRETS]->(p_disp_112)
MERGE (disp_112)-[:APPLIES_TO]->(lo_disp_112);

// Re-anchor Dispatch: 101_5697_CT-CS
MERGE (disp_113:OfficialLetter {id: '101_5697_CT-CS'})
MERGE (p_disp_113:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_113:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_113)-[:INTERPRETS]->(p_disp_113)
MERGE (disp_113)-[:APPLIES_TO]->(lo_disp_113);

// Re-anchor Dispatch: 102_5744_CT-CS
MERGE (disp_114:OfficialLetter {id: '102_5744_CT-CS'})
MERGE (p_disp_114:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_114:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_114)-[:INTERPRETS]->(p_disp_114)
MERGE (disp_114)-[:APPLIES_TO]->(lo_disp_114);

// Re-anchor Dispatch: 103_5745_CT-CS
MERGE (disp_115:OfficialLetter {id: '103_5745_CT-CS'})
MERGE (p_disp_115:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_115:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_115)-[:INTERPRETS]->(p_disp_115)
MERGE (disp_115)-[:APPLIES_TO]->(lo_disp_115);

// Re-anchor Dispatch: 104_5783_CT-CS
MERGE (disp_116:OfficialLetter {id: '104_5783_CT-CS'})
MERGE (p_disp_116:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_116:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_116)-[:INTERPRETS]->(p_disp_116)
MERGE (disp_116)-[:APPLIES_TO]->(lo_disp_116);

// Re-anchor Dispatch: 105_5883
MERGE (disp_117:OfficialLetter {id: '105_5883'})
MERGE (p_disp_117:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_117:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_117)-[:INTERPRETS]->(p_disp_117)
MERGE (disp_117)-[:APPLIES_TO]->(lo_disp_117);

// Re-anchor Dispatch: 106_5889_CT-CS
MERGE (disp_118:OfficialLetter {id: '106_5889_CT-CS'})
MERGE (p_disp_118:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_118:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_118)-[:INTERPRETS]->(p_disp_118)
MERGE (disp_118)-[:APPLIES_TO]->(lo_disp_118);

// Re-anchor Dispatch: 107_5937_CT-CS
MERGE (disp_119:OfficialLetter {id: '107_5937_CT-CS'})
MERGE (p_disp_119:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_119:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_119)-[:INTERPRETS]->(p_disp_119)
MERGE (disp_119)-[:APPLIES_TO]->(lo_disp_119);

// Re-anchor Dispatch: 108_6115_CT-QLNT
MERGE (disp_120:OfficialLetter {id: '108_6115_CT-QLNT'})
MERGE (p_disp_120:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_120:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_120)-[:INTERPRETS]->(p_disp_120)
MERGE (disp_120)-[:APPLIES_TO]->(lo_disp_120);

// Re-anchor Dispatch: 109_6227_CT-QLNT
MERGE (disp_121:OfficialLetter {id: '109_6227_CT-QLNT'})
MERGE (p_disp_121:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_121:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_121)-[:INTERPRETS]->(p_disp_121)
MERGE (disp_121)-[:APPLIES_TO]->(lo_disp_121);

// Re-anchor Dispatch: 110_6304_CT-QLNT
MERGE (disp_122:OfficialLetter {id: '110_6304_CT-QLNT'})
MERGE (p_disp_122:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_122:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_122)-[:INTERPRETS]->(p_disp_122)
MERGE (disp_122)-[:APPLIES_TO]->(lo_disp_122);

// Re-anchor Dispatch: 111_6325_CT-QLNT
MERGE (disp_123:OfficialLetter {id: '111_6325_CT-QLNT'})
MERGE (p_disp_123:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_123:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_123)-[:INTERPRETS]->(p_disp_123)
MERGE (disp_123)-[:APPLIES_TO]->(lo_disp_123);

// Re-anchor Dispatch: 112_6335_CT-QLNT
MERGE (disp_124:OfficialLetter {id: '112_6335_CT-QLNT'})
MERGE (p_disp_124:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_124:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_124)-[:INTERPRETS]->(p_disp_124)
MERGE (disp_124)-[:APPLIES_TO]->(lo_disp_124);

// Re-anchor Dispatch: 113_6341_CT-QLNT
MERGE (disp_125:OfficialLetter {id: '113_6341_CT-QLNT'})
MERGE (p_disp_125:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_125:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_125)-[:INTERPRETS]->(p_disp_125)
MERGE (disp_125)-[:APPLIES_TO]->(lo_disp_125);

// Re-anchor Dispatch: 114_6479_CT-QLNT
MERGE (disp_126:OfficialLetter {id: '114_6479_CT-QLNT'})
MERGE (p_disp_126:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_126:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_126)-[:INTERPRETS]->(p_disp_126)
MERGE (disp_126)-[:APPLIES_TO]->(lo_disp_126);

// Re-anchor Dispatch: 115_6480_CT-QLNT
MERGE (disp_127:OfficialLetter {id: '115_6480_CT-QLNT'})
MERGE (p_disp_127:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_127:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_127)-[:INTERPRETS]->(p_disp_127)
MERGE (disp_127)-[:APPLIES_TO]->(lo_disp_127);

// Re-anchor Dispatch: 116_6486_CT-QLNT
MERGE (disp_128:OfficialLetter {id: '116_6486_CT-QLNT'})
MERGE (p_disp_128:LegalParagraph {id: 'PARA_L67_D9'})
MERGE (lo_disp_128:Atomic_LO {id: 'LO_CIT_DEDUCTIBLE_EXPENSE_RULE'})
MERGE (disp_128)-[:INTERPRETS]->(p_disp_128)
MERGE (disp_128)-[:APPLIES_TO]->(lo_disp_128);

// Re-anchor Dispatch: 117_6487_CT-QLNT
MERGE (disp_129:OfficialLetter {id: '117_6487_CT-QLNT'})
MERGE (p_disp_129:LegalParagraph {id: 'PARA_ND132_D16'})
MERGE (lo_disp_129:Atomic_LO {id: 'LO_CIT_INTEREST_LIMIT_RELATED_PARTY'})
MERGE (disp_129)-[:INTERPRETS]->(p_disp_129)
MERGE (disp_129)-[:APPLIES_TO]->(lo_disp_129);

// Re-anchor Dispatch: 118_6643_CT-QLNT
MERGE (disp_130:OfficialLetter {id: '118_6643_CT-QLNT'})
MERGE (p_disp_130:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_130:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_130)-[:INTERPRETS]->(p_disp_130)
MERGE (disp_130)-[:APPLIES_TO]->(lo_disp_130);

// Re-anchor Dispatch: 119_6645_CT-QLNT
MERGE (disp_131:OfficialLetter {id: '119_6645_CT-QLNT'})
MERGE (p_disp_131:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_131:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_131)-[:INTERPRETS]->(p_disp_131)
MERGE (disp_131)-[:APPLIES_TO]->(lo_disp_131);

// Re-anchor Dispatch: 120_6654_CT-QLNT
MERGE (disp_132:OfficialLetter {id: '120_6654_CT-QLNT'})
MERGE (p_disp_132:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_132:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_132)-[:INTERPRETS]->(p_disp_132)
MERGE (disp_132)-[:APPLIES_TO]->(lo_disp_132);

// Re-anchor Dispatch: 121_6661_CT-QLNT
MERGE (disp_133:OfficialLetter {id: '121_6661_CT-QLNT'})
MERGE (p_disp_133:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_133:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_133)-[:INTERPRETS]->(p_disp_133)
MERGE (disp_133)-[:APPLIES_TO]->(lo_disp_133);

// Re-anchor Dispatch: 122_6687_CT-QLNT
MERGE (disp_134:OfficialLetter {id: '122_6687_CT-QLNT'})
MERGE (p_disp_134:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_134:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_134)-[:INTERPRETS]->(p_disp_134)
MERGE (disp_134)-[:APPLIES_TO]->(lo_disp_134);

// Re-anchor Dispatch: 123_6689_CT-QLNT
MERGE (disp_135:OfficialLetter {id: '123_6689_CT-QLNT'})
MERGE (p_disp_135:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_135:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_135)-[:INTERPRETS]->(p_disp_135)
MERGE (disp_135)-[:APPLIES_TO]->(lo_disp_135);

// Re-anchor Dispatch: 124_22_2026_NQ-CP
MERGE (disp_136:OfficialLetter {id: '124_22_2026_NQ-CP'})
MERGE (p_disp_136:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_136:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_136)-[:INTERPRETS]->(p_disp_136)
MERGE (disp_136)-[:APPLIES_TO]->(lo_disp_136);

// Re-anchor Dispatch: 125_6755_CT-QLNT
MERGE (disp_137:OfficialLetter {id: '125_6755_CT-QLNT'})
MERGE (p_disp_137:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_137:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_137)-[:INTERPRETS]->(p_disp_137)
MERGE (disp_137)-[:APPLIES_TO]->(lo_disp_137);

// Re-anchor Dispatch: 126_6762
MERGE (disp_138:OfficialLetter {id: '126_6762'})
MERGE (p_disp_138:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_disp_138:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (disp_138)-[:INTERPRETS]->(p_disp_138)
MERGE (disp_138)-[:APPLIES_TO]->(lo_disp_138);

// Re-anchor Dispatch: 127_6810
MERGE (disp_139:OfficialLetter {id: '127_6810'})
MERGE (p_disp_139:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_139:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_139)-[:INTERPRETS]->(p_disp_139)
MERGE (disp_139)-[:APPLIES_TO]->(lo_disp_139);

// Re-anchor Dispatch: 128_6845_CT-QLNT
MERGE (disp_140:OfficialLetter {id: '128_6845_CT-QLNT'})
MERGE (p_disp_140:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_140:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_140)-[:INTERPRETS]->(p_disp_140)
MERGE (disp_140)-[:APPLIES_TO]->(lo_disp_140);

// Re-anchor Dispatch: 129_6846_CT-QLNT
MERGE (disp_141:OfficialLetter {id: '129_6846_CT-QLNT'})
MERGE (p_disp_141:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_141:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_141)-[:INTERPRETS]->(p_disp_141)
MERGE (disp_141)-[:APPLIES_TO]->(lo_disp_141);

// Re-anchor Dispatch: 130_6866_CT-QLNT
MERGE (disp_142:OfficialLetter {id: '130_6866_CT-QLNT'})
MERGE (p_disp_142:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_142:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_142)-[:INTERPRETS]->(p_disp_142)
MERGE (disp_142)-[:APPLIES_TO]->(lo_disp_142);

// Re-anchor Dispatch: 131_6903_CT-QLNT
MERGE (disp_143:OfficialLetter {id: '131_6903_CT-QLNT'})
MERGE (p_disp_143:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_143:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_143)-[:INTERPRETS]->(p_disp_143)
MERGE (disp_143)-[:APPLIES_TO]->(lo_disp_143);

// Re-anchor Dispatch: 132_2026_NĐ-CP
MERGE (disp_144:OfficialLetter {id: '132_2026_NĐ-CP'})
MERGE (p_disp_144:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_144:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_144)-[:INTERPRETS]->(p_disp_144)
MERGE (disp_144)-[:APPLIES_TO]->(lo_disp_144);

// Re-anchor Dispatch: 132_95_07072026_171508
MERGE (disp_145:OfficialLetter {id: '132_95_07072026_171508'})
MERGE (p_disp_145:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_145:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_145)-[:INTERPRETS]->(p_disp_145)
MERGE (disp_145)-[:APPLIES_TO]->(lo_disp_145);

// Re-anchor Dispatch: 133_2023_NĐ-CP
MERGE (disp_146:OfficialLetter {id: '133_2023_NĐ-CP'})
MERGE (p_disp_146:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_146:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_146)-[:INTERPRETS]->(p_disp_146)
MERGE (disp_146)-[:APPLIES_TO]->(lo_disp_146);

// Re-anchor Dispatch: 133_96_06072026_174119
MERGE (disp_147:OfficialLetter {id: '133_96_06072026_174119'})
MERGE (p_disp_147:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_147:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_147)-[:INTERPRETS]->(p_disp_147)
MERGE (disp_147)-[:APPLIES_TO]->(lo_disp_147);

// Re-anchor Dispatch: 134_2026_ND
MERGE (disp_148:OfficialLetter {id: '134_2026_ND'})
MERGE (p_disp_148:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_148:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_148)-[:INTERPRETS]->(p_disp_148)
MERGE (disp_148)-[:APPLIES_TO]->(lo_disp_148);

// Re-anchor Dispatch: 134_2026_NĐ-CP
MERGE (disp_149:OfficialLetter {id: '134_2026_NĐ-CP'})
MERGE (p_disp_149:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_149:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_149)-[:INTERPRETS]->(p_disp_149)
MERGE (disp_149)-[:APPLIES_TO]->(lo_disp_149);

// Re-anchor Dispatch: 135_2019_NĐ-CP
MERGE (disp_150:OfficialLetter {id: '135_2019_NĐ-CP'})
MERGE (p_disp_150:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_150:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_150)-[:INTERPRETS]->(p_disp_150)
MERGE (disp_150)-[:APPLIES_TO]->(lo_disp_150);

// Re-anchor Dispatch: 135_98_14072026_174250
MERGE (disp_151:OfficialLetter {id: '135_98_14072026_174250'})
MERGE (p_disp_151:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_151:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_151)-[:INTERPRETS]->(p_disp_151)
MERGE (disp_151)-[:APPLIES_TO]->(lo_disp_151);

// Re-anchor Dispatch: 136_2024_NĐ-CP
MERGE (disp_152:OfficialLetter {id: '136_2024_NĐ-CP'})
MERGE (p_disp_152:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_152:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_152)-[:INTERPRETS]->(p_disp_152)
MERGE (disp_152)-[:APPLIES_TO]->(lo_disp_152);

// Re-anchor Dispatch: 136_6387_CT-QLNT
MERGE (disp_153:OfficialLetter {id: '136_6387_CT-QLNT'})
MERGE (p_disp_153:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_153:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_153)-[:INTERPRETS]->(p_disp_153)
MERGE (disp_153)-[:APPLIES_TO]->(lo_disp_153);

// Re-anchor Dispatch: 137_2026_NĐ-CP
MERGE (disp_154:OfficialLetter {id: '137_2026_NĐ-CP'})
MERGE (p_disp_154:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_154:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_154)-[:INTERPRETS]->(p_disp_154)
MERGE (disp_154)-[:APPLIES_TO]->(lo_disp_154);

// Re-anchor Dispatch: 137_458_TTR-BCA
MERGE (disp_155:OfficialLetter {id: '137_458_TTR-BCA'})
MERGE (p_disp_155:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_disp_155:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (disp_155)-[:INTERPRETS]->(p_disp_155)
MERGE (disp_155)-[:APPLIES_TO]->(lo_disp_155);

// Re-anchor Q&A: 162770
MERGE (qa_1:QA_Pair {id: '162770'})
MERGE (p_qa_1:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_1:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_1)-[:INTERPRETS]->(p_qa_1)
MERGE (qa_1)-[:ILLUSTRATES]->(lo_qa_1);

// Re-anchor Q&A: 165600
MERGE (qa_2:QA_Pair {id: '165600'})
MERGE (p_qa_2:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_2:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_2)-[:INTERPRETS]->(p_qa_2)
MERGE (qa_2)-[:ILLUSTRATES]->(lo_qa_2);

// Re-anchor Q&A: 162689
MERGE (qa_3:QA_Pair {id: '162689'})
MERGE (p_qa_3:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_3:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_3)-[:INTERPRETS]->(p_qa_3)
MERGE (qa_3)-[:ILLUSTRATES]->(lo_qa_3);

// Re-anchor Q&A: 165604
MERGE (qa_4:QA_Pair {id: '165604'})
MERGE (p_qa_4:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_4:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_4)-[:INTERPRETS]->(p_qa_4)
MERGE (qa_4)-[:ILLUSTRATES]->(lo_qa_4);

// Re-anchor Q&A: 165687
MERGE (qa_5:QA_Pair {id: '165687'})
MERGE (p_qa_5:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_5:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_5)-[:INTERPRETS]->(p_qa_5)
MERGE (qa_5)-[:ILLUSTRATES]->(lo_qa_5);

// Re-anchor Q&A: 165635
MERGE (qa_6:QA_Pair {id: '165635'})
MERGE (p_qa_6:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_6:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_6)-[:INTERPRETS]->(p_qa_6)
MERGE (qa_6)-[:ILLUSTRATES]->(lo_qa_6);

// Re-anchor Q&A: 165508
MERGE (qa_7:QA_Pair {id: '165508'})
MERGE (p_qa_7:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_7:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_7)-[:INTERPRETS]->(p_qa_7)
MERGE (qa_7)-[:ILLUSTRATES]->(lo_qa_7);

// Re-anchor Q&A: 165207
MERGE (qa_8:QA_Pair {id: '165207'})
MERGE (p_qa_8:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_8:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_8)-[:INTERPRETS]->(p_qa_8)
MERGE (qa_8)-[:ILLUSTRATES]->(lo_qa_8);

// Re-anchor Q&A: 165564
MERGE (qa_9:QA_Pair {id: '165564'})
MERGE (p_qa_9:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_9:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_9)-[:INTERPRETS]->(p_qa_9)
MERGE (qa_9)-[:ILLUSTRATES]->(lo_qa_9);

// Re-anchor Q&A: 165711
MERGE (qa_10:QA_Pair {id: '165711'})
MERGE (p_qa_10:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_10:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_10)-[:INTERPRETS]->(p_qa_10)
MERGE (qa_10)-[:ILLUSTRATES]->(lo_qa_10);

// Re-anchor Q&A: 165622
MERGE (qa_11:QA_Pair {id: '165622'})
MERGE (p_qa_11:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_11:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_11)-[:INTERPRETS]->(p_qa_11)
MERGE (qa_11)-[:ILLUSTRATES]->(lo_qa_11);

// Re-anchor Q&A: 165516
MERGE (qa_12:QA_Pair {id: '165516'})
MERGE (p_qa_12:LegalParagraph {id: 'PARA_ND132_D16'})
MERGE (lo_qa_12:Atomic_LO {id: 'LO_CIT_INTEREST_LIMIT_RELATED_PARTY'})
MERGE (qa_12)-[:INTERPRETS]->(p_qa_12)
MERGE (qa_12)-[:ILLUSTRATES]->(lo_qa_12);

// Re-anchor Q&A: 165554
MERGE (qa_13:QA_Pair {id: '165554'})
MERGE (p_qa_13:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_13:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_13)-[:INTERPRETS]->(p_qa_13)
MERGE (qa_13)-[:ILLUSTRATES]->(lo_qa_13);

// Re-anchor Q&A: 165485
MERGE (qa_14:QA_Pair {id: '165485'})
MERGE (p_qa_14:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_14:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_14)-[:INTERPRETS]->(p_qa_14)
MERGE (qa_14)-[:ILLUSTRATES]->(lo_qa_14);

// Re-anchor Q&A: 165449
MERGE (qa_15:QA_Pair {id: '165449'})
MERGE (p_qa_15:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_15:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_15)-[:INTERPRETS]->(p_qa_15)
MERGE (qa_15)-[:ILLUSTRATES]->(lo_qa_15);

// Re-anchor Q&A: 164138
MERGE (qa_16:QA_Pair {id: '164138'})
MERGE (p_qa_16:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_16:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_16)-[:INTERPRETS]->(p_qa_16)
MERGE (qa_16)-[:ILLUSTRATES]->(lo_qa_16);

// Re-anchor Q&A: 165110
MERGE (qa_17:QA_Pair {id: '165110'})
MERGE (p_qa_17:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_17:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_17)-[:INTERPRETS]->(p_qa_17)
MERGE (qa_17)-[:ILLUSTRATES]->(lo_qa_17);

// Re-anchor Q&A: 165504
MERGE (qa_18:QA_Pair {id: '165504'})
MERGE (p_qa_18:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_18:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_18)-[:INTERPRETS]->(p_qa_18)
MERGE (qa_18)-[:ILLUSTRATES]->(lo_qa_18);

// Re-anchor Q&A: 165526
MERGE (qa_19:QA_Pair {id: '165526'})
MERGE (p_qa_19:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_19:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_19)-[:INTERPRETS]->(p_qa_19)
MERGE (qa_19)-[:ILLUSTRATES]->(lo_qa_19);

// Re-anchor Q&A: 165071
MERGE (qa_20:QA_Pair {id: '165071'})
MERGE (p_qa_20:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_20:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_20)-[:INTERPRETS]->(p_qa_20)
MERGE (qa_20)-[:ILLUSTRATES]->(lo_qa_20);

// Re-anchor Q&A: 165548
MERGE (qa_21:QA_Pair {id: '165548'})
MERGE (p_qa_21:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_21:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_21)-[:INTERPRETS]->(p_qa_21)
MERGE (qa_21)-[:ILLUSTRATES]->(lo_qa_21);

// Re-anchor Q&A: 164961
MERGE (qa_22:QA_Pair {id: '164961'})
MERGE (p_qa_22:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_22:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_22)-[:INTERPRETS]->(p_qa_22)
MERGE (qa_22)-[:ILLUSTRATES]->(lo_qa_22);

// Re-anchor Q&A: 165105
MERGE (qa_23:QA_Pair {id: '165105'})
MERGE (p_qa_23:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_23:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_23)-[:INTERPRETS]->(p_qa_23)
MERGE (qa_23)-[:ILLUSTRATES]->(lo_qa_23);

// Re-anchor Q&A: 164982
MERGE (qa_24:QA_Pair {id: '164982'})
MERGE (p_qa_24:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_24:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_24)-[:INTERPRETS]->(p_qa_24)
MERGE (qa_24)-[:ILLUSTRATES]->(lo_qa_24);

// Re-anchor Q&A: 165077
MERGE (qa_25:QA_Pair {id: '165077'})
MERGE (p_qa_25:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_25:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_25)-[:INTERPRETS]->(p_qa_25)
MERGE (qa_25)-[:ILLUSTRATES]->(lo_qa_25);

// Re-anchor Q&A: 165127
MERGE (qa_26:QA_Pair {id: '165127'})
MERGE (p_qa_26:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_26:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_26)-[:INTERPRETS]->(p_qa_26)
MERGE (qa_26)-[:ILLUSTRATES]->(lo_qa_26);

// Re-anchor Q&A: 164262
MERGE (qa_27:QA_Pair {id: '164262'})
MERGE (p_qa_27:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_27:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_27)-[:INTERPRETS]->(p_qa_27)
MERGE (qa_27)-[:ILLUSTRATES]->(lo_qa_27);

// Re-anchor Q&A: 163571
MERGE (qa_28:QA_Pair {id: '163571'})
MERGE (p_qa_28:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_28:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_28)-[:INTERPRETS]->(p_qa_28)
MERGE (qa_28)-[:ILLUSTRATES]->(lo_qa_28);

// Re-anchor Q&A: 155109
MERGE (qa_29:QA_Pair {id: '155109'})
MERGE (p_qa_29:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_29:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_29)-[:INTERPRETS]->(p_qa_29)
MERGE (qa_29)-[:ILLUSTRATES]->(lo_qa_29);

// Re-anchor Q&A: 164482
MERGE (qa_30:QA_Pair {id: '164482'})
MERGE (p_qa_30:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_30:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_30)-[:INTERPRETS]->(p_qa_30)
MERGE (qa_30)-[:ILLUSTRATES]->(lo_qa_30);

// Re-anchor Q&A: 157662
MERGE (qa_31:QA_Pair {id: '157662'})
MERGE (p_qa_31:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_31:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_31)-[:INTERPRETS]->(p_qa_31)
MERGE (qa_31)-[:ILLUSTRATES]->(lo_qa_31);

// Re-anchor Q&A: 165081
MERGE (qa_32:QA_Pair {id: '165081'})
MERGE (p_qa_32:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_32:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_32)-[:INTERPRETS]->(p_qa_32)
MERGE (qa_32)-[:ILLUSTRATES]->(lo_qa_32);

// Re-anchor Q&A: 164351
MERGE (qa_33:QA_Pair {id: '164351'})
MERGE (p_qa_33:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_33:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_33)-[:INTERPRETS]->(p_qa_33)
MERGE (qa_33)-[:ILLUSTRATES]->(lo_qa_33);

// Re-anchor Q&A: 164530
MERGE (qa_34:QA_Pair {id: '164530'})
MERGE (p_qa_34:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_34:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_34)-[:INTERPRETS]->(p_qa_34)
MERGE (qa_34)-[:ILLUSTRATES]->(lo_qa_34);

// Re-anchor Q&A: 165206
MERGE (qa_35:QA_Pair {id: '165206'})
MERGE (p_qa_35:LegalParagraph {id: 'PARA_L67_D9'})
MERGE (lo_qa_35:Atomic_LO {id: 'LO_CIT_DEDUCTIBLE_EXPENSE_RULE'})
MERGE (qa_35)-[:INTERPRETS]->(p_qa_35)
MERGE (qa_35)-[:ILLUSTRATES]->(lo_qa_35);

// Re-anchor Q&A: 165313
MERGE (qa_36:QA_Pair {id: '165313'})
MERGE (p_qa_36:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_36:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_36)-[:INTERPRETS]->(p_qa_36)
MERGE (qa_36)-[:ILLUSTRATES]->(lo_qa_36);

// Re-anchor Q&A: 164856
MERGE (qa_37:QA_Pair {id: '164856'})
MERGE (p_qa_37:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_37:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_37)-[:INTERPRETS]->(p_qa_37)
MERGE (qa_37)-[:ILLUSTRATES]->(lo_qa_37);

// Re-anchor Q&A: 164621
MERGE (qa_38:QA_Pair {id: '164621'})
MERGE (p_qa_38:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_38:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_38)-[:INTERPRETS]->(p_qa_38)
MERGE (qa_38)-[:ILLUSTRATES]->(lo_qa_38);

// Re-anchor Q&A: 164762
MERGE (qa_39:QA_Pair {id: '164762'})
MERGE (p_qa_39:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_39:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_39)-[:INTERPRETS]->(p_qa_39)
MERGE (qa_39)-[:ILLUSTRATES]->(lo_qa_39);

// Re-anchor Q&A: 165216
MERGE (qa_40:QA_Pair {id: '165216'})
MERGE (p_qa_40:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_40:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_40)-[:INTERPRETS]->(p_qa_40)
MERGE (qa_40)-[:ILLUSTRATES]->(lo_qa_40);

// Re-anchor Q&A: 165212
MERGE (qa_41:QA_Pair {id: '165212'})
MERGE (p_qa_41:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_41:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_41)-[:INTERPRETS]->(p_qa_41)
MERGE (qa_41)-[:ILLUSTRATES]->(lo_qa_41);

// Re-anchor Q&A: 164957
MERGE (qa_42:QA_Pair {id: '164957'})
MERGE (p_qa_42:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_42:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_42)-[:INTERPRETS]->(p_qa_42)
MERGE (qa_42)-[:ILLUSTRATES]->(lo_qa_42);

// Re-anchor Q&A: 165126
MERGE (qa_43:QA_Pair {id: '165126'})
MERGE (p_qa_43:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_43:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_43)-[:INTERPRETS]->(p_qa_43)
MERGE (qa_43)-[:ILLUSTRATES]->(lo_qa_43);

// Re-anchor Q&A: 164996
MERGE (qa_44:QA_Pair {id: '164996'})
MERGE (p_qa_44:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_44:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_44)-[:INTERPRETS]->(p_qa_44)
MERGE (qa_44)-[:ILLUSTRATES]->(lo_qa_44);

// Re-anchor Q&A: 165289
MERGE (qa_45:QA_Pair {id: '165289'})
MERGE (p_qa_45:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_45:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_45)-[:INTERPRETS]->(p_qa_45)
MERGE (qa_45)-[:ILLUSTRATES]->(lo_qa_45);

// Re-anchor Q&A: 165202
MERGE (qa_46:QA_Pair {id: '165202'})
MERGE (p_qa_46:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_46:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_46)-[:INTERPRETS]->(p_qa_46)
MERGE (qa_46)-[:ILLUSTRATES]->(lo_qa_46);

// Re-anchor Q&A: 163559
MERGE (qa_47:QA_Pair {id: '163559'})
MERGE (p_qa_47:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_47:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_47)-[:INTERPRETS]->(p_qa_47)
MERGE (qa_47)-[:ILLUSTRATES]->(lo_qa_47);

// Re-anchor Q&A: 165116
MERGE (qa_48:QA_Pair {id: '165116'})
MERGE (p_qa_48:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_48:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_48)-[:INTERPRETS]->(p_qa_48)
MERGE (qa_48)-[:ILLUSTRATES]->(lo_qa_48);

// Re-anchor Q&A: 165167
MERGE (qa_49:QA_Pair {id: '165167'})
MERGE (p_qa_49:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_49:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_49)-[:INTERPRETS]->(p_qa_49)
MERGE (qa_49)-[:ILLUSTRATES]->(lo_qa_49);

// Re-anchor Q&A: 165316
MERGE (qa_50:QA_Pair {id: '165316'})
MERGE (p_qa_50:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_50:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_50)-[:INTERPRETS]->(p_qa_50)
MERGE (qa_50)-[:ILLUSTRATES]->(lo_qa_50);

// Re-anchor Q&A: 165005
MERGE (qa_51:QA_Pair {id: '165005'})
MERGE (p_qa_51:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_51:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_51)-[:INTERPRETS]->(p_qa_51)
MERGE (qa_51)-[:ILLUSTRATES]->(lo_qa_51);

// Re-anchor Q&A: 164158
MERGE (qa_52:QA_Pair {id: '164158'})
MERGE (p_qa_52:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_52:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_52)-[:INTERPRETS]->(p_qa_52)
MERGE (qa_52)-[:ILLUSTRATES]->(lo_qa_52);

// Re-anchor Q&A: 164575
MERGE (qa_53:QA_Pair {id: '164575'})
MERGE (p_qa_53:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_53:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_53)-[:INTERPRETS]->(p_qa_53)
MERGE (qa_53)-[:ILLUSTRATES]->(lo_qa_53);

// Re-anchor Q&A: 165107
MERGE (qa_54:QA_Pair {id: '165107'})
MERGE (p_qa_54:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_54:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_54)-[:INTERPRETS]->(p_qa_54)
MERGE (qa_54)-[:ILLUSTRATES]->(lo_qa_54);

// Re-anchor Q&A: 165197
MERGE (qa_55:QA_Pair {id: '165197'})
MERGE (p_qa_55:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_55:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_55)-[:INTERPRETS]->(p_qa_55)
MERGE (qa_55)-[:ILLUSTRATES]->(lo_qa_55);

// Re-anchor Q&A: 165247
MERGE (qa_56:QA_Pair {id: '165247'})
MERGE (p_qa_56:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_56:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_56)-[:INTERPRETS]->(p_qa_56)
MERGE (qa_56)-[:ILLUSTRATES]->(lo_qa_56);

// Re-anchor Q&A: 164929
MERGE (qa_57:QA_Pair {id: '164929'})
MERGE (p_qa_57:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_57:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_57)-[:INTERPRETS]->(p_qa_57)
MERGE (qa_57)-[:ILLUSTRATES]->(lo_qa_57);

// Re-anchor Q&A: 164965
MERGE (qa_58:QA_Pair {id: '164965'})
MERGE (p_qa_58:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_58:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_58)-[:INTERPRETS]->(p_qa_58)
MERGE (qa_58)-[:ILLUSTRATES]->(lo_qa_58);

// Re-anchor Q&A: 165205
MERGE (qa_59:QA_Pair {id: '165205'})
MERGE (p_qa_59:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_59:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_59)-[:INTERPRETS]->(p_qa_59)
MERGE (qa_59)-[:ILLUSTRATES]->(lo_qa_59);

// Re-anchor Q&A: 164896
MERGE (qa_60:QA_Pair {id: '164896'})
MERGE (p_qa_60:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_60:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_60)-[:INTERPRETS]->(p_qa_60)
MERGE (qa_60)-[:ILLUSTRATES]->(lo_qa_60);

// Re-anchor Q&A: 164981
MERGE (qa_61:QA_Pair {id: '164981'})
MERGE (p_qa_61:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_61:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_61)-[:INTERPRETS]->(p_qa_61)
MERGE (qa_61)-[:ILLUSTRATES]->(lo_qa_61);

// Re-anchor Q&A: 164635
MERGE (qa_62:QA_Pair {id: '164635'})
MERGE (p_qa_62:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_62:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_62)-[:INTERPRETS]->(p_qa_62)
MERGE (qa_62)-[:ILLUSTRATES]->(lo_qa_62);

// Re-anchor Q&A: 164414
MERGE (qa_63:QA_Pair {id: '164414'})
MERGE (p_qa_63:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_63:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_63)-[:INTERPRETS]->(p_qa_63)
MERGE (qa_63)-[:ILLUSTRATES]->(lo_qa_63);

// Re-anchor Q&A: 164937
MERGE (qa_64:QA_Pair {id: '164937'})
MERGE (p_qa_64:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_64:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_64)-[:INTERPRETS]->(p_qa_64)
MERGE (qa_64)-[:ILLUSTRATES]->(lo_qa_64);

// Re-anchor Q&A: 164983
MERGE (qa_65:QA_Pair {id: '164983'})
MERGE (p_qa_65:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_65:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_65)-[:INTERPRETS]->(p_qa_65)
MERGE (qa_65)-[:ILLUSTRATES]->(lo_qa_65);

// Re-anchor Q&A: 164855
MERGE (qa_66:QA_Pair {id: '164855'})
MERGE (p_qa_66:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_66:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_66)-[:INTERPRETS]->(p_qa_66)
MERGE (qa_66)-[:ILLUSTRATES]->(lo_qa_66);

// Re-anchor Q&A: 164880
MERGE (qa_67:QA_Pair {id: '164880'})
MERGE (p_qa_67:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_67:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_67)-[:INTERPRETS]->(p_qa_67)
MERGE (qa_67)-[:ILLUSTRATES]->(lo_qa_67);

// Re-anchor Q&A: 164907
MERGE (qa_68:QA_Pair {id: '164907'})
MERGE (p_qa_68:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_68:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_68)-[:INTERPRETS]->(p_qa_68)
MERGE (qa_68)-[:ILLUSTRATES]->(lo_qa_68);

// Re-anchor Q&A: 164975
MERGE (qa_69:QA_Pair {id: '164975'})
MERGE (p_qa_69:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_69:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_69)-[:INTERPRETS]->(p_qa_69)
MERGE (qa_69)-[:ILLUSTRATES]->(lo_qa_69);

// Re-anchor Q&A: 164954
MERGE (qa_70:QA_Pair {id: '164954'})
MERGE (p_qa_70:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_70:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_70)-[:INTERPRETS]->(p_qa_70)
MERGE (qa_70)-[:ILLUSTRATES]->(lo_qa_70);

// Re-anchor Q&A: 158752
MERGE (qa_71:QA_Pair {id: '158752'})
MERGE (p_qa_71:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_71:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_71)-[:INTERPRETS]->(p_qa_71)
MERGE (qa_71)-[:ILLUSTRATES]->(lo_qa_71);

// Re-anchor Q&A: 163499
MERGE (qa_72:QA_Pair {id: '163499'})
MERGE (p_qa_72:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_72:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_72)-[:INTERPRETS]->(p_qa_72)
MERGE (qa_72)-[:ILLUSTRATES]->(lo_qa_72);

// Re-anchor Q&A: 164074
MERGE (qa_73:QA_Pair {id: '164074'})
MERGE (p_qa_73:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_73:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_73)-[:INTERPRETS]->(p_qa_73)
MERGE (qa_73)-[:ILLUSTRATES]->(lo_qa_73);

// Re-anchor Q&A: 159128
MERGE (qa_74:QA_Pair {id: '159128'})
MERGE (p_qa_74:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_74:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_74)-[:INTERPRETS]->(p_qa_74)
MERGE (qa_74)-[:ILLUSTRATES]->(lo_qa_74);

// Re-anchor Q&A: 164428
MERGE (qa_75:QA_Pair {id: '164428'})
MERGE (p_qa_75:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_75:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_75)-[:INTERPRETS]->(p_qa_75)
MERGE (qa_75)-[:ILLUSTRATES]->(lo_qa_75);

// Re-anchor Q&A: 164813
MERGE (qa_76:QA_Pair {id: '164813'})
MERGE (p_qa_76:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_76:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_76)-[:INTERPRETS]->(p_qa_76)
MERGE (qa_76)-[:ILLUSTRATES]->(lo_qa_76);

// Re-anchor Q&A: 163427
MERGE (qa_77:QA_Pair {id: '163427'})
MERGE (p_qa_77:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_77:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_77)-[:INTERPRETS]->(p_qa_77)
MERGE (qa_77)-[:ILLUSTRATES]->(lo_qa_77);

// Re-anchor Q&A: 164650
MERGE (qa_78:QA_Pair {id: '164650'})
MERGE (p_qa_78:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_78:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_78)-[:INTERPRETS]->(p_qa_78)
MERGE (qa_78)-[:ILLUSTRATES]->(lo_qa_78);

// Re-anchor Q&A: 164717
MERGE (qa_79:QA_Pair {id: '164717'})
MERGE (p_qa_79:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_79:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_79)-[:INTERPRETS]->(p_qa_79)
MERGE (qa_79)-[:ILLUSTRATES]->(lo_qa_79);

// Re-anchor Q&A: 164874
MERGE (qa_80:QA_Pair {id: '164874'})
MERGE (p_qa_80:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_80:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_80)-[:INTERPRETS]->(p_qa_80)
MERGE (qa_80)-[:ILLUSTRATES]->(lo_qa_80);

// Re-anchor Q&A: 164679
MERGE (qa_81:QA_Pair {id: '164679'})
MERGE (p_qa_81:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_81:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_81)-[:INTERPRETS]->(p_qa_81)
MERGE (qa_81)-[:ILLUSTRATES]->(lo_qa_81);

// Re-anchor Q&A: 164906
MERGE (qa_82:QA_Pair {id: '164906'})
MERGE (p_qa_82:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_82:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_82)-[:INTERPRETS]->(p_qa_82)
MERGE (qa_82)-[:ILLUSTRATES]->(lo_qa_82);

// Re-anchor Q&A: 164756
MERGE (qa_83:QA_Pair {id: '164756'})
MERGE (p_qa_83:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_83:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_83)-[:INTERPRETS]->(p_qa_83)
MERGE (qa_83)-[:ILLUSTRATES]->(lo_qa_83);

// Re-anchor Q&A: 164804
MERGE (qa_84:QA_Pair {id: '164804'})
MERGE (p_qa_84:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_84:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_84)-[:INTERPRETS]->(p_qa_84)
MERGE (qa_84)-[:ILLUSTRATES]->(lo_qa_84);

// Re-anchor Q&A: 164803
MERGE (qa_85:QA_Pair {id: '164803'})
MERGE (p_qa_85:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_85:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_85)-[:INTERPRETS]->(p_qa_85)
MERGE (qa_85)-[:ILLUSTRATES]->(lo_qa_85);

// Re-anchor Q&A: 164630
MERGE (qa_86:QA_Pair {id: '164630'})
MERGE (p_qa_86:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_86:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_86)-[:INTERPRETS]->(p_qa_86)
MERGE (qa_86)-[:ILLUSTRATES]->(lo_qa_86);

// Re-anchor Q&A: 164910
MERGE (qa_87:QA_Pair {id: '164910'})
MERGE (p_qa_87:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_87:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_87)-[:INTERPRETS]->(p_qa_87)
MERGE (qa_87)-[:ILLUSTRATES]->(lo_qa_87);

// Re-anchor Q&A: 164652
MERGE (qa_88:QA_Pair {id: '164652'})
MERGE (p_qa_88:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_88:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_88)-[:INTERPRETS]->(p_qa_88)
MERGE (qa_88)-[:ILLUSTRATES]->(lo_qa_88);

// Re-anchor Q&A: 163744
MERGE (qa_89:QA_Pair {id: '163744'})
MERGE (p_qa_89:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_89:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_89)-[:INTERPRETS]->(p_qa_89)
MERGE (qa_89)-[:ILLUSTRATES]->(lo_qa_89);

// Re-anchor Q&A: 164437
MERGE (qa_90:QA_Pair {id: '164437'})
MERGE (p_qa_90:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_90:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_90)-[:INTERPRETS]->(p_qa_90)
MERGE (qa_90)-[:ILLUSTRATES]->(lo_qa_90);

// Re-anchor Q&A: 163242
MERGE (qa_91:QA_Pair {id: '163242'})
MERGE (p_qa_91:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_91:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_91)-[:INTERPRETS]->(p_qa_91)
MERGE (qa_91)-[:ILLUSTRATES]->(lo_qa_91);

// Re-anchor Q&A: 164343
MERGE (qa_92:QA_Pair {id: '164343'})
MERGE (p_qa_92:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_92:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_92)-[:INTERPRETS]->(p_qa_92)
MERGE (qa_92)-[:ILLUSTRATES]->(lo_qa_92);

// Re-anchor Q&A: 164692
MERGE (qa_93:QA_Pair {id: '164692'})
MERGE (p_qa_93:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_93:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_93)-[:INTERPRETS]->(p_qa_93)
MERGE (qa_93)-[:ILLUSTRATES]->(lo_qa_93);

// Re-anchor Q&A: 160920
MERGE (qa_94:QA_Pair {id: '160920'})
MERGE (p_qa_94:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_94:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_94)-[:INTERPRETS]->(p_qa_94)
MERGE (qa_94)-[:ILLUSTRATES]->(lo_qa_94);

// Re-anchor Q&A: 159052
MERGE (qa_95:QA_Pair {id: '159052'})
MERGE (p_qa_95:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_95:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_95)-[:INTERPRETS]->(p_qa_95)
MERGE (qa_95)-[:ILLUSTRATES]->(lo_qa_95);

// Re-anchor Q&A: 164441
MERGE (qa_96:QA_Pair {id: '164441'})
MERGE (p_qa_96:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_96:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_96)-[:INTERPRETS]->(p_qa_96)
MERGE (qa_96)-[:ILLUSTRATES]->(lo_qa_96);

// Re-anchor Q&A: 164641
MERGE (qa_97:QA_Pair {id: '164641'})
MERGE (p_qa_97:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_97:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_97)-[:INTERPRETS]->(p_qa_97)
MERGE (qa_97)-[:ILLUSTRATES]->(lo_qa_97);

// Re-anchor Q&A: 163634
MERGE (qa_98:QA_Pair {id: '163634'})
MERGE (p_qa_98:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_98:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_98)-[:INTERPRETS]->(p_qa_98)
MERGE (qa_98)-[:ILLUSTRATES]->(lo_qa_98);

// Re-anchor Q&A: 164462
MERGE (qa_99:QA_Pair {id: '164462'})
MERGE (p_qa_99:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_99:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_99)-[:INTERPRETS]->(p_qa_99)
MERGE (qa_99)-[:ILLUSTRATES]->(lo_qa_99);

// Re-anchor Q&A: 164411
MERGE (qa_100:QA_Pair {id: '164411'})
MERGE (p_qa_100:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_100:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_100)-[:INTERPRETS]->(p_qa_100)
MERGE (qa_100)-[:ILLUSTRATES]->(lo_qa_100);

// Re-anchor Q&A: 164011
MERGE (qa_101:QA_Pair {id: '164011'})
MERGE (p_qa_101:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_101:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_101)-[:INTERPRETS]->(p_qa_101)
MERGE (qa_101)-[:ILLUSTRATES]->(lo_qa_101);

// Re-anchor Q&A: 164136
MERGE (qa_102:QA_Pair {id: '164136'})
MERGE (p_qa_102:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_102:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_102)-[:INTERPRETS]->(p_qa_102)
MERGE (qa_102)-[:ILLUSTRATES]->(lo_qa_102);

// Re-anchor Q&A: 164460
MERGE (qa_103:QA_Pair {id: '164460'})
MERGE (p_qa_103:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_103:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_103)-[:INTERPRETS]->(p_qa_103)
MERGE (qa_103)-[:ILLUSTRATES]->(lo_qa_103);

// Re-anchor Q&A: 161836
MERGE (qa_104:QA_Pair {id: '161836'})
MERGE (p_qa_104:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_104:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_104)-[:INTERPRETS]->(p_qa_104)
MERGE (qa_104)-[:ILLUSTRATES]->(lo_qa_104);

// Re-anchor Q&A: 164640
MERGE (qa_105:QA_Pair {id: '164640'})
MERGE (p_qa_105:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_105:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_105)-[:INTERPRETS]->(p_qa_105)
MERGE (qa_105)-[:ILLUSTRATES]->(lo_qa_105);

// Re-anchor Q&A: 163822
MERGE (qa_106:QA_Pair {id: '163822'})
MERGE (p_qa_106:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_106:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_106)-[:INTERPRETS]->(p_qa_106)
MERGE (qa_106)-[:ILLUSTRATES]->(lo_qa_106);

// Re-anchor Q&A: 163622
MERGE (qa_107:QA_Pair {id: '163622'})
MERGE (p_qa_107:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_107:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_107)-[:INTERPRETS]->(p_qa_107)
MERGE (qa_107)-[:ILLUSTRATES]->(lo_qa_107);

// Re-anchor Q&A: 163568
MERGE (qa_108:QA_Pair {id: '163568'})
MERGE (p_qa_108:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_108:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_108)-[:INTERPRETS]->(p_qa_108)
MERGE (qa_108)-[:ILLUSTRATES]->(lo_qa_108);

// Re-anchor Q&A: 164410
MERGE (qa_109:QA_Pair {id: '164410'})
MERGE (p_qa_109:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_109:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_109)-[:INTERPRETS]->(p_qa_109)
MERGE (qa_109)-[:ILLUSTRATES]->(lo_qa_109);

// Re-anchor Q&A: 164353
MERGE (qa_110:QA_Pair {id: '164353'})
MERGE (p_qa_110:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_110:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_110)-[:INTERPRETS]->(p_qa_110)
MERGE (qa_110)-[:ILLUSTRATES]->(lo_qa_110);

// Re-anchor Q&A: 164459
MERGE (qa_111:QA_Pair {id: '164459'})
MERGE (p_qa_111:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_111:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_111)-[:INTERPRETS]->(p_qa_111)
MERGE (qa_111)-[:ILLUSTRATES]->(lo_qa_111);

// Re-anchor Q&A: 163425
MERGE (qa_112:QA_Pair {id: '163425'})
MERGE (p_qa_112:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_112:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_112)-[:INTERPRETS]->(p_qa_112)
MERGE (qa_112)-[:ILLUSTRATES]->(lo_qa_112);

// Re-anchor Q&A: 161260
MERGE (qa_113:QA_Pair {id: '161260'})
MERGE (p_qa_113:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_113:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_113)-[:INTERPRETS]->(p_qa_113)
MERGE (qa_113)-[:ILLUSTRATES]->(lo_qa_113);

// Re-anchor Q&A: 163689
MERGE (qa_114:QA_Pair {id: '163689'})
MERGE (p_qa_114:LegalParagraph {id: 'PARA_L67_D9'})
MERGE (lo_qa_114:Atomic_LO {id: 'LO_CIT_DEDUCTIBLE_EXPENSE_RULE'})
MERGE (qa_114)-[:INTERPRETS]->(p_qa_114)
MERGE (qa_114)-[:ILLUSTRATES]->(lo_qa_114);

// Re-anchor Q&A: 162944
MERGE (qa_115:QA_Pair {id: '162944'})
MERGE (p_qa_115:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_115:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_115)-[:INTERPRETS]->(p_qa_115)
MERGE (qa_115)-[:ILLUSTRATES]->(lo_qa_115);

// Re-anchor Q&A: 163684
MERGE (qa_116:QA_Pair {id: '163684'})
MERGE (p_qa_116:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_116:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_116)-[:INTERPRETS]->(p_qa_116)
MERGE (qa_116)-[:ILLUSTRATES]->(lo_qa_116);

// Re-anchor Q&A: 163241
MERGE (qa_117:QA_Pair {id: '163241'})
MERGE (p_qa_117:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_117:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_117)-[:INTERPRETS]->(p_qa_117)
MERGE (qa_117)-[:ILLUSTRATES]->(lo_qa_117);

// Re-anchor Q&A: 163406
MERGE (qa_118:QA_Pair {id: '163406'})
MERGE (p_qa_118:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_118:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_118)-[:INTERPRETS]->(p_qa_118)
MERGE (qa_118)-[:ILLUSTRATES]->(lo_qa_118);

// Re-anchor Q&A: 164328
MERGE (qa_119:QA_Pair {id: '164328'})
MERGE (p_qa_119:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_119:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_119)-[:INTERPRETS]->(p_qa_119)
MERGE (qa_119)-[:ILLUSTRATES]->(lo_qa_119);

// Re-anchor Q&A: 161675
MERGE (qa_120:QA_Pair {id: '161675'})
MERGE (p_qa_120:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_120:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_120)-[:INTERPRETS]->(p_qa_120)
MERGE (qa_120)-[:ILLUSTRATES]->(lo_qa_120);

// Re-anchor Q&A: 163024
MERGE (qa_121:QA_Pair {id: '163024'})
MERGE (p_qa_121:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_121:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_121)-[:INTERPRETS]->(p_qa_121)
MERGE (qa_121)-[:ILLUSTRATES]->(lo_qa_121);

// Re-anchor Q&A: 163397
MERGE (qa_122:QA_Pair {id: '163397'})
MERGE (p_qa_122:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_122:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_122)-[:INTERPRETS]->(p_qa_122)
MERGE (qa_122)-[:ILLUSTRATES]->(lo_qa_122);

// Re-anchor Q&A: 163997
MERGE (qa_123:QA_Pair {id: '163997'})
MERGE (p_qa_123:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_123:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_123)-[:INTERPRETS]->(p_qa_123)
MERGE (qa_123)-[:ILLUSTRATES]->(lo_qa_123);

// Re-anchor Q&A: 163942
MERGE (qa_124:QA_Pair {id: '163942'})
MERGE (p_qa_124:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_124:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_124)-[:INTERPRETS]->(p_qa_124)
MERGE (qa_124)-[:ILLUSTRATES]->(lo_qa_124);

// Re-anchor Q&A: 164415
MERGE (qa_125:QA_Pair {id: '164415'})
MERGE (p_qa_125:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_125:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_125)-[:INTERPRETS]->(p_qa_125)
MERGE (qa_125)-[:ILLUSTRATES]->(lo_qa_125);

// Re-anchor Q&A: 164102
MERGE (qa_126:QA_Pair {id: '164102'})
MERGE (p_qa_126:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_126:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_126)-[:INTERPRETS]->(p_qa_126)
MERGE (qa_126)-[:ILLUSTRATES]->(lo_qa_126);

// Re-anchor Q&A: 164302
MERGE (qa_127:QA_Pair {id: '164302'})
MERGE (p_qa_127:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_127:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_127)-[:INTERPRETS]->(p_qa_127)
MERGE (qa_127)-[:ILLUSTRATES]->(lo_qa_127);

// Re-anchor Q&A: 164306
MERGE (qa_128:QA_Pair {id: '164306'})
MERGE (p_qa_128:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_128:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_128)-[:INTERPRETS]->(p_qa_128)
MERGE (qa_128)-[:ILLUSTRATES]->(lo_qa_128);

// Re-anchor Q&A: 164148
MERGE (qa_129:QA_Pair {id: '164148'})
MERGE (p_qa_129:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_129:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_129)-[:INTERPRETS]->(p_qa_129)
MERGE (qa_129)-[:ILLUSTRATES]->(lo_qa_129);

// Re-anchor Q&A: 164046
MERGE (qa_130:QA_Pair {id: '164046'})
MERGE (p_qa_130:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_130:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_130)-[:INTERPRETS]->(p_qa_130)
MERGE (qa_130)-[:ILLUSTRATES]->(lo_qa_130);

// Re-anchor Q&A: 164458
MERGE (qa_131:QA_Pair {id: '164458'})
MERGE (p_qa_131:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_131:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_131)-[:INTERPRETS]->(p_qa_131)
MERGE (qa_131)-[:ILLUSTRATES]->(lo_qa_131);

// Re-anchor Q&A: 163693
MERGE (qa_132:QA_Pair {id: '163693'})
MERGE (p_qa_132:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_132:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_132)-[:INTERPRETS]->(p_qa_132)
MERGE (qa_132)-[:ILLUSTRATES]->(lo_qa_132);

// Re-anchor Q&A: 164442
MERGE (qa_133:QA_Pair {id: '164442'})
MERGE (p_qa_133:LegalParagraph {id: 'PARA_L67_D9'})
MERGE (lo_qa_133:Atomic_LO {id: 'LO_CIT_DEDUCTIBLE_EXPENSE_RULE'})
MERGE (qa_133)-[:INTERPRETS]->(p_qa_133)
MERGE (qa_133)-[:ILLUSTRATES]->(lo_qa_133);

// Re-anchor Q&A: 164350
MERGE (qa_134:QA_Pair {id: '164350'})
MERGE (p_qa_134:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_134:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_134)-[:INTERPRETS]->(p_qa_134)
MERGE (qa_134)-[:ILLUSTRATES]->(lo_qa_134);

// Re-anchor Q&A: 163865
MERGE (qa_135:QA_Pair {id: '163865'})
MERGE (p_qa_135:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_135:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_135)-[:INTERPRETS]->(p_qa_135)
MERGE (qa_135)-[:ILLUSTRATES]->(lo_qa_135);

// Re-anchor Q&A: 164440
MERGE (qa_136:QA_Pair {id: '164440'})
MERGE (p_qa_136:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_136:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_136)-[:INTERPRETS]->(p_qa_136)
MERGE (qa_136)-[:ILLUSTRATES]->(lo_qa_136);

// Re-anchor Q&A: 163921
MERGE (qa_137:QA_Pair {id: '163921'})
MERGE (p_qa_137:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_137:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_137)-[:INTERPRETS]->(p_qa_137)
MERGE (qa_137)-[:ILLUSTRATES]->(lo_qa_137);

// Re-anchor Q&A: 164107
MERGE (qa_138:QA_Pair {id: '164107'})
MERGE (p_qa_138:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_138:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_138)-[:INTERPRETS]->(p_qa_138)
MERGE (qa_138)-[:ILLUSTRATES]->(lo_qa_138);

// Re-anchor Q&A: 163682
MERGE (qa_139:QA_Pair {id: '163682'})
MERGE (p_qa_139:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_139:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_139)-[:INTERPRETS]->(p_qa_139)
MERGE (qa_139)-[:ILLUSTRATES]->(lo_qa_139);

// Re-anchor Q&A: 162228
MERGE (qa_140:QA_Pair {id: '162228'})
MERGE (p_qa_140:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_140:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_140)-[:INTERPRETS]->(p_qa_140)
MERGE (qa_140)-[:ILLUSTRATES]->(lo_qa_140);

// Re-anchor Q&A: 163946
MERGE (qa_141:QA_Pair {id: '163946'})
MERGE (p_qa_141:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_141:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_141)-[:INTERPRETS]->(p_qa_141)
MERGE (qa_141)-[:ILLUSTRATES]->(lo_qa_141);

// Re-anchor Q&A: 164048
MERGE (qa_142:QA_Pair {id: '164048'})
MERGE (p_qa_142:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_142:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_142)-[:INTERPRETS]->(p_qa_142)
MERGE (qa_142)-[:ILLUSTRATES]->(lo_qa_142);

// Re-anchor Q&A: 164027
MERGE (qa_143:QA_Pair {id: '164027'})
MERGE (p_qa_143:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_143:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_143)-[:INTERPRETS]->(p_qa_143)
MERGE (qa_143)-[:ILLUSTRATES]->(lo_qa_143);

// Re-anchor Q&A: 161890
MERGE (qa_144:QA_Pair {id: '161890'})
MERGE (p_qa_144:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_144:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_144)-[:INTERPRETS]->(p_qa_144)
MERGE (qa_144)-[:ILLUSTRATES]->(lo_qa_144);

// Re-anchor Q&A: 163628
MERGE (qa_145:QA_Pair {id: '163628'})
MERGE (p_qa_145:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_145:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_145)-[:INTERPRETS]->(p_qa_145)
MERGE (qa_145)-[:ILLUSTRATES]->(lo_qa_145);

// Re-anchor Q&A: 163449
MERGE (qa_146:QA_Pair {id: '163449'})
MERGE (p_qa_146:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_146:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_146)-[:INTERPRETS]->(p_qa_146)
MERGE (qa_146)-[:ILLUSTRATES]->(lo_qa_146);

// Re-anchor Q&A: 163919
MERGE (qa_147:QA_Pair {id: '163919'})
MERGE (p_qa_147:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_147:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_147)-[:INTERPRETS]->(p_qa_147)
MERGE (qa_147)-[:ILLUSTRATES]->(lo_qa_147);

// Re-anchor Q&A: 162259
MERGE (qa_148:QA_Pair {id: '162259'})
MERGE (p_qa_148:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_148:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_148)-[:INTERPRETS]->(p_qa_148)
MERGE (qa_148)-[:ILLUSTRATES]->(lo_qa_148);

// Re-anchor Q&A: 162629
MERGE (qa_149:QA_Pair {id: '162629'})
MERGE (p_qa_149:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_149:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_149)-[:INTERPRETS]->(p_qa_149)
MERGE (qa_149)-[:ILLUSTRATES]->(lo_qa_149);

// Re-anchor Q&A: 164050
MERGE (qa_150:QA_Pair {id: '164050'})
MERGE (p_qa_150:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_150:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_150)-[:INTERPRETS]->(p_qa_150)
MERGE (qa_150)-[:ILLUSTRATES]->(lo_qa_150);

// Re-anchor Q&A: 164099
MERGE (qa_151:QA_Pair {id: '164099'})
MERGE (p_qa_151:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_151:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_151)-[:INTERPRETS]->(p_qa_151)
MERGE (qa_151)-[:ILLUSTRATES]->(lo_qa_151);

// Re-anchor Q&A: 164150
MERGE (qa_152:QA_Pair {id: '164150'})
MERGE (p_qa_152:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_152:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_152)-[:INTERPRETS]->(p_qa_152)
MERGE (qa_152)-[:ILLUSTRATES]->(lo_qa_152);

// Re-anchor Q&A: 161079
MERGE (qa_153:QA_Pair {id: '161079'})
MERGE (p_qa_153:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_153:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_153)-[:INTERPRETS]->(p_qa_153)
MERGE (qa_153)-[:ILLUSTRATES]->(lo_qa_153);

// Re-anchor Q&A: 163994
MERGE (qa_154:QA_Pair {id: '163994'})
MERGE (p_qa_154:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_154:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_154)-[:INTERPRETS]->(p_qa_154)
MERGE (qa_154)-[:ILLUSTRATES]->(lo_qa_154);

// Re-anchor Q&A: 163090
MERGE (qa_155:QA_Pair {id: '163090'})
MERGE (p_qa_155:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_155:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_155)-[:INTERPRETS]->(p_qa_155)
MERGE (qa_155)-[:ILLUSTRATES]->(lo_qa_155);

// Re-anchor Q&A: 163926
MERGE (qa_156:QA_Pair {id: '163926'})
MERGE (p_qa_156:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_156:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_156)-[:INTERPRETS]->(p_qa_156)
MERGE (qa_156)-[:ILLUSTRATES]->(lo_qa_156);

// Re-anchor Q&A: 160575
MERGE (qa_157:QA_Pair {id: '160575'})
MERGE (p_qa_157:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_157:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_157)-[:INTERPRETS]->(p_qa_157)
MERGE (qa_157)-[:ILLUSTRATES]->(lo_qa_157);

// Re-anchor Q&A: 158410
MERGE (qa_158:QA_Pair {id: '158410'})
MERGE (p_qa_158:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_158:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_158)-[:INTERPRETS]->(p_qa_158)
MERGE (qa_158)-[:ILLUSTRATES]->(lo_qa_158);

// Re-anchor Q&A: 163447
MERGE (qa_159:QA_Pair {id: '163447'})
MERGE (p_qa_159:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_159:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_159)-[:INTERPRETS]->(p_qa_159)
MERGE (qa_159)-[:ILLUSTRATES]->(lo_qa_159);

// Re-anchor Q&A: 157648
MERGE (qa_160:QA_Pair {id: '157648'})
MERGE (p_qa_160:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_160:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_160)-[:INTERPRETS]->(p_qa_160)
MERGE (qa_160)-[:ILLUSTRATES]->(lo_qa_160);

// Re-anchor Q&A: 161219
MERGE (qa_161:QA_Pair {id: '161219'})
MERGE (p_qa_161:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_161:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_161)-[:INTERPRETS]->(p_qa_161)
MERGE (qa_161)-[:ILLUSTRATES]->(lo_qa_161);

// Re-anchor Q&A: 163419
MERGE (qa_162:QA_Pair {id: '163419'})
MERGE (p_qa_162:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_162:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_162)-[:INTERPRETS]->(p_qa_162)
MERGE (qa_162)-[:ILLUSTRATES]->(lo_qa_162);

// Re-anchor Q&A: 164055
MERGE (qa_163:QA_Pair {id: '164055'})
MERGE (p_qa_163:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_163:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_163)-[:INTERPRETS]->(p_qa_163)
MERGE (qa_163)-[:ILLUSTRATES]->(lo_qa_163);

// Re-anchor Q&A: 163470
MERGE (qa_164:QA_Pair {id: '163470'})
MERGE (p_qa_164:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_164:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_164)-[:INTERPRETS]->(p_qa_164)
MERGE (qa_164)-[:ILLUSTRATES]->(lo_qa_164);

// Re-anchor Q&A: 156718
MERGE (qa_165:QA_Pair {id: '156718'})
MERGE (p_qa_165:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_165:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_165)-[:INTERPRETS]->(p_qa_165)
MERGE (qa_165)-[:ILLUSTRATES]->(lo_qa_165);

// Re-anchor Q&A: 157924
MERGE (qa_166:QA_Pair {id: '157924'})
MERGE (p_qa_166:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_166:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_166)-[:INTERPRETS]->(p_qa_166)
MERGE (qa_166)-[:ILLUSTRATES]->(lo_qa_166);

// Re-anchor Q&A: 157102
MERGE (qa_167:QA_Pair {id: '157102'})
MERGE (p_qa_167:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_167:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_167)-[:INTERPRETS]->(p_qa_167)
MERGE (qa_167)-[:ILLUSTRATES]->(lo_qa_167);

// Re-anchor Q&A: 157928
MERGE (qa_168:QA_Pair {id: '157928'})
MERGE (p_qa_168:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_168:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_168)-[:INTERPRETS]->(p_qa_168)
MERGE (qa_168)-[:ILLUSTRATES]->(lo_qa_168);

// Re-anchor Q&A: 156270
MERGE (qa_169:QA_Pair {id: '156270'})
MERGE (p_qa_169:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_169:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_169)-[:INTERPRETS]->(p_qa_169)
MERGE (qa_169)-[:ILLUSTRATES]->(lo_qa_169);

// Re-anchor Q&A: 162694
MERGE (qa_170:QA_Pair {id: '162694'})
MERGE (p_qa_170:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_170:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_170)-[:INTERPRETS]->(p_qa_170)
MERGE (qa_170)-[:ILLUSTRATES]->(lo_qa_170);

// Re-anchor Q&A: 164073
MERGE (qa_171:QA_Pair {id: '164073'})
MERGE (p_qa_171:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_171:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_171)-[:INTERPRETS]->(p_qa_171)
MERGE (qa_171)-[:ILLUSTRATES]->(lo_qa_171);

// Re-anchor Q&A: 163418
MERGE (qa_172:QA_Pair {id: '163418'})
MERGE (p_qa_172:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_172:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_172)-[:INTERPRETS]->(p_qa_172)
MERGE (qa_172)-[:ILLUSTRATES]->(lo_qa_172);

// Re-anchor Q&A: 163210
MERGE (qa_173:QA_Pair {id: '163210'})
MERGE (p_qa_173:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_173:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_173)-[:INTERPRETS]->(p_qa_173)
MERGE (qa_173)-[:ILLUSTRATES]->(lo_qa_173);

// Re-anchor Q&A: 158666
MERGE (qa_174:QA_Pair {id: '158666'})
MERGE (p_qa_174:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_174:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_174)-[:INTERPRETS]->(p_qa_174)
MERGE (qa_174)-[:ILLUSTRATES]->(lo_qa_174);

// Re-anchor Q&A: 157628
MERGE (qa_175:QA_Pair {id: '157628'})
MERGE (p_qa_175:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_175:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_175)-[:INTERPRETS]->(p_qa_175)
MERGE (qa_175)-[:ILLUSTRATES]->(lo_qa_175);

// Re-anchor Q&A: 163176
MERGE (qa_176:QA_Pair {id: '163176'})
MERGE (p_qa_176:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_176:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_176)-[:INTERPRETS]->(p_qa_176)
MERGE (qa_176)-[:ILLUSTRATES]->(lo_qa_176);

// Re-anchor Q&A: 163099
MERGE (qa_177:QA_Pair {id: '163099'})
MERGE (p_qa_177:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_177:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_177)-[:INTERPRETS]->(p_qa_177)
MERGE (qa_177)-[:ILLUSTRATES]->(lo_qa_177);

// Re-anchor Q&A: 164009
MERGE (qa_178:QA_Pair {id: '164009'})
MERGE (p_qa_178:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_178:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_178)-[:INTERPRETS]->(p_qa_178)
MERGE (qa_178)-[:ILLUSTRATES]->(lo_qa_178);

// Re-anchor Q&A: 162958
MERGE (qa_179:QA_Pair {id: '162958'})
MERGE (p_qa_179:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_179:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_179)-[:INTERPRETS]->(p_qa_179)
MERGE (qa_179)-[:ILLUSTRATES]->(lo_qa_179);

// Re-anchor Q&A: 160147
MERGE (qa_180:QA_Pair {id: '160147'})
MERGE (p_qa_180:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_180:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_180)-[:INTERPRETS]->(p_qa_180)
MERGE (qa_180)-[:ILLUSTRATES]->(lo_qa_180);

// Re-anchor Q&A: 163784
MERGE (qa_181:QA_Pair {id: '163784'})
MERGE (p_qa_181:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_181:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_181)-[:INTERPRETS]->(p_qa_181)
MERGE (qa_181)-[:ILLUSTRATES]->(lo_qa_181);

// Re-anchor Q&A: 163862
MERGE (qa_182:QA_Pair {id: '163862'})
MERGE (p_qa_182:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_182:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_182)-[:INTERPRETS]->(p_qa_182)
MERGE (qa_182)-[:ILLUSTRATES]->(lo_qa_182);

// Re-anchor Q&A: 164026
MERGE (qa_183:QA_Pair {id: '164026'})
MERGE (p_qa_183:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_183:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_183)-[:INTERPRETS]->(p_qa_183)
MERGE (qa_183)-[:ILLUSTRATES]->(lo_qa_183);

// Re-anchor Q&A: 163991
MERGE (qa_184:QA_Pair {id: '163991'})
MERGE (p_qa_184:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_184:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_184)-[:INTERPRETS]->(p_qa_184)
MERGE (qa_184)-[:ILLUSTRATES]->(lo_qa_184);

// Re-anchor Q&A: 163535
MERGE (qa_185:QA_Pair {id: '163535'})
MERGE (p_qa_185:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_185:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_185)-[:INTERPRETS]->(p_qa_185)
MERGE (qa_185)-[:ILLUSTRATES]->(lo_qa_185);

// Re-anchor Q&A: 163867
MERGE (qa_186:QA_Pair {id: '163867'})
MERGE (p_qa_186:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_186:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_186)-[:INTERPRETS]->(p_qa_186)
MERGE (qa_186)-[:ILLUSTRATES]->(lo_qa_186);

// Re-anchor Q&A: 163522
MERGE (qa_187:QA_Pair {id: '163522'})
MERGE (p_qa_187:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_187:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_187)-[:INTERPRETS]->(p_qa_187)
MERGE (qa_187)-[:ILLUSTRATES]->(lo_qa_187);

// Re-anchor Q&A: 163917
MERGE (qa_188:QA_Pair {id: '163917'})
MERGE (p_qa_188:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_188:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_188)-[:INTERPRETS]->(p_qa_188)
MERGE (qa_188)-[:ILLUSTRATES]->(lo_qa_188);

// Re-anchor Q&A: 163907
MERGE (qa_189:QA_Pair {id: '163907'})
MERGE (p_qa_189:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_189:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_189)-[:INTERPRETS]->(p_qa_189)
MERGE (qa_189)-[:ILLUSTRATES]->(lo_qa_189);

// Re-anchor Q&A: 163703
MERGE (qa_190:QA_Pair {id: '163703'})
MERGE (p_qa_190:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_190:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_190)-[:INTERPRETS]->(p_qa_190)
MERGE (qa_190)-[:ILLUSTRATES]->(lo_qa_190);

// Re-anchor Q&A: 163908
MERGE (qa_191:QA_Pair {id: '163908'})
MERGE (p_qa_191:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_191:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_191)-[:INTERPRETS]->(p_qa_191)
MERGE (qa_191)-[:ILLUSTRATES]->(lo_qa_191);

// Re-anchor Q&A: 163780
MERGE (qa_192:QA_Pair {id: '163780'})
MERGE (p_qa_192:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_192:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_192)-[:INTERPRETS]->(p_qa_192)
MERGE (qa_192)-[:ILLUSTRATES]->(lo_qa_192);

// Re-anchor Q&A: 163496
MERGE (qa_193:QA_Pair {id: '163496'})
MERGE (p_qa_193:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_193:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_193)-[:INTERPRETS]->(p_qa_193)
MERGE (qa_193)-[:ILLUSTRATES]->(lo_qa_193);

// Re-anchor Q&A: 163687
MERGE (qa_194:QA_Pair {id: '163687'})
MERGE (p_qa_194:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_194:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_194)-[:INTERPRETS]->(p_qa_194)
MERGE (qa_194)-[:ILLUSTRATES]->(lo_qa_194);

// Re-anchor Q&A: 163922
MERGE (qa_195:QA_Pair {id: '163922'})
MERGE (p_qa_195:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_195:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_195)-[:INTERPRETS]->(p_qa_195)
MERGE (qa_195)-[:ILLUSTRATES]->(lo_qa_195);

// Re-anchor Q&A: 163557
MERGE (qa_196:QA_Pair {id: '163557'})
MERGE (p_qa_196:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_196:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_196)-[:INTERPRETS]->(p_qa_196)
MERGE (qa_196)-[:ILLUSTRATES]->(lo_qa_196);

// Re-anchor Q&A: 163531
MERGE (qa_197:QA_Pair {id: '163531'})
MERGE (p_qa_197:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_197:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_197)-[:INTERPRETS]->(p_qa_197)
MERGE (qa_197)-[:ILLUSTRATES]->(lo_qa_197);

// Re-anchor Q&A: 163965
MERGE (qa_198:QA_Pair {id: '163965'})
MERGE (p_qa_198:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_198:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_198)-[:INTERPRETS]->(p_qa_198)
MERGE (qa_198)-[:ILLUSTRATES]->(lo_qa_198);

// Re-anchor Q&A: 163272
MERGE (qa_199:QA_Pair {id: '163272'})
MERGE (p_qa_199:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_199:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_199)-[:INTERPRETS]->(p_qa_199)
MERGE (qa_199)-[:ILLUSTRATES]->(lo_qa_199);

// Re-anchor Q&A: 163337
MERGE (qa_200:QA_Pair {id: '163337'})
MERGE (p_qa_200:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_200:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_200)-[:INTERPRETS]->(p_qa_200)
MERGE (qa_200)-[:ILLUSTRATES]->(lo_qa_200);

// Re-anchor Q&A: 163860
MERGE (qa_201:QA_Pair {id: '163860'})
MERGE (p_qa_201:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_201:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_201)-[:INTERPRETS]->(p_qa_201)
MERGE (qa_201)-[:ILLUSTRATES]->(lo_qa_201);

// Re-anchor Q&A: 163686
MERGE (qa_202:QA_Pair {id: '163686'})
MERGE (p_qa_202:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_202:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_202)-[:INTERPRETS]->(p_qa_202)
MERGE (qa_202)-[:ILLUSTRATES]->(lo_qa_202);

// Re-anchor Q&A: 163300
MERGE (qa_203:QA_Pair {id: '163300'})
MERGE (p_qa_203:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_203:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_203)-[:INTERPRETS]->(p_qa_203)
MERGE (qa_203)-[:ILLUSTRATES]->(lo_qa_203);

// Re-anchor Q&A: 163690
MERGE (qa_204:QA_Pair {id: '163690'})
MERGE (p_qa_204:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_204:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_204)-[:INTERPRETS]->(p_qa_204)
MERGE (qa_204)-[:ILLUSTRATES]->(lo_qa_204);

// Re-anchor Q&A: 163422
MERGE (qa_205:QA_Pair {id: '163422'})
MERGE (p_qa_205:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_205:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_205)-[:INTERPRETS]->(p_qa_205)
MERGE (qa_205)-[:ILLUSTRATES]->(lo_qa_205);

// Re-anchor Q&A: 164035
MERGE (qa_206:QA_Pair {id: '164035'})
MERGE (p_qa_206:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_206:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_206)-[:INTERPRETS]->(p_qa_206)
MERGE (qa_206)-[:ILLUSTRATES]->(lo_qa_206);

// Re-anchor Q&A: 163858
MERGE (qa_207:QA_Pair {id: '163858'})
MERGE (p_qa_207:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_207:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_207)-[:INTERPRETS]->(p_qa_207)
MERGE (qa_207)-[:ILLUSTRATES]->(lo_qa_207);

// Re-anchor Q&A: 163779
MERGE (qa_208:QA_Pair {id: '163779'})
MERGE (p_qa_208:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_208:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_208)-[:INTERPRETS]->(p_qa_208)
MERGE (qa_208)-[:ILLUSTRATES]->(lo_qa_208);

// Re-anchor Q&A: 163702
MERGE (qa_209:QA_Pair {id: '163702'})
MERGE (p_qa_209:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_209:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_209)-[:INTERPRETS]->(p_qa_209)
MERGE (qa_209)-[:ILLUSTRATES]->(lo_qa_209);

// Re-anchor Q&A: 162871
MERGE (qa_210:QA_Pair {id: '162871'})
MERGE (p_qa_210:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_210:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_210)-[:INTERPRETS]->(p_qa_210)
MERGE (qa_210)-[:ILLUSTRATES]->(lo_qa_210);

// Re-anchor Q&A: 163570
MERGE (qa_211:QA_Pair {id: '163570'})
MERGE (p_qa_211:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_211:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_211)-[:INTERPRETS]->(p_qa_211)
MERGE (qa_211)-[:ILLUSTRATES]->(lo_qa_211);

// Re-anchor Q&A: 162984
MERGE (qa_212:QA_Pair {id: '162984'})
MERGE (p_qa_212:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_212:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_212)-[:INTERPRETS]->(p_qa_212)
MERGE (qa_212)-[:ILLUSTRATES]->(lo_qa_212);

// Re-anchor Q&A: 163777
MERGE (qa_213:QA_Pair {id: '163777'})
MERGE (p_qa_213:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_213:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_213)-[:INTERPRETS]->(p_qa_213)
MERGE (qa_213)-[:ILLUSTRATES]->(lo_qa_213);

// Re-anchor Q&A: 158918
MERGE (qa_214:QA_Pair {id: '158918'})
MERGE (p_qa_214:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_214:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_214)-[:INTERPRETS]->(p_qa_214)
MERGE (qa_214)-[:ILLUSTRATES]->(lo_qa_214);

// Re-anchor Q&A: 162182
MERGE (qa_215:QA_Pair {id: '162182'})
MERGE (p_qa_215:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_215:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_215)-[:INTERPRETS]->(p_qa_215)
MERGE (qa_215)-[:ILLUSTRATES]->(lo_qa_215);

// Re-anchor Q&A: 162646
MERGE (qa_216:QA_Pair {id: '162646'})
MERGE (p_qa_216:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_216:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_216)-[:INTERPRETS]->(p_qa_216)
MERGE (qa_216)-[:ILLUSTRATES]->(lo_qa_216);

// Re-anchor Q&A: 162089
MERGE (qa_217:QA_Pair {id: '162089'})
MERGE (p_qa_217:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_217:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_217)-[:INTERPRETS]->(p_qa_217)
MERGE (qa_217)-[:ILLUSTRATES]->(lo_qa_217);

// Re-anchor Q&A: 162842
MERGE (qa_218:QA_Pair {id: '162842'})
MERGE (p_qa_218:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_218:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_218)-[:INTERPRETS]->(p_qa_218)
MERGE (qa_218)-[:ILLUSTRATES]->(lo_qa_218);

// Re-anchor Q&A: 163199
MERGE (qa_219:QA_Pair {id: '163199'})
MERGE (p_qa_219:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_219:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_219)-[:INTERPRETS]->(p_qa_219)
MERGE (qa_219)-[:ILLUSTRATES]->(lo_qa_219);

// Re-anchor Q&A: 163924
MERGE (qa_220:QA_Pair {id: '163924'})
MERGE (p_qa_220:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_220:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_220)-[:INTERPRETS]->(p_qa_220)
MERGE (qa_220)-[:ILLUSTRATES]->(lo_qa_220);

// Re-anchor Q&A: 161407
MERGE (qa_221:QA_Pair {id: '161407'})
MERGE (p_qa_221:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_221:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_221)-[:INTERPRETS]->(p_qa_221)
MERGE (qa_221)-[:ILLUSTRATES]->(lo_qa_221);

// Re-anchor Q&A: 161873
MERGE (qa_222:QA_Pair {id: '161873'})
MERGE (p_qa_222:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_222:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_222)-[:INTERPRETS]->(p_qa_222)
MERGE (qa_222)-[:ILLUSTRATES]->(lo_qa_222);

// Re-anchor Q&A: 163760
MERGE (qa_223:QA_Pair {id: '163760'})
MERGE (p_qa_223:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_223:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_223)-[:INTERPRETS]->(p_qa_223)
MERGE (qa_223)-[:ILLUSTRATES]->(lo_qa_223);

// Re-anchor Q&A: 163215
MERGE (qa_224:QA_Pair {id: '163215'})
MERGE (p_qa_224:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_224:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_224)-[:INTERPRETS]->(p_qa_224)
MERGE (qa_224)-[:ILLUSTRATES]->(lo_qa_224);

// Re-anchor Q&A: 161874
MERGE (qa_225:QA_Pair {id: '161874'})
MERGE (p_qa_225:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_225:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_225)-[:INTERPRETS]->(p_qa_225)
MERGE (qa_225)-[:ILLUSTRATES]->(lo_qa_225);

// Re-anchor Q&A: 162039
MERGE (qa_226:QA_Pair {id: '162039'})
MERGE (p_qa_226:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_226:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_226)-[:INTERPRETS]->(p_qa_226)
MERGE (qa_226)-[:ILLUSTRATES]->(lo_qa_226);

// Re-anchor Q&A: 162496
MERGE (qa_227:QA_Pair {id: '162496'})
MERGE (p_qa_227:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_227:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_227)-[:INTERPRETS]->(p_qa_227)
MERGE (qa_227)-[:ILLUSTRATES]->(lo_qa_227);

// Re-anchor Q&A: 163633
MERGE (qa_228:QA_Pair {id: '163633'})
MERGE (p_qa_228:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_228:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_228)-[:INTERPRETS]->(p_qa_228)
MERGE (qa_228)-[:ILLUSTRATES]->(lo_qa_228);

// Re-anchor Q&A: 163701
MERGE (qa_229:QA_Pair {id: '163701'})
MERGE (p_qa_229:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_229:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_229)-[:INTERPRETS]->(p_qa_229)
MERGE (qa_229)-[:ILLUSTRATES]->(lo_qa_229);

// Re-anchor Q&A: 163289
MERGE (qa_230:QA_Pair {id: '163289'})
MERGE (p_qa_230:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_230:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_230)-[:INTERPRETS]->(p_qa_230)
MERGE (qa_230)-[:ILLUSTRATES]->(lo_qa_230);

// Re-anchor Q&A: 163547
MERGE (qa_231:QA_Pair {id: '163547'})
MERGE (p_qa_231:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_231:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_231)-[:INTERPRETS]->(p_qa_231)
MERGE (qa_231)-[:ILLUSTRATES]->(lo_qa_231);

// Re-anchor Q&A: 163713
MERGE (qa_232:QA_Pair {id: '163713'})
MERGE (p_qa_232:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_232:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_232)-[:INTERPRETS]->(p_qa_232)
MERGE (qa_232)-[:ILLUSTRATES]->(lo_qa_232);

// Re-anchor Q&A: 163564
MERGE (qa_233:QA_Pair {id: '163564'})
MERGE (p_qa_233:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_233:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_233)-[:INTERPRETS]->(p_qa_233)
MERGE (qa_233)-[:ILLUSTRATES]->(lo_qa_233);

// Re-anchor Q&A: 162069
MERGE (qa_234:QA_Pair {id: '162069'})
MERGE (p_qa_234:LegalParagraph {id: 'PARA_L67_D9'})
MERGE (lo_qa_234:Atomic_LO {id: 'LO_CIT_DEDUCTIBLE_EXPENSE_RULE'})
MERGE (qa_234)-[:INTERPRETS]->(p_qa_234)
MERGE (qa_234)-[:ILLUSTRATES]->(lo_qa_234);

// Re-anchor Q&A: 160387
MERGE (qa_235:QA_Pair {id: '160387'})
MERGE (p_qa_235:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_235:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_235)-[:INTERPRETS]->(p_qa_235)
MERGE (qa_235)-[:ILLUSTRATES]->(lo_qa_235);

// Re-anchor Q&A: 162725
MERGE (qa_236:QA_Pair {id: '162725'})
MERGE (p_qa_236:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_236:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_236)-[:INTERPRETS]->(p_qa_236)
MERGE (qa_236)-[:ILLUSTRATES]->(lo_qa_236);

// Re-anchor Q&A: 163235
MERGE (qa_237:QA_Pair {id: '163235'})
MERGE (p_qa_237:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_237:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_237)-[:INTERPRETS]->(p_qa_237)
MERGE (qa_237)-[:ILLUSTRATES]->(lo_qa_237);

// Re-anchor Q&A: 161879
MERGE (qa_238:QA_Pair {id: '161879'})
MERGE (p_qa_238:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_238:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_238)-[:INTERPRETS]->(p_qa_238)
MERGE (qa_238)-[:ILLUSTRATES]->(lo_qa_238);

// Re-anchor Q&A: 160188
MERGE (qa_239:QA_Pair {id: '160188'})
MERGE (p_qa_239:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_239:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_239)-[:INTERPRETS]->(p_qa_239)
MERGE (qa_239)-[:ILLUSTRATES]->(lo_qa_239);

// Re-anchor Q&A: 162509
MERGE (qa_240:QA_Pair {id: '162509'})
MERGE (p_qa_240:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_240:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_240)-[:INTERPRETS]->(p_qa_240)
MERGE (qa_240)-[:ILLUSTRATES]->(lo_qa_240);

// Re-anchor Q&A: 163117
MERGE (qa_241:QA_Pair {id: '163117'})
MERGE (p_qa_241:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_241:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_241)-[:INTERPRETS]->(p_qa_241)
MERGE (qa_241)-[:ILLUSTRATES]->(lo_qa_241);

// Re-anchor Q&A: 163423
MERGE (qa_242:QA_Pair {id: '163423'})
MERGE (p_qa_242:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_242:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_242)-[:INTERPRETS]->(p_qa_242)
MERGE (qa_242)-[:ILLUSTRATES]->(lo_qa_242);

// Re-anchor Q&A: 163507
MERGE (qa_243:QA_Pair {id: '163507'})
MERGE (p_qa_243:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_243:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_243)-[:INTERPRETS]->(p_qa_243)
MERGE (qa_243)-[:ILLUSTRATES]->(lo_qa_243);

// Re-anchor Q&A: 163465
MERGE (qa_244:QA_Pair {id: '163465'})
MERGE (p_qa_244:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_244:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_244)-[:INTERPRETS]->(p_qa_244)
MERGE (qa_244)-[:ILLUSTRATES]->(lo_qa_244);

// Re-anchor Q&A: 163620
MERGE (qa_245:QA_Pair {id: '163620'})
MERGE (p_qa_245:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_245:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_245)-[:INTERPRETS]->(p_qa_245)
MERGE (qa_245)-[:ILLUSTRATES]->(lo_qa_245);

// Re-anchor Q&A: 163534
MERGE (qa_246:QA_Pair {id: '163534'})
MERGE (p_qa_246:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_246:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_246)-[:INTERPRETS]->(p_qa_246)
MERGE (qa_246)-[:ILLUSTRATES]->(lo_qa_246);

// Re-anchor Q&A: 163270
MERGE (qa_247:QA_Pair {id: '163270'})
MERGE (p_qa_247:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_247:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_247)-[:INTERPRETS]->(p_qa_247)
MERGE (qa_247)-[:ILLUSTRATES]->(lo_qa_247);

// Re-anchor Q&A: 163313
MERGE (qa_248:QA_Pair {id: '163313'})
MERGE (p_qa_248:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_248:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_248)-[:INTERPRETS]->(p_qa_248)
MERGE (qa_248)-[:ILLUSTRATES]->(lo_qa_248);

// Re-anchor Q&A: 158848
MERGE (qa_249:QA_Pair {id: '158848'})
MERGE (p_qa_249:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_249:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_249)-[:INTERPRETS]->(p_qa_249)
MERGE (qa_249)-[:ILLUSTRATES]->(lo_qa_249);

// Re-anchor Q&A: 162749
MERGE (qa_250:QA_Pair {id: '162749'})
MERGE (p_qa_250:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_250:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_250)-[:INTERPRETS]->(p_qa_250)
MERGE (qa_250)-[:ILLUSTRATES]->(lo_qa_250);

// Re-anchor Q&A: 163497
MERGE (qa_251:QA_Pair {id: '163497'})
MERGE (p_qa_251:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_251:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_251)-[:INTERPRETS]->(p_qa_251)
MERGE (qa_251)-[:ILLUSTRATES]->(lo_qa_251);

// Re-anchor Q&A: 163540
MERGE (qa_252:QA_Pair {id: '163540'})
MERGE (p_qa_252:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_252:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_252)-[:INTERPRETS]->(p_qa_252)
MERGE (qa_252)-[:ILLUSTRATES]->(lo_qa_252);

// Re-anchor Q&A: 163471
MERGE (qa_253:QA_Pair {id: '163471'})
MERGE (p_qa_253:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_253:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_253)-[:INTERPRETS]->(p_qa_253)
MERGE (qa_253)-[:ILLUSTRATES]->(lo_qa_253);

// Re-anchor Q&A: 163257
MERGE (qa_254:QA_Pair {id: '163257'})
MERGE (p_qa_254:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_254:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_254)-[:INTERPRETS]->(p_qa_254)
MERGE (qa_254)-[:ILLUSTRATES]->(lo_qa_254);

// Re-anchor Q&A: 162832
MERGE (qa_255:QA_Pair {id: '162832'})
MERGE (p_qa_255:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_255:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_255)-[:INTERPRETS]->(p_qa_255)
MERGE (qa_255)-[:ILLUSTRATES]->(lo_qa_255);

// Re-anchor Q&A: 163430
MERGE (qa_256:QA_Pair {id: '163430'})
MERGE (p_qa_256:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_256:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_256)-[:INTERPRETS]->(p_qa_256)
MERGE (qa_256)-[:ILLUSTRATES]->(lo_qa_256);

// Re-anchor Q&A: 163494
MERGE (qa_257:QA_Pair {id: '163494'})
MERGE (p_qa_257:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_257:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_257)-[:INTERPRETS]->(p_qa_257)
MERGE (qa_257)-[:ILLUSTRATES]->(lo_qa_257);

// Re-anchor Q&A: 163296
MERGE (qa_258:QA_Pair {id: '163296'})
MERGE (p_qa_258:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_258:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_258)-[:INTERPRETS]->(p_qa_258)
MERGE (qa_258)-[:ILLUSTRATES]->(lo_qa_258);

// Re-anchor Q&A: 163194
MERGE (qa_259:QA_Pair {id: '163194'})
MERGE (p_qa_259:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_259:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_259)-[:INTERPRETS]->(p_qa_259)
MERGE (qa_259)-[:ILLUSTRATES]->(lo_qa_259);

// Re-anchor Q&A: 163287
MERGE (qa_260:QA_Pair {id: '163287'})
MERGE (p_qa_260:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_260:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_260)-[:INTERPRETS]->(p_qa_260)
MERGE (qa_260)-[:ILLUSTRATES]->(lo_qa_260);

// Re-anchor Q&A: 163487
MERGE (qa_261:QA_Pair {id: '163487'})
MERGE (p_qa_261:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_261:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_261)-[:INTERPRETS]->(p_qa_261)
MERGE (qa_261)-[:ILLUSTRATES]->(lo_qa_261);

// Re-anchor Q&A: 163214
MERGE (qa_262:QA_Pair {id: '163214'})
MERGE (p_qa_262:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_262:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_262)-[:INTERPRETS]->(p_qa_262)
MERGE (qa_262)-[:ILLUSTRATES]->(lo_qa_262);

// Re-anchor Q&A: 163404
MERGE (qa_263:QA_Pair {id: '163404'})
MERGE (p_qa_263:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_263:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_263)-[:INTERPRETS]->(p_qa_263)
MERGE (qa_263)-[:ILLUSTRATES]->(lo_qa_263);

// Re-anchor Q&A: 163207
MERGE (qa_264:QA_Pair {id: '163207'})
MERGE (p_qa_264:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_264:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_264)-[:INTERPRETS]->(p_qa_264)
MERGE (qa_264)-[:ILLUSTRATES]->(lo_qa_264);

// Re-anchor Q&A: 159005
MERGE (qa_265:QA_Pair {id: '159005'})
MERGE (p_qa_265:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_265:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_265)-[:INTERPRETS]->(p_qa_265)
MERGE (qa_265)-[:ILLUSTRATES]->(lo_qa_265);

// Re-anchor Q&A: 163428
MERGE (qa_266:QA_Pair {id: '163428'})
MERGE (p_qa_266:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_266:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_266)-[:INTERPRETS]->(p_qa_266)
MERGE (qa_266)-[:ILLUSTRATES]->(lo_qa_266);

// Re-anchor Q&A: 163492
MERGE (qa_267:QA_Pair {id: '163492'})
MERGE (p_qa_267:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_267:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_267)-[:INTERPRETS]->(p_qa_267)
MERGE (qa_267)-[:ILLUSTRATES]->(lo_qa_267);

// Re-anchor Q&A: 163501
MERGE (qa_268:QA_Pair {id: '163501'})
MERGE (p_qa_268:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_268:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_268)-[:INTERPRETS]->(p_qa_268)
MERGE (qa_268)-[:ILLUSTRATES]->(lo_qa_268);

// Re-anchor Q&A: 163443
MERGE (qa_269:QA_Pair {id: '163443'})
MERGE (p_qa_269:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_269:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_269)-[:INTERPRETS]->(p_qa_269)
MERGE (qa_269)-[:ILLUSTRATES]->(lo_qa_269);

// Re-anchor Q&A: 161628
MERGE (qa_270:QA_Pair {id: '161628'})
MERGE (p_qa_270:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_270:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_270)-[:INTERPRETS]->(p_qa_270)
MERGE (qa_270)-[:ILLUSTRATES]->(lo_qa_270);

// Re-anchor Q&A: 163410
MERGE (qa_271:QA_Pair {id: '163410'})
MERGE (p_qa_271:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_271:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_271)-[:INTERPRETS]->(p_qa_271)
MERGE (qa_271)-[:ILLUSTRATES]->(lo_qa_271);

// Re-anchor Q&A: 163408
MERGE (qa_272:QA_Pair {id: '163408'})
MERGE (p_qa_272:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_272:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_272)-[:INTERPRETS]->(p_qa_272)
MERGE (qa_272)-[:ILLUSTRATES]->(lo_qa_272);

// Re-anchor Q&A: 162110
MERGE (qa_273:QA_Pair {id: '162110'})
MERGE (p_qa_273:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_273:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_273)-[:INTERPRETS]->(p_qa_273)
MERGE (qa_273)-[:ILLUSTRATES]->(lo_qa_273);

// Re-anchor Q&A: 163327
MERGE (qa_274:QA_Pair {id: '163327'})
MERGE (p_qa_274:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_274:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_274)-[:INTERPRETS]->(p_qa_274)
MERGE (qa_274)-[:ILLUSTRATES]->(lo_qa_274);

// Re-anchor Q&A: 163433
MERGE (qa_275:QA_Pair {id: '163433'})
MERGE (p_qa_275:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_275:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_275)-[:INTERPRETS]->(p_qa_275)
MERGE (qa_275)-[:ILLUSTRATES]->(lo_qa_275);

// Re-anchor Q&A: 162949
MERGE (qa_276:QA_Pair {id: '162949'})
MERGE (p_qa_276:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_276:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_276)-[:INTERPRETS]->(p_qa_276)
MERGE (qa_276)-[:ILLUSTRATES]->(lo_qa_276);

// Re-anchor Q&A: 163411
MERGE (qa_277:QA_Pair {id: '163411'})
MERGE (p_qa_277:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_277:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_277)-[:INTERPRETS]->(p_qa_277)
MERGE (qa_277)-[:ILLUSTRATES]->(lo_qa_277);

// Re-anchor Q&A: 163298
MERGE (qa_278:QA_Pair {id: '163298'})
MERGE (p_qa_278:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_278:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_278)-[:INTERPRETS]->(p_qa_278)
MERGE (qa_278)-[:ILLUSTRATES]->(lo_qa_278);

// Re-anchor Q&A: 162793
MERGE (qa_279:QA_Pair {id: '162793'})
MERGE (p_qa_279:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_279:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_279)-[:INTERPRETS]->(p_qa_279)
MERGE (qa_279)-[:ILLUSTRATES]->(lo_qa_279);

// Re-anchor Q&A: 163389
MERGE (qa_280:QA_Pair {id: '163389'})
MERGE (p_qa_280:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_280:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_280)-[:INTERPRETS]->(p_qa_280)
MERGE (qa_280)-[:ILLUSTRATES]->(lo_qa_280);

// Re-anchor Q&A: 163402
MERGE (qa_281:QA_Pair {id: '163402'})
MERGE (p_qa_281:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_281:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_281)-[:INTERPRETS]->(p_qa_281)
MERGE (qa_281)-[:ILLUSTRATES]->(lo_qa_281);

// Re-anchor Q&A: 163066
MERGE (qa_282:QA_Pair {id: '163066'})
MERGE (p_qa_282:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_282:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_282)-[:INTERPRETS]->(p_qa_282)
MERGE (qa_282)-[:ILLUSTRATES]->(lo_qa_282);

// Re-anchor Q&A: 163251
MERGE (qa_283:QA_Pair {id: '163251'})
MERGE (p_qa_283:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_283:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_283)-[:INTERPRETS]->(p_qa_283)
MERGE (qa_283)-[:ILLUSTRATES]->(lo_qa_283);

// Re-anchor Q&A: 163464
MERGE (qa_284:QA_Pair {id: '163464'})
MERGE (p_qa_284:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_284:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_284)-[:INTERPRETS]->(p_qa_284)
MERGE (qa_284)-[:ILLUSTRATES]->(lo_qa_284);

// Re-anchor Q&A: 157474
MERGE (qa_285:QA_Pair {id: '157474'})
MERGE (p_qa_285:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_285:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_285)-[:INTERPRETS]->(p_qa_285)
MERGE (qa_285)-[:ILLUSTRATES]->(lo_qa_285);

// Re-anchor Q&A: 163255
MERGE (qa_286:QA_Pair {id: '163255'})
MERGE (p_qa_286:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_286:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_286)-[:INTERPRETS]->(p_qa_286)
MERGE (qa_286)-[:ILLUSTRATES]->(lo_qa_286);

// Re-anchor Q&A: 162199
MERGE (qa_287:QA_Pair {id: '162199'})
MERGE (p_qa_287:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_287:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_287)-[:INTERPRETS]->(p_qa_287)
MERGE (qa_287)-[:ILLUSTRATES]->(lo_qa_287);

// Re-anchor Q&A: 156669
MERGE (qa_288:QA_Pair {id: '156669'})
MERGE (p_qa_288:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_288:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_288)-[:INTERPRETS]->(p_qa_288)
MERGE (qa_288)-[:ILLUSTRATES]->(lo_qa_288);

// Re-anchor Q&A: 163285
MERGE (qa_289:QA_Pair {id: '163285'})
MERGE (p_qa_289:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_289:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_289)-[:INTERPRETS]->(p_qa_289)
MERGE (qa_289)-[:ILLUSTRATES]->(lo_qa_289);

// Re-anchor Q&A: 163301
MERGE (qa_290:QA_Pair {id: '163301'})
MERGE (p_qa_290:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_290:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_290)-[:INTERPRETS]->(p_qa_290)
MERGE (qa_290)-[:ILLUSTRATES]->(lo_qa_290);

// Re-anchor Q&A: 163276
MERGE (qa_291:QA_Pair {id: '163276'})
MERGE (p_qa_291:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_291:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_291)-[:INTERPRETS]->(p_qa_291)
MERGE (qa_291)-[:ILLUSTRATES]->(lo_qa_291);

// Re-anchor Q&A: 162493
MERGE (qa_292:QA_Pair {id: '162493'})
MERGE (p_qa_292:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_292:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_292)-[:INTERPRETS]->(p_qa_292)
MERGE (qa_292)-[:ILLUSTRATES]->(lo_qa_292);

// Re-anchor Q&A: 161391
MERGE (qa_293:QA_Pair {id: '161391'})
MERGE (p_qa_293:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_293:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_293)-[:INTERPRETS]->(p_qa_293)
MERGE (qa_293)-[:ILLUSTRATES]->(lo_qa_293);

// Re-anchor Q&A: 163269
MERGE (qa_294:QA_Pair {id: '163269'})
MERGE (p_qa_294:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_294:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_294)-[:INTERPRETS]->(p_qa_294)
MERGE (qa_294)-[:ILLUSTRATES]->(lo_qa_294);

// Re-anchor Q&A: 161083
MERGE (qa_295:QA_Pair {id: '161083'})
MERGE (p_qa_295:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_295:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_295)-[:INTERPRETS]->(p_qa_295)
MERGE (qa_295)-[:ILLUSTRATES]->(lo_qa_295);

// Re-anchor Q&A: 162048
MERGE (qa_296:QA_Pair {id: '162048'})
MERGE (p_qa_296:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_296:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_296)-[:INTERPRETS]->(p_qa_296)
MERGE (qa_296)-[:ILLUSTRATES]->(lo_qa_296);

// Re-anchor Q&A: 163460
MERGE (qa_297:QA_Pair {id: '163460'})
MERGE (p_qa_297:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_297:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_297)-[:INTERPRETS]->(p_qa_297)
MERGE (qa_297)-[:ILLUSTRATES]->(lo_qa_297);

// Re-anchor Q&A: 163096
MERGE (qa_298:QA_Pair {id: '163096'})
MERGE (p_qa_298:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_298:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_298)-[:INTERPRETS]->(p_qa_298)
MERGE (qa_298)-[:ILLUSTRATES]->(lo_qa_298);

// Re-anchor Q&A: 163209
MERGE (qa_299:QA_Pair {id: '163209'})
MERGE (p_qa_299:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_299:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_299)-[:INTERPRETS]->(p_qa_299)
MERGE (qa_299)-[:ILLUSTRATES]->(lo_qa_299);

// Re-anchor Q&A: 163323
MERGE (qa_300:QA_Pair {id: '163323'})
MERGE (p_qa_300:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_300:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_300)-[:INTERPRETS]->(p_qa_300)
MERGE (qa_300)-[:ILLUSTRATES]->(lo_qa_300);

// Re-anchor Q&A: 162973
MERGE (qa_301:QA_Pair {id: '162973'})
MERGE (p_qa_301:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_301:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_301)-[:INTERPRETS]->(p_qa_301)
MERGE (qa_301)-[:ILLUSTRATES]->(lo_qa_301);

// Re-anchor Q&A: 161066
MERGE (qa_302:QA_Pair {id: '161066'})
MERGE (p_qa_302:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_302:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_302)-[:INTERPRETS]->(p_qa_302)
MERGE (qa_302)-[:ILLUSTRATES]->(lo_qa_302);

// Re-anchor Q&A: 161835
MERGE (qa_303:QA_Pair {id: '161835'})
MERGE (p_qa_303:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_303:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_303)-[:INTERPRETS]->(p_qa_303)
MERGE (qa_303)-[:ILLUSTRATES]->(lo_qa_303);

// Re-anchor Q&A: 163244
MERGE (qa_304:QA_Pair {id: '163244'})
MERGE (p_qa_304:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_304:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_304)-[:INTERPRETS]->(p_qa_304)
MERGE (qa_304)-[:ILLUSTRATES]->(lo_qa_304);

// Re-anchor Q&A: 162231
MERGE (qa_305:QA_Pair {id: '162231'})
MERGE (p_qa_305:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_305:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_305)-[:INTERPRETS]->(p_qa_305)
MERGE (qa_305)-[:ILLUSTRATES]->(lo_qa_305);

// Re-anchor Q&A: 163278
MERGE (qa_306:QA_Pair {id: '163278'})
MERGE (p_qa_306:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_306:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_306)-[:INTERPRETS]->(p_qa_306)
MERGE (qa_306)-[:ILLUSTRATES]->(lo_qa_306);

// Re-anchor Q&A: 163245
MERGE (qa_307:QA_Pair {id: '163245'})
MERGE (p_qa_307:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_307:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_307)-[:INTERPRETS]->(p_qa_307)
MERGE (qa_307)-[:ILLUSTRATES]->(lo_qa_307);

// Re-anchor Q&A: 163234
MERGE (qa_308:QA_Pair {id: '163234'})
MERGE (p_qa_308:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_308:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_308)-[:INTERPRETS]->(p_qa_308)
MERGE (qa_308)-[:ILLUSTRATES]->(lo_qa_308);

// Re-anchor Q&A: 163254
MERGE (qa_309:QA_Pair {id: '163254'})
MERGE (p_qa_309:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_309:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_309)-[:INTERPRETS]->(p_qa_309)
MERGE (qa_309)-[:ILLUSTRATES]->(lo_qa_309);

// Re-anchor Q&A: 163075
MERGE (qa_310:QA_Pair {id: '163075'})
MERGE (p_qa_310:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_310:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_310)-[:INTERPRETS]->(p_qa_310)
MERGE (qa_310)-[:ILLUSTRATES]->(lo_qa_310);

// Re-anchor Q&A: 163238
MERGE (qa_311:QA_Pair {id: '163238'})
MERGE (p_qa_311:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_311:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_311)-[:INTERPRETS]->(p_qa_311)
MERGE (qa_311)-[:ILLUSTRATES]->(lo_qa_311);

// Re-anchor Q&A: 163197
MERGE (qa_312:QA_Pair {id: '163197'})
MERGE (p_qa_312:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_312:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_312)-[:INTERPRETS]->(p_qa_312)
MERGE (qa_312)-[:ILLUSTRATES]->(lo_qa_312);

// Re-anchor Q&A: 163100
MERGE (qa_313:QA_Pair {id: '163100'})
MERGE (p_qa_313:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_313:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_313)-[:INTERPRETS]->(p_qa_313)
MERGE (qa_313)-[:ILLUSTRATES]->(lo_qa_313);

// Re-anchor Q&A: 163082
MERGE (qa_314:QA_Pair {id: '163082'})
MERGE (p_qa_314:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_314:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_314)-[:INTERPRETS]->(p_qa_314)
MERGE (qa_314)-[:ILLUSTRATES]->(lo_qa_314);

// Re-anchor Q&A: 163088
MERGE (qa_315:QA_Pair {id: '163088'})
MERGE (p_qa_315:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_315:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_315)-[:INTERPRETS]->(p_qa_315)
MERGE (qa_315)-[:ILLUSTRATES]->(lo_qa_315);

// Re-anchor Q&A: 163079
MERGE (qa_316:QA_Pair {id: '163079'})
MERGE (p_qa_316:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_316:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_316)-[:INTERPRETS]->(p_qa_316)
MERGE (qa_316)-[:ILLUSTRATES]->(lo_qa_316);

// Re-anchor Q&A: 159460
MERGE (qa_317:QA_Pair {id: '159460'})
MERGE (p_qa_317:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_317:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_317)-[:INTERPRETS]->(p_qa_317)
MERGE (qa_317)-[:ILLUSTRATES]->(lo_qa_317);

// Re-anchor Q&A: 163067
MERGE (qa_318:QA_Pair {id: '163067'})
MERGE (p_qa_318:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_318:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_318)-[:INTERPRETS]->(p_qa_318)
MERGE (qa_318)-[:ILLUSTRATES]->(lo_qa_318);

// Re-anchor Q&A: 163097
MERGE (qa_319:QA_Pair {id: '163097'})
MERGE (p_qa_319:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_319:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_319)-[:INTERPRETS]->(p_qa_319)
MERGE (qa_319)-[:ILLUSTRATES]->(lo_qa_319);

// Re-anchor Q&A: 163064
MERGE (qa_320:QA_Pair {id: '163064'})
MERGE (p_qa_320:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_320:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_320)-[:INTERPRETS]->(p_qa_320)
MERGE (qa_320)-[:ILLUSTRATES]->(lo_qa_320);

// Re-anchor Q&A: 162955
MERGE (qa_321:QA_Pair {id: '162955'})
MERGE (p_qa_321:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_321:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_321)-[:INTERPRETS]->(p_qa_321)
MERGE (qa_321)-[:ILLUSTRATES]->(lo_qa_321);

// Re-anchor Q&A: 161783
MERGE (qa_322:QA_Pair {id: '161783'})
MERGE (p_qa_322:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_322:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_322)-[:INTERPRETS]->(p_qa_322)
MERGE (qa_322)-[:ILLUSTRATES]->(lo_qa_322);

// Re-anchor Q&A: 163166
MERGE (qa_323:QA_Pair {id: '163166'})
MERGE (p_qa_323:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_323:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_323)-[:INTERPRETS]->(p_qa_323)
MERGE (qa_323)-[:ILLUSTRATES]->(lo_qa_323);

// Re-anchor Q&A: 162516
MERGE (qa_324:QA_Pair {id: '162516'})
MERGE (p_qa_324:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_324:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_324)-[:INTERPRETS]->(p_qa_324)
MERGE (qa_324)-[:ILLUSTRATES]->(lo_qa_324);

// Re-anchor Q&A: 162754
MERGE (qa_325:QA_Pair {id: '162754'})
MERGE (p_qa_325:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_325:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_325)-[:INTERPRETS]->(p_qa_325)
MERGE (qa_325)-[:ILLUSTRATES]->(lo_qa_325);

// Re-anchor Q&A: 163095
MERGE (qa_326:QA_Pair {id: '163095'})
MERGE (p_qa_326:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_326:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_326)-[:INTERPRETS]->(p_qa_326)
MERGE (qa_326)-[:ILLUSTRATES]->(lo_qa_326);

// Re-anchor Q&A: 162748
MERGE (qa_327:QA_Pair {id: '162748'})
MERGE (p_qa_327:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_327:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_327)-[:INTERPRETS]->(p_qa_327)
MERGE (qa_327)-[:ILLUSTRATES]->(lo_qa_327);

// Re-anchor Q&A: 162205
MERGE (qa_328:QA_Pair {id: '162205'})
MERGE (p_qa_328:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_328:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_328)-[:INTERPRETS]->(p_qa_328)
MERGE (qa_328)-[:ILLUSTRATES]->(lo_qa_328);

// Re-anchor Q&A: 162986
MERGE (qa_329:QA_Pair {id: '162986'})
MERGE (p_qa_329:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_329:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_329)-[:INTERPRETS]->(p_qa_329)
MERGE (qa_329)-[:ILLUSTRATES]->(lo_qa_329);

// Re-anchor Q&A: 162831
MERGE (qa_330:QA_Pair {id: '162831'})
MERGE (p_qa_330:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_330:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_330)-[:INTERPRETS]->(p_qa_330)
MERGE (qa_330)-[:ILLUSTRATES]->(lo_qa_330);

// Re-anchor Q&A: 162888
MERGE (qa_331:QA_Pair {id: '162888'})
MERGE (p_qa_331:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_331:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_331)-[:INTERPRETS]->(p_qa_331)
MERGE (qa_331)-[:ILLUSTRATES]->(lo_qa_331);

// Re-anchor Q&A: 158958
MERGE (qa_332:QA_Pair {id: '158958'})
MERGE (p_qa_332:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_332:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_332)-[:INTERPRETS]->(p_qa_332)
MERGE (qa_332)-[:ILLUSTRATES]->(lo_qa_332);

// Re-anchor Q&A: 158836
MERGE (qa_333:QA_Pair {id: '158836'})
MERGE (p_qa_333:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_333:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_333)-[:INTERPRETS]->(p_qa_333)
MERGE (qa_333)-[:ILLUSTRATES]->(lo_qa_333);

// Re-anchor Q&A: 162894
MERGE (qa_334:QA_Pair {id: '162894'})
MERGE (p_qa_334:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_334:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_334)-[:INTERPRETS]->(p_qa_334)
MERGE (qa_334)-[:ILLUSTRATES]->(lo_qa_334);

// Re-anchor Q&A: 162294
MERGE (qa_335:QA_Pair {id: '162294'})
MERGE (p_qa_335:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_335:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_335)-[:INTERPRETS]->(p_qa_335)
MERGE (qa_335)-[:ILLUSTRATES]->(lo_qa_335);

// Re-anchor Q&A: 161840
MERGE (qa_336:QA_Pair {id: '161840'})
MERGE (p_qa_336:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_336:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_336)-[:INTERPRETS]->(p_qa_336)
MERGE (qa_336)-[:ILLUSTRATES]->(lo_qa_336);

// Re-anchor Q&A: 160521
MERGE (qa_337:QA_Pair {id: '160521'})
MERGE (p_qa_337:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_337:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_337)-[:INTERPRETS]->(p_qa_337)
MERGE (qa_337)-[:ILLUSTRATES]->(lo_qa_337);

// Re-anchor Q&A: 160882
MERGE (qa_338:QA_Pair {id: '160882'})
MERGE (p_qa_338:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_338:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_338)-[:INTERPRETS]->(p_qa_338)
MERGE (qa_338)-[:ILLUSTRATES]->(lo_qa_338);

// Re-anchor Q&A: 161403
MERGE (qa_339:QA_Pair {id: '161403'})
MERGE (p_qa_339:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_339:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_339)-[:INTERPRETS]->(p_qa_339)
MERGE (qa_339)-[:ILLUSTRATES]->(lo_qa_339);

// Re-anchor Q&A: 161068
MERGE (qa_340:QA_Pair {id: '161068'})
MERGE (p_qa_340:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_340:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_340)-[:INTERPRETS]->(p_qa_340)
MERGE (qa_340)-[:ILLUSTRATES]->(lo_qa_340);

// Re-anchor Q&A: 158681
MERGE (qa_341:QA_Pair {id: '158681'})
MERGE (p_qa_341:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_341:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_341)-[:INTERPRETS]->(p_qa_341)
MERGE (qa_341)-[:ILLUSTRATES]->(lo_qa_341);

// Re-anchor Q&A: 160975
MERGE (qa_342:QA_Pair {id: '160975'})
MERGE (p_qa_342:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_342:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_342)-[:INTERPRETS]->(p_qa_342)
MERGE (qa_342)-[:ILLUSTRATES]->(lo_qa_342);

// Re-anchor Q&A: 154567
MERGE (qa_343:QA_Pair {id: '154567'})
MERGE (p_qa_343:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_343:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_343)-[:INTERPRETS]->(p_qa_343)
MERGE (qa_343)-[:ILLUSTRATES]->(lo_qa_343);

// Re-anchor Q&A: 155409
MERGE (qa_344:QA_Pair {id: '155409'})
MERGE (p_qa_344:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_344:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_344)-[:INTERPRETS]->(p_qa_344)
MERGE (qa_344)-[:ILLUSTRATES]->(lo_qa_344);

// Re-anchor Q&A: 159064
MERGE (qa_345:QA_Pair {id: '159064'})
MERGE (p_qa_345:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_345:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_345)-[:INTERPRETS]->(p_qa_345)
MERGE (qa_345)-[:ILLUSTRATES]->(lo_qa_345);

// Re-anchor Q&A: 159123
MERGE (qa_346:QA_Pair {id: '159123'})
MERGE (p_qa_346:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_346:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_346)-[:INTERPRETS]->(p_qa_346)
MERGE (qa_346)-[:ILLUSTRATES]->(lo_qa_346);

// Re-anchor Q&A: 162289
MERGE (qa_347:QA_Pair {id: '162289'})
MERGE (p_qa_347:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_347:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_347)-[:INTERPRETS]->(p_qa_347)
MERGE (qa_347)-[:ILLUSTRATES]->(lo_qa_347);

// Re-anchor Q&A: 161796
MERGE (qa_348:QA_Pair {id: '161796'})
MERGE (p_qa_348:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_348:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_348)-[:INTERPRETS]->(p_qa_348)
MERGE (qa_348)-[:ILLUSTRATES]->(lo_qa_348);

// Re-anchor Q&A: 159642
MERGE (qa_349:QA_Pair {id: '159642'})
MERGE (p_qa_349:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_349:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_349)-[:INTERPRETS]->(p_qa_349)
MERGE (qa_349)-[:ILLUSTRATES]->(lo_qa_349);

// Re-anchor Q&A: 160514
MERGE (qa_350:QA_Pair {id: '160514'})
MERGE (p_qa_350:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_350:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_350)-[:INTERPRETS]->(p_qa_350)
MERGE (qa_350)-[:ILLUSTRATES]->(lo_qa_350);

// Re-anchor Q&A: 159095
MERGE (qa_351:QA_Pair {id: '159095'})
MERGE (p_qa_351:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_351:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_351)-[:INTERPRETS]->(p_qa_351)
MERGE (qa_351)-[:ILLUSTRATES]->(lo_qa_351);

// Re-anchor Q&A: 159874
MERGE (qa_352:QA_Pair {id: '159874'})
MERGE (p_qa_352:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_352:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_352)-[:INTERPRETS]->(p_qa_352)
MERGE (qa_352)-[:ILLUSTRATES]->(lo_qa_352);

// Re-anchor Q&A: 159266
MERGE (qa_353:QA_Pair {id: '159266'})
MERGE (p_qa_353:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_353:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_353)-[:INTERPRETS]->(p_qa_353)
MERGE (qa_353)-[:ILLUSTRATES]->(lo_qa_353);

// Re-anchor Q&A: 161943
MERGE (qa_354:QA_Pair {id: '161943'})
MERGE (p_qa_354:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_354:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_354)-[:INTERPRETS]->(p_qa_354)
MERGE (qa_354)-[:ILLUSTRATES]->(lo_qa_354);

// Re-anchor Q&A: 162796
MERGE (qa_355:QA_Pair {id: '162796'})
MERGE (p_qa_355:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_355:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_355)-[:INTERPRETS]->(p_qa_355)
MERGE (qa_355)-[:ILLUSTRATES]->(lo_qa_355);

// Re-anchor Q&A: 162743
MERGE (qa_356:QA_Pair {id: '162743'})
MERGE (p_qa_356:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_356:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_356)-[:INTERPRETS]->(p_qa_356)
MERGE (qa_356)-[:ILLUSTRATES]->(lo_qa_356);

// Re-anchor Q&A: 162843
MERGE (qa_357:QA_Pair {id: '162843'})
MERGE (p_qa_357:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_357:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_357)-[:INTERPRETS]->(p_qa_357)
MERGE (qa_357)-[:ILLUSTRATES]->(lo_qa_357);

// Re-anchor Q&A: 159450
MERGE (qa_358:QA_Pair {id: '159450'})
MERGE (p_qa_358:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_358:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_358)-[:INTERPRETS]->(p_qa_358)
MERGE (qa_358)-[:ILLUSTRATES]->(lo_qa_358);

// Re-anchor Q&A: 160909
MERGE (qa_359:QA_Pair {id: '160909'})
MERGE (p_qa_359:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_359:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_359)-[:INTERPRETS]->(p_qa_359)
MERGE (qa_359)-[:ILLUSTRATES]->(lo_qa_359);

// Re-anchor Q&A: 159080
MERGE (qa_360:QA_Pair {id: '159080'})
MERGE (p_qa_360:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_360:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_360)-[:INTERPRETS]->(p_qa_360)
MERGE (qa_360)-[:ILLUSTRATES]->(lo_qa_360);

// Re-anchor Q&A: 161551
MERGE (qa_361:QA_Pair {id: '161551'})
MERGE (p_qa_361:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_361:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_361)-[:INTERPRETS]->(p_qa_361)
MERGE (qa_361)-[:ILLUSTRATES]->(lo_qa_361);

// Re-anchor Q&A: 154949
MERGE (qa_362:QA_Pair {id: '154949'})
MERGE (p_qa_362:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_362:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_362)-[:INTERPRETS]->(p_qa_362)
MERGE (qa_362)-[:ILLUSTRATES]->(lo_qa_362);

// Re-anchor Q&A: 159965
MERGE (qa_363:QA_Pair {id: '159965'})
MERGE (p_qa_363:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_363:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_363)-[:INTERPRETS]->(p_qa_363)
MERGE (qa_363)-[:ILLUSTRATES]->(lo_qa_363);

// Re-anchor Q&A: 155328
MERGE (qa_364:QA_Pair {id: '155328'})
MERGE (p_qa_364:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_364:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_364)-[:INTERPRETS]->(p_qa_364)
MERGE (qa_364)-[:ILLUSTRATES]->(lo_qa_364);

// Re-anchor Q&A: 162722
MERGE (qa_365:QA_Pair {id: '162722'})
MERGE (p_qa_365:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_365:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_365)-[:INTERPRETS]->(p_qa_365)
MERGE (qa_365)-[:ILLUSTRATES]->(lo_qa_365);

// Re-anchor Q&A: 159066
MERGE (qa_366:QA_Pair {id: '159066'})
MERGE (p_qa_366:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_366:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_366)-[:INTERPRETS]->(p_qa_366)
MERGE (qa_366)-[:ILLUSTRATES]->(lo_qa_366);

// Re-anchor Q&A: 157764
MERGE (qa_367:QA_Pair {id: '157764'})
MERGE (p_qa_367:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_367:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_367)-[:INTERPRETS]->(p_qa_367)
MERGE (qa_367)-[:ILLUSTRATES]->(lo_qa_367);

// Re-anchor Q&A: 156645
MERGE (qa_368:QA_Pair {id: '156645'})
MERGE (p_qa_368:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_368:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_368)-[:INTERPRETS]->(p_qa_368)
MERGE (qa_368)-[:ILLUSTRATES]->(lo_qa_368);

// Re-anchor Q&A: 162296
MERGE (qa_369:QA_Pair {id: '162296'})
MERGE (p_qa_369:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_369:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_369)-[:INTERPRETS]->(p_qa_369)
MERGE (qa_369)-[:ILLUSTRATES]->(lo_qa_369);

// Re-anchor Q&A: 162249
MERGE (qa_370:QA_Pair {id: '162249'})
MERGE (p_qa_370:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_370:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_370)-[:INTERPRETS]->(p_qa_370)
MERGE (qa_370)-[:ILLUSTRATES]->(lo_qa_370);

// Re-anchor Q&A: 159077
MERGE (qa_371:QA_Pair {id: '159077'})
MERGE (p_qa_371:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_371:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_371)-[:INTERPRETS]->(p_qa_371)
MERGE (qa_371)-[:ILLUSTRATES]->(lo_qa_371);

// Re-anchor Q&A: 162004
MERGE (qa_372:QA_Pair {id: '162004'})
MERGE (p_qa_372:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_372:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_372)-[:INTERPRETS]->(p_qa_372)
MERGE (qa_372)-[:ILLUSTRATES]->(lo_qa_372);

// Re-anchor Q&A: 158715
MERGE (qa_373:QA_Pair {id: '158715'})
MERGE (p_qa_373:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_373:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_373)-[:INTERPRETS]->(p_qa_373)
MERGE (qa_373)-[:ILLUSTRATES]->(lo_qa_373);

// Re-anchor Q&A: 151760
MERGE (qa_374:QA_Pair {id: '151760'})
MERGE (p_qa_374:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_374:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_374)-[:INTERPRETS]->(p_qa_374)
MERGE (qa_374)-[:ILLUSTRATES]->(lo_qa_374);

// Re-anchor Q&A: 159869
MERGE (qa_375:QA_Pair {id: '159869'})
MERGE (p_qa_375:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_375:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_375)-[:INTERPRETS]->(p_qa_375)
MERGE (qa_375)-[:ILLUSTRATES]->(lo_qa_375);

// Re-anchor Q&A: 161756
MERGE (qa_376:QA_Pair {id: '161756'})
MERGE (p_qa_376:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_376:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_376)-[:INTERPRETS]->(p_qa_376)
MERGE (qa_376)-[:ILLUSTRATES]->(lo_qa_376);

// Re-anchor Q&A: 160118
MERGE (qa_377:QA_Pair {id: '160118'})
MERGE (p_qa_377:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_377:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_377)-[:INTERPRETS]->(p_qa_377)
MERGE (qa_377)-[:ILLUSTRATES]->(lo_qa_377);

// Re-anchor Q&A: 161554
MERGE (qa_378:QA_Pair {id: '161554'})
MERGE (p_qa_378:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_378:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_378)-[:INTERPRETS]->(p_qa_378)
MERGE (qa_378)-[:ILLUSTRATES]->(lo_qa_378);

// Re-anchor Q&A: 162690
MERGE (qa_379:QA_Pair {id: '162690'})
MERGE (p_qa_379:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_379:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_379)-[:INTERPRETS]->(p_qa_379)
MERGE (qa_379)-[:ILLUSTRATES]->(lo_qa_379);

// Re-anchor Q&A: 161555
MERGE (qa_380:QA_Pair {id: '161555'})
MERGE (p_qa_380:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_380:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_380)-[:INTERPRETS]->(p_qa_380)
MERGE (qa_380)-[:ILLUSTRATES]->(lo_qa_380);

// Re-anchor Q&A: 162578
MERGE (qa_381:QA_Pair {id: '162578'})
MERGE (p_qa_381:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_381:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_381)-[:INTERPRETS]->(p_qa_381)
MERGE (qa_381)-[:ILLUSTRATES]->(lo_qa_381);

// Re-anchor Q&A: 162361
MERGE (qa_382:QA_Pair {id: '162361'})
MERGE (p_qa_382:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_382:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_382)-[:INTERPRETS]->(p_qa_382)
MERGE (qa_382)-[:ILLUSTRATES]->(lo_qa_382);

// Re-anchor Q&A: 161957
MERGE (qa_383:QA_Pair {id: '161957'})
MERGE (p_qa_383:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_383:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_383)-[:INTERPRETS]->(p_qa_383)
MERGE (qa_383)-[:ILLUSTRATES]->(lo_qa_383);

// Re-anchor Q&A: 161910
MERGE (qa_384:QA_Pair {id: '161910'})
MERGE (p_qa_384:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_384:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_384)-[:INTERPRETS]->(p_qa_384)
MERGE (qa_384)-[:ILLUSTRATES]->(lo_qa_384);

// Re-anchor Q&A: 160396
MERGE (qa_385:QA_Pair {id: '160396'})
MERGE (p_qa_385:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_385:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_385)-[:INTERPRETS]->(p_qa_385)
MERGE (qa_385)-[:ILLUSTRATES]->(lo_qa_385);

// Re-anchor Q&A: 162600
MERGE (qa_386:QA_Pair {id: '162600'})
MERGE (p_qa_386:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_386:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_386)-[:INTERPRETS]->(p_qa_386)
MERGE (qa_386)-[:ILLUSTRATES]->(lo_qa_386);

// Re-anchor Q&A: 160710
MERGE (qa_387:QA_Pair {id: '160710'})
MERGE (p_qa_387:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_387:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_387)-[:INTERPRETS]->(p_qa_387)
MERGE (qa_387)-[:ILLUSTRATES]->(lo_qa_387);

// Re-anchor Q&A: 162236
MERGE (qa_388:QA_Pair {id: '162236'})
MERGE (p_qa_388:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_388:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_388)-[:INTERPRETS]->(p_qa_388)
MERGE (qa_388)-[:ILLUSTRATES]->(lo_qa_388);

// Re-anchor Q&A: 162232
MERGE (qa_389:QA_Pair {id: '162232'})
MERGE (p_qa_389:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_389:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_389)-[:INTERPRETS]->(p_qa_389)
MERGE (qa_389)-[:ILLUSTRATES]->(lo_qa_389);

// Re-anchor Q&A: 162321
MERGE (qa_390:QA_Pair {id: '162321'})
MERGE (p_qa_390:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_390:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_390)-[:INTERPRETS]->(p_qa_390)
MERGE (qa_390)-[:ILLUSTRATES]->(lo_qa_390);

// Re-anchor Q&A: 157913
MERGE (qa_391:QA_Pair {id: '157913'})
MERGE (p_qa_391:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_391:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_391)-[:INTERPRETS]->(p_qa_391)
MERGE (qa_391)-[:ILLUSTRATES]->(lo_qa_391);

// Re-anchor Q&A: 159114
MERGE (qa_392:QA_Pair {id: '159114'})
MERGE (p_qa_392:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_392:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_392)-[:INTERPRETS]->(p_qa_392)
MERGE (qa_392)-[:ILLUSTRATES]->(lo_qa_392);

// Re-anchor Q&A: 155327
MERGE (qa_393:QA_Pair {id: '155327'})
MERGE (p_qa_393:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_393:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_393)-[:INTERPRETS]->(p_qa_393)
MERGE (qa_393)-[:ILLUSTRATES]->(lo_qa_393);

// Re-anchor Q&A: 154757
MERGE (qa_394:QA_Pair {id: '154757'})
MERGE (p_qa_394:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_394:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_394)-[:INTERPRETS]->(p_qa_394)
MERGE (qa_394)-[:ILLUSTRATES]->(lo_qa_394);

// Re-anchor Q&A: 162152
MERGE (qa_395:QA_Pair {id: '162152'})
MERGE (p_qa_395:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_395:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_395)-[:INTERPRETS]->(p_qa_395)
MERGE (qa_395)-[:ILLUSTRATES]->(lo_qa_395);

// Re-anchor Q&A: 161622
MERGE (qa_396:QA_Pair {id: '161622'})
MERGE (p_qa_396:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_396:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_396)-[:INTERPRETS]->(p_qa_396)
MERGE (qa_396)-[:ILLUSTRATES]->(lo_qa_396);

// Re-anchor Q&A: 161953
MERGE (qa_397:QA_Pair {id: '161953'})
MERGE (p_qa_397:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_397:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_397)-[:INTERPRETS]->(p_qa_397)
MERGE (qa_397)-[:ILLUSTRATES]->(lo_qa_397);

// Re-anchor Q&A: 162335
MERGE (qa_398:QA_Pair {id: '162335'})
MERGE (p_qa_398:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_398:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_398)-[:INTERPRETS]->(p_qa_398)
MERGE (qa_398)-[:ILLUSTRATES]->(lo_qa_398);

// Re-anchor Q&A: 162638
MERGE (qa_399:QA_Pair {id: '162638'})
MERGE (p_qa_399:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_399:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_399)-[:INTERPRETS]->(p_qa_399)
MERGE (qa_399)-[:ILLUSTRATES]->(lo_qa_399);

// Re-anchor Q&A: 160276
MERGE (qa_400:QA_Pair {id: '160276'})
MERGE (p_qa_400:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_400:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_400)-[:INTERPRETS]->(p_qa_400)
MERGE (qa_400)-[:ILLUSTRATES]->(lo_qa_400);

// Re-anchor Q&A: 162547
MERGE (qa_401:QA_Pair {id: '162547'})
MERGE (p_qa_401:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_401:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_401)-[:INTERPRETS]->(p_qa_401)
MERGE (qa_401)-[:ILLUSTRATES]->(lo_qa_401);

// Re-anchor Q&A: 162558
MERGE (qa_402:QA_Pair {id: '162558'})
MERGE (p_qa_402:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_402:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_402)-[:INTERPRETS]->(p_qa_402)
MERGE (qa_402)-[:ILLUSTRATES]->(lo_qa_402);

// Re-anchor Q&A: 162123
MERGE (qa_403:QA_Pair {id: '162123'})
MERGE (p_qa_403:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_403:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_403)-[:INTERPRETS]->(p_qa_403)
MERGE (qa_403)-[:ILLUSTRATES]->(lo_qa_403);

// Re-anchor Q&A: 162377
MERGE (qa_404:QA_Pair {id: '162377'})
MERGE (p_qa_404:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_404:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_404)-[:INTERPRETS]->(p_qa_404)
MERGE (qa_404)-[:ILLUSTRATES]->(lo_qa_404);

// Re-anchor Q&A: 159048
MERGE (qa_405:QA_Pair {id: '159048'})
MERGE (p_qa_405:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_405:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_405)-[:INTERPRETS]->(p_qa_405)
MERGE (qa_405)-[:ILLUSTRATES]->(lo_qa_405);

// Re-anchor Q&A: 162498
MERGE (qa_406:QA_Pair {id: '162498'})
MERGE (p_qa_406:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_406:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_406)-[:INTERPRETS]->(p_qa_406)
MERGE (qa_406)-[:ILLUSTRATES]->(lo_qa_406);

// Re-anchor Q&A: 162584
MERGE (qa_407:QA_Pair {id: '162584'})
MERGE (p_qa_407:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_407:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_407)-[:INTERPRETS]->(p_qa_407)
MERGE (qa_407)-[:ILLUSTRATES]->(lo_qa_407);

// Re-anchor Q&A: 158781
MERGE (qa_408:QA_Pair {id: '158781'})
MERGE (p_qa_408:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_408:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_408)-[:INTERPRETS]->(p_qa_408)
MERGE (qa_408)-[:ILLUSTRATES]->(lo_qa_408);

// Re-anchor Q&A: 162606
MERGE (qa_409:QA_Pair {id: '162606'})
MERGE (p_qa_409:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_409:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_409)-[:INTERPRETS]->(p_qa_409)
MERGE (qa_409)-[:ILLUSTRATES]->(lo_qa_409);

// Re-anchor Q&A: 159062
MERGE (qa_410:QA_Pair {id: '159062'})
MERGE (p_qa_410:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_410:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_410)-[:INTERPRETS]->(p_qa_410)
MERGE (qa_410)-[:ILLUSTRATES]->(lo_qa_410);

// Re-anchor Q&A: 159045
MERGE (qa_411:QA_Pair {id: '159045'})
MERGE (p_qa_411:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_411:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_411)-[:INTERPRETS]->(p_qa_411)
MERGE (qa_411)-[:ILLUSTRATES]->(lo_qa_411);

// Re-anchor Q&A: 162235
MERGE (qa_412:QA_Pair {id: '162235'})
MERGE (p_qa_412:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_412:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_412)-[:INTERPRETS]->(p_qa_412)
MERGE (qa_412)-[:ILLUSTRATES]->(lo_qa_412);

// Re-anchor Q&A: 162567
MERGE (qa_413:QA_Pair {id: '162567'})
MERGE (p_qa_413:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_413:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_413)-[:INTERPRETS]->(p_qa_413)
MERGE (qa_413)-[:ILLUSTRATES]->(lo_qa_413);

// Re-anchor Q&A: 162568
MERGE (qa_414:QA_Pair {id: '162568'})
MERGE (p_qa_414:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_414:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_414)-[:INTERPRETS]->(p_qa_414)
MERGE (qa_414)-[:ILLUSTRATES]->(lo_qa_414);

// Re-anchor Q&A: 162295
MERGE (qa_415:QA_Pair {id: '162295'})
MERGE (p_qa_415:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_415:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_415)-[:INTERPRETS]->(p_qa_415)
MERGE (qa_415)-[:ILLUSTRATES]->(lo_qa_415);

// Re-anchor Q&A: 162308
MERGE (qa_416:QA_Pair {id: '162308'})
MERGE (p_qa_416:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_416:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_416)-[:INTERPRETS]->(p_qa_416)
MERGE (qa_416)-[:ILLUSTRATES]->(lo_qa_416);

// Re-anchor Q&A: 162107
MERGE (qa_417:QA_Pair {id: '162107'})
MERGE (p_qa_417:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_417:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_417)-[:INTERPRETS]->(p_qa_417)
MERGE (qa_417)-[:ILLUSTRATES]->(lo_qa_417);

// Re-anchor Q&A: 162256
MERGE (qa_418:QA_Pair {id: '162256'})
MERGE (p_qa_418:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_418:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_418)-[:INTERPRETS]->(p_qa_418)
MERGE (qa_418)-[:ILLUSTRATES]->(lo_qa_418);

// Re-anchor Q&A: 160182
MERGE (qa_419:QA_Pair {id: '160182'})
MERGE (p_qa_419:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_419:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_419)-[:INTERPRETS]->(p_qa_419)
MERGE (qa_419)-[:ILLUSTRATES]->(lo_qa_419);

// Re-anchor Q&A: 162492
MERGE (qa_420:QA_Pair {id: '162492'})
MERGE (p_qa_420:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_420:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_420)-[:INTERPRETS]->(p_qa_420)
MERGE (qa_420)-[:ILLUSTRATES]->(lo_qa_420);

// Re-anchor Q&A: 162226
MERGE (qa_421:QA_Pair {id: '162226'})
MERGE (p_qa_421:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_421:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_421)-[:INTERPRETS]->(p_qa_421)
MERGE (qa_421)-[:ILLUSTRATES]->(lo_qa_421);

// Re-anchor Q&A: 162272
MERGE (qa_422:QA_Pair {id: '162272'})
MERGE (p_qa_422:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_422:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_422)-[:INTERPRETS]->(p_qa_422)
MERGE (qa_422)-[:ILLUSTRATES]->(lo_qa_422);

// Re-anchor Q&A: 161161
MERGE (qa_423:QA_Pair {id: '161161'})
MERGE (p_qa_423:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_423:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_423)-[:INTERPRETS]->(p_qa_423)
MERGE (qa_423)-[:ILLUSTRATES]->(lo_qa_423);

// Re-anchor Q&A: 162637
MERGE (qa_424:QA_Pair {id: '162637'})
MERGE (p_qa_424:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_424:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_424)-[:INTERPRETS]->(p_qa_424)
MERGE (qa_424)-[:ILLUSTRATES]->(lo_qa_424);

// Re-anchor Q&A: 162495
MERGE (qa_425:QA_Pair {id: '162495'})
MERGE (p_qa_425:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_425:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_425)-[:INTERPRETS]->(p_qa_425)
MERGE (qa_425)-[:ILLUSTRATES]->(lo_qa_425);

// Re-anchor Q&A: 162432
MERGE (qa_426:QA_Pair {id: '162432'})
MERGE (p_qa_426:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_426:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_426)-[:INTERPRETS]->(p_qa_426)
MERGE (qa_426)-[:ILLUSTRATES]->(lo_qa_426);

// Re-anchor Q&A: 162452
MERGE (qa_427:QA_Pair {id: '162452'})
MERGE (p_qa_427:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_427:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_427)-[:INTERPRETS]->(p_qa_427)
MERGE (qa_427)-[:ILLUSTRATES]->(lo_qa_427);

// Re-anchor Q&A: 162350
MERGE (qa_428:QA_Pair {id: '162350'})
MERGE (p_qa_428:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_428:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_428)-[:INTERPRETS]->(p_qa_428)
MERGE (qa_428)-[:ILLUSTRATES]->(lo_qa_428);

// Re-anchor Q&A: 162261
MERGE (qa_429:QA_Pair {id: '162261'})
MERGE (p_qa_429:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_429:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_429)-[:INTERPRETS]->(p_qa_429)
MERGE (qa_429)-[:ILLUSTRATES]->(lo_qa_429);

// Re-anchor Q&A: 162454
MERGE (qa_430:QA_Pair {id: '162454'})
MERGE (p_qa_430:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_430:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_430)-[:INTERPRETS]->(p_qa_430)
MERGE (qa_430)-[:ILLUSTRATES]->(lo_qa_430);

// Re-anchor Q&A: 162583
MERGE (qa_431:QA_Pair {id: '162583'})
MERGE (p_qa_431:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_431:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_431)-[:INTERPRETS]->(p_qa_431)
MERGE (qa_431)-[:ILLUSTRATES]->(lo_qa_431);

// Re-anchor Q&A: 162533
MERGE (qa_432:QA_Pair {id: '162533'})
MERGE (p_qa_432:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_432:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_432)-[:INTERPRETS]->(p_qa_432)
MERGE (qa_432)-[:ILLUSTRATES]->(lo_qa_432);

// Re-anchor Q&A: 162365
MERGE (qa_433:QA_Pair {id: '162365'})
MERGE (p_qa_433:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_433:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_433)-[:INTERPRETS]->(p_qa_433)
MERGE (qa_433)-[:ILLUSTRATES]->(lo_qa_433);

// Re-anchor Q&A: 162285
MERGE (qa_434:QA_Pair {id: '162285'})
MERGE (p_qa_434:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_434:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_434)-[:INTERPRETS]->(p_qa_434)
MERGE (qa_434)-[:ILLUSTRATES]->(lo_qa_434);

// Re-anchor Q&A: 162050
MERGE (qa_435:QA_Pair {id: '162050'})
MERGE (p_qa_435:LegalParagraph {id: 'PARA_L67_D9'})
MERGE (lo_qa_435:Atomic_LO {id: 'LO_CIT_DEDUCTIBLE_EXPENSE_RULE'})
MERGE (qa_435)-[:INTERPRETS]->(p_qa_435)
MERGE (qa_435)-[:ILLUSTRATES]->(lo_qa_435);

// Re-anchor Q&A: 162342
MERGE (qa_436:QA_Pair {id: '162342'})
MERGE (p_qa_436:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_436:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_436)-[:INTERPRETS]->(p_qa_436)
MERGE (qa_436)-[:ILLUSTRATES]->(lo_qa_436);

// Re-anchor Q&A: 162338
MERGE (qa_437:QA_Pair {id: '162338'})
MERGE (p_qa_437:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_437:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_437)-[:INTERPRETS]->(p_qa_437)
MERGE (qa_437)-[:ILLUSTRATES]->(lo_qa_437);

// Re-anchor Q&A: 162302
MERGE (qa_438:QA_Pair {id: '162302'})
MERGE (p_qa_438:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_438:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_438)-[:INTERPRETS]->(p_qa_438)
MERGE (qa_438)-[:ILLUSTRATES]->(lo_qa_438);

// Re-anchor Q&A: 162337
MERGE (qa_439:QA_Pair {id: '162337'})
MERGE (p_qa_439:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_439:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_439)-[:INTERPRETS]->(p_qa_439)
MERGE (qa_439)-[:ILLUSTRATES]->(lo_qa_439);

// Re-anchor Q&A: 161977
MERGE (qa_440:QA_Pair {id: '161977'})
MERGE (p_qa_440:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_440:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_440)-[:INTERPRETS]->(p_qa_440)
MERGE (qa_440)-[:ILLUSTRATES]->(lo_qa_440);

// Re-anchor Q&A: 162119
MERGE (qa_441:QA_Pair {id: '162119'})
MERGE (p_qa_441:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_441:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_441)-[:INTERPRETS]->(p_qa_441)
MERGE (qa_441)-[:ILLUSTRATES]->(lo_qa_441);

// Re-anchor Q&A: 162319
MERGE (qa_442:QA_Pair {id: '162319'})
MERGE (p_qa_442:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_442:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_442)-[:INTERPRETS]->(p_qa_442)
MERGE (qa_442)-[:ILLUSTRATES]->(lo_qa_442);

// Re-anchor Q&A: 162298
MERGE (qa_443:QA_Pair {id: '162298'})
MERGE (p_qa_443:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_443:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_443)-[:INTERPRETS]->(p_qa_443)
MERGE (qa_443)-[:ILLUSTRATES]->(lo_qa_443);

// Re-anchor Q&A: 161510
MERGE (qa_444:QA_Pair {id: '161510'})
MERGE (p_qa_444:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_444:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_444)-[:INTERPRETS]->(p_qa_444)
MERGE (qa_444)-[:ILLUSTRATES]->(lo_qa_444);

// Re-anchor Q&A: 162423
MERGE (qa_445:QA_Pair {id: '162423'})
MERGE (p_qa_445:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_445:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_445)-[:INTERPRETS]->(p_qa_445)
MERGE (qa_445)-[:ILLUSTRATES]->(lo_qa_445);

// Re-anchor Q&A: 161880
MERGE (qa_446:QA_Pair {id: '161880'})
MERGE (p_qa_446:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_446:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_446)-[:INTERPRETS]->(p_qa_446)
MERGE (qa_446)-[:ILLUSTRATES]->(lo_qa_446);

// Re-anchor Q&A: 162109
MERGE (qa_447:QA_Pair {id: '162109'})
MERGE (p_qa_447:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_447:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_447)-[:INTERPRETS]->(p_qa_447)
MERGE (qa_447)-[:ILLUSTRATES]->(lo_qa_447);

// Re-anchor Q&A: 162224
MERGE (qa_448:QA_Pair {id: '162224'})
MERGE (p_qa_448:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_448:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_448)-[:INTERPRETS]->(p_qa_448)
MERGE (qa_448)-[:ILLUSTRATES]->(lo_qa_448);

// Re-anchor Q&A: 161752
MERGE (qa_449:QA_Pair {id: '161752'})
MERGE (p_qa_449:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_449:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_449)-[:INTERPRETS]->(p_qa_449)
MERGE (qa_449)-[:ILLUSTRATES]->(lo_qa_449);

// Re-anchor Q&A: 161945
MERGE (qa_450:QA_Pair {id: '161945'})
MERGE (p_qa_450:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_450:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_450)-[:INTERPRETS]->(p_qa_450)
MERGE (qa_450)-[:ILLUSTRATES]->(lo_qa_450);

// Re-anchor Q&A: 162115
MERGE (qa_451:QA_Pair {id: '162115'})
MERGE (p_qa_451:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_451:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_451)-[:INTERPRETS]->(p_qa_451)
MERGE (qa_451)-[:ILLUSTRATES]->(lo_qa_451);

// Re-anchor Q&A: 162424
MERGE (qa_452:QA_Pair {id: '162424'})
MERGE (p_qa_452:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_452:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_452)-[:INTERPRETS]->(p_qa_452)
MERGE (qa_452)-[:ILLUSTRATES]->(lo_qa_452);

// Re-anchor Q&A: 162125
MERGE (qa_453:QA_Pair {id: '162125'})
MERGE (p_qa_453:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_453:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_453)-[:INTERPRETS]->(p_qa_453)
MERGE (qa_453)-[:ILLUSTRATES]->(lo_qa_453);

// Re-anchor Q&A: 162300
MERGE (qa_454:QA_Pair {id: '162300'})
MERGE (p_qa_454:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_454:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_454)-[:INTERPRETS]->(p_qa_454)
MERGE (qa_454)-[:ILLUSTRATES]->(lo_qa_454);

// Re-anchor Q&A: 162303
MERGE (qa_455:QA_Pair {id: '162303'})
MERGE (p_qa_455:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_455:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_455)-[:INTERPRETS]->(p_qa_455)
MERGE (qa_455)-[:ILLUSTRATES]->(lo_qa_455);

// Re-anchor Q&A: 161900
MERGE (qa_456:QA_Pair {id: '161900'})
MERGE (p_qa_456:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_456:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_456)-[:INTERPRETS]->(p_qa_456)
MERGE (qa_456)-[:ILLUSTRATES]->(lo_qa_456);

// Re-anchor Q&A: 162239
MERGE (qa_457:QA_Pair {id: '162239'})
MERGE (p_qa_457:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_457:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_457)-[:INTERPRETS]->(p_qa_457)
MERGE (qa_457)-[:ILLUSTRATES]->(lo_qa_457);

// Re-anchor Q&A: 162164
MERGE (qa_458:QA_Pair {id: '162164'})
MERGE (p_qa_458:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_458:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_458)-[:INTERPRETS]->(p_qa_458)
MERGE (qa_458)-[:ILLUSTRATES]->(lo_qa_458);

// Re-anchor Q&A: 162306
MERGE (qa_459:QA_Pair {id: '162306'})
MERGE (p_qa_459:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_459:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_459)-[:INTERPRETS]->(p_qa_459)
MERGE (qa_459)-[:ILLUSTRATES]->(lo_qa_459);

// Re-anchor Q&A: 162305
MERGE (qa_460:QA_Pair {id: '162305'})
MERGE (p_qa_460:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_460:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_460)-[:INTERPRETS]->(p_qa_460)
MERGE (qa_460)-[:ILLUSTRATES]->(lo_qa_460);

// Re-anchor Q&A: 162333
MERGE (qa_461:QA_Pair {id: '162333'})
MERGE (p_qa_461:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_461:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_461)-[:INTERPRETS]->(p_qa_461)
MERGE (qa_461)-[:ILLUSTRATES]->(lo_qa_461);

// Re-anchor Q&A: 162117
MERGE (qa_462:QA_Pair {id: '162117'})
MERGE (p_qa_462:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_462:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_462)-[:INTERPRETS]->(p_qa_462)
MERGE (qa_462)-[:ILLUSTRATES]->(lo_qa_462);

// Re-anchor Q&A: 162291
MERGE (qa_463:QA_Pair {id: '162291'})
MERGE (p_qa_463:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_463:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_463)-[:INTERPRETS]->(p_qa_463)
MERGE (qa_463)-[:ILLUSTRATES]->(lo_qa_463);

// Re-anchor Q&A: 162363
MERGE (qa_464:QA_Pair {id: '162363'})
MERGE (p_qa_464:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_464:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_464)-[:INTERPRETS]->(p_qa_464)
MERGE (qa_464)-[:ILLUSTRATES]->(lo_qa_464);

// Re-anchor Q&A: 161488
MERGE (qa_465:QA_Pair {id: '161488'})
MERGE (p_qa_465:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_465:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_465)-[:INTERPRETS]->(p_qa_465)
MERGE (qa_465)-[:ILLUSTRATES]->(lo_qa_465);

// Re-anchor Q&A: 161509
MERGE (qa_466:QA_Pair {id: '161509'})
MERGE (p_qa_466:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_466:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_466)-[:INTERPRETS]->(p_qa_466)
MERGE (qa_466)-[:ILLUSTRATES]->(lo_qa_466);

// Re-anchor Q&A: 161487
MERGE (qa_467:QA_Pair {id: '161487'})
MERGE (p_qa_467:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_467:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_467)-[:INTERPRETS]->(p_qa_467)
MERGE (qa_467)-[:ILLUSTRATES]->(lo_qa_467);

// Re-anchor Q&A: 161905
MERGE (qa_468:QA_Pair {id: '161905'})
MERGE (p_qa_468:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_468:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_468)-[:INTERPRETS]->(p_qa_468)
MERGE (qa_468)-[:ILLUSTRATES]->(lo_qa_468);

// Re-anchor Q&A: 161775
MERGE (qa_469:QA_Pair {id: '161775'})
MERGE (p_qa_469:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_469:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_469)-[:INTERPRETS]->(p_qa_469)
MERGE (qa_469)-[:ILLUSTRATES]->(lo_qa_469);

// Re-anchor Q&A: 161741
MERGE (qa_470:QA_Pair {id: '161741'})
MERGE (p_qa_470:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_470:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_470)-[:INTERPRETS]->(p_qa_470)
MERGE (qa_470)-[:ILLUSTRATES]->(lo_qa_470);

// Re-anchor Q&A: 161792
MERGE (qa_471:QA_Pair {id: '161792'})
MERGE (p_qa_471:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_471:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_471)-[:INTERPRETS]->(p_qa_471)
MERGE (qa_471)-[:ILLUSTRATES]->(lo_qa_471);

// Re-anchor Q&A: 161889
MERGE (qa_472:QA_Pair {id: '161889'})
MERGE (p_qa_472:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_472:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_472)-[:INTERPRETS]->(p_qa_472)
MERGE (qa_472)-[:ILLUSTRATES]->(lo_qa_472);

// Re-anchor Q&A: 162301
MERGE (qa_473:QA_Pair {id: '162301'})
MERGE (p_qa_473:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_473:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_473)-[:INTERPRETS]->(p_qa_473)
MERGE (qa_473)-[:ILLUSTRATES]->(lo_qa_473);

// Re-anchor Q&A: 162243
MERGE (qa_474:QA_Pair {id: '162243'})
MERGE (p_qa_474:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_474:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_474)-[:INTERPRETS]->(p_qa_474)
MERGE (qa_474)-[:ILLUSTRATES]->(lo_qa_474);

// Re-anchor Q&A: 162185
MERGE (qa_475:QA_Pair {id: '162185'})
MERGE (p_qa_475:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_475:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_475)-[:INTERPRETS]->(p_qa_475)
MERGE (qa_475)-[:ILLUSTRATES]->(lo_qa_475);

// Re-anchor Q&A: 161364
MERGE (qa_476:QA_Pair {id: '161364'})
MERGE (p_qa_476:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_476:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_476)-[:INTERPRETS]->(p_qa_476)
MERGE (qa_476)-[:ILLUSTRATES]->(lo_qa_476);

// Re-anchor Q&A: 162204
MERGE (qa_477:QA_Pair {id: '162204'})
MERGE (p_qa_477:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_477:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_477)-[:INTERPRETS]->(p_qa_477)
MERGE (qa_477)-[:ILLUSTRATES]->(lo_qa_477);

// Re-anchor Q&A: 161468
MERGE (qa_478:QA_Pair {id: '161468'})
MERGE (p_qa_478:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_478:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_478)-[:INTERPRETS]->(p_qa_478)
MERGE (qa_478)-[:ILLUSTRATES]->(lo_qa_478);

// Re-anchor Q&A: 162230
MERGE (qa_479:QA_Pair {id: '162230'})
MERGE (p_qa_479:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_479:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_479)-[:INTERPRETS]->(p_qa_479)
MERGE (qa_479)-[:ILLUSTRATES]->(lo_qa_479);

// Re-anchor Q&A: 162073
MERGE (qa_480:QA_Pair {id: '162073'})
MERGE (p_qa_480:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_480:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_480)-[:INTERPRETS]->(p_qa_480)
MERGE (qa_480)-[:ILLUSTRATES]->(lo_qa_480);

// Re-anchor Q&A: 162080
MERGE (qa_481:QA_Pair {id: '162080'})
MERGE (p_qa_481:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_481:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_481)-[:INTERPRETS]->(p_qa_481)
MERGE (qa_481)-[:ILLUSTRATES]->(lo_qa_481);

// Re-anchor Q&A: 161251
MERGE (qa_482:QA_Pair {id: '161251'})
MERGE (p_qa_482:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_482:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_482)-[:INTERPRETS]->(p_qa_482)
MERGE (qa_482)-[:ILLUSTRATES]->(lo_qa_482);

// Re-anchor Q&A: 162116
MERGE (qa_483:QA_Pair {id: '162116'})
MERGE (p_qa_483:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_483:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_483)-[:INTERPRETS]->(p_qa_483)
MERGE (qa_483)-[:ILLUSTRATES]->(lo_qa_483);

// Re-anchor Q&A: 161486
MERGE (qa_484:QA_Pair {id: '161486'})
MERGE (p_qa_484:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_484:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_484)-[:INTERPRETS]->(p_qa_484)
MERGE (qa_484)-[:ILLUSTRATES]->(lo_qa_484);

// Re-anchor Q&A: 161482
MERGE (qa_485:QA_Pair {id: '161482'})
MERGE (p_qa_485:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_485:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_485)-[:INTERPRETS]->(p_qa_485)
MERGE (qa_485)-[:ILLUSTRATES]->(lo_qa_485);

// Re-anchor Q&A: 161927
MERGE (qa_486:QA_Pair {id: '161927'})
MERGE (p_qa_486:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_486:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_486)-[:INTERPRETS]->(p_qa_486)
MERGE (qa_486)-[:ILLUSTRATES]->(lo_qa_486);

// Re-anchor Q&A: 162118
MERGE (qa_487:QA_Pair {id: '162118'})
MERGE (p_qa_487:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_487:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_487)-[:INTERPRETS]->(p_qa_487)
MERGE (qa_487)-[:ILLUSTRATES]->(lo_qa_487);

// Re-anchor Q&A: 161918
MERGE (qa_488:QA_Pair {id: '161918'})
MERGE (p_qa_488:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_488:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_488)-[:INTERPRETS]->(p_qa_488)
MERGE (qa_488)-[:ILLUSTRATES]->(lo_qa_488);

// Re-anchor Q&A: 162198
MERGE (qa_489:QA_Pair {id: '162198'})
MERGE (p_qa_489:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_489:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_489)-[:INTERPRETS]->(p_qa_489)
MERGE (qa_489)-[:ILLUSTRATES]->(lo_qa_489);

// Re-anchor Q&A: 161749
MERGE (qa_490:QA_Pair {id: '161749'})
MERGE (p_qa_490:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_490:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_490)-[:INTERPRETS]->(p_qa_490)
MERGE (qa_490)-[:ILLUSTRATES]->(lo_qa_490);

// Re-anchor Q&A: 161676
MERGE (qa_491:QA_Pair {id: '161676'})
MERGE (p_qa_491:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_491:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_491)-[:INTERPRETS]->(p_qa_491)
MERGE (qa_491)-[:ILLUSTRATES]->(lo_qa_491);

// Re-anchor Q&A: 161917
MERGE (qa_492:QA_Pair {id: '161917'})
MERGE (p_qa_492:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_492:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_492)-[:INTERPRETS]->(p_qa_492)
MERGE (qa_492)-[:ILLUSTRATES]->(lo_qa_492);

// Re-anchor Q&A: 161801
MERGE (qa_493:QA_Pair {id: '161801'})
MERGE (p_qa_493:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_493:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_493)-[:INTERPRETS]->(p_qa_493)
MERGE (qa_493)-[:ILLUSTRATES]->(lo_qa_493);

// Re-anchor Q&A: 161385
MERGE (qa_494:QA_Pair {id: '161385'})
MERGE (p_qa_494:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_494:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_494)-[:INTERPRETS]->(p_qa_494)
MERGE (qa_494)-[:ILLUSTRATES]->(lo_qa_494);

// Re-anchor Q&A: 161964
MERGE (qa_495:QA_Pair {id: '161964'})
MERGE (p_qa_495:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_495:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_495)-[:INTERPRETS]->(p_qa_495)
MERGE (qa_495)-[:ILLUSTRATES]->(lo_qa_495);

// Re-anchor Q&A: 160891
MERGE (qa_496:QA_Pair {id: '160891'})
MERGE (p_qa_496:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_496:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_496)-[:INTERPRETS]->(p_qa_496)
MERGE (qa_496)-[:ILLUSTRATES]->(lo_qa_496);

// Re-anchor Q&A: 161788
MERGE (qa_497:QA_Pair {id: '161788'})
MERGE (p_qa_497:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_497:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_497)-[:INTERPRETS]->(p_qa_497)
MERGE (qa_497)-[:ILLUSTRATES]->(lo_qa_497);

// Re-anchor Q&A: 161071
MERGE (qa_498:QA_Pair {id: '161071'})
MERGE (p_qa_498:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_498:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_498)-[:INTERPRETS]->(p_qa_498)
MERGE (qa_498)-[:ILLUSTRATES]->(lo_qa_498);

// Re-anchor Q&A: 161883
MERGE (qa_499:QA_Pair {id: '161883'})
MERGE (p_qa_499:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_499:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_499)-[:INTERPRETS]->(p_qa_499)
MERGE (qa_499)-[:ILLUSTRATES]->(lo_qa_499);

// Re-anchor Q&A: 161748
MERGE (qa_500:QA_Pair {id: '161748'})
MERGE (p_qa_500:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_500:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_500)-[:INTERPRETS]->(p_qa_500)
MERGE (qa_500)-[:ILLUSTRATES]->(lo_qa_500);

// Re-anchor Q&A: 163998
MERGE (qa_501:QA_Pair {id: '163998'})
MERGE (p_qa_501:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_501:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_501)-[:INTERPRETS]->(p_qa_501)
MERGE (qa_501)-[:ILLUSTRATES]->(lo_qa_501);

// Re-anchor Q&A: 163279
MERGE (qa_502:QA_Pair {id: '163279'})
MERGE (p_qa_502:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_502:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_502)-[:INTERPRETS]->(p_qa_502)
MERGE (qa_502)-[:ILLUSTRATES]->(lo_qa_502);

// Re-anchor Q&A: 158677
MERGE (qa_503:QA_Pair {id: '158677'})
MERGE (p_qa_503:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_503:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_503)-[:INTERPRETS]->(p_qa_503)
MERGE (qa_503)-[:ILLUSTRATES]->(lo_qa_503);

// Re-anchor Q&A: 161914
MERGE (qa_504:QA_Pair {id: '161914'})
MERGE (p_qa_504:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_504:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_504)-[:INTERPRETS]->(p_qa_504)
MERGE (qa_504)-[:ILLUSTRATES]->(lo_qa_504);

// Re-anchor Q&A: 161914
MERGE (qa_505:QA_Pair {id: '161914'})
MERGE (p_qa_505:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_505:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_505)-[:INTERPRETS]->(p_qa_505)
MERGE (qa_505)-[:ILLUSTRATES]->(lo_qa_505);

// Re-anchor Q&A: 161711
MERGE (qa_506:QA_Pair {id: '161711'})
MERGE (p_qa_506:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_506:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_506)-[:INTERPRETS]->(p_qa_506)
MERGE (qa_506)-[:ILLUSTRATES]->(lo_qa_506);

// Re-anchor Q&A: 160970
MERGE (qa_507:QA_Pair {id: '160970'})
MERGE (p_qa_507:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_507:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_507)-[:INTERPRETS]->(p_qa_507)
MERGE (qa_507)-[:ILLUSTRATES]->(lo_qa_507);

// Re-anchor Q&A: 161714
MERGE (qa_508:QA_Pair {id: '161714'})
MERGE (p_qa_508:LegalParagraph {id: 'PARA_L67_D9'})
MERGE (lo_qa_508:Atomic_LO {id: 'LO_CIT_DEDUCTIBLE_EXPENSE_RULE'})
MERGE (qa_508)-[:INTERPRETS]->(p_qa_508)
MERGE (qa_508)-[:ILLUSTRATES]->(lo_qa_508);

// Re-anchor Q&A: 161803
MERGE (qa_509:QA_Pair {id: '161803'})
MERGE (p_qa_509:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_509:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_509)-[:INTERPRETS]->(p_qa_509)
MERGE (qa_509)-[:ILLUSTRATES]->(lo_qa_509);

// Re-anchor Q&A: 161271
MERGE (qa_510:QA_Pair {id: '161271'})
MERGE (p_qa_510:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_510:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_510)-[:INTERPRETS]->(p_qa_510)
MERGE (qa_510)-[:ILLUSTRATES]->(lo_qa_510);

// Re-anchor Q&A: 161766
MERGE (qa_511:QA_Pair {id: '161766'})
MERGE (p_qa_511:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_511:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_511)-[:INTERPRETS]->(p_qa_511)
MERGE (qa_511)-[:ILLUSTRATES]->(lo_qa_511);

// Re-anchor Q&A: 161461
MERGE (qa_512:QA_Pair {id: '161461'})
MERGE (p_qa_512:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_512:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_512)-[:INTERPRETS]->(p_qa_512)
MERGE (qa_512)-[:ILLUSTRATES]->(lo_qa_512);

// Re-anchor Q&A: 160189
MERGE (qa_513:QA_Pair {id: '160189'})
MERGE (p_qa_513:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_513:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_513)-[:INTERPRETS]->(p_qa_513)
MERGE (qa_513)-[:ILLUSTRATES]->(lo_qa_513);

// Re-anchor Q&A: 161678
MERGE (qa_514:QA_Pair {id: '161678'})
MERGE (p_qa_514:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_514:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_514)-[:INTERPRETS]->(p_qa_514)
MERGE (qa_514)-[:ILLUSTRATES]->(lo_qa_514);

// Re-anchor Q&A: 161080
MERGE (qa_515:QA_Pair {id: '161080'})
MERGE (p_qa_515:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_515:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_515)-[:INTERPRETS]->(p_qa_515)
MERGE (qa_515)-[:ILLUSTRATES]->(lo_qa_515);

// Re-anchor Q&A: 161854
MERGE (qa_516:QA_Pair {id: '161854'})
MERGE (p_qa_516:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_516:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_516)-[:INTERPRETS]->(p_qa_516)
MERGE (qa_516)-[:ILLUSTRATES]->(lo_qa_516);

// Re-anchor Q&A: 161932
MERGE (qa_517:QA_Pair {id: '161932'})
MERGE (p_qa_517:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_517:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_517)-[:INTERPRETS]->(p_qa_517)
MERGE (qa_517)-[:ILLUSTRATES]->(lo_qa_517);

// Re-anchor Q&A: 160825
MERGE (qa_518:QA_Pair {id: '160825'})
MERGE (p_qa_518:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_518:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_518)-[:INTERPRETS]->(p_qa_518)
MERGE (qa_518)-[:ILLUSTRATES]->(lo_qa_518);

// Re-anchor Q&A: 161828
MERGE (qa_519:QA_Pair {id: '161828'})
MERGE (p_qa_519:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_519:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_519)-[:INTERPRETS]->(p_qa_519)
MERGE (qa_519)-[:ILLUSTRATES]->(lo_qa_519);

// Re-anchor Q&A: 160700
MERGE (qa_520:QA_Pair {id: '160700'})
MERGE (p_qa_520:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_520:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_520)-[:INTERPRETS]->(p_qa_520)
MERGE (qa_520)-[:ILLUSTRATES]->(lo_qa_520);

// Re-anchor Q&A: 161471
MERGE (qa_521:QA_Pair {id: '161471'})
MERGE (p_qa_521:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_521:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_521)-[:INTERPRETS]->(p_qa_521)
MERGE (qa_521)-[:ILLUSTRATES]->(lo_qa_521);

// Re-anchor Q&A: 161267
MERGE (qa_522:QA_Pair {id: '161267'})
MERGE (p_qa_522:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_522:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_522)-[:INTERPRETS]->(p_qa_522)
MERGE (qa_522)-[:ILLUSTRATES]->(lo_qa_522);

// Re-anchor Q&A: 161740
MERGE (qa_523:QA_Pair {id: '161740'})
MERGE (p_qa_523:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_523:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_523)-[:INTERPRETS]->(p_qa_523)
MERGE (qa_523)-[:ILLUSTRATES]->(lo_qa_523);

// Re-anchor Q&A: 160787
MERGE (qa_524:QA_Pair {id: '160787'})
MERGE (p_qa_524:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_524:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_524)-[:INTERPRETS]->(p_qa_524)
MERGE (qa_524)-[:ILLUSTRATES]->(lo_qa_524);

// Re-anchor Q&A: 161613
MERGE (qa_525:QA_Pair {id: '161613'})
MERGE (p_qa_525:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_525:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_525)-[:INTERPRETS]->(p_qa_525)
MERGE (qa_525)-[:ILLUSTRATES]->(lo_qa_525);

// Re-anchor Q&A: 160369
MERGE (qa_526:QA_Pair {id: '160369'})
MERGE (p_qa_526:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_526:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_526)-[:INTERPRETS]->(p_qa_526)
MERGE (qa_526)-[:ILLUSTRATES]->(lo_qa_526);

// Re-anchor Q&A: 161490
MERGE (qa_527:QA_Pair {id: '161490'})
MERGE (p_qa_527:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_527:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_527)-[:INTERPRETS]->(p_qa_527)
MERGE (qa_527)-[:ILLUSTRATES]->(lo_qa_527);

// Re-anchor Q&A: 160998
MERGE (qa_528:QA_Pair {id: '160998'})
MERGE (p_qa_528:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_528:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_528)-[:INTERPRETS]->(p_qa_528)
MERGE (qa_528)-[:ILLUSTRATES]->(lo_qa_528);

// Re-anchor Q&A: 161619
MERGE (qa_529:QA_Pair {id: '161619'})
MERGE (p_qa_529:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_529:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_529)-[:INTERPRETS]->(p_qa_529)
MERGE (qa_529)-[:ILLUSTRATES]->(lo_qa_529);

// Re-anchor Q&A: 161738
MERGE (qa_530:QA_Pair {id: '161738'})
MERGE (p_qa_530:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_530:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_530)-[:INTERPRETS]->(p_qa_530)
MERGE (qa_530)-[:ILLUSTRATES]->(lo_qa_530);

// Re-anchor Q&A: 161631
MERGE (qa_531:QA_Pair {id: '161631'})
MERGE (p_qa_531:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_531:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_531)-[:INTERPRETS]->(p_qa_531)
MERGE (qa_531)-[:ILLUSTRATES]->(lo_qa_531);

// Re-anchor Q&A: 161666
MERGE (qa_532:QA_Pair {id: '161666'})
MERGE (p_qa_532:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_532:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_532)-[:INTERPRETS]->(p_qa_532)
MERGE (qa_532)-[:ILLUSTRATES]->(lo_qa_532);

// Re-anchor Q&A: 160908
MERGE (qa_533:QA_Pair {id: '160908'})
MERGE (p_qa_533:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_533:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_533)-[:INTERPRETS]->(p_qa_533)
MERGE (qa_533)-[:ILLUSTRATES]->(lo_qa_533);

// Re-anchor Q&A: 160307
MERGE (qa_534:QA_Pair {id: '160307'})
MERGE (p_qa_534:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_534:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_534)-[:INTERPRETS]->(p_qa_534)
MERGE (qa_534)-[:ILLUSTRATES]->(lo_qa_534);

// Re-anchor Q&A: 159671
MERGE (qa_535:QA_Pair {id: '159671'})
MERGE (p_qa_535:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_535:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_535)-[:INTERPRETS]->(p_qa_535)
MERGE (qa_535)-[:ILLUSTRATES]->(lo_qa_535);

// Re-anchor Q&A: 161545
MERGE (qa_536:QA_Pair {id: '161545'})
MERGE (p_qa_536:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_536:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_536)-[:INTERPRETS]->(p_qa_536)
MERGE (qa_536)-[:ILLUSTRATES]->(lo_qa_536);

// Re-anchor Q&A: 161286
MERGE (qa_537:QA_Pair {id: '161286'})
MERGE (p_qa_537:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_537:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_537)-[:INTERPRETS]->(p_qa_537)
MERGE (qa_537)-[:ILLUSTRATES]->(lo_qa_537);

// Re-anchor Q&A: 160737
MERGE (qa_538:QA_Pair {id: '160737'})
MERGE (p_qa_538:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_538:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_538)-[:INTERPRETS]->(p_qa_538)
MERGE (qa_538)-[:ILLUSTRATES]->(lo_qa_538);

// Re-anchor Q&A: 161414
MERGE (qa_539:QA_Pair {id: '161414'})
MERGE (p_qa_539:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_539:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_539)-[:INTERPRETS]->(p_qa_539)
MERGE (qa_539)-[:ILLUSTRATES]->(lo_qa_539);

// Re-anchor Q&A: 160364
MERGE (qa_540:QA_Pair {id: '160364'})
MERGE (p_qa_540:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_540:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_540)-[:INTERPRETS]->(p_qa_540)
MERGE (qa_540)-[:ILLUSTRATES]->(lo_qa_540);

// Re-anchor Q&A: 160513
MERGE (qa_541:QA_Pair {id: '160513'})
MERGE (p_qa_541:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_541:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_541)-[:INTERPRETS]->(p_qa_541)
MERGE (qa_541)-[:ILLUSTRATES]->(lo_qa_541);

// Re-anchor Q&A: 159538
MERGE (qa_542:QA_Pair {id: '159538'})
MERGE (p_qa_542:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_542:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_542)-[:INTERPRETS]->(p_qa_542)
MERGE (qa_542)-[:ILLUSTRATES]->(lo_qa_542);

// Re-anchor Q&A: 161427
MERGE (qa_543:QA_Pair {id: '161427'})
MERGE (p_qa_543:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_543:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_543)-[:INTERPRETS]->(p_qa_543)
MERGE (qa_543)-[:ILLUSTRATES]->(lo_qa_543);

// Re-anchor Q&A: 160525
MERGE (qa_544:QA_Pair {id: '160525'})
MERGE (p_qa_544:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_544:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_544)-[:INTERPRETS]->(p_qa_544)
MERGE (qa_544)-[:ILLUSTRATES]->(lo_qa_544);

// Re-anchor Q&A: 160826
MERGE (qa_545:QA_Pair {id: '160826'})
MERGE (p_qa_545:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_545:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_545)-[:INTERPRETS]->(p_qa_545)
MERGE (qa_545)-[:ILLUSTRATES]->(lo_qa_545);

// Re-anchor Q&A: 160797
MERGE (qa_546:QA_Pair {id: '160797'})
MERGE (p_qa_546:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_546:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_546)-[:INTERPRETS]->(p_qa_546)
MERGE (qa_546)-[:ILLUSTRATES]->(lo_qa_546);

// Re-anchor Q&A: 160497
MERGE (qa_547:QA_Pair {id: '160497'})
MERGE (p_qa_547:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_547:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_547)-[:INTERPRETS]->(p_qa_547)
MERGE (qa_547)-[:ILLUSTRATES]->(lo_qa_547);

// Re-anchor Q&A: 160462
MERGE (qa_548:QA_Pair {id: '160462'})
MERGE (p_qa_548:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_548:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_548)-[:INTERPRETS]->(p_qa_548)
MERGE (qa_548)-[:ILLUSTRATES]->(lo_qa_548);

// Re-anchor Q&A: 160792
MERGE (qa_549:QA_Pair {id: '160792'})
MERGE (p_qa_549:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_549:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_549)-[:INTERPRETS]->(p_qa_549)
MERGE (qa_549)-[:ILLUSTRATES]->(lo_qa_549);

// Re-anchor Q&A: 160914
MERGE (qa_550:QA_Pair {id: '160914'})
MERGE (p_qa_550:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_550:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_550)-[:INTERPRETS]->(p_qa_550)
MERGE (qa_550)-[:ILLUSTRATES]->(lo_qa_550);

// Re-anchor Q&A: 161250
MERGE (qa_551:QA_Pair {id: '161250'})
MERGE (p_qa_551:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_551:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_551)-[:INTERPRETS]->(p_qa_551)
MERGE (qa_551)-[:ILLUSTRATES]->(lo_qa_551);

// Re-anchor Q&A: 160735
MERGE (qa_552:QA_Pair {id: '160735'})
MERGE (p_qa_552:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_552:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_552)-[:INTERPRETS]->(p_qa_552)
MERGE (qa_552)-[:ILLUSTRATES]->(lo_qa_552);

// Re-anchor Q&A: 161281
MERGE (qa_553:QA_Pair {id: '161281'})
MERGE (p_qa_553:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_553:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_553)-[:INTERPRETS]->(p_qa_553)
MERGE (qa_553)-[:ILLUSTRATES]->(lo_qa_553);

// Re-anchor Q&A: 161481
MERGE (qa_554:QA_Pair {id: '161481'})
MERGE (p_qa_554:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_554:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_554)-[:INTERPRETS]->(p_qa_554)
MERGE (qa_554)-[:ILLUSTRATES]->(lo_qa_554);

// Re-anchor Q&A: 160974
MERGE (qa_555:QA_Pair {id: '160974'})
MERGE (p_qa_555:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_555:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_555)-[:INTERPRETS]->(p_qa_555)
MERGE (qa_555)-[:ILLUSTRATES]->(lo_qa_555);

// Re-anchor Q&A: 160962
MERGE (qa_556:QA_Pair {id: '160962'})
MERGE (p_qa_556:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_556:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_556)-[:INTERPRETS]->(p_qa_556)
MERGE (qa_556)-[:ILLUSTRATES]->(lo_qa_556);

// Re-anchor Q&A: 161012
MERGE (qa_557:QA_Pair {id: '161012'})
MERGE (p_qa_557:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_557:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_557)-[:INTERPRETS]->(p_qa_557)
MERGE (qa_557)-[:ILLUSTRATES]->(lo_qa_557);

// Re-anchor Q&A: 161511
MERGE (qa_558:QA_Pair {id: '161511'})
MERGE (p_qa_558:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_558:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_558)-[:INTERPRETS]->(p_qa_558)
MERGE (qa_558)-[:ILLUSTRATES]->(lo_qa_558);

// Re-anchor Q&A: 161261
MERGE (qa_559:QA_Pair {id: '161261'})
MERGE (p_qa_559:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_559:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_559)-[:INTERPRETS]->(p_qa_559)
MERGE (qa_559)-[:ILLUSTRATES]->(lo_qa_559);

// Re-anchor Q&A: 161371
MERGE (qa_560:QA_Pair {id: '161371'})
MERGE (p_qa_560:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_560:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_560)-[:INTERPRETS]->(p_qa_560)
MERGE (qa_560)-[:ILLUSTRATES]->(lo_qa_560);

// Re-anchor Q&A: 159692
MERGE (qa_561:QA_Pair {id: '159692'})
MERGE (p_qa_561:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_561:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_561)-[:INTERPRETS]->(p_qa_561)
MERGE (qa_561)-[:ILLUSTRATES]->(lo_qa_561);

// Re-anchor Q&A: 161288
MERGE (qa_562:QA_Pair {id: '161288'})
MERGE (p_qa_562:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_562:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_562)-[:INTERPRETS]->(p_qa_562)
MERGE (qa_562)-[:ILLUSTRATES]->(lo_qa_562);

// Re-anchor Q&A: 160243
MERGE (qa_563:QA_Pair {id: '160243'})
MERGE (p_qa_563:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_563:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_563)-[:INTERPRETS]->(p_qa_563)
MERGE (qa_563)-[:ILLUSTRATES]->(lo_qa_563);

// Re-anchor Q&A: 159073
MERGE (qa_564:QA_Pair {id: '159073'})
MERGE (p_qa_564:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_564:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_564)-[:INTERPRETS]->(p_qa_564)
MERGE (qa_564)-[:ILLUSTRATES]->(lo_qa_564);

// Re-anchor Q&A: 161494
MERGE (qa_565:QA_Pair {id: '161494'})
MERGE (p_qa_565:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_565:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_565)-[:INTERPRETS]->(p_qa_565)
MERGE (qa_565)-[:ILLUSTRATES]->(lo_qa_565);

// Re-anchor Q&A: 158644
MERGE (qa_566:QA_Pair {id: '158644'})
MERGE (p_qa_566:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_566:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_566)-[:INTERPRETS]->(p_qa_566)
MERGE (qa_566)-[:ILLUSTRATES]->(lo_qa_566);

// Re-anchor Q&A: 160495
MERGE (qa_567:QA_Pair {id: '160495'})
MERGE (p_qa_567:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_567:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_567)-[:INTERPRETS]->(p_qa_567)
MERGE (qa_567)-[:ILLUSTRATES]->(lo_qa_567);

// Re-anchor Q&A: 160426
MERGE (qa_568:QA_Pair {id: '160426'})
MERGE (p_qa_568:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_568:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_568)-[:INTERPRETS]->(p_qa_568)
MERGE (qa_568)-[:ILLUSTRATES]->(lo_qa_568);

// Re-anchor Q&A: 161302
MERGE (qa_569:QA_Pair {id: '161302'})
MERGE (p_qa_569:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_569:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_569)-[:INTERPRETS]->(p_qa_569)
MERGE (qa_569)-[:ILLUSTRATES]->(lo_qa_569);

// Re-anchor Q&A: 161400
MERGE (qa_570:QA_Pair {id: '161400'})
MERGE (p_qa_570:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_570:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_570)-[:INTERPRETS]->(p_qa_570)
MERGE (qa_570)-[:ILLUSTRATES]->(lo_qa_570);

// Re-anchor Q&A: 161200
MERGE (qa_571:QA_Pair {id: '161200'})
MERGE (p_qa_571:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_571:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_571)-[:INTERPRETS]->(p_qa_571)
MERGE (qa_571)-[:ILLUSTRATES]->(lo_qa_571);

// Re-anchor Q&A: 161200
MERGE (qa_572:QA_Pair {id: '161200'})
MERGE (p_qa_572:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_572:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_572)-[:INTERPRETS]->(p_qa_572)
MERGE (qa_572)-[:ILLUSTRATES]->(lo_qa_572);

// Re-anchor Q&A: 160764
MERGE (qa_573:QA_Pair {id: '160764'})
MERGE (p_qa_573:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_573:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_573)-[:INTERPRETS]->(p_qa_573)
MERGE (qa_573)-[:ILLUSTRATES]->(lo_qa_573);

// Re-anchor Q&A: 161360
MERGE (qa_574:QA_Pair {id: '161360'})
MERGE (p_qa_574:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_574:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_574)-[:INTERPRETS]->(p_qa_574)
MERGE (qa_574)-[:ILLUSTRATES]->(lo_qa_574);

// Re-anchor Q&A: 160695
MERGE (qa_575:QA_Pair {id: '160695'})
MERGE (p_qa_575:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_575:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_575)-[:INTERPRETS]->(p_qa_575)
MERGE (qa_575)-[:ILLUSTRATES]->(lo_qa_575);

// Re-anchor Q&A: 160719
MERGE (qa_576:QA_Pair {id: '160719'})
MERGE (p_qa_576:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_576:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_576)-[:INTERPRETS]->(p_qa_576)
MERGE (qa_576)-[:ILLUSTRATES]->(lo_qa_576);

// Re-anchor Q&A: 161076
MERGE (qa_577:QA_Pair {id: '161076'})
MERGE (p_qa_577:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_577:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_577)-[:INTERPRETS]->(p_qa_577)
MERGE (qa_577)-[:ILLUSTRATES]->(lo_qa_577);

// Re-anchor Q&A: 161111
MERGE (qa_578:QA_Pair {id: '161111'})
MERGE (p_qa_578:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_578:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_578)-[:INTERPRETS]->(p_qa_578)
MERGE (qa_578)-[:ILLUSTRATES]->(lo_qa_578);

// Re-anchor Q&A: 160218
MERGE (qa_579:QA_Pair {id: '160218'})
MERGE (p_qa_579:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_579:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_579)-[:INTERPRETS]->(p_qa_579)
MERGE (qa_579)-[:ILLUSTRATES]->(lo_qa_579);

// Re-anchor Q&A: 160126
MERGE (qa_580:QA_Pair {id: '160126'})
MERGE (p_qa_580:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_580:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_580)-[:INTERPRETS]->(p_qa_580)
MERGE (qa_580)-[:ILLUSTRATES]->(lo_qa_580);

// Re-anchor Q&A: 159459
MERGE (qa_581:QA_Pair {id: '159459'})
MERGE (p_qa_581:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_581:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_581)-[:INTERPRETS]->(p_qa_581)
MERGE (qa_581)-[:ILLUSTRATES]->(lo_qa_581);

// Re-anchor Q&A: 159051
MERGE (qa_582:QA_Pair {id: '159051'})
MERGE (p_qa_582:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_582:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_582)-[:INTERPRETS]->(p_qa_582)
MERGE (qa_582)-[:ILLUSTRATES]->(lo_qa_582);

// Re-anchor Q&A: 160922
MERGE (qa_583:QA_Pair {id: '160922'})
MERGE (p_qa_583:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_583:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_583)-[:INTERPRETS]->(p_qa_583)
MERGE (qa_583)-[:ILLUSTRATES]->(lo_qa_583);

// Re-anchor Q&A: 159888
MERGE (qa_584:QA_Pair {id: '159888'})
MERGE (p_qa_584:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_584:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_584)-[:INTERPRETS]->(p_qa_584)
MERGE (qa_584)-[:ILLUSTRATES]->(lo_qa_584);

// Re-anchor Q&A: 159765
MERGE (qa_585:QA_Pair {id: '159765'})
MERGE (p_qa_585:LegalParagraph {id: 'PARA_L67_D9'})
MERGE (lo_qa_585:Atomic_LO {id: 'LO_CIT_DEDUCTIBLE_EXPENSE_RULE'})
MERGE (qa_585)-[:INTERPRETS]->(p_qa_585)
MERGE (qa_585)-[:ILLUSTRATES]->(lo_qa_585);

// Re-anchor Q&A: 159872
MERGE (qa_586:QA_Pair {id: '159872'})
MERGE (p_qa_586:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_586:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_586)-[:INTERPRETS]->(p_qa_586)
MERGE (qa_586)-[:ILLUSTRATES]->(lo_qa_586);

// Re-anchor Q&A: 159694
MERGE (qa_587:QA_Pair {id: '159694'})
MERGE (p_qa_587:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_587:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_587)-[:INTERPRETS]->(p_qa_587)
MERGE (qa_587)-[:ILLUSTRATES]->(lo_qa_587);

// Re-anchor Q&A: 158843
MERGE (qa_588:QA_Pair {id: '158843'})
MERGE (p_qa_588:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_588:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_588)-[:INTERPRETS]->(p_qa_588)
MERGE (qa_588)-[:ILLUSTRATES]->(lo_qa_588);

// Re-anchor Q&A: 159855
MERGE (qa_589:QA_Pair {id: '159855'})
MERGE (p_qa_589:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_589:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_589)-[:INTERPRETS]->(p_qa_589)
MERGE (qa_589)-[:ILLUSTRATES]->(lo_qa_589);

// Re-anchor Q&A: 160205
MERGE (qa_590:QA_Pair {id: '160205'})
MERGE (p_qa_590:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_590:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_590)-[:INTERPRETS]->(p_qa_590)
MERGE (qa_590)-[:ILLUSTRATES]->(lo_qa_590);

// Re-anchor Q&A: 160611
MERGE (qa_591:QA_Pair {id: '160611'})
MERGE (p_qa_591:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_591:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_591)-[:INTERPRETS]->(p_qa_591)
MERGE (qa_591)-[:ILLUSTRATES]->(lo_qa_591);

// Re-anchor Q&A: 160566
MERGE (qa_592:QA_Pair {id: '160566'})
MERGE (p_qa_592:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_592:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_592)-[:INTERPRETS]->(p_qa_592)
MERGE (qa_592)-[:ILLUSTRATES]->(lo_qa_592);

// Re-anchor Q&A: 160693
MERGE (qa_593:QA_Pair {id: '160693'})
MERGE (p_qa_593:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_593:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_593)-[:INTERPRETS]->(p_qa_593)
MERGE (qa_593)-[:ILLUSTRATES]->(lo_qa_593);

// Re-anchor Q&A: 160902
MERGE (qa_594:QA_Pair {id: '160902'})
MERGE (p_qa_594:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_594:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_594)-[:INTERPRETS]->(p_qa_594)
MERGE (qa_594)-[:ILLUSTRATES]->(lo_qa_594);

// Re-anchor Q&A: 160310
MERGE (qa_595:QA_Pair {id: '160310'})
MERGE (p_qa_595:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_595:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_595)-[:INTERPRETS]->(p_qa_595)
MERGE (qa_595)-[:ILLUSTRATES]->(lo_qa_595);

// Re-anchor Q&A: 161073
MERGE (qa_596:QA_Pair {id: '161073'})
MERGE (p_qa_596:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_596:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_596)-[:INTERPRETS]->(p_qa_596)
MERGE (qa_596)-[:ILLUSTRATES]->(lo_qa_596);

// Re-anchor Q&A: 161010
MERGE (qa_597:QA_Pair {id: '161010'})
MERGE (p_qa_597:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_597:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_597)-[:INTERPRETS]->(p_qa_597)
MERGE (qa_597)-[:ILLUSTRATES]->(lo_qa_597);

// Re-anchor Q&A: 160492
MERGE (qa_598:QA_Pair {id: '160492'})
MERGE (p_qa_598:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_598:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_598)-[:INTERPRETS]->(p_qa_598)
MERGE (qa_598)-[:ILLUSTRATES]->(lo_qa_598);

// Re-anchor Q&A: 160228
MERGE (qa_599:QA_Pair {id: '160228'})
MERGE (p_qa_599:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_599:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_599)-[:INTERPRETS]->(p_qa_599)
MERGE (qa_599)-[:ILLUSTRATES]->(lo_qa_599);

// Re-anchor Q&A: 160793
MERGE (qa_600:QA_Pair {id: '160793'})
MERGE (p_qa_600:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_600:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_600)-[:INTERPRETS]->(p_qa_600)
MERGE (qa_600)-[:ILLUSTRATES]->(lo_qa_600);

// Re-anchor Q&A: 160398
MERGE (qa_601:QA_Pair {id: '160398'})
MERGE (p_qa_601:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_601:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_601)-[:INTERPRETS]->(p_qa_601)
MERGE (qa_601)-[:ILLUSTRATES]->(lo_qa_601);

// Re-anchor Q&A: 159998
MERGE (qa_602:QA_Pair {id: '159998'})
MERGE (p_qa_602:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_602:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_602)-[:INTERPRETS]->(p_qa_602)
MERGE (qa_602)-[:ILLUSTRATES]->(lo_qa_602);

// Re-anchor Q&A: 159096
MERGE (qa_603:QA_Pair {id: '159096'})
MERGE (p_qa_603:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_603:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_603)-[:INTERPRETS]->(p_qa_603)
MERGE (qa_603)-[:ILLUSTRATES]->(lo_qa_603);

// Re-anchor Q&A: 160687
MERGE (qa_604:QA_Pair {id: '160687'})
MERGE (p_qa_604:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_604:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_604)-[:INTERPRETS]->(p_qa_604)
MERGE (qa_604)-[:ILLUSTRATES]->(lo_qa_604);

// Re-anchor Q&A: 160202
MERGE (qa_605:QA_Pair {id: '160202'})
MERGE (p_qa_605:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_605:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_605)-[:INTERPRETS]->(p_qa_605)
MERGE (qa_605)-[:ILLUSTRATES]->(lo_qa_605);

// Re-anchor Q&A: 160488
MERGE (qa_606:QA_Pair {id: '160488'})
MERGE (p_qa_606:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_606:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_606)-[:INTERPRETS]->(p_qa_606)
MERGE (qa_606)-[:ILLUSTRATES]->(lo_qa_606);

// Re-anchor Q&A: 158350
MERGE (qa_607:QA_Pair {id: '158350'})
MERGE (p_qa_607:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_607:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_607)-[:INTERPRETS]->(p_qa_607)
MERGE (qa_607)-[:ILLUSTRATES]->(lo_qa_607);

// Re-anchor Q&A: 160886
MERGE (qa_608:QA_Pair {id: '160886'})
MERGE (p_qa_608:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_608:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_608)-[:INTERPRETS]->(p_qa_608)
MERGE (qa_608)-[:ILLUSTRATES]->(lo_qa_608);

// Re-anchor Q&A: 160280
MERGE (qa_609:QA_Pair {id: '160280'})
MERGE (p_qa_609:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_609:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_609)-[:INTERPRETS]->(p_qa_609)
MERGE (qa_609)-[:ILLUSTRATES]->(lo_qa_609);

// Re-anchor Q&A: 160565
MERGE (qa_610:QA_Pair {id: '160565'})
MERGE (p_qa_610:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_610:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_610)-[:INTERPRETS]->(p_qa_610)
MERGE (qa_610)-[:ILLUSTRATES]->(lo_qa_610);

// Re-anchor Q&A: 160980
MERGE (qa_611:QA_Pair {id: '160980'})
MERGE (p_qa_611:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_611:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_611)-[:INTERPRETS]->(p_qa_611)
MERGE (qa_611)-[:ILLUSTRATES]->(lo_qa_611);

// Re-anchor Q&A: 160801
MERGE (qa_612:QA_Pair {id: '160801'})
MERGE (p_qa_612:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_612:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_612)-[:INTERPRETS]->(p_qa_612)
MERGE (qa_612)-[:ILLUSTRATES]->(lo_qa_612);

// Re-anchor Q&A: 160701
MERGE (qa_613:QA_Pair {id: '160701'})
MERGE (p_qa_613:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_613:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_613)-[:INTERPRETS]->(p_qa_613)
MERGE (qa_613)-[:ILLUSTRATES]->(lo_qa_613);

// Re-anchor Q&A: 160524
MERGE (qa_614:QA_Pair {id: '160524'})
MERGE (p_qa_614:LegalParagraph {id: 'PARA_L67_D9'})
MERGE (lo_qa_614:Atomic_LO {id: 'LO_CIT_DEDUCTIBLE_EXPENSE_RULE'})
MERGE (qa_614)-[:INTERPRETS]->(p_qa_614)
MERGE (qa_614)-[:ILLUSTRATES]->(lo_qa_614);

// Re-anchor Q&A: 160392
MERGE (qa_615:QA_Pair {id: '160392'})
MERGE (p_qa_615:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_615:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_615)-[:INTERPRETS]->(p_qa_615)
MERGE (qa_615)-[:ILLUSTRATES]->(lo_qa_615);

// Re-anchor Q&A: 161013
MERGE (qa_616:QA_Pair {id: '161013'})
MERGE (p_qa_616:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_616:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_616)-[:INTERPRETS]->(p_qa_616)
MERGE (qa_616)-[:ILLUSTRATES]->(lo_qa_616);

// Re-anchor Q&A: 160732
MERGE (qa_617:QA_Pair {id: '160732'})
MERGE (p_qa_617:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_617:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_617)-[:INTERPRETS]->(p_qa_617)
MERGE (qa_617)-[:ILLUSTRATES]->(lo_qa_617);

// Re-anchor Q&A: 160932
MERGE (qa_618:QA_Pair {id: '160932'})
MERGE (p_qa_618:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_618:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_618)-[:INTERPRETS]->(p_qa_618)
MERGE (qa_618)-[:ILLUSTRATES]->(lo_qa_618);

// Re-anchor Q&A: 160434
MERGE (qa_619:QA_Pair {id: '160434'})
MERGE (p_qa_619:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_619:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_619)-[:INTERPRETS]->(p_qa_619)
MERGE (qa_619)-[:ILLUSTRATES]->(lo_qa_619);

// Re-anchor Q&A: 159957
MERGE (qa_620:QA_Pair {id: '159957'})
MERGE (p_qa_620:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_620:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_620)-[:INTERPRETS]->(p_qa_620)
MERGE (qa_620)-[:ILLUSTRATES]->(lo_qa_620);

// Re-anchor Q&A: 160498
MERGE (qa_621:QA_Pair {id: '160498'})
MERGE (p_qa_621:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_621:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_621)-[:INTERPRETS]->(p_qa_621)
MERGE (qa_621)-[:ILLUSTRATES]->(lo_qa_621);

// Re-anchor Q&A: 160597
MERGE (qa_622:QA_Pair {id: '160597'})
MERGE (p_qa_622:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_622:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_622)-[:INTERPRETS]->(p_qa_622)
MERGE (qa_622)-[:ILLUSTRATES]->(lo_qa_622);

// Re-anchor Q&A: 160447
MERGE (qa_623:QA_Pair {id: '160447'})
MERGE (p_qa_623:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_623:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_623)-[:INTERPRETS]->(p_qa_623)
MERGE (qa_623)-[:ILLUSTRATES]->(lo_qa_623);

// Re-anchor Q&A: 159961
MERGE (qa_624:QA_Pair {id: '159961'})
MERGE (p_qa_624:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_624:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_624)-[:INTERPRETS]->(p_qa_624)
MERGE (qa_624)-[:ILLUSTRATES]->(lo_qa_624);

// Re-anchor Q&A: 160919
MERGE (qa_625:QA_Pair {id: '160919'})
MERGE (p_qa_625:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_625:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_625)-[:INTERPRETS]->(p_qa_625)
MERGE (qa_625)-[:ILLUSTRATES]->(lo_qa_625);

// Re-anchor Q&A: 160339
MERGE (qa_626:QA_Pair {id: '160339'})
MERGE (p_qa_626:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_626:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_626)-[:INTERPRETS]->(p_qa_626)
MERGE (qa_626)-[:ILLUSTRATES]->(lo_qa_626);

// Re-anchor Q&A: 160620
MERGE (qa_627:QA_Pair {id: '160620'})
MERGE (p_qa_627:LegalParagraph {id: 'PARA_L67_D9'})
MERGE (lo_qa_627:Atomic_LO {id: 'LO_CIT_DEDUCTIBLE_EXPENSE_RULE'})
MERGE (qa_627)-[:INTERPRETS]->(p_qa_627)
MERGE (qa_627)-[:ILLUSTRATES]->(lo_qa_627);

// Re-anchor Q&A: 160820
MERGE (qa_628:QA_Pair {id: '160820'})
MERGE (p_qa_628:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_628:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_628)-[:INTERPRETS]->(p_qa_628)
MERGE (qa_628)-[:ILLUSTRATES]->(lo_qa_628);

// Re-anchor Q&A: 160775
MERGE (qa_629:QA_Pair {id: '160775'})
MERGE (p_qa_629:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_629:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_629)-[:INTERPRETS]->(p_qa_629)
MERGE (qa_629)-[:ILLUSTRATES]->(lo_qa_629);

// Re-anchor Q&A: 160926
MERGE (qa_630:QA_Pair {id: '160926'})
MERGE (p_qa_630:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_630:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_630)-[:INTERPRETS]->(p_qa_630)
MERGE (qa_630)-[:ILLUSTRATES]->(lo_qa_630);

// Re-anchor Q&A: 160633
MERGE (qa_631:QA_Pair {id: '160633'})
MERGE (p_qa_631:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_631:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_631)-[:INTERPRETS]->(p_qa_631)
MERGE (qa_631)-[:ILLUSTRATES]->(lo_qa_631);

// Re-anchor Q&A: 160418
MERGE (qa_632:QA_Pair {id: '160418'})
MERGE (p_qa_632:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_632:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_632)-[:INTERPRETS]->(p_qa_632)
MERGE (qa_632)-[:ILLUSTRATES]->(lo_qa_632);

// Re-anchor Q&A: 160518
MERGE (qa_633:QA_Pair {id: '160518'})
MERGE (p_qa_633:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_633:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_633)-[:INTERPRETS]->(p_qa_633)
MERGE (qa_633)-[:ILLUSTRATES]->(lo_qa_633);

// Re-anchor Q&A: 160791
MERGE (qa_634:QA_Pair {id: '160791'})
MERGE (p_qa_634:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_634:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_634)-[:INTERPRETS]->(p_qa_634)
MERGE (qa_634)-[:ILLUSTRATES]->(lo_qa_634);

// Re-anchor Q&A: 160489
MERGE (qa_635:QA_Pair {id: '160489'})
MERGE (p_qa_635:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_635:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_635)-[:INTERPRETS]->(p_qa_635)
MERGE (qa_635)-[:ILLUSTRATES]->(lo_qa_635);

// Re-anchor Q&A: 160817
MERGE (qa_636:QA_Pair {id: '160817'})
MERGE (p_qa_636:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_636:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_636)-[:INTERPRETS]->(p_qa_636)
MERGE (qa_636)-[:ILLUSTRATES]->(lo_qa_636);

// Re-anchor Q&A: 160694
MERGE (qa_637:QA_Pair {id: '160694'})
MERGE (p_qa_637:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_637:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_637)-[:INTERPRETS]->(p_qa_637)
MERGE (qa_637)-[:ILLUSTRATES]->(lo_qa_637);

// Re-anchor Q&A: 160665
MERGE (qa_638:QA_Pair {id: '160665'})
MERGE (p_qa_638:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_638:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_638)-[:INTERPRETS]->(p_qa_638)
MERGE (qa_638)-[:ILLUSTRATES]->(lo_qa_638);

// Re-anchor Q&A: 160709
MERGE (qa_639:QA_Pair {id: '160709'})
MERGE (p_qa_639:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_639:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_639)-[:INTERPRETS]->(p_qa_639)
MERGE (qa_639)-[:ILLUSTRATES]->(lo_qa_639);

// Re-anchor Q&A: 160822
MERGE (qa_640:QA_Pair {id: '160822'})
MERGE (p_qa_640:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_640:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_640)-[:INTERPRETS]->(p_qa_640)
MERGE (qa_640)-[:ILLUSTRATES]->(lo_qa_640);

// Re-anchor Q&A: 160704
MERGE (qa_641:QA_Pair {id: '160704'})
MERGE (p_qa_641:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_641:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_641)-[:INTERPRETS]->(p_qa_641)
MERGE (qa_641)-[:ILLUSTRATES]->(lo_qa_641);

// Re-anchor Q&A: 160955
MERGE (qa_642:QA_Pair {id: '160955'})
MERGE (p_qa_642:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_642:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_642)-[:INTERPRETS]->(p_qa_642)
MERGE (qa_642)-[:ILLUSTRATES]->(lo_qa_642);

// Re-anchor Q&A: 159989
MERGE (qa_643:QA_Pair {id: '159989'})
MERGE (p_qa_643:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_643:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_643)-[:INTERPRETS]->(p_qa_643)
MERGE (qa_643)-[:ILLUSTRATES]->(lo_qa_643);

// Re-anchor Q&A: 160500
MERGE (qa_644:QA_Pair {id: '160500'})
MERGE (p_qa_644:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_644:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_644)-[:INTERPRETS]->(p_qa_644)
MERGE (qa_644)-[:ILLUSTRATES]->(lo_qa_644);

// Re-anchor Q&A: 160346
MERGE (qa_645:QA_Pair {id: '160346'})
MERGE (p_qa_645:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_645:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_645)-[:INTERPRETS]->(p_qa_645)
MERGE (qa_645)-[:ILLUSTRATES]->(lo_qa_645);

// Re-anchor Q&A: 160835
MERGE (qa_646:QA_Pair {id: '160835'})
MERGE (p_qa_646:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_646:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_646)-[:INTERPRETS]->(p_qa_646)
MERGE (qa_646)-[:ILLUSTRATES]->(lo_qa_646);

// Re-anchor Q&A: 160794
MERGE (qa_647:QA_Pair {id: '160794'})
MERGE (p_qa_647:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_647:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_647)-[:INTERPRETS]->(p_qa_647)
MERGE (qa_647)-[:ILLUSTRATES]->(lo_qa_647);

// Re-anchor Q&A: 160697
MERGE (qa_648:QA_Pair {id: '160697'})
MERGE (p_qa_648:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_648:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_648)-[:INTERPRETS]->(p_qa_648)
MERGE (qa_648)-[:ILLUSTRATES]->(lo_qa_648);

// Re-anchor Q&A: 160762
MERGE (qa_649:QA_Pair {id: '160762'})
MERGE (p_qa_649:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_649:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_649)-[:INTERPRETS]->(p_qa_649)
MERGE (qa_649)-[:ILLUSTRATES]->(lo_qa_649);

// Re-anchor Q&A: 158939
MERGE (qa_650:QA_Pair {id: '158939'})
MERGE (p_qa_650:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_650:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_650)-[:INTERPRETS]->(p_qa_650)
MERGE (qa_650)-[:ILLUSTRATES]->(lo_qa_650);

// Re-anchor Q&A: 160344
MERGE (qa_651:QA_Pair {id: '160344'})
MERGE (p_qa_651:LegalParagraph {id: 'PARA_ND132_D16'})
MERGE (lo_qa_651:Atomic_LO {id: 'LO_CIT_INTEREST_LIMIT_RELATED_PARTY'})
MERGE (qa_651)-[:INTERPRETS]->(p_qa_651)
MERGE (qa_651)-[:ILLUSTRATES]->(lo_qa_651);

// Re-anchor Q&A: 160437
MERGE (qa_652:QA_Pair {id: '160437'})
MERGE (p_qa_652:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_652:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_652)-[:INTERPRETS]->(p_qa_652)
MERGE (qa_652)-[:ILLUSTRATES]->(lo_qa_652);

// Re-anchor Q&A: 156929
MERGE (qa_653:QA_Pair {id: '156929'})
MERGE (p_qa_653:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_653:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_653)-[:INTERPRETS]->(p_qa_653)
MERGE (qa_653)-[:ILLUSTRATES]->(lo_qa_653);

// Re-anchor Q&A: 160738
MERGE (qa_654:QA_Pair {id: '160738'})
MERGE (p_qa_654:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_654:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_654)-[:INTERPRETS]->(p_qa_654)
MERGE (qa_654)-[:ILLUSTRATES]->(lo_qa_654);

// Re-anchor Q&A: 160631
MERGE (qa_655:QA_Pair {id: '160631'})
MERGE (p_qa_655:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_655:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_655)-[:INTERPRETS]->(p_qa_655)
MERGE (qa_655)-[:ILLUSTRATES]->(lo_qa_655);

// Re-anchor Q&A: 158355
MERGE (qa_656:QA_Pair {id: '158355'})
MERGE (p_qa_656:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_656:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_656)-[:INTERPRETS]->(p_qa_656)
MERGE (qa_656)-[:ILLUSTRATES]->(lo_qa_656);

// Re-anchor Q&A: 157488
MERGE (qa_657:QA_Pair {id: '157488'})
MERGE (p_qa_657:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_657:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_657)-[:INTERPRETS]->(p_qa_657)
MERGE (qa_657)-[:ILLUSTRATES]->(lo_qa_657);

// Re-anchor Q&A: 158799
MERGE (qa_658:QA_Pair {id: '158799'})
MERGE (p_qa_658:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_658:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_658)-[:INTERPRETS]->(p_qa_658)
MERGE (qa_658)-[:ILLUSTRATES]->(lo_qa_658);

// Re-anchor Q&A: 150141
MERGE (qa_659:QA_Pair {id: '150141'})
MERGE (p_qa_659:LegalParagraph {id: 'PARA_L67_D9'})
MERGE (lo_qa_659:Atomic_LO {id: 'LO_CIT_DEDUCTIBLE_EXPENSE_RULE'})
MERGE (qa_659)-[:INTERPRETS]->(p_qa_659)
MERGE (qa_659)-[:ILLUSTRATES]->(lo_qa_659);

// Re-anchor Q&A: 160671
MERGE (qa_660:QA_Pair {id: '160671'})
MERGE (p_qa_660:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_660:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_660)-[:INTERPRETS]->(p_qa_660)
MERGE (qa_660)-[:ILLUSTRATES]->(lo_qa_660);

// Re-anchor Q&A: 160630
MERGE (qa_661:QA_Pair {id: '160630'})
MERGE (p_qa_661:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_661:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_661)-[:INTERPRETS]->(p_qa_661)
MERGE (qa_661)-[:ILLUSTRATES]->(lo_qa_661);

// Re-anchor Q&A: 158629
MERGE (qa_662:QA_Pair {id: '158629'})
MERGE (p_qa_662:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_662:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_662)-[:INTERPRETS]->(p_qa_662)
MERGE (qa_662)-[:ILLUSTRATES]->(lo_qa_662);

// Re-anchor Q&A: 160712
MERGE (qa_663:QA_Pair {id: '160712'})
MERGE (p_qa_663:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_663:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_663)-[:INTERPRETS]->(p_qa_663)
MERGE (qa_663)-[:ILLUSTRATES]->(lo_qa_663);

// Re-anchor Q&A: 160448
MERGE (qa_664:QA_Pair {id: '160448'})
MERGE (p_qa_664:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_664:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_664)-[:INTERPRETS]->(p_qa_664)
MERGE (qa_664)-[:ILLUSTRATES]->(lo_qa_664);

// Re-anchor Q&A: 159762
MERGE (qa_665:QA_Pair {id: '159762'})
MERGE (p_qa_665:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_665:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_665)-[:INTERPRETS]->(p_qa_665)
MERGE (qa_665)-[:ILLUSTRATES]->(lo_qa_665);

// Re-anchor Q&A: 159947
MERGE (qa_666:QA_Pair {id: '159947'})
MERGE (p_qa_666:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_666:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_666)-[:INTERPRETS]->(p_qa_666)
MERGE (qa_666)-[:ILLUSTRATES]->(lo_qa_666);

// Re-anchor Q&A: 159948
MERGE (qa_667:QA_Pair {id: '159948'})
MERGE (p_qa_667:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_667:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_667)-[:INTERPRETS]->(p_qa_667)
MERGE (qa_667)-[:ILLUSTRATES]->(lo_qa_667);

// Re-anchor Q&A: 160241
MERGE (qa_668:QA_Pair {id: '160241'})
MERGE (p_qa_668:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_668:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_668)-[:INTERPRETS]->(p_qa_668)
MERGE (qa_668)-[:ILLUSTRATES]->(lo_qa_668);

// Re-anchor Q&A: 160242
MERGE (qa_669:QA_Pair {id: '160242'})
MERGE (p_qa_669:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_669:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_669)-[:INTERPRETS]->(p_qa_669)
MERGE (qa_669)-[:ILLUSTRATES]->(lo_qa_669);

// Re-anchor Q&A: 160613
MERGE (qa_670:QA_Pair {id: '160613'})
MERGE (p_qa_670:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_670:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_670)-[:INTERPRETS]->(p_qa_670)
MERGE (qa_670)-[:ILLUSTRATES]->(lo_qa_670);

// Re-anchor Q&A: 160259
MERGE (qa_671:QA_Pair {id: '160259'})
MERGE (p_qa_671:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_671:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_671)-[:INTERPRETS]->(p_qa_671)
MERGE (qa_671)-[:ILLUSTRATES]->(lo_qa_671);

// Re-anchor Q&A: 159079
MERGE (qa_672:QA_Pair {id: '159079'})
MERGE (p_qa_672:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_672:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_672)-[:INTERPRETS]->(p_qa_672)
MERGE (qa_672)-[:ILLUSTRATES]->(lo_qa_672);

// Re-anchor Q&A: 160573
MERGE (qa_673:QA_Pair {id: '160573'})
MERGE (p_qa_673:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_673:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_673)-[:INTERPRETS]->(p_qa_673)
MERGE (qa_673)-[:ILLUSTRATES]->(lo_qa_673);

// Re-anchor Q&A: 160559
MERGE (qa_674:QA_Pair {id: '160559'})
MERGE (p_qa_674:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_674:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_674)-[:INTERPRETS]->(p_qa_674)
MERGE (qa_674)-[:ILLUSTRATES]->(lo_qa_674);

// Re-anchor Q&A: 158899
MERGE (qa_675:QA_Pair {id: '158899'})
MERGE (p_qa_675:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_675:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_675)-[:INTERPRETS]->(p_qa_675)
MERGE (qa_675)-[:ILLUSTRATES]->(lo_qa_675);

// Re-anchor Q&A: 159037
MERGE (qa_676:QA_Pair {id: '159037'})
MERGE (p_qa_676:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_676:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_676)-[:INTERPRETS]->(p_qa_676)
MERGE (qa_676)-[:ILLUSTRATES]->(lo_qa_676);

// Re-anchor Q&A: 160558
MERGE (qa_677:QA_Pair {id: '160558'})
MERGE (p_qa_677:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_677:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_677)-[:INTERPRETS]->(p_qa_677)
MERGE (qa_677)-[:ILLUSTRATES]->(lo_qa_677);

// Re-anchor Q&A: 158600
MERGE (qa_678:QA_Pair {id: '158600'})
MERGE (p_qa_678:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_678:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_678)-[:INTERPRETS]->(p_qa_678)
MERGE (qa_678)-[:ILLUSTRATES]->(lo_qa_678);

// Re-anchor Q&A: 156387
MERGE (qa_679:QA_Pair {id: '156387'})
MERGE (p_qa_679:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_679:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_679)-[:INTERPRETS]->(p_qa_679)
MERGE (qa_679)-[:ILLUSTRATES]->(lo_qa_679);

// Re-anchor Q&A: 160353
MERGE (qa_680:QA_Pair {id: '160353'})
MERGE (p_qa_680:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_680:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_680)-[:INTERPRETS]->(p_qa_680)
MERGE (qa_680)-[:ILLUSTRATES]->(lo_qa_680);

// Re-anchor Q&A: 158725
MERGE (qa_681:QA_Pair {id: '158725'})
MERGE (p_qa_681:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_681:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_681)-[:INTERPRETS]->(p_qa_681)
MERGE (qa_681)-[:ILLUSTRATES]->(lo_qa_681);

// Re-anchor Q&A: 160452
MERGE (qa_682:QA_Pair {id: '160452'})
MERGE (p_qa_682:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_682:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_682)-[:INTERPRETS]->(p_qa_682)
MERGE (qa_682)-[:ILLUSTRATES]->(lo_qa_682);

// Re-anchor Q&A: 160355
MERGE (qa_683:QA_Pair {id: '160355'})
MERGE (p_qa_683:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_683:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_683)-[:INTERPRETS]->(p_qa_683)
MERGE (qa_683)-[:ILLUSTRATES]->(lo_qa_683);

// Re-anchor Q&A: 160610
MERGE (qa_684:QA_Pair {id: '160610'})
MERGE (p_qa_684:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_684:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_684)-[:INTERPRETS]->(p_qa_684)
MERGE (qa_684)-[:ILLUSTRATES]->(lo_qa_684);

// Re-anchor Q&A: 158152
MERGE (qa_685:QA_Pair {id: '158152'})
MERGE (p_qa_685:LegalParagraph {id: 'PARA_L67_D9'})
MERGE (lo_qa_685:Atomic_LO {id: 'LO_CIT_DEDUCTIBLE_EXPENSE_RULE'})
MERGE (qa_685)-[:INTERPRETS]->(p_qa_685)
MERGE (qa_685)-[:ILLUSTRATES]->(lo_qa_685);

// Re-anchor Q&A: 160316
MERGE (qa_686:QA_Pair {id: '160316'})
MERGE (p_qa_686:LegalParagraph {id: 'PARA_L67_D9'})
MERGE (lo_qa_686:Atomic_LO {id: 'LO_CIT_DEDUCTIBLE_EXPENSE_RULE'})
MERGE (qa_686)-[:INTERPRETS]->(p_qa_686)
MERGE (qa_686)-[:ILLUSTRATES]->(lo_qa_686);

// Re-anchor Q&A: 158349
MERGE (qa_687:QA_Pair {id: '158349'})
MERGE (p_qa_687:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_687:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_687)-[:INTERPRETS]->(p_qa_687)
MERGE (qa_687)-[:ILLUSTRATES]->(lo_qa_687);

// Re-anchor Q&A: 160502
MERGE (qa_688:QA_Pair {id: '160502'})
MERGE (p_qa_688:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_688:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_688)-[:INTERPRETS]->(p_qa_688)
MERGE (qa_688)-[:ILLUSTRATES]->(lo_qa_688);

// Re-anchor Q&A: 160510
MERGE (qa_689:QA_Pair {id: '160510'})
MERGE (p_qa_689:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_689:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_689)-[:INTERPRETS]->(p_qa_689)
MERGE (qa_689)-[:ILLUSTRATES]->(lo_qa_689);

// Re-anchor Q&A: 160195
MERGE (qa_690:QA_Pair {id: '160195'})
MERGE (p_qa_690:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_690:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_690)-[:INTERPRETS]->(p_qa_690)
MERGE (qa_690)-[:ILLUSTRATES]->(lo_qa_690);

// Re-anchor Q&A: 160467
MERGE (qa_691:QA_Pair {id: '160467'})
MERGE (p_qa_691:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_691:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_691)-[:INTERPRETS]->(p_qa_691)
MERGE (qa_691)-[:ILLUSTRATES]->(lo_qa_691);

// Re-anchor Q&A: 160149
MERGE (qa_692:QA_Pair {id: '160149'})
MERGE (p_qa_692:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_692:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_692)-[:INTERPRETS]->(p_qa_692)
MERGE (qa_692)-[:ILLUSTRATES]->(lo_qa_692);

// Re-anchor Q&A: 160468
MERGE (qa_693:QA_Pair {id: '160468'})
MERGE (p_qa_693:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_693:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_693)-[:INTERPRETS]->(p_qa_693)
MERGE (qa_693)-[:ILLUSTRATES]->(lo_qa_693);

// Re-anchor Q&A: 160352
MERGE (qa_694:QA_Pair {id: '160352'})
MERGE (p_qa_694:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_694:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_694)-[:INTERPRETS]->(p_qa_694)
MERGE (qa_694)-[:ILLUSTRATES]->(lo_qa_694);

// Re-anchor Q&A: 160215
MERGE (qa_695:QA_Pair {id: '160215'})
MERGE (p_qa_695:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_695:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_695)-[:INTERPRETS]->(p_qa_695)
MERGE (qa_695)-[:ILLUSTRATES]->(lo_qa_695);

// Re-anchor Q&A: 160208
MERGE (qa_696:QA_Pair {id: '160208'})
MERGE (p_qa_696:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_696:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_696)-[:INTERPRETS]->(p_qa_696)
MERGE (qa_696)-[:ILLUSTRATES]->(lo_qa_696);

// Re-anchor Q&A: 160204
MERGE (qa_697:QA_Pair {id: '160204'})
MERGE (p_qa_697:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_697:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_697)-[:INTERPRETS]->(p_qa_697)
MERGE (qa_697)-[:ILLUSTRATES]->(lo_qa_697);

// Re-anchor Q&A: 160187
MERGE (qa_698:QA_Pair {id: '160187'})
MERGE (p_qa_698:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_698:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_698)-[:INTERPRETS]->(p_qa_698)
MERGE (qa_698)-[:ILLUSTRATES]->(lo_qa_698);

// Re-anchor Q&A: 160320
MERGE (qa_699:QA_Pair {id: '160320'})
MERGE (p_qa_699:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_699:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_699)-[:INTERPRETS]->(p_qa_699)
MERGE (qa_699)-[:ILLUSTRATES]->(lo_qa_699);

// Re-anchor Q&A: 159853
MERGE (qa_700:QA_Pair {id: '159853'})
MERGE (p_qa_700:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_700:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_700)-[:INTERPRETS]->(p_qa_700)
MERGE (qa_700)-[:ILLUSTRATES]->(lo_qa_700);

// Re-anchor Q&A: 160449
MERGE (qa_701:QA_Pair {id: '160449'})
MERGE (p_qa_701:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_701:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_701)-[:INTERPRETS]->(p_qa_701)
MERGE (qa_701)-[:ILLUSTRATES]->(lo_qa_701);

// Re-anchor Q&A: 160248
MERGE (qa_702:QA_Pair {id: '160248'})
MERGE (p_qa_702:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_702:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_702)-[:INTERPRETS]->(p_qa_702)
MERGE (qa_702)-[:ILLUSTRATES]->(lo_qa_702);

// Re-anchor Q&A: 160075
MERGE (qa_703:QA_Pair {id: '160075'})
MERGE (p_qa_703:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_703:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_703)-[:INTERPRETS]->(p_qa_703)
MERGE (qa_703)-[:ILLUSTRATES]->(lo_qa_703);

// Re-anchor Q&A: 160483
MERGE (qa_704:QA_Pair {id: '160483'})
MERGE (p_qa_704:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_704:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_704)-[:INTERPRETS]->(p_qa_704)
MERGE (qa_704)-[:ILLUSTRATES]->(lo_qa_704);

// Re-anchor Q&A: 160141
MERGE (qa_705:QA_Pair {id: '160141'})
MERGE (p_qa_705:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_705:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_705)-[:INTERPRETS]->(p_qa_705)
MERGE (qa_705)-[:ILLUSTRATES]->(lo_qa_705);

// Re-anchor Q&A: 160354
MERGE (qa_706:QA_Pair {id: '160354'})
MERGE (p_qa_706:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_706:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_706)-[:INTERPRETS]->(p_qa_706)
MERGE (qa_706)-[:ILLUSTRATES]->(lo_qa_706);

// Re-anchor Q&A: 151830
MERGE (qa_707:QA_Pair {id: '151830'})
MERGE (p_qa_707:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_707:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_707)-[:INTERPRETS]->(p_qa_707)
MERGE (qa_707)-[:ILLUSTRATES]->(lo_qa_707);

// Re-anchor Q&A: 160255
MERGE (qa_708:QA_Pair {id: '160255'})
MERGE (p_qa_708:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_708:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_708)-[:INTERPRETS]->(p_qa_708)
MERGE (qa_708)-[:ILLUSTRATES]->(lo_qa_708);

// Re-anchor Q&A: 159119
MERGE (qa_709:QA_Pair {id: '159119'})
MERGE (p_qa_709:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_709:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_709)-[:INTERPRETS]->(p_qa_709)
MERGE (qa_709)-[:ILLUSTRATES]->(lo_qa_709);

// Re-anchor Q&A: 160255
MERGE (qa_710:QA_Pair {id: '160255'})
MERGE (p_qa_710:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_710:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_710)-[:INTERPRETS]->(p_qa_710)
MERGE (qa_710)-[:ILLUSTRATES]->(lo_qa_710);

// Re-anchor Q&A: 154498
MERGE (qa_711:QA_Pair {id: '154498'})
MERGE (p_qa_711:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_711:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_711)-[:INTERPRETS]->(p_qa_711)
MERGE (qa_711)-[:ILLUSTRATES]->(lo_qa_711);

// Re-anchor Q&A: 160214
MERGE (qa_712:QA_Pair {id: '160214'})
MERGE (p_qa_712:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_712:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_712)-[:INTERPRETS]->(p_qa_712)
MERGE (qa_712)-[:ILLUSTRATES]->(lo_qa_712);

// Re-anchor Q&A: 159930
MERGE (qa_713:QA_Pair {id: '159930'})
MERGE (p_qa_713:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_713:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_713)-[:INTERPRETS]->(p_qa_713)
MERGE (qa_713)-[:ILLUSTRATES]->(lo_qa_713);

// Re-anchor Q&A: 157922
MERGE (qa_714:QA_Pair {id: '157922'})
MERGE (p_qa_714:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_714:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_714)-[:INTERPRETS]->(p_qa_714)
MERGE (qa_714)-[:ILLUSTRATES]->(lo_qa_714);

// Re-anchor Q&A: 160222
MERGE (qa_715:QA_Pair {id: '160222'})
MERGE (p_qa_715:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_715:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_715)-[:INTERPRETS]->(p_qa_715)
MERGE (qa_715)-[:ILLUSTRATES]->(lo_qa_715);

// Re-anchor Q&A: 160343
MERGE (qa_716:QA_Pair {id: '160343'})
MERGE (p_qa_716:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_716:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_716)-[:INTERPRETS]->(p_qa_716)
MERGE (qa_716)-[:ILLUSTRATES]->(lo_qa_716);

// Re-anchor Q&A: 160351
MERGE (qa_717:QA_Pair {id: '160351'})
MERGE (p_qa_717:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_717:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_717)-[:INTERPRETS]->(p_qa_717)
MERGE (qa_717)-[:ILLUSTRATES]->(lo_qa_717);

// Re-anchor Q&A: 159017
MERGE (qa_718:QA_Pair {id: '159017'})
MERGE (p_qa_718:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_718:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_718)-[:INTERPRETS]->(p_qa_718)
MERGE (qa_718)-[:ILLUSTRATES]->(lo_qa_718);

// Re-anchor Q&A: 158345
MERGE (qa_719:QA_Pair {id: '158345'})
MERGE (p_qa_719:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_719:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_719)-[:INTERPRETS]->(p_qa_719)
MERGE (qa_719)-[:ILLUSTRATES]->(lo_qa_719);

// Re-anchor Q&A: 160361
MERGE (qa_720:QA_Pair {id: '160361'})
MERGE (p_qa_720:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_720:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_720)-[:INTERPRETS]->(p_qa_720)
MERGE (qa_720)-[:ILLUSTRATES]->(lo_qa_720);

// Re-anchor Q&A: 160301
MERGE (qa_721:QA_Pair {id: '160301'})
MERGE (p_qa_721:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_721:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_721)-[:INTERPRETS]->(p_qa_721)
MERGE (qa_721)-[:ILLUSTRATES]->(lo_qa_721);

// Re-anchor Q&A: 159944
MERGE (qa_722:QA_Pair {id: '159944'})
MERGE (p_qa_722:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_722:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_722)-[:INTERPRETS]->(p_qa_722)
MERGE (qa_722)-[:ILLUSTRATES]->(lo_qa_722);

// Re-anchor Q&A: 160115
MERGE (qa_723:QA_Pair {id: '160115'})
MERGE (p_qa_723:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_723:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_723)-[:INTERPRETS]->(p_qa_723)
MERGE (qa_723)-[:ILLUSTRATES]->(lo_qa_723);

// Re-anchor Q&A: 160235
MERGE (qa_724:QA_Pair {id: '160235'})
MERGE (p_qa_724:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_724:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_724)-[:INTERPRETS]->(p_qa_724)
MERGE (qa_724)-[:ILLUSTRATES]->(lo_qa_724);

// Re-anchor Q&A: 159645
MERGE (qa_725:QA_Pair {id: '159645'})
MERGE (p_qa_725:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_725:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_725)-[:INTERPRETS]->(p_qa_725)
MERGE (qa_725)-[:ILLUSTRATES]->(lo_qa_725);

// Re-anchor Q&A: 160211
MERGE (qa_726:QA_Pair {id: '160211'})
MERGE (p_qa_726:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_726:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_726)-[:INTERPRETS]->(p_qa_726)
MERGE (qa_726)-[:ILLUSTRATES]->(lo_qa_726);

// Re-anchor Q&A: 159405
MERGE (qa_727:QA_Pair {id: '159405'})
MERGE (p_qa_727:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_727:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_727)-[:INTERPRETS]->(p_qa_727)
MERGE (qa_727)-[:ILLUSTRATES]->(lo_qa_727);

// Re-anchor Q&A: 159996
MERGE (qa_728:QA_Pair {id: '159996'})
MERGE (p_qa_728:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_728:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_728)-[:INTERPRETS]->(p_qa_728)
MERGE (qa_728)-[:ILLUSTRATES]->(lo_qa_728);

// Re-anchor Q&A: 159451
MERGE (qa_729:QA_Pair {id: '159451'})
MERGE (p_qa_729:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_729:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_729)-[:INTERPRETS]->(p_qa_729)
MERGE (qa_729)-[:ILLUSTRATES]->(lo_qa_729);

// Re-anchor Q&A: 158298
MERGE (qa_730:QA_Pair {id: '158298'})
MERGE (p_qa_730:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_730:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_730)-[:INTERPRETS]->(p_qa_730)
MERGE (qa_730)-[:ILLUSTRATES]->(lo_qa_730);

// Re-anchor Q&A: 160089
MERGE (qa_731:QA_Pair {id: '160089'})
MERGE (p_qa_731:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_731:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_731)-[:INTERPRETS]->(p_qa_731)
MERGE (qa_731)-[:ILLUSTRATES]->(lo_qa_731);

// Re-anchor Q&A: 160077
MERGE (qa_732:QA_Pair {id: '160077'})
MERGE (p_qa_732:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_732:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_732)-[:INTERPRETS]->(p_qa_732)
MERGE (qa_732)-[:ILLUSTRATES]->(lo_qa_732);

// Re-anchor Q&A: 160256
MERGE (qa_733:QA_Pair {id: '160256'})
MERGE (p_qa_733:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_733:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_733)-[:INTERPRETS]->(p_qa_733)
MERGE (qa_733)-[:ILLUSTRATES]->(lo_qa_733);

// Re-anchor Q&A: 160254
MERGE (qa_734:QA_Pair {id: '160254'})
MERGE (p_qa_734:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_734:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_734)-[:INTERPRETS]->(p_qa_734)
MERGE (qa_734)-[:ILLUSTRATES]->(lo_qa_734);

// Re-anchor Q&A: 157513
MERGE (qa_735:QA_Pair {id: '157513'})
MERGE (p_qa_735:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_735:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_735)-[:INTERPRETS]->(p_qa_735)
MERGE (qa_735)-[:ILLUSTRATES]->(lo_qa_735);

// Re-anchor Q&A: 160137
MERGE (qa_736:QA_Pair {id: '160137'})
MERGE (p_qa_736:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_736:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_736)-[:INTERPRETS]->(p_qa_736)
MERGE (qa_736)-[:ILLUSTRATES]->(lo_qa_736);

// Re-anchor Q&A: 158678
MERGE (qa_737:QA_Pair {id: '158678'})
MERGE (p_qa_737:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_737:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_737)-[:INTERPRETS]->(p_qa_737)
MERGE (qa_737)-[:ILLUSTRATES]->(lo_qa_737);

// Re-anchor Q&A: 159273
MERGE (qa_738:QA_Pair {id: '159273'})
MERGE (p_qa_738:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_738:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_738)-[:INTERPRETS]->(p_qa_738)
MERGE (qa_738)-[:ILLUSTRATES]->(lo_qa_738);

// Re-anchor Q&A: 157508
MERGE (qa_739:QA_Pair {id: '157508'})
MERGE (p_qa_739:LegalParagraph {id: 'PARA_L67_D9'})
MERGE (lo_qa_739:Atomic_LO {id: 'LO_CIT_DEDUCTIBLE_EXPENSE_RULE'})
MERGE (qa_739)-[:INTERPRETS]->(p_qa_739)
MERGE (qa_739)-[:ILLUSTRATES]->(lo_qa_739);

// Re-anchor Q&A: 160207
MERGE (qa_740:QA_Pair {id: '160207'})
MERGE (p_qa_740:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_740:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_740)-[:INTERPRETS]->(p_qa_740)
MERGE (qa_740)-[:ILLUSTRATES]->(lo_qa_740);

// Re-anchor Q&A: 159952
MERGE (qa_741:QA_Pair {id: '159952'})
MERGE (p_qa_741:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_741:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_741)-[:INTERPRETS]->(p_qa_741)
MERGE (qa_741)-[:ILLUSTRATES]->(lo_qa_741);

// Re-anchor Q&A: 160258
MERGE (qa_742:QA_Pair {id: '160258'})
MERGE (p_qa_742:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_742:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_742)-[:INTERPRETS]->(p_qa_742)
MERGE (qa_742)-[:ILLUSTRATES]->(lo_qa_742);

// Re-anchor Q&A: 159229
MERGE (qa_743:QA_Pair {id: '159229'})
MERGE (p_qa_743:LegalParagraph {id: 'PARA_L67_D9'})
MERGE (lo_qa_743:Atomic_LO {id: 'LO_CIT_DEDUCTIBLE_EXPENSE_RULE'})
MERGE (qa_743)-[:INTERPRETS]->(p_qa_743)
MERGE (qa_743)-[:ILLUSTRATES]->(lo_qa_743);

// Re-anchor Q&A: 158632
MERGE (qa_744:QA_Pair {id: '158632'})
MERGE (p_qa_744:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_744:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_744)-[:INTERPRETS]->(p_qa_744)
MERGE (qa_744)-[:ILLUSTRATES]->(lo_qa_744);

// Re-anchor Q&A: 160334
MERGE (qa_745:QA_Pair {id: '160334'})
MERGE (p_qa_745:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_745:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_745)-[:INTERPRETS]->(p_qa_745)
MERGE (qa_745)-[:ILLUSTRATES]->(lo_qa_745);

// Re-anchor Q&A: 160269
MERGE (qa_746:QA_Pair {id: '160269'})
MERGE (p_qa_746:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_746:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_746)-[:INTERPRETS]->(p_qa_746)
MERGE (qa_746)-[:ILLUSTRATES]->(lo_qa_746);

// Re-anchor Q&A: 159662
MERGE (qa_747:QA_Pair {id: '159662'})
MERGE (p_qa_747:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_747:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_747)-[:INTERPRETS]->(p_qa_747)
MERGE (qa_747)-[:ILLUSTRATES]->(lo_qa_747);

// Re-anchor Q&A: 160133
MERGE (qa_748:QA_Pair {id: '160133'})
MERGE (p_qa_748:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_748:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_748)-[:INTERPRETS]->(p_qa_748)
MERGE (qa_748)-[:ILLUSTRATES]->(lo_qa_748);

// Re-anchor Q&A: 159766
MERGE (qa_749:QA_Pair {id: '159766'})
MERGE (p_qa_749:LegalParagraph {id: 'PARA_ND132_D16'})
MERGE (lo_qa_749:Atomic_LO {id: 'LO_CIT_INTEREST_LIMIT_RELATED_PARTY'})
MERGE (qa_749)-[:INTERPRETS]->(p_qa_749)
MERGE (qa_749)-[:ILLUSTRATES]->(lo_qa_749);

// Re-anchor Q&A: 159536
MERGE (qa_750:QA_Pair {id: '159536'})
MERGE (p_qa_750:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_750:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_750)-[:INTERPRETS]->(p_qa_750)
MERGE (qa_750)-[:ILLUSTRATES]->(lo_qa_750);

// Re-anchor Q&A: 158764
MERGE (qa_751:QA_Pair {id: '158764'})
MERGE (p_qa_751:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_751:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_751)-[:INTERPRETS]->(p_qa_751)
MERGE (qa_751)-[:ILLUSTRATES]->(lo_qa_751);

// Re-anchor Q&A: 158815
MERGE (qa_752:QA_Pair {id: '158815'})
MERGE (p_qa_752:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_752:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_752)-[:INTERPRETS]->(p_qa_752)
MERGE (qa_752)-[:ILLUSTRATES]->(lo_qa_752);

// Re-anchor Q&A: 160117
MERGE (qa_753:QA_Pair {id: '160117'})
MERGE (p_qa_753:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_753:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_753)-[:INTERPRETS]->(p_qa_753)
MERGE (qa_753)-[:ILLUSTRATES]->(lo_qa_753);

// Re-anchor Q&A: 158668
MERGE (qa_754:QA_Pair {id: '158668'})
MERGE (p_qa_754:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_754:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_754)-[:INTERPRETS]->(p_qa_754)
MERGE (qa_754)-[:ILLUSTRATES]->(lo_qa_754);

// Re-anchor Q&A: 160136
MERGE (qa_755:QA_Pair {id: '160136'})
MERGE (p_qa_755:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_755:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_755)-[:INTERPRETS]->(p_qa_755)
MERGE (qa_755)-[:ILLUSTRATES]->(lo_qa_755);

// Re-anchor Q&A: 160132
MERGE (qa_756:QA_Pair {id: '160132'})
MERGE (p_qa_756:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_756:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_756)-[:INTERPRETS]->(p_qa_756)
MERGE (qa_756)-[:ILLUSTRATES]->(lo_qa_756);

// Re-anchor Q&A: 159681
MERGE (qa_757:QA_Pair {id: '159681'})
MERGE (p_qa_757:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_757:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_757)-[:INTERPRETS]->(p_qa_757)
MERGE (qa_757)-[:ILLUSTRATES]->(lo_qa_757);

// Re-anchor Q&A: 159018
MERGE (qa_758:QA_Pair {id: '159018'})
MERGE (p_qa_758:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_758:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_758)-[:INTERPRETS]->(p_qa_758)
MERGE (qa_758)-[:ILLUSTRATES]->(lo_qa_758);

// Re-anchor Q&A: 159146
MERGE (qa_759:QA_Pair {id: '159146'})
MERGE (p_qa_759:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_759:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_759)-[:INTERPRETS]->(p_qa_759)
MERGE (qa_759)-[:ILLUSTRATES]->(lo_qa_759);

// Re-anchor Q&A: 158382
MERGE (qa_760:QA_Pair {id: '158382'})
MERGE (p_qa_760:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_760:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_760)-[:INTERPRETS]->(p_qa_760)
MERGE (qa_760)-[:ILLUSTRATES]->(lo_qa_760);

// Re-anchor Q&A: 160090
MERGE (qa_761:QA_Pair {id: '160090'})
MERGE (p_qa_761:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_761:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_761)-[:INTERPRETS]->(p_qa_761)
MERGE (qa_761)-[:ILLUSTRATES]->(lo_qa_761);

// Re-anchor Q&A: 160070
MERGE (qa_762:QA_Pair {id: '160070'})
MERGE (p_qa_762:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_762:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_762)-[:INTERPRETS]->(p_qa_762)
MERGE (qa_762)-[:ILLUSTRATES]->(lo_qa_762);

// Re-anchor Q&A: 159929
MERGE (qa_763:QA_Pair {id: '159929'})
MERGE (p_qa_763:LegalParagraph {id: 'PARA_L67_D9'})
MERGE (lo_qa_763:Atomic_LO {id: 'LO_CIT_DEDUCTIBLE_EXPENSE_RULE'})
MERGE (qa_763)-[:INTERPRETS]->(p_qa_763)
MERGE (qa_763)-[:ILLUSTRATES]->(lo_qa_763);

// Re-anchor Q&A: 159071
MERGE (qa_764:QA_Pair {id: '159071'})
MERGE (p_qa_764:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_764:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_764)-[:INTERPRETS]->(p_qa_764)
MERGE (qa_764)-[:ILLUSTRATES]->(lo_qa_764);

// Re-anchor Q&A: 159653
MERGE (qa_765:QA_Pair {id: '159653'})
MERGE (p_qa_765:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_765:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_765)-[:INTERPRETS]->(p_qa_765)
MERGE (qa_765)-[:ILLUSTRATES]->(lo_qa_765);

// Re-anchor Q&A: 160076
MERGE (qa_766:QA_Pair {id: '160076'})
MERGE (p_qa_766:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_766:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_766)-[:INTERPRETS]->(p_qa_766)
MERGE (qa_766)-[:ILLUSTRATES]->(lo_qa_766);

// Re-anchor Q&A: 160097
MERGE (qa_767:QA_Pair {id: '160097'})
MERGE (p_qa_767:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_767:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_767)-[:INTERPRETS]->(p_qa_767)
MERGE (qa_767)-[:ILLUSTRATES]->(lo_qa_767);

// Re-anchor Q&A: 159075
MERGE (qa_768:QA_Pair {id: '159075'})
MERGE (p_qa_768:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_768:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_768)-[:INTERPRETS]->(p_qa_768)
MERGE (qa_768)-[:ILLUSTRATES]->(lo_qa_768);

// Re-anchor Q&A: 159069
MERGE (qa_769:QA_Pair {id: '159069'})
MERGE (p_qa_769:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_769:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_769)-[:INTERPRETS]->(p_qa_769)
MERGE (qa_769)-[:ILLUSTRATES]->(lo_qa_769);

// Re-anchor Q&A: 159306
MERGE (qa_770:QA_Pair {id: '159306'})
MERGE (p_qa_770:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_770:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_770)-[:INTERPRETS]->(p_qa_770)
MERGE (qa_770)-[:ILLUSTRATES]->(lo_qa_770);

// Re-anchor Q&A: 158766
MERGE (qa_771:QA_Pair {id: '158766'})
MERGE (p_qa_771:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_771:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_771)-[:INTERPRETS]->(p_qa_771)
MERGE (qa_771)-[:ILLUSTRATES]->(lo_qa_771);

// Re-anchor Q&A: 158873
MERGE (qa_772:QA_Pair {id: '158873'})
MERGE (p_qa_772:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_772:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_772)-[:INTERPRETS]->(p_qa_772)
MERGE (qa_772)-[:ILLUSTRATES]->(lo_qa_772);

// Re-anchor Q&A: 159545
MERGE (qa_773:QA_Pair {id: '159545'})
MERGE (p_qa_773:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_773:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_773)-[:INTERPRETS]->(p_qa_773)
MERGE (qa_773)-[:ILLUSTRATES]->(lo_qa_773);

// Re-anchor Q&A: 159531
MERGE (qa_774:QA_Pair {id: '159531'})
MERGE (p_qa_774:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_774:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_774)-[:INTERPRETS]->(p_qa_774)
MERGE (qa_774)-[:ILLUSTRATES]->(lo_qa_774);

// Re-anchor Q&A: 158753
MERGE (qa_775:QA_Pair {id: '158753'})
MERGE (p_qa_775:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_775:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_775)-[:INTERPRETS]->(p_qa_775)
MERGE (qa_775)-[:ILLUSTRATES]->(lo_qa_775);

// Re-anchor Q&A: 159654
MERGE (qa_776:QA_Pair {id: '159654'})
MERGE (p_qa_776:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_776:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_776)-[:INTERPRETS]->(p_qa_776)
MERGE (qa_776)-[:ILLUSTRATES]->(lo_qa_776);

// Re-anchor Q&A: 159412
MERGE (qa_777:QA_Pair {id: '159412'})
MERGE (p_qa_777:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_777:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_777)-[:INTERPRETS]->(p_qa_777)
MERGE (qa_777)-[:ILLUSTRATES]->(lo_qa_777);

// Re-anchor Q&A: 159282
MERGE (qa_778:QA_Pair {id: '159282'})
MERGE (p_qa_778:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_778:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_778)-[:INTERPRETS]->(p_qa_778)
MERGE (qa_778)-[:ILLUSTRATES]->(lo_qa_778);

// Re-anchor Q&A: 159511
MERGE (qa_779:QA_Pair {id: '159511'})
MERGE (p_qa_779:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_779:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_779)-[:INTERPRETS]->(p_qa_779)
MERGE (qa_779)-[:ILLUSTRATES]->(lo_qa_779);

// Re-anchor Q&A: 159454
MERGE (qa_780:QA_Pair {id: '159454'})
MERGE (p_qa_780:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_780:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_780)-[:INTERPRETS]->(p_qa_780)
MERGE (qa_780)-[:ILLUSTRATES]->(lo_qa_780);

// Re-anchor Q&A: 159881
MERGE (qa_781:QA_Pair {id: '159881'})
MERGE (p_qa_781:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_781:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_781)-[:INTERPRETS]->(p_qa_781)
MERGE (qa_781)-[:ILLUSTRATES]->(lo_qa_781);

// Re-anchor Q&A: 159696
MERGE (qa_782:QA_Pair {id: '159696'})
MERGE (p_qa_782:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_782:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_782)-[:INTERPRETS]->(p_qa_782)
MERGE (qa_782)-[:ILLUSTRATES]->(lo_qa_782);

// Re-anchor Q&A: 159416
MERGE (qa_783:QA_Pair {id: '159416'})
MERGE (p_qa_783:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_783:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_783)-[:INTERPRETS]->(p_qa_783)
MERGE (qa_783)-[:ILLUSTRATES]->(lo_qa_783);

// Re-anchor Q&A: 159873
MERGE (qa_784:QA_Pair {id: '159873'})
MERGE (p_qa_784:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_784:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_784)-[:INTERPRETS]->(p_qa_784)
MERGE (qa_784)-[:ILLUSTRATES]->(lo_qa_784);

// Re-anchor Q&A: 159635
MERGE (qa_785:QA_Pair {id: '159635'})
MERGE (p_qa_785:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_785:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_785)-[:INTERPRETS]->(p_qa_785)
MERGE (qa_785)-[:ILLUSTRATES]->(lo_qa_785);

// Re-anchor Q&A: 159871
MERGE (qa_786:QA_Pair {id: '159871'})
MERGE (p_qa_786:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_786:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_786)-[:INTERPRETS]->(p_qa_786)
MERGE (qa_786)-[:ILLUSTRATES]->(lo_qa_786);

// Re-anchor Q&A: 159693
MERGE (qa_787:QA_Pair {id: '159693'})
MERGE (p_qa_787:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_787:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_787)-[:INTERPRETS]->(p_qa_787)
MERGE (qa_787)-[:ILLUSTRATES]->(lo_qa_787);

// Re-anchor Q&A: 148454
MERGE (qa_788:QA_Pair {id: '148454'})
MERGE (p_qa_788:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_788:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_788)-[:INTERPRETS]->(p_qa_788)
MERGE (qa_788)-[:ILLUSTRATES]->(lo_qa_788);

// Re-anchor Q&A: 159785
MERGE (qa_789:QA_Pair {id: '159785'})
MERGE (p_qa_789:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_789:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_789)-[:INTERPRETS]->(p_qa_789)
MERGE (qa_789)-[:ILLUSTRATES]->(lo_qa_789);

// Re-anchor Q&A: 158785
MERGE (qa_790:QA_Pair {id: '158785'})
MERGE (p_qa_790:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_790:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_790)-[:INTERPRETS]->(p_qa_790)
MERGE (qa_790)-[:ILLUSTRATES]->(lo_qa_790);

// Re-anchor Q&A: 159946
MERGE (qa_791:QA_Pair {id: '159946'})
MERGE (p_qa_791:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_791:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_791)-[:INTERPRETS]->(p_qa_791)
MERGE (qa_791)-[:ILLUSTRATES]->(lo_qa_791);

// Re-anchor Q&A: 159647
MERGE (qa_792:QA_Pair {id: '159647'})
MERGE (p_qa_792:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_792:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_792)-[:INTERPRETS]->(p_qa_792)
MERGE (qa_792)-[:ILLUSTRATES]->(lo_qa_792);

// Re-anchor Q&A: 159940
MERGE (qa_793:QA_Pair {id: '159940'})
MERGE (p_qa_793:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_793:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_793)-[:INTERPRETS]->(p_qa_793)
MERGE (qa_793)-[:ILLUSTRATES]->(lo_qa_793);

// Re-anchor Q&A: 159526
MERGE (qa_794:QA_Pair {id: '159526'})
MERGE (p_qa_794:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_794:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_794)-[:INTERPRETS]->(p_qa_794)
MERGE (qa_794)-[:ILLUSTRATES]->(lo_qa_794);

// Re-anchor Q&A: 159682
MERGE (qa_795:QA_Pair {id: '159682'})
MERGE (p_qa_795:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_795:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_795)-[:INTERPRETS]->(p_qa_795)
MERGE (qa_795)-[:ILLUSTRATES]->(lo_qa_795);

// Re-anchor Q&A: 158997
MERGE (qa_796:QA_Pair {id: '158997'})
MERGE (p_qa_796:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_796:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_796)-[:INTERPRETS]->(p_qa_796)
MERGE (qa_796)-[:ILLUSTRATES]->(lo_qa_796);

// Re-anchor Q&A: 158904
MERGE (qa_797:QA_Pair {id: '158904'})
MERGE (p_qa_797:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_797:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_797)-[:INTERPRETS]->(p_qa_797)
MERGE (qa_797)-[:ILLUSTRATES]->(lo_qa_797);

// Re-anchor Q&A: 158861
MERGE (qa_798:QA_Pair {id: '158861'})
MERGE (p_qa_798:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_798:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_798)-[:INTERPRETS]->(p_qa_798)
MERGE (qa_798)-[:ILLUSTRATES]->(lo_qa_798);

// Re-anchor Q&A: 159081
MERGE (qa_799:QA_Pair {id: '159081'})
MERGE (p_qa_799:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_799:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_799)-[:INTERPRETS]->(p_qa_799)
MERGE (qa_799)-[:ILLUSTRATES]->(lo_qa_799);

// Re-anchor Q&A: 158856
MERGE (qa_800:QA_Pair {id: '158856'})
MERGE (p_qa_800:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_800:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_800)-[:INTERPRETS]->(p_qa_800)
MERGE (qa_800)-[:ILLUSTRATES]->(lo_qa_800);

// Re-anchor Q&A: 159228
MERGE (qa_801:QA_Pair {id: '159228'})
MERGE (p_qa_801:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_801:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_801)-[:INTERPRETS]->(p_qa_801)
MERGE (qa_801)-[:ILLUSTRATES]->(lo_qa_801);

// Re-anchor Q&A: 159134
MERGE (qa_802:QA_Pair {id: '159134'})
MERGE (p_qa_802:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_802:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_802)-[:INTERPRETS]->(p_qa_802)
MERGE (qa_802)-[:ILLUSTRATES]->(lo_qa_802);

// Re-anchor Q&A: 159028
MERGE (qa_803:QA_Pair {id: '159028'})
MERGE (p_qa_803:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_803:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_803)-[:INTERPRETS]->(p_qa_803)
MERGE (qa_803)-[:ILLUSTRATES]->(lo_qa_803);

// Re-anchor Q&A: 158793
MERGE (qa_804:QA_Pair {id: '158793'})
MERGE (p_qa_804:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_804:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_804)-[:INTERPRETS]->(p_qa_804)
MERGE (qa_804)-[:ILLUSTRATES]->(lo_qa_804);

// Re-anchor Q&A: 159036
MERGE (qa_805:QA_Pair {id: '159036'})
MERGE (p_qa_805:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_805:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_805)-[:INTERPRETS]->(p_qa_805)
MERGE (qa_805)-[:ILLUSTRATES]->(lo_qa_805);

// Re-anchor Q&A: 159001
MERGE (qa_806:QA_Pair {id: '159001'})
MERGE (p_qa_806:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_806:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_806)-[:INTERPRETS]->(p_qa_806)
MERGE (qa_806)-[:ILLUSTRATES]->(lo_qa_806);

// Re-anchor Q&A: 159050
MERGE (qa_807:QA_Pair {id: '159050'})
MERGE (p_qa_807:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_807:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_807)-[:INTERPRETS]->(p_qa_807)
MERGE (qa_807)-[:ILLUSTRATES]->(lo_qa_807);

// Re-anchor Q&A: 159235
MERGE (qa_808:QA_Pair {id: '159235'})
MERGE (p_qa_808:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_808:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_808)-[:INTERPRETS]->(p_qa_808)
MERGE (qa_808)-[:ILLUSTRATES]->(lo_qa_808);

// Re-anchor Q&A: 159258
MERGE (qa_809:QA_Pair {id: '159258'})
MERGE (p_qa_809:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_809:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_809)-[:INTERPRETS]->(p_qa_809)
MERGE (qa_809)-[:ILLUSTRATES]->(lo_qa_809);

// Re-anchor Q&A: 159258
MERGE (qa_810:QA_Pair {id: '159258'})
MERGE (p_qa_810:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_810:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_810)-[:INTERPRETS]->(p_qa_810)
MERGE (qa_810)-[:ILLUSTRATES]->(lo_qa_810);

// Re-anchor Q&A: 157211
MERGE (qa_811:QA_Pair {id: '157211'})
MERGE (p_qa_811:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_811:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_811)-[:INTERPRETS]->(p_qa_811)
MERGE (qa_811)-[:ILLUSTRATES]->(lo_qa_811);

// Re-anchor Q&A: 157316
MERGE (qa_812:QA_Pair {id: '157316'})
MERGE (p_qa_812:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_812:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_812)-[:INTERPRETS]->(p_qa_812)
MERGE (qa_812)-[:ILLUSTRATES]->(lo_qa_812);

// Re-anchor Q&A: 159945
MERGE (qa_813:QA_Pair {id: '159945'})
MERGE (p_qa_813:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_813:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_813)-[:INTERPRETS]->(p_qa_813)
MERGE (qa_813)-[:ILLUSTRATES]->(lo_qa_813);

// Re-anchor Q&A: 159042
MERGE (qa_814:QA_Pair {id: '159042'})
MERGE (p_qa_814:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_814:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_814)-[:INTERPRETS]->(p_qa_814)
MERGE (qa_814)-[:ILLUSTRATES]->(lo_qa_814);

// Re-anchor Q&A: 154665
MERGE (qa_815:QA_Pair {id: '154665'})
MERGE (p_qa_815:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_815:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_815)-[:INTERPRETS]->(p_qa_815)
MERGE (qa_815)-[:ILLUSTRATES]->(lo_qa_815);

// Re-anchor Q&A: 152682
MERGE (qa_816:QA_Pair {id: '152682'})
MERGE (p_qa_816:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_816:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_816)-[:INTERPRETS]->(p_qa_816)
MERGE (qa_816)-[:ILLUSTRATES]->(lo_qa_816);

// Re-anchor Q&A: 159863
MERGE (qa_817:QA_Pair {id: '159863'})
MERGE (p_qa_817:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_817:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_817)-[:INTERPRETS]->(p_qa_817)
MERGE (qa_817)-[:ILLUSTRATES]->(lo_qa_817);

// Re-anchor Q&A: 159661
MERGE (qa_818:QA_Pair {id: '159661'})
MERGE (p_qa_818:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_818:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_818)-[:INTERPRETS]->(p_qa_818)
MERGE (qa_818)-[:ILLUSTRATES]->(lo_qa_818);

// Re-anchor Q&A: 159683
MERGE (qa_819:QA_Pair {id: '159683'})
MERGE (p_qa_819:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_819:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_819)-[:INTERPRETS]->(p_qa_819)
MERGE (qa_819)-[:ILLUSTRATES]->(lo_qa_819);

// Re-anchor Q&A: 159875
MERGE (qa_820:QA_Pair {id: '159875'})
MERGE (p_qa_820:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_820:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_820)-[:INTERPRETS]->(p_qa_820)
MERGE (qa_820)-[:ILLUSTRATES]->(lo_qa_820);

// Re-anchor Q&A: 159539
MERGE (qa_821:QA_Pair {id: '159539'})
MERGE (p_qa_821:LegalParagraph {id: 'PARA_ND310_D24'})
MERGE (lo_qa_821:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (qa_821)-[:INTERPRETS]->(p_qa_821)
MERGE (qa_821)-[:ILLUSTRATES]->(lo_qa_821);

// Re-anchor Q&A: 159660
MERGE (qa_822:QA_Pair {id: '159660'})
MERGE (p_qa_822:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_822:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_822)-[:INTERPRETS]->(p_qa_822)
MERGE (qa_822)-[:ILLUSTRATES]->(lo_qa_822);

// Re-anchor Q&A: 158656
MERGE (qa_823:QA_Pair {id: '158656'})
MERGE (p_qa_823:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_823:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_823)-[:INTERPRETS]->(p_qa_823)
MERGE (qa_823)-[:ILLUSTRATES]->(lo_qa_823);

// Re-anchor Q&A: 159851
MERGE (qa_824:QA_Pair {id: '159851'})
MERGE (p_qa_824:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_824:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_824)-[:INTERPRETS]->(p_qa_824)
MERGE (qa_824)-[:ILLUSTRATES]->(lo_qa_824);

// Re-anchor Q&A: 158962
MERGE (qa_825:QA_Pair {id: '158962'})
MERGE (p_qa_825:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_825:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_825)-[:INTERPRETS]->(p_qa_825)
MERGE (qa_825)-[:ILLUSTRATES]->(lo_qa_825);

// Re-anchor Q&A: 159521
MERGE (qa_826:QA_Pair {id: '159521'})
MERGE (p_qa_826:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_826:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_826)-[:INTERPRETS]->(p_qa_826)
MERGE (qa_826)-[:ILLUSTRATES]->(lo_qa_826);

// Re-anchor Q&A: 159695
MERGE (qa_827:QA_Pair {id: '159695'})
MERGE (p_qa_827:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_827:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_827)-[:INTERPRETS]->(p_qa_827)
MERGE (qa_827)-[:ILLUSTRATES]->(lo_qa_827);

// Re-anchor Q&A: 154942
MERGE (qa_828:QA_Pair {id: '154942'})
MERGE (p_qa_828:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_828:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_828)-[:INTERPRETS]->(p_qa_828)
MERGE (qa_828)-[:ILLUSTRATES]->(lo_qa_828);

// Re-anchor Q&A: 158716
MERGE (qa_829:QA_Pair {id: '158716'})
MERGE (p_qa_829:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_829:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_829)-[:INTERPRETS]->(p_qa_829)
MERGE (qa_829)-[:ILLUSTRATES]->(lo_qa_829);

// Re-anchor Q&A: 158665
MERGE (qa_830:QA_Pair {id: '158665'})
MERGE (p_qa_830:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_830:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_830)-[:INTERPRETS]->(p_qa_830)
MERGE (qa_830)-[:ILLUSTRATES]->(lo_qa_830);

// Re-anchor Q&A: 159552
MERGE (qa_831:QA_Pair {id: '159552'})
MERGE (p_qa_831:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_831:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_831)-[:INTERPRETS]->(p_qa_831)
MERGE (qa_831)-[:ILLUSTRATES]->(lo_qa_831);

// Re-anchor Q&A: 158943
MERGE (qa_832:QA_Pair {id: '158943'})
MERGE (p_qa_832:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_832:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_832)-[:INTERPRETS]->(p_qa_832)
MERGE (qa_832)-[:ILLUSTRATES]->(lo_qa_832);

// Re-anchor Q&A: 159163
MERGE (qa_833:QA_Pair {id: '159163'})
MERGE (p_qa_833:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_833:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_833)-[:INTERPRETS]->(p_qa_833)
MERGE (qa_833)-[:ILLUSTRATES]->(lo_qa_833);

// Re-anchor Q&A: 159551
MERGE (qa_834:QA_Pair {id: '159551'})
MERGE (p_qa_834:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_834:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_834)-[:INTERPRETS]->(p_qa_834)
MERGE (qa_834)-[:ILLUSTRATES]->(lo_qa_834);

// Re-anchor Q&A: 159264
MERGE (qa_835:QA_Pair {id: '159264'})
MERGE (p_qa_835:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_835:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_835)-[:INTERPRETS]->(p_qa_835)
MERGE (qa_835)-[:ILLUSTRATES]->(lo_qa_835);

// Re-anchor Q&A: 159383
MERGE (qa_836:QA_Pair {id: '159383'})
MERGE (p_qa_836:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_836:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_836)-[:INTERPRETS]->(p_qa_836)
MERGE (qa_836)-[:ILLUSTRATES]->(lo_qa_836);

// Re-anchor Q&A: 158945
MERGE (qa_837:QA_Pair {id: '158945'})
MERGE (p_qa_837:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_837:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_837)-[:INTERPRETS]->(p_qa_837)
MERGE (qa_837)-[:ILLUSTRATES]->(lo_qa_837);

// Re-anchor Q&A: 159259
MERGE (qa_838:QA_Pair {id: '159259'})
MERGE (p_qa_838:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_838:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_838)-[:INTERPRETS]->(p_qa_838)
MERGE (qa_838)-[:ILLUSTRATES]->(lo_qa_838);

// Re-anchor Q&A: 159553
MERGE (qa_839:QA_Pair {id: '159553'})
MERGE (p_qa_839:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_839:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_839)-[:INTERPRETS]->(p_qa_839)
MERGE (qa_839)-[:ILLUSTRATES]->(lo_qa_839);

// Re-anchor Q&A: 159555
MERGE (qa_840:QA_Pair {id: '159555'})
MERGE (p_qa_840:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_840:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_840)-[:INTERPRETS]->(p_qa_840)
MERGE (qa_840)-[:ILLUSTRATES]->(lo_qa_840);

// Re-anchor Q&A: 159513
MERGE (qa_841:QA_Pair {id: '159513'})
MERGE (p_qa_841:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_841:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_841)-[:INTERPRETS]->(p_qa_841)
MERGE (qa_841)-[:ILLUSTRATES]->(lo_qa_841);

// Re-anchor Q&A: 159515
MERGE (qa_842:QA_Pair {id: '159515'})
MERGE (p_qa_842:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_842:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_842)-[:INTERPRETS]->(p_qa_842)
MERGE (qa_842)-[:ILLUSTRATES]->(lo_qa_842);

// Re-anchor Q&A: 158850
MERGE (qa_843:QA_Pair {id: '158850'})
MERGE (p_qa_843:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_843:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_843)-[:INTERPRETS]->(p_qa_843)
MERGE (qa_843)-[:ILLUSTRATES]->(lo_qa_843);

// Re-anchor Q&A: 159201
MERGE (qa_844:QA_Pair {id: '159201'})
MERGE (p_qa_844:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_844:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_844)-[:INTERPRETS]->(p_qa_844)
MERGE (qa_844)-[:ILLUSTRATES]->(lo_qa_844);

// Re-anchor Q&A: 159116
MERGE (qa_845:QA_Pair {id: '159116'})
MERGE (p_qa_845:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_845:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_845)-[:INTERPRETS]->(p_qa_845)
MERGE (qa_845)-[:ILLUSTRATES]->(lo_qa_845);

// Re-anchor Q&A: 159207
MERGE (qa_846:QA_Pair {id: '159207'})
MERGE (p_qa_846:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_846:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_846)-[:INTERPRETS]->(p_qa_846)
MERGE (qa_846)-[:ILLUSTRATES]->(lo_qa_846);

// Re-anchor Q&A: 159265
MERGE (qa_847:QA_Pair {id: '159265'})
MERGE (p_qa_847:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_847:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_847)-[:INTERPRETS]->(p_qa_847)
MERGE (qa_847)-[:ILLUSTRATES]->(lo_qa_847);

// Re-anchor Q&A: 159308
MERGE (qa_848:QA_Pair {id: '159308'})
MERGE (p_qa_848:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_848:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_848)-[:INTERPRETS]->(p_qa_848)
MERGE (qa_848)-[:ILLUSTRATES]->(lo_qa_848);

// Re-anchor Q&A: 159198
MERGE (qa_849:QA_Pair {id: '159198'})
MERGE (p_qa_849:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_849:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_849)-[:INTERPRETS]->(p_qa_849)
MERGE (qa_849)-[:ILLUSTRATES]->(lo_qa_849);

// Re-anchor Q&A: 159434
MERGE (qa_850:QA_Pair {id: '159434'})
MERGE (p_qa_850:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_850:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_850)-[:INTERPRETS]->(p_qa_850)
MERGE (qa_850)-[:ILLUSTRATES]->(lo_qa_850);

// Re-anchor Q&A: 159209
MERGE (qa_851:QA_Pair {id: '159209'})
MERGE (p_qa_851:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_851:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_851)-[:INTERPRETS]->(p_qa_851)
MERGE (qa_851)-[:ILLUSTRATES]->(lo_qa_851);

// Re-anchor Q&A: 159524
MERGE (qa_852:QA_Pair {id: '159524'})
MERGE (p_qa_852:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_852:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_852)-[:INTERPRETS]->(p_qa_852)
MERGE (qa_852)-[:ILLUSTRATES]->(lo_qa_852);

// Re-anchor Q&A: 158376
MERGE (qa_853:QA_Pair {id: '158376'})
MERGE (p_qa_853:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_853:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_853)-[:INTERPRETS]->(p_qa_853)
MERGE (qa_853)-[:ILLUSTRATES]->(lo_qa_853);

// Re-anchor Q&A: 159269
MERGE (qa_854:QA_Pair {id: '159269'})
MERGE (p_qa_854:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_854:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_854)-[:INTERPRETS]->(p_qa_854)
MERGE (qa_854)-[:ILLUSTRATES]->(lo_qa_854);

// Re-anchor Q&A: 159440
MERGE (qa_855:QA_Pair {id: '159440'})
MERGE (p_qa_855:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_855:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_855)-[:INTERPRETS]->(p_qa_855)
MERGE (qa_855)-[:ILLUSTRATES]->(lo_qa_855);

// Re-anchor Q&A: 159004
MERGE (qa_856:QA_Pair {id: '159004'})
MERGE (p_qa_856:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_856:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_856)-[:INTERPRETS]->(p_qa_856)
MERGE (qa_856)-[:ILLUSTRATES]->(lo_qa_856);

// Re-anchor Q&A: 159197
MERGE (qa_857:QA_Pair {id: '159197'})
MERGE (p_qa_857:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_857:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_857)-[:INTERPRETS]->(p_qa_857)
MERGE (qa_857)-[:ILLUSTRATES]->(lo_qa_857);

// Re-anchor Q&A: 159390
MERGE (qa_858:QA_Pair {id: '159390'})
MERGE (p_qa_858:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_858:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_858)-[:INTERPRETS]->(p_qa_858)
MERGE (qa_858)-[:ILLUSTRATES]->(lo_qa_858);

// Re-anchor Q&A: 158961
MERGE (qa_859:QA_Pair {id: '158961'})
MERGE (p_qa_859:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_859:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_859)-[:INTERPRETS]->(p_qa_859)
MERGE (qa_859)-[:ILLUSTRATES]->(lo_qa_859);

// Re-anchor Q&A: 158847
MERGE (qa_860:QA_Pair {id: '158847'})
MERGE (p_qa_860:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_860:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_860)-[:INTERPRETS]->(p_qa_860)
MERGE (qa_860)-[:ILLUSTRATES]->(lo_qa_860);

// Re-anchor Q&A: 159397
MERGE (qa_861:QA_Pair {id: '159397'})
MERGE (p_qa_861:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_861:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_861)-[:INTERPRETS]->(p_qa_861)
MERGE (qa_861)-[:ILLUSTRATES]->(lo_qa_861);

// Re-anchor Q&A: 159111
MERGE (qa_862:QA_Pair {id: '159111'})
MERGE (p_qa_862:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_862:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_862)-[:INTERPRETS]->(p_qa_862)
MERGE (qa_862)-[:ILLUSTRATES]->(lo_qa_862);

// Re-anchor Q&A: 158967
MERGE (qa_863:QA_Pair {id: '158967'})
MERGE (p_qa_863:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_863:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_863)-[:INTERPRETS]->(p_qa_863)
MERGE (qa_863)-[:ILLUSTRATES]->(lo_qa_863);

// Re-anchor Q&A: 158739
MERGE (qa_864:QA_Pair {id: '158739'})
MERGE (p_qa_864:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_864:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_864)-[:INTERPRETS]->(p_qa_864)
MERGE (qa_864)-[:ILLUSTRATES]->(lo_qa_864);

// Re-anchor Q&A: 159505
MERGE (qa_865:QA_Pair {id: '159505'})
MERGE (p_qa_865:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_865:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_865)-[:INTERPRETS]->(p_qa_865)
MERGE (qa_865)-[:ILLUSTRATES]->(lo_qa_865);

// Re-anchor Q&A: 159413
MERGE (qa_866:QA_Pair {id: '159413'})
MERGE (p_qa_866:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_866:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_866)-[:INTERPRETS]->(p_qa_866)
MERGE (qa_866)-[:ILLUSTRATES]->(lo_qa_866);

// Re-anchor Q&A: 159463
MERGE (qa_867:QA_Pair {id: '159463'})
MERGE (p_qa_867:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_867:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_867)-[:INTERPRETS]->(p_qa_867)
MERGE (qa_867)-[:ILLUSTRATES]->(lo_qa_867);

// Re-anchor Q&A: 158795
MERGE (qa_868:QA_Pair {id: '158795'})
MERGE (p_qa_868:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_868:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_868)-[:INTERPRETS]->(p_qa_868)
MERGE (qa_868)-[:ILLUSTRATES]->(lo_qa_868);

// Re-anchor Q&A: 159260
MERGE (qa_869:QA_Pair {id: '159260'})
MERGE (p_qa_869:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_869:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_869)-[:INTERPRETS]->(p_qa_869)
MERGE (qa_869)-[:ILLUSTRATES]->(lo_qa_869);

// Re-anchor Q&A: 159257
MERGE (qa_870:QA_Pair {id: '159257'})
MERGE (p_qa_870:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_870:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_870)-[:INTERPRETS]->(p_qa_870)
MERGE (qa_870)-[:ILLUSTRATES]->(lo_qa_870);

// Re-anchor Q&A: 158819
MERGE (qa_871:QA_Pair {id: '158819'})
MERGE (p_qa_871:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_871:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_871)-[:INTERPRETS]->(p_qa_871)
MERGE (qa_871)-[:ILLUSTRATES]->(lo_qa_871);

// Re-anchor Q&A: 159219
MERGE (qa_872:QA_Pair {id: '159219'})
MERGE (p_qa_872:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_872:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_872)-[:INTERPRETS]->(p_qa_872)
MERGE (qa_872)-[:ILLUSTRATES]->(lo_qa_872);

// Re-anchor Q&A: 157752
MERGE (qa_873:QA_Pair {id: '157752'})
MERGE (p_qa_873:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_873:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_873)-[:INTERPRETS]->(p_qa_873)
MERGE (qa_873)-[:ILLUSTRATES]->(lo_qa_873);

// Re-anchor Q&A: 152697
MERGE (qa_874:QA_Pair {id: '152697'})
MERGE (p_qa_874:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_874:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_874)-[:INTERPRETS]->(p_qa_874)
MERGE (qa_874)-[:ILLUSTRATES]->(lo_qa_874);

// Re-anchor Q&A: 159544
MERGE (qa_875:QA_Pair {id: '159544'})
MERGE (p_qa_875:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_875:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_875)-[:INTERPRETS]->(p_qa_875)
MERGE (qa_875)-[:ILLUSTRATES]->(lo_qa_875);

// Re-anchor Q&A: 158857
MERGE (qa_876:QA_Pair {id: '158857'})
MERGE (p_qa_876:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_876:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_876)-[:INTERPRETS]->(p_qa_876)
MERGE (qa_876)-[:ILLUSTRATES]->(lo_qa_876);

// Re-anchor Q&A: 159522
MERGE (qa_877:QA_Pair {id: '159522'})
MERGE (p_qa_877:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_877:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_877)-[:INTERPRETS]->(p_qa_877)
MERGE (qa_877)-[:ILLUSTRATES]->(lo_qa_877);

// Re-anchor Q&A: 159279
MERGE (qa_878:QA_Pair {id: '159279'})
MERGE (p_qa_878:LegalParagraph {id: 'PARA_ND132_D16'})
MERGE (lo_qa_878:Atomic_LO {id: 'LO_CIT_INTEREST_LIMIT_RELATED_PARTY'})
MERGE (qa_878)-[:INTERPRETS]->(p_qa_878)
MERGE (qa_878)-[:ILLUSTRATES]->(lo_qa_878);

// Re-anchor Q&A: 157057
MERGE (qa_879:QA_Pair {id: '157057'})
MERGE (p_qa_879:LegalParagraph {id: 'PARA_L48_D9'})
MERGE (lo_qa_879:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (qa_879)-[:INTERPRETS]->(p_qa_879)
MERGE (qa_879)-[:ILLUSTRATES]->(lo_qa_879);

// Re-anchor Q&A: 158042
MERGE (qa_880:QA_Pair {id: '158042'})
MERGE (p_qa_880:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_880:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_880)-[:INTERPRETS]->(p_qa_880)
MERGE (qa_880)-[:ILLUSTRATES]->(lo_qa_880);

// Re-anchor Q&A: 159237
MERGE (qa_881:QA_Pair {id: '159237'})
MERGE (p_qa_881:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_881:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_881)-[:INTERPRETS]->(p_qa_881)
MERGE (qa_881)-[:ILLUSTRATES]->(lo_qa_881);

// Re-anchor Q&A: 159437
MERGE (qa_882:QA_Pair {id: '159437'})
MERGE (p_qa_882:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_882:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_882)-[:INTERPRETS]->(p_qa_882)
MERGE (qa_882)-[:ILLUSTRATES]->(lo_qa_882);

// Re-anchor Q&A: 159414
MERGE (qa_883:QA_Pair {id: '159414'})
MERGE (p_qa_883:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_883:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_883)-[:INTERPRETS]->(p_qa_883)
MERGE (qa_883)-[:ILLUSTRATES]->(lo_qa_883);

// Re-anchor Q&A: 156378
MERGE (qa_884:QA_Pair {id: '156378'})
MERGE (p_qa_884:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_884:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_884)-[:INTERPRETS]->(p_qa_884)
MERGE (qa_884)-[:ILLUSTRATES]->(lo_qa_884);

// Re-anchor Q&A: 158916
MERGE (qa_885:QA_Pair {id: '158916'})
MERGE (p_qa_885:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_885:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_885)-[:INTERPRETS]->(p_qa_885)
MERGE (qa_885)-[:ILLUSTRATES]->(lo_qa_885);

// Re-anchor Q&A: 159509
MERGE (qa_886:QA_Pair {id: '159509'})
MERGE (p_qa_886:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_886:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_886)-[:INTERPRETS]->(p_qa_886)
MERGE (qa_886)-[:ILLUSTRATES]->(lo_qa_886);

// Re-anchor Q&A: 158919
MERGE (qa_887:QA_Pair {id: '158919'})
MERGE (p_qa_887:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_887:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_887)-[:INTERPRETS]->(p_qa_887)
MERGE (qa_887)-[:ILLUSTRATES]->(lo_qa_887);

// Re-anchor Q&A: 158982
MERGE (qa_888:QA_Pair {id: '158982'})
MERGE (p_qa_888:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_888:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_888)-[:INTERPRETS]->(p_qa_888)
MERGE (qa_888)-[:ILLUSTRATES]->(lo_qa_888);

// Re-anchor Q&A: 157931
MERGE (qa_889:QA_Pair {id: '157931'})
MERGE (p_qa_889:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_889:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_889)-[:INTERPRETS]->(p_qa_889)
MERGE (qa_889)-[:ILLUSTRATES]->(lo_qa_889);

// Re-anchor Q&A: 159039
MERGE (qa_890:QA_Pair {id: '159039'})
MERGE (p_qa_890:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_890:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_890)-[:INTERPRETS]->(p_qa_890)
MERGE (qa_890)-[:ILLUSTRATES]->(lo_qa_890);

// Re-anchor Q&A: 159275
MERGE (qa_891:QA_Pair {id: '159275'})
MERGE (p_qa_891:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_891:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_891)-[:INTERPRETS]->(p_qa_891)
MERGE (qa_891)-[:ILLUSTRATES]->(lo_qa_891);

// Re-anchor Q&A: 157653
MERGE (qa_892:QA_Pair {id: '157653'})
MERGE (p_qa_892:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_892:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_892)-[:INTERPRETS]->(p_qa_892)
MERGE (qa_892)-[:ILLUSTRATES]->(lo_qa_892);

// Re-anchor Q&A: 158661
MERGE (qa_893:QA_Pair {id: '158661'})
MERGE (p_qa_893:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_893:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_893)-[:INTERPRETS]->(p_qa_893)
MERGE (qa_893)-[:ILLUSTRATES]->(lo_qa_893);

// Re-anchor Q&A: 157660
MERGE (qa_894:QA_Pair {id: '157660'})
MERGE (p_qa_894:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_894:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_894)-[:INTERPRETS]->(p_qa_894)
MERGE (qa_894)-[:ILLUSTRATES]->(lo_qa_894);

// Re-anchor Q&A: 158655
MERGE (qa_895:QA_Pair {id: '158655'})
MERGE (p_qa_895:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_895:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_895)-[:INTERPRETS]->(p_qa_895)
MERGE (qa_895)-[:ILLUSTRATES]->(lo_qa_895);

// Re-anchor Q&A: 157617
MERGE (qa_896:QA_Pair {id: '157617'})
MERGE (p_qa_896:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_896:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_896)-[:INTERPRETS]->(p_qa_896)
MERGE (qa_896)-[:ILLUSTRATES]->(lo_qa_896);

// Re-anchor Q&A: 157966
MERGE (qa_897:QA_Pair {id: '157966'})
MERGE (p_qa_897:LegalParagraph {id: 'PARA_L48_D13'})
MERGE (lo_qa_897:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (qa_897)-[:INTERPRETS]->(p_qa_897)
MERGE (qa_897)-[:ILLUSTRATES]->(lo_qa_897);

// ===============================================================================

// STEP 3: CROSS-MODULE BRIDGE MAPPING (CANONICAL EVENTS & ACCOUNTING CONCEPTS)

// ===============================================================================

// Bridge: LO_VAT_INPUT_DEDUCTION_CONDITIONS -> EVENT_BUY_GOODS_SERVICES -> TK_1331
MERGE (lo_LO_VAT_INPUT_DEDUCTION_CONDITIONS:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
MERGE (evt_EVENT_BUY_GOODS_SERVICES:BusinessEvent {event_code: 'EVENT_BUY_GOODS_SERVICES'})
ON CREATE SET evt_EVENT_BUY_GOODS_SERVICES.event_name = 'Mua hàng hóa dịch vụ đầu vào';

MERGE (acc_TK_1331:AccountCode {account_code: 'TK_1331'})
ON CREATE SET acc_TK_1331.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';

MERGE (lo_LO_VAT_INPUT_DEDUCTION_CONDITIONS)-[:MAPS_TO_EVENT]->(evt_EVENT_BUY_GOODS_SERVICES)
MERGE (lo_LO_VAT_INPUT_DEDUCTION_CONDITIONS)-[:MAPS_TO_ACCOUNT]->(acc_TK_1331)
MERGE (evt_EVENT_BUY_GOODS_SERVICES)-[:MAPS_TO_ACCOUNT]->(acc_TK_1331);

// Bridge: LO_VAT_ZERO_PERCENT_EXPORT -> EVENT_EXPORT_GOODS -> TK_511
MERGE (lo_LO_VAT_ZERO_PERCENT_EXPORT:Atomic_LO {id: 'LO_VAT_ZERO_PERCENT_EXPORT'})
MERGE (evt_EVENT_EXPORT_GOODS:BusinessEvent {event_code: 'EVENT_EXPORT_GOODS'})
ON CREATE SET evt_EVENT_EXPORT_GOODS.event_name = 'Xuất khẩu hàng hóa dịch vụ';

MERGE (acc_TK_511:AccountCode {account_code: 'TK_511'})
ON CREATE SET acc_TK_511.account_name = 'Doanh thu bán hàng và cung cấp dịch vụ';

MERGE (lo_LO_VAT_ZERO_PERCENT_EXPORT)-[:MAPS_TO_EVENT]->(evt_EVENT_EXPORT_GOODS)
MERGE (lo_LO_VAT_ZERO_PERCENT_EXPORT)-[:MAPS_TO_ACCOUNT]->(acc_TK_511)
MERGE (evt_EVENT_EXPORT_GOODS)-[:MAPS_TO_ACCOUNT]->(acc_TK_511);

// Bridge: LO_CIT_DEDUCTIBLE_EXPENSE_RULE -> EVENT_PAY_OPERATING_EXPENSE -> TK_642
MERGE (lo_LO_CIT_DEDUCTIBLE_EXPENSE_RULE:Atomic_LO {id: 'LO_CIT_DEDUCTIBLE_EXPENSE_RULE'})
MERGE (evt_EVENT_PAY_OPERATING_EXPENSE:BusinessEvent {event_code: 'EVENT_PAY_OPERATING_EXPENSE'})
ON CREATE SET evt_EVENT_PAY_OPERATING_EXPENSE.event_name = 'Chi trả chi phí hoạt động kinh doanh';

MERGE (acc_TK_642:AccountCode {account_code: 'TK_642'})
ON CREATE SET acc_TK_642.account_name = 'Chi phí quản lý doanh nghiệp';

MERGE (lo_LO_CIT_DEDUCTIBLE_EXPENSE_RULE)-[:MAPS_TO_EVENT]->(evt_EVENT_PAY_OPERATING_EXPENSE)
MERGE (lo_LO_CIT_DEDUCTIBLE_EXPENSE_RULE)-[:MAPS_TO_ACCOUNT]->(acc_TK_642)
MERGE (evt_EVENT_PAY_OPERATING_EXPENSE)-[:MAPS_TO_ACCOUNT]->(acc_TK_642);

// Bridge: LO_CIT_INTEREST_LIMIT_RELATED_PARTY -> EVENT_PAY_INTEREST_EXPENSE -> TK_635
MERGE (lo_LO_CIT_INTEREST_LIMIT_RELATED_PARTY:Atomic_LO {id: 'LO_CIT_INTEREST_LIMIT_RELATED_PARTY'})
MERGE (evt_EVENT_PAY_INTEREST_EXPENSE:BusinessEvent {event_code: 'EVENT_PAY_INTEREST_EXPENSE'})
ON CREATE SET evt_EVENT_PAY_INTEREST_EXPENSE.event_name = 'Chi trả chi phí lãi vay giao dịch liên kết';

MERGE (acc_TK_635:AccountCode {account_code: 'TK_635'})
ON CREATE SET acc_TK_635.account_name = 'Chi phí tài chính';

MERGE (lo_LO_CIT_INTEREST_LIMIT_RELATED_PARTY)-[:MAPS_TO_EVENT]->(evt_EVENT_PAY_INTEREST_EXPENSE)
MERGE (lo_LO_CIT_INTEREST_LIMIT_RELATED_PARTY)-[:MAPS_TO_ACCOUNT]->(acc_TK_635)
MERGE (evt_EVENT_PAY_INTEREST_EXPENSE)-[:MAPS_TO_ACCOUNT]->(acc_TK_635);

// Bridge: LO_TAX_ADMIN_INVOICE_TIMING_PENALTY -> EVENT_ISSUING_E_INVOICE -> TK_3331
MERGE (lo_LO_TAX_ADMIN_INVOICE_TIMING_PENALTY:Atomic_LO {id: 'LO_TAX_ADMIN_INVOICE_TIMING_PENALTY'})
MERGE (evt_EVENT_ISSUING_E_INVOICE:BusinessEvent {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET evt_EVENT_ISSUING_E_INVOICE.event_name = 'Lập hóa đơn điện tử';

MERGE (acc_TK_3331:AccountCode {account_code: 'TK_3331'})
ON CREATE SET acc_TK_3331.account_name = 'Thuế GTGT phải nộp';

MERGE (lo_LO_TAX_ADMIN_INVOICE_TIMING_PENALTY)-[:MAPS_TO_EVENT]->(evt_EVENT_ISSUING_E_INVOICE)
MERGE (lo_LO_TAX_ADMIN_INVOICE_TIMING_PENALTY)-[:MAPS_TO_ACCOUNT]->(acc_TK_3331)
MERGE (evt_EVENT_ISSUING_E_INVOICE)-[:MAPS_TO_ACCOUNT]->(acc_TK_3331);