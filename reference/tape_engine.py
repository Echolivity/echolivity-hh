"""
Echolivity H&H — Python/Numba reference model of the tape engine (v0.2.2-dev).

Statement-for-statement mirror of dsp/hh_core.genexpr. Change both together.

Signal chain, from HH Service Manual M107, Echo Unit drawing C/AC20000 iss.7:

  input -> channel amp (IC5, max +6 dB) -> volume -+-> DRY: dry Treble (IC7) -> output mixer
                                                   |
  record node (Echo On, 22k) + Repeat (from playback preamp) + echo-send
        -> Q3 shunt LIMITER (detector after IC9, half-wave)          [M107 spec: 80 mV, 10:1]
        -> IC9 record pre-emphasis T-network (+8.1 dB, 6.05/15.4 kHz) [component values]
        -> tape (saturation, HF loss)  — single replay head on a SLIDING BAR, 12 ips
        -> playback preamp (Q1/Q2+IC1) EQ 3.27 ms / 70.5 us + coupling HPs
        -+-> REPEAT pot (feedback, pre-tone)                           [schematic]
         +-> Baxandall Bass (100 Hz) / Treble (10 kHz) (IC2) -> Echo Volume -> output mixer

Level convention: 100 mV (H/H nominal) == -18 dBFS RMS.
"""
import numpy as np
from numba import njit

PARAMS = [
    ("in_gain_db", 6.0), ("dry", 0.5), ("echo", 0.5), ("out_db", 0.0),
    ("mode", 2), ("manual_ms", 350.0), ("bpm", 120.0), ("sync_div", 2),
    ("sync_type", 0), ("sync_mult", 1), ("offset_ms", 0.0), ("tap", 0),
    ("tap_div", 3), ("tap_type", 0), ("feedback", 0.45), ("bass_db", 0.0),
    ("treble_db", 0.0), ("sat", 0.5), ("noise_db", -60.0), ("wow", 0.05),
    ("flutter", 0.1), ("hold", 0), ("hold_fb", 1.0), ("drive", 0),
    ("drive_db", 12.0), ("drive_fb", 0), ("tape_stop", 0), ("stop_time", 1.0),
    ("start_time", 0.4), ("slider_mode", 0), ("glide_ms", 60.0),
    ("transition_ms", 250.0), ("fb_hp_hz", 10.0), ("fb_lp_hz", 20000.0),
    ("fb_res", 0.0), ("echo_hp_hz", 10.0), ("echo_lp_hz", 20000.0),
    ("stereo", 0), ("head_spacing_ms", 300.0), ("bar_beats", 4.0),
    ("head_slew", 3.0), ("dry_treble_db", 0.0), ("limiter", 1), ("loop_type", 1),
    ("splice", 0.25), ("protect", 1), ("ceiling_db", -0.3),
    ("slider_taper", 1), ("slider_pos", 0.5), ("slider_min_ms", 60.0), ("slider_max_ms", 600.0),
    ("dry_mono", 0),
]
IDX = {name: i for i, (name, _) in enumerate(PARAMS)}
NP = len(PARAMS)

N_TAPE = 800000
T_MIN = 0.002
T_MAX = 4.0
V_MAX = 4.0
V_MIN = 0.05

