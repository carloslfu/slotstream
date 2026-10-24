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


def in_flight_checks(binary):
    """A terminal peer error must drain active raw requests without retrying them."""
    data = b'fixture\n'
    cases = [
        ('raw-inflight-peer-failure', 404, False, False, None, True),
        ('raw-inflight-peer-hash-failure', 206, False, True, None, True),
        ('raw-inflight-user-cancel', 206, False, False, .3, True),
        ('raw-inflight-success', 206, False, False, None, False),
        ('raw-inflight-optional-failure', 404, True, False, None, False),
    ]
    settings = {name: (status, optional, corrupt, cancel, hold)
                for name, status, optional, corrupt, cancel, hold in cases}
    started = {name: threading.Event() for name in settings}
    delivered = {name: threading.Event() for name in settings}
    release = {name: threading.Event() for name in settings}
    counts = collections.Counter()
    request_lock = threading.Lock()
    class Handler(BaseHTTPRequestHandler):
        protocol_version = 'HTTP/1.1'
        def log_message(self, *args): pass
        def handle(self):
            try: super().handle()
            except (BrokenPipeError, ConnectionResetError): pass
        def do_GET(self):
            name, _, path = self.path.lstrip('/').partition('/')
            status, _, corrupt, _, hold = settings[name]
            with request_lock: counts[name, path] += 1
            # Every file is eight bytes and owns exactly one production chunk.
            assert self.headers['Range'] == 'bytes=0-7'
            if path == 'slow.bin':
                self.send_response(206)
                self.send_header('Content-Length', '8')
                self.send_header('Content-Range', 'bytes 0-7/8')
                self.end_headers()
                self.wfile.write(data[:1]); self.wfile.flush()
                started[name].set()
                if hold: release[name].wait(5)
                else: time.sleep(.3)
                self.wfile.write(data[1:]); self.wfile.flush()
            else:
                if not started[name].wait(2): return
                payload = b'absent' if status == 404 else (b'corrupt\n' if corrupt else data)
                self.send_response(status)
                self.send_header('Content-Length', str(len(payload)))
                if status == 206: self.send_header('Content-Range', 'bytes 0-7/8')
                self.end_headers()
                self.wfile.write(payload); self.wfile.flush()
                delivered[name].set()
    server = ThreadingHTTPServer(('127.0.0.1', 0), Handler)
    server.daemon_threads = True
    threading.Thread(target=server.serve_forever, daemon=True).start()
    results = []
    try:
        with tempfile.TemporaryDirectory(prefix='slotpack-raw-inflight-check-') as tmp:
            root = Path(tmp)
            manifest = root/'manifest.json'
            for name, status, optional, corrupt, cancel, hold in cases:
                files = [dict(path=path, size=8, sha256=hashlib.sha256(data).hexdigest(),
                              optional=optional and path == 'peer.bin')
                         for path in ['slow.bin', 'peer.bin']]
                manifest.write_text(json.dumps(dict(format='slotpack-v1', files=files, objects=[])))
                dest = root/name
                command = [str(binary), str(manifest), str(dest), '-',
                           f'http://127.0.0.1:{server.server_port}/{name}']
                if cancel is not None: command.append(str(cancel))
                env = os.environ.copy(); env['SLOTSTREAM_TEST_RAW'] = '1'
                env.pop('SLOTPACK_FIXTURE_START_DELAY', None)
                start = time.monotonic()
                proc = subprocess.Popen(command, env=env, stdout=subprocess.PIPE,
                                        stderr=subprocess.PIPE, text=True)
                timed_out = False
                try:
                    stdout, stderr = proc.communicate(timeout=3)
                except subprocess.TimeoutExpired:
                    timed_out = True
                    proc.terminate()
                    stdout, stderr = proc.communicate(timeout=2)
                finally:
                    release[name].set()
                elapsed = time.monotonic()-start
                with request_lock:
                    requests = {path: counts[name, path] for path in ['slow.bin', 'peer.bin']}
                passed = (not timed_out and started[name].is_set() and delivered[name].is_set()
                          and requests == {'slow.bin': 1, 'peer.bin': 1})
                if status == 404 and not optional:
                    passed = passed and proc.returncode != 0 and 'peer.bin' in stderr and '404' in stderr
                elif corrupt:
                    passed = passed and proc.returncode != 0 and 'peer.bin' in stderr and 'PullIntegrityError' in stderr
                elif cancel is not None:
                    passed = passed and proc.returncode != 0 and 'cancel' in stderr.lower()
                else:
                    passed = passed and proc.returncode == 0 and (dest/'slow.bin').read_bytes() == data
                    if optional:
                        passed = passed and not any(dest.glob('peer.bin*'))
                    else:
                        passed = passed and (dest/'peer.bin').read_bytes() == data
                if hold: passed = passed and not (dest/'slow.bin').exists()
                row = dict(name=name, pass_=passed, seconds=round(elapsed, 3),
                           timed_out=timed_out, request_counts=requests,
                           returncode=proc.returncode, stdout=stdout, stderr=stderr)
                results.append(row)
                print(json.dumps({k: v for k, v in row.items() if k not in ('stdout', 'stderr')}), flush=True)
    finally:
        for event in release.values(): event.set()
        server.shutdown()
        server.server_close()
    return results


