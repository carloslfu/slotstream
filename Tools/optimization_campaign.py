#!/usr/bin/env python3
"""Prepare and run the exact combined native, paired and lifetime qualification.

Preparation and status are model-free. Execution advances one stage at a time,
never repeats an attempted stage, and never activates production defaults.
"""
import argparse
import copy
import datetime
import fcntl
import json
import os
from pathlib import Path
import signal
import sys
import time

import optimization_soak as soak
import serve_bench as bench
from optimization_readiness import pressure_snapshot, require_normal
from optimization_serial_build import guarded_run
from prefill_bench import ROOT, digest, preflight, vm_snapshot


PAIRED = ('short-one', 'unique-prose', 'sampled-short', 'mtp-resource',
          'distinct-tail', 'complete-repeat', 'unique-with-retention', 'actual-default-one-token')
NATIVE = {'combined-plain': 'integrated', 'combined-mtp': 'integrated-mtp',
          'read-failure-serving': 'read-failure-serving'}
STAGES = tuple('native/' + name for name in NATIVE) + tuple('paired/' + name for name in PAIRED) + ('soak/off', 'soak/on')
TEMPLATES = ROOT / 'Tools/fixtures/optimization/qualification'
DRIVERS = ('optimization_campaign.py', 'optimization_soak.py', 'serve_bench.py',
           'prefill_bench.py', 'optimization_readiness.py', 'optimization_serial_build.py',
           'optimization_build.py', 'build_identity.py')
IDENTITY_KEYS = ('binary_sha256', 'source_archive_sha256', 'metallib_sha256')
NATIVE_POLICY = {'startup_reclaimable_bytes': 13_000_000_000,
                 'minimum_live_reclaimable_bytes': 3_000_000_000,
                 'maximum_owned_rss_bytes': 10_000_000_000,
                 'sample_interval_seconds': .2, 'maximum_build_seconds': 1800,
                 'stop_on_new_swapouts': False}


def read(path):
    return json.loads(Path(path).read_text())


def write_new(path, value):
    with Path(path).open('x') as output:
        output.write(json.dumps(value, indent=2) + '\n')


def materialize(value, binary, model):
    if isinstance(value, dict):
        return {k: materialize(v, binary, model) for k, v in value.items()}
    if isinstance(value, list):
        return [materialize(v, binary, model) for v in value]
    if isinstance(value, str):
        return value.replace('@ROOT@', str(ROOT)).replace('@BINARY@', str(binary)).replace('@MODEL@', str(model))
    return value


def prepare(binary, model, destination):
    build = bench.verified_build(binary)
    binary, model, destination = Path(build['binary']), Path(model).resolve(), Path(destination).resolve()
    contract = {'format': 'slotstream-qualification-v1',
                'build_identity': {k: build['identity'][k] for k in IDENTITY_KEYS},
                'native': {}, 'paired_protocols': {}, 'soak_modes': {}}
    for name, variant in NATIVE.items():
        contract['native'][name] = {'command': [str(binary), 'optimization-state-check',
            '--variant', variant, '--model', str(model), '--json'], 'environment': {}}
    for name in PAIRED:
        protocol = materialize(read(TEMPLATES / (name + '.json')), binary, model)
        protocol['frozen_binary_sha256'] = build['identity']['binary_sha256']
        validate_paired_protocol(name, protocol)
        contract['paired_protocols'][name] = protocol
    for mode in ('off', 'on'):
        protocol = materialize(read(TEMPLATES / 'soak.json'), binary, model)
        protocol.update(mtp=mode, frozen_binary_sha256=build['identity']['binary_sha256'])
        soak.validate_protocol(protocol)
        contract['soak_modes'][mode] = protocol
    destination.mkdir(parents=True, exist_ok=False)
    write_new(destination / 'qualification-contract.json', contract)
    packet = {'format': 'slotstream-campaign-v1', 'build': build,
        'created_at': datetime.datetime.now(datetime.timezone.utc).isoformat(),
        'scope': 'Combined candidate qualification only; full release/client/resource acceptance and activation remain separate',
        'contract_sha256': digest(destination / 'qualification-contract.json'),
        'stages': list(STAGES), 'native_policy': copy.deepcopy(NATIVE_POLICY),
        'drivers': {n: digest(ROOT / 'Tools' / n) for n in DRIVERS},
        'templates': {p.name: digest(p) for p in sorted(TEMPLATES.glob('*.json'))}}
    write_new(destination / 'packet.json', packet)
    return {'packet': str(destination), 'contract_sha256': packet['contract_sha256'],
            'stages': len(STAGES), 'launched': False, 'qualification_complete': False}