# ---- constants derived from M107 (see docs/HH_MODELING_NOTES.md) ----------
PRE_FZ = 6047.0      # record pre-emphasis zero  (C26 470p, R47 22k, R45||R46 34k)
PRE_FP = 15392.0     # record pre-emphasis pole  (C26, R47)
PB_HP = 48.7         # playback EQ tau1 = C3 (R6+R7) = 3.27 ms
REC_HP = 19.3        # record input coupling (22k+2k2, C24/C25 in series)
CPL_HP = 15.4        # C4/R8 and C1/R1 couplings
TAPE_LP = 7782.0     # fitted: echo response -3 dB at 11 kHz (M107 spec) with pre-emphasis
LIM_THR = 0.2828     # 80 mV RMS at input, x2 channel gain, as peak (−20 dBFS RMS · 2 · √2)
LIM_EXP = -0.9       # 10:1 static curve, feed-forward form: g = (env/thr)^(1/R - 1)
LIM_ATT = 0.002      # s  APPROX (not derivable without simulating Q3 network)
LIM_REL = 0.086      # s  R50 390k × C29 0.22 uF
BASS_FC = 65.0       # fitted: ±10 dB at 100 Hz at full knob (shelf Gmax 15 dB)
TREB_FC = 1580.0     # fitted: ±14 dB at 10 kHz (Gmax 18 dB)
DTREB_FC = 1245.0    # fitted: ±16 dB at 10 kHz (Gmax 20 dB)
LOOP_S = (0.65 / 0.305, 3.0 / 0.305)  # short / long loop period at 12 ips


def default_params(n):
    P = np.zeros((n, NP))
    for i, (_, v) in enumerate(PARAMS):
        P[:, i] = v
    return P


DENORM = 2.2250738585072014e-308


@njit(cache=True)
def _fixdenorm(x):
    # mirrors gen~ fixdenorm(): subnormal -> 0
    return 0.0 if abs(x) < DENORM else x


@njit(cache=True)
def _fixnan(x):
    return 0.0 if x != x else x


@njit(cache=True)
def _softclip(x, k, c):
    ax = abs(x)
    if ax > k:
        sg = 1.0 if x >= 0.0 else -1.0
        return sg * (k + (c - k) * np.tanh((ax - k) / (c - k)))
    return x


@njit(cache=True)
def _svf(st, i, x, fc, q, sr):
    fc = min(max(fc, 5.0), 0.49 * sr)
    g = np.tan(np.pi * fc / sr)
    k = 1.0 / q
    a1 = 1.0 / (1.0 + g * (g + k))
    a2 = g * a1
    a3 = g * a2
    v3 = x - st[i, 1]
    v1 = a1 * st[i, 0] + a2 * v3
    v2 = st[i, 1] + a2 * st[i, 0] + a3 * v3
    st[i, 0] = _fixdenorm(2.0 * v1 - st[i, 0])
    st[i, 1] = _fixdenorm(2.0 * v2 - st[i, 1])
    return v2, v1, x - k * v1 - v2


@njit(cache=True)
def _lp1(st, i, x, fc, sr):
    a = 1.0 - np.exp(-2.0 * np.pi * min(fc, 0.49 * sr) / sr)
    st[i, 0] = _fixdenorm(st[i, 0] + a * (x - st[i, 0]))
    return st[i, 0]


@njit(cache=True)
def _hp1(st, i, x, fc, sr):
    return x - _lp1(st, i, x, fc, sr)


@njit(cache=True)
def _zp1(st, i, x, kdc, fz, fp, fw, sr):
    # H(s) = kdc (1 + s/wz) / (1 + s/wp); bilinear transform prewarped at fw,
    # so |H| is exact at the reference frequency fw (the spec's test frequency)
    fw = min(fw, 0.45 * sr)
    K = 2.0 * np.pi * fw / np.tan(np.pi * fw / sr)
    cz = K / (2.0 * np.pi * fz)
    cp = K / (2.0 * np.pi * fp)
    y = _fixdenorm((kdc * ((1.0 + cz) * x + (1.0 - cz) * st[i, 0]) - (1.0 - cp) * st[i, 1]) / (1.0 + cp))
    st[i, 0] = x
    st[i, 1] = y
    return y


@njit(cache=True)
def _lowshelf(st, i, x, gdb, fc, fw, sr):
    A = 10.0 ** (abs(gdb) / 20.0)
    if gdb >= 0.0:
        return _zp1(st, i, x, A, A * fc, fc, fw, sr)
    return _zp1(st, i, x, 1.0 / A, fc, A * fc, fw, sr)


