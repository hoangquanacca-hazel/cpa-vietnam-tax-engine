import { GraphNode, GraphEdge, ExactSpan, GoldenSetTestCase } from '../types/tax-graph';

export const INITIAL_EXACT_SPANS: ExactSpan[] = [
  {
    id: 'SPAN_CIT_INTEREST_30_01',
    article: 'Điều 16',
    clause: 'Khoản 3',
    point: 'Điểm a',
    sourceDocNumber: 'NĐ 20/2025/NĐ-CP',
    effectiveDate: '2025-01-01',
    status: 'Active',
    spanText: 'Tổng chi phí lãi vay sau khi trừ lãi tiền gửi và lãi cho vay phát sinh trong kỳ của người nộp thuế được trừ khi xác định thu nhập chịu thuế thu nhập doanh nghiệp không vượt quá 30% của tổng lợi nhuận thuần từ hoạt động kinh doanh trong kỳ cộng chi phí lãi vay sau khi trừ lãi tiền gửi và lãi cho vay phát sinh trong kỳ cộng chi phí khấu hao phát sinh trong kỳ (EBITDA).'
  },
  {
    id: 'SPAN_CIT_INTEREST_BANK_EXEMPT',
    article: 'Điều 16',
    clause: 'Khoản 3',
    point: 'Điểm c',
    sourceDocNumber: 'NĐ 320/2025/NĐ-CP',
    effectiveDate: '2025-04-01',
    status: 'Active',
    spanText: 'Trường hợp người nộp thuế có phát sinh giao dịch liên kết nhưng khoản vay được cấp bởi các tổ chức tín dụng, chi nhánh ngân hàng nước ngoài hoạt động hợp pháp tại Việt Nam độc lập và không phải là bên liên kết theo quy định tại Điều 5 Nghị định này, thì chi phí lãi vay phát sinh từ các khoản vay ngân hàng độc lập này được xem xét loại trừ khỏi phạm vi khống chế mức trần 30% EBITDA nếu đáp ứng đầy đủ hồ sơ thẩm định tín dụng thông thường.'
  },
  {
    id: 'SPAN_CIT_INTEREST_132_OLD',
    article: 'Điều 16',
    clause: 'Khoản 3',
    point: 'Điểm a',
    sourceDocNumber: 'NĐ 132/2020/NĐ-CP',
    effectiveDate: '2020-12-20',
    status: 'Superseded',
    spanText: 'Tổng chi phí lãi vay (sau khi trừ lãi tiền gửi và lãi cho vay) phát sinh trong kỳ được trừ khi xác định thu nhập chịu thuế TNDN không vượt quá 30% của tổng EBITDA. Phần chi phí lãi vay không được trừ được chuyển sang kỳ tính thuế tiếp theo khi xác định tổng chi phí lãi vay được trừ, thời gian chuyển không quá 05 năm liên tục.'
  },
  {
    id: 'SPAN_VAT_IMPORT_DEDUCTION_48',
    article: 'Điều 14',
    clause: 'Khoản 2',
    point: 'Điểm b',
    sourceDocNumber: 'Luật 48/2024/QH15',
    effectiveDate: '2025-07-01',
    status: 'Active',
    spanText: 'Đối với hàng hóa nhập khẩu, chứng từ nộp thuế giá trị gia tăng ở khâu nhập khẩu (biên lai hoặc chứng từ nộp tiền vào ngân sách nhà nước) là căn cứ để kê khai, khấu trừ thuế giá trị gia tăng đầu vào của kỳ tính thuế phát sinh việc nộp thuế, với điều kiện người nộp thuế đã hoàn thành nghĩa vụ nộp thuế vào Kho bạc Nhà nước trước thời điểm nộp hồ sơ khai thuế.'
  },
  {
    id: 'SPAN_VAT_ALLOCATION_FORMULA_48',
    article: 'Điều 14',
    clause: 'Khoản 3',
    point: 'Điểm a',
    sourceDocNumber: 'Luật 48/2024/QH15',
    effectiveDate: '2025-07-01',
    status: 'Active',
    spanText: 'Thuế giá trị gia tăng đầu vào của hàng hóa, dịch vụ dùng đồng thời cho sản xuất, kinh doanh hàng hóa, dịch vụ chịu thuế và không chịu thuế giá trị gia tăng thì chỉ được khấu trừ số thuế giá trị gia tăng đầu vào của hàng hóa, dịch vụ dùng cho sản xuất, kinh doanh hàng hóa, dịch vụ chịu thuế. Người nộp thuế phải hạch toán riêng; trường hợp không hạch toán riêng được thì số thuế đầu vào được khấu trừ tính theo tỷ lệ (%) giữa doanh thu chịu thuế GTGT, doanh thu không phải kê khai tính thuế so với tổng doanh thu của kỳ tính thuế.'
  },
  {
    id: 'SPAN_NON_CASH_PAYMENT_20M',
    article: 'Điều 6',
    clause: 'Khoản 1',
    point: 'Điểm c',
    sourceDocNumber: 'TT 78/2014/TT-BTC',
    effectiveDate: '2014-08-02',
    status: 'Active',
    spanText: 'Khoản chi nếu có hóa đơn mua hàng hóa, dịch vụ từng lần có giá trị từ 20 triệu đồng trở lên (giá đã bao gồm thuế GTGT) khi thanh toán phải có chứng từ thanh toán không dùng tiền mặt. Chứng từ thanh toán không dùng tiền mặt thực hiện theo quy định của các văn bản pháp luật về thuế giá trị gia tăng.'
  },
  {
    id: 'SPAN_PENALTY_LATE_TAX_38',
    article: 'Điều 59',
    clause: 'Khoản 2',
    point: 'Điểm a',
    sourceDocNumber: 'Luật 38/2019/QH14',
    effectiveDate: '2020-07-01',
    status: 'Active',
    spanText: 'Mức tính tiền chậm nộp bằng 0,03%/ngày tính trên số tiền thuế chậm nộp. Thời gian tính tiền chậm nộp được tính liên tục kể từ ngày tiếp sau ngày cuối cùng của thời hạn nộp thuế đến ngày người nộp thuế nộp số tiền thuế vào ngân sách nhà nước.'
  },
  {
    id: 'SPAN_PENALTY_UNDERDECLARE_38',
    article: 'Điều 142',
    clause: 'Khoản 1',
    point: 'Điểm a',
    sourceDocNumber: 'Luật 38/2019/QH14',
    effectiveDate: '2020-07-01',
    status: 'Active',
    spanText: 'Phạt 20% số tiền thuế khai thiếu hoặc số tiền thuế đã được miễn, giảm, hoàn cao hơn quy định đối với hành vi khai sai dẫn đến thiếu số tiền thuế phải nộp hoặc tăng số tiền thuế được miễn, giảm, hoàn nhưng người nộp thuế đã ghi chép kịp thời, đầy đủ các nghiệp vụ kinh tế làm căn cứ tính thuế.'
  },
  {
    id: 'SPAN_VAT_REDUCTION_174_DEDUCTION',
    article: 'Điều 1',
    clause: 'Khoản 2',
    point: 'Điểm a',
    sourceDocNumber: 'NĐ 180/2024/NĐ-CP',
    effectiveDate: '2025-01-01',
    expirationDate: '2025-06-30',
    status: 'Active',
    spanText: 'Cơ sở kinh doanh tính thuế giá trị gia tăng theo phương pháp khấu trừ được áp dụng mức thuế suất thuế giá trị gia tăng 8% đối với hàng hóa, dịch vụ quy định tại khoản 1 Điều này. Khi lập hóa đơn giá trị gia tăng, tại dòng thuế suất thuế giá trị gia tăng ghi "8%"; tiền thuế giá trị gia tăng; tổng số tiền người mua phải thanh toán.'
  },
  {
    id: 'SPAN_VAT_REDUCTION_180_DIRECT_HOUSEHOLD',
    article: 'Điều 1',
    clause: 'Khoản 2 & Khoản 3',
    point: 'Điểm b',
    sourceDocNumber: 'NĐ 180/2024/NĐ-CP',
    effectiveDate: '2025-01-01',
    expirationDate: '2025-06-30',
    status: 'Active',
    spanText: 'Cơ sở kinh doanh (bao gồm cả hộ kinh doanh, cá nhân kinh doanh) tính thuế giá trị gia tăng theo phương pháp tỷ lệ % trên doanh thu được giảm 20% mức tỷ lệ % để tính thuế giá trị gia tăng khi thực hiện xuất hóa đơn đối với hàng hóa, dịch vụ được giảm thuế. Khi lập hóa đơn bán hàng cung cấp hàng hóa, dịch vụ thuộc đối tượng giảm thuế, tại cột "Thành tiền" ghi đầy đủ tiền hàng hóa, dịch vụ trước khi giảm; tại dòng "Cộng tiền hàng hóa, dịch vụ" ghi theo số đã giảm 20% mức tỷ lệ % trên doanh thu; đồng thời ghi chú: "đã giảm... (số tiền) tương ứng 20% mức tỷ lệ % để tính thuế GTGT theo Nghị quyết số 174/2024/QH15".'
  },
  {
    id: 'SPAN_VAT_REDUCTION_204_EXTENDED',
    article: 'Điều 1',
    clause: 'Khoản 1 & Khoản 2',
    point: 'Điểm b',
    sourceDocNumber: 'NĐ 174/2025/NĐ-CP',
    effectiveDate: '2025-07-01',
    expirationDate: '2026-12-31',
    status: 'Active',
    spanText: 'Tiếp tục thực hiện chính sách giảm 2% thuế suất thuế giá trị gia tăng từ ngày 01 tháng 7 năm 2025 đến hết ngày 31 tháng 12 năm 2026 theo Nghị quyết số 204/2025/QH15, bãi bỏ một số danh mục loại trừ cũ (mở rộng đối tượng áp dụng). Hộ, cá nhân kinh doanh tiếp tục ghi chú: "đã giảm... (số tiền) tương ứng 20% mức tỷ lệ % để tính thuế GTGT theo Nghị quyết số 204/2025/QH15".'
  }
];

