#!/usr/bin/env python3
"""Extract customs penalty rows (NĐ 169/2026 and NĐ 128/2020) from the official gazette text.

Text is taken verbatim from ../sources_hq/*.txt (pdftotext of the gazette PDFs, no OCR). Nothing is typed by hand:
amounts, acts and conditions are cut out of the source paragraphs by structure (khoản "1." / điểm "a)").
Rows are written to customs_rows.json; extract_report.txt lists counts and every structural anomaly.
"""
import json
import pathlib
import re

HERE = pathlib.Path(__file__).parent
SRC = HERE.parent / "sources_hq"
LETTERS = list("abcdđeghiklmnopqrstuvxy")
DROPPED = []   # (Điều, line) of all-caps title lines skipped; listed in extract_report.txt

DECREES = {
    # tron = article "trốn thuế" (acts in khoản 1, multiplier in khoản 2); khai_sai = article "khai sai dẫn đến thiếu thuế"
    # tb = articles to which the "mức trung bình ± 10%" rule applies (Điều 6.3.đ NĐ169; Điều 5.3.đ NĐ128 as added by NĐ102/2021)
    # nhap_canh = article whose amounts are individual amounts (xuất nhập cảnh); tax articles use the same amount for all
    "169": dict(file="nd169_2026.txt", first=8, last=26, tu="2026-07-01", den="", ten="NĐ 169/2026/NĐ-CP",
                tron=15, khai_sai=10, nhap_canh=11, tb=set(range(8, 10)) | {11, 12, 13, 14} | set(range(16, 26)),
                tb_khoan={26: {1, 2, 4}}, rule="moi"),
    "128": dict(file="nd128_2020.txt", first=7, last=25, tu="2020-12-10", den="2026-06-30", ten="NĐ 128/2020/NĐ-CP",
                tron=14, khai_sai=9, nhap_canh=10, tb={7, 8} | set(range(10, 14)) | set(range(15, 25)),
                tb_khoan={25: {1, 3, 4}}, rule="cu"),
}


def clean_lines(text):
    out = []
    for ln in text.splitlines():
        s = re.sub(r"\s+", " ", ln.replace(" ", " ")).strip()
        if not s or "CÔNG BÁO" in s or re.fullmatch(r"\d{1,3}", s):
            continue
        out.append(s)
    return out


def split_dieu(lines, first, last):
    """Return {n: (title, [body lines])} for Điều first..last of chapter II."""
    chunks, cur = {}, None
    for s in lines:
        m = re.match(r"^Điều (\d+)\.\s*(.*)$", s)
        if m:
            n = int(m.group(1))
            cur = n if first <= n <= last else None
            if cur is not None:
                chunks[cur] = [m.group(2), []]
            continue
        if re.match(r"^Chương [IVX]+$", s) and cur is not None and s != "Chương II":
            cur = None
            continue
        if cur is not None and not re.match(r"^(Chương|Mục) ", s):
            if s.isupper() and not re.search(r"\d", s):
                DROPPED.append((cur, s))          # chapter/section titles in capitals
                continue
            chunks[cur][1].append(s)
    return chunks


def parse_dieu(title, body, anomalies, dieu):
    """Split body into khoản -> lead + points using sequential numbering/lettering (robust to wrapped lines)."""
    khoans, k_no, p_idx = [], 0, -1
    pre = []
    tail_mode = False
    for s in body:
        mk = re.match(rf"^{k_no + 1}\.\s+(.*)$", s)
        if mk:
            k_no += 1
            p_idx = -1
            tail_mode = False
            khoans.append(dict(no=k_no, lead=mk.group(1), points=[]))
            continue
        if not khoans:
            pre.append(s)      # title continuation
            continue
        letter = LETTERS[p_idx + 1] if p_idx + 1 < len(LETTERS) else None
        mp = re.match(rf"^{re.escape(letter)}\)\s+(.*)$", s) if letter else None
        if mp:
            p_idx += 1
            tail_mode = False
            khoans[-1]["points"].append(dict(l=letter, text=mp.group(1)))
            continue
        if khoans[-1]["points"]:
            if tail_mode:
                khoans[-1]["points"][-1]["tail"][-1] += " " + s
            elif khoans[-1]["points"][-1]["text"].rstrip().endswith(".") and s[:1].isupper():
                tail_mode = True
                khoans[-1]["points"][-1].setdefault("tail", []).append(s)   # paragraph after the point, not part of it
            else:
                khoans[-1]["points"][-1]["text"] += " " + s
        else:
            khoans[-1]["lead"] += " " + s
    if not khoans:
        anomalies.append(f"Điều {dieu}: no khoản found")
    return (title + " " + " ".join(pre)).strip(), khoans


