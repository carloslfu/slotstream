---
type: run
id: 01m23rfa2ypnsm36abp1jsbqzd
created: 2026-09-09T18:56:49.758850+00:00
updated: 2026-09-09T18:56:50.088633+00:00
summary: Original eight exact final paired studies are queued sequentially with unchanged full work and acceptance
binary: /Users/carlos/Projects/slotstream/.build/optimization/final-composition-build-v519/candidate/slotstream
captured_at: 2026-09-09
command: Source-only serial coordinator over original V525 run-one and original bounded readiness observer
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Original eight exact final paired studies are queued sequentially with unchanged full work and acceptance
tool: Slotstream exact native and source qualification capture
---
All three imported combined native stages and all seven original native proofs qualify; all eight original paired and both legacy lifetime stages are unrun. The serial coordinator requires passed exact resource and client manifests, preserves original V525 run-one/assessors/source/native bindings, and supplies each original minimum3330or3630seconds plus180seconds slack. The original serving driver retains all sixteen paired rounds, all32measured plus32first responses, exactwork/IDs/geometry/caps and fixed acceptance/exclusion rules. Only existing bounded cell progress is forwarded. Independent evidence processing remains paused during each cohort; no compiler/model runs concurrently. Any failure stops the queue without retry or later-stage launch. This capture contains no new benchmark result or activation.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-campaign-v525/campaign.py",
    "bytes": 18458,
    "sha256": "85a25ec8f08bf05b1d7e6200585079afe4957a3353da26ea3ee4e0c942fb0ac4"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-composition-campaign-v525/pre-paired-status-v565.json",
    "bytes": 1866,
    "sha256": "102df6561f4384e66212aa13d96e55b949a9f1ff8db856b20b4285d33122f7e5"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-paired-serial-v565/run.py",
    "bytes": 4926,
    "sha256": "eb34013b8c18cbb841aa65a4781cefab5e62319d45ab8d4e77f037112ddf2510"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-resource-client-quiet-v563/client/run.py",
    "bytes": 902,
    "sha256": "d6e79d94bb4b0fa0113b0af93add280766102ab7454abf86e402205002c1d24e"
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

## Artifact SHA-256 102df6561f4384e66212aa13d96e55b949a9f1ff8db856b20b4285d33122f7e5

Encoding: `utf-8`. Original bytes: 1866.

````````````text
{
  "scope": "V519 candidate qualification. Selected scope/vision defaults require all original paired studies, corrected lifetimes, resource/client families, sustained TPS and delivery before activation.",
  "stages": [
    {
      "stage": "native/combined-plain",
      "status": "passed",
      "assertions": 286,
      "original_execution": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-native-v523/combined-plain"
    },
    {
      "stage": "native/combined-mtp",
      "status": "passed",
      "assertions": 327,
      "original_execution": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-native-v523/combined-mtp"
    },
    {
      "stage": "native/read-failure-serving",
      "status": "passed",
      "assertions": 522,
      "original_execution": "/Users/carlos/Projects/slotstream/.build/optimization/final-composition-native-v523/read-failure-serving"
    },
    {
      "stage": "paired/short-one",
      "status": "unrun"
    },
    {
      "stage": "paired/unique-prose",
      "status": "unrun"
    },
    {
      "stage": "paired/sampled-short",
      "status": "unrun"
    },
    {
      "stage": "paired/mtp-resource",
      "status": "unrun"
    },
    {
      "stage": "paired/distinct-tail",
      "status": "unrun"
    },
    {
      "stage": "paired/complete-repeat",
      "status": "unrun"
    },
    {
      "stage": "paired/unique-with-retention",
      "status": "unrun"
    },
    {
      "stage": "paired/actual-default-one-token",
      "status": "unrun"
    },
    {
      "stage": "soak/off",
      "status": "unrun"
    },
    {
      "stage": "soak/on",
      "status": "unrun"
    }
  ],
  "qualification_complete": false,
  "activation_performed": false,
  "paired_matrix_complete": false,
  "final_composition_selected": true,
  "optimization_program_complete": false
}

````````````

## Artifact SHA-256 eb34013b8c18cbb841aa65a4781cefab5e62319d45ab8d4e77f037112ddf2510

Encoding: `utf-8`. Original bytes: 4926.

````````````text
"""Serially execute the eight unchanged final paired cohorts.

The original V525 executor owns admission, every cell, all acceptance and cleanup.
This coordinator only supplies full deadlines, settles before each cohort, saves
stdout and forwards its existing bounded progress. Any failure stops the queue.
"""
from pathlib import Path
import datetime
import hashlib
import importlib.util
import json
import signal
import subprocess

BASE = Path('/tmp/slotstream-optimization-execution')
HERE = Path(__file__).resolve().parent
ROOT = Path('/Users/carlos/Projects/slotstream')
ADAPTER = BASE / 'final-composition-campaign-v525/campaign.py'
COOLER = BASE / 'final-resource-client-quiet-v563/client/run.py'

def digest(path): return hashlib.sha256(Path(path).read_bytes()).hexdigest()

