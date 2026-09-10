---
type: run
id: 01m1z9wy8ccjxvyj1nv2drwj13
created: 2026-09-08T01:25:10.028059+00:00
updated: 2026-09-08T01:25:10.281628+00:00
summary: Owned physical-footprint failure observer preserves the original memory guard
binary: No Slotstream or compiler executed; small Python child fixtures only
captured_at: 2026-09-08
command: python3 -m unittest -v pressure_footprint_test; additive source proof and bounded owned-child failure fixture
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Owned physical-footprint failure observer preserves the original memory guard
tool: python3 and source review
---
# Distinguish an owned process footprint from RSS at a guard failure

Source review confirms that the frozen outer guard samples ps RSS, while the engine separately records Mach physical footprint. A low outer RSS observation does not alone identify a model's physical charge or explain an OS pressure warning. The three earlier pressure stops remain unqualified; this finding does not establish a new allocation bug or identify a responsible application.

V341 adds a separate observer using the installed Darwin SDK's version-zero proc_pid_rusage ABI. It binds an owned root PID plus its process-start incarnation immediately after spawn. At an existing guard failure, it observes only that root and its current descendants, checks parent and incarnation stability before and after collection, and reports physical footprint separately from resident size. Missing, exited, reused or inaccessible processes yield incomplete evidence rather than zero bytes. Process-charge sums are explicitly not unique system memory, reclaimable memory, or a sampled high-water mark. No process names or unrelated application counters are retained.

Collection has a half-second budget, each process-table operation gets at most a quarter second or the remaining budget, and at most64 owned processes are collected. A separate copy of guarded_run adds only the post-spawn identity binding and failure observation. Removing the declared additions reconstructs the unchanged original guard byte-for-byte. It retains the original admission, memory/VM/timeout policies, primary exception, ownership checks and cleanup. Observation failure or file-write failure cannot turn the original failure into success or prevent cleanup. No extra observation runs on each measured decode step.

Thirteen model-free methods pass. They include the real installed SDK layout, a real small owned child, process-incarnation races, disappearing/reparented descendants, EPERM, collection limits, immutable output, the unchanged original guard body, and actual cleanup after both a synthetic guard exception and an exception inside the observer. The preserved small-child example uses a synthetic VM callback to exercise the error path without creating memory pressure or loading a model. All its children drain. Its byte counts are observer evidence only, not inference memory or savings.

No frozen executor or runtime default changes. The separate observer/guard must be explicitly bound in a future execution protocol after an actual resource change and a new coordinated Mac interval. It does not authorize a retry of an interrupted frozen attempt or waive OS pressure.

Preserved pressure stops: [[sources/runs/2026/09/2026-09-08-optimization-native-memory-pressure-stops]] and [[sources/runs/2026/09/2026-09-08-optimization-image-serving-pressure-stop]].

## Evidence inventory

````json
[
  {
    "path": "/tmp/slotstream-optimization-execution/pressure-footprint-v341/additive-source-proof.json",
    "bytes": 2168,
    "sha256": "ac6a7ff40635d0e7d1aa40ce8a8bb2c8b865d1d438607281cbe6e1b00eaa36ef"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/pressure-footprint-v341/guard_with_footprint.py",
    "bytes": 13126,
    "sha256": "72836a3c6bc03366b6f546c21d1f32636f01373d29a49e2ae2246e5090a0f215"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/pressure-footprint-v341/owned-child-example/memory.failure-footprint.json",
    "bytes": 912,
    "sha256": "7905bcc376b47560ce4a779a22d787a9986ba3c0113f3359e2252ad0e8060a43"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/pressure-footprint-v341/owned-child-example/memory.json",
    "bytes": 2426,
    "sha256": "5d4a96f4b7f44d1298c2c6548b17370ab4a12ff9115e3292d223c9202fdd7fe0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/pressure-footprint-v341/owned-child-example/memory.samples.jsonl",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/pressure-footprint-v341/owned-child-example/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/pressure-footprint-v341/owned-child-example/stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/pressure-footprint-v341/preparation.json",
    "bytes": 3140,
    "sha256": "197d4c4b951d4c7945bc9c175668acd80aff56c8392a07a2d09362ed9f49240a"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/pressure-footprint-v341/pressure_footprint.py",
    "bytes": 7602,
    "sha256": "2ff6061c46f588979da498ea67e93b8e6f887a845b6daab2e115da72a367f73e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/pressure-footprint-v341/pressure_footprint_test.py",
    "bytes": 10669,
    "sha256": "c6b93c00a5bb7265458af3a9f12f235f339fc695e1ebf42f067419f3561449b9"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/pressure-footprint-v341/tests.stderr.txt",
    "bytes": 1447,
    "sha256": "4878d96283f5c56c61764aba8e108d0a2249e43af288d2ca14621be8db2169e9"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/pressure-footprint-v341/tests.stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/pressure-footprint-v341/validation.json",
    "bytes": 1157,
    "sha256": "eac0737ed31e0063d43df1b657c37ab068244c9d5486e133a83fc5cee353f135"
  }
]
````