AMT = re.compile(r"^Phạt tiền từ ([\d\.]+)(?: đồng)? đến ([\d\.]+) đồng\s*(.*)$")
GENERIC = re.compile(r"^(đối với )?(một trong )?(các )?(hành vi|trường hợp)( vi phạm)?( sau)?( đây)?:?$", re.I)


def vnd(s):
    return int(s.replace(".", ""))


def tidy(s):
    return re.sub(r"\s+", " ", s).strip().rstrip(";:,").strip().rstrip(".").strip()


def fine_stmt(text):
    """Classify a statement: ('CC'|'PT'|'TL'|None, dict)."""
    t = text.strip()
    if t.startswith("Phạt cảnh cáo"):
        return "CC", dict(rest=t[len("Phạt cảnh cáo"):].strip())
    m = AMT.match(t)
    if m:
        return "PT", dict(min=vnd(m.group(1)), max=vnd(m.group(2)), rest=m.group(3).strip())
    if t.startswith("Phạt "):
        head, _, rest = t.partition(" đối với ")
        return "TL", dict(ty_le=tidy(head if rest else t), rest=("đối với " + rest) if rest else "")
    return None, {}


def act_and_cond(rest):
    r = rest.strip()
    if r.lower().startswith("đối với "):
        r = r[len("đối với "):]
    if GENERIC.match(r.strip()) or not r:
        return "", ""
    return r, ""


def tail_notes(k):
    """{point letter: note} and a khoản-wide note. A paragraph after a point says 'điểm này' (that point only),
    'khoản này' (all points) or neither (the last point's paragraph is khoản-wide, otherwise point-specific)."""
    per, wide = {}, []
    pts = k["points"]
    for i, p in enumerate(pts):
        for t in p.get("tail", []):
            t = tidy(t)
            named = re.search(r"điểm ([a-zđ](?:(?:, | và )[a-zđ])*) khoản này", t)
            if "điểm này" in t:
                per.setdefault(p["l"], []).append(t)
            elif named:                      # "... các điểm b, c, d khoản này ...": only the points it names
                for l in re.findall(r"[a-zđ]", named.group(1)):
                    per.setdefault(l, []).append(t)
            elif "khoản này" in t or i == len(pts) - 1:
                wide.append(t)
            else:
                per.setdefault(p["l"], []).append(t)
    return {l: " ".join(v) for l, v in per.items()}, " ".join(wide)