export const INITIAL_NODES: GraphNode[] = [
  // Layer 1: Regulatory
  {
    id: 'DOC_ND_20_2025',
    label: 'Nghị định 20/2025/NĐ-CP',
    layer: 'REGULATORY',
    subType: 'DECREE',
    title: 'Nghị định 20/2025/NĐ-CP về Quản lý thuế đối với Doanh nghiệp có Giao dịch liên kết',
    summary: 'Quy định trần chi phí lãi vay thuần 30% EBITDA và sửa đổi danh mục quan hệ liên kết.',
    legalStatus: 'Active',
    effectiveDate: '2025-01-01',
    issuingAuthority: 'Chính phủ',
    docNumber: '20/2025/NĐ-CP',
    exactSpans: [INITIAL_EXACT_SPANS[0]]
  },
  {
    id: 'DOC_ND_320_2025',
    label: 'Nghị định 320/2025/NĐ-CP',
    layer: 'REGULATORY',
    subType: 'DECREE',
    title: 'Nghị định 320/2025/NĐ-CP sửa đổi, bổ sung quy định chi phí lãi vay NHTM độc lập',
    summary: 'Cho phép loại trừ khoản vay từ các ngân hàng thương mại độc lập khỏi trần 30% EBITDA nếu đủ điều kiện thẩm định tín dụng.',
    legalStatus: 'Active',
    effectiveDate: '2025-04-01',
    issuingAuthority: 'Chính phủ',
    docNumber: '320/2025/NĐ-CP',
    exactSpans: [INITIAL_EXACT_SPANS[1]]
  },
  {
    id: 'DOC_ND_132_2020',
    label: 'Nghị định 132/2020/NĐ-CP',
    layer: 'REGULATORY',
    subType: 'DECREE',
    title: 'Nghị định 132/2020/NĐ-CP Quản lý thuế DN có giao dịch liên kết (Cũ)',
    summary: 'Văn bản cũ khống chế chi phí lãi vay 30% EBITDA gồm cả các khoản vay ngân hàng độc lập (Điểm d Khoản 2 Điều 5).',
    legalStatus: 'Superseded',
    effectiveDate: '2020-12-20',
    expirationDate: '2024-12-31',
    issuingAuthority: 'Chính phủ',
    docNumber: '132/2020/NĐ-CP',
    exactSpans: [INITIAL_EXACT_SPANS[2]]
  },
  {
    id: 'DOC_LUAT_GTGT_48_2024',
    label: 'Luật GTGT 48/2024/QH15',
    layer: 'REGULATORY',
    subType: 'LAW',
    title: 'Luật Thuế Giá trị gia tăng số 48/2024/QH15',
    summary: 'Luật mới có hiệu lực từ 01/07/2025 thay thế Luật GTGT 2008, quy định điều kiện chứng từ nộp thuế khâu nhập khẩu và phân bổ đầu vào dùng chung.',
    legalStatus: 'Active',
    effectiveDate: '2025-07-01',
    issuingAuthority: 'Quốc hội',
    docNumber: '48/2024/QH15',
    exactSpans: [INITIAL_EXACT_SPANS[3], INITIAL_EXACT_SPANS[4]]
  },
  {
    id: 'DOC_LUAT_TNDN_67_2025',
    label: 'Luật TNDN 67/2025/QH15',
    layer: 'REGULATORY',
    subType: 'LAW',
    title: 'Luật Thuế Thu nhập doanh nghiệp số 67/2025/QH15',
    summary: 'Luật mới có hiệu lực từ 01/01/2026, cập nhật toàn diện chi phí được trừ, ưu đãi thuế tối thiểu toàn cầu và nguyên tắc vốn mỏng.',
    legalStatus: 'Active',
    effectiveDate: '2026-01-01',
    issuingAuthority: 'Quốc hội',
    docNumber: '67/2025/QH15',
    exactSpans: []
  },
  {
    id: 'DOC_TT_78_2014',
    label: 'Thông tư 78/2014/TT-BTC',
    layer: 'REGULATORY',
    subType: 'CIRCULAR',
    title: 'Thông tư 78/2014/TT-BTC Hướng dẫn thi hành thuế TNDN',
    summary: 'Quy định chi tiết điều kiện chi phí được trừ: có hóa đơn hợp pháp, phục vụ SXKD và chứng từ thanh toán không dùng tiền mặt với hóa đơn >= 20 triệu.',
    legalStatus: 'Active',
    effectiveDate: '2014-08-02',
    issuingAuthority: 'Bộ Tài chính',
    docNumber: '78/2014/TT-BTC',
    exactSpans: [INITIAL_EXACT_SPANS[5]]
  },
  {
    id: 'DOC_LUAT_QLT_38_2019',
    label: 'Luật Quản lý thuế 38/2019/QH14',
    layer: 'REGULATORY',
    subType: 'LAW',
    title: 'Luật Quản lý thuế số 38/2019/QH14',
    summary: 'Quy định chế tài xử lý vi phạm thuế, tiền chậm nộp 0.03%/ngày và xử phạt 20% số tiền thuế khai thiếu.',
    legalStatus: 'Active',
    effectiveDate: '2020-07-01',
    issuingAuthority: 'Quốc hội',
    docNumber: '38/2019/QH14',
    exactSpans: [INITIAL_EXACT_SPANS[6], INITIAL_EXACT_SPANS[7]]
  },
  {
    id: 'DOC_NQ_174_2024',
    label: 'Nghị quyết 174/2024/QH15',
    layer: 'REGULATORY',
    subType: 'LAW',
    title: 'Nghị quyết số 174/2024/QH15 Kỳ họp thứ 8 Quốc hội khóa XV',
    summary: 'Giảm 2% thuế suất thuế GTGT trong 6 tháng đầu năm 2025 (từ 01/01/2025 đến 30/06/2025). Khấu trừ áp dụng 8%, phương pháp tỷ lệ % doanh thu (Hộ kinh doanh) giảm 20% mức tỷ lệ %.',
    legalStatus: 'Active',
    effectiveDate: '2025-01-01',
    expirationDate: '2025-06-30',
    issuingAuthority: 'Quốc hội',
    docNumber: '174/2024/QH15',
    exactSpans: [INITIAL_EXACT_SPANS[8], INITIAL_EXACT_SPANS[9]]
  },
  {
    id: 'DOC_ND_180_2024',
    label: 'Nghị định 180/2024/NĐ-CP',
    layer: 'REGULATORY',
    subType: 'DECREE',
    title: 'Nghị định 180/2024/NĐ-CP Hướng dẫn giảm thuế GTGT theo NQ 174/2024/QH15',
    summary: 'Quy định chi tiết 2 luồng xuất hóa đơn giảm thuế: Doanh nghiệp ghi thuế suất 8%; Hộ kinh doanh ghi Thành tiền trước giảm, Cộng tiền sau giảm 20% tỷ lệ % và ghi chú bắt buộc.',
    legalStatus: 'Superseded',
    effectiveDate: '2025-01-01',
    expirationDate: '2025-06-30',
    issuingAuthority: 'Chính phủ',
    docNumber: '180/2024/NĐ-CP',
    exactSpans: [INITIAL_EXACT_SPANS[8], INITIAL_EXACT_SPANS[9]]
  },
  {
    id: 'DOC_NQ_204_2025',
    label: 'Nghị quyết 204/2025/QH15',
    layer: 'REGULATORY',
    subType: 'LAW',
    title: 'Nghị quyết số 204/2025/QH15 Kỳ họp thứ 9 Quốc hội khóa XV',
    summary: 'Tiếp tục giảm 2% thuế suất thuế GTGT từ 01/07/2025 đến hết 31/12/2026, mở rộng đối tượng và lược bỏ danh mục loại trừ.',
    legalStatus: 'Active',
    effectiveDate: '2025-07-01',
    expirationDate: '2026-12-31',
    issuingAuthority: 'Quốc hội',
    docNumber: '204/2025/QH15',
    exactSpans: [INITIAL_EXACT_SPANS[10]]
  },
  {
    id: 'DOC_ND_174_2025',
    label: 'Nghị định 174/2025/NĐ-CP',
    layer: 'REGULATORY',
    subType: 'DECREE',
    title: 'Nghị định 174/2025/NĐ-CP Hướng dẫn giảm thuế GTGT theo NQ 204/2025/QH15',
    summary: 'Thay thế Nghị định 180/2024/NĐ-CP từ ngày 01/07/2025. Hướng dẫn lập hóa đơn 8% và hóa đơn bán hàng hộ kinh doanh ghi chú theo NQ 204.',
    legalStatus: 'Active',
    effectiveDate: '2025-07-01',
    expirationDate: '2026-12-31',
    issuingAuthority: 'Chính phủ',
    docNumber: '174/2025/NĐ-CP',
    exactSpans: [INITIAL_EXACT_SPANS[10]]
  },

  // Layer 2: Tax Lifecycle
  {
    id: 'LIFE_FINALIZATION',
    label: 'Quyết toán thuế (FINALIZATION)',
    layer: 'TAX_LIFECYCLE',
    subType: 'FINALIZATION',
    title: 'Quyết toán thuế TNDN hàng năm',
    summary: 'Thời hạn chậm nhất là ngày cuối cùng của tháng thứ 3 kể từ ngày kết thúc năm dương lịch hoặc năm tài chính.'
  },
  {
    id: 'LIFE_DECLARATION_VAT',
    label: 'Kê khai thuế GTGT (DECLARATION)',
    layer: 'TAX_LIFECYCLE',
    subType: 'DECLARATION',
    title: 'Kê khai thuế GTGT theo tháng hoặc quý',
    summary: 'Tờ khai 01/GTGT, kê khai khấu trừ thuế đầu vào phát sinh trong kỳ.'
  },
  {
    id: 'LIFE_AUDIT_INSPECTION',
    label: 'Thanh kiểm tra thuế (AUDIT_INSPECTION)',
    layer: 'TAX_LIFECYCLE',
    subType: 'AUDIT_INSPECTION',
    title: 'Thanh tra - Kiểm tra thuế tại trụ sở người nộp thuế',
    summary: 'Rà soát chứng từ gốc, ủy nhiệm chi, hợp đồng, hồ sơ xác định giá giao dịch liên kết Local File/Master File.'
  },
  {
    id: 'LIFE_PENALTY',
    label: 'Xử phạt vi phạm thuế (PENALTY)',
    layer: 'TAX_LIFECYCLE',
    subType: 'PENALTY',
    title: 'Chế tài xử phạt thuế',
    summary: 'Phạt khai sai 20%, tiền chậm nộp 0.03%/ngày, truy thu thuế.'
  },

  // Layer 3: Compliance & Calculation
  {
    id: 'CONCEPT_INTEREST_CAP_30',
    label: 'Mức trần chi phí lãi vay 30% EBITDA',
    layer: 'COMPLIANCE_CALCULATION',
    subType: 'TAX_CONCEPT',
    title: 'Khống chế lãi vay thuần 30% EBITDA trong giao dịch liên kết',
    summary: 'Chi phí lãi vay ròng = Chi phí lãi vay - Lãi tiền gửi/cho vay <= 30% EBITDA.',
    formula: 'Net_Interest_Cap = 0.30 * (Net_Profit + Net_Interest + Depreciation)',
    riskLevel: 'High'
  },
  {
    id: 'CONCEPT_INDEPENDENT_BANK_EXEMPTION',
    label: 'Ngoại lệ vay NHTM độc lập (NĐ 320/2025)',
    layer: 'COMPLIANCE_CALCULATION',
    subType: 'EXEMPTION',
    title: 'Loại trừ khoản vay ngân hàng độc lập khỏi mức trần 30% EBITDA',
    summary: 'Áp dụng từ 01/04/2025 theo NĐ 320/2025 khi ngân hàng độc lập, không phải bên liên kết.',
    riskLevel: 'Low'
  },
  {
    id: 'CONCEPT_NON_CASH_CONDITION',
    label: 'Điều kiện thanh toán không dùng tiền mặt >= 20tr',
    layer: 'COMPLIANCE_CALCULATION',
    subType: 'TAX_CONCEPT',
    title: 'Chứng từ thanh toán qua ngân hàng đối với hóa đơn từ 20 triệu',
    summary: 'Hóa đơn từng lần >= 20 triệu (gồm VAT) phải có UNC chuyển khoản từ TK người mua sang TK người bán đã đăng ký với CQT.',
    riskLevel: 'Critical'
  },
  {
    id: 'CONCEPT_IMPORT_VAT_DEDUCTION',
    label: 'Khấu trừ thuế GTGT khâu nhập khẩu',
    layer: 'COMPLIANCE_CALCULATION',
    subType: 'TAX_CONCEPT',
    title: 'Điều kiện khấu trừ thuế GTGT nộp ngân sách khâu nhập khẩu',
    summary: 'Phải có chứng từ nộp thuế vào NSNN thực tế tại Kho bạc trước thời điểm kê khai.',
    riskLevel: 'Medium'
  },
  {
    id: 'CONCEPT_VAT_ALLOCATION',
    label: 'Tỷ lệ phân bổ GTGT đầu vào dùng chung',
    layer: 'COMPLIANCE_CALCULATION',
    subType: 'FORMULA',
    title: 'Công thức phân bổ thuế GTGT đầu vào cho hoạt động chịu thuế và không chịu thuế',
    summary: 'Số thuế GTGT được khấu trừ = GTGT đầu vào dùng chung * (Doanh thu chịu thuế / Tổng doanh thu).',
    formula: 'VAT_Deductible = VAT_In_Shared * (Revenue_Taxable / Total_Revenue)'
  },
  {
    id: 'CONCEPT_VAT_REDUCTION_8_PERCENT',
    label: 'Giảm thuế suất GTGT xuống 8% (PP Khấu trừ)',
    layer: 'COMPLIANCE_CALCULATION',
    subType: 'TAX_CONCEPT',
    title: 'Chính sách giảm thuế GTGT áp dụng thuế suất 8% cho Doanh nghiệp',
    summary: 'Áp dụng cho hàng hóa, dịch vụ đang áp dụng thuế suất 10% (trừ một số ngành loại trừ). Khi xuất hóa đơn GTGT ghi rõ 8% tại dòng thuế suất.',
    formula: 'VAT_Amount = Pre_Tax_Price * 8%',
    riskLevel: 'Medium'
  },
  {
    id: 'CONCEPT_VAT_REDUCTION_20_PCT_DIRECT',
    label: 'Giảm 20% tỷ lệ % tính thuế GTGT (Hộ kinh doanh)',
    layer: 'COMPLIANCE_CALCULATION',
    subType: 'FORMULA',
    title: 'Giảm 20% mức tỷ lệ % tính thuế GTGT cho cơ sở tính theo doanh thu',
    summary: 'Hộ, cá nhân kinh doanh giảm 20% mức tỷ lệ % của ngành nghề. Cột Thành tiền ghi giá trước giảm, Cộng tiền ghi giá đã giảm 20% tỷ lệ % và ghi chú bắt buộc.',
    formula: 'Actual_Collected = Pre_Discount_Price - (Pre_Discount_Price * Industry_VAT_Rate * 20%)',
    riskLevel: 'High'
  },

  // Layer 4: The Bridge
  {
    id: 'EVENT_PAY_INTEREST',
    label: 'Nghiệp vụ chi trả lãi vay',
    layer: 'THE_BRIDGE',
    subType: 'CANONICAL_BUSINESS_EVENT',
    title: 'EVENT_PAY_INTEREST',
    summary: 'Doanh nghiệp thanh toán hoặc trích trước chi phí lãi vay vốn vay phục vụ hoạt động sản xuất kinh doanh.',
    businessEventCode: 'EVENT_PAY_INTEREST'
  },
  {
    id: 'EVENT_AFFILIATED_LOAN',
    label: 'Nghiệp vụ vay vốn có giao dịch liên kết',
    layer: 'THE_BRIDGE',
    subType: 'CANONICAL_BUSINESS_EVENT',
    title: 'EVENT_AFFILIATED_LOAN',
    summary: 'Vay vốn công ty mẹ, công ty thành viên hoặc cá nhân điều hành thuộc phạm vi Nghị định GDLK.',
    businessEventCode: 'EVENT_AFFILIATED_LOAN'
  },
  {
    id: 'EVENT_IMPORT_GOODS',
    label: 'Nghiệp vụ nhập khẩu hàng hóa',
    layer: 'THE_BRIDGE',
    subType: 'CANONICAL_BUSINESS_EVENT',
    title: 'EVENT_IMPORT_GOODS',
    summary: 'Mua nguyên vật liệu, hàng hóa, TSCĐ nhập khẩu qua tờ khai hải quan và nộp thuế GTGT khâu nhập khẩu.',
    businessEventCode: 'EVENT_IMPORT_GOODS'
  },
  {
    id: 'EVENT_CASH_EXPENSE_OVER_20M',
    label: 'Nghiệp vụ mua hàng hóa dịch vụ >= 20 triệu',
    layer: 'THE_BRIDGE',
    subType: 'CANONICAL_BUSINESS_EVENT',
    title: 'EVENT_CASH_EXPENSE_OVER_20M',
    summary: 'Phát sinh hóa đơn mua hàng có tổng giá trị thanh toán từ 20 triệu đồng trở lên.',
    businessEventCode: 'EVENT_CASH_EXPENSE_OVER_20M'
  },
  {
    id: 'EVENT_ISSUE_INVOICE_VAT_REDUCTION_DEDUCTION',
    label: 'Xuất hóa đơn GTGT giảm 8% (PP Khấu trừ)',
    layer: 'THE_BRIDGE',
    subType: 'CANONICAL_BUSINESS_EVENT',
    title: 'EVENT_ISSUE_INVOICE_VAT_REDUCTION_DEDUCTION',
    summary: 'Doanh nghiệp xuất hóa đơn GTGT ghi rõ mức thuế suất 8% theo NQ 174/2024 hoặc NQ 204/2025.',
    businessEventCode: 'EVENT_ISSUE_INVOICE_VAT_REDUCTION_DEDUCTION'
  },
  {
    id: 'EVENT_ISSUE_INVOICE_VAT_REDUCTION_DIRECT_HOUSEHOLD',
    label: 'Xuất hóa đơn bán hàng giảm 20% tỷ lệ % (Hộ KD)',
    layer: 'THE_BRIDGE',
    subType: 'CANONICAL_BUSINESS_EVENT',
    title: 'EVENT_ISSUE_INVOICE_VAT_REDUCTION_DIRECT_HOUSEHOLD',
    summary: 'Hộ/Cá nhân kinh doanh xuất hóa đơn bán hàng: Thành tiền ghi giá trước giảm, Cộng tiền ghi giá đã giảm 20% tỷ lệ % và ghi chú bắt buộc.',
    businessEventCode: 'EVENT_ISSUE_INVOICE_VAT_REDUCTION_DIRECT_HOUSEHOLD'
  },
  {
    id: 'ACC_TK_635',
    label: 'TK 635 - Chi phí tài chính',
    layer: 'THE_BRIDGE',
    subType: 'ACCOUNTING_CONCEPT',
    title: 'Tài khoản 635 (Chi phí lãi vay)',
    summary: 'Hạch toán chi phí lãi vay, chiết khấu thanh toán theo Thông tư 200/2014/TT-BTC.',
    accountCode: 'TK_635'
  },
  {
    id: 'ACC_TK_1331',
    label: 'TK 1331 - Thuế GTGT được khấu trừ của HHDV',
    layer: 'THE_BRIDGE',
    subType: 'ACCOUNTING_CONCEPT',
    title: 'Tài khoản 1331 (Thuế GTGT được khấu trừ)',
    summary: 'Phản ánh số thuế GTGT đầu vào đủ điều kiện khấu trừ.',
    accountCode: 'TK_1331'
  },
  {
    id: 'ACC_TK_3331',
    label: 'TK 3331 - Thuế GTGT phải nộp',
    layer: 'THE_BRIDGE',
    subType: 'ACCOUNTING_CONCEPT',
    title: 'Tài khoản 3331 (Thuế GTGT đầu ra & khâu nhập khẩu)',
    summary: 'Thuế GTGT đầu ra phải nộp và nghĩa vụ thuế GTGT hàng nhập khẩu (TK 33312).',
    accountCode: 'TK_3331'
  },
  {
    id: 'ACC_TK_511',
    label: 'TK 511 - Doanh thu bán hàng & cung cấp dịch vụ',
    layer: 'THE_BRIDGE',
    subType: 'ACCOUNTING_CONCEPT',
    title: 'Tài khoản 511 (Doanh thu)',
    summary: 'Ghi nhận doanh thu bán hàng hóa dịch vụ theo giá chưa có thuế GTGT (đối với phương pháp khấu trừ).',
    accountCode: 'TK_511'
  },
  {
    id: 'ACC_HKD_REVENUE',
    label: 'Doanh thu Hộ KD (Sổ mẫu S1-HKD)',
    layer: 'THE_BRIDGE',
    subType: 'ACCOUNTING_CONCEPT',
    title: 'Sổ doanh thu tính thuế Hộ kinh doanh (Mẫu S1-HKD)',
    summary: 'Theo dõi doanh thu bán hàng hóa dịch vụ thực tế thu về sau khi đã trừ số tiền thuế GTGT giảm 20% mức tỷ lệ %.',
    accountCode: 'DOANH_THU_HKD'
  },
  {
    id: 'ACC_TK_111',
    label: 'TK 111 - Tiền mặt tại quỹ',
    layer: 'THE_BRIDGE',
    subType: 'ACCOUNTING_CONCEPT',
    title: 'Tài khoản 111 (Tiền mặt)',
    summary: 'Nếu thanh toán hóa đơn >= 20tr bằng TK 111 sẽ mất quyền khấu trừ thuế GTGT và bị loại chi phí được trừ TNDN.',
    accountCode: 'TK_111'
  },
  {
    id: 'ACC_TK_112',
    label: 'TK 112 - Tiền gửi ngân hàng',
    layer: 'THE_BRIDGE',
    subType: 'ACCOUNTING_CONCEPT',
    title: 'Tài khoản 112 (Tiền gửi ngân hàng)',
    summary: 'Ủy nhiệm chi qua TK 112 là chứng từ thanh toán không dùng tiền mặt bắt buộc.',
    accountCode: 'TK_112'
  },

  // Layer 5: Assessment & Service
  {
    id: 'LO_TAX_CIT_INTEREST_30_001',
    label: 'TAX_LO_CIT_INTEREST_30_001',
    layer: 'ASSESSMENT_SERVICE',
    subType: 'ATOMIC_LO',
    title: 'Bóc tách chi phí lãi vay vượt trần 30% EBITDA & Chuyển lỗ lãi vay 5 năm',
    summary: 'Học viên CPA xác định đúng phần lãi vay không được trừ, ghi nhận chỉ tiêu B4 trên Tờ khai QTT TNDN (Mẫu 03/TNDN) và theo dõi chuyển lãi vay 5 năm.',
    loId: 'TAX_LO_CIT_INTEREST_30_001',
    examTrapWarning: 'BẪY CPA: Đề thi thường cho doanh nghiệp có cả lãi tiền gửi và lãi cho vay, học viên hay quên tính chi phí lãi vay THUẦN (Lãi vay - Lãi gửi), dẫn đến tính sai EBITDA và mức khống chế 30%!'
  },
  {
    id: 'LO_TAX_VAT_INPUT_DEDUCTION_002',
    label: 'TAX_LO_VAT_INPUT_DEDUCTION_002',
    layer: 'ASSESSMENT_SERVICE',
    subType: 'ATOMIC_LO',
    title: 'Xử lý hóa đơn >= 20 triệu và điều kiện thanh toán không dùng tiền mặt',
    summary: 'Điều kiện khấu trừ thuế GTGT và tính chi phí được trừ TNDN khi mua hàng trả chậm hoặc bù trừ công nợ.',
    loId: 'TAX_LO_VAT_INPUT_DEDUCTION_002',
    examTrapWarning: 'BẪY CPA: Mua hàng trả chậm chưa đến hạn thanh toán theo hợp đồng thì vẫn ĐƯỢC khấu trừ trong kỳ. Nhưng đến hạn nếu thanh toán tiền mặt thì phải kê khai điều chỉnh giảm thuế GTGT đã khấu trừ!'
  },
  {
    id: 'LO_TAX_VAT_IMPORT_ALLOCATION_003',
    label: 'TAX_LO_VAT_IMPORT_ALLOCATION_003',
    layer: 'ASSESSMENT_SERVICE',
    subType: 'ATOMIC_LO',
    title: 'Khấu trừ thuế GTGT khâu nhập khẩu & Phân bổ doanh thu hỗn hợp',
    summary: 'Xác định thời điểm được khấu trừ thuế GTGT khâu nhập khẩu và phân bổ số thuế dùng chung theo Luật 48/2024/QH15.',
    loId: 'TAX_LO_VAT_IMPORT_ALLOCATION_003',
    examTrapWarning: 'BẪY CPA: Tờ khai hải quan thông quan trong kỳ nhưng nếu chưa thực nộp tiền thuế GTGT vào NSNN thì KHÔNG ĐƯỢC khấu trừ ở kỳ đó!'
  },
  {
    id: 'LO_TAX_VAT_REDUCTION_DEDUCTION_001',
    label: 'TAX_LO_VAT_REDUCTION_DEDUCTION_001',
    layer: 'ASSESSMENT_SERVICE',
    subType: 'ATOMIC_LO',
    title: 'Lập hóa đơn GTGT thuế suất 8% cho Doanh nghiệp phương pháp khấu trừ',
    summary: 'Kê khai chỉ tiêu hàng hóa áp dụng thuế suất 8% trên Phụ lục giảm thuế GTGT (Mẫu 01/GTGT) và xuất hóa đơn ghi đúng dòng thuế suất 8%.',
    loId: 'TAX_LO_VAT_REDUCTION_DEDUCTION_001',
    examTrapWarning: 'BẪY CPA: Hàng hóa dịch vụ thuộc diện giảm thuế nhưng doanh nghiệp lại ghi thuế suất 10% thì người bán vẫn phải nộp 10%, còn người mua chỉ được khấu trừ 8% hoặc bị ách tắc hóa đơn!'
  },
  {
    id: 'LO_TAX_VAT_REDUCTION_HOUSEHOLD_002',
    label: 'TAX_LO_VAT_REDUCTION_HOUSEHOLD_002',
    layer: 'ASSESSMENT_SERVICE',
    subType: 'ATOMIC_LO',
    title: 'Quy tắc lập hóa đơn bán hàng Hộ KD: Thành tiền trước giảm, Cộng tiền sau giảm',
    summary: 'Hộ, cá nhân kinh doanh tính thuế theo tỷ lệ % doanh thu: Dòng Thành tiền ghi giá trước giảm; Dòng Cộng tiền hàng hóa dịch vụ ghi giá đã giảm 20% mức tỷ lệ %; Dòng ghi chú bắt buộc ghi nhận số tiền đã giảm theo Nghị quyết của Quốc hội.',
    loId: 'TAX_LO_VAT_REDUCTION_HOUSEHOLD_002',
    examTrapWarning: 'BẪY CPA: Hộ kinh doanh không có dòng thuế suất 8% trên hóa đơn bán hàng! Nếu ghi sai thuế suất 8% là sai loại hóa đơn. Bắt buộc phải giảm trực tiếp 20% mức tỷ lệ % và ghi chú rõ ràng theo công thức: Số tiền giảm = Giá trước giảm x Tỷ lệ % ngành x 20%.'
  },
  {
    id: 'LO_TAX_VAT_INVOICE_NOTE_003',
    label: 'TAX_LO_VAT_INVOICE_NOTE_003',
    layer: 'ASSESSMENT_SERVICE',
    subType: 'ATOMIC_LO',
    title: 'Quy định câu ghi chú bắt buộc trên hóa đơn bán hàng giảm thuế GTGT',
    summary: 'Dòng ghi chú trên hóa đơn bán hàng phải ghi: "Đã giảm... (số tiền) tương ứng 20% mức tỷ lệ % để tính thuế GTGT theo Nghị quyết số 174/2024/QH15" (hoặc NQ 204/2025/QH15).',
    loId: 'TAX_LO_VAT_INVOICE_NOTE_003',
    examTrapWarning: 'BẪY THỰC TẾ: Nếu thiếu câu ghi chú hoặc ghi sai số tiền giảm, hóa đơn bán hàng có thể bị cơ quan thuế xử phạt vi phạm hành vi lập hóa đơn không đúng quy định!'
  },
  {
    id: 'RISK_EXPENSE_DISALLOWANCE',
    label: 'Rủi ro loại trừ chi phí & Truy thu thuế',
    layer: 'ASSESSMENT_SERVICE',
    subType: 'RISK_REF',
    title: 'Truy thu thuế TNDN 20% + Phạt khai sai 20% + Tiền chậm nộp 0.03%/ngày',
    summary: 'Rủi ro pháp lý tài chính khi bị cơ quan thuế bóc tách chi phí trong đợt thanh tra quyết toán.',
    riskLevel: 'Critical'
  }
];

