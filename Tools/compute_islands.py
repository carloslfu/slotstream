#!/usr/bin/env python3
"""Frozen trained-weight projection/GLU component screen; never a serving claim."""
import argparse
import json
import os
from pathlib import Path
import shutil
import statistics
from prefill_bench import digest, host_conditions, model_identity, preflight, run_child, vm_snapshot
from serve_bench import competing_jobs, verified_build, wait_for_quiet_workspace


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--binary', type=Path, required=True)
    p.add_argument('--model', type=Path, required=True)
    p.add_argument('--out', type=Path, required=True)
    p.add_argument('--quantized-only', action='store_true', help='Explicit successor excluding the preserved dense B/A numerical counterexample')
    p.add_argument('--stop-on-workspace-contention', action='store_true',
        help='Refuse known competing checkpoint/build jobs before launch and exclude the process if observed afterward')
    p.add_argument('--initial-quiet-seconds', type=int, default=0,
        help='Explicit sampled known-job quiet interval before this independent screen')
    a = p.parse_args()
    if not 0 <= a.initial_quiet_seconds <= 600:
        p.error('initial quiet interval must be 0..600 seconds')
    if any(k.startswith('SLOTSTREAM_') for k in os.environ):
        raise ValueError('component screen forbids environment overrides')
    identity = verified_build(a.binary)
    a.out.mkdir(parents=True, exist_ok=False)
    record = {'build': identity, 'model_identity': model_identity(a.model),
        'classification': 'Component-only projection/GLU screen, trained weights and deterministic synthetic BF16 activations; not full-model latency, occupancy, energy or serving evidence.',
        'protocol': {'rows': [1, 2, 8, 16, 32, 256, 257, 1024],
            'groups': ['shared-gate-up', 'gdn-qkv-z', 'gdn-b-a'],
            'rounds': 5, 'reversed_even_round_order': True, 'sequential_calls_per_cell': 16,
            'warmup_calls_per_arm': 3, 'replacement_rounds': 0,
            'required_exact_bytes': True, 'minimum_complete_clean_pairs': 5,
            'minimum_median_reduction': .05, 'minimum_positive_fraction': .8,
            'maximum_sampled_footprint_bytes': 7_000_000_000,
            'abort_on_interval_swap_thermal_or_footprint_failure': True,
            'exclude_entire_process_if_global_swap': True,
            'stop_on_workspace_contention': a.stop_on_workspace_contention,
            'timed_input': 'Materialized contiguous BF16; noncontiguous views are an additional untimed equality test.',
            'primary_metric': 'Complete group wall time including output slicing and GLU, each invocation evaluated; pre-materialized concatenated weights are explicitly duplicated and charged, never treated as free.',
            'adoption': 'A component pass earns a full-model candidate only; all-layer duplicated storage, dispatch numerics, decode/prefill lifecycle and fixed-total-memory serving must qualify separately.'}}
    record['harness_sources'] = {}
    record['protocol']['initial_workspace_quiet'] = ({'stable_seconds': a.initial_quiet_seconds,
        'maximum_wait_seconds': 1800} if a.initial_quiet_seconds else None)
    if a.quantized_only:
        record['protocol']['groups'] = ['shared-gate-up', 'gdn-qkv-z']
        record['protocol']['successor_basis'] = 'V107 dense B/A fails exact bytes at 256 rows; that group is excluded in full. The original full-group diagnostic and its failure remain unchanged.'
    for name in ['compute_islands.py', 'prefill_bench.py', 'serve_bench.py']:
        file = Path(__file__).with_name(name)
        record['harness_sources'][name] = digest(file)
        shutil.copyfile(file, a.out/name)
    (a.out/'protocol.json').write_text(json.dumps(record, indent=2)+'\n')
    record['qualified'] = False
    try:
        if a.initial_quiet_seconds:
            record['initial_workspace_quiet'] = wait_for_quiet_workspace(record['protocol']['initial_workspace_quiet'])
        if a.stop_on_workspace_contention:
            record['competing_jobs_before'] = competing_jobs()
            if record['competing_jobs_before']:
                raise RuntimeError('competing storage/build job; stopped before model launch')
        record['before'] = preflight(11)
        record['host_before'] = host_conditions()
        variant = 'compute-islands-quantized-performance' if a.quantized_only else 'compute-islands-performance'
        command = [identity['binary'], 'optimization-state-check', '--variant',
                   variant, '--model', str(a.model.resolve()), '--json']
        record['command'] = command
        record['exit_code'] = run_child(command, os.environ.copy(), a.out, 900)
        report = json.loads((a.out/'stdout.txt').read_text())
        record['native_passed'] = report.get('passed') is True and record['exit_code'] == 0
        record['after'] = vm_snapshot()
        record['host_after'] = host_conditions()
        if a.stop_on_workspace_contention:
            record['competing_jobs_after'] = competing_jobs()
        clean = all(record['before'][k] == record['after'][k] for k in ['swapins', 'swapouts'])
        record['process_swap_clean'] = clean
        record['sources_unchanged'] = all(digest(Path(__file__).with_name(name)) == expected
            for name, expected in record['harness_sources'].items())
        eligible = clean and record['sources_unchanged'] and not record.get('competing_jobs_after')
        measurements = report.get('measurements', {})
        outcomes = []
        for group in record['protocol']['groups']:
            for rows in record['protocol']['rows']:
                for arm in (['pointwise', 'projection', 'combined'] if group == 'shared-gate-up' else ['projection']):
                    prefix = f'{group}.rows_{rows}'
                    pairs = []
                    for round in range(1, 6):
                        baseline = measurements.get(f'{prefix}.round_{round}.reference.seconds')
                        candidate = measurements.get(f'{prefix}.round_{round}.{arm}.seconds')
                        if baseline is not None and candidate is not None and baseline > 0:
                            pairs.append((baseline-candidate)/baseline)
                    valid = eligible and record['native_passed'] and len(pairs) == 5
                    median = statistics.median(pairs) if pairs else None
                    fraction = sum(x > 0 for x in pairs)/len(pairs) if pairs else None
                    outcomes.append({'group': group, 'rows': rows, 'arm': arm, 'pairs': pairs,
                        'qualified': valid, 'median_reduction': median, 'positive_fraction': fraction,
                        'component_benefit_passed': valid and median >= .05 and fraction >= .8})
        record['outcomes'] = outcomes
        record['qualified'] = bool(outcomes) and all(x['qualified'] for x in outcomes)
    except Exception as error:
        record['error'] = f'{type(error).__name__}: {error}'
    (a.out/'manifest.json').write_text(json.dumps(record, indent=2)+'\n')
    print(json.dumps({k: v for k, v in record.items() if k in ['qualified', 'native_passed', 'process_swap_clean', 'error', 'outcomes']}), flush=True)
    return 0 if record['qualified'] else 1


if __name__ == '__main__': raise SystemExit(main())
