#!/usr/bin/env python3
"""Complete paired product fixtures with a prospectively frozen protocol.

These image and synthetic long-conversation fixtures complement the independent
held-out task study. They provide no statistical noninferiority verdict. Each
arm owns one bounded native process per conversation. A launched job is never
replaced, and any incomplete execution prevents a successful final analysis.
"""
import argparse
import fcntl
import json
import math
from pathlib import Path
import re
import stat
import sys
import time

import quantization_image_outcomes as images
import quantization_long_context as long_context
import quantization_outcome_campaign as campaign
from quantization_inventory import relative_path
from vq_dense_overlay import read_json

ACCEPTANCE = 'all-candidate-turns-correct-v1'
FAMILIES = {'image': images, 'long_context': long_context}


def native_pins(family):
    """Only the original and selected minmax control belong to this study."""
    revision = 'aa7c790e804bbf9d491ddb109c3d61bc4a555f7c'
    return {'original': {'baseline_revision': revision, 'resource_identity': 'original-affine4-memory-v1',
                         'model': 'qwen3.8-flash-next:4bit',
                         'manifest_sha256': '8e10fef2cfa5c6d8590494f5dbed440a7617a404fa17ce169cf55fb99b71e082'},
            'candidate': {'baseline_revision': revision,
                          'resource_identity': 'affine3-grouped-vision-memory-v1' if family == 'image' else 'affine3-grouped-memory-v1',
                          'model': 'qwen3.8-flash-next:affine3-control',
                          'control_manifest_sha256': 'af31bd191fbd82dc998fe29cae230c7f3e6977bd355c827bf42e643b7680f182',
                          'control_policy': 'pinned-affine4-to-affine3-group64-experts-only-v1',
                          'rotary_sha256': 'f077c4de8473b644afae5b9f939ddb2e70dcdfd876ad3e04d79f05018f133d9a'}}


def helper_pins():
    """Bind imported repository dependencies, including transitive graders.

    Standard-library modules live outside this root. Test entry points are not
    execution dependencies. A frozen copy retains the same module identities.
    """
    root = Path(__file__).resolve().parent
    result = {}
    for name, module in list(sys.modules.items()):
        path = getattr(module, '__file__', None)
        if not path: continue
        path = Path(path).resolve()
        if (path == Path(__file__).resolve() or path.suffix != '.py' or path.name.endswith('_test.py')
                or root not in path.parents): continue
        result[name] = campaign.digest(path)
    return result


