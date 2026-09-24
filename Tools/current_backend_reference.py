"""Run the independent Python model implementation on MLX 0.32.2.

Write live comparison outputs to an explicitly new experiment directory.
Never update the historical parity or MTP golden fixtures. These comparisons
check the Swift port; the float64 component oracles check the shared kernels.
"""
import argparse
import ctypes
import ctypes.util
import fcntl
import hashlib
import json
import os
from pathlib import Path
import resource
import struct
import sys
import threading

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "Tools"))
from prefill_bench import preflight, vm_snapshot

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--kind", choices=["layers", "mtp"], required=True)
parser.add_argument("--out", type=Path, required=True)
parser.add_argument("--model", type=Path,
                    default=Path.home() / ".slotstream/models/qwen38-flash-next-mlx-4bit")
options = parser.parse_args()
kind, out, modeldir = options.kind, options.out, options.model
before = preflight(14)
model_lock = open(f"/tmp/slotstream-model-{os.getuid()}.lock", "a")
fcntl.flock(model_lock, fcntl.LOCK_EX | fcntl.LOCK_NB)

import mlx.core as mx
import mlx.nn as nn
import numpy as np

if mx.__version__ != "0.32.2":
    raise RuntimeError("current backend comparison requires MLX 0.32.2, got " + mx.__version__)
mx.set_cache_limit(128 << 20)
out.mkdir(parents=True, exist_ok=False)
libproc = ctypes.CDLL(ctypes.util.find_library("proc"))


def physical():
    # macOS rusage_info_v4 ABI: uuid[16], then 35 uint64 fields. Physical
    # footprint is field 7; the lifetime maximum is field 28. RSS alone
    # misses allocations that Metal has released before the observation.
    data = ctypes.create_string_buffer(296)
    if libproc.proc_pid_rusage(os.getpid(), 4, data) != 0:
        raise RuntimeError("physical footprint unavailable")
    return {"current_bytes": int.from_bytes(data.raw[72:80], "little"),
            "lifetime_peak_bytes": int.from_bytes(data.raw[240:248], "little"),
            "rss_peak_bytes": resource.getrusage(resource.RUSAGE_SELF).ru_maxrss}


stop = threading.Event()


def guard_memory():
    while not stop.wait(.05):
        try:
            memory = physical()
        except Exception as error:
            (out / "memory-observation-error.txt").write_text(str(error) + "\n")
            os._exit(98)
        if max(memory.values()) > 10_000_000_000:
            (out / "memory-refusal.json").write_text(json.dumps(memory, indent=2) + "\n")
            os._exit(99)


