---
type: run
id: 01m1x68a1hf23k8zckjrx6jxv0
created: 2026-09-07T05:42:59.377248+00:00
updated: 2026-09-07T05:42:59.620959+00:00
summary: Prospective OS-pressure observation and guarded process receipts
binary: V241 candidate cc66ed05d56b3fb173ba579d83acb2ade5486e35666c66d2765d7561cb6c042b unexecuted by these fixtures
captured_at: 2026-09-07
command: python3 Tools/optimization_serial_build_test.py; python3 Tools/optimization_readiness_test.py; python3 Tools/static_gates_binary_test.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Prospective OS-pressure observation and guarded process receipts
tool: python3
---
# Prospective OS-pressure observation and guarded process receipts

V252 adds a read-only sysctl pressure observer that requires exact normal level1 and fails closed on warning, critical, malformed, unknown or unavailable readings. It changes no OS state, applications, allocator policy or model resource ceiling. A generic classification argument allows the previously tested process guard to identify API work honestly without altering its build defaults or limits. Twelve guard, four pressure and thirteen static-wrapper tests pass; independent API/static shell syntax checks pass. No model or performance qualification follows.

## /tmp/slotstream-optimization-execution/pressure-readiness-v252/after/Tools/optimization_readiness.py

SHA-256 `ad3874ec1ed1c87d621e76f01a1a08d60dd4fe593406499d22885639d2eeaefc`; 1028 bytes.

````text
"""Read the Mac's OS pressure state without changing memory or applications."""
import subprocess


def pressure_snapshot(run=subprocess.run):
    command = ['sysctl', '-n', 'kern.memorystatus_vm_pressure_level']
    result = run(command, text=True, capture_output=True, timeout=2)
    raw = result.stdout.strip()
    if result.returncode != 0 or raw not in ('1', '2', '4'):
        raise RuntimeError(f'OS memory pressure is unreadable: exit={result.returncode}, value={raw!r}')
    level = int(raw)
    return {'command': command, 'level': level,
            'name': {1: 'normal', 2: 'warning', 4: 'critical'}[level],
            'stdout': result.stdout, 'stderr': result.stderr}


def require_normal(snapshot):
    if type(snapshot.get('level')) is not int or snapshot['level'] != 1:
        raise RuntimeError('OS memory pressure is not normal; model work is not eligible')


if __name__ == '__main__':
    import json
    observation = pressure_snapshot()
    print(json.dumps(observation))
    require_normal(observation)
````

## /tmp/slotstream-optimization-execution/pressure-readiness-v252/after/Tools/optimization_readiness_test.py

SHA-256 `6c963a9aec3be52975da24328a965b3778259a6372c691b3e6c9f32b92e63016`; 1796 bytes.

````text
"""Pressure readiness refuses bad observations without launching a model."""
import subprocess
import unittest

from optimization_readiness import pressure_snapshot, require_normal


class PressureReadiness(unittest.TestCase):
    def observe(self, stdout, code=0):
        calls = []
        def run(command, **kwargs):
            calls.append((command, kwargs))
            return subprocess.CompletedProcess(command, code, stdout, '')
        result = pressure_snapshot(run)
        self.assertEqual(calls[0][0], ['sysctl', '-n', 'kern.memorystatus_vm_pressure_level'])
        self.assertEqual(calls[0][1]['timeout'], 2)
        return result

    def test_only_normal_pressure_is_eligible(self):
        require_normal(self.observe('1\n'))
        for value in ['2\n', '4\n']:
            with self.subTest(value=value), self.assertRaises(RuntimeError):
                require_normal(self.observe(value))

    def test_bad_or_failed_kernel_reading_is_refused(self):
        for value, code in [('', 0), ('0', 0), ('3', 0), ('5', 0), ('true', 0),
                            ('1.0', 0), ('1\n2', 0), ('1', 1)]:
            with self.subTest(value=value, code=code), self.assertRaises(RuntimeError):
                self.observe(value, code)

    def test_untyped_or_unknown_pressure_cannot_pass(self):
        for value in [None, True, 1.0, '1', -1, 0, 2, 4]:
            with self.subTest(value=value), self.assertRaises(RuntimeError):
                require_normal({'level': value})

    def test_timeout_cannot_turn_into_normal(self):
        def run(command, **kwargs):
            raise subprocess.TimeoutExpired(command, kwargs['timeout'])
        with self.assertRaises(subprocess.TimeoutExpired):
            pressure_snapshot(run)


if __name__ == '__main__':
    unittest.main()
````

## /tmp/slotstream-optimization-execution/pressure-readiness-v252/after/Tools/optimization_serial_build.py

SHA-256 `f83e937f823c42e89da796b8616a60da61649f67f6e12166608440ee016560d8`; 11651 bytes.

````text
#!/usr/bin/env python3
"""Build one isolated candidate with a serial compiler and live memory guards.

This is a separate build profile, not a relaxed inference/benchmark protocol.
The normal optimization_build default remains 13 GB. No model is launched.
"""
import argparse
import fcntl
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import time
import traceback

from optimization_build import build
from prefill_bench import digest, terminate_child_tree, vm_snapshot


POLICY = {
    'startup_reclaimable_bytes': 9_500_000_000,
    'minimum_live_reclaimable_bytes': 6_000_000_000,
    'maximum_owned_rss_bytes': 3_000_000_000,
    'sample_interval_seconds': .2,
    'maximum_build_seconds': 1200,
    'compiler_jobs': 1,
    'stop_on_new_swapouts': True,
}


def owned_processes(output, root_pid):
    rows = [tuple(map(int, line.split())) for line in output.splitlines() if line.strip()]
    if any(len(row) != 3 or min(row) < 0 for row in rows):
        raise ValueError('invalid process memory observation')
    if len({row[0] for row in rows}) != len(rows):
        raise ValueError('duplicate process identity')
    owned = {root_pid}
    while True:
        expanded = owned | {pid for pid, parent, _ in rows if parent in owned}
        if expanded == owned:
            break
        owned = expanded
    return [(pid, rss_kib * 1024) for pid, _, rss_kib in rows if pid in owned]