def validate(protocol, root):
    root = Path(root)
    if (protocol['schema'] != 1 or protocol['kind'] != 'quantization-product-outcomes-v1'
            or protocol['family'] not in FAMILIES or protocol['acceptance'] != ACCEPTANCE
            or protocol['driver_sha256'] != campaign.digest(__file__)):
        raise ValueError('unknown product protocol, acceptance rule or driver')
    paths, files = protocol['paths'], protocol['files']
    if type(files) is not dict or not 1 <= len(files) <= 512:
        raise ValueError('bounded pinned product inputs required')
    input_bytes = 0
    for path, digest in files.items():
        relative_path(path)
        info = (root / path).lstat()
        input_bytes += info.st_size
        if (not stat.S_ISREG(info.st_mode) or not 0 < info.st_size or input_bytes > 1_000_000_000
                or type(digest) is not str or re.fullmatch('[a-f0-9]{64}', digest) is None):
            raise ValueError('product input type, digest or aggregate byte bound changed')
    for path, digest in files.items():
        if campaign.digest(root / path) != digest:
            raise ValueError('frozen product input changed: ' + path)
    for key in ('cases', 'native_protocol', 'binary', 'metallib', 'rotary'):
        relative_path(paths[key])
        if paths[key] not in files: raise ValueError('unpinned required product input: ' + key)
    if (Path(paths['binary']).parent != Path(paths['metallib']).parent
            or Path(paths['metallib']).name != 'mlx.metallib'):
        raise ValueError('the native binary must use its pinned colocated Metal library')
    relative_path(paths['control'])
    if paths['control'] + '/manifest.json' not in files:
        raise ValueError('unpinned expert artifact')
    if not Path(paths['baseline']).expanduser().is_absolute():
        raise ValueError('original model path must be explicit')
    # Bound the actual imported graders and session owner as well as this
    # driver. Frozen copies may live elsewhere, but their bytes must agree.
    if protocol['helper_sha256'] != helper_pins():
        raise ValueError('imported product helper closure changed')
    native = read_json(root / paths['native_protocol'], protocol['native_protocol_sha256'], limit=64_000)
    is_image = protocol['family'] == 'image'
    expected = {'schema': 1, 'kind': 'quantization-image-session-v1' if is_image else 'quantization-tool-session-v2',
                'scope': 'instrument-check', 'memory_bytes': 14_500_000_000 if is_image else 14_000_000_000,
                'context_limit': 32768, 'draft_depth': 2, 'prefix_cache': True,
                'maximum_requests': 4, 'maximum_seconds': 1800, 'seed': 7}
    if (set(native) != set(expected) | {'output_limit'} or type(native['output_limit']) is not int
            or native['output_limit'] not in (128, 512)
            or any(type(native[key]) is not type(value) or native[key] != value for key, value in expected.items())
            or files[paths['native_protocol']] != protocol['native_protocol_sha256']):
        raise ValueError('product native configuration differs from its priced scope')
    cases = read_json(root / paths['cases'], files[paths['cases']], limit=8_000_000)
    if type(cases) is not list or not 1 <= len(cases) <= 16:
        raise ValueError('bounded product conversations required')
    for case in cases:
        if case['family'] != protocol['family']: raise ValueError('mixed product family')
        if is_image: images.validate(case)
        elif case != long_context.make_case(case['seed'], case['record_count'], case['target_position']):
            raise ValueError('long conversation differs from its deterministic source')
    ids = [case['id'] for case in cases]
    if len(set(ids)) != len(ids) or ids != protocol['case_ids']:
        raise ValueError('product case coverage or order changed')
    resource = protocol['resource']
    integer_bounds = {'maximum_parent_bytes': (1, 256_000_000),
                      'maximum_campaign_seconds': (1, 43_200),
                      'maximum_output_bytes': (1, 512_000_000),
                      'maximum_research_staging_bytes': (1, 430_000_000_000)}
    for key, (minimum, maximum) in integer_bounds.items():
        if type(resource[key]) is not int or not minimum <= resource[key] <= maximum:
            raise ValueError('unpriced product resource bound: ' + key)
    if (resource['preflight_gb'] != (20.5 if is_image else 17)
            or resource['headroom_bytes'] != 3_000_000_000
            or resource['maximum_model_sessions'] != 2 * len(cases)
            or any(type(resource[key]) is not int or resource[key] != 0
                   for key in ('new_weight_bytes', 'new_raw_logit_bytes', 'paid_compute_usd'))):
        raise ValueError('product run exceeds its explicit resource envelope')
    if protocol['native_pins'] != native_pins(protocol['family']):
        raise ValueError('the exact original and minmax artifact identities are required')
    candidate = protocol['native_pins']['candidate']
    if candidate.get('control_manifest_sha256') != files[paths['control'] + '/manifest.json']:
        raise ValueError('candidate manifest differs from the frozen source')
    if candidate.get('rotary_sha256') != files[paths['rotary']]:
        raise ValueError('candidate coefficients differ from the frozen source')
    return native, cases


def arms(index):
    return ['original', 'candidate'] if index % 2 == 0 else ['candidate', 'original']


def previous_jobs(output, index, protocol_sha):
    previous = []
    for number in range(index):
        value = campaign.read(Path(output) / f'job-{number:04d}' / 'receipt.json')
        seconds = value.get('seconds')
        if (value.get('complete') is not True or value.get('protocol_sha256') != protocol_sha or value.get('index') != number
                or type(seconds) not in (int, float) or not math.isfinite(seconds) or seconds < 0):
            raise ValueError('prior product job is incomplete or uses another protocol')
        previous.append(value)
    return previous


