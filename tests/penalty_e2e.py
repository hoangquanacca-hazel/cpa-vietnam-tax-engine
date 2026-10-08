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
        # layout: filters live in the left column; the summary panel starts at the same height, top-right
        fb = pg.get_by_label('Lĩnh vực').bounding_box(); ab = pg.locator('aside').bounding_box()
        sb = pg.locator('section').first.bounding_box()
        assert fb['x'] + fb['width'] < ab['x'], 'filters must sit left of the summary panel'
        assert ab['y'] <= fb['y'], f"panel must start at/above the filter row: {ab['y']} vs {fb['y']}"
        assert abs((ab['y'] + ab['height']) - (sb['y'] + sb['height'])) <= 4, 'panel and list should end at the same height'
        # resizable panel: drag, clamp, keyboard, double-click reset, persistence
        aw = lambda: pg.locator('aside').bounding_box()['width']
        w0 = aw(); hb = pg.get_by_role('separator').bounding_box(); cx, cy = hb['x'] + hb['width'] / 2, hb['y'] + hb['height'] / 2
        pg.mouse.move(cx, cy); pg.mouse.down(); pg.mouse.move(cx - 200, cy, steps=8); pg.mouse.up()
        assert 180 <= aw() - w0 <= 220, f'drag left grew panel by {aw() - w0}'
        w1 = aw()
        pg.reload(); pg.get_by_text('Checklist Mức phạt Thuế').click(); pg.wait_for_selector('aside')
        assert abs(aw() - w1) <= 2, 'width not persisted'
        hb = pg.get_by_role('separator').bounding_box(); cx, cy = hb['x'] + hb['width'] / 2, hb['y'] + hb['height'] / 2
        pg.mouse.move(cx, cy); pg.mouse.down(); pg.mouse.move(0, cy, steps=10); pg.mouse.up()
        assert aw() / w <= 0.66, f'max clamp broken {aw() / w:.2f}'
        pg.get_by_role('separator').focus(); pg.keyboard.press('ArrowRight'); pg.keyboard.press('ArrowRight')
        assert aw() / w < 0.62, 'ArrowRight should shrink panel'
        hb = pg.get_by_role('separator').bounding_box(); cx, cy = hb['x'] + hb['width'] / 2, hb['y'] + hb['height'] / 2
        pg.mouse.move(cx, cy); pg.mouse.down(); pg.mouse.move(w, cy, steps=10); pg.mouse.up()
        assert aw() >= 415, f'min width clamp broken {aw()}'
        pg.get_by_role('separator').dblclick()
        assert 0.30 <= aw() / w <= 0.36, f'double-click reset gave {aw() / w:.2f}'
        pg.get_by_role('button', name='Độ rộng').click()
        assert 0.47 <= aw() / w <= 0.53, 'preset 1/2'
        pg.get_by_role('button', name='Độ rộng').click(); pg.get_by_role('button', name='Độ rộng').click()
        assert 0.30 <= aw() / w <= 0.36, 'preset cycle back to 1/3'
        pg.get_by_label('Hành vi kết thúc ngày').fill('2026-02-01')
        aside = pg.locator('aside')
        pg.get_by_label('Nhóm hành vi').select_option(label='Nộp hồ sơ khai thuế chậm / không nộp')
        pg.get_by_label('Chọn Điều 13.3').check()
        pg.get_by_label('Nhóm hành vi').select_option(label='Khai sai dẫn đến thiếu thuế (phạt 20%)')
        pg.get_by_label('Chọn Điều 16.1.a').check()
        aside.get_by_label('Số thuế khai thiếu (đ)').fill('500000000')
        txt = aside.inner_text()
        g = lambda lab: num(re.search(lab + r'\s*\n?\s*([\d\.]+) đ', txt).group(1))
        assert g(r'Tổng thấp nhất \(sàn\)') == 105_000_000
        assert g(r'Tổng cao nhất \(trần\)') == 108_000_000
        assert g(r'Tổng tạm tính tiền phạt') == 106_500_000
        # truy thu auto-filled from the ticked Điều 16 row; grand total = 106,5tr + 500tr
        assert aside.get_by_label('Số thuế truy thu / nộp bổ sung (đ)').input_value() == '500.000.000'
        txt = aside.inner_text()
        assert g(r'Tổng ước tính phải nộp') == 606_500_000
        # input sizing: fits its data (days/invoices 6 digits, money 12 digits, qty 3 digits), no clipping, extra digits ignored
        def fits(loc, typed):
            loc.fill(typed)
            return loc.evaluate("n => n.scrollWidth <= n.clientWidth"), loc.bounding_box()['width'], loc.input_value()
        ok, wbox, val = fits(aside.get_by_label('Số ngày chậm', exact=True).first, '9999999')
        assert ok and val == '999999' and wbox <= 100, ('days', ok, wbox, val)
        aside.get_by_label('Số ngày chậm', exact=True).first.fill('')
        ok, wbox, val = fits(aside.get_by_label('Số thuế truy thu / nộp bổ sung (đ)'), '9999999999999')
        assert ok and val == '999.999.999.999' and wbox <= 190, ('money', ok, wbox, val)
        aside.get_by_label('Số thuế truy thu / nộp bổ sung (đ)').fill('1000000000')   # manual override
        assert aside.get_by_text('Dùng lại số tự động (500.000.000 đ)').count() == 1
        # late days from dates: due 01/01/2026, paid 12/01/2026 -> 10 days ; fine due 01/02, paid 22/02 -> 20 days
        aside.get_by_label('Hạn nộp thuế').fill('2026-01-01'); aside.get_by_label('Ngày nộp thuế').fill('2026-01-12')
        aside.get_by_label('Hạn nộp phạt').fill('2026-02-01'); aside.get_by_label('Ngày nộp phạt').fill('2026-02-22')
        txt = aside.inner_text()
        assert g(r'Tổng ước tính phải nộp') == 1_110_565_000
        for frag in ['10 ngày chậm', '20 ngày chậm',
                     '1.000.000.000 đ × 0,03% × 10 ngày = 3.000.000 đ',
                     '106.500.000 đ × 0,05% × 20 ngày = 1.065.000 đ',
                     '106.500.000 đ + 1.000.000.000 đ + 3.000.000 đ + 1.065.000 đ = 1.110.565.000 đ',
                     'Trung bình khung (5.000.000 + 8.000.000) / 2 = 6.500.000 đ',
                     '20% × 500.000.000 đ = 100.000.000 đ']:
            assert frag in ' '.join(txt.split()), f'missing formula text: {frag}'
        aside.get_by_text('Dùng lại số tự động (500.000.000 đ)').click()
        assert aside.get_by_label('Số thuế truy thu / nộp bổ sung (đ)').input_value() == '500.000.000'
        aside.get_by_label('Số thuế truy thu / nộp bổ sung (đ)').fill('1000000000')
        qty = aside.get_by_label('Số lần').first
        qty.fill('12345'); assert qty.input_value() == '123' and qty.bounding_box()['width'] <= 70
        qty.fill('1')
        aside.get_by_label('Số tình tiết tăng nặng').fill('1')
        txt = aside.inner_text()
        assert g(r'Tổng tạm tính tiền phạt') == 107_150_000            # 13.3: 6,5tr x 1,1 ; 16.1.a: 100tr
        aside.get_by_label('Số tình tiết tăng nặng').fill('')
        pg.get_by_label('Nhóm hành vi').select_option(label='Nộp hồ sơ khai thuế chậm / không nộp')
        pg.get_by_label('Chọn Điều 13.2').check()
        aside.locator('li', has_text='Điều 13.2').get_by_label('Số ngày chậm').fill('45')
        aside.get_by_role('button', name='chuyển sang Điều 13.3').click()
        assert aside.locator('li', has_text='Điều 13.2').count() == 0
        pg.get_by_label('Nhóm hành vi').select_option(label='Lập hóa đơn')
        pg.get_by_label('Chọn Điều 24.2.b').check()
        r = aside.locator('li', has_text='Điều 24.2.b')
        r.get_by_label('Nhóm').select_option('B'); r.get_by_label('Số hóa đơn').fill('5')
        assert 'chuyển sang Điều 24.2.c' in r.inner_text()
        pg.get_by_label('Đối tượng').select_option(value='ca_nhan')
        txt = aside.inner_text()
        assert g(r'Tổng thấp nhất \(sàn\)') == 102_750_000            # 2,5tr + 100tr + 0,25tr (Điều 16 không chia đôi)
    assert not errs, errs
    print('E2E passed (layout 1440 + 390 no horizontal scroll; calculator assertions)')
    b.close()
