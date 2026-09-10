#!/usr/bin/env python3
"""Fresh-process full n-gram cache study. No full-model inference claim."""
import argparse
import json
import math
import os
from pathlib import Path
import shutil
import signal
import statistics
import subprocess
import time

from prefill_bench import digest, model_identity, preflight, vm_snapshot
from serve_bench import competing_jobs, reserved_cooldown, verified_build, wait_for_quiet_workspace


ARMS = ['reference', 'compact', 'reference-ring', 'compact-ring']
HASHES = {'input_ids', 'fill_embeddings', 'warm_embedding', 'eviction_embeddings'}


def contract():
    return {
        'classification': 'Real full-cache PLE component; no language-model layers or serving benefit claim',
        'binary': 'FINAL_BINARY_REQUIRED',
        'model': '/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit',
        'arms': ARMS, 'rounds': 7, 'minimum_clean_pairs': 5, 'replacement_cells': 0,
        'fill_tokens': 32768, 'tile_tokens': 256, 'eviction_tokens': 4096, 'warm_calls': 128,
        'initial_quiet_seconds': 180, 'between_cells_seconds': 60,
        'cell_timeout_seconds': 300, 'whole_study_timeout_seconds': 5400,
        'preflight_reclaimable_gb': 12, 'maximum_physical_bytes': 5_000_000_000,
        'minimum_payload_savings_bytes': 100_000_000,
        'minimum_physical_filled_savings_bytes': 80_000_000,
        'minimum_physical_growth_savings_bytes': 80_000_000,
        'maximum_median_time_regression': .05,
        'minimum_ring_eviction_reduction': .05, 'minimum_positive_fraction': .8,
        'maximum_ring_physical_growth_bytes': 16_000_000,
        'vm_or_power_exclusions': 'Exclude the whole pair; retain all seven fixed rounds without replacement. Native errors or memory ceiling violations stop the study.',
        'native_prerequisites': 'UNBOUND: final ngram exact state/row/EOS/eviction and cache-bookkeeping checks',
        'later_gates': 'Compact storage requires ordinary serving nonregression; a ring benefit requires same-control serving guard. No automatic activation follows this component.',
    }


def positive(value):
    return type(value) in [int, float] and math.isfinite(value) and value > 0


def validate_prerequisites(spec, build):
    entries = spec.get('native_prerequisites')
    if not isinstance(entries, dict) or set(entries) != {'ngram', 'cache-bookkeeping'}:
        raise ValueError('both exact native ngram/cache-bookkeeping prerequisites must be bound')
    receipts = {}
    for variant, entry in entries.items():
        documents = {}
        for name in ['manifest.json', 'stdout.txt']:
            path = Path(entry['directory'])/name
            if digest(path) != entry['sha256'][name]: raise ValueError('native prerequisite digest differs')
            documents[name] = json.loads(path.read_text())
        manifest, report = documents['manifest.json'], documents['stdout.txt']
        identity = manifest.get('identity', {})
        if any(not isinstance(identity.get(k), str) or len(identity[k]) != 64 or identity[k] != build['identity'].get(k)
               for k in ['binary_sha256', 'source_archive_sha256', 'metallib_sha256']):
            raise ValueError('native prerequisite belongs to another build')
        command, items = manifest.get('command', []), report.get('items')
        if (manifest.get('passed') is not True or manifest.get('exit_code') != 0
                or report.get('passed') is not True or report.get('skipped') is not None
                or not isinstance(items, list) or not items or any(i.get('passed') is not True for i in items)
                or manifest.get('assertions') != len(items)
                or 'optimization-state-check' not in command or '--variant' not in command
                or command.index('--variant') + 1 >= len(command)
                or command[command.index('--variant') + 1] != variant):
            raise ValueError('native prerequisite failed or used the wrong diagnostic')
        if report.get('name') != 'optimization-state-' + variant or report.get('measurements', {}).get('prompt_tokens') != 256:
            raise ValueError('native prerequisite lacks the fixed 256-token state comparison')
        receipts[variant] = {'assertions': len(items), 'sha256': entry['sha256']}
    return receipts


