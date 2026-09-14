#!/usr/bin/env python3
"""Expert Lookahead 2, W1: exact offline replacement-policy lab.

Replays a capture's decode demand stream (one `ensureCore` call per layer event, batch-pinned: every
key of the event is pinned before victims are chosen, victims are chosen in demand order, and no key
of the current batch is evicted) under candidate replacement policies, at the native slot count, at
1.2x and at the 24 GB slot count. Policies are scored by misses and by the measured read-cost model
(fixed cost per layer event with a miss plus a marginal cost per missing record), with Belady's
optimum beside every table. Constants are fit on the train split and selected on validation.
No model process and no engine: shards are read, nothing is written but the report.

  python3 Tools/expert_lookahead_replacement.py lab --run DIR --cost-model FILE --out FILE [options]
"""
import argparse
import heapq
import json
import multiprocessing as mp
import sys
import time
from collections import OrderedDict, defaultdict
from pathlib import Path

import numpy as np

sys.path.insert(0, str(Path(__file__).resolve().parent))
import expert_lookahead as xla  # noqa: E402

LAYERS, EXPERTS = xla.LAYERS, xla.EXPERTS


def log(msg):
    print(f"[{time.strftime('%H:%M:%S')}] {msg}", flush=True)


# ---------------------------------------------------------------- streams

def load_stream(run_dir, row):
    """One request's replay input, parsed from its shards without touching feature or x2 payloads."""
    passes, demand, admissions, residency = {}, [], [], None
    for shard in row["capture"]["shards"]:
        path = Path(run_dir) / "shards" / shard["path"]
        for kind, payload in xla.iter_records(path):
            if kind in (1, 5, 6, 7):
                rec = xla.parse_record(kind, payload)
                if kind == 1:
                    passes[rec["pass_id"]] = rec["phase"]
                elif kind == 5:
                    demand.append(rec)
                elif kind == 6:
                    admissions.append(rec)
                else:
                    residency = rec
    if residency is None:
        return None
    after = residency["after"]
    if after < 0:
        prefill = [pid for pid, ph in passes.items() if ph == 0]
        after = max(prefill) if prefill else -1
    # Prefill touches in shard (chronological) order: sweep admissions and prefill demand events.
    touches = []
    for rec in admissions:
        touches.extend(int(rec["layer"]) * EXPERTS + int(e) for e in rec["experts"])
    for e in demand:
        if e["pass_id"] <= after:
            touches.extend(int(e["layer"]) * EXPERTS + int(x) for x in e["unique"])
    events = sorted([e for e in demand if e["pass_id"] > after], key=lambda e: (e["pass_id"], e["layer"]))
    keys = [np.array([int(e["layer"]) * EXPERTS + int(x) for x in e["unique"]], np.int64) for e in events]
    return dict(
        id=row["id"], split=row["split"], kind=row["kind"],
        decode_seconds=row["stats"]["decodeSeconds"], decode_io_seconds=row["stats"]["decodeIOSeconds"],
        capacity=len(residency["keys"]), initial_keys=[int(k) for k in residency["keys"]],
        initial_bits=[bool(b) for b in residency["bits"]], hand=int(residency["hand"]),
        ev_pass=np.array([e["pass_id"] for e in events], np.int64), ev_layer=np.array([e["layer"] for e in events], np.int64),
        ev_keys=keys, ev_native_miss=np.array([len(e["miss"]) for e in events], np.int64),
        ev_native_miss_keys=[[int(e["layer"]) * EXPERTS + int(x) for x in e["miss"]] for e in events],
        touches=touches, phase=passes)


def seeding(stream, mode):
    """Initial resident keys in LRU-to-MRU order, their reference bits and prefill touch counts."""
    keys = [k for k in stream["initial_keys"] if k >= 0]
    bits = {k: b for k, b in zip(stream["initial_keys"], stream["initial_bits"]) if k >= 0}
    counts = defaultdict(int)
    last = {}
    for i, k in enumerate(stream["touches"]):
        counts[k] += 1
        last[k] = i
    if mode == "slot":
        ordered = keys
    elif mode == "touch":
        ordered = sorted(keys, key=lambda k: (bits[k], last.get(k, -1)))
    else:
        raise ValueError(mode)
    return ordered, bits, counts


# ---------------------------------------------------------------- policies (key level, batch pinned)

class Policy:
    name = "base"

    def __init__(self, capacity, **params):
        self.capacity = capacity
        self.params = params

    def seed(self, ordered, bits, counts):
        for k in ordered[-self.capacity:]:
            self.insert_seed(k, bits.get(k, False), counts.get(k, 0))

    def insert_seed(self, key, bit, count):
        raise NotImplementedError

    def batch(self, keys):
        raise NotImplementedError


class LRU(Policy):
    name = "lru"

    def __init__(self, capacity, **params):
        super().__init__(capacity, **params)
        self.od = OrderedDict()

    def insert_seed(self, key, bit, count):
        self.od[key] = None

    def batch(self, keys):
        od, cap = self.od, self.capacity
        pinned = set(keys.tolist())
        misses = 0
        for k in keys.tolist():
            if k in od:
                od.move_to_end(k)
                continue
            misses += 1
            while len(od) >= cap:
                v = next(iter(od))
                if v in pinned:
                    od.move_to_end(v)
                    continue
                od.popitem(last=False)
            od[k] = None
        return misses


