import React from 'react';
import {
  ShieldCheck,
  Layers,
  MessageSquareCode,
  FileUp,
  Network,
  CheckCircle2,
  AlertTriangle,
  Gavel,
} from 'lucide-react';

type Tab = 'chat' | 'ingest' | 'graph' | 'benchmark' | 'penalty';

interface Props {
  activeTab: Tab;
  setActiveTab: (tab: Tab) => void;
  kpis: {
    legalAccuracy: number;
    temporalCorrectness: number;
    citationIntegrity: number;
    safeAbstention: number;
    criticalHallucination: number;
  };
}

// `short` is shown below the 2xl breakpoint so the navigation stays compact; the full label is always the accessible name.
const TABS: { id: Tab; label: string; short: string; Icon: React.ComponentType<{ className?: string }> }[] = [
  { id: 'chat', label: 'GraphRAG Reasoning Engine (Chatbot)', short: 'GraphRAG Chatbot', Icon: MessageSquareCode },
  { id: 'ingest', label: 'Antigravity Ingestion & Versioning', short: 'Ingestion & Versioning', Icon: FileUp },
  { id: 'graph', label: '5-Layer Temporal Graph Explorer', short: 'Temporal Graph', Icon: Network },
  { id: 'benchmark', label: 'Sanity Auditor & Golden Set Benchmark', short: 'Sanity Auditor', Icon: Layers },
  { id: 'penalty', label: 'Checklist Mức phạt Thuế & Hóa đơn', short: 'Mức phạt Thuế & HĐ', Icon: Gavel },
];

export const Header: React.FC<Props> = ({ activeTab, setActiveTab, kpis }) => {
  const kpiItems = [
    { label: 'Legal Acc', value: kpis.legalAccuracy, target: '≥99%', warn: false },
    { label: 'Temporal', value: kpis.temporalCorrectness, target: '100%', warn: false },
    { label: 'Citation', value: kpis.citationIntegrity, target: '100%', warn: false },
    { label: 'Safe Abstain', value: kpis.safeAbstention, target: '≥99%', warn: false },
    { label: 'Hallucination', value: kpis.criticalHallucination, target: '0%', warn: true },
  ];

  return (
    <header className="bg-slate-900 text-white border-b border-slate-800 sticky top-0 z-30 shadow-md">
      <div className="max-w-[2000px] mx-auto px-3 sm:px-4 lg:px-6 py-3 flex flex-col gap-3 lg:flex-row lg:items-center lg:gap-6">
        {/* Left block: system identity */}
        <div className="flex items-center gap-3 lg:w-[22rem] lg:shrink-0">
          <div className="w-10 h-10 shrink-0 rounded-xl bg-gradient-to-br from-amber-500 to-amber-700 flex items-center justify-center text-white shadow-md shadow-amber-900/30">
            <ShieldCheck className="w-6 h-6 text-white" />
          </div>
          <div className="min-w-0">
            <h1 className="text-base lg:text-lg font-bold tracking-tight text-white leading-tight">
              CPA Vietnam Unified System
            </h1>
            <div className="mt-0.5 flex flex-wrap items-center gap-x-2 gap-y-0.5">
              <span className="text-[10px] px-2 py-0.5 rounded-full bg-amber-500/20 text-amber-300 border border-amber-500/30 font-semibold uppercase tracking-wider whitespace-nowrap">
                Temporal KG v4.2
              </span>
              <span className="text-xs text-slate-300 leading-tight">
                Master Tax Knowledge Graph &amp; Reasoning Engine (CPANAM &amp; Consulting)
              </span>
            </div>
          </div>
        </div>

        {/* Right block: legal guardrails + navigation, wraps instead of scrolling */}
        <div className="min-w-0 flex-1 flex flex-col gap-2 lg:border-l lg:border-slate-700 lg:pl-6">
          <div className="flex flex-wrap items-center gap-2 text-xs">
            {kpiItems.map(k => (
              <div key={k.label} className="bg-slate-800/80 px-2.5 py-1.5 rounded-lg border border-slate-700/60 flex items-center gap-1.5 whitespace-nowrap">
                {k.warn
                  ? <AlertTriangle className="w-3.5 h-3.5 text-amber-400" />
                  : <CheckCircle2 className="w-3.5 h-3.5 text-emerald-400" />}
                <span className="text-slate-300">{k.label}:</span>
                <span className="font-semibold text-emerald-400">{k.value}%</span>
                <span className="text-[10px] text-slate-300">({k.target})</span>
              </div>
            ))}
          </div>

          <nav className="flex flex-wrap items-center gap-2 border-t border-slate-800/80 pt-2" aria-label="Chức năng">
            {TABS.map(({ id, label, short, Icon }) => (
              <button
                key={id}
                aria-label={label}
                onClick={() => setActiveTab(id)}
                className={`flex items-center gap-2 px-3 py-1.5 rounded-lg text-xs font-semibold transition-all ${
                  activeTab === id
                    ? 'bg-amber-500 text-slate-950 shadow-sm'
                    : 'text-slate-300 hover:text-white hover:bg-slate-800'
                }`}
              >
                <Icon className="w-4 h-4 shrink-0" />
                <span className="hidden 2xl:inline">{label}</span>
                <span className="2xl:hidden">{short}</span>
              </button>
            ))}
          </nav>
        </div>
      </div>
    </header>
  );
};
