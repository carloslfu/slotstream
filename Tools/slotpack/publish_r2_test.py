"""Run the retained publisher's real main under normal and optimized Python.

Only tiny private packages, finite authority/HTTP doubles and already-complete
resume receipts are used. No cloud client, real token, socket or model is used.
"""
import contextlib
import hashlib
import io
import json
import os
from pathlib import Path
import socket
import subprocess
import sys
import tempfile
import types
import unittest
from unittest.mock import patch


SOURCE = Path(__file__).resolve().with_name('publish_r2.py')
ACCOUNT = 'fixture-account'
BUCKET = 'fixture-bucket'
TOKEN = 'fixture-token-not-a-credential'
ETAG = '"fixture-etag"'
ADDRESS = f'https://api.cloudflare.com/client/v4/accounts/{ACCOUNT}/r2/buckets/{BUCKET}/objects/'
PAYLOAD = b'tiny compressed fixture\x00'


class SandboxViolation(RuntimeError):
    pass


def probe(root, token_stdin):
    """Child-only entry: install all doubles before calling the actual main."""
    requests, violations = [], []
    token_calls = 0
    before = (root / 'upload.json').read_bytes() if (root / 'upload.json').exists() else None
    data = (root / 'manifest.json').read_bytes()
    digest = hashlib.sha256(data).hexdigest()
    prefix = 'slotpack/v1/' + digest
    allowed = {ADDRESS + prefix + '/manifest.json'}
    for obj in json.loads(data)['objects']:
        allowed.add(ADDRESS + prefix + f"/objects/{obj['sha256'][:2]}/{obj['sha256']}.bin")

    def forbidden(operation):
        def reject(*args, **kwargs):
            violations.append(operation)
            raise SandboxViolation('forbidden fixture operation: ' + operation)
        return reject

    def authority():
        nonlocal token_calls
        token_calls += 1
        if token_stdin or token_calls > 2:
            return forbidden('unexpected authority lookup')()
        return TOKEN

    class Response:
        headers = {'ETag': ETAG}

        def __enter__(self):
            return self

        def __exit__(self, *args):
            return False

        def read(self):
            return b''

    def urlopen(request, timeout):
        # Bad payloads deliberately reach this finite double on old -O code.
        # Do not reject their SHA/size here and mistake the double for a guard.
        headers = {key.lower(): value for key, value in request.header_items()}
        if (len(requests) >= 2 or request.full_url not in allowed
                or request.get_method() != 'PUT' or timeout != 180
                or type(request.data) is not bytes or len(request.data) > 4096
                or headers.get('authorization') != 'Bearer ' + TOKEN):
            return forbidden('unexpected HTTP request')()
        requests.append({'url': request.full_url, 'method': request.get_method(),
                         'payload_hex': request.data.hex(),
                         'content_length': headers.get('content-length'),
                         'content_type': headers.get('content-type'),
                         'cache_control': headers.get('cache-control')})
        return Response()

    output, errors = io.StringIO(), io.StringIO()
    exception = None
    code = 0
    source_bytes = SOURCE.read_bytes()
    with contextlib.ExitStack() as stack:
        stack.enter_context(patch.object(socket, 'socket', forbidden('socket')))
        stack.enter_context(patch.object(socket, 'create_connection', forbidden('connection')))
        stack.enter_context(patch.object(socket, 'getaddrinfo', forbidden('DNS')))
        stack.enter_context(patch.object(subprocess, 'Popen', forbidden('subprocess')))
        stack.enter_context(patch.object(os, 'system', forbidden('shell')))
        stack.enter_context(patch.object(Path, 'home', return_value=root / 'private-home'))
        stack.enter_context(contextlib.redirect_stdout(output))
        stack.enter_context(contextlib.redirect_stderr(errors))
        module = types.ModuleType('r2_fixture_publisher')
        module.__file__ = str(SOURCE)
        # Compile these exact bytes under this child's actual optimization
        # flag. A pre-existing timestamp-based .pyc cannot substitute source.
        exec(compile(source_bytes, str(SOURCE), 'exec'), module.__dict__)
        stack.enter_context(patch.object(module, 'token', authority))
        stack.enter_context(patch.object(module.urllib.request, 'urlopen', urlopen))
        stack.enter_context(patch.object(module.time, 'sleep', forbidden('retry sleep')))
        arguments = [str(SOURCE), '--package', str(root), '--account', ACCOUNT,
                     '--bucket', BUCKET, '--receipt', str(root / 'upload.json'),
                     '--workers', (root / 'workers').read_text()]
        if token_stdin:
            arguments.append('--token-stdin')
        stack.enter_context(patch.object(sys, 'argv', arguments))
        stack.enter_context(patch.object(sys, 'stdin', io.StringIO(TOKEN + '\n')))
        try:
            module.main()
        except SystemExit as error:
            exception = error
            code = error.code if type(error.code) is int else 1
        except Exception as error:
            exception = error
            code = 1

    after = (root / 'upload.json').read_bytes() if (root / 'upload.json').exists() else None
    result = {'main_exit': code, 'optimized': sys.flags.optimize,
              'source_sha256': hashlib.sha256(source_bytes).hexdigest(),
              'stdout': output.getvalue(), 'stderr': errors.getvalue(),
              'error_type': type(exception).__name__ if exception else None,
              'error_text': str(exception) if exception else None,
              'error_filename': Path(exception.filename).name
                  if isinstance(exception, FileNotFoundError) and exception.filename else None,
              'requests': requests, 'token_calls': token_calls, 'violations': violations,
              'receipt_preserved': before == after,
              'receipt': json.loads(after) if after is not None else None}
    print(json.dumps(result, sort_keys=True), flush=True)
    return code


