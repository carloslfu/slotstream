"""Parity ground truth: run the first N layers of the Python reference on a
fixed token sequence and dump per-layer hyper-width hidden states (f32).

Loads only the tensors those layers need (plus exactly the n-gram shards the
prompt's row ids touch), so it fits comfortably in RAM.

Also emits:
  ngram_ids.txt   -- the 16 row ids per position (golden for Swift hashing)
  dequant_row.txt -- mx.dequantize of one specific ngram row (golden for CPU dequant)
  tokens.txt      -- the token ids used
"""
import argparse, glob, importlib.util, json, os, sys, types
import numpy as np
import mlx.core as mx
import mlx.nn as nn

# On mlx 0.31.x, importing the mlx_lm package fails (its generate.py needs 0.32
# APIs at import time). The reference only needs mlx_lm.models submodules, so
# register package stubs that bypass mlx_lm/__init__.py.
try:
    import mlx_lm  # noqa
except Exception:
    import site
    for sp in site.getsitepackages() + [os.path.join(sys.prefix, "lib",
            f"python{sys.version_info.major}.{sys.version_info.minor}", "site-packages")]:
        root = os.path.join(sp, "mlx_lm")
        if os.path.isdir(root):
            pkg = types.ModuleType("mlx_lm"); pkg.__path__ = [root]
            sys.modules["mlx_lm"] = pkg
            sub = types.ModuleType("mlx_lm.models"); sub.__path__ = [os.path.join(root, "models")]
            sys.modules["mlx_lm.models"] = sub
            break