def check_sample(snapshot, rss_bytes, initial_swapouts, policy=POLICY):
    for key in ['reclaimable_bytes', 'swapouts']:
        if type(snapshot.get(key)) is not int or snapshot[key] < 0:
            raise ValueError('invalid live memory snapshot')
    if type(rss_bytes) is not int or rss_bytes < 0:
        raise ValueError('invalid owned RSS observation')
    if snapshot['reclaimable_bytes'] < policy['minimum_live_reclaimable_bytes']:
        raise RuntimeError('live reclaimable memory fell below the serial-build floor')
    if rss_bytes > policy['maximum_owned_rss_bytes']:
        raise RuntimeError('owned build processes exceeded the serial-build RSS ceiling')
    if snapshot['swapouts'] != initial_swapouts:
        raise RuntimeError('swapout counter changed during the serial build')


def live_group_members(groups):
    table = subprocess.check_output(['ps', '-axo', 'pid=,pgid=,state='], text=True, timeout=2)
    return [int(pid) for pid, group, state in (line.split() for line in table.splitlines())
            if int(group) in groups and not state.startswith('Z')]


def drain_groups(groups):
    errors = []
    for sig in [signal.SIGTERM, signal.SIGKILL]:
        for group in groups:
            try:
                os.killpg(group, sig)
            except ProcessLookupError:
                pass
            except OSError as error:
                errors.append(f'{group}: {type(error).__name__}: {error}')
        deadline = time.monotonic() + (2 if sig == signal.SIGTERM else 3)
        while live_group_members(groups) and time.monotonic() < deadline:
            time.sleep(.05)
    remaining = live_group_members(groups)
    if errors or remaining:
        raise RuntimeError(f'owned group cleanup unverified: errors={errors}, remaining={remaining}')