def validate_paired_protocol(name, protocol):
    """Keep the reviewed workloads and every bound from the portable templates."""
    if name not in PAIRED:
        raise ValueError('unknown final paired workload')
    expected = materialize(read(TEMPLATES / (name + '.json')), protocol['binary'], protocol['model'])
    expected['frozen_binary_sha256'] = protocol['frozen_binary_sha256']
    if protocol != expected:
        raise ValueError('paired workload differs from its reviewed template')
    bench.validate_arms(protocol['arms'])
    bench.prefix_study(protocol)
    bench.work_constraints(protocol)
    bench.measurement_memory(protocol)
    bench.workspace_quiet_requirement(protocol)
    bench.resource_exclusions({}, protocol)
    for key in ('fixture', 'warmup_fixture'):
        if key in protocol and digest(protocol[key]) != protocol[key + '_sha256']:
            raise ValueError('paired fixture identity differs')


def load_packet(directory):
    directory = Path(directory).resolve()
    packet = read(directory / 'packet.json')
    if (packet.get('format') != 'slotstream-campaign-v1' or packet.get('stages') != list(STAGES)
            or packet.get('native_policy') != NATIVE_POLICY):
        raise ValueError('campaign format, stage order or native bounds differ')
    if set(packet.get('drivers', {})) != set(DRIVERS) or any(
            digest(ROOT / 'Tools' / n) != h for n, h in packet['drivers'].items()):
        raise ValueError('campaign driver changed; prepare a distinct candidate campaign')
    templates = {p.name: digest(p) for p in sorted(TEMPLATES.glob('*.json'))}
    if packet.get('templates') != templates:
        raise ValueError('campaign templates changed')
    if digest(directory / 'qualification-contract.json') != packet['contract_sha256']:
        raise ValueError('frozen qualification contract changed')
    if bench.verified_build(packet['build']['binary']) != packet['build']:
        raise ValueError('candidate build identity changed')
    contract = read(directory / 'qualification-contract.json')
    if (contract.get('build_identity') != {k: packet['build']['identity'][k] for k in IDENTITY_KEYS}
            or set(contract.get('native', {})) != set(NATIVE)
            or set(contract.get('paired_protocols', {})) != set(PAIRED)
            or set(contract.get('soak_modes', {})) != {'off', 'on'}):
        raise ValueError('complete same-build native/eight-paired/two-soak contract required')
    binary = packet['build']['binary']
    model = contract['paired_protocols']['short-one']['model']
    for name, variant in NATIVE.items():
        expected = {'command': [binary, 'optimization-state-check', '--variant', variant,
                                '--model', model, '--json'], 'environment': {}}
        if contract['native'][name] != expected:
            raise ValueError('native command or controls differ from the selected build/workload')
    for name, protocol in contract['paired_protocols'].items():
        if (protocol['binary'] != binary or protocol['model'] != model
                or protocol['frozen_binary_sha256'] != packet['build']['identity']['binary_sha256']):
            raise ValueError('paired protocol points to another model or build')
        validate_paired_protocol(name, protocol)
    for mode, protocol in contract['soak_modes'].items():
        expected = materialize(read(TEMPLATES / 'soak.json'), binary, model)
        expected.update(mtp=mode, frozen_binary_sha256=packet['build']['identity']['binary_sha256'])
        if protocol != expected:
            raise ValueError('soak mode differs from its reviewed build/workload')
        soak.validate_protocol(protocol)
        bound = dict(protocol, qualification_contract={'path': str(directory / 'qualification-contract.json'),
                                                       'sha256': packet['contract_sha256']})
        soak.qualification_contract(bound, packet['build'])
    return directory, packet, contract


