#!/usr/bin/env python3
"""Strict bounded reference for the original pack and its expert-only affine3 control.

All original non-expert values and folded norms stay intact. Original affine
PLE rows are gathered through owned authenticated descriptors; no whole table
is loaded. The reviewed upstream architecture runs unchanged. Quality rows
are scored against frozen full-vocabulary references in memory, never saved.
"""
import argparse
import gc
import hashlib
import importlib.metadata
import importlib.util
import json
import os
from pathlib import Path
import re
import statistics
import subprocess
import sys
import threading
import time

from affine_expert_control import Source, POLICY, REFIT_POLICY, REFIT_COMPONENT_SHA256, FAMILIES, metadata, digest
from context_qualification import quiet_preflight, verification_lock
from prefill_bench import vm_snapshot
from quantization_inventory import unique_json
from quantization_quality import Logits, VOCABULARY, IDENTITY_FIELDS, metrics
from slotpack.pack import pins
from vq_dense_overlay import BASE_CONFIG, BASE_INDEX, BASE_REVISION, read_json, recipe, canonical_sha
from vq_fused_reference import bounded
from vq_model_reference import ARCH_SHA256, checked_source, physical, instrument_identity as parent_identity
from vq_ple_stream import stamp

NORMALIZATION = 'original-already-folded-bf16-unchanged-v1'
PROCESS_LIMIT = 10_000_000_000
MAX_ROWS = 8192


def identity():
    record = {'parent': parent_identity(), 'additional': {name: digest(Path(__file__).parent / name)
              for name in ('affine_expert_reference.py', 'affine_expert_control.py', 'slotpack/pack.py')}}
    record['manifest_source'] = digest(Path(__file__).parent.parent / 'Sources/Slotstream/PinnedModel.swift')
    return {**record, 'sha256': canonical_sha(record)}


def architecture(path):
    raw = checked_source(path, ARCH_SHA256)
    import mlx_lm.models
    name = 'mlx_lm.models.qwen4_exp'
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    exec(compile(raw, str(path), 'exec'), module.__dict__)
    return module


def validate_control_manifest(manifest):
    """Only the two explicit same-parent affine research recipes are admitted.

    The caller separately pins the complete manifest digest, authenticates
    every payload and verifies all tensor geometry. Admitting a recipe here
    does not register it for inference or attest task-quality equivalence.
    """
    if (not isinstance(manifest, dict) or type(manifest.get('schema')) is not int
            or manifest['schema'] != 1 or manifest.get('complete') is not True
            or manifest.get('qualification') is not False
            or manifest.get('policy') not in (POLICY, REFIT_POLICY)
            or manifest.get('parent_revision') != BASE_REVISION
            or manifest.get('baseline_config_sha256') != BASE_CONFIG
            or manifest.get('baseline_index_sha256') != BASE_INDEX
            or manifest.get('layers') != list(range(48))
            or type(manifest.get('expected_output_bytes')) is not int
            or manifest['expected_output_bytes'] != 52_848_290_992
            or not isinstance(manifest.get('files'), list) or len(manifest['files']) != 48):
        raise ValueError('requires a complete explicit same-parent expert control')
    if manifest['policy'] == REFIT_POLICY:
        if (manifest.get('refitted') is not True
                or manifest.get('refit_component_receipt_sha256') != REFIT_COMPONENT_SHA256):
            raise ValueError('refitted control lacks its checked recipe identity')
    elif manifest.get('refitted', False) is not False:
        raise ValueError('original control cannot claim the refitted recipe')


