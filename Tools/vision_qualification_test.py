#!/usr/bin/env python3
"""Model-free regression tests for the complete vision qualification profile."""
import contextlib
import hashlib
import io
import json
from pathlib import Path
import re
import subprocess
import sys
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


class SelectedBinaryIdentityTest(unittest.TestCase):
    PROBE = r'''
import json
from pathlib import Path
import sys
from unittest.mock import patch

sys.path.insert(0, sys.argv[1])
import vision_qualification as v

arguments = v.parse_arguments(json.loads(sys.argv[2]))

class AdmissionReached(RuntimeError):
    pass

with patch.object(v, 'parse_arguments', return_value=arguments), \
        patch.object(v, 'preflight', side_effect=AdmissionReached('identity accepted')) as admission, \
        patch.object(v, 'model_identity', side_effect=AssertionError('model observation forbidden')) as model, \
        patch.object(v.socket, 'socket', side_effect=AssertionError('socket reservation forbidden')) as socket, \
        patch.object(v.subprocess, 'Popen', side_effect=AssertionError('process launch forbidden')) as launch, \
        patch.object(v, 'vm_snapshot', side_effect=AssertionError('VM observation forbidden')) as vm, \
        patch.object(v, 'wait_ready', side_effect=AssertionError('server wait forbidden')) as ready, \
        patch.object(v.shutil, 'copy2', side_effect=AssertionError('attempt copy forbidden')) as copy:
    outcome, message = 'returned', ''
    try:
        v.main()
    except AdmissionReached as error:
        outcome, message = 'admission', str(error)
    except ValueError as error:
        outcome, message = 'identity_error', str(error)
    except OSError as error:
        outcome, message = type(error).__name__, str(error)
    print(json.dumps({'outcome': outcome, 'message': message,
        'admission_calls': [list(call.args) for call in admission.call_args_list],
        'forbidden_calls': [mock.call_count for mock in (model, socket, launch, vm, ready, copy)],
        'output_exists': arguments.out.exists()}))
'''

    def observe_identity(self, selected_name, selected_bytes, canonical_bytes,
                         *, changed_companion=None):
        expected = b'inert verified executable; never run\n'
        with tempfile.TemporaryDirectory(prefix="vision identity '") as folder:
            root = Path(folder).resolve()
            (root / 'home').mkdir()
            (root / 'tmp').mkdir()
            identity = {'binary_sha256': hashlib.sha256(expected).hexdigest()}
            for name, field in [('mlx.metallib', 'metallib_sha256'),
                                ('build-source.tar.gz', 'source_archive_sha256')]:
                data = ('inert ' + name).encode()
                identity[field] = hashlib.sha256(data).hexdigest()
                (root / name).write_bytes(data + (b'changed' if name == changed_companion else b''))
            if canonical_bytes is not None:
                (root / 'slotstream').write_bytes(canonical_bytes)
            if selected_bytes is not None:
                (root / selected_name).write_bytes(selected_bytes)
            (root / 'build-identity.json').write_text(json.dumps(identity))
            output = root / 'unattempted'
            argv = ['--binary', str(root / selected_name), '--out', str(output),
                    '--model', str(root / 'unused model')]
            result = subprocess.run([sys.executable, '-I', '-B', '-c', self.PROBE,
                                     str(Path(__file__).resolve().parent), json.dumps(argv)],
                env={**v.os.environ, 'HOME': str(root / 'home'), 'TMPDIR': str(root / 'tmp')},
                stdin=subprocess.DEVNULL, capture_output=True, text=True, timeout=10)
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            self.assertEqual(result.stderr, '')
            observed = json.loads(result.stdout)
            self.assertEqual(observed['forbidden_calls'], [0] * 6)
            self.assertFalse(observed['output_exists'])
            self.assertFalse(output.exists())
            return observed

    def assert_admitted(self, observed):
        self.assertEqual(observed['outcome'], 'admission', observed)
        self.assertEqual(observed['admission_calls'], [[20.5]])

    def assert_identity_refused(self, observed):
        self.assertEqual(observed['outcome'], 'identity_error', observed)
        self.assertEqual(observed['message'], 'frozen build identity differs')
        self.assertEqual(observed['admission_calls'], [])

    def test_canonical_identity_reaches_admission(self):
        data = b'inert verified executable; never run\n'
        self.assert_admitted(self.observe_identity('slotstream', data, None))

    def test_canonical_mismatch_refuses_before_admission(self):
        self.assert_identity_refused(self.observe_identity('slotstream', b'wrong', None))

    def test_companion_mismatches_refuse_before_admission(self):
        data = b'inert verified executable; never run\n'
        for name in ('mlx.metallib', 'build-source.tar.gz'):
            with self.subTest(companion=name):
                self.assert_identity_refused(self.observe_identity('slotstream', data, None,
                                                                    changed_companion=name))

    def test_selected_mismatch_refuses_despite_matching_sibling(self):
        data = b'inert verified executable; never run\n'
        self.assert_identity_refused(self.observe_identity('selected candidate', b'wrong', data))

    def test_missing_selected_refuses_despite_matching_sibling(self):
        data = b'inert verified executable; never run\n'
        observed = self.observe_identity('missing candidate', None, data)
        self.assertEqual(observed['outcome'], 'FileNotFoundError', observed)
        self.assertEqual(observed['admission_calls'], [])

    def test_verified_renamed_binary_needs_no_canonical_sibling(self):
        data = b'inert verified executable; never run\n'
        self.assert_admitted(self.observe_identity('selected candidate', data, None))

    def test_verified_renamed_binary_ignores_unrelated_sibling(self):
        data = b'inert verified executable; never run\n'
        self.assert_admitted(self.observe_identity('selected candidate', data, b'unrelated sibling'))


if __name__ == '__main__':
    unittest.main()