def evidence(directory, filenames):
    return {'directory': str(directory), 'sha256': {name: digest(directory / name) for name in filenames}}


def artifact_hashes(directory):
    paths = sorted(directory.rglob('*'))
    if any(p.is_symlink() for p in paths):
        raise ValueError('qualification output may not redirect to external evidence')
    return {str(p.relative_to(directory)): digest(p) for p in paths if p.is_file()}


def prerequisite_protocol(directory, contract, *, paired=False, mode='off'):
    result = copy.deepcopy(contract['soak_modes'][mode])
    result['qualification_contract'] = {'path': str(directory / 'qualification-contract.json'),
                                       'sha256': digest(directory / 'qualification-contract.json')}
    result['prerequisites'] = {'native': {}, 'paired': {}}
    for name in NATIVE:
        result['prerequisites']['native'][name] = evidence(directory / 'native' / name / 'evidence',
                                                          ['manifest.json', 'stdout.txt'])
    if paired:
        for name in PAIRED:
            target = directory / 'paired' / name / 'evidence'
            files = ['manifest.json', 'completion.json', 'results.jsonl']
            files += [f'{number}-{arm}/warmup.json' for number in range(1, 17) for arm in ('reference', 'combined')]
            result['prerequisites']['paired'][name] = evidence(target, files)
    return result


def assess_stage(directory, packet, contract, stage):
    """Recompute acceptance from raw evidence; receipts alone never pass a stage."""
    kind, name = stage.split('/')
    target = directory / stage
    attempt, receipt = read(target / 'attempt.json'), read(target / 'receipt.json')
    if (attempt.get('contract_sha256') != packet['contract_sha256'] or attempt.get('stage') != stage
            or receipt.get('error') is not None or receipt.get('cleanup_complete') is not True):
        raise ValueError('stage failed or its ownership/contract differs')
    raw = target / 'evidence'
    if receipt.get('artifact_sha256') != artifact_hashes(raw):
        raise ValueError('captured stage evidence changed after execution')
    if kind == 'native':
        manifest, report = read(raw / 'manifest.json'), read(raw / 'stdout.txt')
        expected_name = {'combined-plain': 'optimization-integrated',
                         'combined-mtp': 'optimization-integrated-mtp',
                         'read-failure-serving': 'optimization-read-failure-serving'}[name]
        items = report.get('items')
        if (receipt.get('exit_code') != 0 or manifest.get('exit_code') != 0
                or manifest.get('passed') is not True or report.get('passed') is not True
                or report.get('skipped') is not None or report.get('name') != expected_name
                or not isinstance(items, list) or not items or any(i.get('passed') is not True for i in items)
                or manifest.get('assertions') != len(items)
                or manifest.get('identity') != packet['build']['identity']
                or {k: manifest.get(k) for k in ('command', 'environment')} != contract['native'][name]):
            raise ValueError('native evidence failed, was skipped or belongs to another workload/build')
        return {'assertions': len(items)}
    if kind == 'paired':
        manifest, completion = read(raw / 'manifest.json'), read(raw / 'completion.json')
        protocol = contract['paired_protocols'][name]
        builds = manifest.get('arm_builds', {})
        if (receipt.get('exit_code') not in (0, 1) or manifest.get('protocol') != protocol
                or set(builds) != {'reference', 'combined'}
                or any(v != packet['build'] for v in builds.values())
                or completion.get('interrupted') is not False or completion.get('stopped_early') is not False
                or 'error' in completion or completion.get('planned_cells') != 32 or completion.get('recorded_cells') != 32):
            raise ValueError('paired study incomplete or belongs to another build/workload')
        rows = [json.loads(line) for line in (raw / 'results.jsonl').read_text().splitlines()]
        if len(rows) != 32 or {(r['round'], r['arm']) for r in rows} != {
                (number, arm) for number in range(1, 17) for arm in ('reference', 'combined')}:
            raise ValueError('missing or repeated paired cells')
        warmups = {(r['round'], r['arm']): read(raw / f"{r['round']}-{r['arm']}/warmup.json") for r in rows}
        soak.validate_paired_execution(name, protocol, rows, warmups)
        summary = bench.summaries(rows, 'reference', protocol.get('comparison_basis', 'fixed-pool'), protocol.get('required_equal_work'))
        accepted = bench.acceptance_results(summary, protocol['acceptance'])
        startup = bench.startup_acceptance_results(rows, 'reference', protocol['startup_acceptance'])
        if (not accepted or not startup or any(r.get('passed') is not True for r in accepted + startup)
                or accepted != completion.get('acceptance') or startup != completion.get('startup_acceptance')):
            raise ValueError('paired request or startup acceptance failed')
        return {'cells': len(rows), 'acceptance': accepted, 'startup_acceptance': startup}
    protocol = prerequisite_protocol(directory, contract, paired=True, mode=name)
    soak.validate_prerequisites(protocol, packet['build'])
    manifest = read(raw / 'manifest.json')
    rows = [json.loads(line) for line in (raw / 'results.jsonl').read_text().splitlines()]
    assessment = soak.assess(protocol, rows)
    if (receipt.get('exit_code') != 0 or manifest.get('protocol') != protocol
            or manifest.get('build') != packet['build'] or manifest.get('passed') is not True
            or 'error' in manifest or assessment.get('passed') is not True
            or assessment != read(raw / 'assessment.json')):
        raise ValueError('lifetime qualification failed or belongs to another build/workload')
    return {'requests': len(rows)}