class Archive:
    """Complete pinned files, checked tensor geometry and stable lazy mapping."""
    def __init__(self, baseline, control, control_sha):
        self.baseline, self.control = baseline, control
        self.config = read_json(baseline / 'config.json', BASE_CONFIG)
        self.index = read_json(baseline / 'model.safetensors.index.json', BASE_INDEX)['weight_map']
        self.sources, self.paths, self.mapping, self.tables = {}, {}, {}, {}
        self.control_sha = control_sha
        known = {p['path']: p for p in pins()}
        selected = {k: n for k, n in self.index.items() if k.startswith('language_model.')}
        if len(selected) != 2882:
            raise ValueError('original text tensor coverage changed')
        try:
            for key, name in selected.items():
                if name not in known or known[name]['optional'] or Path(name).name != name:
                    raise ValueError('original tensor is outside the pinned required files')
                if name not in self.sources:
                    self.sources[name] = Source(baseline / name, known[name]); self.paths[name] = baseline / name
                if key not in self.sources[name].header:
                    raise ValueError('indexed original tensor is absent')
                self.mapping[key] = name
            self.original_sources = list(self.sources)
            self.control_manifest = None
            if control is not None:
                manifest = read_json(control / 'manifest.json', control_sha)
                validate_control_manifest(manifest)
                files = {f['path']: f for f in manifest['files']}
                if set(files) != {f'experts-{n:02d}.safetensors' for n in range(48)}:
                    raise ValueError('duplicate or missing controlled layers')
                for layer in range(48):
                    name = f'experts-{layer:02d}.safetensors'; source_id = 'control/' + name
                    self.sources[source_id] = Source(control / name, files[name]); self.paths[source_id] = control / name
                    expected_keys = set()
                    for family, rows, columns in FAMILIES:
                        module = f'language_model.model.layers.{layer}.mlp.switch_mlp.{family}'
                        if recipe(self.config, module.removeprefix('language_model.')) != {'bits': 4, 'group_size': 64}:
                            raise ValueError('expert source recipe changed')
                        for suffix, expected in metadata(rows, columns, 3).items():
                            key = module + '.' + suffix; expected_keys.add(key)
                            info = self.sources[source_id].header[key]
                            if (info['dtype'], info['shape']) != (expected['dtype'], expected['shape']):
                                raise ValueError('controlled expert tensor geometry changed')
                            if key not in self.mapping:
                                raise ValueError('controlled tensor is not an existing expert')
                            self.mapping[key] = source_id
                    if set(self.sources[source_id].header) != expected_keys:
                        raise ValueError('controlled layer contains unreviewed tensors')
                self.control_manifest = manifest
        except BaseException:
            self.close(); raise

    def verify(self, guard):
        for name in sorted(self.sources):
            self.sources[name].verify(guard)
            print(json.dumps({'verified': name}), flush=True)

    def recheck(self):
        for name, source in self.sources.items():
            source.recheck()
            if stamp(self.paths[name].stat(follow_symlinks=False)) != source.identity:
                raise ValueError('authenticated mapped path changed')
        read_json(self.baseline / 'config.json', BASE_CONFIG)
        read_json(self.baseline / 'model.safetensors.index.json', BASE_INDEX)
        if self.control is not None:
            read_json(self.control / 'manifest.json', self.control_sha)

    def table(self, module):
        table = Table(self, module)
        self.tables[module] = table
        return table

    def receipt(self):
        return {'parent_revision': BASE_REVISION, 'control_manifest_sha256': self.control_sha,
                'complete_source_verification': all(x.verified for x in self.sources.values()),
                'source_files': {name: source.pin for name, source in self.sources.items()},
                'ple': {name: table.receipt() for name, table in self.tables.items()}}

    def close(self):
        for source in self.sources.values(): source.close()


