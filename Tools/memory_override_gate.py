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
            result = subprocess.run(command, env=env, text=True, capture_output=True, timeout=15)
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
            expect(automatic is not None and explicit is not None, f'64-GiB comparison refused/{mtp}/{context}')
            if automatic and explicit:
                expect(explicit['pool_slots'] > automatic['pool_slots'], f'48-GB target did not enlarge cache/{mtp}/{context}')
                expect(explicit['source'] == '--memory-gb', f'explicit source lost/{mtp}/{context}')
        for available in (8, 16, 32, 52, 60):
            p = plan(run(f'availability/{available}', ['--memory-gb', '48'], available=available))
            expect((p is not None) == (available >= 52), f'wrong physical-headroom decision/{available}')
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
        for flags in (['—memory-gb', '48'], ['--memory-gb', 'not-a-number']):
            row = run('malformed-flag', flags)
            expect(row['exit_code'] != 0 and row['result'] is None, 'malformed memory option silently ignored')

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
