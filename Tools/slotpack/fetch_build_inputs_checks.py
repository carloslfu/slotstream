"""Tiny on-disk resume regressions; only pinned inputs and HTTP are fixtures."""
import hashlib
import io
import json
import os
from pathlib import Path
import sys
import tempfile
import threading
import unittest
from unittest.mock import patch

import fetch_build_inputs as producer


class Response(io.BytesIO):
    status = 206

    def __init__(self, data):
        super().__init__(data)
        self.headers = {'Content-Range': f'bytes 0-{len(data)-1}/{len(data)}'}


class ProducerResume(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-producer-resume-')
        self.addCleanup(self.temp.cleanup)
        self.dest = Path(self.temp.name)/'inputs'
        self.payloads = {'first.safetensors': b'first fixture with a nonzero tail!',
                         'config.json': b'{"fixture":"second intact file"}\n'}
        self.files = [dict(path=name, size=len(data), sha256=hashlib.sha256(data).hexdigest(),
                           optional=False) for name, data in self.payloads.items()]
        self.requests = []
        self.request_lock = threading.Lock()
        self.state = self.dest/'.producer-resume.json'
        self.first = self.dest/'first.safetensors'
        self.second = self.dest/'config.json'

    def response(self, request, timeout):
        name = request.full_url.removeprefix('https://fixture.invalid/')
        data = self.payloads[name]
        self.assertEqual(request.full_url, 'https://fixture.invalid/'+name)
        self.assertEqual(request.get_header('Range'), f'bytes=0-{len(data)-1}')
        self.assertEqual(timeout, 120)
        with self.request_lock:
            self.requests.append(name)
        return Response(data)

    def invoke(self):
        arguments = ['fetch_build_inputs.py', '--destination', str(self.dest),
                     '--base', 'https://fixture.invalid']
        with patch.object(sys, 'argv', arguments), patch.object(producer.pack, 'pins', return_value=self.files), \
                patch.object(producer.urllib.request, 'urlopen', side_effect=self.response):
            try:
                producer.main()
            except Exception as error:
                return error
        return None

    def seed(self):
        self.assertIsNone(self.invoke())
        self.assertCountEqual(self.requests, list(self.payloads))
        self.assertEqual(json.loads(self.state.read_text()), ['0:0', '1:0'])
        self.requests.clear()

    def expect_recovered(self):
        error = self.invoke()
        self.assertIsNone(error, repr(error))
        self.assertEqual(self.requests, ['first.safetensors'])
        for name, payload in self.payloads.items():
            self.assertEqual((self.dest/name).read_bytes(), payload)
        self.assertEqual(json.loads(self.state.read_text()), ['0:0', '1:0'])

    def test_fresh_fetch_and_intact_resume(self):
        self.seed()
        self.assertIsNone(self.invoke())
        self.assertEqual(self.requests, [])
        self.assertEqual(self.second.read_bytes(), self.payloads['config.json'])

    def test_deleted_file_is_refetched_without_losing_other_progress(self):
        self.seed()
        self.first.unlink()
        self.expect_recovered()

    def test_truncated_file_is_refetched_without_losing_other_progress(self):
        self.seed()
        self.first.write_bytes(self.payloads['first.safetensors'][:5])
        self.expect_recovered()

    def test_oversized_file_is_conservatively_refetched(self):
        self.seed()
        with self.first.open('ab') as output:
            output.write(b'excess bytes')
        self.expect_recovered()

    def test_all_stale_file_keys_are_saved_before_destination_open(self):
        self.seed()
        self.first.unlink()
        self.state.write_text(json.dumps(['0:0', '0:67108864', '1:0']))
        observations = []
        real_open = os.open

        def observe_open(*arguments, **keywords):
            observations.append(json.loads(self.state.read_text()))
            return real_open(*arguments, **keywords)

        with patch.object(producer.os, 'open', side_effect=observe_open):
            error = self.invoke()
        self.assertIsNone(error, repr(error))
        self.assertTrue(observations)
        self.assertTrue(all(keys == ['1:0'] for keys in observations), observations)
        self.assertEqual(json.loads(self.state.read_text()), ['0:0', '1:0'])

    def test_state_replace_failure_precedes_destination_mutation(self):
        self.seed()
        self.first.unlink()
        before = self.state.read_bytes()
        with patch.object(producer.os, 'replace', side_effect=OSError('injected state failure')), \
                patch.object(producer.os, 'open', wraps=os.open) as opening, \
                patch.object(producer.os, 'ftruncate', wraps=os.ftruncate) as resizing:
            error = self.invoke()
        self.assertIsInstance(error, OSError)
        opening.assert_not_called()
        resizing.assert_not_called()
        self.assertFalse(self.first.exists())
        self.assertEqual(self.state.read_bytes(), before)
        self.assertEqual(self.second.read_bytes(), self.payloads['config.json'])
        self.expect_recovered()

    def test_interruption_after_resize_leaves_progress_safe_for_retry(self):
        self.seed()
        self.first.unlink()
        observations, opened = [], []
        real_open, real_resize = os.open, os.ftruncate

        def capture_open(*arguments, **keywords):
            fd = real_open(*arguments, **keywords)
            opened.append(fd)
            return fd

        def interrupt_resize(fd, size):
            observations.append(json.loads(self.state.read_text()))
            real_resize(fd, size)
            raise RuntimeError('injected interruption after resize')

        # Startup descriptor cleanup predates this fix; emulate process exit
        # for the injected interruption before main appends its descriptor.
        try:
            with patch.object(producer.os, 'open', side_effect=capture_open), \
                    patch.object(producer.os, 'ftruncate', side_effect=interrupt_resize):
                error = self.invoke()
        finally:
            for fd in opened:
                os.close(fd)
        self.assertIsInstance(error, RuntimeError)
        self.assertEqual(observations, [['1:0']])
        self.assertEqual(json.loads(self.state.read_text()), ['1:0'])
        self.assertEqual(self.first.stat().st_size, len(self.payloads['first.safetensors']))
        self.expect_recovered()


if __name__ == '__main__':
    unittest.main()
