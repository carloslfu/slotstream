#!/usr/bin/env python3
"""Bounded 72-wide vision attention padding experiment, pinned MLX 0.31.1.
Fixed-input evidence only; full-tower, task quality and request gates are separate.
"""
import hashlib
import importlib.metadata
import json
from pathlib import Path
import statistics
import time
import mlx.core as mx
import numpy as np
from prefill_bench import preflight, vm_snapshot


def attention(q, k, v, padded):
    original = q.shape[-1]
    if padded:
        widths = [(0, 0)] * (q.ndim - 1) + [(0, padded - original)]
        q, k, v = [mx.pad(x, widths) for x in [q, k, v]]
    out = mx.fast.scaled_dot_product_attention(q, k, v, scale=original ** -.5)
    return out[..., :original]


def main():
    version = importlib.metadata.version('mlx')
    if version != '0.31.1': raise ValueError('probe requires pinned MLX 0.31.1')
    record = {'classification': 'fixed-input numerical and exploratory component performance only',
              'mlx': version, 'source_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
              'before': preflight(7), 'checks': [], 'timings': [],
              'contract': 'CPU float64 softmax oracle. Float32 max error <=max(3*unpadded error,1e-5); BF16 <=max(3*unpadded error,0.01). Every output finite. Scale remains 1/sqrt(72). Five AB/BA rounds per shape, five completed calls per arm; any global swap excludes the whole round. No inference adoption.'}
    mx.set_cache_limit(128 << 20)
    rng = np.random.default_rng(17029)
    for n in [1, 8, 9, 64, 256]:
        for dtype in [mx.float32, mx.bfloat16]:
            for kind in ['random', 'zero-query', 'saturated']:
                raw = [rng.standard_normal((1, 2, n, 72)).astype(np.float32) for _ in range(3)]
                if kind == 'zero-query': raw[0].fill(0)
                if kind == 'saturated': raw[0] *= 32; raw[1] *= 32
                arrays = [mx.array(x).astype(dtype) for x in raw]; mx.eval(arrays)
                q, k, v = [np.array(x.astype(mx.float32)).astype(np.float64) for x in arrays]
                scores = (q @ k.swapaxes(-1, -2)) / np.sqrt(72)
                probs = np.exp(scores - scores.max(axis=-1, keepdims=True)); probs /= probs.sum(axis=-1, keepdims=True)
                oracle = probs @ v
                baseline = np.array(attention(*arrays, 0).astype(mx.float32))
                error = float(np.max(np.abs(baseline - oracle)))
                for padded in [80, 128]:
                    out = np.array(attention(*arrays, padded).astype(mx.float32))
                    changed = float(np.max(np.abs(out - oracle)))
                    limit = max(3 * error, 1e-5 if dtype == mx.float32 else .01)
                    record['checks'].append({'n': n, 'dtype': str(dtype), 'kind': kind, 'padding': padded,
                        'reference_max_error': error, 'candidate_max_error': changed, 'limit': limit,
                        'passed': bool(np.isfinite(out).all() and changed <= limit)})
    for n in [256, 1024, 2048]:
        arrays = [mx.array(rng.standard_normal((1, 16, n, 72)).astype(np.float32)).astype(mx.bfloat16) for _ in range(3)]
        mx.eval(arrays)
        for p in [0, 80, 128]:
            for _ in range(2): mx.eval(attention(*arrays, p))
        rounds = []
        for r in range(5):
            cells = []
            for p in ([0, 80, 128] if r % 2 == 0 else [128, 80, 0]):
                before = vm_snapshot(); mx.reset_peak_memory(); start = time.monotonic()
                for _ in range(5): mx.eval(attention(*arrays, p))
                elapsed = (time.monotonic() - start) / 5
                after = vm_snapshot()
                cells.append({'padding': p, 'seconds': elapsed,
                              'mlx_peak_bytes': max(mx.get_peak_memory(), mx.get_active_memory()),
                              'swap_delta': {k: after[k] - before[k] for k in ['swapins', 'swapouts']}})
            rounds.append({'round': r + 1, 'cells': cells,
                'valid': all(not any(c['swap_delta'].values()) for c in cells)})
        record['timings'].append({'n': n, 'heads': 16, 'rounds': rounds})
    record['passed'] = all(c['passed'] for c in record['checks'])
    record['after'] = vm_snapshot()
    print(json.dumps(record, indent=2))
    return 0 if record['passed'] else 1


if __name__ == '__main__': raise SystemExit(main())
