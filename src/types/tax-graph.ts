export type LayerType = 
  | 'REGULATORY' 
  | 'TAX_LIFECYCLE' 
  | 'COMPLIANCE_CALCULATION' 
  | 'THE_BRIDGE' 
  | 'ASSESSMENT_SERVICE';

export type RegulatoryType = 'LAW' | 'DECREE' | 'CIRCULAR' | 'OFFICIAL_DISPATCH';
export type LegalStatus = 'Active' | 'Superseded' | 'Draft';
export type LifecycleStage = 
  | 'REGISTRATION' 
  | 'DECLARATION' 
  | 'PAYMENT' 
  | 'FINALIZATION' 
  | 'REFUND' 
  | 'AUDIT_INSPECTION' 
  | 'PENALTY' 
  | 'TAX_CALENDAR';

export type TriStateResponse = 
  | 'QUALIFIED_ANSWER' 
  | 'CONDITIONAL_ANSWER' 
  | 'INSUFFICIENT_REVIEW_ESCALATE';

export interface ExactSpan {
  id: string;
  article: string; // e.g. "Điều 9"
  clause?: string; // e.g. "Khoản 1"
  point?: string; // e.g. "Điểm b"
  spanText: string;
  sourceDocNumber: string;
  effectiveDate: string;
  expirationDate?: string;
  status: LegalStatus;
}

export interface GraphNode {
  id: string;
  label: string;
  layer: LayerType;
  subType: string;
  title: string;
  summary: string;
  legalStatus?: LegalStatus;
  effectiveDate?: string;
  expirationDate?: string;
  issuingAuthority?: string;
  docNumber?: string;
  exactSpans?: ExactSpan[];
  // Layer-specific fields
  formula?: string;
  taxRate?: string;
  accountCode?: string; // e.g. TK 635
  businessEventCode?: string; // e.g. EVENT_PAY_INTEREST
  loId?: string; // e.g. TAX_LO_CIT_INTEREST_30_001
  riskLevel?: 'Low' | 'Medium' | 'High' | 'Critical';
  examTrapWarning?: string;
}

export type RelationshipType = 
  | 'AMENDS'
  | 'REPLACES'
  | 'CLARIFIES'
  | 'IMPLEMENTS'
  | 'GOVERNS'
  | 'MAPS_TO_EVENT'
  | 'MAPS_TO_ACCOUNT'
  | 'DEFINES_CONCEPT'
  | 'EVALUATES_RISK'
  | 'TESTS_LO'
  | 'REQUIRES_VOUCHER'
  | 'TRIGGERS_LIFECYCLE';

export interface GraphEdge {
  id: string;
  source: string;
  target: string;
  type: RelationshipType;
  description?: string;
}

export interface EvidenceStep {
  stepIndex: number;
  entity: string;
  concept: string;
  legalCitation: string;
  citationId: number;
  exactSpan: ExactSpan;
}

export interface ReasoningResult {
  triState: TriStateResponse;
  conclusion: string;
  evidenceChain: EvidenceStep[];
  citations: ExactSpan[];
  complianceChecklist: {
    item: string;
    mandatory: boolean;
    verificationStatus: 'Satisfied' | 'Missing' | 'Conditional';
    auditNote: string;
  }[];
  auditWarning: {
    riskTitle: string;
    penaltyRisk: string;
    interestRate: string; // 0.03%/ngày
    recommendedAction: string;
  };
  // CPA Learning Mode specific
  learningModeAddon?: {
    atomicLOs: string[];
    examTrapAnalysis: string;
    flashcards: {
      question: string;
      answer: string;
      source: string;
    }[];
    quizQuestion: {
      scenario: string;
      options: string[];
      correctIndex: number;
      explanation: string;
      trapHint: string;
    };
  };
  // Graph context
  retrievedSubgraph: {
    nodes: GraphNode[];
    edges: GraphEdge[];
  };
  executionTimeMs: number;
  temporalFilterApplied: string;
}

export interface IngestionDocumentInput {
  docType: RegulatoryType;
  docNumber: string;
  title: string;
  issuingAuthority: string;
  promulgationDate: string;
  effectiveDate: string;
  expirationDate?: string;
  replacesDocNumber?: string;
  amendsDocNumber?: string;
  rawText: string;
  businessEventTarget?: string;
  accountingAccountTarget?: string;
}

export interface ExtractedLO {
  lo_id: string;
  tax_concept: string;
  rule_conditions: string[];
  formula?: string;
  exact_span: string;
  maps_to_event: string;
  maps_to_account: string;
}

export interface IngestionResult {
  cataloging: {
    docType: RegulatoryType;
    docNumber: string;
    issuingAuthority: string;
    effectiveDate: string;
    relationshipCreated: string;
    supersededDoc?: string;
  };
  extractedLOs: ExtractedLO[];
  cypherStatements: string[];
}

export interface GoldenSetTestCase {
  id: string;
  name: string;
  category: 'CIT_TRANSFER_PRICING' | 'VAT_IMPORT_ALLOCATION' | 'SAFE_ABSTENTION';
  description: string;
  query: string;
  transactionDate: string;
  inputConditions: Record<string, any>;
  expectedTriState: TriStateResponse;
  expectedCitations: string[];
  expectedRuleOutcome: string;
  testPassed?: boolean;
  actualTriState?: TriStateResponse;
  auditNotes?: string;
}

export interface SanityAuditReport {
  orphanNodes: {
    orphanTaxConcepts: number;
    unmappedBusinessEvents: number;
    supersededWithoutReplaces: number;
    details: string[];
  };
  testResults: GoldenSetTestCase[];
  kpis: {
    legalAccuracy: number; // Target >= 99%
    temporalCorrectness: number; // Target = 100%
    citationIntegrity: number; // Target = 100%
    safeAbstention: number; // Target >= 99%
    criticalHallucination: number; // Target = 0%
  };
  releaseStatus: 'PASSED - READY FOR RELEASE' | 'FAILED - REJECTED';
  generatedAt: string;
  auditorAgent: string;
}
