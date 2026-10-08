#!/usr/bin/env python3
"""Mechanical evidence gate for penalty_catalog.json (no simulated data, no fallback).

For every money row the exact phrase  'từ <min> đồng đến <max> đồng'  must occur in the cited source:
  - nguon contains '125': inside the text of the same Điều of NĐ125 (sources/nd125_dieu1-36.txt)
  - nguon contains '310': anywhere in sources/nd310_2025_ocr.md (OCR; article slicing is unreliable)
Row passes if ANY cited source matches. Exit code 1 if any row fails.
"""
import json
import pathlib
import re
import sys

D = pathlib.Path(__file__).parent


def norm(s):
    return re.sub(r"\s+", " ", s.replace(" ", " ")).strip().lower()


def vnd(n):
    return f"{n:,}".replace(",", ".")


nd125 = (D / "sources/nd125_dieu1-36.txt").read_text(encoding="utf-8")
nd310 = norm((D / "sources/nd310_2025_ocr.md").read_text(encoding="utf-8"))

# slice NĐ125 per Điều (heading at line start)
heads = [(m.start(), int(m.group(1))) for m in re.finditer(r"(?m)^\s*Điều\s+(\d+)[\.\s]", nd125)]
art = {}
for i, (pos, n) in enumerate(heads):
    end = heads[i + 1][0] if i + 1 < len(heads) else len(nd125)
    art.setdefault(n, "")
    art[n] += nd125[pos:end]
art = {k: norm(v) for k, v in art.items()}

data = json.loads((D / "penalty_catalog.json").read_text(encoding="utf-8"))
fails, ok, skipped = [], 0, 0
for r in data["rows"]:
    src = r["nguon"]
    if r["min_vnd"] is None:
        # non-money row: Điều must exist in the cited source; ratio rows must show the rate wording
        found = (("125" in src and r["dieu"] in art) or ("310" in src))
        if "125" in src and r["dieu"] not in art:
            fails.append((r["id"], f"Điều {r['dieu']} not found in NĐ125 text"))
        elif r["hinh_thuc"] == "Phạt theo tỷ lệ" and r["dieu"] in (16, 17):
            needle = "20%" if r["dieu"] == 16 else "1,5 lần"
            if needle not in art[r["dieu"]]:
                fails.append((r["id"], f"'{needle}' not in Điều {r['dieu']}"))
            else:
                ok += 1
        else:
            skipped += 1
        continue
    phrase = norm(f"từ {vnd(r['min_vnd'])} đồng đến {vnd(r['max_vnd'])} đồng")
    hit = []
    if "125" in src and phrase in art.get(r["dieu"], ""):
        hit.append("125")
    if "310" in src and phrase in nd310:
        hit.append("310")
    if hit:
        ok += 1
    else:
        fails.append((r["id"], f"Điều {r['dieu']}.{r['khoan']}{r['diem']} '{phrase}' not found in cited source '{src}'"))

report = [f"rows={len(data['rows'])} money/ratio_ok={ok} non_money_skipped={skipped} FAIL={len(fails)}"]
report += [f"FAIL {i}: {m}" for i, m in fails]
(D / "verify_report.txt").write_text("\n".join(report) + "\n", encoding="utf-8")
print("\n".join(report))
sys.exit(1 if fails else 0)
