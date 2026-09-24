#!/usr/bin/env python3
"""Exercise the public adaptive server path at a bounded 10 GB limit."""
import argparse
import fcntl
import hashlib
import json
import math
import os
from pathlib import Path
import re
import socket
import subprocess
import time


def exchange(port, method, path, body=None):
    data = b'' if body is None else json.dumps(body).encode()
    head = (f'{method} {path} HTTP/1.1\r\nHost: localhost\r\nConnection: close\r\n'
            f'Content-Type: application/json\r\nContent-Length: {len(data)}\r\n\r\n').encode()
    with socket.create_connection(('127.0.0.1', port), timeout=30) as connection:
        connection.sendall(head + data)
        chunks = []
        while True:
            chunk = connection.recv(65536)
            if not chunk:
                break
            chunks.append(chunk)
    headers, payload = b''.join(chunks).split(b'\r\n\r\n', 1)
    assert headers.startswith(b'HTTP/1.1 200'), (headers, payload)
    return json.loads(payload)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--binary', type=Path, default=os.environ.get('SLOTSTREAM_TEST_BINARY', '.build/release/slotstream'))
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--limit-gb', type=float, default=10, help='Bounded test ceiling, between 8.1 and 10 GB')
    parser.add_argument('--no-elastic', action='store_true', help='Also exercise the explicitly pinned serving path')
    args = parser.parse_args()
    if not math.isfinite(args.limit_gb) or not 8.1 <= args.limit_gb <= 10:
        parser.error('--limit-gb must be between 8.1 and 10 for this bounded test')
    binary = args.binary.resolve()
    args.out.mkdir(parents=True, exist_ok=False)
    report = {'passed': False, 'binary_sha256': hashlib.sha256(binary.read_bytes()).hexdigest(),
              'limit_gb': args.limit_gb, 'no_elastic': args.no_elastic, 'observations': []}
    process = None
    try:
        # Probe the normal shared lock. Never override it or stop another task.
        with open(f'/tmp/slotstream-model-{os.getuid()}.lock', 'a+') as lock:
            fcntl.flock(lock.fileno(), fcntl.LOCK_EX | fcntl.LOCK_NB)
            fcntl.flock(lock.fileno(), fcntl.LOCK_UN)
        vm = subprocess.check_output(['vm_stat'], text=True)
        page = int(re.search(r'page size of (\d+) bytes', vm)[1])
        counts = {key: int(value) for key, value in re.findall(r'^([^:\n]+):\s+(\d+)\.', vm, re.M)}
        available = sum(counts[key] for key in ('Pages free', 'Pages purgeable', 'File-backed pages')) * page / 1e9
        report['preflight_available_gb'] = available
        assert available >= 13, 'at least 13 GB reclaimable required'
        with socket.socket() as probe:
            probe.bind(('127.0.0.1', 0))
            port = probe.getsockname()[1]
        command = [str(binary), 'serve', '--memory-limit-gb', str(args.limit_gb), '--max-context', '32768',
                   '--max-prefill-wait', '17', '--mtp', 'off', '--vision', 'off', '--port', str(port)]
        if args.no_elastic:
            command.append('--no-elastic')
        env = {key: value for key, value in os.environ.items() if not key.startswith('SLOTSTREAM_')}
        report['command'] = [binary.name, *command[1:]]
        with (args.out / 'server.log').open('w') as log:
            process = subprocess.Popen(command, env=env, stdout=log, stderr=subprocess.STDOUT)
            deadline = time.monotonic() + 45
            while True:
                assert process.poll() is None, 'server exited before answering'
                try:
                    initial = exchange(port, 'GET', '/api/ps')['models'][0]['details']['memory_plan']
                    break
                except OSError:
                    assert time.monotonic() < deadline, 'startup timed out'
                    time.sleep(.2)

            def verify_plan(plan):
                assert plan.get('memory_limit_gb') == args.limit_gb, 'server lost the saved adaptive limit'
                assert plan['target_gb'] <= args.limit_gb, 'server exceeded the selected target'
                assert plan['memory_ledger']['expected_peak_bytes'] <= args.limit_gb * 1e9, 'live plan exceeded the ceiling'
                assert plan['max_prefill_wait_minutes'] == 17, 'request deadline was lost'
                report['observations'].append({key: plan[key] for key in
                    ('memory_limit_gb', 'target_gb', 'pool_slots', 'max_prefill_wait_minutes')})

            verify_plan(initial)
            # Let the production timer pass its 60-second startup cooldown.
            # A lost small ceiling would otherwise grow toward the Auto default.
            end = time.monotonic() + (2 if args.no_elastic else 76)
            while time.monotonic() < end:
                time.sleep(2)
                verify_plan(exchange(port, 'GET', '/api/ps')['models'][0]['details']['memory_plan'])
            status = exchange(port, 'GET', '/slotstream/status')
            assert status['memory_limit_gb'] == args.limit_gb and status['memory_target_gb'] <= args.limit_gb
            assert ('elastic: on' in (args.out / 'server.log').read_text()) != args.no_elastic
            if args.no_elastic:
                assert 'elastic: off (--no-elastic)' in (args.out / 'server.log').read_text()
            response = exchange(port, 'POST', '/v1/chat/completions', {
                'model': 'qwen3.8-flash-next:4bit', 'messages': [{'role': 'user', 'content': 'Name one river.'}],
                'max_tokens': 12, 'temperature': 0, 'stream': False,
                'reasoning_effort': 'none'})
            assert response.get('choices') and 'error' not in response, response
            report['completion'] = response['choices'][0]
            verify_plan(exchange(port, 'GET', '/api/ps')['models'][0]['details']['memory_plan'])
            report['passed'] = True
    except Exception as error:
        report['error'] = str(error)
    finally:
        if process is not None:
            if process.poll() is None:
                process.terminate()
                try:
                    process.wait(timeout=15)
                except subprocess.TimeoutExpired:
                    process.kill()
                    process.wait()
            report['server_reaped'] = True
        (args.out / 'report.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({key: value for key, value in report.items() if key != 'observations'}, indent=2))
    return 0 if report['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
