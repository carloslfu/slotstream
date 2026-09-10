---
type: run
id: 01m1vv010mx7j8pz46bf22qdvz
created: 2026-09-06T17:06:59.220164+00:00
updated: 2026-09-06T17:07:26.796724+00:00
summary: Enforce final native and paired prerequisites before lifetime qualification
binary: none; tools-only prerequisite enforcement
captured_at: 2026-09-06
command: python3 -m unittest discover -s Tools -p optimization*test.py -v
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Enforce final native and paired prerequisites before lifetime qualification
tool: Python unittest and source validation
---
V174 closes the prepared lifetime driver's missing prerequisite enforcement before any live soak. The final frozen soak must provide three native reports (combined plain, combined MTP, real HTTP read-failure/recovery) and all seven distinct final paired studies. Every listed manifest/report/results/completion file is SHA-256 bound. Native checks require actual passing assertions, no skip, successful process exit, the intended diagnostic variant and the same binary/source archive/Metal library identity as the verified soak executable.

Each paired study must be a distinct completed sixteen-pair/two-arm experiment with all32 unique declared cells, both arms matching the same final identity, no interruption or early stop, and the original workload-specific request/resource plus first-job criteria. Request and first-job acceptance are recomputed from the bound rows with the ordinary benchmark functions and must equal the captured completion. A weak or claimed pass cannot replace recomputation. This does not substitute for reviewing the frozen workload/control binding; the final plan still fixes each of the seven workloads before execution. Prerequisite validation occurs before creating soak output or starting a server. The resulting evidence summary is recorded in the soak manifest.

The per-position soak now independently requires embeddingRowsEnabled=true in the actual observed metrics; a disabled row cache cannot pass solely by reporting zero retained row bytes. Existing bounded prefix retention, physical ceilings, unchanged VM/power, exact replay and early/late growth rules remain unchanged. No forced cache eviction/hit requirement was added.

All23 focused Python tests pass: six build-helper tests, eleven soak lifecycle/resource tests and six prerequisite receipt tests. The new receipt tests cover correct complete evidence, missing/duplicated studies, changed digests, wrong source/variant, failed assertions, incomplete/duplicate/old-build paired runs, relaxed bounds and a claimed pass overridden by recomputed failure. Benchmark numerical/statistical calculations retain their separate existing harness tests; mock receipt tests do not claim a real benchmark. The driver rejects missing prerequisites before output creation or Popen. No build or model ran. V163/V164 draft remains unbound/unrun and must receive these actual final evidence bindings. V173 source remains unbuilt. The transport task reports a provider DNS failure and verified resumption; context owns its next expressly bounded correctness interval. Final performance, soaks, full acceptance and defaults remain open.


Artifact `/Users/carlos/Projects/slotstream/.build/optimization/soak-prerequisites-v174/optimization_soak.py.before` — 15544 bytes, SHA-256 `d7056577de51c6a845e48d9d25c3910ac85b28c519f085d9101afd8c1a73e0c9`.

