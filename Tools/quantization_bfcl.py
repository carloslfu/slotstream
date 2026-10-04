#!/usr/bin/env python3
"""Bounded offline BFCL instrument. Never evaluates generated Python.

Pinned upstream fixture classes run only under the Mac sandbox. The upstream
state and response checker is retained; its eval-based call executor is replaced
by direct calls to documented methods with bounded literal arguments. This is
an evaluation adapter, not access to real files, vehicles, bookings or accounts.
"""
import ast
import copy
import hashlib
import importlib
import json
import math
import os
from pathlib import Path
import sys
import tempfile

if __name__ == '__main__' and sys.argv[1:2] == ['--worker']:
    sys.path.insert(0, str(Path(__file__).resolve().parent))

from quantization_code_sandbox import _bounded_process, literal, runtime_executable, sandbox_profile

CLASSES = {
    'GorillaFileSystem': 'gorilla_file_system', 'MathAPI': 'math_api',
    'MessageAPI': 'message_api', 'TwitterAPI': 'posting_api',
    'TicketAPI': 'ticket_api', 'TradingBot': 'trading_bot',
    'TravelAPI': 'travel_booking', 'VehicleControlAPI': 'vehicle_control',
}
PREFIX = 'bfcl_eval.eval_checker.multi_turn_eval.func_source_code'
MAX_CALLS = 128
MAX_SECONDS = 8
MAX_PHYSICAL_BYTES = 256_000_000


def bounded_value(value, depth=0, budget=None):
    if budget is None: budget = [4096]
    budget[0] -= 1
    if budget[0] < 0 or depth > 16: raise ValueError('argument structure exceeds its bound')
    kind = type(value)
    if kind in (bool, type(None)): return value
    if kind in (int, float):
        if abs(value) > 1_000_000 or not math.isfinite(value): raise ValueError('numeric argument exceeds its bound')
    elif kind is str:
        if len(value.encode()) > 8192: raise ValueError('string argument exceeds its bound')
    elif kind in (list, tuple, dict):
        if len(value) > 256: raise ValueError('argument collection exceeds its bound')
        for item in value:
            if kind is dict:
                if not isinstance(item, str): raise ValueError('string argument keys required')
                bounded_value(item, depth+1, budget)
                bounded_value(value[item], depth+1, budget)
            else: bounded_value(item, depth+1, budget)
    else: raise ValueError('unsupported argument value')
    return value


def call_from_source(source):
    """Parse pinned reference calls, without executing any expression."""
    if not isinstance(source, str) or len(source.encode()) > 16_000:
        raise ValueError('bounded call source required')
    tree = ast.parse(source, mode='eval').body
    if not isinstance(tree, ast.Call) or not isinstance(tree.func, ast.Name):
        raise ValueError('a bare function call is required')
    if len(tree.args) > 16 or len(tree.keywords) > 32:
        raise ValueError('too many call arguments')
    if any(x.arg is None for x in tree.keywords) or len({x.arg for x in tree.keywords}) != len(tree.keywords):
        raise ValueError('duplicate or expanded keywords refused')
    return validate_call({'name': tree.func.id,
        'args': [literal(ast.unparse(x)) for x in tree.args],
        'kwargs': {x.arg: literal(ast.unparse(x.value)) for x in tree.keywords}})


def validate_call(call):
    if not isinstance(call, dict) or set(call) != {'name', 'args', 'kwargs'}:
        raise ValueError('exact structured call fields required')
    name = call['name']
    if not isinstance(name, str) or not name.isascii() or not name.isidentifier() or name.startswith('_') or len(name) > 64:
        raise ValueError('invalid documented method name')
    if type(call['args']) is not list or len(call['args']) > 16 or type(call['kwargs']) is not dict or len(call['kwargs']) > 32:
        raise ValueError('bounded positional and keyword arguments required')
    bounded_value(call['args']); bounded_value(call['kwargs'])
    return call


def model_call(function):
    if not isinstance(function, dict) or set(function) != {'name', 'arguments'}:
        raise ValueError('exact function fields required')
    arguments = function['arguments']
    if not isinstance(arguments, str) or len(arguments.encode()) > 16_000:
        raise ValueError('bounded JSON arguments required')
    def unique(pairs):
        out = {}
        for key, value in pairs:
            if key in out: raise ValueError('duplicate JSON argument')
            out[key] = value
        return out
    kwargs = json.loads(arguments, object_pairs_hook=unique,
        parse_constant=lambda _: (_ for _ in ()).throw(ValueError('non-finite JSON argument')))
    return validate_call({'name': function['name'], 'args': [], 'kwargs': kwargs})


