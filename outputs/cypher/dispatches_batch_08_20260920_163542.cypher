// ===============================================================================
// BATCH INGESTION: dispatches_batch_08_20260920_163542
// GENERATED AT: 20260920_163542
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



MERGE (event_6:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_6.event_name = 'Mua sắm tài sản cố định', event_6.domain = 'CIT';



MERGE (event_7:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_7.event_name = 'Mua sắm tài sản cố định', event_7.domain = 'CIT';



MERGE (event_8:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_8.event_name = 'Mua sắm tài sản cố định', event_8.domain = 'CIT';



MERGE (event_9:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_9.event_name = 'Mua sắm tài sản cố định', event_9.domain = 'CIT';



MERGE (event_10:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_10.event_name = 'Mua sắm tài sản cố định', event_10.domain = 'CIT';



MERGE (event_11:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_11.event_name = 'Mua sắm tài sản cố định', event_11.domain = 'CIT';



MERGE (event_12:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_12.event_name = 'Mua sắm tài sản cố định', event_12.domain = 'CIT';



MERGE (event_13:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_13.event_name = 'Mua sắm tài sản cố định', event_13.domain = 'CIT';



MERGE (event_14:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_14.event_name = 'Mua sắm tài sản cố định', event_14.domain = 'CIT';



MERGE (event_15:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_15.event_name = 'Mua sắm tài sản cố định', event_15.domain = 'CIT';





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



MERGE (acc_6:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_6.account_name = 'Tài sản cố định hữu hình';



MERGE (acc_7:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_7.account_name = 'Tài sản cố định hữu hình';



MERGE (acc_8:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_8.account_name = 'Tài sản cố định hữu hình';



MERGE (acc_9:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_9.account_name = 'Tài sản cố định hữu hình';



MERGE (acc_10:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_10.account_name = 'Tài sản cố định hữu hình';



MERGE (acc_11:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_11.account_name = 'Tài sản cố định hữu hình';



MERGE (acc_12:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_12.account_name = 'Tài sản cố định hữu hình';



MERGE (acc_13:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_13.account_name = 'Tài sản cố định hữu hình';



MERGE (acc_14:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_14.account_name = 'Tài sản cố định hữu hình';



MERGE (acc_15:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_15.account_name = 'Tài sản cố định hữu hình';



// 2. MERGE/CREATE REGULATION & OFFICIAL DISPATCH


MERGE (disp_1:OFFICIAL_DISPATCH {id: 'DISPATCH_8043'})
ON CREATE SET 
    disp_1.dispatch_number = '565/CT-CS',
    disp_1.issue_date = '2026-01-15',
    disp_1.issuing_authority = 'Cục Thuế',
    disp_1.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_1.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 6846/CT-QLNT Tiêu đề: V/v trả lời vướng mắc tại Cơ ...',
    disp_1.legal_status = 'Active';



MERGE (disp_2:OFFICIAL_DISPATCH {id: 'DISPATCH_0958'})
ON CREATE SET 
    disp_2.dispatch_number = '565/CT-CS',
    disp_2.issue_date = '2026-01-15',
    disp_2.issuing_authority = 'Cục Thuế',
    disp_2.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_2.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 6866/CT-QLNT Tiêu đề: V/v tiền thuê đất Hà Nội, ngà...',
    disp_2.legal_status = 'Active';



MERGE (disp_3:OFFICIAL_DISPATCH {id: 'DISPATCH_8959'})
ON CREATE SET 
    disp_3.dispatch_number = '565/CT-CS',
    disp_3.issue_date = '2026-01-15',
    disp_3.issuing_authority = 'Cục Thuế',
    disp_3.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_3.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 6903/CT-QLNT Tiêu đề: V/v trả lời kiến nghị của độc...',
    disp_3.legal_status = 'Active';



MERGE (disp_4:OFFICIAL_DISPATCH {id: 'DISPATCH_2778'})
ON CREATE SET 
    disp_4.dispatch_number = '565/CT-CS',
    disp_4.issue_date = '2026-01-15',
    disp_4.issuing_authority = 'Cục Thuế',
    disp_4.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_4.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 2026/NĐ-CP Tiêu đề: None Cơ quan: None Ngày: None F...',
    disp_4.legal_status = 'Active';



MERGE (disp_5:OFFICIAL_DISPATCH {id: 'DISPATCH_4131'})
ON CREATE SET 
    disp_5.dispatch_number = '565/CT-CS',
    disp_5.issue_date = '2026-01-15',
    disp_5.issuing_authority = 'Cục Thuế',
    disp_5.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_5.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: None Tiêu đề: None Cơ quan: None Ngày: None File gố...',
    disp_5.legal_status = 'Active';



MERGE (disp_6:OFFICIAL_DISPATCH {id: 'DISPATCH_0272'})
ON CREATE SET 
    disp_6.dispatch_number = '565/CT-CS',
    disp_6.issue_date = '2026-01-15',
    disp_6.issuing_authority = 'Cục Thuế',
    disp_6.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_6.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 2023/NĐ-CP Tiêu đề: None Cơ quan: None Ngày: None F...',
    disp_6.legal_status = 'Active';



MERGE (disp_7:OFFICIAL_DISPATCH {id: 'DISPATCH_7039'})
ON CREATE SET 
    disp_7.dispatch_number = '565/CT-CS',
    disp_7.issue_date = '2026-01-15',
    disp_7.issuing_authority = 'Cục Thuế',
    disp_7.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_7.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: None Tiêu đề: None Cơ quan: None Ngày: None File gố...',
    disp_7.legal_status = 'Active';



MERGE (disp_8:OFFICIAL_DISPATCH {id: 'DISPATCH_4573'})
ON CREATE SET 
    disp_8.dispatch_number = '565/CT-CS',
    disp_8.issue_date = '2026-01-15',
    disp_8.issuing_authority = 'Cục Thuế',
    disp_8.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_8.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 2026/ND Tiêu đề: None Cơ quan: None Ngày: None File...',
    disp_8.legal_status = 'Active';



MERGE (disp_9:OFFICIAL_DISPATCH {id: 'DISPATCH_6313'})
ON CREATE SET 
    disp_9.dispatch_number = '565/CT-CS',
    disp_9.issue_date = '2026-01-15',
    disp_9.issuing_authority = 'Cục Thuế',
    disp_9.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_9.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 2026/NĐ-CP Tiêu đề: None Cơ quan: None Ngày: None F...',
    disp_9.legal_status = 'Active';



MERGE (disp_10:OFFICIAL_DISPATCH {id: 'DISPATCH_3899'})
ON CREATE SET 
    disp_10.dispatch_number = '565/CT-CS',
    disp_10.issue_date = '2026-01-15',
    disp_10.issuing_authority = 'Cục Thuế',
    disp_10.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_10.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 2019/NĐ-CP Tiêu đề: None Cơ quan: None Ngày: None F...',
    disp_10.legal_status = 'Active';



MERGE (disp_11:OFFICIAL_DISPATCH {id: 'DISPATCH_8341'})
ON CREATE SET 
    disp_11.dispatch_number = '565/CT-CS',
    disp_11.issue_date = '2026-01-15',
    disp_11.issuing_authority = 'Cục Thuế',
    disp_11.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_11.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: None Tiêu đề: None Cơ quan: None Ngày: None File gố...',
    disp_11.legal_status = 'Active';



MERGE (disp_12:OFFICIAL_DISPATCH {id: 'DISPATCH_4424'})
ON CREATE SET 
    disp_12.dispatch_number = '565/CT-CS',
    disp_12.issue_date = '2026-01-15',
    disp_12.issuing_authority = 'Cục Thuế',
    disp_12.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_12.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 2024/NĐ-CP Tiêu đề: V/v kinh phí bồi thường, hỗ trợ...',
    disp_12.legal_status = 'Active';



MERGE (disp_13:OFFICIAL_DISPATCH {id: 'DISPATCH_3201'})
ON CREATE SET 
    disp_13.dispatch_number = '565/CT-CS',
    disp_13.issue_date = '2026-01-15',
    disp_13.issuing_authority = 'Cục Thuế',
    disp_13.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_13.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 6387/CT-QLNT Tiêu đề: V/v kinh phí bồi thường, hỗ t...',
    disp_13.legal_status = 'Active';



MERGE (disp_14:OFFICIAL_DISPATCH {id: 'DISPATCH_3466'})
ON CREATE SET 
    disp_14.dispatch_number = '565/CT-CS',
    disp_14.issue_date = '2026-01-15',
    disp_14.issuing_authority = 'Cục Thuế',
    disp_14.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_14.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 2026/NĐ-CP Tiêu đề: NQ 242 Cơ quan: Chính phủ Ngày:...',
    disp_14.legal_status = 'Active';



MERGE (disp_15:OFFICIAL_DISPATCH {id: 'DISPATCH_4559'})
ON CREATE SET 
    disp_15.dispatch_number = '565/CT-CS',
    disp_15.issue_date = '2026-01-15',
    disp_15.issuing_authority = 'Cục Thuế',
    disp_15.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_15.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 458/TTR-BCA Tiêu đề: NQ 242 Cơ quan: Chính phủ Ngày...',
    disp_15.legal_status = 'Active';



// 3. CREATE PRACTICAL QA, RISKS & TRAPS
