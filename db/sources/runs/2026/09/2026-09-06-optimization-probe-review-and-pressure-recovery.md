---
type: run
id: 01m1w48wf8g5sjd5wnj5qcf4sg
created: 2026-09-06T19:49:06.664477+00:00
updated: 2026-09-06T19:49:57.746576+00:00
summary: Optimization probe preflight review and typed pressure recovery — V181–182
binary: Shared source unbuilt; separate context build18 evidence only
captured_at: 2026-09-06
command: python3 -m unittest discover -s Tools -p optimization_soak_test.py -v
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Optimization probe preflight review and typed pressure recovery — V181–182
tool: Source review and integration with pure tests and separate native evidence
---
V181 reviews the two unrun components before native launch. The row-store component deliberately bypasses model.forward, where compactRows normally takes effect; it now explicitly selects both row and FIFO representations on the actual store, asserts their values and reports those observed values. The V180 prototype's missing direct compact-mode selection was found by source review, before any build or component run. Its existing payload/count assertion would have rejected that mislabeled arm. No runtime result is reinterpreted.

The indexer Float64 oracle now excludes negative-infinite dot-product heads from finite-output error mass: their positive part is exactly zero. Including their infinite input mass would make the remaining finite score's bound infinite and vacuous. Finite outputs must have finite bounds; nonfinite output patterns and exact selected masks are still checked against the reference. This tightens the previously unrun V177 protocol and does not alter a completed experiment. The updated standalone script still imports no MLX/NumPy at top level and has not compiled or run Metal. Five pure indexer tests pass; six final-prerequisite and eleven soak-harness tests also pass after the serving-harness counter extension. These twenty-two tests do not validate the new native diagnostics or GPU kernel.

V182 applies only the context task's bounded two-file governor recovery correction by a verified three-way merge, without conflicts. Engine reports memory-pressure cancellation and pressure-ticket latency even when the typed request guard runs before the older continuation callback. A queued/request-entry refusal gets the same observable classification. The diagnostic now explicitly checks that an infeasible plan refuses new work with zero expert reads, then chooses a recovery input through the pure governor policy bounded by actual reclaimable memory, keeps the pool at its floor, clears infeasibility and retries exact baseline IDs/text. The actual request-memory guard was already independent of Planner.availabilityOverride; no guard or physical reading was bypassed.

Supporting separate context build18 passes governor-boundary-mtp80 and HTTP835. Its earlier build17 invocation omitted the required responsive-governor control and exited before checks; that delivery failure is preserved. The two applied source files are Engine 9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316 and PressureBoundary diagnostic f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325. The receipt proves the existing MTP cancellation fix and new MTP/ngram/CLI work were preserved. No other context, C07, transport or version changes were applied.

Shared native source remains unbuilt after V176. Build18 is a separate snapshot, not a substitute for the final shared binary's checks. The transport task still holds native/model/performance access until installed-release acceptance, while its granted context-only correctness work continues. No build/model/GPU/performance run, memory-pressure stress, publication or default activation occurred here. All final qualification work remains open.

