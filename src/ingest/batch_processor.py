"""Batch Processor for Vietnamese Tax Ingestion Pipeline."""

import datetime
import itertools
import json
import logging
from pathlib import Path
from typing import List, Dict, Any, Generator

from jinja2 import Environment, FileSystemLoader

from .config import (
    DISPATCH_DIR,
    QA_DIR,
    OUTPUT_CYPHER_DIR,
    OUTPUT_LOG_DIR,
    NEO4J_URI,
    NEO4J_USER,
    NEO4J_PASSWORD,
    NEO4J_DATABASE,
    BATCH_SIZE,
)
from .llm_extractor import extract_document

# Setup logger
log_file = OUTPUT_LOG_DIR / f"ingestion_{datetime.datetime.now().strftime('%Y%m%d_%H%M%S')}.log"
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(name)s - %(message)s",
    handlers=[
        logging.FileHandler(log_file, encoding="utf-8"),
        logging.StreamHandler(),
    ],
)
logger = logging.getLogger("BatchProcessor")

# Setup Jinja2 environment
template_dir = Path(__file__).parent
jinja_env = Environment(loader=FileSystemLoader(template_dir), autoescape=False)
cypher_template = jinja_env.get_template("cypher_template.j2")


def _chunk_iterable(iterable: List[Any], chunk_size: int) -> Generator[List[Any], None, None]:
    """Yield successive chunks from iterable."""
    it = iter(iterable)
    while True:
        chunk = list(itertools.islice(it, chunk_size))
        if not chunk:
            break
        yield chunk


def load_dispatch_items(dispatch_path: Path, limit: int = None) -> List[Dict[str, Any]]:
    """Load dispatch text files."""
    files = []
    if dispatch_path.is_dir():
        files = sorted(list(dispatch_path.glob("*.txt")))
    elif dispatch_path.is_file():
        files = [dispatch_path]

    if limit:
        files = files[:limit]

    items = []
    for f in files:
        content = f.read_text(encoding="utf-8", errors="ignore")
        items.append({"id": f.stem, "content": content, "filename": f.name})
    return items


def load_qa_items(qa_path: Path, limit: int = None) -> List[Dict[str, Any]]:
    """Load Q&A items from directory containing json, jsonl, or txt files."""
    items = []
    if qa_path.is_dir():
        jsonl_files = list(qa_path.glob("*.jsonl"))
        json_files = list(qa_path.glob("*.json"))
        txt_files = list(qa_path.glob("*.txt"))

        if jsonl_files:
            for jf in jsonl_files:
                with open(jf, "r", encoding="utf-8") as file:
                    for line in file:
                        line = line.strip()
                        if line:
                            try:
                                data = json.loads(line)
                                text_content = f"Title: {data.get('title', '')}\nQuestion: {data.get('question', data.get('content', ''))}\nAnswer: {data.get('answer', '')}"
                                items.append({"id": data.get("id", f"QA_{len(items)}"), "content": text_content})
                            except Exception:
                                pass
                            if limit and len(items) >= limit:
                                break
        elif json_files:
            for jf in json_files:
                if jf.name == "SUMMARY.json":
                    continue
                try:
                    with open(jf, "r", encoding="utf-8") as file:
                        data = json.load(file)
                        if isinstance(data, list):
                            for idx, entry in enumerate(data):
                                text_content = f"Question: {entry.get('question', '')}\nAnswer: {entry.get('answer', '')}"
                                items.append({"id": entry.get("id", f"QA_{idx}"), "content": text_content})
                except Exception:
                    pass
        elif txt_files:
            for tf in txt_files:
                content = tf.read_text(encoding="utf-8", errors="ignore")
                items.append({"id": tf.stem, "content": content})

    if limit:
        items = items[:limit]
    return items