@njit(cache=True)
def _highshelf(st, i, x, gdb, fc, fw, sr):
    A = 10.0 ** (abs(gdb) / 20.0)
    if gdb >= 0.0:
        return _zp1(st, i, x, 1.0, fc, A * fc, fw, sr)
    return _zp1(st, i, x, 1.0, A * fc, fc, fw, sr)


@njit(cache=True)
def _dcblock(st, i, x, sr):
    R = 1.0 - 2.0 * np.pi * 10.0 / sr
    y = _fixdenorm(x - st[i, 0] + R * st[i, 1])
    st[i, 0] = x
    st[i, 1] = y
    return y


@njit(cache=True)
def _hermite(tape, ch, r, N):
    i = np.floor(r)
    f = r - i
    i0 = int(i) % N
    xm1 = tape[(i0 - 1) % N, ch]
    x0 = tape[i0, ch]
    x1 = tape[(i0 + 1) % N, ch]
    x2 = tape[(i0 + 2) % N, ch]
    c1 = 0.5 * (x1 - xm1)
    c2 = xm1 - 2.5 * x0 + 2.0 * x1 - 0.5 * x2
    c3 = 0.5 * (x2 - xm1) + 1.5 * (x0 - x1)
    return ((c3 * f + c2) * f + c1) * f + x0


@njit(cache=True)
def _box(tape, ch, lo, hi, N):
    # mean of the zero-order-hold track over [lo, hi]; cell j spans (j-1, j]
    ilo = np.floor(lo)
    flo = lo - ilo
    ihi = np.floor(hi)
    fhi = hi - ihi
    bs = 0.0
    j = ilo + 1.0
    while j <= ihi:
        bs += tape[int(j) % N, ch]
        j += 1.0
    span = max(hi - lo, 0.000001)
    return (bs + fhi * tape[int(ihi + 1.0) % N, ch] - flo * tape[int(ilo + 1.0) % N, ch]) / span


@njit(cache=True)
def _tapesat(x, b):
    tb = np.tanh(b)
    return (np.tanh(x + b) - tb) / (1.0 - tb * tb)


