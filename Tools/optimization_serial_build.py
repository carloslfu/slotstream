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
    # The compiler cannot attribute macOS paging to its own process tree.
    # Frozen studies may still opt into clean-interval exclusion explicitly.
    'stop_on_new_swapouts': False,
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
    stop_on_swapouts = policy.get('stop_on_new_swapouts', False)
    if type(stop_on_swapouts) is not bool or type(initial_swapouts) is not int or initial_swapouts < 0:
        raise ValueError('invalid VM policy or initial swapout observation')
    for key in ['reclaimable_bytes', 'swapouts']:
        if type(snapshot.get(key)) is not int or snapshot[key] < 0:
            raise ValueError('invalid live memory snapshot')
    if type(rss_bytes) is not int or rss_bytes < 0:
        raise ValueError('invalid owned RSS observation')
    if snapshot['reclaimable_bytes'] < policy['minimum_live_reclaimable_bytes']:
        raise RuntimeError('live reclaimable memory fell below the serial-build floor')
    if rss_bytes > policy['maximum_owned_rss_bytes']:
        raise RuntimeError('owned build processes exceeded the serial-build RSS ceiling')
    if snapshot['swapouts'] < initial_swapouts:
        raise RuntimeError('swapout counter moved backwards during the guarded process')
    if stop_on_swapouts and snapshot['swapouts'] != initial_swapouts:
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
