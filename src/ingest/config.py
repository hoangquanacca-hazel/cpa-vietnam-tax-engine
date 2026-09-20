"""Configuration for the Vietnamese Tax Batch Ingestion package."""

import os
from pathlib import Path
from dotenv import load_dotenv

# Load environment variables from .env if present
load_dotenv()

BASE_DIR = Path(__file__).resolve().parents[2]

# Input data directories (defaults to D:\GDT-vanban and D:\ChatbotThue)
DISPATCH_DIR = Path(os.getenv("DISPATCH_DIR", r"D:\GDT-vanban\cleaned\txt"))
QA_DIR = Path(os.getenv("QA_DIR", r"D:\ChatbotThue\mof-faq"))
OUTPUT_CYPHER_DIR = Path(os.getenv("OUTPUT_CYPHER_DIR", BASE_DIR / "outputs" / "cypher"))
OUTPUT_LOG_DIR = Path(os.getenv("OUTPUT_LOG_DIR", BASE_DIR / "outputs" / "logs"))

LLM_MODEL = os.getenv("LLM_MODEL", "gemini-1.5-flash")
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY", "")
GEMINI_API_KEY = os.getenv("GEMINI_API_KEY", "")

NEO4J_URI = os.getenv("NEO4J_URI", "bolt://localhost:7687")
NEO4J_USER = os.getenv("NEO4J_USER") or os.getenv("NEO4J_USERNAME") or "neo4j"
NEO4J_PASSWORD = os.getenv("NEO4J_PASSWORD", "")
NEO4J_DATABASE = os.getenv("NEO4J_DATABASE", "")

BATCH_SIZE = int(os.getenv("BATCH_SIZE", "100"))

# Ensure output directories exist
OUTPUT_CYPHER_DIR.mkdir(parents=True, exist_ok=True)
OUTPUT_LOG_DIR.mkdir(parents=True, exist_ok=True)
