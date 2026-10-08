import React, { useEffect, useMemo, useRef, useState } from 'react';
import { Gavel, Search, AlertTriangle, X, Calculator, BookOpen, ArrowLeftRight } from 'lucide-react';
import {
  Ctx, Entity, LineInput, PenaltyRow, isEffective, latePayment, lineCalc, suggestRows, totals,
} from '../utils/penaltyCalc';

interface GeneralRule { chu_de: string; noi_dung: string; can_cu: string }
interface Rate { id: string; ten: string; ty_le_ngay: number; can_cu: string }

const FRAC_MIN = 0.25;
const FRAC_MAX = 0.65;
const FRAC_DEFAULT = 1 / 3;
const clampFrac = (x: number) => Math.min(FRAC_MAX, Math.max(FRAC_MIN, x));

const todayIso = () => new Date().toISOString().slice(0, 10);
const fmt = (n: number) => `${Math.round(n).toLocaleString('vi-VN')} đ`;
const fmtDate = (d: string) => (d ? d.split('-').reverse().join('/') : '');
const cite = (r: PenaltyRow) =>
  `Điều ${r.dieu}${r.khoan !== '' ? `.${r.khoan}` : ''}${r.diem ? `.${r.diem}` : ''}`;

const METRIC_LABEL: Record<string, string> = {
  ngay: 'Số ngày chậm', ngay_lv: 'Số ngày làm việc chậm', so_hd: 'Số hóa đơn',
};
const GROUP_HINT =
  'Nhóm A: hàng khuyến mại, quảng cáo, hàng mẫu; cho biếu tặng, trả lương, tiêu dùng nội bộ; cho vay mượn, hoàn trả. ' +
  'Nhóm B: bán hàng hóa, cung cấp dịch vụ.';

// Input sized to the data it takes: width = max digits (+ thousand separators for money) + padding.
// qty 3 digits, circumstances 2, days / invoices 6, money 12 digits (up to 999.999.999.999 đ).
const NumInput: React.FC<{
  value?: number; onChange: (v: number | undefined) => void; label: string; placeholder?: string;
  money?: boolean; maxDigits?: number;
}> = ({ value, onChange, label, placeholder, money, maxDigits }) => {
  const digits = maxDigits ?? (money ? 12 : 6);
  const chars = money ? digits + Math.floor((digits - 1) / 3) : digits;
  return (
    <input
      inputMode="numeric"
      aria-label={label}
      value={value ? (money ? value.toLocaleString('vi-VN') : String(value)) : ''}
      placeholder={placeholder}
      onChange={e => {
        const d = e.target.value.replace(/\D/g, '').slice(0, digits);
        onChange(d ? Number(d) : undefined);
      }}
      style={{ width: `calc(${chars}ch + 1.75rem)` }}
      className="shrink-0 rounded border border-slate-300 px-2 py-1.5 text-right text-sm tabular-nums"
    />
  );
};

