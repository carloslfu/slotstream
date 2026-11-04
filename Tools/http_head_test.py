"""Run the real HEAD response branch without an Engine, MLX or model weights."""
import base64
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import textwrap
import unittest

ROOT = Path(__file__).resolve().parent.parent


class HeadResponseTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        # Fail closed if the production switch changes: never test a copied
        # response implementation that can silently diverge from the server.
        source = (ROOT / 'Sources/Slotstream/Server.swift').read_text()
        start, end = '        case ("HEAD", _):\n', '        case ("GET", "/"):\n'
        if source.count(start) != 1 or source.count(end) != 1:
            raise RuntimeError('HEAD branch markers changed; update the fixture')
        branch = textwrap.dedent(source.split(start, 1)[1].split(end, 1)[0])
        cls.temp = tempfile.TemporaryDirectory(prefix='slotstream-http-head-', dir=os.environ.get('TMPDIR') or '/tmp')
        cls.addClassCleanup(cls.temp.cleanup)
        folder = Path(cls.temp.name)
        swift = folder / 'main.swift'
        swift.write_text('''import Foundation
func response(_ path: String, _ cors: String) -> Data {
    var captured = Data()
    let fd: Int32 = 0
    func send(_ fd: Int32, _ data: Data) -> Bool {
        captured.append(data)
        return true
    }
''' + branch + '''
    return captured
}
let paths = ["/", "/api/version", "/api/tags", "/api/ps", "/v1/models",
             "/coding-agent/v1/models", "/coding-agent/v1/credits", "/slotstream/status",
             "/missing", "/also-missing"]
let rows = paths.map { path in
    ["path": path, "plain": response(path, "").base64EncodedString(),
     "cors": response(path, "Access-Control-Allow-Origin: https://fixture.invalid\\r\\n").base64EncodedString()]
}
let data = try JSONSerialization.data(withJSONObject: rows, options: [.sortedKeys])
FileHandle.standardOutput.write(data)
''')
        compiler = os.environ.get('SWIFTC') or shutil.which('swiftc')
        if not compiler:
            raise RuntimeError('Swift compiler is required for the HTTP response fixture')
        executable = folder / 'head-response'
        env = dict(os.environ, TMPDIR=str(folder))
        built = subprocess.run([compiler, '-module-cache-path', str(folder / 'modules'),
                                str(swift), '-o', str(executable)],
                               env=env, capture_output=True, text=True, timeout=60)
        if built.returncode:
            raise RuntimeError(built.stdout + built.stderr)
        run = subprocess.run([str(executable)], env=env, capture_output=True, timeout=10)
        if run.returncode:
            raise RuntimeError(run.stderr.decode(errors='replace'))
        cls.rows = json.loads(run.stdout)
        receipt = os.environ.get('SLOTSTREAM_HEAD_TEST_RECEIPT')
        if receipt:
            with open(receipt, 'x') as stream:
                json.dump({'source_sha256': hashlib.sha256(swift.read_bytes()).hexdigest(),
                           'executable_sha256': hashlib.sha256(executable.read_bytes()).hexdigest(),
                           'responses': cls.rows}, stream, indent=2)
                stream.write('\n')

    def packet(self, row, mode):
        packet = base64.b64decode(row[mode], validate=True)
        head, separator, body = packet.partition(b'\r\n\r\n')
        self.assertEqual(separator, b'\r\n\r\n', packet)
        lines = head.decode('ascii').split('\r\n')
        headers = dict(line.split(': ', 1) for line in lines[1:])
        return lines[0], headers, body

    def test_known_paths_keep_success_status(self):
        for row in self.rows[:8]:
            with self.subTest(path=row['path']):
                self.assertEqual(self.packet(row, 'plain')[0], 'HTTP/1.1 200 OK')

    def test_unknown_paths_keep_not_found_status(self):
        for row in self.rows[8:]:
            with self.subTest(path=row['path']):
                self.assertEqual(self.packet(row, 'plain')[0], 'HTTP/1.1 404 Not Found')

    def test_headers_and_bodyless_framing_are_preserved(self):
        for row in self.rows:
            for mode in ['plain', 'cors']:
                with self.subTest(path=row['path'], mode=mode):
                    _, headers, body = self.packet(row, mode)
                    self.assertEqual(body, b'')
                    self.assertEqual(headers['Connection'], 'close')
                    self.assertEqual(headers['Content-Type'], 'application/json')
                    self.assertNotIn('Transfer-Encoding', headers)
                    self.assertEqual(headers.get('Access-Control-Allow-Origin'),
                                     'https://fixture.invalid' if mode == 'cors' else None)

    def test_head_omits_uncomputed_representation_length(self):
        # HEAD has no payload, but Content-Length (if present) describes the
        # corresponding GET representation, not the number of bytes sent here.
        for row in self.rows:
            for mode in ['plain', 'cors']:
                with self.subTest(path=row['path'], mode=mode):
                    self.assertNotIn('Content-Length', self.packet(row, mode)[1])


if __name__ == '__main__':
    unittest.main()
