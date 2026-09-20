// ===============================================================================
// BATCH INGESTION: dispatches_batch_05_20260920_163542
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



MERGE (event_16:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_16.event_name = 'Mua sắm tài sản cố định', event_16.domain = 'CIT';



MERGE (event_17:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_17.event_name = 'Mua sắm tài sản cố định', event_17.domain = 'CIT';



MERGE (event_18:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_18.event_name = 'Mua sắm tài sản cố định', event_18.domain = 'CIT';



MERGE (event_19:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_19.event_name = 'Mua sắm tài sản cố định', event_19.domain = 'CIT';



MERGE (event_20:CANONICAL_BUSINESS_EVENT {event_code: 'EVENT_BUY_FIXED_ASSET'})
ON CREATE SET event_20.event_name = 'Mua sắm tài sản cố định', event_20.domain = 'CIT';





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



MERGE (acc_16:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_16.account_name = 'Tài sản cố định hữu hình';



MERGE (acc_17:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_17.account_name = 'Tài sản cố định hữu hình';



MERGE (acc_18:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_18.account_name = 'Tài sản cố định hữu hình';



MERGE (acc_19:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_19.account_name = 'Tài sản cố định hữu hình';



MERGE (acc_20:ACCOUNTING_CONCEPT {account_code: 'TK_211'})
ON CREATE SET acc_20.account_name = 'Tài sản cố định hữu hình';



// 2. MERGE/CREATE REGULATION & OFFICIAL DISPATCH


MERGE (disp_1:OFFICIAL_DISPATCH {id: 'DISPATCH_0889'})
ON CREATE SET 
    disp_1.dispatch_number = '565/CT-CS',
    disp_1.issue_date = '2026-01-15',
    disp_1.issuing_authority = 'Cục Thuế',
    disp_1.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_1.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5357/CT-CS Tiêu đề: V/v Chinh såch thué giå tri gia...',
    disp_1.legal_status = 'Active';



MERGE (disp_2:OFFICIAL_DISPATCH {id: 'DISPATCH_0594'})
ON CREATE SET 
    disp_2.dispatch_number = '565/CT-CS',
    disp_2.issue_date = '2026-01-15',
    disp_2.issuing_authority = 'Cục Thuế',
    disp_2.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_2.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5358/CT-CS Tiêu đề: V/v thué tåi nguyén. KY Cơ quan...',
    disp_2.legal_status = 'Active';



MERGE (disp_3:OFFICIAL_DISPATCH {id: 'DISPATCH_4786'})
ON CREATE SET 
    disp_3.dispatch_number = '565/CT-CS',
    disp_3.issue_date = '2026-01-15',
    disp_3.issuing_authority = 'Cục Thuế',
    disp_3.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_3.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5359/CT-CS Tiêu đề: V/v chinh såch thué giå tri gia...',
    disp_3.legal_status = 'Active';



MERGE (disp_4:OFFICIAL_DISPATCH {id: 'DISPATCH_7684'})
ON CREATE SET 
    disp_4.dispatch_number = '565/CT-CS',
    disp_4.issue_date = '2026-01-15',
    disp_4.issuing_authority = 'Cục Thuế',
    disp_4.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_4.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5360 Tiêu đề: V/v chinh såch quin IS thué KY Cơ qu...',
    disp_4.legal_status = 'Active';



MERGE (disp_5:OFFICIAL_DISPATCH {id: 'DISPATCH_0082'})
ON CREATE SET 
    disp_5.dispatch_number = '565/CT-CS',
    disp_5.issue_date = '2026-01-15',
    disp_5.issuing_authority = 'Cục Thuế',
    disp_5.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_5.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5361/CT-CS Tiêu đề: V/v tiön thué r&ng KY Cơ quan: ...',
    disp_5.legal_status = 'Active';



MERGE (disp_6:OFFICIAL_DISPATCH {id: 'DISPATCH_9915'})
ON CREATE SET 
    disp_6.dispatch_number = '565/CT-CS',
    disp_6.issue_date = '2026-01-15',
    disp_6.issuing_authority = 'Cục Thuế',
    disp_6.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_6.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5362/CT-CS Tiêu đề: V/v phi thanh toån thu tin dung...',
    disp_6.legal_status = 'Active';



MERGE (disp_7:OFFICIAL_DISPATCH {id: 'DISPATCH_0169'})
ON CREATE SET 
    disp_7.dispatch_number = '565/CT-CS',
    disp_7.issue_date = '2026-01-15',
    disp_7.issuing_authority = 'Cục Thuế',
    disp_7.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_7.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5363/CT-CS Tiêu đề: V/v Chinh såch thué KY Cơ quan:...',
    disp_7.legal_status = 'Active';



MERGE (disp_8:OFFICIAL_DISPATCH {id: 'DISPATCH_7101'})
ON CREATE SET 
    disp_8.dispatch_number = '565/CT-CS',
    disp_8.issue_date = '2026-01-15',
    disp_8.issuing_authority = 'Cục Thuế',
    disp_8.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_8.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5371/CT-CS Tiêu đề: V/v tien thue dåt KY Cơ quan: N...',
    disp_8.legal_status = 'Active';



MERGE (disp_9:OFFICIAL_DISPATCH {id: 'DISPATCH_3716'})
ON CREATE SET 
    disp_9.dispatch_number = '565/CT-CS',
    disp_9.issue_date = '2026-01-15',
    disp_9.issuing_authority = 'Cục Thuế',
    disp_9.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_9.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5406/CT-CS Tiêu đề: V/v trå kién nghi cüa AusCham C...',
    disp_9.legal_status = 'Active';



MERGE (disp_10:OFFICIAL_DISPATCH {id: 'DISPATCH_7684'})
ON CREATE SET 
    disp_10.dispatch_number = '565/CT-CS',
    disp_10.issue_date = '2026-01-15',
    disp_10.issuing_authority = 'Cục Thuế',
    disp_10.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_10.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5408/CT-CS Tiêu đề: V/v tibn thuc dåt Cơ quan: Cục ...',
    disp_10.legal_status = 'Active';



MERGE (disp_11:OFFICIAL_DISPATCH {id: 'DISPATCH_4798'})
ON CREATE SET 
    disp_11.dispatch_number = '565/CT-CS',
    disp_11.issue_date = '2026-01-15',
    disp_11.issuing_authority = 'Cục Thuế',
    disp_11.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_11.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5438/CT-CS Tiêu đề: V/v höa don, chfrng tir Cơ quan...',
    disp_11.legal_status = 'Active';



MERGE (disp_12:OFFICIAL_DISPATCH {id: 'DISPATCH_9794'})
ON CREATE SET 
    disp_12.dispatch_number = '565/CT-CS',
    disp_12.issue_date = '2026-01-15',
    disp_12.issuing_authority = 'Cục Thuế',
    disp_12.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_12.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5477/CT-CS Tiêu đề: V/v chinh såch-thué. Cơ quan: C...',
    disp_12.legal_status = 'Active';



MERGE (disp_13:OFFICIAL_DISPATCH {id: 'DISPATCH_4329'})
ON CREATE SET 
    disp_13.dispatch_number = '565/CT-CS',
    disp_13.issue_date = '2026-01-15',
    disp_13.issuing_authority = 'Cục Thuế',
    disp_13.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_13.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5482/CT-NVT Tiêu đề: None Cơ quan: None Ngày: None ...',
    disp_13.legal_status = 'Active';



MERGE (disp_14:OFFICIAL_DISPATCH {id: 'DISPATCH_8773'})
ON CREATE SET 
    disp_14.dispatch_number = '565/CT-CS',
    disp_14.issue_date = '2026-01-15',
    disp_14.issuing_authority = 'Cục Thuế',
    disp_14.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_14.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5493/CT-CS Tiêu đề: V/v Chinh sach thué TNCN Cơ qua...',
    disp_14.legal_status = 'Active';



MERGE (disp_15:OFFICIAL_DISPATCH {id: 'DISPATCH_4049'})
ON CREATE SET 
    disp_15.dispatch_number = '565/CT-CS',
    disp_15.issue_date = '2026-01-15',
    disp_15.issuing_authority = 'Cục Thuế',
    disp_15.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_15.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5495/CT-CS Tiêu đề: None Cơ quan: None Ngày: None F...',
    disp_15.legal_status = 'Active';



MERGE (disp_16:OFFICIAL_DISPATCH {id: 'DISPATCH_2497'})
ON CREATE SET 
    disp_16.dispatch_number = '565/CT-CS',
    disp_16.issue_date = '2026-01-15',
    disp_16.issuing_authority = 'Cục Thuế',
    disp_16.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_16.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5521/CT-CS Tiêu đề: V/v thué dung dåt phi nong nghi...',
    disp_16.legal_status = 'Active';



MERGE (disp_17:OFFICIAL_DISPATCH {id: 'DISPATCH_2835'})
ON CREATE SET 
    disp_17.dispatch_number = '565/CT-CS',
    disp_17.issue_date = '2026-01-15',
    disp_17.issuing_authority = 'Cục Thuế',
    disp_17.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_17.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5522/CT-CS Tiêu đề: V/v Chinh såch thué GTGT. Cơ qu...',
    disp_17.legal_status = 'Active';



MERGE (disp_18:OFFICIAL_DISPATCH {id: 'DISPATCH_9036'})
ON CREATE SET 
    disp_18.dispatch_number = '565/CT-CS',
    disp_18.issue_date = '2026-01-15',
    disp_18.issuing_authority = 'Cục Thuế',
    disp_18.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_18.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5524/CT-CS Tiêu đề: None Cơ quan: Cục Thuế Ngày: No...',
    disp_18.legal_status = 'Active';



MERGE (disp_19:OFFICIAL_DISPATCH {id: 'DISPATCH_4201'})
ON CREATE SET 
    disp_19.dispatch_number = '565/CT-CS',
    disp_19.issue_date = '2026-01-15',
    disp_19.issuing_authority = 'Cục Thuế',
    disp_19.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_19.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5525/CT-CS Tiêu đề: V/v thué giå tri gia täng (GTGT...',
    disp_19.legal_status = 'Active';



MERGE (disp_20:OFFICIAL_DISPATCH {id: 'DISPATCH_4541'})
ON CREATE SET 
    disp_20.dispatch_number = '565/CT-CS',
    disp_20.issue_date = '2026-01-15',
    disp_20.issuing_authority = 'Cục Thuế',
    disp_20.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_20.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 5538/CT-CS Tiêu đề: V/v thué tåi nguyén. Cơ quan: C...',
    disp_20.legal_status = 'Active';



// 3. CREATE PRACTICAL QA, RISKS & TRAPS
