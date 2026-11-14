"""
Echolivity — Phase 1 remaining stages, REFERENCE PROTOTYPES (not in the device).

Spec §8  OpticalCompressor  LA-2A-inspired optical input compressor (original DSP interpretation)
Spec §11 TubeSaturation     tube-inspired output saturation
         ConsoleEQ          SSL-inspired 4-band EQ (original interpretation, not a circuit model)
         OutputLimiter      true-peak-aware lookahead limiter

These are offline Python/Numba models used to settle the algorithms and measure
them before any GenExpr is written. Nothing here claims to reproduce a
Teletronix, Solid State Logic or any other proprietary circuit.
All functions take float64 stereo arrays (n, 2) and return (out, aux).
"""
import numpy as np
from numba import njit
from scipy.signal import firwin


# --------------------------------------------------------------------------
# shared helpers
# --------------------------------------------------------------------------
def db2lin(d):
    return 10.0 ** (d / 20.0)


@njit(cache=True)
def _coef(tau_s, sr):
    return 1.0 - np.exp(-1.0 / (max(tau_s, 1e-6) * sr))


# --------------------------------------------------------------------------
# §8 OPTICAL COMPRESSOR
# --------------------------------------------------------------------------
# Structure (feedback, like the classic opto levelling amp it is inspired by):
#   x -> input drive -> gain cell (x g) -> makeup -> mild tube-style colour -> out
#                                   |
#           sidechain = |cell output| x Peak Reduction  (previous sample)
#           -> electroluminescent panel  (attack 10 ms, panel decay 30 ms)
#           -> photocell, two parts:  fast part  release 60 ms
#                                     slow part  release 0.5 s .. 5 s, lengthened by
#                                                 "charge" accumulated while driven
#           -> control c = 0.5 fast + 0.5 slow  -> gain computer
#   Gain computer: smooth knee, ratio that rises with level (progressive), COMPRESS
#   or LIMIT curve. LIMIT is steeper and its knee is narrower.
@njit(cache=True)
def _opto(x, sr, limit, peak_red, gain_db, drive_db, out_db, color, bypass):
    n = x.shape[0]
    y = np.zeros((n, 2))
    gr_out = np.zeros(n)
    if bypass:
        for i in range(n):
            y[i, 0] = x[i, 0]
            y[i, 1] = x[i, 1]
        return y, gr_out
    din = 10.0 ** (drive_db / 20.0)
    mk = 10.0 ** (gain_db / 20.0)
    og = 10.0 ** (out_db / 20.0)
    sc = 10.0 ** ((peak_red / 100.0) * 40.0 / 20.0) * 0.25     # Peak Reduction 0..100 -> sidechain gain
    a_att = 1.0 - np.exp(-1.0 / (0.010 * sr))
    a_pnl = 1.0 - np.exp(-1.0 / (0.030 * sr))
    a_fast = 1.0 - np.exp(-1.0 / (0.060 * sr))
    a_chg = 1.0 - np.exp(-1.0 / (5.0 * sr))
    # Feedback detection: static ratio = 1 + s, where s is the gain-computer slope
    # (out = in - s * over_out). COMPRESS ~2.5:1 rising to ~3.5:1; LIMIT ~11:1 rising to ~21:1 (nominal;
    # measured ratios are lower because the detector sees the waveform, not its peak).
    knee = 1.0 if limit else 8.0
    s1 = 10.0 if limit else 1.5
    s2 = 20.0 if limit else 2.5
    L = 0.0
    gf = 0.0
    gs = 0.0
    charge = 0.0
    g = 1.0
    b = 0.08 * color
    tb = np.tanh(b)
    gr_prev = 0.0
    for i in range(n):
        # gain cell (gain from previous control value) + makeup + colour
        v0 = x[i, 0] * din * g
        v1 = x[i, 1] * din * g
        o0 = v0 * mk
        o1 = v1 * mk
        if color > 0.0:
            k = 1.0 + 0.5 * color
            o0 = (np.tanh(k * o0 * 0.5 + b) - tb) / (0.5 * k * (1.0 - tb * tb))
            o1 = (np.tanh(k * o1 * 0.5 + b) - tb) / (0.5 * k * (1.0 - tb * tb))
        y[i, 0] = o0 * og
        y[i, 1] = o1 * og
        # sidechain from the cell output (feedback), stereo-linked
        d = max(abs(v0), abs(v1)) * sc
        # panel
        L += (a_att if d > L else a_pnl) * (d - L)
        # photocell
        gf += (a_att if L > gf else a_fast) * (L - gf)
        tau_s = 0.3 + 4.7 * charge
        a_slow = 1.0 - np.exp(-1.0 / (tau_s * sr))
        gs += (a_att if L > gs else a_slow) * (L - gs)
        # "memory": the longer and harder the cell is lit, the slower its slow
        # part releases (charge follows min(1, GR/6 dB) with a 5 s time constant)
        charge += a_chg * (min(1.0, gr_prev / 6.0) - charge)
        # gain computer per cell part, mixed 50/50 in dB: the fast part releases
        # half of the gain reduction in ~60 ms, the slow part the rest in 0.5–5 s
        gr = 0.0
        for c in (gf, gs):
            cdb = 20.0 * np.log10(c + 1e-9)
            o = knee * np.log1p(np.exp(cdb / knee))        # smooth over-threshold amount
            slope = s1 + (s2 - s1) * o / (o + 12.0)        # progressive ratio
            gr += 0.5 * slope * o
        g = 10.0 ** (-gr / 20.0)
        gr_prev = gr
        gr_out[i] = gr
    return y, gr_out


