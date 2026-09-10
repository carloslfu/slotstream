---
type: run
id: 01m1x32kd7gjx72mk0ayhggpc7
created: 2026-09-07T04:47:26.630958+00:00
updated: 2026-09-07T04:47:26.979928+00:00
summary: Serial compiler guard failures and preserved primary errors
binary: V237 isolated source; no candidate published
captured_at: 2026-09-07
command: Exact commands, drivers and before/after results embedded in the captured source
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Serial compiler guard failures and preserved primary errors
tool: Guarded serial compiler and cleanup fixtures
---
# Serial compiler guard failures and corrected error preservation

V238 and V240 are distinct failed compiler attempts, not inference benchmarks or replacement data. The new serial profile prospectively requires9.5GB startup,6GB live reclaimable,3GB sampled aggregate owned RSS,one compiler job and1200seconds work/1220whole interval. The ordinary13GB build profile is unchanged. V238 ends after264.722914666seconds with PermissionError during cleanup; its primary trigger and detailed live receipt were lost, so that trigger remains unknown. New fixture counterexamples demonstrate primary-error masking. Corrected error preservation, incremental samples, independent process-group cleanup and whole-publication checks pass11focused fixtures. V240 then preserves its actual trigger:3,133,931,520B sampled owned RSS exceeds the unchanged3GB ceiling after178.160668542seconds. Cleanup EPERM is recorded separately, with no remaining owned process members. No candidate is published. Both partial compiler caches and raw failures are preserved; V240 is not a fresh-build latency measurement. Runtime143, originalV215/P5, model studies and defaults remain unchanged. All timing here is discarded for inference performance.

## /tmp/slotstream-optimization-execution/serial-planner-build-v238/drivers/build_identity.py

SHA-256 `d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86`; 2847 bytes.

````text
#!/usr/bin/env python3
"""Bind a built executable to a reconstructible source archive and package pins."""
import hashlib
import io
import json
from pathlib import Path
import sys
import tarfile

def sha(p):
    h = hashlib.sha256()
    with p.open("rb") as f:
        for data in iter(lambda: f.read(1024*1024), b""): h.update(data)
    return h.hexdigest()

def source_files(root):
    # SwiftPM can compile native targets and copy resources. A Swift-only glob
    # silently omitted CSlotpack's implementation and public header.
    candidates = [*root.joinpath("Sources").rglob("*"), root/"Package.swift",
                  root/"Package.resolved", root/"Makefile",
                  root/"Tools/build_identity.py", root/"Tools/fetch_metallib.sh"]
    if any(p.is_symlink() for p in candidates):
        raise ValueError("build source symlinks require an explicit archived dependency")
    return sorted(p for p in candidates if not p.is_dir())


def bind(root, stage, directory):
    if stage not in ("before", "after"):
        raise ValueError("stage must be before or after")
    root = Path(root).resolve()
    out = root / directory
    out.mkdir(parents=True, exist_ok=True)
    # Any failed post-build check invalidates a previous receipt, including a
    # missing input or an unsupported source dependency discovered below.
    if stage == "after":
        (out/"build-identity.json").unlink(missing_ok=True)
    files = source_files(root)
    source = {str(p.relative_to(root)): sha(p) for p in files}
    if stage == "before":
        (out/"build-source-before.json").write_text(json.dumps(source, sort_keys=True))
        return
    if json.loads((out/"build-source-before.json").read_text()) != source:
        raise ValueError("source changed during build; binary provenance is unverified, rebuild")
    with tarfile.open(out/"build-source.tar.gz", "w:gz") as tar:
        for p in files:
            name = str(p.relative_to(root))
            data = p.read_bytes()
            if hashlib.sha256(data).hexdigest() != source[name]:
                raise ValueError("source changed while archiving; rebuild")
            info = tar.gettarinfo(str(p), arcname=name)
            info.size = len(data)
            tar.addfile(info, io.BytesIO(data))
    if source != {str(p.relative_to(root)): sha(p) for p in source_files(root)}:
        raise ValueError("source changed while archiving; rebuild")
    result = {"source":source,"source_archive_sha256":sha(out/"build-source.tar.gz"),
              "binary_sha256":sha(out/"slotstream"),"metallib_sha256":sha(out/"mlx.metallib")}
    (out/"build-identity.json").write_text(json.dumps(result,indent=2)+"\n")


if __name__ == "__main__":
    try:
        bind(Path(__file__).resolve().parent.parent, *sys.argv[1:])
    except ValueError as error:
        raise SystemExit(str(error))
````

## /tmp/slotstream-optimization-execution/serial-planner-build-v238/drivers/optimization_build.py

SHA-256 `dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f`; 4849 bytes.

````text
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
````

## /tmp/slotstream-optimization-execution/serial-planner-build-v238/drivers/optimization_serial_build.py

SHA-256 `ad3b6858cc15a43e5fec401df5eca341e0b2b0f0b9525763d7afce17077cb07b`; 5757 bytes.

````text
#!/usr/bin/env python3
"""Build one isolated candidate with a serial compiler and live memory guards.

This is a separate build profile, not a relaxed inference/benchmark protocol.
The normal optimization_build default remains 13 GB. No model is launched.
"""
import argparse
import json
import os
from pathlib import Path
import signal
import subprocess
import time

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


def guarded_run(command, *, cwd, stdout, stderr, record_path,
                snapshot=vm_snapshot, policy=POLICY):
    before = snapshot()
    if before['reclaimable_bytes'] < policy['startup_reclaimable_bytes']:
        raise RuntimeError('serial-build startup headroom is unavailable; child not launched')
    record = {'command': command, 'policy': policy, 'before': before, 'samples': [],
              'passed': False, 'classification': 'serial build only; not model qualification'}
    started = time.monotonic()
    child = None
    try:
        child = subprocess.Popen(command, cwd=cwd, stdout=stdout, stderr=stderr,
                                 start_new_session=True)
        record['child_pid'] = child.pid
        while child.poll() is None:
            elapsed = time.monotonic() - started
            if elapsed > policy['maximum_build_seconds']:
                raise TimeoutError('serial build reached its prospective time limit')
            process_table = subprocess.check_output(
                ['ps', '-axo', 'pid=,ppid=,rss='], text=True, timeout=2)
            processes = owned_processes(process_table, child.pid)
            current = snapshot()
            rss_bytes = sum(rss for _, rss in processes)
            record['samples'].append({'elapsed_seconds': elapsed,
                'owned_rss_bytes': rss_bytes, 'owned_process_count': len(processes),
                'reclaimable_bytes': current['reclaimable_bytes'],
                'swapins': current.get('swapins'), 'swapouts': current['swapouts']})
            check_sample(current, rss_bytes, before['swapouts'], policy)
            time.sleep(policy['sample_interval_seconds'])
        record['exit_code'] = child.returncode
        record['after'] = snapshot()
        check_sample(record['after'], 0, before['swapouts'], policy)
        record['passed'] = child.returncode == 0
        return subprocess.CompletedProcess(command, child.returncode)
    except BaseException as error:
        record['error'] = f'{type(error).__name__}: {error}'
        raise
    finally:
        if child is not None and child.poll() is None:
            terminate_child_tree(child)
        record['elapsed_seconds'] = time.monotonic() - started
        if child is not None:
            record['child_exit_code'] = child.returncode
        record['after_cleanup'] = snapshot()
        Path(record_path).write_text(json.dumps(record, indent=2) + '\n')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    def interrupted(number, _frame):
        raise KeyboardInterrupt(f'serial build interrupted by signal {number}')
    signal.signal(signal.SIGINT, interrupted)
    signal.signal(signal.SIGTERM, interrupted)
    result = build(args.source, args.out,
        required_gb=POLICY['startup_reclaimable_bytes'] / 1e9,
        jobs=POLICY['compiler_jobs'],
        run=lambda command, **kwargs: guarded_run(command, **kwargs,
            record_path=args.out / 'live-memory.json'))
    result['serial_driver_sha256'] = digest(Path(__file__))
    result['serial_policy'] = POLICY
    (args.out / 'manifest.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({key: result[key] for key in
        ['passed', 'error', 'elapsed_seconds', 'serial_driver_sha256'] if key in result}), flush=True)
    return 0 if result['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
````

## /tmp/slotstream-optimization-execution/serial-planner-build-v238/drivers/optimization_serial_build_test.py

SHA-256 `f086ba93fe35b32ddcdc062ff67dcdec62238fa3811f487370e47900fd1f46d9`; 3882 bytes.

````text
"""Pure limits plus cleanup of a tiny fixture process; no compiler or model."""
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

from optimization_serial_build import POLICY, check_sample, guarded_run, owned_processes


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


if __name__ == '__main__':
    unittest.main()
````

## /tmp/slotstream-optimization-execution/serial-planner-build-v238/drivers/prefill_bench.py

SHA-256 `3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036`; 19176 bytes.

````text
#!/usr/bin/env python3
"""Paired inference experiments with raw results and exact token identities.

Repeat --arm NAME=EXECUTABLE for AB/BA order. A fresh process means empty
expert/prefix caches, not cold SSD: OS file cache is explicitly uncontrolled.
Failed, incomplete, and swapping runs are preserved and excluded.
"""
import argparse
import fcntl
import hashlib
import json
import math
import os
from pathlib import Path
import re
import signal
import statistics
import struct
import subprocess
import tarfile
import time

ROOT = Path(__file__).resolve().parent.parent
FIXTURES = ROOT / "Tools/fixtures/optimization"


def digest(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for part in iter(lambda: f.read(1024 * 1024), b""): h.update(part)
    return h.hexdigest()


def vm_snapshot(raw=None):
    raw = raw if raw is not None else subprocess.check_output(["vm_stat"], text=True)
    size = re.search(r"page size of (\d+) bytes", raw)
    if not size: raise ValueError("vm_stat page size missing")
    pages = {k.strip('"'): int(v) for k, v in re.findall(r'^([^:\n]+):\s+(\d+)\.', raw, re.M)}
    required = ("Pages free", "Pages purgeable", "File-backed pages", "Swapins", "Swapouts")
    if any(k not in pages for k in required): raise ValueError("vm_stat counters missing")
    return {"page_bytes": int(size[1]), "reclaimable_bytes": sum(pages[k] for k in required[:3]) * int(size[1]),
            "swapins": pages["Swapins"], "swapouts": pages["Swapouts"], "raw": raw}


class InsufficientHeadroom(RuntimeError):
    pass


def preflight(needed_gb):
    # Release before child launch; child reacquires atomically before allocation.
    with open(f"/tmp/slotstream-model-{os.getuid()}.lock", "a") as lock:
        try: fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as e: raise RuntimeError("another model process holds the lock") from e
    state = vm_snapshot()
    if state["reclaimable_bytes"] < needed_gb * 1e9:
        raise InsufficientHeadroom(f"{state['reclaimable_bytes']/1e9:.2f} GB reclaimable; need {needed_gb:.2f} GB")
    return state


def host_conditions():
    """Read-only observations outside timed intervals; unavailable is explicit.

    pmset's warning history is not an instantaneous thermal sensor. Preserve
    that distinction and do not infer energy or thermal headroom from it.
    """
    result = {"load_average_1_5_15_minutes": list(os.getloadavg()),
              "observed_at_unix_seconds": time.time(),
              "thermal_limit": "pmset warning/status history, not continuous temperature",
              "energy_joules": None}
    for key, command in [("power_source", ["pmset", "-g", "batt"]),
                         ("power_configuration", ["pmset", "-g", "custom"]),
                         ("thermal_status", ["pmset", "-g", "therm"])]:
        try:
            output = subprocess.run(command, capture_output=True, text=True, timeout=5)
            result[key] = {"exit_code": output.returncode, "stdout": output.stdout, "stderr": output.stderr}
        except (OSError, subprocess.TimeoutExpired) as e:
            result[key] = {"unavailable": f"{type(e).__name__}: {e}"}
    return result


def validate_metrics(d, *, allow_complete_prompt=False):
    if type(allow_complete_prompt) is not bool: raise ValueError("complete prompt permission must be Boolean")
    if d.get("schema_version") != 1: raise ValueError("unsupported schema")
    s = d["stats"]
    for k in ("prefillSeconds", "decodeSeconds", "requestSeconds", "imageEncodeSeconds"):
        if type(s.get(k)) not in (int, float) or not math.isfinite(s[k]) or s[k] < 0:
            raise ValueError(f"invalid {k}")
    for k in ("prefillRecords", "decodeRecords", "prefillTokens", "decodeTokens", "lifetimeRSSPeakBytes"):
        if type(s.get(k)) is not int or s[k] < 0: raise ValueError(f"invalid {k}")
    if s["prefillTokens"] == 0:
        if not allow_complete_prompt: raise ValueError("no completed prefill")
        if (type(s.get('promptTokens')) is not int or s['promptTokens'] <= 0
            or type(s.get('reusedPrefixTokens')) is not int or s['reusedPrefixTokens'] != s['promptTokens']
            or type(s.get('completePromptHits')) is not int or s['completePromptHits'] != 1
            or s['prefillRecords'] != 0 or s.get('prefillPasses') != []
            or s.get('prefillComputePasses') != []
            or type(s.get('prefillReadBytes')) is not int or s['prefillReadBytes'] != 0):
            raise ValueError("zero-prefill request lacks an exact complete-prompt hit and zero work")
    elif s["prefillSeconds"] <= 0: raise ValueError("no completed prefill")
    if sum(s["prefillPasses"]) != s["prefillTokens"]: raise ValueError("pass/token mismatch")
    if len(d["prompt_ids"]) != s["promptTokens"] or len(d["output_ids"]) != s["decodeTokens"]:
        raise ValueError("token identity/count mismatch")
    return s


def capture_sources(dest):
    files = sorted([*ROOT.glob("Sources/**/*.swift"), ROOT/"Package.swift", ROOT/"Package.resolved", ROOT/"Makefile"])
    with tarfile.open(dest/"source.tar.gz", "w:gz") as archive:
        for p in files: archive.add(p, arcname=str(p.relative_to(ROOT)))
    return {str(p.relative_to(ROOT)): digest(p) for p in files}


def model_identity(model):
    # This identifies headers/stat metadata, NOT full payload verification.
    result = {}
    for p in sorted(model.iterdir()):
        if p.suffix not in (".json", ".jinja", ".safetensors"): continue
        info = {"bytes": p.stat().st_size, "mtime_ns": p.stat().st_mtime_ns}
        if p.suffix == ".safetensors":
            with p.open("rb") as f:
                n = struct.unpack("<Q", f.read(8))[0]
                if n > 64*1024*1024 or n+8 > info["bytes"]: raise ValueError(f"invalid header: {p.name}")
                info["header_sha256"] = hashlib.sha256(f.read(n)).hexdigest()
        else: info["sha256"] = digest(p)
        result[p.name] = info
    if "config.json" not in result: raise ValueError("model config missing")
    return result


def terminate_child_tree(child):
    """Drain a timed-out child and the independently grouped descendants we
    can prove it owns. Never signal the caller's inherited process group."""
    groups = {child.pid}  # run_child starts a new session before exec.
    snapshot_error = None
    try:
        # Capture parent links before terminating the root. SwiftPM may put
        # Git/compiler descendants in independent sessions/process groups.
        rows = [tuple(map(int, line.split())) for line in subprocess.check_output(
            ['ps', '-axo', 'pid=,ppid=,pgid='], text=True, timeout=5).splitlines() if line.strip()]
        owned = {child.pid}
        while True:
            expanded = owned | {pid for pid, parent, _ in rows if parent in owned}
            if expanded == owned: break
            owned = expanded
        groups.update(group for pid, _, group in rows if pid in owned and group in owned)
    except (OSError, subprocess.SubprocessError, ValueError) as error:
        snapshot_error = error
    finally:
        def signal_owned(sig):
            for group in groups:
                try: os.killpg(group, sig)
                except ProcessLookupError: pass
        signal_owned(signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired: pass
        finally:
            # The root can exit while an independently grouped descendant
            # ignores TERM. Enumeration failure must not skip root cleanup.
            signal_owned(signal.SIGKILL)
            child.wait(timeout=5)
    if snapshot_error is not None:
        raise RuntimeError('child root drained, but descendant enumeration failed; full cleanup is unverified') from snapshot_error


def run_child(command, env, cell, timeout):
    with (cell/"stdout.txt").open("wb") as out, (cell/"stderr.txt").open("wb") as err:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=out, stderr=err, start_new_session=True)
        try: return child.wait(timeout=timeout)
        finally:
            if child.poll() is None: terminate_child_tree(child)


def paired_summary(rows, reference):
    groups = {}
    for row in rows:
        groups.setdefault((row["prompt"], row["chunk"], row["round"]), {})[row["arm"]] = row
    by_arm = {}
    for (prompt, chunk, round_number), arms in groups.items():
        for name, candidate in arms.items():
            if name == reference: continue
            result = by_arm.setdefault((prompt, chunk, name), {"pairs": [], "excluded_rounds": []})
            control = arms.get(reference)
            if not control or not control["valid"] or not candidate["valid"]:
                result["excluded_rounds"].append(round_number); continue
            a, b = control["metrics"], candidate["metrics"]
            if a["prompt_ids"] != b["prompt_ids"] or a["effective_pool_slots"] != b["effective_pool_slots"] or a.get("effective_mtp") != b.get("effective_mtp"):
                result["excluded_rounds"].append(round_number); continue
            result["pairs"].append({"round": round_number,
                "request_reduction_fraction": 1 - b["stats"]["requestSeconds"] / a["stats"]["requestSeconds"],
                "request_saved_seconds": a["stats"]["requestSeconds"] - b["stats"]["requestSeconds"],
                "output_ids_equal": a["output_ids"] == b["output_ids"]})
    result = []
    for (prompt, chunk, name), entry in sorted(by_arm.items()):
        pairs = entry["pairs"]
        result.append({"prompt": prompt, "chunk": chunk, "reference": reference, "candidate": name, **entry,
            "median_request_reduction_fraction": statistics.median(p["request_reduction_fraction"] for p in pairs) if pairs else None})
    return result


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--arm", action="append", help="NAME=EXECUTABLE (repeatable)")
    p.add_argument("--arm-env", action="append", default=[], help='NAME={"SLOTSTREAM_...":"value"}')
    p.add_argument("--arm-chunk", action="append", default=[], help="NAME=256..4096, explicit per-arm compute-pass override")
    p.add_argument("--label", default="baseline")
    p.add_argument("--mtp", choices=("off", "on"), default="off")
    p.add_argument("--rounds", type=int, default=3)
    p.add_argument("--chunks", default="256")
    p.add_argument("--prompts", default="short,prose")
    p.add_argument("--memory-gb", type=float, default=8.1)
    p.add_argument("--max-tokens", type=int, default=16)
    p.add_argument("--seed", type=int, default=7)
    p.add_argument("--sampled", action="store_true")
    p.add_argument("--sample-footprint", action="store_true")
    p.add_argument("--observe-arm", action="append", default=[], help="Enable footprint sampling only for this arm")
    p.add_argument("--model", type=Path, default=Path.home()/".slotstream/models/qwen38-flash-next-mlx-4bit")
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--timeout", type=int, default=1800)
    p.add_argument("--prepare-only", action="store_true")
    a = p.parse_args()
    if not (8.1 <= a.memory_gb <= 10 and a.rounds > 0 and a.max_tokens > 0 and a.timeout > 0):
        p.error("use an 8.1–10 GB target and positive rounds/output/timeout")
    chunks = [int(c) for c in a.chunks.split(",")]
    if any(c < 256 or c > 4096 for c in chunks): p.error("chunks must be within 256..4096")
    if len(chunks) != len(set(chunks)): p.error("chunks must be unique")
    arms = {}
    for arm in a.arm or [f"{a.label}=.build/release/slotstream"]:
        name, path = arm.split("=", 1)
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name) or name in arms: p.error("unique safe arm names required")
        arms[name] = Path(path).resolve()
    if any(name not in arms for name in a.observe_arm): p.error("observe-arm must name an arm")
    arm_chunks = {}
    for item in a.arm_chunk:
        name, value = item.split("=", 1)
        if name not in arms or name in arm_chunks or not value.isdecimal() or not 256 <= int(value) <= 4096:
            p.error("arm-chunk requires a unique arm and a 256..4096 integer")
        arm_chunks[name] = int(value)
    envs = {n: {} for n in arms}
    for item in a.arm_env:
        name, value = item.split("=", 1); values = json.loads(value)
        if name not in arms or not isinstance(values, dict) or any(not k.startswith("SLOTSTREAM_") or not isinstance(v, str) for k,v in values.items()):
            p.error("arm-env requires an arm and string SLOTSTREAM_ overrides")
        envs[name].update(values)
    prompts = {}
    for name in a.prompts.split(","):
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name): p.error("invalid fixture name")
        prompts[name] = FIXTURES/f"{name}.txt"
        if not prompts[name].is_file(): p.error(f"missing immutable fixture {name}")
    a.out = a.out.resolve(); a.out.mkdir(parents=True, exist_ok=False)
    # Preserve fixture bytes as well as hashes; a future source edit must not
    # make an old benchmark impossible to reconstruct.
    (a.out / "fixtures").mkdir()
    import shutil
    for name, fixture in list(prompts.items()):
        shutil.copyfile(fixture, a.out / "fixtures" / fixture.name)
        prompts[name] = a.out / "fixtures" / fixture.name
    identities = {}
    for name, binary in arms.items():
        identity_file = binary.parent / "build-identity.json"
        source_file = binary.parent / "build-source.tar.gz"
        identity = json.loads(identity_file.read_text())
        if identity["binary_sha256"] != digest(binary) or identity["metallib_sha256"] != digest(binary.parent / "mlx.metallib"):
            raise ValueError(f"{name}: executable/metallib does not match build identity")
        if identity["source_archive_sha256"] != digest(source_file):
            raise ValueError(f"{name}: source archive does not match build identity")
        shutil.copyfile(source_file, a.out / f"{name}-source.tar.gz")
        identities[name] = identity
    base_env = {k:v for k,v in os.environ.items() if not k.startswith(("SLOTSTREAM_", "SS_DEBUG"))}
    manifest = {"schema_version": 1, "head": subprocess.check_output(["git","rev-parse","HEAD"], cwd=ROOT, text=True).strip(),
                "worktree_source": capture_sources(a.out), "build_identities": identities, "model": model_identity(a.model),
                "arms": {n:{"binary":str(b),"sha256":digest(b),"metallib_sha256":digest(b.parent/"mlx.metallib"),"env":envs[n]} for n,b in arms.items()},
                "fixtures": {n:{"path":str(f),"sha256":digest(f)} for n,f in prompts.items()},
                "conditions": {"filesystem_cache":"uncontrolled; no purge","expert_cache":"empty per process","prefix_cache":"empty per process","mtp":a.mtp == "on"},
                "arguments": {k:str(v) if isinstance(v,Path) else v for k,v in vars(a).items()}}
    (a.out/"manifest.json").write_text(json.dumps(manifest,indent=2)+"\n")
    if a.prepare_only: print(json.dumps({"prepared":str(a.out)})); return
    rows = []
    for ri in range(a.rounds):
        order = list(arms) if ri%2 == 0 else list(reversed(arms))
        for pname,fixture in prompts.items():
            for chunk in chunks:
                for name in order:
                    cell = a.out/f"{ri+1}-{pname}-{chunk}-{name}"; cell.mkdir()
                    row = {"round":ri+1,"prompt":pname,"chunk":chunk,"arm":name,"valid":False}
                    effective_chunk = arm_chunks.get(name, chunk)
                    row["requested_effective_chunk"] = effective_chunk
                    env = base_env | envs[name] | {"SLOTSTREAM_PREFILL_CHUNK":str(effective_chunk)}
                    command = [str(arms[name]),"run","--raw","--prompt-file",str(fixture),"--model",str(a.model),
                               "--memory-gb",str(a.memory_gb),"--mtp",a.mtp,"--seed",str(a.seed),
                               "--max-tokens",str(a.max_tokens),"--stats-json",str(cell/"metrics.json")]
                    if not a.sampled: command.append("--greedy")
                    if a.sample_footprint or name in a.observe_arm: command.append("--sample-footprint")
                    row["command"] = command
                    row["environment"] = {k:v for k,v in env.items() if k.startswith("SLOTSTREAM_")}
                    try:
                        extra = max(0, (effective_chunk - 256) * 1.30e-3)
                        if env.get("SLOTSTREAM_OPT_LAYER_WORKSPACE") == "1": extra += 2.0
                        scope = int(env.get("SLOTSTREAM_OPT_READ_SCOPE", "0"))
                        if scope > 0: extra += max(0, scope - effective_chunk) * 1.30e-3 + 0.12
                        row["override_extra_allowance_gb"] = extra
                        row["host_before"] = host_conditions()
                        row["before"] = preflight(a.memory_gb+extra+3)
                        start = time.monotonic()
                        row["exit_code"] = run_child(command,env,cell,a.timeout)
                        row["wall_seconds"] = time.monotonic()-start; row["after"] = vm_snapshot()
                        row["host_after"] = host_conditions()
                        if row["exit_code"] != 0: raise ValueError(f"child exit {row['exit_code']}")
                        d = json.loads((cell/"metrics.json").read_text()); validate_metrics(d)
                        if d["effective_prefill_chunk"] != effective_chunk or d["effective_mtp"] != (a.mtp == "on"): raise ValueError("effective configuration differs")
                        row["metrics"] = d
                        if any(row["after"][k] != row["before"][k] for k in ("swapins","swapouts")):
                            raise ValueError("swap activity during cell; timing excluded")
                        row["valid"] = True
                    except (OSError,ValueError,KeyError,RuntimeError,subprocess.TimeoutExpired) as e: row["exclusion"] = str(e)
                    (cell/"result.json").write_text(json.dumps(row,indent=2)+"\n")
                    with (a.out/"results.jsonl").open("a") as f: f.write(json.dumps(row)+"\n")
                    rows.append(row)
                    print(json.dumps({k:v for k,v in row.items() if k not in ("metrics","before","after","command","environment","host_before","host_after")}),flush=True)
    groups = {}
    for row in rows:
        if row["valid"]: groups.setdefault((row["prompt"],row["chunk"],row["arm"]),[]).append(row)
    summary = [{"prompt":k[0],"chunk":k[1],"arm":k[2],"valid_rounds":len(rs),
                "median_prefill_seconds":statistics.median(r["metrics"]["stats"]["prefillSeconds"] for r in rs),
                "median_request_seconds":statistics.median(r["metrics"]["stats"]["requestSeconds"] for r in rs),
                "prefill_records":[r["metrics"]["stats"]["prefillRecords"] for r in rs]} for k,rs in sorted(groups.items())]
    (a.out/"summary.json").write_text(json.dumps(summary,indent=2)+"\n")
    (a.out/"paired-summary.json").write_text(json.dumps(paired_summary(rows, next(iter(arms))), indent=2)+"\n")
    if not all(r["valid"] for r in rows): raise SystemExit(1)


if __name__ == "__main__": main()
````

## /tmp/slotstream-optimization-execution/serial-planner-build-v238/drivers/process_cleanup_checks.py

SHA-256 `2de6d823a4850662fda621cbe2df43aa869731e40530e7f286c9a2f289e6a982`; 3751 bytes.

````text
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
````

## /tmp/slotstream-optimization-execution/serial-planner-build-v238/drivers/serve_bench.py

SHA-256 `31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb`; 60039 bytes.

````text
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import argparse
import base64
import fcntl
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import re
import shutil
import signal
import socket
import statistics
import subprocess
import time
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot, InsufficientHeadroom


def contention_guard(protocol):
    value = protocol.get('stop_on_workspace_contention', False)
    if type(value) is not bool: raise ValueError('workspace contention guard must be Boolean')
    return value


def competing_job_kind(executable, arguments):
    name = Path(executable).name
    if name == 'slotstream':
        prefix = executable if arguments.startswith(executable) else arguments.split(' ', 1)[0]
        if re.match(re.escape(prefix) + r'\s+pull(?:\s|$)', arguments): return 'checkpoint pull'
    if name in ['download-harness', 'slotstream-pull-bench']:
        return 'checkpoint download test'
    if name.lower().startswith('python') and re.search(
        r'(?:^|[ /])Tools/slotpack/(?:full_pull|publish_r2|pack|checks|download_checks|memory_checks|cli_checks|raw_checks)\.py(?:\s|$)', arguments):
        return 'checkpoint transport or packaging job'
    if name in ['swift-frontend', 'swiftc', 'swift-build']:
        return 'Swift build'
    return None


def competing_jobs(run=subprocess.run):
    """Read known long storage/build jobs. Never persist argv: it may contain
    private URLs or credentials. A snapshot is not continuous host isolation."""
    result = run(['ps', '-axo', 'pid=,comm='], capture_output=True, text=True, check=True, timeout=5)
    candidates = {}
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid, executable = int(fields[0]), fields[1]
        name = Path(executable).name
        if (pid != os.getpid() and (name.lower().startswith('python') or name in
            ['slotstream', 'download-harness', 'slotstream-pull-bench', 'swift-frontend', 'swiftc', 'swift-build'])):
            candidates[pid] = executable
    if not candidates: return []
    result = run(['ps', '-ww', '-p', ','.join(map(str, candidates)), '-o', 'pid=,args='],
                 capture_output=True, text=True, timeout=5)
    # A process can exit between snapshots. Other failures remain fail closed.
    if result.returncode not in (0, 1): raise RuntimeError('cannot inspect competing process arguments')
    jobs = []
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid = int(fields[0]); executable = candidates.get(pid)
        if executable is None: continue
        kind = competing_job_kind(executable, fields[1])
        if kind is not None: jobs.append({'pid': pid, 'executable': executable, 'kind': kind})
    return jobs


def workspace_quiet_requirement(protocol):
    value = protocol.get('initial_workspace_quiet')
    if value is None: return None
    if (type(value) is not dict or set(value) != {'stable_seconds', 'maximum_wait_seconds'}
        or not contention_guard(protocol)
        or type(value['stable_seconds']) is not int or not 1 <= value['stable_seconds'] <= 600
        or type(value['maximum_wait_seconds']) is not int
        or not value['stable_seconds'] <= value['maximum_wait_seconds'] <= 1800):
        raise ValueError('initial quiet interval requires the contention guard and bounded integer durations')
    return value


def wait_for_quiet_workspace(requirement, *, check=competing_jobs, now=time.monotonic, sleep=time.sleep):
    """A sampled quiet precondition before the study, never a timing cell.
    A newly observed known job resets the interval; time alone grants no pass."""
    started = now(); quiet_since = None; samples = blocked = 0; notified = started - 30
    while True:
        jobs = check(); current = now(); samples += 1
        if jobs:
            quiet_since = None; blocked += 1
        elif quiet_since is None:
            quiet_since = current
        quiet = 0 if quiet_since is None else current - quiet_since
        elapsed = current - started
        if quiet >= requirement['stable_seconds']:
            return {'wait_seconds': elapsed, 'quiet_seconds': quiet, 'samples': samples,
                    'samples_with_competing_work': blocked,
                    'classification': 'sampled known-job quiet interval, not continuous host isolation'}
        if elapsed >= requirement['maximum_wait_seconds']:
            raise TimeoutError('known workspace jobs did not leave the required quiet interval; no model launched')
        if current - notified >= 30:
            print(json.dumps({'phase': 'waiting for initial quiet workspace', 'seconds': round(elapsed, 1),
                              'quiet_seconds': round(quiet, 1), 'known_jobs': len(jobs)}), flush=True)
            notified = current
        sleep(min(2, requirement['maximum_wait_seconds'] - elapsed))


def fixed_pool_budget(protocol):
    """Explicit bounded mechanism study; memory_gb remains the measured ceiling.

    The native raw-pool control retains640slots when vision loads. This does
    not assert that the target-driven planner would choose the same pool.
    """
    if 'fixed_pool_slots' not in protocol:
        return None
    if type(protocol['fixed_pool_slots']) is not int or protocol['fixed_pool_slots'] != 640:
        raise ValueError('this fixed-pool mechanism study supports exactly640slots')
    if protocol.get('comparison_basis') != 'fixed-pool':
        raise ValueError('an explicit pool requires an explicit fixed-pool comparison')
    return 640 * 2_764_800 / 1e9


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if any(k in protocol for k in ['large_pool_measurement', 'large_scope_measurement', 'large_vision_measurement']):
            raise ValueError('large-memory declaration requires a target above 10 GB')
        return memory + 3
    vision_study = protocol.get('large_vision_measurement')
    if vision_study is not None:
        if ('large_pool_measurement' in protocol or 'large_scope_measurement' in protocol
            or not isinstance(vision_study, dict) or not isinstance(vision_study.get('purpose'), str)
            or not vision_study['purpose'].strip()):
            raise ValueError('choose one explicit large-vision measurement purpose')
        if (memory != 12 or fixed_pool_budget(protocol) is None
            or type(protocol.get('max_tokens')) is not int or protocol['max_tokens'] != 1
            or protocol.get('mtp') != 'off' or protocol.get('prefix_cache') is not None
            or not isinstance(protocol.get('images'), list) or len(protocol['images']) != 1):
            raise ValueError('large-vision mechanism study requires12GB,640slots,one image/one output, MTP and prefix reuse off')
        if (protocol.get('abort_on_resource_failure') is not True
            or protocol.get('require_nominal_power_state') is not True
            or type(protocol.get('maximum_sampled_footprint_bytes')) is not int
            or protocol['maximum_sampled_footprint_bytes'] != 12_000_000_000):
            raise ValueError('large-vision study requires exact12GB ceiling, nominal state and immediate resource stop')
        return memory + 6
    scope_study = protocol.get('large_scope_measurement')
    if scope_study is not None and 'large_pool_measurement' in protocol:
        raise ValueError('choose one declared large-memory study')
    study = scope_study if scope_study is not None else protocol.get('large_pool_measurement')
    if not isinstance(study, dict) or not isinstance(study.get('purpose'), str) or not study['purpose'].strip():
        raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
    if protocol.get('abort_on_resource_failure') is not True or protocol.get('require_nominal_power_state') is not True:
        raise ValueError('large-pool measurements require immediate resource stop and nominal operating conditions')
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if type(limit) is not int or limit != round(memory * 1e9):
        raise ValueError('large-pool measurements require an exact footprint limit at the memory target')
    if protocol.get('raw', True) is not True or protocol['max_tokens'] > 64:
        raise ValueError('large-pool component isolation permits raw text and at most 64 output tokens')
    if scope_study is not None:
        if memory != 16 or protocol['max_tokens'] > 4:
            raise ValueError('larger-scope qualification requires exactly16GB and at most4outputs')
        for arm in protocol['arms'].values():
            if (arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE','0') not in ['0','1024']
                or arm['env'].get('SLOTSTREAM_OPT_WORKSPACE_TILE','256') != '256'):
                raise ValueError('larger-scope qualification retains256-row compute and at most1024read scope')
        return memory + 6
    for arm in protocol['arms'].values():
        if arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE', '0') != '0' or arm['env'].get('SLOTSTREAM_OPT_LAYER_WORKSPACE', '0') != '0':
            raise ValueError('large-pool isolation requires ordinary bounded 256-row passes')
    return memory + 6


def workload_exclusions(stats, protocol):
    required = protocol.get('require_all_expert_hits', False)
    if type(required) is not bool: raise ValueError('require_all_expert_hits must be Boolean')
    if not required: return []
    if any(type(stats.get(k)) is not int or stats[k] != 0 for k in ['prefillRecords', 'decodeRecords']):
        return ['declared all-hit workload performed expert reads or lacks exact read counts']
    return []


def prefix_study(protocol):
    study = protocol.get('prefix_cache')
    if study is None: return None
    if (type(study) is not dict or 'expected_reused_tokens' not in study
        or not set(study) <= {'expected_reused_tokens', 'complete_prompt', 'retention_only', 'partial_prefix',
                             'expected_warmup_checkpoint_stores'}
        or type(study.get('complete_prompt', False)) is not bool
        or type(study.get('retention_only', False)) is not bool
        or type(study.get('partial_prefix', False)) is not bool):
        raise ValueError('prefix_cache requires an explicit expected_reused_tokens map')
    expected = study['expected_reused_tokens']
    if type(expected) is not dict or set(expected) != set(protocol['arms']):
        raise ValueError('prefix reuse expectations must cover exactly every arm')
    if any(type(n) is not int or not 0 <= n <= 4096 for n in expected.values()):
        raise ValueError('prefix reuse expectations must be integer counts from zero to 4096')
    stores = study.get('expected_warmup_checkpoint_stores')
    if 'expected_warmup_checkpoint_stores' in study:
        if (not study.get('complete_prompt', False) or type(stores) is not dict
            or set(stores) != set(protocol['arms'])
            or any(type(n) is not int or n not in [0, 1] for n in stores.values())
            or stores.get('reference') != 0):
            raise ValueError('combined complete-prompt warmup stores require exact zero/one counts for every arm')
    if study.get('partial_prefix', False):
        if (study.get('retention_only', False) or study.get('complete_prompt', False)
            or expected.get('reference') != 0 or not any(expected.values())
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('partial-prefix study requires distinct frozen warmup and positive strict reuse')
    if study.get('retention_only', False):
        if (any(expected.values()) or study.get('complete_prompt', False)
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('retention-only study requires zero reuse and a separately frozen warmup fixture')
    elif expected['reference'] != 0 or not any(expected.values()):
        raise ValueError('prefix study requires zero reference reuse and a positive candidate')
    return expected


def warmup_fixture(protocol, measured_fixture):
    """A distinct input makes unique-request retention cost measurable while
    keeping prefix caching enabled. Existing studies warm the measured input."""
    fields = {'warmup_fixture', 'warmup_fixture_sha256'}
    supplied = fields.intersection(protocol)
    if not supplied: return measured_fixture
    study = protocol.get('prefix_cache') or {}
    if (supplied != fields or not (study.get('retention_only', False) or study.get('partial_prefix', False))
        or protocol['memory_gb'] > 10 or protocol.get('raw', True) is not True):
        raise ValueError('separate warmup requires a bounded raw retention or partial-prefix study')
    if any(type(protocol[k]) is not str or not protocol[k] for k in fields):
        raise ValueError('warmup path and hash must be nonempty strings')
    fixture = Path(protocol['warmup_fixture']).resolve()
    if digest(fixture) != protocol['warmup_fixture_sha256']: raise ValueError('warmup fixture identity mismatch')
    if not 1 <= fixture.stat().st_size <= 32768 or fixture.read_bytes() == measured_fixture.read_bytes():
        raise ValueError('warmup must be bounded, nonempty and distinct from the measured fixture')
    return fixture


def work_constraints(protocol):
    constraints = protocol.get('work_constraints')
    if constraints is None: return None
    allowed = {'prefillSlotCPUBatches', 'decodeSlotCPUBatches', 'decodeModelTokens',
               'decodeForwardPasses', 'prefillTokens', 'decodeTokens', 'verifyPasses',
               'draftedTokens', 'prefillRecords', 'decodeRecords', 'completePromptHits', 'completePromptStores',
               'ngramCachedRows', 'ngramCachePayloadBytes', 'ngramRowHits', 'ngramRowMisses',
               'encodedImages', 'reusedImageFeatures', 'prefixSkippedImages', 'visionQueryTile', 'visionQueryTileCalls', 'residentExpertPrelaunches', 'residentExpertJoins', 'fusedRoPERotationsScheduled', 'ropeTableHits', 'ropeTableBuilds', 'terminalQueryRowsSkipped', 'fusedGDNProjectionsScheduled', 'packedGDNProjectionLayers', 'packedGDNProjectionPayloadBytes'}
    if type(constraints) is not dict or set(constraints) != set(protocol['arms']):
        raise ValueError('work constraints must cover exactly every arm')
    for counters in constraints.values():
        if type(counters) is not dict or not counters or not set(counters) <= allowed:
            raise ValueError('unknown or empty work constraint counters')
        reader_pair = {'residentExpertPrelaunches', 'residentExpertJoins'}
        if set(counters) & reader_pair and not reader_pair <= set(counters):
            raise ValueError('resident overlap requires both submission and completed-join counters')
        for bounds in counters.values():
            if type(bounds) is not dict or not bounds or not set(bounds) <= {'min', 'max'}:
                raise ValueError('work bounds require min and/or max')
            if any(type(v) is not int or v < 0 for v in bounds.values()):
                raise ValueError('work bounds must be nonnegative integers')
            if bounds.get('min', 0) > bounds.get('max', float('inf')):
                raise ValueError('work minimum exceeds maximum')
    return constraints


def validate_work_observation(constraints, arm, stats):
    if constraints is None: return
    for counter, bounds in constraints[arm].items():
        value = stats.get(counter)
        if type(value) is not int or value < bounds.get('min', 0) or value > bounds.get('max', float('inf')):
            raise ValueError(f'{arm} work counter {counter} violates its frozen bounds')
    if 'residentExpertPrelaunches' in constraints[arm] and stats['residentExpertPrelaunches'] != stats['residentExpertJoins']:
        raise ValueError(f'{arm} submitted resident work without the same number of completed joins')


def cell_cooldown(protocol):
    value = protocol.get('between_cells_seconds', 0)
    if type(value) not in (int, float) or not math.isfinite(value) or not 0 <= value <= 60:
        raise ValueError('between_cells_seconds must be finite and between zero and 60')
    return value


def reservation_wait_limit(protocol):
    value = protocol.get('model_reservation_wait_seconds',0)
    if type(value) is not int or not 0 <= value <= 1800:
        raise ValueError('model_reservation_wait_seconds must be an integer from zero to1800')
    return value


def reserved_cooldown(seconds, wait_limit, lock_path=None):
    """Keep another model from heating the machine during a declared cooldown.

    Release before ordinary preflight/child launch. The native guard remains
    authoritative if another caller wins that handoff; no guard is bypassed.
    """
    if wait_limit == 0:
        time.sleep(seconds)
        return {'reserved':False,'wait_seconds':0}
    started=time.monotonic(); notified=-30.0
    with open(lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
        while True:
            try:
                fcntl.flock(lock,fcntl.LOCK_EX | fcntl.LOCK_NB)
                break
            except BlockingIOError:
                elapsed=time.monotonic()-started
                if elapsed >= wait_limit: raise TimeoutError('other model retained the lock beyond the declared reservation wait')
                if elapsed-notified >= 30:
                    print(json.dumps({'phase':'waiting for model reservation','seconds':round(elapsed,1)}),flush=True)
                    notified=elapsed
                time.sleep(min(2,wait_limit-elapsed))
        waited=time.monotonic()-started
        time.sleep(seconds)
        return {'reserved':True,'wait_seconds':waited}


def validate_prefix_observation(expected, name, warm, measured, *, complete_prompt=False, retention_only=False,
                                partial_prefix=False, warmup_checkpoint_stores=None):
    want = expected[name] if expected is not None else 0
    stats = measured['stats']
    if stats.get('reusedPrefixTokens') != want:
        raise ValueError('observed prefix reuse differs from the frozen workload')
    if expected is None: return
    if warm['stats'].get('reusedPrefixTokens') != 0:
        raise ValueError('fresh-server warmup unexpectedly reused state')
    if retention_only and (want != 0 or warm['prompt_ids'] == measured['prompt_ids']):
        raise ValueError('retention-only request must be unique and reuse zero tokens')
    if partial_prefix:
        if (warm['prompt_ids'] == measured['prompt_ids'] or stats.get('completePromptHits') != 0
            or warm['stats'].get('completePromptHits') != 0):
            raise ValueError('partial-prefix observation must have a different tail and no complete hit')
    full = complete_prompt and want > 0
    if ((len(measured['prompt_ids']) != want if full else len(measured['prompt_ids']) <= want)
        or warm['prompt_ids'][:want] != measured['prompt_ids'][:want]):
        raise ValueError('warmup did not create the measured strict prefix')
    if stats.get('prefixCheckpointForks') != int(want > 0):
        raise ValueError('measured request did not use the declared checkpoint fork')
    stores = (warmup_checkpoint_stores[name] if warmup_checkpoint_stores is not None
              else int(want > 0 and not full))
    if warm['stats'].get('prefixCheckpointStores') != stores:
        raise ValueError('warmup did not create the declared checkpoint')
    if complete_prompt:
        if (stats.get('completePromptHits') != int(full)
            or warm['stats'].get('completePromptStores') != int(full)
            or warm['stats'].get('completePromptHits') != 0
            or (full and warm['prompt_ids'] != measured['prompt_ids'])):
            raise ValueError('complete prompt identity or retained-logit mechanism differs')
    for sample in [warm['stats'], stats]:
        if sample.get('prefixCheckpointErrors') != 0 or sample.get('prefixCheckpointRefusals') != 0:
            raise ValueError('checkpoint retention failed or exceeded its budget')


def wait_for_headroom(needed_gb, seconds):
    if type(seconds) not in (int, float) or not math.isfinite(seconds) or not 0 <= seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    start = time.monotonic()
    attempts = 0
    while True:
        attempts += 1
        try:
            snapshot = preflight(needed_gb)
            return snapshot, {'seconds': time.monotonic()-start, 'checks': attempts, 'limit_seconds': seconds}
        except InsufficientHeadroom:
            remaining = seconds - (time.monotonic()-start)
            if remaining <= 0: raise
            time.sleep(min(.25, remaining))


def image_fixtures(protocol):
    """Bounded, content-pinned inline images. Never resolve an image URL."""
    if 'images' not in protocol: return []
    images = protocol['images']
    if (type(images) is not list or not 1 <= len(images) <= 4
        or protocol.get('raw', True) is not False):
        raise ValueError('image study requires one to four images and templates')
    if protocol.get('memory_gb', 0) > 10:
        if protocol.get('large_vision_measurement') is None:
            raise ValueError('image study above 10 GB requires the bounded large-vision declaration')
        # Reuse the complete capacity contract before reading any image. A
        # declared purpose alone cannot bypass pool, output or resource guards.
        measurement_memory(protocol)
    result = []; total = 0
    for entry in images:
        if (type(entry) is not dict or set(entry) != {'path', 'sha256'}
            or type(entry['path']) is not str or not entry['path']
            or type(entry['sha256']) is not str):
            raise ValueError('image fixture requires an explicit path and SHA-256')
        path = Path(entry['path']).resolve()
        if not path.is_file() or not 1 <= path.stat().st_size <= 8 << 20:
            raise ValueError('image fixture is missing, empty or exceeds 8 MiB')
        with path.open('rb') as source: data = source.read((8 << 20) + 1)
        total += len(data)
        if not 1 <= len(data) <= 8 << 20 or total > 16 << 20 or hashlib.sha256(data).hexdigest() != entry['sha256']:
            raise ValueError('image identity differs or total exceeds 16 MiB')
        result.append((path, data))
    return result


def request_body(protocol, prompt, *, images=None):
    raw = protocol.get('raw', True)
    if type(raw) is not bool: raise ValueError('raw must be Boolean')
    body = {'prompt': prompt, 'raw': raw, 'stream': True,
            'options': {'temperature': 0, 'num_predict': protocol['max_tokens'], 'seed': protocol['seed']}}
    sampling = protocol.get('sampling', {})
    allowed = {'temperature', 'top_p', 'top_k', 'min_p', 'presence_penalty'}
    if type(sampling) is not dict or not set(sampling) <= allowed:
        raise ValueError('sampling must contain only declared sampler parameters')
    for key, value in sampling.items():
        if key == 'top_k':
            if type(value) is not int or not 0 <= value <= 248320:
                raise ValueError('top_k must be an integer in the pinned vocabulary range')
        elif type(value) not in (int, float) or not math.isfinite(value):
            raise ValueError(f'{key} must be a finite number')
        elif key == 'temperature' and not 0 <= value <= 10:
            raise ValueError('temperature must be between zero and ten')
        elif key == 'top_p' and not 0 < value <= 1:
            raise ValueError('top_p must be positive and at most one')
        elif key == 'min_p' and not 0 <= value <= 1:
            raise ValueError('min_p must be between zero and one')
        elif key == 'presence_penalty' and not -10 <= value <= 10:
            raise ValueError('presence_penalty must be between minus ten and ten')
    body['options'].update(sampling)
    if 'think' in protocol:
        if type(protocol['think']) is not bool: raise ValueError('think must be Boolean')
        if raw: raise ValueError('think is a template setting; use raw=false')
        body['think'] = protocol['think']
    if images is None: images = image_fixtures(protocol)
    if images:
        body['images'] = [base64.b64encode(data).decode('ascii') for _, data in images]
    return json.dumps(body).encode()


def resource_exclusions(stats, protocol):
    reasons = []
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if limit is not None:
        if type(limit) is not int or limit <= 0: raise ValueError('footprint limit must be a positive integer')
        observation = stats.get('sampledFootprint')
        peak = observation.get('peakBytes') if isinstance(observation, dict) else None
        if type(peak) is not int or peak <= 0:
            reasons.append('declared footprint gate has no valid sampled measurement')
        elif peak > limit:
            reasons.append('sampled physical footprint exceeds declared byte limit')
    require_nominal = protocol.get('require_nominal_power_state', False)
    if type(require_nominal) is not bool: raise ValueError('require_nominal_power_state must be Boolean')
    if require_nominal:
        for key in ['generatorSystemBefore', 'generatorSystemAfter']:
            state = stats.get(key)
            if not isinstance(state, dict) or state.get('thermalState') != 'nominal' or state.get('lowPowerModeEnabled') is not False:
                reasons.append('generator OS thermal/power state unavailable or non-nominal')
                break
    if protocol.get('images'):
        preparation = stats.get('imagePreparation') or {}
        observed = preparation.get('sampledFootprint') or {}
        image_peak = observed.get('peakBytes')
        if (type(image_peak) is not int or image_peak <= 0
            or type(observed.get('samples')) is not int or observed['samples'] <= 0):
            reasons.append('image preparation footprint observation missing')
        elif limit is not None and image_peak > limit:
            reasons.append('image preparation exceeds declared byte limit')
        for key in ['seconds', 'sourceDecodeSeconds', 'towerReadySeconds']:
            value = preparation.get(key)
            if type(value) not in (int, float) or not math.isfinite(value) or value < 0:
                reasons.append('image preparation timer missing or invalid')
                break
    return reasons


def exchange(port, body, timeout, *, allow_complete_prompt=False):
    conn = http.client.HTTPConnection('127.0.0.1', port, timeout=timeout)
    wire = bytearray(); frames = []
    first_delta = first_visible = None
    started = time.monotonic()
    try:
        conn.request('POST', '/api/generate', body, {'Content-Type':'application/json'})
        response = conn.getresponse()
        headers_at = time.monotonic() - started
        if response.status != 200:
            raise ValueError(f'HTTP {response.status}: {response.read(8192)!r}')
        while True:
            line = response.readline(1 << 20)
            if not line: break
            wire += line
            if len(wire) > 8 << 20: raise ValueError('response exceeds bounded capture')
            if not line.strip(): continue
            frame = json.loads(line); frames.append(frame)
            elapsed = time.monotonic() - started
            if first_delta is None and not frame.get('done') and (frame.get('response') or frame.get('thinking')):
                first_delta = elapsed
            if first_visible is None and frame.get('response', '').strip(): first_visible = elapsed
        elapsed = time.monotonic() - started
    finally: conn.close()
    finals = [f for f in frames if f.get('done')]
    if len(finals) != 1 or frames[-1] is not finals[0]: raise ValueError('missing or malformed completion framing')
    details = {'schema_version':1, **finals[0]['slotstream_benchmark']}
    validate_metrics(details, allow_complete_prompt=allow_complete_prompt)
    return {'client_seconds':elapsed, 'headers_seconds':headers_at,
            'first_protocol_delta_seconds':first_delta, 'first_visible_text_seconds':first_visible,
            'text':''.join(f.get('response','') for f in frames), 'metrics':details}, bytes(wire)


def stop_server(child):
    if child.poll() is None:
        os.killpg(child.pid, signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired:
            os.killpg(child.pid, signal.SIGKILL); child.wait()


def wait_ready(child, port):
    deadline = time.monotonic() + 120
    while time.monotonic() < deadline:
        if child.poll() is not None: raise RuntimeError(f'server exited {child.returncode}')
        conn = http.client.HTTPConnection('127.0.0.1', port, timeout=1)
        try:
            conn.request('GET','/api/version')
            response = conn.getresponse(); response.read(4096)
            if response.status == 200: return
        except (OSError, http.client.HTTPException): pass
        finally: conn.close()
        time.sleep(.25)
    raise TimeoutError('server startup timeout')


def sampled_request_peak(stats):
    """Highest sampled process footprint across generation and image preparation.

    These are successive intervals of the same process, so take their maximum,
    never their sum. Missing declared-stage evidence cannot prove a saving.
    """
    observations = [stats.get('sampledFootprint')]
    if 'imagePreparation' in stats:
        preparation = stats['imagePreparation']
        if not isinstance(preparation, dict): return None
        observations.append(preparation.get('sampledFootprint'))
    peaks = [value.get('peakBytes') if isinstance(value, dict) else None for value in observations]
    return max(peaks) if all(type(value) is int and value > 0 for value in peaks) else None


def summaries(rows, reference, comparison_basis='fixed-pool', required_equal_work=None):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
    fields = [] if required_equal_work is None else required_equal_work
    allowed = {'prefillRecords', 'decodeRecords', 'prefillTokens', 'decodeTokens',
               'decodeForwardPasses', 'decodeModelTokens', 'draftedTokens', 'verifyPasses',
               'ngramCachedRows', 'ngramRowHits', 'ngramRowMisses'}
    if (type(fields) is not list or any(type(k) is not str or k not in allowed for k in fields)
            or len(fields) != len(set(fields))):
        raise ValueError('required_equal_work must contain unique supported work counters')
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round']==number}
            a,b = arms.get(reference),arms.get(candidate)
            if not a or not b or not a['valid'] or not b['valid']:
                excluded.append(number); continue
            am,bm = a['metrics'],b['metrics']
            equal_fields = ['prompt_ids', 'effective_mtp']
            if comparison_basis == 'fixed-pool': equal_fields.append('effective_pool_slots')
            if any(am[k]!=bm[k] for k in equal_fields):
                excluded.append(number); continue
            if any(type(am['stats'].get(k)) is not int or am['stats'][k] < 0
                   or type(bm['stats'].get(k)) is not int or am['stats'][k] != bm['stats'][k]
                   for k in fields):
                excluded.append(number); continue
            aseq, bseq = am['stats'].get('allocatedSequenceBytes'), bm['stats'].get('allocatedSequenceBytes')
            aactive, bactive = am['stats'].get('mlxActiveEndBytes'), bm['stats'].get('mlxActiveEndBytes')
            apeak = sampled_request_peak(am['stats'])
            bpeak = sampled_request_peak(bm['stats'])
            sequence_ok = all(type(v) is int and v > 0 for v in [aseq, bseq])
            active_ok = all(type(v) is int and v > 0 for v in [aactive, bactive])
            peak_ok = all(type(v) is int and v > 0 for v in [apeak, bpeak])
            pairs.append({'round':number,'client_reduction_fraction':1-b['client_seconds']/a['client_seconds'],
                'generator_reduction_fraction':1-bm['stats']['requestSeconds']/am['stats']['requestSeconds'],
                'sequence_reduction_fraction': 1-bseq/aseq if sequence_ok else None,
                'active_savings_share': (aactive-bactive)/(aseq-bseq) if sequence_ok and active_ok and aseq > bseq else None,
                'active_savings_bytes': aactive-bactive if active_ok else None,
                'sampled_peak_savings_bytes': apeak-bpeak if peak_ok else None,
                'output_ids_equal':am['output_ids']==bm['output_ids'], 'wire_text_equal':a['text']==b['text']})
        result.append({'reference':reference,'candidate':candidate,'comparison_basis':comparison_basis,
            'pairs':pairs,'excluded_rounds':excluded,
            'median_client_reduction_fraction':statistics.median(p['client_reduction_fraction'] for p in pairs) if pairs else None,
            'median_generator_reduction_fraction':statistics.median(p['generator_reduction_fraction'] for p in pairs) if pairs else None})
    return result


def acceptance_results(summary, contract):
    """Apply the frozen criterion without turning missing/unequal work into a win."""
    if contract is None: return None
    count = contract['minimum_pairs']
    non_regression = 'maximum_median_client_regression' in contract
    if non_regression and 'minimum_median_client_reduction' in contract:
        raise ValueError('choose one latency acceptance criterion')
    reduction_key = 'maximum_median_client_regression' if non_regression else 'minimum_median_client_reduction'
    reduction = contract[reduction_key]
    positive = contract['minimum_positive_fraction']
    if type(count) is not int or count < 1: raise ValueError('minimum_pairs must be a positive integer')
    for name, value in [(reduction_key, reduction), ('minimum_positive_fraction', positive)]:
        if type(value) not in [int, float] or not 0 <= value <= 1: raise ValueError(name + ' must be finite and in [0,1]')
    for key in ['minimum_sequence_reduction', 'minimum_active_savings_share']:
        if key in contract and (type(contract[key]) not in [int, float] or not 0 <= contract[key] <= 1):
            raise ValueError(key + ' must be finite and in [0,1]')
    for key in ['minimum_active_savings_bytes', 'minimum_sampled_peak_savings_bytes']:
        if key in contract and (type(contract[key]) is not int or contract[key] <= 0):
            raise ValueError(key + ' must be a positive integer')
    if contract.get('all_outputs_exact') is not True: raise ValueError('this acceptance contract requires exact outputs')
    result = []
    for item in summary:
        pairs = item['pairs']
        checks = {
            'minimum_pairs': len(pairs) >= count,
            ('median_client_non_regression' if non_regression else 'median_client_reduction'):
                item['median_client_reduction_fraction'] is not None
                and item['median_client_reduction_fraction'] >= (-reduction if non_regression else reduction),
            'positive_fraction': bool(pairs) and sum(p['client_reduction_fraction'] > 0 for p in pairs) / len(pairs) >= positive,
            'exact_outputs': bool(pairs) and all(p['output_ids_equal'] and p['wire_text_equal'] for p in pairs),
        }
        for criterion, metric in [('minimum_sequence_reduction', 'sequence_reduction_fraction'),
                                  ('minimum_active_savings_share', 'active_savings_share'),
                                  ('minimum_active_savings_bytes', 'active_savings_bytes'),
                                  ('minimum_sampled_peak_savings_bytes', 'sampled_peak_savings_bytes')]:
            if criterion in contract:
                values = [p.get(metric) for p in pairs]
                checks[criterion] = bool(values) and all(type(v) in [int, float] and math.isfinite(v)
                    and v >= contract[criterion] for v in values)
        result.append({'candidate': item['candidate'], 'passed': all(checks.values()), 'checks': checks})
    return result


def startup_summaries(rows, reference):
    """Fresh-process costs are separate from warmed request acceptance.

    Amortization uses a paired first-job excess divided by a positive paired
    steady-request saving. It is an estimate for repeating this exact job,
    never a claim about a cold filesystem or a different request mix.
    """
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round'] == number}
            a,b = arms.get(reference),arms.get(candidate)
            first_a,first_b = (a or {}).get('first_request'),(b or {}).get('first_request')
            if (not a or not b or not a['valid'] or not b['valid'] or not first_a or not first_b
                or not a.get('startup_and_warmup_valid') or not b.get('startup_and_warmup_valid')):
                excluded.append(number); continue
            fields = ['prompt_ids','output_ids','text','effective_pool_slots','effective_mtp']
            if any(first_a.get(k) != first_b.get(k) or first_a.get(k) is None for k in fields):
                excluded.append(number); continue
            durations = [a.get('startup_seconds'),b.get('startup_seconds'),
                         first_a.get('complete_seconds_from_launch'),first_b.get('complete_seconds_from_launch'),
                         a.get('client_seconds'),b.get('client_seconds')]
            if any(type(x) not in [float,int] or not math.isfinite(x) or x <= 0 for x in durations):
                excluded.append(number); continue
            excess = first_b['complete_seconds_from_launch']-first_a['complete_seconds_from_launch']
            saving = a['client_seconds']-b['client_seconds']
            pairs.append({'round':number,'startup_excess_seconds':b['startup_seconds']-a['startup_seconds'],
                          'first_job_excess_seconds':excess,'steady_request_saving_seconds':saving,
                          'estimated_total_jobs_to_amortize':1+math.ceil(max(0,excess)/saving) if saving > 0 else None})
        result.append({'candidate':candidate,'pairs':pairs,'excluded_rounds':excluded,
                       'median_startup_excess_seconds':statistics.median(p['startup_excess_seconds'] for p in pairs) if pairs else None,
                       'median_first_job_excess_seconds':statistics.median(p['first_job_excess_seconds'] for p in pairs) if pairs else None})
    return result


def verified_build(binary):
    binary = Path(binary).resolve()
    identity = json.loads((binary.parent / 'build-identity.json').read_text())
    for path, key in [(binary, 'binary_sha256'), (binary.parent / 'mlx.metallib', 'metallib_sha256'),
                      (binary.parent / 'build-source.tar.gz', 'source_archive_sha256')]:
        if digest(path) != identity[key]:
            raise ValueError(f'frozen identity mismatch: {path}')
    return {'binary': str(binary), 'identity': identity}


def validate_declared_binary(protocol, builds):
    expected = protocol.get('frozen_binary_sha256')
    if expected is None: return
    if type(expected) is not str or len(expected) != 64 or any(c not in '0123456789abcdef' for c in expected):
        raise ValueError('frozen_binary_sha256 must be a lowercase SHA-256 digest')
    if not builds or any(b['identity']['binary_sha256'] != expected for b in builds.values()):
        raise ValueError('an arm does not match the prospectively frozen binary SHA-256')


def validate_arms(arms):
    if type(arms) is not dict or not arms or 'reference' not in arms:
        raise ValueError('arms must include a reference')
    for name, arm in arms.items():
        if type(name) is not str or not name.replace('_', '').replace('-', '').isalnum():
            raise ValueError('unsafe arm name')
        if type(arm) is not dict or not {'chunk', 'env'} <= set(arm) or set(arm) - {'chunk', 'env', 'binary'}:
            raise ValueError('each arm requires chunk and env, with only an optional binary')
        if type(arm['chunk']) is not int or arm['chunk'] not in [256, 512, 1024, 2048, 4096]:
            raise ValueError('arm chunk must be a supported prefill size')
        if type(arm['env']) is not dict or any(type(k) is not str or not k.startswith('SLOTSTREAM_')
                or type(v) is not str for k, v in arm['env'].items()):
            raise ValueError('arm env requires explicit string SLOTSTREAM_ controls')
        if 'SLOTSTREAM_PREFILL_CHUNK' in arm['env'] and arm['env']['SLOTSTREAM_PREFILL_CHUNK'] != str(arm['chunk']):
            raise ValueError('arm chunk conflicts with its environment')
        if 'binary' in arm and (type(arm['binary']) is not str or not arm['binary']):
            raise ValueError('arm binary must be a nonempty path string')


def startup_acceptance_results(rows, reference, contract):
    """Optional first-job gate; never borrow swap-excluded warmups from steady timing."""
    if contract is None:
        return None
    keys = {'minimum_pairs', 'maximum_median_first_job_regression', 'all_outputs_exact'}
    if not isinstance(contract, dict) or set(contract) != keys:
        raise ValueError('startup acceptance requires exactly minimum_pairs, maximum_median_first_job_regression and all_outputs_exact')
    count, limit = contract['minimum_pairs'], contract['maximum_median_first_job_regression']
    if type(count) is not int or count < 1:
        raise ValueError('startup minimum_pairs must be a positive integer')
    if type(limit) not in [int, float] or not 0 <= limit <= 1:
        raise ValueError('startup regression limit must be finite and in [0,1]')
    if contract['all_outputs_exact'] is not True:
        raise ValueError('startup acceptance requires exact outputs')
    by_cell = {(r['round'], r['arm']): r for r in rows}
    results = []
    for summary in startup_summaries(rows, reference):
        changes = []
        for pair in summary['pairs']:
            a = by_cell[pair['round'], reference]['first_request']['complete_seconds_from_launch']
            b = by_cell[pair['round'], summary['candidate']]['first_request']['complete_seconds_from_launch']
            changes.append(1 - b / a)
        median = statistics.median(changes) if changes else None
        checks = {'minimum_pairs': len(changes) >= count,
                  'median_first_job_non_regression': median is not None and median >= -limit}
        results.append({'candidate': summary['candidate'], 'passed': all(checks.values()),
            'checks': checks, 'eligible_rounds': [p['round'] for p in summary['pairs']],
            'excluded_rounds': summary['excluded_rounds'], 'median_first_job_reduction_fraction': median})
    return results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    validate_arms(protocol.get('arms'))
    expected_prefix = prefix_study(protocol)
    complete_prompt = (protocol.get('prefix_cache') or {}).get('complete_prompt', False)
    retention_only = (protocol.get('prefix_cache') or {}).get('retention_only', False)
    partial_prefix = (protocol.get('prefix_cache') or {}).get('partial_prefix', False)
    warmup_checkpoint_stores = (protocol.get('prefix_cache') or {}).get('expected_warmup_checkpoint_stores')
    expected_work = work_constraints(protocol)
    startup_acceptance_results([], next(iter(protocol['arms'])), protocol.get('startup_acceptance'))
    stop_on_contention = contention_guard(protocol)
    initial_quiet = workspace_quiet_requirement(protocol)
    cooldown = cell_cooldown(protocol)
    reservation_wait = reservation_wait_limit(protocol)
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    explicit_pool_gb = fixed_pool_budget(protocol)
    required_equal_work = protocol.get('required_equal_work')
    summaries([], 'reference', comparison_basis, required_equal_work)
    acceptance_results([], protocol.get('acceptance'))
    abort_on_resource_failure = protocol.get('abort_on_resource_failure', False)
    if type(abort_on_resource_failure) is not bool: raise ValueError('abort_on_resource_failure must be Boolean')
    resource_exclusions({}, protocol)  # Validate declared types before loading.
    arms=protocol['arms']; model=Path(protocol['model']).resolve(); binary=Path(protocol['binary']).resolve()
    if protocol.get('acceptance') is not None and len(arms) < 2:
        raise ValueError('paired acceptance requires reference and candidate arms')
    required_memory = measurement_memory(protocol)
    settle_seconds = protocol.get('memory_settle_seconds', 0)
    if type(settle_seconds) not in (int, float) or not math.isfinite(settle_seconds) or not 0 <= settle_seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    workload_exclusions({}, protocol)  # Validate the declaration before startup.
    if protocol['rounds']<1 or not 1<=protocol['max_tokens']<=512:
        parser.error('bounded memory, rounds and output required')
    if any(not name.replace('_','').replace('-','').isalnum() for name in arms): parser.error('unsafe arm name')
    identity = verified_build(binary)['identity']
    arm_builds = {name: verified_build(arm.get('binary', binary)) for name, arm in arms.items()}
    validate_declared_binary(protocol, arm_builds)
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
    warm_fixture = warmup_fixture(protocol, fixture)
    images = image_fixtures(protocol)
    if protocol['memory_gb'] > 10:
        fixture_limit = 32768 if protocol.get('large_scope_measurement') is not None else 2048
        if fixture.stat().st_size > fixture_limit:
            raise ValueError(f'large-memory study fixture exceeds its {fixture_limit}-byte bound')
    a.out=a.out.resolve(); a.out.mkdir(parents=True,exist_ok=False)
    shutil.copyfile(fixture,a.out/'fixture.txt'); shutil.copyfile(binary.parent/'build-source.tar.gz',a.out/'build-source.tar.gz')
    for name, build in arm_builds.items():
        shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', a.out / f'{name}-build-source.tar.gz')
    harness_sources = {}
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:
        harness_sources[source.name] = digest(source)
        shutil.copyfile(source, a.out/source.name)
    (a.out/'manifest.json').write_text(json.dumps({'protocol':protocol,'protocol_sha256':digest(a.protocol),
        'identity':identity,'model':model_identity(model),'harness_sha256':digest(Path(__file__)),
        'harness_sources': harness_sources, 'arm_builds': arm_builds},indent=2)+'\n')
    for i, (image_path, data) in enumerate(images):
        (a.out / f'image-{i}{image_path.suffix}').write_bytes(data)
    body=request_body(protocol, fixture.read_text(), images=images)
    warm_body = request_body(protocol, warm_fixture.read_text(), images=images)
    (a.out/'request.json').write_bytes(body)
    if warm_fixture != fixture:
        shutil.copyfile(warm_fixture, a.out/'warmup-fixture.txt')
        (a.out/'warmup-request.json').write_bytes(warm_body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
    if initial_quiet is not None:
        quiet_record = {'requirement': initial_quiet, 'passed': False}
        try:
            quiet_record.update(wait_for_quiet_workspace(initial_quiet), passed=True)
        except (Exception, KeyboardInterrupt) as error:
            quiet_record['error'] = f'{type(error).__name__}: {error}'
        (a.out/'initial-workspace-quiet.json').write_text(json.dumps(quiet_record, indent=2)+'\n')
        if not quiet_record['passed']:
            (a.out/'completion.json').write_text(json.dumps({'stopped_early': True,
                'planned_cells': protocol['rounds'] * len(arms), 'recorded_cells': 0,
                'error': quiet_record['error'], 'acceptance': []}, indent=2)+'\n')
            print(json.dumps(quiet_record), flush=True)
            return 1
    stop_requested = False
    interrupted = False
    for number in range(1,protocol['rounds']+1):
        order=list(arms) if number%2 else list(reversed(arms))
        for name in order:
            arm=arms[name]; cell=a.out/f'{number}-{name}'; cell.mkdir()
            env=clean_env|arm['env']|{'SLOTSTREAM_BENCH_DETAILS':'1','SLOTSTREAM_PREFILL_CHUNK':str(arm['chunk'])}
            extra=max(0,arm['chunk']-256)*1.30e-3
            if env.get('SLOTSTREAM_OPT_LAYER_WORKSPACE')=='1': extra+=2
            if env.get('SLOTSTREAM_OPT_ROUTER_WEIGHTS')=='1': extra+=.3
            scope=int(env.get('SLOTSTREAM_OPT_READ_SCOPE','0'))
            if scope: extra+=max(0,scope-arm['chunk'])*1.30e-3+.12
            row={'round':number,'arm':name,'valid':False,'extra_preflight_allowance_gb':extra,
                 'env':{k:v for k,v in env.items() if k.startswith('SLOTSTREAM_')}}
            child=None
            try:
                if stop_on_contention:
                    row['competing_jobs_before_cooldown'] = competing_jobs()
                    if row['competing_jobs_before_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job; stopped before cooldown or model launch')
                row['cooldown_seconds'] = cooldown
                if cooldown:
                    print(json.dumps({'round':number,'arm':name,'phase':'before-cell cooldown','seconds':cooldown}),flush=True)
                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)
                if stop_on_contention:
                    row['competing_jobs_after_cooldown'] = competing_jobs()
                    if row['competing_jobs_after_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job appeared during cooldown; model not launched')
                try:
                    row['before_startup'], row['headroom_settle'] = wait_for_headroom(required_memory+extra, settle_seconds)
                except Exception:
                    if abort_on_resource_failure: stop_requested = True
                    raise
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                memory_args = (['--pool-gb', str(explicit_pool_gb)] if explicit_pool_gb is not None
                               else ['--memory-gb', str(protocol['memory_gb'])])
                command=[arm_builds[name]['binary'],'serve','--port',str(port),'--model',str(model), *memory_args,
                         '--mtp',protocol.get('mtp','off'),'--no-elastic']
                if expected_prefix is None: command.append('--no-prefix-cache')
                if protocol.get('large_scope_measurement') is not None:
                    # Bound active context independently of any evolving default
                    # while allowing the declared approximately4k-token fixture.
                    command.extend(['--max-context','8192'])
                row['command']=command
                with (cell/'server.stdout').open('wb') as out, (cell/'server.stderr').open('wb') as err:
                    launched_at=time.monotonic()
                    child=subprocess.Popen(command,cwd=ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
                    wait_ready(child,port)
                    row['startup_seconds']=time.monotonic()-launched_at
                    row['after_startup_vm']=vm_snapshot()
                    warm,wire=exchange(port,warm_body,protocol.get('timeout_seconds',600))
                    row['first_request']={k:warm['metrics'][k] for k in ['prompt_ids','output_ids','effective_pool_slots','effective_mtp']}
                    row['first_request'].update(text=warm['text'],complete_seconds_from_launch=time.monotonic()-launched_at)
                    row['after_warmup_vm']=vm_snapshot()
                    row['startup_and_warmup_valid']=not resource_exclusions(warm['metrics']['stats'],protocol) and (
                        warm['metrics']['stats']['decodeTokens'] >= protocol.get('minimum_output_tokens',0)) and all(
                        row['before_startup'][key]==row['after_warmup_vm'][key] for key in ['swapins','swapouts'])
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
                    if stop_on_contention:
                        row['competing_jobs_after_warmup'] = competing_jobs()
                        if row['competing_jobs_after_warmup']:
                            stop_requested = True
                            raise RuntimeError('competing storage/build job appeared during warmup; measurement not started')
                    if abort_on_resource_failure:
                        warm_exclusions = resource_exclusions(warm['metrics']['stats'], protocol)
                        if protocol['memory_gb'] > 10:
                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]
                                   for key in ['swapins', 'swapouts']):
                                warm_exclusions.append('swap activity during large-pool startup/warmup')
                        if warm_exclusions:
                            stop_requested = True
                            row['exclusion'] = 'warmup resource gate: ' + '; '.join(warm_exclusions)
                            raise RuntimeError('declared resource stop before measurement')
                    row['host_before']=host_conditions()
                    row['before']=vm_snapshot()
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600),
                        allow_complete_prompt=complete_prompt and expected_prefix[name] > 0)
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    if stop_on_contention:
                        row['competing_jobs_after_measurement'] = competing_jobs()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if explicit_pool_gb is not None and m['effective_pool_slots'] != protocol['fixed_pool_slots']:
                        raise ValueError('effective pool differs from the frozen explicit capacity')
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    validate_prefix_observation(expected_prefix, name, warm['metrics'], m,
                        complete_prompt=complete_prompt, retention_only=retention_only, partial_prefix=partial_prefix,
                        warmup_checkpoint_stores=warmup_checkpoint_stores)
                    validate_work_observation(expected_work, name, s)
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
                    if stop_on_contention and row.get('competing_jobs_after_measurement'):
                        exclusions.append('known competing storage/build job observed after measurement')
                        stop_requested = True
                    if exclusions and abort_on_resource_failure: stop_requested = True
                    exclusions += workload_exclusions(s, protocol)
                    if changed: exclusions.append('swap activity during measured request; pair excluded')
                    row['valid']=not exclusions
                    if exclusions: row['exclusion']='; '.join(exclusions)
            except KeyboardInterrupt:
                row['interrupted'] = True
                row['error'] = 'KeyboardInterrupt: measured result incomplete; owned server stopped'
                interrupted = stop_requested = True
            except Exception as e: row['error']=f'{type(e).__name__}: {e}'
            finally:
                if child is not None: stop_server(child)
            (cell/'result.json').write_text(json.dumps(row,indent=2)+'\n')
            rows.append(row)
            with (a.out/'results.jsonl').open('a') as log: log.write(json.dumps(row)+'\n')
            progress = {k:v for k,v in row.items() if k in ['round','arm','valid','client_seconds','error','exclusion']}
            if 'metrics' in row:
                stats = row['metrics']['stats']
                progress['decode_records'] = stats.get('decodeRecords')
                if 'decodeLocalVictims' in stats: progress['local_victims'] = stats['decodeLocalVictims']
                if protocol.get('acceptance', {}).get('minimum_sequence_reduction') is not None:
                    progress['sequence_bytes'] = stats.get('allocatedSequenceBytes')
                    progress['mlx_active_bytes'] = stats.get('mlxActiveEndBytes')
            print(json.dumps(progress),flush=True)
            if stop_requested: break
        if stop_requested: break
    summary=summaries(rows,next(iter(arms)),comparison_basis,required_equal_work)
    (a.out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    (a.out/'startup-summary.json').write_text(json.dumps(startup_summaries(rows,next(iter(arms))),indent=2)+'\n')
    assessment = acceptance_results(summary, protocol.get('acceptance'))
    startup_assessment = startup_acceptance_results(rows, next(iter(arms)), protocol.get('startup_acceptance'))
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment, 'startup_acceptance': startup_assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    if startup_assessment is not None and not all(r['passed'] for r in startup_assessment): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())
````

## /tmp/slotstream-optimization-execution/serial-planner-build-v238/focused-tests.json

SHA-256 `baa77047c2b0996648d3f93d2f0d44cb6c38e1095f9aaa05573dd44f1d6ec08e`; 390 bytes.

````text
{
  "captured_at": "2026-09-07T03:46:48.731865+00:00",
  "results": [
    {
      "name": "serial-guard",
      "command": [
        "python3",
        "Tools/optimization_serial_build_test.py"
      ],
      "exit_code": 0
    },
    {
      "name": "owned-cleanup",
      "command": [
        "python3",
        "Tools/process_cleanup_checks.py"
      ],
      "exit_code": 0
    }
  ]
}
````

## /tmp/slotstream-optimization-execution/serial-planner-build-v238/launch-readiness.json

SHA-256 `1ffe79bc0808250246b18fdd127a40ddebd3bccbe703fef1217280751351882e`; 2236 bytes.

````text
{
  "captured_at": "2026-09-07T03:53:45.566759+00:00",
  "vm": {
    "page_bytes": 16384,
    "reclaimable_bytes": 11746574336,
    "swapins": 44106018,
    "swapouts": 77510858,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    91559.\nPages active:                                1213573.\nPages inactive:                              1190187.\nPages speculative:                             26755.\nPages throttled:                                   0.\nPages wired down:                             280963.\nPages purgeable:                               12370.\n\"Translation faults\":                    15180362977.\nPages copy-on-write:                       716577548.\nPages zero filled:                       20998925872.\nPages reactivated:                        3460538901.\nPages purged:                               71584997.\nFile-backed pages:                            613025.\nAnonymous pages:                             1817490.\nPages stored in compressor:                   896182.\nPages occupied by compressor:                 282040.\nDecompressions:                           1165402569.\nCompressions:                             1477877032.\nPageins:                                  7587387150.\nPageouts:                                   11030260.\nSwapins:                                    44106018.\nSwapouts:                                   77510858.\nPages tagged:                                 200503.\nPages tagged resident:                        185385.\nPages tagged compressed:                       15118.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                15127.\nPages tag-storage free:                          377.\nPages tag-storage non-tag pageable:            82792.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    2218816.\nTagged compressions:                        11082573.\nTagged decompressions:                      10256713.\n"
  },
  "model_lock_free": true,
  "competing_jobs": [],
  "protocol_sha256": "fd522a990e297b350d43ee3e2abee7aa0410cf1cd7673590e2ec9bacf57ed673",
  "eligible": true
}
````

## /tmp/slotstream-optimization-execution/serial-planner-build-v238/owned-cleanup.stderr.txt

SHA-256 `a00cfbaf16c44c56cc6d39bea9a795df2fc1f4c62c9b354b774a3198549cfc0e`; 101 bytes.

````text
...
----------------------------------------------------------------------
Ran 3 tests in 3.116s

OK
````

## /tmp/slotstream-optimization-execution/serial-planner-build-v238/owned-cleanup.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/serial-planner-build-v238/protocol.json

SHA-256 `fd522a990e297b350d43ee3e2abee7aa0410cf1cd7673590e2ec9bacf57ed673`; 22122 bytes.

````text
{
  "captured_at": "2026-09-07T03:47:52.513399+00:00",
  "classification": "New prospective guarded serial compiler profile; original13GB/-j2 gate and refusals remain unchanged, no inference or performance claim",
  "source": "/tmp/slotstream-optimization-execution/planner-family-integration-v237/candidate-source",
  "source_sha256": {
    "Makefile": "457d65426cca792bd8c1bd28e7d5bbcc812664090b535eeb0d355302679995d6",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
    "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
    "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
    "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
    "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
    "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
    "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
    "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
    "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
    "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
    "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
    "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
    "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
    "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
    "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
    "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
    "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
    "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
    "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
    "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
    "Sources/Slotstream/Layers.swift": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
    "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
    "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
    "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
    "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
    "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
    "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
    "Sources/Slotstream/Optimizations.swift": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
    "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
    "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
    "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/Plan.swift": "fb788e98e388a2a4bed06743ada61c5f9f9173f237ef2a8f95cef82cd673d1ae",
    "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
    "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
    "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
    "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
    "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
    "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
    "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "325b2c29e6fc03f17c642d5a72eccf77eb5e3f82be1df1df4b910b65519fb00a",
    "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
    "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
    "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
    "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
    "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
    "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
    "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
    "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
    "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
    "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
    "Sources/Slotstream/Weights.swift": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
    "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
    "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
    "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
    "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "51e505bd3279983263ad731133b2f1e20606387cf03ba360ffcb2fba34dd33a3",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
    "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
    "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
    "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "d12a1d66c39d62cc773ba81ce1bf8ba88b82b096ad2f060398a39acfcf65b63c",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
    "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
    "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
    "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
    "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
    "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
    "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
    "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
    "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
    "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
    "Sources/slotstream-cli/MTPCommands.swift": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
    "Sources/slotstream-cli/OptimizationCommands.swift": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
    "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
    "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
    "Sources/slotstream-cli/main.swift": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4",
    "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "driver_sha256": {
    "optimization_serial_build.py": "ad3b6858cc15a43e5fec401df5eca341e0b2b0f0b9525763d7afce17077cb07b",
    "optimization_serial_build_test.py": "f086ba93fe35b32ddcdc062ff67dcdec62238fa3811f487370e47900fd1f46d9",
    "optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "process_cleanup_checks.py": "2de6d823a4850662fda621cbe2df43aa869731e40530e7f286c9a2f289e6a982"
  },
  "policy": {
    "startup_reclaimable_bytes": 9500000000,
    "minimum_live_reclaimable_bytes": 6000000000,
    "maximum_owned_rss_bytes": 3000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1200,
    "compiler_jobs": 1,
    "stop_on_new_swapouts": true
  },
  "maximum_cleanup_seconds": 20,
  "command": [
    "python3",
    "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py",
    "--source",
    "/tmp/slotstream-optimization-execution/planner-family-integration-v237/candidate-source",
    "--out",
    "/Users/carlos/Projects/slotstream/.build/optimization/serial-planner-build-v238"
  ],
  "preflight": {
    "page_bytes": 16384,
    "reclaimable_bytes": 12632031232,
    "swapins": 44105987,
    "swapouts": 77510858,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   200705.\nPages active:                                1167627.\nPages inactive:                              1149482.\nPages speculative:                             21599.\nPages throttled:                                   0.\nPages wired down:                             263405.\nPages purgeable:                               14668.\n\"Translation faults\":                    15176965264.\nPages copy-on-write:                       716223368.\nPages zero filled:                       20996908717.\nPages reactivated:                        3460536427.\nPages purged:                               71581009.\nFile-backed pages:                            555625.\nAnonymous pages:                             1783083.\nPages stored in compressor:                   896857.\nPages occupied by compressor:                 282162.\nDecompressions:                           1165401914.\nCompressions:                             1477877032.\nPageins:                                  7587351885.\nPageouts:                                   11030260.\nSwapins:                                    44105987.\nSwapouts:                                   77510858.\nPages tagged:                                 200308.\nPages tagged resident:                        185162.\nPages tagged compressed:                       15146.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                15128.\nPages tag-storage free:                          414.\nPages tag-storage non-tag pageable:            82754.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    2225216.\nTagged compressions:                        11082573.\nTagged decompressions:                      10256685.\n"
  },
  "preflight_eligible": true,
  "shared_runtime_untouched": true,
  "normal_build_profile": "13GB/-j2; still unrun/refused at unavailable headroom",
  "inference_resource_benchmark_gates_unchanged": true
}
````

## /tmp/slotstream-optimization-execution/serial-planner-build-v238/return-audit.json

SHA-256 `be1b2489945265d7d0bc10c89e8abee5762e8e44475784a404d0b58289038674`; 2542 bytes.

````text
{
  "captured_at": "2026-09-07T03:59:50.506800+00:00",
  "model_lock_free": true,
  "competing_jobs": [],
  "vm": {
    "page_bytes": 16384,
    "reclaimable_bytes": 11612012544,
    "swapins": 44106389,
    "swapouts": 77510858,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   142463.\nPages active:                                1194918.\nPages inactive:                              1185691.\nPages speculative:                              7532.\nPages throttled:                                   0.\nPages wired down:                             275501.\nPages purgeable:                                8506.\n\"Translation faults\":                    15192839497.\nPages copy-on-write:                       717549498.\nPages zero filled:                       21005555276.\nPages reactivated:                        3460548011.\nPages purged:                               71596683.\nFile-backed pages:                            557772.\nAnonymous pages:                             1830369.\nPages stored in compressor:                   886801.\nPages occupied by compressor:                 279219.\nDecompressions:                           1165415814.\nCompressions:                             1477881069.\nPageins:                                  7587494031.\nPageouts:                                   11030461.\nSwapins:                                    44106389.\nSwapouts:                                   77510858.\nPages tagged:                                 200104.\nPages tagged resident:                        185056.\nPages tagged compressed:                       15048.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                15114.\nPages tag-storage free:                          263.\nPages tag-storage non-tag pageable:            82919.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    2202496.\nTagged compressions:                        11082592.\nTagged decompressions:                      10256802.\n"
  },
  "manifest_sha256": "efbf9dbbf07ece43201a5a85e7f2c4861a988c074473c114568dd612bafef5da",
  "build_log_sha256": "b78f4cb05514d74388da9cf58a1b86f84d72302bad20e04cbae8ce10e7b24ada",
  "live_memory_receipt_exists": false,
  "result": "Failed build, no candidate. Primary guard trigger unavailable because final cleanup/snapshot/receipt path raised PermissionError before durable live receipt; do not infer its cause."
}
````

## /tmp/slotstream-optimization-execution/serial-planner-build-v238/serial-guard.stderr.txt

SHA-256 `7dbc2c06220e3318aaec97d102c8b2313f85149789b971db5e3d611dbe366c02`; 105 bytes.

````text
.......
----------------------------------------------------------------------
Ran 7 tests in 0.260s

OK
````

## /tmp/slotstream-optimization-execution/serial-planner-build-v238/serial-guard.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/serial-guard-recovery-v240/after.stderr.txt

SHA-256 `cf447014961ccc9331d13ac20c04559d10935007c9256f2550d4d417c26bbd77`; 107 bytes.

````text
.........
----------------------------------------------------------------------
Ran 9 tests in 0.466s

OK
````

## /tmp/slotstream-optimization-execution/serial-guard-recovery-v240/after.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/serial-guard-recovery-v240/before.stderr.txt

SHA-256 `7a3d9bd29e2baad8b4997875e621158812e6688a4dc6d45822200e94b013b95b`; 3187 bytes.

````text
..EE.....
======================================================================
ERROR: test_cleanup_error_does_not_erase_primary_failure (__main__.SerialBuildGuards)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py", line 85, in guarded_run
    check_sample(current, rss_bytes, before['swapouts'], policy)
  File "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py", line 52, in check_sample
    raise RuntimeError('live reclaimable memory fell below the serial-build floor')
RuntimeError: live reclaimable memory fell below the serial-build floor

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build_test.py", line 87, in test_cleanup_error_does_not_erase_primary_failure
    guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
  File "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py", line 97, in guarded_run
    terminate_child_tree(child)
  File "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build_test.py", line 84, in failing_cleanup
    raise PermissionError('fixture cleanup failure after draining child')
PermissionError: fixture cleanup failure after draining child

======================================================================
ERROR: test_cleanup_snapshot_error_does_not_erase_primary_failure (__main__.SerialBuildGuards)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py", line 85, in guarded_run
    check_sample(current, rss_bytes, before['swapouts'], policy)
  File "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py", line 52, in check_sample
    raise RuntimeError('live reclaimable memory fell below the serial-build floor')
RuntimeError: live reclaimable memory fell below the serial-build floor

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build_test.py", line 101, in snapshot
    try: return next(values)
StopIteration

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build_test.py", line 104, in test_cleanup_snapshot_error_does_not_erase_primary_failure
    guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
  File "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py", line 101, in guarded_run
    record['after_cleanup'] = snapshot()
  File "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build_test.py", line 102, in snapshot
    except StopIteration: raise PermissionError('fixture after-cleanup snapshot')
PermissionError: fixture after-cleanup snapshot

----------------------------------------------------------------------
Ran 9 tests in 0.315s

FAILED (errors=2)
````

## /tmp/slotstream-optimization-execution/serial-guard-recovery-v240/before.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/serial-guard-recovery-v240/complete.stderr.txt

SHA-256 `e571a8581be3220b8fbd1b107d1474181124832ab3f9aeaf156257b3e2840eef`; 110 bytes.

````text
...........
----------------------------------------------------------------------
Ran 11 tests in 1.055s

OK
````

## /tmp/slotstream-optimization-execution/serial-guard-recovery-v240/complete.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/serial-guard-recovery-v240/drivers/build_identity.py

SHA-256 `d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86`; 2847 bytes.

````text
#!/usr/bin/env python3
"""Bind a built executable to a reconstructible source archive and package pins."""
import hashlib
import io
import json
from pathlib import Path
import sys
import tarfile

def sha(p):
    h = hashlib.sha256()
    with p.open("rb") as f:
        for data in iter(lambda: f.read(1024*1024), b""): h.update(data)
    return h.hexdigest()

def source_files(root):
    # SwiftPM can compile native targets and copy resources. A Swift-only glob
    # silently omitted CSlotpack's implementation and public header.
    candidates = [*root.joinpath("Sources").rglob("*"), root/"Package.swift",
                  root/"Package.resolved", root/"Makefile",
                  root/"Tools/build_identity.py", root/"Tools/fetch_metallib.sh"]
    if any(p.is_symlink() for p in candidates):
        raise ValueError("build source symlinks require an explicit archived dependency")
    return sorted(p for p in candidates if not p.is_dir())


def bind(root, stage, directory):
    if stage not in ("before", "after"):
        raise ValueError("stage must be before or after")
    root = Path(root).resolve()
    out = root / directory
    out.mkdir(parents=True, exist_ok=True)
    # Any failed post-build check invalidates a previous receipt, including a
    # missing input or an unsupported source dependency discovered below.
    if stage == "after":
        (out/"build-identity.json").unlink(missing_ok=True)
    files = source_files(root)
    source = {str(p.relative_to(root)): sha(p) for p in files}
    if stage == "before":
        (out/"build-source-before.json").write_text(json.dumps(source, sort_keys=True))
        return
    if json.loads((out/"build-source-before.json").read_text()) != source:
        raise ValueError("source changed during build; binary provenance is unverified, rebuild")
    with tarfile.open(out/"build-source.tar.gz", "w:gz") as tar:
        for p in files:
            name = str(p.relative_to(root))
            data = p.read_bytes()
            if hashlib.sha256(data).hexdigest() != source[name]:
                raise ValueError("source changed while archiving; rebuild")
            info = tar.gettarinfo(str(p), arcname=name)
            info.size = len(data)
            tar.addfile(info, io.BytesIO(data))
    if source != {str(p.relative_to(root)): sha(p) for p in source_files(root)}:
        raise ValueError("source changed while archiving; rebuild")
    result = {"source":source,"source_archive_sha256":sha(out/"build-source.tar.gz"),
              "binary_sha256":sha(out/"slotstream"),"metallib_sha256":sha(out/"mlx.metallib")}
    (out/"build-identity.json").write_text(json.dumps(result,indent=2)+"\n")


if __name__ == "__main__":
    try:
        bind(Path(__file__).resolve().parent.parent, *sys.argv[1:])
    except ValueError as error:
        raise SystemExit(str(error))
````

## /tmp/slotstream-optimization-execution/serial-guard-recovery-v240/drivers/optimization_build.py

SHA-256 `dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f`; 4849 bytes.

````text
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
````

## /tmp/slotstream-optimization-execution/serial-guard-recovery-v240/drivers/optimization_serial_build.py

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

## /tmp/slotstream-optimization-execution/serial-guard-recovery-v240/drivers/optimization_serial_build_test.py

SHA-256 `d719866cd48ec6e53b56f563a3b2afd2709b553e55ca213757c4f16b8ebc48ac`; 8516 bytes.

````text
"""Pure limits plus cleanup of a tiny fixture process; no compiler or model."""
import json
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


if __name__ == '__main__':
    unittest.main()
````

## /tmp/slotstream-optimization-execution/serial-guard-recovery-v240/drivers/prefill_bench.py

SHA-256 `3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036`; 19176 bytes.

````text
#!/usr/bin/env python3
"""Paired inference experiments with raw results and exact token identities.

Repeat --arm NAME=EXECUTABLE for AB/BA order. A fresh process means empty
expert/prefix caches, not cold SSD: OS file cache is explicitly uncontrolled.
Failed, incomplete, and swapping runs are preserved and excluded.
"""
import argparse
import fcntl
import hashlib
import json
import math
import os
from pathlib import Path
import re
import signal
import statistics
import struct
import subprocess
import tarfile
import time

ROOT = Path(__file__).resolve().parent.parent
FIXTURES = ROOT / "Tools/fixtures/optimization"


def digest(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for part in iter(lambda: f.read(1024 * 1024), b""): h.update(part)
    return h.hexdigest()


def vm_snapshot(raw=None):
    raw = raw if raw is not None else subprocess.check_output(["vm_stat"], text=True)
    size = re.search(r"page size of (\d+) bytes", raw)
    if not size: raise ValueError("vm_stat page size missing")
    pages = {k.strip('"'): int(v) for k, v in re.findall(r'^([^:\n]+):\s+(\d+)\.', raw, re.M)}
    required = ("Pages free", "Pages purgeable", "File-backed pages", "Swapins", "Swapouts")
    if any(k not in pages for k in required): raise ValueError("vm_stat counters missing")
    return {"page_bytes": int(size[1]), "reclaimable_bytes": sum(pages[k] for k in required[:3]) * int(size[1]),
            "swapins": pages["Swapins"], "swapouts": pages["Swapouts"], "raw": raw}


class InsufficientHeadroom(RuntimeError):
    pass


def preflight(needed_gb):
    # Release before child launch; child reacquires atomically before allocation.
    with open(f"/tmp/slotstream-model-{os.getuid()}.lock", "a") as lock:
        try: fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as e: raise RuntimeError("another model process holds the lock") from e
    state = vm_snapshot()
    if state["reclaimable_bytes"] < needed_gb * 1e9:
        raise InsufficientHeadroom(f"{state['reclaimable_bytes']/1e9:.2f} GB reclaimable; need {needed_gb:.2f} GB")
    return state


def host_conditions():
    """Read-only observations outside timed intervals; unavailable is explicit.

    pmset's warning history is not an instantaneous thermal sensor. Preserve
    that distinction and do not infer energy or thermal headroom from it.
    """
    result = {"load_average_1_5_15_minutes": list(os.getloadavg()),
              "observed_at_unix_seconds": time.time(),
              "thermal_limit": "pmset warning/status history, not continuous temperature",
              "energy_joules": None}
    for key, command in [("power_source", ["pmset", "-g", "batt"]),
                         ("power_configuration", ["pmset", "-g", "custom"]),
                         ("thermal_status", ["pmset", "-g", "therm"])]:
        try:
            output = subprocess.run(command, capture_output=True, text=True, timeout=5)
            result[key] = {"exit_code": output.returncode, "stdout": output.stdout, "stderr": output.stderr}
        except (OSError, subprocess.TimeoutExpired) as e:
            result[key] = {"unavailable": f"{type(e).__name__}: {e}"}
    return result


def validate_metrics(d, *, allow_complete_prompt=False):
    if type(allow_complete_prompt) is not bool: raise ValueError("complete prompt permission must be Boolean")
    if d.get("schema_version") != 1: raise ValueError("unsupported schema")
    s = d["stats"]
    for k in ("prefillSeconds", "decodeSeconds", "requestSeconds", "imageEncodeSeconds"):
        if type(s.get(k)) not in (int, float) or not math.isfinite(s[k]) or s[k] < 0:
            raise ValueError(f"invalid {k}")
    for k in ("prefillRecords", "decodeRecords", "prefillTokens", "decodeTokens", "lifetimeRSSPeakBytes"):
        if type(s.get(k)) is not int or s[k] < 0: raise ValueError(f"invalid {k}")
    if s["prefillTokens"] == 0:
        if not allow_complete_prompt: raise ValueError("no completed prefill")
        if (type(s.get('promptTokens')) is not int or s['promptTokens'] <= 0
            or type(s.get('reusedPrefixTokens')) is not int or s['reusedPrefixTokens'] != s['promptTokens']
            or type(s.get('completePromptHits')) is not int or s['completePromptHits'] != 1
            or s['prefillRecords'] != 0 or s.get('prefillPasses') != []
            or s.get('prefillComputePasses') != []
            or type(s.get('prefillReadBytes')) is not int or s['prefillReadBytes'] != 0):
            raise ValueError("zero-prefill request lacks an exact complete-prompt hit and zero work")
    elif s["prefillSeconds"] <= 0: raise ValueError("no completed prefill")
    if sum(s["prefillPasses"]) != s["prefillTokens"]: raise ValueError("pass/token mismatch")
    if len(d["prompt_ids"]) != s["promptTokens"] or len(d["output_ids"]) != s["decodeTokens"]:
        raise ValueError("token identity/count mismatch")
    return s


def capture_sources(dest):
    files = sorted([*ROOT.glob("Sources/**/*.swift"), ROOT/"Package.swift", ROOT/"Package.resolved", ROOT/"Makefile"])
    with tarfile.open(dest/"source.tar.gz", "w:gz") as archive:
        for p in files: archive.add(p, arcname=str(p.relative_to(ROOT)))
    return {str(p.relative_to(ROOT)): digest(p) for p in files}


def model_identity(model):
    # This identifies headers/stat metadata, NOT full payload verification.
    result = {}
    for p in sorted(model.iterdir()):
        if p.suffix not in (".json", ".jinja", ".safetensors"): continue
        info = {"bytes": p.stat().st_size, "mtime_ns": p.stat().st_mtime_ns}
        if p.suffix == ".safetensors":
            with p.open("rb") as f:
                n = struct.unpack("<Q", f.read(8))[0]
                if n > 64*1024*1024 or n+8 > info["bytes"]: raise ValueError(f"invalid header: {p.name}")
                info["header_sha256"] = hashlib.sha256(f.read(n)).hexdigest()
        else: info["sha256"] = digest(p)
        result[p.name] = info
    if "config.json" not in result: raise ValueError("model config missing")
    return result


def terminate_child_tree(child):
    """Drain a timed-out child and the independently grouped descendants we
    can prove it owns. Never signal the caller's inherited process group."""
    groups = {child.pid}  # run_child starts a new session before exec.
    snapshot_error = None
    try:
        # Capture parent links before terminating the root. SwiftPM may put
        # Git/compiler descendants in independent sessions/process groups.
        rows = [tuple(map(int, line.split())) for line in subprocess.check_output(
            ['ps', '-axo', 'pid=,ppid=,pgid='], text=True, timeout=5).splitlines() if line.strip()]
        owned = {child.pid}
        while True:
            expanded = owned | {pid for pid, parent, _ in rows if parent in owned}
            if expanded == owned: break
            owned = expanded
        groups.update(group for pid, _, group in rows if pid in owned and group in owned)
    except (OSError, subprocess.SubprocessError, ValueError) as error:
        snapshot_error = error
    finally:
        def signal_owned(sig):
            for group in groups:
                try: os.killpg(group, sig)
                except ProcessLookupError: pass
        signal_owned(signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired: pass
        finally:
            # The root can exit while an independently grouped descendant
            # ignores TERM. Enumeration failure must not skip root cleanup.
            signal_owned(signal.SIGKILL)
            child.wait(timeout=5)
    if snapshot_error is not None:
        raise RuntimeError('child root drained, but descendant enumeration failed; full cleanup is unverified') from snapshot_error


def run_child(command, env, cell, timeout):
    with (cell/"stdout.txt").open("wb") as out, (cell/"stderr.txt").open("wb") as err:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=out, stderr=err, start_new_session=True)
        try: return child.wait(timeout=timeout)
        finally:
            if child.poll() is None: terminate_child_tree(child)


def paired_summary(rows, reference):
    groups = {}
    for row in rows:
        groups.setdefault((row["prompt"], row["chunk"], row["round"]), {})[row["arm"]] = row
    by_arm = {}
    for (prompt, chunk, round_number), arms in groups.items():
        for name, candidate in arms.items():
            if name == reference: continue
            result = by_arm.setdefault((prompt, chunk, name), {"pairs": [], "excluded_rounds": []})
            control = arms.get(reference)
            if not control or not control["valid"] or not candidate["valid"]:
                result["excluded_rounds"].append(round_number); continue
            a, b = control["metrics"], candidate["metrics"]
            if a["prompt_ids"] != b["prompt_ids"] or a["effective_pool_slots"] != b["effective_pool_slots"] or a.get("effective_mtp") != b.get("effective_mtp"):
                result["excluded_rounds"].append(round_number); continue
            result["pairs"].append({"round": round_number,
                "request_reduction_fraction": 1 - b["stats"]["requestSeconds"] / a["stats"]["requestSeconds"],
                "request_saved_seconds": a["stats"]["requestSeconds"] - b["stats"]["requestSeconds"],
                "output_ids_equal": a["output_ids"] == b["output_ids"]})
    result = []
    for (prompt, chunk, name), entry in sorted(by_arm.items()):
        pairs = entry["pairs"]
        result.append({"prompt": prompt, "chunk": chunk, "reference": reference, "candidate": name, **entry,
            "median_request_reduction_fraction": statistics.median(p["request_reduction_fraction"] for p in pairs) if pairs else None})
    return result


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--arm", action="append", help="NAME=EXECUTABLE (repeatable)")
    p.add_argument("--arm-env", action="append", default=[], help='NAME={"SLOTSTREAM_...":"value"}')
    p.add_argument("--arm-chunk", action="append", default=[], help="NAME=256..4096, explicit per-arm compute-pass override")
    p.add_argument("--label", default="baseline")
    p.add_argument("--mtp", choices=("off", "on"), default="off")
    p.add_argument("--rounds", type=int, default=3)
    p.add_argument("--chunks", default="256")
    p.add_argument("--prompts", default="short,prose")
    p.add_argument("--memory-gb", type=float, default=8.1)
    p.add_argument("--max-tokens", type=int, default=16)
    p.add_argument("--seed", type=int, default=7)
    p.add_argument("--sampled", action="store_true")
    p.add_argument("--sample-footprint", action="store_true")
    p.add_argument("--observe-arm", action="append", default=[], help="Enable footprint sampling only for this arm")
    p.add_argument("--model", type=Path, default=Path.home()/".slotstream/models/qwen38-flash-next-mlx-4bit")
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--timeout", type=int, default=1800)
    p.add_argument("--prepare-only", action="store_true")
    a = p.parse_args()
    if not (8.1 <= a.memory_gb <= 10 and a.rounds > 0 and a.max_tokens > 0 and a.timeout > 0):
        p.error("use an 8.1–10 GB target and positive rounds/output/timeout")
    chunks = [int(c) for c in a.chunks.split(",")]
    if any(c < 256 or c > 4096 for c in chunks): p.error("chunks must be within 256..4096")
    if len(chunks) != len(set(chunks)): p.error("chunks must be unique")
    arms = {}
    for arm in a.arm or [f"{a.label}=.build/release/slotstream"]:
        name, path = arm.split("=", 1)
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name) or name in arms: p.error("unique safe arm names required")
        arms[name] = Path(path).resolve()
    if any(name not in arms for name in a.observe_arm): p.error("observe-arm must name an arm")
    arm_chunks = {}
    for item in a.arm_chunk:
        name, value = item.split("=", 1)
        if name not in arms or name in arm_chunks or not value.isdecimal() or not 256 <= int(value) <= 4096:
            p.error("arm-chunk requires a unique arm and a 256..4096 integer")
        arm_chunks[name] = int(value)
    envs = {n: {} for n in arms}
    for item in a.arm_env:
        name, value = item.split("=", 1); values = json.loads(value)
        if name not in arms or not isinstance(values, dict) or any(not k.startswith("SLOTSTREAM_") or not isinstance(v, str) for k,v in values.items()):
            p.error("arm-env requires an arm and string SLOTSTREAM_ overrides")
        envs[name].update(values)
    prompts = {}
    for name in a.prompts.split(","):
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name): p.error("invalid fixture name")
        prompts[name] = FIXTURES/f"{name}.txt"
        if not prompts[name].is_file(): p.error(f"missing immutable fixture {name}")
    a.out = a.out.resolve(); a.out.mkdir(parents=True, exist_ok=False)
    # Preserve fixture bytes as well as hashes; a future source edit must not
    # make an old benchmark impossible to reconstruct.
    (a.out / "fixtures").mkdir()
    import shutil
    for name, fixture in list(prompts.items()):
        shutil.copyfile(fixture, a.out / "fixtures" / fixture.name)
        prompts[name] = a.out / "fixtures" / fixture.name
    identities = {}
    for name, binary in arms.items():
        identity_file = binary.parent / "build-identity.json"
        source_file = binary.parent / "build-source.tar.gz"
        identity = json.loads(identity_file.read_text())
        if identity["binary_sha256"] != digest(binary) or identity["metallib_sha256"] != digest(binary.parent / "mlx.metallib"):
            raise ValueError(f"{name}: executable/metallib does not match build identity")
        if identity["source_archive_sha256"] != digest(source_file):
            raise ValueError(f"{name}: source archive does not match build identity")
        shutil.copyfile(source_file, a.out / f"{name}-source.tar.gz")
        identities[name] = identity
    base_env = {k:v for k,v in os.environ.items() if not k.startswith(("SLOTSTREAM_", "SS_DEBUG"))}
    manifest = {"schema_version": 1, "head": subprocess.check_output(["git","rev-parse","HEAD"], cwd=ROOT, text=True).strip(),
                "worktree_source": capture_sources(a.out), "build_identities": identities, "model": model_identity(a.model),
                "arms": {n:{"binary":str(b),"sha256":digest(b),"metallib_sha256":digest(b.parent/"mlx.metallib"),"env":envs[n]} for n,b in arms.items()},
                "fixtures": {n:{"path":str(f),"sha256":digest(f)} for n,f in prompts.items()},
                "conditions": {"filesystem_cache":"uncontrolled; no purge","expert_cache":"empty per process","prefix_cache":"empty per process","mtp":a.mtp == "on"},
                "arguments": {k:str(v) if isinstance(v,Path) else v for k,v in vars(a).items()}}
    (a.out/"manifest.json").write_text(json.dumps(manifest,indent=2)+"\n")
    if a.prepare_only: print(json.dumps({"prepared":str(a.out)})); return
    rows = []
    for ri in range(a.rounds):
        order = list(arms) if ri%2 == 0 else list(reversed(arms))
        for pname,fixture in prompts.items():
            for chunk in chunks:
                for name in order:
                    cell = a.out/f"{ri+1}-{pname}-{chunk}-{name}"; cell.mkdir()
                    row = {"round":ri+1,"prompt":pname,"chunk":chunk,"arm":name,"valid":False}
                    effective_chunk = arm_chunks.get(name, chunk)
                    row["requested_effective_chunk"] = effective_chunk
                    env = base_env | envs[name] | {"SLOTSTREAM_PREFILL_CHUNK":str(effective_chunk)}
                    command = [str(arms[name]),"run","--raw","--prompt-file",str(fixture),"--model",str(a.model),
                               "--memory-gb",str(a.memory_gb),"--mtp",a.mtp,"--seed",str(a.seed),
                               "--max-tokens",str(a.max_tokens),"--stats-json",str(cell/"metrics.json")]
                    if not a.sampled: command.append("--greedy")
                    if a.sample_footprint or name in a.observe_arm: command.append("--sample-footprint")
                    row["command"] = command
                    row["environment"] = {k:v for k,v in env.items() if k.startswith("SLOTSTREAM_")}
                    try:
                        extra = max(0, (effective_chunk - 256) * 1.30e-3)
                        if env.get("SLOTSTREAM_OPT_LAYER_WORKSPACE") == "1": extra += 2.0
                        scope = int(env.get("SLOTSTREAM_OPT_READ_SCOPE", "0"))
                        if scope > 0: extra += max(0, scope - effective_chunk) * 1.30e-3 + 0.12
                        row["override_extra_allowance_gb"] = extra
                        row["host_before"] = host_conditions()
                        row["before"] = preflight(a.memory_gb+extra+3)
                        start = time.monotonic()
                        row["exit_code"] = run_child(command,env,cell,a.timeout)
                        row["wall_seconds"] = time.monotonic()-start; row["after"] = vm_snapshot()
                        row["host_after"] = host_conditions()
                        if row["exit_code"] != 0: raise ValueError(f"child exit {row['exit_code']}")
                        d = json.loads((cell/"metrics.json").read_text()); validate_metrics(d)
                        if d["effective_prefill_chunk"] != effective_chunk or d["effective_mtp"] != (a.mtp == "on"): raise ValueError("effective configuration differs")
                        row["metrics"] = d
                        if any(row["after"][k] != row["before"][k] for k in ("swapins","swapouts")):
                            raise ValueError("swap activity during cell; timing excluded")
                        row["valid"] = True
                    except (OSError,ValueError,KeyError,RuntimeError,subprocess.TimeoutExpired) as e: row["exclusion"] = str(e)
                    (cell/"result.json").write_text(json.dumps(row,indent=2)+"\n")
                    with (a.out/"results.jsonl").open("a") as f: f.write(json.dumps(row)+"\n")
                    rows.append(row)
                    print(json.dumps({k:v for k,v in row.items() if k not in ("metrics","before","after","command","environment","host_before","host_after")}),flush=True)
    groups = {}
    for row in rows:
        if row["valid"]: groups.setdefault((row["prompt"],row["chunk"],row["arm"]),[]).append(row)
    summary = [{"prompt":k[0],"chunk":k[1],"arm":k[2],"valid_rounds":len(rs),
                "median_prefill_seconds":statistics.median(r["metrics"]["stats"]["prefillSeconds"] for r in rs),
                "median_request_seconds":statistics.median(r["metrics"]["stats"]["requestSeconds"] for r in rs),
                "prefill_records":[r["metrics"]["stats"]["prefillRecords"] for r in rs]} for k,rs in sorted(groups.items())]
    (a.out/"summary.json").write_text(json.dumps(summary,indent=2)+"\n")
    (a.out/"paired-summary.json").write_text(json.dumps(paired_summary(rows, next(iter(arms))), indent=2)+"\n")
    if not all(r["valid"] for r in rows): raise SystemExit(1)


if __name__ == "__main__": main()
````

## /tmp/slotstream-optimization-execution/serial-guard-recovery-v240/drivers/serve_bench.py

SHA-256 `31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb`; 60039 bytes.

````text
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import argparse
import base64
import fcntl
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import re
import shutil
import signal
import socket
import statistics
import subprocess
import time
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot, InsufficientHeadroom


def contention_guard(protocol):
    value = protocol.get('stop_on_workspace_contention', False)
    if type(value) is not bool: raise ValueError('workspace contention guard must be Boolean')
    return value


def competing_job_kind(executable, arguments):
    name = Path(executable).name
    if name == 'slotstream':
        prefix = executable if arguments.startswith(executable) else arguments.split(' ', 1)[0]
        if re.match(re.escape(prefix) + r'\s+pull(?:\s|$)', arguments): return 'checkpoint pull'
    if name in ['download-harness', 'slotstream-pull-bench']:
        return 'checkpoint download test'
    if name.lower().startswith('python') and re.search(
        r'(?:^|[ /])Tools/slotpack/(?:full_pull|publish_r2|pack|checks|download_checks|memory_checks|cli_checks|raw_checks)\.py(?:\s|$)', arguments):
        return 'checkpoint transport or packaging job'
    if name in ['swift-frontend', 'swiftc', 'swift-build']:
        return 'Swift build'
    return None


def competing_jobs(run=subprocess.run):
    """Read known long storage/build jobs. Never persist argv: it may contain
    private URLs or credentials. A snapshot is not continuous host isolation."""
    result = run(['ps', '-axo', 'pid=,comm='], capture_output=True, text=True, check=True, timeout=5)
    candidates = {}
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid, executable = int(fields[0]), fields[1]
        name = Path(executable).name
        if (pid != os.getpid() and (name.lower().startswith('python') or name in
            ['slotstream', 'download-harness', 'slotstream-pull-bench', 'swift-frontend', 'swiftc', 'swift-build'])):
            candidates[pid] = executable
    if not candidates: return []
    result = run(['ps', '-ww', '-p', ','.join(map(str, candidates)), '-o', 'pid=,args='],
                 capture_output=True, text=True, timeout=5)
    # A process can exit between snapshots. Other failures remain fail closed.
    if result.returncode not in (0, 1): raise RuntimeError('cannot inspect competing process arguments')
    jobs = []
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid = int(fields[0]); executable = candidates.get(pid)
        if executable is None: continue
        kind = competing_job_kind(executable, fields[1])
        if kind is not None: jobs.append({'pid': pid, 'executable': executable, 'kind': kind})
    return jobs


def workspace_quiet_requirement(protocol):
    value = protocol.get('initial_workspace_quiet')
    if value is None: return None
    if (type(value) is not dict or set(value) != {'stable_seconds', 'maximum_wait_seconds'}
        or not contention_guard(protocol)
        or type(value['stable_seconds']) is not int or not 1 <= value['stable_seconds'] <= 600
        or type(value['maximum_wait_seconds']) is not int
        or not value['stable_seconds'] <= value['maximum_wait_seconds'] <= 1800):
        raise ValueError('initial quiet interval requires the contention guard and bounded integer durations')
    return value


def wait_for_quiet_workspace(requirement, *, check=competing_jobs, now=time.monotonic, sleep=time.sleep):
    """A sampled quiet precondition before the study, never a timing cell.
    A newly observed known job resets the interval; time alone grants no pass."""
    started = now(); quiet_since = None; samples = blocked = 0; notified = started - 30
    while True:
        jobs = check(); current = now(); samples += 1
        if jobs:
            quiet_since = None; blocked += 1
        elif quiet_since is None:
            quiet_since = current
        quiet = 0 if quiet_since is None else current - quiet_since
        elapsed = current - started
        if quiet >= requirement['stable_seconds']:
            return {'wait_seconds': elapsed, 'quiet_seconds': quiet, 'samples': samples,
                    'samples_with_competing_work': blocked,
                    'classification': 'sampled known-job quiet interval, not continuous host isolation'}
        if elapsed >= requirement['maximum_wait_seconds']:
            raise TimeoutError('known workspace jobs did not leave the required quiet interval; no model launched')
        if current - notified >= 30:
            print(json.dumps({'phase': 'waiting for initial quiet workspace', 'seconds': round(elapsed, 1),
                              'quiet_seconds': round(quiet, 1), 'known_jobs': len(jobs)}), flush=True)
            notified = current
        sleep(min(2, requirement['maximum_wait_seconds'] - elapsed))


def fixed_pool_budget(protocol):
    """Explicit bounded mechanism study; memory_gb remains the measured ceiling.

    The native raw-pool control retains640slots when vision loads. This does
    not assert that the target-driven planner would choose the same pool.
    """
    if 'fixed_pool_slots' not in protocol:
        return None
    if type(protocol['fixed_pool_slots']) is not int or protocol['fixed_pool_slots'] != 640:
        raise ValueError('this fixed-pool mechanism study supports exactly640slots')
    if protocol.get('comparison_basis') != 'fixed-pool':
        raise ValueError('an explicit pool requires an explicit fixed-pool comparison')
    return 640 * 2_764_800 / 1e9


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if any(k in protocol for k in ['large_pool_measurement', 'large_scope_measurement', 'large_vision_measurement']):
            raise ValueError('large-memory declaration requires a target above 10 GB')
        return memory + 3
    vision_study = protocol.get('large_vision_measurement')
    if vision_study is not None:
        if ('large_pool_measurement' in protocol or 'large_scope_measurement' in protocol
            or not isinstance(vision_study, dict) or not isinstance(vision_study.get('purpose'), str)
            or not vision_study['purpose'].strip()):
            raise ValueError('choose one explicit large-vision measurement purpose')
        if (memory != 12 or fixed_pool_budget(protocol) is None
            or type(protocol.get('max_tokens')) is not int or protocol['max_tokens'] != 1
            or protocol.get('mtp') != 'off' or protocol.get('prefix_cache') is not None
            or not isinstance(protocol.get('images'), list) or len(protocol['images']) != 1):
            raise ValueError('large-vision mechanism study requires12GB,640slots,one image/one output, MTP and prefix reuse off')
        if (protocol.get('abort_on_resource_failure') is not True
            or protocol.get('require_nominal_power_state') is not True
            or type(protocol.get('maximum_sampled_footprint_bytes')) is not int
            or protocol['maximum_sampled_footprint_bytes'] != 12_000_000_000):
            raise ValueError('large-vision study requires exact12GB ceiling, nominal state and immediate resource stop')
        return memory + 6
    scope_study = protocol.get('large_scope_measurement')
    if scope_study is not None and 'large_pool_measurement' in protocol:
        raise ValueError('choose one declared large-memory study')
    study = scope_study if scope_study is not None else protocol.get('large_pool_measurement')
    if not isinstance(study, dict) or not isinstance(study.get('purpose'), str) or not study['purpose'].strip():
        raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
    if protocol.get('abort_on_resource_failure') is not True or protocol.get('require_nominal_power_state') is not True:
        raise ValueError('large-pool measurements require immediate resource stop and nominal operating conditions')
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if type(limit) is not int or limit != round(memory * 1e9):
        raise ValueError('large-pool measurements require an exact footprint limit at the memory target')
    if protocol.get('raw', True) is not True or protocol['max_tokens'] > 64:
        raise ValueError('large-pool component isolation permits raw text and at most 64 output tokens')
    if scope_study is not None:
        if memory != 16 or protocol['max_tokens'] > 4:
            raise ValueError('larger-scope qualification requires exactly16GB and at most4outputs')
        for arm in protocol['arms'].values():
            if (arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE','0') not in ['0','1024']
                or arm['env'].get('SLOTSTREAM_OPT_WORKSPACE_TILE','256') != '256'):
                raise ValueError('larger-scope qualification retains256-row compute and at most1024read scope')
        return memory + 6
    for arm in protocol['arms'].values():
        if arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE', '0') != '0' or arm['env'].get('SLOTSTREAM_OPT_LAYER_WORKSPACE', '0') != '0':
            raise ValueError('large-pool isolation requires ordinary bounded 256-row passes')
    return memory + 6


def workload_exclusions(stats, protocol):
    required = protocol.get('require_all_expert_hits', False)
    if type(required) is not bool: raise ValueError('require_all_expert_hits must be Boolean')
    if not required: return []
    if any(type(stats.get(k)) is not int or stats[k] != 0 for k in ['prefillRecords', 'decodeRecords']):
        return ['declared all-hit workload performed expert reads or lacks exact read counts']
    return []


def prefix_study(protocol):
    study = protocol.get('prefix_cache')
    if study is None: return None
    if (type(study) is not dict or 'expected_reused_tokens' not in study
        or not set(study) <= {'expected_reused_tokens', 'complete_prompt', 'retention_only', 'partial_prefix',
                             'expected_warmup_checkpoint_stores'}
        or type(study.get('complete_prompt', False)) is not bool
        or type(study.get('retention_only', False)) is not bool
        or type(study.get('partial_prefix', False)) is not bool):
        raise ValueError('prefix_cache requires an explicit expected_reused_tokens map')
    expected = study['expected_reused_tokens']
    if type(expected) is not dict or set(expected) != set(protocol['arms']):
        raise ValueError('prefix reuse expectations must cover exactly every arm')
    if any(type(n) is not int or not 0 <= n <= 4096 for n in expected.values()):
        raise ValueError('prefix reuse expectations must be integer counts from zero to 4096')
    stores = study.get('expected_warmup_checkpoint_stores')
    if 'expected_warmup_checkpoint_stores' in study:
        if (not study.get('complete_prompt', False) or type(stores) is not dict
            or set(stores) != set(protocol['arms'])
            or any(type(n) is not int or n not in [0, 1] for n in stores.values())
            or stores.get('reference') != 0):
            raise ValueError('combined complete-prompt warmup stores require exact zero/one counts for every arm')
    if study.get('partial_prefix', False):
        if (study.get('retention_only', False) or study.get('complete_prompt', False)
            or expected.get('reference') != 0 or not any(expected.values())
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('partial-prefix study requires distinct frozen warmup and positive strict reuse')
    if study.get('retention_only', False):
        if (any(expected.values()) or study.get('complete_prompt', False)
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('retention-only study requires zero reuse and a separately frozen warmup fixture')
    elif expected['reference'] != 0 or not any(expected.values()):
        raise ValueError('prefix study requires zero reference reuse and a positive candidate')
    return expected


def warmup_fixture(protocol, measured_fixture):
    """A distinct input makes unique-request retention cost measurable while
    keeping prefix caching enabled. Existing studies warm the measured input."""
    fields = {'warmup_fixture', 'warmup_fixture_sha256'}
    supplied = fields.intersection(protocol)
    if not supplied: return measured_fixture
    study = protocol.get('prefix_cache') or {}
    if (supplied != fields or not (study.get('retention_only', False) or study.get('partial_prefix', False))
        or protocol['memory_gb'] > 10 or protocol.get('raw', True) is not True):
        raise ValueError('separate warmup requires a bounded raw retention or partial-prefix study')
    if any(type(protocol[k]) is not str or not protocol[k] for k in fields):
        raise ValueError('warmup path and hash must be nonempty strings')
    fixture = Path(protocol['warmup_fixture']).resolve()
    if digest(fixture) != protocol['warmup_fixture_sha256']: raise ValueError('warmup fixture identity mismatch')
    if not 1 <= fixture.stat().st_size <= 32768 or fixture.read_bytes() == measured_fixture.read_bytes():
        raise ValueError('warmup must be bounded, nonempty and distinct from the measured fixture')
    return fixture


def work_constraints(protocol):
    constraints = protocol.get('work_constraints')
    if constraints is None: return None
    allowed = {'prefillSlotCPUBatches', 'decodeSlotCPUBatches', 'decodeModelTokens',
               'decodeForwardPasses', 'prefillTokens', 'decodeTokens', 'verifyPasses',
               'draftedTokens', 'prefillRecords', 'decodeRecords', 'completePromptHits', 'completePromptStores',
               'ngramCachedRows', 'ngramCachePayloadBytes', 'ngramRowHits', 'ngramRowMisses',
               'encodedImages', 'reusedImageFeatures', 'prefixSkippedImages', 'visionQueryTile', 'visionQueryTileCalls', 'residentExpertPrelaunches', 'residentExpertJoins', 'fusedRoPERotationsScheduled', 'ropeTableHits', 'ropeTableBuilds', 'terminalQueryRowsSkipped', 'fusedGDNProjectionsScheduled', 'packedGDNProjectionLayers', 'packedGDNProjectionPayloadBytes'}
    if type(constraints) is not dict or set(constraints) != set(protocol['arms']):
        raise ValueError('work constraints must cover exactly every arm')
    for counters in constraints.values():
        if type(counters) is not dict or not counters or not set(counters) <= allowed:
            raise ValueError('unknown or empty work constraint counters')
        reader_pair = {'residentExpertPrelaunches', 'residentExpertJoins'}
        if set(counters) & reader_pair and not reader_pair <= set(counters):
            raise ValueError('resident overlap requires both submission and completed-join counters')
        for bounds in counters.values():
            if type(bounds) is not dict or not bounds or not set(bounds) <= {'min', 'max'}:
                raise ValueError('work bounds require min and/or max')
            if any(type(v) is not int or v < 0 for v in bounds.values()):
                raise ValueError('work bounds must be nonnegative integers')
            if bounds.get('min', 0) > bounds.get('max', float('inf')):
                raise ValueError('work minimum exceeds maximum')
    return constraints


def validate_work_observation(constraints, arm, stats):
    if constraints is None: return
    for counter, bounds in constraints[arm].items():
        value = stats.get(counter)
        if type(value) is not int or value < bounds.get('min', 0) or value > bounds.get('max', float('inf')):
            raise ValueError(f'{arm} work counter {counter} violates its frozen bounds')
    if 'residentExpertPrelaunches' in constraints[arm] and stats['residentExpertPrelaunches'] != stats['residentExpertJoins']:
        raise ValueError(f'{arm} submitted resident work without the same number of completed joins')


def cell_cooldown(protocol):
    value = protocol.get('between_cells_seconds', 0)
    if type(value) not in (int, float) or not math.isfinite(value) or not 0 <= value <= 60:
        raise ValueError('between_cells_seconds must be finite and between zero and 60')
    return value


def reservation_wait_limit(protocol):
    value = protocol.get('model_reservation_wait_seconds',0)
    if type(value) is not int or not 0 <= value <= 1800:
        raise ValueError('model_reservation_wait_seconds must be an integer from zero to1800')
    return value


def reserved_cooldown(seconds, wait_limit, lock_path=None):
    """Keep another model from heating the machine during a declared cooldown.

    Release before ordinary preflight/child launch. The native guard remains
    authoritative if another caller wins that handoff; no guard is bypassed.
    """
    if wait_limit == 0:
        time.sleep(seconds)
        return {'reserved':False,'wait_seconds':0}
    started=time.monotonic(); notified=-30.0
    with open(lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
        while True:
            try:
                fcntl.flock(lock,fcntl.LOCK_EX | fcntl.LOCK_NB)
                break
            except BlockingIOError:
                elapsed=time.monotonic()-started
                if elapsed >= wait_limit: raise TimeoutError('other model retained the lock beyond the declared reservation wait')
                if elapsed-notified >= 30:
                    print(json.dumps({'phase':'waiting for model reservation','seconds':round(elapsed,1)}),flush=True)
                    notified=elapsed
                time.sleep(min(2,wait_limit-elapsed))
        waited=time.monotonic()-started
        time.sleep(seconds)
        return {'reserved':True,'wait_seconds':waited}


def validate_prefix_observation(expected, name, warm, measured, *, complete_prompt=False, retention_only=False,
                                partial_prefix=False, warmup_checkpoint_stores=None):
    want = expected[name] if expected is not None else 0
    stats = measured['stats']
    if stats.get('reusedPrefixTokens') != want:
        raise ValueError('observed prefix reuse differs from the frozen workload')
    if expected is None: return
    if warm['stats'].get('reusedPrefixTokens') != 0:
        raise ValueError('fresh-server warmup unexpectedly reused state')
    if retention_only and (want != 0 or warm['prompt_ids'] == measured['prompt_ids']):
        raise ValueError('retention-only request must be unique and reuse zero tokens')
    if partial_prefix:
        if (warm['prompt_ids'] == measured['prompt_ids'] or stats.get('completePromptHits') != 0
            or warm['stats'].get('completePromptHits') != 0):
            raise ValueError('partial-prefix observation must have a different tail and no complete hit')
    full = complete_prompt and want > 0
    if ((len(measured['prompt_ids']) != want if full else len(measured['prompt_ids']) <= want)
        or warm['prompt_ids'][:want] != measured['prompt_ids'][:want]):
        raise ValueError('warmup did not create the measured strict prefix')
    if stats.get('prefixCheckpointForks') != int(want > 0):
        raise ValueError('measured request did not use the declared checkpoint fork')
    stores = (warmup_checkpoint_stores[name] if warmup_checkpoint_stores is not None
              else int(want > 0 and not full))
    if warm['stats'].get('prefixCheckpointStores') != stores:
        raise ValueError('warmup did not create the declared checkpoint')
    if complete_prompt:
        if (stats.get('completePromptHits') != int(full)
            or warm['stats'].get('completePromptStores') != int(full)
            or warm['stats'].get('completePromptHits') != 0
            or (full and warm['prompt_ids'] != measured['prompt_ids'])):
            raise ValueError('complete prompt identity or retained-logit mechanism differs')
    for sample in [warm['stats'], stats]:
        if sample.get('prefixCheckpointErrors') != 0 or sample.get('prefixCheckpointRefusals') != 0:
            raise ValueError('checkpoint retention failed or exceeded its budget')


def wait_for_headroom(needed_gb, seconds):
    if type(seconds) not in (int, float) or not math.isfinite(seconds) or not 0 <= seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    start = time.monotonic()
    attempts = 0
    while True:
        attempts += 1
        try:
            snapshot = preflight(needed_gb)
            return snapshot, {'seconds': time.monotonic()-start, 'checks': attempts, 'limit_seconds': seconds}
        except InsufficientHeadroom:
            remaining = seconds - (time.monotonic()-start)
            if remaining <= 0: raise
            time.sleep(min(.25, remaining))


def image_fixtures(protocol):
    """Bounded, content-pinned inline images. Never resolve an image URL."""
    if 'images' not in protocol: return []
    images = protocol['images']
    if (type(images) is not list or not 1 <= len(images) <= 4
        or protocol.get('raw', True) is not False):
        raise ValueError('image study requires one to four images and templates')
    if protocol.get('memory_gb', 0) > 10:
        if protocol.get('large_vision_measurement') is None:
            raise ValueError('image study above 10 GB requires the bounded large-vision declaration')
        # Reuse the complete capacity contract before reading any image. A
        # declared purpose alone cannot bypass pool, output or resource guards.
        measurement_memory(protocol)
    result = []; total = 0
    for entry in images:
        if (type(entry) is not dict or set(entry) != {'path', 'sha256'}
            or type(entry['path']) is not str or not entry['path']
            or type(entry['sha256']) is not str):
            raise ValueError('image fixture requires an explicit path and SHA-256')
        path = Path(entry['path']).resolve()
        if not path.is_file() or not 1 <= path.stat().st_size <= 8 << 20:
            raise ValueError('image fixture is missing, empty or exceeds 8 MiB')
        with path.open('rb') as source: data = source.read((8 << 20) + 1)
        total += len(data)
        if not 1 <= len(data) <= 8 << 20 or total > 16 << 20 or hashlib.sha256(data).hexdigest() != entry['sha256']:
            raise ValueError('image identity differs or total exceeds 16 MiB')
        result.append((path, data))
    return result


def request_body(protocol, prompt, *, images=None):
    raw = protocol.get('raw', True)
    if type(raw) is not bool: raise ValueError('raw must be Boolean')
    body = {'prompt': prompt, 'raw': raw, 'stream': True,
            'options': {'temperature': 0, 'num_predict': protocol['max_tokens'], 'seed': protocol['seed']}}
    sampling = protocol.get('sampling', {})
    allowed = {'temperature', 'top_p', 'top_k', 'min_p', 'presence_penalty'}
    if type(sampling) is not dict or not set(sampling) <= allowed:
        raise ValueError('sampling must contain only declared sampler parameters')
    for key, value in sampling.items():
        if key == 'top_k':
            if type(value) is not int or not 0 <= value <= 248320:
                raise ValueError('top_k must be an integer in the pinned vocabulary range')
        elif type(value) not in (int, float) or not math.isfinite(value):
            raise ValueError(f'{key} must be a finite number')
        elif key == 'temperature' and not 0 <= value <= 10:
            raise ValueError('temperature must be between zero and ten')
        elif key == 'top_p' and not 0 < value <= 1:
            raise ValueError('top_p must be positive and at most one')
        elif key == 'min_p' and not 0 <= value <= 1:
            raise ValueError('min_p must be between zero and one')
        elif key == 'presence_penalty' and not -10 <= value <= 10:
            raise ValueError('presence_penalty must be between minus ten and ten')
    body['options'].update(sampling)
    if 'think' in protocol:
        if type(protocol['think']) is not bool: raise ValueError('think must be Boolean')
        if raw: raise ValueError('think is a template setting; use raw=false')
        body['think'] = protocol['think']
    if images is None: images = image_fixtures(protocol)
    if images:
        body['images'] = [base64.b64encode(data).decode('ascii') for _, data in images]
    return json.dumps(body).encode()


def resource_exclusions(stats, protocol):
    reasons = []
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if limit is not None:
        if type(limit) is not int or limit <= 0: raise ValueError('footprint limit must be a positive integer')
        observation = stats.get('sampledFootprint')
        peak = observation.get('peakBytes') if isinstance(observation, dict) else None
        if type(peak) is not int or peak <= 0:
            reasons.append('declared footprint gate has no valid sampled measurement')
        elif peak > limit:
            reasons.append('sampled physical footprint exceeds declared byte limit')
    require_nominal = protocol.get('require_nominal_power_state', False)
    if type(require_nominal) is not bool: raise ValueError('require_nominal_power_state must be Boolean')
    if require_nominal:
        for key in ['generatorSystemBefore', 'generatorSystemAfter']:
            state = stats.get(key)
            if not isinstance(state, dict) or state.get('thermalState') != 'nominal' or state.get('lowPowerModeEnabled') is not False:
                reasons.append('generator OS thermal/power state unavailable or non-nominal')
                break
    if protocol.get('images'):
        preparation = stats.get('imagePreparation') or {}
        observed = preparation.get('sampledFootprint') or {}
        image_peak = observed.get('peakBytes')
        if (type(image_peak) is not int or image_peak <= 0
            or type(observed.get('samples')) is not int or observed['samples'] <= 0):
            reasons.append('image preparation footprint observation missing')
        elif limit is not None and image_peak > limit:
            reasons.append('image preparation exceeds declared byte limit')
        for key in ['seconds', 'sourceDecodeSeconds', 'towerReadySeconds']:
            value = preparation.get(key)
            if type(value) not in (int, float) or not math.isfinite(value) or value < 0:
                reasons.append('image preparation timer missing or invalid')
                break
    return reasons


def exchange(port, body, timeout, *, allow_complete_prompt=False):
    conn = http.client.HTTPConnection('127.0.0.1', port, timeout=timeout)
    wire = bytearray(); frames = []
    first_delta = first_visible = None
    started = time.monotonic()
    try:
        conn.request('POST', '/api/generate', body, {'Content-Type':'application/json'})
        response = conn.getresponse()
        headers_at = time.monotonic() - started
        if response.status != 200:
            raise ValueError(f'HTTP {response.status}: {response.read(8192)!r}')
        while True:
            line = response.readline(1 << 20)
            if not line: break
            wire += line
            if len(wire) > 8 << 20: raise ValueError('response exceeds bounded capture')
            if not line.strip(): continue
            frame = json.loads(line); frames.append(frame)
            elapsed = time.monotonic() - started
            if first_delta is None and not frame.get('done') and (frame.get('response') or frame.get('thinking')):
                first_delta = elapsed
            if first_visible is None and frame.get('response', '').strip(): first_visible = elapsed
        elapsed = time.monotonic() - started
    finally: conn.close()
    finals = [f for f in frames if f.get('done')]
    if len(finals) != 1 or frames[-1] is not finals[0]: raise ValueError('missing or malformed completion framing')
    details = {'schema_version':1, **finals[0]['slotstream_benchmark']}
    validate_metrics(details, allow_complete_prompt=allow_complete_prompt)
    return {'client_seconds':elapsed, 'headers_seconds':headers_at,
            'first_protocol_delta_seconds':first_delta, 'first_visible_text_seconds':first_visible,
            'text':''.join(f.get('response','') for f in frames), 'metrics':details}, bytes(wire)


def stop_server(child):
    if child.poll() is None:
        os.killpg(child.pid, signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired:
            os.killpg(child.pid, signal.SIGKILL); child.wait()


def wait_ready(child, port):
    deadline = time.monotonic() + 120
    while time.monotonic() < deadline:
        if child.poll() is not None: raise RuntimeError(f'server exited {child.returncode}')
        conn = http.client.HTTPConnection('127.0.0.1', port, timeout=1)
        try:
            conn.request('GET','/api/version')
            response = conn.getresponse(); response.read(4096)
            if response.status == 200: return
        except (OSError, http.client.HTTPException): pass
        finally: conn.close()
        time.sleep(.25)
    raise TimeoutError('server startup timeout')


def sampled_request_peak(stats):
    """Highest sampled process footprint across generation and image preparation.

    These are successive intervals of the same process, so take their maximum,
    never their sum. Missing declared-stage evidence cannot prove a saving.
    """
    observations = [stats.get('sampledFootprint')]
    if 'imagePreparation' in stats:
        preparation = stats['imagePreparation']
        if not isinstance(preparation, dict): return None
        observations.append(preparation.get('sampledFootprint'))
    peaks = [value.get('peakBytes') if isinstance(value, dict) else None for value in observations]
    return max(peaks) if all(type(value) is int and value > 0 for value in peaks) else None


def summaries(rows, reference, comparison_basis='fixed-pool', required_equal_work=None):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
    fields = [] if required_equal_work is None else required_equal_work
    allowed = {'prefillRecords', 'decodeRecords', 'prefillTokens', 'decodeTokens',
               'decodeForwardPasses', 'decodeModelTokens', 'draftedTokens', 'verifyPasses',
               'ngramCachedRows', 'ngramRowHits', 'ngramRowMisses'}
    if (type(fields) is not list or any(type(k) is not str or k not in allowed for k in fields)
            or len(fields) != len(set(fields))):
        raise ValueError('required_equal_work must contain unique supported work counters')
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round']==number}
            a,b = arms.get(reference),arms.get(candidate)
            if not a or not b or not a['valid'] or not b['valid']:
                excluded.append(number); continue
            am,bm = a['metrics'],b['metrics']
            equal_fields = ['prompt_ids', 'effective_mtp']
            if comparison_basis == 'fixed-pool': equal_fields.append('effective_pool_slots')
            if any(am[k]!=bm[k] for k in equal_fields):
                excluded.append(number); continue
            if any(type(am['stats'].get(k)) is not int or am['stats'][k] < 0
                   or type(bm['stats'].get(k)) is not int or am['stats'][k] != bm['stats'][k]
                   for k in fields):
                excluded.append(number); continue
            aseq, bseq = am['stats'].get('allocatedSequenceBytes'), bm['stats'].get('allocatedSequenceBytes')
            aactive, bactive = am['stats'].get('mlxActiveEndBytes'), bm['stats'].get('mlxActiveEndBytes')
            apeak = sampled_request_peak(am['stats'])
            bpeak = sampled_request_peak(bm['stats'])
            sequence_ok = all(type(v) is int and v > 0 for v in [aseq, bseq])
            active_ok = all(type(v) is int and v > 0 for v in [aactive, bactive])
            peak_ok = all(type(v) is int and v > 0 for v in [apeak, bpeak])
            pairs.append({'round':number,'client_reduction_fraction':1-b['client_seconds']/a['client_seconds'],
                'generator_reduction_fraction':1-bm['stats']['requestSeconds']/am['stats']['requestSeconds'],
                'sequence_reduction_fraction': 1-bseq/aseq if sequence_ok else None,
                'active_savings_share': (aactive-bactive)/(aseq-bseq) if sequence_ok and active_ok and aseq > bseq else None,
                'active_savings_bytes': aactive-bactive if active_ok else None,
                'sampled_peak_savings_bytes': apeak-bpeak if peak_ok else None,
                'output_ids_equal':am['output_ids']==bm['output_ids'], 'wire_text_equal':a['text']==b['text']})
        result.append({'reference':reference,'candidate':candidate,'comparison_basis':comparison_basis,
            'pairs':pairs,'excluded_rounds':excluded,
            'median_client_reduction_fraction':statistics.median(p['client_reduction_fraction'] for p in pairs) if pairs else None,
            'median_generator_reduction_fraction':statistics.median(p['generator_reduction_fraction'] for p in pairs) if pairs else None})
    return result


def acceptance_results(summary, contract):
    """Apply the frozen criterion without turning missing/unequal work into a win."""
    if contract is None: return None
    count = contract['minimum_pairs']
    non_regression = 'maximum_median_client_regression' in contract
    if non_regression and 'minimum_median_client_reduction' in contract:
        raise ValueError('choose one latency acceptance criterion')
    reduction_key = 'maximum_median_client_regression' if non_regression else 'minimum_median_client_reduction'
    reduction = contract[reduction_key]
    positive = contract['minimum_positive_fraction']
    if type(count) is not int or count < 1: raise ValueError('minimum_pairs must be a positive integer')
    for name, value in [(reduction_key, reduction), ('minimum_positive_fraction', positive)]:
        if type(value) not in [int, float] or not 0 <= value <= 1: raise ValueError(name + ' must be finite and in [0,1]')
    for key in ['minimum_sequence_reduction', 'minimum_active_savings_share']:
        if key in contract and (type(contract[key]) not in [int, float] or not 0 <= contract[key] <= 1):
            raise ValueError(key + ' must be finite and in [0,1]')
    for key in ['minimum_active_savings_bytes', 'minimum_sampled_peak_savings_bytes']:
        if key in contract and (type(contract[key]) is not int or contract[key] <= 0):
            raise ValueError(key + ' must be a positive integer')
    if contract.get('all_outputs_exact') is not True: raise ValueError('this acceptance contract requires exact outputs')
    result = []
    for item in summary:
        pairs = item['pairs']
        checks = {
            'minimum_pairs': len(pairs) >= count,
            ('median_client_non_regression' if non_regression else 'median_client_reduction'):
                item['median_client_reduction_fraction'] is not None
                and item['median_client_reduction_fraction'] >= (-reduction if non_regression else reduction),
            'positive_fraction': bool(pairs) and sum(p['client_reduction_fraction'] > 0 for p in pairs) / len(pairs) >= positive,
            'exact_outputs': bool(pairs) and all(p['output_ids_equal'] and p['wire_text_equal'] for p in pairs),
        }
        for criterion, metric in [('minimum_sequence_reduction', 'sequence_reduction_fraction'),
                                  ('minimum_active_savings_share', 'active_savings_share'),
                                  ('minimum_active_savings_bytes', 'active_savings_bytes'),
                                  ('minimum_sampled_peak_savings_bytes', 'sampled_peak_savings_bytes')]:
            if criterion in contract:
                values = [p.get(metric) for p in pairs]
                checks[criterion] = bool(values) and all(type(v) in [int, float] and math.isfinite(v)
                    and v >= contract[criterion] for v in values)
        result.append({'candidate': item['candidate'], 'passed': all(checks.values()), 'checks': checks})
    return result


def startup_summaries(rows, reference):
    """Fresh-process costs are separate from warmed request acceptance.

    Amortization uses a paired first-job excess divided by a positive paired
    steady-request saving. It is an estimate for repeating this exact job,
    never a claim about a cold filesystem or a different request mix.
    """
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round'] == number}
            a,b = arms.get(reference),arms.get(candidate)
            first_a,first_b = (a or {}).get('first_request'),(b or {}).get('first_request')
            if (not a or not b or not a['valid'] or not b['valid'] or not first_a or not first_b
                or not a.get('startup_and_warmup_valid') or not b.get('startup_and_warmup_valid')):
                excluded.append(number); continue
            fields = ['prompt_ids','output_ids','text','effective_pool_slots','effective_mtp']
            if any(first_a.get(k) != first_b.get(k) or first_a.get(k) is None for k in fields):
                excluded.append(number); continue
            durations = [a.get('startup_seconds'),b.get('startup_seconds'),
                         first_a.get('complete_seconds_from_launch'),first_b.get('complete_seconds_from_launch'),
                         a.get('client_seconds'),b.get('client_seconds')]
            if any(type(x) not in [float,int] or not math.isfinite(x) or x <= 0 for x in durations):
                excluded.append(number); continue
            excess = first_b['complete_seconds_from_launch']-first_a['complete_seconds_from_launch']
            saving = a['client_seconds']-b['client_seconds']
            pairs.append({'round':number,'startup_excess_seconds':b['startup_seconds']-a['startup_seconds'],
                          'first_job_excess_seconds':excess,'steady_request_saving_seconds':saving,
                          'estimated_total_jobs_to_amortize':1+math.ceil(max(0,excess)/saving) if saving > 0 else None})
        result.append({'candidate':candidate,'pairs':pairs,'excluded_rounds':excluded,
                       'median_startup_excess_seconds':statistics.median(p['startup_excess_seconds'] for p in pairs) if pairs else None,
                       'median_first_job_excess_seconds':statistics.median(p['first_job_excess_seconds'] for p in pairs) if pairs else None})
    return result


def verified_build(binary):
    binary = Path(binary).resolve()
    identity = json.loads((binary.parent / 'build-identity.json').read_text())
    for path, key in [(binary, 'binary_sha256'), (binary.parent / 'mlx.metallib', 'metallib_sha256'),
                      (binary.parent / 'build-source.tar.gz', 'source_archive_sha256')]:
        if digest(path) != identity[key]:
            raise ValueError(f'frozen identity mismatch: {path}')
    return {'binary': str(binary), 'identity': identity}


def validate_declared_binary(protocol, builds):
    expected = protocol.get('frozen_binary_sha256')
    if expected is None: return
    if type(expected) is not str or len(expected) != 64 or any(c not in '0123456789abcdef' for c in expected):
        raise ValueError('frozen_binary_sha256 must be a lowercase SHA-256 digest')
    if not builds or any(b['identity']['binary_sha256'] != expected for b in builds.values()):
        raise ValueError('an arm does not match the prospectively frozen binary SHA-256')


def validate_arms(arms):
    if type(arms) is not dict or not arms or 'reference' not in arms:
        raise ValueError('arms must include a reference')
    for name, arm in arms.items():
        if type(name) is not str or not name.replace('_', '').replace('-', '').isalnum():
            raise ValueError('unsafe arm name')
        if type(arm) is not dict or not {'chunk', 'env'} <= set(arm) or set(arm) - {'chunk', 'env', 'binary'}:
            raise ValueError('each arm requires chunk and env, with only an optional binary')
        if type(arm['chunk']) is not int or arm['chunk'] not in [256, 512, 1024, 2048, 4096]:
            raise ValueError('arm chunk must be a supported prefill size')
        if type(arm['env']) is not dict or any(type(k) is not str or not k.startswith('SLOTSTREAM_')
                or type(v) is not str for k, v in arm['env'].items()):
            raise ValueError('arm env requires explicit string SLOTSTREAM_ controls')
        if 'SLOTSTREAM_PREFILL_CHUNK' in arm['env'] and arm['env']['SLOTSTREAM_PREFILL_CHUNK'] != str(arm['chunk']):
            raise ValueError('arm chunk conflicts with its environment')
        if 'binary' in arm and (type(arm['binary']) is not str or not arm['binary']):
            raise ValueError('arm binary must be a nonempty path string')


def startup_acceptance_results(rows, reference, contract):
    """Optional first-job gate; never borrow swap-excluded warmups from steady timing."""
    if contract is None:
        return None
    keys = {'minimum_pairs', 'maximum_median_first_job_regression', 'all_outputs_exact'}
    if not isinstance(contract, dict) or set(contract) != keys:
        raise ValueError('startup acceptance requires exactly minimum_pairs, maximum_median_first_job_regression and all_outputs_exact')
    count, limit = contract['minimum_pairs'], contract['maximum_median_first_job_regression']
    if type(count) is not int or count < 1:
        raise ValueError('startup minimum_pairs must be a positive integer')
    if type(limit) not in [int, float] or not 0 <= limit <= 1:
        raise ValueError('startup regression limit must be finite and in [0,1]')
    if contract['all_outputs_exact'] is not True:
        raise ValueError('startup acceptance requires exact outputs')
    by_cell = {(r['round'], r['arm']): r for r in rows}
    results = []
    for summary in startup_summaries(rows, reference):
        changes = []
        for pair in summary['pairs']:
            a = by_cell[pair['round'], reference]['first_request']['complete_seconds_from_launch']
            b = by_cell[pair['round'], summary['candidate']]['first_request']['complete_seconds_from_launch']
            changes.append(1 - b / a)
        median = statistics.median(changes) if changes else None
        checks = {'minimum_pairs': len(changes) >= count,
                  'median_first_job_non_regression': median is not None and median >= -limit}
        results.append({'candidate': summary['candidate'], 'passed': all(checks.values()),
            'checks': checks, 'eligible_rounds': [p['round'] for p in summary['pairs']],
            'excluded_rounds': summary['excluded_rounds'], 'median_first_job_reduction_fraction': median})
    return results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    validate_arms(protocol.get('arms'))
    expected_prefix = prefix_study(protocol)
    complete_prompt = (protocol.get('prefix_cache') or {}).get('complete_prompt', False)
    retention_only = (protocol.get('prefix_cache') or {}).get('retention_only', False)
    partial_prefix = (protocol.get('prefix_cache') or {}).get('partial_prefix', False)
    warmup_checkpoint_stores = (protocol.get('prefix_cache') or {}).get('expected_warmup_checkpoint_stores')
    expected_work = work_constraints(protocol)
    startup_acceptance_results([], next(iter(protocol['arms'])), protocol.get('startup_acceptance'))
    stop_on_contention = contention_guard(protocol)
    initial_quiet = workspace_quiet_requirement(protocol)
    cooldown = cell_cooldown(protocol)
    reservation_wait = reservation_wait_limit(protocol)
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    explicit_pool_gb = fixed_pool_budget(protocol)
    required_equal_work = protocol.get('required_equal_work')
    summaries([], 'reference', comparison_basis, required_equal_work)
    acceptance_results([], protocol.get('acceptance'))
    abort_on_resource_failure = protocol.get('abort_on_resource_failure', False)
    if type(abort_on_resource_failure) is not bool: raise ValueError('abort_on_resource_failure must be Boolean')
    resource_exclusions({}, protocol)  # Validate declared types before loading.
    arms=protocol['arms']; model=Path(protocol['model']).resolve(); binary=Path(protocol['binary']).resolve()
    if protocol.get('acceptance') is not None and len(arms) < 2:
        raise ValueError('paired acceptance requires reference and candidate arms')
    required_memory = measurement_memory(protocol)
    settle_seconds = protocol.get('memory_settle_seconds', 0)
    if type(settle_seconds) not in (int, float) or not math.isfinite(settle_seconds) or not 0 <= settle_seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    workload_exclusions({}, protocol)  # Validate the declaration before startup.
    if protocol['rounds']<1 or not 1<=protocol['max_tokens']<=512:
        parser.error('bounded memory, rounds and output required')
    if any(not name.replace('_','').replace('-','').isalnum() for name in arms): parser.error('unsafe arm name')
    identity = verified_build(binary)['identity']
    arm_builds = {name: verified_build(arm.get('binary', binary)) for name, arm in arms.items()}
    validate_declared_binary(protocol, arm_builds)
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
    warm_fixture = warmup_fixture(protocol, fixture)
    images = image_fixtures(protocol)
    if protocol['memory_gb'] > 10:
        fixture_limit = 32768 if protocol.get('large_scope_measurement') is not None else 2048
        if fixture.stat().st_size > fixture_limit:
            raise ValueError(f'large-memory study fixture exceeds its {fixture_limit}-byte bound')
    a.out=a.out.resolve(); a.out.mkdir(parents=True,exist_ok=False)
    shutil.copyfile(fixture,a.out/'fixture.txt'); shutil.copyfile(binary.parent/'build-source.tar.gz',a.out/'build-source.tar.gz')
    for name, build in arm_builds.items():
        shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', a.out / f'{name}-build-source.tar.gz')
    harness_sources = {}
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:
        harness_sources[source.name] = digest(source)
        shutil.copyfile(source, a.out/source.name)
    (a.out/'manifest.json').write_text(json.dumps({'protocol':protocol,'protocol_sha256':digest(a.protocol),
        'identity':identity,'model':model_identity(model),'harness_sha256':digest(Path(__file__)),
        'harness_sources': harness_sources, 'arm_builds': arm_builds},indent=2)+'\n')
    for i, (image_path, data) in enumerate(images):
        (a.out / f'image-{i}{image_path.suffix}').write_bytes(data)
    body=request_body(protocol, fixture.read_text(), images=images)
    warm_body = request_body(protocol, warm_fixture.read_text(), images=images)
    (a.out/'request.json').write_bytes(body)
    if warm_fixture != fixture:
        shutil.copyfile(warm_fixture, a.out/'warmup-fixture.txt')
        (a.out/'warmup-request.json').write_bytes(warm_body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
    if initial_quiet is not None:
        quiet_record = {'requirement': initial_quiet, 'passed': False}
        try:
            quiet_record.update(wait_for_quiet_workspace(initial_quiet), passed=True)
        except (Exception, KeyboardInterrupt) as error:
            quiet_record['error'] = f'{type(error).__name__}: {error}'
        (a.out/'initial-workspace-quiet.json').write_text(json.dumps(quiet_record, indent=2)+'\n')
        if not quiet_record['passed']:
            (a.out/'completion.json').write_text(json.dumps({'stopped_early': True,
                'planned_cells': protocol['rounds'] * len(arms), 'recorded_cells': 0,
                'error': quiet_record['error'], 'acceptance': []}, indent=2)+'\n')
            print(json.dumps(quiet_record), flush=True)
            return 1
    stop_requested = False
    interrupted = False
    for number in range(1,protocol['rounds']+1):
        order=list(arms) if number%2 else list(reversed(arms))
        for name in order:
            arm=arms[name]; cell=a.out/f'{number}-{name}'; cell.mkdir()
            env=clean_env|arm['env']|{'SLOTSTREAM_BENCH_DETAILS':'1','SLOTSTREAM_PREFILL_CHUNK':str(arm['chunk'])}
            extra=max(0,arm['chunk']-256)*1.30e-3
            if env.get('SLOTSTREAM_OPT_LAYER_WORKSPACE')=='1': extra+=2
            if env.get('SLOTSTREAM_OPT_ROUTER_WEIGHTS')=='1': extra+=.3
            scope=int(env.get('SLOTSTREAM_OPT_READ_SCOPE','0'))
            if scope: extra+=max(0,scope-arm['chunk'])*1.30e-3+.12
            row={'round':number,'arm':name,'valid':False,'extra_preflight_allowance_gb':extra,
                 'env':{k:v for k,v in env.items() if k.startswith('SLOTSTREAM_')}}
            child=None
            try:
                if stop_on_contention:
                    row['competing_jobs_before_cooldown'] = competing_jobs()
                    if row['competing_jobs_before_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job; stopped before cooldown or model launch')
                row['cooldown_seconds'] = cooldown
                if cooldown:
                    print(json.dumps({'round':number,'arm':name,'phase':'before-cell cooldown','seconds':cooldown}),flush=True)
                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)
                if stop_on_contention:
                    row['competing_jobs_after_cooldown'] = competing_jobs()
                    if row['competing_jobs_after_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job appeared during cooldown; model not launched')
                try:
                    row['before_startup'], row['headroom_settle'] = wait_for_headroom(required_memory+extra, settle_seconds)
                except Exception:
                    if abort_on_resource_failure: stop_requested = True
                    raise
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                memory_args = (['--pool-gb', str(explicit_pool_gb)] if explicit_pool_gb is not None
                               else ['--memory-gb', str(protocol['memory_gb'])])
                command=[arm_builds[name]['binary'],'serve','--port',str(port),'--model',str(model), *memory_args,
                         '--mtp',protocol.get('mtp','off'),'--no-elastic']
                if expected_prefix is None: command.append('--no-prefix-cache')
                if protocol.get('large_scope_measurement') is not None:
                    # Bound active context independently of any evolving default
                    # while allowing the declared approximately4k-token fixture.
                    command.extend(['--max-context','8192'])
                row['command']=command
                with (cell/'server.stdout').open('wb') as out, (cell/'server.stderr').open('wb') as err:
                    launched_at=time.monotonic()
                    child=subprocess.Popen(command,cwd=ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
                    wait_ready(child,port)
                    row['startup_seconds']=time.monotonic()-launched_at
                    row['after_startup_vm']=vm_snapshot()
                    warm,wire=exchange(port,warm_body,protocol.get('timeout_seconds',600))
                    row['first_request']={k:warm['metrics'][k] for k in ['prompt_ids','output_ids','effective_pool_slots','effective_mtp']}
                    row['first_request'].update(text=warm['text'],complete_seconds_from_launch=time.monotonic()-launched_at)
                    row['after_warmup_vm']=vm_snapshot()
                    row['startup_and_warmup_valid']=not resource_exclusions(warm['metrics']['stats'],protocol) and (
                        warm['metrics']['stats']['decodeTokens'] >= protocol.get('minimum_output_tokens',0)) and all(
                        row['before_startup'][key]==row['after_warmup_vm'][key] for key in ['swapins','swapouts'])
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
                    if stop_on_contention:
                        row['competing_jobs_after_warmup'] = competing_jobs()
                        if row['competing_jobs_after_warmup']:
                            stop_requested = True
                            raise RuntimeError('competing storage/build job appeared during warmup; measurement not started')
                    if abort_on_resource_failure:
                        warm_exclusions = resource_exclusions(warm['metrics']['stats'], protocol)
                        if protocol['memory_gb'] > 10:
                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]
                                   for key in ['swapins', 'swapouts']):
                                warm_exclusions.append('swap activity during large-pool startup/warmup')
                        if warm_exclusions:
                            stop_requested = True
                            row['exclusion'] = 'warmup resource gate: ' + '; '.join(warm_exclusions)
                            raise RuntimeError('declared resource stop before measurement')
                    row['host_before']=host_conditions()
                    row['before']=vm_snapshot()
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600),
                        allow_complete_prompt=complete_prompt and expected_prefix[name] > 0)
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    if stop_on_contention:
                        row['competing_jobs_after_measurement'] = competing_jobs()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if explicit_pool_gb is not None and m['effective_pool_slots'] != protocol['fixed_pool_slots']:
                        raise ValueError('effective pool differs from the frozen explicit capacity')
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    validate_prefix_observation(expected_prefix, name, warm['metrics'], m,
                        complete_prompt=complete_prompt, retention_only=retention_only, partial_prefix=partial_prefix,
                        warmup_checkpoint_stores=warmup_checkpoint_stores)
                    validate_work_observation(expected_work, name, s)
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
                    if stop_on_contention and row.get('competing_jobs_after_measurement'):
                        exclusions.append('known competing storage/build job observed after measurement')
                        stop_requested = True
                    if exclusions and abort_on_resource_failure: stop_requested = True
                    exclusions += workload_exclusions(s, protocol)
                    if changed: exclusions.append('swap activity during measured request; pair excluded')
                    row['valid']=not exclusions
                    if exclusions: row['exclusion']='; '.join(exclusions)
            except KeyboardInterrupt:
                row['interrupted'] = True
                row['error'] = 'KeyboardInterrupt: measured result incomplete; owned server stopped'
                interrupted = stop_requested = True
            except Exception as e: row['error']=f'{type(e).__name__}: {e}'
            finally:
                if child is not None: stop_server(child)
            (cell/'result.json').write_text(json.dumps(row,indent=2)+'\n')
            rows.append(row)
            with (a.out/'results.jsonl').open('a') as log: log.write(json.dumps(row)+'\n')
            progress = {k:v for k,v in row.items() if k in ['round','arm','valid','client_seconds','error','exclusion']}
            if 'metrics' in row:
                stats = row['metrics']['stats']
                progress['decode_records'] = stats.get('decodeRecords')
                if 'decodeLocalVictims' in stats: progress['local_victims'] = stats['decodeLocalVictims']
                if protocol.get('acceptance', {}).get('minimum_sequence_reduction') is not None:
                    progress['sequence_bytes'] = stats.get('allocatedSequenceBytes')
                    progress['mlx_active_bytes'] = stats.get('mlxActiveEndBytes')
            print(json.dumps(progress),flush=True)
            if stop_requested: break
        if stop_requested: break
    summary=summaries(rows,next(iter(arms)),comparison_basis,required_equal_work)
    (a.out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    (a.out/'startup-summary.json').write_text(json.dumps(startup_summaries(rows,next(iter(arms))),indent=2)+'\n')
    assessment = acceptance_results(summary, protocol.get('acceptance'))
    startup_assessment = startup_acceptance_results(rows, next(iter(arms)), protocol.get('startup_acceptance'))
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment, 'startup_acceptance': startup_assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    if startup_assessment is not None and not all(r['passed'] for r in startup_assessment): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())
````

## /tmp/slotstream-optimization-execution/serial-guard-recovery-v240/protocol.json

SHA-256 `fc7a3327215668716974717604698b54485241a2a73c87733dc0734004d7ede5`; 22009 bytes.

````text
{
  "captured_at": "2026-09-07T04:06:49.359210+00:00",
  "classification": "New compiler attempt after durable primary-error/cleanup/publication guard correction; no inference benchmark or failed data replacement",
  "source": "/tmp/slotstream-optimization-execution/planner-family-integration-v237/candidate-source",
  "source_sha256": {
    "Makefile": "457d65426cca792bd8c1bd28e7d5bbcc812664090b535eeb0d355302679995d6",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
    "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
    "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
    "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
    "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
    "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
    "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
    "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
    "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
    "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
    "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
    "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
    "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
    "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
    "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
    "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
    "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
    "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
    "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
    "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
    "Sources/Slotstream/Layers.swift": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
    "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
    "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
    "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
    "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
    "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
    "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
    "Sources/Slotstream/Optimizations.swift": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
    "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
    "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
    "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/Plan.swift": "fb788e98e388a2a4bed06743ada61c5f9f9173f237ef2a8f95cef82cd673d1ae",
    "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
    "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
    "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
    "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
    "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
    "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
    "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "325b2c29e6fc03f17c642d5a72eccf77eb5e3f82be1df1df4b910b65519fb00a",
    "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
    "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
    "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
    "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
    "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
    "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
    "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
    "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
    "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
    "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
    "Sources/Slotstream/Weights.swift": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
    "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
    "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
    "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
    "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "51e505bd3279983263ad731133b2f1e20606387cf03ba360ffcb2fba34dd33a3",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
    "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
    "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
    "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "d12a1d66c39d62cc773ba81ce1bf8ba88b82b096ad2f060398a39acfcf65b63c",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
    "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
    "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
    "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
    "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
    "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
    "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
    "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
    "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
    "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
    "Sources/slotstream-cli/MTPCommands.swift": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
    "Sources/slotstream-cli/OptimizationCommands.swift": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
    "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
    "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
    "Sources/slotstream-cli/main.swift": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4",
    "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "drivers": {
    "optimization_serial_build.py": "05a81e16880cdea80198a6cbd7e7fc84429b68940e1c699163a0ae5fe15d6ed8",
    "optimization_serial_build_test.py": "d719866cd48ec6e53b56f563a3b2afd2709b553e55ca213757c4f16b8ebc48ac",
    "optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86"
  },
  "policy": {
    "startup_reclaimable_bytes": 9500000000,
    "minimum_live_reclaimable_bytes": 6000000000,
    "maximum_owned_rss_bytes": 3000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1200,
    "compiler_jobs": 1,
    "stop_on_new_swapouts": true
  },
  "complete_pipeline_seconds": 1220,
  "prior_attempt": "/Users/carlos/Projects/slotstream/.build/optimization/serial-planner-build-v238",
  "cache_state": "Retains partial compiler/dependency artifacts from failedV238; not a fresh-build speed measurement",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 10011131904,
    "swapins": 44106485,
    "swapouts": 77510858,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    96546.\nPages active:                                1215075.\nPages inactive:                              1208753.\nPages speculative:                              8927.\nPages throttled:                                   0.\nPages wired down:                             278109.\nPages purgeable:                               17107.\n\"Translation faults\":                    15200428517.\nPages copy-on-write:                       718156971.\nPages zero filled:                       21009705147.\nPages reactivated:                        3460551618.\nPages purged:                               71603343.\nFile-backed pages:                            497378.\nAnonymous pages:                             1935377.\nPages stored in compressor:                   882721.\nPages occupied by compressor:                 278004.\nDecompressions:                           1165419827.\nCompressions:                             1477881069.\nPageins:                                  7587569608.\nPageouts:                                   11030527.\nSwapins:                                    44106485.\nSwapouts:                                   77510858.\nPages tagged:                                 200301.\nPages tagged resident:                        185386.\nPages tagged compressed:                       14915.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                15114.\nPages tag-storage free:                          206.\nPages tag-storage non-tag pageable:            82976.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    2182208.\nTagged compressions:                        11082592.\nTagged decompressions:                      10256935.\n"
  },
  "eligible": true,
  "competing_jobs": [],
  "command": [
    "python3",
    "Tools/optimization_serial_build.py",
    "--source",
    "/tmp/slotstream-optimization-execution/planner-family-integration-v237/candidate-source",
    "--out",
    ".build/optimization/serial-planner-build-v240"
  ]
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/serial-planner-build-v238/build.txt

SHA-256 `b78f4cb05514d74388da9cf58a1b86f84d72302bad20e04cbae8ce10e7b24ada`; 9289 bytes.

````text
python3 Tools/build_identity.py before .build/release
swift build -c release -j 1
Fetching https://github.com/huggingface/swift-jinja.git from cache
Fetching https://github.com/apple/swift-collections.git from cache
Fetching https://github.com/mattt/EventSource.git from cache
Fetching https://github.com/huggingface/swift-huggingface.git from cache
Fetching https://github.com/apple/swift-asn1.git from cache
Fetching https://github.com/apple/swift-crypto.git from cache
Fetching https://github.com/ibireme/yyjson.git from cache
Fetching https://github.com/huggingface/swift-transformers.git from cache
Fetching https://github.com/ml-explore/mlx-swift.git from cache
Fetching https://github.com/apple/swift-numerics from cache
Fetching https://github.com/apple/swift-argument-parser.git from cache
Fetched https://github.com/mattt/EventSource.git from cache (2.06s)
Fetched https://github.com/apple/swift-asn1.git from cache (2.11s)
Fetched https://github.com/huggingface/swift-jinja.git from cache (2.21s)
Fetched https://github.com/apple/swift-numerics from cache (2.23s)
Fetched https://github.com/ibireme/yyjson.git from cache (2.27s)
Fetched https://github.com/huggingface/swift-huggingface.git from cache (2.30s)
Fetched https://github.com/huggingface/swift-transformers.git from cache (2.35s)
Fetched https://github.com/apple/swift-argument-parser.git from cache (2.36s)
Fetched https://github.com/apple/swift-collections.git from cache (2.37s)
Fetched https://github.com/apple/swift-crypto.git from cache (2.39s)
Fetched https://github.com/ml-explore/mlx-swift.git from cache (2.44s)
Computing version for https://github.com/apple/swift-argument-parser.git
Computed https://github.com/apple/swift-argument-parser.git at 1.8.2 (2.88s)
Computing version for https://github.com/huggingface/swift-transformers.git
Computed https://github.com/huggingface/swift-transformers.git at 1.3.3 (0.45s)
Computing version for https://github.com/ml-explore/mlx-swift.git
Computed https://github.com/ml-explore/mlx-swift.git at 0.31.6 (0.44s)
Computing version for https://github.com/ibireme/yyjson.git
Computed https://github.com/ibireme/yyjson.git at 0.12.0 (0.57s)
Computing version for https://github.com/apple/swift-crypto.git
Computed https://github.com/apple/swift-crypto.git at 4.5.1 (0.57s)
Computing version for https://github.com/apple/swift-collections.git
Computed https://github.com/apple/swift-collections.git at 1.6.0 (0.50s)
Computing version for https://github.com/huggingface/swift-huggingface.git
Computed https://github.com/huggingface/swift-huggingface.git at 0.9.0 (0.41s)
Computing version for https://github.com/huggingface/swift-jinja.git
Computed https://github.com/huggingface/swift-jinja.git at 2.4.2 (0.44s)
Computing version for https://github.com/apple/swift-numerics
Computed https://github.com/apple/swift-numerics at 1.1.1 (0.41s)
Computing version for https://github.com/apple/swift-asn1.git
Computed https://github.com/apple/swift-asn1.git at 1.7.1 (0.48s)
Computing version for https://github.com/mattt/EventSource.git
Computed https://github.com/mattt/EventSource.git at 1.5.1 (0.43s)
Creating working copy for https://github.com/mattt/EventSource.git
Working copy of https://github.com/mattt/EventSource.git resolved at 1.5.1
Creating working copy for https://github.com/huggingface/swift-transformers.git
Working copy of https://github.com/huggingface/swift-transformers.git resolved at 1.3.3
Creating working copy for https://github.com/apple/swift-asn1.git
Working copy of https://github.com/apple/swift-asn1.git resolved at 1.7.1
Creating working copy for https://github.com/apple/swift-collections.git
Working copy of https://github.com/apple/swift-collections.git resolved at 1.6.0
Creating working copy for https://github.com/huggingface/swift-huggingface.git
Working copy of https://github.com/huggingface/swift-huggingface.git resolved at 0.9.0
Creating working copy for https://github.com/apple/swift-argument-parser.git
Working copy of https://github.com/apple/swift-argument-parser.git resolved at 1.8.2
Creating working copy for https://github.com/ibireme/yyjson.git
Working copy of https://github.com/ibireme/yyjson.git resolved at 0.12.0
Creating working copy for https://github.com/ml-explore/mlx-swift.git
Working copy of https://github.com/ml-explore/mlx-swift.git resolved at 0.31.6
Creating working copy for https://github.com/huggingface/swift-jinja.git
Working copy of https://github.com/huggingface/swift-jinja.git resolved at 2.4.2
Creating working copy for https://github.com/apple/swift-crypto.git
Working copy of https://github.com/apple/swift-crypto.git resolved at 4.5.1
Creating working copy for https://github.com/apple/swift-numerics
Working copy of https://github.com/apple/swift-numerics resolved at 1.1.1
[0/6] Write swift-version--1AB21518FC5DEDBE.txt
[1/6] Write sources
[5/7] Compiling ArgumentParserToolInfo ToolInfo.swift
[6/8] Compiling ArgumentParser BashCompletionsGenerator.swift
[7/9] Compiling encuda encuda-compile.swift
[7/9] Write Objects.LinkFileList
[8/9] Linking encuda-tool
[1/1] Compiling plugin GenerateManual
[2/2] Compiling plugin GenerateDoccReference
[3/3] Compiling plugin CudaBuild
Building for production...
[3/216] Write swift-version--1AB21518FC5DEDBE.txt
[4/216] Compiling yyjson.c
[5/216] Copying t5_tokenizer_config.json
[5/216] Copying gpt2_tokenizer_config.json
[7/216] Copying PrivacyInfo.xcprivacy
[7/216] Write sources
[10/216] Compiling _NumericsShims _NumericsShims.c
[11/216] Write sources
[18/217] Compiling RealModule AlgebraicField.swift
[18/217] Write sources
[27/218] Compiling InternalCollectionsUtilities Debugging.swift
[27/218] Write sources
[29/219] Compiling OrderedCollections _HashTable+Bucket.swift
[29/219] Write sources
[32/220] Compiling Jinja AST.swift
[33/221] Compiling EventSource AsyncEventsSequence.swift
[33/221] Write sources
[36/222] Compiling Crypto AES-GCM.swift
[37/223] Compiling ComplexModule Complex+AdditiveArithmetic.swift
[38/224] Compiling HuggingFace AccessRequest.swift
[39/225] Compiling Numerics Numerics.swift
[40/226] Compiling Hub BinaryDistinct.swift
[40/226] Compiling version.cpp
[42/227] Compiling Tokenizers BPETokenizer.swift
[42/227] Compiling utils.cpp
[44/228] Compiling Generation Decoders.swift
[44/228] Compiling transforms.cpp
[46/229] Compiling Models LanguageModel.swift
[46/229] Compiling scheduler.cpp
[47/229] Compiling random.cpp
[48/229] Compiling primitives.cpp
[49/229] Compiling ops.cpp
[50/229] Compiling linalg.cpp
[51/229] Compiling safetensors.cpp
[52/229] Compiling no_gguf.cpp
[53/229] Compiling load.cpp
[54/229] Compiling graph_utils.cpp
[55/229] Compiling fft.cpp
[56/229] Compiling fast.cpp
[57/229] Compiling export.cpp
[58/229] Compiling einsum.cpp
[59/229] Compiling dtype_utils.cpp
[60/229] Compiling dtype.cpp
[61/229] Compiling utils.cpp
[62/229] Compiling no_ring.cpp
[63/229] Compiling primitives.cpp
[64/229] Compiling ops.cpp
[65/229] Compiling no_nccl.cpp
[66/229] Compiling no_mpi.cpp
[67/229] Compiling no_jaccl.cpp
[68/229] Compiling distributed.cpp
[69/229] Compiling device.cpp
[70/229] Compiling compile.cpp
[71/229] Compiling utils.cpp
[72/229] Compiling unary.cpp
[73/229] Compiling ternary.cpp
[74/229] Compiling sort.cpp
[75/229] Compiling softmax.cpp
[76/229] Compiling slicing.cpp
[77/229] Compiling scan.cpp
[78/229] Compiling scaled_dot_product_attention.cpp
[79/229] Compiling rope.cpp
[80/229] Compiling resident.cpp
[81/229] Compiling reduce.cpp
[82/229] Compiling quantized.cpp
[83/229] Compiling primitives.cpp
[84/229] Compiling normalization.cpp
[85/229] Compiling metal.cpp
[86/229] Compiling matmul.cpp
[87/229] Compiling logsumexp.cpp
[88/229] Compiling jit_kernels.cpp
[89/229] Compiling indexing.cpp
[90/229] Compiling hadamard.cpp
[91/229] Compiling fft.cpp
[92/229] Compiling fence.cpp
[93/229] Compiling event.cpp
[94/229] Compiling eval.cpp
[95/229] Compiling distributed.cpp
[96/229] Compiling device_info.cpp
[97/229] Compiling device.cpp
[98/229] Compiling custom_kernel.cpp
[99/229] Compiling copy.cpp
[100/229] Compiling conv.cpp
[101/229] Compiling compiled.cpp
[102/229] Compiling binary.cpp
[103/229] Compiling allocator.cpp
[104/229] Compiling slicing.cpp
[105/229] Compiling primitives.cpp
[106/229] Compiling copy.cpp
[107/229] Compiling no_cuda.cpp
[108/229] Compiling unary.cpp
[109/229] Compiling threefry.cpp
[110/229] Compiling svd.cpp
[111/229] Compiling sort.cpp
[112/229] Compiling softmax.cpp
[113/229] Compiling select.cpp
[114/229] Compiling scan.cpp
[115/229] Compiling reduce.cpp
[116/229] Compiling quantized.cpp
[117/229] Compiling qrf.cpp
[118/229] Compiling primitives.cpp
[119/229] Compiling matmul.cpp
[120/229] Compiling masked_mm.cpp
[121/229] Compiling luf.cpp
[122/229] Compiling logsumexp.cpp
[123/229] Compiling jit_compiler.cpp
[124/229] Compiling inverse.cpp
[125/229] Compiling indexing.cpp
[126/229] Compiling hadamard.cpp
[127/229] Compiling cblas.cpp
[128/229] Compiling bnns.cpp
[129/229] Compiling fft.cpp
[130/229] Compiling eval.cpp
[131/229] Compiling encoder.cpp
[132/229] Compiling eigh.cpp
[133/229] Compiling eig.cpp
[134/229] Compiling distributed.cpp
[135/229] Compiling device_info.cpp
[136/229] Compiling copy.cpp
[137/229] Compiling conv.cpp
[138/229] Compiling cholesky.cpp
make: *** [build] Terminated: 15
````

## /Users/carlos/Projects/slotstream/.build/optimization/serial-planner-build-v238/manifest.json

SHA-256 `efbf9dbbf07ece43201a5a85e7f2c4861a988c074473c114568dd612bafef5da`; 5037 bytes.

````text
{
  "classification": "build only; no runtime performance evidence",
  "required_reclaimable_gb": 9.5,
  "model_lock_held_during_build": true,
  "passed": false,
  "command": [
    "make",
    "build",
    "SLOTSTREAM_BUILD_JOBS=1"
  ],
  "working_directory": "/private/tmp/slotstream-optimization-execution/planner-family-integration-v237/candidate-source",
  "reservation_wait_limit_seconds": 0,
  "build_jobs": 1,
  "reservation_wait": {
    "seconds": 3.540999999999267e-06,
    "attempts": 1
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 11791351808,
    "swapins": 44106018,
    "swapouts": 77510858,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    92290.\nPages active:                                1217195.\nPages inactive:                              1190284.\nPages speculative:                             27035.\nPages throttled:                                   0.\nPages wired down:                             276122.\nPages purgeable:                               14092.\n\"Translation faults\":                    15180411925.\nPages copy-on-write:                       716585299.\nPages zero filled:                       20998936996.\nPages reactivated:                        3460538901.\nPages purged:                               71584997.\nFile-backed pages:                            613305.\nAnonymous pages:                             1821209.\nPages stored in compressor:                   896180.\nPages occupied by compressor:                 282040.\nDecompressions:                           1165402571.\nCompressions:                             1477877032.\nPageins:                                  7587387299.\nPageouts:                                   11030260.\nSwapins:                                    44106018.\nSwapouts:                                   77510858.\nPages tagged:                                 200512.\nPages tagged resident:                        185394.\nPages tagged compressed:                       15118.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                15127.\nPages tag-storage free:                          334.\nPages tag-storage non-tag pageable:            82835.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    2218816.\nTagged compressions:                        11082573.\nTagged decompressions:                      10256713.\n"
  },
  "error": "PermissionError: [Errno 1] Operation not permitted",
  "elapsed_seconds": 264.722914666,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 10429202432,
    "swapins": 44106389,
    "swapouts": 77510858,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   116741.\nPages active:                                1205030.\nPages inactive:                              1199155.\nPages speculative:                              5098.\nPages throttled:                                   0.\nPages wired down:                             279537.\nPages purgeable:                                8360.\n\"Translation faults\":                    15190953124.\nPages copy-on-write:                       717407556.\nPages zero filled:                       21004652881.\nPages reactivated:                        3460547068.\nPages purged:                               71595753.\nFile-backed pages:                            511447.\nAnonymous pages:                             1897836.\nPages stored in compressor:                   887192.\nPages occupied by compressor:                 279316.\nDecompressions:                           1165415424.\nCompressions:                             1477881069.\nPageins:                                  7587478760.\nPageouts:                                   11030461.\nSwapins:                                    44106389.\nSwapouts:                                   77510858.\nPages tagged:                                 200069.\nPages tagged resident:                        185020.\nPages tagged compressed:                       15049.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                15114.\nPages tag-storage free:                          909.\nPages tag-storage non-tag pageable:            82273.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    2202560.\nTagged compressions:                        11082592.\nTagged decompressions:                      10256801.\n"
  },
  "serial_driver_sha256": "ad3b6858cc15a43e5fec401df5eca341e0b2b0f0b9525763d7afce17077cb07b",
  "serial_policy": {
    "startup_reclaimable_bytes": 9500000000,
    "minimum_live_reclaimable_bytes": 6000000000,
    "maximum_owned_rss_bytes": 3000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1200,
    "compiler_jobs": 1,
    "stop_on_new_swapouts": true
  }
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/serial-planner-build-v240/build.txt

SHA-256 `918209cb78b63505a6e5dce0a72fde2a62e636a3ae606a3229cb7972deaf653a`; 4443 bytes.

````text
python3 Tools/build_identity.py before .build/release
swift build -c release -j 1
[0/2] Write swift-version--1AB21518FC5DEDBE.txt
[0/1] Planning build
[1/1] Compiling plugin GenerateManual
[2/2] Compiling plugin GenerateDoccReference
[3/3] Compiling plugin CudaBuild
Building for production...
[3/216] Compiling CSlotpack slotpack.c
[4/216] Compiling yyjson.c
[5/216] Write swift-version--1AB21518FC5DEDBE.txt
[6/216] Copying t5_tokenizer_config.json
[7/216] Copying gpt2_tokenizer_config.json
[8/216] Copying PrivacyInfo.xcprivacy
[9/216] Write sources
[11/216] Compiling _NumericsShims _NumericsShims.c
[12/216] Write sources
[19/217] Compiling RealModule AlgebraicField.swift
[19/217] Write sources
[28/218] Compiling InternalCollectionsUtilities Debugging.swift
[28/218] Write sources
[30/219] Compiling OrderedCollections _HashTable+Bucket.swift
[30/219] Write sources
[32/220] Compiling Jinja AST.swift
[32/220] Write sources
[35/221] Compiling EventSource AsyncEventsSequence.swift
[36/222] Compiling Crypto AES-GCM.swift
[36/222] Write sources
[37/222] Compiling version.cpp
[39/223] Compiling HuggingFace AccessRequest.swift
[40/224] Compiling ComplexModule Complex+AdditiveArithmetic.swift
[41/225] Compiling Hub BinaryDistinct.swift
[42/226] Compiling Numerics Numerics.swift
[43/227] Compiling Tokenizers BPETokenizer.swift
[43/227] Compiling utils.cpp
[45/228] Compiling Generation Decoders.swift
[45/228] Compiling transforms.cpp
[47/229] Compiling Models LanguageModel.swift
[47/229] Compiling scheduler.cpp
[48/229] Compiling random.cpp
[49/229] Compiling primitives.cpp
[50/229] Compiling ops.cpp
[51/229] Compiling linalg.cpp
[52/229] Compiling safetensors.cpp
[53/229] Compiling no_gguf.cpp
[54/229] Compiling load.cpp
[55/229] Compiling graph_utils.cpp
[56/229] Compiling fft.cpp
[57/229] Compiling fast.cpp
[58/229] Compiling export.cpp
[59/229] Compiling einsum.cpp
[60/229] Compiling dtype_utils.cpp
[61/229] Compiling dtype.cpp
[62/229] Compiling utils.cpp
[63/229] Compiling no_ring.cpp
[64/229] Compiling primitives.cpp
[65/229] Compiling ops.cpp
[66/229] Compiling no_nccl.cpp
[67/229] Compiling no_mpi.cpp
[68/229] Compiling no_jaccl.cpp
[69/229] Compiling distributed.cpp
[70/229] Compiling device.cpp
[71/229] Compiling compile.cpp
[72/229] Compiling utils.cpp
[73/229] Compiling unary.cpp
[74/229] Compiling ternary.cpp
[75/229] Compiling sort.cpp
[76/229] Compiling softmax.cpp
[77/229] Compiling slicing.cpp
[78/229] Compiling scan.cpp
[79/229] Compiling scaled_dot_product_attention.cpp
[80/229] Compiling rope.cpp
[81/229] Compiling resident.cpp
[82/229] Compiling reduce.cpp
[83/229] Compiling quantized.cpp
[84/229] Compiling primitives.cpp
[85/229] Compiling normalization.cpp
[86/229] Compiling metal.cpp
[87/229] Compiling matmul.cpp
[88/229] Compiling logsumexp.cpp
[89/229] Compiling jit_kernels.cpp
[90/229] Compiling indexing.cpp
[91/229] Compiling hadamard.cpp
[92/229] Compiling fft.cpp
[93/229] Compiling fence.cpp
[94/229] Compiling event.cpp
[95/229] Compiling eval.cpp
[96/229] Compiling distributed.cpp
[97/229] Compiling device_info.cpp
[98/229] Compiling device.cpp
[99/229] Compiling custom_kernel.cpp
[100/229] Compiling copy.cpp
[101/229] Compiling conv.cpp
[102/229] Compiling compiled.cpp
[103/229] Compiling binary.cpp
[104/229] Compiling allocator.cpp
[105/229] Compiling slicing.cpp
[106/229] Compiling primitives.cpp
[107/229] Compiling copy.cpp
[108/229] Compiling no_cuda.cpp
[109/229] Compiling unary.cpp
[110/229] Compiling threefry.cpp
[111/229] Compiling svd.cpp
[112/229] Compiling sort.cpp
[113/229] Compiling softmax.cpp
[114/229] Compiling select.cpp
[115/229] Compiling scan.cpp
[116/229] Compiling reduce.cpp
[117/229] Compiling quantized.cpp
[118/229] Compiling qrf.cpp
[119/229] Compiling primitives.cpp
[120/229] Compiling matmul.cpp
[121/229] Compiling masked_mm.cpp
[122/229] Compiling luf.cpp
[123/229] Compiling logsumexp.cpp
[124/229] Compiling jit_compiler.cpp
[125/229] Compiling inverse.cpp
[126/229] Compiling indexing.cpp
[127/229] Compiling hadamard.cpp
[128/229] Compiling cblas.cpp
[129/229] Compiling bnns.cpp
[130/229] Compiling fft.cpp
[131/229] Compiling eval.cpp
[132/229] Compiling encoder.cpp
[133/229] Compiling eigh.cpp
[134/229] Compiling eig.cpp
[135/229] Compiling distributed.cpp
[136/229] Compiling device_info.cpp
[137/229] Compiling copy.cpp
[138/229] Compiling conv.cpp
[139/229] Compiling cholesky.cpp
make: *** [build] Terminated: 15
````

## /Users/carlos/Projects/slotstream/.build/optimization/serial-planner-build-v240/live-memory.json

SHA-256 `5633d0512092acf14dcc94f3ff8639a2d48c2e4d892051a2e546e01176eb91bd`; 176333 bytes.

````text
{
  "command": [
    "make",
    "build",
    "SLOTSTREAM_BUILD_JOBS=1"
  ],
  "policy": {
    "startup_reclaimable_bytes": 9500000000,
    "minimum_live_reclaimable_bytes": 6000000000,
    "maximum_owned_rss_bytes": 3000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1200,
    "compiler_jobs": 1,
    "stop_on_new_swapouts": true
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 10182213632,
    "swapins": 44106485,
    "swapouts": 77510858,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   100095.\nPages active:                                1217904.\nPages inactive:                              1211423.\nPages speculative:                              9080.\nPages throttled:                                   0.\nPages wired down:                             269117.\nPages purgeable:                               27265.\n\"Translation faults\":                    15200571980.\nPages copy-on-write:                       718178799.\nPages zero filled:                       21009817557.\nPages reactivated:                        3460551674.\nPages purged:                               71603486.\nFile-backed pages:                            494113.\nAnonymous pages:                             1944294.\nPages stored in compressor:                   882717.\nPages occupied by compressor:                 278002.\nDecompressions:                           1165419831.\nCompressions:                             1477881069.\nPageins:                                  7587572515.\nPageouts:                                   11030527.\nSwapins:                                    44106485.\nSwapouts:                                   77510858.\nPages tagged:                                 200322.\nPages tagged resident:                        185408.\nPages tagged compressed:                       14914.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                15114.\nPages tag-storage free:                          162.\nPages tag-storage non-tag pageable:            83020.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    2182144.\nTagged compressions:                        11082592.\nTagged decompressions:                      10256936.\n"
  },
  "samples": [
    {
      "elapsed_seconds": 0.0021197919999999953,
      "owned_rss_bytes": 6340608,
      "owned_process_count": 1,
      "reclaimable_bytes": 10178428928,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 0.226751917,
      "owned_rss_bytes": 21807104,
      "owned_process_count": 2,
      "reclaimable_bytes": 10213621760,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 0.4497405,
      "owned_rss_bytes": 22331392,
      "owned_process_count": 3,
      "reclaimable_bytes": 9946529792,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 0.670759625,
      "owned_rss_bytes": 67420160,
      "owned_process_count": 2,
      "reclaimable_bytes": 9922379776,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 0.891666167,
      "owned_rss_bytes": 71385088,
      "owned_process_count": 2,
      "reclaimable_bytes": 10009018368,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 1.117196208,
      "owned_rss_bytes": 72482816,
      "owned_process_count": 2,
      "reclaimable_bytes": 9911828480,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 1.343111542,
      "owned_rss_bytes": 83230720,
      "owned_process_count": 2,
      "reclaimable_bytes": 9890349056,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 1.564073417,
      "owned_rss_bytes": 99336192,
      "owned_process_count": 2,
      "reclaimable_bytes": 9889464320,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 1.787936458,
      "owned_rss_bytes": 99368960,
      "owned_process_count": 2,
      "reclaimable_bytes": 9890807808,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 2.013373083,
      "owned_rss_bytes": 99434496,
      "owned_process_count": 2,
      "reclaimable_bytes": 9893183488,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 2.239309167,
      "owned_rss_bytes": 150355968,
      "owned_process_count": 4,
      "reclaimable_bytes": 9958457344,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 2.464694917,
      "owned_rss_bytes": 199360512,
      "owned_process_count": 4,
      "reclaimable_bytes": 9913008128,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 2.687435792,
      "owned_rss_bytes": 221347840,
      "owned_process_count": 4,
      "reclaimable_bytes": 9821847552,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 2.9134842499999998,
      "owned_rss_bytes": 244973568,
      "owned_process_count": 4,
      "reclaimable_bytes": 9798205440,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 3.13727675,
      "owned_rss_bytes": 245727232,
      "owned_process_count": 4,
      "reclaimable_bytes": 9798795264,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 3.362674375,
      "owned_rss_bytes": 250478592,
      "owned_process_count": 4,
      "reclaimable_bytes": 9861709824,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 3.588364917,
      "owned_rss_bytes": 253132800,
      "owned_process_count": 4,
      "reclaimable_bytes": 9947643904,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 3.812451917,
      "owned_rss_bytes": 288145408,
      "owned_process_count": 4,
      "reclaimable_bytes": 9919725568,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 4.038602042000001,
      "owned_rss_bytes": 327122944,
      "owned_process_count": 4,
      "reclaimable_bytes": 9881534464,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 4.2634437080000005,
      "owned_rss_bytes": 350650368,
      "owned_process_count": 4,
      "reclaimable_bytes": 9880190976,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 4.488544083000001,
      "owned_rss_bytes": 374095872,
      "owned_process_count": 4,
      "reclaimable_bytes": 10057515008,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 4.71478525,
      "owned_rss_bytes": 199704576,
      "owned_process_count": 4,
      "reclaimable_bytes": 10238803968,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 4.9401415,
      "owned_rss_bytes": 111296512,
      "owned_process_count": 3,
      "reclaimable_bytes": 10257989632,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 5.164477875,
      "owned_rss_bytes": 242434048,
      "owned_process_count": 4,
      "reclaimable_bytes": 10230759424,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 5.387439167,
      "owned_rss_bytes": 116965376,
      "owned_process_count": 3,
      "reclaimable_bytes": 10065297408,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 5.612452458000001,
      "owned_rss_bytes": 224477184,
      "owned_process_count": 4,
      "reclaimable_bytes": 10029514752,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 5.837443708,
      "owned_rss_bytes": 268435456,
      "owned_process_count": 4,
      "reclaimable_bytes": 9999974400,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 6.062641500000001,
      "owned_rss_bytes": 285704192,
      "owned_process_count": 4,
      "reclaimable_bytes": 9985916928,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 6.287477625,
      "owned_rss_bytes": 296386560,
      "owned_process_count": 4,
      "reclaimable_bytes": 9979117568,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 6.512464625000001,
      "owned_rss_bytes": 304709632,
      "owned_process_count": 4,
      "reclaimable_bytes": 10163322880,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 6.737453958000001,
      "owned_rss_bytes": 356614144,
      "owned_process_count": 4,
      "reclaimable_bytes": 10115776512,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 6.963545417000001,
      "owned_rss_bytes": 240795648,
      "owned_process_count": 4,
      "reclaimable_bytes": 10118529024,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 7.18754775,
      "owned_rss_bytes": 278167552,
      "owned_process_count": 4,
      "reclaimable_bytes": 10117398528,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 7.412451333000001,
      "owned_rss_bytes": 316358656,
      "owned_process_count": 4,
      "reclaimable_bytes": 10082320384,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 7.6343960420000005,
      "owned_rss_bytes": 342261760,
      "owned_process_count": 4,
      "reclaimable_bytes": 9968369664,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 7.860005375,
      "owned_rss_bytes": 356663296,
      "owned_process_count": 4,
      "reclaimable_bytes": 9960898560,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 8.0855065,
      "owned_rss_bytes": 380534784,
      "owned_process_count": 4,
      "reclaimable_bytes": 9892380672,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 8.309419583,
      "owned_rss_bytes": 395460608,
      "owned_process_count": 4,
      "reclaimable_bytes": 9870819328,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 8.532644375,
      "owned_rss_bytes": 409419776,
      "owned_process_count": 4,
      "reclaimable_bytes": 9854713856,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 8.757811417,
      "owned_rss_bytes": 420593664,
      "owned_process_count": 4,
      "reclaimable_bytes": 9941303296,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 8.983211833,
      "owned_rss_bytes": 433930240,
      "owned_process_count": 4,
      "reclaimable_bytes": 9934602240,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 9.202652624999999,
      "owned_rss_bytes": 449986560,
      "owned_process_count": 4,
      "reclaimable_bytes": 9831137280,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 9.427158417,
      "owned_rss_bytes": 457244672,
      "owned_process_count": 4,
      "reclaimable_bytes": 9828990976,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 9.652435375,
      "owned_rss_bytes": 459702272,
      "owned_process_count": 4,
      "reclaimable_bytes": 9826762752,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 9.877091333,
      "owned_rss_bytes": 464322560,
      "owned_process_count": 4,
      "reclaimable_bytes": 9820733440,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 10.102278625,
      "owned_rss_bytes": 467779584,
      "owned_process_count": 4,
      "reclaimable_bytes": 9817604096,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 10.326942125,
      "owned_rss_bytes": 473202688,
      "owned_process_count": 4,
      "reclaimable_bytes": 9911828480,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 10.551604417,
      "owned_rss_bytes": 482344960,
      "owned_process_count": 4,
      "reclaimable_bytes": 9901391872,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 10.778215125,
      "owned_rss_bytes": 486129664,
      "owned_process_count": 4,
      "reclaimable_bytes": 9898360832,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 11.002982291999999,
      "owned_rss_bytes": 493223936,
      "owned_process_count": 4,
      "reclaimable_bytes": 10057629696,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 11.227862792,
      "owned_rss_bytes": 495091712,
      "owned_process_count": 4,
      "reclaimable_bytes": 10070425600,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 11.452217417,
      "owned_rss_bytes": 500350976,
      "owned_process_count": 4,
      "reclaimable_bytes": 10062364672,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 11.676682625,
      "owned_rss_bytes": 504528896,
      "owned_process_count": 4,
      "reclaimable_bytes": 10062200832,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 11.901164249999999,
      "owned_rss_bytes": 508444672,
      "owned_process_count": 4,
      "reclaimable_bytes": 9777774592,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 12.125787208,
      "owned_rss_bytes": 508624896,
      "owned_process_count": 4,
      "reclaimable_bytes": 9946628096,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 12.350245625,
      "owned_rss_bytes": 509083648,
      "owned_process_count": 4,
      "reclaimable_bytes": 9948463104,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 12.575431042,
      "owned_rss_bytes": 509935616,
      "owned_process_count": 4,
      "reclaimable_bytes": 9950003200,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 12.800105457999999,
      "owned_rss_bytes": 510263296,
      "owned_process_count": 4,
      "reclaimable_bytes": 9947447296,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 13.024937375,
      "owned_rss_bytes": 511475712,
      "owned_process_count": 4,
      "reclaimable_bytes": 10182017024,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 13.250048458,
      "owned_rss_bytes": 511705088,
      "owned_process_count": 4,
      "reclaimable_bytes": 10222141440,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 13.475103333,
      "owned_rss_bytes": 513163264,
      "owned_process_count": 4,
      "reclaimable_bytes": 10222600192,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 13.700101541999999,
      "owned_rss_bytes": 513277952,
      "owned_process_count": 4,
      "reclaimable_bytes": 10032955392,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 13.92317675,
      "owned_rss_bytes": 513425408,
      "owned_process_count": 4,
      "reclaimable_bytes": 10032857088,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 14.147983667,
      "owned_rss_bytes": 516734976,
      "owned_process_count": 4,
      "reclaimable_bytes": 10022567936,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 14.370634082999999,
      "owned_rss_bytes": 139640832,
      "owned_process_count": 4,
      "reclaimable_bytes": 10230235136,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 14.59589225,
      "owned_rss_bytes": 271548416,
      "owned_process_count": 4,
      "reclaimable_bytes": 10166140928,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 14.8208975,
      "owned_rss_bytes": 299679744,
      "owned_process_count": 4,
      "reclaimable_bytes": 10148593664,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 15.046214917,
      "owned_rss_bytes": 215236608,
      "owned_process_count": 4,
      "reclaimable_bytes": 10192601088,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 15.271633125,
      "owned_rss_bytes": 140607488,
      "owned_process_count": 4,
      "reclaimable_bytes": 10210525184,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 15.503102541999999,
      "owned_rss_bytes": 245186560,
      "owned_process_count": 4,
      "reclaimable_bytes": 10164486144,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 15.727598208,
      "owned_rss_bytes": 317718528,
      "owned_process_count": 4,
      "reclaimable_bytes": 10125524992,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 15.952949292,
      "owned_rss_bytes": 332120064,
      "owned_process_count": 4,
      "reclaimable_bytes": 10120101888,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 16.1788585,
      "owned_rss_bytes": 377847808,
      "owned_process_count": 4,
      "reclaimable_bytes": 10076880896,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 16.403808833,
      "owned_rss_bytes": 414744576,
      "owned_process_count": 4,
      "reclaimable_bytes": 10047340544,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 16.628969458,
      "owned_rss_bytes": 436944896,
      "owned_process_count": 4,
      "reclaimable_bytes": 10021781504,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 16.8502775,
      "owned_rss_bytes": 462110720,
      "owned_process_count": 4,
      "reclaimable_bytes": 10001317888,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 17.075415708,
      "owned_rss_bytes": 486342656,
      "owned_process_count": 4,
      "reclaimable_bytes": 9987604480,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 17.296386875,
      "owned_rss_bytes": 499826688,
      "owned_process_count": 4,
      "reclaimable_bytes": 9975382016,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 17.521558042,
      "owned_rss_bytes": 521043968,
      "owned_process_count": 4,
      "reclaimable_bytes": 9955164160,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 17.745514167,
      "owned_rss_bytes": 536412160,
      "owned_process_count": 4,
      "reclaimable_bytes": 10197925888,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 17.970201958,
      "owned_rss_bytes": 550486016,
      "owned_process_count": 4,
      "reclaimable_bytes": 10181263360,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 18.195160458,
      "owned_rss_bytes": 569524224,
      "owned_process_count": 4,
      "reclaimable_bytes": 10187849728,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 18.417078916999998,
      "owned_rss_bytes": 573849600,
      "owned_process_count": 4,
      "reclaimable_bytes": 10192633856,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 18.641885083,
      "owned_rss_bytes": 587792384,
      "owned_process_count": 4,
      "reclaimable_bytes": 9992257536,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 18.866734792,
      "owned_rss_bytes": 600260608,
      "owned_process_count": 4,
      "reclaimable_bytes": 9981837312,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 19.091273958,
      "owned_rss_bytes": 614088704,
      "owned_process_count": 4,
      "reclaimable_bytes": 9967173632,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 19.312133541999998,
      "owned_rss_bytes": 624164864,
      "owned_process_count": 4,
      "reclaimable_bytes": 10057580544,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 19.537246707999998,
      "owned_rss_bytes": 645562368,
      "owned_process_count": 4,
      "reclaimable_bytes": 10146414592,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 19.762311625,
      "owned_rss_bytes": 656293888,
      "owned_process_count": 4,
      "reclaimable_bytes": 10138271744,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 19.988038375,
      "owned_rss_bytes": 656310272,
      "owned_process_count": 4,
      "reclaimable_bytes": 10137763840,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 20.213173708,
      "owned_rss_bytes": 656326656,
      "owned_process_count": 4,
      "reclaimable_bytes": 9937895424,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 20.437757333,
      "owned_rss_bytes": 655409152,
      "owned_process_count": 4,
      "reclaimable_bytes": 9939664896,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 20.662559833,
      "owned_rss_bytes": 656474112,
      "owned_process_count": 4,
      "reclaimable_bytes": 9939386368,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 20.887640125,
      "owned_rss_bytes": 657801216,
      "owned_process_count": 4,
      "reclaimable_bytes": 9932865536,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 21.112288666999998,
      "owned_rss_bytes": 658063360,
      "owned_process_count": 4,
      "reclaimable_bytes": 9933520896,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 21.336928208,
      "owned_rss_bytes": 673300480,
      "owned_process_count": 4,
      "reclaimable_bytes": 10015178752,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 21.561881833,
      "owned_rss_bytes": 792018944,
      "owned_process_count": 4,
      "reclaimable_bytes": 9792765952,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 21.786918874999998,
      "owned_rss_bytes": 207765504,
      "owned_process_count": 4,
      "reclaimable_bytes": 10304143360,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 22.011986,
      "owned_rss_bytes": 225280000,
      "owned_process_count": 4,
      "reclaimable_bytes": 10291478528,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 22.236940625,
      "owned_rss_bytes": 315293696,
      "owned_process_count": 4,
      "reclaimable_bytes": 10247667712,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 22.461826333,
      "owned_rss_bytes": 367689728,
      "owned_process_count": 4,
      "reclaimable_bytes": 10214129664,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 22.686798458,
      "owned_rss_bytes": 396656640,
      "owned_process_count": 4,
      "reclaimable_bytes": 10190225408,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 22.912015208,
      "owned_rss_bytes": 420610048,
      "owned_process_count": 4,
      "reclaimable_bytes": 10164797440,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 23.133706749999998,
      "owned_rss_bytes": 425574400,
      "owned_process_count": 4,
      "reclaimable_bytes": 10163355648,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 23.358960833,
      "owned_rss_bytes": 432390144,
      "owned_process_count": 4,
      "reclaimable_bytes": 9950773248,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 23.584455833,
      "owned_rss_bytes": 433176576,
      "owned_process_count": 4,
      "reclaimable_bytes": 10035691520,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 23.809989875,
      "owned_rss_bytes": 180584448,
      "owned_process_count": 4,
      "reclaimable_bytes": 10217701376,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 24.030194833,
      "owned_rss_bytes": 322961408,
      "owned_process_count": 4,
      "reclaimable_bytes": 10113794048,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 24.255944958,
      "owned_rss_bytes": 370638848,
      "owned_process_count": 4,
      "reclaimable_bytes": 10196582400,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 24.481423958,
      "owned_rss_bytes": 395984896,
      "owned_process_count": 4,
      "reclaimable_bytes": 10249945088,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 24.706785917,
      "owned_rss_bytes": 418250752,
      "owned_process_count": 4,
      "reclaimable_bytes": 10236854272,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 24.929542792,
      "owned_rss_bytes": 443482112,
      "owned_process_count": 4,
      "reclaimable_bytes": 10212671488,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 25.154691917,
      "owned_rss_bytes": 459751424,
      "owned_process_count": 4,
      "reclaimable_bytes": 9926656000,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 25.380212792,
      "owned_rss_bytes": 463060992,
      "owned_process_count": 4,
      "reclaimable_bytes": 9925804032,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 25.605170833,
      "owned_rss_bytes": 471121920,
      "owned_process_count": 4,
      "reclaimable_bytes": 9921937408,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 25.830374083,
      "owned_rss_bytes": 471171072,
      "owned_process_count": 4,
      "reclaimable_bytes": 9922543616,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 26.055351708,
      "owned_rss_bytes": 473743360,
      "owned_process_count": 4,
      "reclaimable_bytes": 9915924480,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 26.276761957999998,
      "owned_rss_bytes": 477691904,
      "owned_process_count": 4,
      "reclaimable_bytes": 10188308480,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 26.499432249999998,
      "owned_rss_bytes": 478445568,
      "owned_process_count": 4,
      "reclaimable_bytes": 10190422016,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 26.721266625,
      "owned_rss_bytes": 478543872,
      "owned_process_count": 4,
      "reclaimable_bytes": 10131111936,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 26.946506375,
      "owned_rss_bytes": 478724096,
      "owned_process_count": 4,
      "reclaimable_bytes": 9906077696,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 27.167357457999998,
      "owned_rss_bytes": 170328064,
      "owned_process_count": 4,
      "reclaimable_bytes": 10120282112,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 27.392970625,
      "owned_rss_bytes": 219873280,
      "owned_process_count": 4,
      "reclaimable_bytes": 10074701824,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 27.615530833,
      "owned_rss_bytes": 276381696,
      "owned_process_count": 4,
      "reclaimable_bytes": 10037575680,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 27.841488,
      "owned_rss_bytes": 284409856,
      "owned_process_count": 4,
      "reclaimable_bytes": 10156146688,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 28.064490833,
      "owned_rss_bytes": 334331904,
      "owned_process_count": 4,
      "reclaimable_bytes": 10036903936,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 28.286406582999998,
      "owned_rss_bytes": 183336960,
      "owned_process_count": 4,
      "reclaimable_bytes": 10096902144,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 28.511442792,
      "owned_rss_bytes": 242532352,
      "owned_process_count": 4,
      "reclaimable_bytes": 10043801600,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 28.734370417,
      "owned_rss_bytes": 307724288,
      "owned_process_count": 4,
      "reclaimable_bytes": 10051633152,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 28.960241875,
      "owned_rss_bytes": 372031488,
      "owned_process_count": 4,
      "reclaimable_bytes": 9994780672,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 29.186684542,
      "owned_rss_bytes": 407486464,
      "owned_process_count": 4,
      "reclaimable_bytes": 9979052032,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 29.411674542,
      "owned_rss_bytes": 416382976,
      "owned_process_count": 4,
      "reclaimable_bytes": 10066919424,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 29.636889417,
      "owned_rss_bytes": 425934848,
      "owned_process_count": 4,
      "reclaimable_bytes": 10062626816,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 29.861850875,
      "owned_rss_bytes": 463028224,
      "owned_process_count": 4,
      "reclaimable_bytes": 9933832192,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 30.08741075,
      "owned_rss_bytes": 189087744,
      "owned_process_count": 4,
      "reclaimable_bytes": 10187423744,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 30.312834667,
      "owned_rss_bytes": 342261760,
      "owned_process_count": 4,
      "reclaimable_bytes": 10115383296,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 30.539457625,
      "owned_rss_bytes": 356417536,
      "owned_process_count": 4,
      "reclaimable_bytes": 10104160256,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 30.764855667,
      "owned_rss_bytes": 191545344,
      "owned_process_count": 4,
      "reclaimable_bytes": 10171056128,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 30.988035625,
      "owned_rss_bytes": 255098880,
      "owned_process_count": 4,
      "reclaimable_bytes": 10366255104,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 31.218213917,
      "owned_rss_bytes": 172867584,
      "owned_process_count": 4,
      "reclaimable_bytes": 10468032512,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 31.439487458,
      "owned_rss_bytes": 235831296,
      "owned_process_count": 4,
      "reclaimable_bytes": 10335256576,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 31.664943375,
      "owned_rss_bytes": 299335680,
      "owned_process_count": 4,
      "reclaimable_bytes": 10090528768,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 31.89196725,
      "owned_rss_bytes": 339345408,
      "owned_process_count": 4,
      "reclaimable_bytes": 10064396288,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 32.1176505,
      "owned_rss_bytes": 367099904,
      "owned_process_count": 4,
      "reclaimable_bytes": 10042474496,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 32.338014958,
      "owned_rss_bytes": 208470016,
      "owned_process_count": 4,
      "reclaimable_bytes": 10175283200,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 32.564031458,
      "owned_rss_bytes": 266272768,
      "owned_process_count": 4,
      "reclaimable_bytes": 10121674752,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 32.790213083000005,
      "owned_rss_bytes": 343801856,
      "owned_process_count": 4,
      "reclaimable_bytes": 10103013376,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 33.016313375,
      "owned_rss_bytes": 410337280,
      "owned_process_count": 4,
      "reclaimable_bytes": 10148380672,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 33.242533833,
      "owned_rss_bytes": 431505408,
      "owned_process_count": 4,
      "reclaimable_bytes": 10156326912,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 33.468108833,
      "owned_rss_bytes": 446709760,
      "owned_process_count": 4,
      "reclaimable_bytes": 9858646016,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 33.693473083,
      "owned_rss_bytes": 463912960,
      "owned_process_count": 4,
      "reclaimable_bytes": 9910779904,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 33.913244042,
      "owned_rss_bytes": 475938816,
      "owned_process_count": 4,
      "reclaimable_bytes": 9923575808,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 34.138345125,
      "owned_rss_bytes": 479461376,
      "owned_process_count": 4,
      "reclaimable_bytes": 10018766848,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 34.363345625,
      "owned_rss_bytes": 495108096,
      "owned_process_count": 4,
      "reclaimable_bytes": 10035888128,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 34.586256792,
      "owned_rss_bytes": 529727488,
      "owned_process_count": 4,
      "reclaimable_bytes": 10093395968,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 34.811220250000005,
      "owned_rss_bytes": 563314688,
      "owned_process_count": 4,
      "reclaimable_bytes": 9970679808,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 35.036567208,
      "owned_rss_bytes": 597131264,
      "owned_process_count": 4,
      "reclaimable_bytes": 9939304448,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 35.261428833000004,
      "owned_rss_bytes": 639451136,
      "owned_process_count": 4,
      "reclaimable_bytes": 9901031424,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 35.486609417000004,
      "owned_rss_bytes": 168591360,
      "owned_process_count": 4,
      "reclaimable_bytes": 10336092160,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 35.706487125,
      "owned_rss_bytes": 236388352,
      "owned_process_count": 4,
      "reclaimable_bytes": 10277126144,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 35.931104958000006,
      "owned_rss_bytes": 301580288,
      "owned_process_count": 4,
      "reclaimable_bytes": 10300162048,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 36.156542542000004,
      "owned_rss_bytes": 377176064,
      "owned_process_count": 4,
      "reclaimable_bytes": 10228580352,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 36.38180941700001,
      "owned_rss_bytes": 445726720,
      "owned_process_count": 4,
      "reclaimable_bytes": 10069786624,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 36.606979042000006,
      "owned_rss_bytes": 505380864,
      "owned_process_count": 4,
      "reclaimable_bytes": 10013966336,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 36.834666708,
      "owned_rss_bytes": 555057152,
      "owned_process_count": 4,
      "reclaimable_bytes": 9969319936,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 37.059825958000005,
      "owned_rss_bytes": 562692096,
      "owned_process_count": 4,
      "reclaimable_bytes": 9964257280,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 37.284970833,
      "owned_rss_bytes": 571899904,
      "owned_process_count": 4,
      "reclaimable_bytes": 9957670912,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 37.510040625,
      "owned_rss_bytes": 587497472,
      "owned_process_count": 4,
      "reclaimable_bytes": 9940828160,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 37.73522775,
      "owned_rss_bytes": 604291072,
      "owned_process_count": 4,
      "reclaimable_bytes": 10111533056,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 37.959469333,
      "owned_rss_bytes": 610959360,
      "owned_process_count": 4,
      "reclaimable_bytes": 10109272064,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 38.180206083,
      "owned_rss_bytes": 611876864,
      "owned_process_count": 4,
      "reclaimable_bytes": 10123116544,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 38.405569792,
      "owned_rss_bytes": 614596608,
      "owned_process_count": 4,
      "reclaimable_bytes": 10025041920,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 38.630652625,
      "owned_rss_bytes": 644956160,
      "owned_process_count": 4,
      "reclaimable_bytes": 9995386880,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 38.855668333000004,
      "owned_rss_bytes": 676085760,
      "owned_process_count": 4,
      "reclaimable_bytes": 9962848256,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 39.080546375000004,
      "owned_rss_bytes": 707248128,
      "owned_process_count": 4,
      "reclaimable_bytes": 9935241216,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 39.302681292,
      "owned_rss_bytes": 741343232,
      "owned_process_count": 4,
      "reclaimable_bytes": 9900294144,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 39.527699292,
      "owned_rss_bytes": 775503872,
      "owned_process_count": 4,
      "reclaimable_bytes": 9974759424,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 39.752975125000006,
      "owned_rss_bytes": 806338560,
      "owned_process_count": 4,
      "reclaimable_bytes": 9945333760,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 39.977719542,
      "owned_rss_bytes": 189399040,
      "owned_process_count": 4,
      "reclaimable_bytes": 10327474176,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 40.202693167,
      "owned_rss_bytes": 258277376,
      "owned_process_count": 4,
      "reclaimable_bytes": 10260791296,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 40.428137292,
      "owned_rss_bytes": 327974912,
      "owned_process_count": 4,
      "reclaimable_bytes": 10206494720,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 40.652935208,
      "owned_rss_bytes": 340525056,
      "owned_process_count": 4,
      "reclaimable_bytes": 10199252992,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 40.877553125000006,
      "owned_rss_bytes": 375668736,
      "owned_process_count": 4,
      "reclaimable_bytes": 10365485056,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 41.10298275,
      "owned_rss_bytes": 220954624,
      "owned_process_count": 4,
      "reclaimable_bytes": 10297475072,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 41.32776975,
      "owned_rss_bytes": 283705344,
      "owned_process_count": 4,
      "reclaimable_bytes": 10232791040,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 41.553230208,
      "owned_rss_bytes": 350388224,
      "owned_process_count": 4,
      "reclaimable_bytes": 10169909248,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 41.778360792,
      "owned_rss_bytes": 408584192,
      "owned_process_count": 4,
      "reclaimable_bytes": 10119954432,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 42.003405792,
      "owned_rss_bytes": 423084032,
      "owned_process_count": 4,
      "reclaimable_bytes": 10069131264,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 42.230855417,
      "owned_rss_bytes": 446398464,
      "owned_process_count": 4,
      "reclaimable_bytes": 9939959808,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 42.456078000000005,
      "owned_rss_bytes": 480395264,
      "owned_process_count": 4,
      "reclaimable_bytes": 10073866240,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 42.681746000000004,
      "owned_rss_bytes": 221921280,
      "owned_process_count": 4,
      "reclaimable_bytes": 10034855936,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 42.906341375000004,
      "owned_rss_bytes": 186925056,
      "owned_process_count": 4,
      "reclaimable_bytes": 10071900160,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 43.130912208000005,
      "owned_rss_bytes": 252493824,
      "owned_process_count": 4,
      "reclaimable_bytes": 9913712640,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 43.35577154200001,
      "owned_rss_bytes": 322207744,
      "owned_process_count": 4,
      "reclaimable_bytes": 9864626176,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 43.580706333,
      "owned_rss_bytes": 169050112,
      "owned_process_count": 4,
      "reclaimable_bytes": 10147889152,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 43.805382417000004,
      "owned_rss_bytes": 237912064,
      "owned_process_count": 4,
      "reclaimable_bytes": 10084007936,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 44.030383792,
      "owned_rss_bytes": 299515904,
      "owned_process_count": 4,
      "reclaimable_bytes": 9921511424,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 44.252043,
      "owned_rss_bytes": 195346432,
      "owned_process_count": 4,
      "reclaimable_bytes": 10305208320,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 44.472671875,
      "owned_rss_bytes": 261128192,
      "owned_process_count": 4,
      "reclaimable_bytes": 10247684096,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 44.698187167,
      "owned_rss_bytes": 320913408,
      "owned_process_count": 4,
      "reclaimable_bytes": 10206740480,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 44.923034583,
      "owned_rss_bytes": 217890816,
      "owned_process_count": 4,
      "reclaimable_bytes": 10100801536,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 45.148055792,
      "owned_rss_bytes": 286752768,
      "owned_process_count": 4,
      "reclaimable_bytes": 10043703296,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 45.372786042,
      "owned_rss_bytes": 352993280,
      "owned_process_count": 4,
      "reclaimable_bytes": 9992863744,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 45.597628,
      "owned_rss_bytes": 365690880,
      "owned_process_count": 4,
      "reclaimable_bytes": 9978740736,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 45.822511000000006,
      "owned_rss_bytes": 390250496,
      "owned_process_count": 4,
      "reclaimable_bytes": 9966927872,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 46.046978042000006,
      "owned_rss_bytes": 421511168,
      "owned_process_count": 4,
      "reclaimable_bytes": 10344202240,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 46.267588667000005,
      "owned_rss_bytes": 222871552,
      "owned_process_count": 4,
      "reclaimable_bytes": 10287333376,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 46.492564125,
      "owned_rss_bytes": 293339136,
      "owned_process_count": 4,
      "reclaimable_bytes": 10221633536,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 46.717449875,
      "owned_rss_bytes": 369377280,
      "owned_process_count": 4,
      "reclaimable_bytes": 9862709248,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 46.942322417,
      "owned_rss_bytes": 438157312,
      "owned_process_count": 4,
      "reclaimable_bytes": 9793912832,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 47.167273708,
      "owned_rss_bytes": 504578048,
      "owned_process_count": 4,
      "reclaimable_bytes": 9729703936,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 47.392207000000006,
      "owned_rss_bytes": 562446336,
      "owned_process_count": 4,
      "reclaimable_bytes": 9673768960,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 47.617131375,
      "owned_rss_bytes": 626049024,
      "owned_process_count": 4,
      "reclaimable_bytes": 9603137536,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 47.8419955,
      "owned_rss_bytes": 701087744,
      "owned_process_count": 4,
      "reclaimable_bytes": 9540861952,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 48.066757958000004,
      "owned_rss_bytes": 730234880,
      "owned_process_count": 4,
      "reclaimable_bytes": 9518071808,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 48.291131375000006,
      "owned_rss_bytes": 737771520,
      "owned_process_count": 4,
      "reclaimable_bytes": 9505210368,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 48.515743500000006,
      "owned_rss_bytes": 747520000,
      "owned_process_count": 4,
      "reclaimable_bytes": 9588490240,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 48.7406075,
      "owned_rss_bytes": 757792768,
      "owned_process_count": 4,
      "reclaimable_bytes": 9482059776,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 48.96355675,
      "owned_rss_bytes": 798048256,
      "owned_process_count": 4,
      "reclaimable_bytes": 9442410496,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 49.187960208,
      "owned_rss_bytes": 805486592,
      "owned_process_count": 4,
      "reclaimable_bytes": 9436610560,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 49.412964375,
      "owned_rss_bytes": 812957696,
      "owned_process_count": 4,
      "reclaimable_bytes": 9429041152,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 49.634336250000004,
      "owned_rss_bytes": 821526528,
      "owned_process_count": 4,
      "reclaimable_bytes": 9414787072,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 49.855268,
      "owned_rss_bytes": 854671360,
      "owned_process_count": 4,
      "reclaimable_bytes": 9387343872,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 50.0799475,
      "owned_rss_bytes": 905936896,
      "owned_process_count": 4,
      "reclaimable_bytes": 9332506624,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 50.304963625000006,
      "owned_rss_bytes": 960102400,
      "owned_process_count": 4,
      "reclaimable_bytes": 9285042176,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 50.530606417,
      "owned_rss_bytes": 1006632960,
      "owned_process_count": 4,
      "reclaimable_bytes": 9238839296,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 50.755817208,
      "owned_rss_bytes": 1011482624,
      "owned_process_count": 4,
      "reclaimable_bytes": 9479241728,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 50.981467292000005,
      "owned_rss_bytes": 213188608,
      "owned_process_count": 4,
      "reclaimable_bytes": 10262495232,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 51.206800125,
      "owned_rss_bytes": 278577152,
      "owned_process_count": 4,
      "reclaimable_bytes": 10227367936,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 51.433249417000006,
      "owned_rss_bytes": 330006528,
      "owned_process_count": 4,
      "reclaimable_bytes": 10190290944,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 51.658462792,
      "owned_rss_bytes": 340508672,
      "owned_process_count": 4,
      "reclaimable_bytes": 9899458560,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 51.880995833,
      "owned_rss_bytes": 360710144,
      "owned_process_count": 4,
      "reclaimable_bytes": 9873326080,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 52.105440208000005,
      "owned_rss_bytes": 387268608,
      "owned_process_count": 4,
      "reclaimable_bytes": 9857728512,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 52.330974833000006,
      "owned_rss_bytes": 210026496,
      "owned_process_count": 4,
      "reclaimable_bytes": 10009837568,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 52.556112708,
      "owned_rss_bytes": 187531264,
      "owned_process_count": 4,
      "reclaimable_bytes": 10034216960,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 52.781515750000004,
      "owned_rss_bytes": 168034304,
      "owned_process_count": 4,
      "reclaimable_bytes": 10307289088,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 53.0064165,
      "owned_rss_bytes": 236994560,
      "owned_process_count": 4,
      "reclaimable_bytes": 10242490368,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 53.231900292000006,
      "owned_rss_bytes": 203210752,
      "owned_process_count": 4,
      "reclaimable_bytes": 10112401408,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 53.456777458000005,
      "owned_rss_bytes": 180273152,
      "owned_process_count": 4,
      "reclaimable_bytes": 10139451392,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 53.681663583,
      "owned_rss_bytes": 246923264,
      "owned_process_count": 4,
      "reclaimable_bytes": 10073145344,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 53.906768917,
      "owned_rss_bytes": 165330944,
      "owned_process_count": 4,
      "reclaimable_bytes": 10048798720,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 54.131616708,
      "owned_rss_bytes": 235323392,
      "owned_process_count": 4,
      "reclaimable_bytes": 9965617152,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 54.356629458,
      "owned_rss_bytes": 298221568,
      "owned_process_count": 4,
      "reclaimable_bytes": 9933144064,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 54.581516125,
      "owned_rss_bytes": 203079680,
      "owned_process_count": 4,
      "reclaimable_bytes": 10011901952,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 54.806704958000005,
      "owned_rss_bytes": 181157888,
      "owned_process_count": 4,
      "reclaimable_bytes": 10032021504,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 55.031970625,
      "owned_rss_bytes": 103022592,
      "owned_process_count": 3,
      "reclaimable_bytes": 10056728576,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 55.256500292000005,
      "owned_rss_bytes": 227737600,
      "owned_process_count": 4,
      "reclaimable_bytes": 10000728064,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 55.481522083,
      "owned_rss_bytes": 201588736,
      "owned_process_count": 4,
      "reclaimable_bytes": 10006593536,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 55.707081125,
      "owned_rss_bytes": 268992512,
      "owned_process_count": 4,
      "reclaimable_bytes": 9957064704,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 55.929372542,
      "owned_rss_bytes": 222265344,
      "owned_process_count": 4,
      "reclaimable_bytes": 10054811648,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 56.154582417,
      "owned_rss_bytes": 220561408,
      "owned_process_count": 4,
      "reclaimable_bytes": 9995255808,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 56.379822792000006,
      "owned_rss_bytes": 286998528,
      "owned_process_count": 4,
      "reclaimable_bytes": 9932898304,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 56.602229792,
      "owned_rss_bytes": 352305152,
      "owned_process_count": 4,
      "reclaimable_bytes": 9954394112,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 56.827705042000005,
      "owned_rss_bytes": 385155072,
      "owned_process_count": 4,
      "reclaimable_bytes": 9936601088,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 57.052897042000005,
      "owned_rss_bytes": 396165120,
      "owned_process_count": 4,
      "reclaimable_bytes": 9927065600,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 57.277906167000005,
      "owned_rss_bytes": 423575552,
      "owned_process_count": 4,
      "reclaimable_bytes": 10096443392,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 57.503238458000006,
      "owned_rss_bytes": 170852352,
      "owned_process_count": 4,
      "reclaimable_bytes": 10325999616,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 57.724073625,
      "owned_rss_bytes": 237600768,
      "owned_process_count": 4,
      "reclaimable_bytes": 10258186240,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 57.949251417000006,
      "owned_rss_bytes": 295927808,
      "owned_process_count": 4,
      "reclaimable_bytes": 10201546752,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 58.174518042,
      "owned_rss_bytes": 170835968,
      "owned_process_count": 4,
      "reclaimable_bytes": 10036199424,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 58.397616458,
      "owned_rss_bytes": 237535232,
      "owned_process_count": 4,
      "reclaimable_bytes": 9977643008,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 58.622834542,
      "owned_rss_bytes": 304857088,
      "owned_process_count": 4,
      "reclaimable_bytes": 9914105856,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 58.848280458000005,
      "owned_rss_bytes": 139083776,
      "owned_process_count": 4,
      "reclaimable_bytes": 10059874304,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 59.072880875,
      "owned_rss_bytes": 222478336,
      "owned_process_count": 4,
      "reclaimable_bytes": 9987620864,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 59.29810787500001,
      "owned_rss_bytes": 291487744,
      "owned_process_count": 4,
      "reclaimable_bytes": 10209525760,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 59.523271292000004,
      "owned_rss_bytes": 353959936,
      "owned_process_count": 4,
      "reclaimable_bytes": 10160848896,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 59.748377542,
      "owned_rss_bytes": 192249856,
      "owned_process_count": 4,
      "reclaimable_bytes": 10299621376,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 59.974209333000005,
      "owned_rss_bytes": 261373952,
      "owned_process_count": 4,
      "reclaimable_bytes": 9956147200,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 60.198802292,
      "owned_rss_bytes": 332546048,
      "owned_process_count": 4,
      "reclaimable_bytes": 9886810112,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 60.424288625,
      "owned_rss_bytes": 144261120,
      "owned_process_count": 4,
      "reclaimable_bytes": 10047864832,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 60.6490925,
      "owned_rss_bytes": 222380032,
      "owned_process_count": 4,
      "reclaimable_bytes": 9989521408,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 60.874211,
      "owned_rss_bytes": 292405248,
      "owned_process_count": 4,
      "reclaimable_bytes": 9924870144,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 61.099485542000004,
      "owned_rss_bytes": 151257088,
      "owned_process_count": 4,
      "reclaimable_bytes": 10118938624,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 61.324731333,
      "owned_rss_bytes": 225165312,
      "owned_process_count": 4,
      "reclaimable_bytes": 9993519104,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 61.549792875,
      "owned_rss_bytes": 294666240,
      "owned_process_count": 4,
      "reclaimable_bytes": 9926885376,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 61.774673667,
      "owned_rss_bytes": 357384192,
      "owned_process_count": 4,
      "reclaimable_bytes": 9875128320,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 61.999911833000006,
      "owned_rss_bytes": 207273984,
      "owned_process_count": 4,
      "reclaimable_bytes": 10008231936,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 62.22501345800001,
      "owned_rss_bytes": 276430848,
      "owned_process_count": 4,
      "reclaimable_bytes": 9943252992,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 62.44991554200001,
      "owned_rss_bytes": 348880896,
      "owned_process_count": 4,
      "reclaimable_bytes": 9980379136,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 62.675067708,
      "owned_rss_bytes": 205225984,
      "owned_process_count": 4,
      "reclaimable_bytes": 10107518976,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 62.896899333,
      "owned_rss_bytes": 270909440,
      "owned_process_count": 4,
      "reclaimable_bytes": 9946120192,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 63.121999417000005,
      "owned_rss_bytes": 344424448,
      "owned_process_count": 4,
      "reclaimable_bytes": 9876733952,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 63.3469355,
      "owned_rss_bytes": 382959616,
      "owned_process_count": 4,
      "reclaimable_bytes": 9852469248,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 63.568474833,
      "owned_rss_bytes": 176111616,
      "owned_process_count": 4,
      "reclaimable_bytes": 10033741824,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 63.788937208,
      "owned_rss_bytes": 242253824,
      "owned_process_count": 4,
      "reclaimable_bytes": 9974906880,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 64.014071083,
      "owned_rss_bytes": 314998784,
      "owned_process_count": 4,
      "reclaimable_bytes": 9964978176,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 64.240296,
      "owned_rss_bytes": 162447360,
      "owned_process_count": 4,
      "reclaimable_bytes": 10307567616,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 64.46530275,
      "owned_rss_bytes": 236027904,
      "owned_process_count": 4,
      "reclaimable_bytes": 10252746752,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 64.69080733300001,
      "owned_rss_bytes": 309575680,
      "owned_process_count": 4,
      "reclaimable_bytes": 10197336064,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 64.91469991700001,
      "owned_rss_bytes": 204193792,
      "owned_process_count": 4,
      "reclaimable_bytes": 10103504896,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 65.139803417,
      "owned_rss_bytes": 273203200,
      "owned_process_count": 4,
      "reclaimable_bytes": 10034675712,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 65.365038333,
      "owned_rss_bytes": 339673088,
      "owned_process_count": 4,
      "reclaimable_bytes": 9973710848,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 65.591035958,
      "owned_rss_bytes": 387432448,
      "owned_process_count": 4,
      "reclaimable_bytes": 9945645056,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 65.813998625,
      "owned_rss_bytes": 211812352,
      "owned_process_count": 4,
      "reclaimable_bytes": 10268540928,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 66.03407604200001,
      "owned_rss_bytes": 278364160,
      "owned_process_count": 4,
      "reclaimable_bytes": 10208542720,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 66.258898958,
      "owned_rss_bytes": 348569600,
      "owned_process_count": 4,
      "reclaimable_bytes": 10166812672,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 66.484178833,
      "owned_rss_bytes": 384417792,
      "owned_process_count": 4,
      "reclaimable_bytes": 9860071424,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 66.709376167,
      "owned_rss_bytes": 425967616,
      "owned_process_count": 4,
      "reclaimable_bytes": 9820078080,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 66.93434620800001,
      "owned_rss_bytes": 201293824,
      "owned_process_count": 4,
      "reclaimable_bytes": 10019209216,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 67.155145958,
      "owned_rss_bytes": 266371072,
      "owned_process_count": 4,
      "reclaimable_bytes": 9952411648,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 67.38017404200001,
      "owned_rss_bytes": 337608704,
      "owned_process_count": 4,
      "reclaimable_bytes": 9889415168,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 67.605641125,
      "owned_rss_bytes": 179421184,
      "owned_process_count": 4,
      "reclaimable_bytes": 10127556608,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 67.830717625,
      "owned_rss_bytes": 246562816,
      "owned_process_count": 4,
      "reclaimable_bytes": 9977315328,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 68.053047875,
      "owned_rss_bytes": 320962560,
      "owned_process_count": 4,
      "reclaimable_bytes": 9908125696,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 68.278307667,
      "owned_rss_bytes": 376651776,
      "owned_process_count": 4,
      "reclaimable_bytes": 9870819328,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 68.500022375,
      "owned_rss_bytes": 201490432,
      "owned_process_count": 4,
      "reclaimable_bytes": 10020012032,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 68.72524858300001,
      "owned_rss_bytes": 267878400,
      "owned_process_count": 4,
      "reclaimable_bytes": 9959391232,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 68.94923358300001,
      "owned_rss_bytes": 143179776,
      "owned_process_count": 4,
      "reclaimable_bytes": 10154409984,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 69.17390075,
      "owned_rss_bytes": 223166464,
      "owned_process_count": 4,
      "reclaimable_bytes": 10092232704,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 69.399629,
      "owned_rss_bytes": 292700160,
      "owned_process_count": 4,
      "reclaimable_bytes": 9933701120,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 69.625851333,
      "owned_rss_bytes": 358154240,
      "owned_process_count": 4,
      "reclaimable_bytes": 9868935168,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 69.84861070800001,
      "owned_rss_bytes": 404848640,
      "owned_process_count": 4,
      "reclaimable_bytes": 9836167168,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 70.073692625,
      "owned_rss_bytes": 417660928,
      "owned_process_count": 4,
      "reclaimable_bytes": 9838116864,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 70.295944167,
      "owned_rss_bytes": 449642496,
      "owned_process_count": 4,
      "reclaimable_bytes": 9813032960,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 70.52122333300001,
      "owned_rss_bytes": 488865792,
      "owned_process_count": 4,
      "reclaimable_bytes": 9774628864,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 70.74182533300001,
      "owned_rss_bytes": 199868416,
      "owned_process_count": 4,
      "reclaimable_bytes": 10285481984,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 70.967060875,
      "owned_rss_bytes": 267223040,
      "owned_process_count": 4,
      "reclaimable_bytes": 10217586688,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 71.192266833,
      "owned_rss_bytes": 336904192,
      "owned_process_count": 4,
      "reclaimable_bytes": 10160619520,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 71.417818458,
      "owned_rss_bytes": 198606848,
      "owned_process_count": 4,
      "reclaimable_bytes": 10033922048,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 71.642115333,
      "owned_rss_bytes": 265535488,
      "owned_process_count": 4,
      "reclaimable_bytes": 9968893952,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 71.863916042,
      "owned_rss_bytes": 335822848,
      "owned_process_count": 4,
      "reclaimable_bytes": 9916940288,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 72.085113,
      "owned_rss_bytes": 373850112,
      "owned_process_count": 4,
      "reclaimable_bytes": 9887809536,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 72.31041520800001,
      "owned_rss_bytes": 387481600,
      "owned_process_count": 4,
      "reclaimable_bytes": 9877848064,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 72.53571675,
      "owned_rss_bytes": 418840576,
      "owned_process_count": 4,
      "reclaimable_bytes": 10017325056,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 72.75797920800001,
      "owned_rss_bytes": 456916992,
      "owned_process_count": 4,
      "reclaimable_bytes": 10237837312,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 72.983191875,
      "owned_rss_bytes": 201474048,
      "owned_process_count": 4,
      "reclaimable_bytes": 10368712704,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 73.209060167,
      "owned_rss_bytes": 266960896,
      "owned_process_count": 4,
      "reclaimable_bytes": 10144841728,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 73.434142333,
      "owned_rss_bytes": 338018304,
      "owned_process_count": 4,
      "reclaimable_bytes": 10075422720,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 73.65932708300001,
      "owned_rss_bytes": 380452864,
      "owned_process_count": 4,
      "reclaimable_bytes": 10049683456,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 73.8844945,
      "owned_rss_bytes": 412975104,
      "owned_process_count": 4,
      "reclaimable_bytes": 10258694144,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 74.10704308300001,
      "owned_rss_bytes": 211697664,
      "owned_process_count": 4,
      "reclaimable_bytes": 10280108032,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 74.332650625,
      "owned_rss_bytes": 279527424,
      "owned_process_count": 4,
      "reclaimable_bytes": 10110943232,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 74.55751429200001,
      "owned_rss_bytes": 343949312,
      "owned_process_count": 4,
      "reclaimable_bytes": 10059874304,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 74.782962458,
      "owned_rss_bytes": 153255936,
      "owned_process_count": 4,
      "reclaimable_bytes": 10237329408,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 75.004285792,
      "owned_rss_bytes": 221872128,
      "owned_process_count": 4,
      "reclaimable_bytes": 10178478080,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 75.225990792,
      "owned_rss_bytes": 284950528,
      "owned_process_count": 4,
      "reclaimable_bytes": 10116497408,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 75.451304167,
      "owned_rss_bytes": 356958208,
      "owned_process_count": 4,
      "reclaimable_bytes": 10051043328,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 75.676815042,
      "owned_rss_bytes": 424312832,
      "owned_process_count": 4,
      "reclaimable_bytes": 10077290496,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 75.899613833,
      "owned_rss_bytes": 451837952,
      "owned_process_count": 4,
      "reclaimable_bytes": 10057695232,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 76.12490745800001,
      "owned_rss_bytes": 462028800,
      "owned_process_count": 4,
      "reclaimable_bytes": 9962094592,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 76.349996708,
      "owned_rss_bytes": 469516288,
      "owned_process_count": 4,
      "reclaimable_bytes": 9957851136,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 76.574844125,
      "owned_rss_bytes": 470106112,
      "owned_process_count": 4,
      "reclaimable_bytes": 9956016128,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 76.799705417,
      "owned_rss_bytes": 473776128,
      "owned_process_count": 4,
      "reclaimable_bytes": 9947103232,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 77.02383625,
      "owned_rss_bytes": 488964096,
      "owned_process_count": 4,
      "reclaimable_bytes": 9938157568,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 77.249379833,
      "owned_rss_bytes": 517079040,
      "owned_process_count": 4,
      "reclaimable_bytes": 10187554816,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 77.475620042,
      "owned_rss_bytes": 536395776,
      "owned_process_count": 4,
      "reclaimable_bytes": 10162536448,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 77.700795625,
      "owned_rss_bytes": 185909248,
      "owned_process_count": 4,
      "reclaimable_bytes": 10482286592,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 77.925992458,
      "owned_rss_bytes": 255590400,
      "owned_process_count": 4,
      "reclaimable_bytes": 10140909568,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 78.152280042,
      "owned_rss_bytes": 329629696,
      "owned_process_count": 4,
      "reclaimable_bytes": 10083991552,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 78.37723650000001,
      "owned_rss_bytes": 194412544,
      "owned_process_count": 4,
      "reclaimable_bytes": 10200547328,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 78.602344417,
      "owned_rss_bytes": 263028736,
      "owned_process_count": 4,
      "reclaimable_bytes": 10141073408,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 78.827246958,
      "owned_rss_bytes": 340901888,
      "owned_process_count": 4,
      "reclaimable_bytes": 10082926592,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 79.051065583,
      "owned_rss_bytes": 212434944,
      "owned_process_count": 4,
      "reclaimable_bytes": 10186424320,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 79.27165683300001,
      "owned_rss_bytes": 279724032,
      "owned_process_count": 4,
      "reclaimable_bytes": 10394697728,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 79.496916583,
      "owned_rss_bytes": 352698368,
      "owned_process_count": 4,
      "reclaimable_bytes": 10332160000,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 79.717645,
      "owned_rss_bytes": 181747712,
      "owned_process_count": 4,
      "reclaimable_bytes": 10302570496,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 79.942718375,
      "owned_rss_bytes": 249495552,
      "owned_process_count": 4,
      "reclaimable_bytes": 10240950272,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 80.16787525000001,
      "owned_rss_bytes": 321191936,
      "owned_process_count": 4,
      "reclaimable_bytes": 10177953792,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 80.39271825,
      "owned_rss_bytes": 203177984,
      "owned_process_count": 4,
      "reclaimable_bytes": 10185818112,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 80.617343,
      "owned_rss_bytes": 270630912,
      "owned_process_count": 4,
      "reclaimable_bytes": 10123149312,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 80.842377625,
      "owned_rss_bytes": 166510592,
      "owned_process_count": 4,
      "reclaimable_bytes": 10221010944,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 81.067251083,
      "owned_rss_bytes": 234782720,
      "owned_process_count": 4,
      "reclaimable_bytes": 10164338688,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 81.292401,
      "owned_rss_bytes": 310902784,
      "owned_process_count": 4,
      "reclaimable_bytes": 10089889792,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 81.517322083,
      "owned_rss_bytes": 375193600,
      "owned_process_count": 4,
      "reclaimable_bytes": 10026336256,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 81.74239275000001,
      "owned_rss_bytes": 405110784,
      "owned_process_count": 4,
      "reclaimable_bytes": 10010329088,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 81.96763591700001,
      "owned_rss_bytes": 443826176,
      "owned_process_count": 4,
      "reclaimable_bytes": 9976692736,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 82.19277825,
      "owned_rss_bytes": 186269696,
      "owned_process_count": 4,
      "reclaimable_bytes": 10295001088,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 82.415475,
      "owned_rss_bytes": 250052608,
      "owned_process_count": 4,
      "reclaimable_bytes": 10240655360,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 82.64079208300001,
      "owned_rss_bytes": 319913984,
      "owned_process_count": 4,
      "reclaimable_bytes": 10075684864,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 82.862020458,
      "owned_rss_bytes": 387858432,
      "owned_process_count": 4,
      "reclaimable_bytes": 10013278208,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 83.087044917,
      "owned_rss_bytes": 431210496,
      "owned_process_count": 4,
      "reclaimable_bytes": 9978216448,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 83.312042125,
      "owned_rss_bytes": 441958400,
      "owned_process_count": 4,
      "reclaimable_bytes": 9859907584,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 83.539016542,
      "owned_rss_bytes": 471252992,
      "owned_process_count": 4,
      "reclaimable_bytes": 9847865344,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 83.76530825,
      "owned_rss_bytes": 155860992,
      "owned_process_count": 4,
      "reclaimable_bytes": 10277830656,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 83.99126612500001,
      "owned_rss_bytes": 223330304,
      "owned_process_count": 4,
      "reclaimable_bytes": 10303963136,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 84.214397042,
      "owned_rss_bytes": 288702464,
      "owned_process_count": 4,
      "reclaimable_bytes": 10238263296,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 84.438650458,
      "owned_rss_bytes": 350863360,
      "owned_process_count": 4,
      "reclaimable_bytes": 10216112128,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 84.66367012500001,
      "owned_rss_bytes": 179830784,
      "owned_process_count": 4,
      "reclaimable_bytes": 10194894848,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 84.889337917,
      "owned_rss_bytes": 240582656,
      "owned_process_count": 4,
      "reclaimable_bytes": 10131898368,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 85.116441833,
      "owned_rss_bytes": 303726592,
      "owned_process_count": 4,
      "reclaimable_bytes": 10079436800,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 85.338168667,
      "owned_rss_bytes": 370507776,
      "owned_process_count": 4,
      "reclaimable_bytes": 10019454976,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 85.563583667,
      "owned_rss_bytes": 385662976,
      "owned_process_count": 4,
      "reclaimable_bytes": 10011000832,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 85.789701333,
      "owned_rss_bytes": 114098176,
      "owned_process_count": 3,
      "reclaimable_bytes": 10385227776,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 86.01366300000001,
      "owned_rss_bytes": 213925888,
      "owned_process_count": 4,
      "reclaimable_bytes": 10327359488,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 86.23935395800001,
      "owned_rss_bytes": 275316736,
      "owned_process_count": 4,
      "reclaimable_bytes": 10016522240,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 86.463664917,
      "owned_rss_bytes": 344752128,
      "owned_process_count": 4,
      "reclaimable_bytes": 9947561984,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 86.68958854200001,
      "owned_rss_bytes": 114098176,
      "owned_process_count": 4,
      "reclaimable_bytes": 10132881408,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 86.914614833,
      "owned_rss_bytes": 217612288,
      "owned_process_count": 4,
      "reclaimable_bytes": 10062725120,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 87.139838833,
      "owned_rss_bytes": 288309248,
      "owned_process_count": 4,
      "reclaimable_bytes": 10006364160,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 87.3649005,
      "owned_rss_bytes": 355106816,
      "owned_process_count": 4,
      "reclaimable_bytes": 9952231424,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 87.590368667,
      "owned_rss_bytes": 185417728,
      "owned_process_count": 4,
      "reclaimable_bytes": 10100047872,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 87.815488375,
      "owned_rss_bytes": 253952000,
      "owned_process_count": 4,
      "reclaimable_bytes": 10107502592,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 88.040734167,
      "owned_rss_bytes": 326811648,
      "owned_process_count": 4,
      "reclaimable_bytes": 10054467584,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 88.26625845800001,
      "owned_rss_bytes": 196984832,
      "owned_process_count": 4,
      "reclaimable_bytes": 10180034560,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 88.491836417,
      "owned_rss_bytes": 146735104,
      "owned_process_count": 4,
      "reclaimable_bytes": 10220027904,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 88.71644275,
      "owned_rss_bytes": 224051200,
      "owned_process_count": 4,
      "reclaimable_bytes": 10154688512,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 88.941365792,
      "owned_rss_bytes": 299630592,
      "owned_process_count": 4,
      "reclaimable_bytes": 10098671616,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 89.16633825000001,
      "owned_rss_bytes": 213336064,
      "owned_process_count": 4,
      "reclaimable_bytes": 10166861824,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 89.391474917,
      "owned_rss_bytes": 280838144,
      "owned_process_count": 4,
      "reclaimable_bytes": 10193846272,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 89.61728683300001,
      "owned_rss_bytes": 206815232,
      "owned_process_count": 4,
      "reclaimable_bytes": 10249732096,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 89.842176208,
      "owned_rss_bytes": 181223424,
      "owned_process_count": 4,
      "reclaimable_bytes": 10283204608,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 90.06704,
      "owned_rss_bytes": 245628928,
      "owned_process_count": 4,
      "reclaimable_bytes": 10227744768,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 90.292199208,
      "owned_rss_bytes": 298844160,
      "owned_process_count": 4,
      "reclaimable_bytes": 10188242944,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 90.517505083,
      "owned_rss_bytes": 353599488,
      "owned_process_count": 4,
      "reclaimable_bytes": 10309058560,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 90.742914458,
      "owned_rss_bytes": 420642816,
      "owned_process_count": 4,
      "reclaimable_bytes": 10242785280,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 90.968157167,
      "owned_rss_bytes": 464207872,
      "owned_process_count": 4,
      "reclaimable_bytes": 10215178240,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 91.192599583,
      "owned_rss_bytes": 472481792,
      "owned_process_count": 4,
      "reclaimable_bytes": 9927901184,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 91.41367625000001,
      "owned_rss_bytes": 483491840,
      "owned_process_count": 4,
      "reclaimable_bytes": 9922674688,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 91.63897025,
      "owned_rss_bytes": 497041408,
      "owned_process_count": 4,
      "reclaimable_bytes": 9914925056,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 91.86437525000001,
      "owned_rss_bytes": 500727808,
      "owned_process_count": 4,
      "reclaimable_bytes": 9910747136,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 92.087658167,
      "owned_rss_bytes": 528695296,
      "owned_process_count": 4,
      "reclaimable_bytes": 9883500544,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 92.312697833,
      "owned_rss_bytes": 562135040,
      "owned_process_count": 4,
      "reclaimable_bytes": 10042310656,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 92.5374525,
      "owned_rss_bytes": 592936960,
      "owned_process_count": 4,
      "reclaimable_bytes": 10105667584,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 92.762691583,
      "owned_rss_bytes": 624590848,
      "owned_process_count": 4,
      "reclaimable_bytes": 10080059392,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 92.987719208,
      "owned_rss_bytes": 158269440,
      "owned_process_count": 4,
      "reclaimable_bytes": 10335584256,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 93.21226908300001,
      "owned_rss_bytes": 215662592,
      "owned_process_count": 4,
      "reclaimable_bytes": 10267901952,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 93.437039708,
      "owned_rss_bytes": 282460160,
      "owned_process_count": 4,
      "reclaimable_bytes": 10209755136,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 93.662089833,
      "owned_rss_bytes": 351191040,
      "owned_process_count": 4,
      "reclaimable_bytes": 10056286208,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 93.887016708,
      "owned_rss_bytes": 416137216,
      "owned_process_count": 4,
      "reclaimable_bytes": 9997860864,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 94.112250542,
      "owned_rss_bytes": 160808960,
      "owned_process_count": 4,
      "reclaimable_bytes": 10225369088,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 94.33708679200001,
      "owned_rss_bytes": 229867520,
      "owned_process_count": 4,
      "reclaimable_bytes": 10163732480,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 94.562211167,
      "owned_rss_bytes": 296058880,
      "owned_process_count": 4,
      "reclaimable_bytes": 10081665024,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 94.787326167,
      "owned_rss_bytes": 358137856,
      "owned_process_count": 4,
      "reclaimable_bytes": 10119823360,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 95.009288208,
      "owned_rss_bytes": 437321728,
      "owned_process_count": 4,
      "reclaimable_bytes": 9956655104,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 95.234770958,
      "owned_rss_bytes": 460210176,
      "owned_process_count": 4,
      "reclaimable_bytes": 9938288640,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 95.459738083,
      "owned_rss_bytes": 470024192,
      "owned_process_count": 4,
      "reclaimable_bytes": 9929818112,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 95.684260333,
      "owned_rss_bytes": 475611136,
      "owned_process_count": 4,
      "reclaimable_bytes": 9925640192,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 95.905820833,
      "owned_rss_bytes": 481525760,
      "owned_process_count": 4,
      "reclaimable_bytes": 9919512576,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 96.131075042,
      "owned_rss_bytes": 486932480,
      "owned_process_count": 4,
      "reclaimable_bytes": 9913532416,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 96.356191167,
      "owned_rss_bytes": 495009792,
      "owned_process_count": 4,
      "reclaimable_bytes": 9999695872,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 96.581004667,
      "owned_rss_bytes": 499826688,
      "owned_process_count": 4,
      "reclaimable_bytes": 10001154048,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 96.806381125,
      "owned_rss_bytes": 505806848,
      "owned_process_count": 4,
      "reclaimable_bytes": 9996402688,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 97.031868875,
      "owned_rss_bytes": 509739008,
      "owned_process_count": 4,
      "reclaimable_bytes": 10159030272,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 97.256888792,
      "owned_rss_bytes": 512917504,
      "owned_process_count": 4,
      "reclaimable_bytes": 10162241536,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 97.481981917,
      "owned_rss_bytes": 534577152,
      "owned_process_count": 4,
      "reclaimable_bytes": 10158718976,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 97.706799083,
      "owned_rss_bytes": 565706752,
      "owned_process_count": 4,
      "reclaimable_bytes": 10129506304,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 97.93166512500001,
      "owned_rss_bytes": 594460672,
      "owned_process_count": 4,
      "reclaimable_bytes": 9816408064,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 98.156963,
      "owned_rss_bytes": 619659264,
      "owned_process_count": 4,
      "reclaimable_bytes": 9793257472,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 98.382888083,
      "owned_rss_bytes": 164675584,
      "owned_process_count": 4,
      "reclaimable_bytes": 10219438080,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 98.605001167,
      "owned_rss_bytes": 232390656,
      "owned_process_count": 4,
      "reclaimable_bytes": 10154852352,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 98.83034854200001,
      "owned_rss_bytes": 284852224,
      "owned_process_count": 4,
      "reclaimable_bytes": 10112892928,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 99.055851708,
      "owned_rss_bytes": 346079232,
      "owned_process_count": 4,
      "reclaimable_bytes": 10322329600,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 99.281432083,
      "owned_rss_bytes": 162873344,
      "owned_process_count": 4,
      "reclaimable_bytes": 10501849088,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 99.505936667,
      "owned_rss_bytes": 229801984,
      "owned_process_count": 4,
      "reclaimable_bytes": 10257252352,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 99.73114833300001,
      "owned_rss_bytes": 280018944,
      "owned_process_count": 4,
      "reclaimable_bytes": 10207903744,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 99.95657666700001,
      "owned_rss_bytes": 343162880,
      "owned_process_count": 4,
      "reclaimable_bytes": 10158325760,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 100.181621417,
      "owned_rss_bytes": 364560384,
      "owned_process_count": 4,
      "reclaimable_bytes": 10041016320,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 100.407890333,
      "owned_rss_bytes": 161185792,
      "owned_process_count": 4,
      "reclaimable_bytes": 10209624064,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 100.63293166700001,
      "owned_rss_bytes": 230785024,
      "owned_process_count": 4,
      "reclaimable_bytes": 10147053568,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 100.857012333,
      "owned_rss_bytes": 282951680,
      "owned_process_count": 4,
      "reclaimable_bytes": 10102177792,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 101.082505917,
      "owned_rss_bytes": 359055360,
      "owned_process_count": 4,
      "reclaimable_bytes": 10034413568,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 101.30799075,
      "owned_rss_bytes": 387809280,
      "owned_process_count": 4,
      "reclaimable_bytes": 10015260672,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 101.533554667,
      "owned_rss_bytes": 393691136,
      "owned_process_count": 4,
      "reclaimable_bytes": 10010656768,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 101.75852254200001,
      "owned_rss_bytes": 399261696,
      "owned_process_count": 4,
      "reclaimable_bytes": 10010574848,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 101.981016667,
      "owned_rss_bytes": 402948096,
      "owned_process_count": 4,
      "reclaimable_bytes": 10096181248,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 102.20612283300001,
      "owned_rss_bytes": 423247872,
      "owned_process_count": 4,
      "reclaimable_bytes": 10072244224,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 102.431376083,
      "owned_rss_bytes": 433012736,
      "owned_process_count": 4,
      "reclaimable_bytes": 10058989568,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 102.653189958,
      "owned_rss_bytes": 438272000,
      "owned_process_count": 4,
      "reclaimable_bytes": 9884581888,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 102.87967279200001,
      "owned_rss_bytes": 444973056,
      "owned_process_count": 4,
      "reclaimable_bytes": 9704308736,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 103.10436116700001,
      "owned_rss_bytes": 448495616,
      "owned_process_count": 4,
      "reclaimable_bytes": 9710682112,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 103.330094167,
      "owned_rss_bytes": 469975040,
      "owned_process_count": 4,
      "reclaimable_bytes": 9668870144,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 103.55670354200001,
      "owned_rss_bytes": 485687296,
      "owned_process_count": 4,
      "reclaimable_bytes": 9908092928,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 103.788703375,
      "owned_rss_bytes": 506806272,
      "owned_process_count": 4,
      "reclaimable_bytes": 9884385280,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 104.013713792,
      "owned_rss_bytes": 524140544,
      "owned_process_count": 4,
      "reclaimable_bytes": 9848848384,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 104.241010375,
      "owned_rss_bytes": 571162624,
      "owned_process_count": 4,
      "reclaimable_bytes": 9771499520,
      "swapins": 44106485,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 104.46496841700001,
      "owned_rss_bytes": 586629120,
      "owned_process_count": 4,
      "reclaimable_bytes": 9499148288,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 104.695654875,
      "owned_rss_bytes": 208535552,
      "owned_process_count": 4,
      "reclaimable_bytes": 9848406016,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 104.92150075,
      "owned_rss_bytes": 268566528,
      "owned_process_count": 4,
      "reclaimable_bytes": 9785720832,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 105.146397792,
      "owned_rss_bytes": 319766528,
      "owned_process_count": 4,
      "reclaimable_bytes": 9745481728,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 105.37054533300001,
      "owned_rss_bytes": 376930304,
      "owned_process_count": 4,
      "reclaimable_bytes": 9690595328,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 105.596166,
      "owned_rss_bytes": 441794560,
      "owned_process_count": 4,
      "reclaimable_bytes": 9899212800,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 105.821923208,
      "owned_rss_bytes": 451444736,
      "owned_process_count": 4,
      "reclaimable_bytes": 9884401664,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 106.04712341700001,
      "owned_rss_bytes": 455884800,
      "owned_process_count": 4,
      "reclaimable_bytes": 9624420352,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 106.274623,
      "owned_rss_bytes": 462061568,
      "owned_process_count": 4,
      "reclaimable_bytes": 9626845184,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 106.497045875,
      "owned_rss_bytes": 470089728,
      "owned_process_count": 4,
      "reclaimable_bytes": 9619095552,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 106.72375087500001,
      "owned_rss_bytes": 478822400,
      "owned_process_count": 4,
      "reclaimable_bytes": 9614114816,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 106.948779333,
      "owned_rss_bytes": 483868672,
      "owned_process_count": 4,
      "reclaimable_bytes": 9605169152,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 107.171543833,
      "owned_rss_bytes": 485244928,
      "owned_process_count": 4,
      "reclaimable_bytes": 9501327360,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 107.39615412500001,
      "owned_rss_bytes": 487653376,
      "owned_process_count": 4,
      "reclaimable_bytes": 9505964032,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 107.621081583,
      "owned_rss_bytes": 508624896,
      "owned_process_count": 4,
      "reclaimable_bytes": 9491759104,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 107.843110208,
      "owned_rss_bytes": 543195136,
      "owned_process_count": 4,
      "reclaimable_bytes": 9522724864,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 108.06783395800001,
      "owned_rss_bytes": 576618496,
      "owned_process_count": 4,
      "reclaimable_bytes": 9493250048,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 108.292688083,
      "owned_rss_bytes": 610910208,
      "owned_process_count": 4,
      "reclaimable_bytes": 9577660416,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 108.517577708,
      "owned_rss_bytes": 644120576,
      "owned_process_count": 4,
      "reclaimable_bytes": 9542451200,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 108.742159542,
      "owned_rss_bytes": 163741696,
      "owned_process_count": 4,
      "reclaimable_bytes": 9985867776,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 108.966641083,
      "owned_rss_bytes": 230014976,
      "owned_process_count": 4,
      "reclaimable_bytes": 9932898304,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 109.19151620800001,
      "owned_rss_bytes": 280887296,
      "owned_process_count": 4,
      "reclaimable_bytes": 9887907840,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 109.41664425,
      "owned_rss_bytes": 346030080,
      "owned_process_count": 4,
      "reclaimable_bytes": 9919184896,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 109.64172316700001,
      "owned_rss_bytes": 384843776,
      "owned_process_count": 4,
      "reclaimable_bytes": 9898655744,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 109.866635083,
      "owned_rss_bytes": 388923392,
      "owned_process_count": 4,
      "reclaimable_bytes": 9886105600,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 110.087899875,
      "owned_rss_bytes": 395673600,
      "owned_process_count": 4,
      "reclaimable_bytes": 9882189824,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 110.312831583,
      "owned_rss_bytes": 401932288,
      "owned_process_count": 4,
      "reclaimable_bytes": 10063413248,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 110.538224875,
      "owned_rss_bytes": 410632192,
      "owned_process_count": 4,
      "reclaimable_bytes": 10053615616,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 110.763553333,
      "owned_rss_bytes": 417710080,
      "owned_process_count": 4,
      "reclaimable_bytes": 10047553536,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 110.986891875,
      "owned_rss_bytes": 441237504,
      "owned_process_count": 4,
      "reclaimable_bytes": 9754886144,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 111.212385792,
      "owned_rss_bytes": 467517440,
      "owned_process_count": 4,
      "reclaimable_bytes": 9732489216,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 111.43746970800001,
      "owned_rss_bytes": 495386624,
      "owned_process_count": 4,
      "reclaimable_bytes": 9703096320,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 111.662305708,
      "owned_rss_bytes": 144900096,
      "owned_process_count": 4,
      "reclaimable_bytes": 10012819456,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 111.886806,
      "owned_rss_bytes": 224870400,
      "owned_process_count": 4,
      "reclaimable_bytes": 9947430912,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 112.111698458,
      "owned_rss_bytes": 297222144,
      "owned_process_count": 4,
      "reclaimable_bytes": 10141908992,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 112.33462,
      "owned_rss_bytes": 376078336,
      "owned_process_count": 4,
      "reclaimable_bytes": 10099179520,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 112.559634708,
      "owned_rss_bytes": 436486144,
      "owned_process_count": 4,
      "reclaimable_bytes": 10062331904,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 112.784930958,
      "owned_rss_bytes": 210108416,
      "owned_process_count": 4,
      "reclaimable_bytes": 10061414400,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 113.010076125,
      "owned_rss_bytes": 274808832,
      "owned_process_count": 4,
      "reclaimable_bytes": 9994682368,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 113.23561708300001,
      "owned_rss_bytes": 344915968,
      "owned_process_count": 4,
      "reclaimable_bytes": 9941188608,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 113.459329917,
      "owned_rss_bytes": 352862208,
      "owned_process_count": 4,
      "reclaimable_bytes": 9836380160,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 113.684550083,
      "owned_rss_bytes": 389120000,
      "owned_process_count": 4,
      "reclaimable_bytes": 9805332480,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 113.909652333,
      "owned_rss_bytes": 199081984,
      "owned_process_count": 4,
      "reclaimable_bytes": 9972793344,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 114.13426700000001,
      "owned_rss_bytes": 265568256,
      "owned_process_count": 4,
      "reclaimable_bytes": 9912631296,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 114.357155792,
      "owned_rss_bytes": 317079552,
      "owned_process_count": 4,
      "reclaimable_bytes": 9860317184,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 114.58278375,
      "owned_rss_bytes": 365346816,
      "owned_process_count": 4,
      "reclaimable_bytes": 9827549184,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 114.80299366700001,
      "owned_rss_bytes": 375177216,
      "owned_process_count": 4,
      "reclaimable_bytes": 9801547776,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 115.02764866700001,
      "owned_rss_bytes": 406274048,
      "owned_process_count": 4,
      "reclaimable_bytes": 9864609792,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 115.253488417,
      "owned_rss_bytes": 115130368,
      "owned_process_count": 4,
      "reclaimable_bytes": 10082729984,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 115.47878212500001,
      "owned_rss_bytes": 217612288,
      "owned_process_count": 4,
      "reclaimable_bytes": 10030071808,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 115.70388675000001,
      "owned_rss_bytes": 289456128,
      "owned_process_count": 4,
      "reclaimable_bytes": 9866248192,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 115.9289605,
      "owned_rss_bytes": 369836032,
      "owned_process_count": 4,
      "reclaimable_bytes": 9809231872,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 116.15415433300001,
      "owned_rss_bytes": 435077120,
      "owned_process_count": 4,
      "reclaimable_bytes": 9760735232,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 116.379130458,
      "owned_rss_bytes": 444366848,
      "owned_process_count": 4,
      "reclaimable_bytes": 9752887296,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 116.60440016700001,
      "owned_rss_bytes": 115163136,
      "owned_process_count": 4,
      "reclaimable_bytes": 10002579456,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 116.82456387500001,
      "owned_rss_bytes": 217661440,
      "owned_process_count": 4,
      "reclaimable_bytes": 10194714624,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 117.050118125,
      "owned_rss_bytes": 289472512,
      "owned_process_count": 4,
      "reclaimable_bytes": 10131046400,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 117.275099542,
      "owned_rss_bytes": 370556928,
      "owned_process_count": 4,
      "reclaimable_bytes": 10060054528,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 117.495770917,
      "owned_rss_bytes": 435290112,
      "owned_process_count": 4,
      "reclaimable_bytes": 10049044480,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 117.720633792,
      "owned_rss_bytes": 208863232,
      "owned_process_count": 4,
      "reclaimable_bytes": 9952706560,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 117.941766167,
      "owned_rss_bytes": 271597568,
      "owned_process_count": 4,
      "reclaimable_bytes": 9898311680,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 118.16465575000001,
      "owned_rss_bytes": 325648384,
      "owned_process_count": 4,
      "reclaimable_bytes": 9848897536,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 118.39005716700001,
      "owned_rss_bytes": 161988608,
      "owned_process_count": 4,
      "reclaimable_bytes": 9994452992,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 118.61505183300001,
      "owned_rss_bytes": 230752256,
      "owned_process_count": 4,
      "reclaimable_bytes": 9932210176,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 118.839183125,
      "owned_rss_bytes": 186548224,
      "owned_process_count": 4,
      "reclaimable_bytes": 10231611392,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 119.064115375,
      "owned_rss_bytes": 252755968,
      "owned_process_count": 4,
      "reclaimable_bytes": 10170515456,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 119.289491625,
      "owned_rss_bytes": 333316096,
      "owned_process_count": 4,
      "reclaimable_bytes": 9836150784,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 119.5151405,
      "owned_rss_bytes": 411107328,
      "owned_process_count": 4,
      "reclaimable_bytes": 9772253184,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 119.73684787500001,
      "owned_rss_bytes": 170557440,
      "owned_process_count": 4,
      "reclaimable_bytes": 9982492672,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 119.961884917,
      "owned_rss_bytes": 238665728,
      "owned_process_count": 4,
      "reclaimable_bytes": 9910632448,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 120.18709162500001,
      "owned_rss_bytes": 300859392,
      "owned_process_count": 4,
      "reclaimable_bytes": 9864167424,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 120.41318579200001,
      "owned_rss_bytes": 379797504,
      "owned_process_count": 4,
      "reclaimable_bytes": 9771483136,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 120.63425145800001,
      "owned_rss_bytes": 485408768,
      "owned_process_count": 4,
      "reclaimable_bytes": 9680470016,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 120.859612458,
      "owned_rss_bytes": 519028736,
      "owned_process_count": 4,
      "reclaimable_bytes": 9647915008,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 121.085050542,
      "owned_rss_bytes": 528400384,
      "owned_process_count": 4,
      "reclaimable_bytes": 9733210112,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 121.310365,
      "owned_rss_bytes": 537722880,
      "owned_process_count": 4,
      "reclaimable_bytes": 9732931584,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 121.53596704200001,
      "owned_rss_bytes": 548487168,
      "owned_process_count": 4,
      "reclaimable_bytes": 9632432128,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 121.76113562500001,
      "owned_rss_bytes": 560496640,
      "owned_process_count": 4,
      "reclaimable_bytes": 9620127744,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 121.986343875,
      "owned_rss_bytes": 572358656,
      "owned_process_count": 4,
      "reclaimable_bytes": 9609363456,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 122.211629417,
      "owned_rss_bytes": 581992448,
      "owned_process_count": 4,
      "reclaimable_bytes": 9592995840,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 122.434228417,
      "owned_rss_bytes": 591429632,
      "owned_process_count": 4,
      "reclaimable_bytes": 9587654656,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 122.659480042,
      "owned_rss_bytes": 601587712,
      "owned_process_count": 4,
      "reclaimable_bytes": 9576857600,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 122.88479037500001,
      "owned_rss_bytes": 612270080,
      "owned_process_count": 4,
      "reclaimable_bytes": 9566814208,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 123.110504292,
      "owned_rss_bytes": 623165440,
      "owned_process_count": 4,
      "reclaimable_bytes": 9568043008,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 123.33600187500001,
      "owned_rss_bytes": 633962496,
      "owned_process_count": 4,
      "reclaimable_bytes": 9820028928,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 123.559911583,
      "owned_rss_bytes": 644399104,
      "owned_process_count": 4,
      "reclaimable_bytes": 9829793792,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 123.784362708,
      "owned_rss_bytes": 658554880,
      "owned_process_count": 4,
      "reclaimable_bytes": 9815343104,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 124.009431625,
      "owned_rss_bytes": 673529856,
      "owned_process_count": 4,
      "reclaimable_bytes": 9801121792,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 124.23456262500001,
      "owned_rss_bytes": 688914432,
      "owned_process_count": 4,
      "reclaimable_bytes": 9606070272,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 124.459668875,
      "owned_rss_bytes": 703938560,
      "owned_process_count": 4,
      "reclaimable_bytes": 9587081216,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 124.681396375,
      "owned_rss_bytes": 718995456,
      "owned_process_count": 4,
      "reclaimable_bytes": 9570451456,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 124.90620579200001,
      "owned_rss_bytes": 730087424,
      "owned_process_count": 4,
      "reclaimable_bytes": 9560096768,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 125.132095042,
      "owned_rss_bytes": 734199808,
      "owned_process_count": 4,
      "reclaimable_bytes": 9552855040,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 125.35715875,
      "owned_rss_bytes": 735592448,
      "owned_process_count": 4,
      "reclaimable_bytes": 9739223040,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 125.582343042,
      "owned_rss_bytes": 737148928,
      "owned_process_count": 4,
      "reclaimable_bytes": 9737125888,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 125.807399958,
      "owned_rss_bytes": 738918400,
      "owned_process_count": 4,
      "reclaimable_bytes": 9734651904,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 126.03209612500001,
      "owned_rss_bytes": 740753408,
      "owned_process_count": 4,
      "reclaimable_bytes": 9451929600,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 126.25716237500001,
      "owned_rss_bytes": 742621184,
      "owned_process_count": 4,
      "reclaimable_bytes": 9455730688,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 126.48211633300001,
      "owned_rss_bytes": 744603648,
      "owned_process_count": 4,
      "reclaimable_bytes": 9449390080,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 126.707344292,
      "owned_rss_bytes": 746438656,
      "owned_process_count": 4,
      "reclaimable_bytes": 9449209856,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 126.9322665,
      "owned_rss_bytes": 748404736,
      "owned_process_count": 4,
      "reclaimable_bytes": 9448456192,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 127.155052125,
      "owned_rss_bytes": 750305280,
      "owned_process_count": 4,
      "reclaimable_bytes": 9534947328,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 127.37598700000001,
      "owned_rss_bytes": 752222208,
      "owned_process_count": 4,
      "reclaimable_bytes": 9446670336,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 127.601366625,
      "owned_rss_bytes": 755744768,
      "owned_process_count": 4,
      "reclaimable_bytes": 9446653952,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 127.826560417,
      "owned_rss_bytes": 756563968,
      "owned_process_count": 4,
      "reclaimable_bytes": 9446440960,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 128.050902458,
      "owned_rss_bytes": 757383168,
      "owned_process_count": 4,
      "reclaimable_bytes": 9443033088,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 128.27583975,
      "owned_rss_bytes": 758251520,
      "owned_process_count": 4,
      "reclaimable_bytes": 9441296384,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 128.5022165,
      "owned_rss_bytes": 759103488,
      "owned_process_count": 4,
      "reclaimable_bytes": 9538535424,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 128.727099125,
      "owned_rss_bytes": 759955456,
      "owned_process_count": 4,
      "reclaimable_bytes": 9538813952,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 128.95092424999999,
      "owned_rss_bytes": 766148608,
      "owned_process_count": 4,
      "reclaimable_bytes": 9428631552,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 129.175618625,
      "owned_rss_bytes": 790233088,
      "owned_process_count": 4,
      "reclaimable_bytes": 9412149248,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 129.400631458,
      "owned_rss_bytes": 816726016,
      "owned_process_count": 4,
      "reclaimable_bytes": 9386393600,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 129.62572691699998,
      "owned_rss_bytes": 843104256,
      "owned_process_count": 4,
      "reclaimable_bytes": 9359474688,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 129.84575604199998,
      "owned_rss_bytes": 870694912,
      "owned_process_count": 4,
      "reclaimable_bytes": 9331310592,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 130.07065591699998,
      "owned_rss_bytes": 898138112,
      "owned_process_count": 4,
      "reclaimable_bytes": 9300148224,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 130.292519208,
      "owned_rss_bytes": 925794304,
      "owned_process_count": 4,
      "reclaimable_bytes": 9527967744,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 130.51751962499998,
      "owned_rss_bytes": 953139200,
      "owned_process_count": 4,
      "reclaimable_bytes": 9523445760,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 130.74232304199998,
      "owned_rss_bytes": 981843968,
      "owned_process_count": 4,
      "reclaimable_bytes": 9492430848,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 130.967532958,
      "owned_rss_bytes": 1010532352,
      "owned_process_count": 4,
      "reclaimable_bytes": 9183084544,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 131.192306,
      "owned_rss_bytes": 1039712256,
      "owned_process_count": 4,
      "reclaimable_bytes": 9164898304,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 131.41548395799998,
      "owned_rss_bytes": 1069400064,
      "owned_process_count": 4,
      "reclaimable_bytes": 9135128576,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 131.644270542,
      "owned_rss_bytes": 1098366976,
      "owned_process_count": 4,
      "reclaimable_bytes": 9109274624,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 131.869804792,
      "owned_rss_bytes": 1127415808,
      "owned_process_count": 4,
      "reclaimable_bytes": 9342877696,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 132.095533833,
      "owned_rss_bytes": 1157169152,
      "owned_process_count": 4,
      "reclaimable_bytes": 9321349120,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 132.32487595799998,
      "owned_rss_bytes": 1186349056,
      "owned_process_count": 4,
      "reclaimable_bytes": 9319628800,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 132.55031824999998,
      "owned_rss_bytes": 1215545344,
      "owned_process_count": 4,
      "reclaimable_bytes": 8998551552,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 132.777851167,
      "owned_rss_bytes": 1245151232,
      "owned_process_count": 4,
      "reclaimable_bytes": 8973254656,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 133.000807792,
      "owned_rss_bytes": 1273626624,
      "owned_process_count": 4,
      "reclaimable_bytes": 9107226624,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 133.226694875,
      "owned_rss_bytes": 1303805952,
      "owned_process_count": 4,
      "reclaimable_bytes": 9081356288,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 133.451642917,
      "owned_rss_bytes": 1331724288,
      "owned_process_count": 4,
      "reclaimable_bytes": 9053044736,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 133.676723208,
      "owned_rss_bytes": 1359331328,
      "owned_process_count": 4,
      "reclaimable_bytes": 9025830912,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 133.900905083,
      "owned_rss_bytes": 1387970560,
      "owned_process_count": 4,
      "reclaimable_bytes": 8998748160,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 134.12619016699998,
      "owned_rss_bytes": 1416413184,
      "owned_process_count": 4,
      "reclaimable_bytes": 8967471104,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 134.351402042,
      "owned_rss_bytes": 1445183488,
      "owned_process_count": 4,
      "reclaimable_bytes": 8940748800,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 134.571627375,
      "owned_rss_bytes": 1472577536,
      "owned_process_count": 4,
      "reclaimable_bytes": 9013673984,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 134.792625708,
      "owned_rss_bytes": 1500151808,
      "owned_process_count": 4,
      "reclaimable_bytes": 8882438144,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 135.01801941699998,
      "owned_rss_bytes": 1527955456,
      "owned_process_count": 4,
      "reclaimable_bytes": 8850112512,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 135.23981891699998,
      "owned_rss_bytes": 1583005696,
      "owned_process_count": 4,
      "reclaimable_bytes": 8792014848,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 135.46483183299998,
      "owned_rss_bytes": 1608466432,
      "owned_process_count": 4,
      "reclaimable_bytes": 8767913984,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 135.690207083,
      "owned_rss_bytes": 1641037824,
      "owned_process_count": 4,
      "reclaimable_bytes": 8732491776,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 135.91563087499998,
      "owned_rss_bytes": 1674739712,
      "owned_process_count": 4,
      "reclaimable_bytes": 8658354176,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 136.14164541699998,
      "owned_rss_bytes": 166641664,
      "owned_process_count": 4,
      "reclaimable_bytes": 10188636160,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 136.366721333,
      "owned_rss_bytes": 233422848,
      "owned_process_count": 4,
      "reclaimable_bytes": 10132357120,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 136.5917795,
      "owned_rss_bytes": 302137344,
      "owned_process_count": 4,
      "reclaimable_bytes": 10065068032,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 136.81700845799998,
      "owned_rss_bytes": 152223744,
      "owned_process_count": 4,
      "reclaimable_bytes": 10455515136,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 137.042082542,
      "owned_rss_bytes": 225656832,
      "owned_process_count": 4,
      "reclaimable_bytes": 10392141824,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 137.267255792,
      "owned_rss_bytes": 298156032,
      "owned_process_count": 4,
      "reclaimable_bytes": 10326573056,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 137.492385542,
      "owned_rss_bytes": 152305664,
      "owned_process_count": 4,
      "reclaimable_bytes": 10201350144,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 137.716431917,
      "owned_rss_bytes": 227655680,
      "owned_process_count": 4,
      "reclaimable_bytes": 10142515200,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 137.94162783299998,
      "owned_rss_bytes": 305102848,
      "owned_process_count": 4,
      "reclaimable_bytes": 10071113728,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 138.166501875,
      "owned_rss_bytes": 152092672,
      "owned_process_count": 4,
      "reclaimable_bytes": 10202988544,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 138.386622875,
      "owned_rss_bytes": 225099776,
      "owned_process_count": 4,
      "reclaimable_bytes": 10145054720,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 138.611959875,
      "owned_rss_bytes": 294092800,
      "owned_process_count": 4,
      "reclaimable_bytes": 10077519872,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 138.836982625,
      "owned_rss_bytes": 356417536,
      "owned_process_count": 4,
      "reclaimable_bytes": 10281304064,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 139.05793874999998,
      "owned_rss_bytes": 365871104,
      "owned_process_count": 4,
      "reclaimable_bytes": 10271080448,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 139.283502208,
      "owned_rss_bytes": 374898688,
      "owned_process_count": 4,
      "reclaimable_bytes": 10095575040,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 139.50829895799998,
      "owned_rss_bytes": 375930880,
      "owned_process_count": 4,
      "reclaimable_bytes": 10106699776,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 139.73312554199998,
      "owned_rss_bytes": 376291328,
      "owned_process_count": 4,
      "reclaimable_bytes": 10103685120,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 139.95891716699998,
      "owned_rss_bytes": 381337600,
      "owned_process_count": 4,
      "reclaimable_bytes": 10001317888,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 140.183886167,
      "owned_rss_bytes": 403488768,
      "owned_process_count": 4,
      "reclaimable_bytes": 9981394944,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 140.40893954199998,
      "owned_rss_bytes": 422445056,
      "owned_process_count": 4,
      "reclaimable_bytes": 9962061824,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 140.633809125,
      "owned_rss_bytes": 443744256,
      "owned_process_count": 4,
      "reclaimable_bytes": 9940549632,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 140.85889425,
      "owned_rss_bytes": 213647360,
      "owned_process_count": 4,
      "reclaimable_bytes": 10147708928,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 141.084070667,
      "owned_rss_bytes": 281870336,
      "owned_process_count": 4,
      "reclaimable_bytes": 10172825600,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 141.309244125,
      "owned_rss_bytes": 153468928,
      "owned_process_count": 4,
      "reclaimable_bytes": 10195484672,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 141.534511875,
      "owned_rss_bytes": 227229696,
      "owned_process_count": 4,
      "reclaimable_bytes": 10135617536,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 141.75982995799998,
      "owned_rss_bytes": 180043776,
      "owned_process_count": 4,
      "reclaimable_bytes": 10174660608,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 141.984797,
      "owned_rss_bytes": 246792192,
      "owned_process_count": 4,
      "reclaimable_bytes": 10112499712,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 142.21049374999998,
      "owned_rss_bytes": 324845568,
      "owned_process_count": 4,
      "reclaimable_bytes": 10047291392,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 142.43539612499998,
      "owned_rss_bytes": 401211392,
      "owned_process_count": 4,
      "reclaimable_bytes": 9986244608,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 142.660978958,
      "owned_rss_bytes": 451887104,
      "owned_process_count": 4,
      "reclaimable_bytes": 9957539840,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 142.88643366699998,
      "owned_rss_bytes": 208896000,
      "owned_process_count": 4,
      "reclaimable_bytes": 10154131456,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 143.11154125,
      "owned_rss_bytes": 274481152,
      "owned_process_count": 4,
      "reclaimable_bytes": 10091741184,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 143.334885792,
      "owned_rss_bytes": 354500608,
      "owned_process_count": 4,
      "reclaimable_bytes": 10271391744,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 143.559412708,
      "owned_rss_bytes": 422510592,
      "owned_process_count": 4,
      "reclaimable_bytes": 10239475712,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 143.780631417,
      "owned_rss_bytes": 103497728,
      "owned_process_count": 3,
      "reclaimable_bytes": 10484252672,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 144.00562195799998,
      "owned_rss_bytes": 221560832,
      "owned_process_count": 4,
      "reclaimable_bytes": 10240720896,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 144.232042958,
      "owned_rss_bytes": 288227328,
      "owned_process_count": 4,
      "reclaimable_bytes": 10180706304,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 144.45738774999998,
      "owned_rss_bytes": 207028224,
      "owned_process_count": 4,
      "reclaimable_bytes": 10248962048,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 144.682510958,
      "owned_rss_bytes": 199131136,
      "owned_process_count": 4,
      "reclaimable_bytes": 10260496384,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 144.90733,
      "owned_rss_bytes": 265863168,
      "owned_process_count": 4,
      "reclaimable_bytes": 10197778432,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 145.132612167,
      "owned_rss_bytes": 317030400,
      "owned_process_count": 4,
      "reclaimable_bytes": 10154278912,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 145.357859417,
      "owned_rss_bytes": 388202496,
      "owned_process_count": 4,
      "reclaimable_bytes": 10254057472,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 145.58367875,
      "owned_rss_bytes": 473137152,
      "owned_process_count": 4,
      "reclaimable_bytes": 10181115904,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 145.80875966699998,
      "owned_rss_bytes": 508887040,
      "owned_process_count": 4,
      "reclaimable_bytes": 9866330112,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 146.03378520799998,
      "owned_rss_bytes": 515899392,
      "owned_process_count": 4,
      "reclaimable_bytes": 9867821056,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 146.259169542,
      "owned_rss_bytes": 527663104,
      "owned_process_count": 4,
      "reclaimable_bytes": 9882025984,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 146.48461412499998,
      "owned_rss_bytes": 540000256,
      "owned_process_count": 4,
      "reclaimable_bytes": 9871376384,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 146.70958241699998,
      "owned_rss_bytes": 552517632,
      "owned_process_count": 4,
      "reclaimable_bytes": 9858596864,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 146.93476745799998,
      "owned_rss_bytes": 565248000,
      "owned_process_count": 4,
      "reclaimable_bytes": 9931866112,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 147.15983170799998,
      "owned_rss_bytes": 578437120,
      "owned_process_count": 4,
      "reclaimable_bytes": 9837477888,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 147.39395549999998,
      "owned_rss_bytes": 599801856,
      "owned_process_count": 4,
      "reclaimable_bytes": 9813147648,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 147.6168955,
      "owned_rss_bytes": 612581376,
      "owned_process_count": 4,
      "reclaimable_bytes": 9800237056,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 147.84243687499998,
      "owned_rss_bytes": 620773376,
      "owned_process_count": 4,
      "reclaimable_bytes": 9795829760,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 148.06772891699998,
      "owned_rss_bytes": 633847808,
      "owned_process_count": 4,
      "reclaimable_bytes": 9783164928,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 148.29280062499998,
      "owned_rss_bytes": 634716160,
      "owned_process_count": 4,
      "reclaimable_bytes": 9869230080,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 148.517893583,
      "owned_rss_bytes": 635617280,
      "owned_process_count": 4,
      "reclaimable_bytes": 9875505152,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 148.742522875,
      "owned_rss_bytes": 641712128,
      "owned_process_count": 4,
      "reclaimable_bytes": 9770631168,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 148.96804412499998,
      "owned_rss_bytes": 672841728,
      "owned_process_count": 4,
      "reclaimable_bytes": 9741189120,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 149.19301579199998,
      "owned_rss_bytes": 673185792,
      "owned_process_count": 4,
      "reclaimable_bytes": 9743237120,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 149.41803458299998,
      "owned_rss_bytes": 674070528,
      "owned_process_count": 4,
      "reclaimable_bytes": 9741303808,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 149.64329504199998,
      "owned_rss_bytes": 685522944,
      "owned_process_count": 4,
      "reclaimable_bytes": 9736814592,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 149.866229958,
      "owned_rss_bytes": 713326592,
      "owned_process_count": 4,
      "reclaimable_bytes": 9710501888,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 150.091272167,
      "owned_rss_bytes": 715390976,
      "owned_process_count": 4,
      "reclaimable_bytes": 9957425152,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 150.316135625,
      "owned_rss_bytes": 750403584,
      "owned_process_count": 4,
      "reclaimable_bytes": 9903341568,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 150.54032387499998,
      "owned_rss_bytes": 786628608,
      "owned_process_count": 4,
      "reclaimable_bytes": 9901195264,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 150.761044208,
      "owned_rss_bytes": 822935552,
      "owned_process_count": 4,
      "reclaimable_bytes": 9689235456,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 150.986329292,
      "owned_rss_bytes": 859717632,
      "owned_process_count": 4,
      "reclaimable_bytes": 9655484416,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 151.21116841699998,
      "owned_rss_bytes": 896237568,
      "owned_process_count": 4,
      "reclaimable_bytes": 9618210816,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 151.435344375,
      "owned_rss_bytes": 932462592,
      "owned_process_count": 4,
      "reclaimable_bytes": 9580478464,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 151.660600833,
      "owned_rss_bytes": 947077120,
      "owned_process_count": 4,
      "reclaimable_bytes": 9571794944,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 151.88466566699998,
      "owned_rss_bytes": 959250432,
      "owned_process_count": 4,
      "reclaimable_bytes": 9724149760,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 152.109783,
      "owned_rss_bytes": 1013530624,
      "owned_process_count": 4,
      "reclaimable_bytes": 9677996032,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 152.33417104199998,
      "owned_rss_bytes": 1000734720,
      "owned_process_count": 4,
      "reclaimable_bytes": 9423912960,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 152.558981542,
      "owned_rss_bytes": 1029308416,
      "owned_process_count": 4,
      "reclaimable_bytes": 9394929664,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 152.78461687499998,
      "owned_rss_bytes": 169852928,
      "owned_process_count": 4,
      "reclaimable_bytes": 10223566848,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 153.009299833,
      "owned_rss_bytes": 236879872,
      "owned_process_count": 4,
      "reclaimable_bytes": 10164764672,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 153.23114770799998,
      "owned_rss_bytes": 309886976,
      "owned_process_count": 4,
      "reclaimable_bytes": 10095771648,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 153.456167917,
      "owned_rss_bytes": 388923392,
      "owned_process_count": 4,
      "reclaimable_bytes": 10123739136,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 153.682406792,
      "owned_rss_bytes": 445431808,
      "owned_process_count": 4,
      "reclaimable_bytes": 9976594432,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 153.907562125,
      "owned_rss_bytes": 452460544,
      "owned_process_count": 4,
      "reclaimable_bytes": 9968205824,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 154.132544083,
      "owned_rss_bytes": 461127680,
      "owned_process_count": 4,
      "reclaimable_bytes": 9960472576,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 154.354291083,
      "owned_rss_bytes": 471629824,
      "owned_process_count": 4,
      "reclaimable_bytes": 9947627520,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 154.57963254199998,
      "owned_rss_bytes": 497303552,
      "owned_process_count": 4,
      "reclaimable_bytes": 9924608000,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 154.80467895799998,
      "owned_rss_bytes": 534773760,
      "owned_process_count": 4,
      "reclaimable_bytes": 9982214144,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 155.03014675,
      "owned_rss_bytes": 191119360,
      "owned_process_count": 4,
      "reclaimable_bytes": 10290528256,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 155.25268029199998,
      "owned_rss_bytes": 255639552,
      "owned_process_count": 4,
      "reclaimable_bytes": 10212294656,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 155.47775458299998,
      "owned_rss_bytes": 334594048,
      "owned_process_count": 4,
      "reclaimable_bytes": 10068705280,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 155.70333854199998,
      "owned_rss_bytes": 407732224,
      "owned_process_count": 4,
      "reclaimable_bytes": 10010787840,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 155.928672458,
      "owned_rss_bytes": 180846592,
      "owned_process_count": 4,
      "reclaimable_bytes": 10210508800,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 156.15460408299998,
      "owned_rss_bytes": 239747072,
      "owned_process_count": 4,
      "reclaimable_bytes": 10045227008,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 156.379123833,
      "owned_rss_bytes": 286670848,
      "owned_process_count": 4,
      "reclaimable_bytes": 10000760832,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 156.60495570799998,
      "owned_rss_bytes": 348028928,
      "owned_process_count": 4,
      "reclaimable_bytes": 10220748800,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 156.830525833,
      "owned_rss_bytes": 404193280,
      "owned_process_count": 4,
      "reclaimable_bytes": 10167484416,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 157.05367074999998,
      "owned_rss_bytes": 453591040,
      "owned_process_count": 4,
      "reclaimable_bytes": 10125950976,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 157.278579208,
      "owned_rss_bytes": 561659904,
      "owned_process_count": 4,
      "reclaimable_bytes": 9709813760,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 157.504544208,
      "owned_rss_bytes": 672907264,
      "owned_process_count": 4,
      "reclaimable_bytes": 9611034624,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 157.730372042,
      "owned_rss_bytes": 735002624,
      "owned_process_count": 4,
      "reclaimable_bytes": 9551888384,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 157.95451520799998,
      "owned_rss_bytes": 809975808,
      "owned_process_count": 4,
      "reclaimable_bytes": 9473556480,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 158.180521583,
      "owned_rss_bytes": 835551232,
      "owned_process_count": 4,
      "reclaimable_bytes": 9463431168,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 158.406818292,
      "owned_rss_bytes": 811286528,
      "owned_process_count": 4,
      "reclaimable_bytes": 9493823488,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 158.632454083,
      "owned_rss_bytes": 816709632,
      "owned_process_count": 4,
      "reclaimable_bytes": 9676865536,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 158.85421120799998,
      "owned_rss_bytes": 823918592,
      "owned_process_count": 4,
      "reclaimable_bytes": 9665380352,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 159.07991158299998,
      "owned_rss_bytes": 829521920,
      "owned_process_count": 4,
      "reclaimable_bytes": 9479634944,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 159.300850417,
      "owned_rss_bytes": 840237056,
      "owned_process_count": 4,
      "reclaimable_bytes": 9469231104,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 159.52608687499998,
      "owned_rss_bytes": 848560128,
      "owned_process_count": 4,
      "reclaimable_bytes": 9456844800,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 159.75144245799999,
      "owned_rss_bytes": 858882048,
      "owned_process_count": 4,
      "reclaimable_bytes": 9537978368,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 159.977223125,
      "owned_rss_bytes": 870203392,
      "owned_process_count": 4,
      "reclaimable_bytes": 9602940928,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 160.202765333,
      "owned_rss_bytes": 881590272,
      "owned_process_count": 4,
      "reclaimable_bytes": 9586819072,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 160.42585195799998,
      "owned_rss_bytes": 908525568,
      "owned_process_count": 4,
      "reclaimable_bytes": 9478750208,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 160.65109058299998,
      "owned_rss_bytes": 921927680,
      "owned_process_count": 4,
      "reclaimable_bytes": 9476489216,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 160.876117833,
      "owned_rss_bytes": 933560320,
      "owned_process_count": 4,
      "reclaimable_bytes": 9455026176,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 161.10086795799998,
      "owned_rss_bytes": 949780480,
      "owned_process_count": 4,
      "reclaimable_bytes": 9447047168,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 161.325875083,
      "owned_rss_bytes": 961609728,
      "owned_process_count": 4,
      "reclaimable_bytes": 9543450624,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 161.55099299999998,
      "owned_rss_bytes": 973750272,
      "owned_process_count": 4,
      "reclaimable_bytes": 9546498048,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 161.77626454199998,
      "owned_rss_bytes": 985989120,
      "owned_process_count": 4,
      "reclaimable_bytes": 9533374464,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 162.001043958,
      "owned_rss_bytes": 999047168,
      "owned_process_count": 4,
      "reclaimable_bytes": 9520381952,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 162.226005792,
      "owned_rss_bytes": 1010171904,
      "owned_process_count": 4,
      "reclaimable_bytes": 9516711936,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 162.45138412499998,
      "owned_rss_bytes": 1023049728,
      "owned_process_count": 4,
      "reclaimable_bytes": 9605185536,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 162.676508333,
      "owned_rss_bytes": 1036500992,
      "owned_process_count": 4,
      "reclaimable_bytes": 9592766464,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 162.897087833,
      "owned_rss_bytes": 1049214976,
      "owned_process_count": 4,
      "reclaimable_bytes": 9574727680,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 163.123948083,
      "owned_rss_bytes": 1061879808,
      "owned_process_count": 4,
      "reclaimable_bytes": 9554903040,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 163.34719991699998,
      "owned_rss_bytes": 1073266688,
      "owned_process_count": 4,
      "reclaimable_bytes": 9259925504,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 163.570003792,
      "owned_rss_bytes": 1077936128,
      "owned_process_count": 4,
      "reclaimable_bytes": 9285599232,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 163.79468345799998,
      "owned_rss_bytes": 1078951936,
      "owned_process_count": 4,
      "reclaimable_bytes": 9286959104,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 164.01934824999998,
      "owned_rss_bytes": 1084227584,
      "owned_process_count": 4,
      "reclaimable_bytes": 9098067968,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 164.243425125,
      "owned_rss_bytes": 1085390848,
      "owned_process_count": 4,
      "reclaimable_bytes": 9100492800,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 164.46348774999998,
      "owned_rss_bytes": 1086898176,
      "owned_process_count": 4,
      "reclaimable_bytes": 9116762112,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 164.68353970799998,
      "owned_rss_bytes": 1088323584,
      "owned_process_count": 4,
      "reclaimable_bytes": 9177792512,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 164.904030667,
      "owned_rss_bytes": 1089863680,
      "owned_process_count": 4,
      "reclaimable_bytes": 9171992576,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 165.127350417,
      "owned_rss_bytes": 1091338240,
      "owned_process_count": 4,
      "reclaimable_bytes": 9426649088,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 165.351936,
      "owned_rss_bytes": 1092632576,
      "owned_process_count": 4,
      "reclaimable_bytes": 9422667776,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 165.573687708,
      "owned_rss_bytes": 1094139904,
      "owned_process_count": 4,
      "reclaimable_bytes": 9263333376,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 165.798400375,
      "owned_rss_bytes": 1095680000,
      "owned_process_count": 4,
      "reclaimable_bytes": 9261924352,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 166.023285083,
      "owned_rss_bytes": 1102036992,
      "owned_process_count": 4,
      "reclaimable_bytes": 9256648704,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 166.24833487499998,
      "owned_rss_bytes": 1117077504,
      "owned_process_count": 4,
      "reclaimable_bytes": 9139748864,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 166.47309770799998,
      "owned_rss_bytes": 1117896704,
      "owned_process_count": 4,
      "reclaimable_bytes": 9143861248,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 166.69792033299998,
      "owned_rss_bytes": 1118519296,
      "owned_process_count": 4,
      "reclaimable_bytes": 9147793408,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 166.92295962499998,
      "owned_rss_bytes": 1121665024,
      "owned_process_count": 4,
      "reclaimable_bytes": 9139978240,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 167.14733408299998,
      "owned_rss_bytes": 1126760448,
      "owned_process_count": 4,
      "reclaimable_bytes": 9132703744,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 167.37179720799998,
      "owned_rss_bytes": 1132019712,
      "owned_process_count": 4,
      "reclaimable_bytes": 9128263680,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 167.596438375,
      "owned_rss_bytes": 1136852992,
      "owned_process_count": 4,
      "reclaimable_bytes": 9127886848,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 167.82097020799998,
      "owned_rss_bytes": 1140670464,
      "owned_process_count": 4,
      "reclaimable_bytes": 9123495936,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 168.0457435,
      "owned_rss_bytes": 1143980032,
      "owned_process_count": 4,
      "reclaimable_bytes": 9205563392,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 168.270394292,
      "owned_rss_bytes": 1162149888,
      "owned_process_count": 4,
      "reclaimable_bytes": 9196748800,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 168.49501470799999,
      "owned_rss_bytes": 1195933696,
      "owned_process_count": 4,
      "reclaimable_bytes": 9172172800,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 168.71972391699998,
      "owned_rss_bytes": 1230094336,
      "owned_process_count": 4,
      "reclaimable_bytes": 9031942144,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 168.94395079199998,
      "owned_rss_bytes": 1265057792,
      "owned_process_count": 4,
      "reclaimable_bytes": 9000468480,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 169.16835083299998,
      "owned_rss_bytes": 1299660800,
      "owned_process_count": 4,
      "reclaimable_bytes": 8968142848,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 169.393054417,
      "owned_rss_bytes": 1332150272,
      "owned_process_count": 4,
      "reclaimable_bytes": 8933392384,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 169.617867375,
      "owned_rss_bytes": 1365868544,
      "owned_process_count": 4,
      "reclaimable_bytes": 8891105280,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 169.842977833,
      "owned_rss_bytes": 1400061952,
      "owned_process_count": 4,
      "reclaimable_bytes": 9114812416,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 170.067595125,
      "owned_rss_bytes": 1434206208,
      "owned_process_count": 4,
      "reclaimable_bytes": 9077391360,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 170.29238841699998,
      "owned_rss_bytes": 1471447040,
      "owned_process_count": 4,
      "reclaimable_bytes": 9043329024,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 170.51721429199998,
      "owned_rss_bytes": 1503838208,
      "owned_process_count": 4,
      "reclaimable_bytes": 8850374656,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 170.741812875,
      "owned_rss_bytes": 1540079616,
      "owned_process_count": 4,
      "reclaimable_bytes": 8820293632,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 170.96662983299998,
      "owned_rss_bytes": 1573830656,
      "owned_process_count": 4,
      "reclaimable_bytes": 8793686016,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 171.191152833,
      "owned_rss_bytes": 1607008256,
      "owned_process_count": 4,
      "reclaimable_bytes": 8758525952,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 171.413880667,
      "owned_rss_bytes": 1642790912,
      "owned_process_count": 4,
      "reclaimable_bytes": 8721104896,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 171.638748667,
      "owned_rss_bytes": 1677901824,
      "owned_process_count": 4,
      "reclaimable_bytes": 8855552000,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 171.86432975,
      "owned_rss_bytes": 1712373760,
      "owned_process_count": 4,
      "reclaimable_bytes": 8724365312,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 172.09390920799999,
      "owned_rss_bytes": 1746894848,
      "owned_process_count": 4,
      "reclaimable_bytes": 8686895104,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 172.31750533299999,
      "owned_rss_bytes": 1780678656,
      "owned_process_count": 4,
      "reclaimable_bytes": 8488632320,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 172.54268358299998,
      "owned_rss_bytes": 1816330240,
      "owned_process_count": 4,
      "reclaimable_bytes": 8457666560,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 172.768089458,
      "owned_rss_bytes": 1850802176,
      "owned_process_count": 4,
      "reclaimable_bytes": 8416018432,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 172.988353583,
      "owned_rss_bytes": 1885110272,
      "owned_process_count": 4,
      "reclaimable_bytes": 8386084864,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 173.20891908299998,
      "owned_rss_bytes": 1920352256,
      "owned_process_count": 4,
      "reclaimable_bytes": 8350875648,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 173.434135417,
      "owned_rss_bytes": 1955528704,
      "owned_process_count": 4,
      "reclaimable_bytes": 8316076032,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 173.659171333,
      "owned_rss_bytes": 1988149248,
      "owned_process_count": 4,
      "reclaimable_bytes": 8298332160,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 173.88462191699998,
      "owned_rss_bytes": 2024620032,
      "owned_process_count": 4,
      "reclaimable_bytes": 8296579072,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 174.10989287499999,
      "owned_rss_bytes": 2058567680,
      "owned_process_count": 4,
      "reclaimable_bytes": 8386969600,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 174.33417466699998,
      "owned_rss_bytes": 2093907968,
      "owned_process_count": 4,
      "reclaimable_bytes": 8296923136,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 174.55942625,
      "owned_rss_bytes": 2130034688,
      "owned_process_count": 4,
      "reclaimable_bytes": 8295727104,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 174.78453658299998,
      "owned_rss_bytes": 2166554624,
      "owned_process_count": 4,
      "reclaimable_bytes": 8300511232,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 175.009585333,
      "owned_rss_bytes": 2204270592,
      "owned_process_count": 4,
      "reclaimable_bytes": 8314699776,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 175.234179375,
      "owned_rss_bytes": 2241609728,
      "owned_process_count": 4,
      "reclaimable_bytes": 8341913600,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 175.45594516699998,
      "owned_rss_bytes": 2276409344,
      "owned_process_count": 4,
      "reclaimable_bytes": 8371077120,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 175.680842292,
      "owned_rss_bytes": 2310062080,
      "owned_process_count": 4,
      "reclaimable_bytes": 8469643264,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 175.906918292,
      "owned_rss_bytes": 2381021184,
      "owned_process_count": 4,
      "reclaimable_bytes": 8604483584,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 176.13276937499998,
      "owned_rss_bytes": 2522169344,
      "owned_process_count": 4,
      "reclaimable_bytes": 8607956992,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 176.35721149999998,
      "owned_rss_bytes": 2670166016,
      "owned_process_count": 4,
      "reclaimable_bytes": 8706375680,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 176.583135167,
      "owned_rss_bytes": 2774482944,
      "owned_process_count": 4,
      "reclaimable_bytes": 8654536704,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 176.808866833,
      "owned_rss_bytes": 2819850240,
      "owned_process_count": 4,
      "reclaimable_bytes": 8666988544,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 177.03357954199998,
      "owned_rss_bytes": 2846310400,
      "owned_process_count": 4,
      "reclaimable_bytes": 8656764928,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 177.257885083,
      "owned_rss_bytes": 2859270144,
      "owned_process_count": 4,
      "reclaimable_bytes": 8516583424,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 177.484392958,
      "owned_rss_bytes": 2894217216,
      "owned_process_count": 4,
      "reclaimable_bytes": 8506621952,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 177.711342625,
      "owned_rss_bytes": 2916925440,
      "owned_process_count": 4,
      "reclaimable_bytes": 8504606720,
      "swapins": 44106489,
      "swapouts": 77510858
    },
    {
      "elapsed_seconds": 177.94132170799998,
      "owned_rss_bytes": 3133931520,
      "owned_process_count": 4,
      "reclaimable_bytes": 8502591488,
      "swapins": 44106489,
      "swapouts": 77510858
    }
  ],
  "passed": false,
  "classification": "serial build only; not model qualification",
  "child_pid": 73145,
  "error": "RuntimeError: owned build processes exceeded the serial-build RSS ceiling",
  "traceback": "Traceback (most recent call last):\n  File \"/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py\", line 130, in guarded_run\n    check_sample(current, rss_bytes, before['swapouts'], policy)\n  File \"/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py\", line 57, in check_sample\n    raise RuntimeError('owned build processes exceeded the serial-build RSS ceiling')\nRuntimeError: owned build processes exceeded the serial-build RSS ceiling\n",
  "owned_groups": [
    73145,
    75406
  ],
  "cleanup_error": "PermissionError: [Errno 1] Operation not permitted",
  "group_cleanup_error": "RuntimeError: owned group cleanup unverified: errors=['75406: PermissionError: [Errno 1] Operation not permitted'], remaining=[]",
  "elapsed_seconds": 178.1506935,
  "child_exit_code": -15,
  "after_cleanup": {
    "page_bytes": 16384,
    "reclaimable_bytes": 11477041152,
    "swapins": 44106489,
    "swapouts": 77510858,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   185476.\nPages active:                                1172323.\nPages inactive:                              1163129.\nPages speculative:                              8510.\nPages throttled:                                   0.\nPages wired down:                             270839.\nPages purgeable:                               11248.\n\"Translation faults\":                    15205344355.\nPages copy-on-write:                       718511378.\nPages zero filled:                       21013410294.\nPages reactivated:                        3460616505.\nPages purged:                               71611558.\nFile-backed pages:                            503779.\nAnonymous pages:                             1840183.\nPages stored in compressor:                   890874.\nPages occupied by compressor:                 280992.\nDecompressions:                           1165420388.\nCompressions:                             1477889783.\nPageins:                                  7587628358.\nPageouts:                                   11030583.\nSwapins:                                    44106489.\nSwapouts:                                   77510858.\nPages tagged:                                 186110.\nPages tagged resident:                        169765.\nPages tagged compressed:                       16345.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                12719.\nPages tag-storage free:                         4384.\nPages tag-storage non-tag pageable:            81193.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    2319360.\nTagged compressions:                        11084031.\nTagged decompressions:                      10256944.\n"
  }
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/serial-planner-build-v240/live-memory.samples.jsonl

SHA-256 `dd0e1f0924e69369ca75337d34d166f09ce640759ca908445bbb17ab310d6b72`; 133597 bytes.

````text
{"elapsed_seconds": 0.0021197919999999953, "owned_rss_bytes": 6340608, "owned_process_count": 1, "reclaimable_bytes": 10178428928, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 0.226751917, "owned_rss_bytes": 21807104, "owned_process_count": 2, "reclaimable_bytes": 10213621760, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 0.4497405, "owned_rss_bytes": 22331392, "owned_process_count": 3, "reclaimable_bytes": 9946529792, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 0.670759625, "owned_rss_bytes": 67420160, "owned_process_count": 2, "reclaimable_bytes": 9922379776, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 0.891666167, "owned_rss_bytes": 71385088, "owned_process_count": 2, "reclaimable_bytes": 10009018368, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 1.117196208, "owned_rss_bytes": 72482816, "owned_process_count": 2, "reclaimable_bytes": 9911828480, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 1.343111542, "owned_rss_bytes": 83230720, "owned_process_count": 2, "reclaimable_bytes": 9890349056, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 1.564073417, "owned_rss_bytes": 99336192, "owned_process_count": 2, "reclaimable_bytes": 9889464320, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 1.787936458, "owned_rss_bytes": 99368960, "owned_process_count": 2, "reclaimable_bytes": 9890807808, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 2.013373083, "owned_rss_bytes": 99434496, "owned_process_count": 2, "reclaimable_bytes": 9893183488, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 2.239309167, "owned_rss_bytes": 150355968, "owned_process_count": 4, "reclaimable_bytes": 9958457344, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 2.464694917, "owned_rss_bytes": 199360512, "owned_process_count": 4, "reclaimable_bytes": 9913008128, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 2.687435792, "owned_rss_bytes": 221347840, "owned_process_count": 4, "reclaimable_bytes": 9821847552, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 2.9134842499999998, "owned_rss_bytes": 244973568, "owned_process_count": 4, "reclaimable_bytes": 9798205440, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 3.13727675, "owned_rss_bytes": 245727232, "owned_process_count": 4, "reclaimable_bytes": 9798795264, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 3.362674375, "owned_rss_bytes": 250478592, "owned_process_count": 4, "reclaimable_bytes": 9861709824, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 3.588364917, "owned_rss_bytes": 253132800, "owned_process_count": 4, "reclaimable_bytes": 9947643904, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 3.812451917, "owned_rss_bytes": 288145408, "owned_process_count": 4, "reclaimable_bytes": 9919725568, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 4.038602042000001, "owned_rss_bytes": 327122944, "owned_process_count": 4, "reclaimable_bytes": 9881534464, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 4.2634437080000005, "owned_rss_bytes": 350650368, "owned_process_count": 4, "reclaimable_bytes": 9880190976, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 4.488544083000001, "owned_rss_bytes": 374095872, "owned_process_count": 4, "reclaimable_bytes": 10057515008, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 4.71478525, "owned_rss_bytes": 199704576, "owned_process_count": 4, "reclaimable_bytes": 10238803968, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 4.9401415, "owned_rss_bytes": 111296512, "owned_process_count": 3, "reclaimable_bytes": 10257989632, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 5.164477875, "owned_rss_bytes": 242434048, "owned_process_count": 4, "reclaimable_bytes": 10230759424, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 5.387439167, "owned_rss_bytes": 116965376, "owned_process_count": 3, "reclaimable_bytes": 10065297408, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 5.612452458000001, "owned_rss_bytes": 224477184, "owned_process_count": 4, "reclaimable_bytes": 10029514752, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 5.837443708, "owned_rss_bytes": 268435456, "owned_process_count": 4, "reclaimable_bytes": 9999974400, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 6.062641500000001, "owned_rss_bytes": 285704192, "owned_process_count": 4, "reclaimable_bytes": 9985916928, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 6.287477625, "owned_rss_bytes": 296386560, "owned_process_count": 4, "reclaimable_bytes": 9979117568, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 6.512464625000001, "owned_rss_bytes": 304709632, "owned_process_count": 4, "reclaimable_bytes": 10163322880, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 6.737453958000001, "owned_rss_bytes": 356614144, "owned_process_count": 4, "reclaimable_bytes": 10115776512, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 6.963545417000001, "owned_rss_bytes": 240795648, "owned_process_count": 4, "reclaimable_bytes": 10118529024, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 7.18754775, "owned_rss_bytes": 278167552, "owned_process_count": 4, "reclaimable_bytes": 10117398528, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 7.412451333000001, "owned_rss_bytes": 316358656, "owned_process_count": 4, "reclaimable_bytes": 10082320384, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 7.6343960420000005, "owned_rss_bytes": 342261760, "owned_process_count": 4, "reclaimable_bytes": 9968369664, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 7.860005375, "owned_rss_bytes": 356663296, "owned_process_count": 4, "reclaimable_bytes": 9960898560, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 8.0855065, "owned_rss_bytes": 380534784, "owned_process_count": 4, "reclaimable_bytes": 9892380672, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 8.309419583, "owned_rss_bytes": 395460608, "owned_process_count": 4, "reclaimable_bytes": 9870819328, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 8.532644375, "owned_rss_bytes": 409419776, "owned_process_count": 4, "reclaimable_bytes": 9854713856, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 8.757811417, "owned_rss_bytes": 420593664, "owned_process_count": 4, "reclaimable_bytes": 9941303296, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 8.983211833, "owned_rss_bytes": 433930240, "owned_process_count": 4, "reclaimable_bytes": 9934602240, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 9.202652624999999, "owned_rss_bytes": 449986560, "owned_process_count": 4, "reclaimable_bytes": 9831137280, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 9.427158417, "owned_rss_bytes": 457244672, "owned_process_count": 4, "reclaimable_bytes": 9828990976, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 9.652435375, "owned_rss_bytes": 459702272, "owned_process_count": 4, "reclaimable_bytes": 9826762752, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 9.877091333, "owned_rss_bytes": 464322560, "owned_process_count": 4, "reclaimable_bytes": 9820733440, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 10.102278625, "owned_rss_bytes": 467779584, "owned_process_count": 4, "reclaimable_bytes": 9817604096, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 10.326942125, "owned_rss_bytes": 473202688, "owned_process_count": 4, "reclaimable_bytes": 9911828480, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 10.551604417, "owned_rss_bytes": 482344960, "owned_process_count": 4, "reclaimable_bytes": 9901391872, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 10.778215125, "owned_rss_bytes": 486129664, "owned_process_count": 4, "reclaimable_bytes": 9898360832, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 11.002982291999999, "owned_rss_bytes": 493223936, "owned_process_count": 4, "reclaimable_bytes": 10057629696, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 11.227862792, "owned_rss_bytes": 495091712, "owned_process_count": 4, "reclaimable_bytes": 10070425600, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 11.452217417, "owned_rss_bytes": 500350976, "owned_process_count": 4, "reclaimable_bytes": 10062364672, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 11.676682625, "owned_rss_bytes": 504528896, "owned_process_count": 4, "reclaimable_bytes": 10062200832, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 11.901164249999999, "owned_rss_bytes": 508444672, "owned_process_count": 4, "reclaimable_bytes": 9777774592, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 12.125787208, "owned_rss_bytes": 508624896, "owned_process_count": 4, "reclaimable_bytes": 9946628096, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 12.350245625, "owned_rss_bytes": 509083648, "owned_process_count": 4, "reclaimable_bytes": 9948463104, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 12.575431042, "owned_rss_bytes": 509935616, "owned_process_count": 4, "reclaimable_bytes": 9950003200, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 12.800105457999999, "owned_rss_bytes": 510263296, "owned_process_count": 4, "reclaimable_bytes": 9947447296, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 13.024937375, "owned_rss_bytes": 511475712, "owned_process_count": 4, "reclaimable_bytes": 10182017024, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 13.250048458, "owned_rss_bytes": 511705088, "owned_process_count": 4, "reclaimable_bytes": 10222141440, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 13.475103333, "owned_rss_bytes": 513163264, "owned_process_count": 4, "reclaimable_bytes": 10222600192, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 13.700101541999999, "owned_rss_bytes": 513277952, "owned_process_count": 4, "reclaimable_bytes": 10032955392, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 13.92317675, "owned_rss_bytes": 513425408, "owned_process_count": 4, "reclaimable_bytes": 10032857088, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 14.147983667, "owned_rss_bytes": 516734976, "owned_process_count": 4, "reclaimable_bytes": 10022567936, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 14.370634082999999, "owned_rss_bytes": 139640832, "owned_process_count": 4, "reclaimable_bytes": 10230235136, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 14.59589225, "owned_rss_bytes": 271548416, "owned_process_count": 4, "reclaimable_bytes": 10166140928, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 14.8208975, "owned_rss_bytes": 299679744, "owned_process_count": 4, "reclaimable_bytes": 10148593664, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 15.046214917, "owned_rss_bytes": 215236608, "owned_process_count": 4, "reclaimable_bytes": 10192601088, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 15.271633125, "owned_rss_bytes": 140607488, "owned_process_count": 4, "reclaimable_bytes": 10210525184, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 15.503102541999999, "owned_rss_bytes": 245186560, "owned_process_count": 4, "reclaimable_bytes": 10164486144, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 15.727598208, "owned_rss_bytes": 317718528, "owned_process_count": 4, "reclaimable_bytes": 10125524992, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 15.952949292, "owned_rss_bytes": 332120064, "owned_process_count": 4, "reclaimable_bytes": 10120101888, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 16.1788585, "owned_rss_bytes": 377847808, "owned_process_count": 4, "reclaimable_bytes": 10076880896, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 16.403808833, "owned_rss_bytes": 414744576, "owned_process_count": 4, "reclaimable_bytes": 10047340544, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 16.628969458, "owned_rss_bytes": 436944896, "owned_process_count": 4, "reclaimable_bytes": 10021781504, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 16.8502775, "owned_rss_bytes": 462110720, "owned_process_count": 4, "reclaimable_bytes": 10001317888, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 17.075415708, "owned_rss_bytes": 486342656, "owned_process_count": 4, "reclaimable_bytes": 9987604480, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 17.296386875, "owned_rss_bytes": 499826688, "owned_process_count": 4, "reclaimable_bytes": 9975382016, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 17.521558042, "owned_rss_bytes": 521043968, "owned_process_count": 4, "reclaimable_bytes": 9955164160, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 17.745514167, "owned_rss_bytes": 536412160, "owned_process_count": 4, "reclaimable_bytes": 10197925888, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 17.970201958, "owned_rss_bytes": 550486016, "owned_process_count": 4, "reclaimable_bytes": 10181263360, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 18.195160458, "owned_rss_bytes": 569524224, "owned_process_count": 4, "reclaimable_bytes": 10187849728, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 18.417078916999998, "owned_rss_bytes": 573849600, "owned_process_count": 4, "reclaimable_bytes": 10192633856, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 18.641885083, "owned_rss_bytes": 587792384, "owned_process_count": 4, "reclaimable_bytes": 9992257536, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 18.866734792, "owned_rss_bytes": 600260608, "owned_process_count": 4, "reclaimable_bytes": 9981837312, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 19.091273958, "owned_rss_bytes": 614088704, "owned_process_count": 4, "reclaimable_bytes": 9967173632, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 19.312133541999998, "owned_rss_bytes": 624164864, "owned_process_count": 4, "reclaimable_bytes": 10057580544, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 19.537246707999998, "owned_rss_bytes": 645562368, "owned_process_count": 4, "reclaimable_bytes": 10146414592, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 19.762311625, "owned_rss_bytes": 656293888, "owned_process_count": 4, "reclaimable_bytes": 10138271744, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 19.988038375, "owned_rss_bytes": 656310272, "owned_process_count": 4, "reclaimable_bytes": 10137763840, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 20.213173708, "owned_rss_bytes": 656326656, "owned_process_count": 4, "reclaimable_bytes": 9937895424, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 20.437757333, "owned_rss_bytes": 655409152, "owned_process_count": 4, "reclaimable_bytes": 9939664896, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 20.662559833, "owned_rss_bytes": 656474112, "owned_process_count": 4, "reclaimable_bytes": 9939386368, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 20.887640125, "owned_rss_bytes": 657801216, "owned_process_count": 4, "reclaimable_bytes": 9932865536, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 21.112288666999998, "owned_rss_bytes": 658063360, "owned_process_count": 4, "reclaimable_bytes": 9933520896, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 21.336928208, "owned_rss_bytes": 673300480, "owned_process_count": 4, "reclaimable_bytes": 10015178752, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 21.561881833, "owned_rss_bytes": 792018944, "owned_process_count": 4, "reclaimable_bytes": 9792765952, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 21.786918874999998, "owned_rss_bytes": 207765504, "owned_process_count": 4, "reclaimable_bytes": 10304143360, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 22.011986, "owned_rss_bytes": 225280000, "owned_process_count": 4, "reclaimable_bytes": 10291478528, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 22.236940625, "owned_rss_bytes": 315293696, "owned_process_count": 4, "reclaimable_bytes": 10247667712, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 22.461826333, "owned_rss_bytes": 367689728, "owned_process_count": 4, "reclaimable_bytes": 10214129664, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 22.686798458, "owned_rss_bytes": 396656640, "owned_process_count": 4, "reclaimable_bytes": 10190225408, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 22.912015208, "owned_rss_bytes": 420610048, "owned_process_count": 4, "reclaimable_bytes": 10164797440, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 23.133706749999998, "owned_rss_bytes": 425574400, "owned_process_count": 4, "reclaimable_bytes": 10163355648, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 23.358960833, "owned_rss_bytes": 432390144, "owned_process_count": 4, "reclaimable_bytes": 9950773248, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 23.584455833, "owned_rss_bytes": 433176576, "owned_process_count": 4, "reclaimable_bytes": 10035691520, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 23.809989875, "owned_rss_bytes": 180584448, "owned_process_count": 4, "reclaimable_bytes": 10217701376, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 24.030194833, "owned_rss_bytes": 322961408, "owned_process_count": 4, "reclaimable_bytes": 10113794048, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 24.255944958, "owned_rss_bytes": 370638848, "owned_process_count": 4, "reclaimable_bytes": 10196582400, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 24.481423958, "owned_rss_bytes": 395984896, "owned_process_count": 4, "reclaimable_bytes": 10249945088, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 24.706785917, "owned_rss_bytes": 418250752, "owned_process_count": 4, "reclaimable_bytes": 10236854272, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 24.929542792, "owned_rss_bytes": 443482112, "owned_process_count": 4, "reclaimable_bytes": 10212671488, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 25.154691917, "owned_rss_bytes": 459751424, "owned_process_count": 4, "reclaimable_bytes": 9926656000, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 25.380212792, "owned_rss_bytes": 463060992, "owned_process_count": 4, "reclaimable_bytes": 9925804032, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 25.605170833, "owned_rss_bytes": 471121920, "owned_process_count": 4, "reclaimable_bytes": 9921937408, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 25.830374083, "owned_rss_bytes": 471171072, "owned_process_count": 4, "reclaimable_bytes": 9922543616, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 26.055351708, "owned_rss_bytes": 473743360, "owned_process_count": 4, "reclaimable_bytes": 9915924480, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 26.276761957999998, "owned_rss_bytes": 477691904, "owned_process_count": 4, "reclaimable_bytes": 10188308480, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 26.499432249999998, "owned_rss_bytes": 478445568, "owned_process_count": 4, "reclaimable_bytes": 10190422016, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 26.721266625, "owned_rss_bytes": 478543872, "owned_process_count": 4, "reclaimable_bytes": 10131111936, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 26.946506375, "owned_rss_bytes": 478724096, "owned_process_count": 4, "reclaimable_bytes": 9906077696, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 27.167357457999998, "owned_rss_bytes": 170328064, "owned_process_count": 4, "reclaimable_bytes": 10120282112, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 27.392970625, "owned_rss_bytes": 219873280, "owned_process_count": 4, "reclaimable_bytes": 10074701824, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 27.615530833, "owned_rss_bytes": 276381696, "owned_process_count": 4, "reclaimable_bytes": 10037575680, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 27.841488, "owned_rss_bytes": 284409856, "owned_process_count": 4, "reclaimable_bytes": 10156146688, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 28.064490833, "owned_rss_bytes": 334331904, "owned_process_count": 4, "reclaimable_bytes": 10036903936, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 28.286406582999998, "owned_rss_bytes": 183336960, "owned_process_count": 4, "reclaimable_bytes": 10096902144, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 28.511442792, "owned_rss_bytes": 242532352, "owned_process_count": 4, "reclaimable_bytes": 10043801600, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 28.734370417, "owned_rss_bytes": 307724288, "owned_process_count": 4, "reclaimable_bytes": 10051633152, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 28.960241875, "owned_rss_bytes": 372031488, "owned_process_count": 4, "reclaimable_bytes": 9994780672, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 29.186684542, "owned_rss_bytes": 407486464, "owned_process_count": 4, "reclaimable_bytes": 9979052032, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 29.411674542, "owned_rss_bytes": 416382976, "owned_process_count": 4, "reclaimable_bytes": 10066919424, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 29.636889417, "owned_rss_bytes": 425934848, "owned_process_count": 4, "reclaimable_bytes": 10062626816, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 29.861850875, "owned_rss_bytes": 463028224, "owned_process_count": 4, "reclaimable_bytes": 9933832192, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 30.08741075, "owned_rss_bytes": 189087744, "owned_process_count": 4, "reclaimable_bytes": 10187423744, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 30.312834667, "owned_rss_bytes": 342261760, "owned_process_count": 4, "reclaimable_bytes": 10115383296, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 30.539457625, "owned_rss_bytes": 356417536, "owned_process_count": 4, "reclaimable_bytes": 10104160256, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 30.764855667, "owned_rss_bytes": 191545344, "owned_process_count": 4, "reclaimable_bytes": 10171056128, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 30.988035625, "owned_rss_bytes": 255098880, "owned_process_count": 4, "reclaimable_bytes": 10366255104, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 31.218213917, "owned_rss_bytes": 172867584, "owned_process_count": 4, "reclaimable_bytes": 10468032512, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 31.439487458, "owned_rss_bytes": 235831296, "owned_process_count": 4, "reclaimable_bytes": 10335256576, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 31.664943375, "owned_rss_bytes": 299335680, "owned_process_count": 4, "reclaimable_bytes": 10090528768, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 31.89196725, "owned_rss_bytes": 339345408, "owned_process_count": 4, "reclaimable_bytes": 10064396288, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 32.1176505, "owned_rss_bytes": 367099904, "owned_process_count": 4, "reclaimable_bytes": 10042474496, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 32.338014958, "owned_rss_bytes": 208470016, "owned_process_count": 4, "reclaimable_bytes": 10175283200, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 32.564031458, "owned_rss_bytes": 266272768, "owned_process_count": 4, "reclaimable_bytes": 10121674752, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 32.790213083000005, "owned_rss_bytes": 343801856, "owned_process_count": 4, "reclaimable_bytes": 10103013376, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 33.016313375, "owned_rss_bytes": 410337280, "owned_process_count": 4, "reclaimable_bytes": 10148380672, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 33.242533833, "owned_rss_bytes": 431505408, "owned_process_count": 4, "reclaimable_bytes": 10156326912, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 33.468108833, "owned_rss_bytes": 446709760, "owned_process_count": 4, "reclaimable_bytes": 9858646016, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 33.693473083, "owned_rss_bytes": 463912960, "owned_process_count": 4, "reclaimable_bytes": 9910779904, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 33.913244042, "owned_rss_bytes": 475938816, "owned_process_count": 4, "reclaimable_bytes": 9923575808, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 34.138345125, "owned_rss_bytes": 479461376, "owned_process_count": 4, "reclaimable_bytes": 10018766848, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 34.363345625, "owned_rss_bytes": 495108096, "owned_process_count": 4, "reclaimable_bytes": 10035888128, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 34.586256792, "owned_rss_bytes": 529727488, "owned_process_count": 4, "reclaimable_bytes": 10093395968, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 34.811220250000005, "owned_rss_bytes": 563314688, "owned_process_count": 4, "reclaimable_bytes": 9970679808, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 35.036567208, "owned_rss_bytes": 597131264, "owned_process_count": 4, "reclaimable_bytes": 9939304448, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 35.261428833000004, "owned_rss_bytes": 639451136, "owned_process_count": 4, "reclaimable_bytes": 9901031424, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 35.486609417000004, "owned_rss_bytes": 168591360, "owned_process_count": 4, "reclaimable_bytes": 10336092160, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 35.706487125, "owned_rss_bytes": 236388352, "owned_process_count": 4, "reclaimable_bytes": 10277126144, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 35.931104958000006, "owned_rss_bytes": 301580288, "owned_process_count": 4, "reclaimable_bytes": 10300162048, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 36.156542542000004, "owned_rss_bytes": 377176064, "owned_process_count": 4, "reclaimable_bytes": 10228580352, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 36.38180941700001, "owned_rss_bytes": 445726720, "owned_process_count": 4, "reclaimable_bytes": 10069786624, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 36.606979042000006, "owned_rss_bytes": 505380864, "owned_process_count": 4, "reclaimable_bytes": 10013966336, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 36.834666708, "owned_rss_bytes": 555057152, "owned_process_count": 4, "reclaimable_bytes": 9969319936, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 37.059825958000005, "owned_rss_bytes": 562692096, "owned_process_count": 4, "reclaimable_bytes": 9964257280, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 37.284970833, "owned_rss_bytes": 571899904, "owned_process_count": 4, "reclaimable_bytes": 9957670912, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 37.510040625, "owned_rss_bytes": 587497472, "owned_process_count": 4, "reclaimable_bytes": 9940828160, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 37.73522775, "owned_rss_bytes": 604291072, "owned_process_count": 4, "reclaimable_bytes": 10111533056, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 37.959469333, "owned_rss_bytes": 610959360, "owned_process_count": 4, "reclaimable_bytes": 10109272064, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 38.180206083, "owned_rss_bytes": 611876864, "owned_process_count": 4, "reclaimable_bytes": 10123116544, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 38.405569792, "owned_rss_bytes": 614596608, "owned_process_count": 4, "reclaimable_bytes": 10025041920, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 38.630652625, "owned_rss_bytes": 644956160, "owned_process_count": 4, "reclaimable_bytes": 9995386880, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 38.855668333000004, "owned_rss_bytes": 676085760, "owned_process_count": 4, "reclaimable_bytes": 9962848256, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 39.080546375000004, "owned_rss_bytes": 707248128, "owned_process_count": 4, "reclaimable_bytes": 9935241216, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 39.302681292, "owned_rss_bytes": 741343232, "owned_process_count": 4, "reclaimable_bytes": 9900294144, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 39.527699292, "owned_rss_bytes": 775503872, "owned_process_count": 4, "reclaimable_bytes": 9974759424, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 39.752975125000006, "owned_rss_bytes": 806338560, "owned_process_count": 4, "reclaimable_bytes": 9945333760, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 39.977719542, "owned_rss_bytes": 189399040, "owned_process_count": 4, "reclaimable_bytes": 10327474176, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 40.202693167, "owned_rss_bytes": 258277376, "owned_process_count": 4, "reclaimable_bytes": 10260791296, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 40.428137292, "owned_rss_bytes": 327974912, "owned_process_count": 4, "reclaimable_bytes": 10206494720, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 40.652935208, "owned_rss_bytes": 340525056, "owned_process_count": 4, "reclaimable_bytes": 10199252992, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 40.877553125000006, "owned_rss_bytes": 375668736, "owned_process_count": 4, "reclaimable_bytes": 10365485056, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 41.10298275, "owned_rss_bytes": 220954624, "owned_process_count": 4, "reclaimable_bytes": 10297475072, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 41.32776975, "owned_rss_bytes": 283705344, "owned_process_count": 4, "reclaimable_bytes": 10232791040, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 41.553230208, "owned_rss_bytes": 350388224, "owned_process_count": 4, "reclaimable_bytes": 10169909248, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 41.778360792, "owned_rss_bytes": 408584192, "owned_process_count": 4, "reclaimable_bytes": 10119954432, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 42.003405792, "owned_rss_bytes": 423084032, "owned_process_count": 4, "reclaimable_bytes": 10069131264, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 42.230855417, "owned_rss_bytes": 446398464, "owned_process_count": 4, "reclaimable_bytes": 9939959808, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 42.456078000000005, "owned_rss_bytes": 480395264, "owned_process_count": 4, "reclaimable_bytes": 10073866240, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 42.681746000000004, "owned_rss_bytes": 221921280, "owned_process_count": 4, "reclaimable_bytes": 10034855936, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 42.906341375000004, "owned_rss_bytes": 186925056, "owned_process_count": 4, "reclaimable_bytes": 10071900160, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 43.130912208000005, "owned_rss_bytes": 252493824, "owned_process_count": 4, "reclaimable_bytes": 9913712640, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 43.35577154200001, "owned_rss_bytes": 322207744, "owned_process_count": 4, "reclaimable_bytes": 9864626176, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 43.580706333, "owned_rss_bytes": 169050112, "owned_process_count": 4, "reclaimable_bytes": 10147889152, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 43.805382417000004, "owned_rss_bytes": 237912064, "owned_process_count": 4, "reclaimable_bytes": 10084007936, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 44.030383792, "owned_rss_bytes": 299515904, "owned_process_count": 4, "reclaimable_bytes": 9921511424, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 44.252043, "owned_rss_bytes": 195346432, "owned_process_count": 4, "reclaimable_bytes": 10305208320, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 44.472671875, "owned_rss_bytes": 261128192, "owned_process_count": 4, "reclaimable_bytes": 10247684096, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 44.698187167, "owned_rss_bytes": 320913408, "owned_process_count": 4, "reclaimable_bytes": 10206740480, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 44.923034583, "owned_rss_bytes": 217890816, "owned_process_count": 4, "reclaimable_bytes": 10100801536, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 45.148055792, "owned_rss_bytes": 286752768, "owned_process_count": 4, "reclaimable_bytes": 10043703296, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 45.372786042, "owned_rss_bytes": 352993280, "owned_process_count": 4, "reclaimable_bytes": 9992863744, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 45.597628, "owned_rss_bytes": 365690880, "owned_process_count": 4, "reclaimable_bytes": 9978740736, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 45.822511000000006, "owned_rss_bytes": 390250496, "owned_process_count": 4, "reclaimable_bytes": 9966927872, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 46.046978042000006, "owned_rss_bytes": 421511168, "owned_process_count": 4, "reclaimable_bytes": 10344202240, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 46.267588667000005, "owned_rss_bytes": 222871552, "owned_process_count": 4, "reclaimable_bytes": 10287333376, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 46.492564125, "owned_rss_bytes": 293339136, "owned_process_count": 4, "reclaimable_bytes": 10221633536, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 46.717449875, "owned_rss_bytes": 369377280, "owned_process_count": 4, "reclaimable_bytes": 9862709248, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 46.942322417, "owned_rss_bytes": 438157312, "owned_process_count": 4, "reclaimable_bytes": 9793912832, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 47.167273708, "owned_rss_bytes": 504578048, "owned_process_count": 4, "reclaimable_bytes": 9729703936, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 47.392207000000006, "owned_rss_bytes": 562446336, "owned_process_count": 4, "reclaimable_bytes": 9673768960, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 47.617131375, "owned_rss_bytes": 626049024, "owned_process_count": 4, "reclaimable_bytes": 9603137536, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 47.8419955, "owned_rss_bytes": 701087744, "owned_process_count": 4, "reclaimable_bytes": 9540861952, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 48.066757958000004, "owned_rss_bytes": 730234880, "owned_process_count": 4, "reclaimable_bytes": 9518071808, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 48.291131375000006, "owned_rss_bytes": 737771520, "owned_process_count": 4, "reclaimable_bytes": 9505210368, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 48.515743500000006, "owned_rss_bytes": 747520000, "owned_process_count": 4, "reclaimable_bytes": 9588490240, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 48.7406075, "owned_rss_bytes": 757792768, "owned_process_count": 4, "reclaimable_bytes": 9482059776, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 48.96355675, "owned_rss_bytes": 798048256, "owned_process_count": 4, "reclaimable_bytes": 9442410496, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 49.187960208, "owned_rss_bytes": 805486592, "owned_process_count": 4, "reclaimable_bytes": 9436610560, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 49.412964375, "owned_rss_bytes": 812957696, "owned_process_count": 4, "reclaimable_bytes": 9429041152, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 49.634336250000004, "owned_rss_bytes": 821526528, "owned_process_count": 4, "reclaimable_bytes": 9414787072, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 49.855268, "owned_rss_bytes": 854671360, "owned_process_count": 4, "reclaimable_bytes": 9387343872, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 50.0799475, "owned_rss_bytes": 905936896, "owned_process_count": 4, "reclaimable_bytes": 9332506624, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 50.304963625000006, "owned_rss_bytes": 960102400, "owned_process_count": 4, "reclaimable_bytes": 9285042176, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 50.530606417, "owned_rss_bytes": 1006632960, "owned_process_count": 4, "reclaimable_bytes": 9238839296, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 50.755817208, "owned_rss_bytes": 1011482624, "owned_process_count": 4, "reclaimable_bytes": 9479241728, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 50.981467292000005, "owned_rss_bytes": 213188608, "owned_process_count": 4, "reclaimable_bytes": 10262495232, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 51.206800125, "owned_rss_bytes": 278577152, "owned_process_count": 4, "reclaimable_bytes": 10227367936, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 51.433249417000006, "owned_rss_bytes": 330006528, "owned_process_count": 4, "reclaimable_bytes": 10190290944, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 51.658462792, "owned_rss_bytes": 340508672, "owned_process_count": 4, "reclaimable_bytes": 9899458560, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 51.880995833, "owned_rss_bytes": 360710144, "owned_process_count": 4, "reclaimable_bytes": 9873326080, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 52.105440208000005, "owned_rss_bytes": 387268608, "owned_process_count": 4, "reclaimable_bytes": 9857728512, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 52.330974833000006, "owned_rss_bytes": 210026496, "owned_process_count": 4, "reclaimable_bytes": 10009837568, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 52.556112708, "owned_rss_bytes": 187531264, "owned_process_count": 4, "reclaimable_bytes": 10034216960, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 52.781515750000004, "owned_rss_bytes": 168034304, "owned_process_count": 4, "reclaimable_bytes": 10307289088, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 53.0064165, "owned_rss_bytes": 236994560, "owned_process_count": 4, "reclaimable_bytes": 10242490368, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 53.231900292000006, "owned_rss_bytes": 203210752, "owned_process_count": 4, "reclaimable_bytes": 10112401408, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 53.456777458000005, "owned_rss_bytes": 180273152, "owned_process_count": 4, "reclaimable_bytes": 10139451392, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 53.681663583, "owned_rss_bytes": 246923264, "owned_process_count": 4, "reclaimable_bytes": 10073145344, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 53.906768917, "owned_rss_bytes": 165330944, "owned_process_count": 4, "reclaimable_bytes": 10048798720, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 54.131616708, "owned_rss_bytes": 235323392, "owned_process_count": 4, "reclaimable_bytes": 9965617152, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 54.356629458, "owned_rss_bytes": 298221568, "owned_process_count": 4, "reclaimable_bytes": 9933144064, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 54.581516125, "owned_rss_bytes": 203079680, "owned_process_count": 4, "reclaimable_bytes": 10011901952, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 54.806704958000005, "owned_rss_bytes": 181157888, "owned_process_count": 4, "reclaimable_bytes": 10032021504, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 55.031970625, "owned_rss_bytes": 103022592, "owned_process_count": 3, "reclaimable_bytes": 10056728576, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 55.256500292000005, "owned_rss_bytes": 227737600, "owned_process_count": 4, "reclaimable_bytes": 10000728064, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 55.481522083, "owned_rss_bytes": 201588736, "owned_process_count": 4, "reclaimable_bytes": 10006593536, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 55.707081125, "owned_rss_bytes": 268992512, "owned_process_count": 4, "reclaimable_bytes": 9957064704, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 55.929372542, "owned_rss_bytes": 222265344, "owned_process_count": 4, "reclaimable_bytes": 10054811648, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 56.154582417, "owned_rss_bytes": 220561408, "owned_process_count": 4, "reclaimable_bytes": 9995255808, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 56.379822792000006, "owned_rss_bytes": 286998528, "owned_process_count": 4, "reclaimable_bytes": 9932898304, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 56.602229792, "owned_rss_bytes": 352305152, "owned_process_count": 4, "reclaimable_bytes": 9954394112, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 56.827705042000005, "owned_rss_bytes": 385155072, "owned_process_count": 4, "reclaimable_bytes": 9936601088, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 57.052897042000005, "owned_rss_bytes": 396165120, "owned_process_count": 4, "reclaimable_bytes": 9927065600, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 57.277906167000005, "owned_rss_bytes": 423575552, "owned_process_count": 4, "reclaimable_bytes": 10096443392, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 57.503238458000006, "owned_rss_bytes": 170852352, "owned_process_count": 4, "reclaimable_bytes": 10325999616, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 57.724073625, "owned_rss_bytes": 237600768, "owned_process_count": 4, "reclaimable_bytes": 10258186240, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 57.949251417000006, "owned_rss_bytes": 295927808, "owned_process_count": 4, "reclaimable_bytes": 10201546752, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 58.174518042, "owned_rss_bytes": 170835968, "owned_process_count": 4, "reclaimable_bytes": 10036199424, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 58.397616458, "owned_rss_bytes": 237535232, "owned_process_count": 4, "reclaimable_bytes": 9977643008, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 58.622834542, "owned_rss_bytes": 304857088, "owned_process_count": 4, "reclaimable_bytes": 9914105856, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 58.848280458000005, "owned_rss_bytes": 139083776, "owned_process_count": 4, "reclaimable_bytes": 10059874304, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 59.072880875, "owned_rss_bytes": 222478336, "owned_process_count": 4, "reclaimable_bytes": 9987620864, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 59.29810787500001, "owned_rss_bytes": 291487744, "owned_process_count": 4, "reclaimable_bytes": 10209525760, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 59.523271292000004, "owned_rss_bytes": 353959936, "owned_process_count": 4, "reclaimable_bytes": 10160848896, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 59.748377542, "owned_rss_bytes": 192249856, "owned_process_count": 4, "reclaimable_bytes": 10299621376, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 59.974209333000005, "owned_rss_bytes": 261373952, "owned_process_count": 4, "reclaimable_bytes": 9956147200, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 60.198802292, "owned_rss_bytes": 332546048, "owned_process_count": 4, "reclaimable_bytes": 9886810112, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 60.424288625, "owned_rss_bytes": 144261120, "owned_process_count": 4, "reclaimable_bytes": 10047864832, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 60.6490925, "owned_rss_bytes": 222380032, "owned_process_count": 4, "reclaimable_bytes": 9989521408, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 60.874211, "owned_rss_bytes": 292405248, "owned_process_count": 4, "reclaimable_bytes": 9924870144, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 61.099485542000004, "owned_rss_bytes": 151257088, "owned_process_count": 4, "reclaimable_bytes": 10118938624, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 61.324731333, "owned_rss_bytes": 225165312, "owned_process_count": 4, "reclaimable_bytes": 9993519104, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 61.549792875, "owned_rss_bytes": 294666240, "owned_process_count": 4, "reclaimable_bytes": 9926885376, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 61.774673667, "owned_rss_bytes": 357384192, "owned_process_count": 4, "reclaimable_bytes": 9875128320, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 61.999911833000006, "owned_rss_bytes": 207273984, "owned_process_count": 4, "reclaimable_bytes": 10008231936, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 62.22501345800001, "owned_rss_bytes": 276430848, "owned_process_count": 4, "reclaimable_bytes": 9943252992, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 62.44991554200001, "owned_rss_bytes": 348880896, "owned_process_count": 4, "reclaimable_bytes": 9980379136, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 62.675067708, "owned_rss_bytes": 205225984, "owned_process_count": 4, "reclaimable_bytes": 10107518976, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 62.896899333, "owned_rss_bytes": 270909440, "owned_process_count": 4, "reclaimable_bytes": 9946120192, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 63.121999417000005, "owned_rss_bytes": 344424448, "owned_process_count": 4, "reclaimable_bytes": 9876733952, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 63.3469355, "owned_rss_bytes": 382959616, "owned_process_count": 4, "reclaimable_bytes": 9852469248, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 63.568474833, "owned_rss_bytes": 176111616, "owned_process_count": 4, "reclaimable_bytes": 10033741824, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 63.788937208, "owned_rss_bytes": 242253824, "owned_process_count": 4, "reclaimable_bytes": 9974906880, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 64.014071083, "owned_rss_bytes": 314998784, "owned_process_count": 4, "reclaimable_bytes": 9964978176, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 64.240296, "owned_rss_bytes": 162447360, "owned_process_count": 4, "reclaimable_bytes": 10307567616, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 64.46530275, "owned_rss_bytes": 236027904, "owned_process_count": 4, "reclaimable_bytes": 10252746752, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 64.69080733300001, "owned_rss_bytes": 309575680, "owned_process_count": 4, "reclaimable_bytes": 10197336064, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 64.91469991700001, "owned_rss_bytes": 204193792, "owned_process_count": 4, "reclaimable_bytes": 10103504896, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 65.139803417, "owned_rss_bytes": 273203200, "owned_process_count": 4, "reclaimable_bytes": 10034675712, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 65.365038333, "owned_rss_bytes": 339673088, "owned_process_count": 4, "reclaimable_bytes": 9973710848, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 65.591035958, "owned_rss_bytes": 387432448, "owned_process_count": 4, "reclaimable_bytes": 9945645056, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 65.813998625, "owned_rss_bytes": 211812352, "owned_process_count": 4, "reclaimable_bytes": 10268540928, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 66.03407604200001, "owned_rss_bytes": 278364160, "owned_process_count": 4, "reclaimable_bytes": 10208542720, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 66.258898958, "owned_rss_bytes": 348569600, "owned_process_count": 4, "reclaimable_bytes": 10166812672, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 66.484178833, "owned_rss_bytes": 384417792, "owned_process_count": 4, "reclaimable_bytes": 9860071424, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 66.709376167, "owned_rss_bytes": 425967616, "owned_process_count": 4, "reclaimable_bytes": 9820078080, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 66.93434620800001, "owned_rss_bytes": 201293824, "owned_process_count": 4, "reclaimable_bytes": 10019209216, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 67.155145958, "owned_rss_bytes": 266371072, "owned_process_count": 4, "reclaimable_bytes": 9952411648, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 67.38017404200001, "owned_rss_bytes": 337608704, "owned_process_count": 4, "reclaimable_bytes": 9889415168, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 67.605641125, "owned_rss_bytes": 179421184, "owned_process_count": 4, "reclaimable_bytes": 10127556608, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 67.830717625, "owned_rss_bytes": 246562816, "owned_process_count": 4, "reclaimable_bytes": 9977315328, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 68.053047875, "owned_rss_bytes": 320962560, "owned_process_count": 4, "reclaimable_bytes": 9908125696, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 68.278307667, "owned_rss_bytes": 376651776, "owned_process_count": 4, "reclaimable_bytes": 9870819328, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 68.500022375, "owned_rss_bytes": 201490432, "owned_process_count": 4, "reclaimable_bytes": 10020012032, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 68.72524858300001, "owned_rss_bytes": 267878400, "owned_process_count": 4, "reclaimable_bytes": 9959391232, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 68.94923358300001, "owned_rss_bytes": 143179776, "owned_process_count": 4, "reclaimable_bytes": 10154409984, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 69.17390075, "owned_rss_bytes": 223166464, "owned_process_count": 4, "reclaimable_bytes": 10092232704, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 69.399629, "owned_rss_bytes": 292700160, "owned_process_count": 4, "reclaimable_bytes": 9933701120, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 69.625851333, "owned_rss_bytes": 358154240, "owned_process_count": 4, "reclaimable_bytes": 9868935168, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 69.84861070800001, "owned_rss_bytes": 404848640, "owned_process_count": 4, "reclaimable_bytes": 9836167168, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 70.073692625, "owned_rss_bytes": 417660928, "owned_process_count": 4, "reclaimable_bytes": 9838116864, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 70.295944167, "owned_rss_bytes": 449642496, "owned_process_count": 4, "reclaimable_bytes": 9813032960, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 70.52122333300001, "owned_rss_bytes": 488865792, "owned_process_count": 4, "reclaimable_bytes": 9774628864, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 70.74182533300001, "owned_rss_bytes": 199868416, "owned_process_count": 4, "reclaimable_bytes": 10285481984, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 70.967060875, "owned_rss_bytes": 267223040, "owned_process_count": 4, "reclaimable_bytes": 10217586688, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 71.192266833, "owned_rss_bytes": 336904192, "owned_process_count": 4, "reclaimable_bytes": 10160619520, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 71.417818458, "owned_rss_bytes": 198606848, "owned_process_count": 4, "reclaimable_bytes": 10033922048, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 71.642115333, "owned_rss_bytes": 265535488, "owned_process_count": 4, "reclaimable_bytes": 9968893952, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 71.863916042, "owned_rss_bytes": 335822848, "owned_process_count": 4, "reclaimable_bytes": 9916940288, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 72.085113, "owned_rss_bytes": 373850112, "owned_process_count": 4, "reclaimable_bytes": 9887809536, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 72.31041520800001, "owned_rss_bytes": 387481600, "owned_process_count": 4, "reclaimable_bytes": 9877848064, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 72.53571675, "owned_rss_bytes": 418840576, "owned_process_count": 4, "reclaimable_bytes": 10017325056, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 72.75797920800001, "owned_rss_bytes": 456916992, "owned_process_count": 4, "reclaimable_bytes": 10237837312, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 72.983191875, "owned_rss_bytes": 201474048, "owned_process_count": 4, "reclaimable_bytes": 10368712704, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 73.209060167, "owned_rss_bytes": 266960896, "owned_process_count": 4, "reclaimable_bytes": 10144841728, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 73.434142333, "owned_rss_bytes": 338018304, "owned_process_count": 4, "reclaimable_bytes": 10075422720, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 73.65932708300001, "owned_rss_bytes": 380452864, "owned_process_count": 4, "reclaimable_bytes": 10049683456, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 73.8844945, "owned_rss_bytes": 412975104, "owned_process_count": 4, "reclaimable_bytes": 10258694144, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 74.10704308300001, "owned_rss_bytes": 211697664, "owned_process_count": 4, "reclaimable_bytes": 10280108032, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 74.332650625, "owned_rss_bytes": 279527424, "owned_process_count": 4, "reclaimable_bytes": 10110943232, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 74.55751429200001, "owned_rss_bytes": 343949312, "owned_process_count": 4, "reclaimable_bytes": 10059874304, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 74.782962458, "owned_rss_bytes": 153255936, "owned_process_count": 4, "reclaimable_bytes": 10237329408, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 75.004285792, "owned_rss_bytes": 221872128, "owned_process_count": 4, "reclaimable_bytes": 10178478080, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 75.225990792, "owned_rss_bytes": 284950528, "owned_process_count": 4, "reclaimable_bytes": 10116497408, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 75.451304167, "owned_rss_bytes": 356958208, "owned_process_count": 4, "reclaimable_bytes": 10051043328, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 75.676815042, "owned_rss_bytes": 424312832, "owned_process_count": 4, "reclaimable_bytes": 10077290496, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 75.899613833, "owned_rss_bytes": 451837952, "owned_process_count": 4, "reclaimable_bytes": 10057695232, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 76.12490745800001, "owned_rss_bytes": 462028800, "owned_process_count": 4, "reclaimable_bytes": 9962094592, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 76.349996708, "owned_rss_bytes": 469516288, "owned_process_count": 4, "reclaimable_bytes": 9957851136, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 76.574844125, "owned_rss_bytes": 470106112, "owned_process_count": 4, "reclaimable_bytes": 9956016128, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 76.799705417, "owned_rss_bytes": 473776128, "owned_process_count": 4, "reclaimable_bytes": 9947103232, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 77.02383625, "owned_rss_bytes": 488964096, "owned_process_count": 4, "reclaimable_bytes": 9938157568, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 77.249379833, "owned_rss_bytes": 517079040, "owned_process_count": 4, "reclaimable_bytes": 10187554816, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 77.475620042, "owned_rss_bytes": 536395776, "owned_process_count": 4, "reclaimable_bytes": 10162536448, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 77.700795625, "owned_rss_bytes": 185909248, "owned_process_count": 4, "reclaimable_bytes": 10482286592, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 77.925992458, "owned_rss_bytes": 255590400, "owned_process_count": 4, "reclaimable_bytes": 10140909568, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 78.152280042, "owned_rss_bytes": 329629696, "owned_process_count": 4, "reclaimable_bytes": 10083991552, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 78.37723650000001, "owned_rss_bytes": 194412544, "owned_process_count": 4, "reclaimable_bytes": 10200547328, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 78.602344417, "owned_rss_bytes": 263028736, "owned_process_count": 4, "reclaimable_bytes": 10141073408, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 78.827246958, "owned_rss_bytes": 340901888, "owned_process_count": 4, "reclaimable_bytes": 10082926592, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 79.051065583, "owned_rss_bytes": 212434944, "owned_process_count": 4, "reclaimable_bytes": 10186424320, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 79.27165683300001, "owned_rss_bytes": 279724032, "owned_process_count": 4, "reclaimable_bytes": 10394697728, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 79.496916583, "owned_rss_bytes": 352698368, "owned_process_count": 4, "reclaimable_bytes": 10332160000, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 79.717645, "owned_rss_bytes": 181747712, "owned_process_count": 4, "reclaimable_bytes": 10302570496, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 79.942718375, "owned_rss_bytes": 249495552, "owned_process_count": 4, "reclaimable_bytes": 10240950272, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 80.16787525000001, "owned_rss_bytes": 321191936, "owned_process_count": 4, "reclaimable_bytes": 10177953792, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 80.39271825, "owned_rss_bytes": 203177984, "owned_process_count": 4, "reclaimable_bytes": 10185818112, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 80.617343, "owned_rss_bytes": 270630912, "owned_process_count": 4, "reclaimable_bytes": 10123149312, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 80.842377625, "owned_rss_bytes": 166510592, "owned_process_count": 4, "reclaimable_bytes": 10221010944, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 81.067251083, "owned_rss_bytes": 234782720, "owned_process_count": 4, "reclaimable_bytes": 10164338688, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 81.292401, "owned_rss_bytes": 310902784, "owned_process_count": 4, "reclaimable_bytes": 10089889792, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 81.517322083, "owned_rss_bytes": 375193600, "owned_process_count": 4, "reclaimable_bytes": 10026336256, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 81.74239275000001, "owned_rss_bytes": 405110784, "owned_process_count": 4, "reclaimable_bytes": 10010329088, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 81.96763591700001, "owned_rss_bytes": 443826176, "owned_process_count": 4, "reclaimable_bytes": 9976692736, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 82.19277825, "owned_rss_bytes": 186269696, "owned_process_count": 4, "reclaimable_bytes": 10295001088, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 82.415475, "owned_rss_bytes": 250052608, "owned_process_count": 4, "reclaimable_bytes": 10240655360, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 82.64079208300001, "owned_rss_bytes": 319913984, "owned_process_count": 4, "reclaimable_bytes": 10075684864, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 82.862020458, "owned_rss_bytes": 387858432, "owned_process_count": 4, "reclaimable_bytes": 10013278208, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 83.087044917, "owned_rss_bytes": 431210496, "owned_process_count": 4, "reclaimable_bytes": 9978216448, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 83.312042125, "owned_rss_bytes": 441958400, "owned_process_count": 4, "reclaimable_bytes": 9859907584, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 83.539016542, "owned_rss_bytes": 471252992, "owned_process_count": 4, "reclaimable_bytes": 9847865344, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 83.76530825, "owned_rss_bytes": 155860992, "owned_process_count": 4, "reclaimable_bytes": 10277830656, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 83.99126612500001, "owned_rss_bytes": 223330304, "owned_process_count": 4, "reclaimable_bytes": 10303963136, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 84.214397042, "owned_rss_bytes": 288702464, "owned_process_count": 4, "reclaimable_bytes": 10238263296, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 84.438650458, "owned_rss_bytes": 350863360, "owned_process_count": 4, "reclaimable_bytes": 10216112128, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 84.66367012500001, "owned_rss_bytes": 179830784, "owned_process_count": 4, "reclaimable_bytes": 10194894848, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 84.889337917, "owned_rss_bytes": 240582656, "owned_process_count": 4, "reclaimable_bytes": 10131898368, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 85.116441833, "owned_rss_bytes": 303726592, "owned_process_count": 4, "reclaimable_bytes": 10079436800, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 85.338168667, "owned_rss_bytes": 370507776, "owned_process_count": 4, "reclaimable_bytes": 10019454976, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 85.563583667, "owned_rss_bytes": 385662976, "owned_process_count": 4, "reclaimable_bytes": 10011000832, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 85.789701333, "owned_rss_bytes": 114098176, "owned_process_count": 3, "reclaimable_bytes": 10385227776, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 86.01366300000001, "owned_rss_bytes": 213925888, "owned_process_count": 4, "reclaimable_bytes": 10327359488, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 86.23935395800001, "owned_rss_bytes": 275316736, "owned_process_count": 4, "reclaimable_bytes": 10016522240, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 86.463664917, "owned_rss_bytes": 344752128, "owned_process_count": 4, "reclaimable_bytes": 9947561984, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 86.68958854200001, "owned_rss_bytes": 114098176, "owned_process_count": 4, "reclaimable_bytes": 10132881408, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 86.914614833, "owned_rss_bytes": 217612288, "owned_process_count": 4, "reclaimable_bytes": 10062725120, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 87.139838833, "owned_rss_bytes": 288309248, "owned_process_count": 4, "reclaimable_bytes": 10006364160, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 87.3649005, "owned_rss_bytes": 355106816, "owned_process_count": 4, "reclaimable_bytes": 9952231424, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 87.590368667, "owned_rss_bytes": 185417728, "owned_process_count": 4, "reclaimable_bytes": 10100047872, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 87.815488375, "owned_rss_bytes": 253952000, "owned_process_count": 4, "reclaimable_bytes": 10107502592, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 88.040734167, "owned_rss_bytes": 326811648, "owned_process_count": 4, "reclaimable_bytes": 10054467584, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 88.26625845800001, "owned_rss_bytes": 196984832, "owned_process_count": 4, "reclaimable_bytes": 10180034560, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 88.491836417, "owned_rss_bytes": 146735104, "owned_process_count": 4, "reclaimable_bytes": 10220027904, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 88.71644275, "owned_rss_bytes": 224051200, "owned_process_count": 4, "reclaimable_bytes": 10154688512, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 88.941365792, "owned_rss_bytes": 299630592, "owned_process_count": 4, "reclaimable_bytes": 10098671616, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 89.16633825000001, "owned_rss_bytes": 213336064, "owned_process_count": 4, "reclaimable_bytes": 10166861824, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 89.391474917, "owned_rss_bytes": 280838144, "owned_process_count": 4, "reclaimable_bytes": 10193846272, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 89.61728683300001, "owned_rss_bytes": 206815232, "owned_process_count": 4, "reclaimable_bytes": 10249732096, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 89.842176208, "owned_rss_bytes": 181223424, "owned_process_count": 4, "reclaimable_bytes": 10283204608, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 90.06704, "owned_rss_bytes": 245628928, "owned_process_count": 4, "reclaimable_bytes": 10227744768, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 90.292199208, "owned_rss_bytes": 298844160, "owned_process_count": 4, "reclaimable_bytes": 10188242944, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 90.517505083, "owned_rss_bytes": 353599488, "owned_process_count": 4, "reclaimable_bytes": 10309058560, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 90.742914458, "owned_rss_bytes": 420642816, "owned_process_count": 4, "reclaimable_bytes": 10242785280, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 90.968157167, "owned_rss_bytes": 464207872, "owned_process_count": 4, "reclaimable_bytes": 10215178240, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 91.192599583, "owned_rss_bytes": 472481792, "owned_process_count": 4, "reclaimable_bytes": 9927901184, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 91.41367625000001, "owned_rss_bytes": 483491840, "owned_process_count": 4, "reclaimable_bytes": 9922674688, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 91.63897025, "owned_rss_bytes": 497041408, "owned_process_count": 4, "reclaimable_bytes": 9914925056, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 91.86437525000001, "owned_rss_bytes": 500727808, "owned_process_count": 4, "reclaimable_bytes": 9910747136, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 92.087658167, "owned_rss_bytes": 528695296, "owned_process_count": 4, "reclaimable_bytes": 9883500544, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 92.312697833, "owned_rss_bytes": 562135040, "owned_process_count": 4, "reclaimable_bytes": 10042310656, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 92.5374525, "owned_rss_bytes": 592936960, "owned_process_count": 4, "reclaimable_bytes": 10105667584, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 92.762691583, "owned_rss_bytes": 624590848, "owned_process_count": 4, "reclaimable_bytes": 10080059392, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 92.987719208, "owned_rss_bytes": 158269440, "owned_process_count": 4, "reclaimable_bytes": 10335584256, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 93.21226908300001, "owned_rss_bytes": 215662592, "owned_process_count": 4, "reclaimable_bytes": 10267901952, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 93.437039708, "owned_rss_bytes": 282460160, "owned_process_count": 4, "reclaimable_bytes": 10209755136, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 93.662089833, "owned_rss_bytes": 351191040, "owned_process_count": 4, "reclaimable_bytes": 10056286208, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 93.887016708, "owned_rss_bytes": 416137216, "owned_process_count": 4, "reclaimable_bytes": 9997860864, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 94.112250542, "owned_rss_bytes": 160808960, "owned_process_count": 4, "reclaimable_bytes": 10225369088, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 94.33708679200001, "owned_rss_bytes": 229867520, "owned_process_count": 4, "reclaimable_bytes": 10163732480, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 94.562211167, "owned_rss_bytes": 296058880, "owned_process_count": 4, "reclaimable_bytes": 10081665024, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 94.787326167, "owned_rss_bytes": 358137856, "owned_process_count": 4, "reclaimable_bytes": 10119823360, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 95.009288208, "owned_rss_bytes": 437321728, "owned_process_count": 4, "reclaimable_bytes": 9956655104, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 95.234770958, "owned_rss_bytes": 460210176, "owned_process_count": 4, "reclaimable_bytes": 9938288640, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 95.459738083, "owned_rss_bytes": 470024192, "owned_process_count": 4, "reclaimable_bytes": 9929818112, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 95.684260333, "owned_rss_bytes": 475611136, "owned_process_count": 4, "reclaimable_bytes": 9925640192, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 95.905820833, "owned_rss_bytes": 481525760, "owned_process_count": 4, "reclaimable_bytes": 9919512576, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 96.131075042, "owned_rss_bytes": 486932480, "owned_process_count": 4, "reclaimable_bytes": 9913532416, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 96.356191167, "owned_rss_bytes": 495009792, "owned_process_count": 4, "reclaimable_bytes": 9999695872, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 96.581004667, "owned_rss_bytes": 499826688, "owned_process_count": 4, "reclaimable_bytes": 10001154048, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 96.806381125, "owned_rss_bytes": 505806848, "owned_process_count": 4, "reclaimable_bytes": 9996402688, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 97.031868875, "owned_rss_bytes": 509739008, "owned_process_count": 4, "reclaimable_bytes": 10159030272, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 97.256888792, "owned_rss_bytes": 512917504, "owned_process_count": 4, "reclaimable_bytes": 10162241536, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 97.481981917, "owned_rss_bytes": 534577152, "owned_process_count": 4, "reclaimable_bytes": 10158718976, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 97.706799083, "owned_rss_bytes": 565706752, "owned_process_count": 4, "reclaimable_bytes": 10129506304, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 97.93166512500001, "owned_rss_bytes": 594460672, "owned_process_count": 4, "reclaimable_bytes": 9816408064, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 98.156963, "owned_rss_bytes": 619659264, "owned_process_count": 4, "reclaimable_bytes": 9793257472, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 98.382888083, "owned_rss_bytes": 164675584, "owned_process_count": 4, "reclaimable_bytes": 10219438080, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 98.605001167, "owned_rss_bytes": 232390656, "owned_process_count": 4, "reclaimable_bytes": 10154852352, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 98.83034854200001, "owned_rss_bytes": 284852224, "owned_process_count": 4, "reclaimable_bytes": 10112892928, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 99.055851708, "owned_rss_bytes": 346079232, "owned_process_count": 4, "reclaimable_bytes": 10322329600, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 99.281432083, "owned_rss_bytes": 162873344, "owned_process_count": 4, "reclaimable_bytes": 10501849088, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 99.505936667, "owned_rss_bytes": 229801984, "owned_process_count": 4, "reclaimable_bytes": 10257252352, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 99.73114833300001, "owned_rss_bytes": 280018944, "owned_process_count": 4, "reclaimable_bytes": 10207903744, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 99.95657666700001, "owned_rss_bytes": 343162880, "owned_process_count": 4, "reclaimable_bytes": 10158325760, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 100.181621417, "owned_rss_bytes": 364560384, "owned_process_count": 4, "reclaimable_bytes": 10041016320, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 100.407890333, "owned_rss_bytes": 161185792, "owned_process_count": 4, "reclaimable_bytes": 10209624064, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 100.63293166700001, "owned_rss_bytes": 230785024, "owned_process_count": 4, "reclaimable_bytes": 10147053568, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 100.857012333, "owned_rss_bytes": 282951680, "owned_process_count": 4, "reclaimable_bytes": 10102177792, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 101.082505917, "owned_rss_bytes": 359055360, "owned_process_count": 4, "reclaimable_bytes": 10034413568, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 101.30799075, "owned_rss_bytes": 387809280, "owned_process_count": 4, "reclaimable_bytes": 10015260672, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 101.533554667, "owned_rss_bytes": 393691136, "owned_process_count": 4, "reclaimable_bytes": 10010656768, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 101.75852254200001, "owned_rss_bytes": 399261696, "owned_process_count": 4, "reclaimable_bytes": 10010574848, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 101.981016667, "owned_rss_bytes": 402948096, "owned_process_count": 4, "reclaimable_bytes": 10096181248, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 102.20612283300001, "owned_rss_bytes": 423247872, "owned_process_count": 4, "reclaimable_bytes": 10072244224, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 102.431376083, "owned_rss_bytes": 433012736, "owned_process_count": 4, "reclaimable_bytes": 10058989568, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 102.653189958, "owned_rss_bytes": 438272000, "owned_process_count": 4, "reclaimable_bytes": 9884581888, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 102.87967279200001, "owned_rss_bytes": 444973056, "owned_process_count": 4, "reclaimable_bytes": 9704308736, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 103.10436116700001, "owned_rss_bytes": 448495616, "owned_process_count": 4, "reclaimable_bytes": 9710682112, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 103.330094167, "owned_rss_bytes": 469975040, "owned_process_count": 4, "reclaimable_bytes": 9668870144, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 103.55670354200001, "owned_rss_bytes": 485687296, "owned_process_count": 4, "reclaimable_bytes": 9908092928, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 103.788703375, "owned_rss_bytes": 506806272, "owned_process_count": 4, "reclaimable_bytes": 9884385280, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 104.013713792, "owned_rss_bytes": 524140544, "owned_process_count": 4, "reclaimable_bytes": 9848848384, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 104.241010375, "owned_rss_bytes": 571162624, "owned_process_count": 4, "reclaimable_bytes": 9771499520, "swapins": 44106485, "swapouts": 77510858}
{"elapsed_seconds": 104.46496841700001, "owned_rss_bytes": 586629120, "owned_process_count": 4, "reclaimable_bytes": 9499148288, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 104.695654875, "owned_rss_bytes": 208535552, "owned_process_count": 4, "reclaimable_bytes": 9848406016, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 104.92150075, "owned_rss_bytes": 268566528, "owned_process_count": 4, "reclaimable_bytes": 9785720832, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 105.146397792, "owned_rss_bytes": 319766528, "owned_process_count": 4, "reclaimable_bytes": 9745481728, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 105.37054533300001, "owned_rss_bytes": 376930304, "owned_process_count": 4, "reclaimable_bytes": 9690595328, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 105.596166, "owned_rss_bytes": 441794560, "owned_process_count": 4, "reclaimable_bytes": 9899212800, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 105.821923208, "owned_rss_bytes": 451444736, "owned_process_count": 4, "reclaimable_bytes": 9884401664, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 106.04712341700001, "owned_rss_bytes": 455884800, "owned_process_count": 4, "reclaimable_bytes": 9624420352, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 106.274623, "owned_rss_bytes": 462061568, "owned_process_count": 4, "reclaimable_bytes": 9626845184, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 106.497045875, "owned_rss_bytes": 470089728, "owned_process_count": 4, "reclaimable_bytes": 9619095552, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 106.72375087500001, "owned_rss_bytes": 478822400, "owned_process_count": 4, "reclaimable_bytes": 9614114816, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 106.948779333, "owned_rss_bytes": 483868672, "owned_process_count": 4, "reclaimable_bytes": 9605169152, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 107.171543833, "owned_rss_bytes": 485244928, "owned_process_count": 4, "reclaimable_bytes": 9501327360, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 107.39615412500001, "owned_rss_bytes": 487653376, "owned_process_count": 4, "reclaimable_bytes": 9505964032, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 107.621081583, "owned_rss_bytes": 508624896, "owned_process_count": 4, "reclaimable_bytes": 9491759104, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 107.843110208, "owned_rss_bytes": 543195136, "owned_process_count": 4, "reclaimable_bytes": 9522724864, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 108.06783395800001, "owned_rss_bytes": 576618496, "owned_process_count": 4, "reclaimable_bytes": 9493250048, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 108.292688083, "owned_rss_bytes": 610910208, "owned_process_count": 4, "reclaimable_bytes": 9577660416, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 108.517577708, "owned_rss_bytes": 644120576, "owned_process_count": 4, "reclaimable_bytes": 9542451200, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 108.742159542, "owned_rss_bytes": 163741696, "owned_process_count": 4, "reclaimable_bytes": 9985867776, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 108.966641083, "owned_rss_bytes": 230014976, "owned_process_count": 4, "reclaimable_bytes": 9932898304, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 109.19151620800001, "owned_rss_bytes": 280887296, "owned_process_count": 4, "reclaimable_bytes": 9887907840, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 109.41664425, "owned_rss_bytes": 346030080, "owned_process_count": 4, "reclaimable_bytes": 9919184896, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 109.64172316700001, "owned_rss_bytes": 384843776, "owned_process_count": 4, "reclaimable_bytes": 9898655744, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 109.866635083, "owned_rss_bytes": 388923392, "owned_process_count": 4, "reclaimable_bytes": 9886105600, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 110.087899875, "owned_rss_bytes": 395673600, "owned_process_count": 4, "reclaimable_bytes": 9882189824, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 110.312831583, "owned_rss_bytes": 401932288, "owned_process_count": 4, "reclaimable_bytes": 10063413248, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 110.538224875, "owned_rss_bytes": 410632192, "owned_process_count": 4, "reclaimable_bytes": 10053615616, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 110.763553333, "owned_rss_bytes": 417710080, "owned_process_count": 4, "reclaimable_bytes": 10047553536, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 110.986891875, "owned_rss_bytes": 441237504, "owned_process_count": 4, "reclaimable_bytes": 9754886144, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 111.212385792, "owned_rss_bytes": 467517440, "owned_process_count": 4, "reclaimable_bytes": 9732489216, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 111.43746970800001, "owned_rss_bytes": 495386624, "owned_process_count": 4, "reclaimable_bytes": 9703096320, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 111.662305708, "owned_rss_bytes": 144900096, "owned_process_count": 4, "reclaimable_bytes": 10012819456, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 111.886806, "owned_rss_bytes": 224870400, "owned_process_count": 4, "reclaimable_bytes": 9947430912, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 112.111698458, "owned_rss_bytes": 297222144, "owned_process_count": 4, "reclaimable_bytes": 10141908992, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 112.33462, "owned_rss_bytes": 376078336, "owned_process_count": 4, "reclaimable_bytes": 10099179520, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 112.559634708, "owned_rss_bytes": 436486144, "owned_process_count": 4, "reclaimable_bytes": 10062331904, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 112.784930958, "owned_rss_bytes": 210108416, "owned_process_count": 4, "reclaimable_bytes": 10061414400, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 113.010076125, "owned_rss_bytes": 274808832, "owned_process_count": 4, "reclaimable_bytes": 9994682368, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 113.23561708300001, "owned_rss_bytes": 344915968, "owned_process_count": 4, "reclaimable_bytes": 9941188608, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 113.459329917, "owned_rss_bytes": 352862208, "owned_process_count": 4, "reclaimable_bytes": 9836380160, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 113.684550083, "owned_rss_bytes": 389120000, "owned_process_count": 4, "reclaimable_bytes": 9805332480, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 113.909652333, "owned_rss_bytes": 199081984, "owned_process_count": 4, "reclaimable_bytes": 9972793344, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 114.13426700000001, "owned_rss_bytes": 265568256, "owned_process_count": 4, "reclaimable_bytes": 9912631296, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 114.357155792, "owned_rss_bytes": 317079552, "owned_process_count": 4, "reclaimable_bytes": 9860317184, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 114.58278375, "owned_rss_bytes": 365346816, "owned_process_count": 4, "reclaimable_bytes": 9827549184, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 114.80299366700001, "owned_rss_bytes": 375177216, "owned_process_count": 4, "reclaimable_bytes": 9801547776, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 115.02764866700001, "owned_rss_bytes": 406274048, "owned_process_count": 4, "reclaimable_bytes": 9864609792, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 115.253488417, "owned_rss_bytes": 115130368, "owned_process_count": 4, "reclaimable_bytes": 10082729984, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 115.47878212500001, "owned_rss_bytes": 217612288, "owned_process_count": 4, "reclaimable_bytes": 10030071808, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 115.70388675000001, "owned_rss_bytes": 289456128, "owned_process_count": 4, "reclaimable_bytes": 9866248192, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 115.9289605, "owned_rss_bytes": 369836032, "owned_process_count": 4, "reclaimable_bytes": 9809231872, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 116.15415433300001, "owned_rss_bytes": 435077120, "owned_process_count": 4, "reclaimable_bytes": 9760735232, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 116.379130458, "owned_rss_bytes": 444366848, "owned_process_count": 4, "reclaimable_bytes": 9752887296, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 116.60440016700001, "owned_rss_bytes": 115163136, "owned_process_count": 4, "reclaimable_bytes": 10002579456, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 116.82456387500001, "owned_rss_bytes": 217661440, "owned_process_count": 4, "reclaimable_bytes": 10194714624, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 117.050118125, "owned_rss_bytes": 289472512, "owned_process_count": 4, "reclaimable_bytes": 10131046400, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 117.275099542, "owned_rss_bytes": 370556928, "owned_process_count": 4, "reclaimable_bytes": 10060054528, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 117.495770917, "owned_rss_bytes": 435290112, "owned_process_count": 4, "reclaimable_bytes": 10049044480, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 117.720633792, "owned_rss_bytes": 208863232, "owned_process_count": 4, "reclaimable_bytes": 9952706560, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 117.941766167, "owned_rss_bytes": 271597568, "owned_process_count": 4, "reclaimable_bytes": 9898311680, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 118.16465575000001, "owned_rss_bytes": 325648384, "owned_process_count": 4, "reclaimable_bytes": 9848897536, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 118.39005716700001, "owned_rss_bytes": 161988608, "owned_process_count": 4, "reclaimable_bytes": 9994452992, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 118.61505183300001, "owned_rss_bytes": 230752256, "owned_process_count": 4, "reclaimable_bytes": 9932210176, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 118.839183125, "owned_rss_bytes": 186548224, "owned_process_count": 4, "reclaimable_bytes": 10231611392, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 119.064115375, "owned_rss_bytes": 252755968, "owned_process_count": 4, "reclaimable_bytes": 10170515456, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 119.289491625, "owned_rss_bytes": 333316096, "owned_process_count": 4, "reclaimable_bytes": 9836150784, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 119.5151405, "owned_rss_bytes": 411107328, "owned_process_count": 4, "reclaimable_bytes": 9772253184, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 119.73684787500001, "owned_rss_bytes": 170557440, "owned_process_count": 4, "reclaimable_bytes": 9982492672, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 119.961884917, "owned_rss_bytes": 238665728, "owned_process_count": 4, "reclaimable_bytes": 9910632448, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 120.18709162500001, "owned_rss_bytes": 300859392, "owned_process_count": 4, "reclaimable_bytes": 9864167424, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 120.41318579200001, "owned_rss_bytes": 379797504, "owned_process_count": 4, "reclaimable_bytes": 9771483136, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 120.63425145800001, "owned_rss_bytes": 485408768, "owned_process_count": 4, "reclaimable_bytes": 9680470016, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 120.859612458, "owned_rss_bytes": 519028736, "owned_process_count": 4, "reclaimable_bytes": 9647915008, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 121.085050542, "owned_rss_bytes": 528400384, "owned_process_count": 4, "reclaimable_bytes": 9733210112, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 121.310365, "owned_rss_bytes": 537722880, "owned_process_count": 4, "reclaimable_bytes": 9732931584, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 121.53596704200001, "owned_rss_bytes": 548487168, "owned_process_count": 4, "reclaimable_bytes": 9632432128, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 121.76113562500001, "owned_rss_bytes": 560496640, "owned_process_count": 4, "reclaimable_bytes": 9620127744, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 121.986343875, "owned_rss_bytes": 572358656, "owned_process_count": 4, "reclaimable_bytes": 9609363456, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 122.211629417, "owned_rss_bytes": 581992448, "owned_process_count": 4, "reclaimable_bytes": 9592995840, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 122.434228417, "owned_rss_bytes": 591429632, "owned_process_count": 4, "reclaimable_bytes": 9587654656, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 122.659480042, "owned_rss_bytes": 601587712, "owned_process_count": 4, "reclaimable_bytes": 9576857600, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 122.88479037500001, "owned_rss_bytes": 612270080, "owned_process_count": 4, "reclaimable_bytes": 9566814208, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 123.110504292, "owned_rss_bytes": 623165440, "owned_process_count": 4, "reclaimable_bytes": 9568043008, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 123.33600187500001, "owned_rss_bytes": 633962496, "owned_process_count": 4, "reclaimable_bytes": 9820028928, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 123.559911583, "owned_rss_bytes": 644399104, "owned_process_count": 4, "reclaimable_bytes": 9829793792, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 123.784362708, "owned_rss_bytes": 658554880, "owned_process_count": 4, "reclaimable_bytes": 9815343104, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 124.009431625, "owned_rss_bytes": 673529856, "owned_process_count": 4, "reclaimable_bytes": 9801121792, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 124.23456262500001, "owned_rss_bytes": 688914432, "owned_process_count": 4, "reclaimable_bytes": 9606070272, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 124.459668875, "owned_rss_bytes": 703938560, "owned_process_count": 4, "reclaimable_bytes": 9587081216, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 124.681396375, "owned_rss_bytes": 718995456, "owned_process_count": 4, "reclaimable_bytes": 9570451456, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 124.90620579200001, "owned_rss_bytes": 730087424, "owned_process_count": 4, "reclaimable_bytes": 9560096768, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 125.132095042, "owned_rss_bytes": 734199808, "owned_process_count": 4, "reclaimable_bytes": 9552855040, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 125.35715875, "owned_rss_bytes": 735592448, "owned_process_count": 4, "reclaimable_bytes": 9739223040, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 125.582343042, "owned_rss_bytes": 737148928, "owned_process_count": 4, "reclaimable_bytes": 9737125888, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 125.807399958, "owned_rss_bytes": 738918400, "owned_process_count": 4, "reclaimable_bytes": 9734651904, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 126.03209612500001, "owned_rss_bytes": 740753408, "owned_process_count": 4, "reclaimable_bytes": 9451929600, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 126.25716237500001, "owned_rss_bytes": 742621184, "owned_process_count": 4, "reclaimable_bytes": 9455730688, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 126.48211633300001, "owned_rss_bytes": 744603648, "owned_process_count": 4, "reclaimable_bytes": 9449390080, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 126.707344292, "owned_rss_bytes": 746438656, "owned_process_count": 4, "reclaimable_bytes": 9449209856, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 126.9322665, "owned_rss_bytes": 748404736, "owned_process_count": 4, "reclaimable_bytes": 9448456192, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 127.155052125, "owned_rss_bytes": 750305280, "owned_process_count": 4, "reclaimable_bytes": 9534947328, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 127.37598700000001, "owned_rss_bytes": 752222208, "owned_process_count": 4, "reclaimable_bytes": 9446670336, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 127.601366625, "owned_rss_bytes": 755744768, "owned_process_count": 4, "reclaimable_bytes": 9446653952, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 127.826560417, "owned_rss_bytes": 756563968, "owned_process_count": 4, "reclaimable_bytes": 9446440960, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 128.050902458, "owned_rss_bytes": 757383168, "owned_process_count": 4, "reclaimable_bytes": 9443033088, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 128.27583975, "owned_rss_bytes": 758251520, "owned_process_count": 4, "reclaimable_bytes": 9441296384, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 128.5022165, "owned_rss_bytes": 759103488, "owned_process_count": 4, "reclaimable_bytes": 9538535424, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 128.727099125, "owned_rss_bytes": 759955456, "owned_process_count": 4, "reclaimable_bytes": 9538813952, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 128.95092424999999, "owned_rss_bytes": 766148608, "owned_process_count": 4, "reclaimable_bytes": 9428631552, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 129.175618625, "owned_rss_bytes": 790233088, "owned_process_count": 4, "reclaimable_bytes": 9412149248, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 129.400631458, "owned_rss_bytes": 816726016, "owned_process_count": 4, "reclaimable_bytes": 9386393600, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 129.62572691699998, "owned_rss_bytes": 843104256, "owned_process_count": 4, "reclaimable_bytes": 9359474688, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 129.84575604199998, "owned_rss_bytes": 870694912, "owned_process_count": 4, "reclaimable_bytes": 9331310592, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 130.07065591699998, "owned_rss_bytes": 898138112, "owned_process_count": 4, "reclaimable_bytes": 9300148224, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 130.292519208, "owned_rss_bytes": 925794304, "owned_process_count": 4, "reclaimable_bytes": 9527967744, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 130.51751962499998, "owned_rss_bytes": 953139200, "owned_process_count": 4, "reclaimable_bytes": 9523445760, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 130.74232304199998, "owned_rss_bytes": 981843968, "owned_process_count": 4, "reclaimable_bytes": 9492430848, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 130.967532958, "owned_rss_bytes": 1010532352, "owned_process_count": 4, "reclaimable_bytes": 9183084544, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 131.192306, "owned_rss_bytes": 1039712256, "owned_process_count": 4, "reclaimable_bytes": 9164898304, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 131.41548395799998, "owned_rss_bytes": 1069400064, "owned_process_count": 4, "reclaimable_bytes": 9135128576, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 131.644270542, "owned_rss_bytes": 1098366976, "owned_process_count": 4, "reclaimable_bytes": 9109274624, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 131.869804792, "owned_rss_bytes": 1127415808, "owned_process_count": 4, "reclaimable_bytes": 9342877696, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 132.095533833, "owned_rss_bytes": 1157169152, "owned_process_count": 4, "reclaimable_bytes": 9321349120, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 132.32487595799998, "owned_rss_bytes": 1186349056, "owned_process_count": 4, "reclaimable_bytes": 9319628800, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 132.55031824999998, "owned_rss_bytes": 1215545344, "owned_process_count": 4, "reclaimable_bytes": 8998551552, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 132.777851167, "owned_rss_bytes": 1245151232, "owned_process_count": 4, "reclaimable_bytes": 8973254656, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 133.000807792, "owned_rss_bytes": 1273626624, "owned_process_count": 4, "reclaimable_bytes": 9107226624, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 133.226694875, "owned_rss_bytes": 1303805952, "owned_process_count": 4, "reclaimable_bytes": 9081356288, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 133.451642917, "owned_rss_bytes": 1331724288, "owned_process_count": 4, "reclaimable_bytes": 9053044736, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 133.676723208, "owned_rss_bytes": 1359331328, "owned_process_count": 4, "reclaimable_bytes": 9025830912, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 133.900905083, "owned_rss_bytes": 1387970560, "owned_process_count": 4, "reclaimable_bytes": 8998748160, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 134.12619016699998, "owned_rss_bytes": 1416413184, "owned_process_count": 4, "reclaimable_bytes": 8967471104, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 134.351402042, "owned_rss_bytes": 1445183488, "owned_process_count": 4, "reclaimable_bytes": 8940748800, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 134.571627375, "owned_rss_bytes": 1472577536, "owned_process_count": 4, "reclaimable_bytes": 9013673984, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 134.792625708, "owned_rss_bytes": 1500151808, "owned_process_count": 4, "reclaimable_bytes": 8882438144, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 135.01801941699998, "owned_rss_bytes": 1527955456, "owned_process_count": 4, "reclaimable_bytes": 8850112512, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 135.23981891699998, "owned_rss_bytes": 1583005696, "owned_process_count": 4, "reclaimable_bytes": 8792014848, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 135.46483183299998, "owned_rss_bytes": 1608466432, "owned_process_count": 4, "reclaimable_bytes": 8767913984, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 135.690207083, "owned_rss_bytes": 1641037824, "owned_process_count": 4, "reclaimable_bytes": 8732491776, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 135.91563087499998, "owned_rss_bytes": 1674739712, "owned_process_count": 4, "reclaimable_bytes": 8658354176, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 136.14164541699998, "owned_rss_bytes": 166641664, "owned_process_count": 4, "reclaimable_bytes": 10188636160, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 136.366721333, "owned_rss_bytes": 233422848, "owned_process_count": 4, "reclaimable_bytes": 10132357120, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 136.5917795, "owned_rss_bytes": 302137344, "owned_process_count": 4, "reclaimable_bytes": 10065068032, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 136.81700845799998, "owned_rss_bytes": 152223744, "owned_process_count": 4, "reclaimable_bytes": 10455515136, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 137.042082542, "owned_rss_bytes": 225656832, "owned_process_count": 4, "reclaimable_bytes": 10392141824, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 137.267255792, "owned_rss_bytes": 298156032, "owned_process_count": 4, "reclaimable_bytes": 10326573056, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 137.492385542, "owned_rss_bytes": 152305664, "owned_process_count": 4, "reclaimable_bytes": 10201350144, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 137.716431917, "owned_rss_bytes": 227655680, "owned_process_count": 4, "reclaimable_bytes": 10142515200, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 137.94162783299998, "owned_rss_bytes": 305102848, "owned_process_count": 4, "reclaimable_bytes": 10071113728, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 138.166501875, "owned_rss_bytes": 152092672, "owned_process_count": 4, "reclaimable_bytes": 10202988544, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 138.386622875, "owned_rss_bytes": 225099776, "owned_process_count": 4, "reclaimable_bytes": 10145054720, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 138.611959875, "owned_rss_bytes": 294092800, "owned_process_count": 4, "reclaimable_bytes": 10077519872, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 138.836982625, "owned_rss_bytes": 356417536, "owned_process_count": 4, "reclaimable_bytes": 10281304064, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 139.05793874999998, "owned_rss_bytes": 365871104, "owned_process_count": 4, "reclaimable_bytes": 10271080448, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 139.283502208, "owned_rss_bytes": 374898688, "owned_process_count": 4, "reclaimable_bytes": 10095575040, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 139.50829895799998, "owned_rss_bytes": 375930880, "owned_process_count": 4, "reclaimable_bytes": 10106699776, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 139.73312554199998, "owned_rss_bytes": 376291328, "owned_process_count": 4, "reclaimable_bytes": 10103685120, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 139.95891716699998, "owned_rss_bytes": 381337600, "owned_process_count": 4, "reclaimable_bytes": 10001317888, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 140.183886167, "owned_rss_bytes": 403488768, "owned_process_count": 4, "reclaimable_bytes": 9981394944, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 140.40893954199998, "owned_rss_bytes": 422445056, "owned_process_count": 4, "reclaimable_bytes": 9962061824, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 140.633809125, "owned_rss_bytes": 443744256, "owned_process_count": 4, "reclaimable_bytes": 9940549632, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 140.85889425, "owned_rss_bytes": 213647360, "owned_process_count": 4, "reclaimable_bytes": 10147708928, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 141.084070667, "owned_rss_bytes": 281870336, "owned_process_count": 4, "reclaimable_bytes": 10172825600, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 141.309244125, "owned_rss_bytes": 153468928, "owned_process_count": 4, "reclaimable_bytes": 10195484672, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 141.534511875, "owned_rss_bytes": 227229696, "owned_process_count": 4, "reclaimable_bytes": 10135617536, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 141.75982995799998, "owned_rss_bytes": 180043776, "owned_process_count": 4, "reclaimable_bytes": 10174660608, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 141.984797, "owned_rss_bytes": 246792192, "owned_process_count": 4, "reclaimable_bytes": 10112499712, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 142.21049374999998, "owned_rss_bytes": 324845568, "owned_process_count": 4, "reclaimable_bytes": 10047291392, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 142.43539612499998, "owned_rss_bytes": 401211392, "owned_process_count": 4, "reclaimable_bytes": 9986244608, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 142.660978958, "owned_rss_bytes": 451887104, "owned_process_count": 4, "reclaimable_bytes": 9957539840, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 142.88643366699998, "owned_rss_bytes": 208896000, "owned_process_count": 4, "reclaimable_bytes": 10154131456, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 143.11154125, "owned_rss_bytes": 274481152, "owned_process_count": 4, "reclaimable_bytes": 10091741184, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 143.334885792, "owned_rss_bytes": 354500608, "owned_process_count": 4, "reclaimable_bytes": 10271391744, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 143.559412708, "owned_rss_bytes": 422510592, "owned_process_count": 4, "reclaimable_bytes": 10239475712, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 143.780631417, "owned_rss_bytes": 103497728, "owned_process_count": 3, "reclaimable_bytes": 10484252672, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 144.00562195799998, "owned_rss_bytes": 221560832, "owned_process_count": 4, "reclaimable_bytes": 10240720896, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 144.232042958, "owned_rss_bytes": 288227328, "owned_process_count": 4, "reclaimable_bytes": 10180706304, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 144.45738774999998, "owned_rss_bytes": 207028224, "owned_process_count": 4, "reclaimable_bytes": 10248962048, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 144.682510958, "owned_rss_bytes": 199131136, "owned_process_count": 4, "reclaimable_bytes": 10260496384, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 144.90733, "owned_rss_bytes": 265863168, "owned_process_count": 4, "reclaimable_bytes": 10197778432, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 145.132612167, "owned_rss_bytes": 317030400, "owned_process_count": 4, "reclaimable_bytes": 10154278912, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 145.357859417, "owned_rss_bytes": 388202496, "owned_process_count": 4, "reclaimable_bytes": 10254057472, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 145.58367875, "owned_rss_bytes": 473137152, "owned_process_count": 4, "reclaimable_bytes": 10181115904, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 145.80875966699998, "owned_rss_bytes": 508887040, "owned_process_count": 4, "reclaimable_bytes": 9866330112, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 146.03378520799998, "owned_rss_bytes": 515899392, "owned_process_count": 4, "reclaimable_bytes": 9867821056, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 146.259169542, "owned_rss_bytes": 527663104, "owned_process_count": 4, "reclaimable_bytes": 9882025984, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 146.48461412499998, "owned_rss_bytes": 540000256, "owned_process_count": 4, "reclaimable_bytes": 9871376384, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 146.70958241699998, "owned_rss_bytes": 552517632, "owned_process_count": 4, "reclaimable_bytes": 9858596864, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 146.93476745799998, "owned_rss_bytes": 565248000, "owned_process_count": 4, "reclaimable_bytes": 9931866112, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 147.15983170799998, "owned_rss_bytes": 578437120, "owned_process_count": 4, "reclaimable_bytes": 9837477888, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 147.39395549999998, "owned_rss_bytes": 599801856, "owned_process_count": 4, "reclaimable_bytes": 9813147648, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 147.6168955, "owned_rss_bytes": 612581376, "owned_process_count": 4, "reclaimable_bytes": 9800237056, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 147.84243687499998, "owned_rss_bytes": 620773376, "owned_process_count": 4, "reclaimable_bytes": 9795829760, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 148.06772891699998, "owned_rss_bytes": 633847808, "owned_process_count": 4, "reclaimable_bytes": 9783164928, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 148.29280062499998, "owned_rss_bytes": 634716160, "owned_process_count": 4, "reclaimable_bytes": 9869230080, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 148.517893583, "owned_rss_bytes": 635617280, "owned_process_count": 4, "reclaimable_bytes": 9875505152, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 148.742522875, "owned_rss_bytes": 641712128, "owned_process_count": 4, "reclaimable_bytes": 9770631168, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 148.96804412499998, "owned_rss_bytes": 672841728, "owned_process_count": 4, "reclaimable_bytes": 9741189120, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 149.19301579199998, "owned_rss_bytes": 673185792, "owned_process_count": 4, "reclaimable_bytes": 9743237120, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 149.41803458299998, "owned_rss_bytes": 674070528, "owned_process_count": 4, "reclaimable_bytes": 9741303808, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 149.64329504199998, "owned_rss_bytes": 685522944, "owned_process_count": 4, "reclaimable_bytes": 9736814592, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 149.866229958, "owned_rss_bytes": 713326592, "owned_process_count": 4, "reclaimable_bytes": 9710501888, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 150.091272167, "owned_rss_bytes": 715390976, "owned_process_count": 4, "reclaimable_bytes": 9957425152, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 150.316135625, "owned_rss_bytes": 750403584, "owned_process_count": 4, "reclaimable_bytes": 9903341568, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 150.54032387499998, "owned_rss_bytes": 786628608, "owned_process_count": 4, "reclaimable_bytes": 9901195264, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 150.761044208, "owned_rss_bytes": 822935552, "owned_process_count": 4, "reclaimable_bytes": 9689235456, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 150.986329292, "owned_rss_bytes": 859717632, "owned_process_count": 4, "reclaimable_bytes": 9655484416, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 151.21116841699998, "owned_rss_bytes": 896237568, "owned_process_count": 4, "reclaimable_bytes": 9618210816, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 151.435344375, "owned_rss_bytes": 932462592, "owned_process_count": 4, "reclaimable_bytes": 9580478464, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 151.660600833, "owned_rss_bytes": 947077120, "owned_process_count": 4, "reclaimable_bytes": 9571794944, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 151.88466566699998, "owned_rss_bytes": 959250432, "owned_process_count": 4, "reclaimable_bytes": 9724149760, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 152.109783, "owned_rss_bytes": 1013530624, "owned_process_count": 4, "reclaimable_bytes": 9677996032, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 152.33417104199998, "owned_rss_bytes": 1000734720, "owned_process_count": 4, "reclaimable_bytes": 9423912960, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 152.558981542, "owned_rss_bytes": 1029308416, "owned_process_count": 4, "reclaimable_bytes": 9394929664, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 152.78461687499998, "owned_rss_bytes": 169852928, "owned_process_count": 4, "reclaimable_bytes": 10223566848, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 153.009299833, "owned_rss_bytes": 236879872, "owned_process_count": 4, "reclaimable_bytes": 10164764672, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 153.23114770799998, "owned_rss_bytes": 309886976, "owned_process_count": 4, "reclaimable_bytes": 10095771648, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 153.456167917, "owned_rss_bytes": 388923392, "owned_process_count": 4, "reclaimable_bytes": 10123739136, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 153.682406792, "owned_rss_bytes": 445431808, "owned_process_count": 4, "reclaimable_bytes": 9976594432, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 153.907562125, "owned_rss_bytes": 452460544, "owned_process_count": 4, "reclaimable_bytes": 9968205824, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 154.132544083, "owned_rss_bytes": 461127680, "owned_process_count": 4, "reclaimable_bytes": 9960472576, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 154.354291083, "owned_rss_bytes": 471629824, "owned_process_count": 4, "reclaimable_bytes": 9947627520, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 154.57963254199998, "owned_rss_bytes": 497303552, "owned_process_count": 4, "reclaimable_bytes": 9924608000, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 154.80467895799998, "owned_rss_bytes": 534773760, "owned_process_count": 4, "reclaimable_bytes": 9982214144, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 155.03014675, "owned_rss_bytes": 191119360, "owned_process_count": 4, "reclaimable_bytes": 10290528256, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 155.25268029199998, "owned_rss_bytes": 255639552, "owned_process_count": 4, "reclaimable_bytes": 10212294656, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 155.47775458299998, "owned_rss_bytes": 334594048, "owned_process_count": 4, "reclaimable_bytes": 10068705280, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 155.70333854199998, "owned_rss_bytes": 407732224, "owned_process_count": 4, "reclaimable_bytes": 10010787840, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 155.928672458, "owned_rss_bytes": 180846592, "owned_process_count": 4, "reclaimable_bytes": 10210508800, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 156.15460408299998, "owned_rss_bytes": 239747072, "owned_process_count": 4, "reclaimable_bytes": 10045227008, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 156.379123833, "owned_rss_bytes": 286670848, "owned_process_count": 4, "reclaimable_bytes": 10000760832, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 156.60495570799998, "owned_rss_bytes": 348028928, "owned_process_count": 4, "reclaimable_bytes": 10220748800, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 156.830525833, "owned_rss_bytes": 404193280, "owned_process_count": 4, "reclaimable_bytes": 10167484416, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 157.05367074999998, "owned_rss_bytes": 453591040, "owned_process_count": 4, "reclaimable_bytes": 10125950976, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 157.278579208, "owned_rss_bytes": 561659904, "owned_process_count": 4, "reclaimable_bytes": 9709813760, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 157.504544208, "owned_rss_bytes": 672907264, "owned_process_count": 4, "reclaimable_bytes": 9611034624, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 157.730372042, "owned_rss_bytes": 735002624, "owned_process_count": 4, "reclaimable_bytes": 9551888384, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 157.95451520799998, "owned_rss_bytes": 809975808, "owned_process_count": 4, "reclaimable_bytes": 9473556480, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 158.180521583, "owned_rss_bytes": 835551232, "owned_process_count": 4, "reclaimable_bytes": 9463431168, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 158.406818292, "owned_rss_bytes": 811286528, "owned_process_count": 4, "reclaimable_bytes": 9493823488, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 158.632454083, "owned_rss_bytes": 816709632, "owned_process_count": 4, "reclaimable_bytes": 9676865536, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 158.85421120799998, "owned_rss_bytes": 823918592, "owned_process_count": 4, "reclaimable_bytes": 9665380352, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 159.07991158299998, "owned_rss_bytes": 829521920, "owned_process_count": 4, "reclaimable_bytes": 9479634944, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 159.300850417, "owned_rss_bytes": 840237056, "owned_process_count": 4, "reclaimable_bytes": 9469231104, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 159.52608687499998, "owned_rss_bytes": 848560128, "owned_process_count": 4, "reclaimable_bytes": 9456844800, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 159.75144245799999, "owned_rss_bytes": 858882048, "owned_process_count": 4, "reclaimable_bytes": 9537978368, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 159.977223125, "owned_rss_bytes": 870203392, "owned_process_count": 4, "reclaimable_bytes": 9602940928, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 160.202765333, "owned_rss_bytes": 881590272, "owned_process_count": 4, "reclaimable_bytes": 9586819072, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 160.42585195799998, "owned_rss_bytes": 908525568, "owned_process_count": 4, "reclaimable_bytes": 9478750208, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 160.65109058299998, "owned_rss_bytes": 921927680, "owned_process_count": 4, "reclaimable_bytes": 9476489216, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 160.876117833, "owned_rss_bytes": 933560320, "owned_process_count": 4, "reclaimable_bytes": 9455026176, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 161.10086795799998, "owned_rss_bytes": 949780480, "owned_process_count": 4, "reclaimable_bytes": 9447047168, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 161.325875083, "owned_rss_bytes": 961609728, "owned_process_count": 4, "reclaimable_bytes": 9543450624, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 161.55099299999998, "owned_rss_bytes": 973750272, "owned_process_count": 4, "reclaimable_bytes": 9546498048, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 161.77626454199998, "owned_rss_bytes": 985989120, "owned_process_count": 4, "reclaimable_bytes": 9533374464, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 162.001043958, "owned_rss_bytes": 999047168, "owned_process_count": 4, "reclaimable_bytes": 9520381952, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 162.226005792, "owned_rss_bytes": 1010171904, "owned_process_count": 4, "reclaimable_bytes": 9516711936, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 162.45138412499998, "owned_rss_bytes": 1023049728, "owned_process_count": 4, "reclaimable_bytes": 9605185536, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 162.676508333, "owned_rss_bytes": 1036500992, "owned_process_count": 4, "reclaimable_bytes": 9592766464, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 162.897087833, "owned_rss_bytes": 1049214976, "owned_process_count": 4, "reclaimable_bytes": 9574727680, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 163.123948083, "owned_rss_bytes": 1061879808, "owned_process_count": 4, "reclaimable_bytes": 9554903040, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 163.34719991699998, "owned_rss_bytes": 1073266688, "owned_process_count": 4, "reclaimable_bytes": 9259925504, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 163.570003792, "owned_rss_bytes": 1077936128, "owned_process_count": 4, "reclaimable_bytes": 9285599232, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 163.79468345799998, "owned_rss_bytes": 1078951936, "owned_process_count": 4, "reclaimable_bytes": 9286959104, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 164.01934824999998, "owned_rss_bytes": 1084227584, "owned_process_count": 4, "reclaimable_bytes": 9098067968, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 164.243425125, "owned_rss_bytes": 1085390848, "owned_process_count": 4, "reclaimable_bytes": 9100492800, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 164.46348774999998, "owned_rss_bytes": 1086898176, "owned_process_count": 4, "reclaimable_bytes": 9116762112, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 164.68353970799998, "owned_rss_bytes": 1088323584, "owned_process_count": 4, "reclaimable_bytes": 9177792512, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 164.904030667, "owned_rss_bytes": 1089863680, "owned_process_count": 4, "reclaimable_bytes": 9171992576, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 165.127350417, "owned_rss_bytes": 1091338240, "owned_process_count": 4, "reclaimable_bytes": 9426649088, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 165.351936, "owned_rss_bytes": 1092632576, "owned_process_count": 4, "reclaimable_bytes": 9422667776, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 165.573687708, "owned_rss_bytes": 1094139904, "owned_process_count": 4, "reclaimable_bytes": 9263333376, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 165.798400375, "owned_rss_bytes": 1095680000, "owned_process_count": 4, "reclaimable_bytes": 9261924352, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 166.023285083, "owned_rss_bytes": 1102036992, "owned_process_count": 4, "reclaimable_bytes": 9256648704, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 166.24833487499998, "owned_rss_bytes": 1117077504, "owned_process_count": 4, "reclaimable_bytes": 9139748864, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 166.47309770799998, "owned_rss_bytes": 1117896704, "owned_process_count": 4, "reclaimable_bytes": 9143861248, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 166.69792033299998, "owned_rss_bytes": 1118519296, "owned_process_count": 4, "reclaimable_bytes": 9147793408, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 166.92295962499998, "owned_rss_bytes": 1121665024, "owned_process_count": 4, "reclaimable_bytes": 9139978240, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 167.14733408299998, "owned_rss_bytes": 1126760448, "owned_process_count": 4, "reclaimable_bytes": 9132703744, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 167.37179720799998, "owned_rss_bytes": 1132019712, "owned_process_count": 4, "reclaimable_bytes": 9128263680, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 167.596438375, "owned_rss_bytes": 1136852992, "owned_process_count": 4, "reclaimable_bytes": 9127886848, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 167.82097020799998, "owned_rss_bytes": 1140670464, "owned_process_count": 4, "reclaimable_bytes": 9123495936, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 168.0457435, "owned_rss_bytes": 1143980032, "owned_process_count": 4, "reclaimable_bytes": 9205563392, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 168.270394292, "owned_rss_bytes": 1162149888, "owned_process_count": 4, "reclaimable_bytes": 9196748800, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 168.49501470799999, "owned_rss_bytes": 1195933696, "owned_process_count": 4, "reclaimable_bytes": 9172172800, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 168.71972391699998, "owned_rss_bytes": 1230094336, "owned_process_count": 4, "reclaimable_bytes": 9031942144, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 168.94395079199998, "owned_rss_bytes": 1265057792, "owned_process_count": 4, "reclaimable_bytes": 9000468480, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 169.16835083299998, "owned_rss_bytes": 1299660800, "owned_process_count": 4, "reclaimable_bytes": 8968142848, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 169.393054417, "owned_rss_bytes": 1332150272, "owned_process_count": 4, "reclaimable_bytes": 8933392384, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 169.617867375, "owned_rss_bytes": 1365868544, "owned_process_count": 4, "reclaimable_bytes": 8891105280, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 169.842977833, "owned_rss_bytes": 1400061952, "owned_process_count": 4, "reclaimable_bytes": 9114812416, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 170.067595125, "owned_rss_bytes": 1434206208, "owned_process_count": 4, "reclaimable_bytes": 9077391360, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 170.29238841699998, "owned_rss_bytes": 1471447040, "owned_process_count": 4, "reclaimable_bytes": 9043329024, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 170.51721429199998, "owned_rss_bytes": 1503838208, "owned_process_count": 4, "reclaimable_bytes": 8850374656, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 170.741812875, "owned_rss_bytes": 1540079616, "owned_process_count": 4, "reclaimable_bytes": 8820293632, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 170.96662983299998, "owned_rss_bytes": 1573830656, "owned_process_count": 4, "reclaimable_bytes": 8793686016, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 171.191152833, "owned_rss_bytes": 1607008256, "owned_process_count": 4, "reclaimable_bytes": 8758525952, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 171.413880667, "owned_rss_bytes": 1642790912, "owned_process_count": 4, "reclaimable_bytes": 8721104896, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 171.638748667, "owned_rss_bytes": 1677901824, "owned_process_count": 4, "reclaimable_bytes": 8855552000, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 171.86432975, "owned_rss_bytes": 1712373760, "owned_process_count": 4, "reclaimable_bytes": 8724365312, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 172.09390920799999, "owned_rss_bytes": 1746894848, "owned_process_count": 4, "reclaimable_bytes": 8686895104, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 172.31750533299999, "owned_rss_bytes": 1780678656, "owned_process_count": 4, "reclaimable_bytes": 8488632320, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 172.54268358299998, "owned_rss_bytes": 1816330240, "owned_process_count": 4, "reclaimable_bytes": 8457666560, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 172.768089458, "owned_rss_bytes": 1850802176, "owned_process_count": 4, "reclaimable_bytes": 8416018432, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 172.988353583, "owned_rss_bytes": 1885110272, "owned_process_count": 4, "reclaimable_bytes": 8386084864, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 173.20891908299998, "owned_rss_bytes": 1920352256, "owned_process_count": 4, "reclaimable_bytes": 8350875648, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 173.434135417, "owned_rss_bytes": 1955528704, "owned_process_count": 4, "reclaimable_bytes": 8316076032, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 173.659171333, "owned_rss_bytes": 1988149248, "owned_process_count": 4, "reclaimable_bytes": 8298332160, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 173.88462191699998, "owned_rss_bytes": 2024620032, "owned_process_count": 4, "reclaimable_bytes": 8296579072, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 174.10989287499999, "owned_rss_bytes": 2058567680, "owned_process_count": 4, "reclaimable_bytes": 8386969600, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 174.33417466699998, "owned_rss_bytes": 2093907968, "owned_process_count": 4, "reclaimable_bytes": 8296923136, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 174.55942625, "owned_rss_bytes": 2130034688, "owned_process_count": 4, "reclaimable_bytes": 8295727104, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 174.78453658299998, "owned_rss_bytes": 2166554624, "owned_process_count": 4, "reclaimable_bytes": 8300511232, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 175.009585333, "owned_rss_bytes": 2204270592, "owned_process_count": 4, "reclaimable_bytes": 8314699776, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 175.234179375, "owned_rss_bytes": 2241609728, "owned_process_count": 4, "reclaimable_bytes": 8341913600, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 175.45594516699998, "owned_rss_bytes": 2276409344, "owned_process_count": 4, "reclaimable_bytes": 8371077120, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 175.680842292, "owned_rss_bytes": 2310062080, "owned_process_count": 4, "reclaimable_bytes": 8469643264, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 175.906918292, "owned_rss_bytes": 2381021184, "owned_process_count": 4, "reclaimable_bytes": 8604483584, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 176.13276937499998, "owned_rss_bytes": 2522169344, "owned_process_count": 4, "reclaimable_bytes": 8607956992, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 176.35721149999998, "owned_rss_bytes": 2670166016, "owned_process_count": 4, "reclaimable_bytes": 8706375680, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 176.583135167, "owned_rss_bytes": 2774482944, "owned_process_count": 4, "reclaimable_bytes": 8654536704, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 176.808866833, "owned_rss_bytes": 2819850240, "owned_process_count": 4, "reclaimable_bytes": 8666988544, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 177.03357954199998, "owned_rss_bytes": 2846310400, "owned_process_count": 4, "reclaimable_bytes": 8656764928, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 177.257885083, "owned_rss_bytes": 2859270144, "owned_process_count": 4, "reclaimable_bytes": 8516583424, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 177.484392958, "owned_rss_bytes": 2894217216, "owned_process_count": 4, "reclaimable_bytes": 8506621952, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 177.711342625, "owned_rss_bytes": 2916925440, "owned_process_count": 4, "reclaimable_bytes": 8504606720, "swapins": 44106489, "swapouts": 77510858}
{"elapsed_seconds": 177.94132170799998, "owned_rss_bytes": 3133931520, "owned_process_count": 4, "reclaimable_bytes": 8502591488, "swapins": 44106489, "swapouts": 77510858}
````

## /Users/carlos/Projects/slotstream/.build/optimization/serial-planner-build-v240/manifest.json

SHA-256 `280b34503a25fc8fadf29b3daed4a5903633a95f5bcba605aedf78d6b42662d2`; 9358 bytes.

````text
{
  "classification": "build only; no runtime performance evidence",
  "required_reclaimable_gb": 9.5,
  "model_lock_held_during_build": true,
  "passed": false,
  "command": [
    "make",
    "build",
    "SLOTSTREAM_BUILD_JOBS=1"
  ],
  "working_directory": "/private/tmp/slotstream-optimization-execution/planner-family-integration-v237/candidate-source",
  "reservation_wait_limit_seconds": 0,
  "build_jobs": 1,
  "reservation_wait": {
    "seconds": 2.29200000000096e-06,
    "attempts": 1
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 10179313664,
    "swapins": 44106485,
    "swapouts": 77510858,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    99918.\nPages active:                                1217913.\nPages inactive:                              1211411.\nPages speculative:                              9092.\nPages throttled:                                   0.\nPages wired down:                             269117.\nPages purgeable:                               27265.\n\"Translation faults\":                    15200571395.\nPages copy-on-write:                       718178646.\nPages zero filled:                       21009817499.\nPages reactivated:                        3460551674.\nPages purged:                               71603486.\nFile-backed pages:                            494113.\nAnonymous pages:                             1944303.\nPages stored in compressor:                   882717.\nPages occupied by compressor:                 278002.\nDecompressions:                           1165419831.\nCompressions:                             1477881069.\nPageins:                                  7587572514.\nPageouts:                                   11030527.\nSwapins:                                    44106485.\nSwapouts:                                   77510858.\nPages tagged:                                 200322.\nPages tagged resident:                        185408.\nPages tagged compressed:                       14914.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                15114.\nPages tag-storage free:                          147.\nPages tag-storage non-tag pageable:            83035.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    2182144.\nTagged compressions:                        11082592.\nTagged decompressions:                      10256936.\n"
  },
  "error": "RuntimeError: owned build processes exceeded the serial-build RSS ceiling",
  "elapsed_seconds": 178.16066854200002,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 11477991424,
    "swapins": 44106489,
    "swapouts": 77510858,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   185534.\nPages active:                                1172335.\nPages inactive:                              1163127.\nPages speculative:                              8510.\nPages throttled:                                   0.\nPages wired down:                             270839.\nPages purgeable:                               11248.\n\"Translation faults\":                    15205345075.\nPages copy-on-write:                       718511534.\nPages zero filled:                       21013410378.\nPages reactivated:                        3460616505.\nPages purged:                               71611558.\nFile-backed pages:                            503779.\nAnonymous pages:                             1840193.\nPages stored in compressor:                   890874.\nPages occupied by compressor:                 280992.\nDecompressions:                           1165420388.\nCompressions:                             1477889783.\nPageins:                                  7587628359.\nPageouts:                                   11030583.\nSwapins:                                    44106489.\nSwapouts:                                   77510858.\nPages tagged:                                 186110.\nPages tagged resident:                        169765.\nPages tagged compressed:                       16345.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                12719.\nPages tag-storage free:                         4391.\nPages tag-storage non-tag pageable:            81186.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    2319360.\nTagged compressions:                        11084031.\nTagged decompressions:                      10256944.\n"
  },
  "serial_driver_sha256": "05a81e16880cdea80198a6cbd7e7fc84429b68940e1c699163a0ae5fe15d6ed8",
  "serial_policy": {
    "startup_reclaimable_bytes": 9500000000,
    "minimum_live_reclaimable_bytes": 6000000000,
    "maximum_owned_rss_bytes": 3000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1200,
    "compiler_jobs": 1,
    "stop_on_new_swapouts": true
  },
  "whole_interval_before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 10178281472,
    "swapins": 44106485,
    "swapouts": 77510858,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    99855.\nPages active:                                1217900.\nPages inactive:                              1211411.\nPages speculative:                              9092.\nPages throttled:                                   0.\nPages wired down:                             269117.\nPages purgeable:                               27265.\n\"Translation faults\":                    15200570799.\nPages copy-on-write:                       718178494.\nPages zero filled:                       21009817416.\nPages reactivated:                        3460551674.\nPages purged:                               71603486.\nFile-backed pages:                            494113.\nAnonymous pages:                             1944290.\nPages stored in compressor:                   882717.\nPages occupied by compressor:                 278002.\nDecompressions:                           1165419831.\nCompressions:                             1477881069.\nPageins:                                  7587572513.\nPageouts:                                   11030527.\nSwapins:                                    44106485.\nSwapouts:                                   77510858.\nPages tagged:                                 200322.\nPages tagged resident:                        185408.\nPages tagged compressed:                       14914.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                15114.\nPages tag-storage free:                          163.\nPages tag-storage non-tag pageable:            83019.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    2182144.\nTagged compressions:                        11082592.\nTagged decompressions:                      10256936.\n"
  },
  "model_lock_held_through_publication": true,
  "whole_interval_after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 11478122496,
    "swapins": 44106489,
    "swapouts": 77510858,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   185541.\nPages active:                                1172340.\nPages inactive:                              1163130.\nPages speculative:                              8510.\nPages throttled:                                   0.\nPages wired down:                             270839.\nPages purgeable:                               11248.\n\"Translation faults\":                    15205345657.\nPages copy-on-write:                       718511686.\nPages zero filled:                       21013410431.\nPages reactivated:                        3460616505.\nPages purged:                               71611558.\nFile-backed pages:                            503780.\nAnonymous pages:                             1840200.\nPages stored in compressor:                   890874.\nPages occupied by compressor:                 280992.\nDecompressions:                           1165420388.\nCompressions:                             1477889783.\nPageins:                                  7587628360.\nPageouts:                                   11030583.\nSwapins:                                    44106489.\nSwapouts:                                   77510858.\nPages tagged:                                 186110.\nPages tagged resident:                        169765.\nPages tagged compressed:                       16345.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                12719.\nPages tag-storage free:                         4389.\nPages tag-storage non-tag pageable:            81188.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    2319360.\nTagged compressions:                        11084031.\nTagged decompressions:                      10256944.\n"
  },
  "whole_interval_seconds": 178.167990792,
  "whole_interval_passed": false,
  "whole_interval_error": "RuntimeError: serial compiler or build publication did not pass"
}
````
