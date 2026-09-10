---
type: run
id: 01m1vqxnr73ch052v6bm9w0ee7
created: 2026-09-06T16:13:16.423212+00:00
updated: 2026-09-06T16:13:46.577245+00:00
summary: Optimization lifetime deadline, request pin cleanup and platform policy preparation
binary: No native build/run; Python tools only
captured_at: 2026-09-06
command: python3 -m unittest discover -s Tools -p optimization_soak_test.py -v
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Optimization lifetime deadline, request pin cleanup and platform policy preparation
tool: Python unittest, source patch and native identity reads
---
V167 corrects the bounded soak driver's total wall-clock limit. Per-read HTTP timeouts alone do not enforce the declared 900-second live-server ceiling against a slowly progressing response. A main-thread real-time alarm now bounds startup and the complete request sequence; its timer is disabled and its prior handler restored before owned-server cleanup. Existing active alarms are refused. No model or build ran in this interval.

Ten focused Python tests pass. They include a real 20 ms alarm interrupting a blocking operation, alarm restoration, a mocked full sixty-request driver run, HTTP error/cancellation/deadline failure preservation and owned-server cleanup, and startup failure cleanup. The first mocked success test failed because its fake exchange object incorrectly included and overwrote driver cycle/name fields; that fixture error and output are preserved, and the corrected fake matches the actual exchange contract. No runtime finding is inferred from that fixture failure. V163/V164 bounds and draft bytes remain unchanged; actual plain/MTP soaks are still pending.

V168 integrates the context task's minimal independent successful-request pin cleanup: GPU synchronization precedes unpinning on Generator return, including final-token/EOS paths. It previously passed the other task's 462 context HTTP assertions, reported by that task; this record does not treat that report as combined-build verification. Added integrated assertions cover prefill cancellation, completion, sampling, complete/partial reuse, callback cancellation, retry, one-token completion and immediate EOS, both reference and combined/MTP modes. The existing real HTTP failure test additionally checks pin cleanup after successful retry. These expanded native assertions are unbuilt/unrun here while transport owns the interval.

V169 prepares the automatic new-kernel compatibility policy. A bounded read of native hw.model/chip/kern.osversion identifies the measured Mac17,9 / Apple M5 Pro / 25G83 tuple; native ARM64 is also required. Missing identity, other hardware, older/future OS builds and non-ARM64 fall back to original partial rotation while preserving the portable candidate options. No planner allowance or throughput estimate is derived. Explicit experimental controls still allow future hardware qualification and keep kernel initialization/shape fallbacks. Seventeen additional pure runtime assertions cover the policy, including exact identity matching. The deployment candidate is not yet wired to automatic defaults; all public/environment defaults remain OFF. The new source and native assertions are unbuilt/unrun, not a completed OPT33 gate.

Existing frozen V154/V125 protocols and binaries remain valid for their independent pending studies; the final combined source must be freshly built and bound. Transport task 01a073d9-b583-7d71-916c-1835d53af327 still owns the local storage/build interval for full fresh Mac reconstruction and acceptance, and reserves v0.2.11. It reports public transport commit e498b2d0162cefa314ba9931ebd38c3a0c47f371 from its isolated clone; the shared checkout remains at its previous base. That transport change must be preserved during final integration. Context's unqualified numerical/context delta remains outside shared Sources.


Artifact `/Users/carlos/Projects/slotstream/.build/optimization/soak-lifecycle-v167/optimization_soak.py.before` — 14536 bytes, SHA-256 `0613aab8ab523b93a91412bab25cc22fe65824b2ee8051d113e1fc461c4100cb`.

````text
#!/usr/bin/env python3
"""Bounded repeated-request lifetime qualification; no latency improvement claims."""
import argparse
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
        with (args.out / 'server.stdout').open('wb') as stdout, (args.out / 'server.stderr').open('wb') as stderr:
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

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/soak-lifecycle-v167/optimization_soak_test.py.before` — 5878 bytes, SHA-256 `f7e435672f57b6bda00c26fe730ad72e0c8ecb168ef75f25704a98266ad3ac80`.

````text
#!/usr/bin/env python3
import copy
from pathlib import Path
import unittest

from optimization_soak import assess, clean_resource_observation, validate_protocol
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


if __name__ == '__main__':
    unittest.main()

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/soak-lifecycle-v167/tests-fixture-error.txt` — 2112 bytes, SHA-256 `ae1fbe1032c821ce5030a9b23828a9775398c89080d021ec97925ad5bd09149f`.

````text
test_absolute_peak_prefix_and_embedding_caps_are_independent (optimization_soak_test.SoakTests) ... ok
test_draft_or_relaxed_limits_refuse_before_execution (optimization_soak_test.SoakTests) ... ok
test_driver_preserves_failure_and_cancellation_and_reaps_server (optimization_soak_test.SoakTests) ... ok
test_driver_runs_exactly_sixty_requests_and_reaps_its_only_server (optimization_soak_test.SoakTests) ... ERROR
test_excluded_output_changes_are_still_correctness_failures (optimization_soak_test.SoakTests) ... ok
test_failure_before_metrics_and_missing_requests_fail_without_crashing (optimization_soak_test.SoakTests) ... ok
test_fixed_completed_sequence_and_bounded_growth_pass (optimization_soak_test.SoakTests) ... ok
test_late_growth_cannot_hide_behind_stable_other_positions (optimization_soak_test.SoakTests) ... ok
test_swap_exclusions_need_enough_early_and_late_evidence (optimization_soak_test.SoakTests) ... ok
test_total_deadline_interrupts_a_blocking_operation_and_restores_alarm (optimization_soak_test.SoakTests) ... ok

======================================================================
ERROR: test_driver_runs_exactly_sixty_requests_and_reaps_its_only_server (optimization_soak_test.SoakTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/optimization_soak_test.py", line 158, in test_driver_runs_exactly_sixty_requests_and_reaps_its_only_server
    code, manifest, report, rows, calls = self.run_mock_driver()
  File "/Users/carlos/Projects/slotstream/Tools/optimization_soak_test.py", line 146, in run_mock_driver
    code = soak.main()
  File "/Users/carlos/Projects/slotstream/Tools/optimization_soak.py", line 253, in main
    report = assess(protocol, rows)
  File "/Users/carlos/Projects/slotstream/Tools/optimization_soak.py", line 66, in assess
    raise ValueError('duplicate or undeclared soak request')
ValueError: duplicate or undeclared soak request

----------------------------------------------------------------------
Ran 10 tests in 0.082s

FAILED (errors=1)

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/soak-lifecycle-v167/tests.txt` — 1135 bytes, SHA-256 `88035f09b443436d2bc88f9d1189e8517156a33b20565a3235db289b4de45118`.

````text
test_absolute_peak_prefix_and_embedding_caps_are_independent (optimization_soak_test.SoakTests) ... ok
test_draft_or_relaxed_limits_refuse_before_execution (optimization_soak_test.SoakTests) ... ok
test_driver_preserves_failure_and_cancellation_and_reaps_server (optimization_soak_test.SoakTests) ... ok
test_driver_runs_exactly_sixty_requests_and_reaps_its_only_server (optimization_soak_test.SoakTests) ... ok
test_excluded_output_changes_are_still_correctness_failures (optimization_soak_test.SoakTests) ... ok
test_failure_before_metrics_and_missing_requests_fail_without_crashing (optimization_soak_test.SoakTests) ... ok
test_fixed_completed_sequence_and_bounded_growth_pass (optimization_soak_test.SoakTests) ... ok
test_late_growth_cannot_hide_behind_stable_other_positions (optimization_soak_test.SoakTests) ... ok
test_swap_exclusions_need_enough_early_and_late_evidence (optimization_soak_test.SoakTests) ... ok
test_total_deadline_interrupts_a_blocking_operation_and_restores_alarm (optimization_soak_test.SoakTests) ... ok

----------------------------------------------------------------------
Ran 10 tests in 0.081s

OK

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/request-pin-cleanup-v168/Diagnostics+Integrated.swift.before` — 15816 bytes, SHA-256 `f93ede53e78935dc88500ffa339f5ceb8fe8488223010ace7aba443a636ed9b8`.

````text
import CryptoKit
import CoreGraphics
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Sequential full-model reference/candidate ownership. Only hashes, token
    /// IDs and scalar observations cross arms, never an MLX tensor or model.
    public static func optimizationIntegrated(modelDir: URL, mtp: Bool, visionQueryTile: Bool = false,
                                             ropeFusion: Bool = false, gdnProjection: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        var c = CheckBuilder("optimization-integrated\(mtp ? "-mtp" : "")\(visionQueryTile ? "-vision-query" : "")")
        struct Results {
            var state: [String: [String: String]] = [:]
            var outputs: [String: [Int]] = [:]
        }
        func hash(_ a: MLXArray) -> String {
            "\(a.dtype):\(a.shape):\(SHA256.hash(data: Data(a.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))))"
        }
        func arm(candidate: Bool, expected: Results?) throws -> Results {
            let index = try CheckpointIndex(dir: modelDir)
            let model = try Qwen4ExpModel(index: index, poolSlots: 640, embeddingRowCache: candidate,
                packGDNProjections: candidate && gdnProjection)
            if mtp { try model.enableMTP(modelDir: modelDir) }
            model.optimizations = candidate ? .integrationCandidate : InferenceOptimizations()
            model.optimizations.fusedGDNProjection = candidate && gdnProjection
            if candidate && visionQueryTile { model.optimizations.visionQueryTile = 256 }
            if candidate && ropeFusion {
                model.optimizations.sharedRoPE = true
                model.optimizations.fusedRoPE = true
            }
            let generator = Generator(model: model)
            generator.prefillChunk = 256; generator.prefillCacheLimit = 64 << 20
            generator.speculationEnabled = mtp; generator.draftDepth = 1
            var params = SampleParams.greedy; params.maxTokens = 8; params.seed = 7
            var results = Results()
            c.equal("\(candidate): embedding selection", model.resident.usesEmbeddingRows, candidate)
            for count in [-1, 1, Int.max] {
                let invalid = model.makeState(); invalid.tokenCount = count
                let before = invalid.prefixForkDiagnosticTensors().mapValues(hash)
                do {
                    _ = try model.lastLogitsChecked([17], state: invalid)
                    c.expect("\(candidate): invalid public offset rejected", false)
                } catch { c.expect("\(candidate): invalid public offset rejected", true) }
                c.equal("\(candidate): rejected offset leaves state unchanged", invalid.prefixForkDiagnosticTensors().mapValues(hash), before)
            }
            let blank = Qwen4ExpModel.State()
            let blankFields = blank.prefixForkDiagnosticTensors().mapValues(hash)
            do {
                _ = try model.lastLogitsChecked([17], state: blank)
                c.expect("\(candidate): empty public State rejected", false)
            } catch { c.expect("\(candidate): empty public State rejected", true) }
            c.equal("\(candidate): empty-state rejection is atomic", blank.prefixForkDiagnosticTensors().mapValues(hash), blankFields)
            let tower = try VisionTower(index: index)
            let png = Data(base64Encoded: "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==")!
            let image: CGImage
            if visionQueryTile {
                guard let context = CGContext(data: nil, width: 512, height: 512,
                    bitsPerComponent: 8, bytesPerRow: 2048, space: CGColorSpaceCreateDeviceRGB(),
                    bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
                    throw ModelError("cannot allocate bounded integrated image fixture")
                }
                context.setFillColor(CGColor(red: 1, green: 0, blue: 0, alpha: 1))
                context.fill(CGRect(x: 0, y: 0, width: 512, height: 512))
                guard let made = context.makeImage() else { throw ModelError("cannot materialize integrated image fixture") }
                image = made
            } else { image = try VisionPreprocess.decodeCGImage(png) }
            let imagePlan = try tower.plan(for: image)
            func vision(_ start: Int?) -> VisionPrompt? {
                guard let start else { return nil }
                return VisionPrompt(tower: tower, items: [.init(image: image, plan: imagePlan)],
                    segments: [.init(start: start, count: imagePlan.mergedTokens,
                        hash: ImageHash(hashing: visionQueryTile ? Data("solid-red-512x512-CGContext-v1".utf8) : png))],
                    hiddenSize: model.cfg.hiddenSize)
            }
            let cases: [(String, Int, Int?)] = [
                ("cached17", 17, nil), ("boundary255", 255, nil), ("boundary256", 256, nil),
                ("boundary257", 257, nil), ("long1025", 1025, nil),
                ("image-before", 273, 1),
                ("image-crossing", 273 + imagePlan.mergedTokens, 256 - imagePlan.mergedTokens / 2)
            ]
            for (label, count, start) in cases {
                FileHandle.standardError.write(Data("integrated \(candidate ? "candidate" : "reference") / \(label)\n".utf8))
                var ids = (0..<count).map { 1000 + ($0 * 79) % 190_000 }
                if let start {
                    ids.replaceSubrange(start..<start+imagePlan.mergedTokens,
                        with: repeatElement(model.cfg.imageTokenId, count: imagePlan.mergedTokens))
                }
                let cache = PrefixCache(maxTokens: 8192)
                var keepGoing = true
                generator.onPrefillProgress = { done, total, _ in
                    if done == total && done > 0 { keepGoing = false }
                }
                let vp = vision(start)
                let prefill = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    vision: vp, shouldContinue: { keepGoing })
                generator.onPrefillProgress = nil
                c.expect("\(candidate)/\(label): cancellation commits complete prefill", prefill.0.isEmpty && prefill.1.runtimeError == nil && prefill.1.prefillTokens == count)
                guard let taken = cache.take(matching: ids + [17], images: vp?.cacheSegments(
                    attentionPadding: model.optimizations.visionAttentionPadding,
                    queryTile: model.optimizations.visionQueryTile) ?? []) else {
                    throw ModelError("integrated prefill lost its complete committed state")
                }
                c.equal("\(candidate)/\(label): exact committed offset", taken.state.tokenCount, count)
                if mtp { c.expect("\(candidate)/\(label): head is aligned", taken.state.hasValidMTP) }
                var fields = taken.state.prefixForkDiagnosticTensors().mapValues(hash)
                taken.state.invalidateMTP()
                fields["continuedLogits"] = hash(try model.lastLogitsChecked([17], state: taken.state))
                results.state[label] = fields
                if let wanted = expected?.state[label] { c.equal("\(label): all state bytes and continued logits exact", fields, wanted) }
                let full = generator.generate(promptIds: ids, params: params, eosIds: [], vision: vision(start))
                if visionQueryTile {
                    c.equal("\(candidate)/\(label): explicit vision query bound", full.1.visionQueryTile,
                        candidate && start != nil ? 256 : 0)
                    c.equal("\(candidate)/\(label): executed vision tile count", full.1.visionQueryTileCalls,
                        candidate && start != nil ? tower.vcfg.depth * ((imagePlan.patches + 255) / 256) : 0)
                }
                c.expect("\(candidate)/\(label): full completion succeeds", full.1.runtimeError == nil && full.0.count == params.maxTokens)
                if mtp { c.expect("\(candidate)/\(label): verification executes", full.1.verifyPasses > 0) }
                else { c.equal("\(candidate)/\(label): final forward work is explicit", full.1.decodeModelTokens, params.maxTokens - (candidate ? 1 : 0)) }
                c.expect("\(candidate)/\(label): embeddings remain bounded", full.1.embeddingCachedPayloadBytes <= 11_796_480)
                results.outputs[label] = full.0
                if let wanted = expected?.outputs[label] { c.equal("\(label): exact complete greedy IDs", full.0, wanted) }
            }

            let prompt = (0..<273).map { 1000 + ($0 * 79) % 190_000 }
            for filtered in [false, true] {
                var sample = params
                sample.temperature = 0.7; sample.topK = filtered ? 40 : 0
                sample.topP = filtered ? 0.8 : 1; sample.minP = filtered ? 0.05 : 0
                sample.presencePenalty = filtered ? 1.1 : 0
                for seed: UInt64 in [7, 7_046_029_254_386_353_130] {
                    sample.seed = seed
                    let label = "sample/\(filtered)/\(seed)"
                    let first = generator.generate(promptIds: Array(prompt.prefix(17)), params: sample, eosIds: [])
                    let repeatRun = generator.generate(promptIds: Array(prompt.prefix(17)), params: sample, eosIds: [])
                    c.expect("\(candidate)/\(label): sampled output completes", first.1.runtimeError == nil && first.0.count == sample.maxTokens)
                    c.equal("\(candidate)/\(label): seeded replay exact", repeatRun.0, first.0)
                    results.outputs[label] = first.0
                    if let wanted = expected?.outputs[label] { c.equal("\(label): integrated sampled IDs match reference", first.0, wanted) }
                }
            }
            let retained = PrefixCache(maxTokens: 8192)
            let first = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: retained)
            c.expect("\(candidate): first retained request succeeds", first.1.runtimeError == nil)
            let casesOfReuse: [(String, [Int])] = [
                ("same", prompt),
                ("auxiliary", Array(prompt.prefix(17)) + [23]),
                ("divergent", Array(prompt.prefix(256)) + Array(repeating: 907, count: 259)),
                ("same-after-auxiliary", prompt),
                ("edited", [999] + Array(prompt.dropFirst()))
            ]
            for (label, ids) in casesOfReuse {
                let outcome = generator.generate(promptIds: ids, params: params, eosIds: [], cache: retained)
                c.expect("\(candidate)/\(label): reusable-cache request succeeds", outcome.1.runtimeError == nil && outcome.0.count == params.maxTokens)
                if label == "same" {
                    c.equal("\(candidate): complete checkpoint is exercised", outcome.1.reusedPrefixTokens, candidate ? prompt.count : 0)
                    c.equal("\(candidate): complete hit is observed", outcome.1.completePromptHits, candidate ? 1 : 0)
                    c.equal("\(candidate): complete hit eliminates prefill", outcome.1.prefillTokens, candidate ? 0 : prompt.count)
                    c.equal("\(candidate): same prompt repeats exactly", outcome.0, first.0)
                }
                if label == "edited" { c.equal("\(candidate): edited prefix refuses prior state", outcome.1.reusedPrefixTokens, 0) }
                c.equal("\(candidate)/\(label): no invalid checkpoint published", outcome.1.prefixCheckpointErrors, 0)
                let key = "reuse/\(label)"; results.outputs[key] = outcome.0
                if let wanted = expected?.outputs[key] { c.equal("\(label): interleaved output matches independent reference", outcome.0, wanted) }
            }
            // A shorter committed checkpoint must still help when the entire
            // input differs. Exercise this independently of identical retries
            // and retain the same four physical-state budget.
            let editedTail = Array(prompt.prefix(256)) + Array(repeating: 907, count: 17)
            let partial = PrefixCache(maxTokens: 8192)
            _ = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: partial)
            let tailResult = generator.generate(promptIds: editedTail, params: params, eosIds: [], cache: partial)
            c.expect("\(candidate): partial fallback succeeds", tailResult.1.runtimeError == nil)
            c.equal("\(candidate): edited tail uses the shorter checkpoint", tailResult.1.reusedPrefixTokens, candidate ? 256 : 0)
            c.equal("\(candidate): partial fallback is not a complete hit", tailResult.1.completePromptHits, 0)
            c.expect("\(candidate): combined retention respects physical-state count",
                (partial.json()["conversations"] as? Int ?? Int.max) <= PrefixCache.maxEntries)
            results.outputs["partial-fallback"] = tailResult.0
            if let wanted = expected?.outputs["partial-fallback"] {
                c.equal("partial fallback output matches independent reference", tailResult.0, wanted)
            }
            var delivered: [Int] = []
            let cancelled = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: retained,
                onToken: { id in delivered.append(id); return delivered.count < 2 })
            c.equal("\(candidate): callback cancellation has no hidden output", cancelled.0, delivered)
            c.equal("\(candidate): callback stops at two emissions", delivered.count, 2)
            c.equal("\(candidate): cancellation preserves exact output prefix", delivered, Array(first.0.prefix(2)))
            c.expect("\(candidate): client cancellation is not a model error", cancelled.1.runtimeError == nil)
            let retry = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: retained)
            c.equal("\(candidate): retry after cancellation is exact", retry.0, first.0)
            c.expect("\(candidate): prefix capacity stays bounded", retained.heldTokens <= 8192)
            if ropeFusion || InferenceOptimizations.integrationCandidate.fusedRoPE {
                c.equal("\(candidate): fused RoPE evaluated paths", model.fusedRoPERotationsScheduled > 0, candidate)
                c.equal("\(candidate): shared RoPE evaluated paths", model.ropeTableHits > 0, candidate)
                c.measure("\(candidate).fused_rotations_scheduled", Double(model.fusedRoPERotationsScheduled))
            }
            if gdnProjection {
                let state = model.makeState(), before = model.fusedGDNProjectionsScheduled
                let logits = model.lastLogits([907], state: state); eval(logits)
                var snapshot = state.diagnosticTensors().mapValues(hash)
                snapshot["logits"] = hash(logits)
                results.state["gdn-single"] = snapshot
                if let wanted = expected?.state["gdn-single"] {
                    c.equal("integrated one-token projection state and logits", snapshot, wanted)
                }
                let layers = model.cfg.layerTypes.filter { $0 == "linear_attention" }.count
                c.equal("\(candidate): one-token projection mechanism", model.fusedGDNProjectionsScheduled - before,
                    candidate ? layers : 0)
                c.equal("\(candidate): packed projection layers", model.resident.packedGDNProjectionLayers,
                    candidate ? layers : 0)
            }
            return results
        }
        let reference = try arm(candidate: false, expected: nil)
        MLX.Memory.clearCache()
        _ = try arm(candidate: true, expected: reference)
        return c.report()
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/request-pin-cleanup-v168/Diagnostics+ReadFailureServing.swift.before` — 10219 bytes, SHA-256 `083d9e609c0b3ec93feed540e25aaafb722521de9c0491cf2e4d2af66adf3b8b`.

````text
import Darwin
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Real HTTP parser/handlers and real model, over bounded socket pairs.
    /// This covers response framing, not TCP admission or network timing.
    public static func optimizationReadFailureServing(modelDir: URL) async throws -> CheckReport {
        let engine = try await Engine(modelDir: modelDir,poolSlots: 640)
        engine.generator.speculationEnabled = false
        engine.generator.prefillChunk = 256
        engine.generator.prefillCacheLimit = 64 << 20
        let server = Server(engine: engine,port: 0)
        signal(SIGPIPE,SIG_IGN)
        var c = CheckBuilder("optimization-read-failure-serving")

        func exchange(_ path: String,_ object: [String:Any]?) throws -> (head: String,body: String) {
            let payload = try object.map { try JSONSerialization.data(withJSONObject: $0) } ?? Data()
            var fds: [Int32] = [-1,-1]
            guard socketpair(AF_UNIX,SOCK_STREAM,0,&fds)==0 else { throw ModelError("socketpair failed") }
            let client = fds[0], peer = fds[1]
            var timeout = timeval(tv_sec: 30,tv_usec: 0), one: Int32 = 1
            for fd in fds {
                setsockopt(fd,SOL_SOCKET,SO_RCVTIMEO,&timeout,socklen_t(MemoryLayout<timeval>.size))
                setsockopt(fd,SOL_SOCKET,SO_SNDTIMEO,&timeout,socklen_t(MemoryLayout<timeval>.size))
                setsockopt(fd,SOL_SOCKET,SO_NOSIGPIPE,&one,socklen_t(MemoryLayout<Int32>.size))
            }
            let finished = DispatchSemaphore(value: 0)
            Thread.detachNewThread { server.handle(peer); finished.signal() }
            defer { shutdown(client,SHUT_RDWR); close(client) }
            let method = object == nil ? "GET" : "POST"
            let head = "\(method) \(path) HTTP/1.1\r\nHost: localhost\r\nContent-Type: application/json\r\nContent-Length: \(payload.count)\r\nConnection: close\r\n\r\n"
            let request = Data(head.utf8)+payload
            var wire = Data()
            do {
                try request.withUnsafeBytes { buffer in
                    var sent = 0
                    while sent < buffer.count {
                        let n = Darwin.send(client,buffer.baseAddress!+sent,buffer.count-sent,0)
                        if n<0 && errno==EINTR { continue }
                        guard n>0 else { throw ModelError("request write failed") }
                        sent += n
                    }
                }
                var buffer = [UInt8](repeating: 0,count: 8192)
                while true {
                    let n = recv(client,&buffer,buffer.count,0)
                    if n<0 && errno==EINTR { continue }
                    guard n>=0 else { throw ModelError("response read failed or timed out") }
                    if n==0 { break }
                    wire.append(contentsOf: buffer.prefix(n))
                    guard wire.count <= 1<<20 else { throw ModelError("response exceeds diagnostic bound") }
                }
            } catch {
                shutdown(client,SHUT_RDWR)
                guard finished.wait(timeout: .now()+30) == .success else { throw ModelError("handler did not finish after disconnect") }
                throw error
            }
            guard finished.wait(timeout: .now()+30) == .success else { throw ModelError("handler did not finish") }
            guard let separator = wire.range(of: Data("\r\n\r\n".utf8)) else { throw ModelError("missing HTTP head") }
            let responseHead = String(decoding: wire[..<separator.lowerBound],as: UTF8.self)
            let raw = Data(wire[separator.upperBound...])
            if !responseHead.lowercased().contains("transfer-encoding: chunked") {
                return (responseHead,String(decoding: raw,as: UTF8.self))
            }
            var body = Data(), cursor = 0
            while cursor<raw.count {
                guard let end = raw[cursor...].range(of: Data("\r\n".utf8)),
                    let n = Int(String(decoding: raw[cursor..<end.lowerBound],as: UTF8.self),radix: 16)
                else { throw ModelError("malformed chunk length") }
                cursor = end.upperBound
                guard n>=0,n<=raw.count-cursor,raw.count-cursor-n>=2,
                    raw[cursor+n]==13,raw[cursor+n+1]==10 else { throw ModelError("incomplete HTTP chunk") }
                if n==0 {
                    guard cursor+2==raw.count else { throw ModelError("unexpected trailing HTTP bytes") }
                    return (responseHead,String(decoding: body,as: UTF8.self))
                }
                body.append(raw[cursor..<cursor+n]); cursor += n+2
            }
            throw ModelError("missing terminating HTTP chunk")
        }
        let text = "Print exactly: one two three four five six seven eight."
        let variants: [(String,String,Bool,[String:Any])] = [
            ("generate JSON","/api/generate",false,["model":engine.modelName,"prompt":text,"raw":true,"stream":false,"options":["num_predict":8,"temperature":0,"seed":7]]),
            ("generate NDJSON","/api/generate",true,["model":engine.modelName,"prompt":text,"raw":true,"stream":true,"options":["num_predict":8,"temperature":0,"seed":7]]),
            ("chat JSON","/api/chat",false,["model":engine.modelName,"messages":[["role":"user","content":text]],"think":false,"stream":false,"options":["num_predict":8,"temperature":0,"seed":7]]),
            ("chat NDJSON","/api/chat",true,["model":engine.modelName,"messages":[["role":"user","content":text]],"think":false,"stream":true,"options":["num_predict":8,"temperature":0,"seed":7]]),
            ("OpenAI JSON","/v1/chat/completions",false,["model":engine.modelName,"messages":[["role":"user","content":text]],"stream":false,"max_tokens":8,"temperature":0,"seed":7]),
            ("OpenAI SSE","/v1/chat/completions",true,["model":engine.modelName,"messages":[["role":"user","content":text]],"stream":true,"max_tokens":8,"temperature":0,"seed":7]),
            ("Gateway SSE","/v3/ai/language-model",true,["prompt":[["role":"user","content":[["type":"text","text":text]]]],"toolChoice":["type":"auto"],"maxOutputTokens":8,"temperature":0,"seed":7]),
        ]
        for queued in [false,true] {
            engine.model.optimizations.boundedOutputQueue = queued
            for (name,path,stream,body) in variants {
                let label = "\(name), queued=\(queued)"
                engine.prefixCache.enabled = false; engine.prefixCache.enabled = true
                let fault = ReadFault(afterJobs: 0)
                var passes = 0
                // Fail the main decode pass after prefill emitted a token.
                // No test-only network endpoint or environment bypass exists.
                engine.model.routerObserver = { layer,_ in
                    if layer==0 {
                        passes += 1
                        if passes==2 { engine.model.pool.readFault = fault }
                    }
                }
                let response = try exchange(path,body)
                engine.model.routerObserver = nil; engine.model.pool.readFault = nil
                c.expect("\(label): real read fault fired",fault.hasFired)
                c.expect("\(label): correct HTTP status",response.head.hasPrefix(stream ? "HTTP/1.1 200" : "HTTP/1.1 500"),response.head)
                let lines = stream ? response.body.split(separator: "\n").map(String.init) : [response.body]
                let objects = try lines.compactMap { line -> [String:Any]? in
                    var value = line.trimmingCharacters(in: .whitespacesAndNewlines)
                    if value.hasPrefix("data:") { value = String(value.dropFirst(5)).trimmingCharacters(in: .whitespaces) }
                    if value.isEmpty || value=="[DONE]" { return nil }
                    return try JSONSerialization.jsonObject(with: Data(value.utf8)) as? [String:Any]
                }
                c.expect("\(label): explicit inference error frame",objects.contains { $0["error"] != nil || $0["type"] as? String == "error" },response.body)
                c.expect("\(label): no false successful completion",!objects.contains { object in
                    if object["done"] as? Bool == true || object["type"] as? String == "finish" { return true }
                    let choices = object["choices"] as? [[String:Any]] ?? []
                    return choices.contains { $0["finish_reason"] != nil && !($0["finish_reason"] is NSNull) }
                })
                if stream {
                    let emitted = objects.contains { object in
                        let message = object["message"] as? [String:Any] ?? [:]
                        let choices = object["choices"] as? [[String:Any]] ?? []
                        let delta = choices.first?["delta"] as? [String:Any] ?? [:]
                        let values = [object["response"] as? String,message["content"] as? String,delta["content"] as? String,
                                      object["type"] as? String == "text-delta" ? object["delta"] as? String : nil]
                        return values.contains { !($0 ?? "").isEmpty }
                    }
                    c.expect("\(label): error follows delivered text",emitted,response.body)
                }
                c.equal("\(label): failed state absent from cache",engine.prefixCache.heldTokens,0)
                c.equal("\(label): request pins released",engine.model.pool.pinnedSlotCount,0)
                let health = try exchange("/api/version",nil)
                c.expect("\(label): server remains responsive",health.head.hasPrefix("HTTP/1.1 200"))
                let retry = try exchange("/api/generate",["model":engine.modelName,"prompt":"Say only: ok","stream":false,"think":false,
                    "options":["num_predict":8,"temperature":0,"seed":7]])
                let retryObject = try JSONSerialization.jsonObject(with: Data(retry.body.utf8)) as? [String:Any]
                c.expect("\(label): next request succeeds",retry.head.hasPrefix("HTTP/1.1 200") && retryObject?["done"] as? Bool == true && retryObject?["error"] == nil,retry.body)
            }
        }
        return c.report()
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/request-pin-cleanup-v168/Generate.swift.before` — 61869 bytes, SHA-256 `fb100321a64b54df96bca8c3292db28c7b45ca53eb74e1ee0c6e995dc1416a8d`.

