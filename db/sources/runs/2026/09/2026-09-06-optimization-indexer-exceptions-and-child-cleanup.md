---
type: run
id: 01m1w6kn8ycgq1y2f5efwf6gfy
created: 2026-09-06T20:29:56.894417+00:00
updated: 2026-09-06T20:29:57.065382+00:00
summary: Indexer exceptional arithmetic and owned-process cleanup — V187–188
binary: No native or GPU run; source and test harness only
captured_at: 2026-09-06
command: python3 Tools/process_cleanup_checks.py -v
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Indexer exceptional arithmetic and owned-process cleanup — V187–188
tool: Pinned source review and bounded pure/process tests
---
V187 reviews the unrun indexer kernel against the pinned MLX source itself. MLX Maximum explicitly propagates a NaN left input and otherwise evaluates x > y ? x : y, whereas the prototype used Metal max directly. The prototype now uses the same explicit floating-point branch, including a positive zero for nonpositive finite inputs. No GPU run has occurred; the existing finite-oracle, exceptional-pattern and exact keep-mask gates remain mandatory before any timing. The five pure protocol tests pass but do not validate the kernel.

V188 integrates the demonstrated process-cleanup correction and hardens its failure path. SwiftPM/Git descendants can own independent process groups, so cleanup snapshots numeric parent/group links before stopping the root, signals only groups led by proven owned processes, and sends KILL to TERM-ignoring descendants even if the root exited first. The snapshot has a five-second timeout. Enumeration failure still drains the known root and reports that full descendant cleanup is unverified; it never claims unknown children were killed. Root TERM/KILL waits are bounded. Normal completion adds no process scan or signal. The new function is also used by the unrun V186 build wrapper.

Three real-process groups pass, including an unrelated sibling that remains alive, a separately grouped descendant ignoring TERM, failed and timed-out enumeration with root cleanup, and normal completion without cleanup. Seven context-capacity rejection groups, forty-nine serving-harness groups and five indexer protocol groups also pass. Exact captured output is included. No native/GPU, model performance, storage or capacity work ran here. The helper changes only timeout cleanup; no completed performance interval is rerun or reinterpreted, and future protocols must bind the updated driver bytes.

A first-principles OPT04 check also makes its remaining relevance explicit: default256 rows times the entire public65536 window is16,777,216 query-key positions, below32,833,536. Thus the tail-aware alternative produces the same default logical pass lengths throughout the published window. Its larger-pass benefit depends on a separately qualified chronological batch; the earlier larger chronological family failed its numerical gate. C07 late sub-256 arithmetic is a distinct diagnostic capacity path beyond the present published window, not a speedup credited to normal256-token serving. No missing default-path benchmark is hidden by enabling a no-op flag.

Artifact `/Users/carlos/Projects/slotstream/Tools/indexer_score_probe.py` — 18764 bytes, SHA-256 `2d4e35ab66d49e4d0cb42b68e0ddf043c20cbbe18b0730bce87926f00fcd65a4`.

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
// Match MLX Maximum's floating-point branch, including NaN and signed zero.
if (lane == 0) positive[head] = metal::isnan(dot) ? dot : (dot > 0.0f ? dot : 0.0f);
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

Artifact `/Users/carlos/Projects/slotstream/Tools/prefill_bench.py` — 19176 bytes, SHA-256 `3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036`.

````text
#!/usr/bin/env python3
"""Paired inference experiments with raw results and exact token identities.

Repeat --arm NAME=EXECUTABLE for AB/BA order. A fresh process means empty
expert/prefix caches, not cold SSD: OS file cache is explicitly uncontrolled.
Failed, incomplete, and swapping runs are preserved and excluded.
"""
import argparse
import fcntl
import hashlib
import json
import math
import os
from pathlib import Path
import re
import signal
import statistics
import struct
import subprocess
import tarfile
import time

ROOT = Path(__file__).resolve().parent.parent
FIXTURES = ROOT / "Tools/fixtures/optimization"