export const INITIAL_EDGES: GraphEdge[] = [
  // Versioning relationships
  { id: 'E_ND20_REPLACES_ND132', source: 'DOC_ND_20_2025', target: 'DOC_ND_132_2020', type: 'REPLACES', description: 'Thay thế quy định trần lãi vay cũ' },
  { id: 'E_ND320_AMENDS_ND20', source: 'DOC_ND_320_2025', target: 'DOC_ND_20_2025', type: 'AMENDS', description: 'Bổ sung ngoại lệ ngân hàng độc lập' },
  { id: 'E_ND174_REPLACES_ND180', source: 'DOC_ND_174_2025', target: 'DOC_ND_180_2024', type: 'REPLACES', description: 'Thay thế quy định giảm thuế cũ từ 01/07/2025' },
  { id: 'E_ND180_IMPLEMENTS_NQ174', source: 'DOC_ND_180_2024', target: 'DOC_NQ_174_2024', type: 'IMPLEMENTS', description: 'Hướng dẫn thi hành NQ 174/2024' },
  { id: 'E_ND174_IMPLEMENTS_NQ204', source: 'DOC_ND_174_2025', target: 'DOC_NQ_204_2025', type: 'IMPLEMENTS', description: 'Hướng dẫn thi hành NQ 204/2025' },
  
  // Regulatory -> Concepts
  { id: 'E_ND20_DEFINES_CAP', source: 'DOC_ND_20_2025', target: 'CONCEPT_INTEREST_CAP_30', type: 'DEFINES_CONCEPT' },
  { id: 'E_ND320_DEFINES_EXEMPTION', source: 'DOC_ND_320_2025', target: 'CONCEPT_INDEPENDENT_BANK_EXEMPTION', type: 'DEFINES_CONCEPT' },
  { id: 'E_TT78_DEFINES_NON_CASH', source: 'DOC_TT_78_2014', target: 'CONCEPT_NON_CASH_CONDITION', type: 'DEFINES_CONCEPT' },
  { id: 'E_LUAT48_DEFINES_IMPORT_VAT', source: 'DOC_LUAT_GTGT_48_2024', target: 'CONCEPT_IMPORT_VAT_DEDUCTION', type: 'DEFINES_CONCEPT' },
  { id: 'E_LUAT48_DEFINES_ALLOCATION', source: 'DOC_LUAT_GTGT_48_2024', target: 'CONCEPT_VAT_ALLOCATION', type: 'DEFINES_CONCEPT' },
  { id: 'E_ND180_DEFINES_8PCT', source: 'DOC_ND_180_2024', target: 'CONCEPT_VAT_REDUCTION_8_PERCENT', type: 'DEFINES_CONCEPT' },
  { id: 'E_ND180_DEFINES_20PCT', source: 'DOC_ND_180_2024', target: 'CONCEPT_VAT_REDUCTION_20_PCT_DIRECT', type: 'DEFINES_CONCEPT' },
  { id: 'E_ND174_DEFINES_8PCT', source: 'DOC_ND_174_2025', target: 'CONCEPT_VAT_REDUCTION_8_PERCENT', type: 'DEFINES_CONCEPT' },
  { id: 'E_ND174_DEFINES_20PCT', source: 'DOC_ND_174_2025', target: 'CONCEPT_VAT_REDUCTION_20_PCT_DIRECT', type: 'DEFINES_CONCEPT' },
  { id: 'E_LUAT38_GOVERNS_PENALTY', source: 'DOC_LUAT_QLT_38_2019', target: 'LIFE_PENALTY', type: 'GOVERNS' },

  // Concepts -> Business Events
  { id: 'E_CAP_MAPS_EVENT', source: 'CONCEPT_INTEREST_CAP_30', target: 'EVENT_PAY_INTEREST', type: 'MAPS_TO_EVENT' },
  { id: 'E_EXEMPT_MAPS_EVENT', source: 'CONCEPT_INDEPENDENT_BANK_EXEMPTION', target: 'EVENT_AFFILIATED_LOAN', type: 'MAPS_TO_EVENT' },
  { id: 'E_NON_CASH_MAPS_EVENT', source: 'CONCEPT_NON_CASH_CONDITION', target: 'EVENT_CASH_EXPENSE_OVER_20M', type: 'MAPS_TO_EVENT' },
  { id: 'E_IMPORT_MAPS_EVENT', source: 'CONCEPT_IMPORT_VAT_DEDUCTION', target: 'EVENT_IMPORT_GOODS', type: 'MAPS_TO_EVENT' },
  { id: 'E_REDUCTION_8PCT_MAPS_EVENT', source: 'CONCEPT_VAT_REDUCTION_8_PERCENT', target: 'EVENT_ISSUE_INVOICE_VAT_REDUCTION_DEDUCTION', type: 'MAPS_TO_EVENT' },
  { id: 'E_REDUCTION_20PCT_MAPS_EVENT', source: 'CONCEPT_VAT_REDUCTION_20_PCT_DIRECT', target: 'EVENT_ISSUE_INVOICE_VAT_REDUCTION_DIRECT_HOUSEHOLD', type: 'MAPS_TO_EVENT' },

  // Business Events -> Accounting Accounts
  { id: 'E_EVENT_PAY_INTEREST_TK635', source: 'EVENT_PAY_INTEREST', target: 'ACC_TK_635', type: 'MAPS_TO_ACCOUNT' },
  { id: 'E_EVENT_AFFILIATED_LOAN_TK635', source: 'EVENT_AFFILIATED_LOAN', target: 'ACC_TK_635', type: 'MAPS_TO_ACCOUNT' },
  { id: 'E_EVENT_NON_CASH_TK112', source: 'EVENT_CASH_EXPENSE_OVER_20M', target: 'ACC_TK_112', type: 'MAPS_TO_ACCOUNT' },
  { id: 'E_EVENT_NON_CASH_TK111', source: 'EVENT_CASH_EXPENSE_OVER_20M', target: 'ACC_TK_111', type: 'MAPS_TO_ACCOUNT' },
  { id: 'E_EVENT_IMPORT_TK3331', source: 'EVENT_IMPORT_GOODS', target: 'ACC_TK_3331', type: 'MAPS_TO_ACCOUNT' },
  { id: 'E_EVENT_IMPORT_TK1331', source: 'EVENT_IMPORT_GOODS', target: 'ACC_TK_1331', type: 'MAPS_TO_ACCOUNT' },
  { id: 'E_EVENT_VAT8_TK511', source: 'EVENT_ISSUE_INVOICE_VAT_REDUCTION_DEDUCTION', target: 'ACC_TK_511', type: 'MAPS_TO_ACCOUNT' },
  { id: 'E_EVENT_VAT8_TK3331', source: 'EVENT_ISSUE_INVOICE_VAT_REDUCTION_DEDUCTION', target: 'ACC_TK_3331', type: 'MAPS_TO_ACCOUNT' },
  { id: 'E_EVENT_HKD_REVENUE', source: 'EVENT_ISSUE_INVOICE_VAT_REDUCTION_DIRECT_HOUSEHOLD', target: 'ACC_HKD_REVENUE', type: 'MAPS_TO_ACCOUNT' },

  // Concepts -> Lifecycle
  { id: 'E_INTEREST_TRIGGERS_FINALIZATION', source: 'CONCEPT_INTEREST_CAP_30', target: 'LIFE_FINALIZATION', type: 'TRIGGERS_LIFECYCLE' },
  { id: 'E_IMPORT_TRIGGERS_DECLARATION', source: 'CONCEPT_IMPORT_VAT_DEDUCTION', target: 'LIFE_DECLARATION_VAT', type: 'TRIGGERS_LIFECYCLE' },
  { id: 'E_REDUCTION_TRIGGERS_DECLARATION', source: 'CONCEPT_VAT_REDUCTION_8_PERCENT', target: 'LIFE_DECLARATION_VAT', type: 'TRIGGERS_LIFECYCLE' },

  // Assessment & Service
  { id: 'E_LO1_TESTS_CAP', source: 'LO_TAX_CIT_INTEREST_30_001', target: 'CONCEPT_INTEREST_CAP_30', type: 'TESTS_LO' },
  { id: 'E_LO2_TESTS_NON_CASH', source: 'LO_TAX_VAT_INPUT_DEDUCTION_002', target: 'CONCEPT_NON_CASH_CONDITION', type: 'TESTS_LO' },
  { id: 'E_LO3_TESTS_IMPORT', source: 'LO_TAX_VAT_IMPORT_ALLOCATION_003', target: 'CONCEPT_IMPORT_VAT_DEDUCTION', type: 'TESTS_LO' },
  { id: 'E_LO_VAT_DEDUCTION_TESTS', source: 'LO_TAX_VAT_REDUCTION_DEDUCTION_001', target: 'CONCEPT_VAT_REDUCTION_8_PERCENT', type: 'TESTS_LO' },
  { id: 'E_LO_VAT_HOUSEHOLD_TESTS', source: 'LO_TAX_VAT_REDUCTION_HOUSEHOLD_002', target: 'CONCEPT_VAT_REDUCTION_20_PCT_DIRECT', type: 'TESTS_LO' },
  { id: 'E_LO_VAT_NOTE_TESTS', source: 'LO_TAX_VAT_INVOICE_NOTE_003', target: 'CONCEPT_VAT_REDUCTION_20_PCT_DIRECT', type: 'TESTS_LO' },
  { id: 'E_CAP_EVALUATES_RISK', source: 'CONCEPT_INTEREST_CAP_30', target: 'RISK_EXPENSE_DISALLOWANCE', type: 'EVALUATES_RISK' },
  { id: 'E_NON_CASH_EVALUATES_RISK', source: 'CONCEPT_NON_CASH_CONDITION', target: 'RISK_EXPENSE_DISALLOWANCE', type: 'EVALUATES_RISK' }
];

