#!/usr/bin/env python3
"""Convert the MTP (multi-token-prediction) block from the official
Qwen/Qwen3.8-Flash-Next release into slotstream's 4-bit MLX format.

The pinned community conversion (pipenetwork/Qwen3.8-Flash-Next-MLX-4bit)
drops all `mtp.*` tensors, so this script pulls exactly those 31 tensors from
the official bf16 release via HTTP Range requests (4.9 GB, not the full
250+ GB checkpoint), applies the same transforms the community conversion
applied to the main model, quantizes to the same recipe, and writes
`mtp.safetensors` + `mtp.provenance.json` next to the pinned files.

Transforms (mirroring Tools/reference/qwen4_exp.py `sanitize` + the observed
on-disk conventions of the pinned checkpoint):
  - experts.gate_up_proj [E, 2*I, H] -> switch_mlp.gate_proj/up_proj (chunk 2, gate first)
  - experts.down_proj -> switch_mlp.down_proj
  - centered norms get +1 folded in ONCE (raw checkpoint stores w for x*(1+w)):
    hc_norm, q_norm, k_norm, indexer q/k layernorm — the reference list — plus
    the MTP-only pre_fc_norm_embedding / pre_fc_norm_hidden, which vLLM's
    Qwen4ExpMultiTokenPredictor builds as GemmaRMSNorm (the 1+w convention).
  - quantize 4-bit / group 64 affine (U32 weight + BF16 scales/biases), except
    the tensors the pinned checkpoint leaves in BF16: mlp.gate,
    shared_expert_gate, block_inject_weight, indexer.index_qk_proj, all norms.

Run:  .venv/bin/python Tools/mtp_convert.py [--staging-only]
"""

import argparse
import concurrent.futures
import hashlib
import json
import os
import struct
import subprocess
import sys
import time
import urllib.request

REPO = "Qwen/Qwen3.8-Flash-Next"
REVISION = "de4b8e4d43b917e7706784d8bb445c9af86a3540"  # main @ 2026-08-27
MODEL_DIR = os.path.expanduser("~/.slotstream/models/qwen38-flash-next-mlx-4bit")
STAGING = os.path.join(MODEL_DIR, ".mtp-staging")
OUT_FILE = os.path.join(MODEL_DIR, "mtp.safetensors")
PROV_FILE = os.path.join(MODEL_DIR, "mtp.provenance.json")

GROUP, BITS = 64, 4

# The 31 tensors under `mtp.` in the official checkpoint (verified live against
# the pinned revision's index at script start — a mismatch aborts).
EXPECTED_SRC = {
    "mtp.fc_embedding.weight",
    "mtp.fc_hidden.weight",
    "mtp.hyper_connection_mixer.hc_norm.weight",
    "mtp.hyper_connection_mixer.input_mix_weight_down.weight",
    "mtp.hyper_connection_mixer.input_mix_weight_up.weight",
    "mtp.layers.0.attn_hyper_connection.block_inject_weight.weight",
    "mtp.layers.0.attn_hyper_connection.hc_norm.weight",
    "mtp.layers.0.attn_hyper_connection.input_mix_weight_down.weight",
    "mtp.layers.0.attn_hyper_connection.input_mix_weight_up.weight",
    "mtp.layers.0.mlp.experts.down_proj",
    "mtp.layers.0.mlp.experts.gate_up_proj",
    "mtp.layers.0.mlp.gate.weight",
    "mtp.layers.0.mlp.shared_expert.down_proj.weight",
    "mtp.layers.0.mlp.shared_expert.gate_proj.weight",
    "mtp.layers.0.mlp.shared_expert.up_proj.weight",
    "mtp.layers.0.mlp.shared_expert_gate.weight",
    "mtp.layers.0.mlp_hyper_connection.block_inject_weight.weight",
    "mtp.layers.0.mlp_hyper_connection.hc_norm.weight",
    "mtp.layers.0.mlp_hyper_connection.input_mix_weight_down.weight",
    "mtp.layers.0.mlp_hyper_connection.input_mix_weight_up.weight",
    "mtp.layers.0.self_attn.indexer.index_qk_proj.weight",
    "mtp.layers.0.self_attn.indexer.k_layernorm.weight",
    "mtp.layers.0.self_attn.indexer.q_layernorm.weight",
    "mtp.layers.0.self_attn.k_norm.weight",
    "mtp.layers.0.self_attn.k_proj.weight",
    "mtp.layers.0.self_attn.o_proj.weight",
    "mtp.layers.0.self_attn.q_norm.weight",
    "mtp.layers.0.self_attn.q_proj.weight",
    "mtp.layers.0.self_attn.v_proj.weight",
    "mtp.pre_fc_norm_embedding.weight",
    "mtp.pre_fc_norm_hidden.weight",
}