def build_rows(dieu, title, khoans, meta, anomalies, nguon):
    rows, remedies, supp, notes = [], [], [], []

    def add(kind, st, kh, diem, act, cond):
        r = dict(dieu=dieu, nhom=title, khoan=kh, diem=diem, hanh_vi=tidy(act), dieu_kien=tidy(cond), nguon=nguon,
                 hinh_thuc={"CC": "Cảnh cáo", "PT": "Phạt tiền (khung)", "TL": "Phạt theo tỷ lệ"}[kind],
                 min_vnd=st.get("min"), max_vnd=st.get("max"), ty_le=st.get("ty_le", ""),
                 hieu_luc_tu=meta["tu"], hieu_luc_den=meta["den"], van_ban=meta["ten"])
        r["ghi_chu"] = ""
        rows.append(r)

    if dieu == meta["tron"]:
        # acts are the points of khoản 1; the penalty formula is the points of khoản 2 (copied verbatim)
        k1 = next(k for k in khoans if k["no"] == 1)
        k2 = next(k for k in khoans if k["no"] == 2)
        formula = "; ".join(tidy(p["text"]) for p in k2["points"])
        for p in k1["points"]:
            add("TL", dict(ty_le=formula), 1, p["l"], p["text"], tidy(k2["lead"]))
        khoans = [k for k in khoans if k["no"] not in (1, 2)]
    for k in khoans:
        lead = k["lead"].strip()
        low = lead.lower()
        n_before = len(rows)
        if low.startswith("tịch thu"):
            supp.append(dict(khoan=k["no"], items=[tidy(lead)] + [tidy(p["text"]) for p in k["points"]]))
            continue
        if re.match(r"^(áp dụng )?(các )?biện pháp khắc phục hậu quả", low):
            body = re.sub(r"^(áp dụng )?(các )?biện pháp khắc phục hậu quả\s*:?\s*", "", lead, flags=re.I)
            items = [tidy(p["text"]) for p in k["points"]] or ([tidy(body)] if body else [])
            remedies.append(dict(khoan=k["no"], items=items))
            continue
        if low.startswith("hình thức xử phạt bổ sung"):
            body = re.sub(r"^hình thức xử phạt bổ sung\s*:?\s*", "", lead, flags=re.I)
            supp.append(dict(khoan=k["no"], items=[tidy(p["text"]) for p in k["points"]] or ([tidy(body)] if body else [])))
            continue
        kind, st = fine_stmt(lead)
        if kind:
            act, cond = act_and_cond(st["rest"])
            if k["points"]:
                for p in k["points"]:
                    add(kind, st, k["no"], p["l"], p["text"], act or "")
            else:
                add(kind, st, k["no"], "", act or lead, "")
            per, wide = tail_notes(k)
            for r_ in rows[n_before:]:
                r_["ghi_chu"] = tidy(" ".join(x for x in (per.get(r_["diem"], ""), wide) if x))
            continue
        # lead without a fine: points may carry their own fine statements
        got = False
        for p in k["points"]:
            pk, pst = fine_stmt(p["text"])
            if pk:
                got = True
                act, cond = act_and_cond(pst["rest"])
                add(pk, pst, k["no"], p["l"], act or p["text"], lead if not act else lead)
        if not got:
            notes.append(dict(khoan=k["no"], text=tidy(lead + " " + " ".join(p["text"] for p in k["points"]))))
    return rows, remedies, supp, notes


REF = re.compile(r"(?:(?:các )?điểm ([a-zđ](?:(?:, | và )[a-zđ])*) )?(?:các )?khoản ((?:\d+(?:, | và )?)+)")


def refs_in(text, dieu):
    """{khoản: set(letters)|None} for references to the same Điều; None if the text is not about this Điều."""
    if "Điều này" not in text and not re.search(rf"Điều {dieu}\b", text):
        return {}
    out = {}
    for m in REF.finditer(text):
        letters = set(re.findall(r"[a-zđ]", m.group(1))) if m.group(1) else None
        for k in re.findall(r"\d+", m.group(2)):
            out.setdefault(int(k), set()).update(letters) if letters else out.setdefault(int(k), None)
    return out


def attach(row, items, dieu):
    """Items (remedies / supplementary penalties) that apply to this row, matched by references to khoản/điểm.
    Text after ' trừ ' is an exclusion: rows it names are left out ("... Điều này, trừ ... điểm a khoản 3")."""
    hit = []
    for it in items:
        head, sep, tail = it.partition(" trừ ")
        refs = refs_in(head, dieu)
        k = row["khoan"]
        if refs:
            include = k in refs and (refs[k] is None or row["diem"] in refs[k])
        else:
            include = "Điều này" in head or bool(re.search(rf"Điều {dieu}\b", head))   # whole Điều
        if include and sep:
            ex = refs_in(tail, dieu)
            if k in ex and (ex[k] is None or row["diem"] in ex[k]):
                include = False
        if include:
            hit.append(it)
    return hit


