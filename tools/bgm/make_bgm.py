#!/usr/bin/env python3.13
# -*- coding: utf-8 -*-
"""Synthesise the app's background music: a slow, quiet jazz trio
(electric piano, upright bass, brushed ride) heard inside a café while
rain falls outside. Everything is generated from scratch with numpy and
written as a seamless 32-bar loop.

    python3.13 tools/bgm/make_bgm.py   # -> tools/bgm/bgm_rainy_cafe.wav
    ffmpeg -i bgm_rainy_cafe.wav -c:a aac -b:a 112k bgm_rainy_cafe.m4a
"""
import math
import os
import wave

import numpy as np

SR = 44100
BPM = 74
BEAT = 60.0 / BPM
BARS = 32
PRE = 1  # one pre-roll bar (a copy of the last bar) so tails wrap seamlessly
BAR_S = 4 * BEAT
TOTAL_S = (BARS + PRE) * BAR_S
N = int(TOTAL_S * SR)
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "bgm_rainy_cafe.wav")

rng = np.random.default_rng(20261103)


def midi(n):
    return 440.0 * 2 ** ((n - 69) / 12)


# ── chord progression (8 bars, repeats) ─────────────────────────────────
# (name, ep voicing midi, bass root midi, scale tones for melody)
D, Eb, E, F, Gb, G, Ab, A, Bb, B, C, Db = 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73
PROG = [
    [("Dm9",   [D, F, A, C, E],        38, [D, E, F, A, C])],
    [("G13",   [F, A, B, E],           43, [G, A, B, D, E])],
    [("Cmaj9", [E, G, B, D],           36, [C, D, E, G, A])],
    [("Am9",   [C, E, G, B],           33, [A, C, D, E, G])],
    [("Fmaj9", [A, C, E, G],           41, [F, G, A, C, D])],
    [("Em7",   [G, B, D, E + 12],      40, [E, G, A, B, D]), ("A7b9", [G, Bb, Db, E], 33, [A, Bb, Db, E, G])],
    [("Dm9",   [D, F, A, C, E],        38, [D, E, F, A, C]), ("G13", [F, A, B, E], 43, [G, A, B, D, E])],
    [("Cmaj9", [E, G, B, D],           36, [C, D, E, G, A])],
]


def chords_in_bar(bar):
    return PROG[bar % 8]


# ── instruments ─────────────────────────────────────────────────────────
def env(n, attack, decay, sustain, release, hold):
    """Simple ADSR in samples; hold = time until release starts."""
    t = np.arange(n) / SR
    e = np.ones(n)
    a = max(1, int(attack * SR))
    e[:a] = np.linspace(0, 1, a)
    d0 = a
    d1 = min(n, d0 + int(decay * SR))
    if d1 > d0:
        e[d0:d1] = np.linspace(1, sustain, d1 - d0)
    e[d1:] = sustain
    r0 = min(n, int(hold * SR))
    rel = np.exp(-(t[r0:] - t[r0]) / max(release, 0.01))
    e[r0:] *= rel
    return e


def ep_note(freq, dur, vel):
    """Rhodes-like tone: fundamental + soft harmonics + a fast-decaying bell."""
    n = int((dur + 1.6) * SR)
    t = np.arange(n) / SR
    bell = np.exp(-t * 6.0)
    wave_ = (np.sin(2 * np.pi * freq * t)
             + 0.35 * np.sin(2 * np.pi * freq * 2 * t) * np.exp(-t * 2.0)
             + 0.12 * np.sin(2 * np.pi * freq * 3 * t) * np.exp(-t * 3.0)
             + 0.18 * np.sin(2 * np.pi * freq * 5.9 * t) * bell * vel)
    trem = 1 + 0.06 * np.sin(2 * np.pi * 4.6 * t)
    e = env(n, 0.004, 0.25, 0.55, 0.9, dur)
    return wave_ * e * trem * vel * 0.26


def bass_note(freq, dur, vel):
    n = int((dur + 0.5) * SR)
    t = np.arange(n) / SR
    wave_ = (np.sin(2 * np.pi * freq * t)
             + 0.5 * np.sin(2 * np.pi * freq * 2 * t) * np.exp(-t * 4)
             + 0.2 * np.sin(2 * np.pi * freq * 3 * t) * np.exp(-t * 6))
    pluck = np.exp(-t * 18) * 0.4 * np.sin(2 * np.pi * freq * 4 * t)
    e = env(n, 0.006, 0.12, 0.7, 0.25, dur * 0.9)
    return (wave_ + pluck) * e * vel * 0.3


