"""M3 entry gate: does MLX support writing one expert into a large quantized pool
in place (no full-pool copy), and does gather_qmm work over that pool?

Expert record geometry (measured from the real checkpoint):
  gate_proj.weight [E,640,320] u32 | scales/biases [E,640,40] bf16
  up_proj   same
  down_proj.weight [E,2560,80] u32 | scales/biases [E,2560,10] bf16
  => 2,764,800 B per expert
"""
import time, gc, sys
import mlx.core as mx

H, FF, G = 2560, 640, 64
REC = 2_764_800


def make_pool(S):
    """Allocate a slot pool of S experts, in the 9-tensor layout."""
    p = {
        "gw": mx.zeros((S, FF, H // 8), dtype=mx.uint32),
        "gs": mx.zeros((S, FF, H // G), dtype=mx.bfloat16),
        "gb": mx.zeros((S, FF, H // G), dtype=mx.bfloat16),
        "uw": mx.zeros((S, FF, H // 8), dtype=mx.uint32),
        "us": mx.zeros((S, FF, H // G), dtype=mx.bfloat16),
        "ub": mx.zeros((S, FF, H // G), dtype=mx.bfloat16),
        "dw": mx.zeros((S, H, FF // 8), dtype=mx.uint32),
        "ds": mx.zeros((S, H, FF // G), dtype=mx.bfloat16),
        "db": mx.zeros((S, H, FF // G), dtype=mx.bfloat16),
    }
    mx.eval(p)
    return p


def pool_bytes(p):
    return sum(v.nbytes for v in p.values())


def one_expert():
    return {
        "gw": mx.random.randint(0, 2**31, (FF, H // 8)).astype(mx.uint32),
        "gs": mx.random.normal((FF, H // G)).astype(mx.bfloat16),
        "gb": mx.random.normal((FF, H // G)).astype(mx.bfloat16),
        "uw": mx.random.randint(0, 2**31, (FF, H // 8)).astype(mx.uint32),
        "us": mx.random.normal((FF, H // G)).astype(mx.bfloat16),
        "ub": mx.random.normal((FF, H // G)).astype(mx.bfloat16),
        "dw": mx.random.randint(0, 2**31, (H, FF // 8)).astype(mx.uint32),
        "ds": mx.random.normal((H, FF // G)).astype(mx.bfloat16),
        "db": mx.random.normal((H, FF // G)).astype(mx.bfloat16),
    }


def bench_slot_writes(S, n_writes=200):
    p = make_pool(S)
    e = one_expert()
    mx.eval(e)
    gb = pool_bytes(p) / 1e9
    peak0 = mx.get_peak_memory() / 1e9

    # warm
    for i in range(3):
        for k in p:
            p[k][i] = e[k]
    mx.eval(list(p.values()))

    mx.reset_peak_memory()
    t0 = time.perf_counter()
    for i in range(n_writes):
        slot = (i * 7919) % S
        for k in p:
            p[k][slot] = e[k]
        mx.eval(list(p.values()))
    dt = time.perf_counter() - t0
    peak = mx.get_peak_memory() / 1e9

    per = dt / n_writes
    print(f"  pool {gb:6.2f} GB ({S:6d} slots) | {per*1000:7.3f} ms/expert | "
          f"{REC/per/1e9:6.2f} GB/s effective | peak mem {peak:.2f} GB "
          f"(pool {gb:.2f} → {'COPY!' if peak > gb*1.6 else 'in-place OK'})")
    del p, e
    gc.collect()
    return per


def bench_gather_qmm(S, T=1, topk=10):
    """Time the actual MoE compute over a pool of S slots."""
    p = make_pool(S)
    x = mx.random.normal((1, T, H)).astype(mx.bfloat16)
    idx = mx.random.randint(0, S, (1, T, topk))
    mx.eval(p, x, idx)

    def step():
        g = mx.gather_qmm(x, p["gw"], p["gs"], p["gb"], rhs_indices=idx,
                          transpose=True, group_size=G, bits=4)
        u = mx.gather_qmm(x, p["uw"], p["us"], p["ub"], rhs_indices=idx,
                          transpose=True, group_size=G, bits=4)
        h = mx.sigmoid(g) * g * u  # silu-ish, shape only matters here
        return mx.gather_qmm(h, p["dw"], p["ds"], p["db"], rhs_indices=idx,
                             transpose=True, group_size=G, bits=4)

    o = step(); mx.eval(o)
    N = 50
    t0 = time.perf_counter()
    for _ in range(N):
        o = step()
    mx.eval(o)
    dt = (time.perf_counter() - t0) / N
    print(f"  pool {pool_bytes(p)/1e9:5.2f} GB, T={T:4d}, top{topk}: "
          f"{dt*1000:7.3f} ms/step  out={o.shape}")
    del p
    gc.collect()
    return dt


if __name__ == "__main__":
    print("=== gather_qmm correctness vs dense reference ===")
    S = 8
    p = make_pool(S)
    # build a real quantized expert so the math is meaningful
    w = mx.random.normal((FF, H)).astype(mx.bfloat16)
    qw, sc, bi = mx.quantize(w, group_size=G, bits=4)
    for s in range(S):
        p["gw"][s] = qw; p["gs"][s] = sc; p["gb"][s] = bi
    mx.eval(list(p.values()))
    x = mx.random.normal((1, 1, H)).astype(mx.bfloat16)
    idx = mx.array([[[3]]])
    got = mx.gather_qmm(x, p["gw"], p["gs"], p["gb"], rhs_indices=idx,
                        transpose=True, group_size=G, bits=4)
    ref = mx.quantized_matmul(x, qw, sc, bi, transpose=True, group_size=G, bits=4)
    err = float(mx.abs(got.reshape(-1) - ref.reshape(-1)).max())
    print(f"  gather_qmm vs quantized_matmul max abs diff: {err:.3e} "
          f"{'PASS' if err < 1e-2 else 'FAIL'}")
    dq = mx.dequantize(qw, sc, bi, group_size=G, bits=4)
    ref2 = x @ dq.T
    rel = float(mx.abs(got.reshape(-1) - ref2.reshape(-1)).max() /
                mx.abs(ref2).max())
    print(f"  gather_qmm vs dequant@dense rel err: {rel:.3e} "
          f"{'PASS' if rel < 5e-2 else 'FAIL'}")
    del p; gc.collect()

    print("\n=== slot-write throughput (M3 gate: need >5 GB/s, no full-pool copy) ===")
    for S in (512, 2048, 5000, 9800):
        try:
            bench_slot_writes(S, n_writes=100 if S > 4000 else 200)
        except Exception as ex:
            print(f"  S={S}: FAILED {type(ex).__name__}: {ex}")

    print("\n=== gather_qmm MoE step cost (decode T=1 and prefill T=512) ===")
    for S in (2048, 9800):
        for T in (1, 512):
            try:
                bench_gather_qmm(S, T=T)
            except Exception as ex:
                print(f"  S={S} T={T}: FAILED {type(ex).__name__}: {ex}")
