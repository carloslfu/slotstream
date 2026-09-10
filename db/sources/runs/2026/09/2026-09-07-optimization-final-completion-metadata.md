---
type: run
id: 01m1ww5n6hd1d79tb171s0yt10
created: 2026-09-07T02:46:46.737856+00:00
updated: 2026-09-07T02:46:46.957012+00:00
summary: Final completion metadata and exact token accounting
binary: No native executable launched
captured_at: 2026-09-07
command: python3 Tools/optimization_prerequisites_test.py; python3 Tools/optimization_soak_test.py
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Final completion metadata and exact token accounting
tool: Pure final-prerequisite and lifetime fixture checks
---
# Final receipt completion and token accounting

V234 extends the prospective final prerequisite validator; no study driver or
runtime source changes. Completed first/measured metadata must have no runtime
error, must bind its output/prompt counters to the captured token IDs, and must
account for the entire prompt as computed plus reused tokens. These checks are
independent of timing eligibility. The final30testfixture exposes three failures
on V229: first runtime error, measured runtime error and inconsistent reused
plus computed token accounting. The other27already pass, including the two
new direct count-mismatch cases. All30pass after correction, and the11existing
soak-driver tests pass. Those exact outputs and both source versions follow.

These are pure receipt fixtures with no native executable, model, GPU, compiler
or server. Earlier studies are not rescored or reclassified. The nine existing
static optimization suites now contain122tests; this change reruns the affected
30prerequisite and11soaktests, while the unchanged suites retain V231 evidence.
No runtime bug or measured speedup is inferred from synthetic receipt failures.
The final eight paired studies and two real soaks remain unrun, and optimizer
defaults remain off. This evidence is discarded for performance.

## /tmp/slotstream-optimization-execution/paired-completion-metadata-v234/after/Tools/optimization_prerequisites_test.py

