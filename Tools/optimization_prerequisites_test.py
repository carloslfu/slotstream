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
