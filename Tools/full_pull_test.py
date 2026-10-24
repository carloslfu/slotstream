"""Actual full-pull entry with tiny files and inert owned-client boundaries."""
import argparse
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

SCRIPT = Path(__file__).with_name('slotpack') / 'full_pull.py'
MODES = [('normal', [], None, 0), ('O', ['-O'], None, 1),
         ('OO', ['-OO'], None, 2), ('env1', [], '1', 1), ('env2', [], '2', 2)]

# This leaf imports no project dependencies: both local imports are explicit
# inert providers. It hashes real private files, then runs the actual main.
CHILD = r'''
import builtins, contextlib, hashlib, io, json, os, runpy, signal, socket
import subprocess, sys, threading, time, types, _thread
from pathlib import Path
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer

script, scenario, existing_text = sys.argv[1:]
existing = existing_text == '1'
root = Path.cwd()
package, dest, receipt = root/'package', root/'destination', root/'receipt.json'
package.mkdir(); dest.mkdir()
binary = root/'inert client'; binary.write_bytes(b'not executable\n')
binary.chmod(0o600)
trace, hashes, captured = [], [], io.StringIO()
prior = '{"prior":"preserved"}\n'
if existing:
    receipt.write_text(prior)
    (dest/'existing.txt').write_bytes(b'old destination marker\n')
data = {'first.bin': b'ORIG-a\n', 'nested/second.bin': b'ORIG-bb\n'}
pins = [dict(path=name, size=len(body), sha256=hashlib.sha256(body).hexdigest())
        for name, body in data.items()]
manifest = dict(files=pins, objects=[dict(size=3), dict(size=5)])
if scenario == 'pins':
    manifest['files'] = [dict(pins[0], sha256='0'*64), pins[1]]
(package/'manifest.json').write_text(json.dumps(manifest)+'\n')
source_files = {'Sources/Slotstream/One.swift': b'// source one\n',
                'Sources/CSlotpack/sub/tiny.h': b'// source two\n',
                'Sources/slotstream-cli/Entry.swift': b'// source three\n'}
for name, body in source_files.items():
    path = root/name; path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(body)
source_hashes = {name: hashlib.sha256(body).hexdigest()
                 for name, body in source_files.items()}
(root/'build.json').write_text(json.dumps({'sourceSHA256': source_hashes}))

def sha_file(path):
    path = Path(path)
    digest = hashlib.sha256(path.read_bytes()).hexdigest()
    hashes.append([str(path.relative_to(root)), digest])
    return digest

pack = types.ModuleType('pack'); pack.ROOT = root
pack.pins = lambda: [dict(row) for row in pins]
pack.sha_file = sha_file
checks = types.ModuleType('download_checks')
def compile_harness():
    trace.append(['compile_harness_stub'])
    return binary
checks.compile_harness = compile_harness
sys.modules['pack'] = pack; sys.modules['download_checks'] = checks

def forbidden(*args, **kwargs):
    raise RuntimeError('forbidden real process/network/native boundary')
original_import = builtins.__import__
def guarded_import(name, *args, **kwargs):
    if name.split('.')[0] in ('mlx', 'numpy', 'Codec', 'codec', 'ctypes', 'swift'):
        raise RuntimeError('forbidden native import: '+name)
    return original_import(name, *args, **kwargs)
builtins.__import__ = guarded_import
socket.socket = socket.create_connection = forbidden
subprocess.Popen = subprocess.run = subprocess.check_output = forbidden
subprocess.check_call = subprocess.call = forbidden
os.system = os.kill = os.killpg = forbidden
for name in ('fork', 'posix_spawn', 'posix_spawnp'):
    if hasattr(os, name): setattr(os, name, forbidden)
_thread.start_new_thread = forbidden
time.sleep = forbidden
clock = [0.0]
def monotonic():
    clock[0] += 0.125
    return clock[0]
time.monotonic = monotonic

primary = (KeyboardInterrupt('driver interrupted') if scenario in ('interrupt', 'wait_interrupt')
           else OSError('client start failed') if scenario == 'start'
           else BrokenPipeError('forwarding closed'))
cleanup = OSError('owned child cleanup failed')
server_error = OSError('server shutdown failed')
monitor_error = None
child = None
line = 'download verified: 0.00 GB received, 0 raw fallback chunks, 0.1 s\n'
if scenario.startswith('raw_'):
    line = 'download verified: 0.00 GB received, '+scenario[4:]+' raw fallback chunks, 0.1 s\n'
elif scenario == 'missing':
    line = 'download complete without qualification marker\n'
original_print = builtins.print
def forwarding_print(*args, **kwargs):
    text = str(args[0]) if args else ''
    if text == line:
        trace.append(['print_client'])
        if scenario in ('output', 'timeout', 'lookup', 'cleanup_signal',
                        'cleanup_wait', 'primary_server'):
            raise primary
    if text.startswith('RSS guard:'):
        trace.append(['print_guard'])
        if scenario == 'monitor': raise BrokenPipeError('monitor output closed')
    kwargs['file'] = captured
    return original_print(*args, **kwargs)
builtins.print = forwarding_print

class Lock:
    def __enter__(self): return self
    def __exit__(self, *args): return False
class Event:
    def __init__(self): self.done = False; self.observed = False
    def set(self): self.done = True; trace.append(['finished'])
    def wait(self, timeout):
        trace.append(['event_wait', timeout])
        if self.done or self.observed: return True
        self.observed = True
        return False
class Thread:
    def __init__(self, target, daemon): self.target = target
    def start(self):
        global monitor_error
        trace.append(['thread', self.target.__name__])
        if self.target.__name__ == 'monitor' and scenario == 'monitor':
            # A real thread reports its exception independently. This inert
            # boundary records it without creating a thread or changing main.
            try: self.target()
            except BaseException as error: monitor_error = type(error).__name__
threading.Lock = Lock; threading.Event = Event; threading.Thread = Thread

class Server:
    server_port = 18765
    def __init__(self, address, handler): trace.append(['server', list(address)])
    def serve_forever(self): forbidden()
    def shutdown(self):
        trace.append(['shutdown'])
        if scenario in ('server_error', 'primary_server'): raise server_error
import http.server
http.server.ThreadingHTTPServer = Server

class Output:
    def __iter__(self):
        yield line
        if scenario == 'interrupt': raise primary
class Client:
    pid = 43210
    def __init__(self, command, **kwargs):
        global child
        trace.append(['popen', command, kwargs['env']])
        if scenario == 'start': raise primary
        child = self; self.stdout = Output(); self.returncode = None
        self.signaled = False; self.killed = False; self.bounded_waits = 0
        for name, body in data.items():
            path = dest/name; path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(b'BAD!-a\n' if scenario == 'hash' and name == 'first.bin' else body)
    def poll(self):
        trace.append(['poll', self.returncode]); return self.returncode
    def send_signal(self, sig):
        trace.append(['signal', int(sig)])
        if scenario == 'cleanup_signal': raise cleanup
        if scenario == 'lookup': raise ProcessLookupError('exited during signal')
        self.signaled = True
    def wait(self, timeout=None):
        trace.append(['wait', timeout])
        if timeout is None and scenario == 'wait_interrupt': raise primary
        if timeout is not None:
            self.bounded_waits += 1
            if scenario == 'cleanup_wait': raise cleanup
            if scenario == 'timeout' and not self.killed:
                raise subprocess.TimeoutExpired('inert owned child', timeout)
        self.returncode = (-9 if self.killed else 7 if scenario == 'nonzero'
                           else 130 if scenario == 'monitor' and self.signaled else 0)
        return self.returncode
    def kill(self): self.killed = True; trace.append(['kill'])
subprocess.Popen = Client
def fake_ps(command, **kwargs):
    if command != ['ps', '-o', 'rss=', '-p', str(Client.pid)]: forbidden()
    trace.append(['ps', command])
    return types.SimpleNamespace(returncode=0, stdout='5000000\n')
subprocess.run = fake_ps

os.environ.update(SLOTSTREAM_PULL_CONNECTIONS='99', SLOTSTREAM_WEIGHTS_SOURCES='raw.invalid',
                  SLOTSTREAM_COMPRESSED_SOURCES='old.invalid', SLOTSTREAM_PULL_TRANSPORT='raw',
                  SLOTSTREAM_HTTP_TIMEOUT='1')
argv = [script, '--package', str(package), '--destination', str(dest), '--receipt', str(receipt)]
if scenario != 'harness': argv += ['--binary', str(binary)]
if scenario == 'default': argv += ['--default-source']
if scenario not in ('start', 'server_error', 'primary_server', 'cleanup_signal', 'cleanup_wait'):
    argv += ['--base-url', 'https://fixture.invalid/objects']
sys.argv = argv
caught = None
try:
    runpy.run_path(script, run_name='__main__')
except BaseException as error:
    caught = error
receipt_text = receipt.read_text() if receipt.exists() else None
try: result = json.loads(receipt_text) if receipt_text is not None else None
except ValueError: result = None
actual = {name: hashlib.sha256((dest/name).read_bytes()).hexdigest()
          for name in data if (dest/name).exists()}
report = dict(optimize=sys.flags.optimize, scenario=scenario, existing=existing,
              root=str(root), trace=trace, hashes=hashes, actual_hashes=actual,
              expected_pins=pins, source_hashes=source_hashes,
              expected_binary_sha=hashlib.sha256(binary.read_bytes()).hexdigest(),
              expected_manifest_sha=hashlib.sha256((package/'manifest.json').read_bytes()).hexdigest(),
              receipt=result, receipt_text=receipt_text, prior_unchanged=receipt_text == prior,
              exception=type(caught).__name__ if caught is not None else None,
              message=str(caught) if caught is not None else None,
              primary_identity=caught is primary, cleanup_identity=getattr(caught, '__cause__', None) is cleanup,
              server_cause_identity=getattr(caught, '__cause__', None) is server_error,
              monitor_error=monitor_error, child_returncode=child.returncode if child else None,
              output=captured.getvalue(), line=line)
original_print(json.dumps(report, sort_keys=True))
'''