Artifact `/Users/carlos/Projects/slotstream/Tools/indexer_score_probe.py` — 18657 bytes, SHA-256 `78ae5880826a6743f725d4285846b9befed98bb3a3215b79cf79719a170501a5`.

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
        'numerical_bound': 'Each finite score versus FP64: 2*gamma(132)*sum(abs(q*k) over finite dot-product heads)/sqrt(128) + 8*FP32.tiny; gamma(n)=n*epsilon/(1-n*epsilon). Negative-infinite heads have exactly zero positive part; exceptional patterns must also match.',
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
                    dots64 = np.einsum('bshd,bnd->bsnh', q64, k64)
                    truth = np.maximum(dots64, 0).sum(axis=-1) / float(np.sqrt(np.float32(128)))
                    head_mass = np.einsum('bshd,bnd->bsnh', np.abs(q64), np.abs(k64), optimize=True)
                    # A -Inf head is killed exactly by its positive part. Its
                    # infinite input mass must not make the finite heads'
                    # error bound infinite and silently vacuous.
                    mass = np.where(np.isfinite(dots64), head_mass, 0).sum(axis=-1)
                    eps = np.finfo(np.float32).eps
                    bound = 2 * (132 * eps / (1 - 132 * eps)) * mass / float(np.sqrt(np.float32(128))) + 8 * np.finfo(np.float32).tiny
                finite = np.isfinite(truth)
                patterns_match = bool(np.array_equal(np.isnan(actual[0]), np.isnan(actual[1]))
                    and np.array_equal(np.isposinf(actual[0]), np.isposinf(actual[1]))
                    and np.array_equal(np.isneginf(actual[0]), np.isneginf(actual[1])))
                errors = [float(np.max(np.abs(x[finite] - truth[finite]), initial=0)) for x in actual]
                numerical = patterns_match and bool(np.isfinite(bound[finite]).all()) and all(bool(np.isfinite(x[finite]).all()
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

Artifact `/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift` — 8566 bytes, SHA-256 `04ba0fdae78172e42692455f85e3f21606bef533f4918e1642723f1059c82b50`.

````text
import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// One fresh-process arm of the full-cache component study. It executes
    /// the real PLE row hashing, reads, cache, and embedding assembly only;
    /// no language-model layer or expert matmul runs. Serving is a later gate.
    package static func optimizationNgramCache(modelDir: URL, compact: Bool, ring: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 64 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 10,
            embeddingRowCache: true)
        var options = InferenceOptimizations()
        options.compactNgramRows = compact; options.ngramRingOrder = ring
        model.optimizations = options
        let store = model.ngram
        // Compact row selection normally happens on model.forward. This
        // component deliberately does not execute a model layer.
        store.compactRows = compact; store.ringEvictionOrder = ring
        var c = CheckBuilder("optimization-ngram-cache-\(compact ? "compact" : "reference")\(ring ? "-ring" : "")")
        c.equal("actual row representation", store.compactRows, compact)
        c.equal("actual FIFO representation", store.ringEvictionOrder, ring)
        let fillTokens = 32_768, tile = 256, evictionTokens = 4_096, warmCalls = 128
        let ids: [Int64] = (0..<(fillTokens + evictionTokens)).map {
            $0 % 997 == 996 ? Int64(model.cfg.eosTokenId) : Int64(1000 + ($0 * 7919) % 200_000)
        }
        var hashes: [String: String] = [:]
        func hash(_ values: [UInt8]) -> String { SHA256.hash(data: Data(values)).map { String(format: "%02x", $0) }.joined() }
        hashes["input_ids"] = ids.withUnsafeBytes { hash(Array($0)) }
        func embed(_ begin: Int, _ count: Int) throws -> MLXArray {
            let history = Array(ids[max(0, begin - (model.cfg.ngramSize - 1))..<begin + count])
            return try store.embeddingChecked(history: history, nNew: count)
        }
        func checkResources(_ stage: String) throws {
            guard let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= 7_000_000_000,
                  ProcessMemory.residentBytes() > 0, ProcessMemory.residentBytes() <= 5_000_000_000 else {
                throw ModelError("ngram component headroom/footprint limit during \(stage)")
            }
        }
        try checkResources("entry")
        let vmBefore = ProcessMemory.vmActivity(), powerBefore = ProcessMemory.operatingConditions()
        let sampler = FootprintSampler()
        let physicalBefore = ProcessMemory.residentBytes()
        var fillHash = SHA256()
        var lastFillHash = ""
        let fillStart = RuntimeClock.now()
        for begin in stride(from: 0, to: fillTokens, by: tile) {
            try autoreleasepool {
                let value = try embed(begin, tile)
                // Hash every emitted BF16 value. This is parity evidence;
                // fill time explicitly includes hashing and is secondary.
                let bytes = value.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self)
                fillHash.update(data: Data(bytes))
                if begin + tile == fillTokens { lastFillHash = hash(bytes) }
            }
            try checkResources("fill")
        }
        let fillSeconds = RuntimeClock.seconds(since: fillStart)
        hashes["fill_embeddings"] = fillHash.finalize().map { String(format: "%02x", $0) }.joined()
        let filledRows = store.cachedRowCount, filledPayload = store.cachedPayloadBytes
        Stream.gpu.synchronize(); MLX.Memory.clearCache()
        let physicalFilled = ProcessMemory.residentBytes()
        c.expect("large cache reached eviction regime", filledRows >= 360_000 && filledRows <= 400_000)
        c.equal("payload follows actual retained rows", filledPayload, filledRows * 160 * (compact ? 2 : 4))
        for _ in 0..<2 { eval(try embed(fillTokens - tile, tile)) }
        store.resetStats()
        let lookupStart = RuntimeClock.now()
        for _ in 0..<warmCalls { eval(try embed(fillTokens - tile, tile)) }
        let lookupSeconds = RuntimeClock.seconds(since: lookupStart)
        c.equal("warm assembly reads no new rows", store.rowMisses, 0)
        c.equal("warm assembly preserves cache occupancy", store.cachedRowCount, filledRows)
        c.measure("warm_row_hits", Double(store.rowHits))
        let warmHash = hash(try embed(fillTokens - tile, tile).reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))
        c.equal("cache-hit output matches the original fill", warmHash, lastFillHash)
        hashes["warm_embedding"] = warmHash
        store.resetStats()
        var evictionHash = SHA256(), evictionSeconds = 0.0
        for begin in stride(from: fillTokens, to: fillTokens + evictionTokens, by: tile) {
            try autoreleasepool {
                let start = RuntimeClock.now()
                let value = try embed(begin, tile); eval(value)
                evictionSeconds += RuntimeClock.seconds(since: start)
                evictionHash.update(data: Data(value.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self)))
            }
            try checkResources("eviction")
        }
        hashes["eviction_embeddings"] = evictionHash.finalize().map { String(format: "%02x", $0) }.joined()
        let misses = store.rowMisses
        // At least one full 40,000-row FIFO batch must have been evicted;
        // a merely large cache would not exercise either queue implementation.
        c.expect("measured phase crosses a full eviction batch", misses > 40_000 && filledRows + misses > 400_000)
        c.expect("cache remains bounded after eviction", store.cachedRowCount <= 400_000)
        c.expect("all row workers joined", !store.hasPendingPrefetch)
        Stream.gpu.synchronize(); MLX.Memory.clearCache()
        let footprint = sampler.finish(), vmAfter = ProcessMemory.vmActivity()
        let powerAfter = ProcessMemory.operatingConditions()
        c.expect("complete component VM interval is observable", vmBefore != nil && vmAfter != nil)
        // These observations exclude a performance interval without turning
        // unchanged arithmetic into a failed correctness assertion.
        if let vmBefore, let vmAfter {
            c.measure("swapins_before", Double(vmBefore.swapins)); c.measure("swapins_after", Double(vmAfter.swapins))
            c.measure("swapouts_before", Double(vmBefore.swapouts)); c.measure("swapouts_after", Double(vmAfter.swapouts))
        }
        c.measure("nominal_thermal_endpoints", powerBefore.thermalState == "nominal" && powerAfter.thermalState == "nominal" ? 1 : 0)
        c.measure("normal_power_endpoints", !powerBefore.lowPowerModeEnabled && !powerAfter.lowPowerModeEnabled ? 1 : 0)
        c.expect("sampled footprint is bounded", footprint.samples > 1 && footprint.peakBytes <= 5_000_000_000)
        c.expect("lifetime RSS is separately bounded", ProcessMemory.lifetimeRSSPeakBytes() > 0 && ProcessMemory.lifetimeRSSPeakBytes() <= 5_000_000_000)
        c.measure("compact", store.compactRows ? 1 : 0); c.measure("ring", store.ringEvictionOrder ? 1 : 0)
        c.measure("fill_tokens", Double(fillTokens)); c.measure("tile_tokens", Double(tile))
        c.measure("eviction_tokens", Double(evictionTokens)); c.measure("warm_calls", Double(warmCalls))
        c.measure("filled_rows", Double(filledRows)); c.measure("filled_payload_bytes", Double(filledPayload))
        c.measure("end_rows", Double(store.cachedRowCount)); c.measure("end_payload_bytes", Double(store.cachedPayloadBytes))
        c.measure("fill_seconds_including_hash", fillSeconds)
        c.measure("warm_assembly_seconds_per_call", lookupSeconds / Double(warmCalls))
        c.measure("eviction_assembly_seconds", evictionSeconds); c.measure("eviction_row_misses", Double(misses))
        c.measure("physical_before_bytes", Double(physicalBefore)); c.measure("physical_filled_bytes", Double(physicalFilled))
        c.measure("physical_end_bytes", Double(ProcessMemory.residentBytes()))
        c.measure("sampled_peak_bytes", Double(footprint.peakBytes)); c.measure("sampled_count", Double(footprint.samples))
        c.measure("lifetime_rss_peak_bytes", Double(ProcessMemory.lifetimeRSSPeakBytes()))
        c.measure("mlx_active_bytes", Double(MLX.Memory.activeMemory))
        var report = c.report()
        for key in hashes.keys.sorted() {
            report.items.append(CheckItem(name: "sha256:\(key)", passed: true, detail: hashes[key]))
        }
        return report
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/probe-review-and-governor-v182/indexer-protocol-unrun-v181.json` — 2046 bytes, SHA-256 `c2d308ff19cbb842ace90af7cc5b51d36c44cb7aac4041b5064c231a654effa5`.

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
  "numerical_bound": "Each finite score versus FP64: 2*gamma(132)*sum(abs(q*k) over finite dot-product heads)/sqrt(128) + 8*FP32.tiny; gamma(n)=n*epsilon/(1-n*epsilon). Negative-infinite heads have exactly zero positive part; exceptional patterns must also match.",
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

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/probe-review-and-governor-v182/indexer_score_probe_test.py.txt` — 633 bytes, SHA-256 `58e8075cec73fd9c5e9c63beaaf3217a2a8ee6f7ce6df06b3a69868b56557717`.

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

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/probe-review-and-governor-v182/optimization_prerequisites_test.py.txt` — 796 bytes, SHA-256 `a1ddabd4abce7ce12c50240f77177c1c3591e385c87fb9963ea69aacdd5b26ee`.

````text
test_changed_receipt_digest_is_rejected (optimization_prerequisites_test.PrerequisiteTests) ... ok
test_claimed_pass_does_not_override_recomputed_failure (optimization_prerequisites_test.PrerequisiteTests) ... ok
test_complete_same_build_evidence_is_recomputed_and_accepted (optimization_prerequisites_test.PrerequisiteTests) ... ok
test_incomplete_duplicate_and_other_build_paired_runs_refused (optimization_prerequisites_test.PrerequisiteTests) ... ok
test_missing_and_duplicate_workload_evidence_refused (optimization_prerequisites_test.PrerequisiteTests) ... ok
test_native_wrong_source_failed_assertion_and_wrong_variant_are_rejected (optimization_prerequisites_test.PrerequisiteTests) ... ok

----------------------------------------------------------------------
Ran 6 tests in 0.046s

OK

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/probe-review-and-governor-v182/optimization_soak_test.py.txt` — 1242 bytes, SHA-256 `49f707f645b5353867c08c3a2e49af10fe61369cdc317c4b0b6ad4df5ecaf028`.

