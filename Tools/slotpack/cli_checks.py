#!/usr/bin/env python3
"""Actual CLI selection and signal cancellation, without fetching model bytes.

Selection-only checks inspect the registry and reject absent/unregistered
packs without creating model files. The full transport check creates sparse
partials and needs fresh-install space; run it separately on a development Mac.
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


def selection_checks(binary):
    registry_run = subprocess.run([binary, 'model-packs', '--json'], capture_output=True, text=True, timeout=20, check=True)
    registry = json.loads(registry_run.stdout)
    selected = registry['selected']
    assert any(row['id'] == selected for row in registry['packs'])
    assert registry['selection_evidence'] == 'unknown' and not registry['meets_measured_speed_target'], registry
    results = [dict(name='registry-is-not-loaded-evidence', pass_=True, registry=registry)]
    with tempfile.TemporaryDirectory(prefix='slotpack-selection-check-') as tmp:
        for name, identity, expected in [('missing-selected-pack', selected, 'nothing at'),
                                         ('unregistered-pack', 'unregistered-quantization-fixture', 'unavailable')]:
            destination = Path(tmp)/name
            command = [binary, 'pull', identity, '--dir', str(destination), '--verify']
            run = subprocess.run(command, capture_output=True, text=True, timeout=20)
            output = run.stdout + run.stderr
            assert run.returncode != 0 and expected in output.lower() and not destination.exists(), (command, run.returncode, output)
            results.append(dict(name=name, pass_=True, exitCode=run.returncode, output=output))
    return selected, results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--binary', required=True)
    parser.add_argument('--receipt', required=True)
    parser.add_argument('--selection-only', action='store_true', help='No download, server or sparse files; suitable for native CI')
    args = parser.parse_args()
    selected, results = selection_checks(args.binary)
    if args.selection_only:
        Path(args.receipt).write_text(json.dumps(dict(pass_=True, checks=results), indent=2)+'\n')
        print('CLI PACK SELECTION AND NONMUTATING REFUSALS PASS')
        return
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
    try:
        for name, flag, raw, expected in [('default', None, False, 'compressed'),
                                          ('raw-sources-override', None, True, 'raw'),
                                          ('explicit-compressed', 'compressed', True, 'compressed'),
                                          ('explicit-raw', 'raw', True, 'raw'),
                                          ('selected-pack-raw', 'raw', True, 'raw')]:
            with tempfile.TemporaryDirectory(prefix='slotpack-cli-check-') as tmp:
                directory = Path(tmp)/'model'; env = os.environ.copy()
                for key in ['SLOTSTREAM_PULL_CONNECTIONS', 'SLOTSTREAM_PULL_TRANSPORT', 'SLOTSTREAM_WEIGHTS_SOURCES']:
                    env.pop(key, None)
                env['SLOTSTREAM_COMPRESSED_SOURCES'] = base+'/compressed'
                if raw: env['SLOTSTREAM_WEIGHTS_SOURCES'] = base+'/raw'
                command = [args.binary, 'pull', '--dir', str(directory)]
                if name == 'selected-pack-raw': command.insert(2, selected)
                if flag: command += ['--transport', flag]
                with lock: requests.clear()
                p = subprocess.Popen(command, env=env, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
                try:
                    deadline = time.monotonic()+15
                    received = []
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
                finally:
                    if p.poll() is None: p.kill()
                    p.communicate(timeout=10)
    finally:
        stopping.set(); server.shutdown(); server.server_close()
    Path(args.receipt).write_text(json.dumps(dict(pass_=True, checks=results), indent=2)+'\n')
    print('CLI DEFAULT, OVERRIDES AND SIGINT PASS')


if __name__ == '__main__': main()
