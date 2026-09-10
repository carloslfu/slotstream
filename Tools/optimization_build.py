#!/usr/bin/env python3
"""Build/freeze an optimization candidate while holding the model-process lock.

This task-specific driver refuses before invoking make on contention or low
headroom. It holds the lock through compilation and snapshot publication, so
a model cannot start in the interval after preflight. Ordinary make is unchanged.
"""
import argparse
import fcntl
import json
import os
from pathlib import Path
import shutil
import subprocess
import time

from prefill_bench import ROOT, digest, vm_snapshot, InsufficientHeadroom
from serve_bench import verified_build


def build(root, output, *, required_gb=13, snapshot=vm_snapshot, run=subprocess.run,
          lock_path=None, wait_seconds=0, jobs=None):
    root, output = Path(root).resolve(), Path(output).resolve()
    if type(required_gb) not in (int, float) or not 7 <= required_gb <= 20:
        raise ValueError('build headroom must be between 7 and 20 GB')
    if type(wait_seconds) is not int or not 0 <= wait_seconds <= 1800:
        raise ValueError('build reservation wait must be an integer from zero to1800seconds')
    if jobs is not None and (type(jobs) is not int or not 1 <= jobs <= 8):
        raise ValueError('explicit build jobs must be an integer from one to eight')
    output.mkdir(parents=True, exist_ok=False)
    record = {'classification': 'build only; no runtime performance evidence',
              'required_reclaimable_gb': required_gb, 'model_lock_held_during_build': False,
              'passed': False, 'command': ['make', 'build'], 'working_directory': str(root),
              'reservation_wait_limit_seconds': wait_seconds, 'build_jobs': jobs}
    if jobs is not None: record['command'].append(f'SLOTSTREAM_BUILD_JOBS={jobs}')
    started = time.monotonic()
    try:
        with open(lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock', 'a') as lock:
            waiting = time.monotonic(); attempts = 0; notified = -30.0
            while True:
                attempts += 1
                try:
                    fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
                    break
                except BlockingIOError as e:
                    elapsed = time.monotonic()-waiting
                    if elapsed >= wait_seconds:
                        raise RuntimeError('another model/build holds the model-process lock; make was not invoked') from e
                    if elapsed-notified >= 30:
                        print(json.dumps({'phase':'waiting for build reservation','seconds':round(elapsed,1)}),flush=True)
                        notified = elapsed
                    time.sleep(min(2,wait_seconds-elapsed))
            record['reservation_wait'] = {'seconds':time.monotonic()-waiting,'attempts':attempts}
            record['model_lock_held_during_build'] = True
            record['before'] = snapshot()
            if record['before']['reclaimable_bytes'] < required_gb * 1e9:
                raise InsufficientHeadroom('insufficient reclaimable memory; make was not invoked')
            with (output/'build.txt').open('wb') as log:
                result = run(record['command'], cwd=root, stdout=log, stderr=subprocess.STDOUT)
            record['exit_code'] = result.returncode
            if result.returncode != 0: raise RuntimeError(f'make failed with exit code {result.returncode}; no candidate frozen')
            release = root/'.build/release'
            verified_build(release/'slotstream')
            candidate = output/'candidate'
            candidate.mkdir()
            for name in ['slotstream','slotstream-checks','mlx.metallib','build-identity.json','build-source.tar.gz']:
                shutil.copy2(release/name, candidate/name)
            record['frozen'] = verified_build(candidate/'slotstream')
            record['checks_sha256'] = digest(candidate/'slotstream-checks')
            record['passed'] = True
    except Exception as error:
        record['error'] = f'{type(error).__name__}: {error}'
    finally:
        record['elapsed_seconds'] = time.monotonic()-started
        record['after'] = snapshot()
        (output/'manifest.json').write_text(json.dumps(record, indent=2)+'\n')
    return record


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--wait-for-model-seconds', type=int, default=0)
    parser.add_argument('--jobs', type=int, help='Bound Swift build concurrency (1..8); otherwise use SwiftPM defaults')
    args = parser.parse_args()
    record = build(ROOT, args.out, wait_seconds=args.wait_for_model_seconds, jobs=args.jobs)
    print(json.dumps({k:record[k] for k in ['passed','error','elapsed_seconds','checks_sha256'] if k in record}), flush=True)
    return 0 if record['passed'] else 1


if __name__ == '__main__': raise SystemExit(main())