````text
#!/usr/bin/env python3
"""Bounded repeated-request lifetime qualification; no latency improvement claims."""
import argparse
from contextlib import contextmanager
import http.client
import json
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
    model = Path(protocol['model']).resolve()
    args.out.mkdir(parents=True, exist_ok=False)
    for name, request in requests.items():
        (args.out / f'request-{name}.json').write_bytes(request)
    for source in [Path(__file__), Path(bench.__file__), ROOT / 'Tools/prefill_bench.py']:
        shutil.copyfile(source, args.out / source.name)
    shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', args.out / 'build-source.tar.gz')
    manifest = {'protocol': protocol, 'protocol_sha256': digest(args.protocol), 'build': build,
                'model': model_identity(model), 'classification': 'One sequential bounded model process',
                'passed': False}
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

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/soak-prerequisites-v174/optimization_soak_test.py.before` — 11148 bytes, SHA-256 `b3522cba8f9621d8fe434b9b352df70ed0ac146f4563530020bdbaf5308fdcbf`.

````text
#!/usr/bin/env python3
import copy
from contextlib import ExitStack
import json
from pathlib import Path
import signal
import tempfile
import time
import unittest
from unittest.mock import patch, Mock

import optimization_soak as soak
from optimization_soak import assess, clean_resource_observation, validate_protocol, wall_deadline
from prefill_bench import digest


class SoakTests(unittest.TestCase):
    def setUp(self):
        fixture = Path(__file__).parent / 'fixtures/optimization/short.txt'
        self.protocol = {'classification': 'Frozen combined lifetime qualification',
            'memory_gb': 10, 'max_context': 32768, 'mtp': 'off',
            'warmup_cycles': 2, 'measured_cycles': 8, 'maximum_duration_seconds_per_mode': 900,
            'maximum_prompt_tokens': 1024, 'maximum_output_tokens': 8, 'env': {},
            'sequence': [{'name': str(i), 'fixture': str(fixture), 'fixture_sha256': digest(fixture),
                          'raw': True, 'outputs': 8} for i in range(6)],
            'acceptance': {'all_expected_requests_complete': True,
                'exact_per_position_replay_after_warmup': True, 'prefix_charge_within_declared_capacity': True,
                'nominal_power_and_unchanged_request_vm_for_resource_observations': True,
                'maximum_sampled_physical_peak_bytes': 10_000_000_000,
                'maximum_active_growth_bytes_per_position': 64 << 20,
                'maximum_physical_end_growth_bytes_per_position': 256 << 20,
                'maximum_cached_embedding_payload_bytes': 11_796_480,
                'maximum_prefix_entries': 4, 'minimum_clean_observations_per_position': 5,
                'minimum_clean_early_observations_per_position': 2,
                'minimum_clean_late_observations_per_position': 2, 'replacement_cycles': 0}}
        vm = {'swapins': 0, 'swapouts': 0}
        system = {'thermalState': 'nominal', 'lowPowerModeEnabled': False}
        stats = {'mlxActiveEndBytes': 1_000_000_000, 'physicalFootprintEndBytes': 2_000_000_000,
                 'sampledFootprint': {'peakBytes': 3_000_000_000}, 'embeddingCachedPayloadBytes': 1000,
                 'generatorVMBefore': vm, 'generatorVMAfter': vm,
                 'generatorSystemBefore': system, 'generatorSystemAfter': system}
        base = {'succeeded': True, 'before': vm, 'after': vm, 'text': 'same', 'has_image': False,
                'prefix': {'enabled': True, 'conversations': 4, 'charged_token_capacity': 256, 'max_tokens': 1024},
                'metrics': {'output_ids': [7], 'stats': stats}}
        self.rows = [copy.deepcopy(base) | {'cycle': cycle, 'name': str(i)}
                     for cycle in range(-2, 8) for i in range(6)]

    def test_fixed_completed_sequence_and_bounded_growth_pass(self):
        self.assertEqual(len(validate_protocol(self.protocol)), 6)
        self.assertTrue(assess(self.protocol, self.rows)['passed'])

    def test_late_growth_cannot_hide_behind_stable_other_positions(self):
        for field, growth in [('mlxActiveEndBytes', (64 << 20) + 1),
                               ('physicalFootprintEndBytes', (256 << 20) + 1)]:
            rows = copy.deepcopy(self.rows)
            rows[-1]['metrics']['stats'][field] += growth
            self.assertFalse(assess(self.protocol, rows)['passed'])

    def test_swap_exclusions_need_enough_early_and_late_evidence(self):
        for cycle in [0, 1, 4]:
            row = next(r for r in self.rows if r['cycle'] == cycle and r['name'] == '0')
            row['after'] = {'swapins': 1, 'swapouts': 0}
            self.assertFalse(clean_resource_observation(row, self.protocol)[0])
        self.assertTrue(assess(self.protocol, self.rows)['passed'])
        next(r for r in self.rows if r['cycle'] == 2 and r['name'] == '0')['after'] = {'swapins': 1, 'swapouts': 0}
        self.assertFalse(assess(self.protocol, self.rows)['passed'])

    def test_excluded_output_changes_are_still_correctness_failures(self):
        self.rows[-1]['after'] = {'swapins': 1, 'swapouts': 0}
        self.rows[-1]['metrics']['output_ids'] = [9]
        self.assertFalse(assess(self.protocol, self.rows)['passed'])

    def test_failure_before_metrics_and_missing_requests_fail_without_crashing(self):
        self.rows[-1] = {'cycle': 7, 'name': '5', 'succeeded': False}
        self.assertFalse(assess(self.protocol, self.rows)['passed'])
        self.assertFalse(assess(self.protocol, self.rows[:-1])['passed'])
        with self.assertRaises(ValueError): assess(self.protocol, self.rows + [self.rows[0]])

    def test_absolute_peak_prefix_and_embedding_caps_are_independent(self):
        for mutate in [lambda r: r['metrics']['stats']['sampledFootprint'].update(peakBytes=10_000_000_001),
                       lambda r: r['prefix'].update(enabled=False),
                       lambda r: r['prefix'].update(conversations=0),
                       lambda r: r['prefix'].update(conversations=5),
                       lambda r: r['prefix'].update(charged_token_capacity=1025),
                       lambda r: r['metrics']['stats'].update(embeddingCachedPayloadBytes=11_796_481)]:
            rows = copy.deepcopy(self.rows); mutate(rows[-1])
            self.assertFalse(assess(self.protocol, rows)['passed'])

    def test_draft_or_relaxed_limits_refuse_before_execution(self):
        for key, value in [('classification', 'UNRUN DRAFT'), ('memory_gb', 20), ('max_context', 65536),
                           ('mtp', 'auto'), ('measured_cycles', 100), ('maximum_output_tokens', 999),
                           ('warmup_cycles', 2.0), ('measured_cycles', True)]:
            with self.assertRaises(ValueError): validate_protocol(self.protocol | {key: value})
        p = copy.deepcopy(self.protocol); p['acceptance']['replacement_cycles'] = 1
        with self.assertRaises(ValueError): validate_protocol(p)
        p = copy.deepcopy(self.protocol); p['sequence'][0]['fixture_sha256'] = '0' * 64
        with self.assertRaises(ValueError): validate_protocol(p)

    def test_total_deadline_interrupts_a_blocking_operation_and_restores_alarm(self):
        original = signal.getsignal(signal.SIGALRM)
        start = time.monotonic()
        with self.assertRaisesRegex(TimeoutError, 'fixed lifetime duration exhausted'):
            with wall_deadline(.02):
                signal.pause()
        self.assertLess(time.monotonic() - start, 2)
        self.assertEqual(signal.getitimer(signal.ITIMER_REAL), (0.0, 0.0))
        self.assertEqual(signal.getsignal(signal.SIGALRM), original)
        with wall_deadline(1): pass
        self.assertEqual(signal.getitimer(signal.ITIMER_REAL), (0.0, 0.0))
        with patch.object(signal, 'getitimer', return_value=(1.0, 0.0)):
            with self.assertRaisesRegex(RuntimeError, 'already active'):
                with wall_deadline(1): pass

    def run_mock_driver(self, *, failure=None, startup_failure=None):
        """Exercise all driver phases without a build, model or listening server."""
        original_term = signal.getsignal(signal.SIGTERM)
        try:
            with tempfile.TemporaryDirectory() as directory, ExitStack() as stack:
                root = Path(directory)
                archive = root / 'build-source.tar.gz'; archive.write_bytes(b'frozen source fixture')
                protocol = self.protocol | {'binary': str(root / 'slotstream'),
                    'model': str(root / 'model'), 'frozen_binary_sha256': 'a' * 64}
                path = root / 'protocol.json'; path.write_text(json.dumps(protocol))
                out = root / 'run'
                build = {'binary': protocol['binary'], 'identity': {'binary_sha256': 'a' * 64}}
                row = copy.deepcopy(self.rows[0])
                row['metrics']['stats'].update(promptTokens=17, decodeTokens=8)
                row['metrics'].update(effective_mtp=False, effective_prefill_chunk=256)
                row['metrics']['output_ids'] = [7] * 8
                child = Mock()
                def substitute(target, **kwargs):
                    return stack.enter_context(patch(target, **kwargs))
                substitute('sys.argv', new=['optimization_soak.py', '--protocol', str(path), '--out', str(out)])
                substitute('optimization_soak.bench.verified_build', return_value=build)
                substitute('optimization_soak.model_identity', return_value={'fixture': True})
                substitute('optimization_soak.preflight', return_value={})
                substitute('optimization_soak.vm_snapshot', return_value={'swapins': 0, 'swapouts': 0})
                substitute('optimization_soak.bench.competing_jobs', return_value=[])
                substitute('optimization_soak.subprocess.Popen', return_value=child)
                substitute('optimization_soak.bench.wait_ready', side_effect=startup_failure)
                stop = substitute('optimization_soak.bench.stop_server')
                exchange = substitute('optimization_soak.bench.exchange',
                    side_effect=failure, return_value=({'metrics': row['metrics'], 'text': row['text']},
                                                     b'{"fixture":true}\n'))
                substitute('optimization_soak.prefix_snapshot', return_value=row['prefix'])
                substitute('builtins.print')
                code = soak.main()
                manifest = json.loads((out / 'manifest.json').read_text())
                report = json.loads((out / 'assessment.json').read_text())
                records = [json.loads(line) for line in (out / 'results.jsonl').read_text().splitlines()] \
                    if (out / 'results.jsonl').exists() else []
                stop.assert_called_once_with(child)
                self.assertEqual(signal.getitimer(signal.ITIMER_REAL), (0.0, 0.0))
                return code, manifest, report, records, exchange.call_count
        finally:
            signal.signal(signal.SIGTERM, original_term)

    def test_driver_runs_exactly_sixty_requests_and_reaps_its_only_server(self):
        code, manifest, report, rows, calls = self.run_mock_driver()
        self.assertEqual((code, len(rows), calls), (0, 60, 60))
        self.assertTrue(manifest['passed']); self.assertTrue(report['passed'])

    def test_driver_preserves_failure_and_cancellation_and_reaps_server(self):
        for error in [ValueError('HTTP 500 fixture'), KeyboardInterrupt('cancelled'),
                      TimeoutError('fixed lifetime duration exhausted')]:
            with self.subTest(error=type(error).__name__):
                code, manifest, report, rows, calls = self.run_mock_driver(failure=error)
                self.assertEqual((code, len(rows), calls), (1, 1, 1))
                self.assertIn(type(error).__name__, manifest['error'])
                self.assertFalse(report['passed']); self.assertFalse(rows[0]['succeeded'])
        code, manifest, report, rows, calls = self.run_mock_driver(startup_failure=TimeoutError('startup'))
        self.assertEqual((code, len(rows), calls), (1, 0, 0))
        self.assertFalse(manifest['passed']); self.assertFalse(report['passed'])


if __name__ == '__main__':
    unittest.main()

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/soak-prerequisites-v174/tests.txt` — 2551 bytes, SHA-256 `cb4210f904f2de95db73c501c41677bfd099666253285ac8f4390bac7e865ef5`.

