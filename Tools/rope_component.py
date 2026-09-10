#!/usr/bin/env python3
"""Frozen exact RoPE component screen; no serving or all-model speed claim."""
import argparse
import json
import os
from pathlib import Path
import shutil
import statistics
from prefill_bench import digest, host_conditions, preflight, run_child, vm_snapshot
from serve_bench import competing_jobs, verified_build, wait_for_quiet_workspace


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--binary', type=Path, required=True)
    p.add_argument('--model', type=Path, required=True)
    p.add_argument('--out', type=Path, required=True)
    p.add_argument('--initial-quiet-seconds', type=int, default=0,
        help='Explicit sampled known-job quiet interval before this independent screen')
    a = p.parse_args()
    if not 0 <= a.initial_quiet_seconds <= 600:
        p.error('initial quiet interval must be0..600seconds')
    if any(k.startswith('SLOTSTREAM_') for k in os.environ):
        raise ValueError('RoPE screen forbids environment overrides')
    identity = verified_build(a.binary)
    a.out.mkdir(parents=True, exist_ok=False)
    record = {'build': identity, 'qualified': False,
        'classification': 'QSA angle-table and BF16 rotation component only. Fixed synthetic materialized activations, no trained model projections, attention, I/O, serving or energy claim.',
        'protocol': {'rows': [1, 256, 1024], 'rounds': 5, 'passes_per_cell': 32,
            'layers_per_pass': 12, 'arms': ['reference', 'tables', 'fused', 'combined'],
            'q_shape': '[1,24,rows,256], transposed from BF16 time-major',
            'k_shape': '[1,2,rows,256], transposed from BF16 time-major',
            'rotary_dim': 64, 'base': 10000000, 'first_position': 8192,
            'position_advance_per_pass': 'rows', 'warmup_calls_per_arm': 3,
            'reversed_even_round_order': True, 'replacement_rounds': 0,
            'required_exact_bytes': True, 'minimum_complete_clean_pairs': 5,
            'minimum_median_reduction': .05, 'minimum_positive_fraction': .8,
            'maximum_sampled_footprint_bytes': 2000000000,
            'exclude_entire_process_if_global_swap_or_workspace_contention': True,
            'primary_metric': 'Wall time of all production Rope.table/rotate calls with both outputs evaluated every layer, including array construction, table lookup and rotation. Not GPU event duration.',
            'adoption': 'A component benefit only earns separate fixed-total-memory serving qualification.'},
        'harness_sources': {}}
    record['protocol']['initial_workspace_quiet'] = ({'stable_seconds': a.initial_quiet_seconds,
        'maximum_wait_seconds': 1800} if a.initial_quiet_seconds else None)
    for name in ['rope_component.py', 'prefill_bench.py', 'serve_bench.py']:
        file = Path(__file__).with_name(name)
        record['harness_sources'][name] = digest(file)
        shutil.copyfile(file, a.out/name)
    (a.out/'protocol.json').write_text(json.dumps(record, indent=2)+'\n')
    try:
        if a.initial_quiet_seconds:
            record['initial_workspace_quiet'] = wait_for_quiet_workspace(record['protocol']['initial_workspace_quiet'])
        record['competing_jobs_before'] = competing_jobs()
        if record['competing_jobs_before']:
            raise RuntimeError('competing storage/build job; no diagnostic launched')
        record['before'] = preflight(7)
        record['host_before'] = host_conditions()
        command = [identity['binary'], 'optimization-state-check', '--variant', 'rope-performance',
            '--model', str(a.model.resolve()), '--json']
        record['command'] = command
        record['exit_code'] = run_child(command, os.environ.copy(), a.out, 600)
        report = json.loads((a.out/'stdout.txt').read_text())
        record['native_passed'] = report.get('passed') is True and record['exit_code'] == 0
        record['after'] = vm_snapshot()
        record['host_after'] = host_conditions()
        record['competing_jobs_after'] = competing_jobs()
        record['process_swap_clean'] = all(record['before'][k] == record['after'][k] for k in ['swapins', 'swapouts'])
        record['sources_unchanged'] = all(digest(Path(__file__).with_name(n)) == h for n,h in record['harness_sources'].items())
        eligible = record['native_passed'] and record['process_swap_clean'] and record['sources_unchanged'] and not record['competing_jobs_after']
        m = report.get('measurements', {})
        record['outcomes'] = []
        for rows in record['protocol']['rows']:
            for arm in record['protocol']['arms'][1:]:
                pairs = []
                for round in range(1,6):
                    prefix = f'rows_{rows}.round_{round}'
                    reference, candidate = m.get(prefix+'.reference.seconds'), m.get(prefix+f'.{arm}.seconds')
                    if reference is not None and candidate is not None and reference > 0:
                        pairs.append(1-candidate/reference)
                valid = eligible and len(pairs) == 5
                median = statistics.median(pairs) if pairs else None
                positive = sum(x>0 for x in pairs)/len(pairs) if pairs else None
                record['outcomes'].append({'rows': rows, 'arm': arm, 'pairs': pairs,
                    'qualified': valid, 'median_reduction': median, 'positive_fraction': positive,
                    'component_benefit_passed': valid and median >= .05 and positive >= .8})
        record['qualified'] = bool(record['outcomes']) and all(x['qualified'] for x in record['outcomes'])
    except Exception as error:
        record['error'] = f'{type(error).__name__}: {error}'
    (a.out/'manifest.json').write_text(json.dumps(record,indent=2)+'\n')
    print(json.dumps({k:v for k,v in record.items() if k in ['qualified','native_passed','process_swap_clean','error','outcomes']}),flush=True)
    return 0 if record['qualified'] else 1


if __name__ == '__main__': raise SystemExit(main())
