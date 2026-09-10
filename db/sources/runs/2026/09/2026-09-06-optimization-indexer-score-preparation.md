---
type: run
id: 01m1w20hjz8fvsexntevymj2as
created: 2026-09-06T19:09:36.222716+00:00
updated: 2026-09-06T19:10:06.571752+00:00
summary: Optimization indexer score prototype and guarded contract — V177
binary: Not run; standalone prototype preparation only
captured_at: 2026-09-06
command: python3 -m unittest discover -s Tools -p indexer_score_probe_test.py -v
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Optimization indexer score prototype and guarded contract — V177
tool: Python source review and pure protocol tests
---
V177 prepares the previously unimplemented OPT10/N6 U2 four-head positive-part score component. It is a standalone pinned-MLX/Metal prototype, not a production dispatch change. Four SIMD groups independently form the four length-128 FP32 dot products. The positive part is taken for each head before summing and dividing by the same Float32 square root. Taking the positive part after adding heads is not equivalent; the opposed-head fixture exposes this. Eliminating four score planes may lose GEMM data reuse, so no speedup is presumed.

Finite outputs from both paths are checked against Float64 under an explicit conservative dot-product bound. Exceptional inputs require matching NaN/infinity patterns and finite-oracle checks for the remaining outputs. Original visibility, whole-domain top-512 partition and sentinels are retained; the selected block mask must be exact, including 511/512/513 block boundaries and tied keys. Every actual timing input also receives numerical and selection checks and a byte hash; the 8192-block timing shape cannot inherit correctness from a smaller fixture. Input values are BF16-rounded then promoted to FP32 as in the source. The Metal builtins were checked against the pinned local backend implementation.

The prospective component contract has three timing shapes, five fixed alternating pairs and sixteen evaluated calls per cell, two warmups per arm, at least five clean pairs, at least five percent paired median reduction and eighty percent positive pairs, with no replacements. The fifteen-minute whole-process deadline includes the initial 180-second quiet period. Shared reservation, seven-GB reclaimable preflight, nominal thermal/normal power, unchanged VM intervals, one-GB MLX peak and two-GB lifetime RSS bounds apply. Lifetime RSS is explicitly not sampled physical footprint and this component makes no whole-model capacity claim. Foundation BOOL uses its own Boolean return ABI. Pinned MLX is not imported until the guarded launch.

Five pure protocol/statistical tests pass; Python compilation passes. No Metal compilation, kernel execution, model, serving comparison or timing has run. The transport task has retained the machine through completion of its fresh HF installation; the requested component window was not granted. This is preparation only, and the candidate is unqualified.

Separately, the context task reports its V176-based build16 passed T0 33/22249, CLI102, planner64, ten C07 families of 1605 checks and HTTP835, then prefix-retention-mtp aborted with Swift simultaneous exclusive access. Those are reported separate-snapshot results, not a qualification of the shared V176 executable. Its developer is preparing a minimal correction. Shared v3 MTP qualification is held. Final whole-engine native/performance/soak/default gates remain open.

Artifact `/Users/carlos/Projects/slotstream/Tools/indexer_score_probe.py` — 18145 bytes, SHA-256 `b7ab911da7223a5c26d15a73365d9481bd18d86a871e60d928be5b70c24af77d`.

````text
#!/usr/bin/env python3
"""Bounded four-head indexer score prototype; never production dispatch.

The original FP32 GEMM is compared with one SIMD group per head and one
threadgroup per query/block pair. Positive parts are taken before summing
heads. This removes the four score planes but changes dot-product grouping;
numerical, selection, trained-state and serving gates remain distinct.
MLX is imported only after taking the shared reservation and checking memory.
"""
import argparse
import fcntl
import hashlib
import importlib.metadata
import json
import math
import os
from pathlib import Path
import resource
import shutil
import signal
import statistics
import sys
import tarfile
import time

from prefill_bench import digest, preflight, vm_snapshot
from serve_bench import competing_jobs, verified_build, wait_for_quiet_workspace


