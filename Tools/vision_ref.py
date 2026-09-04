#!/usr/bin/env python3
"""Independent reference for the vision tower, and the comparison against Swift.

The tower fails silently. A transposed weight, a rotary embedding laid out in
the wrong half, a merger norm applied after the 2x2 shuffle instead of before —
every one of those still produces embeddings of the right shape, and the model
still writes fluent sentences, about a picture it did not see. Nothing
downstream can tell. So this is written from the Qwen3-VL reference
(`transformers/models/qwen3_vl/modeling_qwen3_vl.py`, `Qwen3VLVisionModel`)
rather than from `Vision.swift`, in mlx, and the two are compared.

    .build/release/slotstream vision-parity --out .build/vision-parity
    .venv31/bin/python Tools/vision_ref.py .build/vision-parity

Uses the same mlx 0.31.1 the parity goldens use (Tools/parity_ref.py, and see
CLAUDE.md: 0.31.x and 0.32.x kernels differ measurably). It loads the 333
`vision_tower.*` tensors only — about 0.9 GB — never the 105 GB trunk.
"""
import json
import math
import os
import sys

import mlx.core as mx
import numpy as np


def load_tower(model_dir):
    """The vision tensors, from whichever shard holds them."""
    index = json.load(open(os.path.join(model_dir, "model.safetensors.index.json")))
    want = {k: f for k, f in index["weight_map"].items() if k.startswith("vision_tower.")}
    out = {}
    for shard in sorted(set(want.values())):
        arrays = mx.load(os.path.join(model_dir, shard))
        for k in want:
            if want[k] == shard:
                out[k] = arrays[k]
    return out


def config(model_dir):
    v = json.load(open(os.path.join(model_dir, "config.json")))["vision_config"]
    return {
        "hidden": v["hidden_size"], "depth": v["depth"], "heads": v["num_heads"],
        "patch": v["patch_size"], "merge": v["spatial_merge_size"],
        "tps": v["temporal_patch_size"], "out": v["out_hidden_size"],
        "npos": v["num_position_embeddings"],
    }