````text
test_explicit_job_bound_is_validated_and_recorded_in_actual_make_command (optimization_build_test.BuildTests) ... ok
test_headroom_refuses_before_make (optimization_build_test.BuildTests) ... ok
test_invalid_identity_never_freezes (optimization_build_test.BuildTests) ... ok
test_lock_stays_held_through_make_and_failure_never_freezes (optimization_build_test.BuildTests) ... ok
test_locked_model_prevents_make (optimization_build_test.BuildTests) ... ok
test_waiting_never_builds_until_reservation_is_owned (optimization_build_test.BuildTests) ... {"phase": "waiting for build reservation", "seconds": 0.0}
ok
test_changed_receipt_digest_is_rejected (optimization_prerequisites_test.PrerequisiteTests) ... ok
test_claimed_pass_does_not_override_recomputed_failure (optimization_prerequisites_test.PrerequisiteTests) ... ok
test_complete_same_build_evidence_is_recomputed_and_accepted (optimization_prerequisites_test.PrerequisiteTests) ... ok
test_incomplete_duplicate_and_other_build_paired_runs_refused (optimization_prerequisites_test.PrerequisiteTests) ... ok
test_missing_and_duplicate_workload_evidence_refused (optimization_prerequisites_test.PrerequisiteTests) ... ok
test_native_wrong_source_failed_assertion_and_wrong_variant_are_rejected (optimization_prerequisites_test.PrerequisiteTests) ... ok
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
Ran 23 tests in 0.128s

