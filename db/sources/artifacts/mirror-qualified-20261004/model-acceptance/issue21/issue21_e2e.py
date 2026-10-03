#!/usr/bin/env python3
"""Issue 21 serving and exact restart acceptance with one bounded server at a time."""
import argparse
import http.client
import json
import os
from pathlib import Path
import shutil
import socket
import subprocess
import time

from prefill_bench import preflight, vm_snapshot
from serve_bench import verified_build


def replay(port, original, output):
    body = original['request']
    connection = http.client.HTTPConnection('127.0.0.1', port, timeout=180)
    try:
        connection.request('POST', '/v1/chat/completions', json.dumps(body), {'Content-Type': 'application/json'})
        response = connection.getresponse()
        raw = response.read()
        (output / 'restart.sse').write_bytes(raw)
        events = [json.loads(line[6:]) for line in raw.decode().splitlines()
                  if line.startswith('data: ') and line != 'data: [DONE]']
        assert response.status == 200 and b'data: [DONE]' in raw
        assert not any('error' in event for event in events), events

        def message(items):
            choices = [choice for event in items if isinstance(event, dict) for choice in event.get('choices', [])]
            return {key: ''.join(choice['delta'].get(key, '') for choice in choices)
                    for key in ['content', 'reasoning_content']}

        def usage(items):
            return next(event['usage'] for event in reversed(items)
                        if isinstance(event, dict) and event.get('usage'))

        assert message(events) == message(original['events']), 'restart changed answer or reasoning'
        actual = usage(events)
        assert actual == usage(original['events']), 'restart changed prompt, reuse or output token counts'
        assert actual['prompt_tokens_details']['cached_tokens'] > 0, actual
        (output / 'restart-result.json').write_text(json.dumps({'same_message': True, 'usage': actual}, indent=2))
        print('PASS exact conversation replay after restart', actual, flush=True)
    finally:
        connection.close()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--binary', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    binary = args.binary.resolve()
    args.out.mkdir(parents=True, exist_ok=False)
    repo = Path(__file__).resolve().parents[1]
    for name in ['issue21_e2e.py', 'issue21_gate.py', 'openai_tools_gate.py']:
        shutil.copyfile(repo / 'Tools' / name, args.out / name)
    result = {'passed': False, 'build': verified_build(binary), 'before': vm_snapshot(), 'servers': []}
    owned = log = None

    def stop():
        nonlocal owned, log
        if owned is not None:
            if owned.poll() is None:
                owned.terminate()
                try:
                    owned.wait(timeout=20)
                except subprocess.TimeoutExpired:
                    owned.kill()
                    owned.wait()
            result['servers'].append({'pid': owned.pid, 'exit_code': owned.returncode})
            print('server reaped', owned.pid, owned.returncode, flush=True)
            owned = None
        if log:
            log.close()
            log = None

    def start(label):
        nonlocal owned, log
        preflight(11.1)
        with socket.socket() as sock:
            sock.bind(('127.0.0.1', 0))
            port = sock.getsockname()[1]
        command = [str(binary), 'serve', '--memory-gb', '8.1', '--max-context', '32768',
                   '--vision', 'off', '--mtp', 'off', '--port', str(port),
                   '--prefix-cache-dir', str(args.out / 'prefix'), '--prefix-cache-min-tokens', '512']
        (args.out / (label + '-command.json')).write_text(json.dumps(command, indent=2))
        log = (args.out / (label + '-server.log')).open('w')
        owned = subprocess.Popen(command, stdout=log, stderr=subprocess.STDOUT, env=os.environ.copy())
        for _ in range(180):
            if owned.poll() is not None:
                raise RuntimeError(f'server exited at startup: {owned.returncode}')
            connection = http.client.HTTPConnection('127.0.0.1', port, timeout=1)
            try:
                connection.request('GET', '/api/version')
                response = connection.getresponse()
                response.read()
                if response.status == 200:
                    return port
            except (OSError, http.client.HTTPException):
                pass
            finally:
                connection.close()
            time.sleep(.5)
        raise RuntimeError('server startup timed out')

    try:
        port = start('first')
        subprocess.run(['python3', str(repo / 'Tools/issue21_gate.py'), '--port', str(port),
                        '--output', str(args.out / 'issue21')], check=True)
        subprocess.run(['python3', str(repo / 'Tools/openai_tools_gate.py'), '--port', str(port),
                        '--output', str(args.out / 'openai-tools.jsonl')], check=True)
        assert owned.poll() is None, 'server died after requests'
        stop()
        port = start('restart')
        original = json.loads((args.out / 'issue21/cache-turn-3.json').read_text())
        replay(port, original, args.out)
        assert owned.poll() is None, 'server died after replay'
        result['passed'] = True
    except Exception as error:
        result['error'] = str(error)
        raise
    finally:
        stop()
        result['after'] = vm_snapshot()
        (args.out / 'result.json').write_text(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
