#!/usr/bin/env python3
"""Bounded numerical storage checks for the explicit affine-three-bit control.

No checkpoint is loaded. The two real expert shapes use deterministic values.
Batching must preserve every converted byte; an independent byte unpacker checks
all packed three-bit codes, including codes that cross byte/word boundaries.
This is not a model quality or throughput measurement.
"""
import argparse
import hashlib
import json
from pathlib import Path
import tempfile

from affine_expert_control import FAMILIES, metadata
from context_qualification import quiet_preflight, verification_lock
from vq_model_reference import physical


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out', type=Path, required=True)
    options = parser.parse_args()
    before = quiet_preflight(13)
    with verification_lock():
        options.out.mkdir(parents=True, exist_ok=False)
        import mlx.core as mx
        import numpy as np
        if mx.__version__ != '0.32.2':
            raise ValueError('requires the pinned MLX quantizer')
        mx.set_memory_limit(2_000_000_000)
        mx.set_cache_limit(64_000_000)
        record = {'schema': 1, 'complete': False, 'before': before,
                  'mlx': mx.__version__, 'cases': [], 'qualification': False}
        for rows, columns in dict.fromkeys((r, c) for _, r, c in FAMILIES):
            # Entirely representable BF16 source values, distinct by row and
            # expert. Quantization rounds at each actual artifact boundary.
            source = ((mx.arange(8 * rows * columns, dtype=mx.int32) * 17 % 509)
                      .astype(mx.float32) / 128 - 2).reshape(8, rows, columns).astype(mx.bfloat16)
            original = mx.quantize(source, group_size=64, bits=4)
            dense = mx.dequantize(*original, group_size=64, bits=4)
            converted = mx.quantize(dense, group_size=64, bits=3)
            mx.eval(original, dense, converted)
            byte = lambda value: np.array(value.view(mx.uint8), copy=False).tobytes()
            hashes = []
            for suffix, value in zip(('weight', 'scales', 'biases'), converted):
                want = metadata(rows, columns, 3, 8)[suffix]
                if list(value.shape) != want['shape']:
                    raise AssertionError('converted shape changed')
                hashes.append(hashlib.sha256(byte(value)).hexdigest())
            for expert in range(8):
                single = mx.quantize(dense[expert:expert + 1], group_size=64, bits=3)
                mx.eval(single)
                if any(byte(a) != byte(b[expert:expert + 1]) for a, b in zip(single, converted)):
                    raise AssertionError('conversion changed with expert batching')
            packed = np.array(converted[0], dtype='<u4').view(np.uint8).reshape(8, rows, -1, 3)
            p = packed.astype(np.uint32)
            word = p[..., 0] | (p[..., 1] << 8) | (p[..., 2] << 16)
            expected = np.stack([(word >> (3 * i)) & 7 for i in range(8)], axis=-1).reshape(8, rows, columns)
            unpacked = mx.dequantize(converted[0], mx.ones_like(converted[1]),
                                    mx.zeros_like(converted[2]), group_size=64, bits=3)
            if not np.array_equal(np.array(unpacked.astype(mx.uint32)), expected):
                raise AssertionError('independent three-bit packed-code oracle differs')
            with tempfile.TemporaryDirectory(dir=options.out) as directory:
                file = Path(directory) / 'roundtrip.safetensors'
                mx.save_safetensors(str(file), dict(zip(('weight', 'scales', 'biases'), converted)))
                reread = mx.load(str(file))
                if any(byte(a) != byte(reread[key]) for key, a in zip(('weight', 'scales', 'biases'), converted)):
                    raise AssertionError('tensor serialization changed converted bytes')
                restored = mx.dequantize(*(reread[k] for k in ('weight', 'scales', 'biases')), group_size=64, bits=3)
                direct = mx.dequantize(*converted, group_size=64, bits=3)
                if byte(restored) != byte(direct):
                    raise AssertionError('serialization changed affine reconstruction')
            memory = physical()
            if max(memory.values()) > 4_000_000_000:
                raise RuntimeError('component exceeded its four-GB envelope')
            record['cases'].append({'rows': rows, 'columns': columns, 'experts': 8,
                                    'tensor_sha256': hashes, 'packed_codes_checked': int(expected.size),
                                    'batch_equal': True, 'roundtrip_equal': True, 'memory': memory})
            del source, original, dense, converted, single, packed, p, word, expected, unpacked
            del reread, restored, direct, value
            mx.clear_cache()
        record['complete'] = True
        (options.out / 'receipt.json').write_text(json.dumps(record, indent=2) + '\n')
        print(json.dumps(record))


if __name__ == '__main__':
    main()