def status(directory):
    directory, packet, contract = load_packet(directory)
    rows = []
    for stage in STAGES:
        target = directory / stage
        row = {'stage': stage, 'status': 'unrun'}
        if target.exists():
            try:
                row.update(assess_stage(directory, packet, contract, stage), status='passed')
            except (OSError, ValueError, KeyError, TypeError) as error:
                row.update(status='incomplete_or_failed', error=str(error))
        rows.append(row)
    return {'scope': packet['scope'], 'stages': rows,
            'qualification_complete': all(r['status'] == 'passed' for r in rows), 'activation_performed': False}


def run_native(target, specification, build):
    target.mkdir()
    manifest = {'identity': build['identity'], **specification, 'passed': False}
    def snapshot():
        state = vm_snapshot()
        require_normal(pressure_snapshot())
        return state
    try:
        with (target / 'stdout.txt').open('w') as out, (target / 'stderr.txt').open('w') as err:
            process = guarded_run(specification['command'], cwd=ROOT, stdout=out, stderr=err,
                record_path=target / 'memory.json', snapshot=snapshot, policy=NATIVE_POLICY,
                classification='Native correctness only; VM activity is recorded, never performance/resource qualification')
        manifest['exit_code'] = process.returncode
        report = read(target / 'stdout.txt')
        manifest['assertions'] = len(report.get('items', []))
        manifest['passed'] = (process.returncode == 0 and report.get('passed') is True
            and report.get('skipped') is None and manifest['assertions'] > 0
            and all(i.get('passed') is True for i in report['items']))
        return process.returncode
    finally:
        write_new(target / 'manifest.json', manifest)


