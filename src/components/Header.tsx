import React from 'react';
import { 
  ShieldCheck, 
  Layers, 
  MessageSquareCode, 
  FileUp, 
  Network, 
  CheckCircle2, 
  AlertTriangle 
} from 'lucide-react';

interface Props {
  activeTab: 'chat' | 'ingest' | 'graph' | 'benchmark';
  setActiveTab: (tab: 'chat' | 'ingest' | 'graph' | 'benchmark') => void;
  kpis: {
    legalAccuracy: number;
    temporalCorrectness: number;
    citationIntegrity: number;
    safeAbstention: number;
    criticalHallucination: number;
  };
}

export const Header: React.FC<Props> = ({ activeTab, setActiveTab, kpis }) => {
  return (
    <header className="bg-slate-900 text-white border-b border-slate-800 sticky top-0 z-30 shadow-md">
      {/* Top Bar with System Branding & 5 Legal Guardrails */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-3">
        <div className="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-3">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 rounded-xl bg-gradient-to-br from-amber-500 to-amber-700 flex items-center justify-center text-white shadow-md shadow-amber-900/30">
              <ShieldCheck className="w-6 h-6 text-white" />
            </div>
            <div>
              <div className="flex items-center gap-2">
                <h1 className="text-lg font-bold tracking-tight text-white flex items-center gap-2">
                  CPA Vietnam Unified System
                  <span className="text-xs px-2 py-0.5 rounded-full bg-amber-500/20 text-amber-300 border border-amber-500/30 font-semibold uppercase tracking-wider">
                    Temporal KG v4.2
                  </span>
                </h1>
              </div>
              <p className="text-xs text-slate-300">
                Master Tax Knowledge Graph & Reasoning Engine (CPANAM & Consulting)
              </p>
            </div>
          </div>

          {/* 5 KPIs Legal Guardrails Display */}
          <div className="flex items-center gap-2 overflow-x-auto pb-1 lg:pb-0 text-xs">
            <div className="bg-slate-800/80 px-2.5 py-1.5 rounded-lg border border-slate-700/60 flex items-center gap-1.5 whitespace-nowrap">
              <CheckCircle2 className="w-3.5 h-3.5 text-emerald-400" />
              <span className="text-slate-300">Legal Acc:</span>
              <span className="font-semibold text-emerald-400">{kpis.legalAccuracy}%</span>
              <span className="text-[10px] text-slate-300">(≥99%)</span>
            </div>
            <div className="bg-slate-800/80 px-2.5 py-1.5 rounded-lg border border-slate-700/60 flex items-center gap-1.5 whitespace-nowrap">
              <CheckCircle2 className="w-3.5 h-3.5 text-emerald-400" />
              <span className="text-slate-300">Temporal:</span>
              <span className="font-semibold text-emerald-400">{kpis.temporalCorrectness}%</span>
              <span className="text-[10px] text-slate-300">(100%)</span>
            </div>
            <div className="bg-slate-800/80 px-2.5 py-1.5 rounded-lg border border-slate-700/60 flex items-center gap-1.5 whitespace-nowrap">
              <CheckCircle2 className="w-3.5 h-3.5 text-emerald-400" />
              <span className="text-slate-300">Citation:</span>
              <span className="font-semibold text-emerald-400">{kpis.citationIntegrity}%</span>
              <span className="text-[10px] text-slate-300">(100%)</span>
            </div>
            <div className="bg-slate-800/80 px-2.5 py-1.5 rounded-lg border border-slate-700/60 flex items-center gap-1.5 whitespace-nowrap">
              <CheckCircle2 className="w-3.5 h-3.5 text-emerald-400" />
              <span className="text-slate-300">Safe Abstain:</span>
              <span className="font-semibold text-emerald-400">{kpis.safeAbstention}%</span>
              <span className="text-[10px] text-slate-300">(≥99%)</span>
            </div>
            <div className="bg-slate-800/80 px-2.5 py-1.5 rounded-lg border border-slate-700/60 flex items-center gap-1.5 whitespace-nowrap">
              <AlertTriangle className="w-3.5 h-3.5 text-amber-400" />
              <span className="text-slate-300">Hallucination:</span>
              <span className="font-semibold text-emerald-400">{kpis.criticalHallucination}%</span>
              <span className="text-[10px] text-slate-300">(0%)</span>
            </div>
          </div>
        </div>

        {/* Navigation Tabs */}
        <div className="mt-3 flex items-center gap-2 border-t border-slate-800/80 pt-2.5 overflow-x-auto">
          <button
            onClick={() => setActiveTab('chat')}
            className={`flex items-center gap-2 px-3.5 py-1.5 rounded-lg text-xs font-semibold transition-all whitespace-nowrap ${
              activeTab === 'chat'
                ? 'bg-amber-500 text-slate-950 shadow-sm'
                : 'text-slate-300 hover:text-white hover:bg-slate-800'
            }`}
          >
            <MessageSquareCode className="w-4 h-4" />
            GraphRAG Reasoning Engine (Chatbot)
          </button>

          <button
            onClick={() => setActiveTab('ingest')}
            className={`flex items-center gap-2 px-3.5 py-1.5 rounded-lg text-xs font-semibold transition-all whitespace-nowrap ${
              activeTab === 'ingest'
                ? 'bg-amber-500 text-slate-950 shadow-sm'
                : 'text-slate-300 hover:text-white hover:bg-slate-800'
            }`}
          >
            <FileUp className="w-4 h-4" />
            Antigravity Ingestion & Versioning
          </button>

          <button
            onClick={() => setActiveTab('graph')}
            className={`flex items-center gap-2 px-3.5 py-1.5 rounded-lg text-xs font-semibold transition-all whitespace-nowrap ${
              activeTab === 'graph'
                ? 'bg-amber-500 text-slate-950 shadow-sm'
                : 'text-slate-300 hover:text-white hover:bg-slate-800'
            }`}
          >
            <Network className="w-4 h-4" />
            5-Layer Temporal Graph Explorer
          </button>

          <button
            onClick={() => setActiveTab('benchmark')}
            className={`flex items-center gap-2 px-3.5 py-1.5 rounded-lg text-xs font-semibold transition-all whitespace-nowrap ${
              activeTab === 'benchmark'
                ? 'bg-amber-500 text-slate-950 shadow-sm'
                : 'text-slate-300 hover:text-white hover:bg-slate-800'
            }`}
          >
            <Layers className="w-4 h-4" />
            Sanity Auditor & Golden Set Benchmark
          </button>
        </div>
      </div>
    </header>
  );
};