def opto(x, sr, mode="compress", peak_red=50.0, gain_db=0.0, drive_db=0.0, out_db=0.0, color=0.5, bypass=False):
    return _opto(np.ascontiguousarray(x, float), float(sr), mode == "limit", float(peak_red), float(gain_db),
                 float(drive_db), float(out_db), float(color), bool(bypass))


# --------------------------------------------------------------------------
# §11A TUBE SATURATION
# --------------------------------------------------------------------------
# drive -> LF-protect pre-shelf (-6 dB below ~90 Hz) -> asymmetric tanh (bias =
# amount, small-signal gain 1) -> inverse post-shelf -> DC block (5 Hz) ->
# 1/drive compensation -> mix with time-aligned dry -> output level.
# Optional 2x oversampling around the nonlinearity (linear-phase FIR halfband).
HB_TAPS = 63
_HB = firwin(HB_TAPS, 0.5, window=("kaiser", 8.0))      # cutoff = original Nyquist at 2x


@njit(cache=True)
def _zp1_coefs(kdc, fz, fp, fw, sr):
    K = 2.0 * np.pi * fw / np.tan(np.pi * fw / sr)
    cz = K / (2.0 * np.pi * fz)
    cp = K / (2.0 * np.pi * fp)
    return kdc * (1.0 + cz) / (1.0 + cp), kdc * (1.0 - cz) / (1.0 + cp), (1.0 - cp) / (1.0 + cp)


