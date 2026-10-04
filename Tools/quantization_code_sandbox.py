#!/usr/bin/env python3
"""Mac-only, fail-closed seatbelt boundary around the bounded coding grader.

This is an evaluation instrument. It has no model qualification policy. It
retains the existing pure-function grammar and operation/allocation guards,
then adds a verified OS boundary with no network, file writes or process fork.
Only the Python runtime and this grader's exact source files can be read.
"""
import ast
import hashlib
import json
import os
from pathlib import Path
import selectors
import subprocess
import sys
import tempfile
import time

MAX_PAYLOAD = 64_000
MAX_OUTPUT = 64_000
MAX_SECONDS = 4


def runtime_executable():
    # macOS framework launchers can spawn a different Python.app executable.
    # Start the actual running image directly so the sandbox never needs to
    # permit a launcher to fork or widen executable access.
    if sys.platform != 'darwin':
        return Path(sys.executable).resolve(strict=True)
    import ctypes
    import ctypes.util
    lib = ctypes.CDLL(ctypes.util.find_library('proc'))
    lib.proc_pidpath.argtypes = [ctypes.c_int, ctypes.c_void_p, ctypes.c_uint32]
    lib.proc_pidpath.restype = ctypes.c_int
    buffer = ctypes.create_string_buffer(4096)
    if lib.proc_pidpath(os.getpid(), buffer, len(buffer)) <= 0:
        raise RuntimeError('cannot identify the running Python executable')
    return Path(os.fsdecode(buffer.value)).resolve(strict=True)


def literal(source):
    if not isinstance(source, str) or not 1 <= len(source.encode()) <= 4096:
        raise ValueError('bounded literal required')
    tree = ast.parse(source, mode='eval')
    nodes = list(ast.walk(tree))
    allowed = (ast.Expression, ast.Constant, ast.List, ast.Tuple, ast.Set,
               ast.Dict, ast.Load, ast.UnaryOp, ast.UAdd, ast.USub)
    if len(nodes) > 512 or any(not isinstance(n, allowed) for n in nodes):
        raise ValueError('literal syntax is outside the bounded grammar')
    def depth(node, level=0):
        if level > 32:
            raise ValueError('literal nesting exceeds its bound')
        for child in ast.iter_child_nodes(node):
            depth(child, level+1)
    depth(tree)
    for node in nodes:
        if isinstance(node, ast.Constant):
            v = node.value
            if type(v) not in (str, int, float, bool, type(None)):
                raise ValueError('unsupported literal value')
            if type(v) in (int, float) and (abs(v) > 1_000_000 or not __import__('math').isfinite(v)):
                raise ValueError('numeric literal exceeds its bound')
    return ast.literal_eval(tree)


def decode_tests(rows):
    if not isinstance(rows, list) or not 1 <= len(rows) <= 64:
        raise ValueError('bounded test list required')
    result = []
    for row in rows:
        if not isinstance(row, dict) or set(row) != {'arguments_python', 'value_python'}:
            raise ValueError('exact literal test fields required')
        args = row['arguments_python']
        if not isinstance(args, list) or len(args) > 16:
            raise ValueError('bounded positional arguments required')
        result.append({'args': [literal(x) for x in args], 'value': literal(row['value_python'])})
    return result


def sandbox_profile(executable, prefix, sources):
    def q(p):
        value = str(Path(p).resolve(strict=True))
        if '\n' in value or '\r' in value:
            raise ValueError('newline in sandbox path')
        return json.dumps(value)
    return '\n'.join([
        '(version 1)', '(deny default)', '(import "dyld-support.sb")',
        '(allow file-read-metadata)',
        '(allow signal (target self))',
        '(allow sysctl-read)',
        f'(allow process-exec (literal {q(executable)}))',
        '(allow file-map-executable (subpath '+q(prefix)+') (subpath "/System/Library") (subpath "/usr/lib"))',
        '(allow file-read* (subpath '+q(prefix)+') (subpath "/System/Library") (subpath "/usr/lib") '
        '(literal "/dev/urandom") (literal "/private/etc/localtime") '+
        '(literal '+q(Path(sources[0]).parent)+') '+
        ' '.join('(literal '+q(p)+')' for p in sources)+')',
    ])+'\n'


