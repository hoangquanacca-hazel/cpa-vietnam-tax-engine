import React, { useState, useEffect, useMemo } from 'react';
import { 
  Network, 
  Search, 
  Layers, 
  Calendar, 
  Filter, 
  Maximize2, 
  Minimize2, 
  RotateCcw, 
  BookOpen, 
  CheckCircle, 
  X, 
  AlertCircle 
} from 'lucide-react';
import { GraphNode, GraphEdge, LayerType, ExactSpan } from '../types/tax-graph';

interface Props {
  onSelectSpan?: (span: ExactSpan, citationIndex: number) => void;
}

export const GraphVisualizer: React.FC<Props> = ({ onSelectSpan }) => {
  const [nodes, setNodes] = useState<GraphNode[]>([]);
  const [edges, setEdges] = useState<GraphEdge[]>([]);
  const [stats, setStats] = useState<any>(null);
  const [loading, setLoading] = useState<boolean>(true);

  // Filters
  const [searchQuery, setSearchQuery] = useState<string>('');
  const [selectedLayer, setSelectedLayer] = useState<string>('ALL');
  const [temporalYear, setTemporalYear] = useState<number>(2025);
  const [selectedNode, setSelectedNode] = useState<GraphNode | null>(null);
  const [hopFilter, setHopFilter] = useState<number>(3);

  // Pan & Zoom
  const [zoom, setZoom] = useState<number>(1);
  const [pan, setPan] = useState<{ x: number; y: number }>({ x: 0, y: 0 });
  const [isDragging, setIsDragging] = useState<boolean>(false);
  const [dragStart, setDragStart] = useState<{ x: number; y: number }>({ x: 0, y: 0 });

  const fetchGraphData = async () => {
    try {
      setLoading(true);
      const res = await fetch(`/api/graph?year=${temporalYear}`);
      const data = await res.json();
      setNodes(data.nodes);
      setEdges(data.edges);
      setStats(data.stats);
    } catch (e) {
      console.error(e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchGraphData();
  }, [temporalYear]);

  // Compute filtered nodes and edges
  const filteredGraph = useMemo(() => {
    let activeNodes = nodes.filter(n => {
      // Search filter
      if (searchQuery.trim()) {
        const q = searchQuery.toLowerCase();
        const matchTitle = n.title?.toLowerCase().includes(q);
        const matchLabel = n.label?.toLowerCase().includes(q);
        const matchSummary = n.summary?.toLowerCase().includes(q);
        if (!matchTitle && !matchLabel && !matchSummary) return false;
      }
      // Layer filter
      if (selectedLayer !== 'ALL' && n.layer !== selectedLayer) {
        return false;
      }
      return true;
    });

    // If node is selected and hop filter is set (1-3 hops traversal)
    if (selectedNode) {
      const neighborIds = new Set<string>([selectedNode.id]);
      let currentHop = 0;
      let frontier = new Set<string>([selectedNode.id]);

      while (currentHop < hopFilter && frontier.size > 0) {
        const nextFrontier = new Set<string>();
        edges.forEach(edge => {
          if (frontier.has(edge.source) && !neighborIds.has(edge.target)) {
            neighborIds.add(edge.target);
            nextFrontier.add(edge.target);
          }
          if (frontier.has(edge.target) && !neighborIds.has(edge.source)) {
            neighborIds.add(edge.source);
            nextFrontier.add(edge.source);
          }
        });
        frontier = nextFrontier;
        currentHop++;
      }

      activeNodes = activeNodes.filter(n => neighborIds.has(n.id));
    }

    const nodeIds = new Set(activeNodes.map(n => n.id));
    const activeEdges = edges.filter(e => nodeIds.has(e.source) && nodeIds.has(e.target));

    return { nodes: activeNodes, edges: activeEdges };
  }, [nodes, edges, searchQuery, selectedLayer, selectedNode, hopFilter]);

  // Layer colors
  const getLayerColor = (layer: LayerType) => {
    switch (layer) {
      case 'REGULATORY':
        return { bg: '#fef3c7', stroke: '#d97706', text: '#92400e', badge: 'bg-amber-100 text-amber-800' };
      case 'TAX_LIFECYCLE':
        return { bg: '#e0f2fe', stroke: '#0284c7', text: '#075985', badge: 'bg-sky-100 text-sky-800' };
      case 'COMPLIANCE_CALCULATION':
        return { bg: '#dcfce7', stroke: '#16a34a', text: '#166534', badge: 'bg-emerald-100 text-emerald-800' };
      case 'THE_BRIDGE':
        return { bg: '#ede9fe', stroke: '#7c3aed', text: '#5b21b6', badge: 'bg-purple-100 text-purple-800' };
      case 'ASSESSMENT_SERVICE':
        return { bg: '#ffe4e6', stroke: '#e11d48', text: '#9f1239', badge: 'bg-rose-100 text-rose-800' };
      default:
        return { bg: '#f1f5f9', stroke: '#64748b', text: '#334155', badge: 'bg-slate-100 text-slate-800' };
    }
  };

  // Node coordinate generator (layered DAG layout)
  const nodePositions = useMemo(() => {
    const layerOrder: Record<LayerType, number> = {
      'REGULATORY': 0,
      'TAX_LIFECYCLE': 1,
      'COMPLIANCE_CALCULATION': 2,
      'THE_BRIDGE': 3,
      'ASSESSMENT_SERVICE': 4
    };

    const layerBuckets: Record<LayerType, GraphNode[]> = {
      'REGULATORY': [],
      'TAX_LIFECYCLE': [],
      'COMPLIANCE_CALCULATION': [],
      'THE_BRIDGE': [],
      'ASSESSMENT_SERVICE': []
    };

    filteredGraph.nodes.forEach(n => {
      if (layerBuckets[n.layer]) {
        layerBuckets[n.layer].push(n);
      }
    });

    const positions: Record<string, { x: number; y: number }> = {};
    const layerYCoords = [80, 220, 360, 500, 640];

    Object.entries(layerBuckets).forEach(([layer, bNodes]) => {
      const y = layerYCoords[layerOrder[layer as LayerType] ?? 0];
      const count = bNodes.length;
      const spacing = 190;
      const startX = 600 - ((count - 1) * spacing) / 2;

      bNodes.forEach((node, idx) => {
        positions[node.id] = {
          x: Math.max(100, startX + idx * spacing),
          y: y
        };
      });
    });

    return positions;
  }, [filteredGraph.nodes]);

  const handleMouseDown = (e: React.MouseEvent) => {
    setIsDragging(true);
    setDragStart({ x: e.clientX - pan.x, y: e.clientY - pan.y });
  };

  const handleMouseMove = (e: React.MouseEvent) => {
    if (!isDragging) return;
    setPan({
      x: e.clientX - dragStart.x,
      y: e.clientY - dragStart.y
    });
  };

  const handleMouseUp = () => {
    setIsDragging(false);
  };

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6 space-y-6">
      {/* Control Toolbar */}
      <div className="bg-white rounded-xl shadow-xs border border-slate-200 p-4 space-y-4">
        <div className="flex flex-col lg:flex-row lg:items-center justify-between gap-4">
          <div className="flex items-center gap-3">
            <div className="w-9 h-9 rounded-lg bg-amber-500/10 text-amber-600 flex items-center justify-center font-bold">
              <Network className="w-5 h-5" />
            </div>
            <div>
              <h2 className="text-sm font-bold text-slate-900">
                Temporal Knowledge Graph Visualizer (5 Tầng Bản thể học)
              </h2>
              <p className="text-xs text-slate-500">
                Khám phá đường dẫn liên kết, kiểm tra trạng thái hiệu lực Active/Superseded và traversal 1-3 hops.
              </p>
            </div>
          </div>

          {/* Temporal Year Slider */}
          <div className="flex items-center gap-3 bg-slate-50 p-2 rounded-xl border border-slate-200">
            <div className="flex items-center gap-1.5 text-xs font-semibold text-slate-700">
              <Calendar className="w-3.5 h-3.5 text-amber-600" />
              <span>Năm hiệu lực:</span>
            </div>
            <div className="flex items-center gap-1">
              {[2024, 2025, 2026].map(yr => (
                <button
                  key={yr}
                  onClick={() => setTemporalYear(yr)}
                  className={`px-3 py-1 rounded-md text-xs font-bold transition-all ${
                    temporalYear === yr
                      ? 'bg-amber-600 text-white shadow-xs'
                      : 'bg-white text-slate-700 hover:bg-slate-100 border border-slate-200'
                  }`}
                >
                  {yr}
                </button>
              ))}
            </div>
            <span className="text-[11px] text-slate-500">
              {temporalYear === 2024 ? '(NĐ 132 có hiệu lực)' : temporalYear === 2025 ? '(NĐ 20, NĐ 320, Luật 48 có hiệu lực)' : '(Luật TNDN 67 áp dụng)'}
            </span>
          </div>
        </div>

        {/* Filter Bar */}
        <div className="flex flex-wrap items-center gap-3 pt-3 border-t border-slate-100 text-xs">
          {/* Search Box */}
          <div className="relative flex-1 min-w-[200px]">
            <Search className="w-3.5 h-3.5 text-slate-400 absolute left-3 top-2.5" />
            <input
              type="text"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              placeholder="Tìm kiếm Node theo mã, tiêu đề, số hiệu..."
              className="w-full pl-8 pr-3 py-1.5 rounded-lg border border-slate-300 bg-slate-50 focus:outline-none focus:ring-2 focus:ring-amber-500"
            />
          </div>

          {/* Layer Filter */}
          <div className="flex items-center gap-1.5">
            <span className="text-slate-500 font-semibold">Tầng:</span>
            <select
              value={selectedLayer}
              onChange={(e) => setSelectedLayer(e.target.value)}
              className="px-2.5 py-1.5 rounded-lg border border-slate-300 bg-slate-50 font-medium focus:outline-none focus:ring-2 focus:ring-amber-500"
            >
              <option value="ALL">Tất cả 5 tầng</option>
              <option value="REGULATORY">1. Regulatory (Văn bản)</option>
              <option value="TAX_LIFECYCLE">2. Tax Lifecycle (Chu trình)</option>
              <option value="COMPLIANCE_CALCULATION">3. Compliance (Công thức/Khái niệm)</option>
              <option value="THE_BRIDGE">4. The Bridge (Nghiệp vụ & TK Kế toán)</option>
              <option value="ASSESSMENT_SERVICE">5. Assessment (Atomic LO & Rủi ro)</option>
            </select>
          </div>

          {/* Hop Filter for Traversal */}
          {selectedNode && (
            <div className="flex items-center gap-1.5 bg-amber-50 px-2.5 py-1 rounded-lg border border-amber-200">
              <span className="font-semibold text-amber-900">Traversal:</span>
              {[1, 2, 3].map(h => (
                <button
                  key={h}
                  onClick={() => setHopFilter(h)}
                  className={`px-2 py-0.5 rounded text-[11px] font-bold ${
                    hopFilter === h ? 'bg-amber-600 text-white' : 'bg-white text-amber-900 border border-amber-300'
                  }`}
                >
                  {h} hops
                </button>
              ))}
              <button
                onClick={() => setSelectedNode(null)}
                className="ml-1 text-slate-400 hover:text-slate-700"
                title="Bỏ chọn node"
              >
                <X className="w-3.5 h-3.5" />
              </button>
            </div>
          )}

          {/* Zoom controls */}
          <div className="flex items-center gap-1 ml-auto">
            <button
              onClick={() => setZoom(z => Math.min(1.8, z + 0.1))}
              className="p-1.5 rounded bg-slate-100 hover:bg-slate-200 text-slate-700"
              title="Phóng to"
            >
              <Maximize2 className="w-3.5 h-3.5" />
            </button>
            <button
              onClick={() => setZoom(z => Math.max(0.6, z - 0.1))}
              className="p-1.5 rounded bg-slate-100 hover:bg-slate-200 text-slate-700"
              title="Thu nhỏ"
            >
              <Minimize2 className="w-3.5 h-3.5" />
            </button>
            <button
              onClick={() => { setZoom(1); setPan({ x: 0, y: 0 }); setSelectedNode(null); }}
              className="p-1.5 rounded bg-slate-100 hover:bg-slate-200 text-slate-700"
              title="Khôi phục góc nhìn"
            >
              <RotateCcw className="w-3.5 h-3.5" />
            </button>
          </div>
        </div>
      </div>

      {/* Main Canvas Area & Node Inspector Drawer */}
      <div className="grid grid-cols-1 lg:grid-cols-12 gap-6">
        {/* SVG Graph Canvas */}
        <div className={`${selectedNode ? 'lg:col-span-8' : 'lg:col-span-12'} transition-all`}>
          <div 
            className="bg-slate-950 rounded-xl shadow-inner border border-slate-800 h-[640px] overflow-hidden relative select-none cursor-grab active:cursor-grabbing"
            onMouseDown={handleMouseDown}
            onMouseMove={handleMouseMove}
            onMouseUp={handleMouseUp}
          >
            {/* Legend Overlay */}
            <div className="absolute top-3 left-3 z-10 bg-slate-900/90 backdrop-blur-sm p-3 rounded-lg border border-slate-800 text-[11px] space-y-1.5 pointer-events-none">
              <div className="font-bold text-slate-300 mb-1">Chú giải Tầng (Ontology Layers):</div>
              <div className="flex items-center gap-2 text-amber-300">
                <span className="w-2.5 h-2.5 rounded-full bg-amber-500" />
                Layer 1: Regulatory (Văn bản QPPL)
              </div>
              <div className="flex items-center gap-2 text-sky-300">
                <span className="w-2.5 h-2.5 rounded-full bg-sky-500" />
                Layer 2: Tax Lifecycle (Chu trình Thuế)
              </div>
              <div className="flex items-center gap-2 text-emerald-300">
                <span className="w-2.5 h-2.5 rounded-full bg-emerald-500" />
                Layer 3: Compliance & Calculation (Khái niệm/Công thức)
              </div>
              <div className="flex items-center gap-2 text-purple-300">
                <span className="w-2.5 h-2.5 rounded-full bg-purple-500" />
                Layer 4: The Bridge (Nghiệp vụ & TK Kế toán)
              </div>
              <div className="flex items-center gap-2 text-rose-300">
                <span className="w-2.5 h-2.5 rounded-full bg-rose-500" />
                Layer 5: Assessment & Service (Atomic LO & Rủi ro)
              </div>
            </div>

            {/* SVG Content */}
            <svg 
              width="100%" 
              height="100%" 
              className="w-full h-full"
            >
              <defs>
                <marker
                  id="arrow"
                  viewBox="0 0 10 10"
                  refX="22"
                  refY="5"
                  markerWidth="6"
                  markerHeight="6"
                  orient="auto-start-reverse"
                >
                  <path d="M 0 0 L 10 5 L 0 10 z" fill="#64748b" />
                </marker>
                <marker
                  id="arrow-active"
                  viewBox="0 0 10 10"
                  refX="22"
                  refY="5"
                  markerWidth="6"
                  markerHeight="6"
                  orient="auto-start-reverse"
                >
                  <path d="M 0 0 L 10 5 L 0 10 z" fill="#f59e0b" />
                </marker>
              </defs>

              <g transform={`translate(${pan.x}, ${pan.y}) scale(${zoom})`}>
                {/* Layer Backdrop Banners */}
                <g opacity="0.1">
                  <rect x="20" y="50" width="1160" height="90" fill="#fef3c7" rx="8" />
                  <text x="35" y="75" fill="#fef3c7" fontSize="12" fontWeight="bold">TẦNG 1: REGULATORY</text>

                  <rect x="20" y="190" width="1160" height="90" fill="#e0f2fe" rx="8" />
                  <text x="35" y="215" fill="#e0f2fe" fontSize="12" fontWeight="bold">TẦNG 2: TAX LIFECYCLE</text>

                  <rect x="20" y="330" width="1160" height="90" fill="#dcfce7" rx="8" />
                  <text x="35" y="355" fill="#dcfce7" fontSize="12" fontWeight="bold">TẦNG 3: COMPLIANCE & CALCULATION</text>

                  <rect x="20" y="470" width="1160" height="90" fill="#ede9fe" rx="8" />
                  <text x="35" y="495" fill="#ede9fe" fontSize="12" fontWeight="bold">TẦNG 4: THE BRIDGE (CANONICAL EVENTS & ACCOUNTING)</text>

                  <rect x="20" y="610" width="1160" height="90" fill="#ffe4e6" rx="8" />
                  <text x="35" y="635" fill="#ffe4e6" fontSize="12" fontWeight="bold">TẦNG 5: ASSESSMENT & SERVICE</text>
                </g>

                {/* Edges */}
                {filteredGraph.edges.map(edge => {
                  const sourcePos = nodePositions[edge.source];
                  const targetPos = nodePositions[edge.target];
                  if (!sourcePos || !targetPos) return null;

                  const isEdgeActive = selectedNode && (selectedNode.id === edge.source || selectedNode.id === edge.target);

                  const midX = (sourcePos.x + targetPos.x) / 2;
                  const midY = (sourcePos.y + targetPos.y) / 2;

                  return (
                    <g key={edge.id}>
                      <line
                        x1={sourcePos.x}
                        y1={sourcePos.y}
                        x2={targetPos.x}
                        y2={targetPos.y}
                        stroke={isEdgeActive ? '#f59e0b' : '#475569'}
                        strokeWidth={isEdgeActive ? 2.5 : 1.2}
                        strokeDasharray={edge.type === 'REPLACES' ? '4 2' : undefined}
                        markerEnd={isEdgeActive ? 'url(#arrow-active)' : 'url(#arrow)'}
                      />
                      <rect 
                        x={midX - 25} 
                        y={midY - 8} 
                        width="50" 
                        height="16" 
                        rx="3" 
                        fill="#0f172a" 
                        opacity="0.8" 
                      />
                      <text
                        x={midX}
                        y={midY + 3}
                        fill={isEdgeActive ? '#fef08a' : '#94a3b8'}
                        fontSize="8"
                        textAnchor="middle"
                        fontWeight="600"
                        fontFamily="monospace"
                      >
                        {edge.type}
                      </text>
                    </g>
                  );
                })}

                {/* Nodes */}
                {filteredGraph.nodes.map(node => {
                  const pos = nodePositions[node.id];
                  if (!pos) return null;

                  const colors = getLayerColor(node.layer);
                  const isSelected = selectedNode?.id === node.id;
                  const isSuperseded = node.legalStatus === 'Superseded';

                  return (
                    <g
                      key={node.id}
                      transform={`translate(${pos.x}, ${pos.y})`}
                      onClick={(e) => {
                        e.stopPropagation();
                        setSelectedNode(node);
                      }}
                      className="cursor-pointer transition-transform hover:scale-110"
                    >
                      {/* Node Shape */}
                      <rect
                        x="-70"
                        y="-22"
                        width="140"
                        height="44"
                        rx="8"
                        fill={colors.bg}
                        stroke={isSelected ? '#ffffff' : (isSuperseded ? '#ef4444' : colors.stroke)}
                        strokeWidth={isSelected ? 3 : (isSuperseded ? 2 : 1.5)}
                        strokeDasharray={isSuperseded ? '3 2' : undefined}
                      />

                      {/* Label Text */}
                      <text
                        y="-4"
                        fill={colors.text}
                        fontSize="9"
                        fontWeight="bold"
                        textAnchor="middle"
                      >
                        {node.label.length > 20 ? node.label.slice(0, 18) + '...' : node.label}
                      </text>

                      <text
                        y="10"
                        fill="#64748b"
                        fontSize="8"
                        textAnchor="middle"
                        fontFamily="sans-serif"
                      >
                        {node.subType}
                      </text>

                      {/* Status indicator badge */}
                      {isSuperseded && (
                        <circle cx="62" cy="-15" r="4" fill="#ef4444" />
                      )}
                    </g>
                  );
                })}
              </g>
            </svg>
          </div>
        </div>

        {/* Node Inspector Drawer */}
        {selectedNode && (
          <div className="lg:col-span-4 bg-white rounded-xl shadow-xs border border-slate-200 p-5 space-y-4 animate-in fade-in slide-in-from-right-2 duration-200">
            <div className="flex items-center justify-between border-b border-slate-100 pb-3">
              <div className="flex items-center gap-2">
                <span className={`px-2 py-0.5 rounded text-[10px] font-bold ${getLayerColor(selectedNode.layer).badge}`}>
                  {selectedNode.layer}
                </span>
                <span className="text-xs text-slate-500 font-mono">{selectedNode.subType}</span>
              </div>
              <button
                onClick={() => setSelectedNode(null)}
                className="text-slate-400 hover:text-slate-700 p-1 rounded"
              >
                <X className="w-4 h-4" />
              </button>
            </div>

            <div>
              <h3 className="font-bold text-sm text-slate-900 leading-snug">
                {selectedNode.title || selectedNode.label}
              </h3>
              <p className="text-xs text-slate-600 mt-2 leading-relaxed">
                {selectedNode.summary}
              </p>
            </div>

            {/* Regulatory Metadata */}
            {selectedNode.layer === 'REGULATORY' && (
              <div className="bg-slate-50 p-3 rounded-lg border border-slate-200 space-y-2 text-xs">
                <div className="flex items-center justify-between">
                  <span className="text-slate-500">Số hiệu:</span>
                  <span className="font-bold text-slate-800">{selectedNode.docNumber}</span>
                </div>
                <div className="flex items-center justify-between">
                  <span className="text-slate-500">Thẩm quyền:</span>
                  <span className="text-slate-700">{selectedNode.issuingAuthority}</span>
                </div>
                <div className="flex items-center justify-between">
                  <span className="text-slate-500">Ngày hiệu lực:</span>
                  <span className="font-medium text-slate-800">{selectedNode.effectiveDate}</span>
                </div>
                <div className="flex items-center justify-between">
                  <span className="text-slate-500">Trạng thái:</span>
                  <span className={`px-2 py-0.5 rounded text-[10px] font-bold ${
                    selectedNode.legalStatus === 'Active' 
                      ? 'bg-emerald-100 text-emerald-800' 
                      : 'bg-rose-100 text-rose-800'
                  }`}>
                    {selectedNode.legalStatus}
                  </span>
                </div>
              </div>
            )}

            {/* Formula / Concept Details */}
            {selectedNode.formula && (
              <div className="bg-emerald-50 p-3 rounded-lg border border-emerald-200 text-xs">
                <span className="font-bold text-emerald-900 block mb-1 uppercase tracking-wide text-[10px]">
                  Công thức quy chuẩn:
                </span>
                <code className="font-mono text-emerald-800 font-semibold text-[11px] block bg-white p-2 rounded border border-emerald-200">
                  {selectedNode.formula}
                </code>
              </div>
            )}

            {/* Exam Trap Warning */}
            {selectedNode.examTrapWarning && (
              <div className="bg-amber-50 p-3 rounded-lg border border-amber-200 text-xs text-amber-900">
                <span className="font-bold block mb-1">CẢNH BÁO BẪY ĐỀ THI CPA:</span>
                <p>{selectedNode.examTrapWarning}</p>
              </div>
            )}

            {/* Exact Source Spans button */}
            {selectedNode.exactSpans && selectedNode.exactSpans.length > 0 && onSelectSpan && (
              <div className="pt-2">
                <button
                  onClick={() => onSelectSpan(selectedNode.exactSpans![0], 1)}
                  className="w-full py-2 bg-amber-50 hover:bg-amber-100 border border-amber-300 text-amber-900 font-bold rounded-lg text-xs flex items-center justify-center gap-1.5 transition-colors"
                >
                  <BookOpen className="w-3.5 h-3.5 text-amber-700" />
                  Xem Exact Source Span [{selectedNode.exactSpans[0].article}]
                </button>
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  );
};