## additive-source-proof.json

SHA-256 `ac6a7ff40635d0e7d1aa40ce8a8bb2c8b865d1d438607281cbe6e1b00eaa36ef`.

````text
{
  "original_guard_sha256": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
  "additions": [
    [
      "from optimization_build import build\n",
      "from optimization_build import build\nfrom pressure_footprint import FailureObservation\n"
    ],
    [
      "    sample_file = None\n    try:\n",
      "    sample_file = None\n    footprint_observer = None\n    try:\n"
    ],
    [
      "        record['child_pid'] = child.pid\n",
      "        record['child_pid'] = child.pid\n        try:\n            footprint_observer = FailureObservation(child.pid)\n            record['owned_root_identity'] = footprint_observer.identity\n        except Exception as observation_error:\n            record['footprint_binding_error'] = f'{type(observation_error).__name__}: {observation_error}'\n"
    ],
    [
      "    except BaseException as error:\n        record['error'] = f'{type(error).__name__}: {error}'\n        record['traceback'] = traceback.format_exc()\n        raise\n",
      "    except BaseException as error:\n        record['error'] = f'{type(error).__name__}: {error}'\n        record['traceback'] = traceback.format_exc()\n        if footprint_observer is not None:\n            try:\n                record['failure_footprint'] = footprint_observer.capture(\n                    record_path.with_suffix('.failure-footprint.json'), error)\n            except BaseException as observation_error:\n                record['footprint_capture_error'] = f'{type(observation_error).__name__}: {observation_error}'\n        raise\n"
    ]
  ],
  "header": "# Separate additive failure observer. The original frozen guard is unchanged.\n# Import this module from a future explicitly bound executor; no existing study\n# receives the observation retrospectively and no original outcome is rescored.\nimport sys\nsys.path.insert(0, '/Users/carlos/Projects/slotstream/Tools')\n",
  "meaning": "Removing exactly these additions reconstructs the original guard byte for byte. Policy, check_sample, ownership, stop and cleanup logic are unchanged. Observer runs only after the original failure, except for one post-spawn identity bind."
}

````

## guard_with_footprint.py

SHA-256 `72836a3c6bc03366b6f546c21d1f32636f01373d29a49e2ae2246e5090a0f215`.

````text
# Separate additive failure observer. The original frozen guard is unchanged.
# Import this module from a future explicitly bound executor; no existing study
# receives the observation retrospectively and no original outcome is rescored.
import sys
sys.path.insert(0, '/Users/carlos/Projects/slotstream/Tools')
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
from pressure_footprint import FailureObservation
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
    stop_on_swapouts = policy.get('stop_on_new_swapouts', True)
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
    footprint_observer = None
    try:
        sample_file = record_path.with_suffix('.samples.jsonl').open('x')
        child = subprocess.Popen(command, cwd=cwd, stdout=stdout, stderr=stderr,
                                 start_new_session=True)
        record['child_pid'] = child.pid
        try:
            footprint_observer = FailureObservation(child.pid)
            record['owned_root_identity'] = footprint_observer.identity
        except Exception as observation_error:
            record['footprint_binding_error'] = f'{type(observation_error).__name__}: {observation_error}'
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
        if footprint_observer is not None:
            try:
                record['failure_footprint'] = footprint_observer.capture(
                    record_path.with_suffix('.failure-footprint.json'), error)
            except BaseException as observation_error:
                record['footprint_capture_error'] = f'{type(observation_error).__name__}: {observation_error}'
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

## owned-child-example/memory.failure-footprint.json

SHA-256 `7905bcc376b47560ce4a779a22d787a9986ba3c0113f3359e2252ad0e8060a43`.