def native_observation(report, arm, spec):
    if (not isinstance(report, dict) or report.get('passed') is not True or report.get('skipped') is not None
            or report.get('name') != 'optimization-ngram-cache-' + arm
            or not report.get('items') or any(item.get('passed') is not True for item in report['items'])):
        raise ValueError('native component did not pass a complete named check')
    hashes = {}
    for item in report['items']:
        if item['name'].startswith('sha256:'):
            key, value = item['name'][7:], item.get('detail')
            if key in hashes or key not in HASHES or type(value) is not str or len(value) != 64:
                raise ValueError('missing, duplicate or invalid output digest')
            try: int(value, 16)
            except ValueError: raise ValueError('invalid output digest')
            hashes[key] = value
    if hashes.keys() != HASHES: raise ValueError('incomplete byte parity evidence')
    metrics = report.get('measurements', {})
    for key in ['fill_tokens', 'tile_tokens', 'eviction_tokens', 'warm_calls']:
        if metrics.get(key) != spec[key]: raise ValueError('native workload changed: ' + key)
    compact, ring = int('compact' in arm), int(arm.endswith('-ring'))
    if any(type(metrics.get(k)) not in [int, float] for k in ['compact', 'ring']) or metrics.get('compact') != compact or metrics.get('ring') != ring:
        raise ValueError('native arm did not select declared controls')
    for key in ['filled_rows', 'filled_payload_bytes', 'end_rows', 'end_payload_bytes',
                'warm_row_hits', 'eviction_row_misses', 'physical_before_bytes',
                'physical_filled_bytes', 'physical_end_bytes', 'sampled_peak_bytes',
                'sampled_count', 'lifetime_rss_peak_bytes', 'mlx_active_bytes']:
        value = metrics.get(key)
        if not positive(value) or int(value) != value: raise ValueError('invalid native count: ' + key)
    if not 360000 <= metrics['filled_rows'] <= 400000 or metrics['end_rows'] > 400000:
        raise ValueError('full-cache occupancy is missing or unbounded')
    for prefix in ['filled', 'end']:
        if metrics[prefix + '_payload_bytes'] != metrics[prefix + '_rows'] * 160 * (2 if compact else 4):
            raise ValueError('owned payload is inconsistent with mode and row count')
    if metrics['eviction_row_misses'] <= 40000 or metrics['sampled_count'] < 2:
        raise ValueError('missing actual eviction or footprint observation')
    evicted = metrics['filled_rows'] + metrics['eviction_row_misses'] - metrics['end_rows']
    if evicted < 40000 or evicted % 40000 != 0 or metrics['warm_row_hits'] != spec['warm_calls'] * spec['tile_tokens'] * 16:
        raise ValueError('FIFO eviction or warm-hit work accounting changed')
    for key in ['physical_before_bytes', 'physical_filled_bytes', 'physical_end_bytes',
                'sampled_peak_bytes', 'lifetime_rss_peak_bytes']:
        if metrics[key] > spec['maximum_physical_bytes']: raise ValueError('component process limit exceeded')
    if metrics['sampled_peak_bytes'] < max(metrics[k] for k in ['physical_before_bytes', 'physical_filled_bytes']):
        raise ValueError('component peak does not cover its own observations')
    for key in ['fill_seconds_including_hash', 'warm_assembly_seconds_per_call', 'eviction_assembly_seconds']:
        if not positive(metrics.get(key)): raise ValueError('invalid native duration: ' + key)
    for key in ['swapins_before', 'swapins_after', 'swapouts_before', 'swapouts_after']:
        value = metrics.get(key)
        if type(value) not in [int,float] or not math.isfinite(value) or value < 0 or int(value) != value:
            raise ValueError('missing native VM interval: ' + key)
    for key in ['nominal_thermal_endpoints', 'normal_power_endpoints']:
        if type(metrics.get(key)) not in [int,float] or metrics[key] not in [0,1]:
            raise ValueError('missing native power observation: ' + key)
    clean = (metrics['swapins_before'] == metrics['swapins_after'] and metrics['swapouts_before'] == metrics['swapouts_after']
             and metrics['nominal_thermal_endpoints'] == 1 and metrics['normal_power_endpoints'] == 1)
    return {'metrics': metrics, 'hashes': hashes, 'resources_clean': clean}


