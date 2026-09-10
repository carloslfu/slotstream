#!/usr/bin/env python3
"""Bounded target-machine resource gates preceding the context capacity ladder."""
import json
import os
from pathlib import Path
import time

from context_qualification import quiet_preflight
from prefill_bench import digest, run_child, vm_snapshot


def validate_receipt(name, text, exit_code):
    if exit_code != 0 or 'SKIP' in text:
        raise ValueError('required resource diagnostic did not complete')
    prefix = 'ELASTIC DRILL MEMORY ' if name == 'governor' else 'MTP CHECK MEMORY '
    receipts = [json.loads(line[len(prefix):]) for line in text.splitlines() if line.startswith(prefix)]
    if len(receipts) != 1:
        raise ValueError('missing unique structured resource receipt')
    r = receipts[0]
    if name == 'governor':
        ids = r.get('output_ids')
        if ('ELASTIC DRILL PASS:' not in text or r.get('complete') is not True
                or r.get('ceiling_gb') != 13 or type(r.get('target_gb')) not in (int, float)
                or not 0 < r['target_gb'] <= 13 or not isinstance(ids, list) or len(ids) < 3
                or any(not isinstance(row, list) or not row or row != ids[0]
                       or any(type(token) is not int or not 0 <= token < 248320 for token in row) for row in ids)):
            raise ValueError('governor completion or resize equality failed')
        limit = 13
    elif name == 'mtp-vision':
        if ('MTP CHECK PASS' not in text or r.get('memory_validated') is not True or r.get('target_gb') != 12
                or 'PASS  vision speculation deterministic' not in text or 'PASS  vision speculation ran' not in text):
            raise ValueError('required MTP/vision path did not complete')
        limit = 12
    else:
        raise ValueError('unknown resource gate')
    for key in ('samples', 'sampled_peak_bytes', 'physical_footprint_end_bytes', 'lifetime_rss_peak_bytes'):
        if type(r.get(key)) is not int or r[key] <= 0:
            raise ValueError('invalid physical memory observation: ' + key)
    if max(r[k] for k in ('sampled_peak_bytes', 'physical_footprint_end_bytes', 'lifetime_rss_peak_bytes')) > limit * 1e9:
        raise ValueError('physical memory exceeded the fixed resource ceiling')
    for key in ('swapins', 'swapouts'):
        before, after = r.get(key + '_before'), r.get(key + '_after')
        if type(before) is not int or before < 0 or type(after) is not int or before != after:
            raise ValueError('invalid VM observation or swap activity')
    return r


def run(binary, model, image, out):
    out.mkdir(parents=True, exist_ok=False)
    env = {k: v for k, v in os.environ.items() if not k.startswith('SLOTSTREAM_')}
    result = {'passed': False, 'kind': 'context-native-resource', 'cases': []}
    steps = [
        ('governor', ['elastic-drill', '--slots', '1000', '--max-memory-gb', '13'], 16, 600),
        ('mtp-vision', ['mtp-check', '--memory-gb', '12', '--mtp', 'on', '--vision', 'on', '--image', str(image)], 15, 900),
    ]
    for name, args, need, timeout in steps:
        cell = out / name
        cell.mkdir()
        row = {'name': name, 'passed': False, 'command': [str(binary), *args, '--model', str(model)]}
        result['cases'].append(row)
        try:
            row['before'] = quiet_preflight(need)
            row['exit_code'] = run_child(row['command'], env, cell, timeout)
            text = (cell / 'stdout.txt').read_text() + (cell / 'stderr.txt').read_text()
            row['receipt'] = validate_receipt(name, text, row['exit_code'])
            row['after'] = vm_snapshot()
            if any(row['before'][key] != row['after'][key] for key in ('swapins', 'swapouts')):
                raise ValueError('swap activity across complete resource interval')
            row['passed'] = True
        except Exception as error:
            row['error'] = f'{type(error).__name__}: {error}'
        finally:
            for name in ('stdout.txt', 'stderr.txt'):
                if (cell / name).exists():
                    row[name + '_sha256'] = digest(cell / name)
            (cell / 'manifest.json').write_text(json.dumps(row, indent=2) + '\n')
            result['passed'] = all(row['passed'] for row in result['cases']) and len(result['cases']) == len(steps)
            (out / 'manifest.json').write_text(json.dumps(result, indent=2) + '\n')
        if not row['passed']:
            break
    return result