````text
{
  "original_error": "RuntimeError: synthetic guard trigger; this fixture loads no model and creates no memory pressure",
  "observation": {
    "at_utc": "2026-09-08T01:16:32.191250+00:00",
    "complete": true,
    "root_identity": {
      "pid": 38834,
      "start_abstime": 33196033446084
    },
    "processes": [
      {
        "pid": 38834,
        "start_abstime": 33196033446084,
        "exit_abstime": 0,
        "physical_footprint_bytes": 4948256,
        "resident_size_bytes": 8634368
      }
    ],
    "classification": "Failure-time diagnostic only; not a sampled peak or admission/cleanup proof",
    "sum_process_footprints_bytes": 4948256,
    "sum_process_resident_sizes_bytes": 8634368,
    "sum_scope": "Sum of OS charges to these processes; not unique system memory or free/reclaimable memory.",
    "elapsed_seconds": 0.027135291000000006
  },
  "original_failure_preserved": true
}

````

## owned-child-example/memory.json

SHA-256 `5d4a96f4b7f44d1298c2c6548b17370ab4a12ff9115e3292d223c9202fdd7fe0`.

````text
{
  "command": [
    "python3",
    "-c",
    "import time; time.sleep(30)"
  ],
  "policy": {
    "startup_reclaimable_bytes": 1000000000,
    "minimum_live_reclaimable_bytes": 6000000000,
    "maximum_owned_rss_bytes": 128000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 5,
    "compiler_jobs": 1,
    "stop_on_new_swapouts": true
  },
  "before": {
    "reclaimable_bytes": 8000000000,
    "swapins": 0,
    "swapouts": 0
  },
  "samples": [],
  "passed": false,
  "classification": "Tiny owned child; synthetic VM callback to exercise the failure path, not inference or system-memory evidence",
  "child_pid": 38834,
  "owned_root_identity": {
    "pid": 38834,
    "start_abstime": 33196033446084
  },
  "error": "RuntimeError: synthetic guard trigger; this fixture loads no model and creates no memory pressure",
  "traceback": "Traceback (most recent call last):\n  File \"/tmp/slotstream-optimization-execution/pressure-footprint-v341/guard_with_footprint.py\", line 140, in guarded_run\n    current = snapshot()\n  File \"<stdin>\", line 15, in snapshot\nRuntimeError: synthetic guard trigger; this fixture loads no model and creates no memory pressure\n",
  "failure_footprint": {
    "original_error": "RuntimeError: synthetic guard trigger; this fixture loads no model and creates no memory pressure",
    "observation": {
      "at_utc": "2026-09-08T01:16:32.191250+00:00",
      "complete": true,
      "root_identity": {
        "pid": 38834,
        "start_abstime": 33196033446084
      },
      "processes": [
        {
          "pid": 38834,
          "start_abstime": 33196033446084,
          "exit_abstime": 0,
          "physical_footprint_bytes": 4948256,
          "resident_size_bytes": 8634368
        }
      ],
      "classification": "Failure-time diagnostic only; not a sampled peak or admission/cleanup proof",
      "sum_process_footprints_bytes": 4948256,
      "sum_process_resident_sizes_bytes": 8634368,
      "sum_scope": "Sum of OS charges to these processes; not unique system memory or free/reclaimable memory.",
      "elapsed_seconds": 0.027135291000000006
    },
    "original_failure_preserved": true
  },
  "owned_groups": [
    38834
  ],
  "remaining_owned_members_after_cleanup": [],
  "elapsed_seconds": 0.08651104199999998,
  "child_exit_code": -15,
  "after_cleanup": {
    "reclaimable_bytes": 8000000000,
    "swapins": 0,
    "swapouts": 0
  }
}

````

## owned-child-example/memory.samples.jsonl

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## owned-child-example/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## owned-child-example/stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## preparation.json

SHA-256 `197d4c4b951d4c7945bc9c175668acd80aff56c8392a07a2d09362ed9f49240a`.

