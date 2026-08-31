"""M1: collect real per-layer expert routing traces from Qwen3.8-Flash-Next.

Monkey-patches SparseMoeBlock.__call__ to record the top-k expert ids chosen at
every layer for every token, then writes a compact int16 trace.

Trace format (npz):
  ids     : (n_tokens, n_layers, top_k) int16  -- expert id per (token, layer, slot)
  meta    : json with prompt/workload/model info

Usage:
  python trace_routers.py --model <path> --workload chat --max-tokens 128
"""
import argparse, json, time, os, sys
import numpy as np
import mlx.core as mx

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "reference"))

WORKLOADS = {
    "chat": [
        "Explain why the sky is blue, in two paragraphs.",
        "What is the difference between a process and a thread?",
        "Give me three ideas for a weekend project involving a Raspberry Pi.",
        "Summarize the plot of Moby Dick in five sentences.",
    ],
    "code": [
        "Write a Python function that merges two sorted lists in linear time.",
        "Explain what a Rust borrow checker error 'cannot borrow as mutable' means and how to fix it.",
        "Write a SQL query that finds the second highest salary per department.",
        "Refactor this into idiomatic Swift: for i in 0..<a.count { if a[i] > 0 { b.append(a[i]) } }",
    ],
    "math": [
        "Compute the derivative of x^3 sin(x) and explain each step.",
        "Prove that the square root of 2 is irrational.",
        "A train leaves at 3pm going 60mph, another at 4pm going 80mph. When does the second catch the first?",
        "What is the expected number of coin flips to get two heads in a row?",
    ],
    "multiling": [
        "Explica en español qué es la fotosíntesis.",
        "Traduis en français: the weather is nice today and I want to go outside.",
        "用中文解释什么是量子纠缠。",
        "Erkläre auf Deutsch, wie ein Verbrennungsmotor funktioniert.",
    ],
    "agentic": [
        "You are an agent with tools: read_file, write_file, run_tests. The tests fail with ImportError. What do you do first?",
        "Given the tool result {'status': 'ok', 'rows': 42}, decide whether to continue or stop, and say why.",
        "Plan the steps to migrate a service from REST to gRPC. List them as numbered actions.",
        "The user asked to delete all logs older than 30 days. Write the exact shell command and explain the risk.",
    ],
}


class _Wrapped:
    """Transparent callable proxy: Python resolves `obj()` on the type, so
    assigning an instance's `__call__` does not intercept a module call."""
    def __init__(self, inner, fn):
        object.__setattr__(self, "_inner", inner)
        object.__setattr__(self, "_fn", fn)

    def __call__(self, *args, **kwargs):
        return object.__getattribute__(self, "_fn")(*args, **kwargs)

    def __getattr__(self, name):
        return getattr(object.__getattribute__(self, "_inner"), name)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--model", required=True)
    ap.add_argument("--workload", default="chat", choices=list(WORKLOADS) + ["all"])
    ap.add_argument("--max-tokens", type=int, default=96)
    ap.add_argument("--out", default=None)
    args = ap.parse_args()

    from mlx_lm import load, generate  # noqa
    import mlx_lm

    print(f"loading {args.model} ...", flush=True)
    t0 = time.time()
    model, tokenizer = load(args.model)
    print(f"  loaded in {time.time()-t0:.1f}s", flush=True)

    # find the MoE blocks
    blocks = []
    for i, layer in enumerate(model.layers):
        mlp = getattr(layer, "mlp", None)
        if mlp is not None and hasattr(mlp, "top_k") and hasattr(mlp, "gate"):
            blocks.append((i, mlp))
    print(f"  found {len(blocks)} MoE blocks")
    assert blocks, "no MoE blocks found - check model structure"

    records = []  # list of (layer, ids array)
    step = {"n": 0}

    def patch(layer_idx, mlp):
        orig = mlp.__call__

        def wrapped(x, _orig=orig, _li=layer_idx, _mlp=mlp):
            logits = _mlp.gate(x.astype(mx.float32))
            idx = mx.argpartition(-logits, _mlp.top_k - 1, axis=-1)[..., : _mlp.top_k]
            mx.eval(idx)
            records.append((_li, np.array(idx, copy=True).astype(np.int16)))
            return _orig(x)

        return wrapped

    for i, mlp in blocks:
        object.__setattr__(model.layers[i], "mlp", _Wrapped(mlp, patch(i, mlp)))

    n_layers = len(blocks)
    top_k = blocks[0][1].top_k
    prompts = []
    wls = list(WORKLOADS) if args.workload == "all" else [args.workload]
    for w in wls:
        prompts += [(w, p) for p in WORKLOADS[w]]

    all_traces = {}
    for wname, prompt in prompts:
        records.clear()
        messages = [{"role": "user", "content": prompt}]
        text = tokenizer.apply_chat_template(
            messages, add_generation_prompt=True, tokenize=False
        )
        t0 = time.time()
        out = generate(model, tokenizer, prompt=text, max_tokens=args.max_tokens,
                       verbose=False)
        dt = time.time() - t0
        # records: sequence of (layer, (B,T,topk)); prefill has T>1, decode T==1
        prefill = [(l, a) for l, a in records if a.shape[1] > 1]
        decode = [(l, a) for l, a in records if a.shape[1] == 1]
        n_dec = len(decode) // n_layers if n_layers else 0
        print(f"  [{wname}] {len(text)} chars -> {n_dec} decode steps in {dt:.1f}s "
              f"({n_dec/max(dt,1e-9):.1f} tok/s), "
              f"{len(prefill)} prefill records, {len(decode)} decode records")

        # decode trace: (steps, layers, topk)
        if n_dec:
            arr = np.zeros((n_dec, n_layers, top_k), dtype=np.int16)
            lay_pos = {l: j for j, (l, _) in enumerate(blocks)}
            counters = {}
            for l, a in decode:
                s = counters.get(l, 0)
                if s < n_dec:
                    arr[s, lay_pos[l]] = a.reshape(-1)[:top_k]
                counters[l] = s + 1
            all_traces.setdefault(wname, []).append(arr)

        # prefill trace: (tokens, layers, topk) from the first prefill pass
        if prefill:
            T = prefill[0][1].shape[1]
            parr = np.zeros((T, n_layers, top_k), dtype=np.int16)
            lay_pos = {l: j for j, (l, _) in enumerate(blocks)}
            for l, a in prefill[:n_layers]:
                parr[:, lay_pos[l]] = a.reshape(T, top_k)
            all_traces.setdefault(wname + "_prefill", []).append(parr)

    out = args.out or f"bench/traces/{args.workload}.npz"
    os.makedirs(os.path.dirname(out), exist_ok=True)
    save = {}
    for k, lst in all_traces.items():
        save[k] = np.concatenate(lst, axis=0)
        print(f"  trace {k}: {save[k].shape}")
    save["meta"] = np.frombuffer(
        json.dumps({"model": args.model, "n_layers": n_layers, "top_k": top_k,
                    "workloads": wls}).encode(), dtype=np.uint8)
    np.savez_compressed(out, **save)
    print(f"wrote {out} ({os.path.getsize(out)/1e6:.1f} MB)")


if __name__ == "__main__":
    main()