class RuntimePublicationChecks(unittest.TestCase):
    def fixture(self, root, fault):
        sha = hashlib.sha256(PAYLOAD).hexdigest()
        relative = f'objects/{sha[:2]}/{sha}.bin'
        manifest = {'objects': [{'sha256': sha, 'size': len(PAYLOAD)}]}
        data = (json.dumps(manifest, separators=(',', ':')) + '\n').encode()
        digest = hashlib.sha256(data).hexdigest()
        build = {'allOriginalHashesVerified': True, 'roundtripVerified': True,
                 'completeCoverage': True, 'manifestSHA256': digest}
        done = {relative: {'sha256': sha, 'size': len(PAYLOAD), 'etag': ETAG},
                'manifest.json': {'sha256': digest, 'size': len(data), 'etag': ETAG}}
        receipt = {'account': ACCOUNT, 'bucket': BUCKET, 'prefix': 'slotpack/v1/' + digest,
                   'manifestSHA256': digest, 'objects': done}
        (root / relative).parent.mkdir(parents=True)
        (root / relative).write_bytes(PAYLOAD)
        (root / 'manifest.json').write_bytes(data)
        (root / 'manifest.sha256').write_text(digest + '\n')
        (root / 'workers').write_text('1')
        if fault == 'manifest-pin':
            (root / 'manifest.sha256').write_text('0' * 64 + '\n')
        elif fault.startswith('build-'):
            key = fault.removeprefix('build-')
            build[key] = '0' * 64 if key == 'manifestSHA256' else False
        elif fault.startswith('resume-'):
            receipt[fault.removeprefix('resume-')] = 'different-fixture-identity'
        elif fault == 'cached-sha':
            done[relative]['sha256'] = '0' * 64
        elif fault == 'cached-size':
            done[relative]['size'] += 1
        elif fault in ('payload-sha', 'payload-size'):
            done.pop(relative)
            changed = b'X' * len(PAYLOAD) if fault == 'payload-sha' else PAYLOAD + b'X'
            (root / relative).write_bytes(changed)
        elif fault == 'missing-pin-and-fields':
            (root / 'manifest.json').write_text('{"objects":[]}')
            (root / 'manifest.sha256').unlink()
            build = {}
            receipt = {'objects': {'manifest.json': {}}}
        elif fault in ('upload', 'stdin-upload'):
            receipt = None
        elif fault in ('workers-0', 'workers-17'):
            (root / 'workers').write_text(fault.removeprefix('workers-'))
        elif fault != 'resume':
            raise ValueError('unknown fixture: ' + fault)
        (root / 'build-receipt.json').write_text(json.dumps(build))
        if receipt is not None:
            (root / 'upload.json').write_text(json.dumps(receipt) + '\n')
        return digest, relative, data, done

    def run_probe(self, fault, optimized):
        with tempfile.TemporaryDirectory(prefix='slotstream-r2-validation-') as temporary:
            root = Path(temporary)
            expected = self.fixture(root, fault)
            command = [sys.executable, '-I', '-B'] + (['-O'] if optimized else [])
            command += [str(Path(__file__).resolve()), '--probe', str(root),
                        'stdin' if fault == 'stdin-upload' else 'environment']
            # No inherited token, cloud configuration or Python optimization.
            # The child also replaces Path.home/token before actual main.
            environment = {'PATH': os.defpath, 'LANG': 'C', 'LC_ALL': 'C'}
            run = subprocess.run(command, env=environment, text=True, capture_output=True,
                                 timeout=10, check=False)
            try:
                result = json.loads(run.stdout)
            except ValueError as error:
                self.fail(f'probe protocol failed: {run.returncode}, {run.stdout!r}, {run.stderr!r}: {error}')
            print(json.dumps({'case': fault, **result}, sort_keys=True), flush=True)
            self.assertEqual(run.stderr, '', run.stderr)
            self.assertEqual(run.returncode, result['main_exit'], result)
            self.assertEqual(result['optimized'], 1 if optimized else 0, result)
            self.assertEqual(result['source_sha256'], hashlib.sha256(SOURCE.read_bytes()).hexdigest())
            self.assertEqual(result['violations'], [], result)
            return result, expected

    def rejection(self, fault):
        for optimized in (False, True):
            with self.subTest(fault=fault, optimized=optimized):
                result, _ = self.run_probe(fault, optimized)
                if fault == 'missing-pin-and-fields':
                    self.assertEqual(result['error_type'], 'FileNotFoundError', result)
                    self.assertEqual(result['error_filename'], 'manifest.sha256', result)
                else:
                    expected = ('ValueError',) if optimized else ('AssertionError', 'ValueError')
                    self.assertIn(result['error_type'], expected, result)
                self.assertEqual(result['main_exit'], 1, result)
                self.assertNotIn('UPLOAD COMPLETE ', result['stdout'], result)
                self.assertEqual(result['requests'], [], result)
                self.assertEqual(result['token_calls'], 0, result)
                self.assertTrue(result['receipt_preserved'], result)

    def test_manifest_pin_mismatch_is_rejected(self):
        self.rejection('manifest-pin')

    def test_build_qualification_is_rejected(self):
        for field in ('allOriginalHashesVerified', 'roundtripVerified',
                      'completeCoverage', 'manifestSHA256'):
            self.rejection('build-' + field)

    def test_resume_identity_mismatch_is_rejected(self):
        for field in ('account', 'bucket', 'manifestSHA256'):
            self.rejection('resume-' + field)

    def test_completed_object_identity_mismatch_is_rejected(self):
        for field in ('sha', 'size'):
            self.rejection('cached-' + field)

    def test_payload_identity_mismatch_is_rejected(self):
        for field in ('sha', 'size'):
            self.rejection('payload-' + field)

    def test_missing_pin_and_fields_cannot_report_completion(self):
        self.rejection('missing-pin-and-fields')

    def successful_upload(self, fault):
        for optimized in (False, True):
            with self.subTest(fault=fault, optimized=optimized):
                result, (digest, relative, data, done) = self.run_probe(fault, optimized)
                self.assertEqual(result['main_exit'], 0, result)
                self.assertIsNone(result['error_type'], result)
                self.assertEqual(result['token_calls'], 0 if fault == 'stdin-upload' else 2, result)
                prefix = 'slotpack/v1/' + digest
                self.assertEqual(result['stdout'].splitlines()[-1], 'UPLOAD COMPLETE ' + prefix)
                self.assertEqual([row['url'] for row in result['requests']],
                                 [ADDRESS + prefix + '/' + relative, ADDRESS + prefix + '/manifest.json'])
                self.assertEqual([bytes.fromhex(row['payload_hex']) for row in result['requests']],
                                 [PAYLOAD, data])
                for row, body in zip(result['requests'], (PAYLOAD, data)):
                    self.assertEqual(row['method'], 'PUT')
                    self.assertEqual(row['content_length'], str(len(body)))
                    self.assertEqual(row['cache_control'], 'public, max-age=31536000, immutable')
                    self.assertEqual(row['content_type'], 'application/json' if body == data
                                     else 'application/octet-stream')
                self.assertEqual(result['receipt'], {'account': ACCOUNT, 'bucket': BUCKET,
                    'prefix': prefix, 'manifestSHA256': digest, 'objects': done})

    def test_valid_upload_preserves_exact_requests_and_receipt(self):
        self.successful_upload('upload')

    def test_token_stdin_upload_uses_no_authority_lookup(self):
        self.successful_upload('stdin-upload')

    def test_complete_resume_preserves_receipt_without_transport(self):
        for optimized in (False, True):
            with self.subTest(optimized=optimized):
                result, (digest, _, _, _) = self.run_probe('resume', optimized)
                self.assertEqual(result['main_exit'], 0, result)
                self.assertIsNone(result['error_type'], result)
                self.assertEqual(result['stdout'], 'UPLOAD COMPLETE slotpack/v1/' + digest + '\n')
                self.assertEqual(result['requests'], [], result)
                self.assertEqual(result['token_calls'], 0, result)
                self.assertTrue(result['receipt_preserved'], result)

    def test_worker_bounds_remain_cli_errors(self):
        for fault in ('workers-0', 'workers-17'):
            for optimized in (False, True):
                with self.subTest(fault=fault, optimized=optimized):
                    result, _ = self.run_probe(fault, optimized)
                    self.assertEqual(result['main_exit'], 2, result)
                    self.assertEqual(result['error_type'], 'SystemExit', result)
                    self.assertIn('workers must be 1..16', result['stderr'], result)
                    self.assertNotIn('UPLOAD COMPLETE ', result['stdout'], result)
                    self.assertEqual(result['requests'], [], result)
                    self.assertEqual(result['token_calls'], 0, result)
                    self.assertTrue(result['receipt_preserved'], result)


if __name__ == '__main__':
    if len(sys.argv) == 4 and sys.argv[1] == '--probe':
        raise SystemExit(probe(Path(sys.argv[2]), sys.argv[3] == 'stdin'))
    unittest.main()
