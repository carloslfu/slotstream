#!/usr/bin/env python3
"""Run a declared, frozen native sampler component performance study."""
import argparse
import json
import os
from pathlib import Path
import shutil
import time
from prefill_bench import digest, host_conditions, preflight, run_child, vm_snapshot
from serve_bench import verified_build


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--binary', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    if any(key.startswith('SLOTSTREAM_') for key in os.environ):
        raise ValueError('component study forbids environment overrides')
    build = verified_build(args.binary)
    args.out.mkdir(parents=True, exist_ok=False)
    command = [build['binary'], 'optimization-state-check', '--variant', 'sampler-performance', '--json']
    manifest = {
        'classification': 'Native sampler component performance; no model or request-throughput claim',
        'command': command, 'build': build,
        'protocol': {'vocab': 248320, 'logit_seed': 99, 'draw_seed': 7,
            'arms': ['reference', 'threshold', 'device', 'combined'],
            'families': ['default filtered sampling with accumulated presence penalty', 'unfiltered temperature 1.5'],
            'rounds': 5, 'reversed_even_round_order': True, 'draws_per_cell': 64, 'warmups_per_cell': 2,
            'minimum_pairs': 5, 'minimum_median_reduction': .05, 'minimum_positive_fraction': .8,
            'maximum_sampled_footprint_bytes': 1_000_000_000,
            'require_exact_draw_sequences': True, 'require_no_interval_swap': True,
            'require_nominal_power_state': True, 'replacement_rounds': 0,
            'abort_on_resource_change': True,
            'primary_metric': 'completed sequential native sampler wall time, including host/GPU work and penalty-set updates'},
        'completed': False,
    }
    manifest['harness_sources'] = {}
    for name in [Path(__file__).name, 'prefill_bench.py', 'serve_bench.py']:
        path = Path(__file__).with_name(name)
        manifest['harness_sources'][name] = digest(path)
        shutil.copyfile(path, args.out / name)
    (args.out / 'protocol.json').write_text(json.dumps(manifest, indent=2) + '\n')
    started = time.monotonic()
    try:
        manifest['before'] = preflight(7)
        manifest['host_before'] = host_conditions()
        manifest['exit_code'] = run_child(command, os.environ.copy(), args.out, 600)
        report = json.loads((args.out / 'stdout.txt').read_text())
        manifest['completed'] = manifest['exit_code'] == 0 and report.get('passed') is True
        manifest['assertions'] = len(report.get('items', []))
        manifest['gates'] = {k: v for k, v in report.get('measurements', {}).items() if '.round_' not in k}
    except Exception as error:
        manifest['error'] = f'{type(error).__name__}: {error}'
    finally:
        manifest['after'] = vm_snapshot(); manifest['host_after'] = host_conditions()
        manifest['wall_seconds'] = time.monotonic() - started
        (args.out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    print(json.dumps({k: v for k, v in manifest.items() if k in ['completed', 'assertions', 'gates', 'error', 'wall_seconds']}, indent=2))
    return 0 if manifest['completed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
