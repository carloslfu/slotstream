---
type: run
id: 01m1qmncn06ye94a5rxjb8m6s5
created: 2026-09-05T01:59:21.504811+00:00
updated: 2026-09-05T02:06:05.848178+00:00
summary: 'Prefill parallelism: source identities and CPU FP64 gated-delta block algebra, without performance or production parity claims'
binary: Python 3.12.9; NumPy 2.5.2 CPU; complete script and source hashes in body; no model binary
captured_at: 2026-09-04
command: .venv31/bin/python /tmp/slotstream-prefill-parallelism-20260904/check.py
date: 2026-09-04
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Prefill parallelism: CPU FP64 block algebra and source identities'
tool: Python and NumPy CPU; static source inspection
---
# Prefill parallelism: bounded algebra and source check

This is a CPU FP64 check of an alternative block evaluation of the implemented gated-delta recurrence. It establishes only algebraic consistency on the listed synthetic cases. It does not load a checkpoint, execute Metal, measure speed, establish production FP32/Kahan parity, or validate full-model routing/state/quality. No production inference file was changed.

The reproducible command was `.venv31/bin/python /tmp/slotstream-prefill-parallelism-20260904/check.py` from the Slotstream root. The complete script and result are preserved below so the temporary path is not a recovery dependency.

Each block solves two unit-lower-triangular systems whose coefficients depend only on its q/k/v/g/beta inputs, then combines them with its incoming state. Direct local interval products deliberately cover zero decay without dividing cumulative products. Cases include nonzero initial state, partial final blocks, zero/unit decay or update gates, masked tokens, collinear keys, and key/value dimensions of 128. These double-precision calculations are not a reproduction of the GPU kernel's compensated reductions or BF16 output rounding.

Source hashes identify the production dependency paths inspected for router readback, resident-first sweep, bounded staging, evaluation locking/events and attention dispatch. HEAD is recorded but the source hashes, including the pinned checkout, are the exact read identity.

## Reproducer

```python
"""CPU FP64 algebra check, not a Metal implementation or speed benchmark."""
import hashlib
import json
import pathlib
import subprocess
import numpy as np

ROOT = pathlib.Path('/Users/carlos/Projects/slotstream')
OUT = pathlib.Path(__file__).parent
rng = np.random.default_rng(20260904)

def recurrent(q, k, v, g, beta, initial, mask):
    state = initial.copy()
    ys = []
    for i in range(len(q)):
        if mask[i]:
            state *= g[i]
            delta = beta[i] * (v[i] - state @ k[i])
            state += np.outer(delta, k[i])
            ys.append(state @ q[i])
        else:
            ys.append(np.zeros(v.shape[1]))
    return np.stack(ys), state

def blocked(q, k, v, g, beta, initial, mask, block):
    state = initial.copy()
    ys = []
    for lo in range(0, len(q), block):
        sl = slice(lo, lo + block)
        qb, kb, vb = q[sl], k[sl], v[sl]
        mb = mask[sl]
        gb = np.where(mb, g[sl], 1.0)
        bb = np.where(mb, beta[sl], 0.0)
        n = len(qb)
        # Direct interval products avoid gamma_i / gamma_j when g == 0.
        decay = np.zeros((n, n))
        for j in range(n):
            decay[j, j] = 1.0
            for i in range(j + 1, n):
                decay[i, j] = decay[i - 1, j] * gb[i]
        gamma = np.cumprod(gb)
        triangular = np.eye(n) + np.tril(bb[:, None] * decay * (kb @ kb.T), -1)
        # The two right-hand sides depend only on this block, not its incoming state.
        uv = np.linalg.solve(triangular, bb[:, None] * vb)
        wk = np.linalg.solve(triangular, (bb * gamma)[:, None] * kb)
        delta = uv - wk @ state.T
        y = gamma[:, None] * (qb @ state.T) + (decay * (qb @ kb.T)) @ delta
        ys.append(np.where(mb[:, None], y, 0.0))
        state = gamma[-1] * state + delta.T @ (decay[-1, :, None] * kb)
    return np.concatenate(ys), state

results = []
for dk, dv, length in [(8, 7, 129), (128, 128, 65)]:
    q = rng.normal(size=(length, dk)); q /= np.linalg.norm(q, axis=1, keepdims=True) * np.sqrt(dk)
    k = rng.normal(size=(length, dk)); k /= np.linalg.norm(k, axis=1, keepdims=True)
    v = rng.normal(size=(length, dv))
    initial = rng.normal(size=(dv, dk))
    g0 = rng.uniform(0.2, 1.0, length)
    b0 = rng.uniform(0.0, 1.0, length)
    for mode in ['ordinary', 'zero_decay', 'unit_decay', 'zero_beta', 'unit_beta', 'masked', 'collinear']:
        g, beta, ki = g0.copy(), b0.copy(), k.copy()
        mask = np.ones(length, dtype=bool)
        if mode == 'zero_decay': g[::7] = 0.0
        if mode == 'unit_decay': g[:] = 1.0
        if mode == 'zero_beta': beta[:] = 0.0
        if mode == 'unit_beta': beta[:] = 1.0
        if mode == 'masked': mask[::5] = False
        if mode == 'collinear': ki[:] = ki[0]; g[:] = 1.0; beta[:] = 1.0
        reference_y, reference_state = recurrent(q, ki, v, g, beta, initial, mask)
        for block in [1, 4, 16, 64]:
            y, state = blocked(q, ki, v, g, beta, initial, mask, block)
            y_error = float(np.max(np.abs(y - reference_y)))
            state_error = float(np.max(np.abs(state - reference_state)))
            assert np.isfinite(y).all() and np.isfinite(state).all()
            assert y_error < 1e-11 and state_error < 1e-11, (mode, block, y_error, state_error)
            results.append(dict(dk=dk, dv=dv, tokens=length, mode=mode, block=block,
                                max_output_abs_error=y_error, max_state_abs_error=state_error))

files = [
    'Sources/Slotstream/Layers.swift', 'Sources/Slotstream/Model.swift',
    'Sources/Slotstream/Generate.swift', 'Sources/Slotstream/ExpertStore.swift',
    'Sources/Slotstream/NgramStore.swift', 'Sources/Slotstream/Vendored/GatedDelta.swift',
    '.build/checkouts/mlx-swift/Source/MLX/Transforms+Eval.swift',
    '.build/checkouts/mlx-swift/Source/MLX/MLXArray.swift',
    '.build/checkouts/mlx-swift/Source/MLX/MLXArray+Bytes.swift',
    '.build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/array.cpp',
    '.build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/transforms.cpp',
    '.build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/backend/metal/scaled_dot_product_attention.cpp',
]
report = dict(
    scope='CPU FP64 algebra only; no checkpoint, Metal timing, production FP32/Kahan parity or task quality',
    seed=20260904, numpy=np.__version__,
    git_head=subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip(),
    script_sha256=hashlib.sha256(pathlib.Path(__file__).read_bytes()).hexdigest(),
    source_sha256={f: hashlib.sha256((ROOT/f).read_bytes()).hexdigest() for f in files},
    checks=len(results),
    max_output_abs_error=max(r['max_output_abs_error'] for r in results),
    max_state_abs_error=max(r['max_state_abs_error'] for r in results),
    cases=results,
)
(OUT/'result.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps({k:v for k,v in report.items() if k not in ['source_sha256', 'cases']}, indent=2))
```