@njit(cache=True)
def process(xl, xr, P, sr, seed=1):
    n = xl.shape[0]
    N = N_TAPE
    tape = np.zeros((N, 2))
    outl = np.zeros(n)
    outr = np.zeros(n)
    d_ms_out = np.zeros(n)
    v_out = np.zeros(n)
    tapbpm_out = np.zeros(n)
    readrate_out = np.zeros(n)
    limgr_out = np.zeros(n)   # record-limiter gain (1 = no reduction)
    pgain_out = np.zeros(n)   # output-protection gain
    over_out = np.zeros(n)    # pre-protection over flag
    pg_hold = 1.0
    pg_s = 1.0
    ph_cnt = 0.0

    st = np.zeros((64, 2))
    np.random.seed(seed)

    p = 0.0
    r_prev = 0.0
    loop_pos = 0.0
    rec_prev = np.zeros(2)
    T_s1 = -1.0
    T_s2 = -1.0
    d_head = -1.0
    s_stop = 1.0
    hold_s = 0.0
    drive_s = 0.0
    env = 0.0
    lenv = np.zeros(2)
    prev_mode = -1.0
    trans_left = 0.0
    tap_prev = 0.0
    last_tap = -1.0
    t_count = 0
    ti0 = 0.0
    ti1 = 0.0
    ti2 = 0.0
    ti3 = 0.0
    tap_bpm = 120.0
    wow_ph = 0.0
    fl_ph = 0.0
    fl2_ph = 0.0
    wow_rnd = 0.0
    fl_rnd = 0.0

    SM_IDX = np.array([0, 1, 2, 3, 14, 15, 16, 17, 18, 19, 20, 22, 24, 34, 38, 41, 44, 51, 32, 33, 35, 36], dtype=np.int64)
    SM_LOG = np.array([False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, True, True, True, True], dtype=np.bool_)
    SM_N = SM_IDX.shape[0]
    sm_state = np.zeros(SM_N)
    smv = P[0].copy()
    sm_init = False
    a_n = 1.0 - np.exp(-2.0 * np.pi * min(10000.0, 0.49 * sr) / sr)
    noise_norm = 1.0 / np.sqrt((1.0 / 3.0) * a_n / (2.0 - a_n))

    for t in range(n):
        Pn = P[t]
        mode = Pn[4]

        # ---------------- TAP TEMPO ----------------
        tap = Pn[11]
        if tap > tap_prev + 0.5:
            if last_tap >= 0.0:
                iv = t - last_tap
                if iv < 0.15 * sr:
                    iv = -1.0
                elif iv > 2.0 * sr:
                    t_count = 0
                    last_tap = t
                else:
                    if t_count > 0:
                        avg = (ti0 + ti1 + ti2 + ti3) / min(t_count, 4)
                        if abs(iv - avg) > 0.4 * avg:
                            t_count = 0
                    ti3 = ti2
                    ti2 = ti1
                    ti1 = ti0
                    ti0 = iv
                    if t_count == 0:
                        ti1 = 0.0
                        ti2 = 0.0
                        ti3 = 0.0
                    t_count = min(t_count + 1, 4)
                    avg = (ti0 + ti1 + ti2 + ti3) / t_count
                    tap_bpm = 60.0 * sr / avg
                    last_tap = t
            else:
                last_tap = t
        tap_prev = tap

        # ---------------- TARGET DELAY ----------------
        T = Pn[5] * 0.001
        if Pn[47] > 0.5:
            # HARDWARE slider: linear in position between min and max (estimated range)
            s_lo = min(Pn[49], Pn[50])
            s_hi = max(Pn[49], Pn[50])
            T = (s_lo + Pn[48] * (s_hi - s_lo)) * 0.001
        if mode < 1.5:
            bpm = max(Pn[6], 20.0)
            div = int(np.floor(Pn[7] + 0.5))
            typ = int(np.floor(Pn[8] + 0.5))
            if mode >= 0.5:
                bpm = tap_bpm
                div = int(np.floor(Pn[12] + 0.5))
                typ = int(np.floor(Pn[13] + 0.5))
            beats = 0.125
            if div == 1:
                beats = 0.25
            elif div == 2:
                beats = 0.5
            elif div == 3:
                beats = 1.0
            elif div == 4:
                beats = 2.0
            elif div >= 5:
                beats = Pn[39]
            if typ == 1:
                beats *= 1.5
            elif typ == 2:
                beats *= 2.0 / 3.0
            T = 60.0 / bpm * beats * max(Pn[9], 1.0) + Pn[10] * 0.001
        T = min(max(T, T_MIN), T_MAX)

        # ---------------- parameter smoothing (v0.2.2-dev) --------------
        # mirrors psmooth()/fsmooth() in the GenExpr: first sample snaps, exact
        # snap onto a reached target, frequencies on a log scale
        a_ps = 1.0 - np.exp(-1.0 / (0.010 * sr))
        for k in range(SM_N):
            idx = SM_IDX[k]
            tv = Pn[idx]
            if SM_LOG[k]:
                lt = np.log(tv)
                if not sm_init:
                    sm_state[k] = lt
                sm_state[k] = sm_state[k] + a_ps * (lt - sm_state[k])
                if abs(lt - sm_state[k]) <= 0.000000001:
                    sm_state[k] = lt
                smv[idx] = tv if sm_state[k] == lt else np.exp(sm_state[k])
            else:
                if not sm_init:
                    sm_state[k] = tv
                sm_state[k] = sm_state[k] + a_ps * (tv - sm_state[k])
                if abs(tv - sm_state[k]) <= 0.000000001 * max(1.0, abs(tv)):
                    sm_state[k] = tv
                smv[idx] = sm_state[k]
        sm_init = True

        if mode != prev_mode:
            if prev_mode >= 0.0:
                trans_left = Pn[31] * 0.001 * sr * 3.0
            prev_mode = mode
        tau_ms = Pn[30]
        if trans_left > 0.0:
            tau_ms = max(Pn[31], tau_ms)
            trans_left -= 1.0
        a_s = 1.0 - np.exp(-1.0 / (max(tau_ms, 0.5) * 0.001 * sr))
        Ts = T * sr
        if T_s1 < 0.0:
            T_s1 = Ts
            T_s2 = Ts
        T_s1 += a_s * (Ts - T_s1)
        T_s2 += a_s * (T_s1 - T_s2)

        # ---------------- TRANSPORT ----------------
        if Pn[26] > 0.5:
            s_stop = max(0.0, s_stop - 1.0 / (max(Pn[27], 0.02) * sr))
        else:
            s_stop = min(1.0, s_stop + 1.0 / (max(Pn[28], 0.02) * sr))

        loop_cells = (LOOP_S[1] if Pn[43] > 0.5 else LOOP_S[0]) * sr
        wow_ph += 0.7 / sr
        wow_ph -= np.floor(wow_ph)
        fl_ph += 8.5 / sr
        fl_ph -= np.floor(fl_ph)
        fl2_ph += 17.3 / sr
        fl2_ph -= np.floor(fl2_ph)
        wow_rnd += (1.0 - np.exp(-2.0 * np.pi * 0.5 / sr)) * ((np.random.random() * 2.0 - 1.0) * 3.0 - wow_rnd)
        fl_rnd += (1.0 - np.exp(-2.0 * np.pi * 20.0 / sr)) * ((np.random.random() * 2.0 - 1.0) * 2.0 - fl_rnd)
        loop_ph = loop_pos / loop_cells
        wf = smv[19] * 0.006 * (0.7 * np.sin(2.0 * np.pi * wow_ph) + 0.3 * wow_rnd) \
            + smv[20] * 0.002 * (0.5 * np.sin(2.0 * np.pi * fl_ph) + 0.2 * np.sin(2.0 * np.pi * fl2_ph) + 0.3 * fl_rnd) \
            + smv[20] * 0.0005 * np.sin(2.0 * np.pi * loop_ph)   # loop-synchronous tension variation

        v_base = 1.0
        d = T_s2
        if Pn[29] < 0.5:
            # SLIDING REPLAY HEAD (M107): tape at constant speed, head distance = slider
            if d_head < 0.0:
                d_head = T_s2
            hs = max(Pn[40], 0.05)
            d_head += min(max(T_s2 - d_head, -hs), hs)
            d = d_head
        else:
            d = smv[38] * 0.001 * sr
            d_head = T_s2
            v_base = min(max(d / T_s2, V_MIN), V_MAX)
        d = min(max(d, 8.0), N - 16.0)
        v_eff = min(max(v_base * s_stop * (1.0 + wf), 0.0), V_MAX)

        p_new = p + v_eff
        r = p_new - d
        rho = r - r_prev
        if t == 0:
            rho = 1.0
        readrate_out[t] = rho
        w_box = min(max(abs(rho) - 1.0, 0.0), 1.0)
        r_a = r_prev
        r_prev = r

        # splice: fixed point on the loop passing the replay head
        sp_pos = (loop_pos + v_eff - d) % loop_cells
        sp_w = 0.004 * sr
        sp_g = 1.0
        if sp_pos < sp_w:
            sp_g = 1.0 - smv[44] * 0.7 * 0.5 * (1.0 - np.cos(2.0 * np.pi * sp_pos / sp_w))
        loop_pos = (loop_pos + v_eff) % loop_cells

        # ---------------- gates & coefficients ----------------
        a10 = 1.0 - np.exp(-1.0 / (0.010 * sr))
        hold_s += a10 * (Pn[21] - hold_s)
        drive_s += a10 * (Pn[23] - drive_s)
        drive_gain = 10.0 ** (drive_s * smv[24] / 20.0)
        g_t = 2.12 * 4.0 ** (2.0 * (smv[17] - 0.5))
        gp = min(1.0, v_eff / 0.15) * sp_g
        fc_rec = min(18000.0, 0.42 * v_eff * sr)
        fc_tape = min(max(TAPE_LP * v_eff, 50.0), 0.45 * sr)
        fb_amt = smv[14] * (1.0 - hold_s) + smv[22] * hold_s
        q_fb = 0.707 + smv[34] * 6.0
        in_g = 10.0 ** (smv[0] / 20.0)
        noise_g = 10.0 ** (smv[18] / 20.0) * noise_norm if smv[18] > -119.0 else 0.0
        a_att = 1.0 - np.exp(-1.0 / (LIM_ATT * sr))
        a_rel = 1.0 - np.exp(-1.0 / (LIM_REL * sr))

        xlt = _fixnan(xl[t])
        xrt = _fixnan(xr[t])
        if Pn[37] < 0.5:
            xin0 = 0.5 * (xlt + xrt)
            xin1 = xin0
        else:
            xin0 = xlt
            xin1 = xrt

        guard = 1.0
        if env > 1.5:
            guard = 1.5 / env

        rec = np.zeros(2)
        ech = np.zeros(2)
        dryo = np.zeros(2)
        lg = np.zeros(2)
        fbmax = 0.0
        for ch in range(2):
            o = ch * 24
            xin = xin0 if ch == 0 else xin1
            # --- replay head + playback preamp
            y = _hermite(tape, ch, r, N)
            if w_box > 0.0:
                ybox = _box(tape, ch, min(r_a, r), max(r_a, r), N)
                y = y + w_box * (ybox - y)
            y = y * gp
            l1, b1, h1 = _svf(st, o + 0, y, fc_tape, 0.707, sr)        # tape HF loss (fitted)
            y = _hp1(st, o + 1, l1, PB_HP, sr)                          # playback EQ tau1
            y = _hp1(st, o + 2, y, CPL_HP, sr)
            y = _hp1(st, o + 3, y, CPL_HP, sr)
            y = y + _lp1(st, o + 4, np.random.random() * 2.0 - 1.0, 10000.0, sr) * noise_g
            # --- REPEAT (pre-tone, M107) with performance filters
            l2, b2, fh = _svf(st, o + 5, y, smv[32], q_fb, sr)
            fl, b3, h3 = _svf(st, o + 6, fh, smv[33], q_fb, sr)
            fbmax = max(fbmax, abs(fl * fb_amt))
            fbs = fl * fb_amt * guard
            if Pn[25] > 0.5:
                fbs *= drive_gain
            # --- record node: channel amp (op-amp, clean until rails) + repeat
            xa = min(max(xin * in_g, -17.8), 17.8)
            u = xa * drive_gain * (1.0 - hold_s) + fbs
            u = _hp1(st, o + 7, u, REC_HP, sr)
            # Q3 shunt limiter. The hardware senses after the IC9 pre-emphasis
            # (feedback topology); modelled feed-forward with the same static
            # curve: detector = pre-emphasised, half-wave (D2) peak envelope.
            det = max(_zp1(st, o + 17, u, 1.0, PRE_FZ, PRE_FP, 11000.0, sr), 0.0)
            lenv[ch] = _fixdenorm(lenv[ch] + (a_att if det > lenv[ch] else a_rel) * (det - lenv[ch]))
            g_l = 1.0
            if Pn[42] > 0.5 and lenv[ch] > LIM_THR:
                g_l = (lenv[ch] / LIM_THR) ** LIM_EXP
            lg[ch] = g_l
            u = u * g_l
            u = _zp1(st, o + 8, u, 1.0, PRE_FZ, PRE_FP, 11000.0, sr)  # IC9 pre-emphasis
            # tape: DRIVE pushes level into the tape model (ceiling unchanged)
            u = _tapesat(u * g_t * drive_gain, 0.05) / g_t
            u = _dcblock(st, o + 9, u, sr)
            lr, br, hr = _svf(st, o + 10, u, fc_rec, 0.707, sr)
            rec[ch] = lr
            # --- echo output: Baxandall Bass/Treble (outside the loop), perf filters
            e = _lowshelf(st, o + 11, y, smv[15] * 1.5, BASS_FC, 100.0, sr)
            e = _highshelf(st, o + 12, e, smv[16] * (18.0 / 14.0), TREB_FC, 10000.0, sr)
            e1l, e1b, e1h = _svf(st, o + 13, e, smv[35], 0.707, sr)
            e2l, e2b, e2h = _svf(st, o + 14, e1h, smv[36], 0.707, sr)
            ech[ch] = _dcblock(st, o + 15, e2l, sr)
            # --- dry path: dry Treble (IC7)
            xdsrc = (xlt if ch == 0 else xrt)
            if smv[51] > 0.0:                                            # DRY MONO, 10 ms crossfade
                xdm = 0.5 * (xlt + xrt)
                xdsrc = xdm if smv[51] >= 1.0 else xdsrc + smv[51] * (xdm - xdsrc)
            xd = min(max(xdsrc * in_g, -17.8), 17.8)
            dryo[ch] = _highshelf(st, o + 16, xd, smv[41] * (20.0 / 16.0), DTREB_FC, 10000.0, sr)

        if Pn[37] < 0.5:
            rec[1] = rec[0]
            ech[1] = ech[0]

        env = _fixdenorm(env + ((1.0 - np.exp(-1.0 / (0.001 * sr))) if fbmax > env else (1.0 - np.exp(-1.0 / (0.2 * sr)))) * (fbmax - env))

        # ---------------- RECORD HEAD WRITE ----------------
        if v_eff > 0.0:
            k0 = np.floor(p) + 1.0
            while k0 <= p_new:
                f = (k0 - p) / v_eff
                ki = int(k0) % N
                tape[ki, 0] = rec_prev[0] + f * (rec[0] - rec_prev[0])
                tape[ki, 1] = rec_prev[1] + f * (rec[1] - rec_prev[1])
                k0 += 1.0
        rec_prev[0] = rec[0]
        rec_prev[1] = rec[1]
        p = p_new
        if p >= N:
            p -= N
            r_prev -= N

        og = 10.0 ** (smv[3] / 20.0)
        o1 = _fixnan((dryo[0] * smv[1] + ech[0] * smv[2]) * og)
        o2 = _fixnan((dryo[1] * smv[1] + ech[1] * smv[2]) * og)
        # ---------------- OUTPUT PROTECTION (after dry/wet sum) ----------
        c_lin = 10.0 ** (Pn[46] / 20.0)
        thr = c_lin * 0.944061
        pk = max(abs(o1), abs(o2))
        over_out[t] = 1.0 if pk > thr else 0.0
        pg = 1.0
        if Pn[45] > 0.5:
            greq = thr / pk if pk > thr else 1.0
            if greq < pg_hold:
                pg_hold = greq
                ph_cnt = 0.010 * sr
            elif ph_cnt > 0.0:
                ph_cnt -= 1.0
            else:
                pg_hold = pg_hold + (1.0 - np.exp(-1.0 / (0.150 * sr))) * (1.0 - pg_hold)
            if pg_hold < pg_s:
                pg_s = pg_s + (1.0 - np.exp(-1.0 / (0.0005 * sr))) * (pg_hold - pg_s)
            else:
                pg_s = pg_hold
            pg = pg_s
            o1 = _softclip(o1 * pg, thr, c_lin)
            o2 = _softclip(o2 * pg, thr, c_lin)
        else:
            pg_hold = 1.0
            pg_s = 1.0
            ph_cnt = 0.0
        pgain_out[t] = pg
        outl[t] = o1
        outr[t] = o2
        d_ms_out[t] = (d / max(v_eff, 1e-9)) / sr * 1000.0
        v_out[t] = v_eff
        tapbpm_out[t] = tap_bpm
        limgr_out[t] = lg[0]

    return outl, outr, d_ms_out, v_out, tapbpm_out, readrate_out, limgr_out, pgain_out, over_out
