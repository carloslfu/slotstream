"""Turn a `SLOTSTREAM_ROUTER_TRACE` stream into the npz `cachesim.py` reads.

The engine writes, per MoE call, `layer`/`tokens`/`topK` as little-endian int32
followed by `tokens * topK` int16 expert ids. Layers are visited in order within
a pass, so passes reassemble without a pass id.

Only single-token calls are kept by default, and that is the point rather than
convenience: a prefill pass of 256 tokens or more takes the sweep, which never
reads or writes the slot pool, so its routing is not cache traffic. Simulating
it would report a hit rate for accesses the pool never sees. `--all` keeps
everything for anyone measuring routing itself rather than the cache.
Each token becomes one output step. A pass with unequal per-layer shapes
(for example, terminal-prefill pruning) cannot fit the dense output format
and is rejected rather than copying or discarding routing decisions.

usage: trace_convert.py <trace.bin> <out.npz> [--all] [--name decode]
"""
import argparse
import sys
import numpy as np

N_LAYERS = 48


def read_stream(path):
    raw = np.fromfile(path, dtype=np.uint8)
    out = []
    off = 0
    while off < raw.size:
        layer, tokens, topk = raw[off:off + 12].view("<i4")
        off += 12
        n = int(tokens) * int(topk)
        ids = raw[off:off + n * 2].view("<i2").astype(np.int16)
        off += n * 2
        out.append((int(layer), int(tokens), int(topk), ids.reshape(int(tokens), int(topk))))
    return out


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n\n')[0])
    parser.add_argument('source', help='binary RouterTrace input')
    parser.add_argument('destination', help='output npz archive')
    parser.add_argument('--all', action='store_true', help='include multi-token passes')
    parser.add_argument('--name', default='decode', help='array name in the archive (default: %(default)s)')
    args = parser.parse_args()
    src, dst, keep_all, name = args.source, args.destination, args.all, args.name

    calls = read_stream(src)
    kept = [c for c in calls if keep_all or c[1] == 1]
    if not kept:
        print("no calls matched; use --all to include multi-token passes")
        sys.exit(1)
    topk = kept[0][2]

    # Group into passes: one visit to every layer, in layer order.
    steps, cur = [], {}
    for layer, tokens, _k, ids in kept:
        if layer in cur:
            steps.append(cur)
            cur = {}
        cur[layer] = ids
    if cur:
        steps.append(cur)

    complete = [s for s in steps if len(s) == N_LAYERS]
    dropped = len(steps) - len(complete)
    for s in complete:
        if any(ids.shape != (s[0].shape[0], topk) for ids in s.values()):
            raise ValueError('dense routing passes require the same token count and topK at every layer')
    arr = np.zeros((sum(s[0].shape[0] for s in complete), N_LAYERS, topk), dtype=np.int16)
    offset = 0
    for s in complete:
        tokens = s[0].shape[0]
        for layer, ids in s.items():
            arr[offset:offset + tokens, layer] = ids
        offset += tokens

    np.savez_compressed(dst, **{name: arr})
    print(f"{len(calls)} calls -> {len(arr)} complete steps x {N_LAYERS} layers x {topk}"
          f"{f' ({dropped} partial pass(es) dropped)' if dropped else ''} -> {dst}")


if __name__ == "__main__":
    main()