def load_reference(path):
    spec = importlib.util.spec_from_file_location("qwen4_exp", path)
    mod = importlib.util.module_from_spec(spec)
    sys.modules["qwen4_exp"] = mod
    spec.loader.exec_module(mod)
    return mod


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--model", required=True)
    ap.add_argument("--layers", type=int, default=4)
    ap.add_argument("--tokens", default="9707,11,1246,525,498,30")  # short seq
    ap.add_argument("--out", default="bench/parity")
    args = ap.parse_args()

    tokens = [int(t) for t in args.tokens.split(",")]
    os.makedirs(args.out, exist_ok=True)

    ref = load_reference(os.path.join(args.model, "qwen4_exp.py"))
    cfg = json.load(open(os.path.join(args.model, "config.json")))
    margs = ref.ModelArgs.from_dict(cfg)
    model = ref.Model(margs)

    # ---- figure out which ngram rows/shards the prompt touches
    targs = margs.text
    ng = model.model.layers[targs.ple_layer_ids[0] - 1].ple.ple_embedding
    eos = targs.eos_token_id if not isinstance(targs.eos_token_id, list) else targs.eos_token_id[0]
    prev = mx.full((1, targs.ngram_size - 1), eos, mx.int64)
    ids = mx.array([tokens], dtype=mx.int64)
    # replicate the gid math using the module itself (buffers = defaults here;
    # checkpoint buffers get loaded later, so recompute gids afterwards too)
    def gids_for(module):
        n_new = ids.shape[1]
        history = mx.concatenate([prev, ids], axis=1)
        shifted = [module._shift_right(history, s) for s in range(module.ngram_size)]
        blocks = []
        for ngram in range(2, module.ngram_size + 1):
            lo = (ngram - 2) * module.heads_per_ngram
            hi = lo + module.heads_per_ngram
            mults = module.layer_multipliers
            sizes = module.ngram_heads_vocab_sizes
            offsets = module.ngram_heads_offsets
            mixed = shifted[0] * mults[0]
            for p in range(1, ngram):
                mixed = mx.bitwise_xor(mixed, shifted[p] * mults[p])
            gid = mixed[..., None] % sizes[lo:hi].reshape(1, 1, -1)
            blocks.append(gid + offsets[lo:hi].reshape(1, 1, -1))
        return np.array(mx.concatenate(blocks, axis=-1)[:, -n_new:])

    pre_gids = gids_for(ng)
    shards = sorted(set(int(g) // ng.rows_per_shard for g in pre_gids.reshape(-1)))
    print(f"prompt touches ngram shards: {shards}")

    # ---- load only what the truncated run needs
    wanted_prefix = tuple(
        [f"model.layers.{l}." for l in range(args.layers)]
        + ["model.embed_tokens", "model.hyper_connection_mixer", "lm_head"]
    )
    keep_shard = {f"shard_{s}." for s in shards}

    weights = {}
    for f in sorted(glob.glob(os.path.join(args.model, "model-*.safetensors"))):
        for k, v in mx.load(f).items():
            kk = k
            if kk.startswith("language_model."):
                kk = kk[len("language_model."):]
            if "ngram_embedding.shard_" in kk:
                if not kk.startswith(wanted_prefix[1 - 1]):  # only ple layer within range
                    pass
                if any(s in kk for s in keep_shard) and any(kk.startswith(p) for p in wanted_prefix):
                    weights[k] = v
                continue
            if any(kk.startswith(p) for p in wanted_prefix):
                weights[k] = v
    print(f"loading {len(weights)} tensors for {args.layers} layers")

    weights = model.sanitize(weights)

    # quantize modules that have scales present (mirrors mlx_lm loader)
    qcfg = cfg.get("quantization", {})
    def class_pred(p, m):
        if p in qcfg:
            return qcfg[p]
        if not hasattr(m, "to_quantized"):
            return False
        return f"{p}.scales" in weights
    nn.quantize(
        model, group_size=qcfg.get("group_size", 64), bits=qcfg.get("bits", 4),
        class_predicate=class_pred)

    model.load_weights(list(weights.items()), strict=False)
    model.eval()
    mx.eval([v for k, v in model.parameters().items()] if False else model.model.embed_tokens.parameters())

    # ---- golden: ngram ids with the *loaded* buffers
    gids = gids_for(model.model.layers[targs.ple_layer_ids[0] - 1].ple.ple_embedding)
    with open(os.path.join(args.out, "ngram_ids.txt"), "w") as fh:
        for row in gids[0]:
            fh.write(",".join(str(int(x)) for x in row) + "\n")

    # ---- golden: dequantized row for gid[0][0]
    g0 = int(gids[0][0][0])
    ng2 = model.model.layers[targs.ple_layer_ids[0] - 1].ple.ple_embedding
    shard = g0 // ng2.rows_per_shard
    row = g0 % ng2.rows_per_shard
    emb = getattr(ng2.ngram_embedding, f"shard_{shard}")
    vals = mx.dequantize(
        emb.weight[row][None], emb.scales[row][None], emb.biases[row][None],
        group_size=emb.group_size, bits=emb.bits)
    mx.eval(vals)
    with open(os.path.join(args.out, "dequant_row.txt"), "w") as fh:
        fh.write(f"{g0}\n")
        fh.write(",".join(f"{float(x):.8f}" for x in np.array(vals.astype(mx.float32)).reshape(-1)))
        fh.write("\n")
    print(f"dequant golden: gid {g0} (shard {shard} row {row})")

    # ---- truncated forward with per-layer dumps
    tmodel = model.model
    h = tmodel.embed_tokens(mx.array([tokens]))
    h = mx.tile(h, (1, 1, tmodel.hc))
    caches = model.make_cache()

    full_idx = [i for i in range(args.layers) if tmodel.layers[i].layer_type == "full_attention"]
    from mlx_lm.models.base import create_attention_mask
    attn_cache = caches[full_idx[0]] if full_idx else None
    mask = create_attention_mask(h, [attn_cache] if attn_cache is not None else None)

    prev_ctx = mx.full((1, targs.ngram_size - 1), eos, mx.int64)
    idsq = mx.array([tokens])
    dbg_layer = int(os.environ.get("DBG_LAYER", "-1"))
    for li in range(args.layers):
        layer = tmodel.layers[li]
        c = caches[li]
        idx_c = c.indexer if hasattr(c, "indexer") else None
        if li == dbg_layer:
            x1, hyper, inj1 = layer.attn_hyper_connection(h)
            if layer.layer_type == "linear_attention":
                att = layer.linear_attn(x1, None, c)
            else:
                att = layer.self_attn(x1, tmodel.rope, mask, c, idx_c)
            mx.eval(x1, att)
            np.array(x1.astype(mx.float32)).tofile(os.path.join(args.out, "dbg_x1.bin"))
            np.array(att.astype(mx.float32)).tofile(os.path.join(args.out, "dbg_attn.bin"))
            h2 = hyper + (att[..., None, :] * inj1[..., None]).reshape(*att.shape[:-1], -1)
            x2, hyper2, inj2 = layer.mlp_hyper_connection(h2)
            mo = layer.mlp(x2)
            mx.eval(mo)
            np.array(x2.astype(mx.float32)).tofile(os.path.join(args.out, "dbg_x2.bin"))
            np.array(mo.astype(mx.float32)).tofile(os.path.join(args.out, "dbg_moe.bin"))
            h = hyper2 + (mo[..., None, :] * inj2[..., None]).reshape(*mo.shape[:-1], -1)
        else:
            h = layer(h, tmodel.rope, mask, None, c, idx_c, idsq, prev_ctx)
        mx.eval(h)
        arr = np.array(h.astype(mx.float32))
        arr.tofile(os.path.join(args.out, f"layer_{li}.bin"))
        print(f"layer {li}: {arr.shape} -> layer_{li}.bin  "
              f"mean|h|={np.abs(arr).mean():.4f}")

    with open(os.path.join(args.out, "tokens.txt"), "w") as fh:
        fh.write(",".join(map(str, tokens)))
    print("done")


if __name__ == "__main__":
    main()