# +1 fold at conversion (raw stores deviation-from-one). The reference's
# CENTERED_NORMS entries that occur in the MTP block, plus the two pre_fc
# norms vLLM instantiates as GemmaRMSNorm.
CENTERED = (
    "hc_norm.weight",
    "q_norm.weight",
    "k_norm.weight",
    "indexer.q_layernorm.weight",
    "indexer.k_layernorm.weight",
    "pre_fc_norm_embedding.weight",
    "pre_fc_norm_hidden.weight",
)

# Stays BF16 (matches the pinned checkpoint's on-disk choice for the same
# module names on main-model layers).
KEEP_BF16 = (
    "mlp.gate.weight",
    "shared_expert_gate.weight",
    "block_inject_weight.weight",
    "indexer.index_qk_proj.weight",
)


def hf_url(path: str) -> str:
    return f"https://huggingface.co/{REPO}/resolve/{REVISION}/{path}"


def fetch(url: str, rng: tuple[int, int] | None = None) -> bytes:
    for attempt in range(4):
        cmd = ["curl", "--fail", "--location", "--silent", "--show-error", url]
        if rng is not None:
            cmd[1:1] = ["--range", f"{rng[0]}-{rng[1]}"]
        r = subprocess.run(cmd, capture_output=True)
        if r.returncode == 0:
            return r.stdout
        time.sleep(2 * (attempt + 1))
    raise RuntimeError(f"download failed: {url} {r.stderr.decode()[:200]}")


def shard_header(shard: str) -> tuple[dict, int]:
    """Parse a remote safetensors header: (tensor table, data start offset)."""
    n = struct.unpack("<Q", fetch(hf_url(shard), (0, 7)))[0]
    if n > 50 << 20:
        raise RuntimeError(f"{shard}: implausible header length {n}")
    hdr = json.loads(fetch(hf_url(shard), (8, 8 + n - 1)))
    return hdr, 8 + n


def download_tensor(name: str, shard: str, entry: dict, data_start: int) -> str:
    """Range-download one tensor's bytes into staging; resume-safe."""
    lo, hi = entry["data_offsets"]
    size = hi - lo
    path = os.path.join(STAGING, name.replace("/", "_") + ".bin")
    have = os.path.getsize(path) if os.path.exists(path) else 0
    if have == size:
        return path
    if have > size:
        os.remove(path)
        have = 0
    abs_lo = data_start + lo + have
    abs_hi = data_start + hi - 1
    with open(path, "ab") as f:
        got = fetch(hf_url(shard), (abs_lo, abs_hi))
        if len(got) != size - have:
            raise RuntimeError(f"{name}: got {len(got)} bytes, wanted {size - have}")
        f.write(got)
    return path


