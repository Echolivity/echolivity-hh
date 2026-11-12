"""
CPU / memory PROXY benchmark of the shipped GenExpr (C translation, gcc -O2).
Environment label: "C proxy of GenExpr source" — NOT Max/Live.

Run: python3 tests/genexpr_sim/run_cpu_proxy.py -> tests/genexpr_sim/CPU_PROXY_REPORT.md
"""
import os
import platform
import re
import statistics
import subprocess

HERE = os.path.dirname(os.path.abspath(__file__))
B = "/tmp/hhbench"
subprocess.run([os.path.join(HERE, "build_bench.sh"), B], check=True, capture_output=True)
EXE = os.path.join(B, "hh_bench")

SCEN = {
    "factory defaults (noise, wow/flutter on)": (0, []),
    "worst case: speed mode v=4 (4–5 cell write + box read per sample), Repeat 1.2": (
        0, ["slider_mode=1", "manual_ms=75", "head_spacing_ms=300", "feedback=1.2", "drive=1"]),
}
RATES = (44100, 48000, 88200, 96000)
SECS = 10


def once(sr, args):
    out = subprocess.run([EXE, str(sr), str(SECS), "0", "-"] + args, capture_output=True, text=True, check=True).stdout
    return float(re.search(r"ns/sample=([\d.]+)", out).group(1)), float(re.search(r"realtime_core_pct=([\d.]+)", out).group(1))


rows = []
for name, (_, args) in SCEN.items():
    for sr in RATES:
        runs = [once(sr, args) for _ in range(5)]
        ns = statistics.median(r[0] for r in runs)
        pct = statistics.median(r[1] for r in runs)
        rows.append((name, sr, ns, pct, min(r[1] for r in runs), max(r[1] for r in runs)))
        print(rows[-1])

# memory: peak resident set (VmHWM) reported by the benchmark itself, vs. an empty C program
def hwm(cmd):
    out = subprocess.run(cmd, capture_output=True, text=True, check=True).stdout
    return int(re.search(r"(?:vmhwm_kb=|^)(\d+)", out.strip().split()[-1] if "vmhwm" not in out else out.split("vmhwm_kb=")[1]).group(1))


open("/tmp/empty.c", "w").write('#include <stdio.h>\n#include <string.h>\n#include <stdlib.h>\nint main(){FILE*f=fopen("/proc/self/status","r");char l[256];while(fgets(l,256,f))if(!strncmp(l,"VmHWM:",6)){printf("%ld\\n",atol(l+6));}return 0;}')
subprocess.run(["gcc", "-O2", "-o", "/tmp/empty", "/tmp/empty.c"], check=True)
rss = hwm([EXE, "48000", "1", "0", "-"])
rss_long = hwm([EXE, "48000", "20", "0", "-"])
rss0 = int(subprocess.run(["/tmp/empty"], capture_output=True, text=True).stdout.strip())

# two concurrent instances (this machine has 2 cores)
procs = [subprocess.Popen([EXE, "48000", str(SECS), "0", "-"], stdout=subprocess.PIPE, text=True) for _ in range(2)]
conc = [float(re.search(r"realtime_core_pct=([\d.]+)", p.communicate()[0]).group(1)) for p in procs]

cpu = "unknown"
try:
    cpu = [l.split(":", 1)[1].strip() for l in open("/proc/cpuinfo") if l.startswith("model name")][0]
except Exception:
    pass
gcc = subprocess.run(["gcc", "--version"], capture_output=True, text=True).stdout.splitlines()[0]

with open(os.path.join(HERE, "CPU_PROXY_REPORT.md"), "w") as f:
    f.write("# CPU / memory — C proxy of the GenExpr source\n\n")
    f.write("**Environment: C translation of `dsp/hh_core.genexpr` (tests/genexpr_sim/gx_cgen.py), "
            f"`{gcc}`, `-O2`, {cpu}, {os.cpu_count()} cores, {platform.system()} {platform.release()}.** "
            "Not Max 9 / Live 12. gen~'s own code generator, per-vector processing, host overhead and "
            "the user's CPU will give different numbers; the Live-measured values are test L09 (BLOCKED here). "
            "The C translation was checked bit-exact against the reference engine before benchmarking.\n\n")
    f.write(f"Method: {SECS} s of program-like stereo input per run, 5 runs, median; % = share of one core "
            "needed for real time (buffer size does not change per-sample cost in this proxy).\n\n")
    f.write("| Scenario | Sample rate | ns / sample | % of one core (median) | min–max |\n|---|---|---|---|---|\n")
    for name, sr, ns, pct, lo, hi in rows:
        f.write(f"| {name} | {sr} | {ns:.0f} | {pct:.2f} % | {lo:.2f}–{hi:.2f} % |\n")
    f.write(f"\nTwo instances running concurrently at 48 kHz (one per core): {conc[0]:.2f} % and {conc[1]:.2f} %.\n\n")
    f.write("## Memory\n")
    f.write(f"- Tape buffer: `Data tape(800000, 2)` = 1.6 M samples → **12.8 MB per instance if gen~ Data is 64-bit** "
            "(6.4 MB if 32-bit). v0.2.0 also allocated an equal-size running-integral buffer (25.6 MB total); v0.2.1 removed it.\n")
    f.write(f"- Proxy process max RSS: {rss} kB after 1 s of audio, {rss_long} kB after 20 s, {rss0} kB for an empty program. "
            "RSS counts pages touched; at 48 kHz the record head touches the whole 800 000-cell tape after 16.7 s.\n")
print("written")