````text
// Prefill + decode loop with sampling, stop tokens, and streaming callbacks.

import Foundation
import MLX

public struct SampleParams {
    public var temperature: Float = 0.7
    public var topP: Float = 0.8
    public var topK: Int = 20
    public var minP: Float = 0
    public var presencePenalty: Float = 1.5
    public var seed: UInt64? = nil
    public var maxTokens = 512
    /// Text sequences that end generation (Ollama `options.stop`, OpenAI `stop`).
    public var stop: [String] = []

    public init() {}

    /// Clamp every knob into the range the sampler is defined on.
    ///
    /// Values outside it used to produce silent garbage rather than an error:
    /// a `top_p` of 0 or a `min_p` above 1 filters out every candidate, and the
    /// old `probs / probs.sum()` then divided 0 by 0, so the sampler emitted
    /// token 0 forever. A negative `num_predict` (Ollama's "until EOS") indexed
    /// a reversed Range and trapped, killing the process.
    public func sanitized() -> SampleParams {
        var p = self
        if !p.temperature.isFinite { p.temperature = 0 }
        p.temperature = max(0, p.temperature)
        if !p.topP.isFinite || p.topP <= 0 || p.topP > 1 { p.topP = 1 }
        if !p.minP.isFinite { p.minP = 0 }
        p.minP = min(max(0, p.minP), 1)
        if !p.presencePenalty.isFinite { p.presencePenalty = 0 }
        p.topK = max(0, p.topK)
        // <= 0 means "as many as allowed" for Ollama (-1) and OpenAI clients.
        if p.maxTokens <= 0 { p.maxTokens = SampleParams.maxTokenCeiling }
        p.maxTokens = min(p.maxTokens, SampleParams.maxTokenCeiling)
        p.stop = p.stop.filter { !$0.isEmpty }
        return p
    }

    /// Upper bound on a single response. Decode is the slow axis here, so an
    /// unbounded "until EOS" request needs a ceiling that is generous but finite.
    public static let maxTokenCeiling = 32_768

    public static var instruct: SampleParams { SampleParams() }
    public static var thinking: SampleParams {
        var p = SampleParams()
        p.temperature = 1.0
        p.topP = 0.95
        p.presencePenalty = 0
        return p
    }
    public static var greedy: SampleParams {
        var p = SampleParams()
        p.temperature = 0
        p.presencePenalty = 0
        return p
    }

    /// Defaults for an agent turn that may call tools.
    ///
    /// Two departures from `instruct`, and both are about the tool grammar
    /// rather than taste:
    ///
    /// * **presence penalty 0.** The instruct default of 1.5 penalises every
    ///   token already used, and the call format is obliged to repeat itself —
    ///   `</parameter>` after every argument, then `</function>`, then
    ///   `</tool_call>`. Penalising a closing tag because an earlier argument
    ///   already used it pushes the model off the grammar exactly where it must
    ///   stay on it.
    /// * **low temperature.** A tool call is a structured artefact with one
    ///   right shape, not prose; there is nothing for sampling diversity to buy
    ///   here, and at 0.7 the same prompt answered with a call on one run and
    ///   with "I don't have any tools available" on the next.
    ///
    /// Not fully greedy: `0.2` keeps a little room to escape a repetition loop,
    /// which pure argmax has no way out of.
    public static var agent: SampleParams {
        var p = SampleParams()
        p.temperature = 0.2
        p.topP = 0.9
        p.presencePenalty = 0
        return p
    }
}

public struct GenStats: Codable {
    public var requestSeconds = 0.0
    public var queueSeconds = 0.0
    public var imageEncodeSeconds = 0.0
    /// Configured vision query bound for this image request, not a kernel count.
    public var visionQueryTile = 0
    /// Counted after each query tile has actually evaluated, across tower blocks.
    public var visionQueryTileCalls = 0
    public var encodedImages = 0
    public var reusedImageFeatures = 0
    public var prefixSkippedImages = 0
    /// From Generator entry to first sampled, non-EOS token; excludes Engine queue.
    public var firstTokenSeconds: Double?
    /// From Engine entry to first nonempty decoded callback, before that callback.
    public var firstTextSeconds: Double?
    public var tokenCallbackSeconds = 0.0
    public var sampleSeconds = 0.0
    public var prefillLocalVictims = 0
    public var decodeLocalVictims = 0
    public var prefillSlotSliceBatches = 0
    public var decodeSlotSliceBatches = 0
    public var decodeSlotSliceRuns = 0
    public var decodeSlotScatterBatches = 0
    public var prefillSlotWordBatches = 0
    public var decodeSlotWordBatches = 0
    public var decodeSlotWordBuffers = 0
    public var prefillSlotCPUBatches = 0
    public var decodeSlotCPUBatches = 0
    public var prefixCheckpointForks = 0
    public var prefixCheckpointStores = 0
    public var prefixCheckpointRefusals = 0
    public var prefixCheckpointErrors = 0
    public var completePromptHits = 0
    public var completePromptStores = 0
    public var embeddingRowsEnabled = false
    /// Unique lookup rows served/read within this request, including MTP.
    public var embeddingRowHits = 0
    public var embeddingRowMisses = 0
    public var embeddingCachedRows = 0
    public var embeddingCachedPayloadBytes = 0
    public var reconciliationSeconds = 0.0
    public var draftSeconds = 0.0
    public var verifySeconds = 0.0
    /// Actual attempted depths: zero is a useful calibration/tail target step;
    /// minus one permanently hands this request to plain decode. Bounded by
    /// the request's output ceiling, and exported with diagnostic stats only.
    public var adaptiveDraftDepths: [Int] = []
    public var adaptiveDisabledAtOutput: Int?
    public var adaptivePlainTokens = 0
    public var decodeForwardPasses = 0
    public var decodeModelTokens = 0
    /// Arrival intervals at the token callback, including earlier callback
    /// stalls. Speculative bursts can contain several very short intervals.
    public var interTokenSeconds: [Double] = []
    public var prefillPasses: [Int] = []
    public var prefillComputePasses: [Int] = []
    public var terminalQueryRowsSkipped = 0
    public var terminalMoERowsSkipped = 0
    public var abortedReadScopes = 0
    public var reconciledHeadTokens = 0
    public var reusedHeadTokens = 0
    public var lifetimeRSSPeakBytes: UInt64 = 0
    public var physicalFootprintEndBytes: UInt64 = 0
    public var sampledFootprint: FootprintSampler.Result?
    public var imagePreparation: ImagePreparationObservation?
    public var generatorVMBefore: ProcessMemory.VMActivity?
    public var generatorVMAfter: ProcessMemory.VMActivity?
    public var generatorSystemBefore: ProcessMemory.OperatingConditions?
    public var generatorSystemAfter: ProcessMemory.OperatingConditions?
    public var mlxActiveEndBytes = 0
    public var mlxCacheEndBytes = 0
    public var prefillMLXActiveBytes = 0
    public var prefillMLXCacheBytes = 0
    public var prefillPhysicalFootprintBytes: UInt64 = 0
    public var prefillGPUWaitSeconds = 0.0
    public var prefillRowSortSeconds = 0.0
    public var prefillReadBytes = 0
    public var decodeReadBytes = 0
    public var allocatedSequenceBytes = 0
    public var sharedExpertPrelaunches = 0
    public var fusedRoPERotationsScheduled = 0
    public var fusedGDNProjectionsScheduled = 0
    public var packedGDNProjectionLayers = 0
    public var packedGDNProjectionPayloadBytes = 0
    public var ropeTableHits = 0
    public var ropeTableBuilds = 0
    public var residentExpertPrelaunches = 0
    public var residentExpertJoins = 0
    /// Host wait at the explicit join; this is not a measured GPU duration.
    public var residentExpertJoinSeconds = 0.0
    public var ngramCachedRows = 0
    public var cachedRouterBytes = 0
    public var ngramCachePayloadBytes = 0
    /// Every token in the prompt, whether or not it had to be recomputed.
    /// This is what the Ollama/OpenAI surfaces report as prompt_eval_count.
    public var promptTokens = 0
    /// Prompt tokens actually pushed through the model this request. Equal to
    /// `promptTokens` on a cold prompt; `promptTokens - reusedPrefixTokens`
    /// when the conversation prefix cache matched.
    public var prefillTokens = 0
    /// Prompt tokens served from the retained state of a previous request.
    public var reusedPrefixTokens = 0
    public var prefillSeconds = 0.0
    public var decodeTokens = 0
    public var decodeSeconds = 0.0
    public var expertHitRate = 0.0
    public var ngramRowHits = 0
    public var ngramRowMisses = 0
    public var ngramLookaheadRows = 0
    public var ngramLookaheadDiscarded = 0
    public var ngramLookaheadWaitSeconds = 0.0
    public var ngramPrefetchSeconds = 0.0
    /// Speculative decode (MTP): drafts proposed, drafts accepted, and verify
    /// passes run. Zero when the draft head is disabled.
    public var draftedTokens = 0
    public var acceptedDrafts = 0
    public var verifyPasses = 0
    public var draftAcceptRate: Double {
        draftedTokens > 0 ? Double(acceptedDrafts) / Double(draftedTokens) : 0
    }
    /// Legacy observation: max(lifetime RSS, current physical footprint).
    /// It is not an upper bound on physical-footprint peaks. The separate
    /// sampledFootprint observation is required for memory qualification.
    public var peakMemoryGB = 0.0
    /// MLX-only high-water retained as a diagnostic, never as the RAM gate.
    public var mlxPeakMemoryGB = 0.0
    /// Read/scatter host intervals can overlap GPU work. Subtracting them
    /// from wall time does not measure GPU compute.
    public var prefillIOSeconds = 0.0
    public var prefillScatterSeconds = 0.0
    public var prefillRecords = 0
    /// The same split for decode. Prefill's was what showed the chunk size was
    /// the lever and read-ahead was not; decode had no equivalent, so "decode
    /// is slow" could not be attributed to the miss path, to the scatter, or
    /// to per-token dispatch without guessing. Everything not counted here is
    /// compute plus dispatch.
    public var decodeIOSeconds = 0.0
    public var decodeScatterSeconds = 0.0
    public var decodeRecords = 0
    /// "stop" (EOS, a stop sequence, or a cancelled stream) or "length".
    public var finishReason = "stop"
    /// A recoverable request failure. The failed state is never cached and
    /// serving adapters must emit an error instead of a successful completion.
    public var runtimeError: String?
    /// Pressure-to-observed-safe-boundary latency, not GPU preemption time.
    public var memoryPressureCancelled = false
    public var memoryPressureBoundarySeconds: Double?

    public var prefillTPS: Double { prefillSeconds > 0 ? Double(prefillTokens) / prefillSeconds : 0 }
    public var prefixHit: Bool { reusedPrefixTokens > 0 }
    public var decodeTPS: Double { decodeSeconds > 0 ? Double(decodeTokens) / decodeSeconds : 0 }
}

/// Token sampling, split out from the decode loop so it can be exercised on
/// synthetic logits with no checkpoint loaded (`slotstream sampler-golden`)
/// and compared against the numpy reference in `Tools/sampler_ref.py`.
///
/// Order matches HuggingFace's processor chain: presence penalty on raw
/// logits, then temperature, then top-k, then top-p, then min-p.
public struct Sampler {
    public var rngState: UInt64 = 0x9E37_79B9_7F4A_7C15
    public var valueOnlyTopK = false
    public var deviceDraw = false

    public init(seed: UInt64? = nil) {
        if let s = seed { rngState = s == 0 ? 0xDEAD_BEEF : s }
    }

    public mutating func next(
        _ logits: MLXArray, params: SampleParams, generated: Set<Int>
    ) -> Int {
        var l = logits.reshaped([-1]).asType(.float32)
        if params.presencePenalty != 0 && !generated.isEmpty {
            // subtract penalty on already-generated tokens
            let ids = MLXArray(generated.sorted().map { Int32($0) })
            let current = take(l, ids, axis: 0)
            l = putAlong(l, ids, values: current - params.presencePenalty, axis: 0)
        }
        if params.temperature <= 0 {
            return argMax(l).item(Int.self)
        }
        l = l / params.temperature
        if params.topK > 0 && params.topK < l.dim(0) {
            let kth: MLXArray
            if valueOnlyTopK {
                // Only the threshold is needed, never the sort's indices.
                // Threshold ties still survive; CDF ordering and RNG are intact.
                kth = -partitioned(-l, kth: params.topK - 1)[params.topK - 1]
            } else {
                kth = takeAlong(
                    l, argPartition(-l, kth: params.topK - 1)[..<params.topK], axis: 0
                ).min()
            }
            l = which(l .< kth, MLXArray(-Float.infinity), l)
        }
        var probs = softmax(l, axis: -1)
        if params.topP < 1 {
            let order = argSort(-probs)
            let sorted = take(probs, order, axis: 0)
            let cum = cumsum(sorted, axis: 0)
            let keepSorted = (cum - sorted) .< params.topP  // keep until cumulative prob (exclusive) reaches topP
            var keep = MLXArray.zeros([probs.dim(0)], dtype: .bool)
            keep = putAlong(keep, order, values: keepSorted, axis: 0)
            probs = which(keep, probs, MLXArray(Float(0)))
        }
        if params.minP > 0 {
            let cutoff = probs.max() * params.minP
            probs = which(probs .< cutoff, MLXArray(Float(0)), probs)
        }
        // gumbel-free categorical: inverse CDF with a splitmix stream.
        // The draw is scaled by the unnormalized total instead of normalizing
        // the probabilities: it avoids a 0/0 when a filter empties the
        // candidate set, and since u < 1 it also guarantees u*total < total,
        // so the pick can never run off the end of the CDF onto a
        // zero-probability token the way a bare `cdf .< u` could.
        rngState = Splitmix.mix(rngState &+ 1)
        let u = Float(Double(rngState >> 11) / Double(1 << 53))
        let cdf = cumsum(probs, axis: 0)
        if deviceDraw {
            let total = cdf[probs.dim(0) - 1]
            let valid = isFinite(total) .&& (total .> MLXArray(Float(0)))
            // At zero, select the first strictly positive CDF. A lower-bound
            // search otherwise chooses a leading token with zero mass.
            let before = u == 0 ? cdf .<= MLXArray(Float(0)) : cdf .< (MLXArray(u) * total)
            let pick = minimum(before.sum(), MLXArray(probs.dim(0) - 1))
            let fallback = argMax(logits.reshaped([-1]).asType(.float32)).asType(pick.dtype)
            return which(valid, pick, fallback).item(Int.self)
        }
        let total = cdf[probs.dim(0) - 1].item(Float.self)
        guard total.isFinite, total > 0 else {
            // Nothing survived filtering (or the logits were NaN): fall back to
            // the most likely token rather than emitting token 0 forever.
            return argMax(logits.reshaped([-1]).asType(.float32)).item(Int.self)
        }
        let before = u == 0 ? cdf .<= MLXArray(Float(0)) : cdf .< MLXArray(u * total)
        let pick = before.sum().item(Int.self)
        return min(pick, probs.dim(0) - 1)
    }
}

public final class Generator {
    public let model: Qwen4ExpModel
    /// Tokens per prefill pass. Bigger is faster on long prompts: a chunk
    /// activates nearly every expert of every layer, so the expert stream is
    /// re-read roughly once per chunk and halving the chunk count halves the
    /// bytes moved. It costs transient activation memory, which is why it is a
    /// knob rather than "as large as the prompt". Measured in MEASUREMENTS.md.
    public var prefillChunk = PrefillTuning.chunk {
        didSet { if let ceiling = prefillBudgetCeiling { prefillChunk = min(max(1, prefillChunk), ceiling) } }
    }
    private var prefillBudgetCeiling: Int?
    package func setPrefillBudgetCeiling(_ ceiling: Int?) {
        prefillBudgetCeiling = ceiling
        if let ceiling { prefillChunk = min(max(1, prefillChunk), ceiling) }
    }
    /// Draft tokens per speculative round when the MTP head is enabled.
    /// Depth 1 by measurement (MEASUREMENTS M9). At 122 experts/layer, the
    /// size auto enables the head at, depth 1 reads ×1.17, depth 2 ×1.13 and
    /// depth 4 ×0.88; at 57/layer ×1.13 / ×1.12 / ×0.96. A k-token verify
    /// pass costs about 1 + 0.16k single passes with every expert resident
    /// and verified recurrent states are recorded for exact rollback.
    /// SLOTSTREAM_DRAFT_DEPTH overrides for experiments.
    public var draftDepth: Int = {
        if let s = ProcessInfo.processInfo.environment["SLOTSTREAM_DRAFT_DEPTH"],
            let n = Int(s), n >= 1, n <= 16 { return n }
        return 1
    }()
    /// Gate for the speculative path — `mtp-check` compares speculative
    /// against plain decode on the same loaded model by flipping this.
    public var speculationEnabled = true
    /// Optional observer, disabled in ordinary inference. A/B its overhead.
    public var footprintSampling = false
    /// Deterministic cost injection for state-transition diagnostics only.
    /// Does not change allocations, model values or request authority.
    package var adaptiveCostOverride: ((Double, Bool) -> Double)?
    /// `SLOTSTREAM_SWEEP_TRACE=1` prints where a sweep's prefill time went.
    static let sweepTrace = ProcessInfo.processInfo.environment["SLOTSTREAM_SWEEP_TRACE"] == "1"
    /// MLX buffer-cache cap in bytes while a prompt of `SweepTuning.minTokens`
    /// or more is read, nil for no cap. The engine sets it from the memory
    /// plan: 512 MB at targets of 12 GB and under, where the sweep's varying
    /// array sizes filling the 2 GB cache cost a 7,960-token prompt 1.7 GB of
    /// peak at the 8.1 GB floor (measured 7.4 against 9.1 GB); nothing above,
    /// where the cache is cheap and the cap costs about 6% of prefill.
    /// `SLOTSTREAM_PREFILL_CACHE_MB` overrides at any target.
    public var prefillCacheLimit: Int? = nil
    /// Called after every prefill pass with (tokens read this request, tokens
    /// this request will read, seconds elapsed). `run` and `serve` hang a
    /// PrefillProgressReporter here so a five-minute prompt does not look
    /// like a hang.
    public var onPrefillProgress: ((Int, Int, Double) -> Void)?
    /// Same progress plus the absolute already-consumed prefix. The original
    /// callback remains compatible for embedding clients.
    public var onPrefillProgressAbsolute: ((Int, Int, Double, Int) -> Void)?
    var sampler = Sampler()
    var rngState: UInt64 {
        get { sampler.rngState }
        set { sampler.rngState = newValue }
    }

    public init(model: Qwen4ExpModel) {
        self.model = model
    }

    func sample(_ logits: MLXArray, params: SampleParams, generated: Set<Int>) -> Int {
        sampler.next(logits, params: params, generated: generated)
    }

