#!/usr/bin/env python3
"""Exercise explicit windows through model-free CLI planning and scheduling.

No serve/run/context-check commands are allowed here. Synthetic RAM is used
only by doctor; no simulated plan can authorize a real model allocation.
"""
import argparse
from datetime import datetime, timezone
import hashlib
import json
import os
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parent.parent
WINDOWS = [1024, 4096, 8192, 16384, 32768, 65536, 128256, 131072, 262144]
MODEL_LIMIT = 262144
PUBLIC_LIMIT = 65536
PRODUCT_BOUND = 4096 * 8016


def digest(path):
    h = hashlib.sha256()
    with path.open('rb') as f:
        for block in iter(lambda: f.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()


def validate_schedule(value, count, start):
    if (type(count) is not int or type(start) is not int or count <= 0 or start < 0
            or start + count > MODEL_LIMIT):
        raise ValueError('invalid requested range')
    if not isinstance(value, dict) or any(type(value.get(key)) is not int or value[key] != expected
            for key, expected in [('tokens', count), ('from', start), ('measured_query_key_product', PRODUCT_BOUND)]):
        raise ValueError('schedule does not match the requested window and fixed product bound')
    passes, queries, extents = [value.get(key) for key in ('passes', 'compute_query_rows', 'compute_key_extents')]
    if (any(not isinstance(rows, list) for rows in (passes, queries, extents))
            or not passes or len(passes) != len(queries) or len(passes) != len(extents)):
        raise ValueError('missing actual dispatch geometry')
    position = start
    for n, q, k in zip(passes, queries, extents):
        if any(type(x) is not int for x in (n, q, k)) or not 0 < n <= q <= 4096:
            raise ValueError('invalid dispatch rows')
        position += n
        if not position <= k <= MODEL_LIMIT or q * k > PRODUCT_BOUND:
            raise ValueError('unbounded actual padded attention dispatch')
    if position != start + count:
        raise ValueError('schedule omits or duplicates prompt tokens')
    return {'passes': len(passes), 'maximum_query_key_product': max(q*k for q, k in zip(queries, extents)),
            'minimum_logical_pass': min(passes), 'complete': True}


def run(binary, out):
    binary = binary.resolve()
    identity = json.loads((binary.parent / 'build-identity.json').read_text())
    artifacts = [(binary, 'binary_sha256'), (binary.parent / 'mlx.metallib', 'metallib_sha256'),
                 (binary.parent / 'build-source.tar.gz', 'source_archive_sha256')]
    for path, key in artifacts:
        if digest(path) != identity[key]:
            raise ValueError('selected candidate differs from its identity: ' + key)

    def source_snapshot():
        sources = {str(p.relative_to(ROOT)): digest(p) for p in (ROOT / 'Sources').rglob('*') if p.is_file()}
        sources['Tools/context_window_matrix.py'] = digest(Path(__file__).resolve())
        return sources

    before = source_snapshot()
    archived = {name: value for name, value in identity['source'].items() if name.startswith('Sources/')}
    changes = sorted(name for name in set(before) | set(archived) if name.startswith('Sources/') and before.get(name) != archived.get(name))
    out.mkdir(parents=True, exist_ok=False)
    report = {'kind': 'context-window-cli-software', 'passed': False, 'model_loaded': False,
              'started_at': datetime.now(timezone.utc).isoformat(),
              'live_inference_tested': False, 'hardware_qualified': False,
              'binary_sha256': identity['binary_sha256'], 'source_archive_sha256': identity['source_archive_sha256'],
              'current_source_sha256': before, 'candidate_source_differences': changes,
              'windows': [], 'commands': []}
    env = {k: v for k, v in os.environ.items() if not k.startswith('SLOTSTREAM_')}

    def invoke(args):
        if args[0] not in ('doctor', 'prefill-schedule'):
            raise ValueError('window matrix forbids model-bearing commands')
        result = subprocess.run([str(binary), *args], env=env, capture_output=True, text=True, timeout=30)
        row = {'args': args, 'exit_code': result.returncode, 'stdout': result.stdout, 'stderr': result.stderr}
        report['commands'].append(row)
        if 'engine ready' in (result.stdout + result.stderr).lower():
            raise ValueError('unexpected model activity in metadata-only test')
        return row

    try:
        for window in WINDOWS:
            row = {'tokens': window, 'passed': False, 'schedules': [], 'live_inference_tested': False}
            report['windows'].append(row)
            planned = invoke(['doctor', '--sim-ram', '51.5', '--sim-working-set', '40.2', '--sim-available', '44',
                              '--mtp', 'off', '--vision', 'off', '--max-context', str(window), '--json'])
            if window <= PUBLIC_LIMIT:
                value = json.loads(planned['stdout'])
                if (planned['exit_code'] or value['max_context_tokens'] != window or value['implementation_context_limit'] != PUBLIC_LIMIT
                        or value['memory_ledger']['active_capacity_bytes'] != ((window + 1023) // 1024) * 1024 * 12 * 2304
                        or value['memory_ledger']['expected_peak_bytes'] > value['target_gb'] * 1e9):
                    raise ValueError('public planner did not preserve the requested window and byte ledger')
                row['public_configuration'] = 'accepted'
                row['active_capacity_bytes'] = value['memory_ledger']['active_capacity_bytes']
            else:
                if planned['exit_code'] == 0 or str(PUBLIC_LIMIT) not in planned['stderr']:
                    raise ValueError('unqualified public window was not explicitly refused')
                row['public_configuration'] = 'expected_refusal_above_qualified_limit'
            for start in sorted({0, window // 2 + 1, window - 1}):
                for chunk in (256, 4095, 4096):
                    count = window - start
                    result = invoke(['prefill-schedule', '--tokens', str(count), '--from', str(start), '--chunk', str(chunk), '--json'])
                    if result['exit_code']:
                        raise ValueError('schedule diagnostic failed')
                    observed = validate_schedule(json.loads(result['stdout']), count, start)
                    row['schedules'].append({'start': start, 'chunk': chunk, **observed})
            row['passed'] = True
        # Check the immediate public boundary separately from the larger windows.
        invalid = invoke(['doctor', '--sim-ram', '51.5', '--sim-working-set', '40.2', '--sim-available', '44',
                          '--mtp', 'off', '--vision', 'off', '--max-context', str(PUBLIC_LIMIT + 1), '--json'])
        if invalid['exit_code'] == 0 or str(PUBLIC_LIMIT) not in invalid['stderr']:
            raise ValueError('immediate public-limit overflow accepted')
        # Both a cold prompt and a continuation must respect the model ceiling.
        for count, start in [(MODEL_LIMIT + 1, 0), (1, MODEL_LIMIT)]:
            invalid = invoke(['prefill-schedule', '--tokens', str(count), '--from', str(start), '--json'])
            if invalid['exit_code'] == 0 or str(MODEL_LIMIT) not in invalid['stderr']:
                raise ValueError('model-limit overflow accepted')
        if source_snapshot() != before:
            raise ValueError('source changed during window checks')
        if any(digest(path) != identity[key] for path, key in artifacts):
            raise ValueError('candidate changed during window checks')
        report['passed'] = True
    except Exception as error:
        report['error'] = f'{type(error).__name__}: {error}'
    report['finished_at'] = datetime.now(timezone.utc).isoformat()
    (out / 'report.json').write_text(json.dumps(report, indent=2) + '\n')
    return report


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--binary', type=Path, required=True)
    p.add_argument('--out', type=Path, required=True)
    a = p.parse_args()
    result = run(a.binary, a.out)
    print(json.dumps({key: result.get(key) for key in ('passed', 'live_inference_tested', 'candidate_source_differences', 'error')}))
    for row in result['windows']:
        print(json.dumps({key: row.get(key) for key in ('tokens', 'passed', 'public_configuration', 'live_inference_tested')}))
    return 0 if result['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
