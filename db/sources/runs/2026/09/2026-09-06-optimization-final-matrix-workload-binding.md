---
type: run
id: 01m1wbvsxgavtdv75k8wk4e665
created: 2026-09-06T22:01:46.672858+00:00
updated: 2026-09-06T22:01:46.976144+00:00
summary: V195 final matrix binds workloads and controls across native paired and soak evidence
binary: provider-free Python; no native build
captured_at: 2026-09-06
command: python3 -m unittest optimization_prerequisites_test optimization_soak_test
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: V195 final matrix binds workloads and controls across native paired and soak evidence
tool: source review and Python unittest
---
V195 closes a concrete final-qualification receipt gap before any final paired study or soak has run. The previous prerequisite gate required the same binary/source/Metal, distinct study directories, complete32-cell coordinates and recomputed acceptance, but did not prove that a report's workload/controls matched its declared matrix name. Another passing same-build study could therefore be substituted under a different name. Native environment controls and the soak's selected environment likewise lacked a shared pre-run binding.

The lifetime driver now requires one separately frozen slotstream-qualification-v1 contract. It binds the exact build identity, all three native command/environment pairs, all seven full paired protocol objects, and both complete soak configurations (all fields except the contract pointer and subsequently collected evidence pointers). File SHA-256 and bounded size are verified before launch. Both mode definitions and complete native/paired maps are mandatory; the exact parsed contract is preserved in the resulting receipt. This does not replace the existing evidence hash, source, coordinate, acceptance or independent recomputation checks; all still run. It is not evidence that a plan or study passed. The final contract must be reviewed and frozen after final candidate/source decisions and before any final matrix cell executes; those decisions and all actual runs remain pending.

The first focused Python invocation ran21 tests with one failure: the new contract check changed the order of the existing missing-prerequisites error. The correction preserves the prior prerequisite-structure error before checking the contract; no runtime or acceptance assertion was relaxed. The corrected21 tests pass, including both modes, mismatched soak controls, changed paired fixture/memory/MTP/arms/work bindings, native environment changes, contract hash/build changes and missing matrix entries. The older mismatch/duplicate/build/failure/recomputation cases remain active. The original failed output is retained as an explicitly labeled capture from the exec result, not presented as a second execution.

No Swift source, production inference behavior, optimization default or measured speed changed. No build/model/performance/capacity/storage job launched; the transport reservation remains in force. This source-only strengthening belongs to OPT00/32/33 and cannot qualify the still-unrun final matrix or lifetime studies.


