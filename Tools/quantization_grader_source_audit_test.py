import copy
import json
from pathlib import Path
import tempfile
import unittest

import quantization_grader_source_audit as q
import quantization_outcome_campaign as campaign
import quantization_outcome_continuation as previous
import quantization_outcome_continuation_test as fixtures


class AuditTests(unittest.TestCase):
    def fixture(self, directory):
        helper = fixtures.ContinuationTests()
        root, _, effective, native, _, _ = helper.fixture(directory)
        effective['_root'] = root
        job = {'index': 1, 'family': 'instruction', 'ids': ['a', 'b'], 'arms': ['original', 'candidate']}
        path = root / 'interrupted'; path.mkdir()
        session, _ = helper.native_session(path / 'session-000-original', 'original',
            [{'id': 'a', 'prompt': 'synthetic instruction'}], effective, native)
        receipt = session.pop('receipt'); receipt['complete'] = False
        campaign.write(path / 'session-000-original/receipt.json', receipt)
        session.update(complete=False, exit_code=-15, release_settle_seconds=1.06)
        stdout = path / 'session-000-original.stdout'
        events = stdout.read_text().splitlines()
        stdout.write_text('\n'.join(events[:-1]) + '\n')
        row = {'job': job, 'complete': False, 'qualification': False, 'outcomes': [], 'sessions': [session],
            'seconds': 10., 'failure': 'RuntimeError: instruction grader infrastructure failed: Traceback (most recent call last):\n import nltk'}
        return row, job, path, native, effective

    def test_only_fully_journaled_ungraded_response_is_admitted(self):
        with tempfile.TemporaryDirectory() as directory:
            args = self.fixture(directory)
            event, arm = q.interrupted_case(*args, campaign, previous)
            self.assertEqual(arm, 'original'); self.assertEqual(event['id'], 'call-1')
            for edit in [lambda r: r.update(complete=True), lambda r: r.update(outcomes=[{}]),
                         lambda r: r.update(failure='score disagreed'),
                         lambda r: r['sessions'][0].update(exit_code=0),
                         lambda r: r['sessions'][0].update(cleanup_failure='not drained'),
                         lambda r: r['sessions'][0].update(release_settle_seconds=0),
                         lambda r: r['sessions'][0].update(peak_model_bytes=14_000_000_001),
                         lambda r: r['sessions'][0]['command'].append('--changed')]:
                row = copy.deepcopy(args[0]); edit(row)
                with self.assertRaises(ValueError): q.interrupted_case(row, *args[1:], campaign, previous)

    def test_partial_extra_or_changed_events_and_counters_refuse(self):
        with tempfile.TemporaryDirectory() as directory:
            args = self.fixture(directory)
            stdout = args[2] / 'session-000-original.stdout'; original = stdout.read_bytes()
            for value in [original.rstrip(), original + b'{}\n', original.replace(b'reset-1', b'reset-2')]:
                stdout.write_bytes(value)
                with self.assertRaises(ValueError): q.interrupted_case(*args, campaign, previous)
            stdout.write_bytes(original)
            path = args[2] / 'session-000-original/receipt.json'; original = campaign.read(path)
            for key, value in [('requests', 2), ('resets', True), ('loaded', False), ('peak_process_bytes', 0)]:
                campaign.write(path, {**original, key: value})
                with self.assertRaises(ValueError): q.interrupted_case(*args, campaign, previous)


if __name__ == '__main__': unittest.main()
