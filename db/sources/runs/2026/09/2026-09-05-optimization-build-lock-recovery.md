---
type: run
id: 01m1ssyb045tjaj4nrahf21v0t
created: 2026-09-05T22:10:06.467741+00:00
updated: 2026-09-05T22:10:06.623586+00:00
summary: Optimization build lock failure and corrected refusal
binary: none; no candidate built or qualified
captured_at: 2026-09-05
command: terminated V90 build; V91 locked preflight; four driver tests
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Optimization build lock failure and corrected refusal
tool: optimization_build.py and pure lock tests
---
# Optimization build/model exclusion recovery

The V90 shell command ran make after a Python preflight failed with model-lock contention because the shell wrapper did not stop on that failure. The agent identified its own make process group23513 and sent TERM to that group, obtaining exit143. Other task's model server22520 on18134 was not stopped or altered. V90 produced no frozen candidate and is not correctness/performance evidence. This is an orchestration defect and its correction, not a model/kernel failure.

The new task-specific optimization_build.py acquires the same nonblocking model-process flock before checking memory or invoking make, and holds it through compilation, source/binary verification and snapshot creation. A failed preflight raises before make. Four tests cover actual lock contention, the exact memory boundary, continued lock ownership through the build callback, nonzero build exit, release after failure, and rejection of bad identity before freezing. The real V91 attempt then refused before make because that server still held the lock. No model test ran during this correction.

## Tools/optimization_build.py

SHA-256 `2f7666e69992578810c4aeabff48aade433625034518d923749bd4ff04759f3d`; 3403bytes.

