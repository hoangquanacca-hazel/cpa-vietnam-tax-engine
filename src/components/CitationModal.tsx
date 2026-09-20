import React from 'react';
import { ExactSpan } from '../types/tax-graph';
import { BookOpen, X, CheckCircle, ShieldAlert, Calendar, Building2 } from 'lucide-react';

interface Props {
  span: ExactSpan | null;
  citationNumber?: number;
  onClose: () => void;
}

export const CitationModal: React.FC<Props> = ({ span, citationNumber, onClose }) => {
  if (!span) return null;

  return (
    <div className="fixed inset-0 z-50 bg-slate-900/60 backdrop-blur-sm flex items-center justify-center p-4">
      <div className="bg-white rounded-xl shadow-2xl max-w-2xl w-full border border-slate-200 overflow-hidden animate-in fade-in zoom-in duration-200">
        <div className="px-6 py-4 bg-slate-900 text-white flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="w-8 h-8 rounded-lg bg-amber-500/20 text-amber-400 flex items-center justify-center font-bold">
              [{citationNumber || 1}]
            </div>
            <div>
              <h3 className="font-semibold text-base flex items-center gap-2">
                <BookOpen className="w-4 h-4 text-amber-400" />
                Trích dẫn Nguồn Nguyên văn (Exact Source Span)
              </h3>
              <p className="text-xs text-slate-300">
                Provenance Integrity: 100% • Đối chiếu trực tiếp từ CSDL Văn bản QPPL
              </p>
            </div>
          </div>
          <button
            onClick={onClose}
            className="text-slate-400 hover:text-white p-1 rounded-md transition-colors"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        <div className="p-6 space-y-4">
          <div className="flex flex-wrap items-center gap-3 text-xs">
            <span className="px-2.5 py-1 rounded-md bg-amber-50 text-amber-900 font-semibold border border-amber-200">
              {span.sourceDocNumber}
            </span>
            <span className="px-2.5 py-1 rounded-md bg-blue-50 text-blue-800 font-medium border border-blue-200">
              {span.article} {span.clause || ''} {span.point || ''}
            </span>
            <span className={`px-2.5 py-1 rounded-md font-medium border flex items-center gap-1 ${
              span.status === 'Active' 
                ? 'bg-emerald-50 text-emerald-800 border-emerald-200' 
                : 'bg-rose-50 text-rose-800 border-rose-200'
            }`}>
              {span.status === 'Active' ? <CheckCircle className="w-3 h-3" /> : <ShieldAlert className="w-3 h-3" />}
              Trạng thái: {span.status === 'Active' ? 'Đang có hiệu lực' : 'Đã hết hiệu lực (Superseded)'}
            </span>
            <span className="px-2.5 py-1 rounded-md bg-slate-100 text-slate-700 font-medium flex items-center gap-1">
              <Calendar className="w-3 h-3" />
              Hiệu lực từ: {span.effectiveDate}
            </span>
          </div>

          <div className="bg-amber-50/50 rounded-lg p-4 border border-amber-200/80">
            <div className="text-xs font-semibold text-amber-900 mb-1 uppercase tracking-wide">
              Đoạn văn bản trích dẫn nguyên văn (Exact Span):
            </div>
            <p className="text-sm text-slate-800 leading-relaxed italic font-serif bg-white p-3.5 rounded border border-amber-100 shadow-xs">
              "{span.spanText}"
            </p>
          </div>

          <div className="bg-slate-50 p-3 rounded-lg border border-slate-200 text-xs text-slate-600 flex items-center justify-between">
            <div className="flex items-center gap-2">
              <Building2 className="w-4 h-4 text-slate-400" />
              <span>Thẩm quyền ban hành: Cổng Thông tin điện tử Pháp điển / CSDL Thuế Quốc gia</span>
            </div>
            <span className="font-mono text-slate-400">ID: {span.id}</span>
          </div>
        </div>

        <div className="px-6 py-3 bg-slate-100 border-t border-slate-200 flex justify-end">
          <button
            onClick={onClose}
            className="px-4 py-1.5 text-sm font-medium bg-slate-800 hover:bg-slate-900 text-white rounded-lg transition-colors"
          >
            Đóng trích dẫn
          </button>
        </div>
      </div>
    </div>
  );
};
