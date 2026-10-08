// Run: npx tsx tests/penaltyCalc.test.ts   (uses the real catalog JSON, expected values computed by hand)
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { Ctx, PenaltyRow, inRange, latePayment, lineCalc, suggestRows, totals } from '../src/utils/penaltyCalc.ts';

const rows: PenaltyRow[] = JSON.parse(readFileSync(new URL('../public/penalty_catalog.json', import.meta.url), 'utf8')).rows;
const find = (dieu: number, khoan: number | string, diem: string, nguon = '125') => {
  const r = rows.filter(x => x.dieu === dieu && x.khoan === khoan && x.diem === diem && x.nguon === nguon);
  assert.equal(r.length, 1, `row ${dieu}.${khoan}${diem} (${nguon}) matched ${r.length}`);
  return r[0];
};
const ctx = (o: Partial<Ctx> = {}): Ctx => ({ entity: 'to_chuc', mitigating: 0, aggravating: 0, onDate: '2026-02-01', ...o });
const M = 1_000_000;

// Điều 13.3 NĐ125: 5-8 triệu
const r133 = find(13, 3, '');
let l = lineCalc(r133, { qty: 1 }, ctx());
assert.deepEqual([l.min, l.max, l.specific], [5 * M, 8 * M, 6.5 * M]);
l = lineCalc(r133, { qty: 1 }, ctx({ entity: 'ca_nhan' }));                       // Điều 5.5: cá nhân = 1/2
assert.deepEqual([l.min, l.max, l.specific], [2.5 * M, 4 * M, 3.25 * M]);
l = lineCalc(r133, { qty: 2 }, ctx());                                             // 2 lần vi phạm
assert.deepEqual([l.min, l.max, l.specific], [10 * M, 16 * M, 13 * M]);
// tình tiết, quy tắc mới (từ 16/01/2026)
assert.equal(lineCalc(r133, { qty: 1 }, ctx({ aggravating: 1 })).specific, 7.15 * M);
assert.equal(lineCalc(r133, { qty: 1 }, ctx({ mitigating: 1 })).specific, 5.85 * M);
assert.equal(lineCalc(r133, { qty: 1 }, ctx({ aggravating: 2 })).specific, 8 * M);   // >=2 tăng nặng -> tối đa
assert.equal(lineCalc(r133, { qty: 1 }, ctx({ mitigating: 2 })).specific, 5 * M);    // >=2 giảm nhẹ -> tối thiểu
assert.equal(lineCalc(r133, { qty: 1 }, ctx({ mitigating: 1, aggravating: 1 })).specific, 6.5 * M); // bù trừ 1-1
// quy tắc cũ (trước 16/01/2026): mỗi tình tiết 10%, kẹp trong khung
assert.equal(lineCalc(r133, { qty: 1 }, ctx({ onDate: '2025-06-01', aggravating: 2 })).specific, 7.8 * M);
assert.equal(lineCalc(r133, { qty: 1 }, ctx({ onDate: '2025-06-01', aggravating: 9 })).specific, 8 * M);

// Điều 16: 20% số thuế khai thiếu
const r16 = find(16, 1, 'a');
assert.equal(lineCalc(r16, { qty: 1, base: 500 * M }, ctx()).specific, 100 * M);
assert.equal(lineCalc(r16, { qty: 1 }, ctx()).status, 'need_input');

// Điều 17: 1-3 lần số thuế trốn
const r17 = find(17, 1, 'b');
const tron = (g: number, t: number) => lineCalc(r17, { qty: 1, base: 1000 * M }, ctx({ mitigating: g, aggravating: t }));
assert.deepEqual([tron(0, 0).min, tron(0, 0).max], [1000 * M, 3000 * M]);
assert.deepEqual([tron(0, 0).specific, tron(0, 1).specific, tron(0, 2).specific, tron(0, 3).specific, tron(0, 7).specific],
  [1500 * M, 2000 * M, 2500 * M, 3000 * M, 3000 * M]);
assert.deepEqual([tron(1, 0).specific, tron(1, 1).specific, tron(1, 2).specific], [1000 * M, 1500 * M, 2000 * M]);

// Cảnh cáo = 0 đồng
assert.deepEqual(lineCalc(find(13, 1, ''), { qty: 1 }, ctx()).max, 0);

// Tổng: dòng thiếu dữ liệu bị loại khỏi tổng và được đếm
const t = totals([lineCalc(r133, { qty: 1 }, ctx()), lineCalc(r16, { qty: 1 }, ctx())]);
assert.deepEqual([t.min, t.max, t.specific, t.needInput], [5 * M, 8 * M, 6.5 * M, 1]);

// Khung theo số ngày / số hóa đơn
assert.equal(inRange(r133, 31, ''), true);
assert.equal(inRange(r133, 30, ''), false);
assert.equal(inRange(r133, 60, ''), true);
assert.equal(inRange(r133, 61, ''), false);
const r242b = find(24, 2, 'b', '310');                                            // A: 2-9 số; B: 1 số
assert.equal(inRange(r242b, 5, 'A'), true);
assert.equal(inRange(r242b, 5, 'B'), false);
assert.equal(inRange(r242b, 1, 'B'), true);
const r243e = find(24, 3, 'e', '310');                                            // B: từ 50 số trở lên (60-80 triệu)
assert.deepEqual([r243e.min_vnd, r243e.max_vnd], [60 * M, 80 * M]);
assert.equal(inRange(r243e, 5000, 'B'), true);
// gợi ý khung: 45 ngày chậm nộp hồ sơ khai thuế -> Điều 13.3
const sug = suggestRows(rows, r133, 45, '', '2026-02-01').map(r => `${r.dieu}.${r.khoan}${r.diem}`);
assert.deepEqual(sug, ['13.3']);
// 100 hóa đơn nhóm B lập không đúng thời điểm -> 24.2.g (50-70 triệu)
const sug2 = suggestRows(rows, r242b, 100, 'B', '2026-02-01');
assert.deepEqual(sug2.map(r => `${r.dieu}.${r.khoan}${r.diem}`), ['24.2g']);
assert.deepEqual([sug2[0].min_vnd, sug2[0].max_vnd], [50 * M, 70 * M]);

// Tiền chậm nộp: 1 tỷ × 0,03% × 10 ngày = 3 triệu ; tiền phạt 10 triệu × 0,05% × 20 ngày = 100.000
assert.equal(Math.round(latePayment(1000 * M, 0.0003, 10)), 3 * M);
assert.equal(Math.round(latePayment(10 * M, 0.0005, 20)), 100_000);

console.log('penaltyCalc tests: all assertions passed');
