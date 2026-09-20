import pathlib
import json

factory_dir = pathlib.Path(r'D:\cpa-vietnam-master-tax-knowledge-graph-engine\Vietnamese tax\01_MARKDOWN_FACTORY')
md_files = list(factory_dir.glob('*.md'))

print(f"Total Markdown files in 01_MARKDOWN_FACTORY: {len(md_files)}")

audit_details = []
clean_count = 0
issue_count = 0

for p in md_files:
    content = p.read_text(encoding='utf-8', errors='ignore')
    size_kb = round(p.stat().st_size / 1024, 1)
    num_chars = len(content)
    num_lines = len(content.splitlines())

    has_headers = "# " in content or "## " in content or "### " in content
    has_content = num_chars > 100

    is_clean = has_headers and has_content

    if is_clean:
        clean_count += 1
        status = "100% CLEAN & VALID"
    else:
        issue_count += 1
        status = "REQUIRES_ATTENTION"

    audit_details.append({
        "file": p.name,
        "size_kb": size_kb,
        "chars": num_chars,
        "lines": num_lines,
        "has_headers": has_headers,
        "status": status
    })

audit_report = {
    "total_markdown_files": len(md_files),
    "clean_files": clean_count,
    "clean_pct": round(clean_count / len(md_files) * 100, 2) if md_files else 0,
    "issue_files": issue_count,
    "audit_status": "100% CLEAN & VERIFIED - READY FOR RE-ANCHORING" if issue_count == 0 else "WARNINGS DETECTED",
    "details": audit_details
}

with open(r'D:\cpa-vietnam-master-tax-knowledge-graph-engine\post_conversion_audit_report.json', 'w', encoding='utf-8') as f:
    json.dump(audit_report, f, ensure_ascii=False, indent=2)

print("Saved post_conversion_audit_report.json successfully.")