    /// Runs prefill + decode; calls `onToken` for each generated token id.
    /// Returns (tokenIds, stats). `stop` checked between tokens (cancellation).
    /// `cache`, when given, is consulted for a state this prompt extends and
    /// receives the state back at the end, holding exactly the ids it consumed.
    public func generate(
        promptIds: [Int], params: SampleParams, eosIds: Set<Int>,
        cache: PrefixCache? = nil, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int) -> Bool)? = nil
    ) -> ([Int], GenStats) {
        let requestStart = RuntimeClock.now()
        let sharedPrelaunchStart = model.sharedExpertPrelaunches
        let rotationStart = model.fusedRoPERotationsScheduled
        let gdnProjectionStart = model.fusedGDNProjectionsScheduled
        let ropeHitStart = model.ropeTableHits
        let ropeBuildStart = model.ropeTableBuilds
        let residentPrelaunchStart = model.residentExpertPrelaunches
        let residentJoinsStart = model.residentExpertJoins
        let residentJoinStart = model.residentExpertJoinSeconds
        let terminalQueryStart = model.terminalQueryRowsSkipped
        let terminalMoEStart = model.terminalMoERowsSkipped
        let footprint = footprintSampling ? FootprintSampler() : nil
        let params = params.sanitized()
        sampler.valueOnlyTopK = model.optimizations.valueOnlySamplerThreshold
        sampler.deviceDraw = model.optimizations.deviceSamplerDraw
        if let s = params.seed { rngState = s == 0 ? 0xDEAD_BEEF : s }
        var stats = GenStats()
        let embeddingHitsStart = model.resident.embeddingRowHits
        let embeddingMissesStart = model.resident.embeddingRowMisses
        func finish(_ output: [Int]) -> ([Int], GenStats) {
            stats.embeddingRowsEnabled = model.resident.usesEmbeddingRows
            stats.embeddingRowHits = model.resident.embeddingRowHits - embeddingHitsStart
            stats.embeddingRowMisses = model.resident.embeddingRowMisses - embeddingMissesStart
            stats.embeddingCachedRows = model.resident.embeddingCachedRows
            stats.embeddingCachedPayloadBytes = model.resident.embeddingCachedPayloadBytes
            return (output, stats)
        }
        stats.imagePreparation = vision?.preparationObservation
        stats.visionQueryTile = vision == nil ? 0 : model.optimizations.visionQueryTile
        stats.generatorVMBefore = footprintSampling ? ProcessMemory.vmActivity() : nil
        stats.generatorSystemBefore = footprintSampling ? ProcessMemory.operatingConditions() : nil
        // An empty prompt would leave `logits` at its placeholder value and make
        // the sampler invent a first token from nothing. Callers reject this at
        // the API boundary; this is the backstop.
        guard !promptIds.isEmpty else {
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.sampledFootprint = footprint?.finish()
            stats.terminalQueryRowsSkipped = model.terminalQueryRowsSkipped - terminalQueryStart
            stats.terminalMoERowsSkipped = model.terminalMoERowsSkipped - terminalMoEStart
            stats.sharedExpertPrelaunches = model.sharedExpertPrelaunches - sharedPrelaunchStart
            stats.fusedRoPERotationsScheduled = model.fusedRoPERotationsScheduled - rotationStart
            stats.fusedGDNProjectionsScheduled = model.fusedGDNProjectionsScheduled - gdnProjectionStart
            stats.packedGDNProjectionLayers = model.resident.packedGDNProjectionLayers
            stats.packedGDNProjectionPayloadBytes = model.resident.packedGDNProjectionPayloadBytes
            stats.ropeTableHits = model.ropeTableHits - ropeHitStart
            stats.ropeTableBuilds = model.ropeTableBuilds - ropeBuildStart
            stats.residentExpertPrelaunches = model.residentExpertPrelaunches - residentPrelaunchStart
            stats.residentExpertJoins = model.residentExpertJoins - residentJoinsStart
            stats.residentExpertJoinSeconds = model.residentExpertJoinSeconds - residentJoinStart
            stats.cachedRouterBytes = model.cachedRouterBytes
            stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
            stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
            return finish([])
        }
        model.prepareOptimizationKernels()
        // Vision prompts are cacheable, but not on ids alone: every image
        // expands to a run of the same placeholder id, so a second picture of
        // the same shape produces identical ids. The image segments carry a
        // digest of the bytes behind each run, and `take` requires those to
        // agree as well; a swapped image therefore misses instead of resuming
        // a state built from the wrong pixels.
        let images = vision?.cacheSegments(attentionPadding: model.optimizations.visionAttentionPadding,
            queryTile: model.optimizations.visionQueryTile) ?? []
        // A hit hands over the state and the count of prompt tokens it already
        // consumed; a miss evicts enough LRU state before this allocation to
        // keep retained + active state inside the shared bounds (PrefixCache).
        let checkpointHitsBefore = cache?.checkpointHits ?? 0
        let completeKey = model.optimizations.completePromptCheckpoint
            ? PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                prefillChunk: prefillChunk, mtp: speculationEnabled && model.mtpHead != nil) : nil
        let hit = cache?.takeForGeneration(
            matching: promptIds, images: images,
            reserveTokens: promptIds.count + params.maxTokens,
            reserveSequenceBytes: model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
                mtp: speculationEnabled && model.mtpHead != nil), completePromptKey: completeKey,
            modelIdentity: model.promptCheckpointIdentity)
        let state = hit?.state ?? model.makeState()
        let reused = hit?.reused ?? 0
        stats.promptTokens = promptIds.count
        stats.reusedPrefixTokens = reused
        stats.prefixCheckpointForks = (cache?.checkpointHits ?? 0) - checkpointHitsBefore
        stats.completePromptHits = hit?.logits == nil ? 0 : 1
        MLX.Memory.peakMemory = 0
        // Zero before prefill, not only after: otherwise these carry the
        // previous request's decode phase into this request's prefill split.
        model.pool.resetStats()
        model.ngram.resetStats()
        model.ngram.resetObservation()

        // ---- prefill in chunks (only the tokens the state has not consumed)
        // With the MTP draft head enabled, every chunk also flows through the
        // head so its attention cache covers the whole prompt: the entry for
        // token i fuses the previous position's multi stream with token i's
        // embedding, keeping the invariant mtp.offset == tokenCount - 1.
        // A state handed back by the cache that a plain-path request built
        // has no draft cache to extend; finish that request plain rather than
        // speculating over a misaligned head (unreachable in serve, where the
        // mode is fixed per process; the A/B tools flip it per request).
        // Vision prompts speculate too now: the head's prefill consumption
        // splices the tower's rows at the placeholder positions (MTPHead's
        // `spliceVisionEmbeds`), so its cache is built on the embeddings the
        // main model actually saw. A state produced by a plain vision request
        // still runs plain, since its head cache would claim positions the
        // main state no longer matches.
        let stateKnowsMTP = hit == nil || state.hasValidMTP
        let mtpHead = speculationEnabled && stateKnowsMTP ? model.mtpHead : nil
        if mtpHead != nil && state.mtp == nil { state.mtp = MTPState() }
        if mtpHead == nil { state.invalidateMTP() }
        // Vision: the tower runs here and not at tokenize time, so an image the
        // reused prefix already covers costs nothing at all. What comes back is
        // one run per image still needing a splice, at absolute prompt offsets,
        // which each chunk clips to its own window. The offsets come from the
        // segments rather than from a scan for placeholder ids, so the reused
        // head is skipped for free.
        // A sweep allocates arrays whose sizes vary from group to group, and
        // MLX's buffer cache keeps every freed size up to its limit, so by the
        // end of a long prompt the cache alone held its whole 2 GB (measured
        // 2.16 GB) on top of the pass. Where memory is tight the engine caps
        // it while the prompt is read (`prefillCacheLimit`); decode's small,
        // uniform working set gets the full cache back.
        let savedCacheLimit = MLX.Memory.cacheLimit
        defer { MLX.Memory.cacheLimit = savedCacheLimit }
        if let cap = prefillCacheLimit, promptIds.count - reused >= SweepTuning.minTokens {
            MLX.Memory.cacheLimit = min(savedCacheLimit, cap)
        }
        let imageStart = RuntimeClock.now()
        let visionRuns: [VisionRun]
        do {
            visionRuns = try vision?.runsChecked(consumedTokens: reused, deduplicate: model.optimizations.deduplicateImages,
                attentionPadding: model.optimizations.visionAttentionPadding,
                queryTile: model.optimizations.visionQueryTile) ?? []
        } catch {
            model.pool.unpinAll()
            model.pool.admitOnSweep = false
            stats.runtimeError = "image preprocessing failed: \(error)"
            stats.visionQueryTileCalls = vision?.executedQueryTiles ?? 0
            stats.finishReason = "error"
            stats.imageEncodeSeconds = RuntimeClock.seconds(since: imageStart)
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            stats.sampledFootprint = footprint?.finish()
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.peakMemoryGB = ProcessMemory.peakResidentGB
            stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
            stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
            return finish([])
        }
        // The tower evaluates each transformer block, but its final merger is
        // lazy. Complete it here so image time includes the whole encoder and
        // prefill time does not silently absorb the last image projection.
        if !visionRuns.isEmpty { eval(visionRuns.map(\.rows)) }
        stats.imageEncodeSeconds = RuntimeClock.seconds(since: imageStart)
        stats.encodedImages = vision?.encodedImages ?? 0
        stats.visionQueryTileCalls = vision?.executedQueryTiles ?? 0
        stats.reusedImageFeatures = vision?.reusedImageFeatures ?? 0
        stats.prefixSkippedImages = vision?.prefixSkippedImages ?? 0
        var t0 = RuntimeClock.now()
        var logits: MLXArray = hit?.logits ?? MLXArray(0)
        var i = reused
        func discardFailedState(_ error: Error) {
            // Read workers are already joined by the checked stores. Complete
            // previously queued, valid pool copies and GPU readers before
            // releasing pins. This request state is never returned to cache.
            model.pool.commitAdmissions()
            Stream.gpu.synchronize()
            model.pool.unpinAll()
            model.pool.admitOnSweep = false
            state.setRecording(false)
            state.invalidateMTP()
            stats.runtimeError = "model execution failed: \(error)"
            stats.finishReason = "error"
        }
        func progress(_ done: Int, _ elapsed: Double) {
            onPrefillProgress?(done, promptIds.count - reused, elapsed)
            onPrefillProgressAbsolute?(done, promptIds.count - reused, elapsed, reused)
        }
        if i < promptIds.count { progress(0, 0) }
        var cancelledPrefill = false
        while i < promptIds.count {
            if cancelledPrefill || shouldContinue?() == false {
                MLX.Memory.cacheLimit = savedCacheLimit
                stats.finishReason = "stop"
                stats.prefillTokens = i - reused
                stats.prefillSeconds = RuntimeClock.seconds(since: t0)
                stats.peakMemoryGB = ProcessMemory.peakResidentGB
                stats.mlxPeakMemoryGB = Double(MLX.Memory.peakMemory) / 1e9
                stats.prefillRecords = model.pool.recordsFetched
                stats.prefillLocalVictims = model.pool.floorLocalVictims
                stats.prefillReadBytes = model.pool.recordsFetched * model.pool.recordBytes
                stats.allocatedSequenceBytes = state.allocatedSequenceBytes
                stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
                stats.sampledFootprint = footprint?.finish()
                stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
                stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
                model.pool.admitOnSweep = false
                // Each completed chronological pass is a whole-stack commit.
                // Publish only that boundary; a partial image keeps its digest
                // and consumed span, never identities of future images.
                if i > 0, state.tokenCount == i {
                    let committedImages = images.compactMap { image -> ImageSegment? in
                        guard image.start < i else { return nil }
                        return ImageSegment(start: image.start, count: min(image.count, i - image.start),
                            hash: image.hash, preparationIdentity: image.preparationIdentity)
                    }
                    cache?.store(state: state, tokens: Array(promptIds.prefix(i)), images: committedImages)
                }
                stats.terminalQueryRowsSkipped = model.terminalQueryRowsSkipped - terminalQueryStart
            stats.terminalMoERowsSkipped = model.terminalMoERowsSkipped - terminalMoEStart
            stats.sharedExpertPrelaunches = model.sharedExpertPrelaunches - sharedPrelaunchStart
            stats.fusedRoPERotationsScheduled = model.fusedRoPERotationsScheduled - rotationStart
            stats.fusedGDNProjectionsScheduled = model.fusedGDNProjectionsScheduled - gdnProjectionStart
            stats.packedGDNProjectionLayers = model.resident.packedGDNProjectionLayers
            stats.packedGDNProjectionPayloadBytes = model.resident.packedGDNProjectionPayloadBytes
            stats.ropeTableHits = model.ropeTableHits - ropeHitStart
            stats.ropeTableBuilds = model.ropeTableBuilds - ropeBuildStart
            stats.residentExpertPrelaunches = model.residentExpertPrelaunches - residentPrelaunchStart
            stats.residentExpertJoins = model.residentExpertJoins - residentJoinsStart
            stats.residentExpertJoinSeconds = model.residentExpertJoinSeconds - residentJoinStart
                stats.cachedRouterBytes = model.cachedRouterBytes
                stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
                stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
                return finish([])
            }
            // Shape changes retain the measured envelope and are qualified
            // against the rechunking numerical contract, not assumed exact.
            let passes = model.optimizations.readScopeEnabled
                ? PrefillSchedule.scopePasses(remaining: promptIds.count - i, at: i,
                    maxChunk: prefillChunk, maxScope: model.optimizations.readScopeTokens,
                    tailAware: model.optimizations.tailAwarePrefill)
                : [PrefillSchedule.next(remaining: promptIds.count - i, at: i,
                    maxChunk: prefillChunk, tailAware: model.optimizations.tailAwarePrefill)]
            let hi = i + passes.reduce(0, +)
            // Only the last pass warms the pool with the prompt's hot experts
            // (sweep admission); no other pass may evict what decode was using.
            model.pool.admitOnSweep = hi == promptIds.count
            let chunk = Array(promptIds[i ..< hi])
            let chunkVision = visionRuns.compactMap { $0.clipped(to: i, hi) }
            do {
            if model.optimizations.readScopeEnabled, passes.count > 1 {
                let result = try model.consumeReadScopeChecked(chunk, passes: passes, state: state,
                    vision: chunkVision, head: mtpHead, final: hi == promptIds.count,
                    shouldContinue: shouldContinue)
                if !result.committed {
                    stats.abortedReadScopes += 1
                    cancelledPrefill = true
                    continue
                }
                if let value = result.logits { logits = value }
            } else if let head = mtpHead {
                let (mixed, multi) = try model.hiddenStatesWithMultiChecked(chunk, state: state, vision: chunkVision)
                state.lastMulti = try head.consumeChecked(
                    chunk: chunk, chunkMulti: multi, prevMulti: state.lastMulti,
                    resident: model.resident, rope: model.rope, state: state.mtp!,
                    vision: chunkVision, compactRetainedRow: model.optimizations.compactMTPRow)
                if hi == promptIds.count {
                    logits = model.lmHead(mixed[0..., (mixed.dim(1) - 1)..., 0...])
                    eval(logits)
                } else if !model.optimizations.demandedPrefillOutput {
                    eval(mixed)
                }
            } else if hi == promptIds.count {
                logits = try model.lastLogitsChecked(chunk, state: state, vision: chunkVision)
                eval(logits)
            } else if model.optimizations.demandedPrefillOutput {
                try model.consumePromptChecked(chunk, state: state, vision: chunkVision)
            } else {
                let h = try model.hiddenStatesChecked(chunk, state: state, vision: chunkVision)
                eval(h)
            }
            } catch {
                discardFailedState(error)
                if model.optimizations.readScopeEnabled, passes.count > 1 { stats.abortedReadScopes += 1 }
                stats.prefillTokens = i - reused
                stats.prefillSeconds = RuntimeClock.seconds(since: t0)
                stats.prefillIOSeconds = model.pool.ioSeconds
                stats.prefillScatterSeconds = model.pool.scatterSeconds
                stats.prefillRecords = model.pool.recordsFetched
                stats.prefillReadBytes = model.pool.recordsFetched * model.pool.recordBytes
                stats.allocatedSequenceBytes = state.allocatedSequenceBytes
                stats.mlxPeakMemoryGB = Double(MLX.Memory.peakMemory) / 1e9
                stats.peakMemoryGB = ProcessMemory.peakResidentGB
                stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
                stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
                stats.sampledFootprint = footprint?.finish()
                stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
                stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
                stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
                return finish([])
            }
            stats.prefillPasses.append(chunk.count)
            stats.prefillComputePasses.append(contentsOf: passes)
            i = hi
            if let cache, i == model.optimizations.prefixCheckpointTokens,
               reused < i, i < promptIds.count {
                // Only an existing whole-stack commit is eligible. Do not
                // split/rebatch a pass merely to manufacture this boundary.
                do {
                    let retained = try cache.storeReusableCheckpoint(state: state,
                        tokens: Array(promptIds.prefix(i)), images: images,
                        reserveTokens: promptIds.count + params.maxTokens,
                        reserveSequenceBytes: model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
                            mtp: mtpHead != nil))
                    if retained { stats.prefixCheckpointStores += 1 }
                    else { stats.prefixCheckpointRefusals += 1 }
                } catch {
                    // Optional retention must not publish an invalid state or
                    // fail an otherwise valid forward. The miss stays visible.
                    stats.prefixCheckpointErrors += 1
                }
            }
            progress(i - reused, RuntimeClock.seconds(since: t0))
        }
        if reused < promptIds.count, let cache, let completeKey {
            // Reuse the actual complete prefill boundary, without splitting
            // or replaying a pass. State alone cannot supply the first token;
            // retain its compact raw logits too, before any sampling mutation.
            do {
                // A strict-prefix hit can have been produced without a draft
                // state. That request deliberately finishes plain; stamp the
                // mode actually used, so a later MTP request rebuilds its head.
                let producedKey = PromptCheckpointKey(model: completeKey.model,
                    optimizations: completeKey.optimizations, prefillChunk: completeKey.prefillChunk,
                    mtp: mtpHead != nil)
                let retained = try cache.storeCompletePrompt(state: state, tokens: promptIds, images: images,
                    reserveTokens: promptIds.count + params.maxTokens,
                    reserveSequenceBytes: model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
                        mtp: mtpHead != nil), logits: logits, vocabularySize: model.cfg.vocabSize, key: producedKey)
                if retained { stats.completePromptStores += 1 }
                else { stats.prefixCheckpointRefusals += 1 }
            } catch { stats.prefixCheckpointErrors += 1 }
        }
        MLX.Memory.cacheLimit = savedCacheLimit
        model.pool.admitOnSweep = false
        stats.prefillTokens = promptIds.count - reused
        stats.prefillSeconds = RuntimeClock.seconds(since: t0)
        stats.prefillIOSeconds = model.pool.ioSeconds
        stats.prefillScatterSeconds = model.pool.scatterSeconds
        stats.prefillRecords = model.pool.recordsFetched
        stats.prefillLocalVictims = model.pool.floorLocalVictims
        stats.prefillSlotSliceBatches = model.pool.slotSliceBatches
        stats.prefillSlotWordBatches = model.pool.slotWordBatches
        stats.prefillSlotCPUBatches = model.pool.slotCPUBatches
        stats.prefillMLXActiveBytes = MLX.Memory.activeMemory
        stats.prefillMLXCacheBytes = MLX.Memory.cacheMemory
        stats.prefillPhysicalFootprintBytes = ProcessMemory.residentBytes()
        stats.prefillReadBytes = model.pool.recordsFetched * model.pool.recordBytes
        stats.prefillGPUWaitSeconds = model.pool.sweepWaitSeconds
        stats.prefillRowSortSeconds = model.pool.sweepSortSeconds
        if Self.sweepTrace {
            let line = String(
                format: "sweep trace: io %.2fs, gpu wait %.2fs, row sort %.2fs, pool copies %.2fs, "
                    + "mlx peak %.2f GB, mlx cache %.2f GB\n",
                model.pool.ioSeconds, model.pool.sweepWaitSeconds, model.pool.sweepSortSeconds,
                model.pool.scatterSeconds, Double(MLX.Memory.peakMemory) / 1e9,
                Double(MLX.Memory.cacheMemory) / 1e9)
            FileHandle.standardError.write(line.data(using: .utf8)!)
        }
        model.pool.resetStats()
        model.ngram.resetStats()

        // ---- decode
        var out: [Int] = []
        var generated = Set<Int>()
        var reason = "length"
        // Exactly the ids `state` has consumed, tracked rather than inferred:
        // a token is sampled before it is fed, so both break paths below leave
        // the last one unconsumed and it must not be claimed.
        var consumed = promptIds
        t0 = RuntimeClock.now()
        var firstToken: Double?
        var callbackSeconds = 0.0
        var lastTokenAt: UInt64?
        var interTokenSeconds: [Double] = []
        let observedToken: (Int) -> Bool = { tok in
            if firstToken == nil { firstToken = RuntimeClock.seconds(since: requestStart) }
            if let previous = lastTokenAt { interTokenSeconds.append(RuntimeClock.seconds(since: previous)) }
            lastTokenAt = RuntimeClock.now()
            let start = RuntimeClock.now()
            let result = onToken?(tok) ?? true
            callbackSeconds += RuntimeClock.seconds(since: start)
            return result
        }
        do {
        if let head = mtpHead, speculationEnabled, let mtpState = state.mtp {
            try speculativeDecode(
                head: head, mtpState: mtpState, state: state, logits: logits,
                params: params, eosIds: eosIds, shouldContinue: shouldContinue,
                onToken: observedToken, out: &out, generated: &generated,
                reason: &reason, consumed: &consumed, stats: &stats)
        } else {
            state.invalidateMTP()
            for _ in 0 ..< max(0, params.maxTokens) {
                if let keepGoing = shouldContinue, !keepGoing() { reason = "stop"; break }
                let sampleStart = RuntimeClock.now()
                let tok = sample(logits, params: params, generated: generated)
                stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
                if eosIds.contains(tok) { reason = "stop"; break }
                out.append(tok)
                generated.insert(tok)
                // The callback stops the run for a stop sequence or a gone client.
                if !observedToken(tok) { reason = "stop"; break }
                if model.optimizations.skipUnusedFinalForward, out.count == params.maxTokens { break }
                logits = try model.lastLogitsChecked([tok], state: state)
                stats.decodeForwardPasses += 1
                stats.decodeModelTokens += 1
                consumed.append(tok)
                eval(logits)
            }
        }
        } catch {
            discardFailedState(error)
            reason = "error"
        }
        if stats.runtimeError == nil { cache?.store(state: state, tokens: consumed, images: images) }
        stats.finishReason = reason
        stats.decodeTokens = out.count
        stats.decodeSeconds = RuntimeClock.seconds(since: t0)
        stats.firstTokenSeconds = firstToken
        stats.tokenCallbackSeconds = callbackSeconds
        stats.interTokenSeconds = interTokenSeconds
        stats.expertHitRate = model.pool.hitRate
        // The pool's counters were reset after prefill, so these cover decode
        // only.
        stats.decodeIOSeconds = model.pool.ioSeconds
        stats.decodeScatterSeconds = model.pool.scatterSeconds
        stats.decodeRecords = model.pool.recordsFetched
        stats.decodeLocalVictims = model.pool.floorLocalVictims
        stats.decodeSlotSliceBatches = model.pool.slotSliceBatches
        stats.decodeSlotSliceRuns = model.pool.slotSliceRuns
        stats.decodeSlotScatterBatches = model.pool.slotScatterBatches
        stats.decodeSlotWordBatches = model.pool.slotWordBatches
        stats.decodeSlotWordBuffers = model.pool.slotWordBuffers
        stats.decodeSlotCPUBatches = model.pool.slotCPUBatches
        stats.decodeReadBytes = model.pool.recordsFetched * model.pool.recordBytes
        stats.ngramRowHits = model.ngram.rowHits
        stats.ngramRowMisses = model.ngram.rowMisses
        stats.ngramLookaheadRows = model.ngram.lookaheadRowsConsumed
        stats.ngramLookaheadDiscarded = model.ngram.lookaheadTicketsDiscarded
        stats.ngramLookaheadWaitSeconds = model.ngram.lookaheadWaitSeconds
        stats.ngramPrefetchSeconds = model.ngram.prefetchSeconds
        stats.allocatedSequenceBytes = state.allocatedSequenceBytes
        stats.ngramCachedRows = model.ngram.cachedRowCount
        stats.cachedRouterBytes = model.cachedRouterBytes
        stats.ngramCachePayloadBytes = model.ngram.cachedPayloadBytes
        stats.mlxPeakMemoryGB = Double(MLX.Memory.peakMemory) / 1e9
        stats.peakMemoryGB = ProcessMemory.peakResidentGB
        stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
        stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
        stats.mlxActiveEndBytes = MLX.Memory.activeMemory
        stats.mlxCacheEndBytes = MLX.Memory.cacheMemory
        stats.sampledFootprint = footprint?.finish()
        stats.terminalQueryRowsSkipped = model.terminalQueryRowsSkipped - terminalQueryStart
            stats.terminalMoERowsSkipped = model.terminalMoERowsSkipped - terminalMoEStart
            stats.sharedExpertPrelaunches = model.sharedExpertPrelaunches - sharedPrelaunchStart
            stats.fusedRoPERotationsScheduled = model.fusedRoPERotationsScheduled - rotationStart
            stats.fusedGDNProjectionsScheduled = model.fusedGDNProjectionsScheduled - gdnProjectionStart
            stats.packedGDNProjectionLayers = model.resident.packedGDNProjectionLayers
            stats.packedGDNProjectionPayloadBytes = model.resident.packedGDNProjectionPayloadBytes
            stats.ropeTableHits = model.ropeTableHits - ropeHitStart
            stats.ropeTableBuilds = model.ropeTableBuilds - ropeBuildStart
            stats.residentExpertPrelaunches = model.residentExpertPrelaunches - residentPrelaunchStart
            stats.residentExpertJoins = model.residentExpertJoins - residentJoinsStart
            stats.residentExpertJoinSeconds = model.residentExpertJoinSeconds - residentJoinStart
        stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
        stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
        stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
        return finish(out)
    }
}

extension Generator {
    /// Hard cap bounds recording memory even if an embedding client assigns
    /// an arbitrary public depth. A terminal target output needs no draft.
    public static func effectiveDraftDepth(requested: Int, remainingOutputs: Int, bounded: Bool) -> Int {
        let depth = min(16, max(1, requested))
        return bounded ? min(depth, max(0, remainingOutputs - (remainingOutputs > 0 ? 1 : 0))) : depth
    }