def render_and_save_cypher(
    batch_type: str,
    batch_num: int,
    extracted_data: List[Dict[str, Any]],
    timestamp: str,
) -> Path:
    """Render extracted data into Cypher script and save to disk."""
    events = []
    accounts = []
    dispatches = []
    qas = []

    for item in extracted_data:
        if "event" in item and item["event"]:
            events.append(item["event"])
        if "account" in item and item["account"]:
            accounts.append(item["account"])
        if "dispatch" in item and item["dispatch"]:
            dispatches.append(item["dispatch"])
        if "qa" in item and item["qa"]:
            qas.append(item)

    batch_name = f"{batch_type}_batch_{batch_num:02d}_{timestamp}"
    rendered_cypher = cypher_template.render(
        batch_name=batch_name,
        timestamp=timestamp,
        events=events,
        accounts=accounts,
        dispatches=dispatches,
        qas=qas,
    )

    filename = f"{batch_type}_batch_{batch_num:02d}_{timestamp}.cypher"
    file_path = OUTPUT_CYPHER_DIR / filename
    file_path.write_text(rendered_cypher, encoding="utf-8")

    logger.info(f"Generated Cypher script: {file_path}")
    return file_path


def execute_cypher_in_neo4j(cypher_file: Path) -> bool:
    """Execute generated Cypher script against Neo4j database."""
    if not NEO4J_PASSWORD or NEO4J_PASSWORD == "your_password_here":
        logger.warning("Neo4j password not configured. Skipping live database commit.")
        return False

    try:
        from neo4j import GraphDatabase

        logger.info(f"Connecting to Neo4j database at {NEO4J_URI}...")
        driver = GraphDatabase.driver(NEO4J_URI, auth=(NEO4J_USER, NEO4J_PASSWORD))

        cypher_text = cypher_file.read_text(encoding="utf-8")
        # Split statements by semicolon
        statements = [stmt.strip() for stmt in cypher_text.split(";") if stmt.strip() and not stmt.strip().startswith("//")]

        session_kwargs = {}
        if NEO4J_DATABASE:
            session_kwargs["database"] = NEO4J_DATABASE

        with driver.session(**session_kwargs) as session:
            with session.begin_transaction() as tx:
                for stmt in statements:
                    tx.run(stmt)
                tx.commit()

        driver.close()
        logger.info(f"Successfully committed Cypher script {cypher_file.name} to Neo4j!")
        return True

    except Exception as err:
        logger.error(f"Failed to execute Cypher in Neo4j: {err}")
        return False


def run_batch_ingestion(
    dispatch_limit: int = None,
    qa_limit: int = None,
    batch_size: int = BATCH_SIZE,
    execute_db: bool = False,
) -> Dict[str, Any]:
    """Execute the full ingestion pipeline."""
    timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    results = {"dispatches_processed": 0, "qa_processed": 0, "cypher_files": []}

    logger.info("Starting Vietnamese Tax Batch Ingestion Agent...")

    # Process Dispatches
    dispatch_items = load_dispatch_items(DISPATCH_DIR, limit=dispatch_limit)
    logger.info(f"Loaded {len(dispatch_items)} official dispatch documents.")

    for idx, chunk in enumerate(_chunk_iterable(dispatch_items, batch_size), start=1):
        logger.info(f"Processing Dispatch Batch {idx} ({len(chunk)} items)...")
        extracted_chunk = []
        for item in chunk:
            extracted = extract_document(item["content"], doc_type="dispatch")
            extracted_chunk.append(extracted)

        cypher_file = render_and_save_cypher("dispatches", idx, extracted_chunk, timestamp)
        results["cypher_files"].append(str(cypher_file))
        results["dispatches_processed"] += len(chunk)

        if execute_db:
            execute_cypher_in_neo4j(cypher_file)

    # Process Q&A Items
    qa_items = load_qa_items(QA_DIR, limit=qa_limit)
    logger.info(f"Loaded {len(qa_items)} Q&A items.")

    for idx, chunk in enumerate(_chunk_iterable(qa_items, batch_size), start=1):
        logger.info(f"Processing Q&A Batch {idx} ({len(chunk)} items)...")
        extracted_chunk = []
        for item in chunk:
            extracted = extract_document(item["content"], doc_type="qa")
            extracted_chunk.append(extracted)

        cypher_file = render_and_save_cypher("qa", idx, extracted_chunk, timestamp)
        results["cypher_files"].append(str(cypher_file))
        results["qa_processed"] += len(chunk)

        if execute_db:
            execute_cypher_in_neo4j(cypher_file)

    logger.info("Batch Ingestion completed successfully!")
    return results