def run_one(directory):
    directory, packet, contract = load_packet(directory)
    with (directory / '.run.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        current = status(directory)
        pending = next((r for r in current['stages'] if r['status'] != 'passed'), None)
        if pending is None:
            return current
        if pending['status'] != 'unrun':
            raise ValueError('an attempted stage is incomplete or failed; preserved evidence cannot be retried in this campaign')
        stage = pending['stage']
        kind, name = stage.split('/')
        if kind != 'native':
            prerequisites = prerequisite_protocol(directory, contract, paired=kind == 'soak', mode=name if kind == 'soak' else 'off')
            soak.validate_prerequisites(prerequisites, packet['build'], native_only=kind == 'paired')
        # Refuse before claiming a stage or creating a model process. A later
        # readiness check is not a replacement measurement cell.
        if bench.competing_jobs():
            raise RuntimeError('competing storage/build work; no stage launched')
        require_normal(pressure_snapshot())
        before = preflight(13)
        target = directory / stage
        target.mkdir(parents=True, exist_ok=False)
        write_new(target / 'attempt.json', {'stage': stage, 'contract_sha256': packet['contract_sha256'], 'before': before})
        print(json.dumps({'starting': stage}), flush=True)
        receipt = {'cleanup_complete': False}
        start = time.monotonic()
        saved = {k: v for k, v in os.environ.items() if k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        for key in saved:
            os.environ.pop(key)
        try:
            if kind == 'native':
                os.environ.update(contract['native'][name]['environment'])
                receipt['exit_code'] = run_native(target / 'evidence', contract['native'][name], packet['build'])
            else:
                protocol = contract['paired_protocols'][name] if kind == 'paired' else prerequisites
                write_new(target / 'execution-protocol.json', protocol)
                driver = 'serve_bench.py' if kind == 'paired' else 'optimization_soak.py'
                command = [sys.executable, str(ROOT / 'Tools' / driver), '--protocol',
                           str(target / 'execution-protocol.json'), '--out', str(target / 'evidence')]
                # Includes all original bounded reservation waits, cooldowns,
                # startup and two request timeouts for every fixed cell.
                timeout = 100_000 if kind == 'paired' else 960
                policy = dict(NATIVE_POLICY, maximum_build_seconds=timeout)
                def snapshot():
                    state = vm_snapshot()
                    require_normal(pressure_snapshot())
                    return state
                with (target / 'stdout.txt').open('w') as out, (target / 'stderr.txt').open('w') as err:
                    process = guarded_run(command, cwd=ROOT, stdout=out, stderr=err,
                        record_path=target / 'ownership-memory.json', snapshot=snapshot, policy=policy,
                        classification='Campaign ownership/memory guard; original per-cell correctness, resource and timing gates remain mandatory')
                receipt['exit_code'] = process.returncode
        except BaseException as error:
            receipt['error'] = f'{type(error).__name__}: {error}'
        finally:
            for key in list(os.environ):
                if key.startswith(('SLOTSTREAM_', 'SS_DEBUG')):
                    os.environ.pop(key)
            os.environ.update(saved)
            receipt['elapsed_seconds'] = time.monotonic() - start
            try:
                receipt['after'] = preflight(0)
                receipt['remaining_jobs'] = bench.competing_jobs()
                receipt['cleanup_complete'] = not receipt['remaining_jobs']
                load_packet(directory)
                receipt['artifact_sha256'] = artifact_hashes(target / 'evidence')
            except BaseException as error:
                receipt['cleanup_error'] = f'{type(error).__name__}: {error}'
                receipt['cleanup_complete'] = False
            write_new(target / 'receipt.json', receipt)
        result = assess_stage(directory, packet, contract, stage)
        return {'stage': stage, 'passed': True, 'result': result, 'activation_performed': False}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    commands = parser.add_subparsers(dest='command', required=True)
    prepare_parser = commands.add_parser('prepare', help='Freeze a complete contract without running a model')
    prepare_parser.add_argument('--binary', type=Path, required=True)
    prepare_parser.add_argument('--model', type=Path, required=True)
    prepare_parser.add_argument('--out', type=Path, required=True)
    for name in ('status', 'run-one'):
        sub = commands.add_parser(name)
        sub.add_argument('--packet', type=Path, required=True)
    args = parser.parse_args()
    def interrupted(number, _frame):
        raise KeyboardInterrupt(f'campaign interrupted by signal {number}')
    signal.signal(signal.SIGTERM, interrupted)
    try:
        result = (prepare(args.binary, args.model, args.out) if args.command == 'prepare'
                  else status(args.packet) if args.command == 'status' else run_one(args.packet))
        print(json.dumps(result, indent=2), flush=True)
        return 0
    except (Exception, KeyboardInterrupt) as error:
        print(json.dumps({'passed': False, 'error': f'{type(error).__name__}: {error}'}), flush=True)
        return 1


if __name__ == '__main__':
    raise SystemExit(main())