````text
test_absolute_peak_prefix_and_embedding_caps_are_independent (optimization_soak_test.SoakTests) ... ok
test_draft_or_relaxed_limits_refuse_before_execution (optimization_soak_test.SoakTests) ... ok
test_driver_preserves_failure_and_cancellation_and_reaps_server (optimization_soak_test.SoakTests) ... ok
test_driver_runs_exactly_sixty_requests_and_reaps_its_only_server (optimization_soak_test.SoakTests) ... ok
test_excluded_output_changes_are_still_correctness_failures (optimization_soak_test.SoakTests) ... ok
test_failure_before_metrics_and_missing_requests_fail_without_crashing (optimization_soak_test.SoakTests) ... ok
test_fixed_completed_sequence_and_bounded_growth_pass (optimization_soak_test.SoakTests) ... ok
test_late_growth_cannot_hide_behind_stable_other_positions (optimization_soak_test.SoakTests) ... ok
test_missing_prerequisites_fail_before_output_or_server_creation (optimization_soak_test.SoakTests) ... ok
test_swap_exclusions_need_enough_early_and_late_evidence (optimization_soak_test.SoakTests) ... ok
test_total_deadline_interrupts_a_blocking_operation_and_restores_alarm (optimization_soak_test.SoakTests) ... ok

----------------------------------------------------------------------
Ran 11 tests in 0.080s

OK

````

Artifact `/tmp/slotstream-optimization-execution/governor-recovery-v182/receipt.json` — 1151 bytes, SHA-256 `2e901b83b0429453d1fdb442842c09679145b3b36a3534a5a93fa061b81d7164`.

````text
{
  "applied": true,
  "files": [
    {
      "path": "Sources/Slotstream/Engine.swift",
      "ours_sha256": "3dfd6457fbec91fc636e1bdcd432af805c77304cd798e82c6f8b097f3738339c",
      "after_sha256": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift",
      "ours_sha256": "34e74989d1f4fd2fcc9fd8cb9b0f1fc75c0e4e1c214751f44245f2543270ab09",
      "after_sha256": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325"
    }
  ],
  "protected_unchanged": {
    "Sources/Slotstream/Generate.swift": "b53ec44b0d172126aeafed9b9a72a26201fd5f0908b07dc9054347ab50856b9b",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "a13dbbc695b58db42dbf8f8437def183b732e848c59f103912c662225ffcfb3f",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "53d6d2b6166d7921f87c93a1a43e7f63f4d4fb3843f1b3523b8425cfd14e3ceb",
    "Sources/slotstream-cli/OptimizationCommands.swift": "e1dcee57b5ec1f7957305bc32954807a356de50ec2b8c5785e024ec6dc69aad7"
  },
  "native_qualified": false,
  "build18_supporting_only": true
}

````

Artifact `/tmp/slotstream-context-implementation-20260906/governor-recovery-v1/manifest.json` — 705 bytes, SHA-256 `0da8a766dccf8fcf66c0a6a971379ceaad687df8b99d70e4d91cab7f811a5d37`.

````text
{
  "base": "isolated build17 including public e498; shared v3+MTP fix is not replaced",
  "files": [
    {
      "path": "Sources/Slotstream/Engine.swift",
      "before_sha256": "3dfd6457fbec91fc636e1bdcd432af805c77304cd798e82c6f8b097f3738339c",
      "after_sha256": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift",
      "before_sha256": "34e74989d1f4fd2fcc9fd8cb9b0f1fc75c0e4e1c214751f44245f2543270ab09",
      "after_sha256": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325"
    }
  ],
  "native_check": "build18 governor-boundary-mtp80 and context-serving835 pass"
}

````

Artifact `/tmp/slotstream-context-implementation-20260906/governor-recovery-v1/fix.patch` — 4998 bytes, SHA-256 `9f75de06798d029be621ec0d5dd1f128d33322d6f06abb5f65f998a2c1b8daf7`.

````text
--- a/Sources/Slotstream/Engine.swift
+++ b/Sources/Slotstream/Engine.swift
@@ -878,6 +878,10 @@
             var stats = GenStats(); stats.promptTokens = promptIds.count
             let failure = error as? RequestFailure ?? RequestFailure(.inferenceError, String(describing: error))
             stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
+            stats.memoryPressureCancelled = failure.code == .insufficientMemory
+            if failure.code == .insufficientMemory, let ticket = pressureBoundary.snapshot() {
+                stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
+            }
             stats.requestSeconds = request?.elapsedSeconds ?? RuntimeClock.seconds(since: requestStart)
             return ("", [], stats)
         }
