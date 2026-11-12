"""
Compare a Live/Max render of the device with the golden expectation.
usage: python3 tests/golden/compare.py expect_GOLD1.wav my_render_GOLD1.wav
Aligns by cross-correlation (renders may start with an offset), then reports
the residual in dB relative to the expectation's peak. PASS < −80 dB.
The residual floor of a correct build is set by 32-bit float files (~−140 dB);
−80 dB leaves room for libm differences in transcendental functions.
"""
import sys
import numpy as np
from scipy.io import wavfile
from scipy.signal import correlate

sr1, a = wavfile.read(sys.argv[1]); sr2, b = wavfile.read(sys.argv[2])
assert sr1 == sr2, "sample rates differ"
a = a.astype(float); b = b.astype(float)
if a.ndim == 1: a = a[:, None]
if b.ndim == 1: b = b[:, None]
m = min(len(a), len(b))
c = correlate(b[:m, 0], a[:m, 0], mode="full", method="fft")
lag = int(np.argmax(c)) - (m - 1)
if lag > 0:
    b = b[lag:]
else:
    a = a[-lag:]
m = min(len(a), len(b))
res = np.max(np.abs(a[:m] - b[:m])) / max(np.max(np.abs(a[:m])), 1e-12)
db = 20 * np.log10(max(res, 1e-20))
print(f"alignment offset {lag} samples; max residual {db:.1f} dB re peak -> {'PASS' if db < -80 else 'FAIL'}")
sys.exit(0 if db < -80 else 1)