KERNEL = r'''
const uint lane = thread_index_in_simdgroup;
const uint head = simdgroup_index_in_threadgroup;
const uint pair = threadgroup_position_in_grid.x;
const uint row = pair / Blocks, block = pair % Blocks;
threadgroup float positive[4];
float dot = 0.0f;
for (uint d = lane; d < 128; d += 32) {
    dot = fma(query[(row * 4 + head) * 128 + d],
              key[block * 128 + d], dot);
}
dot = simd_sum(dot);
if (lane == 0) positive[head] = metal::max(dot, 0.0f);
threadgroup_barrier(mem_flags::mem_threadgroup);
if (head == 0 && lane == 0) {
    float total = positive[0];
    total = total + positive[1];
    total = total + positive[2];
    total = total + positive[3];
    output[pair] = total / denominator[0];
}
'''


def contract():
    return {
        'classification': 'Synthetic FP32 score component; no model, capacity or serving claim',
        'heads': 4, 'head_dim': 128, 'compression_ratio': 4, 'block_top_k': 512,
        'seed': 20260906177, 'mlx': '0.31.1',
        'correctness_shapes': [[q, n] for q in [1, 8, 64, 256] for n in [511, 512, 513, 2048]],
        'special_inputs': ['zero', 'opposed-heads', 'tied-keys', 'cancellation', 'nan', 'infinity'],
        'timing_shapes': [[1, 2048], [256, 2048], [256, 8192]],
        'rounds': 5, 'calls_per_cell': 16, 'warmups_per_arm': 2,
        'reverse_even_round_order': True, 'replacement_rounds': 0,
        'minimum_clean_pairs': 5, 'minimum_median_reduction': .05,
        'minimum_positive_fraction': .8, 'required_exact_visible_keep_masks': True,
        'timing_inputs_require_own_numerical_and_selection_checks': True,
        'numerical_bound': 'Each finite score versus FP64: 2*gamma(132)*sum(abs(q*k))/sqrt(128) + 8*FP32.tiny; gamma(n)=n*epsilon/(1-n*epsilon)',
        'maximum_lifetime_rss_bytes': 2_000_000_000,
        'maximum_mlx_peak_bytes': 1_000_000_000,
        'require_nominal_thermal_state_and_normal_power': True,
        'required_reclaimable_gb': 7,
        'abort_on_resource_change': True,
        'initial_quiet_seconds': 180,
        'maximum_run_seconds': 900,
        'later_gates': 'A component win only earns trained-model state/route and fixed-total-memory serving qualification; no default change here.',
    }


def operating_conditions():
    """Read the same Foundation observations as native ProcessMemory."""
    import ctypes
    ctypes.CDLL('/System/Library/Frameworks/Foundation.framework/Foundation')
    objc = ctypes.CDLL('/usr/lib/libobjc.A.dylib')
    objc.objc_getClass.argtypes = [ctypes.c_char_p]
    objc.objc_getClass.restype = ctypes.c_void_p
    objc.sel_registerName.argtypes = [ctypes.c_char_p]
    objc.sel_registerName.restype = ctypes.c_void_p
    pointer = ctypes.CFUNCTYPE(ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p)(('objc_msgSend', objc))
    integer = ctypes.CFUNCTYPE(ctypes.c_long, ctypes.c_void_p, ctypes.c_void_p)(('objc_msgSend', objc))
    boolean = ctypes.CFUNCTYPE(ctypes.c_bool, ctypes.c_void_p, ctypes.c_void_p)(('objc_msgSend', objc))
    info = pointer(objc.objc_getClass(b'NSProcessInfo'), objc.sel_registerName(b'processInfo'))
    if not info:
        raise RuntimeError('Foundation process observation unavailable')
    thermal = integer(info, objc.sel_registerName(b'thermalState'))
    low_power = boolean(info, objc.sel_registerName(b'isLowPowerModeEnabled'))
    if thermal not in [0, 1, 2, 3] or low_power not in [0, 1]:
        raise RuntimeError('unrecognized Foundation operating conditions')
    return {'thermal_state': thermal, 'low_power': bool(low_power), 'nominal': thermal == 0 and low_power == 0}