class Table:
    def __init__(self, archive, module):
        self.archive, self.module = archive, module
        self.tensors = {part: module + '.' + part for part in ('weight', 'scales', 'biases')}
        self.reads = self.bytes_read = self.rows_requested = self.maximum_rows = 0
        self.range_sha = hashlib.sha256(b'slotstream-affine-ple-ranges-v1\0')
        if recipe(archive.config, module.removeprefix('language_model.')) != {'bits': 4, 'group_size': 32}:
            raise ValueError('original PLE recipe changed')
        info = {suffix: self.info(key) for suffix, key in self.tensors.items()}
        rows = info['weight']['shape'][0]
        if type(rows) is not int or not 1 <= rows <= 3_000_000:
            raise ValueError('unsupported original PLE row count')
        expected = {'weight': ('U32', [rows, 20]), 'scales': ('BF16', [rows, 5]), 'biases': ('BF16', [rows, 5])}
        if any((info[key]['dtype'], info[key]['shape']) != want for key, want in expected.items()):
            raise ValueError('original PLE tensor triple differs from inspected geometry')
        self.rows = rows

    def info(self, key):
        return self.archive.sources[self.archive.mapping[key]].header[key]

    def gather(self, rows):
        if (not isinstance(rows, list) or not 1 <= len(rows) <= MAX_ROWS
                or any(type(row) is not int or not 0 <= row < self.rows for row in rows)):
            raise ValueError('PLE request must contain bounded valid integer rows')
        result = []
        for part, stride in (('weight', 80), ('scales', 10), ('biases', 10)):
            key = self.tensors[part]; source = self.archive.sources[self.archive.mapping[key]]
            if not source.verified: raise ValueError('PLE source is not fully verified')
            source.recheck(); offset = source.base + self.info(key)['data_offsets'][0]
            unique = {}
            for row in dict.fromkeys(rows):
                raw = os.pread(source.fd, stride, offset + row * stride)
                if len(raw) != stride: raise ValueError('short PLE row')
                unique[row] = raw; self.reads += 1; self.bytes_read += stride
                self.range_sha.update(key.encode() + b'\0' + row.to_bytes(8, 'little') + hashlib.sha256(raw).digest())
            source.recheck(); result.append(b''.join(unique[row] for row in rows))
        self.rows_requested += len(rows); self.maximum_rows = max(self.maximum_rows, len(rows))
        return result

    def receipt(self):
        return {'reads': self.reads, 'bytes_read': self.bytes_read, 'rows_requested': self.rows_requested,
                'maximum_rows': self.maximum_rows, 'ranges_sha256': self.range_sha.hexdigest()}


def ple_module(table):
    import mlx.core as mx
    import mlx.nn as nn
    import numpy as np
    class Streaming(nn.Module):
        def __init__(self):
            super().__init__(); object.__setattr__(self, 'table', table)
        def __call__(self, ids):
            if ids.dtype not in (mx.int32, mx.int64, mx.uint32, mx.uint64) or not 1 <= ids.size <= MAX_ROWS:
                raise ValueError('PLE indices must be bounded integer arrays')
            rows = np.array(ids).reshape(-1).tolist()
            packed, scales, biases = table.gather(rows)
            w = mx.array(np.frombuffer(packed, dtype='<u4').copy().reshape(len(rows), 20))
            s = mx.array(np.frombuffer(scales, dtype='<u2').copy().reshape(len(rows), 5)).view(mx.bfloat16)
            b = mx.array(np.frombuffer(biases, dtype='<u2').copy().reshape(len(rows), 5)).view(mx.bfloat16)
            return mx.dequantize(w, s, b, group_size=32, bits=4).reshape(*ids.shape, 160)
    return Streaming()