    /// Self-speculative decode with the MTP draft head. One round:
    ///
    ///   1. draft `draftDepth` tokens greedily by chaining the head
    ///      (each step fuses the previous multi stream with the previous
    ///      token's embedding — "scheme A"),
    ///   2. verify them in one batched main-model pass, whose measured cost
    ///      grows with the number of positions,
    ///   3. sample sequentially from the verified logits with the plain
    ///      loop's exact semantics — same rng draw order, same presence
    ///      penalty evolution, drawing ONLY for tokens the plain loop would
    ///      have sampled, so the sampler stream never desyncs,
    ///   4. reconcile: the verify pass consumed all k+1 tokens; if some were
    ///      rejected, roll the state back (zero-copy checkpoint — recurrent
    ///      arrays are replaced, never mutated; KV rolls back by offset).
    ///      Recorded target states avoid replaying accepted target tokens;
    ///      only draft entries with provisional hidden inputs need rebuilding.
    ///
    /// Every emitted token's logits still come from the main model, so this
    /// changes WHAT computes the logits (batched passes instead of
    /// single-token passes), not the sampling rule. Batch shape changes move
    /// logits within the same floating-point envelope as prefill re-chunking
    /// (see MEASUREMENTS on the prefix cache); `mtp-check` gates on that.
    func speculativeDecode(
        head: MTPHead, mtpState: MTPState, state: Qwen4ExpModel.State,
        logits: MLXArray, params: SampleParams, eosIds: Set<Int>,
        shouldContinue: (() -> Bool)?, onToken: ((Int) -> Bool)?,
        out: inout [Int], generated: inout Set<Int>, reason: inout String,
        consumed: inout [Int], stats: inout GenStats
    ) throws {
        // The first token comes off the prefill logits exactly like the
        // plain loop's first iteration.
        var pending: Int? = nil
        var policy = model.optimizations.adaptiveSpeculation ? AdaptiveSpeculationPolicy(maximumDepth: draftDepth) : nil
        if params.maxTokens > 0 {
            if let keepGoing = shouldContinue, !keepGoing() { reason = "stop"; return }
            let sampleStart = RuntimeClock.now()
            let tok = sample(logits, params: params, generated: generated)
            stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
            if eosIds.contains(tok) { reason = "stop"; return }
            out.append(tok)
            generated.insert(tok)
            if let cb = onToken, !cb(tok) { reason = "stop"; return }
            pending = tok
        }

        while let p = pending, out.count < params.maxTokens {
            if let keepGoing = shouldContinue, !keepGoing() { reason = "stop"; break }
            let action = policy?.action(contextTokens: state.tokenCount)
            if action == .plain {
                stats.adaptiveDraftDepths.append(-1)
                stats.adaptiveDisabledAtOutput = out.count
                // A disabled head cannot be resumed from a stale cache. The
                // already-emitted pending token is consumed exactly once.
                state.invalidateMTP()
                var tokenToConsume = p
                while out.count < params.maxTokens {
                    if shouldContinue?() == false { reason = "stop"; break }
                    let nextLogits = try model.lastLogitsChecked([tokenToConsume], state: state)
                    consumed.append(tokenToConsume)
                    eval(nextLogits)
                    stats.decodeForwardPasses += 1; stats.decodeModelTokens += 1
                    let sampleStart = RuntimeClock.now()
                    let token = sample(nextLogits, params: params, generated: generated)
                    stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
                    if eosIds.contains(token) { reason = "stop"; break }
                    out.append(token); generated.insert(token)
                    stats.adaptivePlainTokens += 1
                    if onToken?(token) == false { reason = "stop"; break }
                    tokenToConsume = token
                }
                return
            }
            let emittedBefore = out.count, sampleBefore = stats.sampleSeconds
            let draftBefore = stats.draftSeconds, verifyBefore = stats.verifySeconds
            let reconcileBefore = stats.reconciliationSeconds
            let ck = state.checkpoint()

            // ---- draft (greedy chain; provisional MTP cache entries)
            var drafts: [Int] = []
            let draftStart = RuntimeClock.now()
            var dMulti = state.lastMulti!
            var dTok = p
            let requestedDepth: Int
            if case .draft(let depth) = action { requestedDepth = depth }
            else { requestedDepth = draftDepth }
            let availableDepth = action == .calibrate ? 0 : Self.effectiveDraftDepth(requested: requestedDepth,
                remainingOutputs: params.maxTokens - out.count,
                bounded: model.optimizations.boundedDraftTail || policy != nil)
            if policy != nil { stats.adaptiveDraftDepths.append(availableDepth) }
            var draftCancelled = false
            for _ in 0 ..< availableDepth {
                if shouldContinue?() == false { draftCancelled = true; break }
                let e = try model.resident.embedChecked([dTok], shape: [1, 1]).asType(.bfloat16)
                let (s, m) = head(embedded: e, hiddenMulti: dMulti, rope: model.rope, state: mtpState)
                let dl = model.lmHead(s)
                dTok = argMax(dl.reshaped([-1]).asType(.float32)).item(Int.self)
                drafts.append(dTok)
                dMulti = m
            }
            stats.draftedTokens += drafts.count
            stats.draftSeconds += RuntimeClock.seconds(since: draftStart)
            if draftCancelled || shouldContinue?() == false {
                try state.restoreChecked(ck); state.setRecording(false)
                reason = "stop"; break
            }

            // ---- one batched verify pass over pending + drafts, recording
            // the recurrent state after every position so a rejection can
            // roll back to the kept prefix without re-running it.
            let verifyIds = [p] + drafts
            let verifyStart = RuntimeClock.now()
            state.setRecording(true)
            let (vLogits, vMulti) = try model.allLogitsWithMultiChecked(verifyIds, state: state)
            eval(vLogits, vMulti)
            stats.verifyPasses += 1
            stats.decodeForwardPasses += 1
            stats.decodeModelTokens += verifyIds.count
            stats.verifySeconds += RuntimeClock.seconds(since: verifyStart)

            // ---- sequential acceptance
            var good = 0  // accepted drafts == generation tokens consumed beyond p
            var nextPending: Int? = nil
            for i in 0 ... drafts.count {
                if out.count >= params.maxTokens { break }  // reason stays "length"
                if shouldContinue?() == false { reason = "stop"; break }
                let sampleStart = RuntimeClock.now()
                let tok = sample(
                    vLogits[0..., i ..< (i + 1), 0...], params: params, generated: generated)
                stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
                if eosIds.contains(tok) { reason = "stop"; break }
                out.append(tok)
                generated.insert(tok)
                if let cb = onToken, !cb(tok) { reason = "stop"; break }
                if i < drafts.count && tok == drafts[i] {
                    good += 1
                    continue
                }
                nextPending = tok  // the rejection correction, or the bonus token
                break
            }
            stats.acceptedDrafts += good

            // ---- reconcile the state with what was actually kept: roll the
            // recurrent caches back to the recorded state at the last kept
            // position, trim the attention caches, and slice the pass's own
            // multi stream (causal, so its first keep.count positions are
            // exactly the kept tokens' stream). No re-run.
            let reconcileStart = RuntimeClock.now()
            let keep = [p] + Array(drafts[0 ..< good])
            try state.rollbackChecked(
                keeping: keep.count, of: verifyIds, from: ck, ngramWindow: model.cfg.ngramSize - 1)
            let passMulti = keep.count == verifyIds.count
                ? vMulti : vMulti[0..., 0 ..< keep.count, 0...]
            if model.optimizations.reuseFirstMTPEntry && !drafts.isEmpty {
                // The first draft-cache entry uses the true checkpoint multi
                // and pending token. Later entries used provisional multis.
                mtpState.trim(to: ck.mtpOffset + 1)
                let first = passMulti[0..., 0 ..< 1, 0...]
                state.lastMulti = model.optimizations.compactMTPRow ? contiguous(first) : first
                eval(state.lastMulti!)
                stats.reusedHeadTokens += 1
                if keep.count > 1 {
                    state.lastMulti = try head.consumeChecked(chunk: Array(keep.dropFirst()),
                        chunkMulti: passMulti[0..., 1 ..< keep.count, 0...], prevMulti: state.lastMulti,
                        resident: model.resident, rope: model.rope, state: mtpState,
                        compactRetainedRow: model.optimizations.compactMTPRow)
                    stats.reconciledHeadTokens += keep.count - 1
                }
            } else {
                mtpState.trim(to: ck.mtpOffset)
                state.lastMulti = try head.consumeChecked(
                    chunk: keep, chunkMulti: passMulti, prevMulti: ck.lastMulti,
                    resident: model.resident, rope: model.rope, state: mtpState,
                    compactRetainedRow: model.optimizations.compactMTPRow)
                stats.reconciledHeadTokens += keep.count
            }
            consumed.append(contentsOf: keep)
            stats.reconciliationSeconds += RuntimeClock.seconds(since: reconcileStart)
            // The draft cache holds one entry per consumed token except the
            // first. A drift here silently degrades every later draft, so
            // fail loud instead.
            precondition(
                mtpState.offset == state.tokenCount - 1,
                "mtp cache misaligned: \(mtpState.offset) entries at \(state.tokenCount) tokens")
            pending = nextPending
            if reason == "stop" { break }
            if policy != nil, out.count > emittedBefore {
                let targetCost = stats.verifySeconds - verifyBefore + stats.sampleSeconds - sampleBefore
                if action == .calibrate {
                    policy?.observePlain(seconds: adaptiveCostOverride?(targetCost, false) ?? targetCost,
                        contextTokens: state.tokenCount)
                } else if !drafts.isEmpty {
                    let totalCost = targetCost + stats.draftSeconds - draftBefore + stats.reconciliationSeconds - reconcileBefore
                    policy?.observeDraft(seconds: adaptiveCostOverride?(totalCost, true) ?? totalCost,
                        emitted: out.count - emittedBefore, drafted: drafts.count, accepted: good)
                }
            }
        }
    }
}

/// Prefill chunking. Overridable so the size can be measured and so a small
/// machine can trade prefill speed for transient memory.
public enum PrefillTuning {
    public static var chunk: Int {
        if let s = ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CHUNK"],
            let n = Int(s), n > 0
        {
            return min(n, 4096)
        }
        return 256
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/request-pin-cleanup-v168/context-independent.patch` — 740 bytes, SHA-256 `0647b01aaa6715c512959be55371bb53710516490e32fa9a94a0fd4f8c9a3f8e`.

````text
--- a/Sources/Slotstream/Generate.swift
+++ b/Sources/Slotstream/Generate.swift
@@ -458,6 +458,10 @@
             stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
             return finish([])
         }
+        // Every request returns an idle pool, including final-token and EOS
+        // paths. Checked forwards have joined readers; synchronize GPU users
+        // before releasing expert pins held by the final dispatch.
+        defer { Stream.gpu.synchronize(); model.pool.unpinAll() }
         model.prepareOptimizationKernels()
         // Vision prompts are cacheable, but not on ids alone: every image
         // expands to a run of the same placeholder id, so a second picture of

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/kernel-platform-policy-v169/Diagnostics+Runtime.swift.before` — 11375 bytes, SHA-256 `f2c1fcad37dba3c04fe0613f9aa1afd91f53a1837da9d88345f661ebd965a1ae`.

````text
// Process and cache safety invariants that are otherwise only observable
// during a 100+ GB model run. Weights-free on purpose: these are the rules a
// long run depends on, checked in milliseconds on every push.

import Foundation
import Slotstream

extension Diagnostics {
    public static func runtime() throws -> CheckReport {
        var c = CheckBuilder("runtime-check")

        if let before = ProcessMemory.vmActivity(), let after = ProcessMemory.vmActivity() {
            c.expect("request VM counters are monotonic", after.swapins >= before.swapins && after.swapouts >= before.swapouts)
            c.expect("request VM reclaimable bytes are available", before.reclaimableBytes > 0)
        } else { c.expect("request VM counters are available", false) }
        c.expect("process physical footprint is readable", ProcessMemory.residentBytes() > 0)
        c.expect("process RSS high-water is readable", ProcessMemory.peakResidentBytes() > 0)
        c.expect("lifetime RSS is separately readable", ProcessMemory.lifetimeRSSPeakBytes() > 0)
        let start = RuntimeClock.now()
        c.expect("monotonic duration is nonnegative", RuntimeClock.seconds(since: start) >= 0)
        let sampler = FootprintSampler()
        let observed = sampler.finish()
        c.expect("footprint sampler includes endpoints", observed.samples >= 2 && observed.peakBytes > 0)
        c.equal("reference optimization defaults", try InferenceOptimizations.environment([:]), InferenceOptimizations())
        c.expect("typed override enables compaction", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_COMPACT_STATE": "1"]).compactStateWindows)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPACT_STATE": "yes"])
            c.expect("malformed override refused", false)
        } catch { c.expect("malformed override refused", true) }

        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_TYPO": "1"])
            c.expect("unknown optimization refused", false)
        } catch { c.expect("unknown optimization refused", true) }

        for value in ["-1", "1", "16384", "bad"] {
            do {
                _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": value])
                c.expect("invalid read scope \(value) refused", false)
            } catch { c.expect("invalid read scope \(value) refused", true) }
        }
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": "8192"])
            c.expect("unbounded read scope refused", false)
        } catch { c.expect("unbounded read scope refused", true) }

        c.equal("explicit workspace tile is recorded", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048"]).workspaceTokenTile, 2048)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_WORKSPACE_TILE": "8192"])
            c.expect("unbounded workspace tile refused", false)
        } catch { c.expect("unbounded workspace tile refused", true) }

        c.equal("terminal output needs no speculative draft", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 1, bounded: true), 0)
        c.equal("draft count fits remaining output", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 3, bounded: true), 2)
        c.equal("public depth cannot exceed recording cap", Generator.effectiveDraftDepth(requested: Int.max, remainingOutputs: Int.max, bounded: false), 16)
        c.equal("negative remaining output cannot underflow", Generator.effectiveDraftDepth(requested: Int.min, remainingOutputs: Int.min, bounded: true), 0)

        // The prefix cache holds four conversations, not one: Open WebUI's
        // interleaved title request defeated a single slot.
        // Logical cache fixtures are never forwarded through the model, but
        // still declare exactly the number of represented token IDs.
        func fixture(_ count: Int) -> Qwen4ExpModel.State {
            let state = Qwen4ExpModel.State(); state.tokenCount = count; return state
        }
        let cache = PrefixCache(maxTokens: 100)
        for token in 1 ... PrefixCache.maxEntries {
            cache.store(state: fixture(1), tokens: [token])
        }
        c.equal(
            "prefix cache reaches its four-entry bound",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        cache.store(state: fixture(1), tokens: [PrefixCache.maxEntries])
        c.equal(
            "an identical history replaces instead of duplicating an entry",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        _ = cache.take(matching: [999], reserveTokens: 1)
        c.equal(
            "a miss evicts before allocating a fifth state",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries - 1)
        cache.configure(maxTokens: 2)
        c.expect("a smaller live token ceiling evicts immediately", cache.heldTokens <= 2)
        c.expect("held GB includes fixed recurrent state", cache.heldGB > 0.1)
        let growth = PrefixCache(maxTokens: 20)
        growth.store(state: fixture(4), tokens: [1, 2, 3, 4])
        growth.store(state: fixture(4), tokens: [7, 8, 9, 10])
        growth.store(state: fixture(4), tokens: [11, 12, 13, 14])
        c.expect("growing hit still reuses its state", growth.take(matching: [1, 2, 3, 4, 5], reserveTokens: 17) != nil)
        c.equal("growing hit reserves future state before allocation", growth.heldTokens, 0)
        growth.store(state: fixture(1), tokens: [4])
        c.expect("huge reservation safely misses", growth.take(matching: [9], reserveTokens: Int.max) == nil)
        c.equal("huge reservation releases held state", growth.heldTokens, 0)

        let capacity = PrefixCache(maxTokens: 4096)
        for token in 1 ... 4 { capacity.store(state: fixture(1), tokens: [token]) }
        c.expect("capacity reservation still hits", capacity.take(matching: [1, 2], reserveTokens: 2,
            reserveSequenceBytes: 4096 * PrefixCache.bytesPerToken) != nil)
        c.equal("capacity growth reserves bytes before reuse", capacity.heldTokens, 0)
        capacity.store(state: fixture(1), tokens: [7])
        _ = capacity.take(matching: [9], reserveSequenceBytes: Int.max)
        c.equal("saturated byte reservation evicts safely", capacity.heldTokens, 0)

        // Image keying. Every image expands to a run of the same placeholder
        // id, so ids alone cannot tell two pictures apart; the digest can, and
        // a match has to agree in both directions.
        let a = ImageHash(hashing: Data("picture A".utf8))
        let b = ImageHash(hashing: Data("picture B".utf8))
        c.expect("identical bytes hash alike", a == ImageHash(hashing: Data("picture A".utf8)))
        c.expect("different bytes do not", a != b)
        let held = [ImageSegment(start: 4, count: 8, hash: a)]
        c.expect(
            "the same image at the same offset matches",
            PrefixCache.imagesAgree(entry: held, prompt: held, upTo: 12))
        c.expect(
            "a swapped image does not",
            !PrefixCache.imagesAgree(
                entry: held, prompt: [ImageSegment(start: 4, count: 8, hash: b)], upTo: 12))
        c.expect(
            "an entry ending inside a run still matches that run",
            PrefixCache.imagesAgree(
                entry: [ImageSegment(start: 4, count: 3, hash: a)], prompt: held, upTo: 7))
        c.expect(
            "a text-only entry rejects a prompt with an image inside its range",
            !PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 12))
        c.expect(
            "an image beyond the entry's range is irrelevant to the match",
            PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 4))

        let vcache = PrefixCache(maxTokens: 100)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "a vision conversation is held, not discarded",
            vcache.take(matching: [1, 2, 3, 4], images: held, reserveTokens: 4) != nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the same ids with a different picture miss",
            vcache.take(
                matching: [1, 2, 3, 4], images: [ImageSegment(start: 4, count: 8, hash: b)],
                reserveTokens: 4) == nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the text-only splice never sees a vision entry",
            vcache.peek(extending: [1, 2]) == nil)

        // A client can re-render an assistant turn differently from the exact
        // ids the server generated (fx omits reasoning when it sends history
        // back). `peek` finds the longest retained extension for the splice,
        // but does not consume it before the ordinary cache match.
        let spliceCache = PrefixCache(maxTokens: 100)
        spliceCache.store(state: fixture(3), tokens: [7, 8, 9])
        spliceCache.store(state: fixture(4), tokens: [7, 8, 9, 10])
        c.equal(
            "prefix splice chooses the longest retained extension",
            spliceCache.peek(extending: [7, 8]), [7, 8, 9, 10])
        c.expect(
            "prefix splice is strict, not an identical-history match",
            spliceCache.peek(extending: [7, 8, 9, 10]) == nil)
        c.equal(
            "prefix splice lookup does not consume the retained state",
            spliceCache.take(matching: [7, 8, 9, 10, 11])?.reused, 4)
        spliceCache.enabled = false
        c.expect(
            "a disabled prefix cache offers no splice",
            spliceCache.peek(extending: [7]) == nil)

        // Weights behind a symlink: Foundation refuses to list the link itself,
        // so the index must resolve it first (it did not, before 0.2.1).
        let tmp = FileManager.default.temporaryDirectory
            .appendingPathComponent("slotstream-runtime-check-\(getpid())")
        let real = tmp.appendingPathComponent("real")
        let link = tmp.appendingPathComponent("link")
        try FileManager.default.createDirectory(at: real, withIntermediateDirectories: true)
        FileManager.default.createFile(
            atPath: real.appendingPathComponent("model-00001-of-00001.safetensors").path,
            contents: Data())
        try FileManager.default.createSymbolicLink(at: link, withDestinationURL: real)
        defer { try? FileManager.default.removeItem(at: tmp) }
        c.equal(
            "shard listing works through a symlinked model dir",
            (try? CheckpointIndex.shardFiles(in: link))?.count, 1)

        // The memory promise: a plan never expects to peak past its target.
        for target in [Planner.minMemoryGB, 10, 16, 30] where target >= Planner.minMemoryGB {
            let p = try Planner.plan(
                expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                ramGB: 64, workingSetGB: 64, availableGB: 64)
            c.expect(
                "\(target) GB plan stays inside its target",
                p.expectedPeakGB <= target + 0.01,
                "expected peak \(p.expectedPeakGB) GB")
            c.measure("peak_gb_at_\(Int(target))", p.expectedPeakGB)
        }
        return c.report()
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/kernel-platform-policy-v169/Optimizations.swift.before` — 11275 bytes, SHA-256 `789837f3bb9a0711ee639b23527647d09a3bb46405bb865eaad9bbec8f076add`.

````text
import Foundation

/// Independent controls retained while each candidate is qualified. Defaults
/// stay on the reference implementation until its acceptance gates pass.
public struct InferenceOptimizations: Codable, Equatable {
    public var compactStateWindows = false
    public var compactMTPRow = false
    public var skipUnusedFinalForward = false
    public var tailAwarePrefill = false
    public var demandedPrefillOutput = false
    public var terminalPrefillPruning = false
    /// Independent final-QSA output reduction; a 64-row tail retains matrix
    /// dispatch for attention/output/HC, and shorter passes keep every row.
    /// Requires terminal prefill demand.
    package static let terminalQueryTile = 64
    public var terminalLastQuery = false
    public var compactNgramRows = false
    public var incrementalIndexer = false
    public var compactIndexerRaw = false
    public var valueOnlySamplerThreshold = false
    public var deviceSamplerDraw = false
    public var disjointSweepOutput = false
    public var boundedSweepRows = false
    public var boundedIndexer = false
    public var sharedRoPE = false
    public var fusedRoPE = false
    /// Requires the optional shared-backing layout at model construction.
    public var fusedGDNProjection = false
    public var fusedGDNRecording = false
    public var boundedPLE = false
    public var ngramLookahead = false
    public var layerExpertWorkspace = false
    public var workspaceTokenTile = 256
    public var compactScopeFrontier = false
    public var workspacePiecewiseWrites = false
    /// Experimental bounded layer-major scope; zero keeps chronological passes.
    public var readScopeTokens = 0
    public var reuseFirstMTPEntry = false
    public var boundedDraftTail = false
    public var adaptiveSpeculation = false
    public var resolvedRuntimeBudget = false
    public var layerLocalFloorCache = false
    public var boundedOutputQueue = false
    public var responsiveGovernor = false
    public var routerTopK = false
    public var denseIndexerBypass = false
    public var indexerBlockTopK = false
    public var overlapSharedExpert = false
    public var overlapResidentExperts = false
    public var deduplicateImages = false
    public var visionAttentionPadding = 0
    /// Independent, bounded original-attention path. Qualification pending.
    public var visionQueryTile = 0
    public var cachedRouterWeights = false
    public var directReadHandles = false
    public var compiledNormFinish = false
    public var selectedTextAttention = false
    public var ngramRingOrder = false
    public var denseExpertLookup = false
    public var sparsePoolPins = false
    public var contiguousSlotWrites = false
    public var wordSlotWrites = false
    public var cpuSlotWrites = false
    /// Exact already-scheduled commit boundary; zero disables common-prefix retention.
    public var prefixCheckpointTokens = 0
    /// Retain the complete committed prompt and its raw last logits. This is
    /// independently qualified before joining integrationCandidate.
    public var completePromptCheckpoint = false

    public var readScopeEnabled: Bool {
        readScopeTokens > 0 && layerExpertWorkspace && compactStateWindows
            && compactMTPRow && boundedIndexer && boundedPLE
    }

    public init() {}

    /// The next joint qualification candidate. Explicit selection only; this
    /// does not change public initializer or environment defaults. Row-backed
    /// embeddings are selected independently at model construction.
    package static var integrationCandidate: Self {
        var result = Self()
        result.compactStateWindows = true
        result.compactMTPRow = true
        result.skipUnusedFinalForward = true
        result.valueOnlySamplerThreshold = true
        result.deviceSamplerDraw = true
        result.boundedOutputQueue = true
        result.responsiveGovernor = true
        result.prefixCheckpointTokens = 256
        result.completePromptCheckpoint = true
        result.sharedRoPE = true
        result.fusedRoPE = true
        return result
    }

    public static func environment(_ env: [String: String] = ProcessInfo.processInfo.environment) throws -> Self {
        var result = Self()
        var recognized = Set<String>()
        func flag(_ name: String) throws -> Bool {
            recognized.insert(name)
            guard let value = env[name] else { return false }
            guard value == "0" || value == "1" else {
                throw ModelError("\(name) must be 0 or 1")
            }
            return value == "1"
        }
        result.compactStateWindows = try flag("SLOTSTREAM_OPT_COMPACT_STATE")
        result.completePromptCheckpoint = try flag("SLOTSTREAM_OPT_COMPLETE_PROMPT")
        result.compactMTPRow = try flag("SLOTSTREAM_OPT_COMPACT_MTP")
        result.skipUnusedFinalForward = try flag("SLOTSTREAM_OPT_FINAL_FORWARD")
        result.tailAwarePrefill = try flag("SLOTSTREAM_OPT_TAIL_SCHEDULE")
        result.demandedPrefillOutput = try flag("SLOTSTREAM_OPT_OUTPUT_DEMAND")
        result.terminalPrefillPruning = try flag("SLOTSTREAM_OPT_TERMINAL_PREFILL")
        result.terminalLastQuery = try flag("SLOTSTREAM_OPT_TERMINAL_QUERY")
        guard !result.terminalLastQuery || result.terminalPrefillPruning else {
            throw ModelError("TERMINAL_QUERY requires TERMINAL_PREFILL")
        }
        result.compactNgramRows = try flag("SLOTSTREAM_OPT_NGRAM_ROWS")
        result.incrementalIndexer = try flag("SLOTSTREAM_OPT_INDEXER_BLOCKS")
        result.compactIndexerRaw = try flag("SLOTSTREAM_OPT_INDEXER_RAW")
        guard !result.compactIndexerRaw || result.incrementalIndexer else {
            throw ModelError("INDEXER_RAW requires INDEXER_BLOCKS")
        }
        result.valueOnlySamplerThreshold = try flag("SLOTSTREAM_OPT_SAMPLER_THRESHOLD")
        result.deviceSamplerDraw = try flag("SLOTSTREAM_OPT_SAMPLER_DRAW")
        result.disjointSweepOutput = try flag("SLOTSTREAM_OPT_SWEEP_PLACEMENT")
        result.boundedSweepRows = try flag("SLOTSTREAM_OPT_SWEEP_TILES")
        result.boundedIndexer = try flag("SLOTSTREAM_OPT_INDEXER_TILES")
        result.sharedRoPE = try flag("SLOTSTREAM_OPT_SHARED_ROPE")
        result.fusedRoPE = try flag("SLOTSTREAM_OPT_FUSED_ROPE")
        result.fusedGDNProjection = try flag("SLOTSTREAM_OPT_GDN_PROJECTION")
        result.fusedGDNRecording = try flag("SLOTSTREAM_OPT_GDN_RECORD")
        result.boundedPLE = try flag("SLOTSTREAM_OPT_PLE_TILES")
        result.ngramLookahead = try flag("SLOTSTREAM_OPT_NGRAM_LOOKAHEAD")
        result.layerExpertWorkspace = try flag("SLOTSTREAM_OPT_LAYER_WORKSPACE")
        result.reuseFirstMTPEntry = try flag("SLOTSTREAM_OPT_MTP_FIRST_ENTRY")
        result.boundedDraftTail = try flag("SLOTSTREAM_OPT_MTP_TAIL")
        result.adaptiveSpeculation = try flag("SLOTSTREAM_OPT_ADAPTIVE_MTP")
        result.resolvedRuntimeBudget = try flag("SLOTSTREAM_OPT_RUNTIME_BUDGET")
        result.layerLocalFloorCache = try flag("SLOTSTREAM_OPT_FLOOR_CACHE")
        result.boundedOutputQueue = try flag("SLOTSTREAM_OPT_OUTPUT_QUEUE")
        result.responsiveGovernor = try flag("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR")
        result.routerTopK = try flag("SLOTSTREAM_OPT_ROUTER_TOPK")
        result.denseIndexerBypass = try flag("SLOTSTREAM_OPT_INDEXER_DENSE")
        result.indexerBlockTopK = try flag("SLOTSTREAM_OPT_INDEXER_TOPK")
        result.overlapSharedExpert = try flag("SLOTSTREAM_OPT_SHARED_OVERLAP")
        result.overlapResidentExperts = try flag("SLOTSTREAM_OPT_RESIDENT_OVERLAP")
        result.deduplicateImages = try flag("SLOTSTREAM_OPT_IMAGE_REUSE")
        result.directReadHandles = try flag("SLOTSTREAM_OPT_READ_HANDLES")
        result.compiledNormFinish = try flag("SLOTSTREAM_OPT_COMPILED_NORM")
        result.selectedTextAttention = try flag("SLOTSTREAM_OPT_SELECTED_ATTENTION")
        result.ngramRingOrder = try flag("SLOTSTREAM_OPT_NGRAM_RING")
        result.denseExpertLookup = try flag("SLOTSTREAM_OPT_EXPERT_MAP")
        result.sparsePoolPins = try flag("SLOTSTREAM_OPT_POOL_PINS")
        result.contiguousSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_SLICES")
        result.wordSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_WORDS")
        result.cpuSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_CPU")
        guard !result.cpuSlotWrites || (!result.wordSlotWrites && !result.contiguousSlotWrites) else {
            throw ModelError("SLOT_CPU cannot be combined with SLOT_WORDS or SLOT_SLICES")
        }
        let checkpointKey = "SLOTSTREAM_OPT_PREFIX_CHECKPOINT"
        recognized.insert(checkpointKey)
        if let value = env[checkpointKey] {
            guard let n = Int(value), [0, 256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(checkpointKey) must be 0, 256, 512, 1024, 2048 or 4096")
            }
            result.prefixCheckpointTokens = n
        }
        result.cachedRouterWeights = try flag("SLOTSTREAM_OPT_ROUTER_WEIGHTS")
        let visionPaddingKey = "SLOTSTREAM_OPT_VISION_PADDING"
        recognized.insert(visionPaddingKey)
        if let value = env[visionPaddingKey] {
            guard let n = Int(value), [0, 80, 128].contains(n) else {
                throw ModelError("\(visionPaddingKey) must be 0, 80 or 128")
            }
            result.visionAttentionPadding = n
        }
        let visionTileKey = "SLOTSTREAM_OPT_VISION_QUERY_TILE"
        recognized.insert(visionTileKey)
        if let value = env[visionTileKey] {
            guard let n = Int(value), [0, 256].contains(n) else {
                throw ModelError("\(visionTileKey) must be 0 or 256")
            }
            result.visionQueryTile = n
        }
        guard result.visionQueryTile == 0 || result.visionAttentionPadding == 0 else {
            throw ModelError("VISION_QUERY_TILE and VISION_PADDING are independent candidates")
        }
        result.compactScopeFrontier = try flag("SLOTSTREAM_OPT_SCOPE_FRONTIER")
        result.workspacePiecewiseWrites = try flag("SLOTSTREAM_OPT_WORKSPACE_PIECES")
        let tileKey = "SLOTSTREAM_OPT_WORKSPACE_TILE"
        recognized.insert(tileKey)
        if let value = env[tileKey] {
            guard let n = Int(value), [256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(tileKey) must be 256, 512, 1024, 2048 or 4096")
            }
            result.workspaceTokenTile = n
        }
        let scopeKey = "SLOTSTREAM_OPT_READ_SCOPE"
        recognized.insert(scopeKey)
        if let value = env[scopeKey] {
            guard let n = Int(value), [0, 1024, 4096, 8192].contains(n) else {
                throw ModelError("\(scopeKey) must be 0, 1024, 4096 or 8192")
            }
            result.readScopeTokens = n
            guard n == 0 || result.readScopeEnabled else {
                throw ModelError("read scopes require LAYER_WORKSPACE, COMPACT_STATE, COMPACT_MTP, INDEXER_TILES and PLE_TILES")
            }
        }
        let unknown = env.keys.filter { $0.hasPrefix("SLOTSTREAM_OPT_") && !recognized.contains($0) }.sorted()
        guard unknown.isEmpty else { throw ModelError("unknown optimization controls: \(unknown.joined(separator: ", "))") }
        return result
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Tools/optimization_soak.py` — 15544 bytes, SHA-256 `d7056577de51c6a845e48d9d25c3910ac85b28c519f085d9101afd8c1a73e0c9`.

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