class FullPullTests(unittest.TestCase):
    def leaf(self, mode, scenario, existing):
        name, switches, optimize_env, expected = mode
        with tempfile.TemporaryDirectory(prefix='slotstream-full-pull-') as temp:
            root = Path(temp)
            (root/'home').mkdir(); (root/'tmp').mkdir()
            env = {'PATH': os.defpath, 'HOME': str(root/'home'), 'TMPDIR': str(root/'tmp'),
                   'PYTHONDONTWRITEBYTECODE': '1'}
            if optimize_env is not None: env['PYTHONOPTIMIZE'] = optimize_env
            command = [sys.executable, *switches, '-B', '-s', '-c', CHILD,
                       str(SCRIPT.resolve()), scenario, str(int(existing))]
            result = subprocess.run(command, cwd=root, env=env, stdin=subprocess.DEVNULL,
                                    text=True, capture_output=True, timeout=5)
            self.assertEqual(result.returncode, 0, result.stdout+result.stderr)
            report = json.loads(result.stdout)
            self.assertEqual(report['optimize'], expected, report)
            return report

    def cases(self, scenarios, modes=MODES):
        for mode in modes:
            for scenario in scenarios:
                for existing in (False, True):
                    yield mode, scenario, existing

    def refused(self, report):
        self.assertIsNotNone(report['exception'], report)
        self.assertTrue(report['prior_unchanged'] if report['existing']
                        else report['receipt_text'] is None, report)

    def test_valid_cli_all_modes(self):
        for mode, scenario, existing in self.cases(['valid']):
            with self.subTest(mode=mode[0], existing=existing):
                r = self.leaf(mode, scenario, existing); receipt = r['receipt']
                self.assertIsNone(r['exception'], r)
                self.assertTrue(receipt['pass_'], r)
                self.assertEqual(receipt['fresh'], not existing, r)
                self.assertEqual(receipt['files'], r['expected_pins'], r)
                self.assertEqual(receipt['sourceSHA256'], r['source_hashes'], r)
                self.assertEqual(receipt['binarySHA256'], r['expected_binary_sha'], r)
                self.assertEqual(receipt['manifestSHA256'], r['expected_manifest_sha'], r)
                self.assertEqual((receipt['cli'], receipt['defaultSource'], receipt['kind']),
                                 (True, False, 'public-cdn'), r)
                self.assertEqual((receipt['originalBytes'], receipt['downloadObjectBytes']), (15, 8), r)
                launch = next(row for row in r['trace'] if row[0] == 'popen')
                self.assertEqual(launch[1], [r['root']+'/inert client', 'pull', '--dir', r['root']+'/destination'], r)
                self.assertEqual(launch[2]['SLOTSTREAM_COMPRESSED_SOURCES'], 'https://fixture.invalid/objects', r)
                self.assertEqual(launch[2]['SLOTSTREAM_HTTP_TIMEOUT'], '60', r)
                for key in ('SLOTSTREAM_PULL_CONNECTIONS', 'SLOTSTREAM_WEIGHTS_SOURCES', 'SLOTSTREAM_PULL_TRANSPORT'):
                    self.assertNotIn(key, launch[2], r)
                self.assertFalse(any(row[0] in ('signal', 'kill') for row in r['trace']), r)
                for pin in r['expected_pins']:
                    self.assertIn(['destination/'+pin['path'], pin['sha256']], r['hashes'], r)

    def test_default_source_env_all_modes(self):
        for mode, scenario, existing in self.cases(['default']):
            with self.subTest(mode=mode[0], existing=existing):
                r = self.leaf(mode, scenario, existing)
                self.assertIsNone(r['exception'], r)
                self.assertTrue(r['receipt']['defaultSource'], r)
                launch = next(row for row in r['trace'] if row[0] == 'popen')
                self.assertNotIn('SLOTSTREAM_COMPRESSED_SOURCES', launch[2], r)

    def test_harness_env_all_modes(self):
        for mode, scenario, existing in self.cases(['harness']):
            with self.subTest(mode=mode[0], existing=existing):
                r = self.leaf(mode, scenario, existing)
                self.assertIsNone(r['exception'], r)
                self.assertFalse(r['receipt']['cli'], r)
                self.assertIn(['compile_harness_stub'], r['trace'], r)
                launch = next(row for row in r['trace'] if row[0] == 'popen')
                self.assertEqual(launch[2]['SLOTSTREAM_PULL_CONNECTIONS'], '8', r)
                self.assertNotIn('SLOTSTREAM_COMPRESSED_SOURCES', launch[2], r)
                self.assertEqual(launch[1], [r['root']+'/inert client', r['root']+'/package/manifest.json',
                                           r['root']+'/destination', 'https://fixture.invalid/objects', '-'], r)

    def test_nonzero_exit_retains_failure_receipt(self):
        for mode, scenario, existing in self.cases(['nonzero']):
            with self.subTest(mode=mode[0], existing=existing):
                r = self.leaf(mode, scenario, existing)
                self.assertEqual(r['exception'], 'RuntimeError', r)
                self.assertEqual((r['receipt']['pass_'], r['receipt']['exitCode']), (False, 7), r)
                self.assertEqual(r['receipt']['fresh'], not existing, r)
                self.assertFalse(any(row[0] in ('signal', 'kill') for row in r['trace']), r)

    def test_start_failure_still_shuts_down_server(self):
        for mode, scenario, existing in self.cases(['start']):
            with self.subTest(mode=mode[0], existing=existing):
                r = self.leaf(mode, scenario, existing); self.refused(r)
                self.assertTrue(r['primary_identity'], r)
                self.assertIn(['shutdown'], r['trace'], r)
                self.assertFalse(any(row[0] in ('signal', 'wait', 'kill', 'poll') for row in r['trace']), r)

    def test_normal_existing_guards_refuse_invalid_qualification(self):
        for mode, scenario, existing in self.cases(['pins', 'missing', 'raw_1', 'hash'], MODES[:1]):
            with self.subTest(scenario=scenario, existing=existing):
                self.refused(self.leaf(mode, scenario, existing))

    def test_server_shutdown_error_refuses_success_without_primary(self):
        for mode, scenario, existing in self.cases(['server_error'], MODES[:1]):
            with self.subTest(existing=existing):
                r = self.leaf(mode, scenario, existing); self.refused(r)
                self.assertEqual((r['exception'], r['message']), ('OSError', 'server shutdown failed'), r)

    def guard(self, scenarios):
        for mode, scenario, existing in self.cases(scenarios):
            with self.subTest(mode=mode[0], scenario=scenario, existing=existing):
                r = self.leaf(mode, scenario, existing)
                self.refused(r)

    def test_manifest_pins_are_checked_in_all_modes(self):
        self.guard(['pins'])

    def test_missing_zero_marker_is_checked_in_all_modes(self):
        self.guard(['missing'])

    def test_one_raw_fallback_is_refused_in_all_modes(self):
        self.guard(['raw_1'])

    def test_ten_twenty_hundred_raw_fallbacks_are_refused(self):
        self.guard(['raw_10', 'raw_20', 'raw_100'])

    def test_independent_file_hash_is_checked_in_all_modes(self):
        self.guard(['hash'])

    def owned_cleanup(self, scenarios, expected_tail):
        for mode, scenario, existing in self.cases(scenarios):
            with self.subTest(mode=mode[0], scenario=scenario, existing=existing):
                r = self.leaf(mode, scenario, existing); self.refused(r)
                events = [row for row in r['trace'] if row[0] in ('signal', 'wait', 'kill')]
                self.assertEqual(events[-len(expected_tail):], expected_tail, r)
                self.assertIsNotNone(r['child_returncode'], r)
                self.assertTrue(r['primary_identity'], r)

    def test_output_failure_cancels_and_reaps_owned_child(self):
        self.owned_cleanup(['output'], [['signal', 2], ['wait', 5]])

    def test_driver_interrupt_cancels_and_reaps_owned_child(self):
        self.owned_cleanup(['interrupt', 'wait_interrupt'], [['signal', 2], ['wait', 5]])

    def test_timeout_escalates_only_owned_child_and_reaps(self):
        self.owned_cleanup(['timeout'], [['signal', 2], ['wait', 5], ['kill'], ['wait', 5]])

    def test_signal_lookup_race_still_waits_for_owned_child(self):
        self.owned_cleanup(['lookup'], [['signal', 2], ['wait', 5]])

    def test_cleanup_failure_preserves_primary_and_server_shutdown(self):
        for mode, scenario, existing in self.cases(['cleanup_signal', 'cleanup_wait']):
            with self.subTest(mode=mode[0], scenario=scenario, existing=existing):
                r = self.leaf(mode, scenario, existing); self.refused(r)
                self.assertTrue(r['cleanup_identity'], r)
                self.assertTrue(r['primary_identity'], r)
                self.assertIn(['shutdown'], r['trace'], r)

    def test_shutdown_failure_preserves_original_primary(self):
        for mode, scenario, existing in self.cases(['primary_server']):
            with self.subTest(mode=mode[0], existing=existing):
                r = self.leaf(mode, scenario, existing); self.refused(r)
                self.assertTrue(r['primary_identity'], r)
                self.assertTrue(r['server_cause_identity'], r)

    def test_rss_signal_precedes_fallible_diagnostic_print(self):
        for mode, scenario, existing in self.cases(['monitor']):
            with self.subTest(mode=mode[0], existing=existing):
                r = self.leaf(mode, scenario, existing)
                self.assertEqual(r['monitor_error'], 'BrokenPipeError', r)
                events = [row[0] for row in r['trace']]
                self.assertIn('signal', events, r)
                self.assertLess(events.index('signal'), events.index('print_guard'), r)
                self.assertEqual(r['receipt']['pass_'], False, r)
                self.assertEqual(r['receipt']['guardFailure'], ['RSS guard exceeded'], r)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script', type=Path, default=SCRIPT)
    options, remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])