def digest(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for part in iter(lambda: f.read(1024 * 1024), b""): h.update(part)
    return h.hexdigest()


def vm_snapshot(raw=None):
    raw = raw if raw is not None else subprocess.check_output(["vm_stat"], text=True)
    size = re.search(r"page size of (\d+) bytes", raw)
    if not size: raise ValueError("vm_stat page size missing")
    pages = {k.strip('"'): int(v) for k, v in re.findall(r'^([^:\n]+):\s+(\d+)\.', raw, re.M)}
    required = ("Pages free", "Pages purgeable", "File-backed pages", "Swapins", "Swapouts")
    if any(k not in pages for k in required): raise ValueError("vm_stat counters missing")
    return {"page_bytes": int(size[1]), "reclaimable_bytes": sum(pages[k] for k in required[:3]) * int(size[1]),
            "swapins": pages["Swapins"], "swapouts": pages["Swapouts"], "raw": raw}


class InsufficientHeadroom(RuntimeError):
    pass


def preflight(needed_gb):
    # Release before child launch; child reacquires atomically before allocation.
    with open(f"/tmp/slotstream-model-{os.getuid()}.lock", "a") as lock:
        try: fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as e: raise RuntimeError("another model process holds the lock") from e
    state = vm_snapshot()
    if state["reclaimable_bytes"] < needed_gb * 1e9:
        raise InsufficientHeadroom(f"{state['reclaimable_bytes']/1e9:.2f} GB reclaimable; need {needed_gb:.2f} GB")
    return state


def host_conditions():
    """Read-only observations outside timed intervals; unavailable is explicit.

    pmset's warning history is not an instantaneous thermal sensor. Preserve
    that distinction and do not infer energy or thermal headroom from it.
    """
    result = {"load_average_1_5_15_minutes": list(os.getloadavg()),
              "observed_at_unix_seconds": time.time(),
              "thermal_limit": "pmset warning/status history, not continuous temperature",
              "energy_joules": None}
    for key, command in [("power_source", ["pmset", "-g", "batt"]),
                         ("power_configuration", ["pmset", "-g", "custom"]),
                         ("thermal_status", ["pmset", "-g", "therm"])]:
        try:
            output = subprocess.run(command, capture_output=True, text=True, timeout=5)
            result[key] = {"exit_code": output.returncode, "stdout": output.stdout, "stderr": output.stderr}
        except (OSError, subprocess.TimeoutExpired) as e:
            result[key] = {"unavailable": f"{type(e).__name__}: {e}"}
    return result


def validate_metrics(d, *, allow_complete_prompt=False):
    if type(allow_complete_prompt) is not bool: raise ValueError("complete prompt permission must be Boolean")
    if d.get("schema_version") != 1: raise ValueError("unsupported schema")
    s = d["stats"]
    for k in ("prefillSeconds", "decodeSeconds", "requestSeconds", "imageEncodeSeconds"):
        if type(s.get(k)) not in (int, float) or not math.isfinite(s[k]) or s[k] < 0:
            raise ValueError(f"invalid {k}")
    for k in ("prefillRecords", "decodeRecords", "prefillTokens", "decodeTokens", "lifetimeRSSPeakBytes"):
        if type(s.get(k)) is not int or s[k] < 0: raise ValueError(f"invalid {k}")
    if s["prefillTokens"] == 0:
        if not allow_complete_prompt: raise ValueError("no completed prefill")
        if (type(s.get('promptTokens')) is not int or s['promptTokens'] <= 0
            or type(s.get('reusedPrefixTokens')) is not int or s['reusedPrefixTokens'] != s['promptTokens']
            or type(s.get('completePromptHits')) is not int or s['completePromptHits'] != 1
            or s['prefillRecords'] != 0 or s.get('prefillPasses') != []
            or s.get('prefillComputePasses') != []
            or type(s.get('prefillReadBytes')) is not int or s['prefillReadBytes'] != 0):
            raise ValueError("zero-prefill request lacks an exact complete-prompt hit and zero work")
    elif s["prefillSeconds"] <= 0: raise ValueError("no completed prefill")
    if sum(s["prefillPasses"]) != s["prefillTokens"]: raise ValueError("pass/token mismatch")
    if len(d["prompt_ids"]) != s["promptTokens"] or len(d["output_ids"]) != s["decodeTokens"]:
        raise ValueError("token identity/count mismatch")
    return s


def capture_sources(dest):
    files = sorted([*ROOT.glob("Sources/**/*.swift"), ROOT/"Package.swift", ROOT/"Package.resolved", ROOT/"Makefile"])
    with tarfile.open(dest/"source.tar.gz", "w:gz") as archive:
        for p in files: archive.add(p, arcname=str(p.relative_to(ROOT)))
    return {str(p.relative_to(ROOT)): digest(p) for p in files}


def model_identity(model):
    # This identifies headers/stat metadata, NOT full payload verification.
    result = {}
    for p in sorted(model.iterdir()):
        if p.suffix not in (".json", ".jinja", ".safetensors"): continue
        info = {"bytes": p.stat().st_size, "mtime_ns": p.stat().st_mtime_ns}
        if p.suffix == ".safetensors":
            with p.open("rb") as f:
                n = struct.unpack("<Q", f.read(8))[0]
                if n > 64*1024*1024 or n+8 > info["bytes"]: raise ValueError(f"invalid header: {p.name}")
                info["header_sha256"] = hashlib.sha256(f.read(n)).hexdigest()
        else: info["sha256"] = digest(p)
        result[p.name] = info
    if "config.json" not in result: raise ValueError("model config missing")
    return result


def terminate_child_tree(child):
    """Drain a timed-out child and the independently grouped descendants we
    can prove it owns. Never signal the caller's inherited process group."""
    groups = {child.pid}  # run_child starts a new session before exec.
    snapshot_error = None
    try:
        # Capture parent links before terminating the root. SwiftPM may put
        # Git/compiler descendants in independent sessions/process groups.
        rows = [tuple(map(int, line.split())) for line in subprocess.check_output(
            ['ps', '-axo', 'pid=,ppid=,pgid='], text=True, timeout=5).splitlines() if line.strip()]
        owned = {child.pid}
        while True:
            expanded = owned | {pid for pid, parent, _ in rows if parent in owned}
            if expanded == owned: break
            owned = expanded
        groups.update(group for pid, _, group in rows if pid in owned and group in owned)
    except (OSError, subprocess.SubprocessError, ValueError) as error:
        snapshot_error = error
    finally:
        def signal_owned(sig):
            for group in groups:
                try: os.killpg(group, sig)
                except ProcessLookupError: pass
        signal_owned(signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired: pass
        finally:
            # The root can exit while an independently grouped descendant
            # ignores TERM. Enumeration failure must not skip root cleanup.
            signal_owned(signal.SIGKILL)
            child.wait(timeout=5)
    if snapshot_error is not None:
        raise RuntimeError('child root drained, but descendant enumeration failed; full cleanup is unverified') from snapshot_error


def run_child(command, env, cell, timeout):
    with (cell/"stdout.txt").open("wb") as out, (cell/"stderr.txt").open("wb") as err:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=out, stderr=err, start_new_session=True)
        try: return child.wait(timeout=timeout)
        finally:
            if child.poll() is None: terminate_child_tree(child)


def paired_summary(rows, reference):
    groups = {}
    for row in rows:
        groups.setdefault((row["prompt"], row["chunk"], row["round"]), {})[row["arm"]] = row
    by_arm = {}
    for (prompt, chunk, round_number), arms in groups.items():
        for name, candidate in arms.items():
            if name == reference: continue
            result = by_arm.setdefault((prompt, chunk, name), {"pairs": [], "excluded_rounds": []})
            control = arms.get(reference)
            if not control or not control["valid"] or not candidate["valid"]:
                result["excluded_rounds"].append(round_number); continue
            a, b = control["metrics"], candidate["metrics"]
            if a["prompt_ids"] != b["prompt_ids"] or a["effective_pool_slots"] != b["effective_pool_slots"] or a.get("effective_mtp") != b.get("effective_mtp"):
                result["excluded_rounds"].append(round_number); continue
            result["pairs"].append({"round": round_number,
                "request_reduction_fraction": 1 - b["stats"]["requestSeconds"] / a["stats"]["requestSeconds"],
                "request_saved_seconds": a["stats"]["requestSeconds"] - b["stats"]["requestSeconds"],
                "output_ids_equal": a["output_ids"] == b["output_ids"]})
    result = []
    for (prompt, chunk, name), entry in sorted(by_arm.items()):
        pairs = entry["pairs"]
        result.append({"prompt": prompt, "chunk": chunk, "reference": reference, "candidate": name, **entry,
            "median_request_reduction_fraction": statistics.median(p["request_reduction_fraction"] for p in pairs) if pairs else None})
    return result


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--arm", action="append", help="NAME=EXECUTABLE (repeatable)")
    p.add_argument("--arm-env", action="append", default=[], help='NAME={"SLOTSTREAM_...":"value"}')
    p.add_argument("--arm-chunk", action="append", default=[], help="NAME=256..4096, explicit per-arm compute-pass override")
    p.add_argument("--label", default="baseline")
    p.add_argument("--mtp", choices=("off", "on"), default="off")
    p.add_argument("--rounds", type=int, default=3)
    p.add_argument("--chunks", default="256")
    p.add_argument("--prompts", default="short,prose")
    p.add_argument("--memory-gb", type=float, default=8.1)
    p.add_argument("--max-tokens", type=int, default=16)
    p.add_argument("--seed", type=int, default=7)
    p.add_argument("--sampled", action="store_true")
    p.add_argument("--sample-footprint", action="store_true")
    p.add_argument("--observe-arm", action="append", default=[], help="Enable footprint sampling only for this arm")
    p.add_argument("--model", type=Path, default=Path.home()/".slotstream/models/qwen38-flash-next-mlx-4bit")
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--timeout", type=int, default=1800)
    p.add_argument("--prepare-only", action="store_true")
    a = p.parse_args()
    if not (8.1 <= a.memory_gb <= 10 and a.rounds > 0 and a.max_tokens > 0 and a.timeout > 0):
        p.error("use an 8.1–10 GB target and positive rounds/output/timeout")
    chunks = [int(c) for c in a.chunks.split(",")]
    if any(c < 256 or c > 4096 for c in chunks): p.error("chunks must be within 256..4096")
    if len(chunks) != len(set(chunks)): p.error("chunks must be unique")
    arms = {}
    for arm in a.arm or [f"{a.label}=.build/release/slotstream"]:
        name, path = arm.split("=", 1)
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name) or name in arms: p.error("unique safe arm names required")
        arms[name] = Path(path).resolve()
    if any(name not in arms for name in a.observe_arm): p.error("observe-arm must name an arm")
    arm_chunks = {}
    for item in a.arm_chunk:
        name, value = item.split("=", 1)
        if name not in arms or name in arm_chunks or not value.isdecimal() or not 256 <= int(value) <= 4096:
            p.error("arm-chunk requires a unique arm and a 256..4096 integer")
        arm_chunks[name] = int(value)
    envs = {n: {} for n in arms}
    for item in a.arm_env:
        name, value = item.split("=", 1); values = json.loads(value)
        if name not in arms or not isinstance(values, dict) or any(not k.startswith("SLOTSTREAM_") or not isinstance(v, str) for k,v in values.items()):
            p.error("arm-env requires an arm and string SLOTSTREAM_ overrides")
        envs[name].update(values)
    prompts = {}
    for name in a.prompts.split(","):
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name): p.error("invalid fixture name")
        prompts[name] = FIXTURES/f"{name}.txt"
        if not prompts[name].is_file(): p.error(f"missing immutable fixture {name}")
    a.out = a.out.resolve(); a.out.mkdir(parents=True, exist_ok=False)
    # Preserve fixture bytes as well as hashes; a future source edit must not
    # make an old benchmark impossible to reconstruct.
    (a.out / "fixtures").mkdir()
    import shutil
    for name, fixture in list(prompts.items()):
        shutil.copyfile(fixture, a.out / "fixtures" / fixture.name)
        prompts[name] = a.out / "fixtures" / fixture.name
    identities = {}
    for name, binary in arms.items():
        identity_file = binary.parent / "build-identity.json"
        source_file = binary.parent / "build-source.tar.gz"
        identity = json.loads(identity_file.read_text())
        if identity["binary_sha256"] != digest(binary) or identity["metallib_sha256"] != digest(binary.parent / "mlx.metallib"):
            raise ValueError(f"{name}: executable/metallib does not match build identity")
        if identity["source_archive_sha256"] != digest(source_file):
            raise ValueError(f"{name}: source archive does not match build identity")
        shutil.copyfile(source_file, a.out / f"{name}-source.tar.gz")
        identities[name] = identity
    base_env = {k:v for k,v in os.environ.items() if not k.startswith(("SLOTSTREAM_", "SS_DEBUG"))}
    manifest = {"schema_version": 1, "head": subprocess.check_output(["git","rev-parse","HEAD"], cwd=ROOT, text=True).strip(),
                "worktree_source": capture_sources(a.out), "build_identities": identities, "model": model_identity(a.model),
                "arms": {n:{"binary":str(b),"sha256":digest(b),"metallib_sha256":digest(b.parent/"mlx.metallib"),"env":envs[n]} for n,b in arms.items()},
                "fixtures": {n:{"path":str(f),"sha256":digest(f)} for n,f in prompts.items()},
                "conditions": {"filesystem_cache":"uncontrolled; no purge","expert_cache":"empty per process","prefix_cache":"empty per process","mtp":a.mtp == "on"},
                "arguments": {k:str(v) if isinstance(v,Path) else v for k,v in vars(a).items()}}
    (a.out/"manifest.json").write_text(json.dumps(manifest,indent=2)+"\n")
    if a.prepare_only: print(json.dumps({"prepared":str(a.out)})); return
    rows = []
    for ri in range(a.rounds):
        order = list(arms) if ri%2 == 0 else list(reversed(arms))
        for pname,fixture in prompts.items():
            for chunk in chunks:
                for name in order:
                    cell = a.out/f"{ri+1}-{pname}-{chunk}-{name}"; cell.mkdir()
                    row = {"round":ri+1,"prompt":pname,"chunk":chunk,"arm":name,"valid":False}
                    effective_chunk = arm_chunks.get(name, chunk)
                    row["requested_effective_chunk"] = effective_chunk
                    env = base_env | envs[name] | {"SLOTSTREAM_PREFILL_CHUNK":str(effective_chunk)}
                    command = [str(arms[name]),"run","--raw","--prompt-file",str(fixture),"--model",str(a.model),
                               "--memory-gb",str(a.memory_gb),"--mtp",a.mtp,"--seed",str(a.seed),
                               "--max-tokens",str(a.max_tokens),"--stats-json",str(cell/"metrics.json")]
                    if not a.sampled: command.append("--greedy")
                    if a.sample_footprint or name in a.observe_arm: command.append("--sample-footprint")
                    row["command"] = command
                    row["environment"] = {k:v for k,v in env.items() if k.startswith("SLOTSTREAM_")}
                    try:
                        extra = max(0, (effective_chunk - 256) * 1.30e-3)
                        if env.get("SLOTSTREAM_OPT_LAYER_WORKSPACE") == "1": extra += 2.0
                        scope = int(env.get("SLOTSTREAM_OPT_READ_SCOPE", "0"))
                        if scope > 0: extra += max(0, scope - effective_chunk) * 1.30e-3 + 0.12
                        row["override_extra_allowance_gb"] = extra
                        row["host_before"] = host_conditions()
                        row["before"] = preflight(a.memory_gb+extra+3)
                        start = time.monotonic()
                        row["exit_code"] = run_child(command,env,cell,a.timeout)
                        row["wall_seconds"] = time.monotonic()-start; row["after"] = vm_snapshot()
                        row["host_after"] = host_conditions()
                        if row["exit_code"] != 0: raise ValueError(f"child exit {row['exit_code']}")
                        d = json.loads((cell/"metrics.json").read_text()); validate_metrics(d)
                        if d["effective_prefill_chunk"] != effective_chunk or d["effective_mtp"] != (a.mtp == "on"): raise ValueError("effective configuration differs")
                        row["metrics"] = d
                        if any(row["after"][k] != row["before"][k] for k in ("swapins","swapouts")):
                            raise ValueError("swap activity during cell; timing excluded")
                        row["valid"] = True
                    except (OSError,ValueError,KeyError,RuntimeError,subprocess.TimeoutExpired) as e: row["exclusion"] = str(e)
                    (cell/"result.json").write_text(json.dumps(row,indent=2)+"\n")
                    with (a.out/"results.jsonl").open("a") as f: f.write(json.dumps(row)+"\n")
                    rows.append(row)
                    print(json.dumps({k:v for k,v in row.items() if k not in ("metrics","before","after","command","environment","host_before","host_after")}),flush=True)
    groups = {}
    for row in rows:
        if row["valid"]: groups.setdefault((row["prompt"],row["chunk"],row["arm"]),[]).append(row)
    summary = [{"prompt":k[0],"chunk":k[1],"arm":k[2],"valid_rounds":len(rs),
                "median_prefill_seconds":statistics.median(r["metrics"]["stats"]["prefillSeconds"] for r in rs),
                "median_request_seconds":statistics.median(r["metrics"]["stats"]["requestSeconds"] for r in rs),
                "prefill_records":[r["metrics"]["stats"]["prefillRecords"] for r in rs]} for k,rs in sorted(groups.items())]
    (a.out/"summary.json").write_text(json.dumps(summary,indent=2)+"\n")
    (a.out/"paired-summary.json").write_text(json.dumps(paired_summary(rows, next(iter(arms))), indent=2)+"\n")
    if not all(r["valid"] for r in rows): raise SystemExit(1)


