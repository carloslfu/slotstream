#!/usr/bin/env python3
"""Readiness deadlines and unchanged adaptive assertions, without a model."""
import argparse
import contextlib
import io
import json
import sys
from pathlib import Path
import tempfile
import unittest
from unittest.mock import Mock, mock_open, patch

import adaptive_memory_e2e as fixture


class Clock:
    def __init__(self):
        self.now = 0.0

    def monotonic(self):
        return self.now

    def sleep(self, seconds):
        self.now += seconds


class StartupChecks(unittest.TestCase):
    def run_wait(self, timeout, ready_after, *, stalled=False):
        clock = Clock()
        process = Mock()
        process.poll.return_value = None
        plan = {'memory_limit_gb': 10}

        def request(*args, **kwargs):
            self.assertLessEqual(kwargs['timeout'], 1)
            self.assertLessEqual(kwargs['deadline'], timeout)
            if stalled:
                clock.sleep(kwargs['timeout'])
                raise TimeoutError('accepted connection did not answer')
            if clock.now < ready_after:
                raise ConnectionRefusedError()
            return {'models': [{'details': {'memory_plan': plan}}]}

        with patch.object(fixture.time, 'monotonic', clock.monotonic), \
             patch.object(fixture.time, 'sleep', clock.sleep), \
             patch.object(fixture, 'exchange', side_effect=request):
            try:
                fixture.wait_for_startup(process, 12345, timeout)
            except TimeoutError:
                self.assertAlmostEqual(clock.now, timeout)
                raise

    def test_shorter_override_still_times_out(self):
        with self.assertRaisesRegex(TimeoutError, '45 seconds'):
            self.run_wait(45, 55)

    def test_accepted_but_unresponsive_connections_stay_bounded(self):
        with self.assertRaisesRegex(TimeoutError, '2.5 seconds'):
            self.run_wait(2.5, 100, stalled=True)

    def test_child_exit_fails_immediately(self):
        process = Mock()
        process.poll.return_value = 7
        with patch.object(fixture, 'exchange') as request:
            with self.assertRaisesRegex(RuntimeError, 'exit 7'):
                fixture.wait_for_startup(process, 12345, 180)
            request.assert_not_called()

    def test_invalid_timeouts(self):
        for value in ('0', '-1', 'nan', 'inf', '-inf', 'invalid'):
            with self.subTest(value=value), self.assertRaises(argparse.ArgumentTypeError):
                fixture.positive_seconds(value)
        self.assertEqual(fixture.positive_seconds('2.5'), 2.5)

    def test_slow_http_chunks_do_not_reset_probe_deadline(self):
        clock = Clock()
        connection = Mock()
        connection.__enter__ = Mock(return_value=connection)
        connection.__exit__ = Mock(return_value=False)

        def receive(_size):
            if clock.now >= .2:
                raise AssertionError('HTTP deadline did not expire')
            clock.sleep(.04)
            return b'partial response'

        connection.recv.side_effect = receive
        with patch.object(fixture.time, 'monotonic', clock.monotonic), \
             patch.object(fixture.socket, 'create_connection', return_value=connection):
            with self.assertRaisesRegex(TimeoutError, 'HTTP request timed out'):
                fixture.exchange(12345, 'GET', '/api/ps', timeout=1, deadline=.1)
        self.assertEqual(connection.recv.call_count, 3)
        self.assertLess(clock.now, .15)

    def test_normal_http_calls_keep_30_second_socket_timeout(self):
        connection = Mock()
        connection.__enter__ = Mock(return_value=connection)
        connection.__exit__ = Mock(return_value=False)
        connection.recv.side_effect = [b'HTTP/1.1 200 OK\r\n\r\n{"ok": true}', b'']
        with patch.object(fixture.socket, 'create_connection', return_value=connection) as connect:
            self.assertEqual(fixture.exchange(12345, 'GET', '/status'), {'ok': True})
        self.assertEqual(connect.call_args.kwargs['timeout'], 30)
        self.assertTrue(all(call.args == (30,) for call in connection.settimeout.call_args_list))

    def run_fixture(self, *, timeout=None, plan_change=None, completion_stalled=False):
        clock = Clock()
        process = Mock()
        process.poll.return_value = None
        plan = {'memory_limit_gb': 10, 'target_gb': 10, 'pool_slots': 833,
                'memory_ledger': {'expected_peak_bytes': 9_000_000_000},
                'max_prefill_wait_minutes': 17}
        plan.update(plan_change or {})
        vm = 'Mach Virtual Memory Statistics: (page size of 4096 bytes)\nPages free: 4000000.\nPages purgeable: 0.\nFile-backed pages: 0.\n'

        def request(_port, _method, path, body=None, **kwargs):
            if path == '/api/ps':
                if clock.now < 55:
                    raise ConnectionRefusedError()
                return {'models': [{'details': {'memory_plan': plan}}]}
            if path == '/slotstream/status':
                return {'memory_limit_gb': 10, 'memory_target_gb': 10}
            self.assertEqual(path, '/v1/chat/completions')
            self.assertEqual(body['max_tokens'], 12)
            self.assertEqual(kwargs, {'timeout': 120, 'deadline': clock.now + 120})
            if completion_stalled:
                clock.sleep(kwargs['timeout'])
                raise TimeoutError('completion timed out')
            return {'choices': [{'message': {'content': 'The Nile.'}}]}

        def launch(*args, **kwargs):
            kwargs['stdout'].write('elastic: on\n')
            kwargs['stdout'].flush()
            return process

        probe = Mock()
        probe.__enter__ = Mock(return_value=probe)
        probe.__exit__ = Mock(return_value=False)
        probe.getsockname.return_value = ('127.0.0.1', 12345)
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            binary = root/'binary'
            binary.write_bytes(b'fixture')
            argv = ['adaptive_memory_e2e.py', '--binary', str(binary), '--out', str(root/'result')]
            if timeout is not None:
                argv += ['--startup-timeout-seconds', str(timeout)]
            with patch.object(sys, 'argv', argv), \
                 patch('adaptive_memory_e2e.open', mock_open()), \
                 patch.object(fixture.socket, 'socket', return_value=probe), \
                 patch.object(fixture.time, 'monotonic', clock.monotonic), \
                 patch.object(fixture.time, 'sleep', clock.sleep), \
                 patch.object(fixture.fcntl, 'flock'), \
                 patch.object(fixture.subprocess, 'check_output', return_value=vm), \
                 patch.object(fixture.subprocess, 'Popen', side_effect=launch) as popen, \
                 patch.object(fixture, 'exchange', side_effect=request), \
                 contextlib.redirect_stdout(io.StringIO()):
                code = fixture.main()
            report = json.loads((root/'result/report.json').read_text())
        process.terminate.assert_called_once()
        process.wait.assert_called_once_with(timeout=15)
        self.assertTrue(report['server_reaped'])
        command = popen.call_args.args[0]
        self.assertEqual(command[command.index('--memory-limit-gb')+1], '10')
        self.assertEqual(command[command.index('--max-prefill-wait')+1], '17')
        return code, report

    def test_default_fixture_checks_settings_after_slow_startup(self):
        code, report = self.run_fixture()
        self.assertEqual(code, 0)
        self.assertEqual(report['startup_timeout_seconds'], 180)
        self.assertEqual(report['completion_timeout_seconds'], 120)
        self.assertGreaterEqual(report['startup_seconds'], 55)
        self.assertLess(report['startup_seconds'], 56)
        self.assertGreater(len(report['observations']), 2)
        self.assertIn('completion_seconds', report)

    def test_timeout_cleans_up_child_without_skipping_to_functional_checks(self):
        code, report = self.run_fixture(timeout=45)
        self.assertEqual(code, 1)
        self.assertIn('startup timed out', report['error'])
        self.assertEqual(report['observations'], [])

    def test_completion_timeout_still_fails_and_cleans_up(self):
        code, report = self.run_fixture(completion_stalled=True)
        self.assertEqual(code, 1)
        self.assertEqual(report['error'], 'completion timed out')
        self.assertEqual(report['completion_seconds'], 120)
        self.assertFalse(report['passed'])

    def test_lost_memory_or_prefill_settings_still_fail(self):
        for change in ({'memory_limit_gb': 11}, {'target_gb': 11},
                       {'memory_ledger': {'expected_peak_bytes': 11_000_000_000}},
                       {'max_prefill_wait_minutes': 30}):
            with self.subTest(change=change):
                code, report = self.run_fixture(plan_change=change)
                self.assertEqual(code, 1)
                self.assertFalse(report['passed'])