def paired_result(cells, spec):
    rounds = {}
    for cell in cells:
        key = (cell['round'], cell['arm'])
        if (type(key[0]) is not int or not 1 <= key[0] <= spec['rounds']
                or key[1] not in ['reference', 'fused'] or key in rounds):
            raise ValueError('duplicate, extra or foreign component cell')
        seconds = cell.get('seconds')
        if type(seconds) not in [int, float] or not math.isfinite(seconds) or seconds <= 0:
            raise ValueError('completed component time must be positive and finite')
        rounds[key] = cell
    reductions = []
    for number in range(1, spec['rounds'] + 1):
        a, b = rounds.get((number, 'reference')), rounds.get((number, 'fused'))
        if a is not None and b is not None and a.get('valid') is True and b.get('valid') is True:
            reductions.append(1 - b['seconds'] / a['seconds'])
    median = statistics.median(reductions) if reductions else None
    positive = sum(x > 0 for x in reductions) / len(reductions) if reductions else None
    complete = len(rounds) == 2 * spec['rounds']
    return {'complete': complete, 'clean_pairs': len(reductions), 'reductions': reductions,
            'median_reduction': median, 'positive_fraction': positive,
            'component_benefit_passed': complete and len(reductions) >= spec['minimum_clean_pairs']
            and median >= spec['minimum_median_reduction'] and positive >= spec['minimum_positive_fraction']}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--candidate', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    if sys.platform != 'darwin':
        raise ValueError('the RSS byte contract and Metal prototype require macOS')
    if any(k.startswith('SLOTSTREAM_') for k in os.environ):
        raise ValueError('component screen forbids inference environment overrides')
    if competing_jobs():
        raise RuntimeError('another build/storage job is running; component was not launched')
    build = verified_build(args.candidate / 'slotstream')
    spec = contract()
    if importlib.metadata.version('mlx') != spec['mlx']:
        raise ValueError('requires pinned MLX 0.31.1')
    source_name = 'Sources/Slotstream/Layers.swift'
    with tarfile.open(args.candidate / 'build-source.tar.gz') as archive:
        source = archive.extractfile(source_name).read()
    if digest_bytes(source) != build['identity']['source'][source_name]:
        raise ValueError('reference score source identity differs')
    if b'scores = maximum(scores, 0).sum(axis: -1) / sqrt(Float(headDim))' not in source:
        raise ValueError('review changed reference score arithmetic before making a successor')
    args.out.mkdir(parents=True, exist_ok=False)
    record = {'protocol': spec, 'reference_build': build, 'checks': [], 'timings': [],
              'completed': False, 'correctness_passed': False, 'inference_adopted': False,
              'probe_sha256': digest(Path(__file__))}
    shutil.copy2(__file__, args.out / Path(__file__).name)
    (args.out / 'Layers.swift').write_bytes(source)
    (args.out / 'kernel.metal').write_text(KERNEL)
    (args.out / 'protocol.json').write_text(json.dumps(record, indent=2) + '\n')
    def deadline_expired(_number, _frame):
        raise TimeoutError('fixed component deadline expired; no replacement')
    previous_alarm = signal.signal(signal.SIGALRM, deadline_expired)
    signal.alarm(spec['maximum_run_seconds'])
    try:
        # Preflight checks the lock before this process reserves it. The lock
        # remains held through MLX evaluation, so native models cannot overlap.
        record['before'] = preflight(spec['required_reclaimable_gb'])
        with open(f'/tmp/slotstream-model-{os.getuid()}.lock', 'a') as guard:
            fcntl.flock(guard, fcntl.LOCK_EX | fcntl.LOCK_NB)
            record['quiet'] = wait_for_quiet_workspace({'stable_seconds': spec['initial_quiet_seconds'],
                                                        'maximum_wait_seconds': 600})
            if competing_jobs():
                raise RuntimeError('workspace became busy during quiet period')
            if vm_snapshot()['reclaimable_bytes'] < spec['required_reclaimable_gb'] * 1e9:
                raise RuntimeError('headroom fell before MLX initialization')
            import mlx.core as mx
            import numpy as np
            mx.set_cache_limit(64 << 20)
            record['operating_conditions_before'] = operating_conditions()
            if not record['operating_conditions_before']['nominal']:
                raise RuntimeError('component requires nominal operating conditions')
            kernel = mx.fast.metal_kernel(name='slotstream_indexer_four_head_component',
                input_names=['query', 'key', 'denominator'], output_names=['output'], source=KERNEL)
            rng = np.random.default_rng(spec['seed'])
            denominator = mx.array([np.sqrt(np.float32(128))])

            def inputs(q, n, kind='random'):
                query = rng.standard_normal((1, q, 4, 128)).astype(np.float32)
                key = rng.standard_normal((1, n, 128)).astype(np.float32)
                if kind == 'zero': query.fill(0)
                if kind == 'opposed-heads':
                    query.fill(0); key.fill(0)
                    query[0, :, :, 0] = [1, -1, 2, -2]; key[0, :, 0] = 1
                if kind == 'tied-keys': key[:] = key[:, :1]
                if kind == 'cancellation':
                    query[:] = np.tile([8192, 1, -8192, -1], 32); key.fill(1)
                if kind in ['nan', 'infinity']:
                    query[0, 0, 0, 0] = np.nan if kind == 'nan' else np.inf
                # Production inputs are BF16 values promoted before einsum.
                arrays = [mx.array(x).astype(mx.bfloat16).astype(mx.float32) for x in [query, key]]
                mx.eval(*arrays)
                return arrays

            def score(query, key, arm):
                if arm == 'reference':
                    dots = mx.einsum('bshd,bnd->bsnh', query, key)
                    return mx.maximum(dots, 0).sum(axis=-1) / denominator[0]
                q, n = query.shape[1], key.shape[1]
                return kernel(inputs=[query, key, denominator], template=[('Blocks', n)],
                    grid=(q * n * 128, 1, 1), threadgroup=(128, 1, 1),
                    output_shapes=[[1, q, n]], output_dtypes=[mx.float32])[0]

            def keep(scores, q, n):
                # Keep the original whole-domain partition, visibility and
                # sentinel behavior. Incomplete own-block tails are unchanged
                # because this prototype replaces score production only.
                positions = mx.arange(q, dtype=mx.int32) + (4 * n - q - 2)
                visible = (mx.arange(n, dtype=mx.int32) * 4 + 3)[None, None, :] <= positions[None, :, None]
                ranked = mx.where(visible, scores, -float('inf'))
                count = min(512, n)
                top = mx.argpartition(-ranked, kth=count - 1, axis=-1)[..., :count].astype(mx.int32)
                top = mx.where(mx.take_along_axis(mx.broadcast_to(visible, scores.shape), top, axis=-1), top, n)
                indices = np.array(top)[0]
                mask = np.zeros((q, n), dtype=np.bool_)
                for row in range(q):
                    mask[row, indices[row][indices[row] < n]] = True
                return mask

            cases = [(q, n, 'random') for q, n in spec['correctness_shapes']]
            cases += [(8, 513, kind) for kind in spec['special_inputs']]
            def check_inputs(query, key, kind, stage):
                q, n = query.shape[1], key.shape[1]
                outputs = [score(query, key, arm) for arm in ['reference', 'fused']]
                mx.eval(*outputs)
                actual = [np.array(x) for x in outputs]
                exact_mask = bool(np.array_equal(keep(outputs[0], q, n), keep(outputs[1], q, n)))
                q64, k64 = [np.array(x).astype(np.float64) for x in [query, key]]
                # Exceptional rows still contain many finite outputs; verify
                # those against the oracle instead of only matching NaN/Inf.
                with np.errstate(invalid='ignore', over='ignore'):
                    truth = np.maximum(np.einsum('bshd,bnd->bsnh', q64, k64), 0).sum(axis=-1) / float(np.sqrt(np.float32(128)))
                    mass = np.einsum('bshd,bnd->bsn', np.abs(q64), np.abs(k64), optimize=True)
                    eps = np.finfo(np.float32).eps
                    bound = 2 * (132 * eps / (1 - 132 * eps)) * mass / float(np.sqrt(np.float32(128))) + 8 * np.finfo(np.float32).tiny
                finite = np.isfinite(truth)
                patterns_match = bool(np.array_equal(np.isnan(actual[0]), np.isnan(actual[1]))
                    and np.array_equal(np.isposinf(actual[0]), np.isposinf(actual[1]))
                    and np.array_equal(np.isneginf(actual[0]), np.isneginf(actual[1])))
                errors = [float(np.max(np.abs(x[finite] - truth[finite]), initial=0)) for x in actual]
                numerical = patterns_match and all(bool(np.isfinite(x[finite]).all()
                    and np.all(np.abs(x[finite] - truth[finite]) <= bound[finite])) for x in actual)
                if kind not in ['nan', 'infinity']:
                    numerical = numerical and bool(finite.all())
                details = {'reference_max_finite_error': errors[0], 'candidate_max_finite_error': errors[1],
                           'finite_oracle_scores': int(finite.sum()),
                           'exceptional_patterns_match': patterns_match,
                           'max_finite_bound': float(np.max(bound[finite], initial=0))}
                result = {'queries': q, 'blocks': n, 'input_kind': kind, 'stage': stage,
                    'exact_visible_keep_mask': exact_mask, 'numerical_passed': numerical,
                    'input_sha256': [digest_bytes(np.array(x).tobytes()) for x in [query, key]],
                    'passed': exact_mask and numerical, **details}
                record['checks'].append(result)
                return result

            for q, n, kind in cases:
                check_inputs(*inputs(q, n, kind), kind, 'correctness')
            record['correctness_passed'] = all(c['passed'] for c in record['checks'])
            if not record['correctness_passed']:
                record['stopped_reason'] = 'component numerical or selection counterexample; timing not run'
                raise RuntimeError(record['stopped_reason'])
            for q, n in spec['timing_shapes']:
                query, key = inputs(q, n)
                checked = check_inputs(query, key, 'random', 'timing-input')
                if not checked['passed']:
                    record['correctness_passed'] = False
                    raise RuntimeError('timing input failed numerical or selection check; timing not run')
                for arm in ['reference', 'fused']:
                    for _ in range(spec['warmups_per_arm']): mx.eval(score(query, key, arm))
                cells = []
                group = {'queries': q, 'blocks': n, 'input_sha256': checked['input_sha256'], 'cells': cells}
                record['timings'].append(group)
                for number in range(1, spec['rounds'] + 1):
                    for arm in (['reference', 'fused'] if number % 2 else ['fused', 'reference']):
                        power_before = operating_conditions()
                        before = vm_snapshot(); mx.reset_peak_memory(); start = time.monotonic()
                        for _ in range(spec['calls_per_cell']): mx.eval(score(query, key, arm))
                        elapsed = (time.monotonic() - start) / spec['calls_per_cell']
                        after = vm_snapshot()
                        power_after = operating_conditions()
                        peak = mx.get_peak_memory(); rss = resource.getrusage(resource.RUSAGE_SELF).ru_maxrss
                        clean = all(before[k] == after[k] for k in ['swapins', 'swapouts'])
                        valid = (clean and power_before['nominal'] and power_after['nominal']
                            and 0 < peak <= spec['maximum_mlx_peak_bytes'] and 0 < rss <= spec['maximum_lifetime_rss_bytes'])
                        cells.append({'round': number, 'arm': arm, 'seconds': elapsed, 'valid': valid,
                            'mlx_peak_bytes': peak, 'lifetime_rss_bytes': rss,
                            'power_before': power_before, 'power_after': power_after,
                            'swap_delta': {k: after[k] - before[k] for k in ['swapins', 'swapouts']}})
                        if not valid: raise RuntimeError('component resource interval invalid; no replacement')
                group['assessment'] = paired_result(cells, spec)
            record['completed'] = True
    except Exception as error:
        record['error'] = f'{type(error).__name__}: {error}'
    finally:
        signal.alarm(0)
        signal.signal(signal.SIGALRM, previous_alarm)
        record['after'] = vm_snapshot()
        record['sources_unchanged'] = record['probe_sha256'] == digest(Path(__file__))
        (args.out / 'result.json').write_text(json.dumps(record, indent=2) + '\n')
        print(json.dumps({k: record[k] for k in ['completed', 'correctness_passed', 'error', 'stopped_reason'] if k in record}), flush=True)
    return 0 if record['completed'] and record['correctness_passed'] and record['sources_unchanged'] else 1


