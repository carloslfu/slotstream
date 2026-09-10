---
type: run
id: 01m22xj17bwayqt46mmgxwn54y
created: 2026-09-09T11:06:27.435216+00:00
updated: 2026-09-09T11:06:27.939584+00:00
summary: Final source qualification drivers preserve original native, paired and long workloads
binary: No V519 binary exists or is run; authentic V492 evidence used only inside temporary model-free importer tests
captured_at: 2026-09-09
command: V522 Python syntax check; V523 five native-adapter tests; V524 five final-control tests; V525 seventeen campaign-controller tests
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Final source qualification drivers preserve original native, paired and long workloads
tool: Slotstream exact native and source qualification capture
---
Prospective drivers only. The pure/CLI driver preserves the original 33 groups and 116 CLI checks and requires all 25,337 prior assertion names/multiplicities plus explicit vision override cases on the eventual new source. Five native-adapter tests preserve all seven original workloads, guard policies, complete allowances and all 5,556 V492 assertions; model dispatch is intercepted. Five control tests reconstruct all eight original paired workloads and both original 512-output, 16-pair long studies after reversing only exact final identity and selected independent switches. AUTO is explicit because manual original scope controls suppress inheritance; actual-default combined environment remains empty, compact rows are selected, query tiling is 256 and rejected MTP tail stays zero. Source-path comparison matches the canonical coordinate produced by the build preparer, avoiding the previously observed /tmp alias problem. Seventeen campaign tests pass, including exact evidence copying, missing or failed assertions, altered source/workloads, all seven native prerequisites, insufficient interval/headroom, interrupted cleanup and no retries. These tests read authentic immutable V492 native evidence into temporary model-free test packets; they do not qualify or run the future V519 composition. No final build, native preparation, model, paired protocol freeze or activation occurs. Earlier execution evidence and all original resource/client/lifetime/long gates remain required.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-campaign-v525/campaign.py",
    "bytes": 18458,
    "sha256": "85a25ec8f08bf05b1d7e6200585079afe4957a3353da26ea3ee4e0c942fb0ac4"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-campaign-v525/test_campaign.py",
    "bytes": 10333,
    "sha256": "1c4013f1aa76280bdc31ff8821b3a7e9975c5462b6a79a3b4d09badd0cfb6c40"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-campaign-v525/tests.stderr.txt",
    "bytes": 2161,
    "sha256": "5cb7d2277b3922b73c8f378a5f2917f7a016671c0a96027db821bc30a0626f0f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-campaign-v525/tests.stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-controls-v524/checks.py",
    "bytes": 5158,
    "sha256": "5256848e5e327d76fc023be7bbf954e7ae9ec6435b32faf8dff7ad65a7081089"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-controls-v524/checks.stderr",
    "bytes": 103,
    "sha256": "1683faffcdfbe110d76dbff5223ec6c50e28683becee8feb448717707418bee4"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-controls-v524/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-controls-v524/controls.py",
    "bytes": 5095,
    "sha256": "3311dc283d4c17222a11f210382b986ff8907258480ff22d49c2174679369693"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-metadata-v522/run.py",
    "bytes": 7259,
    "sha256": "66175afd725c2e0b896073a6bada801092bf362b61a8543b4b7122d7f05f4602"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-native-v523/checks.py",
    "bytes": 3831,
    "sha256": "86da9eb3406e14077677d18f91f144603db2fa135d2c19a942e82668b79361c7"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-native-v523/checks.stderr",
    "bytes": 103,
    "sha256": "dae97527feaa5f4404b7cf8a367c36b5834935509ab9babacf648b1bb8476a3b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-native-v523/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-native-v523/run.py",
    "bytes": 7711,
    "sha256": "21eae8c3126f597c6da1cfdf0ea913ed5868d21e10da527165bd42f3d7296dda"
  }
]
```

## Artifact SHA-256 85a25ec8f08bf05b1d7e6200585079afe4957a3353da26ea3ee4e0c942fb0ac4

Encoding: `utf-8`. Original bytes: 18458.

````````````text
"""Exact native evidence bridge and selected-control campaign for V519.

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
PACKET = ROOT / '.build/optimization/final-composition-campaign-v525'
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
# untouched. Its one substituted validator accepts only V524's exact NG1/TAIL0
# amendment, then reconstructs and validates the original frozen template.
c = module('fixed_mtp_campaign_private', ROOT / 'Tools/optimization_campaign.py')
controls = module('fixed_mtp_campaign_controls', BASE / 'final-composition-controls-v524/controls.py')
native = module('fixed_mtp_campaign_native', BASE / 'final-composition-native-v523/run.py')
original = module('fixed_mtp_campaign_reservation', BASE / 'thermal-screened-confirmation-v320/confirmation.py')
c.validate_paired_protocol = controls.validate
require, now, allowance = original.require, original.now, original.allowance
NATIVE_FILES = ('attempt.json', 'receipt.json', 'qualification.json', 'memory.json',
                'memory.samples.jsonl', 'stdout.txt', 'stderr.txt')
PAIRED_STAGES = tuple('paired/' + n for n in c.PAIRED)
MINIMUM_RESERVED = {s: 3330 if s == 'paired/unique-prose' else 3630 for s in PAIRED_STAGES}


def native_proof():
    prepared = native.load()
    require(prepared['build'] == controls.final_build(), 'native and selected candidate differ')
    result = {}
    for name in native.NATIVE:
        path = native.OUT / name
        attempt, receipt, qualification, memory = [c.read(path / n) for n in NATIVE_FILES[:4]]
        assessment = native.assess(name, c.read(path / 'stdout.txt'))
        require(attempt['command'] == prepared['commands'][name]
                and attempt['environment'] == prepared['environment']
                and attempt['build'] == prepared['build']
                and attempt['policy'] == prepared['policies'][name]
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
                and memory['policy'] == prepared['policies'][name], 'original native guard or cleanup failed')
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
             Path(controls.selection.__file__), controls.SOURCE, controls.BUILD / 'protocol.json',
             HERE / 'test_campaign.py', HERE / 'tests.stderr.txt',
             BASE / 'pressure-footprint-v341/guard_with_footprint.py',
             BASE / 'pressure-footprint-v341/pressure_footprint.py']
    paths += [ROOT / 'Tools' / n for n in c.DRIVERS + ('thermal_readiness.py',)]
    return {str(p.resolve()): digest(p) for p in paths}


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
              'meaning': 'One original V523 execution. This import performs no inference and does not create a second observation.'}
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
              'scope': 'V519 candidate qualification. Selected scope/vision defaults require all original paired studies, corrected lifetimes, resource/client families, sustained TPS and delivery before activation.',
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
        'model_launched': False, 'final_composition_selected': True, 'activation_performed': False}
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
                  final_composition_selected=True, optimization_program_complete=False, activation_performed=False)
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
                    'started_at': now(), 'classification': 'One original fixed candidate workload with selected compact rows, automatic scope, query tiling and fixed MTP verification. No replacement, shortening or activation.'}
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

## Artifact SHA-256 1c4013f1aa76280bdc31ff8821b3a7e9975c5462b6a79a3b4d09badd0cfb6c40

Encoding: `utf-8`. Original bytes: 10333.

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
        # Exercise the new importer with all seven authentic, immutable V492
        # proofs in a temporary test packet. This does not qualify V519 or
        # persist synthetic final-default evidence.
        native = m.module('campaign_authentic_prior_native', m.BASE / 'adaptive-scope-native-v496/run.py')
        build = m.c.bench.verified_build(native.BINARY)
        for item in [patch.object(m, 'native', native),
                     patch.object(m.controls, 'BINARY', native.BINARY),
                     patch.object(m.controls, 'final_build', return_value=build),
                     patch.object(m, 'dependencies', return_value={'synthetic-test-packet': 'not-execution-proof'})]:
            item.start();self.addCleanup(item.stop)
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
                         {'scope-family-2051':817, 'scope-family-4096':817, 'scope-lifecycle':1914, 'scope-mtp-vision':873, 'combined-plain':286, 'combined-mtp':327, 'read-failure-serving':522})
        self.assertTrue(all(set(v['sha256']) == set(m.NATIVE_FILES) for v in value.values()))

    def test_private_validator_does_not_change_original_campaign(self):
        self.assertIs(m.c.validate_paired_protocol, m.controls.validate)
        self.assertIsNot(m.controls.c.validate_paired_protocol, m.controls.validate)
        self.assertEqual(m.c.assess_stage.__code__.co_code, m.controls.c.assess_stage.__code__.co_code)
        self.assertEqual(m.c.run_one.__code__.co_code, m.controls.c.run_one.__code__.co_code)

    def test_physical_dependency_identity_survives_tmp_alias(self):
        source = importlib.util.spec_from_file_location('campaign_alias', PATH.resolve())
        alias = importlib.util.module_from_spec(source)
        source.loader.exec_module(alias)
        self.assertEqual(alias.native.__file__, str(m.BASE / 'final-composition-native-v523/run.py'))
        self.assertEqual(alias.controls.HERE, (m.BASE / 'final-composition-controls-v524').resolve())

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
                self.assertEqual(combined['SLOTSTREAM_OPT_AUTO_READ_SCOPE'], '1')
                self.assertEqual(combined['SLOTSTREAM_OPT_VISION_QUERY_TILE'], '256')

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
        self.assertTrue(status['final_composition_selected'])
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

## Artifact SHA-256 5cb7d2277b3922b73c8f378a5f2917f7a016671c0a96027db821bc30a0626f0f

Encoding: `utf-8`. Original bytes: 2161.

````````````text
test_all_original_protocols_and_controls (__main__.CampaignTests.test_all_original_protocols_and_controls) ... ok
test_changed_import_or_bound_metadata_fails (__main__.CampaignTests.test_changed_import_or_bound_metadata_fails) ... ok
test_child_requires_owned_parent (__main__.CampaignTests.test_child_requires_owned_parent) ... ok
test_cleanup_or_deadline_failure_cannot_import (__main__.CampaignTests.test_cleanup_or_deadline_failure_cannot_import) ... ok
test_exact_import_preserves_original_bytes_and_provenance (__main__.CampaignTests.test_exact_import_preserves_original_bytes_and_provenance) ... ok
test_failed_original_report_cannot_import (__main__.CampaignTests.test_failed_original_report_cannot_import) ... ok
test_failed_stage_cannot_retry_and_legacy_cannot_run (__main__.CampaignTests.test_failed_stage_cannot_retry_and_legacy_cannot_run) ... ok
test_full_interval_required_before_claim (__main__.CampaignTests.test_full_interval_required_before_claim) ... ok
test_interrupted_guard_restores_environment_and_blocks_retry (__main__.CampaignTests.test_interrupted_guard_restores_environment_and_blocks_retry) ... ok
test_memory_refusal_before_claim (__main__.CampaignTests.test_memory_refusal_before_claim) ... ok
test_missing_new_assertions_cannot_import (__main__.CampaignTests.test_missing_new_assertions_cannot_import) ... ok
test_native_changed_build_fails (__main__.CampaignTests.test_native_changed_build_fails) ... ok
test_old_controls_or_shortened_workload_fail (__main__.CampaignTests.test_old_controls_or_shortened_workload_fail) ... ok
test_original_guard_failure_cannot_import (__main__.CampaignTests.test_original_guard_failure_cannot_import) ... ok
test_physical_dependency_identity_survives_tmp_alias (__main__.CampaignTests.test_physical_dependency_identity_survives_tmp_alias) ... ok
test_private_validator_does_not_change_original_campaign (__main__.CampaignTests.test_private_validator_does_not_change_original_campaign) ... ok
test_real_native_proof_is_complete (__main__.CampaignTests.test_real_native_proof_is_complete) ... ok

----------------------------------------------------------------------
Ran 17 tests in 3.649s

OK

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 5256848e5e327d76fc023be7bbf954e7ae9ec6435b32faf8dff7ad65a7081089

Encoding: `utf-8`. Original bytes: 5158.

````````````text
"""Model-free final controls binding checks. Synthetic build data never qualifies execution."""
from pathlib import Path
import copy
import importlib.util
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('final_control_checks',HERE / 'controls.py')
m = importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
SYNTHETIC = {'identity':{'binary_sha256':'0'*64,'source':{'synthetic.swift':'1'*64}}}


class Checks(unittest.TestCase):
    def test_all_eight_original_workloads_and_selected_controls(self):
        with patch.object(m,'final_build',return_value=SYNTHETIC):
            for name in m.c.PAIRED:
                value = m.materialize(name)
                self.assertTrue(m.validate(name,value))
                self.assertEqual(m.selection.restore(name,value),m.original(name,SYNTHETIC))
                self.assertEqual(value['arms']['reference']['env'][m.selection.AUTO],'0')
                if name == 'actual-default-one-token':
                    self.assertEqual(value['arms']['combined']['env'],{})
                else:
                    env = value['arms']['combined']['env']
                    self.assertEqual([env[k] for k in [m.selection.NGRAM,m.selection.AUTO,m.selection.VISION,m.selection.TAIL]],['1','1','256','0'])
        self.assertFalse((HERE / 'drafts').exists())

    def test_both_long_workloads_reconstruct_the_original_exactly(self):
        with patch.object(m,'final_build',return_value=SYNTHETIC):
            for mode,name in [('off','unique-prose'),('on','mtp-resource')]:
                value=m.materialize_long(m.materialize(name),mode)
                self.assertEqual(value['rounds'],16)
                self.assertEqual(value['max_tokens'],512)
                self.assertEqual(value['minimum_output_tokens'],512)
                self.assertEqual(value['maximum_sampled_footprint_bytes'],(10 if mode=='off' else 12)*10**9)
                self.assertEqual(value['acceptance']['minimum_pairs'],8)
                if mode=='on':self.assertTrue(all(a['env']['SLOTSTREAM_DRAFT_DEPTH']=='1' for a in value['arms'].values()))

    def test_changed_work_or_controls_cannot_be_rebound(self):
        with patch.object(m,'final_build',return_value=SYNTHETIC):
            for name in m.c.PAIRED:
                value=m.materialize(name)
                for field,new in [('rounds',1),('max_tokens',999),('frozen_binary_sha256','9'*64)]:
                    changed=copy.deepcopy(value);changed[field]=new
                    with self.assertRaises(ValueError):m.validate(name,changed)
                changed=copy.deepcopy(value);changed['arms']['reference']['env'][m.selection.AUTO]='1'
                with self.assertRaises(ValueError):m.validate(name,changed)

    def proof(self):
        lease={'passed':True,'restored':True,'within_reservation':True,'protocol_sha256':'synthetic-protocol'}
        protocol={'source_audit':{'path':str(m.SOURCE),'sha256':'synthetic-source'},'candidate_source':SYNTHETIC['identity']['source']}
        source={'selected_defaults':{'automaticReadScope':True,'visionQueryTile':256,'compactNgramRows':True,'boundedDraftTail':False}}
        return lease,protocol,source

    def check_build(self,lease,protocol,source):
        def read(path):
            if Path(path).name=='lease-result.json':return lease
            if Path(path).name=='protocol.json':return protocol
            if Path(path).name=='source-audit.json':return source
            raise AssertionError('unexpected read')
        def digest(path):return 'synthetic-protocol' if Path(path).name=='protocol.json' else 'synthetic-source'
        with patch.object(m.c.bench,'verified_build',return_value=SYNTHETIC),patch.object(m.c,'read',side_effect=read),patch.object(m,'digest',side_effect=digest):
            return m.final_build()

    def test_build_source_restoration_deadline_and_selection_required(self):
        for key in ['passed','restored','within_reservation','protocol_sha256']:
            lease,protocol,source=self.proof();lease[key]=False
            with self.assertRaises(ValueError):self.check_build(lease,protocol,source)
        for field in ['source_audit','candidate_source']:
            lease,protocol,source=self.proof();protocol[field]={}
            with self.assertRaises(ValueError):self.check_build(lease,protocol,source)
        for key,new in [('automaticReadScope',False),('visionQueryTile',0),('compactNgramRows',False),('boundedDraftTail',True)]:
            lease,protocol,source=self.proof();source['selected_defaults'][key]=new
            with self.assertRaises(ValueError):self.check_build(lease,protocol,source)
        self.assertEqual(self.check_build(*self.proof()),SYNTHETIC)

    def test_canonical_source_coordinate_matches_build_preparer(self):
        preparer=m.module('final_build_preparer_paths',m.BUILD/'prepare.py')
        self.assertEqual(str(preparer.DRAFT/'source-audit.json'),str(m.SOURCE))
        self.assertFalse((HERE/'preparation.json').exists())
        self.assertFalse((m.BUILD/'protocol.json').exists())


if __name__=='__main__':unittest.main()

````````````

## Artifact SHA-256 1683faffcdfbe110d76dbff5223ec6c50e28683becee8feb448717707418bee4

Encoding: `utf-8`. Original bytes: 103.

````````````text
.....
----------------------------------------------------------------------
Ran 5 tests in 0.030s

OK

````````````

## Artifact SHA-256 3311dc283d4c17222a11f210382b986ff8907258480ff22d49c2174679369693

Encoding: `utf-8`. Original bytes: 5095.

````````````text
"""Bind the original paired and long workloads to the verified final build only."""
from pathlib import Path
import importlib.util
import json
import sys

ROOT = Path('/Users/carlos/Projects/slotstream')
BASE = Path('/tmp/slotstream-optimization-execution')
HERE = Path(__file__).resolve().parent
BUILD = BASE / 'final-composition-build-v519'
SOURCE = (BASE / 'final-composition-source-v518/source-audit.json').resolve()
BINARY = ROOT / '.build/optimization/final-composition-build-v519/candidate/slotstream'
MODEL = '/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit'
sys.path.insert(0, str(ROOT / 'Tools'))
import optimization_campaign as c
from prefill_bench import digest


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


selection = module('v524_final_selection', BASE / 'final-selected-controls-v506/controls.py')
old = module('v524_original_long_controls', BASE / 'compact-cache-fixed-mtp-controls-v363/controls.py')


def require(ok, message):
    if not ok: raise ValueError(message)


def final_build():
    build = c.bench.verified_build(BINARY)
    lease, protocol, source = c.read(BUILD / 'lease-result.json'), c.read(BUILD / 'protocol.json'), c.read(SOURCE)
    require(lease.get('passed') is True and lease.get('restored') is True
            and lease.get('within_reservation') is True
            and lease['protocol_sha256'] == digest(BUILD / 'protocol.json'), 'final build lease did not qualify')
    require(protocol['source_audit'] == {'path':str(SOURCE), 'sha256':digest(SOURCE)}
            and protocol['candidate_source'] == build['identity']['source'], 'final source or compiled identity differs')
    require(source['selected_defaults'] == {'automaticReadScope':True, 'visionQueryTile':256,
            'compactNgramRows':True, 'boundedDraftTail':False}, 'final component selection is unsettled or changed')
    return build


def original(name, build):
    require(name in c.PAIRED, 'unknown original workload')
    value = c.materialize(c.read(c.TEMPLATES / (name + '.json')), BINARY, MODEL)
    value['frozen_binary_sha256'] = build['identity']['binary_sha256']
    c.validate_paired_protocol(name, value)
    return value


def materialize(name):
    return selection.select(name, original(name, final_build()), automatic=True)


def validate(name, protocol):
    value = original(name, final_build())
    return selection.validate(name, protocol, value, automatic=True)


def materialize_long(protocol, mode):
    name = {'off':'unique-prose', 'on':'mtp-resource'}.get(mode)
    require(name is not None, 'unknown original long-decode mode')
    validate(name, protocol)
    result = old.materialize_long(protocol, mode)
    # Reconstruct the original V365 workload after only final identity and the
    # explicitly selected independent controls are put back to their old values.
    original_long = c.read(old.HERE / 'drafts' / ('long-' + mode + '.json'))
    restored = selection.restore(name, result)
    restored['arms']['combined']['env']['SLOTSTREAM_OPT_NGRAM_ROWS'] = '1'
    for key in ('binary','model','frozen_binary_sha256'):
        restored[key] = original_long[key]
    for arm in restored['arms']:
        restored['arms'][arm]['binary'] = original_long['arms'][arm]['binary']
    require(restored == original_long, 'original long-decode workload, bounds, geometry or acceptance changed')
    return result


def prepare():
    require(not (HERE / 'preparation.json').exists() and not (HERE / 'drafts').exists(), 'already prepared')
    build = final_build()
    paired = {name:materialize(name) for name in c.PAIRED}
    long = {mode:materialize_long(paired[name],mode) for mode,name in [('off','unique-prose'),('on','mtp-resource')]}
    out = HERE / 'drafts';out.mkdir(exist_ok=False)
    for name, value in paired.items(): c.write_new(out / (name + '.json'),value)
    for mode, value in long.items(): c.write_new(out / ('long-' + mode + '.json'),value)
    result = {'classification':'Final exact-build workload preparation only. All original eight paired and two 512-output long studies retain every input, dimension, numerical control, acceptance rule and resource bound. Independent selected switches are explicit; actual-default combined environment stays empty. No model launched or final acceptance claimed.',
              'build':build, 'model_launched':False, 'activation_performed':False,
              'controller_sha256':digest(Path(__file__)), 'selection_sha256':digest(Path(selection.__file__)),
              'original_long_controls_sha256':digest(Path(old.__file__)),
              'source_audit_sha256':digest(SOURCE), 'build_protocol_sha256':digest(BUILD / 'protocol.json'),
              'draft_sha256':{p.name:digest(p) for p in sorted(out.glob('*.json'))}}
    c.write_new(HERE / 'preparation.json', result)
    print(json.dumps({'prepared':True,'model_launched':False,'paired_workloads':len(paired),'long_workloads':len(long)}))


if __name__ == '__main__': prepare()

````````````

## Artifact SHA-256 66175afd725c2e0b896073a6bada801092bf362b61a8543b4b7122d7f05f4602

Encoding: `utf-8`. Original bytes: 7259.

````````````text
from pathlib import Path
import datetime,fcntl,json,os,sys,time
from collections import Counter
ROOT=Path('/Users/carlos/Projects/slotstream')
sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,run_child,vm_snapshot
from serve_bench import verified_build
P=Path(__file__).parent
OUT=ROOT/'.build/optimization/final-composition-metadata-v522'
B=ROOT/'.build/optimization/final-composition-build-v519/candidate/slotstream'
r={'classification':'V519 selected final composition T0 pure Swift and CLI metadata/pre-allocation refusals only. No compiler, GPU test tier, Engine or model. Run after the build has restored and no model/compiler remains. Original300-second wall allowance plus30-second cleanup; no performance qualification.','candidate':verified_build(B),'checks_sha256':digest(B.parent/'slotstream-checks'),'driver_sha256':digest(Path(__file__)),'tool_sha256':{n:digest(ROOT/'Tools'/n) for n in ['context_gates.py','prefill_bench.py','serve_bench.py']},'required_reclaimable_gb':7,'rows':[],'passed':False}
deadline=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp()
if deadline-time.time()<330:raise RuntimeError('metadata needs its full300-second allowance plus30-second cleanup')
baseline=ROOT/'.build/optimization/adaptive-scope-metadata-v495/t0/stdout.txt'
baseline_manifest=ROOT/'.build/optimization/adaptive-scope-metadata-v495/manifest.json'
assert json.loads(baseline_manifest.read_text())['passed'] is True
old_report=json.loads(baseline.read_text())
old_coverage={check['name']:Counter(i['name'] for i in check['items']) for check in old_report['checks']}
r['baseline_t0_sha256']=digest(baseline)
r['baseline_manifest_sha256']=digest(baseline_manifest)
r['deadline_utc']=sys.argv[1]
start=time.monotonic()
OUT.mkdir(exist_ok=False)
env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
try:
    r['before']=preflight(7)
    with open(f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
        for name,command,timeout in [('t0',[str(B.parent/'slotstream-checks'),'--tier','t0','--json'],60),('context-cli',['python3',str(ROOT/'Tools/context_gates.py'),'--binary',str(B),'--report',str(OUT/'context-cli/report.json')],240)]:
            out=OUT/name;out.mkdir();row={'name':name,'command':command,'timeout_seconds':timeout,'passed':False};r['rows'].append(row)
            row['exit_code']=run_child(command,env,out,timeout)
            if name=='t0':
                report=json.loads((out/'stdout.txt').read_text());checks=report.get('checks',[])
                row['assertions']=sum(len(c.get('items',[])) for c in checks)
                row['passed']=row['exit_code']==0 and report.get('passed')==33 and report.get('failed')==0 and report.get('skipped')==0 and len(checks)==33 and row['assertions']>25337 and all(c.get('passed') is True and c.get('items') and all(i.get('passed') is True for i in c['items']) for c in checks)
                coverage={check['name']:Counter(i['name'] for i in check['items']) for check in checks}
                preserved=set(coverage)==set(old_coverage) and all(not (items-coverage[name]) for name,items in old_coverage.items())
                names={i['name'] for check in checks for i in check['items']}
                required={'adaptive scope enumerates all full-pass sizes/256',
                    'adaptive scope enumerates all full-pass sizes/512',
                    'adaptive scope enumerates all full-pass sizes/1024',
                    'concurrent multiple choices all fit without double spending',
                    'concurrent multiple choices allocate one largest scope',
                    'concurrent multiple choices allocate one smaller scope',
                    'concurrent multiple choices retain one ordinary fallback',
                    'concurrent multiple choices charge selected bytes once',
                    'concurrent multiple choices release every lease',
                    'multiple choices charge own and queued preparation before selecting',
                    'ordinary unsigned Mach footprint converts without truncation',
                    'unrepresentable Mach footprint cannot authorize an optional workspace',
                    'concurrent optional choices both complete',
                    'exactly one preferred workspace owns the available room',
                    'the other concurrent request atomically selects its fallback',
                    'optional scope fits the exact process boundary',
                    'one excess byte keeps the ordinary path',
                    '512-row planner preserves its own arithmetic',
                    '1024-row planner preserves its own arithmetic',
                    'absent vision overrides retain inherited tiling',
                    'explicit zero padding leaves inherited tiling enabled',
                    'explicit zero query tile selects original vision attention'}
                required |= {f'{label}/{padding}' for padding in [80,128] for label in [
                    'explicit padding overrides inherited tiling',
                    'explicit tiling overrides inherited padding',
                    'explicit query zero retains inherited padding',
                    'explicit padding with query zero remains valid',
                    'explicit query tile with padding zero remains valid',
                    'two explicit vision alternatives refuse']}
                required |= {f'inherited vision defaults still reject malformed override/{key}/{value}'
                    for key,value in [('SLOTSTREAM_OPT_VISION_PADDING','bad'), ('SLOTSTREAM_OPT_VISION_PADDING','256'),
                        ('SLOTSTREAM_OPT_VISION_QUERY_TILE','bad'), ('SLOTSTREAM_OPT_VISION_QUERY_TILE','128')]}
                row['all_original_assertion_names_and_multiplicities_preserved']=preserved
                row['new_critical_assertions_present']=required<=names
                row['passed']=bool(row['passed'] and preserved and required<=names)
            else:
                report=json.loads((out/'report.json').read_text());items=report['assertions'];row['assertions']=len(items)
                row['passed']=row['exit_code']==0 and report.get('passed') is True and len(items)==116 and all(i.get('passed') is True for i in items)
            row['stdout_sha256']=digest(out/'stdout.txt');row['stderr_sha256']=digest(out/'stderr.txt')
            (out/'manifest.json').write_text(json.dumps(row,indent=2)+'\n');print(json.dumps(row),flush=True)
            if not row['passed']:raise RuntimeError(name+' failed')
        r['passed']=len(r['rows'])==2 and all(row['passed'] for row in r['rows'])
except BaseException as e:r['error']=f'{type(e).__name__}: {e}'
finally:
    r['after']=vm_snapshot();r['elapsed_seconds']=time.monotonic()-start
    r['within_reservation']=time.time()<=deadline
    r['passed']=bool(r['passed'] and r['within_reservation'] and verified_build(B)==r['candidate'])
    (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['candidate','before','after','rows']}),flush=True)
raise SystemExit(0 if r['passed'] else 1)

````````````

## Artifact SHA-256 86da9eb3406e14077677d18f91f144603db2fa135d2c19a942e82668b79361c7

Encoding: `utf-8`. Original bytes: 3831.

````````````text
"""Model-free native-adapter contract checks; synthetic rows cannot qualify a run."""
from pathlib import Path
import copy
import datetime
import importlib.util
import inspect
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('v523_adapter_checks', HERE / 'run.py')
runner = importlib.util.module_from_spec(spec)
spec.loader.exec_module(runner)


def current(name):
    return runner.c.read(runner.BASELINES[name] / 'stdout.txt')


def fixture(name):
    return copy.deepcopy(current(name))


class Checks(unittest.TestCase):
    def test_original_execution_and_commands_preserved(self):
        for module, path in [(runner.scope, runner.SCOPE), (runner.integration, runner.INTEGRATION)]:
            original = runner.module('unmodified_' + path.parent.name, path)
            self.assertEqual(inspect.getsource(module.run), inspect.getsource(original.run))
            self.assertEqual(module.EXECUTE_SOURCE, original.EXECUTE_SOURCE)
            for name in module.NATIVE:
                self.assertEqual(module.policy(name), original.policy(name))
                self.assertEqual(module.seconds(name), original.seconds(name))
                expected = [part.replace(str(original.BINARY), str(runner.BINARY))
                            for part in original.commands()[name]]
                self.assertEqual(module.commands()[name], expected)

    def test_old_lifecycle_cannot_claim_new_sizing(self):
        with self.assertRaises(ValueError):
            runner.assess('scope-lifecycle', runner.c.read(runner.ROOT / '.build/optimization/automatic-scope-resumed-native-v459/scope-lifecycle/stdout.txt'))
        report = fixture('scope-lifecycle')
        self.assertTrue(runner.assess('scope-lifecycle', report)['qualified'])
        report['items'] = [item for item in report['items'] if item['name'] !=
                           'smaller automatic scope teacher-forced continuation is exact/device']
        with self.assertRaises(ValueError):
            runner.assess('scope-lifecycle', report)

    def test_all_seven_keep_every_prior_assertion(self):
        for name in runner.NATIVE:
            report = fixture(name)
            self.assertTrue(runner.assess(name, report)['qualified'])
            report['items'].pop(0)
            with self.assertRaises(ValueError):
                runner.assess(name, report)

    def test_short_reservation_refuses_before_source_or_model_access(self):
        deadline = (datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(seconds=1)).isoformat()
        for name, owner in runner.OWNERS.items():
            with patch.object(owner, 'load', side_effect=AssertionError('must not inspect build')) as load:
                with self.assertRaises(ValueError):
                    owner.run(name, deadline)
                load.assert_not_called()

    def test_actual_dispatch_keeps_original_admission(self):
        deadline = (datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(hours=2)).isoformat()
        for name, owner in runner.OWNERS.items():
            with patch.object(owner, 'load', return_value={}), \
                 patch.object(owner, 'readiness', side_effect=RuntimeError('intercepted original admission')) as ready, \
                 patch.object(owner, 'execute', side_effect=AssertionError('model must not launch')) as execute:
                with self.assertRaisesRegex(RuntimeError, 'intercepted original admission'):
                    owner.run(name, deadline)
                ready.assert_called_once_with(deadline, owner.seconds(name) + 30,
                                               20.112 if name.startswith('scope-') else 22.2)
                execute.assert_not_called()


if __name__ == '__main__':
    unittest.main()

````````````

## Artifact SHA-256 dae97527feaa5f4404b7cf8a367c36b5834935509ab9babacf648b1bb8476a3b

Encoding: `utf-8`. Original bytes: 103.

````````````text
.....
----------------------------------------------------------------------
Ran 5 tests in 0.024s

OK

````````````

## Artifact SHA-256 21eae8c3126f597c6da1cfdf0ea913ed5868d21e10da527165bd42f3d7296dda

Encoding: `utf-8`. Original bytes: 7711.

````````````text
"""Run all seven original native workloads on the exact selected final composition."""
from pathlib import Path
from collections import Counter
import argparse
import fcntl
import importlib.util
import json

HERE = Path(__file__).resolve().parent
BASE = HERE.parent
ROOT = Path('/Users/carlos/Projects/slotstream')
OUT = ROOT / '.build/optimization/final-composition-native-v523'
BUILD = BASE / 'final-composition-build-v519'
BINARY = ROOT / '.build/optimization/final-composition-build-v519/candidate/slotstream'
PURE = ROOT / '.build/optimization/final-composition-metadata-v522/manifest.json'


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


SCOPE = BASE / 'automatic-scope-native-v439/run.py'
INTEGRATION = BASE / 'automatic-scope-integration-native-v444/run.py'
scope = module('v523_original_scope', SCOPE)
integration = module('v523_original_integration', INTEGRATION)
c, require, digest = scope.c, scope.require, scope.digest
NATIVE = dict(scope.NATIVE, **integration.NATIVE)
OWNERS = {name: scope if name in scope.NATIVE else integration for name in NATIVE}
ORIGINAL_ASSESS = {name: owner.assess for name, owner in OWNERS.items()}
BASELINES = {name: ROOT / '.build/optimization/adaptive-scope-native-v496' / name for name in NATIVE}


def dependencies():
    files = [Path(__file__), HERE / 'checks.py', HERE / 'checks.stderr', SCOPE, INTEGRATION,
             BASE / 'adaptive-scope-choice-v491/source-audit.json',
             BASE / 'final-composition-source-v518/source-audit.json',
             BASE / 'final-composition-source-v518/prepare.py',
             BASE / 'final-composition-build-v519/prepare.py',
             BUILD / 'protocol.json', BUILD / 'lease-result.json', PURE,
             scope.CORE, BASE / 'pressure-footprint-v341/guard_with_footprint.py',
             BASE / 'pressure-footprint-v341/pressure_footprint.py']
    files += [ROOT / 'Tools' / name for name in c.DRIVERS + ('thermal_readiness.py',)]
    files += [folder / file for folder in BASELINES.values() for file in ['stdout.txt', 'qualification.json']]
    # The unchanged original scope assessor also requires the original V404
    # report as well as the newer V436 baseline checked here.
    files += [ROOT / '.build/optimization/scope-allocation-scope-native-v404' / name / file
              for name in scope.NATIVE for file in ['stdout.txt', 'qualification.json']]
    return {str(p): digest(p) for p in files}


def commands():
    return dict(scope.commands(), **integration.commands())


def prepare():
    require(not (HERE / 'preparation.json').exists() and not OUT.exists(), 'already prepared or attempted')
    require('Ran 5 tests' in (HERE / 'checks.stderr').read_text()
            and (HERE / 'checks.stderr').read_text().endswith('OK\n'), 'model-free adapter checks missing')
    build = scope.verified_build(BINARY)
    lease, protocol, pure = c.read(BUILD / 'lease-result.json'), c.read(BUILD / 'protocol.json'), c.read(PURE)
    require(lease.get('passed') is True and lease.get('restored') is True, 'exact build or restoration failed')
    require(pure.get('passed') is True and pure['candidate'] == build, 'current pure/CLI proof missing')
    require(protocol['candidate_source'] == build['identity']['source'], 'source differs from draft')
    for name, folder in BASELINES.items():
        require(c.read(folder / 'qualification.json').get('qualified') is True, 'prior current native proof missing')
    record = {'prepared_at': scope.now(), 'build': build, 'dependencies': dependencies(),
              'commands': commands(), 'native_specs': NATIVE,
              'policies': {name: owner.policy(name) for name, owner in OWNERS.items()},
              'seconds': {name: owner.seconds(name) for name, owner in OWNERS.items()},
              'environment': {}, 'classification':
              'Exact V519 selected final scope/vision composition. Reuses unchanged V439 scope and V444 integration '
              'executor/guard/assessment functions with original work and safety envelopes. '
              'All seven V492 assertion-name multiplicities must remain; lifecycle additionally requires '
              'actual process- and shared-device-limited intermediate scope choices and exact continuation. '
              'Native correctness only; final serving, lifetimes, resources, clients, sustained TPS and exact activation remain unqualified.'}
    c.write_new(HERE / 'preparation.json', record)
    return {'prepared': True, 'cases': list(NATIVE), 'model_launched': False}


def load():
    value = c.read(HERE / 'preparation.json')
    require(value['dependencies'] == dependencies(), 'source, baseline or executor changed')
    require(value['build'] == scope.verified_build(BINARY), 'compiled identity changed')
    require(value['commands'] == commands() and value['environment'] == {}, 'native commands changed')
    require(value['native_specs'] == {k: list(v) for k, v in NATIVE.items()}, 'native scope changed')
    require(value['policies'] == {n: o.policy(n) for n, o in OWNERS.items()}
            and value['seconds'] == {n: o.seconds(n) for n, o in OWNERS.items()}, 'original resource/interval policy changed')
    return value


def assess(name, report):
    result = ORIGINAL_ASSESS[name](name, report)
    previous = c.read(BASELINES[name] / 'stdout.txt')
    before = Counter(item['name'] for item in previous['items'])
    after = Counter(item['name'] for item in report['items'])
    require(not before - after, 'V492 assertion names or multiplicities dropped')
    if name == 'scope-lifecycle':
        require(report.get('measurements', {}).get('automatic_intermediate_memory_choices') == 2,
                'actual intermediate memory choices absent')
        required = {f'smaller automatic scope {label}/{budget}'
                    for budget in ['process', 'device'] for label in [
                        'actually rejects a larger candidate', 'commits four-pass groups',
                        'retains exact output', 'retains every compute shape', 'retains exact ordered routes',
                        'reduces actual expert reads', 'preserves the cold checkpoint',
                        'preserves the odd tail', 'teacher-forced continuation is exact']}
        require(required <= set(after), 'bounded native sizing coverage absent')
    result['all_v492_assertion_names_and_multiplicities_preserved'] = True
    return result


for owner in [scope, integration]:
    owner.HERE, owner.OUT, owner.BINARY, owner.BUILD = HERE, OUT, BINARY, BUILD
    owner.load, owner.assess = load, assess


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('action', choices=['prepare', 'check', 'native'])
    parser.add_argument('--name', choices=list(NATIVE))
    parser.add_argument('--deadline')
    args = parser.parse_args()
    with (HERE / '.run.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        if args.action == 'prepare':
            result = prepare()
        elif args.action == 'check':
            load()
            result = {'passed': True, 'unrun': [n for n in NATIVE if not (OUT / n).exists()]}
        else:
            require(args.name is not None and args.deadline is not None, 'one case and full deadline required')
            result = OWNERS[args.name].run(args.name, args.deadline)
    print(json.dumps({k: v for k, v in result.items() if k not in ['before', 'after']}, indent=2), flush=True)
    return 0 if args.action != 'native' or result.get('qualified') else 1


if __name__ == '__main__':
    raise SystemExit(main())

````````````