OK

````

Artifact `/Users/carlos/Projects/slotstream/Tools/optimization_soak.py` — 22217 bytes, SHA-256 `8308d6182267b787fa6b307654dad35b5b3d68b826f34d15b208a9af7b3c225c`.

````text
#!/usr/bin/env python3
"""Bounded repeated-request lifetime qualification; no latency improvement claims."""
import argparse
from contextlib import contextmanager
import http.client
import json
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


def validate_prerequisites(protocol, build):
    """Require the final candidate's native and paired evidence before launch.

    Digests bind the exact reports; same-binary/source/Metal identity prevents
    borrowing a passing gate from an earlier implementation. Paired decisions
    are recomputed from their frozen rows using the ordinary benchmark gates.
    """
    required_native = {'combined-plain', 'combined-mtp', 'read-failure-serving'}
    required_paired = {'short-one', 'unique-prose', 'sampled-short', 'mtp-resource',
                       'distinct-tail', 'complete-repeat', 'unique-with-retention'}
    prerequisites = protocol.get('prerequisites')
    if not isinstance(prerequisites, dict) or set(prerequisites) != {'native', 'paired'}:
        raise ValueError('native and paired final-candidate prerequisites are mandatory')
    for kind, names in [('native', required_native), ('paired', required_paired)]:
        if not isinstance(prerequisites[kind], dict) or set(prerequisites[kind]) != names:
            raise ValueError(f'complete {kind} prerequisite set required')

    def same_identity(identity):
        return isinstance(identity, dict) and all(identity.get(k) == build['identity'].get(k)
            and isinstance(identity.get(k), str) and len(identity[k]) == 64
            for k in ['binary_sha256', 'source_archive_sha256', 'metallib_sha256'])

    def evidence(entry, name):
        path = Path(entry['directory']) / name
        if digest(path) != entry['sha256'][name]:
            raise ValueError(f'prerequisite digest differs: {path}')
        return path

    observed = {}
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
        variants = {'combined-plain': ['integrated', 'integrated-vision-query'],
                    'combined-mtp': ['integrated-mtp', 'integrated-vision-query-mtp'],
                    'read-failure-serving': ['read-failure-serving']}[name]
        if ('optimization-state-check' not in command or '--variant' not in command
                or command.index('--variant') + 1 >= len(command)
                or command[command.index('--variant') + 1] not in variants):
            raise ValueError(f'native prerequisite has the wrong diagnostic: {name}')
        observed[name] = {'passed': True, 'assertions': len(items)}

    paired_directories = [str(Path(entry['directory']).resolve()) for entry in prerequisites['paired'].values()]
    if len(set(paired_directories)) != len(required_paired):
        raise ValueError('each paired workload requires its own study')
    for name, entry in prerequisites['paired'].items():
        manifest = json.loads(evidence(entry, 'manifest.json').read_text())
        completion = json.loads(evidence(entry, 'completion.json').read_text())
        rows = [json.loads(line) for line in evidence(entry, 'results.jsonl').read_text().splitlines()]
        declared = manifest['protocol']
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