Artifact `/Users/carlos/Projects/slotstream/Tools/optimization_soak_test.py` — 11148 bytes, SHA-256 `b3522cba8f9621d8fe434b9b352df70ed0ac146f4563530020bdbaf5308fdcbf`.

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

Artifact `/Users/carlos/Projects/slotstream/Sources/Slotstream/Generate.swift` — 62158 bytes, SHA-256 `9c11bdb7f894b74b23d64969a698fb59497c9ccfac6ee69acaa96d2439c813db`.

````text
// Prefill + decode loop with sampling, stop tokens, and streaming callbacks.

import Foundation
import MLX

public struct SampleParams {
    public var temperature: Float = 0.7
    public var topP: Float = 0.8
    public var topK: Int = 20
    public var minP: Float = 0
    public var presencePenalty: Float = 1.5
    public var seed: UInt64? = nil
    public var maxTokens = 512
    /// Text sequences that end generation (Ollama `options.stop`, OpenAI `stop`).
    public var stop: [String] = []

    public init() {}

    /// Clamp every knob into the range the sampler is defined on.
    ///
    /// Values outside it used to produce silent garbage rather than an error:
    /// a `top_p` of 0 or a `min_p` above 1 filters out every candidate, and the
    /// old `probs / probs.sum()` then divided 0 by 0, so the sampler emitted
    /// token 0 forever. A negative `num_predict` (Ollama's "until EOS") indexed
    /// a reversed Range and trapped, killing the process.
    public func sanitized() -> SampleParams {
        var p = self
        if !p.temperature.isFinite { p.temperature = 0 }
        p.temperature = max(0, p.temperature)
        if !p.topP.isFinite || p.topP <= 0 || p.topP > 1 { p.topP = 1 }
        if !p.minP.isFinite { p.minP = 0 }
        p.minP = min(max(0, p.minP), 1)
        if !p.presencePenalty.isFinite { p.presencePenalty = 0 }
        p.topK = max(0, p.topK)
        // <= 0 means "as many as allowed" for Ollama (-1) and OpenAI clients.
        if p.maxTokens <= 0 { p.maxTokens = SampleParams.maxTokenCeiling }
        p.maxTokens = min(p.maxTokens, SampleParams.maxTokenCeiling)
        p.stop = p.stop.filter { !$0.isEmpty }
        return p
    }

    /// Upper bound on a single response. Decode is the slow axis here, so an
    /// unbounded "until EOS" request needs a ceiling that is generous but finite.
    public static let maxTokenCeiling = 32_768

    public static var instruct: SampleParams { SampleParams() }
    public static var thinking: SampleParams {
        var p = SampleParams()
        p.temperature = 1.0
        p.topP = 0.95
        p.presencePenalty = 0
        return p
    }
    public static var greedy: SampleParams {
        var p = SampleParams()
        p.temperature = 0
        p.presencePenalty = 0
        return p
    }

    /// Defaults for an agent turn that may call tools.
    ///
    /// Two departures from `instruct`, and both are about the tool grammar
    /// rather than taste:
    ///
    /// * **presence penalty 0.** The instruct default of 1.5 penalises every
    ///   token already used, and the call format is obliged to repeat itself —
    ///   `</parameter>` after every argument, then `</function>`, then
    ///   `</tool_call>`. Penalising a closing tag because an earlier argument
    ///   already used it pushes the model off the grammar exactly where it must
    ///   stay on it.
    /// * **low temperature.** A tool call is a structured artefact with one
    ///   right shape, not prose; there is nothing for sampling diversity to buy
    ///   here, and at 0.7 the same prompt answered with a call on one run and
    ///   with "I don't have any tools available" on the next.
    ///
    /// Not fully greedy: `0.2` keeps a little room to escape a repetition loop,
    /// which pure argmax has no way out of.
    public static var agent: SampleParams {
        var p = SampleParams()
        p.temperature = 0.2
        p.topP = 0.9
        p.presencePenalty = 0
        return p
    }
}

public struct GenStats: Codable {
    public var requestSeconds = 0.0
    public var queueSeconds = 0.0
    public var imageEncodeSeconds = 0.0
    /// Configured vision query bound for this image request, not a kernel count.
    public var visionQueryTile = 0
    /// Counted after each query tile has actually evaluated, across tower blocks.
    public var visionQueryTileCalls = 0
    public var encodedImages = 0
    public var reusedImageFeatures = 0
    public var prefixSkippedImages = 0
    /// From Generator entry to first sampled, non-EOS token; excludes Engine queue.
    public var firstTokenSeconds: Double?
    /// From Engine entry to first nonempty decoded callback, before that callback.
    public var firstTextSeconds: Double?
    public var tokenCallbackSeconds = 0.0
    public var sampleSeconds = 0.0
    public var prefillLocalVictims = 0
    public var decodeLocalVictims = 0
    public var prefillSlotSliceBatches = 0
    public var decodeSlotSliceBatches = 0
    public var decodeSlotSliceRuns = 0
    public var decodeSlotScatterBatches = 0
    public var prefillSlotWordBatches = 0
    public var decodeSlotWordBatches = 0
    public var decodeSlotWordBuffers = 0
    public var prefillSlotCPUBatches = 0
    public var decodeSlotCPUBatches = 0
    public var prefixCheckpointForks = 0
    public var prefixCheckpointStores = 0
    public var prefixCheckpointRefusals = 0
    public var prefixCheckpointErrors = 0
    public var completePromptHits = 0
    public var completePromptStores = 0
    public var embeddingRowsEnabled = false
    /// Unique lookup rows served/read within this request, including MTP.
    public var embeddingRowHits = 0
    public var embeddingRowMisses = 0
    public var embeddingCachedRows = 0
    public var embeddingCachedPayloadBytes = 0
    public var reconciliationSeconds = 0.0
    public var draftSeconds = 0.0
    public var verifySeconds = 0.0
    /// Actual attempted depths: zero is a useful calibration/tail target step;
    /// minus one permanently hands this request to plain decode. Bounded by
    /// the request's output ceiling, and exported with diagnostic stats only.
    public var adaptiveDraftDepths: [Int] = []
    public var adaptiveDisabledAtOutput: Int?
    public var adaptivePlainTokens = 0
    public var decodeForwardPasses = 0
    public var decodeModelTokens = 0
    /// Arrival intervals at the token callback, including earlier callback
    /// stalls. Speculative bursts can contain several very short intervals.
    public var interTokenSeconds: [Double] = []
    public var prefillPasses: [Int] = []
    public var prefillComputePasses: [Int] = []
    public var terminalQueryRowsSkipped = 0
    public var terminalMoERowsSkipped = 0
    public var abortedReadScopes = 0
    public var reconciledHeadTokens = 0
    public var reusedHeadTokens = 0
    public var lifetimeRSSPeakBytes: UInt64 = 0
    public var physicalFootprintEndBytes: UInt64 = 0
    public var sampledFootprint: FootprintSampler.Result?
    public var imagePreparation: ImagePreparationObservation?
    public var generatorVMBefore: ProcessMemory.VMActivity?
    public var generatorVMAfter: ProcessMemory.VMActivity?
    public var generatorSystemBefore: ProcessMemory.OperatingConditions?
    public var generatorSystemAfter: ProcessMemory.OperatingConditions?
    public var mlxActiveEndBytes = 0
    public var mlxCacheEndBytes = 0
    public var prefillMLXActiveBytes = 0
    public var prefillMLXCacheBytes = 0
    public var prefillPhysicalFootprintBytes: UInt64 = 0
    public var prefillGPUWaitSeconds = 0.0
    public var prefillRowSortSeconds = 0.0
    public var prefillReadBytes = 0
    public var decodeReadBytes = 0
    public var allocatedSequenceBytes = 0
    public var sharedExpertPrelaunches = 0
    public var fusedRoPERotationsScheduled = 0
    public var fusedGDNProjectionsScheduled = 0
    public var packedGDNProjectionLayers = 0
    public var packedGDNProjectionPayloadBytes = 0
    public var ropeTableHits = 0
    public var ropeTableBuilds = 0
    public var residentExpertPrelaunches = 0
    public var residentExpertJoins = 0
    /// Host wait at the explicit join; this is not a measured GPU duration.
    public var residentExpertJoinSeconds = 0.0
    public var ngramCachedRows = 0
    public var cachedRouterBytes = 0
    public var ngramCachePayloadBytes = 0
    /// Every token in the prompt, whether or not it had to be recomputed.
    /// This is what the Ollama/OpenAI surfaces report as prompt_eval_count.
    public var promptTokens = 0
    /// Prompt tokens actually pushed through the model this request. Equal to
    /// `promptTokens` on a cold prompt; `promptTokens - reusedPrefixTokens`
    /// when the conversation prefix cache matched.
    public var prefillTokens = 0
    /// Prompt tokens served from the retained state of a previous request.
    public var reusedPrefixTokens = 0
    public var prefillSeconds = 0.0
    public var decodeTokens = 0
    public var decodeSeconds = 0.0
    public var expertHitRate = 0.0
    public var ngramRowHits = 0
    public var ngramRowMisses = 0
    public var ngramLookaheadRows = 0
    public var ngramLookaheadDiscarded = 0
    public var ngramLookaheadWaitSeconds = 0.0
    public var ngramPrefetchSeconds = 0.0
    /// Speculative decode (MTP): drafts proposed, drafts accepted, and verify
    /// passes run. Zero when the draft head is disabled.
    public var draftedTokens = 0
    public var acceptedDrafts = 0
    public var verifyPasses = 0
    public var draftAcceptRate: Double {
        draftedTokens > 0 ? Double(acceptedDrafts) / Double(draftedTokens) : 0
    }
    /// Legacy observation: max(lifetime RSS, current physical footprint).
    /// It is not an upper bound on physical-footprint peaks. The separate
    /// sampledFootprint observation is required for memory qualification.
    public var peakMemoryGB = 0.0
    /// MLX-only high-water retained as a diagnostic, never as the RAM gate.
    public var mlxPeakMemoryGB = 0.0
    /// Read/scatter host intervals can overlap GPU work. Subtracting them
    /// from wall time does not measure GPU compute.
    public var prefillIOSeconds = 0.0
    public var prefillScatterSeconds = 0.0
    public var prefillRecords = 0
    /// The same split for decode. Prefill's was what showed the chunk size was
    /// the lever and read-ahead was not; decode had no equivalent, so "decode
    /// is slow" could not be attributed to the miss path, to the scatter, or
    /// to per-token dispatch without guessing. Everything not counted here is
    /// compute plus dispatch.
    public var decodeIOSeconds = 0.0
    public var decodeScatterSeconds = 0.0
    public var decodeRecords = 0
    /// "stop" (EOS, a stop sequence, or a cancelled stream) or "length".
    public var finishReason = "stop"
    /// A recoverable request failure. The failed state is never cached and
    /// serving adapters must emit an error instead of a successful completion.
    public var runtimeError: String?
    /// Pressure-to-observed-safe-boundary latency, not GPU preemption time.
    public var memoryPressureCancelled = false
    public var memoryPressureBoundarySeconds: Double?

    public var prefillTPS: Double { prefillSeconds > 0 ? Double(prefillTokens) / prefillSeconds : 0 }
    public var prefixHit: Bool { reusedPrefixTokens > 0 }
    public var decodeTPS: Double { decodeSeconds > 0 ? Double(decodeTokens) / decodeSeconds : 0 }
}

/// Token sampling, split out from the decode loop so it can be exercised on
/// synthetic logits with no checkpoint loaded (`slotstream sampler-golden`)
/// and compared against the numpy reference in `Tools/sampler_ref.py`.
///
/// Order matches HuggingFace's processor chain: presence penalty on raw
/// logits, then temperature, then top-k, then top-p, then min-p.
public struct Sampler {
    public var rngState: UInt64 = 0x9E37_79B9_7F4A_7C15
    public var valueOnlyTopK = false
    public var deviceDraw = false

    public init(seed: UInt64? = nil) {
        if let s = seed { rngState = s == 0 ? 0xDEAD_BEEF : s }
    }

    public mutating func next(
        _ logits: MLXArray, params: SampleParams, generated: Set<Int>
    ) -> Int {
        var l = logits.reshaped([-1]).asType(.float32)
        if params.presencePenalty != 0 && !generated.isEmpty {
            // subtract penalty on already-generated tokens
            let ids = MLXArray(generated.sorted().map { Int32($0) })
            let current = take(l, ids, axis: 0)
            l = putAlong(l, ids, values: current - params.presencePenalty, axis: 0)
        }
        if params.temperature <= 0 {
            return argMax(l).item(Int.self)
        }
        l = l / params.temperature
        if params.topK > 0 && params.topK < l.dim(0) {
            let kth: MLXArray
            if valueOnlyTopK {
                // Only the threshold is needed, never the sort's indices.
                // Threshold ties still survive; CDF ordering and RNG are intact.
                kth = -partitioned(-l, kth: params.topK - 1)[params.topK - 1]
            } else {
                kth = takeAlong(
                    l, argPartition(-l, kth: params.topK - 1)[..<params.topK], axis: 0
                ).min()
            }
            l = which(l .< kth, MLXArray(-Float.infinity), l)
        }
        var probs = softmax(l, axis: -1)
        if params.topP < 1 {
            let order = argSort(-probs)
            let sorted = take(probs, order, axis: 0)
            let cum = cumsum(sorted, axis: 0)
            let keepSorted = (cum - sorted) .< params.topP  // keep until cumulative prob (exclusive) reaches topP
            var keep = MLXArray.zeros([probs.dim(0)], dtype: .bool)
            keep = putAlong(keep, order, values: keepSorted, axis: 0)
            probs = which(keep, probs, MLXArray(Float(0)))
        }
        if params.minP > 0 {
            let cutoff = probs.max() * params.minP
            probs = which(probs .< cutoff, MLXArray(Float(0)), probs)
        }
        // gumbel-free categorical: inverse CDF with a splitmix stream.
        // The draw is scaled by the unnormalized total instead of normalizing
        // the probabilities: it avoids a 0/0 when a filter empties the
        // candidate set, and since u < 1 it also guarantees u*total < total,
        // so the pick can never run off the end of the CDF onto a
        // zero-probability token the way a bare `cdf .< u` could.
        rngState = Splitmix.mix(rngState &+ 1)
        let u = Float(Double(rngState >> 11) / Double(1 << 53))
        let cdf = cumsum(probs, axis: 0)
        if deviceDraw {
            let total = cdf[probs.dim(0) - 1]
            let valid = isFinite(total) .&& (total .> MLXArray(Float(0)))
            // At zero, select the first strictly positive CDF. A lower-bound
            // search otherwise chooses a leading token with zero mass.
            let before = u == 0 ? cdf .<= MLXArray(Float(0)) : cdf .< (MLXArray(u) * total)
            let pick = minimum(before.sum(), MLXArray(probs.dim(0) - 1))
            let fallback = argMax(logits.reshaped([-1]).asType(.float32)).asType(pick.dtype)
            return which(valid, pick, fallback).item(Int.self)
        }
        let total = cdf[probs.dim(0) - 1].item(Float.self)
        guard total.isFinite, total > 0 else {
            // Nothing survived filtering (or the logits were NaN): fall back to
            // the most likely token rather than emitting token 0 forever.
            return argMax(logits.reshaped([-1]).asType(.float32)).item(Int.self)
        }
        let before = u == 0 ? cdf .<= MLXArray(Float(0)) : cdf .< MLXArray(u * total)
        let pick = before.sum().item(Int.self)
        return min(pick, probs.dim(0) - 1)
    }
}

public final class Generator {
    public let model: Qwen4ExpModel
    /// Tokens per prefill pass. Bigger is faster on long prompts: a chunk
    /// activates nearly every expert of every layer, so the expert stream is
    /// re-read roughly once per chunk and halving the chunk count halves the
    /// bytes moved. It costs transient activation memory, which is why it is a
    /// knob rather than "as large as the prompt". Measured in MEASUREMENTS.md.
    public var prefillChunk = PrefillTuning.chunk {
        didSet { if let ceiling = prefillBudgetCeiling { prefillChunk = min(max(1, prefillChunk), ceiling) } }
    }
    private var prefillBudgetCeiling: Int?
    package func setPrefillBudgetCeiling(_ ceiling: Int?) {
        prefillBudgetCeiling = ceiling
        if let ceiling { prefillChunk = min(max(1, prefillChunk), ceiling) }
    }
    /// Draft tokens per speculative round when the MTP head is enabled.
    /// Depth 1 by measurement (MEASUREMENTS M9). At 122 experts/layer, the
    /// size auto enables the head at, depth 1 reads ×1.17, depth 2 ×1.13 and
    /// depth 4 ×0.88; at 57/layer ×1.13 / ×1.12 / ×0.96. A k-token verify
    /// pass costs about 1 + 0.16k single passes with every expert resident
    /// and verified recurrent states are recorded for exact rollback.
    /// SLOTSTREAM_DRAFT_DEPTH overrides for experiments.
    public var draftDepth: Int = {
        if let s = ProcessInfo.processInfo.environment["SLOTSTREAM_DRAFT_DEPTH"],
            let n = Int(s), n >= 1, n <= 16 { return n }
        return 1
    }()
    /// Gate for the speculative path — `mtp-check` compares speculative
    /// against plain decode on the same loaded model by flipping this.
    public var speculationEnabled = true
    /// Optional observer, disabled in ordinary inference. A/B its overhead.
    public var footprintSampling = false
    /// Deterministic cost injection for state-transition diagnostics only.
    /// Does not change allocations, model values or request authority.
    package var adaptiveCostOverride: ((Double, Bool) -> Double)?
    /// `SLOTSTREAM_SWEEP_TRACE=1` prints where a sweep's prefill time went.
    static let sweepTrace = ProcessInfo.processInfo.environment["SLOTSTREAM_SWEEP_TRACE"] == "1"
    /// MLX buffer-cache cap in bytes while a prompt of `SweepTuning.minTokens`
    /// or more is read, nil for no cap. The engine sets it from the memory
    /// plan: 512 MB at targets of 12 GB and under, where the sweep's varying
    /// array sizes filling the 2 GB cache cost a 7,960-token prompt 1.7 GB of
    /// peak at the 8.1 GB floor (measured 7.4 against 9.1 GB); nothing above,
    /// where the cache is cheap and the cap costs about 6% of prefill.
    /// `SLOTSTREAM_PREFILL_CACHE_MB` overrides at any target.
    public var prefillCacheLimit: Int? = nil
    /// Called after every prefill pass with (tokens read this request, tokens
    /// this request will read, seconds elapsed). `run` and `serve` hang a
    /// PrefillProgressReporter here so a five-minute prompt does not look
    /// like a hang.
    public var onPrefillProgress: ((Int, Int, Double) -> Void)?
    /// Same progress plus the absolute already-consumed prefix. The original
    /// callback remains compatible for embedding clients.
    public var onPrefillProgressAbsolute: ((Int, Int, Double, Int) -> Void)?
    var sampler = Sampler()
    var rngState: UInt64 {
        get { sampler.rngState }
        set { sampler.rngState = newValue }
    }

    public init(model: Qwen4ExpModel) {
        self.model = model
    }

    func sample(_ logits: MLXArray, params: SampleParams, generated: Set<Int>) -> Int {
        sampler.next(logits, params: params, generated: generated)
    }

