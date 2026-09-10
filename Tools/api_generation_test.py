"""Exercise real API-gate shell predicates with local fake curl responses."""
import argparse
import contextlib
import copy
import http.client
import io
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import threading
import time
import unittest
from unittest.mock import patch

from api_generation import ollama_text, openai_text

ROOT = Path(__file__).resolve().parent.parent
SCRIPT = ROOT / 'Tools/api_robustness.sh'

FAKE_CURL = r'''#!/usr/bin/env python3
import json,os,sys
from pathlib import Path
a=sys.argv[1:];url=next(x for x in a if x.startswith('http://'))
b=json.loads(a[a.index('-d')+1]);o=b.get('options') or {}
prompt=b.get('prompt') or (b.get('messages') or [{'content':''}])[-1]['content']
fault=os.environ['API_GENERATION_FAULT'];counter=Path(os.environ['API_GENERATION_COUNTER'])
n=int(counter.read_text())+1 if counter.exists() else 1;counter.write_text(str(n))
text='pong' if 'pong' in str(prompt) else 'one two three'
if 'fun fact' in str(prompt):text='same fact' if 'seed' in o else 'fact '+str(n)
body={'done':True,'done_reason':'stop','eval_count':5,'message':{'role':'assistant','content':text},'response':text}
status=200;code=0
if url.endswith('/api/generate') and not prompt:body={'done':True,'done_reason':'load','response':''}
elif url.endswith('/v1/chat/completions'):
    body={'choices':[{'message':{'role':'assistant','content':'ARRAYOK'},'finish_reason':'stop'}],'usage':{'completion_tokens':5}}
    if fault=='openai-exit':code=23
    if fault=='openai-http':status=503
    if fault=='openai-finish':body['choices'][0]['finish_reason']='error'
elif 'seed' in o:
    if fault=='matching-errors':body={'error':'memory pressure interrupted tokenization'}
    if fault=='empty-seed':body['message']['content']=''
    if fault=='unfinished-seed':body['done']=False
    if fault=='seed-exit':code=23
elif 'fun fact' in str(prompt):
    if fault=='varying-errors':body={'error':'memory pressure '+str(n)}
    if fault=='variation-exit':code=23
elif o.get('stop')==['4']:
    if fault=='stop-error':body={'error':'memory pressure'}
    if fault=='stop-exit':code=23
elif any(k in o for k in ('top_p','min_p')) and fault=='sampling-error':body={'error':'memory pressure'}
elif 'keep_alive' in b and fault=='null-options-error':body={'error':'memory pressure'}
elif url.endswith('/api/generate') and prompt and fault=='generate-error':body={'error':'memory pressure'}
if status>=400 and any(x.startswith('-') and not x.startswith('--') and 'f' in x for x in a):
    raise SystemExit(22)
print(json.dumps(body,separators=(',',':')))
raise SystemExit(code)
'''


def region(text, start, end):
    begin = text.index(start)
    return text[begin:text.index(end, begin)]


class ActualAPITextPredicates(unittest.TestCase):
    def run_predicates(self, fault):
        source = SCRIPT.read_text()
        helper = region(source, 'post() {', '# Browser origins')
        sampling = region(source, 'for BADP in ', '# --- limits and protocol')
        lines = source.splitlines(keepends=True)
        first = next(i for i, line in enumerate(lines)
                     if line.startswith('R=$(') and '"keep_alive":"5m"' in line)
        last = next(i for i, line in enumerate(lines[first:], first)
                    if line.startswith('R=$(') and '"prompt":"def f("' in line)
        clients = ''.join(lines[first:last])
        seeds = region(source, '# --- an unseeded request', '# --- HTTP: routing')
        preamble = 'set -u\nPORT=12345\nPASS=0; FAIL=0\n'
        preamble += region(source, 'say() {', 'SERVER_ARGS=()')
        script = preamble + helper + sampling + clients + seeds + '\n[ "$FAIL" -eq 0 ]\n'
        with tempfile.TemporaryDirectory(prefix='slotstream-api-generation-') as name:
            path = Path(name)
            curl = path / 'curl'; curl.write_text(FAKE_CURL); curl.chmod(0o755)
            env = {k: v for k, v in os.environ.items()
                   if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'API_GENERATION_'))}
            env.update(PATH=str(path) + os.pathsep + os.environ['PATH'],
                       API_GENERATION_FAULT=fault, API_GENERATION_COUNTER=str(path / 'counter'))
            return subprocess.run(['bash', '-c', script], cwd=ROOT, env=env,
                                  text=True, capture_output=True, timeout=15)

    def test_complete_generations_preserve_all_text_predicates(self):
        result = self.run_predicates('success')
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(sum(line.startswith('PASS') for line in result.stdout.splitlines()), 10)

    def test_error_text_cannot_certify_generation(self):
        for fault, label in [('matching-errors', 'seeded requests'),
                             ('varying-errors', 'unseeded requests'),
                             ('empty-seed', 'seeded requests'),
                             ('unfinished-seed', 'seeded requests'),
                             ('sampling-error', 'out-of-range'),
                             ('stop-error', 'stop sequence'),
                             ('null-options-error', '/api/chat rejects'),
                             ('generate-error', '/api/generate rejects'),
                             ('openai-finish', 'array-form content')]:
            with self.subTest(fault=fault):
                result = self.run_predicates(fault)
                self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)
                self.assertTrue(any(line.startswith('FAIL') and label in line
                                    for line in result.stdout.splitlines()), result.stdout)

    def test_failed_producer_cannot_certify_plausible_content(self):
        for fault in ['seed-exit', 'variation-exit', 'stop-exit', 'openai-exit', 'openai-http']:
            with self.subTest(fault=fault):
                result = self.run_predicates(fault)
                self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)