````

Artifact `/Users/carlos/Projects/slotstream/Tools/optimization_soak_test.py` — 12472 bytes, SHA-256 `3b61d9e63a6c5fbe79b618324b283826d51ab3085582200df4e276cb1befd0be`.

````text
#!/usr/bin/env python3
import copy
from contextlib import ExitStack
import json
from pathlib import Path
import signal
import tempfile
import time
import unittest
from unittest.mock import patch, Mock

import optimization_soak as soak
from optimization_soak import assess, clean_resource_observation, validate_protocol, wall_deadline
from prefill_bench import digest


class SoakTests(unittest.TestCase):
    def setUp(self):
        fixture = Path(__file__).parent / 'fixtures/optimization/short.txt'
        self.protocol = {'classification': 'Frozen combined lifetime qualification',
            'memory_gb': 10, 'max_context': 32768, 'mtp': 'off',
            'warmup_cycles': 2, 'measured_cycles': 8, 'maximum_duration_seconds_per_mode': 900,
            'maximum_prompt_tokens': 1024, 'maximum_output_tokens': 8, 'env': {},
            'sequence': [{'name': str(i), 'fixture': str(fixture), 'fixture_sha256': digest(fixture),
                          'raw': True, 'outputs': 8} for i in range(6)],
            'acceptance': {'all_expected_requests_complete': True,
                'exact_per_position_replay_after_warmup': True, 'prefix_charge_within_declared_capacity': True,
                'nominal_power_and_unchanged_request_vm_for_resource_observations': True,
                'maximum_sampled_physical_peak_bytes': 10_000_000_000,
                'maximum_active_growth_bytes_per_position': 64 << 20,
                'maximum_physical_end_growth_bytes_per_position': 256 << 20,
                'maximum_cached_embedding_payload_bytes': 11_796_480,
                'maximum_prefix_entries': 4, 'minimum_clean_observations_per_position': 5,
                'minimum_clean_early_observations_per_position': 2,
                'minimum_clean_late_observations_per_position': 2, 'replacement_cycles': 0}}
        vm = {'swapins': 0, 'swapouts': 0}
        system = {'thermalState': 'nominal', 'lowPowerModeEnabled': False}
        stats = {'mlxActiveEndBytes': 1_000_000_000, 'physicalFootprintEndBytes': 2_000_000_000,
                 'sampledFootprint': {'peakBytes': 3_000_000_000}, 'embeddingCachedPayloadBytes': 1000,
                 'embeddingRowsEnabled': True,
                 'generatorVMBefore': vm, 'generatorVMAfter': vm,
                 'generatorSystemBefore': system, 'generatorSystemAfter': system}
        base = {'succeeded': True, 'before': vm, 'after': vm, 'text': 'same', 'has_image': False,
                'prefix': {'enabled': True, 'conversations': 4, 'charged_token_capacity': 256, 'max_tokens': 1024},
                'metrics': {'output_ids': [7], 'stats': stats}}
        self.rows = [copy.deepcopy(base) | {'cycle': cycle, 'name': str(i)}
                     for cycle in range(-2, 8) for i in range(6)]

    def test_fixed_completed_sequence_and_bounded_growth_pass(self):
        self.assertEqual(len(validate_protocol(self.protocol)), 6)
        self.assertTrue(assess(self.protocol, self.rows)['passed'])

    def test_late_growth_cannot_hide_behind_stable_other_positions(self):
        for field, growth in [('mlxActiveEndBytes', (64 << 20) + 1),
                               ('physicalFootprintEndBytes', (256 << 20) + 1)]:
            rows = copy.deepcopy(self.rows)
            rows[-1]['metrics']['stats'][field] += growth
            self.assertFalse(assess(self.protocol, rows)['passed'])

    def test_swap_exclusions_need_enough_early_and_late_evidence(self):
        for cycle in [0, 1, 4]:
            row = next(r for r in self.rows if r['cycle'] == cycle and r['name'] == '0')
            row['after'] = {'swapins': 1, 'swapouts': 0}
            self.assertFalse(clean_resource_observation(row, self.protocol)[0])
        self.assertTrue(assess(self.protocol, self.rows)['passed'])
        next(r for r in self.rows if r['cycle'] == 2 and r['name'] == '0')['after'] = {'swapins': 1, 'swapouts': 0}
        self.assertFalse(assess(self.protocol, self.rows)['passed'])

    def test_excluded_output_changes_are_still_correctness_failures(self):
        self.rows[-1]['after'] = {'swapins': 1, 'swapouts': 0}
        self.rows[-1]['metrics']['output_ids'] = [9]
        self.assertFalse(assess(self.protocol, self.rows)['passed'])

    def test_failure_before_metrics_and_missing_requests_fail_without_crashing(self):
        self.rows[-1] = {'cycle': 7, 'name': '5', 'succeeded': False}
        self.assertFalse(assess(self.protocol, self.rows)['passed'])
        self.assertFalse(assess(self.protocol, self.rows[:-1])['passed'])
        with self.assertRaises(ValueError): assess(self.protocol, self.rows + [self.rows[0]])

    def test_absolute_peak_prefix_and_embedding_caps_are_independent(self):
        for mutate in [lambda r: r['metrics']['stats']['sampledFootprint'].update(peakBytes=10_000_000_001),
                       lambda r: r['prefix'].update(enabled=False),
                       lambda r: r['prefix'].update(conversations=0),
                       lambda r: r['prefix'].update(conversations=5),
                       lambda r: r['prefix'].update(charged_token_capacity=1025),
                       lambda r: r['metrics']['stats'].update(embeddingRowsEnabled=False),
                       lambda r: r['metrics']['stats'].update(embeddingCachedPayloadBytes=11_796_481)]:
            rows = copy.deepcopy(self.rows); mutate(rows[-1])
            self.assertFalse(assess(self.protocol, rows)['passed'])

    def test_draft_or_relaxed_limits_refuse_before_execution(self):
        for key, value in [('classification', 'UNRUN DRAFT'), ('memory_gb', 20), ('max_context', 65536),
                           ('mtp', 'auto'), ('measured_cycles', 100), ('maximum_output_tokens', 999),
                           ('warmup_cycles', 2.0), ('measured_cycles', True)]:
            with self.assertRaises(ValueError): validate_protocol(self.protocol | {key: value})
        p = copy.deepcopy(self.protocol); p['acceptance']['replacement_cycles'] = 1
        with self.assertRaises(ValueError): validate_protocol(p)
        p = copy.deepcopy(self.protocol); p['sequence'][0]['fixture_sha256'] = '0' * 64
        with self.assertRaises(ValueError): validate_protocol(p)

    def test_total_deadline_interrupts_a_blocking_operation_and_restores_alarm(self):
        original = signal.getsignal(signal.SIGALRM)
        start = time.monotonic()
        with self.assertRaisesRegex(TimeoutError, 'fixed lifetime duration exhausted'):
            with wall_deadline(.02):
                signal.pause()
        self.assertLess(time.monotonic() - start, 2)
        self.assertEqual(signal.getitimer(signal.ITIMER_REAL), (0.0, 0.0))
        self.assertEqual(signal.getsignal(signal.SIGALRM), original)
        with wall_deadline(1): pass
        self.assertEqual(signal.getitimer(signal.ITIMER_REAL), (0.0, 0.0))
        with patch.object(signal, 'getitimer', return_value=(1.0, 0.0)):
            with self.assertRaisesRegex(RuntimeError, 'already active'):
                with wall_deadline(1): pass

    def run_mock_driver(self, *, failure=None, startup_failure=None):
        """Exercise all driver phases without a build, model or listening server."""
        original_term = signal.getsignal(signal.SIGTERM)
        try:
            with tempfile.TemporaryDirectory() as directory, ExitStack() as stack:
                root = Path(directory)
                archive = root / 'build-source.tar.gz'; archive.write_bytes(b'frozen source fixture')
                protocol = self.protocol | {'binary': str(root / 'slotstream'),
                    'model': str(root / 'model'), 'frozen_binary_sha256': 'a' * 64}
                path = root / 'protocol.json'; path.write_text(json.dumps(protocol))
                out = root / 'run'
                build = {'binary': protocol['binary'], 'identity': {'binary_sha256': 'a' * 64}}
                row = copy.deepcopy(self.rows[0])
                row['metrics']['stats'].update(promptTokens=17, decodeTokens=8)
                row['metrics'].update(effective_mtp=False, effective_prefill_chunk=256)
                row['metrics']['output_ids'] = [7] * 8
                child = Mock()
                def substitute(target, **kwargs):
                    return stack.enter_context(patch(target, **kwargs))
                substitute('sys.argv', new=['optimization_soak.py', '--protocol', str(path), '--out', str(out)])
                substitute('optimization_soak.bench.verified_build', return_value=build)
                substitute('optimization_soak.validate_prerequisites', return_value={'fixture': True})
                substitute('optimization_soak.model_identity', return_value={'fixture': True})
                substitute('optimization_soak.preflight', return_value={})
                substitute('optimization_soak.vm_snapshot', return_value={'swapins': 0, 'swapouts': 0})
                substitute('optimization_soak.bench.competing_jobs', return_value=[])
                substitute('optimization_soak.subprocess.Popen', return_value=child)
                substitute('optimization_soak.bench.wait_ready', side_effect=startup_failure)
                stop = substitute('optimization_soak.bench.stop_server')
                exchange = substitute('optimization_soak.bench.exchange',
                    side_effect=failure, return_value=({'metrics': row['metrics'], 'text': row['text']},
                                                     b'{"fixture":true}\n'))
                substitute('optimization_soak.prefix_snapshot', return_value=row['prefix'])
                substitute('builtins.print')
                code = soak.main()
                manifest = json.loads((out / 'manifest.json').read_text())
                report = json.loads((out / 'assessment.json').read_text())
                records = [json.loads(line) for line in (out / 'results.jsonl').read_text().splitlines()] \
                    if (out / 'results.jsonl').exists() else []
                stop.assert_called_once_with(child)
                self.assertEqual(signal.getitimer(signal.ITIMER_REAL), (0.0, 0.0))
                return code, manifest, report, records, exchange.call_count
        finally:
            signal.signal(signal.SIGTERM, original_term)

    def test_driver_runs_exactly_sixty_requests_and_reaps_its_only_server(self):
        code, manifest, report, rows, calls = self.run_mock_driver()
        self.assertEqual((code, len(rows), calls), (0, 60, 60))
        self.assertTrue(manifest['passed']); self.assertTrue(report['passed'])

    def test_missing_prerequisites_fail_before_output_or_server_creation(self):
        previous = signal.getsignal(signal.SIGTERM)
        try:
            with tempfile.TemporaryDirectory() as directory:
                root = Path(directory); out = root / 'run'
                protocol = self.protocol | {'binary': '/unused/slotstream', 'frozen_binary_sha256': 'a' * 64}
                path = root / 'protocol.json'; path.write_text(json.dumps(protocol))
                with patch('sys.argv', ['optimization_soak.py', '--protocol', str(path), '--out', str(out)]), \
                        patch('optimization_soak.bench.verified_build', return_value={
                            'identity': {'binary_sha256': 'a' * 64}}), \
                        patch('optimization_soak.subprocess.Popen') as launch:
                    with self.assertRaisesRegex(ValueError, 'prerequisites are mandatory'): soak.main()
                    launch.assert_not_called()
                    self.assertFalse(out.exists())
        finally:
            signal.signal(signal.SIGTERM, previous)

    def test_driver_preserves_failure_and_cancellation_and_reaps_server(self):
        for error in [ValueError('HTTP 500 fixture'), KeyboardInterrupt('cancelled'),
                      TimeoutError('fixed lifetime duration exhausted')]:
            with self.subTest(error=type(error).__name__):
                code, manifest, report, rows, calls = self.run_mock_driver(failure=error)
                self.assertEqual((code, len(rows), calls), (1, 1, 1))
                self.assertIn(type(error).__name__, manifest['error'])
                self.assertFalse(report['passed']); self.assertFalse(rows[0]['succeeded'])
        code, manifest, report, rows, calls = self.run_mock_driver(startup_failure=TimeoutError('startup'))
        self.assertEqual((code, len(rows), calls), (1, 0, 0))
        self.assertFalse(manifest['passed']); self.assertFalse(report['passed'])