def noise_burst(dur, lo, hi, decay):
    n = int(dur * SR)
    x = rng.standard_normal(n)
    X = np.fft.rfft(x)
    f = np.fft.rfftfreq(n, 1 / SR)
    band = ((f >= lo) & (f <= hi)).astype(float)
    # soft edges
    band = np.convolve(band, np.ones(9) / 9, mode="same")
    x = np.fft.irfft(X * band, n)
    t = np.arange(n) / SR
    return x * np.exp(-t / decay)


# ── render helpers ──────────────────────────────────────────────────────
def add(buf, start_s, sig, pan=0.0):
    """Mix sig into stereo buf at start_s seconds; pan -1..1."""
    i = int(start_s * SR)
    if i >= N:
        return
    seg = sig[: N - i]
    l = math.cos((pan + 1) * math.pi / 4)
    r = math.sin((pan + 1) * math.pi / 4)
    buf[i:i + len(seg), 0] += seg * l
    buf[i:i + len(seg), 1] += seg * r


def swing(beat_pos):
    """Beat position within a bar (0-based, .5 = offbeat) → seconds, swung."""
    whole = math.floor(beat_pos)
    frac = beat_pos - whole
    if abs(frac - 0.5) < 1e-6:
        frac = 0.64
    return (whole + frac) * BEAT


def bar_events(bar):
    """Deterministic per-bar randomness so the pre-roll bar matches the last bar."""
    return np.random.default_rng(1000 + bar)


music = np.zeros((N, 2), dtype=np.float64)

# which bar index is rendered at each slot: pre-roll = last bar
slots = [BARS - 1] + list(range(BARS))

for slot, bar in enumerate(slots):
    r = bar_events(bar)
    t0 = slot * BAR_S
    chords = chords_in_bar(bar)
    per = 4 / len(chords)

    # ── electric piano comping ──
    patterns = [[0, 1.5], [0.5, 2], [0, 2.5], [1.5, 3], [0, 1.5, 3], [0.5, 2.5]]
    pat = patterns[r.integers(len(patterns))]
    for k, (name, voicing, root, scale) in enumerate(chords):
        cstart, cend = k * per, (k + 1) * per
        hits = [p for p in pat if cstart <= p < cend] or [cstart]
        for p in hits:
            vel = 0.45 + 0.25 * r.random()
            hold = min(cend - p, 1.6 + r.random()) * BEAT
            voice = voicing if r.random() < 0.7 else voicing[1:]
            for j, m in enumerate(voice):
                # tiny strum
                add(music, t0 + swing(p) + j * 0.012, ep_note(midi(m), hold, vel * (0.9 + 0.1 * r.random())), pan=0.25)

    # ── sparse melody on the electric piano (bars 3,4,7,8 of each 8) ──
    if bar % 8 in (2, 3, 6, 7) and r.random() < 0.85:
        name, voicing, root, scale = chords[0]
        notes = [m + 12 for m in scale]  # one octave up
        idx = r.integers(len(notes))
        pos = r.choice([0.0, 0.5, 1.0, 1.5, 2.0])
        for _ in range(r.integers(2, 5)):
            if pos >= 4:
                break
            m = notes[idx]
            dur = r.choice([0.5, 1.0, 1.5, 2.0])
            add(music, t0 + swing(pos), ep_note(midi(m), dur * BEAT, 0.5 + 0.2 * r.random()), pan=0.35)
            idx = int(np.clip(idx + r.choice([-2, -1, 1, 1, 2]), 0, len(notes) - 1))
            pos += dur if r.random() < 0.7 else dur + 0.5

    # ── walking bass ──
    next_root = chords_in_bar(bar + 1)[0][2]
    for k, (name, voicing, root, scale) in enumerate(chords):
        cstart = k * per
        if per == 4:
            third = root + (3 if "m" in name and "maj" not in name else 4)
            fifth = root + 7
            approach = next_root + r.choice([-1, 1, -2])
            walk = [root, third, fifth, approach]
        else:
            fifth = root + 7
            walk = [root, fifth]
        for b, m in enumerate(walk):
            while m > 45:
                m -= 12
            while m < 31:
                m += 12
            vel = 0.75 + 0.2 * r.random()
            add(music, t0 + (cstart + b) * BEAT, bass_note(midi(m), BEAT * 0.95, vel), pan=0.0)

    # ── brushes: ride pattern + hi-hat on 2 and 4 + swish ──
    for p in [0, 1, 1.5, 2, 3, 3.5]:
        acc = 1.0 if p in (0, 2) else 0.7
        add(music, t0 + swing(p), noise_burst(0.4, 2500, 7500, 0.09) * 0.06 * acc, pan=-0.4)
    for p in [1, 3]:
        add(music, t0 + swing(p), noise_burst(0.12, 400, 2500, 0.03) * 0.05, pan=-0.3)
    for p in [0, 1, 2, 3]:
        sw = noise_burst(BEAT, 300, 2800, 0.6)
        n = len(sw)
        sw *= np.sin(np.linspace(0, np.pi, n)) ** 2
        add(music, t0 + swing(p), sw * 0.018, pan=-0.5)