def _bounded_process(command, payload, *, timeout=MAX_SECONDS):
    """Drain bounded output without communicate's unbounded accumulation."""
    if len(payload) > MAX_PAYLOAD:
        raise ValueError('coding payload exceeds its bound')
    started = time.monotonic()
    with subprocess.Popen(command, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                          stderr=subprocess.PIPE, cwd='/', env={'PATH': '/usr/bin:/bin', 'LC_ALL': 'C.UTF-8'},
                          start_new_session=True) as process:
        streams = {'stdout': bytearray(), 'stderr': bytearray()}
        try:
            # The input is small, but multiplex it too: a failed startup must
            # never leave the parent blocked writing to an unread pipe.
            with selectors.DefaultSelector() as select:
                for name in ('stdin', 'stdout', 'stderr'):
                    pipe = getattr(process, name); os.set_blocking(pipe.fileno(), False)
                    select.register(pipe, selectors.EVENT_WRITE if name == 'stdin' else selectors.EVENT_READ, name)
                sent = 0
                while select.get_map():
                    if time.monotonic()-started > timeout:
                        raise TimeoutError('bounded coding worker exceeded its wall deadline')
                    for key, event in select.select(.02):
                        pipe, name = key.fileobj, key.data
                        if name == 'stdin':
                            try: sent += os.write(pipe.fileno(), payload[sent:sent+4096])
                            except BrokenPipeError: sent = len(payload)
                            if sent == len(payload): select.unregister(pipe); pipe.close()
                        else:
                            data = os.read(pipe.fileno(), 8192)
                            if not data: select.unregister(pipe); pipe.close(); continue
                            streams[name].extend(data)
                            if sum(map(len, streams.values())) > MAX_OUTPUT:
                                raise ValueError('coding worker output exceeds its bound')
                process.wait(timeout=max(.001, timeout-(time.monotonic()-started)))
        except BaseException:
            if process.poll() is None:
                process.kill()
            process.wait(timeout=5)
            raise
    return {'exit_code': process.returncode, 'stdout': bytes(streams['stdout']),
            'stderr': bytes(streams['stderr']), 'seconds': time.monotonic()-started}


def grade(text, function, tests):
    if sys.platform != 'darwin' or not Path('/usr/bin/sandbox-exec').is_file():
        raise RuntimeError('the evaluated coding protocol requires the native Mac sandbox')
    from quantization_tasks import validate_code
    decode_tests(tests)
    if not isinstance(text, str) or not isinstance(function, str):
        raise ValueError('coding response and declared function must be strings')
    try:
        validate_code(text, function)
    except (ValueError, SyntaxError) as error:
        return {'passed': False, 'reason': 'response is outside the declared pure-function grammar',
                'exception': type(error).__name__, 'detail': str(error)[:500]}
    payload = json.dumps({'text': text, 'function': function, 'literal_tests': tests}, ensure_ascii=False).encode()
    if len(payload) > MAX_PAYLOAD: raise ValueError('coding payload exceeds its bound')
    source = Path(__file__).resolve()
    sources = [source, source.with_name('quantization_tasks.py'), source.with_name('quantization_inventory.py')]
    digests = {p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in sources}
    with tempfile.TemporaryDirectory(prefix='slotstream-coding-grader-') as temp:
        temp = Path(temp).resolve()
        # A dedicated immutable copy prevents source edits or bytecode caches
        # from changing the worker between the receipt and actual execution.
        copies = []
        for p in sources:
            copy = temp/p.name; copy.write_bytes(p.read_bytes()); copy.chmod(0o400)
            if hashlib.sha256(copy.read_bytes()).hexdigest() != digests[p.name]:
                raise RuntimeError('grader source changed while copied')
            copies.append(copy)
        executable = runtime_executable()
        profile = sandbox_profile(executable, sys.base_prefix, copies)
        profile_file = temp/'profile.sb'; profile_file.write_text(profile)
        result = _bounded_process(['/usr/bin/sandbox-exec', '-f', str(profile_file),
                                   str(executable), '-I', '-S', '-B', str(copies[0]), '--worker'], payload)
    if result['exit_code']:
        raise RuntimeError('sandbox worker failed before returning a complete grading result: '+result['stderr'].decode(errors='replace')[:500])
    lines = result['stdout'].splitlines()
    if len(lines) != 2 or json.loads(lines[0]) != {'worker_ready': True}:
        raise RuntimeError('sandbox worker did not complete its readiness handshake')
    value = json.loads(lines[1])
    if not isinstance(value, dict) or type(value.get('passed')) is not bool:
        raise ValueError('invalid coding worker result')
    return dict(value, grader_sha256=digests, sandbox_profile_sha256=hashlib.sha256(profile.encode()).hexdigest())


if __name__ == '__main__':
    if sys.argv[1:] != ['--worker']:
        raise SystemExit('internal worker only')
    sys.path.insert(0, str(Path(__file__).resolve().parent))
    from quantization_tasks import worker
    raw = sys.stdin.buffer.read(MAX_PAYLOAD+1)
    if not raw or len(raw) > MAX_PAYLOAD:
        raise ValueError('worker payload exceeds its bound')
    payload = json.loads(raw)
    if set(payload) != {'text', 'function', 'literal_tests'}:
        raise ValueError('exact worker fields required')
    payload['tests'] = decode_tests(payload.pop('literal_tests'))
    print(json.dumps({'worker_ready': True}), flush=True)
    try:
        result = worker(payload)
    except Exception as error:
        result = {'passed': False, 'reason': 'bounded function execution failed',
                  'exception': type(error).__name__, 'detail': str(error)[:500]}
    print(json.dumps(result, separators=(',', ':')))
