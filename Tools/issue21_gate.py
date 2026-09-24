#!/usr/bin/env python3
"""Issue 21 regressions against one already-running loopback server.

No tools are executed. Preserve requests, raw SSE and arrival times in --output.
Run with a small explicit memory target, MTP off and no other model process.
"""
import argparse
import http.client
import json
import socket
import struct
import time
from pathlib import Path


def check_disconnect(port, output):
    body = json.dumps({'model': 'qwen3.8-flash-next:4bit', 'stream': True, 'max_tokens': 128,
                      'messages': [{'role': 'user', 'content': 'Count from 1 to 1000.'}]}).encode()
    received = bytearray()
    with socket.create_connection(('127.0.0.1', port), timeout=120) as peer:
        peer.sendall(f'POST /v1/chat/completions HTTP/1.1\r\nHost: localhost\r\nContent-Type: application/json\r\nContent-Length: {len(body)}\r\n\r\n'.encode() + body)
        while b'data: ' not in received:
            chunk = peer.recv(4096)
            assert chunk, 'stream closed before its first event'
            received.extend(chunk)
        # A reset while decoding must fail the writer, never terminate serve.
        peer.setsockopt(socket.SOL_SOCKET, socket.SO_LINGER, struct.pack('ii', 1, 0))
    output.mkdir(parents=True, exist_ok=True)
    (output / 'disconnected-stream.http').write_bytes(received)
    connection = http.client.HTTPConnection('127.0.0.1', port, timeout=120)
    try:
        body = {'model': 'qwen3.8-flash-next:4bit', 'stream': False, 'max_tokens': 4,
                'messages': [{'role': 'user', 'content': 'Say OK.'}]}
        connection.request('POST', '/v1/chat/completions', json.dumps(body), {'Content-Type': 'application/json'})
        response = connection.getresponse()
        result = json.loads(response.read())
        (output / 'after-disconnect.json').write_text(json.dumps(result, indent=2))
        assert response.status == 200 and result['usage']['completion_tokens'] > 0, result
    finally:
        connection.close()
    print('PASS stream reset leaves the server able to complete another request', flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--port', type=int, required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    results = []
    base = {'model': 'qwen3.8-flash-next:4bit', 'temperature': 0, 'seed': 42,
            'stream': True, 'stream_options': {'include_usage': True}, 'max_tokens': 128}
    tool = {'type': 'function', 'function': {'name': 'save_page', 'description': 'Save text.',
            'parameters': {'type': 'object', 'properties': {'content': {'type': 'string'}}, 'required': ['content']}}}

    def request(name, extra):
        body = base | extra
        start = time.monotonic()
        connection = http.client.HTTPConnection('127.0.0.1', args.port, timeout=180)
        events, raw, arrivals = [], [], []
        try:
            connection.request('POST', '/v1/chat/completions', json.dumps(body), {'Content-Type': 'application/json'})
            response = connection.getresponse()
            while line := response.readline():
                raw.append(line)
                if line.startswith(b'data: '):
                    value = line[6:].strip()
                    events.append('[DONE]' if value == b'[DONE]' else json.loads(value))
                    arrivals.append(time.monotonic() - start)
            record = {'name': name, 'request': body, 'status': response.status,
                      'seconds': time.monotonic() - start, 'arrivals': arrivals, 'events': events}
            (args.output / (name + '.sse')).write_bytes(b''.join(raw))
            (args.output / (name + '.json')).write_text(json.dumps(record, indent=2))
            assert response.status == 200, record
            assert events[-1] == '[DONE]', record
            assert not any('error' in event for event in events if isinstance(event, dict)), record
            choices = [choice for event in events if isinstance(event, dict) for choice in event.get('choices', [])]
            finish = next(choice['finish_reason'] for choice in reversed(choices) if choice.get('finish_reason'))
            usage = next(event['usage'] for event in reversed(events) if isinstance(event, dict) and event.get('usage'))
            results.append({'name': name, 'finish': finish, 'usage': usage, 'data_events': len(events)})
            print(json.dumps(results[-1]), flush=True)
            return choices, finish, usage
        finally:
            connection.close()
            (args.output / 'results.json').write_text(json.dumps(results, indent=2))

    count = [{'role': 'user', 'content': 'Count from 1 to 1000, writing every number separated by commas. Do not call any tools.'}]
    for name, tools in [('plain-cap', {}), ('tools-unused-cap', {'tools': [tool]})]:
        choices, finish, usage = request(name, {'messages': count} | tools)
        assert finish == 'length' and usage['completion_tokens'] == 128
        assert sum(bool(choice['delta'].get('content')) for choice in choices) > 10
    choices, finish, usage = request('large-allowance-unused-tools', {
        'messages': [{'role': 'user', 'content': 'What is 2+2? Reply with just the number. Do not call tools.'}],
        'tools': [tool], 'max_tokens': 16000})
    assert finish == 'stop' and 0 < usage['completion_tokens'] < 128
    assert ''.join(choice['delta'].get('content', '') for choice in choices).strip() == '4'
    for label, shape in [('long-truncated-argument', 'string'),
                         ('nullable-truncated-argument', ['string', 'null'])]:
        argument_tool = json.loads(json.dumps(tool))
        argument_tool['function']['parameters']['properties']['content']['type'] = shape
        choices, finish, usage = request(label, {
            'messages': [{'role': 'user', 'content': 'Call save_page now with a complete 2000-word essay about the ocean as content. Write the entire essay inside that argument.'}],
            'tools': [argument_tool], 'tool_choice': {'type': 'function', 'function': {'name': 'save_page'}}, 'max_tokens': 256})
        deltas = [call for choice in choices for call in choice['delta'].get('tool_calls', [])]
        fragments = [call.get('function', {}).get('arguments', '') for call in deltas]
        assert finish == 'length' and usage['completion_tokens'] == 256
        assert sum(bool(fragment) for fragment in fragments) > 10, deltas
        assert sum('id' in call for call in deltas) == 1
        assert ''.join(fragments).startswith('{"content":"')
        timing = json.loads((args.output / (label + '.json')).read_text())
        argument_times = [arrival for event, arrival in zip(timing['events'], timing['arrivals'])
                          if isinstance(event, dict) and any(call.get('function', {}).get('arguments')
                             for choice in event.get('choices', []) for call in choice['delta'].get('tool_calls', []))]
        assert argument_times[-1] - argument_times[0] > 0.5, 'arguments arrived only after generation'

    # Seed actual numerical histories on two branches with different supplied
    # assistant replies. Supplying the first replies makes the collision
    # deterministic instead of depending on stochastic regeneration.
    shared = [{'role': 'system', 'content': 'Reference: ' +
               ' '.join(f'Station {i} records tides and wind.' for i in range(100))},
              {'role': 'user', 'content': 'Name a color.'}]
    alpha = shared + [{'role': 'assistant', 'content': 'Blue.',
                       'reasoning_content': 'I will select blue from the available colors.'},
                      {'role': 'user', 'content': 'Additional reference: ' +
                       'The coastal station monitors tides and rainfall. ' * 50 +
                       'What is 2+2? Answer briefly.'}]
    beta = shared + [{'role': 'assistant', 'content': 'Green.',
                      'reasoning_content': 'I will select green from the available colors.'},
                     {'role': 'user', 'content': 'Additional reference: ' +
                      'The coastal station monitors tides, rainfall and wind direction. ' * 75 +
                      'What is 3+3? Answer briefly.'}]
    choices, finish, alpha_usage = request('branch-alpha-seed', {
        'messages': alpha, 'reasoning_effort': 'low', 'max_tokens': 256})
    assert finish == 'stop'
    alpha_answer = ''.join(choice['delta'].get('content', '') for choice in choices)
    assert alpha_answer
    _, finish, beta_usage = request('branch-beta-seed', {
        'messages': beta, 'reasoning_effort': 'low', 'max_tokens': 256})
    assert finish == 'stop' and beta_usage['prompt_tokens'] > alpha_usage['prompt_tokens']
    alpha_history = [{k: v for k, v in message.items() if k != 'reasoning_content'} for message in alpha]
    alpha_history += [{'role': 'assistant', 'content': alpha_answer},
                      {'role': 'user', 'content': 'What is 4+4? Answer briefly.'}]
    _, finish, usage = request('branch-alpha-followup', {
        'messages': alpha_history, 'reasoning_effort': 'low', 'max_tokens': 256})
    assert finish == 'stop'
    assert usage['prompt_tokens_details']['cached_tokens'] >= alpha_usage['prompt_tokens'] - 256, (alpha_usage, usage)

    # Each earlier assistant reply was generated with reasoning which the
    # client intentionally omits. A descendant must still describe each turn.
    history = [{'role': 'system', 'content': 'Retain this document for the conversation. ' +
                ' '.join(f'Record {i}: the coastal station measures tides and wind.' for i in range(70))},
               {'role': 'user', 'content': 'What is 2+2? Answer briefly.'}]
    cached = []
    for turn in range(3):
        choices, finish, usage = request('cache-turn-' + str(turn + 1), {
            'messages': history, 'reasoning_effort': 'low', 'max_tokens': 256})
        assert finish == 'stop', finish
        answer = ''.join(choice['delta'].get('content', '') for choice in choices)
        reasoning = ''.join(choice['delta'].get('reasoning_content', '') for choice in choices)
        assert answer and reasoning, (answer, reasoning)
        cached.append(usage['prompt_tokens_details']['cached_tokens'])
        question = ('Additional background: ' + 'The coastal station monitors tides, currents, wind and rainfall. ' * 40
                    + 'What is 3+3? Answer briefly.') if turn == 0 else 'What is 4+4? Answer briefly.'
        history.extend([{'role': 'assistant', 'content': answer}, {'role': 'user', 'content': question}])
    assert cached[1] > 0 and cached[2] > cached[1], cached
    connection = http.client.HTTPConnection('127.0.0.1', args.port, timeout=5)
    try:
        connection.request('GET', '/api/version')
        response = connection.getresponse()
        assert response.status == 200
        response.read()
    finally:
        connection.close()
    check_disconnect(args.port, args.output)
    print('PASS issue 21 streaming, length termination, three-turn reasoning reuse and server survival', flush=True)


if __name__ == '__main__':
    main()
