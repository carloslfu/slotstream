#!/usr/bin/env python3
"""Real-process checks for timeout cleanup, without weights or GPU work."""
import os
from pathlib import Path
import signal
import subprocess
import sys
import tempfile
import time
import unittest
from unittest.mock import patch

from prefill_bench import run_child


class ProcessCleanupChecks(unittest.TestCase):
    @staticmethod
    def live(pid):
        state = subprocess.run(['ps', '-p', str(pid), '-o', 'state='],
            capture_output=True, text=True, timeout=5).stdout.strip()
        return bool(state and not state.startswith('Z'))

    def drained(self, pids):
        until = time.monotonic() + 2
        while any(self.live(pid) for pid in pids) and time.monotonic() < until:
            time.sleep(.02)
        self.assertFalse([pid for pid in pids if self.live(pid)])

    @staticmethod
    def cleanup(pids):
        # IDs were emitted by our own new-session fixtures; no global sweep.
        for pid in pids:
            try: os.killpg(pid, signal.SIGKILL)
            except ProcessLookupError: pass

    def test_timeout_drains_separate_session_but_preserves_unrelated_sibling(self):
        sibling = subprocess.Popen([sys.executable, '-c', 'import time;time.sleep(60)'],
            start_new_session=True)
        ids = []
        try:
            with tempfile.TemporaryDirectory() as folder:
                out = Path(folder)
                script = '''import os,signal,time
if os.fork()==0:
 os.setsid();signal.signal(signal.SIGTERM,signal.SIG_IGN)
 print(os.getpid(),flush=True)
 time.sleep(60)
else:
 print(os.getpid(),flush=True)
 time.sleep(60)
'''
                try:
                    with self.assertRaises(subprocess.TimeoutExpired):
                        run_child([sys.executable, '-c', script], os.environ.copy(), out, 1)
                finally:
                    ids = [int(line) for line in (out/'stdout.txt').read_text().splitlines()]
                self.assertEqual(len(ids), 2)
                self.drained(ids)
                self.assertIsNone(sibling.poll())
        finally:
            self.cleanup(ids + [sibling.pid]); sibling.wait(timeout=5)

    def test_failed_or_timed_out_enumeration_still_drains_root_and_reports_limit(self):
        for error in [OSError('enumeration unavailable'), subprocess.TimeoutExpired('ps', 5)]:
            with self.subTest(error=type(error).__name__), tempfile.TemporaryDirectory() as folder:
                out = Path(folder); ids = []
                try:
                    with patch('prefill_bench.subprocess.check_output', side_effect=error):
                        with self.assertRaisesRegex(RuntimeError, 'full cleanup is unverified'):
                            run_child([sys.executable, '-c',
                                'import os,time;print(os.getpid(),flush=True);time.sleep(60)'],
                                os.environ.copy(), out, 1)
                    ids = [int(line) for line in (out/'stdout.txt').read_text().splitlines()]
                    self.assertEqual(len(ids), 1); self.drained(ids)
                finally:
                    if (out/'stdout.txt').exists():
                        ids = [int(line) for line in (out/'stdout.txt').read_text().splitlines()]
                    self.cleanup(ids)

    def test_normal_completion_does_not_run_cleanup_or_change_result(self):
        with tempfile.TemporaryDirectory() as folder, patch('prefill_bench.terminate_child_tree') as cleanup:
            code = run_child([sys.executable, '-c', 'print("done")'], os.environ.copy(), Path(folder), 5)
            self.assertEqual(code, 0); cleanup.assert_not_called()
            self.assertEqual((Path(folder)/'stdout.txt').read_text(), 'done\n')


if __name__ == '__main__': unittest.main()