````text
{
  "classification": "Failure-time owned footprint observation and additive guarded-run integration; no inference executed or qualified.",
  "original_guard_sha256": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
  "observer_sha256": "2ff6061c46f588979da498ea67e93b8e6f887a845b6daab2e115da72a367f73e",
  "additive_guard_sha256": "72836a3c6bc03366b6f546c21d1f32636f01373d29a49e2ae2246e5090a0f215",
  "sdk_headers_sha256": {
    "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/resource.h": "7d16930e6b75f11ba203238faa5580d31d48fcd4230f2b3f604aaa5fd7e86b58",
    "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/libproc.h": "246d87709fc6b9157ce5cf3c475656ac48e0e1ae8bbdc46cf45acd34294448cd"
  },
  "darwin_abi": "proc_pid_rusage RUSAGE_INFO_V0,96-byte record, physical footprint offset72, process-start incarnation offset80",
  "bounds": {
    "maximum_observation_seconds": 0.5,
    "maximum_ps_timeout_seconds": 0.25,
    "maximum_owned_processes": 64
  },
  "scope": [
    "Previously bound owned root incarnation and only its currently observed descendants",
    "Before/after parent and incarnation checks; missing, exited, reused or inaccessible processes mean incomplete, never zero memory",
    "One bind after spawn and failure-time observation only; no new sampling on the steady measured path",
    "Original guard policies, primary exception and cleanup remain unchanged; no signaling or permission escalation by the observer",
    "Current footprint and resident size remain separate; sum of process charges is not unique system memory or a peak"
  ],
  "validation": {
    "command": [
      "python3",
      "-m",
      "unittest",
      "-v",
      "pressure_footprint_test"
    ],
    "exit_code": 0,
    "passed": true,
    "methods": 13,
    "recorded_validation_seconds": 0.35317895899999996,
    "model_launched": false,
    "native_compiler_launched": false,
    "synthetic_memory_trigger": true,
    "owned_child_drained": true,
    "observed_counters": [
      {
        "pid": 38834,
        "start_abstime": 33196033446084,
        "exit_abstime": 0,
        "physical_footprint_bytes": 4948256,
        "resident_size_bytes": 8634368
      }
    ],
    "source_sha256": {
      "additive-source-proof.json": "ac6a7ff40635d0e7d1aa40ce8a8bb2c8b865d1d438607281cbe6e1b00eaa36ef",
      "tests.stdout.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
      "pressure_footprint.py": "2ff6061c46f588979da498ea67e93b8e6f887a845b6daab2e115da72a367f73e",
      "guard_with_footprint.py": "72836a3c6bc03366b6f546c21d1f32636f01373d29a49e2ae2246e5090a0f215",
      "pressure_footprint_test.py": "c6b93c00a5bb7265458af3a9f12f235f339fc695e1ebf42f067419f3561449b9",
      "tests.stderr.txt": "4878d96283f5c56c61764aba8e108d0a2249e43af288d2ca14621be8db2169e9"
    }
  },
  "model_launched": false,
  "current_frozen_executors_modified": false,
  "required_before_heavy_use": "Bind this separate guard and observer explicitly in a future protocol after a real resource change and new Mac interval. Existing interrupted attempts remain interrupted."
}

````

## pressure_footprint.py

SHA-256 `2ff6061c46f588979da498ea67e93b8e6f887a845b6daab2e115da72a367f73e`.

````text
"""Read owned-process footprint at a guard failure, without launching a model.

This diagnostic never admits, resumes, signals, or qualifies a workload. Keep
the original resource exception and cleanup path regardless of its outcome.
The version-zero ABI is copied from the installed Darwin SDK resource.h.
"""
import ctypes
import datetime
import json
import os
from pathlib import Path
import subprocess
import time


class UsageV0(ctypes.Structure):
    _fields_ = [('ri_uuid', ctypes.c_uint8 * 16)] + [
        (name, ctypes.c_uint64) for name in (
            'ri_user_time', 'ri_system_time', 'ri_pkg_idle_wkups',
            'ri_interrupt_wkups', 'ri_pageins', 'ri_wired_size',
            'ri_resident_size', 'ri_phys_footprint', 'ri_proc_start_abstime',
            'ri_proc_exit_abstime')]


def require(ok, message):
    if not ok:
        raise ValueError(message)


def usage(pid, *, function=None):
    require(type(pid) is int and 0 < pid < (1 << 31), 'invalid process ID')
    if function is None:
        library = ctypes.CDLL('/usr/lib/libproc.dylib', use_errno=True)
        function = library.proc_pid_rusage
        function.argtypes = [ctypes.c_int, ctypes.c_int, ctypes.c_void_p]
        function.restype = ctypes.c_int
    info = UsageV0()
    ctypes.set_errno(0)
    result = function(pid, 0, ctypes.byref(info))
    if result != 0:
        code = ctypes.get_errno()
        raise OSError(code, os.strerror(code), str(pid))
    require(info.ri_proc_start_abstime > 0, 'missing process incarnation')
    return {'pid': pid, 'start_abstime': info.ri_proc_start_abstime,
            'exit_abstime': info.ri_proc_exit_abstime,
            'physical_footprint_bytes': info.ri_phys_footprint,
            'resident_size_bytes': info.ri_resident_size}


def process_parents(*, run=subprocess.run, timeout=.25):
    require(type(timeout) in (int, float) and 0 < timeout <= .25,
            'parent observation timeout is outside its bound')
    result = run(['ps', '-axo', 'pid=,ppid='], capture_output=True, text=True,
                 timeout=timeout, check=True)
    pairs = [tuple(map(int, line.split())) for line in result.stdout.splitlines() if line.strip()]
    require(all(len(pair) == 2 and pair[0] > 0 and pair[1] >= 0 for pair in pairs),
            'invalid process-parent table')
    require(len({pid for pid, _ in pairs}) == len(pairs), 'duplicate process ID')
    return dict(pairs)


