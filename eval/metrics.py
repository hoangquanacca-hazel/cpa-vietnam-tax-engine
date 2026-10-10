"""Chấm bằng code: K5/K7/K8, con số, khẳng định sai, Wilson, pass^k. Không có nhánh dữ liệu giả."""
import math
from collections import Counter

STATES = ("S1", "S2", "S3", "S4", "S5", "S6", "S7")


def wilson_lower(successes: int, n: int, z: float = 1.96) -> float:
    if n <= 0:
        raise ValueError("n must be > 0")
    p = successes / n
    d = 1 + z * z / n
    c = p + z * z / (2 * n)
    m = z * math.sqrt(p * (1 - p) / n + z * z / (4 * n * n))
    return (c - m) / d


def confident_wrong(expected_state: str, got_state: str, conclusion_ok: bool) -> bool:
    """Lỗi nghiêm trọng nhất: trả S1 trong khi đáp án S2-S7, hoặc S1 sai kết luận."""
    if got_state != "S1":
        return False
    return expected_state != "S1" or not conclusion_ok


def check_citations(cited: list[str], valid_at_date: set[str]) -> bool:
    """K5: mọi khoản được trích phải tồn tại trong kho và còn hiệu lực tại ngày áp dụng."""
    return all(c in valid_at_date for c in cited)


def numbers_exact(got: dict, expected: dict) -> bool:
    """Con số: sai lệch 0, không chấp nhận gần đúng."""
    return all(k in got and got[k] == v for k, v in expected.items())


def confusion(pairs: list[tuple[str, str]]) -> dict:
    """pairs = [(expected_state, got_state)]; trả per-state recall (K7)."""
    tot, ok = Counter(), Counter()
    for e, g in pairs:
        if e not in STATES or g not in STATES:
            raise ValueError(f"invalid state: {e}/{g}")
        tot[e] += 1
        ok[e] += e == g
    return {s: (ok[s] / tot[s], tot[s]) for s in STATES if tot[s]}


def pass_k(runs: list[list[bool]]) -> float:
    """K9: tỷ lệ câu mà tất cả k lần chạy đều đúng. runs[i] = kết quả k lần của câu i."""
    if not runs:
        raise ValueError("no runs")
    return sum(all(r) for r in runs) / len(runs)


def overall_weighted(a_official: float, a_everyday: float) -> float:
    return 0.6 * a_official + 0.4 * a_everyday