@njit(cache=True)
def _tube_core(u, sr_int, drive, amount):
    # u: (m, 2) at the internal rate
    m = u.shape[0]
    out = np.zeros((m, 2))
    b = 0.35 * amount
    tb = np.tanh(b)
    norm = 1.0 - tb * tb
    # LF protect: low shelf -6 dB (A = 0.5), corner 90 Hz, and its exact inverse
    A = 0.5
    # H(0) = A, H(inf) = kdc * fp / fz = 1  ->  fz = 90 A, fp = 90
    p0, p1, q1 = _zp1_coefs(A, 90.0 * A, 90.0, 1000.0, sr_int)       # cut below ~45–90 Hz
    i0, i1, j1 = _zp1_coefs(1.0 / A, 90.0, 90.0 * A, 1000.0, sr_int) # exact inverse
    R = 1.0 - 2.0 * np.pi * 5.0 / sr_int
    for ch in range(2):
        xp = 0.0
        yp = 0.0
        xq = 0.0
        yq = 0.0
        dx = 0.0
        dy = 0.0
        for i in range(m):
            x = u[i, ch] * drive
            s = p0 * x + p1 * xp - q1 * yp
            xp = x
            yp = s
            w = (np.tanh(s + b) - tb) / norm
            t = i0 * w + i1 * xq - j1 * yq
            xq = w
            yq = t
            z = t - dx + R * dy
            dx = t
            dy = z
            out[i, ch] = z / drive
    return out


def tube(x, sr, drive_db=6.0, amount=0.5, out_db=0.0, mix=1.0, oversample=2, bypass=False):
    x = np.ascontiguousarray(x, float)
    if bypass:
        return x.copy(), 0
    drive = db2lin(drive_db)
    if oversample == 1:
        wet = _tube_core(x, float(sr), drive, float(amount))
        lat = 0
        dry = x
    else:
        up = np.zeros((2 * len(x), 2))
        up[::2] = x * 2.0
        up = np.stack([np.convolve(up[:, c], _HB)[: len(up)] for c in range(2)], 1)
        w2 = _tube_core(up, 2.0 * sr, drive, float(amount))
        w2 = np.stack([np.convolve(w2[:, c], _HB)[: len(w2)] for c in range(2)], 1)
        wet = w2[::2]
        lat = (HB_TAPS - 1) // 2          # two filters of (taps-1)/2 at 2x = (taps-1)/2 at 1x
        dry = np.vstack([np.zeros((lat, 2)), x])[: len(x)]
    y = (mix * wet + (1.0 - mix) * dry) * db2lin(out_db)
    return y, lat


# --------------------------------------------------------------------------
# §11B CONSOLE EQ (4 bands)
# --------------------------------------------------------------------------
# LOW  shelf|bell 30–450 Hz   LOW-MID bell 200 Hz–2.5 kHz (Q)   HIGH-MID bell 600 Hz–7 kHz (Q)
# HIGH shelf|bell 1.5–16 kHz   gains ±15 dB. RBJ biquads, prewarped. "Proportional Q"
# option: bell bandwidth narrows as gain increases (console-style behaviour).
# Parameters are smoothed per sample (20 ms) and coefficients recomputed while moving.
@njit(cache=True)
def _biquad_coefs(kind, f0, gdb, q, sr):
    A = 10.0 ** (gdb / 40.0)
    w0 = 2.0 * np.pi * min(f0, 0.49 * sr) / sr
    cw = np.cos(w0)
    sw = np.sin(w0)
    if kind == 0:      # bell
        al = sw / (2.0 * q)
        b0 = 1.0 + al * A
        b1 = -2.0 * cw
        b2 = 1.0 - al * A
        a0 = 1.0 + al / A
        a1 = -2.0 * cw
        a2 = 1.0 - al / A
    elif kind == 1:    # low shelf (S = 1)
        al = sw / 2.0 * np.sqrt(2.0)
        sa = 2.0 * np.sqrt(A) * al
        b0 = A * ((A + 1) - (A - 1) * cw + sa)
        b1 = 2 * A * ((A - 1) - (A + 1) * cw)
        b2 = A * ((A + 1) - (A - 1) * cw - sa)
        a0 = (A + 1) + (A - 1) * cw + sa
        a1 = -2 * ((A - 1) + (A + 1) * cw)
        a2 = (A + 1) + (A - 1) * cw - sa
    else:              # high shelf (S = 1)
        al = sw / 2.0 * np.sqrt(2.0)
        sa = 2.0 * np.sqrt(A) * al
        b0 = A * ((A + 1) + (A - 1) * cw + sa)
        b1 = -2 * A * ((A - 1) + (A + 1) * cw)
        b2 = A * ((A + 1) + (A - 1) * cw - sa)
        a0 = (A + 1) - (A - 1) * cw + sa
        a1 = 2 * ((A - 1) - (A + 1) * cw)
        a2 = (A + 1) - (A - 1) * cw - sa
    return b0 / a0, b1 / a0, b2 / a0, a1 / a0, a2 / a0