def guarded_run(command, *, cwd, stdout, stderr, record_path,
                snapshot=vm_snapshot, policy=POLICY,
                classification='serial build only; not model qualification'):
    before = snapshot()
    if before['reclaimable_bytes'] < policy['startup_reclaimable_bytes']:
        raise RuntimeError('serial-build startup headroom is unavailable; child not launched')
    record = {'command': command, 'policy': policy, 'before': before, 'samples': [],
              'passed': False, 'classification': classification}
    record_path = Path(record_path).resolve()
    def save():
        pending = record_path.with_suffix('.pending')
        pending.write_text(json.dumps(record, indent=2) + '\n')
        pending.replace(record_path)
    save()
    started = time.monotonic()
    child = None
    groups = set()
    sample_file = None
    try:
        sample_file = record_path.with_suffix('.samples.jsonl').open('x')
        child = subprocess.Popen(command, cwd=cwd, stdout=stdout, stderr=stderr,
                                 start_new_session=True)
        record['child_pid'] = child.pid
        groups.add(child.pid)
        save()
        while child.poll() is None:
            elapsed = time.monotonic() - started
            if elapsed > policy['maximum_build_seconds']:
                raise TimeoutError('serial build reached its prospective time limit')
            raw_table = subprocess.check_output(
                ['ps', '-axo', 'pid=,ppid=,pgid=,rss='], text=True, timeout=2)
            table = [tuple(map(int, line.split())) for line in raw_table.splitlines() if line.strip()]
            process_table = '\n'.join(f'{pid} {parent} {rss}' for pid, parent, _, rss in table)
            processes = owned_processes(process_table, child.pid)
            owned = {pid for pid, _ in processes}
            groups.intersection_update(group for _, _, group, _ in table)
            groups.update(group for pid, _, group, _ in table if pid in owned and group in owned)
            current = snapshot()
            rss_bytes = sum(rss for _, rss in processes)
            record['samples'].append({'elapsed_seconds': elapsed,
                'owned_rss_bytes': rss_bytes, 'owned_process_count': len(processes),
                'reclaimable_bytes': current['reclaimable_bytes'],
                'swapins': current.get('swapins'), 'swapouts': current['swapouts']})
            sample_file.write(json.dumps(record['samples'][-1]) + '\n')
            sample_file.flush()
            check_sample(current, rss_bytes, before['swapouts'], policy)
            time.sleep(policy['sample_interval_seconds'])
        record['exit_code'] = child.returncode
        record['after'] = snapshot()
        check_sample(record['after'], 0, before['swapouts'], policy)
        record['remaining_owned_members'] = live_group_members(groups)
        if record['remaining_owned_members']:
            raise RuntimeError('make exited while owned process-group descendants remained')
        record['passed'] = child.returncode == 0
        return subprocess.CompletedProcess(command, child.returncode)
    except BaseException as error:
        record['error'] = f'{type(error).__name__}: {error}'
        record['traceback'] = traceback.format_exc()
        raise
    finally:
        # Write the primary trigger before cleanup or the final VM observation
        # can fail. Incremental samples also survive a receipt-writing failure.
        record['owned_groups'] = sorted(groups)
        try:
            save()
        except BaseException as error:
            record['receipt_error_before_cleanup'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        try:
            if child is not None and child.poll() is None:
                terminate_child_tree(child)
        except BaseException as error:
            record['cleanup_error'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        try:
            if live_group_members(groups):
                drain_groups(groups)
            record['remaining_owned_members_after_cleanup'] = live_group_members(groups)
        except BaseException as error:
            record['group_cleanup_error'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        record['elapsed_seconds'] = time.monotonic() - started
        if child is not None:
            record['child_exit_code'] = child.returncode
        try:
            record['after_cleanup'] = snapshot()
        except BaseException as error:
            record['after_cleanup_error'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        if sample_file is not None:
            sample_file.close()
        try:
            save()
        except BaseException as error:
            record['receipt_error_after_cleanup'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
            print(json.dumps({key: value for key, value in record.items() if key != 'samples'}),
                  file=sys.stderr, flush=True)
        secondary = [record[key] for key in
            ['cleanup_error', 'group_cleanup_error', 'after_cleanup_error',
             'receipt_error_before_cleanup', 'receipt_error_after_cleanup'] if key in record]
        if secondary and 'error' not in record:
            raise RuntimeError('; '.join(secondary))


def check_whole_interval(result, before, after, elapsed, live):
    if result.get('passed') is not True or live.get('passed') is not True:
        raise RuntimeError('serial compiler or build publication did not pass')
    if elapsed > POLICY['maximum_build_seconds'] + 20:
        raise RuntimeError('complete build/publication exceeded its bounded interval')
    check_sample(after, 0, before['swapouts'])
    if live_group_members(set(live.get('owned_groups', []))):
        raise RuntimeError('owned compiler descendants survived publication')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    def interrupted(number, _frame):
        raise KeyboardInterrupt(f'serial build interrupted by signal {number}')
    signal.signal(signal.SIGINT, interrupted)
    signal.signal(signal.SIGTERM, interrupted)
    # Keep the real model lock through publication and final observation. The
    # ordinary helper keeps its own independent lock without reacquiring ours.
    with open(f'/tmp/slotstream-model-{os.getuid()}.lock', 'a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        started = time.monotonic()
        before = vm_snapshot()
        result = build(args.source, args.out,
            required_gb=POLICY['startup_reclaimable_bytes'] / 1e9,
            jobs=POLICY['compiler_jobs'], lock_path=args.source / '.serial-build.lock',
            run=lambda command, **kwargs: guarded_run(command, **kwargs,
                record_path=args.out / 'live-memory.json'))
        result['serial_driver_sha256'] = digest(Path(__file__))
        result['serial_policy'] = POLICY
        result['whole_interval_before'] = before
        result['model_lock_held_through_publication'] = True
        try:
            after = vm_snapshot()
            elapsed = time.monotonic() - started
            result['whole_interval_after'] = after
            result['whole_interval_seconds'] = elapsed
            live_path = args.out / 'live-memory.json'
            live = json.loads(live_path.read_text()) if live_path.exists() else {}
            check_whole_interval(result, before, after, elapsed, live)
            result['whole_interval_passed'] = True
        except BaseException as error:
            result['whole_interval_passed'] = False
            result['whole_interval_error'] = f'{type(error).__name__}: {error}'
            result['passed'] = False
            candidate = args.out / 'candidate'
            if candidate.exists():
                candidate.rename(args.out / 'unqualified-candidate')
        (args.out / 'manifest.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({key: result[key] for key in
        ['passed', 'error', 'elapsed_seconds', 'serial_driver_sha256'] if key in result}), flush=True)
    return 0 if result['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
````

## /tmp/slotstream-optimization-execution/pressure-readiness-v252/after/Tools/optimization_serial_build_test.py

SHA-256 `e3064090075309261ef9d6e7e223c10cd03d00e4125aa92bda0bba73f2821189`; 10421 bytes.

````text
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
                 (good, 3_000_000_001), ({**good, 'swapouts': 43}, 0),
                 ({**good, 'swapouts': 41}, 0)]
        for snapshot, rss in cases:
            with self.subTest(snapshot=snapshot, rss=rss), self.assertRaises(RuntimeError):
                check_sample(snapshot, rss, 42)

    def test_bad_observations_are_refused(self):
        for value in [None, True, float('nan'), -1]:
            with self.subTest(value=value), self.assertRaises(ValueError):
                check_sample({'reclaimable_bytes': value, 'swapouts': 0}, 0, 0)

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
            for result, after, elapsed, live in [
                    ({'passed': False}, good, 10, {'passed': True}),
                    ({'passed': True}, good, 10, {'passed': False}),
                    ({'passed': True}, good, 1220.001, {'passed': True}),
                    ({'passed': True}, {**good, 'swapouts': 43}, 10, {'passed': True}),
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
````

## /tmp/slotstream-optimization-execution/pressure-readiness-v252/after/Tools/static_gates.sh

SHA-256 `97add207845104fb2071f79d411d407afd9d6b1cd6f99abd5f57a137276b5981`; 1830 bytes.

````text
#!/bin/bash
# Fast, weights-free checks suitable for every pull request and release.
set -euo pipefail
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
export BIN SLOTSTREAM_TEST_BINARY="$BIN"

for f in install.sh Tools/*.sh .githooks/*; do
  bash -n "$f"
done
sh -n install.sh
python3 -m py_compile Tools/*.py Tools/reference/*.py Tools/slotpack/*.py
python3 Tools/static_gates_binary_test.py
python3 Tools/installer_gates_binary_test.py
python3 Tools/verify_binary_test.py
python3 Tools/sampler_gates_test.py
python3 Tools/api_generation_test.py
python3 Tools/e2e_release_test.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/context_qualification_checks.py
python3 Tools/process_cleanup_checks.py
# These use tiny fixtures or mocked processes; none loads MLX, builds Swift,
# reads model weights, or takes the live model lock. Syntax checks alone do
# not exercise their benchmark validity and artifact-identity assertions.
for suite in build_identity optimization_build optimization_serial_build optimization_readiness prefill_bench expert_layout_probe \
             ngram_cache_probe indexer_score_probe vision_capacity_gate \
             optimization_prerequisites optimization_soak; do
  python3 "Tools/${suite}_test.py"
done
Tools/llms_full.sh --check

# The brain: the store validates, MEASUREMENTS.md and PLAN.md match their
# records, and every public number still has its needle on its surfaces.
Tools/brain_gates.sh

(cd bench/parity31 && shasum -a 256 -c SHA256SUMS)

if grep -En 'File\(path: .*sha256: nil\)' Sources/Slotstream/PinnedModel.swift; then
  echo "pinned manifest contains an unhashed file" >&2
  exit 1
fi

"$BIN" runtime-check
"$BIN" pull-check
python3 Tools/slotpack/checks.py
Tools/planner_gates.sh
Tools/installer_gates.sh

echo "STATIC GATES PASS"
````

## /tmp/slotstream-optimization-execution/pressure-readiness-v252/after/Tools/static_gates_binary_test.py

SHA-256 `ea638b7619b60de946ae8887441ee1c7e140e2fad93007781ed17e3390af352f`; 8855 bytes.

````text
"""Execute the real static entry point against tiny, model-free fixture tools."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

SCRIPT = Path(__file__).with_name("static_gates.sh").resolve()
OPTIMIZATION_SUITES = [
    'build_identity', 'optimization_build', 'optimization_serial_build', 'optimization_readiness', 'prefill_bench', 'expert_layout_probe',
    'ngram_cache_probe', 'indexer_score_probe', 'vision_capacity_gate',
    'optimization_prerequisites', 'optimization_soak',
]


class StaticBinarySelection(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-static-selection-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.trace = self.root/'trace.jsonl'
        self.suite_trace = self.root/'suite-trace.jsonl'
        for directory in ['Tools/reference', 'Tools/slotpack', '.githooks',
                          'bench/parity31', 'Sources/Slotstream', '.build/release',
                          'legacy binary', 'frozen binary']:
            (self.root/directory).mkdir(parents=True, exist_ok=True)
        self.write('Tools/static_gates.sh', SCRIPT.read_text())
        for path in ['install.sh', '.githooks/pre-commit', 'Tools/llms_full.sh',
                     'Tools/brain_gates.sh', 'Tools/installer_gates.sh']:
            self.write(path, '#!/bin/bash\nexit 0\n')
        # Record the forwarded environment at the nested planner boundary.
        # This stub does not certify the real planner's argument handling.
        self.write('Tools/planner_gates.sh', '''#!/bin/bash
set -eu
BIN=${BIN:-.build/release/slotstream}
"$BIN" doctor --json
''')
        for path in ['Tools/static_gates_binary_test.py', 'Tools/coverage_ratchet_test.py',
                     'Tools/process_cleanup_checks.py', 'Tools/context_qualification_checks.py',
                     'Tools/installer_gates_binary_test.py',
                     'Tools/verify_binary_test.py',
                     'Tools/sampler_gates_test.py',
                     'Tools/reference/fixture.py', 'Tools/slotpack/checks.py']:
            self.write(path, '# Model-free dependency fixture.\n')
        self.write('Tools/e2e_release_test.py', "import os\nraise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_E2E') == '1' else 0)\n")
        self.write('Tools/api_generation_test.py', "import os\nraise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_API_GENERATION') == '1' else 0)\n")
        for suite in OPTIMIZATION_SUITES:
            self.write(f'Tools/{suite}_test.py', f'''import json, os
with open(os.environ['SLOTSTREAM_SUITE_TRACE'], 'a') as output:
    output.write(json.dumps({suite!r})+'\\n')
raise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_SUITE') == {suite!r} else 0)
''')
        self.write('Sources/Slotstream/PinnedModel.swift', '// pinned manifest fixture\n')
        self.write('bench/parity31/fixture.txt', 'exact fixture\n')
        sha = hashlib.sha256((self.root/'bench/parity31/fixture.txt').read_bytes()).hexdigest()
        self.write('bench/parity31/SHA256SUMS', f'{sha}  fixture.txt\n')
        self.binaries = {}
        for name, path in [('release', '.build/release/slotstream'),
                           ('legacy', 'legacy binary/slotstream'),
                           ('frozen', 'frozen binary/slotstream')]:
            self.binaries[name] = self.root/path
            self.write(path, f'''#!/usr/bin/env python3
import json, os, sys
with open(os.environ['SLOTSTREAM_SELECTION_TRACE'], 'a') as output:
    output.write(json.dumps({{'selected': {name!r}, 'arguments': sys.argv[1:],
        'BIN': os.environ.get('BIN'), 'SLOTSTREAM_TEST_BINARY': os.environ.get('SLOTSTREAM_TEST_BINARY')}})+'\\n')
raise SystemExit(int(os.environ.get('SLOTSTREAM_SELECTION_EXIT', '0')))
''')

    def write(self, relative, text):
        path = self.root/relative
        path.write_text(text)
        path.chmod(0o755)

    def run_entry(self, changes):
        env = {k: v for k, v in os.environ.items()
               if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        env.update(SLOTSTREAM_SELECTION_TRACE=str(self.trace))
        env.update(SLOTSTREAM_SUITE_TRACE=str(self.suite_trace))
        env.update(changes)
        p = subprocess.run(['bash', 'Tools/static_gates.sh'], cwd=self.root,
                           env=env, text=True, capture_output=True, timeout=15)
        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] \
            if self.trace.exists() else []
        return p, rows

    def expect_selected(self, changes, name):
        p, rows = self.run_entry(changes)
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual([row['selected'] for row in rows], [name]*3)
        self.assertEqual([row['arguments'] for row in rows],
                         [['runtime-check'], ['pull-check'], ['doctor', '--json']])
        expected = str(self.binaries[name]) if name != 'release' else '.build/release/slotstream'
        self.assertTrue(all(row['BIN'] == expected and row['SLOTSTREAM_TEST_BINARY'] == expected
                            for row in rows), rows)

    def test_default_release_is_used_and_forwarded(self):
        self.expect_selected({}, 'release')

    def test_legacy_bin_override_is_used_and_forwarded(self):
        self.expect_selected({'BIN': str(self.binaries['legacy'])}, 'legacy')

    def test_frozen_override_with_spaces_is_used_and_forwarded(self):
        self.expect_selected({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')

    def test_frozen_override_takes_precedence_over_legacy_bin(self):
        self.expect_selected({'BIN': str(self.binaries['legacy']),
                              'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')

    def test_missing_selected_binary_fails_without_fallback(self):
        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.root/'missing binary')})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_selected_binary_failure_stops_without_fallback(self):
        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen']),
                                  'SLOTSTREAM_SELECTION_EXIT': '23'})
        self.assertEqual(p.returncode, 23)
        self.assertEqual([row['selected'] for row in rows], ['frozen'])

    def test_failed_installed_release_fixture_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_E2E': '1'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_installed_release_fixture_is_a_failure(self):
        (self.root/'Tools/e2e_release_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_failed_api_generation_fixture_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_API_GENERATION': '1'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_api_generation_fixture_is_a_failure(self):
        (self.root/'Tools/api_generation_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_every_optimization_suite_runs_before_native_checks(self):
        p, rows = self.run_entry({})
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()] \
            if self.suite_trace.exists() else []
        self.assertEqual(suites, OPTIMIZATION_SUITES)
        self.assertEqual(len(rows), 3)

    def test_failed_optimization_suite_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_SUITE': 'optimization_prerequisites'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()]
        self.assertEqual(suites, OPTIMIZATION_SUITES[:-1])

    def test_missing_optimization_suite_is_a_failure(self):
        (self.root/'Tools/optimization_prerequisites_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script', type=Path, default=SCRIPT)
    options, remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])
````

## /tmp/slotstream-optimization-execution/pressure-readiness-v252/before/Tools/optimization_serial_build.py

SHA-256 `05a81e16880cdea80198a6cbd7e7fc84429b68940e1c699163a0ae5fe15d6ed8`; 11604 bytes.

````text
#!/usr/bin/env python3
"""Build one isolated candidate with a serial compiler and live memory guards.

This is a separate build profile, not a relaxed inference/benchmark protocol.
The normal optimization_build default remains 13 GB. No model is launched.
"""
import argparse
import fcntl
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import time
import traceback

from optimization_build import build
from prefill_bench import digest, terminate_child_tree, vm_snapshot


POLICY = {
    'startup_reclaimable_bytes': 9_500_000_000,
    'minimum_live_reclaimable_bytes': 6_000_000_000,
    'maximum_owned_rss_bytes': 3_000_000_000,
    'sample_interval_seconds': .2,
    'maximum_build_seconds': 1200,
    'compiler_jobs': 1,
    'stop_on_new_swapouts': True,
}


def owned_processes(output, root_pid):
    rows = [tuple(map(int, line.split())) for line in output.splitlines() if line.strip()]
    if any(len(row) != 3 or min(row) < 0 for row in rows):
        raise ValueError('invalid process memory observation')
    if len({row[0] for row in rows}) != len(rows):
        raise ValueError('duplicate process identity')
    owned = {root_pid}
    while True:
        expanded = owned | {pid for pid, parent, _ in rows if parent in owned}
        if expanded == owned:
            break
        owned = expanded
    return [(pid, rss_kib * 1024) for pid, _, rss_kib in rows if pid in owned]


def check_sample(snapshot, rss_bytes, initial_swapouts, policy=POLICY):
    for key in ['reclaimable_bytes', 'swapouts']:
        if type(snapshot.get(key)) is not int or snapshot[key] < 0:
            raise ValueError('invalid live memory snapshot')
    if type(rss_bytes) is not int or rss_bytes < 0:
        raise ValueError('invalid owned RSS observation')
    if snapshot['reclaimable_bytes'] < policy['minimum_live_reclaimable_bytes']:
        raise RuntimeError('live reclaimable memory fell below the serial-build floor')
    if rss_bytes > policy['maximum_owned_rss_bytes']:
        raise RuntimeError('owned build processes exceeded the serial-build RSS ceiling')
    if snapshot['swapouts'] != initial_swapouts:
        raise RuntimeError('swapout counter changed during the serial build')


def live_group_members(groups):
    table = subprocess.check_output(['ps', '-axo', 'pid=,pgid=,state='], text=True, timeout=2)
    return [int(pid) for pid, group, state in (line.split() for line in table.splitlines())
            if int(group) in groups and not state.startswith('Z')]


def drain_groups(groups):
    errors = []
    for sig in [signal.SIGTERM, signal.SIGKILL]:
        for group in groups:
            try:
                os.killpg(group, sig)
            except ProcessLookupError:
                pass
            except OSError as error:
                errors.append(f'{group}: {type(error).__name__}: {error}')
        deadline = time.monotonic() + (2 if sig == signal.SIGTERM else 3)
        while live_group_members(groups) and time.monotonic() < deadline:
            time.sleep(.05)
    remaining = live_group_members(groups)
    if errors or remaining:
        raise RuntimeError(f'owned group cleanup unverified: errors={errors}, remaining={remaining}')


def guarded_run(command, *, cwd, stdout, stderr, record_path,
                snapshot=vm_snapshot, policy=POLICY):
    before = snapshot()
    if before['reclaimable_bytes'] < policy['startup_reclaimable_bytes']:
        raise RuntimeError('serial-build startup headroom is unavailable; child not launched')
    record = {'command': command, 'policy': policy, 'before': before, 'samples': [],
              'passed': False, 'classification': 'serial build only; not model qualification'}
    record_path = Path(record_path).resolve()
    def save():
        pending = record_path.with_suffix('.pending')
        pending.write_text(json.dumps(record, indent=2) + '\n')
        pending.replace(record_path)
    save()
    started = time.monotonic()
    child = None
    groups = set()
    sample_file = None
    try:
        sample_file = record_path.with_suffix('.samples.jsonl').open('x')
        child = subprocess.Popen(command, cwd=cwd, stdout=stdout, stderr=stderr,
                                 start_new_session=True)
        record['child_pid'] = child.pid
        groups.add(child.pid)
        save()
        while child.poll() is None:
            elapsed = time.monotonic() - started
            if elapsed > policy['maximum_build_seconds']:
                raise TimeoutError('serial build reached its prospective time limit')
            raw_table = subprocess.check_output(
                ['ps', '-axo', 'pid=,ppid=,pgid=,rss='], text=True, timeout=2)
            table = [tuple(map(int, line.split())) for line in raw_table.splitlines() if line.strip()]
            process_table = '\n'.join(f'{pid} {parent} {rss}' for pid, parent, _, rss in table)
            processes = owned_processes(process_table, child.pid)
            owned = {pid for pid, _ in processes}
            groups.intersection_update(group for _, _, group, _ in table)
            groups.update(group for pid, _, group, _ in table if pid in owned and group in owned)
            current = snapshot()
            rss_bytes = sum(rss for _, rss in processes)
            record['samples'].append({'elapsed_seconds': elapsed,
                'owned_rss_bytes': rss_bytes, 'owned_process_count': len(processes),
                'reclaimable_bytes': current['reclaimable_bytes'],
                'swapins': current.get('swapins'), 'swapouts': current['swapouts']})
            sample_file.write(json.dumps(record['samples'][-1]) + '\n')
            sample_file.flush()
            check_sample(current, rss_bytes, before['swapouts'], policy)
            time.sleep(policy['sample_interval_seconds'])
        record['exit_code'] = child.returncode
        record['after'] = snapshot()
        check_sample(record['after'], 0, before['swapouts'], policy)
        record['remaining_owned_members'] = live_group_members(groups)
        if record['remaining_owned_members']:
            raise RuntimeError('make exited while owned process-group descendants remained')
        record['passed'] = child.returncode == 0
        return subprocess.CompletedProcess(command, child.returncode)
    except BaseException as error:
        record['error'] = f'{type(error).__name__}: {error}'
        record['traceback'] = traceback.format_exc()
        raise
    finally:
        # Write the primary trigger before cleanup or the final VM observation
        # can fail. Incremental samples also survive a receipt-writing failure.
        record['owned_groups'] = sorted(groups)
        try:
            save()
        except BaseException as error:
            record['receipt_error_before_cleanup'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        try:
            if child is not None and child.poll() is None:
                terminate_child_tree(child)
        except BaseException as error:
            record['cleanup_error'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        try:
            if live_group_members(groups):
                drain_groups(groups)
            record['remaining_owned_members_after_cleanup'] = live_group_members(groups)
        except BaseException as error:
            record['group_cleanup_error'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        record['elapsed_seconds'] = time.monotonic() - started
        if child is not None:
            record['child_exit_code'] = child.returncode
        try:
            record['after_cleanup'] = snapshot()
        except BaseException as error:
            record['after_cleanup_error'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        if sample_file is not None:
            sample_file.close()
        try:
            save()
        except BaseException as error:
            record['receipt_error_after_cleanup'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
            print(json.dumps({key: value for key, value in record.items() if key != 'samples'}),
                  file=sys.stderr, flush=True)
        secondary = [record[key] for key in
            ['cleanup_error', 'group_cleanup_error', 'after_cleanup_error',
             'receipt_error_before_cleanup', 'receipt_error_after_cleanup'] if key in record]
        if secondary and 'error' not in record:
            raise RuntimeError('; '.join(secondary))


def check_whole_interval(result, before, after, elapsed, live):
    if result.get('passed') is not True or live.get('passed') is not True:
        raise RuntimeError('serial compiler or build publication did not pass')
    if elapsed > POLICY['maximum_build_seconds'] + 20:
        raise RuntimeError('complete build/publication exceeded its bounded interval')
    check_sample(after, 0, before['swapouts'])
    if live_group_members(set(live.get('owned_groups', []))):
        raise RuntimeError('owned compiler descendants survived publication')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    def interrupted(number, _frame):
        raise KeyboardInterrupt(f'serial build interrupted by signal {number}')
    signal.signal(signal.SIGINT, interrupted)
    signal.signal(signal.SIGTERM, interrupted)
    # Keep the real model lock through publication and final observation. The
    # ordinary helper keeps its own independent lock without reacquiring ours.
    with open(f'/tmp/slotstream-model-{os.getuid()}.lock', 'a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        started = time.monotonic()
        before = vm_snapshot()
        result = build(args.source, args.out,
            required_gb=POLICY['startup_reclaimable_bytes'] / 1e9,
            jobs=POLICY['compiler_jobs'], lock_path=args.source / '.serial-build.lock',
            run=lambda command, **kwargs: guarded_run(command, **kwargs,
                record_path=args.out / 'live-memory.json'))
        result['serial_driver_sha256'] = digest(Path(__file__))
        result['serial_policy'] = POLICY
        result['whole_interval_before'] = before
        result['model_lock_held_through_publication'] = True
        try:
            after = vm_snapshot()
            elapsed = time.monotonic() - started
            result['whole_interval_after'] = after
            result['whole_interval_seconds'] = elapsed
            live_path = args.out / 'live-memory.json'
            live = json.loads(live_path.read_text()) if live_path.exists() else {}
            check_whole_interval(result, before, after, elapsed, live)
            result['whole_interval_passed'] = True
        except BaseException as error:
            result['whole_interval_passed'] = False
            result['whole_interval_error'] = f'{type(error).__name__}: {error}'
            result['passed'] = False
            candidate = args.out / 'candidate'
            if candidate.exists():
                candidate.rename(args.out / 'unqualified-candidate')
        (args.out / 'manifest.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({key: result[key] for key in
        ['passed', 'error', 'elapsed_seconds', 'serial_driver_sha256'] if key in result}), flush=True)
    return 0 if result['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
````

## /tmp/slotstream-optimization-execution/pressure-readiness-v252/before/Tools/optimization_serial_build_test.py

SHA-256 `9d93f1d822135cebf50bafda3ac552ac5bc2f250db8ed6c576ffc14fb8ed0b41`; 10237 bytes.

````text
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
                 (good, 3_000_000_001), ({**good, 'swapouts': 43}, 0),
                 ({**good, 'swapouts': 41}, 0)]
        for snapshot, rss in cases:
            with self.subTest(snapshot=snapshot, rss=rss), self.assertRaises(RuntimeError):
                check_sample(snapshot, rss, 42)

    def test_bad_observations_are_refused(self):
        for value in [None, True, float('nan'), -1]:
            with self.subTest(value=value), self.assertRaises(ValueError):
                check_sample({'reclaimable_bytes': value, 'swapouts': 0}, 0, 0)

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
                snapshot=lambda: {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0})
            record = json.loads((path / 'receipt.json').read_text())
            self.assertEqual(result.returncode, 0)
            self.assertTrue(record['passed'])
            self.assertTrue(record['samples'])
            self.assertEqual(record['policy'], POLICY)

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
            for result, after, elapsed, live in [
                    ({'passed': False}, good, 10, {'passed': True}),
                    ({'passed': True}, good, 10, {'passed': False}),
                    ({'passed': True}, good, 1220.001, {'passed': True}),
                    ({'passed': True}, {**good, 'swapouts': 43}, 10, {'passed': True}),
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
````

## /tmp/slotstream-optimization-execution/pressure-readiness-v252/before/Tools/static_gates.sh

SHA-256 `abfe1afcff785cb784e11148893f9e77162b6ba1e39409befe7fbd57e45106df`; 1807 bytes.

````text
#!/bin/bash
# Fast, weights-free checks suitable for every pull request and release.
set -euo pipefail
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
export BIN SLOTSTREAM_TEST_BINARY="$BIN"

for f in install.sh Tools/*.sh .githooks/*; do
  bash -n "$f"
done
sh -n install.sh
python3 -m py_compile Tools/*.py Tools/reference/*.py Tools/slotpack/*.py
python3 Tools/static_gates_binary_test.py
python3 Tools/installer_gates_binary_test.py
python3 Tools/verify_binary_test.py
python3 Tools/sampler_gates_test.py
python3 Tools/api_generation_test.py
python3 Tools/e2e_release_test.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/context_qualification_checks.py
python3 Tools/process_cleanup_checks.py
# These use tiny fixtures or mocked processes; none loads MLX, builds Swift,
# reads model weights, or takes the live model lock. Syntax checks alone do
# not exercise their benchmark validity and artifact-identity assertions.
for suite in build_identity optimization_build optimization_serial_build prefill_bench expert_layout_probe \
             ngram_cache_probe indexer_score_probe vision_capacity_gate \
             optimization_prerequisites optimization_soak; do
  python3 "Tools/${suite}_test.py"
done
Tools/llms_full.sh --check

# The brain: the store validates, MEASUREMENTS.md and PLAN.md match their
# records, and every public number still has its needle on its surfaces.
Tools/brain_gates.sh

(cd bench/parity31 && shasum -a 256 -c SHA256SUMS)

if grep -En 'File\(path: .*sha256: nil\)' Sources/Slotstream/PinnedModel.swift; then
  echo "pinned manifest contains an unhashed file" >&2
  exit 1
fi

"$BIN" runtime-check
"$BIN" pull-check
python3 Tools/slotpack/checks.py
Tools/planner_gates.sh
Tools/installer_gates.sh

echo "STATIC GATES PASS"
````

## /tmp/slotstream-optimization-execution/pressure-readiness-v252/before/Tools/static_gates_binary_test.py

SHA-256 `6ade9adaaa5ee075147a4dfabb97096ac2c796d9df288e89ba2bc6728eee8826`; 8829 bytes.

````text
"""Execute the real static entry point against tiny, model-free fixture tools."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

SCRIPT = Path(__file__).with_name("static_gates.sh").resolve()
OPTIMIZATION_SUITES = [
    'build_identity', 'optimization_build', 'optimization_serial_build', 'prefill_bench', 'expert_layout_probe',
    'ngram_cache_probe', 'indexer_score_probe', 'vision_capacity_gate',
    'optimization_prerequisites', 'optimization_soak',
]


class StaticBinarySelection(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-static-selection-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.trace = self.root/'trace.jsonl'
        self.suite_trace = self.root/'suite-trace.jsonl'
        for directory in ['Tools/reference', 'Tools/slotpack', '.githooks',
                          'bench/parity31', 'Sources/Slotstream', '.build/release',
                          'legacy binary', 'frozen binary']:
            (self.root/directory).mkdir(parents=True, exist_ok=True)
        self.write('Tools/static_gates.sh', SCRIPT.read_text())
        for path in ['install.sh', '.githooks/pre-commit', 'Tools/llms_full.sh',
                     'Tools/brain_gates.sh', 'Tools/installer_gates.sh']:
            self.write(path, '#!/bin/bash\nexit 0\n')
        # Record the forwarded environment at the nested planner boundary.
        # This stub does not certify the real planner's argument handling.
        self.write('Tools/planner_gates.sh', '''#!/bin/bash
set -eu
BIN=${BIN:-.build/release/slotstream}
"$BIN" doctor --json
''')
        for path in ['Tools/static_gates_binary_test.py', 'Tools/coverage_ratchet_test.py',
                     'Tools/process_cleanup_checks.py', 'Tools/context_qualification_checks.py',
                     'Tools/installer_gates_binary_test.py',
                     'Tools/verify_binary_test.py',
                     'Tools/sampler_gates_test.py',
                     'Tools/reference/fixture.py', 'Tools/slotpack/checks.py']:
            self.write(path, '# Model-free dependency fixture.\n')
        self.write('Tools/e2e_release_test.py', "import os\nraise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_E2E') == '1' else 0)\n")
        self.write('Tools/api_generation_test.py', "import os\nraise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_API_GENERATION') == '1' else 0)\n")
        for suite in OPTIMIZATION_SUITES:
            self.write(f'Tools/{suite}_test.py', f'''import json, os
with open(os.environ['SLOTSTREAM_SUITE_TRACE'], 'a') as output:
    output.write(json.dumps({suite!r})+'\\n')
raise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_SUITE') == {suite!r} else 0)
''')
        self.write('Sources/Slotstream/PinnedModel.swift', '// pinned manifest fixture\n')
        self.write('bench/parity31/fixture.txt', 'exact fixture\n')
        sha = hashlib.sha256((self.root/'bench/parity31/fixture.txt').read_bytes()).hexdigest()
        self.write('bench/parity31/SHA256SUMS', f'{sha}  fixture.txt\n')
        self.binaries = {}
        for name, path in [('release', '.build/release/slotstream'),
                           ('legacy', 'legacy binary/slotstream'),
                           ('frozen', 'frozen binary/slotstream')]:
            self.binaries[name] = self.root/path
            self.write(path, f'''#!/usr/bin/env python3
import json, os, sys
with open(os.environ['SLOTSTREAM_SELECTION_TRACE'], 'a') as output:
    output.write(json.dumps({{'selected': {name!r}, 'arguments': sys.argv[1:],
        'BIN': os.environ.get('BIN'), 'SLOTSTREAM_TEST_BINARY': os.environ.get('SLOTSTREAM_TEST_BINARY')}})+'\\n')
raise SystemExit(int(os.environ.get('SLOTSTREAM_SELECTION_EXIT', '0')))
''')

    def write(self, relative, text):
        path = self.root/relative
        path.write_text(text)
        path.chmod(0o755)

    def run_entry(self, changes):
        env = {k: v for k, v in os.environ.items()
               if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        env.update(SLOTSTREAM_SELECTION_TRACE=str(self.trace))
        env.update(SLOTSTREAM_SUITE_TRACE=str(self.suite_trace))
        env.update(changes)
        p = subprocess.run(['bash', 'Tools/static_gates.sh'], cwd=self.root,
                           env=env, text=True, capture_output=True, timeout=15)
        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] \
            if self.trace.exists() else []
        return p, rows

    def expect_selected(self, changes, name):
        p, rows = self.run_entry(changes)
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual([row['selected'] for row in rows], [name]*3)
        self.assertEqual([row['arguments'] for row in rows],
                         [['runtime-check'], ['pull-check'], ['doctor', '--json']])
        expected = str(self.binaries[name]) if name != 'release' else '.build/release/slotstream'
        self.assertTrue(all(row['BIN'] == expected and row['SLOTSTREAM_TEST_BINARY'] == expected
                            for row in rows), rows)

    def test_default_release_is_used_and_forwarded(self):
        self.expect_selected({}, 'release')

    def test_legacy_bin_override_is_used_and_forwarded(self):
        self.expect_selected({'BIN': str(self.binaries['legacy'])}, 'legacy')

    def test_frozen_override_with_spaces_is_used_and_forwarded(self):
        self.expect_selected({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')

    def test_frozen_override_takes_precedence_over_legacy_bin(self):
        self.expect_selected({'BIN': str(self.binaries['legacy']),
                              'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')

    def test_missing_selected_binary_fails_without_fallback(self):
        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.root/'missing binary')})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_selected_binary_failure_stops_without_fallback(self):
        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen']),
                                  'SLOTSTREAM_SELECTION_EXIT': '23'})
        self.assertEqual(p.returncode, 23)
        self.assertEqual([row['selected'] for row in rows], ['frozen'])

    def test_failed_installed_release_fixture_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_E2E': '1'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_installed_release_fixture_is_a_failure(self):
        (self.root/'Tools/e2e_release_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_failed_api_generation_fixture_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_API_GENERATION': '1'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_api_generation_fixture_is_a_failure(self):
        (self.root/'Tools/api_generation_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_every_optimization_suite_runs_before_native_checks(self):
        p, rows = self.run_entry({})
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()] \
            if self.suite_trace.exists() else []
        self.assertEqual(suites, OPTIMIZATION_SUITES)
        self.assertEqual(len(rows), 3)

    def test_failed_optimization_suite_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_SUITE': 'optimization_prerequisites'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()]
        self.assertEqual(suites, OPTIMIZATION_SUITES[:-1])

    def test_missing_optimization_suite_is_a_failure(self):
        (self.root/'Tools/optimization_prerequisites_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script', type=Path, default=SCRIPT)
    options, remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])
````

## /tmp/slotstream-optimization-execution/pressure-readiness-v252/implementation.json

SHA-256 `e4f469b20b3d04231a2892de26ce2c77dba226488749d1d5a26a412a33d4d092`; 834 bytes.

````text
{
  "classification": "Test and resource-monitor implementation; no inference/performance qualification",
  "captured_at": "2026-09-07T05:34:09.255040+00:00",
  "after_sha256": {
    "Tools/optimization_readiness.py": "ad3874ec1ed1c87d621e76f01a1a08d60dd4fe593406499d22885639d2eeaefc",
    "Tools/optimization_readiness_test.py": "6c963a9aec3be52975da24328a965b3778259a6372c691b3e6c9f32b92e63016",
    "Tools/optimization_serial_build.py": "f83e937f823c42e89da796b8616a60da61649f67f6e12166608440ee016560d8",
    "Tools/optimization_serial_build_test.py": "e3064090075309261ef9d6e7e223c10cd03d00e4125aa92bda0bba73f2821189",
    "Tools/static_gates.sh": "97add207845104fb2071f79d411d407afd9d6b1cd6f99abd5f57a137276b5981",
    "Tools/static_gates_binary_test.py": "ea638b7619b60de946ae8887441ee1c7e140e2fad93007781ed17e3390af352f"
  }
}
````

## /tmp/slotstream-optimization-execution/pressure-readiness-v252/optimization_readiness_test.py.stderr.txt

SHA-256 `e6ec182765cd965f2837d8eeaef5a64af48a104f245cd1a0b7281559194c57c1`; 102 bytes.

````text
....
----------------------------------------------------------------------
Ran 4 tests in 0.000s

OK
````

## /tmp/slotstream-optimization-execution/pressure-readiness-v252/optimization_readiness_test.py.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/pressure-readiness-v252/optimization_serial_build_test.py.stderr.txt

SHA-256 `c58176c329c2da47f09f151799c967e8c1b0ec33b6917bffb10067f3bee38a13`; 111 bytes.

````text
............
----------------------------------------------------------------------
Ran 12 tests in 1.122s

OK
````

## /tmp/slotstream-optimization-execution/pressure-readiness-v252/optimization_serial_build_test.py.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/pressure-readiness-v252/static_gates_binary_test.py.stderr.txt

SHA-256 `82104287d14c6c398bd7776fbcada7475347149acb3733a6f49e258f15ecf20d`; 113 bytes.

````text
.............
----------------------------------------------------------------------
Ran 13 tests in 13.156s

OK
````

## /tmp/slotstream-optimization-execution/pressure-readiness-v252/static_gates_binary_test.py.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/pressure-readiness-v252/tests.json

SHA-256 `a3ec84facc5f8d7536803792287a1dcdc5667865eca56f27d545d3ce798b225a`; 767 bytes.

````text
{
  "passed": true,
  "rows": [
    {
      "command": [
        "python3",
        "Tools/optimization_serial_build_test.py"
      ],
      "exit_code": 0,
      "seconds": 1.197513
    },
    {
      "command": [
        "python3",
        "Tools/optimization_readiness_test.py"
      ],
      "exit_code": 0,
      "seconds": 0.03210058399999993
    },
    {
      "command": [
        "python3",
        "Tools/static_gates_binary_test.py"
      ],
      "exit_code": 0,
      "seconds": 13.196474292
    },
    {
      "command": [
        "bash",
        "-n",
        "Tools/api_robustness.sh"
      ],
      "exit_code": 0
    },
    {
      "command": [
        "bash",
        "-n",
        "Tools/static_gates.sh"
      ],
      "exit_code": 0
    }
  ]
}
````

