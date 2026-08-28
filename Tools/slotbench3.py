"""M3 entry gate, focused: fastest way to fill expert slots in a large MLX pool.

Only the gate question. One pool size that is representative and cheap to build,
then a scale check on the winner.
"""
import time, gc, sys
import mlx.core as mx

H, FF, G = 2560, 640, 64
REC = 2_764_800
KEYS = ("gw", "gs", "gb", "uw", "us", "ub", "dw", "ds", "db")
SHAPE = {
    "gw": (FF, H // 8), "gs": (FF, H // G), "gb": (FF, H // G),
    "uw": (FF, H // 8), "us": (FF, H // G), "ub": (FF, H // G),
    "dw": (H, FF // 8), "ds": (H, FF // G), "db": (H, FF // G),
}
DT = {"gw": mx.uint32, "uw": mx.uint32, "dw": mx.uint32}


def make_pool(S):
    p = {k: mx.zeros((S,) + SHAPE[k], dtype=DT.get(k, mx.bfloat16)) for k in KEYS}
    mx.eval(p)
    return p


def make_batch(n):
    b = {k: mx.zeros((n,) + SHAPE[k], dtype=DT.get(k, mx.bfloat16)) + 1 for k in KEYS}
    mx.eval(b)
    return b


def gbytes(p):
    return sum(v.nbytes for v in p.values()) / 1e9


def timed(fn, reps):
    fn(); mx.synchronize()
    t0 = time.perf_counter()
    for _ in range(reps):
        fn()
    mx.synchronize()
    return (time.perf_counter() - t0) / reps


def run(S, nbatch, reps=4):
    p = make_pool(S)
    e = make_batch(nbatch)
    slots = mx.array([(i * 7919) % S for i in range(nbatch)])
    mx.eval(slots)
    gb = gbytes(p)
    print(f"\n--- pool {gb:.2f} GB ({S} slots), batch {nbatch} experts "
          f"({nbatch*REC/1e6:.1f} MB) ---")
    mx.reset_peak_memory()

    res = {}
    def A():
        for i in range(nbatch):
            s = (i * 7919) % S
            for k in KEYS:
                p[k][s] = e[k][i]
        mx.eval([p[k] for k in KEYS])
    res["A per-slot assign"] = timed(A, reps)

    def B():
        for k in KEYS:
            p[k][slots] = e[k]
        mx.eval([p[k] for k in KEYS])
    res["B batch scatter"] = timed(B, reps)

    def C():
        for k in KEYS:
            p[k][0:nbatch] = e[k]
        mx.eval([p[k] for k in KEYS])
    res["C contiguous"] = timed(C, reps)

    if hasattr(mx, "slice_update"):
        def D():
            for k in KEYS:
                p[k] = mx.slice_update(p[k], e[k], mx.array([0, 0, 0])[:1], axes=(0,))
            mx.eval([p[k] for k in KEYS])
        try:
            res["D slice_update"] = timed(D, reps)
        except Exception as ex:
            print("   slice_update unsupported:", type(ex).__name__, ex)

    for name, dt in sorted(res.items(), key=lambda kv: kv[1]):
        per = dt / nbatch
        verdict = "PASS" if REC/per/1e9 >= 5 else "fail"
        print(f"   {name:22} {dt*1000:8.2f} ms/batch  {per*1000:7.3f} ms/exp  "
              f"{REC/per/1e9:7.2f} GB/s  [{verdict}]")
    print(f"   peak mem {mx.get_peak_memory()/1e9:.2f} GB "
          f"(pool {gb:.2f} + batch {nbatch*REC/1e9:.2f})")
    del p, e
    gc.collect()
    return res


if __name__ == "__main__":
    sizes = [int(a) for a in sys.argv[1:]] or [2048]
    for S in sizes:
        run(S, 48)
