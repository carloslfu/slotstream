#!/usr/bin/env python3
"""Reference implementation of slotstream's sampler, in numpy float32.

The oracle for `slotstream sampler-golden`. Both sides build their logits from
the same splitmix64 stream using only exactly representable float operations,
so the two must agree token for token.

Order matches HuggingFace's processor chain and Sampler.next():
presence penalty on raw logits -> temperature -> top-k -> top-p -> min-p ->
inverse-CDF draw scaled by the unnormalized total.
"""
import argparse
import numpy as np

M = (1 << 64) - 1
GAMMA = 0x9E3779B97F4A7C15


def splitmix(v):
    v = (v + GAMMA) & M
    v = ((v ^ (v >> 30)) * 0xBF58476D1CE4E5B9) & M
    v = ((v ^ (v >> 27)) * 0x94D049BB133111EB) & M
    return v ^ (v >> 31)


def make_logits(vocab, seed):
    st, out = seed, []
    for _ in range(vocab):
        st = splitmix(st)
        out.append(np.float32(st >> 40) / np.float32(1 << 24) * np.float32(8.0) - np.float32(4.0))
    return np.array(out, dtype=np.float32)


def softmax(x):
    e = np.exp((x - x.max()).astype(np.float32))
    return (e / e.sum()).astype(np.float32)


def sample(logits, a, state, generated):
    l = logits.astype(np.float32).copy()
    if a.presence_penalty != 0 and generated:
        idx = np.array(sorted(generated), dtype=np.int64)
        l[idx] = (l[idx] - np.float32(a.presence_penalty)).astype(np.float32)
    if a.temperature <= 0:
        return int(np.argmax(l)), state
    l = (l / np.float32(a.temperature)).astype(np.float32)
    if 0 < a.top_k < l.shape[0]:
        kth = np.sort(l)[::-1][a.top_k - 1]
        l = np.where(l < kth, np.float32(-np.inf), l).astype(np.float32)
    probs = softmax(l)
    if a.top_p < 1:
        order = np.argsort(-probs, kind="stable")
        srt = probs[order]
        cum = np.cumsum(srt, dtype=np.float32)
        keep_sorted = (cum - srt) < np.float32(a.top_p)
        keep = np.zeros_like(probs, dtype=bool)
        keep[order] = keep_sorted
        probs = np.where(keep, probs, np.float32(0)).astype(np.float32)
    if a.min_p > 0:
        cutoff = (probs.max() * np.float32(a.min_p)).astype(np.float32)
        probs = np.where(probs < cutoff, np.float32(0), probs).astype(np.float32)
    state = splitmix((state + 1) & M)
    u = np.float32((state >> 11) / float(1 << 53))
    cdf = np.cumsum(probs, dtype=np.float32)
    total = cdf[-1]
    if not np.isfinite(total) or total <= 0:
        return int(np.argmax(logits.astype(np.float32))), state
    pick = int((cdf < (u * total).astype(np.float32)).sum())
    return min(pick, probs.shape[0] - 1), state


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--vocab", type=int, default=256)
    p.add_argument("--draws", type=int, default=24)
    p.add_argument("--seed", type=int, default=7)
    p.add_argument("--logit-seed", type=int, default=99)
    p.add_argument("--temperature", type=float, default=0.8)
    p.add_argument("--top-p", type=float, default=0.95)
    p.add_argument("--top-k", type=int, default=40)
    p.add_argument("--min-p", type=float, default=0.0)
    p.add_argument("--presence-penalty", type=float, default=0.0)
    p.add_argument("--accumulate", action="store_true")
    a = p.parse_args()

    # mirrors SampleParams.sanitized()
    a.temperature = max(0.0, a.temperature)
    if not (0 < a.top_p <= 1):
        a.top_p = 1.0
    a.min_p = min(max(0.0, a.min_p), 1.0)
    a.top_k = max(0, a.top_k)

    logits = make_logits(a.vocab, a.logit_seed)
    state = a.seed if a.seed != 0 else 0xDEADBEEF
    generated, picks = set(), []
    for _ in range(a.draws):
        t, state = sample(logits, a, state, generated)
        picks.append(t)
        if a.accumulate:
            generated.add(t)
    print(",".join(str(x) for x in picks))


if __name__ == "__main__":
    main()