if __name__ == "__main__": main()

````

Artifact `/Users/carlos/Projects/slotstream/Tools/process_cleanup_checks.py` — 3751 bytes, SHA-256 `2de6d823a4850662fda621cbe2df43aa869731e40530e7f286c9a2f289e6a982`.

````text
#!/usr/bin/env python3
"""Real-process checks for timeout cleanup, without weights or GPU work."""
import os
from pathlib import Path
import signal
import subprocess
import sys
import tempfile
import time
import unittest
from unittest.mock import patch

from prefill_bench import run_child


class ProcessCleanupChecks(unittest.TestCase):
    @staticmethod
    def live(pid):
        state = subprocess.run(['ps', '-p', str(pid), '-o', 'state='],
            capture_output=True, text=True, timeout=5).stdout.strip()
        return bool(state and not state.startswith('Z'))

    def drained(self, pids):
        until = time.monotonic() + 2
        while any(self.live(pid) for pid in pids) and time.monotonic() < until:
            time.sleep(.02)
        self.assertFalse([pid for pid in pids if self.live(pid)])

    @staticmethod
    def cleanup(pids):
        # IDs were emitted by our own new-session fixtures; no global sweep.
        for pid in pids:
            try: os.killpg(pid, signal.SIGKILL)
            except ProcessLookupError: pass

    def test_timeout_drains_separate_session_but_preserves_unrelated_sibling(self):
        sibling = subprocess.Popen([sys.executable, '-c', 'import time;time.sleep(60)'],
            start_new_session=True)
        ids = []
        try:
            with tempfile.TemporaryDirectory() as folder:
                out = Path(folder)
                script = '''import os,signal,time
if os.fork()==0:
 os.setsid();signal.signal(signal.SIGTERM,signal.SIG_IGN)
 print(os.getpid(),flush=True)
 time.sleep(60)
else:
 print(os.getpid(),flush=True)
 time.sleep(60)
'''
                try:
                    with self.assertRaises(subprocess.TimeoutExpired):
                        run_child([sys.executable, '-c', script], os.environ.copy(), out, 1)
                finally:
                    ids = [int(line) for line in (out/'stdout.txt').read_text().splitlines()]
                self.assertEqual(len(ids), 2)
                self.drained(ids)
                self.assertIsNone(sibling.poll())
        finally:
            self.cleanup(ids + [sibling.pid]); sibling.wait(timeout=5)

    def test_failed_or_timed_out_enumeration_still_drains_root_and_reports_limit(self):
        for error in [OSError('enumeration unavailable'), subprocess.TimeoutExpired('ps', 5)]:
            with self.subTest(error=type(error).__name__), tempfile.TemporaryDirectory() as folder:
                out = Path(folder); ids = []
                try:
                    with patch('prefill_bench.subprocess.check_output', side_effect=error):
                        with self.assertRaisesRegex(RuntimeError, 'full cleanup is unverified'):
                            run_child([sys.executable, '-c',
                                'import os,time;print(os.getpid(),flush=True);time.sleep(60)'],
                                os.environ.copy(), out, 1)
                    ids = [int(line) for line in (out/'stdout.txt').read_text().splitlines()]
                    self.assertEqual(len(ids), 1); self.drained(ids)
                finally:
                    if (out/'stdout.txt').exists():
                        ids = [int(line) for line in (out/'stdout.txt').read_text().splitlines()]
                    self.cleanup(ids)

    def test_normal_completion_does_not_run_cleanup_or_change_result(self):
        with tempfile.TemporaryDirectory() as folder, patch('prefill_bench.terminate_child_tree') as cleanup:
            code = run_child([sys.executable, '-c', 'print("done")'], os.environ.copy(), Path(folder), 5)
            self.assertEqual(code, 0); cleanup.assert_not_called()
            self.assertEqual((Path(folder)/'stdout.txt').read_text(), 'done\n')