````
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
          lock_path=None):
    root, output = Path(root).resolve(), Path(output).resolve()
    if type(required_gb) not in (int, float) or not 7 <= required_gb <= 20:
        raise ValueError('build headroom must be between 7 and 20 GB')
    output.mkdir(parents=True, exist_ok=False)
    record = {'classification': 'build only; no runtime performance evidence',
              'required_reclaimable_gb': required_gb, 'model_lock_held_during_build': False,
              'passed': False, 'command': ['make', 'build'], 'working_directory': str(root)}
    started = time.monotonic()
    try:
        with open(lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock', 'a') as lock:
            try: fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
            except BlockingIOError as e: raise RuntimeError('another model/build holds the model-process lock; make was not invoked') from e
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
    args = parser.parse_args()
    record = build(ROOT, args.out)
    print(json.dumps({k:record[k] for k in ['passed','error','elapsed_seconds','checks_sha256'] if k in record}), flush=True)
    return 0 if record['passed'] else 1


if __name__ == '__main__': raise SystemExit(main())

````

## Tools/optimization_build_test.py

SHA-256 `d8c5816507d3306bb0e9ed55e79157c4184d09bbccca669b110d85dd0bbb550f`; 2582bytes.

````
import fcntl
import json
from pathlib import Path
from tempfile import TemporaryDirectory
from types import SimpleNamespace
import unittest
from unittest.mock import Mock, patch

from optimization_build import build


class BuildTests(unittest.TestCase):
    def test_locked_model_prevents_make(self):
        with TemporaryDirectory() as d:
            path = Path(d)/'lock'
            with path.open('w') as lock:
                fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
                run = Mock()
                result = build(d, Path(d)/'out', snapshot=lambda: {'reclaimable_bytes': 20_000_000_000}, run=run, lock_path=path)
                self.assertFalse(result['passed']); run.assert_not_called()
                self.assertIn('make was not invoked', result['error'])

    def test_headroom_refuses_before_make(self):
        with TemporaryDirectory() as d:
            run = Mock()
            result = build(d, Path(d)/'out', snapshot=lambda: {'reclaimable_bytes': 12_999_999_999}, run=run, lock_path=Path(d)/'lock')
            self.assertFalse(result['passed']); run.assert_not_called()
            self.assertTrue(result['model_lock_held_during_build'])

    def test_lock_stays_held_through_make_and_failure_never_freezes(self):
        with TemporaryDirectory() as d:
            path = Path(d)/'lock'
            def run(*args, **kwargs):
                with path.open('a') as second:
                    with self.assertRaises(BlockingIOError): fcntl.flock(second, fcntl.LOCK_EX | fcntl.LOCK_NB)
                return SimpleNamespace(returncode=2)
            result = build(d, Path(d)/'out', snapshot=lambda: {'reclaimable_bytes': 13_000_000_000}, run=run, lock_path=path)
            self.assertFalse(result['passed']); self.assertEqual(result['exit_code'], 2)
            self.assertFalse((Path(d)/'out/candidate').exists())
            with path.open('a') as released: fcntl.flock(released, fcntl.LOCK_EX | fcntl.LOCK_NB)
            self.assertEqual(json.loads((Path(d)/'out/manifest.json').read_text()), result)

    def test_invalid_identity_never_freezes(self):
        with TemporaryDirectory() as d, patch('optimization_build.verified_build', side_effect=ValueError('identity mismatch')):
            result = build(d, Path(d)/'out', snapshot=lambda: {'reclaimable_bytes': 13_000_000_000},
                           run=lambda *a, **kw: SimpleNamespace(returncode=0), lock_path=Path(d)/'lock')
            self.assertFalse(result['passed']); self.assertFalse((Path(d)/'out/candidate').exists())


if __name__ == '__main__': unittest.main()

````

## .build/optimization/build-guard-tests.txt

SHA-256 `af55efa5c3ceb122f8184c380aa405d3f3b4e7e0c1e892773d0eff31d0645c8a`; 102bytes.

````
....
----------------------------------------------------------------------
Ran 4 tests in 0.004s

OK

````

## .build/optimization/build-v90.txt

SHA-256 `6d1ef20554aeb1ab06c8bd1104c3ba56662d706ab4c5f4729fabc108c8ffc35e`; 392bytes.

````
python3 Tools/build_identity.py before .build/release
swift build -c release
[0/2] Write swift-version--1AB21518FC5DEDBE.txt
[0/1] Planning build
[1/1] Compiling plugin GenerateManual
[2/2] Compiling plugin GenerateDoccReference
[3/3] Compiling plugin CudaBuild
Building for production...
[3/10] Write sources
[5/10] Write swift-version--1AB21518FC5DEDBE.txt
make: *** [build] Terminated: 15

````

## .build/optimization/prefix-vision-build-v91/manifest.json

SHA-256 `2b3fb58823df1c524cce56e45c854bde829d782a1579102baf1dd942ea6245d4`; 2434bytes.

````
{
  "classification": "build only; no runtime performance evidence",
  "required_reclaimable_gb": 13,
  "model_lock_held_during_build": false,
  "passed": false,
  "command": [
    "make",
    "build"
  ],
  "working_directory": "/Users/carlos/Projects/slotstream",
  "error": "RuntimeError: another model/build holds the model-process lock; make was not invoked",
  "elapsed_seconds": 5.2166000000002793e-05,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 22204596224,
    "swapins": 41718162,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    35025.\nPages active:                                1116696.\nPages inactive:                               947360.\nPages speculative:                            171926.\nPages throttled:                                   0.\nPages wired down:                             222249.\nPages purgeable:                                 302.\n\"Translation faults\":                    14110601914.\nPages copy-on-write:                       645562816.\nPages zero filled:                       16692371362.\nPages reactivated:                        2586508537.\nPages purged:                               63836165.\nFile-backed pages:                           1319934.\nAnonymous pages:                              916048.\nPages stored in compressor:                  1650162.\nPages occupied by compressor:                 591421.\nDecompressions:                            986859363.\nCompressions:                             1282540747.\nPageins:                                  6208666268.\nPageouts:                                   10679421.\nSwapins:                                    41718162.\nSwapouts:                                   69922789.\nPages tagged:                                 169437.\nPages tagged resident:                        116759.\nPages tagged compressed:                       52678.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6839.\nPages tag-storage free:                          714.\nPages tag-storage non-tag pageable:            90743.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8605504.\nTagged compressions:                         9734620.\nTagged decompressions:                       8961143.\n"
  }
}

````

