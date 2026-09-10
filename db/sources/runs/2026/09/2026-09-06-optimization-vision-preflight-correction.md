---
type: run
id: 01m1vhyphg5em6wcq3wwt2dapk
created: 2026-09-06T14:28:58.544104+00:00
updated: 2026-09-06T14:29:19.959061+00:00
summary: Optimization vision protocol preflight correction V161
binary: No model or build; frozen binaries checked by SHA-256 only
captured_at: 2026-09-06
command: python3 -m unittest discover -s Tools -p prefill_bench_test.py; protocol-preflight-v161.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Optimization vision protocol preflight correction V161
tool: python3
---
Read-only final preflight review found that V159's memory validator admitted its narrowly declared 12 GB vision mechanism study, but image_fixtures still rejected every image protocol above 10 GB. No V159 model or performance run had started. The new regression test first reproduces that exact rejection: 46 tests, one error. The correction reuses the complete large-vision memory contract before reading image bytes and preserves ordinary image limits. Invalid capacities, budgets, output counts, MTP/prefix modes, raw requests and weakened resource guards remain rejected.

The corrected suite passes all 46 tests. A separate no-model preflight exercises all five queued frozen protocols through arm, work, resource, prefix, startup, contention, cooldown, binary/source identity, fixture, image and request serialization validation. All five pass with unchanged protocol bytes and verified native prerequisite digests. V155 requires 13 GB reclaimable; both V156 studies 11.1 GB before their existing runtime wrapper guards; V159 requires 18 GB and V160 13 GB. This is harness delivery evidence, not performance, capacity qualification or production-default adoption. The concurrent context task still owns the model/build interval; shared Sources are unchanged.

Artifacts follow, including the pre-fix harness and failed regression output. The predecessor declaration and its original 45-test evidence remain immutable in [[sources/runs/2026/09/2026-09-06-optimization-maximum-image-pool-correction]].

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/vision-preflight-v161/after.txt` — 145 bytes, SHA-256 `b5cbf5c099469bc7657869c1b6bf95461514022b109c4bec69cf5492bdeade46`.

````text
..............................................
----------------------------------------------------------------------
Ran 46 tests in 0.017s

OK

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/vision-preflight-v161/before.txt` — 891 bytes, SHA-256 `6262144ec1766cc02fc75e20bd26712d272e6c326e4e404a842343827084cc20`.

