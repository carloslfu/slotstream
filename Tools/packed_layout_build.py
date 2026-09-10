#!/usr/bin/env python3
"""Freeze and run one bounded native expert-layout build or load verification."""
import argparse
import json
import os
from pathlib import Path
import shutil
import time
from prefill_bench import digest, preflight, run_child, vm_snapshot, host_conditions


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--binary', type=Path, required=True)
    p.add_argument('--model', type=Path, required=True)
    p.add_argument('--artifact', type=Path, required=True)
    p.add_argument('--out', type=Path, required=True)
    p.add_argument('--verify-only', action='store_true')
    a = p.parse_args()
    binary = a.binary.resolve(); artifact = a.artifact.resolve(); out = a.out.resolve()
    out.mkdir(parents=True, exist_ok=False)
    identity = json.loads((binary.parent/'build-identity.json').read_text())
    for name, key in [('slotstream', 'binary_sha256'), ('mlx.metallib', 'metallib_sha256'),
                      ('build-source.tar.gz', 'source_archive_sha256')]:
        if digest(binary.parent/name) != identity[key]: raise ValueError('frozen binary/source mismatch')
    command = [str(binary), 'pack-experts', '--model', str(a.model.resolve()),
               '--destination', str(artifact), '--json']
    if a.verify_only: command.append('--verify-only')
    protocol = {'kind': 'one native full-artifact verification' if a.verify_only else 'one native full-artifact construction',
        'identity': identity, 'command': command, 'timeout_seconds': 900,
        'required_reclaimable_gb': 7, 'expected_payload_bytes': 67_947_724_800,
        'maximum_process_bytes': 512_000_000, 'original_files_read_only': True,
        'cost_scope': 'No serving speed claim. Native duration, complete payload verification, sampled physical peak and actual allocated disk bytes; global swap excludes cost/resource qualification, not byte-integrity correctness.',
        'artifact_preexists': artifact.exists(), 'disk_before': shutil.disk_usage(artifact.parent)._asdict()}
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:
        shutil.copy2(source, out/source.name)
    protocol['driver_hashes'] = {f.name: digest(f) for f in out.glob('*.py')}
    (out/'protocol.json').write_text(json.dumps(protocol, indent=2)+'\n')
    record = {'protocol': protocol, 'passed': False}
    start = time.monotonic()
    try:
        if not a.verify_only and artifact.exists(): raise ValueError('construction must never replace an artifact')
        record['before'] = preflight(7); record['host_before'] = host_conditions()
        record['exit_code'] = run_child(command, os.environ.copy(), out, 900)
        record['after'] = vm_snapshot()
        if record['exit_code']: raise RuntimeError('native command failed')
        result = json.loads((out/'stdout.txt').read_text()); record['result'] = result
        if result['artifact']['bytes'] != protocol['expected_payload_bytes']: raise ValueError('unexpected verified geometry')
        record['artifact_manifest'] = json.loads((artifact/'manifest.json').read_text())
        record['artifact_manifest_sha256'] = digest(artifact/'manifest.json')
        record['physical_allocated_bytes'] = sum(f.stat().st_blocks*512 for f in artifact.iterdir())
        record['disk_after'] = shutil.disk_usage(artifact.parent)._asdict()
        record['resource_exclusions'] = []
        if any(record['before'][k] != record['after'][k] for k in ['swapins','swapouts']):
            record['resource_exclusions'].append('global swap activity')
        if max(result['footprint']['peakBytes'], result['lifetimeRSSPeakBytes']) > protocol['maximum_process_bytes']:
            record['resource_exclusions'].append('process memory exceeds bound')
        record['passed'] = True
        record['resource_qualified'] = not record['resource_exclusions']
    except Exception as e:
        record['error'] = f'{type(e).__name__}: {e}'
    finally:
        record['wall_seconds'] = time.monotonic()-start
        record['final_vm'] = vm_snapshot()
        (out/'manifest.json').write_text(json.dumps(record, indent=2)+'\n')
    print(json.dumps({k:v for k,v in record.items() if k in ['passed','result','error','physical_allocated_bytes','resource_qualified','resource_exclusions','wall_seconds']},indent=2))
    return 0 if record['passed'] else 1


if __name__ == '__main__': raise SystemExit(main())
