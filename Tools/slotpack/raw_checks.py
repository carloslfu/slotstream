#!/usr/bin/env python3
"""Real multi-chunk raw compatibility, resume, and optional-writer regressions."""
import collections
import hashlib
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
import json
import os
from pathlib import Path
import subprocess
import tempfile
import threading
import time
import download_checks


def main():
    binary = download_checks.compile_harness()
    block = bytes(range(256)) * 4096
    sources = {'weights.safetensors': block * 193, 'config.json': b'{"raw":true}\n',
               'mtp.safetensors': block * 161}
    files = [dict(path=p, size=len(b), sha256=hashlib.sha256(b).hexdigest(), optional=p.startswith('mtp'))
             for p, b in sources.items()]
    counts = collections.Counter()
    class Handler(BaseHTTPRequestHandler):
        protocol_version = 'HTTP/1.1'
        def log_message(self, *args): pass
        def handle(self):
            try: super().handle()
            except (BrokenPipeError, ConnectionResetError): pass
        def do_GET(self):
            mode, _, path = self.path.lstrip('/').partition('/')
            start, end = map(int, self.headers['Range'].removeprefix('bytes=').split('-'))
            counts[mode, path, start] += 1
            data = sources[path]
            status = 206
            if mode == 'missing' or (mode == 'optional-race' and path.startswith('mtp') and start == 0):
                status, payload = 404, b'absent'
            else:
                payload = data[start:end+1]
                if mode == 'bad-hash': payload = bytes([payload[0] ^ 1]) + payload[1:]
                if mode == 'ignore-range': status, payload = 200, data
            self.send_response(status)
            self.send_header('Content-Length', str(len(payload)))
            if status == 206:
                self.send_header('Content-Range', f'bytes {start+1 if mode == "wrong-range" else start}-{end}/{len(data)}')
            if mode == 'encoding': self.send_header('Content-Encoding', 'gzip')
            self.end_headers()
            try:
                for offset in range(0, len(payload), 1 << 20):
                    self.wfile.write(payload[offset:offset+(1 << 20)])
                    if mode == 'slow': time.sleep(.002 if start == 0 else .03)
                    if mode == 'optional-race' and path.startswith('mtp'): time.sleep(.003)
            except (BrokenPipeError, ConnectionResetError): pass
    server = ThreadingHTTPServer(('127.0.0.1', 0), Handler)
    server.daemon_threads = True
    threading.Thread(target=server.serve_forever, daemon=True).start()
    base = f'http://127.0.0.1:{server.server_port}'
    results = []
    with tempfile.TemporaryDirectory(prefix='slotpack-raw-check-') as tmp:
        root = Path(tmp)
        manifest = root/'manifest.json'
        manifest.write_text(json.dumps(dict(format='slotpack-v1', files=files, objects=[])))
        def check(name, modes='good', success=True, dest=None, cancel=None):
            dest = dest or root/name
            command = [str(binary), str(manifest), str(dest), '-', ','.join(base+'/'+x for x in modes.split(','))]
            if cancel: command.append(str(cancel))
            env = os.environ.copy(); env['SLOTSTREAM_TEST_RAW'] = '1'
            start = time.monotonic()
            run = subprocess.run(command, env=env, capture_output=True, text=True, timeout=120)
            row = dict(name=name, pass_=(run.returncode == 0) == success, seconds=round(time.monotonic()-start, 3),
                       returncode=run.returncode, stdout=run.stdout, stderr=run.stderr)
            results.append(row)
            print(json.dumps({k: v for k, v in row.items() if k not in ('stdout', 'stderr')}), flush=True)
            assert row['pass_'], row
            return dest
        good = check('raw-multichunk')
        before = sum(counts.values()); check('raw-installed-no-http', dest=good)
        assert sum(counts.values()) == before
        for mode in ['missing', 'wrong-range', 'encoding', 'ignore-range']:
            check('raw-source-fallback-'+mode, mode+',good')
        check('raw-wrong-range-fails', 'wrong-range', False)
        check('raw-corrupt-final-rejected', 'bad-hash', False)
        optional = check('raw-optional-inflight-writers', 'optional-race')
        assert not (optional/'mtp.safetensors').exists()
        dest = root/'resumed'
        check('raw-cancel', 'slow', False, dest=dest, cancel=.8)
        assert any(1 in p.read_bytes() for p in dest.glob('*.partmap'))
        before = sum(counts.values()); check('raw-resume', dest=dest)
        assert sum(counts.values()) - before < 8
        for path in good.glob('*.safetensors'):
            with path.open('r+b') as stream: stream.write(b'corrupt')
        check('raw-same-size-repair', dest=good)
    server.shutdown()
    receipt = dict(pass_=True, build=json.loads((binary.parent/'build.json').read_text()), checks=results)
    (download_checks.OUT/'raw-checks.json').write_text(json.dumps(receipt, indent=2)+'\n')
    print('ALL RAW HTTP CHECKS PASS', flush=True)


if __name__ == '__main__': main()
