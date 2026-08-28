"""First real run of Qwen3.8-Flash-Next on this Mac.

104 GB of weights on a 48 GB machine. MLX memory-maps safetensors and evaluates
lazily, so this exercises exactly the plan's `--io-mode=pagecache` baseline (what
llama.cpp / LM Studio effectively do). It gives us:
  * proof the model + reference port work here at all
  * a naive-mmap decode baseline for slotstream to beat
  * real per-layer router traces for the M1 cache study

mlx_lm 0.31.3 honours `model_file` in config.json, so it loads the shipped
qwen4_exp.py and applies the per-path quantization (incl. group_size 32 for the
128 n-gram shards) itself.

Usage: python run_model.py --model <dir> [--max-tokens 24] [--trace out.npz]
"""
import argparse, json, os, time
import numpy as np
import mlx.core as mx


def gb(x):
    return f"{x/1e9:.2f} GB"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--model", required=True)
    ap.add_argument("--max-tokens", type=int, default=24)
    ap.add_argument("--prompt", default="Explain in two sentences why the sky is blue.")
    ap.add_argument("--trace", default=None)
    ap.add_argument("--wired-limit-gb", type=float, default=0)
    ap.add_argument("--raw", action="store_true", help="skip chat template")
    args = ap.parse_args()

    from mlx_lm import load

    if args.wired_limit_gb:
        mx.set_wired_limit(int(args.wired_limit_gb * 1e9))

    info = mx.device_info()
    print(f"device: {info['device_name']}  working set "
          f"{info['max_recommended_working_set_size']/1e9:.1f} GB")

    # lazy=True is essential: mlx_lm's default (lazy=False) calls
    # mx.eval(model.parameters()), materialising all 104 GB and OOMing a 48 GB Mac.
    # Lazy keeps weights memory-mapped so only touched experts page in.
    t0 = time.time()
    model, tok = load(args.model, lazy=True)
    tload = time.time() - t0
    print(f"load(): {tload:.1f}s   active {gb(mx.get_active_memory())}  "
          f"peak {gb(mx.get_peak_memory())}")

    n_layers = len(model.model.layers)
    top_k = model.model.layers[0].mlp.top_k
    print(f"layers {n_layers}  top_k {top_k}  "
          f"experts {model.model.layers[0].mlp.switch_mlp.num_experts if hasattr(model.model.layers[0].mlp.switch_mlp,'num_experts') else '?'}")

    # ---------------- router trace hook (wrap the bound method per instance)
    traces = []
    if args.trace:
        for li, layer in enumerate(model.model.layers):
            mlp = layer.mlp
            inner = mlp.__call__

            def make(li, mlp, inner):
                def call(x):
                    lg = mlp.gate(x.astype(mx.float32))
                    idx = mx.argpartition(-lg, mlp.top_k - 1, axis=-1)[..., : mlp.top_k]
                    mx.eval(idx)
                    traces.append((li, np.array(idx, copy=True).astype(np.int16)))
                    return inner(x)
                return call
            layer.mlp.__call__ = make(li, mlp, inner)
            # mlx Modules are called via __call__ on the instance attribute chain;
            # DecoderLayer does `self.mlp(x)`, which resolves the instance attribute.
            object.__setattr__(layer, "mlp", _Wrapped(mlp, make(li, mlp, inner)))

    if args.raw:
        # Bypass the chat template. Expert coverage grows as 1-exp(-topk*T/512) per
        # layer, so a short raw prompt keeps the touched-expert set (and therefore
        # peak residency, which nothing in the stock path can evict) bounded.
        text = args.prompt
    else:
        messages = [{"role": "user", "content": args.prompt}]
        text = tok.apply_chat_template(messages, add_generation_prompt=True,
                                       tokenize=False)
    ids = mx.array([tok.encode(text)])
    T = ids.shape[1]
    cov = 1 - pow(2.718281828, -top_k * T / 512)
    print(f"  expected expert coverage/layer ≈ {cov*100:.0f}%  "
          f"→ ≈{cov*512*n_layers:,.0f} records ≈ {cov*512*n_layers*2.7648/1024:.1f} GB "
          f"live if nothing is evicted")
    print(f"\nprompt {args.prompt!r} -> {ids.shape[1]} tokens")

    cache = model.make_cache()

    print("\n--- prefill ---")
    mx.reset_peak_memory()
    t0 = time.time()
    logits = model(ids, cache=cache)
    mx.eval(logits)
    tp = time.time() - t0
    print(f"  {ids.shape[1]} tok in {tp:.2f}s = {ids.shape[1]/tp:.1f} tok/s   "
          f"peak {gb(mx.get_peak_memory())}")
    n_pre = len(traces)

    print("\n--- decode ---")
    out, times = [], []
    y = mx.argmax(logits[:, -1, :], axis=-1)
    for i in range(args.max_tokens):
        t = time.time()
        out.append(int(y.item()))
        logits = model(y[None], cache=cache)
        y = mx.argmax(logits[:, -1, :], axis=-1)
        mx.eval(y)
        times.append(time.time() - t)
        if i < 3 or (i + 1) % 8 == 0:
            print(f"  tok {i:3d}  {times[-1]*1000:8.1f} ms  {1/times[-1]:6.2f} tok/s"
                  f"   active {gb(mx.get_active_memory())}")
    med = float(np.median(times))
    print(f"\n  median {med*1000:.1f} ms = {1/med:.2f} tok/s   "
          f"(first {times[0]*1000:.0f} ms, best {min(times)*1000:.0f} ms)")
    print(f"  peak {gb(mx.get_peak_memory())}")
    print(f"\noutput: {tok.decode(out)!r}")

    if args.trace and traces:
        dec = traces[n_pre:]
        nsteps = len(dec) // n_layers
        arr = np.zeros((nsteps, n_layers, top_k), dtype=np.int16)
        cnt = {}
        for l, a in dec:
            s = cnt.get(l, 0)
            if s < nsteps:
                arr[s, l] = a.reshape(-1)[:top_k]
            cnt[l] = s + 1
        pre = traces[:n_pre]
        T = pre[0][1].shape[1] if pre else 0
        parr = np.zeros((T, n_layers, top_k), dtype=np.int16)
        for l, a in pre[:n_layers]:
            parr[:, l] = a.reshape(T, top_k)
        os.makedirs(os.path.dirname(args.trace) or ".", exist_ok=True)
        np.savez_compressed(args.trace, decode=arr, prefill=parr)
        print(f"\ntrace -> {args.trace}  decode{arr.shape} prefill{parr.shape}")


class _Wrapped:
    """Transparent proxy so `layer.mlp(x)` hits our tracer but everything else
    (parameters, submodules, load_weights) still sees the real module."""
    def __init__(self, inner, fn):
        object.__setattr__(self, "_inner", inner)
        object.__setattr__(self, "_fn", fn)

    def __call__(self, *a, **k):
        return object.__getattribute__(self, "_fn")(*a, **k)

    def __getattr__(self, n):
        return getattr(object.__getattribute__(self, "_inner"), n)


if __name__ == "__main__":
    main()
