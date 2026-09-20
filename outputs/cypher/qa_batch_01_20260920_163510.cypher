// ===============================================================================
// BATCH INGESTION: qa_batch_01_20260920_163510
// GENERATED AT: 20260920_163510
// ===============================================================================

// 1. MERGE CANONICAL BRIDGES (Điểm neo Kế toán & Nghiệp vụ)


MERGE (event_1:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_1.event_name = 'Lập hóa đơn điện tử', event_1.domain = 'VAT';



MERGE (event_2:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_ISSUING_E_INVOICE'})
ON CREATE SET event_2.event_name = 'Lập hóa đơn điện tử', event_2.domain = 'VAT';





MERGE (acc_1:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_1.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



MERGE (acc_2:ACCOUNTING_CONCEPT {account_code: 'TK_1331'})
ON CREATE SET acc_2.account_name = 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ';



// 2. MERGE/CREATE REGULATION & OFFICIAL DISPATCH


// 3. CREATE PRACTICAL QA, RISKS & TRAPS



MERGE (qa_1:PRACTICAL_QA {id: 'QA_TAX_VAT_6898'})
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






MERGE (qa_2:PRACTICAL_QA {id: 'QA_TAX_VAT_4544'})
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



