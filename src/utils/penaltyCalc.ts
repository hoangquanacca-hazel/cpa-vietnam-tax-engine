// Pure calculation helpers for the penalty checklist (NĐ 125/2020 as amended by NĐ 310/2025).
// No UI, no network, no randomness: every number comes from the catalog row or the user's input.

export interface PenaltyRange {
  k: string;            // '' | 'A' | 'B'  (group A/B of invoice-count tiers, Điều 24)
  lo: number;
  hi: number | null;    // null = open-ended
}

export interface PenaltyRow {
  id: string;
  lv: string;
  nhom: string;
  nhom_id: string;
  metric: '' | 'ngay' | 'ngay_lv' | 'so_hd';
  ranges: PenaltyRange[];
  dieu: number;
  khoan: number | string;
  diem: string;
  hanh_vi: string;
  hinh_thuc: string;
  min_vnd: number | null;
  max_vnd: number | null;
  ty_le: string;
  dieu_kien: string;
  bien_phap_khac_phuc: string;
  hieu_luc_tu: string;
  hieu_luc_den: string;
  trang_thai: string;
  nguon: string;
  ghi_chu: string;
}

export type Entity = 'to_chuc' | 'ca_nhan';

export interface LineInput {
  qty: number;           // number of separate occurrences (e.g. number of late filings), default 1
  base?: number;         // tax amount (Điều 16/17) or untransferred amount (Điều 18)
  value?: number;        // days late / number of invoices, for tiered rows
  cat?: string;          // 'A' | 'B' for Điều 24 tiers
}

export interface Ctx {
  entity: Entity;
  mitigating: number;    // số tình tiết giảm nhẹ
  aggravating: number;   // số tình tiết tăng nặng
  onDate: string;        // ISO date the violation ended
}

export interface LineResult {
  status: 'ok' | 'need_input' | 'warning_only';
  min: number;
  max: number;
  specific: number;
  detail: string;        // how the number was obtained
  rangeOk: boolean | null;
}

export const NEW_REGIME_FROM = '2026-01-16';
export const isNewRegime = (onDate: string) => onDate >= NEW_REGIME_FROM;

export const clamp = (x: number, lo: number, hi: number) => Math.min(hi, Math.max(lo, x));

/** Điều 7.4.d NĐ125 (old: per-circumstance 10% clamped; new from 16/01/2026: 1 circumstance 10%, >=2 -> min/max).
 *  Điều 7.4.b: one mitigating circumstance offsets one aggravating circumstance. */
export function specificAmount(min: number, max: number, g: number, t: number, onDate: string): number {
  const avg = (min + max) / 2;
  const net = t - g;
  if (isNewRegime(onDate)) {
    if (net >= 2) return max;
    if (net <= -2) return min;
  }
  return Math.round(clamp(avg * (1 + 0.1 * net), min, max));
}

/** Điều 17 NĐ125 multipliers after offsetting (Điều 7.4.b). */
export function tronMultiplier(g: number, t: number): number {
  const net = t - g;
  if (net < 0) return 1;
  if (net === 0) return 1.5;
  if (net === 1) return 2;
  if (net === 2) return 2.5;
  return 3;
}

export const inRange = (row: PenaltyRow, value: number, cat: string): boolean =>
  row.ranges.some(r => (r.k === '' || r.k === cat) && value >= r.lo && (r.hi === null || value <= r.hi));

export const isEffective = (r: PenaltyRow, on: string) =>
  r.hieu_luc_tu <= on && (r.hieu_luc_den === '' || on <= r.hieu_luc_den);

export function lineCalc(row: PenaltyRow, input: LineInput, ctx: Ctx): LineResult {
  const qty = Math.max(1, Math.floor(input.qty || 1));
  let rangeOk: boolean | null = null;
  if (row.ranges.length && input.value !== undefined && input.value > 0) {
    rangeOk = inRange(row, input.value, input.cat ?? '');
  }

  if (row.hinh_thuc === 'Cảnh cáo') {
    return { status: 'warning_only', min: 0, max: 0, specific: 0, detail: 'Cảnh cáo, không phạt tiền', rangeOk };
  }

  if (row.hinh_thuc === 'Phạt theo tỷ lệ') {
    const base = input.base ?? 0;
    if (!(base > 0)) {
      return { status: 'need_input', min: 0, max: 0, specific: 0, detail: 'Cần nhập số tiền làm căn cứ tính', rangeOk };
    }
    if (row.dieu === 16) {
      const v = Math.round(0.2 * base * qty);
      return { status: 'ok', min: v, max: v, specific: v, detail: '20% × số thuế khai thiếu', rangeOk };
    }
    if (row.dieu === 17) {
      const m = tronMultiplier(ctx.mitigating, ctx.aggravating);
      return {
        status: 'ok', min: base * qty, max: 3 * base * qty, specific: Math.round(m * base * qty),
        detail: `${m} lần số thuế trốn (khung 1-3 lần)`, rangeOk,
      };
    }
    const v = base * qty; // Điều 18: phạt bằng số tiền không trích chuyển
    return { status: 'ok', min: v, max: v, specific: v, detail: 'Bằng số tiền không trích chuyển', rangeOk };
  }

  if (row.min_vnd === null || row.max_vnd === null) {
    return { status: 'need_input', min: 0, max: 0, specific: 0, detail: 'Không có khung tiền', rangeOk };
  }
  const div = ctx.entity === 'ca_nhan' ? 2 : 1; // Điều 5.5 NĐ125: tổ chức = 2 × cá nhân
  const min = row.min_vnd / div;
  const max = row.max_vnd / div;
  const specific = specificAmount(min, max, ctx.mitigating, ctx.aggravating, ctx.onDate);
  return {
    status: 'ok', min: min * qty, max: max * qty, specific: specific * qty,
    detail: ctx.mitigating === 0 && ctx.aggravating === 0 ? 'Mức trung bình của khung' : 'Trung bình khung, điều chỉnh theo tình tiết',
    rangeOk,
  };
}

export interface Totals {
  min: number;
  max: number;
  specific: number;
  needInput: number;
}

export function totals(lines: LineResult[]): Totals {
  return lines.reduce<Totals>(
    (a, l) => (l.status === 'need_input'
      ? { ...a, needInput: a.needInput + 1 }
      : { ...a, min: a.min + l.min, max: a.max + l.max, specific: a.specific + l.specific }),
    { min: 0, max: 0, specific: 0, needInput: 0 },
  );
}

/** Other rows of the same behaviour group (and effective on the date) whose range contains the value. */
export function suggestRows(rows: PenaltyRow[], row: PenaltyRow, value: number, cat: string, onDate: string): PenaltyRow[] {
  if (!row.nhom_id) return [];
  return rows.filter(r => r.nhom_id === row.nhom_id && isEffective(r, onDate) && inRange(r, value, cat));
}

/** Tiền chậm nộp = số tiền × tỷ lệ/ngày × số ngày (calendar days). */
export const latePayment = (amount: number, ratePerDay: number, days: number) =>
  Math.round(Math.max(0, amount) * ratePerDay * Math.max(0, Math.floor(days)));
