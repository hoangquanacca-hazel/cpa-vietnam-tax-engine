import React, { useEffect, useMemo, useState } from 'react';
import { Gavel, Search, AlertTriangle, ChevronDown, ChevronUp } from 'lucide-react';

interface PenaltyRow {
  id: string;
  lv: string;
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

interface GeneralRule {
  chu_de: string;
  noi_dung: string;
  can_cu: string;
}

type Entity = 'to_chuc' | 'ca_nhan';

const today = () => new Date().toISOString().slice(0, 10);

const fmtVnd = (n: number) => n.toLocaleString('vi-VN') + ' đ';
const fmtDate = (d: string) => (d ? d.split('-').reverse().join('/') : '');

const citation = (r: PenaltyRow) =>
  `Điều ${r.dieu}${r.khoan !== '' ? `, khoản ${r.khoan}` : ''}${r.diem ? `, điểm ${r.diem}` : ''}`;

const isEffective = (r: PenaltyRow, on: string) =>
  r.hieu_luc_tu <= on && (r.hieu_luc_den === '' || on <= r.hieu_luc_den);

export const PenaltyCatalog: React.FC = () => {
  const [rows, setRows] = useState<PenaltyRow[]>([]);
  const [general, setGeneral] = useState<GeneralRule[]>([]);
  const [error, setError] = useState<string | null>(null);
  const [query, setQuery] = useState('');
  const [field, setField] = useState('all');
  const [entity, setEntity] = useState<Entity>('to_chuc');
  const [onDate, setOnDate] = useState(today());
  const [showAll, setShowAll] = useState(false);
  const [showRules, setShowRules] = useState(false);

  useEffect(() => {
    fetch('/penalty_catalog.json')
      .then(res => {
        if (!res.ok) throw new Error(`HTTP ${res.status}`);
        return res.json();
      })
      .then(data => {
        setRows(data.rows);
        setGeneral(data.general);
      })
      .catch(e => setError(`Không tải được dữ liệu mức phạt: ${e.message}`));
  }, []);

  const fields = useMemo(() => Array.from(new Set(rows.map(r => r.lv))), [rows]);

  const visible = useMemo(() => {
    const q = query.trim().toLowerCase();
    return rows.filter(r => {
      if (field !== 'all' && r.lv !== field) return false;
      if (!showAll && !isEffective(r, onDate)) return false;
      if (!q) return true;
      return (
        r.hanh_vi.toLowerCase().includes(q) ||
        r.dieu_kien.toLowerCase().includes(q) ||
        citation(r).toLowerCase().includes(q)
      );
    });
  }, [rows, query, field, onDate, showAll]);

  const amount = (r: PenaltyRow) => {
    if (r.hinh_thuc === 'Cảnh cáo') return <span className="font-semibold text-slate-700">Cảnh cáo</span>;
    if (r.hinh_thuc === 'Phạt theo tỷ lệ') return <span className="text-slate-800">{r.ty_le}</span>;
    if (r.min_vnd === null || r.max_vnd === null) return null;
    const div = entity === 'ca_nhan' ? 2 : 1;
    return (
      <span className="font-semibold text-slate-900">
        {fmtVnd(r.min_vnd / div)} – {fmtVnd(r.max_vnd / div)}
      </span>
    );
  };

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
      <div className="flex items-start gap-3 mb-4">
        <div className="w-10 h-10 rounded-xl bg-slate-900 text-amber-400 flex items-center justify-center shrink-0">
          <Gavel className="w-5 h-5" />
        </div>
        <div>
          <h2 className="text-lg font-bold text-slate-900">Checklist hành vi vi phạm và khung mức phạt thuế, hóa đơn</h2>
          <p className="text-xs text-slate-600">
            Nghị định 125/2020/NĐ-CP (hiệu lực 05/12/2020) sửa đổi bởi Nghị định 310/2025/NĐ-CP (hiệu lực 16/01/2026)
          </p>
        </div>
      </div>

      <div className="mb-4 flex gap-2 rounded-lg border border-amber-300 bg-amber-50 p-3 text-xs text-amber-900">
        <AlertTriangle className="w-4 h-4 shrink-0 mt-0.5" />
        <p>
          Chỉ là tra cứu khung phạt theo văn bản, không phải tư vấn pháp lý. Mức phạt thực tế do cơ quan có thẩm quyền quyết
          định theo từng hồ sơ; chưa gồm tiền chậm nộp và truy thu thuế. Dữ liệu từ bản OCR Nghị định 310 còn một số điểm đang
          chờ đối chiếu PDF gốc (xem cột ghi chú).
        </p>
      </div>

      <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-5 mb-4 bg-white rounded-xl border border-slate-200 p-3">
        <label className="lg:col-span-2 text-xs text-slate-600">
          Tìm hành vi / điều khoản
          <div className="mt-1 flex items-center gap-2 rounded-lg border border-slate-300 px-2 py-1.5">
            <Search className="w-4 h-4 text-slate-400" />
            <input
              value={query}
              onChange={e => setQuery(e.target.value)}
              placeholder="vd: chậm nộp hồ sơ khai thuế, hóa đơn, Điều 24"
              className="w-full text-sm outline-none"
            />
          </div>
        </label>
        <label className="text-xs text-slate-600">
          Lĩnh vực
          <select
            value={field}
            onChange={e => setField(e.target.value)}
            className="mt-1 w-full rounded-lg border border-slate-300 px-2 py-2 text-sm"
          >
            <option value="all">Tất cả</option>
            {fields.map(f => (
              <option key={f} value={f}>{f}</option>
            ))}
          </select>
        </label>
        <label className="text-xs text-slate-600">
          Đối tượng
          <select
            value={entity}
            onChange={e => setEntity(e.target.value as Entity)}
            className="mt-1 w-full rounded-lg border border-slate-300 px-2 py-2 text-sm"
          >
            <option value="to_chuc">Tổ chức (mức trong văn bản)</option>
            <option value="ca_nhan">Cá nhân / hộ kinh doanh (1/2, Điều 5.5)</option>
          </select>
        </label>
        <label className="text-xs text-slate-600">
          Hành vi vi phạm kết thúc vào ngày
          <input
            type="date"
            value={onDate}
            onChange={e => setOnDate(e.target.value || today())}
            disabled={showAll}
            className="mt-1 w-full rounded-lg border border-slate-300 px-2 py-1.5 text-sm disabled:bg-slate-100"
          />
        </label>
        <label className="flex items-center gap-2 text-xs text-slate-700 sm:col-span-2 lg:col-span-5">
          <input type="checkbox" checked={showAll} onChange={e => setShowAll(e.target.checked)} />
          Hiện tất cả phiên bản (kể cả quy định đã bãi bỏ / thay thế)
        </label>
      </div>

      {error && <p className="mb-3 text-sm text-red-700">{error}</p>}
      {!error && rows.length === 0 && <p className="mb-3 text-sm text-slate-500">Đang tải dữ liệu…</p>}

      <p className="mb-2 text-xs text-slate-600">
        {visible.length} / {rows.length} dòng.
        {entity === 'ca_nhan' && ' Mức cá nhân = 1/2 mức tổ chức (không áp dụng cho Điều 16, 17, 18 - phạt theo tỷ lệ).'}
        {!showAll && ' Theo ngày đã chọn: hành vi đã kết thúc trước 16/01/2026 áp dụng bản cũ (Điều 3 Nghị định 310).'}
      </p>

      <div className="overflow-x-auto rounded-xl border border-slate-200 bg-white">
        <table className="min-w-full text-sm">
          <thead className="bg-slate-900 text-white text-xs">
            <tr>
              <th className="px-3 py-2 text-left whitespace-nowrap">Căn cứ</th>
              <th className="px-3 py-2 text-left">Hành vi vi phạm</th>
              <th className="px-3 py-2 text-left whitespace-nowrap">Mức phạt</th>
              <th className="px-3 py-2 text-left">Điều kiện / số lượng</th>
              <th className="px-3 py-2 text-left">Biện pháp khắc phục</th>
              <th className="px-3 py-2 text-left whitespace-nowrap">Hiệu lực</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {visible.map(r => {
              const inactive = r.trang_thai !== 'Còn hiệu lực';
              return (
                <tr key={r.id} className={inactive ? 'bg-slate-50 text-slate-500 align-top' : 'align-top'}>
                  <td className="px-3 py-2 whitespace-nowrap">
                    <div className="font-medium">{citation(r)}</div>
                    <div className="text-[10px] text-slate-500">{r.lv} · NĐ {r.nguon}</div>
                  </td>
                  <td className="px-3 py-2 min-w-[18rem]">
                    {r.hanh_vi}
                    {r.ghi_chu && <div className="mt-1 text-[11px] text-slate-500">{r.ghi_chu}</div>}
                  </td>
                  <td className="px-3 py-2 whitespace-nowrap">{amount(r)}</td>
                  <td className="px-3 py-2 min-w-[12rem] text-xs">{r.dieu_kien}</td>
                  <td className="px-3 py-2 min-w-[12rem] text-xs">{r.bien_phap_khac_phuc}</td>
                  <td className="px-3 py-2 text-xs whitespace-nowrap">
                    {fmtDate(r.hieu_luc_tu)}
                    {r.hieu_luc_den ? ` – ${fmtDate(r.hieu_luc_den)}` : ' –'}
                    {inactive && <div className="text-[10px] text-amber-700 max-w-[10rem] whitespace-normal">{r.trang_thai}</div>}
                  </td>
                </tr>
              );
            })}
          </tbody>
        </table>
      </div>

      {general.length > 0 && (
        <div className="mt-4 rounded-xl border border-slate-200 bg-white">
          <button
            onClick={() => setShowRules(v => !v)}
            className="flex w-full items-center justify-between px-4 py-3 text-sm font-semibold text-slate-800"
          >
            Nguyên tắc chung áp dụng mức phạt ({general.length})
            {showRules ? <ChevronUp className="w-4 h-4" /> : <ChevronDown className="w-4 h-4" />}
          </button>
          {showRules && (
            <ul className="divide-y divide-slate-100 border-t border-slate-100">
              {general.map(g => (
                <li key={g.chu_de} className="px-4 py-3 text-sm">
                  <div className="font-semibold text-slate-900">{g.chu_de}</div>
                  <div className="text-slate-700">{g.noi_dung}</div>
                  <div className="mt-1 text-[11px] text-slate-500">Căn cứ: {g.can_cu}</div>
                </li>
              ))}
            </ul>
          )}
        </div>
      )}
    </div>
  );
};
