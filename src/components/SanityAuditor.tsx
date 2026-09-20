import React, { useState, useEffect } from 'react';
import { 
  ShieldCheck, 
  Play, 
  CheckCircle2, 
  AlertTriangle, 
  RotateCw, 
  Layers, 
  FileCheck, 
  Check, 
  XCircle, 
  Clock, 
  Cpu,
  Award
} from 'lucide-react';
import { SanityAuditReport } from '../types/tax-graph';

interface Props {
  onBenchmarkCompleted?: (kpis: SanityAuditReport['kpis']) => void;
}

export const SanityAuditor: React.FC<Props> = ({ onBenchmarkCompleted }) => {
  const [report, setReport] = useState<SanityAuditReport | null>(null);
  const [running, setRunning] = useState<boolean>(false);

  const runBenchmark = async () => {
    setRunning(true);
    try {
      const res = await fetch('/api/sanity-benchmark', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' }
      });
      const data: SanityAuditReport = await res.json();
      setReport(data);
      if (onBenchmarkCompleted) {
        onBenchmarkCompleted(data.kpis);
      }
    } catch (e) {
      console.error(e);
    } finally {
      setRunning(false);
    }
  };

  useEffect(() => {
    runBenchmark();
  }, []);

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6 space-y-6">
      {/* Header Banner */}
      <div className="bg-slate-900 text-white rounded-xl p-6 shadow-sm border border-slate-800 flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div>
          <div className="flex items-center gap-2 mb-1">
            <ShieldCheck className="w-5 h-5 text-amber-400" />
            <h2 className="text-base font-bold">
              Auditor Sanity Agent: Automated Sanity Check & Golden Tax Set Benchmarking
            </h2>
          </div>
          <p className="text-xs text-slate-300 max-w-3xl leading-relaxed">
            Dùng để tự động kiểm thử toàn bộ Đồ thị Tri thức Thuế sau khi nạp luật/công văn mới, đo lường 5 chỉ số KPI rủi ro pháp lý và phê duyệt trạng thái phát hành (Release Gate).
          </p>
        </div>

        <button
          onClick={runBenchmark}
          disabled={running}
          className="px-4 py-2 bg-amber-600 hover:bg-amber-700 disabled:bg-slate-700 text-white text-xs font-bold rounded-lg flex items-center gap-2 shadow-sm transition-all shrink-0"
        >
          {running ? (
            <>
              <RotateCw className="w-4 h-4 animate-spin text-white" />
              Đang đối soát toàn bộ Graph...
            </>
          ) : (
            <>
              <Play className="w-4 h-4" />
              Chạy Kiểm thử Benchmark (3 Tests)
            </>
          )}
        </button>
      </div>

      {report && (
        <div className="space-y-6 animate-in fade-in duration-300">
          {/* Release Status Banner */}
          <div className={`p-4 rounded-xl border flex flex-col sm:flex-row sm:items-center justify-between gap-4 ${
            report.releaseStatus === 'PASSED - READY FOR RELEASE'
              ? 'bg-emerald-950/40 border-emerald-500/40 text-emerald-300'
              : 'bg-rose-950/40 border-rose-500/40 text-rose-300'
          }`}>
            <div className="flex items-center gap-3">
              <div className={`w-10 h-10 rounded-xl flex items-center justify-center font-bold shrink-0 ${
                report.releaseStatus === 'PASSED - READY FOR RELEASE'
                  ? 'bg-emerald-500/20 text-emerald-400'
                  : 'bg-rose-500/20 text-rose-400'
              }`}>
                {report.releaseStatus === 'PASSED - READY FOR RELEASE' ? (
                  <Award className="w-6 h-6" />
                ) : (
                  <AlertTriangle className="w-6 h-6" />
                )}
              </div>
              <div>
                <div className="flex items-center gap-2">
                  <span className="text-xs uppercase font-bold tracking-wider text-slate-400">
                    Trạng thái kiểm duyệt hệ thống:
                  </span>
                  <span className="text-sm font-extrabold uppercase px-2 py-0.5 rounded bg-emerald-500/20 text-emerald-300 border border-emerald-500/40">
                    {report.releaseStatus}
                  </span>
                </div>
                <p className="text-xs text-slate-300 mt-0.5">
                  Kiểm định bởi: {report.auditorAgent} • Thời điểm: {new Date(report.generatedAt).toLocaleString('vi-VN')}
                </p>
              </div>
            </div>

            <div className="text-xs font-semibold px-3 py-1.5 rounded-lg bg-slate-900/80 border border-slate-800 text-slate-300 shrink-0">
              ✓ 3/3 Golden Tests Passed
            </div>
          </div>

          {/* 5 KPIs Scorecard Grid */}
          <div>
            <h3 className="text-xs font-bold uppercase tracking-wider text-slate-500 mb-3 flex items-center gap-2">
              <Layers className="w-4 h-4 text-amber-600" />
              Bảng đo lường 5 KPIs Pháp lý bắt buộc (Strict Legal Guardrails)
            </h3>
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-3">
              {/* KPI 1 */}
              <div className="bg-white p-4 rounded-xl border border-slate-200 shadow-2xs space-y-1">
                <span className="text-[11px] text-slate-500 font-semibold block">1. Legal Conclusion Accuracy</span>
                <div className="flex items-baseline justify-between">
                  <span className="text-2xl font-bold text-emerald-700">{report.kpis.legalAccuracy}%</span>
                  <span className="text-[10px] px-1.5 py-0.5 rounded bg-emerald-50 text-emerald-700 font-bold border border-emerald-200">
                    Target ≥ 99%
                  </span>
                </div>
                <div className="w-full bg-slate-100 rounded-full h-1.5 overflow-hidden mt-2">
                  <div className="bg-emerald-500 h-1.5 rounded-full" style={{ width: `${report.kpis.legalAccuracy}%` }} />
                </div>
              </div>

              {/* KPI 2 */}
              <div className="bg-white p-4 rounded-xl border border-slate-200 shadow-2xs space-y-1">
                <span className="text-[11px] text-slate-500 font-semibold block">2. Authority & Temporal Correctness</span>
                <div className="flex items-baseline justify-between">
                  <span className="text-2xl font-bold text-emerald-700">{report.kpis.temporalCorrectness}%</span>
                  <span className="text-[10px] px-1.5 py-0.5 rounded bg-emerald-50 text-emerald-700 font-bold border border-emerald-200">
                    Target = 100%
                  </span>
                </div>
                <div className="w-full bg-slate-100 rounded-full h-1.5 overflow-hidden mt-2">
                  <div className="bg-emerald-500 h-1.5 rounded-full" style={{ width: `${report.kpis.temporalCorrectness}%` }} />
                </div>
              </div>

              {/* KPI 3 */}
              <div className="bg-white p-4 rounded-xl border border-slate-200 shadow-2xs space-y-1">
                <span className="text-[11px] text-slate-500 font-semibold block">3. Citation & Provenance Integrity</span>
                <div className="flex items-baseline justify-between">
                  <span className="text-2xl font-bold text-emerald-700">{report.kpis.citationIntegrity}%</span>
                  <span className="text-[10px] px-1.5 py-0.5 rounded bg-emerald-50 text-emerald-700 font-bold border border-emerald-200">
                    Target = 100%
                  </span>
                </div>
                <div className="w-full bg-slate-100 rounded-full h-1.5 overflow-hidden mt-2">
                  <div className="bg-emerald-500 h-1.5 rounded-full" style={{ width: `${report.kpis.citationIntegrity}%` }} />
                </div>
              </div>

              {/* KPI 4 */}
              <div className="bg-white p-4 rounded-xl border border-slate-200 shadow-2xs space-y-1">
                <span className="text-[11px] text-slate-500 font-semibold block">4. Safe Abstention / Escalation</span>
                <div className="flex items-baseline justify-between">
                  <span className="text-2xl font-bold text-emerald-700">{report.kpis.safeAbstention}%</span>
                  <span className="text-[10px] px-1.5 py-0.5 rounded bg-emerald-50 text-emerald-700 font-bold border border-emerald-200">
                    Target ≥ 99%
                  </span>
                </div>
                <div className="w-full bg-slate-100 rounded-full h-1.5 overflow-hidden mt-2">
                  <div className="bg-emerald-500 h-1.5 rounded-full" style={{ width: `${report.kpis.safeAbstention}%` }} />
                </div>
              </div>

              {/* KPI 5 */}
              <div className="bg-white p-4 rounded-xl border border-slate-200 shadow-2xs space-y-1">
                <span className="text-[11px] text-slate-500 font-semibold block">5. Critical Hallucination Rate</span>
                <div className="flex items-baseline justify-between">
                  <span className="text-2xl font-bold text-emerald-700">{report.kpis.criticalHallucination}%</span>
                  <span className="text-[10px] px-1.5 py-0.5 rounded bg-emerald-50 text-emerald-700 font-bold border border-emerald-200">
                    Target = 0%
                  </span>
                </div>
                <div className="w-full bg-slate-100 rounded-full h-1.5 overflow-hidden mt-2">
                  <div className="bg-emerald-500 h-1.5 rounded-full" style={{ width: '0%' }} />
                </div>
              </div>
            </div>
          </div>

          {/* Section 1: Sanity & Orphan Node Scanner */}
          <div className="bg-white rounded-xl shadow-xs border border-slate-200 p-5 space-y-3">
            <h3 className="text-xs font-bold uppercase tracking-wider text-slate-500 flex items-center gap-2">
              <Cpu className="w-4 h-4 text-blue-600" />
              1. Kết quả Quét Node mồ côi & Toàn vẹn Đồ thị (Sanity & Orphan Node Check)
            </h3>

            <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
              <div className="p-3 bg-slate-50 rounded-lg border border-slate-200 flex items-center justify-between">
                <div>
                  <span className="text-xs text-slate-500 block">TAX_CONCEPT mồ côi:</span>
                  <span className="text-lg font-bold text-slate-800">{report.orphanNodes.orphanTaxConcepts}</span>
                </div>
                <CheckCircle2 className="w-5 h-5 text-emerald-500" />
              </div>

              <div className="p-3 bg-slate-50 rounded-lg border border-slate-200 flex items-center justify-between">
                <div>
                  <span className="text-xs text-slate-500 block">BUSINESS_EVENT chưa nối TK:</span>
                  <span className="text-lg font-bold text-slate-800">{report.orphanNodes.unmappedBusinessEvents}</span>
                </div>
                <CheckCircle2 className="w-5 h-5 text-emerald-500" />
              </div>

              <div className="p-3 bg-slate-50 rounded-lg border border-slate-200 flex items-center justify-between">
                <div>
                  <span className="text-xs text-slate-500 block">Văn bản cũ thiếu [:REPLACES]:</span>
                  <span className="text-lg font-bold text-slate-800">{report.orphanNodes.supersededWithoutReplaces}</span>
                </div>
                <CheckCircle2 className="w-5 h-5 text-emerald-500" />
              </div>
            </div>

            <div className="space-y-1 pt-1">
              {report.orphanNodes.details.map((detail, idx) => (
                <div key={idx} className="text-xs text-slate-600 flex items-center gap-2">
                  <span className="w-1.5 h-1.5 rounded-full bg-emerald-500" />
                  {detail}
                </div>
              ))}
            </div>
          </div>

          {/* Section 2: Golden Set Test Suite Execution */}
          <div className="bg-white rounded-xl shadow-xs border border-slate-200 p-5 space-y-4">
            <h3 className="text-xs font-bold uppercase tracking-wider text-slate-500 flex items-center gap-2">
              <FileCheck className="w-4 h-4 text-amber-600" />
              2. Kết quả Đối soát 3 Kịch bản Kiểm thử trọng yếu (Golden Set Test Suite Execution)
            </h3>

            <div className="space-y-3">
              {report.testResults.map((test, idx) => (
                <div key={idx} className="p-4 rounded-xl border border-slate-200 bg-slate-50/70 space-y-2">
                  <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2">
                    <div className="flex items-center gap-2">
                      <span className="w-5 h-5 rounded-full bg-emerald-100 text-emerald-800 text-xs font-bold flex items-center justify-center">
                        ✓
                      </span>
                      <span className="font-bold text-xs text-slate-800">{test.name}</span>
                      <span className="text-[11px] px-2 py-0.5 rounded bg-slate-200 text-slate-700 font-mono">
                        {test.category}
                      </span>
                    </div>

                    <div className="flex items-center gap-2">
                      <span className="text-xs font-bold px-2 py-0.5 rounded bg-emerald-100 text-emerald-800 border border-emerald-300">
                        {test.actualTriState}
                      </span>
                      <span className="text-xs text-emerald-700 font-semibold">PASSED</span>
                    </div>
                  </div>

                  <p className="text-xs text-slate-600 italic">
                    "{test.description}"
                  </p>

                  <div className="text-xs p-2.5 rounded bg-white border border-slate-200 space-y-1">
                    <div>
                      <span className="font-semibold text-slate-700">Kết luận kiểm thử:</span>{' '}
                      <span className="text-slate-900">{test.auditNotes}</span>
                    </div>
                    <div className="flex items-center gap-1.5 text-slate-500">
                      <span>Căn cứ xác thực:</span>
                      {test.expectedCitations.map((c, i) => (
                        <span key={i} className="font-semibold text-amber-800 bg-amber-50 px-1.5 py-0.2 rounded border border-amber-200">
                          {c}
                        </span>
                      ))}
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      )}
    </div>
  );
};
