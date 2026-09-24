#!/usr/bin/env python3
"""Exercise public CLI memory overrides on simulated Macs; never load weights."""
import argparse
import hashlib
import itertools
import json
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--binary', type=Path, default=os.environ.get('SLOTSTREAM_TEST_BINARY', '.build/release/slotstream'))
    parser.add_argument('--out', type=Path)
    args = parser.parse_args()
    binary = args.binary.resolve()
    rows, failures = [], []
    env = {key: value for key, value in os.environ.items() if not key.startswith('SLOTSTREAM_')}
    with tempfile.TemporaryDirectory(prefix='memory-override-') as directory:
        # doctor only probes for the optional head's existence. This fixture
        # contains no weights and must never be handed to run or serve.
        model = Path(directory)
        (model / 'mtp.safetensors').touch()

        def run(label, flags, *, ram=64, available=None, context=32768, mtp='off'):
            physical = ram * 1024**3 / 1e9
            command = [str(binary), 'doctor', '--model', str(model), '--vision', 'off', '--json',
                       '--sim-ram', str(physical), '--sim-working-set', str(physical * .75),
                       '--sim-available', str(available if available is not None else physical * .9),
                       '--max-context', str(context), '--mtp', mtp, *flags]
            # The timeout only catches a hang: an absurd target such as 1e300 plans
            # for several seconds, and a loaded runner multiplies that.
            result = subprocess.run(command, env=env, text=True, capture_output=True, timeout=120)
            row = {'case': label, 'flags': flags, 'ram_gib': ram, 'available_gb': available,
                   'context': context, 'mtp': mtp, 'exit_code': result.returncode}
            try:
                value = json.loads(result.stdout)
            except ValueError:
                row['stderr'] = result.stderr
                value = None
            row['result'] = value
            rows.append(row)
            return row

        def expect(condition, message):
            if not condition: failures.append(message)

        def plan(row):
            value = row['result']
            if value is None:
                failures.append(row['case'] + ': missing structured result')
                return None
            if 'error' in value:
                expect(value['error']['code'] == 'insufficient_memory', row['case'] + ': unexpected refusal')
                return None
            expect(row['exit_code'] == 0, row['case'] + ': successful plan had failing exit')
            p = value.get('plan', value)
            ledger = p['memory_ledger']
            if p.get('target_gb') is not None:
                headroom = p['target_gb'] - ledger['expected_peak_bytes'] / 1e9
                expect(abs(p.get('planned_headroom_gb', -1) - headroom) <= .051,
                       row['case'] + ': displayed budget headroom does not reconcile')
            expect(ledger['pool_bytes'] == p['pool_slots'] * 2_764_800, row['case'] + ': pool bytes disagree with slots')
            expect(640 <= p['pool_slots'] <= 48 * 512, row['case'] + ': expert capacity out of bounds')
            if p['source'] == '--memory-gb':
                target = float(row['flags'][row['flags'].index('--memory-gb') + 1])
                expect(p['target_gb'] == target, row['case'] + ': override was silently changed')
                expect(ledger['expected_peak_bytes'] <= target * 1e9, row['case'] + ': plan exceeds target')
                expect(not p['availability_clamped'], row['case'] + ': explicit cache was silently clamped')
            return p

        for ram, target, context, mtp in itertools.product(
                (32, 48, 64, 96, 128), (10, 16, 24, 33, 48, 90), (8192, 32768, 65536), ('off', 'on', 'auto')):
            plan(run(f'matrix/{ram}/{target}/{context}/{mtp}', ['--memory-gb', str(target)],
                     ram=ram, context=context, mtp=mtp))
        for mtp, context in itertools.product(('off', 'on', 'auto'), (8192, 32768, 65536)):
            automatic = plan(run(f'auto/{mtp}/{context}', [], mtp=mtp, context=context))
            explicit = plan(run(f'explicit48/{mtp}/{context}', ['--memory-gb', '48'], mtp=mtp, context=context))
            adaptive = plan(run(f'adaptive48/{mtp}/{context}', ['--memory-limit-gb', '48'], mtp=mtp, context=context))
            expect(automatic is not None and explicit is not None, f'64-GiB comparison refused/{mtp}/{context}')
            expect(adaptive is not None, f'adaptive 48-GB comparison refused/{mtp}/{context}')
            if adaptive and explicit:
                expect(adaptive['pool_slots'] == explicit['pool_slots'] and adaptive['mtp'] == explicit['mtp'],
                       f'adaptive and fixed full budgets disagree/{mtp}/{context}')
            if automatic and explicit:
                expect(explicit['pool_slots'] > automatic['pool_slots'], f'48-GB target did not enlarge cache/{mtp}/{context}')
                expect(explicit['source'] == '--memory-gb', f'explicit source lost/{mtp}/{context}')
        for available in (8, 16, 32, 52, 60):
            p = plan(run(f'availability/{available}', ['--memory-gb', '48'], available=available))
            expect((p is not None) == (available >= 52), f'wrong physical-headroom decision/{available}')
        # Reported regression: an explicit 48 GB budget silently selected a
        # 262K window and sacrificed more than half the expert cache. The
        # clamped speed estimate above its measured cache range cannot price
        # that loss. Exercise the public default, not only explicit windows.
        for mtp in ('off', 'on', 'auto'):
            base = plan(run(f'context-baseline/{mtp}', ['--memory-gb', '48'], mtp=mtp))
            row = run(f'context-auto48/{mtp}', ['--memory-gb', '48'], context='auto', mtp=mtp)
            selected = plan(row)
            adaptive = plan(run(f'context-auto-adaptive48/{mtp}', ['--memory-limit-gb', '48'], context='auto', mtp=mtp))
            expect(adaptive is not None and adaptive['max_context_tokens'] == 32768
                   and adaptive.get('memory_limit_gb') == 48, f'adaptive automatic context lost ceiling/{mtp}')
            expect(base is not None and selected is not None, f'48 GB automatic context refused/{mtp}')
            if base and selected:
                expect(selected['pool_slots'] >= base['pool_slots'],
                       f'automatic context silently removed uncalibrated cache capacity/{mtp}')
                expect(selected['max_context_tokens'] == 32768, f'48 GB default window regression/{mtp}')
                expect(selected.get('memory_target_semantics') == 'process_budget_not_allocation_goal',
                       f'memory target semantics missing/{mtp}')
                candidates = row['result'].get('automatic_context_window', {}).get('candidates', [])
                expect(len(candidates) == 4, f'missing automatic context tradeoffs/{mtp}')
                for candidate in candidates[1:]:
                    expect(not candidate['accepted'] and 'unmeasured' in candidate['reason'],
                           f'uncalibrated cache loss not explained/{mtp}/{candidate["window"]}')
                    expect(candidate.get('relative_request_cost') is None,
                           f'uncalibrated cache loss reported as a known cost/{mtp}/{candidate["window"]}')
                ledger = selected['memory_ledger']
                expect(selected.get('non_cache_allowance_bytes') == ledger['expected_peak_bytes'] - ledger['pool_bytes'],
                       f'memory breakdown does not reconcile/{mtp}')
            for context in (65536, 131072, 262144):
                explicit = plan(run(f'context-manual48/{mtp}/{context}', ['--memory-gb', '48'], context=context, mtp=mtp))
                expect(explicit is not None and explicit['max_context_tokens'] == context,
                       f'explicit context override stopped working/{mtp}/{context}')
        for flags, source in [
            (['--memory-gb', '48', '--pool-gb', '24'], '--pool-gb'),
            (['--memory-gb', '48', '--pool-gb', '24', '--experts-per-layer', '40'], '--experts-per-layer'),
            (['--memory-gb', '48', '--max-ram-percent', '1'], '--memory-gb'),
        ]:
            p = plan(run('precedence/' + source, flags))
            expect(p is not None and p['source'] == source, 'incorrect explicit knob precedence/' + source)
            if p:
                expect(any('ignored' in note for note in p.get('notes', [])), 'missing precedence diagnostic/' + source)
        for value in ('0', '-1', 'nan', 'inf', '-inf', '1e300'):
            row = run('invalid/' + value, ['--memory-gb', value])
            expect(row['exit_code'] != 0 or (row['result'] and 'error' in row['result']), 'invalid size accepted/' + value)
            expect(row['exit_code'] >= 0 and 'Fatal error' not in row.get('stderr', ''), 'invalid size trapped/' + value)
        for limit in (8.15, 9.99, 12.345678901234, 48.123456789):
            p = plan(run(f'fractional-ceiling/{limit}', ['--memory-limit-gb', str(limit)]))
            expect(p is not None and p['target_gb'] == limit and p['memory_limit_gb'] == limit,
                   f'fractional policy values rounded/{limit}')
        for ram, limit, available in itertools.product((16, 32, 48, 64, 128), (10, 33, 48, 64), (8, 18, 60)):
            physical = ram * 1024**3 / 1e9
            available = min(available, physical * .9)
            row = run(f'adaptive/{ram}/{limit}/{available}', ['--memory-limit-gb', str(limit)],
                      ram=ram, available=available)
            p = plan(row)
            if p:
                expect(p['source'] == 'auto' and p.get('memory_limit_gb') == limit, row['case'] + ': lost adaptive ceiling')
                expect(p['target_gb'] <= limit, row['case'] + ': exceeded user ceiling')
                peak = p['memory_ledger']['expected_peak_bytes'] / 1e9
                expect(peak <= min(limit, physical * .75, available - max(1.5, physical * .05)),
                       row['case'] + ': exceeded physical budget')
            if ram == 64 and limit == 48 and available == 60:
                expect(p is not None and p['target_gb'] == 48, 'adaptive 48 GB still capped at 33')
        for value in ('0', '-1', 'nan', 'inf', '-inf'):
            row = run('invalid-adaptive/' + value, ['--memory-limit-gb', value])
            expect(row['exit_code'] != 0, row['case'] + ': accepted')
        for flags in (['--memory-gb', '20'], ['--pool-gb', '10'], ['--experts-per-layer', '40']):
            row = run('adaptive-conflict/' + flags[0], ['--memory-limit-gb', '48', *flags])
            expect(row['exit_code'] != 0, row['case'] + ': ambiguous controls accepted')
        for flags in (['—memory-gb', '48'], ['--memory-gb', 'not-a-number']):
            row = run('malformed-flag', flags)
            expect(row['exit_code'] != 0 and row['result'] is None, 'malformed memory option silently ignored')
        for available in (18, 60):
            command = [str(binary), 'doctor', '--model', str(model), '--vision', 'off', '--mtp', 'off',
                       '--sim-ram', str(64 * 1024**3 / 1e9), '--sim-working-set', str(48 * 1024**3 / 1e9),
                       '--sim-available', str(available), '--max-context', '32768', '--memory-limit-gb', '48']
            result = subprocess.run(command, env=env, text=True, capture_output=True, timeout=120)
            label = f'text-diagnostics/{available}'
            rows.append({'case': label, 'exit_code': result.returncode, 'stdout': result.stdout, 'stderr': result.stderr})
            expect(result.returncode == 0 and '--memory-limit-gb G' in result.stdout,
                   label + ': adaptive control missing from help')
            row48 = next((line for line in result.stdout.splitlines() if line.strip().startswith('48.0 GB')), '')
            expect(bool(row48) and ('more than is reclaimable' in row48) == (available == 18),
                   label + ': comparison table disagrees with startup headroom')
            row73 = next((line for line in result.stdout.splitlines() if line.strip().startswith('73.0 GB')), '')
            expect('Metal working set' in row73, label + ': table presents an unsupported budget as usable')
        fixed_diagnostics = [
            ('parity', ['--tokens', '0']), ('elastic-check', []), ('prefix-check', []),
            ('sweep-check', []), ('optimization-state-check', []), ('vision-parity', []),
            ('mtp-parity', []), ('mtp-fixture-inputs', []), ('ngram-golden', ['--tokens', '0']),
            ('dequant-golden', []), ('template-check', []), ('prefix-exact-check', []),
        ]
        for command, extra in fixed_diagnostics:
            result = subprocess.run([str(binary), command, '--model', str(model), '--memory-limit-gb', '10', *extra],
                                    env=env, text=True, capture_output=True, timeout=15)
            rows.append({'case': 'fixed-diagnostic/' + command, 'exit_code': result.returncode, 'stderr': result.stderr})
            expect(result.returncode != 0 and '--memory-limit-gb' in result.stderr
                   and ('does not apply' in result.stderr or 'requires --plan' in result.stderr),
                   command + ': silently accepted a ceiling its fixed profile ignores')
        for flags in (['--memory-limit-gb', 'nan'], ['--memory-limit-gb', '0'],
                      ['--memory-limit-gb', '10', '--memory-gb', '10']):
            result = subprocess.run([str(binary), 'launch', *flags, '--dry-run', 'codex'],
                                    env=env, text=True, capture_output=True, timeout=15)
            rows.append({'case': 'launch-invalid/' + '/'.join(flags), 'exit_code': result.returncode, 'stderr': result.stderr})
            expect(result.returncode != 0 and '--memory-limit-gb' in result.stderr
                   and 'Unknown option' not in result.stderr, 'launch did not validate the adaptive option')

    report = {'passed': not failures, 'model_loaded': False, 'hardware_qualified': False,
              'binary_sha256': hashlib.sha256(binary.read_bytes()).hexdigest(),
              'cases': len(rows), 'failures': failures, 'results': rows}
    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(json.dumps(report, indent=2, sort_keys=True) + '\n')
    print(json.dumps({key: value for key, value in report.items() if key != 'results'}, indent=2))
    return 0 if report['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
