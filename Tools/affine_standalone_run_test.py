import copy
from contextlib import contextmanager, ExitStack
import json
import os
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import affine_standalone_run as m
import context_qualification
import prefill_bench
from standalone_bundle import Entry


class StandaloneRunChecks(unittest.TestCase):
    def fixture(self, root):
        root = Path(root)
        entries = (Entry('payload.bin', 7, data=b'fixture'),)
        identity = {'fixture': 'tiny storage execution only'}
        plan = {'schema': 1, 'payloads_authenticated': False, 'qualification': False,
                'identity': identity, 'file_count': 1, 'file_bytes': 7,
                'manifest_reservation_bytes': 4000, 'maximum_output_bytes': 4007}
        (root / 'plan.json').write_bytes(m.encoded(plan))
        protocol = {'schema': 1, 'kind': 'affine-standalone-export-v1', 'source_sha256': m.source_pins(),
                    'plan_sha256': m.digest(root / 'plan.json'),
                    'paths': {'parent': str(root / 'parent'), 'control': 'control', 'rotary': 'rotary.bin',
                              'plan': 'plan.json', 'output': 'output', 'report': 'report'},
                    'resource': {'maximum_process_bytes': 1_000_000_000, 'maximum_seconds': 3600,
                                 'maximum_output_bytes': 4007, 'maximum_research_staging_bytes': 430_000_000_000,
                                 'minimum_free_bytes': 3_000_000_000, 'preflight_bytes': 4_000_000_000,
                                 'headroom_bytes': 3_000_000_000, 'receipt_reservation_bytes': 1_000_000,
                                 'new_raw_logit_bytes': 0, 'paid_compute_usd': 0, 'concurrent_workers': 1}}
        return protocol, plan, entries, identity

    def frozen(self, root, protocol):
        path = Path(root) / 'protocol.json'; path.write_bytes(m.encoded(protocol))
        return path, m.digest(path)

    @contextmanager
    def system(self, plan, entries, identity, lock_failure=False):
        owned = []
        @contextmanager
        def lock():
            if lock_failure: raise RuntimeError('competing model owner')
            owned.append(True)
            try: yield
            finally: owned.pop()
        def preflight(value):
            self.assertFalse(owned); self.assertEqual(value, 4)
            return {'reclaimable_bytes': 10_000_000_000}
        def prepare(*args):
            self.assertTrue(owned)
            return entries, identity, plan
        with ExitStack() as stack:
            stack.enter_context(patch.object(m, 'verification_lock', lock))
            stack.enter_context(patch.object(m, 'quiet_preflight', preflight))
            prepared = stack.enter_context(patch.object(m, 'prepare', side_effect=prepare))
            stack.enter_context(patch.object(m, 'physical', return_value={'current_bytes': 1_000_000, 'peak_bytes': 1_000_000}))
            stack.enter_context(patch.object(m, 'vm_snapshot', return_value={'reclaimable_bytes': 10_000_000_000}))
            stack.enter_context(patch.object(m.subprocess, 'check_output', return_value='1'))
            yield prepared
        self.assertEqual(owned, [])

    def test_real_tiny_export_and_independent_audit_run_under_one_owner(self):
        with tempfile.TemporaryDirectory() as root:
            protocol, plan, entries, identity = self.fixture(root); path, sha = self.frozen(root, protocol)
            with self.system(plan, entries, identity): result = m.run(path, sha, root)
            self.assertTrue(result['complete']); self.assertFalse(result['qualification'])
            self.assertGreaterEqual(result['samples'], 2)
            self.assertEqual((Path(root) / 'output/payload.bin').read_bytes(), b'fixture')
            manifest = json.loads((Path(root) / 'output/standalone-manifest.json').read_bytes())
            self.assertTrue(manifest['complete']); self.assertFalse(manifest['qualification'])
            self.assertEqual(result['export']['manifest_sha256'], m.digest(Path(root) / 'output/standalone-manifest.json'))
            with self.system(plan, entries, identity) as prepared, self.assertRaises(FileExistsError):
                m.run(path, sha, root)
            prepared.assert_not_called()

    def test_whole_staging_reservation_precedes_even_component_preparation(self):
        with tempfile.TemporaryDirectory() as root:
            protocol, plan, entries, identity = self.fixture(root)
            protocol['resource']['maximum_research_staging_bytes'] = 1_000_001
            path, sha = self.frozen(root, protocol)
            with self.system(plan, entries, identity) as prepared, self.assertRaisesRegex(RuntimeError, 'reservation'):
                m.run(path, sha, root)
            prepared.assert_not_called()
            self.assertFalse((Path(root) / 'output').exists())
            result = json.loads((Path(root) / 'report/receipt.json').read_bytes())
            self.assertFalse(result['complete']); self.assertIn('failure', result)

    def test_real_preflight_and_lifetime_file_lock_handoff_avoids_self_conflict(self):
        # Keep the real flock implementations, on a private fixture lock. The
        # preflight probes and releases it; preparation must hold it through
        # the real tiny export. No production model lock or process is touched.
        with tempfile.TemporaryDirectory() as root:
            protocol, plan, entries, identity = self.fixture(root); path, sha = self.frozen(root, protocol)
            lock = Path(root) / 'private-model.lock'
            def prepare(*args):
                with self.assertRaisesRegex(RuntimeError, 'holds the lock'): prefill_bench.preflight(4)
                return entries, identity, plan
            with ExitStack() as stack:
                stack.enter_context(patch.object(context_qualification, 'MODEL_LOCK', lock))
                stack.enter_context(patch.dict(os.environ, {'SLOTSTREAM_MODEL_LOCK_PATH': str(lock)}))
                stack.enter_context(patch.object(m, 'quiet_preflight', prefill_bench.preflight))
                stack.enter_context(patch.object(m, 'prepare', side_effect=prepare))
                for module in (m, prefill_bench):
                    stack.enter_context(patch.object(module, 'vm_snapshot', return_value={'reclaimable_bytes': 10_000_000_000}))
                stack.enter_context(patch.object(m, 'physical', return_value={'current_bytes': 1_000_000}))
                stack.enter_context(patch.object(m.subprocess, 'check_output', return_value='1'))
                self.assertTrue(m.run(path, sha, root)['complete'])
                self.assertEqual(prefill_bench.preflight(4)['reclaimable_bytes'], 10_000_000_000)

    def test_a_competing_model_prevents_copy_and_cannot_be_silently_retried(self):
        with tempfile.TemporaryDirectory() as root:
            protocol, plan, entries, identity = self.fixture(root); path, sha = self.frozen(root, protocol)
            with self.system(plan, entries, identity, lock_failure=True) as prepared:
                with self.assertRaisesRegex(RuntimeError, 'competing'): m.run(path, sha, root)
                with self.assertRaises(FileExistsError): m.run(path, sha, root)
            prepared.assert_not_called(); self.assertFalse((Path(root) / 'output').exists())

    def test_source_and_protocol_changes_or_unpriced_resources_are_refused(self):
        with tempfile.TemporaryDirectory() as root:
            protocol, _, _, _ = self.fixture(root)
            changes = [lambda x:x['source_sha256'].clear(), lambda x:x.update(schema=True),
                       lambda x:x['resource'].update(maximum_process_bytes=2_000_000_000),
                       lambda x:x['resource'].update(new_raw_logit_bytes=True),
                       lambda x:x['resource'].update(paid_compute_usd=1),
                       lambda x:x['resource'].update(maximum_output_bytes=4008),
                       lambda x:x['paths'].update(parent='relative'),
                       lambda x:x['paths'].update(output='../escape'),
                       lambda x:x['paths'].update(output='report')]
            for edit in changes:
                changed = copy.deepcopy(protocol); edit(changed)
                with self.assertRaises(ValueError): m.validate(changed, root)
            (Path(root) / 'plan.json').write_bytes(b'{}')
            with self.assertRaises(ValueError): m.validate(protocol, root)

    def test_live_process_headroom_pressure_and_time_fail_closed(self):
        cases = [('physical', {'current_bytes': 1_000_000_001}),
                 ('vm_snapshot', {'reclaimable_bytes': 2_999_999_999}), ('pressure', '2'), ('time', None)]
        for kind, value in cases:
            with self.subTest(kind=kind), tempfile.TemporaryDirectory() as root:
                protocol, plan, entries, identity = self.fixture(root); path, sha = self.frozen(root, protocol)
                with self.system(plan, entries, identity) as prepared, ExitStack() as stack:
                    if kind == 'pressure': stack.enter_context(patch.object(m.subprocess, 'check_output', return_value=value))
                    elif kind == 'time':
                        clock = iter([0, 4000]); stack.enter_context(patch.object(m.time, 'monotonic', side_effect=lambda: next(clock, 4000)))
                    else: stack.enter_context(patch.object(m, kind, return_value=value))
                    with self.assertRaises((RuntimeError, TimeoutError)): m.run(path, sha, root)
                prepared.assert_not_called()
                self.assertFalse(json.loads((Path(root) / 'report/receipt.json').read_bytes())['complete'])

    def test_changed_prepared_geometry_and_existing_output_are_preserved(self):
        for kind in ('geometry', 'existing'):
            with self.subTest(kind=kind), tempfile.TemporaryDirectory() as root:
                protocol, plan, entries, identity = self.fixture(root); path, sha = self.frozen(root, protocol)
                if kind == 'geometry': plan['file_bytes'] += 1
                else:
                    (Path(root) / 'output').mkdir(); (Path(root) / 'output/canary').write_bytes(b'keep')
                with self.system(plan, entries, identity), self.assertRaises((ValueError, FileExistsError)):
                    m.run(path, sha, root)
                if kind == 'existing': self.assertEqual((Path(root) / 'output/canary').read_bytes(), b'keep')
                self.assertFalse((Path(root) / 'output/standalone-manifest.json').exists())

    def test_late_source_drift_cannot_turn_finished_storage_into_complete_execution(self):
        with tempfile.TemporaryDirectory() as root:
            protocol, plan, entries, identity = self.fixture(root); path, sha = self.frozen(root, protocol)
            with self.system(plan, entries, identity), patch.object(m, 'source_pins', side_effect=[protocol['source_sha256'], {}]):
                with self.assertRaisesRegex(ValueError, 'source closure'): m.run(path, sha, root)
            self.assertTrue((Path(root) / 'output/standalone-manifest.json').exists())
            result = json.loads((Path(root) / 'report/receipt.json').read_bytes())
            self.assertFalse(result['complete']); self.assertIn('failure', result)


if __name__ == '__main__': unittest.main()