# ── room reverb (small café) ────────────────────────────────────────────
def reverb(sig, mix=0.16, seconds=1.3):
    n = int(seconds * SR)
    t = np.arange(n) / SR
    ir = rng.standard_normal(n) * np.exp(-t * 4.5)
    # darken the tail
    IR = np.fft.rfft(ir)
    f = np.fft.rfftfreq(n, 1 / SR)
    IR *= 1 / (1 + (f / 3500) ** 2)
    ir = np.fft.irfft(IR, n)
    ir /= np.sqrt(np.sum(ir ** 2))
    out = np.zeros_like(sig)
    for ch in range(2):
        wet = np.fft.irfft(np.fft.rfft(sig[:, ch], N + n) * np.fft.rfft(ir, N + n), N + n)[:N]
        out[:, ch] = sig[:, ch] + mix * wet * 0.5
    return out


music = reverb(music)

# cut the pre-roll bar: the loop is bars 0..31 as rendered in slots 1..32
start = int(PRE * BAR_S * SR)
loop_n = int(BARS * BAR_S * SR)
music = music[start:start + loop_n]
L = len(music)

# ── rain ────────────────────────────────────────────────────────────────
def rain(n):
    out = np.zeros((n, 2))
    for ch in range(2):
        x = rng.standard_normal(n)
        X = np.fft.rfft(x)
        f = np.fft.rfftfreq(n, 1 / SR)
        shape = np.ones_like(f)
        shape[1:] = (f[1:] / 1000) ** -0.35          # gently pink
        shape *= 1 / (1 + (f / 5000) ** 4)           # roll off highs
        shape *= f / (f + 150)                       # thin the lows
        x = np.fft.irfft(X * shape, n)
        x /= np.max(np.abs(x))
        # slow gusts
        t = np.arange(n) / SR
        gust = 1 + 0.18 * np.sin(2 * np.pi * 0.07 * t + ch) + 0.1 * np.sin(2 * np.pi * 0.023 * t)
        out[:, ch] = x * gust
    # individual drops on the window
    drops = int(n / SR * 9)
    for _ in range(drops):
        i = rng.integers(0, n)
        d = noise_burst(0.03, 1800, 6000, 0.006) * (0.3 + 0.7 * rng.random())
        pan = rng.random() * 2 - 1
        seg = d[: n - i]
        out[i:i + len(seg), 0] += seg * (1 - pan) * 0.5
        out[i:i + len(seg), 1] += seg * (1 + pan) * 0.5
    # circular crossfade so the loop point is silent-safe
    xf = int(2.0 * SR)
    ramp = np.linspace(0, 1, xf)[:, None]
    head = out[:xf].copy()
    out[:xf] = out[:xf] * ramp + out[-xf:] * (1 - ramp)
    out[-xf:] = out[-xf:] * (1 - ramp) + head * ramp
    return out * 0.15


mix = music * 0.9 + rain(L)

# soft limiter + normalise
mix = np.tanh(mix * 1.6) / 1.6
peak = np.max(np.abs(mix))
mix = mix / peak * 0.85

pcm = (mix * 32767).astype(np.int16)
with wave.open(OUT, "wb") as w:
    w.setnchannels(2)
    w.setsampwidth(2)
    w.setframerate(SR)
    w.writeframes(pcm.tobytes())
print(f"wrote {OUT}: {L / SR:.1f} s, peak {peak:.2f}")