def sha256_file(path: str) -> str:
    h = hashlib.sha256()
    with open(path, "rb") as f:
        while chunk := f.read(8 << 20):
            h.update(chunk)
    return h.hexdigest()


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--staging-only", action="store_true", help="download, skip convert")
    args = ap.parse_args()

    os.makedirs(STAGING, exist_ok=True)

    # ---- locate every mtp tensor in the official shards
    idx = json.loads(fetch(hf_url("model.safetensors.index.json")))
    wm = idx["weight_map"]
    mtp = {k: v for k, v in wm.items() if k.startswith("mtp.")}
    if set(mtp) != EXPECTED_SRC:
        missing = EXPECTED_SRC - set(mtp)
        extra = set(mtp) - EXPECTED_SRC
        raise RuntimeError(f"mtp tensor set changed upstream: missing={missing} extra={extra}")

    shards = sorted(set(mtp.values()))
    print(f"{len(mtp)} mtp tensors across {len(shards)} shards; reading headers...")
    headers: dict[str, tuple[dict, int]] = {}
    with concurrent.futures.ThreadPoolExecutor(max_workers=8) as ex:
        for shard, res in zip(shards, ex.map(shard_header, shards)):
            headers[shard] = res

    total = 0
    plan: list[tuple[str, str, dict, int]] = []
    for name, shard in sorted(mtp.items()):
        hdr, data_start = headers[shard]
        entry = hdr[name]
        lo, hi = entry["data_offsets"]
        total += hi - lo
        plan.append((name, shard, entry, data_start))
    print(f"total to download: {total/1e9:.3f} GB (bf16 source bytes)")

    t0 = time.time()
    done = 0
    with concurrent.futures.ThreadPoolExecutor(max_workers=6) as ex:
        futs = {
            ex.submit(download_tensor, name, shard, entry, ds): name
            for name, shard, entry, ds in plan
        }
        for fut in concurrent.futures.as_completed(futs):
            fut.result()
            done += 1
            print(f"  [{done}/{len(plan)}] {futs[fut]}")
    print(f"downloaded in {time.time()-t0:.0f}s")

    raw_sha = {
        name: sha256_file(os.path.join(STAGING, name.replace("/", "_") + ".bin"))
        for name, _, _, _ in plan
    }
    if args.staging_only:
        print("staging only; stopping before convert")
        return

    # ---- convert with mlx
    import mlx.core as mx
    import numpy as np

    def load_bf16(name: str, shape: list[int]) -> mx.array:
        path = os.path.join(STAGING, name.replace("/", "_") + ".bin")
        u16 = np.fromfile(path, dtype=np.uint16)
        a = mx.array(u16).view(mx.bfloat16).reshape(shape)
        mx.eval(a)
        return a

    dtypes = {name: (entry["dtype"], entry["shape"]) for name, _, entry, _ in plan}
    for name, (dt, _) in dtypes.items():
        if dt != "BF16":
            raise RuntimeError(f"{name}: unexpected source dtype {dt}")

    out: dict[str, mx.array] = {}

    def emit_quant(dst: str, w: mx.array) -> None:
        wq, scales, biases = mx.quantize(w, group_size=GROUP, bits=BITS)
        assert wq.dtype == mx.uint32, wq.dtype
        out[dst + ".weight"] = wq
        out[dst + ".scales"] = scales.astype(mx.bfloat16)
        out[dst + ".biases"] = biases.astype(mx.bfloat16)
        mx.eval(wq, scales, biases)

    for name, shard, entry, _ in plan:
        shape = entry["shape"]
        if name == "mtp.layers.0.mlp.experts.gate_up_proj":
            v = load_bf16(name, shape)  # [E, 2I, H], gate rows first (reference chunk(2))
            inter = shape[1] // 2
            emit_quant("mtp.layers.0.mlp.switch_mlp.gate_proj", v[:, :inter, :])
            emit_quant("mtp.layers.0.mlp.switch_mlp.up_proj", v[:, inter:, :])
            del v
            continue
        if name == "mtp.layers.0.mlp.experts.down_proj":
            v = load_bf16(name, shape)
            emit_quant("mtp.layers.0.mlp.switch_mlp.down_proj", v)
            del v
            continue
        v = load_bf16(name, shape)
        if name.endswith(CENTERED):
            v = (v.astype(mx.float32) + 1.0).astype(mx.bfloat16)
        if name.endswith(KEEP_BF16) or name.endswith("norm.weight") \
                or name.endswith("layernorm.weight") or name.endswith(CENTERED):
            out[name] = v
            mx.eval(v)
            continue
        emit_quant(name.removesuffix(".weight"), v)
        del v

    # ---- structural verification against the pinned checkpoint's conventions
    H, HC, E, I, NH, ND, KV = 2560, 4, 512, 640, 24, 256, 2
    expect = {
        "mtp.fc_embedding.weight": (mx.uint32, [H, H // 8]),
        "mtp.fc_hidden.weight": (mx.uint32, [H, H // 8]),
        "mtp.pre_fc_norm_embedding.weight": (mx.bfloat16, [H]),
        "mtp.pre_fc_norm_hidden.weight": (mx.bfloat16, [HC * H]),
        "mtp.hyper_connection_mixer.hc_norm.weight": (mx.bfloat16, [HC * H]),
        "mtp.layers.0.self_attn.q_proj.weight": (mx.uint32, [NH * 2 * ND, H // 8]),
        "mtp.layers.0.self_attn.k_proj.weight": (mx.uint32, [KV * ND, H // 8]),
        "mtp.layers.0.self_attn.v_proj.weight": (mx.uint32, [KV * ND, H // 8]),
        "mtp.layers.0.self_attn.o_proj.weight": (mx.uint32, [H, NH * ND // 8]),
        "mtp.layers.0.self_attn.q_norm.weight": (mx.bfloat16, [ND]),
        "mtp.layers.0.self_attn.indexer.index_qk_proj.weight": (mx.bfloat16, [640, H]),
        "mtp.layers.0.mlp.gate.weight": (mx.bfloat16, [E, H]),
        "mtp.layers.0.mlp.switch_mlp.gate_proj.weight": (mx.uint32, [E, I, H // 8]),
        "mtp.layers.0.mlp.switch_mlp.down_proj.weight": (mx.uint32, [E, H, I // 8]),
        "mtp.layers.0.mlp.shared_expert_gate.weight": (mx.bfloat16, [1, H]),
        "mtp.layers.0.attn_hyper_connection.block_inject_weight.weight": (mx.bfloat16, [HC, HC * H]),
        "mtp.layers.0.attn_hyper_connection.input_mix_weight_down.weight": (mx.uint32, [320, HC * H // 8]),
        "mtp.layers.0.attn_hyper_connection.input_mix_weight_up.weight": (mx.uint32, [HC * H, 320 // 8]),
    }
    for k, (dt, shape) in expect.items():
        if k not in out:
            raise RuntimeError(f"missing output tensor {k}")
        if out[k].dtype != dt or list(out[k].shape) != shape:
            raise RuntimeError(f"{k}: got {out[k].dtype} {out[k].shape}, want {dt} {shape}")
    for k, v in out.items():
        if v.dtype == mx.uint32:
            base = k.removesuffix(".weight")
            for side in (".scales", ".biases"):
                s = out.get(base + side)
                if s is None or s.dtype != mx.bfloat16:
                    raise RuntimeError(f"{base}{side} missing or wrong dtype")
                if list(s.shape) != list(v.shape[:-1]) + [v.shape[-1] * 8 // GROUP]:
                    raise RuntimeError(f"{base}{side}: shape {s.shape} vs weight {v.shape}")

    # quantization sanity: dequantized fc_embedding should sit close to source
    src = load_bf16("mtp.fc_embedding.weight", [H, H]).astype(mx.float32)
    deq = mx.dequantize(
        out["mtp.fc_embedding.weight"],
        scales=out["mtp.fc_embedding.scales"],
        biases=out["mtp.fc_embedding.biases"],
        group_size=GROUP, bits=BITS,
    ).astype(mx.float32)
    rel = (mx.sqrt(mx.mean((src - deq) ** 2)) / mx.sqrt(mx.mean(src**2))).item()
    print(f"fc_embedding quantization relative RMS error: {rel:.4f}")
    if rel > 0.10:
        raise RuntimeError(f"quantization error implausibly high: {rel}")

    mx.save_safetensors(
        OUT_FILE, out,
        metadata={
            "source_repo": REPO, "source_revision": REVISION,
            "recipe": f"{BITS}-bit group {GROUP} affine, router/gates/norms bf16, "
                      "centered norms +1-folded (incl. pre_fc norms)",
        },
    )
    prov = {
        "source_repo": REPO,
        "source_revision": REVISION,
        "raw_tensor_sha256": raw_sha,
        "output_sha256": sha256_file(OUT_FILE),
        "output_bytes": os.path.getsize(OUT_FILE),
        "centered_plus_one": list(CENTERED),
        "kept_bf16": list(KEEP_BF16) + ["*norm.weight", "*layernorm.weight"],
        "quant": {"bits": BITS, "group_size": GROUP, "mode": "affine"},
        "created": time.strftime("%Y-%m-%dT%H:%M:%S%z"),
    }
    with open(PROV_FILE, "w") as f:
        json.dump(prov, f, indent=2, sort_keys=True)
    print(f"wrote {OUT_FILE} ({os.path.getsize(OUT_FILE)/1e9:.3f} GB)")
    print(f"sha256 {prov['output_sha256']}")

    # The 4.9 GB of raw bf16 staging is re-downloadable at the pinned revision
    # and its per-tensor sha256s are in the provenance file — reclaim the disk.
    import shutil
    shutil.rmtree(STAGING)
    print(f"removed staging {STAGING}")


if __name__ == "__main__":
    main()
