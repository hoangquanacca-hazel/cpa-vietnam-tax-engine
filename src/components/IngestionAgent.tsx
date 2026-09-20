import React, { useState } from 'react';
import { 
  FileUp, 
  Sparkles, 
  Copy, 
  Check, 
  Database, 
  ArrowRight, 
  Layers, 
  Calendar, 
  CheckCircle2, 
  GitBranch, 
  Code2,
  BookmarkPlus
} from 'lucide-react';
import { RegulatoryType, IngestionDocumentInput, IngestionResult } from '../types/tax-graph';

interface Props {
  onGraphUpdated?: () => void;
}

export const IngestionAgent: React.FC<Props> = ({ onGraphUpdated }) => {
  const [docType, setDocType] = useState<RegulatoryType>('DECREE');
  const [docNumber, setDocNumber] = useState<string>('320/2025/NĐ-CP');
  const [title, setTitle] = useState<string>('Nghị định 320/2025/NĐ-CP sửa đổi quy định chi phí lãi vay NHTM độc lập');
  const [authority, setAuthority] = useState<string>('Chính phủ');
  const [promulgationDate, setPromulgationDate] = useState<string>('2025-03-15');
  const [effectiveDate, setEffectiveDate] = useState<string>('2025-04-01');
  const [replacesDocNumber, setReplacesDocNumber] = useState<string>('132/2020/NĐ-CP');
  const [amendsDocNumber, setAmendsDocNumber] = useState<string>('20/2025/NĐ-CP');
  const [businessEvent, setBusinessEvent] = useState<string>('EVENT_AFFILIATED_LOAN');
  const [accountingAccount, setAccountingAccount] = useState<string>('TK_635');
  const [rawText, setRawText] = useState<string>(
    'Trường hợp người nộp thuế có phát sinh giao dịch liên kết nhưng khoản vay được cấp bởi các tổ chức tín dụng, chi nhánh ngân hàng nước ngoài hoạt động hợp pháp tại Việt Nam độc lập và không phải là bên liên kết, thì chi phí lãi vay phát sinh từ các khoản vay ngân hàng độc lập này được xem xét loại trừ khỏi phạm vi khống chế mức trần 30% EBITDA nếu đáp ứng đầy đủ hồ sơ thẩm định tín dụng.'
  );

  const [isLoading, setIsLoading] = useState<boolean>(false);
  const [ingestionResult, setIngestionResult] = useState<IngestionResult | null>(null);
  const [copied, setCopied] = useState<boolean>(false);

  const presets = [
    {
      label: 'NĐ 180/2024/NĐ-CP (Giảm thuế GTGT 6T đầu 2025 theo NQ 174/2024)',
      type: 'DECREE' as RegulatoryType,
      num: '180/2024/NĐ-CP',
      title: 'Nghị định 180/2024/NĐ-CP quy định chính sách giảm thuế GTGT theo Nghị quyết 174/2024/QH15',
      auth: 'Chính phủ',
      pDate: '2024-12-31',
      eDate: '2025-01-01',
      amends: '',
      replaces: '',
      event: 'EVENT_ISSUE_INVOICE_VAT_REDUCTION_DIRECT_HOUSEHOLD',
      acc: 'DOANH_THU_HKD',
      text: 'Giảm 2% thuế suất thuế GTGT (xuống 8%) đối với nhóm hàng hóa, dịch vụ đang áp dụng mức 10%. Đối với cơ sở kinh doanh (bao gồm hộ, cá nhân kinh doanh) tính thuế GTGT theo phương pháp tỷ lệ % trên doanh thu được giảm 20% mức tỷ lệ % để tính thuế GTGT khi xuất hóa đơn bán hàng: Dòng "Thành tiền" ghi đủ giá trước giảm; dòng "Cộng tiền hàng hóa, dịch vụ" ghi số đã giảm 20% mức tỷ lệ %; ghi chú: "đã giảm... tương ứng 20% mức tỷ lệ % để tính thuế GTGT theo Nghị quyết số 174/2024/QH15".'
    },
    {
      label: 'NĐ 174/2025/NĐ-CP (Gia hạn giảm thuế 6T cuối 2025 theo NQ 204/2025)',
      type: 'DECREE' as RegulatoryType,
      num: '174/2025/NĐ-CP',
      title: 'Nghị định 174/2025/NĐ-CP quy định chính sách giảm thuế GTGT 6 tháng cuối năm 2025',
      auth: 'Chính phủ',
      pDate: '2025-06-30',
      eDate: '2025-07-01',
      amends: '',
      replaces: '180/2024/NĐ-CP',
      event: 'EVENT_ISSUE_INVOICE_VAT_REDUCTION_DIRECT_HOUSEHOLD',
      acc: 'DOANH_THU_HKD',
      text: 'Gia hạn chính sách giảm thuế GTGT 2% áp dụng từ ngày 01/07/2025 đến hết ngày 31/12/2025 theo Nghị quyết số 204/2025/QH15 của Quốc hội. Thay thế Nghị định số 180/2024/NĐ-CP hết hiệu lực từ 01/07/2025.'
    },
    {
      label: 'NĐ 320/2025/NĐ-CP (Ngoại lệ lãi vay NHTM độc lập)',
      type: 'DECREE' as RegulatoryType,
      num: '320/2025/NĐ-CP',
      title: 'Nghị định 320/2025/NĐ-CP bổ sung ngoại lệ lãi vay ngân hàng thương mại độc lập',
      auth: 'Chính phủ',
      pDate: '2025-03-15',
      eDate: '2025-04-01',
      amends: '20/2025/NĐ-CP',
      replaces: '',
      event: 'EVENT_AFFILIATED_LOAN',
      acc: 'TK_635',
      text: 'Trường hợp người nộp thuế có phát sinh giao dịch liên kết nhưng khoản vay được cấp bởi các tổ chức tín dụng độc lập không phải là bên liên kết, thì chi phí lãi vay này được loại trừ khỏi phạm vi khống chế 30% EBITDA.'
    },
    {
      label: 'Luật GTGT 48/2024/QH15 (Quy định thuế GTGT nhập khẩu)',
      type: 'LAW' as RegulatoryType,
      num: '48/2024/QH15',
      title: 'Luật Thuế Giá trị gia tăng 48/2024/QH15',
      auth: 'Quốc hội',
      pDate: '2024-11-28',
      eDate: '2025-07-01',
      amends: '',
      replaces: '13/2008/QH12',
      event: 'EVENT_IMPORT_GOODS',
      acc: 'TK_1331',
      text: 'Chứng từ nộp thuế giá trị gia tăng ở khâu nhập khẩu là căn cứ khấu trừ thuế giá trị gia tăng đầu vào của kỳ tính thuế phát sinh việc nộp thuế, với điều kiện đã hoàn thành nghĩa vụ nộp thuế vào Kho bạc Nhà nước.'
    }
  ];

  const handleApplyPreset = (p: typeof presets[0]) => {
    setDocType(p.type);
    setDocNumber(p.num);
    setTitle(p.title);
    setAuthority(p.auth);
    setPromulgationDate(p.pDate);
    setEffectiveDate(p.eDate);
    setAmendsDocNumber(p.amends);
    setReplacesDocNumber(p.replaces);
    setBusinessEvent(p.event);
    setAccountingAccount(p.acc);
    setRawText(p.text);
  };

  const handleExecuteIngestion = async () => {
    setIsLoading(true);
    try {
      const payload: IngestionDocumentInput = {
        docType,
        docNumber,
        title,
        issuingAuthority: authority,
        promulgationDate,
        effectiveDate,
        replacesDocNumber: replacesDocNumber || undefined,
        amendsDocNumber: amendsDocNumber || undefined,
        businessEventTarget: businessEvent,
        accountingAccountTarget: accountingAccount,
        rawText
      };

      const res = await fetch('/api/ingest', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });

      if (!res.ok) throw new Error('Ingestion failed');
      const data: IngestionResult = await res.json();
      setIngestionResult(data);
      if (onGraphUpdated) onGraphUpdated();
    } catch (e) {
      console.error(e);
    } finally {
      setIsLoading(false);
    }
  };

  const handleCopyCypher = () => {
    if (!ingestionResult) return;
    navigator.clipboard.writeText(ingestionResult.cypherStatements.join('\n'));
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6 space-y-6">
      {/* Overview Banner */}
      <div className="bg-slate-900 text-white rounded-xl p-6 shadow-sm border border-slate-800">
        <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
          <div>
            <div className="flex items-center gap-2 mb-1">
              <FileUp className="w-5 h-5 text-amber-400" />
              <h2 className="text-base font-bold">
                Antigravity Ingestion Agent: Multi-Tax Ingestion & Temporal Graph Update
              </h2>
            </div>
            <p className="text-xs text-slate-300 max-w-3xl leading-relaxed">
              Quy trình 4 bước bóc tách tự động: Cataloging & Temporal Versioning (<code className="text-amber-300 font-mono">[:AMENDS], [:REPLACES]</code>) 
              → Atomic LO & Compliance Extraction → Bridge Mapping (<code className="text-amber-300 font-mono">[:MAPS_TO_EVENT], [:MAPS_TO_ACCOUNT]</code>) 
              → Xuất Cypher statements sẵn sàng nạp vào Neo4j.
            </p>
          </div>

          <div className="flex items-center gap-2">
            <span className="px-3 py-1.5 rounded-lg bg-amber-500/20 text-amber-300 border border-amber-500/40 text-xs font-semibold flex items-center gap-1.5">
              <Database className="w-3.5 h-3.5" />
              Neo4j Temporal Pipeline Ready
            </span>
          </div>
        </div>

        {/* Preset Document Picker */}
        <div className="mt-4 pt-4 border-t border-slate-800 flex flex-wrap items-center gap-2">
          <span className="text-xs text-slate-400 font-medium">Chọn tài liệu mẫu:</span>
          {presets.map((p, i) => (
            <button
              key={i}
              onClick={() => handleApplyPreset(p)}
              className="text-xs px-2.5 py-1 rounded bg-slate-800 hover:bg-amber-600/30 hover:text-amber-200 border border-slate-700 text-slate-300 transition-colors"
            >
              {p.label}
            </button>
          ))}
        </div>
      </div>

      {/* Form: 4 Steps */}
      <div className="grid grid-cols-1 lg:grid-cols-12 gap-6">
        {/* Left Side: Document Inputs */}
        <div className="lg:col-span-7 bg-white rounded-xl shadow-xs border border-slate-200 p-6 space-y-5">
          <h3 className="text-xs font-bold uppercase tracking-wider text-slate-500 flex items-center gap-2">
            <Layers className="w-4 h-4 text-amber-600" />
            Bước 1, 2 & 3: Khai báo thông tin văn bản & Tầng kết nối
          </h3>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div>
              <label htmlFor="doc-type-select" className="block text-xs font-bold text-slate-700 mb-1">Loại văn bản (Doc Type)</label>
              <select
                id="doc-type-select"
                value={docType}
                onChange={(e) => setDocType(e.target.value as RegulatoryType)}
                className="w-full text-xs p-2 rounded-lg border border-slate-300 bg-slate-50 font-semibold focus:outline-none focus:ring-2 focus:ring-amber-500"
              >
                <option value="LAW">LAW (Luật)</option>
                <option value="DECREE">DECREE (Nghị định)</option>
                <option value="CIRCULAR">CIRCULAR (Thông tư)</option>
                <option value="OFFICIAL_DISPATCH">OFFICIAL_DISPATCH (Công văn)</option>
              </select>
            </div>

            <div>
              <label htmlFor="doc-number-input" className="block text-xs font-bold text-slate-700 mb-1">Số hiệu văn bản (Number)</label>
              <input
                id="doc-number-input"
                type="text"
                value={docNumber}
                onChange={(e) => setDocNumber(e.target.value)}
                placeholder="VD: 320/2025/NĐ-CP"
                className="w-full text-xs p-2 rounded-lg border border-slate-300 bg-slate-50 font-semibold focus:outline-none focus:ring-2 focus:ring-amber-500"
              />
            </div>
          </div>

          <div>
            <label htmlFor="doc-title-input" className="block text-xs font-bold text-slate-700 mb-1">Tiêu đề / Trích yếu văn bản</label>
            <input
              id="doc-title-input"
              type="text"
              value={title}
              onChange={(e) => setTitle(e.target.value)}
              placeholder="VD: Nghị định sửa đổi chi phí lãi vay giao dịch liên kết..."
              className="w-full text-xs p-2 rounded-lg border border-slate-300 bg-slate-50 focus:outline-none focus:ring-2 focus:ring-amber-500"
            />
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
            <div>
              <label htmlFor="authority-input" className="block text-xs font-bold text-slate-700 mb-1">Cơ quan ban hành</label>
              <input
                id="authority-input"
                type="text"
                value={authority}
                onChange={(e) => setAuthority(e.target.value)}
                className="w-full text-xs p-2 rounded-lg border border-slate-300 bg-slate-50 focus:outline-none focus:ring-2 focus:ring-amber-500"
              />
            </div>
            <div>
              <label htmlFor="effective-date-input" className="block text-xs font-bold text-slate-700 mb-1">Ngày có hiệu lực</label>
              <input
                id="effective-date-input"
                type="date"
                value={effectiveDate}
                onChange={(e) => setEffectiveDate(e.target.value)}
                className="w-full text-xs p-2 rounded-lg border border-slate-300 bg-slate-50 font-semibold focus:outline-none focus:ring-2 focus:ring-amber-500"
              />
            </div>
            <div>
              <label htmlFor="promulgation-date-input" className="block text-xs font-bold text-slate-700 mb-1">Ngày ban hành</label>
              <input
                id="promulgation-date-input"
                type="date"
                value={promulgationDate}
                onChange={(e) => setPromulgationDate(e.target.value)}
                className="w-full text-xs p-2 rounded-lg border border-slate-300 bg-slate-50 focus:outline-none focus:ring-2 focus:ring-amber-500"
              />
            </div>
          </div>

          {/* Temporal Versioning: AMENDS / REPLACES */}
          <div className="p-3.5 bg-amber-50/60 rounded-xl border border-amber-200 space-y-3">
            <div className="text-xs font-bold text-amber-950 flex items-center gap-1.5">
              <GitBranch className="w-3.5 h-3.5 text-amber-700" />
              Bước 1: Temporal Versioning (Quan hệ pháp lý phiên bản)
            </div>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
              <div>
                <label htmlFor="replaces-doc-input" className="block text-[11px] font-semibold text-slate-700 mb-1">
                  Thay thế văn bản cũ ([:REPLACES] → Auto Superseded):
                </label>
                <input
                  id="replaces-doc-input"
                  type="text"
                  value={replacesDocNumber}
                  onChange={(e) => setReplacesDocNumber(e.target.value)}
                  placeholder="VD: 132/2020/NĐ-CP (nếu có)"
                  className="w-full text-xs p-1.5 rounded-md border border-slate-300 bg-white"
                />
              </div>
              <div>
                <label htmlFor="amends-doc-input" className="block text-[11px] font-semibold text-slate-700 mb-1">
                  Sửa đổi/Bổ sung cho ([:AMENDS]):
                </label>
                <input
                  id="amends-doc-input"
                  type="text"
                  value={amendsDocNumber}
                  onChange={(e) => setAmendsDocNumber(e.target.value)}
                  placeholder="VD: 20/2025/NĐ-CP (nếu có)"
                  className="w-full text-xs p-1.5 rounded-md border border-slate-300 bg-white"
                />
              </div>
            </div>
          </div>

          {/* Bridge Mapping */}
          <div className="p-3.5 bg-indigo-50/60 rounded-xl border border-indigo-200 space-y-3">
            <div className="text-xs font-bold text-indigo-950 flex items-center gap-1.5">
              <BookmarkPlus className="w-3.5 h-3.5 text-indigo-700" />
              Bước 3: The Bridge Mapping (Nối dây liên module)
            </div>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
              <div>
                <label htmlFor="business-event-select" className="block text-[11px] font-semibold text-slate-700 mb-1">
                  Nghiệp vụ neo [:MAPS_TO_EVENT]:
                </label>
                <select
                  id="business-event-select"
                  value={businessEvent}
                  onChange={(e) => setBusinessEvent(e.target.value)}
                  className="w-full text-xs p-1.5 rounded-md border border-slate-300 bg-white font-mono"
                >
                  <option value="EVENT_AFFILIATED_LOAN">EVENT_AFFILIATED_LOAN</option>
                  <option value="EVENT_PAY_INTEREST">EVENT_PAY_INTEREST</option>
                  <option value="EVENT_IMPORT_GOODS">EVENT_IMPORT_GOODS</option>
                  <option value="EVENT_CASH_EXPENSE_OVER_20M">EVENT_CASH_EXPENSE_OVER_20M</option>
                  <option value="EVENT_PAY_TAX">EVENT_PAY_TAX</option>
                </select>
              </div>

              <div>
                <label htmlFor="accounting-account-select" className="block text-[11px] font-semibold text-slate-700 mb-1">
                  Mã tài khoản kế toán [:MAPS_TO_ACCOUNT]:
                </label>
                <select
                  id="accounting-account-select"
                  value={accountingAccount}
                  onChange={(e) => setAccountingAccount(e.target.value)}
                  className="w-full text-xs p-1.5 rounded-md border border-slate-300 bg-white font-mono font-bold text-indigo-800"
                >
                  <option value="TK_635">TK 635 (Chi phí tài chính)</option>
                  <option value="TK_1331">TK 1331 (Thuế GTGT khấu trừ HHDV)</option>
                  <option value="TK_3331">TK 3331 (Thuế GTGT phải nộp)</option>
                  <option value="TK_211">TK 211 (Tài sản cố định hữu hình)</option>
                  <option value="TK_112">TK 112 (Tiền gửi ngân hàng)</option>
                </select>
              </div>
            </div>
          </div>

          {/* Raw Text for LO & Span Extraction */}
          <div>
            <label htmlFor="raw-legal-text-input" className="block text-xs font-bold text-slate-700 mb-1">
              Đoạn văn bản quy định thuế (Raw Text Span để bóc tách Atomic LO):
            </label>
            <textarea
              id="raw-legal-text-input"
              rows={4}
              value={rawText}
              onChange={(e) => setRawText(e.target.value)}
              className="w-full text-xs p-3 rounded-xl border border-slate-300 bg-slate-50 font-serif leading-relaxed focus:outline-none focus:ring-2 focus:ring-amber-500"
            />
          </div>

          <button
            onClick={handleExecuteIngestion}
            disabled={isLoading || !docNumber || !rawText}
            className="w-full py-2.5 px-4 bg-amber-600 hover:bg-amber-700 disabled:bg-slate-300 text-white text-xs font-bold rounded-xl flex items-center justify-center gap-2 shadow-sm transition-all"
          >
            {isLoading ? (
              <>
                <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" />
                Đang cataloging, trích xuất Atomic LO & sinh Cypher...
              </>
            ) : (
              <>
                <Sparkles className="w-4 h-4" />
                Thực thi Ingestion & Cập nhật Temporal Knowledge Graph
              </>
            )}
          </button>
        </div>

        {/* Right Side: Step 4 Cypher Output & Ingestion Result */}
        <div className="lg:col-span-5 space-y-4">
          <div className="bg-slate-900 text-white rounded-xl shadow-md border border-slate-800 p-5 space-y-4">
            <div className="flex items-center justify-between border-b border-slate-800 pb-3">
              <div className="flex items-center gap-2">
                <Code2 className="w-4 h-4 text-emerald-400" />
                <h4 className="text-xs font-bold uppercase tracking-wider text-slate-200">
                  Bước 4: Cypher Statements cho Neo4j
                </h4>
              </div>

              {ingestionResult && (
                <button
                  onClick={handleCopyCypher}
                  className="px-2.5 py-1 rounded bg-slate-800 hover:bg-slate-700 text-xs text-amber-300 flex items-center gap-1 border border-slate-700 transition-colors"
                >
                  {copied ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
                  {copied ? 'Đã sao chép' : 'Sao chép Cypher'}
                </button>
              )}
            </div>

            {ingestionResult ? (
              <div className="space-y-4">
                {/* Cataloging Summary */}
                <div className="bg-slate-800/80 p-3 rounded-lg border border-slate-700 text-xs space-y-1.5">
                  <div className="flex items-center justify-between">
                    <span className="text-slate-400">Văn bản đã nạp:</span>
                    <span className="font-bold text-amber-400">{ingestionResult.cataloging.docNumber}</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-slate-400">Quan hệ phiên bản:</span>
                    <span className="text-emerald-400 font-semibold">{ingestionResult.cataloging.relationshipCreated}</span>
                  </div>
                  {ingestionResult.cataloging.supersededDoc && (
                    <div className="flex items-center justify-between text-rose-300">
                      <span>Đánh dấu hết hiệu lực:</span>
                      <span className="font-mono">{ingestionResult.cataloging.supersededDoc}</span>
                    </div>
                  )}
                </div>

                {/* Extracted LOs */}
                <div className="bg-slate-800/60 p-3 rounded-lg border border-slate-700 text-xs space-y-2">
                  <span className="text-xs font-bold text-amber-300 uppercase block">
                    Atomic LO Đã bóc tách:
                  </span>
                  {ingestionResult.extractedLOs.map((lo, i) => (
                    <div key={i} className="space-y-1 text-slate-300">
                      <div className="font-mono text-emerald-400 font-bold">{lo.lo_id}</div>
                      <div className="text-[11px] text-slate-400">Khái niệm: {lo.tax_concept}</div>
                      <div className="text-[11px] text-indigo-300">
                        Map: {lo.maps_to_event} → {lo.maps_to_account}
                      </div>
                    </div>
                  ))}
                </div>

                {/* Cypher Script View */}
                <div className="bg-black/60 p-3.5 rounded-lg border border-slate-800 font-mono text-[11px] text-emerald-400 max-h-72 overflow-y-auto leading-relaxed whitespace-pre-wrap">
                  {ingestionResult.cypherStatements.join('\n')}
                </div>

                <div className="p-2.5 rounded bg-emerald-950/40 border border-emerald-500/30 text-emerald-300 text-xs flex items-center gap-2">
                  <CheckCircle2 className="w-4 h-4 text-emerald-400 shrink-0" />
                  <span>Đã cập nhật tự động vào CSDL In-Memory Temporal Graph!</span>
                </div>
              </div>
            ) : (
              <div className="text-center py-12 text-slate-400 text-xs space-y-2">
                <Code2 className="w-8 h-8 text-slate-600 mx-auto" />
                <p>Chưa thực thi Ingestion.</p>
                <p className="text-[11px] text-slate-300">
                  Nhấn nút "Thực thi Ingestion" ở bên trái để bóc tách và sinh Cypher query tự động.
                </p>
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};
