---
type: run
id: 01m1vjydg6bk6bqnt8q8zm1w2s
created: 2026-09-06T14:46:17.862978+00:00
updated: 2026-09-06T14:46:50.616270+00:00
summary: Combined runtime bounded lifetime gate preparation V163
binary: No model or build; pure harness checks and unrun protocol draft
captured_at: 2026-09-06
command: python3 -m unittest discover -s Tools -p optimization_soak_test.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Combined runtime bounded lifetime gate preparation V163
tool: python3
---
V163 prepares the missing long-lived-server acceptance gate. Existing paired studies create fresh servers per cell and cannot alone prove bounded repeated-request retention. The new harness uses one server at an explicit 10 GB target and 32,768 context cap, with two warmup and eight measured cycles of six pinned requests: greedy short, prose, identical prose, distinct tail, sampled short and one 512-pixel image. Plain and MTP modes will run in separate sequential processes. Each mode has a 900-second bound, at most 1,024 actual input tokens and eight outputs per request; no real-pressure stress is introduced.

The prospective draft limits sampled physical peak to 10 GB, per-position active growth to 64 MiB, physical end growth to 256 MiB, embedding cached payload to 11,796,480 bytes, prefix entries to four, and actual prefix token-capacity charge to its declared maximum. The first and last four measured cycles define early/late observations before any model result. Each position needs five clean observations, including two early and two late; VM/power-contaminated observations stay recorded and do not qualify resource behavior. All outputs must replay exactly per position, including excluded resource observations. Missing/failed requests and absolute footprint overflow fail; no replacement cycles exist. Resource differences compare the maximum clean late value against the minimum clean early value, not a selected best sample. This is a bounded lifetime gate, not an unbounded memory-leak proof or a latency claim.

Seven focused tests pass: steady retained memory, late growth, insufficient/contaminated early and late evidence, changed outputs in excluded cells, failure before metrics, incomplete/duplicate sequences, absolute footprint, prefix/embedding bounds, malformed/relaxed limits, draft refusal and fixture identity. The driver persists exact request bodies, frozen source, every response and prefix/resource observation, and stops its owned server on failure or interruption. A draft cannot launch; final binary/source identity, selected controls and prerequisites still need binding after the final combined candidate is chosen. No live soak, model build or new performance result occurred. Shared Sources remain unchanged while the context task finishes its bounded interval.

Artifact `/Users/carlos/Projects/slotstream/Tools/optimization_soak.py` — 14485 bytes, SHA-256 `8c8381741621b6b4548ad00a7f631501a78c53c21cc537e1e9c640239b6d5ebf`.

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
            type(r.get('prefix', {}).get('conversations')) is int
            and 0 <= r['prefix']['conversations'] <= gate['maximum_prefix_entries']
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

Artifact `/Users/carlos/Projects/slotstream/Tools/optimization_soak_test.py` — 5723 bytes, SHA-256 `fc3932a9064ddbc8d07d4dd99d1591e360be6d4a42998bf05e53ca3c034be060`.

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
                'prefix': {'conversations': 4, 'charged_token_capacity': 256, 'max_tokens': 1024},
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

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/combined-soak-harness-v163.txt` — 105 bytes, SHA-256 `77ecdaf76b0a4f9f157b08dc741287943417847cdfae17660c5fea600de76490`.

````text
.......
----------------------------------------------------------------------
Ran 7 tests in 0.013s

OK

````

Artifact `/tmp/slotstream-optimization-execution/combined-soak-draft-v163.json` — 4677 bytes, SHA-256 `0ca73b7b14e36a063937b8db7cd5d989b38a497cd81581214e3127ccec47bab5`.

````text
{
  "classification": "UNRUN DRAFT: final binary/source and selected controls must be bound before execution",
  "purpose": "Bounded lifetime qualification of the final combined runtime in one long-lived server",
  "memory_gb": 10,
  "max_context": 32768,
  "mtp_modes": [
    "off",
    "on"
  ],
  "server_processes": "Sequential, one model at a time; a separate fresh process per MTP mode",
  "warmup_cycles": 2,
  "measured_cycles": 8,
  "maximum_duration_seconds_per_mode": 900,
  "maximum_prompt_tokens": 1024,
  "maximum_output_tokens": 8,
  "sequence": [
    {
      "name": "short",
      "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
      "raw": true,
      "outputs": 8,
      "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9"
    },
    {
      "name": "prose",
      "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
      "raw": true,
      "outputs": 8,
      "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b"
    },
    {
      "name": "prose-repeat",
      "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
      "raw": true,
      "outputs": 8,
      "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b"
    },
    {
      "name": "prose-distinct-tail",
      "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose-distinct-tail.txt",
      "raw": true,
      "outputs": 8,
      "fixture_sha256": "d13b427927e9266ae8a9949b85a704ff6439df50aea54bfd7b5bf46f12b7c784"
    },
    {
      "name": "sampled-short",
      "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
      "raw": true,
      "outputs": 8,
      "sampling": {
        "temperature": 0.7,
        "top_k": 40,
        "top_p": 0.8,
        "min_p": 0.05,
        "presence_penalty": 1.1
      },
      "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9"
    },
    {
      "name": "image",
      "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/prompt.txt",
      "image": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/red-512.png",
      "raw": false,
      "think": false,
      "outputs": 1,
      "fixture_sha256": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
      "image_sha256": "5eafcdbe57b88e9c12ef8ac4cc3eee45f9c3433b7f929d867e5dd4d7832a8aed"
    }
  ],
  "acceptance": {
    "all_expected_requests_complete": true,
    "exact_per_position_replay_after_warmup": true,
    "maximum_sampled_physical_peak_bytes": 10000000000,
    "maximum_active_growth_bytes_per_position": 67108864,
    "maximum_physical_end_growth_bytes_per_position": 268435456,
    "maximum_cached_embedding_payload_bytes": 11796480,
    "maximum_prefix_entries": 4,
    "prefix_charge_within_declared_capacity": true,
    "minimum_clean_observations_per_position": 5,
    "minimum_clean_early_observations_per_position": 2,
    "minimum_clean_late_observations_per_position": 2,
    "nominal_power_and_unchanged_request_vm_for_resource_observations": true,
    "replacement_cycles": 0
  },
  "analysis": "This is a bounded lifecycle/memory observation, not latency benchmarking or an unbounded-leak proof. The first and last four measured cycles form the predeclared early/late windows. At each sequence position compare the maximum clean late active allocation against the minimum clean early allocation; use the analogous end physical footprint check. Require at least five clean observations including two early and two late at each position. Capture every response, work counter, prefix charge and resource interval; resource overflow or runtime failure stops immediately and fails the study. Swap-affected observations remain recorded and excluded from resource qualification. No replacements. All measured outputs at a fixed position must match the first measured cycle, regardless of resource exclusions. Record complete-prompt and partial reuse, including legitimate optional-checkpoint admission refusals when four ordinary conversations consume the capacity; this soak may not demand eviction of a protected conversation to manufacture a hit. The separate paired/native gates qualify each reuse mechanism. Image work must be encoded or legitimately prefix-skipped under matching identity. The final candidate's frozen correctness and paired studies must pass first. Two warmup cycles do not establish cold filesystem behavior. Default adoption, source identity and clean full acceptance are separate prerequisites."
}

````
