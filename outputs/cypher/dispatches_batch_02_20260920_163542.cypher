// ===============================================================================
// BATCH INGESTION: dispatches_batch_02_20260920_163542
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


MERGE (disp_1:OFFICIAL_DISPATCH {id: 'DISPATCH_5671'})
ON CREATE SET 
    disp_1.dispatch_number = '565/CT-CS',
    disp_1.issue_date = '2026-01-15',
    disp_1.issuing_authority = 'Cục Thuế',
    disp_1.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_1.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: None Tiêu đề: None Cơ quan: None Ngày: None File gố...',
    disp_1.legal_status = 'Active';



MERGE (disp_2:OFFICIAL_DISPATCH {id: 'DISPATCH_9521'})
ON CREATE SET 
    disp_2.dispatch_number = '565/CT-CS',
    disp_2.issue_date = '2026-01-15',
    disp_2.issuing_authority = 'Cục Thuế',
    disp_2.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_2.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 2025/NĐ-CP Tiêu đề: None Cơ quan: None Ngày: None F...',
    disp_2.legal_status = 'Active';



MERGE (disp_3:OFFICIAL_DISPATCH {id: 'DISPATCH_8241'})
ON CREATE SET 
    disp_3.dispatch_number = '565/CT-CS',
    disp_3.issue_date = '2026-01-15',
    disp_3.issuing_authority = 'Cục Thuế',
    disp_3.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_3.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 1200/QĐ-CT Tiêu đề: None Cơ quan: Cục Thuế Ngày: No...',
    disp_3.legal_status = 'Active';



MERGE (disp_4:OFFICIAL_DISPATCH {id: 'DISPATCH_0454'})
ON CREATE SET 
    disp_4.dispatch_number = '565/CT-CS',
    disp_4.issue_date = '2026-01-15',
    disp_4.issuing_authority = 'Cục Thuế',
    disp_4.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_4.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 1225/QĐ-CT Tiêu đề: None Cơ quan: Cục Thuế Ngày: No...',
    disp_4.legal_status = 'Active';



MERGE (disp_5:OFFICIAL_DISPATCH {id: 'DISPATCH_8865'})
ON CREATE SET 
    disp_5.dispatch_number = '565/CT-CS',
    disp_5.issue_date = '2026-01-15',
    disp_5.issuing_authority = 'Cục Thuế',
    disp_5.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_5.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 135/2026/TT-BTC Tiêu đề: None Cơ quan: Bộ Tài chính...',
    disp_5.legal_status = 'Active';



MERGE (disp_6:OFFICIAL_DISPATCH {id: 'DISPATCH_5380'})
ON CREATE SET 
    disp_6.dispatch_number = '565/CT-CS',
    disp_6.issue_date = '2026-01-15',
    disp_6.issuing_authority = 'Cục Thuế',
    disp_6.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_6.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 136/2026/TT-BTC Tiêu đề: None Cơ quan: Bộ Tài chính...',
    disp_6.legal_status = 'Active';



MERGE (disp_7:OFFICIAL_DISPATCH {id: 'DISPATCH_5505'})
ON CREATE SET 
    disp_7.dispatch_number = '565/CT-CS',
    disp_7.issue_date = '2026-01-15',
    disp_7.issuing_authority = 'Cục Thuế',
    disp_7.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_7.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 1173/QĐ-BTC Tiêu đề: None Cơ quan: None Ngày: None ...',
    disp_7.legal_status = 'Active';



MERGE (disp_8:OFFICIAL_DISPATCH {id: 'DISPATCH_3962'})
ON CREATE SET 
    disp_8.dispatch_number = '565/CT-CS',
    disp_8.issue_date = '2026-01-15',
    disp_8.issuing_authority = 'Cục Thuế',
    disp_8.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_8.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 2025/NĐ-CP Tiêu đề: None Cơ quan: None Ngày: None F...',
    disp_8.legal_status = 'Active';



MERGE (disp_9:OFFICIAL_DISPATCH {id: 'DISPATCH_7476'})
ON CREATE SET 
    disp_9.dispatch_number = '565/CT-CS',
    disp_9.issue_date = '2026-01-15',
    disp_9.issuing_authority = 'Cục Thuế',
    disp_9.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_9.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 185/NQ-CP Tiêu đề: None Cơ quan: Chính phủ Ngày: No...',
    disp_9.legal_status = 'Active';



MERGE (disp_10:OFFICIAL_DISPATCH {id: 'DISPATCH_4172'})
ON CREATE SET 
    disp_10.dispatch_number = '565/CT-CS',
    disp_10.issue_date = '2026-01-15',
    disp_10.issuing_authority = 'Cục Thuế',
    disp_10.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_10.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 20/2026/QH16 Tiêu đề: None Cơ quan: Quốc hội Ngày: ...',
    disp_10.legal_status = 'Active';



