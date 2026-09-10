#!/usr/bin/env python3
"""Model-free regression tests for the complete vision qualification profile."""
import contextlib
import hashlib
import io
import json
from pathlib import Path
import re
import tempfile
import unittest
from unittest.mock import patch

import vision_qualification as v


class VisionQualificationTest(unittest.TestCase):
    def arguments(self, *extra):
        return v.parse_arguments(['--binary', '/test/slotstream', '--out', '/test/output', *extra])

    def test_full_profile_matches_original_full_verifier(self):
        source = (v.ROOT / 'Tools/verify.sh').read_text()
        target = float(re.search(r'^VISION_MEMORY=([0-9.]+)$', source, re.M)[1])
        chunk = int(re.search(r'^VISION_PREFILL=([0-9]+)$', source, re.M)[1])
        for extra in [(), ('--memory-gb', '14.5'), ('--combined', '--query-tile', '256')]:
            a = self.arguments(*extra)
            self.assertEqual((a.memory_gb, a.prefill_chunk), (target, chunk))
            env = v.execution_environment(a, Path('/test/output'), {})
            self.assertEqual(env['SLOTSTREAM_PREFILL_CHUNK'], str(chunk))
            command = v.server_command(a, Path('/test/slotstream'), Path('/test/model'), 1234)
            self.assertEqual(command[command.index('--memory-gb') + 1], str(target))
            for key, value in [('--vision', 'on'), ('--mtp', 'off'), ('--max-context', '32768'), ('--max-prefill-wait', '0')]:
                self.assertEqual(command[command.index(key) + 1], value)
            self.assertIn('--no-elastic', command)

    def test_old_full_profile_and_nonfinite_targets_fail_before_work(self):
        with contextlib.redirect_stderr(io.StringIO()):
            for target in ['8.1', '10', '12', '14.5001', 'nan', 'inf']:
                with self.subTest(target=target), self.assertRaises(SystemExit) as error:
                    self.arguments('--memory-gb', target)
                self.assertEqual(error.exception.code, 2)

    def test_bounded_cases_keep_original_targets_and_schedules(self):
        for name in ['same-geometry', 'budget-refusal', 'source-bounds', 'source-reuse']:
            a = self.arguments('--case', name)
            self.assertEqual((a.memory_gb, a.prefill_chunk), (10, None))
            self.assertNotIn('SLOTSTREAM_PREFILL_CHUNK', v.execution_environment(a, Path('/out'), {}))
            command = v.server_command(a, Path('/binary'), Path('/model'), 1234)
            self.assertNotIn('--max-prefill-wait', command)
            for target in ['8.1', '10']:
                a = self.arguments('--case', name, '--memory-gb', target, '--combined')
                self.assertEqual(a.memory_gb, float(target))
                self.assertEqual(a.prefill_chunk, 256)
            with contextlib.redirect_stderr(io.StringIO()):
                for target in ['8', '14.5', 'nan', 'inf']:
                    with self.assertRaises(SystemExit):
                        self.arguments('--case', name, '--memory-gb', target)

    def test_inherited_controls_cannot_change_frozen_profile(self):
        inherited = {'PATH': '/test/bin', 'SLOTSTREAM_PREFILL_CHUNK': '8192',
                     'SLOTSTREAM_OPT_VISION_QUERY_TILE': '0', 'SS_DEBUG_LAYERS': '1'}
        saved = dict(inherited)
        a = self.arguments('--combined', '--query-tile', '256')
        env = v.execution_environment(a, Path('/out'), inherited)
        self.assertEqual(inherited, saved)
        self.assertEqual(env['PATH'], '/test/bin')
        self.assertEqual(env['SLOTSTREAM_PREFILL_CHUNK'], '3072')
        self.assertEqual(env['SLOTSTREAM_OPT_VISION_QUERY_TILE'], '256')
        self.assertEqual(env['SLOTSTREAM_OPT_PREFIX_CHECKPOINT'], '256')
        self.assertNotIn('SS_DEBUG_LAYERS', env)
        with contextlib.redirect_stderr(io.StringIO()), self.assertRaises(SystemExit):
            self.arguments('--query-tile', '256', '--padding', '128')

    def test_admission_refusal_creates_no_attempt_and_launches_no_process(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            identity = {}
            for name, field in [('slotstream', 'binary_sha256'), ('mlx.metallib', 'metallib_sha256'),
                                ('build-source.tar.gz', 'source_archive_sha256')]:
                data = ('fixture ' + name).encode()
                (root / name).write_bytes(data)
                identity[field] = hashlib.sha256(data).hexdigest()
            (root / 'build-identity.json').write_text(json.dumps(identity))
            output = root / 'unattempted'
            a = v.parse_arguments(['--binary', str(root / 'slotstream'), '--out', str(output)])
            with patch.object(v, 'parse_arguments', return_value=a), \
                    patch.object(v, 'preflight', side_effect=RuntimeError('insufficient headroom')) as admission, \
                    patch.object(v.subprocess, 'Popen') as launch:
                with self.assertRaisesRegex(RuntimeError, 'insufficient headroom'):
                    v.main()
                admission.assert_called_once_with(20.5)
                launch.assert_not_called()
                self.assertFalse(output.exists())


if __name__ == '__main__':
    unittest.main()
