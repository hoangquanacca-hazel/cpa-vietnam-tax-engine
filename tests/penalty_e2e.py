"""E2E for the penalty tab. Prereq: `npm run build && npx vite preview --port 4173`; pip install playwright.
Expected values are computed by hand (see tests/penaltyCalc.test.ts)."""
import re, sys
from playwright.sync_api import sync_playwright

URL = sys.argv[1] if len(sys.argv) > 1 else 'http://localhost:4173/'
num = lambda t: int(re.sub(r'\D', '', t))

with sync_playwright() as p:
    b = p.chromium.launch(executable_path='/opt/pw-browsers/chromium')
    errs = []
    for w, h in [(1440, 900), (390, 844)]:
        pg = b.new_page(viewport={'width': w, 'height': h})
        pg.on('pageerror', lambda e: errs.append(str(e)))
        pg.goto(URL); pg.get_by_text('Checklist Mức phạt Thuế').click(); pg.wait_for_selector('li input[type=checkbox]')
        d = pg.evaluate("({sw:document.documentElement.scrollWidth,cw:document.documentElement.clientWidth})")
        assert d['sw'] <= d['cw'], f'horizontal scroll at {w}px: {d}'
        if w == 390:
            continue
        bw = pg.locator('aside').bounding_box()['width'] / w
        assert 0.30 <= bw <= 0.40, f'summary panel share {bw:.2f}'
        pg.locator('input[type=date]').fill('2026-02-01')
        aside = pg.locator('aside')
        pg.get_by_label('Nhóm hành vi').select_option(label='Nộp hồ sơ khai thuế chậm / không nộp')
        pg.get_by_label('Chọn Điều 13.3').check()
        pg.get_by_label('Nhóm hành vi').select_option(label='Khai sai dẫn đến thiếu thuế (phạt 20%)')
        pg.get_by_label('Chọn Điều 16.1.a').check()
        aside.get_by_placeholder('nhập số tiền').first.fill('500000000')
        txt = aside.inner_text()
        g = lambda lab: num(re.search(lab + r'\s*\n?\s*([\d\.]+) đ', txt).group(1))
        assert g(r'Tổng thấp nhất \(sàn\)') == 105_000_000
        assert g(r'Tổng cao nhất \(trần\)') == 108_000_000
        assert g(r'Tổng tạm tính tiền phạt') == 106_500_000
        aside.get_by_label('Số thuế truy thu / nộp bổ sung (đ)').fill('1000000000')
        aside.get_by_label('Số ngày chậm nộp thuế').fill('10')
        aside.get_by_label('Số ngày chậm nộp tiền phạt').fill('20')
        txt = aside.inner_text()
        assert g(r'Tổng ước tính phải nộp') == 1_110_565_000          # 106,5tr + 1 tỷ + 3tr + 1,065tr
        aside.get_by_label('Số tình tiết tăng nặng').fill('1')
        txt = aside.inner_text()
        assert g(r'Tổng tạm tính tiền phạt') == 107_150_000            # 13.3: 6,5tr x 1,1 ; 16.1.a: 100tr
        aside.get_by_label('Số tình tiết tăng nặng').fill('')
        pg.get_by_label('Nhóm hành vi').select_option(label='Nộp hồ sơ khai thuế chậm / không nộp')
        pg.get_by_label('Chọn Điều 13.2').check()
        aside.locator('li', has_text='Điều 13.2').get_by_placeholder('kiểm tra khung').fill('45')
        aside.get_by_role('button', name='chuyển sang Điều 13.3').click()
        assert aside.locator('li', has_text='Điều 13.2').count() == 0
        pg.get_by_label('Nhóm hành vi').select_option(label='Lập hóa đơn')
        pg.get_by_label('Chọn Điều 24.2.b').check()
        r = aside.locator('li', has_text='Điều 24.2.b')
        r.get_by_label('Nhóm').select_option('B'); r.get_by_placeholder('kiểm tra khung').fill('5')
        assert 'chuyển sang Điều 24.2.c' in r.inner_text()
        pg.get_by_label('Đối tượng').select_option(value='ca_nhan')
        txt = aside.inner_text()
        assert g(r'Tổng thấp nhất \(sàn\)') == 102_750_000            # 2,5tr + 100tr + 0,25tr (Điều 16 không chia đôi)
    assert not errs, errs
    print('E2E passed (layout 1440 + 390 no horizontal scroll; calculator assertions)')
    b.close()
