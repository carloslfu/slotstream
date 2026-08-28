"""Layer-0 sub-step dumps from the Python reference, for bisection."""
import glob, importlib.util, json, os, sys
import numpy as np
import mlx.core as mx
import mlx.nn as nn


def main():
    model_dir = "models/qwen38-flash-next-mlx-4bit"
    tokens = [9707, 11, 1246, 525, 498, 30]
    out = "bench/parity/ref0"
    os.makedirs(out, exist_ok=True)

    spec = importlib.util.spec_from_file_location("qwen4_exp", os.path.join(model_dir, "qwen4_exp.py"))
    ref = importlib.util.module_from_spec(spec)
    sys.modules["qwen4_exp"] = ref
    spec.loader.exec_module(ref)
    cfg = json.load(open(os.path.join(model_dir, "config.json")))
    margs = ref.ModelArgs.from_dict(cfg)
    model = ref.Model(margs)

    wanted = ("model.layers.0.", "model.embed_tokens")
    weights = {}
    for f in sorted(glob.glob(os.path.join(model_dir, "model-*.safetensors"))):
        for k, v in mx.load(f).items():
            kk = k[len("language_model."):] if k.startswith("language_model.") else k
            if any(kk.startswith(p) for p in wanted):
                weights[k] = v
    weights = model.sanitize(weights)
    qcfg = cfg.get("quantization", {})

    def pred(p, m):
        if p in qcfg:
            return qcfg[p]
        if not hasattr(m, "to_quantized"):
            return False
        return f"{p}.scales" in weights

    nn.quantize(model, group_size=qcfg.get("group_size", 64), bits=qcfg.get("bits", 4), class_predicate=pred)
    model.load_weights(list(weights.items()), strict=False)
    model.eval()

    tm = model.model
    ids = mx.array([tokens])
    emb = tm.embed_tokens(ids)
    mx.eval(emb)
    np.array(emb.astype(mx.float32)).tofile(f"{out}/embed.bin")

    h = mx.tile(emb, (1, 1, tm.hc))
    caches = model.make_cache()
    layer = tm.layers[0]
    c = caches[0]

    x1, hyper, inj1 = layer.attn_hyper_connection(h)
    mx.eval(x1, inj1)
    np.array(x1.astype(mx.float32)).tofile(f"{out}/x1.bin")
    np.array(inj1.astype(mx.float32)).tofile(f"{out}/inj1.bin")

    attn = layer.linear_attn(x1, None, c)
    mx.eval(attn)
    np.array(attn.astype(mx.float32)).tofile(f"{out}/attn.bin")

    h2 = hyper + (attn[..., None, :] * inj1[..., None]).reshape(*attn.shape[:-1], -1)
    mx.eval(h2)
    np.array(h2.astype(mx.float32)).tofile(f"{out}/hAfterAttn.bin")

    x2, hyper2, inj2 = layer.mlp_hyper_connection(h2)
    moe = layer.mlp(x2)
    mx.eval(moe)
    np.array(moe.astype(mx.float32)).tofile(f"{out}/moe.bin")

    # router decisions
    logits = layer.mlp.gate(x2.astype(mx.float32))
    idx = mx.argpartition(-logits, layer.mlp.top_k - 1, axis=-1)[..., : layer.mlp.top_k]
    mx.eval(idx)
    with open(f"{out}/router.txt", "w") as fh:
        for row in np.array(idx)[0]:
            fh.write(",".join(map(str, sorted(row.tolist()))) + "\n")
    print("ref0 dumps done")


if __name__ == "__main__":
    main()