@@ -1055,6 +1059,12 @@
         if let failure = control.failure {
             stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
             stats.memoryPressureCancelled = failure.code == .insufficientMemory
+            // A request guard can see the ticket before the legacy continuation
+            // callback runs. Preserve the same observed boundary in that path.
+            if failure.code == .insufficientMemory, stats.memoryPressureBoundarySeconds == nil,
+               let ticket = pressureBoundary.snapshot() {
+                stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
+            }
             prefixCache.drop()
             Stream.gpu.synchronize()
             MLX.Memory.clearCache()
--- a/Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift
@@ -161,10 +161,39 @@
             c.equal("\(phase): pressure cannot exceed the arena floor", engine.poolSnapshot().slots, Geometry.floorSlots)
             c.equal("\(phase): prefix ownership is released even when already at floor", engine.prefixCache.heldTokens, 0)
             c.expect("\(phase): acknowledged pressure cannot stop the next request", engine.pressureBoundary.snapshot() == nil)
+            let unavailable = engine.generate(promptIds: prompt, params: params)
+            c.expect("\(phase): infeasible context refuses new work until recovery",
+                unavailable.ids.isEmpty && unavailable.stats.requestFailure?.code == .insufficientMemory)
+            c.equal("\(phase): infeasible refusal reads no experts",
+                unavailable.stats.prefillRecords + unavailable.stats.decodeRecords, 0)
+            // The pressure ticket has drained, but the new plan must fit before
+            // another request is admitted. Find a bounded recovery reading using
+            // only the pure policy, never more than real reclaimable memory.
+            guard let current = engine.currentPlan, let available = Planner.deviceAvailableGB() else {
+                throw ModelError("governor recovery requires a real memory reading")
+            }
+            let recovery = stride(from: 0.0, through: min(10, available), by: 0.125).first { value in
+                let inputs = GovernorPolicy.Inputs(currentSlots: engine.poolSnapshot().slots,
+                    availableGB: value, ramGB: current.ramGB, workingSetGB: current.workingSetGB,
+                    ramPercent: current.ramPercent, secondsSincePressure: 0,
+                    mtpEnabled: current.mtpEnabled, visionEnabled: current.visionEnabled,
+                    visionResidentReserved: current.visionResidentReserved,
+                    maxContextTokens: current.maxContextTokens,
+                    runtimeAllocationPolicy: current.runtimeAllocationPolicy,
+                    contextQualification: current.contextQualification)
+                return GovernorPolicy.desiredPlan(inputs) != nil && GovernorPolicy.decide(inputs) == .hold
+            }
+            guard let recovery else { throw ModelError("no bounded feasible governor recovery is available") }
+            Planner.availabilityOverride = recovery
+            governor.pollNow()
+            c.equal("\(phase): recovery keeps the bounded arena", engine.poolSnapshot().slots, Geometry.floorSlots)
+            c.expect("\(phase): feasible recovery clears the admission latch",
+                engine.contextPolicyJSON["allocation_available"] as? Bool == true)
             let retry = engine.generate(promptIds: prompt, params: params)
             c.equal("\(phase): retry preserves the exact baseline IDs", retry.ids, baseline.ids)
             c.equal("\(phase): retry preserves exact text", retry.text, baseline.text)
             c.expect("\(phase): retry is not spuriously cancelled", !retry.stats.memoryPressureCancelled)
+            Planner.availabilityOverride = 0
             c.measure("\(phase).pressure_to_boundary_seconds", result.stats.memoryPressureBoundarySeconds ?? -1)
         }
         return c.report()

````

Artifact `/tmp/slotstream-context-implementation-20260906/governor-boundary-mtp-17/manifest.json` — 23307 bytes, SHA-256 `733090e9c6c2f7cfd5effb6a20bf582def3381a6b420364e27df7bba227af807`.

````text
{
  "binary": "/private/tmp/slotstream-context-implementation-20260906/build-17/candidate/slotstream",
  "identity": {
    "source": {
      "Makefile": "457d65426cca792bd8c1bd28e7d5bbcc812664090b535eeb0d355302679995d6",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
      "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
      "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
      "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
      "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
      "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "63208fab453c9f87a15fdbd2990291cdc3120efc3087ec5fbab455d4239ce288",
      "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
      "Sources/Slotstream/ContextMemory.swift": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
      "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
      "Sources/Slotstream/Engine.swift": "3dfd6457fbec91fc636e1bdcd432af805c77304cd798e82c6f8b097f3738339c",
      "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
      "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
      "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
      "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
      "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "5d43a1c419baa3b373aa491fb15b413a9692334f2774153082de8af0807adeaf",
      "Sources/Slotstream/Governor.swift": "af44af93916c9fcbea08744c9d343915e65914edf69909dfe25c420ff0b9a129",
      "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
      "Sources/Slotstream/Layers.swift": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
      "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
      "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
      "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
      "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
      "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
      "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
      "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
      "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
      "Sources/Slotstream/Optimizations.swift": "0739230d9ebfc0e0881a82add63660a48872c44ac3b5d709b9fe867105a4ee7a",
      "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
      "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
      "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/Plan.swift": "a25367b73877f2148d362be6fa5c396937bdac2bbea4a306963022ac3264af3b",
      "Sources/Slotstream/PrefixCache.swift": "3bd1841ec1bebb52b210d75b0fd4d4bdb0e49277ff9c529aebbc7227d94811d8",
      "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
      "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
      "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "ecd2aa75aa09b6cde14a46bb27e91bf76dd13f77f25e409178c1669adf94810b",
      "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
      "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
      "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
      "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
      "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
      "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
      "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
      "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
      "Sources/Slotstream/Weights.swift": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
      "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "e4a88b55578952d038c2892948665d91a8ba7d1d816578fce5fc8b2ceef76ce2",
      "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
      "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "86cb6127bd84f33a036a92a0ef561925d141ae1b257aac46c8a55c10d30406a2",
      "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "874e749a4d3663df07a12bbbca237b49ccce2d667c14c4d0285cca3dcc666747",
      "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "450a558155202d247a8bb73348a381ea35c7c06ed82999a3df356dcc65b2c930",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
      "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "a3cb658bbf29d1f119da68d517fba8e73db64a8ce6b698d14b5671fc25af5ccd",
      "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "09740bc89178780c21bd778a3a8e07d55ad867691e050619a4d29c9e1d6ab8be",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
      "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
      "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
      "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "34e74989d1f4fd2fcc9fd8cb9b0f1fc75c0e4e1c214751f44245f2543270ab09",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "d12a1d66c39d62cc773ba81ce1bf8ba88b82b096ad2f060398a39acfcf65b63c",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
      "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
      "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
      "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
      "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
      "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
      "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "5bf0d9a1ad4ba5759e1301a0534c0412eede0653f335b11c9341e0caebda66f8",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
      "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "ac3bdf70521f77c42fada851e132a1561c4ee06e5057302cb3f50d8f3cc597d3",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "534f2c4273d9401478c1012026d23f3376e45979108fffed5d227f32ac3f9af8",
      "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
      "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
      "Sources/slotstream-cli/main.swift": "a7291c58fa698be74e50964e22f1a1ddbc6584bdd02e9462fac54a6672706b36",
      "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "f6b812717fa77bf32bfa998b328ec5023c7e1a1a510b257ceb82f27edef9d1fe",
    "binary_sha256": "932c662f914981f240ed7b917847e9bc8a44a31aaf77428f8343c74cef9e5034",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13.0,
  "timeout_seconds": 600,
  "command": [
    "/private/tmp/slotstream-context-implementation-20260906/build-17/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "governor-boundary-mtp",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": false,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 30490722304,
    "swapins": 43807478,
    "swapouts": 77363385,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   324068.\nPages active:                                1064782.\nPages inactive:                               897266.\nPages speculative:                            172225.\nPages throttled:                                   0.\nPages wired down:                             222068.\nPages purgeable:                                1899.\n\"Translation faults\":                    14884469430.\nPages copy-on-write:                       693858208.\nPages zero filled:                       20294774383.\nPages reactivated:                        3320033487.\nPages purged:                               70007142.\nFile-backed pages:                           1535039.\nAnonymous pages:                              599234.\nPages stored in compressor:                  1707871.\nPages occupied by compressor:                 403281.\nDecompressions:                           1140548980.\nCompressions:                             1451729404.\nPageins:                                  7098873804.\nPageouts:                                   10977763.\nSwapins:                                    43807478.\nSwapouts:                                   77363385.\nPages tagged:                                 154462.\nPages tagged resident:                        118580.\nPages tagged compressed:                       35882.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6831.\nPages tag-storage free:                         1967.\nPages tag-storage non-tag pageable:            89498.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6426368.\nTagged compressions:                        10818718.\nTagged decompressions:                       9986652.\n"
  },
  "preflight_wait": {
    "seconds": 0.002776582999999999,
    "attempts": 1,
    "limit_seconds": 0
  },
  "exit_code": 1,
  "error": "JSONDecodeError: Expecting value: line 1 column 1 (char 0)",
  "duration_seconds": 0.90759075,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 30707744768,
    "swapins": 43807478,
    "swapouts": 77363385,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   398367.\nPages active:                                1035723.\nPages inactive:                               936194.\nPages speculative:                            105098.\nPages throttled:                                   0.\nPages wired down:                             212739.\nPages purgeable:                                5233.\n\"Translation faults\":                    14884753866.\nPages copy-on-write:                       693858593.\nPages zero filled:                       20295167757.\nPages reactivated:                        3320033493.\nPages purged:                               70007154.\nFile-backed pages:                           1470652.\nAnonymous pages:                              606363.\nPages stored in compressor:                  1707623.\nPages occupied by compressor:                 396350.\nDecompressions:                           1140549228.\nCompressions:                             1451729404.\nPageins:                                  7098874735.\nPageouts:                                   10977784.\nSwapins:                                    43807478.\nSwapouts:                                   77363385.\nPages tagged:                                 154547.\nPages tagged resident:                        118665.\nPages tagged compressed:                       35882.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6831.\nPages tag-storage free:                          765.\nPages tag-storage non-tag pageable:            90700.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6426368.\nTagged compressions:                        10818718.\nTagged decompressions:                       9986652.\n"
  }
}

````

Artifact `/tmp/slotstream-context-implementation-20260906/governor-boundary-mtp-17/stdout.txt` — 0 bytes, SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

Artifact `/tmp/slotstream-context-implementation-20260906/governor-boundary-mtp-17/stderr.txt` — 186 bytes, SHA-256 `fa2b96ab82ec594e7cba9cd1fbc82d194c7480b5da32fb2bbff65bed0033be15`.

````text
engine ready in 0.7s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), mtp draft head on, eos [248044, 248046]
Error: diagnostic requires SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR=1

