#!/usr/bin/env python3
"""Weight-free rejection tests for the capacity evidence boundary."""
import copy
import fcntl
import hashlib
import io
import json
from pathlib import Path
import tarfile
import tempfile
import unittest
from unittest.mock import patch

import context_qualification as gate


def delivery():
    vm = {'swapins': 3, 'swapouts': 4}
    return {
        'fits': True, 'aborted': None, 'prompt_ids': list(range(16)),
        'output_ids': list(range(16)), 'configured_context': 32,
        'model_revision': 'frozen', 'compute_passes': [16], 'compute_key_extents': [16], 'compute_query_rows': [16],
        'memory_ledger': {'expected_peak_bytes': 8_000_000_000},
        'optimizations': {'workspaceTokenTile': 256, 'compactStateWindows': False},
        'stats': {'promptTokens': 16, 'prefillTokens': 16, 'decodeTokens': 16,
                  'contextArithmetic': 'standard', 'mlxPeakMemoryGB': 6.0,
                  'sampledFootprint': {'peakBytes': 7_000_000_000, 'samples': 3, 'intervalMilliseconds': 20},
                  'lifetimeRSSPeakBytes': 7_000_000_000, 'physicalFootprintEndBytes': 6_000_000_000,
                  'generatorVMBefore': vm.copy(), 'generatorVMAfter': vm.copy()}}


def retained_delivery():
    result = delivery()
    snapshot = {'enabled': True, 'max_conversations': 4, 'conversations': 4,
                'held_tokens': 80, 'charged_token_capacity': 4096,
                'allocated_sequence_bytes': 4096*27648, 'max_tokens': 8192}
    warmup = []
    for phase in (0, 1):
        for conversation in range(4):
            ids = list(range(conversation*16, (conversation+1)*16))
            reuse = 0
            if phase == 1:
                ids += [123, 1000+conversation]; reuse = 17
            stats = delivery()['stats']
            stats.update(promptTokens=len(ids), prefillTokens=len(ids)-reuse, decodeTokens=1,
                         reusedPrefixTokens=reuse, prefillComputePasses=[len(ids)-reuse],
                         prefillComputeKeyExtents=[len(ids)], prefillComputeQueryRows=[len(ids)-reuse])
            warmup.append({'phase': phase, 'conversation': conversation, 'fits': True,
                           'prompt_ids': ids, 'output_ids': [123], 'expected_reuse': reuse,
                           'stats': stats, 'retained': copy.deepcopy(snapshot)})
    result.update(warmup=warmup, retained_before=copy.deepcopy(snapshot), retained_after=copy.deepcopy(snapshot))
    return result


