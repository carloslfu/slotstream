#!/usr/bin/env python3
"""Freeze and run the bounded native full-model next-token replay study."""
import argparse
import json
import os
from pathlib import Path
import shutil
import time

from prefill_bench import digest, host_conditions, model_identity, preflight, run_child, vm_snapshot


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--binary', type=Path, required=True)
    parser.add_argument('--model', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    binary = args.binary.resolve()
    identity = json.loads((binary.parent / 'build-identity.json').read_text())
    for file, key in [(binary, 'binary_sha256'), (binary.parent / 'mlx.metallib', 'metallib_sha256'),
                      (binary.parent / 'build-source.tar.gz', 'source_archive_sha256')]:
        if digest(file) != identity[key]:
            raise ValueError(f'frozen identity mismatch: {file}')
    if any(key.startswith('SLOTSTREAM_') for key in os.environ):
        raise ValueError('run with no Slotstream environment overrides')
    args.out.mkdir(parents=True, exist_ok=False)
    command = [str(binary), 'optimization-state-check', '--variant', 'all-hit-replay',
               '--model', str(args.model.resolve()), '--json']
    manifest = {
        'classification': 'Fixed-context full-model next-token compute component performance; not serving TPS',
        'command': command, 'identity': identity, 'model': model_identity(args.model),
        'protocol': {'context_tokens': 1024, 'next_token': 907, 'prefill_chunk': 256,
                     'pool_slots': 640, 'mtp': False, 'rounds': 5, 'warmups_per_cell': 2,
                     'replays_per_cell': 8, 'order': 'reference/router-weights/compiled-norm, reversed on even rounds',
                     'minimum_pairs': 5, 'minimum_median_reduction': 0.05, 'minimum_positive_fraction': 0.8,
                     'maximum_sampled_footprint_bytes': 10_000_000_000,
                     'require_zero_expert_reads': True, 'require_exact_logits_and_routes': True,
                     'require_no_interval_swap': True, 'require_nominal_power_state': True,
                     'replacement_rounds': 0, 'abort_on_resource_change': True,
                     'interpretation': 'Fixed pool; router cache adds memory. No fixed-total, cold-start, request, energy or quality claim.'},
        'runner_sha256': digest(Path(__file__)),
        'support_sha256': digest(Path(__file__).with_name('prefill_bench.py')),
        'completed': False,
    }
    shutil.copyfile(__file__, args.out / 'all_hit_replay.py')
    shutil.copyfile(Path(__file__).with_name('prefill_bench.py'), args.out / 'prefill_bench.py')
    (args.out / 'protocol.json').write_text(json.dumps(manifest, indent=2) + '\n')
    started = time.monotonic()
    try:
        manifest['before'] = preflight(13)
        manifest['host_before'] = host_conditions()
        manifest['exit_code'] = run_child(command, os.environ.copy(), args.out, 600)
        report = json.loads((args.out / 'stdout.txt').read_text())
        manifest['completed'] = manifest['exit_code'] == 0 and report.get('passed') is True
        manifest['assertions'] = len(report.get('items', []))
        manifest['gates'] = {k: v for k, v in report.get('measurements', {}).items()
                             if '.round_' not in k and not k.startswith('round_')}
    except Exception as error:
        manifest['error'] = f'{type(error).__name__}: {error}'
    finally:
        manifest['wall_seconds'] = time.monotonic() - started
        manifest['after'] = vm_snapshot()
        manifest['host_after'] = host_conditions()
        (args.out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    print(json.dumps({k: v for k, v in manifest.items()
                      if k in ('completed', 'error', 'assertions', 'gates', 'wall_seconds')}, indent=2))
    return 0 if manifest['completed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
