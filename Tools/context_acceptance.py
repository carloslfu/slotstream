#!/usr/bin/env python3
"""Model-free context acceptance and a portable, separately bound hardware campaign.

proxy runs only inert process/transport fixtures and isolated Swift policy.
prepare snapshots this working source and all test drivers without a model.
bind performs metadata/plan-only checks on the future target, never inference.
run-capacity is the explicit native resource/capacity operation on that target.
"""
import argparse
import ast
import hashlib
import io
import json
import os
from pathlib import Path
import platform
import re
import subprocess
import sys
import tarfile

import build_identity
import context_proxy
import context_qualification as capacity
import context_resource_gates as resources

ROOT = Path(__file__).resolve().parent.parent
CATALOG = ROOT / 'Tools/fixtures/context-acceptance-v1.json'
SUITES = ['context_contracts_test', 'context_qualification_checks', 'context_acceptance_test',
          'api_generation_test', 'e2e_release_test', 'consumer_smoke_test',
          'vision_capacity_gate_test', 'process_cleanup_checks', 'build_identity_test']


def write(path, value):
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + '\n')


def source_files():
    # Keep executable closure in the snapshot, including native headers and
    # image/parity fixtures, but never compiler caches, weights or local venvs.
    files = set(build_identity.source_files(ROOT))
    for folder in ('Tools', 'bench/parity31', '.github/workflows', '.githooks'):
        for p in (ROOT / folder).rglob('*'):
            if p.is_symlink():
                raise ValueError('handoff requires explicit symlink dependencies: ' + str(p.relative_to(ROOT)))
            if p.is_file() and '__pycache__' not in p.parts and p.suffix != '.pyc' and 'lib' not in p.relative_to(ROOT).parts:
                files.add(p)
    files.add(CATALOG)
    for name in ('install.sh', 'Tools/context_proxy.swift', 'db/records/plan/configurable-context-window-2026-09-06.md'):
        files.add(ROOT / name)
    return sorted(files)


def source_identity():
    return {str(p.relative_to(ROOT)): capacity.digest(p) for p in source_files()}


def proxy_identity():
    """Hash actual policy and recursively imported local fixture dependencies."""
    result = context_proxy.selected_sources()
    pending = [ROOT / 'Tools' / (name + '.py') for name in SUITES + ['context_acceptance', 'context_proxy']]
    seen = set()
    while pending:
        path = pending.pop()
        if path in seen:
            continue
        seen.add(path)
        result[str(path.relative_to(ROOT))] = capacity.digest(path)
        for node in ast.walk(ast.parse(path.read_text())):
            modules = [alias.name for alias in node.names] if isinstance(node, ast.Import) else (
                [node.module] if isinstance(node, ast.ImportFrom) and node.module else [])
            for module in modules:
                local = ROOT / 'Tools' / (module.split('.')[0] + '.py')
                if local.is_file(): pending.append(local)
    for name in ('api_robustness.sh', 'e2e_release.sh', 'consumer_smoke.sh'):
        result['Tools/' + name] = capacity.digest(ROOT / 'Tools' / name)
    result[str(CATALOG.relative_to(ROOT))] = capacity.digest(CATALOG)
    return dict(sorted(result.items()))


def catalog():
    value = json.loads(CATALOG.read_text())
    ids = [row['id'] for row in value['cases']]
    if value.get('schema') != 1 or ids != [f'C{n:02}' for n in range(1, 23)]:
        raise ValueError('acceptance catalogue must preserve every C01-C22 case exactly once')
    allowed = set(SUITES) | {'swift_policy'}
    for row in value['cases']:
        if not row['deferred_native'] or not set(row['proxy_suites']) <= allowed:
            raise ValueError('missing native scope or unknown proxy suite for ' + row['id'])
    return value