def assess(rows, spec, completed):
    by_key = {}
    for row in rows:
        number, arm = row.get('round'), row.get('arm')
        if type(number) is not int or not 1 <= number <= spec['rounds'] or arm not in ARMS or (number, arm) in by_key:
            raise ValueError('duplicate, extra or foreign full-cache cell')
        by_key[number, arm] = row
    complete = completed and len(rows) == len(ARMS) * spec['rounds']
    observations = [r['observation'] for r in rows if r.get('observation') is not None]
    exact_all = bool(observations) and all(o['hashes'] == observations[0]['hashes'] for o in observations)
    results = []
    for reference, candidate, kind in [('reference', 'compact', 'resource'),
            ('reference', 'reference-ring', 'queue'), ('compact', 'compact-ring', 'queue')]:
        pairs = []
        for number in range(1, spec['rounds'] + 1):
            a, b = by_key.get((number, reference)), by_key.get((number, candidate))
            if a is None or b is None or a.get('valid') is not True or b.get('valid') is not True: continue
            aa, bb = a['observation'], b['observation']; x, y = aa['metrics'], bb['metrics']
            if aa.get('resources_clean') is not True or bb.get('resources_clean') is not True:
                raise ValueError('valid component pair contradicts its native resource observations')
            if (aa['hashes'] != bb['hashes'] or any(x[k] != y[k] for k in ['filled_rows', 'end_rows', 'warm_row_hits', 'eviction_row_misses'])):
                raise ValueError('full-cache arms did not perform identical logical work')
            pairs.append({'round': number,
                'payload_saved': x['filled_payload_bytes'] - y['filled_payload_bytes'],
                'physical_filled_saved': x['physical_filled_bytes'] - y['physical_filled_bytes'],
                'physical_growth_saved': (x['physical_filled_bytes'] - x['physical_before_bytes']) - (y['physical_filled_bytes'] - y['physical_before_bytes']),
                **{k: 1 - y[k] / x[k] for k in ['fill_seconds_including_hash', 'warm_assembly_seconds_per_call', 'eviction_assembly_seconds']}})
        enough = len(pairs) >= spec['minimum_clean_pairs']
        medians = {k: statistics.median(p[k] for p in pairs) for k in ['fill_seconds_including_hash', 'warm_assembly_seconds_per_call', 'eviction_assembly_seconds']} if pairs else {}
        nonreg = enough and all(v >= -spec['maximum_median_time_regression'] for v in medians.values())
        if kind == 'resource':
            benefit = enough and all(p['payload_saved'] >= spec['minimum_payload_savings_bytes']
                and p['physical_filled_saved'] >= spec['minimum_physical_filled_savings_bytes']
                and p['physical_growth_saved'] >= spec['minimum_physical_growth_savings_bytes'] for p in pairs)
        else:
            benefit = (enough and medians['eviction_assembly_seconds'] >= spec['minimum_ring_eviction_reduction']
                and sum(p['eviction_assembly_seconds'] > 0 for p in pairs) / len(pairs) >= spec['minimum_positive_fraction']
                and all(p['physical_filled_saved'] >= -spec['maximum_ring_physical_growth_bytes'] for p in pairs))
        results.append({'reference': reference, 'candidate': candidate, 'kind': kind, 'pairs': pairs,
            'median_reductions': medians, 'nonregression_passed': nonreg, 'benefit_passed': benefit,
            'qualified_component': complete and exact_all and nonreg and benefit})
    return {'fixed_study_completed': complete, 'all_completed_outputs_exact': exact_all, 'comparisons': results,
            'inference_adopted': False}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    if signal.getitimer(signal.ITIMER_REAL) != (0.0, 0.0):
        raise RuntimeError('another real-time alarm is already active')
    spec = json.loads(args.protocol.read_text())
    expected = contract()
    for key in expected.keys() - {'binary', 'native_prerequisites'}:
        if spec.get(key) != expected[key]: raise ValueError('review and freeze a successor for changed contract: ' + key)
    build = verified_build(Path(spec['binary']))
    prerequisites = validate_prerequisites(spec, build)
    root = Path(__file__).resolve().parent.parent
    if competing_jobs(): raise RuntimeError('workspace busy; component not launched')
    args.out.mkdir(parents=True, exist_ok=False)
    for source in [Path(__file__), args.protocol, root/'Tools/serve_bench.py', root/'Tools/prefill_bench.py']:
        shutil.copy2(source, args.out/source.name)
    manifest = {'protocol': spec, 'reference_build': build, 'prerequisites': prerequisites,
                'model_identity': model_identity(Path(spec['model'])),
                'tool_sha256': digest(Path(__file__)),
                'driver_hashes': {name: digest(root/'Tools'/name) for name in ['ngram_cache_probe.py', 'serve_bench.py', 'prefill_bench.py']}}
    (args.out/'manifest.json').write_text(json.dumps(manifest, indent=2)+'\n')
    rows, completed, error = [], False, None
    started = time.monotonic()
    child = None
    def deadline(_number, _frame): raise TimeoutError('fixed full-cache study deadline expired')
    previous_alarm = signal.signal(signal.SIGALRM, deadline)
    signal.alarm(spec['whole_study_timeout_seconds'])
    try:
        wait_for_quiet_workspace({'stable_seconds': spec['initial_quiet_seconds'], 'maximum_wait_seconds': 600})
        for number in range(1, spec['rounds'] + 1):
            # Reverse complete arm order every round, preserving all seven
            # declared cells per arm. No replacement for a failed interval.
            for arm in (ARMS if number % 2 else ARMS[::-1]):
                if rows: reserved_cooldown(spec['between_cells_seconds'], 180)
                if competing_jobs(): raise RuntimeError('workspace became busy before component launch')
                before = preflight(spec['preflight_reclaimable_gb'])
                cell = args.out/f'{number:02d}-{arm}';cell.mkdir()
                command = [spec['binary'], 'optimization-state-check', '--model', spec['model'], '--variant', 'ngram-cache-'+arm, '--json']
                row = {'round': number, 'arm': arm, 'command': command, 'before': before, 'valid': False}
                rows.append(row)
                with (cell/'stdout.json').open('w') as stdout, (cell/'stderr.txt').open('w') as stderr:
                    child = subprocess.Popen(command, cwd=root, env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}, stdout=stdout, stderr=stderr, start_new_session=True)
                    try: child.wait(timeout=spec['cell_timeout_seconds'])
                    finally:
                        if child.poll() is None:
                            os.killpg(child.pid, signal.SIGTERM)
                            try: child.wait(timeout=10)
                            except subprocess.TimeoutExpired: os.killpg(child.pid, signal.SIGKILL);child.wait()
                row['returncode'] = child.returncode;child = None
                row['after'] = vm_snapshot()
                row['report_sha256'] = digest(cell/'stdout.json')
                if row['returncode'] != 0: raise RuntimeError('native component failed; raw cell preserved')
                row['observation'] = native_observation(json.loads((cell/'stdout.json').read_text()), arm, spec)
                row['valid'] = row['observation']['resources_clean'] and all(before[k] == row['after'][k] for k in ['swapins', 'swapouts'])
                (args.out/'rows.json').write_text(json.dumps(rows,indent=2)+'\n')
                print(json.dumps({'round':number,'arm':arm,'valid':row['valid']}),flush=True)
        completed = True
    except (Exception, KeyboardInterrupt) as caught:
        error = f'{type(caught).__name__}: {caught}'
    finally:
        signal.alarm(0);signal.signal(signal.SIGALRM, previous_alarm)
        (args.out/'rows.json').write_text(json.dumps(rows,indent=2)+'\n')
        stable = all(sha == digest(root/'Tools'/name) for name,sha in manifest['driver_hashes'].items())
        try: stable = stable and verified_build(Path(spec['binary'])) == build
        except (ValueError, OSError, KeyError): stable = False
        try: assessment = assess(rows, spec, completed and stable)
        except (ValueError, KeyError, TypeError) as caught:
            assessment = {'fixed_study_completed': False, 'all_completed_outputs_exact': False,
                          'inference_adopted': False, 'error': str(caught)}
        result = {'completed': completed, 'error': error, 'seconds': time.monotonic()-started,
                  'sources_unchanged': stable, 'assessment': assessment}
        (args.out/'completion.json').write_text(json.dumps(result,indent=2)+'\n')
        print(json.dumps(result),flush=True)
    return 0 if completed and result['sources_unchanged'] and assessment['all_completed_outputs_exact'] else 1


if __name__ == '__main__': raise SystemExit(main())