class CompletionContracts(unittest.TestCase):
    def test_stream_requires_one_successful_final_terminal(self):
        delta = {'message': {'role': 'assistant', 'content': 'text'}, 'done': False}
        tail = {'message': {'role': 'assistant', 'content': ''}, 'done': True,
                'done_reason': 'stop', 'eval_count': 1}
        self.assertEqual(ollama_text([delta, tail], stream=True), 'text')
        for frames in [[], [delta], [delta, {'error': 'failed'}],
                       [delta, tail, tail], [delta, tail, delta],
                       [delta, {**tail, 'done_reason': 'error'}],
                       [delta, {**tail, 'eval_count': True}]]:
            with self.subTest(frames=frames), self.assertRaises(ValueError):
                ollama_text(frames, stream=True)

    def test_complete_shapes_and_scalar_types(self):
        chat = {'message': {'role': 'assistant', 'content': 'ok'}, 'done': True,
                'done_reason': 'length', 'eval_count': 2}
        self.assertEqual(ollama_text(chat), 'ok')
        self.assertEqual(ollama_text({**chat, 'response': 'ok'}, generated=True), 'ok')
        for key, value in [('done', 1), ('done_reason', None), ('eval_count', True),
                           ('eval_count', 1.0), ('eval_count', 0), ('eval_count', -1)]:
            with self.subTest(key=key, value=value), self.assertRaises(ValueError):
                ollama_text({**chat, key: value})
        openai = {'choices': [{'message': chat['message'], 'finish_reason': 'stop'}],
                  'usage': {'completion_tokens': 2}}
        self.assertEqual(openai_text(openai), 'ok')
        for count in [None, False, 0, -1, 1.0]:
            with self.subTest(count=count), self.assertRaises(ValueError):
                openai_text({**openai, 'usage': {'completion_tokens': count}})


class ActualPythonStreamPredicates(unittest.TestCase):
    def run_block(self, marker, fault):
        text = SCRIPT.read_text()
        section = text[text.index(marker):]
        code = section.split("<<'PYEOF'\n", 1)[1].split('\nPYEOF\n', 1)[0]
        class Response:
            status = 503 if fault == 'http-status' else 200
            def __init__(self, streamed):
                self.streamed = streamed
            def read(self):
                terminal = {'done': True, 'done_reason': 'stop', 'eval_count': 4,
                            'message': {'role': 'assistant', 'content': ''}}
                if not self.streamed:
                    return json.dumps({**terminal, 'message': {
                        'role': 'assistant', 'content': 'xxxx'}}).encode()
                frames = [{'done': False, 'message': {'role': 'assistant', 'content': 'x'}} for _ in range(4)]
                if fault == 'unfinished': terminal['done'] = False
                if fault == 'error-with-text': terminal['error'] = 'failed after sampling'
                frames.append(terminal)
                if fault == 'duplicate': frames.append(terminal)
                return ('\n'.join(json.dumps(frame) for frame in frames) + '\n').encode()
        class Connection:
            def __init__(self, *args, **kwargs): pass
            def request(self, method, path, body, headers): self.streamed = json.loads(body)['stream']
            def getresponse(self): return Response(self.streamed)
            def close(self): pass
        captured = io.StringIO()
        with patch.object(http.client, 'HTTPConnection', Connection), \
                patch.object(sys, 'argv', ['fixture', '12345']), \
                patch.object(sys, 'path', [str(ROOT), *sys.path]), \
                contextlib.redirect_stdout(captured), contextlib.redirect_stderr(captured):
            try:
                exec(compile(code, str(SCRIPT), 'exec'), {})
            except SystemExit as error:
                return error.code or 0
            except (ValueError, AssertionError, KeyError, TypeError):
                return 1
        return 0

    def test_complete_streams_keep_both_real_python_predicates(self):
        for marker in ['# --- silently wrong output', '# --- a short reply streams']:
            with self.subTest(marker=marker):
                self.assertEqual(self.run_block(marker, 'success'), 0)

    def test_plausible_text_and_counts_cannot_hide_failed_streams(self):
        for marker in ['# --- silently wrong output', '# --- a short reply streams']:
            for fault in ['http-status', 'unfinished', 'error-with-text', 'duplicate']:
                with self.subTest(marker=marker, fault=fault):
                    self.assertNotEqual(self.run_block(marker, fault), 0)


