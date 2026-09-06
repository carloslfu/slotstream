#!/usr/bin/env python3
"""Actual CLI selection and signal cancellation, without fetching model bytes.

This uses the real pinned manifest and creates sparse partial files, so it
needs the same free-space admission as a fresh install. Run on a development
machine, separately from model-free CI gates.
"""
import argparse
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
import json
import os
from pathlib import Path
import signal
import subprocess
import tempfile
import threading
import time


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--binary', required=True)
    parser.add_argument('--receipt', required=True)
    args = parser.parse_args()
    requests, lock = [], threading.Lock()
    stopping = threading.Event()
    class Handler(BaseHTTPRequestHandler):
        def log_message(self, *args): pass
        def handle(self):
            try: super().handle()
            except (BrokenPipeError, ConnectionResetError): pass
        def do_GET(self):
            with lock: requests.append((self.path, self.headers.get('Range')))
            stopping.wait(10)
    server = ThreadingHTTPServer(('127.0.0.1', 0), Handler); server.daemon_threads = True
    threading.Thread(target=server.serve_forever, daemon=True).start()
    base = f'http://127.0.0.1:{server.server_port}'
    results = []
    for name, flag, raw, expected in [('default', None, False, 'compressed'),
                                      ('raw-sources-override', None, True, 'raw'),
                                      ('explicit-compressed', 'compressed', True, 'compressed'),
                                      ('explicit-raw', 'raw', True, 'raw')]:
        with tempfile.TemporaryDirectory(prefix='slotpack-cli-check-') as tmp:
            directory = Path(tmp)/'model'; env = os.environ.copy()
            for key in ['SLOTSTREAM_PULL_CONNECTIONS', 'SLOTSTREAM_PULL_TRANSPORT', 'SLOTSTREAM_WEIGHTS_SOURCES']:
                env.pop(key, None)
            env['SLOTSTREAM_COMPRESSED_SOURCES'] = base+'/compressed'
            if raw: env['SLOTSTREAM_WEIGHTS_SOURCES'] = base+'/raw'
            command = [args.binary, 'pull', '--dir', str(directory)]
            if flag: command += ['--transport', flag]
            with lock: requests.clear()
            p = subprocess.Popen(command, env=env, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
            deadline = time.monotonic()+15
            while time.monotonic() < deadline and p.poll() is None:
                with lock: received = list(requests)
                if received: break
                time.sleep(.05)
            assert p.poll() is None and received, f'{name}: client did not request the local source'
            assert all(path.startswith('/'+expected+'/') for path, _ in received), received
            assert all(bool(byte_range) == (expected == 'raw') for _, byte_range in received), received
            start = time.monotonic(); p.send_signal(signal.SIGINT)
            output, _ = p.communicate(timeout=10)
            assert p.returncode == 130 and 'rerun to resume' in output, (p.returncode, output)
            assert any(directory.glob('*.part')) or (directory/'.slotpack-state.json').exists()
            results.append(dict(name=name, pass_=True, transport=expected, exitCode=p.returncode,
                                cancelSeconds=round(time.monotonic()-start, 3), requests=len(received), output=output))
    stopping.set(); server.shutdown()
    Path(args.receipt).write_text(json.dumps(dict(pass_=True, checks=results), indent=2)+'\n')
    print('CLI DEFAULT, OVERRIDES AND SIGINT PASS')


if __name__ == '__main__': main()