def merge_order(gh, gw, merge):
    """Patch indices in the order the processor emits them.

    Both the reference and slotstream reorder patches into 2x2 merge blocks
    before the tower runs, because the merger consumes four consecutive rows as
    one token. Every position-dependent quantity below — the interpolated
    position embedding, the rotary angles — is built in this order, so getting
    it wrong shifts the whole picture by one block and produces a plausible
    embedding of a scrambled image.
    """
    order = []
    for bh in range(gh // merge):
        for bw in range(gw // merge):
            for ir in range(merge):
                for ic in range(merge):
                    order.append((bh * merge + ir, bw * merge + ic))
    return order


def pos_embed(weights, cfg, gh, gw):
    """`fast_pos_embed_interpolate`: bilinear resample of the 48x48 grid."""
    g = int(round(math.sqrt(cfg["npos"])))
    table = np.array(weights["vision_tower.pos_embed.weight"].astype(mx.float32))

    def axis(n):
        # linspace(0, g-1, n), then floor/ceil with the ceil clipped.
        v = np.zeros(n) if n == 1 else np.linspace(0, g - 1, n)
        f = v.astype(int)
        return f, np.minimum(f + 1, g - 1), v - f

    hf, hc, dh = axis(gh)
    wf, wc, dw = axis(gw)
    rows = []
    for r, c in merge_order(gh, gw, cfg["merge"]):
        a = table[hf[r] * g + wf[c]] * ((1 - dh[r]) * (1 - dw[c]))
        b = table[hf[r] * g + wc[c]] * ((1 - dh[r]) * dw[c])
        d = table[hc[r] * g + wf[c]] * (dh[r] * (1 - dw[c]))
        e = table[hc[r] * g + wc[c]] * (dh[r] * dw[c])
        rows.append(a + b + d + e)
    return np.stack(rows).astype(np.float32)


def rope(cfg, gh, gw):
    """2-D rotary angles, h-frequencies then w-frequencies, doubled."""
    head_dim = cfg["hidden"] // cfg["heads"]
    dim = head_dim // 2
    inv = 1.0 / (10000.0 ** (np.arange(0, dim, 2) / dim))
    rows = []
    for r, c in merge_order(gh, gw, cfg["merge"]):
        half = np.concatenate([r * inv, c * inv])
        rows.append(np.concatenate([half, half]))
    ang = np.stack(rows)
    return np.cos(ang).astype(np.float32), np.sin(ang).astype(np.float32)


def layer_norm(x, w, b, eps=1e-6):
    m = x.mean(-1, keepdims=True)
    v = x.var(-1, keepdims=True)
    return (x - m) / np.sqrt(v + eps) * w + b


def gelu_tanh(x):
    return 0.5 * x * (1 + np.tanh(0.7978845608 * (x + 0.044715 * x ** 3)))




def gelu_exact_np(x):
    # math.erf elementwise; scipy is not a dependency of this repo.
    return 0.5 * x * (1 + np.vectorize(math.erf)(x / math.sqrt(2)))


def forward(weights, cfg, pixels, gh, gw):
    """The reference tower, in float32 numpy. Slow and obvious on purpose."""
    def w(name):
        return np.array(weights["vision_tower." + name].astype(mx.float32))

    n = gh * gw
    heads, hidden = cfg["heads"], cfg["hidden"]
    head_dim = hidden // heads

    # patch embed: [out, C, t, h, w] flattened to [out, C*t*h*w]
    pw = w("patch_embed.proj.weight").reshape(hidden, -1)
    x = pixels @ pw.T + w("patch_embed.proj.bias")
    x = x + pos_embed(weights, cfg, gh, gw)

    cos, sin = rope(cfg, gh, gw)

    def rotate_half(v):
        half = v.shape[-1] // 2
        return np.concatenate([-v[..., half:], v[..., :half]], axis=-1)

    for i in range(cfg["depth"]):
        p = f"blocks.{i}."
        h = layer_norm(x, w(p + "norm1.weight"), w(p + "norm1.bias"))
        qkv = h @ w(p + "attn.qkv.weight").T + w(p + "attn.qkv.bias")
        qkv = qkv.reshape(n, 3, heads, head_dim)
        q, k, v = qkv[:, 0], qkv[:, 1], qkv[:, 2]
        c = cos[:, None, :]
        s = sin[:, None, :]
        q = q * c + rotate_half(q) * s
        k = k * c + rotate_half(k) * s
        q = q.transpose(1, 0, 2)
        k = k.transpose(1, 0, 2)
        v = v.transpose(1, 0, 2)
        scores = q @ k.transpose(0, 2, 1) / math.sqrt(head_dim)
        scores = scores - scores.max(-1, keepdims=True)
        p_attn = np.exp(scores)
        p_attn = p_attn / p_attn.sum(-1, keepdims=True)
        ctx = (p_attn @ v).transpose(1, 0, 2).reshape(n, hidden)
        x = x + ctx @ w(p + "attn.proj.weight").T + w(p + "attn.proj.bias")

        h = layer_norm(x, w(p + "norm2.weight"), w(p + "norm2.bias"))
        h = gelu_tanh(h @ w(p + "mlp.linear_fc1.weight").T + w(p + "mlp.linear_fc1.bias"))
        x = x + h @ w(p + "mlp.linear_fc2.weight").T + w(p + "mlp.linear_fc2.bias")

    # merger: norm BEFORE the shuffle (the checkpoint's norm is [hidden], not
    # [hidden*merge^2], which is what says so).
    x = layer_norm(x, w("merger.norm.weight"), w("merger.norm.bias"))
    m2 = cfg["merge"] ** 2
    x = x.reshape(n // m2, hidden * m2)
    x = x @ w("merger.linear_fc1.weight").T + w("merger.linear_fc1.bias")
    x = gelu_exact_np(x)
    return x @ w("merger.linear_fc2.weight").T + w("merger.linear_fc2.bias")


def cosine(a, b):
    return float((a * b).sum() / (np.linalg.norm(a) * np.linalg.norm(b) + 1e-12))


def per_token_cosine(a, b):
    return (a * b).sum(1) / (
        np.linalg.norm(a, axis=1) * np.linalg.norm(b, axis=1) + 1e-12)


def main():
    if len(sys.argv) < 2:
        print(__doc__, file=sys.stderr)
        return 2
    d = sys.argv[1]
    man = json.load(open(os.path.join(d, "manifest.json")))
    cfg = config(man["model_dir"])
    for key, got in [("depth", cfg["depth"]), ("num_heads", cfg["heads"]),
                     ("hidden_size", cfg["hidden"]), ("out_hidden_size", cfg["out"])]:
        if man[key] != got:
            print(f"FAIL  manifest {key}={man[key]} but config.json says {got}")
            return 1

    pixels = np.fromfile(os.path.join(d, "pixels.bin"), dtype=np.float32)
    pixels = pixels.reshape(man["patches"], man["features_per_patch"])
    swift = np.fromfile(os.path.join(d, "embed.bin"), dtype=np.float32)
    swift = swift.reshape(man["merged_tokens"], man["out_hidden_size"])

    print(f"loading the vision tower from {man['model_dir']}")
    weights = load_tower(man["model_dir"])
    print(f"  {len(weights)} tensors")
    print(f"reference forward over {man['patches']} patches "
          f"(grid {man['grid_w']}x{man['grid_h']}) ...")
    # Three implementations, two of them independent of MLX kernels:
    #   numpy  float32 — written from the transformers reference, no mlx ops
    #   mlx    float32 — same math, mlx kernels, fused attention
    #   mlx  bfloat16  — same math at the dtype slotstream runs
    ref = forward(weights, cfg, pixels.astype(np.float32), man["grid_h"], man["grid_w"])
    mlx32 = forward_mlx(weights, cfg, pixels, man["grid_h"], man["grid_w"], mx.float32)
    mlx16 = forward_mlx(weights, cfg, pixels, man["grid_h"], man["grid_w"], mx.bfloat16)

    if ref.shape != swift.shape:
        print(f"FAIL  shape {swift.shape} vs reference {ref.shape}")
        return 1

    # WHAT THIS GATE IS, AND WHY IT IS NOT AN EQUALITY.
    #
    # The tower runs in bfloat16: 8 mantissa bits, 27 residual blocks deep. The
    # same reference at float32 and at bfloat16 disagrees with itself by more
    # than slotstream disagrees with either (measured: 0.99841 between the two
    # dtypes, 0.99870 Swift-to-float32, 0.99878 Swift-to-bfloat16), and the
    # tokens they disagree on most are the low-norm ones, where a tiny absolute
    # error is a large angle. So an absolute tolerance would either be so loose
    # it proves nothing or so tight nothing can pass — the same trap
    # `prefix-check` documents for reuse-versus-rebuild.
    #
    # The property that IS decidable: slotstream must sit inside the band the
    # dtype itself spans. A transposed weight, a rotary half swapped, a merger
    # norm on the wrong side of the shuffle — none of those land inside it.
    band = cosine(mlx16, ref)
    rows = [
        ("swift        vs numpy f32", cosine(swift, ref), per_token_cosine(swift, ref).min()),
        ("swift        vs mlx  f32", cosine(swift, mlx32), per_token_cosine(swift, mlx32).min()),
        ("swift        vs mlx  bf16", cosine(swift, mlx16), per_token_cosine(swift, mlx16).min()),
        ("mlx bf16     vs numpy f32", band, per_token_cosine(mlx16, ref).min()),
        ("mlx f32      vs numpy f32", cosine(mlx32, ref), per_token_cosine(mlx32, ref).min()),
    ]
    print(f"  tokens          {ref.shape[0]} x {ref.shape[1]}")
    print(f"  mean |ref|      {np.abs(ref).mean():.6f}")
    for name, c, worst in rows:
        print(f"  {name}:  cosine {c:.8f}  worst token {worst:.6f}")

    # The two float32 implementations share no kernels, so they must agree
    # tightly; that is what makes the band above trustworthy.
    kernels_agree = cosine(mlx32, ref) > 0.9999
    inside_band = cosine(swift, ref) >= band - 1e-4
    close_at_dtype = cosine(swift, mlx16) > 0.998
    print(f"  float32 implementations agree      {kernels_agree}")
    print(f"  slotstream inside the dtype band   {inside_band}")
    print(f"  slotstream matches bf16 reference  {close_at_dtype}")

    ok = kernels_agree and inside_band and close_at_dtype
    print("VISION PARITY PASS" if ok else "VISION PARITY FAIL")
    return 0 if ok else 1


# --- dtype diagnostic -------------------------------------------------------
# Kept next to the reference because "the two differ" is not a finding on its
# own: bf16 carries 8 mantissa bits and the tower is 27 residual blocks deep,
# so some drift is arithmetic, not logic. Running the SAME reference in
# bfloat16 separates the two — if the bf16 reference lands on Swift, the
# implementations agree and only the precision differs.
def forward_mlx(weights, cfg, pixels, gh, gw, dtype):
    def w(name):
        return weights["vision_tower." + name].astype(dtype)

    n = gh * gw
    heads, hidden = cfg["heads"], cfg["hidden"]
    head_dim = hidden // heads
    x = mx.array(pixels).astype(dtype) @ w("patch_embed.proj.weight").reshape(hidden, -1).T
    x = x + w("patch_embed.proj.bias")
    x = x + mx.array(pos_embed(weights, cfg, gh, gw)).astype(dtype)
    cos_np, sin_np = rope(cfg, gh, gw)
    cos = mx.array(cos_np).astype(dtype)[:, None, :]
    sin = mx.array(sin_np).astype(dtype)[:, None, :]

    def rot(v):
        half = v.shape[-1] // 2
        return mx.concatenate([-v[..., half:], v[..., :half]], axis=-1)

    for i in range(cfg["depth"]):
        p = f"blocks.{i}."
        h = mx.fast.layer_norm(x, w(p + "norm1.weight"), w(p + "norm1.bias"), 1e-6)
        qkv = (h @ w(p + "attn.qkv.weight").T + w(p + "attn.qkv.bias")).reshape(
            n, 3, heads, head_dim)
        q, k, v = qkv[:, 0], qkv[:, 1], qkv[:, 2]
        q = (q * cos + rot(q) * sin).transpose(1, 0, 2)[None]
        k = (k * cos + rot(k) * sin).transpose(1, 0, 2)[None]
        v = v.transpose(1, 0, 2)[None]
        o = mx.fast.scaled_dot_product_attention(q, k, v, scale=1 / math.sqrt(head_dim))
        ctx = o.reshape(heads, n, head_dim).transpose(1, 0, 2).reshape(n, hidden)
        x = x + ctx @ w(p + "attn.proj.weight").T + w(p + "attn.proj.bias")
        h = mx.fast.layer_norm(x, w(p + "norm2.weight"), w(p + "norm2.bias"), 1e-6)
        h = h @ w(p + "mlp.linear_fc1.weight").T + w(p + "mlp.linear_fc1.bias")
        h = 0.5 * h * (1 + mx.tanh(0.79788456 * (h + 0.044715 * h * h * h)))
        x = x + h @ w(p + "mlp.linear_fc2.weight").T + w(p + "mlp.linear_fc2.bias")
        mx.eval(x)
    x = mx.fast.layer_norm(x, w("merger.norm.weight"), w("merger.norm.bias"), 1e-6)
    m2 = cfg["merge"] ** 2
    x = x.reshape(n // m2, hidden * m2)
    x = x @ w("merger.linear_fc1.weight").T + w("merger.linear_fc1.bias")
    x = 0.5 * x * (1 + mx.erf(x / math.sqrt(2)))
    out = x @ w("merger.linear_fc2.weight").T + w("merger.linear_fc2.bias")
    mx.eval(out)
    return np.array(out.astype(mx.float32))


if __name__ == "__main__":
    sys.exit(main())