MERGE (disp_11:OFFICIAL_DISPATCH {id: 'DISPATCH_8691'})
ON CREATE SET 
    disp_11.dispatch_number = '565/CT-CS',
    disp_11.issue_date = '2026-01-15',
    disp_11.issuing_authority = 'Cục Thuế',
    disp_11.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_11.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 21/2026/QH16 Tiêu đề: None Cơ quan: Quốc hội Ngày: ...',
    disp_11.legal_status = 'Active';



MERGE (disp_12:OFFICIAL_DISPATCH {id: 'DISPATCH_2517'})
ON CREATE SET 
    disp_12.dispatch_number = '565/CT-CS',
    disp_12.issue_date = '2026-01-15',
    disp_12.issuing_authority = 'Cục Thuế',
    disp_12.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_12.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 281/2026/NĐ-CP Tiêu đề: None Cơ quan: Chính phủ Ngà...',
    disp_12.legal_status = 'Active';



MERGE (disp_13:OFFICIAL_DISPATCH {id: 'DISPATCH_5908'})
ON CREATE SET 
    disp_13.dispatch_number = '565/CT-CS',
    disp_13.issue_date = '2026-01-15',
    disp_13.issuing_authority = 'Cục Thuế',
    disp_13.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_13.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 33/2026/VBHN-BTC Tiêu đề: None Cơ quan: Bộ Tài chín...',
    disp_13.legal_status = 'Active';



MERGE (disp_14:OFFICIAL_DISPATCH {id: 'DISPATCH_3412'})
ON CREATE SET 
    disp_14.dispatch_number = '565/CT-CS',
    disp_14.issue_date = '2026-01-15',
    disp_14.issuing_authority = 'Cục Thuế',
    disp_14.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_14.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 356/2026/NĐ-CP Tiêu đề: None Cơ quan: Chính phủ Ngà...',
    disp_14.legal_status = 'Active';



MERGE (disp_15:OFFICIAL_DISPATCH {id: 'DISPATCH_0939'})
ON CREATE SET 
    disp_15.dispatch_number = '565/CT-CS',
    disp_15.issue_date = '2026-01-15',
    disp_15.issuing_authority = 'Cục Thuế',
    disp_15.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_15.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 2026/NĐ-CP Tiêu đề: V/v thời điểm lập hóa đơn Cơ qu...',
    disp_15.legal_status = 'Active';



MERGE (disp_16:OFFICIAL_DISPATCH {id: 'DISPATCH_1940'})
ON CREATE SET 
    disp_16.dispatch_number = '565/CT-CS',
    disp_16.issue_date = '2026-01-15',
    disp_16.issuing_authority = 'Cục Thuế',
    disp_16.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_16.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 6872/CT-QLNT Tiêu đề: V/v thời điểm lập hóa đơn Cơ ...',
    disp_16.legal_status = 'Active';



MERGE (disp_17:OFFICIAL_DISPATCH {id: 'DISPATCH_0230'})
ON CREATE SET 
    disp_17.dispatch_number = '565/CT-CS',
    disp_17.issue_date = '2026-01-15',
    disp_17.issuing_authority = 'Cục Thuế',
    disp_17.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_17.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 41/2026/QĐ-TTG Tiêu đề: None Cơ quan: Thủ tướng Ngà...',
    disp_17.legal_status = 'Active';



MERGE (disp_18:OFFICIAL_DISPATCH {id: 'DISPATCH_4983'})
ON CREATE SET 
    disp_18.dispatch_number = '565/CT-CS',
    disp_18.issue_date = '2026-01-15',
    disp_18.issuing_authority = 'Cục Thuế',
    disp_18.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_18.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 4425/CT-CS Tiêu đề: V/v thué giå tri gia täng Cơ qu...',
    disp_18.legal_status = 'Active';



MERGE (disp_19:OFFICIAL_DISPATCH {id: 'DISPATCH_3655'})
ON CREATE SET 
    disp_19.dispatch_number = '565/CT-CS',
    disp_19.issue_date = '2026-01-15',
    disp_19.issuing_authority = 'Cục Thuế',
    disp_19.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_19.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 4554/CT-CS Tiêu đề: V/v Chinh såch tih Sü dyng dåt ...',
    disp_19.legal_status = 'Active';



MERGE (disp_20:OFFICIAL_DISPATCH {id: 'DISPATCH_6077'})
ON CREATE SET 
    disp_20.dispatch_number = '565/CT-CS',
    disp_20.issue_date = '2026-01-15',
    disp_20.issuing_authority = 'Cục Thuế',
    disp_20.target_taxpayer = 'Doanh nghiệp thương mại dịch vụ',
    disp_20.summary = 'Hướng dẫn thuế theo nội dung: Số hiệu: 4614/CT-NVT Tiêu đề: V/v Chinh såch hoån thué TNCN ...',
    disp_20.legal_status = 'Active';



// 3. CREATE PRACTICAL QA, RISKS & TRAPS
