#!/usr/bin/env python3
"""Execute one prospectively frozen complete export inside its whole budget.

This owns the existing model/verification exclusion lock for the entire copy
and independent audit. It never deletes a source, retries an output, installs
weights or grants native/product admission. The protocol must be frozen after
any explicit cleanup has made room for the complete output reservation.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import time

from affine_standalone_export import prepare
from context_qualification import quiet_preflight, verification_lock
from prefill_bench import vm_snapshot
from quantization_inventory import relative_path
from standalone_bundle import encoded, export, valid_name
from vq_dense_overlay import read_json
from vq_model_reference import physical

MAX_OUTPUT = 90_236_537_746
RECEIPT_RESERVATION = 1_000_000


def digest(path):
    result = hashlib.sha256()
    with Path(path).open('rb') as stream:
        while block := stream.read(1 << 20): result.update(block)
    return result.hexdigest()


def source_pins():
    root = Path(__file__).resolve().parent.parent
    paths = {Path(__file__).resolve(), root / 'Sources/Slotstream/PinnedModel.swift'}
    for module in list(sys.modules.values()):
        value = getattr(module, '__file__', None)
        if value:
            path = Path(value).resolve()
            if root / 'Tools' in path.parents and path.suffix == '.py' and not path.name.endswith('_test.py'):
                paths.add(path)
    return {str(path.relative_to(root)): digest(path) for path in sorted(paths)}


def allocated(root):
    total = 0
    for index, path in enumerate(Path(root).rglob('*')):
        if index >= 100_000: raise RuntimeError('research staging census exceeds its file bound')
        info = path.lstat()
        total += info.st_blocks * 512
    return total


def paths(protocol, root):
    root = Path(root).resolve(strict=True)
    values = protocol['paths']
    if set(values) != {'parent', 'control', 'rotary', 'plan', 'output', 'report'}:
        raise ValueError('complete explicit export paths required')
    parent = Path(values['parent']).expanduser()
    if not parent.is_absolute(): raise ValueError('parent path must be explicit')
    result = {'parent': parent}
    for name in ('control', 'rotary', 'plan', 'output', 'report'):
        relative_path(values[name])
        if name in ('output', 'report') and not valid_name(values[name]):
            raise ValueError('output and report must be new direct child directories')
        target = root / values[name]
        if not target.resolve().is_relative_to(root):
            raise ValueError('export path leaves the research root')
        result[name] = target
    if result['output'] == result['report']:
        raise ValueError('model output and driver evidence need separate directories')
    return result


def validate(protocol, root):
    if (type(protocol.get('schema')) is not int or protocol['schema'] != 1
            or protocol.get('kind') != 'affine-standalone-export-v1'
            or protocol.get('source_sha256') != source_pins()):
        raise ValueError('export protocol or complete source closure changed')
    resolved = paths(protocol, root)
    plan = read_json(resolved['plan'], protocol['plan_sha256'])
    if plan.get('payloads_authenticated') is not False or plan.get('qualification') is not False:
        raise ValueError('export requires its unqualified metadata-only plan')
    resource = protocol['resource']
    bounds = {'maximum_process_bytes': (1, 1_000_000_000), 'maximum_seconds': (1, 3600),
              'maximum_output_bytes': (1, MAX_OUTPUT),
              'maximum_research_staging_bytes': (1, 430_000_000_000),
              'minimum_free_bytes': (3_000_000_000, 430_000_000_000)}
    for key, (low, high) in bounds.items():
        if type(resource.get(key)) is not int or not low <= resource[key] <= high:
            raise ValueError('unpriced export resource bound: ' + key)
    fixed = {'preflight_bytes': 4_000_000_000, 'headroom_bytes': 3_000_000_000,
             'receipt_reservation_bytes': RECEIPT_RESERVATION, 'new_raw_logit_bytes': 0,
             'paid_compute_usd': 0, 'concurrent_workers': 1}
    if (any(type(resource.get(key)) is not int or resource[key] != value for key, value in fixed.items())
            or type(plan.get('maximum_output_bytes')) is not int
            or resource['maximum_output_bytes'] != plan['maximum_output_bytes']):
        raise ValueError('export resource envelope differs from the complete plan')
    return resolved, plan


def run(protocol_path, protocol_sha256, root):
    root = Path(root).resolve(strict=True)
    protocol = read_json(Path(protocol_path), protocol_sha256)
    resolved, frozen = validate(protocol, root)
    resource = protocol['resource']
    # mkdir is the no-retry boundary. A failed run keeps all its evidence and
    # any partial export; no later invocation silently replaces either one.
    resolved['report'].mkdir(mode=0o700, exist_ok=False)
    receipt = resolved['report'] / 'receipt.json'
    started = time.monotonic(); last_system = last_staging = -10.0
    record = {'schema': 1, 'complete': False, 'qualification': False,
              'protocol_sha256': protocol_sha256, 'plan_sha256': protocol['plan_sha256'],
              'source_sha256': protocol['source_sha256'], 'samples': 0, 'peak_process_bytes': 0}

    def save():
        record['seconds'] = time.monotonic() - started
        raw = encoded(record)
        if len(raw) * 2 > RECEIPT_RESERVATION:
            raise RuntimeError('export evidence exceeds its separate reservation')
        temporary = receipt.with_suffix('.tmp')
        with temporary.open('wb') as stream:
            stream.write(raw); stream.flush(); os.fsync(stream.fileno())
        temporary.replace(receipt)
        owner = os.open(receipt.parent, os.O_RDONLY | os.O_DIRECTORY | os.O_CLOEXEC)
        try: os.fsync(owner)
        finally: os.close(owner)

    def check(force=False):
        nonlocal last_system, last_staging
        elapsed = time.monotonic() - started
        if elapsed > resource['maximum_seconds']: raise TimeoutError('complete export deadline')
        if force or elapsed - last_system >= 1:
            observed = physical(); peak = max(observed.values())
            if peak <= 0 or peak > resource['maximum_process_bytes']:
                raise RuntimeError('export physical process envelope exceeded')
            if vm_snapshot()['reclaimable_bytes'] < resource['headroom_bytes']:
                raise RuntimeError('export lost actual headroom')
            if subprocess.check_output(['sysctl', '-n', 'kern.memorystatus_vm_pressure_level'],
                                       text=True, timeout=5).strip() != '1':
                raise RuntimeError('export stopped for OS pressure')
            record['samples'] += 1; record['peak_process_bytes'] = max(record['peak_process_bytes'], peak)
            last_system = elapsed
        if force or elapsed - last_staging >= 5:
            used = allocated(root)
            if used > resource['maximum_research_staging_bytes']:
                raise RuntimeError('complete research staging reservation exhausted')
            record['observed_staging_bytes'] = used; last_staging = elapsed; save()

    save()
    try:
        # quiet_preflight briefly acquires this same lock itself. Run that
        # probe first, then take lifetime ownership and reread actual memory;
        # a competing launch in between makes our nonblocking lock fail.
        record['preflight'] = quiet_preflight(resource['preflight_bytes'] / 1e9)
        with verification_lock():
            record['owned_preflight'] = vm_snapshot()
            if record['owned_preflight']['reclaimable_bytes'] < resource['preflight_bytes']:
                raise RuntimeError('export lost its complete preflight reservation before ownership')
            check()
            used = allocated(root)
            if used + resource['maximum_output_bytes'] + RECEIPT_RESERVATION > resource['maximum_research_staging_bytes']:
                raise RuntimeError('complete output does not fit the whole research staging reservation')
            record['staging_before_bytes'] = used; save()
            entries, identity, description = prepare(resolved['parent'], resolved['control'], resolved['rotary'])
            if description != frozen:
                raise ValueError('actual component plan differs from the prospectively frozen export')
            check()
            record['export'] = export(entries, resolved['output'], identity,
                maximum_output_bytes=resource['maximum_output_bytes'],
                manifest_reservation_bytes=description['manifest_reservation_bytes'],
                minimum_free_bytes=resource['minimum_free_bytes'], check=check)
            check(force=True); validate(protocol, root)
            if record['export'].get('complete') is not True or record['export'].get('qualification') is not False:
                raise ValueError('incomplete standalone assembly')
            record['complete'] = True; save()
    except BaseException as error:
        record['complete'] = False
        record['failure'] = type(error).__name__ + ': ' + str(error); save(); raise
    return record


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol', type=Path, required=True)
    parser.add_argument('--protocol-sha256', required=True)
    parser.add_argument('--root', type=Path, required=True)
    args = parser.parse_args()
    result = run(args.protocol, args.protocol_sha256, args.root)
    print(json.dumps({'complete': result['complete'], 'qualification': False, 'export': result['export']}))


if __name__ == '__main__': main()
