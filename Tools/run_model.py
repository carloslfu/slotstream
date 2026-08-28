"""First real run of Qwen3.8-Flash-Next on this Mac, via the reference impl.

104 GB of weights on a 48 GB machine: MLX memory-maps safetensors and evaluates
lazily, so this exercises exactly the plan's `--io-mode=pagecache` baseline (what
llama.cpp/LM Studio effectively do). It gives us:
  * proof the model + reference port actually work here
  * a naive-mmap decode baseline to beat
  * real per-layer router traces for the M1 cache study

Usage: python run_model.py --model <dir> [--max-tokens 24] [--trace out.npz]
"""
import argparse, importlib.util, json, os, sys, time
import numpy as np
import mlx.core as mx
import mlx.nn as nn


def load_reference(path):
    spec = importlib.util.spec_from_file_location("qwen4_exp", path)
    mod = importlib.util.module_from_spec(spec)
    sys.modules["qwen4_exp"] = mod
    spec.loader.exec_module(mod)
    return mod


def rss_gb():
    import resource
    return resource.getrusage(resource.RUSAGE_SELF).ru_maxrss / 1e9


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--model", required=True)
    ap.add_argument("--ref", default=os.path.join(os.path.dirname(__file__),
                                                  "reference", "qwen4_exp.py"))
    ap.add_argument("--max-tokens", type=int, default=24)
    ap.add_argument("--prompt", default="Explain in two sentences why the sky is blue.")
    ap.add_argument("--trace", default=None)
    ap.add_argument("--limit-mem-gb", type=float, default=0)
    args = ap.parse_args()

    if args.limit_mem_gb:
        mx.set_memory_limit(int(args.limit_mem_gb * 1e9))
        print(f"memory limit set to {args.limit_mem_gb} GB")
    mx.set_wired_limit(0)

    qwen4_exp = load_reference(args.ref)
    cfg = json.load(open(os.path.join(args.model, "config.json")))
    quant = cfg.get("quantization")
    print(f"config: {cfg['model_type']}  quantization={quant}")

    t0 = time.time()
    margs = qwen4_exp.ModelArgs.from_dict(cfg)
    model = qwen4_exp.Model(margs)
    print(f"  graph built in {time.time()-t0:.1f}s")

    # quantize the module tree to match the checkpoint before loading weights
    if quant:
        def pred(p, m):
            if not hasattr(m, "to_quantized"):
                return False
            if p.endswith("mlp.gate"):
                return False
            # per-tensor overrides live in the quantization dict
            return True
        t0 = time.time()
        nn.quantize(model, group_size=quant.get("group_size", 64),
                    bits=quant.get("bits", 4), class_predicate=pred)
        print(f"  quantized graph in {time.time()-t0:.1f}s")

    # lazy-load every shard
    import glob
    t0 = time.time()
    weights = {}
    for f in sorted(glob.glob(os.path.join(args.model, "model-*.safetensors"))):
        weights.update(mx.load(f))
    print(f"  mapped {len(weights)} tensors in {time.time()-t0:.1f}s")

    weights = model.sanitize(weights)
    t0 = time.time()
    model.load_weights(list(weights.items()), strict=False)
    print(f"  load_weights in {time.time()-t0:.1f}s")
    model.eval()

    from mlx_lm.tokenizer_utils import load_tokenizer
    tok = load_tokenizer(args.model)

    messages = [{"role": "user", "content": args.prompt}]
    text = tok.apply_chat_template(messages, add_generation_prompt=True, tokenize=False)
    ids = mx.array([tok.encode(text)])
    print(f"\nprompt: {args.prompt!r}  ({ids.shape[1]} tokens)")

    # ---- trace hook on every MoE router
    traces = []
    if args.trace:
        for li, layer in enumerate(model.model.layers):
            mlp = layer.mlp
            orig = type(mlp).__call__

            def make(li, mlp, orig):
                def call(self, x):
                    lg = self.gate(x.astype(mx.float32))
                    idx = mx.argpartition(-lg, self.top_k - 1, axis=-1)[..., : self.top_k]
                    mx.eval(idx)
                    traces.append((li, np.array(idx, copy=True).astype(np.int16)))
                    return orig(self, x)
                return call
            mlp.__class__ = type(f"Traced{li}", (type(mlp),),
                                 {"__call__": make(li, mlp, orig)})

    cache = model.make_cache()
    print("\n--- prefill ---")
    t0 = time.time()
    logits = model(ids, cache=cache)
    mx.eval(logits)
    tp = time.time() - t0
    print(f"  {ids.shape[1]} tokens in {tp:.2f}s = {ids.shape[1]/tp:.1f} tok/s")
    print(f"  peak mem {mx.get_peak_memory()/1e9:.2f} GB | rss {rss_gb():.2f} GB")

    n_prefill_records = len(traces)
    print("\n--- decode ---")
    out_ids = []
    y = mx.argmax(logits[:, -1, :], axis=-1)
    times = []
    for i in range(args.max_tokens):
        t = time.time()
        out_ids.append(int(y.item()))
        logits = model(y[None], cache=cache)
        y = mx.argmax(logits[:, -1, :], axis=-1)
        mx.eval(y)
        times.append(time.time() - t)
        if i < 3 or i % 8 == 0:
            print(f"  tok {i:3d}: {times[-1]*1000:7.1f} ms  "
                  f"({1/times[-1]:5.2f} tok/s)  peak {mx.get_peak_memory()/1e9:.1f} GB")
    med = float(np.median(times))
    print(f"\n  decode median {med*1000:.1f} ms = {1/med:.2f} tok/s")
    print(f"  peak mem {mx.get_peak_memory()/1e9:.2f} GB | rss {rss_gb():.2f} GB")
    print(f"\noutput: {tok.decode(out_ids)!r}")

    if args.trace and traces:
        n_layers = len(model.model.layers)
        dec = [(l, a) for l, a in traces[n_prefill_records:]]
        top_k = dec[0][1].shape[-1]
        nsteps = len(dec) // n_layers
        arr = np.zeros((nsteps, n_layers, top_k), dtype=np.int16)
        cnt = {}
        for l, a in dec:
            s = cnt.get(l, 0)
            if s < nsteps:
                arr[s, l] = a.reshape(-1)[:top_k]
            cnt[l] = s + 1
        pre = traces[:n_prefill_records]
        T = pre[0][1].shape[1] if pre else 0
        parr = np.zeros((T, n_layers, top_k), dtype=np.int16)
        for l, a in pre[:n_layers]:
            parr[:, l] = a.reshape(T, top_k)
        os.makedirs(os.path.dirname(args.trace) or ".", exist_ok=True)
        np.savez_compressed(args.trace, decode=arr, prefill=parr)
        print(f"\nwrote trace {args.trace}: decode{arr.shape} prefill{parr.shape}")


if __name__ == "__main__":
    main()