class FixtureExecutor:
    """Private to one sandbox worker. No object state crosses its boundary."""
    def __init__(self, bundle):
        self.bundle = Path(bundle)
        self.instances = {}
        self.calls = 0
        self.trace = []
        self.documents = {}
        for name, module in CLASSES.items():
            path = self.bundle/'bfcl_eval/data/multi_turn_func_doc'/f'{module}.json'
            self.documents[name] = {x['name']: x for x in map(json.loads, path.read_text().splitlines())}

    def execute(self, func_call_list, initial_config, involved_classes, model_name,
                test_entry_id, long_context=False, is_evaL_run=False):
        if long_context: raise ValueError('this adapter has only qualified the base fixture population')
        if len(set(involved_classes)) != len(involved_classes) or not set(involved_classes) <= set(CLASSES):
            raise ValueError('unreviewed fixture class')
        key = (model_name, test_entry_id, is_evaL_run)
        if key not in self.instances:
            instances = {}
            for name in involved_classes:
                module = importlib.import_module(PREFIX+'.'+CLASSES[name])
                instance = getattr(module, name)()
                if name != 'MathAPI': instance._load_scenario(copy.deepcopy(initial_config.get(name, {})), long_context=False)
                instances[name] = instance
            self.instances[key] = instances
        instances = self.instances[key]
        methods = {}
        for name, instance in instances.items():
            for method in self.documents[name]:
                if method in methods: raise ValueError('ambiguous fixture method')
                methods[method] = getattr(instance, method)
        if type(func_call_list) is not list or len(func_call_list) > MAX_CALLS:
            raise ValueError('bounded call list required')
        results = []
        for call in func_call_list:
            self.calls += 1
            if self.calls > MAX_CALLS: raise ValueError('fixture call count exceeds its bound')
            try:
                call = call_from_source(call) if isinstance(call, str) else validate_call(call)
                if call['name'] not in methods: raise ValueError('method is not available in this fixture')
                method = methods[call['name']]
                # These trusted APIs expose precision/exponent knobs. Bound
                # them before calling the implementation, even in the sandbox.
                import inspect
                bound = inspect.signature(method).bind(*call['args'], **call['kwargs'])
                for name in ('precision', 'decimal_places'):
                    if name in bound.arguments and (type(bound.arguments[name]) is not int or not 0 <= bound.arguments[name] <= 32):
                        raise ValueError('fixture precision exceeds its bound')
                if call['name'] == 'power' and abs(bound.arguments['exponent']) > 64:
                    raise ValueError('fixture exponent exceeds its bound')
                value = method(*call['args'], **call['kwargs'])
                if type(value) is str: result = value
                elif type(value) is dict:
                    try: result = json.dumps(value)
                    except (TypeError, ValueError): result = str(value)
                else: result = str(value)
                if len(result.encode()) > 32_000: raise ValueError('fixture result exceeds its bound')
            except MemoryError:
                raise
            except Exception as error:
                result = 'Error during execution: '+str(error)[:1000]
            results.append(result)
        self.trace.append({'owner': model_name, 'calls': func_call_list, 'results': results})
        return results, instances


def worker(bundle, request):
    import ctypes
    import ctypes.util
    import resource
    import signal
    import time
    resource.setrlimit(resource.RLIMIT_CPU, (6, 7))
    lib = ctypes.CDLL(ctypes.util.find_library('proc'))
    peak_physical = 0
    def guard(*_):
        nonlocal peak_physical
        buffer = ctypes.create_string_buffer(296)
        if lib.proc_pid_rusage(os.getpid(), 4, buffer) != 0:
            raise RuntimeError('cannot observe fixture worker physical footprint')
        physical = max(int.from_bytes(buffer.raw[72:80], 'little'), int.from_bytes(buffer.raw[240:248], 'little'))
        peak_physical = max(peak_physical, physical)
        if physical > MAX_PHYSICAL_BYTES: raise MemoryError('fixture worker physical ceiling')
    signal.signal(signal.SIGALRM, guard); signal.setitimer(signal.ITIMER_REAL, .05, .05)
    os.environ['TZ'] = 'UTC'; time.tzset()
    sys.path.insert(0, str(bundle)); sys.path.insert(0, str(Path(bundle)/'runtime'))
    import mpmath
    if mpmath.__version__ != '1.3.0': raise ValueError('wrong fixture math runtime')
    # Import trusted, pinned source, then replace the unsafe executor before
    # any checker invocation. Model strings never reach upstream eval().
    checker = importlib.import_module('bfcl_eval.eval_checker.multi_turn_eval.multi_turn_checker')
    executor = FixtureExecutor(bundle)
    checker.execute_multi_turn_func_call = executor.execute
    mode = request['mode']; entry = request['entry']
    if mode == 'replay':
        results = []
        for step in request['steps']:
            row, _ = executor.execute(step, entry['initial_config'], entry['involved_classes'], 'replay', entry['id'])
            results.append(row)
        result = {'results': results}
    elif mode == 'grade':
        result = checker.multi_turn_checker(request['turns'], request['gold'], entry, 'multi_turn_base', 'model')
        # Only base cases are admitted. Missing function/parameter categories
        # need their separate upstream irrelevance gate before qualification.
    else: raise ValueError('unknown fixture operation')
    guard(); signal.setitimer(signal.ITIMER_REAL, 0)
    return {'result': result, 'trace': executor.trace, 'calls': executor.calls,
            'peak_worker_bytes': peak_physical}


