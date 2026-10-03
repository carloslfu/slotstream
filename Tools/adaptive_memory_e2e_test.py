"""Adaptive serving acceptance must survive pinned-model hashing and keep its profile."""
import contextlib
import importlib.util
import io
import json
import sys
from pathlib import Path
import tempfile
import unittest
from unittest.mock import MagicMock, patch

spec = importlib.util.spec_from_file_location('adaptive_memory_e2e', Path(__file__).with_name('adaptive_memory_e2e.py'))
gate = importlib.util.module_from_spec(spec)
spec.loader.exec_module(gate)


class AdaptiveStartup(unittest.TestCase):
    def exercise(self, startup, *, explicit=None):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            binary = root / 'slotstream'
            binary.write_bytes(b'fixture')
            out = root / 'evidence'
            clock = [0.0]
            process = MagicMock()
            process.poll.return_value = None
            plan = {'memory_limit_gb': 10, 'target_gb': 9.5, 'pool_slots': 1000,
                    'memory_ledger': {'expected_peak_bytes': 9_500_000_000},
                    'max_prefill_wait_minutes': 17}

            def launch(command, **kwargs):
                kwargs['stdout'].write('elastic: off (--no-elastic)\n')
                kwargs['stdout'].flush()
                return process

            def exchange(port, method, route, body=None):
                if clock[0] < startup:
                    raise ConnectionRefusedError('still hashing pinned payloads')
                if route == '/api/ps':
                    return {'models': [{'details': {'memory_plan': plan}}]}
                if route == '/slotstream/status':
                    return {'memory_limit_gb': 10, 'memory_target_gb': 9.5}
                return {'choices': [{'message': {'content': 'Nile'}}]}

            args = ['gate', '--binary', str(binary), '--out', str(out), '--no-elastic']
            if explicit is not None:
                args += ['--gpu-keepalive', explicit]
            vm = ('Mach Virtual Memory Statistics: (page size of 16384 bytes)\n'
                  'Pages free: 1000000.\nPages purgeable: 0.\nFile-backed pages: 0.\n')
            with patch.object(sys, 'argv', args), \
                 patch.dict(gate.os.environ, {'SLOTSTREAM_GPU_KEEPALIVE': 'off', 'SLOTSTREAM_DEBUG_UNRELATED': '1'}), \
                 patch.object(gate.fcntl, 'flock'), \
                 patch.object(gate.socket, 'socket') as socket_fixture, \
                 patch.object(gate.subprocess, 'check_output', return_value=vm), \
                 patch.object(gate.subprocess, 'Popen', side_effect=launch) as popen, \
                 patch.object(gate.time, 'monotonic', side_effect=lambda: clock[0]), \
                 patch.object(gate.time, 'sleep', side_effect=lambda seconds: clock.__setitem__(0, clock[0] + seconds)), \
                 patch.object(gate, 'exchange', side_effect=exchange), \
                 contextlib.redirect_stdout(io.StringIO()):
                socket_fixture.return_value.__enter__.return_value.getsockname.return_value = ('127.0.0.1', 12345)
                result = gate.main()
            report = json.loads((out / 'report.json').read_text())
            command = popen.call_args.args[0]
            self.assertTrue(report['server_reaped'])
            process.terminate.assert_called_once()
            process.wait.assert_called_once_with(timeout=15)
            self.assertFalse(any(k.startswith('SLOTSTREAM_') for k in popen.call_args.kwargs['env']))
            return result, report, command

    def test_hashing_longer_than_45_seconds_keeps_selected_profile(self):
        result, report, command = self.exercise(53)
        self.assertEqual(result, 0, report)
        self.assertGreaterEqual(report['startup_seconds'], 53)
        self.assertEqual(command[command.index('--gpu-keepalive') + 1], 'off')

    def test_explicit_profile_overrides_environment(self):
        result, report, command = self.exercise(0, explicit='on')
        self.assertEqual(result, 0, report)
        self.assertEqual(command[command.index('--gpu-keepalive') + 1], 'on')

    def test_startup_still_has_a_deadline_and_reaps_its_server(self):
        result, report, _ = self.exercise(700)
        self.assertEqual(result, 1)
        self.assertEqual(report['error'], 'startup timed out')


if __name__ == '__main__':
    unittest.main()
