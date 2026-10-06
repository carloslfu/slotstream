#!/usr/bin/env python3
"""Independent composite reference; never impersonates an unchanged VQ pack."""
import argparse
import gc
import hashlib
import importlib.metadata
import json
import os
from pathlib import Path
import subprocess
import threading
import time

import vq_model_reference as ref
from vq_dense_overlay import Overlay, POLICY, IDENTITY_SHA, PROFILES, canonical_sha, sha
from vq_execution_profile import select_runtime, recheck_runtime, add_runtime_argument
from vq_fused_reference import bounded
from quantization_inventory import unique_json
from context_qualification import verification_lock, quiet_preflight
from prefill_bench import vm_snapshot
from vq_ple_stream import Archive, stamp


def instrument_identity():
    base = ref.instrument_identity()
    root = Path(__file__).resolve().parent
    additional = {name: sha(root / name) for name in ('vq_dense_overlay.py', 'vq_dense_overlay_reference.py', 'slotpack/pack.py')}
    additional['Sources/Slotstream/PinnedModel.swift'] = sha(root.parent / 'Sources/Slotstream/PinnedModel.swift')
    record = {'parent': base, 'additional': additional}
    return dict(record, sha256=canonical_sha(record))


def check_proof(proof, instrument, execution, profile=None):
    profile = PROFILES['3.2'] if profile is None else profile
    if (proof.get('policy') != profile['policy'] or proof.get('composite_sha256') != profile['identity']
            or proof.get('instrument', {}).get('sha256') != instrument['sha256']
            or proof.get('execution_profile') != execution
            or proof.get('architecture_sha256') != ref.ARCH_SHA256
            or proof.get('normalization') != ref.NORMALIZATION
            or proof.get('prompt_chunk') != 512 or proof.get('vq_decode_chunk') != 32
            or proof.get('traversal_proof', {}).get('traversal_equal_bits') is not True
            or proof['traversal_proof'].get('layers') != 4 or proof['traversal_proof'].get('tokens') != 513
            or proof.get('overlay_application', {}).get('modules') != 498
            or proof.get('overlay_verification', {}).get('complete') is not True):
        raise ValueError('traversal proof does not cover this exact composite and instrument')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for key in ('model', 'baseline', 'inventory', 'architecture', 'tokens', 'out'):
        parser.add_argument('--' + key, type=Path, required=True)
    parser.add_argument('--prove-order', action='store_true')
    parser.add_argument('--order-proof', type=Path)
    parser.add_argument('--dense-overlay-variant', choices=tuple(PROFILES), default='3.2')
    add_runtime_argument(parser)
    args = parser.parse_args()
    raw = bounded(args.tokens, 32_000); tokens = unique_json(raw)
    if (not isinstance(tokens, list) or not 1 <= len(tokens) <= 2048
            or any(type(t) is not int or not 0 <= t < 248_320 for t in tokens)):
        raise ValueError('bounded frozen pilot tokens required')
    if args.prove_order and (len(tokens) != 513 or args.order_proof is not None):
        raise ValueError('composite traversal proof requires exactly 513 tokens and no prior proof')
    execution_path, execution = select_runtime(args.model, args.runtime)
    identity = instrument_identity()
    proof_sha = None
    if not args.prove_order:
        if args.order_proof is None:
            raise ValueError('a successful composite traversal proof is required')
        proof_raw = bounded(args.order_proof, 4_000_000)
        check_proof(unique_json(proof_raw), identity, execution, PROFILES[args.dense_overlay_variant])
        proof_sha = hashlib.sha256(proof_raw).hexdigest()
    overlay = Overlay(args.baseline, args.model, args.inventory, variant=args.dense_overlay_variant)
    before = quiet_preflight(13)
    with verification_lock():
        args.out.mkdir(parents=True, exist_ok=False)
        provenance = ref.verify_files(args.model, args.inventory)
        authenticated_overlay = overlay.verify()
        allocation_before = ref.recheck_owned_headroom()
        import mlx.core as mx
        if mx.__version__ != '0.32.2' or importlib.metadata.version('mlx-lm') != '0.31.3':
            raise ValueError('composite reference requires pinned MLX versions')
        mx.set_cache_limit(128_000_000); mx.set_memory_limit(8_000_000_000)
        stop = threading.Event()

        def monitor():
            start = time.monotonic(); last_pressure = 0
            while not stop.wait(.05):
                try:
                    observed = ref.physical()
                    if max(observed.values()) > ref.PROCESS_LIMIT:
                        raise RuntimeError('composite exceeded its 10 GB process envelope')
                    if time.monotonic() - start > 1800:
                        raise RuntimeError('composite exceeded its 1800-second execution bound')
                    if time.monotonic() - last_pressure >= 1:
                        if subprocess.check_output(['sysctl', '-n', 'kern.memorystatus_vm_pressure_level'], text=True, timeout=3).strip() != '1':
                            raise RuntimeError('OS pressure interrupted composite execution')
                        last_pressure = time.monotonic()
                except Exception as error:
                    (args.out / 'memory-refusal.json').write_text(json.dumps({'reason': str(error)}) + '\n')
                    os._exit(99)
        thread = threading.Thread(target=monitor, daemon=True); thread.start()
        try:
            arch, vq = ref.references(args.architecture, execution_path)
            with Archive(args.model, args.inventory) as archive:
                model = ref.load_model(args.model, archive, arch, vq)
                applied = overlay.apply(model)
                gc.collect(); mx.clear_cache()
                print('strict composite loading complete', flush=True)
                positions = list(range(max(0, len(tokens) - 16), len(tokens)))
                expected = None
                if args.prove_order:
                    model.model.layers = model.model.layers[:4]
                    caches = model.make_cache(); pieces = []
                    for start in range(0, len(tokens), 512):
                        pieces.append(model.model(mx.array([tokens[start:start + 512]], dtype=mx.int64), cache=caches))
                        mx.eval(pieces[-1])
                    expected = mx.concatenate(pieces, axis=1); mx.eval(expected)
                    del pieces, caches
                    gc.collect(); mx.clear_cache()
                    print('direct composite traversal complete', flush=True)
                result = ref.streamed(model, arch, tokens, positions, args.out, 4 if args.prove_order else 48, expected)
                overlay.recheck()
                for name, observed in provenance['stamps'].items():
                    if stamp((args.model / name).stat()) != observed:
                        raise ValueError('VQ parent changed during composite execution')
                recheck_runtime(args.model, args.runtime, execution)
                if instrument_identity()['sha256'] != identity['sha256']:
                    raise ValueError('composite instrument changed during execution')
                receipt = {'schema': 1, 'scope': 'composite screening only; no native parity or qualification',
                    'policy': overlay.profile['policy'], 'composite_sha256': overlay.profile['identity'], 'composite': overlay.identity,
                    'overlay_verification': authenticated_overlay, 'overlay_application': applied,
                    'architecture_sha256': ref.ARCH_SHA256, 'runtime_sha256': ref.RUNTIME_SHA256,
                    'execution_profile': execution, 'normalization': ref.NORMALIZATION, 'instrument': identity,
                    'mlx': mx.__version__, 'mlx_lm': '0.31.3', 'prompt_chunk': 512, 'vq_decode_chunk': 32,
                    'tokens': tokens, 'tokens_sha256': hashlib.sha256(raw).hexdigest(), 'positions': positions,
                    'layers': 4 if args.prove_order else 48, 'logits': None if args.prove_order else result,
                    'traversal_proof': result if args.prove_order else None, 'order_proof_sha256': proof_sha,
                    'before': before, 'allocation_before': allocation_before, 'after': vm_snapshot(),
                    'process_memory': ref.physical(), 'peak_mlx_bytes': mx.get_peak_memory(),
                    'vq_parent': {k: v for k, v in provenance.items() if k != 'stamps'}, 'ple': archive.receipt()}
                if max(receipt['process_memory'].values()) > ref.PROCESS_LIMIT:
                    raise ValueError('composite footprint exceeded its bound')
                (args.out / 'receipt.json').write_text(json.dumps(receipt, indent=2) + '\n')
                print(json.dumps({'complete': True, 'policy': overlay.profile['policy'], 'result': result, 'memory': receipt['process_memory']}), flush=True)
        finally:
            stop.set(); thread.join(timeout=4)
            if thread.is_alive():
                raise RuntimeError('composite observer did not drain')


if __name__ == '__main__':
    main()
