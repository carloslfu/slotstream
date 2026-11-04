"""Tiny real-producer integrity checks in ordinary and optimized interpreters."""
import argparse
import importlib.util
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import types
import unittest
from unittest.mock import patch

PRODUCER = Path(__file__).with_name('fetch_build_inputs.py')
GATE = Path(__file__).with_name('checks.py')
MODES = [('normal', [], None, 0), ('O', ['-O'], None, 1),
         ('OO', ['-OO'], None, 2), ('env1', [], '1', 1), ('env2', [], '2', 2)]
CHILD = r'''import contextlib, hashlib, io, json, os, pathlib, runpy, sys, types
from unittest.mock import patch
import urllib.request
source, destination, case = sys.argv[1:]
root = pathlib.Path(destination)
payload = b'abcd'
data = b'abc' if case == 'short' else b'wxyz' if case == 'hash' else payload
pin = dict(path='fixture.safetensors', size=4, sha256=hashlib.sha256(payload).hexdigest())
pack = types.ModuleType('pack')
pack.pins = lambda: [pin]
pack.sha_file = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
sys.modules['pack'] = pack
requests, writes = [], []
class Response(io.BytesIO):
    def __init__(self):
        super().__init__(data)
        self.status = 200 if case == 'full' else 206
        self.headers = {'Content-Range': 'bytes 1-4/5' if case == 'range' else 'bytes 0-3/4', 'Content-Length': '4'}
def respond(request, timeout):
    if request.full_url != 'https://fixture.invalid/fixture.safetensors' or timeout != 120 or request.get_header('Range') != 'bytes=0-3':
        raise RuntimeError('unexpected fixture request')
    requests.append(request.full_url)
    return Response()
real_pwrite = os.pwrite
def record_write(fd, chunk, offset):
    writes.append(len(chunk))
    # Avoid the old optimized short-body zero-progress loop, while retaining
    # evidence that malformed bytes reached the real file before rejection.
    if not chunk:
        raise RuntimeError('fixture stopped an empty pwrite')
    return real_pwrite(fd, chunk, offset)
output = io.StringIO()
failure = None
sys.argv = [source, '--destination', destination, '--base', 'https://fixture.invalid']
with patch.object(urllib.request, 'urlopen', side_effect=respond), patch('time.sleep', return_value=None), patch.object(os, 'pwrite', side_effect=record_write), contextlib.redirect_stdout(output):
    try:
        runpy.run_path(source, run_name='__main__')
    except Exception as error:
        failure = type(error).__name__ + ': ' + str(error)
print(json.dumps(dict(optimize=sys.flags.optimize, error=failure, stdout=output.getvalue(), requests=len(requests), writes=writes, file_hex=(root/'fixture.safetensors').read_bytes().hex(), state=(root/'.producer-resume.json').read_text() if (root/'.producer-resume.json').exists() else None)))
'''


class ProducerValidation(unittest.TestCase):
    def run_case(self, case, mode):
        name, switches, optimized, expected = mode
        with tempfile.TemporaryDirectory(prefix='slotstream-producer-validation-') as temporary:
            env = os.environ.copy()
            env.pop('PYTHONOPTIMIZE', None)
            env.update(HOME=temporary, TMPDIR=temporary, PYTHONDONTWRITEBYTECODE='1')
            if optimized is not None:
                env['PYTHONOPTIMIZE'] = optimized
            result = subprocess.run([sys.executable, *switches, '-B', '-c', CHILD,
                                     str(PRODUCER), temporary, case], cwd=temporary,
                                    env=env, stdin=subprocess.DEVNULL,
                                    capture_output=True, text=True, timeout=10)
        self.assertEqual(result.returncode, 0, result.stdout+result.stderr)
        self.assertEqual(result.stderr, '')
        report = json.loads(result.stdout)
        self.assertEqual(report['optimize'], expected, name)
        return report

    def expect_refusal(self, report, before_write=False):
        self.assertIsNotNone(report['error'], report)
        self.assertNotIn('ALL BUILD INPUTS VERIFIED', report['stdout'])
        if before_write:
            self.assertEqual(report['writes'], [], report)
            self.assertIsNone(report['state'])

    def test_valid_transfers_in_all_interpreter_modes(self):
        for mode in MODES:
            for case in ('full', 'valid'):
                with self.subTest(mode=mode[0], case=case):
                    report = self.run_case(case, mode)
                    self.assertIsNone(report['error'], report)
                    self.assertIn('ALL BUILD INPUTS VERIFIED', report['stdout'])
                    self.assertEqual(report['file_hex'], b'abcd'.hex())
                    self.assertEqual(json.loads(report['state']), ['0:0'])
                    self.assertEqual(report['requests'], 1)

    def test_unoptimized_rejects_invalid_inputs(self):
        for case in ('range', 'short', 'hash'):
            with self.subTest(case=case):
                self.expect_refusal(self.run_case(case, MODES[0]), case != 'hash')

    def test_wrong_range_is_rejected_before_writing(self):
        for mode in MODES:
            with self.subTest(mode=mode[0]):
                self.expect_refusal(self.run_case('range', mode), before_write=True)

    def test_short_body_is_rejected_before_writing(self):
        for mode in MODES:
            with self.subTest(mode=mode[0]):
                self.expect_refusal(self.run_case('short', mode), before_write=True)

    def test_wrong_hash_never_reports_verified(self):
        for mode in MODES:
            with self.subTest(mode=mode[0]):
                self.expect_refusal(self.run_case('hash', mode))

    def test_gate_failure_stops_before_compilation(self):
        with tempfile.TemporaryDirectory(prefix='slotstream-producer-gate-') as temporary:
            root = Path(temporary)
            dependencies = {name: types.ModuleType(name) for name in ('download_checks', 'raw_checks', 'memory_checks')}
            dependencies['download_checks'].ROOT = root
            dependencies['download_checks'].OUT = root/'out'
            spec = importlib.util.spec_from_file_location('producer_gate_fixture', GATE)
            module = importlib.util.module_from_spec(spec)
            with patch.dict(sys.modules, dependencies):
                spec.loader.exec_module(module)
            seen = []
            def reject_validation(argv, **keywords):
                seen.append(argv)
                if len(argv) > 1 and str(argv[1]).endswith('/fetch_build_inputs_validation_checks.py'):
                    self.assertEqual(keywords, {'check': True})
                    raise subprocess.CalledProcessError(23, argv)
                if argv[0] != 'python3':
                    raise RuntimeError('unexpected compilation boundary')
                return subprocess.CompletedProcess(argv, 0)
            with patch.object(module.subprocess, 'run', side_effect=reject_validation):
                with self.assertRaises(subprocess.CalledProcessError) as caught:
                    module.main()
            self.assertEqual(caught.exception.returncode, 23)
            self.assertTrue(seen)
            self.assertTrue(all(argv[0] == 'python3' for argv in seen))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--producer', type=Path, default=PRODUCER)
    parser.add_argument('--gate', type=Path, default=GATE)
    options, remaining = parser.parse_known_args()
    PRODUCER, GATE = options.producer.resolve(), options.gate.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])
