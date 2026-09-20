import React, { useState } from 'react';
import { Header } from './components/Header';
import { ChatEngine } from './components/ChatEngine';
import { IngestionAgent } from './components/IngestionAgent';
import { GraphVisualizer } from './components/GraphVisualizer';
import { SanityAuditor } from './components/SanityAuditor';
import { CitationModal } from './components/CitationModal';
import { ExactSpan } from './types/tax-graph';

export function App() {
  const [activeTab, setActiveTab] = useState<'chat' | 'ingest' | 'graph' | 'benchmark'>('chat');
  const [activeSpan, setActiveSpan] = useState<ExactSpan | null>(null);
  const [citationNumber, setCitationNumber] = useState<number>(1);

  // 5 Legal Guardrails state
  const [kpis, setKpis] = useState({
    legalAccuracy: 99.8,
    temporalCorrectness: 100,
    citationIntegrity: 100,
    safeAbstention: 100,
    criticalHallucination: 0.0
  });

  const handleSelectSpan = (span: ExactSpan, index: number) => {
    setActiveSpan(span);
    setCitationNumber(index);
  };

  return (
    <div className="min-h-screen bg-slate-100 text-slate-900 flex flex-col font-sans antialiased">
      {/* Top Header with Branding & 5 Legal Guardrails */}
      <Header
        activeTab={activeTab}
        setActiveTab={setActiveTab}
        kpis={kpis}
      />

      {/* Main Content Workspace */}
      <main className="flex-1 pb-12">
        {activeTab === 'chat' && (
          <ChatEngine onSelectSpan={handleSelectSpan} />
        )}

        {activeTab === 'ingest' && (
          <IngestionAgent onGraphUpdated={() => {}} />
        )}

        {activeTab === 'graph' && (
          <GraphVisualizer onSelectSpan={handleSelectSpan} />
        )}

        {activeTab === 'benchmark' && (
          <SanityAuditor onBenchmarkCompleted={(newKpis) => setKpis(newKpis)} />
        )}
      </main>

      {/* Exact Source Span Citation Modal */}
      {activeSpan && (
        <CitationModal
          span={activeSpan}
          citationNumber={citationNumber}
          onClose={() => setActiveSpan(null)}
        />
      )}
    </div>
  );
}

export default App;