def load_model(archive, arch, *, prove_ple=False):
    import mlx.core as mx
    import mlx.nn as nn
    import numpy as np
    args = arch.ModelArgs.from_dict(archive.config)
    if args.text.num_hidden_layers != 48 or args.text.vocab_size != VOCABULARY:
        raise ValueError('reference architecture changed')
    model = arch.Model(args)
    ple_names = sorted({k.rsplit('.', 1)[0] for k in archive.mapping if '.ngram_embedding.' in k})
    if len(ple_names) != 128: raise ValueError('incomplete original PLE coverage')
    from vq_model_reference import put
    for module in ple_names:
        table = archive.table(module); streamed = ple_module(table)
        normalized = module.removeprefix('language_model.')
        put(model, normalized, streamed)
        if prove_ple:
            ids = mx.array([0, 1, table.rows - 1, 0, table.rows // 2, 31, 32, 63, 64, 127, 128], dtype=mx.int32)
            arrays = []
            for part in ('weight', 'scales', 'biases'):
                key = module + '.' + part; name = archive.mapping[key]
                loaded = mx.load(str(archive.paths[name])); arrays.append(mx.take(loaded[key], ids, axis=0)); del loaded
            expected = mx.dequantize(*arrays, group_size=32, bits=4)
            actual = streamed(ids)
            if np.array(expected.view(mx.uint16)).tobytes() != np.array(actual.view(mx.uint16)).tobytes():
                raise ValueError('streamed original PLE rows differ from independent mapped gather')
            del ids, arrays, expected, actual; mx.clear_cache()
    selected = {k: n for k, n in archive.mapping.items() if '.ngram_embedding.' not in k}
    weights = {}
    for name in sorted(set(selected.values())):
        archive.sources[name].recheck()
        loaded = mx.load(str(archive.paths[name]))
        for key in (k for k, n in selected.items() if n == name):
            value = loaded[key]; info = archive.sources[name].header[key]
            expected_dtype = {'BF16': mx.bfloat16, 'F32': mx.float32, 'F16': mx.float16,
                              'U32': mx.uint32, 'I64': mx.int64, 'I32': mx.int32}[info['dtype']]
            if list(value.shape) != info['shape'] or value.dtype != expected_dtype:
                raise ValueError('lazy original tensor differs from its verified metadata')
            weights[key] = value
        del loaded
    # Already-converted language_model.* keys do not trigger +1 in sanitize.
    # No VQ normalization adapter is used for these original values.
    weights = model.sanitize(weights)
    def predicate(name, module):
        if not hasattr(module, 'to_quantized') or name + '.scales' not in weights:
            return False
        if archive.control is not None and '.mlp.switch_mlp.' in name:
            return {'bits': 3, 'group_size': 64}
        return recipe(archive.config, name)
    nn.quantize(model, bits=4, group_size=64, class_predicate=predicate)
    model.load_weights(list(weights.items()), strict=True)
    model.eval(); del weights; gc.collect(); archive.recheck()
    return model


def forward(model, arch, tokens, layers, guard, expected=None):
    import mlx.core as mx
    import numpy as np
    core = model.model; caches = model.make_cache(); ids = mx.array([tokens], dtype=mx.int64)
    h = mx.tile(core.embed_tokens(ids), (1, 1, core.hc)); mx.eval(h)
    eos = core.args.eos_token_id; eos = eos[0] if isinstance(eos, list) else eos
    ctx = core.args.ngram_size - 1
    history = mx.concatenate([mx.full((1, ctx), eos, ids.dtype), ids], axis=1)
    for layer in range(layers):
        guard(); block, cache = core.layers[layer], caches[layer]; mx.eval(block.parameters()); parts = []
        for start in range(0, len(tokens), 512):
            end = min(len(tokens), start + 512); x = h[:, start:end]
            linear = block.layer_type == 'linear_attention'
            mask = None if linear else arch.create_attention_mask(x, cache)
            conv = arch.create_ssm_mask(x, cache) if linear else None
            indexer = cache.indexer if hasattr(cache, 'indexer') else None
            parts.append(block(x, core.rope, mask, conv, cache, indexer, ids[:, start:end], history[:, start:start + ctx]))
            mx.eval(parts[-1]); guard()
        h = mx.concatenate(parts, axis=1) if len(parts) > 1 else parts[0]; mx.eval(h)
        if not bool(mx.all(mx.isfinite(h)).item()): raise ValueError('nonfinite reference hidden state')
        core.layers[layer] = None; caches[layer] = None
        del block, cache, parts, x, mask, conv, indexer; gc.collect(); mx.clear_cache()
        print(json.dumps({'layer': layer, 'memory': physical()}), flush=True)
    if expected is not None:
        mixed = mx.concatenate([core.hyper_connection_mixer(h[:, n:n + 512]) for n in range(0, len(tokens), 512)], axis=1)
        raw = np.array(mixed.view(mx.uint16)).tobytes()
        if raw != np.array(expected.view(mx.uint16)).tobytes():
            raise ValueError('layer streaming changed the direct chunked reference')
        return {'equal_bits': True, 'layers': layers, 'tokens': len(tokens), 'sha256': hashlib.sha256(raw).hexdigest()}
    return h


def check_proof(proof, instrument, control_sha):
    if (proof.get('complete') is not True or proof.get('control_manifest_sha256') != control_sha
            or proof.get('instrument_sha256') != instrument['sha256'] or proof.get('normalization') != NORMALIZATION
            or proof.get('architecture_sha256') != ARCH_SHA256 or proof.get('prompt_chunk') != 512
            or proof.get('ple_tables_proven') != 128
            or proof.get('traversal', {}).get('equal_bits') is not True
            or proof['traversal'].get('tokens') != 513 or proof['traversal'].get('layers') != 4):
        raise ValueError('proof does not cover this exact affine control and instrument')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ('baseline', 'architecture', 'tokens', 'out'):
        parser.add_argument('--' + name, type=Path, required=True)
    parser.add_argument('--control', type=Path)
    parser.add_argument('--control-sha256')
    parser.add_argument('--prove-order', action='store_true')
    parser.add_argument('--order-proof', type=Path)
    parser.add_argument('--reference', type=Path)
    parser.add_argument('--reference-sha256')
    parser.add_argument('--baseline-logits', type=Path)
    parser.add_argument('--baseline-logits-sha256')
    parser.add_argument('--case')
    args = parser.parse_args()
    if (args.control is None) != (args.control_sha256 is None): raise ValueError('control and manifest digest are inseparable')
    tokens_raw = bounded(args.tokens, 32_000); tokens = unique_json(tokens_raw)
    if not isinstance(tokens, list) or not 1 <= len(tokens) <= 2048 or any(type(t) is not int or not 0 <= t < VOCABULARY for t in tokens):
        raise ValueError('frozen bounded tokens required')
    instrument = identity(); proof_sha = None
    if args.prove_order:
        if len(tokens) != 513 or args.order_proof or args.reference or args.baseline_logits or args.case:
            raise ValueError('order proof requires precisely 513 tokens without quality inputs')
    else:
        if any(v is None for v in (args.order_proof, args.reference, args.reference_sha256, args.baseline_logits, args.baseline_logits_sha256, args.case)):
            raise ValueError('quality pilot requires proof and complete pinned comparison inputs')
        proof_raw = bounded(args.order_proof, 4_000_000); proof_sha = hashlib.sha256(proof_raw).hexdigest()
        check_proof(unique_json(proof_raw), instrument, args.control_sha256)
        for path, sha in ((args.reference, args.reference_sha256), (args.baseline_logits, args.baseline_logits_sha256)):
            read_json(path, sha)
    before = quiet_preflight(13)
    with verification_lock():
        args.out.mkdir(parents=True, exist_ok=False)
        started = time.monotonic(); last_vm = -1.0; stop = threading.Event(); archive = None; references = []
        def guard():
            nonlocal last_vm
            if max(physical().values()) > PROCESS_LIMIT: raise RuntimeError('reference exceeded ten-GB physical envelope')
            now = time.monotonic()
            if now - started > 1800: raise RuntimeError('reference exceeded 1800-second bound')
            if now - last_vm >= 1:
                if vm_snapshot()['reclaimable_bytes'] < 3_000_000_000: raise RuntimeError('reference lost real headroom')
                if subprocess.check_output(['sysctl', '-n', 'kern.memorystatus_vm_pressure_level'], text=True, timeout=3).strip() != '1':
                    raise RuntimeError('OS memory pressure')
                last_vm = now
        def monitor():
            while not stop.wait(.1):
                try: guard()
                except Exception as error:
                    (args.out / 'memory-refusal.json').write_text(json.dumps({'reason': str(error)}) + '\n'); os._exit(99)
        thread = threading.Thread(target=monitor, daemon=True); thread.start()
        try:
            import mlx.core as mx
            import numpy as np
            if mx.__version__ != '0.32.2' or importlib.metadata.version('mlx-lm') != '0.31.3':
                raise ValueError('requires pinned MLX runtime')
            mx.set_memory_limit(8_000_000_000); mx.set_cache_limit(128_000_000)
            archive = Archive(args.baseline, args.control, args.control_sha256); archive.verify(guard)
            arch = architecture(args.architecture)
            model = load_model(archive, arch, prove_ple=args.prove_order); print('strict affine loading complete', flush=True)
            result = {'schema': 1, 'complete': False, 'qualification': False, 'normalization': NORMALIZATION,
                      'control_manifest_sha256': args.control_sha256, 'instrument_sha256': instrument['sha256'],
                      'instrument': instrument, 'architecture_sha256': ARCH_SHA256, 'prompt_chunk': 512,
                      'tokens_sha256': hashlib.sha256(tokens_raw).hexdigest(), 'tokens': tokens,
                      'before': before, 'order_proof_sha256': proof_sha}
            if args.prove_order:
                model.model.layers = model.model.layers[:4]; caches = model.make_cache(); parts = []
                for start in range(0, len(tokens), 512):
                    parts.append(model.model(mx.array([tokens[start:start + 512]], dtype=mx.int64), cache=caches)); mx.eval(parts[-1]); guard()
                expected = mx.concatenate(parts, axis=1); mx.eval(expected); del caches, parts; gc.collect(); mx.clear_cache()
                result['traversal'] = forward(model, arch, tokens, 4, guard, expected)
                result['ple_tables_proven'] = len(archive.tables)
            else:
                references = [Logits(args.reference), Logits(args.baseline_logits)]; reference, baseline = references
                if any(reference.data['artifact'][k] != baseline.data['artifact'][k] for k in IDENTITY_FIELDS):
                    raise ValueError('quality parent identities differ')
                if reference.data['scope'] != 'pilot' or baseline.data['scope'] != 'pilot': raise ValueError('this is only a calibration pilot')
                expected_positions = list(range(max(0, len(tokens) - 16), len(tokens)))
                for source in references:
                    case = source.cases[args.case]
                    if case['tokens'] != tokens or case['positions'] != expected_positions:
                        raise ValueError('quality inputs do not match the exact frozen token context')
                h = forward(model, arch, tokens, 48, guard)
                rows = []; hashes = hashlib.sha256()
                for start in range(0, len(tokens), 512):
                    chosen = [p for p in expected_positions if start <= p < start + 512]
                    if not chosen: continue
                    logits = model.lm_head(model.model.hyper_connection_mixer(h[:, start:start + 512])).astype(mx.float32)[0]
                    mx.eval(logits); guard()
                    for position in chosen:
                        value = np.array(logits[position - start], dtype='<f4')
                        if value.shape != (VOCABULARY,) or not np.isfinite(value).all(): raise ValueError('invalid candidate vocabulary')
                        hashes.update(value.tobytes()); r = reference.row(args.case); a = baseline.row(args.case)
                        old, candidate = metrics(r, a), metrics(r, value.tolist())
                        rows.append({'position': position, 'baseline': old, 'candidate': candidate,
                                     'delta_kl': candidate['kl_reference_to_other'] - old['kl_reference_to_other']})
                    del logits
                result['comparison'] = {'case': args.case, 'family': reference.cases[args.case]['family'],
                    'reference_manifest_sha256': reference.manifest_sha256, 'baseline_manifest_sha256': baseline.manifest_sha256,
                    'rows': rows, 'candidate_logits_sha256': hashes.hexdigest(), 'saved_raw_logit_bytes': 0,
                    'mean_delta_kl': statistics.mean(r['delta_kl'] for r in rows),
                    **{role: {'mean_kl': statistics.mean(r[role]['kl_reference_to_other'] for r in rows),
                              'top1_agreement': statistics.mean(r[role]['top1_agrees'] for r in rows)} for role in ('baseline', 'candidate')}}
            archive.recheck()
            for source in references: source.verify_unchanged()
            if identity()['sha256'] != instrument['sha256']: raise ValueError('reference source changed during execution')
            guard(); result.update(complete=True, seconds=time.monotonic() - started, archive=archive.receipt(), process_memory=physical(), after=vm_snapshot())
            (args.out / 'receipt.json').write_text(json.dumps(result, indent=2) + '\n')
            print(json.dumps({'complete': True, 'traversal': result.get('traversal'), 'comparison': result.get('comparison'), 'memory': result['process_memory']}))
        finally:
            stop.set(); thread.join(timeout=4)
            if archive is not None: archive.close()
            for source in references: source.close()
            if thread.is_alive(): raise RuntimeError('reference observer did not drain')


if __name__ == '__main__':
    main()
