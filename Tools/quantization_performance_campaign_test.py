"""Tiny evidence and child-process fixtures; no model, compiler or weights."""
import copy
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import time
import unittest
from unittest.mock import patch

import quantization_performance_campaign as m


VM = {'reclaimable_bytes': 20_000_000_000, 'reclaimableBytes': 20_000_000_000, 'swapins': 3, 'swapouts': 4}


class PerformanceCampaignChecks(unittest.TestCase):
    def fixture(self, root, *, scope='pilot', repetitions=3, profiles=1):
        root = Path(root).resolve()
        paths = {'binary': 'native/slotstream', 'metallib': 'native/mlx.metallib',
                 'build_identity': 'native/build-identity.json', 'source_archive': 'native/build-source.tar.gz',
                 'control': 'control', 'rotary': 'angles.bin', 'baseline': str(root / 'original')}
        blobs = {'native/slotstream': b'unexecuted binary fixture', 'native/mlx.metallib': b'Metal fixture',
                 'native/build-source.tar.gz': b'source fixture', 'control/manifest.json': b'{}', 'angles.bin': b'angles'}
        for name, raw in blobs.items():
            path = root / name; path.parent.mkdir(parents=True, exist_ok=True); path.write_bytes(raw)
        identity = {key: m.digest(root / name) for key, name in
                    [('binary_sha256', paths['binary']), ('metallib_sha256', paths['metallib']), ('source_archive_sha256', paths['source_archive'])]}
        m.write(root / paths['build_identity'], identity)
        pins = {**m.MANIFESTS, 'candidate': m.digest(root / 'control/manifest.json')}
        mocks = [patch.object(m, 'MANIFESTS', pins), patch.object(m, 'ROTARY', m.digest(root / paths['rotary']))]
        for mock in mocks: mock.start(); self.addCleanup(mock.stop)
        cases = [{'id': 'fixed', 'work': 'fixed', 'prompt_tokens': [12, 13], 'output_tokens': 128,
                  'prefix': 'reset', 'minimum_reused_tokens': 0},
                 {'id': 'short', 'work': 'natural', 'prompt_tokens': [12, 13, 14], 'output_tokens': 128,
                  'prefix': 'retain', 'minimum_reused_tokens': 2}]
        native = {'schema': 1, 'kind': 'same-model-engine-performance-v1', 'scope': scope, 'artifact': 'original',
                  'memory_bytes': 14_000_000_000, 'memory_mode': 'ceiling', 'context_limit': 32768,
                  'draft_mode': 'on', 'draft_depth': 2, 'draft_placement': 'streamed', 'lookahead': 'off',
                  'original_correction_sha256': None, 'prefix_cache': True, 'live_memory': 'automatic',
                  'gpu_keep_alive': 'auto', 'maximum_seconds': 1800, 'request_seconds': 600, 'seed': 7,
                  'tokenizer_sha256': 'fixture-tokenizer', 'cases': cases}
        declared = []
        for index in range(profiles):
            name = 'profile-' + str(index); arms = {}
            for arm in m.ARMS:
                path = name + '-' + arm + '.json'; arms[arm] = path
                n = {**native, 'artifact': 'original' if arm == 'original' else 'affine3'}
                m.write(root / path, n)
            declared.append({'id': name, 'arms': arms, 'gate_cases': ['fixed']})
        basis = None
        if scope == 'held-out':
            m.write(root / 'pilot-analysis.json', {'kind': m.KIND, 'scope': 'pilot', 'complete': True,
                    'all_timings_eligible': True, 'natural_completion_complete': True, 'qualification': False})
            basis = {'analysis': 'pilot-analysis.json', 'rationale': 'Prospective run-level rank precision from the complete pilot.'}
        files = {str(path.relative_to(root)): m.digest(path) for path in root.rglob('*') if path.is_file()}
        protocol = {'schema': 1, 'kind': m.KIND, 'scope': scope, 'driver_sha256': m.digest(m.__file__),
                    'helper_sha256': m.helper_pins(), 'files': files, 'paths': paths, 'profiles': declared,
                    'repetitions': repetitions, 'eligibility': m.ELIGIBILITY, 'sampling_basis': basis,
                    'latency_max_ratio': {'request': 1.1, 'first_text': 1.1, 'load': 1.1} if scope == 'held-out' else None,
                    'resource': {'maximum_parent_bytes': 256_000_000, 'maximum_campaign_seconds': 3600,
                        'maximum_output_bytes': 100_000_000, 'maximum_research_staging_bytes': 430_000_000_000,
                        'headroom_bytes': 3_000_000_000, 'new_weight_bytes': 0, 'new_raw_logit_bytes': 0, 'paid_compute_usd': 0}}
        m.validate(protocol, root)
        return root, protocol

    def receipt(self, native, sha, arm):
        resource = 'original-affine4-memory-v1' if arm == 'original' else 'affine3-grouped-memory-v1'
        plan = {'source': 'auto', 'resource_profile': resource, 'target_gb': 14, 'memory_limit_gb': 14,
                'max_context_tokens': 32768, 'vision': False, 'runtime_prefix_cache_enabled': True,
                'memory_ledger': {'expected_peak_bytes': 13_999_999_999}, 'mtp': True, 'mtp_streamed_experts': True,
                'decode_lookahead': False, 'pool_slots': 1000, 'prefill_chunk': 512, 'prefix_cache_max_tokens': 8192}
        rows = []
        for case in native['cases']:
            count = case['output_tokens'] if case['work'] == 'fixed' else 1
            rate = 25 if arm == 'candidate' else 12
            decode = max(.1, (count - 1) / rate)
            stats = {'decodeTokens': count, 'decodeSeconds': decode, 'interTokenSeconds': [1 / rate] * (count - 1),
                     'firstTokenSeconds': .5, 'firstTextSeconds': .55, 'finishReason': 'length' if case['work'] == 'fixed' else 'stop',
                     'reusedPrefixTokens': case['minimum_reused_tokens'], 'promptTokens': len(case['prompt_tokens']),
                     'sampledFootprint': {'samples': 2, 'peakBytes': 9_000_000_000}, 'lifetimePhysicalFootprintPeakBytes': 9_000_000_000,
                     'peakMemoryGB': 9, 'generatorSystemBefore': m.NORMAL, 'generatorSystemAfter': m.NORMAL,
                     'generatorVMBefore': dict(VM), 'generatorVMAfter': dict(VM)}
            rows.append({'id': case['id'], 'work': case['work'], 'prefix': case['prefix'], 'prompt_tokens': case['prompt_tokens'],
                         'output_tokens': [15] * count, 'stats': stats, 'request_wall_seconds': decode + 1,
                         'visible_text_retokenized_tokens': count, 'text_emissions': [{'seconds': .56, 'utf8_bytes': count}],
                         'natural_task_completed': case['work'] == 'natural', 'operating_conditions': [m.NORMAL],
                         'vm_before': dict(VM), 'vm_after': dict(VM), 'plan_before': copy.deepcopy(plan), 'plan_after': copy.deepcopy(plan)})
        return {'schema': 1, 'complete': True, 'loaded': True, 'plan_only': False, 'qualification': False,
                'protocol_sha256': sha, 'scope': native['scope'], 'artifact': native['artifact'], 'baseline_revision': m.REVISION,
                'resource_identity': resource, 'artifact_manifest_sha256': m.MANIFESTS[arm],
                'memory_ceiling_bytes': native['memory_bytes'], 'required_preflight_bytes': native['memory_bytes'] + 3_000_000_000,
                'preflight': dict(VM),
                'peak_process_bytes': 9_000_000_000, 'load_seconds': 3, 'seconds': 30, 'original_correction_sha256': None,
                'plan': plan, 'cases': rows, 'load_conditions': m.NORMAL}

    def observation(self):
        return {'complete': True, 'exit_code': 0, 'samples': 10, 'peak_model_bytes': 9_000_000_000,
                'before': dict(VM), 'after': dict(VM), 'timing_exclusions': []}

    def execute(self, root, protocol, *, mutation=None, failure=None):
        path = root / 'protocol.json'; m.write(path, protocol); sha = m.digest(path); trace = []
        def cell(command, destination, native, protocol, *args):
            destination.mkdir(); (destination / 'native').mkdir()
            arm = 'candidate' if '--control' in command else 'original'
            trace.append(arm)
            native_sha = command[command.index('--protocol-sha256') + 1]
            receipt, observation = self.receipt(native, native_sha, arm), self.observation()
            if mutation: mutation(receipt, observation, len(trace))
            m.write(destination / 'native/receipt.json', receipt)
            m.write(destination / 'supervision.json', observation)
            if failure: raise RuntimeError(failure)
            return observation
        with patch.object(m, 'run_cell', side_effect=cell), patch.object(m, 'resource_check'), patch.object(m, 'allocated', return_value=0):
            result = m.run(path, sha, root, root / 'run')
        return path, sha, result, trace

    def test_complete_adjacent_pairs_preserve_single_token_latency_and_final_bound(self):
        for scope, repetitions in [('pilot', 3), ('held-out', 8)]:
            with self.subTest(scope=scope), tempfile.TemporaryDirectory() as directory:
                root, protocol = self.fixture(directory, scope=scope, repetitions=repetitions, profiles=2)
                path, sha, result, trace = self.execute(root, protocol)
                self.assertEqual(trace[:8], ['original', 'candidate', 'original', 'candidate', 'candidate', 'original', 'candidate', 'original'])
                self.assertEqual(len(result['cells']), 4 * repetitions)
                analysis = m.analyze(path, sha, root, root / 'run')
                self.assertTrue(analysis['all_timings_eligible']); self.assertFalse(analysis['qualification'])
                self.assertEqual(analysis['speed_gate_passed'], scope == 'held-out')
                self.assertEqual(analysis['performance_gate_passed'], scope == 'held-out')
                self.assertEqual(analysis['latency_gate_passed'], scope == 'held-out')
                self.assertEqual(analysis['comparison_count'], 8)
                short = analysis['scenarios']['profile-0/short']['medians']['candidate']
                self.assertIsNone(short['conservative_generation_tps']); self.assertEqual(short['request_seconds'], 1.1)
                self.assertEqual(analysis['scenarios']['profile-0/fixed']['median_paired_throughput_ratio'], 25 / 12)
                with self.assertRaises(FileExistsError): m.run(path, sha, root, root / 'run')

    def test_exclusions_never_select_a_favorable_subset_or_stop_collection(self):
        variants = [lambda r, o: o['after'].update(swapouts=5),
                    lambda r, o: o['timing_exclusions'].append('sampled competing CPU or known build/storage job'),
                    lambda r, o: r['cases'][0]['plan_before'].update(pool_slots=500),
                    lambda r, o: r['cases'][0]['operating_conditions'].append({'thermalState': 'fair', 'lowPowerModeEnabled': False})]
        for mutation in variants:
            with self.subTest(mutation=mutation), tempfile.TemporaryDirectory() as directory:
                root, protocol = self.fixture(directory)
                def change(r, o, i):
                    if i == 2: mutation(r, o)
                path, sha, result, trace = self.execute(root, protocol, mutation=change)
                self.assertEqual(len(trace), 6)
                analysis = m.analyze(path, sha, root, root / 'run')
                self.assertFalse(analysis['all_timings_eligible']); self.assertFalse(analysis['speed_gate_passed'])
                self.assertEqual(len(analysis['excluded_cells']), 1); self.assertNotIn('scenarios', analysis)

    def test_fast_decode_cannot_hide_slow_complete_response_first_text_or_startup(self):
        for metric in ('request', 'first_text', 'load'):
            with self.subTest(metric=metric), tempfile.TemporaryDirectory() as directory:
                root, protocol = self.fixture(directory, scope='held-out', repetitions=8)
                def slow(r, o, i):
                    if r['artifact'] != 'affine3': return
                    if metric == 'load': r['load_seconds'] *= 2
                    elif metric == 'request': r['cases'][1]['request_wall_seconds'] *= 2
                    else:
                        r['cases'][1]['text_emissions'][0]['seconds'] = 1.0
                        r['cases'][1]['stats']['firstTextSeconds'] = .99
                path, sha, _, _ = self.execute(root, protocol, mutation=slow)
                result = m.analyze(path, sha, root, root / 'run')
                self.assertTrue(result['speed_gate_passed']); self.assertFalse(result['latency_gate_passed'])
                self.assertFalse(result['performance_gate_passed']); self.assertFalse(result['qualification'])

    def test_truncated_natural_response_keeps_evidence_but_cannot_complete_performance(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol = self.fixture(directory)
            def truncate(r, o, i):
                if i != 2: return
                old = r['cases'][1]; fixed = copy.deepcopy(r['cases'][0])
                fixed.update(id=old['id'], work='natural', prefix=old['prefix'], prompt_tokens=old['prompt_tokens'], natural_task_completed=False)
                fixed['stats'].update(promptTokens=3, reusedPrefixTokens=2)
                r['cases'][1] = fixed
            path, sha, _, _ = self.execute(root, protocol, mutation=truncate)
            result = m.analyze(path, sha, root, root / 'run')
            self.assertTrue(result['complete']); self.assertTrue(result['all_timings_eligible'])
            self.assertFalse(result['natural_completion_complete']); self.assertFalse(result['performance_gate_passed'])
            self.assertEqual(len(result['incomplete_natural_answers']), 1); self.assertNotIn('scenarios', result)

    def test_freeze_rejects_identity_envelope_sample_and_work_changes(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol = self.fixture(directory)
            edits = [lambda p: p.update(extra=True), lambda p: p.update(repetitions=True),
                     lambda p: p.update(driver_sha256='0' * 64), lambda p: p.update(helper_sha256={}),
                     lambda p: p['resource'].update(headroom_bytes=2_000_000_000),
                     lambda p: p['resource'].update(maximum_parent_bytes=True),
                     lambda p: p['resource'].update(new_weight_bytes=1),
                     lambda p: p['profiles'][0].update(gate_cases=['short']),
                     lambda p: p['profiles'].append(copy.deepcopy(p['profiles'][0])),
                     lambda p: p.update(scope='held-out')]
            for edit in edits:
                changed = copy.deepcopy(protocol); edit(changed)
                with self.assertRaises((ValueError, KeyError, TypeError)): m.validate(changed, root)
            candidate = root / protocol['profiles'][0]['arms']['candidate']
            n = m.read(candidate); n['cases'][0]['prompt_tokens'].append(99); m.write(candidate, n)
            changed = copy.deepcopy(protocol); changed['files'][str(candidate.relative_to(root))] = m.digest(candidate)
            with self.assertRaisesRegex(ValueError, 'shared work'): m.validate(changed, root)
        with tempfile.TemporaryDirectory() as directory:
            root, protocol = self.fixture(directory, scope='held-out', repetitions=8)
            for limits in (None, {'request': 1.1}, {'request': 1.26, 'first_text': 1.1, 'load': 1.1}):
                changed = copy.deepcopy(protocol); changed['latency_max_ratio'] = limits
                with self.assertRaisesRegex(ValueError, 'latency margins'): m.validate(changed, root)
            protocol['repetitions'] = 3
            with self.assertRaisesRegex(ValueError, 'enough independent'): m.validate(protocol, root)

    def test_unexpected_native_work_features_and_missing_memory_are_not_timings(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol = self.fixture(directory)
            native = m.validate(protocol, root)['profile-0']['candidate']
            receipt = self.receipt(native, '1' * 64, 'candidate')
            m.validate_native(receipt, native, '1' * 64, 'candidate')
            edits = [lambda r: r.update(loaded=False), lambda r: r.update(plan_only=True),
                     lambda r: r.update(qualification=True), lambda r: r.update(artifact_manifest_sha256='0' * 64),
                     lambda r: r.update(peak_process_bytes=0), lambda r: r.update(complete=False),
                     lambda r: r.update(preflight={'reclaimableBytes': 16_999_999_999}),
                     lambda r: r['plan'].update(memory_limit_gb=20), lambda r: r['plan'].update(mtp=False),
                     lambda r: r['plan'].update(resource_profile='original-affine4-memory-v1'),
                     lambda r: r['cases'][0]['stats'].update(decodeTokens=127),
                     lambda r: r['cases'][0]['stats'].update(peakMemoryGB=15),
                     lambda r: r['cases'][0]['stats'].update(sampledFootprint={}),
                     lambda r: r['cases'][1]['stats'].update(reusedPrefixTokens=0),
                     lambda r: r['cases'][1].update(natural_task_completed=False), lambda r: r['cases'].reverse()]
            for edit in edits:
                changed = copy.deepcopy(receipt); edit(changed)
                with self.assertRaises((ValueError, KeyError, TypeError)): m.validate_native(changed, native, '1' * 64, 'candidate')

    def test_complete_receipt_custody_and_recomputed_eligibility(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol = self.fixture(directory); path, sha, result, _ = self.execute(root, protocol)
            native_path = root / 'run/cell-0000/native/receipt.json'; receipt = m.read(native_path)
            receipt['cases'][0]['stats']['decodeSeconds'] = 1; m.write(native_path, receipt)
            with self.assertRaisesRegex(ValueError, 'identity'): m.analyze(path, sha, root, root / 'run')
        with tempfile.TemporaryDirectory() as directory:
            root, protocol = self.fixture(directory); path, sha, result, _ = self.execute(root, protocol)
            result['cells'][0]['timing_exclusions'] = ['invented']; m.write(root / 'run/coordinator.json', result)
            with self.assertRaisesRegex(ValueError, 'eligibility'): m.analyze(path, sha, root, root / 'run')

    def test_partial_execution_is_preserved_and_cannot_be_retried_or_analyzed(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol = self.fixture(directory)
            with self.assertRaisesRegex(RuntimeError, 'injected child failure'): self.execute(root, protocol, failure='injected child failure')
            path = root / 'protocol.json'; sha = m.digest(path); record = m.read(root / 'run/coordinator.json')
            self.assertFalse(record['complete']); self.assertIn('injected child failure', record['failure'])
            self.assertEqual(record['cells'], []); self.assertTrue((root / 'run/cell-0000/native/receipt.json').exists())
            with self.assertRaises(FileExistsError): m.run(path, sha, root, root / 'run')
            with self.assertRaisesRegex(ValueError, 'complete frozen'): m.analyze(path, sha, root, root / 'run')

    def test_paging_and_contention_are_typed_and_never_save_arguments(self):
        self.assertFalse(m.paging(VM, VM))
        with self.assertRaises(ValueError): m.paging(VM, {**VM, 'swapins': 2})
        with self.assertRaises(ValueError): m.paging(VM, {**VM, 'swapins': True})
        with patch.object(m.subprocess, 'check_output', return_value='1 90.0\n2 60.0\n3 0.0\n'), \
             patch.object(m, 'competing_jobs', return_value=[{'pid': 2, 'kind': 'Swift build', 'executable': '/private/name/secret'}]):
            result = m.contention({1})
            self.assertEqual(result, {'busy_processes': [{'pid': 2, 'cpu_percent': 60.0}], 'known_jobs': [{'pid': 2, 'kind': 'Swift build'}]})
            self.assertNotIn('secret', json.dumps(result))

    def test_resource_ceilings_and_complete_receipt_reservation_refuse_before_launch(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol = self.fixture(directory)
            with patch.object(m, 'allocated', return_value=0), patch.object(m, 'physical_bytes', return_value=1):
                m.resource_check(root, root, protocol, time.monotonic())
            for physical, allocated in [(256_000_001, 0), (1, 100_000_001)]:
                with patch.object(m, 'allocated', return_value=allocated), patch.object(m, 'physical_bytes', return_value=physical):
                    with self.assertRaises((RuntimeError, MemoryError)): m.resource_check(root, root, protocol, time.monotonic())
            with self.assertRaises(TimeoutError): m.resource_check(root, root, protocol, time.monotonic() - 3601)
            path = root / 'protocol.json'; m.write(path, protocol)
            with patch.object(m, 'resource_check'), patch.object(m, 'allocated', return_value=429_999_999_999), patch.object(m, 'run_cell') as launch:
                with self.assertRaisesRegex(RuntimeError, 'reservation does not fit'):
                    m.run(path, m.digest(path), root, root / 'run')
                launch.assert_not_called()
            record = m.read(root / 'run/coordinator.json')
            self.assertFalse(record['complete']); self.assertEqual(record['cells'], [])

    def process(self, directory, script, *, physical=1_000_000, after_failure=False):
        root = Path(directory); destination = root / 'cell'
        native = {'memory_bytes': 14_000_000_000, 'maximum_seconds': 10}
        protocol = {'resource': {'maximum_campaign_seconds': 60}}
        fake_vm = [dict(VM), RuntimeError('post-exit observation failed')] if after_failure else None
        check_output = subprocess.check_output
        def read_only_command(command, **kwargs):
            if command[:1] == ['sysctl']: return '1'
            return check_output(command, **kwargs)
        with patch.object(m, 'resource_check'), patch.object(m, 'quiet_preflight', return_value=dict(VM)), \
             patch.object(m, 'observe', return_value={'ready': True, 'conditions': m.NORMAL}), \
             patch.object(m, 'contention', return_value={'busy_processes': [], 'known_jobs': []}), \
             patch.object(m, 'physical_bytes', return_value=physical), \
             patch.object(m, 'vm_snapshot', side_effect=fake_vm, return_value=dict(VM)), \
             patch.object(m.subprocess, 'check_output', side_effect=read_only_command):
            return m.run_cell([sys.executable, '-c', script], destination, native, protocol, root, root, time.monotonic())

    def test_real_tiny_child_completion_and_physical_failure_drain_before_return(self):
        with tempfile.TemporaryDirectory() as directory:
            result = self.process(directory, 'import time; time.sleep(.05); print("finished")')
            self.assertTrue(result['complete']); self.assertEqual(result['exit_code'], 0)
            self.assertGreaterEqual(result['release_settle_seconds'], 1.05)
            self.assertEqual((Path(directory) / 'cell/stdout.txt').read_text().strip(), 'finished')
            with self.assertRaises(ProcessLookupError): os.kill(result['pid'], 0)
        with tempfile.TemporaryDirectory() as directory:
            with self.assertRaisesRegex(MemoryError, 'physical ceiling'):
                self.process(directory, 'import time; time.sleep(60)', physical=15_000_000_000)
            result = m.read(Path(directory) / 'cell/supervision.json')
            self.assertFalse(result['complete']); self.assertIn('physical ceiling', result['failure'])
            self.assertNotEqual(result['exit_code'], 0)
            with self.assertRaises(ProcessLookupError): os.kill(result['pid'], 0)
        with tempfile.TemporaryDirectory() as directory:
            with self.assertRaisesRegex(RuntimeError, 'post-exit observation failed'):
                self.process(directory, 'import time; time.sleep(.05)', after_failure=True)
            result = m.read(Path(directory) / 'cell/supervision.json')
            self.assertFalse(result['complete']); self.assertIn('post-exit observation', result['cleanup_failure'])
            with self.assertRaises(ProcessLookupError): os.kill(result['pid'], 0)


if __name__ == '__main__': unittest.main()