def retry_checks(binary):
    """Exercise raw HTTP cooldowns without the multi-chunk fixture's large bodies."""
    data = b'fixture\n'
    cases = [
        ('raw-retry-after-429', 429, {'Retry-After': '3'}, None),
        ('raw-retry-after-503', 503, {'Retry-After': '3'}, None),
        ('raw-ratelimit-429', 429, {'RateLimit': '"resolvers";r=0;t=2'}, None),
        ('raw-headerless-429-cancel', 429, {}, 3.2),
        ('raw-long-retry-cancel', 429, {'Retry-After': '25'}, 3.2),
        ('raw-short-retry-cancel', 429, {'Retry-After': '25'}, .3),
        ('raw-404-retry-header-fallback', 404, {'Retry-After': '25'}, None),
        ('raw-protocol-retry-header-fallback', 206, {'Retry-After': '25'}, None),
        ('raw-retry-peer-failure', 429, {'Retry-After': '6'}, None),
        ('raw-retry-optional-skip', 429, {'Retry-After': '6'}, None),
    ]
    fallbacks = {'raw-404-retry-header-fallback', 'raw-protocol-retry-header-fallback'}
    peer_failure = 'raw-retry-peer-failure'
    optional_skip = 'raw-retry-optional-skip'
    chunk_bytes = 64 << 20
    throttled = threading.Event()
    responses = {name: (status, headers, cancel) for name, status, headers, cancel in cases}
    responses.update({name+'-good': (206, {}, None) for name in fallbacks})
    requests = collections.defaultdict(list)
    request_lock = threading.Lock()
    class Handler(BaseHTTPRequestHandler):
        protocol_version = 'HTTP/1.1'
        def log_message(self, *args): pass
        def handle(self):
            try: super().handle()
            except (BrokenPipeError, ConnectionResetError): pass
        def do_GET(self):
            name, _, path = self.path.lstrip('/').partition('/')
            status, headers, cancel = responses[name]
            start, end = map(int, self.headers['Range'].removeprefix('bytes=').split('-'))
            with request_lock:
                requests[name, path, start].append(time.monotonic())
                attempt = len(requests[name, path, start])
            if name == peer_failure and path == 'missing.bin':
                throttled.wait(5)
                time.sleep(.25)  # Let the other worker enter its cooldown first.
                status, payload, headers = 404, b'absent', {}
            elif name == optional_skip and path == 'optional.bin':
                if start == 0 and attempt == 1:
                    payload = b'busy'
                else:
                    throttled.wait(5)
                    time.sleep(.25)
                    status, payload, headers = 404, b'absent', {}
            elif (name.endswith('-good') or name == optional_skip or
                  (attempt > 1 and cancel is None and name not in fallbacks)):
                status, payload, headers = 206, data[start:end+1], {
                    'Content-Range': f'bytes {start}-{end}/{len(data)}'}
            elif status == 206:
                payload, headers = data, {**headers, 'Content-Range': f'bytes 1-{len(data)-1}/{len(data)}'}
            else:
                payload = b'busy'
            self.send_response(status)
            self.send_header('Content-Length', str(len(payload)))
            for key, value in headers.items(): self.send_header(key, value)
            self.end_headers()
            try:
                self.wfile.write(payload)
                self.wfile.flush()
            except (BrokenPipeError, ConnectionResetError): pass
            if status == 429: throttled.set()
    server = ThreadingHTTPServer(('127.0.0.1', 0), Handler)
    server.daemon_threads = True
    threading.Thread(target=server.serve_forever, daemon=True).start()
    results = []
    try:
        with tempfile.TemporaryDirectory(prefix='slotpack-raw-retry-check-') as tmp:
            root = Path(tmp)
            manifest = root/'manifest.json'
            for name, _, _, cancel in cases:
                paths = ['tiny.bin', 'missing.bin'] if name == peer_failure else ['tiny.bin']
                files = [dict(
                    path=p, size=len(data), sha256=hashlib.sha256(data).hexdigest(), optional=False)
                    for p in paths]
                if name == optional_skip:
                    # Two sparse chunks; the server sends only tiny error bodies.
                    files.append(dict(path='optional.bin', size=chunk_bytes+len(data),
                                      sha256='0'*64, optional=True))
                manifest.write_text(json.dumps(dict(format='slotpack-v1', files=files, objects=[])))
                dest = root/name
                base = f'http://127.0.0.1:{server.server_port}/{name}'
                bases = base+','+base+'-good' if name in fallbacks else base
                command = [str(binary), str(manifest), str(dest), '-',
                           bases]
                if cancel is not None: command.append(str(cancel))
                env = os.environ.copy(); env['SLOTSTREAM_TEST_RAW'] = '1'
                env.pop('SLOTPACK_FIXTURE_START_DELAY', None)
                throttled.clear()
                start = time.monotonic()
                run = subprocess.run(command, env=env, capture_output=True, text=True, timeout=12)
                elapsed = time.monotonic()-start
                with request_lock:
                    times = list(requests[name, 'tiny.bin', 0])
                    fallback_times = list(requests[name+'-good', 'tiny.bin', 0])
                    missing_times = list(requests[name, 'missing.bin', 0])
                    optional_times = [list(requests[name, 'optional.bin', offset])
                                      for offset in (0, chunk_bytes)]
                offsets = [round(t-times[0], 3) for t in times]
                if name == peer_failure:
                    # A required peer's failure must also stop a long cooldown.
                    passed = (run.returncode != 0 and 'missing.bin' in run.stderr and
                              len(times) == len(missing_times) == 1 and elapsed < 5)
                elif name == optional_skip:
                    passed = (run.returncode == 0 and len(times) == 1 and
                              all(len(t) == 1 for t in optional_times) and elapsed < 5 and
                              (dest/'tiny.bin').read_bytes() == data and
                              not any(dest.glob('optional.bin*')))
                elif name in fallbacks:
                    # A retry header must not turn permanent HTTP/protocol errors
                    # into transient failures or delay advancing to a good source.
                    passed = (run.returncode == 0 and len(times) == len(fallback_times) == 1 and
                              elapsed < 5 and (dest/'tiny.bin').read_bytes() == data)
                elif cancel is None:
                    # The old raw retry loop waits only 2 seconds. Allow scheduling
                    # tolerance while requiring the server's 3-second cooldown.
                    passed = (run.returncode == 0 and len(times) == 2 and
                              times[1]-times[0] >= 2.9 and
                              (dest/'tiny.bin').read_bytes() == data)
                else:
                    # Cancellation must interrupt the cooldown before another request,
                    # including the default five-minute wait for a headerless 429.
                    passed = (run.returncode != 0 and 'cancel' in run.stderr.lower() and
                              len(times) == 1 and cancel <= elapsed < cancel+2 and
                              not (dest/'tiny.bin').exists())
                row = dict(name=name, pass_=passed, seconds=round(elapsed, 3),
                           request_offsets=offsets, returncode=run.returncode,
                           stdout=run.stdout, stderr=run.stderr)
                if name in fallbacks:
                    row['fallback_request_offsets'] = [round(t-times[0], 3) for t in fallback_times]
                if name == optional_skip:
                    row['optional_request_counts'] = [len(t) for t in optional_times]
                results.append(row)
                print(json.dumps({k: v for k, v in row.items() if k not in ('stdout', 'stderr')}), flush=True)
    finally:
        server.shutdown()
        server.server_close()
    return results