class Bundle:
    """A private, hash-verified copy survives edits to the source checkout."""
    def __init__(self, source, runtime, manifest, manifest_sha256):
        if sys.platform != 'darwin' or not Path('/usr/bin/sandbox-exec').is_file():
            raise RuntimeError('BFCL execution requires the native Mac sandbox')
        with Path(manifest).open('rb') as handle: raw = handle.read(256_001)
        if len(raw) > 256_000 or hashlib.sha256(raw).hexdigest() != manifest_sha256:
            raise ValueError('fixture manifest identity mismatch')
        document = json.loads(raw)
        if document['schema'] != 1 or document['kind'] != 'bfcl-offline-base-v1':
            raise ValueError('unrecognized fixture manifest')
        self.temporary = tempfile.TemporaryDirectory(prefix='slotstream-bfcl-')
        self.root = Path(self.temporary.name).resolve()
        self.sources = []
        self.manifest_sha256 = manifest_sha256
        try:
            total = 0
            files = [(Path(source), 'bfcl_eval', document['source_files']), (Path(runtime), 'runtime', document['runtime_files'])]
            for origin, prefix, entries in files:
                for name, expected in entries.items():
                    relative = Path(name)
                    if relative.is_absolute() or '..' in relative.parts or relative.suffix not in ('.py', '.json'):
                        raise ValueError('invalid fixture path')
                    path = origin/relative
                    if path.is_symlink() or not path.is_file(): raise ValueError('regular fixture source required')
                    with path.open('rb') as handle: data = handle.read(500_001)
                    total += len(data)
                    if len(data) > 500_000 or total > 16_000_000 or hashlib.sha256(data).hexdigest() != expected:
                        raise ValueError('fixture source changed or exceeds its bound')
                    dest = self.root/prefix/relative; dest.parent.mkdir(parents=True, exist_ok=True)
                    dest.write_bytes(data); dest.chmod(0o400); self.sources.append(dest)
            for name in ('quantization_bfcl.py', 'quantization_code_sandbox.py', 'quantization_tasks.py', 'quantization_inventory.py'):
                path = Path(__file__).with_name(name)
                dest = self.root/name; dest.write_bytes(path.read_bytes()); dest.chmod(0o400); self.sources.append(dest)
            self.source_hashes = {str(p.relative_to(self.root)): hashlib.sha256(p.read_bytes()).hexdigest() for p in self.sources}
            directories = {p.parent for p in self.sources}
            directories |= {p for p in self.root.rglob('*') if p.is_dir()}
            # Namespace-package discovery needs read access to exact directory
            # entries; unrelated siblings remain inaccessible.
            executable = runtime_executable()
            self.profile = sandbox_profile(executable, sys.base_prefix, self.sources+[self.root]+sorted(directories))
            self.profile_file = self.root/'profile.sb'; self.profile_file.write_text(self.profile)
            self.command = ['/usr/bin/sandbox-exec', '-f', str(self.profile_file), str(executable), '-I', '-S', '-B', str(self.root/'quantization_bfcl.py'), '--worker', str(self.root)]
        except BaseException:
            self.close(); raise

    def close(self): self.temporary.cleanup()
    def __enter__(self): return self
    def __exit__(self, *_): self.close()

    def run(self, request):
        payload = json.dumps(request, ensure_ascii=False, allow_nan=False).encode()
        result = _bounded_process(self.command, payload, timeout=MAX_SECONDS)
        if result['exit_code']:
            raise RuntimeError('BFCL fixture infrastructure failed: '+result['stderr'].decode(errors='replace')[:1000])
        lines = result['stdout'].splitlines()
        if len(lines) != 2 or json.loads(lines[0]) != {'worker_ready': True}:
            raise RuntimeError('BFCL fixture handshake incomplete')
        return dict(json.loads(lines[1]), manifest_sha256=self.manifest_sha256,
            adapter_sha256=self.source_hashes['quantization_bfcl.py'],
            sandbox_profile_sha256=hashlib.sha256(self.profile.encode()).hexdigest())


if __name__ == '__main__':
    if len(sys.argv) != 3 or sys.argv[1] != '--worker': raise SystemExit('use the checked Bundle interface')
    # Isolated mode removes the script directory. Admit only this private copy.
    print(json.dumps({'worker_ready': True}), flush=True)
    data = sys.stdin.buffer.read(64_001)
    if len(data) > 64_000: raise ValueError('fixture payload exceeds its bound')
    result = worker(Path(sys.argv[2]), json.loads(data))
    print(json.dumps(result, ensure_ascii=False, allow_nan=False, default=repr), flush=True)
