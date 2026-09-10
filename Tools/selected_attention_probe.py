#!/usr/bin/env python3
"""Fixed-input D256 kernel experiment extracted from a frozen source archive.
This measures a component, never a request or an inference-quality result.
"""
import argparse
import hashlib
import importlib.metadata
import json
from pathlib import Path
import re
import shutil
import statistics
import tarfile
import textwrap
import time

import mlx.core as mx
import numpy as np
from prefill_bench import digest, preflight, vm_snapshot


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--candidate', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    args.out.mkdir(parents=True, exist_ok=False)
    version = importlib.metadata.version('mlx')
    if version != '0.31.1': raise ValueError('requires pinned MLX 0.31.1')
    identity = json.loads((args.candidate/'build-identity.json').read_text())
    archive = args.candidate/'build-source.tar.gz'
    if digest(archive) != identity['source_archive_sha256']: raise ValueError('source archive identity mismatch')
    name = 'Sources/Slotstream/SelectedAttention.swift'
    with tarfile.open(archive) as tar: swift = tar.extractfile(name).read()
    if hashlib.sha256(swift).hexdigest() != identity['source'][name]: raise ValueError('kernel source identity mismatch')
    source = textwrap.dedent(re.search(r'source: """(.*?)"""', swift.decode(), re.S).group(1))
    (args.out/'SelectedAttention.swift').write_bytes(swift)
    (args.out/'kernel.metal').write_text(source)
    shutil.copy2(__file__, args.out/Path(__file__).name)
    record = {'classification': 'fixed-input exploratory component performance only', 'identity': identity,
              'mlx': version, 'probe_sha256': digest(Path(__file__)), 'shapes': [],
              'contract': 'Five interleaved AB/BA rounds, five completed calls per arm, two warmups. Fixed BF16 B1 H24 HK2 D256 inputs. Any global swap excludes a whole pair; no replacement. Observe MLX allocator peak separately from process footprint. This cannot establish request benefit, energy, tail latency or model quality.'}
    mx.set_cache_limit(128 << 20)
    kernel = mx.fast.metal_kernel(name='slotstream_selected_attention_frozen_probe',
        input_names=['query', 'key', 'value', 'blocks', 'metadata'], output_names=['output'], source=source)
    rng = np.random.default_rng(26090515)
    try:
        record['before'] = preflight(7)
        for s, n, sparse in [(256, 256, False), (256, 2048, False), (256, 8192, True)]:
            q = mx.array(rng.standard_normal((1, 24, s, 256)).astype(np.float32)).astype(mx.bfloat16)
            k = mx.array(rng.standard_normal((1, 2, n, 256)).astype(np.float32)).astype(mx.bfloat16)
            v = mx.array(rng.standard_normal((1, 2, n, 256)).astype(np.float32)).astype(mx.bfloat16)
            base = n-s
            mask = np.zeros((1, 1, s, n), dtype=np.bool_)
            if sparse:
                ids = np.stack([rng.choice(n//4, 512, replace=False) for _ in range(s)]).astype(np.int32)
                for row in range(s):
                    for block in ids[row]:
                        if block*4+3 <= base+row: mask[0, 0, row, block*4:block*4+4] = True
                    own = ((base+row+1)//4)*4
                    mask[0, 0, row, own:base+row+1] = True
                blocks = mx.array(ids[None])
            else:
                for row in range(s): mask[0, 0, row, :base+row+1] = True
                blocks = mx.array([0], dtype=mx.int32)
            array_mask = mx.array(mask)
            metadata = mx.array([s, n, 24, 2, base, 512 if sparse else 0], dtype=mx.int32)
            mx.eval(q, k, v, blocks, metadata, array_mask)
            input_hashes = [hashlib.sha256(np.array(x.astype(mx.float32)).tobytes()).hexdigest() for x in [q,k,v]]
            def run(candidate):
                if not candidate:
                    return mx.fast.scaled_dot_product_attention(q, k, v, scale=1/16,
                        mask=array_mask if sparse else 'causal')
                return kernel(inputs=[q,k,v,blocks,metadata], template=[('InT', mx.bfloat16)],
                    grid=(q.size,1,1), threadgroup=(256,1,1), output_shapes=[q.shape], output_dtypes=[q.dtype])[0]
            for candidate in [False, True]:
                for _ in range(2): mx.eval(run(candidate))
            rounds = []
            for r in range(5):
                cells = []
                for candidate in [False, True] if r%2 == 0 else [True, False]:
                    before = vm_snapshot(); mx.reset_peak_memory(); start = time.monotonic()
                    for _ in range(5): mx.eval(run(candidate))
                    elapsed = (time.monotonic()-start)/5
                    after = vm_snapshot()
                    cells.append({'candidate':candidate, 'seconds':elapsed,
                        'mlx_peak_bytes':max(mx.get_peak_memory(),mx.get_active_memory()),
                        'swap_delta':{key:after[key]-before[key] for key in ['swapins','swapouts']}})
                valid = all(not any(c['swap_delta'].values()) for c in cells)
                by_arm = {c['candidate']:c for c in cells}
                rounds.append({'round':r+1,'cells':cells,'valid':valid,
                    'reduction':1-by_arm[True]['seconds']/by_arm[False]['seconds']})
            valid = [r['reduction'] for r in rounds if r['valid']]
            record['shapes'].append({'s':s,'n':n,'sparse':sparse,'input_sha256':input_hashes,
                'rounds':rounds,'valid_pairs':len(valid),'median_reduction':statistics.median(valid) if valid else None})
            (args.out/'result.json').write_text(json.dumps(record,indent=2)+'\n')
        record['completed'] = True
    finally:
        record['after'] = vm_snapshot()
        (args.out/'result.json').write_text(json.dumps(record,indent=2)+'\n')
    print(json.dumps([{k:v for k,v in row.items() if k not in ['rounds','input_sha256']} for row in record['shapes']]))


if __name__ == '__main__': main()
