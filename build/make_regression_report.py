"""Aggregates all test sources into docs/reports/REGRESSION_REPORT.md."""
import os, re
ROOT = os.path.join(os.path.dirname(__file__), "..")


def table(path, env=None):
    rows = []
    for line in open(path):
        cells = [c.strip() for c in line.strip().strip("|").split("|")]
        if len(cells) >= 4 and re.fullmatch(r"[A-Z]+\d+[a-z]?", cells[0]):
            if env:   # GX report: ID | Test | Result | Evidence
                rows.append((cells[0], cells[1], env, cells[2], cells[3]))
            else:     # reference: ID | Test | Env | Result | Evidence
                rows.append(tuple(cells[:5]))
    return rows


ref = table(os.path.join(ROOT, "tests", "TEST_REPORT_reference.md"))
gx = table(os.path.join(ROOT, "tests", "genexpr_sim", "GX_REPORT.md"), "GenExpr source via Python transpiler")
plan = []
for line in open(os.path.join(ROOT, "docs", "TEST_PLAN_Max_Live.md")):
    cells = [c.strip() for c in line.strip().strip("|").split("|")]
    if cells and re.fullmatch(r"[GLA]\d\d", cells[0]):
        env = {"G": "Max 9 / GenExpr", "L": "Ableton Live 12", "A": "Manual listening (Live 12)"}[cells[0][0]]
        plan.append((cells[0], cells[1], env, "BLOCKED", "No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md"))
extra = [("C01", "CPU/memory proxy benchmark of the GenExpr source (C translation, bit-exact vs reference)",
          "C proxy of GenExpr source", "PASS (measured)", "tests/genexpr_sim/CPU_PROXY_REPORT.md — proxy only; L16/L17 still required"),
         ("I01", "Investigation: slider HF frame energy (−31.4 dB)", "Python reference engine", "DONE",
          "tests/investigations/HF_SLIDER_REPORT.md — expected tape-head behaviour, not aliasing/interpolation/smoothing")]
allr = ref + gx + extra + plan
cnt = {}
for r in allr:
    k = r[3].split()[0]
    cnt[k] = cnt.get(k, 0) + 1
with open(os.path.join(ROOT, "docs", "reports", "REGRESSION_REPORT.md"), "w") as f:
    f.write("# Regression report — Echolivity H&H v0.2.1\n\n")
    f.write("Each row names the environment it was executed in. **Reference-engine and transpiler results are not "
            "evidence of Max or Live integration.** Every Max 9, Live 12 and listening test is BLOCKED because those "
            "applications are not available in the build environment.\n\n")
    f.write("Totals: " + ", ".join(f"{k} {v}" for k, v in sorted(cnt.items())) + f" (of {len(allr)})\n\n")
    f.write("| Test ID | Test | Environment | Result | Evidence |\n|---|---|---|---|---|\n")
    for r in allr:
        f.write("| " + " | ".join(r) + " |\n")
print(cnt)