if __name__ == '__main__': unittest.main()

````

Artifact `/Users/carlos/Projects/slotstream/Tools/static_gates.sh` — 951 bytes, SHA-256 `aff70a1d15c50632f702a9f9349f6a6ebee550b3a092624acf0fcd7c47cf6c93`.

````text
#!/bin/bash
# Fast, weights-free checks suitable for every pull request and release.
set -euo pipefail
cd "$(dirname "$0")/.."

for f in install.sh Tools/*.sh .githooks/*; do
  bash -n "$f"
done
sh -n install.sh
python3 -m py_compile Tools/*.py Tools/reference/*.py Tools/slotpack/*.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/process_cleanup_checks.py
Tools/llms_full.sh --check

# The brain: the store validates, MEASUREMENTS.md and PLAN.md match their
# records, and every public number still has its needle on its surfaces.
Tools/brain_gates.sh

(cd bench/parity31 && shasum -a 256 -c SHA256SUMS)

if grep -En 'File\(path: .*sha256: nil\)' Sources/Slotstream/PinnedModel.swift; then
  echo "pinned manifest contains an unhashed file" >&2
  exit 1
fi

.build/release/slotstream runtime-check
.build/release/slotstream pull-check
python3 Tools/slotpack/checks.py
Tools/planner_gates.sh
Tools/installer_gates.sh

echo "STATIC GATES PASS"

````

Artifact `/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/backend/metal/kernels/binary_ops.h` — 7014 bytes, SHA-256 `a3dd96bde609b3e91f1635f61c8a7477e0a111dc3c0beefefe0561d70629f91b`.

````text
// Copyright © 2023-2024 Apple Inc.

#pragma once

#include <metal_integer>
#include <metal_math>

constant mlx::os_log logger("mlx", "binary_ops");

struct Add {
  template <typename T>
  T operator()(T x, T y) {
    return x + y;
  }
};

struct FloorDivide {
  template <typename T>
  T operator()(T x, T y) {
    return x / y;
  }
  template <>
  float operator()(float x, float y) {
    return trunc(x / y);
  }
  template <>
  half operator()(half x, half y) {
    return trunc(x / y);
  }
  template <>
  bfloat16_t operator()(bfloat16_t x, bfloat16_t y) {
    return trunc(x / y);
  }
};

struct Divide {
  template <typename T>
  T operator()(T x, T y) {
    return x / y;
  }
};

struct Remainder {
  template <typename T>
  metal::enable_if_t<metal::is_integral_v<T> & !metal::is_signed_v<T>, T>
  operator()(T x, T y) {
    return x % y;
  }
  template <typename T>
  metal::enable_if_t<metal::is_integral_v<T> & metal::is_signed_v<T>, T>
  operator()(T x, T y) {
    auto r = x % y;
    if (r != 0 && (r < 0 != y < 0)) {
      r += y;
    }
    return r;
  }
  template <typename T>
  metal::enable_if_t<!metal::is_integral_v<T>, T> operator()(T x, T y) {
    T r = fmod(x, y);
    if (r != 0 && (r < 0 != y < 0)) {
      r += y;
    }
    return r;
  }
  template <>
  complex64_t operator()(complex64_t x, complex64_t y) {
    return x % y;
  }
};

struct Equal {
  template <typename T>
  bool operator()(T x, T y) {
    return x == y;
  }
};

struct NaNEqual {
  template <typename T>
  bool operator()(T x, T y) {
    return x == y || (metal::isnan(x) && metal::isnan(y));
  }
  template <>
  bool operator()(complex64_t x, complex64_t y) {
    return x == y ||
        (metal::isnan(x.real) && metal::isnan(y.real) && metal::isnan(x.imag) &&
         metal::isnan(y.imag)) ||
        (x.real == y.real && metal::isnan(x.imag) && metal::isnan(y.imag)) ||
        (metal::isnan(x.real) && metal::isnan(y.real) && x.imag == y.imag);
  }
};

struct Greater {
  template <typename T>
  bool operator()(T x, T y) {
    return x > y;
  }
};

struct GreaterEqual {
  template <typename T>
  bool operator()(T x, T y) {
    return x >= y;
  }
};

struct Less {
  template <typename T>
  bool operator()(T x, T y) {
    return x < y;
  }
};

struct LessEqual {
  template <typename T>
  bool operator()(T x, T y) {
    return x <= y;
  }
};

struct LogAddExp {
  template <typename T>
  T operator()(T x, T y) {
    if (metal::isnan(x) || metal::isnan(y)) {
      return metal::numeric_limits<T>::quiet_NaN();
    }
    constexpr T inf = metal::numeric_limits<T>::infinity();
    T maxval = metal::max(x, y);
    T minval = metal::min(x, y);
    return (minval == -inf || maxval == inf)
        ? maxval
        : (maxval + log1p(metal::exp(minval - maxval)));
  };

  complex64_t operator()(complex64_t x, complex64_t y) {
    if (metal::isnan(x.real) || metal::isnan(x.imag) || metal::isnan(y.real) ||
        metal::isnan(y.imag)) {
      return metal::numeric_limits<float>::quiet_NaN();
    }
    constexpr float inf = metal::numeric_limits<float>::infinity();
    complex64_t maxval = x > y ? x : y;
    complex64_t minval = x < y ? x : y;
    if (minval.real == -inf || maxval.real == inf)
      return maxval;
    float m = metal::exp(minval.real - maxval.real);
    complex64_t dexp{
        m * metal::cos(minval.imag - maxval.imag),
        m * metal::sin(minval.imag - maxval.imag),
    };
    return maxval + log1p(dexp);
  }
};

struct Maximum {
  template <typename T>
  metal::enable_if_t<metal::is_integral_v<T>, T> operator()(T x, T y) {
    return metal::max(x, y);
  }

  template <typename T>
  metal::enable_if_t<!metal::is_integral_v<T>, T> operator()(T x, T y) {
    if (metal::isnan(x)) {
      return x;
    }
    return x > y ? x : y;
  }

  template <>
  complex64_t operator()(complex64_t x, complex64_t y) {
    if (metal::isnan(x.real) || metal::isnan(x.imag)) {
      return x;
    }
    return x > y ? x : y;
  }
};

struct Minimum {
  template <typename T>
  metal::enable_if_t<metal::is_integral_v<T>, T> operator()(T x, T y) {
    return metal::min(x, y);
  }

  template <typename T>
  metal::enable_if_t<!metal::is_integral_v<T>, T> operator()(T x, T y) {
    if (metal::isnan(x)) {
      return x;
    }
    return x < y ? x : y;
  }

  template <>
  complex64_t operator()(complex64_t x, complex64_t y) {
    if (metal::isnan(x.real) || metal::isnan(x.imag)) {
      return x;
    }
    return x < y ? x : y;
  }
};

struct Multiply {
  template <typename T>
  T operator()(T x, T y) {
    return x * y;
  }
};

struct NotEqual {
  template <typename T>
  bool operator()(T x, T y) {
    return x != y;
  }
  template <>
  bool operator()(complex64_t x, complex64_t y) {
    return x.real != y.real || x.imag != y.imag;
  }
};

struct Power {
  template <typename T>
  metal::enable_if_t<!metal::is_integral_v<T>, T> operator()(T base, T exp) {
    return metal::pow(base, exp);
  }

  template <typename T>
  metal::enable_if_t<metal::is_integral_v<T>, T> operator()(T base, T exp) {
    T res = 1;
    // Undefined to raise integer to negative power
    if (exp < 0) {
      logger.log_debug(
          "int pow exp<0 (base=%ld exp=%ld)", (long)base, (long)exp);
      return 0;
    }

    while (exp) {
      if (exp & 1) {
        res *= base;
      }
      exp >>= 1;
      base *= base;
    }
    return res;
  }

  template <>
  complex64_t operator()(complex64_t x, complex64_t y) {
    if (x.real == 0 && x.imag == 0) {
      if (metal::isnan(y.real) || metal::isnan(y.imag)) {
        auto nan = metal::numeric_limits<float>::quiet_NaN();
        return {nan, nan};
      }
      return {0.0, 0.0};
    }
    auto x_theta = metal::atan2(x.imag, x.real);
    auto x_ln_r = 0.5 * metal::log(x.real * x.real + x.imag * x.imag);
    auto mag = metal::exp(y.real * x_ln_r - y.imag * x_theta);
    auto phase = y.imag * x_ln_r + y.real * x_theta;
    return {mag * metal::cos(phase), mag * metal::sin(phase)};
  }
};

struct Subtract {
  template <typename T>
  T operator()(T x, T y) {
    return x - y;
  }
};

struct LogicalAnd {
  template <typename T>
  T operator()(T x, T y) {
    return x && y;
  };
};

struct LogicalOr {
  template <typename T>
  T operator()(T x, T y) {
    return x || y;
  };
};

struct BitwiseAnd {
  template <typename T>
  T operator()(T x, T y) {
    return x & y;
  };
};

struct BitwiseOr {
  template <typename T>
  T operator()(T x, T y) {
    return x | y;
  };
};

struct BitwiseXor {
  template <typename T>
  T operator()(T x, T y) {
    return x ^ y;
  };
};

struct LeftShift {
  template <typename T>
  T operator()(T x, T y) {
    return x << y;
  };
};

struct RightShift {
  template <typename T>
  T operator()(T x, T y) {
    return x >> y;
  };
};

struct ArcTan2 {
  template <typename T>
  T operator()(T y, T x) {
    return metal::precise::atan2(y, x);
  }
};

struct DivMod {
  template <typename T>
  metal::array<T, 2> operator()(T x, T y) {
    return {FloorDivide{}(x, y), Remainder{}(x, y)};
  };
};

````

Artifact `/tmp/slotstream-context-implementation-20260906/child-cleanup-v1/fix.patch` — 1906 bytes, SHA-256 `321483c634c806b5d87aa78008913a0ba0208f121ccacd3f3f27bae0605d2b25`.

````text
--- a/Tools/prefill_bench.py
+++ b/Tools/prefill_bench.py
@@ -133,10 +133,32 @@
         try: return child.wait(timeout=timeout)
         finally:
             if child.poll() is None:
-                os.killpg(child.pid, signal.SIGTERM)
+                # SwiftPM can give Git/compiler descendants separate process
+                # groups. Capture their ownership before terminating the root,
+                # while their parent links still identify this exact task.
+                rows = [tuple(map(int, line.split())) for line in subprocess.check_output(
+                    ['ps', '-axo', 'pid=,ppid=,pgid='], text=True).splitlines() if line.strip()]
+                owned = {child.pid}
+                while True:
+                    expanded = owned | {pid for pid, parent, _ in rows if parent in owned}
+                    if expanded == owned: break
+                    owned = expanded
+                groups = {group for pid, _, group in rows if pid in owned}
+                # Only a group led by an owned process belongs to this child.
+                # Never signal an inherited group belonging to the caller.
+                groups &= owned
+                groups.add(child.pid)  # start_new_session=True above
+                def signal_owned(sig):
+                    for group in groups:
+                        try: os.killpg(group, sig)
+                        except ProcessLookupError: pass
+                signal_owned(signal.SIGTERM)
                 try: child.wait(timeout=10)
                 except subprocess.TimeoutExpired:
-                    os.killpg(child.pid, signal.SIGKILL); child.wait()
+                    signal_owned(signal.SIGKILL); child.wait()
+                finally:
+                    # The root can exit before a descendant ignoring TERM.
+                    signal_owned(signal.SIGKILL)
 
 
 def paired_summary(rows, reference):

````

Artifact `/tmp/slotstream-context-implementation-20260906/child-cleanup-v1/result.json` — 105 bytes, SHA-256 `fe7001b9840f5175724a55deaf914a25ccec59ef96c3ae627b9a24cc134130a8`.

````text
{"passed": true, "case": "timeout drains a separately grouped descendant ignoring TERM", "processes": 2}

````

Artifact `/tmp/slotstream-optimization-execution/child-cleanup-v188/manifest.json` — 871 bytes, SHA-256 `9e5953a779362064e9ac5b3b33af6816a7a7a345ffd58875e96e16e9192634b1`.

````text
{
  "files": [
    {
      "path": "Tools/prefill_bench.py",
      "before_sha256": "881c99dc2ba22d88acdcde116b7fbec4772cbd9646f400ad508bd8ee12b90de6",
      "after_sha256": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036"
    },
    {
      "path": "Tools/process_cleanup_checks.py",
      "after_sha256": "2de6d823a4850662fda621cbe2df43aa869731e40530e7f286c9a2f289e6a982",
      "merge_note": "use current separate-session fixture/static-gate invocation as base; preserve unrelated local changes"
    },
    {
      "path": "Tools/static_gates.sh",
      "after_sha256": "aff70a1d15c50632f702a9f9349f6a6ebee550b3a092624acf0fcd7c47cf6c93",
      "merge_note": "use current separate-session fixture/static-gate invocation as base; preserve unrelated local changes"
    }
  ],
  "native_run": false,
  "tests_passed": [
    3,
    7,
    49,
    5
  ]
}

````

Artifact `/tmp/slotstream-optimization-execution/child-cleanup-v188/pure-tests.txt` — 1292 bytes, SHA-256 `5ad0cbf2c5158b8b82dad401aee6b32a8752b3aa6041c79842443123f5ce2c46`.

````text
["python3", "Tools/process_cleanup_checks.py", "-v"]
test_failed_or_timed_out_enumeration_still_drains_root_and_reports_limit (__main__.ProcessCleanupChecks) ... ok
test_normal_completion_does_not_run_cleanup_or_change_result (__main__.ProcessCleanupChecks) ... ok
test_timeout_drains_separate_session_but_preserves_unrelated_sibling (__main__.ProcessCleanupChecks) ... ok

----------------------------------------------------------------------
Ran 3 tests in 3.102s

OK
["python3", "-m", "unittest", "discover", "-s", "Tools", "-p", "context_qualification_checks.py"]
.{"phase": "starting", "prompt_tokens": 16, "reclaimable_gb": 20.0}
{"prompt_tokens": 16, "passed": false, "error": "ValueError: capacity rung was incomplete, aborted or over its plan"}
......
----------------------------------------------------------------------
Ran 7 tests in 0.007s

OK
["python3", "-m", "unittest", "discover", "-s", "Tools", "-p", "prefill_bench_test.py"]
.................................................
----------------------------------------------------------------------
Ran 49 tests in 0.019s

OK
["python3", "-m", "unittest", "discover", "-s", "Tools", "-p", "indexer_score_probe_test.py"]
.....
----------------------------------------------------------------------
Ran 5 tests in 0.000s

OK

````

Artifact `/tmp/slotstream-optimization-execution/run_merged_native_v186.py` — 5384 bytes, SHA-256 `486f171fafd05c5d059de88ae85b8d65bd18c8b4f5826734bdd97e3a9cfd7ad0`.

````text
"""One explicitly granted <=25-minute correctness batch; never benchmarks."""
import hashlib, json, os, signal, subprocess, sys, time
from pathlib import Path

ROOT=Path('/Users/carlos/Projects/slotstream')
sys.path.insert(0,str(ROOT/'Tools'))
from optimization_build import build
from prefill_bench import digest, preflight, run_child, terminate_child_tree, vm_snapshot
from serve_bench import verified_build

QUEUE=Path('/tmp/slotstream-optimization-execution/merged-native-queue-v186.json')
spec=json.loads(QUEUE.read_text())
OUT=ROOT/'.build/optimization/merged-native-v186'
started=time.monotonic()
# Twenty-four minutes of work leaves a minute for owned-child cleanup/return.
deadline=started+1440
summary={'classification':'bounded correctness during authorized download overlap; no timing/capacity claim',
         'queue_sha256':digest(QUEUE),'batch_wall_limit_seconds':1500,'rows':[], 'passed':False}

def remaining(): return deadline-time.monotonic()
def interrupted(signum, frame): raise KeyboardInterrupt(f'signal {signum}')
signal.signal(signal.SIGTERM,interrupted)
signal.signal(signal.SIGINT,interrupted)

def bounded_build_run(command, **kwargs):
    child=subprocess.Popen(command, start_new_session=True, **kwargs)
    try:
        code=child.wait(timeout=max(1,min(420,remaining()-20)))
        return subprocess.CompletedProcess(command,code)
    finally:
        if child.poll() is None: terminate_child_tree(child)

def save():
    summary['elapsed_seconds']=time.monotonic()-started
    (OUT/'manifest.json').write_text(json.dumps(summary,indent=2)+'\n')

def native(binary, name, command, extra_env, ceiling=900, catalogue=False):
    if remaining()<min(ceiling + 20, 300): return False
    verified_build(binary)
    out=OUT/name;out.mkdir()
    env={k:v for k,v in os.environ.items() if not k.startswith('SLOTSTREAM_')}
    env.update(extra_env)
    row={'name':name,'binary':str(binary),'identity':verified_build(binary)['identity'],
         'command':[str(binary.parent/'slotstream-checks' if catalogue else binary),*command],
         'environment':extra_env,'passed':False,'required_reclaimable_gb':13,
         'classification':summary['classification']}
    summary['rows'].append(row)
    begin=time.monotonic()
    try:
        row['before']=preflight(13)
        row['timeout_seconds']=int(min(ceiling,remaining()-20))
        print(json.dumps({'phase':'starting','name':name,'timeout_seconds':row['timeout_seconds']}),flush=True)
        row['exit_code']=run_child(row['command'],env,out,row['timeout_seconds'])
        report=json.loads((out/'stdout.txt').read_text())
        if catalogue:
            checks=report.get('checks',[])
            row['checks_sha256']=digest(binary.parent/'slotstream-checks')
            row['groups']=len(checks)
            row['assertions']=sum(len(c.get('items',[])) for c in checks)
            row['passed']=(row['exit_code']==0 and len(checks)>0 and report.get('failed')==0
                and report.get('skipped')==0 and report.get('passed')==len(checks)
                and all(c.get('passed') is True for c in checks))
        else:
            row['assertions']=len(report.get('items',[]))
            row['passed']=(row['exit_code']==0 and report.get('passed') is True
                and not report.get('skipped') and row['assertions']>0
                and all(c.get('passed') is True for c in report['items']))
    except BaseException as error:
        row['error']=f'{type(error).__name__}: {error}'
        if isinstance(error,KeyboardInterrupt): raise
    finally:
        row['after']=vm_snapshot();row['duration_seconds']=time.monotonic()-begin
        for file in ['stdout.txt','stderr.txt']:
            if (out/file).exists():row[file+'_sha256']=digest(out/file)
        (out/'manifest.json').write_text(json.dumps(row,indent=2)+'\n')
        save()
        print(json.dumps({k:row[k] for k in ['name','passed','assertions','duration_seconds','error'] if k in row}),flush=True)
    if not row['passed']: raise RuntimeError(f'{name} failed; stopping the batch')
    return True

OUT.mkdir(exist_ok=False)
try:
    actual={str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest()
        for p in sorted((ROOT/'Sources').rglob('*')) if p.is_file()}
    if actual!=spec['reference_source_sha256']:raise ValueError('source changed since the reviewed queue')
    receipt=build(ROOT,ROOT/spec['build']['output'],jobs=2,required_gb=13,run=bounded_build_run)
    summary['build']=receipt
    if not receipt['passed']:raise RuntimeError('shared build failed; no native test launched')
    binary=ROOT/spec['build']['output']/'candidate/slotstream'
    if not native(binary,'t0',['--tier','t0','--json'],{},ceiling=60,catalogue=True):
        raise TimeoutError('batch deadline reached before T0')
    for row in spec['native']:
        if not native(binary,row['name'],row['command'],row['environment'],row['timeout_seconds']):
            summary['stopped_at_batch_boundary']=True
            break
    summary['passed']=all(r['passed'] for r in summary['rows'])
    summary['complete_queue']=len(summary['rows'])==len(spec['native'])+1
except BaseException as error:
    summary['error']=f'{type(error).__name__}: {error}'
finally:
    save()
print(json.dumps({k:v for k,v in summary.items() if k not in ('rows','build')}),flush=True)
raise SystemExit(0 if summary['passed'] else 1)

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/indexer-and-cleanup-review-v187-v188/schedule-math.json` — 489 bytes, SHA-256 `8fb91c15ddbd2843bf8e7c4089049b134ec460d37379ca462a44e0ec12dfb78e`.

````text
{
  "default_prefill_rows": 256,
  "published_context_tokens": 65536,
  "maximum_default_query_key_product": 16777216,
  "bounded_query_key_product": 32833536,
  "last_position_where_full256fits": 128000,
  "first_default256boundary_requiring_smaller_fullpass": 128256,
  "effect_of_tail_aware_flag_at_default256_within_published_window": "same logical passes; no speedup claim",
  "larger_chronological_family": "requires independent numerical qualification; previous candidate failed"
}

````