def descendants(parents, root_pid):
    require(root_pid in parents, 'owned root is absent')
    require(parents[root_pid] != root_pid, 'self-parent process')
    owned = {root_pid}
    while True:
        extra = {pid for pid, parent in parents.items() if parent in owned}
        if extra <= owned:
            return sorted(owned)
        owned |= extra


def observe(root_identity, *, read=usage, parents=process_parents,
            clock=time.monotonic, maximum_seconds=.5):
    """Follow only a still-live root with the exact previously bound incarnation.

    A pid alone is not ownership. Exited, unreadable, reused and racing process
    identities yield incomplete observations, never zero-memory evidence.
    """
    require(isinstance(root_identity, dict) and type(root_identity.get('pid')) is int
            and root_identity['pid'] > 0 and type(root_identity.get('start_abstime')) is int
            and root_identity['start_abstime'] > 0, 'bind the actual owned process incarnation first')
    require(type(maximum_seconds) in (int, float) and 0 < maximum_seconds <= .5,
            'failure observation must remain bounded')
    root = root_identity['pid']
    began = clock()
    result = {'at_utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
              'complete': False, 'root_identity': root_identity.copy(), 'processes': [],
              'classification': 'Failure-time diagnostic only; not a sampled peak or admission/cleanup proof'}
    def bounded():
        if clock() - began > maximum_seconds:
            raise TimeoutError('owned-footprint failure observation expired')
    def remaining():
        bounded()
        return min(.25, maximum_seconds - (clock() - began))
    def same_root():
        current = read(root)
        require(current['start_abstime'] == root_identity['start_abstime']
                and current['exit_abstime'] == 0, 'owned root exited or process ID was reused')
        return current
    try:
        bounded()
        same_root()
        table = parents(timeout=remaining())
        targets = descendants(table, root)
        require(len(targets) <= 64, 'owned process tree exceeds diagnostic collection bound')
        bounded()
        first = {}
        for pid in targets:
            bounded()
            first[pid] = read(pid)
        bounded()
        # A second tree/identity observation catches disappearing descendants
        # or PID reuse during collection; no process name or foreign row rides.
        after = parents(timeout=remaining())
        require(descendants(after, root) == targets, 'owned process tree changed during observation')
        for pid in targets:
            bounded()
            current = read(pid)
            require(current['start_abstime'] == first[pid]['start_abstime']
                    and current['exit_abstime'] == first[pid]['exit_abstime'] == 0,
                    'owned descendant exited or process ID was reused')
            require(all(type(current.get(key)) is int and current[key] >= 0
                        for key in ('physical_footprint_bytes', 'resident_size_bytes')),
                    'invalid footprint counters')
            result['processes'].append(current)
        same_root()
        bounded()
        result['sum_process_footprints_bytes'] = sum(p['physical_footprint_bytes'] for p in result['processes'])
        result['sum_process_resident_sizes_bytes'] = sum(p['resident_size_bytes'] for p in result['processes'])
        result['sum_scope'] = 'Sum of OS charges to these processes; not unique system memory or free/reclaimable memory.'
        result['complete'] = True
    except Exception as error:
        result['error'] = f'{type(error).__name__}: {error}'
        result['errno'] = error.errno if isinstance(error, OSError) else None
    result['elapsed_seconds'] = clock() - began
    return result


class FailureObservation:
    """Attach to a future owned executor without modifying frozen guard code.

    Bind immediately after that executor spawns its own root. Call capture only
    from the guard's exception path; the caller must re-raise the same exception.
    Existing frozen executors are not changed or automatically hooked here.
    """
    def __init__(self, pid, *, read=usage):
        value = read(pid)
        require(value['exit_abstime'] == 0, 'cannot bind an exited process')
        self.identity = {'pid': pid, 'start_abstime': value['start_abstime']}

    def capture(self, destination, original_error, *, observe_owned=observe):
        result = {'original_error': f'{type(original_error).__name__}: {original_error}',
                  'observation': None, 'original_failure_preserved': True}
        try:
            result['observation'] = observe_owned(self.identity)
        except Exception as error:
            result['observation_error'] = f'{type(error).__name__}: {error}'
        try:
            with Path(destination).open('x') as output:
                json.dump(result, output, indent=2, allow_nan=False)
                output.write('\n')
        except Exception as error:
            result['write_error'] = f'{type(error).__name__}: {error}'
        return result