def run_job(protocol_path, protocol_sha, root, output, index):
    root, output = Path(root), Path(output)
    protocol = read_json(Path(protocol_path), protocol_sha)
    native, cases = validate(protocol, root)
    if type(index) is not int or not 0 <= index < len(cases):
        raise ValueError('product job outside frozen case selection')
    output.mkdir(parents=True, exist_ok=True)
    with (output / 'campaign.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        previous = previous_jobs(output, index, protocol_sha)
        spent = sum(row['seconds'] for row in previous)
        destination = output / f'job-{index:04d}'; destination.mkdir(exist_ok=False)
        started = time.monotonic(); session = None
        result = {'schema': 1, 'complete': False, 'qualification': False, 'protocol_sha256': protocol_sha,
                  'driver_sha256': campaign.digest(__file__), 'family': protocol['family'], 'index': index,
                  'case_id': cases[index]['id'], 'sessions': [], 'outcomes': []}

        def save():
            result['seconds'] = time.monotonic() - started
            campaign.write(destination / 'receipt.json', result)

        def budget():
            if spent + time.monotonic() - started > protocol['resource']['maximum_campaign_seconds']:
                raise TimeoutError('product campaign deadline')
            if campaign.allocated(output) > protocol['resource']['maximum_output_bytes']:
                raise RuntimeError('product output reservation exhausted')
            if campaign.allocated(root) > protocol['resource']['maximum_research_staging_bytes']:
                raise RuntimeError('total research staging reservation exhausted')

        try:
            save(); budget()
            for arm in arms(index):
                budget()
                row = {'arm': arm, 'complete': False}; result['sessions'].append(row); save()
                local = destination / arm; paths = protocol['paths']
                command = [str(root / paths['binary']), 'quantization-session', '--baseline',
                           str(Path(paths['baseline']).expanduser()), '--protocol-file',
                           str(root / paths['native_protocol']), '--protocol-sha256', protocol['native_protocol_sha256'],
                           '--output', str(local)]
                if arm == 'candidate': command += ['--control', str(root / paths['control']), '--table', str(root / paths['rotary'])]
                session = campaign.Session(command, local, native, protocol, arm, row,
                    campaign_deadline=started + protocol['resource']['maximum_campaign_seconds'] - spent,
                    output_root=output)
                save(); session.reset()
                outcome = FAMILIES[protocol['family']].run_case(session, cases[index])
                if type(outcome.get('passed')) is not bool: raise ValueError('nonbinary complete product outcome')
                result['outcomes'].append({'arm': arm, **outcome}); save()
                session.finish(); session.close(); session = None; save()
            budget(); validate(protocol, root)
            result['complete'] = True; save()
        except BaseException as error:
            result['failure'] = type(error).__name__ + ': ' + str(error)
            try:
                if session is not None: session.close()
            finally: save()
            raise
        return result


def analyze(protocol_path, protocol_sha, root, output):
    protocol = read_json(Path(protocol_path), protocol_sha)
    native, cases = validate(protocol, root)
    rows = previous_jobs(output, len(cases), protocol_sha)
    if sum(row['seconds'] for row in rows) > protocol['resource']['maximum_campaign_seconds']:
        raise ValueError('complete product receipts exceed the frozen elapsed-time budget')
    pairs = []
    for index, (case, row) in enumerate(zip(cases, rows)):
        if (row.get('case_id') != case['id'] or row.get('family') != protocol['family']
                or row.get('driver_sha256') != protocol['driver_sha256']
                or [x.get('arm') for x in row['outcomes']] != arms(index)
                or [x.get('arm') for x in row['sessions']] != arms(index)
                or any(x.get('complete') is not True or 'cleanup_failure' in x for x in row['sessions'])):
            raise ValueError('product pair has incomplete identity, coverage or execution')
        for session in row['sessions']:
            campaign.validate_native(session['receipt'], native, protocol['native_pins'], session['arm'],
                                     protocol['native_protocol_sha256'])
        outcomes = {value['arm']: value for value in row['outcomes']}
        for value in outcomes.values():
            if type(value['passed']) is not bool: raise ValueError('nonbinary product receipt')
            if value['passed'] and (len(value['turns']) != len(case['turns']) or 'refusal' in value
                                    or any(turn.get('passed') is not True for turn in value['turns'])):
                raise ValueError('a partial conversation cannot be a successful outcome')
            for result, turn in zip(value['turns'], case['turns']):
                correct = (images.grade(result['response'], turn['answer']) if protocol['family'] == 'image'
                           else long_context.grade_record(result['response'], turn['expected']))
                if result.get('passed') is not correct:
                    raise ValueError('recorded product grade differs from complete response')
            session = next(item for item in row['sessions'] if item['arm'] == value['arm'])
            receipt = session['receipt']
            refused = int('refusal' in value)
            if (any(type(receipt.get(key)) is not int for key in ('resets', 'requests', 'admission_refusals'))
                    or receipt.get('complete') is not True or receipt.get('resets') != 1
                    or receipt.get('requests') != len(value['turns']) + refused
                    or receipt.get('admission_refusals') != refused):
                raise ValueError('native product completion counters differ from the conversation')
        pairs.append({'id': case['id'], 'original_pass': outcomes['original']['passed'],
                      'candidate_pass': outcomes['candidate']['passed']})
    return {'schema': 1, 'complete': True, 'qualification': False,
            'scope': 'Complete product fixtures only; no statistical noninferiority or speed verdict',
            'protocol_sha256': protocol_sha, 'acceptance': ACCEPTANCE,
            'passed': all(row['candidate_pass'] for row in pairs), 'pairs': pairs,
            'regressions': [row['id'] for row in pairs if row['original_pass'] and not row['candidate_pass']]}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action', choices=('run-job', 'analyze'))
    parser.add_argument('--protocol', required=True); parser.add_argument('--protocol-sha256', required=True)
    parser.add_argument('--root', required=True); parser.add_argument('--output', required=True)
    parser.add_argument('--job', type=int)
    args = parser.parse_args()
    if args.action == 'run-job':
        if args.job is None: parser.error('--job is required for run-job')
        value = run_job(args.protocol, args.protocol_sha256, args.root, args.output, args.job)
        print(json.dumps({key: value[key] for key in ('complete', 'qualification', 'index', 'case_id')}))
    else:
        if args.job is not None: parser.error('--job applies only to run-job')
        print(json.dumps(analyze(args.protocol, args.protocol_sha256, args.root, args.output), indent=2))


if __name__ == '__main__':
    main()