def launch(command, out, err, progress=False):
    child = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=err, text=True)
    try:
        for line in child.stdout:
            out.write(line); out.flush()
            if progress and line.startswith('{"stage":'):
                print(line, end='', flush=True)
        return child.wait()
    except BaseException:
        if child.poll() is None:
            child.terminate()
            try: child.wait(timeout=30)
            except subprocess.TimeoutExpired:
                child.kill(); child.wait(timeout=5)
        raise
    finally:
        child.stdout.close()

def main():
    def interrupted(number, frame):
        raise KeyboardInterrupt(f'final paired queue interrupted by signal {number}')
    signal.signal(signal.SIGINT, interrupted)
    signal.signal(signal.SIGTERM, interrupted)
    spec = importlib.util.spec_from_file_location('final_paired_coordinator_adapter', ADAPTER)
    adapter = importlib.util.module_from_spec(spec); spec.loader.exec_module(adapter)
    initial = adapter.status()
    assert all(r['status'] == 'passed' for r in initial['stages'][:3])
    assert all(r['status'] == 'unrun' for r in initial['stages'][3:])
    resource = ROOT/'.build/optimization/final-composition-quiet-resource-client-v562/resource/manifest.json'
    client = ROOT/'.build/optimization/final-composition-offline-client-v564/client/manifest.json'
    assert json.loads(resource.read_text())['passed'] is True
    assert json.loads(client.read_text())['passed'] is True
    binding = {'adapter_sha256':digest(ADAPTER), 'cooler_sha256':digest(COOLER),
               'resource_manifest_sha256':digest(resource), 'client_manifest_sha256':digest(client),
               'initial_status':initial, 'minimum_reserved_seconds':adapter.MINIMUM_RESERVED,
               'additional_reservation_slack_seconds':180,
               'original_workload_and_acceptance_unchanged':True,
               'independent_evidence_processing_paused':True}
    with (HERE/'binding.json').open('x') as f: json.dump(binding,f,indent=2)
    for stage in adapter.PAIRED_STAGES:
        state = adapter.status()
        pending = adapter.select_stage(state['stages'])
        assert pending and pending['stage'] == stage and pending['status'] == 'unrun'
        assert digest(ADAPTER) == binding['adapter_sha256'] and digest(COOLER) == binding['cooler_sha256']
        target = HERE/stage.split('/')[1]; target.mkdir(exist_ok=False)
        cool = target/'settle'; cool.mkdir()
        (cool/'run.py').write_bytes(COOLER.read_bytes())
        print(json.dumps({'settling_before':stage,'nominal_seconds':120}),flush=True)
        with (cool/'stdout.txt').open('x') as out, (cool/'stderr.txt').open('x') as err:
            code = launch(['python3',str(cool/'run.py')],out,err)
        if code:
            print(json.dumps({'settling_failed':stage,'exit_code':code}),flush=True)
            return code
        seconds = adapter.MINIMUM_RESERVED[stage]+180
        deadline = (datetime.datetime.now(datetime.timezone.utc)+datetime.timedelta(seconds=seconds)).isoformat()
        command = ['python3',str(ADAPTER),'run-one','--deadline',deadline]
        with (target/'launch.json').open('x') as f:
            json.dump({'stage':stage,'command':command,'deadline':deadline,'reserved_seconds':seconds},f,indent=2)
        print(json.dumps({'starting':stage,'deadline':deadline}),flush=True)
        with (target/'stdout.txt').open('x') as out, (target/'stderr.txt').open('x') as err:
            code = launch(command,out,err,progress=True)
        print(json.dumps({'finished':stage,'exit_code':code}),flush=True)
        if code: return code
        state = adapter.status()
        assert next(r for r in state['stages'] if r['stage']==stage)['status']=='passed'
    final = adapter.status()
    assert final['paired_matrix_complete'] is True
    with (HERE/'completed.json').open('x') as f: json.dump(final,f,indent=2)
    print(json.dumps({'all_eight_final_paired_cohorts_passed':True,'activation_performed':False}),flush=True)
    return 0

if __name__ == '__main__': raise SystemExit(main())

````````````

## Artifact SHA-256 d6e79d94bb4b0fa0113b0af93add280766102ab7454abf86e402205002c1d24e

Encoding: `utf-8`. Original bytes: 902.

````````````text
from pathlib import Path
import json,sys,time
HERE=Path(__file__).resolve().parent
sys.path.insert(0,'/Users/carlos/Projects/slotstream/Tools')
sys.path.insert(0,'/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388')
import thermal_settle
started=time.monotonic()
with (HERE/'samples.jsonl').open('x') as output:
 def record(value):
  output.write(json.dumps(value)+'\n');output.flush()
 try:
  result=thermal_settle.wait({'stable_seconds':120,'maximum_wait_seconds':600,'poll_seconds':2},22.2,record=record)
  result.update(passed=True,model_launched=False)
 except Exception as error:
  result={'passed':False,'model_launched':False,'error':type(error).__name__+': '+str(error),'elapsed_seconds':time.monotonic()-started}
(HERE/'result.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2),flush=True)
raise SystemExit(0 if result['passed'] else 1)

````````````