export const GOLDEN_SET_TEST_CASES: GoldenSetTestCase[] = [
  {
    id: 'TEST_GOLDEN_01',
    name: 'Test 1 (TNDN & Giao dịch liên kết)',
    category: 'CIT_TRANSFER_PRICING',
    description: 'Lãi vay ngân hàng thương mại độc lập theo NĐ 20/2025/NĐ-CP & NĐ 320/2025/NĐ-CP',
    query: 'Năm 2025 công ty tôi có phát sinh giao dịch liên kết bán hàng cho công ty mẹ. Công ty có vay 100 tỷ từ Ngân hàng TMCP Ngoại thương (Vietcombank) với lãi suất thị trường, Vietcombank không nắm giữ cổ phần và không tham gia điều hành công ty. Chi phí lãi vay trả cho Vietcombank năm 2025 có bị khống chế mức trần 30% EBITDA không?',
    transactionDate: '2025-06-15',
    inputConditions: {
      hasAffiliatedTransaction: true,
      lenderType: 'INDEPENDENT_COMMERCIAL_BANK',
      lenderName: 'Vietcombank',
      isLenderRelatedParty: false,
      standardCreditAppraisal: true
    },
    expectedTriState: 'QUALIFIED_ANSWER',
    expectedCitations: ['NĐ 320/2025/NĐ-CP', 'NĐ 20/2025/NĐ-CP'],
    expectedRuleOutcome: 'Được loại trừ khỏi phạm vi khống chế 30% EBITDA theo quy định tại Điểm c Khoản 3 Điều 16 NĐ 20/2025/NĐ-CP sửa đổi bởi NĐ 320/2025/NĐ-CP.'
  },
  {
    id: 'TEST_GOLDEN_02',
    name: 'Test 2 (GTGT & Nhập khẩu)',
    category: 'VAT_IMPORT_ALLOCATION',
    description: 'Khấu trừ thuế GTGT khâu nhập khẩu và tỷ lệ phân bổ dùng chung theo Luật 48/2024/QH15',
    query: 'Tháng 8/2025 doanh nghiệp nhập khẩu 1 lô máy móc thiết bị dùng chung cho cả sản xuất sản phẩm phần mềm (không chịu thuế GTGT) và dịch vụ tư vấn CNTT (chịu thuế GTGT 10%). Tờ khai hải quan thông quan ngày 20/8/2025, tiền thuế GTGT nhập khẩu 200 triệu đã nộp vào Kho bạc Nhà nước ngày 25/8/2025. Doanh thu chịu thuế kỳ này là 6 tỷ, doanh thu không chịu thuế là 4 tỷ. Thuế GTGT khâu nhập khẩu được khấu trừ bao nhiêu theo Luật 48/2024/QH15?',
    transactionDate: '2025-08-30',
    inputConditions: {
      importVatPaidToTreasury: true,
      sharedUsage: true,
      taxableRevenue: 6000000000,
      nonTaxableRevenue: 4000000000,
      totalVatImport: 200000000
    },
    expectedTriState: 'QUALIFIED_ANSWER',
    expectedCitations: ['Luật 48/2024/QH15'],
    expectedRuleOutcome: 'Chứng từ nộp thuế đã hợp lệ. Số thuế GTGT được khấu trừ phân bổ theo tỷ lệ 6 tỷ / 10 tỷ = 60%, tương ứng 120.000.000 VNĐ.'
  },
  {
    id: 'TEST_GOLDEN_03',
    name: 'Test 3 (Safe Abstention Test)',
    category: 'SAFE_ABSTENTION',
    description: 'Xử lý hóa đơn >= 20 triệu khi chưa làm rõ chứng từ thanh toán không dùng tiền mặt',
    query: 'Công ty nhận hóa đơn mua dịch vụ tiếp khách trị giá 25 triệu đồng ngày 10/10/2025. Hóa đơn điện tử có mã của cơ quan thuế hợp lệ và đúng tên, mã số thuế công ty. Khoản này có được tính vào chi phí được trừ và khấu trừ thuế GTGT không?',
    transactionDate: '2025-10-15',
    inputConditions: {
      invoiceAmount: 25000000,
      hasValidInvoice: true,
      hasNonCashPaymentVoucher: undefined // THIẾU DỮ KIỆN!
    },
    expectedTriState: 'CONDITIONAL_ANSWER',
    expectedCitations: ['TT 78/2014/TT-BTC', 'Luật 48/2024/QH15'],
    expectedRuleOutcome: 'Safe Abstention kích hoạt: Chuyển sang luồng CONDITIONAL_ANSWER và phân tách rõ 2 trường hợp: Nếu có UNC chuyển khoản ngân hàng -> ĐƯỢC trừ & khấu trừ; Nếu thanh toán bằng tiền mặt -> BỊ LOẠI chi phí và không được khấu trừ.'
  },
  {
    id: 'TEST_GOLDEN_04',
    name: 'Test 4 (Giảm thuế GTGT Hộ kinh doanh & Lập hóa đơn)',
    category: 'VAT_IMPORT_ALLOCATION',
    description: 'Quy tắc lập hóa đơn bán hàng giảm 20% tỷ lệ % theo Nghị quyết 174/2024/QH15 và NĐ 180/2024/NĐ-CP',
    query: 'Hộ kinh doanh dịch vụ vận tải hành khách tính thuế GTGT theo phương pháp tỷ lệ % trên doanh thu (tỷ lệ 3%). Tháng 3/2025 hộ kinh doanh bán vé xe với giá niêm yết 450.000 đồng thuộc diện được giảm thuế GTGT theo Nghị quyết 174/2024/QH15. Hãy hướng dẫn cách ghi các dòng chỉ tiêu trên hóa đơn bán hàng và tính số tiền thực tế thu về của khách hàng?',
    transactionDate: '2025-03-20',
    inputConditions: {
      businessType: 'HOUSEHOLD_BUSINESS',
      taxMethod: 'DIRECT_PERCENTAGE_OF_REVENUE',
      industryVatRate: 0.03,
      preDiscountPrice: 450000,
      vatReductionPolicy: 'NQ_174_2024_QH15'
    },
    expectedTriState: 'QUALIFIED_ANSWER',
    expectedCitations: ['NĐ 180/2024/NĐ-CP', 'NQ 174/2024/QH15'],
    expectedRuleOutcome: 'Lập hóa đơn bán hàng theo quy định: Dòng "Thành tiền" ghi 450.000 đồng; Tiền thuế giảm = 450.000 x 3% x 20% = 2.700 đồng; Dòng "Cộng tiền hàng hóa, dịch vụ" ghi 447.300 đồng; Ghi chú bắt buộc: "Đã giảm 2.700 đồng tương ứng 20% mức tỷ lệ % để tính thuế GTGT theo Nghị quyết số 174/2024/QH15".'
  }
];
