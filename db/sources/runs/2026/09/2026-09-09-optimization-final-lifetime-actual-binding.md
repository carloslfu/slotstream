---
type: run
id: 01m24qzfcsczz3b64a19hdme28
created: 2026-09-10T04:07:25.336754+00:00
updated: 2026-09-10T04:07:26.078563+00:00
summary: Original final lifetimes bind successfully to all eight completed paired studies
binary: /Users/carlos/Projects/slotstream/.build/optimization/final-composition-build-v519/candidate/slotstream
captured_at: 2026-09-09
command: Unchanged V583 serial queue runs V570 prepare, followed by original guarded lifetime/readiness execution
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Original final lifetimes bind successfully to all eight completed paired studies
tool: Slotstream exact native and source qualification capture
---
Actual preparation succeeds after all8 final paired studies, complete25-check verification and isolated31-check installation qualification. Both original60-request lifetimes bind to the exact final build, all7 native proofs, all8 paired proofs and actual public-consumer planner proof. Original off10GB/on12GB contracts, allrequests, empty-environment final defaults, source/driver/acceptance and fulltime allowances remain unchanged. The prepared V583 queue retains original120-second stage readiness at13/15GBstartup and then the two prospective adaptive-schedule long studies. These are closed preparation files and the completed preparation-stage receipt only; active readiness/measurement directories are intentionally excluded. No lifetime result, sustained-TPS gain, full-plan completion or user installation activation is claimed.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-lifetime-v570/corrected/driver.py",
    "bytes": 33093,
    "sha256": "f72f68e49fce8befdf8d2201db5e1ae3c83a5501700c08a2fd7410c4b80a4ea3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-lifetime-v570/corrected/qualification-contract.json",
    "bytes": 69413,
    "sha256": "48846093151cefc74274bada9f62050ab22b7bf7b9fa6265b1de282c1361d509"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-lifetime-v570/preparation.json",
    "bytes": 12551,
    "sha256": "7dc7486a0bf9c49f655dc117e75f6963a0320f07bef5f21b501e462bada34304"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-lifetime-long-serial-v583/binding.json",
    "bytes": 12078,
    "sha256": "4dc80d43155fcf525d87f336219aca84efab42212e8f08d2d4bf6682ee686f47"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-lifetime-long-serial-v583/lifetime-prepare/completion.json",
    "bytes": 21,
    "sha256": "81868a6e94ffc0178bf833deb1c9013d9fab4ee95ddb876a5e8ec4f1d26376d2"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-lifetime-long-serial-v583/lifetime-prepare/launch.json",
    "bytes": 199,
    "sha256": "5c8455a1bd286d959db1dc2368621461fa68f8abf31d2cd5bfee35839c9c3f46"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-lifetime-long-serial-v583/lifetime-prepare/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-lifetime-long-serial-v583/lifetime-prepare/stdout.txt",
    "bytes": 9959,
    "sha256": "0d3bf18ed797f95893fcf2e22d4fd1de743aae009679d5f08c73db9c14fed325"
  }
]
```

## Artifact SHA-256 f72f68e49fce8befdf8d2201db5e1ae3c83a5501700c08a2fd7410c4b80a4ea3

Encoding: `utf-8`. Original bytes: 33093.

````````````text
#!/usr/bin/env python3
"""Bounded repeated-request lifetime qualification; no latency improvement claims."""
import argparse
from contextlib import contextmanager
import http.client
import json
import math
import os
from pathlib import Path
import shutil
import signal
import socket
import subprocess
import time

import sys
sys.path.insert(0, '/Users/carlos/Projects/slotstream/Tools')

import serve_bench as bench
from prefill_bench import ROOT, digest, model_identity, preflight, vm_snapshot


@contextmanager
def wall_deadline(seconds):
    """Bound the complete live-server interval, including a stalled response.

    Socket timeouts alone bound each blocking read, not a stream that keeps
    delivering small frames. This standalone driver owns its main-thread timer.
    Cleanup happens outside the deadline so the owned server is always reaped.
    """
    if signal.getitimer(signal.ITIMER_REAL) != (0.0, 0.0):
        raise RuntimeError('another real-time alarm is already active')
    previous = signal.getsignal(signal.SIGALRM)
    def expired(signum, frame):
        raise TimeoutError('fixed lifetime duration exhausted')
    signal.signal(signal.SIGALRM, expired)
    try:
        signal.setitimer(signal.ITIMER_REAL, seconds)
        yield
    finally:
        signal.setitimer(signal.ITIMER_REAL, 0)
        signal.signal(signal.SIGALRM, previous)


def clean_resource_observation(row, protocol):
    metrics = row.get('metrics') or {}
    stats = metrics.get('stats') or {}
    errors = bench.resource_exclusions(stats, {
        'maximum_sampled_footprint_bytes': protocol['acceptance']['maximum_sampled_physical_peak_bytes'],
        'require_nominal_power_state': True,
        'images': row.get('has_image', False),
    })
    for before, after in [(row.get('before'), row.get('after')),
                          (stats.get('generatorVMBefore'), stats.get('generatorVMAfter'))]:
        if not isinstance(before, dict) or not isinstance(after, dict) or any(
            type(before.get(k)) is not int or type(after.get(k)) is not int or before[k] != after[k]
            for k in ['swapins', 'swapouts']):
            errors.append('missing or changed VM interval')
    return not errors, errors


def assess(protocol, rows):
    gate = protocol['acceptance']
    names = [item['name'] for item in protocol['sequence']]
    cycles = protocol['measured_cycles']
    warmup = protocol['warmup_cycles']
    expected = [(cycle, name) for cycle in range(-warmup, cycles) for name in names]
    coordinates = [(row['cycle'], row['name']) for row in rows]
    if len(coordinates) != len(set(coordinates)) or any(c not in expected for c in coordinates):
        raise ValueError('duplicate or undeclared soak request')
    checks = {'fixed_sequence_completed': coordinates == expected,
              'all_requests_succeeded': all(row.get('succeeded') is True for row in rows)}
    # Runtime failures and absolute overflows are failures even during warmup.
    peaks = [bench.sampled_request_peak((r.get('metrics') or {}).get('stats') or {}) for r in rows]
    checks['physical_ceiling'] = bool(peaks) and all(type(p) is int and 0 < p <=
        gate['maximum_sampled_physical_peak_bytes'] for p in peaks)
    details = []
    for name in names:
        selected = [r for r in rows if r['cycle'] >= 0 and r['name'] == name]
        clean = [r for r in selected if clean_resource_observation(r, protocol)[0]]
        early = [r for r in clean if r['cycle'] < cycles // 2]
        late = [r for r in clean if r['cycle'] >= cycles // 2]
        one = {'minimum_clean_observations': len(clean) >= gate['minimum_clean_observations_per_position'],
               'early_observations': len(early) >= gate['minimum_clean_early_observations_per_position'],
               'late_observations': len(late) >= gate['minimum_clean_late_observations_per_position']}
        outputs = [(r.get('metrics', {}).get('output_ids'), r.get('text')) for r in selected]
        one['exact_replay'] = bool(outputs) and bool(outputs[0][0]) and all(v == outputs[0] for v in outputs)
        growth = {}
        for field, limit in [('mlxActiveEndBytes', gate['maximum_active_growth_bytes_per_position']),
                             ('physicalFootprintEndBytes', gate['maximum_physical_end_growth_bytes_per_position'])]:
            a = [r['metrics']['stats'].get(field) for r in early]
            b = [r['metrics']['stats'].get(field) for r in late]
            valid = bool(a) and bool(b) and all(type(v) is int and v > 0 for v in a + b)
            growth[field] = max(b) - min(a) if valid else None
            one[field] = valid and growth[field] <= limit
        embedding_bytes = [(r.get('metrics') or {}).get('stats', {}).get('embeddingCachedPayloadBytes')
                           for r in selected]
        one['bounded_embedding_rows'] = bool(embedding_bytes) and all(
            type(value) is int and 0 <= value <= gate['maximum_cached_embedding_payload_bytes']
            for value in embedding_bytes)
        one['embedding_rows_enabled'] = bool(selected) and all(
            (r.get('metrics') or {}).get('stats', {}).get('embeddingRowsEnabled') is True for r in selected)
        one['bounded_prefix_capacity'] = bool(selected) and all(
            r.get('prefix', {}).get('enabled') is True
            and type(r['prefix'].get('conversations')) is int
            and 1 <= r['prefix']['conversations'] <= gate['maximum_prefix_entries']
            and type(r['prefix'].get('charged_token_capacity')) is int
            and type(r['prefix'].get('max_tokens')) is int
            and 0 <= r['prefix']['charged_token_capacity'] <= r['prefix']['max_tokens']
            for r in selected)
        details.append({'name': name, 'passed': all(one.values()), 'checks': one,
                        'clean_cycles': [r['cycle'] for r in clean], 'observed_growth_bytes': growth})
    checks['positions_pass'] = all(d['passed'] for d in details)
    return {'classification': 'Bounded repeated-request lifetime qualification; no throughput or unbounded-lifetime claim',
            'passed': all(checks.values()), 'checks': checks, 'positions': details}


def prefix_snapshot(port):
    connection = http.client.HTTPConnection('127.0.0.1', port, timeout=10)
    try:
        connection.request('POST', '/api/show', b'{}', {'Content-Type': 'application/json'})
        response = connection.getresponse()
        data = response.read(1 << 20)
        if response.status != 200 or len(data) >= 1 << 20:
            raise ValueError('bounded prefix snapshot unavailable')
        return json.loads(data)['details']['prefix_cache']
    finally:
        connection.close()


def qualification_contract(protocol, build):
    """Bind every workload and control to one reviewed pre-run matrix.

    A passing report with the right build and a different directory can still
    be the wrong workload. The separate frozen contract prevents relabeling a
    study or changing the soak's controls after its prerequisites were run.
    """
    binding = protocol.get('qualification_contract')
    if not isinstance(binding, dict) or set(binding) != {'path', 'sha256'}:
        raise ValueError('a frozen qualification contract is required')
    path = Path(binding['path'])
    if not path.is_file() or not 0 < path.stat().st_size <= 2_000_000 or digest(path) != binding['sha256']:
        raise ValueError('qualification contract identity or size differs')
    contract = json.loads(path.read_text())
    keys = {'format', 'build_identity', 'native', 'paired_protocols', 'soak_modes'}
    if not isinstance(contract, dict) or set(contract) != keys or contract['format'] != 'slotstream-qualification-v1':
        raise ValueError('invalid qualification contract format')
    identity_keys = {'binary_sha256', 'source_archive_sha256', 'metallib_sha256'}
    identity = contract['build_identity']
    if not isinstance(identity, dict) or set(identity) != identity_keys or any(
            not isinstance(identity[k], str) or len(identity[k]) != 64
            or identity[k] != build['identity'].get(k) for k in identity_keys):
        raise ValueError('qualification contract belongs to another build')
    modes = contract['soak_modes']
    declared = {k: v for k, v in protocol.items() if k not in {'qualification_contract', 'prerequisites'}}
    if (not isinstance(modes, dict) or set(modes) != {'off', 'on'}
            or declared != modes.get(protocol.get('mtp'))):
        raise ValueError('soak workload or controls differ from the frozen qualification contract')
    return contract


def validate_paired_execution(name, protocol, rows, warmups):
    """Timing exclusions never excuse wrong, missing or over-budget requests.

    The final matrix may exclude completed cells from timing for VM/thermal
    activity. Every attempted cell must still deliver the frozen workload and
    the same outputs. A preflight refusal leaves final qualification incomplete.
    This does not rescore or modify earlier component studies.
    """
    def refuse(reason):
        raise ValueError(f'paired execution failed for {name}: {reason}')

    mode = protocol.get('mtp', 'off')
    ceiling = protocol.get('maximum_sampled_footprint_bytes')
    minimum, maximum = protocol.get('minimum_output_tokens'), protocol.get('max_tokens')
    if (type(mode) is not str or mode not in {'off', 'on'} or type(ceiling) is not int or ceiling <= 0
            or type(minimum) is not int or type(maximum) is not int
            or not 1 <= minimum <= maximum <= 512):
        refuse('missing or invalid workload/resource bounds')
    anchors, pools, work = {}, {}, {}
    for row in rows:
        if 'error' in row or row.get('interrupted') is True:
            refuse('failed or interrupted request, regardless of timing eligibility')
        arm = protocol.get('arms', {}).get(row.get('arm'), {})
        metrics, first = row.get('metrics'), row.get('first_request')
        if type(metrics) is not dict or type(first) is not dict:
            refuse('both first and measured responses must be captured')
        for phase, data, text in [('first', first, first.get('text')),
                                  ('measured', metrics, row.get('text'))]:
            prompt, output = data.get('prompt_ids'), data.get('output_ids')
            if (type(prompt) is not list or not prompt or type(output) is not list
                    or not minimum <= len(output) <= maximum
                    or any(type(token) is not int or token < 0 for token in prompt + output)
                    or type(text) is not str):
                refuse(f'{phase} response has missing, malformed or truncated tokens/text')
            if type(data.get('effective_mtp')) is not bool or data['effective_mtp'] != (mode == 'on'):
                refuse(f'{phase} speculative mode differs from the declared workload')
            slots = data.get('effective_pool_slots')
            if type(slots) is not int or slots <= 0:
                refuse(f'{phase} pool size is missing or invalid')
            if protocol.get('comparison_basis', 'fixed-pool') == 'fixed-pool':
                if slots != pools.setdefault(phase, slots):
                    refuse(f'{phase} fixed pool differs between cells')
            observation = (tuple(prompt), tuple(output), text)
            if observation != anchors.setdefault(phase, observation):
                refuse(f'{phase} input/output differs, including a timing-excluded cell')
        if metrics.get('effective_prefill_chunk') != arm.get('chunk'):
            refuse('measured prefill setting differs from the frozen arm')
        if type(metrics.get('stats')) is not dict:
            refuse('measured statistics are missing or malformed')
        warm = warmups[(row['round'], row['arm'])]
        warm_metrics = warm.get('metrics') if type(warm) is dict else None
        if (type(warm_metrics) is not dict or type(warm_metrics.get('stats')) is not dict
                or warm.get('text') != first.get('text')
                or any(warm_metrics.get(field) != first.get(field) for field in
                       ['prompt_ids', 'output_ids', 'effective_mtp', 'effective_pool_slots'])
                or warm_metrics.get('effective_prefill_chunk') != arm.get('chunk')):
            refuse('hashed warmup response differs from its captured first request')
        prefix = protocol.get('prefix_cache', {})
        complete = (prefix.get('complete_prompt') is True
                    and prefix.get('expected_reused_tokens', {}).get(row['arm'], 0) > 0)
        try:
            stats = bench.validate_metrics(metrics, allow_complete_prompt=complete)
            warm_stats = bench.validate_metrics(warm_metrics)
        except (KeyError, TypeError, ValueError) as error:
            refuse(f'invalid measured response: {error}')
        for phase, data, observation in [('first', warm_metrics, warm_stats),
                                          ('measured', metrics, stats)]:
            reused = observation.get('reusedPrefixTokens', 0)
            if (observation.get('runtimeError') is not None
                    or observation['decodeTokens'] != len(data['output_ids'])
                    or type(observation.get('promptTokens')) is not int
                    or observation['promptTokens'] != len(data['prompt_ids'])
                    or type(reused) is not int or reused < 0
                    or observation['prefillTokens'] + reused != observation['promptTokens']):
                refuse(f'{phase} completion error or token counters differ from captured IDs')
        peaks = [bench.sampled_request_peak(s) for s in [stats, warm_stats]]
        if any(type(peak) is not int or not 0 < peak <= ceiling for peak in peaks):
            refuse('absolute first/measured footprint ceiling, regardless of timing eligibility')
        durations = [row.get('client_seconds'), row.get('startup_seconds'),
                     first.get('complete_seconds_from_launch'), stats.get('requestSeconds')]
        if any(type(value) not in (int, float) or not math.isfinite(value) or value <= 0
               for value in durations):
            refuse('missing or invalid completed-request duration')
        for field in protocol.get('required_equal_work', []):
            value = stats.get(field)
            if type(value) is not int or value < 0 or value != work.setdefault(field, value):
                refuse(f'declared equal work differs: {field}')


def validate_prerequisites(protocol, build, *, native_only=False):
    """Require the final candidate's native and paired evidence before launch.

    Digests bind the exact reports; same-binary/source/Metal identity prevents
    borrowing a passing gate from an earlier implementation. Paired decisions
    are recomputed from their frozen rows using the ordinary benchmark gates.
    The campaign's pre-benchmark boundary may request native_only; the actual
    soak entry point always requires every native and paired prerequisite.
    """
    if type(native_only) is not bool:
        raise ValueError('native-only boundary requires an explicit Boolean')
    required_native = {'combined-plain', 'combined-mtp', 'read-failure-serving'}
    required_paired = {'short-one', 'unique-prose', 'sampled-short', 'mtp-resource',
                       'distinct-tail', 'complete-repeat', 'unique-with-retention', 'actual-default-one-token'}
    prerequisites = protocol.get('prerequisites')
    if not isinstance(prerequisites, dict) or set(prerequisites) != {'native', 'paired'}:
        raise ValueError('native and paired final-candidate prerequisites are mandatory')
    for kind, names in [('native', required_native), ('paired', required_paired)]:
        if native_only and kind == 'paired':
            continue
        if not isinstance(prerequisites[kind], dict) or set(prerequisites[kind]) != names:
            raise ValueError(f'complete {kind} prerequisite set required')
    contract = qualification_contract(protocol, build)
    for field, names in [('native', required_native), ('paired_protocols', required_paired)]:
        if not isinstance(contract[field], dict) or set(contract[field]) != names:
            raise ValueError(f'qualification contract requires every {field} workload')

    def same_identity(identity):
        return isinstance(identity, dict) and all(identity.get(k) == build['identity'].get(k)
            and isinstance(identity.get(k), str) and len(identity[k]) == 64
            for k in ['binary_sha256', 'source_archive_sha256', 'metallib_sha256'])

    def evidence(entry, name):
        path = Path(entry['directory']) / name
        expected = entry.get('sha256', {}).get(name)
        if type(expected) is not str or not path.is_file() or digest(path) != expected:
            raise ValueError(f'prerequisite digest differs: {path}')
        return path

    # Preserve the exact parsed contract with the receipt, not just its path.
    observed = {'qualification_contract': contract}
    for name, entry in prerequisites['native'].items():
        manifest = json.loads(evidence(entry, 'manifest.json').read_text())
        report = json.loads(evidence(entry, 'stdout.txt').read_text())
        items = report.get('items')
        if (not same_identity(manifest.get('identity')) or manifest.get('passed') is not True
                or manifest.get('exit_code') != 0 or report.get('passed') is not True
                or report.get('skipped') is not None or not isinstance(items, list) or not items
                or any(item.get('passed') is not True for item in items)
                or manifest.get('assertions') != len(items)):
            raise ValueError(f'native prerequisite failed or belongs to another build: {name}')
        command = manifest.get('command') or []
        if contract['native'][name] != {'command': command, 'environment': manifest.get('environment', {})}:
            raise ValueError(f'native workload or controls differ from the frozen contract: {name}')
        variants = {'combined-plain': ['integrated', 'integrated-vision-query'],
                    'combined-mtp': ['integrated-mtp', 'integrated-vision-query-mtp'],
                    'read-failure-serving': ['read-failure-serving']}[name]
        if ('optimization-state-check' not in command or '--variant' not in command
                or command.index('--variant') + 1 >= len(command)
                or command[command.index('--variant') + 1] not in variants):
            raise ValueError(f'native prerequisite has the wrong diagnostic: {name}')
        observed[name] = {'passed': True, 'assertions': len(items)}

    if native_only:
        return observed

    paired_directories = [str(Path(entry['directory']).resolve()) for entry in prerequisites['paired'].values()]
    if len(set(paired_directories)) != len(required_paired):
        raise ValueError('each paired workload requires its own study')
    for name, entry in prerequisites['paired'].items():
        manifest = json.loads(evidence(entry, 'manifest.json').read_text())
        completion = json.loads(evidence(entry, 'completion.json').read_text())
        rows = [json.loads(line) for line in evidence(entry, 'results.jsonl').read_text().splitlines()]
        declared = manifest['protocol']
        if declared != contract['paired_protocols'][name]:
            raise ValueError(f'paired workload or controls differ from the frozen contract: {name}')
        if name == 'actual-default-one-token':
            selected = declared.get('arms', {}).get('combined', {})
            prefix = declared.get('prefix_cache', {})
            if (selected.get('env') != {} or declared.get('max_tokens') != 1
                    or declared.get('minimum_output_tokens') != 1
                    or prefix.get('retention_only') is not True
                    or prefix.get('expected_reused_tokens') != {'reference': 0, 'combined': 0}):
                raise ValueError('actual-default guard requires unoverridden defaults, one output token and enabled unique-prompt retention')
        arms = manifest.get('arm_builds') or {}
        if (not arms or any(not same_identity(arm.get('identity')) for arm in arms.values())
                or completion.get('interrupted') is not False or completion.get('stopped_early') is not False
                or declared.get('rounds') != 16 or len(arms) != 2 or 'reference' not in arms
                or completion.get('planned_cells') != 32 or completion.get('recorded_cells') != 32
                or len(rows) != 32 or 'error' in completion):
            raise ValueError(f'paired prerequisite incomplete or belongs to another build: {name}')
        coordinates = [(row['round'], row['arm']) for row in rows]
        if len(set(coordinates)) != 32 or set(coordinates) != {
                (i, arm) for i in range(1, 17) for arm in arms}:
            raise ValueError(f'paired prerequisite has missing or duplicate cells: {name}')
        warmups = {(row['round'], row['arm']): json.loads(evidence(entry,
            f"{row['round']}-{row['arm']}/warmup.json").read_text()) for row in rows}
        validate_paired_execution(name, declared, rows, warmups)
        if not declared.get('acceptance') or not declared.get('startup_acceptance'):
            raise ValueError(f'paired prerequisite lacks both frozen acceptance gates: {name}')
        gate, first = declared['acceptance'], declared['startup_acceptance']
        required_gate = {'minimum_pairs': 5, 'replacement_rounds': 0, 'all_outputs_exact': True}
        if name in {'short-one', 'distinct-tail', 'complete-repeat'}:
            required_gate.update(minimum_median_client_reduction=.05, minimum_positive_fraction=.8)
        else:
            required_gate.update(maximum_median_client_regression=.05, minimum_positive_fraction=0)
        if name in {'unique-prose', 'sampled-short', 'mtp-resource'}:
            required_gate.update(minimum_active_savings_bytes=300_000_000,
                                 minimum_sampled_peak_savings_bytes=200_000_000)
        if (gate != required_gate or first != {'minimum_pairs': 5,
                'maximum_median_first_job_regression': .05, 'all_outputs_exact': True}):
            raise ValueError(f'paired prerequisite weakens final-matrix bounds: {name}')
        summary = bench.summaries(rows, 'reference', declared.get('comparison_basis', 'fixed-pool'),
                                  declared.get('required_equal_work'))
        accepted = bench.acceptance_results(summary, declared['acceptance'])
        startup = bench.startup_acceptance_results(rows, 'reference', declared['startup_acceptance'])
        if (not accepted or not startup or any(item.get('passed') is not True for item in accepted + startup)
                or accepted != completion.get('acceptance') or startup != completion.get('startup_acceptance')):
            raise ValueError(f'paired prerequisite fails recomputed request/first-job gates: {name}')
        observed[name] = {'passed': True, 'cells': len(rows)}
    return observed


def validate_protocol(protocol):
    # Source-derived prelaunch correction: forced MTP plus a loaded tower
    # requires a different total-memory profile from ordinary text/vision.
    expected_memory = {'off': 10, 'on': 12}.get(protocol.get('mtp'))
    integer_fields = ['memory_gb', 'max_context', 'warmup_cycles', 'measured_cycles',
                      'maximum_duration_seconds_per_mode', 'maximum_prompt_tokens', 'maximum_output_tokens']
    if any(type(protocol.get(key)) is not int for key in integer_fields):
        raise ValueError('soak limits require explicit integer values')
    if (protocol.get('classification') != 'Frozen combined lifetime qualification'
            or protocol.get('memory_gb') != expected_memory or protocol.get('max_context') != 32768
            or protocol.get('mtp') not in ['off', 'on']
            or protocol.get('warmup_cycles') != 2 or protocol.get('measured_cycles') != 8
            or protocol.get('maximum_duration_seconds_per_mode') != 900
            or protocol.get('maximum_prompt_tokens') != 1024 or protocol.get('maximum_output_tokens') != 8):
        raise ValueError('soak requires the explicit bounded and frozen lifetime protocol')
    sequence = protocol.get('sequence')
    if not isinstance(sequence, list) or len(sequence) != 6:
        raise ValueError('soak requires the frozen six-request cycle')
    names = [item.get('name') for item in sequence]
    if any(type(n) is not str or not n.replace('-', '').isalnum() for n in names) or len(set(names)) != len(names):
        raise ValueError('request labels must be unique safe names')
    gate = protocol.get('acceptance') or {}
    limits = {'maximum_sampled_physical_peak_bytes': expected_memory * 1_000_000_000 if expected_memory else 0,
              'maximum_active_growth_bytes_per_position': 64 << 20,
              'maximum_physical_end_growth_bytes_per_position': 256 << 20,
              'maximum_cached_embedding_payload_bytes': 11_796_480,
              'maximum_prefix_entries': 4, 'minimum_clean_observations_per_position': 5,
              'minimum_clean_early_observations_per_position': 2,
              'minimum_clean_late_observations_per_position': 2, 'replacement_cycles': 0}
    if any(type(gate.get(k)) is not int or gate[k] != v for k, v in limits.items()):
        raise ValueError('lifetime bounds must match the frozen contract')
    if any(gate.get(k) is not True for k in ['all_expected_requests_complete',
        'exact_per_position_replay_after_warmup', 'prefix_charge_within_declared_capacity',
        'nominal_power_and_unchanged_request_vm_for_resource_observations']):
        raise ValueError('lifetime evidence and exactness requirements cannot be weakened')
    arm = {'reference': {'chunk': 256, 'env': protocol.get('env')}}
    bench.validate_arms(arm)
    requests = {}
    for item in sequence:
        path = Path(item['fixture'])
        if not path.is_file() or not 1 <= path.stat().st_size <= 4096 or digest(path) != item['fixture_sha256']:
            raise ValueError('soak fixture identity/size differs')
        count = item.get('outputs')
        if type(count) is not int or not 1 <= count <= 8:
            raise ValueError('bounded explicit output required')
        request = {'memory_gb': expected_memory, 'raw': item['raw'], 'max_tokens': count, 'seed': 7}
        for key in ['think', 'sampling']:
            if key in item: request[key] = item[key]
        # This lifetime has its own fixed 10/12 GB capacity contract above.
        # Validate the content-pinned image descriptor independently from the
        # paired-image benchmark's separate large-vision capacity contract.
        # The request constructor accepts already validated image bytes;
        # memory remains the actual mode budget and is not a wire field.
        image_descriptor = {'raw': item['raw']}
        if 'image' in item:
            image_descriptor['images'] = [{'path': item['image'], 'sha256': item['image_sha256']}]
        images = bench.image_fixtures(image_descriptor)
        requests[item['name']] = bench.request_body(request, path.read_text(), images=images)
    return requests


def main():
    def interrupted(signum, frame):
        raise KeyboardInterrupt(f'received signal {signum}')
    signal.signal(signal.SIGTERM, interrupted)
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    protocol = json.loads(args.protocol.read_text())
    requests = validate_protocol(protocol)
    build = bench.verified_build(protocol['binary'])
    bench.validate_declared_binary(protocol, {'reference': build})
    if 'frozen_binary_sha256' not in protocol:
        raise ValueError('a frozen binary binding is mandatory')
    prerequisites = validate_prerequisites(protocol, build)
    model = Path(protocol['model']).resolve()
    args.out.mkdir(parents=True, exist_ok=False)
    for name, request in requests.items():
        (args.out / f'request-{name}.json').write_bytes(request)
    for source in [Path(__file__), Path(bench.__file__), ROOT / 'Tools/prefill_bench.py']:
        shutil.copyfile(source, args.out / source.name)
    shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', args.out / 'build-source.tar.gz')
    manifest = {'protocol': protocol, 'protocol_sha256': digest(args.protocol), 'build': build,
                'model': model_identity(model), 'classification': 'One sequential bounded model process',
                'prerequisites': prerequisites, 'passed': False}
    (args.out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    rows = []
    child = None
    try:
        if bench.competing_jobs(): raise RuntimeError('competing build/storage work; model not launched')
        manifest['before'] = preflight(protocol['memory_gb'] + 3)
        with socket.socket() as reservation:
            reservation.bind(('127.0.0.1', 0)); port = reservation.getsockname()[1]
        command = [build['binary'], 'serve', '--port', str(port), '--model', str(model),
                   '--memory-gb', str(protocol['memory_gb']), '--max-context', '32768', '--mtp', protocol['mtp'], '--no-elastic']
        env = {k: v for k, v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        env.update(protocol['env'], SLOTSTREAM_BENCH_DETAILS='1', SLOTSTREAM_PREFILL_CHUNK='256')
        manifest['command'] = command
        start = time.monotonic()
        with wall_deadline(protocol['maximum_duration_seconds_per_mode']), \
                (args.out / 'server.stdout').open('wb') as stdout, \
                (args.out / 'server.stderr').open('wb') as stderr:
            child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
            bench.wait_ready(child, port)
            for cycle in range(-protocol['warmup_cycles'], protocol['measured_cycles']):
                for item in protocol['sequence']:
                    remaining = protocol['maximum_duration_seconds_per_mode'] - (time.monotonic() - start)
                    if remaining <= 0: raise TimeoutError('fixed lifetime duration exhausted')
                    if bench.competing_jobs(): raise RuntimeError('competing build/storage work during soak')
                    row = {'cycle': cycle, 'name': item['name'], 'has_image': 'image' in item,
                           'before': vm_snapshot(), 'succeeded': False}
                    try:
                        measured, wire = bench.exchange(port, requests[item['name']], min(120, remaining),
                                                        allow_complete_prompt=True)
                        row.update(measured, after=vm_snapshot())
                        row['prefix'] = prefix_snapshot(port)
                        (args.out / f'{cycle}-{item["name"]}.ndjson').write_bytes(wire)
                        metrics = row['metrics']; stats = metrics['stats']
                        if (stats.get('runtimeError') is not None or stats['decodeTokens'] != item['outputs']
                                or not 0 < stats['promptTokens'] <= protocol['maximum_prompt_tokens']
                                or metrics['effective_mtp'] != (protocol['mtp'] == 'on')
                                or metrics['effective_prefill_chunk'] != 256):
                            raise ValueError('request output, context or effective mode differs from the protocol')
                        peak = bench.sampled_request_peak(stats)
                        if type(peak) is not int or peak > protocol['acceptance']['maximum_sampled_physical_peak_bytes']:
                            raise ValueError('absolute physical resource bound exceeded or unavailable')
                        row['resource_clean'], row['resource_exclusions'] = clean_resource_observation(row, protocol)
                        row['succeeded'] = True
                    finally:
                        rows.append(row)
                        with (args.out / 'results.jsonl').open('a') as output:
                            output.write(json.dumps(row) + '\n')
                    print(json.dumps({'cycle': cycle, 'name': item['name'], 'resource_clean': row['resource_clean']}), flush=True)
    except (Exception, KeyboardInterrupt) as error:
        manifest['error'] = f'{type(error).__name__}: {error}'
    finally:
        if child is not None: bench.stop_server(child)
        manifest['after'] = vm_snapshot()
    report = assess(protocol, rows)
    manifest['passed'] = report['passed'] and 'error' not in manifest
    (args.out / 'assessment.json').write_text(json.dumps(report, indent=2) + '\n')
    (args.out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    print(json.dumps({'passed': manifest['passed'], 'recorded_requests': len(rows), 'error': manifest.get('error')}))
    return 0 if manifest['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())

````````````

## Artifact SHA-256 48846093151cefc74274bada9f62050ab22b7bf7b9fa6265b1de282c1361d509

Encoding: `gzip+base64`. Original bytes: 69413.

````````````text
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
````````````

## Artifact SHA-256 7dc7486a0bf9c49f655dc117e75f6963a0320f07bef5f21b501e462bada34304

Encoding: `utf-8`. Original bytes: 12551.

````````````text
{
  "classification": "Exact final build and actual defaults with both original corrected 60-request lifetimes. Source binding only; no model launch, acceptance or activation.",
  "executor_sha256": "eb1f3516bda70b6667e5ba4d04e1da5f9731bc87410ff5b4cca85f94f7bf2650",
  "dependencies": {
    "/private/tmp/slotstream-optimization-execution/final-composition-lifetime-v570/qualification.py": "eb1f3516bda70b6667e5ba4d04e1da5f9731bc87410ff5b4cca85f94f7bf2650",
    "/private/tmp/slotstream-optimization-execution/final-composition-lifetime-v570/checks.py": "c82c995a0a14ebdf1e1400126879e175b55858f5c5fb9adf47860d1908290ad0",
    "/private/tmp/slotstream-optimization-execution/final-composition-lifetime-v570/checks.stderr": "5bd076babddec6a7fcf4eb64a912c6cf8b1aa7cc39184742435b617c002751c0",
    "/private/tmp/slotstream-optimization-execution/confirmed-lifetime-composition-v321/qualification.py": "3114735434bce76c570c8654d80f3dfa4ec9e4df4f7e2c19283e6f73ba137680",
    "/private/tmp/slotstream-optimization-execution/confirmed-lifetime-composition-v321/preparation.json": "424e77721776f80342f8dceecd3a36864b5ca4d8bbc3fabb9f90bef3e5ee0160",
    "/private/tmp/slotstream-optimization-execution/lifetime-mode-contract-v308/driver.py": "f72f68e49fce8befdf8d2201db5e1ae3c83a5501700c08a2fd7410c4b80a4ea3",
    "/private/tmp/slotstream-optimization-execution/lifetime-mode-contract-v308/qualification-contract.json": "73b29adcd1978af76bb03ed31d5f7fd319cbe9711f595fb56e58c5aeb81a8b2b",
    "/private/tmp/slotstream-optimization-execution/lifetime-mode-contract-v308/preparation.json": "b97d07be1e8fab922410f24740705afa84a592283d7028da1145c27fdcac77b5",
    "/private/tmp/slotstream-optimization-execution/final-composition-continuation-v569/campaign.py": "711bd300a1b8dd38dbdbf7a202e5669ef760c9e9ee10f3fea4a1f95ab04b539b",
    "/private/tmp/slotstream-optimization-execution/final-composition-continuation-v569/preparation.json": "22a1bc4c5c835b53f48105272397bc92b14d0fbca61f78f1c9e496f220997774",
    "/private/tmp/slotstream-optimization-execution/final-composition-controls-v524/preparation.json": "872646be36773778ba5d6af595bd708d500bdf210d490471f9c88cec00cbd2fa",
    "/private/tmp/slotstream-optimization-execution/final-composition-qualified-profiles-v549/source-audit.json": "857e5543243263df6af4f6e50643d3ba67f469770fcd569f3201f70f2fe6a5c3",
    "/private/tmp/slotstream-optimization-execution/final-composition-native-v523/preparation.json": "93de6a46cf34647097832736e50476af9747f25639243248a83c48ff0b425b61",
    "/private/tmp/slotstream-optimization-execution/final-composition-lifetime-v570/corrected/driver.py": "f72f68e49fce8befdf8d2201db5e1ae3c83a5501700c08a2fd7410c4b80a4ea3",
    "/private/tmp/slotstream-optimization-execution/final-composition-lifetime-v570/corrected/qualification-contract.json": "48846093151cefc74274bada9f62050ab22b7bf7b9fa6265b1de282c1361d509",
    "/private/tmp/slotstream-optimization-execution/final-composition-external-consumer-v529/prepare.py": "3c71bb64dae92930dae7f212c1999f8852be3cdb94caaf352552b361c854d833",
    "/private/tmp/slotstream-optimization-execution/final-composition-external-consumer-v529/run.py": "e691c3b178ee95317d2be9da272c316a9df3db90422070ec1d4bf63419580cae",
    "/private/tmp/slotstream-optimization-execution/final-composition-external-consumer-v529/preparation.json": "37fa19c9f3276975f01707aaa6d277102677d2cc3e808b623544a29785d35347",
    "/private/tmp/slotstream-optimization-execution/final-composition-external-consumer-v529/protocol.json": "4d619c02f505616d4d51c2ecf985788143efcb9551efde94e28b51a2143c361e",
    "/private/tmp/slotstream-optimization-execution/final-composition-external-consumer-v529/manifest.json": "fd8f06b7af003f26c3c5e4d10755f9922cc7a4730cc34360dd0e34d2aea4d439",
    "/private/tmp/slotstream-optimization-execution/final-composition-external-consumer-v529/planner-lifetime-preflight.json": "0834b012c1794d592e56648abd8aba5fa7813ed731fa3c6f9c722d80aa1f6411",
    "/private/tmp/slotstream-optimization-execution/final-composition-external-consumer-v529/stdout.txt": "6ec5f0efba43b3e25deaf7d10b04f53102e73f6001df5915f1c6ee59590015e1",
    "/private/tmp/slotstream-optimization-execution/final-composition-external-consumer-v529/source/Tools/consumer_smoke.sh": "65f947d8ada5865fed24a93acbca6345578c61b64067f93acf3fcdd33efff0d0",
    "/Users/carlos/Projects/slotstream/Tools/optimization_campaign.py": "ae49f185713b26f0999b77126df0c480dda017f09f9b315a020b1693bf52d1c4",
    "/Users/carlos/Projects/slotstream/Tools/optimization_soak.py": "61ea2ddff2c8bb72ea6bdb226c96cdfe69ae086ab9bf8384f06f2a80f3907f0e",
    "/Users/carlos/Projects/slotstream/Tools/serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "/Users/carlos/Projects/slotstream/Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "/Users/carlos/Projects/slotstream/Tools/optimization_readiness.py": "56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c",
    "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "/Users/carlos/Projects/slotstream/Tools/optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "/Users/carlos/Projects/slotstream/Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "/Users/carlos/Projects/slotstream/Tools/thermal_readiness.py": "461dc8513bf8a23c7af5d999edf3c2ed1cbdb3d80d7869124603fa5babade048"
  },
  "confirmation_preparation_sha256": "22a1bc4c5c835b53f48105272397bc92b14d0fbca61f78f1c9e496f220997774",
  "native_proof": {
    "scope-family-2051": {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-native-v523/scope-family-2051",
      "assertions": 817,
      "sha256": {
        "attempt.json": "8a25a77737627b1fb373d23396610928fb3a794d40edefcc911afbd16587949e",
        "receipt.json": "7cbeea84a89843b62d2d56f4d0d4aac117ecf5e6c639584f4380bd2f6c79ed2d",
        "qualification.json": "053158edce836bc7b94c4c3a5a0fa4b3bd2063ce97de9fbc7467d711eba0a0ec",
        "memory.json": "4caf2c0c5a3c18e61e04dd136190887a1c56c528d474d378e5df6c8ee34e4a46",
        "memory.samples.jsonl": "20682b1e8dbd1e83d00a83f7f948ce1926371303607929c22f543dcb74312de8",
        "stdout.txt": "7c02a1ac8903d1473cdd697e34ad3be4b7530c5a073f79d33dee29b9606b7cba",
        "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
      }
    },
    "scope-family-4096": {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-native-v523/scope-family-4096",
      "assertions": 817,
      "sha256": {
        "attempt.json": "77631b0159b9602234f826d67804b2e2d3ffd2c22a582f3ae3c81e3b54214de3",
        "receipt.json": "a5b79c7f2d86005ddfe97307066a814a225e08ba3c28f9dccc50457ef22cc33b",
        "qualification.json": "f52314b22927de3aec000e028e0066144dc1cbe1727304cd05aa515b65094d21",
        "memory.json": "aad2d0f54596460ca17701ebcd75e898d07c6f6f791e183a0cfe79f618882099",
        "memory.samples.jsonl": "3689a0cb586f137138789a456110c4a48d88968fd3fcc8fc49afbfaabb1dc5d0",
        "stdout.txt": "74f4557310de989b4646be90bf741687dfc35cc1744678124bf9389069ce8281",
        "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
      }
    },
    "scope-lifecycle": {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-native-v523/scope-lifecycle",
      "assertions": 1914,
      "sha256": {
        "attempt.json": "5ab0cceb0b7b52eb14c389f80f8762c12ad62d8a3498ead9b88288249715a792",
        "receipt.json": "da0a63f6affb99217864fc5ae2abeb133695a94ec5f3a97ec40255b51ffcd49b",
        "qualification.json": "0cc7ab376babb04549cce35e78cdbcf7fcd8759d9479d49b756dc0ac7e86d097",
        "memory.json": "50bec10e26df5863be1fd04ce933d8dafe749e8322f0a7ad44aa5dabc0348abb",
        "memory.samples.jsonl": "98b1c0ad77c126cba0c98ca0fc758a5b1e120447fb354ff291cd246e87472fbf",
        "stdout.txt": "764d8e8e5cfec3021d70e2fc91720ba17bf1f7cb9b72c40391cf9a94b183bef9",
        "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
      }
    },
    "scope-mtp-vision": {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-native-v523/scope-mtp-vision",
      "assertions": 873,
      "sha256": {
        "attempt.json": "29738ed5b725a1eea78dd15ad39438b70e46998d185eaf801d44a4a8e5e16743",
        "receipt.json": "ab7899c7be4c93ce3ba392aab63826722d70a3cea5eefcf3d60d583e07f27ebc",
        "qualification.json": "298f3a5b92d2f54d493ae519d3abf4dee4400afbe871a4d80a3052fbd03318b9",
        "memory.json": "d9f00183ae0d3d94043bb37431e918513ee4fc5c1689b857d1b12c54991dfbbc",
        "memory.samples.jsonl": "24ad4e00bba3541205bc75f0ac5d59020fe332419e7302e1b2edf7336efd90d5",
        "stdout.txt": "f8cc4841050a940ed9dcc269d4d1014908030cd7cecd78801582ea892d3d457a",
        "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
      }
    },
    "combined-plain": {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-native-v523/combined-plain",
      "assertions": 286,
      "sha256": {
        "attempt.json": "8241a4721463b82f716d715a33c22bb4363aa52dd81b8cb288d5c8bfdd85613a",
        "receipt.json": "8d6de9c46f57440b5197a4541d88758d8c01e538db393724269d7b912b46dacd",
        "qualification.json": "785bae4826b6dd23f1fc985e1698b0a7aad72f2369992bdaaa96cb6cc8c5d7b9",
        "memory.json": "92caf9b66dc24adfade99f71b8f50ce926e42d874c9ec9fbcc727849719874f2",
        "memory.samples.jsonl": "b63c09ff09aab7b68a4b5c55bc32c38ecd27be023bf20a6d15a4daa6a6dd941f",
        "stdout.txt": "afe2e41b91f6f70aac589c539d2b1f80aab639fde4afbf4b12c4e445f7604d41",
        "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
      }
    },
    "combined-mtp": {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-native-v523/combined-mtp",
      "assertions": 327,
      "sha256": {
        "attempt.json": "8dfc2fa87eeb92976e0e73992a6731d0d7c6e967f2468228661d1c83ba2a455e",
        "receipt.json": "a0fbd5433891a15834d5a1ba1cea19c886922829647396a833b3118a2b5dea81",
        "qualification.json": "ca4ce42dd9bd1a51373334f049d6970e7f52874eef052621d38b17c61606c289",
        "memory.json": "b6ab0367465e6a73ee1ae39ce0eaa89cb8589b03ae37b8b5cedafa7e0e3a75a2",
        "memory.samples.jsonl": "eb97fc69b9f4389fd7ab43e5ecf1b1d0212ff9ffc9fa4f37a5c35db5e89b6294",
        "stdout.txt": "529a8a7d1ce7194f35aeaa65fc35480c8a26954c21da20fe0a1f6281715c205e",
        "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
      }
    },
    "read-failure-serving": {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-native-v523/read-failure-serving",
      "assertions": 522,
      "sha256": {
        "attempt.json": "5c4311e53c4444ae89b6d95a7c07276cdbd7b36e9cea7ea9b5afac2759235f06",
        "receipt.json": "4422ae8da5a73a6edfae9768f699516a2c70640657eae42095bc6cdc72ba6160",
        "qualification.json": "52dbe0b7a1cfe42da416370d1d9d51818cc7ee81675bd7ec1f50961fb55dbdd8",
        "memory.json": "9e2b00915537df2b4132a8f9323dfc6cefebf67e4d32b49ab559d38fc741b191",
        "memory.samples.jsonl": "4a34e15d7822993d7c8a87873a0c6fae32dff36da73694d40d9def0360829123",
        "stdout.txt": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127",
        "stderr.txt": "fcddd13aa70264a634d0711887cefea6ab173ea25561bb65ec6e095ee069c246"
      }
    }
  },
  "planner_proof": {
    "directory": "/tmp/slotstream-optimization-execution/final-composition-external-consumer-v529",
    "sha256": {
      "protocol.json": "4d619c02f505616d4d51c2ecf985788143efcb9551efde94e28b51a2143c361e",
      "manifest.json": "fd8f06b7af003f26c3c5e4d10755f9922cc7a4730cc34360dd0e34d2aea4d439",
      "planner-lifetime-preflight.json": "0834b012c1794d592e56648abd8aba5fa7813ed731fa3c6f9c722d80aa1f6411",
      "stdout.txt": "6ec5f0efba43b3e25deaf7d10b04f53102e73f6001df5915f1c6ee59590015e1"
    }
  },
  "original_executor_sha256": "3114735434bce76c570c8654d80f3dfa4ec9e4df4f7e2c19283e6f73ba137680",
  "original_driver_sha256": "f72f68e49fce8befdf8d2201db5e1ae3c83a5501700c08a2fd7410c4b80a4ea3",
  "original_execution_and_assessment_functions_unchanged": true,
  "actual_default_environments_empty": true,
  "model_launched": false
}

````````````

## Artifact SHA-256 4dc80d43155fcf525d87f336219aca84efab42212e8f08d2d4bf6682ee686f47

Encoding: `utf-8`. Original bytes: 12078.

````````````text
{
  "sources": {
    "/private/tmp/slotstream-optimization-execution/final-lifetime-long-serial-v583/run.py": "9ae63ff69ac20e2e8cf4819594d6a64695e86d959c96247d0eeb383713011bfc",
    "/private/tmp/slotstream-optimization-execution/final-composition-continuation-v569/campaign.py": "711bd300a1b8dd38dbdbf7a202e5669ef760c9e9ee10f3fea4a1f95ab04b539b",
    "/private/tmp/slotstream-optimization-execution/final-composition-lifetime-v570/qualification.py": "eb1f3516bda70b6667e5ba4d04e1da5f9731bc87410ff5b4cca85f94f7bf2650",
    "/private/tmp/slotstream-optimization-execution/final-long-adaptive-schedule-v581/run.py": "606806c950c9dc6e2fb8d7e3436a795ac75e396400ed971fc9969ff6eb625f6d",
    "/private/tmp/slotstream-optimization-execution/final-paired-continuation-serial-v573/run.py": "010a1535a33d0dcbf4dddbf1596d20cdfdff34ac7534e75af765bce2b3792a9f",
    "/private/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388/thermal_settle.py": "13216bc108c96e4763ef0b92321329a12d22b343ad32a0e306d8d8ea3259b0ad"
  },
  "initial_paired_status": {
    "scope": "V519 candidate qualification. Selected scope/vision defaults require all original paired studies, corrected lifetimes, resource/client families, sustained TPS and delivery before activation.",
    "stages": [
      {
        "stage": "native/combined-plain",
        "status": "passed",
        "assertions": 286,
        "original_execution": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-native-v523/combined-plain"
      },
      {
        "stage": "native/combined-mtp",
        "status": "passed",
        "assertions": 327,
        "original_execution": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-native-v523/combined-mtp"
      },
      {
        "stage": "native/read-failure-serving",
        "status": "passed",
        "assertions": 522,
        "original_execution": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-native-v523/read-failure-serving"
      },
      {
        "stage": "paired/short-one",
        "status": "passed",
        "cells": 32,
        "acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_client_reduction": true,
              "positive_fraction": true,
              "exact_outputs": true
            }
          }
        ],
        "startup_acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_first_job_non_regression": true
            },
            "eligible_rounds": [
              1,
              2,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16
            ],
            "excluded_rounds": [
              3
            ],
            "median_first_job_reduction_fraction": 0.08442020957959684
          }
        ]
      },
      {
        "stage": "paired/unique-prose",
        "status": "passed",
        "cells": 32,
        "acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_client_non_regression": true,
              "positive_fraction": true,
              "exact_outputs": true,
              "minimum_active_savings_bytes": true,
              "minimum_sampled_peak_savings_bytes": true
            }
          }
        ],
        "startup_acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_first_job_non_regression": true
            },
            "eligible_rounds": [
              1,
              2,
              3,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16
            ],
            "excluded_rounds": [
              4,
              5,
              6
            ],
            "median_first_job_reduction_fraction": 0.022507005578685457
          }
        ]
      },
      {
        "stage": "paired/sampled-short",
        "status": "passed",
        "cells": 32,
        "acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_client_non_regression": true,
              "positive_fraction": true,
              "exact_outputs": true,
              "minimum_active_savings_bytes": true,
              "minimum_sampled_peak_savings_bytes": true
            }
          }
        ],
        "startup_acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_first_job_non_regression": true
            },
            "eligible_rounds": [
              1,
              2,
              4,
              5,
              6,
              7,
              10,
              11,
              12,
              13,
              14,
              15,
              16
            ],
            "excluded_rounds": [
              3,
              8,
              9
            ],
            "median_first_job_reduction_fraction": 0.05202113876513248
          }
        ]
      },
      {
        "stage": "paired/mtp-resource",
        "status": "passed",
        "cells": 32,
        "acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_client_non_regression": true,
              "positive_fraction": true,
              "exact_outputs": true,
              "minimum_active_savings_bytes": true,
              "minimum_sampled_peak_savings_bytes": true
            }
          }
        ],
        "startup_acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_first_job_non_regression": true
            },
            "eligible_rounds": [
              1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16
            ],
            "excluded_rounds": [],
            "median_first_job_reduction_fraction": -0.024023171802248333
          }
        ]
      },
      {
        "stage": "paired/distinct-tail",
        "status": "passed",
        "cells": 32,
        "acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_client_reduction": true,
              "positive_fraction": true,
              "exact_outputs": true
            }
          }
        ],
        "startup_acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_first_job_non_regression": true
            },
            "eligible_rounds": [
              1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16
            ],
            "excluded_rounds": [],
            "median_first_job_reduction_fraction": 0.012726902808335105
          }
        ]
      },
      {
        "stage": "paired/complete-repeat",
        "status": "passed",
        "cells": 32,
        "acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_client_reduction": true,
              "positive_fraction": true,
              "exact_outputs": true
            }
          }
        ],
        "startup_acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_first_job_non_regression": true
            },
            "eligible_rounds": [
              1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16
            ],
            "excluded_rounds": [],
            "median_first_job_reduction_fraction": 0.023493821752745836
          }
        ]
      },
      {
        "stage": "paired/unique-with-retention",
        "status": "passed",
        "cells": 32,
        "acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_client_non_regression": true,
              "positive_fraction": true,
              "exact_outputs": true
            }
          }
        ],
        "startup_acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_first_job_non_regression": true
            },
            "eligible_rounds": [
              1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16
            ],
            "excluded_rounds": [],
            "median_first_job_reduction_fraction": 0.0271202938866435
          }
        ]
      },
      {
        "stage": "paired/actual-default-one-token",
        "status": "passed",
        "cells": 32,
        "acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_client_non_regression": true,
              "positive_fraction": true,
              "exact_outputs": true
            }
          }
        ],
        "startup_acceptance": [
          {
            "candidate": "combined",
            "passed": true,
            "checks": {
              "minimum_pairs": true,
              "median_first_job_non_regression": true
            },
            "eligible_rounds": [
              1,
              2,
              3,
              4,
              5,
              6,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14,
              15,
              16
            ],
            "excluded_rounds": [],
            "median_first_job_reduction_fraction": 0.09078323373404107
          }
        ]
      },
      {
        "stage": "soak/off",
        "status": "unrun"
      },
      {
        "stage": "soak/on",
        "status": "unrun"
      }
    ],
    "qualification_complete": false,
    "activation_performed": false,
    "paired_matrix_complete": true,
    "final_composition_selected": true,
    "optimization_program_complete": false
  },
  "readiness": {
    "stable_seconds": 120,
    "maximum_wait_seconds": 600,
    "poll_seconds": 2
  },
  "required_startup_gb": {
    "off": 13,
    "on": 15
  },
  "lifetime_reserved_seconds": 1410,
  "long_reserved_seconds": 12840,
  "original_work_and_acceptance_preserved": true,
  "activation_performed": false
}

````````````

## Artifact SHA-256 81868a6e94ffc0178bf833deb1c9013d9fab4ee95ddb876a5e8ec4f1d26376d2

Encoding: `utf-8`. Original bytes: 21.

````````````text
{
  "exit_code": 0
}

````````````

## Artifact SHA-256 5c8455a1bd286d959db1dc2368621461fa68f8abf31d2cd5bfee35839c9c3f46

Encoding: `utf-8`. Original bytes: 199.

````````````text
{
  "command": [
    "/Library/Developer/CommandLineTools/usr/bin/python3",
    "/private/tmp/slotstream-optimization-execution/final-composition-lifetime-v570/qualification.py",
    "prepare"
  ]
}

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 0d3bf18ed797f95893fcf2e22d4fd1de743aae009679d5f08c73db9c14fed325

Encoding: `utf-8`. Original bytes: 9959.

````````````text
{
  "stages": [
    {
      "stage": "native/combined-plain",
      "status": "passed",
      "assertions": 286,
      "original_execution": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-native-v523/combined-plain"
    },
    {
      "stage": "native/combined-mtp",
      "status": "passed",
      "assertions": 327,
      "original_execution": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-native-v523/combined-mtp"
    },
    {
      "stage": "native/read-failure-serving",
      "status": "passed",
      "assertions": 522,
      "original_execution": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-native-v523/read-failure-serving"
    },
    {
      "stage": "paired/short-one",
      "status": "passed",
      "cells": 32,
      "acceptance": [
        {
          "candidate": "combined",
          "passed": true,
          "checks": {
            "minimum_pairs": true,
            "median_client_reduction": true,
            "positive_fraction": true,
            "exact_outputs": true
          }
        }
      ],
      "startup_acceptance": [
        {
          "candidate": "combined",
          "passed": true,
          "checks": {
            "minimum_pairs": true,
            "median_first_job_non_regression": true
          },
          "eligible_rounds": [
            1,
            2,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
            12,
            13,
            14,
            15,
            16
          ],
          "excluded_rounds": [
            3
          ],
          "median_first_job_reduction_fraction": 0.08442020957959684
        }
      ]
    },
    {
      "stage": "paired/unique-prose",
      "status": "passed",
      "cells": 32,
      "acceptance": [
        {
          "candidate": "combined",
          "passed": true,
          "checks": {
            "minimum_pairs": true,
            "median_client_non_regression": true,
            "positive_fraction": true,
            "exact_outputs": true,
            "minimum_active_savings_bytes": true,
            "minimum_sampled_peak_savings_bytes": true
          }
        }
      ],
      "startup_acceptance": [
        {
          "candidate": "combined",
          "passed": true,
          "checks": {
            "minimum_pairs": true,
            "median_first_job_non_regression": true
          },
          "eligible_rounds": [
            1,
            2,
            3,
            7,
            8,
            9,
            10,
            11,
            12,
            13,
            14,
            15,
            16
          ],
          "excluded_rounds": [
            4,
            5,
            6
          ],
          "median_first_job_reduction_fraction": 0.022507005578685457
        }
      ]
    },
    {
      "stage": "paired/sampled-short",
      "status": "passed",
      "cells": 32,
      "acceptance": [
        {
          "candidate": "combined",
          "passed": true,
          "checks": {
            "minimum_pairs": true,
            "median_client_non_regression": true,
            "positive_fraction": true,
            "exact_outputs": true,
            "minimum_active_savings_bytes": true,
            "minimum_sampled_peak_savings_bytes": true
          }
        }
      ],
      "startup_acceptance": [
        {
          "candidate": "combined",
          "passed": true,
          "checks": {
            "minimum_pairs": true,
            "median_first_job_non_regression": true
          },
          "eligible_rounds": [
            1,
            2,
            4,
            5,
            6,
            7,
            10,
            11,
            12,
            13,
            14,
            15,
            16
          ],
          "excluded_rounds": [
            3,
            8,
            9
          ],
          "median_first_job_reduction_fraction": 0.05202113876513248
        }
      ]
    },
    {
      "stage": "paired/mtp-resource",
      "status": "passed",
      "cells": 32,
      "acceptance": [
        {
          "candidate": "combined",
          "passed": true,
          "checks": {
            "minimum_pairs": true,
            "median_client_non_regression": true,
            "positive_fraction": true,
            "exact_outputs": true,
            "minimum_active_savings_bytes": true,
            "minimum_sampled_peak_savings_bytes": true
          }
        }
      ],
      "startup_acceptance": [
        {
          "candidate": "combined",
          "passed": true,
          "checks": {
            "minimum_pairs": true,
            "median_first_job_non_regression": true
          },
          "eligible_rounds": [
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
            12,
            13,
            14,
            15,
            16
          ],
          "excluded_rounds": [],
          "median_first_job_reduction_fraction": -0.024023171802248333
        }
      ]
    },
    {
      "stage": "paired/distinct-tail",
      "status": "passed",
      "cells": 32,
      "acceptance": [
        {
          "candidate": "combined",
          "passed": true,
          "checks": {
            "minimum_pairs": true,
            "median_client_reduction": true,
            "positive_fraction": true,
            "exact_outputs": true
          }
        }
      ],
      "startup_acceptance": [
        {
          "candidate": "combined",
          "passed": true,
          "checks": {
            "minimum_pairs": true,
            "median_first_job_non_regression": true
          },
          "eligible_rounds": [
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
            12,
            13,
            14,
            15,
            16
          ],
          "excluded_rounds": [],
          "median_first_job_reduction_fraction": 0.012726902808335105
        }
      ]
    },
    {
      "stage": "paired/complete-repeat",
      "status": "passed",
      "cells": 32,
      "acceptance": [
        {
          "candidate": "combined",
          "passed": true,
          "checks": {
            "minimum_pairs": true,
            "median_client_reduction": true,
            "positive_fraction": true,
            "exact_outputs": true
          }
        }
      ],
      "startup_acceptance": [
        {
          "candidate": "combined",
          "passed": true,
          "checks": {
            "minimum_pairs": true,
            "median_first_job_non_regression": true
          },
          "eligible_rounds": [
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
            12,
            13,
            14,
            15,
            16
          ],
          "excluded_rounds": [],
          "median_first_job_reduction_fraction": 0.023493821752745836
        }
      ]
    },
    {
      "stage": "paired/unique-with-retention",
      "status": "passed",
      "cells": 32,
      "acceptance": [
        {
          "candidate": "combined",
          "passed": true,
          "checks": {
            "minimum_pairs": true,
            "median_client_non_regression": true,
            "positive_fraction": true,
            "exact_outputs": true
          }
        }
      ],
      "startup_acceptance": [
        {
          "candidate": "combined",
          "passed": true,
          "checks": {
            "minimum_pairs": true,
            "median_first_job_non_regression": true
          },
          "eligible_rounds": [
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
            12,
            13,
            14,
            15,
            16
          ],
          "excluded_rounds": [],
          "median_first_job_reduction_fraction": 0.0271202938866435
        }
      ]
    },
    {
      "stage": "paired/actual-default-one-token",
      "status": "passed",
      "cells": 32,
      "acceptance": [
        {
          "candidate": "combined",
          "passed": true,
          "checks": {
            "minimum_pairs": true,
            "median_client_non_regression": true,
            "positive_fraction": true,
            "exact_outputs": true
          }
        }
      ],
      "startup_acceptance": [
        {
          "candidate": "combined",
          "passed": true,
          "checks": {
            "minimum_pairs": true,
            "median_first_job_non_regression": true
          },
          "eligible_rounds": [
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
            12,
            13,
            14,
            15,
            16
          ],
          "excluded_rounds": [],
          "median_first_job_reduction_fraction": 0.09078323373404107
        }
      ]
    },
    {
      "stage": "corrected-lifetime/off",
      "status": "unrun"
    },
    {
      "stage": "corrected-lifetime/on",
      "status": "unrun"
    }
  ],
  "combined_matrix_complete": false,
  "build_identity": {
    "binary_sha256": "9268e4b2a3371e78a71d493d7788559a06a22498e8061a89278c4918c6764673",
    "source_archive_sha256": "1013bd6d0bdc2e6236f04c9900599c58e8250e79a01518f987da6cdc963a9ea2",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "legacy_campaign_complete": false,
  "optimization_program_complete": false,
  "activation_performed": false
}

````````````
