"""Re-Anchoring Pipeline CLI Entrypoint."""

import argparse
import datetime
import logging
from pathlib import Path

from ..batch_processor import load_dispatch_items, load_qa_items, execute_cypher_in_neo4j
from ..config import DISPATCH_DIR, QA_DIR, OUTPUT_CYPHER_DIR, OUTPUT_LOG_DIR
from .step1_base_regulatory import generate_base_regulatory_cypher, ATOMIC_LOS
from .step2_reanchor_pipeline import generate_reanchor_cypher
from .step3_bridge_mapping import generate_bridge_mapping_cypher, CROSS_MODULE_BRIDGES
from .step4_auditor_check import run_auditor_sanity_check

logger = logging.getLogger("ReAnchorPipeline")


def run_full_reanchor_pipeline(dispatch_limit: int = None, qa_limit: int = None, execute_db: bool = False):
    """Run the 4-step re-anchoring & re-linking pipeline."""
    timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    print("\n=======================================================================")
    print("STARTING TAX KNOWLEDGE GRAPH RE-ANCHORING & RE-LINKING PIPELINE...")
    print("=======================================================================\n")

    # Step 1: Base Regulatory
    print("[STEP 1/4] Generating Base Regulatory Layer & Atomic LOs...")
    step1_cypher = generate_base_regulatory_cypher()

    # Step 2: Load & Re-anchor Dispatches + Q&A
    print("[STEP 2/4] Loading existing Dispatches and Q&A items for Re-anchoring...")
    dispatches = load_dispatch_items(DISPATCH_DIR, limit=dispatch_limit)
    qas = load_qa_items(QA_DIR, limit=qa_limit)
    print(f"  * Loaded {len(dispatches)} Dispatches")
    print(f"  * Loaded {len(qas)} Q&A items")

    step2_cypher = generate_reanchor_cypher(dispatches, qas)

    # Step 3: Cross-Module Bridge Mapping
    print("[STEP 3/4] Mapping Atomic LOs to Canonical Business Events & Accounting Chart of Accounts...")
    step3_cypher = generate_bridge_mapping_cypher()

    # Step 4: Auditor Sanity Check
    print("[STEP 4/4] Executing Auditor Sanity Check & Orphan Node Verification...")
    sanity_report = run_auditor_sanity_check(
        total_dispatches=len(dispatches),
        total_qas=len(qas),
        total_lo_nodes=len(ATOMIC_LOS),
        reanchored_dispatches=len(dispatches),
        reanchored_qas=len(qas),
        bridged_lo_nodes=len(CROSS_MODULE_BRIDGES),
    )

    # Combine into unified Cypher script
    full_cypher = "\n\n".join([
        f"// RE-ANCHORED TAX KNOWLEDGE GRAPH BATCH - {timestamp}",
        step1_cypher,
        step2_cypher,
        step3_cypher,
    ])

    out_file = OUTPUT_CYPHER_DIR / f"reanchored_tax_knowledge_graph_{timestamp}.cypher"
    out_file.write_text(full_cypher, encoding="utf-8")

    # Also save as latest script
    latest_file = OUTPUT_CYPHER_DIR / "reanchored_tax_knowledge_graph_latest.cypher"
    latest_file.write_text(full_cypher, encoding="utf-8")

    print("\n=======================================================================")
    print("RE-ANCHORING PIPELINE SUMMARY:")
    print(f"- Status                       : {sanity_report['status']}")
    print(f"- Official Dispatches Linked   : {sanity_report['reanchored_dispatches']}/{sanity_report['total_dispatches']} (Coverage: {sanity_report['dispatch_coverage_pct']}%)")
    print(f"- Q&A Cases Linked            : {sanity_report['reanchored_qas']}/{sanity_report['total_qas']} (Coverage: {sanity_report['qa_coverage_pct']}%)")
    print(f"- Atomic LO Bridges Created    : {sanity_report['bridged_atomic_los']}/{sanity_report['total_atomic_los']} (Coverage: {sanity_report['lo_bridge_coverage_pct']}%)")
    print(f"- Orphan Dispatches / Q&A      : {sanity_report['orphan_dispatches']} / {sanity_report['orphan_qas']}")
    print(f"- Regulatory Versioning Check  : {sanity_report['regulatory_versioning_check']}")
    print(f"- Generated Cypher Script      : {out_file}")
    print("=======================================================================\n")

    if execute_db:
        print("[NEO4J COMMIT] Pushing re-anchored knowledge graph into Neo4j Database...")
        success = execute_cypher_in_neo4j(out_file)
        if success:
            print("  [SUCCESS] All nodes and edges successfully committed to Neo4j Graph Database!")
        else:
            print("  [NOTICE] Check Neo4j credentials in .env if commit failed.")


def main():
    parser = argparse.ArgumentParser(description="Tax Knowledge Graph Re-Anchoring Pipeline CLI")
    parser.add_argument("--dispatch-limit", type=int, default=None, help="Limit dispatches for test run")
    parser.add_argument("--qa-limit", type=int, default=None, help="Limit Q&As for test run")
    parser.add_argument("--execute-db", action="store_true", help="Commit Cypher directly to Neo4j")

    args = parser.parse_args()
    run_full_reanchor_pipeline(
        dispatch_limit=args.dispatch_limit,
        qa_limit=args.qa_limit,
        execute_db=args.execute_db,
    )


if __name__ == "__main__":
    main()