Artifact `/tmp/slotstream-optimization-execution/qualification-binding-v195/after/Tools/optimization_prerequisites_test.py` — 11025 bytes; SHA-256 `e62f37251c7f9e8ac08be3fb477226d0171986dba673589047bccffc8add9e5c`.

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
        self.protocol = {'mtp': 'off', 'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '1'},
                         'prerequisites': {'native': {}, 'paired': {}}}
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
        self.contract_path = self.root / 'qualification-contract.json'
        self.contract = {'format': 'slotstream-qualification-v1', 'build_identity': copy.deepcopy(self.identity),
            'native': {}, 'paired_protocols': {}, 'soak_modes': {}}
        for name, entry in self.protocol['prerequisites']['native'].items():
            manifest = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
            self.contract['native'][name] = {'command': manifest['command'], 'environment': {}}
        for name, entry in self.protocol['prerequisites']['paired'].items():
            self.contract['paired_protocols'][name] = json.loads(
                (Path(entry['directory']) / 'manifest.json').read_text())['protocol']
        for mode in ['off', 'on']:
            self.contract['soak_modes'][mode] = {'mtp': mode, 'env': copy.deepcopy(self.protocol['env'])}
        self.freeze_contract()

    def freeze_contract(self):
        self.contract_path.write_text(json.dumps(self.contract))
        self.protocol['qualification_contract'] = {'path': str(self.contract_path),
            'sha256': digest(self.contract_path)}

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
        self.assertEqual(len(self.validate()), 11)
        self.protocol['mtp'] = 'on'
        self.assertEqual(self.validate()['qualification_contract'], self.contract)

    def test_different_soak_controls_cannot_borrow_passing_evidence(self):
        self.protocol['env']['SLOTSTREAM_OPT_FINAL_FORWARD'] = '0'
        with self.assertRaisesRegex(ValueError, 'soak workload or controls'): self.validate()

    def test_relabeling_or_changing_a_paired_workload_is_rejected(self):
        # Even a newly signed report from the same binary may not replace the
        # pre-run workload with another prompt, budget, mode or control.
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        before = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
        for field, value in [('fixture_sha256', 'f' * 64), ('memory_gb', 10),
                             ('mtp', 'on'), ('arms', {'combined': {'env': {}}}),
                             ('required_equal_work', [])]:
            self.modify('paired', 'unique-prose', 'manifest.json', lambda d: d['protocol'].update({field: value}))
            with self.assertRaisesRegex(ValueError, 'paired workload or controls'): self.validate()
            self.write(entry, 'manifest.json', before)

    def test_native_environment_must_match_the_same_pre_run_contract(self):
        self.modify('native', 'combined-plain', 'manifest.json',
                    lambda d: d.update(environment={'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}))
        with self.assertRaisesRegex(ValueError, 'native workload or controls'): self.validate()

    def test_contract_identity_build_and_complete_workloads_are_required(self):
        self.contract_path.write_text('{}')
        with self.assertRaisesRegex(ValueError, 'contract identity'): self.validate()
        self.freeze_contract()
        original = copy.deepcopy(self.contract)
        for mutate in [lambda c: c['build_identity'].update(source_archive_sha256='e' * 64),
                       lambda c: c['paired_protocols'].pop('short-one'),
                       lambda c: c['soak_modes'].pop('on')]:
            mutate(self.contract); self.freeze_contract()
            with self.assertRaises(ValueError): self.validate()
            self.contract = copy.deepcopy(original)
        self.freeze_contract()

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

Artifact `/tmp/slotstream-optimization-execution/qualification-binding-v195/after/Tools/optimization_soak.py` — 24929 bytes; SHA-256 `7cd055e063509d7f1ec636329fdf1e062ce6621afa6505d890974bfbe27d6e26`.

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
        if digest(path) != entry['sha256'][name]:
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

Artifact `/tmp/slotstream-optimization-execution/qualification-binding-v195/attempt-1.txt` — 553 bytes; SHA-256 `c95ab3d7ac1e80ea738552325e2078c77596f1168e05137ef5661c17740cf234`.

````text
Captured from the first exec result (exit1); no rerun for capture.
..................F..
FAIL: test_missing_prerequisites_fail_before_output_or_server_creation (optimization_soak_test.SoakTests)
ValueError: a frozen qualification contract is required
AssertionError: "prerequisites are mandatory" does not match "a frozen qualification contract is required"
Ran21 tests in0.164s. FAILED(failures=1).
The new contract check ran before the older mandatory-prerequisite check; preserve existing error precedence by validating prerequisite structure first.

````

Artifact `/tmp/slotstream-optimization-execution/qualification-binding-v195/before/Tools/optimization_prerequisites_test.py` — 7511 bytes; SHA-256 `03e21743aad6e4457d20c479f52352044e252e6a9f10937bb15424d685f5910a`.

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

Artifact `/tmp/slotstream-optimization-execution/qualification-binding-v195/before/Tools/optimization_soak.py` — 22217 bytes; SHA-256 `8308d6182267b787fa6b307654dad35b5b3d68b826f34d15b208a9af7b3c225c`.

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

Artifact `/tmp/slotstream-optimization-execution/qualification-binding-v195/fix.patch` — 9707 bytes; SHA-256 `9f03d7747626f5200edaa3e0c6177148ebd117a0adf48dcbddddd6eac8297435`.

````text
--- a/Tools/optimization_soak.py
+++ b/Tools/optimization_soak.py
@@ -124,6 +124,37 @@
         connection.close()
 
 
+def qualification_contract(protocol, build):
+    """Bind every workload and control to one reviewed pre-run matrix.
+
+    A passing report with the right build and a different directory can still
+    be the wrong workload. The separate frozen contract prevents relabeling a
+    study or changing the soak's controls after its prerequisites were run.
+    """
+    binding = protocol.get('qualification_contract')
+    if not isinstance(binding, dict) or set(binding) != {'path', 'sha256'}:
+        raise ValueError('a frozen qualification contract is required')
+    path = Path(binding['path'])
+    if not path.is_file() or not 0 < path.stat().st_size <= 2_000_000 or digest(path) != binding['sha256']:
+        raise ValueError('qualification contract identity or size differs')
+    contract = json.loads(path.read_text())
+    keys = {'format', 'build_identity', 'native', 'paired_protocols', 'soak_modes'}
+    if not isinstance(contract, dict) or set(contract) != keys or contract['format'] != 'slotstream-qualification-v1':
+        raise ValueError('invalid qualification contract format')
+    identity_keys = {'binary_sha256', 'source_archive_sha256', 'metallib_sha256'}
+    identity = contract['build_identity']
+    if not isinstance(identity, dict) or set(identity) != identity_keys or any(
+            not isinstance(identity[k], str) or len(identity[k]) != 64
+            or identity[k] != build['identity'].get(k) for k in identity_keys):
+        raise ValueError('qualification contract belongs to another build')
+    modes = contract['soak_modes']
+    declared = {k: v for k, v in protocol.items() if k not in {'qualification_contract', 'prerequisites'}}
+    if (not isinstance(modes, dict) or set(modes) != {'off', 'on'}
+            or declared != modes.get(protocol.get('mtp'))):
+        raise ValueError('soak workload or controls differ from the frozen qualification contract')
+    return contract
+
+
 def validate_prerequisites(protocol, build):
     """Require the final candidate's native and paired evidence before launch.
 
@@ -140,6 +171,10 @@
     for kind, names in [('native', required_native), ('paired', required_paired)]:
         if not isinstance(prerequisites[kind], dict) or set(prerequisites[kind]) != names:
             raise ValueError(f'complete {kind} prerequisite set required')
+    contract = qualification_contract(protocol, build)
+    for field, names in [('native', required_native), ('paired_protocols', required_paired)]:
+        if not isinstance(contract[field], dict) or set(contract[field]) != names:
+            raise ValueError(f'qualification contract requires every {field} workload')
 
     def same_identity(identity):
         return isinstance(identity, dict) and all(identity.get(k) == build['identity'].get(k)
@@ -152,7 +187,8 @@
             raise ValueError(f'prerequisite digest differs: {path}')
         return path
 
-    observed = {}
+    # Preserve the exact parsed contract with the receipt, not just its path.
+    observed = {'qualification_contract': contract}
     for name, entry in prerequisites['native'].items():
         manifest = json.loads(evidence(entry, 'manifest.json').read_text())
         report = json.loads(evidence(entry, 'stdout.txt').read_text())
@@ -164,6 +200,8 @@
                 or manifest.get('assertions') != len(items)):
             raise ValueError(f'native prerequisite failed or belongs to another build: {name}')
         command = manifest.get('command') or []
+        if contract['native'][name] != {'command': command, 'environment': manifest.get('environment', {})}:
+            raise ValueError(f'native workload or controls differ from the frozen contract: {name}')
         variants = {'combined-plain': ['integrated', 'integrated-vision-query'],
                     'combined-mtp': ['integrated-mtp', 'integrated-vision-query-mtp'],
                     'read-failure-serving': ['read-failure-serving']}[name]
@@ -181,6 +219,8 @@
         completion = json.loads(evidence(entry, 'completion.json').read_text())
         rows = [json.loads(line) for line in evidence(entry, 'results.jsonl').read_text().splitlines()]
         declared = manifest['protocol']
+        if declared != contract['paired_protocols'][name]:
+            raise ValueError(f'paired workload or controls differ from the frozen contract: {name}')
         arms = manifest.get('arm_builds') or {}
         if (not arms or any(not same_identity(arm.get('identity')) for arm in arms.values())
                 or completion.get('interrupted') is not False or completion.get('stopped_early') is not False
--- a/Tools/optimization_prerequisites_test.py
+++ b/Tools/optimization_prerequisites_test.py
@@ -20,7 +20,8 @@
             ('source_archive_sha256', 'b'), ('metallib_sha256', 'c')]}
         self.build = {'identity': self.identity}
         self.decision = [{'candidate': 'combined', 'passed': True, 'checks': {'fixture': True}}]
-        self.protocol = {'prerequisites': {'native': {}, 'paired': {}}}
+        self.protocol = {'mtp': 'off', 'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '1'},
+                         'prerequisites': {'native': {}, 'paired': {}}}
         for name, variant in [('combined-plain', 'integrated'), ('combined-mtp', 'integrated-mtp'),
                               ('read-failure-serving', 'read-failure-serving')]:
             entry = self.entry('native', name)
@@ -47,6 +48,23 @@
                 'startup_acceptance': self.decision})
             self.write(entry, 'results.jsonl', [{'round': i, 'arm': arm}
                 for i in range(1, 17) for arm in ['reference', 'combined']])
+        self.contract_path = self.root / 'qualification-contract.json'
+        self.contract = {'format': 'slotstream-qualification-v1', 'build_identity': copy.deepcopy(self.identity),
+            'native': {}, 'paired_protocols': {}, 'soak_modes': {}}
+        for name, entry in self.protocol['prerequisites']['native'].items():
+            manifest = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
+            self.contract['native'][name] = {'command': manifest['command'], 'environment': {}}
+        for name, entry in self.protocol['prerequisites']['paired'].items():
+            self.contract['paired_protocols'][name] = json.loads(
+                (Path(entry['directory']) / 'manifest.json').read_text())['protocol']
+        for mode in ['off', 'on']:
+            self.contract['soak_modes'][mode] = {'mtp': mode, 'env': copy.deepcopy(self.protocol['env'])}
+        self.freeze_contract()
+
+    def freeze_contract(self):
+        self.contract_path.write_text(json.dumps(self.contract))
+        self.protocol['qualification_contract'] = {'path': str(self.contract_path),
+            'sha256': digest(self.contract_path)}
 
     def entry(self, kind, name):
         path = self.root / name; path.mkdir()
@@ -79,7 +97,43 @@
             return result
 
     def test_complete_same_build_evidence_is_recomputed_and_accepted(self):
-        self.assertEqual(len(self.validate()), 10)
+        self.assertEqual(len(self.validate()), 11)
+        self.protocol['mtp'] = 'on'
+        self.assertEqual(self.validate()['qualification_contract'], self.contract)
+
+    def test_different_soak_controls_cannot_borrow_passing_evidence(self):
+        self.protocol['env']['SLOTSTREAM_OPT_FINAL_FORWARD'] = '0'
+        with self.assertRaisesRegex(ValueError, 'soak workload or controls'): self.validate()
+
+    def test_relabeling_or_changing_a_paired_workload_is_rejected(self):
+        # Even a newly signed report from the same binary may not replace the
+        # pre-run workload with another prompt, budget, mode or control.
+        entry = self.protocol['prerequisites']['paired']['unique-prose']
+        before = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
+        for field, value in [('fixture_sha256', 'f' * 64), ('memory_gb', 10),
+                             ('mtp', 'on'), ('arms', {'combined': {'env': {}}}),
+                             ('required_equal_work', [])]:
+            self.modify('paired', 'unique-prose', 'manifest.json', lambda d: d['protocol'].update({field: value}))
+            with self.assertRaisesRegex(ValueError, 'paired workload or controls'): self.validate()
+            self.write(entry, 'manifest.json', before)
+
+    def test_native_environment_must_match_the_same_pre_run_contract(self):
+        self.modify('native', 'combined-plain', 'manifest.json',
+                    lambda d: d.update(environment={'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}))
+        with self.assertRaisesRegex(ValueError, 'native workload or controls'): self.validate()
+
+    def test_contract_identity_build_and_complete_workloads_are_required(self):
+        self.contract_path.write_text('{}')
+        with self.assertRaisesRegex(ValueError, 'contract identity'): self.validate()
+        self.freeze_contract()
+        original = copy.deepcopy(self.contract)
+        for mutate in [lambda c: c['build_identity'].update(source_archive_sha256='e' * 64),
+                       lambda c: c['paired_protocols'].pop('short-one'),
+                       lambda c: c['soak_modes'].pop('on')]:
+            mutate(self.contract); self.freeze_contract()
+            with self.assertRaises(ValueError): self.validate()
+            self.contract = copy.deepcopy(original)
+        self.freeze_contract()
 
     def test_missing_and_duplicate_workload_evidence_refused(self):
         with self.assertRaises(ValueError): validate_prerequisites({}, self.build)

````

Artifact `/tmp/slotstream-optimization-execution/qualification-binding-v195/manifest.json` — 701 bytes; SHA-256 `7f781af8f705605467bbaf4d229c43e98078f933288de200a6fa38425ed46368`.

````text
{
  "files": [
    {
      "path": "Tools/optimization_soak.py",
      "before_sha256": "8308d6182267b787fa6b307654dad35b5b3d68b826f34d15b208a9af7b3c225c",
      "after_sha256": "7cd055e063509d7f1ec636329fdf1e062ce6621afa6505d890974bfbe27d6e26"
    },
    {
      "path": "Tools/optimization_prerequisites_test.py",
      "before_sha256": "03e21743aad6e4457d20c479f52352044e252e6a9f10937bb15424d685f5910a",
      "after_sha256": "e62f37251c7f9e8ac08be3fb477226d0171986dba673589047bccffc8add9e5c"
    }
  ],
  "pure_tests": 21,
  "passed": true,
  "native_source_changed": false,
  "performance_runs": 0,
  "qualification_contract": "Unfrozen until final source and candidate decisions are complete"
}

````

Artifact `/tmp/slotstream-optimization-execution/qualification-binding-v195/tests.txt` — 120 bytes; SHA-256 `b1228231f73eba7d12c269b7078e581349cccddbf39b7a39dd686948b3bef174`.

````text
.....................
----------------------------------------------------------------------
Ran 21 tests in 0.152s

OK

````
