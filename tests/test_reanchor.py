"""Unit tests for Tax Knowledge Graph Re-Anchoring Pipeline."""

import pytest
from pathlib import Path
from src.ingest.reanchor.step1_base_regulatory import generate_base_regulatory_cypher
from src.ingest.reanchor.step2_reanchor_pipeline import generate_reanchor_cypher
from src.ingest.reanchor.step3_bridge_mapping import generate_bridge_mapping_cypher
from src.ingest.reanchor.step4_auditor_check import run_auditor_sanity_check


def test_base_regulatory_cypher_generation():
    cypher = generate_base_regulatory_cypher()
    assert "LegalDoc" in cypher
    assert "LegalParagraph" in cypher
    assert "Atomic_LO" in cypher
    assert "[:SUPERSEDES]" in cypher or "[:GUIDES]" in cypher
    assert "[:BASED_ON]" in cypher


def test_reanchor_pipeline_zero_orphans():
    sample_dispatches = [{"id": "CV_565", "content": "Khấu trừ thuế GTGT đầu vào có hóa đơn"}]
    sample_qas = [{"id": "QA_VAT_01", "content": "Điều kiện chi phí được trừ TNDN"}]

    cypher = generate_reanchor_cypher(sample_dispatches, sample_qas)
    assert "OfficialLetter" in cypher
    assert "QA_Pair" in cypher
    assert "[:INTERPRETS]" in cypher
    assert "[:APPLIES_TO]" in cypher or "[:ILLUSTRATES]" in cypher


def test_bridge_mapping_vas_vsa():
    cypher = generate_bridge_mapping_cypher()
    assert "BusinessEvent" in cypher
    assert "AccountCode" in cypher
    assert "[:MAPS_TO_EVENT]" in cypher
    assert "[:MAPS_TO_ACCOUNT]" in cypher


def test_auditor_sanity_check_metrics():
    report = run_auditor_sanity_check(
        total_dispatches=130,
        total_qas=1000,
        total_lo_nodes=5,
        reanchored_dispatches=130,
        reanchored_qas=1000,
        bridged_lo_nodes=5,
    )
    assert report["orphan_dispatches"] == 0
    assert report["orphan_qas"] == 0
    assert report["dispatch_coverage_pct"] == 100.0
    assert report["qa_coverage_pct"] == 100.0
    assert report["status"] == "PASSED - ZERO ORPHAN NODES"