if __name__ == '__main__':
    unittest.main()

````

Artifact `/Users/carlos/Projects/slotstream/Tools/optimization_prerequisites_test.py` — 7511 bytes, SHA-256 `03e21743aad6e4457d20c479f52352044e252e6a9f10937bb15424d685f5910a`.

````text
"""Receipt binding tests; benchmark statistics are tested by prefill_bench_test."""
import copy
from contextlib import ExitStack
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from optimization_soak import validate_prerequisites
from prefill_bench import digest


class PrerequisiteTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.identity = {k: c * 64 for k, c in [('binary_sha256', 'a'),
            ('source_archive_sha256', 'b'), ('metallib_sha256', 'c')]}
        self.build = {'identity': self.identity}
        self.decision = [{'candidate': 'combined', 'passed': True, 'checks': {'fixture': True}}]
        self.protocol = {'prerequisites': {'native': {}, 'paired': {}}}
        for name, variant in [('combined-plain', 'integrated'), ('combined-mtp', 'integrated-mtp'),
                              ('read-failure-serving', 'read-failure-serving')]:
            entry = self.entry('native', name)
            self.write(entry, 'manifest.json', {'identity': self.identity, 'passed': True, 'exit_code': 0,
                'assertions': 1, 'command': ['/unused/slotstream', 'optimization-state-check', '--variant', variant]})
            self.write(entry, 'stdout.txt', {'passed': True, 'items': [{'passed': True}]})
        for name in ['short-one', 'unique-prose', 'sampled-short', 'mtp-resource', 'distinct-tail',
                     'complete-repeat', 'unique-with-retention']:
            entry = self.entry('paired', name)
            gate = {'minimum_pairs': 5, 'replacement_rounds': 0, 'all_outputs_exact': True}
            if name in ['short-one', 'distinct-tail', 'complete-repeat']:
                gate.update(minimum_median_client_reduction=.05, minimum_positive_fraction=.8)
            else:
                gate.update(maximum_median_client_regression=.05, minimum_positive_fraction=0)
            if name in ['unique-prose', 'sampled-short', 'mtp-resource']:
                gate.update(minimum_active_savings_bytes=300_000_000, minimum_sampled_peak_savings_bytes=200_000_000)
            self.write(entry, 'manifest.json', {'protocol': {'rounds': 16,
                'acceptance': gate,
                'startup_acceptance': {'minimum_pairs': 5, 'maximum_median_first_job_regression': .05,
                    'all_outputs_exact': True}},
                'arm_builds': {arm: self.build for arm in ['reference', 'combined']}})
            self.write(entry, 'completion.json', {'interrupted': False, 'stopped_early': False,
                'planned_cells': 32, 'recorded_cells': 32, 'acceptance': self.decision,
                'startup_acceptance': self.decision})
            self.write(entry, 'results.jsonl', [{'round': i, 'arm': arm}
                for i in range(1, 17) for arm in ['reference', 'combined']])

    def entry(self, kind, name):
        path = self.root / name; path.mkdir()
        entry = {'directory': str(path), 'sha256': {}}
        self.protocol['prerequisites'][kind][name] = entry
        return entry

    def write(self, entry, name, data):
        path = Path(entry['directory']) / name
        path.write_text(''.join(json.dumps(row) + '\n' for row in data)
                        if name.endswith('jsonl') else json.dumps(data))
        entry['sha256'][name] = digest(path)

    def modify(self, kind, name, file, change):
        entry = self.protocol['prerequisites'][kind][name]
        path = Path(entry['directory']) / file
        data = ([json.loads(line) for line in path.read_text().splitlines()]
                if file.endswith('jsonl') else json.loads(path.read_text()))
        change(data); self.write(entry, file, data)

    def validate(self, *, recomputed=None):
        with ExitStack() as stack:
            summary = stack.enter_context(patch('optimization_soak.bench.summaries', return_value=['fixture']))
            acceptance = stack.enter_context(patch('optimization_soak.bench.acceptance_results',
                return_value=self.decision if recomputed is None else recomputed))
            startup = stack.enter_context(patch('optimization_soak.bench.startup_acceptance_results',
                return_value=self.decision))
            result = validate_prerequisites(self.protocol, self.build)
            self.assertEqual((summary.call_count, acceptance.call_count, startup.call_count), (7, 7, 7))
            return result

    def test_complete_same_build_evidence_is_recomputed_and_accepted(self):
        self.assertEqual(len(self.validate()), 10)

    def test_missing_and_duplicate_workload_evidence_refused(self):
        with self.assertRaises(ValueError): validate_prerequisites({}, self.build)
        original = copy.deepcopy(self.protocol)
        del self.protocol['prerequisites']['native']['combined-mtp']
        with self.assertRaises(ValueError): self.validate()
        self.protocol = original
        p = self.protocol['prerequisites']['paired']; p['short-one'] = p['unique-prose']
        with self.assertRaisesRegex(ValueError, 'own study'): self.validate()

    def test_changed_receipt_digest_is_rejected(self):
        entry = self.protocol['prerequisites']['native']['combined-plain']
        (Path(entry['directory']) / 'stdout.txt').write_text('{}')
        with self.assertRaisesRegex(ValueError, 'digest differs'): self.validate()

    def test_native_wrong_source_failed_assertion_and_wrong_variant_are_rejected(self):
        original = copy.deepcopy(self.protocol)
        for file, mutate in [
            ('manifest.json', lambda d: d['identity'].update(source_archive_sha256='d' * 64)),
            ('stdout.txt', lambda d: d['items'][0].update(passed=False)),
            ('manifest.json', lambda d: d.update(command=['slotstream', 'optimization-state-check', '--variant', 'integrated-mtp']))]:
            entry = self.protocol['prerequisites']['native']['combined-plain']
            data = json.loads((Path(entry['directory']) / file).read_text())
            self.modify('native', 'combined-plain', file, mutate)
            with self.assertRaises(ValueError): self.validate()
            self.write(entry, file, data)
            self.protocol = copy.deepcopy(original)

    def test_incomplete_duplicate_and_other_build_paired_runs_refused(self):
        entry = self.protocol['prerequisites']['paired']['short-one']
        for file, mutate in [
            ('completion.json', lambda d: d.update(stopped_early=True)),
            ('results.jsonl', lambda d: d.__setitem__(-1, d[0])),
            ('manifest.json', lambda d: d['arm_builds']['combined']['identity'].update(binary_sha256='e' * 64)),
            ('manifest.json', lambda d: d['protocol']['acceptance'].update(minimum_pairs=1)),
            ('manifest.json', lambda d: d['protocol']['acceptance'].update(minimum_median_client_reduction=0))]:
            path = Path(entry['directory']) / file; content = path.read_bytes(); before = entry['sha256'][file]
            self.modify('paired', 'short-one', file, mutate)
            with self.assertRaises(ValueError): self.validate()
            path.write_bytes(content); entry['sha256'][file] = before

    def test_claimed_pass_does_not_override_recomputed_failure(self):
        with self.assertRaisesRegex(ValueError, 'recomputed'):
            self.validate(recomputed=[{'candidate': 'combined', 'passed': False}])


if __name__ == '__main__': unittest.main()

````