SHA-256 `215ab0cead0daafd4d95f469254870159c66b9d719997410838cea83c151d41b`; 19262 bytes.

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
                     'complete-repeat', 'unique-with-retention', 'actual-default-one-token']:
            entry = self.entry('paired', name)
            gate = {'minimum_pairs': 5, 'replacement_rounds': 0, 'all_outputs_exact': True}
            if name in ['short-one', 'distinct-tail', 'complete-repeat']:
                gate.update(minimum_median_client_reduction=.05, minimum_positive_fraction=.8)
            else:
                gate.update(maximum_median_client_regression=.05, minimum_positive_fraction=0)
            if name in ['unique-prose', 'sampled-short', 'mtp-resource']:
                gate.update(minimum_active_savings_bytes=300_000_000, minimum_sampled_peak_savings_bytes=200_000_000)
            self.write(entry, 'manifest.json', {'protocol': {'rounds': 16,
                'mtp': 'off', 'minimum_output_tokens': 1, 'max_tokens': 1,
                'maximum_sampled_footprint_bytes': 8_100_000_000,
                'arms': {arm: {'chunk': 256, 'env': {}} for arm in ['reference', 'combined']},
                'acceptance': gate,
                'startup_acceptance': {'minimum_pairs': 5, 'maximum_median_first_job_regression': .05,
                    'all_outputs_exact': True}},
                'arm_builds': {arm: self.build for arm in ['reference', 'combined']}})
            self.write(entry, 'completion.json', {'interrupted': False, 'stopped_early': False,
                'planned_cells': 32, 'recorded_cells': 32, 'acceptance': self.decision,
                'startup_acceptance': self.decision})
            rows = [self.response_row(i, arm) for i in range(1, 17) for arm in ['reference', 'combined']]
            self.write(entry, 'results.jsonl', rows)
            for row in rows:
                self.write(entry, f"{row['round']}-{row['arm']}/warmup.json", self.warmup_response(row))
        self.modify('paired', 'actual-default-one-token', 'manifest.json',
            lambda m: m['protocol'].update(arms={'reference': {'chunk': 256, 'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}},
                'combined': {'chunk': 256, 'env': {}}}, max_tokens=1, minimum_output_tokens=1,
                prefix_cache={'retention_only': True, 'expected_reused_tokens': {'reference': 0, 'combined': 0}}))
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

    @staticmethod
    def response_row(number, arm):
        return {'round': number, 'arm': arm, 'valid': True,
            'client_seconds': 1.0, 'startup_seconds': 1.0,
            'startup_and_warmup_valid': True, 'text': 'measured',
            'first_request': {'prompt_ids': [17], 'output_ids': [7], 'text': 'first',
                'effective_mtp': False, 'effective_pool_slots': 640, 'complete_seconds_from_launch': 2.0},
            'metrics': {'schema_version': 1, 'prompt_ids': [101, 102], 'output_ids': [7],
                'effective_mtp': False, 'effective_pool_slots': 640, 'effective_prefill_chunk': 256,
                'stats': {'prefillSeconds': .5, 'decodeSeconds': .5, 'requestSeconds': 1.0,
                    'imageEncodeSeconds': 0.0, 'prefillRecords': 1, 'decodeRecords': 0,
                    'prefillTokens': 2, 'decodeTokens': 1, 'promptTokens': 2, 'prefillPasses': [2],
                    'lifetimeRSSPeakBytes': 1_000_000, 'sampledFootprint': {'peakBytes': 2_000_000}}}}

    def execution_mutation(self, change):
        self.modify('paired', 'unique-prose', 'results.jsonl', lambda rows: change(rows[-1]))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    @staticmethod
    def warmup_response(row):
        metrics = copy.deepcopy(row['metrics'])
        metrics.update({key: row['first_request'][key] for key in
            ['prompt_ids', 'output_ids', 'effective_mtp', 'effective_pool_slots']})
        count = len(metrics['prompt_ids'])
        metrics['stats'].update(promptTokens=count, prefillTokens=count, prefillPasses=[count])
        return {'text': row['first_request']['text'], 'metrics': metrics}

    def test_vm_excluded_warmup_peak_overflow_still_fails(self):
        self.modify('paired', 'unique-prose', 'results.jsonl',
            lambda rows: rows[-1].update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity'))
        self.modify('paired', 'unique-prose', '16-combined/warmup.json',
            lambda warm: warm['metrics']['stats']['sampledFootprint'].update(peakBytes=8_100_000_001))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    def test_warmup_body_must_match_the_captured_first_request(self):
        self.modify('paired', 'unique-prose', '16-combined/warmup.json',
            lambda warm: warm['metrics'].update(output_ids=[8]))
        with self.assertRaisesRegex(ValueError, 'hashed warmup response'):
            self.validate()

    def test_every_warmup_body_requires_an_unchanged_digest(self):
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        path = Path(entry['directory'])/'16-combined/warmup.json'
        path.write_text('{}')
        with self.assertRaisesRegex(ValueError, 'digest differs'):
            self.validate()

    def test_warmup_body_without_a_digest_is_not_accepted(self):
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        del entry['sha256']['16-combined/warmup.json']
        with self.assertRaisesRegex(ValueError, 'digest differs'):
            self.validate()

    def test_vm_excluded_measured_output_change_is_a_correctness_failure(self):
        def mutate(row):
            row.update(valid=False, exclusion='swap activity')
            row['metrics']['output_ids'] = [8]
        self.execution_mutation(mutate)

    def test_excluded_first_output_change_is_a_correctness_failure(self):
        def mutate(row):
            row.update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity')
            row['first_request']['output_ids'] = [8]
        self.execution_mutation(mutate)

    def test_vm_excluded_absolute_peak_overflow_still_fails(self):
        def mutate(row):
            row.update(valid=False, exclusion='swap activity')
            row['metrics']['stats']['sampledFootprint']['peakBytes'] = 8_100_000_001
        self.execution_mutation(mutate)

    def test_request_failure_is_not_a_discardable_timing_sample(self):
        self.execution_mutation(lambda row: row.update(valid=False, error='HTTP 500 fixture'))

    def test_runtime_error_in_completed_measured_metadata_still_fails(self):
        self.execution_mutation(lambda row: row['metrics']['stats'].update(runtimeError='fixture failure'))

    def test_runtime_error_in_completed_first_metadata_still_fails(self):
        self.modify('paired', 'unique-prose', '16-combined/warmup.json',
            lambda warm: warm['metrics']['stats'].update(runtimeError='fixture failure'))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    def test_measured_token_counters_must_match_captured_ids(self):
        self.execution_mutation(lambda row: row['metrics']['stats'].update(decodeTokens=2))

    def test_first_token_counters_must_match_captured_ids(self):
        self.modify('paired', 'unique-prose', '16-combined/warmup.json',
            lambda warm: warm['metrics']['stats'].update(promptTokens=3))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    def test_reused_and_computed_tokens_must_account_for_the_whole_prompt(self):
        self.execution_mutation(lambda row: row['metrics']['stats'].update(reusedPrefixTokens=1))

    def test_preflight_refusal_leaves_the_final_matrix_incomplete(self):
        def mutate(row):
            row.pop('metrics'); row.pop('first_request')
            row.update(valid=False, error='InsufficientHeadroom fixture')
        self.execution_mutation(mutate)

    def test_completed_wrong_configuration_is_not_a_discardable_sample(self):
        def mutate(row):
            row.update(valid=False)
            row['metrics']['effective_prefill_chunk'] = 512
        self.execution_mutation(mutate)

    def test_wrong_or_truncated_token_metadata_is_not_discardable(self):
        self.execution_mutation(lambda row: row['metrics'].update(output_ids=[]))

    def test_vm_excluded_identical_complete_responses_remain_eligible_for_correctness(self):
        self.modify('paired', 'unique-prose', 'results.jsonl',
            lambda rows: rows[-1].update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity'))
        self.assertEqual(len(self.validate()), 12)

    def test_actual_default_guard_rejects_forced_controls_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p['arms']['combined']['env'].update(SLOTSTREAM_OPT_FINAL_FORWARD='1'))

    def test_actual_default_guard_rejects_disabled_retention_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.pop('prefix_cache'))

    def test_actual_default_guard_rejects_larger_reply_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.update(max_tokens=16, minimum_output_tokens=16))

    def actual_default_mutation(self, change):
        name = 'actual-default-one-token'
        self.modify('paired', name, 'manifest.json', lambda m: change(m['protocol']))
        entry = self.protocol['prerequisites']['paired'][name]
        self.contract['paired_protocols'][name] = json.loads((Path(entry['directory']) / 'manifest.json').read_text())['protocol']
        self.freeze_contract()
        with self.assertRaisesRegex(ValueError, 'actual-default guard'):
            self.validate()

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
        path.parent.mkdir(parents=True, exist_ok=True)
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
            self.assertEqual((summary.call_count, acceptance.call_count, startup.call_count), (8, 8, 8))
            return result

    def test_complete_same_build_evidence_is_recomputed_and_accepted(self):
        self.assertEqual(len(self.validate()), 12)
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

