#!/usr/bin/env python3
"""Run a bounded native diagnostic against a frozen, verified executable."""
import argparse
import json
import os
from pathlib import Path
import time
from prefill_bench import digest, preflight, run_child, vm_snapshot


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--binary', type=Path, required=True)
    p.add_argument('--out', type=Path, required=True)
    p.add_argument('--required-gb', type=float, default=13)
    p.add_argument('--timeout', type=int, default=600)
    p.add_argument('--wait-for-model-seconds', type=int, default=0,
                   help='Wait before the single diagnostic attempt when another model holds the lock')
    p.add_argument('--result-key', choices=['passed', 'fits'], default='passed')
    p.add_argument('command', nargs=argparse.REMAINDER)
    a = p.parse_args()
    if a.required_gb < 7 or not 1 <= a.timeout <= 1800 or not 0 <= a.wait_for_model_seconds <= 1800:
        p.error('required headroom must be at least 7 GB and timeout 1..1800 s')
    binary = a.binary.resolve()
    identity = json.loads((binary.parent/'build-identity.json').read_text())
    for file, key in [(binary, 'binary_sha256'), (binary.parent/'mlx.metallib', 'metallib_sha256'),
                      (binary.parent/'build-source.tar.gz', 'source_archive_sha256')]:
        if digest(file) != identity[key]: raise ValueError(f'frozen identity mismatch: {file}')
    command = a.command[1:] if a.command[:1] == ['--'] else a.command
    if not command: p.error('a diagnostic command is required')
    a.out.mkdir(parents=True, exist_ok=False)
    env = os.environ.copy()
    record = {'binary':str(binary), 'identity':identity, 'required_reclaimable_gb':a.required_gb,
              'timeout_seconds':a.timeout, 'command':[str(binary), *command],
              'environment':{k:v for k,v in env.items() if k.startswith('SLOTSTREAM_')},
              'classification':'correctness only; not timing evidence', 'passed':False}
    started = time.monotonic()
    try:
        waiting = time.monotonic(); attempts = 0; notified = -30.0
        while True:
            attempts += 1
            try:
                record['before'] = preflight(a.required_gb)
                break
            except RuntimeError as error:
                elapsed = time.monotonic()-waiting
                if 'another model process holds the lock' not in str(error) or elapsed >= a.wait_for_model_seconds:
                    raise
                if elapsed-notified >= 30:
                    print(json.dumps({'phase':'waiting for other model to finish','seconds':round(elapsed,1)}),flush=True)
                    notified = elapsed
                time.sleep(min(2,a.wait_for_model_seconds-elapsed))
        record['preflight_wait'] = {'seconds':time.monotonic()-waiting,'attempts':attempts,
                                    'limit_seconds':a.wait_for_model_seconds}
        record['exit_code'] = run_child(record['command'], env, a.out, a.timeout)
        if '--json' in command:
            report = json.loads((a.out/'stdout.txt').read_text())
            record['result_key'] = a.result_key
            record['passed'] = record['exit_code'] == 0 and report.get(a.result_key) is True
            record['assertions'] = len(report.get('items', []))
        else: record['passed'] = record['exit_code'] == 0
    except Exception as e:
        record['error'] = f'{type(e).__name__}: {e}'
    finally:
        record['duration_seconds'] = time.monotonic() - started
        record['after'] = vm_snapshot()
        (a.out/'manifest.json').write_text(json.dumps(record, indent=2)+'\n')
    print(json.dumps({k:v for k,v in record.items() if k in ('passed','assertions','error','duration_seconds')}), flush=True)
    return 0 if record['passed'] else 1


if __name__ == '__main__': raise SystemExit(main())
