#!/usr/bin/env python3
"""Sustained transfer regression: completed operations must release payloads."""
import argparse
import hashlib
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
import json
import os
from pathlib import Path
import random
import signal
import struct
import subprocess
import tempfile
import threading
import time
import download_checks


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--binary")
    parser.add_argument("--receipt", default=str(download_checks.OUT/"memory-checks.json"))
    args = parser.parse_args(argv)
    binary = Path(args.binary).resolve() if args.binary else download_checks.compile_harness()
    raw = random.Random(9573).randbytes(8 << 20)
    encoded = b'SLTPK001' + struct.pack('<6I', len(raw), 0, 0, 0, 0, 0) + raw
    encoded_hash, raw_hash = hashlib.sha256(encoded).hexdigest(), hashlib.sha256(raw).hexdigest()
    count = 768
    whole = hashlib.sha256()
    for _ in range(count): whole.update(raw)
    manifest = dict(format='slotpack-v1', files=[dict(path='sustained.bin', size=count*len(raw),
                    sha256=whole.hexdigest(), optional=False)], objects=[
        dict(sha256=encoded_hash, size=len(encoded), rawSize=len(raw), rawSHA256=raw_hash,
             ranges=[dict(file=0, offset=i*len(raw), length=len(raw))]) for i in range(count)])
    class Handler(BaseHTTPRequestHandler):
        protocol_version = 'HTTP/1.1'
        def log_message(self, *args): pass
        def handle(self):
            try: super().handle()
            except (BrokenPipeError, ConnectionResetError): pass
        def do_GET(self):
            self.send_response(200); self.send_header('Content-Length', str(len(encoded))); self.end_headers()
            try: self.wfile.write(encoded)
            except (BrokenPipeError, ConnectionResetError): pass
    server = ThreadingHTTPServer(('127.0.0.1', 0), Handler); server.daemon_threads = True
    threading.Thread(target=server.serve_forever, daemon=True).start()
    samples, stopped = [], []
    with tempfile.TemporaryDirectory(prefix='slotpack-memory-check-') as tmp:
        root = Path(tmp); path = root/'manifest.json'; path.write_text(json.dumps(manifest))
        env = os.environ.copy(); env['SLOTSTREAM_HTTP_TIMEOUT'] = '30'
        with (root/'client.log').open('w+') as log:
            p = subprocess.Popen([str(binary), str(path), str(root/'model'), f'http://127.0.0.1:{server.server_port}', '-'],
                                 stdout=log, stderr=subprocess.STDOUT, env=env)
            start = time.monotonic()
            while p.poll() is None:
                usage = subprocess.run(['ps', '-o', 'rss=', '-p', str(p.pid)], capture_output=True, text=True)
                if usage.returncode == 0 and usage.stdout.strip():
                    rss = int(usage.stdout)*1024
                    samples.append(dict(seconds=round(time.monotonic()-start, 3), rssBytes=rss))
                    if rss > 1_500_000_000 or time.monotonic()-start > 120:
                        stopped.append('memory or time bound exceeded')
                        p.terminate(); p.wait(timeout=10); break
                time.sleep(.2)
            log.seek(0); output = log.read()
        result = dict(pass_=p.returncode == 0 and not stopped, bytes=count*len(raw), objects=count,
                      peakRSSBytes=max((s['rssBytes'] for s in samples), default=0), samples=samples,
                      guard=stopped, returncode=p.returncode, output=output,
                      build=json.loads((binary.parent/'build.json').read_text()))
        Path(args.receipt).write_text(json.dumps(result, indent=2)+'\n')
        assert result['pass_'], {k: v for k, v in result.items() if k not in ('build', 'samples')}
        print('SUSTAINED MEMORY PASS '+str(result['peakRSSBytes'])+' bytes peak RSS', flush=True)
    server.shutdown()


if __name__ == '__main__': main()