## /tmp/slotstream-optimization-execution/paired-completion-metadata-v234/after/Tools/optimization_soak.py

SHA-256 `424e9ba21eca260b248b216270060a0d82139cc62b96b4a03af9036e8c415cd2`; 31781 bytes.

````text
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


def validate_prerequisites(protocol, build):
    """Require the final candidate's native and paired evidence before launch.

    Digests bind the exact reports; same-binary/source/Metal identity prevents
    borrowing a passing gate from an earlier implementation. Paired decisions
    are recomputed from their frozen rows using the ordinary benchmark gates.
    """
    required_native = {'combined-plain', 'combined-mtp', 'read-failure-serving'}
    required_paired = {'short-one', 'unique-prose', 'sampled-short', 'mtp-resource',
                       'distinct-tail', 'complete-repeat', 'unique-with-retention', 'actual-default-one-token'}
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

````

## /tmp/slotstream-optimization-execution/paired-completion-metadata-v234/before/Tools/optimization_prerequisites_test.py

SHA-256 `a5ec0aa30fd4a2b9467a4b9adee29529507bec4e158b91dc2295c1e669f8c881`; 18076 bytes.

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
                     'complete-repeat', 'unique-with-retention', 'actual-default-one-token']:
            entry = self.entry('paired', name)
            gate = {'minimum_pairs': 5, 'replacement_rounds': 0, 'all_outputs_exact': True}
            if name in ['short-one', 'distinct-tail', 'complete-repeat']:
                gate.update(minimum_median_client_reduction=.05, minimum_positive_fraction=.8)
            else:
                gate.update(maximum_median_client_regression=.05, minimum_positive_fraction=0)
            if name in ['unique-prose', 'sampled-short', 'mtp-resource']:
                gate.update(minimum_active_savings_bytes=300_000_000, minimum_sampled_peak_savings_bytes=200_000_000)
            self.write(entry, 'manifest.json', {'protocol': {'rounds': 16,
                'mtp': 'off', 'minimum_output_tokens': 1, 'max_tokens': 1,
                'maximum_sampled_footprint_bytes': 8_100_000_000,
                'arms': {arm: {'chunk': 256, 'env': {}} for arm in ['reference', 'combined']},
                'acceptance': gate,
                'startup_acceptance': {'minimum_pairs': 5, 'maximum_median_first_job_regression': .05,
                    'all_outputs_exact': True}},
                'arm_builds': {arm: self.build for arm in ['reference', 'combined']}})
            self.write(entry, 'completion.json', {'interrupted': False, 'stopped_early': False,
                'planned_cells': 32, 'recorded_cells': 32, 'acceptance': self.decision,
                'startup_acceptance': self.decision})
            rows = [self.response_row(i, arm) for i in range(1, 17) for arm in ['reference', 'combined']]
            self.write(entry, 'results.jsonl', rows)
            for row in rows:
                self.write(entry, f"{row['round']}-{row['arm']}/warmup.json", self.warmup_response(row))
        self.modify('paired', 'actual-default-one-token', 'manifest.json',
            lambda m: m['protocol'].update(arms={'reference': {'chunk': 256, 'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}},
                'combined': {'chunk': 256, 'env': {}}}, max_tokens=1, minimum_output_tokens=1,
                prefix_cache={'retention_only': True, 'expected_reused_tokens': {'reference': 0, 'combined': 0}}))
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

    @staticmethod
    def response_row(number, arm):
        return {'round': number, 'arm': arm, 'valid': True,
            'client_seconds': 1.0, 'startup_seconds': 1.0,
            'startup_and_warmup_valid': True, 'text': 'measured',
            'first_request': {'prompt_ids': [17], 'output_ids': [7], 'text': 'first',
                'effective_mtp': False, 'effective_pool_slots': 640, 'complete_seconds_from_launch': 2.0},
            'metrics': {'schema_version': 1, 'prompt_ids': [101, 102], 'output_ids': [7],
                'effective_mtp': False, 'effective_pool_slots': 640, 'effective_prefill_chunk': 256,
                'stats': {'prefillSeconds': .5, 'decodeSeconds': .5, 'requestSeconds': 1.0,
                    'imageEncodeSeconds': 0.0, 'prefillRecords': 1, 'decodeRecords': 0,
                    'prefillTokens': 2, 'decodeTokens': 1, 'promptTokens': 2, 'prefillPasses': [2],
                    'lifetimeRSSPeakBytes': 1_000_000, 'sampledFootprint': {'peakBytes': 2_000_000}}}}

    def execution_mutation(self, change):
        self.modify('paired', 'unique-prose', 'results.jsonl', lambda rows: change(rows[-1]))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    @staticmethod
    def warmup_response(row):
        metrics = copy.deepcopy(row['metrics'])
        metrics.update({key: row['first_request'][key] for key in
            ['prompt_ids', 'output_ids', 'effective_mtp', 'effective_pool_slots']})
        count = len(metrics['prompt_ids'])
        metrics['stats'].update(promptTokens=count, prefillTokens=count, prefillPasses=[count])
        return {'text': row['first_request']['text'], 'metrics': metrics}

    def test_vm_excluded_warmup_peak_overflow_still_fails(self):
        self.modify('paired', 'unique-prose', 'results.jsonl',
            lambda rows: rows[-1].update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity'))
        self.modify('paired', 'unique-prose', '16-combined/warmup.json',
            lambda warm: warm['metrics']['stats']['sampledFootprint'].update(peakBytes=8_100_000_001))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    def test_warmup_body_must_match_the_captured_first_request(self):
        self.modify('paired', 'unique-prose', '16-combined/warmup.json',
            lambda warm: warm['metrics'].update(output_ids=[8]))
        with self.assertRaisesRegex(ValueError, 'hashed warmup response'):
            self.validate()

    def test_every_warmup_body_requires_an_unchanged_digest(self):
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        path = Path(entry['directory'])/'16-combined/warmup.json'
        path.write_text('{}')
        with self.assertRaisesRegex(ValueError, 'digest differs'):
            self.validate()

    def test_warmup_body_without_a_digest_is_not_accepted(self):
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        del entry['sha256']['16-combined/warmup.json']
        with self.assertRaisesRegex(ValueError, 'digest differs'):
            self.validate()

    def test_vm_excluded_measured_output_change_is_a_correctness_failure(self):
        def mutate(row):
            row.update(valid=False, exclusion='swap activity')
            row['metrics']['output_ids'] = [8]
        self.execution_mutation(mutate)

    def test_excluded_first_output_change_is_a_correctness_failure(self):
        def mutate(row):
            row.update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity')
            row['first_request']['output_ids'] = [8]
        self.execution_mutation(mutate)

    def test_vm_excluded_absolute_peak_overflow_still_fails(self):
        def mutate(row):
            row.update(valid=False, exclusion='swap activity')
            row['metrics']['stats']['sampledFootprint']['peakBytes'] = 8_100_000_001
        self.execution_mutation(mutate)

    def test_request_failure_is_not_a_discardable_timing_sample(self):
        self.execution_mutation(lambda row: row.update(valid=False, error='HTTP 500 fixture'))

    def test_preflight_refusal_leaves_the_final_matrix_incomplete(self):
        def mutate(row):
            row.pop('metrics'); row.pop('first_request')
            row.update(valid=False, error='InsufficientHeadroom fixture')
        self.execution_mutation(mutate)

    def test_completed_wrong_configuration_is_not_a_discardable_sample(self):
        def mutate(row):
            row.update(valid=False)
            row['metrics']['effective_prefill_chunk'] = 512
        self.execution_mutation(mutate)

    def test_wrong_or_truncated_token_metadata_is_not_discardable(self):
        self.execution_mutation(lambda row: row['metrics'].update(output_ids=[]))

    def test_vm_excluded_identical_complete_responses_remain_eligible_for_correctness(self):
        self.modify('paired', 'unique-prose', 'results.jsonl',
            lambda rows: rows[-1].update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity'))
        self.assertEqual(len(self.validate()), 12)

    def test_actual_default_guard_rejects_forced_controls_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p['arms']['combined']['env'].update(SLOTSTREAM_OPT_FINAL_FORWARD='1'))

    def test_actual_default_guard_rejects_disabled_retention_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.pop('prefix_cache'))

    def test_actual_default_guard_rejects_larger_reply_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.update(max_tokens=16, minimum_output_tokens=16))

    def actual_default_mutation(self, change):
        name = 'actual-default-one-token'
        self.modify('paired', name, 'manifest.json', lambda m: change(m['protocol']))
        entry = self.protocol['prerequisites']['paired'][name]
        self.contract['paired_protocols'][name] = json.loads((Path(entry['directory']) / 'manifest.json').read_text())['protocol']
        self.freeze_contract()
        with self.assertRaisesRegex(ValueError, 'actual-default guard'):
            self.validate()

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
        path.parent.mkdir(parents=True, exist_ok=True)
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
            self.assertEqual((summary.call_count, acceptance.call_count, startup.call_count), (8, 8, 8))
            return result

    def test_complete_same_build_evidence_is_recomputed_and_accepted(self):
        self.assertEqual(len(self.validate()), 12)
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

