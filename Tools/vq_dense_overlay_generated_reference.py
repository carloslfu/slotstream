#!/usr/bin/env python3
"""Bounded greedy reference for the independently identified dense composite.

One dense/expert layer is materialized at a time. All retained state is
explicitly evaluated before releasing that layer. This is a numerical check,
not the product runtime, a held-out quality result or a throughput benchmark.
"""
import argparse
import gc
import hashlib
import json
from pathlib import Path

from context_qualification import quiet_preflight, verification_lock
from vq_execution_profile import add_runtime_argument, recheck_runtime, select_runtime
from vq_fused_reference import bounded
from vq_model_reference import (ARCH_SHA256, NORMALIZATION,
    load_model, physical, references, recheck_owned_headroom, verify_files)
from vq_ple_stream import Archive
from vq_dense_overlay import Overlay, IDENTITY_SHA, POLICY, PROFILES
from vq_dense_overlay_reference import instrument_identity, check_proof


def run(options):
    profile_raw = bounded(options.profile, 32000)
    if hashlib.sha256(profile_raw).hexdigest() != '8e9ffd40c71d34bca08a55e7af55fda8ac7d45429f3ff7febef077d31bface7c':
        raise ValueError('generated profile digest changed')
    profile = json.loads(profile_raw)
    if (profile['schema'] != 1 or profile['profile'] != 'greedy16-memory-explanation-v1'
            or profile['max_new_tokens'] != 16 or profile['eos_token_id'] != 248044
            or len(profile['prompt']) != 44 or profile['sampling'] != 'argmax-first-index'):
        raise ValueError('fixed generated sequence profile required')
    if any(type(t) is not int or not 0 <= t < 248320 for t in profile['prompt']):
        raise ValueError('invalid fixed prompt token')
    runtime_path, execution_profile = select_runtime(options.model, getattr(options, 'runtime', None))
    overlay = Overlay(options.baseline, options.model, options.inventory, variant=getattr(options, 'dense_overlay_variant', '3.2'))
    instrument = instrument_identity()
    proof_raw = bounded(options.order_proof, 4_000_000)
    check_proof(json.loads(proof_raw), instrument, execution_profile, overlay.profile)
    own = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    before = quiet_preflight(13)
    with verification_lock():
        options.out.mkdir(parents=True, exist_ok=False)
        provenance = verify_files(options.model, options.inventory)
        overlay_verification = overlay.verify()
        import mlx.core as mx
        import numpy as np
        mx.set_memory_limit(8_000_000_000); mx.set_cache_limit(128_000_000)
        arch, vq = references(options.architecture, runtime_path)
        archive = Archive(options.model, options.inventory)
        caches = None; history = mx.full((1, 2), 248044, mx.int64)
        ids = list(profile['prompt']); generated = []; steps = []
        tags = {mx.bfloat16: 'BF16', mx.float32: 'F32', mx.float16: 'F16'}
        try:
            for step in range(16):
                recheck_owned_headroom()
                model = load_model(options.model, archive, arch, vq)
                applied = overlay.apply(model)
                core = model.model
                if caches is None: caches = model.make_cache()
                boundaries = []
                def observe(layer, values):
                    for name, value in values.items():
                        mx.eval(value)
                        if value.dtype not in tags or value.nbytes > 200_000_000 or not bool(mx.all(mx.isfinite(value)).item()):
                            raise ValueError('unsupported or nonfinite generated boundary')
                        raw = np.array(value.view(mx.uint8), copy=False).tobytes(order='C')
                        boundaries.append({'layer': layer, 'name': name, 'shape': list(value.shape),
                            'dtype': tags[value.dtype], 'bytes': len(raw), 'sha256': hashlib.sha256(raw).hexdigest()})
                tokens = mx.array([ids], dtype=mx.int64)
                hidden = mx.tile(core.embed_tokens(tokens), (1, 1, core.hc)); observe(-1, {'embedded': hidden})
                for layer in range(48):
                    recheck_owned_headroom()
                    block, cache = core.layers[layer], caches[layer]
                    mx.eval(block.parameters())
                    linear = block.layer_type == 'linear_attention'
                    mask = None if linear else arch.create_attention_mask(hidden, cache)
                    conv = arch.create_ssm_mask(hidden, cache) if linear else None
                    indexer = cache.indexer if hasattr(cache, 'indexer') else None
                    hidden = block(hidden, core.rope, mask, conv, cache, indexer, tokens, history)
                    arrays = {'hidden': hidden}
                    if linear:
                        arrays.update({'conv': cache[0], 'state': cache[1]})
                        if layer == 1: arrays['ple_conv'] = cache[2]
                    else:
                        arrays.update({'keys': cache.keys[:, :, :cache.offset],
                            'values': cache.values[:, :, :cache.offset], 'indexer': cache.indexer.keys})
                    observe(layer, arrays)
                    core.layers[layer] = None
                    del block, cache, arrays, indexer, mask, conv
                    gc.collect(); mx.clear_cache()
                    if max(physical().values()) > 4_000_000_000:
                        raise ValueError('greedy reference exceeded its 4 GB bound')
                mixed = core.hyper_connection_mixer(hidden)
                logits = model.lm_head(mixed).astype(mx.float32)
                observe(48, {'mixed': mixed, 'logits': logits})
                sampled = int(mx.argmax(logits[0, -1]).item())
                if len(boundaries) != 160: raise ValueError('missing generated reference boundaries')
                steps.append({'step': step, 'input_ids': ids, 'sampled': sampled, 'boundaries': boundaries})
                generated.append(sampled)
                history = mx.concatenate([history, tokens], axis=1)[:, -2:]; mx.eval(history)
                del model, core, hidden, mixed, logits, tokens
                gc.collect(); mx.clear_cache()
                print(json.dumps({'step': step, 'sampled': sampled, 'memory': physical()}), flush=True)
                if max(physical().values()) > 4_000_000_000:
                    raise ValueError('greedy reference head exceeded its 4 GB bound')
                if sampled == profile['eos_token_id']: break
                ids = [sampled]
            for file in archive.files.values(): file.verify_unchanged()
            overlay.recheck()
            recheck_runtime(options.model, getattr(options, 'runtime', None), execution_profile)
            if instrument_identity()['sha256'] != instrument['sha256'] or hashlib.sha256(Path(__file__).read_bytes()).hexdigest() != own:
                raise ValueError('generated reference producer changed')
            if options.profile.read_bytes() != profile_raw: raise ValueError('generated profile changed')
            result = {'schema': 1, 'profile': profile, 'profile_sha256': hashlib.sha256(profile_raw).hexdigest(),
                'architecture_sha256': ARCH_SHA256, 'normalization': NORMALIZATION,
                'runtime_sha256': execution_profile['runtime_sha256'], 'execution_profile': execution_profile,
                'vq_parent': provenance, 'composite_sha256': overlay.profile['identity'], 'policy': overlay.profile['policy'],
                'composite': overlay.identity, 'overlay_verification': overlay_verification,
                'overlay_application': applied, 'order_proof_sha256': hashlib.sha256(proof_raw).hexdigest(), 'instrument': instrument, 'producer_sha256': own, 'before': before,
                'generated': generated, 'steps': steps, 'consumed_tokens': len(profile['prompt']) + len(generated) - 1,
                'stop': 'eos' if generated[-1] == profile['eos_token_id'] else 'length',
                'memory': physical(), 'qualification': 'unproven'}
            (options.out / 'generation.json').write_text(json.dumps(result, indent=2) + '\n')
            if len(generated) < profile['minimum_steps']:
                raise ValueError('greedy sequence stopped before its frozen minimum coverage')
        finally:
            archive.close()


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ('model', 'baseline', 'inventory', 'architecture', 'profile', 'order-proof', 'out'):
        parser.add_argument('--' + name, type=Path, required=True)
    parser.add_argument('--dense-overlay-variant', choices=tuple(PROFILES), default='3.2')
    add_runtime_argument(parser)
    run(parser.parse_args())