def proxy(out):
    out.mkdir(parents=True, exist_ok=False)
    plan = catalog()
    before = proxy_identity()
    report = {'kind': 'context-software-proxy', 'passed': False, 'hardware_qualified': False,
              'release_qualified': False, 'model_loaded': False, 'suites': [], 'source_sha256': before}
    try:
        for name in SUITES:
            cell = out / name
            cell.mkdir()
            command = [sys.executable, '-m', 'unittest', 'discover', '-s', 'Tools', '-p', name + '.py', '-v']
            env = {k: v for k, v in os.environ.items() if not k.startswith('SLOTSTREAM_')}
            result = subprocess.run(command, cwd=ROOT, env=env, capture_output=True, text=True, timeout=180)
            (cell / 'stdout.txt').write_text(result.stdout)
            (cell / 'stderr.txt').write_text(result.stderr)
            count = re.search(r'^Ran (\d+) tests? in ', result.stderr, re.M)
            ok = result.returncode == 0 and count is not None and int(count.group(1)) > 0 and '\nOK' in result.stderr
            row = {'name': name, 'passed': ok, 'exit_code': result.returncode,
                   'tests': int(count.group(1)) if count else 0}
            report['suites'].append(row)
            print(json.dumps(row), flush=True)
        swift = context_proxy.run(out / 'swift_policy')
        report['suites'].append({'name': 'swift_policy', 'passed': swift['passed'],
                                 'contracts': swift.get('contracts'), 'failures': swift['failures']})
        results = {row['name']: row['passed'] for row in report['suites']}
        report['cases'] = [{**row, 'proxy_passed': bool(row['proxy_suites']) and all(results[name] for name in row['proxy_suites']),
                            'native_status': 'deferred_by_user'} for row in plan['cases']]
        if before != proxy_identity():
            raise ValueError('source or driver changed during acceptance; rerun the affected software checks')
        report['passed'] = all(results.values())
    except Exception as error:
        report['error'] = f'{type(error).__name__}: {error}'
    write(out / 'report.json', report)
    return report


def prepare(out):
    out.mkdir(parents=True, exist_ok=False)
    plan = catalog()
    sources = source_identity()
    with tarfile.open(out / 'source.tar.gz', 'w:gz') as tar:
        for name, digest in sources.items():
            p = ROOT / name
            data = p.read_bytes()
            if hashlib.sha256(data).hexdigest() != digest:
                raise ValueError('source changed during handoff capture')
            info = tar.gettarinfo(str(p), arcname=name)
            info.uid = info.gid = 0
            info.uname = info.gname = ''
            tar.addfile(info, io.BytesIO(data))
    if sources != source_identity():
        raise ValueError('source changed during handoff capture')
    result = {'schema': 1, 'kind': 'context-target-handoff', 'state': 'prepared_unrun',
              'source_sha256': sources, 'source_archive_sha256': capacity.digest(out / 'source.tar.gz'),
              'build_source': {str(p.relative_to(ROOT)): capacity.digest(p) for p in build_identity.source_files(ROOT)},
              'acceptance': plan, 'hardware_qualified': False, 'release_qualified': False}
    write(out / 'handoff.json', result)
    return result


def check_handoff(handoff):
    if handoff.get('schema') != 1 or handoff.get('kind') != 'context-target-handoff':
        raise ValueError('unknown handoff')
    if handoff['source_sha256'] != source_identity() or handoff['acceptance'] != catalog():
        raise ValueError('working source differs from handoff; prepare a new identified successor')
    expected = {str(p.relative_to(ROOT)): capacity.digest(p) for p in build_identity.source_files(ROOT)}
    if handoff.get('build_source') != expected:
        raise ValueError('build source differs from the captured handoff')