def digest_bytes(data):
    return hashlib.sha256(data).hexdigest()


if __name__ == '__main__':
    raise SystemExit(main())

````

Artifact `/Users/carlos/Projects/slotstream/Tools/indexer_score_probe_test.py` — 2717 bytes, SHA-256 `1cf32f1db801a0813c634888e0a942f6c3dc9abe92fbc538ce7772eb7891df1d`.

````text
"""Pure protocol/statistical checks; does not import MLX or allocate a model."""
import math
import unittest

from indexer_score_probe import contract, paired_result


class IndexerScoreProbeTests(unittest.TestCase):
    def setUp(self):
        self.spec = contract()
        self.cells = [{'round': number, 'arm': arm, 'seconds': seconds, 'valid': True}
                      for number in range(1, 6)
                      for arm, seconds in [('reference', 1.0), ('fused', .9)]]

    def test_all_fixed_pairs_required_and_effect_is_paired(self):
        result = paired_result(self.cells, self.spec)
        self.assertTrue(result['component_benefit_passed'])
        self.assertAlmostEqual(result['median_reduction'], .1)
        self.assertFalse(paired_result(self.cells[:-1], self.spec)['component_benefit_passed'])

    def test_exclusion_cannot_be_replaced_or_ignored(self):
        self.cells[0]['valid'] = False
        result = paired_result(self.cells, self.spec)
        self.assertEqual(result['clean_pairs'], 4)
        self.assertFalse(result['component_benefit_passed'])
        for extra in [self.cells[1], {'round': 6, 'arm': 'fused', 'seconds': .9, 'valid': True}]:
            with self.assertRaises(ValueError): paired_result(self.cells + [extra], self.spec)

    def test_small_or_inconsistent_benefit_fails(self):
        for cell in self.cells:
            if cell['arm'] == 'fused': cell['seconds'] = .99
        self.assertFalse(paired_result(self.cells, self.spec)['component_benefit_passed'])
        for cell in self.cells:
            if cell['arm'] == 'fused': cell['seconds'] = .8 if cell['round'] <= 3 else 1.1
        self.assertFalse(paired_result(self.cells, self.spec)['component_benefit_passed'])

    def test_nonfinite_empty_and_negative_times_fail_closed(self):
        for value in [0, -1, True, float('nan'), float('inf'), None]:
            cells = [dict(c) for c in self.cells]; cells[0]['seconds'] = value
            with self.assertRaises(ValueError): paired_result(cells, self.spec)
        self.assertFalse(paired_result([], self.spec)['component_benefit_passed'])

    def test_positive_parts_precede_head_sum_and_geometry_is_bounded(self):
        terms = [1, -1, 2, -2]
        expected = sum(max(x, 0) for x in terms) / math.sqrt(128)
        self.assertGreater(expected, 0)
        self.assertEqual(max(sum(terms), 0), 0)
        for queries, blocks in self.spec['correctness_shapes'] + self.spec['timing_shapes']:
            self.assertLessEqual(queries * blocks * 128, 2**31 - 1)
            self.assertLessEqual(queries * blocks * 4 * 4, 34_000_000)
        self.assertEqual(self.spec['replacement_rounds'], 0)


