"""Exercise the real public-object probe with tiny private files and inert HTTP."""
import argparse
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

PROBE = Path(__file__).with_name('slotpack') / 'public_probe.py'
MODES = [('normal', [], None, 0), ('O', ['-O'], None, 1),
         ('OO', ['-OO'], None, 2), ('env1', [], '1', 1), ('env2', [], '2', 2)]
INVALID = ['hash', 'short', 'long', 'status', 'encoding', 'missing_immutable', 'all_miss']
SENTINEL = 'keep the existing receipt\n'
SUCCESS = 'ANONYMOUS PUBLIC OBJECT HASHES PASS'
CHILD = r'''import contextlib, hashlib, io, json, pathlib, runpy, socket, subprocess, sys
from unittest.mock import patch
import urllib.request
source, destination, case, existing = sys.argv[1:]
root = pathlib.Path(destination)
payloads = [b'first', b'largest---', b'123']
objects = [dict(size=len(data), sha256=hashlib.sha256(data).hexdigest(),
                ranges=[dict(file=number, offset=offset, length=1)
                        for offset in range(3 if number == 2 else 1)])
           for number, data in enumerate(payloads)]
(root/'manifest.json').write_text(json.dumps(dict(objects=objects)))
receipt = root/'receipt.json'
sentinel = 'keep the existing receipt\n'
if existing == 'yes':
    receipt.write_text(sentinel)
base = 'https://fixture.invalid/slotpack'
urls = [base+'/objects/'+obj['sha256'][:2]+'/'+obj['sha256']+'.bin' for obj in objects]
by_url = dict(zip(urls, range(3)))
trace = []
class Response(io.BytesIO):
    def __init__(self, number, data, entry):
        super().__init__(data)
        self.entry = entry
        self.status = entry['status']
        self.url = 'https://edge.fixture.invalid/objects/'+objects[number]['sha256']+'.bin'
        self.headers = {'Content-Type': 'application/octet-stream', 'Content-Length': str(len(data)),
                        'ETag': 'fixture'}
        if case in ('identity', 'both'):
            self.headers['Content-Encoding'] = 'identity'
        if case in ('immutable', 'both', 'missing_immutable'):
            self.headers['Cache-Control'] = 'public, max-age=31536000, immutable'
        if case == 'missing_immutable' and len(trace) == 1:
            self.headers.pop('Cache-Control')
        if case in ('edge', 'both', 'all_miss', 'identity'):
            self.headers['CF-Cache-Status'] = 'HIT' if case in ('edge', 'both') and len(trace) == 6 else 'MISS'
        if case == 'encoding' and len(trace) == 1:
            self.headers['Content-Encoding'] = 'gzip'
        self.entry.update(encoding=self.headers.get('Content-Encoding'),
                          cache_control=self.headers.get('Cache-Control'),
                          cache_status=self.headers.get('CF-Cache-Status'))
    def read(self, size=-1):
        self.entry['read_limit'] = size
        data = super().read(size)
        self.entry.update(actual_bytes=len(data), actual_sha256=hashlib.sha256(data).hexdigest())
        return data
def respond(request, timeout):
    headers = {key.lower(): value for key, value in request.header_items()}
    if (request.full_url not in by_url or timeout != 120 or request.get_method() != 'GET'
            or headers.get('accept-encoding') != 'identity'):
        raise RuntimeError('unexpected public probe fixture request')
    number = by_url[request.full_url]
    data = payloads[number]
    first = not trace
    if first:
        if case == 'hash': data = b'wrong'
        if case == 'short': data = data[:-1]
        if case == 'long': data = data+b'!'
    entry = dict(url=request.full_url, expected_bytes=objects[number]['size'],
                 expected_sha256=objects[number]['sha256'],
                 status=206 if first and case == 'status' else 200,
                 accept_encoding=headers['accept-encoding'])
    trace.append(entry)
    return Response(number, data, entry)
flags = []
if case in ('immutable', 'both', 'missing_immutable'): flags.append('--require-immutable')
if case in ('edge', 'both', 'all_miss'): flags.append('--require-edge-hit')
sys.argv = [source, '--package', str(root), '--base', base, '--receipt', str(receipt), *flags]
output, failure = io.StringIO(), None
with patch.object(urllib.request, 'urlopen', side_effect=respond), \
        patch.object(socket, 'socket', side_effect=AssertionError('real socket forbidden')), \
        patch.object(subprocess, 'Popen', side_effect=AssertionError('process launch forbidden')), \
        patch.dict(sys.modules, {'pack': None, 'mlx': None}), contextlib.redirect_stdout(output):
    try:
        runpy.run_path(source, run_name='__main__')
    except Exception as error:
        failure = type(error).__name__+': '+str(error)
text = receipt.read_text() if receipt.exists() else None
try:
    parsed = json.loads(text) if text is not None else None
except json.JSONDecodeError:
    parsed = None
print(json.dumps(dict(optimize=sys.flags.optimize, error=failure, stdout=output.getvalue(),
    receipt_bytes=text, receipt=parsed, trace=trace, expected_urls=[url for url in urls for _ in range(2)])))
'''


