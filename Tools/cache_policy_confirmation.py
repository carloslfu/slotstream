#!/usr/bin/env python3
"""Fresh trace screen for the floor-only layer-local replacement hypothesis.

No cache policy is enabled in inference. Replayed CLOCK must first reproduce
the real process's exact physical decode-record count, including prefill warmth.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import struct
from cache_policy_probe import Cache, RECORD_BYTES
from prefill_bench import preflight, run_child, model_identity, digest
from serve_bench import verified_build

PROMPTS = {
    'compiler': 'Write a detailed explanation of how a compiler detects syntax errors and reports line numbers.',
    'containers': 'Explain how a queue differs from a stack. Illustrate both with a short sequence of insertions and removals.',
}


def parse_trace(raw):
    if len(raw) > 1_000_000:
        raise ValueError('trace exceeds the fixed bounded request')
    calls = []
    offset = 0
    while offset < len(raw):
        if len(raw) - offset < 12:
            raise ValueError('incomplete trace header')
        layer, tokens, top_k = struct.unpack_from('<iii', raw, offset)
        offset += 12
        if layer != len(calls) % 48 or not 1 <= tokens <= 256 or top_k != 10:
            raise ValueError('unexpected layer or routing shape')
        count = tokens * top_k
        if len(raw) - offset < count * 2:
            raise ValueError('incomplete trace payload')
        ids = struct.unpack_from('<' + 'h' * count, raw, offset)
        offset += count * 2
        if min(ids) < 0 or max(ids) >= 512:
            raise ValueError('invalid expert ID')
        calls.append((layer, tokens, ids))
    if len(calls) < 96 or len(calls) % 48 or any(tokens != 1 for _, tokens, _ in calls[48:]):
        raise ValueError('expected one bounded prefill followed by complete decode passes')
    return calls


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--binary', type=Path, required=True)
    parser.add_argument('--model', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    a = parser.parse_args()
    build = verified_build(a.binary)
    a.out = a.out.resolve()
    a.out.mkdir(exist_ok=False, parents=True)
    sources = [Path(__file__), Path(__file__).with_name('cache_policy_probe.py'),
               Path(__file__).with_name('prefill_bench.py'), Path(__file__).with_name('serve_bench.py')]
    manifest = {'classification': 'fresh reference routing and offline floor-only cache hypothesis; not latency evidence',
                'build': build, 'model': model_identity(a.model.resolve()), 'prompts': PROMPTS,
                'slots': 640, 'memory_gb': 8.1, 'max_output_tokens': 64,
                'proposal': 'At exactly 640 slots, prefer empty then unpinned current-layer records; use CLOCK at every other capacity. No frequency counters or future routing inputs.',
                'gate': 'Both fresh prompts must produce at least sixteen decode passes, exact reference replay record counts and at least five percent fewer candidate physical decode records. No replacements or policy changes.'}
    manifest['sources'] = {p.name: digest(p) for p in sources}
    for source in sources:
        (a.out/source.name).write_bytes(source.read_bytes())
    (a.out/'manifest.json').write_text(json.dumps(manifest, indent=2)+'\n')
    rows = []
    for name, prompt in PROMPTS.items():
        cell = a.out/name
        cell.mkdir()
        (cell/'prompt.txt').write_text(prompt+'\n')
        command = [build['binary'], 'run', '--model', str(a.model.resolve()), '--memory-gb', '8.1',
                   '--mtp', 'off', '--prompt-file', str(cell/'prompt.txt'), '--greedy', '--seed', '7',
                   '--max-tokens', '64', '--stats-json', str(cell/'stats.json'), '--sample-footprint']
        env = {k: v for k, v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        env |= {'SLOTSTREAM_ROUTER_TRACE': str(cell/'trace.bin'), 'SLOTSTREAM_PREFILL_CHUNK': '256',
                'SLOTSTREAM_PREFIX_CACHE': '0', 'SLOTSTREAM_OPT_COMPACT_STATE': '1', 'SLOTSTREAM_OPT_FINAL_FORWARD': '1'}
        row = {'name': name, 'command': command, 'environment': {k: v for k, v in env.items() if k.startswith('SLOTSTREAM_')}}
        row['preflight'] = preflight(11.1)
        row['exit_code'] = run_child(command, env, cell, 180)
        if row['exit_code']:
            (cell/'result.json').write_text(json.dumps(row, indent=2)+'\n')
            raise RuntimeError('reference trace generation failed')
        payload = json.loads((cell/'stats.json').read_text())
        calls = parse_trace((cell/'trace.bin').read_bytes())
        row['trace_sha256'] = digest(cell/'trace.bin')
        row['decode_passes'] = len(calls) // 48 - 1
        row['model_decode_records'] = payload['stats']['decodeRecords']
        for arm in ['reference', 'candidate']:
            cache = Cache(640, False, layer_local=arm == 'candidate')
            records = [cache.request(layer, ids) for layer, _, ids in calls]
            row[arm] = {'prefill_records': sum(records[:48]), 'decode_records': sum(records[48:]),
                        'by_call': records}
        row['reference_exact'] = row['reference']['decode_records'] == row['model_decode_records']
        row['record_reduction'] = 1 - row['candidate']['decode_records'] / row['reference']['decode_records']
        row['passed'] = row['decode_passes'] >= 16 and row['reference_exact'] and row['record_reduction'] >= .05
        (cell/'result.json').write_text(json.dumps(row, indent=2)+'\n')
        rows.append(row)
        print({k: row[k] for k in ['name', 'decode_passes', 'model_decode_records', 'reference_exact', 'record_reduction', 'passed']}, flush=True)
    passed = all(row['passed'] for row in rows)
    (a.out/'completion.json').write_text(json.dumps({'passed': passed, 'cells': len(rows)})+'\n')
    return 0 if passed else 1


if __name__ == '__main__':
    raise SystemExit(main())