if __name__ == '__main__': unittest.main()

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/indexer-score-preparation-v177/protocol.json` — 1920 bytes, SHA-256 `eb89d3ded7e19fe07c7e9ac2121e008a72a43c6fe593ba29e55d2579c152c604`.

````text
{
  "classification": "Synthetic FP32 score component; no model, capacity or serving claim",
  "heads": 4,
  "head_dim": 128,
  "compression_ratio": 4,
  "block_top_k": 512,
  "seed": 20260906177,
  "mlx": "0.31.1",
  "correctness_shapes": [
    [
      1,
      511
    ],
    [
      1,
      512
    ],
    [
      1,
      513
    ],
    [
      1,
      2048
    ],
    [
      8,
      511
    ],
    [
      8,
      512
    ],
    [
      8,
      513
    ],
    [
      8,
      2048
    ],
    [
      64,
      511
    ],
    [
      64,
      512
    ],
    [
      64,
      513
    ],
    [
      64,
      2048
    ],
    [
      256,
      511
    ],
    [
      256,
      512
    ],
    [
      256,
      513
    ],
    [
      256,
      2048
    ]
  ],
  "special_inputs": [
    "zero",
    "opposed-heads",
    "tied-keys",
    "cancellation",
    "nan",
    "infinity"
  ],
  "timing_shapes": [
    [
      1,
      2048
    ],
    [
      256,
      2048
    ],
    [
      256,
      8192
    ]
  ],
  "rounds": 5,
  "calls_per_cell": 16,
  "warmups_per_arm": 2,
  "reverse_even_round_order": true,
  "replacement_rounds": 0,
  "minimum_clean_pairs": 5,
  "minimum_median_reduction": 0.05,
  "minimum_positive_fraction": 0.8,
  "required_exact_visible_keep_masks": true,
  "timing_inputs_require_own_numerical_and_selection_checks": true,
  "numerical_bound": "Each finite score versus FP64: 2*gamma(132)*sum(abs(q*k))/sqrt(128) + 8*FP32.tiny; gamma(n)=n*epsilon/(1-n*epsilon)",
  "maximum_lifetime_rss_bytes": 2000000000,
  "maximum_mlx_peak_bytes": 1000000000,
  "require_nominal_thermal_state_and_normal_power": true,
  "required_reclaimable_gb": 7,
  "abort_on_resource_change": true,
  "initial_quiet_seconds": 180,
  "maximum_run_seconds": 900,
  "later_gates": "A component win only earns trained-model state/route and fixed-total-memory serving qualification; no default change here."
}

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/indexer-score-preparation-v177/tests.txt` — 633 bytes, SHA-256 `58e8075cec73fd9c5e9c63beaaf3217a2a8ee6f7ce6df06b3a69868b56557717`.

````text
test_all_fixed_pairs_required_and_effect_is_paired (indexer_score_probe_test.IndexerScoreProbeTests) ... ok
test_exclusion_cannot_be_replaced_or_ignored (indexer_score_probe_test.IndexerScoreProbeTests) ... ok
test_nonfinite_empty_and_negative_times_fail_closed (indexer_score_probe_test.IndexerScoreProbeTests) ... ok
test_positive_parts_precede_head_sum_and_geometry_is_bounded (indexer_score_probe_test.IndexerScoreProbeTests) ... ok
test_small_or_inconsistent_benefit_fails (indexer_score_probe_test.IndexerScoreProbeTests) ... ok

----------------------------------------------------------------------
Ran 5 tests in 0.000s

OK

````

