// ===============================================================================
// BATCH INGESTION: dispatches_batch_01_20260920_163453
// GENERATED AT: 20260920_163453
// ===============================================================================

// 1. MERGE CANONICAL BRIDGES (Điểm neo Kế toán & Nghiệp vụ)


MERGE (event_1:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_1.event_name = 'Mua sắm tài sản cố định', event_1.domain = 'CIT';



MERGE (event_2:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_2.event_name = 'Mua sắm tài sản cố định', event_2.domain = 'CIT';



MERGE (event_3:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_3.event_name = 'Mua sắm tài sản cố định', event_3.domain = 'CIT';



MERGE (event_4:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_4.event_name = 'Mua sắm tài sản cố định', event_4.domain = 'CIT';



MERGE (event_5:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_5.event_name = 'Mua sắm tài sản cố định', event_5.domain = 'CIT';





MERGE (acc_1:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_1.account_name = 'Tài sản cố định hữu hình';



MERGE (acc_2:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_2.account_name = 'Tài sản cố định hữu hình';



MERGE (acc_3:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_3.account_name = 'Tài sản cố định hữu hình';



MERGE (acc_4:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_4.account_name = 'Tài sản cố định hữu hình';



MERGE (acc_5:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_5.account_name = 'Tài sản cố định hữu hình';



// 2. MERGE/CREATE REGULATION & OFFICIAL DISPATCH


MERGE (disp_1:OFFICIAL_DISPATCH {id: 'DISPATCH_4000'})
ON CREATE SET 
    disp_1.dispatch_number = '565/CT-CS',
    disp_1.issue_date = '2026-01-15',
    disp_1.issuing_authority = 'Cục Thuế',
    disp_1.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_1.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 565/CT-CS Tiêu đề: V/v Huong dän khoän thu ho, chi ...',
    disp_1.legal_status = 'Active';



MERGE (disp_2:OFFICIAL_DISPATCH {id: 'DISPATCH_5578'})
ON CREATE SET 
    disp_2.dispatch_number = '565/CT-CS',
    disp_2.issue_date = '2026-01-15',
    disp_2.issuing_authority = 'Cục Thuế',
    disp_2.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_2.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 2025/NĐ-CP Tiêu đề: V/v åp dung thué suåt thué TNDN...',
    disp_2.legal_status = 'Active';



MERGE (disp_3:OFFICIAL_DISPATCH {id: 'DISPATCH_7711'})
ON CREATE SET 
    disp_3.dispatch_number = '565/CT-CS',
    disp_3.issue_date = '2026-01-15',
    disp_3.issuing_authority = 'Cục Thuế',
    disp_3.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_3.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 820/CST-TN Tiêu đề: V/v åp dung thué suåt thué TNDN...',
    disp_3.legal_status = 'Active';



MERGE (disp_4:OFFICIAL_DISPATCH {id: 'DISPATCH_9696'})
ON CREATE SET 
    disp_4.dispatch_number = '565/CT-CS',
    disp_4.issue_date = '2026-01-15',
    disp_4.issuing_authority = 'Cục Thuế',
    disp_4.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_4.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 2014/TT-BTC Tiêu đề: V/v chuyén nhuqng cb phån cüa ...',
    disp_4.legal_status = 'Active';



MERGE (disp_5:OFFICIAL_DISPATCH {id: 'DISPATCH_5792'})
ON CREATE SET 
    disp_5.dispatch_number = '565/CT-CS',
    disp_5.issue_date = '2026-01-15',
    disp_5.issuing_authority = 'Cục Thuế',
    disp_5.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_5.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 2055/NĐ-CP Tiêu đề: V/v chuyén nhuqng cb phån cüa c...',
    disp_5.legal_status = 'Active';



// 3. CREATE PRACTICAL QA, RISKS & TRAPS
