import React, { useState } from 'react';
import { performTaxReasoning } from '../utils/taxReasoningEngine';
import { 
  GraduationCap, 
  Briefcase, 
  Calendar, 
  Send, 
  Sparkles, 
  AlertCircle, 
  CheckCircle2, 
  HelpCircle, 
  ArrowRight, 
  FileCheck, 
  ShieldAlert, 
  BookOpen, 
  Layers, 
  Clock, 
  Lightbulb,
  Check,
  RotateCcw
} from 'lucide-react';
import { ReasoningResult, ExactSpan, TriStateResponse } from '../types/tax-graph';

interface Props {
  onSelectSpan: (span: ExactSpan, citationIndex: number) => void;
}

export const ChatEngine: React.FC<Props> = ({ onSelectSpan }) => {
  const [mode, setMode] = useState<'learning' | 'service'>('learning');
  const [transactionDate, setTransactionDate] = useState<string>('2025-06-15');
  const [question, setQuestion] = useState<string>('');
  const [isLoading, setIsLoading] = useState<boolean>(false);
  const [result, setResult] = useState<ReasoningResult | null>(null);

  // Quiz interactive state
  const [selectedQuizOption, setSelectedQuizOption] = useState<number | null>(null);
  const [quizSubmitted, setQuizSubmitted] = useState<boolean>(false);

  const sampleQueries = [
    {
      title: 'Hóa đơn giảm thuế GTGT Hộ KD (Vé xe 450.000đ theo NQ 174/2024)',
      text: 'Hộ kinh doanh dịch vụ vận tải hành khách tính thuế GTGT theo tỷ lệ 3% trên doanh thu. Tháng 3/2025 hộ kinh doanh bán vé xe giá 450.000 đồng được giảm thuế GTGT theo Nghị quyết 174/2024/QH15. Hãy hướng dẫn cách ghi các dòng chỉ tiêu trên hóa đơn bán hàng và tính số tiền thực tế thu về của khách hàng?',
      date: '2025-03-20'
    },
    {
      title: 'Lãi vay Vietcombank (NHTM độc lập) NĐ 320/2025',
      text: 'Năm 2025 công ty tôi có phát sinh giao dịch liên kết bán hàng cho công ty mẹ. Công ty có vay 100 tỷ từ Ngân hàng TMCP Ngoại thương (Vietcombank) độc lập. Chi phí lãi vay trả cho Vietcombank năm 2025 có bị khống chế mức trần 30% EBITDA không?',
      date: '2025-06-15'
    },
    {
      title: 'Khấu trừ thuế GTGT hàng nhập khẩu Luật 48/2024',
      text: 'Tháng 8/2025 doanh nghiệp nhập khẩu 1 lô máy móc thiết bị dùng chung cho cả sản xuất phần mềm (không chịu thuế GTGT) và dịch vụ tư vấn CNTT (chịu thuế GTGT 10%). Tờ khai hải quan thông quan và đã nộp thuế GTGT nhập khẩu 200 triệu vào NSNN. Doanh thu chịu thuế là 6 tỷ, doanh thu không chịu thuế là 4 tỷ. Số thuế GTGT nhập khẩu được khấu trừ bao nhiêu theo Luật 48/2024/QH15?',
      date: '2025-08-30'
    },
    {
      title: 'Safe Abstention: Hóa đơn tiếp khách 25 triệu',
      text: 'Công ty nhận hóa đơn mua dịch vụ tiếp khách trị giá 25 triệu đồng ngày 10/10/2025. Hóa đơn điện tử có mã của cơ quan thuế hợp lệ và đúng tên, mã số thuế công ty. Khoản này có được tính vào chi phí được trừ và khấu trừ thuế GTGT không?',
      date: '2025-10-15'
    },
    {
      title: 'So sánh trần lãi vay 2024 (NĐ 132) vs 2025 (NĐ 20)',
      text: 'Vay ngân hàng độc lập năm 2024 có bị khống chế 30% EBITDA không? So sánh với quy định mới năm 2025.',
      date: '2024-12-15'
    }
  ];

  const handleRunQuery = async (queryText: string, queryDate?: string) => {
    const q = queryText || question;
    const d = queryDate || transactionDate;
    if (!q.trim()) return;

    setQuestion(q);
    if (queryDate) setTransactionDate(queryDate);
    setIsLoading(true);
    setSelectedQuizOption(null);
    setQuizSubmitted(false);

    try {
      const res = await fetch('/api/chat/reason', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          question: q,
          transactionDate: d,
          mode
        })
      });

      if (res.ok) {
        const data: ReasoningResult = await res.json();
        setResult(data);
      } else {
        // Fallback to client-side Reasoning Engine if backend API returns 404/500
        const data = performTaxReasoning(q, d, mode);
        setResult(data);
      }
    } catch (err) {
      console.warn('API call failed, running Client-side Tax GraphRAG Engine:', err);
      const data = performTaxReasoning(q, d, mode);
      setResult(data);
    } finally {
      setIsLoading(false);
    }
  };

  const getTriStateBadge = (state: TriStateResponse) => {
    switch (state) {
      case 'QUALIFIED_ANSWER':
        return (
          <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold bg-emerald-100 text-emerald-800 border border-emerald-300">
            <CheckCircle2 className="w-4 h-4 text-emerald-600" />
            QUALIFIED_ANSWER (Đủ dữ kiện & Căn cứ chuẩn xác)
          </span>
        );
      case 'CONDITIONAL_ANSWER':
        return (
          <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold bg-amber-100 text-amber-900 border border-amber-300">
            <AlertCircle className="w-4 h-4 text-amber-600" />
            CONDITIONAL_ANSWER (Safe Abstention Kích hoạt - Phân luồng điều kiện)
          </span>
        );
      case 'INSUFFICIENT_REVIEW_ESCALATE':
        return (
          <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold bg-rose-100 text-rose-900 border border-rose-300">
            <HelpCircle className="w-4 h-4 text-rose-600" />
            INSUFFICIENT_REVIEW_ESCALATE (Cần xin ý kiến CQT)
          </span>
        );
    }
  };

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6 space-y-6">
      {/* Control Bar: Mode Toggle & Temporal Date Filter */}
      <div className="bg-white rounded-xl shadow-xs border border-slate-200 p-4 flex flex-col md:flex-row md:items-center justify-between gap-4">
        {/* Mode Selector */}
        <div className="flex items-center gap-2">
          <span className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Mục tiêu:</span>
          <div className="bg-slate-100 p-1 rounded-lg flex items-center gap-1 border border-slate-200">
            <button
              onClick={() => setMode('learning')}
              className={`flex items-center gap-1.5 px-3 py-1.5 rounded-md text-xs font-medium transition-all ${
                mode === 'learning'
                  ? 'bg-amber-500 text-slate-950 font-bold shadow-xs'
                  : 'text-slate-600 hover:text-slate-900'
              }`}
            >
              <GraduationCap className="w-4 h-4" />
              Learning Mode (Học viên CPA)
            </button>
            <button
              onClick={() => setMode('service')}
              className={`flex items-center gap-1.5 px-3 py-1.5 rounded-md text-xs font-medium transition-all ${
                mode === 'service'
                  ? 'bg-slate-900 text-white font-bold shadow-xs'
                  : 'text-slate-600 hover:text-slate-900'
              }`}
            >
              <Briefcase className="w-4 h-4" />
              Service Mode (Tư vấn Doanh nghiệp)
            </button>
          </div>
        </div>

        {/* Temporal Transaction Date Filter */}
        <div className="flex items-center gap-3">
          <div className="flex items-center gap-2">
            <Calendar className="w-4 h-4 text-amber-600" />
            <label htmlFor="tx-date-input" className="text-xs font-semibold text-slate-700">Thời điểm phát sinh (Transaction Date):</label>
          </div>
          <input
            id="tx-date-input"
            type="date"
            value={transactionDate}
            onChange={(e) => setTransactionDate(e.target.value)}
            className="text-xs font-semibold bg-slate-50 border border-slate-300 text-slate-800 rounded-lg px-3 py-1.5 focus:outline-none focus:ring-2 focus:ring-amber-500"
          />
          <span className="text-[11px] px-2 py-0.5 rounded bg-blue-50 text-blue-700 border border-blue-200">
            {parseInt(transactionDate.split('-')[0], 10) >= 2025 
              ? 'Áp dụng Luật mới 2025/2026' 
              : 'Áp dụng Luật cũ 2024'}
          </span>
        </div>
      </div>

      {/* Query Input Section */}
      <div className="bg-white rounded-xl shadow-xs border border-slate-200 p-6 space-y-4">
        <div>
          <label htmlFor="tax-query-input" className="block text-sm font-bold text-slate-800 mb-1">
            Nhập nghiệp vụ / Tình huống thuế cần truy vấn & suy luận:
          </label>
          <p className="text-xs text-slate-500 mb-3">
            Engine sẽ tự động kích hoạt Temporal Knowledge Graph, đối chiếu hiệu lực tại ngày {transactionDate}, áp dụng Tri-state Response và bóc tách Exact Source Span [i].
          </p>
          <div className="relative">
            <textarea
              id="tax-query-input"
              rows={3}
              value={question}
              onChange={(e) => setQuestion(e.target.value)}
              placeholder="Ví dụ: Công ty có giao dịch liên kết, vay vốn từ Vietcombank với lãi suất thị trường. Lãi vay có bị khống chế trần 30% EBITDA không?..."
              className="w-full text-sm p-3.5 pr-28 rounded-xl border border-slate-300 focus:outline-none focus:ring-2 focus:ring-amber-500/50 focus:border-amber-500 leading-relaxed"
            />
            <button
              onClick={() => handleRunQuery(question)}
              disabled={isLoading || !question.trim()}
              className="absolute right-3 bottom-3.5 px-4 py-2 bg-amber-600 hover:bg-amber-700 disabled:bg-slate-300 text-white text-xs font-bold rounded-lg flex items-center gap-1.5 shadow-sm transition-all"
            >
              {isLoading ? (
                <>
                  <div className="w-3.5 h-3.5 border-2 border-white border-t-transparent rounded-full animate-spin" />
                  Đang suy luận...
                </>
              ) : (
                <>
                  <Send className="w-3.5 h-3.5" />
                  Tra cứu Graph
                </>
              )}
            </button>
          </div>
        </div>

        {/* Quick Sample Chips */}
        <div>
          <span className="text-xs font-semibold text-slate-500 uppercase tracking-wide block mb-2">
            Kịch bản đối soát mẫu (Golden Test Scenarios):
          </span>
          <div className="flex flex-wrap gap-2">
            {sampleQueries.map((item, idx) => (
              <button
                key={idx}
                onClick={() => handleRunQuery(item.text, item.date)}
                className="text-xs text-left px-3 py-1.5 rounded-lg bg-slate-50 hover:bg-amber-50 border border-slate-200 hover:border-amber-300 text-slate-700 hover:text-amber-900 transition-colors flex items-center gap-1.5 group"
              >
                <Sparkles className="w-3.5 h-3.5 text-amber-500 group-hover:scale-110 transition-transform" />
                <span className="font-medium">{item.title}</span>
              </button>
            ))}
          </div>
        </div>
      </div>

      {/* Result Display Section */}
      {result && (
        <div className="space-y-6 animate-in fade-in slide-in-from-bottom-2 duration-300">
          {/* Main XAI Response Card */}
          <div className="bg-white rounded-xl shadow-xs border border-slate-200 overflow-hidden">
            {/* Header with Tri-state & Execution Stats */}
            <div className="px-6 py-4 bg-slate-900 text-white flex flex-wrap items-center justify-between gap-3">
              <div className="flex items-center gap-3">
                {getTriStateBadge(result.triState)}
              </div>
              <div className="flex items-center gap-4 text-xs text-slate-300">
                <span className="flex items-center gap-1">
                  <Clock className="w-3.5 h-3.5 text-slate-300" />
                  Thời gian suy luận: {result.executionTimeMs}ms
                </span>
                <span className="flex items-center gap-1">
                  <Layers className="w-3.5 h-3.5 text-amber-400" />
                  {result.temporalFilterApplied}
                </span>
              </div>
            </div>

            <div className="p-6 space-y-6">
              {/* Part 1: KẾT LUẬN NGHĨA VỤ THUẾ */}
              <div>
                <h3 className="text-xs font-bold text-slate-400 uppercase tracking-wider mb-2 flex items-center gap-1.5">
                  <span className="w-2 h-2 rounded-full bg-amber-500" />
                  1. KẾT LUẬN NGHĨA VỤ THUẾ
                </h3>
                <div className={`p-4 rounded-xl border text-sm font-medium leading-relaxed ${
                  result.triState === 'CONDITIONAL_ANSWER'
                    ? 'bg-amber-50/70 border-amber-200 text-amber-950'
                    : 'bg-slate-50 border-slate-200 text-slate-900'
                }`}>
                  <p>{result.conclusion}</p>
                  {result.triState === 'CONDITIONAL_ANSWER' && (
                    <div className="mt-3 pt-3 border-t border-amber-200/80 grid grid-cols-1 md:grid-cols-2 gap-3 text-xs">
                      <div className="p-3 bg-white rounded-lg border border-emerald-200 text-emerald-950">
                        <span className="font-bold text-emerald-800 block mb-1">
                          ✓ Trường hợp 1: Có chứng từ thanh toán ngân hàng
                        </span>
                        Khoản chi được trừ toàn bộ vào chi phí tính thuế TNDN và được kê khai khấu trừ toàn bộ thuế GTGT đầu vào.
                      </div>
                      <div className="p-3 bg-white rounded-lg border border-rose-200 text-rose-950">
                        <span className="font-bold text-rose-800 block mb-1">
                          ✗ Trường hợp 2: Thanh toán bằng tiền mặt
                        </span>
                        Bị loại toàn bộ 100% chi phí được trừ khi quyết toán TNDN và không được khấu trừ thuế GTGT.
                      </div>
                    </div>
                  )}
                </div>
              </div>

              {/* Part 2: CĂN CỨ PHÁP LÝ & ĐƯỜNG DẪN BẰNG CHỨNG (EVIDENCE CHAIN) */}
              <div>
                <h3 className="text-xs font-bold text-slate-400 uppercase tracking-wider mb-2 flex items-center gap-1.5">
                  <span className="w-2 h-2 rounded-full bg-blue-500" />
                  2. CĂN CỨ PHÁP LÝ & ĐƯỜNG DẪN BẰNG CHỨNG (EVIDENCE CHAIN)
                </h3>
                <div className="space-y-2">
                  {result.evidenceChain.map((step, idx) => (
                    <div 
                      key={idx}
                      className="p-3 bg-slate-50 hover:bg-amber-50/60 rounded-xl border border-slate-200 transition-colors flex flex-col sm:flex-row sm:items-center justify-between gap-3 text-xs"
                    >
                      <div className="flex items-center gap-2 flex-1">
                        <span className="w-6 h-6 rounded-md bg-amber-500/10 text-amber-700 font-bold flex items-center justify-center shrink-0">
                          {step.stepIndex}
                        </span>
                        <div className="flex flex-wrap items-center gap-1.5">
                          <span className="font-semibold text-slate-800">
                            [{step.entity}]
                          </span>
                          <ArrowRight className="w-3 h-3 text-slate-400" />
                          <span className="text-slate-600">{step.concept}</span>
                          <ArrowRight className="w-3 h-3 text-slate-400" />
                          <span className="text-blue-700 font-medium">
                            {step.legalCitation}
                          </span>
                        </div>
                      </div>

                      <button
                        onClick={() => onSelectSpan(step.exactSpan, step.citationId)}
                        className="px-2.5 py-1 bg-white hover:bg-amber-100 text-amber-900 border border-amber-300 font-semibold rounded-md flex items-center gap-1 shrink-0 transition-colors shadow-2xs"
                      >
                        <BookOpen className="w-3 h-3 text-amber-600" />
                        Xem trích dẫn [{step.citationId}]
                      </button>
                    </div>
                  ))}
                </div>
              </div>

              {/* Part 3: ĐIỀU KIỆN TUÂN THỦ & CHECKLIST CHỨNG TỪ */}
              <div>
                <h3 className="text-xs font-bold text-slate-400 uppercase tracking-wider mb-2 flex items-center gap-1.5">
                  <span className="w-2 h-2 rounded-full bg-emerald-500" />
                  3. ĐIỀU KIỆN TUÂN THỦ & CHECKLIST CHỨNG TỪ
                </h3>
                <div className="bg-slate-50 rounded-xl border border-slate-200 overflow-hidden text-xs">
                  <table className="w-full text-left border-collapse">
                    <thead>
                      <tr className="bg-slate-100 border-b border-slate-200 text-slate-700 font-semibold">
                        <th className="p-3 w-10 text-center">STT</th>
                        <th className="p-3">Hồ sơ / Chứng từ bắt buộc</th>
                        <th className="p-3 w-36">Trạng thái rà soát</th>
                        <th className="p-3">Lưu ý kiểm toán / CQT</th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-slate-200">
                      {result.complianceChecklist.map((row, idx) => (
                        <tr key={idx} className="hover:bg-white transition-colors">
                          <td className="p-3 text-center text-slate-500 font-medium">{idx + 1}</td>
                          <td className="p-3 font-semibold text-slate-800 flex items-center gap-2">
                            <FileCheck className="w-3.5 h-3.5 text-emerald-600 shrink-0" />
                            {row.item}
                          </td>
                          <td className="p-3">
                            <span className={`px-2 py-0.5 rounded text-[11px] font-semibold inline-flex items-center gap-1 ${
                              row.verificationStatus === 'Satisfied'
                                ? 'bg-emerald-100 text-emerald-800'
                                : row.verificationStatus === 'Missing'
                                ? 'bg-rose-100 text-rose-800'
                                : 'bg-amber-100 text-amber-800'
                            }`}>
                              {row.verificationStatus === 'Satisfied' ? '✓ Đạt' : row.verificationStatus === 'Missing' ? '✗ Thiếu' : '⚠ Có điều kiện'}
                            </span>
                          </td>
                          <td className="p-3 text-slate-600">{row.auditNote}</td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>

              {/* Part 4: CẢNH BÁO RỦI RO & BẪY THUẾ (AUDIT WARNING) */}
              <div>
                <h3 className="text-xs font-bold text-slate-400 uppercase tracking-wider mb-2 flex items-center gap-1.5">
                  <span className="w-2 h-2 rounded-full bg-rose-500" />
                  4. CẢNH BÁO RỦI RO & BẪY THUẾ (AUDIT WARNING)
                </h3>
                <div className="p-4 rounded-xl bg-rose-50/60 border border-rose-200 text-xs text-rose-950 space-y-2">
                  <div className="flex items-center gap-2 font-bold text-rose-900 text-sm">
                    <ShieldAlert className="w-4 h-4 text-rose-600" />
                    {result.auditWarning.riskTitle}
                  </div>
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-3 pt-1">
                    <div>
                      <span className="font-semibold text-rose-900">Rủi ro xử phạt thuế:</span>{' '}
                      {result.auditWarning.penaltyRisk}
                    </div>
                    <div>
                      <span className="font-semibold text-rose-900">Tiền chậm nộp:</span>{' '}
                      {result.auditWarning.interestRate}
                    </div>
                  </div>
                  <div className="pt-2 border-t border-rose-200/60 text-slate-700">
                    <span className="font-semibold text-slate-900">Hành động khắc phục đề xuất:</span>{' '}
                    {result.auditWarning.recommendedAction}
                  </div>
                </div>
              </div>
            </div>
          </div>

          {/* Learning Mode Addon: Exam Traps, Flashcards & Practice Quiz */}
          {mode === 'learning' && result.learningModeAddon && (
            <div className="bg-amber-500/10 rounded-xl border border-amber-300/80 p-6 space-y-6">
              <div className="flex items-center justify-between border-b border-amber-200 pb-3">
                <div className="flex items-center gap-2">
                  <GraduationCap className="w-5 h-5 text-amber-700" />
                  <h3 className="font-bold text-base text-amber-950">
                    Góc Học viên CPA: Phân tích Bẫy đề thi & Luyện tập Atomic LOs
                  </h3>
                </div>
                <div className="flex items-center gap-2">
                  {result.learningModeAddon.atomicLOs.map((lo, i) => (
                    <span key={i} className="px-2.5 py-1 rounded bg-amber-200/80 text-amber-900 font-mono text-xs font-semibold">
                      {lo}
                    </span>
                  ))}
                </div>
              </div>

              {/* Exam Trap Analysis */}
              <div className="bg-white rounded-lg p-4 border border-amber-200 shadow-2xs">
                <div className="flex items-center gap-2 font-bold text-amber-900 text-xs uppercase mb-1">
                  <Lightbulb className="w-4 h-4 text-amber-600" />
                  Phân tích Bẫy đề thi CPA Việt Nam (Exam Traps):
                </div>
                <p className="text-xs text-slate-800 leading-relaxed font-medium">
                  {result.learningModeAddon.examTrapAnalysis}
                </p>
              </div>

              {/* Practice Quiz */}
              {result.learningModeAddon.quizQuestion && (
                <div className="bg-white rounded-lg p-5 border border-amber-200 shadow-2xs space-y-3">
                  <div className="flex items-center justify-between">
                    <span className="text-xs font-bold uppercase text-slate-700 tracking-wider">
                      Câu hỏi kiểm tra nhanh (Atomic Quiz)
                    </span>
                    <span className="text-xs text-amber-700 font-medium">
                      Bẫy: {result.learningModeAddon.quizQuestion.trapHint}
                    </span>
                  </div>

                  <p className="text-xs font-semibold text-slate-900">
                    {result.learningModeAddon.quizQuestion.scenario}
                  </p>

                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-2 pt-1">
                    {result.learningModeAddon.quizQuestion.options.map((opt, optIdx) => {
                      const isSelected = selectedQuizOption === optIdx;
                      const isCorrect = optIdx === result.learningModeAddon?.quizQuestion?.correctIndex;
                      
                      let btnClass = 'bg-slate-50 hover:bg-slate-100 border-slate-200 text-slate-800';
                      if (quizSubmitted) {
                        if (isCorrect) {
                          btnClass = 'bg-emerald-100 border-emerald-400 text-emerald-950 font-bold';
                        } else if (isSelected && !isCorrect) {
                          btnClass = 'bg-rose-100 border-rose-400 text-rose-950';
                        }
                      } else if (isSelected) {
                        btnClass = 'bg-amber-100 border-amber-400 text-amber-950 font-semibold';
                      }

                      return (
                        <button
                          key={optIdx}
                          disabled={quizSubmitted}
                          onClick={() => setSelectedQuizOption(optIdx)}
                          className={`p-3 rounded-lg border text-left text-xs transition-all flex items-center justify-between ${btnClass}`}
                        >
                          <span>{opt}</span>
                          {quizSubmitted && isCorrect && (
                            <Check className="w-4 h-4 text-emerald-600 shrink-0" />
                          )}
                        </button>
                      );
                    })}
                  </div>

                  <div className="flex items-center justify-between pt-2">
                    {!quizSubmitted ? (
                      <button
                        disabled={selectedQuizOption === null}
                        onClick={() => setQuizSubmitted(true)}
                        className="px-4 py-1.5 rounded-lg bg-amber-600 hover:bg-amber-700 disabled:bg-slate-200 text-white text-xs font-bold transition-colors"
                      >
                        Kiểm tra đáp án
                      </button>
                    ) : (
                      <div className="flex items-center gap-3">
                        <span className={`text-xs font-bold ${
                          selectedQuizOption === result.learningModeAddon.quizQuestion.correctIndex
                            ? 'text-emerald-700'
                            : 'text-rose-700'
                        }`}>
                          {selectedQuizOption === result.learningModeAddon.quizQuestion.correctIndex
                            ? '✓ Chính xác! Bạn đã vượt qua bẫy đề thi.'
                            : '✗ Chưa đúng! Hãy xem lời giải chi tiết bên dưới.'}
                        </span>
                        <button
                          onClick={() => {
                            setQuizSubmitted(false);
                            setSelectedQuizOption(null);
                          }}
                          className="text-xs text-slate-500 hover:text-slate-800 flex items-center gap-1"
                        >
                          <RotateCcw className="w-3 h-3" />
                          Làm lại
                        </button>
                      </div>
                    )}
                  </div>

                  {quizSubmitted && (
                    <div className="p-3 bg-emerald-50 rounded-md border border-emerald-200 text-xs text-emerald-900">
                      <span className="font-bold">Giải thích chuẩn xác:</span>{' '}
                      {result.learningModeAddon.quizQuestion.explanation}
                    </div>
                  )}
                </div>
              )}
            </div>
          )}
        </div>
      )}
    </div>
  );
};
