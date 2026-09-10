"""Exercise the complete campaign with fixture processes; never load a model."""
import copy
from contextlib import ExitStack
import json
from pathlib import Path
import subprocess
import tempfile
import unittest
from unittest.mock import patch

import optimization_campaign as campaign
from prefill_bench import digest, InsufficientHeadroom


class CampaignTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.binary = self.root / 'fixture build/slotstream'
        self.binary.parent.mkdir()
        identity = {'source': {}}
        for filename, field in [('slotstream', 'binary_sha256'), ('mlx.metallib', 'metallib_sha256'),
                                 ('build-source.tar.gz', 'source_archive_sha256')]:
            path = self.binary.parent / filename
            path.write_bytes(b'non-executable campaign identity fixture: ' + filename.encode())
            identity[field] = digest(path)
        campaign.write_new(self.binary.parent / 'build-identity.json', identity)
        self.packet = self.root / 'campaign'
        self.build = campaign.bench.verified_build(self.binary)
        self.calls = []
        self.corrupt = None
        self.exit_code = 0
        self.vm = {'reclaimable_bytes': 14_000_000_000, 'swapins': 0, 'swapouts': 0}
        self.stack = ExitStack()
        self.addCleanup(self.stack.close)
        self.stack.enter_context(patch.object(campaign, 'preflight', return_value=self.vm))
        self.stack.enter_context(patch.object(campaign, 'pressure_snapshot', return_value={'level': 1}))
        self.stack.enter_context(patch.object(campaign.bench, 'competing_jobs', return_value=[]))
        self.stack.enter_context(patch.object(campaign, 'guarded_run', side_effect=self.fixture_process))
        self.launch = self.stack.enter_context(patch('subprocess.Popen', side_effect=AssertionError('fixture must never launch a process')))
        self.prepared = campaign.prepare(self.binary, self.root / 'missing model', self.packet)

    def fixture_process(self, command, **kwargs):
        """Substitute only the process boundary; use real serializers/assessors."""
        self.calls.append(command)
        if command[1] == 'optimization-state-check':
            variant = command[command.index('--variant') + 1]
            name = {'integrated': 'optimization-integrated', 'integrated-mtp': 'optimization-integrated-mtp',
                    'read-failure-serving': 'optimization-read-failure-serving'}[variant]
            report = {'name': name, 'passed': True, 'items': [{'name': 'fixture assertion', 'passed': True}]}
            if self.corrupt:
                self.corrupt(report)
            kwargs['stdout'].write(json.dumps(report))
            kwargs['stdout'].flush()
        else:
            protocol = campaign.read(command[command.index('--protocol') + 1])
            target = Path(command[command.index('--out') + 1])
            target.mkdir()
            if Path(command[1]).name == 'serve_bench.py':
                self.paired_fixture(target, protocol)
            else:
                self.soak_fixture(target, protocol)
        return subprocess.CompletedProcess(command, self.exit_code)

    @staticmethod
    def metrics(count, outputs, *, candidate=False, reused=0, mtp=False):
        computed = count - reused
        return {'schema_version': 1, 'prompt_ids': list(range(100, 100 + count)),
            'output_ids': [7] * outputs, 'effective_mtp': mtp,
            'effective_pool_slots': 640, 'effective_prefill_chunk': 256,
            'stats': {'prefillSeconds': .5 if computed else 0, 'decodeSeconds': .5,
                'requestSeconds': .8 if candidate else 1.0, 'imageEncodeSeconds': 0.0,
                'prefillRecords': 1 if computed else 0, 'decodeRecords': 0,
                'prefillTokens': computed, 'decodeTokens': outputs, 'promptTokens': count,
                'prefillPasses': [computed] if computed else [], 'prefillComputePasses': [computed] if computed else [],
                'prefillReadBytes': 10 if computed else 0, 'reusedPrefixTokens': reused,
                'completePromptHits': int(reused == count), 'completePromptStores': 0,
                'draftedTokens': 0, 'verifyPasses': 0, 'lifetimeRSSPeakBytes': 2_000_000_000,
                'mlxActiveEndBytes': 500_000_000 if candidate else 1_000_000_000,
                'sampledFootprint': {'peakBytes': 1_500_000_000 if candidate else 2_000_000_000}}}

    def paired_fixture(self, target, protocol):
        campaign.write_new(target / 'manifest.json', {'protocol': protocol,
            'arm_builds': {arm: self.build for arm in ['reference', 'combined']}})
        filename = Path(protocol['fixture']).name
        count = 17 if filename == 'short.txt' else 445 if filename == 'prose-distinct-tail.txt' else 440
        warm_name = Path(protocol.get('warmup_fixture', protocol['fixture'])).name
        warm_count = 17 if warm_name == 'short.txt' else 440
        rows = []
        for number in range(1, 17):
            for arm in ('reference', 'combined'):
                candidate = arm == 'combined'
                reused = protocol.get('prefix_cache', {}).get('expected_reused_tokens', {}).get(arm, 0)
                args = {'outputs': protocol['max_tokens'], 'candidate': candidate, 'mtp': protocol['mtp'] == 'on'}
                metrics = self.metrics(count, reused=reused, **args)
                warm = self.metrics(warm_count, **args)
                row = {'round': number, 'arm': arm, 'valid': True,
                    'client_seconds': .8 if candidate else 1.0, 'startup_seconds': 1.0,
                    'startup_and_warmup_valid': True, 'text': 'measured fixture', 'metrics': metrics,
                    'first_request': {k: warm[k] for k in ['prompt_ids', 'output_ids', 'effective_mtp', 'effective_pool_slots']}}
                row['first_request'].update(text='first fixture', complete_seconds_from_launch=2.0)
                cell = target / f'{number}-{arm}'
                cell.mkdir()
                campaign.write_new(cell / 'warmup.json', {'text': 'first fixture', 'metrics': warm})
                rows.append(row)
        if self.corrupt:
            self.corrupt(rows)
        (target / 'results.jsonl').write_text(''.join(json.dumps(row) + '\n' for row in rows))
        summary = campaign.bench.summaries(rows, 'reference', protocol['comparison_basis'], protocol.get('required_equal_work'))
        campaign.write_new(target / 'completion.json', {'interrupted': False, 'stopped_early': False,
            'planned_cells': 32, 'recorded_cells': len(rows),
            'acceptance': campaign.bench.acceptance_results(summary, protocol['acceptance']),
            'startup_acceptance': campaign.bench.startup_acceptance_results(rows, 'reference', protocol['startup_acceptance'])})

    def soak_fixture(self, target, protocol):
        rows = []
        vm = {'swapins': 0, 'swapouts': 0}
        system = {'thermalState': 'nominal', 'lowPowerModeEnabled': False}
        for cycle in range(-2, 8):
            for item in protocol['sequence']:
                metrics = self.metrics(17, item['outputs'], mtp=protocol['mtp'] == 'on')
                metrics['stats'].update(physicalFootprintEndBytes=2_000_000_000,
                    embeddingCachedPayloadBytes=1000, embeddingRowsEnabled=True,
                    generatorVMBefore=vm, generatorVMAfter=vm,
                    generatorSystemBefore=system, generatorSystemAfter=system)
                image = 'image' in item
                if image:
                    metrics['stats']['imagePreparation'] = {'sampledFootprint': {'peakBytes': 2_000_000_000, 'samples': 2},
                        'seconds': 1.0, 'sourceDecodeSeconds': .1, 'towerReadySeconds': .1}
                rows.append({'cycle': cycle, 'name': item['name'], 'succeeded': True,
                    'before': vm, 'after': vm, 'has_image': image, 'text': 'soak fixture', 'metrics': metrics,
                    'prefix': {'enabled': True, 'conversations': 4, 'charged_token_capacity': 256, 'max_tokens': 8192}})
        if self.corrupt:
            self.corrupt(rows)
        assessment = campaign.soak.assess(protocol, rows)
        (target / 'results.jsonl').write_text(''.join(json.dumps(row) + '\n' for row in rows))
        campaign.write_new(target / 'assessment.json', assessment)
        campaign.write_new(target / 'manifest.json', {'protocol': protocol, 'build': self.build, 'passed': assessment['passed']})

    def complete_native(self):
        for _ in range(3):
            self.assertTrue(campaign.run_one(self.packet)['passed'])

    def test_preparation_binds_all_stages_and_launches_nothing(self):
        self.assertEqual(self.prepared['stages'], 13)
        self.assertFalse(self.prepared['launched'])
        result = campaign.status(self.packet)
        self.assertFalse(result['qualification_complete'])
        self.assertEqual([r['status'] for r in result['stages']], ['unrun'] * 13)
        contract = campaign.read(self.packet / 'qualification-contract.json')
        self.assertEqual(contract['paired_protocols']['actual-default-one-token']['arms']['combined']['env'], {})
        self.assertEqual(set(contract['soak_modes']), {'off', 'on'})
        self.assertEqual(self.calls, [])
        self.launch.assert_not_called()

    def test_full_process_fixture_advances_once_in_order_and_recomputes_all_gates(self):
        for stage in campaign.STAGES:
            result = campaign.run_one(self.packet)
            self.assertEqual(result['stage'], stage)
            self.assertTrue(result['passed'])
        result = campaign.run_one(self.packet)
        self.assertTrue(result['qualification_complete'])
        self.assertFalse(result['activation_performed'])
        self.assertEqual(len(self.calls), 13)
        self.assertEqual(sum(r.get('cells', 0) for r in result['stages']), 256)
        self.assertEqual(sum(r.get('requests', 0) for r in result['stages']), 120)
        self.launch.assert_not_called()

    def test_insufficient_memory_refuses_before_attempt_and_does_not_consume_a_cell(self):
        with patch.object(campaign, 'preflight', side_effect=InsufficientHeadroom('fixture memory refusal')):
            with self.assertRaises(InsufficientHeadroom):
                campaign.run_one(self.packet)
        self.assertFalse((self.packet / 'native/combined-plain').exists())
        self.assertEqual(self.calls, [])

    def test_native_skip_or_false_pass_stops_without_retry(self):
        self.corrupt = lambda report: report.update(skipped='fixture unavailable')
        with self.assertRaisesRegex(ValueError, 'native evidence'):
            campaign.run_one(self.packet)
        with self.assertRaisesRegex(ValueError, 'cannot be retried'):
            campaign.run_one(self.packet)
        self.assertEqual(len(self.calls), 1)

    def test_native_failed_assertion_cannot_hide_behind_a_passed_report(self):
        self.corrupt = lambda report: report['items'][0].update(passed=False)
        with self.assertRaisesRegex(ValueError, 'native evidence'):
            campaign.run_one(self.packet)
        self.assertFalse(campaign.read(self.packet / 'native/combined-plain/evidence/manifest.json')['passed'])

    def test_process_failure_and_cancellation_preserve_attempts_and_stop(self):
        with patch.object(campaign, 'guarded_run', side_effect=KeyboardInterrupt('fixture cancelled')):
            with self.assertRaisesRegex(ValueError, 'stage failed'):
                campaign.run_one(self.packet)
        receipt = campaign.read(self.packet / 'native/combined-plain/receipt.json')
        self.assertIn('KeyboardInterrupt', receipt['error'])
        with self.assertRaisesRegex(ValueError, 'cannot be retried'):
            campaign.run_one(self.packet)

    def test_native_only_boundary_does_not_waive_actual_soak_prerequisites(self):
        self.complete_native()
        _, _, contract = campaign.load_packet(self.packet)
        protocol = campaign.prerequisite_protocol(self.packet, contract)
        self.assertIn('combined-plain', campaign.soak.validate_prerequisites(protocol, self.build, native_only=True))
        with self.assertRaisesRegex(ValueError, 'complete paired'):
            campaign.soak.validate_prerequisites(protocol, self.build)

    def test_completed_vm_exclusion_may_pass_but_wrong_excluded_output_cannot(self):
        self.complete_native()
        self.exit_code = 1  # The unchanged benchmark returns 1 for any timing exclusion.
        self.corrupt = lambda rows: rows[-1].update(valid=False, startup_and_warmup_valid=False)
        self.assertTrue(campaign.run_one(self.packet)['passed'])
        def wrong(rows):
            rows[-1].update(valid=False, startup_and_warmup_valid=False)
            rows[-1]['metrics']['output_ids'][0] = 99
        self.corrupt = wrong
        with self.assertRaisesRegex(ValueError, 'input/output differs'):
            campaign.run_one(self.packet)

    def test_frozen_contract_and_build_changes_refuse_before_launch(self):
        self.binary.write_bytes(b'changed fixture')
        with self.assertRaisesRegex(ValueError, 'identity mismatch'):
            campaign.run_one(self.packet)
        self.assertEqual(self.calls, [])

    def rewrite_contract(self, change):
        path = self.packet / 'qualification-contract.json'
        contract = campaign.read(path)
        change(contract)
        path.write_text(json.dumps(contract))
        path = self.packet / 'packet.json'
        packet = campaign.read(path)
        packet['contract_sha256'] = digest(self.packet / 'qualification-contract.json')
        path.write_text(json.dumps(packet))

    def test_incomplete_contract_refuses_even_with_a_matching_file_hash(self):
        self.rewrite_contract(lambda contract: contract['paired_protocols'].pop('actual-default-one-token'))
        with self.assertRaisesRegex(ValueError, 'complete same-build'):
            campaign.run_one(self.packet)
        self.assertEqual(self.calls, [])

    def test_native_command_cannot_redirect_execution(self):
        self.rewrite_contract(lambda contract: contract['native']['combined-plain']['command'].__setitem__(0, '/unused/different-program'))
        with self.assertRaisesRegex(ValueError, 'native command'):
            campaign.run_one(self.packet)
        self.assertEqual(self.calls, [])

    def test_soak_workload_cannot_change_after_paired_studies_are_frozen(self):
        self.rewrite_contract(lambda contract: contract['soak_modes']['off'].update(env={'SLOTSTREAM_OPT_COMPLETE_PROMPT': '0'}))
        with self.assertRaisesRegex(ValueError, 'soak mode differs'):
            campaign.run_one(self.packet)
        self.assertEqual(self.calls, [])

    def test_edited_completed_evidence_cannot_be_reused(self):
        campaign.run_one(self.packet)
        path = self.packet / 'native/combined-plain/evidence/stdout.txt'
        report = campaign.read(path)
        report['items'][0]['name'] = 'changed fixture assertion'
        path.write_text(json.dumps(report))
        state = campaign.status(self.packet)
        self.assertEqual(state['stages'][0]['status'], 'incomplete_or_failed')
        self.assertIn('evidence changed', state['stages'][0]['error'])


if __name__ == '__main__':
    unittest.main()
