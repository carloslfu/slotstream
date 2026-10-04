import copy
from contextlib import contextmanager, ExitStack
import hashlib
import json
import os
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import research_payload_retirement as m


class RetirementChecks(unittest.TestCase):
    def fixture(self, root):
        root = Path(root); prepared = root / 'prepared'; prepared.mkdir()
        rows = []; metadata = {}
        for name in m.EXPECTED:
            path = root / name; path.parent.mkdir(exist_ok=True)
            path.write_bytes(name.encode()); info = path.stat()
            rows.append({'path': name, 'bytes': info.st_size, 'device': info.st_dev,
                         'inode': info.st_ino, 'mtime_ns': info.st_mtime_ns,
                         'allocated_bytes': info.st_blocks * 512, 'sha256': m.digest(path)})
        for directory in m.DIRECTORIES:
            name = directory + '/manifest.json'; path = root / name
            path.write_bytes(b'{"retained":true}\n'); metadata[name] = m.digest(path)
            archive = prepared / 'metadata' / name; archive.parent.mkdir(parents=True)
            archive.write_bytes(path.read_bytes())
        producer = prepared / 'producer-sources/Tools/producer.py'; producer.parent.mkdir(parents=True)
        producer.write_bytes(b'# exact producer fixture\n')
        original = root / 'heldout-outcome-protocol-v1/protocol.json'; original.parent.mkdir()
        original.write_bytes(b'original-protocol')
        continuation = root / 'heldout-unanswered-continuation-v1/protocol.json'; continuation.parent.mkdir()
        continuation.write_bytes(b'continuation-protocol')
        (root / 'keep-unlisted').write_bytes(b'never delete')
        plan = {'schema': 1, 'kind': 'inactive-generated-payload-retirement-v1', 'executed': False,
                'resource': m.RESOURCES.copy(), 'entries': rows, 'metadata_sha256': metadata,
                'producer_copies_sha256': {'Tools/producer.py': m.digest(producer)},
                'active_original_protocol_sha256': m.digest(original),
                'active_continuation_protocol_sha256': m.digest(continuation),
                'planned_retired_file_bytes': sum(row['bytes'] for row in rows),
                'planned_retired_allocated_bytes': sum(row['allocated_bytes'] for row in rows)}
        (prepared / 'plan.json').write_bytes(m.encoded(plan))
        protocol = {'schema': 1, 'kind': 'authenticated-research-retirement-v1',
                    'source_sha256': m.source_pins(), 'plan': 'prepared/plan.json',
                    'plan_sha256': m.digest(prepared / 'plan.json'), 'report': 'report'}
        return root, protocol, plan

    def frozen(self, root, protocol, plan):
        (root / protocol['plan']).write_bytes(m.encoded(plan))
        protocol['plan_sha256'] = m.digest(root / protocol['plan'])
        path = root / 'protocol.json'; path.write_bytes(m.encoded(protocol))
        return path, m.digest(path)

    @contextmanager
    def system(self, lock_failure=False):
        owned = []
        @contextmanager
        def lock():
            if lock_failure: raise RuntimeError('competing model owner')
            owned.append(True)
            try: yield
            finally: owned.pop()
        def preflight(value):
            self.assertEqual(value, 4); self.assertFalse(owned)
            return {'reclaimable_bytes': 10_000_000_000}
        real_unlink = m.os.unlink
        def unlink(*args, **kwargs):
            self.assertTrue(owned)
            return real_unlink(*args, **kwargs)
        with ExitStack() as stack:
            stack.enter_context(patch.object(m, 'verification_lock', lock))
            stack.enter_context(patch.object(m, 'quiet_preflight', preflight))
            stack.enter_context(patch.object(m, 'physical', return_value={'current_bytes': 1_000_000}))
            stack.enter_context(patch.object(m, 'vm_snapshot', return_value={'reclaimable_bytes': 10_000_000_000}))
            stack.enter_context(patch.object(m.subprocess, 'check_output', return_value='1'))
            stack.enter_context(patch.object(m.os, 'unlink', side_effect=unlink))
            yield owned
        self.assertEqual(owned, [])

    def receipt(self, root): return json.loads((root / 'report/receipt.json').read_bytes())

    def assert_payloads(self, root, count):
        self.assertEqual(sum((root / name).exists() for name in m.EXPECTED), count)
        self.assertEqual((root / 'keep-unlisted').read_bytes(), b'never delete')
        self.assertTrue(all((root / directory / 'manifest.json').is_file() for directory in m.DIRECTORIES))

    def test_all_hashes_then_exact_unlinks_preserve_metadata_and_refuse_repeat(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol, plan = self.fixture(directory); path, sha = self.frozen(root, protocol, plan)
            with self.system(): result = m.run(path, sha, root)
            self.assertTrue(result['complete']); self.assertFalse(result['qualification'])
            self.assertEqual(len(result['authenticated']), 96); self.assertEqual(result['retired'], list(m.EXPECTED))
            self.assert_payloads(root, 0); self.assertNotIn('pending_retirement', result)
            self.assertLess(result['staging_after_bytes'], result['staging_before_bytes'])
            with self.system(), self.assertRaises(FileExistsError): m.run(path, sha, root)

    def test_last_payload_digest_failure_cannot_delete_any_authenticated_predecessor(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol, plan = self.fixture(directory); plan['entries'][-1]['sha256'] = '0' * 64
            path, sha = self.frozen(root, protocol, plan)
            with self.system(), self.assertRaisesRegex(ValueError, 'authentication'): m.run(path, sha, root)
            result = self.receipt(root); self.assertEqual(len(result['authenticated']), 95)
            self.assertEqual(result['retired'], []); self.assertFalse(result['complete']); self.assert_payloads(root, 96)

    def test_last_symlink_or_replacement_cannot_redirect_deletion(self):
        for mode in ('symlink', 'replacement'):
            with self.subTest(mode=mode), tempfile.TemporaryDirectory() as directory:
                root, protocol, plan = self.fixture(directory); path, sha = self.frozen(root, protocol, plan)
                payload = root / m.EXPECTED[-1]; raw = payload.read_bytes(); payload.unlink()
                if mode == 'symlink': payload.symlink_to(root / 'keep-unlisted')
                else: payload.write_bytes(raw)
                with self.system(), self.assertRaises((ValueError, OSError)): m.run(path, sha, root)
                self.assertEqual(self.receipt(root)['retired'], []); self.assert_payloads(root, 96)

    def test_mutation_after_full_hashing_is_refused_before_first_unlink(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol, plan = self.fixture(directory); path, sha = self.frozen(root, protocol, plan)
            real_validate = m.validate; calls = []
            def changed(*args):
                result = real_validate(*args); calls.append(True)
                if len(calls) == 2:
                    payload = root / m.EXPECTED[-1]
                    with payload.open('r+b') as stream: stream.write(b'changed!')
                return result
            with self.system(), patch.object(m, 'validate', side_effect=changed), self.assertRaisesRegex(ValueError, 'changed before'):
                m.run(path, sha, root)
            self.assertEqual(len(self.receipt(root)['authenticated']), 96)
            self.assertEqual(self.receipt(root)['retired'], []); self.assert_payloads(root, 96)

    def test_partial_deletion_retains_intent_and_error_and_never_retries(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol, plan = self.fixture(directory); path, sha = self.frozen(root, protocol, plan)
            real_unlink = m.os.unlink; calls = []
            def interrupted(*args, **kwargs):
                calls.append(True)
                if len(calls) == 2: raise OSError('simulated unlink failure')
                return real_unlink(*args, **kwargs)
            with self.system(), patch.object(m.os, 'unlink', side_effect=interrupted), self.assertRaisesRegex(OSError, 'simulated'):
                m.run(path, sha, root)
            result = self.receipt(root); self.assertEqual(result['retired'], [m.EXPECTED[0]])
            self.assertEqual(result['pending_retirement'], m.EXPECTED[1]); self.assertFalse(result['complete'])
            self.assert_payloads(root, 95)
            with self.system(), self.assertRaises(FileExistsError): m.run(path, sha, root)

    def test_competing_owner_or_resource_loss_deletes_nothing(self):
        for mode in ('lock', 'physical', 'headroom', 'pressure', 'time'):
            with self.subTest(mode=mode), tempfile.TemporaryDirectory() as directory:
                root, protocol, plan = self.fixture(directory); path, sha = self.frozen(root, protocol, plan)
                with self.system(lock_failure=mode == 'lock'), ExitStack() as stack:
                    if mode == 'physical': stack.enter_context(patch.object(m, 'physical', return_value={'current_bytes': 1_000_000_001}))
                    if mode == 'headroom': stack.enter_context(patch.object(m, 'vm_snapshot', return_value={'reclaimable_bytes': 2_999_999_999}))
                    if mode == 'pressure': stack.enter_context(patch.object(m.subprocess, 'check_output', return_value='2'))
                    if mode == 'time':
                        times = iter([0, 4000]); stack.enter_context(patch.object(m.time, 'monotonic', side_effect=lambda: next(times, 4000)))
                    with self.assertRaises((RuntimeError, TimeoutError)): m.run(path, sha, root)
                self.assertEqual(self.receipt(root)['retired'], []); self.assert_payloads(root, 96)

    def test_frozen_scope_source_resources_and_reconstruction_custody_are_required(self):
        with tempfile.TemporaryDirectory() as directory:
            root, protocol, plan = self.fixture(directory)
            protocol_edits = [lambda x: x['source_sha256'].clear(), lambda x: x.update(schema=True),
                              lambda x: x.update(report='../escape'), lambda x: x.update(report=m.DIRECTORIES[0])]
            for edit in protocol_edits:
                changed = copy.deepcopy(protocol); edit(changed)
                with self.assertRaises(ValueError): m.validate(changed, root)
            plan_edits = [lambda x: x['entries'].pop(), lambda x: x['entries'][0].update(path='unrelated/file'),
                          lambda x: x['resource'].update(new_weights=True), lambda x: x['resource'].update(maximum_seconds=7200),
                          lambda x: x.update(executed=True), lambda x: x['metadata_sha256'].clear(),
                          lambda x: x['producer_copies_sha256'].clear(), lambda x: x.update(planned_retired_file_bytes=1)]
            for edit in plan_edits:
                changed = copy.deepcopy(plan); edit(changed); self.frozen(root, protocol, changed)
                with self.assertRaises(ValueError): m.validate(protocol, root)
            self.frozen(root, protocol, plan)
            (root / 'prepared/producer-sources/Tools/producer.py').write_bytes(b'wrong producer')
            with self.assertRaisesRegex(ValueError, 'producer custody'): m.validate(protocol, root)
            self.assert_payloads(root, 96)


if __name__ == '__main__': unittest.main()