def bind(handoff, binary, model, out):
    check_handoff(handoff)
    binary, model = binary.resolve(), model.resolve()
    identity = json.loads((binary.parent / 'build-identity.json').read_text())
    if identity['source'] != handoff['build_source']:
        raise ValueError('candidate was not built from the handoff source; old candidates cannot certify new code')
    for file, key in [(binary, 'binary_sha256'), (binary.parent / 'mlx.metallib', 'metallib_sha256'),
                      (binary.parent / 'build-source.tar.gz', 'source_archive_sha256')]:
        if capacity.digest(file) != identity[key]:
            raise ValueError('candidate bytes differ from build identity: ' + key)
    # Check every archived source byte, not only the manifest assertion.
    with tarfile.open(binary.parent / 'build-source.tar.gz', 'r:gz') as tar:
        members = tar.getmembers()
        if len(members) != len(identity['source']) or {m.name for m in members} != set(identity['source']):
            raise ValueError('build archive source closure differs from the candidate identity')
        for member in members:
            if not member.isfile() or hashlib.sha256(tar.extractfile(member).read()).hexdigest() != identity['source'][member.name]:
                raise ValueError('build archive contains invalid source bytes')
        pinned = tar.extractfile('Sources/Slotstream/PinnedModel.swift').read()
    revision = re.search(rb'public static let revision = "([a-f0-9]+)"', pinned).group(1).decode()
    observed = capacity.observed_model(model)
    out.mkdir(parents=True, exist_ok=False)
    profiles = []
    for item in handoff['acceptance']['capacity_profiles']:
        protocol = {**{key: identity[key] for key in ('binary_sha256', 'metallib_sha256', 'source_archive_sha256')},
            'schema': 1, 'kind': 'configurable-context-retained-capacity' if item['retained'] else 'configurable-context-capacity',
            'binary': str(binary), 'model_dir': str(model), 'model_revision': revision,
            'model_manifest_sha256': hashlib.sha256(pinned).hexdigest(), 'model_identity': observed,
            'memory_gb': item['memory_gb'], 'prompt_tokens': [n - 16 for n in item['totals']],
            'reply_tokens': 16, 'wall_seconds': item['wall_seconds'], 'mtp': 'off', 'vision': 'off',
            'prefix_cache': item['retained'], 'max_prefill_wait_minutes': 0,
            'driver_sources': {name: capacity.digest(ROOT / name) for name in capacity.DRIVERS}}
        if item['retained']:
            protocol.update(warm_conversations=4, warm_tokens=item['warm_tokens'])
        env = {k: v for k, v in os.environ.items() if not k.startswith('SLOTSTREAM_')}
        env['SLOTSTREAM_PREFIX_CACHE'] = '1' if item['retained'] else '0'
        # Uses the actual planner and pinned headers only; never constructs Engine.
        args = [str(binary), 'context-check', '--tokens', str(protocol['prompt_tokens'][-1]), '--reply-tokens', '16',
                '--memory-gb', str(item['memory_gb']), '--mtp', 'off', '--vision', 'off', '--max-prefill-wait', '0',
                '--model', str(model), '--plan-only']
        if item['retained']:
            args += ['--warm-conversations', '4', '--warm-tokens', str(item['warm_tokens'])]
        planned = subprocess.run(args, env=env, capture_output=True, text=True, timeout=120)
        (out / (item['name'] + '.plan.stdout.json')).write_text(planned.stdout)
        (out / (item['name'] + '.plan.stderr.txt')).write_text(planned.stderr)
        value = json.loads(planned.stdout)
        if (planned.returncode or value.get('kind') != 'unqualified-context-plan' or value.get('qualified') is not False
                or 'fits' in value or value.get('model_revision') != revision
                or value.get('plan', {}).get('max_context_tokens') != item['totals'][-1]
                or value.get('warm_conversations') != (4 if item['retained'] else 0)
                or (item['retained'] and value.get('warm_tokens') != item['warm_tokens'])
                or value.get('plan', {}).get('runtime_prefix_cache_enabled') is not item['retained']):
            raise ValueError('plan-only did not resolve the exact requested candidate window')
        protocol['optimizations'] = value['optimizations']
        capacity.validate(protocol)
        write(out / (item['name'] + '.json'), protocol)
        profiles.append({'name': item['name'], 'protocol': protocol})
    result = {'schema': 1, 'kind': 'context-bound-campaign', 'state': 'bound_unrun',
              'handoff': handoff, 'profiles': profiles, 'hardware_qualified': False, 'release_qualified': False}
    write(out / 'binding.json', result)
    return result