class ActualMetadataConcurrencyPredicate(unittest.TestCase):
    def run_block(self, fault):
        source = SCRIPT.read_text()
        section = source[source.index('# --- metadata must not block'):]
        code = section.split("<<'PYEOF'\n", 1)[1].split('\nPYEOF\n', 1)[0]
        probes_finished = threading.Event()
        metadata_calls = []
        class Response:
            def __init__(self, generation):
                self.generation = generation
                self.status = 503 if generation and fault == 'http-error' else 200
            def read(self):
                if not self.generation: return b'{}'
                if fault == 'read-error': raise OSError('failed response')
                if fault == 'error-body': return b'{"error":"memory pressure"}'
                return json.dumps({'done': fault != 'incomplete', 'done_reason': 'stop',
                    'eval_count': 60, 'message': {'role': 'assistant', 'content': 'poem'}}).encode()
            def __iter__(self):
                if fault == 'read-error': raise OSError('failed response')
                if fault == 'error-body':
                    yield b'{"error":"memory pressure"}\n'
                    return
                delta = {'done': False, 'message': {'role': 'assistant', 'content': 'poem'}}
                yield (json.dumps(delta)+'\n').encode()
                if fault != 'no-overlap':
                    if not probes_finished.wait(2): raise TimeoutError('metadata never observed')
                    yield (json.dumps(delta)+'\n').encode()
                if fault == 'incomplete': return
                tail = {'done': True, 'done_reason': 'stop', 'eval_count': 60,
                        'message': {'role': 'assistant', 'content': ''}}
                yield (json.dumps(tail)+'\n').encode()
                if fault == 'late-error': yield b'{"error":"failed after content"}\n'
        class Connection:
            def __init__(self, *args, **kwargs): pass
            def request(self, method, path, body=None, headers=None):
                self.generation = path == '/api/chat'
                if not self.generation:
                    metadata_calls.append(path)
            def getresponse(self): return Response(self.generation)
            def close(self): pass
        class HeldSocket:
            def sendall(self, _): pass
            def close(self): pass
        captured = io.StringIO()
        original_monotonic = time.monotonic
        def clock():
            now = original_monotonic()
            if threading.current_thread() is threading.main_thread() and len(metadata_calls) >= 6:
                probes_finished.set()
            return now
        with patch.object(http.client, 'HTTPConnection', Connection), \
                patch('socket.create_connection', return_value=HeldSocket()), \
                patch.object(time, 'sleep', lambda _: None), \
                patch.object(time, 'monotonic', clock), \
                patch.object(sys, 'argv', ['fixture', '12345']), \
                patch.object(sys, 'path', [str(ROOT), *sys.path]), \
                contextlib.redirect_stdout(captured), contextlib.redirect_stderr(captured):
            try:
                exec(compile(code, str(SCRIPT), 'exec'), {})
            except SystemExit as error:
                return error.code or 0
            except (ValueError, AssertionError, KeyError, TypeError):
                return 1
        return 0

    def test_metadata_is_measured_during_successful_generation(self):
        self.assertEqual(self.run_block('success'), 0)

    def test_idle_or_failed_generation_cannot_pass_concurrency(self):
        for fault in ['http-error', 'error-body', 'read-error', 'incomplete',
                      'no-overlap', 'late-error']:
            with self.subTest(fault=fault):
                self.assertNotEqual(self.run_block(fault), 0)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script', type=Path, default=SCRIPT)
    options, remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])