def main():
    binary = download_checks.compile_harness()
    results = in_flight_checks(binary) + retry_checks(binary)
    assert all(row['pass_'] for row in results), results
    block = bytes(range(256)) * 4096
    sources = {'weights.safetensors': block * 193, 'config.json': b'{"raw":true}\n',
               'mtp.safetensors': block * 161}
    files = [dict(path=p, size=len(b), sha256=hashlib.sha256(b).hexdigest(), optional=p.startswith('mtp'))
             for p, b in sources.items()]
    counts = collections.Counter()
    pause_resume = threading.Event()
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
            if mode == 'pause-resume' and not (path == 'weights.safetensors' and start == 0):
                pause_resume.wait(30)
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
    with tempfile.TemporaryDirectory(prefix='slotpack-raw-check-') as tmp:
        root = Path(tmp)
        manifest = root/'manifest.json'
        manifest.write_text(json.dumps(dict(format='slotpack-v1', files=files, objects=[])))
        def check(name, modes='good', success=True, dest=None, cancel=None):
            dest = dest or root/name
            command = [str(binary), str(manifest), str(dest), '-', ','.join(base+'/'+x for x in modes.split(','))]
            if cancel: command.append(str(cancel))
            env = os.environ.copy(); env['SLOTSTREAM_TEST_RAW'] = '1'
            if cancel == 'after-progress':env['SLOTPACK_FIXTURE_START_DELAY']='1.2'
            start = time.monotonic()
            try:run = subprocess.run(command, env=env, capture_output=True, text=True, timeout=120)
            finally:
                if modes == 'pause-resume':pause_resume.set()
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
        check('raw-cancel', 'pause-resume', False, dest=dest, cancel='after-progress')
        assert (dest/'weights.safetensors.partmap').read_bytes()[:1] == b'\x01'
        before = counts['good', 'weights.safetensors', 0]; check('raw-resume', dest=dest)
        assert counts['good', 'weights.safetensors', 0] == before, ('completed weights chunk requested again', before, counts['good', 'weights.safetensors', 0])
        for path in good.glob('*.safetensors'):
            with path.open('r+b') as stream: stream.write(b'corrupt')
        check('raw-same-size-repair', dest=good)
    server.shutdown()
    receipt = dict(pass_=True, build=json.loads((binary.parent/'build.json').read_text()), checks=results)
    (download_checks.OUT/'raw-checks.json').write_text(json.dumps(receipt, indent=2)+'\n')
    print('ALL RAW HTTP CHECKS PASS', flush=True)


if __name__ == '__main__': main()
