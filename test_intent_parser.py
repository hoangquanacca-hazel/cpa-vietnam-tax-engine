import sys
sys.stdout.reconfigure(encoding='utf-8')
from src.query_parser import parse_intent

print('=== BENCHMARK TEST SUITE ===')
cases = [
    ('chi phi lai vay giao dich lien ket nam 2025 chuyen ky sau nhu the nao', '2025-06-15', 'service', 'TC1: CIT EBITDA'),
    ('mua hang 25 trieu tai khoan ca nhan giam doc co duoc khau tru GTGT khong', '2025-10-01', 'service', 'TC2: VAT personal account'),
    ('bay thi TNCN phu cap trang phuc tien an ca quy du phong tien luong', '2025-01-01', 'learning', 'TC3: PIT exam traps'),
    ('lai vay ebitda giao dich lien ket 2025', '2025-06-15', 'service', 'TC1b: short CIT'),
    ('20 trieu tien mat tiep khach', '2025-10-01', 'service', 'TC4: VAT cash 20M'),
    ('ho kinh doanh ban ve xe 450000 giam thue GTGT', '2025-03-20', 'learning', 'TC5: VAT household'),
    ('khau hao tai san co dinh thang 2025', '2025-02-01', 'service', 'TC6: CIT depreciation'),
]

passed = 0
for q, d, m, label in cases:
    r = parse_intent(q, d, m)
    ok = r.primary_tax_type.value != 'OTHER'
    status = 'PASS' if ok else 'FAIL'
    if ok:
        passed += 1
    print(f'[{status}] {label}')
    print(f'       Tax: {r.primary_tax_type.value:6s} | Conf: {r.parse_confidence:.2f} | TriState: {r.tri_state_hint.value[:22]:22s}')
    print(f'       Events: {r.business_event_codes[:2]}')
    if r.missing_information:
        print(f'       Missing info: {r.missing_information}')
    print()

print(f'=== RESULT: {passed}/{len(cases)} PASSED ===')
