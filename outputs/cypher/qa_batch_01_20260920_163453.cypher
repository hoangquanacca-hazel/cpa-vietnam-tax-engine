// ===============================================================================
// BATCH INGESTION: qa_batch_01_20260920_163453
// GENERATED AT: 20260920_163453
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



// 2. MERGE/CREATE REGULATION & OFFICIAL DISPATCH


// 3. CREATE PRACTICAL QA, RISKS & TRAPS



MERGE (qa_1:PRACTICAL_QA {id: 'QA_TAX_VAT_5566'})
ON CREATE SET 
    qa_1.title = 'Giải đáp thắc mắc về Title: Kính gửi: Bộ Tài chính ',
    qa_1.scenario_description = 'Tình huống thực tế: Title: Kính gửi: Bộ Tài chính Tôi có một vướng mắc liên quan',
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






MERGE (qa_2:PRACTICAL_QA {id: 'QA_TAX_VAT_2053'})
ON CREATE SET 
    qa_2.title = 'Giải đáp thắc mắc về Title: Kính gửi bộ tài chính, ',
    qa_2.scenario_description = 'Tình huống thực tế: Title: Kính gửi bộ tài chính, Công ty mình là công ty thương',
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






MERGE (qa_3:PRACTICAL_QA {id: 'QA_TAX_VAT_2969'})
ON CREATE SET 
    qa_3.title = 'Giải đáp thắc mắc về Title: Tại điểm c, khoản 6, Đi',
    qa_3.scenario_description = 'Tình huống thực tế: Title: Tại điểm c, khoản 6, Điều 1 Nghị định 239/2025/NĐ-CP ',
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






MERGE (qa_4:PRACTICAL_QA {id: 'QA_TAX_VAT_4475'})
ON CREATE SET 
    qa_4.title = 'Giải đáp thắc mắc về Title: Theo quy định tại khoản',
    qa_4.scenario_description = 'Tình huống thực tế: Title: Theo quy định tại khoản 1 Điều 2 Nghị định số 155/202',
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






MERGE (qa_5:PRACTICAL_QA {id: 'QA_TAX_VAT_2277'})
ON CREATE SET 
    qa_5.title = 'Giải đáp thắc mắc về Title: - Công ty A là chủ đầu ',
    qa_5.scenario_description = 'Tình huống thực tế: Title: - Công ty A là chủ đầu tư dự án kinh doanh kết cấu hạ',
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






MERGE (qa_6:PRACTICAL_QA {id: 'QA_TAX_VAT_1222'})
ON CREATE SET 
    qa_6.title = 'Giải đáp thắc mắc về Title: Kính gửi Cơ quan Thuế: ',
    qa_6.scenario_description = 'Tình huống thực tế: Title: Kính gửi Cơ quan Thuế: UBND xã trực tiếp thu tiền dịc',
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






MERGE (qa_7:PRACTICAL_QA {id: 'QA_TAX_VAT_0473'})
ON CREATE SET 
    qa_7.title = 'Giải đáp thắc mắc về Title: Câu hỏi: Kính gửi Bộ Tà',
    qa_7.scenario_description = 'Tình huống thực tế: Title: Câu hỏi: Kính gửi Bộ Tài Chính, Liên quan đến việc kê',
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






MERGE (qa_8:PRACTICAL_QA {id: 'QA_TAX_VAT_8608'})
ON CREATE SET 
    qa_8.title = 'Giải đáp thắc mắc về Title: Kính gửi Bộ Tài chính, ',
    qa_8.scenario_description = 'Tình huống thực tế: Title: Kính gửi Bộ Tài chính, Theo Thông tư 99/2025/TT-BTC, ',
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






MERGE (qa_9:PRACTICAL_QA {id: 'QA_TAX_VAT_9202'})
ON CREATE SET 
    qa_9.title = 'Giải đáp thắc mắc về Title: Tôi hiện đang hoạt động',
    qa_9.scenario_description = 'Tình huống thực tế: Title: Tôi hiện đang hoạt động tiếp thị liên kết (Affiliate)',
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






MERGE (qa_10:PRACTICAL_QA {id: 'QA_TAX_VAT_7811'})
ON CREATE SET 
    qa_10.title = 'Giải đáp thắc mắc về Title: Kính gửi: Quý Cơ quan T',
    qa_10.scenario_description = 'Tình huống thực tế: Title: Kính gửi: Quý Cơ quan Thông tin hộ kinh doanh: Hộ kin',
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