## Raw result

```json
{
  "scope": "CPU FP64 algebra only; no checkpoint, Metal timing, production FP32/Kahan parity or task quality",
  "seed": 20260904,
  "numpy": "2.5.2",
  "git_head": "6e66a367f93e636c3729179e24007aa99c97b9a6",
  "script_sha256": "072b92989e8854cc0e98814da2ba8066463d97a1308d2a16f15cbb1c435f0a1c",
  "source_sha256": {
    "Sources/Slotstream/Layers.swift": "633c019f7f80a8ba276836c551b150911f607e0e2780613073bb4f73547834fe",
    "Sources/Slotstream/Model.swift": "37066e1d04b1c0b175f410fc3927f1bd82c961acb5ef70db51c53123e2a8ac3e",
    "Sources/Slotstream/Generate.swift": "d52f5915a40f71114f5c286848d917d17d8bb4c724061d41d5ef32f5e3f0cebf",
    "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
    "Sources/Slotstream/NgramStore.swift": "ce12a4c0375d831c58d7d488cfec015ec725e82a625ae4d982f7cb2bb068d02e",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "64251c8f7ce41a41a69b7c8c777fc9a361a9437f70c0109bd8108c721f9f6580",
    ".build/checkouts/mlx-swift/Source/MLX/Transforms+Eval.swift": "14b867c903be78547b426305257ca70e214b7b854acf1c0dc2cf7c82333f4999",
    ".build/checkouts/mlx-swift/Source/MLX/MLXArray.swift": "0a946940556881a1b6e82a7bc0b880f003ba7ac3743ec2c97e587795765bfc8a",
    ".build/checkouts/mlx-swift/Source/MLX/MLXArray+Bytes.swift": "e21491f1db8d5574f7489230ba3379d73817153dbfc30991aa2918e2966ef0e8",
    ".build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/array.cpp": "0a78f5bf325e1a76fd0adc20dd953934960f912a6023a4f0bc6bacfb5f283cca",
    ".build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/transforms.cpp": "7dc2d4fcc6556274549b07c4c6084b31665f511f9d481ce2a74ac054277c684f",
    ".build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/backend/metal/scaled_dot_product_attention.cpp": "4d36489d2f2eadabed1ba275f392f40ed49256b8a7f951c779bbaf8bdd7f125f"
  },
  "checks": 56,
  "max_output_abs_error": 1.942890293094024e-15,
  "max_state_abs_error": 6.5503158452884236e-15,
  "cases": [
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "ordinary",
      "block": 1,
      "max_output_abs_error": 1.457167719820518e-16,
      "max_state_abs_error": 5.551115123125783e-17
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "ordinary",
      "block": 4,
      "max_output_abs_error": 1.3877787807814457e-16,
      "max_state_abs_error": 1.1102230246251565e-16
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "ordinary",
      "block": 16,
      "max_output_abs_error": 1.6653345369377348e-16,
      "max_state_abs_error": 1.1102230246251565e-16
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "ordinary",
      "block": 64,
      "max_output_abs_error": 3.885780586188048e-16,
      "max_state_abs_error": 2.7755575615628914e-16
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "zero_decay",
      "block": 1,
      "max_output_abs_error": 1.6653345369377348e-16,
      "max_state_abs_error": 5.551115123125783e-17
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "zero_decay",
      "block": 4,
      "max_output_abs_error": 1.1102230246251565e-16,
      "max_state_abs_error": 5.551115123125783e-17
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "zero_decay",
      "block": 16,
      "max_output_abs_error": 1.1102230246251565e-16,
      "max_state_abs_error": 5.551115123125783e-17
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "zero_decay",
      "block": 64,
      "max_output_abs_error": 1.1102230246251565e-16,
      "max_state_abs_error": 5.551115123125783e-17
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "unit_decay",
      "block": 1,
      "max_output_abs_error": 4.440892098500626e-16,
      "max_state_abs_error": 4.440892098500626e-16
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "unit_decay",
      "block": 4,
      "max_output_abs_error": 2.7755575615628914e-16,
      "max_state_abs_error": 6.661338147750939e-16
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "unit_decay",
      "block": 16,
      "max_output_abs_error": 3.3306690738754696e-16,
      "max_state_abs_error": 6.661338147750939e-16
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "unit_decay",
      "block": 64,
      "max_output_abs_error": 5.967448757360216e-16,
      "max_state_abs_error": 1.519617764955683e-15
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "zero_beta",
      "block": 1,
      "max_output_abs_error": 6.938893903907228e-17,
      "max_state_abs_error": 0.0
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "zero_beta",
      "block": 4,
      "max_output_abs_error": 1.1102230246251565e-16,
      "max_state_abs_error": 2.8463875056597847e-46
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "zero_beta",
      "block": 16,
      "max_output_abs_error": 1.1102230246251565e-16,
      "max_state_abs_error": 1.5326701953552687e-46
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "zero_beta",
      "block": 64,
      "max_output_abs_error": 1.1102230246251565e-16,
      "max_state_abs_error": 1.7516230804060213e-46
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "unit_beta",
      "block": 1,
      "max_output_abs_error": 2.220446049250313e-16,
      "max_state_abs_error": 2.220446049250313e-16
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "unit_beta",
      "block": 4,
      "max_output_abs_error": 2.220446049250313e-16,
      "max_state_abs_error": 4.440892098500626e-16
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "unit_beta",
      "block": 16,
      "max_output_abs_error": 1.6653345369377348e-16,
      "max_state_abs_error": 6.661338147750939e-16
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "unit_beta",
      "block": 64,
      "max_output_abs_error": 4.996003610813204e-16,
      "max_state_abs_error": 4.440892098500626e-16
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "masked",
      "block": 1,
      "max_output_abs_error": 2.220446049250313e-16,
      "max_state_abs_error": 1.6653345369377348e-16
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "masked",
      "block": 4,
      "max_output_abs_error": 1.6653345369377348e-16,
      "max_state_abs_error": 1.1102230246251565e-16
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "masked",
      "block": 16,
      "max_output_abs_error": 1.6653345369377348e-16,
      "max_state_abs_error": 1.1102230246251565e-16
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "masked",
      "block": 64,
      "max_output_abs_error": 3.0531133177191805e-16,
      "max_state_abs_error": 4.440892098500626e-16
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "collinear",
      "block": 1,
      "max_output_abs_error": 2.220446049250313e-16,
      "max_state_abs_error": 0.0
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "collinear",
      "block": 4,
      "max_output_abs_error": 6.661338147750939e-16,
      "max_state_abs_error": 3.552713678800501e-15
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "collinear",
      "block": 16,
      "max_output_abs_error": 9.992007221626409e-16,
      "max_state_abs_error": 2.6645352591003757e-15
    },
    {
      "dk": 8,
      "dv": 7,
      "tokens": 129,
      "mode": "collinear",
      "block": 64,
      "max_output_abs_error": 1.942890293094024e-15,
      "max_state_abs_error": 6.5503158452884236e-15
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "ordinary",
      "block": 1,
      "max_output_abs_error": 4.163336342344337e-17,
      "max_state_abs_error": 1.1102230246251565e-16
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "ordinary",
      "block": 4,
      "max_output_abs_error": 8.326672684688674e-17,
      "max_state_abs_error": 1.1102230246251565e-16
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "ordinary",
      "block": 16,
      "max_output_abs_error": 8.326672684688674e-17,
      "max_state_abs_error": 1.1102230246251565e-16
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "ordinary",
      "block": 64,
      "max_output_abs_error": 8.326672684688674e-17,
      "max_state_abs_error": 1.6653345369377348e-16
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "zero_decay",
      "block": 1,
      "max_output_abs_error": 1.3877787807814457e-17,
      "max_state_abs_error": 1.1102230246251565e-16
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "zero_decay",
      "block": 4,
      "max_output_abs_error": 3.8163916471489756e-17,
      "max_state_abs_error": 1.1102230246251565e-16
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "zero_decay",
      "block": 16,
      "max_output_abs_error": 3.469446951953614e-17,
      "max_state_abs_error": 1.1102230246251565e-16
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "zero_decay",
      "block": 64,
      "max_output_abs_error": 3.469446951953614e-17,
      "max_state_abs_error": 1.1102230246251565e-16
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "unit_decay",
      "block": 1,
      "max_output_abs_error": 1.1102230246251565e-16,
      "max_state_abs_error": 1.5543122344752192e-15
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "unit_decay",
      "block": 4,
      "max_output_abs_error": 2.7755575615628914e-16,
      "max_state_abs_error": 2.6645352591003757e-15
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "unit_decay",
      "block": 16,
      "max_output_abs_error": 2.220446049250313e-16,
      "max_state_abs_error": 2.6645352591003757e-15
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "unit_decay",
      "block": 64,
      "max_output_abs_error": 2.7755575615628914e-16,
      "max_state_abs_error": 2.6645352591003757e-15
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "zero_beta",
      "block": 1,
      "max_output_abs_error": 2.7755575615628914e-17,
      "max_state_abs_error": 0.0
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "zero_beta",
      "block": 4,
      "max_output_abs_error": 8.326672684688674e-17,
      "max_state_abs_error": 4.338734978715565e-30
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "zero_beta",
      "block": 16,
      "max_output_abs_error": 8.326672684688674e-17,
      "max_state_abs_error": 6.310887241768095e-30
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "zero_beta",
      "block": 64,
      "max_output_abs_error": 8.326672684688674e-17,
      "max_state_abs_error": 3.549874073494553e-30
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "unit_beta",
      "block": 1,
      "max_output_abs_error": 5.551115123125783e-17,
      "max_state_abs_error": 1.1102230246251565e-16
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "unit_beta",
      "block": 4,
      "max_output_abs_error": 1.1102230246251565e-16,
      "max_state_abs_error": 1.1102230246251565e-16
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "unit_beta",
      "block": 16,
      "max_output_abs_error": 1.1102230246251565e-16,
      "max_state_abs_error": 2.220446049250313e-16
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "unit_beta",
      "block": 64,
      "max_output_abs_error": 1.1102230246251565e-16,
      "max_state_abs_error": 2.7755575615628914e-16
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "masked",
      "block": 1,
      "max_output_abs_error": 3.9898639947466563e-17,
      "max_state_abs_error": 1.1102230246251565e-16
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "masked",
      "block": 4,
      "max_output_abs_error": 9.71445146547012e-17,
      "max_state_abs_error": 1.1102230246251565e-16
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "masked",
      "block": 16,
      "max_output_abs_error": 9.71445146547012e-17,
      "max_state_abs_error": 1.1102230246251565e-16
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "masked",
      "block": 64,
      "max_output_abs_error": 9.71445146547012e-17,
      "max_state_abs_error": 1.1102230246251565e-16
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "collinear",
      "block": 1,
      "max_output_abs_error": 1.1102230246251565e-16,
      "max_state_abs_error": 0.0
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "collinear",
      "block": 4,
      "max_output_abs_error": 2.498001805406602e-16,
      "max_state_abs_error": 3.552713678800501e-15
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "collinear",
      "block": 16,
      "max_output_abs_error": 2.220446049250313e-16,
      "max_state_abs_error": 3.1086244689504383e-15
    },
    {
      "dk": 128,
      "dv": 128,
      "tokens": 65,
      "mode": "collinear",
      "block": 64,
      "max_output_abs_error": 3.3306690738754696e-16,
      "max_state_abs_error": 3.1086244689504383e-15
    }
  ]
}
```