class SLRU(Policy):
    """Segmented LRU: probation for new keys, protected for keys hit at least once more."""
    name = "slru"

    def __init__(self, capacity, protected_frac=0.8, **params):
        super().__init__(capacity, protected_frac=protected_frac, **params)
        self.prot_cap = max(1, int(capacity * protected_frac))
        self.prob, self.prot = OrderedDict(), OrderedDict()

    def insert_seed(self, key, bit, count):
        if bit and len(self.prot) < self.prot_cap:
            self.prot[key] = None
        else:
            self.prob[key] = None

    def batch(self, keys):
        prob, prot, cap, prot_cap = self.prob, self.prot, self.capacity, self.prot_cap
        pinned = set(keys.tolist())
        misses = 0
        for k in keys.tolist():
            if k in prot:
                prot.move_to_end(k)
                continue
            if k in prob:
                prob.pop(k)
                prot[k] = None
                while len(prot) > prot_cap:
                    d, _ = prot.popitem(last=False)
                    prob[d] = None
                continue
            misses += 1
            while len(prob) + len(prot) >= cap:
                if prob:
                    v = next(iter(prob))
                    if v in pinned:
                        prob.move_to_end(v)
                        continue
                    prob.popitem(last=False)
                else:
                    v = next(iter(prot))
                    if v in pinned:
                        prot.move_to_end(v)
                        continue
                    prot.popitem(last=False)
            prob[k] = None
        return misses


class S3FIFO(Policy):
    """S3-FIFO: small FIFO for new keys, main FIFO with lazy promotion, ghost FIFO of evicted keys."""
    name = "s3fifo"

    def __init__(self, capacity, small_frac=0.1, ghost_frac=0.9, **params):
        super().__init__(capacity, small_frac=small_frac, ghost_frac=ghost_frac, **params)
        self.small_cap = max(1, int(capacity * small_frac))
        self.ghost_cap = max(1, int(capacity * ghost_frac))
        self.small, self.main, self.ghost = OrderedDict(), OrderedDict(), OrderedDict()
        self.freq = {}

    def insert_seed(self, key, bit, count):
        self.main[key] = None
        self.freq[key] = 1 if bit else 0

    def _evict(self, pinned):
        small, main, ghost, freq = self.small, self.main, self.ghost, self.freq
        scans = 0
        limit = 2 * (len(small) + len(main)) + 2
        while True:
            scans += 1
            if scans > limit:
                raise RuntimeError("s3fifo: no evictable key (all pinned?)")
            if len(small) >= self.small_cap and small:
                k, _ = small.popitem(last=False)
                if k in pinned:
                    small[k] = None
                    continue
                if freq[k] > 1:
                    main[k] = None
                    freq[k] = 0
                    continue
                del freq[k]
                ghost[k] = None
                if len(ghost) > self.ghost_cap:
                    ghost.popitem(last=False)
                return
            if main:
                k, _ = main.popitem(last=False)
                if k in pinned:
                    main[k] = None
                    continue
                if freq[k] > 0:
                    freq[k] -= 1
                    main[k] = None
                    continue
                del freq[k]
                return
            # main empty: fall back to the small queue regardless of its fill
            k, _ = small.popitem(last=False)
            if k in pinned:
                small[k] = None
                continue
            del freq[k]
            ghost[k] = None
            if len(ghost) > self.ghost_cap:
                ghost.popitem(last=False)
            return

    def batch(self, keys):
        small, main, ghost, freq, cap = self.small, self.main, self.ghost, self.freq, self.capacity
        pinned = set(keys.tolist())
        misses = 0
        for k in keys.tolist():
            if k in freq:
                freq[k] = min(freq[k] + 1, 3)
                continue
            misses += 1
            while len(small) + len(main) >= cap:
                self._evict(pinned)
            if k in ghost:
                ghost.pop(k)
                main[k] = None
            else:
                small[k] = None
            freq[k] = 0
        return misses


class CountMinSketch:
    def __init__(self, capacity, width_factor=4, rows=4, halving_factor=10):
        w = 1
        while w < capacity * width_factor:
            w <<= 1
        self.mask = w - 1
        self.rows = rows
        self.tables = [[0] * w for _ in range(rows)]
        self.seeds = [(0x9E3779B1, 0x85EBCA77), (0xC2B2AE3D, 0x27D4EB2F), (0x165667B1, 0xD3A2646C), (0xFD7046C5, 0xB55A4F09)][:rows]
        self.sample = 0
        self.limit = capacity * halving_factor

    def _idx(self, key, a, b):
        return (((key * a) ^ b) * 0x2545F491 >> 7) & self.mask

    def increment(self, key):
        for t, (a, b) in zip(self.tables, self.seeds):
            i = self._idx(key, a, b)
            if t[i] < 15:
                t[i] += 1
        self.sample += 1
        if self.sample >= self.limit:
            for t in self.tables:
                for i in range(len(t)):
                    t[i] >>= 1
            self.sample //= 2

    def estimate(self, key):
        return min(t[self._idx(key, a, b)] for t, (a, b) in zip(self.tables, self.seeds))


