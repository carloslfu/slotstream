# Generate the MTP parity fixture consumed by `slotstream mtp-parity`.
#
# Inputs are REAL: `slotstream mtp-fixture-inputs` captures embedding rows and
# pre-mixer multi streams from an actual prefill of the pinned model (random
# hidden inputs proved adversarial — the MTP layer's attention logits run an
# order sharper than main layers, and off-manifold inputs sit at near-ties
# where benign cross-framework bf16 noise flips the argmax key). This script
# runs the MLX reference MTP block on those inputs — a 4-entry prefill step
# and a 1-entry cached decode step — and stores inputs plus reference
# outputs. The Swift port must reproduce the outputs within tolerance.
#
# verify.sh regenerates the reference on the local machine at gate time
# (make_mtp_fixture.py [inputs [out]]), so the parity gate compares Swift
# against the SAME machine's kernels instead of a stored cross-machine
# fixture. The committed fixtures remain the documented format and the
# no-local-regen fallback.
#
# Run:  cd Tools/reference && ../../.venv/bin/python make_mtp_fixture.py [inputs.safetensors [out.safetensors]]

import json
import os
import sys
import types

import mlx.core as mx

# Reference outputs must come from the SAME mlx kernel family the Swift build
# pins (mlx-swift 0.31.x): run this with .venv31 (mlx 0.31.1). Kernels moved
# between 0.31 and 0.32 — and this layer's attention logits are sharp enough
# (hundreds, with sub-unit top-2 gaps) that an ulp of reduction-order drift
# flips near-tie keys and reads as a fake parity failure.
#
# On mlx 0.31.x, importing the mlx_lm package fails (its generate.py needs
# 0.32 APIs at import time); the same stub as Tools/parity_ref.py bypasses
# mlx_lm/__init__.py — the reference only needs mlx_lm.models submodules.
try:
    import mlx_lm  # noqa: F401
except Exception:
    import site

    for sp in site.getsitepackages() + [os.path.join(
            sys.prefix, "lib",
            f"python{sys.version_info.major}.{sys.version_info.minor}", "site-packages")]:
        root = os.path.join(sp, "mlx_lm")
        if os.path.isdir(root):
            pkg = types.ModuleType("mlx_lm")
            pkg.__path__ = [root]
            sys.modules["mlx_lm"] = pkg
            sub = types.ModuleType("mlx_lm.models")
            sub.__path__ = [os.path.join(root, "models")]
            sys.modules["mlx_lm.models"] = sub
            break

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from mtp_ref import load_mtp  # noqa: E402
from qwen4_exp import ModelArgs, RotaryEmbedding, _AttnCache  # noqa: E402

MODEL_DIR = os.path.expanduser("~/.slotstream/models/qwen38-flash-next-mlx-4bit")
# Optional argv override (verify.sh regenerates the reference on the local
# machine at gate time so the gate compares Swift against the same machine's
# kernels): `make_mtp_fixture.py [inputs.safetensors [out.safetensors]]`
INPUTS = sys.argv[1] if len(sys.argv) > 1 else os.path.join(
    HERE, "fixtures", "mtp_parity_inputs.safetensors")
OUT = sys.argv[2] if len(sys.argv) > 2 else os.path.join(
    HERE, "fixtures", "mtp_parity.safetensors")


def main() -> None:
    cfg = json.load(open(os.path.join(HERE, "config.json")))
    args = ModelArgs.from_dict(cfg).text
    m = load_mtp(os.path.join(MODEL_DIR, "mtp.safetensors"), args)
    rotary_dim = int(args.head_dim * args.partial_rotary_factor)
    rope = RotaryEmbedding(rotary_dim, args.rope_theta)

    fin = mx.load(INPUTS)
    emb, hid = fin["embedded"], fin["hidden"]
    emb2, hid2 = fin["embedded2"], fin["hidden2"]

    cache = _AttnCache()
    out1, multi1 = m(emb, hid, rope, cache)
    out2, multi2 = m(emb2, hid2, rope, cache)
    mx.eval(out1, multi1, out2, multi2)
    assert cache.offset == emb.shape[1] + 1

    fx = dict(fin)
    fx.update({"out1": out1, "multi1": multi1, "out2": out2, "multi2": multi2})
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    mx.save_safetensors(OUT, fx, metadata={"inputs": "real (mtp-fixture-inputs)"})
    for k, v in fx.items():
        print(k, v.dtype, v.shape)
    print("wrote", OUT)


if __name__ == "__main__":
    main()
