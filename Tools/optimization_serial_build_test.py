"""Pure limits plus cleanup of a tiny fixture process; no compiler or model."""
import json
import io
from contextlib import redirect_stderr
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

from optimization_serial_build import POLICY, check_sample, check_whole_interval, guarded_run, owned_processes


class SerialBuildGuards(unittest.TestCase):
    def test_only_transitive_children_are_charged(self):
        rows = '50 1 10\n51 50 20\n52 51 30\n99 1 1000000\n'
        self.assertEqual(owned_processes(rows, 50), [(50, 10240), (51, 20480), (52, 30720)])

    def test_invalid_process_snapshot_is_refused(self):
        for rows in ['1 0 -1', '1 0 1\n1 0 2', '1 0']:
            with self.subTest(rows=rows), self.assertRaises(ValueError):
                owned_processes(rows, 1)

    def test_exact_limits_and_all_refusals(self):
        good = {'reclaimable_bytes': 6_000_000_000, 'swapouts': 42}
        check_sample(good, 3_000_000_000, 42)
        cases = [({**good, 'reclaimable_bytes': 5_999_999_999}, 0),
                 (good, 3_000_000_001),
                 ({**good, 'swapouts': 41}, 0)]
        for snapshot, rss in cases:
            with self.subTest(snapshot=snapshot, rss=rss), self.assertRaises(RuntimeError):
                check_sample(snapshot, rss, 42)

    def test_bad_observations_are_refused(self):
        for value in [None, True, float('nan'), -1]:
            with self.subTest(value=value), self.assertRaises(ValueError):
                check_sample({'reclaimable_bytes': value, 'swapouts': 0}, 0, 0)

    def test_correctness_policy_records_vm_without_weakening_memory_limits(self):
        policy = {**POLICY, 'stop_on_new_swapouts': False}
        good = {'reclaimable_bytes': 6_000_000_000, 'swapouts': 43}
        check_sample(good, 3_000_000_000, 42, policy)
        for snapshot, rss in [({**good, 'reclaimable_bytes': 5_999_999_999}, 0),
                              (good, 3_000_000_001), ({**good, 'swapouts': 41}, 0)]:
            with self.subTest(snapshot=snapshot, rss=rss), self.assertRaises(RuntimeError):
                check_sample(snapshot, rss, 42, policy)
        for setting in [0, 1, None, 'false']:
            with self.subTest(setting=setting), self.assertRaises(ValueError):
                check_sample(good, 0, 42, {**POLICY, 'stop_on_new_swapouts': setting})
        self.assertIs(POLICY['stop_on_new_swapouts'], False)
        with self.assertRaisesRegex(RuntimeError, 'counter changed'):
            check_sample(good, 0, 42, {**POLICY, 'stop_on_new_swapouts': True})

    def test_correctness_receipt_preserves_observed_swap_activity(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            values = iter([{'reclaimable_bytes': 10_000_000_000, 'swapouts': 42}])
            after = {'reclaimable_bytes': 10_000_000_000, 'swapouts': 43}
            result = guarded_run([sys.executable, '-c', 'import time; time.sleep(.05)'],
                cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                record_path=path / 'receipt.json',
                policy={**POLICY, 'stop_on_new_swapouts': False},
                classification='correctness only; VM-active resource/timing claims unavailable',
                snapshot=lambda: next(values, after))
            record = json.loads((path / 'receipt.json').read_text())
            self.assertEqual(result.returncode, 0)
            self.assertTrue(record['passed'])
            self.assertEqual(record['before']['swapouts'], 42)
            self.assertEqual(record['after']['swapouts'], 43)
            self.assertEqual(record['samples'][0]['swapouts'], 43)

    def test_startup_refuses_before_child_creation(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            with self.assertRaisesRegex(RuntimeError, 'child not launched'):
                guarded_run([sys.executable, '-c', 'raise AssertionError("must not execute")'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json',
                    snapshot=lambda: {'reclaimable_bytes': 9_499_999_999, 'swapouts': 0})
            self.assertFalse((path / 'receipt.json').exists())

    def test_child_is_drained_when_guard_fails(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            snapshots = iter([{'reclaimable_bytes': 10_000_000_000, 'swapouts': 0},
                              {'reclaimable_bytes': 5_999_999_999, 'swapouts': 0}])
            last = {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0}
            with self.assertRaisesRegex(RuntimeError, 'floor'):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json', snapshot=lambda: next(snapshots, last))
            record = json.loads((path / 'receipt.json').read_text())
            self.assertFalse(record['passed'])
            self.assertIsInstance(record['child_exit_code'], int)
            self.assertLess(record['elapsed_seconds'], 15)

    def test_success_retains_real_exit_and_samples(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            result = guarded_run([sys.executable, '-c', 'import time; time.sleep(.05)'],
                cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                record_path=path / 'receipt.json',
                classification='bounded fixture process; no compiler or model',
                snapshot=lambda: {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0})
            record = json.loads((path / 'receipt.json').read_text())
            self.assertEqual(result.returncode, 0)
            self.assertTrue(record['passed'])
            self.assertTrue(record['samples'])
            self.assertEqual(record['policy'], POLICY)
            self.assertEqual(record['classification'], 'bounded fixture process; no compiler or model')

    def test_cleanup_error_does_not_erase_primary_failure(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            values = iter([{'reclaimable_bytes': 10_000_000_000, 'swapouts': 0},
                           {'reclaimable_bytes': 5_999_999_999, 'swapouts': 0}])
            good = {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0}
            def failing_cleanup(child):
                child.terminate(); child.wait(timeout=5)
                raise PermissionError('fixture cleanup failure after draining child')
            with patch('optimization_serial_build.terminate_child_tree', failing_cleanup), \
                    self.assertRaises(RuntimeError):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json', snapshot=lambda: next(values, good))
            record = json.loads((path / 'receipt.json').read_text())
            self.assertIn('floor', record['error'])
            self.assertIn('fixture cleanup', record['cleanup_error'])
            self.assertFalse(record['passed'])

    def test_cleanup_snapshot_error_does_not_erase_primary_failure(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            values = iter([{'reclaimable_bytes': 10_000_000_000, 'swapouts': 0},
                           {'reclaimable_bytes': 5_999_999_999, 'swapouts': 0}])
            def snapshot():
                try: return next(values)
                except StopIteration: raise PermissionError('fixture after-cleanup snapshot')
            with self.assertRaises(RuntimeError):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json', snapshot=snapshot)
            record = json.loads((path / 'receipt.json').read_text())
            self.assertIn('floor', record['error'])
            self.assertIn('fixture after-cleanup snapshot', record['after_cleanup_error'])
            self.assertFalse(record['passed'])

    def test_parent_exit_cannot_leave_an_independent_group(self):
        code = ('import subprocess,sys,time; '
                'subprocess.Popen([sys.executable,"-c","import time; time.sleep(30)"],start_new_session=True); '
                'time.sleep(.35)')
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            with self.assertRaisesRegex(RuntimeError, 'descendants remained'):
                guarded_run([sys.executable, '-c', code], cwd=path,
                    stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json',
                    snapshot=lambda: {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0})
            record = json.loads((path / 'receipt.json').read_text())
            self.assertTrue(record['remaining_owned_members'])
            self.assertEqual(record['remaining_owned_members_after_cleanup'], [])
            self.assertFalse(record['passed'])

    def test_complete_publication_interval_is_checked(self):
        good = {'reclaimable_bytes': 6_000_000_000, 'swapouts': 42}
        with patch('optimization_serial_build.live_group_members', return_value=[]):
            check_whole_interval({'passed': True}, good, good, 1220,
                                 {'passed': True, 'owned_groups': []})
            check_whole_interval({'passed': True}, good, {**good, 'swapouts': 43}, 10,
                                 {'passed': True, 'owned_groups': []})
            for result, after, elapsed, live in [
                    ({'passed': False}, good, 10, {'passed': True}),
                    ({'passed': True}, good, 10, {'passed': False}),
                    ({'passed': True}, good, 1220.001, {'passed': True}),
                    ({'passed': True}, {**good, 'reclaimable_bytes': 5_999_999_999}, 10, {'passed': True})]:
                with self.subTest(result=result, after=after, elapsed=elapsed, live=live), \
                        self.assertRaises(RuntimeError):
                    check_whole_interval(result, good, after, elapsed, live)
        with patch('optimization_serial_build.live_group_members', return_value=[123]), \
                self.assertRaisesRegex(RuntimeError, 'survived'):
            check_whole_interval({'passed': True}, good, good, 10,
                                 {'passed': True, 'owned_groups': [123]})

    def test_receipt_write_failure_still_drains_the_child(self):
        original_write = Path.write_text
        original_popen = subprocess.Popen
        children, writes = [], []
        def write(path, *args, **kwargs):
            writes.append(path)
            if len(writes) > 1:
                raise PermissionError('fixture denied receipt writes')
            return original_write(path, *args, **kwargs)
        def popen(command, *args, **kwargs):
            process = original_popen(command, *args, **kwargs)
            if command[0] == sys.executable:
                children.append(process)
            return process
        with tempfile.TemporaryDirectory() as directory:
            path, error_log = Path(directory), io.StringIO()
            with patch.object(Path, 'write_text', write), \
                    patch('optimization_serial_build.subprocess.Popen', popen), \
                    redirect_stderr(error_log), self.assertRaises(PermissionError):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json',
                    snapshot=lambda: {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0})
            self.assertEqual(len(children), 1)
            self.assertIsInstance(children[0].returncode, int)
            fallback = json.loads(error_log.getvalue())
            self.assertIn('fixture denied receipt writes', fallback['error'])
            self.assertEqual(fallback['remaining_owned_members_after_cleanup'], [])
            self.assertFalse(fallback['passed'])


if __name__ == '__main__':
    unittest.main()