class PreflightChecks(unittest.TestCase):
    def _run_preflight(self, optimize, free_pages):
        import hashlib
        import os
        import types

        source_path = Path(fixture.__file__)
        source = source_path.read_bytes()
        module = types.ModuleType('adaptive_preflight_fixture')
        module.__file__ = str(source_path)
        exec(compile(source, str(source_path), 'exec', optimize=optimize), module.__dict__)
        vm = ('Mach Virtual Memory Statistics: (page size of 16384 bytes)\n'
              f'Pages free: {free_pages}.\nPages purgeable: 0.\nFile-backed pages: 0.\n')
        calls = {'vm': [], 'flock': [], 'popen': [], 'lock_open': []}
        lock = mock_open()
        lock.return_value.fileno.return_value = 91
        probe = Mock()
        probe.__enter__ = Mock(return_value=probe)
        probe.__exit__ = Mock(return_value=False)
        probe.getsockname.return_value = ('127.0.0.1', 12345)

        def open_lock(path, mode):
            calls['lock_open'].append([path, mode])
            if (path, mode) != (f'/tmp/slotstream-model-{os.getuid()}.lock', 'a+'):
                raise RuntimeError('unexpected lock path or mode')
            return lock(path, mode)

        def vm_stat(*args, **kwargs):
            calls['vm'].append({'args': list(args), 'kwargs': kwargs})
            if args != (['vm_stat'],) or kwargs != {'text': True} or len(calls['vm']) != 1:
                raise RuntimeError('unexpected VM query')
            return vm

        def flock(*args):
            calls['flock'].append(list(args))
            expected = [[91, module.fcntl.LOCK_EX | module.fcntl.LOCK_NB],
                        [91, module.fcntl.LOCK_UN]]
            if calls['flock'] != expected[:len(calls['flock'])]:
                raise RuntimeError('unexpected lock operation')

        def launch(command, **kwargs):
            # Retain the intended launch boundary without retaining environment values.
            calls['popen'].append({'command': command, 'kwargs_keys': sorted(kwargs),
                                   'stdout_path': kwargs['stdout'].name,
                                   'stderr': kwargs['stderr']})
            raise RuntimeError('bounded launch sentinel')

        with tempfile.TemporaryDirectory(prefix='adaptive-preflight-') as temporary:
            root = Path(temporary)
            binary = root/'binary'
            binary.write_bytes(b'finite preflight binary\n')
            binary.chmod(0o600)
            output = root/'result'
            stdout = io.StringIO()
            argv = ['adaptive_memory_e2e.py', '--binary', str(binary), '--out', str(output)]
            with patch.object(sys, 'argv', argv), \
                 patch.object(module, 'open', side_effect=open_lock, create=True), \
                 patch.object(module.fcntl, 'flock', side_effect=flock), \
                 patch.object(module.subprocess, 'check_output', side_effect=vm_stat), \
                 patch.object(module.subprocess, 'Popen', side_effect=launch), \
                 patch.object(module.socket, 'socket', return_value=probe) as socket_factory, \
                 contextlib.redirect_stdout(stdout):
                code = module.main()
            report_bytes = (output/'report.json').read_bytes()
            # Return raw, serializable evidence before the test oracle runs.
            return {'optimize': optimize, 'free_pages': free_pages, 'page_size': 16384,
                    'source_path': str(source_path),
                    'source_sha256': hashlib.sha256(source).hexdigest(),
                    'main_code_hex': module.main.__code__.co_code.hex(),
                    'module_doc': module.__doc__, 'argv': argv, 'main_return': code,
                    'report': json.loads(report_bytes), 'report_text': report_bytes.decode(),
                    'report_sha256': hashlib.sha256(report_bytes).hexdigest(),
                    'stdout': stdout.getvalue(), 'vm_text': vm, 'calls': calls,
                    'socket_creations': socket_factory.call_count,
                    'socket_factory_calls': [[list(call.args), call.kwargs]
                                             for call in socket_factory.call_args_list],
                    'socket_bind_calls': [[[list(address) for address in call.args], call.kwargs]
                                          for call in probe.bind.call_args_list],
                    'socket_getsockname_calls': probe.getsockname.call_count,
                    'socket_context_enters': probe.__enter__.call_count,
                    'socket_context_exits': probe.__exit__.call_count,
                    'binary_sha256': hashlib.sha256(binary.read_bytes()).hexdigest(),
                    'binary_mode': binary.stat().st_mode & 0o777,
                    'materialized_files': {str(path.relative_to(root)): path.read_bytes().hex()
                                           for path in sorted(root.rglob('*')) if path.is_file()}}

    def _check_common(self, result):
        import hashlib
        import os

        report = result['report']
        self.assertEqual(result['main_return'], 1)
        self.assertFalse(report['passed'])
        self.assertEqual(report['observations'], [])
        self.assertNotIn('server_reaped', report)
        self.assertEqual(report['binary_sha256'], result['binary_sha256'])
        self.assertEqual(result['binary_mode'], 0o600)
        self.assertEqual(report['limit_gb'], 10)
        self.assertFalse(report['no_elastic'])
        self.assertEqual(report['startup_timeout_seconds'], 180)
        self.assertEqual(report['completion_timeout_seconds'], 120)
        self.assertEqual(report['preflight_available_gb'], result['free_pages'] * 16384 / 1e9)
        self.assertEqual(result['calls']['vm'], [{'args': [['vm_stat']], 'kwargs': {'text': True}}])
        self.assertEqual(result['calls']['lock_open'], [[f'/tmp/slotstream-model-{os.getuid()}.lock', 'a+']])
        self.assertEqual(result['calls']['flock'],
                         [[91, fixture.fcntl.LOCK_EX | fixture.fcntl.LOCK_NB], [91, fixture.fcntl.LOCK_UN]])
        self.assertEqual(json.loads(result['stdout']), {key: value for key, value in report.items()
                                                       if key != 'observations'})
        self.assertEqual(result['report_sha256'], hashlib.sha256(result['report_text'].encode()).hexdigest())
        self.assertEqual(bytes.fromhex(result['materialized_files']['result/report.json']),
                         result['report_text'].encode())

    def test_low_headroom_refuses_before_launch_under_all_optimizations(self):
        for optimize in (0, 1, 2):
            with self.subTest(optimize=optimize):
                result = self._run_preflight(optimize, 793457)
                self._check_common(result)
                self.assertEqual(result['report']['error'], 'at least 13 GB reclaimable required')
                self.assertNotIn('command', result['report'])
                self.assertEqual(result['calls']['popen'], [])
                self.assertEqual(result['socket_creations'], 0)
                self.assertEqual(result['socket_bind_calls'], [])
                self.assertEqual(result['socket_getsockname_calls'], 0)
                self.assertEqual(result['socket_context_enters'], 0)
                self.assertEqual(result['socket_context_exits'], 0)
                self.assertEqual(sorted(result['materialized_files']), ['binary', 'result/report.json'])

    def test_high_headroom_reaches_bounded_launch_under_all_optimizations(self):
        for optimize in (0, 1, 2):
            with self.subTest(optimize=optimize):
                result = self._run_preflight(optimize, 793458)
                self._check_common(result)
                self.assertEqual(result['report']['error'], 'bounded launch sentinel')
                command = [str(Path(result['argv'][2]).resolve()), 'serve', '--memory-limit-gb', '10',
                           '--max-context', '32768', '--max-prefill-wait', '17',
                           '--mtp', 'off', '--vision', 'off', '--port', '12345']
                self.assertEqual(result['report']['command'], ['binary', *command[1:]])
                self.assertEqual(result['calls']['popen'],
                                 [{'command': command, 'kwargs_keys': ['env', 'stderr', 'stdout'],
                                   'stdout_path': str(Path(result['argv'][4])/'server.log'),
                                   'stderr': fixture.subprocess.STDOUT}])
                self.assertEqual(result['socket_creations'], 1)
                self.assertEqual(result['socket_factory_calls'], [[[], {}]])
                self.assertEqual(result['socket_bind_calls'], [[[['127.0.0.1', 0]], {}]])
                self.assertEqual(result['socket_getsockname_calls'], 1)
                self.assertEqual(result['socket_context_enters'], 1)
                self.assertEqual(result['socket_context_exits'], 1)
                self.assertEqual(sorted(result['materialized_files']),
                                 ['binary', 'result/report.json', 'result/server.log'])


if __name__ == '__main__':
    unittest.main()
