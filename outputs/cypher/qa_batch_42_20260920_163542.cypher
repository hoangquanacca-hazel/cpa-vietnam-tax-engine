// ===============================================================================
// BATCH INGESTION: qa_batch_42_20260920_163542
// GENERATED AT: 20260920_163542
// ===============================================================================

// 1. MERGE CANONICAL BRIDGES (Điểm neo Kế toán & Nghiệp vụ)


MERGE (event_1:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_1.event_name = 'Lập hóa đơn điện tử', event_1.domain = 'VAT';



MERGE (event_2:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_2.event_name = 'Lập hóa đơn điện tử', event_2.domain = 'VAT';



MERGE (event_3:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_3.event_name = 'Lập hóa đơn điện tử', event_3.domain = 'VAT';



MERGE (event_4:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_4.event_name = 'Lập hóa đơn điện tử', event_4.domain = 'VAT';



MERGE (event_5:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_5.event_name = 'Lập hóa đơn điện tử', event_5.domain = 'VAT';



MERGE (event_6:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_6.event_name = 'Lập hóa đơn điện tử', event_6.domain = 'VAT';



MERGE (event_7:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_7.event_name = 'Lập hóa đơn điện tử', event_7.domain = 'VAT';



MERGE (event_8:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_8.event_name = 'Lập hóa đơn điện tử', event_8.domain = 'VAT';



MERGE (event_9:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_9.event_name = 'Lập hóa đơn điện tử', event_9.domain = 'VAT';



MERGE (event_10:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_10.event_name = 'Lập hóa đơn điện tử', event_10.domain = 'VAT';



MERGE (event_11:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_11.event_name = 'Lập hóa đơn điện tử', event_11.domain = 'VAT';



MERGE (event_12:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_12.event_name = 'Lập hóa đơn điện tử', event_12.domain = 'VAT';



MERGE (event_13:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_13.event_name = 'Lập hóa đơn điện tử', event_13.domain = 'VAT';



MERGE (event_14:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_14.event_name = 'Lập hóa đơn điện tử', event_14.domain = 'VAT';



MERGE (event_15:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_15.event_name = 'Lập hóa đơn điện tử', event_15.domain = 'VAT';



MERGE (event_16:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_16.event_name = 'Lập hóa đơn điện tử', event_16.domain = 'VAT';



MERGE (event_17:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_17.event_name = 'Lập hóa đơn điện tử', event_17.domain = 'VAT';



MERGE (event_18:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_18.event_name = 'Lập hóa đơn điện tử', event_18.domain = 'VAT';



MERGE (event_19:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_19.event_name = 'Lập hóa đơn điện tử', event_19.domain = 'VAT';



MERGE (event_20:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_20.event_name = 'Lập hóa đơn điện tử', event_20.domain = 'VAT';





MERGE (acc_1:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_1.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_2:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_2.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_3:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_3.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_4:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_4.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_5:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_5.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_6:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_6.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_7:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_7.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_8:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_8.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_9:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_9.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_10:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_10.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_11:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_11.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_12:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_12.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_13:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_13.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_14:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_14.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_15:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_15.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_16:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_16.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_17:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_17.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_18:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_18.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_19:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_19.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_20:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_20.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



// 2. MERGE/CREATE REGULATION & OFFICIAL DISPATCH


// 3. CREATE PRACTICAL QA, RISKS & TRAPS



MERGE (qa_1:PRACTICAL_QA {id: 'QA_TAX_VAT_9830'})
ON CREATE SET 
    qa_1.title = 'Giải đáp thắc mắc về Title: Ngày 25/04/2023, tôi có',
    qa_1.scenario_description = 'Tình huống thực tế: Title: Ngày 25/04/2023, tôi có đăng kí hộ kinh doanh, với mã',
    qa_1.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_1.tax_type = 'VAT',
    qa_1.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_1.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_1:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_1.risk_level = 'Medium',
    risk_1.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_1.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_1)-[:HAS_RISK]->(risk_1);



MERGE (trap_1:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_1.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_1.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_1.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_1)-[:HAS_EXAM_TRAP]->(trap_1);



MERGE (event_qa_1:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_1)-[:TRIGGERS_EVENT]->(event_qa_1);



MERGE (disp_ref_1:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_1)-[:BASED_ON]->(disp_ref_1);






MERGE (qa_2:PRACTICAL_QA {id: 'QA_TAX_VAT_2474'})
ON CREATE SET 
    qa_2.title = 'Giải đáp thắc mắc về Title: Công ty em thành lập ng',
    qa_2.scenario_description = 'Tình huống thực tế: Title: Công ty em thành lập ngày 14/10/2024 thuộc lĩnh vực t',
    qa_2.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_2.tax_type = 'VAT',
    qa_2.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_2.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_2:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_2.risk_level = 'Medium',
    risk_2.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_2.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_2)-[:HAS_RISK]->(risk_2);



MERGE (trap_2:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_2.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_2.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_2.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_2)-[:HAS_EXAM_TRAP]->(trap_2);



MERGE (event_qa_2:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_2)-[:TRIGGERS_EVENT]->(event_qa_2);



MERGE (disp_ref_2:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_2)-[:BASED_ON]->(disp_ref_2);






MERGE (qa_3:PRACTICAL_QA {id: 'QA_TAX_VAT_5489'})
ON CREATE SET 
    qa_3.title = 'Giải đáp thắc mắc về Title: Theo quy định tại điểm ',
    qa_3.scenario_description = 'Tình huống thực tế: Title: Theo quy định tại điểm a khoản 2 Điều 257 Luật Đất đa',
    qa_3.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_3.tax_type = 'VAT',
    qa_3.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_3.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_3:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_3.risk_level = 'Medium',
    risk_3.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_3.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_3)-[:HAS_RISK]->(risk_3);



MERGE (trap_3:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_3.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_3.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_3.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_3)-[:HAS_EXAM_TRAP]->(trap_3);



MERGE (event_qa_3:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_3)-[:TRIGGERS_EVENT]->(event_qa_3);



MERGE (disp_ref_3:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_3)-[:BASED_ON]->(disp_ref_3);






MERGE (qa_4:PRACTICAL_QA {id: 'QA_TAX_VAT_6360'})
ON CREATE SET 
    qa_4.title = 'Giải đáp thắc mắc về Title: Kính gửi: BỘ TÀI CHÍNH.',
    qa_4.scenario_description = 'Tình huống thực tế: Title: Kính gửi: BỘ TÀI CHÍNH. Đơn vị tôi là Đơn vị nhóm 2 đ',
    qa_4.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_4.tax_type = 'VAT',
    qa_4.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_4.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_4:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_4.risk_level = 'Medium',
    risk_4.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_4.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_4)-[:HAS_RISK]->(risk_4);



MERGE (trap_4:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_4.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_4.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_4.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_4)-[:HAS_EXAM_TRAP]->(trap_4);



MERGE (event_qa_4:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_4)-[:TRIGGERS_EVENT]->(event_qa_4);



MERGE (disp_ref_4:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_4)-[:BASED_ON]->(disp_ref_4);






MERGE (qa_5:PRACTICAL_QA {id: 'QA_TAX_VAT_7942'})
ON CREATE SET 
    qa_5.title = 'Giải đáp thắc mắc về Title: Kính gửi: Bộ Tài Chính ',
    qa_5.scenario_description = 'Tình huống thực tế: Title: Kính gửi: Bộ Tài Chính Hiện tại chúng tôi có vướng mắ',
    qa_5.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_5.tax_type = 'VAT',
    qa_5.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_5.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_5:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_5.risk_level = 'Medium',
    risk_5.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_5.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_5)-[:HAS_RISK]->(risk_5);



MERGE (trap_5:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_5.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_5.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_5.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_5)-[:HAS_EXAM_TRAP]->(trap_5);



MERGE (event_qa_5:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_5)-[:TRIGGERS_EVENT]->(event_qa_5);



MERGE (disp_ref_5:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_5)-[:BASED_ON]->(disp_ref_5);






MERGE (qa_6:PRACTICAL_QA {id: 'QA_TAX_VAT_8484'})
ON CREATE SET 
    qa_6.title = 'Giải đáp thắc mắc về Title: Theo Công văn số 20173/',
    qa_6.scenario_description = 'Tình huống thực tế: Title: Theo Công văn số 20173/BTC-QLKT ngày 26/12/2025 của B',
    qa_6.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_6.tax_type = 'VAT',
    qa_6.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_6.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_6:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_6.risk_level = 'Medium',
    risk_6.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_6.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_6)-[:HAS_RISK]->(risk_6);



MERGE (trap_6:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_6.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_6.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_6.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_6)-[:HAS_EXAM_TRAP]->(trap_6);



MERGE (event_qa_6:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_6)-[:TRIGGERS_EVENT]->(event_qa_6);



MERGE (disp_ref_6:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_6)-[:BASED_ON]->(disp_ref_6);






MERGE (qa_7:PRACTICAL_QA {id: 'QA_TAX_VAT_4255'})
ON CREATE SET 
    qa_7.title = 'Giải đáp thắc mắc về Title: Kính gửi: Bộ tài chính,',
    qa_7.scenario_description = 'Tình huống thực tế: Title: Kính gửi: Bộ tài chính, liên quan đến Luật thuế thu n',
    qa_7.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_7.tax_type = 'VAT',
    qa_7.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_7.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_7:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_7.risk_level = 'Medium',
    risk_7.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_7.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_7)-[:HAS_RISK]->(risk_7);



MERGE (trap_7:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_7.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_7.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_7.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_7)-[:HAS_EXAM_TRAP]->(trap_7);



MERGE (event_qa_7:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_7)-[:TRIGGERS_EVENT]->(event_qa_7);



MERGE (disp_ref_7:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_7)-[:BASED_ON]->(disp_ref_7);






MERGE (qa_8:PRACTICAL_QA {id: 'QA_TAX_VAT_8536'})
ON CREATE SET 
    qa_8.title = 'Giải đáp thắc mắc về Title: Xin hướng dẫn về việc p',
    qa_8.scenario_description = 'Tình huống thực tế: Title: Xin hướng dẫn về việc phát hành hóa đơn trong hoạt độ',
    qa_8.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_8.tax_type = 'VAT',
    qa_8.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_8.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_8:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_8.risk_level = 'Medium',
    risk_8.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_8.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_8)-[:HAS_RISK]->(risk_8);



MERGE (trap_8:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_8.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_8.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_8.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_8)-[:HAS_EXAM_TRAP]->(trap_8);



MERGE (event_qa_8:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_8)-[:TRIGGERS_EVENT]->(event_qa_8);



MERGE (disp_ref_8:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_8)-[:BASED_ON]->(disp_ref_8);






MERGE (qa_9:PRACTICAL_QA {id: 'QA_TAX_VAT_9658'})
ON CREATE SET 
    qa_9.title = 'Giải đáp thắc mắc về Title: - Ngày 10/12/2025, Quốc',
    qa_9.scenario_description = 'Tình huống thực tế: Title: - Ngày 10/12/2025, Quốc hội biểu quyết thông qua Luật',
    qa_9.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_9.tax_type = 'VAT',
    qa_9.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_9.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_9:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_9.risk_level = 'Medium',
    risk_9.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_9.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_9)-[:HAS_RISK]->(risk_9);



MERGE (trap_9:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_9.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_9.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_9.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_9)-[:HAS_EXAM_TRAP]->(trap_9);



MERGE (event_qa_9:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_9)-[:TRIGGERS_EVENT]->(event_qa_9);



MERGE (disp_ref_9:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_9)-[:BASED_ON]->(disp_ref_9);






MERGE (qa_10:PRACTICAL_QA {id: 'QA_TAX_VAT_8309'})
ON CREATE SET 
    qa_10.title = 'Giải đáp thắc mắc về Title: Kính gửi: Bộ Tài chính,',
    qa_10.scenario_description = 'Tình huống thực tế: Title: Kính gửi: Bộ Tài chính, Tôi đang công tác tại phòng C',
    qa_10.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_10.tax_type = 'VAT',
    qa_10.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_10.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_10:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_10.risk_level = 'Medium',
    risk_10.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_10.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_10)-[:HAS_RISK]->(risk_10);



MERGE (trap_10:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_10.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_10.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_10.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_10)-[:HAS_EXAM_TRAP]->(trap_10);



MERGE (event_qa_10:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_10)-[:TRIGGERS_EVENT]->(event_qa_10);



MERGE (disp_ref_10:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_10)-[:BASED_ON]->(disp_ref_10);






MERGE (qa_11:PRACTICAL_QA {id: 'QA_TAX_VAT_8951'})
ON CREATE SET 
    qa_11.title = 'Giải đáp thắc mắc về Title: Kính gửi Bộ Tài chính! ',
    qa_11.scenario_description = 'Tình huống thực tế: Title: Kính gửi Bộ Tài chính! Tôi có câu hỏi về thời điểm lậ',
    qa_11.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_11.tax_type = 'VAT',
    qa_11.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_11.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_11:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_11.risk_level = 'Medium',
    risk_11.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_11.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_11)-[:HAS_RISK]->(risk_11);



MERGE (trap_11:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_11.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_11.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_11.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_11)-[:HAS_EXAM_TRAP]->(trap_11);



MERGE (event_qa_11:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_11)-[:TRIGGERS_EVENT]->(event_qa_11);



MERGE (disp_ref_11:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_11)-[:BASED_ON]->(disp_ref_11);






MERGE (qa_12:PRACTICAL_QA {id: 'QA_TAX_VAT_9833'})
ON CREATE SET 
    qa_12.title = 'Giải đáp thắc mắc về Title: Kính gửi BTC, Tôi là Hộ',
    qa_12.scenario_description = 'Tình huống thực tế: Title: Kính gửi BTC, Tôi là Hộ kinh doanh cho thuê phòng trọ',
    qa_12.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_12.tax_type = 'VAT',
    qa_12.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_12.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_12:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_12.risk_level = 'Medium',
    risk_12.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_12.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_12)-[:HAS_RISK]->(risk_12);



MERGE (trap_12:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_12.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_12.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_12.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_12)-[:HAS_EXAM_TRAP]->(trap_12);



MERGE (event_qa_12:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_12)-[:TRIGGERS_EVENT]->(event_qa_12);



MERGE (disp_ref_12:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_12)-[:BASED_ON]->(disp_ref_12);






MERGE (qa_13:PRACTICAL_QA {id: 'QA_TAX_VAT_2677'})
ON CREATE SET 
    qa_13.title = 'Giải đáp thắc mắc về Title: Kính gửi Bộ Tài Chính T',
    qa_13.scenario_description = 'Tình huống thực tế: Title: Kính gửi Bộ Tài Chính Tôi có một số thắc mắc liên qua',
    qa_13.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_13.tax_type = 'VAT',
    qa_13.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_13.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_13:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_13.risk_level = 'Medium',
    risk_13.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_13.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_13)-[:HAS_RISK]->(risk_13);



MERGE (trap_13:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_13.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_13.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_13.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_13)-[:HAS_EXAM_TRAP]->(trap_13);



MERGE (event_qa_13:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_13)-[:TRIGGERS_EVENT]->(event_qa_13);



MERGE (disp_ref_13:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_13)-[:BASED_ON]->(disp_ref_13);






MERGE (qa_14:PRACTICAL_QA {id: 'QA_TAX_VAT_7752'})
ON CREATE SET 
    qa_14.title = 'Giải đáp thắc mắc về Title: Em chào BTC! Công ty em',
    qa_14.scenario_description = 'Tình huống thực tế: Title: Em chào BTC! Công ty em là đơn vị gia công sản phẩm N',
    qa_14.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_14.tax_type = 'VAT',
    qa_14.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_14.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_14:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_14.risk_level = 'Medium',
    risk_14.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_14.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_14)-[:HAS_RISK]->(risk_14);



MERGE (trap_14:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_14.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_14.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_14.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_14)-[:HAS_EXAM_TRAP]->(trap_14);



MERGE (event_qa_14:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_14)-[:TRIGGERS_EVENT]->(event_qa_14);



MERGE (disp_ref_14:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_14)-[:BASED_ON]->(disp_ref_14);






MERGE (qa_15:PRACTICAL_QA {id: 'QA_TAX_VAT_8921'})
ON CREATE SET 
    qa_15.title = 'Giải đáp thắc mắc về Title: Năm 2018, tôi được cấp ',
    qa_15.scenario_description = 'Tình huống thực tế: Title: Năm 2018, tôi được cấp chứng chỉ hành nghề đấu thầu s',
    qa_15.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_15.tax_type = 'VAT',
    qa_15.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_15.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_15:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_15.risk_level = 'Medium',
    risk_15.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_15.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_15)-[:HAS_RISK]->(risk_15);



MERGE (trap_15:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_15.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_15.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_15.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_15)-[:HAS_EXAM_TRAP]->(trap_15);



MERGE (event_qa_15:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_15)-[:TRIGGERS_EVENT]->(event_qa_15);



MERGE (disp_ref_15:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_15)-[:BASED_ON]->(disp_ref_15);






MERGE (qa_16:PRACTICAL_QA {id: 'QA_TAX_VAT_1896'})
ON CREATE SET 
    qa_16.title = 'Giải đáp thắc mắc về Title: Kính gửi Quý Bộ, Công t',
    qa_16.scenario_description = 'Tình huống thực tế: Title: Kính gửi Quý Bộ, Công ty chúng tôi có mua sản phẩm tr',
    qa_16.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_16.tax_type = 'VAT',
    qa_16.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_16.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_16:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_16.risk_level = 'Medium',
    risk_16.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_16.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_16)-[:HAS_RISK]->(risk_16);



MERGE (trap_16:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_16.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_16.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_16.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_16)-[:HAS_EXAM_TRAP]->(trap_16);



MERGE (event_qa_16:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_16)-[:TRIGGERS_EVENT]->(event_qa_16);



MERGE (disp_ref_16:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_16)-[:BASED_ON]->(disp_ref_16);






MERGE (qa_17:PRACTICAL_QA {id: 'QA_TAX_VAT_3494'})
ON CREATE SET 
    qa_17.title = 'Giải đáp thắc mắc về Title: Kính gửi: Bộ Tài Chính.',
    qa_17.scenario_description = 'Tình huống thực tế: Title: Kính gửi: Bộ Tài Chính. Công ty chúng tôi: Công ty TN',
    qa_17.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_17.tax_type = 'VAT',
    qa_17.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_17.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_17:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_17.risk_level = 'Medium',
    risk_17.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_17.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_17)-[:HAS_RISK]->(risk_17);



MERGE (trap_17:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_17.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_17.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_17.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_17)-[:HAS_EXAM_TRAP]->(trap_17);



MERGE (event_qa_17:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_17)-[:TRIGGERS_EVENT]->(event_qa_17);



MERGE (disp_ref_17:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_17)-[:BASED_ON]->(disp_ref_17);






MERGE (qa_18:PRACTICAL_QA {id: 'QA_TAX_VAT_2390'})
ON CREATE SET 
    qa_18.title = 'Giải đáp thắc mắc về Title: Theo Công văn số 932/KB',
    qa_18.scenario_description = 'Tình huống thực tế: Title: Theo Công văn số 932/KBXX-KTNN ngày 26/12/2025 của Kh',
    qa_18.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_18.tax_type = 'VAT',
    qa_18.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_18.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_18:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_18.risk_level = 'Medium',
    risk_18.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_18.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_18)-[:HAS_RISK]->(risk_18);



MERGE (trap_18:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_18.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_18.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_18.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_18)-[:HAS_EXAM_TRAP]->(trap_18);



MERGE (event_qa_18:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_18)-[:TRIGGERS_EVENT]->(event_qa_18);



MERGE (disp_ref_18:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_18)-[:BASED_ON]->(disp_ref_18);






MERGE (qa_19:PRACTICAL_QA {id: 'QA_TAX_VAT_3686'})
ON CREATE SET 
    qa_19.title = 'Giải đáp thắc mắc về Title: Kính gửi Bộ Tài chính! ',
    qa_19.scenario_description = 'Tình huống thực tế: Title: Kính gửi Bộ Tài chính! Tôi xin tiếp tục có câu hỏi về',
    qa_19.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_19.tax_type = 'VAT',
    qa_19.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_19.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_19:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_19.risk_level = 'Medium',
    risk_19.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_19.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_19)-[:HAS_RISK]->(risk_19);



MERGE (trap_19:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_19.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_19.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_19.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_19)-[:HAS_EXAM_TRAP]->(trap_19);



MERGE (event_qa_19:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_19)-[:TRIGGERS_EVENT]->(event_qa_19);



MERGE (disp_ref_19:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_19)-[:BASED_ON]->(disp_ref_19);






MERGE (qa_20:PRACTICAL_QA {id: 'QA_TAX_VAT_3486'})
ON CREATE SET 
    qa_20.title = 'Giải đáp thắc mắc về Title: Kính thưa Bộ Tài chính ',
    qa_20.scenario_description = 'Tình huống thực tế: Title: Kính thưa Bộ Tài chính theo Thông tư 99/2025/TT-BTC h',
    qa_20.core_question = 'Thời điểm xuất hóa đơn và kê khai thuế GTGT?',
    qa_20.tax_type = 'VAT',
    qa_20.target_audience = 'Doanh nghiệp kê khai thuế GTGT',
    qa_20.tax_conclusion = 'Khấu trừ thuế GTGT đầu vào khi có hóa đơn điện tử hợp lệ và chứng từ thanh toán ngân hàng.';


MERGE (risk_20:TAX_RISK {risk_code: 'RISK_INVOICE_TIMING_ERROR'})
ON CREATE SET 
    risk_20.risk_level = 'Medium',
    risk_20.penalty_ref = 'Nghị định 125/2020/NĐ-CP',
    risk_20.audit_warning = 'Xử phạt hành chính đối với hành vi lập hóa đơn sai thời điểm.';
MERGE (qa_20)-[:HAS_RISK]->(risk_20);



MERGE (trap_20:EXAM_TRAP {id: 'TRAP_CPA_VAT_TIMING'})
ON CREATE SET 
    trap_20.trap_name = 'Bẫy thời điểm nghiệm thu dịch vụ và xuất hóa đơn',
    trap_20.misconception_detail = 'Nhầm lẫn giữa thời điểm thu tiền và thời điểm hoàn thành dịch vụ.',
    trap_20.CPA_exam_relevance = 'Thường xuất hiện trong phần bài tập Thuế GTGT kỳ thi CPA.';
MERGE (qa_20)-[:HAS_EXAM_TRAP]->(trap_20);



MERGE (event_qa_20:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
MERGE (qa_20)-[:TRIGGERS_EVENT]->(event_qa_20);



MERGE (disp_ref_20:OFFICIAL_DISPATCH {id: 'DISPATCH_SAMPLE_01'})
MERGE (qa_20)-[:BASED_ON]->(disp_ref_20);



