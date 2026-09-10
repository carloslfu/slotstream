#!/usr/bin/env python3
"""Replay bounded real decode demands; model bytes and pinning, not latency.

This deliberately does not use the old simulator's hindsight-hot-set score:
only already observed demands may influence retention. Every layer's entire
request is pinned before selecting victims, as in SlotPool.ensureChecked.
"""
import argparse
import hashlib
import json
from pathlib import Path
import numpy as np

TRACE_SHA256 = 'edefd72fd26408012d6a52256c2358e38140cd9e0b84a0f66af0a67f993e5b7f'
RECORD_BYTES = 2_764_800


class Cache:
    def __init__(self, capacity, frequency, layer_local=False):
        self.capacity = capacity
        self.frequency = frequency
        self.layer_local = layer_local
        self.mapping = {}
        self.keys = [None] * capacity
        self.reference = [False] * capacity
        self.hand = 0
        self.counts = [0] * (48 * 512)
        self.layer_steps = [0] * 48

    def victim(self, pins, layer):
        if self.layer_local:
            local = None
            for distance in range(self.capacity):
                slot = (self.hand + distance) % self.capacity
                if slot in pins:
                    continue
                key = self.keys[slot]
                if key is None:
                    self.hand = (slot + 1) % self.capacity
                    return slot
                if local is None and key // 512 == layer:
                    local = slot
            if local is not None:
                self.hand = (local + 1) % self.capacity
                return local
        if self.frequency:
            best = None
            best_score = 256
            eligible = 0
            # A bounded sample controls host work independently from arena
            # capacity. The circular hand makes ties deterministic.
            for _ in range(self.capacity):
                slot = self.hand
                self.hand = (slot + 1) % self.capacity
                if slot in pins:
                    continue
                key = self.keys[slot]
                if key is None:
                    return slot
                score = self.counts[key]
                if score < best_score:
                    best, best_score = slot, score
                eligible += 1
                if eligible == 64:
                    break
            if best is None:
                raise ValueError('all slots pinned')
            return best
        for _ in range(3 * self.capacity):
            slot = self.hand
            self.hand = (slot + 1) % self.capacity
            if slot in pins:
                continue
            if self.reference[slot]:
                self.reference[slot] = False
                continue
            return slot
        raise ValueError('all slots pinned')

    def request(self, layer, experts):
        if not 0 <= layer < 48 or any(not 0 <= e < 512 for e in experts):
            raise ValueError('invalid expert key')
        keys = list(dict.fromkeys(layer * 512 + e for e in experts))
        if len(keys) > self.capacity:
            raise ValueError('request exceeds pin capacity')
        if self.frequency:
            self.layer_steps[layer] += 1
            if self.layer_steps[layer] == 32:
                self.layer_steps[layer] = 0
                for key in range(layer * 512, (layer + 1) * 512):
                    self.counts[key] >>= 1
            for key in keys:
                self.counts[key] = min(255, self.counts[key] + 1)
        pins = {self.mapping[key] for key in keys if key in self.mapping}
        for slot in pins:
            self.reference[slot] = True
        misses = 0
        for key in keys:
            if key in self.mapping:
                continue
            slot = self.victim(pins, layer)
            previous = self.keys[slot]
            if previous is not None:
                del self.mapping[previous]
            self.mapping[key] = slot
            self.keys[slot] = key
            self.reference[slot] = True
            pins.add(slot)
            misses += 1
        assert len({self.mapping[key] for key in keys}) == len(keys)
        return misses


def replay(trace, capacity, frequency, layer_local=False):
    cache = Cache(capacity, frequency, layer_local)
    records = []
    for token in trace:
        records.append([cache.request(layer, [int(e) for e in experts])
                        for layer, experts in enumerate(token)])
    return {'records': sum(map(sum, records)), 'by_token_layer': records,
            'distinct_retained': len(cache.mapping)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--trace', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--policy', choices=['frequency', 'layer-local'], default='frequency')
    a = parser.parse_args()
    raw = a.trace.read_bytes()
    if hashlib.sha256(raw).hexdigest() != TRACE_SHA256:
        raise ValueError('trace does not match the declared development corpus')
    with np.load(a.trace, allow_pickle=False) as data:
        trace = data['decode']
    if trace.shape != (220, 48, 10) or trace.dtype != np.int16 or trace.min() < 0 or trace.max() >= 512:
        raise ValueError('trace geometry or expert IDs differ')
    a.out.mkdir(exist_ok=False, parents=True)
    manifest = {'classification': 'offline decode record-count hypothesis; no speed or resource claim',
                'trace': str(a.trace.resolve()), 'trace_sha256': TRACE_SHA256,
                'script_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
                'policy': a.policy,
                'proposal': ({'sampled_unpinned_slots': 64, 'decay_every_layer_requests': 32,
                              'counter_limit': 255, 'future_demands_used': False} if a.policy == 'frequency'
                             else {'replacement': 'prefer empty, then unpinned current-layer records in circular order; otherwise ordinary CLOCK',
                                   'future_demands_used': False, 'added_counters': 0}),
                'geometry': list(trace.shape), 'record_bytes': RECORD_BYTES,
                'segments': {'development': [0, 120], 'continuation': [120, 220]},
                'limits': 'One existing mixed trace; adjacent segments are correlated, not independent model-quality evidence. Both segments start with empty caches. Prefill admission and actual I/O parallelism are not simulated.',
                'screening': 'At least five percent fewer records in all six segment/capacity cells before implementing the cache prototype.'}
    (a.out/'manifest.json').write_text(json.dumps(manifest, indent=2)+'\n')
    (a.out/'probe.py').write_bytes(Path(__file__).read_bytes())
    results = []
    for segment, (start, end) in manifest['segments'].items():
        for capacity in [640, 961, 1217]:
            reference = replay(trace[start:end], capacity, False)
            candidate = replay(trace[start:end], capacity, a.policy == 'frequency', a.policy == 'layer-local')
            reduction = 1 - candidate['records'] / reference['records']
            row = {'segment': segment, 'slots': capacity, 'reference': reference,
                   'candidate': candidate, 'record_reduction': reduction, 'passed': reduction >= .05}
            results.append(row)
            (a.out/f'{segment}-{capacity}.json').write_text(json.dumps(row, indent=2)+'\n')
            print({k: v for k, v in row.items() if k not in ['reference', 'candidate']}, flush=True)
    passed = all(row['passed'] for row in results)
    (a.out/'completion.json').write_text(json.dumps({'passed': passed, 'cells': len(results)})+'\n')
    return 0 if passed else 1


if __name__ == '__main__':
    raise SystemExit(main())
