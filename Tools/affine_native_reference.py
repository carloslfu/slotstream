#!/usr/bin/env python3
"""Bounded six-token affine-control reference, independent of the native port.

Preserves original folded norms and every upstream layer. Saves one hidden
point per layer and one complete vocabulary row. The existing affine parity
bound is frozen before native observations; residency within native is exact.
"""
import argparse
import gc
import hashlib
import json
import os
from pathlib import Path
import subprocess
import threading
import time

from affine_expert_reference import (Archive, architecture, load_model, identity,
                                    check_proof, NORMALIZATION, ARCH_SHA256, physical)
from affine_expert_control import digest
from context_qualification import quiet_preflight, verification_lock
from prefill_bench import vm_snapshot
from vq_dense_overlay import read_json

TOKENS = [9707, 11, 1246, 525, 498, 30]
CONTROL = 'af31bd191fbd82dc998fe29cae230c7f3e6977bd355c827bf42e643b7680f182'
RAW_BYTES = 48 * 6 * 10240 * 4 + 248320 * 4


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ('baseline', 'control', 'architecture', 'order-proof', 'protocol', 'out'):
        parser.add_argument('--' + name, type=Path, required=True)
    parser.add_argument('--protocol-sha256', required=True)
    parser.add_argument('--control-sha256', default=CONTROL)
    args = parser.parse_args()
    protocol = read_json(args.protocol, args.protocol_sha256)
    control_sha = args.control_sha256
    if len(control_sha) != 64 or any(c not in '0123456789abcdef' for c in control_sha):
        raise ValueError('exact lowercase control manifest SHA-256 required')
    instrument = identity(); own_sha = digest(__file__)
    if (protocol['control_manifest_sha256'] != control_sha or protocol['reference_instrument_sha256'] != instrument['sha256']
            or protocol['producer_sha256'] != own_sha or protocol['maximum_new_raw_f32_bytes'] != RAW_BYTES
            or protocol['relative_maximum_bound'] != 0.02 or protocol['maximum_model_process_bytes'] != 10_000_000_000
            or protocol['tokens'] != TOKENS or protocol['paid_compute_usd'] != 0):
        raise ValueError('requires the exact prospectively frozen native comparison protocol')
    proof_raw = args.order_proof.read_bytes()
    if hashlib.sha256(proof_raw).hexdigest() != protocol['order_proof_sha256']:
        raise ValueError('reference order proof changed')
    check_proof(json.loads(proof_raw), instrument, control_sha)
    if args.out.exists() or args.out.is_symlink() or not args.out.parent.is_dir():
        raise ValueError('reference output must be new with an existing parent')
    before = quiet_preflight(13)
    with verification_lock():
        args.out.mkdir(mode=0o700)
        record = {'schema': 1, 'complete': False, 'qualification': False, 'points': [],
                  'control_manifest_sha256': control_sha, 'normalization': NORMALIZATION, 'tokens': TOKENS,
                  'relative_maximum_bound': 0.02, 'protocol_sha256': args.protocol_sha256,
                  'instrument_sha256': instrument['sha256'], 'producer_sha256': own_sha,
                  'architecture_sha256': ARCH_SHA256, 'raw_f32_bytes': 0, 'before': before}
        def save():
            (args.out / 'receipt.json').write_text(json.dumps(record, indent=2) + '\n')
        save(); started = time.monotonic(); stopped = threading.Event(); archive = None; last_vm = -1.0
        def guard():
            nonlocal last_vm
            now = time.monotonic()
            if max(physical().values()) > 10_000_000_000 or now - started > 1800:
                raise RuntimeError('native reference process or time bound exceeded')
            if now - last_vm >= 1:
                if vm_snapshot()['reclaimable_bytes'] < 3_000_000_000:
                    raise RuntimeError('native reference lost real headroom')
                if subprocess.check_output(['sysctl', '-n', 'kern.memorystatus_vm_pressure_level'], text=True, timeout=5).strip() != '1':
                    raise RuntimeError('native reference OS memory pressure')
                last_vm = now
        def monitor():
            while not stopped.wait(.1):
                try: guard()
                except Exception as error:
                    (args.out / 'memory-refusal.json').write_text(json.dumps({'error': str(error)}) + '\n'); os._exit(99)
        watcher = threading.Thread(target=monitor, daemon=True); watcher.start()
        try:
            import mlx.core as mx
            import numpy as np
            mx.set_memory_limit(8_000_000_000); mx.set_cache_limit(128_000_000)
            archive = Archive(args.baseline, args.control, control_sha); archive.verify(guard)
            arch = architecture(args.architecture); model = load_model(archive, arch, prove_ple=False)
            core = model.model; caches = model.make_cache(); ids = mx.array([TOKENS], dtype=mx.int64)
            h = mx.tile(core.embed_tokens(ids), (1, 1, core.hc)); mx.eval(h)
            eos = core.args.eos_token_id; eos = eos[0] if isinstance(eos, list) else eos
            previous = mx.full((1, core.args.ngram_size - 1), eos, ids.dtype)
            def point(name, value, shape):
                array = np.array(value.astype(mx.float32), dtype='<f4')
                if list(array.shape) != shape or not np.isfinite(array).all():
                    raise ValueError('reference point is incomplete or nonfinite')
                raw = array.tobytes(); total = record['raw_f32_bytes'] + len(raw)
                if total > RAW_BYTES: raise ValueError('reference exceeded its raw reservation')
                with (args.out / name).open('xb') as handle:
                    handle.write(raw); handle.flush(); os.fsync(handle.fileno())
                record['points'].append({'path': name, 'shape': shape, 'bytes': len(raw), 'sha256': hashlib.sha256(raw).hexdigest()})
                record['raw_f32_bytes'] = total; save(); guard()
            for layer in range(48):
                guard(); block, cache = core.layers[layer], caches[layer]; mx.eval(block.parameters())
                linear = block.layer_type == 'linear_attention'
                mask = None if linear else arch.create_attention_mask(h, cache)
                conv = arch.create_ssm_mask(h, cache) if linear else None
                indexer = cache.indexer if hasattr(cache, 'indexer') else None
                h = block(h, core.rope, mask, conv, cache, indexer, ids, previous); mx.eval(h)
                point(f'layer_{layer}.f32', h, [1, 6, 10240])
                core.layers[layer] = None; caches[layer] = None
                del block, cache, mask, conv, indexer; gc.collect(); mx.clear_cache()
                print(json.dumps({'layer': layer, 'memory': physical()}), flush=True)
            logits = model.lm_head(core.hyper_connection_mixer(h)).astype(mx.float32); mx.eval(logits)
            point('logits.f32', logits[0, -1], [248320])
            if record['raw_f32_bytes'] != RAW_BYTES or len(record['points']) != 49:
                raise ValueError('reference did not produce the complete frozen fixture')
            archive.recheck()
            if identity()['sha256'] != instrument['sha256'] or digest(__file__) != own_sha:
                raise ValueError('reference source changed during execution')
            record.update(complete=True, seconds=time.monotonic() - started, process_memory=physical(), after=vm_snapshot())
            save(); print(json.dumps({'complete': True, 'raw_f32_bytes': RAW_BYTES, 'memory': record['process_memory']}))
        except BaseException as error:
            record['failure'] = type(error).__name__ + ': ' + str(error); save(); raise
        finally:
            stopped.set(); watcher.join(timeout=4)
            if archive is not None: archive.close()
            if watcher.is_alive(): raise RuntimeError('reference monitor did not drain')


if __name__ == '__main__':
    main()
