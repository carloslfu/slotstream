---
type: run
id: 01m20p1r64s1f1tctzjtrrgt78
created: 2026-09-08T14:16:44.996761+00:00
updated: 2026-09-08T14:16:45.632897+00:00
summary: Fixed-MTP campaign adapter preserves exact original native evidence and eight workload contracts
binary: /Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream
captured_at: 2026-09-08
command: V367 model-free native verification and 16 adapter tests; no campaign preparation or model launch
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Fixed-MTP campaign adapter preserves exact original native evidence and eight workload contracts
tool: Slotstream exact native and source qualification capture
---
The V367 adapter closes the campaign-format gap for V360 with compact BF16 cache rows and the original fixed MTP verification shape. It recomputes all 1,135 native assertions and verifies original command, environment, binary/source/Metal identity, complete work policy, unchanged raw hashes, successful ownership cleanup and reservation completion. In temporary model-free tests, it copies native stdout/stderr and original guard records byte for byte and labels derived campaign metadata as imports of one original execution, never new inference. Its private campaign module changes only the protocol validator to the exact V363 amendment; the original assessor, serving driver, eight fixed workloads and controls remain intact. The original serving prerequisite checker accepts the imported proof. All 16 tests pass, including stale build, altered output/control, missing new assertions, cleanup/deadline failure, no retry, legacy lifetime refusal, memory admission and signal/environment restoration cases. No real campaign packet, serving attempt, lifetime, final composition selection, installation or activation is created. The separately corrected lifetime studies and all optional composition decisions remain required.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/fixed-mtp-campaign-adapter-v367/campaign.py",
    "bytes": 18182,
    "sha256": "0a61412c14c52c117e19f429c1b19c070f1f799eb8304e8320e3e11f71e95e0b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/fixed-mtp-campaign-adapter-v367/native-check.json",
    "bytes": 2645,
    "sha256": "5424f2ad1d30415595aad35c03131d9d1d735e2ed51954e8bc9f36002fa6f727"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/fixed-mtp-campaign-adapter-v367/test_campaign.py",
    "bytes": 8864,
    "sha256": "2788b4c9f6cb161e3074e2c088f528fef10dc3988af4cbcfc65f3e7d87997d49"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/fixed-mtp-campaign-adapter-v367/tests-2.stderr.txt",
    "bytes": 1318,
    "sha256": "7717b93fbdb6907dfb6f4e4b4b1e5e993320543c28a5df4d42743303af3c73d0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/fixed-mtp-campaign-adapter-v367/tests-2.stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/fixed-mtp-campaign-adapter-v367/tests.stderr.txt",
    "bytes": 1318,
    "sha256": "675299bdeb3fb278e414b696206790055989187468298c2a140b4b2623d45402"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/fixed-mtp-campaign-adapter-v367/tests.stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/fixed-mtp-campaign-adapter-v367/verification.json",
    "bytes": 731,
    "sha256": "166bfa9f677075c92a10c5dcbb135556c77da5cdf954e8993e16e9071f737e0b"
  }
]
```

## Artifact SHA-256 0a61412c14c52c117e19f429c1b19c070f1f799eb8304e8320e3e11f71e95e0b

Encoding: `utf-8`. Original bytes: 18182.

````````````text
"""Exact native evidence bridge and selected-control campaign for V360.

Preparation is model-free and does not select the final product composition.
The original campaign assessor and serving driver remain unchanged. Legacy
lifetime stages are visible in the inventory but cannot execute here.
"""
import argparse
import copy
import datetime
import fcntl
import importlib.util
import inspect
import json
import os
from pathlib import Path
import shutil
import signal
import sys
import threading
import time

ROOT = Path('/Users/carlos/Projects/slotstream')
BASE = Path('/tmp/slotstream-optimization-execution')
HERE = Path(__file__).resolve().parent
PACKET = ROOT / '.build/optimization/fixed-mtp-campaign-v367'
sys.path.insert(0, str(ROOT / 'Tools'))
sys.path.insert(0, str(BASE / 'pressure-footprint-v341'))
from prefill_bench import digest, preflight, vm_snapshot
from optimization_readiness import pressure_snapshot, require_normal
from guard_with_footprint import guarded_run
import thermal_readiness


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


# This private module instance keeps the original package and prior campaigns
# untouched. Its one substituted validator accepts only V363's exact NG1/TAIL0
# amendment, then reconstructs and validates the original frozen template.
c = module('fixed_mtp_campaign_private', ROOT / 'Tools/optimization_campaign.py')
controls = module('fixed_mtp_campaign_controls', BASE / 'compact-cache-fixed-mtp-controls-v363/controls.py')
native = module('fixed_mtp_campaign_native', BASE / 'compact-cache-fixed-mtp-native-v361/run.py')
original = module('fixed_mtp_campaign_reservation', BASE / 'thermal-screened-confirmation-v320/confirmation.py')
c.validate_paired_protocol = controls.validate
require, now, allowance = original.require, original.now, original.allowance
NATIVE_FILES = ('attempt.json', 'receipt.json', 'qualification.json', 'memory.json',
                'memory.samples.jsonl', 'stdout.txt', 'stderr.txt')
PAIRED_STAGES = tuple('paired/' + n for n in c.PAIRED)
MINIMUM_RESERVED = {s: 3330 if s == 'paired/unique-prose' else 3630 for s in PAIRED_STAGES}


def native_proof():
    prepared = native.load()
    require(prepared['build'] == c.bench.verified_build(controls.BINARY), 'native and selected candidate differ')
    result = {}
    for name in c.NATIVE:
        path = native.OUT / name
        attempt, receipt, qualification, memory = [c.read(path / n) for n in NATIVE_FILES[:4]]
        assessment = native.assess(name, c.read(path / 'stdout.txt'))
        require(attempt['command'] == prepared['commands'][name]
                and attempt['environment'] == prepared['environment']
                and attempt['build'] == prepared['build']
                and attempt['policy'] == prepared['policy']
                and attempt['preparation_sha256'] == digest(native.HERE / 'preparation.json'),
                'original native command, environment, policy or binding differs')
        for value in (receipt, qualification):
            require(value.get('passed') is True and value.get('completed') is True
                    and value.get('qualified') is True and value.get('exit_code') == 0
                    and value.get('cleanup_complete') is True and value.get('within_reservation') is True
                    and value.get('proofs_unchanged') is True and value.get('error') is None
                    and value.get('cleanup_error') is None and value.get('remaining_jobs') == []
                    and value['attempt_sha256'] == digest(path / 'attempt.json')
                    and value['stdout_sha256'] == digest(path / 'stdout.txt')
                    and value['assertions'] == assessment['assertions'],
                    'original native execution failed, changed, or did not drain')
        require(qualification['execution_receipt_sha256'] == digest(path / 'receipt.json')
                and memory.get('passed') is True and memory.get('child_exit_code') == 0
                and memory.get('remaining_owned_members_after_cleanup') == []
                and memory['policy'] == prepared['policy'], 'original native guard or cleanup failed')
        result[name] = {'directory': str(path), 'assertions': assessment['assertions'],
                        'sha256': {n: digest(path / n) for n in NATIVE_FILES}}
    return result


def contract():
    build = c.bench.verified_build(controls.BINARY)
    value = {'format': 'slotstream-qualification-v1',
             'build_identity': {k: build['identity'][k] for k in c.IDENTITY_KEYS},
             'native': {}, 'paired_protocols': {n: controls.materialize(n) for n in c.PAIRED},
             'soak_modes': {}}
    for name, variant in c.NATIVE.items():
        value['native'][name] = {'command': [str(controls.BINARY), 'optimization-state-check',
            '--variant', variant, '--model', controls.MODEL, '--json'], 'environment': {}}
    # Preserve this original inventory for the existing proof format. Execution
    # is refused below; the separately corrected 10/12 GB lifetime plans apply.
    for mode in ('off', 'on'):
        protocol = c.materialize(c.read(c.TEMPLATES / 'soak.json'), controls.BINARY, controls.MODEL)
        protocol.update(mtp=mode, frozen_binary_sha256=build['identity']['binary_sha256'])
        c.soak.validate_protocol(protocol)
        value['soak_modes'][mode] = protocol
    return value


def dependencies():
    paths = [Path(__file__), Path(controls.__file__), Path(native.__file__), Path(original.__file__),
             controls.HERE / 'preparation.json', native.HERE / 'preparation.json',
             BASE / 'pressure-footprint-v341/guard_with_footprint.py',
             BASE / 'pressure-footprint-v341/pressure_footprint.py']
    paths += [ROOT / 'Tools' / n for n in c.DRIVERS + ('thermal_readiness.py',)]
    return {str(p): digest(p) for p in paths}


def import_native(name, packet, selected, proof):
    """Copy original bytes, then add explicitly derived campaign metadata."""
    stage = 'native/' + name
    target = PACKET / stage
    raw = target / 'evidence'
    original_path = Path(proof['directory'])
    raw.mkdir(parents=True, exist_ok=False)
    (raw / 'original-execution').mkdir()
    for filename in NATIVE_FILES:
        destination = raw / filename if filename in ('stdout.txt', 'stderr.txt') else raw / 'original-execution' / filename
        shutil.copyfile(original_path / filename, destination)
        require(digest(destination) == proof['sha256'][filename], 'native copy differs from original bytes')
    origin = {'original_directory': str(original_path), 'original_sha256': proof['sha256'],
              'meaning': 'One original V361 execution. This import performs no inference and does not create a second observation.'}
    c.write_new(raw / 'manifest.json', {'identity': packet['build']['identity'], **selected['native'][name],
        'exit_code': 0, 'passed': True, 'assertions': proof['assertions'],
        'kind': 'derived-campaign-manifest-for-original-native-execution', 'provenance': origin})
    c.write_new(target / 'attempt.json', {'stage': stage, 'contract_sha256': packet['contract_sha256'],
        'kind': 'native-import-not-a-new-attempt', 'derived_at': now(), 'provenance': origin})
    c.write_new(target / 'receipt.json', {'exit_code': 0, 'cleanup_complete': True,
        'kind': 'derived-import-receipt', 'provenance': origin, 'artifact_sha256': c.artifact_hashes(raw)})
    c.assess_stage(PACKET, packet, selected, stage)


def prepare():
    require(not PACKET.exists() and not (HERE / 'preparation.json').exists(), 'already prepared or attempted')
    proof, selected = native_proof(), contract()
    build = c.bench.verified_build(controls.BINARY)
    PACKET.mkdir(parents=True, exist_ok=False)
    c.write_new(PACKET / 'qualification-contract.json', selected)
    packet = {'format': 'slotstream-campaign-v1', 'build': build, 'created_at': now(),
              'scope': 'V360 candidate qualification. Optional composition decisions, corrected lifetimes and final activation remain separate.',
              'contract_sha256': digest(PACKET / 'qualification-contract.json'),
              'stages': list(c.STAGES), 'native_policy': copy.deepcopy(c.NATIVE_POLICY),
              'drivers': {n: digest(ROOT / 'Tools' / n) for n in c.DRIVERS},
              'templates': {p.name: digest(p) for p in sorted(c.TEMPLATES.glob('*.json'))}}
    c.write_new(PACKET / 'packet.json', packet)
    for name in c.NATIVE:
        import_native(name, packet, selected, proof[name])
    preparation = {'format': 'slotstream-fixed-mtp-campaign-adapter-v1', 'prepared_at': now(),
        'packet': str(PACKET), 'packet_sha256': digest(PACKET / 'packet.json'),
        'contract_sha256': packet['contract_sha256'], 'dependencies': dependencies(),
        'native_proof': proof, 'imported_sha256': {n: c.artifact_hashes(PACKET / 'native' / n) for n in c.NATIVE},
        'minimum_reserved_seconds': MINIMUM_RESERVED,
        'model_launched': False, 'final_composition_selected': False, 'activation_performed': False}
    c.write_new(HERE / 'preparation.json', preparation)
    return status()


def load():
    prepared = c.read(HERE / 'preparation.json')
    require(prepared['dependencies'] == dependencies() and prepared['packet'] == str(PACKET)
            and prepared['packet_sha256'] == digest(PACKET / 'packet.json')
            and prepared['contract_sha256'] == digest(PACKET / 'qualification-contract.json')
            and prepared['minimum_reserved_seconds'] == MINIMUM_RESERVED,
            'bound adapter, campaign, controls or original allowance changed')
    _, packet, selected = c.load_packet(PACKET)
    require(selected == contract(), 'selected contract changed')
    require(prepared['native_proof'] == native_proof(), 'original native evidence changed')
    for name in c.NATIVE:
        require(prepared['imported_sha256'][name] == c.artifact_hashes(PACKET / 'native' / name),
                'imported original native evidence or derived provenance changed')
        c.assess_stage(PACKET, packet, selected, 'native/' + name)
    require(all(not (PACKET / 'soak' / mode).exists() for mode in ('off', 'on')), 'legacy lifetimes must remain unrun')
    return prepared, packet, selected


def status():
    prepared, _, _ = load()
    result = c.status(PACKET)
    for row in result['stages'][:3]:
        row['original_execution'] = prepared['native_proof'][row['stage'].split('/')[1]]['directory']
    result.update(paired_matrix_complete=all(r['status'] == 'passed' for r in result['stages'][:11]),
                  final_composition_selected=False, optimization_program_complete=False, activation_performed=False)
    return result


def select_stage(rows):
    require([r['stage'] for r in rows] == list(c.STAGES), 'full stage inventory is required')
    require(all(r['status'] == 'passed' for r in rows[:3]), 'all exact native prerequisites must pass')
    require(all(r['status'] == 'unrun' for r in rows[11:]), 'legacy lifetime execution is prohibited')
    pending = next((r for r in rows[3:11] if r['status'] != 'passed'), None)
    if pending:
        require(pending['status'] == 'unrun', 'an attempted paired stage cannot retry')
    return pending


def child(stage, owner_pid):
    require(os.getppid() == owner_pid and owner_pid > 1, 'owned outer executor is required')
    current = status()
    pending = select_stage(current['stages'])
    require(pending and pending['stage'] == stage, 'owned child may only run the next unchanged stage')
    value = c.read(HERE / 'execution' / stage.split('/')[1] / 'protocol.json')
    require(value['stage'] == stage and value['owner_pid'] == owner_pid
            and value['prepared_sha256'] == digest(HERE / 'preparation.json')
            and value['executor_sha256'] == digest(Path(__file__)), 'owned execution binding differs')
    allowance(value['deadline_utc'], 30)
    return c.run_one(PACKET)


def run_one(deadline_text):
    with (HERE / '.run.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        current = status()
        pending = select_stage(current['stages'])
        if pending is None:
            return current
        stage = pending['stage']
        minimum = MINIMUM_RESERVED[stage]
        deadline = allowance(deadline_text, minimum)
        require(not c.bench.competing_jobs(), 'competing work; no stage claimed')
        require_normal(pressure_snapshot())
        before = preflight(13)
        thermal = original.require_thermal()
        allowance(deadline_text, minimum)
        target = HERE / 'execution' / stage.split('/')[1]
        require(not target.exists(), 'an attempted outer stage cannot retry')
        target.mkdir(parents=True, exist_ok=False)
        command = [sys.executable, str(Path(__file__)), '_child', '--stage', stage, '--owner-pid', str(os.getpid())]
        # The outer timeout retains the original V320 policy: the full granted
        # interval less the original 30-second cleanup reservation.
        policy = dict(c.NATIVE_POLICY, maximum_build_seconds=int(deadline - time.time() - 30))
        protocol = {'stage': stage, 'owner_pid': os.getpid(), 'prepared_sha256': digest(HERE / 'preparation.json'),
                    'executor_sha256': digest(Path(__file__)), 'deadline_utc': deadline_text,
                    'command': command, 'policy': policy, 'before': before, 'thermal_prelaunch': thermal,
                    'started_at': now(), 'classification': 'One original fixed candidate workload with selected compact rows and fixed MTP verification. No replacement, shortening or activation.'}
        c.write_new(target / 'protocol.json', protocol)
        receipt = {'passed': False, 'protocol_sha256': digest(target / 'protocol.json')}
        stopped = threading.Event()
        def progress():
            seen = 0
            while not stopped.wait(10):
                try:
                    lines = (PACKET / stage / 'evidence/results.jsonl').read_text().splitlines()
                    rows = [json.loads(line) for line in lines]
                    if len(rows) > seen:
                        seen = len(rows)
                        print(json.dumps({'stage': stage, 'completed_cells': seen, 'fixed_total_cells': 32,
                                          'eligible_cells': sum(r.get('valid') is True for r in rows)}), flush=True)
                except (OSError, json.JSONDecodeError):
                    pass
        observer = threading.Thread(target=progress, daemon=True)
        saved = {k: v for k, v in os.environ.items() if k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        start = time.monotonic()
        def snapshot():
            value = vm_snapshot()
            require_normal(pressure_snapshot())
            return value
        try:
            for key in saved:
                os.environ.pop(key)
            observer.start()
            with (target / 'stdout.txt').open('x') as out, (target / 'stderr.txt').open('x') as err:
                result = guarded_run(command, cwd=ROOT, stdout=out, stderr=err,
                    record_path=target / 'ownership-memory.json', snapshot=snapshot, policy=policy,
                    classification=protocol['classification'])
            receipt['exit_code'] = result.returncode
            receipt['stage_result'] = next(r for r in status()['stages'] if r['stage'] == stage)
            receipt['passed'] = result.returncode == 0 and receipt['stage_result']['status'] == 'passed'
        except BaseException as error:
            receipt['error'] = f'{type(error).__name__}: {error}'
        finally:
            stopped.set()
            if observer.is_alive():
                observer.join(timeout=1)
            for key in list(os.environ):
                if key.startswith(('SLOTSTREAM_', 'SS_DEBUG')):
                    os.environ.pop(key)
            os.environ.update(saved)
            receipt['elapsed_seconds'] = time.monotonic() - start
            receipt['within_reservation'] = time.time() <= deadline
            try:
                receipt['after'] = preflight(0)
                receipt['remaining_jobs'] = c.bench.competing_jobs()
                require_normal(pressure_snapshot())
                load()
                receipt['cleanup_complete'] = not receipt['remaining_jobs']
            except BaseException as error:
                receipt['cleanup_error'] = f'{type(error).__name__}: {error}'
            receipt['passed'] = bool(receipt['passed'] and receipt.get('cleanup_complete')
                                     and not receipt.get('cleanup_error') and receipt['within_reservation'])
            c.write_new(target / 'receipt.json', receipt)
        return receipt


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action', choices=['check-native', 'prepare', 'status', 'run-one', '_child'])
    parser.add_argument('--deadline')
    parser.add_argument('--stage', choices=PAIRED_STAGES)
    parser.add_argument('--owner-pid', type=int)
    args = parser.parse_args()
    def interrupted(number, _):
        raise KeyboardInterrupt(f'owned candidate campaign interrupted by signal {number}')
    signal.signal(signal.SIGINT, interrupted)
    signal.signal(signal.SIGTERM, interrupted)
    if args.action == 'check-native':
        result = {'native_proof': native_proof(), 'model_launched': False}
    elif args.action == 'prepare':
        result = prepare()
    elif args.action == 'status':
        result = status()
    elif args.action == '_child':
        require(args.stage is not None and args.owner_pid is not None, 'owned stage binding required')
        result = child(args.stage, args.owner_pid)
    else:
        require(args.deadline is not None, 'explicit coordinated deadline required')
        result = run_one(args.deadline)
    print(json.dumps(result, indent=2), flush=True)
    return 1 if args.action == 'run-one' and result.get('passed') is False else 0


if __name__ == '__main__':
    raise SystemExit(main())

````````````

## Artifact SHA-256 5424f2ad1d30415595aad35c03131d9d1d735e2ed51954e8bc9f36002fa6f727

Encoding: `utf-8`. Original bytes: 2645.

````````````text
{
  "native_proof": {
    "combined-plain": {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/combined-plain",
      "assertions": 286,
      "sha256": {
        "attempt.json": "1f1ec3a3d2273c7ef21e57f348a5aae89081ec54bfbf530a2cb7d7a5d23c2628",
        "receipt.json": "4501aa00573a537b931bd3c565547b0a0699870d6c94e4dad0a0faa2b0cad935",
        "qualification.json": "04421cc341f5402f280a2d4ae122959e785856a357870ab2b2967d4db843f3eb",
        "memory.json": "b493f1d34357d8566c521d2b1c5d3e4e9a2f7feeb03a8619c88ed37c961c7cd9",
        "memory.samples.jsonl": "970a1886bc45990662526edc0bea6124a2af4ab6259c81b70f8f5bd293d2b71a",
        "stdout.txt": "afe2e41b91f6f70aac589c539d2b1f80aab639fde4afbf4b12c4e445f7604d41",
        "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
      }
    },
    "combined-mtp": {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/combined-mtp",
      "assertions": 327,
      "sha256": {
        "attempt.json": "864ebea2d08567a449e782e48f5d3af2d7ddf1b28f40a0041dc1842b7ff3f0b1",
        "receipt.json": "1369526742bd85d2c5e3c987455433c2d7b75a145940300136e9628d08788bc1",
        "qualification.json": "4f8f9d98d88283fdf0f6c5f7ac1b47506fef84028f0264ef1b7af0822539bb08",
        "memory.json": "9b0c650c68ecb124821dea64a8ceaf6f8dbf9fc5095e21edc916cc4fea42c998",
        "memory.samples.jsonl": "75790ccb54b0a62fb6c005d8c2b41869f49fcad04e302af499d8ab2fb735c8fe",
        "stdout.txt": "529a8a7d1ce7194f35aeaa65fc35480c8a26954c21da20fe0a1f6281715c205e",
        "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
      }
    },
    "read-failure-serving": {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/read-failure-serving",
      "assertions": 522,
      "sha256": {
        "attempt.json": "564efd383d3a80f0ab44329ff9c5975810ce3b2d427b75e00ac7be524afe05b7",
        "receipt.json": "99a8e9c388fa2fe7d2fd9a6780cdf784abb7161045272226961b9f88444aa92e",
        "qualification.json": "38bcea1e05f6d4bda9050a7daff986a98de5f216937fbc7f936e189ddb299518",
        "memory.json": "e916092a21147c78dbc89c9f01c9a463a878340b0a50c525eb1ac9250fbb0320",
        "memory.samples.jsonl": "b38b1a6c8b54e0f8d1edf6a6ef3998224051fdfcaf1f65dc74ec883537cde4ba",
        "stdout.txt": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127",
        "stderr.txt": "e4836406b1037cc8e75db6dd0c37940f44fe387423be5d44e1d0e78a606d2094"
      }
    }
  },
  "model_launched": false
}

````````````

## Artifact SHA-256 2788b4c9f6cb161e3074e2c088f528fef10dc3988af4cbcfc65f3e7d87997d49

Encoding: `utf-8`. Original bytes: 8864.

````````````text
"""Model-free checks of evidence reuse, original controls and launch refusal."""
import copy
import datetime
import importlib.util
import json
import os
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

PATH = Path(__file__).with_name('campaign.py')
spec = importlib.util.spec_from_file_location('campaign_under_test', PATH)
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)


class CampaignTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        self.here, self.packet = self.root / 'adapter', self.root / 'packet'
        self.here.mkdir()
        for name, value in [('HERE', self.here), ('PACKET', self.packet)]:
            p = patch.object(m, name, value)
            p.start()
            self.addCleanup(p.stop)

    def rows(self):
        return [{'stage': s, 'status': 'passed' if s.startswith('native/') else 'unrun'} for s in m.c.STAGES]

    def deadline(self, seconds=7200):
        return (datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(seconds=seconds)).isoformat()

    def preparation(self):
        return m.prepare()

    def test_real_native_proof_is_complete(self):
        value = m.native_proof()
        self.assertEqual({n: v['assertions'] for n, v in value.items()},
                         {'combined-plain': 286, 'combined-mtp': 327, 'read-failure-serving': 522})
        self.assertTrue(all(set(v['sha256']) == set(m.NATIVE_FILES) for v in value.values()))

    def test_private_validator_does_not_change_original_campaign(self):
        self.assertIs(m.c.validate_paired_protocol, m.controls.validate)
        self.assertIsNot(m.controls.c.validate_paired_protocol, m.controls.validate)
        self.assertEqual(m.c.assess_stage.__code__.co_code, m.controls.c.assess_stage.__code__.co_code)
        self.assertEqual(m.c.run_one.__code__.co_code, m.controls.c.run_one.__code__.co_code)

    def test_all_original_protocols_and_controls(self):
        value = m.contract()
        self.assertEqual(set(value['paired_protocols']), set(m.c.PAIRED))
        for name, protocol in value['paired_protocols'].items():
            m.controls.validate(name, protocol)
            self.assertEqual(protocol['rounds'], 16)
            combined = protocol['arms']['combined']['env']
            if name == 'actual-default-one-token':
                self.assertEqual(combined, {})
            else:
                self.assertEqual(combined['SLOTSTREAM_OPT_NGRAM_ROWS'], '1')
                self.assertEqual(combined['SLOTSTREAM_OPT_MTP_TAIL'], '0')

    def test_native_changed_build_fails(self):
        wrong = copy.deepcopy(m.c.bench.verified_build(m.controls.BINARY))
        wrong['identity']['binary_sha256'] = '0' * 64
        with patch.object(m.native, 'load', return_value={'build': wrong}), self.assertRaises(ValueError):
            m.native_proof()

    def changed_raw(self, basename, change):
        original = m.c.read
        def read(path):
            result = original(path)
            if Path(path) == m.native.OUT / 'combined-mtp' / basename:
                result = copy.deepcopy(result)
                change(result)
            return result
        return patch.object(m.c, 'read', side_effect=read)

    def test_failed_original_report_cannot_import(self):
        with self.changed_raw('stdout.txt', lambda v: v['items'][0].update(passed=False)), self.assertRaises(ValueError):
            m.native_proof()

    def test_missing_new_assertions_cannot_import(self):
        with self.changed_raw('stdout.txt', lambda v: v.update(items=v['items'][:-1])), self.assertRaises(ValueError):
            m.native_proof()

    def test_cleanup_or_deadline_failure_cannot_import(self):
        for field in ('cleanup_complete', 'within_reservation', 'proofs_unchanged'):
            with self.subTest(field=field), self.changed_raw('qualification.json', lambda v: v.update({field: False})), self.assertRaises(ValueError):
                m.native_proof()

    def test_original_guard_failure_cannot_import(self):
        with self.changed_raw('memory.json', lambda v: v.update(remaining_owned_members_after_cleanup=[123])), self.assertRaises(ValueError):
            m.native_proof()

    def test_exact_import_preserves_original_bytes_and_provenance(self):
        before = m.native_proof()
        status = self.preparation()
        self.assertEqual([v['status'] for v in status['stages']], ['passed'] * 3 + ['unrun'] * 10)
        self.assertFalse(status['paired_matrix_complete'])
        self.assertFalse(status['final_composition_selected'])
        self.assertEqual(m.native_proof(), before)
        for name in m.c.NATIVE:
            raw = self.packet / 'native' / name / 'evidence'
            self.assertEqual((raw / 'stdout.txt').read_bytes(), (m.native.OUT / name / 'stdout.txt').read_bytes())
            self.assertIn('not-a-new-attempt', m.c.read(raw.parent / 'attempt.json')['kind'])
        self.assertFalse((self.packet / 'paired').exists())
        self.assertFalse((self.packet / 'soak').exists())
        _, packet, selected = m.load()
        prerequisite = m.c.prerequisite_protocol(self.packet, selected)
        m.c.soak.validate_prerequisites(prerequisite, packet['build'], native_only=True)

    def test_changed_import_or_bound_metadata_fails(self):
        self.preparation()
        path = self.packet / 'native/combined-plain/evidence/stdout.txt'
        path.write_bytes(path.read_bytes() + b' ')
        with self.assertRaises(ValueError):
            m.load()

    def test_old_controls_or_shortened_workload_fail(self):
        self.preparation()
        path = self.packet / 'qualification-contract.json'
        value = m.c.read(path)
        value['paired_protocols']['unique-prose']['arms']['combined']['env']['SLOTSTREAM_OPT_NGRAM_ROWS'] = '0'
        path.write_text(json.dumps(value))
        with self.assertRaises(ValueError):
            m.load()

    def test_failed_stage_cannot_retry_and_legacy_cannot_run(self):
        for index, status in [(3, 'incomplete_or_failed'), (0, 'unrun'), (11, 'passed')]:
            rows = self.rows()
            rows[index]['status'] = status
            with self.subTest(index=index), self.assertRaises(ValueError):
                m.select_stage(rows)
        rows = self.rows()
        for row in rows[:11]:
            row['status'] = 'passed'
        self.assertIsNone(m.select_stage(rows))
        self.assertEqual(m.select_stage(self.rows())['stage'], 'paired/short-one')

    def test_full_interval_required_before_claim(self):
        with patch.object(m, 'status', return_value={'stages': self.rows()}), patch.object(m, 'guarded_run') as guard, self.assertRaises(ValueError):
            m.run_one(self.deadline(100))
        guard.assert_not_called()
        self.assertFalse((self.here / 'execution').exists())

    def test_memory_refusal_before_claim(self):
        with patch.object(m, 'status', return_value={'stages': self.rows()}), patch.object(m.c.bench, 'competing_jobs', return_value=[]), patch.object(m, 'require_normal'), patch.object(m, 'preflight', side_effect=ValueError('memory')), patch.object(m, 'guarded_run') as guard, self.assertRaises(ValueError):
            m.run_one(self.deadline())
        guard.assert_not_called()
        self.assertFalse((self.here / 'execution').exists())

    def test_child_requires_owned_parent(self):
        with patch.object(m.os, 'getppid', return_value=50), self.assertRaises(ValueError):
            m.child('paired/short-one', 51)

    def test_interrupted_guard_restores_environment_and_blocks_retry(self):
        (self.here / 'preparation.json').write_text('{}')
        patches = [patch.object(m, 'status', return_value={'stages': self.rows()}),
                   patch.object(m, 'load'), patch.object(m.c.bench, 'competing_jobs', return_value=[]),
                   patch.object(m, 'require_normal'), patch.object(m, 'preflight', return_value={}),
                   patch.object(m.original, 'require_thermal', return_value={'ready': True}),
                   patch.object(m, 'guarded_run', side_effect=KeyboardInterrupt('fixture interruption'))]
        for item in patches:
            item.start()
            self.addCleanup(item.stop)
        with patch.dict(os.environ, {'SLOTSTREAM_TEST_SENTINEL': 'preserve'}):
            receipt = m.run_one(self.deadline())
            self.assertEqual(os.environ['SLOTSTREAM_TEST_SENTINEL'], 'preserve')
        self.assertFalse(receipt['passed'])
        self.assertIn('KeyboardInterrupt', receipt['error'])
        self.assertTrue(receipt['cleanup_complete'])
        with self.assertRaises(ValueError):
            m.run_one(self.deadline())


if __name__ == '__main__':
    unittest.main(verbosity=2)

````````````

## Artifact SHA-256 7717b93fbdb6907dfb6f4e4b4b1e5e993320543c28a5df4d42743303af3c73d0

Encoding: `utf-8`. Original bytes: 1318.

````````````text
test_all_original_protocols_and_controls (__main__.CampaignTests) ... ok
test_changed_import_or_bound_metadata_fails (__main__.CampaignTests) ... ok
test_child_requires_owned_parent (__main__.CampaignTests) ... ok
test_cleanup_or_deadline_failure_cannot_import (__main__.CampaignTests) ... ok
test_exact_import_preserves_original_bytes_and_provenance (__main__.CampaignTests) ... ok
test_failed_original_report_cannot_import (__main__.CampaignTests) ... ok
test_failed_stage_cannot_retry_and_legacy_cannot_run (__main__.CampaignTests) ... ok
test_full_interval_required_before_claim (__main__.CampaignTests) ... ok
test_interrupted_guard_restores_environment_and_blocks_retry (__main__.CampaignTests) ... ok
test_memory_refusal_before_claim (__main__.CampaignTests) ... ok
test_missing_new_assertions_cannot_import (__main__.CampaignTests) ... ok
test_native_changed_build_fails (__main__.CampaignTests) ... ok
test_old_controls_or_shortened_workload_fail (__main__.CampaignTests) ... ok
test_original_guard_failure_cannot_import (__main__.CampaignTests) ... ok
test_private_validator_does_not_change_original_campaign (__main__.CampaignTests) ... ok
test_real_native_proof_is_complete (__main__.CampaignTests) ... ok

----------------------------------------------------------------------
Ran 16 tests in 20.185s

OK

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 675299bdeb3fb278e414b696206790055989187468298c2a140b4b2623d45402

Encoding: `utf-8`. Original bytes: 1318.

````````````text
test_all_original_protocols_and_controls (__main__.CampaignTests) ... ok
test_changed_import_or_bound_metadata_fails (__main__.CampaignTests) ... ok
test_child_requires_owned_parent (__main__.CampaignTests) ... ok
test_cleanup_or_deadline_failure_cannot_import (__main__.CampaignTests) ... ok
test_exact_import_preserves_original_bytes_and_provenance (__main__.CampaignTests) ... ok
test_failed_original_report_cannot_import (__main__.CampaignTests) ... ok
test_failed_stage_cannot_retry_and_legacy_cannot_run (__main__.CampaignTests) ... ok
test_full_interval_required_before_claim (__main__.CampaignTests) ... ok
test_interrupted_guard_restores_environment_and_blocks_retry (__main__.CampaignTests) ... ok
test_memory_refusal_before_claim (__main__.CampaignTests) ... ok
test_missing_new_assertions_cannot_import (__main__.CampaignTests) ... ok
test_native_changed_build_fails (__main__.CampaignTests) ... ok
test_old_controls_or_shortened_workload_fail (__main__.CampaignTests) ... ok
test_original_guard_failure_cannot_import (__main__.CampaignTests) ... ok
test_private_validator_does_not_change_original_campaign (__main__.CampaignTests) ... ok
test_real_native_proof_is_complete (__main__.CampaignTests) ... ok

----------------------------------------------------------------------
Ran 16 tests in 13.168s

OK

````````````

## Artifact SHA-256 166bfa9f677075c92a10c5dcbb135556c77da5cdf954e8993e16e9071f737e0b

Encoding: `utf-8`. Original bytes: 731.

````````````text
{
  "tests": 16,
  "passed": true,
  "model_launched": false,
  "campaign_prepared": false,
  "candidate_selected_for_final_activation": false,
  "executor_sha256": "0a61412c14c52c117e19f429c1b19c070f1f799eb8304e8320e3e11f71e95e0b",
  "tests_sha256": "2788b4c9f6cb161e3074e2c088f528fef10dc3988af4cbcfc65f3e7d87997d49",
  "original_native_assertions": {
    "combined-plain": 286,
    "combined-mtp": 327,
    "read-failure-serving": 522
  },
  "original_campaign_assessor_and_runner_unchanged": true,
  "original_eight_paired_workloads_preserved": true,
  "legacy_lifetime_execution_refused": true,
  "remaining_gate": "Original optional image, scope and vision dispositions before selecting and freezing the final composition."
}

````````````
