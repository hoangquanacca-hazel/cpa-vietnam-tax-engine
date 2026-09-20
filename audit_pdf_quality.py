import pathlib
import json
import pypdf

pdf_dir = pathlib.Path(r'D:\cpa-vietnam-master-tax-knowledge-graph-engine\Vietnamese tax')
pdf_files = list(pdf_dir.rglob('*.pdf'))

results = []
summary = {
    "total_pdfs": len(pdf_files),
    "digital_text_good": 0,
    "pure_image_scan": 0,
    "low_quality_ocr_needed": 0,
    "error_reading": 0
}

for idx, p in enumerate(pdf_files, 1):
    rel_path = str(p.relative_to(pdf_dir))
    try:
        reader = pypdf.PdfReader(str(p))
        num_pages = len(reader.pages)
        total_chars = 0
        sample_pages = reader.pages[:10]
        for page in sample_pages:
            txt = page.extract_text() or ''
            total_chars += len(txt.strip())
        
        avg_chars = total_chars / len(sample_pages) if sample_pages else 0
        
        if total_chars == 0:
            status = "PURE_IMAGE_SCAN"
            summary["pure_image_scan"] += 1
        elif avg_chars < 80:
            status = "LOW_QUALITY_SCAN"
            summary["low_quality_ocr_needed"] += 1
        else:
            status = "DIGITAL_TEXT_GOOD"
            summary["digital_text_good"] += 1
            
        results.append({
            "id": idx,
            "filename": p.name,
            "relative_path": rel_path,
            "pages": num_pages,
            "total_chars_sample": total_chars,
            "avg_chars_per_page": round(avg_chars, 1),
            "status": status
        })
    except Exception as err:
        summary["error_reading"] += 1
        results.append({
            "id": idx,
            "filename": p.name,
            "relative_path": rel_path,
            "error": str(err),
            "status": "ERROR"
        })

output_report = {
    "summary": summary,
    "scanned_files_list": [r for r in results if r["status"] in ("PURE_IMAGE_SCAN", "LOW_QUALITY_SCAN")],
    "good_files_list": [r for r in results if r["status"] == "DIGITAL_TEXT_GOOD"]
}

with open(r'D:\cpa-vietnam-master-tax-knowledge-graph-engine\pdf_audit_report.json', 'w', encoding='utf-8') as f:
    json.dump(output_report, f, ensure_ascii=False, indent=2)

print("Saved report to pdf_audit_report.json successfully.")