````

## pressure_footprint_test.py

SHA-256 `c6b93c00a5bb7265458af3a9f12f235f339fc695e1ebf42f067419f3561449b9`.

````text
import copy
import ctypes
import errno
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import tempfile
import unittest
from unittest import mock

import pressure_footprint as probe
import guard_with_footprint as guard

HERE = Path(__file__).resolve().parent


def values(pid):
    return {'pid': pid, 'start_abstime': pid * 10, 'exit_abstime': 0,
            'physical_footprint_bytes': pid * 40, 'resident_size_bytes': pid * 7}


class FootprintTests(unittest.TestCase):
    def test_abi_matches_installed_sdk(self):
        header = Path('/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/resource.h').read_text()
        fields = re.search(r'struct rusage_info_v0 \{(.*?)\n\};', header, re.S).group(1)
        names = re.findall(r'\b(ri_\w+)(?:\[16\])?;', fields)
        self.assertEqual(names, [name for name, _ in probe.UsageV0._fields_])
        self.assertEqual(ctypes.sizeof(probe.UsageV0), 96)
        self.assertEqual(probe.UsageV0.ri_phys_footprint.offset, 72)
        self.assertEqual(probe.UsageV0.ri_proc_start_abstime.offset, 80)

    def test_kernel_success_keeps_footprint_and_resident_distinct(self):
        def call(pid, flavor, pointer):
            self.assertEqual((pid, flavor), (7, 0))
            info = ctypes.cast(pointer, ctypes.POINTER(probe.UsageV0)).contents
            info.ri_proc_start_abstime = 19
            info.ri_phys_footprint = 100
            info.ri_resident_size = 50
            return 0
        observed = probe.usage(7, function=call)
        self.assertEqual(observed['physical_footprint_bytes'], 100)
        self.assertEqual(observed['resident_size_bytes'], 50)

    def test_unavailable_is_an_error_not_zero_memory(self):
        def fail(*_):
            ctypes.set_errno(errno.EPERM)
            return -1
        with self.assertRaises(OSError) as caught:
            probe.usage(7, function=fail)
        self.assertEqual(caught.exception.errno, errno.EPERM)
        for pid in (0, -1, True, 1.5, 1 << 31):
            with self.assertRaises(ValueError): probe.usage(pid, function=fail)

    def test_only_current_owned_descendants_are_read(self):
        seen = []
        def read(pid):
            seen.append(pid)
            return values(pid)
        result = probe.observe({'pid': 1, 'start_abstime': 10}, read=read,
                               parents=lambda **_: {1: 0, 2: 1, 3: 2, 99: 0})
        self.assertTrue(result['complete'], result)
        self.assertEqual(set(seen), {1, 2, 3})
        self.assertEqual(result['sum_process_footprints_bytes'], 240)
        self.assertEqual(result['sum_process_resident_sizes_bytes'], 42)

    def test_root_reuse_or_exit_never_attaches_to_another_process(self):
        for change in ({'start_abstime': 11}, {'exit_abstime': 7}):
            parents = mock.Mock()
            result = probe.observe({'pid': 1, 'start_abstime': 10},
                                   read=lambda p: values(p) | change, parents=parents)
            self.assertFalse(result['complete'])
            self.assertNotIn('sum_process_footprints_bytes', result)
            parents.assert_not_called()

    def test_disappearing_or_reused_child_remains_incomplete(self):
        for kind in ('gone', 'reused', 'reparented'):
            counts = {1: 0, 2: 0}
            tables = 0
            def read(pid):
                counts[pid] += 1
                if pid == 2 and counts[pid] == 2:
                    if kind == 'gone': raise ProcessLookupError(errno.ESRCH, 'gone')
                    if kind == 'reused': return values(pid) | {'start_abstime': 21}
                return values(pid)
            def parents(**_):
                nonlocal tables
                tables += 1
                return {1: 0, 2: (0 if kind == 'reparented' and tables == 2 else 1)}
            result = probe.observe({'pid': 1, 'start_abstime': 10}, read=read, parents=parents)
            self.assertFalse(result['complete'], kind)
            self.assertNotIn('sum_process_footprints_bytes', result)

    def test_deadline_and_collection_bounds_are_not_memory_evidence(self):
        clock_value = 0
        def clock():
            nonlocal clock_value
            clock_value += .1
            return clock_value
        result = probe.observe({'pid': 1, 'start_abstime': 10}, read=values,
                               parents=lambda **_: {1: 0}, clock=clock, maximum_seconds=.15)
        self.assertFalse(result['complete'])
        table = {1: 0} | {pid: 1 for pid in range(2, 66)}
        result = probe.observe({'pid': 1, 'start_abstime': 10}, read=values,
                               parents=lambda **_: table)
        self.assertFalse(result['complete'])

    def test_parent_parser_rejects_duplicates_and_preserves_command_bound(self):
        run = mock.Mock(return_value=subprocess.CompletedProcess([], 0, '1 0\n2 1\n'))
        self.assertEqual(probe.process_parents(run=run, timeout=.1), {1: 0, 2: 1})
        self.assertEqual(run.call_args.kwargs['timeout'], .1)
        run.return_value.stdout = '1 0\n1 2\n'
        with self.assertRaisesRegex(ValueError, 'duplicate'):
            probe.process_parents(run=run)

    def test_write_failure_cannot_replace_original_failure_or_existing_evidence(self):
        observer = probe.FailureObservation(1, read=values)
        original = RuntimeError('OS pressure level 2')
        with tempfile.TemporaryDirectory() as folder:
            path = Path(folder) / 'evidence.json'
            path.write_text('preserved')
            result = observer.capture(path, original, observe_owned=lambda _: {'complete': False})
            self.assertEqual(path.read_text(), 'preserved')
            self.assertIn('FileExistsError', result['write_error'])
            self.assertEqual(result['original_error'], 'RuntimeError: OS pressure level 2')

    def test_guard_source_is_original_plus_only_declared_observer(self):
        proof = json.loads((HERE / 'additive-source-proof.json').read_text())
        original = Path('/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py').read_bytes()
        self.assertEqual(hashlib.sha256(original).hexdigest(), proof['original_guard_sha256'])
        modified = (HERE / 'guard_with_footprint.py').read_text()
        self.assertTrue(modified.startswith(proof['header']))
        restored = modified[len(proof['header']):]
        for before, after in reversed(proof['additions']):
            self.assertEqual(restored.count(after), 1)
            restored = restored.replace(after, before, 1)
        self.assertEqual(restored.encode(), original)

    def test_live_owned_child_can_be_observed_and_exits_without_signals(self):
        child = subprocess.Popen(['python3', '-c', 'import sys; print("ready", flush=True); sys.stdin.readline()'],
                                 stdin=subprocess.PIPE, stdout=subprocess.PIPE, text=True)
        try:
            self.assertEqual(child.stdout.readline().strip(), 'ready')
            bound = probe.FailureObservation(child.pid)
            observed = probe.observe(bound.identity)
            self.assertTrue(observed['complete'], observed)
            self.assertEqual([p['pid'] for p in observed['processes']], [child.pid])
            self.assertGreater(observed['sum_process_footprints_bytes'], 0)
            self.assertGreater(observed['sum_process_resident_sizes_bytes'], 0)
        finally:
            child.communicate('\n', timeout=2)
        self.assertEqual(child.returncode, 0)

    def test_guard_preserves_trigger_and_drains_after_failure_capture(self):
        original = RuntimeError('synthetic resource stop; no model loaded')
        calls = 0
        def snapshot():
            nonlocal calls
            calls += 1
            if calls == 2: raise original
            return {'reclaimable_bytes': 8_000_000_000, 'swapins': 0, 'swapouts': 0}
        policy = guard.POLICY | {'startup_reclaimable_bytes': 1_000_000_000,
                               'maximum_owned_rss_bytes': 128_000_000, 'maximum_build_seconds': 5}
        with tempfile.TemporaryDirectory() as folder:
            path = Path(folder) / 'memory.json'
            with (Path(folder) / 'stdout').open('w') as out, (Path(folder) / 'stderr').open('w') as err:
                with self.assertRaises(RuntimeError) as caught:
                    guard.guarded_run(['python3', '-c', 'import time; time.sleep(30)'],
                        cwd=folder, stdout=out, stderr=err, record_path=path,
                        snapshot=snapshot, policy=policy, classification='tiny child fixture; no model')
            self.assertIs(caught.exception, original)
            record = json.loads(path.read_text())
            self.assertEqual(record['remaining_owned_members_after_cleanup'], [])
            self.assertIsNotNone(record['child_exit_code'])
            self.assertFalse(record['passed'])
            self.assertIn('synthetic resource stop', record['error'])
            captured = json.loads(path.with_suffix('.failure-footprint.json').read_text())
            self.assertTrue(captured['original_failure_preserved'])
            self.assertTrue(captured['observation']['complete'], captured)

    def test_guard_still_drains_when_observer_itself_raises(self):
        original = RuntimeError('original guard failure')
        calls = 0
        def snapshot():
            nonlocal calls
            calls += 1
            if calls == 2: raise original
            return {'reclaimable_bytes': 8_000_000_000, 'swapins': 0, 'swapouts': 0}
        policy = guard.POLICY | {'startup_reclaimable_bytes': 1_000_000_000,
                               'maximum_owned_rss_bytes': 128_000_000, 'maximum_build_seconds': 5}
        with tempfile.TemporaryDirectory() as folder, mock.patch.object(guard.FailureObservation, 'capture', side_effect=KeyboardInterrupt('observer fixture')):
            path = Path(folder) / 'memory.json'
            with (Path(folder) / 'stdout').open('w') as out, (Path(folder) / 'stderr').open('w') as err:
                with self.assertRaises(RuntimeError) as caught:
                    guard.guarded_run(['python3', '-c', 'import time; time.sleep(30)'],
                        cwd=folder, stdout=out, stderr=err, record_path=path,
                        snapshot=snapshot, policy=policy, classification='tiny child fixture; no model')
            self.assertIs(caught.exception, original)
            record = json.loads(path.read_text())
            self.assertEqual(record['remaining_owned_members_after_cleanup'], [])
            self.assertIn('KeyboardInterrupt', record['footprint_capture_error'])


