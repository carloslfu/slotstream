#!/usr/bin/env python3
"""Produce pinned rotary coefficients through the model's full position range.

This is component evidence only. It does not admit a native context length or
change the smaller embedded table used by existing candidate diagnostics.
"""
import argparse
import hashlib
import json
from pathlib import Path

from context_qualification import quiet_preflight, verification_lock
from vq_model_reference import ARCH_SHA256, instrument_identity, physical, references
from vq_rope_reference import EXPECTED

ROWS = 262_144
BYTES = ROWS * 2 * 32 * 4
PREFIX_SHA256 = "8914caa7d89a1f8a0038fc6c74933c46a3d56424767d3c30057dd4f5e61431b7"


def run(options):
    own = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    identity = instrument_identity()
    before = quiet_preflight(13)
    if options.out.exists():
        raise ValueError("extended rotary output must be new")
    with verification_lock():
        import mlx.core as mx
        import numpy as np

        mx.set_memory_limit(512_000_000)
        mx.set_cache_limit(16_000_000)
        arch, _ = references(options.architecture, options.runtime)
        rope = arch.RotaryEmbedding(64, 10_000_000.0)
        cosine, sine = rope(mx.arange(ROWS)[None])
        mx.eval(cosine, sine)
        values = [np.array(v.view(mx.uint32), dtype="<u4") for v in (cosine, sine)]
        inverse = np.array(rope.inv_freq.view(mx.uint32), dtype="<u4").tobytes()
        if hashlib.sha256(inverse).hexdigest() != EXPECTED["inverse"]:
            raise ValueError("inverse reference changed")
        hashes = {}
        for name, value in zip(("cosine", "sine"), values):
            if value.shape != (1, ROWS, 64) or not np.array_equal(value[:, :, :32], value[:, :, 32:]):
                raise ValueError("rotary geometry or duplicated halves changed")
            if hashlib.sha256(value[:, :512].tobytes()).hexdigest() != EXPECTED[name]:
                raise ValueError("original reference changed at the larger dispatch shape")
            hashes[name] = hashlib.sha256(value.tobytes()).hexdigest()
        raw = np.stack([v[0, :, :32] for v in values], axis=1).tobytes()
        if len(raw) != BYTES or hashlib.sha256(raw[:2054 * 2 * 32 * 4]).hexdigest() != PREFIX_SHA256:
            raise ValueError("extended table changed the entire admitted prefix")
        memory = physical()
        if instrument_identity()["sha256"] != identity["sha256"] or hashlib.sha256(Path(__file__).read_bytes()).hexdigest() != own:
            raise ValueError("rotary producer changed during execution")
        options.out.mkdir(parents=True, exist_ok=False)
        table = options.out / "angles-f32le.bin"
        with table.open("xb") as dest:
            dest.write(raw)
        result = {
            "schema": 1, "producer_sha256": own, "architecture_sha256": ARCH_SHA256,
            "runtime_sha256": hashlib.sha256(options.runtime.read_bytes()).hexdigest(),
            "instrument": identity, "before": before, "memory": memory,
            "rows": ROWS, "shape": [ROWS, 2, 32], "dtype": "F32LE", "bytes": BYTES,
            "prefix_rows": 2054, "prefix_sha256": PREFIX_SHA256,
            "table_sha256": hashlib.sha256(raw).hexdigest(),
            "full_duplicated_fp32_sha256": hashes, "qualification": "unproven",
            "scope": "Pinned coefficient component only; native contexts remain independently bounded and unqualified.",
        }
        (options.out / "table.json").write_text(json.dumps(result, indent=2) + "\n")
        print(json.dumps({k: result[k] for k in ("rows", "bytes", "table_sha256", "qualification")}))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ("architecture", "runtime", "out"):
        parser.add_argument("--" + name, type=Path, required=True)
    run(parser.parse_args())