class WTinyLFU(Policy):
    """W-TinyLFU: a small LRU window, a segmented-LRU main, count-min sketch admission with halving."""
    name = "wtinylfu"

    def __init__(self, capacity, window_frac=0.01, protected_frac=0.8, width_factor=4, halving_factor=10, **params):
        super().__init__(capacity, window_frac=window_frac, protected_frac=protected_frac,
                         width_factor=width_factor, halving_factor=halving_factor, **params)
        self.win_cap = max(1, int(capacity * window_frac))
        self.main_cap = capacity - self.win_cap
        self.prot_cap = max(1, int(self.main_cap * protected_frac))
        self.window, self.prob, self.prot = OrderedDict(), OrderedDict(), OrderedDict()
        self.sketch = CountMinSketch(capacity, width_factor=width_factor, halving_factor=halving_factor)

    def insert_seed(self, key, bit, count):
        for _ in range(max(1, min(count, 15))):
            self.sketch.increment(key)
        if bit and len(self.prot) < self.prot_cap:
            self.prot[key] = None
        elif len(self.prob) + len(self.prot) < self.main_cap:
            self.prob[key] = None
        else:
            self.window[key] = None

    def _main_victim(self, pinned):
        for od in (self.prob, self.prot):
            for v in od:
                if v not in pinned:
                    return od, v
        return None, None

    def _admit_from_window(self, pinned):
        """Move the window's oldest unpinned key into main, evicting by frequency comparison."""
        window = self.window
        candidate = None
        for k in window:
            if k not in pinned:
                candidate = k
                break
        if candidate is None:
            return False
        window.pop(candidate)
        if len(self.prob) + len(self.prot) < self.main_cap:
            self.prob[candidate] = None
            return True
        od, victim = self._main_victim(pinned)
        if victim is None:
            return True  # candidate dropped; main is entirely pinned
        if self.sketch.estimate(candidate) > self.sketch.estimate(victim):
            od.pop(victim)
            self.prob[candidate] = None
        return True

    def batch(self, keys):
        window, prob, prot = self.window, self.prob, self.prot
        pinned = set(keys.tolist())
        misses = 0
        for k in keys.tolist():
            self.sketch.increment(k)
            if k in window:
                window.move_to_end(k)
                continue
            if k in prot:
                prot.move_to_end(k)
                continue
            if k in prob:
                prob.pop(k)
                prot[k] = None
                while len(prot) > self.prot_cap:
                    d, _ = prot.popitem(last=False)
                    prob[d] = None
                continue
            misses += 1
            window[k] = None
            guard = 0
            while len(window) + len(prob) + len(prot) > self.capacity:
                guard += 1
                if guard > 4 * self.capacity:
                    raise RuntimeError("wtinylfu: cannot make room")
                if len(window) > self.win_cap and self._admit_from_window(pinned):
                    continue
                od, victim = self._main_victim(pinned)
                if victim is None:
                    raise RuntimeError("wtinylfu: everything pinned")
                od.pop(victim)
        return misses


class ARC(Policy):
    """Adaptive Replacement Cache with the standard p adaptation and ghost lists B1/B2."""
    name = "arc"

    def __init__(self, capacity, **params):
        super().__init__(capacity, **params)
        self.t1, self.t2, self.b1, self.b2 = OrderedDict(), OrderedDict(), OrderedDict(), OrderedDict()
        self.p = 0.0

    def insert_seed(self, key, bit, count):
        (self.t2 if bit else self.t1)[key] = None

    def _replace(self, key, pinned):
        t1, t2 = self.t1, self.t2
        def first_unpinned(od):
            for v in od:
                if v not in pinned:
                    return v
            return None
        prefer_t1 = len(t1) > 0 and (len(t1) > self.p or (key in self.b2 and len(t1) == int(self.p)))
        order = (t1, t2) if prefer_t1 else (t2, t1)
        for od in order:
            v = first_unpinned(od)
            if v is not None:
                od.pop(v)
                ghost = self.b1 if od is t1 else self.b2
                ghost[v] = None
                if len(ghost) > self.capacity:
                    ghost.popitem(last=False)
                return
        raise RuntimeError("arc: everything pinned")

    def batch(self, keys):
        t1, t2, b1, b2, c = self.t1, self.t2, self.b1, self.b2, self.capacity
        pinned = set(keys.tolist())
        misses = 0
        for k in keys.tolist():
            if k in t1:
                t1.pop(k); t2[k] = None
                continue
            if k in t2:
                t2.move_to_end(k)
                continue
            misses += 1
            if k in b1:
                self.p = min(c, self.p + max(1.0, len(b2) / max(1, len(b1))))
                if len(t1) + len(t2) >= c:
                    self._replace(k, pinned)
                b1.pop(k); t2[k] = None
                continue
            if k in b2:
                self.p = max(0.0, self.p - max(1.0, len(b1) / max(1, len(b2))))
                if len(t1) + len(t2) >= c:
                    self._replace(k, pinned)
                b2.pop(k); t2[k] = None
                continue
            l1 = len(t1) + len(b1)
            if l1 >= c:
                if len(t1) < c:
                    if b1:
                        b1.popitem(last=False)
                    if len(t1) + len(t2) >= c:
                        self._replace(k, pinned)
                else:
                    # T1 alone fills the cache: evict its LRU unpinned key without a ghost entry
                    v = next((x for x in t1 if x not in pinned), None)
                    if v is None:
                        raise RuntimeError("arc: everything pinned")
                    t1.pop(v)
            else:
                if l1 + len(t2) + len(b2) >= c:
                    if l1 + len(t2) + len(b2) >= 2 * c and b2:
                        b2.popitem(last=False)
                    if len(t1) + len(t2) >= c:
                        self._replace(k, pinned)
            while len(t1) + len(t2) >= c:
                self._replace(k, pinned)
            t1[k] = None
        return misses