if __name__ == '__main__':
    unittest.main()

````

## tests.stderr.txt

SHA-256 `4878d96283f5c56c61764aba8e108d0a2249e43af288d2ca14621be8db2169e9`.

````text
test_abi_matches_installed_sdk (pressure_footprint_test.FootprintTests) ... ok
test_deadline_and_collection_bounds_are_not_memory_evidence (pressure_footprint_test.FootprintTests) ... ok
test_disappearing_or_reused_child_remains_incomplete (pressure_footprint_test.FootprintTests) ... ok
test_guard_preserves_trigger_and_drains_after_failure_capture (pressure_footprint_test.FootprintTests) ... ok
test_guard_source_is_original_plus_only_declared_observer (pressure_footprint_test.FootprintTests) ... ok
test_guard_still_drains_when_observer_itself_raises (pressure_footprint_test.FootprintTests) ... ok
test_kernel_success_keeps_footprint_and_resident_distinct (pressure_footprint_test.FootprintTests) ... ok
test_live_owned_child_can_be_observed_and_exits_without_signals (pressure_footprint_test.FootprintTests) ... ok
test_only_current_owned_descendants_are_read (pressure_footprint_test.FootprintTests) ... ok
test_parent_parser_rejects_duplicates_and_preserves_command_bound (pressure_footprint_test.FootprintTests) ... ok
test_root_reuse_or_exit_never_attaches_to_another_process (pressure_footprint_test.FootprintTests) ... ok
test_unavailable_is_an_error_not_zero_memory (pressure_footprint_test.FootprintTests) ... ok
test_write_failure_cannot_replace_original_failure_or_existing_evidence (pressure_footprint_test.FootprintTests) ... ok