    /// Runs prefill + decode; calls `onToken` for each generated token id.
    /// Returns (tokenIds, stats). `stop` checked between tokens (cancellation).
    /// `cache`, when given, is consulted for a state this prompt extends and
    /// receives the state back at the end, holding exactly the ids it consumed.
    public func generate(
        promptIds: [Int], params: SampleParams, eosIds: Set<Int>,
        cache: PrefixCache? = nil, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int) -> Bool)? = nil
    ) -> ([Int], GenStats) {
        let requestStart = RuntimeClock.now()
        let sharedPrelaunchStart = model.sharedExpertPrelaunches
        let rotationStart = model.fusedRoPERotationsScheduled
        let gdnProjectionStart = model.fusedGDNProjectionsScheduled
        let ropeHitStart = model.ropeTableHits
        let ropeBuildStart = model.ropeTableBuilds
        let residentPrelaunchStart = model.residentExpertPrelaunches
        let residentJoinsStart = model.residentExpertJoins
        let residentJoinStart = model.residentExpertJoinSeconds
        let terminalQueryStart = model.terminalQueryRowsSkipped
        let terminalMoEStart = model.terminalMoERowsSkipped
        let footprint = footprintSampling ? FootprintSampler() : nil
        let params = params.sanitized()
        sampler.valueOnlyTopK = model.optimizations.valueOnlySamplerThreshold
        sampler.deviceDraw = model.optimizations.deviceSamplerDraw
        if let s = params.seed { rngState = s == 0 ? 0xDEAD_BEEF : s }
        var stats = GenStats()
        let embeddingHitsStart = model.resident.embeddingRowHits
        let embeddingMissesStart = model.resident.embeddingRowMisses
        func finish(_ output: [Int]) -> ([Int], GenStats) {
            stats.embeddingRowsEnabled = model.resident.usesEmbeddingRows
            stats.embeddingRowHits = model.resident.embeddingRowHits - embeddingHitsStart
            stats.embeddingRowMisses = model.resident.embeddingRowMisses - embeddingMissesStart
            stats.embeddingCachedRows = model.resident.embeddingCachedRows
            stats.embeddingCachedPayloadBytes = model.resident.embeddingCachedPayloadBytes
            return (output, stats)
        }
        stats.imagePreparation = vision?.preparationObservation
        stats.visionQueryTile = vision == nil ? 0 : model.optimizations.visionQueryTile
        stats.generatorVMBefore = footprintSampling ? ProcessMemory.vmActivity() : nil
        stats.generatorSystemBefore = footprintSampling ? ProcessMemory.operatingConditions() : nil
        // An empty prompt would leave `logits` at its placeholder value and make
        // the sampler invent a first token from nothing. Callers reject this at
        // the API boundary; this is the backstop.
        guard !promptIds.isEmpty else {
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.sampledFootprint = footprint?.finish()
            stats.terminalQueryRowsSkipped = model.terminalQueryRowsSkipped - terminalQueryStart
            stats.terminalMoERowsSkipped = model.terminalMoERowsSkipped - terminalMoEStart
            stats.sharedExpertPrelaunches = model.sharedExpertPrelaunches - sharedPrelaunchStart
            stats.fusedRoPERotationsScheduled = model.fusedRoPERotationsScheduled - rotationStart
            stats.fusedGDNProjectionsScheduled = model.fusedGDNProjectionsScheduled - gdnProjectionStart
            stats.packedGDNProjectionLayers = model.resident.packedGDNProjectionLayers
            stats.packedGDNProjectionPayloadBytes = model.resident.packedGDNProjectionPayloadBytes
            stats.ropeTableHits = model.ropeTableHits - ropeHitStart
            stats.ropeTableBuilds = model.ropeTableBuilds - ropeBuildStart
            stats.residentExpertPrelaunches = model.residentExpertPrelaunches - residentPrelaunchStart
            stats.residentExpertJoins = model.residentExpertJoins - residentJoinsStart
            stats.residentExpertJoinSeconds = model.residentExpertJoinSeconds - residentJoinStart
            stats.cachedRouterBytes = model.cachedRouterBytes
            stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
            stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
            return finish([])
        }
        // Every request returns an idle pool, including final-token and EOS
        // paths. Checked forwards have joined readers; synchronize GPU users
        // before releasing expert pins held by the final dispatch.
        defer { Stream.gpu.synchronize(); model.pool.unpinAll() }
        model.prepareOptimizationKernels()
        // Vision prompts are cacheable, but not on ids alone: every image
        // expands to a run of the same placeholder id, so a second picture of
        // the same shape produces identical ids. The image segments carry a
        // digest of the bytes behind each run, and `take` requires those to
        // agree as well; a swapped image therefore misses instead of resuming
        // a state built from the wrong pixels.
        let images = vision?.cacheSegments(attentionPadding: model.optimizations.visionAttentionPadding,
            queryTile: model.optimizations.visionQueryTile) ?? []
        // A hit hands over the state and the count of prompt tokens it already
        // consumed; a miss evicts enough LRU state before this allocation to
        // keep retained + active state inside the shared bounds (PrefixCache).
        let checkpointHitsBefore = cache?.checkpointHits ?? 0
        let completeKey = model.optimizations.completePromptCheckpoint
            ? PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                prefillChunk: prefillChunk, mtp: speculationEnabled && model.mtpHead != nil) : nil
        let hit = cache?.takeForGeneration(
            matching: promptIds, images: images,
            reserveTokens: promptIds.count + params.maxTokens,
            reserveSequenceBytes: model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
                mtp: speculationEnabled && model.mtpHead != nil), completePromptKey: completeKey,
            modelIdentity: model.promptCheckpointIdentity)
        let state = hit?.state ?? model.makeState()
        let reused = hit?.reused ?? 0
        stats.promptTokens = promptIds.count
        stats.reusedPrefixTokens = reused
        stats.prefixCheckpointForks = (cache?.checkpointHits ?? 0) - checkpointHitsBefore
        stats.completePromptHits = hit?.logits == nil ? 0 : 1
        MLX.Memory.peakMemory = 0
        // Zero before prefill, not only after: otherwise these carry the
        // previous request's decode phase into this request's prefill split.
        model.pool.resetStats()
        model.ngram.resetStats()
        model.ngram.resetObservation()

        // ---- prefill in chunks (only the tokens the state has not consumed)
        // With the MTP draft head enabled, every chunk also flows through the
        // head so its attention cache covers the whole prompt: the entry for
        // token i fuses the previous position's multi stream with token i's
        // embedding, keeping the invariant mtp.offset == tokenCount - 1.
        // A state handed back by the cache that a plain-path request built
        // has no draft cache to extend; finish that request plain rather than
        // speculating over a misaligned head (unreachable in serve, where the
        // mode is fixed per process; the A/B tools flip it per request).
        // Vision prompts speculate too now: the head's prefill consumption
        // splices the tower's rows at the placeholder positions (MTPHead's
        // `spliceVisionEmbeds`), so its cache is built on the embeddings the
        // main model actually saw. A state produced by a plain vision request
        // still runs plain, since its head cache would claim positions the
        // main state no longer matches.
        let stateKnowsMTP = hit == nil || state.hasValidMTP
        let mtpHead = speculationEnabled && stateKnowsMTP ? model.mtpHead : nil
        if mtpHead != nil && state.mtp == nil { state.mtp = MTPState() }
        if mtpHead == nil { state.invalidateMTP() }
        // Vision: the tower runs here and not at tokenize time, so an image the
        // reused prefix already covers costs nothing at all. What comes back is
        // one run per image still needing a splice, at absolute prompt offsets,
        // which each chunk clips to its own window. The offsets come from the
        // segments rather than from a scan for placeholder ids, so the reused
        // head is skipped for free.
        // A sweep allocates arrays whose sizes vary from group to group, and
        // MLX's buffer cache keeps every freed size up to its limit, so by the
        // end of a long prompt the cache alone held its whole 2 GB (measured
        // 2.16 GB) on top of the pass. Where memory is tight the engine caps
        // it while the prompt is read (`prefillCacheLimit`); decode's small,
        // uniform working set gets the full cache back.
        let savedCacheLimit = MLX.Memory.cacheLimit
        defer { MLX.Memory.cacheLimit = savedCacheLimit }
        if let cap = prefillCacheLimit, promptIds.count - reused >= SweepTuning.minTokens {
            MLX.Memory.cacheLimit = min(savedCacheLimit, cap)
        }
        let imageStart = RuntimeClock.now()
        let visionRuns: [VisionRun]
        do {
            visionRuns = try vision?.runsChecked(consumedTokens: reused, deduplicate: model.optimizations.deduplicateImages,
                attentionPadding: model.optimizations.visionAttentionPadding,
                queryTile: model.optimizations.visionQueryTile) ?? []
        } catch {
            model.pool.unpinAll()
            model.pool.admitOnSweep = false
            stats.runtimeError = "image preprocessing failed: \(error)"
            stats.visionQueryTileCalls = vision?.executedQueryTiles ?? 0
            stats.finishReason = "error"
            stats.imageEncodeSeconds = RuntimeClock.seconds(since: imageStart)
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            stats.sampledFootprint = footprint?.finish()
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.peakMemoryGB = ProcessMemory.peakResidentGB
            stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
            stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
            return finish([])
        }
        // The tower evaluates each transformer block, but its final merger is
        // lazy. Complete it here so image time includes the whole encoder and
        // prefill time does not silently absorb the last image projection.
        if !visionRuns.isEmpty { eval(visionRuns.map(\.rows)) }
        stats.imageEncodeSeconds = RuntimeClock.seconds(since: imageStart)
        stats.encodedImages = vision?.encodedImages ?? 0
        stats.visionQueryTileCalls = vision?.executedQueryTiles ?? 0
        stats.reusedImageFeatures = vision?.reusedImageFeatures ?? 0
        stats.prefixSkippedImages = vision?.prefixSkippedImages ?? 0
        var t0 = RuntimeClock.now()
        var logits: MLXArray = hit?.logits ?? MLXArray(0)
        var i = reused
        func discardFailedState(_ error: Error) {
            // Read workers are already joined by the checked stores. Complete
            // previously queued, valid pool copies and GPU readers before
            // releasing pins. This request state is never returned to cache.
            model.pool.commitAdmissions()
            Stream.gpu.synchronize()
            model.pool.unpinAll()
            model.pool.admitOnSweep = false
            state.setRecording(false)
            state.invalidateMTP()
            stats.runtimeError = "model execution failed: \(error)"
            stats.finishReason = "error"
        }
        func progress(_ done: Int, _ elapsed: Double) {
            onPrefillProgress?(done, promptIds.count - reused, elapsed)
            onPrefillProgressAbsolute?(done, promptIds.count - reused, elapsed, reused)
        }
        if i < promptIds.count { progress(0, 0) }
        var cancelledPrefill = false
        while i < promptIds.count {
            if cancelledPrefill || shouldContinue?() == false {
                MLX.Memory.cacheLimit = savedCacheLimit
                stats.finishReason = "stop"
                stats.prefillTokens = i - reused
                stats.prefillSeconds = RuntimeClock.seconds(since: t0)
                stats.peakMemoryGB = ProcessMemory.peakResidentGB
                stats.mlxPeakMemoryGB = Double(MLX.Memory.peakMemory) / 1e9
                stats.prefillRecords = model.pool.recordsFetched
                stats.prefillLocalVictims = model.pool.floorLocalVictims
                stats.prefillReadBytes = model.pool.recordsFetched * model.pool.recordBytes
                stats.allocatedSequenceBytes = state.allocatedSequenceBytes
                stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
                stats.sampledFootprint = footprint?.finish()
                stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
                stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
                model.pool.admitOnSweep = false
                // Each completed chronological pass is a whole-stack commit.
                // Publish only that boundary; a partial image keeps its digest
                // and consumed span, never identities of future images.
                if i > 0, state.tokenCount == i {
                    let committedImages = images.compactMap { image -> ImageSegment? in
                        guard image.start < i else { return nil }
                        return ImageSegment(start: image.start, count: min(image.count, i - image.start),
                            hash: image.hash, preparationIdentity: image.preparationIdentity)
                    }
                    cache?.store(state: state, tokens: Array(promptIds.prefix(i)), images: committedImages)
                }
                stats.terminalQueryRowsSkipped = model.terminalQueryRowsSkipped - terminalQueryStart
            stats.terminalMoERowsSkipped = model.terminalMoERowsSkipped - terminalMoEStart
            stats.sharedExpertPrelaunches = model.sharedExpertPrelaunches - sharedPrelaunchStart
            stats.fusedRoPERotationsScheduled = model.fusedRoPERotationsScheduled - rotationStart
            stats.fusedGDNProjectionsScheduled = model.fusedGDNProjectionsScheduled - gdnProjectionStart
            stats.packedGDNProjectionLayers = model.resident.packedGDNProjectionLayers
            stats.packedGDNProjectionPayloadBytes = model.resident.packedGDNProjectionPayloadBytes
            stats.ropeTableHits = model.ropeTableHits - ropeHitStart
            stats.ropeTableBuilds = model.ropeTableBuilds - ropeBuildStart
            stats.residentExpertPrelaunches = model.residentExpertPrelaunches - residentPrelaunchStart
            stats.residentExpertJoins = model.residentExpertJoins - residentJoinsStart
            stats.residentExpertJoinSeconds = model.residentExpertJoinSeconds - residentJoinStart
                stats.cachedRouterBytes = model.cachedRouterBytes
                stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
                stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
                return finish([])
            }
            // Shape changes retain the measured envelope and are qualified
            // against the rechunking numerical contract, not assumed exact.
            let passes = model.optimizations.readScopeEnabled
                ? PrefillSchedule.scopePasses(remaining: promptIds.count - i, at: i,
                    maxChunk: prefillChunk, maxScope: model.optimizations.readScopeTokens,
                    tailAware: model.optimizations.tailAwarePrefill)
                : [PrefillSchedule.next(remaining: promptIds.count - i, at: i,
                    maxChunk: prefillChunk, tailAware: model.optimizations.tailAwarePrefill)]
            let hi = i + passes.reduce(0, +)
            // Only the last pass warms the pool with the prompt's hot experts
            // (sweep admission); no other pass may evict what decode was using.
            model.pool.admitOnSweep = hi == promptIds.count
            let chunk = Array(promptIds[i ..< hi])
            let chunkVision = visionRuns.compactMap { $0.clipped(to: i, hi) }
            do {
            if model.optimizations.readScopeEnabled, passes.count > 1 {
                let result = try model.consumeReadScopeChecked(chunk, passes: passes, state: state,
                    vision: chunkVision, head: mtpHead, final: hi == promptIds.count,
                    shouldContinue: shouldContinue)
                if !result.committed {
                    stats.abortedReadScopes += 1
                    cancelledPrefill = true
                    continue
                }
                if let value = result.logits { logits = value }
            } else if let head = mtpHead {
                let (mixed, multi) = try model.hiddenStatesWithMultiChecked(chunk, state: state, vision: chunkVision)
                state.lastMulti = try head.consumeChecked(
                    chunk: chunk, chunkMulti: multi, prevMulti: state.lastMulti,
                    resident: model.resident, rope: model.rope, state: state.mtp!,
                    vision: chunkVision, compactRetainedRow: model.optimizations.compactMTPRow)
                if hi == promptIds.count {
                    logits = model.lmHead(mixed[0..., (mixed.dim(1) - 1)..., 0...])
                    eval(logits)
                } else if !model.optimizations.demandedPrefillOutput {
                    eval(mixed)
                }
            } else if hi == promptIds.count {
                logits = try model.lastLogitsChecked(chunk, state: state, vision: chunkVision)
                eval(logits)
            } else if model.optimizations.demandedPrefillOutput {
                try model.consumePromptChecked(chunk, state: state, vision: chunkVision)
            } else {
                let h = try model.hiddenStatesChecked(chunk, state: state, vision: chunkVision)
                eval(h)
            }
            } catch {
                discardFailedState(error)
                if model.optimizations.readScopeEnabled, passes.count > 1 { stats.abortedReadScopes += 1 }
                stats.prefillTokens = i - reused
                stats.prefillSeconds = RuntimeClock.seconds(since: t0)
                stats.prefillIOSeconds = model.pool.ioSeconds
                stats.prefillScatterSeconds = model.pool.scatterSeconds
                stats.prefillRecords = model.pool.recordsFetched
                stats.prefillReadBytes = model.pool.recordsFetched * model.pool.recordBytes
                stats.allocatedSequenceBytes = state.allocatedSequenceBytes
                stats.mlxPeakMemoryGB = Double(MLX.Memory.peakMemory) / 1e9
                stats.peakMemoryGB = ProcessMemory.peakResidentGB
                stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
                stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
                stats.sampledFootprint = footprint?.finish()
                stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
                stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
                stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
                return finish([])
            }
            stats.prefillPasses.append(chunk.count)
            stats.prefillComputePasses.append(contentsOf: passes)
            i = hi
            if let cache, i == model.optimizations.prefixCheckpointTokens,
               reused < i, i < promptIds.count {
                // Only an existing whole-stack commit is eligible. Do not
                // split/rebatch a pass merely to manufacture this boundary.
                do {
                    let retained = try cache.storeReusableCheckpoint(state: state,
                        tokens: Array(promptIds.prefix(i)), images: images,
                        reserveTokens: promptIds.count + params.maxTokens,
                        reserveSequenceBytes: model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
                            mtp: mtpHead != nil))
                    if retained { stats.prefixCheckpointStores += 1 }
                    else { stats.prefixCheckpointRefusals += 1 }
                } catch {
                    // Optional retention must not publish an invalid state or
                    // fail an otherwise valid forward. The miss stays visible.
                    stats.prefixCheckpointErrors += 1
                }
            }
            progress(i - reused, RuntimeClock.seconds(since: t0))
        }
        if reused < promptIds.count, let cache, let completeKey {
            // Reuse the actual complete prefill boundary, without splitting
            // or replaying a pass. State alone cannot supply the first token;
            // retain its compact raw logits too, before any sampling mutation.
            do {
                // A strict-prefix hit can have been produced without a draft
                // state. That request deliberately finishes plain; stamp the
                // mode actually used, so a later MTP request rebuilds its head.
                let producedKey = PromptCheckpointKey(model: completeKey.model,
                    optimizations: completeKey.optimizations, prefillChunk: completeKey.prefillChunk,
                    mtp: mtpHead != nil)
                let retained = try cache.storeCompletePrompt(state: state, tokens: promptIds, images: images,
                    reserveTokens: promptIds.count + params.maxTokens,
                    reserveSequenceBytes: model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
                        mtp: mtpHead != nil), logits: logits, vocabularySize: model.cfg.vocabSize, key: producedKey)
                if retained { stats.completePromptStores += 1 }
                else { stats.prefixCheckpointRefusals += 1 }
            } catch { stats.prefixCheckpointErrors += 1 }
        }
        MLX.Memory.cacheLimit = savedCacheLimit
        model.pool.admitOnSweep = false
        stats.prefillTokens = promptIds.count - reused
        stats.prefillSeconds = RuntimeClock.seconds(since: t0)
        stats.prefillIOSeconds = model.pool.ioSeconds
        stats.prefillScatterSeconds = model.pool.scatterSeconds
        stats.prefillRecords = model.pool.recordsFetched
        stats.prefillLocalVictims = model.pool.floorLocalVictims
        stats.prefillSlotSliceBatches = model.pool.slotSliceBatches
        stats.prefillSlotWordBatches = model.pool.slotWordBatches
        stats.prefillSlotCPUBatches = model.pool.slotCPUBatches
        stats.prefillMLXActiveBytes = MLX.Memory.activeMemory
        stats.prefillMLXCacheBytes = MLX.Memory.cacheMemory
        stats.prefillPhysicalFootprintBytes = ProcessMemory.residentBytes()
        stats.prefillReadBytes = model.pool.recordsFetched * model.pool.recordBytes
        stats.prefillGPUWaitSeconds = model.pool.sweepWaitSeconds
        stats.prefillRowSortSeconds = model.pool.sweepSortSeconds
        if Self.sweepTrace {
            let line = String(
                format: "sweep trace: io %.2fs, gpu wait %.2fs, row sort %.2fs, pool copies %.2fs, "
                    + "mlx peak %.2f GB, mlx cache %.2f GB\n",
                model.pool.ioSeconds, model.pool.sweepWaitSeconds, model.pool.sweepSortSeconds,
                model.pool.scatterSeconds, Double(MLX.Memory.peakMemory) / 1e9,
                Double(MLX.Memory.cacheMemory) / 1e9)
            FileHandle.standardError.write(line.data(using: .utf8)!)
        }
        model.pool.resetStats()
        model.ngram.resetStats()

        // ---- decode
        var out: [Int] = []
        var generated = Set<Int>()
        var reason = "length"
        // Exactly the ids `state` has consumed, tracked rather than inferred:
        // a token is sampled before it is fed, so both break paths below leave
        // the last one unconsumed and it must not be claimed.
        var consumed = promptIds
        t0 = RuntimeClock.now()
        var firstToken: Double?
        var callbackSeconds = 0.0
        var lastTokenAt: UInt64?
        var interTokenSeconds: [Double] = []
        let observedToken: (Int) -> Bool = { tok in
            if firstToken == nil { firstToken = RuntimeClock.seconds(since: requestStart) }
            if let previous = lastTokenAt { interTokenSeconds.append(RuntimeClock.seconds(since: previous)) }
            lastTokenAt = RuntimeClock.now()
            let start = RuntimeClock.now()
            let result = onToken?(tok) ?? true
            callbackSeconds += RuntimeClock.seconds(since: start)
            return result
        }
        do {
        if let head = mtpHead, speculationEnabled, let mtpState = state.mtp {
            try speculativeDecode(
                head: head, mtpState: mtpState, state: state, logits: logits,
                params: params, eosIds: eosIds, shouldContinue: shouldContinue,
                onToken: observedToken, out: &out, generated: &generated,
                reason: &reason, consumed: &consumed, stats: &stats)
        } else {
            state.invalidateMTP()
            for _ in 0 ..< max(0, params.maxTokens) {
                if let keepGoing = shouldContinue, !keepGoing() { reason = "stop"; break }
                let sampleStart = RuntimeClock.now()
                let tok = sample(logits, params: params, generated: generated)
                stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
                if eosIds.contains(tok) { reason = "stop"; break }
                out.append(tok)
                generated.insert(tok)
                // The callback stops the run for a stop sequence or a gone client.
                if !observedToken(tok) { reason = "stop"; break }
                if model.optimizations.skipUnusedFinalForward, out.count == params.maxTokens { break }
                logits = try model.lastLogitsChecked([tok], state: state)
                stats.decodeForwardPasses += 1
                stats.decodeModelTokens += 1
                consumed.append(tok)
                eval(logits)
            }
        }
        } catch {
            discardFailedState(error)
            reason = "error"
        }
        if stats.runtimeError == nil { cache?.store(state: state, tokens: consumed, images: images) }
        stats.finishReason = reason
        stats.decodeTokens = out.count
        stats.decodeSeconds = RuntimeClock.seconds(since: t0)
        stats.firstTokenSeconds = firstToken
        stats.tokenCallbackSeconds = callbackSeconds
        stats.interTokenSeconds = interTokenSeconds
        stats.expertHitRate = model.pool.hitRate
        // The pool's counters were reset after prefill, so these cover decode
        // only.
        stats.decodeIOSeconds = model.pool.ioSeconds
        stats.decodeScatterSeconds = model.pool.scatterSeconds
        stats.decodeRecords = model.pool.recordsFetched
        stats.decodeLocalVictims = model.pool.floorLocalVictims
        stats.decodeSlotSliceBatches = model.pool.slotSliceBatches
        stats.decodeSlotSliceRuns = model.pool.slotSliceRuns
        stats.decodeSlotScatterBatches = model.pool.slotScatterBatches
        stats.decodeSlotWordBatches = model.pool.slotWordBatches
        stats.decodeSlotWordBuffers = model.pool.slotWordBuffers
        stats.decodeSlotCPUBatches = model.pool.slotCPUBatches
        stats.decodeReadBytes = model.pool.recordsFetched * model.pool.recordBytes
        stats.ngramRowHits = model.ngram.rowHits
        stats.ngramRowMisses = model.ngram.rowMisses
        stats.ngramLookaheadRows = model.ngram.lookaheadRowsConsumed
        stats.ngramLookaheadDiscarded = model.ngram.lookaheadTicketsDiscarded
        stats.ngramLookaheadWaitSeconds = model.ngram.lookaheadWaitSeconds
        stats.ngramPrefetchSeconds = model.ngram.prefetchSeconds
        stats.allocatedSequenceBytes = state.allocatedSequenceBytes
        stats.ngramCachedRows = model.ngram.cachedRowCount
        stats.cachedRouterBytes = model.cachedRouterBytes
        stats.ngramCachePayloadBytes = model.ngram.cachedPayloadBytes
        stats.mlxPeakMemoryGB = Double(MLX.Memory.peakMemory) / 1e9
        stats.peakMemoryGB = ProcessMemory.peakResidentGB
        stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
        stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
        stats.mlxActiveEndBytes = MLX.Memory.activeMemory
        stats.mlxCacheEndBytes = MLX.Memory.cacheMemory
        stats.sampledFootprint = footprint?.finish()
        stats.terminalQueryRowsSkipped = model.terminalQueryRowsSkipped - terminalQueryStart
            stats.terminalMoERowsSkipped = model.terminalMoERowsSkipped - terminalMoEStart
            stats.sharedExpertPrelaunches = model.sharedExpertPrelaunches - sharedPrelaunchStart
            stats.fusedRoPERotationsScheduled = model.fusedRoPERotationsScheduled - rotationStart
            stats.fusedGDNProjectionsScheduled = model.fusedGDNProjectionsScheduled - gdnProjectionStart
            stats.packedGDNProjectionLayers = model.resident.packedGDNProjectionLayers
            stats.packedGDNProjectionPayloadBytes = model.resident.packedGDNProjectionPayloadBytes
            stats.ropeTableHits = model.ropeTableHits - ropeHitStart
            stats.ropeTableBuilds = model.ropeTableBuilds - ropeBuildStart
            stats.residentExpertPrelaunches = model.residentExpertPrelaunches - residentPrelaunchStart
            stats.residentExpertJoins = model.residentExpertJoins - residentJoinsStart
            stats.residentExpertJoinSeconds = model.residentExpertJoinSeconds - residentJoinStart
        stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
        stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
        stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
        return finish(out)
    }
}

extension Generator {
    /// Hard cap bounds recording memory even if an embedding client assigns
    /// an arbitrary public depth. A terminal target output needs no draft.
    public static func effectiveDraftDepth(requested: Int, remainingOutputs: Int, bounded: Bool) -> Int {
        let depth = min(16, max(1, requested))
        return bounded ? min(depth, max(0, remainingOutputs - (remainingOutputs > 0 ? 1 : 0))) : depth
    }

    /// Self-speculative decode with the MTP draft head. One round:
    ///
    ///   1. draft `draftDepth` tokens greedily by chaining the head
    ///      (each step fuses the previous multi stream with the previous
    ///      token's embedding — "scheme A"),
    ///   2. verify them in one batched main-model pass, whose measured cost
    ///      grows with the number of positions,
    ///   3. sample sequentially from the verified logits with the plain
    ///      loop's exact semantics — same rng draw order, same presence
    ///      penalty evolution, drawing ONLY for tokens the plain loop would
    ///      have sampled, so the sampler stream never desyncs,
    ///   4. reconcile: the verify pass consumed all k+1 tokens; if some were
    ///      rejected, roll the state back (zero-copy checkpoint — recurrent
    ///      arrays are replaced, never mutated; KV rolls back by offset).
    ///      Recorded target states avoid replaying accepted target tokens;
    ///      only draft entries with provisional hidden inputs need rebuilding.
    ///
    /// Every emitted token's logits still come from the main model, so this
    /// changes WHAT computes the logits (batched passes instead of
    /// single-token passes), not the sampling rule. Batch shape changes move
    /// logits within the same floating-point envelope as prefill re-chunking
    /// (see MEASUREMENTS on the prefix cache); `mtp-check` gates on that.
    func speculativeDecode(
        head: MTPHead, mtpState: MTPState, state: Qwen4ExpModel.State,
        logits: MLXArray, params: SampleParams, eosIds: Set<Int>,
        shouldContinue: (() -> Bool)?, onToken: ((Int) -> Bool)?,
        out: inout [Int], generated: inout Set<Int>, reason: inout String,
        consumed: inout [Int], stats: inout GenStats
    ) throws {
        // The first token comes off the prefill logits exactly like the
        // plain loop's first iteration.
        var pending: Int? = nil
        var policy = model.optimizations.adaptiveSpeculation ? AdaptiveSpeculationPolicy(maximumDepth: draftDepth) : nil
        if params.maxTokens > 0 {
            if let keepGoing = shouldContinue, !keepGoing() { reason = "stop"; return }
            let sampleStart = RuntimeClock.now()
            let tok = sample(logits, params: params, generated: generated)
            stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
            if eosIds.contains(tok) { reason = "stop"; return }
            out.append(tok)
            generated.insert(tok)
            if let cb = onToken, !cb(tok) { reason = "stop"; return }
            pending = tok
        }

        while let p = pending, out.count < params.maxTokens {
            if let keepGoing = shouldContinue, !keepGoing() { reason = "stop"; break }
            let action = policy?.action(contextTokens: state.tokenCount)
            if action == .plain {
                stats.adaptiveDraftDepths.append(-1)
                stats.adaptiveDisabledAtOutput = out.count
                // A disabled head cannot be resumed from a stale cache. The
                // already-emitted pending token is consumed exactly once.
                state.invalidateMTP()
                var tokenToConsume = p
                while out.count < params.maxTokens {
                    if shouldContinue?() == false { reason = "stop"; break }
                    let nextLogits = try model.lastLogitsChecked([tokenToConsume], state: state)
                    consumed.append(tokenToConsume)
                    eval(nextLogits)
                    stats.decodeForwardPasses += 1; stats.decodeModelTokens += 1
                    let sampleStart = RuntimeClock.now()
                    let token = sample(nextLogits, params: params, generated: generated)
                    stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
                    if eosIds.contains(token) { reason = "stop"; break }
                    out.append(token); generated.insert(token)
                    stats.adaptivePlainTokens += 1
                    if onToken?(token) == false { reason = "stop"; break }
                    tokenToConsume = token
                }
                return
            }
            let emittedBefore = out.count, sampleBefore = stats.sampleSeconds
            let draftBefore = stats.draftSeconds, verifyBefore = stats.verifySeconds
            let reconcileBefore = stats.reconciliationSeconds
            let ck = state.checkpoint()

            // ---- draft (greedy chain; provisional MTP cache entries)
            var drafts: [Int] = []
            let draftStart = RuntimeClock.now()
            var dMulti = state.lastMulti!
            var dTok = p
            let requestedDepth: Int
            if case .draft(let depth) = action { requestedDepth = depth }
            else { requestedDepth = draftDepth }
            let availableDepth = action == .calibrate ? 0 : Self.effectiveDraftDepth(requested: requestedDepth,
                remainingOutputs: params.maxTokens - out.count,
                bounded: model.optimizations.boundedDraftTail || policy != nil)
            if policy != nil { stats.adaptiveDraftDepths.append(availableDepth) }
            var draftCancelled = false
            for _ in 0 ..< availableDepth {
                if shouldContinue?() == false { draftCancelled = true; break }
                let e = try model.resident.embedChecked([dTok], shape: [1, 1]).asType(.bfloat16)
                let (s, m) = head(embedded: e, hiddenMulti: dMulti, rope: model.rope, state: mtpState)
                let dl = model.lmHead(s)
                dTok = argMax(dl.reshaped([-1]).asType(.float32)).item(Int.self)
                drafts.append(dTok)
                dMulti = m
            }
            stats.draftedTokens += drafts.count
            stats.draftSeconds += RuntimeClock.seconds(since: draftStart)
            if draftCancelled || shouldContinue?() == false {
                try state.restoreChecked(ck); state.setRecording(false)
                reason = "stop"; break
            }

            // ---- one batched verify pass over pending + drafts, recording
            // the recurrent state after every position so a rejection can
            // roll back to the kept prefix without re-running it.
            let verifyIds = [p] + drafts
            let verifyStart = RuntimeClock.now()
            state.setRecording(true)
            let (vLogits, vMulti) = try model.allLogitsWithMultiChecked(verifyIds, state: state)
            eval(vLogits, vMulti)
            stats.verifyPasses += 1
            stats.decodeForwardPasses += 1
            stats.decodeModelTokens += verifyIds.count
            stats.verifySeconds += RuntimeClock.seconds(since: verifyStart)

            // ---- sequential acceptance
            var good = 0  // accepted drafts == generation tokens consumed beyond p
            var nextPending: Int? = nil
            for i in 0 ... drafts.count {
                if out.count >= params.maxTokens { break }  // reason stays "length"
                if shouldContinue?() == false { reason = "stop"; break }
                let sampleStart = RuntimeClock.now()
                let tok = sample(
                    vLogits[0..., i ..< (i + 1), 0...], params: params, generated: generated)
                stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
                if eosIds.contains(tok) { reason = "stop"; break }
                out.append(tok)
                generated.insert(tok)
                if let cb = onToken, !cb(tok) { reason = "stop"; break }
                if i < drafts.count && tok == drafts[i] {
                    good += 1
                    continue
                }
                nextPending = tok  // the rejection correction, or the bonus token
                break
            }
            stats.acceptedDrafts += good

            // ---- reconcile the state with what was actually kept: roll the
            // recurrent caches back to the recorded state at the last kept
            // position, trim the attention caches, and slice the pass's own
            // multi stream (causal, so its first keep.count positions are
            // exactly the kept tokens' stream). No re-run.
            let reconcileStart = RuntimeClock.now()
            let keep = [p] + Array(drafts[0 ..< good])
            try state.rollbackChecked(
                keeping: keep.count, of: verifyIds, from: ck, ngramWindow: model.cfg.ngramSize - 1)
            let passMulti = keep.count == verifyIds.count
                ? vMulti : vMulti[0..., 0 ..< keep.count, 0...]
            if model.optimizations.reuseFirstMTPEntry && !drafts.isEmpty {
                // The first draft-cache entry uses the true checkpoint multi
                // and pending token. Later entries used provisional multis.
                mtpState.trim(to: ck.mtpOffset + 1)
                let first = passMulti[0..., 0 ..< 1, 0...]
                state.lastMulti = model.optimizations.compactMTPRow ? contiguous(first) : first
                eval(state.lastMulti!)
                stats.reusedHeadTokens += 1
                if keep.count > 1 {
                    state.lastMulti = try head.consumeChecked(chunk: Array(keep.dropFirst()),
                        chunkMulti: passMulti[0..., 1 ..< keep.count, 0...], prevMulti: state.lastMulti,
                        resident: model.resident, rope: model.rope, state: mtpState,
                        compactRetainedRow: model.optimizations.compactMTPRow)
                    stats.reconciledHeadTokens += keep.count - 1
                }
            } else {
                mtpState.trim(to: ck.mtpOffset)
                state.lastMulti = try head.consumeChecked(
                    chunk: keep, chunkMulti: passMulti, prevMulti: ck.lastMulti,
                    resident: model.resident, rope: model.rope, state: mtpState,
                    compactRetainedRow: model.optimizations.compactMTPRow)
                stats.reconciledHeadTokens += keep.count
            }
            consumed.append(contentsOf: keep)
            stats.reconciliationSeconds += RuntimeClock.seconds(since: reconcileStart)
            // The draft cache holds one entry per consumed token except the
            // first. A drift here silently degrades every later draft, so
            // fail loud instead.
            precondition(
                mtpState.offset == state.tokenCount - 1,
                "mtp cache misaligned: \(mtpState.offset) entries at \(state.tokenCount) tokens")
            pending = nextPending
            if reason == "stop" { break }
            if policy != nil, out.count > emittedBefore {
                let targetCost = stats.verifySeconds - verifyBefore + stats.sampleSeconds - sampleBefore
                if action == .calibrate {
                    policy?.observePlain(seconds: adaptiveCostOverride?(targetCost, false) ?? targetCost,
                        contextTokens: state.tokenCount)
                } else if !drafts.isEmpty {
                    let totalCost = targetCost + stats.draftSeconds - draftBefore + stats.reconciliationSeconds - reconcileBefore
                    policy?.observeDraft(seconds: adaptiveCostOverride?(totalCost, true) ?? totalCost,
                        emitted: out.count - emittedBefore, drafted: drafts.count, accepted: good)
                }
            }
        }
    }
}

