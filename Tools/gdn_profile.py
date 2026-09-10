#!/usr/bin/env python3
"""Attribute actual recurrent-layer work using an explicitly serialized probe."""
import argparse
import json
import os
from pathlib import Path
import shutil
import statistics
from prefill_bench import ROOT, digest, model_identity, preflight, run_child, vm_snapshot
from serve_bench import verified_build


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--binary', type=Path, required=True)
    p.add_argument('--model', type=Path, required=True)
    p.add_argument('--out', type=Path, required=True)
    p.add_argument('--transfer', action='store_true', help='Attribute allocation/wrapping/scatter on fixed all-miss replays')
    a = p.parse_args()
    binary, model, out = a.binary.resolve(), a.model.resolve(), a.out.resolve()
    identity = verified_build(str(binary))
    out.mkdir(parents=True, exist_ok=False)
    protocol = {'binary': str(binary), 'identity': identity,
        'model_identity': model_identity(model), 'token_extents': [1, 256, 1024],
        'classification': 'Fixed full-model forward replay after a 256-token nonzero-state prefix. Five alternating pairs per extent. Diagnostic route observation is common. Filesystem cache uncontrolled; no cold-storage or serving throughput claim.',
        'attribution': 'Profile forces evaluation before/after GDN preparation, recurrence and finish at every recurrent layer. Input wait includes predecessor dependencies. Preparation includes projections, convolution and Q/K normalization; recurrence includes decay/beta construction, the existing register-resident serial kernel and FP32 state; finish includes gated normalization/output projection and retained convolution windows. Profile changes scheduling/lifetimes. Phase sums are serialized attribution, not the untraced critical path.',
        'validation': 'Exact logits, ordered routes and byte-exact complete retained state; 36 GDN layers once per forward. Existing pool I/O and scatter-enqueue durations are separately reported, not summed with overlapping waits.',
        'qualification': 'At least five complete clean pairs for each extent; any whole-process global swap excludes that extent. No replacements. Nominal power and sampled <=10 GB per timed forward. Stop safely on interval resource failure. Recurrence is a material candidate only if its median serialized time is >=5% of untraced replay time, with profile scheduling overhead stated explicitly; this is a screening criterion, not a predicted attainable speedup.',
        'replacement_cells': 0}
    if a.transfer:
        protocol.update({
            'token_extents': [1, 32, 256, 1024],
            'classification': 'Fixed all-miss full-model forward replays after a 256-token nonzero-state prefix. Discard only slot mappings outside each timed interval; capacity and tensor storage unchanged. Five alternating pairs. Identical diagnostic routing observers. Filesystem cache uncontrolled; no cold-SSD or serving claim.',
            'attribution': 'Profile times aligned allocations, managed-array wrapping and existing staging evaluation. A synchronized callback observation counts source buffers released inside the managed constructor, indicating its copy fallback in the pinned MLX source. It excludes later normal destruction. Wrapping includes diagnostic-observer overhead. Scatter prior waits drain predecessor pool dependencies; execution waits force scatter completion, changing overlap. All staging times are already inside expert_read_seconds; do not add them again.',
            'validation': 'Exact logits, ordered routing and every retained state byte across traced/untraced replay, identical complete read payloads, nine wrapped buffers per batch, nominal power and sampled <=10 GB. Discard whole extent on process swap; stop on interval resource failure, no replacement.',
            'qualification': 'Five complete clean pairs per extent. A reusable-arena successor requires median (allocation + wrapping + staging eval + scatter execution)/untraced replay >=5%, with tracing overhead and each component separately stated. This is a materiality screen, not an attainable speedup; prior synchronization time cannot be removed merely by replacing scatter.'})
    for name in ['gdn_profile.py', 'prefill_bench.py', 'serve_bench.py']:
        shutil.copy2(ROOT/'Tools'/name, out/name)
    protocol['driver_hashes'] = {x.name: digest(x) for x in out.glob('*.py')}
    (out/'protocol.json').write_text(json.dumps(protocol, indent=2)+'\n')
    summaries = []
    for tokens in protocol['token_extents']:
        cell = out/f'tokens-{tokens}'
        cell.mkdir()
        command = [str(binary), 'optimization-state-check', '--variant', 'transfer-profile' if a.transfer else 'gdn-profile',
                   '--tokens', str(tokens), '--model', str(model), '--json']
        env = {k: v for k, v in os.environ.items() if not k.startswith('SLOTSTREAM_')}
        before = preflight(13)
        manifest = {'command': command, 'before_vm': before, 'environment': 'all inherited SLOTSTREAM_* removed'}
        (cell/'manifest.json').write_text(json.dumps(manifest, indent=2)+'\n')
        code = run_child(command, env, cell, 900)
        after = vm_snapshot()
        manifest.update({'exit_code': code, 'after_vm': after,
                         'whole_process_swap_clean': all(before[k] == after[k] for k in ['swapins', 'swapouts'])})
        (cell/'manifest.json').write_text(json.dumps(manifest, indent=2)+'\n')
        summary = {'tokens': tokens, 'exit_code': code,
                   'whole_process_swap_clean': manifest['whole_process_swap_clean']}
        if code == 0:
            report = json.loads((cell/'stdout.txt').read_text())
            m = report['measurements']
            complete = all(f'round_{r}.{arm}.seconds' in m for r in range(1, 6) for arm in ['traced', 'untraced'])
            summary.update({'passed': report['passed'], 'complete': complete,
                            'qualified': report['passed'] and complete and manifest['whole_process_swap_clean']})
            if complete:
                rows = []
                for r in range(1, 6):
                    u, t = f'round_{r}.untraced', f'round_{r}.traced'
                    row = {'round': r, 'untraced_seconds': m[f'{u}.seconds'],
                        'traced_seconds': m[f'{t}.seconds'],
                        'tracing_overhead_fraction': m[f'{t}.seconds']/m[f'{u}.seconds']-1,
                        'untraced_io_seconds': m[f'{u}.expert_read_seconds'],
                        'untraced_scatter_enqueue_seconds': m[f'{u}.scatter_enqueue_seconds'],
                        'untraced_records': m[f'{u}.records_fetched'], 'traced_records': m[f'{t}.records_fetched']}
                    if a.transfer:
                        keys = ['allocation_seconds', 'wrapping_seconds', 'staging_eval_seconds',
                                'scatter_execution_seconds']
                        row.update({key: m[f'{t}.{key}'] for key in keys + ['scatter_prior_wait_seconds',
                            'allocated_bytes', 'staging_batches', 'wrapped_buffers', 'immediate_release_buffers']})
                        row['material_fraction'] = sum(row[key] for key in keys)/m[f'{u}.seconds']
                    else:
                        row['serialized_recurrence_seconds'] = m[f'{t}.gdn_recurrence_seconds']
                        row['recurrence_to_untraced_fraction'] = row['serialized_recurrence_seconds']/m[f'{u}.seconds']
                        row['material_fraction'] = row['recurrence_to_untraced_fraction']
                    rows.append(row)
                summary['pairs'] = rows
                if not a.transfer:
                    summary['median_recurrence_to_untraced_fraction'] = statistics.median(x['recurrence_to_untraced_fraction'] for x in rows)
                summary['median_material_fraction'] = statistics.median(x['material_fraction'] for x in rows)
                summary['median_tracing_overhead_fraction'] = statistics.median(x['tracing_overhead_fraction'] for x in rows)
                summary['material_screen_passed'] = summary['qualified'] and summary['median_material_fraction'] >= .05
        summaries.append(summary)
        (out/'summary.json').write_text(json.dumps(summaries, indent=2)+'\n')
        print(json.dumps(summary), flush=True)
        if code != 0 or not summary.get('passed', False): break
    return 0 if len(summaries) == len(protocol['token_extents']) and all(x.get('qualified', False) for x in summaries) else 1


if __name__ == '__main__': raise SystemExit(main())
