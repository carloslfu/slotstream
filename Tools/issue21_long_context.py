#!/usr/bin/env python3
"""Reproduce issue 21's long conversation and restart through Chat Completions.

One owned server, explicit bounded target, no memory-pressure allocation. The
existing process lock remains mandatory. Captures requests, SSE, server logs,
arrival times and operating conditions; timings are diagnostic, not a benchmark.
"""
import argparse
import http.client
import json
import os
from pathlib import Path
import socket
import shutil
import subprocess
import time

from prefill_bench import preflight, vm_snapshot
from serve_bench import verified_build


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--binary', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--max-context', type=int, choices=[65536, 131072], default=65536)
    parser.add_argument('--cache-dir', type=Path,
                        help='Reuse this test-owned cache from the identical binary')
    parser.add_argument('--history-turns', type=int, default=0,
                        help='After the long-context run, probe this many prefilled assistant turns')
    args = parser.parse_args()
    if not 0 <= args.history_turns <= 500:
        parser.error('--history-turns must be between 0 and 500')
    # The larger window cannot fit the ordinary 10 GB equality profile.
    # This explicit 13.5 GB configuration tests that window itself; it does
    # not enlarge any ordinary equality or throughput measurement.
    memory_gb = 13.5 if args.max_context == 131072 else 10
    binary = args.binary.resolve()
    args.out.mkdir(parents=True, exist_ok=False)
    shutil.copyfile(__file__, args.out / 'driver.py')
    result = {'passed': False, 'build': verified_build(binary), 'before': vm_snapshot()}
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
            result.setdefault('servers', []).append({'pid': owned.pid, 'exit_code': owned.returncode})
            print('server reaped', owned.pid, owned.returncode, flush=True)
            owned = None
        if log:
            log.close()
            log = None

    def start(label):
        nonlocal owned, log
        preflight(memory_gb + 3)
        with socket.socket() as sock:
            sock.bind(('127.0.0.1', 0))
            port = sock.getsockname()[1]
        log = (args.out / (label + '-server.log')).open('w')
        command = [str(binary), 'serve', '--memory-gb', str(memory_gb), '--max-context', str(args.max_context),
                   '--mtp', 'off', '--vision', 'off', '--max-prefill-wait', '30',
                   '--port', str(port), '--prefix-cache-dir', str(args.cache_dir or args.out / 'prefix'),
                   '--prefix-cache-min-tokens', '512']
        (args.out / (label + '-command.json')).write_text(json.dumps(command, indent=2))
        owned = subprocess.Popen(command, stdout=log, stderr=subprocess.STDOUT, env=os.environ.copy())
        for _ in range(180):
            if owned.poll() is not None:
                raise RuntimeError('server exited at startup: ' + str(owned.returncode))
            try:
                c = http.client.HTTPConnection('127.0.0.1', port, timeout=1)
                c.request('GET', '/api/version')
                response = c.getresponse()
                response.read()
                c.close()
                if response.status == 200:
                    return port
            except (OSError, http.client.HTTPException):
                pass
            time.sleep(.5)
        raise RuntimeError('startup timeout')

    def request(port, label, messages, max_tokens=256):
        body = {'model': 'qwen3.8-flash-next:4bit', 'messages': messages,
                'tools': [{'type': 'function', 'function': {'name': 'save_page',
                           'parameters': {'type': 'object', 'properties': {'content': {'type': 'string'}},
                                          'required': ['content']}}}],
                'reasoning_effort': 'low', 'temperature': 0, 'seed': 42,
                'stream': True, 'stream_options': {'include_usage': True}, 'max_tokens': max_tokens}
        (args.out / (label + '-request.json')).write_text(json.dumps(body, indent=2))
        started = time.monotonic()
        record = {'before': vm_snapshot(), 'events': [], 'arrivals': []}
        c = http.client.HTTPConnection('127.0.0.1', port, timeout=1900)
        print('request', label, 'bytes', len(json.dumps(body).encode()), flush=True)
        try:
            c.request('POST', '/v1/chat/completions', json.dumps(body), {'Content-Type': 'application/json'})
            response = c.getresponse()
            record['status'] = response.status
            record['headers_seconds'] = time.monotonic() - started
            with (args.out / (label + '.sse')).open('wb') as raw:
                while line := response.readline():
                    raw.write(line)
                    raw.flush()
                    if line.startswith(b'data: '):
                        value = line[6:].strip()
                        record['events'].append('[DONE]' if value == b'[DONE]' else json.loads(value))
                        record['arrivals'].append(time.monotonic() - started)
            assert owned.poll() is None, 'server died'
            assert response.status == 200, record
            assert record['events'][-1] == '[DONE]', record
            assert not any('error' in e for e in record['events'] if isinstance(e, dict)), record
            usage = next(e['usage'] for e in reversed(record['events']) if isinstance(e, dict) and e.get('usage'))
            choices = [ch for e in record['events'] if isinstance(e, dict) for ch in e.get('choices', [])]
            finish = next(ch['finish_reason'] for ch in reversed(choices) if ch.get('finish_reason'))
            message = {key: ''.join(ch['delta'].get(key, '') for ch in choices)
                       for key in ['content', 'reasoning_content']}
            assert finish == 'stop' and message['content'] and message['reasoning_content'], (finish, message)
            record.update(usage=usage, finish=finish, message=message)
            print('PASS', label, usage, flush=True)
            return record
        finally:
            c.close()
            record.update(seconds=time.monotonic() - started, after=vm_snapshot())
            (args.out / (label + '-result.json')).write_text(json.dumps(record, indent=2))

    def records(start, count):
        return ''.join(f'Record {i:04d}: the coastal station measures tides, currents, wind, rainfall and temperature.\n'
                       for i in range(start, start + count))

    try:
        port = start('first')
        history = [{'role': 'system', 'content': 'Use this reference only if needed. Never call tools for arithmetic.\n' + records(0, 1304)},
                   {'role': 'user', 'content': 'What is 2+2? Answer briefly.'}]
        first = request(port, '30k', history)
        assert 30000 <= first['usage']['prompt_tokens'] <= 33000, first['usage']
        history += [{'role': 'assistant', 'content': first['message']['content']},
                    {'role': 'user', 'content': 'More reference material:\n' + records(1304, 914) + '\nWhat is 3+3? Answer briefly.'}]
        second = request(port, '51k', history)
        assert 51000 <= second['usage']['prompt_tokens'] <= 55000, second['usage']
        assert second['usage']['prompt_tokens_details']['cached_tokens'] >= 29000, second['usage']
        history += [{'role': 'assistant', 'content': second['message']['content']},
                    {'role': 'user', 'content': 'What is 4+4? Answer briefly.'}]
        # Exercise the report's large output allowance without forcing the
        # model to generate a long reply just to test admission and reuse.
        third = request(port, '51k-followup', history, max_tokens=16000)
        assert third['usage']['prompt_tokens_details']['cached_tokens'] >= 50000, third['usage']
        stop()
        port = start('restart')
        replay = request(port, '51k-restart', history, max_tokens=16000)
        assert replay['message'] == third['message'], 'restart changed answer or reasoning'
        assert replay['usage'] == third['usage'], 'restart changed prompt, reuse or output token counts'
        if args.history_turns:
            # Supplied fixture turns let us exercise long agent histories
            # without running hundreds of generations or executing tools.
            branch = history[:3]
            for index in range(args.history_turns):
                branch += [{'role': 'user', 'content': f'Acknowledgement {index}. Reply OK.'},
                           {'role': 'assistant', 'content': 'OK.'}]
            branch += [{'role': 'user', 'content': 'What is 3+3? Answer briefly.'}]
            seeded = request(port, 'many-turns-seed', branch)
            branch += [{'role': 'assistant', 'content': seeded['message']['content']},
                       {'role': 'user', 'content': 'What is 4+4? Answer briefly.'}]
            continued = request(port, 'many-turns-followup', branch)
            assert continued['usage']['prompt_tokens_details']['cached_tokens'] >= seeded['usage']['prompt_tokens'] - 256
        result['passed'] = True
        print('PASS long context, advancing disk reuse, and exact restart', flush=True)
    except Exception as error:
        result['error'] = str(error)
        raise
    finally:
        stop()
        result['after'] = vm_snapshot()
        (args.out / 'result.json').write_text(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
