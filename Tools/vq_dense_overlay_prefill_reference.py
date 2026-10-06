#!/usr/bin/env python3
"""Independent dense-composite hashes for ordinary prefill and sparse selection.

Whole vocabulary logits are evaluated at the original pass shape. Hashing the
complete logical tensor bytes avoids storing duplicate large state snapshots.
Optional layer capture is for diagnosing a failed hash, not changing a gate.
Run sequentially under quantization_logit_run.supervise.
"""
import argparse
import gc
import hashlib
import json
from pathlib import Path

from context_qualification import quiet_preflight, verification_lock
from vq_execution_profile import add_runtime_argument, recheck_runtime, select_runtime
from vq_model_reference import (ARCH_SHA256, NORMALIZATION,
    load_model, physical, references, recheck_owned_headroom, verify_files)
from vq_ple_stream import Archive
from vq_fused_reference import bounded
from vq_dense_overlay import Overlay, IDENTITY_SHA, POLICY, PROFILES
from vq_dense_overlay_reference import instrument_identity, check_proof

PROMPT = [100 + (i * 37) % 10000 for i in range(512)]
PROMPT[255] = 248044
PASSES = [PROMPT, [101]]
PROFILE = 'prefill512-decode1-v1'


def run(options):
    passes = PASSES
    profile = PROFILE
    if options.sparse:
        prompt = [100 + (i * 37) % 10000 for i in range(2053)]
        prompt[255] = 248044
        passes = [prompt[i:i+512] for i in range(0, 2053, 512)] + [[101]]
        profile = 'sparse2053-decode1-v1'
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
        recheck_owned_headroom()
        import mlx.core as mx
        import numpy as np
        mx.set_memory_limit(8_000_000_000)
        mx.set_cache_limit(128_000_000)
        arch, vq = references(options.architecture, runtime_path)
        archive = Archive(options.model, options.inventory)
        boundaries = []
        tags = {mx.bfloat16: 'BF16', mx.float32: 'F32', mx.float16: 'F16', mx.bool_: 'BOOL'}

        def observe(layer, step, arrays):
            for name, value in arrays.items():
                mx.eval(value)
                if value.dtype not in tags or not bool(mx.all(mx.isfinite(value)).item()):
                    raise ValueError('nonfinite or unsupported full-model reference boundary')
                if value.nbytes > 600_000_000:
                    raise ValueError('reference boundary exceeds its frozen byte bound')
                data = np.array(value.view(mx.uint8), copy=False).tobytes(order='C')
                if len(data) != value.nbytes:
                    raise ValueError('reference logical byte count mismatch')
                boundaries.append({'layer': layer, 'step': step, 'name': name, 'shape': list(value.shape),
                                   'dtype': tags[value.dtype], 'bytes': len(data),
                                   'sha256': hashlib.sha256(data).hexdigest()})
            if layer == options.save_layer:
                mx.save_safetensors(str(options.out / f'layer-{layer}-pass-{step}.safetensors'), arrays)

        try:
            indexer_call = arch.QSAIndexer.__call__
            sparse_calls = []
            def observed_indexer(self, *args, **kwargs):
                value = indexer_call(self, *args, **kwargs)
                if value is not None:
                    observe(layer, step, {'sparse_mask': value})
                    sparse_calls.append({'layer': layer, 'step': step, 'shape': list(value.shape)})
                return value
            if options.sparse: arch.QSAIndexer.__call__ = observed_indexer
            model = load_model(options.model, archive, arch, vq)
            applied = overlay.apply(model)
            core, caches = model.model, model.make_cache()
            ids = [mx.array([p], dtype=mx.int64) for p in passes]
            hidden = [mx.tile(core.embed_tokens(tokens), (1, 1, core.hc)) for tokens in ids]
            for step, value in enumerate(hidden): observe(-1, step, {'embedded': value})
            for layer in range(48):
                recheck_owned_headroom()
                block, cache = core.layers[layer], caches[layer]
                mx.eval(block.parameters())
                linear = block.layer_type == 'linear_attention'
                history = mx.full((1, 2), 248044, mx.int64)
                for step, tokens in enumerate(ids):
                    mask = None if linear else arch.create_attention_mask(hidden[step], cache)
                    conv = arch.create_ssm_mask(hidden[step], cache) if linear else None
                    indexer = cache.indexer if hasattr(cache, 'indexer') else None
                    hidden[step] = block(hidden[step], core.rope, mask, conv, cache, indexer, tokens, history)
                    history = mx.concatenate([history, tokens], axis=1)[:, -2:]
                    arrays = {'hidden': hidden[step]}
                    if linear:
                        arrays.update({'conv': cache[0], 'state': cache[1]})
                        if layer == 1: arrays['ple_conv'] = cache[2]
                    else:
                        arrays.update({'keys': cache.keys[:, :, :cache.offset],
                                       'values': cache.values[:, :, :cache.offset], 'indexer': cache.indexer.keys})
                    observe(layer, step, arrays)
                core.layers[layer] = None; caches[layer] = None
                del block, cache, arrays, indexer, mask, conv
                gc.collect(); mx.clear_cache()
                print(json.dumps({'layer': layer, 'memory': physical()}), flush=True)
                if max(physical().values()) > 4_000_000_000:
                    raise ValueError('full-model reference exceeded its 4 GB process bound')
            for step, value in enumerate(hidden):
                mixed = core.hyper_connection_mixer(value)
                observe(48, step, {'mixed': mixed, 'logits': model.lm_head(mixed).astype(mx.float32)})
            for file in archive.files.values(): file.verify_unchanged()
            overlay.recheck()
            if max(physical().values()) > 4_000_000_000:
                raise ValueError('reference head exceeded its 4 GB process bound')
            recheck_runtime(options.model, getattr(options, 'runtime', None), execution_profile)
            if instrument_identity()['sha256'] != instrument['sha256'] or hashlib.sha256(Path(__file__).read_bytes()).hexdigest() != own:
                raise ValueError('full-model reference instrument changed')
            expected_sparse = 24 if options.sparse else 0
            if len(boundaries) != len(passes) * 160 + expected_sparse or len(sparse_calls) != expected_sparse:
                raise ValueError('incomplete reference boundary set')
            receipt = {'schema': 1, 'profile': profile, 'architecture_sha256': ARCH_SHA256,
                       'runtime_sha256': execution_profile['runtime_sha256'], 'execution_profile': execution_profile,
                       'normalization': NORMALIZATION, 'vq_parent': provenance, 'instrument': instrument,
                       'composite_sha256': overlay.profile['identity'], 'policy': overlay.profile['policy'], 'composite': overlay.identity,
                       'overlay_verification': overlay_verification, 'overlay_application': applied,
                       'order_proof_sha256': hashlib.sha256(proof_raw).hexdigest(),
                       'producer_sha256': own, 'passes': passes, 'boundaries': boundaries, 'sparse_calls': sparse_calls,
                       'before': before, 'memory': physical(), 'mlx_peak_bytes': mx.get_peak_memory(),
                       'save_layer': options.save_layer, 'qualification': 'unproven',
                       'scope': 'complete prefill arithmetic and one continuation; no generation qualification'}
            (options.out / 'model.json').write_text(json.dumps(receipt, indent=2) + '\n')
            print(json.dumps({'complete': True, 'boundaries': len(boundaries), 'memory': receipt['memory']}), flush=True)
        finally:
            arch.QSAIndexer.__call__ = indexer_call
            archive.close()


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ('model', 'baseline', 'inventory', 'architecture', 'order-proof', 'out'):
        parser.add_argument('--' + name, type=Path, required=True)
    parser.add_argument('--save-layer', type=int, choices=range(-1, 49))
    parser.add_argument('--sparse', action='store_true', help='Fixed 2053-token prefill plus continuation; includes sparse masks')
    parser.add_argument('--dense-overlay-variant', choices=tuple(PROFILES), default='3.2')
    add_runtime_argument(parser)
    run(parser.parse_args())