class ClockPro(Policy):
    """CLOCK-Pro (Jiang, Chen, Zhang 2005): hot and cold resident pages, cold pages in a test period,
    non-resident cold pages as ghosts, three hands and an adaptive cold allocation."""
    name = "clockpro"

    def __init__(self, capacity, cold_frac=0.1, **params):
        super().__init__(capacity, cold_frac=cold_frac, **params)
        self.ring = OrderedDict()   # key -> [hot, ref, test, resident]; insertion order is the clock order
        self.mc = max(1, int(capacity * cold_frac))
        self.mc_floor = max(1, capacity // 100)
        self.mc_ceiling = max(self.mc_floor, int(capacity * 0.9))
        self.resident = 0
        self.hot = 0
        self.nonresident = 0

    def insert_seed(self, key, bit, count):
        self.ring[key] = [bool(bit), False, not bit, True]
        self.resident += 1
        if bit:
            self.hot += 1

    def _run_hand_hot(self, pinned):
        """Demote one hot page (or clear its reference) and drop cold pages' test bits it passes."""
        ring = self.ring
        scans = 0
        while self.hot > 0 and scans < 2 * len(ring) + 2:
            scans += 1
            k, st = next(iter(ring.items()))
            ring.move_to_end(k)
            hot, ref, test, res = st
            if hot:
                if ref:
                    st[1] = False
                    continue
                if k in pinned:
                    continue
                st[0] = False; st[2] = True
                self.hot -= 1
                return
            else:
                if not res:
                    # A ghost leaving without re-access ends its test period: shrink the cold allocation.
                    del ring[k]
                    self.nonresident -= 1
                    self.mc = max(self.mc_floor, self.mc - 1)
                elif test:
                    st[2] = False

    def _run_hand_cold(self, pinned):
        """Evict one resident cold page. Referenced cold pages in test become hot."""
        ring = self.ring
        scans = 0
        while scans < 3 * len(ring) + 3:
            scans += 1
            if self.resident - self.hot <= len(pinned) or self.hot > self.capacity - self.mc:
                # Too few cold pages beyond the pinned batch, or too many hot pages: demote first.
                self._run_hand_hot(pinned)
            k, st = next(iter(ring.items()))
            hot, ref, test, res = st
            if hot or not res:
                ring.move_to_end(k)
                continue
            if ref:
                st[1] = False
                ring.move_to_end(k)
                if test:
                    # A cold page referenced during its test period becomes hot.
                    st[0] = True; st[2] = False
                    self.hot += 1
                    if self.hot > self.capacity - self.mc:
                        self._run_hand_hot(pinned)
                else:
                    st[2] = True
                continue
            if k in pinned:
                ring.move_to_end(k)
                continue
            if test:
                st[3] = False
                self.resident -= 1
                self.nonresident += 1
                ring.move_to_end(k)
                if self.nonresident > self.capacity:
                    for g, gst in list(ring.items()):
                        if not gst[3]:
                            del ring[g]; self.nonresident -= 1
                            self.mc = max(self.mc_floor, self.mc - 1)
                            break
            else:
                del ring[k]
                self.resident -= 1
            return
        raise RuntimeError("clockpro: no evictable cold page")

    def batch(self, keys):
        ring = self.ring
        pinned = set(keys.tolist())
        misses = 0
        for k in keys.tolist():
            st = ring.get(k)
            if st is not None and st[3]:
                st[1] = True
                continue
            misses += 1
            while self.resident >= self.capacity:
                self._run_hand_cold(pinned)
            st = ring.get(k)   # the eviction pass may have dropped this ghost entry
            if st is not None:
                # non-resident cold page in its test period: promote and grow the cold allocation
                del ring[k]
                self.nonresident -= 1
                self.mc = min(self.mc_ceiling, self.mc + 1)
                ring[k] = [True, False, False, True]
                self.hot += 1
                self.resident += 1
                for _ in range(2):
                    if self.hot > self.capacity - self.mc:
                        self._run_hand_hot(pinned)
            else:
                ring[k] = [False, False, True, True]
                self.resident += 1
        return misses


class Clock(Policy):
    """CLOCK as SlotPool runs it, over slots: exact at the native capacity with the recorded hand."""
    name = "clock"

    def __init__(self, capacity, **params):
        super().__init__(capacity, **params)
        self.keys = [-1] * capacity
        self.bits = [False] * capacity
        self.map = {}
        self.hand = 0
        self.fill = 0

    def seed_native(self, stream):
        n = min(self.capacity, len(stream["initial_keys"]))
        for s in range(n):
            k = stream["initial_keys"][s]
            self.keys[s] = k
            self.bits[s] = stream["initial_bits"][s]
            if k >= 0:
                self.map[k] = s
        self.hand = stream["hand"] % self.capacity
        self.fill = n

    def seed(self, ordered, bits, counts):
        raise RuntimeError("clock seeds from the native snapshot")

    def _victim(self, pins):
        scanned = 0
        while True:
            s = self.hand
            self.hand = (self.hand + 1) % self.capacity
            if s in pins:
                scanned += 1
                if scanned >= 3 * self.capacity:
                    raise RuntimeError("clock: pool exhausted")
                continue
            if self.bits[s]:
                self.bits[s] = False
                scanned += 1
                continue
            return s

    def batch(self, keys):
        pins, miss_keys = set(), []
        for k in keys.tolist():
            s = self.map.get(k)
            if s is not None:
                pins.add(s)
                self.bits[s] = True
            else:
                miss_keys.append(k)
        victims = []
        for k in miss_keys:
            s = self._victim(pins)
            pins.add(s)
            victims.append(s)
        for k, s in zip(miss_keys, victims):
            old = self.keys[s]
            if old >= 0:
                self.map.pop(old, None)
            self.keys[s] = k
            self.map[k] = s
            self.bits[s] = True
        return len(miss_keys)


def opt_per_event(capacity, initial, batches):
    """Belady's optimal replacement with batch pinning; per-event miss counts."""
    nxt = {}
    for i, b in enumerate(batches):
        for k in b:
            nxt.setdefault(k, []).append(i)
    ptr = {k: 0 for k in nxt}
    inf = 1 << 60

    def next_use(k, i):
        lst = nxt.get(k, [])
        p = ptr.get(k, 0)
        while p < len(lst) and lst[p] <= i:
            p += 1
        ptr[k] = p
        return lst[p] if p < len(lst) else inf

    resident = set(initial[:capacity])
    heap = [(-next_use(k, -1), k) for k in resident]
    heapq.heapify(heap)
    out = []
    for i, b in enumerate(batches):
        pinned = set(b)
        misses = 0
        for k in b:
            if k in resident:
                continue
            misses += 1
            deferred = []
            while len(resident) >= capacity:
                nu, v = heapq.heappop(heap)
                if v not in resident:
                    continue
                current = next_use(v, i - 1)
                if -nu != current:
                    heapq.heappush(heap, (-current, v))
                    continue
                if v in pinned:
                    deferred.append((nu, v))
                    continue
                resident.remove(v)
                break
            for item in deferred:
                heapq.heappush(heap, item)
            resident.add(k)
        for k in b:
            heapq.heappush(heap, (-next_use(k, i), k))
        out.append(misses)
    return out


POLICIES = {"lru": LRU, "slru": SLRU, "s3fifo": S3FIFO, "wtinylfu": WTinyLFU, "arc": ARC, "clockpro": ClockPro}


# ---------------------------------------------------------------- layer-aware variants

class LayerAware:
    """Victim preference on top of an OrderedDict-based policy: scan up to `depth` candidates in the
    base eviction order and take the first whose layer satisfies the preference; otherwise the base
    choice. Mode `missed`: prefer layers that already missed in the current pass (their fixed cost is
    already paid next pass with high probability); mode `quota`: avoid layers whose running miss rate
    is below `threshold` (protect layers that are currently cheap)."""

    def __init__(self, mode, depth=8, threshold=0.5, alpha=0.05):
        self.mode, self.depth, self.threshold, self.alpha = mode, depth, threshold, alpha
        self.rate = [1.0] * LAYERS
        self.missed = set()
        self.current_pass = -1

    def observe(self, pass_id, layer, misses):
        if pass_id != self.current_pass:
            self.current_pass = pass_id
            self.missed = set()
        if misses:
            self.missed.add(layer)
        self.rate[layer] = (1 - self.alpha) * self.rate[layer] + self.alpha * (1.0 if misses else 0.0)

    def ok(self, key):
        layer = key // EXPERTS
        if self.mode == "missed":
            return layer in self.missed
        return self.rate[layer] >= self.threshold

    def choose(self, od, pinned):
        first = None
        for i, v in enumerate(od):
            if v in pinned:
                continue
            if first is None:
                first = v
            if self.ok(v):
                return v
            if i >= self.depth:
                break
        return first


class SLRUAware(SLRU):
    name = "slru-aware"

    def __init__(self, capacity, aware=None, **params):
        super().__init__(capacity, **params)
        self.aware = aware

    def batch(self, keys):
        prob, prot, cap, prot_cap = self.prob, self.prot, self.capacity, self.prot_cap
        pinned = set(keys.tolist())
        misses = 0
        for k in keys.tolist():
            if k in prot:
                prot.move_to_end(k)
                continue
            if k in prob:
                prob.pop(k)
                prot[k] = None
                while len(prot) > prot_cap:
                    d, _ = prot.popitem(last=False)
                    prob[d] = None
                continue
            misses += 1
            while len(prob) + len(prot) >= cap:
                od = prob if prob else prot
                v = self.aware.choose(od, pinned)
                if v is None:
                    raise RuntimeError("slru-aware: everything pinned")
                od.pop(v)
            prob[k] = None
        return misses


class LRUAware(LRU):
    name = "lru-aware"

    def __init__(self, capacity, aware=None, **params):
        super().__init__(capacity, **params)
        self.aware = aware

    def batch(self, keys):
        od, cap = self.od, self.capacity
        pinned = set(keys.tolist())
        misses = 0
        for k in keys.tolist():
            if k in od:
                od.move_to_end(k)
                continue
            misses += 1
            while len(od) >= cap:
                v = self.aware.choose(od, pinned)
                if v is None:
                    raise RuntimeError("lru-aware: everything pinned")
                od.pop(v)
            od[k] = None
        return misses


# ---------------------------------------------------------------- scoring

def score(stream, per_event, cost):
    """Misses, read time under the cost model, zero-miss layer events and the per-layer miss profile."""
    m = np.asarray(per_event, np.int64)
    layers = stream["ev_layer"]
    per_layer = np.bincount(layers, weights=m, minlength=LAYERS)
    fixed, marginal = cost
    return dict(events=int(len(m)), refs=int(sum(len(k) for k in stream["ev_keys"])), misses=int(m.sum()),
                zero_miss_events=int((m == 0).sum()),
                read_ms=float(fixed * (m > 0).sum() + marginal * m.sum()),
                per_layer_misses=per_layer.astype(int).tolist())


STREAMS = {}


def run_task(task):
    """One (request, policy, params, capacity, seed) replay; returns the score."""
    rid, name, params, capacity, seed_mode, cost = task
    stream = STREAMS[rid]
    batches = [k.tolist() for k in stream["ev_keys"]]
    if name == "opt":
        initial = [k for k in stream["initial_keys"] if k >= 0]
        per_event = opt_per_event(capacity, initial, batches)
    elif name == "native":
        per_event = stream["ev_native_miss"].tolist()
    elif name == "clock":
        pol = Clock(capacity)
        pol.seed_native(stream)
        per_event = [pol.batch(k) for k in stream["ev_keys"]]
    else:
        aware = None
        p = dict(params)
        if name.endswith("-aware"):
            aware = LayerAware(p.pop("mode"), depth=p.pop("depth", 8), threshold=p.pop("threshold", 0.5))
            cls = {"slru-aware": SLRUAware, "lru-aware": LRUAware}[name]
            pol = cls(capacity, aware=aware, **p)
        else:
            pol = POLICIES[name](capacity, **p)
        ordered, bits, counts = seeding(stream, seed_mode)
        pol.seed(ordered, bits, counts)
        per_event = []
        for pid, layer, keys in zip(stream["ev_pass"].tolist(), stream["ev_layer"].tolist(), stream["ev_keys"]):
            m = pol.batch(keys)
            if aware is not None:
                aware.observe(pid, layer, m)
            per_event.append(m)
    return (rid, name, json.dumps(params, sort_keys=True), capacity, seed_mode), score(stream, per_event, cost)


def aggregate(rows, streams):
    """Sum per-request scores into one table row with the projected ratio from the decode seconds."""
    total = defaultdict(float)
    per_layer = np.zeros(LAYERS)
    decode = 0.0
    for rid, s in rows:
        for k in ("events", "refs", "misses", "zero_miss_events", "read_ms"):
            total[k] += s[k]
        per_layer += np.array(s["per_layer_misses"])
        decode += streams[rid]["decode_seconds"]
    out = dict(total)
    out["hit_rate"] = 1 - total["misses"] / total["refs"]
    out["read_seconds"] = total["read_ms"] / 1000
    out["decode_seconds"] = decode
    out["per_layer_misses"] = per_layer.astype(int).tolist()
    return out


def add_projection(row, native_row):
    """ratio = decode / (decode - saved), saved = native cost-model read time - policy read time."""
    saved = native_row["read_seconds"] - row["read_seconds"]
    row["misses_vs_native"] = row["misses"] / native_row["misses"]
    row["read_vs_native"] = row["read_seconds"] / native_row["read_seconds"]
    row["projected_ratio"] = row["decode_seconds"] / max(row["decode_seconds"] - saved, 1e-9)
    return row


# ---------------------------------------------------------------- lab driver

CONSTANT_GRIDS = {
    "lru": [{}],
    "slru": [{"protected_frac": f} for f in (0.5, 0.6, 0.7, 0.8, 0.9)],
    "s3fifo": [{"small_frac": s, "ghost_frac": g} for s in (0.05, 0.1, 0.2) for g in (0.5, 0.9)],
    "wtinylfu": [{"window_frac": w, "protected_frac": p} for w in (0.01, 0.05, 0.2) for p in (0.6, 0.8)],
    "arc": [{}],
    "clockpro": [{"cold_frac": c} for c in (0.05, 0.1, 0.2)],
}


def cmd_lab(args):
    run_dir = Path(args.run)
    manifest = xla.corpus_manifest()
    split_of = {r["id"]: r["split"] for r in manifest["requests"]}
    cost_report = xla.read_json(args.cost_model)
    cost = (float(cost_report["read_cost_model"]["intercept_ms"]), float(cost_report["read_cost_model"]["slope_ms_per_record"]))
    rows = [r for r in xla.load_requests_jsonl(run_dir) if r.get("complete")]
    for r in rows:
        r["split"] = split_of[r["id"]]
    if args.limit:
        rows = rows[:args.limit]
    t0 = time.time()
    for r in rows:
        s = load_stream(run_dir, r)
        if s is not None:
            STREAMS[r["id"]] = s
    train_ids = [r["id"] for r in rows if r["split"] == "train" and r["id"] in STREAMS]
    val_ids = [r["id"] for r in rows if r["split"] == "validation" and r["id"] in STREAMS]
    native_capacity = STREAMS[val_ids[0]]["capacity"]
    log(f"{len(STREAMS)} streams loaded in {time.time() - t0:.0f} s: train {len(train_ids)}, validation {len(val_ids)}, "
        f"native capacity {native_capacity}, cost model {cost[0]:.4f} + {cost[1]:.4f} ms/record")
    capacities = []
    for spec in args.capacities.split(","):
        capacities.append(int(round(native_capacity * float(spec[:-1]))) if spec.endswith("x") else int(spec))
    policies = args.policies.split(",")
    seeds = args.seeds.split(",")
    tasks = []
    # Validation and train, every policy, every constant, every capacity, both seedings.
    for cap in capacities:
        for rid in train_ids + val_ids:
            tasks.append((rid, "native", {}, cap, "native", cost)) if cap == native_capacity else None
            tasks.append((rid, "opt", {}, cap, "native", cost))
            tasks.append((rid, "clock", {}, cap, "native", cost))
            for name in policies:
                for params in CONSTANT_GRIDS[name]:
                    for seed_mode in seeds:
                        tasks.append((rid, name, params, cap, seed_mode, cost))
    tasks = [t for t in tasks if t is not None]
    log(f"{len(tasks)} replay tasks on {args.workers} workers")
    results = {}
    with mp.get_context("fork").Pool(args.workers) as pool:
        done = 0
        for key, s in pool.imap_unordered(run_task, tasks, chunksize=1):
            results[key] = s
            done += 1
            if done % 200 == 0:
                log(f"{done}/{len(tasks)} replays")
    log(f"replays finished in {time.time() - t0:.0f} s")

    def table(ids, cap, name, params, seed_mode):
        pk = json.dumps(params, sort_keys=True)
        rows_ = [(rid, results[(rid, name, pk, cap, seed_mode)]) for rid in ids]
        return aggregate(rows_, STREAMS)

    report = dict(schema="expert-lookahead-replacement-lab-v1", run=str(run_dir), corpus_sha256=manifest["_sha256"],
                  cost_model=dict(fixed_ms=cost[0], marginal_ms_per_record=cost[1], source=str(args.cost_model)),
                  train_requests=train_ids, validation_requests=val_ids, native_capacity=native_capacity,
                  capacities=capacities, seedings=seeds, constant_grids={p: CONSTANT_GRIDS[p] for p in policies},
                  by_capacity={})
    for cap in capacities:
        entry = {"train": {}, "validation": {}}
        native_val = table(val_ids, native_capacity, "native", {}, "native")
        native_train = table(train_ids, native_capacity, "native", {}, "native")
        for split, ids, native_row in (("validation", val_ids, native_val), ("train", train_ids, native_train)):
            block = entry[split]
            block["native"] = dict(native_row, misses_vs_native=1.0, read_vs_native=1.0, projected_ratio=1.0)
            block["measured_decode_io_seconds"] = sum(STREAMS[r]["decode_io_seconds"] for r in ids)
            block["opt"] = add_projection(table(ids, cap, "opt", {}, "native"), native_row)
            block["clock"] = add_projection(table(ids, cap, "clock", {}, "native"), native_row)
            for name in policies:
                for params in CONSTANT_GRIDS[name]:
                    for seed_mode in seeds:
                        label = f"{name}|{json.dumps(params, sort_keys=True)}|{seed_mode}"
                        block[label] = add_projection(table(ids, cap, name, params, seed_mode), native_row)
        # Constants fit on train (lowest cost-model read time), selected policy on validation.
        fit = {}
        for name in policies:
            for seed_mode in seeds:
                best = min(CONSTANT_GRIDS[name], key=lambda p: entry["train"][f"{name}|{json.dumps(p, sort_keys=True)}|{seed_mode}"]["read_seconds"])
                label = f"{name}|{json.dumps(best, sort_keys=True)}|{seed_mode}"
                v = entry["validation"][label]
                fit[f"{name}|{seed_mode}"] = dict(constants=best, validation_misses_vs_native=v["misses_vs_native"],
                                                  validation_read_vs_native=v["read_vs_native"], validation_hit_rate=v["hit_rate"],
                                                  validation_projected_ratio=v["projected_ratio"])
        entry["train_fit"] = fit
        best_label = min(fit, key=lambda k: fit[k]["validation_read_vs_native"])
        entry["best_implementable"] = dict(policy=best_label, **fit[best_label])
        report["by_capacity"][str(cap)] = entry
    # Train-prefix curve at the native capacity: constants chosen on nested train prefixes.
    curve = []
    for n in sorted(set([max(1, len(train_ids) // 4), max(1, len(train_ids) // 2), len(train_ids)])):
        prefix = train_ids[:n]
        row = dict(train_requests=n, policies={})
        for name in policies:
            for seed_mode in seeds:
                best = min(CONSTANT_GRIDS[name], key=lambda p: table(prefix, native_capacity, name, p, seed_mode)["read_seconds"])
                label = f"{name}|{json.dumps(best, sort_keys=True)}|{seed_mode}"
                row["policies"][f"{name}|{seed_mode}"] = dict(constants=best,
                    validation_read_vs_native=report["by_capacity"][str(native_capacity)]["validation"][label]["read_vs_native"])
        curve.append(row)
    report["train_prefix_curve"] = curve
    xla.write_json(Path(args.out), report)
    for cap in capacities:
        entry = report["by_capacity"][str(cap)]
        print(f"\n== capacity {cap} (validation, {len(val_ids)} requests) ==")
        v = entry["validation"]
        print(f"  native: misses {v['native']['misses']} hit {v['native']['hit_rate']:.4f} cost-model read {v['native']['read_seconds']:.1f} s "
              f"(measured decode IO {v['measured_decode_io_seconds']:.1f} s), decode {v['native']['decode_seconds']:.1f} s")
        for label in ["opt", "clock"] + [f"{n}|{s}" for n in policies for s in seeds]:
            if label in v:
                r = v[label]
            else:
                f = entry["train_fit"][label]
                r = v[f"{label.split('|')[0]}|{json.dumps(f['constants'], sort_keys=True)}|{label.split('|')[1]}"]
                label = f"{label} {f['constants']}"
            print(f"  {label:48s} misses x{r['misses_vs_native']:.4f} hit {r['hit_rate']:.4f} read x{r['read_vs_native']:.4f} "
                  f"zero-miss {r['zero_miss_events']} projected {r['projected_ratio']:.4f}")
        print(f"  best implementable: {entry['best_implementable']}")
    print(json.dumps(report["train_prefix_curve"], indent=1)[:3000])


def cmd_aware(args):
    """Layer-aware variants of one base policy at the native capacity, validation and train."""
    run_dir = Path(args.run)
    manifest = xla.corpus_manifest()
    split_of = {r["id"]: r["split"] for r in manifest["requests"]}
    cost_report = xla.read_json(args.cost_model)
    cost = (float(cost_report["read_cost_model"]["intercept_ms"]), float(cost_report["read_cost_model"]["slope_ms_per_record"]))
    rows = [r for r in xla.load_requests_jsonl(run_dir) if r.get("complete")]
    for r in rows:
        r["split"] = split_of[r["id"]]
    for r in rows:
        s = load_stream(run_dir, r)
        if s is not None:
            STREAMS[r["id"]] = s
    train_ids = [r["id"] for r in rows if r["split"] == "train" and r["id"] in STREAMS]
    val_ids = [r["id"] for r in rows if r["split"] == "validation" and r["id"] in STREAMS]
    cap = STREAMS[val_ids[0]]["capacity"]
    base_params = json.loads(args.base_params)
    variants = [("base", dict(base_params))]
    for depth in (4, 8, 16):
        variants.append((f"missed-d{depth}", dict(base_params, mode="missed", depth=depth)))
        for thr in (0.3, 0.5, 0.7):
            variants.append((f"quota-d{depth}-t{thr}", dict(base_params, mode="quota", depth=depth, threshold=thr)))
    tasks = []
    for rid in train_ids + val_ids:
        tasks.append((rid, "native", {}, cap, "native", cost))
        for label, params in variants:
            name = args.base if label == "base" else f"{args.base}-aware"
            tasks.append((rid, name, params, cap, args.seed, cost))
    results = {}
    with mp.get_context("fork").Pool(args.workers) as pool:
        for key, s in pool.imap_unordered(run_task, tasks, chunksize=1):
            results[key] = s
    report = dict(schema="expert-lookahead-replacement-aware-v1", run=str(run_dir), base=args.base, base_params=base_params,
                  seed=args.seed, capacity=cap, variants={})
    for split, ids in (("validation", val_ids), ("train", train_ids)):
        native = aggregate([(rid, results[(rid, "native", "{}", cap, "native")]) for rid in ids], STREAMS)
        for label, params in variants:
            name = args.base if label == "base" else f"{args.base}-aware"
            row = aggregate([(rid, results[(rid, name, json.dumps(params, sort_keys=True), cap, args.seed)]) for rid in ids], STREAMS)
            report["variants"].setdefault(label, {})[split] = add_projection(row, native)
    xla.write_json(Path(args.out), report)
    for label in report["variants"]:
        v, t = report["variants"][label]["validation"], report["variants"][label]["train"]
        print(f"  {label:20s} validation misses x{v['misses_vs_native']:.4f} read x{v['read_vs_native']:.4f} zero-miss {v['zero_miss_events']} "
              f"projected {v['projected_ratio']:.4f} | train read x{t['read_vs_native']:.4f}")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    p = sub.add_parser("lab")
    p.add_argument("--run", required=True); p.add_argument("--cost-model", required=True); p.add_argument("--out", required=True)
    p.add_argument("--policies", default="lru,slru,s3fifo,wtinylfu,arc,clockpro")
    p.add_argument("--capacities", default="1.0x,1.2x,5702")
    p.add_argument("--seeds", default="slot,touch")
    p.add_argument("--workers", type=int, default=8); p.add_argument("--limit", type=int, default=0)
    p.set_defaults(fn=cmd_lab)
    p = sub.add_parser("aware")
    p.add_argument("--run", required=True); p.add_argument("--cost-model", required=True); p.add_argument("--out", required=True)
    p.add_argument("--base", default="slru"); p.add_argument("--base-params", default='{"protected_frac": 0.8}')
    p.add_argument("--seed", default="touch"); p.add_argument("--workers", type=int, default=8)
    p.set_defaults(fn=cmd_aware)
    args = ap.parse_args()
    args.fn(args)


if __name__ == "__main__":
    main()