@njit(cache=True)
def _eq(x, sr, kinds, F, G, Q, prop_q, out_db):
    # F, G, Q: (n, 4) per-sample target parameters; kinds: (4,)
    n = x.shape[0]
    y = np.zeros((n, 2))
    a = 1.0 - np.exp(-1.0 / (0.020 * sr))
    f = F[0].copy()
    g = G[0].copy()
    q = Q[0].copy()
    co = np.zeros((4, 5))
    st = np.zeros((4, 2, 2))
    og = 10.0 ** (out_db / 20.0)
    last = np.full((4, 3), -1e9)
    for i in range(n):
        for b in range(4):
            f[b] += a * (F[i, b] - f[b])
            g[b] += a * (G[i, b] - g[b])
            q[b] += a * (Q[i, b] - q[b])
            if f[b] != last[b, 0] or g[b] != last[b, 1] or q[b] != last[b, 2]:
                qq = q[b]
                if prop_q and kinds[b] == 0:
                    qq = q[b] * (1.0 + abs(g[b]) / 10.0)
                c0, c1, c2, c3, c4 = _biquad_coefs(kinds[b], f[b], g[b], qq, sr)
                co[b, 0] = c0
                co[b, 1] = c1
                co[b, 2] = c2
                co[b, 3] = c3
                co[b, 4] = c4
                last[b, 0] = f[b]
                last[b, 1] = g[b]
                last[b, 2] = q[b]
        for ch in range(2):
            v = x[i, ch]
            for b in range(4):          # transposed direct form II
                w = co[b, 0] * v + st[b, ch, 0]
                st[b, ch, 0] = co[b, 1] * v - co[b, 3] * w + st[b, ch, 1]
                st[b, ch, 1] = co[b, 2] * v - co[b, 4] * w
                v = w
            y[i, ch] = v * og
    return y


EQ_DEFAULT = {"low": (1, 100.0, 0.0, 0.7), "lowmid": (0, 400.0, 0.0, 0.7),
              "highmid": (0, 2500.0, 0.0, 0.7), "high": (2, 8000.0, 0.0, 0.7)}


def console_eq(x, sr, bands=None, prop_q=True, out_db=0.0, bypass=False, automation=None):
    """bands: dict name -> (kind, freq, gain_db, q); kind 0 bell, 1 low shelf, 2 high shelf.
    automation: optional dict (band, 'f'|'g'|'q') -> per-sample array."""
    x = np.ascontiguousarray(x, float)
    if bypass:
        return x.copy()
    bands = dict(EQ_DEFAULT, **(bands or {}))
    order = ["low", "lowmid", "highmid", "high"]
    n = len(x)
    kinds = np.array([bands[b][0] for b in order], np.int64)
    F = np.tile([bands[b][1] for b in order], (n, 1)).astype(float)
    G = np.tile([bands[b][2] for b in order], (n, 1)).astype(float)
    Q = np.tile([bands[b][3] for b in order], (n, 1)).astype(float)
    for (b, k), arr in (automation or {}).items():
        {"f": F, "g": G, "q": Q}[k][:, order.index(b)] = arr
    return _eq(x, float(sr), kinds, F, G, Q, bool(prop_q), float(out_db))