````text
....................E.........................
======================================================================
ERROR: test_large_vision_admission_reaches_request_serialization (prefill_bench_test.HarnessTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/prefill_bench_test.py", line 32, in test_large_vision_admission_reaches_request_serialization
    fixtures = serve_bench.image_fixtures(p)
  File "/Users/carlos/Projects/slotstream/Tools/serve_bench.py", line 369, in image_fixtures
    raise ValueError('image study requires one to four images, templates and at most 10 GB')
ValueError: image study requires one to four images, templates and at most 10 GB

----------------------------------------------------------------------
Ran 46 tests in 0.018s

FAILED (errors=1)

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/vision-preflight-v161/protocols.json` — 1927 bytes, SHA-256 `0cd40af8fe6f965d7eb00fc6cbb6ad5cfa922591afff9f80dde6da0a7c92b0a6`.

````text
{
  "kind": "static protocol preflight only; no server, model, build or performance run",
  "protocols": [
    {
      "protocol": "/Users/carlos/Projects/slotstream/.build/optimization/terminal-tail-serving-protocol-v155.json",
      "sha256": "2f9bcab3484dd03c92058d066b17436cb1c40362c5f2365c884ab28f4618f49a",
      "passed": true,
      "required_reclaimable_gb": 13,
      "images": 0,
      "request_bytes": 3046,
      "prerequisites_verified": 5
    },
    {
      "protocol": "/Users/carlos/Projects/slotstream/.build/optimization/gdn-projection-short-serving-protocol-v156.json",
      "sha256": "70173fa0f7bbe6da33b729f289be5b398599617548acab13ae394b48df4c2d4c",
      "passed": true,
      "required_reclaimable_gb": 11.1,
      "images": 0,
      "request_bytes": 222,
      "prerequisites_verified": 5
    },
    {
      "protocol": "/Users/carlos/Projects/slotstream/.build/optimization/gdn-projection-prefill-serving-protocol-v156.json",
      "sha256": "a6a29d28c6f389fabffa998eee09f1053ac06c98aa7c7b890a16247ec5a74602",
      "passed": true,
      "required_reclaimable_gb": 11.1,
      "images": 0,
      "request_bytes": 2559,
      "prerequisites_verified": 5
    },
    {
      "protocol": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-1536-12gb-protocol-v159.json",
      "sha256": "c7dcbf0dc06a700d7fb772fd115493c4919bea3e567ee94049fcbb7f9277c8d7",
      "passed": true,
      "required_reclaimable_gb": 18,
      "images": 1,
      "request_bytes": 12537,
      "prerequisites_verified": 7
    },
    {
      "protocol": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-1536-capacity-protocol-v160.json",
      "sha256": "249763ff5d17a05382545b33fc840e01855599229d955bee150ba7a2133e5325",
      "passed": true,
      "required_reclaimable_gb": 13,
      "images": 1,
      "request_bytes": 12537,
      "prerequisites_verified": 7
    }
  ],
  "passed": true
}

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/vision-preflight-v161/serve_bench-before.py` — 58618 bytes, SHA-256 `67dfd3430e4238359ffd4b81b980bb2353205688c5f4397cdf1e6f446c0e2d1c`.

````text
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import argparse
import base64
import fcntl
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import re
import shutil
import signal
import socket
import statistics
import subprocess
import time
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot, InsufficientHeadroom


def contention_guard(protocol):
    value = protocol.get('stop_on_workspace_contention', False)
    if type(value) is not bool: raise ValueError('workspace contention guard must be Boolean')
    return value


def competing_job_kind(executable, arguments):
    name = Path(executable).name
    if name == 'slotstream':
        prefix = executable if arguments.startswith(executable) else arguments.split(' ', 1)[0]
        if re.match(re.escape(prefix) + r'\s+pull(?:\s|$)', arguments): return 'checkpoint pull'
    if name in ['download-harness', 'slotstream-pull-bench']:
        return 'checkpoint download test'
    if name.lower().startswith('python') and re.search(
        r'(?:^|[ /])Tools/slotpack/(?:full_pull|publish_r2|pack|checks|download_checks|memory_checks|cli_checks|raw_checks)\.py(?:\s|$)', arguments):
        return 'checkpoint transport or packaging job'
    if name in ['swift-frontend', 'swiftc', 'swift-build']:
        return 'Swift build'
    return None


def competing_jobs(run=subprocess.run):
    """Read known long storage/build jobs. Never persist argv: it may contain
    private URLs or credentials. A snapshot is not continuous host isolation."""
    result = run(['ps', '-axo', 'pid=,comm='], capture_output=True, text=True, check=True, timeout=5)
    candidates = {}
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid, executable = int(fields[0]), fields[1]
        name = Path(executable).name
        if (pid != os.getpid() and (name.lower().startswith('python') or name in
            ['slotstream', 'download-harness', 'slotstream-pull-bench', 'swift-frontend', 'swiftc', 'swift-build'])):
            candidates[pid] = executable
    if not candidates: return []
    result = run(['ps', '-ww', '-p', ','.join(map(str, candidates)), '-o', 'pid=,args='],
                 capture_output=True, text=True, timeout=5)
    # A process can exit between snapshots. Other failures remain fail closed.
    if result.returncode not in (0, 1): raise RuntimeError('cannot inspect competing process arguments')
    jobs = []
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid = int(fields[0]); executable = candidates.get(pid)
        if executable is None: continue
        kind = competing_job_kind(executable, fields[1])
        if kind is not None: jobs.append({'pid': pid, 'executable': executable, 'kind': kind})
    return jobs


def workspace_quiet_requirement(protocol):
    value = protocol.get('initial_workspace_quiet')
    if value is None: return None
    if (type(value) is not dict or set(value) != {'stable_seconds', 'maximum_wait_seconds'}
        or not contention_guard(protocol)
        or type(value['stable_seconds']) is not int or not 1 <= value['stable_seconds'] <= 600
        or type(value['maximum_wait_seconds']) is not int
        or not value['stable_seconds'] <= value['maximum_wait_seconds'] <= 1800):
        raise ValueError('initial quiet interval requires the contention guard and bounded integer durations')
    return value


def wait_for_quiet_workspace(requirement, *, check=competing_jobs, now=time.monotonic, sleep=time.sleep):
    """A sampled quiet precondition before the study, never a timing cell.
    A newly observed known job resets the interval; time alone grants no pass."""
    started = now(); quiet_since = None; samples = blocked = 0; notified = started - 30
    while True:
        jobs = check(); current = now(); samples += 1
        if jobs:
            quiet_since = None; blocked += 1
        elif quiet_since is None:
            quiet_since = current
        quiet = 0 if quiet_since is None else current - quiet_since
        elapsed = current - started
        if quiet >= requirement['stable_seconds']:
            return {'wait_seconds': elapsed, 'quiet_seconds': quiet, 'samples': samples,
                    'samples_with_competing_work': blocked,
                    'classification': 'sampled known-job quiet interval, not continuous host isolation'}
        if elapsed >= requirement['maximum_wait_seconds']:
            raise TimeoutError('known workspace jobs did not leave the required quiet interval; no model launched')
        if current - notified >= 30:
            print(json.dumps({'phase': 'waiting for initial quiet workspace', 'seconds': round(elapsed, 1),
                              'quiet_seconds': round(quiet, 1), 'known_jobs': len(jobs)}), flush=True)
            notified = current
        sleep(min(2, requirement['maximum_wait_seconds'] - elapsed))


def fixed_pool_budget(protocol):
    """Explicit bounded mechanism study; memory_gb remains the measured ceiling.

    The native raw-pool control retains640slots when vision loads. This does
    not assert that the target-driven planner would choose the same pool.
    """
    if 'fixed_pool_slots' not in protocol:
        return None
    if type(protocol['fixed_pool_slots']) is not int or protocol['fixed_pool_slots'] != 640:
        raise ValueError('this fixed-pool mechanism study supports exactly640slots')
    if protocol.get('comparison_basis') != 'fixed-pool':
        raise ValueError('an explicit pool requires an explicit fixed-pool comparison')
    return 640 * 2_764_800 / 1e9


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if any(k in protocol for k in ['large_pool_measurement', 'large_scope_measurement', 'large_vision_measurement']):
            raise ValueError('large-memory declaration requires a target above 10 GB')
        return memory + 3
    vision_study = protocol.get('large_vision_measurement')
    if vision_study is not None:
        if ('large_pool_measurement' in protocol or 'large_scope_measurement' in protocol
            or not isinstance(vision_study, dict) or not isinstance(vision_study.get('purpose'), str)
            or not vision_study['purpose'].strip()):
            raise ValueError('choose one explicit large-vision measurement purpose')
        if (memory != 12 or fixed_pool_budget(protocol) is None
            or type(protocol.get('max_tokens')) is not int or protocol['max_tokens'] != 1
            or protocol.get('mtp') != 'off' or protocol.get('prefix_cache') is not None
            or not isinstance(protocol.get('images'), list) or len(protocol['images']) != 1):
            raise ValueError('large-vision mechanism study requires12GB,640slots,one image/one output, MTP and prefix reuse off')
        if (protocol.get('abort_on_resource_failure') is not True
            or protocol.get('require_nominal_power_state') is not True
            or type(protocol.get('maximum_sampled_footprint_bytes')) is not int
            or protocol['maximum_sampled_footprint_bytes'] != 12_000_000_000):
            raise ValueError('large-vision study requires exact12GB ceiling, nominal state and immediate resource stop')
        return memory + 6
    scope_study = protocol.get('large_scope_measurement')
    if scope_study is not None and 'large_pool_measurement' in protocol:
        raise ValueError('choose one declared large-memory study')
    study = scope_study if scope_study is not None else protocol.get('large_pool_measurement')
    if not isinstance(study, dict) or not isinstance(study.get('purpose'), str) or not study['purpose'].strip():
        raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
    if protocol.get('abort_on_resource_failure') is not True or protocol.get('require_nominal_power_state') is not True:
        raise ValueError('large-pool measurements require immediate resource stop and nominal operating conditions')
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if type(limit) is not int or limit != round(memory * 1e9):
        raise ValueError('large-pool measurements require an exact footprint limit at the memory target')
    if protocol.get('raw', True) is not True or protocol['max_tokens'] > 64:
        raise ValueError('large-pool component isolation permits raw text and at most 64 output tokens')
    if scope_study is not None:
        if memory != 16 or protocol['max_tokens'] > 4:
            raise ValueError('larger-scope qualification requires exactly16GB and at most4outputs')
        for arm in protocol['arms'].values():
            if (arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE','0') not in ['0','1024']
                or arm['env'].get('SLOTSTREAM_OPT_WORKSPACE_TILE','256') != '256'):
                raise ValueError('larger-scope qualification retains256-row compute and at most1024read scope')
        return memory + 6
    for arm in protocol['arms'].values():
        if arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE', '0') != '0' or arm['env'].get('SLOTSTREAM_OPT_LAYER_WORKSPACE', '0') != '0':
            raise ValueError('large-pool isolation requires ordinary bounded 256-row passes')
    return memory + 6


def workload_exclusions(stats, protocol):
    required = protocol.get('require_all_expert_hits', False)
    if type(required) is not bool: raise ValueError('require_all_expert_hits must be Boolean')
    if not required: return []
    if any(type(stats.get(k)) is not int or stats[k] != 0 for k in ['prefillRecords', 'decodeRecords']):
        return ['declared all-hit workload performed expert reads or lacks exact read counts']
    return []


def prefix_study(protocol):
    study = protocol.get('prefix_cache')
    if study is None: return None
    if (type(study) is not dict or 'expected_reused_tokens' not in study
        or not set(study) <= {'expected_reused_tokens', 'complete_prompt', 'retention_only', 'partial_prefix'}
        or type(study.get('complete_prompt', False)) is not bool
        or type(study.get('retention_only', False)) is not bool
        or type(study.get('partial_prefix', False)) is not bool):
        raise ValueError('prefix_cache requires an explicit expected_reused_tokens map')
    expected = study['expected_reused_tokens']
    if type(expected) is not dict or set(expected) != set(protocol['arms']):
        raise ValueError('prefix reuse expectations must cover exactly every arm')
    if any(type(n) is not int or not 0 <= n <= 4096 for n in expected.values()):
        raise ValueError('prefix reuse expectations must be integer counts from zero to 4096')
    if study.get('partial_prefix', False):
        if (study.get('retention_only', False) or study.get('complete_prompt', False)
            or expected.get('reference') != 0 or not any(expected.values())
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('partial-prefix study requires distinct frozen warmup and positive strict reuse')
    if study.get('retention_only', False):
        if (any(expected.values()) or study.get('complete_prompt', False)
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('retention-only study requires zero reuse and a separately frozen warmup fixture')
    elif expected['reference'] != 0 or not any(expected.values()):
        raise ValueError('prefix study requires zero reference reuse and a positive candidate')
    return expected


def warmup_fixture(protocol, measured_fixture):
    """A distinct input makes unique-request retention cost measurable while
    keeping prefix caching enabled. Existing studies warm the measured input."""
    fields = {'warmup_fixture', 'warmup_fixture_sha256'}
    supplied = fields.intersection(protocol)
    if not supplied: return measured_fixture
    study = protocol.get('prefix_cache') or {}
    if (supplied != fields or not (study.get('retention_only', False) or study.get('partial_prefix', False))
        or protocol['memory_gb'] > 10 or protocol.get('raw', True) is not True):
        raise ValueError('separate warmup requires a bounded raw retention or partial-prefix study')
    if any(type(protocol[k]) is not str or not protocol[k] for k in fields):
        raise ValueError('warmup path and hash must be nonempty strings')
    fixture = Path(protocol['warmup_fixture']).resolve()
    if digest(fixture) != protocol['warmup_fixture_sha256']: raise ValueError('warmup fixture identity mismatch')
    if not 1 <= fixture.stat().st_size <= 32768 or fixture.read_bytes() == measured_fixture.read_bytes():
        raise ValueError('warmup must be bounded, nonempty and distinct from the measured fixture')
    return fixture


def work_constraints(protocol):
    constraints = protocol.get('work_constraints')
    if constraints is None: return None
    allowed = {'prefillSlotCPUBatches', 'decodeSlotCPUBatches', 'decodeModelTokens',
               'decodeForwardPasses', 'prefillTokens', 'decodeTokens', 'verifyPasses',
               'draftedTokens', 'prefillRecords', 'decodeRecords', 'completePromptHits', 'completePromptStores',
               'encodedImages', 'reusedImageFeatures', 'prefixSkippedImages', 'visionQueryTile', 'visionQueryTileCalls', 'residentExpertPrelaunches', 'residentExpertJoins', 'fusedRoPERotationsScheduled', 'ropeTableHits', 'ropeTableBuilds', 'terminalQueryRowsSkipped', 'fusedGDNProjectionsScheduled', 'packedGDNProjectionLayers', 'packedGDNProjectionPayloadBytes'}
    if type(constraints) is not dict or set(constraints) != set(protocol['arms']):
        raise ValueError('work constraints must cover exactly every arm')
    for counters in constraints.values():
        if type(counters) is not dict or not counters or not set(counters) <= allowed:
            raise ValueError('unknown or empty work constraint counters')
        reader_pair = {'residentExpertPrelaunches', 'residentExpertJoins'}
        if set(counters) & reader_pair and not reader_pair <= set(counters):
            raise ValueError('resident overlap requires both submission and completed-join counters')
        for bounds in counters.values():
            if type(bounds) is not dict or not bounds or not set(bounds) <= {'min', 'max'}:
                raise ValueError('work bounds require min and/or max')
            if any(type(v) is not int or v < 0 for v in bounds.values()):
                raise ValueError('work bounds must be nonnegative integers')
            if bounds.get('min', 0) > bounds.get('max', float('inf')):
                raise ValueError('work minimum exceeds maximum')
    return constraints


def validate_work_observation(constraints, arm, stats):
    if constraints is None: return
    for counter, bounds in constraints[arm].items():
        value = stats.get(counter)
        if type(value) is not int or value < bounds.get('min', 0) or value > bounds.get('max', float('inf')):
            raise ValueError(f'{arm} work counter {counter} violates its frozen bounds')
    if 'residentExpertPrelaunches' in constraints[arm] and stats['residentExpertPrelaunches'] != stats['residentExpertJoins']:
        raise ValueError(f'{arm} submitted resident work without the same number of completed joins')


def cell_cooldown(protocol):
    value = protocol.get('between_cells_seconds', 0)
    if type(value) not in (int, float) or not math.isfinite(value) or not 0 <= value <= 60:
        raise ValueError('between_cells_seconds must be finite and between zero and 60')
    return value


def reservation_wait_limit(protocol):
    value = protocol.get('model_reservation_wait_seconds',0)
    if type(value) is not int or not 0 <= value <= 1800:
        raise ValueError('model_reservation_wait_seconds must be an integer from zero to1800')
    return value


def reserved_cooldown(seconds, wait_limit, lock_path=None):
    """Keep another model from heating the machine during a declared cooldown.

    Release before ordinary preflight/child launch. The native guard remains
    authoritative if another caller wins that handoff; no guard is bypassed.
    """
    if wait_limit == 0:
        time.sleep(seconds)
        return {'reserved':False,'wait_seconds':0}
    started=time.monotonic(); notified=-30.0
    with open(lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
        while True:
            try:
                fcntl.flock(lock,fcntl.LOCK_EX | fcntl.LOCK_NB)
                break
            except BlockingIOError:
                elapsed=time.monotonic()-started
                if elapsed >= wait_limit: raise TimeoutError('other model retained the lock beyond the declared reservation wait')
                if elapsed-notified >= 30:
                    print(json.dumps({'phase':'waiting for model reservation','seconds':round(elapsed,1)}),flush=True)
                    notified=elapsed
                time.sleep(min(2,wait_limit-elapsed))
        waited=time.monotonic()-started
        time.sleep(seconds)
        return {'reserved':True,'wait_seconds':waited}


def validate_prefix_observation(expected, name, warm, measured, *, complete_prompt=False, retention_only=False, partial_prefix=False):
    want = expected[name] if expected is not None else 0
    stats = measured['stats']
    if stats.get('reusedPrefixTokens') != want:
        raise ValueError('observed prefix reuse differs from the frozen workload')
    if expected is None: return
    if warm['stats'].get('reusedPrefixTokens') != 0:
        raise ValueError('fresh-server warmup unexpectedly reused state')
    if retention_only and (want != 0 or warm['prompt_ids'] == measured['prompt_ids']):
        raise ValueError('retention-only request must be unique and reuse zero tokens')
    if partial_prefix:
        if (warm['prompt_ids'] == measured['prompt_ids'] or stats.get('completePromptHits') != 0
            or warm['stats'].get('completePromptHits') != 0):
            raise ValueError('partial-prefix observation must have a different tail and no complete hit')
    full = complete_prompt and want > 0
    if ((len(measured['prompt_ids']) != want if full else len(measured['prompt_ids']) <= want)
        or warm['prompt_ids'][:want] != measured['prompt_ids'][:want]):
        raise ValueError('warmup did not create the measured strict prefix')
    if stats.get('prefixCheckpointForks') != int(want > 0):
        raise ValueError('measured request did not use the declared checkpoint fork')
    if warm['stats'].get('prefixCheckpointStores') != int(want > 0 and not full):
        raise ValueError('warmup did not create the declared checkpoint')
    if complete_prompt:
        if (stats.get('completePromptHits') != int(full)
            or warm['stats'].get('completePromptStores') != int(full)
            or warm['stats'].get('completePromptHits') != 0
            or (full and warm['prompt_ids'] != measured['prompt_ids'])):
            raise ValueError('complete prompt identity or retained-logit mechanism differs')
    for sample in [warm['stats'], stats]:
        if sample.get('prefixCheckpointErrors') != 0 or sample.get('prefixCheckpointRefusals') != 0:
            raise ValueError('checkpoint retention failed or exceeded its budget')


def wait_for_headroom(needed_gb, seconds):
    if type(seconds) not in (int, float) or not math.isfinite(seconds) or not 0 <= seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    start = time.monotonic()
    attempts = 0
    while True:
        attempts += 1
        try:
            snapshot = preflight(needed_gb)
            return snapshot, {'seconds': time.monotonic()-start, 'checks': attempts, 'limit_seconds': seconds}
        except InsufficientHeadroom:
            remaining = seconds - (time.monotonic()-start)
            if remaining <= 0: raise
            time.sleep(min(.25, remaining))


def image_fixtures(protocol):
    """Bounded, content-pinned inline images. Never resolve an image URL."""
    if 'images' not in protocol: return []
    images = protocol['images']
    if (type(images) is not list or not 1 <= len(images) <= 4
        or protocol.get('raw', True) is not False or protocol.get('memory_gb', 0) > 10):
        raise ValueError('image study requires one to four images, templates and at most 10 GB')
    result = []; total = 0
    for entry in images:
        if (type(entry) is not dict or set(entry) != {'path', 'sha256'}
            or type(entry['path']) is not str or not entry['path']
            or type(entry['sha256']) is not str):
            raise ValueError('image fixture requires an explicit path and SHA-256')
        path = Path(entry['path']).resolve()
        if not path.is_file() or not 1 <= path.stat().st_size <= 8 << 20:
            raise ValueError('image fixture is missing, empty or exceeds 8 MiB')
        with path.open('rb') as source: data = source.read((8 << 20) + 1)
        total += len(data)
        if not 1 <= len(data) <= 8 << 20 or total > 16 << 20 or hashlib.sha256(data).hexdigest() != entry['sha256']:
            raise ValueError('image identity differs or total exceeds 16 MiB')
        result.append((path, data))
    return result


def request_body(protocol, prompt, *, images=None):
    raw = protocol.get('raw', True)
    if type(raw) is not bool: raise ValueError('raw must be Boolean')
    body = {'prompt': prompt, 'raw': raw, 'stream': True,
            'options': {'temperature': 0, 'num_predict': protocol['max_tokens'], 'seed': protocol['seed']}}
    sampling = protocol.get('sampling', {})
    allowed = {'temperature', 'top_p', 'top_k', 'min_p', 'presence_penalty'}
    if type(sampling) is not dict or not set(sampling) <= allowed:
        raise ValueError('sampling must contain only declared sampler parameters')
    for key, value in sampling.items():
        if key == 'top_k':
            if type(value) is not int or not 0 <= value <= 248320:
                raise ValueError('top_k must be an integer in the pinned vocabulary range')
        elif type(value) not in (int, float) or not math.isfinite(value):
            raise ValueError(f'{key} must be a finite number')
        elif key == 'temperature' and not 0 <= value <= 10:
            raise ValueError('temperature must be between zero and ten')
        elif key == 'top_p' and not 0 < value <= 1:
            raise ValueError('top_p must be positive and at most one')
        elif key == 'min_p' and not 0 <= value <= 1:
            raise ValueError('min_p must be between zero and one')
        elif key == 'presence_penalty' and not -10 <= value <= 10:
            raise ValueError('presence_penalty must be between minus ten and ten')
    body['options'].update(sampling)
    if 'think' in protocol:
        if type(protocol['think']) is not bool: raise ValueError('think must be Boolean')
        if raw: raise ValueError('think is a template setting; use raw=false')
        body['think'] = protocol['think']
    if images is None: images = image_fixtures(protocol)
    if images:
        body['images'] = [base64.b64encode(data).decode('ascii') for _, data in images]
    return json.dumps(body).encode()


def resource_exclusions(stats, protocol):
    reasons = []
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if limit is not None:
        if type(limit) is not int or limit <= 0: raise ValueError('footprint limit must be a positive integer')
        observation = stats.get('sampledFootprint')
        peak = observation.get('peakBytes') if isinstance(observation, dict) else None
        if type(peak) is not int or peak <= 0:
            reasons.append('declared footprint gate has no valid sampled measurement')
        elif peak > limit:
            reasons.append('sampled physical footprint exceeds declared byte limit')
    require_nominal = protocol.get('require_nominal_power_state', False)
    if type(require_nominal) is not bool: raise ValueError('require_nominal_power_state must be Boolean')
    if require_nominal:
        for key in ['generatorSystemBefore', 'generatorSystemAfter']:
            state = stats.get(key)
            if not isinstance(state, dict) or state.get('thermalState') != 'nominal' or state.get('lowPowerModeEnabled') is not False:
                reasons.append('generator OS thermal/power state unavailable or non-nominal')
                break
    if protocol.get('images'):
        preparation = stats.get('imagePreparation') or {}
        observed = preparation.get('sampledFootprint') or {}
        image_peak = observed.get('peakBytes')
        if (type(image_peak) is not int or image_peak <= 0
            or type(observed.get('samples')) is not int or observed['samples'] <= 0):
            reasons.append('image preparation footprint observation missing')
        elif limit is not None and image_peak > limit:
            reasons.append('image preparation exceeds declared byte limit')
        for key in ['seconds', 'sourceDecodeSeconds', 'towerReadySeconds']:
            value = preparation.get(key)
            if type(value) not in (int, float) or not math.isfinite(value) or value < 0:
                reasons.append('image preparation timer missing or invalid')
                break
    return reasons


def exchange(port, body, timeout, *, allow_complete_prompt=False):
    conn = http.client.HTTPConnection('127.0.0.1', port, timeout=timeout)
    wire = bytearray(); frames = []
    first_delta = first_visible = None
    started = time.monotonic()
    try:
        conn.request('POST', '/api/generate', body, {'Content-Type':'application/json'})
        response = conn.getresponse()
        headers_at = time.monotonic() - started
        if response.status != 200:
            raise ValueError(f'HTTP {response.status}: {response.read(8192)!r}')
        while True:
            line = response.readline(1 << 20)
            if not line: break
            wire += line
            if len(wire) > 8 << 20: raise ValueError('response exceeds bounded capture')
            if not line.strip(): continue
            frame = json.loads(line); frames.append(frame)
            elapsed = time.monotonic() - started
            if first_delta is None and not frame.get('done') and (frame.get('response') or frame.get('thinking')):
                first_delta = elapsed
            if first_visible is None and frame.get('response', '').strip(): first_visible = elapsed
        elapsed = time.monotonic() - started
    finally: conn.close()
    finals = [f for f in frames if f.get('done')]
    if len(finals) != 1 or frames[-1] is not finals[0]: raise ValueError('missing or malformed completion framing')
    details = {'schema_version':1, **finals[0]['slotstream_benchmark']}
    validate_metrics(details, allow_complete_prompt=allow_complete_prompt)
    return {'client_seconds':elapsed, 'headers_seconds':headers_at,
            'first_protocol_delta_seconds':first_delta, 'first_visible_text_seconds':first_visible,
            'text':''.join(f.get('response','') for f in frames), 'metrics':details}, bytes(wire)


def stop_server(child):
    if child.poll() is None:
        os.killpg(child.pid, signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired:
            os.killpg(child.pid, signal.SIGKILL); child.wait()


def wait_ready(child, port):
    deadline = time.monotonic() + 120
    while time.monotonic() < deadline:
        if child.poll() is not None: raise RuntimeError(f'server exited {child.returncode}')
        conn = http.client.HTTPConnection('127.0.0.1', port, timeout=1)
        try:
            conn.request('GET','/api/version')
            response = conn.getresponse(); response.read(4096)
            if response.status == 200: return
        except (OSError, http.client.HTTPException): pass
        finally: conn.close()
        time.sleep(.25)
    raise TimeoutError('server startup timeout')


def sampled_request_peak(stats):
    """Highest sampled process footprint across generation and image preparation.

    These are successive intervals of the same process, so take their maximum,
    never their sum. Missing declared-stage evidence cannot prove a saving.
    """
    observations = [stats.get('sampledFootprint')]
    if 'imagePreparation' in stats:
        preparation = stats['imagePreparation']
        if not isinstance(preparation, dict): return None
        observations.append(preparation.get('sampledFootprint'))
    peaks = [value.get('peakBytes') if isinstance(value, dict) else None for value in observations]
    return max(peaks) if all(type(value) is int and value > 0 for value in peaks) else None


def summaries(rows, reference, comparison_basis='fixed-pool', required_equal_work=None):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
    fields = [] if required_equal_work is None else required_equal_work
    allowed = {'prefillRecords', 'decodeRecords', 'prefillTokens', 'decodeTokens',
               'decodeForwardPasses', 'decodeModelTokens', 'draftedTokens', 'verifyPasses'}
    if (type(fields) is not list or any(type(k) is not str or k not in allowed for k in fields)
            or len(fields) != len(set(fields))):
        raise ValueError('required_equal_work must contain unique supported work counters')
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round']==number}
            a,b = arms.get(reference),arms.get(candidate)
            if not a or not b or not a['valid'] or not b['valid']:
                excluded.append(number); continue
            am,bm = a['metrics'],b['metrics']
            equal_fields = ['prompt_ids', 'effective_mtp']
            if comparison_basis == 'fixed-pool': equal_fields.append('effective_pool_slots')
            if any(am[k]!=bm[k] for k in equal_fields):
                excluded.append(number); continue
            if any(type(am['stats'].get(k)) is not int or am['stats'][k] < 0
                   or type(bm['stats'].get(k)) is not int or am['stats'][k] != bm['stats'][k]
                   for k in fields):
                excluded.append(number); continue
            aseq, bseq = am['stats'].get('allocatedSequenceBytes'), bm['stats'].get('allocatedSequenceBytes')
            aactive, bactive = am['stats'].get('mlxActiveEndBytes'), bm['stats'].get('mlxActiveEndBytes')
            apeak = sampled_request_peak(am['stats'])
            bpeak = sampled_request_peak(bm['stats'])
            sequence_ok = all(type(v) is int and v > 0 for v in [aseq, bseq])
            active_ok = all(type(v) is int and v > 0 for v in [aactive, bactive])
            peak_ok = all(type(v) is int and v > 0 for v in [apeak, bpeak])
            pairs.append({'round':number,'client_reduction_fraction':1-b['client_seconds']/a['client_seconds'],
                'generator_reduction_fraction':1-bm['stats']['requestSeconds']/am['stats']['requestSeconds'],
                'sequence_reduction_fraction': 1-bseq/aseq if sequence_ok else None,
                'active_savings_share': (aactive-bactive)/(aseq-bseq) if sequence_ok and active_ok and aseq > bseq else None,
                'active_savings_bytes': aactive-bactive if active_ok else None,
                'sampled_peak_savings_bytes': apeak-bpeak if peak_ok else None,
                'output_ids_equal':am['output_ids']==bm['output_ids'], 'wire_text_equal':a['text']==b['text']})
        result.append({'reference':reference,'candidate':candidate,'comparison_basis':comparison_basis,
            'pairs':pairs,'excluded_rounds':excluded,
            'median_client_reduction_fraction':statistics.median(p['client_reduction_fraction'] for p in pairs) if pairs else None,
            'median_generator_reduction_fraction':statistics.median(p['generator_reduction_fraction'] for p in pairs) if pairs else None})
    return result


def acceptance_results(summary, contract):
    """Apply the frozen criterion without turning missing/unequal work into a win."""
    if contract is None: return None
    count = contract['minimum_pairs']
    non_regression = 'maximum_median_client_regression' in contract
    if non_regression and 'minimum_median_client_reduction' in contract:
        raise ValueError('choose one latency acceptance criterion')
    reduction_key = 'maximum_median_client_regression' if non_regression else 'minimum_median_client_reduction'
    reduction = contract[reduction_key]
    positive = contract['minimum_positive_fraction']
    if type(count) is not int or count < 1: raise ValueError('minimum_pairs must be a positive integer')
    for name, value in [(reduction_key, reduction), ('minimum_positive_fraction', positive)]:
        if type(value) not in [int, float] or not 0 <= value <= 1: raise ValueError(name + ' must be finite and in [0,1]')
    for key in ['minimum_sequence_reduction', 'minimum_active_savings_share']:
        if key in contract and (type(contract[key]) not in [int, float] or not 0 <= contract[key] <= 1):
            raise ValueError(key + ' must be finite and in [0,1]')
    for key in ['minimum_active_savings_bytes', 'minimum_sampled_peak_savings_bytes']:
        if key in contract and (type(contract[key]) is not int or contract[key] <= 0):
            raise ValueError(key + ' must be a positive integer')
    if contract.get('all_outputs_exact') is not True: raise ValueError('this acceptance contract requires exact outputs')
    result = []
    for item in summary:
        pairs = item['pairs']
        checks = {
            'minimum_pairs': len(pairs) >= count,
            ('median_client_non_regression' if non_regression else 'median_client_reduction'):
                item['median_client_reduction_fraction'] is not None
                and item['median_client_reduction_fraction'] >= (-reduction if non_regression else reduction),
            'positive_fraction': bool(pairs) and sum(p['client_reduction_fraction'] > 0 for p in pairs) / len(pairs) >= positive,
            'exact_outputs': bool(pairs) and all(p['output_ids_equal'] and p['wire_text_equal'] for p in pairs),
        }
        for criterion, metric in [('minimum_sequence_reduction', 'sequence_reduction_fraction'),
                                  ('minimum_active_savings_share', 'active_savings_share'),
                                  ('minimum_active_savings_bytes', 'active_savings_bytes'),
                                  ('minimum_sampled_peak_savings_bytes', 'sampled_peak_savings_bytes')]:
            if criterion in contract:
                values = [p.get(metric) for p in pairs]
                checks[criterion] = bool(values) and all(type(v) in [int, float] and math.isfinite(v)
                    and v >= contract[criterion] for v in values)
        result.append({'candidate': item['candidate'], 'passed': all(checks.values()), 'checks': checks})
    return result


def startup_summaries(rows, reference):
    """Fresh-process costs are separate from warmed request acceptance.

    Amortization uses a paired first-job excess divided by a positive paired
    steady-request saving. It is an estimate for repeating this exact job,
    never a claim about a cold filesystem or a different request mix.
    """
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round'] == number}
            a,b = arms.get(reference),arms.get(candidate)
            first_a,first_b = (a or {}).get('first_request'),(b or {}).get('first_request')
            if (not a or not b or not a['valid'] or not b['valid'] or not first_a or not first_b
                or not a.get('startup_and_warmup_valid') or not b.get('startup_and_warmup_valid')):
                excluded.append(number); continue
            fields = ['prompt_ids','output_ids','text','effective_pool_slots','effective_mtp']
            if any(first_a.get(k) != first_b.get(k) or first_a.get(k) is None for k in fields):
                excluded.append(number); continue
            durations = [a.get('startup_seconds'),b.get('startup_seconds'),
                         first_a.get('complete_seconds_from_launch'),first_b.get('complete_seconds_from_launch'),
                         a.get('client_seconds'),b.get('client_seconds')]
            if any(type(x) not in [float,int] or not math.isfinite(x) or x <= 0 for x in durations):
                excluded.append(number); continue
            excess = first_b['complete_seconds_from_launch']-first_a['complete_seconds_from_launch']
            saving = a['client_seconds']-b['client_seconds']
            pairs.append({'round':number,'startup_excess_seconds':b['startup_seconds']-a['startup_seconds'],
                          'first_job_excess_seconds':excess,'steady_request_saving_seconds':saving,
                          'estimated_total_jobs_to_amortize':1+math.ceil(max(0,excess)/saving) if saving > 0 else None})
        result.append({'candidate':candidate,'pairs':pairs,'excluded_rounds':excluded,
                       'median_startup_excess_seconds':statistics.median(p['startup_excess_seconds'] for p in pairs) if pairs else None,
                       'median_first_job_excess_seconds':statistics.median(p['first_job_excess_seconds'] for p in pairs) if pairs else None})
    return result


def verified_build(binary):
    binary = Path(binary).resolve()
    identity = json.loads((binary.parent / 'build-identity.json').read_text())
    for path, key in [(binary, 'binary_sha256'), (binary.parent / 'mlx.metallib', 'metallib_sha256'),
                      (binary.parent / 'build-source.tar.gz', 'source_archive_sha256')]:
        if digest(path) != identity[key]:
            raise ValueError(f'frozen identity mismatch: {path}')
    return {'binary': str(binary), 'identity': identity}


def validate_declared_binary(protocol, builds):
    expected = protocol.get('frozen_binary_sha256')
    if expected is None: return
    if type(expected) is not str or len(expected) != 64 or any(c not in '0123456789abcdef' for c in expected):
        raise ValueError('frozen_binary_sha256 must be a lowercase SHA-256 digest')
    if not builds or any(b['identity']['binary_sha256'] != expected for b in builds.values()):
        raise ValueError('an arm does not match the prospectively frozen binary SHA-256')


def validate_arms(arms):
    if type(arms) is not dict or not arms or 'reference' not in arms:
        raise ValueError('arms must include a reference')
    for name, arm in arms.items():
        if type(name) is not str or not name.replace('_', '').replace('-', '').isalnum():
            raise ValueError('unsafe arm name')
        if type(arm) is not dict or not {'chunk', 'env'} <= set(arm) or set(arm) - {'chunk', 'env', 'binary'}:
            raise ValueError('each arm requires chunk and env, with only an optional binary')
        if type(arm['chunk']) is not int or arm['chunk'] not in [256, 512, 1024, 2048, 4096]:
            raise ValueError('arm chunk must be a supported prefill size')
        if type(arm['env']) is not dict or any(type(k) is not str or not k.startswith('SLOTSTREAM_')
                or type(v) is not str for k, v in arm['env'].items()):
            raise ValueError('arm env requires explicit string SLOTSTREAM_ controls')
        if 'SLOTSTREAM_PREFILL_CHUNK' in arm['env'] and arm['env']['SLOTSTREAM_PREFILL_CHUNK'] != str(arm['chunk']):
            raise ValueError('arm chunk conflicts with its environment')
        if 'binary' in arm and (type(arm['binary']) is not str or not arm['binary']):
            raise ValueError('arm binary must be a nonempty path string')


def startup_acceptance_results(rows, reference, contract):
    """Optional first-job gate; never borrow swap-excluded warmups from steady timing."""
    if contract is None:
        return None
    keys = {'minimum_pairs', 'maximum_median_first_job_regression', 'all_outputs_exact'}
    if not isinstance(contract, dict) or set(contract) != keys:
        raise ValueError('startup acceptance requires exactly minimum_pairs, maximum_median_first_job_regression and all_outputs_exact')
    count, limit = contract['minimum_pairs'], contract['maximum_median_first_job_regression']
    if type(count) is not int or count < 1:
        raise ValueError('startup minimum_pairs must be a positive integer')
    if type(limit) not in [int, float] or not 0 <= limit <= 1:
        raise ValueError('startup regression limit must be finite and in [0,1]')
    if contract['all_outputs_exact'] is not True:
        raise ValueError('startup acceptance requires exact outputs')
    by_cell = {(r['round'], r['arm']): r for r in rows}
    results = []
    for summary in startup_summaries(rows, reference):
        changes = []
        for pair in summary['pairs']:
            a = by_cell[pair['round'], reference]['first_request']['complete_seconds_from_launch']
            b = by_cell[pair['round'], summary['candidate']]['first_request']['complete_seconds_from_launch']
            changes.append(1 - b / a)
        median = statistics.median(changes) if changes else None
        checks = {'minimum_pairs': len(changes) >= count,
                  'median_first_job_non_regression': median is not None and median >= -limit}
        results.append({'candidate': summary['candidate'], 'passed': all(checks.values()),
            'checks': checks, 'eligible_rounds': [p['round'] for p in summary['pairs']],
            'excluded_rounds': summary['excluded_rounds'], 'median_first_job_reduction_fraction': median})
    return results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    validate_arms(protocol.get('arms'))
    expected_prefix = prefix_study(protocol)
    complete_prompt = (protocol.get('prefix_cache') or {}).get('complete_prompt', False)
    retention_only = (protocol.get('prefix_cache') or {}).get('retention_only', False)
    partial_prefix = (protocol.get('prefix_cache') or {}).get('partial_prefix', False)
    expected_work = work_constraints(protocol)
    startup_acceptance_results([], next(iter(protocol['arms'])), protocol.get('startup_acceptance'))
    stop_on_contention = contention_guard(protocol)
    initial_quiet = workspace_quiet_requirement(protocol)
    cooldown = cell_cooldown(protocol)
    reservation_wait = reservation_wait_limit(protocol)
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    explicit_pool_gb = fixed_pool_budget(protocol)
    required_equal_work = protocol.get('required_equal_work')
    summaries([], 'reference', comparison_basis, required_equal_work)
    acceptance_results([], protocol.get('acceptance'))
    abort_on_resource_failure = protocol.get('abort_on_resource_failure', False)
    if type(abort_on_resource_failure) is not bool: raise ValueError('abort_on_resource_failure must be Boolean')
    resource_exclusions({}, protocol)  # Validate declared types before loading.
    arms=protocol['arms']; model=Path(protocol['model']).resolve(); binary=Path(protocol['binary']).resolve()
    if protocol.get('acceptance') is not None and len(arms) < 2:
        raise ValueError('paired acceptance requires reference and candidate arms')
    required_memory = measurement_memory(protocol)
    settle_seconds = protocol.get('memory_settle_seconds', 0)
    if type(settle_seconds) not in (int, float) or not math.isfinite(settle_seconds) or not 0 <= settle_seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    workload_exclusions({}, protocol)  # Validate the declaration before startup.
    if protocol['rounds']<1 or not 1<=protocol['max_tokens']<=512:
        parser.error('bounded memory, rounds and output required')
    if any(not name.replace('_','').replace('-','').isalnum() for name in arms): parser.error('unsafe arm name')
    identity = verified_build(binary)['identity']
    arm_builds = {name: verified_build(arm.get('binary', binary)) for name, arm in arms.items()}
    validate_declared_binary(protocol, arm_builds)
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
    warm_fixture = warmup_fixture(protocol, fixture)
    images = image_fixtures(protocol)
    if protocol['memory_gb'] > 10:
        fixture_limit = 32768 if protocol.get('large_scope_measurement') is not None else 2048
        if fixture.stat().st_size > fixture_limit:
            raise ValueError(f'large-memory study fixture exceeds its {fixture_limit}-byte bound')
    a.out=a.out.resolve(); a.out.mkdir(parents=True,exist_ok=False)
    shutil.copyfile(fixture,a.out/'fixture.txt'); shutil.copyfile(binary.parent/'build-source.tar.gz',a.out/'build-source.tar.gz')
    for name, build in arm_builds.items():
        shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', a.out / f'{name}-build-source.tar.gz')
    harness_sources = {}
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:
        harness_sources[source.name] = digest(source)
        shutil.copyfile(source, a.out/source.name)
    (a.out/'manifest.json').write_text(json.dumps({'protocol':protocol,'protocol_sha256':digest(a.protocol),
        'identity':identity,'model':model_identity(model),'harness_sha256':digest(Path(__file__)),
        'harness_sources': harness_sources, 'arm_builds': arm_builds},indent=2)+'\n')
    for i, (image_path, data) in enumerate(images):
        (a.out / f'image-{i}{image_path.suffix}').write_bytes(data)
    body=request_body(protocol, fixture.read_text(), images=images)
    warm_body = request_body(protocol, warm_fixture.read_text(), images=images)
    (a.out/'request.json').write_bytes(body)
    if warm_fixture != fixture:
        shutil.copyfile(warm_fixture, a.out/'warmup-fixture.txt')
        (a.out/'warmup-request.json').write_bytes(warm_body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
    if initial_quiet is not None:
        quiet_record = {'requirement': initial_quiet, 'passed': False}
        try:
            quiet_record.update(wait_for_quiet_workspace(initial_quiet), passed=True)
        except (Exception, KeyboardInterrupt) as error:
            quiet_record['error'] = f'{type(error).__name__}: {error}'
        (a.out/'initial-workspace-quiet.json').write_text(json.dumps(quiet_record, indent=2)+'\n')
        if not quiet_record['passed']:
            (a.out/'completion.json').write_text(json.dumps({'stopped_early': True,
                'planned_cells': protocol['rounds'] * len(arms), 'recorded_cells': 0,
                'error': quiet_record['error'], 'acceptance': []}, indent=2)+'\n')
            print(json.dumps(quiet_record), flush=True)
            return 1
    stop_requested = False
    interrupted = False
    for number in range(1,protocol['rounds']+1):
        order=list(arms) if number%2 else list(reversed(arms))
        for name in order:
            arm=arms[name]; cell=a.out/f'{number}-{name}'; cell.mkdir()
            env=clean_env|arm['env']|{'SLOTSTREAM_BENCH_DETAILS':'1','SLOTSTREAM_PREFILL_CHUNK':str(arm['chunk'])}
            extra=max(0,arm['chunk']-256)*1.30e-3
            if env.get('SLOTSTREAM_OPT_LAYER_WORKSPACE')=='1': extra+=2
            if env.get('SLOTSTREAM_OPT_ROUTER_WEIGHTS')=='1': extra+=.3
            scope=int(env.get('SLOTSTREAM_OPT_READ_SCOPE','0'))
            if scope: extra+=max(0,scope-arm['chunk'])*1.30e-3+.12
            row={'round':number,'arm':name,'valid':False,'extra_preflight_allowance_gb':extra,
                 'env':{k:v for k,v in env.items() if k.startswith('SLOTSTREAM_')}}
            child=None
            try:
                if stop_on_contention:
                    row['competing_jobs_before_cooldown'] = competing_jobs()
                    if row['competing_jobs_before_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job; stopped before cooldown or model launch')
                row['cooldown_seconds'] = cooldown
                if cooldown:
                    print(json.dumps({'round':number,'arm':name,'phase':'before-cell cooldown','seconds':cooldown}),flush=True)
                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)
                if stop_on_contention:
                    row['competing_jobs_after_cooldown'] = competing_jobs()
                    if row['competing_jobs_after_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job appeared during cooldown; model not launched')
                try:
                    row['before_startup'], row['headroom_settle'] = wait_for_headroom(required_memory+extra, settle_seconds)
                except Exception:
                    if abort_on_resource_failure: stop_requested = True
                    raise
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                memory_args = (['--pool-gb', str(explicit_pool_gb)] if explicit_pool_gb is not None
                               else ['--memory-gb', str(protocol['memory_gb'])])
                command=[arm_builds[name]['binary'],'serve','--port',str(port),'--model',str(model), *memory_args,
                         '--mtp',protocol.get('mtp','off'),'--no-elastic']
                if expected_prefix is None: command.append('--no-prefix-cache')
                if protocol.get('large_scope_measurement') is not None:
                    # Bound active context independently of any evolving default
                    # while allowing the declared approximately4k-token fixture.
                    command.extend(['--max-context','8192'])
                row['command']=command
                with (cell/'server.stdout').open('wb') as out, (cell/'server.stderr').open('wb') as err:
                    launched_at=time.monotonic()
                    child=subprocess.Popen(command,cwd=ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
                    wait_ready(child,port)
                    row['startup_seconds']=time.monotonic()-launched_at
                    row['after_startup_vm']=vm_snapshot()
                    warm,wire=exchange(port,warm_body,protocol.get('timeout_seconds',600))
                    row['first_request']={k:warm['metrics'][k] for k in ['prompt_ids','output_ids','effective_pool_slots','effective_mtp']}
                    row['first_request'].update(text=warm['text'],complete_seconds_from_launch=time.monotonic()-launched_at)
                    row['after_warmup_vm']=vm_snapshot()
                    row['startup_and_warmup_valid']=not resource_exclusions(warm['metrics']['stats'],protocol) and (
                        warm['metrics']['stats']['decodeTokens'] >= protocol.get('minimum_output_tokens',0)) and all(
                        row['before_startup'][key]==row['after_warmup_vm'][key] for key in ['swapins','swapouts'])
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
                    if stop_on_contention:
                        row['competing_jobs_after_warmup'] = competing_jobs()
                        if row['competing_jobs_after_warmup']:
                            stop_requested = True
                            raise RuntimeError('competing storage/build job appeared during warmup; measurement not started')
                    if abort_on_resource_failure:
                        warm_exclusions = resource_exclusions(warm['metrics']['stats'], protocol)
                        if protocol['memory_gb'] > 10:
                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]
                                   for key in ['swapins', 'swapouts']):
                                warm_exclusions.append('swap activity during large-pool startup/warmup')
                        if warm_exclusions:
                            stop_requested = True
                            row['exclusion'] = 'warmup resource gate: ' + '; '.join(warm_exclusions)
                            raise RuntimeError('declared resource stop before measurement')
                    row['host_before']=host_conditions()
                    row['before']=vm_snapshot()
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600),
                        allow_complete_prompt=complete_prompt and expected_prefix[name] > 0)
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    if stop_on_contention:
                        row['competing_jobs_after_measurement'] = competing_jobs()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if explicit_pool_gb is not None and m['effective_pool_slots'] != protocol['fixed_pool_slots']:
                        raise ValueError('effective pool differs from the frozen explicit capacity')
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    validate_prefix_observation(expected_prefix, name, warm['metrics'], m,
                        complete_prompt=complete_prompt, retention_only=retention_only, partial_prefix=partial_prefix)
                    validate_work_observation(expected_work, name, s)
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
                    if stop_on_contention and row.get('competing_jobs_after_measurement'):
                        exclusions.append('known competing storage/build job observed after measurement')
                        stop_requested = True
                    if exclusions and abort_on_resource_failure: stop_requested = True
                    exclusions += workload_exclusions(s, protocol)
                    if changed: exclusions.append('swap activity during measured request; pair excluded')
                    row['valid']=not exclusions
                    if exclusions: row['exclusion']='; '.join(exclusions)
            except KeyboardInterrupt:
                row['interrupted'] = True
                row['error'] = 'KeyboardInterrupt: measured result incomplete; owned server stopped'
                interrupted = stop_requested = True
            except Exception as e: row['error']=f'{type(e).__name__}: {e}'
            finally:
                if child is not None: stop_server(child)
            (cell/'result.json').write_text(json.dumps(row,indent=2)+'\n')
            rows.append(row)
            with (a.out/'results.jsonl').open('a') as log: log.write(json.dumps(row)+'\n')
            progress = {k:v for k,v in row.items() if k in ['round','arm','valid','client_seconds','error','exclusion']}
            if 'metrics' in row:
                stats = row['metrics']['stats']
                progress['decode_records'] = stats.get('decodeRecords')
                if 'decodeLocalVictims' in stats: progress['local_victims'] = stats['decodeLocalVictims']
                if protocol.get('acceptance', {}).get('minimum_sequence_reduction') is not None:
                    progress['sequence_bytes'] = stats.get('allocatedSequenceBytes')
                    progress['mlx_active_bytes'] = stats.get('mlxActiveEndBytes')
            print(json.dumps(progress),flush=True)
            if stop_requested: break
        if stop_requested: break
    summary=summaries(rows,next(iter(arms)),comparison_basis,required_equal_work)
    (a.out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    (a.out/'startup-summary.json').write_text(json.dumps(startup_summaries(rows,next(iter(arms))),indent=2)+'\n')
    assessment = acceptance_results(summary, protocol.get('acceptance'))
    startup_assessment = startup_acceptance_results(rows, next(iter(arms)), protocol.get('startup_acceptance'))
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment, 'startup_acceptance': startup_assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    if startup_assessment is not None and not all(r['passed'] for r in startup_assessment): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())

````

Artifact `/Users/carlos/Projects/slotstream/Tools/serve_bench.py` — 58963 bytes, SHA-256 `07578c3779607f281a15ba99030315ddc31a82f288b10da39f190a51efbf6637`.

````text
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import argparse
import base64
import fcntl
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import re
import shutil
import signal
import socket
import statistics
import subprocess
import time
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot, InsufficientHeadroom


def contention_guard(protocol):
    value = protocol.get('stop_on_workspace_contention', False)
    if type(value) is not bool: raise ValueError('workspace contention guard must be Boolean')
    return value


def competing_job_kind(executable, arguments):
    name = Path(executable).name
    if name == 'slotstream':
        prefix = executable if arguments.startswith(executable) else arguments.split(' ', 1)[0]
        if re.match(re.escape(prefix) + r'\s+pull(?:\s|$)', arguments): return 'checkpoint pull'
    if name in ['download-harness', 'slotstream-pull-bench']:
        return 'checkpoint download test'
    if name.lower().startswith('python') and re.search(
        r'(?:^|[ /])Tools/slotpack/(?:full_pull|publish_r2|pack|checks|download_checks|memory_checks|cli_checks|raw_checks)\.py(?:\s|$)', arguments):
        return 'checkpoint transport or packaging job'
    if name in ['swift-frontend', 'swiftc', 'swift-build']:
        return 'Swift build'
    return None


def competing_jobs(run=subprocess.run):
    """Read known long storage/build jobs. Never persist argv: it may contain
    private URLs or credentials. A snapshot is not continuous host isolation."""
    result = run(['ps', '-axo', 'pid=,comm='], capture_output=True, text=True, check=True, timeout=5)
    candidates = {}
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid, executable = int(fields[0]), fields[1]
        name = Path(executable).name
        if (pid != os.getpid() and (name.lower().startswith('python') or name in
            ['slotstream', 'download-harness', 'slotstream-pull-bench', 'swift-frontend', 'swiftc', 'swift-build'])):
            candidates[pid] = executable
    if not candidates: return []
    result = run(['ps', '-ww', '-p', ','.join(map(str, candidates)), '-o', 'pid=,args='],
                 capture_output=True, text=True, timeout=5)
    # A process can exit between snapshots. Other failures remain fail closed.
    if result.returncode not in (0, 1): raise RuntimeError('cannot inspect competing process arguments')
    jobs = []
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid = int(fields[0]); executable = candidates.get(pid)
        if executable is None: continue
        kind = competing_job_kind(executable, fields[1])
        if kind is not None: jobs.append({'pid': pid, 'executable': executable, 'kind': kind})
    return jobs


def workspace_quiet_requirement(protocol):
    value = protocol.get('initial_workspace_quiet')
    if value is None: return None
    if (type(value) is not dict or set(value) != {'stable_seconds', 'maximum_wait_seconds'}
        or not contention_guard(protocol)
        or type(value['stable_seconds']) is not int or not 1 <= value['stable_seconds'] <= 600
        or type(value['maximum_wait_seconds']) is not int
        or not value['stable_seconds'] <= value['maximum_wait_seconds'] <= 1800):
        raise ValueError('initial quiet interval requires the contention guard and bounded integer durations')
    return value


def wait_for_quiet_workspace(requirement, *, check=competing_jobs, now=time.monotonic, sleep=time.sleep):
    """A sampled quiet precondition before the study, never a timing cell.
    A newly observed known job resets the interval; time alone grants no pass."""
    started = now(); quiet_since = None; samples = blocked = 0; notified = started - 30
    while True:
        jobs = check(); current = now(); samples += 1
        if jobs:
            quiet_since = None; blocked += 1
        elif quiet_since is None:
            quiet_since = current
        quiet = 0 if quiet_since is None else current - quiet_since
        elapsed = current - started
        if quiet >= requirement['stable_seconds']:
            return {'wait_seconds': elapsed, 'quiet_seconds': quiet, 'samples': samples,
                    'samples_with_competing_work': blocked,
                    'classification': 'sampled known-job quiet interval, not continuous host isolation'}
        if elapsed >= requirement['maximum_wait_seconds']:
            raise TimeoutError('known workspace jobs did not leave the required quiet interval; no model launched')
        if current - notified >= 30:
            print(json.dumps({'phase': 'waiting for initial quiet workspace', 'seconds': round(elapsed, 1),
                              'quiet_seconds': round(quiet, 1), 'known_jobs': len(jobs)}), flush=True)
            notified = current
        sleep(min(2, requirement['maximum_wait_seconds'] - elapsed))


def fixed_pool_budget(protocol):
    """Explicit bounded mechanism study; memory_gb remains the measured ceiling.

    The native raw-pool control retains640slots when vision loads. This does
    not assert that the target-driven planner would choose the same pool.
    """
    if 'fixed_pool_slots' not in protocol:
        return None
    if type(protocol['fixed_pool_slots']) is not int or protocol['fixed_pool_slots'] != 640:
        raise ValueError('this fixed-pool mechanism study supports exactly640slots')
    if protocol.get('comparison_basis') != 'fixed-pool':
        raise ValueError('an explicit pool requires an explicit fixed-pool comparison')
    return 640 * 2_764_800 / 1e9


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if any(k in protocol for k in ['large_pool_measurement', 'large_scope_measurement', 'large_vision_measurement']):
            raise ValueError('large-memory declaration requires a target above 10 GB')
        return memory + 3
    vision_study = protocol.get('large_vision_measurement')
    if vision_study is not None:
        if ('large_pool_measurement' in protocol or 'large_scope_measurement' in protocol
            or not isinstance(vision_study, dict) or not isinstance(vision_study.get('purpose'), str)
            or not vision_study['purpose'].strip()):
            raise ValueError('choose one explicit large-vision measurement purpose')
        if (memory != 12 or fixed_pool_budget(protocol) is None
            or type(protocol.get('max_tokens')) is not int or protocol['max_tokens'] != 1
            or protocol.get('mtp') != 'off' or protocol.get('prefix_cache') is not None
            or not isinstance(protocol.get('images'), list) or len(protocol['images']) != 1):
            raise ValueError('large-vision mechanism study requires12GB,640slots,one image/one output, MTP and prefix reuse off')
        if (protocol.get('abort_on_resource_failure') is not True
            or protocol.get('require_nominal_power_state') is not True
            or type(protocol.get('maximum_sampled_footprint_bytes')) is not int
            or protocol['maximum_sampled_footprint_bytes'] != 12_000_000_000):
            raise ValueError('large-vision study requires exact12GB ceiling, nominal state and immediate resource stop')
        return memory + 6
    scope_study = protocol.get('large_scope_measurement')
    if scope_study is not None and 'large_pool_measurement' in protocol:
        raise ValueError('choose one declared large-memory study')
    study = scope_study if scope_study is not None else protocol.get('large_pool_measurement')
    if not isinstance(study, dict) or not isinstance(study.get('purpose'), str) or not study['purpose'].strip():
        raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
    if protocol.get('abort_on_resource_failure') is not True or protocol.get('require_nominal_power_state') is not True:
        raise ValueError('large-pool measurements require immediate resource stop and nominal operating conditions')
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if type(limit) is not int or limit != round(memory * 1e9):
        raise ValueError('large-pool measurements require an exact footprint limit at the memory target')
    if protocol.get('raw', True) is not True or protocol['max_tokens'] > 64:
        raise ValueError('large-pool component isolation permits raw text and at most 64 output tokens')
    if scope_study is not None:
        if memory != 16 or protocol['max_tokens'] > 4:
            raise ValueError('larger-scope qualification requires exactly16GB and at most4outputs')
        for arm in protocol['arms'].values():
            if (arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE','0') not in ['0','1024']
                or arm['env'].get('SLOTSTREAM_OPT_WORKSPACE_TILE','256') != '256'):
                raise ValueError('larger-scope qualification retains256-row compute and at most1024read scope')
        return memory + 6
    for arm in protocol['arms'].values():
        if arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE', '0') != '0' or arm['env'].get('SLOTSTREAM_OPT_LAYER_WORKSPACE', '0') != '0':
            raise ValueError('large-pool isolation requires ordinary bounded 256-row passes')
    return memory + 6


def workload_exclusions(stats, protocol):
    required = protocol.get('require_all_expert_hits', False)
    if type(required) is not bool: raise ValueError('require_all_expert_hits must be Boolean')
    if not required: return []
    if any(type(stats.get(k)) is not int or stats[k] != 0 for k in ['prefillRecords', 'decodeRecords']):
        return ['declared all-hit workload performed expert reads or lacks exact read counts']
    return []


def prefix_study(protocol):
    study = protocol.get('prefix_cache')
    if study is None: return None
    if (type(study) is not dict or 'expected_reused_tokens' not in study
        or not set(study) <= {'expected_reused_tokens', 'complete_prompt', 'retention_only', 'partial_prefix'}
        or type(study.get('complete_prompt', False)) is not bool
        or type(study.get('retention_only', False)) is not bool
        or type(study.get('partial_prefix', False)) is not bool):
        raise ValueError('prefix_cache requires an explicit expected_reused_tokens map')
    expected = study['expected_reused_tokens']
    if type(expected) is not dict or set(expected) != set(protocol['arms']):
        raise ValueError('prefix reuse expectations must cover exactly every arm')
    if any(type(n) is not int or not 0 <= n <= 4096 for n in expected.values()):
        raise ValueError('prefix reuse expectations must be integer counts from zero to 4096')
    if study.get('partial_prefix', False):
        if (study.get('retention_only', False) or study.get('complete_prompt', False)
            or expected.get('reference') != 0 or not any(expected.values())
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('partial-prefix study requires distinct frozen warmup and positive strict reuse')
    if study.get('retention_only', False):
        if (any(expected.values()) or study.get('complete_prompt', False)
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('retention-only study requires zero reuse and a separately frozen warmup fixture')
    elif expected['reference'] != 0 or not any(expected.values()):
        raise ValueError('prefix study requires zero reference reuse and a positive candidate')
    return expected


def warmup_fixture(protocol, measured_fixture):
    """A distinct input makes unique-request retention cost measurable while
    keeping prefix caching enabled. Existing studies warm the measured input."""
    fields = {'warmup_fixture', 'warmup_fixture_sha256'}
    supplied = fields.intersection(protocol)
    if not supplied: return measured_fixture
    study = protocol.get('prefix_cache') or {}
    if (supplied != fields or not (study.get('retention_only', False) or study.get('partial_prefix', False))
        or protocol['memory_gb'] > 10 or protocol.get('raw', True) is not True):
        raise ValueError('separate warmup requires a bounded raw retention or partial-prefix study')
    if any(type(protocol[k]) is not str or not protocol[k] for k in fields):
        raise ValueError('warmup path and hash must be nonempty strings')
    fixture = Path(protocol['warmup_fixture']).resolve()
    if digest(fixture) != protocol['warmup_fixture_sha256']: raise ValueError('warmup fixture identity mismatch')
    if not 1 <= fixture.stat().st_size <= 32768 or fixture.read_bytes() == measured_fixture.read_bytes():
        raise ValueError('warmup must be bounded, nonempty and distinct from the measured fixture')
    return fixture


def work_constraints(protocol):
    constraints = protocol.get('work_constraints')
    if constraints is None: return None
    allowed = {'prefillSlotCPUBatches', 'decodeSlotCPUBatches', 'decodeModelTokens',
               'decodeForwardPasses', 'prefillTokens', 'decodeTokens', 'verifyPasses',
               'draftedTokens', 'prefillRecords', 'decodeRecords', 'completePromptHits', 'completePromptStores',
               'encodedImages', 'reusedImageFeatures', 'prefixSkippedImages', 'visionQueryTile', 'visionQueryTileCalls', 'residentExpertPrelaunches', 'residentExpertJoins', 'fusedRoPERotationsScheduled', 'ropeTableHits', 'ropeTableBuilds', 'terminalQueryRowsSkipped', 'fusedGDNProjectionsScheduled', 'packedGDNProjectionLayers', 'packedGDNProjectionPayloadBytes'}
    if type(constraints) is not dict or set(constraints) != set(protocol['arms']):
        raise ValueError('work constraints must cover exactly every arm')
    for counters in constraints.values():
        if type(counters) is not dict or not counters or not set(counters) <= allowed:
            raise ValueError('unknown or empty work constraint counters')
        reader_pair = {'residentExpertPrelaunches', 'residentExpertJoins'}
        if set(counters) & reader_pair and not reader_pair <= set(counters):
            raise ValueError('resident overlap requires both submission and completed-join counters')
        for bounds in counters.values():
            if type(bounds) is not dict or not bounds or not set(bounds) <= {'min', 'max'}:
                raise ValueError('work bounds require min and/or max')
            if any(type(v) is not int or v < 0 for v in bounds.values()):
                raise ValueError('work bounds must be nonnegative integers')
            if bounds.get('min', 0) > bounds.get('max', float('inf')):
                raise ValueError('work minimum exceeds maximum')
    return constraints


def validate_work_observation(constraints, arm, stats):
    if constraints is None: return
    for counter, bounds in constraints[arm].items():
        value = stats.get(counter)
        if type(value) is not int or value < bounds.get('min', 0) or value > bounds.get('max', float('inf')):
            raise ValueError(f'{arm} work counter {counter} violates its frozen bounds')
    if 'residentExpertPrelaunches' in constraints[arm] and stats['residentExpertPrelaunches'] != stats['residentExpertJoins']:
        raise ValueError(f'{arm} submitted resident work without the same number of completed joins')


def cell_cooldown(protocol):
    value = protocol.get('between_cells_seconds', 0)
    if type(value) not in (int, float) or not math.isfinite(value) or not 0 <= value <= 60:
        raise ValueError('between_cells_seconds must be finite and between zero and 60')
    return value


def reservation_wait_limit(protocol):
    value = protocol.get('model_reservation_wait_seconds',0)
    if type(value) is not int or not 0 <= value <= 1800:
        raise ValueError('model_reservation_wait_seconds must be an integer from zero to1800')
    return value


def reserved_cooldown(seconds, wait_limit, lock_path=None):
    """Keep another model from heating the machine during a declared cooldown.

    Release before ordinary preflight/child launch. The native guard remains
    authoritative if another caller wins that handoff; no guard is bypassed.
    """
    if wait_limit == 0:
        time.sleep(seconds)
        return {'reserved':False,'wait_seconds':0}
    started=time.monotonic(); notified=-30.0
    with open(lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
        while True:
            try:
                fcntl.flock(lock,fcntl.LOCK_EX | fcntl.LOCK_NB)
                break
            except BlockingIOError:
                elapsed=time.monotonic()-started
                if elapsed >= wait_limit: raise TimeoutError('other model retained the lock beyond the declared reservation wait')
                if elapsed-notified >= 30:
                    print(json.dumps({'phase':'waiting for model reservation','seconds':round(elapsed,1)}),flush=True)
                    notified=elapsed
                time.sleep(min(2,wait_limit-elapsed))
        waited=time.monotonic()-started
        time.sleep(seconds)
        return {'reserved':True,'wait_seconds':waited}


def validate_prefix_observation(expected, name, warm, measured, *, complete_prompt=False, retention_only=False, partial_prefix=False):
    want = expected[name] if expected is not None else 0
    stats = measured['stats']
    if stats.get('reusedPrefixTokens') != want:
        raise ValueError('observed prefix reuse differs from the frozen workload')
    if expected is None: return
    if warm['stats'].get('reusedPrefixTokens') != 0:
        raise ValueError('fresh-server warmup unexpectedly reused state')
    if retention_only and (want != 0 or warm['prompt_ids'] == measured['prompt_ids']):
        raise ValueError('retention-only request must be unique and reuse zero tokens')
    if partial_prefix:
        if (warm['prompt_ids'] == measured['prompt_ids'] or stats.get('completePromptHits') != 0
            or warm['stats'].get('completePromptHits') != 0):
            raise ValueError('partial-prefix observation must have a different tail and no complete hit')
    full = complete_prompt and want > 0
    if ((len(measured['prompt_ids']) != want if full else len(measured['prompt_ids']) <= want)
        or warm['prompt_ids'][:want] != measured['prompt_ids'][:want]):
        raise ValueError('warmup did not create the measured strict prefix')
    if stats.get('prefixCheckpointForks') != int(want > 0):
        raise ValueError('measured request did not use the declared checkpoint fork')
    if warm['stats'].get('prefixCheckpointStores') != int(want > 0 and not full):
        raise ValueError('warmup did not create the declared checkpoint')
    if complete_prompt:
        if (stats.get('completePromptHits') != int(full)
            or warm['stats'].get('completePromptStores') != int(full)
            or warm['stats'].get('completePromptHits') != 0
            or (full and warm['prompt_ids'] != measured['prompt_ids'])):
            raise ValueError('complete prompt identity or retained-logit mechanism differs')
    for sample in [warm['stats'], stats]:
        if sample.get('prefixCheckpointErrors') != 0 or sample.get('prefixCheckpointRefusals') != 0:
            raise ValueError('checkpoint retention failed or exceeded its budget')


def wait_for_headroom(needed_gb, seconds):
    if type(seconds) not in (int, float) or not math.isfinite(seconds) or not 0 <= seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    start = time.monotonic()
    attempts = 0
    while True:
        attempts += 1
        try:
            snapshot = preflight(needed_gb)
            return snapshot, {'seconds': time.monotonic()-start, 'checks': attempts, 'limit_seconds': seconds}
        except InsufficientHeadroom:
            remaining = seconds - (time.monotonic()-start)
            if remaining <= 0: raise
            time.sleep(min(.25, remaining))


def image_fixtures(protocol):
    """Bounded, content-pinned inline images. Never resolve an image URL."""
    if 'images' not in protocol: return []
    images = protocol['images']
    if (type(images) is not list or not 1 <= len(images) <= 4
        or protocol.get('raw', True) is not False):
        raise ValueError('image study requires one to four images and templates')
    if protocol.get('memory_gb', 0) > 10:
        if protocol.get('large_vision_measurement') is None:
            raise ValueError('image study above 10 GB requires the bounded large-vision declaration')
        # Reuse the complete capacity contract before reading any image. A
        # declared purpose alone cannot bypass pool, output or resource guards.
        measurement_memory(protocol)
    result = []; total = 0
    for entry in images:
        if (type(entry) is not dict or set(entry) != {'path', 'sha256'}
            or type(entry['path']) is not str or not entry['path']
            or type(entry['sha256']) is not str):
            raise ValueError('image fixture requires an explicit path and SHA-256')
        path = Path(entry['path']).resolve()
        if not path.is_file() or not 1 <= path.stat().st_size <= 8 << 20:
            raise ValueError('image fixture is missing, empty or exceeds 8 MiB')
        with path.open('rb') as source: data = source.read((8 << 20) + 1)
        total += len(data)
        if not 1 <= len(data) <= 8 << 20 or total > 16 << 20 or hashlib.sha256(data).hexdigest() != entry['sha256']:
            raise ValueError('image identity differs or total exceeds 16 MiB')
        result.append((path, data))
    return result


def request_body(protocol, prompt, *, images=None):
    raw = protocol.get('raw', True)
    if type(raw) is not bool: raise ValueError('raw must be Boolean')
    body = {'prompt': prompt, 'raw': raw, 'stream': True,
            'options': {'temperature': 0, 'num_predict': protocol['max_tokens'], 'seed': protocol['seed']}}
    sampling = protocol.get('sampling', {})
    allowed = {'temperature', 'top_p', 'top_k', 'min_p', 'presence_penalty'}
    if type(sampling) is not dict or not set(sampling) <= allowed:
        raise ValueError('sampling must contain only declared sampler parameters')
    for key, value in sampling.items():
        if key == 'top_k':
            if type(value) is not int or not 0 <= value <= 248320:
                raise ValueError('top_k must be an integer in the pinned vocabulary range')
        elif type(value) not in (int, float) or not math.isfinite(value):
            raise ValueError(f'{key} must be a finite number')
        elif key == 'temperature' and not 0 <= value <= 10:
            raise ValueError('temperature must be between zero and ten')
        elif key == 'top_p' and not 0 < value <= 1:
            raise ValueError('top_p must be positive and at most one')
        elif key == 'min_p' and not 0 <= value <= 1:
            raise ValueError('min_p must be between zero and one')
        elif key == 'presence_penalty' and not -10 <= value <= 10:
            raise ValueError('presence_penalty must be between minus ten and ten')
    body['options'].update(sampling)
    if 'think' in protocol:
        if type(protocol['think']) is not bool: raise ValueError('think must be Boolean')
        if raw: raise ValueError('think is a template setting; use raw=false')
        body['think'] = protocol['think']
    if images is None: images = image_fixtures(protocol)
    if images:
        body['images'] = [base64.b64encode(data).decode('ascii') for _, data in images]
    return json.dumps(body).encode()


def resource_exclusions(stats, protocol):
    reasons = []
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if limit is not None:
        if type(limit) is not int or limit <= 0: raise ValueError('footprint limit must be a positive integer')
        observation = stats.get('sampledFootprint')
        peak = observation.get('peakBytes') if isinstance(observation, dict) else None
        if type(peak) is not int or peak <= 0:
            reasons.append('declared footprint gate has no valid sampled measurement')
        elif peak > limit:
            reasons.append('sampled physical footprint exceeds declared byte limit')
    require_nominal = protocol.get('require_nominal_power_state', False)
    if type(require_nominal) is not bool: raise ValueError('require_nominal_power_state must be Boolean')
    if require_nominal:
        for key in ['generatorSystemBefore', 'generatorSystemAfter']:
            state = stats.get(key)
            if not isinstance(state, dict) or state.get('thermalState') != 'nominal' or state.get('lowPowerModeEnabled') is not False:
                reasons.append('generator OS thermal/power state unavailable or non-nominal')
                break
    if protocol.get('images'):
        preparation = stats.get('imagePreparation') or {}
        observed = preparation.get('sampledFootprint') or {}
        image_peak = observed.get('peakBytes')
        if (type(image_peak) is not int or image_peak <= 0
            or type(observed.get('samples')) is not int or observed['samples'] <= 0):
            reasons.append('image preparation footprint observation missing')
        elif limit is not None and image_peak > limit:
            reasons.append('image preparation exceeds declared byte limit')
        for key in ['seconds', 'sourceDecodeSeconds', 'towerReadySeconds']:
            value = preparation.get(key)
            if type(value) not in (int, float) or not math.isfinite(value) or value < 0:
                reasons.append('image preparation timer missing or invalid')
                break
    return reasons


def exchange(port, body, timeout, *, allow_complete_prompt=False):
    conn = http.client.HTTPConnection('127.0.0.1', port, timeout=timeout)
    wire = bytearray(); frames = []
    first_delta = first_visible = None
    started = time.monotonic()
    try:
        conn.request('POST', '/api/generate', body, {'Content-Type':'application/json'})
        response = conn.getresponse()
        headers_at = time.monotonic() - started
        if response.status != 200:
            raise ValueError(f'HTTP {response.status}: {response.read(8192)!r}')
        while True:
            line = response.readline(1 << 20)
            if not line: break
            wire += line
            if len(wire) > 8 << 20: raise ValueError('response exceeds bounded capture')
            if not line.strip(): continue
            frame = json.loads(line); frames.append(frame)
            elapsed = time.monotonic() - started
            if first_delta is None and not frame.get('done') and (frame.get('response') or frame.get('thinking')):
                first_delta = elapsed
            if first_visible is None and frame.get('response', '').strip(): first_visible = elapsed
        elapsed = time.monotonic() - started
    finally: conn.close()
    finals = [f for f in frames if f.get('done')]
    if len(finals) != 1 or frames[-1] is not finals[0]: raise ValueError('missing or malformed completion framing')
    details = {'schema_version':1, **finals[0]['slotstream_benchmark']}
    validate_metrics(details, allow_complete_prompt=allow_complete_prompt)
    return {'client_seconds':elapsed, 'headers_seconds':headers_at,
            'first_protocol_delta_seconds':first_delta, 'first_visible_text_seconds':first_visible,
            'text':''.join(f.get('response','') for f in frames), 'metrics':details}, bytes(wire)


def stop_server(child):
    if child.poll() is None:
        os.killpg(child.pid, signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired:
            os.killpg(child.pid, signal.SIGKILL); child.wait()


def wait_ready(child, port):
    deadline = time.monotonic() + 120
    while time.monotonic() < deadline:
        if child.poll() is not None: raise RuntimeError(f'server exited {child.returncode}')
        conn = http.client.HTTPConnection('127.0.0.1', port, timeout=1)
        try:
            conn.request('GET','/api/version')
            response = conn.getresponse(); response.read(4096)
            if response.status == 200: return
        except (OSError, http.client.HTTPException): pass
        finally: conn.close()
        time.sleep(.25)
    raise TimeoutError('server startup timeout')


def sampled_request_peak(stats):
    """Highest sampled process footprint across generation and image preparation.

    These are successive intervals of the same process, so take their maximum,
    never their sum. Missing declared-stage evidence cannot prove a saving.
    """
    observations = [stats.get('sampledFootprint')]
    if 'imagePreparation' in stats:
        preparation = stats['imagePreparation']
        if not isinstance(preparation, dict): return None
        observations.append(preparation.get('sampledFootprint'))
    peaks = [value.get('peakBytes') if isinstance(value, dict) else None for value in observations]
    return max(peaks) if all(type(value) is int and value > 0 for value in peaks) else None


def summaries(rows, reference, comparison_basis='fixed-pool', required_equal_work=None):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
    fields = [] if required_equal_work is None else required_equal_work
    allowed = {'prefillRecords', 'decodeRecords', 'prefillTokens', 'decodeTokens',
               'decodeForwardPasses', 'decodeModelTokens', 'draftedTokens', 'verifyPasses'}
    if (type(fields) is not list or any(type(k) is not str or k not in allowed for k in fields)
            or len(fields) != len(set(fields))):
        raise ValueError('required_equal_work must contain unique supported work counters')
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round']==number}
            a,b = arms.get(reference),arms.get(candidate)
            if not a or not b or not a['valid'] or not b['valid']:
                excluded.append(number); continue
            am,bm = a['metrics'],b['metrics']
            equal_fields = ['prompt_ids', 'effective_mtp']
            if comparison_basis == 'fixed-pool': equal_fields.append('effective_pool_slots')
            if any(am[k]!=bm[k] for k in equal_fields):
                excluded.append(number); continue
            if any(type(am['stats'].get(k)) is not int or am['stats'][k] < 0
                   or type(bm['stats'].get(k)) is not int or am['stats'][k] != bm['stats'][k]
                   for k in fields):
                excluded.append(number); continue
            aseq, bseq = am['stats'].get('allocatedSequenceBytes'), bm['stats'].get('allocatedSequenceBytes')
            aactive, bactive = am['stats'].get('mlxActiveEndBytes'), bm['stats'].get('mlxActiveEndBytes')
            apeak = sampled_request_peak(am['stats'])
            bpeak = sampled_request_peak(bm['stats'])
            sequence_ok = all(type(v) is int and v > 0 for v in [aseq, bseq])
            active_ok = all(type(v) is int and v > 0 for v in [aactive, bactive])
            peak_ok = all(type(v) is int and v > 0 for v in [apeak, bpeak])
            pairs.append({'round':number,'client_reduction_fraction':1-b['client_seconds']/a['client_seconds'],
                'generator_reduction_fraction':1-bm['stats']['requestSeconds']/am['stats']['requestSeconds'],
                'sequence_reduction_fraction': 1-bseq/aseq if sequence_ok else None,
                'active_savings_share': (aactive-bactive)/(aseq-bseq) if sequence_ok and active_ok and aseq > bseq else None,
                'active_savings_bytes': aactive-bactive if active_ok else None,
                'sampled_peak_savings_bytes': apeak-bpeak if peak_ok else None,
                'output_ids_equal':am['output_ids']==bm['output_ids'], 'wire_text_equal':a['text']==b['text']})
        result.append({'reference':reference,'candidate':candidate,'comparison_basis':comparison_basis,
            'pairs':pairs,'excluded_rounds':excluded,
            'median_client_reduction_fraction':statistics.median(p['client_reduction_fraction'] for p in pairs) if pairs else None,
            'median_generator_reduction_fraction':statistics.median(p['generator_reduction_fraction'] for p in pairs) if pairs else None})
    return result


def acceptance_results(summary, contract):
    """Apply the frozen criterion without turning missing/unequal work into a win."""
    if contract is None: return None
    count = contract['minimum_pairs']
    non_regression = 'maximum_median_client_regression' in contract
    if non_regression and 'minimum_median_client_reduction' in contract:
        raise ValueError('choose one latency acceptance criterion')
    reduction_key = 'maximum_median_client_regression' if non_regression else 'minimum_median_client_reduction'
    reduction = contract[reduction_key]
    positive = contract['minimum_positive_fraction']
    if type(count) is not int or count < 1: raise ValueError('minimum_pairs must be a positive integer')
    for name, value in [(reduction_key, reduction), ('minimum_positive_fraction', positive)]:
        if type(value) not in [int, float] or not 0 <= value <= 1: raise ValueError(name + ' must be finite and in [0,1]')
    for key in ['minimum_sequence_reduction', 'minimum_active_savings_share']:
        if key in contract and (type(contract[key]) not in [int, float] or not 0 <= contract[key] <= 1):
            raise ValueError(key + ' must be finite and in [0,1]')
    for key in ['minimum_active_savings_bytes', 'minimum_sampled_peak_savings_bytes']:
        if key in contract and (type(contract[key]) is not int or contract[key] <= 0):
            raise ValueError(key + ' must be a positive integer')
    if contract.get('all_outputs_exact') is not True: raise ValueError('this acceptance contract requires exact outputs')
    result = []
    for item in summary:
        pairs = item['pairs']
        checks = {
            'minimum_pairs': len(pairs) >= count,
            ('median_client_non_regression' if non_regression else 'median_client_reduction'):
                item['median_client_reduction_fraction'] is not None
                and item['median_client_reduction_fraction'] >= (-reduction if non_regression else reduction),
            'positive_fraction': bool(pairs) and sum(p['client_reduction_fraction'] > 0 for p in pairs) / len(pairs) >= positive,
            'exact_outputs': bool(pairs) and all(p['output_ids_equal'] and p['wire_text_equal'] for p in pairs),
        }
        for criterion, metric in [('minimum_sequence_reduction', 'sequence_reduction_fraction'),
                                  ('minimum_active_savings_share', 'active_savings_share'),
                                  ('minimum_active_savings_bytes', 'active_savings_bytes'),
                                  ('minimum_sampled_peak_savings_bytes', 'sampled_peak_savings_bytes')]:
            if criterion in contract:
                values = [p.get(metric) for p in pairs]
                checks[criterion] = bool(values) and all(type(v) in [int, float] and math.isfinite(v)
                    and v >= contract[criterion] for v in values)
        result.append({'candidate': item['candidate'], 'passed': all(checks.values()), 'checks': checks})
    return result


def startup_summaries(rows, reference):
    """Fresh-process costs are separate from warmed request acceptance.

    Amortization uses a paired first-job excess divided by a positive paired
    steady-request saving. It is an estimate for repeating this exact job,
    never a claim about a cold filesystem or a different request mix.
    """
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round'] == number}
            a,b = arms.get(reference),arms.get(candidate)
            first_a,first_b = (a or {}).get('first_request'),(b or {}).get('first_request')
            if (not a or not b or not a['valid'] or not b['valid'] or not first_a or not first_b
                or not a.get('startup_and_warmup_valid') or not b.get('startup_and_warmup_valid')):
                excluded.append(number); continue
            fields = ['prompt_ids','output_ids','text','effective_pool_slots','effective_mtp']
            if any(first_a.get(k) != first_b.get(k) or first_a.get(k) is None for k in fields):
                excluded.append(number); continue
            durations = [a.get('startup_seconds'),b.get('startup_seconds'),
                         first_a.get('complete_seconds_from_launch'),first_b.get('complete_seconds_from_launch'),
                         a.get('client_seconds'),b.get('client_seconds')]
            if any(type(x) not in [float,int] or not math.isfinite(x) or x <= 0 for x in durations):
                excluded.append(number); continue
            excess = first_b['complete_seconds_from_launch']-first_a['complete_seconds_from_launch']
            saving = a['client_seconds']-b['client_seconds']
            pairs.append({'round':number,'startup_excess_seconds':b['startup_seconds']-a['startup_seconds'],
                          'first_job_excess_seconds':excess,'steady_request_saving_seconds':saving,
                          'estimated_total_jobs_to_amortize':1+math.ceil(max(0,excess)/saving) if saving > 0 else None})
        result.append({'candidate':candidate,'pairs':pairs,'excluded_rounds':excluded,
                       'median_startup_excess_seconds':statistics.median(p['startup_excess_seconds'] for p in pairs) if pairs else None,
                       'median_first_job_excess_seconds':statistics.median(p['first_job_excess_seconds'] for p in pairs) if pairs else None})
    return result


def verified_build(binary):
    binary = Path(binary).resolve()
    identity = json.loads((binary.parent / 'build-identity.json').read_text())
    for path, key in [(binary, 'binary_sha256'), (binary.parent / 'mlx.metallib', 'metallib_sha256'),
                      (binary.parent / 'build-source.tar.gz', 'source_archive_sha256')]:
        if digest(path) != identity[key]:
            raise ValueError(f'frozen identity mismatch: {path}')
    return {'binary': str(binary), 'identity': identity}


def validate_declared_binary(protocol, builds):
    expected = protocol.get('frozen_binary_sha256')
    if expected is None: return
    if type(expected) is not str or len(expected) != 64 or any(c not in '0123456789abcdef' for c in expected):
        raise ValueError('frozen_binary_sha256 must be a lowercase SHA-256 digest')
    if not builds or any(b['identity']['binary_sha256'] != expected for b in builds.values()):
        raise ValueError('an arm does not match the prospectively frozen binary SHA-256')


def validate_arms(arms):
    if type(arms) is not dict or not arms or 'reference' not in arms:
        raise ValueError('arms must include a reference')
    for name, arm in arms.items():
        if type(name) is not str or not name.replace('_', '').replace('-', '').isalnum():
            raise ValueError('unsafe arm name')
        if type(arm) is not dict or not {'chunk', 'env'} <= set(arm) or set(arm) - {'chunk', 'env', 'binary'}:
            raise ValueError('each arm requires chunk and env, with only an optional binary')
        if type(arm['chunk']) is not int or arm['chunk'] not in [256, 512, 1024, 2048, 4096]:
            raise ValueError('arm chunk must be a supported prefill size')
        if type(arm['env']) is not dict or any(type(k) is not str or not k.startswith('SLOTSTREAM_')
                or type(v) is not str for k, v in arm['env'].items()):
            raise ValueError('arm env requires explicit string SLOTSTREAM_ controls')
        if 'SLOTSTREAM_PREFILL_CHUNK' in arm['env'] and arm['env']['SLOTSTREAM_PREFILL_CHUNK'] != str(arm['chunk']):
            raise ValueError('arm chunk conflicts with its environment')
        if 'binary' in arm and (type(arm['binary']) is not str or not arm['binary']):
            raise ValueError('arm binary must be a nonempty path string')


def startup_acceptance_results(rows, reference, contract):
    """Optional first-job gate; never borrow swap-excluded warmups from steady timing."""
    if contract is None:
        return None
    keys = {'minimum_pairs', 'maximum_median_first_job_regression', 'all_outputs_exact'}
    if not isinstance(contract, dict) or set(contract) != keys:
        raise ValueError('startup acceptance requires exactly minimum_pairs, maximum_median_first_job_regression and all_outputs_exact')
    count, limit = contract['minimum_pairs'], contract['maximum_median_first_job_regression']
    if type(count) is not int or count < 1:
        raise ValueError('startup minimum_pairs must be a positive integer')
    if type(limit) not in [int, float] or not 0 <= limit <= 1:
        raise ValueError('startup regression limit must be finite and in [0,1]')
    if contract['all_outputs_exact'] is not True:
        raise ValueError('startup acceptance requires exact outputs')
    by_cell = {(r['round'], r['arm']): r for r in rows}
    results = []
    for summary in startup_summaries(rows, reference):
        changes = []
        for pair in summary['pairs']:
            a = by_cell[pair['round'], reference]['first_request']['complete_seconds_from_launch']
            b = by_cell[pair['round'], summary['candidate']]['first_request']['complete_seconds_from_launch']
            changes.append(1 - b / a)
        median = statistics.median(changes) if changes else None
        checks = {'minimum_pairs': len(changes) >= count,
                  'median_first_job_non_regression': median is not None and median >= -limit}
        results.append({'candidate': summary['candidate'], 'passed': all(checks.values()),
            'checks': checks, 'eligible_rounds': [p['round'] for p in summary['pairs']],
            'excluded_rounds': summary['excluded_rounds'], 'median_first_job_reduction_fraction': median})
    return results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    validate_arms(protocol.get('arms'))
    expected_prefix = prefix_study(protocol)
    complete_prompt = (protocol.get('prefix_cache') or {}).get('complete_prompt', False)
    retention_only = (protocol.get('prefix_cache') or {}).get('retention_only', False)
    partial_prefix = (protocol.get('prefix_cache') or {}).get('partial_prefix', False)
    expected_work = work_constraints(protocol)
    startup_acceptance_results([], next(iter(protocol['arms'])), protocol.get('startup_acceptance'))
    stop_on_contention = contention_guard(protocol)
    initial_quiet = workspace_quiet_requirement(protocol)
    cooldown = cell_cooldown(protocol)
    reservation_wait = reservation_wait_limit(protocol)
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    explicit_pool_gb = fixed_pool_budget(protocol)
    required_equal_work = protocol.get('required_equal_work')
    summaries([], 'reference', comparison_basis, required_equal_work)
    acceptance_results([], protocol.get('acceptance'))
    abort_on_resource_failure = protocol.get('abort_on_resource_failure', False)
    if type(abort_on_resource_failure) is not bool: raise ValueError('abort_on_resource_failure must be Boolean')
    resource_exclusions({}, protocol)  # Validate declared types before loading.
    arms=protocol['arms']; model=Path(protocol['model']).resolve(); binary=Path(protocol['binary']).resolve()
    if protocol.get('acceptance') is not None and len(arms) < 2:
        raise ValueError('paired acceptance requires reference and candidate arms')
    required_memory = measurement_memory(protocol)
    settle_seconds = protocol.get('memory_settle_seconds', 0)
    if type(settle_seconds) not in (int, float) or not math.isfinite(settle_seconds) or not 0 <= settle_seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    workload_exclusions({}, protocol)  # Validate the declaration before startup.
    if protocol['rounds']<1 or not 1<=protocol['max_tokens']<=512:
        parser.error('bounded memory, rounds and output required')
    if any(not name.replace('_','').replace('-','').isalnum() for name in arms): parser.error('unsafe arm name')
    identity = verified_build(binary)['identity']
    arm_builds = {name: verified_build(arm.get('binary', binary)) for name, arm in arms.items()}
    validate_declared_binary(protocol, arm_builds)
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
    warm_fixture = warmup_fixture(protocol, fixture)
    images = image_fixtures(protocol)
    if protocol['memory_gb'] > 10:
        fixture_limit = 32768 if protocol.get('large_scope_measurement') is not None else 2048
        if fixture.stat().st_size > fixture_limit:
            raise ValueError(f'large-memory study fixture exceeds its {fixture_limit}-byte bound')
    a.out=a.out.resolve(); a.out.mkdir(parents=True,exist_ok=False)
    shutil.copyfile(fixture,a.out/'fixture.txt'); shutil.copyfile(binary.parent/'build-source.tar.gz',a.out/'build-source.tar.gz')
    for name, build in arm_builds.items():
        shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', a.out / f'{name}-build-source.tar.gz')
    harness_sources = {}
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:
        harness_sources[source.name] = digest(source)
        shutil.copyfile(source, a.out/source.name)
    (a.out/'manifest.json').write_text(json.dumps({'protocol':protocol,'protocol_sha256':digest(a.protocol),
        'identity':identity,'model':model_identity(model),'harness_sha256':digest(Path(__file__)),
        'harness_sources': harness_sources, 'arm_builds': arm_builds},indent=2)+'\n')
    for i, (image_path, data) in enumerate(images):
        (a.out / f'image-{i}{image_path.suffix}').write_bytes(data)
    body=request_body(protocol, fixture.read_text(), images=images)
    warm_body = request_body(protocol, warm_fixture.read_text(), images=images)
    (a.out/'request.json').write_bytes(body)
    if warm_fixture != fixture:
        shutil.copyfile(warm_fixture, a.out/'warmup-fixture.txt')
        (a.out/'warmup-request.json').write_bytes(warm_body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
    if initial_quiet is not None:
        quiet_record = {'requirement': initial_quiet, 'passed': False}
        try:
            quiet_record.update(wait_for_quiet_workspace(initial_quiet), passed=True)
        except (Exception, KeyboardInterrupt) as error:
            quiet_record['error'] = f'{type(error).__name__}: {error}'
        (a.out/'initial-workspace-quiet.json').write_text(json.dumps(quiet_record, indent=2)+'\n')
        if not quiet_record['passed']:
            (a.out/'completion.json').write_text(json.dumps({'stopped_early': True,
                'planned_cells': protocol['rounds'] * len(arms), 'recorded_cells': 0,
                'error': quiet_record['error'], 'acceptance': []}, indent=2)+'\n')
            print(json.dumps(quiet_record), flush=True)
            return 1
    stop_requested = False
    interrupted = False
    for number in range(1,protocol['rounds']+1):
        order=list(arms) if number%2 else list(reversed(arms))
        for name in order:
            arm=arms[name]; cell=a.out/f'{number}-{name}'; cell.mkdir()
            env=clean_env|arm['env']|{'SLOTSTREAM_BENCH_DETAILS':'1','SLOTSTREAM_PREFILL_CHUNK':str(arm['chunk'])}
            extra=max(0,arm['chunk']-256)*1.30e-3
            if env.get('SLOTSTREAM_OPT_LAYER_WORKSPACE')=='1': extra+=2
            if env.get('SLOTSTREAM_OPT_ROUTER_WEIGHTS')=='1': extra+=.3
            scope=int(env.get('SLOTSTREAM_OPT_READ_SCOPE','0'))
            if scope: extra+=max(0,scope-arm['chunk'])*1.30e-3+.12
            row={'round':number,'arm':name,'valid':False,'extra_preflight_allowance_gb':extra,
                 'env':{k:v for k,v in env.items() if k.startswith('SLOTSTREAM_')}}
            child=None
            try:
                if stop_on_contention:
                    row['competing_jobs_before_cooldown'] = competing_jobs()
                    if row['competing_jobs_before_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job; stopped before cooldown or model launch')
                row['cooldown_seconds'] = cooldown
                if cooldown:
                    print(json.dumps({'round':number,'arm':name,'phase':'before-cell cooldown','seconds':cooldown}),flush=True)
                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)
                if stop_on_contention:
                    row['competing_jobs_after_cooldown'] = competing_jobs()
                    if row['competing_jobs_after_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job appeared during cooldown; model not launched')
                try:
                    row['before_startup'], row['headroom_settle'] = wait_for_headroom(required_memory+extra, settle_seconds)
                except Exception:
                    if abort_on_resource_failure: stop_requested = True
                    raise
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                memory_args = (['--pool-gb', str(explicit_pool_gb)] if explicit_pool_gb is not None
                               else ['--memory-gb', str(protocol['memory_gb'])])
                command=[arm_builds[name]['binary'],'serve','--port',str(port),'--model',str(model), *memory_args,
                         '--mtp',protocol.get('mtp','off'),'--no-elastic']
                if expected_prefix is None: command.append('--no-prefix-cache')
                if protocol.get('large_scope_measurement') is not None:
                    # Bound active context independently of any evolving default
                    # while allowing the declared approximately4k-token fixture.
                    command.extend(['--max-context','8192'])
                row['command']=command
                with (cell/'server.stdout').open('wb') as out, (cell/'server.stderr').open('wb') as err:
                    launched_at=time.monotonic()
                    child=subprocess.Popen(command,cwd=ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
                    wait_ready(child,port)
                    row['startup_seconds']=time.monotonic()-launched_at
                    row['after_startup_vm']=vm_snapshot()
                    warm,wire=exchange(port,warm_body,protocol.get('timeout_seconds',600))
                    row['first_request']={k:warm['metrics'][k] for k in ['prompt_ids','output_ids','effective_pool_slots','effective_mtp']}
                    row['first_request'].update(text=warm['text'],complete_seconds_from_launch=time.monotonic()-launched_at)
                    row['after_warmup_vm']=vm_snapshot()
                    row['startup_and_warmup_valid']=not resource_exclusions(warm['metrics']['stats'],protocol) and (
                        warm['metrics']['stats']['decodeTokens'] >= protocol.get('minimum_output_tokens',0)) and all(
                        row['before_startup'][key]==row['after_warmup_vm'][key] for key in ['swapins','swapouts'])
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
                    if stop_on_contention:
                        row['competing_jobs_after_warmup'] = competing_jobs()
                        if row['competing_jobs_after_warmup']:
                            stop_requested = True
                            raise RuntimeError('competing storage/build job appeared during warmup; measurement not started')
                    if abort_on_resource_failure:
                        warm_exclusions = resource_exclusions(warm['metrics']['stats'], protocol)
                        if protocol['memory_gb'] > 10:
                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]
                                   for key in ['swapins', 'swapouts']):
                                warm_exclusions.append('swap activity during large-pool startup/warmup')
                        if warm_exclusions:
                            stop_requested = True
                            row['exclusion'] = 'warmup resource gate: ' + '; '.join(warm_exclusions)
                            raise RuntimeError('declared resource stop before measurement')
                    row['host_before']=host_conditions()
                    row['before']=vm_snapshot()
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600),
                        allow_complete_prompt=complete_prompt and expected_prefix[name] > 0)
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    if stop_on_contention:
                        row['competing_jobs_after_measurement'] = competing_jobs()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if explicit_pool_gb is not None and m['effective_pool_slots'] != protocol['fixed_pool_slots']:
                        raise ValueError('effective pool differs from the frozen explicit capacity')
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    validate_prefix_observation(expected_prefix, name, warm['metrics'], m,
                        complete_prompt=complete_prompt, retention_only=retention_only, partial_prefix=partial_prefix)
                    validate_work_observation(expected_work, name, s)
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
                    if stop_on_contention and row.get('competing_jobs_after_measurement'):
                        exclusions.append('known competing storage/build job observed after measurement')
                        stop_requested = True
                    if exclusions and abort_on_resource_failure: stop_requested = True
                    exclusions += workload_exclusions(s, protocol)
                    if changed: exclusions.append('swap activity during measured request; pair excluded')
                    row['valid']=not exclusions
                    if exclusions: row['exclusion']='; '.join(exclusions)
            except KeyboardInterrupt:
                row['interrupted'] = True
                row['error'] = 'KeyboardInterrupt: measured result incomplete; owned server stopped'
                interrupted = stop_requested = True
            except Exception as e: row['error']=f'{type(e).__name__}: {e}'
            finally:
                if child is not None: stop_server(child)
            (cell/'result.json').write_text(json.dumps(row,indent=2)+'\n')
            rows.append(row)
            with (a.out/'results.jsonl').open('a') as log: log.write(json.dumps(row)+'\n')
            progress = {k:v for k,v in row.items() if k in ['round','arm','valid','client_seconds','error','exclusion']}
            if 'metrics' in row:
                stats = row['metrics']['stats']
                progress['decode_records'] = stats.get('decodeRecords')
                if 'decodeLocalVictims' in stats: progress['local_victims'] = stats['decodeLocalVictims']
                if protocol.get('acceptance', {}).get('minimum_sequence_reduction') is not None:
                    progress['sequence_bytes'] = stats.get('allocatedSequenceBytes')
                    progress['mlx_active_bytes'] = stats.get('mlxActiveEndBytes')
            print(json.dumps(progress),flush=True)
            if stop_requested: break
        if stop_requested: break
    summary=summaries(rows,next(iter(arms)),comparison_basis,required_equal_work)
    (a.out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    (a.out/'startup-summary.json').write_text(json.dumps(startup_summaries(rows,next(iter(arms))),indent=2)+'\n')
    assessment = acceptance_results(summary, protocol.get('acceptance'))
    startup_assessment = startup_acceptance_results(rows, next(iter(arms)), protocol.get('startup_acceptance'))
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment, 'startup_acceptance': startup_assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    if startup_assessment is not None and not all(r['passed'] for r in startup_assessment): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())

````

Artifact `/Users/carlos/Projects/slotstream/Tools/prefill_bench_test.py` — 57605 bytes, SHA-256 `3d4efae96fc45c3b52a74e273831f8049a4d514fc1da2dd6018bbcc75ecb2209`.

````text
#!/usr/bin/env python3
import copy
import fcntl
import unittest
from prefill_bench import vm_snapshot, validate_metrics, paired_summary
from serve_bench import request_body, resource_exclusions, summaries, acceptance_results, measurement_memory, workload_exclusions
import json
from memory_gate import check_memory
from long_context_gate import check_answer
from contextlib import redirect_stdout
import io
from pathlib import Path
from tempfile import TemporaryDirectory
from unittest.mock import patch
from types import SimpleNamespace
import serve_bench


class HarnessTests(unittest.TestCase):
    def test_large_vision_admission_reaches_request_serialization(self):
        with TemporaryDirectory() as directory:
            image = Path(directory) / 'red.png'
            payload = b'bounded pinned image bytes'
            image.write_bytes(payload)
            p = {'memory_gb': 12, 'fixed_pool_slots': 640, 'comparison_basis': 'fixed-pool',
                 'max_tokens': 1, 'seed': 7, 'mtp': 'off', 'raw': False,
                 'images': [{'path': str(image), 'sha256': serve_bench.hashlib.sha256(payload).hexdigest()}],
                 'large_vision_measurement': {'purpose': 'independent fixed-pool mechanism comparison'},
                 'maximum_sampled_footprint_bytes': 12_000_000_000,
                 'abort_on_resource_failure': True, 'require_nominal_power_state': True}
            self.assertEqual(measurement_memory(p), 18)
            fixtures = serve_bench.image_fixtures(p)
            self.assertEqual(fixtures, [(image.resolve(), payload)])
            body = json.loads(request_body(p, 'What color?', images=fixtures))
            self.assertEqual(serve_bench.base64.b64decode(body['images'][0]), payload)
            self.assertEqual(body['options']['num_predict'], 1)
            for key, value in [('large_vision_measurement', None), ('memory_gb', 13),
                               ('fixed_pool_slots', 641), ('max_tokens', 2), ('mtp', 'on'),
                               ('raw', True), ('prefix_cache', {}),
                               ('maximum_sampled_footprint_bytes', 13_000_000_000),
                               ('abort_on_resource_failure', False), ('require_nominal_power_state', False)]:
                with self.assertRaises(ValueError): serve_bench.image_fixtures(p | {key: value})
            # Ordinary image studies retain the prior envelope without a large-study declaration.
            ordinary = {key: value for key, value in p.items() if key != 'large_vision_measurement'}
            self.assertEqual(serve_bench.image_fixtures(ordinary | {'memory_gb': 10}), fixtures)

    def test_larger_vision_study_preserves_explicit_capacity_and_resource_guards(self):
        p = {'memory_gb': 12, 'fixed_pool_slots': 640, 'comparison_basis': 'fixed-pool',
             'max_tokens': 1, 'mtp': 'off', 'images': [{'path': 'red.png'}],
             'large_vision_measurement': {'purpose': 'independent fixed-pool mechanism comparison'},
             'maximum_sampled_footprint_bytes': 12_000_000_000,
             'abort_on_resource_failure': True, 'require_nominal_power_state': True}
        self.assertEqual(measurement_memory(p), 18)
        for key, value in [('memory_gb', 10), ('memory_gb', 13), ('fixed_pool_slots', 641),
                           ('max_tokens', 2), ('max_tokens', True), ('mtp', 'on'), ('images', []),
                           ('images', [{}, {}]), ('prefix_cache', {}),
                           ('maximum_sampled_footprint_bytes', 13_000_000_000),
                           ('abort_on_resource_failure', False), ('require_nominal_power_state', False),
                           ('large_vision_measurement', {'purpose': ''}), ('large_pool_measurement', {})]:
            with self.assertRaises(ValueError): measurement_memory(p | {key: value})

    def test_explicit_pool_study_is_bounded_and_distinct_from_target_planning(self):
        self.assertIsNone(serve_bench.fixed_pool_budget({'memory_gb': 10}))
        self.assertEqual(serve_bench.fixed_pool_budget({'comparison_basis': 'fixed-pool', 'fixed_pool_slots': 640}), 1.769472)
        for slots in [None, True, 0, 639, 641, 24576, 640.0, '640']:
            with self.assertRaises(ValueError):
                serve_bench.fixed_pool_budget({'comparison_basis': 'fixed-pool', 'fixed_pool_slots': slots})
        for basis in [None, 'fixed-total-memory', 'anything']:
            with self.assertRaises(ValueError):
                serve_bench.fixed_pool_budget({'comparison_basis': basis, 'fixed_pool_slots': 640})

    def test_first_job_gate_uses_clean_exact_warmups_and_declared_limit(self):
        contract = {'minimum_pairs': 1, 'maximum_median_first_job_regression': .05, 'all_outputs_exact': True}
        first = {'prompt_ids': [7], 'output_ids': [9], 'text': 'ok',
                 'effective_pool_slots': 640, 'effective_mtp': False, 'complete_seconds_from_launch': 4.0}
        base = {'round': 1, 'valid': True, 'startup_and_warmup_valid': True,
                'startup_seconds': 1.0, 'client_seconds': 2.0, 'first_request': first}
        rows = [base | {'arm': 'reference'}, copy.deepcopy(base) | {'arm': 'candidate'}]
        rows[1]['first_request']['complete_seconds_from_launch'] = 4.1
        assess = lambda rs: serve_bench.startup_acceptance_results(rs, 'reference', contract)[0]
        self.assertTrue(assess(rows)['passed'])
        rows[1]['first_request']['complete_seconds_from_launch'] = 4.3
        self.assertFalse(assess(rows)['passed'])
        rows[1]['first_request']['complete_seconds_from_launch'] = 3.0
        for side in [0, 1]:
            bad = copy.deepcopy(rows); bad[side]['startup_and_warmup_valid'] = False
            self.assertFalse(assess(bad)['passed'])
            self.assertEqual(assess(bad)['eligible_rounds'], [])
        bad = copy.deepcopy(rows); bad[1]['first_request']['output_ids'] = [10]
        self.assertFalse(assess(bad)['passed'])
        bad = copy.deepcopy(rows); bad[1]['first_request']['complete_seconds_from_launch'] = float('nan')
        self.assertFalse(assess(bad)['passed'])

    def test_first_job_gate_rejects_invalid_or_ambiguous_contract(self):
        contract = {'minimum_pairs': 5, 'maximum_median_first_job_regression': .05, 'all_outputs_exact': True}
        self.assertIsNone(serve_bench.startup_acceptance_results([], 'reference', None))
        for field, value in [('minimum_pairs', True), ('minimum_pairs', 0),
                             ('maximum_median_first_job_regression', True),
                             ('maximum_median_first_job_regression', float('nan')),
                             ('maximum_median_first_job_regression', 1.1), ('all_outputs_exact', False)]:
            with self.assertRaises(ValueError):
                serve_bench.startup_acceptance_results([], 'reference', contract | {field: value})
        with self.assertRaises(ValueError):
            serve_bench.startup_acceptance_results([], 'reference', contract | {'unknown': 1})

    def test_whole_request_peak_includes_preparation_without_double_counting(self):
        def stats(generation, preparation=None):
            result = {'sampledFootprint': {'peakBytes': generation}}
            if preparation is not None:
                result['imagePreparation'] = {'sampledFootprint': {'peakBytes': preparation}}
            return result
        self.assertEqual(serve_bench.sampled_request_peak(stats(500)), 500)
        self.assertEqual(serve_bench.sampled_request_peak(stats(500, 900)), 900)
        self.assertEqual(serve_bench.sampled_request_peak(stats(900, 500)), 900)
        for bad in [stats(0, 900), stats(True, 900), stats(500, -1),
                    stats(500) | {'imagePreparation': {}}, stats(500) | {'imagePreparation': None}]:
            self.assertIsNone(serve_bench.sampled_request_peak(bad))
        def cell(arm, observation):
            return {'arm': arm, 'round': 1, 'valid': True, 'client_seconds': 1, 'text': 'x',
                    'metrics': {'prompt_ids': [1], 'output_ids': [2], 'effective_mtp': False,
                                'effective_pool_slots': 640, 'stats': observation | {'requestSeconds': 1}}}
        rows = [cell('reference', stats(500, 900)), cell('candidate', stats(300, 950))]
        # The generator alone saves 200, but the complete request regresses 50.
        self.assertEqual(summaries(rows, 'reference')[0]['pairs'][0]['sampled_peak_savings_bytes'], -50)

    def test_initial_quiet_interval_resets_and_times_out_before_launch(self):
        clock = [0.0]
        def sleep(seconds): clock[0] += seconds
        def jobs(): return [{'kind': 'build'}] if clock[0] < 4 or clock[0] == 8 else []
        with redirect_stdout(io.StringIO()):
            result = serve_bench.wait_for_quiet_workspace({'stable_seconds': 6, 'maximum_wait_seconds': 20},
                check=jobs, now=lambda: clock[0], sleep=sleep)
        self.assertEqual(result['wait_seconds'], 16)
        self.assertEqual(result['quiet_seconds'], 6)
        self.assertEqual(result['samples_with_competing_work'], 3)
        clock[0] = 0
        with redirect_stdout(io.StringIO()), self.assertRaises(TimeoutError):
            serve_bench.wait_for_quiet_workspace({'stable_seconds': 6, 'maximum_wait_seconds': 10},
                check=lambda: [{'kind': 'build'}], now=lambda: clock[0], sleep=sleep)
        self.assertEqual(clock[0], 10)
        p = {'stop_on_workspace_contention': True,
             'initial_workspace_quiet': {'stable_seconds': 180, 'maximum_wait_seconds': 1800}}
        self.assertEqual(serve_bench.workspace_quiet_requirement(p), p['initial_workspace_quiet'])
        self.assertIsNone(serve_bench.workspace_quiet_requirement({}))
        for change in [{'stop_on_workspace_contention': False}, {'initial_workspace_quiet': {}},
                       {'initial_workspace_quiet': {'stable_seconds': True, 'maximum_wait_seconds': 1800}},
                       {'initial_workspace_quiet': {'stable_seconds': 600, 'maximum_wait_seconds': 300}},
                       {'initial_workspace_quiet': {'stable_seconds': 180, 'maximum_wait_seconds': 1801}}]:
            with self.assertRaises(ValueError): serve_bench.workspace_quiet_requirement(p | change)

    def test_image_preparation_peak_is_part_of_resource_gate(self):
        protocol = {'images': [{}], 'maximum_sampled_footprint_bytes': 1000}
        stats = {'sampledFootprint': {'peakBytes': 900, 'samples': 2},
                 'imagePreparation': {'sampledFootprint': {'peakBytes': 950, 'samples': 2},
                     'seconds': .2, 'sourceDecodeSeconds': .1, 'towerReadySeconds': .1}}
        self.assertEqual(resource_exclusions(stats, protocol), [])
        for change in [{'imagePreparation': None},
                       {'imagePreparation': stats['imagePreparation'] | {'sampledFootprint': {'peakBytes': 1001, 'samples': 2}}},
                       {'imagePreparation': stats['imagePreparation'] | {'seconds': True}},
                       {'imagePreparation': stats['imagePreparation'] | {'towerReadySeconds': float('nan')}}]:
            self.assertTrue(resource_exclusions(stats | change, protocol))

    def test_image_study_pins_inline_bytes_order_and_bounds(self):
        with TemporaryDirectory() as directory:
            image = Path(directory)/'a.png'; image.write_bytes(b'first-image')
            other = Path(directory)/'b.png'; other.write_bytes(b'second-image')
            entries = [{'path': str(p), 'sha256': serve_bench.digest(p)} for p in [image, other, image]]
            protocol = {'images': entries, 'raw': False, 'memory_gb': 10, 'max_tokens': 1, 'seed': 7}
            body = json.loads(request_body(protocol, 'describe'))
            self.assertEqual([serve_bench.base64.b64decode(x) for x in body['images']],
                             [b'first-image', b'second-image', b'first-image'])
            self.assertEqual(body['prompt'], 'describe')
            self.assertNotIn('images', json.loads(request_body({'max_tokens': 1, 'seed': 7}, 'text')))
            for bad in [{'raw': True}, {'memory_gb': 16}, {'images': []}, {'images': entries*2},
                        {'images': [entries[0] | {'sha256': '0'*64}]},
                        {'images': [entries[0] | {'path': None}]},
                        {'images': [entries[0] | {'url': 'https://example.invalid'}]}]:
                with self.assertRaises(ValueError): request_body(protocol | bad, 'describe')
            image.write_bytes(b'changed-image')
            with self.assertRaises(ValueError): request_body(protocol, 'describe')
            image.write_bytes(b'')
            with self.assertRaises(ValueError): request_body(protocol, 'describe')
            with image.open('wb') as f: f.truncate((8 << 20) + 1)
            with self.assertRaises(ValueError): request_body(protocol, 'describe')

    def test_contention_guard_identifies_jobs_without_persisting_arguments(self):
        def run(args, **kwargs):
            if 'pid=,comm=' in args:
                return SimpleNamespace(stdout='10 /repo/slotstream\n11 /usr/bin/Python\n12 /usr/bin/ssh\n13 /repo/slotstream\n')
            return SimpleNamespace(returncode=0, stdout='10 /repo/slotstream pull --secret private-value\n'
                '11 /usr/bin/Python Tools/slotpack/full_pull.py --url secret-url\n'
                '13 /repo/slotstream serve --port 12345\n')
        jobs = serve_bench.competing_jobs(run=run)
        self.assertEqual([x['pid'] for x in jobs], [10, 11])
        self.assertNotIn('private-value', json.dumps(jobs))
        self.assertNotIn('secret-url', json.dumps(jobs))
        self.assertIsNone(serve_bench.competing_job_kind('/usr/bin/ssh', 'ssh host python Tools/slotpack/pack.py'))
        self.assertIsNone(serve_bench.competing_job_kind('/repo/slotstream', '/repo/slotstream serve --port 1'))
        self.assertEqual(serve_bench.competing_job_kind('/repo/download-harness', 'test'), 'checkpoint download test')
        self.assertEqual(serve_bench.competing_job_kind('/usr/bin/swift-frontend', 'test'), 'Swift build')
        self.assertFalse(serve_bench.contention_guard({}))
        self.assertTrue(serve_bench.contention_guard({'stop_on_workspace_contention': True}))
        for invalid in [1, 'true', None]:
            with self.assertRaises(ValueError): serve_bench.contention_guard({'stop_on_workspace_contention': invalid})

    def test_unique_retention_study_requires_distinct_frozen_warmup(self):
        with TemporaryDirectory() as directory:
            measured = Path(directory)/'measured'; measured.write_text('measured prompt')
            warm = Path(directory)/'warm'; warm.write_text('distinct warmup')
            p = {'arms': {'reference': {}, 'candidate': {}}, 'memory_gb': 8.1, 'raw': True,
                'prefix_cache': {'expected_reused_tokens': {'reference': 0, 'candidate': 0}, 'retention_only': True},
                'warmup_fixture': str(warm), 'warmup_fixture_sha256': serve_bench.digest(warm)}
            self.assertEqual(serve_bench.prefix_study(p), {'reference': 0, 'candidate': 0})
            self.assertEqual(serve_bench.warmup_fixture(p, measured), warm.resolve())
            self.assertEqual(serve_bench.warmup_fixture({}, measured), measured)
            for change in [{'warmup_fixture_sha256': '0'*64}, {'memory_gb': 16}, {'raw': False},
                           {'warmup_fixture': None}, {'prefix_cache': None}]:
                with self.assertRaises(ValueError): serve_bench.warmup_fixture(p | change, measured)
            for change in [{'complete_prompt': True}, {'retention_only': 1},
                {'expected_reused_tokens': {'reference': 0, 'candidate': 1}}]:
                with self.assertRaises(ValueError): serve_bench.prefix_study(p | {'prefix_cache': p['prefix_cache'] | change})
            del p['warmup_fixture_sha256']
            with self.assertRaises(ValueError): serve_bench.prefix_study(p)
            with self.assertRaises(ValueError): serve_bench.warmup_fixture(p, measured)
            p['warmup_fixture_sha256'] = serve_bench.digest(measured); p['warmup_fixture'] = str(measured)
            with self.assertRaises(ValueError): serve_bench.warmup_fixture(p, measured)

    def test_partial_prefix_requires_real_different_tail_and_no_full_hit(self):
        with TemporaryDirectory() as directory:
            measured = Path(directory)/'measured'; measured.write_text('common prefix plus new tail')
            warm_file = Path(directory)/'warm'; warm_file.write_text('common prefix plus old tail')
            p = {'arms': {'reference': {}, 'candidate': {}}, 'memory_gb': 8.1, 'raw': True,
                'prefix_cache': {'expected_reused_tokens': {'reference': 0, 'candidate': 2}, 'partial_prefix': True},
                'warmup_fixture': str(warm_file), 'warmup_fixture_sha256': serve_bench.digest(warm_file)}
            expected = serve_bench.prefix_study(p)
            self.assertEqual(serve_bench.warmup_fixture(p, measured), warm_file.resolve())
            base = {'reusedPrefixTokens': 0, 'prefixCheckpointStores': 1, 'prefixCheckpointForks': 0,
                'prefixCheckpointErrors': 0, 'prefixCheckpointRefusals': 0, 'completePromptHits': 0}
            warm = {'prompt_ids': [1, 2, 3], 'stats': base}
            got = {'prompt_ids': [1, 2, 4], 'stats': base | {'reusedPrefixTokens': 2, 'prefixCheckpointForks': 1}}
            serve_bench.validate_prefix_observation(expected, 'candidate', warm, got, partial_prefix=True)
            for ids in [[1, 2, 3], [1, 9, 4], [1, 2]]:
                with self.assertRaises(ValueError):
                    serve_bench.validate_prefix_observation(expected, 'candidate', warm, got | {'prompt_ids': ids}, partial_prefix=True)
            for change in [{'completePromptHits': 1}, {'reusedPrefixTokens': 0}, {'prefixCheckpointForks': 0}]:
                with self.assertRaises(ValueError):
                    serve_bench.validate_prefix_observation(expected, 'candidate', warm, got | {'stats': got['stats'] | change}, partial_prefix=True)
            for change in [{'partial_prefix': 1}, {'complete_prompt': True}, {'retention_only': True},
                {'expected_reused_tokens': {'reference': 0, 'candidate': 0}}]:
                with self.assertRaises(ValueError): serve_bench.prefix_study(p | {'prefix_cache': p['prefix_cache'] | change})
            del p['warmup_fixture_sha256']
            with self.assertRaises(ValueError): serve_bench.prefix_study(p)

    def test_rope_and_terminal_work_constraints_require_actual_mechanism(self):
        for counter in ['fusedRoPERotationsScheduled', 'ropeTableHits', 'ropeTableBuilds', 'terminalQueryRowsSkipped', 'fusedGDNProjectionsScheduled', 'packedGDNProjectionLayers', 'packedGDNProjectionPayloadBytes']:
            p = {'arms': {'candidate': {}}, 'work_constraints': {'candidate': {counter: {'min': 1, 'max': 5000}}}}
            bounds = serve_bench.work_constraints(p)
            serve_bench.validate_work_observation(bounds, 'candidate', {counter: 32})
            for bad in [{}, {counter: 0}, {counter: True}, {counter: 5001}]:
                with self.assertRaises(ValueError): serve_bench.validate_work_observation(bounds, 'candidate', bad)

    def test_unique_retention_observation_must_reuse_no_tokens(self):
        expected = {'reference': 0, 'candidate': 0}
        stats = {'reusedPrefixTokens': 0, 'prefixCheckpointStores': 0, 'prefixCheckpointForks': 0,
            'prefixCheckpointErrors': 0, 'prefixCheckpointRefusals': 0}
        warm = {'prompt_ids': [1, 2], 'stats': stats}
        measured = {'prompt_ids': [3, 4], 'stats': stats}
        serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured, retention_only=True)
        with self.assertRaises(ValueError):
            serve_bench.validate_prefix_observation(expected, 'candidate', warm, warm, retention_only=True)
        bad = {'prompt_ids': [3, 4], 'stats': stats | {'reusedPrefixTokens': 1}}
        with self.assertRaises(ValueError):
            serve_bench.validate_prefix_observation(expected, 'candidate', warm, bad, retention_only=True)

    def test_complete_prompt_requires_explicit_permission_exact_identity_and_zero_prefill(self):
        good = {'schema_version': 1, 'prompt_ids': [17, 23], 'output_ids': [31],
            'stats': {'prefillSeconds': 0, 'decodeSeconds': 1, 'requestSeconds': 1.1,
                'imageEncodeSeconds': 0, 'prefillRecords': 0, 'decodeRecords': 2,
                'prefillTokens': 0, 'promptTokens': 2, 'decodeTokens': 1,
                'lifetimeRSSPeakBytes': 100, 'prefillPasses': [], 'prefillComputePasses': [],
                'prefillReadBytes': 0, 'completePromptHits': 1, 'reusedPrefixTokens': 2}}
        with self.assertRaises(ValueError): validate_metrics(good)
        self.assertEqual(validate_metrics(good, allow_complete_prompt=True)['prefillTokens'], 0)
        for key, value in [('completePromptHits', 0), ('completePromptHits', True),
            ('reusedPrefixTokens', 1), ('reusedPrefixTokens', True), ('prefillRecords', 1),
            ('prefillPasses', [0]), ('prefillComputePasses', [0]), ('prefillReadBytes', 1),
            ('prefillReadBytes', False), ('promptTokens', 0), ('prefillSeconds', True)]:
            invalid = copy.deepcopy(good); invalid['stats'][key] = value
            with self.assertRaises(ValueError): validate_metrics(invalid, allow_complete_prompt=True)
        for permission in [1, None, 'true']:
            with self.assertRaises(ValueError): validate_metrics(good, allow_complete_prompt=permission)

    def test_complete_prompt_study_requires_warmup_logit_storage(self):
        p = {'arms': {'reference': {}, 'candidate': {}}, 'prefix_cache': {
            'expected_reused_tokens': {'reference': 0, 'candidate': 2}, 'complete_prompt': True}}
        expected = serve_bench.prefix_study(p)
        warm = {'prompt_ids': [17, 23], 'stats': {'reusedPrefixTokens': 0, 'prefixCheckpointStores': 0,
            'completePromptStores': 1, 'completePromptHits': 0, 'prefixCheckpointErrors': 0, 'prefixCheckpointRefusals': 0}}
        measured = {'prompt_ids': [17, 23], 'stats': warm['stats'] | {
            'reusedPrefixTokens': 2, 'prefixCheckpointForks': 1, 'completePromptHits': 1}}
        serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured, complete_prompt=True)
        with self.assertRaises(ValueError): serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured)
        for key, value in [('completePromptStores', 0), ('completePromptHits', 1), ('prefixCheckpointStores', 1)]:
            bad = copy.deepcopy(warm); bad['stats'][key] = value
            with self.assertRaises(ValueError):
                serve_bench.validate_prefix_observation(expected, 'candidate', bad, measured, complete_prompt=True)
        for ids in [[17], [17, 23, 31], [17, 24]]:
            with self.assertRaises(ValueError):
                serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured | {'prompt_ids': ids}, complete_prompt=True)
        for value in [1, None, 'true']:
            with self.assertRaises(ValueError): serve_bench.prefix_study(p | {'prefix_cache': p['prefix_cache'] | {'complete_prompt': value}})

    def test_resident_overlap_requires_a_completed_join_for_every_submission(self):
        counters = {'residentExpertPrelaunches': {'min': 1}, 'residentExpertJoins': {'min': 1}}
        protocol = {'arms': {'candidate': {}}, 'work_constraints': {'candidate': counters}}
        bounds = serve_bench.work_constraints(protocol)
        serve_bench.validate_work_observation(bounds, 'candidate',
            {'residentExpertPrelaunches': 3, 'residentExpertJoins': 3})
        for stats in [{'residentExpertPrelaunches': 3, 'residentExpertJoins': 2},
                      {'residentExpertPrelaunches': 2, 'residentExpertJoins': 3},
                      {'residentExpertPrelaunches': 1},
                      {'residentExpertPrelaunches': True, 'residentExpertJoins': 1}]:
            with self.assertRaises(ValueError): serve_bench.validate_work_observation(bounds, 'candidate', stats)
        for key in counters:
            with self.assertRaises(ValueError):
                serve_bench.work_constraints({'arms': protocol['arms'], 'work_constraints': {'candidate': {key: {'min': 1}}}})

    def test_prospective_work_constraints_refuse_inactive_or_missing_mechanisms(self):
        bounds = {'reference': {'decodeSlotCPUBatches': {'min': 0, 'max': 0}},
                  'candidate': {'decodeSlotCPUBatches': {'min': 1}, 'decodeModelTokens': {'min': 15, 'max': 15}}}
        protocol = {'arms': {'reference': {}, 'candidate': {}}, 'work_constraints': bounds}
        self.assertEqual(serve_bench.work_constraints(protocol), bounds)
        serve_bench.validate_work_observation(bounds, 'reference', {'decodeSlotCPUBatches': 0})
        serve_bench.validate_work_observation(bounds, 'candidate', {'decodeSlotCPUBatches': 47, 'decodeModelTokens': 15})
        for invalid in [0, -1, True, None, float('nan'), 1.5]:
            with self.assertRaises(ValueError):
                serve_bench.validate_work_observation(bounds, 'candidate', {'decodeSlotCPUBatches': invalid, 'decodeModelTokens': 15})
        for invalid in [None, {}, {'min': -1}, {'min': True}, {'min': 2, 'max': 1}, {'value': 1}]:
            changed = copy.deepcopy(protocol)
            changed['work_constraints']['candidate']['decodeSlotCPUBatches'] = invalid
            with self.assertRaises(ValueError): serve_bench.work_constraints(changed)
        for invalid in [{}, {'other': {}}, {'reference': {}, 'candidate': {'unknown': {'min': 1}}}]:
            with self.assertRaises(ValueError): serve_bench.work_constraints({'arms': protocol['arms'], 'work_constraints': invalid})
        self.assertIsNone(serve_bench.work_constraints({'arms': protocol['arms']}))
        serve_bench.validate_work_observation(None, 'reference', {})

    def test_explicit_frozen_binary_digest_cannot_silently_change(self):
        wanted='a'*64
        builds={'reference':{'identity':{'binary_sha256':wanted}},'candidate':{'identity':{'binary_sha256':wanted}}}
        serve_bench.validate_declared_binary({'frozen_binary_sha256':wanted},builds)
        changed=copy.deepcopy(builds);changed['candidate']['identity']['binary_sha256']='b'*64
        with self.assertRaises(ValueError): serve_bench.validate_declared_binary({'frozen_binary_sha256':wanted},changed)
        for invalid in [True,17,'x'*64,'A'*64,wanted[:-1]]:
            with self.assertRaises(ValueError): serve_bench.validate_declared_binary({'frozen_binary_sha256':invalid},builds)
        with self.assertRaises(ValueError): serve_bench.validate_declared_binary({'frozen_binary_sha256':wanted},{})

    def test_resource_savings_require_real_measurements_in_every_valid_pair(self):
        def cell(arm, active, peak):
            return {'round':1, 'arm':arm, 'valid':True, 'client_seconds':1, 'text':'same',
                'metrics':{'prompt_ids':[17], 'output_ids':[23], 'effective_mtp':False, 'effective_pool_slots':640,
                    'stats':{'requestSeconds':1, 'mlxActiveEndBytes':active, 'sampledFootprint':{'peakBytes':peak}}}}
        ref, cand = cell('reference',1000,2000), cell('candidate',700,1800)
        contract={'minimum_pairs':1,'maximum_median_client_regression':0.05,'minimum_positive_fraction':0,
            'all_outputs_exact':True,'minimum_active_savings_bytes':300,'minimum_sampled_peak_savings_bytes':200}
        result=summaries([ref,cand],'reference')
        self.assertTrue(acceptance_results(result,contract)[0]['passed'])
        for key,value in [('mlxActiveEndBytes',701),('sampledFootprint',{'peakBytes':1801}),
                          ('mlxActiveEndBytes',None),('sampledFootprint',None),('mlxActiveEndBytes',True)]:
            bad=copy.deepcopy(cand); bad['metrics']['stats'][key]=value
            self.assertFalse(acceptance_results(summaries([ref,bad],'reference'),contract)[0]['passed'])
        for invalid in [0,-1,True,1.5,float('inf')]:
            with self.assertRaises(ValueError):
                acceptance_results([],contract | {'minimum_active_savings_bytes':invalid})

    def test_declared_cooldown_holds_and_releases_the_model_reservation(self):
        with TemporaryDirectory() as d:
            path=Path(d)/'lock'
            def asleep(seconds):
                self.assertEqual(seconds,1)
                with path.open('a') as other:
                    with self.assertRaises(BlockingIOError): fcntl.flock(other,fcntl.LOCK_EX | fcntl.LOCK_NB)
            with patch('serve_bench.time.sleep',side_effect=asleep):
                result=serve_bench.reserved_cooldown(1,1,lock_path=path)
            self.assertTrue(result['reserved'])
            with path.open('a') as other: fcntl.flock(other,fcntl.LOCK_EX | fcntl.LOCK_NB)
        for invalid in [True,-1,1801,1.5,None]:
            with self.assertRaises(ValueError): serve_bench.reservation_wait_limit({'model_reservation_wait_seconds':invalid})

    def test_large_scope_study_keeps_explicit_memory_compute_and_abort_bounds(self):
        p = {'memory_gb':16,'max_tokens':1,'raw':True,
             'large_scope_measurement':{'purpose':'bounded scope qualification'},
             'abort_on_resource_failure':True,'require_nominal_power_state':True,
             'maximum_sampled_footprint_bytes':16_000_000_000,
             'arms':{'reference':{'chunk':256,'env':{}},'candidate':{'chunk':256,
                'env':{'SLOTSTREAM_OPT_READ_SCOPE':'1024','SLOTSTREAM_OPT_WORKSPACE_TILE':'256'}}}}
        self.assertEqual(measurement_memory(p),22)
        for change in [{'memory_gb':24,'maximum_sampled_footprint_bytes':24_000_000_000},
                       {'memory_gb':10}, {'max_tokens':5}, {'abort_on_resource_failure':False},
                       {'large_pool_measurement':{'purpose':'conflicting isolation'}}]:
            with self.assertRaises(ValueError): measurement_memory(p | change)
        for key,value in [('SLOTSTREAM_OPT_READ_SCOPE','4096'),('SLOTSTREAM_OPT_WORKSPACE_TILE','512')]:
            bad=copy.deepcopy(p); bad['arms']['candidate']['env'][key]=value
            with self.assertRaises(ValueError): measurement_memory(bad)

    def test_cooldown_is_explicit_bounded_and_finite(self):
        self.assertEqual(serve_bench.cell_cooldown({}),0)
        self.assertEqual(serve_bench.cell_cooldown({'between_cells_seconds':60}),60)
        for value in [True,-1,61,float('nan'),float('inf'),'60',None]:
            with self.assertRaises(ValueError): serve_bench.cell_cooldown({'between_cells_seconds':value})

    def test_prefix_study_requires_observed_committed_fork_and_exact_workload(self):
        protocol = {'arms': {'reference': {}, 'candidate': {}},
                    'prefix_cache': {'expected_reused_tokens': {'reference': 0, 'candidate': 256}}}
        expected = serve_bench.prefix_study(protocol)
        stats = {'reusedPrefixTokens': 0, 'prefixCheckpointStores': 1,
                 'prefixCheckpointErrors': 0, 'prefixCheckpointRefusals': 0}
        warm = {'prompt_ids': list(range(273)), 'stats': stats}
        measured = {'prompt_ids': list(range(273)), 'stats': stats | {
            'reusedPrefixTokens': 256, 'prefixCheckpointForks': 1}}
        serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured)
        for key,value in [('reusedPrefixTokens', 0), ('prefixCheckpointForks', 0),
                          ('prefixCheckpointErrors', 1), ('prefixCheckpointRefusals', 1)]:
            bad = copy.deepcopy(measured); bad['stats'][key] = value
            with self.assertRaises(ValueError):
                serve_bench.validate_prefix_observation(expected, 'candidate', warm, bad)
        for ids in [list(range(256)), [999] + list(range(1,273))]:
            with self.assertRaises(ValueError):
                serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured | {'prompt_ids':ids})
        for invalid in [False, {}, {'expected_reused_tokens': {'reference': 0}},
                        {'expected_reused_tokens': {'reference': 0, 'candidate': True}},
                        {'expected_reused_tokens': {'reference': 0, 'candidate': 0}}]:
            with self.assertRaises(ValueError): serve_bench.prefix_study(protocol | {'prefix_cache':invalid})

    def test_startup_amortization_preserves_first_job_and_pair_exclusions(self):
        def cell(name,start,first,request):
            return {'round':1,'arm':name,'valid':True,'startup_and_warmup_valid':True,
                    'startup_seconds':start,'client_seconds':request,
                    'first_request':{'prompt_ids':[1,2],'output_ids':[3,4],'text':'ok',
                        'effective_pool_slots':640,'effective_mtp':False,'complete_seconds_from_launch':first}}
        rows=[cell('reference',1,3,2),cell('candidate',7,10,1)]
        result=serve_bench.startup_summaries(rows,'reference')[0]
        self.assertEqual(result['median_startup_excess_seconds'],6)
        self.assertEqual(result['median_first_job_excess_seconds'],7)
        self.assertEqual(result['pairs'][0]['estimated_total_jobs_to_amortize'],8)
        rows[1]['startup_and_warmup_valid']=False
        self.assertEqual(serve_bench.startup_summaries(rows,'reference')[0]['excluded_rounds'],[1])
        rows[1]['startup_and_warmup_valid']=True
        rows[1]['first_request']['output_ids']=[9]
        self.assertEqual(serve_bench.startup_summaries(rows,'reference')[0]['pairs'],[])

    def test_startup_amortization_requires_finite_complete_measurements_and_saving(self):
        first={'prompt_ids':[1],'output_ids':[2],'text':'x','effective_pool_slots':640,'effective_mtp':False,
               'complete_seconds_from_launch':3}
        base={'round':1,'valid':True,'startup_and_warmup_valid':True,'startup_seconds':1,
              'client_seconds':2,'first_request':first}
        rows=[dict(base,arm='reference'),dict(base,arm='candidate')]
        self.assertIsNone(serve_bench.startup_summaries(rows,'reference')[0]['pairs'][0]['estimated_total_jobs_to_amortize'])
        for field,value in [('startup_seconds',float('nan')),('client_seconds',0),('client_seconds',None)]:
            bad=copy.deepcopy(rows);bad[1][field]=value
            self.assertEqual(serve_bench.startup_summaries(bad,'reference')[0]['pairs'],[])

    def test_long_context_gate_requires_completion_and_exact_observed_work(self):
        good = {'prompt_ids': [907] * 2049, 'output_ids': [17, 18],
                'stats': {'promptTokens': 2049, 'decodeTokens': 2, 'finishReason': 'stop'}}
        self.assertTrue(check_answer(good, '\nSeventeen.\n', 'SEVENTEEN', 2049, 16)['passed'])
        for text in ['<think> The user asks', 'The answer is SEVENTEEN or EIGHT.', 'EIGHTEEN', '']:
            with self.assertRaises(ValueError): check_answer(good, text, 'SEVENTEEN', 2049, 16)
        for key, value in [('finishReason', 'length'), ('runtimeError', 'read failed'),
                           ('promptTokens', 2048), ('decodeTokens', 3)]:
            bad = copy.deepcopy(good); bad['stats'][key] = value
            with self.assertRaises(ValueError): check_answer(bad, 'SEVENTEEN', 'SEVENTEEN', 2049, 16)
        bad = copy.deepcopy(good); bad['output_ids'] = []
        with self.assertRaises(ValueError): check_answer(bad, 'SEVENTEEN', 'SEVENTEEN', 2049, 16)
        bad = copy.deepcopy(good); bad['output_ids'][0] = True
        with self.assertRaises(ValueError): check_answer(bad, 'SEVENTEEN', 'SEVENTEEN', 2049, 16)

    def test_resource_acceptance_requires_real_active_savings_in_every_clean_pair(self):
        contract = {'minimum_pairs': 1, 'maximum_median_client_regression': .05,
                    'minimum_positive_fraction': 0, 'all_outputs_exact': True,
                    'minimum_sequence_reduction': .05, 'minimum_active_savings_share': .9}
        pair = {'client_reduction_fraction': 0, 'output_ids_equal': True, 'wire_text_equal': True,
                'sequence_reduction_fraction': .1, 'active_savings_share': 1}
        summary = [{'candidate': 'candidate', 'pairs': [pair], 'median_client_reduction_fraction': 0}]
        self.assertTrue(acceptance_results(summary, contract)[0]['passed'])
        for key in ['sequence_reduction_fraction', 'active_savings_share']:
            for invalid in [None, float('nan'), True, 0]:
                bad = copy.deepcopy(summary); bad[0]['pairs'][0][key] = invalid
                self.assertFalse(acceptance_results(bad, contract)[0]['passed'])
            bad = copy.deepcopy(summary); bad[0]['pairs'].append(pair | {key: None})
            self.assertFalse(acceptance_results(bad, contract)[0]['passed'])
        for invalid in [True, -1, float('nan'), 1.1]:
            with self.assertRaises(ValueError):
                acceptance_results([], contract | {'minimum_active_savings_share': invalid})

    def test_serving_arm_schema_refuses_delivery_errors_before_launch(self):
        good = {'reference': {'chunk': 256, 'env': {}},
                'candidate': {'chunk': 512, 'env': {'SLOTSTREAM_OPT_COMPACT_STATE': '1'}, 'binary': '/frozen/slotstream'}}
        serve_bench.validate_arms(good)
        for invalid in [None, [], {}, {'candidate': good['candidate']},
                {'reference': {'SLOTSTREAM_OPT_COMPACT_STATE': '1'}},
                {'reference': {'chunk': True, 'env': {}}},
                {'reference': {'chunk': 255, 'env': {}}},
                {'reference': {'chunk': 256, 'env': {'UNRELATED': '1'}}},
                {'reference': {'chunk': 256, 'env': {'SLOTSTREAM_OPT_COMPACT_STATE': True}}},
                {'reference': {'chunk': 256, 'env': {'SLOTSTREAM_PREFILL_CHUNK': '512'}}},
                {'reference': {'chunk': 256, 'env': {}, 'environ': {}}}]:
            with self.subTest(invalid=invalid), self.assertRaises(ValueError):
                serve_bench.validate_arms(invalid)

    def test_sampled_serving_freezes_typed_shared_parameters(self):
        protocol = {'max_tokens': 16, 'seed': 7}
        sampling = {'temperature': .7, 'top_p': .8, 'top_k': 20, 'min_p': 0, 'presence_penalty': 1.5}
        self.assertEqual(json.loads(request_body(protocol | {'sampling': sampling}, 'q'))['options'],
                         {'num_predict': 16, 'seed': 7} | sampling)
        for sampling in [{'seed': 8}, {'top_k': True}, {'temperature': '0.7'}, {'top_p': 0},
                         {'temperature': float('nan')}, {'min_p': 1.01}, {'top_k': -1},
                         {'presence_penalty': float('inf')}, [], None]:
            with self.assertRaises(ValueError): request_body(protocol | {'sampling': sampling}, 'q')

    def test_non_regression_is_separate_from_existing_gain_contracts(self):
        contract = {'minimum_pairs': 1, 'maximum_median_client_regression': .05,
                    'minimum_positive_fraction': 0, 'all_outputs_exact': True}
        item = {'candidate': 'candidate', 'pairs': [{'client_reduction_fraction': -.04,
                    'output_ids_equal': True, 'wire_text_equal': True}], 'median_client_reduction_fraction': -.04}
        self.assertTrue(acceptance_results([item], contract)[0]['passed'])
        item['median_client_reduction_fraction'] = -.050001
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        item['median_client_reduction_fraction'] = None
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        for value in [float('nan'), float('inf'), True, -.05, 1.1]:
            with self.assertRaises(ValueError):
                acceptance_results([], contract | {'maximum_median_client_regression': value})
        with self.assertRaises(ValueError):
            acceptance_results([], contract | {'minimum_median_client_reduction': .05})

    def test_cross_build_identity_checks_the_selected_executable(self):
        with TemporaryDirectory() as directory:
            root = Path(directory)
            for name in ['slotstream', 'mlx.metallib', 'build-source.tar.gz']:
                (root / name).write_bytes(name.encode())
            identity = {key: serve_bench.digest(root / name) for name, key in [
                ('slotstream', 'binary_sha256'), ('mlx.metallib', 'metallib_sha256'),
                ('build-source.tar.gz', 'source_archive_sha256')]}
            (root / 'build-identity.json').write_text(json.dumps(identity))
            self.assertEqual(serve_bench.verified_build(root / 'slotstream')['identity'], identity)
            (root / 'slotstream').write_bytes(b'changed')
            with self.assertRaises(ValueError): serve_bench.verified_build(root / 'slotstream')

    def test_memory_settling_waits_only_for_verified_headroom_and_has_a_deadline(self):
        now = [0.0]
        def sleep(seconds): now[0] += seconds
        error = serve_bench.InsufficientHeadroom('not yet reclaimed')
        with patch.object(serve_bench.time, 'monotonic', side_effect=lambda: now[0]), \
             patch.object(serve_bench.time, 'sleep', side_effect=sleep), \
             patch.object(serve_bench, 'preflight', side_effect=[error, error, {'reclaimable_bytes': 31_000_000_000}]):
            snapshot, observation = serve_bench.wait_for_headroom(30, 1)
        self.assertEqual(snapshot['reclaimable_bytes'], 31_000_000_000)
        self.assertEqual(observation['checks'], 3); self.assertEqual(observation['seconds'], .5)
        now[0] = 0
        with patch.object(serve_bench.time, 'monotonic', side_effect=lambda: now[0]), \
             patch.object(serve_bench.time, 'sleep', side_effect=sleep), \
             patch.object(serve_bench, 'preflight', side_effect=error):
            with self.assertRaises(serve_bench.InsufficientHeadroom): serve_bench.wait_for_headroom(30, .5)
        self.assertEqual(now[0], .5)
        with patch.object(serve_bench, 'preflight', side_effect=RuntimeError('another model owns the lock')) as check:
            with self.assertRaises(RuntimeError): serve_bench.wait_for_headroom(30, 30)
            self.assertEqual(check.call_count, 1)
        for value in [-1, 31, float('nan'), float('inf'), True]:
            with self.assertRaises(ValueError): serve_bench.wait_for_headroom(30, value)

    def test_large_pool_measurements_require_explicit_bounds_and_six_gb_headroom(self):
        small = {'memory_gb': 8.1}
        self.assertEqual(measurement_memory(small), 11.1)
        for value in [True, float('nan'), float('inf'), 8, 24.1]:
            with self.assertRaises(ValueError): measurement_memory({'memory_gb': value})
        large = {'memory_gb': 24, 'large_pool_measurement': {'purpose': 'isolate full-model all-hit decode'},
                 'abort_on_resource_failure': True, 'require_nominal_power_state': True,
                 'maximum_sampled_footprint_bytes': 24_000_000_000, 'max_tokens': 16,
                 'arms': {'reference': {'chunk': 256, 'env': {}}}}
        self.assertEqual(measurement_memory(large), 30)
        for key in ['large_pool_measurement', 'abort_on_resource_failure', 'require_nominal_power_state', 'maximum_sampled_footprint_bytes']:
            bad = copy.deepcopy(large); del bad[key]
            with self.assertRaises(ValueError): measurement_memory(bad)
        for change in [{'max_tokens': 65}, {'raw': False}, {'maximum_sampled_footprint_bytes': True},
                       {'large_pool_measurement': {'purpose': ''}}]:
            with self.assertRaises(ValueError): measurement_memory(large | change)
        bad = copy.deepcopy(large); bad['arms']['reference']['env']['SLOTSTREAM_OPT_LAYER_WORKSPACE'] = '1'
        with self.assertRaises(ValueError): measurement_memory(bad)

    def test_all_hit_label_requires_zero_prefill_and_decode_reads(self):
        contract = {'require_all_expert_hits': True}
        self.assertFalse(workload_exclusions({'prefillRecords': 0, 'decodeRecords': 0}, contract))
        for stats in [{}, {'prefillRecords': 1, 'decodeRecords': 0}, {'prefillRecords': 0, 'decodeRecords': 1},
                      {'prefillRecords': 0, 'decodeRecords': False}]:
            self.assertTrue(workload_exclusions(stats, contract))
        with self.assertRaises(ValueError): workload_exclusions({}, {'require_all_expert_hits': 'yes'})

    def test_memory_gate_uses_bytes_and_rejects_missing_samples_or_swap(self):
        stats = {'sampledFootprint': {'peakBytes': 10_000_000_000, 'samples': 3, 'intervalMilliseconds': 20},
                 'lifetimeRSSPeakBytes': 1_000_000_000, 'physicalFootprintEndBytes': 2_000_000_000,
                 'generatorVMBefore': {'swapins': 4, 'swapouts': 5},
                 'generatorVMAfter': {'swapins': 4, 'swapouts': 5}}
        self.assertTrue(check_memory({'stats': stats}, '10')['passed'])
        bad = copy.deepcopy(stats); bad['sampledFootprint']['peakBytes'] += 1
        with self.assertRaises(ValueError): check_memory({'stats': bad}, '10')
        bad = copy.deepcopy(stats); bad['generatorVMAfter']['swapins'] += 1
        with self.assertRaises(ValueError): check_memory({'stats': bad}, '10')
        bad = copy.deepcopy(stats); bad['sampledFootprint']['peakBytes'] = True
        with self.assertRaises(ValueError): check_memory({'stats': bad}, '10')
        for missing in ['sampledFootprint', 'generatorVMBefore', 'physicalFootprintEndBytes']:
            bad = copy.deepcopy(stats); del bad[missing]
            with self.assertRaises(KeyError): check_memory({'stats': bad}, '10')
        for image_kind in ['encodedImages', 'reusedImageFeatures', 'prefixSkippedImages']:
            bad = copy.deepcopy(stats); bad[image_kind] = 1
            with self.assertRaisesRegex(ValueError, 'missing its preparation'):
                check_memory({'stats': bad}, '10')
            bad[image_kind] = 0
            self.assertTrue(check_memory({'stats': bad}, '10')['passed'])
            for invalid in [True, -1, 0.5, '0']:
                bad[image_kind] = invalid
                with self.assertRaises(ValueError): check_memory({'stats': bad}, '10')

    def test_memory_gate_includes_first_image_preparation(self):
        stats = {'sampledFootprint': {'peakBytes': 7_000_000_000, 'samples': 3, 'intervalMilliseconds': 20},
                 'lifetimeRSSPeakBytes': 1_000_000_000, 'physicalFootprintEndBytes': 2_000_000_000,
                 'generatorVMBefore': {'swapins': 4, 'swapouts': 5},
                 'generatorVMAfter': {'swapins': 4, 'swapouts': 5},
                 'imagePreparation': {'sampledFootprint': {'peakBytes': 10_000_000_001, 'samples': 2, 'intervalMilliseconds': 20},
                                      'vmBefore': {'swapins': 4, 'swapouts': 5}, 'vmAfter': {'swapins': 4, 'swapouts': 5}}}
        with self.assertRaises(ValueError): check_memory({'stats': stats}, '10')
        stats['imagePreparation']['sampledFootprint']['peakBytes'] -= 1
        self.assertEqual(check_memory({'stats': stats}, 10)['maximum_observed_bytes'], 10_000_000_000)
        stats['imagePreparation']['vmAfter']['swapins'] += 1
        with self.assertRaises(ValueError): check_memory({'stats': stats}, 10)
        stats['imagePreparation']['vmAfter']['swapins'] -= 1
        stats['imagePreparation']['sampledFootprint'] = None
        with self.assertRaises(TypeError): check_memory({'stats': stats}, 10)

    def test_interrupted_serving_cell_stops_child_and_preserves_incomplete_result(self):
        # Exercise main's actual cleanup/persistence path without a model,
        # sockets, memory pressure, or an unbounded subprocess.
        with TemporaryDirectory() as directory:
            root = Path(directory); binary = root/'slotstream'; binary.write_bytes(b'fixture')
            (root/'build-source.tar.gz').write_bytes(b'fixture')
            (root/'mlx.metallib').write_bytes(b'fixture')
            (root/'build-identity.json').write_text(json.dumps({k: 'bound' for k in
                ['binary_sha256', 'metallib_sha256', 'source_archive_sha256']}))
            fixture = root/'prompt.txt'; fixture.write_text('test')
            protocol = {'arms': {'reference': {'chunk': 256, 'env': {}}},
                        'model': str(root), 'binary': str(binary), 'fixture': str(fixture),
                        'fixture_sha256': 'bound', 'memory_gb': 8.1, 'rounds': 1,
                        'max_tokens': 16, 'seed': 7}
            p = root/'protocol.json'; p.write_text(json.dumps(protocol)); out = root/'result'
            child = SimpleNamespace(pid=999_999)
            warm = {'text':'ok','metrics': {'stats': {'decodeTokens':16},'prompt_ids':[1],
                    'output_ids':[2]*16,'effective_pool_slots':640,'effective_mtp':False}}
            vm = {'swapins':0,'swapouts':0}
            with patch.object(serve_bench, 'digest', return_value='bound'), \
                 patch.object(serve_bench, 'model_identity', return_value={}), \
                 patch.object(serve_bench, 'preflight', return_value=vm), \
                 patch.object(serve_bench, 'host_conditions', return_value={}), \
                 patch.object(serve_bench, 'vm_snapshot', return_value=vm), \
                 patch.object(serve_bench.subprocess, 'Popen', return_value=child), \
                 patch.object(serve_bench, 'wait_ready'), \
                 patch.object(serve_bench, 'exchange', side_effect=[(warm, b'{}\n'), KeyboardInterrupt]), \
                 patch.object(serve_bench, 'stop_server') as stopped, \
                 patch('sys.argv', ['serve_bench', '--protocol', str(p), '--out', str(out)]), \
                 redirect_stdout(io.StringIO()):
                code = serve_bench.main()
            self.assertEqual(code, 130); stopped.assert_called_once_with(child)
            row = json.loads((out/'1-reference/result.json').read_text())
            self.assertTrue(row['interrupted']); self.assertFalse(row['valid'])
            completion = json.loads((out/'completion.json').read_text())
            self.assertTrue(completion['interrupted']); self.assertEqual(completion['recorded_cells'], 1)
            self.assertIsNone(completion['acceptance'])

    def test_declared_resource_limits_fail_closed(self):
        p = {'maximum_sampled_footprint_bytes': 10_000_000_000}
        self.assertTrue(resource_exclusions({}, p))
        self.assertTrue(resource_exclusions({'sampledFootprint': None}, p))
        self.assertTrue(resource_exclusions({'sampledFootprint': {'peakBytes': 10_000_000_001}}, p))
        self.assertFalse(resource_exclusions({'sampledFootprint': {'peakBytes': 10_000_000_000}}, p))
        self.assertFalse(resource_exclusions({}, {}))
        with self.assertRaises(ValueError): resource_exclusions({}, {'maximum_sampled_footprint_bytes': True})
        nominal = {'thermalState': 'nominal', 'lowPowerModeEnabled': False}
        s = {'generatorSystemBefore': nominal, 'generatorSystemAfter': nominal}
        p = {'require_nominal_power_state': True}
        self.assertFalse(resource_exclusions(s, p))
        self.assertTrue(resource_exclusions({}, p))
        s['generatorSystemAfter'] = nominal | {'thermalState': 'serious'}
        self.assertTrue(resource_exclusions(s, p))
        s['generatorSystemAfter'] = 'nominal'
        self.assertTrue(resource_exclusions(s, p))
        with self.assertRaises(ValueError): resource_exclusions({}, {'require_nominal_power_state': 'true'})

    def test_frozen_acceptance_rejects_insufficient_or_unequal_work(self):
        contract = {'minimum_pairs': 2, 'minimum_median_client_reduction': .05,
                    'minimum_positive_fraction': .8, 'all_outputs_exact': True}
        pair = {'client_reduction_fraction': .1, 'output_ids_equal': True, 'wire_text_equal': True}
        item = {'candidate': 'c', 'pairs': [pair.copy(), pair.copy()], 'median_client_reduction_fraction': .1}
        self.assertTrue(acceptance_results([item], contract)[0]['passed'])
        item['pairs'][-1]['output_ids_equal'] = False
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        item['pairs'].pop()
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        item['pairs'] = []; item['median_client_reduction_fraction'] = None
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        for value in [float('nan'), float('inf'), True, -.1]:
            with self.assertRaises(ValueError): acceptance_results([], contract | {'minimum_positive_fraction': value})

    def test_serving_workload_uses_explicit_template_and_seed(self):
        protocol = {'max_tokens': 16, 'seed': 7}
        body = json.loads(request_body(protocol, 'λ\n"query"'))
        self.assertEqual(body['prompt'], 'λ\n"query"')
        self.assertTrue(body['raw'])
        self.assertNotIn('think', body)
        body = json.loads(request_body(protocol | {'raw': False, 'think': False}, 'query'))
        self.assertFalse(body['raw']); self.assertFalse(body['think'])
        self.assertEqual(body['options'], {'temperature': 0, 'num_predict': 16, 'seed': 7})
        for setting in [{'raw': 'false'}, {'think': False}, {'raw': False, 'think': 'false'}]:
            with self.assertRaises(ValueError): request_body(protocol | setting, 'query')

    def test_serving_summary_keeps_client_and_generator_metrics_separate(self):
        rows = [{'round': 1, 'arm': arm, 'valid': True, 'client_seconds': client, 'text': 'same',
                 'metrics': {'prompt_ids': [1], 'output_ids': [2], 'effective_pool_slots': 640,
                             'effective_mtp': False, 'stats': {'requestSeconds': generator}}}
                for arm, client, generator in [('reference', 10, 10), ('candidate', 10.6, 10.4)]]
        result = summaries(rows, 'reference')[0]
        self.assertAlmostEqual(result['median_client_reduction_fraction'], -.06)
        self.assertAlmostEqual(result['median_generator_reduction_fraction'], -.04)
        for row in rows: row['metrics']['stats']['decodeRecords'] = 10
        self.assertEqual(len(summaries(rows, 'reference', required_equal_work=['decodeRecords'])[0]['pairs']), 1)
        for value in [9, None, True, -1, float('nan')]:
            rows[-1]['metrics']['stats']['decodeRecords'] = value
            self.assertEqual(summaries(rows, 'reference', required_equal_work=['decodeRecords'])[0]['pairs'], [])
        for fields in ['decodeRecords', ['typo'], ['decodeRecords', 'decodeRecords'], [True]]:
            with self.assertRaises(ValueError): summaries([], 'reference', required_equal_work=fields)
        rows[-1]['metrics']['effective_pool_slots'] = 639
        self.assertEqual(summaries(rows, 'reference')[0]['pairs'], [])
        self.assertEqual(len(summaries(rows, 'reference', 'fixed-total-memory')[0]['pairs']), 1)
        with self.assertRaises(ValueError): summaries([], 'reference', 'unbounded')
        rows[-1]['valid'] = False
        result = summaries(rows, 'reference')[0]
        self.assertEqual(result['pairs'], []); self.assertEqual(result['excluded_rounds'], [1])

    def test_comparison_excludes_whole_pair(self):
        rows = []
        for round_number in [1, 2]:
            for arm in ["reference", "candidate"]:
                rows.append({"prompt":"p", "chunk":256, "round":round_number, "arm":arm,
                    "valid": not (round_number == 1 and arm == "candidate"),
                    "metrics":{"prompt_ids":[1,2], "output_ids":[3], "effective_pool_slots":640,
                               "stats":{"requestSeconds": 100 if round_number == 1 else (2 if arm == "reference" else 1)}}})
        result = paired_summary(rows, "reference")[0]
        self.assertEqual(result["excluded_rounds"], [1])
        self.assertEqual(result["median_request_reduction_fraction"], .5)
        self.assertEqual(len(result["pairs"]), 1)
        rows[-1]["metrics"]["prompt_ids"] = [2,3]
        self.assertIsNone(paired_summary(rows, "reference")[0]["median_request_reduction_fraction"])

    def test_reclaimable_uses_real_page_size_and_file_backed(self):
        for size in (4096, 16384):
            raw = f'''Mach Virtual Memory Statistics: (page size of {size} bytes)
Pages free: 11.
Pages inactive: 9999.
Pages speculative: 9999.
Pages purgeable: 13.
File-backed pages: 17.
Swapins: 19.
Swapouts: 23.
'''
            s = vm_snapshot(raw)
            self.assertEqual(s["reclaimable_bytes"], 41*size)
            self.assertEqual((s["swapins"], s["swapouts"]), (19, 23))

    def test_missing_memory_fields_fail_closed(self):
        with self.assertRaises(ValueError): vm_snapshot("page size of 4096 bytes\nPages free: 9.\n")

    def test_metrics_fail_closed(self):
        good = {"schema_version": 1, "stats": {"prefillSeconds": 1.0, "decodeSeconds": 0.2,
                "requestSeconds": 1.2, "imageEncodeSeconds": 0, "prefillRecords": 17,
                "decodeRecords": 3, "prefillTokens": 2, "promptTokens": 2, "decodeTokens": 1,
                "lifetimeRSSPeakBytes": 123, "prefillPasses": [2]}, "prompt_ids": [1,2], "output_ids": [3]}
        self.assertEqual(validate_metrics(good)["prefillRecords"], 17)
        for key, value in [("prefillSeconds", float("nan")), ("decodeSeconds", -1),
                           ("prefillRecords", None), ("decodeRecords", 0.5),
                           ("prefillTokens", 0), ("prefillPasses", [1]), ("decodeTokens", 2)]:
            with self.subTest(key=key):
                bad = copy.deepcopy(good); bad["stats"][key] = value
                with self.assertRaises(ValueError): validate_metrics(bad)
        bad = copy.deepcopy(good); del bad["stats"]["prefillRecords"]
        with self.assertRaises(ValueError): validate_metrics(bad)


