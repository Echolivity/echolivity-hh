"""Writes test WAVs for the in-Live tests (impulse, sines) at 44.1/48/88.2/96 kHz."""
import numpy as np, os
from scipy.io import wavfile
out = os.path.join(os.path.dirname(__file__), "signals"); os.makedirs(out, exist_ok=True)
for sr in (44100, 48000, 88200, 96000):
    imp = np.zeros(sr * 3, np.float32); imp[sr // 10] = 0.5
    wavfile.write(f"{out}/impulse_{sr}.wav", sr, imp)
    t = np.arange(sr * 6) / sr
    wavfile.write(f"{out}/sine1k_{sr}.wav", sr, (0.3 * np.sin(2 * np.pi * 1000 * t)).astype(np.float32))
    wavfile.write(f"{out}/sine200_{sr}.wav", sr, (0.25 * np.sin(2 * np.pi * 200 * t)).astype(np.float32))
print("written to", out)