class PublicProbeTests(unittest.TestCase):
    def run_case(self, case, mode, *, existing=False):
        name, switches, optimize, expected = mode
        with tempfile.TemporaryDirectory(prefix='slotstream-public-probe-') as directory:
            env = {'PATH': os.defpath, 'HOME': directory, 'TMPDIR': directory,
                   'PYTHONDONTWRITEBYTECODE': '1'}
            if optimize is not None:
                env['PYTHONOPTIMIZE'] = optimize
            child = subprocess.run([sys.executable, *switches, '-B', '-s', '-c', CHILD,
                                    str(PROBE), directory, case, 'yes' if existing else 'no'],
                                   cwd=directory, env=env, stdin=subprocess.DEVNULL,
                                   capture_output=True, text=True, timeout=5)
        self.assertEqual(child.returncode, 0, child.stdout+child.stderr)
        self.assertEqual(child.stderr, '')
        result = json.loads(child.stdout)
        self.assertEqual(result['optimize'], expected, name)
        self.assertTrue(result['trace'])
        self.assertTrue(all(row['read_limit'] == row['expected_bytes']+1 for row in result['trace']))
        return result

    def evidence(self, result, existing):
        receipt = result['receipt'] or {}
        return {'optimize': result['optimize'], 'error': result['error'],
                'success_output': result['stdout'], 'receipt_pass': receipt.get('pass_'),
                'receipt_objects': len(receipt.get('objects', [])),
                'receipt_cache_statuses': [row['headers'].get('cf-cache-status')
                                           for row in receipt.get('objects', [])],
                'receipt_changed': result['receipt_bytes'] != (SENTINEL if existing else None),
                'first_delivery': result['trace'][0]}

    def expect_refusal(self, case, mode, existing):
        result = self.run_case(case, mode, existing=existing)
        evidence = self.evidence(result, existing)
        self.assertIsNotNone(result['error'], evidence)
        self.assertEqual(result['receipt_bytes'], SENTINEL if existing else None, evidence)
        self.assertNotIn(SUCCESS, result['stdout'], evidence)

    def expect_success(self, case, mode):
        result = self.run_case(case, mode, existing=True)
        self.assertIsNone(result['error'], result)
        self.assertEqual(result['stdout'], SUCCESS+'\n')
        self.assertEqual([row['url'] for row in result['trace']], result['expected_urls'])
        receipt = result['receipt']
        self.assertIs(receipt['pass_'], True)
        self.assertEqual(receipt['base'], 'https://fixture.invalid/slotpack')
        self.assertEqual(len(receipt['objects']), 6)
        for number, (row, delivered) in enumerate(zip(receipt['objects'], result['trace'])):
            self.assertEqual(row['sha256'], delivered['expected_sha256'])
            self.assertEqual(row['sha256'], delivered['actual_sha256'])
            self.assertEqual(row['bytes'], delivered['expected_bytes'])
            self.assertEqual(row['read'], number % 2+1)
            self.assertEqual(row['resolvedHost'], 'edge.fixture.invalid')
            self.assertEqual(row['headers']['content-length'], str(row['bytes']))
        if case in ('hf', 'identity'):
            self.assertTrue(all('cache-control' not in row['headers'] for row in receipt['objects']))
        if case in ('edge', 'both'):
            self.assertEqual([row['headers']['cf-cache-status'] for row in receipt['objects']],
                             ['MISS']*5+['HIT'])

    def test_default_hf_delivery_in_all_modes(self):
        for mode in MODES:
            for case in ('hf', 'identity'):
                with self.subTest(mode=mode[0], case=case):
                    self.expect_success(case, mode)

    def test_optional_cache_requirements_in_all_modes(self):
        for mode in MODES:
            for case in ('immutable', 'edge', 'both'):
                with self.subTest(mode=mode[0], case=case):
                    self.expect_success(case, mode)

    def test_unoptimized_rejects_invalid_delivery(self):
        for case in INVALID:
            for existing in (False, True):
                with self.subTest(case=case, existing=existing):
                    self.expect_refusal(case, MODES[0], existing)

    def reject_in_all_modes(self, case):
        for mode in MODES:
            for existing in (False, True):
                with self.subTest(mode=mode[0], existing=existing):
                    self.expect_refusal(case, mode, existing)

    def test_wrong_hash_never_publishes_pass(self):
        self.reject_in_all_modes('hash')

    def test_short_body_never_publishes_pass(self):
        self.reject_in_all_modes('short')

    def test_long_body_never_publishes_pass(self):
        self.reject_in_all_modes('long')

    def test_partial_status_never_publishes_pass(self):
        self.reject_in_all_modes('status')

    def test_nonidentity_encoding_never_publishes_pass(self):
        self.reject_in_all_modes('encoding')

    def test_required_immutable_never_publishes_false_pass(self):
        self.reject_in_all_modes('missing_immutable')

    def test_required_edge_hit_never_publishes_false_pass(self):
        self.reject_in_all_modes('all_miss')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--probe', type=Path, default=PROBE)
    options, remaining = parser.parse_known_args()
    PROBE = options.probe.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])