class CapacityEvidence(unittest.TestCase):
    protocol = {'reply_tokens': 16, 'memory_gb': 8.1, 'model_revision': 'frozen',
                'optimizations': {'workspaceTokenTile': 256, 'compactStateWindows': False}}

    def test_complete_delivery(self):
        self.assertTrue(gate.validate_delivery(delivery(), self.protocol, 16)['passed'])

    def test_incomplete_or_forged_observations_are_rejected(self):
        cases = [
            ('fits', False), ('aborted', 'deadline'), ('prompt_ids', [1]),
            ('output_ids', [1]), ('configured_context', 16), ('model_revision', 'changed'),
            ('compute_passes', [16, 1]), ('compute_key_extents', []),
            ('compute_passes', [True]), ('compute_key_extents', [262145]),
            ('compute_query_rows', [True]), ('compute_query_rows', [15]), ('compute_query_rows', []),
            ('optimizations', {'workspaceTokenTile': 128, 'compactStateWindows': False}),
            ('memory_ledger', {'expected_peak_bytes': 8_100_000_001})]
        for key, value in cases:
            with self.subTest(key=key, value=value):
                result = delivery(); result[key] = value
                with self.assertRaises(ValueError): gate.validate_delivery(result, self.protocol, 16)
        for key, value in [('runtimeError', 'fault'), ('requestFailure', {'code': 'fault'}),
                           ('memoryPressureCancelled', True), ('reusedPrefixTokens', 1),
                           ('promptTokens', 15), ('prefillTokens', 15), ('decodeTokens', 15),
                           ('contextArithmetic', 'reference-256-v1'),
                           ('lifetimeRSSPeakBytes', 8_000_000_001)]:
            with self.subTest(stat=key):
                result = delivery(); result['stats'][key] = value
                with self.assertRaises(ValueError): gate.validate_delivery(result, self.protocol, 16)

    def test_padding_is_inside_product_bound(self):
        result = delivery()
        n = 128256
        result.update(prompt_ids=[0]*n, configured_context=n+16,
                      compute_passes=[256]*(n//256),
                      compute_query_rows=[256]*(n//256),
                      compute_key_extents=list(range(256,n+1,256)))
        result['stats'].update(promptTokens=n, prefillTokens=n)
        self.assertTrue(gate.validate_delivery(result, self.protocol, n)['passed'])
        # Only 256 extra masked columns break the product at this boundary.
        result['compute_key_extents'][-1] += 256
        with self.assertRaises(ValueError): gate.validate_delivery(result, self.protocol, n)
        result['compute_key_extents'][-1] -= 256
        result['compute_query_rows'][-1] += 1
        with self.assertRaises(ValueError): gate.validate_delivery(result, self.protocol, n)

    def test_global_paging_is_diagnostic_but_missing_process_memory_fails(self):
        result = delivery(); result['stats']['generatorVMAfter']['swapins'] += 1
        result['stats']['generatorVMAfter']['swapouts'] += 1
        memory = gate.validate_delivery(result, self.protocol, 16)
        self.assertTrue(memory['passed'])
        self.assertEqual(memory['global_swap_deltas']['generator'], {'swapins': 1, 'swapouts': 1})
        result = delivery(); del result['stats']['sampledFootprint']
        with self.assertRaises(KeyError): gate.validate_delivery(result, self.protocol, 16)

    def test_retained_capacity_requires_complete_interleaved_ownership(self):
        protocol = {**self.protocol, 'kind': 'configurable-context-retained-capacity',
                    'warm_conversations': 4, 'warm_tokens': 16}
        self.assertEqual(len(gate.validate_delivery(retained_delivery(), protocol, 16)['warmup_memory']), 8)
        paging = retained_delivery()
        paging['warmup'][0]['stats']['generatorVMAfter'].update(swapins=999)
        self.assertTrue(gate.validate_delivery(paging, protocol, 16)['passed'])
        mutations = [
            lambda r: r['warmup'].pop(),
            lambda r: r['warmup'][0].update(fits=False),
            lambda r: r['warmup'][1].update(conversation=0),
            lambda r: r['warmup'][1].update(prompt_ids=r['warmup'][0]['prompt_ids']),
            lambda r: r['warmup'][4]['prompt_ids'].__setitem__(0, 999),
            lambda r: r['warmup'][4].update(expected_reuse=0),
            lambda r: r['warmup'][4]['stats'].update(reusedPrefixTokens=0),
            lambda r: r['warmup'][0]['stats'].update(prefillComputeKeyExtents=[262144], prefillComputeQueryRows=[4096]),
            lambda r: r['retained_before'].update(conversations=3),
            lambda r: r['retained_before'].update(enabled=False),
            lambda r: r['retained_before'].update(charged_token_capacity=8193),
            lambda r: r['retained_after'].update(allocated_sequence_bytes=4096*27648+1),
        ]
        for mutate in mutations:
            result = retained_delivery(); mutate(result)
            with self.assertRaises(ValueError): gate.validate_delivery(result, protocol, 16)
        with self.assertRaises(ValueError): gate.validate_delivery(retained_delivery(), self.protocol, 16)

    def test_failed_first_rung_never_launches_the_next(self):
        with tempfile.TemporaryDirectory() as directory:
            out = Path(directory)/'run'; calls = []
            protocol = {**self.protocol, 'prompt_tokens': [16, 32], 'wall_seconds': 30, 'model_dir': directory}
            def child(command, env, cell, timeout):
                calls.append(command)
                result = delivery(); result['fits'] = False
                (cell/'stdout.txt').write_text(json.dumps(result))
                (cell/'stderr.txt').write_text('')
                return 0
            snapshot = {'reclaimable_bytes': 20_000_000_000, 'swapins': 3, 'swapouts': 4}
            with patch.object(gate, 'validate', return_value=Path('/frozen/slotstream')), \
                 patch.object(gate, 'MODEL_LOCK', Path(directory)/'model.lock'), \
                 patch.object(gate, 'quiet_preflight', return_value=copy.deepcopy(snapshot)), \
                 patch.object(gate, 'vm_snapshot', return_value=copy.deepcopy(snapshot)), \
                 patch.object(gate, 'run_child', side_effect=child):
                self.assertEqual(gate.run(protocol, out), 1)
            self.assertEqual(len(calls), 2)  # full verification, then first rung
            self.assertFalse((out/'32').exists())
            result = json.loads((out/'manifest.json').read_text())
            self.assertFalse(result['passed'])
            self.assertFalse(result['completed_full_model_window'])
            self.assertEqual(result['results'][0]['prompt_tokens'], 16)
            self.assertTrue((out/'16/stdout.txt').is_file())
            self.assertEqual((out/'protocol.sha256').read_text().strip(), gate.digest(out/'protocol.json'))

    def test_failed_verification_preflight_retains_failure_without_launch(self):
        with tempfile.TemporaryDirectory() as directory:
            out = Path(directory)/'run'
            protocol = {**self.protocol, 'prompt_tokens': [16], 'wall_seconds': 30, 'model_dir': directory}
            with patch.object(gate, 'validate', return_value=Path('/frozen/slotstream')), \
                 patch.object(gate, 'MODEL_LOCK', Path(directory)/'model.lock'), \
                 patch.object(gate, 'quiet_preflight', side_effect=RuntimeError('competing build')), \
                 patch.object(gate, 'vm_snapshot', return_value={}), \
                 patch.object(gate, 'run_child') as child:
                self.assertEqual(gate.run(protocol, out), 1)
                child.assert_not_called()
            result = json.loads((out/'manifest.json').read_text())
            self.assertFalse(result['passed'])
            self.assertFalse(result['completed_full_model_window'])
            self.assertEqual(result['results'], [])
            self.assertIn('competing build', result['error'])
            self.assertTrue((out/'model-verification/manifest.json').exists())

    def test_full_verification_holds_and_releases_the_model_lock(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)/'model.lock'
            with patch.object(gate, 'MODEL_LOCK', path):
                with gate.verification_lock(), path.open('a') as competitor:
                    with self.assertRaises(BlockingIOError):
                        fcntl.flock(competitor, fcntl.LOCK_EX | fcntl.LOCK_NB)
                with path.open('a') as successor:
                    fcntl.flock(successor, fcntl.LOCK_EX | fcntl.LOCK_NB)

    def test_busy_verification_lock_preserves_failure_without_launch(self):
        with tempfile.TemporaryDirectory() as directory:
            out = Path(directory)/'run'; path = Path(directory)/'model.lock'
            protocol = {**self.protocol, 'prompt_tokens': [16], 'wall_seconds': 30, 'model_dir': directory}
            with path.open('a') as owner:
                fcntl.flock(owner, fcntl.LOCK_EX | fcntl.LOCK_NB)
                with patch.object(gate, 'validate', return_value=Path('/frozen/slotstream')), \
                     patch.object(gate, 'MODEL_LOCK', path), \
                     patch.object(gate, 'quiet_preflight', return_value={}), \
                     patch.object(gate, 'vm_snapshot', return_value={}), \
                     patch.object(gate, 'run_child') as child:
                    self.assertEqual(gate.run(protocol, out), 1)
                    child.assert_not_called()
            result = json.loads((out/'manifest.json').read_text())
            self.assertFalse(result['passed'])
            self.assertEqual(result['results'], [])
            self.assertIn('holds the lock', result['error'])


class QuietPreflightChecks(unittest.TestCase):
    def test_known_external_inference_refuses_even_with_apparently_free_memory(self):
        for process in ('/opt/bin/llama-server', 'llama-cli', '/build/slotstream', '/toolchain/swift-frontend'):
            with self.subTest(process=process), \
                    patch.object(gate.subprocess, 'check_output', return_value=process+'\n') as observed, \
                    patch.object(gate, 'preflight') as memory:
                with self.assertRaisesRegex(RuntimeError, 'competing compiler or model process'):
                    gate.quiet_preflight(13)
                memory.assert_not_called()
                self.assertEqual(observed.call_args.args[0], ['ps','-axo','comm='])
                self.assertEqual(observed.call_args.kwargs['timeout'], 5)

    def test_unrelated_process_names_continue_to_pressure_and_real_memory_checks(self):
        with patch.object(gate.subprocess, 'check_output', side_effect=['/Applications/Browser\n/usr/bin/sevra\n', '1\n']), \
                patch.object(gate, 'preflight', return_value={'reclaimable_bytes':15_000_000_000}) as memory:
            self.assertEqual(gate.quiet_preflight(13), {'reclaimable_bytes':15_000_000_000})
            memory.assert_called_once_with(13)

    def test_process_observation_failure_never_admits_a_launch(self):
        with patch.object(gate.subprocess, 'check_output', side_effect=RuntimeError('process observation failed')), \
                patch.object(gate, 'preflight') as memory:
            with self.assertRaisesRegex(RuntimeError, 'process observation failed'):
                gate.quiet_preflight(13)
            memory.assert_not_called()


class CapacityPagingDriverChecks(unittest.TestCase):
    def run_ladder(self, *, paging=(), generator_paging=False, failure=None):
        with tempfile.TemporaryDirectory(prefix="capacity paging '") as directory:
            root = Path(directory).resolve()
            candidate = root / 'candidate'; candidate.mkdir()
            model = root / 'model'; model.mkdir()
            (model / 'config.json').write_text('{}')
            binary = candidate / 'inert selected binary'
            binary.write_bytes(b'inert executable; must never execute')
            (candidate / 'mlx.metallib').write_bytes(b'inert metal')
            pinned = b'public static let revision = "abcdef"\nFile(path: "config.json"\n'
            with tarfile.open(candidate / 'build-source.tar.gz', 'w:gz') as archive:
                member = tarfile.TarInfo('Sources/Slotstream/PinnedModel.swift')
                member.size = len(pinned)
                archive.addfile(member, io.BytesIO(pinned))
            identity = {key: gate.digest(path) for path, key in [
                (binary, 'binary_sha256'), (candidate / 'mlx.metallib', 'metallib_sha256'),
                (candidate / 'build-source.tar.gz', 'source_archive_sha256')]}
            (candidate / 'build-identity.json').write_text(json.dumps(identity))
            protocol = {**identity, **copy.deepcopy(CapacityEvidence.protocol),
                'schema': 1, 'kind': 'configurable-context-capacity', 'mtp': 'off', 'vision': 'off',
                'prefix_cache': False, 'max_prefill_wait_minutes': 0,
                'binary': str(binary), 'model_dir': str(model), 'model_revision': 'abcdef',
                'model_manifest_sha256': hashlib.sha256(pinned).hexdigest(),
                'model_identity': gate.observed_model(model),
                'driver_sources': {name: gate.digest(gate.ROOT / name) for name in gate.DRIVERS},
                'prompt_tokens': [16, 32], 'wall_seconds': 30}
            if failure == 'identity':
                binary.write_bytes(b'changed executable')
            host = {'reclaimable_bytes': 20_000_000_000, 'swapins': 3, 'swapouts': 4}
            calls = []
            lock = root / 'private-model.lock'

            def quiet(needed):
                self.assertEqual(needed, protocol['memory_gb'] + 3)
                if failure == 'preflight' and calls:
                    raise RuntimeError('OS pressure is not normal; fixture refuses capacity launch')
                return copy.deepcopy(host)

            def child(command, env, cell, timeout):
                self.assertEqual(command[0], str(binary))
                self.assertEqual(env['SLOTSTREAM_PREFIX_CACHE'], '0')
                if command[1] == 'pull':
                    self.assertEqual(calls, [])
                    self.assertEqual(command, [str(binary), 'pull', '--verify', '--dir', str(model)])
                    self.assertEqual(timeout, 600)
                    with lock.open('a') as competitor, self.assertRaises(BlockingIOError):
                        fcntl.flock(competitor, fcntl.LOCK_EX | fcntl.LOCK_NB)
                    calls.append('verify')
                    (cell / 'stdout.txt').write_text('inert verification fixture\n')
                    (cell / 'stderr.txt').write_text('')
                    return 0
                n = protocol['prompt_tokens'][len(calls) - 1]
                expected = [str(binary), 'context-check', '--tokens', str(n), '--reply-tokens', '16',
                    '--memory-gb', '8.1', '--mtp', 'off', '--vision', 'off', '--model', str(model),
                    '--max-prefill-wait', '0', '--wall-seconds', '30', '--sample-footprint', '--json']
                self.assertEqual(command, expected)
                self.assertEqual(timeout, 150)
                calls.append(n)
                result = delivery()
                result.update(prompt_ids=list(range(n)), configured_context=n + 16,
                              model_revision='abcdef', compute_passes=[n],
                              compute_key_extents=[n], compute_query_rows=[n])
                result['stats'].update(promptTokens=n, prefillTokens=n)
                if generator_paging:
                    result['stats']['generatorVMAfter'].update(swapins=4, swapouts=5)
                if n == 16:
                    for key in paging:
                        host[key] += 1
                    if failure == 'physical':
                        result['stats']['sampledFootprint']['peakBytes'] = 8_000_000_001
                    elif failure == 'missing':
                        del result['stats']['sampledFootprint']
                    elif failure == 'incomplete':
                        result['output_ids'].pop()
                    elif failure == 'pressure':
                        result['stats']['memoryPressureCancelled'] = True
                (cell / 'stdout.txt').write_text(json.dumps(result))
                (cell / 'stderr.txt').write_text('')
                return 1 if n == 16 and failure == 'child' else 0

            out = root / 'run'
            with patch.object(gate, 'MODEL_LOCK', lock), \
                    patch.object(gate, 'quiet_preflight', side_effect=quiet), \
                    patch.object(gate, 'vm_snapshot', side_effect=lambda: copy.deepcopy(host)), \
                    patch.object(gate, 'run_child', side_effect=child), \
                    patch.object(gate, 'preflight', side_effect=AssertionError('real admission forbidden')) as admission, \
                    patch.object(gate.subprocess, 'Popen', side_effect=AssertionError('process forbidden')) as launch, \
                    patch.object(gate.subprocess, 'run', side_effect=AssertionError('command forbidden')) as run, \
                    patch.object(gate.subprocess, 'check_output', side_effect=AssertionError('VM/ps/sysctl forbidden')) as observe:
                if failure == 'identity':
                    with self.assertRaisesRegex(ValueError, 'protocol identity mismatch'):
                        gate.run(protocol, out)
                    self.assertFalse(out.exists())
                    self.assertEqual(calls, [])
                    for forbidden in (admission, launch, run, observe):
                        forbidden.assert_not_called()
                    return None
                code = gate.run(protocol, out)
                for forbidden in (admission, launch, run, observe):
                    forbidden.assert_not_called()
            with lock.open('a') as successor:
                fcntl.flock(successor, fcntl.LOCK_EX | fcntl.LOCK_NB)
            self.assertEqual((out / 'protocol.sha256').read_text().strip(), gate.digest(out / 'protocol.json'))
            summary = json.loads((out / 'manifest.json').read_text())
            self.assertFalse(summary['completed_full_model_window'])
            for row in summary['results']:
                cell = out / str(row['prompt_tokens'])
                self.assertEqual(json.loads((cell / 'manifest.json').read_text()), row)
                if row.get('command'):
                    self.assertTrue((cell / 'stdout.txt').is_file())
            return code, summary, calls

    def assert_completed(self, *, paging=(), generator_paging=False):
        code, summary, calls = self.run_ladder(paging=paging, generator_paging=generator_paging)
        self.assertEqual((code, calls, summary['passed']), (0, ['verify', 16, 32], True), summary)
        self.assertEqual([row['prompt_tokens'] for row in summary['results']], [16, 32])
        self.assertTrue(all(row['passed'] and row['memory']['passed'] for row in summary['results']))
        first = summary['results'][0]
        self.assertEqual(first.get('swap_activity', False), bool(paging))
        for key in ('swapins', 'swapouts'):
            self.assertEqual(first['after'][key] - first['before'][key], int(key in paging))
        if generator_paging:
            for row in summary['results']:
                self.assertEqual(row['memory']['global_swap_deltas']['generator'], {'swapins': 1, 'swapouts': 1})

    def assert_stopped(self, failure):
        code, summary, calls = self.run_ladder(paging=('swapins', 'swapouts'), failure=failure)
        self.assertEqual((code, calls), (1, ['verify'] if failure == 'preflight' else ['verify', 16]))
        self.assertFalse(summary['passed'])
        self.assertEqual([row['prompt_tokens'] for row in summary['results']], [16])
        self.assertFalse(summary['results'][0]['passed'])
        self.assertIn('error', summary['results'][0])

    def test_stable_host_completes_both_rungs(self):
        self.assert_completed()

    def test_generator_paging_is_diagnostic_through_driver(self):
        self.assert_completed(generator_paging=True)

    def test_process_memory_failures_still_stop_with_paging(self):
        for failure in ('physical', 'missing'):
            with self.subTest(failure=failure):
                self.assert_stopped(failure)

    def test_incomplete_delivery_still_stops_with_paging(self):
        self.assert_stopped('incomplete')

    def test_failed_child_still_stops_with_paging(self):
        self.assert_stopped('child')

    def test_pressure_cancellation_still_stops_with_paging(self):
        self.assert_stopped('pressure')

    def test_quiet_preflight_refusal_still_stops_before_rung(self):
        self.assert_stopped('preflight')

    def test_changed_artifact_refuses_before_admission(self):
        self.run_ladder(failure='identity')

    def test_host_swapins_are_diagnostic_through_driver(self):
        self.assert_completed(paging=('swapins',))

    def test_host_swapouts_are_diagnostic_through_driver(self):
        self.assert_completed(paging=('swapouts',))

    def test_host_both_swap_counters_are_diagnostic_through_driver(self):
        self.assert_completed(paging=('swapins', 'swapouts'))


if __name__ == '__main__': unittest.main()