export const PenaltyCatalog: React.FC = () => {
  const [rows, setRows] = useState<PenaltyRow[]>([]);
  const [general, setGeneral] = useState<GeneralRule[]>([]);
  const [rates, setRates] = useState<Rate[]>([]);
  const [error, setError] = useState<string | null>(null);

  const [query, setQuery] = useState('');
  const [lv, setLv] = useState('all');
  const [nhom, setNhom] = useState('all');
  const [dieu, setDieu] = useState('all');
  const [hinhThuc, setHinhThuc] = useState('all');
  const [entity, setEntity] = useState<Entity>('to_chuc');
  const [onDate, setOnDate] = useState(todayIso());
  const [showAll, setShowAll] = useState(false);
  const [showRules, setShowRules] = useState(false);

  // Resizable summary panel: fraction of the content width given to the right-hand panel (persisted per browser).
  const [frac, setFrac] = useState<number>(() => {
    try {
      const v = Number(localStorage.getItem('penaltyPanelFrac'));
      return v >= FRAC_MIN && v <= FRAC_MAX ? v : FRAC_DEFAULT;
    } catch { return FRAC_DEFAULT; }
  });
  const [wide, setWide] = useState(false);
  const gridRef = useRef<HTMLDivElement>(null);
  useEffect(() => {
    const mq = window.matchMedia('(min-width: 1024px)');
    const on = () => setWide(mq.matches);
    on();
    mq.addEventListener('change', on);
    return () => mq.removeEventListener('change', on);
  }, []);
  useEffect(() => {
    try { localStorage.setItem('penaltyPanelFrac', String(frac)); } catch { /* storage unavailable: keep in memory */ }
  }, [frac]);
  const startDrag = (e: React.PointerEvent) => {
    const el = gridRef.current;
    if (!el) return;
    e.preventDefault();
    const move = (ev: PointerEvent) => {
      const r = el.getBoundingClientRect();
      setFrac(clampFrac((r.right - ev.clientX) / r.width));
    };
    const up = () => {
      window.removeEventListener('pointermove', move);
      window.removeEventListener('pointerup', up);
    };
    window.addEventListener('pointermove', move);
    window.addEventListener('pointerup', up);
  };
  const cyclePreset = () => setFrac(f => (f < 0.4 ? 0.5 : f < 0.55 ? FRAC_MAX : FRAC_DEFAULT));

  const [sel, setSel] = useState<Record<string, LineInput>>({});
  const [mitigating, setMitigating] = useState(0);
  const [aggravating, setAggravating] = useState(0);
  const [backTax, setBackTax] = useState<number | undefined>();
  const [taxLateDays, setTaxLateDays] = useState<number | undefined>();
  const [fineLateDays, setFineLateDays] = useState<number | undefined>();

  useEffect(() => {
    fetch('/penalty_catalog.json')
      .then(res => { if (!res.ok) throw new Error(`HTTP ${res.status}`); return res.json(); })
      .then(data => { setRows(data.rows); setGeneral(data.general); setRates(data.rates ?? []); })
      .catch(e => setError(`Không tải được dữ liệu mức phạt: ${e.message}`));
  }, []);

  const ctx: Ctx = { entity, mitigating, aggravating, onDate };
  const byId = useMemo(() => new Map(rows.map(r => [r.id, r])), [rows]);

  const lvOptions = useMemo(() => Array.from(new Set(rows.map(r => r.lv))), [rows]);
  const nhomOptions = useMemo(
    () => Array.from(new Set(rows.filter(r => lv === 'all' || r.lv === lv).map(r => r.nhom))),
    [rows, lv],
  );
  const dieuOptions = useMemo(
    () => Array.from(new Set(rows.filter(r => (lv === 'all' || r.lv === lv) && (nhom === 'all' || r.nhom === nhom)).map(r => r.dieu)))
      .sort((a, b) => a - b),
    [rows, lv, nhom],
  );

  const visible = useMemo(() => {
    const q = query.trim().toLowerCase();
    return rows.filter(r => {
      if (lv !== 'all' && r.lv !== lv) return false;
      if (nhom !== 'all' && r.nhom !== nhom) return false;
      if (dieu !== 'all' && String(r.dieu) !== dieu) return false;
      if (hinhThuc !== 'all' && r.hinh_thuc !== hinhThuc) return false;
      if (!showAll && !isEffective(r, onDate)) return false;
      if (!q) return true;
      return r.hanh_vi.toLowerCase().includes(q) || r.dieu_kien.toLowerCase().includes(q)
        || r.nhom.toLowerCase().includes(q) || cite(r).toLowerCase().includes(q);
    });
  }, [rows, query, lv, nhom, dieu, hinhThuc, onDate, showAll]);

  const toggle = (r: PenaltyRow) => setSel(prev => {
    const next = { ...prev };
    if (next[r.id]) delete next[r.id];
    else next[r.id] = { qty: 1, cat: r.ranges.find(x => x.k)?.k };
    return next;
  });
  const patch = (id: string, p: Partial<LineInput>) => setSel(prev => ({ ...prev, [id]: { ...prev[id], ...p } }));
  const swap = (fromId: string, to: PenaltyRow) => setSel(prev => {
    const { [fromId]: old, ...rest } = prev;
    return { ...rest, [to.id]: { ...old } };
  });

  const picked = Object.keys(sel).map(id => byId.get(id)).filter((r): r is PenaltyRow => !!r);
  const results = picked.map(r => lineCalc(r, sel[r.id], ctx));
  const sum = totals(results);
  const groupCount = picked.reduce<Record<string, number>>((a, r) => (r.nhom_id ? { ...a, [r.nhom_id]: (a[r.nhom_id] ?? 0) + 1 } : a), {});

  const rateThue = rates.find(r => r.id === 'cham_nop_thue');
  const ratePhat = rates.find(r => r.id === 'cham_nop_phat');
  const lateTax = rateThue ? latePayment(backTax ?? 0, rateThue.ty_le_ngay, taxLateDays ?? 0) : 0;
  const lateFine = ratePhat ? latePayment(sum.specific, ratePhat.ty_le_ngay, fineLateDays ?? 0) : 0;
  const grand = sum.specific + (backTax ?? 0) + lateTax + lateFine;

  const amountCell = (r: PenaltyRow) => {
    if (r.hinh_thuc === 'Cảnh cáo') return <span className="font-semibold text-slate-700">Cảnh cáo</span>;
    if (r.hinh_thuc === 'Phạt theo tỷ lệ') return <span className="block text-xs leading-snug text-slate-800">{r.ty_le}</span>;
    if (r.min_vnd === null || r.max_vnd === null) return null;
    const d = entity === 'ca_nhan' ? 2 : 1;
    return (
      <span className="font-semibold text-slate-900 text-xs sm:text-sm">
        {fmt(r.min_vnd / d)} – {fmt(r.max_vnd / d)}
      </span>
    );
  };

  const sel_cls = 'mt-0.5 w-full rounded border border-slate-300 bg-white px-1.5 py-1 text-xs';

  return (
    <div className="max-w-[2000px] mx-auto px-3 sm:px-4 lg:px-6 py-3 lg:h-[calc(100vh-14rem)] lg:flex lg:flex-col">
      <div className="flex flex-wrap items-center gap-x-3 gap-y-1 shrink-0">
        <div className="w-8 h-8 rounded-lg bg-slate-900 text-amber-400 flex items-center justify-center shrink-0">
          <Gavel className="w-4 h-4" />
        </div>
        <h2 className="text-base font-bold text-slate-900">Checklist hành vi vi phạm &amp; tạm tính mức phạt thuế, hóa đơn</h2>
        <span className="text-[11px] text-slate-600">NĐ 125/2020 (từ 05/12/2020) sửa đổi bởi NĐ 310/2025 (từ 16/01/2026)</span>
      </div>

      <div className="mt-2 flex gap-2 rounded-lg border border-amber-300 bg-amber-50 px-3 py-1.5 text-[11px] text-amber-900 shrink-0">
        <AlertTriangle className="w-3.5 h-3.5 shrink-0 mt-0.5" />
        <p>
          Tra cứu khung phạt theo văn bản, không phải tư vấn pháp lý. Phần tạm tính là phép cộng theo số liệu bạn nhập, chưa áp dụng
          quy tắc gộp hành vi (Điều 5.3), chưa xét mức trần mỗi hành vi. Mức phạt thực tế do cơ quan có thẩm quyền quyết định.
        </p>
      </div>

      {error && <p className="mt-2 text-sm text-red-700">{error}</p>}
      {!error && rows.length === 0 && <p className="mt-2 text-sm text-slate-500">Đang tải dữ liệu…</p>}

      <div ref={gridRef} className="mt-2 grid gap-3 lg:gap-0 lg:flex-1 lg:min-h-0"
        style={wide ? { gridTemplateColumns: `minmax(0,${1 - frac}fr) 14px minmax(26rem,${frac}fr)` } : undefined}>
        {/* LEFT: filters + checklist */}
        <div className="flex min-h-0 min-w-0 flex-col gap-2 lg:h-full">
          <div className="grid gap-2 grid-cols-2 lg:grid-cols-4 rounded-xl border border-slate-200 bg-white p-2 shrink-0">
            <label className="col-span-2 text-[11px] text-slate-600">
              Tìm hành vi / điều khoản
              <div className="mt-0.5 flex items-center gap-1.5 rounded border border-slate-300 px-2 py-1">
                <Search className="w-3.5 h-3.5 text-slate-400" />
                <input value={query} onChange={e => setQuery(e.target.value)} placeholder="vd: chậm nộp, hóa đơn, Điều 24"
                  className="w-full text-xs outline-none" />
              </div>
            </label>
            <label className="text-[11px] text-slate-600">Lĩnh vực
              <select value={lv} onChange={e => { setLv(e.target.value); setNhom('all'); setDieu('all'); }} className={sel_cls}>
                <option value="all">Tất cả</option>
                {lvOptions.map(o => <option key={o} value={o}>{o}</option>)}
              </select>
            </label>
            <label className="text-[11px] text-slate-600">Nhóm hành vi
              <select value={nhom} onChange={e => { setNhom(e.target.value); setDieu('all'); }} className={sel_cls}>
                <option value="all">Tất cả</option>
                {nhomOptions.map(o => <option key={o} value={o}>{o}</option>)}
              </select>
            </label>
            <label className="text-[11px] text-slate-600">Điều
              <select value={dieu} onChange={e => setDieu(e.target.value)} className={sel_cls}>
                <option value="all">Tất cả</option>
                {dieuOptions.map(o => <option key={o} value={String(o)}>Điều {o}</option>)}
              </select>
            </label>
            <label className="text-[11px] text-slate-600">Hình thức
              <select value={hinhThuc} onChange={e => setHinhThuc(e.target.value)} className={sel_cls}>
                <option value="all">Tất cả</option>
                <option value="Cảnh cáo">Cảnh cáo</option>
                <option value="Phạt tiền (khung)">Phạt tiền theo khung</option>
                <option value="Phạt theo tỷ lệ">Phạt theo tỷ lệ</option>
              </select>
            </label>
            <label className="text-[11px] text-slate-600">Đối tượng
              <select value={entity} onChange={e => setEntity(e.target.value as Entity)} className={sel_cls}>
                <option value="to_chuc">Tổ chức (mức trong văn bản)</option>
                <option value="ca_nhan">Cá nhân / hộ kinh doanh (1/2 - Điều 5.5)</option>
              </select>
            </label>
            <label className="text-[11px] text-slate-600">Hành vi kết thúc ngày
              <input type="date" value={onDate} onChange={e => setOnDate(e.target.value || todayIso())} className={sel_cls} />
            </label>
            <label className="flex items-end gap-1.5 pb-1 text-[11px] text-slate-700 col-span-2 lg:col-span-3">
              <input type="checkbox" checked={showAll} onChange={e => setShowAll(e.target.checked)} />
              Hiện cả quy định đã bãi bỏ / thay thế
            </label>
            <button onClick={() => setShowRules(v => !v)}
              className="flex items-end justify-end gap-1 pb-1 text-[11px] font-semibold text-slate-700 hover:text-slate-900 col-span-2 lg:col-span-1">
              <BookOpen className="w-3.5 h-3.5" /> Nguyên tắc chung ({general.length})
            </button>
          </div>
        <section className="rounded-xl border border-slate-200 bg-white lg:min-h-0 lg:flex-1 lg:overflow-y-auto min-w-0">
          <div className="sticky top-0 z-10 border-b border-slate-200 bg-slate-50 px-3 py-1.5 text-[11px] text-slate-600">
            {visible.length} / {rows.length} dòng. Tick vào hành vi để đưa sang bảng tạm tính bên phải.
            {entity === 'ca_nhan' && ' Mức cá nhân = 1/2 mức tổ chức (trừ Điều 16, 17, 18).'}
          </div>
          {showRules && (
            <ul className="divide-y divide-slate-100 border-b border-slate-200 bg-amber-50/40">
              {general.map(g => (
                <li key={g.chu_de} className="px-3 py-2 text-xs">
                  <div className="font-semibold text-slate-900">{g.chu_de}</div>
                  <div className="text-slate-700">{g.noi_dung}</div>
                  <div className="text-[10px] text-slate-500">Căn cứ: {g.can_cu}</div>
                </li>
              ))}
            </ul>
          )}
          <ul className="divide-y divide-slate-100">
            {visible.map(r => {
              const inactive = r.trang_thai !== 'Còn hiệu lực';
              const on = !!sel[r.id];
              return (
                <li key={r.id} className={`flex items-start gap-2 px-3 py-2 ${on ? 'bg-amber-50' : inactive ? 'bg-slate-50' : ''}`}>
                  <input type="checkbox" checked={on} onChange={() => toggle(r)} className="mt-1 shrink-0" aria-label={`Chọn ${cite(r)}`} />
                  <div className={`min-w-0 flex-1 ${inactive ? 'text-slate-500' : ''}`}>
                    <div className="flex flex-wrap items-center gap-x-1.5 gap-y-0.5 text-[10px]">
                      <span className="rounded bg-slate-900 px-1.5 py-0.5 font-semibold text-white">{cite(r)}</span>
                      <span className="text-slate-500">{r.nhom}</span>
                      {inactive && <span className="rounded bg-amber-100 px-1 text-amber-800">đến {fmtDate(r.hieu_luc_den)}</span>}
                      {!inactive && r.hieu_luc_tu >= '2026-01-16' && <span className="rounded bg-emerald-100 px-1 text-emerald-800">từ {fmtDate(r.hieu_luc_tu)}</span>}
                    </div>
                    <p className="text-sm break-words">{r.hanh_vi}</p>
                    {(r.dieu_kien || r.bien_phap_khac_phuc || r.ghi_chu) && (
                      <details className="text-[11px] text-slate-600">
                        <summary className="cursor-pointer select-none text-slate-500">Chi tiết</summary>
                        {r.dieu_kien && <p className="mt-0.5"><b>Điều kiện:</b> {r.dieu_kien}</p>}
                        {r.bien_phap_khac_phuc && <p><b>Khắc phục:</b> {r.bien_phap_khac_phuc}</p>}
                        {r.ghi_chu && <p><b>Ghi chú:</b> {r.ghi_chu}</p>}
                        <p className="text-slate-400">Hiệu lực {fmtDate(r.hieu_luc_tu)}{r.hieu_luc_den ? ` – ${fmtDate(r.hieu_luc_den)}` : ''} · NĐ {r.nguon}</p>
                      </details>
                    )}
                  </div>
                  <div className="w-36 sm:w-48 shrink-0 text-right">{amountCell(r)}</div>
                </li>
              );
            })}
          </ul>
        </section>
        </div>

        {/* drag handle: resize the summary panel */}
        <div
          role="separator" aria-orientation="vertical" tabIndex={0}
          aria-label="Kéo để đổi độ rộng bảng tạm tính"
          title="Kéo để đổi độ rộng · bấm đúp để về 1/3 · phím ← → để chỉnh"
          onPointerDown={startDrag}
          onDoubleClick={() => setFrac(FRAC_DEFAULT)}
          onKeyDown={e => {
            if (e.key === 'ArrowLeft') { setFrac(f => clampFrac(f + 0.03)); e.preventDefault(); }
            if (e.key === 'ArrowRight') { setFrac(f => clampFrac(f - 0.03)); e.preventDefault(); }
          }}
          className="group hidden cursor-col-resize touch-none items-center justify-center lg:flex"
        >
          <div className="h-20 w-1 rounded bg-slate-300 group-hover:bg-amber-500 group-focus:bg-amber-500" />
        </div>

        {/* RIGHT: summary + calculator */}
        <aside className="rounded-xl border border-slate-300 bg-white lg:h-full lg:overflow-y-auto min-w-0">
          <div className="sticky top-0 z-10 flex items-center justify-between border-b border-slate-200 bg-slate-900 px-3 py-2 text-white">
            <span className="flex items-center gap-1.5 text-sm font-semibold"><Calculator className="w-4 h-4 text-amber-400" /> Bảng tạm tính ({picked.length})</span>
            <span className="flex items-center gap-3">
              <button onClick={cyclePreset} title="Đổi nhanh độ rộng: 1/3 → 1/2 → 2/3" className="hidden items-center gap-1 text-xs text-slate-300 hover:text-white lg:inline-flex">
                <ArrowLeftRight className="w-3.5 h-3.5" /> Độ rộng
              </button>
              {picked.length > 0 && <button onClick={() => setSel({})} className="text-xs text-slate-300 hover:text-white">Bỏ chọn hết</button>}
            </span>
          </div>

          <div className="border-b border-slate-100 px-3 py-2 text-xs text-slate-600">
            <div className="flex flex-wrap items-center gap-x-5 gap-y-1.5">
              <label className="flex items-center gap-2">Số tình tiết giảm nhẹ
                <NumInput maxDigits={2} label="Số tình tiết giảm nhẹ" value={mitigating || undefined} onChange={v => setMitigating(v ?? 0)} placeholder="0" />
              </label>
              <label className="flex items-center gap-2">Số tình tiết tăng nặng
                <NumInput maxDigits={2} label="Số tình tiết tăng nặng" value={aggravating || undefined} onChange={v => setAggravating(v ?? 0)} placeholder="0" />
              </label>
            </div>
            <p className="mt-1.5 text-xs text-slate-500">
              Dùng để xác định mức cụ thể trong khung (Điều 7.4) và mức trốn thuế (Điều 17). Tình tiết đã dùng để chọn khung
              thì không tính lại. Một tình tiết giảm nhẹ bù trừ một tình tiết tăng nặng.
            </p>
          </div>

          {picked.length === 0 && <p className="px-3 py-4 text-sm text-slate-500">Chưa chọn hành vi nào. Tick ở danh sách bên trái.</p>}

          <ul className="divide-y divide-slate-100">
            {picked.map((r, i) => {
              const res = results[i];
              const inp = sel[r.id];
              const sug = r.ranges.length && inp.value ? suggestRows(rows, r, inp.value, inp.cat ?? '', onDate).filter(s => s.id !== r.id) : [];
              const cats = Array.from(new Set(r.ranges.map(x => x.k).filter(Boolean)));
              return (
                <li key={r.id} className="px-3 py-2 text-sm">
                  <div className="flex items-start justify-between gap-2">
                    <div className="min-w-0">
                      <span className="rounded bg-slate-900 px-1.5 py-0.5 text-xs font-semibold text-white">{cite(r)}</span>
                      <p className="mt-0.5 line-clamp-3 text-slate-700" title={r.hanh_vi}>{r.hanh_vi}</p>
                    </div>
                    <button onClick={() => toggle(r)} aria-label="Bỏ chọn" className="text-slate-400 hover:text-slate-700"><X className="w-3.5 h-3.5" /></button>
                  </div>

                  <div className="mt-1.5 flex flex-wrap items-end gap-x-3 gap-y-1.5">
                    <label className="flex flex-col gap-0.5 text-xs text-slate-500">Số lần
                      <NumInput maxDigits={3} label="Số lần" value={inp.qty} onChange={v => patch(r.id, { qty: v ?? 1 })} placeholder="1" />
                    </label>
                    {r.hinh_thuc === 'Phạt theo tỷ lệ' && (() => {
                      const baseLabel = r.dieu === 16 ? 'Số thuế khai thiếu (đ)' : r.dieu === 17 ? 'Số thuế trốn (đ)' : 'Số tiền không trích chuyển (đ)';
                      return (
                        <label className="flex flex-col gap-0.5 text-xs text-slate-500">{baseLabel}
                          <NumInput money label={baseLabel} value={inp.base} onChange={v => patch(r.id, { base: v })} placeholder="số tiền" />
                        </label>
                      );
                    })()}
                    {r.ranges.length > 0 && (
                      <>
                        {cats.length > 0 && (
                          <label className="flex flex-col gap-0.5 text-xs text-slate-500">Nhóm
                            <select value={inp.cat ?? cats[0]} onChange={e => patch(r.id, { cat: e.target.value })}
                              title={GROUP_HINT} className="w-[4.5rem] rounded border border-slate-300 bg-white px-1.5 py-1.5 text-sm">
                              {cats.map(c => <option key={c} value={c}>{c}</option>)}
                            </select>
                          </label>
                        )}
                        <label className="flex flex-col gap-0.5 text-xs text-slate-500">{METRIC_LABEL[r.metric]}
                          <NumInput label={METRIC_LABEL[r.metric]} value={inp.value} onChange={v => patch(r.id, { value: v })} placeholder={r.metric === 'so_hd' ? 'số HĐ' : 'ngày'} />
                        </label>
                      </>
                    )}
                  </div>

                  {res.rangeOk === false && (
                    <div className="mt-1 rounded border border-amber-300 bg-amber-50 p-1.5 text-xs text-amber-900">
                      Giá trị nhập nằm ngoài khung này.
                      {sug.length > 0 ? ' Khung phù hợp (rê chuột để xem điều kiện, khung cảnh cáo cần có tình tiết giảm nhẹ): ' : ' Không có khung nào phù hợp trong nhóm này.'}
                      {sug.map(s => (
                        <button key={s.id} onClick={() => swap(r.id, s)} title={`${s.hanh_vi}${s.dieu_kien ? ` (${s.dieu_kien})` : ''}`} className="ml-1 rounded bg-amber-200 px-1.5 py-0.5 font-semibold hover:bg-amber-300">
                          chuyển sang {cite(s)}
                        </button>
                      ))}
                    </div>
                  )}
                  {r.nhom_id && groupCount[r.nhom_id] > 1 && (
                    <p className="mt-1 text-xs text-amber-700">
                      Đã chọn nhiều khung của cùng nhóm hành vi. Nếu là cùng một lần vi phạm, chỉ chọn một khung (hoặc dùng ô "Số lần").
                    </p>
                  )}

                  <div className="mt-1 flex items-baseline justify-between gap-2">
                    <span className="text-xs text-slate-500">{res.detail}</span>
                    {res.status === 'need_input'
                      ? <span className="text-xs font-semibold text-amber-700">cần nhập số liệu</span>
                      : (
                        <span className="text-right">
                          <span className="block text-xs text-slate-600">{fmt(res.min)} – {fmt(res.max)}</span>
                          <span className="block text-sm font-semibold text-slate-900">tạm tính {fmt(res.specific)}</span>
                        </span>
                      )}
                  </div>
                </li>
              );
            })}
          </ul>

          <div className="border-t border-slate-200 px-3 py-2 text-xs text-slate-600">
            <p className="mb-1 font-semibold text-slate-800">Khoản phải nộp thêm (không phải tiền phạt)</p>
            <div className="space-y-1.5">
              <label className="flex items-center justify-between gap-2">
                <span>Số thuế truy thu / nộp bổ sung (đ)</span>
                <NumInput money label="Số thuế truy thu / nộp bổ sung (đ)" value={backTax} onChange={setBackTax} placeholder="số tiền" />
              </label>
              <div className="flex items-center gap-2">
                <label className="flex flex-1 items-center justify-between gap-2">
                  <span>Số ngày chậm nộp thuế</span>
                  <NumInput label="Số ngày chậm nộp thuế" value={taxLateDays} onChange={setTaxLateDays} placeholder="ngày" />
                </label>
                <span className="w-32 shrink-0 text-right tabular-nums text-slate-800">{fmt(lateTax)}</span>
              </div>
              <div className="flex items-center gap-2">
                <label className="flex flex-1 items-center justify-between gap-2">
                  <span>Số ngày chậm nộp tiền phạt</span>
                  <NumInput label="Số ngày chậm nộp tiền phạt" value={fineLateDays} onChange={setFineLateDays} placeholder="ngày" />
                </label>
                <span className="w-32 shrink-0 text-right tabular-nums text-slate-800">{fmt(lateFine)}</span>
              </div>
            </div>
            {rateThue && <p className="mt-1 text-xs text-slate-500">Tiền chậm nộp thuế: {rateThue.can_cu}.</p>}
            {ratePhat && <p className="text-xs text-slate-500">{ratePhat.can_cu}. Tính trên tổng tạm tính tiền phạt.</p>}
          </div>
          <div className="sticky bottom-0 z-10 border-t-2 border-slate-900 bg-slate-50 px-4 py-3 text-sm shadow-[0_-4px_8px_rgba(0,0,0,0.06)]">
            <div className="flex justify-between"><span>Tổng thấp nhất (sàn)</span><b>{fmt(sum.min)}</b></div>
            <div className="flex justify-between"><span>Tổng cao nhất (trần)</span><b>{fmt(sum.max)}</b></div>
            <div className="flex justify-between text-base"><span>Tổng tạm tính tiền phạt</span><b className="text-amber-700 text-lg">{fmt(sum.specific)}</b></div>
            {sum.needInput > 0 && <p className="mt-1 text-xs text-amber-700">{sum.needInput} dòng chưa đủ số liệu nên chưa nằm trong tổng.</p>}
            <div className="mt-1.5 flex justify-between border-t border-slate-300 pt-1.5 text-base text-slate-900">
              <span className="font-semibold">Tổng ước tính phải nộp</span><b className="text-lg">{fmt(grand)}</b>
            </div>
          </div>
        </aside>
      </div>
    </div>
  );
};
