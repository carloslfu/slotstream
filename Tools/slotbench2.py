"""M3 entry gate, take 2 — rigorous.

Fixes vs v1:
  * batch slot writes before eval (v1 synced per expert)
  * compare 4 fill strategies, incl. scatter of many experts at once
  * use the real SwitchGLU semantics for the MoE cost (v1 had a broadcasting bug
    that computed T*T*topk experts)
"""
import time, gc
import mlx.core as mx
from mlx_lm.models.switch_layers import SwitchGLU
import mlx.nn as nn

H, FF, G = 2560, 640, 64
REC = 2_764_800
KEYS = ("gw", "gs", "gb", "uw", "us", "ub", "dw", "ds", "db")


def make_pool(S):
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


def pool_gb(p):
    return sum(v.nbytes for v in p.values()) / 1e9


def batch_experts(n):
    """n experts worth of data, as one stacked array per tensor (what a staging
    buffer holds after n SSD reads)."""
    return {
        "gw": mx.random.randint(0, 2**31, (n, FF, H // 8)).astype(mx.uint32),
        "gs": mx.random.normal((n, FF, H // G)).astype(mx.bfloat16),
        "gb": mx.random.normal((n, FF, H // G)).astype(mx.bfloat16),
        "uw": mx.random.randint(0, 2**31, (n, FF, H // 8)).astype(mx.uint32),
        "us": mx.random.normal((n, FF, H // G)).astype(mx.bfloat16),
        "ub": mx.random.normal((n, FF, H // G)).astype(mx.bfloat16),
        "dw": mx.random.randint(0, 2**31, (n, H, FF // 8)).astype(mx.uint32),
        "ds": mx.random.normal((n, H, FF // G)).astype(mx.bfloat16),
        "db": mx.random.normal((n, H, FF // G)).astype(mx.bfloat16),
    }


def timeit(fn, reps, warmup=2):
    for _ in range(warmup):
        fn()
    mx.synchronize()
    t0 = time.perf_counter()
    for _ in range(reps):
        fn()
    mx.synchronize()
    return (time.perf_counter() - t0) / reps


def strategies(S, nbatch):
    p = make_pool(S)
    e = batch_experts(nbatch)
    mx.eval(e)
    slots = mx.array([(i * 7919) % S for i in range(nbatch)])
    mx.eval(slots)
    gb = pool_gb(p)
    out = {}

    # A: per-slot assignment, ONE eval for the whole batch
    def A():
        for i in range(nbatch):
            s = int(i * 7919) % S
            for k in KEYS:
                p[k][s] = e[k][i]
        mx.eval([p[k] for k in KEYS])
    out["A per-slot, 1 eval"] = timeit(A, 5)

    # B: single scatter of the whole batch via fancy index
    def B():
        for k in KEYS:
            p[k][slots] = e[k]
        mx.eval([p[k] for k in KEYS])
    out["B batch scatter"] = timeit(B, 5)

    # C: contiguous block write (best case: slots are a contiguous run)
    def C():
        for k in KEYS:
            p[k][0:nbatch] = e[k]
        mx.eval([p[k] for k in KEYS])
    out["C contiguous slice"] = timeit(C, 5)

    # D: mx.slice_update if available
    if hasattr(mx, "slice_update"):
        def D():
            for k in KEYS:
                p[k] = mx.slice_update(p[k], e[k], mx.array(0), axes=(0,))
            mx.eval([p[k] for k in KEYS])
        out["D slice_update"] = timeit(D, 5)

    peak = mx.get_peak_memory() / 1e9
    del p, e
    gc.collect()
    return gb, out, peak


def moe_cost(S, T, topk=10):
    """Real SwitchGLU semantics: x (B,T,H), idx (B,T,topk) -> (B,T,topk,H)."""
    sw = SwitchGLU(H, FF, S)
    sw = sw  # noqa
    q = nn.quantize(sw, group_size=G, bits=4)
    x = mx.random.normal((1, T, H)).astype(mx.bfloat16)
    idx = mx.random.randint(0, S, (1, T, topk))
    mx.eval(sw.parameters(), x, idx)

    def step():
        return sw(x, idx)

    o = step()
    mx.eval(o)
    dt = timeit(lambda: mx.eval(sw(x, idx)), 20 if T == 1 else 5)
    shape = o.shape
    del sw, x, idx, o
    gc.collect()
    return dt, shape


if __name__ == "__main__":
    print("=== slot fill strategies (batch of 48 experts = a plausible per-token miss set) ===")
    print(f"{'pool':>8} {'strategy':22} {'ms/batch':>10} {'ms/expert':>10} {'GB/s':>8}")
    for S in (2048, 9800):
        gb, res, peak = strategies(S, 48)
        for name, dt in res.items():
            per = dt / 48
            print(f"{gb:7.2f}G {name:22} {dt*1000:10.3f} {per*1000:10.4f} "
                  f"{REC/per/1e9:8.2f}")
        print(f"         peak mem {peak:.2f} GB (pool {gb:.2f} GB)")
        print()

    print("=== MoE compute cost, correct SwitchGLU semantics ===")
    for S in (512, 2048, 9800):
        for T in (1, 512):
            try:
                dt, shape = moe_cost(S, T)
                print(f"  S={S:5d} T={T:4d}: {dt*1000:8.3f} ms  out={shape}"
                      f"   ({T/dt:,.0f} tok/s if this were the whole model)")
            except Exception as ex:
                print(f"  S={S} T={T}: FAILED {type(ex).__name__}: {ex}")
