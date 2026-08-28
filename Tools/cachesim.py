"""M1: expert slot-cache simulator.

Replays real router traces against cache policies and sizes to produce the
h(size) curves the whole tiering rests on. No model needed.

Key modelling detail: the cache is GLOBAL across layers, keyed by
(layer, expert) -> 24,576 distinct records of 2.7648 MB each.

Usage:
  python cachesim.py bench/traces/*.npz
"""
import sys, json, glob
import numpy as np
from collections import OrderedDict, defaultdict

REC_MB = 2.7648
N_LAYERS, N_EXPERTS = 48, 512
TOTAL_RECORDS = N_LAYERS * N_EXPERTS


class LRU:
    name = "LRU"

    def __init__(self, cap):
        self.cap = cap
        self.d = OrderedDict()

    def access(self, key):
        if key in self.d:
            self.d.move_to_end(key)
            return True
        if len(self.d) >= self.cap:
            self.d.popitem(last=False)
        self.d[key] = 1
        return False


class LFUDecay:
    """CLOCK-ish frequency cache: evict lowest freq, halve counters periodically."""
    name = "LFU-decay"

    def __init__(self, cap, decay_every=20000):
        self.cap = cap
        self.freq = {}
        self.n = 0
        self.decay_every = decay_every

    def access(self, key):
        self.n += 1
        if self.n % self.decay_every == 0:
            for k in self.freq:
                self.freq[k] >>= 1
        if key in self.freq:
            self.freq[key] += 1
            return True
        if len(self.freq) >= self.cap:
            victim = min(self.freq, key=self.freq.get)
            del self.freq[victim]
        self.freq[key] = 1
        return False


class Belady:
    """Offline optimal (upper bound). Only for small traces."""
    name = "OPT(bound)"

    def __init__(self, cap, seq):
        self.cap = cap
        self.next = defaultdict(list)
        for i, k in enumerate(seq):
            self.next[k].append(i)
        self.pos = defaultdict(int)
        self.cache = set()
        self.i = -1
        self.seq = seq

    def access(self, key):
        self.i += 1
        self.pos[key] += 1
        if key in self.cache:
            return True
        if len(self.cache) >= self.cap:
            # evict the one used farthest in the future
            worst, worst_at = None, -1
            for c in self.cache:
                nxt = self.next[c]
                p = self.pos[c]
                at = nxt[p] if p < len(nxt) else 10**9
                if at > worst_at:
                    worst, worst_at = c, at
            self.cache.discard(worst)
        self.cache.add(key)
        return False


def trace_to_keys(arr):
    """(steps, layers, topk) -> flat sequence of (layer*512+expert) keys."""
    steps, layers, topk = arr.shape
    lay = np.arange(layers, dtype=np.int32)[None, :, None]
    keys = lay * N_EXPERTS + arr.astype(np.int32)
    return keys.reshape(-1)


def hot_set_pinned(keys, cap, hot_frac=0.5):
    """Pin the globally hottest `hot_frac*cap` records, LRU the rest."""
    counts = np.bincount(keys, minlength=TOTAL_RECORDS)
    n_hot = int(cap * hot_frac)
    hot = set(np.argsort(-counts)[:n_hot].tolist())
    lru = LRU(cap - n_hot)
    hits = 0
    for k in keys:
        if k in hot:
            hits += 1
        elif lru.access(k):
            hits += 1
    return hits / len(keys)


def simulate(keys, cap, policy_cls):
    p = policy_cls(cap)
    hits = 0
    for k in keys:
        if p.access(int(k)):
            hits += 1
    return hits / len(keys)


def analyze(name, arr, caps_gb):
    keys = trace_to_keys(arr)
    steps = arr.shape[0]
    uniq = len(np.unique(keys))
    counts = np.bincount(keys, minlength=TOTAL_RECORDS)
    nz = counts[counts > 0]
    top10 = np.sort(counts)[::-1][: int(TOTAL_RECORDS * 0.1)].sum() / counts.sum()

    print(f"\n### {name}: {steps} steps, {len(keys):,} expert-uses")
    print(f"    distinct records touched: {uniq:,} / {TOTAL_RECORDS:,} "
          f"({100*uniq/TOTAL_RECORDS:.1f}%)")
    print(f"    top-10% of records serve {100*top10:.1f}% of accesses "
          f"(concentration)")
    print(f"    working set if fully cached: {uniq*REC_MB/1024:.1f} GB")

    print(f"    {'cache GB':>9} {'slots':>7} {'LRU':>8} {'LFU':>8} {'hot+LRU':>8}"
          f" {'miss MB/tok':>12} {'IO ms/tok@6GB/s':>16}")
    rows = []
    for gb in caps_gb:
        cap = int(gb * 1024 / REC_MB)
        if cap < 1:
            continue
        h_lru = simulate(keys, cap, LRU)
        h_lfu = simulate(keys, cap, LFUDecay)
        h_hot = hot_set_pinned(keys, cap)
        best = max(h_lru, h_lfu, h_hot)
        per_tok = arr.shape[1] * arr.shape[2]  # layers*topk expert-uses per token
        miss_mb = per_tok * (1 - best) * REC_MB
        io_ms = miss_mb / 6000 * 1000
        print(f"    {gb:9.1f} {cap:7d} {h_lru:8.3f} {h_lfu:8.3f} {h_hot:8.3f}"
              f" {miss_mb:12.1f} {io_ms:16.1f}")
        rows.append(dict(gb=gb, slots=cap, lru=h_lru, lfu=h_lfu, hot=h_hot,
                         miss_mb=miss_mb, io_ms=io_ms))
    return rows


if __name__ == "__main__":
    files = sys.argv[1:] or sorted(glob.glob("bench/traces/*.npz"))
    if not files:
        print("no traces given"); sys.exit(1)
    caps = [0.5, 1, 2, 5.5, 10.5, 16, 27, 36, 56, 68]
    out = {}
    for f in files:
        z = np.load(f)
        for k in z.files:
            if k == "meta":
                continue
            arr = z[k]
            if arr.ndim != 3:
                continue
            out[f"{f}:{k}"] = analyze(f"{f.split('/')[-1]}:{k}", arr, caps)
    with open("bench/locality/summary.json", "w") as fh:
        json.dump(out, fh, indent=2)
    print("\nwrote bench/locality/summary.json")
