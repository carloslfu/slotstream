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
    integer_fields = ['memory_gb', 'max_context', 'warmup_cycles', 'measured_cycles',
                      'maximum_duration_seconds_per_mode', 'maximum_prompt_tokens', 'maximum_output_tokens']
    if any(type(protocol.get(key)) is not int for key in integer_fields):
        raise ValueError('soak limits require explicit integer values')
    if (protocol.get('classification') != 'Frozen combined lifetime qualification'
            or protocol.get('memory_gb') != 10 or protocol.get('max_context') != 32768
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
    limits = {'maximum_sampled_physical_peak_bytes': 10_000_000_000,
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
        request = {'memory_gb': 10, 'raw': item['raw'], 'max_tokens': count, 'seed': 7}
        for key in ['think', 'sampling']:
            if key in item: request[key] = item[key]
        if 'image' in item:
            request['images'] = [{'path': item['image'], 'sha256': item['image_sha256']}]
        requests[item['name']] = bench.request_body(request, path.read_text())
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
        manifest['before'] = preflight(13)
        with socket.socket() as reservation:
            reservation.bind(('127.0.0.1', 0)); port = reservation.getsockname()[1]
        command = [build['binary'], 'serve', '--port', str(port), '--model', str(model),
                   '--memory-gb', '10', '--max-context', '32768', '--mtp', protocol['mtp'], '--no-elastic']
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