----------------------------------------------------------------------
Ran 13 tests in 0.191s

OK

````

## tests.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## validation.json

SHA-256 `eac0737ed31e0063d43df1b657c37ab068244c9d5486e133a83fc5cee353f135`.

````text
{
  "command": [
    "python3",
    "-m",
    "unittest",
    "-v",
    "pressure_footprint_test"
  ],
  "exit_code": 0,
  "passed": true,
  "methods": 13,
  "recorded_validation_seconds": 0.35317895899999996,
  "model_launched": false,
  "native_compiler_launched": false,
  "synthetic_memory_trigger": true,
  "owned_child_drained": true,
  "observed_counters": [
    {
      "pid": 38834,
      "start_abstime": 33196033446084,
      "exit_abstime": 0,
      "physical_footprint_bytes": 4948256,
      "resident_size_bytes": 8634368
    }
  ],
  "source_sha256": {
    "additive-source-proof.json": "ac6a7ff40635d0e7d1aa40ce8a8bb2c8b865d1d438607281cbe6e1b00eaa36ef",
    "tests.stdout.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
    "pressure_footprint.py": "2ff6061c46f588979da498ea67e93b8e6f887a845b6daab2e115da72a367f73e",
    "guard_with_footprint.py": "72836a3c6bc03366b6f546c21d1f32636f01373d29a49e2ae2246e5090a0f215",
    "pressure_footprint_test.py": "c6b93c00a5bb7265458af3a9f12f235f339fc695e1ebf42f067419f3561449b9",
    "tests.stderr.txt": "4878d96283f5c56c61764aba8e108d0a2249e43af288d2ca14621be8db2169e9"
  }
}

````