threading.Thread(target=guard_memory, daemon=True).start()
if kind == "layers":
    from parity_ref import load_reference

    ref = load_reference(str(modeldir / "qwen4_exp.py"))
    cfg = json.loads((modeldir / "config.json").read_text())
    args = ref.ModelArgs.from_dict(cfg)
    targs = args.text
    model = ref.Model(args)
    tokens = [9707, 11, 1246, 525, 498, 30]
    wanted = tuple([f"model.layers.{i}." for i in range(2)] +
                   ["model.embed_tokens", "model.hyper_connection_mixer", "lm_head"])
    index = json.loads((modeldir / "model.safetensors.index.json").read_text())["weight_map"]
    selected = {name: shard for name, shard in index.items()
                if name.removeprefix("language_model.").startswith(wanted)
                and "ngram_embedding.shard_" not in name}
    arrays = {}
    for shard in sorted(set(selected.values())):
        loaded = mx.load(str(modeldir / shard))
        arrays.update({name: loaded[name] for name, file in selected.items() if file == shard})
    weights = model.sanitize(arrays)
    qcfg = cfg.get("quantization", {})

    def predicate(name, module):
        if "ngram_embedding.shard_" in name:
            return False  # Replaced with bounded storage below, never evaluated.
        if name in qcfg:
            return qcfg[name]
        return hasattr(module, "to_quantized") and name + ".scales" in weights

    nn.quantize(model, group_size=qcfg.get("group_size", 64), bits=qcfg.get("bits", 4),
                class_predicate=predicate)
    model.load_weights(list(weights.items()), strict=False)
    model.eval()

    # Storage-only adapter: the Python embedding loads a complete large
    # shard before gathering. Read its requested rows from the original
    # safetensors, then use the same dequantization operator. Hashing,
    # position/state logic and every model layer remain the reference.
    class RowTable(nn.Module):
        def __init__(self, base):
            super().__init__()
            self._base = base

        def __call__(self, indices):
            rows = np.array(indices).reshape(-1).tolist()
            assert 0 < len(rows) <= len(tokens) * targs.heads_per_ngram * (targs.ngram_size - 1)

            def read(suffix):
                name = self._base + suffix
                with (modeldir / index[name]).open("rb") as file:
                    length = struct.unpack("<Q", file.read(8))[0]
                    assert length <= 64 * 1024 * 1024
                    info = json.loads(file.read(length))[name]
                    shape, dtype = info["shape"], info["dtype"]
                    assert len(shape) == 2
                    width = {"U32": 4, "BF16": 2, "F16": 2, "F32": 4}[dtype]
                    record = shape[1] * width
                    assert info["data_offsets"][1] - info["data_offsets"][0] == shape[0] * record
                    pieces = []
                    for row in rows:
                        assert 0 <= row < shape[0]
                        file.seek(8 + length + info["data_offsets"][0] + row * record)
                        value = file.read(record)
                        assert len(value) == record
                        pieces.append(value)
                raw = b"".join(pieces)
                if dtype == "BF16":
                    values = (np.frombuffer(raw, np.uint16).astype(np.uint32) << 16).view(np.float32)
                    return mx.array(values.reshape(len(rows), shape[1])).astype(mx.bfloat16)
                values = np.frombuffer(raw, {"U32": np.uint32, "F16": np.float16, "F32": np.float32}[dtype])
                return mx.array(values.reshape(len(rows), shape[1]))

            config = qcfg[self._base.removeprefix("language_model.")]
            return mx.dequantize(read(".weight"), read(".scales"), read(".biases"),
                                 group_size=config["group_size"], bits=config["bits"])

    ple = targs.ple_layer_ids[0] - 1
    ng = model.model.layers[ple].ple.ple_embedding
    prefix = f"language_model.model.layers.{ple}.ple.ple_embedding.ngram_embedding."
    for shard in range(ng.n_shards):
        setattr(ng.ngram_embedding, f"shard_{shard}", RowTable(prefix + f"shard_{shard}"))
    text = model.model
    ids = mx.array([tokens])
    h = mx.tile(text.embed_tokens(ids), (1, 1, text.hc))
    caches = model.make_cache()
    eos = targs.eos_token_id if not isinstance(targs.eos_token_id, list) else targs.eos_token_id[0]
    previous = mx.full((1, targs.ngram_size - 1), eos, mx.int64)
    for i in range(2):
        cache = caches[i]
        idx = cache.indexer if hasattr(cache, "indexer") else None
        h = text.layers[i](h, text.rope, None, None, cache, idx, ids, previous)
        mx.eval(h)
        np.array(h.astype(mx.float32)).tofile(out / f"layer_{i}.bin")
        print("completed independent layer", i, flush=True)
    sources = [modeldir / "qwen4_exp.py", ROOT / "Tools/parity_ref.py"]
else:
    sys.path.insert(0, str(ROOT / "Tools/reference"))
    from mtp_ref import load_mtp
    from qwen4_exp import ModelArgs, RotaryEmbedding, _AttnCache

    args = ModelArgs.from_dict(json.loads((ROOT / "Tools/reference/config.json").read_text())).text
    model = load_mtp(str(modeldir / "mtp.safetensors"), args)
    rope = RotaryEmbedding(int(args.head_dim * args.partial_rotary_factor), args.rope_theta)
    inputs = ROOT / "Tools/reference/fixtures/mtp_parity_inputs.safetensors"
    arrays = mx.load(str(inputs))
    cache = _AttnCache()
    a, ma = model(arrays["embedded"], arrays["hidden"], rope, cache)
    b, mb = model(arrays["embedded2"], arrays["hidden2"], rope, cache)
    mx.eval(a, ma, b, mb)
    assert cache.offset == arrays["embedded"].shape[1] + 1
    mx.save_safetensors(str(out / "comparison.safetensors"), dict(arrays, out1=a, multi1=ma, out2=b, multi2=mb))
    sources = [ROOT / "Tools/reference/mtp_ref.py", ROOT / "Tools/reference/qwen4_exp.py", inputs]

memory = physical()
assert max(memory.values()) <= 10_000_000_000, memory
receipt = {"mlx": mx.__version__, "kind": kind, "before": before, "after": vm_snapshot(),
           "mlx_peak_bytes": mx.get_peak_memory(), "process_memory": memory, "method": __doc__,
           "script_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
           "reference_sources": {str(p.relative_to(ROOT)) if p.is_relative_to(ROOT) else p.name:
                                 hashlib.sha256(p.read_bytes()).hexdigest() for p in sources}}
(out / "receipt.json").write_text(json.dumps(receipt, indent=2) + "\n")
stop.set()
