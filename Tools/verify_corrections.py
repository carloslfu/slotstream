#!/usr/bin/env python3
"""Recheck only the four delivery failures from full verification V68."""
import argparse
import json
import os
from pathlib import Path
import shutil
import socket
from prefill_bench import ROOT, digest, preflight, run_child, vm_snapshot
from serve_bench import verified_build
from memory_gate import check_memory
from long_context_gate import check_answer


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--binary', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--previous', type=Path, required=True)
    args = parser.parse_args()
    build = verified_build(args.binary)
    out = args.out.resolve(); out.mkdir(parents=True, exist_ok=False)
    env = {k: v for k, v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
    previous = args.previous.resolve()
    shutil.copy2(previous/'outputs/ssv_long.txt', out/'long-prompt.txt')
    sources = ['verify_corrections.py', 'verify.sh', 'api_robustness.sh', 'memory_gate.py',
               'long_context_gate.py', 'prefill_bench.py', 'serve_bench.py']
    record = {'classification': 'Targeted delivery correction of full V68, not a speed comparison',
        'build': build, 'previous': str(previous), 'memory_gb': 10,
        'required_reclaimable_gb': 13, 'experimental_controls': 'all default off',
        'long_prompt_sha256': digest(out/'long-prompt.txt'),
        'contract': 'Short and long requests explicitly sample physical footprint and retain the 10 GB process ceiling. Global macOS paging is diagnostic under the current functional-acceptance policy; historical V68 verdicts stay unchanged. The unchanged long source is passed through the normal non-thinking chat template, with the same 16-token allowance; require a completed standalone recalled value and at least 7000 prompt tokens. Repair Bash 3.2 empty optional arguments; run the complete API robustness script. Do not rerun passing V68 gates. No replacement or relaxed process-memory ceiling.',
        'source_hashes': {}, 'results': [], 'completed': False}
    for name in sources:
        path = ROOT/'Tools'/name; record['source_hashes'][name] = digest(path)
        shutil.copy2(path, out/name)
    (out/'protocol.json').write_text(json.dumps(record, indent=2)+'\n')
    try:
        for name in ['short-memory', 'long-memory-and-recall', 'api']:
            cell = out/name; cell.mkdir()
            result = {'name': name, 'before': preflight(13), 'gates': {}}
            child_env = env.copy()
            if name == 'api':
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1', 0)); port = reservation.getsockname()[1]
                child_env.update({'SLOTSTREAM_TEST_BINARY': build['binary'], 'SLOTSTREAM_TEST_LOG': str(cell/'server.log')})
                command = ['/bin/bash', str(ROOT/'Tools/api_robustness.sh'), str(port), '13']
            else:
                command = [build['binary'], 'run', '--memory-gb', '10', '--mtp', 'off', '--greedy',
                           '--sample-footprint', '--stats-json', str(cell/'stats.json')]
                command += ['--prompt-file', str(out/'long-prompt.txt'), '--max-tokens', '16'] if name.startswith('long') else [
                    '--prompt', 'Why is the sky blue?', '--max-tokens', '24']
            result['command'] = command
            print(json.dumps({'started': name}), flush=True)
            result['exit_code'] = run_child(command, child_env, cell, 900)
            if name == 'api': result['gates']['api'] = {'passed': result['exit_code'] == 0}
            elif result['exit_code'] == 0:
                payload = json.loads((cell/'stats.json').read_text())
                try: result['gates']['memory'] = check_memory(payload, 10)
                except (ValueError, KeyError, TypeError) as error:
                    result['gates']['memory'] = {'passed': False, 'error': str(error)}
                if name.startswith('long'):
                    try: result['gates']['recall'] = check_answer(payload, (cell/'stdout.txt').read_text(), 'SEVENTEEN', 7000, 16)
                    except (ValueError, KeyError, TypeError) as error:
                        result['gates']['recall'] = {'passed': False, 'error': str(error)}
            result['after'] = vm_snapshot()
            result['passed'] = result['exit_code'] == 0 and bool(result['gates']) and all(g['passed'] for g in result['gates'].values())
            (cell/'result.json').write_text(json.dumps(result, indent=2)+'\n')
            record['results'].append(result)
            print(json.dumps({'finished': name, 'gates': result['gates'], 'passed': result['passed']}), flush=True)
        record['completed'] = True
    finally:
        record['sources_unchanged'] = all(digest(ROOT/'Tools'/n) == v for n, v in record['source_hashes'].items())
        record['passed'] = record['completed'] and record['sources_unchanged'] and all(r['passed'] for r in record['results'])
        (out/'manifest.json').write_text(json.dumps(record, indent=2)+'\n')
    return 0 if record['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