# --------------------------------------------------------------------------
# §11C OUTPUT LIMITER (true-peak aware, lookahead)
# --------------------------------------------------------------------------
# input gain -> 8x polyphase interpolation for true-peak estimate -> required
# gain per sample (ceiling / true peak) -> stereo link -> sliding minimum over
# the lookahead -> release (rising only) -> box average over the lookahead
# -> applied to the delayed signal. Latency = lookahead + interpolator delay.
TP_OS = 8
TP_TAPS = 256
_TP = firwin(TP_TAPS, 0.985 / TP_OS, window=("kaiser", 10.0)) * TP_OS   # 32 taps per phase
TP_DELAY = (TP_TAPS // TP_OS) // 2          # samples of future needed by the estimator (at 1x)


def _true_peak_track(x):
    """per-sample max |signal| including the 3 interpolated points after each sample."""
    n = len(x)
    tp = np.abs(x).copy()
    up = np.zeros(n * TP_OS)
    up[::TP_OS] = x
    yi = np.convolve(up, _TP)[: n * TP_OS]
    gd = (TP_TAPS - 1) / 2.0                  # group delay of the interpolator at 4x
    shift = int(round(gd))
    yi = np.concatenate([yi[shift:], np.zeros(shift)])
    blk = np.abs(yi).reshape(n, TP_OS).max(axis=1)
    return np.maximum(tp, blk)


@njit(cache=True)
def _lim_causal(x, req, L, D, a_rel):
    """Causal formulation. At time i the estimator has produced req for sample i-D.
    Output sample k = i - L - D with gain = mean over the last L+1 released values
    of the sliding minimum of req over [j-D-L, j-D]. Every window contains k, so
    the applied gain never exceeds req[k]. Latency = L + D samples."""
    n = x.shape[0]
    nch = x.shape[1]
    y = np.zeros((n, nch))
    gout = np.ones((n, nch))
    tot = L + D
    for ch in range(nch):
        rl = np.ones(n)
        g = 1.0
        acc = 0.0
        for i in range(n):
            # sliding minimum of req over [i-D-L, i-D]
            m = 1.0
            lo = i - D - L
            hi = i - D
            for k in range(max(lo, 0), hi + 1):
                if k >= 0 and req[k, ch] < m:
                    m = req[k, ch]
            if m < g:
                g = m
            else:
                g += a_rel * (m - g)
            rl[i] = g
            acc += g
            if i >= L + 1:
                acc -= rl[i - L - 1]
            gm = acc / (L + 1) if i >= L else (acc + (L - i)) / (L + 1)   # pre-roll counts as gain 1
            gout[i, ch] = gm
            k = i - tot
            if k >= 0:
                y[i, ch] = x[k, ch] * gm
    return y, gout


TP_MARGIN_DB = 0.3   # estimator uncertainty margin (8x/256-tap estimate reads up to ~0.15 dB low on
                     # full-band noise; gain changes add a little more). Measured, see Lm01.


def output_limiter(x, sr, in_db=0.0, ceiling_dbtp=-1.0, release_ms=80.0, lookahead_ms=1.5, link=1.0, bypass=False):
    """returns (y, min gain per sample, latency in samples)"""
    x = np.ascontiguousarray(x, float) * db2lin(in_db)
    if bypass:
        return x.copy(), np.ones(len(x)), 0
    c_out = db2lin(ceiling_dbtp)
    c = db2lin(ceiling_dbtp - TP_MARGIN_DB)
    L = max(1, int(round(lookahead_ms * 1e-3 * sr)))
    tp = np.stack([_true_peak_track(x[:, ch]) for ch in range(2)], 1)
    req = np.minimum(1.0, c / np.maximum(tp, 1e-12))
    rmin = req.min(axis=1)
    req = link * rmin[:, None] + (1.0 - link) * req
    a_rel = 1.0 - np.exp(-1.0 / (release_ms * 1e-3 * sr))
    y, g = _lim_causal(x, np.ascontiguousarray(req), L, TP_DELAY, a_rel)
    y = np.clip(y, -c_out, c_out)                  # sample-peak safety net at the ceiling itself
    return y, g.min(axis=1), L + TP_DELAY
