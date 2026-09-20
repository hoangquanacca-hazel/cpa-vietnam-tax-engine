"""CLI entrypoint for Vietnamese Tax Ingestion package."""

import argparse
import sys
from .batch_processor import run_batch_ingestion


def main():
    parser = argparse.ArgumentParser(
        description="Vietnamese Tax Batch Ingestion CLI - Extract entities, relationships & generate Cypher scripts."
    )
    parser.add_argument(
        "--dispatch-limit",
        type=int,
        default=None,
        help="Limit number of dispatches to process",
    )
    parser.add_argument(
        "--qa-limit",
        type=int,
        default=None,
        help="Limit number of Q&A items to process",
    )
    parser.add_argument(
        "--batch-size",
        type=int,
        default=100,
        help="Batch size per Cypher output file (default: 100)",
    )
    parser.add_argument(
        "--execute-db",
        action="store_true",
        help="Execute generated Cypher directly against Neo4j database using credentials in .env",
    )

    args = parser.parse_args()

    results = run_batch_ingestion(
        dispatch_limit=args.dispatch_limit,
        qa_limit=args.qa_limit,
        batch_size=args.batch_size,
        execute_db=args.execute_db,
    )

    print("\n=======================================================")
    print("INGESTION SUMMARY:")
    print(f"- Dispatches Processed : {results['dispatches_processed']}")
    print(f"- Q&A Items Processed : {results['qa_processed']}")
    print(f"- Cypher Output Files : {len(results['cypher_files'])}")
    for cf in results["cypher_files"]:
        print(f"  * {cf}")
    print("=======================================================\n")


if __name__ == "__main__":
    main()