def enrich(r, meta, dieu_meta):
    d = r["dieu"]
    r["lv"] = "Hải quan"
    r["ca_nhan"] = "giu_nguyen" if d in (meta["nhap_canh"], meta["tron"], meta["khai_sai"]) else "half"
    r["ap_dung_tb"] = (d in meta["tb"]) or (r["khoan"] in meta["tb_khoan"].get(d, set()))
    r["quy_tac_tinh_tiet"] = meta["rule"]
    # tỷ lệ → how the calculator derives the amount from a user-supplied base
    tl = None
    if r["hinh_thuc"] == "Phạt theo tỷ lệ":
        m = re.match(r"Phạt (\d+(?:,\d+)?)%", r["ty_le"])
        if m:
            tl = dict(k="pct", v=float(m.group(1).replace(",", ".")) / 100,
                      base="Số thuế khai thiếu / khai tăng (đ)")
        elif d == meta["tron"]:
            tl = dict(k="nhan", base="Số thuế trốn (đ)", min=1, step=0.2, max=3)
        elif r["ty_le"].startswith("Phạt tiền tương ứng với số tiền"):
            tl = dict(k="bang", base="Số tiền không trích chuyển (đ)")
    r["tl"] = tl
    all_rem = [it for rem in dieu_meta["remedies"] for it in rem["items"]]
    all_sup = [it for sp in dieu_meta["supp"] for it in sp["items"]]
    r["bien_phap_khac_phuc"] = " | ".join(attach(r, all_rem, d))
    r["bo_sung"] = " | ".join(attach(r, all_sup, d))
    r["trang_thai"] = "Còn hiệu lực" if not r["hieu_luc_den"] else (
        "Đã hết hiệu lực từ 01/07/2026 (NĐ 169/2026 thay thế); chỉ áp dụng cho hành vi trước ngày này, hoặc khi NĐ 169 "
        "không nhẹ hơn")
    r.pop("_remedies", None)
    r.pop("_supp", None)


def run():
    report, all_rows, dieu_meta = [], [], {}
    for nguon, meta in DECREES.items():
        text = (SRC / meta["file"]).read_text(encoding="utf-8")
        lines = clean_lines(text)
        chunks = split_dieu(lines, meta["first"], meta["last"])
        anomalies = []
        n_stmt_expected = len(re.findall(r"Phạt tiền từ [\d\.]+(?: đồng)? đến [\d\.]+ đồng", "\n".join(
            " ".join(b) for _, b in chunks.values())))
        rows_n = 0
        for d in sorted(chunks):
            title, body = chunks[d]
            title, khoans = parse_dieu(title, body, anomalies, d)
            nums = [k["no"] for k in khoans]
            if nums != list(range(1, len(nums) + 1)):
                anomalies.append(f"Điều {d}: khoản numbering {nums}")
            rows, remedies, supp, notes = build_rows(d, title, khoans, meta, anomalies, nguon)
            dieu_meta[(nguon, d)] = dict(title=title, remedies=remedies, supp=supp, notes=notes)
            for r in rows:
                enrich(r, meta, dieu_meta[(nguon, d)])
            all_rows.extend(rows)
            rows_n += len(rows)
            if notes:
                anomalies.append(f"Điều {d}: {len(notes)} khoản without fine statement (kept as notes): " +
                                 "; ".join(f"k{n['khoan']}" for n in notes))
        n_pt = sum(1 for r in all_rows if r["nguon"] == nguon and r["hinh_thuc"] == "Phạt tiền (khung)")
        report.append(f"== {meta['ten']}: Điều {meta['first']}-{meta['last']} | rows={rows_n} | "
                      f"PT rows={n_pt} | 'Phạt tiền từ…đến…' occurrences in text={n_stmt_expected}")
        report += [f"  anomaly: {a}" for a in anomalies]
    dieu_notes = {}
    for (nguon, d), m in dieu_meta.items():
        lst = [f"Khoản {n['khoan']}: {n['text']}" for n in m["notes"]]
        rows_d = [r for r in all_rows if r["nguon"] == nguon and r["dieu"] == d]
        for kind, items in (("Biện pháp khắc phục hậu quả", m["remedies"]), ("Hình thức xử phạt bổ sung", m["supp"])):
            for rem in items:
                for it in rem["items"]:
                    field = "bien_phap_khac_phuc" if kind.startswith("Biện") else "bo_sung"
                    if not any(it in r[field] for r in rows_d):
                        lst.append(f"{kind} (khoản {rem['khoan']}): {it}")
        if lst:
            dieu_notes[f"{nguon}:{d}"] = lst
    (HERE / "customs_rows.json").write_text(json.dumps(dict(rows=all_rows, dieu_notes=dieu_notes), ensure_ascii=False, indent=1),
                                            encoding="utf-8")
    report.append(f"final rows={len(all_rows)} | Điều notes={len(dieu_notes)}")
    report.append(f"all-caps title lines skipped: {len(DROPPED)}")
    report += [f"  skipped Điều {d}: {t[:90]}" for d, t in DROPPED]
    (HERE / "extract_report.txt").write_text("\n".join(report) + "\n", encoding="utf-8")
    print("\n".join(report))


if __name__ == "__main__":
    run()