if __name__ == "__main__": unittest.main()

````

Artifact `/tmp/slotstream-optimization-execution/protocol-preflight-v161.py` — 1955 bytes, SHA-256 `4c19044947447a9d69c81e7712d92f92709db8b7fcb4204b9ad7e7285582a698`.

````text
from pathlib import Path
import hashlib,json,sys
r=Path('/Users/carlos/Projects/slotstream');sys.path.insert(0,str(r/'Tools'))
import serve_bench as b
protocols=['terminal-tail-serving-protocol-v155.json','gdn-projection-short-serving-protocol-v156.json','gdn-projection-prefill-serving-protocol-v156.json','vision-query-1536-12gb-protocol-v159.json','vision-query-1536-capacity-protocol-v160.json']
results=[]
for name in protocols:
 p=r/'.build/optimization'/name;d=json.loads(p.read_text())
 b.validate_arms(d['arms']); b.prefix_study(d); b.work_constraints(d)
 b.startup_acceptance_results([], 'reference', d.get('startup_acceptance'))
 b.contention_guard(d); b.workspace_quiet_requirement(d); b.cell_cooldown(d); b.reservation_wait_limit(d)
 b.fixed_pool_budget(d); b.summaries([], 'reference',d['comparison_basis'],d.get('required_equal_work'))
 b.acceptance_results([],d.get('acceptance'));b.resource_exclusions({},d);b.workload_exclusions({},d)
 needed=b.measurement_memory(d)
 builds={k:b.verified_build(v.get('binary',d['binary'])) for k,v in d['arms'].items()}
 b.validate_declared_binary(d,builds)
 fixture=Path(d['fixture']);assert b.digest(fixture)==d['fixture_sha256']
 warm=b.warmup_fixture(d,fixture);images=b.image_fixtures(d)
 request=json.loads(b.request_body(d,fixture.read_text(),images=images));b.request_body(d,warm.read_text(),images=images)
 prereqs=d.get('native_prerequisites',{})
 for key,value in prereqs.items():
  assert value.get('passed') is True,(name,key)
  assert b.digest(Path(value['path']))==value['sha256'],(name,key)
 results.append({'protocol':str(p),'sha256':b.digest(p),'passed':True,'required_reclaimable_gb':needed,'images':len(images),'request_bytes':len(json.dumps(request)),'prerequisites_verified':len(prereqs)})
output={'kind':'static protocol preflight only; no server, model, build or performance run','protocols':results,'passed':all(v['passed'] for v in results)}
print(json.dumps(output,indent=2))

````
