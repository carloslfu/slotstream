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