````

Artifact `/tmp/slotstream-context-implementation-20260906/governor-boundary-mtp-18/manifest.json` — 23331 bytes, SHA-256 `a0bbcb4d04e5309200f47ad86420da867e6f1e614a376c741c6ef909f88f11eb`.

````text
{
  "binary": "/private/tmp/slotstream-context-implementation-20260906/build-18/candidate/slotstream",
  "identity": {
    "source": {
      "Makefile": "457d65426cca792bd8c1bd28e7d5bbcc812664090b535eeb0d355302679995d6",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
      "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
      "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
      "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
      "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
      "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "63208fab453c9f87a15fdbd2990291cdc3120efc3087ec5fbab455d4239ce288",
      "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
      "Sources/Slotstream/ContextMemory.swift": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
      "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
      "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
      "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
      "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
      "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
      "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
      "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "5d43a1c419baa3b373aa491fb15b413a9692334f2774153082de8af0807adeaf",
      "Sources/Slotstream/Governor.swift": "af44af93916c9fcbea08744c9d343915e65914edf69909dfe25c420ff0b9a129",
      "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
      "Sources/Slotstream/Layers.swift": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
      "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
      "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
      "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
      "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
      "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
      "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
      "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
      "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
      "Sources/Slotstream/Optimizations.swift": "0739230d9ebfc0e0881a82add63660a48872c44ac3b5d709b9fe867105a4ee7a",
      "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
      "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
      "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/Plan.swift": "a25367b73877f2148d362be6fa5c396937bdac2bbea4a306963022ac3264af3b",
      "Sources/Slotstream/PrefixCache.swift": "3bd1841ec1bebb52b210d75b0fd4d4bdb0e49277ff9c529aebbc7227d94811d8",
      "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
      "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
      "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "ecd2aa75aa09b6cde14a46bb27e91bf76dd13f77f25e409178c1669adf94810b",
      "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
      "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
      "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
      "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
      "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
      "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
      "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
      "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
      "Sources/Slotstream/Weights.swift": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
      "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "e4a88b55578952d038c2892948665d91a8ba7d1d816578fce5fc8b2ceef76ce2",
      "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
      "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "86cb6127bd84f33a036a92a0ef561925d141ae1b257aac46c8a55c10d30406a2",
      "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "874e749a4d3663df07a12bbbca237b49ccce2d667c14c4d0285cca3dcc666747",
      "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "450a558155202d247a8bb73348a381ea35c7c06ed82999a3df356dcc65b2c930",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
      "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "a3cb658bbf29d1f119da68d517fba8e73db64a8ce6b698d14b5671fc25af5ccd",
      "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "09740bc89178780c21bd778a3a8e07d55ad867691e050619a4d29c9e1d6ab8be",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
      "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
      "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
      "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "d12a1d66c39d62cc773ba81ce1bf8ba88b82b096ad2f060398a39acfcf65b63c",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
      "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
      "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
      "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
      "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
      "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
      "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "5bf0d9a1ad4ba5759e1301a0534c0412eede0653f335b11c9341e0caebda66f8",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
      "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "ac3bdf70521f77c42fada851e132a1561c4ee06e5057302cb3f50d8f3cc597d3",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "534f2c4273d9401478c1012026d23f3376e45979108fffed5d227f32ac3f9af8",
      "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
      "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
      "Sources/slotstream-cli/main.swift": "a7291c58fa698be74e50964e22f1a1ddbc6584bdd02e9462fac54a6672706b36",
      "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "cfad0737b11adb19cf2c3b33d428dbce7c83de67207ef89451737132c4f61ff1",
    "binary_sha256": "85638bad9c7b1f8e40921e7ac4ac61ac6b2618442521ef35611db40bafef760a",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13.0,
  "timeout_seconds": 600,
  "command": [
    "/private/tmp/slotstream-context-implementation-20260906/build-18/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "governor-boundary-mtp",
    "--json"
  ],
  "environment": {
    "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1"
  },
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28870295552,
    "swapins": 43807581,
    "swapouts": 77363385,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    88690.\nPages active:                                1212444.\nPages inactive:                               996079.\nPages speculative:                            228908.\nPages throttled:                                   0.\nPages wired down:                             221964.\nPages purgeable:                                2695.\n\"Translation faults\":                    14888232137.\nPages copy-on-write:                       694247559.\nPages zero filled:                       20297190733.\nPages reactivated:                        3320037614.\nPages purged:                               70024636.\nFile-backed pages:                           1670718.\nAnonymous pages:                              766713.\nPages stored in compressor:                  1577900.\nPages occupied by compressor:                 336336.\nDecompressions:                           1140679141.\nCompressions:                             1451729404.\nPageins:                                  7098944758.\nPageouts:                                   10977784.\nSwapins:                                    43807581.\nSwapouts:                                   77363385.\nPages tagged:                                 155067.\nPages tagged resident:                        121552.\nPages tagged compressed:                       33515.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6831.\nPages tag-storage free:                         1311.\nPages tag-storage non-tag pageable:            90154.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5928896.\nTagged compressions:                        10818718.\nTagged decompressions:                       9989005.\n"
  },
  "preflight_wait": {
    "seconds": 0.0024655410000000016,
    "attempts": 1,
    "limit_seconds": 0
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 80,
  "duration_seconds": 18.157623334,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29479714816,
    "swapins": 43807581,
    "swapouts": 77363385,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   449633.\nPages active:                                1039691.\nPages inactive:                               901131.\nPages speculative:                            137470.\nPages throttled:                                   0.\nPages wired down:                             223632.\nPages purgeable:                                  51.\n\"Translation faults\":                    14888598000.\nPages copy-on-write:                       694258230.\nPages zero filled:                       20298517191.\nPages reactivated:                        3320079635.\nPages purged:                               70027247.\nFile-backed pages:                           1349615.\nAnonymous pages:                              728677.\nPages stored in compressor:                  1579036.\nPages occupied by compressor:                 332303.\nDecompressions:                           1140679328.\nCompressions:                             1451730757.\nPageins:                                  7099051969.\nPageouts:                                   10977841.\nSwapins:                                    43807581.\nSwapouts:                                   77363385.\nPages tagged:                                 153758.\nPages tagged resident:                        120231.\nPages tagged compressed:                       33527.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6827.\nPages tag-storage free:                         1715.\nPages tag-storage non-tag pageable:            89754.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5929536.\nTagged compressions:                        10818730.\nTagged decompressions:                       9989005.\n"
  }
}

````

Artifact `/tmp/slotstream-context-implementation-20260906/governor-boundary-mtp-18/stdout.txt` — 8412 bytes, SHA-256 `6c9675c4e7f916e687372b1ad19d9577765dbcea23eb98c16c10d0f61b525da9`.

````text
{
  "items" : [
    {
      "name" : "baseline delivers the bounded output",
      "passed" : true
    },
    {
      "name" : "explicit plans never receive a pressure cancellation",
      "passed" : true
    },
    {
      "name" : "explicit plans never donate capacity",
      "passed" : true
    },
    {
      "name" : "busy polling skips resizing",
      "passed" : true
    },
    {
      "name" : "queued request observes pending pressure before work",
      "passed" : true
    },
    {
      "name" : "queued refusal reports a runtime error",
      "passed" : true
    },
    {
      "name" : "queued refusal reads no experts",
      "passed" : true
    },
    {
      "name" : "queued refusal takes no retained state",
      "passed" : true
    },
    {
      "name" : "queued pressure has an explicit image refusal",
      "passed" : true
    },
    {
      "name" : "queued pressure never loads the tower",
      "passed" : true
    },
    {
      "name" : "scope: actual pressure event reaches busy engine",
      "passed" : true
    },
    {
      "name" : "scope: governor finishes after safe cancellation",
      "passed" : true
    },
    {
      "name" : "scope: cancellation is explicitly observed",
      "passed" : true
    },
    {
      "name" : "scope: pressure reports an explicit error",
      "passed" : true
    },
    {
      "name" : "scope: boundary latency is finite and bounded",
      "passed" : true
    },
    {
      "name" : "scope: completion stops before the output allowance",
      "passed" : true
    },
    {
      "name" : "cancelled scope retains only its prior commit",
      "passed" : true
    },
    {
      "name" : "scope cancellation emits no token",
      "passed" : true
    },
    {
      "name" : "scope: pressure cannot exceed the arena floor",
      "passed" : true
    },
    {
      "name" : "scope: prefix ownership is released even when already at floor",
      "passed" : true
    },
    {
      "name" : "scope: acknowledged pressure cannot stop the next request",
      "passed" : true
    },
    {
      "name" : "scope: infeasible context refuses new work until recovery",
      "passed" : true
    },
    {
      "name" : "scope: infeasible refusal reads no experts",
      "passed" : true
    },
    {
      "name" : "scope: recovery keeps the bounded arena",
      "passed" : true
    },
    {
      "name" : "scope: feasible recovery clears the admission latch",
      "passed" : true
    },
    {
      "name" : "scope: retry preserves the exact baseline IDs",
      "passed" : true
    },
    {
      "name" : "scope: retry preserves exact text",
      "passed" : true
    },
    {
      "name" : "scope: retry is not spuriously cancelled",
      "passed" : true
    },
    {
      "name" : "prefill: actual pressure event reaches busy engine",
      "passed" : true
    },
    {
      "name" : "prefill: governor finishes after safe cancellation",
      "passed" : true
    },
    {
      "name" : "prefill: cancellation is explicitly observed",
      "passed" : true
    },
    {
      "name" : "prefill: pressure reports an explicit error",
      "passed" : true
    },
    {
      "name" : "prefill: boundary latency is finite and bounded",
      "passed" : true
    },
    {
      "name" : "prefill: completion stops before the output allowance",
      "passed" : true
    },
    {
      "name" : "prefill stops at one complete chronological pass",
      "passed" : true
    },
    {
      "name" : "prefill cancellation emits no token",
      "passed" : true
    },
    {
      "name" : "prefill: pressure cannot exceed the arena floor",
      "passed" : true
    },
    {
      "name" : "prefill: prefix ownership is released even when already at floor",
      "passed" : true
    },
    {
      "name" : "prefill: acknowledged pressure cannot stop the next request",
      "passed" : true
    },
    {
      "name" : "prefill: infeasible context refuses new work until recovery",
      "passed" : true
    },
    {
      "name" : "prefill: infeasible refusal reads no experts",
      "passed" : true
    },
    {
      "name" : "prefill: recovery keeps the bounded arena",
      "passed" : true
    },
    {
      "name" : "prefill: feasible recovery clears the admission latch",
      "passed" : true
    },
    {
      "name" : "prefill: retry preserves the exact baseline IDs",
      "passed" : true
    },
    {
      "name" : "prefill: retry preserves exact text",
      "passed" : true
    },
    {
      "name" : "prefill: retry is not spuriously cancelled",
      "passed" : true
    },
    {
      "name" : "decode: actual pressure event reaches busy engine",
      "passed" : true
    },
    {
      "name" : "decode: governor finishes after safe cancellation",
      "passed" : true
    },
    {
      "name" : "decode: cancellation is explicitly observed",
      "passed" : true
    },
    {
      "name" : "decode: pressure reports an explicit error",
      "passed" : true
    },
    {
      "name" : "decode: boundary latency is finite and bounded",
      "passed" : true
    },
    {
      "name" : "decode: completion stops before the output allowance",
      "passed" : true
    },
    {
      "name" : "decode emits a coherent prefix before cancellation",
      "passed" : true
    },
    {
      "name" : "decode: pressure cannot exceed the arena floor",
      "passed" : true
    },
    {
      "name" : "decode: prefix ownership is released even when already at floor",
      "passed" : true
    },
    {
      "name" : "decode: acknowledged pressure cannot stop the next request",
      "passed" : true
    },
    {
      "name" : "decode: infeasible context refuses new work until recovery",
      "passed" : true
    },
    {
      "name" : "decode: infeasible refusal reads no experts",
      "passed" : true
    },
    {
      "name" : "decode: recovery keeps the bounded arena",
      "passed" : true
    },
    {
      "name" : "decode: feasible recovery clears the admission latch",
      "passed" : true
    },
    {
      "name" : "decode: retry preserves the exact baseline IDs",
      "passed" : true
    },
    {
      "name" : "decode: retry preserves exact text",
      "passed" : true
    },
    {
      "name" : "decode: retry is not spuriously cancelled",
      "passed" : true
    },
    {
      "name" : "nonstream: actual pressure event reaches busy engine",
      "passed" : true
    },
    {
      "name" : "nonstream: governor finishes after safe cancellation",
      "passed" : true
    },
    {
      "name" : "nonstream: cancellation is explicitly observed",
      "passed" : true
    },
    {
      "name" : "nonstream: pressure reports an explicit error",
      "passed" : true
    },
    {
      "name" : "nonstream: boundary latency is finite and bounded",
      "passed" : true
    },
    {
      "name" : "nonstream: completion stops before the output allowance",
      "passed" : true
    },
    {
      "name" : "decode emits a coherent prefix before cancellation",
      "passed" : true
    },
    {
      "name" : "nonstream: pressure cannot exceed the arena floor",
      "passed" : true
    },
    {
      "name" : "nonstream: prefix ownership is released even when already at floor",
      "passed" : true
    },
    {
      "name" : "nonstream: acknowledged pressure cannot stop the next request",
      "passed" : true
    },
    {
      "name" : "nonstream: infeasible context refuses new work until recovery",
      "passed" : true
    },
    {
      "name" : "nonstream: infeasible refusal reads no experts",
      "passed" : true
    },
    {
      "name" : "nonstream: recovery keeps the bounded arena",
      "passed" : true
    },
    {
      "name" : "nonstream: feasible recovery clears the admission latch",
      "passed" : true
    },
    {
      "name" : "nonstream: retry preserves the exact baseline IDs",
      "passed" : true
    },
    {
      "name" : "nonstream: retry preserves exact text",
      "passed" : true
    },
    {
      "name" : "nonstream: retry is not spuriously cancelled",
      "passed" : true
    }
  ],
  "measurements" : {
    "decode.pressure_to_boundary_seconds" : 5.417e-06,
    "nonstream.pressure_to_boundary_seconds" : 0.000241708,
    "prefill.pressure_to_boundary_seconds" : 0.002057625,
    "scope.pressure_to_boundary_seconds" : 0.006028333
  },
  "name" : "optimization-governor-boundary-mtp",
  "passed" : true
}

````

Artifact `/tmp/slotstream-context-implementation-20260906/governor-boundary-mtp-18/stderr.txt` — 122 bytes, SHA-256 `703580597dc3c0d543621449c28ce215b376cbb5e21a3003bb87074e96e0b88c`.

````text
engine ready in 0.7s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), mtp draft head on, eos [248044, 248046]