def validate_binding(binding):
    if binding.get('schema') != 1 or binding.get('kind') != 'context-bound-campaign':
        raise ValueError('unknown bound campaign')
    check_handoff(binding['handoff'])
    expected = binding['handoff']['acceptance']['capacity_profiles']
    profiles = binding['profiles']
    if len(profiles) != len(expected):
        raise ValueError('capacity campaign cannot omit a profile')
    common = ('binary', 'binary_sha256', 'metallib_sha256', 'source_archive_sha256',
              'model_dir', 'model_revision', 'model_manifest_sha256', 'model_identity', 'driver_sources')
    first = profiles[0]['protocol']
    identity = json.loads((Path(first['binary']).parent / 'build-identity.json').read_text())
    if identity['source'] != binding['handoff']['build_source']:
        raise ValueError('bound candidate differs from the handoff source')
    for row, frozen in zip(profiles, expected):
        p = row['protocol']
        if (row['name'] != frozen['name'] or p['memory_gb'] != frozen['memory_gb']
                or [n + p['reply_tokens'] for n in p['prompt_tokens']] != frozen['totals']
                or p['reply_tokens'] != 16 or p['wall_seconds'] != frozen['wall_seconds']
                or p['prefix_cache'] is not frozen['retained']
                or p.get('warm_tokens') != frozen.get('warm_tokens')
                or any(p[key] != first[key] for key in common)):
            raise ValueError('capacity profile differs from frozen campaign')
        capacity.validate(p)
    return profiles


def run_capacity(binding, out, *, execute_on_target=False):
    if not execute_on_target or platform.system() != 'Darwin':
        raise ValueError('native campaign requires --execute-on-target on the intended Mac; proxy/prepare never launch it')
    profiles = validate_binding(binding)
    out.mkdir(parents=True, exist_ok=False)
    result = {'kind': 'context-native-capacity-campaign', 'passed': False, 'hardware_qualified': False,
              'release_qualified': False, 'profiles': []}
    try:
        p = profiles[0]['protocol']
        result['resources'] = resources.run(Path(p['binary']), Path(p['model_dir']),
            ROOT / 'Tools/assets/vision_test/secret1.jpg', out / 'resources')
        if result['resources']['passed'] is not True:
            raise ValueError('required resource gates did not pass; capacity not launched')
        for row in profiles:
            validate_binding(binding)
            code = capacity.run(row['protocol'], out / row['name'])
            result['profiles'].append({'name': row['name'], 'passed': code == 0})
            if code:
                raise ValueError('first failed capacity profile: ' + row['name'])
        result['passed'] = True
        # This campaign proves capacity only. Numerical/consumer/release gates
        # remain independent, including activation of a new public limit.
        result['capacity_qualified'] = True
    except Exception as error:
        result['error'] = f'{type(error).__name__}: {error}'
    finally:
        write(out / 'report.json', result)
    return result


def main():
    p = argparse.ArgumentParser(description=__doc__)
    sub = p.add_subparsers(dest='mode', required=True)
    for mode in ('proxy', 'prepare', 'bind', 'run-capacity'):
        cmd = sub.add_parser(mode)
        cmd.add_argument('--out', type=Path, required=True)
        if mode == 'bind':
            cmd.add_argument('--handoff', type=Path, required=True)
            cmd.add_argument('--binary', type=Path, required=True)
            cmd.add_argument('--model', type=Path, required=True)
        if mode == 'run-capacity':
            cmd.add_argument('--binding', type=Path, required=True)
            cmd.add_argument('--execute-on-target', action='store_true')
    a = p.parse_args()
    try:
        if a.mode == 'proxy': result = proxy(a.out)
        elif a.mode == 'prepare': result = prepare(a.out)
        elif a.mode == 'bind': result = bind(json.loads(a.handoff.read_text()), a.binary, a.model, a.out)
        else: result = run_capacity(json.loads(a.binding.read_text()), a.out, execute_on_target=a.execute_on_target)
        print(json.dumps({key: result[key] for key in ('kind', 'passed', 'state', 'error', 'hardware_qualified', 'release_qualified') if key in result}))
        return 0 if result.get('passed', True) else 1
    except Exception as error:
        print(json.dumps({'passed': False, 'error': f'{type(error).__name__}: {error}'}))
        return 1


if __name__ == '__main__':
    raise SystemExit(main())