## /tmp/slotstream-optimization-execution/paired-completion-metadata-v234/before/Tools/optimization_soak.py

SHA-256 `8ebbd4fdd6badd2ea34585d15365053f9212b73597c736f461fe17fe3d88e8aa`; 31030 bytes.

````text
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


def validate_prerequisites(protocol, build):
    """Require the final candidate's native and paired evidence before launch.

    Digests bind the exact reports; same-binary/source/Metal identity prevents
    borrowing a passing gate from an earlier implementation. Paired decisions
    are recomputed from their frozen rows using the ordinary benchmark gates.
    """
    required_native = {'combined-plain', 'combined-mtp', 'read-failure-serving'}
    required_paired = {'short-one', 'unique-prose', 'sampled-short', 'mtp-resource',
                       'distinct-tail', 'complete-repeat', 'unique-with-retention', 'actual-default-one-token'}
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

````

## /tmp/slotstream-optimization-execution/paired-completion-metadata-v234/before-tests.txt

SHA-256 `5b17fe63cdeac3ec2f441eeefa57135a0beb1a34fc5cd0ffb31c207a8dde47ae`; 2057 bytes.

````text
....................FFF.......
======================================================================
FAIL: test_reused_and_computed_tokens_must_account_for_the_whole_prompt (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/optimization_prerequisites_test.py", line 168, in test_reused_and_computed_tokens_must_account_for_the_whole_prompt
    self.execution_mutation(lambda row: row['metrics']['stats'].update(reusedPrefixTokens=1))
  File "/Users/carlos/Projects/slotstream/Tools/optimization_prerequisites_test.py", line 90, in execution_mutation
    self.validate()
AssertionError: ValueError not raised

======================================================================
FAIL: test_runtime_error_in_completed_first_metadata_still_fails (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/optimization_prerequisites_test.py", line 156, in test_runtime_error_in_completed_first_metadata_still_fails
    self.validate()
AssertionError: ValueError not raised

======================================================================
FAIL: test_runtime_error_in_completed_measured_metadata_still_fails (__main__.PrerequisiteTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/optimization_prerequisites_test.py", line 150, in test_runtime_error_in_completed_measured_metadata_still_fails
    self.execution_mutation(lambda row: row['metrics']['stats'].update(runtimeError='fixture failure'))
  File "/Users/carlos/Projects/slotstream/Tools/optimization_prerequisites_test.py", line 90, in execution_mutation
    self.validate()
AssertionError: ValueError not raised

----------------------------------------------------------------------
Ran 30 tests in 2.411s

FAILED (failures=3)

````

## /tmp/slotstream-optimization-execution/paired-completion-metadata-v234/manifest.json

SHA-256 `3d839676baeed8c56a0f643726298c84dd4f16a085810b3bf9af5a411184539a`; 1084 bytes.

````text
{
  "scope": "Final prerequisite metadata consistency only; no frozen driver, native source, benchmark, model or build changes",
  "files": [
    {
      "path": "Tools/optimization_soak.py",
      "before_sha256": "8ebbd4fdd6badd2ea34585d15365053f9212b73597c736f461fe17fe3d88e8aa",
      "after_sha256": "424e9ba21eca260b248b216270060a0d82139cc62b96b4a03af9036e8c415cd2"
    },
    {
      "path": "Tools/optimization_prerequisites_test.py",
      "before_sha256": "a5ec0aa30fd4a2b9467a4b9adee29529507bec4e158b91dc2295c1e669f8c881",
      "after_sha256": "215ab0cead0daafd4d95f469254870159c66b9d719997410838cea83c151d41b"
    }
  ],
  "results": [
    {
      "command": [
        "python3",
        "Tools/optimization_prerequisites_test.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 2.457935708,
      "output": "optimization_prerequisites.txt"
    },
    {
      "command": [
        "python3",
        "Tools/optimization_soak_test.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.13735433399999986,
      "output": "optimization_soak.txt"
    }
  ]
}

````

## /tmp/slotstream-optimization-execution/paired-completion-metadata-v234/optimization_prerequisites.txt

SHA-256 `a80efd8a7b7656eec702eb745a279d55320c5e5d2ffb30747fb679ee87db742e`; 129 bytes.

````text
..............................
----------------------------------------------------------------------
Ran 30 tests in 2.394s

OK

````

## /tmp/slotstream-optimization-execution/paired-completion-metadata-v234/optimization_soak.txt

SHA-256 `73a7b18f05bda0ceb0b9d9552ee29762d5c0ab78b6fafd90437e95062fcc01d3`; 110 bytes.

````text
...........
----------------------------------------------------------------------
Ran 11 tests in 0.075s

OK

````