````

Artifact `/tmp/slotstream-context-implementation-20260906/context-serving-18/manifest.json` — 23281 bytes, SHA-256 `37f118e42ee00ee94c2bf30f4ee492b7cef4cb830e1c9f8db8689e840f0e6805`.

````text
{
  "binary": "/private/tmp/slotstream-context-implementation-20260906/build-18/candidate/slotstream",
  "identity": {
    "source": {
      "Makefile": "457d65426cca792bd8c1bd28e7d5bbcc812664090b535eeb0d355302679995d6",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
      "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
      "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
      "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
      "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
      "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "63208fab453c9f87a15fdbd2990291cdc3120efc3087ec5fbab455d4239ce288",
      "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
      "Sources/Slotstream/ContextMemory.swift": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
      "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
      "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
      "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
      "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
      "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
      "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
      "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "5d43a1c419baa3b373aa491fb15b413a9692334f2774153082de8af0807adeaf",
      "Sources/Slotstream/Governor.swift": "af44af93916c9fcbea08744c9d343915e65914edf69909dfe25c420ff0b9a129",
      "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
      "Sources/Slotstream/Layers.swift": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
      "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
      "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
      "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
      "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
      "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
      "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
      "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
      "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
      "Sources/Slotstream/Optimizations.swift": "0739230d9ebfc0e0881a82add63660a48872c44ac3b5d709b9fe867105a4ee7a",
      "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
      "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
      "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/Plan.swift": "a25367b73877f2148d362be6fa5c396937bdac2bbea4a306963022ac3264af3b",
      "Sources/Slotstream/PrefixCache.swift": "3bd1841ec1bebb52b210d75b0fd4d4bdb0e49277ff9c529aebbc7227d94811d8",
      "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
      "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
      "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "ecd2aa75aa09b6cde14a46bb27e91bf76dd13f77f25e409178c1669adf94810b",
      "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
      "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
      "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
      "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
      "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
      "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
      "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
      "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
      "Sources/Slotstream/Weights.swift": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
      "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "e4a88b55578952d038c2892948665d91a8ba7d1d816578fce5fc8b2ceef76ce2",
      "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
      "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "86cb6127bd84f33a036a92a0ef561925d141ae1b257aac46c8a55c10d30406a2",
      "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "874e749a4d3663df07a12bbbca237b49ccce2d667c14c4d0285cca3dcc666747",
      "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "450a558155202d247a8bb73348a381ea35c7c06ed82999a3df356dcc65b2c930",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
      "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "a3cb658bbf29d1f119da68d517fba8e73db64a8ce6b698d14b5671fc25af5ccd",
      "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "09740bc89178780c21bd778a3a8e07d55ad867691e050619a4d29c9e1d6ab8be",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
      "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
      "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
      "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "d12a1d66c39d62cc773ba81ce1bf8ba88b82b096ad2f060398a39acfcf65b63c",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
      "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
      "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
      "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
      "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
      "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
      "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "5bf0d9a1ad4ba5759e1301a0534c0412eede0653f335b11c9341e0caebda66f8",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
      "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "ac3bdf70521f77c42fada851e132a1561c4ee06e5057302cb3f50d8f3cc597d3",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "534f2c4273d9401478c1012026d23f3376e45979108fffed5d227f32ac3f9af8",
      "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
      "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
      "Sources/slotstream-cli/main.swift": "a7291c58fa698be74e50964e22f1a1ddbc6584bdd02e9462fac54a6672706b36",
      "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "cfad0737b11adb19cf2c3b33d428dbce7c83de67207ef89451737132c4f61ff1",
    "binary_sha256": "85638bad9c7b1f8e40921e7ac4ac61ac6b2618442521ef35611db40bafef760a",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13.0,
  "timeout_seconds": 600,
  "command": [
    "/private/tmp/slotstream-context-implementation-20260906/build-18/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "context-serving",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29484056576,
    "swapins": 43807581,
    "swapouts": 77363385,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   449842.\nPages active:                                1039729.\nPages inactive:                               900799.\nPages speculative:                            137824.\nPages throttled:                                   0.\nPages wired down:                             223632.\nPages purgeable:                                  51.\n\"Translation faults\":                    14888601370.\nPages copy-on-write:                       694258679.\nPages zero filled:                       20298518273.\nPages reactivated:                        3320079635.\nPages purged:                               70027247.\nFile-backed pages:                           1349671.\nAnonymous pages:                              728681.\nPages stored in compressor:                  1579036.\nPages occupied by compressor:                 332303.\nDecompressions:                           1140679328.\nCompressions:                             1451730757.\nPageins:                                  7099052015.\nPageouts:                                   10977841.\nSwapins:                                    43807581.\nSwapouts:                                   77363385.\nPages tagged:                                 153758.\nPages tagged resident:                        120231.\nPages tagged compressed:                       33527.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6827.\nPages tag-storage free:                         1501.\nPages tag-storage non-tag pageable:            89968.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5929536.\nTagged compressions:                        10818730.\nTagged decompressions:                       9989005.\n"
  },
  "preflight_wait": {
    "seconds": 0.002701749999999989,
    "attempts": 1,
    "limit_seconds": 0
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 835,
  "duration_seconds": 92.84510775000001,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29170434048,
    "swapins": 43807593,
    "swapouts": 77363385,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   372533.\nPages active:                                1080991.\nPages inactive:                               901129.\nPages speculative:                            178084.\nPages throttled:                                   0.\nPages wired down:                             222305.\nPages purgeable:                                2651.\n\"Translation faults\":                    14889330429.\nPages copy-on-write:                       694330788.\nPages zero filled:                       20301484554.\nPages reactivated:                        3320465336.\nPages purged:                               70036443.\nFile-backed pages:                           1405238.\nAnonymous pages:                              754966.\nPages stored in compressor:                  1569737.\nPages occupied by compressor:                 329093.\nDecompressions:                           1140689048.\nCompressions:                             1451730757.\nPageins:                                  7099306403.\nPageouts:                                   10977865.\nSwapins:                                    43807593.\nSwapouts:                                   77363385.\nPages tagged:                                 155029.\nPages tagged resident:                        121990.\nPages tagged compressed:                       33039.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6827.\nPages tag-storage free:                         1586.\nPages tag-storage non-tag pageable:            89883.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5820736.\nTagged compressions:                        10818730.\nTagged decompressions:                       9989485.\n"
  }
}

````

Artifact `/tmp/slotstream-context-implementation-20260906/context-serving-18/stdout.txt` — 96493 bytes, SHA-256 `cb00c737d1399c61d29239b009ef57ec45fce21be2815a025be0b268b25d0bb4`.

````text
{
  "items" : [
    {
      "name" : "generate JSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-before\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "deadline-before\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-after\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "deadline-after\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "pressure-before\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "pressure-after\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-decode\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-before\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "deadline-before\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-after\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "deadline-after\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "pressure-before\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "pressure-after\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-decode\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/false: clock actually advanced",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/false: healthy HTTP completion",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/false: released pins",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/true: clock actually advanced",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/true: healthy HTTP completion",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/true: released pins",
      "passed" : true
    },
    {
      "name" : "warm admission: seed succeeds",
      "passed" : true
    },
    {
      "name" : "warm admission: seed retained exact consumed history",
      "passed" : true
    },
    {
      "name" : "warm admission: only missing token is admitted",
      "passed" : true
    },
    {
      "name" : "warm admission: retained estimate is inside budget",
      "passed" : true
    },
    {
      "name" : "cold admission: identical total prompt refused",
      "passed" : true
    },
    {
      "name" : "cold admission: no prompt computation",
      "passed" : true
    },
    {
      "name" : "cold admission: truthful submitted token count",
      "passed" : true
    },
    {
      "name" : "cold admission: failed state absent",
      "passed" : true
    },
    {
      "name" : "client cap: typed pre-header refusal",
      "passed" : true
    },
    {
      "name" : "client cap: server remains unchanged",
      "passed" : true
    },
    {
      "name" : "client cap: later client succeeds",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=-1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=0: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=0: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=1: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=-1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=0: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=0: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=1: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/room=-1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/room=0: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/room=1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/room=1: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "queued request expires before headers",
      "passed" : true
    },
    {
      "name" : "\/v1\/models: metadata stays responsive during occupied generation gate",
      "passed" : true
    },
    {
      "name" : "\/coding-agent\/v1\/models: metadata stays responsive during occupied generation gate",
      "passed" : true
    },
    {
      "name" : "invalid legacy mutation preserves advertised cap",
      "passed" : true
    },
    {
      "name" : "invalid legacy mutation fails without allocation",
      "passed" : true
    },
    {
      "name" : "valid legacy assignment recovers",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "context-serving",
  "passed" : true
}

````

Artifact `/tmp/slotstream-context-implementation-20260906/context-serving-18/stderr.txt` — 103 bytes, SHA-256 `f3cfe5a0fe0b557042ace1186a434674b8b7b73725fc0acfb2163754dc7da429`.

````text
engine ready in 0.6s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]

````

