#!/usr/bin/env python3
"""Independent bounded autoregressive reference for the affine expert control.

The upstream architecture and original folded norms remain unchanged. Each
layer is released after its state is materialized. Only the final vocabulary
row per step is stored; generated IDs, layer hashes and resource receipts bind
the genuinely self-fed sequence without retaining model weights in memory.
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

CONTROL = 'af31bd191fbd82dc998fe29cae230c7f3e6977bd355c827bf42e643b7680f182'
PROFILE = '8e9ffd40c71d34bca08a55e7af55fda8ac7d45429f3ff7febef077d31bface7c'
RAW_BYTES = 16 * 248320 * 4


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ('baseline', 'control', 'architecture', 'order-proof', 'profile', 'protocol', 'out'):
        parser.add_argument('--' + name, type=Path, required=True)
    parser.add_argument('--protocol-sha256', required=True)
    args = parser.parse_args()
    protocol = read_json(args.protocol, args.protocol_sha256)
    instrument = identity(); own_sha = digest(__file__)
    profile = read_json(args.profile, PROFILE)
    if (protocol['control_manifest_sha256'] != CONTROL
            or protocol['reference_instrument_sha256'] != instrument['sha256']
            or protocol['producer_sha256'] != own_sha
            or protocol['maximum_new_raw_f32_bytes'] != RAW_BYTES
            or protocol['relative_maximum_bound'] != 0.02
            or protocol['maximum_model_process_bytes'] != 10_000_000_000
            or protocol['profile_sha256'] != PROFILE or protocol['paid_compute_usd'] != 0
            or profile['max_new_tokens'] != 16 or profile['minimum_steps'] != 8
            or len(profile['prompt']) != 44 or profile['sampling'] != 'argmax-first-index'):
        raise ValueError('requires the frozen bounded affine generation protocol')
    proof_raw = args.order_proof.read_bytes()
    if hashlib.sha256(proof_raw).hexdigest() != protocol['order_proof_sha256']:
        raise ValueError('reference order proof changed')
    check_proof(json.loads(proof_raw), instrument, CONTROL)
    if args.out.exists() or args.out.is_symlink() or not args.out.parent.is_dir():
        raise ValueError('reference output must be new with an existing parent')
    before = quiet_preflight(13)
    with verification_lock():
        args.out.mkdir(mode=0o700)
        record = {'schema': 1, 'complete': False, 'qualification': False, 'steps': [],
                  'control_manifest_sha256': CONTROL, 'normalization': NORMALIZATION,
                  'profile': profile, 'profile_sha256': PROFILE, 'generated': [],
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
                raise RuntimeError('affine generation reference process or time bound exceeded')
            if now - last_vm >= 1:
                if vm_snapshot()['reclaimable_bytes'] < 3_000_000_000:
                    raise RuntimeError('affine generation reference lost real headroom')
                if subprocess.check_output(['sysctl', '-n', 'kern.memorystatus_vm_pressure_level'], text=True, timeout=5).strip() != '1':
                    raise RuntimeError('affine generation reference OS memory pressure')
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
            archive = Archive(args.baseline, args.control, CONTROL); archive.verify(guard)
            arch = architecture(args.architecture); caches = None
            history = mx.full((1, 2), 248044, mx.int64)
            ids = list(profile['prompt'])
            for step in range(16):
                guard(); model = load_model(archive, arch, prove_ple=False); core = model.model
                if caches is None: caches = model.make_cache()
                tokens = mx.array([ids], dtype=mx.int64)
                h = mx.tile(core.embed_tokens(tokens), (1, 1, core.hc)); mx.eval(h)
                points = []
                for layer in range(48):
                    guard(); block, cache = core.layers[layer], caches[layer]; mx.eval(block.parameters())
                    linear = block.layer_type == 'linear_attention'
                    mask = None if linear else arch.create_attention_mask(h, cache)
                    conv = arch.create_ssm_mask(h, cache) if linear else None
                    indexer = cache.indexer if hasattr(cache, 'indexer') else None
                    h = block(h, core.rope, mask, conv, cache, indexer, tokens, history)
                    state = [cache[0], cache[1]] if linear else [cache.keys, cache.values, cache.indexer.keys]
                    if layer == 1: state.append(cache[2])
                    mx.eval(h, *state)
                    if not bool(mx.all(mx.isfinite(h)).item()): raise ValueError('nonfinite generated hidden state')
                    points.append({'layer': layer, 'shape': list(h.shape), 'sha256': hashlib.sha256(np.array(h.astype(mx.float32), dtype='<f4').tobytes()).hexdigest()})
                    core.layers[layer] = None
                    del block, cache, mask, conv, indexer, state; gc.collect(); mx.clear_cache()
                logits = model.lm_head(core.hyper_connection_mixer(h)).astype(mx.float32); mx.eval(logits)
                row = np.array(logits[0, -1], dtype='<f4')
                if row.shape != (248320,) or not np.isfinite(row).all(): raise ValueError('invalid generated vocabulary row')
                sampled = int(mx.argmax(logits[0, -1]).item())
                raw = row.tobytes(); name = f'logits-{step:02d}.f32'
                if record['raw_f32_bytes'] + len(raw) > RAW_BYTES: raise ValueError('reference exceeded its raw reservation')
                with (args.out / name).open('xb') as handle:
                    handle.write(raw); handle.flush(); os.fsync(handle.fileno())
                record['raw_f32_bytes'] += len(raw)
                record['steps'].append({'step': step, 'input_ids': ids, 'sampled': sampled, 'points': points,
                    'logits': {'path': name, 'shape': [248320], 'bytes': len(raw), 'sha256': hashlib.sha256(raw).hexdigest()}})
                record['generated'].append(sampled)
                history = mx.concatenate([history, tokens], axis=1)[:, -2:]; mx.eval(history)
                del model, core, h, logits, tokens, row; gc.collect(); mx.clear_cache(); guard(); save()
                print(json.dumps({'step': step, 'sampled': sampled, 'memory': physical()}), flush=True)
                if sampled == profile['eos_token_id']: break
                ids = [sampled]
            if len(record['steps']) < profile['minimum_steps']:
                raise ValueError('generation stopped before the frozen minimum coverage')
            archive.recheck()
            if identity()['sha256'] != instrument['sha256'] or digest(__file__) != own_sha or digest(args.profile) != PROFILE:
                raise ValueError('reference source or profile changed during execution')
            record.update(complete=True, seconds=time.monotonic() - started, process_memory=physical(),
                          consumed_tokens=len(profile['prompt']) + len(record['generated']) - 1, after=vm_snapshot())
            save(); print(json.dumps({'complete': True, 'generated': record['generated'], 'raw_f32_bytes': record['raw_f32_bytes']}))
        except BaseException as error:
            record['failure'] = type(error).__name__ + ': ' + str(error); save(); raise
        finally:
            stopped.set(); watcher.join(timeout=4)
            if archive is not None: archive.close()
            if watcher.is_alive(): raise RuntimeError('reference monitor did not drain')


if __name__ == '__main__':
    main()
