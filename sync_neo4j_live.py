import os
import json
from dotenv import load_dotenv
from neo4j import GraphDatabase

load_dotenv()

uri = os.getenv("NEO4J_URI")
user = os.getenv("NEO4J_USER") or os.getenv("NEO4J_USERNAME")
pwd = os.getenv("NEO4J_PASSWORD")
db = os.getenv("NEO4J_DATABASE")

driver = GraphDatabase.driver(uri, auth=(user, pwd))
session_kwargs = {"database": db} if db else {}

with driver.session(**session_kwargs) as session:
    print("1. Unifying Labels in Live Neo4j Database...")
    session.run("MATCH (n:OFFICIAL_DISPATCH) SET n:OfficialLetter")
    session.run("MATCH (n:PRACTICAL_QA) SET n:QA_Pair")

    print("2. Linking Official Dispatches to Legal Paragraphs & Atomic LOs...")
    session.run("""
        MATCH (d:OfficialLetter)
        MATCH (p:LegalParagraph {id: 'PARA_L48_D13'})
        MATCH (lo:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
        MERGE (d)-[:INTERPRETS]->(p)
        MERGE (d)-[:APPLIES_TO]->(lo)
    """)

    print("3. Linking Q&A Cases to Legal Paragraphs & Atomic LOs...")
    session.run("""
        MATCH (q:QA_Pair)
        MATCH (p:LegalParagraph {id: 'PARA_L48_D13'})
        MATCH (lo:Atomic_LO {id: 'LO_VAT_INPUT_DEDUCTION_CONDITIONS'})
        MERGE (q)-[:INTERPRETS]->(p)
        MERGE (q)-[:ILLUSTRATES]->(lo)
    """)

    print("4. Querying Updated Live Neo4j Stats...")
    node_count = session.run("MATCH (n) RETURN count(n) AS c").single()["c"]
    rel_count = session.run("MATCH ()-[r]->() RETURN count(r) AS c").single()["c"]

    rel_records = session.run("MATCH ()-[r]->() RETURN type(r) AS type, count(r) AS count ORDER BY count DESC")
    rels = {r["type"]: r["count"] for r in rel_records}

driver.close()

report = {
    "status": "LIVE NEO4J RE-ANCHORING COMPLETE",
    "total_nodes": node_count,
    "total_relationships": rel_count,
    "relationship_types": rels
}
print("\n================ LIVE NEO4J DATABASE REPORT ================")
print(json.dumps(report, indent=2, ensure_ascii=False))
print("============================================================\n")
