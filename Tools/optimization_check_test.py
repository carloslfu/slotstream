"""Diagnostic wrapper admission and evidence with tiny, inert child fixtures."""
import contextlib
import io
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

import optimization_check as check

SNAPSHOT = {'reclaimable_bytes': 32_000_000_000, 'swapins': 0, 'swapouts': 0}


class DiagnosticChecks(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-diagnostic-fixture-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name).resolve()
        self.binary = self.root/'frozen/slotstream'
        self.binary.parent.mkdir()
        identity = {}
        for name, key in [('slotstream', 'binary_sha256'), ('mlx.metallib', 'metallib_sha256'),
                          ('build-source.tar.gz', 'source_archive_sha256')]:
            path = self.binary.parent/name
            path.write_bytes(('inert fixture '+name).encode())
            identity[key] = check.digest(path)
        (self.binary.parent/'build-identity.json').write_text(json.dumps(identity))
        self.out = self.root/'receipt'
        self.preflight_error = None
        self.final_error = None
        self.child_code = 0
        self.child_text = json.dumps({'passed': True, 'items': ['first', 'second']})

    def preflight(self, needed):
        if self.preflight_error:
            raise self.preflight_error
        # Model the shared preflight's real comparison without reading the OS
        # or its lock. In particular NaN makes this comparison false.
        if SNAPSHOT['reclaimable_bytes'] < needed * 1e9:
            raise RuntimeError('fixture headroom unavailable')
        return dict(SNAPSHOT)

    def final(self):
        if self.final_error:
            raise self.final_error
        return dict(SNAPSHOT)

    def child(self, command, env, out, timeout):
        self.assertEqual(command, [str(self.binary), 'runtime-check', '--json'])
        self.assertEqual(timeout, 600)
        (out/'stdout.txt').write_text(self.child_text)
        (out/'stderr.txt').write_text('')
        return self.child_code

    def invoke(self, *options):
        arguments = ['optimization_check.py', '--binary', str(self.binary), '--out', str(self.out),
                     *options, '--', 'runtime-check', '--json']
        with patch.object(sys, 'argv', arguments), patch.object(check, 'preflight', side_effect=self.preflight) as before, \
                patch.object(check, 'vm_snapshot', side_effect=self.final) as after, \
                patch.object(check, 'run_child', side_effect=self.child) as child, \
                contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
            try:
                code, error = check.main(), None
            except BaseException as caught:
                code, error = None, caught
        return code, error, before, after, child

    def receipt(self):
        self.assertTrue((self.out/'manifest.json').is_file(), 'diagnostic manifest was lost')
        return json.loads((self.out/'manifest.json').read_text())

    def test_successful_diagnostic_keeps_its_receipt(self):
        code, error, before, after, child = self.invoke()
        self.assertIsNone(error, repr(error))
        self.assertEqual(code, 0)
        before.assert_called_once_with(13)
        after.assert_called_once_with()
        child.assert_called_once()
        record = self.receipt()
        self.assertTrue(record['passed'])
        self.assertEqual(record['assertions'], 2)
        self.assertEqual(record['after'], SNAPSHOT)

    def test_nonfinite_headroom_is_rejected_before_side_effects(self):
        for value in ['nan', '-nan', 'inf', '-inf']:
            with self.subTest(value=value):
                self.out = self.root/('invalid-'+value)
                code, error, before, after, child = self.invoke('--required-gb='+value)
                self.assertIsInstance(error, SystemExit)
                self.assertEqual(error.code, 2)
                before.assert_not_called()
                after.assert_not_called()
                child.assert_not_called()
                self.assertFalse(self.out.exists())

    def test_existing_minimum_rejection_has_no_side_effects(self):
        code, error, before, after, child = self.invoke('--required-gb=6.9')
        self.assertIsInstance(error, SystemExit)
        self.assertEqual(error.code, 2)
        before.assert_not_called()
        after.assert_not_called()
        child.assert_not_called()
        self.assertFalse(self.out.exists())

    def test_preflight_failure_keeps_primary_error(self):
        self.preflight_error = RuntimeError('fixture primary admission refusal')
        code, error, _, _, child = self.invoke()
        self.assertIsNone(error, repr(error))
        self.assertEqual(code, 1)
        child.assert_not_called()
        record = self.receipt()
        self.assertFalse(record['passed'])
        self.assertEqual(record['error'], 'RuntimeError: fixture primary admission refusal')

    def test_final_observation_failure_after_success_fails_closed(self):
        self.final_error = OSError('fixture final observation unavailable')
        code, error, _, _, child = self.invoke()
        self.assertIsNone(error, repr(error))
        self.assertEqual(code, 1)
        child.assert_called_once()
        record = self.receipt()
        self.assertFalse(record['passed'])
        self.assertEqual(record['exit_code'], 0)
        self.assertEqual(record['after_error'], 'OSError: fixture final observation unavailable')
        self.assertNotIn('after', record)

    def test_final_observation_does_not_replace_primary_admission_failure(self):
        self.preflight_error = RuntimeError('fixture primary admission refusal')
        self.final_error = OSError('fixture final observation unavailable')
        code, error, _, _, child = self.invoke()
        self.assertIsNone(error, repr(error))
        self.assertEqual(code, 1)
        child.assert_not_called()
        record = self.receipt()
        self.assertFalse(record['passed'])
        self.assertEqual(record['error'], 'RuntimeError: fixture primary admission refusal')
        self.assertEqual(record['after_error'], 'OSError: fixture final observation unavailable')

    def test_final_observation_does_not_replace_malformed_result(self):
        self.child_text = '{'
        self.final_error = OSError('fixture final observation unavailable')
        code, error, _, _, _ = self.invoke()
        self.assertIsNone(error, repr(error))
        self.assertEqual(code, 1)
        record = self.receipt()
        self.assertFalse(record['passed'])
        self.assertTrue(record['error'].startswith('JSONDecodeError:'))
        self.assertEqual(record['after_error'], 'OSError: fixture final observation unavailable')

    def test_nonzero_child_status_is_preserved(self):
        self.child_code = 9
        code, error, _, _, _ = self.invoke()
        self.assertIsNone(error, repr(error))
        self.assertEqual(code, 1)
        self.assertEqual(self.receipt()['exit_code'], 9)
        self.assertFalse(self.receipt()['passed'])


if __name__ == '__main__':
    unittest.main()
