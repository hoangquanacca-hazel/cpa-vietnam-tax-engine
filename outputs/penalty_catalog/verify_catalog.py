#!/usr/bin/env python3
"""Mechanical evidence gate for penalty_catalog.json (no simulated data, no fallback).

For every money row the exact phrase  'từ <min> đồng đến <max> đồng'  must occur in the cited source:
  - nguon contains '125': inside the text of the same Điều of NĐ125 (sources/nd125_dieu1-36.txt)
  - nguon contains '310': anywhere in sources/nd310_2025_ocr.md (OCR; article slicing is unreliable)
  - nguon contains '102': anywhere in sources/nd102_2021_dieu1-9.txt (NĐ102/2021 Điều 1 amends NĐ125)
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
nd102 = norm((D / "sources/nd102_2021_dieu1-9.txt").read_text(encoding="utf-8"))

# slice NĐ125 per Điều (heading at line start)
heads = [(m.start(), int(m.group(1))) for m in re.finditer(r"(?m)^\s*Điều\s+(\d+)[\.\s]", nd125)]
art = {}
for i, (pos, n) in enumerate(heads):
    end = heads[i + 1][0] if i + 1 < len(heads) else len(nd125)
    art.setdefault(n, "")
    art[n] += nd125[pos:end]
art = {k: norm(v) for k, v in art.items()}

# customs decrees (NĐ169/2026, NĐ128/2020): text per Điều, sliced with the same cleaner the extractor uses
import importlib.util
_spec = importlib.util.spec_from_file_location("extract_hq", D / "hq" / "extract_hq.py")
ex = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(ex)
cus = {}
for _ng, _m in ex.DECREES.items():
    _ch = ex.split_dieu(ex.clean_lines((D / "sources_hq" / _m["file"]).read_text(encoding="utf-8")), _m["first"], _m["last"])
    cus[_ng] = {d: norm(" ".join(b)) for d, (_t, b) in _ch.items()}

data = json.loads((D / "penalty_catalog.json").read_text(encoding="utf-8"))
fails, ok, skipped = [], 0, 0

# completeness (customs): every 'Phạt tiền từ X đồng đến Y đồng' statement in a Điều is covered by exactly one row group
for _ng in cus:
    for _d, _body in cus[_ng].items():
        _src = sorted(re.findall(r"phạt tiền từ ([\d\.]+)(?: đồng)? đến ([\d\.]+) đồng", _body))
        _grp = {(r["khoan"], r["min_vnd"], r["max_vnd"]) for r in data["rows"]
                if r["nguon"] == _ng and r["dieu"] == _d and r["hinh_thuc"] == "Phạt tiền (khung)"}
        _got = sorted((vnd(a), vnd(b)) for _k, a, b in _grp)
        _exp = sorted((vnd(int(a.replace(".", ""))), vnd(int(b.replace(".", "")))) for a, b in _src)
        if _got != _exp:
            fails.append(("COMPLETENESS", f"{_ng} Điều {_d}: source statements {len(_exp)} vs row groups {len(_got)}"))

# row-set completeness (customs): the catalog holds exactly the rows the extractor produced (no point dropped or invented)
_ext = json.loads((D / "hq" / "customs_rows.json").read_text(encoding="utf-8"))["rows"]
_k = lambda r: (r["nguon"], r["dieu"], r["khoan"], r["diem"], r["hanh_vi"])
_a = {_k(r) for r in _ext}
_b = {_k(r) for r in data["rows"] if r["nguon"] in cus}
for x in sorted(_a - _b, key=str)[:20]:
    fails.append(("MISSING-ROW", f"extracted but absent from the catalog: {x[:4]}"))
for x in sorted(_b - _a, key=str)[:20]:
    fails.append(("EXTRA-ROW", f"in the catalog but not extracted: {x[:4]}"))

for r in data["rows"]:
    src = r["nguon"]
    if src in cus:      # customs rows
        body = cus[src].get(r["dieu"], "")
        if r["min_vnd"] is not None:
            phrase = norm(f"phạt tiền từ {vnd(r['min_vnd'])} đồng đến {vnd(r['max_vnd'])} đồng")
            phrase2 = norm(f"phạt tiền từ {vnd(r['min_vnd'])} đến {vnd(r['max_vnd'])} đồng")   # 'từ X đến Y đồng' (NĐ128 Điều 24.1)
            if phrase in body or phrase2 in body:
                ok += 1
            else:
                fails.append((r["id"], f"{src} Điều {r['dieu']}.{r['khoan']}{r['diem']}: '{phrase}' not in the Điều"))
        elif r["hinh_thuc"] == "Phạt theo tỷ lệ":
            if norm(r["ty_le"].split(";")[0])[:60] in body:
                ok += 1
            else:
                fails.append((r["id"], f"{src} Điều {r['dieu']}.{r['khoan']}{r['diem']}: tỷ lệ text not in the Điều"))
        else:
            skipped += 1
        if norm(r["hanh_vi"])[:50] not in body:
            fails.append((r["id"], f"{src} Điều {r['dieu']}.{r['khoan']}{r['diem']}: act text not found in the Điều"))
        continue
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
    if "102" in src and phrase in nd102:
        hit.append("102")
    if hit:
        ok += 1
    else:
        fails.append((r["id"], f"Điều {r['dieu']}.{r['khoan']}{r['diem']} '{phrase}' not found in cited source '{src}'"))

report = [f"rows={len(data['rows'])} money/ratio_ok={ok} non_money_skipped={skipped} FAIL={len(fails)}"]
report += [f"FAIL {i}: {m}" for i, m in fails]
(D / "verify_report.txt").write_text("\n".join(report) + "\n", encoding="utf-8")
print("\n".join(report))
sys.exit(1 if fails else 0)
