---
type: run
created: 2026-10-04T10:09:41.006248+00:00
updated: 2026-10-04T10:09:41.006248+00:00
summary: Held-out grader and source preparation
binary: Python source hashes recorded below; no model executable used
captured_at: 2026-10-04
command: Bounded native sandbox tests, source-grader preparation, pinned upstream tests and dependency verification retained below.
discarded: false
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Held-out grader and source preparation
tool: native sandbox coding grader and pinned offline source instruments
---

This prepares and checks quality instruments and prospective source populations. No final model evaluation, final sample, quality margin adoption or candidate promotion occurs.

The new Mac-only Tools/quantization_code_sandbox.py wraps the existing restricted pure-function executor with a fail-closed native sandbox. It admits only bounded literal tests and preserves tuple/set types. It copies and fingerprints its three grader sources, grants read access only to those copies and the Python runtime, denies filesystem writes, unrelated file contents, network and process forks, and bounds input/output/wall time. The existing worker retains its CPU, operation-allocation and trace limits. Its readiness handshake prevents a failed interpreter startup from being scored as model failure.

The first minimal native sandbox prototypes fail before Python starts. Apple's installed dyld bootstrap policy is required; with it, real test-owned file reads/writes, loopback connections and forks are refused while the standard library works. The first actual-source suite also exposes Apple's framework Python launcher trying to spawn Python.app, and the static registration fixture lacks the newly added helper. The repair identifies and directly starts the running interpreter image via proc_pidpath, preserves fork denial, and updates the fixture list. All seven helper test groups pass on both system Python 3.9 and the project's Python 3.12; all thirty-two static registration checks pass. These are scoped changed-path checks after the separately recorded full native/static vision acceptance, not another claim to have rerun that entire suite.

The pinned upstream MBPP test split contains five hundred source tasks. The existing declared grammar admits three hundred twenty syntactically; bounded literal arguments, exact unmodified reference success and no input mutation leave two hundred forty-nine usable repair fixtures. A deterministic single-source mutation fails the tests for every such fixture. Reference failures and out-of-scope fixtures are preserved individually. Draft and corrected actual-source graders produce the same eligibility, mutations and outcomes for all three hundred twenty checked candidates. This is prospective population definition, not scoring model answers, and supports only this restricted coding domain.

Pinned public IFEval, MBPP, MGSM, BFCL and MMLU source bytes are retained locally with upstream coordinates, licenses, sizes and hashes. Primary sources: google-research/google-research at e6890f85757dd84e27ca6df2dd30651dafad28e0 for IFEval and f46ca8374b4cddef97ca4208ad986049d74d296a for MBPP; google-research/url-nlp at 3622039cf51f7eeffa58b957332a8e8c337981d7 for MGSM; ShishirPatil/gorilla at 6ea57973c7a6097fd7c5915698c54c17c5b1b6c8 for BFCL; cais/mmlu at c30699e8356da336a370243923dbaf21066bb9fe. MBPP is by Austin et al., Program Synthesis with Large Language Models (2021); its code/data are under the repository's Apache license. MGSM by Shi et al., Language Models are Multilingual Chain-of-Thought Reasoners, is CC BY 4.0; its translated versions share the same underlying problems and cannot count as independent task pairs. BFCL's offline source has only been acquired and inspected, not integrated or functionally qualified.

The isolated grader dependency install log finishes, but its process observer encounters a disappearing temporary directory. The failure remains preserved. A separate read-only recovery verifies every installed RECORD entry and pinned version, imports the intended libraries and verifies the immutable MMLU parquet hash and fourteen thousand forty-two rows. The existing model environment is not modified. IFEval's first test launcher discovers zero tests because runpy did not replace __main__; the corrected launcher changes that bootstrap only. All forty-one upstream instruction tests and seven utility tests pass unchanged with frozen random/language-detector seeds and pinned English tokenizer data. No candidate quality score, sample-size claim, performance result, new model weight or installed product change follows from these checks.

Local home prefixes are replaced with <HOME>. Original lengths and SHA-256 identify the unmodified files. Large or whitespace-bearing normalized UTF-8 transcripts are losslessly zlib-compressed and base64 encoded. Decode with `zlib.decompress(base64.b64decode(block))` and check the normalized digest. Every encoded block is verified before writing. Frozen binaries, source archives and weights remain in bounded local staging; the receipts bind their exact bytes.

### .build/quantization-research/capture-heldout-instruments-v2.py

Original bytes: 7720. SHA-256: `d5137c121546ed29bebabeddadd940e9ca4ac55401347a47d56a1906d7701441`.

Normalized bytes: 7720. SHA-256: `d5137c121546ed29bebabeddadd940e9ca4ac55401347a47d56a1906d7701441`.

````zlib-base64
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
````

### Tools/quantization_code_sandbox.py

Original bytes: 10344. SHA-256: `acc1f6defc68d33dfbe0bfccd5b1c22de3607b6d31006cb1b4d57d12cdb9dd93`.

Normalized bytes: 10344. SHA-256: `acc1f6defc68d33dfbe0bfccd5b1c22de3607b6d31006cb1b4d57d12cdb9dd93`.

````text
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
````

### Tools/quantization_code_sandbox_test.py

Original bytes: 4688. SHA-256: `79feae02e98fa564d15e863540e3b17411fabee9ffbb063caf8b248c7eaf0b21`.

Normalized bytes: 4688. SHA-256: `79feae02e98fa564d15e863540e3b17411fabee9ffbb063caf8b248c7eaf0b21`.

````zlib-base64
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
B+8U
````

### .build/quantization-research/heldout-code-actual-tests-v1.log

Original bytes: 1851. SHA-256: `0619d64dcc059ec7230c52ad4510668946321b5b5807554dec06b2007b68c14a`.

Normalized bytes: 1830. SHA-256: `a212d5904652194ea45058e642e00bb5594635e5583a6b8b0218bcd99959b275`.

````text
....E.F
======================================================================
ERROR: test_correct_wrong_mutating_and_nonterminating (__main__.NativeTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "<HOME>/Projects/slotstream/Tools/quantization_code_sandbox_test.py", line 39, in test_correct_wrong_mutating_and_nonterminating
    self.assertTrue(q.grade('def f(x):\n    return tuple(reversed(x))','f',self.tests)['passed'])
  File "<HOME>/Projects/slotstream/Tools/quantization_code_sandbox.py", line 159, in grade
    raise RuntimeError('sandbox worker failed before returning a complete grading result: '+result['stderr'].decode(errors='replace')[:500])
RuntimeError: sandbox worker failed before returning a complete grading result: python3.9: posix_spawn: /Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/Resources/Python.app/Contents/MacOS/Python: Undefined error: 0


======================================================================
FAIL: test_real_os_boundaries (__main__.NativeTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "<HOME>/Projects/slotstream/Tools/quantization_code_sandbox_test.py", line 71, in test_real_os_boundaries
    self.assertEqual(response['exit_code'],0,response['stderr']);self.assertEqual(json.loads(response['stdout']),dict(read=True,write=True,network=True,fork=True,stdlib=True))
AssertionError: 1 != 0 : b'python3.9: posix_spawn: /Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/Resources/Python.app/Contents/MacOS/Python: Undefined error: 0\n'

----------------------------------------------------------------------
Ran 7 tests in 0.195s

FAILED (failures=1, errors=1)
````

### .build/quantization-research/heldout-code-actual-tests-v2.log

Original bytes: 105. SHA-256: `36d4494e1983edd38c76a1723b58949a6e1f4324495e2f9ed736b07bbf2b8355`.

Normalized bytes: 105. SHA-256: `36d4494e1983edd38c76a1723b58949a6e1f4324495e2f9ed736b07bbf2b8355`.

````text
.......
----------------------------------------------------------------------
Ran 7 tests in 0.828s

OK
````

### .build/quantization-research/heldout-code-draft-tests-v1.log

Original bytes: 105. SHA-256: `4dfe56f60a155aecca4bac7652f6da7c06719c6e38168e0b36383e4ac34b533d`.

Normalized bytes: 105. SHA-256: `4dfe56f60a155aecca4bac7652f6da7c06719c6e38168e0b36383e4ac34b533d`.

````text
.......
----------------------------------------------------------------------
Ran 7 tests in 0.368s

OK
````

### .build/quantization-research/heldout-code-static-registration-v1.log

Original bytes: 8720. SHA-256: `99181180d3cbb9e34589a243f7c8e66cb883d13fef6a1dadd1784e7dc138f0c5`.

Normalized bytes: 8615. SHA-256: `db571d15614be1868566867b04c794352a2044e0eb8c82830eac9c41135b65f7`.

````zlib-base64
eNrtmO9v4jYYx9/nr/DuTUCFhARKObRO6u1AO6l3NxXeTAhZJnlC3Tp2znYodNr/vicBBFvbG2hM
GqURv+Ik+Hm+z+drJ/b6fc/DF370y4/yy1u24du5PMjm9K8+XXeJBWNpDAnLhaUaBDADlBuaG4gp
kzFNlH5gOoaYVChNGZeUegPLLI8+cMn0YoDXRJYrWXXqB9mcoWYRTFh0TyqpMpZoiEBaEjEhiGDG
VrsOIX0ugLz78Zevn3s/+b9qdYdBGN8IZY3VwFJ/qJTAhjJSOmWYJ52UAdMiZS9bvKsRwSWQIGjX
CJd7KIHdE2JAJB7MM+yXmlIDiCu//1Ej7upat3rYMBsXZZh/63ITCzMGtO19y5moZJ4Gm2sZqRhq
pFEjmWdsrHJ7Vv4AravOVXk+Fq6ntdJdEpIfLkmDdIl/zScaI/A/wgyEykD7P6s0RQmuMZBlwLnR
PsbpZwt7q2Szi9WRriV4siRJkbPrZ5rPMB9/xrSfKIGdGj9u+TaIOsJO5uemSYMgMu8X7endbSdt
4DbN/OGWOPWlLHWzRqzOY7hTjw22kg1zlZY/suIYLXKlBqOcqPlaPLdLRpieVCQcky+KmDy6Xcan
NIk5kmWVXjjOf+Ap1A6LqDLL03WEJucWqM4l1hiQJqASD8yARrcQ3ZvXarAwbGwMtr8sp0V4qz2P
80zRIyA8YdhNTGPNEkuFiu6psSo7LbaD5hbb+wjyPNUaDM4+f0E7bNbIqnkJODnb2n+Z87D5/wY9
YFP2bRJkxwN6Cqkqxi4cwTRORMiz1Xy+qjGLIsgskxG8WtTP209Q31GSk4c9NOeTLKHmeGBfDVar
AmuYYhlMOVufCu6t4AnuO4ty8sC3W8ksNvH74wE+y4WgXFrUPM9sicbpsN5+yvouepw85jxdWKbk
UdzEaPUIcjNVW3aPPGQFWTFgLcsjVMCURYsCk1fL+sXFFut7ivKdlR/3w6cvWF4Mp1KeUPbOwYzc
5eXuuFp7WxA6tAEvWOe89SimR2jAB25vqckQfnNiC64XrZcd+I+qfM+Cg+uvw8Hwpnf1mQ57gyFF
S17d/Pa8K5cdoyuLJdvVztuK7cEN2uBhZ5HmkyMw6GaY3+B4Ysbcug3cWY1/NycW7lvtvLnv8O5T
8WzWse0jcF/K8VFaTk/8OayzMeA+gjxP9Uirh5HL9DRPMWrjjgmalmBj0Qd+mXGNjEauzhGKFOrl
wrRbtLlFn+v98VP0r7mxBnlIEsC90bhwwg5/5DgDiJSMMVnUEn9ZrKFBI7E45sXfM0GwhGWwntPn
Gs+CudVs3UoaXedJN45TxxCcs90iODy465FlXdPi+TnX6xoV9zM4jmCrEEuQXim6nS1095NklyE5
bL64QuAcSrEbJkkzLDMwRSpB6OEkYpyy2L2PpLJKw1wGQdX5E3VFDZ0=
````

### .build/quantization-research/heldout-code-static-registration-v2.log

Original bytes: 132. SHA-256: `2350deec33f3cd5d066b5393db6fb320d2d53ccb051d84087fde8a496fc05295`.

Normalized bytes: 132. SHA-256: `2350deec33f3cd5d066b5393db6fb320d2d53ccb051d84087fde8a496fc05295`.

````text
................................
----------------------------------------------------------------------
Ran 32 tests in 32.715s

OK
````

### .build/quantization-research/heldout-code-venv-tests-v2.log

Original bytes: 105. SHA-256: `c638b3ce701361c008e0c5891264ba17623b2a51e0d0ddee8f5ea6d0e3373597`.

Normalized bytes: 105. SHA-256: `c638b3ce701361c008e0c5891264ba17623b2a51e0d0ddee8f5ea6d0e3373597`.

````text
.......
----------------------------------------------------------------------
Ran 7 tests in 0.385s

OK
````

### .build/quantization-research/heldout-mbpp-population-equality-v2.json

Original bytes: 462. SHA-256: `1e1b72dbbb0e39d2c9e06002ecf435e1fb7688eb7767a8e838bd8ea94e812fce`.

Normalized bytes: 462. SHA-256: `1e1b72dbbb0e39d2c9e06002ecf435e1fb7688eb7767a8e838bd8ea94e812fce`.

````text
{
  "complete": true,
  "scope": "Draft and corrected actual-source graders preserve all prospective eligibility and mutation outcomes; no model outputs",
  "source_receipts": {
    "heldout-mbpp-instrument-v1": "0e09fe729e93c4ab2edf96b3b5ed1f0bf8d7af6b215112decdb3380c53510d69",
    "heldout-mbpp-instrument-v2": "ffdd8022b4c8c12a49ff614c27ab15b9829bb8de033a0733c232bfab7d515e3a"
  },
  "source_candidates": 320,
  "validated_repairs": 249,
  "model_runs": 0
}
````

### .build/quantization-research/heldout-mbpp-syntax-population-v1.json

Original bytes: 177098. SHA-256: `b87517489f79bec5baa58c29db2b6a7005555632ecceaeb6d15f7da9a5fb0c53`.

Normalized bytes: 177098. SHA-256: `b87517489f79bec5baa58c29db2b6a7005555632ecceaeb6d15f7da9a5fb0c53`.

````zlib-base64
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
````

### .build/quantization-research/heldout-mbpp-instrument-v1.log

Original bytes: 95. SHA-256: `40c6b0aca5b337a8de05dc6a94b648520d5b02f59e8a233268de391313492c0c`.

Normalized bytes: 95. SHA-256: `40c6b0aca5b337a8de05dc6a94b648520d5b02f59e8a233268de391313492c0c`.

````text
{'complete': True, 'seconds': 24.811910167045426, 'reference_valid': 249, 'repair_valid': 249}
````

### .build/quantization-research/heldout-mbpp-instrument-v2.log

Original bytes: 95. SHA-256: `dd8d41d3d53ed716ab3fe27eceed12256afea81f5325d5786901576d95fb18dc`.

Normalized bytes: 95. SHA-256: `dd8d41d3d53ed716ab3fe27eceed12256afea81f5325d5786901576d95fb18dc`.

````text
{'complete': True, 'seconds': 23.542671292030718, 'reference_valid': 249, 'repair_valid': 249}
````

### .build/quantization-research/probe-heldout-sandbox-v1.py

Original bytes: 2133. SHA-256: `85a74257847185d4e20dc2bf28f4a03f9a8eb39f0fc07637d4badec273c1d51c`.

Normalized bytes: 2133. SHA-256: `85a74257847185d4e20dc2bf28f4a03f9a8eb39f0fc07637d4badec273c1d51c`.

````text
from pathlib import Path
import json,subprocess,sys,hashlib,datetime
r=Path('.build/quantization-research/heldout-sandbox-v1').absolute();r.mkdir(exist_ok=False)
info=json.loads(subprocess.check_output(['.venv/bin/python','-I','-S','-c','import sys,os,json; print(json.dumps({"executable":os.path.realpath(sys.executable),"prefix":sys.base_prefix}))']))
profile='''(version 1)
(deny default)
(allow process-exec (literal %s))
(allow sysctl-read)
(allow file-read* (subpath %s) (subpath "/System/Library") (subpath "/usr/lib") (literal "/dev/urandom") (literal "/private/etc/localtime"))
'''%(json.dumps(info['executable']),json.dumps(info['prefix']))
(r/'profile.sb').write_text(profile)
(r/'sentinel.txt').write_text('test-owned boundary sentinel\n')
worker='''import os,json,socket,errno,math,random,resource
checks={}
for name,fn in [
 ("outside_read",lambda:open(%s).read()),
 ("file_write",lambda:open(%s,"w").write("unexpected")),
 ("loopback_network",lambda:socket.socket().connect(("127.0.0.1",9))),
 ("process_fork",lambda:os.fork())]:
 try:
  fn();checks[name]={"denied":False}
 except OSError as e: checks[name]={"denied":e.errno in (errno.EPERM,errno.EACCES),"errno":e.errno}
checks["stdlib"]={"passed":math.isqrt(81)==9 and random.Random(7).randrange(100)==41}
print(json.dumps(checks))
'''%(repr(str(r/'sentinel.txt')),repr(str(r/'forbidden-write')))
command=['/usr/bin/sandbox-exec','-f',str(r/'profile.sb'),info['executable'],'-I','-S','-B','-c',worker]
result=subprocess.run(command,env={'PATH':'/usr/bin:/bin','PYTHONHASHSEED':'0','LC_ALL':'C.UTF-8'},capture_output=True,text=True,timeout=20,cwd='/')
receipt={'created_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'command':command,'profile':profile,'python':info,'exit_code':result.returncode,'stdout':result.stdout,'stderr':result.stderr,'maximum_processes':1,'model_runs':0,'complete':False}
if result.returncode==0:
 checks=json.loads(result.stdout);receipt['complete']=all(row.get('denied',row.get('passed',False)) for row in checks.values())
(r/'receipt.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
````

### .build/quantization-research/probe-heldout-sandbox-v2.py

Original bytes: 2154. SHA-256: `03a725a26071685c5f411cf08137e51b103a5e8459628e13efbe82c78f971930`.

Normalized bytes: 2154. SHA-256: `03a725a26071685c5f411cf08137e51b103a5e8459628e13efbe82c78f971930`.

````text
from pathlib import Path
import json,subprocess,sys,hashlib,datetime
r=Path('.build/quantization-research/heldout-sandbox-v2').absolute();r.mkdir(exist_ok=False)
info=json.loads(subprocess.check_output(['.venv/bin/python','-I','-S','-c','import sys,os,json; print(json.dumps({"executable":os.path.realpath(sys.executable),"prefix":sys.base_prefix}))']))
profile='''(version 1)
(deny default)
(allow process-exec (literal %s))
(allow sysctl-read)
(allow file-read* (subpath %s) (subpath "/System/Library") (subpath "/usr/lib") (literal "/dev/urandom") (literal "/private/etc/localtime"))
'''%(json.dumps(info['executable']),json.dumps(str(Path(info['prefix']).resolve())))
(r/'profile.sb').write_text(profile)
(r/'sentinel.txt').write_text('test-owned boundary sentinel\n')
worker='''import os,json,socket,errno,math,random,resource
checks={}
for name,fn in [
 ("outside_read",lambda:open(%s).read()),
 ("file_write",lambda:open(%s,"w").write("unexpected")),
 ("loopback_network",lambda:socket.socket().connect(("127.0.0.1",9))),
 ("process_fork",lambda:os.fork())]:
 try:
  fn();checks[name]={"denied":False}
 except OSError as e: checks[name]={"denied":e.errno in (errno.EPERM,errno.EACCES),"errno":e.errno}
checks["stdlib"]={"passed":math.isqrt(81)==9 and random.Random(7).randrange(100)==41}
print(json.dumps(checks))
'''%(repr(str(r/'sentinel.txt')),repr(str(r/'forbidden-write')))
command=['/usr/bin/sandbox-exec','-f',str(r/'profile.sb'),info['executable'],'-I','-S','-B','-c',worker]
result=subprocess.run(command,env={'PATH':'/usr/bin:/bin','PYTHONHASHSEED':'0','LC_ALL':'C.UTF-8'},capture_output=True,text=True,timeout=20,cwd='/')
receipt={'created_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'command':command,'profile':profile,'python':info,'exit_code':result.returncode,'stdout':result.stdout,'stderr':result.stderr,'maximum_processes':1,'model_runs':0,'complete':False}
if result.returncode==0:
 checks=json.loads(result.stdout);receipt['complete']=all(row.get('denied',row.get('passed',False)) for row in checks.values())
(r/'receipt.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
````

### .build/quantization-research/probe-heldout-sandbox-v3.py

Original bytes: 2223. SHA-256: `00363bf0271c441a019dd47e6c10fff4a396f0850f01ab9282da1cf054ee85df`.

Normalized bytes: 2223. SHA-256: `00363bf0271c441a019dd47e6c10fff4a396f0850f01ab9282da1cf054ee85df`.

````text
from pathlib import Path
import json,subprocess,sys,hashlib,datetime
r=Path('.build/quantization-research/heldout-sandbox-v3').absolute();r.mkdir(exist_ok=False)
info=json.loads(subprocess.check_output(['.venv/bin/python','-I','-S','-c','import sys,os,json; print(json.dumps({"executable":os.path.realpath(sys.executable),"prefix":sys.base_prefix}))']))
profile='''(version 1)
(deny default)
(allow process-exec (literal %s))
(allow sysctl-read)
(allow process-info*)
(allow mach-lookup)
(allow file-read-metadata)
(allow file-read* (subpath %s) (subpath "/System/Library") (subpath "/usr/lib") (literal "/dev/urandom") (literal "/private/etc/localtime"))
'''%(json.dumps(info['executable']),json.dumps(str(Path(info['prefix']).resolve())))
(r/'profile.sb').write_text(profile)
(r/'sentinel.txt').write_text('test-owned boundary sentinel\n')
worker='''import os,json,socket,errno,math,random,resource
checks={}
for name,fn in [
 ("outside_read",lambda:open(%s).read()),
 ("file_write",lambda:open(%s,"w").write("unexpected")),
 ("loopback_network",lambda:socket.socket().connect(("127.0.0.1",9))),
 ("process_fork",lambda:os.fork())]:
 try:
  fn();checks[name]={"denied":False}
 except OSError as e: checks[name]={"denied":e.errno in (errno.EPERM,errno.EACCES),"errno":e.errno}
checks["stdlib"]={"passed":math.isqrt(81)==9 and random.Random(7).randrange(100)==41}
print(json.dumps(checks))
'''%(repr(str(r/'sentinel.txt')),repr(str(r/'forbidden-write')))
command=['/usr/bin/sandbox-exec','-f',str(r/'profile.sb'),info['executable'],'-I','-S','-B','-c',worker]
result=subprocess.run(command,env={'PATH':'/usr/bin:/bin','PYTHONHASHSEED':'0','LC_ALL':'C.UTF-8'},capture_output=True,text=True,timeout=20,cwd='/')
receipt={'created_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'command':command,'profile':profile,'python':info,'exit_code':result.returncode,'stdout':result.stdout,'stderr':result.stderr,'maximum_processes':1,'model_runs':0,'complete':False}
if result.returncode==0:
 checks=json.loads(result.stdout);receipt['complete']=all(row.get('denied',row.get('passed',False)) for row in checks.values())
(r/'receipt.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
````

### .build/quantization-research/probe-heldout-sandbox-v4.py

Original bytes: 2251. SHA-256: `1f8dbb93dc3b0d1fcf5fff0e322028a5f80d762a4afdc4694d5bfb28b434fc46`.

Normalized bytes: 2251. SHA-256: `1f8dbb93dc3b0d1fcf5fff0e322028a5f80d762a4afdc4694d5bfb28b434fc46`.

````text
from pathlib import Path
import json,subprocess,sys,hashlib,datetime
r=Path('.build/quantization-research/heldout-sandbox-v4').absolute();r.mkdir(exist_ok=False)
info=json.loads(subprocess.check_output(['.venv/bin/python','-I','-S','-c','import sys,os,json; print(json.dumps({"executable":os.path.realpath(sys.executable),"prefix":sys.base_prefix}))']))
profile='''(version 1)
(deny default)
(allow process-exec (literal %s))
(allow sysctl-read)
(allow process-info*)
(allow mach-lookup)
(allow file-read-metadata)
(allow file-map-executable)
(allow file-read* (subpath %s) (subpath "/System/Library") (subpath "/usr/lib") (literal "/dev/urandom") (literal "/private/etc/localtime"))
'''%(json.dumps(info['executable']),json.dumps(str(Path(info['prefix']).resolve())))
(r/'profile.sb').write_text(profile)
(r/'sentinel.txt').write_text('test-owned boundary sentinel\n')
worker='''import os,json,socket,errno,math,random,resource
checks={}
for name,fn in [
 ("outside_read",lambda:open(%s).read()),
 ("file_write",lambda:open(%s,"w").write("unexpected")),
 ("loopback_network",lambda:socket.socket().connect(("127.0.0.1",9))),
 ("process_fork",lambda:os.fork())]:
 try:
  fn();checks[name]={"denied":False}
 except OSError as e: checks[name]={"denied":e.errno in (errno.EPERM,errno.EACCES),"errno":e.errno}
checks["stdlib"]={"passed":math.isqrt(81)==9 and random.Random(7).randrange(100)==41}
print(json.dumps(checks))
'''%(repr(str(r/'sentinel.txt')),repr(str(r/'forbidden-write')))
command=['/usr/bin/sandbox-exec','-f',str(r/'profile.sb'),info['executable'],'-I','-S','-B','-c',worker]
result=subprocess.run(command,env={'PATH':'/usr/bin:/bin','PYTHONHASHSEED':'0','LC_ALL':'C.UTF-8'},capture_output=True,text=True,timeout=20,cwd='/')
receipt={'created_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'command':command,'profile':profile,'python':info,'exit_code':result.returncode,'stdout':result.stdout,'stderr':result.stderr,'maximum_processes':1,'model_runs':0,'complete':False}
if result.returncode==0:
 checks=json.loads(result.stdout);receipt['complete']=all(row.get('denied',row.get('passed',False)) for row in checks.values())
(r/'receipt.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
````

### .build/quantization-research/probe-heldout-sandbox-v5.py

Original bytes: 2265. SHA-256: `09f9f15b1e323ba40592da36465f9542e971f4dbed95cd8531b7e23bcf258b56`.

Normalized bytes: 2265. SHA-256: `09f9f15b1e323ba40592da36465f9542e971f4dbed95cd8531b7e23bcf258b56`.

````text
from pathlib import Path
import json,subprocess,sys,hashlib,datetime
r=Path('.build/quantization-research/heldout-sandbox-v5').absolute();r.mkdir(exist_ok=False)
info=json.loads(subprocess.check_output(['.venv/bin/python','-I','-S','-c','import sys,os,json; print(json.dumps({"executable":os.path.realpath(sys.executable),"prefix":sys.base_prefix}))']))
profile='''(version 1)
(deny default)
(import "dyld-support.sb")
(allow file-read-metadata)
(allow file-map-executable)
(allow signal (target self))
(allow process-exec (literal %s))
(allow sysctl-read)
(allow file-read* (subpath %s) (subpath "/System/Library") (subpath "/usr/lib") (literal "/dev/urandom") (literal "/private/etc/localtime"))
'''%(json.dumps(info['executable']),json.dumps(str(Path(info['prefix']).resolve())))
(r/'profile.sb').write_text(profile)
(r/'sentinel.txt').write_text('test-owned boundary sentinel\n')
worker='''import os,json,socket,errno,math,random,resource
checks={}
for name,fn in [
 ("outside_read",lambda:open(%s).read()),
 ("file_write",lambda:open(%s,"w").write("unexpected")),
 ("loopback_network",lambda:socket.socket().connect(("127.0.0.1",9))),
 ("process_fork",lambda:os.fork())]:
 try:
  fn();checks[name]={"denied":False}
 except OSError as e: checks[name]={"denied":e.errno in (errno.EPERM,errno.EACCES),"errno":e.errno}
checks["stdlib"]={"passed":math.isqrt(81)==9 and random.Random(7).randrange(100)==41}
print(json.dumps(checks))
'''%(repr(str(r/'sentinel.txt')),repr(str(r/'forbidden-write')))
command=['/usr/bin/sandbox-exec','-f',str(r/'profile.sb'),info['executable'],'-I','-S','-B','-c',worker]
result=subprocess.run(command,env={'PATH':'/usr/bin:/bin','PYTHONHASHSEED':'0','LC_ALL':'C.UTF-8'},capture_output=True,text=True,timeout=20,cwd='/')
receipt={'created_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'command':command,'profile':profile,'python':info,'exit_code':result.returncode,'stdout':result.stdout,'stderr':result.stderr,'maximum_processes':1,'model_runs':0,'complete':False}
if result.returncode==0:
 checks=json.loads(result.stdout);receipt['complete']=all(row.get('denied',row.get('passed',False)) for row in checks.values())
(r/'receipt.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
````

### .build/quantization-research/prepare-mbpp-repairs-v1.py

Original bytes: 3695. SHA-256: `cae8d147b4b8916b921d305060ecf64be4f0007fb25cfc2cc735178b8d3efd77`.

Normalized bytes: 3695. SHA-256: `cae8d147b4b8916b921d305060ecf64be4f0007fb25cfc2cc735178b8d3efd77`.

````text
from pathlib import Path
import ast,copy,datetime,hashlib,json,sys,time
r=Path('.build/quantization-research');out=r/'heldout-mbpp-instrument-v1';out.mkdir(exist_ok=False)
sys.path.insert(0,str((r/'heldout-code-draft-v1').resolve()));from quantization_code_sandbox import grade
pop=json.loads((r/'heldout-mbpp-syntax-population-v1.json').read_text())['eligible'];source={x['task_id']:x for x in map(json.loads,(r/'heldout-sources-v1/mbpp/mbpp.jsonl').read_text().splitlines())}
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
record={'created_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'scope':'Prospective source-grader and deterministic bug-mutator validation; no sampled held-out tasks or model outputs','source_sha256':sha(r/'heldout-sources-v1/mbpp/mbpp.jsonl'),'grader_sha256':sha(r/'heldout-code-draft-v1/quantization_code_sandbox.py'),'driver_sha256':sha(__file__),'maximum_cases':320,'maximum_mutations_per_case':16,'maximum_total_seconds':600,'maximum_new_artifact_bytes':4_000_000,'model_runs':0,'complete':False,'cases':[]}
save=lambda:(out/'receipt.json').write_text(json.dumps(record,indent=2)+'\n');save();started=time.monotonic()
for row in pop:
 assert time.monotonic()-started<600
 raw=source[row['upstream_id']];entry={'upstream_id':row['upstream_id'],'function':row['function'],'tests':row['tests']};record['cases'].append(entry)
 try: reference=grade(raw['code'],row['function'],row['tests'])
 except (ValueError,SyntaxError) as error:entry['unsupported_fixture']=str(error);save();continue
 entry['reference_result']=reference
 if not reference['passed']:save();continue
 tree=ast.parse(raw['code']);mutations=[]
 for index,node in enumerate(ast.walk(tree)):
  replacement=None
  if isinstance(node,ast.Constant) and type(node.value) is int and abs(node.value)<1_000_000:replacement=ast.Constant(node.value+1)
  elif isinstance(node,ast.Constant) and type(node.value) is bool:replacement=ast.Constant(not node.value)
  elif isinstance(node,ast.Add):replacement=ast.Sub()
  elif isinstance(node,ast.Sub):replacement=ast.Add()
  elif isinstance(node,ast.Lt):replacement=ast.Gt()
  elif isinstance(node,ast.Gt):replacement=ast.Lt()
  elif isinstance(node,ast.Eq):replacement=ast.NotEq()
  elif isinstance(node,ast.NotEq):replacement=ast.Eq()
  if replacement is None:continue
  cloned=copy.deepcopy(tree);target=list(ast.walk(cloned))[index]
  class Change(ast.NodeTransformer):
   def visit(self,n):return ast.copy_location(replacement,n) if n is target else super().visit(n)
  mutations.append((type(node).__name__,ast.unparse(ast.fix_missing_locations(Change().visit(cloned)))))
 # A single wrong return is a fallback mutation, never a generated replacement
 # selected by looking at candidate model answers.
 for index,node in enumerate(ast.walk(tree)):
  if not isinstance(node,ast.Return) or node.value is None:continue
  cloned=copy.deepcopy(tree);target=list(ast.walk(cloned))[index];target.value=ast.Constant(None)
  mutations.append(('wrong-return',ast.unparse(ast.fix_missing_locations(cloned))))
 for kind,code in mutations[:16]:
  observed=grade(code,row['function'],row['tests'])
  if not observed['passed']:
   entry.update(mutation=kind,buggy_code=code,bug_result=observed,reference_code=raw['code'],description=raw['text']);break
 save()
record['complete']=True;record['seconds']=time.monotonic()-started;record['reference_valid']=sum(x.get('reference_result',{}).get('passed',False) for x in record['cases']);record['repair_valid']=sum('buggy_code'in x for x in record['cases']);save();assert (out/'receipt.json').stat().st_size<=4_000_000
print({k:record[k] for k in ['complete','seconds','reference_valid','repair_valid']})
````

### .build/quantization-research/prepare-mbpp-repairs-v2.py

Original bytes: 3669. SHA-256: `9fc44bb3dddff59b6eb3af5199b9958adc52dab6f75ce2edba4ef68f9a364280`.

Normalized bytes: 3669. SHA-256: `9fc44bb3dddff59b6eb3af5199b9958adc52dab6f75ce2edba4ef68f9a364280`.

````text
from pathlib import Path
import ast,copy,datetime,hashlib,json,sys,time
r=Path('.build/quantization-research');out=r/'heldout-mbpp-instrument-v2';out.mkdir(exist_ok=False)
sys.path.insert(0,str(Path('Tools').resolve()));from quantization_code_sandbox import grade
pop=json.loads((r/'heldout-mbpp-syntax-population-v1.json').read_text())['eligible'];source={x['task_id']:x for x in map(json.loads,(r/'heldout-sources-v1/mbpp/mbpp.jsonl').read_text().splitlines())}
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
record={'created_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'scope':'Prospective source-grader and deterministic bug-mutator validation; no sampled held-out tasks or model outputs','source_sha256':sha(r/'heldout-sources-v1/mbpp/mbpp.jsonl'),'grader_sha256':sha(Path('Tools/quantization_code_sandbox.py')),'driver_sha256':sha(__file__),'maximum_cases':320,'maximum_mutations_per_case':16,'maximum_total_seconds':600,'maximum_new_artifact_bytes':4_000_000,'model_runs':0,'complete':False,'cases':[]}
save=lambda:(out/'receipt.json').write_text(json.dumps(record,indent=2)+'\n');save();started=time.monotonic()
for row in pop:
 assert time.monotonic()-started<600
 raw=source[row['upstream_id']];entry={'upstream_id':row['upstream_id'],'function':row['function'],'tests':row['tests']};record['cases'].append(entry)
 try: reference=grade(raw['code'],row['function'],row['tests'])
 except (ValueError,SyntaxError) as error:entry['unsupported_fixture']=str(error);save();continue
 entry['reference_result']=reference
 if not reference['passed']:save();continue
 tree=ast.parse(raw['code']);mutations=[]
 for index,node in enumerate(ast.walk(tree)):
  replacement=None
  if isinstance(node,ast.Constant) and type(node.value) is int and abs(node.value)<1_000_000:replacement=ast.Constant(node.value+1)
  elif isinstance(node,ast.Constant) and type(node.value) is bool:replacement=ast.Constant(not node.value)
  elif isinstance(node,ast.Add):replacement=ast.Sub()
  elif isinstance(node,ast.Sub):replacement=ast.Add()
  elif isinstance(node,ast.Lt):replacement=ast.Gt()
  elif isinstance(node,ast.Gt):replacement=ast.Lt()
  elif isinstance(node,ast.Eq):replacement=ast.NotEq()
  elif isinstance(node,ast.NotEq):replacement=ast.Eq()
  if replacement is None:continue
  cloned=copy.deepcopy(tree);target=list(ast.walk(cloned))[index]
  class Change(ast.NodeTransformer):
   def visit(self,n):return ast.copy_location(replacement,n) if n is target else super().visit(n)
  mutations.append((type(node).__name__,ast.unparse(ast.fix_missing_locations(Change().visit(cloned)))))
 # A single wrong return is a fallback mutation, never a generated replacement
 # selected by looking at candidate model answers.
 for index,node in enumerate(ast.walk(tree)):
  if not isinstance(node,ast.Return) or node.value is None:continue
  cloned=copy.deepcopy(tree);target=list(ast.walk(cloned))[index];target.value=ast.Constant(None)
  mutations.append(('wrong-return',ast.unparse(ast.fix_missing_locations(cloned))))
 for kind,code in mutations[:16]:
  observed=grade(code,row['function'],row['tests'])
  if not observed['passed']:
   entry.update(mutation=kind,buggy_code=code,bug_result=observed,reference_code=raw['code'],description=raw['text']);break
 save()
record['complete']=True;record['seconds']=time.monotonic()-started;record['reference_valid']=sum(x.get('reference_result',{}).get('passed',False) for x in record['cases']);record['repair_valid']=sum('buggy_code'in x for x in record['cases']);save();assert (out/'receipt.json').stat().st_size<=4_000_000
print({k:record[k] for k in ['complete','seconds','reference_valid','repair_valid']})
````

### .build/quantization-research/fetch-heldout-sources-v1.py

Original bytes: 3373. SHA-256: `175882719b1ec635b1a41db4920f90afd8606cade1dc821b91e3644c68d099c4`.

Normalized bytes: 3373. SHA-256: `175882719b1ec635b1a41db4920f90afd8606cade1dc821b91e3644c68d099c4`.

````text
from pathlib import Path
import json,hashlib,urllib.request,datetime
r=Path('.build/quantization-research');out=r/'heldout-sources-v1';out.mkdir(exist_ok=False)
g='e6890f85757dd84e27ca6df2dd30651dafad28e0';m='f46ca8374b4cddef97ca4208ad986049d74d296a';u='3622039cf51f7eeffa58b957332a8e8c337981d7';b='6ea57973c7a6097fd7c5915698c54c17c5b1b6c8'
urls={}
for name in ['README.md','instructions.py','instructions_registry.py','instructions_util.py','evaluation_lib.py','requirements.txt','data/input_data.jsonl']:
 urls['ifeval/'+name]='https://raw.githubusercontent.com/google-research/google-research/'+g+'/instruction_following_eval/'+name
for name in ['README.md','mbpp.jsonl','sanitized-mbpp.json']:
 urls['mbpp/'+name]='https://raw.githubusercontent.com/google-research/google-research/'+m+'/mbpp/'+name
urls['google-LICENSE']='https://raw.githubusercontent.com/google-research/google-research/'+g+'/LICENSE'
for name in ['README.md','LICENSE']+['mgsm_'+lang+'.tsv' for lang in ['en','es','fr','de','ru','zh','ja','th','sw','bn','te']]:
 urls['mgsm/'+name]='https://raw.githubusercontent.com/google-research/url-nlp/'+u+'/mgsm/'+name
for name in ['BFCL_v4_simple_python.json','BFCL_v4_multi_turn_base.json','BFCL_v4_multi_turn_long_context.json','BFCL_v4_multi_turn_miss_func.json','BFCL_v4_multi_turn_miss_param.json','README.md']:
 urls['bfcl/'+name]='https://raw.githubusercontent.com/ShishirPatil/gorilla/'+b+'/berkeley-function-call-leaderboard/bfcl_eval/data/'+name
urls['bfcl/LICENSE']='https://raw.githubusercontent.com/ShishirPatil/gorilla/'+b+'/LICENSE'
urls['mmlu/test.parquet']='https://huggingface.co/datasets/cais/mmlu/resolve/c30699e8356da336a370243923dbaf21066bb9fe/all/test-00000-of-00001.parquet'
urls['mmlu/README.md']='https://huggingface.co/datasets/cais/mmlu/resolve/c30699e8356da336a370243923dbaf21066bb9fe/README.md'
record={'created_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'scope':'Prospective source acquisition and instrument development; no sampled held-out protocol and no model outputs','maximum_file_bytes':4_000_000,'maximum_total_bytes':16_000_000,'maximum_process_bytes':500_000_000,'model_runs':0,'new_weight_bytes':0,'paid_compute_usd':0,'urls':urls,'files':[],'complete':False}
(out/'prospective-budget.json').write_text(json.dumps(record,indent=2)+'\n');total=0
for name,url in urls.items():
 row={'path':name,'url':url}
 try:
  with urllib.request.urlopen(urllib.request.Request(url,headers={'User-Agent':'Slotstream-local-evaluation-research'}),timeout=30) as handle:data=handle.read(4_000_001)
  assert 0<len(data)<=4_000_000
  total+=len(data);assert total<=16_000_000
  target=out/name;target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(data)
  row.update(bytes=len(data),sha256=hashlib.sha256(data).hexdigest())
  if name=='mmlu/test.parquet':assert row['sha256']=='74a41822ce7d3def56e1682f958469c04642a5336a5ce912fa375fdb90fb25d7'
 except Exception as e:row['failure']=type(e).__name__+': '+str(e)
 record['files'].append(row);(out/'receipt.json').write_text(json.dumps(record,indent=2)+'\n')
record['complete']=all('failure' not in x for x in record['files']);record['total_bytes']=total
(out/'receipt.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps({'complete':record['complete'],'total_bytes':total,'failures':[x for x in record['files'] if 'failure'in x]},indent=2))
````

### .build/quantization-research/install-heldout-grader-runtime-v1.py

Original bytes: 3201. SHA-256: `7fad5be3335d66cb02e8b83193d2d9d3e7f75a2dac380cb85593d361500abcef`.

Normalized bytes: 3201. SHA-256: `7fad5be3335d66cb02e8b83193d2d9d3e7f75a2dac380cb85593d361500abcef`.

````text
from pathlib import Path
import ctypes,ctypes.util,hashlib,json,os,shutil,subprocess,sys,time
sys.path.insert(0,'Tools')
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree,vm_snapshot
r=Path('.build/quantization-research').absolute();out=r/'heldout-grader-runtime-v1';protocol=json.loads((out/'budget.json').read_text());pins=dict(protocol['packages']);pins.update({'click':'8.1.8','joblib':'1.4.2','regex':'2024.11.6','tqdm':'4.67.1','six':'1.17.0'})
record={'complete':False,'protocol_sha256':hashlib.sha256((out/'budget.json').read_bytes()).hexdigest(),'pins':pins,'peak_process_tree_bytes':0,'samples':0,'maximum_new_allocated_bytes':300_000_000,'maximum_research_staging_bytes':370_000_000_000,'before':quiet_preflight(4)}
uv=shutil.which('uv');assert uv
command=[uv,'pip','install','--no-cache','--index-url','https://pypi.org/simple','--python',str(Path('.venv/bin/python').absolute()),'--target',str(out/'packages')]+[f'{k}=={v}'for k,v in sorted(pins.items())]
record['command']=command;(out/'prospective-install.json').write_text(json.dumps(record,indent=2)+'\n');assert not (out/'install-receipt.json').exists()
save=lambda:(out/'install-receipt.json').write_text(json.dumps(record,indent=2)+'\n');lib=ctypes.CDLL(ctypes.util.find_library('proc'));child=None;start=time.monotonic();env=dict(os.environ);(out/'tmp').mkdir();env['TMPDIR']=str(out/'tmp')
try:
 with (out/'install.log').open('w') as log:
  child=subprocess.Popen(command,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  while child.poll() is None:
   rows=[tuple(map(int,line.split())) for line in subprocess.check_output(['ps','-axo','pid=,ppid='],text=True).splitlines()];pids={child.pid}
   while True:
    more=pids|{pid for pid,ppid in rows if ppid in pids}
    if more==pids:break
    pids=more
   total=0
   for pid in pids:
    buf=ctypes.create_string_buffer(296)
    if lib.proc_pid_rusage(pid,4,buf)==0:total+=max(int.from_bytes(buf.raw[72:80],'little'),int.from_bytes(buf.raw[240:248],'little'))
   record['peak_process_tree_bytes']=max(total,record['peak_process_tree_bytes']);record['samples']+=1
   assert total<=1_000_000_000,'dependency process budget'
   assert vm_snapshot()['reclaimable_bytes']>=3_000_000_000,'real headroom'
   assert time.monotonic()-start<600,'wall time'
   allocated=sum(p.stat().st_blocks*512 for p in out.rglob('*') if p.is_file());assert allocated<=300_000_000,'dependency disk budget'
   time.sleep(.1)
  record['exit_code']=child.returncode;assert child.returncode==0,'dependency install failed'
 record['allocated_bytes']=sum(p.stat().st_blocks*512 for p in out.rglob('*') if p.is_file());record['research_allocated_bytes']=sum(p.stat().st_blocks*512 for p in r.rglob('*') if p.is_file());assert record['research_allocated_bytes']<=370_000_000_000
 record['complete']=True
except BaseException as error:
 record['failure']=type(error).__name__+': '+str(error)
 if child is not None and child.poll() is None:terminate_child_tree(child)
 save();raise
finally:record['seconds']=time.monotonic()-start;save()
print({k:record[k]for k in ['complete','exit_code','seconds','peak_process_tree_bytes','allocated_bytes']})
````

### .build/quantization-research/verify-heldout-grader-runtime-v2.py

Original bytes: 2271. SHA-256: `1f96e73c9a1d4b8ec90a22cdba90b8a95bb806db62bf4e4eed9911ca6f81a018`.

Normalized bytes: 2271. SHA-256: `1f96e73c9a1d4b8ec90a22cdba90b8a95bb806db62bf4e4eed9911ca6f81a018`.

````text
from pathlib import Path
import base64,csv,datetime,hashlib,importlib.metadata,json,sys
out=Path('.build/quantization-research/heldout-grader-runtime-v1').resolve();packages=out/'packages';pins=json.loads((out/'prospective-install.json').read_text())['pins'];files={};checked=0
for dist in sorted(packages.glob('*.dist-info')):
 for name,encoded,size in csv.reader((dist/'RECORD').open()):
  path=(packages/name).resolve();assert path.is_relative_to(out),'record path outside isolated runtime'
  assert path.is_file() and not path.is_symlink(),'missing dependency file'
  raw=path.read_bytes();digest=hashlib.sha256(raw).digest()
  if size:assert len(raw)==int(size),'dependency size mismatch'
  if encoded:
   kind,value=encoded.split('=',1);assert kind=='sha256';assert base64.urlsafe_b64encode(digest).decode().rstrip('=')==value,'dependency digest mismatch'
  files[str(path.relative_to(out))]={'bytes':len(raw),'sha256':digest.hex()};checked+=1
sys.path.insert(0,str(packages))
for name,version in pins.items():assert importlib.metadata.version(name)==version
import pyarrow.parquet as pq,nltk,langdetect,immutabledict,absl
source=Path('.build/quantization-research/heldout-sources-v1/mmlu/test.parquet');assert hashlib.sha256(source.read_bytes()).hexdigest()=='74a41822ce7d3def56e1682f958469c04642a5336a5ce912fa375fdb90fb25d7'
table=pq.read_table(source,use_threads=False);schema=str(table.schema);assert table.num_rows==14042;assert set(table.column_names)=={'question','subject','choices','answer'}
allocated=sum(p.stat().st_blocks*512 for p in out.rglob('*') if p.is_file());assert allocated<=300_000_000
value={'complete':True,'scope':'Read-only recovery after successful installer log and temporary-directory enumeration race; no reinstallation','created_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'failed_install_receipt_sha256':hashlib.sha256((out/'install-receipt.json').read_bytes()).hexdigest(),'pins':pins,'checked_record_entries':checked,'files':files,'allocated_bytes':allocated,'mmlu_rows':table.num_rows,'mmlu_schema':schema,'model_runs':0}
(out/'verification-receipt-v2.json').write_text(json.dumps(value,indent=2)+'\n');print({k:value[k]for k in ['complete','checked_record_entries','allocated_bytes','mmlu_rows','mmlu_schema']})
````

### .build/quantization-research/prepare-ifeval-grader-v1.py

Original bytes: 2974. SHA-256: `f382276e49f158b858f29d3e000738a9348327b7abe7cbf0d6b4746cfcf34c7e`.

Normalized bytes: 2974. SHA-256: `f382276e49f158b858f29d3e000738a9348327b7abe7cbf0d6b4746cfcf34c7e`.

````text
from pathlib import Path
import datetime,hashlib,io,json,shutil,urllib.request,zipfile
r=Path('.build/quantization-research');out=r/'heldout-ifeval-grader-v1';out.mkdir(exist_ok=False);pkg=out/'instruction_following_eval';pkg.mkdir()
record={'created_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'scope':'Pinned upstream instruction-grader tests and bounded tokenizer data acquisition; no model outputs','maximum_download_bytes':8_000_000,'maximum_extracted_bytes':8_000_000,'files':[],'model_runs':0,'complete':False};(out/'budget.json').write_text(json.dumps(record,indent=2)+'\n');downloaded=0
for p in (r/'heldout-sources-v1/ifeval').glob('*.py'):shutil.copy2(p,pkg/p.name)
def get(url,name,bound):
 global downloaded
 with urllib.request.urlopen(urllib.request.Request(url,headers={'User-Agent':'Slotstream-local-evaluation-research'}),timeout=30) as f:raw=f.read(bound+1)
 assert 0<len(raw)<=bound;downloaded+=len(raw);assert downloaded<=8_000_000
 path=out/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_bytes(raw);record['files'].append({'path':name,'url':url,'bytes':len(raw),'sha256':hashlib.sha256(raw).hexdigest()});return raw
for name in ['instructions_test.py','instructions_util_test.py']:
 get('https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/'+name,'instruction_following_eval/'+name,500_000)
metadata=get('https://api.github.com/repos/nltk/nltk_data/commits?path=packages/tokenizers/punkt_tab.zip&sha=gh-pages&per_page=1','punkt-source-commit.json',500_000);revision=json.loads(metadata)[0]['sha'];record['nltk_data_revision']=revision
raw=get('https://raw.githubusercontent.com/nltk/nltk_data/'+revision+'/packages/tokenizers/punkt_tab.zip','punkt_tab.zip',6_000_000)
get('https://raw.githubusercontent.com/nltk/nltk_data/'+revision+'/packages/tokenizers/punkt_tab.xml','punkt_tab.xml',100_000)
allowed={'punkt_tab/english/abbrev_types.txt','punkt_tab/english/collocations.tab','punkt_tab/english/ortho_context.tab','punkt_tab/english/sent_starters.txt','punkt_tab/README'};extracted=0;seen=set()
with zipfile.ZipFile(io.BytesIO(raw)) as archive:
 for member in archive.infolist():
  if member.filename not in allowed:continue
  assert member.filename not in seen and member.file_size<=8_000_000-extracted;seen.add(member.filename);data=archive.read(member);assert len(data)==member.file_size;extracted+=len(data)
  dest=out/'nltk_data/tokenizers'/member.filename;dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes(data);record['files'].append({'path':str(dest.relative_to(out)),'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest()})
assert seen==allowed
record['complete']=True;record['downloaded_bytes']=downloaded;record['extracted_bytes']=extracted;(out/'receipt.json').write_text(json.dumps(record,indent=2)+'\n');print({k:record[k]for k in ['complete','downloaded_bytes','extracted_bytes','nltk_data_revision']})
````

### .build/quantization-research/check-ifeval-grader-v1.py

Original bytes: 1706. SHA-256: `8d09f877f8ce1365594736029e555a3fb2a7ca61b529c274aab965e22ba41ca4`.

Normalized bytes: 1706. SHA-256: `8d09f877f8ce1365594736029e555a3fb2a7ca61b529c274aab965e22ba41ca4`.

````text
from pathlib import Path
import hashlib,json,os,subprocess,time
r=Path('.build/quantization-research').absolute();out=r/'heldout-ifeval-grader-v1';runtime=r/'heldout-grader-runtime-v1';assert json.loads((runtime/'verification-receipt-v2.json').read_text())['complete'];assert json.loads((out/'receipt.json').read_text())['complete']
record={'complete':False,'scope':'Unmodified pinned upstream grader test suites; no model evaluations','source_receipt_sha256':hashlib.sha256((out/'receipt.json').read_bytes()).hexdigest(),'runtime_receipt_sha256':hashlib.sha256((runtime/'verification-receipt-v2.json').read_bytes()).hexdigest(),'random_seed':0,'langdetect_seed':0,'maximum_suite_seconds':60,'runs':[]};env=dict(os.environ);env['PYTHONHASHSEED']='0'
for name in ['instructions_test','instructions_util_test']:
 source=f'import sys,random,runpy;sys.path[:0]=[{str(runtime/"packages")!r},{str(out)!r}];import nltk,langdetect;nltk.data.path[:]=[{str(out/"nltk_data")!r}];random.seed(0);langdetect.DetectorFactory.seed=0;runpy.run_module("instruction_following_eval.{name}",run_name="__main__")'
 start=time.monotonic()
 with (out/(name+'.log')).open('w') as log:result=subprocess.run([str(Path('.venv/bin/python').absolute()),'-I','-B','-c',source],env=env,stdout=log,stderr=subprocess.STDOUT,timeout=60)
 record['runs'].append({'suite':name,'exit_code':result.returncode,'seconds':time.monotonic()-start,'command_bootstrap':source});(out/'checks-receipt-v1.json').write_text(json.dumps(record,indent=2)+'\n')
 if result.returncode:raise RuntimeError(name+' failed; see preserved upstream log')
record['complete']=True;(out/'checks-receipt-v1.json').write_text(json.dumps(record,indent=2)+'\n');print(record)
````

### .build/quantization-research/check-ifeval-grader-v2.py

Original bytes: 1724. SHA-256: `0439269c20c35d67e61e561eac6b97d3e671756aa7af8b5e60f265f8b2e29df0`.

Normalized bytes: 1724. SHA-256: `0439269c20c35d67e61e561eac6b97d3e671756aa7af8b5e60f265f8b2e29df0`.

````text
from pathlib import Path
import hashlib,json,os,subprocess,time
r=Path('.build/quantization-research').absolute();out=r/'heldout-ifeval-grader-v1';runtime=r/'heldout-grader-runtime-v1';assert json.loads((runtime/'verification-receipt-v2.json').read_text())['complete'];assert json.loads((out/'receipt.json').read_text())['complete']
record={'complete':False,'scope':'Unmodified pinned upstream grader test suites; no model evaluations','source_receipt_sha256':hashlib.sha256((out/'receipt.json').read_bytes()).hexdigest(),'runtime_receipt_sha256':hashlib.sha256((runtime/'verification-receipt-v2.json').read_bytes()).hexdigest(),'random_seed':0,'langdetect_seed':0,'maximum_suite_seconds':60,'runs':[]};env=dict(os.environ);env['PYTHONHASHSEED']='0'
for name in ['instructions_test','instructions_util_test']:
 source=f'import sys,random,runpy;sys.path[:0]=[{str(runtime/"packages")!r},{str(out)!r}];import nltk,langdetect;nltk.data.path[:]=[{str(out/"nltk_data")!r}];random.seed(0);langdetect.DetectorFactory.seed=0;runpy.run_module("instruction_following_eval.{name}",run_name="__main__",alter_sys=True)'
 start=time.monotonic()
 with (out/(name+'-v2.log')).open('w') as log:result=subprocess.run([str(Path('.venv/bin/python').absolute()),'-I','-B','-c',source],env=env,stdout=log,stderr=subprocess.STDOUT,timeout=60)
 record['runs'].append({'suite':name,'exit_code':result.returncode,'seconds':time.monotonic()-start,'command_bootstrap':source});(out/'checks-receipt-v2.json').write_text(json.dumps(record,indent=2)+'\n')
 if result.returncode:raise RuntimeError(name+' failed; see preserved upstream log')
record['complete']=True;(out/'checks-receipt-v2.json').write_text(json.dumps(record,indent=2)+'\n');print(record)
````

### .build/quantization-research/fetch-bfcl-functional-v1.py

Original bytes: 1705. SHA-256: `3638a66a1f1e6bf192f3505efbad4a31710dd8f8b442dca90c310382ec551531`.

Normalized bytes: 1705. SHA-256: `3638a66a1f1e6bf192f3505efbad4a31710dd8f8b442dca90c310382ec551531`.

````text
from pathlib import Path
import ast,datetime,hashlib,json,urllib.request
r=Path('.build/quantization-research');out=r/'heldout-bfcl-source-v1';rev='6ea57973c7a6097fd7c5915698c54c17c5b1b6c8';base='https://raw.githubusercontent.com/ShishirPatil/gorilla/'+rev+'/berkeley-function-call-leaderboard/bfcl_eval/'
files=['gorilla_file_system.py','math_api.py','message_api.py','posting_api.py','ticket_api.py','trading_bot.py','travel_booking.py','vehicle_control.py']
record={'created_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'scope':'Read-only offline tool-fixture source review; no imports, tool calls or model outputs','maximum_total_bytes':4_000_000,'maximum_file_bytes':500_000,'revision':rev,'files':[],'complete':False};(out/'budget.json').write_text(json.dumps(record,indent=2)+'\n');total=0
for path in ['eval_checker/multi_turn_eval/func_source_code/'+name for name in files]+['data/possible_answer/BFCL_v4_multi_turn_base.json']:
 url=base+path
 with urllib.request.urlopen(url,timeout=30) as f:raw=f.read(500_001)
 assert 0<len(raw)<=500_000;total+=len(raw);assert total<=4_000_000
 dest=out/path;dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes(raw);row={'path':path,'url':url,'bytes':len(raw),'sha256':hashlib.sha256(raw).hexdigest()}
 if path.endswith('.py'):
  tree=ast.parse(raw);row['imports']=[ast.unparse(n) for n in ast.walk(tree) if isinstance(n,(ast.Import,ast.ImportFrom))]
 record['files'].append(row)
record['complete']=True;record['total_bytes']=total;(out/'receipt.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps({'complete':True,'total_bytes':total,'imports':{x['path']:x.get('imports',[]) for x in record['files']}},indent=2))
````

### .build/quantization-research/heldout-grader-runtime-driver-v1.log

Original bytes: 2102. SHA-256: `149eefd79df7380c523d0803f43a35e10b7f3507bf3b0315c2207a6b8c2aeb08`.

Normalized bytes: 2081. SHA-256: `d54bc2713a4c0bd4d1fb316adabaf856eaffcb095b9817bf7ae7aab635dcffac`.

````text
Traceback (most recent call last):
  File "<HOME>/Projects/slotstream/.build/quantization-research/install-heldout-grader-runtime-v1.py", line 29, in <module>
    allocated=sum(p.stat().st_blocks*512 for p in out.rglob('*') if p.is_file());assert allocated<=300_000_000,'dependency disk budget'
  File "<HOME>/Projects/slotstream/.build/quantization-research/install-heldout-grader-runtime-v1.py", line 29, in <genexpr>
    allocated=sum(p.stat().st_blocks*512 for p in out.rglob('*') if p.is_file());assert allocated<=300_000_000,'dependency disk budget'
  File "/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/lib/python3.9/pathlib.py", line 1180, in rglob
    for p in selector.select_from(self):
  File "/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/lib/python3.9/pathlib.py", line 600, in _select_from
    for starting_point in self._iterate_directories(parent_path, is_dir, scandir):
  File "/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/lib/python3.9/pathlib.py", line 590, in _iterate_directories
    for p in self._iterate_directories(path, is_dir, scandir):
  File "/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/lib/python3.9/pathlib.py", line 590, in _iterate_directories
    for p in self._iterate_directories(path, is_dir, scandir):
  File "/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/lib/python3.9/pathlib.py", line 590, in _iterate_directories
    for p in self._iterate_directories(path, is_dir, scandir):
  [Previous line repeated 5 more times]
  File "/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/lib/python3.9/pathlib.py", line 579, in _iterate_directories
    with scandir(parent_path) as scandir_it:
FileNotFoundError: [Errno 2] No such file or directory: '<HOME>/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/tmp/.tmpJrVsGf/archive-v0/vkieCedDJ1CrDTp2nD3cO/pyarrow/include/arrow/vendored'
````

### .build/quantization-research/heldout-grader-runtime-verification-v2.log

Original bytes: 329. SHA-256: `bd091cb13221940c61f0f2322bf41b6743b90221528f678d4dd519172a31b575`.

Normalized bytes: 329. SHA-256: `bd091cb13221940c61f0f2322bf41b6743b90221528f678d4dd519172a31b575`.

````text
{'complete': True, 'checked_record_entries': 1524, 'allocated_bytes': 134762496, 'mmlu_rows': 14042, 'mmlu_schema': 'question: string\nsubject: string\nchoices: list<item: string>\n  child 0, item: string\nanswer: int64\n-- schema metadata --\nhuggingface: \'{"info": {"features": {"question": {"dtype": "string", "_ty\' + 216'}
````

### .build/quantization-research/heldout-ifeval-grader-checks-v1.log

Original bytes: 398. SHA-256: `6ca06f450f3def75e31051c32ab9c56cbc295475545d4a35c549340fd9b96bef`.

Normalized bytes: 391. SHA-256: `e82aad9327f012cedde9be788d44b3f33376eb04ec543ea9646d9d4a0a974627`.

````text
Traceback (most recent call last):
  File "<HOME>/Projects/slotstream/.build/quantization-research/check-ifeval-grader-v1.py", line 10, in <module>
    if result.returncode:raise RuntimeError(name+' failed; see preserved upstream log')
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
RuntimeError: instructions_test failed; see preserved upstream log
````

### .build/quantization-research/heldout-ifeval-grader-checks-v2.log

Original bytes: 1637. SHA-256: `6fbc5681c9ffa793bd607a230b7630b5b69cba626897fac16f4e767e47aaba4f`.

Normalized bytes: 1595. SHA-256: `d223a6b19e84664c0ca32d33e5b8eec8123e5435b173970a9bc22d6b759748e0`.

````text
{'complete': True, 'scope': 'Unmodified pinned upstream grader test suites; no model evaluations', 'source_receipt_sha256': '409682bfceee05fe156626fc4a5c44988971a90095e45bea5539b8ac035bfedc', 'runtime_receipt_sha256': 'c870658033b50630a97ea0b235ede503138fc7bf2e9a0a2243c636ab8a668ab2', 'random_seed': 0, 'langdetect_seed': 0, 'maximum_suite_seconds': 60, 'runs': [{'suite': 'instructions_test', 'exit_code': 0, 'seconds': 0.31545895797898993, 'command_bootstrap': 'import sys,random,runpy;sys.path[:0]=[\'<HOME>/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/packages\',\'<HOME>/Projects/slotstream/.build/quantization-research/heldout-ifeval-grader-v1\'];import nltk,langdetect;nltk.data.path[:]=[\'<HOME>/Projects/slotstream/.build/quantization-research/heldout-ifeval-grader-v1/nltk_data\'];random.seed(0);langdetect.DetectorFactory.seed=0;runpy.run_module("instruction_following_eval.instructions_test",run_name="__main__",alter_sys=True)'}, {'suite': 'instructions_util_test', 'exit_code': 0, 'seconds': 0.14997133397264406, 'command_bootstrap': 'import sys,random,runpy;sys.path[:0]=[\'<HOME>/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/packages\',\'<HOME>/Projects/slotstream/.build/quantization-research/heldout-ifeval-grader-v1\'];import nltk,langdetect;nltk.data.path[:]=[\'<HOME>/Projects/slotstream/.build/quantization-research/heldout-ifeval-grader-v1/nltk_data\'];random.seed(0);langdetect.DetectorFactory.seed=0;runpy.run_module("instruction_following_eval.instructions_util_test",run_name="__main__",alter_sys=True)'}]}
````

### .build/quantization-research/heldout-ifeval-grader-prepare-v1.log

Original bytes: 141. SHA-256: `41ca981fefef5b9c93649303f82fe4c4b8628d433bd447cd58052f09d02cf0ca`.

Normalized bytes: 141. SHA-256: `41ca981fefef5b9c93649303f82fe4c4b8628d433bd447cd58052f09d02cf0ca`.

````text
{'complete': True, 'downloaded_bytes': 4375283, 'extracted_bytes': 246331, 'nltk_data_revision': '4f15a3d89eefe9748ec1c05be495d91289197155'}
````

### .build/quantization-research/heldout-source-fetch-v1.log

Original bytes: 67. SHA-256: `34643e099b5edb860ca90d33326abd8f057841987b03d98de266c602bef02475`.

Normalized bytes: 67. SHA-256: `34643e099b5edb860ca90d33326abd8f057841987b03d98de266c602bef02475`.

````text
{
  "complete": true,
  "total_bytes": 7673666,
  "failures": []
}
````

### .build/quantization-research/heldout-bfcl-source-fetch-v1.log

Original bytes: 2515. SHA-256: `e2c59a77f324b72b0bfe218d0228e0a0ea65827721fe357369463566367f6f35`.

Normalized bytes: 2515. SHA-256: `e2c59a77f324b72b0bfe218d0228e0a0ea65827721fe357369463566367f6f35`.

````text
{
  "complete": true,
  "total_bytes": 248691,
  "imports": {
    "eval_checker/multi_turn_eval/func_source_code/gorilla_file_system.py": [
      "import datetime",
      "import subprocess",
      "from copy import deepcopy",
      "from typing import Dict, List, Optional, Union",
      "from bfcl_eval.eval_checker.multi_turn_eval.func_source_code.long_context import FILE_CONTENT_EXTENSION, FILES_TAIL_USED, POPULATE_FILE_EXTENSION"
    ],
    "eval_checker/multi_turn_eval/func_source_code/math_api.py": [
      "import math",
      "from decimal import Decimal, InvalidOperation, getcontext",
      "from typing import Dict, List, Optional, Union",
      "import mpmath"
    ],
    "eval_checker/multi_turn_eval/func_source_code/message_api.py": [
      "import random",
      "from copy import deepcopy",
      "from typing import Dict, List, Optional, Union"
    ],
    "eval_checker/multi_turn_eval/func_source_code/posting_api.py": [
      "from copy import deepcopy",
      "from typing import Dict, List, Optional, Union"
    ],
    "eval_checker/multi_turn_eval/func_source_code/ticket_api.py": [
      "from copy import deepcopy",
      "from typing import Dict, List, Optional, Union"
    ],
    "eval_checker/multi_turn_eval/func_source_code/trading_bot.py": [
      "import random",
      "from copy import deepcopy",
      "from datetime import datetime, time, timedelta",
      "from typing import Dict, List, Optional, Union",
      "from bfcl_eval.eval_checker.multi_turn_eval.func_source_code.long_context import AUTOMOBILE_EXTENSION, MA_5_EXTENSION, MA_20_EXTENSION, ORDER_DETAIL_EXTENSION, TECHNOLOGY_EXTENSION, TRANSACTION_HISTORY_EXTENSION, WATCH_LIST_EXTENSION"
    ],
    "eval_checker/multi_turn_eval/func_source_code/travel_booking.py": [
      "import random",
      "from copy import deepcopy",
      "from datetime import datetime",
      "from typing import Dict, List, Optional, Tuple, Union",
      "from bfcl_eval.eval_checker.multi_turn_eval.func_source_code.long_context import BOOKING_RECORD_EXTENSION, CREDIT_CARD_EXTENSION"
    ],
    "eval_checker/multi_turn_eval/func_source_code/vehicle_control.py": [
      "import random",
      "from copy import deepcopy",
      "from typing import Dict, List, Union",
      "from bfcl_eval.eval_checker.multi_turn_eval.func_source_code.long_context import CAR_STATUS_METADATA_EXTENSION, INTERMEDIARY_CITIES, LONG_WEATHER_EXTENSION, PARKING_BRAKE_INSTRUCTION"
    ],
    "data/possible_answer/BFCL_v4_multi_turn_base.json": []
  }
}
````

### .build/quantization-research/heldout-sandbox-v1/profile.sb

Original bytes: 343. SHA-256: `b5362eef489d92672a6ed3d9cb2a6fd4ee87227953d5288ce80246b131aec78b`.

Normalized bytes: 329. SHA-256: `8632199cd0b1122b08ae7f831829127c610b1248ec5c4ab49265f300960d0d00`.

````text
(version 1)
(deny default)
(allow process-exec (literal "<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12"))
(allow sysctl-read)
(allow file-read* (subpath "<HOME>/.pyenv/versions/3.12.9") (subpath "/System/Library") (subpath "/usr/lib") (literal "/dev/urandom") (literal "/private/etc/localtime"))
````

### .build/quantization-research/heldout-sandbox-v1/receipt.json

Original bytes: 1792. SHA-256: `4897a7bb32bab1978a39857f1f63839f4c08d5647bbfcabd3510669043a4adb4`.

Normalized bytes: 1736. SHA-256: `0a687604debc45678423be8ba26b41dc196eea816afc630e2c9fbae72ed7ccf1`.

````text
{
  "created_at": "2026-10-04T09:37:29.824622+00:00",
  "command": [
    "/usr/bin/sandbox-exec",
    "-f",
    "<HOME>/Projects/slotstream/.build/quantization-research/heldout-sandbox-v1/profile.sb",
    "<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
    "-I",
    "-S",
    "-B",
    "-c",
    "import os,json,socket,errno,math,random,resource\nchecks={}\nfor name,fn in [\n (\"outside_read\",lambda:open('<HOME>/Projects/slotstream/.build/quantization-research/heldout-sandbox-v1/sentinel.txt').read()),\n (\"file_write\",lambda:open('<HOME>/Projects/slotstream/.build/quantization-research/heldout-sandbox-v1/forbidden-write',\"w\").write(\"unexpected\")),\n (\"loopback_network\",lambda:socket.socket().connect((\"127.0.0.1\",9))),\n (\"process_fork\",lambda:os.fork())]:\n try:\n  fn();checks[name]={\"denied\":False}\n except OSError as e: checks[name]={\"denied\":e.errno in (errno.EPERM,errno.EACCES),\"errno\":e.errno}\nchecks[\"stdlib\"]={\"passed\":math.isqrt(81)==9 and random.Random(7).randrange(100)==41}\nprint(json.dumps(checks))\n"
  ],
  "profile": "(version 1)\n(deny default)\n(allow process-exec (literal \"<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12\"))\n(allow sysctl-read)\n(allow file-read* (subpath \"<HOME>/.pyenv/versions/3.12.9\") (subpath \"/System/Library\") (subpath \"/usr/lib\") (literal \"/dev/urandom\") (literal \"/private/etc/localtime\"))\n",
  "python": {
    "executable": "<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
    "prefix": "<HOME>/.pyenv/versions/3.12.9"
  },
  "exit_code": -6,
  "stdout": "",
  "stderr": "",
  "maximum_processes": 1,
  "model_runs": 0,
  "complete": false
}
````

### .build/quantization-research/heldout-sandbox-v2/profile.sb

Original bytes: 377. SHA-256: `0835d504a86e2138f2c4747b60354a712f2fd8672c94e9da992d2577f158c697`.

Normalized bytes: 363. SHA-256: `e5c34668d3d0840c28c494fe91d93296fa946250b2361d9fc02f66bf482efd20`.

````text
(version 1)
(deny default)
(allow process-exec (literal "<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12"))
(allow sysctl-read)
(allow file-read* (subpath "<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none") (subpath "/System/Library") (subpath "/usr/lib") (literal "/dev/urandom") (literal "/private/etc/localtime"))
````

### .build/quantization-research/heldout-sandbox-v2/receipt.json

Original bytes: 1826. SHA-256: `9acb0251b6add261a3bccc84111dc90451bae6f433105421cc05b93bae0b3945`.

Normalized bytes: 1770. SHA-256: `84a8740ecaab8d9f016429235b3f3bce1e8f8ea3fa6a1caf0a3a7c94f39c43e3`.

````text
{
  "created_at": "2026-10-04T09:37:43.807418+00:00",
  "command": [
    "/usr/bin/sandbox-exec",
    "-f",
    "<HOME>/Projects/slotstream/.build/quantization-research/heldout-sandbox-v2/profile.sb",
    "<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
    "-I",
    "-S",
    "-B",
    "-c",
    "import os,json,socket,errno,math,random,resource\nchecks={}\nfor name,fn in [\n (\"outside_read\",lambda:open('<HOME>/Projects/slotstream/.build/quantization-research/heldout-sandbox-v2/sentinel.txt').read()),\n (\"file_write\",lambda:open('<HOME>/Projects/slotstream/.build/quantization-research/heldout-sandbox-v2/forbidden-write',\"w\").write(\"unexpected\")),\n (\"loopback_network\",lambda:socket.socket().connect((\"127.0.0.1\",9))),\n (\"process_fork\",lambda:os.fork())]:\n try:\n  fn();checks[name]={\"denied\":False}\n except OSError as e: checks[name]={\"denied\":e.errno in (errno.EPERM,errno.EACCES),\"errno\":e.errno}\nchecks[\"stdlib\"]={\"passed\":math.isqrt(81)==9 and random.Random(7).randrange(100)==41}\nprint(json.dumps(checks))\n"
  ],
  "profile": "(version 1)\n(deny default)\n(allow process-exec (literal \"<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12\"))\n(allow sysctl-read)\n(allow file-read* (subpath \"<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none\") (subpath \"/System/Library\") (subpath \"/usr/lib\") (literal \"/dev/urandom\") (literal \"/private/etc/localtime\"))\n",
  "python": {
    "executable": "<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
    "prefix": "<HOME>/.pyenv/versions/3.12.9"
  },
  "exit_code": -6,
  "stdout": "",
  "stderr": "",
  "maximum_processes": 1,
  "model_runs": 0,
  "complete": false
}
````

### .build/quantization-research/heldout-sandbox-v3/profile.sb

Original bytes: 446. SHA-256: `c4a29c674f734a409b303ff5c755990ed8c7ca463625f162db8eb2fa149968d3`.

Normalized bytes: 432. SHA-256: `21164e28d85c1232d1848754f87066724a406dda7dd2690f3152638b33149abd`.

````text
(version 1)
(deny default)
(allow process-exec (literal "<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12"))
(allow sysctl-read)
(allow process-info*)
(allow mach-lookup)
(allow file-read-metadata)
(allow file-read* (subpath "<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none") (subpath "/System/Library") (subpath "/usr/lib") (literal "/dev/urandom") (literal "/private/etc/localtime"))
````

### .build/quantization-research/heldout-sandbox-v3/receipt.json

Original bytes: 1898. SHA-256: `08f716391536580ca63ca51f5a9cae85fa1480f1c1dcc71264257e8f3140aed8`.

Normalized bytes: 1842. SHA-256: `a57689f8f9390605c9994cf1e871918233d51cbd9db98760cb28391daddefeaf`.

````text
{
  "created_at": "2026-10-04T09:38:08.532111+00:00",
  "command": [
    "/usr/bin/sandbox-exec",
    "-f",
    "<HOME>/Projects/slotstream/.build/quantization-research/heldout-sandbox-v3/profile.sb",
    "<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
    "-I",
    "-S",
    "-B",
    "-c",
    "import os,json,socket,errno,math,random,resource\nchecks={}\nfor name,fn in [\n (\"outside_read\",lambda:open('<HOME>/Projects/slotstream/.build/quantization-research/heldout-sandbox-v3/sentinel.txt').read()),\n (\"file_write\",lambda:open('<HOME>/Projects/slotstream/.build/quantization-research/heldout-sandbox-v3/forbidden-write',\"w\").write(\"unexpected\")),\n (\"loopback_network\",lambda:socket.socket().connect((\"127.0.0.1\",9))),\n (\"process_fork\",lambda:os.fork())]:\n try:\n  fn();checks[name]={\"denied\":False}\n except OSError as e: checks[name]={\"denied\":e.errno in (errno.EPERM,errno.EACCES),\"errno\":e.errno}\nchecks[\"stdlib\"]={\"passed\":math.isqrt(81)==9 and random.Random(7).randrange(100)==41}\nprint(json.dumps(checks))\n"
  ],
  "profile": "(version 1)\n(deny default)\n(allow process-exec (literal \"<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12\"))\n(allow sysctl-read)\n(allow process-info*)\n(allow mach-lookup)\n(allow file-read-metadata)\n(allow file-read* (subpath \"<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none\") (subpath \"/System/Library\") (subpath \"/usr/lib\") (literal \"/dev/urandom\") (literal \"/private/etc/localtime\"))\n",
  "python": {
    "executable": "<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
    "prefix": "<HOME>/.pyenv/versions/3.12.9"
  },
  "exit_code": -6,
  "stdout": "",
  "stderr": "",
  "maximum_processes": 1,
  "model_runs": 0,
  "complete": false
}
````

### .build/quantization-research/heldout-sandbox-v4/profile.sb

Original bytes: 474. SHA-256: `6e440373acc3b0eeb7c6a307afee0b34a3f622c984cd92d9f148fb76f826c555`.

Normalized bytes: 460. SHA-256: `41f59875b96e1bf8d868cd554280ced6d9c0705f92cb83e6cad7c75f1c8aaadc`.

````text
(version 1)
(deny default)
(allow process-exec (literal "<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12"))
(allow sysctl-read)
(allow process-info*)
(allow mach-lookup)
(allow file-read-metadata)
(allow file-map-executable)
(allow file-read* (subpath "<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none") (subpath "/System/Library") (subpath "/usr/lib") (literal "/dev/urandom") (literal "/private/etc/localtime"))
````

### .build/quantization-research/heldout-sandbox-v4/receipt.json

Original bytes: 1927. SHA-256: `3710b0d50297254fcaa90e9590081d291f0da1cd69f0e1b49fad537207262b4e`.

Normalized bytes: 1871. SHA-256: `848d0b6d5dfc80ef4a94257817b9da7138adfc1209ab7191b98feb037f2df7f9`.

````text
{
  "created_at": "2026-10-04T09:38:28.823917+00:00",
  "command": [
    "/usr/bin/sandbox-exec",
    "-f",
    "<HOME>/Projects/slotstream/.build/quantization-research/heldout-sandbox-v4/profile.sb",
    "<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
    "-I",
    "-S",
    "-B",
    "-c",
    "import os,json,socket,errno,math,random,resource\nchecks={}\nfor name,fn in [\n (\"outside_read\",lambda:open('<HOME>/Projects/slotstream/.build/quantization-research/heldout-sandbox-v4/sentinel.txt').read()),\n (\"file_write\",lambda:open('<HOME>/Projects/slotstream/.build/quantization-research/heldout-sandbox-v4/forbidden-write',\"w\").write(\"unexpected\")),\n (\"loopback_network\",lambda:socket.socket().connect((\"127.0.0.1\",9))),\n (\"process_fork\",lambda:os.fork())]:\n try:\n  fn();checks[name]={\"denied\":False}\n except OSError as e: checks[name]={\"denied\":e.errno in (errno.EPERM,errno.EACCES),\"errno\":e.errno}\nchecks[\"stdlib\"]={\"passed\":math.isqrt(81)==9 and random.Random(7).randrange(100)==41}\nprint(json.dumps(checks))\n"
  ],
  "profile": "(version 1)\n(deny default)\n(allow process-exec (literal \"<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12\"))\n(allow sysctl-read)\n(allow process-info*)\n(allow mach-lookup)\n(allow file-read-metadata)\n(allow file-map-executable)\n(allow file-read* (subpath \"<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none\") (subpath \"/System/Library\") (subpath \"/usr/lib\") (literal \"/dev/urandom\") (literal \"/private/etc/localtime\"))\n",
  "python": {
    "executable": "<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
    "prefix": "<HOME>/.pyenv/versions/3.12.9"
  },
  "exit_code": -6,
  "stdout": "",
  "stderr": "",
  "maximum_processes": 1,
  "model_runs": 0,
  "complete": false
}
````

### .build/quantization-research/heldout-sandbox-v5/profile.sb

Original bytes: 488. SHA-256: `1b4d36e26ce6fb02225f95678900d7f633c18fbe602105f87d123fb7ed5db87e`.

Normalized bytes: 474. SHA-256: `0e0855e10c73db07f49df7e4604acf8fb6d4b79cfac3cc313e719495299edfe3`.

````text
(version 1)
(deny default)
(import "dyld-support.sb")
(allow file-read-metadata)
(allow file-map-executable)
(allow signal (target self))
(allow process-exec (literal "<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12"))
(allow sysctl-read)
(allow file-read* (subpath "<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none") (subpath "/System/Library") (subpath "/usr/lib") (literal "/dev/urandom") (literal "/private/etc/localtime"))
````

### .build/quantization-research/heldout-sandbox-v5/receipt.json

Original bytes: 2185. SHA-256: `4e65b58ad9a0cbc2398ed45dfec287bf7dce2bc76413c5b732a28f354f6977e5`.

Normalized bytes: 2129. SHA-256: `b1c8f41770cf1e950d3f6b2c622b1fbd16e5e28e5d7d3013d1e5d32f74712b8b`.

````text
{
  "created_at": "2026-10-04T09:38:49.269703+00:00",
  "command": [
    "/usr/bin/sandbox-exec",
    "-f",
    "<HOME>/Projects/slotstream/.build/quantization-research/heldout-sandbox-v5/profile.sb",
    "<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
    "-I",
    "-S",
    "-B",
    "-c",
    "import os,json,socket,errno,math,random,resource\nchecks={}\nfor name,fn in [\n (\"outside_read\",lambda:open('<HOME>/Projects/slotstream/.build/quantization-research/heldout-sandbox-v5/sentinel.txt').read()),\n (\"file_write\",lambda:open('<HOME>/Projects/slotstream/.build/quantization-research/heldout-sandbox-v5/forbidden-write',\"w\").write(\"unexpected\")),\n (\"loopback_network\",lambda:socket.socket().connect((\"127.0.0.1\",9))),\n (\"process_fork\",lambda:os.fork())]:\n try:\n  fn();checks[name]={\"denied\":False}\n except OSError as e: checks[name]={\"denied\":e.errno in (errno.EPERM,errno.EACCES),\"errno\":e.errno}\nchecks[\"stdlib\"]={\"passed\":math.isqrt(81)==9 and random.Random(7).randrange(100)==41}\nprint(json.dumps(checks))\n"
  ],
  "profile": "(version 1)\n(deny default)\n(import \"dyld-support.sb\")\n(allow file-read-metadata)\n(allow file-map-executable)\n(allow signal (target self))\n(allow process-exec (literal \"<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12\"))\n(allow sysctl-read)\n(allow file-read* (subpath \"<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none\") (subpath \"/System/Library\") (subpath \"/usr/lib\") (literal \"/dev/urandom\") (literal \"/private/etc/localtime\"))\n",
  "python": {
    "executable": "<HOME>/.local/share/uv/python/cpython-3.12.9-macos-aarch64-none/bin/python3.12",
    "prefix": "<HOME>/.pyenv/versions/3.12.9"
  },
  "exit_code": 0,
  "stdout": "{\"outside_read\": {\"denied\": true, \"errno\": 1}, \"file_write\": {\"denied\": true, \"errno\": 1}, \"loopback_network\": {\"denied\": true, \"errno\": 1}, \"process_fork\": {\"denied\": true, \"errno\": 1}, \"stdlib\": {\"passed\": true}}\n",
  "stderr": "",
  "maximum_processes": 1,
  "model_runs": 0,
  "complete": true
}
````

### .build/quantization-research/heldout-mbpp-instrument-v1/receipt.json

Original bytes: 759234. SHA-256: `0e09fe729e93c4ab2edf96b3b5ed1f0bf8d7af6b215112decdb3380c53510d69`.

Normalized bytes: 759234. SHA-256: `0e09fe729e93c4ab2edf96b3b5ed1f0bf8d7af6b215112decdb3380c53510d69`.

````zlib-base64
eNrsfetzG8eV7/f9K2ZdlSIokXK/H4rpKmc3m711Eye12d37gWax+ikiwoMegJaUVP73e7pnAAyA
IYghRw+LQ1skMNPTfbqBc/rX5/mPfymKb1wZzDL4a7P85nXxDUFEnGN0jth/I/2a09eMvkKEc6xf
IvQaoW/O0jMLN78NqflfyvniNrjl+JdQLOZ3pQvnb0rjQ1mYmS98WIZyOp6NF8uxK+zdm/Pp3dIs
52Xxi5mMvVmO57PfFrN5sTDT20nwxU2Y+PP53bJYmsXbRQENp3MfJgVcur1bLurB8zjXixtDuEhE
OBcFc8EE7ThD1EaODGLMWeE54jZ6YogWNASuKFXWEKGiF9wGYzUxOlbdVnQ3ukU2SuSRdjLGSLjl
PiIjhXDURY5xQFZzRrznimvvEMFSRE6FsZFxJDyruvUlrE2zW2eC8phJy6zSWAAJ2FMET6CQ5mED
iwghGS3hLjrinKQcS2WVpyF6Katup+b9eHo3vXZmERbQLSVo63peaFjexfUtjJ5aQSMsttos50sz
uV4EN5/51IdA233MwrtrUy7H0bjltf2wzAMxlH+qhunDuS7vZulGdcnN0ye5TKMty7tQXatpvIQ3
RfGP/Bsu390ulvDdm16PfaINn61uxLuZS7Sn1SrDdP5LuP6zc9+s7wMhy01/zT7zbVO+uZuG2RKm
/mF5k7u5bNyHFifwPZvMT9Y9ri5PTr5pXLlq3v4GvrF3YdNj6mPeaP7Ps0cTY6zzZp8Y04UY6KIf
Yv7yn3/ZJ+UvXUj5zyYh/7LzCHyeMZRhBvxbhsXdJMmcDYnf3JrFIvjGd+feT3x7Zvc/mu+NZyA9
ruFbdWNmb9aNGm3+efar6/hfWj6OPRm29en/fGdmy/Hfs1i4dsC61wsQ0nb+/tXth97kXftoWZyv
hkHEasu404Z55gQPXEiuWeREUWIc1pqqiKKK0iUpzmBobaIBAQlSEtMDw4xnv8C3e15+qIcyERGC
ovQeiJeKRqAdoeBJRLAZcMYDSF7rFQdJKzxlXhipFUFOh8iks60c9U29ate35TyOJ82NKHpEnKHI
eA0S3WPkhGNSwr9AqReYOOUMiHRuYCsK3mmLleIRxibKxEBX461H+2YlxlPvv/95IwJhL33zIX+I
6Y4PsdgIytHirHA3p69/mqWmETbRcTGeFWX6Jo0mYTZanK5upp9xLBaX46viXy/gqcb19LMoLuAm
eg23X6ZW8Bu/vtpuY0GGvz0wVnFe4LPiPP/7SOOWYXlXzorF1vocFjDRTBaPlTA7z/YoCb60ngch
8wUKGaAPsegVcchS5TWBJQrKwiWtCbMeBnOCIckNiCPsjZGeeak8klQg0yJkNnvyvQIlyZPip/Kg
SFnfr7l7lNn74qLYeniHxYvXxTaT7zWs+Lx8SMKcp/9hnE9BxUreFBuB48PClePblaz+f+V4GQpT
VLioWCHaYjmv17WI43KxzKekiYEXc+fuyvwhFPMID76BU8MMaDYlgG84TsVyPi2WN3DKWpbj2ZtX
1adYf4b3QWrSCqkX83J5PTXQz/seMfXlJUh4clbQq7PiEv6ys4Knl3A1/X91dTyEvFw/VD2/2+tV
H0h3i97zquvzFcXn3Ulu76IxgZ6o5meFOit06lnkEVdLA+OwbiSvHtruajXA1QDjBxj/LHdYoxwN
wlBDhDQIKYS5EUimeaGgnIiEOiYwrC9jDBPCUNRRCoyjJYJ7cxjGvyvnszfn1RZyCNA3xPToTyvg
XHFb2rTgbvCjP50Vb8OHi8Xd9HRra/pxPgsDGh7Q8NfPq5ZJGhVRJK0R99pa5DADBlVUApMiZiPn
QQca4Qaj3iITsbZBaW21R8ei4V1uLB/mx22wWPPfQ4CxiRRTn2soWI2doK9ZuDDzAAKLeZk17c7B
i/QenskQ8W6aQOR4uSjK+bvFcViRtWLFOJ756/+dTwCW9IgVMdpVMardC+J4IAPytw9oRXdJIPsX
jqZJ9EERfpAifDxFeIBzA5x7ngoT2AlkUJhoL73jBpOAHUNAvkIyCC259MZFTwNXjEVsNFAhKKMC
aS4UOwzn/m0+WyxhtoegXEOKjiZnhT0rbjaALu8Ok+JFYeHfTfFtQQfgNgC3r54rifRwkPKBcQUn
LZggXJdKKxUCwUJZbznFHNgUSUa1QF5LB+cvLSi0MO5o4LbNe/bs5rTYqAFr7huN1vx3CgxITh+l
2EsjZfz1Sx6t0uMBaINv5d3ElMVtOV5MjwNjsl1xBx9gGZJBfzxNnhX9IrKjkUQ/cIt3AHi9DMg6
YCUxgKUBLD1PsUwRvNIwN0SpoNgiaQkOLFArETNWcJg8BjoMYCpYOCfhoO2kMoCpgjXx6WBpV8qN
zAorrS/BeZuDsDZbQrxFLA7waYBPXymfhqAJI8wIzIxygTjngtZaAVNirCwBACWVVwEQVYiGIEGU
8VQpLhnHzMmj9V5t3JjR0/rSBXthqkv3c+IR2q41fNqweUZQFQXH4SbdipsSV1/7u9vJ2Jlln3qs
lW2vtkseDzD+I/FhL/bAJgWsAwX/DTzeFwEVDRUZNSXdlmOHmAFxDYjr+UhyYTGKQXCnNObKc+sU
YhHmhAJTaYKSEOk4dVipSJXBHnEppHXMSMOiO4y4fpwvD/sNbgvHkSlL82F2N12sQFd6fb0I2cYR
lo372/qrMGvcSu426crq2dMBkg2Q7KtnZO6tcdEEi1x02HCg2ikekPOBG1gzjawNzFmimWE6CqkN
p8o6jBmTQptjIdkBji0f4Nl0c0f3tcO5/7rDuRUhnXHcu5sAUK5cWy/zCNkoOVuGN6FcFG4+W5rx
bFGY2YdiPZsiTEICHEfBvSrkZQ/ujRfX7+ZzbyaTHqEeVfTTgyvC2WfAlAShx486YLcBuz0fkW+t
t1hhjCmPAknmvRABcQBrXFMtnZFOBcsIVSwIRY0JMFFDqVXaBjimP11bthF2o/cryDaOxfviNwVJ
MAw1IitqiZ9ZttESWuH9VkmGVRehBfx7WeBaCwdv65fvbmA52seqHvq2IJtL6cHbTT/1+Lfpyfc7
8R97NDRJ/9WDyUGuDHLlAe1edATOhZRT76IV3kqDYWAmMRz8DMgRE0CMcB1ERIyYJF+4JNYKpIwF
io6FktvSI0PDn5YpaGLD0+vLPy235EejaRIg+80y8+ZLawFSN0mCAFUvKwnSPlx+7FuyersRH/WF
NHglPRoPtQzfLjuOQLLuJri3SUYlrWSFYwEXW4C140WR1s3CwqUg9dn8SMDaHuM8BQE2vp2ExfU8
XsMIPcJWtusx1gHFXtKzQpwV+qzApJfghT33tQ424BSWgFEvZOgn+PXVMSgix0hglJbmLPlOptD6
AqshZmLYsZ7njqVCcqAzkgskJEpedhY5xAmRFraloJxyEtEoMBdUCkYZoghFC+8EbFpWHkbCP3h/
CATvCtDR9KyYrdDw7k3YRibjxXJURRDOzorRNAUQnhYvill6bEexmZrudjHoMwd95jPQZ2LgYh4E
p8RZIQRTGsHaUBdM4lkH51dqvaBWcIKwhiVlkQQmrKYMltMeC0JbuHfWCNXdvb3DvqPpS3z6ouLc
Pd3mA8x7rDZzusJ98wa16c3sONhH7o+tyGHAH9843dEgy3q2TXcY+hz3a5aubNLJPn01BEsMOG4Q
+g9llwgScBwMaqNnsISA6ogS0cAacWqkk8E5gaIwTBOldbDWS6kUgoE9CbGnYIkdsTjasUg3jFs1
XJvNN63hzjm5N19E7monEU26ltJEjGer3tsVknW7zb0AYGenad3BK+P9qG6/DSmbpH4iIPnR+P4L
U5IOEuUL1GUKHAKGESRi2vLIPLZwGKTI4AiHRMMMd7BaQWMmDdJRR4YDY17C0gqpYqdAj3vkRtku
Ocp22VFpGMsHJUij1QE5Uh6UJOWuLCmPkCaNgQ/KlC5el1U+mj1DfA44vs+Ifxz6pe1KzzrJ5F97
1XduZXVJoPesEDkJS1LV4azJhHdyP8XJQ4iQ0n7St6CtzDaJ2PSyQqidMs6IPumhm0Q1mTSdFyiT
VjVAmyQxqguVWA9Ietj3nuW+R71hxDIkYDoMpgPdCI6MgHnBajmHkTVGcIokZTF4p5xP6wz0keTJ
b56OpBsidpRUIev0i+lG3uhyKt/NPpfTS+SWDUy7yCrThtE+tfyQWu5a7VPLlxfFh83VeiD4M4Kb
Z/n9NhhOVwZt6qBN/erFAVaICEopkKy51pJE7TRzwZtICfXBCqGUoV5ZTQmPIlKttEDMW86FRkfD
4Bam36hSt/m+bOX8rdSHFfOjrWsN/t/Pp3g3TRKgetO8uSMJsiAoWtxRc7snRV/XC7DKglPj2Kyu
TROsAG1+VV85Esa2J8ix45kpP1wvAX8HN56aSa9B2egTq2wxwl1SyvSiqsVpUNRlWHQQVN7NFne3
tzkdExwH38O3KvMGHJ5COXbwiS9DaSZFeO9C8IucJcnO72b+qC8Bv1+T/5dy7u/csmcN/uo4s+uz
wD71SWGtTc/Hlyd4coge9furE94TyMFb2QUee0T5FSvncqvhlPJsc10qpKO3JvkkOyuJlEn3Bt96
BYNIhTmsFzdOqKgCitF7bbm1DsgLVOJNNuljpKdolZ7Zze767fVqp+5Tgo6S7fP0rBhVNtD1y8al
9bvTpwjZ3uJpR/KsSP8nmvLfPark56BKnxU6kaSzQ2B+9xTChrCRQTX0jE0iFimpTArlDYqTaHz0
SGhvVfKY80Qra61BGASzlg4ooNS6gDwxlAuv/dNVQ7syd5SDCtNp6Kz4v41kw3Bka4SLpJPf8u42
HaHW7V9vHwyhw3z77nZHOTTOR7EUX/h/d+60DrXJmjpohwaB8LULBJ1SEgMKE8FFCcd+r4yMVElY
SaK5N9pSE4SJQRrkA00xxopbzWDBLZMbI8tDyqGH2L7O4pJ4cRU/cR/XN5RHTZ5fq3y2+L1shpdt
OL2ZNGYEN06Lp8ZnAA0waNbu3JhFkeIz3q5VQMfpedR9ep75dGwm1/82DzH2CFH5E6IRcE+J8R4f
I8I+Uubl4+2yA4gc9oxnuWdIKzEWEYg1AsbTDJZJKxS989RTRSyzwRlrmZNSOs25wlh7ZgmjQin1
QMTFHw7Cx21pmIIo3jaCj98W3xWz/Yhi1GiQQv1S5Fx+1dIWb6HA3eGqknJvq7CNl/fdHqI0Brvi
M0hBIILFEUlGKAfOh8EMIEaJJKUGwxwwMVwyhJkIEYegFEvA0XIdHDeI42Oh4x7Lv20YFjNPf1/M
ii2L4JrvG60uLtZ8v9N6zfq7JsHdkc/x2dvzVsZPd56Qu3nVXeHm59Df2I2PzkTTnnjwTVhe/9n7
VEOvLu72UeI7Ni+eopLD/ZqJ1qTRpxDVj9ddRQtf2YuqGF7aeM1yeMhucY0OOJgPMHSAoc9y/2GY
Ex4w0ZQTwgKgTM04CximgaIl0SFDvBQp443VijNkBUyYBq8Dh+mHp+sy96VsSmh2ltyVrxfjv4d7
KiGj/Rbpx83vZst9h7e/PfhgvcPBrbrgaHr1t6sWZWc1xMuLnUw41eWUCONft3PpNPbCqvet7fEc
Dzh3wLlfvZxx8KOJhYGQpZYzijQx2GIrjdE+2JRWS3s49GLvpDPUMIIRyB5muDIkHu0/d4802XB8
w2dtT6I0WjWR7UqmoF03ur8d8fB9cmWv0Xqklxd4z/8uJcvZFjAtw2wJmTbvvKaseYRr3iqmpCp2
nCvYed+IrV6Op+E4LS1tDyqpffCu/3t+/bvsmPeZSqRg1I9qFn9i+E46zvFjuE7Bh7yode7JLS/4
zXcpvA/uLr+KBqSDb4irb5I/3/rL+KOZht+X5bxstvBhCU9lX0C4XZzczt+dpExOs/myAM4fz7Y7
HOT9500oE5mBpXNS8KiUpxhGd8oK6jV2gWjFdAAZT72kPBjEGbZEw2YAe4FRzpIujkn0QPHL6Xix
AEn1UQ7u/CkeR73laFiXL3g8LaRf3QHPGbbkU9w62a9ZMo1ny0EyfbmRHE5yomFMoaXAkkeHoVNA
poqBQNIGey21ISaYCIsXuHZcMGRUSAEgRIlOkumAw3kZ3LL3dIGfuChbB46mvQzYoa4wI4NSb1Dq
PUsRhwBqce4JC9Zxx7wnziCCCIAtpxiRjiqMOHEoOmIsYcrqCEsLYk5ID0v4pGx+W8JtNNuplDsr
XhSViXew7w56r2dQHshJgrSkBGPoWjMMRyFLopbBewVHcMc0YU6n6QY4JhHKtEYsvbZC+Wg6pU/Z
4rqmd97sBfDcy+Ru8bjsIrPz5U2Rel8Vw62UPsfpesT9GOjH5c31v4/fjPsMu8P77mhnj1bL8I/i
IMefQJHoB7ed7eKqx5/VBh++AWc90xwhxGlpAgOBjmgqDsWRxkI674002gXFLNKRwX+UWOUYknCK
9MIGEgj2D2Xb+8PDefbW8nN0e1b8fFb8uEJbVWL+H4vvtiyRPxbnW1bL2+IFvEe73t23xbffFj83
m/3mYvW+l8COPjQx/zPLz/5x7szkgEbGmVlSwxjnwmJRTFLr4hdTjo2F9TkBqk9SsasyFOPlSmUD
VM/d2CyBrHdj2PdMkSXeoML5YvjOcxe0lJYGaj0jDrjMRE2pplwQa6SSTokYqRbYS+K1oTGqALgK
FpAFhTqBqiaP/Xz242nxemNXq+tf/Fh8X6DTHX+4itl+u23Hqzlu52qT7fYeSLz32z1THjzy2+Jp
mTZm8N32aWI5+iNV7i3nt6EsYmmqxsmk926+VTrjSPOebIV8i3m5vJ6O3wefg1B61cnrs8TN/qQq
6XDypgxhBm9OLHDuSVXr4QQ+rWV6s76LO6RCyykLVhUj9KbnzVDrFxUd9XBX/ejWh/l9AfP71Vki
lh9uw2CK+HKdv71gmEgF0FBHhA0sHZeKCyVgc8NYhigVcYLBAjK4ZS0WiDkTpJWOW+I7mSLaA+P8
+JfrAKtwPW9q9XoxklaWQJnNk7gquvMZc9ivzZJV8tCdckSfzEJarUjX4fGv2lNjFt4PBtEvuFCI
8NJppyRXROAIfRiNHI2cS8SSaZQ5ON4qmA33XpMYOZDhYkBRoEio7iKF2IFaGj2nEt7KeHV/rin1
qaMZesvERfustHH1hCjiwdA6KACfa814jK0kjBjOvAna+xSxyywRMD3BLaXeCQozEUR6mkeEWWrt
LJfUM/5kBWBKE5qjJXbtrAu4cfl+kxwUGtVuyK+yH/Ho/WnxHcifwQo7WGGfQfQBNdILpWB2WAUR
BeMkRdo7b6VghHNDk8qQAW+iSAXHMDActgDqwDGMedpJYbjiyWYVtA5c+f02Vz5CsVenzi3Dbcha
7HUO3d1iEEcp81i7/TbnkvHjxXI86z1ran1IuvoMmfLICil2p2E3Kd6TIeLj5z+gsAGFPSM1mmZS
YsqiAelO4MAKuIsLrCKJRHIUIhZEeM9IkDadY2HyyhuuXJACpvuAu9vvfz6EwrbE4MibpWlkUknV
hvKlFLGV3qS6RfnC6X7OlJyxK1/cqUrWXgB9QGsDWvtafeYQw8IlSy7jUVkeiGIRK2ecQVzC4mrE
ItVGBgowzSqLeWDUeGwU/KHkWLTWyrsZsG3x7sU+726juk2uva0aYE2+/e1jAJ0Py1BOx7OQXBQA
2JU5IV423VbGWEBxofDjmCe3LGI5nxbBuJtiXrWGu7P5cSlQWLvJ1s2nwEHh+o8GlqpvTz3yuUOW
xBOUgaKfANHHp84btG4D3numqfME11RGAhiOIuwVIDwknObSQq+BYhID4TJg7ARSRMFG4kIQQSIM
D0aJe8i/vCcWRz+cFb9bobq1g9lFQdZg8Ie0kfzu3lx5YQJtflecQ7vvLwp+b/69HXC4k8Pgh+Tl
DZRkZ++dHCQNqtYvXxSjcfGbAqPT/Htv0HXDdHcAnwP4fAa5nB0IDaYpZ1QpabKeHk6XFLAoRXBy
1Ehig1wqhUsdplFxi1KKEqDIuOMT8rWKkN81VIYNdsWNFHyjSo6ctiffW13L0mQ0yvLkNAuU09dF
2xNo8wTIlZ2sI63CpZYte9lHGvSOWuRLLWDKY0XMI/SeE5NK4GaPRgDMyXfBwRcpZQScR3jUj38Z
Q6/bl+1x6Lg9QeDiNrhxHAe/ysj9MUrh1oVc1w4sqxK4OLuR8Ks9yy3q5hTHcqh+L9VoH0txB9Sb
au2Kbb3s56C4Q8BOUinzbV/FAa8PeP05hSNThUQwymsiKSXCUiExSoUyg7FeK44RFxEowoorC/9L
A1uwxzx6jL19IMfgu3I+e3NebSaHMPuesM4F2RsxMxXnwfZ1Ob788Wqz+aVm2zn7fpzPBk3sAIaf
wUkbqYACJ8CxQbKUkFpR77EByBs8M8bIoJWMAefUoVwoYjgRgJIZcK8VR0cvH+LN8hju3AuOgbar
i51CnsP7ZQp/KcIvofwA0LJMhWbLDYHrJHhZ2bqypi/fzc/9GK4voBsAlim85ShgyfGBmnrh57vx
xOR6pz0Cyxal5y64IZ/B6C0eDEn+QskSg5V+QIHDXvLgXpKCMjlWTFBjgzAaBxyswo565wiBhUyh
0T4CNQQBCmRBUOuNUkpQHQjCT7HS78nT0fuz4sNZ8feGsf59MtJ/SL/+/lyN85+5lPHAxb+C2pcY
E2uI1khQimExLYsmRoYQjh7gIteBRk09tnB6i8mMb5TkllnkpY3Rdyt1t82xH87+3jDQv0960A/p
19/zxZ+WD1rk7+HWI2DhbTkGzLdVsW5ZjuGLm2rnLYoGnQktHmt05+3RMLcG+pmEyRy+69NrA+37
zYN89viswQT1kxiZP4UI2g8Re7hXH0+CHKzvA457piXnWc4RiGPQ0B8xFui2MmpE4b3EWnCjDQpS
Ma2MsM4oT7TUuQqyINb2o83bl5Eje1bcrPBculBcFLZ4UdwMqrsBqD3Dwj5MI24J5h5GsdHB0nDi
ZGAkEBo0kg4ooJYwJC22MaVgZ9gQYGxncJBHF9xoZcSbFU5L7y/si5utbITbiOaYSsGw+7qEryq+
ztbcrXGPQ1v0gK7t9/DhTcbLPitOnBjrvDk5HlScZCJO+sA2MHaXgX+cL4seB58a/+TRB1A1gKpn
JK1hBpZiFzDxSksblE0VfwViIjjijAR57UB6UyV0gLM0R9R5JiIBkpiR/OnKsZUAHIHIbGjF4N0l
ukpasfTqHF/t675qsXVIPdZk8QF8DeDra2dnklIRWiQC9lbDUQkZZgklwgDnEmy4lp5apIVCjmOG
AIYRq2yE+zLFvLhuWrId1l0pyEY1716sebfpA1hz5uinb/LjP31zWjQ0Zm3t1jyc2j7GUa9Sn61i
WZIOrbKvwjJWvnvwJU/G1xTZkjFeZVwF4lOtsRTNEtLwnTRs7J6wljv4sszeXKeUhH0nndnNNnXV
2R+vmamK0J4y7JHsy0agS5p86OA1411I01XuvFUHLBHZkxueqnKEsVXl4a55/dYpvlTq5UvN2Pe/
ifIDybLM3Zu0TtD34s6ueSqpl+d3y8XYh8wyq/FB6Cznbj4ZEml9OZoxzrSVlgnlKIJl84FhBnNR
UjrhUDKDEK1DiMooQ+F0GLUULGgumVJU8y6JtLi8P5HWn8z76x8/SjKtp2SJoqSfEuVr+YifUvJM
cNZzxXT9FHL09ur0Jbb6R8y51ccBtp+y6wE0f3niE8O0AjFcKkcMUoYHjbDBMuXiYZKoIIjDyhgF
GJmGdE4GGC2d1LDESKNu4rM9oGO8uJ67pXmTnPh6FJ+8i1zqxb7axaSr+jLpHj9JxgdN36Dpe57B
ECC4KFcGES2QZFQFQpmJwTrspfYoIqyRIBpZCygyUEeZRNE7KmgwyDyQrOavd/aQqq8p3/ZKs9Hi
RS7PlipFkfR3UNUNqrqvP3kUNkJh4ynMQQnPkcI0aoYQMs5aKpLfmo5KRGSdBfABp7tAiAGehFWw
Th2rqttlvaLyWdvjvfOK9x5bqG15U6yH6VKlTaBWQDSFo+QkzK4XTbny9OMkWZ3haFZzifxWPSU3
cy+w6fIcCDuvEhCeV6o41HbqlZ86jX3SvaVEzSlrdIolVU/JG40H7DVgr+eJvSI2gTsQx9YH6QQz
PPmvOaWjNp5JGWAr8BoLoz1JUQmGYoBeDHFqJO0jcUxDnu7kbZ5OUg2oyzrQFNrBuzofy04ahlkz
sQs89src3oaZH5HTh5une3/b3Bvv5ohJyWjtIpF2Ob6CvSi9+NvVafHdRYGznQbGS3e+yy/+dpVy
Qex0UVOVWl00Wj1M2zgvT931+Gqn22pFqltbsBVuDEB1AKpff9G76EAGgVjSiiFHMGWMWWc0gt8a
wTy4cZF5T53EkSvshBBRSSdtzJaGY4FqU0QVKxlVo1Vgv4vLq9WbWkblN/uMXbfKD61EFD4tHmy+
L6LWt35aJrN2ZwG11UOmZ084PURUGrcpnLa6bIqmbVi/JZu64Hh4cDy9m6bEk28SpI91Ym+7CD/f
pY+sKk25yv0I721Yvgspsbf/m3EpQHmd9TtNKz3dNfG3aI9OWUyT3+UiF5ru1cQEUJugqlYLYFzd
JfU2/kxpt3uyaMF0WToDwexFl7JQgxp1gPLPN0ew5o4bL421JhXSSxUbrGEKZmqDFJxwSYj2mFMX
rKPEcmsDccJy2BhxTzllGrJw9H6xo1AdYk0GaPosmDE6zhgclLUwyjuKvFVRBYGxcdQqxLX2MXKO
uNfKG8OsFFbBUABkNedtIWH3pIlpY7cV1BrP0qWfZo9OIbjqvVabVtVSjs7kIui9CtQNSusTL41S
fc3Ts2IEsEXmv0lXWV8gpx1ghOwFxYwYoJc0fHLgywQlrWVFUNJddiIJ96PPHSWPRZpXiaRVqdYp
ORlmuli61okuQgfENSCu5ynkBRYBEUVoRJxaLUGqc+ECsZELRI0JUcBcmfPeOilTMWNYciARa69k
W0BhB8P1thgd5coNSTSvENcyTG+T+jTpBiyc6M1pPvaas8Lm6var9mvVYVK2Qqej9ODpbvKwAbQN
oO3rz+3nnCFMxGTgZoTZ6JyXUaHIQlQYOxy4NDlyPxBBsFbKajh1wczgPMU17qJPvId1c4jJNuue
H2DdOoZ4m3WbgcUjuHlaPE3j1qZS+8WMJzlF9a0Zl7mM3kaftry7hRvHw0TeChPL4O7KBXSYp3q9
+Bje2yl1MkuJjXMd5C6gpx81V8qnDBD1MluwMyE4BaHgq06F0EU/qr5a2XhJ4RdDeVUq7VundflV
l2VffrgNQ1n2L9dY7WVKoEUFYVi54L2KIJPhTB3gKK0dJjIaahARmGkgx0SuQYQbhHCqhKVdF3do
0V7j83a+uM6hcj0Lo/MqYuKcXX3igk+X69i88y4xZj0Xfu8ybTacN4fz5vPU8HsriBOeRxq4oyQ4
w2DJEOFB4kADi4BXuWCYBSkMNsx4RjkDYoSKFKmnO+usxd+oedRcX82FWdZeLTPAjgAMU8ttn5Z0
4/uLAu34s2y6ebnup4axLWJ3OIcO59CvlM855jQGEYOE46VWMA6PAWblLTERS8eNIMRJ6QVW3jpP
iWAGc8+QClSbo8+he9ycT47rqxerUki7zFw0ii+teblR/WiHkZvn0c2tR6VLyE9CH+MlHAzXNT87
miXa44RtmEyuqx57Lej5aeFclzA3jLmWvVgVeIeM70LCFqU4JUgwrgijhHCFmaJIKCoxw1oyoEsj
aJKqVCsp0HZ60z3Qdzdb3N3ezstl8Ndx/B6+aPkrDh9mKMcOvhlVGtp0Hgwevi7LRZUz4Khvi7ov
LPJPczglzmdj1+dRoPL7Z90Q8U4S/afi8Y4eP32OnstOPb6mwXAcGI4DzyilkraRaGpxwFFy5RR2
htBAJWcgTq1wUcKCGgmr6WgQXmgM4EEqOBEwibA5fBz4wfsH4ibXAnD0w46bj5lMRqMfstPpRQF/
i/MCX+16uqcK4j+cplunp6cpg9Hmqe+PfGo4DQxc/tVXXxXSY0lSWQHjmHZYRuVjZFQ4YG8WPE5l
Q0SI3rMQUKSWR2FBKFAvuSeiQzTmFkPvpTtL7Nnk6ZcPcCew9G5B1HUX3x/XRV9J1Rp+3km7P13N
s0veNHFvfozFnU2Hj56jQavUXzyXIj3b19nKq89Q+ukhuthnQo4PkIWTdW9AlQOqHPabh/cbBT/U
0uTEhAlm1iDtvaeUKalEwMQYA7Pz2iI4qROmhBbOBZZdJxRM+ulK5o1IHU3OirULOVy7XoSkY96U
nkrpeFM2z8tmbGRbw1z9OzedHNMybUKL0+L7/GJy2vpIFhOtKX5bdrTJaUtc6SQHXV0Ui0t01RIy
Otuo05s/727gA4Ob362ozMlC8246q7ubtXVXdfmytc+kyMuLk3u85+G21arBQX1rKPc1KOe/+qBT
HL1VQVOHiSXKWqYs1ZRGq42xRMJiGqOddQZWj2uuLNZOJZ9+ggT2XbKj7EjBHEa5K3/yxaYYrGMw
d5g1X90Sgg+12xOBew80CFjXFFuFq7aJv2bI6rboa4SiVkKvcaESd6ONvKsE3gh6eLmRd6dbnaRu
sqBbvW/c2xV1W4+1rcZ9Iu6YKh1bJ5HKRlG4+WxpxrNF42RSf9BdjiPynjK586ntPYUzr3KsUHlW
kISwu8Shrh4mdQeypwTJKVCBkjr5S8riTDplSF4/VfXCcD9UaV1TlHxaZCeK6kQ2TO4E+v76vOjG
s+XgRPflao1T4TGtkeYiSB04RsgR7pXSjmIUo+bUc8QNh8lqzImHSVFPnLZCc6R0Fyc62R4v78fx
+q+wKGX4PBlF+9I7dDG29qaDwXyorj0oMgZB9zBQR1ohYrxTDlMYWhpLFfxyjhLtGGEkBEyJ0FbF
EJi1QUiFAbVHHrVi/umKjI2c26R1yvDzNwVL9YPIoarajQuf6Fj9hR1+B2Z9TlpHaRCVQRIBc7Je
Ok2Z8BLrIC0zMIQhlFIXYNEQpRxpDNOy1sDcuBTo6FRO2yzZdGQbbdjytOnM1lJBu2PV7A4mqjrO
3plZYQOMcgvMXhVAMYtmHFbKfvRuXizyTBadzo3sXjMWgPdbs1yGcrbo8/R4UgZ/clacvClDmG1e
7JtpTky6a6tfn8OM1E5pn6T2Z4nrTutgARuA47AXHeNxYYNnRHN4FDYiR5JulzGd0rZwJSSLjrlI
U3FvrTC20cKyAcbkhlhMtOb9WMAa0njk5pN5uTgrVhcaYDKpMavbp2nvSm93W+1uWLU5zY9dUnT+
4591EEel94Tfozr6f7F3pUWzux6sOVrq65Xxfn035Qds2NBWtyvCt2+OY9F4KiuRYMBM7au34cNi
tGueyrcuG89cNbLGpp/0VJrHXrvtJquMjG1EtY6RHtr6HNK0159CmuThTyCtZpa8i80Mq/ej08PW
xKpV5SSzb1as7qbFA1JWb7KvTYthb5+sdmwzGPQGaf91VjugOD2qsLVEacxYJIYJZQjMUqW8sTY4
FQWlJuLotRIwPUMN1xpWWQjSxZ53WKanhxsHksOSvWyXLM0+GhK+bJHx5b6Ubz79gKwvH5L25WF5
X3aT+OVxMj8Z7MpjJH/5oOwvj5H+jfEO7AH3f1bNDg5vBzsze3BTKI/bFl7iq722e9tCY+xWrVRn
S+h4CROYTObvKiPoOoNvdQiuk4ms1rtDfl7J7y8BmbOS9HqwHYmzgrCcx+2sGMlcTDane0sp1nAq
VItP945jHSKlTpojXJ30k/5tZYpFOdtbFexTkw8U69OnlNE4aXbfF8HVuuK8sKmYLSwJy4ucrqYE
Kur0KWUmgeZ1r1sk/+rMrsAIg9n1y81dwijVEoaJXFpYl2CIp45HI+CI6Yh3wnGRsk4FZmE9pQ+w
YWokGLKGCmw7mV3F/SW+a+1nn4KQPaEELuml0iLZpYB84jJJeJcAPBQfGo5eg0w8LBNh4Qysh+Im
EueEVNCpVp6bIHAyzmrsObPKM6yoDUAZlU5yWHRFHNM6PCmAcUsajqaNukPZRPtdMW1oS+qMfNNG
lSF4O9u8TW6LqdF2HZ7iRTGaZkCeXqUqdvW7bwsBL0aptt30NF/etPy2IENc4+BI/fVnzwXedkoH
QZAiHHCOkJowyaL1IhAlHQXEFIhNgkABZkpxkEBH0ARjIEQfq3jZZfTZ5nQ8jtmveLp9Xl4ze7nL
7mULw+9ESY5qVn65xfQvV0z/cp/p63ukGc7cNSVKLnRZ2Y7ncW0WznlRyuCWwBaTcNwJWt5nHv73
cYw9gkZMKOOfw32OwH+YfAZnQdJl1ActsB8z54lUB84P/2+8vLn+s/fXfw3L30G3n8eFk35q/03+
qX031a9ZF2HHs0EX8QUbuGEWWAnMZBREa8V0RFLQGGCNtLawDxOKNBKwvNoEnzJhw9aLkGFScGm6
6CJUexXlZViW5iZ4kFH9J93qIkf4q140EB3Uulz0M2SHksuKvUKDlmHQMjxPaeeF4hbGAUo9ckQz
Z1N5e2959CQEKpjxCjOLXBCCEakwdcn864JmStinu/PsC7uNP3h9bkiV7uFksDo1pFcknQrkoAoY
VAFfPYs6izEsh8LKGEu1EjRQq4KJmGnjLEqdewVDIQbTJpIz6yXQY5BRyMRwrCqgnRG3C9SOWlkx
n94fV0ZjtrxpDlyf0486jav2IN+/j2/7N2fXFuAqF3yyraLTXaNGKqOWKmWcdohrTd3i2nbLa5tz
tuXy+rpe1WxLxSZOewnDTWPpitSqwAbG+3Mh+a7sNJdk069pXs0h108T9fVqDnV5N9nTZHQ1h0Rs
mkn2BtibDc13VafZ6FVxPLSZhqp9AehmFrVDgzq9GiDkACGfp6oaceysxJg7iRDCikF3TnE4DQPl
BJppC8NHgrARhiHknMCKMy9lYLGv0robsV+VjILXwKCrl2SDKBcNB+jsKHZWlY8PWTtolmHz/LaH
8toPbvS3RseX4+I32Z1tM9TV6elQ13dAqs8wTtHCWgDq5BQOinBAlIwa5ERASsCAEVvLsfJOMJin
9RQ77FEU0sZAosHu6Lq+D/N6o/Tb5dUmT/9hXl8bq7pwevHUinIwmYyEU8hio0Tc4jgM3F5F+E1Y
Xv/bjelTbXhirDvp4DkYe/FwPHkT33QZddnPqMZ2GdT9qj0j56UfrBFfbrUTpyyxMDuPuQG5KbmV
2sMEDMjY6BHMWWuUpuFSVQgTvcKUWmkAc0ViUCdrRHv088oBvU/7dgfboujHB/JRHoePHo8+rrLJ
cHAcDo7PR7YFYTDVNGgtfUKOPEhPow1BZpMrSDgZpUz1bTiHYQLzjjvsNNBAnKfh6baHlWjbyUBz
cVHgnDYivWrJQ0NaE9uuUiGu+tx0Xqd8f1lsXdq9/4QjYh9g4b/u4JtxEC/c3pXhvKVje+cBcMKF
G3O3WA7w4YtyIzSSsSA0/PMhKMUDjsYRgZiyPl2U3jBLo9BIBiesi9qn0mlEO4Hk0fURmoxUrNOu
7nFSsUooWvMKbiRI3b3Xwkfnu1x0vn3vkSaI8+XNyj8Qzoaz8G5qZikR6TvzYT3Wcaexe0JLUpKa
Mvjrm/DevJnPPoZXRxdERST+xJhK9jGe7lJpWw6oakBVzzOFKSUuVb2hDBFNhTRcwasoqdLcKpiZ
kcYbTg3RmAgmEGAuHSSNDICW9uJpcSP3ibo9nw5avFj5deTADvg16MgHHflXz57MKkyIZoZ6RAky
WiOAZFEJ6aMXXKYSVpQqSqWOToUIE7eKScoYFgZOTEcHdhzkxKbOepcTXzY58Vgglfw4VkMW6yE7
uXO0l5Byk/ki6duhpz7hUpcQ1E/tkCr6iajoUut2QEsDWnqeeZC9AegDQCgwLLk1jIIYjg7QUbCS
e2O0cTBlWFuKJLUoMo0RVyZImKMK6jBa+uudPYiWNrJt9OMOPvpxWw4PiGhARF9roLvQnMNJxCjs
JRCtULSwVhIpbIUinjDKGZPCOlg+h4EQAuNiQZAmyhJ2NCLa4bYtu/2PGfs8ToFUd1wspmYyCeVK
l7SEb2ExOwr76PY4oEmYXU/mb3rNN1zdSUlv//Kff8m5b8dvvFmaLhlwZT9JenPqXWOr364LAbQf
AvIHVq9B+rNMb68eF/Y4wKYBNj0jTy/KDIZxQAYjLaMLmnslaA4Sssl24KzWMQg41kZNKIZb2ipD
kU/VMcMDSqY/HDTa1VJxlIqCrV00p+Z9UaUVzJcv0dVuVt58/fVWYsXUfHyachyY9zvZXzf9jbed
OeHGgMoGVPb1Ww6VEg7BqBQFB10nVTIm1iKjUq1GD/NUNggYzAogSaUssZEaG6wG3pdHJyDZ5eZy
zc8X29xctvNz2cLR32d+Lvc4+qLm5/J+jj4+t8ga/kGnb5Y3uepEejeHLzmAwXfz0h+H/fD9aTkX
dxaajmdvPkbJCTsx7m168e4GJrlVLmGeE6ful0s4SU98xtoTjyK5k99q/zUoHkVzujxUMhug6LBR
PbhRoVRxWCKOYSCYAMwJp2Si0K3lRlq46QQjQrHoZYhCROVg7hQhpiS1toeCFNuiegR/8FlVEXdZ
NvzKzOzDaFRfzkms815W5bOGR05Ph4JnA08PPJ31O9pgDCRGOGRKZlkIKfEd11oGFC2hImBkgIM5
vKVaMxEJFpYHJYxGcCQ9Fnw+wLkVTqxZ9wDnNrHmfj20TuXQ9tPCp+GLNY0pUqOue1ZlsKtChqoC
2bGoG1UJ7I+Dn+S+nHZ3M383ge9Dr+jzJKeYI/gzoMgTYAj8OaDgyZPmO6C5QfI/o3gn7HzAwVhN
A5ZMAvnIpyEYiVQJlFyVZYobkF5J7K0hBAZmEkCgtxzLXsqLbSTfVmBA0h7MTovvWmMCdkpXNcqP
kLP6ydNt7ePsclycFyRXHIHXu/WnhtpTgwryecsCDQTLlN3YChkpjx5HxxnFSCfVpHYiaMsZTJ4F
ZChm0YAc0IF7Spi0jHcoPrXN8ZsIhlGD50/3QhQ2BYCW9/P8+qFcRneH5xu323rtp6DQXgVdwJCb
CXepj6vbw81v5+96DWagTyhZo/BHqZlBH5eb9uzxWTofX2mIYjJYpgcA+UzVgUEhHilBAmtBQ/BM
mUColJwqTRQ3lEqqFeOCSsdgGVJqoqRQsNG5iNxhAPn7nw9BxywHR+assA3UaJOsR/uAEa+CSPMB
v70NarTJ/eD9NuZQMKopXjSo2vFxGqzXA3T8Wo+R0cN4CEVCYDawJo5IWCJnNGOR2RT+KjALlGLM
mA6OCZqmCENyZJA6OmfmirdsXYQygTx7cYFe3xfompi95T5q3Ifn8e590wiU3b31Yk3EeUcPRmcm
LqHAkCFihhFJiXhiTtLdXGYydV2c2JPj4GF7hcn/SFrWP41n13/MlvI+bdmX+OqsuMRnAKmvPnGK
j8tq2Hr4s4I2Xp4VrAs9pB96aB4508FyrlLWkQ46oMYBNT7PHMvMYcqxdZYE7403hklNSdRKa8Qd
Jh5wY1JA0IiDwyFy2D9k9J4Jx7nR/eSw3BGUo8liufZvHM+qi6n20ng2yoqJ96dZ1/g+u0NB2yHt
5AD2nmMMV7BUicBSWtnoJBzwErZDsKpYB26NZQpYFxshgctNtMZIR7Czaf2Yl+5YsNfKnpua8Lss
2sKhxZ7v4fqZJ7kgQjfj6d204Yq4uLPJJnwcbGtPW+LHv4wX816TlHRQYrFPHQQrPnGOkgFsDWDr
maZAEERShTU1FKiNILCdoUYwpjCiNCjoW+lAg3MuKGtgtsZii6MygLWY8k+38daibWPd3THfzJqm
2lUgyOW4xbJbl8JI5tz5Et79phhfbcOwIVxkwGDPICAsyuR/572NIXnmGco4rJDjIWgiAtbSwIo6
J4h2HCNMBOHeimiIBeBGjla4NTl3k9Z7m3NriHU/3+Kz2ct9pm3GAz8tImRTbLYmd5Fer3z1xrNl
eHNkUhTdXnE2llVaug/XCeQt+tWorVRYpFYkVZVi8ruqCk6qHtNFrfQP/LpIvb7O6qn8muXf/HUa
SuTXMv9W+beG3//sT0dXK+SAfr6qFKPSO72qf5OqxjxuQnhvQvi+CaXBqj/V05j0N0sC06Dwj6Xp
yKyIhM8JpwI/8AHiSjUJ9zbtOk2XoPxB0eoPq/7gaoK4miGuJo2rdcB0M+F/fqHJ0f83zfJAtlNz
9yYtO/SdnG9XIiD5Tszvlouxr5Tmq/FBIi7nbj4Zcp9+MVsSVkEaHo1BCkah3DBELaynE9FKmK+T
IQKuVDJSabW0QgceuZKKKUaa7kPHyOn2otBT+EqPbycfes5elUttZal2jrtV6ToX8lUv1obReZIn
50mgnFPUhYJkluunxusIJwmeSqV1Ke2FJUZDwdfh8P1cgTrDFGYEPUqvkLJU++iQSjmfefQuWIot
SQtKPYP1QzyiFF/nQJQGzC19+uG7KRRHFVRerM7by/nSTAC3k82xPOtO62aNU3nV8sVF8X7rtF1d
/rbyvqz7Hg7gwwH8OZStp85wOHqTKIVksIelRAxCKlig6GDRpOPS2iCY404EZhGOWkYhKJaEHJ2v
oZ17N1aQFQfjZsKGbR4u27h400OTk79t8nG3ulorQgszmTRO5YsqbC4HzMFi5hM6YPl341SIdj+b
w7E2FIza0zi8Xd5ch0lIQKbPUzqu4B+vyp7qq31v4bNHJ2vvJ7kWBsIIy/oCQq/2Hbo/s3/1ZToc
k3SIhzWkIukHHlzDDl7oVAwAcwCYzzOdI+ZGaWq9tTIwp7xwznLkaQhWE0UkHLZV8JIjC7O3zjPt
mXeaauSCM+JJGVUb4nZkyvKsmJ0Vb48x8qR7f9vcQ5VlZ5ytOzuBecmFsywv/3ZVfF+9SI12o/fS
z6hqdtZolcqgbN7Vd3YMRuna23z/M1cE+j/w3PsDGrK8h45To6QSS1tmXrxBBfYl5VEgjDFFJQXM
RzzlzKd88wqOeNp55J2AGzwoQINRYEosC5xgxj3nghxf/uc+tnvAQtPCdOfj8618CnvM9jKxWgNB
bvHYywaHvdzw15ZpJ7PXeZO5uuR6hZkW9UwT4ZvQOujWfDgSKrZH0YW7SSjHZtazsnAvmA5/Yicc
9gQCMP4owXRdyjMOSG5Acs80lM7pyKMNVBJEOGIuRlhLS2jK9RoYj4YE7hhRUSEBBMBuI7UR1KQc
rxjFp6sKmyJxBHvKtBFXNy2+vwCQtioud3+EXW57sMUqCXgqgDI9LV7sjJvC5mDsVXWU0bTy+bmn
2aBuHNSNz6B2a0QMJz8+QIpeK80El4YZONMFDgc5wlPaBks5MUwowQwnwZjAvYeXJoijkWWLBGhk
Z9iVAfspGtBW6/Y2uNjKtjA6Tg48JAYeUUxg1dHKgchUMz4SVbYH3zk4/vWqekzJKM6qJBVnOTPF
Jw90q8fOfzoM3ovNuZ7+5vcQXjcgyWG3eCi8TljvJOBDwXBkGDmmlNIEdgtpjSAsJoBptePIM0xk
ZCG4lLXVwUWDue8nvC6LwmZQ3RAoN4C2ZxV4kQqAWyDbOJgQITZa6R2c4qhQXrNglI7U6kiIRz7A
7EPOjKKM5oYFfbSNuMFoxZ5ddwEgKd16VMRb7jl/1wo7n0+CmS221XAdDLbtUW/G+/6dqmu/4z0T
4yi7IHdwXhvVPst1h6e9QJqVS/QedZV3dBfyVv7UdZf90Fd7nbfQl92oO9GXn6iIgy5PB0Q2ILLn
6RwtcZTC6MCpUZZpqmFtDHLKI+KoiIpKab2BhRXaSsBnmFqFHUvr6BWyT6oSvpaxo8Qt+eVZkV8u
72434GxRXBRwYRJyFZjRugGcsNfPbZtO4ZnPbDN9KKpgPpt8WAcNwDEfzvuuMLDh3UzDEl7OS9jj
Zs4sw8ys4g3MZDJ/tz3mwD2fV/uFBBBsbDCWck6RIYYLTaAz4CqjCA0RzjfCOakM45wwI3nEESHn
HKwsORZIPcQotV3zXkZ52WSUrXqX8FBHfzqgZQdnrZJEVVcyAYsjsZe8X1d1/Z/hPXy53XhqJn3m
HkB7Zkj+iZMDkCc4lPWivMJ7hlAsHpc1awBLA1h6Rudmy5z0QLj2QTJlOUlmUUZgAlYIzKISHqAR
oCelTIRZGaaVgRMmDlF7oZ9uCN2TjKM/nhX/tYJK1an4YmXO3HG4SS13/djGEVp8D0+g7AQ9Tgmu
Md/xYau6fbnuN/3kDIXw6H7rt0DAePvSuxtYR7ixk9y0QcTb4jcFFhUlLS3uo6I55tvi22+hjy0c
uGP0GFR6g0rvaz3HaUZCiuFgTBIB6yVgGOcxs1gIJFP6Y42FMSYgJ5mVIVBYB885clg5YTup9HYE
0H+dFo3Aj5UQQr/dXNuTRJUgKl4XO3U7Ry3SaLfZtjBojLKWS6NKMLU9mKXTzjMbETWqZNTWfHYk
1agpqtpGeJDEFqH12z3taH4aLj9eOXqz+YzWIS/pc1iln8gfxZEwXbfC9DmcSn7/890YAGK/YS0n
CGOE8MkuShWfOHjlJBUf2yfjU2cvOwEq0MkTDg1kQOwDYn+m0ZA2ROwFNooHJAUVinEaOPPWUaa5
ik4FyT0yaU2ZisJqWGTLI4kmavx0xL4tJEeLs2J2HFxHjZb13rO4HGe/9hN80grRL1abzo5D4wCD
Bxj8TBxMaJqC95QjZpViaZkEcYFRaxmAY+QtssyHpJXlxBhE4cDuqHbMq5Qq9lgYvMfVq2pRa2a8
QPeAX7TVdoUqG6x9eh/cbbJ3C1p8WurYqosUuzWvBFydq8yOZ6b8sCoomsOjYfJVkYDj0CNG7WEu
75elccvr6Xix6Lmy/Ugkm+5ZMUpJYShLr5g6KyQ6vdqPh97VhCJ0PLC6TKkfReo/2+PR6hVPLyhb
X0svmUqvJKouXvViER+l4OrVRHGeMoWJ8paJ7ql8Rad5pgjz1H2aL6pfVNNMyXeqS+kVzbPkKF/7
5JPEe7MmXSaJN5PkZG+S1aXtScK1qwFcD+D6eVo/tQ0mYCcoLKCKQcEwngZno6DOK8ySbVSzlC7I
eMyUYJJqojHQxrgX5DC4/sPhiKDt3aNpF4XNZ3kNzJ1ezW/Tq21Xgsurzb68uLPZb2z19A7evrOX
6Kr4bt3lXmnWxStzextmfjRqjJqfWhVhWP2s7gMBqQG+2h5pdfe7NdHHjbWaYZ/+DwPcHyTQr0MC
CcaVR0oaoUKIRFhhvYhRU22oI5QypZ0SMC4GyhASCuYngiAMe8OEVEdHH3WUNg1/jMurTfT7vrQp
16GJtaz5viFr1oeAB+TMut2+jGn03yZhHhphI12e6DRSL2A+aeRj0AJemmVhylS0Ii9qEcv5dNez
ZJ2Oqbq2WJpyWXWQLQRAb/0ug7kjvU4waa9eG8rxNCx7rWD7FFcP3EuUFH5CBqhevF2ekndADdh6
wNbPM+ae8oBpoFIETWESWMM0DKE2KBl41DZipmUKs3UYAw7nsHIcgLfW0QGV7umK67U4HPmxyS/O
ipswfnOzGzZFixfFuk3xctVoAKADAP36EyshhpnkgnjrjYnEeC2V51YoGIZZRigBEIq4o1H7AL8U
DjR5ZVirFCFHh7+3MGPNZg0PhJofyYt1o5erRk/TDa9Hr1TC7sMkZfsqj0Rb7fHoYXq7/HDtx73G
pP/jn2dF9a9DOHaK3u5FUfmPlEbyMRTkCPY+SPjHPx897QFeDfDqGcltB+uEo+JCwP9RUQOzE9g6
RgNxLggNgtyTFHXuYAlpZMiAWGfG6mgJV/0Eoq9lYI7XWDvmri/DOd5MJqNRqk7kswbB5wKSufFQ
5HVAXM/R0RXGYjIyBjOSEiFYQCWjcUpLrbFFlpsglQJ2NR4jB/xtsY8mlS3gwgt8tMpvjzcTylpf
vUiM2cqXuV3NlS0g5whlmbsJ7m3x7iYA9ipz2nI/zjdNOQ5becvLUA2RMx/Njwx4J+32+KnJy+3v
XA4am4ReLfKkYT/OZtQUFZ7s8slSf/XIhNpPsClXVbBWVuVs2eU5Br9LFiOEeiImFQ7Lbgo5bj5b
nFNFncr0TDouEVNswHUDrnueBiGiXIhwwtYRa+FgT8DWAoZTxiI4kEcNPSNsg1aURqdFdARrpqV0
nlEZYj+4bk+UbuO7iu+uoVWqEG7ejy6NXYzeFy+KD3WZ8LPiw3pDuRqA3gD0niMrY4cZCpjQgDHS
RCsORzBGBbFUOuHgLuWY2BA0YzEgaqEVHOm8JUgJenwhm3uZtXwUuxanO/q4zfOPSzUOD46nd9Oi
JnJjJ70146qibBVyn42lGRx2TYFE2mvWZBx6vQQ6J6FXNV2VeAegH6qKyJ7l+ql73nxqP/5n5wL6
DFo+nCnfVJDNr/XHJb43BWGu/spWVSP5w16i+6kC0KBiHKDosH89uH9ZYyI3BMEAUnPo3RvqNTdI
Kcel8Vh67I1L1TeQ4SoGY1nAhiMZkCEu9JAsoCm/Rz/kahyLu+lZ5evfSKFehxdcFDR71UCbe/Kk
ZznU9tg683KR3ZymxXcPPL4KXNgjsUqbnLo4L364zG+vzjaBD6c5M9L9T60m96uHyB9NwAwI+asp
4SqCBT43NHghsY8SBxmE5w4myOGo6wOmhviUeop6OOoqWGiviYUV5Ujbo4OdHpQj5cOSpNwTBgkc
tD/ZLkzKe8RJ+XSB8tNPOwFXnQRMFyxfd1n5NSaa6vqSjdpBxyH29tJBZjp2xsKXpA74v170WkJI
b1K/Pgz+OOol+F13GpRiQUQ/wz4uJ9djMe7HyEH4o5keSkE4g9vFyXgxzkjChZOUYzCbNAJ8X4c8
g1+QpPfGK0WcNyrikGLTpYDxDNXMCEeYpTDjgCMSVhHvPBEorbKG8QNQtYn0++dRsqXdYSfJsOuq
Km6fqT5Spg+E0q/9RBsYf2Jf5ZRp42kJP3B/eUdwlQWlbV2G3B/DAXwQmg8dwInFllDAyJII6EBE
a6VgAs7hUViR3KuljkR76ZnmHgmBfCpXS5QVwlrzpNTGDWk5qmLnm4k/7krguuV1hscFqi4mPfTW
hUNlaps9nF8UuI7wgWFWeQTQSREAUhTneCvQsPngd3vZ+FoJ2yYuKcAbzc5Wt7atVKv247h+malB
g+lqOJh//T5KDkVnrYc9XFOnkeBCeeVBBFkkmeUEwYGcIyoicVhxR7B1MLwMkluN3dE+SvcImbqM
2S4z54tNKZMv7EuZdVm0ZgcvL4rRQSlzun6sRcqs791DVZOuewXMdnW2IyTMY4xsfhzrlS5sWL4L
oSoqUhdig9M6WmTNxuYCrjyyZh9SzOV5nSdl61i/lULlSItce1GSfo/zX0Aq7JRtZY+GDhYmTT9K
ZWIxFHMb8PWwyz0QoijT3LCMRCitPSMk5qCnpIJgIjpEoxQIW2Rsir7nwTFJDIOlNorb6J9u4Eol
pMxZYVfIuNpA2tPppVqc41nVfCetnil+Ay2zwjmJdrt+u4OO631wvFvGasC0A6b9+lWQcGQ2lksF
kBVFoBXmFpEgyEepEXdScBSjJ0JLGEE4lU7YPBAfvFQ8HJ1qo+Jp20iC10CK+3ydPMkrvk5svZdW
717Wbkmyt2LvlkJ1T4qerM08bj6dwh0//mW8mNd+W+/mNUSs7TVHgsP2qilTEDvj28kH+KosPypK
JOiT+8jv+yWhLpaojwISVQeQOGhhB5T4XJ0UMEMOewCKBHOOiMHMEiljkJan2r8R/jnKkDCYY+4Y
CUCRcU5zx1kUh1HiHw/iw6ZEHCUv3YbP04fi+zYXpfPdZ84/1JrNXFngwz2OUWi3Dd5v837VZhFa
bhYv98nNFeY/cyG7/4J25QLeHLAkr5Qn5apt4aGDmyJ1FPxgSf6SEqLD4cxiGVAgjFGlvKDWY5XS
MqbZIi4iE8CuhJhghGZwO2rJENKIIiSO9hlqY72ywXz3uPS0sl/ZwoBlCwuWLUxYtrBh2WTE8lGs
eIRqcdVFRnnQTXiTKnAkx5/53bK4yynPEjx8UcxvQ2mWCdbOaiB5JA7U9wRyvhm76wV87cpwnVBC
n677qQhvikhM9XPZ1VmRfPkxzW7wOPlVXWKRXctzceL0XmdH+RRkya4+R1KOOthA1LSkWIP0kmUq
1ZdHkrx6QuKQAVoO0PIZ7WXI+2gRDBEC9sozrJgJREkrhMTWIiwo0t5jG70UlEeBiWHSUmq1kaYH
D/s9UTuafriemmU5fr+Gmn8d/z0UF8UkzDY3U97OtXIjpwJt5CVeXXoV3i9TQs7LpBKZjGcp6WZS
fuSXaa9Yd7fqLOaqwZON0jMP3tR2rvuuk32mrkfl/N0lPHaVn4c3W32fbhKNJAGCD9Ur2Rtu9czL
i02Hl+Mr+H9nqjU5dfutEcm9HhHV0mbH3PP8b39o0nFocrrGKOkDW4TlaNXw9DQVFTsmqCFvFINO
eJC/X7n8jcGr6JDhxBJm4WTvAnOASnHMpwkmGdXSGCZwys0iEKHSIg53JQnM2HB8hO4hKVs+JGfL
Nklb3i9ri4eEbbFd2LBV4paHZe4DInc79Bjfr/4Gqdsy4kbs7oq+8rDcrR7fHp0cGD2PDbI3/99G
A+lKAzltHBP3RfD3+NhAkG0hfEzWHTNxdxOzDNX3rai+b8edxGh7AHUZfoEzX7j+Zf4ODpt9ek3/
Jd84Of6ksP/EE9yT/+evP3QZ+oe//k8/4xrbZdit1sPRaNian9HWnOqSG8sdCxLLYAXmOgrGguEu
aKapIMw7zYVGlhhNGGI4beIwGvGYxfgk3+dtsZc8E9fIvLoEO8rJSWMDvTFZ95UabntmrO6cmDCe
3/3w+//z5//ZrXxY93h+kRtvZeyoffF6HGy7YxizGv3yvFnOZWuedYPXWy12TACtPTdn00wjUrX4
zEaB/02y9oBBYD6bfChW3c9ArJewoRrYdG+mYQkvM2qaOdhsZ/lLlSLPzGQCazXYCr4klw8vovLB
WesEM5HD9GAZJTJUcmyYwo5RTJCMghsvmBbYRe89pYhRheOx+L5dXmRn3zUf/fQN/Ld2WN5m4obf
cX39p282PPzTN6833sd1fy9r/qodirelRU9DbXf7cktW7NKzLSfqu2v7xD39NWdwSEIc77JSfxBF
Zt9km6jJy1m/VxVYjndipuxAWqGJ6dcwwbNOHaO9lDZPqT9y8ud///deoGtS+dOHi0/SDqT9/n9/
/+NJXxmNWsnrc+UG+D3A72ekGeOOI2UDDbAPKu9gCQNlFN5Qh40hUodAvXXI4EhTQmNONAwliSap
bqLsK/dPErIjU5Y5ZcftCoRfH/KT3gozrFtWEUApPcVafQ474O2unwtcyy1/U5A29+l6l8qS4QEs
XDXMEm4LA9dCb8jtM7hbf+3By0ClBeBNMaOwRFwbaxVzOlImNfZMSTjICwlj8hgELEJwsL7wRmhO
InbdcvskOVFkQTE7u224Rl8f9L0e7RYybxMXRUOfW0uMXS/tbaGx55dd8/5P34DgqJD5luy4v30S
FpsH7rn8uNI42ynaE1TOSxgmIWGtBJgbGX3S6Takd7B6qXa6iamUzm0oYTmnCcybWe0DlHq/LZbj
6bGlDGl7ro6b8N68mc/MJCUC6tcX/PhMGLonz+/jE5/zPgaUHaIP8YBwB4T7TPcnkbaZGIJMu5Nj
EjtFHCylskn1zKxWVGqpOeKUOfixkXNBAqeBefdA7e+/3tlD4HZLvG0Qay3hZ6keIYFfs5zfbfDE
GODiV8+ODKAix8gTwkgIxFlkcWRMpwSzNFgmpUDBGa+15dRrq1M5K4EtE1w6g/ixcHGP87aTMsxe
jMiLnCuxY33odbDcbHmzGaQOizsSCrWnTHBAK8Ayt7TjyaRHKCQ7ABPCxCvSCzghoksuMsbIK8n7
ytPQIdpNvuIDMhqQ0bMUxU5g7qwTUmqhQLpGBEKXEMMQi9Z4BbNjwjhlg9aAoGDNogzEYiYBJyGF
nhLwtiXsRnez8XLRCHnL74vvC97UzJlplXi3vvuiIK9E03etTGamN8mzjvBGfE3V+js4zqPW3jBF
gL4qEmA/4OgUuqavVn3s9k1b+yaH+saCvOLNMYCSNAh/Re6ZAOOtEXj39MuJaPZOqt7VK3bPFGR9
fTlfws51ser25abRFkrNzQZsOmDTr14gBoaolJFqgmNKckYJQ9LEGLg0yChYWGIZtZJLyoWKHIji
1iFkrY6eiqMzR7QLv6TmG8eajb9LgmjtQdom+tDGPXVL8uXij5NNR1nwtXRVy70WwXfa1jNt65kc
6DlLp+0hGnKvdQy2GqMR7nhfr7XQa5N6rX3Lqu8DMq9RDXNH5HXyyc0fbDl24+WHIn2+R54JVOuZ
YLy4/uvd9PrP8fov83cpTTq8+u9388+kKO0rrlB+hnpCXTIRD9WAhlPB81XQKCVwDjx00D1sfUgJ
obRVQqdUSVGp6FlQmmOlpITJE0ydo54w5SIwxuFTwe9/PnQquEfcbRSngLln2QD3rxcPRLi1J68Y
At4GKPs8EvsKgTRL6+V8lFHowI2QAhHDFSFwtmeKWSo9Upw5pWiCs1gnJyDNlWFHe8Qe4NimPX00
W5nN8Y4lvi0wat9a3iVU6igjeDOZGYC3WWEDDHIL0gA+tuALs1hlQ5vNZ+d/D+W8uM0TTJdIpyrm
tD35hRuXDj6y9OduWi/tZ8J1gKkVRY0f/ont4RS/Ypg3COgpWe7xem/+Cg+pzwbM91y9QJ1THhmB
pcNRwnwEtyxibLUAfCcsY4LIAKOCmFDEBGskF4hzD4streqjAmSLNByVK9h3G8rxNCRfpFR1LWkp
MMgLeLHtMbVuNkC8AeI9A9dtyg0cwYgHwmPSQjKdQJ33WlCtBNHUWgyILmDhuKOIAnUhMCsdUTDo
0drK+1gzM9+a5y7Ii4otX5TVnfuZsouZfWvYKr6nIug48MVQK/gK75elccvrlNts8qHP6J4Rrapu
n54Vo6r6tkwvUy3u0w75si7pqnh3ihW66iV6ZlSHz9SkrV6m0uCdSMOrqtysqiveE3VViXKdVwul
JG0pf9vmXScS676q7G5VT1cDuhvQ3fOMjpUBc2UdSXV9OPYoQjcA7oJSmnurSGCcOoQkbBcRwexR
TCvprMCRWv8AuntXzmdvzithfwjhbYvcUeKdKlXK2idy0UgttgzTW3ibcqo0UoaNZ7OQY1nXTzdU
fKlBmIR0O7fbidVJqsP5ctUi9b/TYDXsK+P9CJqd7t8GGldJYDYN6n3ux/lsUC0OuPPrFydGKCI4
YkpbRLQy3Fk4OlrhrPIWzooKOyG0JQi4XmDD0/9OOWc9LLJpcxtqx50HBEaNLxeNDFlbAiNfuU9g
NCKEtsXFWt/YJioayshtIbGdSWpLPDRhcMoa1dHVtF6AVazOAvCwWRZz5+7KolqUTN5am7m8uwWK
c6aq47Bxey6oWzNz5i184vOy17j3lFlXAiQj8JcCOhO6E+jkzSdTT/3ATq2qNME8JbUVABt5J6pI
9VR6WgF1uicwzNJ5IfVNKuoI7UoVodXTVU8D+B3A7/PcraTwWhrEYiCWYxGdozpwhxnDzhssKEBh
77wglFnPnTMy8sAsR9oarbE6DH7/cFCp2ZSko9nddO3iasoyVcOsk0DmO9WNdzdA/fr2d1s27ukY
2qe2r8YzH96PUvnJ9PYSva4fuDptYNZ0q37gcjp+nfK1FC9Xb5Mn1ev12FftT63IOIe2zcfr663P
r59ZR+2vAi6g4QCPB3j89ef6VunUTCOXRltqKDcuOumNo3D+9kIwOHgjGjx2MF6qWOEU5gZZhgNG
kZpj4XGbcCnvFy9lm4D5fqfwxHEipjxSyLzcEjHlQSFz/qCIKe8RMuUBMXMEyE7LB5dyvt153GDt
quxFvci51ZGgmrRb+5O7KfDaNNyacdkrrG5oY3kuYVHpZM/28zpV7aoHqna6tR1ua/eoOrNnn2da
6shpqQ7TYr1Pi3wJ0xrC34aTwfPcqAXjnAbhQsRGc06C5VJLGpnRMCKMighnVGBsqYxpXKyFYZYx
w1JtuCc5um5vB6O0+wADpz+k+kMbanFgvKTZSgUwpsnxdZZ+zbMCa5rzZaWqTcXfx7et/ZyetiRn
HZD4gMS/fkW1JUCmCjJwzzUOgSpBGIdew/9n702Y2ziStOG/0jsRGwQlUq77GFsToRl7ZnfH45nX
8vvG7EcxGHWKkEGAC4CWtBP+719mdwNoHCTRROuw2LJJ9FmVVWBmPZmVhw+EMk4Dyx7+59q5ELlm
yjPjgbs9gHa3t6F6JzNXPLhg5ekOZr5Cd9gx/rqDl5vNHL+a3snK+4QplVFPZa1fILdAeisb8jQt
rMjY1545nQTfiXXRd6O0tXdZSGDQgE5Yg6yBCY9b+Hl2AeIqUpCIJjFtyOgGItvSyUGXEyFLRMnL
KaIt4F8XeaE+RN7uH+DP84603WP86z0ago6GnoUhHWHmMtyzAX4cjvvc3J9TWV3nCfeeiGQi4UQo
5xRoydm4YKzMgRkTTODMByEEt0ZoZ1W0WXormNIrA+xeEml3Imcsy/IPkHWzjhXv2scI6yKqLd2s
hf+77lq53CKmhS88JR9CgdfVVFXVODepsy2oM6bXWHuN9XHmJ7AmJSZNtJYy6mQUnCgJPWNcppU+
YYqs7KkNMTKbODUiGgC6SRLoNvnD3fSXgrTO1bzQUu/M03xb4cMy+epzePTJIgPraVE9DT/D4+Xl
NdA7a6YJ7ZXXXnn9UusiWU2V1JZFkoyhNFhPY7YZBqWtd9wTEiihOvEoFPEGYBUgKK5wZJKnvdMq
r3N0M2zznozKJVfX5fSKjSqCJVs/aTD1KT1tMHSxociu8fT+UZ3LGIE6UtP52WR0A0/HYa6HWhZE
dKNRqemWsZsrd6ky4/Geiq68pX75u4sXfnbxLfTXpapbGfXR2en4ABzXCaYc2IVWiSD3+ACMazoh
p9Zwjw+oR9KHefb48ZGmQvacEUsTcxQ08RAS1T4QVcaHaeMItUoaTXJWLAorYKozj9obqmkOgvgu
ypCvJOYGhLwajr8bYaYmXCNIDfrg+dXFRWG6jZWINhpZawgOBtXJSb3wNNyjli2jj0N1svFUvTjV
D57W7X4k8PmZFd7oseej2hmNlMEwtNGMAtCEuYOZyTRxQZxUPiWuNae+3DYVUiWTE3EcU444Cooo
3b9c9oY0aMLPDXmwut4UCY3rO6VCse7dtC0Yao5ff26HaNh8buHVvyEdjouDgCy0NrwCMLsCsIVP
87cJ0er4fTF/O1k5KCGwfQCS3Z172s3CcHhRIaXNqnyH14C+blsDmtJONmqO/jGdgCi5atGz6cT4
efQ9/A3euNepRc9a/Za3YibT2O/BfLYCnRPrfbRWamYl9R73wI2Aj8i50CroGLJnMQnBZfImsER4
jC4aoJAQJ9rtwehbleVrN7+8mHVa6OcMNxoI/I/7sKLckikPawX6/P5SlqxNnvpOtkbOKF/RrMsd
kvKQlYeqW5pZRzSzFcnlLs5iohmtA7M6nmvJP1N5eF9JaXfz+qpKIja78UsIgMJxcjOfDWMql/pF
/8Cs80mYjHpp+fnsWFMRTNA2RIW5U3xOgEcUMVSKBI0ngMNcUiUlD04IxgILORNQl+GyFsq3k5a7
s8ONJgBiZ/ML/BNK/3PxdgiCE1HhxVqUeefe42he2+LiFul6VTdbx6TcLBYLtxYM+TyEqo490qvf
euFrs0GXaQH5ektkb4l8nCJWmZSC5i4LHikNBDpTMmcJwtZkZVWGaZNJZRiRinDDwDQkm6XIVhnH
DrdE3iVgNyyTERMLnLHtmqLn99clxntvVveGx9tZSeo9seeVReMNxkBRTDC6df10LRx08S9el0+V
xory+AQvVc0cb7id7lFIGQiqH/+manqr5HHdVnmzdy3vLaSP0rXccEOzcjT5wI3hmrKgNWZDUQAJ
hXTWeQNTJ6WHyTMxcWe5TpYHQrHI0r4W0r2kVF3ZrhJTdIeYqh+4pSbyq3l1a11MLW+9mmP+5sGm
NHpKj1FIbV0/pcdrLyNduwUUtrCoybeUT/cRirSsy6e13tal03rJvwe4yy8Ns/X3UFTfw01pmZ3d
hMsqJQs+sctkG9+4UNlqQfcbp/KbeZD/gdydxTBO0uwCFjvQPMcXf+wyefQ22H74fntXVUO2iDrl
B7gjdFZYhN9r9DiAql4r6LWCR1SQMCgmsnFWJQHdpSil4iZJuC519DJ7rb0U1BgCJDnjiM0+eGdF
ZDQGc7hWsC5RB+6k8CdFaFQfcbjS+d2FRVbVDjxgdYf+bqH4Q0EKGPDy2r/DNWiC3NXExy9W0rsb
9Gz/CY0BVgIylkIQl6jSgmmak9Ui4QRmHjHqOmMEUdDwnGcxBBsSYOwoU6J+XzC9xdz+JGyUKanY
+/jW4iPNZ/fh8vtbatY/ebDvwK2VTQB41jVNFqkCh2N4A1tb4tg2tUwkvyVl4NT5ychd/JKm8/Su
QyQqt4Hnw7eUBqfkGabKeCblcRfQz27bfh/urovEiY1/JwV7xtb/8U4oZ9uEblxQbSinz8hJIZ6R
4x669tD1cYZrcAUrVKZGZWGo15QQx1k23AiXfOIhBadhPIoIY7wNQupsg8pWqMRJiIdD1w0ZvIld
q6vF82Jw6ouvigGWUXFlJQA8KBex08LDpz/G2+XVjdQhm8K9t+/2kPRL9ZQHJqUR49QBZEbhuI2R
ew7oVDiYWkCfRMAglVWaG2D0yFkAjnfUOnSgj/sn8buFaWvYWF1+PhjUXMsqtjyBC0u+PcYIq4pz
m6x7vJ5/epN521g/a9lRFl9ZULwnXrwlHv86hWEepnhRu7N27RBWb9TXPmFVrhBWe1vR0rlAbnsr
kXY1ULD6yXlH/mAPpJi1Kyij1hP5fQqKW9iN6xx4ss9d3YPKR+q2GyKMIWTuVHaRJkWZk9TDysOM
CzC+oDx30cLEZQ7HSnlqoiPSwWApUd0UbtkS1mVG1pPih60UdWfDsx/OV/uP+Nh5XyOlx4+PsPyy
kSpaxZTkHGbHWppdToJn4NQYMIOHcVZHLLpEqEnZAHXRJsZC1JHQvf0D7uLN6T7ceXBGuWWREgCJ
71f0LOKUijydXC0DlTCAKQ7h+gzedqMWtUrk7rilsuQJfNtzjFrqMgR/cMQ5Pzop4OMIteQjKqjC
cymPjltkehsMoB10ji8L2UEbAGjkcSc2PKDRWos0we+KRkJISSN8tCMSGgLEVtfeIwSIJKQzKpUq
Zw5+V1TKmsrWUwkNAcpUJZWypHJjLn97GezG8z5s6vNN5e8S4ZYI6yUPjMiM8IuGIBUzxAIo44pJ
7nVkDvP8c8swYYsnxjoTSXCtAgGk2R02NRxf/P2608R1lV7Fdrn6iwP0tW7Sxi3zoptOiTulnVCH
wU4ozzE6ATVeviPr38M3UtZCtXpZ1suyLjfZg6NO4oiCD1EFE3y2hCvhbMyaC4vO9RYe8sFybg33
Eh3xOeaYYom0C2qSu4OariZjjP+s/iA7jC//Lze+cdP3Rwfsvh69hT/fND3qJPr772E+8djYprmu
RWzQkbuZ31yNuyHov27G6egAwXQ0u8acAEe9Ja63xD3O/SCSAeAp5S0BOMg9j8mLGJTm0UUNspRm
nQyFEQL4EzpSUPiJB60+SxCjnhxSK6IpNQflyUkR3ftZwyuxvIpK/WApC0HB+nPy08Xx39w0XB6t
Zd8sGyyeFwvRV91Ko/X2XgDnj6oWyoZKUbK7nVpI7G7nv25G5fsvbl7fzOZ49BLwRUIvpduau7m6
apA1SzufqsXkxlT82/PFkEu3LJwuLHZlW9GNjZTDbbbByD7ErrWxGuhaQ/T+8Ww0tFhXDmzmh8kv
nZDzbQo72iH3/40t0j5uAIHew7VfPb5Mv/ZsmFMicmjDWC25AYhNrKbSBanxGsypyBrm1mplGScJ
w8aATCcJDH3vfFrbK0W9UKCZt906UUZO7WBgbGnfNWKzjYWg3dXGPevDVlO1vK2awrVh84mF5KqH
Xs0HOuUuxlg57C6Xhn3obTRSjXGtDUbuJXS9jcYI1xuix3ePZ7OhxcJwYDPLheHAdpYLwx7z0/y7
umVd2GMXAr+ouq5N1fJ6qF1FWr1K7bfhoHaH3JUZhoedqq/sXhfnFqkuBkfo43dUGtHg9/vqhHZi
yhf3Rrq1IBT+2IrFZB59kPBAujWP9CETKW6dyN5C16OELmPKFcfg8MxhSAkURxtNjFpSRohLwRtP
k2SeRiBIYkZezbMPjlKnnQzJ21YWOkV3irdpuoI1YLGZPPvwdWqrqjBkZ2FTsdgHaOWWx5vlZsj5
ByxGeyvtKyrO27m71SP+lLS3pbrZ/C2096bCXtl7PGIchhFJ5pEFUPECT4ELoowx2WXtecbqHE7R
wL3SLqDy54Ui2pgQvSfOsm6c9jYE+Vpl2G2/vXclXn6Hmlj5ICpM70qYUF9hvR9f78f3CJkZSCU0
cmBO5YJVxkrnEhMA1BRjVknFHMNHvEzaJwrzlpSlRGdtSSJ579Dke9h1+hCGPdi1ryKqLJ+zzDq+
5s6HHTXjix0QgGHI+7v1KXZrvcZZmg5Tlwi0xX5nN+nHaYuAEk66CUje39dE9gitR2iP0xzvFEhr
Y3OiXhGbaKKMEhOMDJxrIwLMFoFJRZq8Mc5ZIw1VLsEaEFi+B6F9f28BxUqyrdIuguweowl6OyUM
2bn5Wd8cF0/XmitOC3bco7IelX353hhaBuIk4/g/T1QqZbj1MDk6J+9hvDkwbikjiVLpYVY9U9YR
n2Rkwqc2tREbzFoCqpJZv0FmXcdXdZ3E5V7U/oy6BxILbhRuRm6emuUO8fB6MhvOAYsVuIvyOlUl
DsdPB+NTdoy/xfGzZ8+KwQ18d6NifPqueP5NQY73xGa7ix6GCbR2AQwzvah679aX750PKb8+elg5
v4d7yL34Y/ju26OPnFL86IV/HdOfW3Qr+xoxvVD9UCltU/Ipg2SVLMEcOe0Ud1bABKogASvxBMIW
JGsgVBNrtKISZpO5bCQ1LYMd1O5ghzytklK9/wAbD+cHeAeTDi3xlbW8+l8cEh/fTVUDUgbrV0TR
XSEhtK+s2quUvfC8x+jvqOPECoojoQnAp1WMwAmISWeZ89LCbUo4T8YSLoknoHDCPHtKc7Tq8PRP
S9GJOWTeLVTLEqztSPzv1jP+D9Ft591Gpv/q3afLl2s0W17u1cxezfzimToJRYSKWXhJI+YmVkI4
hyGf2RhtomNRcg8gCWOriMspWO0xMAAGGU2U+6qZTdZ918gYumBeUmwXOXXriUVXPNxk2+k24x5W
n3RJaZULapFk9EGVSNXuGLHXaX5xnUajDhGg+NiG/xZuZjANXfTYIrBMENPDtB6mPU6Jbjwz2gdl
YfY49d4kzUwy2RoqAMIx7ohgISovlVGYcJok5gmPMAsseno4TFuItw3r/zfPC7bDwl9dcbAGsOrQ
rw43iqSA+jYuSz41mgn4NCYGhBtudRnb86tTbDOsrRS+h3c9vPvydTaC7rVCmeCDhAZyllFwl6jx
jitKjA3JSxiiliAUbGIUIzt9AonAOVV7+3Y0Wb6uSIThEhXTN6oXLXcLqgtuVQ+p4vpdpZGQ65/S
RiNrLL+8WnL88qxk+PXaSL44YD8CYytwgDUe3A/+aXKr50c5tAt0Iuk46wldeMCahcdq6asKP7S8
Rtn5vRnd2zh1MNtN0pEHUS4PCM6g6hMSrg+Zct6D2x7cPlJfRRGRaE+pDjYQmMDstLFARLI2Z6W9
C5kywLtJUqW8FyS4wHXp1RJEBzVV14X3wonxqlFKdfnErcVIr2oce7IOZVcvPn1euTxuVh9dPtGD
1x68fvHMrjLnwhlmidQsi0ThHzEuuagUKLEwIAYDcU4lmF1NoTPLQM1l8D61iuY2LjC3sXTxG/+3
sI82hRIpvpR/WybjlXx9WknX3/rIbl0Xvpwvb3NtQ0ZtXcKh4S9WaWizymRfuu8vitVWtcHiMKRZ
ZdxfpfIte95Tq2N3+IxNQriBtkLq0l9slOazeRwlQCfxejKF3x/diwvWyxkSMZsgGUhEGxo6SUx5
dOV+TiUJ8OvtZDq/HM6PeseNXmnqcdQ9OwLJB2XQzJ+oMQ46YVyHIDQNMDytmMc6s9IxrVCv8tJl
L20IlPnodNaHK00bsnEwu893o1rHQdTAo8frfhyzuhT70azKyQXnqEtV1+bVtUF1kVUX41rytWa3
9T5y7/3Ra1iPU8OyxiihSbbcSc+CtCp6JlywWYBEIFKqAKORnpAIfWPhagxACMrCE1SLfTWsXfxf
or/yxvM6ruA27m/Uo0XmX+f9pxQuLPgez9n5kueXGHqb35tlwzb4vU3VsHJIVYVZGOWlwzIRiD2P
EKMtytFWbiOAIYfj1wV9VmFSaPTqjhO218l+eHV3fbLX08nN9cXP6X0JlLrchRgcvU+j0eRtmUsI
qyF46ADTNZUny3u8eU+UJ9MUy5daJOf416JBoANzkpyfFFWbcI7ZRvAcm8Xb5792YvIfHFW3luNb
nrL1U75+KtZPZbth1u9Vw1xlO+lsTKvvjJC1b60+XX1v6/dFfVp/d3D20G8Pq11A42vfIF4T1bXF
twhnv/ZYvsfyj3ND3zttksgxuGSFhCk0JgXPLeOWKxmVopLCjZBd1FqE4BX3hjBtdaTOxW4yr6yv
HYPRVraVf/26AvQ/nxS/lCkb1px/8MFnszSH5hwcDuCps/PjZ+76Oo3j4JfjPhdLD8gfYYCap8kT
aQmyNJUm0SSUJdQxlZQPznvGYIKzhWk00aaoOKyYnlOlgaDA9/bX2Wbg6TYLT3cyccMyvQ8fH5yi
paQVjbWVX3YJtYHy05L04toNS1svPOiKOCzfctPSeRth8mxPm+7uOODh7AJ6GcaLawdzCFh+1qld
d3D8r1/PzlvYMH8CFu7ElDo4PvvX8a8tev4zipiOun74gHus12O9x7MYSCdVBEiXMVd6SIkEWiZu
4TkRrLgRKHfaGQ890wBPIh2OZpq1h5nm8pCCHDsk3wAk5tJfZTZ3AUT9Ndo8YLEYnIGG9q+jASho
R8eY2PxfePQrHp3h0fnRr8erxWTVJi4p2Oy6iXf9ftnHhgG37H6xyKweP149VebrLk1I+OgxFnMg
BfaNrZ1V719PrgfH53hr1cRGR/WyVYq/tYVso+nfPDr9zGpH9PLo85NHNlqjHcgdqQTm9JSaBxk9
8URQBYIpRxgZ89RHZZilwiauRUqgjrqAPnr7gtNdsqeohU/TLWJdBJUS6NXvBq+gmVe/O371uxP4
+Fd19mt1dladneOFRkO3iaTpuii4TTBtPHaneNp4dlNIPd9bSO3odE1UTbcCbTa6aQXBf0nTYX5f
lN/KcF5HRtYG7UlzWvaF27srHV9DN1dpDiwOTYNkGHWJtinZSu2/dYW38MJWnSTM4PcWAJUfO7KT
bXnV860rog1VpE/D2EP4x7lk5qiFMsoawOMYWk+ktDlSa7LKSVEauTOGSYo53Ghi2jhvmVIxJG4I
deZuCP8ixrsw/LY4xbwZ/qQICxS/fALWT1ecFh5+1sMkl0/05tce4X7x7BoZtSpJawUlSqH/Q7A8
Riao9CkAmPXGY64bDgegjvsECJcy55kVjMu0tz/ETs70J2EBcJf3n7un/mlY81bYwZFtPBZWLF+C
uEX/e+I2vRO3ufHsbZOeg7Ea3w5R3L+oET8pVCe1oNgB1YQH6Htw/EFqPrVInzZAV4HjHn316OtR
inMaTLbQmDcsaRI0oCoXckw6yAgDpElqxUVWMEQrrMCsuhpdYpUmnlFBDnd8rSTj4PuT4sdGLgxe
PCm+x9D4H7fzYeCzGNz+/fFdebFPaW9w7Nn3i/dOTdppHaL2LBseQ4jcyOBUzNYrQwmXHAvM0uiM
YB7wF74ZiY4WJpDpfdHYkkl/bCQmQ29TtuTT4/VUZEteLU7Yk++XZr2SV3c+eEqPD8hK9nZSxOFs
PoTry+im2U24BEDnyoqgw2kxClfFaJhmxdvh/HLN8bRNaJO9bRscur34OUHTXVrkxMff+W6ayD7a
nje1+qNvefcFOHuZukvDBdhjBRde+5Q5NZrzLCKmAgtOy2ypyUwLmFKpJE8wKiDL25iDslkJJ1tl
wDb8jkjJ0nGn4xzYcuEWvUeqGP6R0++flZlg4EeVFBL0rD7f1jAfnsBbdpXPRpQpbXam7pbb5ZEf
FIja66E9kH1EXp0iEaqsIjH4bJIPWhsC/3ENcxqEJ4BcNSBXLKFpI5wFUECDALCbhRFdZM5uiNyB
m05PivFJ8fN+QZikkdpmcfvN6vawSmQz3gyxBPwMHWGs5ml58KaMxfwZd7fr09PFA3j999v72X1u
7n434nFvHgL3pxBypsI7TW1MHGvsEpkMpSEkQ1iG3gxjQbHArddcOEK9IK5MjNMuOnNbODQjNL/e
GaJJTsYrn5xNwfC0FgtLdbi1SGgo0psZvx8culk1hPU+UUNeqtWVG/ml+wVdWtCRPNczVXqbV4U/
37dJ/W1ui7pMDvd96swjAfTqThNAMoyh4/BLkm10yQj5+Br3WQl6NcBduoOgT6CNN+Inzw9Jw7hJ
UI9pe0z7iJxBMTkIV97C/FhKvIgOZlRxWJscAFwTnReaskjhlzJaa5jhyL0OMYnos+0qEHFLnJb5
207QTrqApDseQn+X0WgweFf84Tk+ul5q+riPPuwB52MEnCRSphPXnHKVDQBNG0yWWUkeObMiJpg0
miJ1wgqNlUi5TV4DSuXSKq32jz68hWsrpkWAt+OR58ixtzBs+U7NrndCrH1dZRYAsVz0m7nkyi0X
N02LbvDCeC2VXJsM4WZ33OG1mzo/GbmLPAk3XRpJd1hBH27QG5ySZ1hR71k37jb23rzkoh1tYuMf
wL5nTH4Y1yBxiK/QKX2GaS6e0XXqekDZA8rHs/hwFlSmPFEVAxdUeAYA0kYVJBdJuxh5AFgZgoqE
pUCcUU4kDlNKgoxUuMONpOtSd9NXuryIoY6nvviqGKAPj8PENwIP4CeU/tNVVQp6jI+Udzaw5IZA
78FkDya/1E2PaJSSMSqTfDYGRsgpo8pAw1yJEDVhwmghuPbaJhOzEhrgJDwYmTRsb+vlbVxbLCyW
cBW4dlDzLauY8gQuLDn3GFh3UPLu8SbzHh+v2Rs32LeN43UlP0qn6wXJe2LE3U7XI9CQQRjAXFxd
wdc9u/GLBBldpqh48Ze//PTij0eb6OboL//86Z8v/nv7hjqgIovoqMr9n779y39sU/ziu2///B8/
3k+w+tiplV/8879/2kHuf/9//zy6F2WKj5v/+EM4Ff14AzLrTr+i65tpOt3RsL+Jr9McLly6m9m8
dzP6jIQ/E05KDtNkSbQ5hWicNZZ6puHU+RQlSRKTGzFFTAxwWHp5OgLID+6Zdm5GZrcSPZ3Ei5cw
LdMuJSKTn2DLgn+KfRKq+jw9vebaC7v7hR3mTyaEqKR10iE4oTR0HbO1USYFc0REIjoGJqUmIRMp
QdBhsSpPsxQduPc0RN2q6OrGXj3bUTy1LKn9BH6+qe5teOFs7OjvamGrpSfwBv48f16MdzzXUIVR
ZqzpxqUQ6VXjXl584fIiaO598twqYk2C2TTU+0iNzdI4IWAQVCSqhMjO2kSFM5qHZETWlDqyf1zL
plSY3iIX4GbN1tM10TAYPkHJMMDqq8dbKWe2hMN4u5FmY9jakzdP3pTpZ8a7n9sQBl9vJI8soc3X
D4mjCZcp/Fy8vUygiU8bsTHVXk0RHGgTCbq5BokDfxugyPj35fzdhHlZV+jtpJiVMzlDd6XxZL6n
7r47oCYPp6C5/204mw3Hry/+MZkN50BOx87wlY/LKbrFnx+QVKYTrfyMVJScLsulmvMDFG/WFU3V
NAE5p+aQOeKfqW79/5DOOzRrd/P6qvpzR/PRgpcwemdyM58NY1X7eNE/8MN8EiajXs/+jFxEM1bq
DkwzoZTyUnuAloZJY5OTJMDKkpwPOSIIpcQzSeE5qyjzGkCrbaVnW3JHOM9/jufwtzACYTYEpusy
SnDLR69Lq5j4ICka2L00s49cPE3cS+IhoUe01/17LP84a6u5FAJ3VFqN2YJgXDqwZNE3SmjmHdCQ
YJJpVMkRE7wMAPpBZNsE0xg9v1v3f3nj74/qWZe8g3eAad7DzzsANu/ZqjJDFYj+ngFKf0+rba4n
xeAdnr+rznvdu9+W/vKNdRR4kABCSiqLmNB3BNRrmqUXTnPHMheGpZidFkLlSKkxCb0huWfWUZ7b
BdVs8yawJnAmMuZmAdwBMucpMufpijlPkTnx/GH5I6pol1VVXNRlgZKERMHN08k0DscOuLfyaxwN
MbFtCfxdre/up+dauhsaotp9cTUZzy+r/rvcmv5z8lOg8P0nqWLwXzfj9CkKN7y4ng5HfQGFHpz1
sv5+WU8F94Eo4xkTgkRmRKI6oZpMnXLWG+NgJlN0xpLAcKa1o5GBwuyANN2BS+GWABxUx+4q8UZC
sNXFsmBtxeRoaNy4UUqdHddfput5wubLm4ONuz9MfqluHm8nEmsUNtidaawSmR8HGX5mNQh6YPiY
hAVIAMVAROgIE0UIsT5IDLyGjgShkRtqmPA+OeeFZzHDDLigqA0pakKV3BsY3i0SSky4KRJe/a4U
Ca9+t877wNyvfocyYeeNpVDYeXchFF797vcbOLTcly0vVRJhxx5Mu4jrW/ZeSoKKMmlUgEMHwLPg
pIjufbs9Frs7y9A0XcEQL+Y3152WERhUqXHkYn9FlpsIePG4ZV7W6vVOwlEGy3qwoqRIlf/rk8LA
/8ftstbyRiN6/fUDCKS0zn6EAUO0/sFzTDbUbuqaLYk+XqYHt4/UkOGwcDuPKSVFTIqRUG15kDIG
m1nSGaYNJlEbm7gXJiSTrM6eKmqyiNR0E4DdlLID5Bw8bJSDLZ4X1b1Zmq/u9/HVPcR8jI4/FpN+
WRmkY4FEnSRxKWkatU0wU9RmFWLgXudkOVxnMCClNfU0BRh12Bdi3saUdSTLrUzZjHQZwHN72Byb
QK/qtsqrA80PQ2lYzNPJVQP1lR3vCex2p9CZhLkbXfw0ufg2heGVG30i525GP7ZnN+tks1q06JGz
PhNtLww/jDAUXArKTAqKB+NM4JhxXyWGgYA8Ba8saN9WR6dpVkolT3WmwXuZhSMut8tEa+Xtfngf
xO1upYeddxlxJjtMgMUWtFYHO7PmbnmJ2I/st7KY0fN7PWpa5PMlvdLYK42Ps6SCNopoSazQjjEJ
fauQlEfLZvbQLGFRcye8ctTHpJjLMN0eBm1A9BIiD98RKUVulWbyXSNt7GjydpWB9nL4+hLOxrjx
3dQkT+uzt5cwqvKVb56XDze2La6GEZM04M2n5b3j4quvCrbm2I5JJuG58+IPxbuNGJW6a2xl2Xm1
OdJ875ut9yr68bWn66/tqCg9q568v+MaisMbv/UNmL66dC+a7sODgRLvtOcockygQfLMtLXR2OhD
1t5lCodBJy1INAnORIwObzDQos2+yvFKAL3D7LVLL5yKg8nidE0GTdelULF8qZJEg4YoWg9suUUa
FRuRNusCaXqnZJjeKZSmd4ml6aZgmt4mmvYiYZd4alvaBhNj4BdSXJdBMHALM2SAJjhKCAyrxGuz
yRRjFFpk37Xq3j2hTmtPDBDvl9mATvC3qXZP8JCWFyqNoLy2A8nuDVxX/TR6WGu7C8jdGEz1uRpL
icXvGxBrM6Db2uxkILTaE6vHwm/7anYPg7f8Xnjd5nmvXfTaxeN0hldSaIm+8A5Wam7RpE2idEll
kxzF3MApGKlFYMJykQh8GGppoiQH7fTd2sUPk/l3/7PvXtSssmtXuYD/ur4hdQaLSxm+ip9YKm3x
JC7FozQewPUySvWv558Ih/fbVD0bf8pyNTSoELhKhAaNbpMUGg8SrsKQHMseJpUlnjh0yCTg9JAD
ZSHC5IpE/UO2qbb4tbFXtR+//lvJr91sYS2y/1aklSUVsaPX8PHzXgCUkd2xkguUe3Hl3nVqd0YM
haZcdIohgGjQc8cC9EEjNJ6UN1jtd4PlIcR5C3ijzzu3O4uGu1L9fyuKSt8mi4M576ruGV3Y7M3C
hG+rycJJK6u3taGQ0h4I9kDwca4gRkkrKWdYiDcn5XXIlBvnOc3EpEC5VMZHaZPTlAeG1X1TBrgI
nUvH9T1RkXejwKaILbPKL/MVwYULYFM0ZCxvre5UbIjLzbBKkXJSpTdJYxAdUzdP9Ru46LzB1aZu
bh0jrlrqoWIPFb/8pN2Ecy0Tz4JHC7MGM8OyyNZ64GdQ65SOxBnClYRuLUBI75TBsrMiWZL03kbb
nUw9vYOtpw9l7OcNxp7ey9ptyknAZ3q3HEmZChgxJjQ7vLq5Wqs0UblKIVl7os3bwi9//n7YrYPD
0WScjk6K5sf5J6gptuj/p7eT8uNymloR0l0xsSM/fB3d3CEZ1UN49O0bkGKTQyjqAWMPGB+RMzsP
ThETlFBO6GxldOV6YSwnjAsSqaOepKw89Mh4FJISoygT0nvHsjoEMNZScjCazTeyZaBtAV1k8U5p
YKA9qOtB3Ze/E8+450JT45mPwQvKqQ3MS/hSpLcsJGuU9SZTlgwQFBPMrKGKycQ0wLoWkZANxtvM
hrHOe8/XeO+QvI/1xnKzpBdW85qhx3CLqENG2F07zAm+wS5zXdTIYn84cXQ9nxx1knEC/j6AH69a
9T2ZXnXT+Qjkxo173SbVxtFofPP6qEdSPZJ6nHuwJDspJWM+QBsRExhZEN80MOOUd1ZFw9Hypq0y
SdEIpDiVqQSMlZUy9nAPz4YIHIDIXJrf4JiBFn50dFt68tHihZ1pyv+9YAjByIY7Zd1q+fEUPyio
+acFXTfL4e0eu/XY7Ytnf2zKS+U4TIsWnlLLbOKcCa+4jyJy71XKkSZJtNOJewX0CA3DxUeya7l3
22RyxG8rHsezDRan2yw+XaTAGawYfN2D8nb+bpR8XWfv/fd5kXzAiG7qwjxNa0wIjQ3Hr/dEgeL2
lLhd4j/nQ9iuERWOPnLKbKADkyNtU+KOPnbVrKvx1RW5vtompQ1SFT1M7GHi48x2JLXzMDiYKEmk
9B5LLkoJ5EvGYSyWpgCD4YYnZzl0InEbxwBITJw4mjpIjYYycjBrVFitvH3oTnhYLhzHG6BwdjY8
R9NA2Blig7+ffrJQmh4G9uz9CV34eDbJsCAdZSIYoi1JlDjhCFPK2qAoqIORU8a0M54YCePLNshk
RCKhZZZbYOJwXDQteMh+pLil4EzNyo0XanYeLPn5eP3eNk9vRaAcmB13EsLNtBxeVaG12oBdIsMH
AEN1CzAcY1YMTLl7sbBEdpmc7Ojbl/8ocAPyP1+WH3/87uVP5cGf//5j+fni++/Lz//708ujNlm3
yobrRuFj2W55sGgcPxcd4OdGJwekDzv68buXe43r/3z38sd2A8OW2w5ss5dDRva3ly/+ts/IXv71
23YDw4bbDmyjkx4U96D4URVzUIoDvCWGBEKNV8HI6BMhKiviouKg/cIKSmiKsI4KqymsgQT6NzCV
7r6Uai9ivBsPby8Nd2ZUG6Ad5M2aS9P/Dq+Xr5wUi6Mz+vvz442ca4cB4Y9Rm2oyHr1flp4qXbWG
oXCwmF9epTkcwrBXU1ZXrXKj0eRtn+XnM2Ip6SN32psUKVFeOxvhXArNjDACk+zqqLEGquACNFBp
QeX0gceoOe41e78/EL2be7ZSnw0BR+7PPIfGlVynKXRV5UFz8Y0LGNu8iHHe+DMeb2ZLm+0JOfUt
OY7G8WI0gWUIBjRN1wm6Gb++wIJv6X+6tFG+ePHH7/74p2+//eimQOe8//iWUNemz75AVo+pHukC
YHTkWdpgpeYyxxhNZNZxn6IxXjBPOdNJAwtQl4OjhBIrmOLMJBJgxegi49AdAhB3oxbgagyLQ71B
VYOleI1u42e0XCd+XpkwqlK35+Xl0dblnVYPuqN49kYJXXpLfW20dM6n9bYX2kfw7E11BvMOvfzb
8+LNjmLb8fpseH725hytqtAwnpZv1S+vv7AjVdFGG+heX5+W7580Wzxfx5dwZ3wO//fW1t7a+uXX
mWHWs+AT99RTS4IPMSSuLeUxU8tzCsI6H5RgVFBlnCI8REspTLVNlLn9UxfdK8lKu+mreVOU1Zdq
WUa2ZNnTXZKsvFi9uEOQwd1FT9X9N3fcfzUvbbsowU4b8ut0TXqtPY/EbkmuU5Qy+NLquVJk3fZe
Q1qdLmTVaSWp6lduFVX7FLVYmo7r76NYfh9F9X3c4Nc3g5NwWRVXKwPKsY5483acjF/dMELtvLh0
v9R+qJWhuemYAK+Xd5bRQ/upBJTeUbH3h5urLlMnf+TEoPwjA376ccH+J0uafD152ydN/mxXmhgd
NQoRNIxLSU+0M4HBWDMLyWjFHdVMxSx8ZDEFrAWuXMSFR/GgVum8f91LevB797AqSdXtFtbf3PhN
SnPckvhh+PPlcFRuTvwMkzA/Ot509xkcFS+Bgkt8pvhbukzTt658ofgL9NVyw6TqeNVg1f1asxUd
W40fsgH08tINfy7bfp+g8XKvx43fu52D/da9nUxiOcA/Jmi7PKoIbjXWstNGa1XfqzZLCrYbPmSc
/+Gm19P6i/3HdPjejX8uB/u3m9nPbrxrtH+d3EzLAb547RZfwMs0vxy2G+ui40Vzi86bzVZEbDXe
G2t6Y80jWl609gmTdATGc0AjfGYOdJhsbZY5aIr7XJxErwkLLgQWDCWZ0cjQh8RR0tkGWL2uLO3x
dGWQZzv3wtIoYZ1k+GCLVFHwTnm6Ydpfa6rfFev57FMYDEDvd9H4ZGL0hGlquUsmZ0etIzKRqHJM
SiWuk+NBamclTCt3mumsWRv3rL1ZamuDrOSop+05qsutsvU/ZUyYgfpzpR232Rqj6o7y5KU+XiWU
+7ClQBo5yxoFEMsyhlvJZ8/KlG7UVJnbmMRUbucnBeY9K9+EVhhW7DB4sUpcZqrnKVakVOefJBnG
WTViNLec4bDxE/Opne8Y38b9j59D5OyohJ/+CKk4StVHwEvxaBfBR6+PzvuEHj2S7Fe4feLQgs+O
mxgygEUaM4M/dpjRHCSVgUZY52BmkzeCE005kOGVY4bJQLIEtKm7Kr3eEO5VmqeTMuZ/CSJHeIGV
Ofrx7hk5rx+AoxobpneYJOB5s1T60iReProZqYqms/oe3dhR29FWvVKWd/o6671g+NJVTE9oAEI5
VR4dd6TDBOA+ex5E4JJoyRMNVirBFGDi4NEJwFKXqc+AmV27Muu3s/+q7sdCAmwLgOUzC7ZdlUbf
kgGbwQwbYmArnmFdEky3ZUHxgCLrWA6kGIMkAOWwSpA8w7iFchKqwhqTMhFK45E9AbS+vX7exY/l
zleKF3+6dNMuPcr+Mpm8HrXK/dFRzpMyoVuLbl1HqVZaZ3l59eodIX2yk34xeaRhbt6bwIlSLnNK
NfPGQOvKiohxq444S6KQUkYD0NJYWFwcl4FFoWEOhRHd1EDfIQWbbmVYOelfv64WjXCJywI8sI4b
q8uXW6Gs5YoQLu+sKXd5Fi7Py+pVn6iuel84rhcCn0zVBL6OESilzAkqWBBJcBs54x6gZRZK5JCt
isw7TrD8ZWIhcwCcTmoC6merwnG72HyJ7WpOn+7k9elObt8R51oz/Ndb5dq2nl2x/Tp+BFhAjjqo
yTatx7oZCFvFJrQJh6V2J35M7+bY7sXVsOuKGAN5UjBSWiN1VdPh+IAyZVgkrLKwMtLNbvjSKFyZ
ifXxAdXH6hpqKztzNyQurde10ZruIlO0IHPZ4MoQTvu99h67PtJgUxatiyRkmoKiARqFPqIgmSmv
M4w4SFidssgsuaAZY9z6ZIRwsGxlYejd2PX7O22jG3K3Efa2WSqtDhJYPFCbSVaRdYvbV3irqtO5
ebM0lMR3J5jhfj3vPr62mecvviv+UPy1qN4p/lC5MZcPFqfFX7cTvTxz19dpHAfQ+PG2XwBuP/YJ
YHpQ/PgKc0jNrXLEEiWUpsoTnmGqqABRIzQNBGihShIjmeAoVSx3VFidvWOK5r1AMaLO+6VJs5Bb
XVLjdmlS394tTcqb90qTZUrBUoB8c5csWcLpTTmy5QxRypEDHRvqaVoW/MDgB5iy8vjntbzUG/G/
+0FsRu8w0Xacjxo9DipIrEtARyuIff6wzHsHFW1DRHn+kWMBzmqc3aJf9VuOCRjDn24fFPD5htjy
EBhPxhMXJc8Cy6spGFSCnqnLGhMrUA7ynXIbbeAxAD2Me+NshjlxrYICGLvDlWr+/jp1rMRXflOV
sFHHH99NqFauj0Qbn/POPKrQ8FBVpixrsT94+L85kTOcDUsXj5B6wfP5Vu0xVoTEHPSpuIR+OSi1
mQUFR1pCt4EFGT2ot8IKyiKOJ1lmBUcKG26sewkeeXt6k78Nxx/MdXPLE5AcYAPrJPQRXScruHUf
ZezTALIKF9pOZ471hsLeUPg4VXkcCknG6qCN90oL4yTD/S6XrbNROiMc6PDSO9DeoybB5IQ5XbMX
IIz1IYbChXQduOn0pBhN3p4Ul8PXlwuj3dtLIBUvF38orzfMc1fDiOo93HpaDPAeqNxwdlx89VXB
1kx+0PQZPF1mBsBjfPh8c4O7bGCZHLraEmu++4dbX0USnpfkPF1/fXsXHTspH10zGS4b7g2HveHw
i5c2liYXlOOeqZyNTxyGaK0AkZKiBXTnLNNllLnNjGVOZXY5CNAqfaaWeNUql8lCsqBgqeTKco+7
Ei0D5N5vio1798qXr+GBzeTSO8XMjkTTS1HzdbG+A7/WyB/ubGNN5my2s3Mnfyl6vt4shLfs5+vi
oC39halxkXWwSmld2lhLU+R0Mi/3+qE/935Pk+PusKpJjBdVNeM66KzjSijw59PKOTOkT+We2VkR
vrYOqXHeO4X2ePlxrmDKOpgjr7O3RkvozyghSJBYuQRu8GDQKSxn7pPD3LM+J5mViEzrZDM5qJbw
luhrOoIuC9HfUgJvkbBr39J3y/bqg6dVmsDzzQ3vtYr1PXTtoeuXug+SaZIMdOGgWNZMWQZzxZOJ
wsMZE4zjdoikOQUpXY6OJSswD6knCnOT7gtdb2Pyxa5xxZSvfvfqd0Vjz3onnzc2q0suf15yeXNf
ejeHN7eiNzl8f2xYV8ErI+1XueYAeYfLKhsdjBTIjuldUY23WRyljfsn2x0+hA4Dk3wxv5ymLreN
6LYdlGybIvcGU6ST9HF2kwIqt66YFoZk2QVVp9tTdbo9V6e8xWytPdwjzx55PqIFSAgftSjL6EXB
HdCvYOWhmLFPQoMpOcuil9wZB7DTBON1Msw5QtDb0/puwpGaUnXgTgrfKLFXBoh+87zwpcpfHjaL
582u3GiUyrhUV0e+otnD43OufMXf8YpfvLJmWW08ED5VeFKPS3ux8AlNqknDEacASz3gT261SMD7
hKVglYUWszdCeQtCQFubElAVhbFJJphGvavW5m5cusH4/mS9jl5pvyyZ/7hk5epks9ZeUwQ0blTm
z0oQ1K/7e173a69vWj2bYqFoIt6qoPPibisPy9LWubBzYrYonAnMkuYB1+6JVHcHKk3TBdpFgenK
z/ddehucVu4Gp81UUad1iMzWFrrdH4mVDWOrp7rRMls03MV2P+aoOqXQ9ilTdSqrbX8J2YrkZWNs
1WAnpJIqYxbH2RXlfFucGpgMs02zbkPzemvNjswa8V05YXW/8pVPfZgF6mM23S9+n9/iR2EEXPFI
dKaZOSuh9WCSJDaxEDnnMkrpo3XOOwqDFwYwsSY58xg0lb6Vjxjf7QN/5d5dzDrNdn92Vua4Y3Wu
O166PbHtrHH8YR7iJwfShStKnYOvTDN4EGHdmBrOzlg9U+UninbMbHggbcz08rWXr496twulZLaS
kkxI8M6DaqE81zCFAnqBo+wFDdTQlCll0YHKQVUOMH3OENrO+Z/vrggwcvM0hT+Wm+xQJXk/Qpvx
9INadFuASk7FMyrJ6l8nVQfFARRRJp8p1aCIfhCKaAuzLZP0GWcNknp/296K+1hrrGRunLFSK0G0
lj6gCZf5CGwrieFB0ZgU485aIwLjFqizDusYWpgPGg5PXbpbng6mJ8XS83b5yBSfKZ4XvHhS8GdU
UAkHU/i5XDO2rj/fm117s+sXz8fEALFameB4NiFgkT4rJZcm0GgcDSxmb6gyMWmenSQRxuiUsqCf
SiCU7Gt2vZVbLxcb/OvM97xgTypOfTJ9crm2lX8bl+5r+yzr0VVtFAvR4AC/Vfv2C9L2s4RysRPr
/TIZAQ65CDe+yy37Niqf7gIstYiMMl301w4d9tirx16PUmZnIxK1IlDPlaZCUgfqLBwkY5MDPYkp
uOi8j1aTpGLImQSqHMg571IUvJsd9IaMG4wWiKu6iDEHAK7Kn343u4dVj9DJhXLrLEtOe8p8sMYK
oTXVKaYgUkrArtkYlj2DURtKWLLBs6CixFTvOuwLqzaZsMRJO5iwiZ+q2w/DTXXTFVKCTvdESbtD
YH6Y4E78T9Mh/GWPugRK4oAQb/1BrEwtoBvvphDvwwk4pT2y6pHV48yS7LyOgJGsJ9wHQ1K2Gitr
eBDaoCTTzDwTPGjOGKNZsKyTT5RTzYklLIhDosjXpeHgh0aaySHcxYSPDYfBWpaf0p3uhNDKRZk5
juy4NvgBE7th0OUxrA3LM7YZdY4vxMnb8XYz9dXyVQZtrDe2uLLVYE1zTcjTZVM9IuwR4Zfv32iD
yph2jOHGowncGZjPHOAnWqkJ9O6N1YZEDMkzTAmerYtGMWWiVnsjwi0x8te1CBrg0G+KxqU1WbLM
pl6Jk+kugfL1zsuDNaHSkCl1qPnmSwu5ctuNwZZs2RAtO9q9Tbx8/ZConzC5Gc+rkPA6E2XlIYnQ
N/3PzXBhQJzXEz2DZ928CG5c+ISxTFcpFm+H88tGLvhd7+0JoM1OAF2RhN83Vi/qvMo8hpEffWTf
nDJ0vUWnlHTWa5saSlT+pvPGjftMlZ9xvR4rGUh9HkTUngH0hL+ERIJPMGXSeSmJ9I4RpuBXNJrw
SChxTknKOOdatnNW2e3K/TrNL+aTuRtdNGQMyC/8o559UJ8V8ZGzsckDbAWdSDyqDtDVjeh19V5X
f5xiMgdFggtaOusdT6CkA6RWIacQhRPCaw8ykzHugZKYAFETbRLh0lMdnIp36+ovYrxLWb9TPg6u
TorxQnf/CVO6n5HN8HaA2wBrzzcvX1WXd2a+qO41tHy8/2azyY30F2XQPAbMF+XDz7cTZJREng3P
z96cr2v6y4imIagMb1q/VXZG73xtuPnaVra59efhCMdYnp2WZ6gEwGl5dW2n6aezq/Oz8SHZ6LpA
Y/+JaQHugGNV+dEyd8Dkpiw+Wn6VPRj7fLL3SuYBfAVDmaTCZQ96ueHJe2EC6OZBaeooDSBVrIjZ
CJg9mgIWpGE2Urq32n6fQBnXIYSv5j893yVOnu4SJuXF6q0dtxYNVjffrDe2uvlqjiLg+fNKgsBn
8xaQU3Hnc7K6WAmNb97s9yA0SXc/OSyajy5iIzefgs/TUiQ8haOvvkJxAOf1o7dJgzZ7XivF/3oy
mw39KBXLbwavjtL49fyyGBezm3BZmQGSg6MythJeT+/mq3xys+L1FMvFTfHBMU4pNIX2gEkxfzsM
afHW9TT9MpzczJZvepAPozSbbb93tZ8NQZBbgjavR+iSNVqrrN5t8QssYka2IljOqnJsLWtibDa8
s5FDQiDvTGt9tky235bmVaO7WjiA4KNpikcnxZGHPvET/r7S+Gib8qP3aTSavD1qQ/dm29tN9PFE
fTzRI0yixTi8B0oG9cImSRnMZ7QcOsuWyqxo1AAIHDE+2+A1SxmzTousklIGh9bGRCN2x2uWIfYX
PHYotNW2Mebhpomzs7OjJyg0dv/C+MYPeh8fePQUnH8QExk/wGh3+5/FHaO569Zds/xlN3n+QTyF
2ME8XxO9HPOt5+e98bI3Xj5OR6METUquHfGUSWGNMglmUcCUOuZU5l7AlPpIFHRAuIuciaSg/2BC
zlp148K9gBClwfKkmCyMh4vrpekSWbUq0z4ZNQwItblh7eK4vjidvF1dnByf9z7gvcfP4+NxE6FH
GRmJwhhDmCCUmSiSYzAaFgIllAofMYdLopxo5SQXKajodMDsZ/uaDhtcPD6Z1K49ayxcdMHD2Oqq
2sKG6rGHPe11GpclaOEyrwsoYP7c4fh1ZS5bGLrcDNHNnjatW+osovPORZWtt0t/mNpPCL5qYK2r
KyC9jctIJyFyRyP4Qm7c6zbOKt10/HYyjbMWvfbxeT24e6S5EahSKpLElfToIs4ByCmeQfprFWTU
SlqtjI8xUFgcYqLZOMqVJYE6qoQ9PDdCUwBiFvXltnC5xVQsS4Qtd4XwmcbW6+Kx6nNZEqwW/+XV
HsL1EO7Lz44AQMwnmBBntDDcMG41jiZESi1LWN4rUEU4l8IA33Huo0zZGsos9aqRN+oeCLeLXxFv
Lfiw3DPd5NbpOkuveLWB1DZYdQ+YVjs+l4016h1UhbBaVDMQ8mNlGcTkffKkkFj/GT45JswjpE6O
emh+WGq7qflqgCAFPxx+BCY/JTv3RFWLFA/duD7X1WgxpSzFzLe0SjnILNK6RV+b4gvc/JZ9pPNo
4nov6c9YuyaRkkQ9FtOOWVMJ44ER6WxsDqhcZyyjHRjlnnmZjJU+e25Z8PCH571utwW3O4DZO/9+
NBkP3fhiBpMzTdPJZN6td/T+YcPPqGJMw98QocpwbT9yAhj6TFABsy0V4xgO2Uk+VNtm/H1JlV7h
fKyWRu9cZJZHoQCZSm2MTVon5lyOyQkPTJm0TMSZCIomIyY6C/+xoBOJIR5SzG+nDBxUPnON+OXa
iW6jQF+NUmv34deAYuvnvirYs8VVBpdfr5TQqubta2zqNWu0NW6+/Xp1vXq/cY7hhdje+LhYhifX
hLzutdpeq/3ys81znjg3zkmsAAjNKxEIx9LVitogOYzIAiWAkggNQI2Cp3nA/UoVPazw+2q194iG
ZVByfakMTtgZmbwKE16JiK9AQKwuL2XE12ulsQe1mFhvdSUpQFCshRBX7axfWomLr1bxxgt58fX+
unW103IFDINbHtWEFDgjs+JmhpfQ7Xc1ZcVVAmgT91S2d5cOHF13Gg7803c/vCz+/PcfCzx44E7A
w/cf/vTix2//8+9l/3jYhoBOcvoc/ePFjz8Vf/9z8dN/fFf819//748/fPffxX++LPByC1rsZ6oU
/3gDAupOvfj6ZppOdzTsb+LrNIcLl+5mNu+V5M8pDRkMgUYLU5RoFEkQQ5yMhgajQ/BGJ9ATtXBZ
+GRgNZDG0cg5ZTokGahuqSTvTlJw6aZXINFCx2a/FsWH2DNpmZEa9NPqt+wmx1cLAojhzX8dFUtt
oRxLoTW3CofPlenz1veq8iOtBJKoIdn7JBLzORntciZKRKqN1pEykzCWz3nuHY9cEhaM5AL05CA8
SA95SIavpiQcjJvKcfGHgm2rxbtzey1ugvI6Bli63mgZAtwrsb0S++VDm8gz1SxIEaLz3lEedeRa
kASUK+GIC8Yp7hiloL+ynDEmhzEvPBXZarOvErvFtKUGWDLtN8i06wphtfm6nj9rg2EHOzj2uF0J
z+BG4QYzSZU646K9YlYV9Byf0v20Rknu8J77Z4dYbYDlHk0Z+siq2o+4Ybu6aMr/2fEBYSWd7IU+
lM5W+zSfklDzsOQ6PUTsIeIjgojwj1PPIreZcE4SMyxLSaN0IeNYERgGnhWsNjlab5LKLkruY+CW
CteV+94/B/Ob65Pi3QIoVp45a757aZTQMweeawBEWJvw+vPnxbuNbCqLFqrPTbe+8mqPHXvs+OVH
X1lnk7HcGcCOGlCiYTBjNLkUsGgZNU7HnFSgREQjgCJhlKVUSm6I1Y63c+tb8fGyhPuCEcniwgYz
rxWBx6ytC4beKCS/m6mn22xdHJYDdRJCuJkuM5648SqhCfoFAsn7ZjKVu4PZh+NZms4v6la79A48
+rFKYfGXMi0GHPxx5MLP2/kxjtqkOj2Dp6Gpuumw1n5odtJJgo/qDjb7xv3idpBeB6S0GsDiHWh1
1X7jYt1VJwO4dNfX77HRmYs7yB+5m9eXrYiv3oAGly0vr1Rd9Ni1x66PcWVLVljop7RoBuozF1aA
zHVGKA2N5qhdhGHQ4HXWJhtKcw7SqNIx0ivdTVzxujQfYGqpk8WKsazNianvnhdnv9RrX7mUlBfx
/Bc8G9Sv4LvzPoq4x6qPEquKJKhPkkVlAYwK7ChGpSPROhkVNaPZJ2uk4I5kpjJ0mISKoImK7LLY
F6vu4tkVyyKkfADHNiJR1vPL7WHkrAhqYk2foKO0Hi1cVqLCtveEn/wOk+dwPE+vOy3JXid+KxPp
nxT0GWuRfI11mc7u/CMbKMugnGdVbj75jD5w2L+9xPqzYWndCamPHPl8k7d5TRWFkfhEMuAe5Y0G
Oep91DwGTklySVOY1ew5NTQmw62HyUxSB+Y8a+UUI9UdAucf0+FVmmHG1y799ORHljFtdj9ENx22
6LGvE9wrg48VOnpKA0H55QETZkc1k4EL56kRWkmWDKGRAm7MkuhAGfSalYkenkw05dDVRkZDzK3c
XsJ8ur6XAbebWWjWNzTw5jfb6eTDBGZ7fJPWc+I38lwDAoFXdyTFxwb/vU6NvyPnvAcR/vPq8o7M
9Ej/0+ebWyjzaa+U9krpl1+B3IYYmZZOB0lNFBg5AiOKSmSuEow6JyQHvW2sgW699CAOonXSkhyo
b7eBsik/pk0JsraFsiVDprdIkektcmR6hySpBMl0S5QMallyXAuT6W3iZLopUKa3iJTp7ULlIbs3
jQT2OJP1+ayRTn5RoW48GZ+O02v4I/tl8dieevXuAJTZW3ddFzT4sFWjWAtEOKhyLxx3AkW3cuPS
Fo7pA6rRc+e4K1C8NSntZqWclrV56fFyj5cfkUtpyJRmHyUQT5Lg0ZuQuQASXGYkSacUrGMuWCsA
NyeqjYA10DLJApXBxG42T5oyc+BOCr/M3ZWusNSqq3O0wqGvDj1m/4Gb/QZJj0UfY4yb5dk5UHKd
NTy5wKh11sacvZJZKuKiSMEwQKTGmWiNYpzppHPMwQtm98WiG3zpFym6FlxZZl0tmRKPljzZ2AIp
32q1B4J9FvO3kwVk2xOM2dtSbw2vhv+bFns8XSKywQDL8hyfFAM0+OMnaN4WP2mJtbY8kQcDLIKD
D/DGg/ipsaHjFsBl2ZKoW1p0reuuu3C4xkYFNorle2qyofGqN0p3DRBL/NRkLZ9k+GmwqVYjXDQl
F00tezd1752MkdffXWNCKV10x3aN0dRTLRtPln8GFptqNcZFU2rR1LJ3W/fe49Ielz5KOy7xMGNa
BieEY8Yq4VUSxBInMg2GqJR9Vox4wKqKJrjgmVDwSFTCqdyRU8/W8jFA9rmY31yD5F4csgVYBTbE
FRAdQweD+gNaqABtaVvBIzSv/O/welA3gu8fV3dXV5bP7Ort+LgHvT3ofYSJaaPNBCBvsMIz6qPI
yQOmhY6p9JZH3Nx2IAasU1xkwL9S6hgsCSGCPkv2TuGzN9OXJssm01e/92P52uDZhu8XHVbAGjpu
GUK5GFhpIK2Mn4izS6r3hNlqd/jkOL29cuOL0tTaIcLmHzndTYvYS6q7qTK2vxcB7bFgjwUfpeDn
OA+SMsmBZMod5Tx6KrPwNIKI17gqZM+howwDNtQ4iVPgk9VCy0wO39NvyreNLBaLOvPjzdLvtZxe
T7bIiicbjZWx8JhqbfMq63Na9Kjuy2duG3OQKgSrIiatJhRUu5i9DEpRYG6DteIccdl6xrVR2rDE
OSMmSMOFkWRfVLfJwnWx9F08vCy53kxwsTx7IAu3qr6OpdXLxl7dMPj6YLbGP8+q47fD0WjormZr
+9p7grfdcYhx+Mtwhn8KH8JGivkZqlrldtuUJhclwnkbqxkr32Lrbx2SV4JVtdSxGMA2jWpRw1w8
iEbRDY3l9j0QwdFSaHbOpF7M8v5UipJEVWbN6MFlDy4fZeYL4gyF6WMaqA1Gc+E1SdJE5Y2NBDP7
qyRp9lYzAJRWYpoMr7XEDJKep24MjVsyeH9DI7xBi6++wuggtoippyfVaW9G7AFnz/AbDO+Ty4kA
7LRR+JQtVzwA2UFHElWCnrJLjiUYPI9G8RicoEqBLmlptlbtCzj3ZuktM+KDOfpQA+F1mkJ3V8WV
AxQKv4bBjZbjKCbXWMsUj1yYTko3yqUZsY0JcXf90tn1aAjjeDu5uHbTTjFoGZe3QJqiCs+DK+cH
1HwfLNrEsu7rrR53kz7CYV4Hv8ytsSOFBGtD7qK9sgz9osWOSL3G5sqEFPMyPQX+muCv8TbRohXR
Wy2X5C/a7jFrj1kfqUE0GqEMNEWjokZGBmua0ILA9QAtRgZ9JCpppAaAbaaJwmoXaEgyOgoT2pHT
5rrELsPnQSZ+v0KpPbDsgeXj4UrGcIOawCRpxVKI0nKhvQpAB2WacxkJR+fpxNFJ09qYHBFJgK7J
tWd0b2B5B9+tB9GUN85+/z2smtXh978/b+eKiT0tA2XKtBdDmOFy17jsu3h7CQSWQHCUxq/nlxhw
g2d5OIWH8ZnFlertWdXWnkhR7LZXTl5fuNdd7jPTFlhK0Y5iaPbf2u4kOwVrs7lNbI+temz1KKV4
wFBwn2I2VnnoTDpoT9NgguOJa2jf+GhZVrZ0RCxTZDIFIj96wFpSH1IsoZZsg0v83dhlLs+LP6xF
bad3w/ngeFEtYfnQN8/XqirE8uLz+uaTgpJncmeFhcWDjJbp2ssz3MCCd8TaohLXZW9rPPfR8tLg
BPUZaT5bPotOZ8GgCxeU594CNlLeeZg0CqoKNM8D1jYA1jJKeiqJtpmrQKRTNlud9jbDbfAUQqQV
tyxil1/Na37Cky12Krd/d/NS9Xwd2Nx4aJOPnohmVMwGE7Uqf+BwSEezAlsejuuT98ntGymjdhep
R3x2UQK+TjPRbtmx4FfCXxl/vV4ajIZl/lX89XOZ2hR/Xd1iRGphqDurKYjL3t5ULZeWJL+k5nLZ
87hhI8tLykZH5+dd5iZb2AtVuW+LYSB1SQO0K2J0TVme/rCR07ITXTfMcVhsUSmh7EfU1ktVdc/O
P0zuXvj8U/nr6VP8+PaPf3uJny//z/cHGTXPmh39adly+e0t+626LLvqE+T2kPaROs5naJakoCwN
JMNiS7QLzDgJhEggP8mI1R44rLyOCo+rLeAyz6IhmXnFuzEXrhaYwcuTYjZP172hsDcUPsrobXjZ
iKC9416THFkwyXtBnEs5JGcJ0SYSTh3MXU7WJOkoofAUVTZGtXcgy06OWzcRnr08G/7+93jrfDP5
T/n8w+yFywS56Zc0fV+6M9ab4HtC1N0JJBH+ToELbqbZ4VBvfPo0KSTXkjE+HCm1KWbKxEdPW7k2
yB4x9Yjp8UhoSgJLxhuvVLaMOg4SOQSpUlYpJUutB0pcYsq7oIKULEBvWJFROaOcMIdHnOyQdYPR
AjB9//JF8byQxZNiMIJfo3VPPrjbw6geRn35FsTAeOIwOzSgN66JML4E/EcV9ejlQK3TznLg4xy9
ocQZbrznFM35MCVsbxh1CyuWSKpiRdFgxaYP3hortokAqfss6k4LB+ioyvuP3e+Jom7JTwhf4jRd
vOy0Mj1rA566QDItLGFcfuTYYCN+0/n8x/22yWfsZMJ9tBFmhRjrrQ2UZCITY5wAAFEya0GNxmpI
JHJjbIIxJSphLilm/jeyVSJ/ZXZKEJRSF4Bgppga7NOE+/OPHe/fjRNGGx2T9QH/vfr1OIWcMYGF
TKxy0nNQvqhllgojg6KUSO4NCSKDgLOSesaBOBiXFtyGQLNx5h7/1hcx3qV5rUm3VbB/jegURv8i
2qujfuFXr2z1ytaX7xYlYWiCKxgXj9ZI4xyXHqMkI5fJEB+CI5YEABleGJOYEnBNKCKcMgBB9lW2
trivWAu+H2zy31P89cAo+6P5ZYFdtQui351o1M3CcHhRLuIdIqKjFy1KxKpO9JyjH1t0aToppnT0
sk2X/LesXE2msVeuPt8qaaAxSe0UkUIo5oNzWjIuvDIiB2KctYIZmFXignHBW51IstZQyyXxNMVW
ypXenUptdnN1kWAaLoDK6gDkVXrXpVNW5XdUuhlhNomTwmz54agWqlgn9hz0QyqTXOjSGYnVXkum
coUqs15sEdlmN4upTqhsTN0hsY2U9bpdr9s9Tqs9SzKHaLyDuZFJcOcIywYzeIKMtRpkrTMELgpP
ZAwWZzlqazUzhDJuD99au0XCDtx0elKskruVdZbKQ3hhvWxbw0sChNQY8+esl26Dps6G58W/F2xX
sTVs7+nz+qE17XLWtKf12mSvTX6xtdTK1qmTWnmZpSXSeaWkYRIQl6KeGcuitC5Y7oVlgunsuHee
G6mE27vA912sjrplsXCHGjarqlX8vlZkbY3jxyes1ksbLD/Y4PnjYv2RLcZfdb6L+fevebbUZ7H1
SUafq/Gy3JmbV+fXk9kQX9gzRkDvzhRXzuA/Jm+Bcz7h9qFUH3kD0QC7deJ91cbfqweIPUB8nJUf
4FUtc+I8O8+y00RkpUzCeEtJSfSY8B2U77ImRMaaD54qLp1z1nO2q85mW4C4LuZWWwB34UDQpMel
MbKB9d5gHFjxpBiuLlVNlOsA3H6y/tNDwR4KPj5Xy6xccAD1RIYeuUpcspiUpEylFBMlQiVmcXeB
Aj60XHITFYcbijiWedwXCm4zdbGB974ubkF89GT8lG4gvpK3nwy/XrvY5O7Bmyf1f8df70B6Xxdd
YL08zPNLAHdvq1K3VdaNcQ0BHfTlRu3KqOndydngielFejefutBpeCiKzaMf3QzDLxmt64Ud/T83
hb8PvLSo+3X01yFGhFJ7fN4iQJDR2qZouwlsLKl96TAglKsFsS/ep5pYuSD2pRtdOQxLFLIVvZjc
l0l8rUt6b2JKmEiNitX8jqMbu+UwkOZv3dvJBKNkpWpF8yIpsVR9fGWPWB/nEuY4pRH6ExbTAnvB
haHBGcz3JDEeIMbsuGaJUqmIIJguhBopuIvCK6k7MGk25XOVGxRDsNbTBZ/BpbNTVsV5wTGub8tH
182Q8EKPPXvs+eUHRicqubfOeKaVTVqDJimYYsri3AXHo5M+egf3uDU5G+2lCQErDTIH7+2LPW9l
z0bq34o96W3s2UVm36sSOiIxi3DMoiaqdG+YwgNl5CZmbCsT+sKzYTKN+2LH3VGbv0xGAFQuwvsR
2l6nXaZtI5tbsG38a6Umz7Qky3+sG4/ih1PEJH3GGfnQFLXZNZeEPVOiQZLoQV4P8h5nnSIaFPEB
6LRZO6VJzjLBEAUNLAVtLVESlwwJSM9kGjhPMIXam0QM0b6jOhEbwnQwPSkuFzCvugdLCX9GBcXo
0Gn9c9nn2ejh3eNjWc2CpC5ZEwW2RbNLQWkjqfXJRsptFkkTJUJ0OSvLQqARRpcUIzC1PO8L77aZ
8nKB7apbzyuOfDKF/y7XoFx1/2H+yzW/V1Ghdd97IjV9SyGwML+AOZx3itL+dfSnYZpOXfH/0mt3
9PuCaolms1FM4+JP8NcyTaMRXjaktPOVj/4FWpy+x6sKH/4HXk3Fnybv8JIlv25hGt0C1LQiaLvr
DjDZR5kS02pKvrjh21bDv2ucPc7tce4jsoloLSLRgnnNPSyfimjjvYGpUyQyDwjYE5dZzjpZRlR2
Dnpi0RjFbdK7bCIPq4e2XIoGeNxwzKx4DmDuv35O739flLxcGk3g9KQ+xbyo8NYzWD2vZoNj9M+q
bvzheTH+tUfDPRp+hLsUiWpqIqDhpBPMDlXCGUp1SIkTQhQnyrCYY3RJi2BjskqZAHORQKEVXuxf
92yDdcc1GF5n3BXfDlaMe3wX5wLjNlIo11zaDjkjUZhAeVhec9P3hXfwd17A/bKXfS2du/MihMnN
GIc+nc0/TC3dMnuvPimwcCvu3FLSotor76YQbRmeU9abRQJoCwJYN9V6MWZJLvIYD8oywHDYgo7f
dnaW2bDcDgypjyP8fG2FDgGRlzwBiGJOCIxtiZplow11MJqUVMycM+OE80JQphMLIRliPAvMt4sj
3B2QPJxhBPVFTMG9BlE3+jR5WlgneVp0i20dLT92okyu+0SZvbb4SL03ZdTJEZJB93MRO+LOaU9d
NskrxznRnnsm4K6xRIAaCaoks44TxmFS76mW8/LG36Ukboq4rWQtok4WgZ7ZHD97Ra9X9L58njSg
6kmdI/UaVLvIE2c5wF2DzivRMeZpUFkDi2ZuLTwVufRKUBgtB9VvX0VvF/utZ2tZ8d9pxX8PzdQy
vyyW3bTK1mJuSbKQ/ucGvqOhG13MkpuGy07LTaPbMQcNBfQTjjobFnkBrU3wKnMAGrDRJXmztkuL
8LDBT7iAgubTTU0aVKIY+h0DcXiMPshIMKqZ23kOVHtCdTeELorkYE0bTBKBtMKnMJX/8WY+BtOa
TtXXlO6R3CPNfcOSlTkrrAZjubLRJGIZ5Ux4lVxIyqcYDY6EeycZlmATWoBQjpLBsewgL8OmUB5E
dEc8KdAWuEB215PZKjFDRlsLnCLzVlfeXsKoyoe+wYq0VQvHBYy6GKCtpHxjI1lD+cwZvHOOgdvY
2Ua+hu1u8N9GAcUVcfj76SJMcOGyWbZxgveOexDag9Av3/dGawe6YUygGFLFiE7GJpqh5cxiMIEL
QbjmCEqTg2NrlddMZyWS9Hp/1+r/n713YW4jOdJF/0ofR2wQHFGeej/Gw4mY9Xo39uzax7E+cW/c
oBmMekrQkCDdAEeSHfPfb2Z1A+jGgwTIlkYWWzMkgO7qqqwiMuurqswvHzMadd9s1H3D8e/4fVte
fMB2rEzHdxusD7tsR/2A9ag37Uf9kAXpRw2uTchxSXnKsEA3Vk7f6FkOqLrJ6u3q2n2s/Mfqfj6d
vemMZ/vggTh7N2GEu74GzZ3+bVBSxGUOxSPC1HDsB0zfiL+PaL18y4bPHvn0/o/IdkS2L4i6NlIi
Dc0iOy5YiIEl7iyVyXMaYAZKHKCv4tYAovVce5ipJMxXUkoklg7k+ch2bQa3g/NgEsHJZn29+qFc
mKduqFAXsrbTQTN3zTav/NOjy0+m0CO4/GpcWQiFfjgjkBYmWCJSdEJG5nPIHDQW9FgoL3hyWXiP
6cIVXiKOZy65O5gzYo/e1kdqbr1Hd/vwrszRT+CECG9T+AmFQUy3dDtpvMIbhFdi+lydqqYr1W2N
ePZAXMd3x/S562l0iyFRHWVcfH5AJykT9FdAcpzREb2N6G209Y/a+qx9UNRESrXwWuPZMZPUUM5z
sEzHzEy2LOChF0temAhSeS2dC1KalAagA1sau/Xx8iY/EOnCs0W6uYM1/Gx9pfgFrnct13sNWHRj
CxHtOFbwLxUlZUth4/66vlcrKrLOs82tH3Y+to0beyJ/+y1USEZAOQLKF5hwiOWUmDbaGKmsyh43
J4nJ2RsntIoJ5CfQD0kwQ7eNRgcnrIKRVpLvXCLuiRTsmJK9bGNkg2psaVB+V/Uur6xKn4OssSwT
fOh0m4EWiWr79mVHoVXtr87pRqPLOlZ2Zs/ju3DuDmuzxYz2PBD8/m0CEFwXJJzrspMZPhZOXBfe
VnH6ZrpAp9nrNJ9DGTdDKAyl3DVWgQ+1RRbzdJ0PBMhitys4yrN0Ah9y7/PkTZ0Scoud3JavC77z
1y78hG/gb79IJ1sH4VDgPp38uvuVW0LpX0Oe9ejte7M9eM31Ea2PaH2cSB+dSGEsYhA2WhMS0dBG
5lxmLpIgUjuTYdAEYPZMXRKe2igTCS4az4yzPKdH9lr/8LeHcHrP5k6aU8D20xKf94rA3OmuryeT
n6v/db46G8PJ+GecjJvNm97ktMeoj6f4Iy7+Wrm4PYk0ZcIDjBt33qXMoB+eayu5j9naCOtzpOAm
QbuYMdglcekIszLrNVH/Y7h4h+quNbcgxF6Jc9Tbn8/3aW2PYWOP0h5wcN7HlNBkOd9vt1ZXm6or
/LjcbgV4OJ29ORA9fpkp2tnnTtE+TEqHoxJwkTFH+2g1P9GWZfAcxgVpyh0MmxIOLCYBSKSCoSBK
Zgqgj1WUQQ8NMYR7wYLIVEsDvTNHhf+Z3bHIN7fx/trVZSzq+dDuN2rpgXL2CNmg/szhwSgcL5HB
JUcfu9zmY9wkiuGfOYT6ouvB89j4HZGHcUwXPy46X6a9FTn6APU6QJwuWJBY+5Bs1tAzCYhV5YRO
qNnJkKROIRgR0RUIjDPJfpc7wLFHRBvWtkkl+Kez6s+rhed9Deq36Cw996YT/NPuXILfrJMK/hk3
bunGCc92C5tXNn3SN+6PC9pxQfsSTpMBlGmPWUgjkVmCbTBcR6FNcpYKuC9zSDpF77x3QuJOVQCp
aLREkHTogvYhg1AiJLfVlTQ3dhuEcuuvCzx6mWwYhNOVRViX21X/LnPQDdbcaw4OWSqX46DGlXzl
gvTW/Ywe5e1QVO1QVLgwqtu18l09heVME9BZ3a3X0secwNjdIZ437sPVdZq9WQwa23lBLs+qAjLx
FVlw8BXjEmm5wRtyGqovj/DOxgQs3UeHCZa8oF0RS9wkQmKBzRwlndh+fCAJZZFMNll6mDx+zNaP
joGbI/p9oehX8QTCJiMczdkHJxjz3ESXlPdKkOgCMTprHTnlzhukLw86ZetBwmgGIiZfm9uyfbvK
g7i+DlMQfJhM0EX2w2kBvh+WW7Z0edJSiuPWalv4w55yI3njiFtfVjglZyIrnh0IT0W0WnsvKJ6/
KKV5pIkDqrXcWyVgqRtpMNwokmhOPElqDsat22pc71HkTT1uFLQ6XTsMbSlzt3Srz33/n8m6lbPV
46dPIw1ZprLB13n1fgqCQ43Tm/ubqmnhQHi5OyMiNvNJU9l87m3Jra1H9pm3btlzsvmMeWlG+Pcy
Z4bkbVLBg5n30LHILSGBEecTgMLgEswWwWtqNQy0xBMomDmiZT5p6phXSgwD/9AcTmZgs5e472/o
sVp9+211MwK2EbC9PLWMeAAM6ics1SwF5Q3N3gipGGWKBpYBz1kTALP5RAjmkcopM5pctnAnHEzC
1ioe6N0adxXd+/bbm03n6snfTp+cdPpv97eLKW4bYnLA97fHZZW2Yu8W3c+DMtNenPy53DkpR6ys
OWU9q05w5xEaPTlig0kO43C8kqezV3VMSsCBpeCkkULAjyRPHBkyEmiP1vPTuhETHoiXxonEfHTQ
H0u8I55zH5wKiigeZBaBQuOwxpUqa7CxNnvLAjOdE92DrJPc7YSH3JbTnwe0TkfwEQ5Cm02PWMJR
9bmJuscV27hie5n8vDoIGBGAg544pnkK1IE9c8oLTz3hPoeQihzBcAo9K60RbkSyocOS8Aymxca0
TRoQt1yywZXp/LYuyajZ5U73FEBU/WdaH5X2BPdfoOz5eUU2XFOWFf/W3d0lgKvT/iY+SDNZFhnJ
EcfF4Qs4shPoGpylAFFpCswhjw3LSRNqZXLJM06h+aii8yEBqKHJ+4SHeV7TpA4ON97S83pb0+nl
njjkrq73SQ8na3U/PT8nWySGO/S9PkTjD9jdbyvA/X2opIRiXF+v+1NCM47hB7e7c9a/SYur/5z9
fPV79GsZmrqQ7Peflp97fdryGV4+4/SBDiiILENDnzMufMSVI658mYtmmDW0gcnDSGVCUsL4xDBJ
vYk2Ju4cdMJgmvoYQiA8UiecSULzrFmm0T4fV/bMZuPzuOLMgdG5WlJW7PZ9nnVBJd57t743RXfF
Tm3b/tE/lDfvLncQ36ybXnPmtBPJ6taIO0fc+QIyw9gEDQhiYeycUZla5iLX0FDWHv2hlTdRKO9A
CieS4k4TMA1e+2CD54fizm070OW76VoCsgd8zjZ4ZXaag9kegpsNi7CHombDKtS77UL1JDaa8mTj
8AyX5ii4a6m2D8SluwOD87VbLNKsuMUMCUtJk1jlArEpRxfn5fnAhYJfGn5McXy2pSD+ahyCyTEu
u8tWmkbWbaybOKu2GxjIF7q0i10Q5Te2j3l5mFw6Rzd3OW/LHNMv2jlUWVfc6SyG+w3Wk5b8HMVs
APPKvZuWiEf4pEsEpD2uE11q8QaGr+osSWdLjePJzzhFfWIQm43j2mdjozeCeuedockRxwLOUdoo
rY2xMicN+DUygunqg4eO5mz5calT7e7Y6elsgZEq5fPVDIxrisXizj9BEoOOvrU61le8EhayzZ51
UZJ2UdNkGkNjI2Sr+eVJzI4FFTPThqs02ZKxfIkxUUeZhouVVWmjXJr6LgeyaM0w0KVFw1fVVL/V
6Y37R3QBnxpI4JN3t28LY5i7cdf4+u42ldc36bZ+s4N/7aJ9BGU4eddytS0ruXH1x+bO29v3ro6r
e03p+wgVHtXT7tPb7y4vx/2RcX/kZXpKcsZ1FhgPw6ggDsWmQcrsEoFeeOgcEfCZcmXgh8HAGcmJ
hDFUcGcgT8m9k8vkGuzqNVunsEUFxB36i1lZ/sxKEMx8Uc7bynt6WW6Ua/BxeWY3ulqOuxovSa+Z
s4xnT6wkxsRgI6XKM544aLWBqnOALrAQjQbAZ3gIGChnteQyQveoPTjf7eOaWz9Dd/sbEK2uPi1d
bpGtCYBZRWO/fzvFLGB1qu6g7jYNmINFEJKbYdGDNiY42R1tXXY8rvx0Bmjmap7+NmRozBHukr8d
hLjsCLcp9dvPTZXGyG/JCOFGCPciTb0VjtHEA4wMzTTSoAPNSgvGnQkmekMMLcyU1KlAuTcepgCA
fEbQyHxkzz/i2jR061Or2e9rsPhsNQP0z7nqDsH7GcwBryraPctqHsbf31STcrd6XdWn1bdVL3nQ
HPeqm1Lwe3PCGNHeiPa+fgYfZ0k01DAJdVIXqZFKMc+1hhWdiZmDsofoYACj1NRQh/xfBsbCJJW0
Ojj31y5FrxrCnEZZV+w58/WHvZpeLZl5mmcnW5peVH1ValPTqx5TD959GjJsDqZar6mmb23G15CK
91Qb4c3QRwvg4uKtWywdrfK0Bjw5g8cATU7n1Rw31d18efvare4eiCR3p4yN07C4iuluUN6ef5y4
k+/QgeDEw+s/TkL5HfH3L/DvaXHGZ0NKc9IUPjlGmEHCrv9BofG/3ONeJANhOPwIuPLHIssvn9fv
ajwaGi3/A+t8RmVOREoujOZSYYSQDIko77zGZJCOCEmZEiYrmVUWiiXOpYwwehLA4TFHQ5yIvbQP
V38YPq3LRmLnrQMEPEnG7Xs8Td4+GGFbpLafm9P2gUQvRXjaCs+2hafPIJ7gw2fVxgP1Z3eBjnFQ
42J+tOcP23PHjA4pE5okhcEiOJrJKmWYh+5IIp13yoeQYQwySKOyBVwvGEtKU0Ufoe39y71/jLBi
acgbT9UC2efwettUAm+hTPqwJ+njqljjmfq6/HSX9Ncp4xZwU+3F9PKCXHaW8tM3b/t36WUvxqI8
/f15I0IFY9g+8kN7adsPtil5fl4e3ekFW+439fRvJ4BdDzzRvG7SBxcvO7xz+Yx9hyEQ3n+iEA9A
vLIP3vTh9r6sfsqoj8juC4qHcooLy4JGD3YDwyiDimACgiHGO24x/klj2kVvRNLccRZpZh4kY5Yn
fgxZRk/pW51fq3yj8VWHTGOv2r8GtX+N/1dYvuthukPze/d3KX+1GWP1mAHYbHT5XM8M7Cq0ZQu2
SqA5eOTB5hWGYJNjZG0VqidzjSwZit1ilVSnHYW8SPUy2BT1ePnHOHDHQe2lIcFIueksoDmazt7A
Rz/sIRZiTEpWQLO4uO6E+nrQlBCDxWY9TXb2jDguPYzotPV4Q4c47AK65hroB32C9EfkF9IjrB9h
/cuczAM1VkXDoBKH3aAA54NTMRICGB5GzXEVBI+CozTW0Qj9hY77kA0A+zRANo59Bn3izqpZC+vP
qp9WxAd3xVWDbAehXO649HjsGgaltQEoMPVvkiHcwTW8e94UelUKrcvswOIbj+yN1n4gfm5n4NzF
u0ZGqBnxxbs9eeOhKEgwxdn+cilxeXJ9dWfYXSv6FG+D6Dvq2H5mz0pkb1Wbdex5/sFnW+SCNwpw
ufjpcjxJHU9Sv35nCpIYtTLakISBFl1GVwrtpFDUexhYQSQTwqaQvNbBJG61khR5t5xynVCLAzil
DzTH5ZTzIXO8TnCywzDvyp8y6yVP6ZnlVVV7THJ7vzEp+wrvbLSNVG6f2WGKV7XtN8OrIqXQIQa4
80QR8yHD2ym70b+9D3ef2nrmwSceNLDHHF8v+bvbI+f1F6pqvlDlHLvK9e0NOjnm6YdqMS1pW992
ltFgv27x0ev7iE8uV5g/QaHlwrPxlZzO2wXnFL6jv02/ha8o/mmqAxebu2OLrmHRklAZ431YfMp4
ou1DDF6ijNYhRuo5rB8lMFRiWwMFNg4hv3iS/NCk+XL6IJ/chxIDNi47x2XnywwcTSyyFJjS0UoN
A+Qzl4RZF31gJJlEOMvR4gYz1c55AetNkaHPMbHkyADsJz3TjhxZc1ootOask9RxFRowv60XKU4u
PlTfVB/XeTHKY+Xjx+VHPPivU0medv7viL5PL7770+WD0QLjqmVctXytXkAmhSB4clCdkY5yQwSH
DrIYoqOGKZ+jtyQTTZ13uNmUY+CaqQzjR4w+dNXymDbX+/T5m8O1+f/C961R5uGCf+Z3KUzzNMXO
OUnpy3xRtb2ZNxAZadwb7FuimA6EtXbfGQoi8wEB7XaibnLEwccgUTmvt/x6Xh/hm/R6kMMX+4yM
6nYEgyMYfJmTREKSkESk4clkY2VQ3iXvnAmaBWmC9Jr6bJH6TkUXuFUZWjMAD7kHVDhYTkQ0irjN
5Vc0eMhQ+sN55b/rxvWsArabixu72O19/5nw3SdTrxHejZr7mOZGD8MTAMEFIp3SBNZwUsqcfHTC
6iist8loThLJinBNGGa7kgQ0WjHC9DGJDlvd9Jg6Z01Ot9LPvstO692yulhUdFcR/3S/l+4W5xPS
7IDt2onN7m7nV7PbQcmLircjEhChO/Tnpgpu9tdeH5NHZxg/cezx60JVNLp3jxhstOSPWHIVbJYE
qkzaeRIiFZE4xhJz0fvklFQE0BeUAbTGaUwcfTyVUD5kmAQGwmCt8esnpS6UHGBkl1mlt5JZ4Ayw
mcVipNUZkdhL0l/jBNSQs5dJR68ctJwxsi6mKLJOwgXojdQiCSKhOZGJtRr6mJlL2cWDMxhuamiB
VFsa2gVoKwXt4q9WPfHeUwDYXT2dLVCW6WL6c1rirsKRcwQ7DhUPehjXKSxABe6vXX31pp4OmUC6
EMMu6REBpxD4//I5B7x6ULratWx9osvL55x/MjGMjLoRZuUqXIaQNrSajbMw/LBniWpGHDjiwBdK
Om95JJjiVhstghXRRApzi7OWegmflOHaB/T+TV4ARMRlfBKeGQUwkXM5nD/wpvmd4K9eiopwXZ1j
8XIH/byQFLy8p/i+zVuWPpRy5CBHXCx8NUvv24rx41lp6bQDOpuGS72veu1PO+1PL0/71baPYO29
46ONdka0OqLVrz+EUDJJeIpGCBuEpI7KHFW0jirHhFCJM0oDjCSJJrHABW70ey5lpla7LI91Zt1r
S6ol18/j1qQtuDIne11JqzV/0H5zsipysDXpVdoxJn22ob3W5NBTaQy63fTeXLMLzW7LRmd4eztP
sxXuRp5KF9+5gO6YOCRYQXNY3Rn50hncKo1TwHiYaqNi1YdqdiBYl/spPv4If+b/TrOrP0CLA6L0
luWnusYOuDfp5HAEebLjmaeD3pPlHyOV8//C+nSUMJtPPEMUEOGYpl/TkxFLj1j6Rc5yxLJgYDAI
VO08xr/brKEbMO1ZnYzzBrdbnVPeU0kY98x7GE8VLNFB6QFi67as4wRs6ooCs8Kw8+ZSC6nXLJjh
vq7h5ho4gwnqfZ6jG9XrtvT7t9BzePz7atbfnYW6S/TFeXVSnWwHtS1b+ReYCXakIm5LtU1/vyy+
J+RsJWFbbHepIjeGPOwstdXtPWFqy3LrFHXN+K0/P9y7x3v1cG9296IMODb1mm47JKAp7ud1hb/N
fPEdPPGqbe1y9FkY1x5fu1WWnEfjg4VGlFXKSem5z8pFp4mEaqkx2uQgQRQfLdVOYV5OyYTiOmjp
j6Iv2ba9q13wrvld75d3s+x1jVG9ZYXrvh2uu5Z4UkzxRio95Bvp2eM9Cfk2zda+jHxQdNOG7Sm6
y57tLbhp2rYKdoald28PEUrPVNdbxnp9UPFYxw/s8KMd3dvB5g/U2O/Tne4qf/0N/KV/s8ni0hry
qmvJn+fX0rDHLlcdLc0srNzK+uP9bR0PXLOp/Ws2ZKC9ug04Bqg6Qx6uNKmp5TJT1yqEy5aceMMk
qz57jnR8meLrUens0/yHnyVd4ym0Gju1X7ojyG3UuAocV4Evk2ElKBYJ08yD4Fx4k6w0KpPAmUnR
xmiiggshCCITE8Kgo6SS0RJqHXT0+cSJG6Z28uNZteJJRN6xsxXH2YScFUzy42khQt8Imumv9paU
Z+XZznLjZhqxpnL7VXP3tPr222WuhXaiK6RnP15A4cstz522ObjXv9MytWEDr7rLrnRdKvx+T31t
33Y8trWs29XCUEF7Q5An/s89fK8fZMi+u6/T6x0V+/v4Ji3gwlt3j/mGRj7FL+cwJDMKaxEwBolZ
6mDAooPX7AmYBhjLRDj8C1Ik5pJQUjkXtYO2FNUE6zhmQbLHFrSActIxB6d9e/Aa7UG9bRHqB2xC
fYhVqPfbhfoBy1A/qLn1A9ah3m8fXm8+2hJnPN5Sz0o8Md9Dy3qay4eSoWH9hyppINozlTZUsHg7
NYGMRyQr59Ts9Xr6+fYa8OGAUNwc4XpthsCv4jPnYziCOnzMAzYi4BeKgHnSnkYF85zQkjnudHAk
wLQWvHMwuJmyLH1ywTgYNuWZDV7lBDOix7vD+BQ1xm0yXyJfuFZUdH3mMe0nAeuc6xf+4K6f0Luq
t/G/QRo13+Tv+wlDzqEO3PV5t7VdtBQDz+6XH8+g7DdQ5zfVT6eb7kKlwD/7Vv0XdgYw2o0vz25A
Zdor4gAPB+bBIsDAZUOtzpQjRUwOxMnIEqyiSUze6Jx8Rmd3DwA6GHGMl1BjHSpU3aqz2b5UTdLd
oKd72MZbK9HbuH1XbWw7b5uKrQ3inrXYtb/8mMFYld1Ap6tHBwl6bIesANNw728BEL9H8rYGpLas
b/MptHAYMGV0/25xTDfXt0O69tDy7xhPFsq4kEoKkHMYT5qnCDBc47impAz/HT8I2lhKQHpijd4e
kX+6fGLwLRwTiX2xs4B2GndNKY9aa8YSfO+4D4opqqUyGjosvSfCZ0OSAtSYnGTMJcliYESso04O
SiTG2L6g7GkZjJvpbFAaSDwM4mcV4y3BIAbbWKQGhPf4odxgbbhL4Q88IpoZY68pHZIssflfLP9f
nbIdE919MRAFZfeYyiyDllqiRhwugyN3jFx0pGMcV+gvlFzacxfAkGYWrZQweskHzTkJHBbtKfik
nJGUa+2J0sIkERgNWXDJQ6BMPBL184e/PRLzvbKt/cBvuHAFWlo2W5e31ndWu8EX0waInzW4Os3A
ctRukdoncFf5XfW/zpfV9bkY1zWNgTfjkvrr512VJgsavM8M2VY95yFSxTMeRYP8PkQelKDOMi4t
1ymaCNAL7IF0jFEWjwgT31bq+gG1rp+q2Ocdxa4fVe1Dj2Mw43ZzHLPsyXx5MAPVNstfxA9tzPma
mPHApe7uyHMMVbrNV+56keoZdHRIFqBJg5QaSmvESFycHg6OJgKfMqdDILdJL8r8GCHQFWkYEbpx
7cdKgcHm/aEYweIIFl9QWEuiQfkEk4flNivuvXCKiZyYV4x46mBcKWNW80AVnvCwqA0JNHMMIqf8
+cc5W3Zygqpztbi/u05L8Ahl6PqQBj6xjSDw+OEMU0j0Z5btelq/BCiOfsEb5zqlkVfnWM+DfkWl
+W65doqaYAVn5fYY+D3izxewmZeEzo4L4yS0yb11MqmsbUo5MCQlkkaJRFIQijgfFNHCGzAyUYI8
SedD8ecjFqIAxdZCkNUntv50oIVYO+6v7MPqtKZrG7o0lL0SrFdiaRWKWTg9mxS7cHqcN1H6sKhd
aGK42zOY1ShUoCzTFsliDw49mNkdev0mLa7+CBj7L/ANqwfFquoz++Szz+w1JEZGyhFmjlPFw1OF
oUIJtPvCBGm5kkpmE6nQnsG8wHkiGjcmoLSAUZXWJZALupQ0utFb9nyYuWHg1mk5kdUO3VzFdpTt
bOUhC5PJbA03P/RJQop7fefpRbrBPHqYXuZDD3eWGz9Um9HBHszzTw9CzkYC3GGBd7BghRa3+lO9
LvWfnm76sI7ORSMS/crNS05OyOipoDaqGHVUTNqcML1xQZoCLgpmkdecS+dIZs6bzBTPkmRLDt4J
3WVE6r4Z4d/tCPWc/a7jbY+2pOp6HfXMydKa1Lvtye82XOzXJqXeZVQe83/vG5bddmVlWKpt//jf
Pc/5qN19XafLmTetVu+Rk6hA3um8SnDxGh/s+8wfiHf1Trwb3qbw09V0fjsPgNiHxbtnm37zm+l0
joCoJevYEDBVbcd7PkMsTJ/0SaSiW1cYefpojSB7BNkvaBYMJGRA2E4ESqgkUAVhUgejs5LGWq+F
DQGguM8wYSoKI5llZtTBLJnjY8Gph4DsDas6+XBWfTyr/t6B2iUk7GNV0rLBu7/ju7/juw/b8Lto
80NpeRp1H2luRsX+yg9phMuJBUJVdDlmbzwx0HIKQTmpNXEW82hJIohUoOSaU2gc3kmZFayu2aHw
dlt9P579fYlFUXnPzxvVPT9vFPf8/EObi3ytlAgNmif6iHO3zh6wCdrwwxfZCuIF4Liop/D9xd3c
ebUSFyWa3R56aL87cLK+BYOXrjAs9FNmCO8TsW9TxT8jufauFppsQY0Anybd9sMdYtsXjvJ73d+n
X6M38jm9eawTI2IdJ7YXNLHBbMW5ZzBNYUI5y5EsIWnGqEjSxQC9Ni5SIbKCWU0Kq62HCZB5Kjjc
emRb+McYHwKrHVvfOKGdVTcdBvmV51q5d3Hz3WX1un3/3ezyy6MT+X/Q1DwQHnM7u/5YLasvJ6DT
UDmYb9/epAW8hdkz3M4CDMmsjCDOre76+vb9GEDzJfl8Jk1Z8JRTSh3PLkHLIXEL4oPmMM2T4zqH
QH2m0rvINSWJRCkUCc4beygU3FaOm7PVbudKNda68WqtGd3T7ye4bDYt9/wwK/9xZ3JtePhmjs8U
jg2k8ohT5CiHmg5EgbtTas/SGxiM+9niUyRuBJjx+tgkimJImHP5NJqL57aL6RtfI+Rh5PJpR/Qj
Nhqx0QsK41ExyexMNBjKY52FrggidPYsQV+zN9CzbEK2LFntA0wBMHqZWi6lY0MQbazMYJkBVkzj
y6t9go1OyrjtnI7fb9OBr6tZ02wvT8u2ze/oRTmeXX+les44rnQcLHRAXGu11CkooozNhkSBUf3C
ykiDUzbAYBoKQsHyh3AvWSLk4GSPW9pccNrqas9bsqvMm+kfv99I/7ihyF30t771lGPi5kmowz0n
LyRne85/XX2V6/S3exioj8PnmTmCh+EfJ3cn3+FG0MnH9nXRvr5tX2/b1xm+/jIIZQR8D0Hvb54k
Zg2vrCPWm/bVta83w4n5hGw9/zi57sjDlsPWyomf79vPaVPOL4ns4rHlvLt/g2MHdc/v/UqlcNF+
e79AopayKFq2D3/uxW24vR5X8l9OcsaYYHyC8gyqsd4J7a1lxFnFrXQq2OCYd5ymkKOL1DvvE6eO
UcG4F4weRYXBxQNeMPBVm8bpYkgrSB89AuC/gg8Me/SkRf4KUuktHxjyDLE2PHPGNfO4Zn5BJHOY
clIBlOYmYOWUcgLvGYyelspGHpgOcAcGlCbNE5ES8+NyJ5ggOuShPGCWFnXizip/VoWOA4yrXlUe
QXTZccdPAT95/OSXn9y2r0s5Vn/AF6bo/bheHlX8a4dNlGZFfUhGheh5NDzZrG0QxDrGg7KwLLZI
d8MVV0QGU+ht4JdnoOouHucL01FkfwZqXPXy+6x1+RTVd7LW5ubzWp9Pq50pgBoPt25A4a5SqNqr
kXnKQrq4zrx/m2BFUG/5z/yMXWx9Z0rSOSR5LFlgywHMgavs3VGF7g4z9n5KXPkcZwwmPwmoVM9w
39EDEZlvSfCMRElihJPjXPMi55okhaAJZg+beZZZBk8wl6BV1GidTKSGRgWjSIg2RkarBGHcBSut
IQI6/Hw42RhQhJGzsyouYeTidlEol2bVN9WEwS+ceEoEID2FT/G0+rbivSOV8sQID8fjlBegs1EQ
rjMVEXSSCQ1rPpYydkRS7S3VmYMCx5ipBFl4MoQ7nrRlihKWyKH4cKWZs7O4PExZ6uVkr2KiZrLe
GcmGZh6TYmbJCLH24Sq7+mk+P9gBhqsH9gVvbmeLt7NB8dvJvydf37v648nnjzU7+d9udmTTg+3x
nfzR1eHtyRjJNgKv0YgfwCykkjCYK43AuxC5lcolL4zjVpCYkuMyAf7SHHpuUhJC6oBuMNBbxqWO
z6Gw7du+SfPG3STa2cRbX0Qu2rVRO37b7nOGsI3AbNTpXzFxlCWJq6yl0ZJrGVIw3mtLhFM0G9yD
J1AvrKQCM8kZZpH7JZjMjRaOGXncxt1u/V0GsnX09/y8+utvlgr81998t8FxsCea7cnBbNt7cY2b
c5GoKiksArwtzF7MVNF9PC6ujdv9eVf+bfrzdN7xJ3g+nHtOYBf7JJtv8jMLIHcc3o7OzSPAGyeD
h8NYXGBEcRkcAL0ooKpMYdWeOPQNswYm54n1ymonE48ucMmN8VEqERws3fXzd9a6FrHwFGyRFGyD
tY89489H5oERtX31EZoMqrWCC25oTDxlxzjNxHISs+EiJaWZoTwwdKYQWhF4R42FBg037nDUtqGO
HzePWpF64HTn6ejHTVoqNkhCvJKteTp7U8VGqOJ3PIPfi1TDPH4YGhNkb2qAxds6wUDfuOtrJKEF
qDoflHGgBFqdVRx+BOaawoRU8KOPiL3ievjo+iOaV4O03iM/eLoAIzwb4dnLsfqOJkqVtlQILwRP
TOnseRDZuuBIMka5zB2VPML8EAKyznjNo2IcGWqYGiYrwA4TObleB6K15h5PYcA+L1KcXHxY8ylC
wQbK/VCRy9OL78TlSMo/ArYXcP5JAuea6AgymyBheUVAdTmMlo9UGUcEipEx62tyImWrOUlUeCqt
TzmEY0j59yto4YQ6TkF5V0GfANza09Di3oZyVUhdAW00OZ86AWS5vr3p0wvc5uXNA2Hd7uTG87S4
Wtw2+QQGxHL/6OGXX45IbrQvN9PT4dQ/tviL6C/H5XzaeHoYqUpWVUyQCh2lEn7UUcO09fSYD2pE
fi+UQ5QkZjQSDQRniQ4xSZ5TsiTZqIyXgiIMhMasNl4ZRSl0nwbtJNWROPMw8ntf387evG7mhQfR
X8eSTuYrt7fqvGovNdPJfIPs/k+3s/EsdQR5X7+WCpYSDVQ6AYjN+wgKm1iGK9AV7rM3MqjIkovO
mqCIsKDLSUmFoabKZ34wyNvUw8bNbZce9nIeLU6POxS9hfGsF53jUGgYt9puq9savmcpHpXiSOwO
RojTnKF3s3mJwP45Db7lVnaaeCefujpuvw33qppE6M2mFf4/DMFlI06Du1RDanlEKvXSKdowOA3E
H7qxK9dNQq+PlG31P1n+P3Jqjgju5c4NJgbGvWEiwWgJQgm3mJ6PMeeZzgYlSEpzySWxiUcpgoGe
K5gtvACb/8je3V/u/UPAbZeNneCvLVbNCwyOc2U7AINkcUfg79O7Uvbiu9f08qwqb+l3l6cDk22O
MG9U5X8SN1gbMrQCXZMsauITidrASAoJHZVJZM6SiT4ppxw1ImI5Qh0NJFsRnTsU5j2ktfWW3r4+
VGvrB/X2mEgHFLCRu/Jp8T4BQly8L7hxKXKfHurYFO5idxjE36dv/u7eDIgRxTNYUOQwySqf7rA3
CAnpFuMKHdNnjphunAgeOY8VljIO4gdDWDSZ4QEOLP4pEQDknLM2kEizodnrLF2kOhmYCwRVScSc
Bkif2ZjCyeys+qmXOPP8vCIVyF39VN5u+8yxVeF9JUhvmug01ITNvVpdws+YbvM1yDDivxH/ff0U
wLBACyRQEbWKzEMl0XrOnbTWOC6pUCYFwwNXQVPrlbGRG+loJoYnzw9OsN5T7qo5vEWnuy31Xt1d
He7Sdel9RUjvNPho/T4UJ8JfCv31Ur0kiE9Nhw5EgHvSRCIH6SdIiv4cIMjIJ+EI+dVDN9jTsPCI
BEck+ILOZ60ikUUeqcpGweJfaEIlTA3QE+KcNCySyBUxzFgvkw6RJJOtVIAEQdQhcjx2TeKkmzGn
SYFc3WynQr9ZX7lZp1LHfzM8S4JCfQJ4pE9oEiHjOw6/bmBWaK98+22lR/g3wr+vX9epBtFhxJin
NBhDk/Y5a+gnUUkS6GRUBtaA0EnnFDeERp2TcTEaBSMuDo6Y3dDo2WmP9H1SlHoj+GKp2L2LN73U
5l313ozReFTD1dMZ43HDcDujeNkXxORAhfjuQFBo97OjDEmKQujqvyMoQk7+vzQ/GYScBMOOj2r5
T7fDNAw9fkaHR+Q3Ir+XxG0sBYWeKceETTJ6b1U0BDCeYIV5zjrKqDVUxYiBeYQG4WBIpcLNQ5+f
zYkymZcF9hLtofmfp8XyanNxDhf/cUJOzqoTevLLagqZI03KHRIZ3OE7LPFL5xMU3d4WLNr+EHVK
sUJjCO6o91+33ktnCJeUay9lCjQBKqGaJua9Vyl55blV1jLLrVDZ8hQVkiYJ5kWmjjh/FG/KUpur
1cHvhpqvgFxf07t4cY77gK2yn/eU/Xyp7LvieCd//Q1o/F9/s24C1b7aV/ZPt1h0GDrk1uew9LCk
Pa38dObqj8tLxxCwyN0hvzfTGYYVX/13mr1ZvB0SPN7MjsniQwfBbc6H6I5olQ/Vqj/5vOwqY2af
0WIfv24PnqcUokyWhKgU50GkaI0wXiRCMIpC8yy1kIpyBoMqLXy1U86GycyIPiqzj6R7CJ/q+eLq
D9cJv0pDejlvx9M/Rn9Of518s60v9uWQjPGDWM+L1eDxxuG5M6Lbw7mdDIiNJnA0gV86v5MMRlOp
rcDUtF5FqliKnjnhOSc6YIZa5VKAlSz8BYVIPKZkjRJaeup1OM4E7k7xeD+b/g204fdvXe3CItVD
nt8CFnG/Co8wTBS/BnUydNeP7MXjTt1o/A5x2+bG2BSINCYyb4zx0DMF2M8j2EvQhGbRWCahl4wS
Q5KHgVCJewFvxADsKVumD5fvy407dN6e4nlIjV+qyXWalbunnR02LPJuXWSKxzJn1a6SyzX/or6Y
XuICH9+9u9wo0Vm6NymPHiBRHTfyRrPwdTrxcuUR8NhEKfMSumCiArvgLImS8pyC9HAxRzAWTppo
XVKaOq+RCZPQg6M59il//Zj6148YgHXR3p7c8ph40wb0a9xlBn63g2z5d8/f0nPX12V9EFYj0I0K
aff0MMFZM1IH7uvtzqC7mF25uy81wZn94vKbsS8vvxkdaf7GGemlblQ6owWMEMw8PHMBVfuonZQm
CI9U/NFKKqPzJIUciM0+0iyFwdxJEpp+GKj+GONDGLVYzq3MZugw5KrX3aRJ/URms9H1b3T9+/qX
kCQgLZ+TKQjuDWFWZ8qTpJp45wEs5sDRp5ex7L1RMUmTo9AALimsIoM6FCsulbCbxKxRwV7esn7G
stkTgnhfY3oLgGLrjGXpiSnLpHwgUuN/lg5+80GzXBwMJsww8ObzHkiQpx3QjFhpxEov6ETDKC9g
NZ5YlDCGXmnuoiBJM6scc95jwIVQRHukX2UmJAeLdsaNltBH74cKvFhbuAl8Iab3HWaV5Q2w37S5
FqcOrCwsic8rzEbZPNC/1bh9Q4FV2W9Wb9cbBm69F4Bnlau6NjcN/QHl2tbfzNx14w2zEsG1GTM9
vPqtDYZdz3x/vtGRnRuPq4F5tRqZFSnF9nwxwsoRVn61sDJ5FWJwjAct8YRCWqeFpp7DIjBQBf8r
gJIksEA0rPlC1oJpAoUcpSYeF1Gyw1RVnUCQjrkiq8s7LdbW3YeMVvXXg+xWVW3ud+63XVvbnbvN
12RpvxoDdlrt3CY9yIydVtuN7rJl9R5rVg0VPtOpsuyhhmkdrlO50/xp6gNRu9qfl67UP2Rwtd7c
DjT2CJqbQXhuxNa+rT1iT1IM4gglt1yHxBFQ345Yf8T6LzRVKY5TjFlJEpzLHmoS3NJgjcvC82C4
h3UAYykqHb0jII+PNnAVtU5W+oGy0xW7iDukfgmfA0J7Q3F/tODkPv11GDHsiGG/fgzrdA7R5iAS
V9xBD3RyTJhgg6XWJRFcECALNxgaYwJAXidTdvjPusOP0Xsq6Nvd0UYBSUcB8epS//DD0wgOF2+n
daxKa2WDFL6J0+bT/RxPq5HtsIFhB8ItvR9u3bgPQzqET9hZJU7PqpLcA18xg0b7mRJ8Y/DGEazO
dBg38An6U2P7mHKkFYi1n2mR0OKNYwQbxv97Is4q1Q6MbQXi7WdaJMTcKPYoyb5UT+8/warmAUfv
kvD6ZDpbnKBz9+x2UYHqTWf9CkeD+yuzkFHrAdYQ55SI1inNIguBAu4JJDolYWxTCCHnwKIJIiuq
kpEp8KSCtPQ4X+7dlAu/L0nd/3J7Xb50n9Lfhj/D32YwRoYd5FxP5wsbiq1hS6jXcts16KlSjQvM
cYH5gjj6M+WO84Do1RluTBaWY55NnrPmMnARCFGAY3VmsNDkmJGJZyMEk0xzz57D5dA3pWV5eVaF
DocX7nyWDUwkZ7BlS/ObKnzZBA3jknRU51/Rs1saZ2UmxpDEhE8wiM6zFLzmVDOfTPZcealICJJz
lhlp2PiSNiJEZg9dkm6prj8LG1xd7Bv/jUcfbPuN+yacPsy08Lse1cKDTAu/G4Bq4XaWqvr2drFM
0wl/w1g7dAJK8HYZ4bl4Pw1pWeS2efAI/gW1Ox66Tje3P6erdHO3+Djk6vfi8qxa/pz8T4rIh/Ef
dUozeFMCkfH6vwL0OVmWOya90cM1DpOKqduDVU8G7MLnkv3kz6XUSedK8S1zNzfT2RscxWuwqffu
TTrZ7vCRfVo1tbeJMf/UiG1f5mTIjM6UUmEJ9cGyRIjz1iVLTMxMW+o0OhQY67x3iUIXCYZKKmOV
ts6IOEwG0a69n2AiGLr2k1rfwXw23ZTUWK4kpb4c84qOQPbl6W6khmabo4bxCU4AbkUXRpJlJCxq
QbX0oKracWJUthpEC0IiwYMTIll7MNfYTu1sfcwP0s6uP/puaHfA6UvzYNW0hbXvyQ1fbh2IPndT
Udy4D1e3IdzXZSiGzjrKlgk62zeskMuwy89M6N+K0uR4J508psdkG6UDSrIaFNFPpDrmmRqx22j/
d+aVTtllCfYcLH2AsbJCi0h4DIoLB2+TAhGc5TZAPyR3zBmbOdcxYaigdQ9jt/940OVlw0b2sobi
PdBS9BTdSEdY0g2Sy43Qdrza2Y/Eatuyvy1OjpPp6fouzCilwPfLZjZ8yNeNY7H+vZUc068xR+lo
MEaDUT1CSh1ySi4EkzhcytZrhUPDggb8GDm3yREhBQ+JSgaWgynpmQ0gH1IgHhynuMc41Nvmod5t
IKot+ovGRtSPWIl62078sLYT9YOWot5nK6qnpUbdscG6ciCCEjfV++niLQqBTLNVZ7ielhRV8Z1Y
1sV49V9XaXhmyUnL2IgOMA1oK04yvCSup6eXz6CduJg0PItLNyCzdE3SDVyWp8PsR05a4IlVN9ns
1dIBqXHo2fRLP6YLFoVeui6h1BQBbhkuij5X6G+lB+sIbUaGlr5QRNCljfIJRw2HcEeP7DE9YtAd
hkNWnJ4YdIfhwqU4bTH01oKGWM9Da8Tj4/T6gqZXQkHiTKSGEYJ3huTAUhLRM009zLxRw7ffJMYA
sVMqExRiANa9FIlzo/OzCDp6hn6CGnOFk8dZ9V/rrVQM3rpY3N9dp8nkXfW6+q81c9T83p+elo/w
Di+sarjcnPzGvdVxb/XrPxfxQbHkGEk+WZMwZR9zicIKO3PiYvYWkDNqdVbGJs8DT4CcGeU+K244
PRQqP6i27b5pR23fVa82tLbap7XdTdcJVHJA+oUuVgXBClT9qWqFm+NVWDy8XV4o7aE3PEp2IEh9
iA3k36ZvpkNCVMq4kE/LUvp0r0vKGOdEfmYOElH6egSa0w+BtPvZ/P7u7rZepHiVpx/gG1S+rrDU
SvU0wJpkkWpYN6HneIqwXIGvRnE5P+wroPasU965AH28glZQHeN9WHySjfcW6B+xwczJsLvcDQ//
Z04gXGjsj2h1pNkbUfwLdQ8knOKOGLeCZKmsoskTlWzO3EsinU5EaRctdZK4ZBn8J4PwXJDIaCb8
+eGku2xhOXe96u6yt1P7jfswKVQGvqFQOGuYEf4+vVs/clat3l6w7y5PT0+fgeE/R0YJ7NRpVeYZ
fw3IpDVv6HDYPzge1eVXP4QS1kFnjJBKaapgkZs9dMtRTbUkiZMghCNGG4v+B8ooa2wQLGMOCcGp
PhwoP6IU9ZZauG8O1AmKOvGsDd1r+IrC9Fa1gi0dYu/ctPByLIVfY+mdrgvT2SK9SfWh3gtmj+/s
XXKLq4LKh/RdKBu+p8/Y1p00NeCW5K7X0yFgTtnSPX1G+NWkqaERav06jHBlv/wZ5MeTyXLH/cHX
03/SPEK3s+uPqzRBy9VGYZ9syCdBlcPtLLhFmq38z9319e37MQD1S5oQrArEJu5B8OQD5Ya7bHEj
lGvClRU6BpuFixyuM8c0lAVhfFQArABHHRWAqnYHoF67skSd39fZ4Txy72+ncUBbaB7lfT8itpJK
NYR10duHO9vJyQ5f9A6z7NyRD23rCj9CLApf3XFlOq5MX6hlJcYERV1kWhgWqPYqe5EdS44nn4wH
6wqoGuomAWTDLJVgW4UWPiH/yvNXpjvt6uT6rHp/Vr1dLkz/+y8/VucVhyXpW/iZXFevqvd96iMo
MR4ijYdIX/8hElM5O+5MjDSC5hKfKONccqtp9iSnZDKjjkuvbVYOKcqkiYrA8hn5kMiha+N9avn+
7O1yYdwoJfvm7TeT61fvT3unQz11PIYHqW23ahvGLD0O17Et3joEwOndAaDzGwD2eJZ1M50jpdKn
zIlbTgPONknWn47n9CD79Ssp1VmFvkTo4SMHlZMPfqxxnKh6JLIfMd84hTxyGmEFkwm6EaOHQdLW
M/gsnJa5TC7QXGJKu2SsZZx5FSUIFAOVmtKQ2HN8/DeN8ORHzCqZF0t3hbOqnr55u/rYISXplqq+
7xfbZh7plm5dhKcRZqteLa+qSa+a6nXv/mn17bcVWwnw4wVUUbLbwet2i7t6hm2WxJn9Tj1EmfL4
AGGlmJZlhLujqfrqaZLAVjmuFYfhCSbCEpQS4inJwkepCdTthOIuK+hSgkZ8zoQ46JXxCTrID0W7
x5ulerdh+mHTMNUPm6b6mcap3mee6mcZqC4pzIFVPWakjlkELOuv2vq77mGumhc3IlgZ1O7jYcda
encgw8+31wBFh9/KHZS8b5CNXLkNlJ/uts+p/DT7uHQ71Sk9SqwR048T5YulaFWA42GyDNwTQaj1
GkaTcB4CIzRxpqGlyFSMTPCcmCZBEMMkD5Sk4IfhXOkZ1M093OYmTnPVN9V73ModKVbGHdyXp6oU
FtJSgbjCGK8xk67wlCumYfHtXFRKZyt5dBJ6xqR0EkCtlZlSkCErfjBX4KYydnZum1vn19+8/+Zt
b9u2ufE00NbqdyGvbxo9EJztzqt+l2owQTBwJVv7gOjsxPmTY6jeoPhZdeLdMIx1UF04svnQtN+8
BIcvLhShQiNbGFK4eKx0sRUvtvK1r3EpaGwlja2o7evyfmx70r7GtkvRN/d9bLvfvsZ2HGI7ELEZ
ntgOU2zHKS4HKjYjFdsRi+2Qxc0xG+HiCBdfUAoVyrLy3FkaldHOCZaDIdQIbpKCunV2SStmIvTb
c0Vx/iFGucxxpgrkOfTTfcM+gZfeLu+sXEHmabK9O3pxctLGjt7V6ecSlQaAcrvGC/rdsqbLdrt1
lj4slg9cbNLFNEn/yFlpf1X16WZy03dbZbGFzdSms/QeRUHBljVdTC8vyHfvLqtXFUpH8E3v5ruV
vLhtcrmVNHBZJybIQOqKZWd2ZDtd3futu7tLszhpn+37S6xKjZh7xNxff+5mGlwOysFIEcltVtSl
rKVRFnB38rAOBsvEIiFUwdrY2URAMlg9SwZd5DYcirl32rZ627qdF+tW77Zv9fEWrt5p4+o9Vm7L
yNUPmLmOlasPtnOvGiv3ao+Ne00vdyRG3W/j6mOsXP2YnTtgUXMHw7xAR/B25Mu3eN6sbZr4iuYv
AXKG6/uI7+L93fUUHckPDLXQu+OWa/RVxxCSQdOhMvYcx114fhjPXfj3jFAFeHoQMRi1z0jxw6gZ
lw3jsuGFOh8SFigRSliuNUybBtYJ0gTBlXAaOmy84FwzYS2lUjNPNI2c+Qi9E4yJZ7HRrCzjZHZW
3SxBt0PCNjwLvam+qW6aax6uOcDRN72ZwJc5Bi676gf48Bre4/lm5UYEPCLgr59IKjPoA27HaY4+
/UrqCGNDs2JJ6QSKq1UQOYdEA8vCRrgN40l1gt7Bmv9gYu+Olt6sMSOq6QT19Oa06Gnd1dRX6wtL
cpm9ynqcR0GRpuxON6itTWsPd0qS++Tq4mUACj+9WyZend+lMM3T0BY+EM2ph5LO1Klgw4EjZ2lx
kBVLj2O5ZN7Wp0eEf0IlJ3/8y59PSi3tu/ZFrt419ZYPw0Strtx7xVLupglTvH3tMR1YVbWWWq0+
rKocVnZWmmlk108dedYVWXRFXo969w9yOsLOEXa+zN2bpJiU1EXLPHfOEcqE8IIyystIqpQN9V4F
BbJAx1lwJHAmFKUB4CcbNKFMa8sbXrXF/d0SiC7SzR3MZvO0mJx2yRFbbsQE0wtMafjS7m+UB6DP
MC/CBfz0WxcjFjw9bSa7ovZlR6Y83VKxYZuno+vECGJfniHIyfFsIlOWM9D4qJjzKXOdg7VaWJqd
IIlTbaO0MkIJzFVDtAFJTCQ8H5mdZoeqF5jaU/UOoWKj6g9o+paiFx7wvy6a/x7R+W32xafkuiky
dvgX37pFQxRe3dzWCT/PqtsZBt6BvDgAGISHYHm9v9mwjM9vb1IV7ueL25uqYJsDgfJuhpky3nla
zz8RQ98xyf3EKpjvctiwu2PI8i74MnkOG0YKW6CwPi4RDo5g++DoLDHCzxfqsGeT8IY7HqzxSZsc
XYpIu52pUt5kma3S6CLBtRZGK6KxZ5rw4G1SkTxr13NtGNdMvmvIOV8d963eX7ym311WrzsXvntN
+4Tbq1tfOGXfSN70NagPKI9NhkoeYdVGNA/QPc0BrFmqvc4JFEs5Ai1THi3PGUYyRy6dpymGeDhj
wR5NaRHbXk15taEpVdUDWjt05XAuv/nbaV5U126+YulrPGZrpPW7nU+bL+2ss0F5eHIWvZumquVN
QNqELzywibEvLrKJGfUlRjZRPkY2jejrpWakjYkFZaXMwieeUrKZUqaI4tIw7VmwVEjoRozWK+08
JzQT64J23Ami1PMZqrZN6mZo04qdatLENr0qMU5vkaUKX/u7dSNR1bhX9wL0NrhghJLGOAVQj2Ny
aKgzMEsCJxy6zaMuOE9rzxOR3CQY82QiAV3OIR0cur9LOzuxTi1J1eT6mx162UV6T2Ws2mSqOi76
yZDd+2F4JL2BO58N3/hzEujhNlb7/+VZ1d3Uaj61CfsuLz8RqnuSpHtEXpN09WRv0wJi3rv2Bl8R
ULE2/51p74imMGvS7pU8dmKYvu9Ej8/r/b7/94xK59y8yTe4zASI2Qb3DhnebJMQmnZEWJvPD0fI
7B/SNgegaPL9cSwEpTgU41BOsAeGHCuGYqwpLrAUehXANYmH9Ms/sGyFlO1zsm1Gts+g+wQWw97D
q8Jz/eXoqLZN07RXnsO2WNuOaJ/BYYNrGq6Z5SjpZlBK90zbHj5nUTZ4hmM78IPjDeUsbrcuB8q0
/RRN/4qcpn1ONG0ZLIZ/KJSR4Oivvrm2lVi30spWUt4+iS1hsfI3xqZKTkfW199xpTGuNF4OYpHM
EWgkOcGE9VRTryW1HEYpQh8V5UlbLeFNZFwkJ12ILsFQsKQs9zEM42awnvkn9e372f3NWRVur+F1
lQp9VQCjPC5IOSyEIuugjbb8ZbkDlazvNDWedsLfdt3eiHrbVfdmhvSVTBdQx+UFlLoE6bDyb/D5
0V1hXAK9wIMjmJNtMDHL5BIPHPpjoAfZ+ZSsysoFHl0k0jPJeYKFEmZzhQUQDJ8HMQ/OY7NtMlZa
WhY4g1iMUtN+i9GJNdttLzoxXLusRTEW36Cp6K7J1iXx8lHrszdplmpXLi/e376OU0Ddc7jnro9h
DjNs5/IMF39X9e1iqTz3wyZC72DvbWh++bnpeNfSsOMTHQ6VaFAuFxtFlMuR53fEs+P080jIh2Ey
GUsAq3IYP0uSTixRboJkjAmRbLBSA54l2msndEyM0ijwaoRhyM/fOd9hJic/LrEjEka2xJMYHEIb
QoUfCwFCu2P+/i30qBSsvj9vinaAZyG9xJuXePfHi3L/cgOZdkg3OxNQoduclIpfNfV2yX6X8cVY
pmXIPK3+pRVvXQSDm5dFQGbcXSwldpVdE3QWUbH2y+Ji172KFe6RHwqtr6frjep297wd2Va83Y//
cL4cw42ny9icLwlCe/j9Nf1M6P2fz3aO2P2rYcjJgSsYrMi5Jlom7hiRNoGxTNwTYrlWgSTBrZI8
2QSjxhMLGnpHOTfJHYrd95nIFi5POlbyFI0N6ZvJ+gFDWT9uKuv9xrI+xFzWhxjM+iiTWT/NaNZ7
zWZ9gOGsHzad9ePGs37QfNZ7DegxJ01t9OItRlkuKSkKI3KY1uH+2tXXH59Ajmx28+/lOv3tHr6u
H6/+T776S0vIPOAiZ+uIp5f24xhXafpJUt2hAzZdLXmO9t/+dEI1Byi8HC7gmcETV2PjWmhcC72g
RALae6GIdlJxYRNJLDtthCMyKGZhGJNTGQY4e8+EyUHaLIQU3NGoYIYfIM/dTnuKVBZgqldb+zOM
h6+ROqndToOH0H1hJ5ETWKfZaX89hM9OYW6DmjZ36JdVTzfI5domNtcHbU2YTmCzqvLEq/ONVQFe
/aff1R8XBqMleeyUUDsbtYDxoFLYbGk2XILFEMHLrBi6NjHoryXGwaIBVgbBex1kpJRCl0M8eGGw
x14Uc1GtEoesLcbq2kqj6z1mY9apoDUck47l2Li7YT227m02tzIhk64N2VHp2o7UW5akeoq7/Qoo
r8YOsXIvoUhBRA1obhzujwHKuxnb3qTF1V2q6+lsQHR8hNM6HcSP/ghXsEHaOyKpoBxR64haX6YP
rfYxJ2Kp0FIkrUPQNPoEswpzzOpAAavCICYfqTOaiewkiz5bT1mmSqvn0DSvzdpk1iFonu1hZub9
EnS7BOmXYNslWG8a6ApQva7YafVq8xofk+CNkPMFJOwU3uZMApMyJWUITUFbTRgIronNRKoMjXue
fZZeJaayUT6wSGCBi28OhZwbKl9QGeK4WeErXm9Kr1S+X4JulSAbJdhWCdaPtjxS54/aPD1ZvK2a
epYbqfclt1ydwn2NniEHosDdTG/z9+5ucEeQk4vLy4vLi5PPjM1OLqDRy8uTpzlZPLfZo/pLR2w4
YsOXuQ+RXFLC2eyVUhSAoWFOR+mM9JYARgRwiMlzvGCJZpMixXRTnpqUQS6pzQBxkSuTN5kvESJ8
h2qkQpq3H/HuVXsYRrvXlkdsLSrEutafpjfeXTtkIVpd2tjEwMPC0tbpxg5oudjuOpxcnGxsXXbk
edXb82yfXjf8Qw/kLv8VMeHJVbntIusqXm/vqvaku9wtXTMyO8TrDEq35OtOr3pzKwo77siO8Pir
d9VgAuwcdCUZygH+cmaRlBzGM6oMa+IYNNeOGa0dtQQAM8iAvtiKKZDD0oMjTfv2rjC3re1d87Fr
70j32trelYsre1c+9ezd71pSuIcsXssat8verQjlNm3d6sa2neuQ0G1buM7NDdvW3tlt2Tbk6Fi1
tSCdbk/2mbQlR95Oo3boAuD2flEWATfT2fTm/qaa3eLOMNY1r3CveFojgREMuK9d+CktqkawJsNH
h56lyfpx4EJB71woJKjn6ra+uo1DMrOc/PivXEjxb0dA55P/E7u5/p6B23/8198f0+4fYAQGavjH
53R4XC+M64UXtF5QMTsTCBecBqkYsSQ5CTIYWBSA6JlRykKiVAtlnSfCx2ST0kwR9J1gz9lL7ti8
yZ9W/t+YChomtT+drjaG/3RxXdLf4f7wCTlBgrfeJbZ9SZRLk941dXK6fdHsuvjjrou/33XxDyen
2xvWjSlrLiN7644SxeaMIHwE4V87CHdG+4QUTJRZIl3mTgntgmJZe8spAYMTkY6Zlo4q+CSsIyw5
4bWMB9O9bJiSlVPB2ppUnYR7qMPI6Xd+DuakMR3tR4Yfux4J61uiX1LtL2n6JX/cX/L3/ZJoTaod
+f8mf/0NmpS//mbdi2JX9pQF44JFn+IrEd6m8FP1/m0CcFsXhPs2fQANCtMbd73cIJ/Oy3ijNYTx
PhD22v0Rk9f3wc1/HS8JrT6zl4Qeor0j6BTFiGxHZPsipx4AtB5GznLM6CqpDNJZnZRUnEYSTKRG
ZqTqEIxLBYUN8RRwraaZZ6mVeA6yXZu1g7wk2KNeEhtOtZ3qS8BP9WrzGht9IEZ8+QJSf4gshKPK
SOEkFSFSz0mUHJM3O41L1RwYs3Bdg/ZjikqNI0G9DYabGI+Kx1spdLv32HWCWKXsWKl0vwjdLkJ7
O5gH6XT1DCeHUs9R2ess3YnZwi380euG/voqTst1V38ckuni5C+EUMxwBq+sfeXtqzi53Ip/Ovkx
Tmeu+rOrf8JS/50+LmAI/ujq+Vv8/G8gvZtV/3r78TqVWtz0pvqfKW5Ox/mO6oxEwrWzymDWOXZM
Yox/NJKDHeiK9F1l5C+/nFX/aPqDd3sifgetre7zcr8nMjxvV/dFud/vAlTAfvllmIwgJ84HHCT4
2uPLm7dTfHn30/WucW9qwQKgm2ALb/DtNVjQe/cmdS7vGmVKkDsEf3H8JQg5bqRRThyKVobvKqiw
GSUUvdxpZfoOm2luYXfw1krG77D15h72sfMYDqvAewON64/lG/1j+T7/WL7NP+78Lr9zPzu8+/vy
69Wr8g3+1z/+ZecQNsyFvIzfccP3Y/M1La3h2DVj8GPz9fx9GbP2UvONRElwsNqLzdewyIXD1B+l
caUxrjReUP5ra3I2NnArNeeEu2A8S9Ceojm4xKMXxhlYilDDNVEpCovcgIynzACtDJSIcM+0PLlG
ChUGP3y5EmlUEEm//vEBviwfv6v+/ssv5Zzzw1n18az6O55u/n161330cuTqG9cXLzDNACVaEBmJ
c9SBygZMR6MIEwH6WFKKGu+zSZayksLGkwiaLRhnMKTUH+xEcpDyLjd79+vvpFXg050avH6+KHGr
ssesKFoxe0kBU8lOg3dnoNYpVmvxD1xmsL0BdDfuw9X8/mbApYUiR3gRk6HyvnzmqD32NM/wp6K2
T5EE7E/u5qEcYDO4XZ1MZ4sTPI3ABJqgRdPZmOHrS7KdRHKkQk5MSAtCc05lANCjhMhUYhZmq40i
DlARXGIkRmYoE4lY+EfcKr7zl4OMyG66mnKeBQZ1vpjCxQHtCNIsrMg38f0ROd7/HfVlkKTzayGO
aP7/Au4YKuU9H0CAcbE4LhZfUNZ6ahKYusyYIZQKKlOgToBVhNZdCMw4WBJSrR1T2TsQLRATaJQ+
UB0BVj4/QKNvE7cy1jdJq4uN2pfCfkce6n64xermzd0WceVG7ct/Hoz5T+tLvXzYvbUn1PDPTjQ5
rjxHO/FokL+yIjGuMG+wowxTpRqBRJOw9PRUoSAxgOnwXHoDvY7M5UgZt8hAaT0/eOW51xp0Utjj
jL0vyf1OY7D2teqZgpW7UtcMrC42JqBeW521AdhKcn/cSVjj1gTSNP76TbZ7WDgsu42uTLCIOHC9
Kve4MtXQ+xl8dep0l+BLNHtzhcczLixSPaRPv/MBjz4Ox1tlt24Ix/rjmj1xJwO1emS74eQLXdQ+
ltna3b/BsYC65/d+9aXGL+rt/WI+jamc5i7bB5uxuA231+OS9wvKFaR8TIIZZRkVMYBNZiGapLQn
zNLAGM2ecgmr3uS81olSJaJXmRAFK2J23JJ3dyTRTYpTN7tqDvqHdKtkW9yscuuKOiInnZS/HYQg
gG1nxtu6wo/Yg2NkGLm2szuL7QSGR4yX6I/XuGwel80viXhda2OIZl4FH4IX1kRHfWKaJCEIrI5p
0JqAKeWJRydZTiEkqb2hJuT0iDfnfzy4YO5b1Ik7q/xZFTp+na76vvIblKtwKWySrZZ6kDJxI/7f
P1TYdwv3gol6xcIyLmBH45sN72x0s8GNxjYbWlKpl8tjKNO4IP/q/cmJ50ZwpjRNSnDAbWBfjE7R
EhK4DkrjWQanXGtmrHNGZsFh9JIwVichD07btmlt/FloV+NFtX9AU1P3bE/o51Fba3vd0/cf9hX0
vaiinUVCudq730pzYOPfP7vxPRbnGEfYtsZC/1qnVM3vUpjmaWjdYucHbQAIsjs5d/qwwMX+VZ/y
+vnOsBM8ZDk9K7mQGL5iIgR8Lccunz3rGjZPJbbP1nIU+TAN3THyiGHkwSzOqisPyCHbV/tUeUZ0
PaLrF7Rv4SjhmUvHnWLcC2+DTFwGlqQLUghMUEqZIjCVZW2Vy8pHYYxLjluQig/jwdg1oM1GNHoW
9c+lMJi3pDTFHehJ2cidNMltJvN7f3patqPh3Wo7ulQB/0b/xRG0vjzF5gKqMp5YFyPFAyVvoF5Y
HiuGK+Wiv8l5yZEbmhvqCeeOM+a5jsbYcHD8/T7V7Rwi9VT3cM3dPvs5Cvu1km0nALifTeFDcxY0
7/M5FYfG2zpirHsNLQJKXMCNA9Hh7qgp+ANcNQ6SV02TQzojITTkLTRcQjPbQkZKTk83tx0nDVaD
ArxTEF81VnSEL88En4AmmkepaOtsrhh406vtGc5G2CWxQr3dVuAGpbv6CAKZdlBWJVkrlziuk5he
uDxql2BTLq+UfMxyqF7yNXbVS9npsrtsVy9N+xeUnZK8FVUe10tKl3/C8s70/qoUx1n3+jmC5BEk
v5y51GeumTCBi6ClURrmRxMStYEiaaQmAVnXowuJ6BAs194mDm0Z7xw0R8LDIPnHLvHfNjbemj5W
nhqgqcu3rI+Vmzm2nWonrnpd+TLJ4gb2MkCgrQCfbafg9ZVVmV0tnf5aXlkjoB6NwK/olgW6752J
gJ2xrqhl5DQaJqLhztpIFTHGeJkZwQN+IUB5BZeAvWWQ0RxMOHCwvncAdqPozW9XvXpE29ud1mNU
/rluWHephuZuoJGYPlTvp/OE/ZyW27gnW9yy0nUqIKkPyRfvV/FFzXgcCMZ3xxbNQn11cxvvBsTg
2z4HbMst4QjeJvVpPBDollDiCKGYHESqrfy1dktMc0yU1ohIR0T6IicjioyKhGcSlCdJ06RjSD5x
HzlGDkTMSq9ocjCAIhGiGM8BROBGGW+pHCCWYGlIMWNtfVatggh+j9GpZDM9Q11SwLeh5L/H5JQP
JbEthTseCFjk3brIzXQ2mUKrsDaFFfjrXtGm/ndY/6S8vsKPhbYVc8rf9aDr7y/qyxG7jtj1qzcX
xLigOEiapBcKFrAqxWhzooFHzqw3DkoKwZUmVGlBYRGbY9bJZZE4ywdvBm8bhRVR6R678AqsAtxd
lWpMw/5UtdXsFd2gSn3UOmwlmt02EK9b89ARpWMjjgw5uL0BHWk8tpv0srdlZP7l7kDkujugtU1V
MCRw3catT8qz9WQ8+HoLpb4+glD19SCYdAu8k6dlORvx54g/X1AGypxVcJGYqCyRPiLliYNh9Job
4gmFNqllQkdBHLdSKsdFojForUL2iQ7jNtCaxOKX23fKPe955XbO/h/i5vcjFhyx4FevurD8Ay2l
OQTDvYOeoWu9T1oTqZQTJhtilZSRxKh5AlVmxCMO1CxpGWU+2Jt1pZygmx1ctVbQXST27nGee/8k
fvu1J2ib8gm3HXFr8Sj/T/kA10jZnfww5OH+yfuTQrRxUiMTZGHVnOOvW/x1f7K8EZq7WyfEcPdX
4AZ5rtDy5NfgU3mm1HzkQBlx4zj5PH6I5rWgPnlJoW7omZYiGscCVMmMoVZLQJJWeO5FZNonla3g
hrKYFGOZyaE4UBpb3ZyYfThrDpZoB0I2F8pBVCmyDRY7RCa70WRjm8bwqBFQfu0kuIRGbQAjUni8
hLXzZDRVVgvvIpM6Ea6oBUEwEVQyKVFNaIDr3tBg43F8JX3NXSpuixN3am5/P29NaNKPOtqttQcz
jCwTJ7nZ8hi7Sh+moMHV++ni7RSBbZHnQJxp920B4vjH+7BoxmHQYCPWOh6y1s2Srp0ojwqmMcME
9zQM50UQ2XpvyuLOeUzcExlIFqTbEx2fTxwm0jpsUnbkAFEybhyOAPClRvN7FZxViaZMvSLOJ8kC
hQ5QGqIJIseQnVTOkUCUJFnA6FGbABByAIBhsI3DviEt4Qm0T5N+BaWqcyw7uXB+PvlQfVN9PF2x
peMUU566HCOMRtz3Eg+VQ8pMo/8j6ChLRrGC9nA4k+UpWyKsTtJmkYNJzFhPiWWaJsa0Aax4xEbi
HmWtn6Su1ekGJFw//8TY8nZHsRWyyvXtTblx56b1fOXf2IGC62Cjw/AgJXvxIICLQfMv/XmZ14cD
6Fpy/J78nOo5NHpy+TR+8bMB5CkoEDGhPAZqyYGl4G3eHYHojzxxZMg/NfX6fFp2WUIaGdi/3LBu
LjmjWTHrnQ5RyGwcnvd4KYTWjgZlI7SaYRATV4Ql6kGWRIkm3lnOj6GjE3S3q3Wdbm5/TpiYeUgD
RYtZ4sdkvGLDpPFqrKE6quWtR57R/irl1zESNA9dfgKDMzxQLaX+yTYot2QekeoXuOiUNhgm4VHG
I9UJfqxUiVjCuSTQCxPxOqUqBZOpAIE4z9YGl1KMnB5nDfmDHEGzxdurdodw0N27k/+o00dAANW/
gwoXqIJ5LG0JED75V/j+faz+C6rA6xp+yg7fyf/70S0W1X/BHF5ugG21onkgufvq/wI49vfX13gL
NwHN6eUznOUutiXsy7UhzYYMw9jQX2mYjnCsvLCYelQt6/qn7jY9ptumbbs0M6aUHDdIX2hkj6VU
O6e0V0YSB9OT0URH7rFr6KWFtEvBApR3FPNZM8F5EF5RLqzjxgxLyNSZrZpdl7Nqtp1M8sPF7LLZ
aFnvsox7ouOe6AvU3uA9sZzCkASNHtKWGFhbO++ISIpE6mWQ3gWhuHQ0ouslB8DpLAxEZowdy7q0
Rz/rgzR01y7okxmWQJLVyXfZAHU9SqV8VPA23R0Cc/tzqq/d3d109uYTbCk0m53bqbaRkOesQnhy
+St4Jq43PDblatOv/VpC7R6s1Y3RH3JEe+N88ejOhJEmeOMtTAZB0WCoCpYGzYLjSSQnPeaKkwl3
MDQJUsJsQrnP1mYoYPjz/SE7NnU5g+DLilAolHDM8jbCW7IRl1ke6Tg/hurVqnyvEOsUirsKNdGb
pMOvvyO4E27HzXDvaW6kuJheVufnTWMX7y43SnVmOtqb98gzgOkQhy7/iZQoD5y6lPmz4U25vS8z
aRmK8bDli1Fio2BlxrBKmaxn0gK2i4aC5noRKCzlrMDf3kGhbLCT0KSkMZLoPDk8omZbVVtNXQfX
hHOyfBvXbze0tRdUE16d053lWL9c3FVuqZTh4ZBschZ3RGFP82Spt+fnS63dUa6nufU+3T08Eqjv
sLmO0m79NcsB/byhC03HpIcTdHd0EKYy/3PjGvD/t/ftzY3kRp7/76eoc4RDVEuawfsxHs2F16/1
ndd27G54Y0+jUOApcZoie0lqWu0Nf/dLoIpkFVmkWFJ1T0+rxm6xCoUCEiAzkUhk/vJjaa0yx7on
cMsOileJktmLOpgD7eEfEHRRqqWppItqOkrvXYjTflXm47vPCPKDGjqooa8znFszbkyQHnRMF5mw
RLJAA/ZWQl9YRgatUxgivECcTlHcWDnuGJOCa/REOPefDudY2ojHkZnPV9odXN5MwrRCj04PNuGj
1aPvCrIbdnPy51nld1XK85OyxmNKTDKfX6HKMPmhul8ZKnfV0KqXA8roOOEUtVbcEJqU0jf54odr
IDg7pbVopivyxte7z1ak/tC0qY6SV9vpYFUdrKpfvoJto8BIOI+10coGTrnC1PhkRQWlm1JHaODW
US1dcIYZ2EQHmNCoONERHZ+AaVsUrXXRXWlUj2cfrR5/W5DT1pj10fe/2JJL3//itPbDXL2yEVO/
qomoZp0dUbUWQId08FJYtVetDaNNXu3RyTcy61c1GbWNn/R4/iHP+HND9k2etew6W9yNb+9AaDUd
bVd2ZujeZHj/8XQZbo8O6ceqVWn/PfR986+mz3D+q6uTX59cnxfpI7k3NK7hz29Orrt4djXf7EVv
hp8akJS059Vn0qI7uZvtaN4vIue8wHVKystk9E4POtK1em1Q8gcl/3XGa2ilBA6WBMcIVyIyxAjQ
rR389Yo6GyxCXmgbSeDKYE+pDrCiplgsGGI/ngUrwTqabBI8wbr7p2TlvExXo9Fj7aQyJYIZXAkG
pff1savAxEgmkOfaYiY5U0g5gyx2kiLOMfCpQVw4pmFPHpyzFPuAOUFGBEL40eFVTYZcq2/bPHna
ZMptNa+q/iJkpsWDzYcdd+bH8fQ2NZnDqkBfvV3eHanNtQfOz9PpzA1M9c2iVwTNK0K+YucF+yob
QMVXJBlA9VdJb8FlGcllmH2VnvCvciadr7ocjxPWT/JOnnUoDX/ZVym0q4szA2X9hFERniaFi6+S
5Vl/RTqQwOsQ+j+/oKl7826Ilvp8T+FFYEIJQT23jCEvQUNSXmAhUZABIRCxEmYWh0AjM5E7DoJX
YaoMA+XJ8U7xAaQ9ltM92HDz771Kpw5e57KXaM0uCSVULzAhHeCC1YC6MWz9XqmAi9FYSjT0CKqh
C7DBEyrlsxdaBxRhoCgilTA/VfZP1Y5xZh1zSsGcWtEH7Fol3kbrcxLQxIp9XkBtSSBS/bPLghRv
oOabYpQvTjdXDXW0oeYNm8Rhk/ilMjZ1mCuMvUIGZgkUFAGzhDwNnnsjuYCdo6JOANMTBjQoq0KU
NEiuog3OHI29VmPf9dav5GC0N1dDxcKNw4OKi0fkzfj0Te3v9n6ywcDP2EsmgnNnswiFc9hVgkqf
jgmmBto3k264v6Q9wj31dvPrH8Pc3Iabv8Sb30CnP43+xr7in1iBw71ojPh5GSd+dvu/bIAYdoCf
rRxl0hJOJQM9KQGfYxIE09xzyqMI1lHhDYIBYoS5JZhYahTi0TEfhCSExG47wPYI8duwvLk3j7ez
Sa+AGensK6WQTlEZ50WCpChRKfLJWumptzpcQ+URWTr/24nsYLsFx7Ou6Ok8sASzAEpphuC5vn4y
82KXPXA/YJEpLkdnGs8L2S+FvdjAhh3soOj+DE9DUDROGo8QojEIx6ShWASisOLOY1BzvTXYcQUD
ZBSog1mD9TxY4gWTWL58B1sTz6P057y4rwVDp5L/MHYSUrTlbp6z6en1Tp6y05rroZtNapVTusLK
o3onD+J89r7exq7TYWrq8rLIjbTFwIxv75abQJ7Vf1sY5tu118O7gv6vr1IfoNtf73SeqIPOUVGN
6SlCbh7edaOlfKFBTk7u+CRJ96na0WT52ftpR8KqV5qkne0nbXdKr6vXawVn+fQtd3C+noDzWo+n
9bTvmybR9T7PVvhRNX415Zu5l7A4rzUxvoZWfqpU7z+/lWawqXwx2HkiBo8M9MWC0Qp7RzxSgQfC
U1CmSFgc0nBYb5iBYcOeQVHpseDKcMpsONamsm9BWZtCjlhT2vwy9ziA3jcSbe4uOhe1JWfHkXR7
1Sla/UdXorU16WZz8Zm3SNaDr+yKyzN83UpF2xp0mKLVKtSNqJal6AIfQ9n9Be5A23op6khd23p0
tp++npajmh1vZ0VC18X+vK73O47TB9elnTytqX4n8IrFbPJjyO0mAN+QnIqh+fsjDYLsIMgb1Jz3
mgjsX8M8p6OCeUsff0u3p12chRfrFFaLfpyFRye/BjF9G2pU/TXM3k1CN7rCySbnVk90/WG2XJrU
IgjY/DHrRlJ+d1km/xq8hYcN9yvN1MWd0UHIILAKjEfrpQ1K+wAVItfEYCmNZArLwC0MW1lrhGKW
Yc24tU8kavj3B3sM/FiSo6PEMCXwew15rCiBHkajxYO9SjE58Hmad1l5bYG7nAJo82qfO5lPAfsA
y01yghyAHz7nuLTkIW8FNONo5I55E6ITyV/eM/g/iVIQxhWRGgltXSQhIByx8ZhqbqLuiva1yw5Z
B6qxQ4MbLvZzw+rFMjgNGjgtnoX8NZtOPuTz1kRa9WNdoYDBDzYYd1esf8m5Yhms1SEXFtmTcxU4
b7nCPoNfws2k4X7c07lJdUYiq9AjvApHwrzVuN/hOLMfr96WWLLf1K5/m/78riyoIsVy6S7lUP/n
S/vvTj7tMfKg0Q0a3c9vtfKIIqYYJ0EqCRPIDOeRMNjLQscUJsyBNmewQtbw4EigmsZArCBBR8Oc
6sEJsE1mr1DHHteIY8v5XsfAtLaV2X/qNuxxrOFaXo23ob9SgxvAsWrRg8LBQ3CwZn/5+zjJg9Ei
UkYcMZQmTmZKE0yJhP9xjizoqVrihFBrKIY5xsKkdMwixkCPRqR9irc3EGWZvfd5DdYZvGEP3OHx
HQsmNJy4fBdUoY3jj0nsmkZUYttmX8Gk0FYhagt4OIWd2jQptgmhYL4cu4cJqMDVBByp2rZjDyzu
wmRys5jN+8ULS54/dJXRq8zulcpU8gxK+QZ4x8w267Zw1VJqPbWUWmy09pKQMegiRdBRDf/gWklQ
vKEfoTpRm6hjZQupJaHKVpTsh0pKysxgWJS5G1Sa1+T/wzqBFIiyldSaZJtWtPiC8/d8fk0Pq9hn
uIphRoOyKFKOJVHMG2aUUJYR6I2AGmtppNGqlFOcOi80oYpDfwRWNyCTdfLPpO0ReiDljZ1NzI0f
zwMsJuM+wWH49qaWvsBP8ALrXqLr9DYN6gVOoBeE0l78QMmTrqmiy1TRn3c2xulycCv/fNNBWBMQ
NsZo7TmxNhoVicGYWaUd1Q7kVgogVlYgYiSJVGPHdaDUw5QLZrqJLbzHUHp/D1PxEXKOPZE3oQRc
6p46YSshwPlnldchw8/0klI2HzPb9Med7BJ34tePw8mQTWGwcA7i9ggn8SRoiXMpk46JloQoU66d
YLBDwYjoGKLJEmIJ8VwogZzTkiMQyEQY4p5wEv/dfx+2bdbFbGsqhXU6npyHZWP+eGxLpJAefGhL
nrA2hvyvy1Yo2XUvSRTsRVLfzvbz8/Tm/XgG0EEmfDH2T4qhE+IlD9hJCX0xi7GJLLBAOIyKWOLg
k0mMLKXI66C9CtZ4RIKPx9s/D/H/ylS5JQJWxdtSoG7Z3BYE2w6fWRZcZlnQ5gzcFAftNZ6X/+vO
LIuleRsWxfL9rCjNovA1VO0tMnck6pZ34UPC9IK3l8UENkbJbSBUE9bNYErb47Dvgx8b+EXPzbvw
93GvGDp4Z2NOdrfqvAPuTS9BhhjtULVTQjvk5sW9RI+LbRL0C8wFshHRPuixw5r1ik7qpXPKSS5h
TSJMYafTjBJNqCNeWUSM0CIYG7wIKk2sMDQGHClH1CkdD+uxv/b+YD6GLWE6smYRYClLH7CdvgvJ
2X+N3Jorp/O8r3iC4sl1i4uyctPlsqw6nLkPZ+5fPp4gKJA6YM6BR7mynEeOkj1PCWuoheHBDZbw
H4qCCp0AXQUWJnLjJOb4aJ1zD6uWnLpm1KTztfLp2YpNU409XHrEOfkac6fqZBahwpqmIxW7dkiM
nKrr5hYqLsP805kuO6gpJ3+enRfQF3w7fuUnMF6AmrtYJA05qcmzRVg5v+YcBSf9HIzXDuDF9e5B
zfEj+K8UX5Wo2x1GNfMfdyQ622FZNsWWCP3bXrX4k4/mpzhk/1JjnocD9p8DAJKjhETljMLIYRow
6JaRYR8tQkhGalRwCUZOO+qVoJqC8om0994aGRgn3U6q2l36J2axvPnt+Hbc5ykVJvQTO7aTDuaA
flDbOuz0BwzcYVP9StOfBKexZFErz5ADYcehP6YTwBt2GFR2l8CEUAyUaukxFtRLgrgBUQfz2keq
7Y1826DgVmr3tPhlAWrOsDkeNsdfOh8Sow3i0jJveaSKpcR93HDHBeyJLUnY1DDMGANhNOqgBfNS
GQlkuuCYFcdujhvcVnyz5Qw+yhyHTosXocymPgqf+ih3vWVwY7njOHLjK1pVoWm4vZnOFn1ueRO2
S7ld7JSY+QL3sslbpYem3XJU99W7TKPu7OxzIQdtadCWXmdoO484eg0C1wkafNSwF5SMYCqQpynT
agwwYRqpwCRoU8ZRboUP3jLjHFP2JRmhK+FXxQF9s3GUAcHa5iozjvnJdwXacodZKVdDMoBBs3oN
WdyZ00BoFNJhwTDMo/QB+4Q8YWGLo4yWgShvpcbGBSklYRa2Owgr4qjA9ljNaps/s2a1w5/1BMnp
wbfAnvWYvQ1zPksHezcfT5eJFJj7H1cheovUvckEHKl+yfZ8ceF+9mO4mfk+kbhPygcdsApOPtxN
e7Gxn8CPBZjzvkvf81vTT98TkCEP5jZ06dzcmnAyKF+D8vU6/ZgdyGmHAqFceoQUJioQYogwiKVQ
EquMYAhzrZGGrpVOvVLBYSZDwhZ6kf/HRvaNQFSu9S+4JsVlcXKyD8Axww6lFxLu0BY6wxg22ySD
cm5paFWr+eMifeCrccYtaiaDgcc/MVzX35KEOhCNlYGQVs3DYhTmY1cYWL7u7sMSLjPe59SZZZjm
LyKdR5rJZPZ+iNf6nBw3ogX9yDOYR8OQocoRzDz33HkjQ4wM8aQ7KamQFyoqoTQSEiETHHCn58dq
ULs8lvSiDYulu0McVqZGW+tXow1/nTa8gOvsddZgr5rLR5O7jnD4KKkvgPoC1pWEA7bWvEqsryN1
L3UA2MuOyyhbKDSTPs1go+QvcXpepAkl6VOcFzx96nOY1Np9AjU47WAsOqH9uEPUCaS9Ekj6J3B7
BsmLCGQnP+dQXPhxD6G4n++xg4dmPeagNxmYHh5DtM4jpaw2NAGWBqUDbJxxsCYSalGMxjHFlcJa
WY86OTiw9lDcxcMcGg0Gat64fnPF8S7O/ugT54rjrKegh6N7FEOy32H3+EolXQB1lUrrqdEBGsZG
WcKUkM5FKVISc8FIYDJSzo103jFmMFOWgjBkFnPzckeHbTk3mmyS/q6fgF4qizfFJP3bSv25rjOY
7Qez/ZcfoeqUxTRaqbUKBiPsiTDCRaqQVsgpJzSFvSUngbrALI2BS5hFoR3RRPujzfatXJk3i7Un
l4V4M3kzaeBDtzJkl8CAqoEis312lEj9H7dLZHSPr+j8NsFZT8PtR4kLuGBd/SREv5glFwr+dXJW
0L2Dplzg57pqDBrXoHG9Iud5QUh0QjmrKIPxeU6SUdDiKDmBsaRhcM8QjcgqbJP2hS2oZZZQwZ3l
L3GWqAnCpsPEvXmssgLgK3T9BNpIBhH4Lr2zZaAvW3lsRnKax0ExGxSzV+BPIWBj5HnQDksTldfa
aoKowTBflEJHVsFjrrAgyohoPChrXgakpQUtLhzvqbrDwmtHiSYXN/KnPbb4Wqx5+dv8Zkt+uIqh
d9CRG0z9LFfYPIhtj4wizmf3tcQfx7tmsPYUa8v5+L5MYtL3qUAFiQyaTzJelxqQLstW5veVbpTN
22XEYvmKPL1+AV7nydWInJd9lHbz6u91fwb7ngeHOw2Objqqul0dH1RHHFVXvQ24xPVLfeWOcL5N
ENWsogGX2H/VXIhM1IuHqar2c1/VCGV1IKKbYxsON4aVqlfAEGQc0Viw6Bg3AscgVZBIyOikg8mV
jBASjMZKwYwaImDtQlKaYJTWXnU73GiP3szJn27u4bc7fjcZu1J97TEH5vo8lG2OF3XFZRidnm7z
7iixnaw4fF0xfcrUUIeUkLklkl/NMqTRe2oM1Vt7QerK0UpCrU5YaR5adZSK28a4kmKsVpNUQoh1
GyRO4Pj5XYKgf1RJLpIvEjY9Y32Nc7XKrL4hlodXDZi0jVNV081rNWm1cvFu40yJAMrvMIHtS7n6
Xmluj8g89tPBmDEYM15nnCwsESzBShEVuUDBYKaZo5iJGBVi3lArkCMiKusF1UgxxJ3VESPBvGfo
sDHj/Xw2vb0o9xyHzBptq8k69SEI8tUlaeYEzRuD0aj6MMWbwua9kjkvcgrEv4/fjaoG0runp/np
pmRdp62nrRyiGQp6sIMMdpAvXSJYlk6OgwL90bFAlGQhJYXDWAlvKVOOpZD6aA3BxDtGrBWESyYQ
1QbVkj48ZQfpwvO1xKcls5d/n+b4yuzRhe1fmiz1XZhDd/dVetT340UomoNMZ2KZ/hUa6mIrW+r7
Wfl8caTpZI9npZncLHpFR9XH611Mf3IfoF5O5LqATyk1aI2D1vg63Ssx0cZiz6VN3pMwyhgkjcZr
zSSyzDCksHfWGoxMsFzzYISVMZAoYS1BPSQXLaXbBloleRix8tLmjINl+kG4JJvAxO2glErK02YN
/GQNsluDr1ye7qHL6ub9HUwbvPFd4wUPFUxxVtia535+K/09K/ymOI2pViuNy21u09hqlRPe4zS5
+2+5Vw3R0IPW+gokEg9CSGu0N5b6SAOViAnrIoLBIBYsVtilURDrHWZAC+FUquAU8tiYo92qanIn
n6l9v0xMSstLu0p1+v2yFDz5EoTGaFqF61TvfL9cy5VmFfx0FbJbhZf3K9mTb0rZM8rCp/bGWvis
SxqyZ12aRc/6Lkue9V0WPOu7LHcucHnbJnWOSb5qJimhKpSXDmT3SUcGRXo+XuHrHKsL6wPIsv8x
HwNL93qUiLdtl7sJBJ6s8ZKEdgkAtZdTNLx7GPZUAXuyBu+ErPtTjeOYgueOY9gWDNuC17MIaydw
NExzag0nRFlsVeTJS85QihAOMGYTMaVYIEYVct7GyKyC2XQp0cGLItmbMn70iM+LDykZOYFP+PdI
4ZPWdwuPOGGjf0ih6PAA/j6SXEBTQQ5sf6S5IKU4+LDKbzBODs3t24jE+2VhALWy5XkW1kMSrkEM
fOEOspxLapUI1lsbbRRMBCpgNNhZ57GgMlKmFHcmBCRgdARxRrOccNhgcrQuvsPxwPDA78DuwO2J
2ddub4nfocIbYPcLeHD2SOCSXgCbnz1SuMQXwOCnRVGHMarYvOFUtzILJ1Y/XT/J7N5eL7H882An
8+iK93cBVOJ51ouX1UiTZw7oHWOfcCaSiw4QS4t3s3EyJZt5ZUc+TmHm7dmvw+MyRfrflBH+ffre
nfy1xEU6L06Sd2BOefoY5m68gJmCm3ep37EL6Xoxm2SfppOXZDy42tdkL3ldexmN6DKaqsfPiX7d
hf5N+9eDojyskK8TeYbCVOBgtfLIcy2cpkIpmT65UYxrTB3SgcKYjDfMwvwSCeNTRGtNJHlJ6tqm
aE8QM+fFZCdp7VXIh6Y5ZwpUSUtMAqQJpykR7aQJ2PRJs8sOZuaBcX9KyCjliaDBKQkbW6aRRkj7
KKmOXGulHOi8SFoYqCZRkCiZ0y5QBHNocQxHm5n3Men8aDa9TGy6HfbROevrbEVJsXgX3DiOgy8W
47+HZJ8taVuUMR8lGnoO+Ng8K/Lqf6Tplrdne53MFosbc59gonpN9Ip2Uqhigjr4G2R/sF58HFqy
u3ZJ5op6wXeBPnfo4KgLIRQNKCyDQvda1wXspEIUJtFpbzgKWvMY4TPAMLyFZYJiTQ3xlHKFYRqR
iY7BQ2kIteEJAPU/HI4J3kjIEUjqBzOBx4vlebEwQGP5YKXfwfpQKy2+LWov1AyW1ePLRuWLeuUd
U0dZ6ZD5c/CgHZTE1xFJrDCXFkmNgmXRU80TaihlIggvhI6gHyKBteOYYxZkSGABRsqgYkBSanZ0
JPEexm/wfaUCjuOozsvf1Xl5o1cewfdNhbLi+lxYcv38gNf8k+rmnVlmPXKRx7YiB4TWxju2Krsz
VZ3U6xpdHno7UtnkB/wE7mfT5V1yO7gpfQ9+GuC+/wBO70WzO77L3ycR1Eef4vl9DnrjoDe+nqUC
K0ecURaTwFISNOsiJlYFx5FK5+LWyYB4pF5pYYMIhFKawnyjgpnFnPXgSNsq8karAlLTHNdl2VMt
HT41SuhOCU8lo0aRPN0tUy1lKVnbbiE53VUrswA5pHeWEubnrngOsmSQJYdlibKBKIW4gtnQIgYF
M8gjo8FQ4jhP9kmHNNQIIHSoYAobGgSIHRKwYtR0O3Y/KDFWKue67PKyKS8uL+nWPd+6l1v3ause
o+0CcrqtfSYVar9uuiUXjnFT3TmSL3XSTMUKAsfBjRlPFwXFhTcfFtUh/ZF6qdiToejHMF+Eyhx8
k6ysvZ7J/1vw6YT3D/MQ8lnwP4OOlj7/8w4moSww7u3JdZdzXh/+Lb05DWH+h3yu/DD55/y5HN/9
Z7p46wyU9HSO/cPsLlNu7s0kff4wC/nzNszmt6Eb5dO72Q/5RBway5+hvA+381m47Y3iNKOZ0pLy
ezP/0I1OmMBM14reDynn03CoPqx/rzSPEvIeYW5SfkoNBAdJQG32kTkinceEK48YzKzHITrjVKSI
aAFUYsklw+LlunSLmB6V1+ly94z98eqbby7I9QbfbVN5OGEfjKevEx8bwz5XuRgsgqYi8K1LQ+TR
WIwZUYJQJHgEXRcZZDTGVDvtGTA6lHjFjk/K9ASvzlu5Fe/h1hefs1f0rE/Vc4KlDYricw/V2zNe
/n489Tf/Ou4TsevqCl+fFxlQevV5XtDrLgoN7kezSn2vaKldkhIEsBtF6fV+iDp5PEmEwEfS1BrX
8OfvJ53oSo0Net6g571OPU9YIjAN0aZMfSFh9ipolavArKBSeaElklriaBUmBJsUG+w4RVQyKpjp
B7JqJUJHk41mdz+e/inJ6st0NRo91oB7odKAJzUodK8xKNBwUNeQY6CvWU6i88gYpJzwSilJKcMq
wIRx41EMOgOYSqKYZfDMCn00nlSTITeQ2ls8edpkyh1g7LL6i8CxFw82q2x35sekr0GT4/uH++SY
ebu8O1JvU3vsgG6ZQ4BumulZXu4P2eKEeLw+QvrxQdwlosNxeT9p7tgLcL0HOKhBI3ulOeicVATU
MGcR99bHQLGLNAl04rh2CrbvXiOFKSHaE+wxs1EhkO7UGsMi7kcjawrH0eS8sOtw7zIDXco+Zwct
bNDCXiGLImyMMsRAhxGJlLvIas0QTKLAkSng2RiYc9YnW7mWVpOUV1Ilv2XtcAez2hYT2pUpLeeb
m7yxDXzN52eZ22SXW3d5nGol2iOef1fGufRrEauMYWUCDp4uRWmFOi90V0NUylzRn4EsG+eAnkxX
R0pYT2ToMlHH2mzYhQy9ZZkbFK5B4XpF4SYiIEGj01h56okVPDLisJIOGwqqlQ3UqkACopIHoaNy
GHmBsUJEcuJ7SPpbicu69asS6VcgtO+vqnOSdF1tta8HPWvQs754zgSaneeMGam80lhEoiPVSErP
o9JeYWKJVpIK6bHT0VgE11R62CwRFSQ9Vs9q8N+2EatkQbTLgs8CorkNy6xxxfF8sVxhlifVKxh3
tzJ2Hal74Vbd6+HdO/jJumWfkRYnf/2vjGzSIZK2D63m5J/Ht781S/PJ+4Wf4m3y/zq+3yFad1Cf
XilAmTUxWoMl5ogpDG0LLjkQEYINOGpGMPPcekKNY/COVDBiYRAVIYrAyMvVp7XESz4nKwVqXVhc
rlC8swBP0nuefl+jhO2QXjhtJvOFoqvxdfHdZXHy65MChr0q+RZK/t/JVpLfTTdn635qi0eLMB70
tUFf+1JxwzXHSBDsuUE4KWfCY24MMyAQMNUeJAXxSZ2jNPBAmWHB+PSSccrALByrr20z/HyX5VE9
3W870zfS+x7B+Nu83nh/P793ACnMwbhJO8zNFM4sQgEckHTTMG94sZXea0fqie1YMG52b8fT/MNZ
9B8EMcvTnbyx5mU4xO0qHMKmcIgu1qmr7N5VNZivU5PrC2iy/qzsp3bZ+ryia7dkq3ZJ7Pqq7Wm9
qXrBnro1+ppFB+u3dbKP7p5CKlq/N/h8vwpjsZMq6GLVcefvdOsr2PP97H4He6biiXkrCa9d7j5s
NrVV1lp9Q1yzaH/lPX0c+r5zuNDmcvfh9hQ0ylqr1ye1XrS/8p4+nqJ7/YtpKztQfU93B76T3Tot
g9z/Le2vcpCO/eOvc3NTHG4V1drfLmx/YTOurbID1ff18yT9zS9wu/DQC/u6PPAdtlRqG+z+b/FA
ncO0HDMPNU7cLjz0wv6p38unLZXav/R9vHugzmFajp+HfT+MAzx+qNJhso76zRySAE/W6tTk8fS2
z+dHW6M/1ZLc35L0McXkp2DX4eB0sPy90oNT7aw2SCtnFVPKmMgNkYbShMgnnYgkWGmpS5FlJqBk
/mNAhNaBWQbjfgnw8s7udZT+4BrAStrpl2UJZbklwwhIvOvtsLTrjdEgTNKGe08/V/ib6yZ8Sm7h
LIHITs7Tu2fFVVkTXV8P8aeDQfB1ng1gJIRFwgG1OvLoXCQwd9QYAYU6eoMFN4F6zi1MMDNOc46M
VTGmSY1Ho6jslQbzNnlQZhyat0uE+a5MmHeTCvMDcuGsLhVeHOeaHfjMZFK8my0WYzsJDcpybuy7
Wmbs7OG3CYM90nxIW82H9+bxZvFgzXxuPqRv3j/06++Hz4sLAv/oeYGym9+FSiUdNFqMSS9atiip
uMAok9KJBNVLIMVVnglW9l/OSgci1HA2PWior9SBCBkarMfcK4Mt0dbDWkNhoZFKGE0ZFRolgATj
JFVIM2M8Aa2WAEGEG9tDau02MTmCu5XymBK+ppUpFVUxdvBGmPqEo3AHnLnJuX0/nm49wJs3FrOb
aOabXN1xYm5rd81DMJAi061Tb+g/H341FOV2crZL3lQvb723Q20KGdwuXb17XuDT5vvVAGpH6mGy
oXMrZ2A7ofgpihqNN9AO03/LcP9ud7hHzE6HUe7SlHvdndJxrH/N32533DIX619E6wCgvXKGYSLz
WWf9ldbtEmqGdq6rDzkYh33MFx927TXXNCrnKFdp70KCVjxlYsXKSu8kYhZG66Fb7DhTHENFiWD4
wUsej3ZEPbBa5IzgjdUil7RJvfJBi7Rbv1FbLXLZerUo71pXiypD+dZaUZW2EbJ3ndi807ZGFIfF
5/rl9QJRlewuDwdow4eIqDVZAV2WNfcsCIen4NjhPLUSbKZ/dGghON0a9t5VINd6ehWoGluvAfXE
9G1rQJeoM3g/x/JXP/Ri9ctf7VsrjPpUdORWlR0Aos/boh53qP9z8ptxANqKv4Vbc/JNgWFfdvLr
iQeSfwOiax4mk1Xp/y0r/gHam39YFf41FYbiN7PHXPKPnQxK6CfAmv/ogyKfHrP/Y4+JD/j8w258
0KKOwJqSCHsFm2tEjQjMyyg5lo44HAjoUjI4hRhmltMAKhSLSlJLMPzTDkYexYvOizZrwMiP3bK2
A15bes1kknCm/tcl7MrXuDap8lclSuDodAt2ajjJGXZAr+UkJ71lrGFcWM2Ckz66ILkVUUAfAnkb
cXCEam9ERNY67ZVAKelulBYI7YaHv82n8xZOfUwa6l5G7SFZZwlQnzYVk0mFE5oTwi/MfSh9sVOX
UNnMj9VP2xMl+fns3Q0o+8sPvaqnDoO+skKjdyTdrDHpHYXbhNfyj+OVlwMt/qMfPW23/URiD+T2
Sd+KpF4mdM8cDnrhoBe+Ir0wCmsFcgImzdJIhTREC++4hqVEwjrDFTNEYAOfhPJAvHQ8wgRHZYT0
oR/Eq40UzgvP2pUo38Ca8z9vw4dvynUgLzpwe17dVqsP/iqFh8PqkxaN6skipSspBcOAlTUojq8w
kZLjxHFKvAFVMARqbRCRWWkNdEZpFDCzWEnpnQ/BSie54ziCRJCwK8TiaNN5C/tmDbDBvhvuHW3Y
9/RY/q1jbeX6ndTJRGCRCcwoEo1U79PuqmQ7Fr0PbnxvJjfL2c1f3NJM+kU1Pd7vhXziZJu99Efp
8R0yPKhrg7r2Og9DicTMWg3zZDkyWCjCCZXIGhiA98gFpbVjIO2xcIxapySxhEesJYxM8Zc71WxL
uVEq+PPD/Uplm6VCuN+4eOTQauDhTYn/8wxuqhfLovd3MNBV0a7T+L0ZT+F3t3mr+GWhNhXWnZ5d
1iq/WXe9qVkjZn35psBoU2PVwddfX666qNadVS+D7jjojl/+xtA7ijTMocPKaK4UspgG6zwhATaA
3htQEWFeCUYkpfG1gabwEiQJk1CRHK077pcn8x2JskaWqMuUX60KG2JlXVpKllWzSbJsu4lX8qIh
W35Vr7KioC5d3qxIaNRcFW6kyxuMGjUa4uVX26bS0aqr0+eBWMCPZr5czekqkSc8yc1W90cquWqv
6/lH8Din5yCDUYkuC5ccZYzY82cnYwcu7gfKP+HKMgJUAVkwJYVC1y/C9ieCi54oSz7xBEjT5wWF
+SMYqExTCJ9il0rVQaHHEkQLOui6/jBdPLx7N5svg7+J40f48WaOhl9YmI9dMYHf6Bx+ceHRheAX
sOtaFBY4wh/329OHfntx3HewAy9hhHOog6ggjrfnr8P+BPfz/ZJMiczksUzeLlUdtmmytx+dyHDH
LIdjnPeybRw2ccMm7vWoVkZZCUMJQjoemFdWRWEjh86V1cnIHp0LFhPGmPLEaWWjiBoULWGFYeQJ
m/uvvX8qKKIUoqN3IKnDefF2Ox4il1feFnE8BeWsfCEF5F0lc9zm4Lf0Up2elgitHzZFb4uLAp9e
t4ZAlM9q+7v0/Id6c1su9eMIr2c/yVyxJQBhm9Sr8fXVD9ebIIwDoQb7ojgaTTfH+8NpSxtZ/XuY
z2/y9EE7+TNRcVFdPqbLJpVpJq7hQXtz24EHm+b39L8zls0bR85XCqHYeZCpPK+13HTFadR/e301
zfVfsEsGVWBR/pizzhD8RssNj8E95KtogKt8jc1/kZSNtZr8R3jv8Xfz+Wxer+LDEl5Lz3Niq6TJ
Pxazh4wCnL/bXwxi8rNJoMsdYTZIgRi2gnGuvPaIRWctMjaA0MQyeJ10aqspEhHBVDJLhfDIEqS7
OP7vSsR5q0ycv1QqnmWpON8jF88K3NyctkjG+RGycX60dJy3ycf5kxJyfpSMnD9TSp5tUXtRysh5
dyk57y4n5y+RlBfbcnJ+WFJe1OXkM/33028wmPk0icnyWGv1EITa22KxnLm3oBea6cLkdhZH7cFk
e3YZ4/3NOzOevx8v+nToH5W7sDKjDEanx28jRrAbSa7iONkN1Gkfm5wRWe1xUnIW3IWYRD1sjDAM
hKB+iCm3pYkSlEbahZr8RpofnSwFp8OGa9hwvU5NAnQGCeqBFwiUA0+8zi4ONiphGWVMWuajsp5r
wSMx3JmoEqh6sEhjpe2LNlx1iTlKDHOzfHhX839P0WYP7yZhNEq7gR9KpeC8XPX/Pn63fuW8WF1l
qJNdd/jhWGo4lnoFSZilF8EzqVjQlsKsQauGC4yZspIwYh0yQvkYEXI8mhQEzKhS1FkMrI2P3RTs
49rKD2nDtWPQVo9n2oYf0wjaOS2ep/+taEuEjvPTFsChTSBnpnVx3MmPbM9tk7q+WR9/9WqBTyc/
SVdJdnj4R5Mqx1qOf7YDGvHxupDux/oNhJ3XbRvrw4Ft0p6XveZFlJGjKCNDXp1BYRxWmeIpdE3k
jGdURKk9QQIjTaQOyQhFHIEOkBUEMe25l4Zz6r0hQlJNBaXKupe7WTWlbQKdOE92qEUtdvL+YbIB
KNpNtbGoG6nLuunvm2JUATX8EppKf5rYMlAFyn72uuTA4wOPH+ZxLAgBXTKxrhQyMGaptMDbUiGs
YChUYx6xsUwRwRUGDZIGza2kQhvnpD9WkzzIyWv/n5JB8f7MOcDORVE3TpZvjHZ5OjP1tmNRxdfP
ypuYlc6NW+Uslrggqc3l+N1k7PIXWvjxj+N0VmM/FNMjNU1yADMkScl81vNj6Nndo/T1KL08Pjki
xoYA3syD/clwRja64oCdMawUw0rx5EoRKQ9CKG2QwpJJaw3Q6zHMo1BSRuywgjXEakIIxdg7GLly
lCIubWAGyZdjZ9Rk4WiylaZ6kZ3woDh5zWc85HLNSJCPk9N8GpUepqPF08FEOJgIv3h2tdGooBg3
znoSJLQsvUYuUFDjokDReGBXrZhXWsP/I0mBzgp7yo0IUuJucBlbrLmtd22487KNO0vmPAPWfJZm
VsJkvL8Ly7vk570292XnFjebLkFlW6SLFYmVC/giOQtMZ0eikEvRqqbZ8e3Noh4N05ty1kEzYf1g
fG+0wg59077cfGk3TVANmtigib1K0U4VgQYdvC5Az+KwRdcYGex49DIEZ4JgWjsUEPVWe4UdaGkK
Ee4wApkv/IsOcit5NwIRuratLXJYUpLiubS4yEjb+bq5DAxRg4Pu9RqyUFMhI0E4RMMEkCqsDNCT
905yIi3XklPrBNIyShqQUxpBNz76gIESGo7VvbZ4cW0Wg7IaO55tmHFdo40hO5rCkp61KN3r0uUE
Fnlg0DJr9b2ZTNLNGpzGdIfSlXrPAex8sbz57fi21/gnTLpENvWh8TAuPrF+1wX5tg9siY/hz/5n
cx8OuLNPEzDeyXi6PFnhpgCbjKfNBgfh+NP6rlDMCSIugWwpBWNjPlJJGchBD5LRKC5h42q50dyH
ED3VwihrYaTKEmw3cDzHCBHV7r97G5Y3yT955txDSmN/k3Lc9yhOTrxZmpPj2e2kXvn5HH7iYOjL
0KXj0E/Hdj6eTMbwKwM5P590IWB88pmKmr8lSg/IGvNwmyYF2l482PXKmeTO7GG5GPuQl8VV/8AH
y5mbTQZB9PkEICYTNY8wM9QwRUFWgIQx2tDoVPAYK8wkJhgLrJBX0njLWTQmJJBoK4XsJoja3cnG
i5RtYwHiqGcbEj0vKMvHeyksgLdFKe94kumf4BzwOXTSnyIvwbMoxfzZUzqYtAaT1ityNWNWGyWt
EjYFJkD3mlLisZVeWK2ZoDTC5pg6x1H0ggRstIheO+yt0zS+5HCxIYNH8HleTM/T1raWynnRBseV
t9CJbdfVpnsqZSm0aSwsq+jg4rvU8m79NpLSCyVZDZva4arphONgDbjYkHM6ZFIbJM2Xbjw3mML0
6QT2LB2zMkRHkHeEBKojE0RagzFFDHEbFVbawDyqiEmQ0cJrx9rmDkmVVearUTacr7G4ammuslRZ
V5u2VyqlyqaxLbGyU/8JqVJPrNVW9eIJmVI9v8h0XDSkyTHgtGEZ5vfjaUgScpkTkMFWyhRlN804
jlTwfry8ywIswM9rklqoPX+4P87GqOgBG+PvjYPf6dhMbn47/nGck1vf/DkfHP9EmLa8Fysg/8Qd
8ueZOQf9d1iVXpEtwieHOhK0VDgKjgjiQVNnHXbCOCekikFZa2FEzkimEImcC4MYRgJrx1+i/z4l
7UaPa0V4A14boXrtrumoDQvBYwPZqKycP94U40ZO4Vz4y+JxW3NO/1kQ1W+b2u5wfjycH3/x0iBE
gRGNhGDY61pMZWCBwTYXW2oEAbYHSqyRlMFghNEKw0QazQPjKX6D2OODMp7m/LUr37iBMrvi/w12
644MqL/cIgUaz5L+upYEpbJbbGPQlNKg6Vg4Ll50fp0noJgaaGsDFPv+brYImcw8K0kN9auJSWEd
j0fqlu2pYOfhfvZjuLk3S3eXTp5yTHKflt/Ryb+EyWSWUkL5Bx9OTs8LKJq9TwVmXt1/mD2k+/99
crpjxHy6gQ5OelfNrvqww45O/mrmy9TkLJa0wTeZbn+YwS8ifCjL4EtLZWHq24f4f6rKUCe9Xr1T
e6XLELsT1M9E/HGZKbYpeVfuxKTbyWx6W956kweYtkqzh2X7RGy9cp/fiPPxM6Zhh5zd/gf9ftDv
X6XVKfLoqI7OioAwjzJ6SpTQikofLDckQZtqGgQ0TygJPkjOvYKdgEc+qNhPgrHWtadE6Ui+8rjC
6UjXpInNc7V4sHmFT5+wxm/eKa3jNjvb1B+Q6yHb2KC7v0JOF8FwY4HPDbPKaSatosJpzBgKSmpm
QgLpRIKkbhiBPb3RBrbwlGmv9NHZxjrycg2x51m8/ELEnpLaCrOxpLhC4ynRGmsYPe9nnXB6VHsa
shRx9BF0a5hWmlSblGkgfaYI4m5aUn6j1kJusSeFMGHlV23Tqu2O1OENdbQaH+uLOmhTpzbFeSHT
J9sa+dPUsYqqVQu5xeuP4D/W/3KTa32cVeFTNj2sOJ/fiqOAVtAdCSiKmjIZHU+p0V2kjiFqKKiW
xlEKy463imgOfRvrgkOSB8YMj9382PZ45c/Dfz8An324+Uu8+VMZCtCj4OU7G9c6gEWXaMV+0jTu
kMMzVm4XJI1+ggh2CCEZJzf9/5khnMO+fNiXvx7ZCSSyJA4Rx1RLYTGjsNsOSBOkpWTYcuEV7Mo1
SEsvCHeOEGt4Ck2AMVPdA8RZi+QcTc9TpNQa4izB7ydoI7zKJALvHDp8a6QOGWegogSL9B20tHXC
tm56vJV8o9lF+i9MNi1dXu42ld84W7+ywnqH0sGrbNj2f/FwGx40Ka2C1cxajwMxjIFixmEkXGPq
jDLCBoaI454g6YSX2hmrBCZCwnQefWTXLi6ytNjAqK24Gl1vjudWDL3vuG66deSWjuRWguN+2nIe
V5MdO8+2e1sLkFFdgrQ0upEi8x058sKzvtXMbUesviRIVZM9oCApj/rNIpi5u/souG2gcKqXpIbs
Ly5CrnNEJPxiukNUFw+3/uDlkiGDVmkodJkhku7m0uwS9Tugvw2K8utd37yUSkuLg3GOhRCRM6Ag
S6udxRJzRbjxKXcfJVwJii2KsOphjwyWRAYXXq4oN2TqCOT9fbZNnxfpcqXwlg4d6+x1E5PvUuqq
9QsJnmStOT/A4nBZi+Eo0ySXrXx7Wb6fEA1GySSeqzfwhMfp7VFZ/SzXPi2+/nqFRlytouuer6B+
XvlSybb2vEPKeslMtYtvt5rZer0aaCLooqm072T6W01Rqnu2ra3n5LQD6vGgrn/h4owrL7HgsLXn
QVHGKEY0A7Z4hSXILsuDDBbEF4g77ITFwmpJXNQChB8i5niElnahVcmsHHKxkVn5tlVmXeCqbiUm
aqEfWWSNSrb+9nItseoCqwoDaRNXX39NVo/3iqpi3cKGgE2AyvfLdbq8ssp+kbWush7lSmCtn2y1
tZmdlbhaNuJUtgTWESeR5VcBU7TKEZJPOtfHjyWms/1QPCzSGWX5/VUvHbklaE8Zf+t8r3g1O2q2
/Kltz+ITW+HJC+LXB3ybYWn5WIj6HhoLyFB413IiDBWKwAISKSjIAWGDkEZcaZ5wV4mNCOaCU+5d
8IoQzjodx+n24zg/hh/KEn4Ebjx3vbpAdNnNk16S+rAOPSr0qUPk6JAeaDAJvE5Bx4R3Xppk9TZS
qeT0FihnCkHHQUmLVHJEwJEH+Ec0zGDAIPS0x9RKUMBfbhLYEnOj9YnZ6gHojbR4UzRNyauHgzvq
sNH98rM2eI0V49RqbbjVEUnpuccaR2ZC8MIx65Q1wJMOc8mh40g5xyFY0Fw8k8dudNtYMbPd6sEl
eTNveJHusmGXzI9rDk95eIqy06P2Zxy1QwK62dSZZZjCv5tV9sg+T25O7lZBVRncIF3cmR/zZw7B
mc/c2xwtk4JmOvjunBRFbrnCTEhtwoTk1orUVC/HKSf/Mm5QXosGg48U4dWN4n8ZV+RCQ7DlDkVq
oh9Ka7FYVWxXLRILLjdBXt1ITu2uTg6r5tIeLDU0aICDBvg6UQuwZljqhNHqoiQKw9oSRCq0VAvN
RIpwUIxy402IzphoU5Jiobxmmtn4IiD6NoE9ysbSSgk00xTtcFKcbDk8pDq1M5GyWvp7kSrD33FD
XYQnL9AUPwUS6Ww6+bAGGp2ChJyPHUjV8fIOlki4hIFvJqvCKDWwZLwf7EafEwSeIpgbh2KkDibJ
SY2ZthxUN8tYyNOrNHQalRWYM6ytCoorjLgwGHtydMKeA3yT9bMN3+TbLb6Z15kL/p6lmmfjZoAQ
lHcMEKpRlX6bexJ454w+Y/iWEjDUMiE3H6nzkb3JvHvU8ehu2ulPm/8aoxdQ0MuhAN6BQOWf1ig/
KFKDIvXzk/2gKHkMPWoMU6UUtYopyaDvGGiCI9TRcM9dgOlEPGIvJEXQETKgaAluTT/h4UkcJtfz
tTdNsp9Ni18W90Mo92A7e4UwTDwo5G2QlKLAYDQ8UBgU1ZQhJiKzwhsYutROkUCUwcgEqRgDfQ1Y
mbAuubGB7+7XYdqJ7X55vxVzfdpP0uoUX12lPzxSd2rHyDTe39RSKt6kBEM9ezrjdYBfmSa6W1Bb
CoVjORSuck/GpXtyH1amkqCyXZE8n7vQpSvXZKAMQytYXPebUXszWxvP7C70ld7lsjZpFaGJYD1g
+AxK2isN8aEOUcRx8B6ULmg1KEKCgv6EEcE7T3yw2niBvCExBoQoiUCVV9bSgMiLrF1t4raRg7Fk
uATvYYuLtLmGbbs5LzLCx9/H73Ldq28u8PV5kS/xN9enTYieimUHzW7Q7L54yASpo+XBAIN6DX8w
I8JwxxNWAoI9GLGYMu24k9CfMRY6ZNojrpx3lOF4rGZ3iGvnO3x7dizXzg/y7RHWNqCrPR92XAfB
JVPbkQpiO9Dl4uE+xSj+e5iPw6JXLIjjHdAI78fR9OgedT/wEse7n4lBHRvUsdcpwwWHplHKlwub
c06I0g7DJDKujE6uZ5hpxaSygQYbo9UeQ9cuBKfT1MuXu581JNxo2syGvR+cIYUx1KPIUv2zS6j1
pvw3pMweNLLX5zXPafBCpe2V5jI4RSlVMDLjEjyCjMQqHQQobDQqFozAoJZJbKhBzgnE8LEa2Q7P
rhEISrZF+/ERSr5tIBbUWffNuCrcUs9emmPbPdh1ou0Kr3wLsfxYQx7fA0h+M5v7XpPaXInzAmXj
U2mRQtkoleAButihRK0Flq2BqPx/bzY8lJuX+UKXBJJm+08SyVZN6OrlnqmkpQ0OGpSshDNAq6kg
HY16qZ1VI6WxsIXSAUGxGBAUXx24AZZeOaU8jAdDJzoGHr0N0RgaMaY8OM6M9lQgZxBVDGFYoiRH
jnBuiO8SsgVT3iqG34X5Sv+ELznEOHbjMF32G7p1/vyN7U/voCLJR6IBd3BRGcK9hv32K91vO6tA
CHIUecQKR6UlqOIgNhkygYCa7qS3ynhGYWgUgwIvQsyQtIbLSMWLjj/2SMfkrfJ2tZf+azKiXqFt
zf1tAhg4vc7FP2yKp2Vxq7JfPqsnMGu+ez+ejsap5+16FeLLDzmF0VZ5JvFqfH31w3UTWHEPTkuz
Plzl1J7p7gI6eFMryR8tRHxbvN3bZpkndA2UU+1V/no1vb56e/0T+zv/Ed57PODvXHmBQqVi9pCD
MvLXMvgyfz6eM+kQVGuuEnwK15HZQDGNMmjrjeTYwTQyrjSOBiumYfOPPRBHBAqCwP7+2N38YbFQ
lFAhe+XCWZYLdWyTLQlRr7AjIjbWgJZ3NxKiWa3M1PtDPcXZCuikLhuacCh7qtVFwlkxatRK/2sR
Eqc7hHxbm6h6B4nu6w0oTVM+dHTtNhP3MEmO3cmcUfvKitpXlri4PHh6V357R9o05KEka+9nc99v
EN88+BQ+djtPOa5SritQD3OKqzsYd1lg3Nscf5Z/CCe7Kbc2dddVjt/G7yWg7Lcfm0Mvo9yt0sMo
SwI+q1HuIew5Y9w7YYNVZrDKvMKAKAItS8Fs5EJLZ5QPLHlhEMOUNMIoqRBxTIvoHCOBW+tgxoXE
TDJNI+1mlWkH0jE/hrm5DTd/8X0GCunPNwU77cXE0sGiMjgwDAaVVwrNQa2N3mIYE4xGANkqZXv2
QqdsFBQkHuaKMke8CBJmO2WOFBwTAlfSqx4gdWvSbeO+APuCFPNDtm0Y1Rbg5I9TYOGxL/6YfnQn
O88vKsvG4n5jXXCzh2ktW3wJsjstvoOSWgerWuXnWd1EkhuDP2fFdFM4zdFJFyu03dVx631C4M1t
DI4Tg+PEl29qkVxEpSQoSqAsYYuNNMR6Ery3yEeMhEHR0+C8swjZAOOxEqlkxhXSx6ORbJuyoqjl
hY/FaPpLcnmJ6qU1jhx9/4uGzPj+F6dt1S7wxhUD2H3tiFGJhfV9KT1G0+8u8XaHuepl/nvWSD1R
kx+NF7IIuSDbHhv3X39d9voix41qxpJlY+b92sd2OZ5M1l62mwfH2TtwO3jRdHYzizeLB7soc1yE
xUdJOsFelNwB4778NlT2uCA71HD0iT11rzaBVrtT00HrZp8pHO1TyCPm4TZNELSdfnsrBkn4IrOH
5WLsS5Pfqn8QXsuZm00GQ/1nhOBDHA5eaUFF1NGJyIhAWgeCAofJxB4KQSNN2Yu8985YjykLEWgj
RtV00H9a/c2/218sgptNfRI7hH2lMNYYdFeJGHwd2f2h9qPOK0OuqKsn78x4Xi/+p3/80/8Hw93M
7Q==
````

### .build/quantization-research/heldout-mbpp-instrument-v2/receipt.json

Original bytes: 759234. SHA-256: `ffdd8022b4c8c12a49ff614c27ab15b9829bb8de033a0733c232bfab7d515e3a`.

Normalized bytes: 759234. SHA-256: `ffdd8022b4c8c12a49ff614c27ab15b9829bb8de033a0733c232bfab7d515e3a`.

````zlib-base64
eNrsfelz48iV5/f9KzAd4RBVJZXzPtqtjmjPeGc2dqbtGM/MflArFHmW6OYhg1RXlR3+3/dlAiQB
EpIICXV0CeouCUci82WS7+GX7/z7/yqKb1wZzDr4a7P+5tviG4KIOMfoHLH/wuhbJL5F7I1WRGjy
GsE5+uYsPbNyy9uQmv+pXK5ug1tPfwnFanlXunD+tjQ+lIVZ+MKHdSjn08V0tZ66wt69PZ/frc16
WRa/mNnUm/V0ufhdsVgWKzO/nQVf3ISZP1/erYu1Wf28KqDhfOnDrIBLt3frVT14Hud6dWMIF4kI
56JgLpigHWeI2siRQYw5KzxH3EZPDNGChsAVpcoaIlT0gttgrCZGx6rbiu5Gt8Y5HIUP0QnlKfXR
BmSjc55b7AjxgQokYQyKERLOYss8lx4T5632XtOqW1/C2jS71dExZi313sfItRXBUhM51tpqzZXx
jhNvrIiSu0CCt4aFCBRrQwUjqv4E5ub9dH43v3ZmFVbQLSWodT0vNCzv6voWRk+toBEWrTbr5drM
rlfBLRc+9SFQu49FeHdtyvU0Gre+th/WeSCG8k/VMH041+XdIt2oLrll+iTXabR1eReqazWNl3BS
FH/Pv+Hy3e1qDd+9+fXUJ9rw2eZGvFu4RHtarTLMl7+E6z869832PhCy3vXX7DPfNuXbu3lYrGHq
H9Y3uZvLxn1ocQLfs9nyZNvj5vLs5JvGlavm7W/gG3sXdj2mPpaN5v84ezIxxjpvDokxfYiBLoYh
5k//9qdDUv7Uh5R/axLyv/Yegc8zhjIsgH/LsLqbJZmzI/GbW7NaBd/47tz7ibdndv+j+d50AdLj
Gr5VN2bxdtuo0eYfZ7+6jv9Xx8dxIMNan/5f78xiPf1bFgvXDlj3egVC2i7fv7n9MJi86x4ti/N6
GISI1ZZxpw3zzAkeuJBcs8iJosQ4EIRURRRVlC5JcYZx0CYaBOKJI/zQMNPFL/DtXpYfNjOKiBAU
pfcwE6lo9FwhFDyJCF4GnPHgKbJecQ5vEE+ZF0bCyw45HSKTznZy1Df1ql3flss4nTVfRMQ7F5gM
UlgZFQnCY8NheEJ1oCpJfEYVI5bAGggUFLybKIH1NjQyHa3cjLcd7ZuNGE+9/+GvOxEI79K3H/KH
mO7AZ1bsBOVkdVa4m9Nvf1qkphFeotNiuijK9E2azMJisjrd3Ew/01isLqdXxT9dwFON6+lnVVzA
TfQt3H6dWsFv/O1Vu40FGf7zA2MV5wU+K87zv480bhnWd+WiWLXW52EBE81s9VQJs/fsgJLgS+t5
FDJfnpBxCltAZM5oxWD5COLMMJTwI8ZOBB8Dl0SFQKWBqTAh4UESDWBdRiW3/lDI7N7J9wqUJE+K
n8oHRcr2fs3dk8zeFxdF6+E9Fi++LdpMftCw4vPyMQlznv6HcT4FFRt5U+wEjg8rV05vN7L6/5XT
dShMUeGiYoNoi/WyXtciTsvVOu+SZgYOls7dlflDKJYRHnwLu4YF0GxKAN+wnYrlcl6sb2CXtS6n
i7dvqk+x/gzvg9SkE1KvluX6em6gn/cDYurLS5Dw5KygV2fFJfxlZwVPh3A1/X91dTyEvNw+VD2/
3+vVEEi3Re951fX5huLz/iR3d9GYwEBU87NCnRU69SzyiJulgXFYP5I3D7W72gxwNcL4Eca/zDcs
j0AwghXyUgGEDwqwu0CaWCu1Jcoqqim1lAhsPPceIeckC9xgmKZB6GEY/65cLt6eV6+QhwB9Q0xP
/mMDnCtuSy8tuBv85D/Oip/Dh4vV3fy09Wr6cbkIIxoe0fBXz6sWS8sQbLMthukFJkiAmUqqPeDe
GHUgVFBsubdWWBaBJq+kwDoiQ60O5lg0vM+N5eP82AaLNf89BhibSDH1uYWC1dgJ+pqVCwsPILBY
llnT7hwcpHN4JkPEu3kCkdP1qiiX71bHYUXWiRXjdOGv/2c5A1gyIFbEaF/FqPYviOOBDGFoCGhF
90kghxeOpkkMQRF+lCJ8PEV4hHMjnHuZrwhBvE6KWJyWCFFFsKIuEKWDMgrLyJkkKsK4NAilHeKU
Ias5C87DAouH4dw/LxerNcz2ISjXkKKT2Vlhz4qbHaDLb4dZ8aqw8O+m+G1BR+A2Arevnis9AyYE
3sMC1hDmSKjGSCrkLOLGOgNjUmaYcoYoCdMm3EosnHPc8EC0Oxa4tXnPnt2cFjs1YM19k8mW/06B
AcnpkxR7aaSMv37Jo1V6PABt8K28m5myuC2nq/lxYEx2K+7gAyxDMuhP58mzYlhEdjSSGAZu8R4A
b5ABWQ+sJEawNIKlFymWNTeKCqKcQhIbyrkkgdJohWFcKYm5Nt7BYqW1dJHakOQzwiF4E5y29Plg
aV/KTcwGK20vwX6bg7A2LSHeIRZH+DTCp6+UT7GA3oRy0fhIKeFKwzQ9Rj5gBrgJmBghFnDAkXPD
CHFEGWEl0QqIY9Yerffq4saMnraXLtgrU126nxOP0HZt4dOOzTOCqig4DjfpTtyUuPra393Ops6s
h9RjbWx7tV3yeIDxvxMfDmIPbFLAelDwX8DjQxFQ0VCRUVPSbzn2iBkR14i4XpC1MQCqCpxyprQV
mMLeF0cdVWCRMBOUwSoqn2wcgURLgyRRGMEc9kJKQh9BXD8u1w/7DbaF48SUpfmwuJuvNqArHV+v
QrZxhHXjflt/FRaNW8ndJl3ZPHs6QrIRkn31jCwFRcRwr7kMIq2JdVIi4i2ThBPHiI5YI82cA9Rm
PaY6Uu+ZYthobz06FpI9wLHlIzybbu7pvvY495/2OLcipDeOe3cTAMqVW+tlHiEbJRfr8DaUq8It
F2szXawKs/hQbGdThFlIgOMouFeFvBzAvenq+t1y6c1sNiDUo4p+enBFOPsMmJIg9PRRR+w2YrcX
JPI9j4JozbTwkWiDuXRGcuK11JwjyQ2sF9KOA1qLRCFLMTUB7gZsCOzVn68t2wm7yfsNZJvG4n3x
m4IkGIYakRW1xM8s22gJrfBhqyTDqovQAv69LnCthYPT+vDdDSxH91jVQ78tyO5SevB21089/m16
8v1e/McBDU3Sf/VgcpQro1x5xDgaOBEmcoloICBBULQ6IIZ1wB5Hk2QMp4AyjRAcFjAoy4hURDOh
BbFYHwsl29IjQ8Of1iloYsfT28s/rVvyo9E0CZDDZpl586WtAKmbJEGAqsNKgnQPlx/7Ldmc7sRH
fSENXkmPxkMdw3fLjiOQrLsJ7ucko5JWssKxgIstwNrpqkjrZmHhUpD6YnkkYO2OcZ6DAJvezsLq
ehmvYYQBYSvb9xjrgWIv6Vkhzgp9VmAySPDCgftaDxtwCkvAaBAy9DP8+uoYFJFjJDBKS3OWfCdT
aH2B1RgzMb6xXigSxkwoZVigMEcngiGAc7G2lqsQhEpOPJxo7ohjmnortefcIqQjjyS93R5Gwj94
/xAI3hegk/lZsdig4f2b8BqZTVfrSRVBuDgrJvMUQHhavCoW6bE9xWZqut/FqM8c9ZkvwMTspZMi
Mh8d9VJYTQnjOMLIgWOO05gKKZvyG3BCKGLeK8m8wUpaK5w8FoR2cO+iEaq7f3uPfSfz1/j0VcW5
B7rNR5j3WG3mfIP7lg1q08niONhH7o+tyGHAH9843dMgywa2TfcY+hwPa5aubNLJPn01BkuMOG4U
+g8LfYV4AMGvg+SSw+yQiMgkM7OIkQYYAc58DCI6LhXCjloqfPRMK680CWigYIk9sTjZs0g3jFs1
XFssd63hzjm5N19E7movEU26ltJETBeb3rsVknW73b0AYGevad3BG+P9pG7fhpRNUj8RkPxofP+F
KUlHifLlSRTY3GEP4gGxhBWFshwzGjRXIEpgkkYw5a3igC1J4IpHygKhsH10nmghiOgV6HGP3Ci7
JUfZLTsqDWP5qARptHpAjpQPSpJyX5aUR0iTxsAPypQ+XpdVPpoDQ3wOOL7PiH8c+qXdSs86yeSf
B9V3trK6JNB7VoichCWp6nDWZMKZPExx8hgipHSY9C2oldkmEZsOK4TaK+OMGJIeuktUk0nTeYEy
aVUDtEsSo/pQuTNFjEh6fO+9rGSQwWEgmVqCiIIV4YrBwEQoQ63lgKitUypiZ5TViOroJQZQLTjV
Bkke/fORdEPETpIqZJt+Md3IL7qcynf3nsvpJXLLBqZdZZVpw2ifWn5ILfet9qnl64viw+5qPRD8
mcDNs3zeBsPpyqhNHbWpX//GOmFf7axgLjLFtSYReuPA7oFE6jiy1mLFjFAwLeWi8ybA2homGIW1
p0drUw+ZfqdKbfN92cn5rdSHFfOj1rUG/x/mU7ybJwlQnTRv7kmCLAiKDnfU3O5Z0df1Amyy4NQ4
Nqtr0wQrQJuP6itHwtjuBDl2ujDlh+s14O/gpnMzGzQoG31ilS1GuE9KmUFUtTgNivoMix4ElXeL
1d3tbU7HBNvB9/CtyrwBm6dQTh184utQmlkR3rsQ/CpnSbLLu4U/6kvA79fk/6lc+ju3HliDv9nO
7PsssE+9U9hq0/P25RmeHGJA/f5mh/cMcnAru8BTtyi/YuVcbjXuUl5s/jxndZQ4xaiwoGKkKHWP
HYwgUtwwU1gTTLUHuKIkhmXlkvmojUZC2riFJcdIT9EpPbOb3fXP15s39ZASdJJsn6dnxaSygW4P
G5e2Z6fPEbKDxdNO5FmR/k805b8HVMnPQZU+K3QiSWeHwHz2HMLGsJFRNfSCk6xQi5SD3R8RQDy2
sNuDc6ti4CZqJWjwnAQCqxuYSE05rLm2QVDFHZIDqIb2Ze4kBxWm3dBZ8X8byYZhy9YIF0k7v/Xd
bdpCbdt/294YQof59t3tnnJomrdiKb7w/+7d6RxqlzV11A6NAuGrt5EaS1GIJmKjuZLGSxgnISwO
k5aeG4aDCkJTkrBYSvxCowmIG0yCo+bo0OHH2L7O4pJ4cRM/cR/XN5RHTZ7fqnxa/F42w8t2nN5M
GjOBG6fFc+MzgAYYNGt3bsyqSPEZP29VQMfpedR9ep7lfGpm1/+8DDEOCFH5M6IR8ECJ8Z4eI8I+
Uubl4+2yI4gc3xkv8p1BqQqWEWaMoUTq6JVnBAHZWOCIkImSUwSrpx1DEpmcAznl9cNeB8H5I7HH
//ogfGxLwxRE8XMj+Pjn4rticRhRjBoNUqhfipzLRx1tcQsF7g9XlZT7uQrbeH3f7TFKY7Qrfv1i
gLEYiZPaA4cTmI6ASXmGKKKYM+MoDtQjRyLlnAaDjSGCS4KxNzA3FY9OBHjA8j83DIuZp78vFkXL
Irjl+0ari4st3++13rL+vklwf+RzfPbzeSfjpzvPyN286a5wy3Pob+qmR2ei6U48+Dasr//ofaqh
Vxd3+yjxHbuD56jk8LBmoi1p9DlEDeN1V9HCN/aiKoaXNo5ZDg/ZL67RAwfzEYaOMPRlvn9S1SXD
kn4ScGfQLBBYQE54CFZ66TB2kQNNWCEZ4JdAyR8OSZgyAFc+QAqcQymbEpqdJXfl69X0b+GeSsjo
sEX6ccu7xfrQ4e0vjz5Yv+HgVl1wNB395apD2VkN8fpiLxNOdTklwvindi6dxruw6r31ejzHI84d
ce7XryKlimmlAnI2eBGVFk4E5QHBUkTgODronHLEqcw13rxiEQvDNNZeAhHH4tx7pMmO4xs+awcS
pdGqiWw3MgXtu9H95YiH75MrB422I72+wAf+dylZTlvAdAzTEjJd3nlNWfME17xNTElV7DhXsPO+
EVu9ns7DcVpa2h1UUvvgXf/X8vr32THvM5VIwWgY1Sz+xPCd9Jzjx3Cdgg95Vevck1te8LvvUngf
3F0+igakg2+Iq2+SP9/2y/ijmYc/lOWybLbwYQ1PZV9AuF2c3C7fnaRMTovlugDOny7aHY7y/rPK
e3icau+ItgAWXaozwp2xikDPkQmKsYRTHL0WSFmkjbbcSmlhpkohrWQfxyT6QPHL+XS1Akn1UTbu
/DkeR4PlaNiWL3g6LWRY3QHPGbbkc9w62a9ZMk0X61EyfbmBXTZipa0MsKFVzkqYalCGSGUkN4hL
zRlWXnAcjGIChseCi0git0RQIKeXZHrA4bwMbj14usBPXJStB0fTQQbsUVeYkVGpNyr1XmawmkPO
OauNMIEzQkz0KcuLiJpigYOwINy4EIEYIpQEgIai0Dw6SgiLgaJnZfNrCbfJYq9S7qJ4VVQm3tG+
O+q9vn5WRNwC9zFJucA0LZNBXiohvcKRYBaJDEwYRiUnPCqGnIywjFphlled90qf0uK6pnfe4hXw
3OvkbvG07CKL8/VNkXrfFMOtlD7H6XrE/Rjox/XN9b9M306HDLvDh+5oZ09Wy/CP4iDHn0GRGAa3
ne3jqqfv1UYfvhFnvdBAEJDShNDIoyQ6IOSNcJQqDR0LFQJWMDlHsKJcSgwkyCTqmY3aIeWRdc/x
4WvLz8ntWfHXs+LHDdqqEvP/WHzXskT+WJy3rJa3xSs4R/ve3bfFb39b/LXZ7DcXm/NBAjuG0MT8
9yI/++9LZ2YPaGScWSQ1DHzXw2pVzFLr4hdTTo2F9TkBqk9SsasyFNP1RmUDVC/d1KyBrHdTeO+Z
Iku8UYXz5ahwoGfMMOxuvIcdjmVEeO6SspmlYj0OaaGVNh4WkQfLgzIaZo44jEw8s/1AVZPH/nr2
42nx7c6uVte/+LH4vkCne/5wFbP9rm3Hqzlu72qT7Q4eSLz3uwNTHjzyu+J5mTYW8N32aWI5+iNV
7i2Xt6EsYmmqxsmk927ZKp1xpHlPdkK+1bJcX8+n74PPQSiD6uT1WeJmf1KVdDh5W4awgJMTC5x7
UtV6OIFPa51Otndxj1RoOWXBpmKE3vW8G2p7UNFRD3c1jG59nN8XML9fnSVi/eE2jKaIL9dIGrRE
JGohDJXYBiK4RzFEjWm0miNJJQskpFkEpnUwOjiBlApERkdiP1NEd2Ccn/5yHWAVrpdNrd4gRtLK
EiizeRJXRXc+Yw77rVmySh66V47ok1lIqxXpOzz+VXtqLML70SD6Bdf+sVJGxXg0lgtvHffcRCkR
JooQYi2xhMPyeicYobDbVdSKKDjzWDGYfy9XDfZALY2BUwm3Ml7dn2tKfepohsEycdEhK21cPSOK
eDS0jgrAF1rok2noE4QkMpoZIZHzAjllnIyA25wQkSlscVQKRWRRsJwKl0rLUxtsYOzZCsCUJjRH
S+zbWVdw4/L9LjkoNKrdkN9kP+LJ+9PiO5A/oxV2tMJ+/XzqIqVOWs+FUAKYUzjjNaNBxFTcUEmK
EMwrwBVY3yC9VCYwZyUOwKicuV4Kww1PNqug9eDK79tc+QTFXp06twy3IWuxtzl094tBHKXMY932
25xLxk9X6+li8Kyp9Sbp6jNkyiMbpNifhv2keM+GiE+f/4jCRhT2gsywFoeAtAspSQLzxGlBiAgg
1LkUjkVpYDbIKqKEodggy4gJNDDkpU95Vh5GYX/460MorCUGJ96sTSOTSqo2lC+liK10kuoW5Qun
hzlTcsaufHGvKll3AfQRrY1o7WtVSEWJKAvCCkkpj9Y4Ahe0ZJYSGUmqMeY1hqliq7jAnIRoRYxW
YSfhPjkWrXXybgZsLd69OOTdNqrb5dpr1QBr8u3vngLofFiHcj5dhOSiAMCuzAnxsum2MsYCiguF
n8Y8uXURy+W8CMbdFMuqNdxdLI9LgcK6TbZuOQcOCtf/bmCphvbUI587ZEk8QxkohgkQfXrqvFHr
NuK9F7qbx4YHxrGPESmvneXUIeSQIgETFhCyISW9t4TCoEEKDw8yHLm3UVuY6AD5lw/E4uSHs+L3
G1S3dTC7KMgWDP6QXiS/vzdXXphBm98X59Du+4uC35t/bw8c7uUw+CF5eQMl2dl7LwdJg6rt4ati
Mi1+U2B0mn8fDLptmO6O4HMEn19/Xk6d6/oRypXmTiGPU2YkgkG8BBINrKlMmZK4CxKW0OMoYXsp
BRfGeiOtPjqXc5cI+X1DZdhgV9xIwTep5Mhpd/K9zbUsTSaTLE9Os0A5/bboegLtngC5spd1pFO4
1LLlIPtIg95Jh3ypBUx5rIh5gt5zZlIJ3OzRCIA5+S44+CKljIDLCI/66S9T6LV92R6HjrsTBK5u
g5vGafCbjNwfoxRuXch168CyKYGLsxsJvzqw3KJ+TnEsh+oPUo32qRT3QL2p1q5o62U/B8U9AnaS
Spm3fRVHvD7i9ReF151gzhnpYDzkOQ1RR+VECowJLGV8AXKUi8ZrC+9WZmWU1KeCulEpQx7JMfiu
XC7enlcvk4cw+4GwzgXZGzEzFefB6+tyevnj1e7ll5q1c/b9uFyMmtgRDL8EB2XpkZLR8ZSg2pGg
sJQcwcY6FTnxxMhoPUEWE2lhfM20l1RwzQE+a1jUY8HwQ7xZHsOdB8Ex0HZzsVfIc3i/TuEvRfgl
lB8AWpap0Gy5I3CbBC8rWzfW9PW75bmfwvUVdAPAMoW3HAUsOX6gpl746910ZnK90wGBZYfScx/c
kM9g9BaPhiR/oWSJ0Uo/osDxXfK4YoVphhiPVCKinUCaYEYpCdJQg6U1lsqADMwXFldSyzXFMRgt
HHdSWe+eY6U/kKeT92fFh7Pibw1j/ftkpP+Qfv3tpRrnP3Mp45GLfwUFhy11lnhFYUMnCLZSCOSj
MIhJYYmA3RzmXsK6IU605w6gYtDRGKERD9HTfqXu2hz74exvDQP9+6QH/ZB+/S1f/Gn9qEX+Hm49
AhbellPAfK2KdetyCl/cVDtvVTToTGjxWKM7746GuTXQzyzMlvBdn18baD9sHuSzp2cNJmiYxMj8
OUTQYYg4wL36eBLkaH0fcdwLxXEeBiAYOeREymQTLfVcBCvgEMGEYyTE6aTbEx4Hjp1wEXNBlEpJ
CZEbRpt3KCMn9qy42eC5dKG4KGzxqrgZVXcjUHuBbGoV0jZtpgLChpggsCDUM4WBLa0wLvCIVVow
rJyKgTHFUp1ikapSonC06q6TEW82OC2dX9hXN61shG1Ec0ylYHj7uoSvKr7O1tzWuMehLfqAru0P
8OHNpushK06cGOu8OTkeVJxkIk6GwDYwdp+Bf1yuiwEHnxv/7NFHUDWCqpcjrU100cSghJfMJeOJ
44YITaQOHoGwNhldaYqlwDAitrDPxjQQHX2ALbh9vnJsIwAnIDIbWjE4u0RXSSuWjs7x1aHuqxZb
D6nHmiw+gq8RfH31EWlKKR4RQxITaRw1hkgLCxp0REAEVYZGzS0SqeIvFpIZLSJCClsuVGCqn5Zs
j3U3CrJJzbsXW95t+gDWnDn56Zv8+E/fnBYNjVlXuy0Pp7ZPcdSr1GebWJakQ6vsq7CMle8efMmT
8TVFtmSMVxlXgfhUayxFs4Q0fC8NG7snrOUOviyLt9cpJeHQSWf2s01d9fbHa2aqInSgDHsk+7IR
6JImHzo4ZrwPabrKnbfpgCUiB3LDU1WOMLapPNw3r982xZdKvXypGfv+J1H+QLIsc/c2rRP0vbqz
W55K6uXl3Xo19SGzzGZ8EDrrpVvOxkRaX4zUT44x0jHNDcbMy4TocMTcYR8BzTGtbdCS+AT0hIAz
LhVjOoQogmOwB++TSIvL+xNp/Yd5f/3jR0mm9ZwsUZQMU6J8Kx/xc0qeCc4Grpiun0OObq/OUGJr
eMScW30cYPspux5B8xeosTSMIWYUd9ZbjyJByLEUXaMoMpbAjJFmgKpNMDhYAM0uaIS8ZQ4HQ6Lr
JT67Azqmq+ulW5u3yYlvQPHJ+8ilQeyrfUy6aiiT7vGTZHzU9I2avpcp5aBT5YJKxZ64iSzFKmun
kIsKI01gMEwEIbB0lDBOvcQeSU0D3PfEm/iwpu/Pd/YhVV9Tvh2UZqPFq1yeLVWKIunvqKobVXVf
PT8G7K1yxgusBUFY2oglVdph2LwpqawiWmrY1DFFEyaRwlIblUxKu8ACMseq6vZZr6h81g5477zi
vacWalvfFNth+lRpE6gTEM1hKzkLi+tVU648fztJNns4mtVcIp+q5+RmHgQ2XZ4DYedVAsLzShWH
una98lOnsU+6t5SoOWWNTrGk6jl5o/GIvUbs9TLNMkgyLhDVPBIPa8JEDMpQrSIXTnGMPFLEMUEA
bwUkCYXtJtEwQaUYZ8Y+P3FMQ57u5W2ez1INqMs60BTawVmdj2UvDcOimdgFHntjbm/Dwk/I6ePN
072/7O5N93PEpGS0dpVIu5xewbsoHfzl6rT47qLA2U4D46U73+WDv1ylXBB7XdRUpVYXjVaP0zbN
y1N3Pb3a67ZakepWC7bCjRGojkD168+KCKtHPMgni4LEgWGhUTBBC6tZMD5GFbw2UgltjWawXUxF
haxlLGJqkQnHAtWmiCo2MqpGq8B+F5dXm5NaRuWTQ8auW+WHNiIKnxaPNj8UUdtbP62TWbu3gGr1
kOk5EE6PEZXGbQqnVpdN0dSG9S3Z1AfHw4PT+d08JZ58myB9rBN721X46136yKrSlJvcj3Buw/pd
SIm9/V+MSwHK26zfaVrp6b6Jv0V3dMpqnvwuV7nQ9KAmJoDaBFW1WgDj6j6pt/FnSrs9kEULpsvS
HghmL/qUhRrVqCOUf6k5ZYjWMCWrAawrZWOIXFqunRJeWOu1M4IxaQyBOcmgsXNKGsD71gHs5wQP
lFOmIQsn71d7CtUx1mSEpi8jKFhzRISQCrOQCiDBwimuCSeGIhklp8IQ4ECGNbbBR468FsF5GFf7
VBz96DQxXey2gVrTRbr00+LJKQQ3vddq06paytGZXAS9V4G6Q2lD4qVJqq95elZMALbI/DfpKusL
5LQHjJCDoJgJA/SShk8OfJmgpLWsCEq6y14k4WH0uZPksUjzKpG0KtU6JSfDTBdL13rRReiIuEbE
9TJzgSGihWLaWu4jcZKJVPQuMu+wMAowlzRSeRgASZiLMSE4ojjxiskAy/48w3VbjE5y5YYkmjeI
ax3mt0l9mnQDFnb05jRve81ZYXN1+037reowKVuh00l68HQ/edgI2kbQ9tXzM7IK1tBJFBMD85hC
VHDAAOWM0S5iIhxHiiJtYDsFS4wZC4DjKNPQymLaR594D+vmEJM2654/wLp1DHGbdZuBxRO4eVo8
T+PWpVL7xUxnOUX1rZmWuYzeTp+2vruFG8fDRN4JE8vg7soVdJiner36GN7bKXUyS4mNcx3kPqBn
GDVXyqcMEPUyW7AzITgFoeCrXoXQxTCqvlrZeEnhF0N5VSrtW691+VWXZV9/uA1jWfYvVj4zZaQl
hBsbNAYIxRjCiEsFy6RU8oGmmDKmFVUOUQej+6iN0pJbwmVQoo87tOiu8Xm7XF3nULmBhdF5FTFx
zq4+ccGny21s3nmfGLOBC7/3mTYb95vjfvNFyj8SrCA4FWWG/iWJQQQTI5aIEQkiL0RlGROKCkss
EhFRor2FhUbOaETEAM46W/E3aW41t1dzYZatV8sCsCMAw9Sy7dOSbnx/UaA9f5ZdN6+3/dQwtkPs
jvvQcR/6lfI5Vs4y7DAjLpKAhZNKwOwctwqGV0p7E7QUImIEa2eB33F01EYegCrn49GJqva5Oe8c
t1cvNqWQ9pm5aBRf2vJyo/rRHiM396O7W09Kl5CfhD6ma9gYbmt+9jRLdMcJ2zCbXVc9DlrQ89PC
uT5hbhhzLQexKvAeGd+FlFwoTgkSjCvCKAB6hZmiCN5cEjOsJQO6NIImWBChpEDt9KYHoO9usbq7
vV2W6+Cv4/Q9fNHyVxw+zFBOHXwzqjS0aT8YPHxd1qsqZ8BR3xZ1X1jkfyxhl7hcTN2QW4HK75/1
Q8R7SfSfi8d7evwMOXouO/X0mgbjdmDcDrwgmCBD0MkrPyZafVQaFjJq+KHOcdgrMFjcIJhhEpaA
UwpbBWkBRzgMo1P18HbgB+8fiZvcCsDJD3tuPmY2m0x+yE6nFwX8Lc4LfLXv6Z4qiP9wmm6dnp6m
DEa7p74/8qlxNzBy+dfO5Yoo2N87aZELnKrAjTTWS8elZkbBUhltEWwMNPaesYisRrCoVnNYx2iw
7hGN2WLog3RniT2bPP36Ee4Elt4viLrt4vvjuhgqqVrDzztp9+ebefbJmybuzY+xurNp8zFwNGiV
+ovnUqRnhzpbefUZSj89Rhf7TMjxEbJwsu6NqHJEleP75ghUSRC1ACNJdEhSzWGGHAcbUnIh7g2h
ijrOhTaGxgCNsAaIGQ2gT2a8F/T5SuadSJ3MzoqtCzlcu16FpGPelZ5K6XhTNs/LZmxkV8Nc/Ts3
nR3TMr2EVqfF9/lgdtr5SBYTnSl+O95os9OOuNJZDrq6KFaX6KojZHSxU6c3f97dwAcGN7/bUJmT
hea36aLubtHVXdXl684+kyIvL07u8Z6Hu1arBgf1rbHc16ic/+rxeGTRRu1iVI4ZTgR1CsEO3Fjh
hNBOJy19qhjhU/2IIIP0PCgCNy0OBLEeeHxPCuYwyn35ky82xWAdg7nHrPlqSwg+1u5ABB480CBg
W1NsE67aJf6aIatt0dcIRa2EXuNCJe4mO3lXCbwJ9PB6J+9OW52kbrKg25w37u2LutZjXatxn4g7
pkpHaydS2SgKt1yszXSxauxM6g+6z3ZE3lMmdzm3g6dw5lWOFSrPCpIQdp841M3DpO5ADpQgOQUq
UFInf0lZnEmvDMnbp6peGB6GKq1ripJPi+xFUZ3Ihsm9QN9fnxfddLEenei+3DBRFBhHTiInEHbQ
Z4RhkeTYw6vKScpF4CFIpaOGJYPFjcz6IHnEhmgbSB8nOtkdL++n8frPsChl+DwZRYfSO/Qxtg6m
g8F8rK49KjJGQfd4dhiQaQZmEAR0AmAcIYMCls5DZ0JrJpjXKTw3wgSt5IbGaHwUAmNGlIrm+YqM
nZzbpXXK8PM3BUv1g8hDVbUbFz7RtvoL2/yOzPqSXFs9Jd57hgNm3CCFuKMqwOJhrghQoRmJknAK
Y5GA4TD7wSHljJAo8qNTObVZsunINtmx5WnTma2jgnbPqtk9TFR1nL0zi8IGGOUWmL0qgGJWzTis
lP3o3bJY5Zmseu0b2b1mLADvt2a9DuViNeTu8aQM/uSsOHlbhrDYHRyaaU5MumurX5/DjNRN6ZCk
DmeJ60/raAEbgeP4LjriXRR8iiVjnoQYubFCOeaQ5lFzrxC1HGYBgFLBdeU1iURL5YOV1jFmgqRk
GAtYQxpP3HK2LFdnxeZCA0wmNWZ1+zS9u9Lpfqv9F1ZtTvNTlxSdf/9HHcRR6T3h96SO/l8dXOnQ
7G4Ha46W+npjvN/eTfkBGza0ze2K8PbNaSwaT2UlEgyYqX3zc/iwmuybp/Kty8YzV42sseknPZXm
cdCu3WSTkbGLqM4x0kOtzyFNe/sppEk+/Amk1cySd7WbYXU+OX3Ymli1qpxkDs2K1d20eEDK5iT7
2nQY9g7J6sY2o0FvlPZfpbT3QWqCFUyNRexMJIobrpjknFiGLJXOY4kMQ84gF7FNMchCh/R28MIL
0cee97BMTw83NiQPS/ayW7I0+2hI+LJDxpeHUr759COyvnxM2pcPy/uyn8Qvj5P5yWBXHiP5y0dl
f3mM9G+M98A74P7PqtnBw6+DvZk9+lIoj3stvMZXB20PXguNsTu1Ur0todM1TGA2W76rjKDbDL7V
JrhOJrJZ7x75eSW/vwRkzkoy6MZ2Is4KwnIet7NiInMx2ZzuLaVYw6lQLT492I71iJQ6aY5wdTJM
+reNKRblbG9VsE9NPlCsT59TRuOk2f1QBFfrivPCpmK2sCQsL3K6mhKoqNPnlJkEmre9tkj+1Zld
gRFGs+uXu6k02gSqiXDQP/RrjLeEOk+lFj6V2ZAKVkswWDEsLEY6559KUf0ER9Qvd4kU95f4rrWf
QwpC9owSuGSQSotknwLyicsk4X0C8Fh8aNx6jTLxYZnIjScuciUU1S5g6B6+7dJ6qpWK2ggZOVWS
siCViUIpopSEZcVwI5Wh888KYGxJw8m8UXcom2i/K+YNbUmdkW/eqDIEp4vdaXJbTI3adXiKV8Vk
ngF5OkpV7Oqz3xYCDiaptt38NF/etfxtQca4xtGR+uvPtkkZ8xEDoYbSqClRTIrotBeSEkKDQ5FH
YTzSDBmjPIoAk6zijGkmNT26zOQ+oy92u+NpzH7F8/Z+ecvs5T67lx0MvxclOalZ+XWL6V9vmP71
IdPX90gznLlvSpRc6LKyHS/j1iyc86KUwa2BLWbhuB20vM88/C/TGAcEjTiVkvsc7nME/sPkMzgL
kj6jPmqB/Zg5T6R6YP/w/6brm+s/en/957D+PXT7eVw46af23+Sf2ndT/Zp1EXa6GHURX+yb12AL
79XkWQUUW+eIkUxDv9wjgzXMKEQfkUkhoEoSHiwMxbFRQkBzhnQfXYTqrqK8DuvS3AQPMmr4pFt9
5Ah/M4gGoodal4thhuxRclmxN2jUMoxahpepZYiOIyuQI9bKQCmxJEivLMbMeWW4Y8ZrS7UhSHhv
o7UOBKOh2KFUv0k/353nUNjt/MHrfUOqdA87g82uIR2RtCuQoypgVAV8/TFpzsOeH8tIFaVUMeuC
sDBfJ6k3XAjBBMLIUgarKKGNBCwCK2AI5UxZ6o9VBXQzYrtA7aSTFfPu/WllNBbrm+bA9T79qN24
6g7y/dv0dnhzdm0BrnLBJ9sqOt03aqQyaqlSxmmPuNbULa5tt7y2OWdbLq+v603NtlRs4nSQMNw0
lq5IrQpsYHw4F5Lvyl5zSTb9mubNHHL9NFFfr+ZQl3eTA01GV3NIxKaZZG+Ag9nQfFf1mo3eFMdD
u2mo2heA7mZROzSo06sRQo4Q8mVumI2hluvAibARkGQgDt5TBHqkPkiKYRqRes5gggY5LIIk0gLc
FBRThywbprTuTuxXJaPgGBh0c0h2iHLVcIDOjmJnVfn4kLWDZh12z7c9lLd+cJO/NDq+nBa/ye5s
u6GuTk/Hur4jUn2BbjxUiqhxcBQ5yXQkhkgNK8UVc9HChlIowiLRCgYwGPtgXMTGiwRrtZfoWKT6
OK83Sr9dXu3y9D/M61tjVR9OL55bUQ4mk5FwCllslIhbHYeBu6sIvw3r63++MUOqDU+MdSc9PAfj
IB6OJ2/j2z6jrocZ1dg+g7pftWfksvSjNeKLFalaCK+JlyBJWQxGE8aI1tEh55Gm2CnvVYr3FkRi
HpiMQTMlEbVCkIiV6WWN6I5+3jigD2nf7mFbFMP4QD7J4/DJ49GnVTYZN47jxvHlyLYYpXLUKk6t
g7kQhBVKVcAp9oTzaLnlKhDPiMNB2iCUMzASRtHCGhumnm972Ii2vQw0FxcFzmkj0lFHHhrSmdh2
kwpx0+eu8zrl++uidWn//jO2iEOAhf+8g2/Gg3jh9q4M5x0d2zsPgBMu3Ji71XqED18SfFDWaoVJ
Gi+m6lGeCWAtLYMkGHZgQiaUQJCnHnZsQSLCgdN0RDwkr0N17I6syUjFNu3qAScVm4SiNa/gRoLU
/XsdfHS+z0Xn7XtPNEGcr282/oGwN1yEd3OzSIlI35kP27GO243dE1qSktSUwV/fhPfm7XLxMbw6
+iAqgIqfGFPJIcbTfSptyxFVjajqZabgDto6RCW1XHIGfVgnDA5IGSUM7BYNhTWLMcgcQCIi0Sg4
Q6JCDKS+CM+LG7lP1B34dNDi1cavIwd2wK9RRz7qyL/+jBom7WOUFi6yKLVNGxsOKwoLFbl0JjqM
TIyC+MgddwDPcICGEsNlRag7OrDjQU5s6qz3OfF1kxOPBVLJj2MzZLEdspc7R3cJKTdbrpK+HXoa
Ei71CUH91A6pYpiIij61bke0NKKlFymOLQOYpFKoLTKMUhUkN8whKxQzwgE2sowiTYXjzERKaDAK
pmSIhy2GtyE+jJb+fGcfREs72Tb5cQ8f/diWwyMiGhHRV8qCDHlNuMawXaEYcwMISXtBoHtiYEDP
01SQ1BGuMsw91ZJHgYXW3Evjjq4ZtM9tLbv9jxn7PE2BVHdcrOZmNgvlRpe0hm9hsTgK++juOKBZ
WFzPlm8HzTdc3UlJb//0b3/KuW+nb71Zmz4ZcOUwSXpz6l1jq9+uDwF0GALyB1avQfqzTqdXTwt7
HGHTCJtekMwOwQQPI0hElBEUdq0eJ3mskFJGe7gok8+XFsgipqzRxGHKJQ2KKuweSU7yrw8a7Wqp
OElFwbYumnPzvqjSCubLl+hqPytvvv5tK7Fiaj49TTkOzPu97K+7/qZtZ064MaKyEZV9/V7d1knu
rbVc0UAi44p7Z2zwXFPptLCIhCAt4lYEJJnAMC2HtNVaCxENPRaV7XNzueXnizY3l938XHZw9PeZ
n8sDjr6o+bm8n6OPzy2yhX/Q6dv1Ta46kc6W8CUHMPhuWfrjsB++Py3n6s5C0+ni7ccoOWFnxv2c
Dt7dwCRb5RKWOXHqYbmEk/TEZ6w98SSSe/mtDl+D4kk0p8tjJbMRio4vqsfDY5W02CsVPbPISUqF
0Jwqahh1mGh4NSFOaEDCBm4jtIxRREEAtypYAyqf70XWFtUT+IPPqoq467LhV2YWHyaT+nJOYp3f
ZVU+a3jk9HQseDby9MjT1Qqm3JeGI0Ec0dpxoSIziJJAArYiOq+CIgBBfaTYEhSQw0w4Im2k0aKj
A4ke4dwKJ9as+wDnNrHmYT20XuXQDtPCp+GLLY0pUqOue1ZlsKtChqoC2bGoG1UJ7I+Dn+S+nHZ3
C383g+/DoOjzJKeYI/gzoMgTYAj8OaDgybPmO6K5UfK/IO81hpkjIRDEkBZEG0G8kBhxK5HWIiQv
NWQNcZbBpClhwRLhlMc+1abpkvxPKC+2k3ytwICkPVicFt91xgTsla5qlB8hZ/WTp23t4+JyWpwX
JFccgeP9+lNj7alRBfnC44OchM45xsQobjXXsHTECWld0IErgaVimsLaRiGoURgrwIGCMouV8Irq
HsWn2hy/i2CYNHj+9CBEYVcAaH0/z28fymV093i+cbur12EKCh1U0AUMuZtwn/q4ujvc/Hb5btBg
BvqMkjUKf5SaGfRpuWnPnp6l8+mVhigmo2V6BJAv9KWBJFJEsxTeEGCSKlJtIwxDPeJaRqYFV5iF
gB2sKcxc6TQzGTihWGn8MID8w18fgo5ZDk7MWWEbqNEmWY8OASPeBJHmDX53G9Rok/vBh23MQ8Go
pnjVoGrPx2m0Xo/Q8WtVICpLkIgE+kcWxnVSKa40Dyl3ZnAywgIinVJpeKUCbCKxRsFKSaO22AR7
LHTc8Jati1AmkGcvLtC39wW6JmbvuI8a9+F5vH/fNAJl92+92hJx3tOD0ZmZSygwZIiYYURSIp6Y
k3Q3l5lMXRcn9uQ4eNhdYfJ/Jy3rf0wX1/+eLeVD2rIv8dVZcYnPAFJffeIUH5fVsPXwZwVtHJ4V
rA89ZBh6aB4508FyrlLWkw46osYRNb5MIzL1HqPkmeiFjtbooEIyIDPpkfAsRI7hesp0KTCyzhCK
0jrAO8RFR7wfJoflnqCczFbrrX/jdFFdTLWXpotJVky8P826xvfZHQrajmknR7D3EsFe8AgGwV4o
4FmLCZLUCmBNIZyPmgWnlCfOUsqRNQAMrQOUB2NhQiTRR4O9Tvbc1YTfZ9EODi0OfA+3zzzLBRG6
mc7v5g1XxNWdTTbh42Bbd9oSP/1luloOmqSkhxKLfeogWPGJc5SMYGsEWy+05oxmJkRvsFGOUOEw
p0zbwECIG+IdACxviDIGK4mYcCYGK7SjkgLYokL459t4a9G2s+7umW8WTVPtJhDkctph2a1LYSRz
7nINZ78ppldtGDaGi4wY7AXE0UeMNVFCcWkoS5mHBAxJhJSGIABf3GtMMIPtVaRwn8GmSSLilOAE
O6PisRisybm7tN5tzq0h1v18i88Wrw+ZthkP/LyIkF2x2ZrcVTre+OpNF+vw9sikKLq74mwsq7R0
H64TyFsNq1HbqLBIrUiqKsXks6oKTqoe00et9Hf8bZF6/Tarp/Ixy7/5t2kokY9l/q3ybw2//zGc
jq5WyAH9fFMpRqUzval/k6rGPG1C+GBC+L4JpcGqP9XTmAw3SwLToPCPpenIrIiEzwmnAj/wAeJK
NQn3du16TZeg/EHR6g+r/uBqgriaIa4mjat1wHQ34X98ocnR/yfN8oFsp+bubVp26Ds5325EQPKd
WN6tV1NfKc0344NEXC/dcjbmPv1ydHqYISJjDCGkMuqRKWyipBJpTpCmnETqjAjCcbjBpAXqSITx
NeOWBtErdbruLgo9h6/09Hb2YeDsVbnUVpZq57hfla5zId8MYm2YnCd5cp4EyjlFfSggCKFharxO
cJLgqVRan9JeWGI0FnwdN98vdvOtkz81sRQFQWMkhMNuHBujOfVBy5hibWyARZOKSBkiNQ5GEiA6
AbQr8vzNd1MoTiqovNrst9fLtZkBbie7bXnWndbNGrvyquWri+J9a7ddXf5t5X1Z9z1uwMcN+NeP
dhgznqrgOYZBnSZGMRKs5V5oRyL3IegogqWMKiNjUBJrpQLAImYoFuTYDXg39+6sIBsOxs2EDW0e
Lru4eNdDk5N/2+TjfnW1NoQWZjZr7MpXVdhcDpiDxcw7dMDy76apEO1hNodjbSgYdadx+Hl9cx1m
IQGZIXfpuIJ/vCp7qq8OvYXPnpysfZjkWhgIIyzrCwi9OnTo/sz+1Zdpc0zSJh7WkIqkH3h0DXt4
oVMxAswRYL7IF1HS9krJYeFgUoF5YiQj3hki4EUkYGDhNKBJCyPDxOD1FGHLjW1wlIeIPXlWRtWG
uJ2YsjwrFmfFz8cYedK9v+zuocqyM83Wnb3AvOTCWZaXf7kqvq8OUqP96L30M6manTVapTIou7P6
zp7BKF37Od//zBWB/g889/4BDVl+h05To6QSS6/MvHijCuzL8YzxAXNYChapR5IjZUMkMA6D9ZGY
SithJJY2etxaQiRWyrmgFOJUSwCHx4LC+9juEQtNB9OdT89b+RQOmO11YrUGgmzx2OsGh73e8VfL
tJPZ67zJXH1yvcJMi3qmifBdaB10az4cCRW7o+jC3SyUU7MYWFl4EEyHP7ETDnsGARh/lGC6PuUZ
RyQ3IrkXmovBCa2l81JJA6+OGDUX2GiBqRIkhOgZlSEIouGtQlGEZZaEaOIjglXw3DxfVdgUiRN4
p8wbcXXz4vsLAGmb4nL3R9jltg+22CQBTwVQ5qfFq71xU9gcjL2pjjKZVz4/9zQb1Y2juvEFyAYT
JQpUOuEYcTxQzqXwPIVMaEctNTjSwHQMDKWUXFpSG+EMVtk4ZRk+Fll2SIBGdoZ9GXCYogG1Wne3
wUUr28LkODnwmBh4QjGBTUcbByJTzfhIVNkdfOdg+zeo6jElozirklSc5cwUnzzQrR47/+kx+CA2
53r6u99jeN2IJMe3xWPGKc5SmUmiuBbBRK0ilvDu8BGWDl4ZHpbVaeaNUpQLGFQ6IMIbCXgSacbF
MOF1WRQ2g+rGQLkRtL2o3CjWCUBhEeiOxDoEC4iFgLlwSqLRLOD0P+ZYEcKMQoDnrEx5VWOQFquj
06o2GK04sOuuACSlW0+KeMs95+9aYZfLWTCLVVsN18Ng2x31Zrwf3qm69js+MDFOsgtyD+e1Se2z
XHd4Ogik2bhEH1BXeUf3IW/jT113OQx9tdd5B33ZjboXffmJijjo8nREZCMie5GvAiEZdpqHqGAF
FXbMEsl8lDLXbgpSBukoTJMLHGjKqq054TZa7hANUuFnVQnfythJ4pZ8eFbkw/Xd7Q6crYqLAi7M
Qq4CM9k2gB329rm26RSe+cw208eiCpaL2Ydt0ABs82G/7woDL7ybeVjD4bKEd9zCmXVYmE28gZnN
lu/aY47c81m5h0oqsAqeyWRJ1QQR4QUxGDiGASdB/yFyTWDP4wmFHxMc0KKj5I4hLo8GUo8xSm3X
vJdRXjcZpVXvEh7q6U8HtOzhrE2SqOpKJmB1JPaS9+uqrv8tvIcvt5vOzWzI3APowAzJP3FyAPIM
h7JBlFf4wBCKxdOyZo1gaQRLLyi4ORhFGIHxdAhKR5gdYwZZLGPKR2+Mi/DLUqAiedJg46gPmDrk
Feyi4wAJCw4k4+Tfz4r/3EClald8sTFn7jncpJb7fmzTCC2+hydQdoKepgTXmO/5sFXdvt72m35y
hkJ49LD1z0DAtH3p3Q2sI9zYS27aIOLn4jcFFhUlHS3uo6I55s/Fb38LfbRw4J7RY1TpjSq9r1Q0
gTjCQUhvmDHR26gY4RQzj2FTR4D04BxVhiEk4T7MRjJOJEp1zyzIsMB6qfT2BNB/nhaNwI+NEEK/
2107kESVICq+Lfbqdk46pNF+s7YwaIyylUuTSjB1PZil094zOxE1qWRUaz57kmrSFFVdIzxKYofQ
+t2BdjQ/DZefrhy92X1G25CX9Dls0k/kj+JImK47YfoSdiV/+OvdFADisGEtJwgDo+OTfZQqPnHw
ygmQgQ/J+NTZy06ACnTyjE0DGRH7iNhf5msxCMql0IFoYYyWiGJA60xjTY1RUShtZTAUGR8DrIDC
LjqjUUQabgusn4/Y20JysjorFsfBddRoWb97VpfT7Nd+gk86IfrF5qWz59A4wuARBr8MfvfWU68j
tbA6xgNXWwMzMkLioILVAYCvctZHLbWx1sJtz2NkTADP66iOjn4+4OpNtagtM16ge8AvarXdoMoG
a5/eB3eb7N2BFp+XOrbqIsVuLSsBV+cqs9OFKT9sCorm8GiYfFUk4Dj0iFF3mMv7dWnc+no+Xa0G
rmw/Ecmme1ZMUlIYytIRU2eFRKdXh/HQ+5pQhI4HVpcp9aNI/Wd7PNoc8XRA2fZaOmQqHUlUXbwa
xCI+ScHVm4niPGUKE+UdEz1Q+Ype80wR5qn7NF9UH1TTTMl3qkvpiOZZcpSvffJJ4oNZkz6TxLtJ
cnIwyepSe5Jw7WoE1yO4fpkphFBMYUDSRmMQN8owDeM5E2BmJmIGgFsZLiJHQmAGQDzY4Ei0RBrB
4cX8MLj+14cjgtpvj6ZdFF4+62tg7nS0vE1HbVeCy6vde3l1Z7Pf2ObpPbx9Zy/RVfHdtsuD0qyr
N+b2Niz8ZNIYNT+1KcKw+dncBwJSA3zVHmlz97st0ceNtZnhkP4PI9wfJdCvQwJhRV3Q0XJOYYvv
CEM64mSig/tKYuw5SKMQidPCBqGYRISn3b42As7w0ZVh+0qbhj/G5dUu+v1Q2pTb0MRa1nzfkDXb
TcAjcmbb7lDGNPrvkjCPjbCTLs90GqkXMO808jZoBYdmXZgyFa3Ii1rEcjnf9yzZpmOqrq3WplxX
HWQLAdBbn2Uwd6TXCSbd1WtDOZ2H9aAVbJ/j6oEHiZLCz8gANYi3y3PyDqgRW4/Y+kW+2WRg3BAs
YyAsMGqDtBQJ5QSMJCOsLFU6cmEITCWElFEpUkmgmSbORoyer7jeisOJn5p8cFbchOnbm/2wKVq8
KrZtitebRiMAHQHo1+8+zwjscQn3zFIZU3pNhXQwmlnunVRGp0KyATrHREbuCKBVKYhPgVcME3p0
+HsHM9Zs1vBAqPmRvNo2er1p9Dzd8Hb0SiXsPsxStq/ySLTVHY8e5rfrD9d+OmhM+t//cVZU/3qE
Y6fo7UEUlX9PaSSfQkGOYB+ChL//48nTHuHVCK9eUNoST2BCOChOiRKIOxEcMVRhJXCK1AAQlWJk
LTUwUxDiTGvPPeI4EIWoVsMEom9lYI7X2Drmbi/DPt7MZpNJqk7kswbB5wKSufFY5HVEXC/Rwq8i
c1w5ikKqHmhgdyRUINq76DASUREvGWKI04gpQ0p7GpxlsDGyCkDX8Sq/A95MKGt79SIxZidf5nY1
V3aAnCOUZe4muJ+LdzcBsFeZ05b7ab5pymlo5S0vQzVEzny0PDLgnXTb4+cmL7e/czlobBYGtciT
hv04m1FTVHiyyydL/dUTE2o/w6ZcVcHaWJWzZZfnGPw+WYwQGoiYVDgsuynkuPlscU4VdSrTM+m5
REyxEdeNuO5lGoRk8BheB4jDx4CM5sFhiawI1EUprAyBIeO8gj24EdY4Ig2GFYb5G8NFMMPgugNR
2sZ3Fd9dQ6tUIdy8n1wau5q8L14VH+oy4WfFh+0L5WoEeiPQe4msDBhOW+S8sJEjroLjOGoVqBdA
CPc+EgMw0MP6engE5ovgXDJPUzA+FkcXsrmXWcsnsWtxuqeP2z3/tFTj8OB0fjcvaiJ3dtJbM60q
ylYh99lYmsFh3xRIpLtmTcah12ugcxYGVdNViXcA+qGqiOxZrp964M2nDuN/9i6gz6Dlw5nyXQXZ
fKw/LvGDKQhz9Ve2qRrJH/cSPUwVgEYV4whFx/fX4ypGJqhOfo8SYc1SAhiFgjNpHSnnKNVaDDRp
ILGmEVHpUlJ1T2DEACvAB7DgtuT35IdcjWN1Nz+rfP0bKdTr8IKLgmavGmhzT570LIe6HttmXi6y
m9O8+O6RxzeBCwckVmmTUxfnxQ+X+fTqbBf4cJozI93/1GZyv3qI/NEEzIiQvxofEaIFAWjsGUXY
W4up4dQiQxRg5hCEsMRLYxEJygRulZaCE4SVCsEF48LRMf+PyZHycUlSHgiDBA66n+wWJuU94qR8
vkD56ae9gKteAqYPlq+7rPwaE011fclG7aDjEHt36SAzn8IbBr4kdcD/9WrQEkJa6+PBH0eDBL/r
XoOmCqZimGGflpPrqRj3Y+Qg/NHMH0pBuIDbxcl0Nc1IwoWTlGMwmzQCfF/HPINfUp5BGAFjoFpR
g7mOVHqJg8FaOaYsjjx6ibR0SlPAlMIFYbl1kVPBowPhv5X0R8mWboedJMOuq6q4Q6b6SJk+EEq/
DhNtYPyJfZVTpo3nJfzAw+UdwVUWlK51GXN/jBvwUWg+IjQdpS7lwmLJR5pThoUXHoSiclRbwRmV
jDCEiYF22EcKczZGUx0dM84o+azUxg1pOali55uJP+5K4Lr1dYbHBaouJj1068JDZWqbPZxfFLiO
8IFhNnkE0EkRAFIU57gVaNh88LuDbHydhLWJSwrwRrOzza22lWrTfhq3h5kaNJquxo351y95FGaw
30ZSyuA1jyo5gqciNrBmWkL/QTpGtNU4KsIsUwYFrSQymgCWs0f7KN0jZOoyZvvMnC82pUy+cChl
tmXRmh28vigmD0qZ0+1jHVJme+8eqpp03Stg2tXZjpAwTzGy+WmsV7qwYf0uhKqoSF2IDXbraJU1
G7sLuPLIWnxIMZfndZ6U1ra+lULlSItcd1GSYbfzX0Aq7JRt5YCGHhYmTT9KZWIxFnMb8fX4lntE
KSGQ97A/JQZpg2GRosYU+heaMuE0MqmKvLcRS1gD6oLQHLaz3CtDSYClfL6BK5WQMmeF3SDj6gXS
nU4v1eKcLqrme2n1TPEbaJkVzkm02+3pHjqu34PT/TJWI6YdMe3Xn+wneIUpgq5QpMEiIVLyzMhM
EEIGQhnBxBoWpJKCwLZbIR6MMt45Zb3D5lhMW/G0bSTBayDFQ75OnuQVXye2Pkirdy9rdyTZ27B3
R6G6Z0VP1mYet5zP4Y6f/jJdLWu/rXfLGiLW9pojwWF31ZQ5iJ3p7ewDfFXWHxUlEvTJfeQP/ZJQ
H0vURwGJqgdIHLWwI0p8qYUJHGMa3gg4EoJTVQLozzgvjZRSMZgzI1KYgGCyjOd4S+diukaCVvyR
min//iA+bErESfLSbfg8fSi+73JROt9/5vxDrdnMlQU+3OMYhfbb4MM27zdtVqHjZvH6kNxcYf4z
F7L7T2hXruDkAUvyRnlSbtoWHjq4KVJHwY+W5C/Jqx4WCwCEZzb1gAiSFDmUaoQkawiM6pGJxEuB
CAYMZ2GPJzyjVCkmkKJH+wx1sV7ZYL57XHo62a/sYMCygwXLDiYsO9iwbDJi+SRWPEK1uOkiozzo
JrxNFTiS48/ybl3c5ZRnCR6+Kpa3oTTrBGsXNZA8EgfqewI5307d9Qq+dmW4TihhSNf9VIQ3RSSm
+rns6qxIvvyYZjd4nPyqLrHIruW5OHE619lRPgVZsqvPkZSjDjYQNS0p1iAdskyl+vJIklfPSBwy
QssRWr6cdxlyyjMROA1IOhqY4VpzpzS8zdJohGELLzcRLfKcp/SfxDpJMIaJy0AJeb4C8kDUTuYf
rudmXU7fb6Hmn6d/C8VFMQuL3c2Ut3Or3MipQBt5iTeX3oT365SQ8zKpRGbTRUq6mZQf+TC9K7bd
bTqLuWrwbKf0zIM3tZ3bvutkn6nrSbl8dwmPXeXn4aTV9+ku0UgSIPiheiUHw22eeX2x6/ByegX/
7021Jqdu3xqR3OsRUS1tdsw9z/8OhyY9hyanW4ySPrBVWE82DU9PU1GxY4Ia8oti1AmP8vdrjz/g
MQSQuEaDOFXKI+kJx95T2DVEIAIzxaWDMUREjkUhNZNEQftchIWo4yN0H5Ky5WNytuyStOX9srZ4
TNgW7cKGnRK3fFjmPiJy26HH+H71N0jdjhF3Yndf9JUPy93q8fbo5IHR89gge/P/XTSQvjSQ08Y2
8VAEf4+PDQRpC+Fjsu6YmbubmXWovm9F9X07bidGuwOoy/AL7PnC9S/Ld7DZHNJr+k/5xsnxO4XD
J57hnvzff/6hz9A//Pm/hxnX2D7DtlqPW6Px1fyS8tISTrVzknoTIo8aOSQ01ohwHb1WSjttTVBR
uGgcwoIQa4hQMhGgw2Na90d8n9tiL3kmbpF5dQneKCcnjRfojcm6r9Sw7ZmxuXNiwnR598Mf/s8f
/3u/8mHd4/lFbtzK2FH74g04WLtjGLMa/fK8Wc6lNc+6wbetFnsmgM6em7NpphGpWnxmo8D/JFn7
gEFguZh9KDbdL0Csl/BCNfDSvZmHNRxm1LRw8LJd5C9Vijwzsxms1Wgr+IKEiOWcRyVUQDoQHDzm
RDOEcKAU2gSpqWEGM1hZWN20bJar6KkwGiEl5LH4vlteZGffLR/99A38t3VYbjNxw++4vv7TNzse
/umbb3fex3V/r2v+qh2K29JioKHa3b5uyYp9etpyor67tU/c019zBg9JiONdVuoPosjsm2wTNXk5
6/emAsvxTsyUPZBWaGaGNUzwrFPH6CClzXPqj5z88V/+ZRDomlT+9PHik7QHaX/4nz/8eDJURqNO
8oZcuRF+j/D7JSUpxs4HwT3R2nkdnaWWScUoJjC7aGmICBmEvA2Au73EInBJJBGBKGzQYLl/kpCd
mLLMKTtuNyD8+iE/6VaYYd2yigBK6Sm26nN4A97u+7nAtdzyNwXpcp+u31JZMjyChauGWcK1MHAt
9MbcPqO79ddu29RCgzgA8cBJoEFhjgLxhEWhJbeEAAJ3iFOuKVdURmeiQoILrwmQiCzrl9snyYki
C4rF2W3DNfr6Qd/ryX4h8y5xUTT0ubXE2PfSbguNA7/smvd/+gYER4XMW7Lj/vZJWOweuOfy00rj
tFO0J6iclzDMQsJaCTA3Mvqk3W1IZ7B6qXa6iamUzm0oYTnnCcybRe0DlHq/LdbT+bGlDGl3ro6b
8N68XS7MLCUCGtYX/PhMGHogz+/jE5/zIQaUPaIP8YhwR4T7Mv1IqeVapzIbDisuKYPXETEKcXhT
ESsDNkSmUPdobIyKSKolcSxwZAlCmsSHEe6f7+xD4LYl3naItZbwi1SPkMCvRc7vNnpijHDxq2dH
hoHRmFHGMCG1jl75qDzBlkrhHSfIBG0FhVNFHPcipaUIDsFKG6uCOlpVe8B57aQMi1cT8irnSuxZ
H3obLLdY3+wGqcPijoRC3SkTHNAKsMyt7XQ2GxAKyR7AhDDxhgwCTojok4uMMfJG8qHyNPSIdpNv
+IiMRmT0MpERZiEYJQW3PgbYvUtqrWbWGRwMQamMM6cgmhGzQcvAjQJaUiEzBI+EEJ4T8NYSdpO7
xXS9aoS85fPi+4I3NXNmXiXere++Ksgb0fRdK5OZ6W3yrCO8EV9Ttf4OtvOoszdMEaCvigR4H3B0
Cl3TN5s+9vumnX2Th/rGgrzhzTGAkjQIf0PumQDjnRF49/TLiWj2Tqre1Rt2zxRkfX29XMOb62LT
7etdoxZKzc1GbDpi069eIGoTPEPaw/6PwH7QUUGdpRgWCTPLhMAwjWiETGW7otA6kOxJLKj3xnt/
dI3sbuGX1HzTWLPxd0kQbT1Iu0Qf2rmntiRfLv4423WUBV9HV7Xc6xB8p109066eyQM9Z+nUHqIh
9zrHYJsxGuGO9/VaC70uqdfZt6z6fkDmNaph7om8Xj65+YMtp266/lCkz/fIPYHq3BNMV9d/vptf
/zFe/2n5LqVJh6P/erf8TIrSoeIK5WeoJ9QnE/FYDWjcFbzYl6AjsCVAUhktooWevEJUOBV5ilv0
BsH7jnGvpRcU3o9UUsyttSGV6bApo/vDu4I//PWhXcE94m6nOAXMvcgGuH+6eCTCrTt5xRjwNkLZ
l8HFTidbR3LSgR078C1hMgidqjNYhg3m0UmLvIRtPNwHKoDHYW9PPSLA/NgdC2Uf4NimPX2y2JjN
8Z4lvisw6tBa3idU6igjeDOZGYC3RWEDDHIL0gA+tuALs9pkQ1ssF+d/C+WyuM0TTJdIryrmtDv5
hZuWDj6y9OduXi/tZ8J1gKkVRY0f/ont4RS/YZg3CBgoWe7xem/+Bo+pz0bM91J9uKjx1KdyxV5q
aaTSPqV5l4JLzT3zTivMguDMpDRMGmuvjOc+CKOi5V4M4AXaIQ0n5Qb23YZyOg/JFylVXUtaCgzy
Ag7aHlPbZiPEGyHeV8+0MWLDdZQ4OpSKw0QtU0lFD3CPOWOsZRJ7AhOXRoRACWziHOMUW+QCduLo
PLf3smZmvi3PXZBXFVu+Kqs79zNlHzN7a9gqvqci6DjwxVAn+Arv16Vx6+uU22z2Ycjongmtqm6f
nhWTqvq2TIepFvdpj3xZl3RTvDvFCl0NEj0zqcNnatI2h6k0eC/S8KYqN6vqig9EXVWiXOfVQilJ
W8rftjvrRWLdV5XdrerpakR3I7p7kS+K5GxFYCIUae1hLQmPwSvnkouVx1ZzQyns/RH1wqtgNBAW
MZVBCRuDlI+E2L8rl4u355WwfwjhtUXuJPFOlSpl6xO5aqQWW4f5LZymnCqNlGHTxSLkWNbt0w0V
X2oQZiHdzu32YnWS6nC53rRI/e812Az7xng/gWanh7eBxk0SmF2D+j3343IxqhZH3PkCPDiFsIJy
xpQPPjLEHOBPSRSS3nFKgQjtiHWpeqGKsAARhvEqEgl7TKopPRZ3PiAwany5amTIagmMfOU+gdGI
EGqLi62+sUtUNJSRbSHRziTVEg9NGJyyRvV0Na0XYBOrswI8bNbF0rm7sqgWJZO31Wau726B4pyp
6jhs3J0L6tYsnPkZPvFlOWjce8qsKwGSEfhLAZ0J3Qt08uaTqadhYKdWVZpgnpLaCoCNvBdVpHoq
Pa2AOj0QGGZpv5D6JhV1hPalitDq6aqnEfyO4PeF+nSRwBAMIQyQzGOkhmFHHYo6ImyJI4IAGIYJ
KemVstYHIwVQQnSwPMRHauv+64NKzaYknSzu5lsXV1OWqRpmnQQy36luvLsB6re3v2vZuOdTaJ/a
vpkufHg/SeUn0+kl+rZ+4Oq0gVnTrfqBy/n025SvpXi9OU2eVN9ux77qfmpDxjm0bT5eX+98fvvM
Nmp/E3ABDUd4PMLjrz8XFcwqBblHm/xHSUxLaCPIl7SYlIOoUTrBY8GYlYjTqLAVDnCxY8hZgY6F
x13CpbxfvJRdAub7vcITx4mY8kgh87olYsoHhcz5oyKmvEfIlA+ImSNAdlo+uJTz7S7jDmtXZS/q
Rc6tjgTVpNvan9xNgdfm4dZMy0FhdUMby3MJi0one3aY16lqVz1QtdOd7XBXuyfVmT37PNNSR05L
9ZgWG3xa5EuY1hj+Nu4MXqha3AcRtCYOe5gAHAohjMXeS2cUFkZwmJYySbklpCacMe8d00Zr4YE+
9hxH1/brYJLePsDA6Q+p/tCGWhwYL2m2UgGMeXJ8XaRfy6zAmud8WalqU/G36W1nP6enHclZRyQ+
IvGvX1FNEZXYS29F5MDgAjsXDFERADiMgKhgKjgG+NsRaQwwOEyYU+EjU1zR/8/emzA3chxpw3+l
1xEbBGfIUd2HpXHE2LK9u5Zlvxq9b3g/isGok8QIBLgAqJlZh//7l9ndABoHSTTRc2jYI5EA+qjK
KjCzn8rKfHJ/Zqpdylzp4EKVpzuU+RrDYcf46x5dbjZz/NP0XlXeJ02pzHoqa/2CuAXKW/mQp2nh
Rca+9uR0Enwn1sXYjdLX3mUhgUEDOmENsgYmPG4R59kFiKtEQSGawrQRoxuIbMsgB11OhCwRJS+n
iLaAf13wQn0I3u7v4c/zHtruMf71Hg1hjYaRhSEdIXMZ7tmAPg7HPTf351R7RzsN1tRzygwxyOIC
BwhTYGClyYEwy3KmPGgwvWBRlPckaMETZV5HRVZJtXtZpN1EzliW5e9g62YdL7zrGCOsi6i21mYt
4t9114vLLWFaxMJT8iEW8Lqaqqoa56Z0toV0xvQr1n7F+jQjfiUF8xlIiIZTTrP2MALvBRPUKe2h
cS60lIpEKlWi0DMA3IxUrMGkSOjhYfpLQ1pzNS9WqffyNN9V+LAkX30Jlz5bMLCeFtXV8DM8Xh5e
A72zJk1ov3jtF69fqK5LUGfASYYZlzzFjBzJgmKGKe5cYCRKKrLOwVJHKTeGMg3ox8O0Sqep3JuL
ZF2jm2mbDzAql1pdl9MrNqoIlmr9rKHUp/S0odDFxkJ2Taf3z+pc5gjUmZrOzyajW7g6DnM91LIg
ohuNypVumbu5CpcqGY/3XOjKO+qXv7t45WcX30J/XS51K6c+BjsdH4DjOsGUA7tYVSLIPT4A45pO
xKlXuMcH1CPp0zx7/PhEdzxg3Z2I84RbZkIwABS5gJkiUWU4aoNkTFjJrBZRB06SCjBwB+t2lnxY
EXoeUoZ8ZTE3IOT1cPzHETI14TOC1KAPrl8dXBSm23gS0UYjaw3Bm0H14aR+8DTCo5YtY4xD9WHj
qvrhVF94Wrf7kcDnZ1Z4o8eeT2rjxBhtHKHZK5WDj1TFAEtIKSzXXOYsVCYxg6HAbVEnVSCcC5Gt
iUE4Ifj+5bI3rEETfm7Yg9XxpkloHN9pFYr16KZtw1Br/Pp1O0zD5nWLqP4N63BcHARkobXhNYDZ
FYAtfJq/TYhWx++L+dvJKkAJge0jkOxu7mk3C8PhRYWUNqvyHV4D+qZtDWhKO9moOfr7dAKm5LpF
z6YT5+fRd/A3eOsuU4uetfo1b8VMprHfg/l8+T0A23nLLMV9cKkDDIPDKDhlzlrpFQkwJO7BiscI
eE+5xJg0UVDrYWA+t9uD0Xculm/c/Opi1mmhnzPcaCDwP+7DinJLpnxbL6DPHy5lydrw1HeyNXJG
+UpmXe6QlG9Z+VZ1KzPrSGa2ErncxVlMNKN1YlbHcy35Z2oPHyop7W4vrysSsdmtX0IANI6T2/ls
GFP5qF/0D8o6n4TJqLeWn8+OtQVZQ7Jea669hf8F1dYmeIHpIzxQBmtmxUXyTKloiE7CGW9DksGD
QO2s5W52uNEEQOxsfoF/Qul/Lt4OwXAiKrxYyzLvPHoc3WtbWtyCrld1s3VMys1isQhrwZTPQ6Tq
OCK9+q0XsTYbcpkWkK/3RPaeyKdZeiRaqpTKnFEGt6csDU/of9QuUym8iSEJQmFCs+NeEkdF5D5a
43JgIvDDPZH3GdgNz2REYoEztl1T9PzhusR47s3q3PB4m5Wk3hN7WXk03mAOFEWC0a3jp2vpoIt/
8aa8qnRWlO9P8FDVzPFG2OkehZRBoPryb6qmt0oe122VJ/vQ8t5D+iSTPLOjhIPpss4JoSQJxPHA
o1OBKCEpVS5rTULO3udkqI4qZKN9ZBbJNM2+HtK9rFRd2a4yU3SHmaovuKMm8k/z6tS6mVqe+mmO
/M2DTWv0nB6jkdo6fkqP125GuXYbKGxhUZNvaZ8eEhRlWbdPa72tW6f1kn+PCJdfOmbr76Govofb
0jM7uw1XFSULXrHLZRvfuFD5amHtN07lN/Oo+AO5m8UwTtLsAh52sPIcX/y+S/LobbD9+P32rqqG
bAl1yg8IR+issAh/0OlxgFT9qqBfFTyhfUeXWVZWRUVVUhnppanKInHpqOHOi5CUEDRbePgyYhyL
3mNvlFtYNSR9+Kpg3aIO3EnhT4rQqD7i8EnndxcWWVU78IDVHca7heJ3BSlgwMtj/w7HoAlyXxMf
v1hJH27Qq/2n87cqRYkBXeYRWghZ6iCcY9oLDROpvNYwxwHmNQKSFprDrDmfOcBub7lwe5eE3lJu
fxI2ypRU6n18Z/GR5rX7aPnDLTXrnzw6duDOyiYAPOuaJguqwOEY7sDWlji2TS0Tye+gDJw6Pxm5
i1/SdJ7edYhE5TbwfPyW0uCUvECqjBdSHncB/ey27/fx4boonNj4d1KwF2z9H+9EcrYt6MYB1UZy
+oKcFOIFOe6haw9dnybNoNbGORDfYdpGyiZIqn1iGHERYPaM5YEnkIGFLCzSfxnmogdBguBhl0Oo
LXTdsMGb2LU6WrwsBqe++KoYYBkVV1YCwDflQ+y08PDqj/F0eXSDOmTTuPf+3R6SfqkBU9Z60F0X
shXJ+mxBnRlPhDMqFVHKWSlpSFrxqDNXijuRkoErfaDO0RYkfncobQ0bq8MvB4Naa1mllidwYKm3
x5hhVWluU3WP1/mnN5W3jfezth1l8ZWFxHvixTvy8W9SGOZhihd1OGvXAWH1Rn0dE1ZxhbA62oqW
wQVyO1qJtKuBgtVPzjuKB3ukxKxdQRm1TuT3KSRu4TeuOfBkz13dg8qn+RTynhlBIjRIeaI2JJhR
B3OnnHEsSxEZ14wLzbXNPhCYQWu0i4opzmnSppvCLVvGumRkPSm+36KoOxuefX++2n/Ey877Gik9
fnyK+FEbprnxIUhOMZUSeg+U0uyxgKYSQseQOEgjLQzdQjeaCCmdsM5wsndtvvt0c7qPdh7MKLcs
UgIg8f1KnkWeUpGnk+tlohImMMUhHJ/B3W7UolaJ3J23VJY8gW97jllLXabgD44450cnBbwc4Sr5
iAqq8LOUR8ctmN4GA2gHg+PLQnbQBgAaedyJDw9ktNaiTPC7kpEQUsoIL+2EhIYAsdW19wgBIQnp
TEqlypmD35WUspay9VRCQ4AyVSmlLKXcmMtfH4PdeN6nTX2++EswMNHeG8Vg9ihJlHBHtdQ+6YSb
zgEnTjDlo6ZB2CB80DJTHWC8wqZWiQDS7E6bGo4v/nbTKXFdta5iu0L9xQHrtW5o45a86KZT4U5p
J9JhshPac8xOwBUv38H69/iNlLVUrd6W9basSz4pwRynTgdFpeCSsiSE0t4GpzzhWEGaxOCcJFob
HyVPxMCi0/GgldXE+3a2bHdS0/VkjPmf1R9kh/nl/+XGt276/uiA3dejt/Dnm6ZHnWR//y3MJx4b
23TXtcgNOnK389vrcTcC/dftOB0dYJiOZjfICXDUe+J6T9zTZN4UMVCRQFhhmATRA2FKAfCjhhLh
uSDWwlKfYHK9t8bnnKnK0WCMomDGHVIromk1B+WHkyK697NGVGJ5FBf1g6UthAXWn5KfLt7/1U3D
1dEa+2bZYPGyWJi+6lQarbf3CjR/VLVQNlSakt3t1EZidzv/dTsq7391e3k7m+O714AvEkYp3dXc
7fV1Q6xZ2nlVbSY3puLfXi6GXIZl4XRhsSvbSm5spBxusw1G9hF2rY3VQNcaog+PZ6OhxXPlwGa+
n/zSiTjfprCjHfLw39iC9nEDCPQRrv3T48vE3pwxarLRzGoKLXjFkhLJW+JiYAGeFxoLjuYs4V9A
J3EgOfCskWIrerY3n9b2k6J+UKCbt91zosyc2qHA2NK+z4jNNhaGdlcbDzwftpqq7W3VFD4bNq9Y
WK566NV8YFDuYoxVwO7y0bCPvI1GqjGutcHIg4Kut9EY4XpD9Pj+8Ww2tHgwHNjM8sFwYDvLB8Me
89P8u7rjubDHLgR+UXVdm6rl9VS7SrT6KbXfhoPanXJXMgwPO12+sgdDnFtQXQyOMMbvqHSiwe/3
1QfaiStfPJjp1kJQ+GMrFpN59EHSA+nWPNLHTKS4cyJ7D12PEjpECYEi45pjTHMHx7gy1ErrnPYO
RKEGMILVkkcTjJZah2RkgvGRQLkjRrUrlKPoTvM2TdfwDFhsJs8+fJ3aqioM2VnYVCz2AVqF5fFm
uRly/gGL0d4p+0qK83bhbvWIP6XsbaVuNn+H7L2rsF/sPaFN42B4yMZL6CZhpQ6Xs1YyCqUJc54R
D/bcW54C1VoYynMgRCjcWCY6e91N0N6GIV+rDLsdt/euxMvvcCVWXogLpnclTKiPsD6Or4/je4o8
P6C4OEXW+6wkJzIkUFEeY3BSS5oNj8wpm2lI3rMgmEgRr4D3zgTh9/XcPKCu08co7MGhfZVQZfmc
Jev4WjgfdtTML3YgAKYh7x/Wp9id9RpnaTpMXSLQFvud3dCP0xYJJZx0k5C8f6yJ7BFaj9CeZhkc
yhSVRAM08zwwsO3Gx0yTI5ZTrxyDn+gFYzDEkBKjIJWiIIol0jBN7kdo3z1YQLGybCvaRbDdY3RB
b1PCkJ2bn/XJcfF8rbnitGDHPSrrUdmXv8Ti3pjsYNEEEtsUIqOCE+UNyyyKJHWGz5w4l43zIWQW
NOg0ZU6wZLNIbWojNpS1BFSlsn6DyrqOr+o6icu9qP0VdQ8kFtwo3I7cPDXLHeLbm8lsOAcsVuAu
ymWqShyOnw/Gp+wYf4vjFy9eFINb+O5Gxfj0XfHym4Ic74nNdhc9DBNo7QIUZnpR9d5tLN87DxD7
8uhx5fweHyH36vfhj98efWRK8aNX/jKmP7XoVvY1Ynqj+qFYuLR1wfKkYDXLdbQyckeckclgrpqi
QRFmE3SuWbQwoCQczTGYkLkKTrTbftid7JCnFSnV+w+w8XB+QHQw6dATX3nLq//FIfnx3VQ1IGWy
fiUU3ZUSQvvKqv2SsjeeD8QHw4LS6ciYDzRGwlnUOdDEKZM5eulMJC5wwW0QQjIKBhQEETYGgRCW
08Ppn5amEzlk3i2WliVY20H879YZ/4cYtvNug+m/uvf58uYazZaH+2Vmv8z88v1EihODpE468axN
4JRnEaz2QQKA8UIzliQTiQbjU1Q6E05DEEYxrV1Ke5dBbaruuwZj6EJ5SbFd5NStE4uudLipttNt
xT2sPulS0ooLakEy+qhKpGp3jthlml/cpNGoQwQoPrbjv0WYGUxDFz22SCwTxPQwrYdpT3M7l8Jy
VjujhTPcBCmNDMn5qJTXMYmgk3dKaZCDZ+ZlCDIYlhjMaFl7yh0O0xbmbcP7/83Lgu3w8FdHHDwD
WPXWr95uFEmB5du4LPnUaCbg1UgMCCfc6jC251cfsc2w9qTwPbzr4d2Xv2Yz2tHkkmGOKWRoMsRx
5xRN0sTohIF500knoRTLPmdJNOUJJsRFG7kL+8K7psrXFYkwXaJS+kb1ouVuQXXAreohVVq/qzQS
av1z2mhkTeWXR0uNX34qFX69NpIvDtiPwNwKHGCNB/eDf5rcGflRDu0Cg0g6Zj2hiwhYs4hYLWNV
4YeWxyg7f5DRvU1QB7PdkI48SnJ5QHIGVZ9QcH3IlPMe3Pbg9mk+z4zISXrPs4NJI9K6SB1V0BM3
UnimqcqeSe0S84YkahU8AJGiwLvstVPpcHC7brwXQYzXjVKqyyvuLEZ6XePYk3Uou7rx+csq5HGz
+ujyih689uD1yy+VFpKIXnHuE7eaWEZixh1bCstXw2xyOTjhtObBOMpVMjDkYJQJXiTLEmkTAnOX
She/8n8L/2jTKJHiS/m35TJe2dfnlXX9tY/szufCl/PlbT7bUFFbl3BoxItVK7RZ5bIvw/cXxWqr
2mBxGNKscu6vqHzLnvdc1bF7YsYmIdxCWyF1GS82SvPZPI4SoJN4M5nC748exQXPyxkKMZugGChE
Gxk6IaY8unY/p1IE+PV2Mp1fDedHfeBGv2jqcdQDTkBBvQuJSCe0B7E1kYJzTaJlVsFgjNOekOCz
YjzA4JnHTE2rc6LZEt1BydkN2ziYPRS7UT3HwdTApcfrcRyzuhT70azi5ILPuJaqjs2rY4PqIKsO
xjXytWa39T5yH/3Rr7CeZkU/62kOEqs1WONJ0JzYqD3uG4pIgwPzEAhXPGiwHzZmlQknVJFoDBcu
7E3atUv/S/RXnnhZ5xXcpf2NerSo/Ou6/5zCgYXe42d2vtT5JYbe1vdm2bANfW9TNawcUlVhFkZ5
5bBMBGLPI8Roi3K0VdgIYMjh+LKgLypMCo1e3/OB7fVhP7y6uz7Z5XRye3Pxc3pfAqUudyEGR+/T
aDR5W3IJYTUEDx0gXVP5YXmON8+J8sM0xfKmFuQc/1w0CHIgJ8n5SVG1CZ+RbQQ/Y7N4+vxfnbj8
B0fVqeX4lh/Z+ke+/lGsf5TthlnfVw1zxXbS2ZhW3xkha99a/XH1va2fF/XH+ruDT4/99rDaBTS+
9g3iMVEdW3yL8OlfPZbvsfzT3AChgjsusk65LMVh4RFtGW6LEM8jCMJ8UvBMt9FlJZlwRDJOY3SW
M0MC7YZ5Zf3ZMRhtsa38818rQP/zSfFLSdmwFvyDF76YpTk05+DtAK46Oz9+4W5u0jgOfjnuuVh6
QP4EWXRtNMnlLG1W1FsiYUKlzNw6x23CPY6oIgw/eqVArZk1ZUZGNBFmA6D73vE62wo83Vbh6U4l
bnim99HjgylaSlnRWVvFZZdQGyQ/LUUvbtyw9PXCha6Iw/IuNy2DtxEmz/b06e7OAx7OLqCXYby4
cTCHgOVnnfp1B8f//NfZeQsf5o+gwp24UgfHZ/88/leLnv+EJqajrh8/4B7r9Vjv6TwM4G8bUJsW
MuqooevIFUA7rTAxxzhqPaEKKVwMSAHWnxoloB/hhQ0EZjIcUpBjh+UbgMVcxqvM5i6Aqb9Bnwc8
LAZnsEL759EAFmhHx0hs/k989y98d4bvzo/+dbx6mKzaxEcKNrvu4l0/X/ax4cAtu188ZFaXH6+u
Kvm6SxcSXnqMxRxIgX1ja2fV/TeTm8HxOZ5aNbHRUf3YKs3f2oNso+lfPTr9zGpH9Pbo87NHhApp
vfQmaJO8Eop7SZTOhmWQxEQMz9HaRy0zs84wbq0EkxU8Z4lEYfcFp7tsT1Ebn2ZYxLoJKi3QT78Z
/ATN/PSb459+cwIv/6w+/av6dFZ9OscDjYbuMknTdVNwl2HauOxe87Rx7aaRerm3kdrR6Zqpmm4l
2mx00wqC/5Kmw/y+KL+V4bzOjKwd2pPmtOwLt3dXOr6Bbq7THFQcmgbLMOoSbVOyRe2/dYS3iMJW
nRBm8AcLgMqPndnJtqLq+dYR0UYq0tMw9hD+iYZeEOvgH9ZRztCUNIxmauA5amCaELR7A/0QAPFE
Gw+Ty1RWNERHdOLCP0DD+CrG+zD8tjlF3gx/UoQFil9eAc9PV5wWHn7W0ySXV/Tu1x7hfvHqyjAT
2huegoV5NDYaL4R1FAMhXIia5+QD5ldTAL1WqWiohy+MC+2NFnZvKuydmulPwgLgLs+/dM/987AW
rbBDI9tELKxUvgRxi/73xG16J25z49nbpjwHYzW+naK4f1EjflKoTmpBsQOqCQ8w9uD4g9R8akGf
NsBQgeMeffXo62lSYcSoPJNMWAq2WihFwWY7z7PmMhqtBAUcphWJXmQjRYgkAUrzJDCQMVNyeOBr
ZRkH350UPzS4MHjxrPgOU+N/2ObDwGsxuf274/t4sU9p73Ds1fcLV18uCRMpUBeDgB/lbKY8cOjE
Bs1U1NQYapzUTjiYggjITRrDPWGBElDvfdHYUkl/aBCTYbQpW+rp8ToV2VJXixP27LulW6/U1Z0X
ntLjA1jJ3k6KOJzNh3B8md00uw1XAOhcWRF0OC1G4boYDdOseDucX60FnrZJbbJ3bYNDtxc/J2i6
S4+c+Pg7300X2Ufb86ZWf/Qt774AZ29Td9lU5bmTNjhpNLSmowJDmTh12RrijJY+S0EY8ZwzEYMx
WUSjeJQAiggPshUDtuH3ZEqWgTsdc2DLRVj0HlQx/CPT75+VTDDwo0oJCUZWn2+vMB9P4C274rMR
JaXNTupuuV0e+VGJqP06tAeyT2gXQCYsN5B04EEBhiWMZwamVQavGBM5CQt41tMoQ0iGGx6E4tTk
TBzXypOuEjBLkztw0+lJMT4pft4vCZM0qG0Wp9+sTg8rIpvxZool4GfoCHM1T8s3b8pczJ9xd7v+
eLq4AI//dns/u+fm7ncjnnYwOCxtKRcebEAWhDgBY4hWgqFIzsQcAalJBrNlXYT/s1cgmweLYgyz
NhDaLjtz2zg0MzS/3pmiSU7Gq5icTcPwvDYLy+Vwa5PQWEhvMn4/OnWzagjrfeIKebmsrsLIr9wv
GNKCgeS5nqky2rwq/Pm+DfW3uSvrMjnc96mZRwKsqzslgGSYQ8fhlyTb6JIR8vFX3Gcl6NUAd+kO
gT7BaryRP3l+CA3jpkA9pu0x7dN5OEWfGA8AXalPyCicrFcmU3hUaSk9Uxagq4Xp40aAVFyJGDw8
vJzxzsvIdVeJiFvmtORvO0E/6QKS7rgI411Go8HgXfG7l3jpeqnp4z77sAecTzG5WGWsAZ9AWPhJ
hDNthPdUG2+MFrBAJRopxK2TgG9EdqjqKjDvqOJhV+mAu7IP79DaSmkR4O245CVq7B0KW95Tq+u9
EGvfUJkFQCwf+k0uuXLLxU3Tohs8MF6jkmvDEG525x3euKnzk5G7yJNw26WTdIcX9PEOvcEpeYEV
9V50E25jH+QlF+1kExv/APa9YPLDhAaJQ2KFTukLpLl4Qdel6wFlDyifENsvPGOSsEZJpkkgxCfp
uGJOxaB8UlpzG2ImxgvKhZIwm1wkno1TWghN/OFO0nWruxkrXR7EVMdTX3xVDDCGxyHxjcA38BPK
+OmqKgU9xkvKMxtYcsOg92CyB5NfavAdLPqYyJk7ralJQQWTrRSRUpYjsRrmVyiVqcrMgyIn5WMI
ygVjmNNGxr1jqe/Q2mLhsYSjoLWDWm9ZpZQncGCpuceguoNSd483lff4eM3fuKG+bQKvK/tRBl0v
RN4TI+4Ouh7BChmMAczF9TV83bNbvyDI6JKi4tWf//zjq98fbaKboz//48d/vPrv7RPqgIosoqMq
93/49s//sS3xqz9++6f/+OFhgdXHplZ+9Y///nGHuP/9//3j6EGUKT4u//GHCCr64RZs1r1xRTe3
03S6o2F/Gy/THA5cudvZvA8z+py8gyYG7ikHkJaF817C8LQU3GLxhsxh1ozSQQkaYJo1zpxIVMNH
Iy2yG7ULMzK7F9HTSbx4DdMy7dIiMvkJtiz4p9gnoarn6elXrr2xe9DYackyS45FWKaGZKy0KVAP
E+lS8DYnkhVLBmbUCZhJLGETaKIC5tqY4LnqYOW6MnWroqsbe/VsR/HUsqT2M/j5pjq3EYWzsaO/
q4Wtlp7BHfjz8mUx3nFdYymMNmNtbVwakX5p3NuLL32bxVgWmdKa4GLYEhIoSVZEbzSVVOMAQRBp
ouKZ5ySFFSgNoyoRHfjePDqbVmF6h12Ak7VaT9dMw2D4DC3DAKuvHm9RzmwZh/F2I83GsLVnb569
Kelnxruv2zAGX2+QR5bQ5uvH5NGEqxR+Lt5eJViJTxu5MdVeTREcrCYSdHMDFgf+NmAh49+X83cb
5mVdobeTYlbO5AzDlcaT+Z5r990JNXk4hZX7X4ez2XB8efH3yWw4B3E6DoavYlxOMSz+/ABSmU5W
5WekkuR0WS7VnB+w8GZdyVRNE4hzag6ZI/6Zrq3/H8p5z8ra3V5eV3/u6D5a6BJm70xu57NhrGof
L/oHfZhPwmTUr7M/n00TYbxMghkplNBWGyF5YlFT4ZzLDGYzW3jUELjGe1iNy2ipJrjJAhMA4rVa
Z1tyTzrPf47n8LcwAmM2BKXrMktwK0avS6+Y+CAUDexBmdlHLp4mHhTxkNQj2q/9eyz/NNf+KXqi
YmbMG2q9Fz5kkTMxSaYEo/OKWK64VtxlJZRLLCuqmRQcBikUu3/t//rWP5zVs255B+8A07yHn3cA
bN6zVWWGKhH9PQOU/p5W21zPisE7/Pyu+tyvvftt6S9fYTmT3kfhuUJgpAINwiCRNtNJWp9JgCV3
BHxknVTW5kC4cVICaCJa2UzaJdVs6yaoJmgmKuZmAdwBKucpKufpSjlPUTnx8+P4I6psl1VVXFzL
giQJhYKTp5NpHI4daG8V1zgaIrFtCfxdvd7db51r6W5oiMvui+vJeH5V9d/l1vSfkp+ChO8/SRWD
/7odp09RuOHVzXQ46gso9OCst/V7kF3ETMCwG7D5YO9pDp4FwSXl3lMO3cNgOI0u6eBwpBpAXPba
O+8UBdgWO8i73jSAg+q9u068QQi2OlgWrK2UHB2NGydKq7Pj+Ot0M0/YfHlysHH2+8kv1cnjbSKx
RmGD3Uxjlcn8OMjwM6tB0APDp2QsaKZKW2Isl05lwawmzlGZLKDCkF3wUlGhk6EiBCdoDBoXfSRI
zinTMuwNDO83CSUm3DQJP/2mNAk//WZd90G5f/oN2oSdJ5ZGYefZhVH46Te/3cCh5b5seaiyCDv2
YNplXN+x91IKVJSkUQHeOgCeBSdFdO/b7bHY3SxD03QNQ7yY3950WkZgUFHjyMX+iiw3EfDgcUte
1ur2TtJRBst6sKKUSJX/65PCwP/H7VhreaMRvX77AQJSWrMfYcIQrX/wM5INtZu6Zkuiz5fpwe0T
jSKI2mnmknEyQ5M6aSl8ctLjzFlnYjQ86UhM9HCIBsoo1XBLgBtJ5LKbBOymlR2g5uDbRjnY4mVR
nZul+ep8n1/dQ8wnqLJBspBEyg7WltBYopJGoxP0kgwMGkv6RaZFjpF6SQ31PhkTEzPI2Rj3T4m5
SynrTJY7lbKZ6TKA6/bwOTaBXtVtxasDzQ9D6VjM08l1A/WVHe8J7HZT6EzC3I0ufpxcfJvC8NqN
PlFwN6MfO7KbdbJZLVr0yFnPRNsbww+UH2hhQNxYR8AMSupZMJwHJQi12J3nTGpOHUxloILoDMtx
xj0lSnilCdHtQlfk3XF4HyTsbrUOO+8y40x2SIDFFrJWb3ay5m5FidiPHLeymNHzByNqWvD5kn7R
2C8anyalJKE+JmGECwyTUFz2xClODFeeYV0F6qSwNiUeg9JcG5FAHFxOuhQsC4fviJQmt6KZfNeg
jR1N3q4YaK+Gl1fwaYwb382V5Gn96e0VjKq85ZuX5cWNbYvrYUSSBjz5vDx3XHz1VcHWAtuRZBKu
Oy9+V7zbyFGpu8ZWlp1XmyPN+77Zuq+SH297vn7bjorSs+rKhzuuoTjc8WvfgOmrS/em6SE8SGIU
VoVMcRdGKXRZUYB7mkiTgxbQhZFIM5iMgiNKSFg6EwOSUQZTv3dgzsoAvUP22mUUTqXBZPFxzQZN
161QsbypskSDhilaT2y5wxoVG5k26wZpeq9lmN5rlKb3maXppmGa3mWa9hJhl3lqW9oGiTHwCylu
yiQYOIUMGbASHCUEhhXx2mwyxRyFFuy7Vj24J9Rp7YkB4v2SDegEf5tq9wTf0vJAtSIoj+1AsnsD
11U/jR7W2u4CcjcGU72uxlJi8YcGxNoM6K42OxkIrfbE6rHwu76a3cPgLb8XXrd53q8u+tXF0/Rv
5+AllZpgrrsX3gcdk8qOKuKM8pFmz0SO3AZ4lMNQFEvWGBo00rgx80Cdi+8n8z/+z757UbPKr11x
Af9lfUPqDB4uZfoqvmKptMWV+CgepfEAjpdZqn85/0Q4vN+m6tX4E6oxEQEUNmpLlVHMcxgRTJU1
OTLtfeIp0WyJk8jfI0XKzFnCsnQxYzls/5htqi19bexV7aev/1bqazdbWAv230q0sqQidnQJLz/v
BUAZ2Z0ruUC5F9fuXad+Z8RQ6MrFoBgCiAYjdyxAH3RC44fyBKvjbrA8hDhvAW/0eed+Z9EIV6r/
byVRGdtkcTDnXdU9owufvVm48G01WThpZfW2NhJS2gPBHgg+zSeII/DoCJwYnzkXMIIgJWfK5pSt
djZIy6P1ViarrYg6c8uEdRwmwBvB/QNZkfejwKaJLVnll3xFcOAC1BQdGctTqzOVGuLjZlhRpJxU
9CZpDKZj6uapvgMfOm/waVM3t44RVy31ULGHil+8ovsQfOA6CC8BENIsTXCSCgmTA+MBabyJ1gIo
lM4J6iJJSnMZhGISN5/E3lRGu5R6eo9aTx+r2C8bij19ULXblJOA1/RuOZKSChgxJjQ7vL69Xqs0
UYVKoVh7os270i9//m7YbYDD0WScjk6K5sv5J6gptuj/x7eT8uVqmloJ0l0xsSM/vIxu7lCM6iJ8
9+0bsGKTQyTqAWMPGJ9QhVxuufZBJWuN9ZJHGKrzSJ0hVc6KUZcc91LAcyYpFeGpQlyS2WYVkifO
HwIYays5GM3mG2wZ6FvAEFk8UzoYaA/qelD35ZOKOYYRQixzLZPXDrNFJCUA6hRANqNMylwZZoxh
KgYWEmcJ4F7UhmnCZN4/E7KheJtsGOu693JN9w7hfaw3lpslvbCa1wwjhltkHTLC7tthTvANdsl1
USOL/eHE0c18ctQJ4wT8fYA+XrfqezK97qbzEdiNW3fZhmrjaDS+vTzqkVSPpJ6k8WZYRUEDgJIB
JslGkYVyPnmudMxSgjF33MKAFUAq7WGtTpXy0WobVYC1Ozk8wrNhAgdgMpfuN3jPYBV+dHQXPflo
ccNOmvJ/LxhCMLIRTlm3Wr48xxcKy/zTgq675fB0j9167PblZwXbxFIyzsEINXMiJW2F4VRRWFx5
GB+gNQuySOc0VVLA1BpYb5EsOOGw1mq5d9tUcsRvKx3HTxsqTrdVfLqgwBmsFHw9gvJu/W6UfF1X
7/33eVF8wIhu6sI8TWtMCI0Nx5d7okBxNyVul/jP+RC2a0SFo49MmQ1ygCRuWxJ39LGrZl2Pr6/J
zfW2KG2QquhhYg8Tn+RzghianOJaW5mwEIW2IZogNbXRGIIVGinlGNBDjCQ65egklwAldRY+uyg6
oEZDGzmYNSqsVtE+dCc8LB8cxxugcHY2PEfXQNiZYoO/n3+yVJoeBvbq/QnJzJQxwllGYfHnhAmE
BwYtMee1CFRDj1FHTKHhJkXJuABwyIQHobKBZ7xtxXILShyOi6YHD9WPFHcUnKlVuXFDrc6DpT4f
r5/b1umtDJQD2XEnIdxOy+FVFVqrDdglMnwEMFR3AMMxsmIg5e7FwhPZJTnZ0bev/17gBuR/vi5f
fv/H1z+Wb/70tx/K11fffVe+/t8fXx+1Yd0qG64bhZdlu+WbReP4uugAXzc6OYA+7OiHP77ea1z/
54+vf2g3MGy57cA2ezlkZH99/eqv+4zs9V++bTcwbLjtwDY66UFxD4qf0sYXMyklGnKIglEuMnWC
WeYU5VrBHMoU4FkJHTCiFVGJEWqVj45Ilah/CBS/ivF+PLz9aLiXUW2AfpA3ayFN/zu8Wd5yUize
ndHfnh9vcK4dBoQ/Rm2qyXj0fll6qgzVGobCwcP86jrN4S0MezVlddUqNxpN3vYsP59TuQVPCEwF
x9mLkcpotPYmByp14q4cqiE6UxiiJRakYcrBUCXH9agicX8ger/2bFGfDQFH7q88h+aV3KQpdFXx
oLn4xgXMbV7kOG/8GY832dJme0JOfQfH0ThejCbwGIIBTdNNgm7GlxdY8C39T5c+ylevfv/H3//h
228/uivQOe8/vifUtemzL5DVY6onmkzoPRc8WQPTpTinmnjkWU+ZG5JUFNoI66R0MKMmU+kD4cp6
EyOhCsvjdsE4dI8BxN2oBbgaw8Oh3qCqwVK8wbDxM1o+J35euTCqUrfn5eHR1uGdXg+6o3j2Rgld
ekd9bfR0zqf1thf6R/DTm+oTzDv08m8vizc7im3Hm7Ph+dmbc/SqQsP4sbyrvnn9hh1URRttYHh9
/bG8/6TZ4vk6voQz43P4v/e29t7WLz/dTankg4WZ8lFBN9CEQ3er4i5p3Im3JFrjbaZGYBmaEF00
ERl+Ndda8P2pix60ZKXf9Kd505TVh2pbRrZs2fNdlqw8WN24w5DB2UVP1fk395z/aV76dtGCnTbs
1+ma9Vq7HoXdslynaGXwptV1pcm6676GtTpd2KrTylLVt9xpqvYparF0HdffR7H8Porq+7jFr28G
H8JVVVytTCjHOuLN03Ey/ukW/Qjz4sr9UsehVo7mZmAC3F6eWWYP7bckoPSeir3f3153SZ38kYlB
+UcG/PTjgv1PRpp8M3nbkyZ/tk+apEmmSuXkSEY+TmOCiFmzzKxVzEauoA+RMaqTcUZ1CsJQrox3
nCV4BrUhTWaUP7iHVVmqbrew/urGb1Ka45bE98Ofr4ajcnPiZ5iE+dHxZrjP4Kh4DRJc4TXFX9NV
mr515Q3Fn6GvlhsmVcerBqvu15qt5Nhq/JANoNdXbvhz2fb7BI2Xez1u/N7tHOy37u1kEssB/j5B
2+W7SuBWYy07bbRW9b1qs5Rgu+FDxvkfbnozrb/Yv0+H793453Kwf72d/ezGu0b7l8nttBzgq0u3
+AJep/nVsN1YFx0vmlt03my2EmKr8d5Z0ztrnlJUGHU2a8Mwk59xLzKsV5wgyQqnDPNBJ2eDgEdJ
ShSeOYFEp6RX8MChlKdMO9sAq58rS388XTnk2c69sDRKWCcZXtiCKgruKT9uuPbXmup3xXo9+xQw
jhLvIhMUJFfW8ChgdADRPKEhaqU0QDVhqSJYu5ZITbk3NjulmAS458hjdsUeUKmtDbJSo56316gu
t8rW/5SRMAPXz9XquM3WGFX3lCcv1+MVodyHLQXS4CxrFEAsyxhukc+elZRu1FTMbUwildv5SYG8
Z+Wd0ArDih0GD1bEZaa6nmJFSnX+ScgwzqoRo7vlDIeNr8indr5jfBvnPz6HyNlRCT/9EUpxlKqX
gIfi0S6Bjy6PzntCjx5J9k+4feI+tA+cZakCQEpPkDAAxkWTUCbAxKaUtU6JByONy5pR411OgkXN
FPNK2a5KrzeMe0XzdFLm/C9B5AgPsJKjH8+ekfP6AnhXY8P0DkkCXjZLpS9d4uWlm5mq6Dqrz9GN
HbUdbdVPyvJMX2e9NwxfuGHgzkmWpKM6S8qiC96zwKnISWawFcGDheCJEQej807DujJwYQOhBhAy
87JdmfW71X9V92NhAbYNwPKahdquSqNv2YDNZIYNM7CVz7BuCabbtqB4RJF1LAdSjMESwOKwIkie
Yd5COQlVYY1JSYTSuGRPAK3vrp938UO585XixR+u3LTLiLI/TyaXo1bcHx1xnpSEbi26dR1RrbRm
efnpp3eE9GQn/cPkiQZeSOoclokKjCbunbfSEuWxgmikQRDBhGUwUCEtIEuirHY6sWBgVNLFYLup
gb7DCjbDyrBy0j//tXpohCt8LMAF67ixOny1lcpaPhHC1b015a7OwtV5Wb3qE9VV7wvH9Ubgk1Ge
UJlwuzsASgxSM1hBWmFF9C6YZLSVVBOlcmCEE8ElsyEqrU0SsP4UPqdWheN2qfkS29WaPt2p69Od
2r4jz7VW+K+3yrVtXbtS+3X8CLCAHHVQk21aj3UzEbbKTWiTDkvtTvyY3s2x3YvrYdcVMQbypGCk
9EbqqqbD8QFlyrBIWOVhZaSb3fClU7hyE+vjA6qP1TXUVn7mbkRceq9rpzXdJaZoIeaywZUjnPZ7
7T12fZqPLRuyt8E5Q4XlME3aemcCScYGi9KL5A1VmoQsnDU+xhBcYJlp7n32/IFSzN/d6xvdsLuN
tLfNUml1ksDigtpNssqsW5y+xlNVnc7Nk6WjJL47QYb7dd59vG2T5y++K35X/KWo7il+V4UxlxcW
p8VftoleXribmzSOA2j8eDsuALcfewKYHhQ/vcIcICdRmmdllEohGwYwmGntZeTOwpwqJQwLXjJA
zxhZQDPPzGgYrmUuq31AMaLOh61Js5BbXVLjbmtSn95tTcqTD1qTJaVgaUC+uc+WLOH0ph3ZCoYo
7ciBgQ31NC0LfmDyA0xZ+f7nNV7qjfzf/SA2o/e4aDvmo8aIgwoS6xLQ0Qpinz+Oee+gom2IKM8/
ci7AWY2zW/Srfs05AWP40+2TAj7jFNvIqAHEaLTmLjmbI4P3SRobCTfWqhBhVIlKKrMW1BKYcEqY
kxGaiKFVUgBj94RSzd/fpI4X8VXcVGVs1PHHDxOqF9dHok3MeWcRVeh4qCpTlrXYHz38X53JGc6G
ZYhHSL3h+XxBJkBHk5TwBoU2MTgvVUqYnxRFZjkQTk2UWUrlJOHWUC1Ctlw7qqXhop3hkXfTm/x1
OP5goZtbkYDkAB9YJ6mPGDpZwa2HJGOfBpBVuNB2OnOsdxT2jsKnmSzgmfUqK0sFzR7roWUSmPfG
0CgkU9JKoZXy3HPOyrqazCrCNRHw1pGDHIUL6zpw0+lJMZq8PSmuhpdXC6fd2ysQFQ8XvyuPN9xz
18OIy3s49bwY4DlYcsOn4+Krrwq25vKDps/g6pIZAN/jxeebG9xlA0ty6GpLrHnv7+68FUV4WYrz
fP327V107KS8dM1luGy4dxz2jsMvPz5TZE7BxggSYxTOK4LzlhkPQlgSiJJU08BDplQFKol03Prs
NLWJwuXtuEwWlgUNS2VXlnvclWkZoPZ+U2yce9C+fA0XbJJL7zQzO4iml6bm62J9B36tkd/d28aa
zdlsZ+dO/tL0fL1ZCG/Zz9fFQVv6C1fjgnWworQufaylK3I6mZd7/dCfe7+ny3F3WtUkxouqmnGd
dNZxJRT482kVnBnSpwrP7KwIX9uA1Djvg0J7vPxEawlLarRRIiWTQFrDhOVU+GykUDzAEywIH7Ik
ynLuYX41EzAgar1OGYC2OKSW8JbpawaCLgvR31ECb0HYtW/pu2V79ZvnFU3g+eaG91rF+h669tD1
C1V8RaKlkSkqKSh1UFbB2GhMFsAqiUnDCWODtM64CFiWck6QapqkjJWMtdsXut6l5Itd40opf/rN
T78pGnvWO/W8sVldavnLUsub+9K7Nby5Fb2p4ftjw7oKXplpv+KaA+Qdrio2OhgpiB3Tu6Iab7M4
SpvwT7Y7fQgDBib5Yn41TV1uG9FtPyjZdkXuDaZIJ/RxdlMCKreOmBaOZNmFVKfbU3W6PVenvMVs
rV3cI88eeT6hB1CMkhGuGY+REQdTlIJ0VgQprMouC8Iig74Be3pipabKq0CV5oIHLY133aQjNa3q
wJ0UvlFir0wQ/eZl4cslf/m2WTxvdu1Go1Tmpbo68xXdHh6vc+Ut/p5b/OKWNc9q44LwqdKTelza
m4VPaBa00D45wRw1wUqflaCBcpep5V6GwIxUDJaqLPikZNREBsJyhjn13Ea5N9vThuL7k/U6eqX/
slT+41KVqw+btfaaJqBxonJ/Voagvt0/cLtfu33T69k0C0UT8VYFnRdnW0VYlr7OhZ8T2aJwJpAl
zQOu3ROp7k5UmqYL9IuC0pWv77uMNjitwg1Om1RRp3WKzNYWut0fiZUNY6unutEyWzTcxXY/clSd
Umj7lKmaymo7XkK2EnnZGFs12ImopGLM4ji7opxvi1MDk2G2ZdZtZF5vrdmRWRO+qyCs7p985VUf
5gH1MZvuH36f38NPMsoNl1xqHolgycI4ArK7RO9oEEw5qgAgw9B51pkqxjh8EtIaD9c2MPE+1pvv
joG/du8uZp2y3Z+dlRx3rOa642XYE9tmjeOPixA/OVAufKLUHHwlzeBBgnXjajg7Y/VMla9o2pHZ
8EDZmOnta29fn3S8hg5CqggNEpgXb6xMjoDNZUJTraKCNYaG6YpUZJgFE0nCFFK42SSbmGgX/M93
VwQYuXmawh/LbXa4JHk/Qp/x9IN6dFuASk7FCyrJ6l8nVQfFARJRJl8o1ZCIfhCJaAu3LZP0BWcN
kfp4296L+0QtqgXLCPg0yMgj2EtnM9cwV9ZFMKkyBaqskMxzqjjzPgrLpYerE0tcUO0Opy7dbU8H
05NiGXm7vGSK1xQvC148K/gLKqiEN1P4uVpztq5f37tde7frE6iVREkIxnKWsLooZkNq0M8YeXaa
Oyu9klZZa5PjhLMcoI/oeYIVKPLtq33drndq69Vig39d+V4W7Fmlqc+mz67WtvLv0tJ9fZ9lPbqq
jWJhGhzgt2rffiHafp5QLnZivV8mI8AhF+HWd7ll32bJp7sASy0yo0wX/bVDhz326rHX0yRFYtox
wSSxVgZlvYvcOgYoy7kgvabZJm6zMdGhFxFGleBtgkE7LEukZTc76A0bNxgtEFd1EHMOAFyVP/1u
dg+rnuDyiFGtlLBaESzsAIMgmUuVYT3kMo2MA3JIiZmkQTNtVMg95CiALcU43LB3gtCmEpY4aYcS
NvFTdfpxuKluukJK0OmeKGl3Csz3E9yJ/3E6hL/sUZdASRyQ4q0/iJepBXTj3RTifbwAp7RHVj2y
epJmm3FAT0a7FGFo0jrrlRWOJglyiBi9yDwZw0z0MLiUXMqwcNYhSBaFV0IfkkW+bg0H3zdoJodw
FgkfGwGDtS0/pTvDCaGVi5I5juw4Nvgeid0w6fIYng3LT2wz6xxviJO34+1m6qPlrQzaWG9scWSr
wVrmWpDny6Z6RNgjwi/etAiwJd4lkZxwSjsYgZEwO0R4yjOHIcOaTYIhoSIz5zVxlmZCMrPROgpg
cV9EuGVG/rKWQQMa+k3ROLRmS5Zs6pU5me4yKF/vPDxYMyoNm1Knmm/etLArd50YbNmWDdOyo927
zMvXj8n6CZPb8bxKCa+ZKKsISYS+6X9uhwsH4rye6Blc6+ZFcOPCJ8xluk6xeDucXzW44HfdtyeA
NjsBdCUSft9YvajzKvOYRn70kWNzytT1Fp1S0lmvbWooUfmr5o0b90yVn7HvwJsQfKIwk5wRmDfl
Miyhg0gwEh5lUkJopz0hIkeF/XivGCeMYKiKy+2CVXaHcl+m+cV8Mneji4aNAfuFf9SzDxqzIj4y
G5s8wFfQicWj6oC1uhH9Wr1fqz/NtToAag3/KUpgQojhhsrslWEaa8PDaJjmgtistfQw20HhzAVN
GWfBsUjuX6u/ivG+xfq99nFwfVKMF2v3H5HS/YxsprcD3AZYe755+Lo6vJP5ojrXWOXj+TebTW7Q
X5RJ85gwX5QXv9wmyCiFPBuen705X1/pLzOahrBkeNP6rrIzeu9tw83bttjm1q+HdzjG8tNp+QkX
AfCxPLq20/Tj2fX52fgQNrou0Nh/Ii3APXCsKj9acgdMbsvio+VX2YOxz6dEd+BaKhYEF8qLRG10
TBBusTAEfKQxcyNMUkp4pJiULkXvnCA4k44mve+y/SGDMq5TCH+a//hylzl5vsuYlAeru3acWjRY
nXyz3tjq5E9zNAEvX1YWBF6bp0CcSjtfktXBymh882a/C6FJuvvKYdG8dJEbuXkVvJ6WJuE5vPvq
KzQH8Lm+9C5r0GbPa7Xwv5nMZkM/SsXym8GjozS+nF8V42J2G64qN0By8K7MrYTb07v5ik9uVlxO
sVzcFC8c45RCU+gPmBTzt8OQFnfdTNMvw8ntbHmnB/swSrPZ9n3X+/kQBLkjafNmhCFZo7XK6t0W
v8AiZmQrg+WsKsfWsibGZsM7GzkkBfJeWuuzJdl+W5lXje5q4QCBj6YpHp0URx76xFf4+0rjo23J
j96n0Wjy9qiN3JttbzfR5xP1+URPcO2hLc8hJWVUUNkYEbNTNippkiMpOKozAAHpwLAyaWDWCPUO
8IOlkaq0Cs7cy0Ujdudrlin2Fzx2aLTVtjPm8a6Js7Ozo2doNHb/wvzGD3oeL3jyEpx/EBcZP8Bp
d/efxT2jue/UfbP8ZTd5/kEihdjBOl8LvRzznZ/Pe+dl77x8mtEAzMgcPefS6ky9koQZpECD0SjN
MoeZJNGqGJRA+l0N8yeis4ITgAOc825CuBcQonRYnhSThfNwcbx0XaKqVmXaJ6OGA6F2N6wdHNcH
p5O3q4OT4/M+BryP+Hl6Om6EjzpYy5Bv1zOnhdUwsICzkyj3nhDjknCMC6sSMTI6Qcs9XbADLIV9
XYcNLR6fTOrQnjUVLrrQYWx1VW1hY+mxhz/tMo3LErRwmNcFFJA/dzi+rNxlC0eXmyG62dOndUed
RQzeuajYeruMh6njhOCrBtW6vgbR24SMdJIidzSCL+TWXbYJVumm47eTaZy16LXPz+vB3dM0/ERL
poUjWlmqMKMH+iTEqxRz5C4QFTEUNDo4mHy21mpAfZ5pToOmztvDuRGaBhBZ1JfbwuUWU7EsEbbc
FcJrGluvi8uq12VJsNr8l0d7CNdDuC+flFZh4yYxC92KJGw2zAevvbfJZek0ZzHAxRQk0dGQKOGY
dUh0kokRcl8It0tfEW8t9LDcM93U1um6Sq90tYHUNlR1D5hWBz6XjTXqHVSFsFpUMxDyY7EMInmf
PCkk1n+GV46EeYTU5KiH8sNS203NVwMCKfjh8COQ/JTs3BNVLSgeugl9rqvRIqUsReZbWlEOMouy
bsnXpvgCN7/mGOk8mrg+SvrzNc00JJmDCDZowp1TjtjohaDKRsEzrKNp0gYkQb+ZoxKEUQzW25Ja
ajPVsd0W3O4EZu/8+9FkPHTjixlMzjRNJ5N5t9HR+6cNv0BaWIx9JFQZru1HJoChLwQVjHKJeJcT
2wkfqm0z/r6kSr/gfJq20ANGzT7ESJzijhKTNIVBwJushU/MCSEMNY5S7rnilivhRAiZSS492UXi
tX8xv502cFDFzDXyl+sguo0CfTVKrcOHLwHF1td9VbAXi6MMDl+uFqFVzdtLbOqSNdoaN+++XB2v
7m98xvRCbG98XCzTk2tBLvtVbb+q/fL5oyIovuWWSJUZsRQjlakTRFhLKXRvkNggZRsdPMulltHo
5AwDy6E0ddzvu6p9wDQsk5LrQ2Vyws7M5FWa8MpEfAUGYnV4aSO+XiuNPajNxHqrK0sBhmIthbhq
Z/3Qylx8tco3XtiLr/dfW1c7LdegMLjlUU1IgTMyK25neAjDfldTVlwngDZxz8X27tKBo5tO04F/
/OP3r4s//e2HAt88cifg8fsPf3j1w7f/+beyf3zbRoBOOH2O/v7qhx+Lv/2p+PE//lj819/+7w/f
//G/i/98XeDhFrLYz3RR/MMtGKh718U3t9N0uqNhfxsv0xwOXLnb2bxfJH9Oi2StBGGwFob5cTYo
UoaZOMKp97AkzoY4k61RwvDIaGI+xiABQsJca6IcbbdI3k1ScOWm12DRQsduvxbFh9gLaZmRmor6
t+yG46uFAMTw5r+OiqW2WBxLoTW3CofPlel56/ul8hMNvINVr3CcOJ55QLPnctI+JZglEIXmQCOX
PDHifHQW2RY4lwTModY0ec0OYfhqWsLBuLk4Ln5XsO1l8W5ur8VJWLyOAZauN1qmAPeL2H4R+8Ur
svNO8ECiMz5zZyzlmsMrI4rCMy7IZOAKqx3gnhicTzxl3K1llDuYD7J3HfstpS1XgKXSfoNKu74g
rDZf1/mzNhR2sENjj9uV8AxuFG6RSapcMy7aK2ZVQc/xKd1v1SjJPdFz/+gQqw2w3KMpUx9ZVfsR
N2xXB035Pzs+IK2kk73Qx8rZap/mUwpqHkeu00PEHiI+ofA9b7SzBPdMjE1GR6UdjI4xobwNVhgL
kxVkZDqIzD0HwUyU0iouJAlGdxW+94/B/PbmpHi3AIpVZM5a7F4aJYzMgesaABGeTXj85cvi3Qab
yqKF6nUzrK882mPHHjt++fulOjOcOkl95I6AtnNjVCIkcsW0U8JJa7OPmRBY96mcODOKk8xoTFYp
0y6sb6XHyxLuC0UkiwMbyrxWBB5ZWxcKvVFIfrdST7fVujiMA3USQridLhlP3HhFaIJxgSDyvkym
cncy+3A8S9P5Rd1ql9GBRz9UFBZ/Lmkx4M3vRy78vM2PcdSG6vQMroam6qbDWvuh2UknBB/VGWz2
jfvF7RC9TkhpNYDFPdDqqv3GwbqrTgZw5W5u3mOjMxd3iD9yt5dXrYSv7oAGly0vj1Rd9Ni1x65P
spyf41ozZa2x1OuEU2e1i5GIwKO1IaqoMnRok6IUHnNCG8cDy0ZRrb0I3eQVr1vzAVJLnSyeGMva
nEh997I4+6V+9pWPkvIgfv4FPw3qW/DeeZ9F3GPVp6jRSiQvedBYcBfGIlhONCcH/WdvQIWhI5a8
T6j2xitGqfQhWZE0Vyo04pwfwKq7dHalsggpH6GxjUyUdX65PZyclUBNrOkTdJTWs4XLSlTY9p7w
k9/j8hyO5+my05LsNfFbSaR/UtAXrAX5GuuSzu78Izsoy6ScFxU3n3xBHznsXx+x/mxYendC6jNH
PluLmlkISSfhrYMJBJTkTfZZSUsNiYIJn6WgjCmSo7YcBspU5nAVjSIyQtpljkh1j8H5+3R4nWbI
+NplnJ78yDamze6H6KbDFj32dYL7xeBTdXMKLSUBw0YoFm8Hcwe9OMWTSshKIG0OJMAgPXEgjYMr
gk8gmg+KSpp9VxsZDTO3CnsJ8+n6XgacbrLQrG9o4MlvtunkwwRme3yb1jnxGzzXgEDg1h2k+Njg
v9fU+Ds45z2Y8J9Xh3cw06P8z19ubqHMp/2itF+UfvlRdEQKjnR03sJgtIkywrRByz5GHAYz1OZs
EwkM0FTUWRolI4k2OwXGhbTbQNm0H9OmBVnbQtmyIdM7rMj0DjsyvceSVIZkumVKBrUtOa6NyfQu
czLdNCjTO0zK9G6j8pjdmwaBPc5k/XnWoJNfVKgbT8an43QJf2S/LC7bc129OwFl9tbd1AUNPmzV
KNYCEQ4q7oXjTqDoFjcubRGYPqAaI3eOuwLFW5PSblbKaVmblx4v93j5CbH9JKU9FzQLy6zNSmC2
CEsxUe5MjFlmJ7lSQkoeqQ0kSs65C9FxSUXWspvNk6bNHLiTwi+5u9I1llp1NUcrvPXVW4/sP3Cy
3yDpsejT09oQHLYnTPBaeWO9EiwKFaC7TBynLhrqKQiiozJMCJc0TAQ1KWfvstk7m3lDL/2Comuh
lSXraqmU+G6pk40tkPKuVnsg2GcxfztZQLY9wZi9i3preD3837TY4+kSkQ0GWJbn+KQYoMMfX2Hl
bfGVllhrKxJ5MMAiOHgBb1yIrxobOm4BXJYtibqlRde67rqLgGtsVGCjWL6nFhsar3qjdNcAscRP
LdbySoavBptqNcJFU3LR1LJ3U/feyRh5/d01JpTSRXds1xhNPdWycWX5Z2CxqVZjXDSlFk0te7d1
7z0u7XHpkywIHUm2TOtMpSVGU5ql9IrIrLEeNPxKylqpZOCMwgwSxVk5jTkH71hXuHTr8TFA9bmY
396A5V68ZQuwCmqIT0AMDB0M6hdooQK0pW8F36F75X+HN4O6Ebz/uDq7OrK8Zldvx8c96O1B7xN0
wApvJLOamgwic2eZ95jxyD0PXkDbmRFprBSRME3hCutsxi2gkLzmZu/aAnsrfemybCp99Xs/la8d
nm30ftFhBayh45YplIuBlQ7SyvmJOLuUek+YrXanT47T22s3vihdrR0ibP6R6W5a5F5S3U2Vsf2j
CGiPBXss+DQrT6YYubQxOaE8lzQ5FYnx2qnAdRI8Ce+VZkKxrF3S2TtpmOCGJ4q0uO7wPf2mfdtg
sVjUmR9vln6v7fQ62SIrnm00VubCI9Xa5lHWc1r0qO4JFJv3WEyWOxdstNZBNxk3Fqxx2bNoNXRO
bQSlDlRSRbPRIIqQ0dEcg4t7b6tvqnBdLH2XDi9LrjcJLpafHqnCraqvY2n1srGfbhl8fTBb459n
1fu3w9Fo6K5na/vae4K33XmIcfjLcIZ/Ch/CR4r8DFWtcrvtSpOLEuG8jdeMlXex9bsO4ZVgVS11
LAawLaNa1DAXj5JRdCNjuX0PQnD0FJqdM6kXs7y/lKIUUZWsGT247MHlk4yMd9YbBcOTFoZFYFo4
N9ZYRWEqMZiLWGWIDzI5gu8zsUxGa7R3zKaHwOW+jsYtG7y/oxHuoMVXX2F2EFvk1NOT6mPvRuwB
Z6/wGxHiAfClVNGVIS0pEBo4QkkL60gYmogZVpJOCckVi87kKBxMKKcUhm0c3ZtEbW+V3nIjPlqj
D3UQ3qQpdHddXDtAofBrGNxoOY5icoO1TPGdC9NJGUa5dCO2cSHurl86uxkNYRxvJxc3btopBi3z
8hZIU1TpeXDk/ICa74NFm1jWfb3V427oIxzyOvglt8YOCgnWRtxFe2UZ+kWLHYl6g82VhBTzkp4C
f03w13hbaNFK6K2WS/EXbfeYtcesT7SYhUgySAfok2TmqfUpcGsIlUTFmBVlmIdAhYPD1BuhkuVE
ZxtEyJQSyTsK2ly32GX6PNjE71YotQeWPbB8Quy8OnpHtYnZeBO09EwJBRATpip50FUBQDNqIbXz
nlscvdeCcM+kMyDM3gxr9+jdehJNeeLst9/BU7N6+91vz9uFYmJPy0SZkvZiCDNc7hqXfRdvr0DA
EgiO0vhyfoUJN/gpD6dwMV6zOFLdPava2hMpit3+ysnlhbvscp+ZtsBSinaUQ7P/1nYn7BSszeY2
sT226rHVEy0UFmzMAKVccIYTR1NgNCRCdWTRmBQi5RzdgkJRnSVnIrsM9j0wD11yc0ixhNqyDa7w
d2OXufxc/G4tazu9G84Hx4tqCcuLvnm5VlUhlgdf1iefFZS8kDsrLCwuZLSkay8/4QYW3CPWHipx
3fa2xnMfjZcGJ6hnpPl8Ob6sS0JgOB9XgkLTPHnvLBbeE1ba5KGbELgmLFMhhdMBx0yE9M7hKmdv
N9yGTiFEWmnLInf5p3mtT/hhS53K7d/dulRdXyc2Ny7a1KNnopkVs6FErcofOBzS0azAlofj+sP7
5PbNlFG7i9QjPrsoAV+nTLRbfiz4lfBXxl+XS4fRsORfxV8/l9Sm+Ov6DidSC0fdWS1BXPb2pmq5
9CT5pTRXy57HDR9ZXko2Ojo/75KbbOEvVOW+LaaB1CUN0K+I2TVlefrDRk7LTnTdMMdhsUWlhLIf
UXsvVdU9O/8w3L3w+ofy1/Pn+PLt7//6Gl9f/5/vDnJqnjU7+sOy5fLbW/ZbdVl21RPk9pD2ieZ4
G4aVDaP2PEqVuFDCOacZg6EBrgV8q2jiRNooLLWeMikoFsKV3hOdVzX3DnMXrh4wg9cnxWyebnpH
Ye8ofJq5bdyVpUmNSsF6Y4izhGlEvooEmEoXCBbfI0FSb4PQjhEjWOBeGqst3xf67tS4dRfh2euz
4W9/i6fON8l/yusf5y9cEuSmX9L0fRnOWG+C7wlRdxNIIvydghbcTrPDod769GkoJNfIGB+PlNoU
M2Xio9NWrg2yR0w9YnpCqYaJRpWipVILr2yO3KQsg7BMOcsSt1lzI33UUgWhnE8++kgsCBUyh0k/
PONkh60bjBaA6bvXr4qXhSyeFYMR/BqtR/LB2R5G9TDqy4dRXjOD3IsxM+80zcz4oCX3ltjMZPDw
k3PUhnkSPWMqS0qEVDCPiSqzP4y6QxVLJFWpomioYjMGb00V22SA1H0WdaeFA3RU8f5j93uiqDv4
CeFLnKaL151WpmdtwFMXSKaFJ4zLj5wbbMSvms9/3G+bfMa5sFFkqjwHIJIpDcQZFb3wjgnEKCEJ
sHLQLeVJwR1cuhgkkzD2FL3y0EYbIn9ldloQtFIXgGCmSA32adL9+cfO9+8mCKPNGpP1Cf/98uuJ
pmgYIqXLzGnuI41O5GhVSERHTzgBExhAEKesk8RGn5QFibKSggQZQKAH4ltfxXjfymvNuq2S/WtE
pzD7F9FenfULv/rFVr/Y+vKLLDLPJQeFS9HYRKzn0ThtPIALQjXnlnoDk+qCz1EowVU0QTCSdEzS
M2f3XWxtaV+xlnw/2NS/5/jrkVn2R/OrArtql0S/m2jUzcJweFE+xDtEREevWpSIVZ2sc45+aNGl
6aSY0tHrNl3yX/PiajKN/eLq86VVJsbn5ETCILNMYPVk4JMnytEQMVZfwpJKqMBMzJoEE1wixvmo
CY8upNxqcaV3U6nNbq8vEkzDBUhZvQF7ld51GZRVxR2VYUbIJnFSmK04HNViKdaJPwfjkEqSC10G
I7E6aslUoVAl68WWkG12s5jqRMrG1B2S20hZv7br13ZPk2+DOMqVzS6bGCIMiWusS2lgnpyRRgHK
1FER7pMX3IGdVYAuRWSe6sBz0Idvrd1hYQduOj0pVuRuZZ2l8i3csF62rRElAUZqjPw566XboKmz
4Xnx7wXbVWwN23v+sr5obXU5a/rT+tVkv5r8UvfXcwZUJbwzKkAblnnCuKZGuegDF8G7oJlkUfIY
hXHBSZ0iOratM1yuqFAfTJW8R9VxbVkswqGGzapqlb6vFVlb0/jxCavXpQ2VH2zo/HGxfsmW4q86
36X8+9c8W65nsfVJxpir8bLcmZtXn28msyHesGeOgN7NFFfO4N8nb0FzPuH2oVQfeQPRgLp1En3V
Jt6rB4g9QHyaYR0U5EvZRmVchnV3TtbQRCxJQlDnhXDe6Zi5JM4HEQxcF4zlKiMbqDcdsP2um7nV
FsB9OBBW0uPSGdnAem8wD6x4VgxXh6omyucAnH62/tNDwR4KPr3kFCuSoMpZJ6nRyuRkYK0npFJG
B6Wgm4h5Kgzk8IGwEJKSRlMvLZGUCbkvFNxW6mID731d3IH46Mn4Od1AfKVuPxt+vXawqd2DN8/q
/46/3oH0vi66wHp5mOdXAO7eVqVuK9aNcQ0BHfTlRu3KqOnd5GxwxfQivZtPXeg0PRTN5tEPbobp
l4zW9cKO/p+bwt8HHlrU/Tr6yxAzQqk9Pm+RIMho7VO03SQ2ltK+dpgQytVC2FfvUy2sXAj72o2u
HaYlCtlKXiT3ZRJv61Le25gSEqlRsZrfcXRjtxwGyvytezuZYJasVK1kXpASS9XnV/aI9Yk+wih3
8ExyJOgIrfjkVaJRMxusYF5nmaFprlnknnubnaPOJME1D4w4o83hiLVpnytuUEzBWqcLPoNDZ6es
yvOC9/h8W1667oaEG3rs2WPPLz+oxROVko066qwNC84lrb0UIfuADSrluPIRwKYwLFnrufYE1ple
qey02Jux7U71bFD/VupJ71LPLph9r0voiMIs0jGLWqgyvGEKF5SZm8jYVhL6wrVhMo37YsfdWZu/
TEYAVC7C+xH6Xqdd0raRzS3YNvG1UpMXWpLlP9ZNRPHjJWKSvuCMfGiJ2uyaS8JeKNEQSfQgrwd5
T5REg4Lc0cG0iRjhCcECy5Emop0xmgLO09klakMCvGcpp8ZiCKSlmlOqSEecuxvGdDA9Ka4WMK86
B48S/oIKitmh0/rnqufZ6OHdEywtpgCzSRiW05RwaxQTWTMPqzHtOFHGcIB2McSciTGeWkkcLNMc
4zopayzbF95tK+XVAttVp15WGvlsCv9drUG56vzj4pdrfa+yQuu+90Rq+o5CYGF+AXM47xSl/fPo
D8M0nbri/6VLd/TbgmqJbrNRTOPiD/DXMk2jER42pPTzlZf+GVqcvsejCi/+Ox5NxR8m7/CQJf/a
wjS6BahpJdB21x1gso8yJabVlHxxw7ethn/fOHuc2+PcJ/TQjEYQZiLVgFqT0QKArPUpWa00kzlZ
LhNznEaHg6bJZYZECwB9PdwkVFf10JaPogG+bwRmVjoHMPefP6f3vy1KXS6dJvDxpP6IvKhw1wt4
el7PBscYn1Wd+N3LYvyvHg33aPgJJrdE5kR2JopIvLVMGqaIhMVqNl7xTLwCHU4wscJJA5OZqEyK
ZljRwvoWZNi/7tmG6o5rMLyuuCu9HawU9/g+zQXFbVAo11raDjmjUEigPCyPuen7wjv4Oy/gfNnL
vp7O3bwIYXI7xqFPZ/MPU0u3ZO/VJwUWbsWdW0paVHvl3RSiLdNzynqzKABtIQDrplov5izJBY/x
oCwDDG9byPHrZmeZDcvtwJD6PMLPl78ALGkkIK73ihmZoHEjBUxoNsrKHEnKRHjAUDqL5ASRnuiQ
OHVWGDjl2+UR7k5IHs4wg/oipuAuwdSNPg1PC+uEp0W32NbR8mMTZXLdE2X2q8WnSmUsmXDGMa8o
yJ6sstn7iC0bpUAZOQjCkveYQO0s4ZYTmjPLKRFhTb5/tfj61t+3SNw0cVtkLaImi8DIbI6v/UKv
X+h9+Qs9YUn01HIlAV9EZSnjWjlqNIdpYoRExyIcYswYFXKgDovsZKsIzLHPe0e17FK/dbaWlf6d
Vvr3WKaW+VWx7KYVW4u5g2Qh/c8tfEdDN7qYJTcNV52Wm8awYw4rFFifcFyzYZEXWLUJXjEHoAMb
Q5I3a7u0SA8b/IgPUFj5dFOTBhdRDOOOQTh8jzHIKDAuM7d5DlR7QXU3gi6K5GBNGySJQFnhVZgq
/niTj8G0llP1NaV7JPc0nxoG6W4Spt4l6pijMlpYvjrHTIYhBMGV54aaZG2ywsIKV3FqlFfcZyqd
9B3wMmwa5UHEcMSTAn2BC2R3M5mtiBky+lrgIypvdeTtFYyqvOgbrEhbtXBcwKiLAfpKyjs2yBrK
a87gnnNM3MbONvgatrvBfxsFFFfC4e/nizTBRchm2cYJnjvuQWgPQr98mpf/n713YW4jOdJF/0of
R2wQlChPvR/yaCK0Xu/GObv2caw37o0bNINRTwkzJEg3wJFkx/z3m1ndALrxIAGypZHF1oMAuqur
sorIrK+qMr/UxBvKKJM+Qneii0Qmbp3nDqwM0dFqriKLgmMAoGYRmqbcEpM9/CPhYIaHB4xG3Tcb
dd9w/Dt+35YX77EdK9PxeoP1YZftqO+xHvWm/ajvsyD9qMG1CTkuKU8ZFujGyukbPcsBVTdZvV1d
u0+V/1Tdzaezd53xbB88EGfvJoxwV1egudO/DUqKuMyheESYGo79gOkb8ecRrZdv2fDZIx/f/xHZ
jsj2+UxFjlvlrQ06Z8tA3qyU8JmzqEWQRjBChczOExakE84nZiMzSWlGrfYmsKcj27UZ3A7Og0kE
J5v19eqHcmGeuqFCXcjaTgfN3DXbvPJPjy4/m0KP4PKbWasGSnnWEhNhZKuJsU6FqDkjSVkqFWbm
opkIF4x2AD1ZYNBSljRqySw7mDNij97WR2puvUd3+/CuzNGP4IQI71P4CYVBTLd0O2m8whuEV2L6
XJ2qpivVTY149kBcx3fH9LmraXSLIVEdZVx8eUCHFCL0V0BynNERvY3obbT1D9p64QxFh+SMpjvE
bDS1DNBctNoGEnPmSnFuDTGGap9T4kwZkhN8ZinTAVIxLo3d+nh5kx+IdOHZIl3fwhp+tr5S/ALX
u5brvQYsurGFiHYcK/iXipKypbBxf13fyxUVWefZ5tYPOx/bxo09kb/7DiokI6AcAeUzNDIBJmSn
NDThLKdchyC4dTo5HiS6tmTjAzNGC61gIQmDa0Ao5aPNOYJZOjhSsGNK9rKNkQ2qsaVB+V3Vu7yy
Kn0OssayTPCh020GWiSq7duXHYVWtb98QzcaXdaxsjN7Ht+Fc3dYmy1mtKeB4A/vE4DguiDhXJed
zPCpcOK68L6K03fTBTrNXqX5HMq4GUJhKOWusAp8qC2ymKerfCBAFrtdwVGepRP4kHufJ+/qlJBb
7OSmfF3wnb9y4Sd8A7/7RTrZOgiHAnfp5Nfdr9wSSv8a8qxHb9+b7cFrro9ofUTr40T6sOc7907w
FGG2VAqm0kgFTJWZBZ0TJSH5EGNI3FDGaKSSAnanWpoUg7c2rlPJ7Ebrf/jbfTi9Z3MnzSlg+2mJ
z3tFYO50V1eTyc/V/3qzOhvDyfhnnIybzZve5LTHqI+n+CMu/kbVmShpZRDCJZdlNpYK5wSTwQTC
PYduBCk0kwSW5ly7EIO0CcbX0YiYmelDcfEO1V1rbkGIvRJvUG9/frNPa3sMG3uU9oCD8z6mhCbL
+X67tbraVF3hx+V2K8DD6ezdgejx60zRzr50ivZhUjoclYCLjDnaR6v5mYJinI1Oe8kFZYYm5hkX
0FzgkRjiXQRLiRsLISahubIk2ugzfCMx6Y0TXh4V/md2xyJf38S7K1eXsajnQ7vfqKUHytkDZIP6
C4cHo3C8RAaXHH3sYpuPcZMohn/hEOrzrgfPQ+N3RB7GMV38uOh8ppQ1VFNKwXLapKOSTJmcYQBD
gGFSNBMDwJTJLLzgwgcnbPCaW61E0sI7FZ5+RLRhbZtUgn86q/68Wnje1aB+i87Sc286wT/tziX4
Yp1U8M+4cUs3Tni2W9i8sumTvnF/XNCOC9pvn/GbZCuczNLSQDBuOSmPzVBLPQwlgRWsDkwrToiF
NW8CEAf2I1qnC5vDwWns7zMIJUJyW11Jc2O3QSi3/rrAo5fJhkE4XVmEdbld9e8yB91gzb3m4JCl
cjkOalzJVy5I793P6FHeDkXVDkWFC6O6XSvf1lNYzjQBndXtei19zAmM3R3iee0+Xl6l2bvFoLGd
5+TirCogE1+RBQdfMS6Rlhu8Iaeh+uII72xMwNJ9dJhgyXPaFbHETSIkFtjMUdKJ7ccHklAWyWST
pYfJ48ds/egYuDmi32fqu6CcY4RlFpJkVlqebGLWMmqU1ikG7QH0CmsstieChVEG2VgkXvEURByG
sHFtbsv27SoP4vo6TEHwYTJBF9mPpwX4flxu2dLlSUspjlurbeGPe8qN5I0jbn1W56qZSMV1ypz6
KACJGkmzUyQHE0xkOnNUcSOtjCQnx7WW0qVAWVbUMeUOxq3balzvUeRNPW4UtDpdOwxtKXO3dKvP
ff+fybqVs9Xjp48jDVmmssHXefVhCoJDjdPru+uqaeFAeLk7IyI281lT2XzpbcmtrUf2hbdu2VOy
+Yx5aUb490wPmxRx0IXMnc+eh6RowXkmOaNjoJgt17sYoHvSGSSflEgBBYIFKG9oGgb+oTmczMBm
L3Hf39Bjtfruu+p6BGwjYHuGq7JsDRVKE6iDO6O4dYDENKcShtE4kbN2QlBOJOPaQGdICplQymJO
0bKDPcpbxQO9W+OuonvffXe96Vw9+dvpo5NO/+3uZjHFbUNMDvjh5ris0lbs3aL7eVBm2vOTP5c7
J+WIlTWnrGfVCe48QqMnR2wwyWEcjlfydPaqjkkJOLAUnDRSCPgvySNHhowE2qP1/LzJ9gCoOC5t
okRgrI0AK6m0R1Ztq42H8TTCJy8B11jOFBVwAT7CKjn5kIg+yoPGyt1OeMhtOf15QOt0BB/hILTZ
9IglHFVfmqh7XLGNK7Znadws5k9iyZEgjctawfKMJ+5dYIHGkBjPSWA0hGQ+RaMBRAZDdAo60UyU
zAMwLTambdKAuOWSDa5M5zd1SUbNLna6pwCi6j/T+qi0J7j/AmXfvKnIhmvKsuLfutvbBHB12t/E
B2kmyyIjOeK4OPz2LQAe1wmmpY+Ucpej9ZoJnjO0xJXJEQYKVo/JMSEFWAXnTZDc88CjpZ4lejA5
4qae19uaTi/2xCF3db1PejhZq/vpmzdki8Rwh77Xh2j8Abv7bQW4vw+VlFCMq6t1f0poxjH84HZ3
zvp3aXH5v2c/X/4e/VqGpi4k+/2n5Zden7Z8hhdPOH2gAwoiy9DQp4wLH3HliCufZ7CeV0Foh6w4
yVEYQh5U8kpT52MoHBaWGMoio9IYQo3nOBSSGqedU0Y9HVf2zGbj87jizIHRuVxSVuz2fZ51QSXe
+3F9b4ruip3atv2jfyhvfrzYQXyzbnrNmdNOJKtbI+4ccee3jzuthJ7QlKAPKhKl0eO5BO764A10
mYigo1U6ew2Q1GZsF1ApDGB2jh+cGWbbDnT5brqWgOwBn7MNXpmd5mC2h+BmwyLsoajZsAr1brtQ
PYqNpjzZODzDpTkK7lqq7QNx6e7A4HzlFos0K24xQ8JS0iRWOUdsytHFeXk+cK7gh4b/pjg+21IQ
fzQOweQYl91lK00j6zbWTZxV2w0M5Atd2sUuiPIT28e8PEwunaObu5y3ZY7pF+0cqqwr7nQWw/0G
60lLfo5iNoB55d5NS8QjfNIlAtIe14kutXgDw1d1lqSzpcbx5Gecoj7rFKUAxUYbqArBCk+5p9Q7
6m1gJmEmCWGti847q5NhEUbWGJdsFFZo69yaVfWwk5/dsdPT2QIjVcrnyxkY1xSLxZ1/hiQGHX1r
dayveCUsZJs967wk7aKmyTSGxkbIVvPLk5gdCypmpg1XabIlY/kSY6KOMg3nK6vSRrk09V0MZNGa
YaBLi4avqql+q9Mb94/oAj41kMAnP968L4xh7tpd4euPN6m8vks39bsd/Gvn7SMow8mPLVfbspJr
V39q7ry/+eDquLrXlL6LUOFRPe0+vf3u4mLcHxn3R55nmLhNXCZHoN7MhaJR+Jx0pkxKTlyiPKMv
pReJa6IJNJaVY8o43KUnOeRhPCX3Ti6TK7CrV2ydwhYVEHfoz2dl+TMrQTDzRTlvK+/pRblRrsHH
5Znd6Go57mo8q/N0ajwT0lorOVRgnFKgs9J7qpLIydgkkvE50qA0U4LDJ2e055ZLqpk52NXyAM2t
n6C7/Q2IVlcfly63yNYEwKyisT+8n2IWsDpVt1B3mwbMwSIIyc2w6EEbE5zsjrYuOx6XfjoDNHM5
T38bMjTmCHfJ3w5CXHaE25T67ZemSmPkt2SEcCOEe57BLoEkHW2OMWgGY4lIDQCdjzpnmqXikjCe
FTTmqAmBwUB7EAoQnQyYNuLpR1ybhm59ajX7fQ0Wn61mgP45V90heD+DOeBlRbtnWc3D+PNFNSl3
q1dVfVp9V/WSB81xr7opBT83J4wR7Y1o7zmgvQhjl4QkwsDoAPKLwaQUkzfJOyIsczCWMlIFIwhm
weBeovdBchYlP5ySdoeiVw1hTqOsK/ac+frDXk2vlsw8zbOTLU0vqr4qtanpVY+pB+8+Dhk2B1Ot
11TTtzbja0jFe6qN8GboowVwcfHeLZaOVnlaA56cwWOAJqfzao6b6m6+vH3lVncPRJK7U8bGaVhc
xnQ7KG/PP07cyWt0IDjx8PqPk1B+Rvz5C/x5XJzx2ZDSnDSFT44RZpCw639QaPwvd7gXyUAYDv8F
XPljkeWXL+t3NR4NjZb/njyuxMusWZYeRsiDZWca1vMhJS6MYwALg7A+GEcA+mUhPEBDGmG60C45
CzDxmKMhTsRe2ofLPwyf1mUjsfPWAQKeJOP2PZ4mbx+MsC1S2y/NaXtPopciPG2FZ9vC0ycQT/Dh
s2rjgfqTu0DHOKhxMT/a8/vteQowSkZoopL2WkcZLaFOOCFhVW99tMrBGt9EppjUCW7E4IhhWkH/
hGb0/sX8X+78Q4QVS0PeeKoWyD6H15umEngLZdLHPUkfV8Uaz9RX5X93SX+VMm4BN9WeTy/OyUVn
KT99975/l170YizK09+/aUSoYAzbR35oL237wTYl37wpj+70gi33m3r6txPArnueaF436YOLlx3e
uXjCvsMQCO9/oxD3QLyyD9704eaurH7KqI/I7quxBNnAaHCmNCUmK4POpiJEmzSgN+IUiZpx65jT
3FGpkcKbWJUpBXtBOD3cL3VL6VudX6t8o/FVh0xjr9q/ArV/hf8qLN/1MN2h+b37u5S/2oyxesgA
bDa6fK5nBnYV2rIFWyXQHDzwYPMKQ7DJMbK2CtWjuUaWDMVusUqq045CXqR6GWyKerz8ZRy446D2
0pBgpNx0FtAcTWfv4KMf9hALMSYlK6BZXFx3Qn09aEqIwWKzHic7e0Iclx5GdNp6vKFDHHYBXXMN
9IM+Qvoj8gvpEdaPsP6ZbtArRakMRpPsaAwWBkhiMnYeMeAMoD68h39KwCAbk2KW3DHvKCMUBj2w
AbJx7DPoE3dWzVpYf1b9tCI+uC2uGmQ7COVix6WHY9cwKK0NQIGpf5MM4Rau4d03TaGXpdC6zA4s
vvHI3mjte+LndgbOnf/YyAg1I774cU/eeCgKEkxxtr9YSlyeXF/dGXbXij7F2yD6jjq2n9mzEtlb
1WYde56/99kWueCNAlzOf7oYT1LHk9Rv35kCRiwKoXlMWsD45Uid05kmZb1yFjN7Kk5ztoJQIY2P
MSutXIjMxJSIOYZT+kBzXE457zPH6wQnOwzzrvwps17ylJ5ZXlW1xyS39xuTsq/wzkbbSOX2mR2m
eFXbfjO8KlIKHWKAO08UMe8zvJ2yG/3b+3D3qa1n7n3iXgN7zPH1kr+7PXJef6Gq5gtVzrGrXN9c
o5Njnn6sFtOStvV9ZxkN9usGH726i/jkcoX5ExRaLjwbX8npvF1wTuE7+tv0W/iK4q+mOnCxuTu2
6AoWLQmVMd6FxeeMJ9o+xOAlymgdYqSewvpRAkMltjVQYOMQ8otHyQ9Nmq+nD/LRfSgxYOOyc1x2
Ps895BhEgO45JDmBQaGUCs8jTYQ4aXN2iUInbQ5OCpczVUJyrmF1KpJNUg+w7OyZduTImtNCoTVn
naSOq9CA+U29SHFy/rF6UX1a58Uoj5WPn5Yf8eC/TiV52pt/R/R9ev76Txf3RguMq5Zx1fKN6nnw
ImTpVcpSCTwaojIobxT6e1MuqdSGhkSo1So6lxUzNMrsLXHeWib5oauWh7S53qfPLw7X5v+B71uj
zMMF/8xvU5jmaYqdc5LSl/mianszbyAy0rg32LdEMR0Ia+2+MxRE5gMC2u1E3eSIg49BonJebfn1
vDrCN+nVIIcv9gkZ1e0IBkcw+CwnCUMMAD5O8PTBB0sF00RJLYKxAoNBvfQyuZS9thYua+K4ss5E
o5OmQcvBciKiUcRtLr+iwUOG0h/eVP51N65nFbDdXNzYxW7v+y+E7z6beo3wbtTcB50CddZaJ88B
unGeXYb3ibKkjeA6FdI6ZuEvDKoQNjMfrXBES42ugcznIzalW930mDpnTU630s++y07r3bK6WFR0
VxH/eL+X7hbnI9LscMp3YrPbm/nl7GZQ8qLi7YgEROgO/aWpgpv9tVfH5NEZxk8ce/yqUBWN7t0j
Bhst+QPhOgpPEzOMhQLLlH3M0DGTBAtEuqSZgJq10YoInTIFIcDux5xgbLkRNPphMFhr/PpJqQsl
BxjZZVbprWQWOANsZrEYaXVGJPasMhgaHRjxIaokmQiEGBiryD2ALKFB9qSRccdSbphKlBpqbICe
MylIFJyLQ5HYpoYWSLWloV2AtlLQLv5q1RPvPQaA3dbT2QJlmS6mP6cl7iocOUew41Bxr4dxncIC
VODuytWX7+rpkAmkCzHskh4RcAqBfxdPOeDVg9LVrmXrE11ePOX8k4lhZNSNMCtX4TKEtKHVbJyF
4T97kqhmxIEjDnyuYduBZMdsdp4nS72E/hmSaFSKUUG8tCxgK5p5xWXgCkSApn0KJiRF3HD+wJvm
d4I/eikqwlX1BouXO+jnhaTg5T3F923esvSxlCMHOeJi4ctZ+tBWjB/PSkunHdDZNFzqfdlrf9pp
f3px2q+2fQRr7x0fbbQzotURrX77yW+UUsSGDAbEeKelzIQTgjHDWsLyMglX0nBTliVR1nsjiI6B
EkpBPL5rx/9+Z9a9tqRacv08bE3agitzsteVtFrzB+03J6siB1uTXqUdY9JnG9prTQ49lcag203v
zTW70OymbHSG9zfzNFvhbuSpdPFHF9AdE4cEK2gOqzsjXzqDW6VxChgPU21UrPpYzQ4E63I/xccf
4df8X2l2+QdocUCU3rL8VFfYAfcunRyOIE92PPN40Huy/GWkcv5fWJ+OEmbziSeIAiIc0/QrejJi
6RFLP0/nJ8mEADCtog/JsRSt8NrKSDwTQRpLifKaGg1/pFEsmRAtwOhstYvGe/10LL1lHSdgU1cU
mBWGnTeXWki9ZsEMd3UNN9fAGUxQ7/Mc3ahetaU/vIeew+PfV7P+7izUXaIv3lQn1cl2UNuylX+B
mWBHKuK2VNv098vie0LOVhK2xXaXKnJjyMPOUlvd3hOmtiy3TlHXjN/68/29e7hX9/dmdy/KgGNT
r+i2QwKa4n5eV/jdzBev4YmXbWsXo8/CuPb41q2yBMsateLRJZGhdm00mOikhYiOZR88EckLbXWO
kaqQJJOwRIlCGR0y2OWj6Eu2be9qF7xrftf75d0se11jVG9Z4bpvh+uuJZ4UU7yRSg/5Rnr2eE9C
vk2ztS8jHxTdtGF7iu6yZ3sLbpq2rYKdYend20OE0jPV9ZaxXh9UPNTxAzv8YEf3drD5BTX2+3Sn
u8pffwO/6d9ssri0hrzqWvKn+bU07LHLVUdLMwsrt7L++HBTxwPXbGr/mg0ZaC9vAo4Bqs6QhytN
amq5zNS1CuGyJSfeMMmqz54iHV+m+HpQOvs4/+EnSdd4Cq3GTu2X7ghyGzWuAsdV4PPEG0lIWNFp
lhnNMkRFWCA8egkDJHkC6UkGLKKT0oGFDFBEWGmE1B5GkYYBiBM3TO3k7Vm14klE3rGzFcfZhJwV
TPL2tBChbwTN9Fd7S8qz8mxnuXE9jVhTuf2yuXtafffdMtdCO9EV0rO351D4Ystzp20O7vXvtExt
2MDL7rIrXZUKv99TX9u3HY9tLet2tTBU0N4Q5In/fQff63sZsm/v6vRqR8X+Lr5LC7jw3t1hvqGR
T/HrYfaI0DHvk+ScysgNT86pRD3jJDgqvCEiauuMYtrCYEovDfMaBpwRqTInRy1I9tiCFlBOOubg
tG8PXqE9qLctQn2PTagPsQr1frtQ32MZ6ns1t77HOtT77cOrzUdb4oyHW+pZiUfme2hZT3P5UDI0
rH9RJQ1Ee6bShgoWb6cmkPGIZOWcmr1eTz/fXAE+HBCKmyNcr80Q+FV84XwMR1CHj3nARgT8TMke
GFTmibBCxuSDtzZp5XyCaS0oTnIymeukg3E0axWMQi7hQCkOB9F2II7BxrhN5kvkC9eKiq7PPKb9
JGCdc/3CH9z1E/qx6m38b5BGzTf5+37CkHOoA3d9ftzaLlqKgWf3y49nUPYF1Pmi+ul0012oFPhn
36r/ys4ARrvxFXoJBSEYNAmrZmeDIdYyGCwjBYUxQo8gYqHDPCoVNKWEM+ZwIFTIgUpOxTFeQo11
qFB1q85m+1I1SXeDnu5hG2+tRG/j9sdqY9t521RsbRD3rMWu/eWHDMaq7AY6XT06SNBjO2QFmIY7
fwOA+AOStzUgtWV9m0+hhcOAKaP7d4tjur66GdK1h5Y/x3iyUMaFVFKAnMN40jxGgOEa5/CHMvxz
/CBo9F0A6Yk1entE/unyicG3cEwk9tXOApSGwEWI0QXtSOTGWsm0dC5Iabxl8E1WwpkQCA8CXnLi
Hr5whFERXKT6qERijO0Lyp6WwbiezgalgcTDIH5WMd4SDGKwjUVqQHiPH8oN1oa7FP7AI6KZMfaa
0iHJEpt/Yvlvdcp2THT3+UAUlN1jKrMMWmqJGnG4DI7cMXLRkY5xXKE/1+jvLIl0MqVsvbQ6ewPd
cdFnsLzO6GR5FsQzpbhDT/3Mg+d4nCW848Y/sEL/w98eiPle2dZ+4DdcuAQtLZuty1vrO6vd4PNp
A8TPGlydZmA5ardI7RO4q/xj9b/eLKvrczGuaxoDb8Yl9bfvkkyoB/jEQrDRG6KMjY47qAiuatBx
rTQj1hHLTGB4HiWY4DokmsAqBKuPCBPfVur6HrWuH6vYbzqKXT+o2ocex2DG7eY4ZtmT+fJgBqpt
lr+IH9qY8zUx44FL3d2R5xiqdJMv3dUi1TPo6JAsQJMGKTWU1oiRuDg9HBxNBD5lTodAbpNelPkx
QqAr0jAidOPaj5UCg837QzGCxREsPiO6xqwy41oIyrjSGlbhWXGTnDA0SBiiGCOjykdlNA8wxyjj
fMIIF+58JJY8/Thny05OUHUuF3e3V2kJHqEMXR/SwCe2EQQeP55hCon+zLJdT+uXAMXRL3jjXKc0
8vIN1nOvX1FpvluunaImWMFZuT0Gfo/48xnQFHHOkwyKay6sTFBDip45DShUh5yDlywyz6L1OsIy
FJBn9kpZKywCU3Pwkc4DFqIAxdZCkNUntv50oIVYO+6v7MPqtKZrG7o0lL0SrFdiaRWKWTg9mxS7
cHqcN1H6uKhdaGK42zOY1ShUoCzTFsliDw49mNkdev0uLS7/CBj7L/ANqwfFquoL++SzL+w1JEZG
yhFmjlPF/VMFi8FGw601UvgQhBHUeW11SsopHpRNMruYAVAqxZULiQdNoYMRWSwBdj4dZm4YuHVa
TmS1QzdXsR1lO1t5yMJkMlvDzY99kpDiXt95epGuMY8eppf52MOd5cYP1WZ0sAfz/NO9kLORAHdY
4B0sWKHFrf5Ur0r9p6ebPqyjc9GIRL/1VSwPhFBpoU9UhBw4tTwErm1WsKKFlqiB1qPANJqcah+M
IqlYF66QY/NQJLrLiNR9M8Jf7wj1nP2u422PtqTqeh31zMnSmtS77cnvNlzs1yal3mVUHvJ/7xuW
3XZlZViqbf/43z3N+ajdfV2ny5k3rVYfkJOoQN7pvEpw8Qof7PvMH4h39U68G96n8NPldH4zD4DY
h8W7Z5t+85vpdI6AqCXr2BAwVW3Hez5BLEyf9FmkoltXGHn8aI0gewTZz2gWZOhXGzVn2blAoHWf
WIrCIak7dCHzEAnnBuZBmYUA0E285Ixr4xkLaoC93A2rOvl4Vn06q/7egdolJOxTVdKywbu/47u/
47uP2/C7aPN9aXkadR9pbkbF/rYVWzthmZKwPGZJZJMCB4VWgGqdN0Q77hXzmXLvoocbwgYFhXLW
lkGjjh6ceHFbfT+d/X2JRVF537xpVPfNm0Zx37z52OYiXyslQoPmiT7i3K2zB2yCNvzwRbaCeAE4
LuopfH9xN3dercRFiWY3hx7a7w6crG/A4KVLDAv9nBnC+0Ts21TxT0iuvauFJltQI8DnSbd9f4fY
9oWj/F739+nX6I18Sm8e6sSIWMeJ7Rl5sAkasmMkAlxN0cRMKElCGaG9ZzxZ4Vw21GniHA3cx+SJ
tsmIILPy0j2AWN/GeB9Y7dj6xgntrLruMMivPNfKvfPr1xfVq/b969nF10cn8v+gqbknPOZmdvWp
WlZfTkCnoXIw376/Tgt4C7NnuJkFGJJZGUGcW93V1c2HMYDmK9KYUpPiApXDJCKpEC6DwlCWGDKv
a0OJd8ZTSZwNweO96LVznESrw8FQcFs5rs9Wu50r1Vjrxsu1ZnRPvx/hstm03PPDrPynncm14eHr
OT5TODaQyiNOkaMcajoQBe5OqT1L72Aw7maLz5G4EWDGq2OTKIohYc7F42guntoupm98hZCHkYvH
HdGP2GjERs+IaMMHJZIlISUivOdBayE8dMYmvMagIS55AjFyzC54x2IOnDvLADsZm5++m7cyg2UG
WDGNL6/2CTY6KeO2czp+v00Hvq5mTbO9PC3bNr+jF+V4dv2troEC8RjoLCkgOgVYTSmVaYohMJsS
JY4KHgHjwQ0qgofRtTLACihylVny6VBEt6XNBaetrva8JbvKvJn+8fuN9I8bitxFf+tbjzkmbp6E
OtxT8kJytuf819WXuU5/u4OB+jR8npkjeBj+cXJ78ho3gk4+ta+L9vV9+3rTvs7w9ZdBKCPgewh6
f/0oMWt4ZR2x3rWvrn29Hk7MR2Tr+cfJVUcethy2Vk78fNd+Tptyfk1kFw8t593dOxw7qHt+51cq
hYv2m7sFErWURdGyffh1L27CzdW4kv96mEKFCdq4LLPjUaiE/EiS0kizkxZdIS30MFsLmI4Y5WiM
Bq44oRTVmpjjqDC4uMcLBr5q0zhdDGkF6YNHAPxX8IFhD560yF9BKr3lA0OeINaGZ864Zh7XzM+I
+sIESYykjFuTArajbHSCM0NlzMwRwYyCQc7Ocg+W1SYYTpJ9jspaz/RQHjBLizpxZ5U/q0LHAcZV
LyuPILrsuOOngJ88fvLLT27b16Ucq9/jC1P0flwvjyr+jau4jzxkb7IL2QptoY8hSxkjs9Q4l2CU
HCNJ4ehZWFE7bxhoPAmaAX6iwRznC9NRZH8Galz18vusdfkU1Xey1ubm81qfT6udKYAaD7duQOGu
Uqjaq5F5zEK6uM58eJ9gRVBv+c/8jF1sfWdK0jkkeSxZYMsBzIGr7N1Rhe4WM/Z+Tlz5FGcMJj8L
qFRPcN/RAxGZb0nwhERJYoST41zzLOcamyhgRO0UNVrl4AE/Bi2y4JrzLLzmjkvNBEBIJXIWlkMn
hYmSyahyJvHpcLIxoAgjZ2dVXMLIxc2iUC7NqhfVhMEPnHhKBCA9hU/xtPqu4r0jlfLECA/H45Rv
XmeV0iRQj2s7JjOMYw7QDek0V6C+VKjAlOCwOnQuS20yM87LkJQgAlaF1B2KD1eaOTuLy8OUpV5O
9iomaibrnZFsaOYxKWaWjBBrH66yq5/m84MdYLi6Z1/w+ma2eD8bFL+d/Hvy9Z2rP518+Vizk//j
Zkc2Pdge38kfXR3en4yRbCPwGo34AcCL2BQE45yAiU4JTHnSFux00sgegRmfYwAY5ig0mqQmFoYv
GC1VjtBo5E+hsO3bvknzxl0n2tnEW19ELtq1UTt+2+5LhrCNwGzU6V/Rn81aJkCTo2EuCYfkggkG
KsCwSeVdMEJ66H3QNCcBn2GBZTiNxCgWfZbpuI273fq7DGTr6O+bN9Vff7NU4L/+5vUGx8GeaLZH
B7Nt78U1bs5FoqqksAjwtjB7MVNF9+m4uDZu9+dd+bfpz9N5x5/g6XDuKYFd7LNsvskvLIDccXg7
OjePAG+cDO4PY3HWmKwo4VnpbJJjPBsTfQrWCB0zdcJaaElTw7KVKEXm0nqihCTMDZBFsGsRC0/B
FknBNlj71DP+fGQeGFHbN5/wnvrkI7WYXSyBVhJBLVFaUceSZZykrI0zsORKxjomVOY2M6NMphEU
Vvqj8lmv1fHT5lErUg+c7jwd/bRJS8UGSYhXsjVPZ++q2AhV/I5n8HORapjHD0NjguxNDbB4XycY
6Gt3dYUktABV54MyDpRAq7OKw3+BuaYwIRX810fEXnE9fHT9Ec2rQVrvkR88XoARno3w7Bn5JmdY
jSdGJchMrYyeCW3R6cbBwHovcvQhOhWFjNI6ngj020YaHfEWhIvDZAXYYSInV+tAtNbc4ykM2OdF
ipPzj2s+RSjYQLkfKnJxev5aXIyk/CNgewbnn5RZR4UzDrBYFpZpQl1UxhNpuLPaUO2dRycG6E7w
kftIoiHR80gy6PgxpPz7FbRwQh2noLyroI8Abu1paHFvQ7kqpK6ANpqcT50AslzfXPfpBW7y8uaB
sG53cuN5Wlwubpp8AgNiuX/08MsvRyQ32peb6fFw6h9b/EX0l+NyPm08PYxUJasqJkiFjlIJ/9VR
w7T19JgPakR+z5RqEAFdpIFGojNGoankZFRQvdaCc+Wp49Cx6LQJHiYX7jkJSmgWvKdGPUDU/6G+
mb171cwL96K/jiWdzFdub9Wbqr3UTCfzDbL7P93MxrPUEeQ9A5AXA0veJU251dyKwKVSBsl/hSGY
gclQkYmUMgmWMh6qsihIjF4k6lmmB4O8TT1s3Nx26WEv59Hi9LhD0RsYz3rROQ6FhnGr7aa6qeF7
luJRKY7E7mCEOM0Zejeblwjsn9PgW25lp4l38qmr4/bbcK+qSYTebFrhv2EILhtxGtylGlLLI1Kp
l07RhsFpIP7QjV25bhJ6faRsq39k+W/k1BwR3DPeu4OVPubqjMwpEQ2LkiZGmMpWR0yHwriE7vEk
mSWEp2RFckTGAOKQnOkDR6t/ufP3AbddNnaCP7ZYNc8xOM6V7QAMksUdgb9Pb0vZ89ev6MVZVd7S
1xenA5NtjjBvVOV/lqxpKVJpdWaRZMWsItC/GIPlXBttYTQVpy5TkaDTiZgAg22IgXa1h4XZwS5z
92ltvaW3rw7V2vpevT0m0gEFbOSufFp8SIAQFx8KblyK3KeHOjaFu9gdBvH36bu/u3cDYkTxBBYU
OUyyysc77A1CQrrFuELH9JkjphsngocCUX0MngjmmTKUCmYiHsd6BXNDEIZ5ZUhwlDCuktSeJZvB
YIrIhDY0hAF4TRpTOJmdVT/1Eme+eVORCuSufipvt33m2KrwvhKkN010GmrC5l6uLuFnTLf5CmQY
8d+I/7595zvCIgA+jGG1oO3COhIIJdZFKyI3nhunJMA/mbhApiOTSBSMcJ+k0UQfnNayp9xVc3iL
Tndb6r26uzrcpevS+4qQ3mnw0fp9KE6E3xT666V6SRCfmg4diAD3pIlEDtLPkBT9KUCQkc/CEfKr
h26wx2HhEQmOSPAZIUFPQPDkvPHZ5+QDj9xq+G8sYZYECb3zsP43kSlmjHPaEaGl19qEHMkArPA9
kzjpZsxpUiBX19up0K/XV67XqdTxzwzPkqBQnwAe6ROaRMj4jsOPa5gV2ivffVfpEf6N8O/b38kn
STvrfKBaBp49t1I56WhM2tjsYIGngtA0ghieJwJLQFj4hewoNzaJdDCVyaZGz057pO+TotQbwRdL
xe5dvO6lNu+q92aMxoMarh7PGI8bhtsZxcu+ICYHKsR3B4JCu58dZUhSFMD0y79HUISc/H9pfjII
OQmGHR/V8p9uhmkYevyEDo/Ib0R+z4n41HqDaRCVsZYYpUOENX8QDGy9dClxEwobHdOawRSBp7yK
I0o0NDpj9JM5USbzssBeoj00//O0WF5tLs7h4j9OyMlZdUJPfllNIXOkSblFIoNbfIclful8gqLb
24JF2++jTilWaAzBHfX+G1/xMW2Ul0zwFEMSlodMHcU0j8xGzZJSOnvon9eJORhW5xT03SrLieI8
y6N4U5baXK0OfjfUfAXk+prexYtz3Adslf1NT9nfLJV9Vxzv5K+/AY3/62/WTaDaV/vK/ukGiw5D
h9z6HJYelrSnlZ/OXP1peekYAha5O+T3ejrDsOLL/0qzd4v3Q4LH69kxWXzoILjNYfjfEa3yoVr1
J1+WXWXM7DNa7OORmtaJZ0WZM9lIz5V0YLO5MZiOgjmMqMgaJGLWUsEp9ZExlnmGkWaSk3BUZh9J
9xA+1fPF5R+uEn6VhvRy3o6nf4j+nP46+WZbX+yLIRnjB7Ge56vB443Dc2dEt4dzOxkQG03gaAK/
9jAyxqEHTgVFHTHaSGeJVylrGLAsoWM0ZRaNL6nORCLRcJlD8lHwnGB5e5wJ3J3i8W42/Rtow+/f
u9qFRaqHPL8FLOJ+FR5hwEC/BnUydNeP7MXjTt1o/A4wfrgPZ50z0SXLIqXECSqJkoxZTqFDjCeD
BzWZE5YtSABDoFkOXHkDj4Wnn9FumT5cvi837tB5e4rnITV+qSZXaVbunnZ22LDIj+siUzyWOat2
lVyu+Rf1+fQCF/j47seLjRKdpXuT8ugeEtVxI280C98mJhLosOcJU9wRGBsbLE9RR+4BCcXEACUR
Q6K0VkaRYZSzMcYGB0tEIbMMh27k7VP++iH1rx8wAOuivT255THxpg3o17jLDPxuB9ny756+peeu
rsr6IKxGoBsV0u7pYYKzZqQO3NfbnUF3Mbt0t19rgjP71eU3Y19ffjM60vyNM9IzpZGwRjhYgouU
DHMcMGiOMHxakhiClFHCJ+NNZIERmrVzVNMgsmA6RJXYA2Qvb2O8D6MWy7mV2Qwdhlz1qps0qZ/I
bDa6/o2uf9+8ZhoZcXVoAPnB6GGQhyFMmiAkL+FdNEG7THgrYAnpc/YavQQ1A4lAlYk9FCsulbCb
xKxRwV7esn7GstkjgnhfYXoLgGLrjGXpkSnLpLwnUuO/lw5+80GzXBwMJsww8ObLHkiQxx3QjFhp
xErPxyLTHJUyIWUvwdjCT0MNo8ZBD6iAtxYG1wlljHewZM8q8Ogy7ucprxzTcqjAi7WFm8AXYnrX
YVZZ3gD7TZtrcerAysKS+E2F2SibB/q3GrdvKLAq+2L1dr1h4NZ7AXhWuaprc9PQH1Cubf3dzF01
3jArEVybMdPDq9/aYNj1zPdvNjqyc+NxNTAvVyOzIqXYni9GWDnCym/Vl5ALznzMLkanmM/RQEe0
g6WeVd5TkYxlQTCitIs6es2NToElZwQsAm3wx0WU7DBVVScQpGOuyOryTou1dfc+o1X99SC7VVWb
+537bdfWdudu8zVZ2q/GgJ1WO7dJDzJjp9V2o7tsWb3HmlVDhc90qix7qGFah6tU7jS/mvpA1K72
56Ur9Q8ZXK03twONPYLmZhCeG7G1b2uP2JMUgzhCyS3XIXEE1Lcj1h+x/vOcJoVVKcjETVIseaWV
8C5TqYONlGvGGE8wdl5Bv0yARYBXCZolmQipsnFpoOx0xS7iDqlfwueA0N5Q3B8tOLlPfx1GDDti
2G9eOZ0BtAqNKN4wmCpiss1JZh+1C8kwrrAfmvmUM2gvZ4Q7Lai3xGkYhqMy0i1V0Le7o40Cko4C
4tWl/uGHxxEcLt5P61iV1soGKXwTp82nuzmeViPbYQPDDoRbej/cunYfh3QIn7CzSpyeVSW5B75i
Bo32MyX4xuCNI1id6TBu4BP0p8b2MeVIKxBrP9MiocUbxwg2jP/3RJxVqh0Y2wrE28+0SIi5UexR
kn2tnt5/glXNPY7eJeH1yXS2OEHn7tnNogLVm876FY4G99dlIZNcOiK5TplZbpMTisA77aynSgEM
ikF5Zi1zOXMjAtM+ksAtBevsJOXH+XLvplz4fUnq/pebq/Kl+5z+NvwJ/jaDMTLsIOd6PF/YUGwN
W0K9ktuuQY+ValxgjgvMZ0Ts7aVSGZaNVBIXBM+U5ZAJ9QEMoKMsUpJoMilYoo3P0Sa4YVSEvlJY
ZcancDn0TWlZXp5VocPhhTufZQMTyRls2dJ8UYWvm6BhXJKO6vwr7heRGJnWwXiRiY3JS+OUI5qJ
LLzNgUcak+Qk2ghwSSiQR2iTBJM5hpDzoUvSLdX1Z2GDq4u98C88+mDbF+5FOL2faeF3PaqFe5kW
fjcA1cLNLFX1zc1imaYTfoexdugElODtMsJz8WEa0rLITfPgEfwLanc8dJ2ub35Ol+n6dvFpyNXv
+cVZtfx/8t8pIh/Gf9QpzeBNCUTG6/8K0OdkWe6Y9Eb31zhMKqZuD1Y9GbALX0r2kz+XUiedK8W3
zF1fT2fvcBSvwKbeuXfpZLvDR/Zp1dTeJsb8UyO2faZO5cQ5ySU8CcPGfEb3qOSIF1YrrSIhmEHe
JqkJiTILHiUII1igMWbrSRomg2jX3k8wEQxd+0mt72A+m25KaixXklJfjHlFRyD7DHVX+wSdAsBq
JM9C8OCgU0RYI0EQqZMxIgTFuLLU86ByIlJyYWAISAatPxTI7tTO1sf8IO3s+qPvhnYHnL40D1ZN
W1j7ntzw5daB6HM3FcW1+3h5E8JdXYZi6KyjbJmgs33DCrkMu/jChP6tKE2Od9LJY3pMtlE6oCSr
QRH9RKpjnqkRu432f+dGRjSCYE5pJWWCZk12ynKVNVU2WUBnxppIbfI6W00o89CWU9J75WGiSA9g
t/+41+Vlw0b2sobiPdBS9BTdSEdY0g2Si43Qdrza2Y/Eatuyvy1OjpPp6fouzCilwPfLZjZ8yNeN
Y7H+vZUc028xR+loMEaD8QCnBYeBwqUbNUpoWNwp47SUWWVOnMfzipCsoTp7MBQJ1nk+cKptECCb
0FYfChj3GId62zzUuw1EtUV/0diI+gErUW/biR/WdqK+11LU+2xF9bjUqDs2WFcORFDiuvowXbxH
IZBptuoM1+OSoiq+E8u6GC//8zINzyw5aRkb0QGmAW3FSYaXxPX09OIJtBPnk4ZncekGZJauSbqB
y/J0mP3ISQs8seomm71aOiA1Dj2bfunHdMGi0EvXJZSaIsAtw0XR5wr9rfRgHaHNyNDSF4oIurRR
PuGo4RDu6JE9pkcMusNwyIrTE4PuMFy4FKctht5a0BDreWiNeHycXp+Trysl3GsnndOGyRSSI0Ky
mK0UREfpTLLJqKRh8gUBkoIxFp4IH5nzQT/kJ/AAQUfP0E9QYy5x8jir/nO9lYrBW+eLu9urNJn8
WL2q/nPNHDW/86en5SO8wwurGi42J79xb3XcW/32s3mxyGXORBhnJagwTZlHwMhUa6pBpzWFJjLP
hFppuOYghHGJ2miFMlocnMfhXrVt9007avtj9XJDa6t9WtvddJ1AJQekX+hiVRCsQNWfqla4OV5N
LrxfXijtoTc8SnYgSL2PDeTfpu+mQ0JUyriQj8tS+nivS8oY50R+YQ4SUfp6BJrT94G0u9n87vb2
pl6keJmnH+EbVL6usNRK9TTAmmSRalg3oed4irBcga9GcTk/7Cug9qxTfnQB+ngJraA6xruw+Cwb
7y3QP2KDmZNhd7kbHv4vnEC40Ngf0epIszei+GfKukCVSxbwONMk6JCYpMJnJoKkXiLhvXM2+6xF
YJgoBBpxMOIwmJZK4ofI2bvLFpZz18vuLns7tV+7j5NCZeAbCoWzhhnh79Pb9SNn1ertOXt9cXp6
+gQM/yUySmCnTqsyz/grQCateUOHw/7B8aguv7a6JO+YovC8sdQZHrKDRrhWTkiSKVUpxECUlaAk
XtiMPvJUhmgIBdVyJB4OlB9QinpLLdyLA3WCok48aUP3Cr6iML1VrWBLh9hbNy28HEvh11h6p+vC
dLZI71J9qPeC2eM7e5vc4rKg8iF9F8qG7+kTtnUnTQ24Jbnr9XQImFO2dE+fEH41aWpohFq/DiNc
2S9/AvnxZLLccb/39fSfNI/Qzezq0ypN0HK1UdgnG/JJUOVwMwtukWYr/3N3dXXzYQxA/ZqipYyB
xSjLCn1IaWQAmqS2sPSPSFMsqCcwPxjLLUkWupRSSHgKKRQDCYI/LgBV7Q5AvXJliTq/q7PDeeTO
30zjgLbQPMj7fkRsJZVqCOuitw93tpOTHb7oHWbZuSMf2tYVfoRYFL6648p0XJk+T5ppYYR3UqPz
lmKEay6lZlyKCFYuJs8UF4lRm6UNzhTmdyKygrZ00HQIoqOddnVydVZ9OKveLxem//WXt9WbisOS
9D38n1xVL6sPfeojKDEeIo2HSN++g74XAaqXFNrjWUufvVZeKgudconkIEqAjTOeJGl0plEgTby0
ijno9sG88PvU8sPZ++XCuFFK9uL9i8nVyw+nvdOhnjoew4PUtlu1DWOWHofr2BZvHQLg9O4A0Pk1
AHs8y7qezpFS6XPmxC2nAWebJOuPx3N6kP36lZTqrEJfIvTwkYPKyQc/1jhOVD0S2Y+Yb5xCHjiN
4Dx4m60VykVYQ8OymULtijIvfJAmWMIizYIQYWC24UQAHpQuYTKgbB7yKbrfx3/TCE/eYlbJvFi6
K5xV9fTd+9XHDilJt1T1fb/YNvNIt3TrIjyNMFv1anlZTXrVVK9690+r776r2EqAt+dQRcluB6/b
Le7qGbZZEmf2O3UfZcrDA4SVYlqWEe6Opuqbjy5IJPkI5ikHqzUMEoBaWI1G5wXm1SBBUcssUSll
rb10nApuJaVCw2gwevBJ0PFmqd5tmH7YNEz1/aapfqJxqveZp/pJBqpLCnNgVQ8ZqWMWAcv6q7b+
rnuYq+bFjQhWBrX7dNixlt4dyPDzzRVA0eG3cgcl7xtkI1duA+XHu+1zKj/PPi7dTnVKjxJrxPTj
RPlcPYwC4UxbnwIVKrGUdNQpBZ6i8VZwagIT8FFpGFCYUHlizihPc2SaZmmG4VzpGdTNPdzmJk5z
1YvqA27ljhQr4w7uM/RuAoSacow6W2aI1cKqYGgmPpgUhQ3KEg5QViYKq3G4qiS3PmiViDSwBGeH
YtpNZezs3Da33ly9+PDifW/btrnxONDW6nchr28aPRCc7c6rfptqMEEwcCVb+4Do7MT5k2Oo3qD4
WXXi3TCMdVBdOLL50LTfvASHLy4UoUIjWxhSuHisdLEVL7byta9xKWhsJY2tqO3r8n5se9K+xrZL
0Tf3fWy7377GdhxiOxCxGZ7YDlNsxykuByo2IxXbEYvtkMXNMRvh4ggXn88c5J2KmWWjLYweB8lT
9EwT6Cy3zknNJXPZZ0VLYnhjZdQShGJMCKeUV0+hn+4b9gm89HZ5Z+UKMk+T7d3R85OTNnb0tk4/
l6g0AJTbNZ7T18uaLtrt1ln6uFg+cL5JF9Mk/SNnpf1V1aebyU1/3CqLLWymNp2lDygKCras6Xx6
cU5e/3hRvaxQOoJvejd/XMmL2yYXW0kDl3Viggykrlh2Zke209W937rb2zSLk/bZvr/EqtSIuUfM
/e1jbhBWGS0ToZKTHHkWzHquKRNOJyZFFpkF4pgKySqmkkxg9aDjwYB1zAfTGu60bfW2dXtTrFu9
277Vx1u4eqeNq/dYuS0jV99j5jpWrj7Yzr1srNzLPTbuFb3YkRh1v42rj7Fy9UN27oBFzS0M8wId
wduRL9/iebO2aeIrmt8EyBmu7iK+i3e3V1N0JD8w1ELvjluu0VcdQ0gGTYfK2FMcd+H5YTx34c8T
QhXg6UHEYNQ+IcUPo2ZcNozLhufpfBi9MiwKw/CIFXqirbLRJa9VNioRQaEXyShJglQi4b5zsAbD
87K01rEnsdGsLONkdlZdL0G3Q8I2PAu9rl5U1801D9cc4Ojr3kzgyxwDl131A3x4Be/xfLNyIwIe
EfC37+ifLCXwnHOOGB2D04RlbrVUhjBCqXeCCenxnTaJcQWYODJrdAqGQtsHE3t3tPR6jRlRTSeo
p9enRU/rrqa+XF9YksvsVdbjPAqKNGV3ukFtbVp7uFOS3CdXFy8DUPjp7TLx6vw2hWmehrbwgWhO
3Zd0pk4FGw4cOUuLg6xYehzLJfO2Pj0i/BMqOfnjX/58Umpp37UvcvWuqbd8GCZqdeXeK5ZyN02Y
4u1rj+nAqqq11Gr1YVXlsLKz0kwju37syLOuyKIr8nrUu7+Q0xF2jrDzee7eCEaIMQA7kZ48Zwav
xEmrchZGeasFyzCHKca9l0x5D1ObI8xJGBItExs0oUxryxtetcXd7RKILtL1Lcxm87SYnHbJEVtu
xATTC0xp+NLub5QHoM8wL8IF/PRbFyMWPD1tJrui9mVHpjzdUrFhm6ej68QIYp9jZqlEZCAgJ1WG
akXK9i1N2WYmMfTfm2hVksJERZAnwMMoEs61z0RxF4/MTrND1QtM7al6h1CxUfV7NH1L0QsP+F8X
zd8HdH6bffExuW6KjB3+xfdu0RCFV9c3dcLPs+pmhoF3IC8OAAbhIVhe7282LOPzm+tUhbv54ua6
KtjmQKC8m2GmjHee1vPPxNB3THI/sQrmuxg27O4Ysrxzvkyew4aRwhYorI9LhIMj2D44OkuM8PO5
BqFYRqwJFhl6JbMwMDB0JkmjsgMsCm2SzEPU0ouQnNXREMSoQgljO2cWj9r1XBvGNZPvGnLOV8d9
q/fnr+jri+pV58LrV7RPuL269ZVT9o3kTd8EaAuB62BcpIEERjODlRyLPBsdheVBu+g5tOW550wT
kxKDsc3cOcq9pofvPO7RlBax7dWUlxuaUlU9oLVDVw7n8pu/n+ZFdeXmK5a+xmO2Rlq/m/m0+dLO
OhuUhydn0btpqlreBKRN+MoDmxj76iKbmFFfY2QT5WNk04i+nun0QTy30jonQDl14ImLoE30SUUN
C3sdHTcxBeEZLPczcdTCNask49JaoXdlpD2WoWrbpG6GNq3YqSZNbNPLEuP0Hlmq8LW/WzcSVY17
dc9Bb4UQ1iYCkM4x6oTzSlCjotUkZ1gZURsyUcpYFwQjjLKYnaaAC5nToNkHu1zu1M5OrFNLUjW5
erFDL7tI77GMVZtMVcdFPxmyez8Mj6Q3cOeT4Rt/SgI93MZq/12cVd1NreZTm7Dv4uIzobpHSbpH
5DVJV0/2Ni0g5r1rb/AVARVr89+Z9o5oCrMm7V7JYyeG6ftO9Pi03u/7t2dUOufmTb7BZSZAzDa4
d8jwZpuE0LQjwtp8fjhCZv+QtjkARZPvj2MhKMWhGIdygt0z5FgxFGNNcYGl0KsArkk8pF/+gmUr
pGyfk20zsn0G3SewGPYeXhWe6y9HR7Vtmqa98hy2xdp2RPsMDhtc03DNLEdJN4NSumfa9vA5i7LB
Mxzbgf843lDO4nbrcqBM20/R9K/IadrnRNOWwWL4i0IZCY7+6ptrW4l1K61sJeXtk9gSFiu/Y2yq
5HRkff0dVxrjSuMZ5WejHMdLMVg1YCJFzbhwgFeigiZsoJ6TqDT1SsHQUS5ICEIZEMly7YnWw7gZ
rGf+SX3zYXZ3fVaFmyt4XaVCXxXAKI9zUg4Locg6aKMtf1HuQCXrO02Np53wt123N6LedtW9mSF9
JdM51HFxDqUuQDqs/AU+P7orjEugZ0jKEkWS1hviwVRQaoXi1DoqHFOapKw8D5SBCXHBeylyptoH
IbQKUDLAsujgne8tk7HS0rLAGcRilJr2W4xOrNlue9GJ4dplLYqxeIGmorsmW5fEy0etz96lWapd
ubz4cPMqTgF1z+GeuzqGOcywncszXPxd1jeLpfLcDZsIvYO9t6H5xZem411Lw45PdDhUokG5XGwU
US5Gnt8Rz47Tz/3TD0BZQbOIllrPk9bOS0mi0NzhAHkno5Iwui7B0DIfpM8wegquZJTS+KfvnO8w
k5O3S+yIhJEt8SQGh9CGUOFtIUBod8w/vIcelYLV92+aoh3gWUgv8eYF3n17Xu5fbCDTDulmZwIq
dJuTUvHLpt4u2e8yvhjLtAyZp9W/tOKti2Bw87IIyIy7i6XErrJrgs4iKtZ+UVzsulexwj3yQ6H1
9XS1Ud3unrcj24q3+/Ef3izHcOPpMjZvlgShPfz+in4h9P7PZztH7P7NxBzoFFUknAqjlXYM2o+G
Qd98hJaFi1nzkL3KFsZUWZYx4DVjTEKMPol0KHbfZyJbuDzpWMlTNDakbybrewxl/bCprPcby/oQ
c1kfYjDro0xm/TijWe81m/UBhrO+33TWDxvP+l7zWe81oMecNLXRizcYZbmkpCiMyGFah7srV199
egQ5stnNv5fr9Lc7+Lp+uvy/+fIvLSHzgIucrSOeXtqPY1yl6WdJdYcO2HS15Dnaf/vzCdUcoPBy
uIBnBo9cjY1roXEt9JzSZmUinBOBcxmCopREm4wXFMZRGWmzkNwHH4mUlAgC7SocZ+edyFFZMcBa
aJc9RSoLMNWrrf0ZxsPXSJ3UbqfBQ+i+sJPICazT7LS/HsJnpzC3QU2bO/TLqqcb5HJtE5vrg7Ym
TCewWVV54uWbjVUBXv2n39UfFwajJXloV8VRkB4qSRpthZSFaV05QxPnOUeHccrWGMEjc0wba62T
CVcPSURLyMELgz32opiLapU4ZG0xVtdWGl3vMRuzTgWt4Zh0LMfG3Q3rsXVvs7mVCZl0bciOStd2
pN6yJNVj3O1XQHk1doiVewlFCiJqQHPjcH8MUN7N2PYuLS5vU11PZwOi4yOc1ukgfvRHuIIN0t4R
SQXliFpH1Po8UatKlME8k4ISlDsGkNWI4I1gmdNolNUB5h0aFVUc3mgeYRRSsDonQ7zPT6FpXpu1
yaxD0Dzbw8zM+yXodgnSL8G2S7DeNNAVoHpVsdPq5eY1PibBGyHnt28GovJKaCVJZoRwQrXOzCdQ
chUYMrlrQZmWQWkVvbAGSduiyMxqyVQ0OR8KOTdUvqAyxHGzwle83pReqXy/BN0qQTZKsK0SrB9t
eaTOH7V5erJ4XzX1LDdS70puuTqFuxo9Qw5EgbuZ3uYf3O3gjiAn5xcX5xfnJ18Ym52cQ6MXFyeP
c7J4arNH9ZeO2HDEhs8zvgp3GZJPUTJCs6DEwoglK70TnnDnDTeECqY9ISFzY7UJ2QfFBbHZaG0G
iItcmbzJfIkQ4TtUIxXSvP2Idy/bwzDavbY8YmtRIda1/jS99u7KIQvR6tLGJgYeFpa2Tjd2QMvF
dtfh5PxkY+uyI8/L3p5n+/S64R96IHf5p4gJT67KbRdZV/Fqe1e1J93FbumakdkhXmdQuiVfdXrV
m1tR2HFHdoTH3zy1ccgiZUK9dMlBHYwFvKST8VwwZXLkkjuNXm/If5wsGMREObOcEBBPHRxp2rd3
hbltbe+aj117R7rX1vauXFzZu/KpZ+9+15LC3WfxWta4XfZuRSi3aetWN7btXIeEbtvCdW5u2Lb2
zm7LtiFHx6qtBel0e7LPpC058nYatUMXADd3i7IIuJ7Optd319XsBneGsa55hXvF0xoJjGDAfe3C
T2lRNYI1GT469CxN1o8DFwp650IhQT2XN/XlTRySmeXk7b9yIcW/HQGdT/5v7Ob6ewJuf/uvvz+m
3T/ACAzU8NundHhcL4zrheczSwqQ3SRM95e8y5blkKB7TgmRAw1aQveUMilki2OmiDdZOmMMydln
GPan7CV3bN7kTyv/b0wFDZPan05XG8N/Or8q6e9wf/iEnCDBW+8S274kyqVJ75o6Od2+aHZdfLvr
4u93XfzDyen2hnVjyprLyN66o0SxOSMIH0H4N25e4EkYLQbdMiI47Bt12lNLNPzkNnDoUgiY+ppz
7iWxzDNhjeRUGsDrB4PwDVOycipYW5Oqk3APdRg5/d68AXPSmI72I8OPXY+E9S3RL6n2lzT9km/3
l/x9vyRak2pH/r/JX3+DJuWvv1n3otiVPWXBuGDRx/hKhPcp/FR9eJ8A3NYF4b5PH0GDwvTaXS03
yKfzMt5oDWG8D4S9dn/E5NVdcPNfx0tCqy/sJaGHaO8IOkUxItsR2T7PqQcplxnhFGCrIjFYJUig
SmcvmJfcSa8cZ5wUurEkiHISoC9jQhrNlXqSl8TarB3kJcEe9JLYcKrtVF8CfqqXm9fY6AMx4svn
QMKuYogJhkViTjphbIbBMTQGr2QAGJmEjVJ6ro13NLHEtFKOEiUih/HgR8XjrRS63XvsOkGsUnas
VLpfhG4Xob0dzIN0unqCk0Op56jsdZbuxGzhBn7pdUN/fRmn5bqrPw3JdHHyF0IoZjiDV9a+8vZV
nFxsxT+dvI3Tmav+7OqfsNR/pU8LGII/unr+Hj//G0jvZtW/3ny6SqUWN72u/nuKm9NxvqM6I5Fw
7awymHWOHZMY4x+N5GAHuiK9roz85Zez6h9Nf/BuT8TX0NrqPi/3eyLD83Z1X5T7/S5ABeyXX4bJ
CHLifMBBgq89vrx7P8WXH3+62jXuTS1YAHQTbOE1vr0CC3rn3qXO5V2jDEYNefeQOA9/CEKOG2mU
E4eileF1BRU2o4SilzutTK+xmeYWdgdvrWR8ja0397CPncdwWAXeG2hc35Zv9NvyfX5bvs1vd36X
f3Q/O7z7+/Lj5cvyDf7XP/5l5xA2zIW8jN9xw/e2+ZqW1nDsmjF423w9f1/GrL3UfCNREhys9mLz
NSxy4TD1R2lcaYwrjWcEQmxgXqhMonBM2MwyFUyKjMktvMtGpEidtFoxQa0WVIYkJM8wHjI6RuMw
DIF7puXJFVKoMPjPlyuRRgWR9OsfH+HL8ul19fdffinnnB/Pqk9n1d/xdPPv09vuoxcjV9+4vniG
5J+Oei5gzWACNZ5aaZKMjHjolyRcksgtT54JZS3TiRIDAhDjlbZWZu3CoeuLg5R3udm7X38nrQKf
7tTg9fNFiVuVPWZF0YrZSwqYSnYavDsDtU6xWot/4DKD7Q2gu3YfL+d31wMuLRQ5wouYDJX35QtH
7bHHeYY/FrV9jiRgf3LX9+UAm8Ht6mQ6W5zgaQQm0AQtms7GDF9fkytydtERS6EXWZEoSQpOGmM9
0YQi8YLR0UuSU4aLIhMljEqOhwDCWRfWezMHGZHddDXlPAsM6nwxhYsD2hGkWViRb+L7I3K8/zvq
yyBJ59dCHNH8/wDuGCrlPR9AgHGxOC4Wn49VzI4ppNt0EWnilAqUEmmUo5obb1mk0QUH76lWmUqR
dLBGmhyi4VonTp8eoNG3iVsZ65uk1cVG7UthvyMPdT/cYnXz+naLuHKj9uUfD8b8p/WlXj7s3toT
avhnJ5ocV56jnXgwyF8zn0UwgJmIg9EizkDlAjqL/YGFJ02Z2AgYyygeFfc2uCR8lsoZT/zBnlP7
rUEnhT3O2PuS3O80Bmtfq54pWLkrdc3A6mJjAuq11VkbgK0k98edhDVuTSBN46/fZLuHhcOy2+jK
BIuIA9erco8rUw29n8FXp063Cb5Es3eXeDzjwiLVQ/r0Ox/w6ONwvFV264ZwrD+u2RN3MlCrR7Yb
Tr7SRe1Dma3d3TscC6h7fudXX2r8ot7cLebTmMpp7rJ9sBmLm3BzNS55vx5v+qwEo9wmInkQEQkZ
4DelAkMvI89z4i5R47Tk0dqkkmSBQBlCc2aWZnncknd3JNF1ilM3u2wO+od0q2Rb3Kxy64o6Iied
lL8dhCCAbWfG27rCj9iDY2QYubazO4vtBIZHjJfoj9e4bB6Xzc+IeJ3DH5elDUk66lQUzjATqYKu
uUg0YGFHmPCeCqmIpdIZHgAlO629ZDzcv2z+j3sXzH2LOnFnlT+rQsev01XfV36DchUuhU2y1VIP
UiZuxP/7+wr7buFeMFGvWFjGBexofLPhnY1uNrjR2GZDSyr1cnkMZRoX5N+6BfLUeUW45TGaRIJx
MD7WOB6D0oKB3eFKaJfR+VRpLajQIJBLLgqdPM3x4LRtm9bGn4V2NV5U+wc0NXXP9oR+HrW1ttc9
ff9hX0HfiyraWSSUq737rTQHNv79kxvfY3GOcYRtayz0r3VK1fw2hWmehtYtdn7QBoAgu5Nzp48L
XOxf9imvn+4MO8FDltOzkguJ4SsmQsDXcuzyxbOuYfNUYvtsLUeRD9PQHSOPGEYezOKsuvKAHLJ9
tY+VZ0TXI7p+Rlw5OUUbA9UO8xhLQQ0nOVLClOSSSKYCTGoMprHAifCaW+gXCJVByJippMN4MHYN
aLMRjZ5F/XMpDOYtKU1xB3pSNnInTXKbyfzOn56W7Wh4t9qOLlXAn9F/cQStz3DZjFjUahW4IJ5z
Sr2D0eQiwI1ElE3JZLjiAiyebY5WKW+4BxGJybCgpgfH3+9T3c4hUk91D9fc7bOfo7BfK9l2AoC7
2RQ+NGdB8z6fU3FovKkjxrrX0CKgxAXcOBAd7o6acjFeNg6Sl02TQzojITTkLTRcQjPbQkZKTk83
tx0nDVaDArxTEF81VnSEL88En4AmmkepaOtsrhh406vtCc5G2CWxQr3dVuAGpbv6CAKZdlBWJVkr
lziuk5heuDxql2BTLq+UfMxyqF7yNXbVS9npsrtsVy9N+xuUnZK8FVUe10tKl7/C8s70fqsUx1n3
+jmC5BEkPyOQHJmQkXsnFSdUGKND0F4q45MXLhvvVBIicZ+4I17pKAwROmfDpcqCkftB8tsu8d82
Nt6aPlaeGqCpy7esj5WbObadaieuelX5MsniBvYyQKCtAJ9tp+D1lVWZXS2d/lpeWSOgHo3Ar2cE
JE08EpscFSIn7x3jNmnlQD8demoywNWWKgTVAcpAg1ELxjw1Fj23DgbUB+t7B2A3it78dNXLB7S9
3Wk9RuWf6oZ1m2po7hoaielj9WE6T9jPabmNe7LFLStdpQKS+pB88WEVX9SMx4FgfHds0SzUl9c3
8XZADL7tc8C23BKO4G1Sn8cDgW4JJY4QislBpNrKX2u3xDTHRGmNiHREpM9yMrIhewIzklEpeKg6
WJA5C0+1yyx4luCnYSYY5HiVEqckGxV0UsPUlYx7eizB0pBixtr6rFoFEfweo1PJZnqGuqSAb0PJ
f4/JKe9LYlsKdzwQsMiP6yLX09lkCq3C2hRW4K96RZv6f8T6J+X1JX4stK2YU/62B11/f15fjNh1
xK7ffuiRdCYQRqSSThiuA/KvQk2MMedpTpZR4UPUCdMgwLLVO1jCysSNZolwdXCO2m2jsCIq3WMX
XoJVgLurUo1p2J+qtpq9pBtUqQ9ah61Es9sG4lVrHjqidGzEkSEHN9egI43HdpNe9qaMzL/cHohc
dwe0tqkKhgSu27j1UXm2Ho0HX22h1FdHEKq+GgSTboF38rgsZyP+HPHnMzpdJFo4zoQTjGsRSZQ5
G4vHiwzq9iBDpgJAJwwt88xa6mkUKUebmGTKsWHcBlqTWPxy+065b3peuZ2z//u4+f2IBUcs+O1H
KnnnvPKZGM+jyi5YQr0RklrtXPKaWAnjaT1jWoqsOC1E/YZpC4NC1mErD3qzrpQTdLODq9YKuovE
3j3Mc+8fxW+/9gRtUz7htiNuLR7l/ynv4Ropu5MfhzzcP/lwUog2TmpkgiysmnP8cYM/7k6WN0Jz
d+uEGO7+CtwgTxVanvwafCpPlJqPHCgjbhwnn4c3IhhRkqUUnCOGG6mYoiZFqIuQkJgOjkcTS+bG
lK3SLGaVYR5yGeBmlGIoDpTGVjcnZh/PmoMl2oGQzYVyEFWKbIPFDpHJbjTZ2KYxPGoElN96eFRU
AB0tYEMf4SeoNIxjwH5YKoMPhFLOiPBCR50ytQJkiVZYE3E0AjmOr6SvuUvFbXHiTs3t7+etCU36
UUe7tfZghpFl4iQ3Wx5jV+njFDS4+jBdvJ8isC3yHIgz7b4tQBz/eBcWzTgMGmzEWsdD1rpZ0rUT
5VHBNGaY4J6G4bwIIlvvTVncOY+JeyIDyYJ0e6Lj84nDRFqHTcqOHCCwJCMAHAHgM904jJmrSJHU
TkionSolFPYSrvqctJIxYXRtgYUwO1jrVKDCeZmUVmmwjcO+IS3hCbRPk34Jpao3WHZy7vx88rF6
UX06XbGl4xRTnroYI4xG3PcMVdmBzCJ5FQjxwdqAh8yce58Fc9GQ5DjR0oECM2mjUipwZyyRngnu
BDf6iI3EPcpaP0pdq9MNSLh+/pGx5e2OYitkleub63Lj1k3r+cq/sQMF18FGh+FBSvbiQQAXg+Zf
+vMyrw8H0LXk+D35OdVzaPTk4nH84mcDyFNQIGJCeQzUkgNLwdu8OwLRH3nkyJB/aur1+bTssoQ0
MrB/vWtyLiRV3hofMkZ75sBjYpkLpphXnAVLnDU6OqagVUBbLBtNVU54aqvSUXR0gu52ta7T9c3P
CRMzD2mgaDFL/JiMV2yYNF6NNVRHtbz1yBPaX6X8OkaC5qGLz2BwhgeqpdQ/2QbllswjUv0KkWoS
RLoMS04CLSaiKdPRUBFIkExLw0OiwWSK+5eOMemFMT5rsJ8622z1cdaQ38sRNFu8v2x3CAfdvTv5
jzp9AgRQ/TuocIEqmMfSlgDhk3+F79+n6j+hCryu4X/Z4Tv5fz+5xaL6T5jDyw2wrVY0DyR3V/0P
gGN/d3WFt3AT0JxePMFZ7nxbwr5cG9JsyDCMDf2VhukIx8pzi6lH1bKuf+pu02O6bdq2SzNjSslx
g/SZ5p0zLkIr3DH4B6NIymap9jCm0EXqSRBWByEiAfROnWPZch8DN1ZHwO9xWEKmzmzV7LqcVbPt
ZJIfz2cXzUbLepdl3BMd90Sfo/aSyLOFHgGoFMIlYhwMGMMzbx+JzFlxz5wgHg84vBYEXqGcp0Qk
ZeWxrEt79LM+SEN37YI+mmEJJFmdfJcNUNejVMpHBW/T3SEwNz+n+srd3k5n7z7DlkKz2bmdahsJ
ec4qhCcXv4Jn4nrDY1OuNv3aryXU7sFa3Rj9IUe0N84XD80XQSMTnzLc8ywt1RzAHMlCUhmDlIxa
SWN0RnOOPZWUESOJ5TpA15Ph6en+kB2bupxB8GVFKBRKOGZ5G+Et2YjLLI90nB9D9f+39/bNjSNH
nvD/+ylwjnCI6pbG9f4yHs2F1/Z6fc+u13G7sRd3skJRrxJnKLKPpKbVvtjv/mQVQBIgQQpooXt6
Whi7RaBQqMoqMrOysjJ/+XZbv1GJ1Cr5tkpl9Caq4eu3BHfCY78f7j2NJRXX05vi6qrs7PqHm71a
tZUON9Y99ALFdIhDlz8nSJQTpy55/SxxUxaPeSXNUzEetnw5hy3Ey+iYpTo5Owadzl48qHgROyqj
UVxbHJizlojIDFQiAapZjXhIuzvTVek7ZNWKU3fBNe4KbS797nKPWxtBNe7tFW6tR5r1fFu9DVO6
0yHZ6MK3RGFP42TDt1dXG65tqdfg3OUx3u0eCdR02NxFaVf+mvmAflXChYY+6eEYbo8OSqnM/1q6
BnwqrVXmWPcEbtlD8SpRMgdRB3OgPfwDgi5LtTSV9FFNJ+m9S3E+rMrcvfuMID+qoaMa+jpXsBgM
10IIUDkZtd4L4SMWMFuSCsuMMwozJkyIFgiANSsyxikMP+UbRfoZOKF/OZ1jaSceJ2a53Gh3cHk7
C/MKPTo92IWPVo++L8hh2M3ZXxaV31Upz8/KGk8pMclyeY0qw+SH6n5jqDxUQ6teTiij04RT1Fpx
R2hSSt/kix9ugODslNaimW7Im94cPtuQ+kPTpjpJXm3no1V1tKp+9eJJhuQBrgx3TLAYJbSZwCcI
7JWlggapwV5aE4LSwksSvQuW46gFh6EG11nBPhBFW130UBrV49knm8ffFeS8NWZ98rdf7cmlv/3q
vPbD3LyyE1O/rYmoZp0DUbUVQKd08FJYtVetDaNNXh3RyXcy67c1GbWPn/R08SHP+MeG7Js8a9l1
trif3t2D0Go62m7szNC9yfD+0/k63HUO6ceqVWn/J+j79l/NkOH819dnvzu7uSjSR3JvaFzDn9+f
3fTx7Gq+OYjeDD81IClpz5vPpEX3cjc70LxfRM5FgeuUlJfJ6J0e9KRr89qo5I9K/usMvWLwHicI
lHenk+qOWGQeC4o1o1RrwRiNlMEjjDyiClvBnSAmMEtceA7FvqtnwUawTma7BE+w7v5LsnJepavJ
5Kl2UpkSwYyuBKPS+wqhMpJXKgFWxB4mCDRfBDMDG3AjlGKYGg8bdkWlIVAHIcU11sZxUHqJs5LQ
zq4ETYbcqm/7PHneZMp9Na+q/iJkptWjzYcd9+an6fwuNZnDqkBfvVvfd9Tm2gPnl+l05ham+nY1
KILmNSHfsIuCfZMNoOIbkgyg+pukt+CyjOQyzL5JT/g3OZPON32OxwkbJnknzzqUhr/smxTa1ceZ
gbJhwqgIT5PCxTfJ8qy/IT1I4HUI/V9e0NSDeTdGS325p/DUe8ctowE0ICx0hAlLwMg4+IA10TCl
DDNhojBcKOEoNswZaq00UDHQXvEBpD2W0z3acPvvg0qnHl7ncpBozT4JJdQgMCE94ILViLoxbv1e
a+4iprxgBPph0CpCKRFoRBp5ji2xKgRLOTdKy2ijEoZIeGAMh+mUVOogBoBdq8TbZHtOAppYccwL
qC0JRKr/9qogxRuo+aaY5Ivz3VVDHW2oeeMmcdwkfqWMTTjoIYrbAEPQoJdo57SilCksuFPp5NY7
JCXoNJYbajhzQTBFAmwoga95501inX23W7+Sg9HRXA0VCzcODyounpA30/M3tb/7+8kGA3/EXjIR
nDtbRChcwq4SVPp0TDA30L6Z9cP9Je0R7qm329/9FJbmLtz+W7z9PXT68+hv7Bv+mRU4PIjGiD8u
48Qvbv+XDRDjDvDLPWEGGQlqD8bCGphAxaimwgZhKahAgsmUTZ0ipRElnhEMwhPjqA3RFmZTGdZv
B9geIX4X1rcP5uluMRsUMCOdfaUU0ikq46JIkBQlKkU+WSs99TaHa6g8IkvnfweRHeywoDvrioHO
A0swC6CUZgiem5tnMy/22QMPAxaZ4nJ0pvGikMNSOIgNbNzBjoruL9BDUVDYkHLYvGrJmEaESs5E
UIoYGxQIbBlCgMYtogx5BTMbYRalgylwTpIBEh7WxPMk/bkoHmrB0KnkP4ydhRRteZjnbH5+c5Cn
7LzmeugWs1rllK6w8qg+yIO4XLyvt3HodJiauroqciNtMTDTu/v1LpBn898ehvl+7e3wrqH/m+vU
B+j2NwedJ+qgc1RUY3qOkNvHd/1oKV9okJOTOz5L0kOq1pksv3g/70lY9UqTtLfHSTuc0pvq9VrB
23z6lju42E7ARa3H83ra912T6OaYZyv8qBq/mvLN3EtYXdSamN5AKz9Xqvdf3koz2lS+moP3BA+F
IqPGG6wxzJsK3kurGWEUY8KEsTZGpJiRgVtujHRMKuW1g3kwuqtN5diCsjWFdFhT2vwyjziAPjQS
bR4uOpe1JefAkXR/1Sla/Uc3orU16WZz8Vm2SNaTrxyKy7f4ppWKtjXoNEWbVagfUS1L0SXuQtnD
Je5B23Yp6kld23r09jh9Ay1HNTvewYqEborjeV0fDhynT65LB3laU/1e4BWrxeynkNtNAL4hORVD
8w8dDYLsJMgb1FwOmgjsX8Myp6OCeUsf/5luz/s4C6+2KaxWwzgLT85+B2L6LtSo+mtYvJuFfnSF
s13OrYHo+tNivTapRRCw+WPRj6T87rpM/jV6C48b7teaqUsiTrzUMFMBKyI9E1gboZx0JIJGxKUS
UghNbLKUIoJ8MJ4KmEFLCXomw+u/P9ou8GNJjk4Sw5TA7zXksaIEephMVo/2OsXkwOd53mXltQXu
cgqg3atD7mQ+B+wDLDfJCXIEfviS0b44D0am1MeGKxc1p5xRBzzCsHeKI5itFIRGjMBMe+O0TlYs
Q2RMgNsk9kX7OmSHrAPV2KHBDZfHuWHzYhmcBg2cFx+F/LWYzz7k89ZEWvVj3aCAwQ82GHdfbH/J
uWIZrNUjFxY5knMVOG+9wT6DX8LtrOF+PNC5SXVGIqvQI7wJR8K81bjf4zhzGK/elliy39eu/5D+
/LEsqCLFcukh5VD/l0v7H88+7zHyqNGNGt0vb7VSRlpukMvwDkCroUE7w5GX2LqAExRl1J56xzzS
JCDKCEWGoGCiwpaQAZwA22T2BnXsaYs4tl4edQxMa1uZ/aduw57GGq7l9XQf+is1uAMcqxY9KBw9
BEdr9tcf28CQEASnuTOgqUbMed6fEWmjlT7Cdk4amGalHaizDJjeUUUMIiHRYElnD8FneHsHUZbZ
+5jXYJ3BG/bAAx4/sGBCw4nLD0EV2ji+S2LXNKIS2zb7CiaFtgpRW8HDOezU5kmxTQgFy/XUPc5A
Ba4moKNq2449sLoPs9ntarEcFi8sef7QTUavMrtXKlPJMyjlG+A9M9ts28JVS6n11FJqsdHaS0LG
oIsUQUc1/INrJUHxhn6E6kVtoo6VLaSWhCpbUXIYKikpM4NhUeZuUGlek/8P6wVSIMpWUmuS7VrR
4ivO3/PlNT2uYl+gnzsy3gbMUeotaKBaBoJhYQsGOsXYSOVhMaMYU2mViSxoRBJWEIxVqGB7+WfS
9gg9kPLGLmbm1k+XARaT6ZDgMHx/U0tf4Cd4ifUg0XV6nwb1AifQS0LpIH6g5FnXVNFnqugvOxvj
fD26lX+5cXcxasyk18IhooNHDDGOHceSO485hfnlOAQtCWywBaNRGCwDg2FqzoTsKbbwEUPpwwNM
xSfIOfZM3oQScKl/6oS9hAAXX1Rehww/M0hK2XzMbNMfd3ZI3JnfPg5nYzaF0cI5itsOFk5hgqTS
W2G9C4IgrbUyJAa41lhio4SyUkqU0vAESikXVgTKFTNcIvSMk/gf/+9p22ZdzLamUtim48l5WHbm
j6e2RArpwYe25AlbY8h/u2qFkt32kkTBUST1/Ww/v0xv3k9nAB1lwlciE7AOljLtmDPOgmjg1Ihg
g1WYE42ClUQhhqnTCRSBEBUtDNsKISjmluDQ3f55iv83pso9EbAp3pcCdcvmviDYd/jMsuAqy4I2
Z+CmOGiv8XH5v+7NulibH8OqWL9fFKVZFL6Gqr1V5o5E3fo+fEiYXvD2upjBxii5DYRqwvoZTGl7
HPZD8FMDv+ileRf+Ph0UQwcfbMzJ4Vad98C9GSTIEKMDqg5KaI/cvHiQ6HGxT4J+gblANiLaRz12
XLNeUbBjcF4jrDnQbgioqQjUVyMx8ViKiBW1nBFLUm+YR+gZBUpA1ZUw3QxU4NN67O+8P5mPYU+Y
TqxZBVjK0gdsp+9DcvbfIrfmyuk87xueoHhy3eKyrNx0uSyrjmfu45n7KzD7KSEVC04yToJmUpJI
YYepCTE4WkSdIpKi6J0Xkrjg0nbVScwdsQ7+ds5X0M6qJaduGTXpfK18+nbDpqnGES7tcE6+xdyp
OllEqLClqaNi1w6JkVN13d5BxXVYfj7TZQ815ewvi4sC+oJvx2/8BKYrUHNXq6QhJzV5sQob59ec
o+BsmIPx2gG8uDk8qOk+gv+d4qsSdYfDqGb+045EZzssy6bYEqF/36sWf/bR/ByH7F9rzPN4wP4L
WLIESQl1YtScY+ottbB0aS8NE1wpIQSMB66M0MoLzoWAxwxFoXTEAZla4vJO0r7dpX9mVuvbP0zv
pkOeUmFCP7NjO+lhDhgGta3HTn/EwB031a9TwkETiAURuA6ga3uJLJIBttQxaKQEE9SkZL3GChB8
NgSvjINRhkiAFIYFfbn7+06+7VBwK7V7Xvy6ADVn3ByPm+OvnQ8RsgwJGQy2RhGaooqB4awkxqhg
DAxVIFA5ODCkhOFThanUUsHrGBmGO2+OG9xWfLvnDD7JHIfOixehzKY+Cp/6KHe9ZXBjuePouPEV
rarQPNzdzherIbe8Cdul3C72Ssx8iQfZ5G3SQ9N+OaqH6l2mUfd29rmUo7Y0akuv0+GaMAq7QEQo
JsLD3CBGPTEwMM65xwwhxCRDWEqidbTwlqWB+2iEIdpY8pKM0JXwq+KAvt05yoBgbXOVmcb85PsC
7bnDbJSrMRnAqFm9BhuOAvqMdTJB/QsUNU6DcRq2OimXHEWgYFHQp0La4FBMI48SCoPSxGERO6dJ
3ufPrFkd8Gc9QXJ68B2wZz1mb8ecH6WDvVtO5+tECsz9T5sQvVXq3mQCOqpfsj1fXHhY/BRuF35I
JO6z8kEPrIKzD/fzQWzsZ/BjAeZ86NP38s4M0/cMZMijuQt9Ojd3JpyNyteofL1OUxX2GEutE8JW
SG0Qr5CTHlQrL6WjQQjvZVQg6BM0gyIMSaIsJlq4qJB/kf/HTvZNQFRu9S+4JsVVcXZ2DMAxww6l
FxLu0B46wxQ22ySDcu5paFWr+eMyfeDracYtaiaDgcc/M1zXfyYJdSIaKwMhbZqHxSgsp64wsHzd
P4Q1XGa8z7kz6zDPX0Q6jzSz2eL9GK/1JaUBSdAn0jiaEFGcjIgpxaL3jCqeIgaIRZFFRxQDJsRM
Go8s6FQ+4Bg5prirBnXIY0kv2rFYujvFYWVqtK1+Ndnx13nDC7jOXm8b7FVz+WhyVweHj5L6Aqgv
YF1JOGBbzavE+uqoe6kTwF52WkbZQqGZDWkGmyR/ifOLIk0oSZ/iouDpU1/ApNbuE6jBeQ9j0Rkd
xh2iTiAdlEAyPIH7M0heRCA7+yWH4sKPewzF/YJ1KoucNcphB3vgwLjEhnEcKJPEYOjcqgjTaHUg
SoMWFbXkIiCYWs1JtLiXgwNrD8VdPS6jccFAzVs3bK443sfZH33mXHGcDRT00LlHMSb7HXePr9X7
WMB+kSrBmaA8bR+5oaDGBhBo1kmGnQe91TqniHJCE46xi0Zo2F9iGTn3L3d02Jdzk9ku6e/2Ceil
snhTzNK/vdSf2zqj2X4023/90T5OKthOMgm6hwshmhiskMgaFLUOFHEYuSA+nbtFaxyHqhYbQR2V
LlXtuuls5cq8Waw9uSrEm9mbWQMfupUh+wQGVA0Ume2zo0Tqv9sukdEjvqLLuwRnPQ93nyQu4JL1
9ZMQw2KWXCr418tZQQ8OmnKJP9ZVY9S4Ro3rFWEMwEaSgy7lIg0iRK+jiB5kNHHWwlBdoJ5YDgqX
tzCRXEFlLSiIbmyTGNcvcZaoCcKmw8SDeaqyAuBrdPMM2kgGEfg+vbNnoC9beWpGcpqnUTEbFbOv
359CJihkTGMQTAhDTeA4MOhcWiUJcHPkUjhjrMEcKwMTSLTGWCEcKLVKd/dUPWDhraNEk4sb+dOe
Wnwttrz8XX6zJT9cxdAH6MgNpv4oV9g8iH2PjCIuFw+1xB/dXTNYe4q19XL6UCYxGfpUoIJEBs0n
Ga9LDUiXZRvz+0Y3yubtMmKxfEWe37wAr/PsekIuyj5Ku3n192Y4g/3Ag8O9Bkd3HVXdbo4PqiOO
qqvBBlzi+qW+ckc43yaIalbRgEvsv2ouRCbqxcNUVfu5r2qEsjoQ0c2xjYcb40o14EoFi1KaDM4N
kspha2EhQpooTeCaQ4OwYoloAg1RRhyUDDDlzmMmQBflO7Dgbocb7dGbOfnT7QP8dqfvZlNXqq8D
5sDcnoey3fGirrgMo/Pzfd6dJLaTFYdvK6ZPmRrqkRIyt0Tyq1mGNHpPjaF6ay9IXTnZSKjNCSvN
Q6uOUnHbGDdSjNVqkkoIsX6DxAkcP79LEPSPKslF8kXCpmdsqHFuVpnNN8Ty8KoBk7Zxqmq6ea0m
rVYu3m+cKRFA+R0msH0pN98rze0Rmcd+PhozRmPG6/SBIjAnKEaOEPIqUm+VkoJyaiLhiGkWuHU8
wvRJ5CMNTBOjjHGRSEG4ZKeNGe+Xi/ndZbnnOGXWaFtNtqkPQZBvLkkzJ2jeGEwm1Ycp3hQ275XM
RZFTIP59+m5SNZDePT/PT3cl2zptPe3lEM1Q0KMdZLSDfPWpgC2hFMNUCWMdRYqioEj0DosQBcLS
BxABFjnDjLUiEKQUJ1AkA0agXfqudpA+PF9LfFoye/n3eY6vzB592P6lyVLfhSV091ClR30/XYWi
Och0Jpbp36Chrvaypb5flM9XHU0nRzwrzex2NSg6qu6udzH92X2ABjmR6wM+pdSoNY5a4+u0QBDN
UEgwh1hqoqKwkUZBtBYaBRQwZ1RwTbCjgjlkGZbKcMwJChQz49QAyUVL6baDVkkeRqy8tDnjYJl+
EC7JLjBxPyilkvK0WQM/W4Mc1uAbl6cH6LK6eX8P0wZvfN94wUMFU7wtbM1zP7+V/r4t/K44jalW
K43L7W7T2GqVE97jPLn777lXjdHQo9b6CpKBIEYdccR7a6XBiKKEV2c99lxzZDVK/dBoIw9EEekJ
jTAwEkBQBeO17Qz8v5M7+Uztb+vEpLS8tJtUp39bl4InX4LQmMyrcJ3qnb+tt3KlWQU/X4UcVuHl
/Ub25JtS9kyy8Km9sRU+25KG7NmWZtGzvcuSZ3uXBc/2LsudS1zetkmdLslXzSwlVIXy0oHsIenI
oEgvpxt8na66sD6BLPsfyymw9KBHiXjfdnmYQODZGi9JaJcAUAc5RcOHh2HPFbBna/BeyLo/1zi6
FHzsOMZtwbgteEXZx7FzsBXAGlmM0yocgzRM0uAw1dYIITEC/T9Gox3XCKvoMKZMsOAZi0y9KJK9
KeMnT/ii+JCSkRP4hH9PFD5pfbfwhBM2+ocUig4P4O8TyQU0FeTA9ieaC1KKgw+b/AbT5NDcvo1I
vF8WBlArW55nYT0m4RrFwFfuIAszSClwvAouek88Ndpak9KbeCcYjIL54EFBjwTulTEgAzDjAv4j
VJLYWRc/4HhgeOB3YHfg9sTsW7e3xO9Q4Q2w+yU8ePtE4JJeApu/faJwiS+Bwc+Log5jVLF5w6lu
YxZOrH6+fZLZvb1eYvmPg53Moyve3wdQiZdZL15XI02eOaB3TH3CmUguOkAsLd4tpsmUbJaVHbmb
wszbs1+Hp3WK9L8tI/yH9L07+2uJi3RRnCXvwJzy9Cks3XQFMwU371K/UxfS9Woxyz5NZy/JeHB9
rMlB8roOMhrRZzRVj18S/boP/bv2b0ZFeVwhX6fXhWNaS1gEqZTKCKY0w8ZoGG9EGimGZEwTiThz
xMDi6KJD3oUQWPQEefSS1LVN0Z4gZi6K2UHS2uuQD01zzhSokpaYBEgTzlMi2lkTsOmzZpcdzcwj
4/6Mqq3gTimDYf44CYSjYCgWEroknsMoXEQGVFgTkoHZBaed8DC+qCmCne8uV8hzqu0xJl12ZtOr
xKb7YR+9s74uNpQUq3fBTeM0+GI1/XtI9tmStlUZ81GioeeAj92zIq/+HU23vD3b62yxWt2ahwQT
NWiiV3SQQhUT1MPfIPuDDeLj0JLdtU8yVzQIvgv0eUBH8gnskU0HjSgso0L3ahU6Q6nVSgWCmIAx
eJ0gHAK1mEDL1hktg9BUK8YoxyxESzwQxUV0mptnYoL/dDomeCchJyCpH80MHq/WF8XKAI3lg41+
B+tDrbT4rqi9UDNYVo+vGpUv65UPTB1lpVPmz9GDdlQSX4kvAlDtoxYWYecsZUJimEaMlOTKqWhB
dQwOcw7Tq5UPBhkmZZBJeUzp9jpHEh9h/AbfVyrgNE7qvPx9nZd3emUHvm8qlBXX58KS65cnvOaf
VTfvzTrrkas8tg05ILR23rFV2b2p6qRet+jy0FtHZZOf8BN4WMzX98nt4Lb0Pfh5gPv+Azh9EM2u
e5f/lETQEH2Kj+9z1BtHvfEVnZhDZ07L6BihzMCC4KK1zPlIpUQoBVoYZpWgDm6J48o77Ww6MA9E
iegHSFPYLvImmwJS0xy3ZdlTLR0+NUroQQlPJZNGkTw/LFMtZSlZ22EhOT9UK7MAOaV3lhLml654
jrJklCWnZYlRghhBBIpUG4NxjLDb5FpyYnQQMIteC2EDltRbpizmUaJglNbGEappz2P3kxJjo3Ju
y66umvLi6oru3fO9e7l3r/buMdovIOf72mdSoY7rpntyoYub6sGRfKmTZio2EDgObsx0viooLrz5
sKoO6TvqpeJIhqKfwnIVKnPwbbKyDnom/z+DTye8f1qGkM+C/xF0tPT5v+5hEsoC4348u+lzzuvD
/0xvzkNY/imfKz/O/jF/rqf3/ytd/OgMlAx0jv3D4j5Tbh7MLH3+sAj58y4slnehH+Xz+8UP+UQc
GsufobwPd8tFuBuM4jSjmdKS8gez/NCPTpjATNeG3g8p59N4qD6uf68Vl1HAksZBW+ZGxUgjpTpQ
S4LwxlquDBMxBGUZTKNRRDpiQMUOSBrQuhEjL9elW8T0pLxOl4dn7E/X3357SW52+G67yuMJ+2g8
fZ07YkSAYOxgXwxv6xiV4gFBe4LQ5CKqg6QM0YA89I+IFNZp2D5zqrAFvmfdkzI9w6vLVm7FR7j1
xefsFT3bU/WcYGmHovixh+rtGS//aTr3t/86HRKx6/oa31wUGVB683lR0Js+Cg0eRrNKfW9oqV2S
EgSwH0Xp9WGIOns6S4TAR9LUGtfw5+9nvehKjY163qjnvcoVQsNkOReZ4dAKdVgYooiOGkjHRgSp
NawgMoKCJ6D7lCUZI6FpFDrlfcJiGMiqjQidzHaa3cN0/i9JVl+lq8nkqQbcC5VGPKlRoXuF7Arb
r4Adi1R5mBjtJehxmlhuQ7DMBeONiBYbG4GfkaVUCGDVoCX1KbM5Cl0VuiZD7iC193jyvMmUB8DY
ZfUXgWOvHm1W2e7NT0lfgyanD48PyTHzbn3fUW9TR+yAbp1DgG6b6Vle7g/Z4oTYXR8hw/ggHhLR
47h8mDR37AW43iMc1KiRvVKHp+QWT4MDma40BkkvnLOOUe2to5hAD0oxxpD3RGEVlCGOh4A5TKBm
vi3g82M0sqZwnMwuCrsN9y4z0KXsc3bUwkYt7BUmxIUZshHGZXHAQjkXPAsRGyCccUsIjZoYBjOJ
PCFYEQkbKIaUDWnX5G2PXOd7TGg3prScb272xjbwNT8+y9wuu9y2y26qlWiPeP5jGecyrEWsMoaV
CTh4uhSlFeqi0H0NUSlzxXAGsmycA3oyXT0pYQORoctEHVuzYR8y9J5lblS4RoXrFbn6GAralKOG
M4+o1dIILLnEWIM4J07a5GoeXZAxCqy84MYnIY8MkSJSal9+1FmJy7r1qxLp1yC0H66rc5J0XW21
b0Y9a9Szvn4nhIAVIzRway2z2nGvPKYYhhGUMwYjgWFfpJ2R0ihnY9CEplTABFhYYyy76lkN/ts3
YpUsiA5Z8KOAaO7COmtccbpcrTeY5Un1Csbdb4xdHXUv3Kp7Pb57Bz9Ztx4y0uLsr/87I5v0iKQd
Qqs5+8fp3R/M2nz2fuGneJf8v7r3O0brjurT6xTSHENbwillbfDO++gtTCPBEklkMAwleuguUKqE
hjqSWtgnG0pgQoiIVr9cfdpKvORzslGgtoXF1QbFOwvwJL2X6fc1SdgO6YXzZjJfKLqe3hTfXxVn
vzsrYNibku+g5P+c7SX53XXzdttPbfFoEcajvjbqa19r4D6DNiXTyVXAgBzgHPZMjALxsH+SMk2v
hCFoLxyTyCfPNM0MdwzUu4h159PJfYZfHrI8qqf7bWf6RnrfDoy/z+uN94/zew+QwhyMm7TD3Ezh
zCoUwAFJNw3Lhhdb6b3WUU9sx4Jxiwc7necfzmr4IIhFnu7kjbUswyHuNuEQNoVD9LFOXWf3rqrB
fJ2a3F5Ak/VnZT+1y9bnFV2HJXu1S2K3V21P603VC47UrdHXLDpZv62TY3QPFFLR+r3B5/tNGIud
VUEXm457f6d7X8GR7+fwOzgyFc/MW0l47fLwYbOpvbLW6jvimkXHKx/p49T3ncOFdpeHD/enoFHW
Wr0+qfWi45WP9PEc3dtfTFvZiepHujvxnRzWaRnk8W/peJWTdBwff52bm+Jwr6jW/n5h+wu7ce2V
nah+rJ9n6W9+gfuFp1441uWJ77ClUttgj3+LJ+qcpqXLPNQ4cb/w1AvHp/4on7ZUav/Sj/HuiTqn
aek+D8d+GCd4/FSl02R1+s2ckgDP1urVZHd62+fzk63Rn2tJHm5J+pRi8nOw63hwOlr+XqkzsrPR
EuYcd0HiKKMQ0hvFCHSKqfcRKWWMRIzKoGAwUXBiAlIRO8m5tC8BXj7YvU7SH1wDWEk7/bIsoSy3
ZBgBiXezH5Z2szMahFnacB/p5xp/e9OET8ktvE0gsrOL9O7b4rqsiW5uxvjT0SD4KiUECZIaFyXC
gTCGjOMcBctNhH+GIW+BIEWCtypBeMpIOJPJWc5JYiWXneNPj0uDZZs8KDMOLdslwvJQJiz7SYXl
Cbnwti4VXhznmh34zGxWvFusVlM7Cw3Kcm7s+1pm7OzhtwuD7Wg+pK3mwwfzdLt6tGa5NB/SN+8f
h/X3wxfFJYF/9KJA2c3vUqWSHhotxmQQLVuUVFxilEnpRYIaJJDiOs8EK/svZ6UHEWo8mx411Nfq
2hccUsEQrISx1AYsdMCMSEo0JUh6AuNgSHAYJw/aB6OIllRjhhjCyLz8bLpNTE7gbqM8poSvaWVK
RVWMHbwR5j7hKNwDZ+5ybj9M53sP8O6N1eI2muUuV3ecmbvaXfMQDKTIfO/UG/rPh18NRbmdnP2S
N9XLe+8dUJtCBvdLN+9eFPi8+X41gNqRepjt6NzLGdhOKH6OokbjDbTD9N86PLw7HG6H2ekxykOa
cq+HUzqN9a/5u/2OW+Zi+4toHQC0V84wTGQ+66y/0rpdQs3Qzm31MQfjuI/56h1RCUZcCwlz443k
8CcwQ5RhWsrgoVViLSWYmKAd0lpwo4OJRITggqC8c0L0E6tFzgjeWC1ySZvUKx+0SLvtG7XVIpdt
V4vyrnW1qDKU760VVWkbIUfXid07bWtEcVp8bl/eLhBVyeHycII2fIqIWpMV0GVZ88iCcHoKug7n
uZVgN/2TUwvB+d6wj64Cudbzq0DV2HYNqCemb1sD+kSdwfs5lr/6oRebX/5m31ph1KeijltVdgKI
Pm+LBtyh/r+z308D0Fb8Z7gzZ98WGPZlZ7+beSD59yC6lmE225T+f2XFP0F7yw+bwr+mwlD8fvGU
S/7rIIMS+hmw5j/5oMjnx+z/1GPiIz7/uBsftagOWFOICWwDV0warxJOqMdBWIpAp8IhWsa8Bv3J
RHgSjXceKxypIAxI0pKEF50X7daAiZ+6dW0HvLX0mtks4Uz9tyvYlW9xbVLlb0qUwMn5HuzUeJIz
7oBeCe9SagVWkmlgW6GMjlZHxZDwzsGswigQJfDBGHbaYUOjpgn5wBFBDJXI9cPD3+fTZQunPiUN
9SijDpCsswSoT5uK2azCCc0J4VfmIZS+2KlLqGyWXfXT9kRJfrl4dwvK/vrDoOqpw6CvbNDoHUk3
W0x6R+E24bX8V3fl5USL/zWMnnbYfiJxAHKHpG9D0iATemQOR71w1Atfz9rCYCSOBiwNU9JYxy2s
KTpyg5BVCBOthcJEaBFClJwT7KHfGLlTiGEayDCIVzspnBeerStRvoE15//9GD58W64DedGB24vq
tlp98DcpPBxWn7RoVE9WKV1JKRhGrKxRcXyFR7CIYk65Rk442MQRiyyGmWSMR2843EYqDaxuilnv
qJfYk6AVAv1SeoS87qo4trBv1gAb7Lvj3smOfc+78m8dayvX76VOJgKLTGBGkWikep/3VyXbseh9
cNMHM7tdL27/za3NbFhU0+5+L+QzJ9scpD9Ku3fI8Kiujeraq5ToIL9FOvLUxgsbBaYGeyytg46Q
RTwiZkEvw1xBL1gSaxkMyakEpGUZCwPgZe1LuUkq+Mvjw0ZlW6RCuN+5eOTQauDhXYn/ywJuqhfL
ovf3MNBN0aHT+IOZzuF3t3ur+HWhdhW2nb69qlV+s+16V7NGzPbyTYHRrsamg9/85mrTRbXubHoZ
dcdRd3wFASZGaBKUdtCWhz2i95EZJTyhmhERYJuIJObayOSOAaOWUQaDlSbRYtU9CecJebI8kChb
ZIm6TPntprAhVralpWTZNJsky76beCUvGrLlt/UqGwrq0uXNhoRGzU3hTrq8wahRoyFefrtvKp1s
ujr/OBAL+NEs15s53STyhCe52eq+o5KrjrqefwKPc3oBMhiV6LJwyVHGiL346GTsjKNhoPwTriwj
QBWQBVNSKHTzImx/IrgYiLLkE0+ANH1RUJg/goHKNIXwKQ6pVD0UeixBtKCTruuP89Xju3eL5Tr4
2zh9gh9v5mj4hYXl1BUz+I0u4RcXnlwIfgW7rlVhgSN8t9+ePvXbi9Ohgx14CSOcQx1EBXG8P389
9id4mO+XZEpkJo9l8g6p6rFNk4P96ESGO2Y5HONikG3juIkbN3GvKDOktlgE6xCXIQVIWEypMTww
bKl2ThrpBPZaxmit8VQiKgkPlDKqrGDCnd7E/c7754IiSiE6eQeSOlwUP+7HQ+TyytsiTuegnJUv
pIC862SO2x38ll6q8/MSofXDrujH4rLA5zetIRDls9r+Lj3/od7cnkv9NMLr2U8yV2wJQNgn9Xp6
c/3DzS4I40SowbEojkbTzfH+cN7SRlb/HpfL2zx90E7+TFRcVpdP6bJJZZqJG3jQ3tx+4MGu+SP9
H4xl90bH+UohFAcPMpUXtZabrjiN+j/eXM9z/RfskkEVWJU/5qwzBL/TcsNTcI/5KhrgKl9j818l
ZWOrJv8Z3nv643K5WNar+LCG19LznNgqafJPxeIxowDn7/ZXo5j8YtxeJIZNphJawNCI5DRoSziX
8B/CRmFpubfMeKO09cgzlY4oDXPeYGGZw30c/w8l4rJVJi5fKhXfZqm4PCIX3xa4uTltkYzLDrJx
2Vk6Ltvk4/JZCbnsJCOXHykl3+5Re1nKyGV/KbnsLyeXL5GUl/tycnlaUl7W5eRH+u+n32Awy3kS
k+Wx1uYhCLUfi9V64X4EvdDMVya3s+q0B5Pt2WWM97fvzHT5froa0qF/Uu7CyowyGJ1330ZMYDeS
XMVxshuo8yE2OROy2eOk5Cy4DzGJetgYYRgIQcMQU25LEyUojbQPNfmNND86WQrOxw3XuOF6nTnD
DKGEOeodVpwZYzAzQRjoywuHpTEwHo48KA8BwYChH2Q5lZoJqMGxedGGqy4xJ4lhbteP72r+7yna
7PHdLEwmaTfwQ6kUXJSr/t+n77avXBSbqwx1cugOPx5LjcdSX/+xFLbIMQOzJdMAhdEMJk5b5bC3
VBsMI2TUK2mD8NETldwXo1bBG5uydnbdFBzj2soPace1U9BWuzNtw49pAu2cFx+n/21oS4RO89MW
wKFdIGemddXt5Ee257ZJXd9uj78GtcCnk5+kqyQ7PPyjSZVjLcc/+wGNuLsupIexfgNhF3XbxvZw
YJ+0j8te8yLKSCfKyJhXZ1QYx1XmGdMT85pR5gI3MVBjlNWcwdKCODfYB0l59Io5GzWOGkbLQUlE
BuqayKVBA+TVaUrbBDpxkexQq1rs5MPjbAdQdJhqY1U3Upd10983xaQCavg1NJX+NLFloAqU/eJ1
yZHHRx5/xjlewlYQhpKSRQvDHRGMOC1S+CSwdPJ2CiGC3iiNSCOPCnkXlPTUIEx4NF01yZOcvPX/
KRkUH8+cA+xcFHXjZPnG5JCnM1PvOxZVfP1ReROz0rlzq1zEEhcktbmevptNXf5CCz/9aZrOauyH
Yt5R0yQnMEOSlMxnPT+Fgd09Sl+P0svjsyNi7AjgzTzYnw1nZKcrjtgZ40oxrhTPrhTceE1gACoK
TgNWMgLNGoNayKwilkgYE3IEK88ZMd5Ya7VU8FSwiEPEL8fOqMnCyWwvTfUqO+FBcfKaz3jI5ZqR
IB9n5/k0Kj1MR4vno4lwNBF+/SHNHimLqSCcK5vyIEqKhLVpND4FOaMYrZNIo4AI1jGGZB4EZg5a
cWWk6geXscea+3rXjjuv2rizZM63wJofpZmVMBnv78P6Pvl5b8192bnFLeZrUNlW6WJDYuUCvkrO
AvNFRxRyKVrVNDu9u13Vo2EGU856aCZsGIzvnVbYo286lJsv7acJqlETGzWx15nkNmID05FiHp3k
WFriLQ4M/ljnQZBTxVGEAUmiOZBBsTSaiARmkTDMiHjRQW4l7yYgQre2tVUOS0pSPJcWlxlpO183
l4ExanDUvV7DVon6NE2BgNYFuhV1COYnyDQ+h3zQxFOhlLQOJiwADzOug7ecUId9coXvqnvt8eLW
LAZlNXZ8u2PGbY02huxpCkt61qp0r0uXM1jkgUHLrNUPZjZLN1twGtMfSlfqIwewy9X69g/Tu0Hj
nzDpE9k0hMbDuPjM+l0f5NshsCU+hT/7X8xDOOHOPk/AeGfT+fpsg5sCbDKdNxschePPKhwFwVg5
FpAinsD+lPoARYwwTLXUIDmZTKCOmlkGwzHaEQv/w1QpwamJu7ifLkJEtfvv3oX1bfJPXjj3mNLY
36Yc9wOKkzNv1uasO7ud1St/PIefORj6OvTpOAzTsV1OZ7Mp/MpAzi9nfQiYnn2houY/E6UnZI15
vEuTAm2vHu125UxyZ/G4Xk19yMvipn/gg/XCLWajIPpyBBGikgXGYCzSBm5ENMam/KGYa26RFMpx
ZBzjHklkSBBS+oi40NrglG6jnyBqdyebrlK2jRWIo4FtSPSioCwf76WwAN4WpXzgSaZ/hnPAj6GT
/hx5CT6KUsw/ekpHk9Zo0npF6Y2isyB7JYWZ84hzFLGLDHHQA2EHTWGiYiAq+alIEWH7rJRHyliY
4ADTENRLDhcbMngCnxfF/CJtbWupnFdtcFx5C53YdlttfqRSlkK7xsK6ig4uvk8tH9ZvIym9UJLV
sKmdrppOOE7WgIsdOedjJrVR0nz1kgY7aqx2IEiCVMF7l610MFygACaSKUJigKnVPpLgZRRUCYmQ
55642DmR2impssl8NcmG8y0WVy3NVZYq22rz9kqlVNk1tidWDuo/I1XqibXaql4+I1Oq55eZjsuG
NOkCThvWYfkwnYckIdc5ARlspUxRdtOM40gF76fr+yzAAvy8ZqmF2vPHh242RkVP2Bj/yTj4nU7N
7PYP05+mObn17V/ywfHPhGnLB7EC8s/cIf84M+eo/46r0utZlWI6Ago0iiA5dcJqaQSyMCZiYfHh
IlrFqPciUGuIpbByRW40p9grwiUzL9F/n5N2k6etIrwDr41QvXbXdNSGheCpgWxUVs4fb4ppI6dw
Lvx18bSvOaf/LIjqH5va7nh+PJ4ff/06Kuikia+RipFgbq0imlhJKA4wugBzBXNGY9r8aocpF07B
f5ZoLdOumXYPynie87eufNMGyuyG/3fYrQcyoP5yixRoPEv661YSlMpusY9BU0qDpmPhtHjR+XWe
gGJuoK0dUOz7+8UqZDLzrCQ11G8mJoV1PHXULdtTwS7Dw+KncPtg1u4+nTzlmOQhLb+Ts38Os9ki
pYTyjz6cnV8UULR4nwrMsrr/sHhM9//97PzAiPl8Az2c9K6bXQ1hh52c/dUs16nJRSxpg28y3f6w
gF9E+FCWwZeWysLctw/xf1SVoU56vXqn9kqfIfYnaJiJ+PM6U2xT8q7ciUm3s8X8rrz1Jg8wbZUW
j+v2idh75SG/EZfTj5iGA3IO+x/1+1G/f5Wh1NAqohrmznBBFdUwOQgHy4NO0DpWchaE00IT5uHW
oJCgTmWijglrwzAJxlrXnhKlI/nK4wqnI12TJjbP9erR5hU+fcIav3untI7b7GxTf0Buxmxjo+7+
CqF5mKJcRpg6JWBWggnGy0hCwMwZBuOMlMZIg/Ae/hikGQKtXVCNhDDMdY676cnLNcSej+LlFyL2
lNRWmI0lxRUaT4nWWMPoeb/ohdOj2tOQpYijT6Bbw7TSpNqkTAPpM0UQ99OS8hu1FnKLAymECSu/
aptWbfekDu+oo9X42FDUQZs6tSkuCpk+2d7In6eOVVRtWsgt3nwC/7Hhl5tc69OsCp+z6XHF+QLD
gRzoizCBBMhkmjNtnKJWGimC4phJGxXFEjukgogcOR45FFijHYwWVqR+fmxHvPKX4f8+Ap99uP23
ePsvZSjAgIKXH2xc6wAWfaIVh0nTeEAOz1i5fZA0hgkiOCCEZJzc9P+PDOEc9+XjvvwVZZIUFOko
CYL2GIhFRISW8IPXjMJkEgzNO4y9t0oQxZFS1oAyT5AXmhPBxAAQZy2SczK/SJFSW4izBL+foI3w
JpMIvHPq8K2ROmSagYoSLNL30NLeCdu26ele8o1mF+m/MNu1dHV12FR+4+32lQ3WO5SOXmXjtv+r
h9tAVIHckAGatNFTrohlLEkXhhI4jg9KEoZi5NFKSRlx1GrJBEMBBytF5yO7dnGRpcUORm3D1ehm
dzy3Yehjx3XzvSO3dCS3ERwP85bzuJrsOHi239tWgEzqEqSl0Z0UWR7IkRee9W1mbj9i9SVBqpoc
AQVJedRvV8Es3f0nwW0DhVO9JDXkcHERcpsjIuEX0wOi+ni4DQcvlwwZtEpDocsMkfQwl2afqN8R
/W1UlF+xkcEjZ2lEoBRLJWP0MEAJ+rALLBoerFKKqYT5RlQ0AtRnh0QgGgeJYBKdebmi3JCpE5D3
D9k2fVGky43CWzp0bLPXzUy+S6mrti8keJKt5vwIi8NVLYajTJNctvLdVfl+QjSYJJN4rt7AE56m
tydl9be59nnxm99s0IirVXTb8zXUzytfKtnXng9I2S6ZqXbx3V4ze69XA00EXTaV9oNMf5spSnXf
7mvrOTntiHo8qutfuTgjThAqjTAcESqY4xTx6K1lwXlPvVdROQWTZjmN2GsWmILulImawf6fx+4I
Le1Cq5JZOeRiJ7PybavMusRV3UpM1EI/ssialGz93dVWYtUFVhUG0iaufvMbsnl8VFQV2xZ2BOwC
VP623qbLK6scF1nbKttRbgTW9sleW7vZ2YirdSNOZU9gdTiJLL8KmKJNjpB80rk9fiwxne2H4nGV
zijL7696qeOWoD1l/J3zg+LVHKjZ8ue2PYvPbIUnL4hfH/FtxqXlk7l6aWJ9cuUwWFEcSGBCCC6c
xihYSQg8Dchz52JUUsV0EJdSbEjo3/Ha0tJJ2LQfx/kp/FDW8CNw06Ub1AWiz26eDJLUh/XoUaHP
HSJHx/RAo0nglaYOYUyjiKzABlRjCo1GUJydYNggSRT3OtkEtFGYSVCvPRLMwK3F0F+E915uEtgT
c5PtidnmAeiNtHhTNE3Jm4ejO+q40f36oUiJFBwZyjiwqcMwMhSFwVo4aULkMiKKgpEYMXimgArO
lUGgscA+1wUcum5021gxs93mwRV5s2x4kR6yYZ/Mj1sOT3l4irLTTvszjtohAd1i7sw6zOHf7SZ7
5JAnN2f3m6CqDG6QLu7NT/kzh+AsF+7HHC2TgmZ6+O6cFUVuucJMSG3ChOTWitTUIMcpZ/88bVBe
iwaDjxTh1Y/if55W5EJDsOUORWpiGEprsVhVbFctEgsud0Fe/UhO7W5ODqvm0h4sNTRqgKMG+CoX
FySdIF5Rihkh2Kf1wjLlkueDN8jZoDCROIHQS66sEAiUP54QvaTFhu02ax8FRN8msCfZWFopgWae
oh3OirM9h4dUp3YmUlZLfy9TZfg7baiL8OQFmuLnQCJdzGcftkCjc5CQy6kDqTpd38MSCZcw8N1k
VRilBpaM96Pd6Es6YeUUOsCGaCdRENYpJJUGtuICER2CFpzKaGH40duAMzpA0IRTJbgVSnZO2HOC
b7J+tuObfLvHN8s6c8Hft6nm22kzQAjKewYI1ahKv80jCbxzRp8pfEsJGGqdkJs76nzkaDLvAXU8
eph2+vPmv8boBRQMciiADyBQ+ec1yo+K1KhI/QIBX2AIknjDAvWMEamcT27pGluUDpylZDDByhkX
I4ugRzFOKElpeBnTBisxTHh4EofJ9XzrTZPsZ/Pi18XDGMo92s5eH1dqhxlWSEkboTuc8vQEaSJs
X6jWAlS1ALwYVeAyBOupjUzYxMYxeoJgdH1yYwPfPWzDtBPb/fphL+b6fJik1Sm+ukp/2FF3asfI
NN7f1lIq3qYEQwN7OuNtgF+ZJrpfUFsKhWM5FK5yT8ale/IQVqaSoLJdkTyf+9ClK9dkoAxDK1jc
DJtRezdbO8/sPvSV3uWyNmkVoYlgPWL4jEraKz1KkdJQzBgOjCAMxEPfyaHDRNDSvFM+amMMFMME
K9jC2xCcCAgBgd5FY15k7WoTt40cjCXDJXgPW1ymzTVs281FkRE+/j59l+tef3uJby6KfIm/vTlv
QvRULDtqdqNm97WzsgpMM4ex4VYKQojxCqhO2Rg9okEoojFRziJusFAMBeZgZEQ4BBOPYQ66anan
uHZ5wLdvu3Lt8iTfdrC2AV3t+bDjNggumdo6KojtQJerx4cUo/jvYTkNq0GxILo7oBE+jKNp5x71
MPAS3d3PxKiOjerY64RMpyQQn2DTpEWKcIq0ccmOpkCac6VZcNYxppTB2lvsvUAc9u0swiPiKHm5
+1lDwk3mzWzYx8EZUhhDPYos1X97BbXelP/GlNmjRvb6gFiQZpRymDopFBU0EoqVwqCLeQwbLE0R
TBPRFnrHjinnBXaw5RJRcC2s8l01sgOe3SIQlGyLjuMjlHzbQCyos+6baVW4p569NMe2e7TbRNsV
XvkeYnlXQx4/Akh+u1j6QZPaXIuLAmXjU2mRQtkoleAB+tihRK0Flq2BqPz/YDY8lJuX+UKXBJJm
+88SyTZN6OrlgamkpQ0OGpSshDNAm6kgPY16qZ1NI6WxsIXSEUGxGBEUX9vi4zF1VhMXPEdSheR4
QyzCkmmZEsIF2PozDD0Kk/JtRBMpzLnlwmMZMMx8n5AtjkSrGH4Xlhv9E77kEOPUTcN8PWzo1sXH
b2x/fgcVST4RDbiHi8oY7jXut1+ps6+xhhHGglSgdysN7BiVw4Qwzi3n2IIMhfFZSy1XMN4IkxA5
EyEabBXCLzr+OCIdk7fKj5u99F+TEfUa7WvuPyaAgfObXPzDrnheFrcq++WzegKz5rsP0/lkmnre
r1chvvyQUxjtlWcSr6c31z/cNIEVj+C0NOvDVU7tme4uoYM3tZL80ULEd8WPR9ss84RugXKqvcpf
r+c31z/e/Mz+zn+G955O+DtXXqBQqVg85qCM/LWMvsxfjkJFEiY1DExYiwgNHnvMcaCGKCEt5QjB
hLKQ9CxECRQZ7TWxQWDDlVGdkyCcFgtFCRVyVC68zXKhjm2yJyHqFQ5ExM4a0PLuTkI0q5WZen+o
pzjbAJ3UZUMTDuVItbpIeFtMGrXS/1qExPkBId/VJqreQaL7ZgdK05QPPV27zcw9zpJjdzJn1L6y
ovaVJS4uD57eld9eR5uGPJVk7f1i6YcN4lsGn8LH7pYpx1XKdQXqYU5xdQ/jLguM+zHHn+Ufwtlh
yq1d3W2V7tv4owSU/Q5jcxhklIdVBhhlScAXNcojhH3MGI9O2GiVGa0yr9ApXiCYJh8p7DxgQ2Ed
0th4BBfGeo1VhKmDThBN/2L0NkbYcxgmvaDGCNnPKtMOpGN+CktzF27/zQ8ZKKS/3BTsdBATSw+L
yujAMBpUXqkTGkwQl9p5jbyPHsi21BLOLGyeKEKOMBEl3DADwo4ll1IpNHRNPNJaSflyB4aadNu5
L8C+IMX8kH0bRrUFOPvzHFh46os/px/d2cHzy8qysXrYWRfc4nFeyxZfguzOi++hpNbBplb5+bZu
IsmNwZ+3xXxXOM/RSZcbtN3NcetDQuDNbYyOE6PjxNdvlgWRYGNyVI1GC+OZZSA5KKIkWqWsU9zY
gA0nAQdJZLbWCoQ1wkp5HDsD/DRlRVHLCx+LyfzX5OoK1UtrHDn5268aMuNvvzpvq3aJd64YwO5b
R4xKLGzvS+kxmX9/hfc7zFWv8t+3jdQTNfnReCGLkEuy77Hx8JvflL2+yHGjmrFk2Vh4v/WxXU9n
s62X7e5BN3sHbgcvmi9uF/F29WhXZY6LsPokSSfYi5I7YDyU34bKHhfkgBqOPrOn7vUu0Opwanpo
3ewLhaN9DnnEPN6lCYK2029vwyAJX2TxuF5NfWny2/QPwmu9cIvZaKj/ctzuCA0pK5EJMiG/SWac
tYTBoAKLJJGBEWWUwXSxCI+ACMxwVCRw5yRje3vsf6h+t79aBbeY+yR2CP2GMyIkJpogiiTO8Ni1
H3VeGVJFpqsn78x0WS/+h//6h/8fiUlTuw==
````

### .build/quantization-research/heldout-ifeval-grader-v1/budget.json

Original bytes: 297. SHA-256: `1a30ab68717d27209b33a06db69ef73dd47850d311ba7482443727d4abbd4bb3`.

Normalized bytes: 297. SHA-256: `1a30ab68717d27209b33a06db69ef73dd47850d311ba7482443727d4abbd4bb3`.

````text
{
  "created_at": "2026-10-04T10:01:37.008302+00:00",
  "scope": "Pinned upstream instruction-grader tests and bounded tokenizer data acquisition; no model outputs",
  "maximum_download_bytes": 8000000,
  "maximum_extracted_bytes": 8000000,
  "files": [],
  "model_runs": 0,
  "complete": false
}
````

### .build/quantization-research/heldout-ifeval-grader-v1/checks-receipt-v1.json

Original bytes: 1036. SHA-256: `34976c0211031a8f72105f0636371d558bc02b45ed7409c1b877cc46e9dc0f35`.

Normalized bytes: 1015. SHA-256: `c558ac96e6a0d113936c0e162a2dc7dae315b165a80ddb3032e6312ca17a9f59`.

````text
{
  "complete": false,
  "scope": "Unmodified pinned upstream grader test suites; no model evaluations",
  "source_receipt_sha256": "409682bfceee05fe156626fc4a5c44988971a90095e45bea5539b8ac035bfedc",
  "runtime_receipt_sha256": "c870658033b50630a97ea0b235ede503138fc7bf2e9a0a2243c636ab8a668ab2",
  "random_seed": 0,
  "langdetect_seed": 0,
  "maximum_suite_seconds": 60,
  "runs": [
    {
      "suite": "instructions_test",
      "exit_code": 5,
      "seconds": 0.13920141599373892,
      "command_bootstrap": "import sys,random,runpy;sys.path[:0]=['<HOME>/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/packages','<HOME>/Projects/slotstream/.build/quantization-research/heldout-ifeval-grader-v1'];import nltk,langdetect;nltk.data.path[:]=['<HOME>/Projects/slotstream/.build/quantization-research/heldout-ifeval-grader-v1/nltk_data'];random.seed(0);langdetect.DetectorFactory.seed=0;runpy.run_module(\"instruction_following_eval.instructions_test\",run_name=\"__main__\")"
    }
  ]
}
````

### .build/quantization-research/heldout-ifeval-grader-v1/checks-receipt-v2.json

Original bytes: 1723. SHA-256: `d4db60a11a3f1d32cac1b9129a929a7f7ba6501050da6824da5510135617596c`.

Normalized bytes: 1681. SHA-256: `3ae739ec64bda9cb049a8acdb1304a30c79dcb7976df2dec00ddc462495a2784`.

````text
{
  "complete": true,
  "scope": "Unmodified pinned upstream grader test suites; no model evaluations",
  "source_receipt_sha256": "409682bfceee05fe156626fc4a5c44988971a90095e45bea5539b8ac035bfedc",
  "runtime_receipt_sha256": "c870658033b50630a97ea0b235ede503138fc7bf2e9a0a2243c636ab8a668ab2",
  "random_seed": 0,
  "langdetect_seed": 0,
  "maximum_suite_seconds": 60,
  "runs": [
    {
      "suite": "instructions_test",
      "exit_code": 0,
      "seconds": 0.31545895797898993,
      "command_bootstrap": "import sys,random,runpy;sys.path[:0]=['<HOME>/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/packages','<HOME>/Projects/slotstream/.build/quantization-research/heldout-ifeval-grader-v1'];import nltk,langdetect;nltk.data.path[:]=['<HOME>/Projects/slotstream/.build/quantization-research/heldout-ifeval-grader-v1/nltk_data'];random.seed(0);langdetect.DetectorFactory.seed=0;runpy.run_module(\"instruction_following_eval.instructions_test\",run_name=\"__main__\",alter_sys=True)"
    },
    {
      "suite": "instructions_util_test",
      "exit_code": 0,
      "seconds": 0.14997133397264406,
      "command_bootstrap": "import sys,random,runpy;sys.path[:0]=['<HOME>/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/packages','<HOME>/Projects/slotstream/.build/quantization-research/heldout-ifeval-grader-v1'];import nltk,langdetect;nltk.data.path[:]=['<HOME>/Projects/slotstream/.build/quantization-research/heldout-ifeval-grader-v1/nltk_data'];random.seed(0);langdetect.DetectorFactory.seed=0;runpy.run_module(\"instruction_following_eval.instructions_util_test\",run_name=\"__main__\",alter_sys=True)"
    }
  ]
}
````

### .build/quantization-research/heldout-ifeval-grader-v1/instructions_test-v2.log

Original bytes: 10776. SHA-256: `ed1abcc0ad10493974e6f2a56b9ea76353940159f00c6396121e4cdc40c4c26a`.

Normalized bytes: 10769. SHA-256: `5e72c25dfeb6a8347694cbff553cd00bcb6a585ff43b42d69fb24312a0c1ac7b`.

````text
Running tests under Python 3.12.9: <HOME>/Projects/slotstream/.venv/bin/python
[ RUN      ] InstructionsTest.test_capital_word_frequency
[       OK ] InstructionsTest.test_capital_word_frequency
[ RUN      ] InstructionsTest.test_comma
[       OK ] InstructionsTest.test_comma
[ RUN      ] InstructionsTest.test_constrained_response
[       OK ] InstructionsTest.test_constrained_response
[ RUN      ] InstructionsTest.test_constrained_start_checker
[       OK ] InstructionsTest.test_constrained_start_checker
[ RUN      ] InstructionsTest.test_end_checker
[       OK ] InstructionsTest.test_end_checker
[ RUN      ] InstructionsTest.test_english_capital_checker
[       OK ] InstructionsTest.test_english_capital_checker
[ RUN      ] InstructionsTest.test_english_lowercase_checker
[       OK ] InstructionsTest.test_english_lowercase_checker
[ RUN      ] InstructionsTest.test_forbidden_words
[       OK ] InstructionsTest.test_forbidden_words
[ RUN      ] InstructionsTest.test_get_instruction_args
[       OK ] InstructionsTest.test_get_instruction_args
[ RUN      ] InstructionsTest.test_key_sentences
[       OK ] InstructionsTest.test_key_sentences
[ RUN      ] InstructionsTest.test_keyword_checker
[       OK ] InstructionsTest.test_keyword_checker
[ RUN      ] InstructionsTest.test_keyword_frequency_checker
[       OK ] InstructionsTest.test_keyword_frequency_checker
[ RUN      ] InstructionsTest.test_letter_frequency_checker
[       OK ] InstructionsTest.test_letter_frequency_checker
[ RUN      ] InstructionsTest.test_num_words_checker
[       OK ] InstructionsTest.test_num_words_checker
[ RUN      ] InstructionsTest.test_number_bullet_lists_templated=
  A Markdown bullet point is a way of formatting text to create a list. To
  create a bullet point, start each line with an asterisk (*). For example:
  * This is a bullet point.
  *(no space required)Another bullet point.
  * (no newline ending required)Another bullet point.
  markdown bullet points are often used to create to-do lists or to list items
  in a step-by-step guide._num_bullets=3_expected=True
[       OK ] InstructionsTest.test_number_bullet_lists_templated=
  A Markdown bullet point is a way of formatting text to create a list. To
  create a bullet point, start each line with an asterisk (*). For example:
  * This is a bullet point.
  *(no space required)Another bullet point.
  * (no newline ending required)Another bullet point.
  markdown bullet points are often used to create to-do lists or to list items
  in a step-by-step guide._num_bullets=3_expected=True
[ RUN      ] InstructionsTest.test_number_bullet_lists_templated=
  Check that inline asterisk (*), *, will not be counted. Only * that starts a
  bullet list will be counted:
    * This is a bullet point.
    * Another bullet point.
    . dot is not counted_num_bullets=2_expected=True
[       OK ] InstructionsTest.test_number_bullet_lists_templated=
  Check that inline asterisk (*), *, will not be counted. Only * that starts a
  bullet list will be counted:
    * This is a bullet point.
    * Another bullet point.
    . dot is not counted_num_bullets=2_expected=True
[ RUN      ] InstructionsTest.test_number_bullet_lists_templated=
  Here are three bullets starting with asterisk:
  * I am a large language model, also known as a conversational AI.
  * I am trained on a massive amount of text data, and I am able to communicate.
  * I am still under development, but I am learning new things every day._num_bullets=3_expected=True
[       OK ] InstructionsTest.test_number_bullet_lists_templated=
  Here are three bullets starting with asterisk:
  * I am a large language model, also known as a conversational AI.
  * I am trained on a massive amount of text data, and I am able to communicate.
  * I am still under development, but I am learning new things every day._num_bullets=3_expected=True
[ RUN      ] InstructionsTest.test_number_bullet_lists_templated=
  Here are three markdown bullets:
  - I am a large language model, also known as a conversational AI.
  - I am trained on a massive amount of text data, and I am able to communicate.
  -I am still under development, but I am learning new things every day._num_bullets=3_expected=True
[       OK ] InstructionsTest.test_number_bullet_lists_templated=
  Here are three markdown bullets:
  - I am a large language model, also known as a conversational AI.
  - I am trained on a massive amount of text data, and I am able to communicate.
  -I am still under development, but I am learning new things every day._num_bullets=3_expected=True
[ RUN      ] InstructionsTest.test_number_bullet_lists_templated=
  Paragraph 1
  ***
  Paragraph 2
  ***
  Paragraph 3
  * only one bullet point
  _num_bullets=1_expected=True
[       OK ] InstructionsTest.test_number_bullet_lists_templated=
  Paragraph 1
  ***
  Paragraph 2
  ***
  Paragraph 3
  * only one bullet point
  _num_bullets=1_expected=True
[ RUN      ] InstructionsTest.test_number_highlights_response=
  Sure, here are the numerical methods for solving partial differential
  equations highlighted with Markdown:
  *Finite difference methods
  *Finite element methods*
  *Boundary element methods
  *Monte Carlo methods
  I hope this helps!_min_num_highlights=2_expected=False
[       OK ] InstructionsTest.test_number_highlights_response=
  Sure, here are the numerical methods for solving partial differential
  equations highlighted with Markdown:
  *Finite difference methods
  *Finite element methods*
  *Boundary element methods
  *Monte Carlo methods
  I hope this helps!_min_num_highlights=2_expected=False
[ RUN      ] InstructionsTest.test_number_highlights_response=
  There is allowed to be *two different* highlighted *sections in the same*
  line. **This is also true** for **double markdown highlights.**
  _min_num_highlights=4_expected=True
[       OK ] InstructionsTest.test_number_highlights_response=
  There is allowed to be *two different* highlighted *sections in the same*
  line. **This is also true** for **double markdown highlights.**
  _min_num_highlights=4_expected=True
[ RUN      ] InstructionsTest.test_number_highlights_response=
  To highlight text with Markdown, you can use the * character before and after
  the text you want to highlight. For example, if you want to highlight the
  word `hello`, you would type:*hello*, You can also use the ** character to
  create bold text. For example, if you want to bold the word `hello`, you
  would type: **hello** _min_num_highlights=2_expected=True
[       OK ] InstructionsTest.test_number_highlights_response=
  To highlight text with Markdown, you can use the * character before and after
  the text you want to highlight. For example, if you want to highlight the
  word `hello`, you would type:*hello*, You can also use the ** character to
  create bold text. For example, if you want to bold the word `hello`, you
  would type: **hello** _min_num_highlights=2_expected=True
[ RUN      ] InstructionsTest.test_number_placeholders_templated=My [adjective] [noun] is [adjective] [noun]. I [verb] and [verb]._num_placeholders=7_expected=False
[       OK ] InstructionsTest.test_number_placeholders_templated=My [adjective] [noun] is [adjective] [noun]. I [verb] and [verb]._num_placeholders=7_expected=False
[ RUN      ] InstructionsTest.test_number_placeholders_templated=Sure, here is a short template with 5 placeholders:
[Name]
[Email]
[Phone]
[Address]
[Website]
This template can be used for a variety of purposes, such ascreating a contact list, sending out surveys, or creating a sign-up form._num_placeholders=5_expected=True
[       OK ] InstructionsTest.test_number_placeholders_templated=Sure, here is a short template with 5 placeholders:
[Name]
[Email]
[Phone]
[Address]
[Website]
This template can be used for a variety of purposes, such ascreating a contact list, sending out surveys, or creating a sign-up form._num_placeholders=5_expected=True
[ RUN      ] InstructionsTest.test_number_sentences_response=xx,x. xx,x! xx/x. x{x}x?_relation=less than_num_sentences=4_expected=False
[       OK ] InstructionsTest.test_number_sentences_response=xx,x. xx,x! xx/x. x{x}x?_relation=less than_num_sentences=4_expected=False
[ RUN      ] InstructionsTest.test_number_sentences_response=xx-x. xx,x! xx}x. x,xx?_relation=at least_num_sentences=5_expected=False
[       OK ] InstructionsTest.test_number_sentences_response=xx-x. xx,x! xx}x. x,xx?_relation=at least_num_sentences=5_expected=False
[ RUN      ] InstructionsTest.test_number_sentences_response=xxxx. xx,x! xxxx. x(x)x?_relation=less than_num_sentences=5_expected=True
[       OK ] InstructionsTest.test_number_sentences_response=xxxx. xx,x! xxxx. x(x)x?_relation=less than_num_sentences=5_expected=True
[ RUN      ] InstructionsTest.test_number_sentences_response=xxxx. xx,x! xx|x. x&x x?_relation=at least_num_sentences=4_expected=True
[       OK ] InstructionsTest.test_number_sentences_response=xxxx. xx,x! xx|x. x&x x?_relation=at least_num_sentences=4_expected=True
[ RUN      ] InstructionsTest.test_paragraph_checker
[       OK ] InstructionsTest.test_paragraph_checker
[ RUN      ] InstructionsTest.test_paragraph_first_word
[       OK ] InstructionsTest.test_paragraph_first_word
[ RUN      ] InstructionsTest.test_postscript_checker
[       OK ] InstructionsTest.test_postscript_checker
[ RUN      ] InstructionsTest.test_prompt_repeat_answer
[       OK ] InstructionsTest.test_prompt_repeat_answer
[ RUN      ] InstructionsTest.test_quotation
[       OK ] InstructionsTest.test_quotation
[ RUN      ] InstructionsTest.test_rephrase_checker
[       OK ] InstructionsTest.test_rephrase_checker
[ RUN      ] InstructionsTest.test_rephrase_paragraph
[       OK ] InstructionsTest.test_rephrase_paragraph
[ RUN      ] InstructionsTest.test_response_language_response=The response is English_language=en
[       OK ] InstructionsTest.test_response_language_response=The response is English_language=en
[ RUN      ] InstructionsTest.test_response_multilanguage_response=Desayunamos en McDonald's hoy_language=es
[       OK ] InstructionsTest.test_response_multilanguage_response=Desayunamos en McDonald's hoy_language=es
[ RUN      ] InstructionsTest.test_response_multilanguage_response=Today we visit the Louvre_language=en
[       OK ] InstructionsTest.test_response_multilanguage_response=Today we visit the Louvre_language=en
[ RUN      ] InstructionsTest.test_section_checker
[       OK ] InstructionsTest.test_section_checker
[ RUN      ] InstructionsTest.test_title_checker
[       OK ] InstructionsTest.test_title_checker
[ RUN      ] InstructionsTest.test_two_responses
[       OK ] InstructionsTest.test_two_responses
----------------------------------------------------------------------
Ran 41 tests in 0.097s

OK
````

### .build/quantization-research/heldout-ifeval-grader-v1/instructions_test.log

Original bytes: 193. SHA-256: `9d8599d28fd40a02a8810532cfe0f4f2b97cedf8922d5333b5db9ecb4fa8d9fc`.

Normalized bytes: 186. SHA-256: `e8e6511c0d029d0c3d39401174acb85e868c93f3ee1c631c64bf46c10a72cf8b`.

````text
Running tests under Python 3.12.9: <HOME>/Projects/slotstream/.venv/bin/python
----------------------------------------------------------------------
Ran 0 tests in 0.000s

NO TESTS RAN
````

### .build/quantization-research/heldout-ifeval-grader-v1/instructions_util_test-v2.log

Original bytes: 1337. SHA-256: `415ff59cf8a4dedf0ef0cc355e0ae1b18b243f40e4dcd0c3a4a23f4f0f8a0855`.

Normalized bytes: 1330. SHA-256: `28aab184bb66803489a13e10bc3e62ce4831c5777043ccc6111a6b505c36fa62`.

````text
Running tests under Python 3.12.9: <HOME>/Projects/slotstream/.venv/bin/python
[ RUN      ] InstructionsUtilTest.test_count_sentences_response=xx,x! xxxx. x(x)x?_num_sentences=3
[       OK ] InstructionsUtilTest.test_count_sentences_response=xx,x! xxxx. x(x)x?_num_sentences=3
[ RUN      ] InstructionsUtilTest.test_count_sentences_response=xx,x. xx,x! xx/x. x{x}x? x._num_sentences=5
[       OK ] InstructionsUtilTest.test_count_sentences_response=xx,x. xx,x! xx/x. x{x}x? x._num_sentences=5
[ RUN      ] InstructionsUtilTest.test_count_sentences_response=xx-x]xx,x! x{x}xx,x._num_sentences=2
[       OK ] InstructionsUtilTest.test_count_sentences_response=xx-x]xx,x! x{x}xx,x._num_sentences=2
[ RUN      ] InstructionsUtilTest.test_count_sentences_response=xxxx. xx,x! xx|x. x&x x?_num_sentences=4
[       OK ] InstructionsUtilTest.test_count_sentences_response=xxxx. xx,x! xx|x. x&x x?_num_sentences=4
[ RUN      ] InstructionsUtilTest.test_generate_keywords
[       OK ] InstructionsUtilTest.test_generate_keywords
[ RUN      ] InstructionsUtilTest.test_sentence_splitter
[       OK ] InstructionsUtilTest.test_sentence_splitter
[ RUN      ] InstructionsUtilTest.test_word_count
[       OK ] InstructionsUtilTest.test_word_count
----------------------------------------------------------------------
Ran 7 tests in 0.010s

OK
````

### .build/quantization-research/heldout-ifeval-grader-v1/punkt-source-commit.json

Original bytes: 3119. SHA-256: `bc9a097dbce842675f83e46c29f296ec98580c98e3ed60b04a0caf8a15bec15c`.

Normalized bytes: 3119. SHA-256: `bc9a097dbce842675f83e46c29f296ec98580c98e3ed60b04a0caf8a15bec15c`.

````text
[{"sha":"4f15a3d89eefe9748ec1c05be495d91289197155","node_id":"C_kwDOAEFbftoAKDRmMTVhM2Q4OWVlZmU5NzQ4ZWMxYzA1YmU0OTVkOTEyODkxOTcxNTU","commit":{"author":{"name":"Eric Kafe","email":"kafe.eric@gmail.com","date":"2025-02-17T18:33:53Z"},"committer":{"name":"Eric Kafe","email":"kafe.eric@gmail.com","date":"2025-02-17T18:47:21Z"},"message":"Add Malayalam to punkt_tab","tree":{"sha":"f5f8a56fc7b3a0c63f84c276b0341474a8952ddd","url":"https://api.github.com/repos/nltk/nltk_data/git/trees/f5f8a56fc7b3a0c63f84c276b0341474a8952ddd"},"url":"https://api.github.com/repos/nltk/nltk_data/git/commits/4f15a3d89eefe9748ec1c05be495d91289197155","comment_count":0,"verification":{"verified":false,"reason":"unsigned","signature":null,"payload":null,"verified_at":null}},"url":"https://api.github.com/repos/nltk/nltk_data/commits/4f15a3d89eefe9748ec1c05be495d91289197155","html_url":"https://github.com/nltk/nltk_data/commit/4f15a3d89eefe9748ec1c05be495d91289197155","comments_url":"https://api.github.com/repos/nltk/nltk_data/commits/4f15a3d89eefe9748ec1c05be495d91289197155/comments","author":{"login":"ekaf","id":4782556,"node_id":"MDQ6VXNlcjQ3ODI1NTY=","avatar_url":"https://avatars.githubusercontent.com/u/4782556?v=4","gravatar_id":"","url":"https://api.github.com/users/ekaf","html_url":"https://github.com/ekaf","followers_url":"https://api.github.com/users/ekaf/followers","following_url":"https://api.github.com/users/ekaf/following{/other_user}","gists_url":"https://api.github.com/users/ekaf/gists{/gist_id}","starred_url":"https://api.github.com/users/ekaf/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/ekaf/subscriptions","organizations_url":"https://api.github.com/users/ekaf/orgs","repos_url":"https://api.github.com/users/ekaf/repos","events_url":"https://api.github.com/users/ekaf/events{/privacy}","received_events_url":"https://api.github.com/users/ekaf/received_events","type":"User","user_view_type":"public","site_admin":false},"committer":{"login":"ekaf","id":4782556,"node_id":"MDQ6VXNlcjQ3ODI1NTY=","avatar_url":"https://avatars.githubusercontent.com/u/4782556?v=4","gravatar_id":"","url":"https://api.github.com/users/ekaf","html_url":"https://github.com/ekaf","followers_url":"https://api.github.com/users/ekaf/followers","following_url":"https://api.github.com/users/ekaf/following{/other_user}","gists_url":"https://api.github.com/users/ekaf/gists{/gist_id}","starred_url":"https://api.github.com/users/ekaf/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/ekaf/subscriptions","organizations_url":"https://api.github.com/users/ekaf/orgs","repos_url":"https://api.github.com/users/ekaf/repos","events_url":"https://api.github.com/users/ekaf/events{/privacy}","received_events_url":"https://api.github.com/users/ekaf/received_events","type":"User","user_view_type":"public","site_admin":false},"parents":[{"sha":"6249ecb30a6d31c3bb28989c6664719d61f74532","url":"https://api.github.com/repos/nltk/nltk_data/commits/6249ecb30a6d31c3bb28989c6664719d61f74532","html_url":"https://github.com/nltk/nltk_data/commit/6249ecb30a6d31c3bb28989c6664719d61f74532"}]}]
````

### .build/quantization-research/heldout-ifeval-grader-v1/punkt_tab.xml

Original bytes: 313. SHA-256: `d8ad712174bbd31a3c1dc424d92d232919e5453c7e520616affbcce4b66e3401`.

Normalized bytes: 313. SHA-256: `d8ad712174bbd31a3c1dc424d92d232919e5453c7e520616affbcce4b66e3401`.

````zlib-base64
eNpNjk1rwzAMhu/9FSIXXwxj97mXrS0ddISm96E1wjV25OCPleXXz3Y3WoGQ9L4Pkl5mPFvUBGZU
Ys5s02fCLwEr+A/GiZToqwUnb4nNQgEOfiQXxR3DnC4+KPGODEMKBX8wHbLO5UpU3etC54uEN2QT
a82pjhvWrs2bmDwbZAlbwzdkG4grs6MwVWMXiKyEfULXwAM6/Ck5Sfjw4Uq6qb2/Lex9SFlniiTh
mGNs5uD8N3FRhvnvj+FKY2tOOdjSdPfnMy9mVt3zg/S0Xv0CaE1hTg==
````

### .build/quantization-research/heldout-ifeval-grader-v1/receipt.json

Original bytes: 2944. SHA-256: `409682bfceee05fe156626fc4a5c44988971a90095e45bea5539b8ac035bfedc`.

Normalized bytes: 2944. SHA-256: `409682bfceee05fe156626fc4a5c44988971a90095e45bea5539b8ac035bfedc`.

````text
{
  "created_at": "2026-10-04T10:01:37.008302+00:00",
  "scope": "Pinned upstream instruction-grader tests and bounded tokenizer data acquisition; no model outputs",
  "maximum_download_bytes": 8000000,
  "maximum_extracted_bytes": 8000000,
  "files": [
    {
      "path": "instruction_following_eval/instructions_test.py",
      "url": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/instructions_test.py",
      "bytes": 48520,
      "sha256": "e677c190c393162f7733e89ca3b47ae98b6d9e816d800681d6e14ad918128de5"
    },
    {
      "path": "instruction_following_eval/instructions_util_test.py",
      "url": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/instructions_util_test.py",
      "bytes": 4255,
      "sha256": "e8e17d434e074c6e2ad997334f4d743b3cafe0abf15cca46d4cf97b94d67ccfe"
    },
    {
      "path": "punkt-source-commit.json",
      "url": "https://api.github.com/repos/nltk/nltk_data/commits?path=packages/tokenizers/punkt_tab.zip&sha=gh-pages&per_page=1",
      "bytes": 3119,
      "sha256": "bc9a097dbce842675f83e46c29f296ec98580c98e3ed60b04a0caf8a15bec15c"
    },
    {
      "path": "punkt_tab.zip",
      "url": "https://raw.githubusercontent.com/nltk/nltk_data/4f15a3d89eefe9748ec1c05be495d91289197155/packages/tokenizers/punkt_tab.zip",
      "bytes": 4319076,
      "sha256": "e57f64187974277726a3417ca6f181ec5403676c717672eef6a748a7b20e0106"
    },
    {
      "path": "punkt_tab.xml",
      "url": "https://raw.githubusercontent.com/nltk/nltk_data/4f15a3d89eefe9748ec1c05be495d91289197155/packages/tokenizers/punkt_tab.xml",
      "bytes": 313,
      "sha256": "d8ad712174bbd31a3c1dc424d92d232919e5453c7e520616affbcce4b66e3401"
    },
    {
      "path": "nltk_data/tokenizers/punkt_tab/english/collocations.tab",
      "bytes": 594,
      "sha256": "8e2da1225e4dd2cc9dba261ee231ccb134859e21b46006e7f472c5ee269af0cf"
    },
    {
      "path": "nltk_data/tokenizers/punkt_tab/english/sent_starters.txt",
      "bytes": 241,
      "sha256": "f3f8535483e1dba487241b764945168123bca3209a9645e59acd1225dc76edac"
    },
    {
      "path": "nltk_data/tokenizers/punkt_tab/english/abbrev_types.txt",
      "bytes": 619,
      "sha256": "92a3e070f43d9b4c5534758ca40ad7343b04e7e29bfe0c2eb658a39445a4f779"
    },
    {
      "path": "nltk_data/tokenizers/punkt_tab/english/ortho_context.tab",
      "bytes": 236303,
      "sha256": "4bbcca25ed3d3f06c02402abf8419b9f033b8adc06e7b482eca4e45f81a5dc4c"
    },
    {
      "path": "nltk_data/tokenizers/punkt_tab/README",
      "bytes": 8574,
      "sha256": "d3251cae66a9359bd68c039e3a46172a05ca9df0b27dcdfa23ae594d68d27ec4"
    }
  ],
  "model_runs": 0,
  "complete": true,
  "nltk_data_revision": "4f15a3d89eefe9748ec1c05be495d91289197155",
  "downloaded_bytes": 4375283,
  "extracted_bytes": 246331
}
````

### .build/quantization-research/heldout-bfcl-source-v1/budget.json

Original bytes: 315. SHA-256: `b0bb73a15bbe875a5d6dd8aeaae8efa5f8172f1449108098d08f2d328351355a`.

Normalized bytes: 315. SHA-256: `b0bb73a15bbe875a5d6dd8aeaae8efa5f8172f1449108098d08f2d328351355a`.

````text
{
  "created_at": "2026-10-04T10:05:28.077975+00:00",
  "scope": "Read-only offline tool-fixture source review; no imports, tool calls or model outputs",
  "maximum_total_bytes": 4000000,
  "maximum_file_bytes": 500000,
  "revision": "6ea57973c7a6097fd7c5915698c54c17c5b1b6c8",
  "files": [],
  "complete": false
}
````

### .build/quantization-research/heldout-bfcl-source-v1/function-source-inventory.json

Original bytes: 22815. SHA-256: `8033962bf1d4261bbfbba87aea571c68a3cd844eb813016a0fef4a92838683eb`.

Normalized bytes: 22815. SHA-256: `8033962bf1d4261bbfbba87aea571c68a3cd844eb813016a0fef4a92838683eb`.

````text
[{"name":"__init__.py","path":"berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/__init__.py","sha":"e69de29bb2d1d6434b8b29ae775ad8c2e48c5391","size":0,"url":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/__init__.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","html_url":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/__init__.py","git_url":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/e69de29bb2d1d6434b8b29ae775ad8c2e48c5391","download_url":"https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/__init__.py","type":"file","_links":{"self":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/__init__.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","git":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/e69de29bb2d1d6434b8b29ae775ad8c2e48c5391","html":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/__init__.py"}},{"name":"gorilla_file_system.py","path":"berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/gorilla_file_system.py","sha":"6d269dd5fcf809d514eb531263f1e0e14246993c","size":32759,"url":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/gorilla_file_system.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","html_url":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/gorilla_file_system.py","git_url":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/6d269dd5fcf809d514eb531263f1e0e14246993c","download_url":"https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/gorilla_file_system.py","type":"file","_links":{"self":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/gorilla_file_system.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","git":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/6d269dd5fcf809d514eb531263f1e0e14246993c","html":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/gorilla_file_system.py"}},{"name":"long_context.py","path":"berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/long_context.py","sha":"938105bea5a07e46ee15615ab11d1c0988124b5d","size":190330,"url":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/long_context.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","html_url":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/long_context.py","git_url":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/938105bea5a07e46ee15615ab11d1c0988124b5d","download_url":"https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/long_context.py","type":"file","_links":{"self":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/long_context.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","git":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/938105bea5a07e46ee15615ab11d1c0988124b5d","html":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/long_context.py"}},{"name":"math_api.py","path":"berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/math_api.py","sha":"e1b43b3817a3d8cbedc011bb36d4d9253fd6a05a","size":12252,"url":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/math_api.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","html_url":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/math_api.py","git_url":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/e1b43b3817a3d8cbedc011bb36d4d9253fd6a05a","download_url":"https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/math_api.py","type":"file","_links":{"self":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/math_api.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","git":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/e1b43b3817a3d8cbedc011bb36d4d9253fd6a05a","html":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/math_api.py"}},{"name":"memory_api_metaclass.py","path":"berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_api_metaclass.py","sha":"d4436eb564b1545dc327aa53a86a6d4c4015ef2f","size":3200,"url":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_api_metaclass.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","html_url":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_api_metaclass.py","git_url":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/d4436eb564b1545dc327aa53a86a6d4c4015ef2f","download_url":"https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_api_metaclass.py","type":"file","_links":{"self":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_api_metaclass.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","git":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/d4436eb564b1545dc327aa53a86a6d4c4015ef2f","html":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_api_metaclass.py"}},{"name":"memory_kv.py","path":"berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_kv.py","sha":"a2d3fc7ee0649957a8e755c7be7ebc3c62a6af0a","size":12803,"url":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_kv.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","html_url":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_kv.py","git_url":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/a2d3fc7ee0649957a8e755c7be7ebc3c62a6af0a","download_url":"https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_kv.py","type":"file","_links":{"self":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_kv.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","git":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/a2d3fc7ee0649957a8e755c7be7ebc3c62a6af0a","html":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_kv.py"}},{"name":"memory_rec_sum.py","path":"berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_rec_sum.py","sha":"8022198997c83d88a7d3b6674c5a30d026726bde","size":4824,"url":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_rec_sum.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","html_url":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_rec_sum.py","git_url":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/8022198997c83d88a7d3b6674c5a30d026726bde","download_url":"https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_rec_sum.py","type":"file","_links":{"self":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_rec_sum.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","git":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/8022198997c83d88a7d3b6674c5a30d026726bde","html":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_rec_sum.py"}},{"name":"memory_vector.py","path":"berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_vector.py","sha":"5f7c72a798be2daac08141db2df1114d945db54d","size":12996,"url":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_vector.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","html_url":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_vector.py","git_url":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/5f7c72a798be2daac08141db2df1114d945db54d","download_url":"https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_vector.py","type":"file","_links":{"self":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_vector.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","git":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/5f7c72a798be2daac08141db2df1114d945db54d","html":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/memory_vector.py"}},{"name":"message_api.py","path":"berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/message_api.py","sha":"3fb461dfbf60ecb9b6cc832162c97368d69ec1ae","size":12534,"url":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/message_api.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","html_url":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/message_api.py","git_url":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/3fb461dfbf60ecb9b6cc832162c97368d69ec1ae","download_url":"https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/message_api.py","type":"file","_links":{"self":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/message_api.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","git":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/3fb461dfbf60ecb9b6cc832162c97368d69ec1ae","html":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/message_api.py"}},{"name":"posting_api.py","path":"berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/posting_api.py","sha":"ccd7566181bc36889d235c2ad62a064a6e16ba00","size":12537,"url":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/posting_api.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","html_url":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/posting_api.py","git_url":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/ccd7566181bc36889d235c2ad62a064a6e16ba00","download_url":"https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/posting_api.py","type":"file","_links":{"self":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/posting_api.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","git":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/ccd7566181bc36889d235c2ad62a064a6e16ba00","html":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/posting_api.py"}},{"name":"ticket_api.py","path":"berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/ticket_api.py","sha":"6ce72a1cd23a11d814841b46a39d173ccc4e47bb","size":9677,"url":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/ticket_api.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","html_url":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/ticket_api.py","git_url":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/6ce72a1cd23a11d814841b46a39d173ccc4e47bb","download_url":"https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/ticket_api.py","type":"file","_links":{"self":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/ticket_api.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","git":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/6ce72a1cd23a11d814841b46a39d173ccc4e47bb","html":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/ticket_api.py"}},{"name":"trading_bot.py","path":"berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/trading_bot.py","sha":"e745788b15d729194ef39844f5eb1a3a67a4d55a","size":23795,"url":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/trading_bot.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","html_url":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/trading_bot.py","git_url":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/e745788b15d729194ef39844f5eb1a3a67a4d55a","download_url":"https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/trading_bot.py","type":"file","_links":{"self":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/trading_bot.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","git":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/e745788b15d729194ef39844f5eb1a3a67a4d55a","html":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/trading_bot.py"}},{"name":"travel_booking.py","path":"berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/travel_booking.py","sha":"f357ccdabdedc5fed0019392101a7de1f524ef77","size":36647,"url":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/travel_booking.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","html_url":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/travel_booking.py","git_url":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/f357ccdabdedc5fed0019392101a7de1f524ef77","download_url":"https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/travel_booking.py","type":"file","_links":{"self":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/travel_booking.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","git":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/f357ccdabdedc5fed0019392101a7de1f524ef77","html":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/travel_booking.py"}},{"name":"vehicle_control.py","path":"berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/vehicle_control.py","sha":"ab7ef900d1a4d0120638b79c95441710eb8f5282","size":29559,"url":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/vehicle_control.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","html_url":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/vehicle_control.py","git_url":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/ab7ef900d1a4d0120638b79c95441710eb8f5282","download_url":"https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/vehicle_control.py","type":"file","_links":{"self":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/vehicle_control.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","git":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/ab7ef900d1a4d0120638b79c95441710eb8f5282","html":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/vehicle_control.py"}},{"name":"web_search.py","path":"berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/web_search.py","sha":"496451e3246adc702ed5e2c9e6c16dbb00ccadc2","size":12578,"url":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/web_search.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","html_url":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/web_search.py","git_url":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/496451e3246adc702ed5e2c9e6c16dbb00ccadc2","download_url":"https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/web_search.py","type":"file","_links":{"self":"https://api.github.com/repos/ShishirPatil/gorilla/contents/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/web_search.py?ref=6ea57973c7a6097fd7c5915698c54c17c5b1b6c8","git":"https://api.github.com/repos/ShishirPatil/gorilla/git/blobs/496451e3246adc702ed5e2c9e6c16dbb00ccadc2","html":"https://github.com/ShishirPatil/gorilla/blob/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/web_search.py"}}]
````

### .build/quantization-research/heldout-bfcl-source-v1/receipt.json

Original bytes: 6110. SHA-256: `ab7edfddfd2103e0f88254641a9791cb1c5d3ee329c3a0022bda3bb96d63fb2a`.

Normalized bytes: 6110. SHA-256: `ab7edfddfd2103e0f88254641a9791cb1c5d3ee329c3a0022bda3bb96d63fb2a`.

````text
{
  "created_at": "2026-10-04T10:05:28.077975+00:00",
  "scope": "Read-only offline tool-fixture source review; no imports, tool calls or model outputs",
  "maximum_total_bytes": 4000000,
  "maximum_file_bytes": 500000,
  "revision": "6ea57973c7a6097fd7c5915698c54c17c5b1b6c8",
  "files": [
    {
      "path": "eval_checker/multi_turn_eval/func_source_code/gorilla_file_system.py",
      "url": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/gorilla_file_system.py",
      "bytes": 32759,
      "sha256": "84173750930b09aaa31b90547c9bd79ce75714682608b35e78a9c1ea259faf2b",
      "imports": [
        "import datetime",
        "import subprocess",
        "from copy import deepcopy",
        "from typing import Dict, List, Optional, Union",
        "from bfcl_eval.eval_checker.multi_turn_eval.func_source_code.long_context import FILE_CONTENT_EXTENSION, FILES_TAIL_USED, POPULATE_FILE_EXTENSION"
      ]
    },
    {
      "path": "eval_checker/multi_turn_eval/func_source_code/math_api.py",
      "url": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/math_api.py",
      "bytes": 12252,
      "sha256": "abde32cc25e71b2ff3acf4d028a3c005b98409c174aba4abddbfe1c018afb9a8",
      "imports": [
        "import math",
        "from decimal import Decimal, InvalidOperation, getcontext",
        "from typing import Dict, List, Optional, Union",
        "import mpmath"
      ]
    },
    {
      "path": "eval_checker/multi_turn_eval/func_source_code/message_api.py",
      "url": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/message_api.py",
      "bytes": 12534,
      "sha256": "cf72af1635654147af17df1891a7fb354549e78a61930139f741a31f4be21121",
      "imports": [
        "import random",
        "from copy import deepcopy",
        "from typing import Dict, List, Optional, Union"
      ]
    },
    {
      "path": "eval_checker/multi_turn_eval/func_source_code/posting_api.py",
      "url": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/posting_api.py",
      "bytes": 12537,
      "sha256": "32b887aaa37c7167ad9c84ddfa7bbb855c75d3c1edab19ba868aba29acc4cfa1",
      "imports": [
        "from copy import deepcopy",
        "from typing import Dict, List, Optional, Union"
      ]
    },
    {
      "path": "eval_checker/multi_turn_eval/func_source_code/ticket_api.py",
      "url": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/ticket_api.py",
      "bytes": 9677,
      "sha256": "6a9375aa6425410c07a151aef27f3e44e9ed1023bb5cc5c25f14f4a9b3c99116",
      "imports": [
        "from copy import deepcopy",
        "from typing import Dict, List, Optional, Union"
      ]
    },
    {
      "path": "eval_checker/multi_turn_eval/func_source_code/trading_bot.py",
      "url": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/trading_bot.py",
      "bytes": 23795,
      "sha256": "cc2e3949035b561e9d07418b081561aa07b211672200e2e511aec074bf79fcb2",
      "imports": [
        "import random",
        "from copy import deepcopy",
        "from datetime import datetime, time, timedelta",
        "from typing import Dict, List, Optional, Union",
        "from bfcl_eval.eval_checker.multi_turn_eval.func_source_code.long_context import AUTOMOBILE_EXTENSION, MA_5_EXTENSION, MA_20_EXTENSION, ORDER_DETAIL_EXTENSION, TECHNOLOGY_EXTENSION, TRANSACTION_HISTORY_EXTENSION, WATCH_LIST_EXTENSION"
      ]
    },
    {
      "path": "eval_checker/multi_turn_eval/func_source_code/travel_booking.py",
      "url": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/travel_booking.py",
      "bytes": 36647,
      "sha256": "e698e22adccf0d6d41b297f2d5e44faebd828cef4752df6a4ffb1570c0c35296",
      "imports": [
        "import random",
        "from copy import deepcopy",
        "from datetime import datetime",
        "from typing import Dict, List, Optional, Tuple, Union",
        "from bfcl_eval.eval_checker.multi_turn_eval.func_source_code.long_context import BOOKING_RECORD_EXTENSION, CREDIT_CARD_EXTENSION"
      ]
    },
    {
      "path": "eval_checker/multi_turn_eval/func_source_code/vehicle_control.py",
      "url": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/eval_checker/multi_turn_eval/func_source_code/vehicle_control.py",
      "bytes": 29559,
      "sha256": "f5f7a2f28968728927a98ae12ec68a32d70781cfb74c2d7b14801772362b12d1",
      "imports": [
        "import random",
        "from copy import deepcopy",
        "from typing import Dict, List, Union",
        "from bfcl_eval.eval_checker.multi_turn_eval.func_source_code.long_context import CAR_STATUS_METADATA_EXTENSION, INTERMEDIARY_CITIES, LONG_WEATHER_EXTENSION, PARKING_BRAKE_INSTRUCTION"
      ]
    },
    {
      "path": "data/possible_answer/BFCL_v4_multi_turn_base.json",
      "url": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/data/possible_answer/BFCL_v4_multi_turn_base.json",
      "bytes": 78931,
      "sha256": "1fee67823b317571649177dd89d63969feaae4e810cc7448ee55ba797fb7c8fc"
    }
  ],
  "complete": true,
  "total_bytes": 248691
}
````

### .build/quantization-research/heldout-sources-v1/receipt.json

Original bytes: 16048. SHA-256: `3f9eb69ff7b02a894b862c0f0349184bc4cda90375844c18560e2d08d8215afe`.

Normalized bytes: 16048. SHA-256: `3f9eb69ff7b02a894b862c0f0349184bc4cda90375844c18560e2d08d8215afe`.

````text
{
  "created_at": "2026-10-04T09:41:29.843401+00:00",
  "scope": "Prospective source acquisition and instrument development; no sampled held-out protocol and no model outputs",
  "maximum_file_bytes": 4000000,
  "maximum_total_bytes": 16000000,
  "maximum_process_bytes": 500000000,
  "model_runs": 0,
  "new_weight_bytes": 0,
  "paid_compute_usd": 0,
  "urls": {
    "ifeval/README.md": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/README.md",
    "ifeval/instructions.py": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/instructions.py",
    "ifeval/instructions_registry.py": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/instructions_registry.py",
    "ifeval/instructions_util.py": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/instructions_util.py",
    "ifeval/evaluation_lib.py": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/evaluation_lib.py",
    "ifeval/requirements.txt": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/requirements.txt",
    "ifeval/data/input_data.jsonl": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/data/input_data.jsonl",
    "mbpp/README.md": "https://raw.githubusercontent.com/google-research/google-research/f46ca8374b4cddef97ca4208ad986049d74d296a/mbpp/README.md",
    "mbpp/mbpp.jsonl": "https://raw.githubusercontent.com/google-research/google-research/f46ca8374b4cddef97ca4208ad986049d74d296a/mbpp/mbpp.jsonl",
    "mbpp/sanitized-mbpp.json": "https://raw.githubusercontent.com/google-research/google-research/f46ca8374b4cddef97ca4208ad986049d74d296a/mbpp/sanitized-mbpp.json",
    "google-LICENSE": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/LICENSE",
    "mgsm/README.md": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/README.md",
    "mgsm/LICENSE": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/LICENSE",
    "mgsm/mgsm_en.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_en.tsv",
    "mgsm/mgsm_es.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_es.tsv",
    "mgsm/mgsm_fr.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_fr.tsv",
    "mgsm/mgsm_de.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_de.tsv",
    "mgsm/mgsm_ru.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_ru.tsv",
    "mgsm/mgsm_zh.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_zh.tsv",
    "mgsm/mgsm_ja.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_ja.tsv",
    "mgsm/mgsm_th.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_th.tsv",
    "mgsm/mgsm_sw.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_sw.tsv",
    "mgsm/mgsm_bn.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_bn.tsv",
    "mgsm/mgsm_te.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_te.tsv",
    "bfcl/BFCL_v4_simple_python.json": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/data/BFCL_v4_simple_python.json",
    "bfcl/BFCL_v4_multi_turn_base.json": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/data/BFCL_v4_multi_turn_base.json",
    "bfcl/BFCL_v4_multi_turn_long_context.json": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/data/BFCL_v4_multi_turn_long_context.json",
    "bfcl/BFCL_v4_multi_turn_miss_func.json": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/data/BFCL_v4_multi_turn_miss_func.json",
    "bfcl/BFCL_v4_multi_turn_miss_param.json": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/data/BFCL_v4_multi_turn_miss_param.json",
    "bfcl/README.md": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/data/README.md",
    "bfcl/LICENSE": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/LICENSE",
    "mmlu/test.parquet": "https://huggingface.co/datasets/cais/mmlu/resolve/c30699e8356da336a370243923dbaf21066bb9fe/all/test-00000-of-00001.parquet",
    "mmlu/README.md": "https://huggingface.co/datasets/cais/mmlu/resolve/c30699e8356da336a370243923dbaf21066bb9fe/README.md"
  },
  "files": [
    {
      "path": "ifeval/README.md",
      "url": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/README.md",
      "bytes": 1457,
      "sha256": "fef3c44408e4b39837af345095ccce7da798853fd60ea94a1de63afa9d3d67b3"
    },
    {
      "path": "ifeval/instructions.py",
      "url": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/instructions.py",
      "bytes": 55162,
      "sha256": "60e086f5342a03ce8e18b64bbcccf86308f523c08aa826707a562150a52f3edf"
    },
    {
      "path": "ifeval/instructions_registry.py",
      "url": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/instructions_registry.py",
      "bytes": 7240,
      "sha256": "ec92d72c264f6d906978613085db262356174300370a3fffe6fefd5969ce9cfc"
    },
    {
      "path": "ifeval/instructions_util.py",
      "url": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/instructions_util.py",
      "bytes": 19538,
      "sha256": "a73797261eee5bf447e279d82a2b700b1bdd3cb1193412dbab1270a85832bc6b"
    },
    {
      "path": "ifeval/evaluation_lib.py",
      "url": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/evaluation_lib.py",
      "bytes": 6984,
      "sha256": "35decc06000718487f44d7deafa6d3f48a8ec0886281edf40162c0265b7d248c"
    },
    {
      "path": "ifeval/requirements.txt",
      "url": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/requirements.txt",
      "bytes": 35,
      "sha256": "1b1716c9ac21b9cc2bd0d7354ed8f7b6982ccf35598529601a7c08508acec94a"
    },
    {
      "path": "ifeval/data/input_data.jsonl",
      "url": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/data/input_data.jsonl",
      "bytes": 207111,
      "sha256": "67ffeee0fcb87c317c5b08a2de85557b4a7e96ada6178aa645b4954fe4b53d49"
    },
    {
      "path": "mbpp/README.md",
      "url": "https://raw.githubusercontent.com/google-research/google-research/f46ca8374b4cddef97ca4208ad986049d74d296a/mbpp/README.md",
      "bytes": 1422,
      "sha256": "02d63a4ffdad806c3c87b5ea2aa91e946f6eec0c2869643b09831650883f41be"
    },
    {
      "path": "mbpp/mbpp.jsonl",
      "url": "https://raw.githubusercontent.com/google-research/google-research/f46ca8374b4cddef97ca4208ad986049d74d296a/mbpp/mbpp.jsonl",
      "bytes": 563743,
      "sha256": "ccf64ceae9c5403bf50a044cb6d505bfd2a2963ee58338ba268fd65beab92a9f"
    },
    {
      "path": "mbpp/sanitized-mbpp.json",
      "url": "https://raw.githubusercontent.com/google-research/google-research/f46ca8374b4cddef97ca4208ad986049d74d296a/mbpp/sanitized-mbpp.json",
      "bytes": 255053,
      "sha256": "ca95deaa9a01ef0a6f439f88bcf0dd3db3563d22f22aad6cae04ebb9a8d8c8e9"
    },
    {
      "path": "google-LICENSE",
      "url": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/LICENSE",
      "bytes": 11358,
      "sha256": "cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30"
    },
    {
      "path": "mgsm/README.md",
      "url": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/README.md",
      "bytes": 734,
      "sha256": "1739f020c71250a9b664b3bbad88c70c288ce82b6049599c7691ddd42e6b420b"
    },
    {
      "path": "mgsm/LICENSE",
      "url": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/LICENSE",
      "bytes": 14990,
      "sha256": "c97deeeca4ae375a0334bc7f7af5f707aabfcec959c53c783b9f8771d28fd5b3"
    },
    {
      "path": "mgsm/mgsm_en.tsv",
      "url": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_en.tsv",
      "bytes": 61299,
      "sha256": "50021d0f28cc957edcb44e7806425b1c7fbd648ddcb9e0a8ec689d10e57d40fa"
    },
    {
      "path": "mgsm/mgsm_es.tsv",
      "url": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_es.tsv",
      "bytes": 66896,
      "sha256": "5bd27ebdf00140cec845c5298dc17715f5cd57d8edda6df1976db40bf3f0750a"
    },
    {
      "path": "mgsm/mgsm_fr.tsv",
      "url": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_fr.tsv",
      "bytes": 69141,
      "sha256": "36207c1c03fd7cd3ea491441eb755408199f94e4a647851df531bbaedc99d606"
    },
    {
      "path": "mgsm/mgsm_de.tsv",
      "url": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_de.tsv",
      "bytes": 69640,
      "sha256": "4dfea30fede44b813e2e496f5f0534049e83c7cc8aed6e00600b30ec62053626"
    },
    {
      "path": "mgsm/mgsm_ru.tsv",
      "url": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_ru.tsv",
      "bytes": 110953,
      "sha256": "6bd30fd2e80c5bac23f566fb4ae0e6a55a19578401fbf9a01fb21beb3645fef8"
    },
    {
      "path": "mgsm/mgsm_zh.tsv",
      "url": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_zh.tsv",
      "bytes": 57838,
      "sha256": "b2fa63151022370a0de1f4211c8c284eae74b0f5a3b003b1d5982c0d4a73f661"
    },
    {
      "path": "mgsm/mgsm_ja.tsv",
      "url": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_ja.tsv",
      "bytes": 81043,
      "sha256": "59a2b50debe77981fd784cb3b2bef1505e3abf2a37116dc9d7a366ab029b4637"
    },
    {
      "path": "mgsm/mgsm_th.tsv",
      "url": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_th.tsv",
      "bytes": 151921,
      "sha256": "f3932dc5ad8e9d0ea82b017adc1e1461dd647af861e7166d6741986602a0cfd6"
    },
    {
      "path": "mgsm/mgsm_sw.tsv",
      "url": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_sw.tsv",
      "bytes": 67456,
      "sha256": "2bac828d77229e65d7c7197b1ad4a2cb5b1fe99b163f2cbdd66501de6a2115c4"
    },
    {
      "path": "mgsm/mgsm_bn.tsv",
      "url": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_bn.tsv",
      "bytes": 156684,
      "sha256": "6b00bc7cc635547e866989284afa924d789b5affa2eb8de623c385dd943ad977"
    },
    {
      "path": "mgsm/mgsm_te.tsv",
      "url": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_te.tsv",
      "bytes": 176547,
      "sha256": "dd6b1452c244bb2e4ba254c01ea84137f80c1cefc57d69c23b0ed88b9c0f36b7"
    },
    {
      "path": "bfcl/BFCL_v4_simple_python.json",
      "url": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/data/BFCL_v4_simple_python.json",
      "bytes": 283274,
      "sha256": "82dd63ba502eb2520c6b5d1d9a5c4b590e03ff261565175561f6228a367d1991"
    },
    {
      "path": "bfcl/BFCL_v4_multi_turn_base.json",
      "url": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/data/BFCL_v4_multi_turn_base.json",
      "bytes": 390425,
      "sha256": "1a21a995d06fd6f20ba55de7bced30ef953ec35e998f502ec2ecf4d66ef1c43a"
    },
    {
      "path": "bfcl/BFCL_v4_multi_turn_long_context.json",
      "url": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/data/BFCL_v4_multi_turn_long_context.json",
      "bytes": 392016,
      "sha256": "78c3268c5cc8e97c0f4ec6c811b3b9a2bba14323b1830b7a874b06d822749324"
    },
    {
      "path": "bfcl/BFCL_v4_multi_turn_miss_func.json",
      "url": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/data/BFCL_v4_multi_turn_miss_func.json",
      "bytes": 401159,
      "sha256": "87d28ce10e37d864b72de85d5732eef2a867b241d6c1c99b4ae682c9e3ea921c"
    },
    {
      "path": "bfcl/BFCL_v4_multi_turn_miss_param.json",
      "url": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/data/BFCL_v4_multi_turn_miss_param.json",
      "bytes": 402974,
      "sha256": "f0c66dda3795f5f53e3e1c0cc8ba0246b6761c8f58bdba8317203bf451ab8838"
    },
    {
      "path": "bfcl/README.md",
      "url": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/data/README.md",
      "bytes": 20277,
      "sha256": "93119d83df28fee0a9f3ea41b0c6a947aad9f7ba4334ae89fef41c74b67b208d"
    },
    {
      "path": "bfcl/LICENSE",
      "url": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/LICENSE",
      "bytes": 11357,
      "sha256": "c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4"
    },
    {
      "path": "mmlu/test.parquet",
      "url": "https://huggingface.co/datasets/cais/mmlu/resolve/c30699e8356da336a370243923dbaf21066bb9fe/all/test-00000-of-00001.parquet",
      "bytes": 3504718,
      "sha256": "74a41822ce7d3def56e1682f958469c04642a5336a5ce912fa375fdb90fb25d7"
    },
    {
      "path": "mmlu/README.md",
      "url": "https://huggingface.co/datasets/cais/mmlu/resolve/c30699e8356da336a370243923dbaf21066bb9fe/README.md",
      "bytes": 53221,
      "sha256": "665eef35ecd8a89037c1e4f1e1a0d7fd4c154edc04c81cea5634ace2d3e96953"
    }
  ],
  "complete": true,
  "total_bytes": 7673666
}
````

### .build/quantization-research/heldout-sources-v1/prospective-budget.json

Original bytes: 5884. SHA-256: `240ff5ca0ba17c49eaf76752a74db593f875dc336f9d77e57dca756afc187aa8`.

Normalized bytes: 5884. SHA-256: `240ff5ca0ba17c49eaf76752a74db593f875dc336f9d77e57dca756afc187aa8`.

````text
{
  "created_at": "2026-10-04T09:41:29.843401+00:00",
  "scope": "Prospective source acquisition and instrument development; no sampled held-out protocol and no model outputs",
  "maximum_file_bytes": 4000000,
  "maximum_total_bytes": 16000000,
  "maximum_process_bytes": 500000000,
  "model_runs": 0,
  "new_weight_bytes": 0,
  "paid_compute_usd": 0,
  "urls": {
    "ifeval/README.md": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/README.md",
    "ifeval/instructions.py": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/instructions.py",
    "ifeval/instructions_registry.py": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/instructions_registry.py",
    "ifeval/instructions_util.py": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/instructions_util.py",
    "ifeval/evaluation_lib.py": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/evaluation_lib.py",
    "ifeval/requirements.txt": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/requirements.txt",
    "ifeval/data/input_data.jsonl": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/instruction_following_eval/data/input_data.jsonl",
    "mbpp/README.md": "https://raw.githubusercontent.com/google-research/google-research/f46ca8374b4cddef97ca4208ad986049d74d296a/mbpp/README.md",
    "mbpp/mbpp.jsonl": "https://raw.githubusercontent.com/google-research/google-research/f46ca8374b4cddef97ca4208ad986049d74d296a/mbpp/mbpp.jsonl",
    "mbpp/sanitized-mbpp.json": "https://raw.githubusercontent.com/google-research/google-research/f46ca8374b4cddef97ca4208ad986049d74d296a/mbpp/sanitized-mbpp.json",
    "google-LICENSE": "https://raw.githubusercontent.com/google-research/google-research/e6890f85757dd84e27ca6df2dd30651dafad28e0/LICENSE",
    "mgsm/README.md": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/README.md",
    "mgsm/LICENSE": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/LICENSE",
    "mgsm/mgsm_en.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_en.tsv",
    "mgsm/mgsm_es.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_es.tsv",
    "mgsm/mgsm_fr.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_fr.tsv",
    "mgsm/mgsm_de.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_de.tsv",
    "mgsm/mgsm_ru.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_ru.tsv",
    "mgsm/mgsm_zh.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_zh.tsv",
    "mgsm/mgsm_ja.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_ja.tsv",
    "mgsm/mgsm_th.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_th.tsv",
    "mgsm/mgsm_sw.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_sw.tsv",
    "mgsm/mgsm_bn.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_bn.tsv",
    "mgsm/mgsm_te.tsv": "https://raw.githubusercontent.com/google-research/url-nlp/3622039cf51f7eeffa58b957332a8e8c337981d7/mgsm/mgsm_te.tsv",
    "bfcl/BFCL_v4_simple_python.json": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/data/BFCL_v4_simple_python.json",
    "bfcl/BFCL_v4_multi_turn_base.json": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/data/BFCL_v4_multi_turn_base.json",
    "bfcl/BFCL_v4_multi_turn_long_context.json": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/data/BFCL_v4_multi_turn_long_context.json",
    "bfcl/BFCL_v4_multi_turn_miss_func.json": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/data/BFCL_v4_multi_turn_miss_func.json",
    "bfcl/BFCL_v4_multi_turn_miss_param.json": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/data/BFCL_v4_multi_turn_miss_param.json",
    "bfcl/README.md": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/berkeley-function-call-leaderboard/bfcl_eval/data/README.md",
    "bfcl/LICENSE": "https://raw.githubusercontent.com/ShishirPatil/gorilla/6ea57973c7a6097fd7c5915698c54c17c5b1b6c8/LICENSE",
    "mmlu/test.parquet": "https://huggingface.co/datasets/cais/mmlu/resolve/c30699e8356da336a370243923dbaf21066bb9fe/all/test-00000-of-00001.parquet",
    "mmlu/README.md": "https://huggingface.co/datasets/cais/mmlu/resolve/c30699e8356da336a370243923dbaf21066bb9fe/README.md"
  },
  "files": [],
  "complete": false
}
````

### .build/quantization-research/heldout-sources-v1/google-LICENSE

Original bytes: 11358. SHA-256: `cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30`.

Normalized bytes: 11358. SHA-256: `cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30`.

````text

                                 Apache License
                           Version 2.0, January 2004
                        http://www.apache.org/licenses/

   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

   1. Definitions.

      "License" shall mean the terms and conditions for use, reproduction,
      and distribution as defined by Sections 1 through 9 of this document.

      "Licensor" shall mean the copyright owner or entity authorized by
      the copyright owner that is granting the License.

      "Legal Entity" shall mean the union of the acting entity and all
      other entities that control, are controlled by, or are under common
      control with that entity. For the purposes of this definition,
      "control" means (i) the power, direct or indirect, to cause the
      direction or management of such entity, whether by contract or
      otherwise, or (ii) ownership of fifty percent (50%) or more of the
      outstanding shares, or (iii) beneficial ownership of such entity.

      "You" (or "Your") shall mean an individual or Legal Entity
      exercising permissions granted by this License.

      "Source" form shall mean the preferred form for making modifications,
      including but not limited to software source code, documentation
      source, and configuration files.

      "Object" form shall mean any form resulting from mechanical
      transformation or translation of a Source form, including but
      not limited to compiled object code, generated documentation,
      and conversions to other media types.

      "Work" shall mean the work of authorship, whether in Source or
      Object form, made available under the License, as indicated by a
      copyright notice that is included in or attached to the work
      (an example is provided in the Appendix below).

      "Derivative Works" shall mean any work, whether in Source or Object
      form, that is based on (or derived from) the Work and for which the
      editorial revisions, annotations, elaborations, or other modifications
      represent, as a whole, an original work of authorship. For the purposes
      of this License, Derivative Works shall not include works that remain
      separable from, or merely link (or bind by name) to the interfaces of,
      the Work and Derivative Works thereof.

      "Contribution" shall mean any work of authorship, including
      the original version of the Work and any modifications or additions
      to that Work or Derivative Works thereof, that is intentionally
      submitted to Licensor for inclusion in the Work by the copyright owner
      or by an individual or Legal Entity authorized to submit on behalf of
      the copyright owner. For the purposes of this definition, "submitted"
      means any form of electronic, verbal, or written communication sent
      to the Licensor or its representatives, including but not limited to
      communication on electronic mailing lists, source code control systems,
      and issue tracking systems that are managed by, or on behalf of, the
      Licensor for the purpose of discussing and improving the Work, but
      excluding communication that is conspicuously marked or otherwise
      designated in writing by the copyright owner as "Not a Contribution."

      "Contributor" shall mean Licensor and any individual or Legal Entity
      on behalf of whom a Contribution has been received by Licensor and
      subsequently incorporated within the Work.

   2. Grant of Copyright License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      copyright license to reproduce, prepare Derivative Works of,
      publicly display, publicly perform, sublicense, and distribute the
      Work and such Derivative Works in Source or Object form.

   3. Grant of Patent License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      (except as stated in this section) patent license to make, have made,
      use, offer to sell, sell, import, and otherwise transfer the Work,
      where such license applies only to those patent claims licensable
      by such Contributor that are necessarily infringed by their
      Contribution(s) alone or by combination of their Contribution(s)
      with the Work to which such Contribution(s) was submitted. If You
      institute patent litigation against any entity (including a
      cross-claim or counterclaim in a lawsuit) alleging that the Work
      or a Contribution incorporated within the Work constitutes direct
      or contributory patent infringement, then any patent licenses
      granted to You under this License for that Work shall terminate
      as of the date such litigation is filed.

   4. Redistribution. You may reproduce and distribute copies of the
      Work or Derivative Works thereof in any medium, with or without
      modifications, and in Source or Object form, provided that You
      meet the following conditions:

      (a) You must give any other recipients of the Work or
          Derivative Works a copy of this License; and

      (b) You must cause any modified files to carry prominent notices
          stating that You changed the files; and

      (c) You must retain, in the Source form of any Derivative Works
          that You distribute, all copyright, patent, trademark, and
          attribution notices from the Source form of the Work,
          excluding those notices that do not pertain to any part of
          the Derivative Works; and

      (d) If the Work includes a "NOTICE" text file as part of its
          distribution, then any Derivative Works that You distribute must
          include a readable copy of the attribution notices contained
          within such NOTICE file, excluding those notices that do not
          pertain to any part of the Derivative Works, in at least one
          of the following places: within a NOTICE text file distributed
          as part of the Derivative Works; within the Source form or
          documentation, if provided along with the Derivative Works; or,
          within a display generated by the Derivative Works, if and
          wherever such third-party notices normally appear. The contents
          of the NOTICE file are for informational purposes only and
          do not modify the License. You may add Your own attribution
          notices within Derivative Works that You distribute, alongside
          or as an addendum to the NOTICE text from the Work, provided
          that such additional attribution notices cannot be construed
          as modifying the License.

      You may add Your own copyright statement to Your modifications and
      may provide additional or different license terms and conditions
      for use, reproduction, or distribution of Your modifications, or
      for any such Derivative Works as a whole, provided Your use,
      reproduction, and distribution of the Work otherwise complies with
      the conditions stated in this License.

   5. Submission of Contributions. Unless You explicitly state otherwise,
      any Contribution intentionally submitted for inclusion in the Work
      by You to the Licensor shall be under the terms and conditions of
      this License, without any additional terms or conditions.
      Notwithstanding the above, nothing herein shall supersede or modify
      the terms of any separate license agreement you may have executed
      with Licensor regarding such Contributions.

   6. Trademarks. This License does not grant permission to use the trade
      names, trademarks, service marks, or product names of the Licensor,
      except as required for reasonable and customary use in describing the
      origin of the Work and reproducing the content of the NOTICE file.

   7. Disclaimer of Warranty. Unless required by applicable law or
      agreed to in writing, Licensor provides the Work (and each
      Contributor provides its Contributions) on an "AS IS" BASIS,
      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
      implied, including, without limitation, any warranties or conditions
      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
      PARTICULAR PURPOSE. You are solely responsible for determining the
      appropriateness of using or redistributing the Work and assume any
      risks associated with Your exercise of permissions under this License.

   8. Limitation of Liability. In no event and under no legal theory,
      whether in tort (including negligence), contract, or otherwise,
      unless required by applicable law (such as deliberate and grossly
      negligent acts) or agreed to in writing, shall any Contributor be
      liable to You for damages, including any direct, indirect, special,
      incidental, or consequential damages of any character arising as a
      result of this License or out of the use or inability to use the
      Work (including but not limited to damages for loss of goodwill,
      work stoppage, computer failure or malfunction, or any and all
      other commercial damages or losses), even if such Contributor
      has been advised of the possibility of such damages.

   9. Accepting Warranty or Additional Liability. While redistributing
      the Work or Derivative Works thereof, You may choose to offer,
      and charge a fee for, acceptance of support, warranty, indemnity,
      or other liability obligations and/or rights consistent with this
      License. However, in accepting such obligations, You may act only
      on Your own behalf and on Your sole responsibility, not on behalf
      of any other Contributor, and only if You agree to indemnify,
      defend, and hold each Contributor harmless for any liability
      incurred by, or claims asserted against, such Contributor by reason
      of your accepting any such warranty or additional liability.

   END OF TERMS AND CONDITIONS

   APPENDIX: How to apply the Apache License to your work.

      To apply the Apache License to your work, attach the following
      boilerplate notice, with the fields enclosed by brackets "[]"
      replaced with your own identifying information. (Don't include
      the brackets!)  The text should be enclosed in the appropriate
      comment syntax for the file format. We also recommend that a
      file or class name and description of purpose be included on the
      same "printed page" as the copyright notice for easier
      identification within third-party archives.

   Copyright [yyyy] [name of copyright owner]

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
````

### .build/quantization-research/heldout-sources-v1/mgsm/LICENSE

Original bytes: 14990. SHA-256: `c97deeeca4ae375a0334bc7f7af5f707aabfcec959c53c783b9f8771d28fd5b3`.

Normalized bytes: 14990. SHA-256: `c97deeeca4ae375a0334bc7f7af5f707aabfcec959c53c783b9f8771d28fd5b3`.

````text
Creative Commons Attribution 4.0 International Public License (CC-BY)

   By exercising the Licensed Rights (defined below), You accept and agree
   to be bound by the terms and conditions of this Creative Commons
   Attribution 4.0 International Public License ("Public License"). To the
   extent this Public License may be interpreted as a contract, You are
   granted the Licensed Rights in consideration of Your acceptance of
   these terms and conditions, and the Licensor grants You such rights in
   consideration of benefits the Licensor receives from making the
   Licensed Material available under these terms and conditions.

   Section 1 - Definitions.
    a. Adapted Material means material subject to Copyright and Similar
       Rights that is derived from or based upon the Licensed Material and
       in which the Licensed Material is translated, altered, arranged,
       transformed, or otherwise modified in a manner requiring permission
       under the Copyright and Similar Rights held by the Licensor. For
       purposes of this Public License, where the Licensed Material is a
       musical work, performance, or sound recording, Adapted Material is
       always produced where the Licensed Material is synched in timed
       relation with a moving image.
    b. Adapter's License means the license You apply to Your Copyright and
       Similar Rights in Your contributions to Adapted Material in
       accordance with the terms and conditions of this Public License.
    c. Copyright and Similar Rights means copyright and/or similar rights
       closely related to copyright including, without limitation,
       performance, broadcast, sound recording, and Sui Generis Database
       Rights, without regard to how the rights are labeled or
       categorized. For purposes of this Public License, the rights
       specified in Section [5]2(b)(1)-(2) are not Copyright and Similar
       Rights.
    d. Effective Technological Measures means those measures that, in the
       absence of proper authority, may not be circumvented under laws
       fulfilling obligations under Article 11 of the WIPO Copyright
       Treaty adopted on December 20, 1996, and/or similar international
       agreements.
    e. Exceptions and Limitations means fair use, fair dealing, and/or any
       other exception or limitation to Copyright and Similar Rights that
       applies to Your use of the Licensed Material.
    f. Licensed Material means the artistic or literary work, database, or
       other material to which the Licensor applied this Public License.
    g. Licensed Rights means the rights granted to You subject to the
       terms and conditions of this Public License, which are limited to
       all Copyright and Similar Rights that apply to Your use of the
       Licensed Material and that the Licensor has authority to license.
    h. Licensor means the individual(s) or entity(ies) granting rights
       under this Public License.
    i. Share means to provide material to the public by any means or
       process that requires permission under the Licensed Rights, such as
       reproduction, public display, public performance, distribution,
       dissemination, communication, or importation, and to make material
       available to the public including in ways that members of the
       public may access the material from a place and at a time
       individually chosen by them.
    j. Sui Generis Database Rights means rights other than copyright
       resulting from Directive 96/9/EC of the European Parliament and of
       the Council of 11 March 1996 on the legal protection of databases,
       as amended and/or succeeded, as well as other essentially
       equivalent rights anywhere in the world.
    k. You means the individual or entity exercising the Licensed Rights
       under this Public License. Your has a corresponding meaning.

   Section 2 - Scope.
    a. License grant.
         1. Subject to the terms and conditions of this Public License,
            the Licensor hereby grants You a worldwide, royalty-free,
            non-sublicensable, non-exclusive, irrevocable license to
            exercise the Licensed Rights in the Licensed Material to:
              A. reproduce and Share the Licensed Material, in whole or in
                 part; and
              B. produce, reproduce, and Share Adapted Material.
         2. Exceptions and Limitations. For the avoidance of doubt, where
            Exceptions and Limitations apply to Your use, this Public
            License does not apply, and You do not need to comply with its
            terms and conditions.
         3. Term. The term of this Public License is specified in Section
            [6]6(a).
         4. Media and formats; technical modifications allowed. The
            Licensor authorizes You to exercise the Licensed Rights in all
            media and formats whether now known or hereafter created, and
            to make technical modifications necessary to do so. The
            Licensor waives and/or agrees not to assert any right or
            authority to forbid You from making technical modifications
            necessary to exercise the Licensed Rights, including technical
            modifications necessary to circumvent Effective Technological
            Measures. For purposes of this Public License, simply making
            modifications authorized by this Section [7]2(a)(4) never
            produces Adapted Material.
         5. Downstream recipients.
              A. Offer from the Licensor - Licensed Material. Every
                 recipient of the Licensed Material automatically receives
                 an offer from the Licensor to exercise the Licensed
                 Rights under the terms and conditions of this Public
                 License.
              B. No downstream restrictions. You may not offer or impose
                 any additional or different terms or conditions on, or
                 apply any Effective Technological Measures to, the
                 Licensed Material if doing so restricts exercise of the
                 Licensed Rights by any recipient of the Licensed
                 Material.
         6. No endorsement. Nothing in this Public License constitutes or
            may be construed as permission to assert or imply that You
            are, or that Your use of the Licensed Material is, connected
            with, or sponsored, endorsed, or granted official status by,
            the Licensor or others designated to receive attribution as
            provided in Section [8]3(a)(1)(A)(i).
    b. Other rights.
         1. Moral rights, such as the right of integrity, are not licensed
            under this Public License, nor are publicity, privacy, and/or
            other similar personality rights; however, to the extent
            possible, the Licensor waives and/or agrees not to assert any
            such rights held by the Licensor to the limited extent
            necessary to allow You to exercise the Licensed Rights, but
            not otherwise.
         2. Patent and trademark rights are not licensed under this Public
            License.
         3. To the extent possible, the Licensor waives any right to
            collect royalties from You for the exercise of the Licensed
            Rights, whether directly or through a collecting society under
            any voluntary or waivable statutory or compulsory licensing
            scheme. In all other cases the Licensor expressly reserves any
            right to collect such royalties.

   Section 3 - License Conditions.

   Your exercise of the Licensed Rights is expressly made subject to the
   following conditions.
    a. Attribution.
         1. If You Share the Licensed Material (including in modified
            form), You must:
              A. retain the following if it is supplied by the Licensor
                 with the Licensed Material:
                   i. identification of the creator(s) of the Licensed
                      Material and any others designated to receive
                      attribution, in any reasonable manner requested by
                      the Licensor (including by pseudonym if designated);
                  ii. a copyright notice;
                  iii. a notice that refers to this Public License;
                  iv. a notice that refers to the disclaimer of
                      warranties;
                   v. a URI or hyperlink to the Licensed Material to the
                      extent reasonably practicable;
              B. indicate if You modified the Licensed Material and retain
                 an indication of any previous modifications; and
              C. indicate the Licensed Material is licensed under this
                 Public License, and include the text of, or the URI or
                 hyperlink to, this Public License.
         2. You may satisfy the conditions in Section [9]3(a)(1) in any
            reasonable manner based on the medium, means, and context in
            which You Share the Licensed Material. For example, it may be
            reasonable to satisfy the conditions by providing a URI or
            hyperlink to a resource that includes the required
            information.
         3. If requested by the Licensor, You must remove any of the
            information required by Section [10]3(a)(1)(A) to the extent
            reasonably practicable.
         4. If You Share Adapted Material You produce, the Adapter's
            License You apply must not prevent recipients of the Adapted
            Material from complying with this Public License.

   Section 4 - Sui Generis Database Rights.

   Where the Licensed Rights include Sui Generis Database Rights that
   apply to Your use of the Licensed Material:
    a. for the avoidance of doubt, Section [11]2(a)(1) grants You the
       right to extract, reuse, reproduce, and Share all or a substantial
       portion of the contents of the database;
    b. if You include all or a substantial portion of the database
       contents in a database in which You have Sui Generis Database
       Rights, then the database in which You have Sui Generis Database
       Rights (but not its individual contents) is Adapted Material; and
    c. You must comply with the conditions in Section [12]3(a) if You
       Share all or a substantial portion of the contents of the database.

   For the avoidance of doubt, this Section [13]4 supplements and does not
   replace Your obligations under this Public License where the Licensed
   Rights include other Copyright and Similar Rights.

   Section 5 - Disclaimer of Warranties and Limitation of Liability.
    a. Unless otherwise separately undertaken by the Licensor, to the
       extent possible, the Licensor offers the Licensed Material as-is
       and as-available, and makes no representations or warranties of any
       kind concerning the Licensed Material, whether express, implied,
       statutory, or other. This includes, without limitation, warranties
       of title, merchantability, fitness for a particular purpose,
       non-infringement, absence of latent or other defects, accuracy, or
       the presence or absence of errors, whether or not known or
       discoverable. Where disclaimers of warranties are not allowed in
       full or in part, this disclaimer may not apply to You.
    b. To the extent possible, in no event will the Licensor be liable to
       You on any legal theory (including, without limitation, negligence)
       or otherwise for any direct, special, indirect, incidental,
       consequential, punitive, exemplary, or other losses, costs,
       expenses, or damages arising out of this Public License or use of
       the Licensed Material, even if the Licensor has been advised of the
       possibility of such losses, costs, expenses, or damages. Where a
       limitation of liability is not allowed in full or in part, this
       limitation may not apply to You.

    c. The disclaimer of warranties and limitation of liability provided
       above shall be interpreted in a manner that, to the extent
       possible, most closely approximates an absolute disclaimer and
       waiver of all liability.

   Section 6 - Term and Termination.
    a. This Public License applies for the term of the Copyright and
       Similar Rights licensed here. However, if You fail to comply with
       this Public License, then Your rights under this Public License
       terminate automatically.
    b. Where Your right to use the Licensed Material has terminated under
       Section [14]6(a), it reinstates:
         1. automatically as of the date the violation is cured, provided
            it is cured within 30 days of Your discovery of the violation;
            or
         2. upon express reinstatement by the Licensor.
       For the avoidance of doubt, this Section [15]6(b) does not affect
       any right the Licensor may have to seek remedies for Your
       violations of this Public License.
    c. For the avoidance of doubt, the Licensor may also offer the
       Licensed Material under separate terms or conditions or stop
       distributing the Licensed Material at any time; however, doing so
       will not terminate this Public License.
    d. Sections [16]1, [17]5, [18]6, [19]7, and [20]8 survive termination
       of this Public License.

   Section 7 - Other Terms and Conditions.
    a. The Licensor shall not be bound by any additional or different
       terms or conditions communicated by You unless expressly agreed.
    b. Any arrangements, understandings, or agreements regarding the
       Licensed Material not stated herein are separate from and
       independent of the terms and conditions of this Public License.

   Section 8 - Interpretation.
    a. For the avoidance of doubt, this Public License does not, and shall
       not be interpreted to, reduce, limit, restrict, or impose
       conditions on any use of the Licensed Material that could lawfully
       be made without permission under this Public License.
    b. To the extent possible, if any provision of this Public License is
       deemed unenforceable, it shall be automatically reformed to the
       minimum extent necessary to make it enforceable. If the provision
       cannot be reformed, it shall be severed from this Public License
       without affecting the enforceability of the remaining terms and
       conditions.
    c. No term or condition of this Public License will be waived and no
       failure to comply consented to unless expressly agreed to by the
       Licensor.
    d. Nothing in this Public License constitutes or may be interpreted as
       a limitation upon, or waiver of, any privileges and immunities that
       apply to the Licensor or You, including from the legal processes of
       any jurisdiction or authority.
````

### .build/quantization-research/heldout-sources-v1/bfcl/LICENSE

Original bytes: 11357. SHA-256: `c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4`.

Normalized bytes: 11357. SHA-256: `c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4`.

````text
                                 Apache License
                           Version 2.0, January 2004
                        http://www.apache.org/licenses/

   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

   1. Definitions.

      "License" shall mean the terms and conditions for use, reproduction,
      and distribution as defined by Sections 1 through 9 of this document.

      "Licensor" shall mean the copyright owner or entity authorized by
      the copyright owner that is granting the License.

      "Legal Entity" shall mean the union of the acting entity and all
      other entities that control, are controlled by, or are under common
      control with that entity. For the purposes of this definition,
      "control" means (i) the power, direct or indirect, to cause the
      direction or management of such entity, whether by contract or
      otherwise, or (ii) ownership of fifty percent (50%) or more of the
      outstanding shares, or (iii) beneficial ownership of such entity.

      "You" (or "Your") shall mean an individual or Legal Entity
      exercising permissions granted by this License.

      "Source" form shall mean the preferred form for making modifications,
      including but not limited to software source code, documentation
      source, and configuration files.

      "Object" form shall mean any form resulting from mechanical
      transformation or translation of a Source form, including but
      not limited to compiled object code, generated documentation,
      and conversions to other media types.

      "Work" shall mean the work of authorship, whether in Source or
      Object form, made available under the License, as indicated by a
      copyright notice that is included in or attached to the work
      (an example is provided in the Appendix below).

      "Derivative Works" shall mean any work, whether in Source or Object
      form, that is based on (or derived from) the Work and for which the
      editorial revisions, annotations, elaborations, or other modifications
      represent, as a whole, an original work of authorship. For the purposes
      of this License, Derivative Works shall not include works that remain
      separable from, or merely link (or bind by name) to the interfaces of,
      the Work and Derivative Works thereof.

      "Contribution" shall mean any work of authorship, including
      the original version of the Work and any modifications or additions
      to that Work or Derivative Works thereof, that is intentionally
      submitted to Licensor for inclusion in the Work by the copyright owner
      or by an individual or Legal Entity authorized to submit on behalf of
      the copyright owner. For the purposes of this definition, "submitted"
      means any form of electronic, verbal, or written communication sent
      to the Licensor or its representatives, including but not limited to
      communication on electronic mailing lists, source code control systems,
      and issue tracking systems that are managed by, or on behalf of, the
      Licensor for the purpose of discussing and improving the Work, but
      excluding communication that is conspicuously marked or otherwise
      designated in writing by the copyright owner as "Not a Contribution."

      "Contributor" shall mean Licensor and any individual or Legal Entity
      on behalf of whom a Contribution has been received by Licensor and
      subsequently incorporated within the Work.

   2. Grant of Copyright License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      copyright license to reproduce, prepare Derivative Works of,
      publicly display, publicly perform, sublicense, and distribute the
      Work and such Derivative Works in Source or Object form.

   3. Grant of Patent License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      (except as stated in this section) patent license to make, have made,
      use, offer to sell, sell, import, and otherwise transfer the Work,
      where such license applies only to those patent claims licensable
      by such Contributor that are necessarily infringed by their
      Contribution(s) alone or by combination of their Contribution(s)
      with the Work to which such Contribution(s) was submitted. If You
      institute patent litigation against any entity (including a
      cross-claim or counterclaim in a lawsuit) alleging that the Work
      or a Contribution incorporated within the Work constitutes direct
      or contributory patent infringement, then any patent licenses
      granted to You under this License for that Work shall terminate
      as of the date such litigation is filed.

   4. Redistribution. You may reproduce and distribute copies of the
      Work or Derivative Works thereof in any medium, with or without
      modifications, and in Source or Object form, provided that You
      meet the following conditions:

      (a) You must give any other recipients of the Work or
          Derivative Works a copy of this License; and

      (b) You must cause any modified files to carry prominent notices
          stating that You changed the files; and

      (c) You must retain, in the Source form of any Derivative Works
          that You distribute, all copyright, patent, trademark, and
          attribution notices from the Source form of the Work,
          excluding those notices that do not pertain to any part of
          the Derivative Works; and

      (d) If the Work includes a "NOTICE" text file as part of its
          distribution, then any Derivative Works that You distribute must
          include a readable copy of the attribution notices contained
          within such NOTICE file, excluding those notices that do not
          pertain to any part of the Derivative Works, in at least one
          of the following places: within a NOTICE text file distributed
          as part of the Derivative Works; within the Source form or
          documentation, if provided along with the Derivative Works; or,
          within a display generated by the Derivative Works, if and
          wherever such third-party notices normally appear. The contents
          of the NOTICE file are for informational purposes only and
          do not modify the License. You may add Your own attribution
          notices within Derivative Works that You distribute, alongside
          or as an addendum to the NOTICE text from the Work, provided
          that such additional attribution notices cannot be construed
          as modifying the License.

      You may add Your own copyright statement to Your modifications and
      may provide additional or different license terms and conditions
      for use, reproduction, or distribution of Your modifications, or
      for any such Derivative Works as a whole, provided Your use,
      reproduction, and distribution of the Work otherwise complies with
      the conditions stated in this License.

   5. Submission of Contributions. Unless You explicitly state otherwise,
      any Contribution intentionally submitted for inclusion in the Work
      by You to the Licensor shall be under the terms and conditions of
      this License, without any additional terms or conditions.
      Notwithstanding the above, nothing herein shall supersede or modify
      the terms of any separate license agreement you may have executed
      with Licensor regarding such Contributions.

   6. Trademarks. This License does not grant permission to use the trade
      names, trademarks, service marks, or product names of the Licensor,
      except as required for reasonable and customary use in describing the
      origin of the Work and reproducing the content of the NOTICE file.

   7. Disclaimer of Warranty. Unless required by applicable law or
      agreed to in writing, Licensor provides the Work (and each
      Contributor provides its Contributions) on an "AS IS" BASIS,
      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
      implied, including, without limitation, any warranties or conditions
      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
      PARTICULAR PURPOSE. You are solely responsible for determining the
      appropriateness of using or redistributing the Work and assume any
      risks associated with Your exercise of permissions under this License.

   8. Limitation of Liability. In no event and under no legal theory,
      whether in tort (including negligence), contract, or otherwise,
      unless required by applicable law (such as deliberate and grossly
      negligent acts) or agreed to in writing, shall any Contributor be
      liable to You for damages, including any direct, indirect, special,
      incidental, or consequential damages of any character arising as a
      result of this License or out of the use or inability to use the
      Work (including but not limited to damages for loss of goodwill,
      work stoppage, computer failure or malfunction, or any and all
      other commercial damages or losses), even if such Contributor
      has been advised of the possibility of such damages.

   9. Accepting Warranty or Additional Liability. While redistributing
      the Work or Derivative Works thereof, You may choose to offer,
      and charge a fee for, acceptance of support, warranty, indemnity,
      or other liability obligations and/or rights consistent with this
      License. However, in accepting such obligations, You may act only
      on Your own behalf and on Your sole responsibility, not on behalf
      of any other Contributor, and only if You agree to indemnify,
      defend, and hold each Contributor harmless for any liability
      incurred by, or claims asserted against, such Contributor by reason
      of your accepting any such warranty or additional liability.

   END OF TERMS AND CONDITIONS

   APPENDIX: How to apply the Apache License to your work.

      To apply the Apache License to your work, attach the following
      boilerplate notice, with the fields enclosed by brackets "[]"
      replaced with your own identifying information. (Don't include
      the brackets!)  The text should be enclosed in the appropriate
      comment syntax for the file format. We also recommend that a
      file or class name and description of purpose be included on the
      same "printed page" as the copyright notice for easier
      identification within third-party archives.

   Copyright [yyyy] [name of copyright owner]

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
````

### .build/quantization-research/heldout-sources-v1/mmlu/README.md

Original bytes: 53221. SHA-256: `665eef35ecd8a89037c1e4f1e1a0d7fd4c154edc04c81cea5634ace2d3e96953`.

Normalized bytes: 53221. SHA-256: `665eef35ecd8a89037c1e4f1e1a0d7fd4c154edc04c81cea5634ace2d3e96953`.

````text
---
annotations_creators:
- no-annotation
language_creators:
- expert-generated
language:
- en
license:
- mit
multilinguality:
- monolingual
size_categories:
- 10K<n<100K
source_datasets:
- original
task_categories:
- question-answering
task_ids:
- multiple-choice-qa
paperswithcode_id: mmlu
pretty_name: Measuring Massive Multitask Language Understanding
language_bcp47:
- en-US
dataset_info:
- config_name: abstract_algebra
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 49618.6654322746
    num_examples: 100
  - name: validation
    num_bytes: 5485.515349444808
    num_examples: 11
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 17143
  dataset_size: 57303.3562203159
- config_name: all
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 6967453
    num_examples: 14042
  - name: validation
    num_bytes: 763484
    num_examples: 1531
  - name: dev
    num_bytes: 125353
    num_examples: 285
  - name: auxiliary_train
    num_bytes: 161000625
    num_examples: 99842
  download_size: 51503402
  dataset_size: 168856915
- config_name: anatomy
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 66985.19833357072
    num_examples: 135
  - name: validation
    num_bytes: 6981.5649902024825
    num_examples: 14
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 28864
  dataset_size: 76165.9387623697
- config_name: astronomy
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 75420.3714570574
    num_examples: 152
  - name: validation
    num_bytes: 7978.931417374265
    num_examples: 16
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 39316
  dataset_size: 85598.47831302814
- config_name: auxiliary_train
  features:
  - name: train
    struct:
    - name: answer
      dtype: int64
    - name: choices
      sequence: string
    - name: question
      dtype: string
    - name: subject
      dtype: string
  splits:
  - name: train
    num_bytes: 161000625
    num_examples: 99842
  download_size: 47518592
  dataset_size: 161000625
- config_name: business_ethics
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 49618.6654322746
    num_examples: 100
  - name: validation
    num_bytes: 5485.515349444808
    num_examples: 11
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 31619
  dataset_size: 57303.3562203159
- config_name: clinical_knowledge
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 131489.4633955277
    num_examples: 265
  - name: validation
    num_bytes: 14461.813193990856
    num_examples: 29
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 51655
  dataset_size: 148150.45202811505
- config_name: college_biology
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 71450.87822247542
    num_examples: 144
  - name: validation
    num_bytes: 7978.931417374265
    num_examples: 16
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 43017
  dataset_size: 81628.98507844617
- config_name: college_chemistry
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 49618.6654322746
    num_examples: 100
  - name: validation
    num_bytes: 3989.4657086871325
    num_examples: 8
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 26781
  dataset_size: 55807.30657955822
- config_name: college_computer_science
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 49618.6654322746
    num_examples: 100
  - name: validation
    num_bytes: 5485.515349444808
    num_examples: 11
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 41132
  dataset_size: 57303.3562203159
- config_name: college_mathematics
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 49618.6654322746
    num_examples: 100
  - name: validation
    num_bytes: 5485.515349444808
    num_examples: 11
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 26779
  dataset_size: 57303.3562203159
- config_name: college_medicine
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 85840.29119783506
    num_examples: 173
  - name: validation
    num_bytes: 10971.030698889615
    num_examples: 22
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 56303
  dataset_size: 99010.49733532117
- config_name: college_physics
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 50611.0387409201
    num_examples: 102
  - name: validation
    num_bytes: 5485.515349444808
    num_examples: 11
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 29539
  dataset_size: 58295.7295289614
- config_name: computer_security
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 49618.6654322746
    num_examples: 100
  - name: validation
    num_bytes: 5485.515349444808
    num_examples: 11
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 30150
  dataset_size: 57303.3562203159
- config_name: conceptual_physics
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 116603.86376584532
    num_examples: 235
  - name: validation
    num_bytes: 12965.76355323318
    num_examples: 26
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 34968
  dataset_size: 131768.802757675
- config_name: econometrics
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 56565.27859279305
    num_examples: 114
  - name: validation
    num_bytes: 5984.198563030699
    num_examples: 12
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 36040
  dataset_size: 64748.652594420244
- config_name: electrical_engineering
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 71947.06487679818
    num_examples: 145
  - name: validation
    num_bytes: 7978.931417374265
    num_examples: 16
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 26746
  dataset_size: 82125.17173276893
- config_name: elementary_mathematics
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 187558.555333998
    num_examples: 378
  - name: validation
    num_bytes: 20446.011757021555
    num_examples: 41
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 54987
  dataset_size: 210203.74252961605
- config_name: formal_logic
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 62519.518444666
    num_examples: 126
  - name: validation
    num_bytes: 6981.5649902024825
    num_examples: 14
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 32884
  dataset_size: 71700.25887346498
- config_name: global_facts
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 49618.6654322746
    num_examples: 100
  - name: validation
    num_bytes: 4986.8321358589155
    num_examples: 10
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 19258
  dataset_size: 56804.67300673001
- config_name: high_school_biology
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 153817.86284005127
    num_examples: 310
  - name: validation
    num_bytes: 15957.86283474853
    num_examples: 32
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 78216
  dataset_size: 171974.90111339628
- config_name: high_school_chemistry
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 100725.89082751745
    num_examples: 203
  - name: validation
    num_bytes: 10971.030698889615
    num_examples: 22
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 45799
  dataset_size: 113896.09696500355
- config_name: high_school_computer_science
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 49618.6654322746
    num_examples: 100
  - name: validation
    num_bytes: 4488.148922273024
    num_examples: 9
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 39072
  dataset_size: 56305.989793144116
- config_name: high_school_european_history
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 81870.79796325309
    num_examples: 165
  - name: validation
    num_bytes: 8976.297844546049
    num_examples: 18
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 196270
  dataset_size: 93046.27124639563
- config_name: high_school_geography
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 98244.95755590372
    num_examples: 198
  - name: validation
    num_bytes: 10971.030698889615
    num_examples: 22
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 38255
  dataset_size: 111415.16369338983
- config_name: high_school_government_and_politics
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 95764.02428428999
    num_examples: 193
  - name: validation
    num_bytes: 10472.347485303722
    num_examples: 21
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 52963
  dataset_size: 108435.5472081902
- config_name: high_school_macroeconomics
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 193512.79518587096
    num_examples: 390
  - name: validation
    num_bytes: 21443.378184193338
    num_examples: 43
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 68758
  dataset_size: 217155.34880866078
- config_name: high_school_mathematics
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 133970.39666714144
    num_examples: 270
  - name: validation
    num_bytes: 14461.813193990856
    num_examples: 29
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 45210
  dataset_size: 150631.38529972878
- config_name: high_school_microeconomics
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 118092.42372881356
    num_examples: 238
  - name: validation
    num_bytes: 12965.76355323318
    num_examples: 26
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 49885
  dataset_size: 133257.36272064323
- config_name: high_school_physics
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 74924.18480273466
    num_examples: 151
  - name: validation
    num_bytes: 8477.614630960157
    num_examples: 17
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 45483
  dataset_size: 85600.9748722913
- config_name: high_school_psychology
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 270421.7266058966
    num_examples: 545
  - name: validation
    num_bytes: 29920.992815153495
    num_examples: 60
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 113158
  dataset_size: 302541.8948596466
- config_name: high_school_statistics
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 107176.31733371314
    num_examples: 216
  - name: validation
    num_bytes: 11469.713912475507
    num_examples: 23
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 74924
  dataset_size: 120845.20668478514
- config_name: high_school_us_history
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 101222.0774818402
    num_examples: 204
  - name: validation
    num_bytes: 10971.030698889615
    num_examples: 22
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 200043
  dataset_size: 114392.2836193263
- config_name: high_school_world_history
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 117596.23707449081
    num_examples: 237
  - name: validation
    num_bytes: 12965.76355323318
    num_examples: 26
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 250302
  dataset_size: 132761.17606632048
- config_name: human_aging
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 110649.62391397236
    num_examples: 223
  - name: validation
    num_bytes: 11469.713912475507
    num_examples: 23
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 41196
  dataset_size: 124318.51326504436
- config_name: human_sexuality
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 65000.451716279735
    num_examples: 131
  - name: validation
    num_bytes: 5984.198563030699
    num_examples: 12
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 32533
  dataset_size: 73183.82571790692
- config_name: international_law
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 60038.58517305227
    num_examples: 121
  - name: validation
    num_bytes: 6482.88177661659
    num_examples: 13
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 41592
  dataset_size: 68720.64238826535
- config_name: jurisprudence
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 53588.15866685657
    num_examples: 108
  - name: validation
    num_bytes: 5485.515349444808
    num_examples: 11
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 33578
  dataset_size: 61272.84945489787
- config_name: logical_fallacies
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 80878.4246546076
    num_examples: 163
  - name: validation
    num_bytes: 8976.297844546049
    num_examples: 18
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 33669
  dataset_size: 92053.89793775014
- config_name: machine_learning
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 55572.90528414756
    num_examples: 112
  - name: validation
    num_bytes: 5485.515349444808
    num_examples: 11
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 31121
  dataset_size: 63257.596072188855
- config_name: management
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 51107.225395242844
    num_examples: 103
  - name: validation
    num_bytes: 5485.515349444808
    num_examples: 11
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 22828
  dataset_size: 58791.91618328414
- config_name: marketing
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 116107.67711152257
    num_examples: 234
  - name: validation
    num_bytes: 12467.08033964729
    num_examples: 25
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 49747
  dataset_size: 130773.93288976635
- config_name: medical_genetics
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 49618.6654322746
    num_examples: 100
  - name: validation
    num_bytes: 5485.515349444808
    num_examples: 11
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 25775
  dataset_size: 57303.3562203159
- config_name: miscellaneous
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 388514.15033471014
    num_examples: 783
  - name: validation
    num_bytes: 42886.756368386676
    num_examples: 86
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 115097
  dataset_size: 433600.08214169333
- config_name: moral_disputes
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 171680.58239567012
    num_examples: 346
  - name: validation
    num_bytes: 18949.96211626388
    num_examples: 38
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 76043
  dataset_size: 192829.71995053047
- config_name: moral_scenarios
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 444087.05561885773
    num_examples: 895
  - name: validation
    num_bytes: 49868.32135858916
    num_examples: 100
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 109869
  dataset_size: 496154.5524160434
- config_name: nutrition
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 151833.1162227603
    num_examples: 306
  - name: validation
    num_bytes: 16456.54604833442
    num_examples: 33
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 69050
  dataset_size: 170488.8377096912
- config_name: philosophy
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 154314.04949437402
    num_examples: 311
  - name: validation
    num_bytes: 16955.229261920314
    num_examples: 34
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 61912
  dataset_size: 173468.45419489083
- config_name: prehistory
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 160764.47600056973
    num_examples: 324
  - name: validation
    num_bytes: 17453.912475506204
    num_examples: 35
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 68826
  dataset_size: 180417.5639146724
- config_name: professional_accounting
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 139924.6365190144
    num_examples: 282
  - name: validation
    num_bytes: 15459.179621162639
    num_examples: 31
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 87297
  dataset_size: 157582.99157877354
- config_name: professional_law
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 761150.3277310925
    num_examples: 1534
  - name: validation
    num_bytes: 84776.14630960157
    num_examples: 170
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 1167828
  dataset_size: 848125.6494792906
- config_name: professional_medicine
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 134962.7699757869
    num_examples: 272
  - name: validation
    num_bytes: 15459.179621162639
    num_examples: 31
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 153242
  dataset_size: 152621.12503554605
- config_name: professional_psychology
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 303666.2324455206
    num_examples: 612
  - name: validation
    num_bytes: 34409.14173742652
    num_examples: 69
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 159357
  dataset_size: 340274.5496215436
- config_name: public_relations
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 54580.53197550207
    num_examples: 110
  - name: validation
    num_bytes: 5984.198563030699
    num_examples: 12
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 31500
  dataset_size: 62763.90597712925
- config_name: security_studies
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 121565.73030907278
    num_examples: 245
  - name: validation
    num_bytes: 13464.446766819072
    num_examples: 27
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 140258
  dataset_size: 137229.35251448833
- config_name: sociology
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 99733.51751887196
    num_examples: 201
  - name: validation
    num_bytes: 10971.030698889615
    num_examples: 22
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 56480
  dataset_size: 112903.72365635807
- config_name: us_foreign_policy
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 49618.6654322746
    num_examples: 100
  - name: validation
    num_bytes: 5485.515349444808
    num_examples: 11
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 29027
  dataset_size: 57303.3562203159
- config_name: virology
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 82366.98461757584
    num_examples: 166
  - name: validation
    num_bytes: 8976.297844546049
    num_examples: 18
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 38229
  dataset_size: 93542.45790071838
- config_name: world_religions
  features:
  - name: question
    dtype: string
  - name: subject
    dtype: string
  - name: choices
    sequence: string
  - name: answer
    dtype:
      class_label:
        names:
          '0': A
          '1': B
          '2': C
          '3': D
  splits:
  - name: test
    num_bytes: 84847.91788918957
    num_examples: 171
  - name: validation
    num_bytes: 9474.98105813194
    num_examples: 19
  - name: dev
    num_bytes: 2199.1754385964914
    num_examples: 5
  download_size: 27165
  dataset_size: 96522.07438591801
configs:
- config_name: abstract_algebra
  data_files:
  - split: test
    path: abstract_algebra/test-*
  - split: validation
    path: abstract_algebra/validation-*
  - split: dev
    path: abstract_algebra/dev-*
- config_name: all
  data_files:
  - split: test
    path: all/test-*
  - split: validation
    path: all/validation-*
  - split: dev
    path: all/dev-*
  - split: auxiliary_train
    path: all/auxiliary_train-*
- config_name: anatomy
  data_files:
  - split: test
    path: anatomy/test-*
  - split: validation
    path: anatomy/validation-*
  - split: dev
    path: anatomy/dev-*
- config_name: astronomy
  data_files:
  - split: test
    path: astronomy/test-*
  - split: validation
    path: astronomy/validation-*
  - split: dev
    path: astronomy/dev-*
- config_name: auxiliary_train
  data_files:
  - split: train
    path: auxiliary_train/train-*
- config_name: business_ethics
  data_files:
  - split: test
    path: business_ethics/test-*
  - split: validation
    path: business_ethics/validation-*
  - split: dev
    path: business_ethics/dev-*
- config_name: clinical_knowledge
  data_files:
  - split: test
    path: clinical_knowledge/test-*
  - split: validation
    path: clinical_knowledge/validation-*
  - split: dev
    path: clinical_knowledge/dev-*
- config_name: college_biology
  data_files:
  - split: test
    path: college_biology/test-*
  - split: validation
    path: college_biology/validation-*
  - split: dev
    path: college_biology/dev-*
- config_name: college_chemistry
  data_files:
  - split: test
    path: college_chemistry/test-*
  - split: validation
    path: college_chemistry/validation-*
  - split: dev
    path: college_chemistry/dev-*
- config_name: college_computer_science
  data_files:
  - split: test
    path: college_computer_science/test-*
  - split: validation
    path: college_computer_science/validation-*
  - split: dev
    path: college_computer_science/dev-*
- config_name: college_mathematics
  data_files:
  - split: test
    path: college_mathematics/test-*
  - split: validation
    path: college_mathematics/validation-*
  - split: dev
    path: college_mathematics/dev-*
- config_name: college_medicine
  data_files:
  - split: test
    path: college_medicine/test-*
  - split: validation
    path: college_medicine/validation-*
  - split: dev
    path: college_medicine/dev-*
- config_name: college_physics
  data_files:
  - split: test
    path: college_physics/test-*
  - split: validation
    path: college_physics/validation-*
  - split: dev
    path: college_physics/dev-*
- config_name: computer_security
  data_files:
  - split: test
    path: computer_security/test-*
  - split: validation
    path: computer_security/validation-*
  - split: dev
    path: computer_security/dev-*
- config_name: conceptual_physics
  data_files:
  - split: test
    path: conceptual_physics/test-*
  - split: validation
    path: conceptual_physics/validation-*
  - split: dev
    path: conceptual_physics/dev-*
- config_name: econometrics
  data_files:
  - split: test
    path: econometrics/test-*
  - split: validation
    path: econometrics/validation-*
  - split: dev
    path: econometrics/dev-*
- config_name: electrical_engineering
  data_files:
  - split: test
    path: electrical_engineering/test-*
  - split: validation
    path: electrical_engineering/validation-*
  - split: dev
    path: electrical_engineering/dev-*
- config_name: elementary_mathematics
  data_files:
  - split: test
    path: elementary_mathematics/test-*
  - split: validation
    path: elementary_mathematics/validation-*
  - split: dev
    path: elementary_mathematics/dev-*
- config_name: formal_logic
  data_files:
  - split: test
    path: formal_logic/test-*
  - split: validation
    path: formal_logic/validation-*
  - split: dev
    path: formal_logic/dev-*
- config_name: global_facts
  data_files:
  - split: test
    path: global_facts/test-*
  - split: validation
    path: global_facts/validation-*
  - split: dev
    path: global_facts/dev-*
- config_name: high_school_biology
  data_files:
  - split: test
    path: high_school_biology/test-*
  - split: validation
    path: high_school_biology/validation-*
  - split: dev
    path: high_school_biology/dev-*
- config_name: high_school_chemistry
  data_files:
  - split: test
    path: high_school_chemistry/test-*
  - split: validation
    path: high_school_chemistry/validation-*
  - split: dev
    path: high_school_chemistry/dev-*
- config_name: high_school_computer_science
  data_files:
  - split: test
    path: high_school_computer_science/test-*
  - split: validation
    path: high_school_computer_science/validation-*
  - split: dev
    path: high_school_computer_science/dev-*
- config_name: high_school_european_history
  data_files:
  - split: test
    path: high_school_european_history/test-*
  - split: validation
    path: high_school_european_history/validation-*
  - split: dev
    path: high_school_european_history/dev-*
- config_name: high_school_geography
  data_files:
  - split: test
    path: high_school_geography/test-*
  - split: validation
    path: high_school_geography/validation-*
  - split: dev
    path: high_school_geography/dev-*
- config_name: high_school_government_and_politics
  data_files:
  - split: test
    path: high_school_government_and_politics/test-*
  - split: validation
    path: high_school_government_and_politics/validation-*
  - split: dev
    path: high_school_government_and_politics/dev-*
- config_name: high_school_macroeconomics
  data_files:
  - split: test
    path: high_school_macroeconomics/test-*
  - split: validation
    path: high_school_macroeconomics/validation-*
  - split: dev
    path: high_school_macroeconomics/dev-*
- config_name: high_school_mathematics
  data_files:
  - split: test
    path: high_school_mathematics/test-*
  - split: validation
    path: high_school_mathematics/validation-*
  - split: dev
    path: high_school_mathematics/dev-*
- config_name: high_school_microeconomics
  data_files:
  - split: test
    path: high_school_microeconomics/test-*
  - split: validation
    path: high_school_microeconomics/validation-*
  - split: dev
    path: high_school_microeconomics/dev-*
- config_name: high_school_physics
  data_files:
  - split: test
    path: high_school_physics/test-*
  - split: validation
    path: high_school_physics/validation-*
  - split: dev
    path: high_school_physics/dev-*
- config_name: high_school_psychology
  data_files:
  - split: test
    path: high_school_psychology/test-*
  - split: validation
    path: high_school_psychology/validation-*
  - split: dev
    path: high_school_psychology/dev-*
- config_name: high_school_statistics
  data_files:
  - split: test
    path: high_school_statistics/test-*
  - split: validation
    path: high_school_statistics/validation-*
  - split: dev
    path: high_school_statistics/dev-*
- config_name: high_school_us_history
  data_files:
  - split: test
    path: high_school_us_history/test-*
  - split: validation
    path: high_school_us_history/validation-*
  - split: dev
    path: high_school_us_history/dev-*
- config_name: high_school_world_history
  data_files:
  - split: test
    path: high_school_world_history/test-*
  - split: validation
    path: high_school_world_history/validation-*
  - split: dev
    path: high_school_world_history/dev-*
- config_name: human_aging
  data_files:
  - split: test
    path: human_aging/test-*
  - split: validation
    path: human_aging/validation-*
  - split: dev
    path: human_aging/dev-*
- config_name: human_sexuality
  data_files:
  - split: test
    path: human_sexuality/test-*
  - split: validation
    path: human_sexuality/validation-*
  - split: dev
    path: human_sexuality/dev-*
- config_name: international_law
  data_files:
  - split: test
    path: international_law/test-*
  - split: validation
    path: international_law/validation-*
  - split: dev
    path: international_law/dev-*
- config_name: jurisprudence
  data_files:
  - split: test
    path: jurisprudence/test-*
  - split: validation
    path: jurisprudence/validation-*
  - split: dev
    path: jurisprudence/dev-*
- config_name: logical_fallacies
  data_files:
  - split: test
    path: logical_fallacies/test-*
  - split: validation
    path: logical_fallacies/validation-*
  - split: dev
    path: logical_fallacies/dev-*
- config_name: machine_learning
  data_files:
  - split: test
    path: machine_learning/test-*
  - split: validation
    path: machine_learning/validation-*
  - split: dev
    path: machine_learning/dev-*
- config_name: management
  data_files:
  - split: test
    path: management/test-*
  - split: validation
    path: management/validation-*
  - split: dev
    path: management/dev-*
- config_name: marketing
  data_files:
  - split: test
    path: marketing/test-*
  - split: validation
    path: marketing/validation-*
  - split: dev
    path: marketing/dev-*
- config_name: medical_genetics
  data_files:
  - split: test
    path: medical_genetics/test-*
  - split: validation
    path: medical_genetics/validation-*
  - split: dev
    path: medical_genetics/dev-*
- config_name: miscellaneous
  data_files:
  - split: test
    path: miscellaneous/test-*
  - split: validation
    path: miscellaneous/validation-*
  - split: dev
    path: miscellaneous/dev-*
- config_name: moral_disputes
  data_files:
  - split: test
    path: moral_disputes/test-*
  - split: validation
    path: moral_disputes/validation-*
  - split: dev
    path: moral_disputes/dev-*
- config_name: moral_scenarios
  data_files:
  - split: test
    path: moral_scenarios/test-*
  - split: validation
    path: moral_scenarios/validation-*
  - split: dev
    path: moral_scenarios/dev-*
- config_name: nutrition
  data_files:
  - split: test
    path: nutrition/test-*
  - split: validation
    path: nutrition/validation-*
  - split: dev
    path: nutrition/dev-*
- config_name: philosophy
  data_files:
  - split: test
    path: philosophy/test-*
  - split: validation
    path: philosophy/validation-*
  - split: dev
    path: philosophy/dev-*
- config_name: prehistory
  data_files:
  - split: test
    path: prehistory/test-*
  - split: validation
    path: prehistory/validation-*
  - split: dev
    path: prehistory/dev-*
- config_name: professional_accounting
  data_files:
  - split: test
    path: professional_accounting/test-*
  - split: validation
    path: professional_accounting/validation-*
  - split: dev
    path: professional_accounting/dev-*
- config_name: professional_law
  data_files:
  - split: test
    path: professional_law/test-*
  - split: validation
    path: professional_law/validation-*
  - split: dev
    path: professional_law/dev-*
- config_name: professional_medicine
  data_files:
  - split: test
    path: professional_medicine/test-*
  - split: validation
    path: professional_medicine/validation-*
  - split: dev
    path: professional_medicine/dev-*
- config_name: professional_psychology
  data_files:
  - split: test
    path: professional_psychology/test-*
  - split: validation
    path: professional_psychology/validation-*
  - split: dev
    path: professional_psychology/dev-*
- config_name: public_relations
  data_files:
  - split: test
    path: public_relations/test-*
  - split: validation
    path: public_relations/validation-*
  - split: dev
    path: public_relations/dev-*
- config_name: security_studies
  data_files:
  - split: test
    path: security_studies/test-*
  - split: validation
    path: security_studies/validation-*
  - split: dev
    path: security_studies/dev-*
- config_name: sociology
  data_files:
  - split: test
    path: sociology/test-*
  - split: validation
    path: sociology/validation-*
  - split: dev
    path: sociology/dev-*
- config_name: us_foreign_policy
  data_files:
  - split: test
    path: us_foreign_policy/test-*
  - split: validation
    path: us_foreign_policy/validation-*
  - split: dev
    path: us_foreign_policy/dev-*
- config_name: virology
  data_files:
  - split: test
    path: virology/test-*
  - split: validation
    path: virology/validation-*
  - split: dev
    path: virology/dev-*
- config_name: world_religions
  data_files:
  - split: test
    path: world_religions/test-*
  - split: validation
    path: world_religions/validation-*
  - split: dev
    path: world_religions/dev-*
---

# Dataset Card for MMLU

## Table of Contents
- [Table of Contents](#table-of-contents)
- [Dataset Description](#dataset-description)
  - [Dataset Summary](#dataset-summary)
  - [Supported Tasks and Leaderboards](#supported-tasks-and-leaderboards)
  - [Languages](#languages)
- [Dataset Structure](#dataset-structure)
  - [Data Instances](#data-instances)
  - [Data Fields](#data-fields)
  - [Data Splits](#data-splits)
- [Dataset Creation](#dataset-creation)
  - [Curation Rationale](#curation-rationale)
  - [Source Data](#source-data)
  - [Annotations](#annotations)
  - [Personal and Sensitive Information](#personal-and-sensitive-information)
- [Considerations for Using the Data](#considerations-for-using-the-data)
  - [Social Impact of Dataset](#social-impact-of-dataset)
  - [Discussion of Biases](#discussion-of-biases)
  - [Other Known Limitations](#other-known-limitations)
- [Additional Information](#additional-information)
  - [Dataset Curators](#dataset-curators)
  - [Licensing Information](#licensing-information)
  - [Citation Information](#citation-information)
  - [Contributions](#contributions)

## Dataset Description

- **Repository**: https://github.com/hendrycks/test
- **Paper**: https://arxiv.org/abs/2009.03300

### Dataset Summary

[Measuring Massive Multitask Language Understanding](https://arxiv.org/pdf/2009.03300) by [Dan Hendrycks](https://people.eecs.berkeley.edu/~hendrycks/), [Collin Burns](http://collinpburns.com), [Steven Basart](https://stevenbas.art), Andy Zou, Mantas Mazeika, [Dawn Song](https://people.eecs.berkeley.edu/~dawnsong/), and [Jacob Steinhardt](https://www.stat.berkeley.edu/~jsteinhardt/) (ICLR 2021).

This is a massive multitask test consisting of multiple-choice questions from various branches of knowledge. The test spans subjects in the humanities, social sciences, hard sciences, and other areas that are important for some people to learn. This covers 57 tasks including elementary mathematics, US history, computer science, law, and more. To attain high accuracy on this test, models must possess extensive world knowledge and problem solving ability.

A complete list of tasks: ['abstract_algebra', 'anatomy', 'astronomy', 'business_ethics', 'clinical_knowledge', 'college_biology', 'college_chemistry', 'college_computer_science', 'college_mathematics', 'college_medicine', 'college_physics', 'computer_security', 'conceptual_physics', 'econometrics', 'electrical_engineering', 'elementary_mathematics', 'formal_logic', 'global_facts', 'high_school_biology', 'high_school_chemistry', 'high_school_computer_science', 'high_school_european_history', 'high_school_geography', 'high_school_government_and_politics', 'high_school_macroeconomics', 'high_school_mathematics', 'high_school_microeconomics', 'high_school_physics', 'high_school_psychology', 'high_school_statistics', 'high_school_us_history', 'high_school_world_history', 'human_aging', 'human_sexuality', 'international_law', 'jurisprudence', 'logical_fallacies', 'machine_learning', 'management', 'marketing', 'medical_genetics', 'miscellaneous', 'moral_disputes', 'moral_scenarios', 'nutrition', 'philosophy', 'prehistory', 'professional_accounting', 'professional_law', 'professional_medicine', 'professional_psychology', 'public_relations', 'security_studies', 'sociology', 'us_foreign_policy', 'virology', 'world_religions']

### Supported Tasks and Leaderboards

|                Model               | Authors |  Humanities |  Social Science  | STEM | Other | Average |
|------------------------------------|----------|:-------:|:-------:|:-------:|:-------:|:-------:|
| [UnifiedQA](https://arxiv.org/abs/2005.00700) | Khashabi et al., 2020 | 45.6 | 56.6 | 40.2 | 54.6 | 48.9
| [GPT-3](https://arxiv.org/abs/2005.14165) (few-shot) | Brown et al., 2020 | 40.8 | 50.4 | 36.7 | 48.8 | 43.9
| [GPT-2](https://arxiv.org/abs/2005.14165) | Radford et al., 2019 | 32.8 | 33.3 | 30.2 | 33.1 | 32.4
| Random Baseline           | N/A | 25.0 | 25.0 | 25.0 | 25.0 | 25.0 | 25.0

### Languages

English

## Dataset Structure

### Data Instances

An example from anatomy subtask looks as follows:
```
{
  "question": "What is the embryological origin of the hyoid bone?",
  "choices": ["The first pharyngeal arch", "The first and second pharyngeal arches", "The second pharyngeal arch", "The second and third pharyngeal arches"],
  "answer": "D"
}
```

### Data Fields

- `question`: a string feature
- `choices`: a list of 4 string features
- `answer`: a ClassLabel feature

### Data Splits

- `auxiliary_train`: auxiliary multiple-choice training questions from ARC, MC_TEST, OBQA, RACE, etc.
- `dev`: 5 examples per subtask, meant for few-shot setting
- `test`: there are at least 100 examples per subtask

|       | auxiliary_train   | dev | val | test |
| ----- | :------: | :-----: | :-----: | :-----: |
| TOTAL | 99842 | 285 | 1531 | 14042

## Dataset Creation

### Curation Rationale

Transformer models have driven this recent progress by pretraining on massive text corpora, including all of Wikipedia, thousands of books, and numerous websites. These models consequently see extensive information about specialized topics, most of which is not assessed by existing NLP benchmarks. To bridge the gap between the wide-ranging knowledge that models see during pretraining and the existing measures of success, we introduce a new benchmark for assessing models across a diverse set of subjects that humans learn.

### Source Data

#### Initial Data Collection and Normalization

[More Information Needed]

#### Who are the source language producers?

[More Information Needed]

### Annotations

#### Annotation process

[More Information Needed]

#### Who are the annotators?

[More Information Needed]

### Personal and Sensitive Information

[More Information Needed]

## Considerations for Using the Data

### Social Impact of Dataset

[More Information Needed]

### Discussion of Biases

[More Information Needed]

### Other Known Limitations

[More Information Needed]

## Additional Information

### Dataset Curators

[More Information Needed]

### Licensing Information

[MIT License](https://github.com/hendrycks/test/blob/master/LICENSE)

### Citation Information

If you find this useful in your research, please consider citing the test and also the [ETHICS](https://arxiv.org/abs/2008.02275) dataset it draws from:
```
    @article{hendryckstest2021,
      title={Measuring Massive Multitask Language Understanding},
      author={Dan Hendrycks and Collin Burns and Steven Basart and Andy Zou and Mantas Mazeika and Dawn Song and Jacob Steinhardt},
      journal={Proceedings of the International Conference on Learning Representations (ICLR)},
      year={2021}
    }

    @article{hendrycks2021ethics,
      title={Aligning AI With Shared Human Values},
      author={Dan Hendrycks and Collin Burns and Steven Basart and Andrew Critch and Jerry Li and Dawn Song and Jacob Steinhardt},
      journal={Proceedings of the International Conference on Learning Representations (ICLR)},
      year={2021}
    }
```
### Contributions

Thanks to [@andyzoujm](https://github.com/andyzoujm) for adding this dataset.
````

### .build/quantization-research/heldout-grader-runtime-v1/budget.json

Original bytes: 688. SHA-256: `845b2371286ce61dbf68cb3cb67638c1b6d78838445901d708b3be56f540d462`.

Normalized bytes: 688. SHA-256: `845b2371286ce61dbf68cb3cb67638c1b6d78838445901d708b3be56f540d462`.

````text
{
  "created_at": "2026-10-04T09:54:55.501333+00:00",
  "scope": "Separate local public-corpus grader runtime; no inference or model evaluation",
  "packages": {
    "nltk": "3.9.2",
    "langdetect": "1.0.9",
    "immutabledict": "4.2.2",
    "absl-py": "2.3.1",
    "pyarrow": "21.0.0"
  },
  "maximum_new_allocated_bytes": 300000000,
  "maximum_research_staging_bytes": 370000000000,
  "maximum_process_tree_bytes": 1000000000,
  "minimum_headroom_bytes": 3000000000,
  "maximum_seconds": 600,
  "network": "Only pinned public dependency and dataset acquisition; model grading is offline",
  "model_runs": 0,
  "paid_compute_usd": 0,
  "installed_model_and_main_venv_changes": false
}
````

### .build/quantization-research/heldout-grader-runtime-v1/prospective-install.json

Original bytes: 3091. SHA-256: `4a58ab1353b0432c6e5f56fd5a32f74512db7cc56c612edd6e9820b7cbcc5533`.

Normalized bytes: 3070. SHA-256: `1a8fba25b0172efc54c6771d26b89fe9062de6a2b9307edbb04c7dc3692bf3b0`.

````text
{
  "complete": false,
  "protocol_sha256": "845b2371286ce61dbf68cb3cb67638c1b6d78838445901d708b3be56f540d462",
  "pins": {
    "nltk": "3.9.2",
    "langdetect": "1.0.9",
    "immutabledict": "4.2.2",
    "absl-py": "2.3.1",
    "pyarrow": "21.0.0",
    "click": "8.1.8",
    "joblib": "1.4.2",
    "regex": "2024.11.6",
    "tqdm": "4.67.1",
    "six": "1.17.0"
  },
  "peak_process_tree_bytes": 0,
  "samples": 0,
  "maximum_new_allocated_bytes": 300000000,
  "maximum_research_staging_bytes": 370000000000,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 36872208384,
    "swapins": 436,
    "swapouts": 3020,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   452121.\nPages active:                                1030481.\nPages inactive:                               713212.\nPages speculative:                            338401.\nPages throttled:                                   0.\nPages wired down:                             176425.\nPages purgeable:                                2292.\n\"Translation faults\":                     2987065434.\nPages copy-on-write:                       181898161.\nPages zero filled:                        8076128744.\nPages reactivated:                         271349607.\nPages purged:                               14178099.\nFile-backed pages:                           1796088.\nAnonymous pages:                              286006.\nPages stored in compressor:                   807348.\nPages occupied by compressor:                 373927.\nDecompressions:                            122477619.\nCompressions:                              138875097.\nPageins:                                  3650428493.\nPageouts:                                     587151.\nSwapins:                                         436.\nSwapouts:                                       3020.\nPages tagged:                                 127143.\nPages tagged resident:                         90216.\nPages tagged compressed:                       36927.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5222.\nPages tag-storage free:                          986.\nPages tag-storage non-tag pageable:            92088.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5760960.\nTagged compressions:                         1056944.\nTagged decompressions:                        919261.\n"
  },
  "command": [
    "<HOME>/.local/bin/uv",
    "pip",
    "install",
    "--no-cache",
    "--index-url",
    "https://pypi.org/simple",
    "--python",
    "<HOME>/Projects/slotstream/.venv/bin/python",
    "--target",
    "<HOME>/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/packages",
    "absl-py==2.3.1",
    "click==8.1.8",
    "immutabledict==4.2.2",
    "joblib==1.4.2",
    "langdetect==1.0.9",
    "nltk==3.9.2",
    "pyarrow==21.0.0",
    "regex==2024.11.6",
    "six==1.17.0",
    "tqdm==4.67.1"
  ]
}
````

### .build/quantization-research/heldout-grader-runtime-v1/install-receipt.json

Original bytes: 3367. SHA-256: `5cfd764b6a06c4c1d53743e51751d58f6c1fadd861fa0bc958d7a6f82f6b7dc0`.

Normalized bytes: 3339. SHA-256: `0c749b0eb3b4f96155492baf326a2a8092d2c878ed4cab6e550ab6c3466ab61e`.

````text
{
  "complete": false,
  "protocol_sha256": "845b2371286ce61dbf68cb3cb67638c1b6d78838445901d708b3be56f540d462",
  "pins": {
    "nltk": "3.9.2",
    "langdetect": "1.0.9",
    "immutabledict": "4.2.2",
    "absl-py": "2.3.1",
    "pyarrow": "21.0.0",
    "click": "8.1.8",
    "joblib": "1.4.2",
    "regex": "2024.11.6",
    "tqdm": "4.67.1",
    "six": "1.17.0"
  },
  "peak_process_tree_bytes": 73040952,
  "samples": 19,
  "maximum_new_allocated_bytes": 300000000,
  "maximum_research_staging_bytes": 370000000000,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 36872208384,
    "swapins": 436,
    "swapouts": 3020,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   452121.\nPages active:                                1030481.\nPages inactive:                               713212.\nPages speculative:                            338401.\nPages throttled:                                   0.\nPages wired down:                             176425.\nPages purgeable:                                2292.\n\"Translation faults\":                     2987065434.\nPages copy-on-write:                       181898161.\nPages zero filled:                        8076128744.\nPages reactivated:                         271349607.\nPages purged:                               14178099.\nFile-backed pages:                           1796088.\nAnonymous pages:                              286006.\nPages stored in compressor:                   807348.\nPages occupied by compressor:                 373927.\nDecompressions:                            122477619.\nCompressions:                              138875097.\nPageins:                                  3650428493.\nPageouts:                                     587151.\nSwapins:                                         436.\nSwapouts:                                       3020.\nPages tagged:                                 127143.\nPages tagged resident:                         90216.\nPages tagged compressed:                       36927.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5222.\nPages tag-storage free:                          986.\nPages tag-storage non-tag pageable:            92088.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5760960.\nTagged compressions:                         1056944.\nTagged decompressions:                        919261.\n"
  },
  "command": [
    "<HOME>/.local/bin/uv",
    "pip",
    "install",
    "--no-cache",
    "--index-url",
    "https://pypi.org/simple",
    "--python",
    "<HOME>/Projects/slotstream/.venv/bin/python",
    "--target",
    "<HOME>/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/packages",
    "absl-py==2.3.1",
    "click==8.1.8",
    "immutabledict==4.2.2",
    "joblib==1.4.2",
    "langdetect==1.0.9",
    "nltk==3.9.2",
    "pyarrow==21.0.0",
    "regex==2024.11.6",
    "six==1.17.0",
    "tqdm==4.67.1"
  ],
  "failure": "FileNotFoundError: [Errno 2] No such file or directory: '<HOME>/Projects/slotstream/.build/quantization-research/heldout-grader-runtime-v1/tmp/.tmpJrVsGf/archive-v0/vkieCedDJ1CrDTp2nD3cO/pyarrow/include/arrow/vendored'",
  "seconds": 2.532509667
}
````

### .build/quantization-research/heldout-grader-runtime-v1/verification-receipt-v2.json

Original bytes: 248866. SHA-256: `c870658033b50630a97ea0b235ede503138fc7bf2e9a0a2243c636ab8a668ab2`.

Normalized bytes: 248866. SHA-256: `c870658033b50630a97ea0b235ede503138fc7bf2e9a0a2243c636ab8a668ab2`.

````zlib-base64
eNrUvVlvpld2pXnfvyLh2y5FnnlwXyXKCbgAl41OZ3VfBs4o0WKQNMnQkIX67/WsLyRnZvl9SX7h
gCGlbCmCZAQ3z9nDWvvs4X/+X7/5zd+M+w8Pt+t5/c3f/ub58eP6L/rY07h/0Af+5g+rza/u725/
/M3jGvffrccff9P283r8zdPHMdbT0/54+5ubu6fndnvLB2/vv/5Nu5u/eV4fHu4f2+OPX80b/tzz
PX9s3X38sB7b88393W8e21j/z2/u7vlLf/rDl4//zeV7j8fVntd8354lgDMufWXNVyb80dS/jfVv
TXmXY7XV/N/G/K0xn/7Mbje3/JGf/rL3fM918/D8/umb5mLSXxPHnjmFnppJIww7o8/Br2hz5Ndl
p2F3m7Mk/mP6qLHM3NIubqee5/jp2zzwDfjb/ie/5nd3t8/f6u/27+o7d/kCPnjb7r6enOa4SG/f
mXf150/dfPjw8bl1BL359Nnwzv35D7b+dPvVw4+Xn/mdf2d//vjDj+3x8f77y8f115mfPzFub8bl
+5d39l35+aP/ct9vb/qn7x3+/Lc/rq/XDz+dZ3hn7bv082ee/3V++CRMyn/+rk83P3z6O2zmO/Kx
//Xpbr5Z41sOWsrwON+vu+fHm6UjsdGFTzfBRfzFGT208W37ej39Vj/eb99zQzfP79+/u/ycn76E
L+o/Pl/+TDL5v/z8sT9f3U7O5eq3qaskZ7nGsWa2K9tRhp+lppVD2yO3nJOL0Tr+b7WVdxyt1Po3
l7/yf/2XI4Haw8OJLDb6ZA6kmTa5VMvo/Cs7k23uKe4wA9+vuZV8KCEP07zJZRRfQs3GrppTHN3m
kF6X5uZQnFLigTQ+zpDsNMukFpGHI/C5hFDmdLN1V92cvbdUPOc1Z/Y7rx5S2CmuYMJ+SRr8wgeM
+f1d+7BODsm54g+kssnEGjiB2iJnM6oZIXRdVh4hjpRXbKOmWGso3eSA3NvGkZEthlXjS1Lt2/b1
02uKlFM6Oq26dy89V+c6GsTvohnNzT69iYuPYerN+DHSNsab4bbv5qJELs5W41vkao9f4+bunt8/
tMen9Xh2bia5eiBgan2sYIeZw6Wx+bYud5S61TA4MTubRcemaxMJS/MzcJcuhrxXcyG/RcC59s3d
ejoRLLpSD/UsGNfL9tOH1HdOZvTZk5P1jRVXa3zKrmTcxDScbyvO0qPbO4QmY32DYOuHsR4UBc5k
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
8OPedrm6uHu82e68f/dfv/tv51AJqA==
````

### .build/quantization-research/heldout-grader-runtime-v1/install.log

Original bytes: 13575. SHA-256: `c2ddc6207ebfcf12045475f19693e19d750aef50e8a87a11d748274d8e299e52`.

Normalized bytes: 13575. SHA-256: `c2ddc6207ebfcf12045475f19693e19d750aef50e8a87a11d748274d8e299e52`.

````text
Using CPython 3.12.9 interpreter at: .venv/bin/python
WARN Skipping file for joblib: joblib-0.10.0-py3.5.egg
WARN Skipping file for joblib: joblib-0.10.2-py2.7.egg
WARN Skipping file for joblib: joblib-0.10.3-py3.5.egg
WARN Skipping file for joblib: joblib-0.1a.dev-py2.5.egg
WARN Skipping file for joblib: joblib-0.2a.dev-py2.5.egg
WARN Skipping file for joblib: joblib-0.3.2d.dev.tar.gz
WARN Skipping file for joblib: joblib-0.3.2e.dev.tar.gz
WARN Skipping file for joblib: joblib-0.3.2f.dev.tar.gz
WARN Skipping file for joblib: joblib-0.3.2g.dev.tar.gz
WARN Skipping file for joblib: joblib-0.3.5.dev-py2.6.egg
WARN Skipping file for joblib: joblib-0.3.6.dev-py2.5.egg
WARN Skipping file for joblib: joblib-0.4.0.dev-py2.6.egg
WARN Skipping file for joblib: joblib-0.4.1.dev-py2.6.egg
WARN Skipping file for joblib: joblib-0.4.2.dev-py2.5.egg
WARN Skipping file for joblib: joblib-0.4.3.dev-py2.5.egg
WARN Skipping file for joblib: joblib-0.4.3.dev-py2.6.egg
WARN Skipping file for joblib: joblib-0.4.4.dev-py2.6.egg
WARN Skipping file for joblib: joblib-0.4.5.dev-py2.6.egg
WARN Skipping file for joblib: joblib-0.4.6.dev-py2.6.egg
WARN Skipping file for joblib: joblib-0.5.0.dev-py2.6.egg
WARN Skipping file for joblib: joblib-0.5.0a.dev-py2.6.egg
WARN Skipping file for joblib: joblib-0.5.1.dev-py2.6.egg
WARN Skipping file for joblib: joblib-0.5.2.dev-py2.6.egg
WARN Skipping file for joblib: joblib-0.5.3.dev-py2.6.egg
WARN Skipping file for joblib: joblib-0.5.4.dev-py2.6.egg
WARN Skipping file for joblib: joblib-0.5.5.dev-py2.6.egg
WARN Skipping file for joblib: joblib-0.5.6.dev-py2.6.egg
WARN Skipping file for joblib: joblib-0.5.7-py2.7.egg
WARN Skipping file for joblib: joblib-0.5.7.dev-py2.7.egg
WARN Skipping file for joblib: joblib-0.5.7a-py3.2.egg
WARN Skipping file for joblib: joblib-0.5.7a.dev-py2.6.egg
WARN Skipping file for joblib: joblib-0.5.7a.dev-py2.7.egg
WARN Skipping file for joblib: joblib-0.5.7b.dev-py2.7.egg
WARN Skipping file for joblib: joblib-0.6.0-py2.7.egg
WARN Skipping file for joblib: joblib-0.6.0a-py2.7.egg
WARN Skipping file for joblib: joblib-0.6.0b-py2.7.egg
WARN Skipping file for joblib: joblib-0.6.0b2-py2.7.egg
WARN Skipping file for joblib: joblib-0.6.0b3-py2.7.egg
WARN Skipping file for joblib: joblib-0.6.1-py2.7.egg
WARN Skipping file for joblib: joblib-0.6.2-py2.7.egg
WARN Skipping file for joblib: joblib-0.6.3-py2.7.egg
WARN Skipping file for joblib: joblib-0.6.4-py2.7.egg
WARN Skipping file for joblib: joblib-0.6.5-py2.7.egg
WARN Skipping file for joblib: joblib-0.7.0a-py2.7.egg
WARN Skipping file for joblib: joblib-0.7.0b-py2.7.egg
WARN Skipping file for joblib: joblib-0.7.0c-py2.7.egg
WARN Skipping file for joblib: joblib-0.7.0d-py2.7.egg
WARN Skipping file for joblib: joblib-0.7.0d.tar.gz
WARN Skipping file for joblib: joblib-0.7.1-py2.7.egg
WARN Skipping file for joblib: joblib-0.8.0-py2.7.egg
WARN Skipping file for joblib: joblib-0.8.0a-py2.7.egg
WARN Skipping file for joblib: joblib-0.8.0a2-py2.7.egg
WARN Skipping file for joblib: joblib-0.8.0a3-py2.7.egg
WARN Skipping file for joblib: joblib-0.8.1-py2.7.egg
WARN Skipping file for joblib: joblib-0.8.2-py2.7.egg
WARN Skipping file for joblib: joblib-0.8.3-py2.7.egg
WARN Skipping file for joblib: joblib-0.8.3-py3.4.egg
WARN Skipping file for joblib: joblib-0.8.3_r1-py2.7.egg
WARN Skipping file for joblib: joblib-0.8.3_r1-py3.4.egg
WARN Skipping file for joblib: joblib-0.8.4-py2.7.egg
WARN Skipping file for joblib: joblib-0.9.0b2-py2.7.egg
WARN Skipping file for joblib: joblib-0.9.0b3-py2.7.egg
WARN Skipping file for joblib: joblib-0.9.0b4-py2.7.egg
WARN Skipping file for joblib: joblib-0.9.1-py2.7.egg
WARN Skipping file for joblib: joblib-0.9.2-py2.7.egg
WARN Skipping file for joblib: joblib-0.9.3-py2.7.egg
WARN Skipping file for tqdm: tqdm-2.0.0.win32.exe
WARN Skipping file for tqdm: tqdm-2.2.3.win32.exe
WARN Skipping file for tqdm: tqdm-2.2.4.win32.exe
WARN Skipping file for tqdm: tqdm-3.1.3.win32.exe
WARN Skipping file for tqdm: tqdm-3.1.4.win32.exe
WARN Skipping file for tqdm: tqdm-3.4.0.win32.exe
WARN Skipping file for tqdm: tqdm-3.7.0.win32.exe
WARN Skipping file for tqdm: tqdm-3.7.1.win32.exe
WARN Skipping file for tqdm: tqdm-3.8.0.win32.exe
WARN Skipping file for tqdm: tqdm-4.11.1.win-amd64.exe
WARN Skipping file for tqdm: tqdm-4.4.0.win-amd64.exe
WARN Skipping file for tqdm: tqdm-4.4.0.win-amd64.msi
WARN Skipping file for tqdm: tqdm-4.4.0.win32.exe
WARN Skipping file for tqdm: tqdm-4.4.0.win32.msi
WARN Skipping file for tqdm: tqdm-4.6.1.win32.exe
WARN Skipping file for tqdm: tqdm-4.6.2.win32.exe
WARN Fixing invalid version specifier by removing star after comparison operator other than equal and not equal (before: `>=3.5.*`; after: `>=3.5`)
WARN Fixing invalid version specifier by removing star after comparison operator other than equal and not equal (before: `>=3.5.*`; after: `>=3.5`)
WARN Fixing invalid version specifier by removing star after comparison operator other than equal and not equal (before: `>=3.5.*`; after: `>=3.5`)
WARN Fixing invalid version specifier by removing star after comparison operator other than equal and not equal (before: `>=3.5.*`; after: `>=3.5`)
WARN Fixing invalid version specifier by removing star after comparison operator other than equal and not equal (before: `>=3.5.*`; after: `>=3.5`)
WARN Fixing invalid version specifier by removing star after comparison operator other than equal and not equal (before: `>=3.5.*`; after: `>=3.5`)
WARN Skipping file for nltk: nltk-2.0.1.win32.exe
WARN Skipping file for nltk: nltk-2.0.1rc1.macosx-10.6-x86_64.tar.gz
WARN Skipping file for nltk: nltk-2.0.1rc2-git.tar.gz
WARN Skipping file for nltk: nltk-2.0.1rc2-git.win32.exe
WARN Skipping file for nltk: nltk-2.0.1rc3.win32.exe
WARN Skipping file for nltk: nltk-2.0.1rc4.win32.exe
WARN Skipping file for nltk: nltk-2.0.2.win32.exe
WARN Skipping file for nltk: nltk-2.0.3.win32.exe
WARN Skipping file for nltk: nltk-2.0.4.win32.exe
WARN Skipping file for nltk: nltk-2.0.5.win32.exe
WARN Skipping file for nltk: nltk-2.0b8.macosx-10.5-i386.tar.gz
WARN Skipping file for nltk: nltk-3.0.0.win32.exe
WARN Skipping file for nltk: nltk-3.0.0b1.win32.exe
WARN Skipping file for nltk: nltk-3.0.0b2.win32.exe
WARN Skipping file for nltk: nltk-3.0.1.win32.exe
WARN Skipping file for nltk: nltk-3.0.2.win32.exe
WARN Skipping file for nltk: nltk-3.0.3.win32.exe
WARN Skipping file for nltk: nltk-3.0.4.win32.exe
WARN Skipping file for nltk: nltk-3.0.5.win32.exe
WARN Skipping file for nltk: nltk-3.1.win32.exe
WARN Skipping file for nltk: nltk-3.2.1.win32.exe
WARN Skipping file for nltk: nltk-3.2.2.win32.exe
WARN Skipping file for nltk: nltk-3.2.3.win32.exe
WARN Skipping file for nltk: nltk-3.2.4.win32.exe
WARN Skipping file for nltk: nltk-3.2.5.win32.exe
WARN Skipping file for nltk: nltk-3.2.win32.exe
WARN Skipping file for nltk: nltk-3.3.0.win32.exe
WARN Skipping file for nltk: nltk-3.4.1.win32.exe
WARN Skipping file for nltk: nltk-3.4.2.win32.exe
WARN Skipping file for nltk: nltk-3.4.3.win32.exe
WARN Skipping file for nltk: nltk-3.4.4.win32.exe
WARN Skipping file for nltk: nltk-3.4.5.win32.exe
WARN Skipping file for nltk: nltk-3.4.win32.exe
WARN Skipping file for regex: regex-2013-02-16.tar.gz
WARN Skipping file for regex: regex-2013-02-23.tar.gz
WARN Skipping file for regex: regex-2013-03-11.tar.gz
WARN Skipping file for regex: regex-2013-05-21.tar.gz
WARN Skipping file for regex: regex-2013-06-05.tar.gz
WARN Skipping file for regex: regex-2013-06-26.tar.gz
WARN Skipping file for regex: regex-2013-08-04.tar.gz
WARN Skipping file for regex: regex-2013-10-04.tar.gz
WARN Skipping file for regex: regex-2013-10-12.tar.gz
WARN Skipping file for regex: regex-2013-10-21.tar.gz
WARN Skipping file for regex: regex-2013-10-22.tar.gz
WARN Skipping file for regex: regex-2013-10-23.tar.gz
WARN Skipping file for regex: regex-2013-10-24.tar.gz
WARN Skipping file for regex: regex-2013-10-25.tar.gz
WARN Skipping file for regex: regex-2013-10-26.tar.gz
WARN Skipping file for regex: regex-2013-11-29.tar.gz
WARN Skipping file for regex: regex-2013-12-31.tar.gz
Resolved 10 packages in 350ms
Downloading pyarrow (29.7MiB)
Downloading nltk (1.4MiB)
   Building langdetect==1.0.9
WARN Skipping file for setuptools: setuptools-0.6b1-py2.3.egg
WARN Skipping file for setuptools: setuptools-0.6b1-py2.4.egg
WARN Skipping file for setuptools: setuptools-0.6b2-py2.3.egg
WARN Skipping file for setuptools: setuptools-0.6b2-py2.4.egg
WARN Skipping file for setuptools: setuptools-0.6b3-py2.3.egg
WARN Skipping file for setuptools: setuptools-0.6b3-py2.4.egg
WARN Skipping file for setuptools: setuptools-0.6b4-py2.3.egg
WARN Skipping file for setuptools: setuptools-0.6b4-py2.4.egg
WARN Skipping file for setuptools: setuptools-0.6c1-py2.3.egg
WARN Skipping file for setuptools: setuptools-0.6c1-py2.4.egg
WARN Skipping file for setuptools: setuptools-0.6c10-1.src.rpm
WARN Skipping file for setuptools: setuptools-0.6c10-py2.3.egg
WARN Skipping file for setuptools: setuptools-0.6c10-py2.4.egg
WARN Skipping file for setuptools: setuptools-0.6c10-py2.5.egg
WARN Skipping file for setuptools: setuptools-0.6c10-py2.6.egg
WARN Skipping file for setuptools: setuptools-0.6c10.win32-py2.3.exe
WARN Skipping file for setuptools: setuptools-0.6c10.win32-py2.4.exe
WARN Skipping file for setuptools: setuptools-0.6c10.win32-py2.5.exe
WARN Skipping file for setuptools: setuptools-0.6c10.win32-py2.6.exe
WARN Skipping file for setuptools: setuptools-0.6c11-1.src.rpm
WARN Skipping file for setuptools: setuptools-0.6c11-py2.3.egg
WARN Skipping file for setuptools: setuptools-0.6c11-py2.4.egg
WARN Skipping file for setuptools: setuptools-0.6c11-py2.5.egg
WARN Skipping file for setuptools: setuptools-0.6c11-py2.6.egg
WARN Skipping file for setuptools: setuptools-0.6c11-py2.7.egg
WARN Skipping file for setuptools: setuptools-0.6c11.win32-py2.3.exe
WARN Skipping file for setuptools: setuptools-0.6c11.win32-py2.4.exe
WARN Skipping file for setuptools: setuptools-0.6c11.win32-py2.5.exe
WARN Skipping file for setuptools: setuptools-0.6c11.win32-py2.6.exe
WARN Skipping file for setuptools: setuptools-0.6c11.win32-py2.7.exe
WARN Skipping file for setuptools: setuptools-0.6c2-py2.3.egg
WARN Skipping file for setuptools: setuptools-0.6c2-py2.4.egg
WARN Skipping file for setuptools: setuptools-0.6c3-py2.3.egg
WARN Skipping file for setuptools: setuptools-0.6c3-py2.4.egg
WARN Skipping file for setuptools: setuptools-0.6c3-py2.5.egg
WARN Skipping file for setuptools: setuptools-0.6c4-1.src.rpm
WARN Skipping file for setuptools: setuptools-0.6c4-py2.3.egg
WARN Skipping file for setuptools: setuptools-0.6c4-py2.4.egg
WARN Skipping file for setuptools: setuptools-0.6c4-py2.5.egg
WARN Skipping file for setuptools: setuptools-0.6c4.win32-py2.3.exe
WARN Skipping file for setuptools: setuptools-0.6c4.win32-py2.4.exe
WARN Skipping file for setuptools: setuptools-0.6c4.win32-py2.5.exe
WARN Skipping file for setuptools: setuptools-0.6c5-1.src.rpm
WARN Skipping file for setuptools: setuptools-0.6c5-py2.3.egg
WARN Skipping file for setuptools: setuptools-0.6c5-py2.4.egg
WARN Skipping file for setuptools: setuptools-0.6c5-py2.5.egg
WARN Skipping file for setuptools: setuptools-0.6c5.win32-py2.3.exe
WARN Skipping file for setuptools: setuptools-0.6c5.win32-py2.4.exe
WARN Skipping file for setuptools: setuptools-0.6c5.win32-py2.5.exe
WARN Skipping file for setuptools: setuptools-0.6c6-1.src.rpm
WARN Skipping file for setuptools: setuptools-0.6c6-py2.3.egg
WARN Skipping file for setuptools: setuptools-0.6c6-py2.4.egg
WARN Skipping file for setuptools: setuptools-0.6c6-py2.5.egg
WARN Skipping file for setuptools: setuptools-0.6c6.win32-py2.3.exe
WARN Skipping file for setuptools: setuptools-0.6c6.win32-py2.4.exe
WARN Skipping file for setuptools: setuptools-0.6c6.win32-py2.5.exe
WARN Skipping file for setuptools: setuptools-0.6c7-1.src.rpm
WARN Skipping file for setuptools: setuptools-0.6c7-py2.3.egg
WARN Skipping file for setuptools: setuptools-0.6c7-py2.4.egg
WARN Skipping file for setuptools: setuptools-0.6c7-py2.5.egg
WARN Skipping file for setuptools: setuptools-0.6c7.win32-py2.3.exe
WARN Skipping file for setuptools: setuptools-0.6c7.win32-py2.4.exe
WARN Skipping file for setuptools: setuptools-0.6c7.win32-py2.5.exe
WARN Skipping file for setuptools: setuptools-0.6c8-1.src.rpm
WARN Skipping file for setuptools: setuptools-0.6c8-py2.3.egg
WARN Skipping file for setuptools: setuptools-0.6c8-py2.4.egg
WARN Skipping file for setuptools: setuptools-0.6c8-py2.5.egg
WARN Skipping file for setuptools: setuptools-0.6c8.win32-py2.3.exe
WARN Skipping file for setuptools: setuptools-0.6c8.win32-py2.4.exe
WARN Skipping file for setuptools: setuptools-0.6c8.win32-py2.5.exe
WARN Skipping file for setuptools: setuptools-0.6c9-1.src.rpm
WARN Skipping file for setuptools: setuptools-0.6c9-py2.3.egg
WARN Skipping file for setuptools: setuptools-0.6c9-py2.4.egg
WARN Skipping file for setuptools: setuptools-0.6c9-py2.5.egg
WARN Skipping file for setuptools: setuptools-0.6c9-py2.6.egg
WARN Skipping file for setuptools: setuptools-0.6c9.win32-py2.3.exe
WARN Skipping file for setuptools: setuptools-0.6c9.win32-py2.4.exe
WARN Skipping file for setuptools: setuptools-0.6c9.win32-py2.5.exe
WARN Skipping file for setuptools: setuptools-18.3.1-py3.4.egg
 Downloaded nltk
      Built langdetect==1.0.9
 Downloaded pyarrow
Prepared 10 packages in 2.05s
Installed 10 packages in 10ms
 + absl-py==2.3.1
 + click==8.1.8
 + immutabledict==4.2.2
 + joblib==1.4.2
 + langdetect==1.0.9
 + nltk==3.9.2
 + pyarrow==21.0.0
 + regex==2024.11.6
 + six==1.17.0
 + tqdm==4.67.1
````