/// Prefill chunking. Overridable so the size can be measured and so a small
/// machine can trade prefill speed for transient memory.
public enum PrefillTuning {
    public static var chunk: Int {
        if let s = ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CHUNK"],
            let n = Int(s), n > 0
        {
            return min(n, 4096)
        }
        return 256
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/Slotstream/Optimizations.swift` — 11839 bytes, SHA-256 `31955a7a9cf6abd4c0d2e51a628bc1ce25ae194c02016105a821a7da6b933e6d`.

````text
import Foundation

/// Independent controls retained while each candidate is qualified. Defaults
/// stay on the reference implementation until its acceptance gates pass.
public struct InferenceOptimizations: Codable, Equatable {
    public var compactStateWindows = false
    public var compactMTPRow = false
    public var skipUnusedFinalForward = false
    public var tailAwarePrefill = false
    public var demandedPrefillOutput = false
    public var terminalPrefillPruning = false
    /// Independent final-QSA output reduction; a 64-row tail retains matrix
    /// dispatch for attention/output/HC, and shorter passes keep every row.
    /// Requires terminal prefill demand.
    package static let terminalQueryTile = 64
    public var terminalLastQuery = false
    public var compactNgramRows = false
    public var incrementalIndexer = false
    public var compactIndexerRaw = false
    public var valueOnlySamplerThreshold = false
    public var deviceSamplerDraw = false
    public var disjointSweepOutput = false
    public var boundedSweepRows = false
    public var boundedIndexer = false
    public var sharedRoPE = false
    public var fusedRoPE = false
    /// Requires the optional shared-backing layout at model construction.
    public var fusedGDNProjection = false
    public var fusedGDNRecording = false
    public var boundedPLE = false
    public var ngramLookahead = false
    public var layerExpertWorkspace = false
    public var workspaceTokenTile = 256
    public var compactScopeFrontier = false
    public var workspacePiecewiseWrites = false
    /// Experimental bounded layer-major scope; zero keeps chronological passes.
    public var readScopeTokens = 0
    public var reuseFirstMTPEntry = false
    public var boundedDraftTail = false
    public var adaptiveSpeculation = false
    public var resolvedRuntimeBudget = false
    public var layerLocalFloorCache = false
    public var boundedOutputQueue = false
    public var responsiveGovernor = false
    public var routerTopK = false
    public var denseIndexerBypass = false
    public var indexerBlockTopK = false
    public var overlapSharedExpert = false
    public var overlapResidentExperts = false
    public var deduplicateImages = false
    public var visionAttentionPadding = 0
    /// Independent, bounded original-attention path. Qualification pending.
    public var visionQueryTile = 0
    public var cachedRouterWeights = false
    public var directReadHandles = false
    public var compiledNormFinish = false
    public var selectedTextAttention = false
    public var ngramRingOrder = false
    public var denseExpertLookup = false
    public var sparsePoolPins = false
    public var contiguousSlotWrites = false
    public var wordSlotWrites = false
    public var cpuSlotWrites = false
    /// Exact already-scheduled commit boundary; zero disables common-prefix retention.
    public var prefixCheckpointTokens = 0
    /// Retain the complete committed prompt and its raw last logits. This is
    /// independently qualified before joining integrationCandidate.
    public var completePromptCheckpoint = false

    public var readScopeEnabled: Bool {
        readScopeTokens > 0 && layerExpertWorkspace && compactStateWindows
            && compactMTPRow && boundedIndexer && boundedPLE
    }

    public init() {}

    /// The next joint qualification candidate. Explicit selection only; this
    /// does not change public initializer or environment defaults. Row-backed
    /// embeddings are selected independently at model construction.
    package static var integrationCandidate: Self {
        var result = Self()
        result.compactStateWindows = true
        result.compactMTPRow = true
        result.skipUnusedFinalForward = true
        result.valueOnlySamplerThreshold = true
        result.deviceSamplerDraw = true
        result.boundedOutputQueue = true
        result.responsiveGovernor = true
        result.prefixCheckpointTokens = 256
        result.completePromptCheckpoint = true
        result.sharedRoPE = true
        result.fusedRoPE = true
        return result
    }

    /// Candidate for eventual automatic selection after combined acceptance.
    /// Public/environment defaults remain unchanged until that gate passes.
    /// Explicit experimental controls and diagnostics can still qualify a new
    /// platform; the kernel's initialization and shape fallbacks also apply.
    package static func deploymentCandidate(on platform: OptimizationPlatform = .current) -> Self {
        var result = integrationCandidate
        result.fusedRoPE = result.fusedRoPE && platform.qualifiedPartialRotation
        return result
    }

    public static func environment(_ env: [String: String] = ProcessInfo.processInfo.environment) throws -> Self {
        var result = Self()
        var recognized = Set<String>()
        func flag(_ name: String) throws -> Bool {
            recognized.insert(name)
            guard let value = env[name] else { return false }
            guard value == "0" || value == "1" else {
                throw ModelError("\(name) must be 0 or 1")
            }
            return value == "1"
        }
        result.compactStateWindows = try flag("SLOTSTREAM_OPT_COMPACT_STATE")
        result.completePromptCheckpoint = try flag("SLOTSTREAM_OPT_COMPLETE_PROMPT")
        result.compactMTPRow = try flag("SLOTSTREAM_OPT_COMPACT_MTP")
        result.skipUnusedFinalForward = try flag("SLOTSTREAM_OPT_FINAL_FORWARD")
        result.tailAwarePrefill = try flag("SLOTSTREAM_OPT_TAIL_SCHEDULE")
        result.demandedPrefillOutput = try flag("SLOTSTREAM_OPT_OUTPUT_DEMAND")
        result.terminalPrefillPruning = try flag("SLOTSTREAM_OPT_TERMINAL_PREFILL")
        result.terminalLastQuery = try flag("SLOTSTREAM_OPT_TERMINAL_QUERY")
        guard !result.terminalLastQuery || result.terminalPrefillPruning else {
            throw ModelError("TERMINAL_QUERY requires TERMINAL_PREFILL")
        }
        result.compactNgramRows = try flag("SLOTSTREAM_OPT_NGRAM_ROWS")
        result.incrementalIndexer = try flag("SLOTSTREAM_OPT_INDEXER_BLOCKS")
        result.compactIndexerRaw = try flag("SLOTSTREAM_OPT_INDEXER_RAW")
        guard !result.compactIndexerRaw || result.incrementalIndexer else {
            throw ModelError("INDEXER_RAW requires INDEXER_BLOCKS")
        }
        result.valueOnlySamplerThreshold = try flag("SLOTSTREAM_OPT_SAMPLER_THRESHOLD")
        result.deviceSamplerDraw = try flag("SLOTSTREAM_OPT_SAMPLER_DRAW")
        result.disjointSweepOutput = try flag("SLOTSTREAM_OPT_SWEEP_PLACEMENT")
        result.boundedSweepRows = try flag("SLOTSTREAM_OPT_SWEEP_TILES")
        result.boundedIndexer = try flag("SLOTSTREAM_OPT_INDEXER_TILES")
        result.sharedRoPE = try flag("SLOTSTREAM_OPT_SHARED_ROPE")
        result.fusedRoPE = try flag("SLOTSTREAM_OPT_FUSED_ROPE")
        result.fusedGDNProjection = try flag("SLOTSTREAM_OPT_GDN_PROJECTION")
        result.fusedGDNRecording = try flag("SLOTSTREAM_OPT_GDN_RECORD")
        result.boundedPLE = try flag("SLOTSTREAM_OPT_PLE_TILES")
        result.ngramLookahead = try flag("SLOTSTREAM_OPT_NGRAM_LOOKAHEAD")
        result.layerExpertWorkspace = try flag("SLOTSTREAM_OPT_LAYER_WORKSPACE")
        result.reuseFirstMTPEntry = try flag("SLOTSTREAM_OPT_MTP_FIRST_ENTRY")
        result.boundedDraftTail = try flag("SLOTSTREAM_OPT_MTP_TAIL")
        result.adaptiveSpeculation = try flag("SLOTSTREAM_OPT_ADAPTIVE_MTP")
        result.resolvedRuntimeBudget = try flag("SLOTSTREAM_OPT_RUNTIME_BUDGET")
        result.layerLocalFloorCache = try flag("SLOTSTREAM_OPT_FLOOR_CACHE")
        result.boundedOutputQueue = try flag("SLOTSTREAM_OPT_OUTPUT_QUEUE")
        result.responsiveGovernor = try flag("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR")
        result.routerTopK = try flag("SLOTSTREAM_OPT_ROUTER_TOPK")
        result.denseIndexerBypass = try flag("SLOTSTREAM_OPT_INDEXER_DENSE")
        result.indexerBlockTopK = try flag("SLOTSTREAM_OPT_INDEXER_TOPK")
        result.overlapSharedExpert = try flag("SLOTSTREAM_OPT_SHARED_OVERLAP")
        result.overlapResidentExperts = try flag("SLOTSTREAM_OPT_RESIDENT_OVERLAP")
        result.deduplicateImages = try flag("SLOTSTREAM_OPT_IMAGE_REUSE")
        result.directReadHandles = try flag("SLOTSTREAM_OPT_READ_HANDLES")
        result.compiledNormFinish = try flag("SLOTSTREAM_OPT_COMPILED_NORM")
        result.selectedTextAttention = try flag("SLOTSTREAM_OPT_SELECTED_ATTENTION")
        result.ngramRingOrder = try flag("SLOTSTREAM_OPT_NGRAM_RING")
        result.denseExpertLookup = try flag("SLOTSTREAM_OPT_EXPERT_MAP")
        result.sparsePoolPins = try flag("SLOTSTREAM_OPT_POOL_PINS")
        result.contiguousSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_SLICES")
        result.wordSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_WORDS")
        result.cpuSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_CPU")
        guard !result.cpuSlotWrites || (!result.wordSlotWrites && !result.contiguousSlotWrites) else {
            throw ModelError("SLOT_CPU cannot be combined with SLOT_WORDS or SLOT_SLICES")
        }
        let checkpointKey = "SLOTSTREAM_OPT_PREFIX_CHECKPOINT"
        recognized.insert(checkpointKey)
        if let value = env[checkpointKey] {
            guard let n = Int(value), [0, 256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(checkpointKey) must be 0, 256, 512, 1024, 2048 or 4096")
            }
            result.prefixCheckpointTokens = n
        }
        result.cachedRouterWeights = try flag("SLOTSTREAM_OPT_ROUTER_WEIGHTS")
        let visionPaddingKey = "SLOTSTREAM_OPT_VISION_PADDING"
        recognized.insert(visionPaddingKey)
        if let value = env[visionPaddingKey] {
            guard let n = Int(value), [0, 80, 128].contains(n) else {
                throw ModelError("\(visionPaddingKey) must be 0, 80 or 128")
            }
            result.visionAttentionPadding = n
        }
        let visionTileKey = "SLOTSTREAM_OPT_VISION_QUERY_TILE"
        recognized.insert(visionTileKey)
        if let value = env[visionTileKey] {
            guard let n = Int(value), [0, 256].contains(n) else {
                throw ModelError("\(visionTileKey) must be 0 or 256")
            }
            result.visionQueryTile = n
        }
        guard result.visionQueryTile == 0 || result.visionAttentionPadding == 0 else {
            throw ModelError("VISION_QUERY_TILE and VISION_PADDING are independent candidates")
        }
        result.compactScopeFrontier = try flag("SLOTSTREAM_OPT_SCOPE_FRONTIER")
        result.workspacePiecewiseWrites = try flag("SLOTSTREAM_OPT_WORKSPACE_PIECES")
        let tileKey = "SLOTSTREAM_OPT_WORKSPACE_TILE"
        recognized.insert(tileKey)
        if let value = env[tileKey] {
            guard let n = Int(value), [256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(tileKey) must be 256, 512, 1024, 2048 or 4096")
            }
            result.workspaceTokenTile = n
        }
        let scopeKey = "SLOTSTREAM_OPT_READ_SCOPE"
        recognized.insert(scopeKey)
        if let value = env[scopeKey] {
            guard let n = Int(value), [0, 1024, 4096, 8192].contains(n) else {
                throw ModelError("\(scopeKey) must be 0, 1024, 4096 or 8192")
            }
            result.readScopeTokens = n
            guard n == 0 || result.readScopeEnabled else {
                throw ModelError("read scopes require LAYER_WORKSPACE, COMPACT_STATE, COMPACT_MTP, INDEXER_TILES and PLE_TILES")
            }
        }
        let unknown = env.keys.filter { $0.hasPrefix("SLOTSTREAM_OPT_") && !recognized.contains($0) }.sorted()
        guard unknown.isEmpty else { throw ModelError("unknown optimization controls: \(unknown.joined(separator: ", "))") }
        return result
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/Slotstream/OptimizationPlatform.swift` — 1813 bytes, SHA-256 `ff8ad19241a2b8326746946338a2f5ef896907d8984ea5d02abfa66c94ed8670`.

````text
import Darwin
import Foundation

/// Qualification identity for automatic activation of a new Metal kernel.
/// This is independent of simulated planner inputs and environment controls.
/// It grants neither a memory allowance nor a throughput estimate.
package struct OptimizationPlatform: Equatable {
    package let machineModel: String?
    package let chip: String?
    package let osBuild: String?
    package let nativeARM64: Bool

    /// The complete native/serving RoPE gates currently cover this machine
    /// family and OS build only. An OS update, another SoC or failed identity
    /// read keeps the existing MLX implementation as the automatic fallback.
    package var qualifiedPartialRotation: Bool {
        nativeARM64 && machineModel == "Mac17,9" && chip == "Apple M5 Pro" && osBuild == "25G83"
    }

    private static func systemString(_ name: String) -> String? {
        var count = 0
        guard sysctlbyname(name, nil, &count, nil, 0) == 0, 1 < count, count <= 256 else { return nil }
        var bytes = [UInt8](repeating: 0, count: count)
        let capacity = count
        let result = bytes.withUnsafeMutableBytes { buffer in
            sysctlbyname(name, buffer.baseAddress, &count, nil, 0)
        }
        guard result == 0, 1 < count, count <= capacity, bytes[count - 1] == 0,
              !bytes[..<(count - 1)].contains(0) else { return nil }
        return String(bytes: bytes[..<(count - 1)], encoding: .utf8)
    }

    package static let current: Self = {
        #if arch(arm64)
        let native = true
        #else
        let native = false
        #endif
        return Self(machineModel: systemString("hw.model"), chip: systemString("machdep.cpu.brand_string"),
                    osBuild: systemString("kern.osversion"), nativeARM64: native)
    }()
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift` — 17558 bytes, SHA-256 `a3cb658bbf29d1f119da68d517fba8e73db64a8ce6b698d14b5671fc25af5ccd`.

````text
import CryptoKit
import CoreGraphics
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Sequential full-model reference/candidate ownership. Only hashes, token
    /// IDs and scalar observations cross arms, never an MLX tensor or model.
    public static func optimizationIntegrated(modelDir: URL, mtp: Bool, visionQueryTile: Bool = false,
                                             ropeFusion: Bool = false, gdnProjection: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        var c = CheckBuilder("optimization-integrated\(mtp ? "-mtp" : "")\(visionQueryTile ? "-vision-query" : "")")
        struct Results {
            var state: [String: [String: String]] = [:]
            var outputs: [String: [Int]] = [:]
        }
        func hash(_ a: MLXArray) -> String {
            "\(a.dtype):\(a.shape):\(SHA256.hash(data: Data(a.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))))"
        }
        func arm(candidate: Bool, expected: Results?) throws -> Results {
            let index = try CheckpointIndex(dir: modelDir)
            let model = try Qwen4ExpModel(index: index, poolSlots: 640, embeddingRowCache: candidate,
                packGDNProjections: candidate && gdnProjection)
            if mtp { try model.enableMTP(modelDir: modelDir) }
            model.optimizations = candidate ? .integrationCandidate : InferenceOptimizations()
            model.optimizations.fusedGDNProjection = candidate && gdnProjection
            if candidate && visionQueryTile { model.optimizations.visionQueryTile = 256 }
            if candidate && ropeFusion {
                model.optimizations.sharedRoPE = true
                model.optimizations.fusedRoPE = true
            }
            let generator = Generator(model: model)
            generator.prefillChunk = 256; generator.prefillCacheLimit = 64 << 20
            generator.speculationEnabled = mtp; generator.draftDepth = 1
            var params = SampleParams.greedy; params.maxTokens = 8; params.seed = 7
            var results = Results()
            c.equal("\(candidate): embedding selection", model.resident.usesEmbeddingRows, candidate)
            for count in [-1, 1, Int.max] {
                let invalid = model.makeState(); invalid.tokenCount = count
                let before = invalid.prefixForkDiagnosticTensors().mapValues(hash)
                do {
                    _ = try model.lastLogitsChecked([17], state: invalid)
                    c.expect("\(candidate): invalid public offset rejected", false)
                } catch { c.expect("\(candidate): invalid public offset rejected", true) }
                c.equal("\(candidate): rejected offset leaves state unchanged", invalid.prefixForkDiagnosticTensors().mapValues(hash), before)
            }
            let blank = Qwen4ExpModel.State()
            let blankFields = blank.prefixForkDiagnosticTensors().mapValues(hash)
            do {
                _ = try model.lastLogitsChecked([17], state: blank)
                c.expect("\(candidate): empty public State rejected", false)
            } catch { c.expect("\(candidate): empty public State rejected", true) }
            c.equal("\(candidate): empty-state rejection is atomic", blank.prefixForkDiagnosticTensors().mapValues(hash), blankFields)
            let tower = try VisionTower(index: index)
            let png = Data(base64Encoded: "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==")!
            let image: CGImage
            if visionQueryTile {
                guard let context = CGContext(data: nil, width: 512, height: 512,
                    bitsPerComponent: 8, bytesPerRow: 2048, space: CGColorSpaceCreateDeviceRGB(),
                    bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
                    throw ModelError("cannot allocate bounded integrated image fixture")
                }
                context.setFillColor(CGColor(red: 1, green: 0, blue: 0, alpha: 1))
                context.fill(CGRect(x: 0, y: 0, width: 512, height: 512))
                guard let made = context.makeImage() else { throw ModelError("cannot materialize integrated image fixture") }
                image = made
            } else { image = try VisionPreprocess.decodeCGImage(png) }
            let imagePlan = try tower.plan(for: image)
            func vision(_ start: Int?) -> VisionPrompt? {
                guard let start else { return nil }
                return VisionPrompt(tower: tower, items: [.init(image: image, plan: imagePlan)],
                    segments: [.init(start: start, count: imagePlan.mergedTokens,
                        hash: ImageHash(hashing: visionQueryTile ? Data("solid-red-512x512-CGContext-v1".utf8) : png))],
                    hiddenSize: model.cfg.hiddenSize)
            }
            let cases: [(String, Int, Int?)] = [
                ("cached17", 17, nil), ("boundary255", 255, nil), ("boundary256", 256, nil),
                ("boundary257", 257, nil), ("long1025", 1025, nil),
                ("image-before", 273, 1),
                ("image-crossing", 273 + imagePlan.mergedTokens, 256 - imagePlan.mergedTokens / 2)
            ]
            for (label, count, start) in cases {
                FileHandle.standardError.write(Data("integrated \(candidate ? "candidate" : "reference") / \(label)\n".utf8))
                var ids = (0..<count).map { 1000 + ($0 * 79) % 190_000 }
                if let start {
                    ids.replaceSubrange(start..<start+imagePlan.mergedTokens,
                        with: repeatElement(model.cfg.imageTokenId, count: imagePlan.mergedTokens))
                }
                let cache = PrefixCache(maxTokens: 8192)
                var keepGoing = true
                generator.onPrefillProgress = { done, total, _ in
                    if done == total && done > 0 { keepGoing = false }
                }
                let vp = vision(start)
                let prefill = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    vision: vp, shouldContinue: { keepGoing })
                c.equal("\(candidate)/\(label): cancelled prefill releases request pins", model.pool.pinnedSlotCount, 0)
                generator.onPrefillProgress = nil
                c.expect("\(candidate)/\(label): cancellation commits complete prefill", prefill.0.isEmpty && prefill.1.runtimeError == nil && prefill.1.prefillTokens == count)
                guard let taken = cache.take(matching: ids + [17], images: vp?.cacheSegments(
                    attentionPadding: model.optimizations.visionAttentionPadding,
                    queryTile: model.optimizations.visionQueryTile) ?? []) else {
                    throw ModelError("integrated prefill lost its complete committed state")
                }
                c.equal("\(candidate)/\(label): exact committed offset", taken.state.tokenCount, count)
                if mtp { c.expect("\(candidate)/\(label): head is aligned", taken.state.hasValidMTP) }
                var fields = taken.state.prefixForkDiagnosticTensors().mapValues(hash)
                taken.state.invalidateMTP()
                fields["continuedLogits"] = hash(try model.lastLogitsChecked([17], state: taken.state))
                results.state[label] = fields
                if let wanted = expected?.state[label] { c.equal("\(label): all state bytes and continued logits exact", fields, wanted) }
                let full = generator.generate(promptIds: ids, params: params, eosIds: [], vision: vision(start))
                c.equal("\(candidate)/\(label): completed request releases pins", model.pool.pinnedSlotCount, 0)
                if visionQueryTile {
                    c.equal("\(candidate)/\(label): explicit vision query bound", full.1.visionQueryTile,
                        candidate && start != nil ? 256 : 0)
                    c.equal("\(candidate)/\(label): executed vision tile count", full.1.visionQueryTileCalls,
                        candidate && start != nil ? tower.vcfg.depth * ((imagePlan.patches + 255) / 256) : 0)
                }
                c.expect("\(candidate)/\(label): full completion succeeds", full.1.runtimeError == nil && full.0.count == params.maxTokens)
                if mtp { c.expect("\(candidate)/\(label): verification executes", full.1.verifyPasses > 0) }
                else { c.equal("\(candidate)/\(label): final forward work is explicit", full.1.decodeModelTokens, params.maxTokens - (candidate ? 1 : 0)) }
                c.expect("\(candidate)/\(label): embeddings remain bounded", full.1.embeddingCachedPayloadBytes <= 11_796_480)
                results.outputs[label] = full.0
                if let wanted = expected?.outputs[label] { c.equal("\(label): exact complete greedy IDs", full.0, wanted) }
            }

            let prompt = (0..<273).map { 1000 + ($0 * 79) % 190_000 }
            for filtered in [false, true] {
                var sample = params
                sample.temperature = 0.7; sample.topK = filtered ? 40 : 0
                sample.topP = filtered ? 0.8 : 1; sample.minP = filtered ? 0.05 : 0
                sample.presencePenalty = filtered ? 1.1 : 0
                for seed: UInt64 in [7, 7_046_029_254_386_353_130] {
                    sample.seed = seed
                    let label = "sample/\(filtered)/\(seed)"
                    let first = generator.generate(promptIds: Array(prompt.prefix(17)), params: sample, eosIds: [])
                    let repeatRun = generator.generate(promptIds: Array(prompt.prefix(17)), params: sample, eosIds: [])
                    c.equal("\(candidate)/\(label): sampled requests return an idle pool", model.pool.pinnedSlotCount, 0)
                    c.expect("\(candidate)/\(label): sampled output completes", first.1.runtimeError == nil && first.0.count == sample.maxTokens)
                    c.equal("\(candidate)/\(label): seeded replay exact", repeatRun.0, first.0)
                    results.outputs[label] = first.0
                    if let wanted = expected?.outputs[label] { c.equal("\(label): integrated sampled IDs match reference", first.0, wanted) }
                }
            }
            let retained = PrefixCache(maxTokens: 8192)
            let first = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: retained)
            c.expect("\(candidate): first retained request succeeds", first.1.runtimeError == nil)
            let casesOfReuse: [(String, [Int])] = [
                ("same", prompt),
                ("auxiliary", Array(prompt.prefix(17)) + [23]),
                ("divergent", Array(prompt.prefix(256)) + Array(repeating: 907, count: 259)),
                ("same-after-auxiliary", prompt),
                ("edited", [999] + Array(prompt.dropFirst()))
            ]
            for (label, ids) in casesOfReuse {
                let outcome = generator.generate(promptIds: ids, params: params, eosIds: [], cache: retained)
                c.equal("\(candidate)/\(label): cache reuse releases request pins", model.pool.pinnedSlotCount, 0)
                c.expect("\(candidate)/\(label): reusable-cache request succeeds", outcome.1.runtimeError == nil && outcome.0.count == params.maxTokens)
                if label == "same" {
                    c.equal("\(candidate): complete checkpoint is exercised", outcome.1.reusedPrefixTokens, candidate ? prompt.count : 0)
                    c.equal("\(candidate): complete hit is observed", outcome.1.completePromptHits, candidate ? 1 : 0)
                    c.equal("\(candidate): complete hit eliminates prefill", outcome.1.prefillTokens, candidate ? 0 : prompt.count)
                    c.equal("\(candidate): same prompt repeats exactly", outcome.0, first.0)
                }
                if label == "edited" { c.equal("\(candidate): edited prefix refuses prior state", outcome.1.reusedPrefixTokens, 0) }
                c.equal("\(candidate)/\(label): no invalid checkpoint published", outcome.1.prefixCheckpointErrors, 0)
                let key = "reuse/\(label)"; results.outputs[key] = outcome.0
                if let wanted = expected?.outputs[key] { c.equal("\(label): interleaved output matches independent reference", outcome.0, wanted) }
            }
            // A shorter committed checkpoint must still help when the entire
            // input differs. Exercise this independently of identical retries
            // and retain the same four physical-state budget.
            let editedTail = Array(prompt.prefix(256)) + Array(repeating: 907, count: 17)
            let partial = PrefixCache(maxTokens: 8192)
            _ = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: partial)
            let tailResult = generator.generate(promptIds: editedTail, params: params, eosIds: [], cache: partial)
            c.expect("\(candidate): partial fallback succeeds", tailResult.1.runtimeError == nil)
            c.equal("\(candidate): edited tail uses the shorter checkpoint", tailResult.1.reusedPrefixTokens, candidate ? 256 : 0)
            c.equal("\(candidate): partial fallback is not a complete hit", tailResult.1.completePromptHits, 0)
            c.expect("\(candidate): combined retention respects physical-state count",
                (partial.json()["conversations"] as? Int ?? Int.max) <= PrefixCache.maxEntries)
            results.outputs["partial-fallback"] = tailResult.0
            if let wanted = expected?.outputs["partial-fallback"] {
                c.equal("partial fallback output matches independent reference", tailResult.0, wanted)
            }
            var delivered: [Int] = []
            let cancelled = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: retained,
                onToken: { id in delivered.append(id); return delivered.count < 2 })
            c.equal("\(candidate): callback cancellation releases request pins", model.pool.pinnedSlotCount, 0)
            c.equal("\(candidate): callback cancellation has no hidden output", cancelled.0, delivered)
            c.equal("\(candidate): callback stops at two emissions", delivered.count, 2)
            c.equal("\(candidate): cancellation preserves exact output prefix", delivered, Array(first.0.prefix(2)))
            c.expect("\(candidate): client cancellation is not a model error", cancelled.1.runtimeError == nil)
            let retry = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: retained)
            c.equal("\(candidate): retry returns an idle pool", model.pool.pinnedSlotCount, 0)
            c.equal("\(candidate): retry after cancellation is exact", retry.0, first.0)
            c.expect("\(candidate): prefix capacity stays bounded", retained.heldTokens <= 8192)
            // Exercise exits that can follow a fresh pinned dispatch without
            // another forward to clear the pins. Derive EOS from this same
            // arithmetic path, so this gate does not assume a vocabulary ID.
            var one = params; one.maxTokens = 1
            let short = Array(prompt.prefix(17))
            let single = generator.generate(promptIds: short, params: one, eosIds: [])
            c.equal("\(candidate): one-token request releases pins", model.pool.pinnedSlotCount, 0)
            c.equal("\(candidate): one-token request emits exactly one token", single.0.count, 1)
            if let eos = single.0.first {
                let stopped = generator.generate(promptIds: short, params: params, eosIds: [eos])
                c.expect("\(candidate): immediate EOS succeeds without emitted output",
                    stopped.1.runtimeError == nil && stopped.0.isEmpty && stopped.1.finishReason == "stop")
                c.equal("\(candidate): immediate EOS releases pins", model.pool.pinnedSlotCount, 0)
            }
            if ropeFusion || InferenceOptimizations.integrationCandidate.fusedRoPE {
                c.equal("\(candidate): fused RoPE evaluated paths", model.fusedRoPERotationsScheduled > 0, candidate)
                c.equal("\(candidate): shared RoPE evaluated paths", model.ropeTableHits > 0, candidate)
                c.measure("\(candidate).fused_rotations_scheduled", Double(model.fusedRoPERotationsScheduled))
            }
            if gdnProjection {
                let state = model.makeState(), before = model.fusedGDNProjectionsScheduled
                let logits = model.lastLogits([907], state: state); eval(logits)
                var snapshot = state.diagnosticTensors().mapValues(hash)
                snapshot["logits"] = hash(logits)
                results.state["gdn-single"] = snapshot
                if let wanted = expected?.state["gdn-single"] {
                    c.equal("integrated one-token projection state and logits", snapshot, wanted)
                }
                let layers = model.cfg.layerTypes.filter { $0 == "linear_attention" }.count
                c.equal("\(candidate): one-token projection mechanism", model.fusedGDNProjectionsScheduled - before,
                    candidate ? layers : 0)
                c.equal("\(candidate): packed projection layers", model.resident.packedGDNProjectionLayers,
                    candidate ? layers : 0)
            }
            return results
        }
        let reference = try arm(candidate: false, expected: nil)
        MLX.Memory.clearCache()
        _ = try arm(candidate: true, expected: reference)
        return c.report()
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift` — 10338 bytes, SHA-256 `d12a1d66c39d62cc773ba81ce1bf8ba88b82b096ad2f060398a39acfcf65b63c`.

````text
import Darwin
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Real HTTP parser/handlers and real model, over bounded socket pairs.
    /// This covers response framing, not TCP admission or network timing.
    public static func optimizationReadFailureServing(modelDir: URL) async throws -> CheckReport {
        let engine = try await Engine(modelDir: modelDir,poolSlots: 640)
        engine.generator.speculationEnabled = false
        engine.generator.prefillChunk = 256
        engine.generator.prefillCacheLimit = 64 << 20
        let server = Server(engine: engine,port: 0)
        signal(SIGPIPE,SIG_IGN)
        var c = CheckBuilder("optimization-read-failure-serving")

        func exchange(_ path: String,_ object: [String:Any]?) throws -> (head: String,body: String) {
            let payload = try object.map { try JSONSerialization.data(withJSONObject: $0) } ?? Data()
            var fds: [Int32] = [-1,-1]
            guard socketpair(AF_UNIX,SOCK_STREAM,0,&fds)==0 else { throw ModelError("socketpair failed") }
            let client = fds[0], peer = fds[1]
            var timeout = timeval(tv_sec: 30,tv_usec: 0), one: Int32 = 1
            for fd in fds {
                setsockopt(fd,SOL_SOCKET,SO_RCVTIMEO,&timeout,socklen_t(MemoryLayout<timeval>.size))
                setsockopt(fd,SOL_SOCKET,SO_SNDTIMEO,&timeout,socklen_t(MemoryLayout<timeval>.size))
                setsockopt(fd,SOL_SOCKET,SO_NOSIGPIPE,&one,socklen_t(MemoryLayout<Int32>.size))
            }
            let finished = DispatchSemaphore(value: 0)
            Thread.detachNewThread { server.handle(peer); finished.signal() }
            defer { shutdown(client,SHUT_RDWR); close(client) }
            let method = object == nil ? "GET" : "POST"
            let head = "\(method) \(path) HTTP/1.1\r\nHost: localhost\r\nContent-Type: application/json\r\nContent-Length: \(payload.count)\r\nConnection: close\r\n\r\n"
            let request = Data(head.utf8)+payload
            var wire = Data()
            do {
                try request.withUnsafeBytes { buffer in
                    var sent = 0
                    while sent < buffer.count {
                        let n = Darwin.send(client,buffer.baseAddress!+sent,buffer.count-sent,0)
                        if n<0 && errno==EINTR { continue }
                        guard n>0 else { throw ModelError("request write failed") }
                        sent += n
                    }
                }
                var buffer = [UInt8](repeating: 0,count: 8192)
                while true {
                    let n = recv(client,&buffer,buffer.count,0)
                    if n<0 && errno==EINTR { continue }
                    guard n>=0 else { throw ModelError("response read failed or timed out") }
                    if n==0 { break }
                    wire.append(contentsOf: buffer.prefix(n))
                    guard wire.count <= 1<<20 else { throw ModelError("response exceeds diagnostic bound") }
                }
            } catch {
                shutdown(client,SHUT_RDWR)
                guard finished.wait(timeout: .now()+30) == .success else { throw ModelError("handler did not finish after disconnect") }
                throw error
            }
            guard finished.wait(timeout: .now()+30) == .success else { throw ModelError("handler did not finish") }
            guard let separator = wire.range(of: Data("\r\n\r\n".utf8)) else { throw ModelError("missing HTTP head") }
            let responseHead = String(decoding: wire[..<separator.lowerBound],as: UTF8.self)
            let raw = Data(wire[separator.upperBound...])
            if !responseHead.lowercased().contains("transfer-encoding: chunked") {
                return (responseHead,String(decoding: raw,as: UTF8.self))
            }
            var body = Data(), cursor = 0
            while cursor<raw.count {
                guard let end = raw[cursor...].range(of: Data("\r\n".utf8)),
                    let n = Int(String(decoding: raw[cursor..<end.lowerBound],as: UTF8.self),radix: 16)
                else { throw ModelError("malformed chunk length") }
                cursor = end.upperBound
                guard n>=0,n<=raw.count-cursor,raw.count-cursor-n>=2,
                    raw[cursor+n]==13,raw[cursor+n+1]==10 else { throw ModelError("incomplete HTTP chunk") }
                if n==0 {
                    guard cursor+2==raw.count else { throw ModelError("unexpected trailing HTTP bytes") }
                    return (responseHead,String(decoding: body,as: UTF8.self))
                }
                body.append(raw[cursor..<cursor+n]); cursor += n+2
            }
            throw ModelError("missing terminating HTTP chunk")
        }
        let text = "Print exactly: one two three four five six seven eight."
        let variants: [(String,String,Bool,[String:Any])] = [
            ("generate JSON","/api/generate",false,["model":engine.modelName,"prompt":text,"raw":true,"stream":false,"options":["num_predict":8,"temperature":0,"seed":7]]),
            ("generate NDJSON","/api/generate",true,["model":engine.modelName,"prompt":text,"raw":true,"stream":true,"options":["num_predict":8,"temperature":0,"seed":7]]),
            ("chat JSON","/api/chat",false,["model":engine.modelName,"messages":[["role":"user","content":text]],"think":false,"stream":false,"options":["num_predict":8,"temperature":0,"seed":7]]),
            ("chat NDJSON","/api/chat",true,["model":engine.modelName,"messages":[["role":"user","content":text]],"think":false,"stream":true,"options":["num_predict":8,"temperature":0,"seed":7]]),
            ("OpenAI JSON","/v1/chat/completions",false,["model":engine.modelName,"messages":[["role":"user","content":text]],"stream":false,"max_tokens":8,"temperature":0,"seed":7]),
            ("OpenAI SSE","/v1/chat/completions",true,["model":engine.modelName,"messages":[["role":"user","content":text]],"stream":true,"max_tokens":8,"temperature":0,"seed":7]),
            ("Gateway SSE","/v3/ai/language-model",true,["prompt":[["role":"user","content":[["type":"text","text":text]]]],"toolChoice":["type":"auto"],"maxOutputTokens":8,"temperature":0,"seed":7]),
        ]
        for queued in [false,true] {
            engine.model.optimizations.boundedOutputQueue = queued
            for (name,path,stream,body) in variants {
                let label = "\(name), queued=\(queued)"
                engine.prefixCache.enabled = false; engine.prefixCache.enabled = true
                let fault = ReadFault(afterJobs: 0)
                var passes = 0
                // Fail the main decode pass after prefill emitted a token.
                // No test-only network endpoint or environment bypass exists.
                engine.model.routerObserver = { layer,_ in
                    if layer==0 {
                        passes += 1
                        if passes==2 { engine.model.pool.readFault = fault }
                    }
                }
                let response = try exchange(path,body)
                engine.model.routerObserver = nil; engine.model.pool.readFault = nil
                c.expect("\(label): real read fault fired",fault.hasFired)
                c.expect("\(label): correct HTTP status",response.head.hasPrefix(stream ? "HTTP/1.1 200" : "HTTP/1.1 500"),response.head)
                let lines = stream ? response.body.split(separator: "\n").map(String.init) : [response.body]
                let objects = try lines.compactMap { line -> [String:Any]? in
                    var value = line.trimmingCharacters(in: .whitespacesAndNewlines)
                    if value.hasPrefix("data:") { value = String(value.dropFirst(5)).trimmingCharacters(in: .whitespaces) }
                    if value.isEmpty || value=="[DONE]" { return nil }
                    return try JSONSerialization.jsonObject(with: Data(value.utf8)) as? [String:Any]
                }
                c.expect("\(label): explicit inference error frame",objects.contains { $0["error"] != nil || $0["type"] as? String == "error" },response.body)
                c.expect("\(label): no false successful completion",!objects.contains { object in
                    if object["done"] as? Bool == true || object["type"] as? String == "finish" { return true }
                    let choices = object["choices"] as? [[String:Any]] ?? []
                    return choices.contains { $0["finish_reason"] != nil && !($0["finish_reason"] is NSNull) }
                })
                if stream {
                    let emitted = objects.contains { object in
                        let message = object["message"] as? [String:Any] ?? [:]
                        let choices = object["choices"] as? [[String:Any]] ?? []
                        let delta = choices.first?["delta"] as? [String:Any] ?? [:]
                        let values = [object["response"] as? String,message["content"] as? String,delta["content"] as? String,
                                      object["type"] as? String == "text-delta" ? object["delta"] as? String : nil]
                        return values.contains { !($0 ?? "").isEmpty }
                    }
                    c.expect("\(label): error follows delivered text",emitted,response.body)
                }
                c.equal("\(label): failed state absent from cache",engine.prefixCache.heldTokens,0)
                c.equal("\(label): request pins released",engine.model.pool.pinnedSlotCount,0)
                let health = try exchange("/api/version",nil)
                c.expect("\(label): server remains responsive",health.head.hasPrefix("HTTP/1.1 200"))
                let retry = try exchange("/api/generate",["model":engine.modelName,"prompt":"Say only: ok","stream":false,"think":false,
                    "options":["num_predict":8,"temperature":0,"seed":7]])
                let retryObject = try JSONSerialization.jsonObject(with: Data(retry.body.utf8)) as? [String:Any]
                c.expect("\(label): next request succeeds",retry.head.hasPrefix("HTTP/1.1 200") && retryObject?["done"] as? Bool == true && retryObject?["error"] == nil,retry.body)
                c.equal("\(label): successful HTTP retry releases request pins", engine.model.pool.pinnedSlotCount, 0)
            }
        }
        return c.report()
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift` — 13844 bytes, SHA-256 `50cc04fef5ffb99108c4ba6724c03029de576491085c156d3e4391256d9c5af5`.

````text
// Process and cache safety invariants that are otherwise only observable
// during a 100+ GB model run. Weights-free on purpose: these are the rules a
// long run depends on, checked in milliseconds on every push.

import Foundation
import Slotstream

extension Diagnostics {
    public static func runtime() throws -> CheckReport {
        var c = CheckBuilder("runtime-check")

        if let before = ProcessMemory.vmActivity(), let after = ProcessMemory.vmActivity() {
            c.expect("request VM counters are monotonic", after.swapins >= before.swapins && after.swapouts >= before.swapouts)
            c.expect("request VM reclaimable bytes are available", before.reclaimableBytes > 0)
        } else { c.expect("request VM counters are available", false) }
        c.expect("process physical footprint is readable", ProcessMemory.residentBytes() > 0)
        c.expect("process RSS high-water is readable", ProcessMemory.peakResidentBytes() > 0)
        c.expect("lifetime RSS is separately readable", ProcessMemory.lifetimeRSSPeakBytes() > 0)
        let start = RuntimeClock.now()
        c.expect("monotonic duration is nonnegative", RuntimeClock.seconds(since: start) >= 0)
        let sampler = FootprintSampler()
        let observed = sampler.finish()
        c.expect("footprint sampler includes endpoints", observed.samples >= 2 && observed.peakBytes > 0)
        c.equal("reference optimization defaults", try InferenceOptimizations.environment([:]), InferenceOptimizations())
        let qualified = OptimizationPlatform(machineModel: "Mac17,9", chip: "Apple M5 Pro",
            osBuild: "25G83", nativeARM64: true)
        c.equal("qualified platform keeps the complete joint candidate",
            InferenceOptimizations.deploymentCandidate(on: qualified), .integrationCandidate)
        var fallback = InferenceOptimizations.integrationCandidate
        fallback.fusedRoPE = false
        let unknownPlatforms: [OptimizationPlatform] = [
            .init(machineModel: nil, chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: nil, osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: nil, nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: false),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "23A344", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "24A335", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G84", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "26A1", nativeARM64: true),
            .init(machineModel: "Mac14,6", chip: "Apple M2 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,10", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro extra", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "", chip: "", osBuild: "", nativeARM64: true),
        ]
        for (i, platform) in unknownPlatforms.enumerated() {
            c.equal("unqualified platform \(i) keeps portable work and original rotation",
                InferenceOptimizations.deploymentCandidate(on: platform), fallback)
        }
        c.equal("platform selection is deterministic", OptimizationPlatform.current, OptimizationPlatform.current)
        c.expect("explicit kernel qualification remains available",
            try InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "1"]).fusedRoPE)
        c.expect("explicit kernel fallback remains available",
            try !InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "0"]).fusedRoPE)
        c.expect("typed override enables compaction", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_COMPACT_STATE": "1"]).compactStateWindows)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPACT_STATE": "yes"])
            c.expect("malformed override refused", false)
        } catch { c.expect("malformed override refused", true) }

        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_TYPO": "1"])
            c.expect("unknown optimization refused", false)
        } catch { c.expect("unknown optimization refused", true) }

        for value in ["-1", "1", "16384", "bad"] {
            do {
                _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": value])
                c.expect("invalid read scope \(value) refused", false)
            } catch { c.expect("invalid read scope \(value) refused", true) }
        }
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": "8192"])
            c.expect("unbounded read scope refused", false)
        } catch { c.expect("unbounded read scope refused", true) }

        c.equal("explicit workspace tile is recorded", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048"]).workspaceTokenTile, 2048)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_WORKSPACE_TILE": "8192"])
            c.expect("unbounded workspace tile refused", false)
        } catch { c.expect("unbounded workspace tile refused", true) }

        c.equal("terminal output needs no speculative draft", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 1, bounded: true), 0)
        c.equal("draft count fits remaining output", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 3, bounded: true), 2)
        c.equal("public depth cannot exceed recording cap", Generator.effectiveDraftDepth(requested: Int.max, remainingOutputs: Int.max, bounded: false), 16)
        c.equal("negative remaining output cannot underflow", Generator.effectiveDraftDepth(requested: Int.min, remainingOutputs: Int.min, bounded: true), 0)

        // The prefix cache holds four conversations, not one: Open WebUI's
        // interleaved title request defeated a single slot.
        // Logical cache fixtures are never forwarded through the model, but
        // still declare exactly the number of represented token IDs.
        func fixture(_ count: Int) -> Qwen4ExpModel.State {
            let state = Qwen4ExpModel.State(); state.tokenCount = count; return state
        }
        let cache = PrefixCache(maxTokens: 100)
        for token in 1 ... PrefixCache.maxEntries {
            cache.store(state: fixture(1), tokens: [token])
        }
        c.equal(
            "prefix cache reaches its four-entry bound",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        cache.store(state: fixture(1), tokens: [PrefixCache.maxEntries])
        c.equal(
            "an identical history replaces instead of duplicating an entry",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        _ = cache.take(matching: [999], reserveTokens: 1)
        c.equal(
            "a miss evicts before allocating a fifth state",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries - 1)
        cache.configure(maxTokens: 2)
        c.expect("a smaller live token ceiling evicts immediately", cache.heldTokens <= 2)
        c.expect("held GB includes fixed recurrent state", cache.heldGB > 0.1)
        let growth = PrefixCache(maxTokens: 20)
        growth.store(state: fixture(4), tokens: [1, 2, 3, 4])
        growth.store(state: fixture(4), tokens: [7, 8, 9, 10])
        growth.store(state: fixture(4), tokens: [11, 12, 13, 14])
        c.expect("growing hit still reuses its state", growth.take(matching: [1, 2, 3, 4, 5], reserveTokens: 17) != nil)
        c.equal("growing hit reserves future state before allocation", growth.heldTokens, 0)
        growth.store(state: fixture(1), tokens: [4])
        c.expect("huge reservation safely misses", growth.take(matching: [9], reserveTokens: Int.max) == nil)
        c.equal("huge reservation releases held state", growth.heldTokens, 0)

        let capacity = PrefixCache(maxTokens: 4096)
        for token in 1 ... 4 { capacity.store(state: fixture(1), tokens: [token]) }
        c.expect("capacity reservation still hits", capacity.take(matching: [1, 2], reserveTokens: 2,
            reserveSequenceBytes: 4096 * PrefixCache.bytesPerToken) != nil)
        c.equal("capacity growth reserves bytes before reuse", capacity.heldTokens, 0)
        capacity.store(state: fixture(1), tokens: [7])
        _ = capacity.take(matching: [9], reserveSequenceBytes: Int.max)
        c.equal("saturated byte reservation evicts safely", capacity.heldTokens, 0)

        // Image keying. Every image expands to a run of the same placeholder
        // id, so ids alone cannot tell two pictures apart; the digest can, and
        // a match has to agree in both directions.
        let a = ImageHash(hashing: Data("picture A".utf8))
        let b = ImageHash(hashing: Data("picture B".utf8))
        c.expect("identical bytes hash alike", a == ImageHash(hashing: Data("picture A".utf8)))
        c.expect("different bytes do not", a != b)
        let held = [ImageSegment(start: 4, count: 8, hash: a)]
        c.expect(
            "the same image at the same offset matches",
            PrefixCache.imagesAgree(entry: held, prompt: held, upTo: 12))
        c.expect(
            "a swapped image does not",
            !PrefixCache.imagesAgree(
                entry: held, prompt: [ImageSegment(start: 4, count: 8, hash: b)], upTo: 12))
        c.expect(
            "an entry ending inside a run still matches that run",
            PrefixCache.imagesAgree(
                entry: [ImageSegment(start: 4, count: 3, hash: a)], prompt: held, upTo: 7))
        c.expect(
            "a text-only entry rejects a prompt with an image inside its range",
            !PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 12))
        c.expect(
            "an image beyond the entry's range is irrelevant to the match",
            PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 4))

        let vcache = PrefixCache(maxTokens: 100)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "a vision conversation is held, not discarded",
            vcache.take(matching: [1, 2, 3, 4], images: held, reserveTokens: 4) != nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the same ids with a different picture miss",
            vcache.take(
                matching: [1, 2, 3, 4], images: [ImageSegment(start: 4, count: 8, hash: b)],
                reserveTokens: 4) == nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the text-only splice never sees a vision entry",
            vcache.peek(extending: [1, 2]) == nil)

        // A client can re-render an assistant turn differently from the exact
        // ids the server generated (fx omits reasoning when it sends history
        // back). `peek` finds the longest retained extension for the splice,
        // but does not consume it before the ordinary cache match.
        let spliceCache = PrefixCache(maxTokens: 100)
        spliceCache.store(state: fixture(3), tokens: [7, 8, 9])
        spliceCache.store(state: fixture(4), tokens: [7, 8, 9, 10])
        c.equal(
            "prefix splice chooses the longest retained extension",
            spliceCache.peek(extending: [7, 8]), [7, 8, 9, 10])
        c.expect(
            "prefix splice is strict, not an identical-history match",
            spliceCache.peek(extending: [7, 8, 9, 10]) == nil)
        c.equal(
            "prefix splice lookup does not consume the retained state",
            spliceCache.take(matching: [7, 8, 9, 10, 11])?.reused, 4)
        spliceCache.enabled = false
        c.expect(
            "a disabled prefix cache offers no splice",
            spliceCache.peek(extending: [7]) == nil)

        // Weights behind a symlink: Foundation refuses to list the link itself,
        // so the index must resolve it first (it did not, before 0.2.1).
        let tmp = FileManager.default.temporaryDirectory
            .appendingPathComponent("slotstream-runtime-check-\(getpid())")
        let real = tmp.appendingPathComponent("real")
        let link = tmp.appendingPathComponent("link")
        try FileManager.default.createDirectory(at: real, withIntermediateDirectories: true)
        FileManager.default.createFile(
            atPath: real.appendingPathComponent("model-00001-of-00001.safetensors").path,
            contents: Data())
        try FileManager.default.createSymbolicLink(at: link, withDestinationURL: real)
        defer { try? FileManager.default.removeItem(at: tmp) }
        c.equal(
            "shard listing works through a symlinked model dir",
            (try? CheckpointIndex.shardFiles(in: link))?.count, 1)

        // The memory promise: a plan never expects to peak past its target.
        for target in [Planner.minMemoryGB, 10, 16, 30] where target >= Planner.minMemoryGB {
            let p = try Planner.plan(
                expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                ramGB: 64, workingSetGB: 64, availableGB: 64)
            c.expect(
                "\(target) GB plan stays inside its target",
                p.expectedPeakGB <= target + 0.01,
                "expected peak \(p.expectedPeakGB) GB")
            c.measure("peak_gb_at_\(Int(target))", p.expectedPeakGB)
        }
        return c.report()
    }
}

````
