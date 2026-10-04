---
type: run
created: 2026-10-04T11:55:33.747821+00:00
updated: 2026-10-04T11:57:21.554238+00:00
summary: Bounded BF16 affine refit component with independent stored-error, packing and batch checks
binary: mlx-0.32.2-affine-refit-component
captured_at: 2026-10-04
command: .venv/bin/python .build/quantization-research/check-affine-refit-v1.py
discarded: false
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Affine three-bit reconstruction refit component
tool: pinned MLX and independent NumPy byte/error oracles
---

A new, bounded hypothesis improves the existing affine representation before committing to another complete pack. It fits BF16 scales and biases to the already quantized original four-bit values, using two deterministic starts and eight alternating least-squares/code assignment steps. Selection measures actual MLX BF16 dequantization error for each group and retains the unchanged control when no candidate improves it. This is an ordinary squared weight-error objective, not HQQ's robust proximal objective, activation-aware calibration or recovery of the training checkpoint.

The primary prior art for optimizing affine parameters without activation examples is [Badri and Shaji, HQQ](https://dropbox.github.io/hqq_blog/). The inspected local MLX 0.32.2 affine quantizer uses extrema and zero-aligned scale/bias. [MLX quantize documentation](https://ml-explore.github.io/mlx/build/html/python/_autosummary/mlx.core.quantize.html) describes the affine API; the experiment keeps the installed 0.32.2 runtime and does not infer compatibility from the newer documentation version. No published model-quality result is transferred to this checkpoint.

The frozen component screen covers both real projection shapes synthetically, with batch-versus-single equality, and eighteen prospectively selected actual projection/expert combinations: layers zero, twenty-three and forty-seven; experts zero and five-hundred-eleven; gate, up and down. Every source file is fully authenticated; the existing three-bit control is reproduced exactly before comparison. An independent byte oracle and MLX decoder agree across packed byte/word splits, serialization preserves all values, and independent float64 group-error reductions observe no regressed groups. All real sampled projections reduce squared reconstruction error by approximately half, while the maximum individual absolute error increases in twelve of eighteen. This tradeoff is preserved explicitly. No complete model is loaded and no quality, speed or promotion result follows.

The component finishes inside its prospective four-GB process, thirteen-GB actual preflight, three-GB headroom and twenty-minute bounds, without adding model weights or raw reference logits. A full conversion requires a separately priced total staging budget, new artifact identity, complete reference and quality checks. The existing control, supported original pack and installed model remain unchanged.

Local home prefixes are normalized to <HOME>; exact original and normalized identities follow. Large or Markdown-sensitive payloads use verified lossless zlib-base64.

### /Users/carlos/Projects/slotstream/.build/quantization-research/capture-affine-refit-component-v1.py

Original bytes: 4472. SHA-256: `fd40fb811da322d97cc86337c0c9f7ef65deb9a799820053f9308e01428f280f`.

Normalized bytes: 4472. SHA-256: `fd40fb811da322d97cc86337c0c9f7ef65deb9a799820053f9308e01428f280f`.

````zlib-base64
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
````

### Tools/affine_refit.py

Original bytes: 6595. SHA-256: `747303b670c7ce0ebe04893758b8a5bb95f7a881451b16bbc02f69b842823332`.

Normalized bytes: 6595. SHA-256: `747303b670c7ce0ebe04893758b8a5bb95f7a881451b16bbc02f69b842823332`.

````text
"""Bounded affine-three-bit reconstruction experiment, not a pack converter.

Fit the stored BF16 scale and bias to the already quantized four-bit parent.
Two deterministic starts (the MLX control and paired parent levels) receive
eight alternating least-squares/code-assignment steps. Selection uses actual
MLX BF16 dequantization error per group, including the unchanged control as a
fallback. This is a weight-reconstruction objective, not task-quality evidence
or a recovery of BF16 training weights. The on-disk representation stays MLX
affine three-bit/group-64; no inference arithmetic is changed here.

The optimization is ordinary least squares, not HQQ's robust proximal loss.
Prior art for optimizing affine parameters without activation calibration:
https://dropbox.github.io/hqq_blog/
"""

POLICY = 'affine4-parent-affine3-bf16-refit-component-v1'
GROUP = 64
ITERATIONS = 8
MAX_VALUES = 8 * 640 * 2560


def pack_codes(codes):
    """MLX contiguous little-endian three-bit packing, including word splits."""
    import mlx.core as mx
    if codes.dtype != mx.uint32 or codes.ndim < 2 or codes.shape[-1] % 32 or codes.size > MAX_VALUES:
        raise ValueError('bounded complete uint32 code rows required')
    if not bool(mx.all(codes <= 7).item()):
        raise ValueError('three-bit code outside [0, 7]')
    shape = codes.shape
    rows = codes.reshape(-1, 8)
    words = mx.sum(rows << (3 * mx.arange(8, dtype=mx.uint32)), axis=-1)
    packed = mx.stack([words & 255, (words >> 8) & 255, (words >> 16) & 255], axis=-1).astype(mx.uint8)
    # Each original row has a multiple of 32 values, so byte groups end on
    # complete uint32 boundaries. A view changes storage interpretation only.
    return packed.reshape(*shape[:-1], shape[-1] * 3 // 8).view(mx.uint32)


def refit(dense, parent_scales, parent_biases, control, *, checkpoint=lambda: None):
    """Return stored tensors plus diagnostic per-group errors for one batch.

    Callers own process/headroom/time limits and authenticated source reads.
    This function admits at most eight real expert projections at once and
    synchronizes each iteration so deferred graphs cannot span the conversion.
    """
    import mlx.core as mx
    checkpoint()
    if mx.__version__ != '0.32.2':
        raise ValueError('refit requires pinned MLX 0.32.2')
    if (dense.dtype != mx.bfloat16 or dense.ndim not in (2, 3) or not 0 < dense.size <= MAX_VALUES
            or tuple(dense.shape[-2:]) not in ((640, 2560), (2560, 640))):
        raise ValueError('refit requires a bounded real expert shape')
    shape = dense.shape
    parameter_shape = (*shape[:-1], shape[-1] // GROUP)
    if any(v.dtype != mx.bfloat16 or tuple(v.shape) != parameter_shape for v in (parent_scales, parent_biases)):
        raise ValueError('parent affine parameter geometry differs')
    if (not isinstance(control, (tuple, list)) or len(control) != 3
            or control[0].dtype != mx.uint32
            or tuple(control[0].shape) != (*shape[:-1], shape[-1] * 3 // 32)
            or any(v.dtype != mx.bfloat16 or tuple(v.shape) != parameter_shape for v in control[1:])):
        raise ValueError('control affine parameter geometry differs')
    if not all(bool(mx.all(mx.isfinite(v)).item()) for v in (dense, parent_scales, parent_biases, *control[1:])):
        raise ValueError('nonfinite affine refit input')

    target = dense.astype(mx.float32).reshape(-1, GROUP)
    target_mean = mx.mean(target, axis=-1, keepdims=True)
    original_codes = mx.dequantize(control[0], mx.ones_like(control[1]), mx.zeros_like(control[2]), group_size=GROUP, bits=3).astype(mx.uint32)

    def error(codes, scales, biases):
        packed = pack_codes(codes.reshape(shape))
        rebuilt = mx.dequantize(packed, scales.reshape(parameter_shape), biases.reshape(parameter_shape), group_size=GROUP, bits=3)
        delta = rebuilt.astype(mx.float32).reshape(-1, GROUP) - target
        loss = mx.mean(delta * delta, axis=-1, keepdims=True)
        mx.eval(packed, loss)
        return loss

    def assign(scales, biases):
        s, b = scales.astype(mx.float32), biases.astype(mx.float32)
        denominator = mx.where(s == 0, 1, s)
        return mx.clip(mx.round((target - b) / denominator), 0, 7).astype(mx.uint32)

    best_codes = original_codes.reshape(-1, GROUP)
    best_scales, best_biases = [v.reshape(-1, 1) for v in control[1:]]
    baseline_loss = error(best_codes, best_scales, best_biases)
    best_loss = baseline_loss
    starts = [
        (best_codes, best_scales, best_biases),
        (None, (parent_scales.astype(mx.float32) * 2).astype(mx.bfloat16).reshape(-1, 1),
         (parent_biases.astype(mx.float32) + parent_scales.astype(mx.float32) * .5).astype(mx.bfloat16).reshape(-1, 1)),
    ]
    for codes, scales, biases in starts:
        if codes is None:
            codes = assign(scales, biases)
        for iteration in range(ITERATIONS + 1):
            checkpoint()
            loss = error(codes, scales, biases)
            better = loss < best_loss
            best_codes = mx.where(better, codes, best_codes)
            best_scales = mx.where(better, scales, best_scales)
            best_biases = mx.where(better, biases, best_biases)
            best_loss = mx.minimum(loss, best_loss)
            mx.eval(best_codes, best_scales, best_biases, best_loss)
            if iteration == ITERATIONS:
                break
            q = codes.astype(mx.float32)
            mean = mx.mean(q, axis=-1, keepdims=True)
            centered = q - mean
            variance = mx.mean(centered * centered, axis=-1, keepdims=True)
            covariance = mx.mean(centered * (target - target_mean), axis=-1, keepdims=True)
            fitted = mx.where(variance == 0, 0, covariance / mx.where(variance == 0, 1, variance))
            scales = fitted.astype(mx.bfloat16)
            biases = (target_mean - scales.astype(mx.float32) * mean).astype(mx.bfloat16)
            if not all(bool(mx.all(mx.isfinite(v)).item()) for v in (scales, biases)):
                raise ArithmeticError('nonfinite fitted affine parameters')
            codes = assign(scales, biases)
            mx.eval(codes, scales, biases)
    result = (pack_codes(best_codes.reshape(shape)), best_scales.reshape(parameter_shape), best_biases.reshape(parameter_shape))
    mx.eval(result, best_loss, baseline_loss)
    if not bool(mx.all(best_loss <= baseline_loss).item()):
        raise ArithmeticError('stored refit group regressed against the unchanged control')
    return result, {'baseline_group_mse': baseline_loss, 'refit_group_mse': best_loss}
````

### .build/quantization-research/affine-refit-resource-v1.json

Original bytes: 1901. SHA-256: `7606c3c94f0c59ab1ff55459a83f52ed7c4bb6619b20eb3bcef34f06c3dbfd4d`.

Normalized bytes: 1901. SHA-256: `7606c3c94f0c59ab1ff55459a83f52ed7c4bb6619b20eb3bcef34f06c3dbfd4d`.

````text
{
  "schema": 1,
  "policy": "affine4-parent-affine3-bf16-refit-component-v1",
  "created_at": "2026-10-04T11:44:02.466789+00:00",
  "purpose": "Screen fixed-scale/offset least-squares refitting from already four-bit parent values, without a full conversion or quality claim. Keep unchanged three-bit groups when actual stored-BF16 reconstruction error does not improve.",
  "layers": [
    0,
    23,
    47
  ],
  "experts": [
    0,
    511
  ],
  "families": [
    "gate_proj",
    "up_proj",
    "down_proj"
  ],
  "synthetic_shapes": [
    [
      2,
      640,
      2560
    ],
    [
      2,
      2560,
      640
    ]
  ],
  "iterations_per_start": 8,
  "starts": [
    "existing-MLX-affine3",
    "paired-parent-levels"
  ],
  "maximum_model_runs": 0,
  "maximum_component_runs": 1,
  "maximum_process_bytes": 4000000000,
  "minimum_preflight_bytes": 13000000000,
  "minimum_headroom_bytes": 3000000000,
  "maximum_seconds": 1200,
  "maximum_new_artifact_bytes": 20000000,
  "maximum_research_staging_bytes": 370000000000,
  "new_weight_bytes": 0,
  "new_reference_logit_bytes": 0,
  "paid_compute_usd": 0,
  "independent_mse_reduction_roundoff_relative": 1e-07,
  "independent_mse_reduction_roundoff_absolute": 1e-30,
  "failure_policy": "Stop on any identity, physical, headroom, pressure, duration, packing, batching, serialization or group-error violation. No outcome-dependent replacement samples.",
  "inference_policy": "No model loaded, no supported-pack change, no use of held-out prompts, and no full export until measured component evidence and a separate total staging reservation justify it.",
  "producer_sha256": "8a0dec39e35942e44245babfa8fcfaf8dc548803e87b7ad054da502ebb2d995e",
  "implementation_sha256": "747303b670c7ce0ebe04893758b8a5bb95f7a881451b16bbc02f69b842823332",
  "control_manifest_sha256": "af31bd191fbd82dc998fe29cae230c7f3e6977bd355c827bf42e643b7680f182"
}
````

### .build/quantization-research/check-affine-refit-v1.py

Original bytes: 9645. SHA-256: `8a0dec39e35942e44245babfa8fcfaf8dc548803e87b7ad054da502ebb2d995e`.

Normalized bytes: 9645. SHA-256: `8a0dec39e35942e44245babfa8fcfaf8dc548803e87b7ad054da502ebb2d995e`.

````zlib-base64
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
0PsfG6gnkw==
````

### .build/quantization-research/affine-refit-component-driver-v1.log

Original bytes: 14596. SHA-256: `4922c07ab3ba5cb8e15cf2e23815519a6d20d4273d3a3401c5be04507d95c49f`.

Normalized bytes: 14596. SHA-256: `4922c07ab3ba5cb8e15cf2e23815519a6d20d4273d3a3401c5be04507d95c49f`.

````text
{"label": "synthetic-640x2560", "values": 3276800, "groups": 51200, "baseline_mse": 0.03183347983547719, "refit_mse": 0.014939066163788085, "relative_mse_reduction": 0.5307121231798521, "groups_improved": 51200, "groups_equal": 0, "groups_worse": 0, "maximum_group_excess": -0.013569772243499756, "baseline_max_abs_error": 0.25, "refit_max_abs_error": 0.15625, "tensor_sha256": ["d8bde923982f559da714e8d1b14d94fa178921c04e415d38daaecbff552d15e9", "ab46c2ce965dd13943f3559c6aa5524ddb1ba6125151ed29b43cce5cd45244f5", "b445d2b259ab14ff43a602a5df8fa004284e6d1cacd389cf86e8ca12e85f77ad"], "batch_split_equal": true, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.24211616697721183}
{"label": "synthetic-2560x640", "values": 3276800, "groups": 51200, "baseline_mse": 0.03183347983547719, "refit_mse": 0.014939066163788085, "relative_mse_reduction": 0.5307121231798521, "groups_improved": 51200, "groups_equal": 0, "groups_worse": 0, "maximum_group_excess": -0.013569772243499756, "baseline_max_abs_error": 0.25, "refit_max_abs_error": 0.15625, "tensor_sha256": ["d8bde923982f559da714e8d1b14d94fa178921c04e415d38daaecbff552d15e9", "ab46c2ce965dd13943f3559c6aa5524ddb1ba6125151ed29b43cce5cd45244f5", "b445d2b259ab14ff43a602a5df8fa004284e6d1cacd389cf86e8ca12e85f77ad"], "batch_split_equal": true, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.15826162497978657}
{"label": "layer-0-expert-0-gate_proj", "values": 1638400, "groups": 25600, "baseline_mse": 9.733164851013499e-06, "refit_mse": 4.938921345569725e-06, "relative_mse_reduction": 0.492567790521349, "groups_improved": 25600, "groups_equal": 0, "groups_worse": 0, "maximum_group_excess": -2.56288331001997e-07, "baseline_max_abs_error": 0.015625, "refit_max_abs_error": 0.021484375, "tensor_sha256": ["dad55bab210d5d8ec7282957b40aac7508374057261169e91c4f8462a2e7ed9d", "ad1b9a2c018ec0070af3e5767477c2facc5f584bc9fa3cacc251487c109663f7", "fb45abfe9b1e48b2a79855e614a2fa54e19c83e28707a26541ec039d1c7a48fd"], "batch_split_equal": false, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.06326641701161861}
{"label": "layer-0-expert-0-up_proj", "values": 1638400, "groups": 25600, "baseline_mse": 9.184895808687089e-06, "refit_mse": 4.66176425931053e-06, "relative_mse_reduction": 0.4924532235954787, "groups_improved": 25600, "groups_equal": 0, "groups_worse": 0, "maximum_group_excess": -1.6816193237900734e-07, "baseline_max_abs_error": 0.012451171875, "refit_max_abs_error": 0.01806640625, "tensor_sha256": ["ffee929752a34324d9efd59b5804519e52d725a671bcb3d75c4fed5ce8168f91", "e405e05b20ec050b30e3346b85136941dff7fbf1e256e1d7bb7b2ffe3f058a5f", "f4dfbc17cf6799f03c6a30cb97434f3ab6c8591ac46ade4f06c475b184e6c436"], "batch_split_equal": false, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.045979458023793995}
{"label": "layer-0-expert-0-down_proj", "values": 1638400, "groups": 25600, "baseline_mse": 7.691919520098623e-06, "refit_mse": 3.895098967134913e-06, "relative_mse_reduction": 0.4936115807039837, "groups_improved": 25600, "groups_equal": 0, "groups_worse": 0, "maximum_group_excess": -3.795139491558075e-08, "baseline_max_abs_error": 0.016845703125, "refit_max_abs_error": 0.0166015625, "tensor_sha256": ["6d8d397d92f761bf62d44bb03e5c706b7dc7eaf0be1d0d23ac5661996d3d40f1", "ef8274294530d659d339ee5f6fe6c6fed031be81d40211bdca5593e1c496e5ba", "51b1f92690b9089bf5d8ef84700d93094fe61cbebfb18e8f40fa6cde078b0e18"], "batch_split_equal": false, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.0465383340488188}
{"label": "layer-0-expert-511-gate_proj", "values": 1638400, "groups": 25600, "baseline_mse": 7.416310439936069e-06, "refit_mse": 3.7665056539992748e-06, "relative_mse_reduction": 0.4921321478511702, "groups_improved": 25600, "groups_equal": 0, "groups_worse": 0, "maximum_group_excess": -1.380685716867447e-07, "baseline_max_abs_error": 0.0101318359375, "refit_max_abs_error": 0.0113525390625, "tensor_sha256": ["cba3fc2b25a271bbba75d856f2c74e3f31515c7c4e6c3fdb7feab5a64c161072", "b954ccc4ab2af41ce4b0d471e2e54b2f14ff3d723091ec6c11119c60e0cdb7d3", "3ed0ddd9c87f827074017f701ff732f23e6d49107a1c046a62f364ebfa9668ad"], "batch_split_equal": false, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.04619633301626891}
{"label": "layer-0-expert-511-up_proj", "values": 1638400, "groups": 25600, "baseline_mse": 7.326870240689231e-06, "refit_mse": 3.7120776453036796e-06, "relative_mse_reduction": 0.49336107732754275, "groups_improved": 25600, "groups_equal": 0, "groups_worse": 0, "maximum_group_excess": -2.6775524020195007e-07, "baseline_max_abs_error": 0.0107421875, "refit_max_abs_error": 0.0118408203125, "tensor_sha256": ["7e172d05454732e5215bd756f8e8f37742961cba07bd6d78dad21c2b740e6fe5", "2f0a17ae274d8c7287976d16bd49b1ef745fd9025976140fe898f8fd5ad2af77", "47d6f40efa2b91595d81c25efcba4be70c2d695d2f881f175dcd5f264282c0ca"], "batch_split_equal": false, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.045917667041067034}
{"label": "layer-0-expert-511-down_proj", "values": 1638400, "groups": 25600, "baseline_mse": 6.135317429105669e-06, "refit_mse": 3.1032330744196202e-06, "relative_mse_reduction": 0.4942017083422575, "groups_improved": 25600, "groups_equal": 0, "groups_worse": 0, "maximum_group_excess": -6.874324753880501e-08, "baseline_max_abs_error": 0.009521484375, "refit_max_abs_error": 0.0087890625, "tensor_sha256": ["d6a5bedf2d9688ea5f2653fcee028c5c87cf6eb7b3ec606f3b38a9793047e4b0", "057e7ba73ea9a750b6d5b996afba6af4debcf43596835a5a387876bfa9b3c6dc", "3d12c031b3f86ce5d949bce9d11a677d48006e3cbaf4a4570c8213bf07823d0d"], "batch_split_equal": false, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.04583866603206843}
{"label": "layer-23-expert-0-gate_proj", "values": 1638400, "groups": 25600, "baseline_mse": 7.602844604690517e-06, "refit_mse": 3.8549642398777454e-06, "relative_mse_reduction": 0.492957644103438, "groups_improved": 25600, "groups_equal": 0, "groups_worse": 0, "maximum_group_excess": -4.6522472985088825e-08, "baseline_max_abs_error": 0.0107421875, "refit_max_abs_error": 0.010498046875, "tensor_sha256": ["0d3a9cedbb516e7b399a39c560aa65ce1693f328d28e4f52ffeb7bd017eb7143", "9b29e0c754f5ec188d7e07cf65aae7764a2e30076e268746c50935d520d58687", "a8f77b9fd4c2b2ff6cace53746eb18344ccdae980cfeae35ca26f63f7e3809c2"], "batch_split_equal": false, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.045853541989345104}
{"label": "layer-23-expert-0-up_proj", "values": 1638400, "groups": 25600, "baseline_mse": 7.63123384317055e-06, "refit_mse": 3.865969861607255e-06, "relative_mse_reduction": 0.49340173017145283, "groups_improved": 25600, "groups_equal": 0, "groups_worse": 0, "maximum_group_excess": -1.152366166934371e-07, "baseline_max_abs_error": 0.0086669921875, "refit_max_abs_error": 0.01123046875, "tensor_sha256": ["1ea7cdfc3276e89cdd1d5ef7724b5bb3016d6a07610bf9f570e995f4b418fb1a", "899a8de0df24d015b33af05c42f571d1f9633590653d8744e85b90cf4fdd25dc", "a8514c76d771b25655a10685b0ef727a4bcf1aed8050ca04ea0b578d1741ed08"], "batch_split_equal": false, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.045802832988556474}
{"label": "layer-23-expert-0-down_proj", "values": 1638400, "groups": 25600, "baseline_mse": 7.24735879742866e-06, "refit_mse": 3.6642309007106635e-06, "relative_mse_reduction": 0.49440465097288677, "groups_improved": 25600, "groups_equal": 0, "groups_worse": 0, "maximum_group_excess": -2.1979212760925293e-07, "baseline_max_abs_error": 0.009521484375, "refit_max_abs_error": 0.010498046875, "tensor_sha256": ["e0aee162df977e8899a262cfb2775c373dfa1eb0f61cbb836634023f61ef99e0", "77c0b4a010005b8071134c0dd953f991e610e3e9ba26e16df3e68c17c95ba259", "808151dcbf90e908c2aa0d5cefa14814e2fc60791fa1eee7a22b9706324a3060"], "batch_split_equal": false, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.046187666011974216}
{"label": "layer-23-expert-511-gate_proj", "values": 1638400, "groups": 25600, "baseline_mse": 7.520658639634803e-06, "refit_mse": 3.8141912520472944e-06, "relative_mse_reduction": 0.49283813628423, "groups_improved": 25600, "groups_equal": 0, "groups_worse": 0, "maximum_group_excess": -2.558808773756027e-07, "baseline_max_abs_error": 0.0086669921875, "refit_max_abs_error": 0.0101318359375, "tensor_sha256": ["b7fb8b3778ddb07478f9e32d4783701e4850d465078a2e72cfcef9f1193df6da", "77e0a6089f41697bc2f77e190f602f0b2ef4eba38eb1663696952680d0e4ac5e", "8c94e3a734f6d80e3055243709d72ced8b63f37cf8d1ab20eef31a1a16de736b"], "batch_split_equal": false, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.04642308299662545}
{"label": "layer-23-expert-511-up_proj", "values": 1638400, "groups": 25600, "baseline_mse": 7.450842683738302e-06, "refit_mse": 3.781142881393862e-06, "relative_mse_reduction": 0.4925214446352054, "groups_improved": 25600, "groups_equal": 0, "groups_worse": 0, "maximum_group_excess": -8.815550245344639e-08, "baseline_max_abs_error": 0.009765625, "refit_max_abs_error": 0.00927734375, "tensor_sha256": ["32516ef9e1d0a013d579487f735d5d696632cfdabe2f9fdfedc8a5a8bbe94ea4", "c1a8e547e980d2e0b4f2ba1e210a127947468b522411b184c4599afda9657bb0", "807d5edf1a30d1eb3788256e511d5c4acb3ee734ccd582ab61327536bd723506"], "batch_split_equal": false, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.04662854102207348}
{"label": "layer-23-expert-511-down_proj", "values": 1638400, "groups": 25600, "baseline_mse": 7.184328030049869e-06, "refit_mse": 3.6359454473000597e-06, "relative_mse_reduction": 0.49390598089452475, "groups_improved": 25600, "groups_equal": 0, "groups_worse": 0, "maximum_group_excess": -1.317384885624051e-07, "baseline_max_abs_error": 0.00927734375, "refit_max_abs_error": 0.010009765625, "tensor_sha256": ["8f29eafbe9cd56a9842f18846618120817474d6582fded161ff2e83241d4296c", "b06209bf4e0155fc8c4fa7fcd80bec71f253b8eec2ec182555c776ba7382dfb8", "ea1759f506e3a922ffb28e1b3d979a6cfbd6cd3cd8aba1e76cc82d4f379f0a85"], "batch_split_equal": false, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.04591895797057077}
{"label": "layer-47-expert-0-gate_proj", "values": 1638400, "groups": 25600, "baseline_mse": 1.4104598788549083e-05, "refit_mse": 7.166121733916953e-06, "relative_mse_reduction": 0.4919301256739881, "groups_improved": 25599, "groups_equal": 1, "groups_worse": 0, "maximum_group_excess": 0.0, "baseline_max_abs_error": 0.041015625, "refit_max_abs_error": 0.0400390625, "tensor_sha256": ["6e561d1f19b4fab94b7cb64e42ed2427ef314bb0eafecc6091d3969648e96ea2", "e6c1a34175c521aa52a9b5efce047c95510284da0213592ada014f9094329f17", "13f63cb37ba293234019109d52ad2e4ce35ae9bd502a165248078786f56d6c57"], "batch_split_equal": false, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.04594970803009346}
{"label": "layer-47-expert-0-up_proj", "values": 1638400, "groups": 25600, "baseline_mse": 1.2158378524702584e-05, "refit_mse": 6.171995875376979e-06, "relative_mse_reduction": 0.4923668593770848, "groups_improved": 25600, "groups_equal": 0, "groups_worse": 0, "maximum_group_excess": -9.266659617424011e-08, "baseline_max_abs_error": 0.031005859375, "refit_max_abs_error": 0.0361328125, "tensor_sha256": ["3f0c3559e88a685311e6b763e0b43366479c50dcefb01de127dbb3dedd6f40e1", "6cccb4e2c00e07de355728d3977fef8985d16727da87f46b0d1047f492321cea", "38dc9675f9436bf7c3887d31fe801710645a8cd2ce9b3a664dd5d37b1c09f27c"], "batch_split_equal": false, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.04598925000755116}
{"label": "layer-47-expert-0-down_proj", "values": 1638400, "groups": 25600, "baseline_mse": 1.0134840508229104e-05, "refit_mse": 5.145791210949824e-06, "relative_mse_reduction": 0.4922671741334619, "groups_improved": 25600, "groups_equal": 0, "groups_worse": 0, "maximum_group_excess": -8.862116374075413e-09, "baseline_max_abs_error": 0.018798828125, "refit_max_abs_error": 0.018798828125, "tensor_sha256": ["6c898282d33463de4192487ccea2f957479e466c0d4da527947069a15a761600", "08f1d2bfee0ecb6ac8d99655084824a8569033240cfb9f3a08003f73538dad77", "be0484954fc7e181eabca3f47c2654a7df019400472e94f78b6840b1f84a56d3"], "batch_split_equal": false, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.04523395805153996}
{"label": "layer-47-expert-511-gate_proj", "values": 1638400, "groups": 25600, "baseline_mse": 9.497037216306126e-06, "refit_mse": 4.809541200074818e-06, "relative_mse_reduction": 0.4935745653584487, "groups_improved": 25600, "groups_equal": 0, "groups_worse": 0, "maximum_group_excess": -1.0599615052342415e-07, "baseline_max_abs_error": 0.02392578125, "refit_max_abs_error": 0.024658203125, "tensor_sha256": ["b0d2ba1f98740492125629472800a4807d7fcab5924ddc5e296d0d3ffbef3fac", "5cb532331336ab7cc5dd1226fc573f812fce08a828d52e60a28d9067f2b75ced", "dbcb747697e0c09c25dda516b92f51e6dc6e98cfad5f7ed9315d5fa07b49225e"], "batch_split_equal": false, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.046088291972409934}
{"label": "layer-47-expert-511-up_proj", "values": 1638400, "groups": 25600, "baseline_mse": 1.1411495034820973e-05, "refit_mse": 5.789310405788229e-06, "relative_mse_reduction": 0.49267730581113534, "groups_improved": 25600, "groups_equal": 0, "groups_worse": 0, "maximum_group_excess": -2.646702341735363e-07, "baseline_max_abs_error": 0.0145263671875, "refit_max_abs_error": 0.01611328125, "tensor_sha256": ["1d856906986abbc1f1ff006ffc7754c4f59a02bec3076287192e10472812f63d", "ebc65338ac5c426a3681779b1fb81778fc54b45bcb2742c57c77eb726d7d7a52", "84cd67a594c7b5575cb3411e2c4a169b8468d18ab3f5af0417f7091f25547fbd"], "batch_split_equal": false, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.04629249998833984}
{"label": "layer-47-expert-511-down_proj", "values": 1638400, "groups": 25600, "baseline_mse": 1.1341660517985019e-05, "refit_mse": 5.737034545916231e-06, "relative_mse_reduction": 0.4941627342117375, "groups_improved": 25600, "groups_equal": 0, "groups_worse": 0, "maximum_group_excess": -1.0384246706962585e-07, "baseline_max_abs_error": 0.011474609375, "refit_max_abs_error": 0.012939453125, "tensor_sha256": ["0a43eba2ee6ccae1ca12495bb06c5339a511acd4558af629b6e6900bfa34cf5a", "fa61c18c1add8b05163f3efeab9b85e9fe92b0802e160f421608ecccb44648d6", "ee6ee6f27740ce54219771fbd466094a365981ba79f35a8d71aee60eedc50689"], "batch_split_equal": false, "packed_codes_equal": true, "serialization_equal": true, "seconds": 0.04659037501551211}
{"complete": true, "cases": 20, "seconds": 14.261859124992043}
````

### .build/quantization-research/affine-refit-component-v1/receipt.json

Original bytes: 22942. SHA-256: `a7e650d81a0dc384157bd9729dbf3541054817cd315027764e6737dde8994f70`.

Normalized bytes: 22942. SHA-256: `a7e650d81a0dc384157bd9729dbf3541054817cd315027764e6737dde8994f70`.

````text
{
  "complete": true,
  "qualification": false,
  "policy": "affine4-parent-affine3-bf16-refit-component-v1",
  "cases": [
    {
      "label": "synthetic-640x2560",
      "values": 3276800,
      "groups": 51200,
      "baseline_mse": 0.03183347983547719,
      "refit_mse": 0.014939066163788085,
      "relative_mse_reduction": 0.5307121231798521,
      "groups_improved": 51200,
      "groups_equal": 0,
      "groups_worse": 0,
      "maximum_group_excess": -0.013569772243499756,
      "baseline_max_abs_error": 0.25,
      "refit_max_abs_error": 0.15625,
      "tensor_sha256": [
        "d8bde923982f559da714e8d1b14d94fa178921c04e415d38daaecbff552d15e9",
        "ab46c2ce965dd13943f3559c6aa5524ddb1ba6125151ed29b43cce5cd45244f5",
        "b445d2b259ab14ff43a602a5df8fa004284e6d1cacd389cf86e8ca12e85f77ad"
      ],
      "batch_split_equal": true,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.24211616697721183
    },
    {
      "label": "synthetic-2560x640",
      "values": 3276800,
      "groups": 51200,
      "baseline_mse": 0.03183347983547719,
      "refit_mse": 0.014939066163788085,
      "relative_mse_reduction": 0.5307121231798521,
      "groups_improved": 51200,
      "groups_equal": 0,
      "groups_worse": 0,
      "maximum_group_excess": -0.013569772243499756,
      "baseline_max_abs_error": 0.25,
      "refit_max_abs_error": 0.15625,
      "tensor_sha256": [
        "d8bde923982f559da714e8d1b14d94fa178921c04e415d38daaecbff552d15e9",
        "ab46c2ce965dd13943f3559c6aa5524ddb1ba6125151ed29b43cce5cd45244f5",
        "b445d2b259ab14ff43a602a5df8fa004284e6d1cacd389cf86e8ca12e85f77ad"
      ],
      "batch_split_equal": true,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.15826162497978657
    },
    {
      "label": "layer-0-expert-0-gate_proj",
      "values": 1638400,
      "groups": 25600,
      "baseline_mse": 9.733164851013499e-06,
      "refit_mse": 4.938921345569725e-06,
      "relative_mse_reduction": 0.492567790521349,
      "groups_improved": 25600,
      "groups_equal": 0,
      "groups_worse": 0,
      "maximum_group_excess": -2.56288331001997e-07,
      "baseline_max_abs_error": 0.015625,
      "refit_max_abs_error": 0.021484375,
      "tensor_sha256": [
        "dad55bab210d5d8ec7282957b40aac7508374057261169e91c4f8462a2e7ed9d",
        "ad1b9a2c018ec0070af3e5767477c2facc5f584bc9fa3cacc251487c109663f7",
        "fb45abfe9b1e48b2a79855e614a2fa54e19c83e28707a26541ec039d1c7a48fd"
      ],
      "batch_split_equal": false,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.06326641701161861
    },
    {
      "label": "layer-0-expert-0-up_proj",
      "values": 1638400,
      "groups": 25600,
      "baseline_mse": 9.184895808687089e-06,
      "refit_mse": 4.66176425931053e-06,
      "relative_mse_reduction": 0.4924532235954787,
      "groups_improved": 25600,
      "groups_equal": 0,
      "groups_worse": 0,
      "maximum_group_excess": -1.6816193237900734e-07,
      "baseline_max_abs_error": 0.012451171875,
      "refit_max_abs_error": 0.01806640625,
      "tensor_sha256": [
        "ffee929752a34324d9efd59b5804519e52d725a671bcb3d75c4fed5ce8168f91",
        "e405e05b20ec050b30e3346b85136941dff7fbf1e256e1d7bb7b2ffe3f058a5f",
        "f4dfbc17cf6799f03c6a30cb97434f3ab6c8591ac46ade4f06c475b184e6c436"
      ],
      "batch_split_equal": false,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.045979458023793995
    },
    {
      "label": "layer-0-expert-0-down_proj",
      "values": 1638400,
      "groups": 25600,
      "baseline_mse": 7.691919520098623e-06,
      "refit_mse": 3.895098967134913e-06,
      "relative_mse_reduction": 0.4936115807039837,
      "groups_improved": 25600,
      "groups_equal": 0,
      "groups_worse": 0,
      "maximum_group_excess": -3.795139491558075e-08,
      "baseline_max_abs_error": 0.016845703125,
      "refit_max_abs_error": 0.0166015625,
      "tensor_sha256": [
        "6d8d397d92f761bf62d44bb03e5c706b7dc7eaf0be1d0d23ac5661996d3d40f1",
        "ef8274294530d659d339ee5f6fe6c6fed031be81d40211bdca5593e1c496e5ba",
        "51b1f92690b9089bf5d8ef84700d93094fe61cbebfb18e8f40fa6cde078b0e18"
      ],
      "batch_split_equal": false,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.0465383340488188
    },
    {
      "label": "layer-0-expert-511-gate_proj",
      "values": 1638400,
      "groups": 25600,
      "baseline_mse": 7.416310439936069e-06,
      "refit_mse": 3.7665056539992748e-06,
      "relative_mse_reduction": 0.4921321478511702,
      "groups_improved": 25600,
      "groups_equal": 0,
      "groups_worse": 0,
      "maximum_group_excess": -1.380685716867447e-07,
      "baseline_max_abs_error": 0.0101318359375,
      "refit_max_abs_error": 0.0113525390625,
      "tensor_sha256": [
        "cba3fc2b25a271bbba75d856f2c74e3f31515c7c4e6c3fdb7feab5a64c161072",
        "b954ccc4ab2af41ce4b0d471e2e54b2f14ff3d723091ec6c11119c60e0cdb7d3",
        "3ed0ddd9c87f827074017f701ff732f23e6d49107a1c046a62f364ebfa9668ad"
      ],
      "batch_split_equal": false,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.04619633301626891
    },
    {
      "label": "layer-0-expert-511-up_proj",
      "values": 1638400,
      "groups": 25600,
      "baseline_mse": 7.326870240689231e-06,
      "refit_mse": 3.7120776453036796e-06,
      "relative_mse_reduction": 0.49336107732754275,
      "groups_improved": 25600,
      "groups_equal": 0,
      "groups_worse": 0,
      "maximum_group_excess": -2.6775524020195007e-07,
      "baseline_max_abs_error": 0.0107421875,
      "refit_max_abs_error": 0.0118408203125,
      "tensor_sha256": [
        "7e172d05454732e5215bd756f8e8f37742961cba07bd6d78dad21c2b740e6fe5",
        "2f0a17ae274d8c7287976d16bd49b1ef745fd9025976140fe898f8fd5ad2af77",
        "47d6f40efa2b91595d81c25efcba4be70c2d695d2f881f175dcd5f264282c0ca"
      ],
      "batch_split_equal": false,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.045917667041067034
    },
    {
      "label": "layer-0-expert-511-down_proj",
      "values": 1638400,
      "groups": 25600,
      "baseline_mse": 6.135317429105669e-06,
      "refit_mse": 3.1032330744196202e-06,
      "relative_mse_reduction": 0.4942017083422575,
      "groups_improved": 25600,
      "groups_equal": 0,
      "groups_worse": 0,
      "maximum_group_excess": -6.874324753880501e-08,
      "baseline_max_abs_error": 0.009521484375,
      "refit_max_abs_error": 0.0087890625,
      "tensor_sha256": [
        "d6a5bedf2d9688ea5f2653fcee028c5c87cf6eb7b3ec606f3b38a9793047e4b0",
        "057e7ba73ea9a750b6d5b996afba6af4debcf43596835a5a387876bfa9b3c6dc",
        "3d12c031b3f86ce5d949bce9d11a677d48006e3cbaf4a4570c8213bf07823d0d"
      ],
      "batch_split_equal": false,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.04583866603206843
    },
    {
      "label": "layer-23-expert-0-gate_proj",
      "values": 1638400,
      "groups": 25600,
      "baseline_mse": 7.602844604690517e-06,
      "refit_mse": 3.8549642398777454e-06,
      "relative_mse_reduction": 0.492957644103438,
      "groups_improved": 25600,
      "groups_equal": 0,
      "groups_worse": 0,
      "maximum_group_excess": -4.6522472985088825e-08,
      "baseline_max_abs_error": 0.0107421875,
      "refit_max_abs_error": 0.010498046875,
      "tensor_sha256": [
        "0d3a9cedbb516e7b399a39c560aa65ce1693f328d28e4f52ffeb7bd017eb7143",
        "9b29e0c754f5ec188d7e07cf65aae7764a2e30076e268746c50935d520d58687",
        "a8f77b9fd4c2b2ff6cace53746eb18344ccdae980cfeae35ca26f63f7e3809c2"
      ],
      "batch_split_equal": false,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.045853541989345104
    },
    {
      "label": "layer-23-expert-0-up_proj",
      "values": 1638400,
      "groups": 25600,
      "baseline_mse": 7.63123384317055e-06,
      "refit_mse": 3.865969861607255e-06,
      "relative_mse_reduction": 0.49340173017145283,
      "groups_improved": 25600,
      "groups_equal": 0,
      "groups_worse": 0,
      "maximum_group_excess": -1.152366166934371e-07,
      "baseline_max_abs_error": 0.0086669921875,
      "refit_max_abs_error": 0.01123046875,
      "tensor_sha256": [
        "1ea7cdfc3276e89cdd1d5ef7724b5bb3016d6a07610bf9f570e995f4b418fb1a",
        "899a8de0df24d015b33af05c42f571d1f9633590653d8744e85b90cf4fdd25dc",
        "a8514c76d771b25655a10685b0ef727a4bcf1aed8050ca04ea0b578d1741ed08"
      ],
      "batch_split_equal": false,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.045802832988556474
    },
    {
      "label": "layer-23-expert-0-down_proj",
      "values": 1638400,
      "groups": 25600,
      "baseline_mse": 7.24735879742866e-06,
      "refit_mse": 3.6642309007106635e-06,
      "relative_mse_reduction": 0.49440465097288677,
      "groups_improved": 25600,
      "groups_equal": 0,
      "groups_worse": 0,
      "maximum_group_excess": -2.1979212760925293e-07,
      "baseline_max_abs_error": 0.009521484375,
      "refit_max_abs_error": 0.010498046875,
      "tensor_sha256": [
        "e0aee162df977e8899a262cfb2775c373dfa1eb0f61cbb836634023f61ef99e0",
        "77c0b4a010005b8071134c0dd953f991e610e3e9ba26e16df3e68c17c95ba259",
        "808151dcbf90e908c2aa0d5cefa14814e2fc60791fa1eee7a22b9706324a3060"
      ],
      "batch_split_equal": false,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.046187666011974216
    },
    {
      "label": "layer-23-expert-511-gate_proj",
      "values": 1638400,
      "groups": 25600,
      "baseline_mse": 7.520658639634803e-06,
      "refit_mse": 3.8141912520472944e-06,
      "relative_mse_reduction": 0.49283813628423,
      "groups_improved": 25600,
      "groups_equal": 0,
      "groups_worse": 0,
      "maximum_group_excess": -2.558808773756027e-07,
      "baseline_max_abs_error": 0.0086669921875,
      "refit_max_abs_error": 0.0101318359375,
      "tensor_sha256": [
        "b7fb8b3778ddb07478f9e32d4783701e4850d465078a2e72cfcef9f1193df6da",
        "77e0a6089f41697bc2f77e190f602f0b2ef4eba38eb1663696952680d0e4ac5e",
        "8c94e3a734f6d80e3055243709d72ced8b63f37cf8d1ab20eef31a1a16de736b"
      ],
      "batch_split_equal": false,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.04642308299662545
    },
    {
      "label": "layer-23-expert-511-up_proj",
      "values": 1638400,
      "groups": 25600,
      "baseline_mse": 7.450842683738302e-06,
      "refit_mse": 3.781142881393862e-06,
      "relative_mse_reduction": 0.4925214446352054,
      "groups_improved": 25600,
      "groups_equal": 0,
      "groups_worse": 0,
      "maximum_group_excess": -8.815550245344639e-08,
      "baseline_max_abs_error": 0.009765625,
      "refit_max_abs_error": 0.00927734375,
      "tensor_sha256": [
        "32516ef9e1d0a013d579487f735d5d696632cfdabe2f9fdfedc8a5a8bbe94ea4",
        "c1a8e547e980d2e0b4f2ba1e210a127947468b522411b184c4599afda9657bb0",
        "807d5edf1a30d1eb3788256e511d5c4acb3ee734ccd582ab61327536bd723506"
      ],
      "batch_split_equal": false,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.04662854102207348
    },
    {
      "label": "layer-23-expert-511-down_proj",
      "values": 1638400,
      "groups": 25600,
      "baseline_mse": 7.184328030049869e-06,
      "refit_mse": 3.6359454473000597e-06,
      "relative_mse_reduction": 0.49390598089452475,
      "groups_improved": 25600,
      "groups_equal": 0,
      "groups_worse": 0,
      "maximum_group_excess": -1.317384885624051e-07,
      "baseline_max_abs_error": 0.00927734375,
      "refit_max_abs_error": 0.010009765625,
      "tensor_sha256": [
        "8f29eafbe9cd56a9842f18846618120817474d6582fded161ff2e83241d4296c",
        "b06209bf4e0155fc8c4fa7fcd80bec71f253b8eec2ec182555c776ba7382dfb8",
        "ea1759f506e3a922ffb28e1b3d979a6cfbd6cd3cd8aba1e76cc82d4f379f0a85"
      ],
      "batch_split_equal": false,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.04591895797057077
    },
    {
      "label": "layer-47-expert-0-gate_proj",
      "values": 1638400,
      "groups": 25600,
      "baseline_mse": 1.4104598788549083e-05,
      "refit_mse": 7.166121733916953e-06,
      "relative_mse_reduction": 0.4919301256739881,
      "groups_improved": 25599,
      "groups_equal": 1,
      "groups_worse": 0,
      "maximum_group_excess": 0.0,
      "baseline_max_abs_error": 0.041015625,
      "refit_max_abs_error": 0.0400390625,
      "tensor_sha256": [
        "6e561d1f19b4fab94b7cb64e42ed2427ef314bb0eafecc6091d3969648e96ea2",
        "e6c1a34175c521aa52a9b5efce047c95510284da0213592ada014f9094329f17",
        "13f63cb37ba293234019109d52ad2e4ce35ae9bd502a165248078786f56d6c57"
      ],
      "batch_split_equal": false,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.04594970803009346
    },
    {
      "label": "layer-47-expert-0-up_proj",
      "values": 1638400,
      "groups": 25600,
      "baseline_mse": 1.2158378524702584e-05,
      "refit_mse": 6.171995875376979e-06,
      "relative_mse_reduction": 0.4923668593770848,
      "groups_improved": 25600,
      "groups_equal": 0,
      "groups_worse": 0,
      "maximum_group_excess": -9.266659617424011e-08,
      "baseline_max_abs_error": 0.031005859375,
      "refit_max_abs_error": 0.0361328125,
      "tensor_sha256": [
        "3f0c3559e88a685311e6b763e0b43366479c50dcefb01de127dbb3dedd6f40e1",
        "6cccb4e2c00e07de355728d3977fef8985d16727da87f46b0d1047f492321cea",
        "38dc9675f9436bf7c3887d31fe801710645a8cd2ce9b3a664dd5d37b1c09f27c"
      ],
      "batch_split_equal": false,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.04598925000755116
    },
    {
      "label": "layer-47-expert-0-down_proj",
      "values": 1638400,
      "groups": 25600,
      "baseline_mse": 1.0134840508229104e-05,
      "refit_mse": 5.145791210949824e-06,
      "relative_mse_reduction": 0.4922671741334619,
      "groups_improved": 25600,
      "groups_equal": 0,
      "groups_worse": 0,
      "maximum_group_excess": -8.862116374075413e-09,
      "baseline_max_abs_error": 0.018798828125,
      "refit_max_abs_error": 0.018798828125,
      "tensor_sha256": [
        "6c898282d33463de4192487ccea2f957479e466c0d4da527947069a15a761600",
        "08f1d2bfee0ecb6ac8d99655084824a8569033240cfb9f3a08003f73538dad77",
        "be0484954fc7e181eabca3f47c2654a7df019400472e94f78b6840b1f84a56d3"
      ],
      "batch_split_equal": false,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.04523395805153996
    },
    {
      "label": "layer-47-expert-511-gate_proj",
      "values": 1638400,
      "groups": 25600,
      "baseline_mse": 9.497037216306126e-06,
      "refit_mse": 4.809541200074818e-06,
      "relative_mse_reduction": 0.4935745653584487,
      "groups_improved": 25600,
      "groups_equal": 0,
      "groups_worse": 0,
      "maximum_group_excess": -1.0599615052342415e-07,
      "baseline_max_abs_error": 0.02392578125,
      "refit_max_abs_error": 0.024658203125,
      "tensor_sha256": [
        "b0d2ba1f98740492125629472800a4807d7fcab5924ddc5e296d0d3ffbef3fac",
        "5cb532331336ab7cc5dd1226fc573f812fce08a828d52e60a28d9067f2b75ced",
        "dbcb747697e0c09c25dda516b92f51e6dc6e98cfad5f7ed9315d5fa07b49225e"
      ],
      "batch_split_equal": false,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.046088291972409934
    },
    {
      "label": "layer-47-expert-511-up_proj",
      "values": 1638400,
      "groups": 25600,
      "baseline_mse": 1.1411495034820973e-05,
      "refit_mse": 5.789310405788229e-06,
      "relative_mse_reduction": 0.49267730581113534,
      "groups_improved": 25600,
      "groups_equal": 0,
      "groups_worse": 0,
      "maximum_group_excess": -2.646702341735363e-07,
      "baseline_max_abs_error": 0.0145263671875,
      "refit_max_abs_error": 0.01611328125,
      "tensor_sha256": [
        "1d856906986abbc1f1ff006ffc7754c4f59a02bec3076287192e10472812f63d",
        "ebc65338ac5c426a3681779b1fb81778fc54b45bcb2742c57c77eb726d7d7a52",
        "84cd67a594c7b5575cb3411e2c4a169b8468d18ab3f5af0417f7091f25547fbd"
      ],
      "batch_split_equal": false,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.04629249998833984
    },
    {
      "label": "layer-47-expert-511-down_proj",
      "values": 1638400,
      "groups": 25600,
      "baseline_mse": 1.1341660517985019e-05,
      "refit_mse": 5.737034545916231e-06,
      "relative_mse_reduction": 0.4941627342117375,
      "groups_improved": 25600,
      "groups_equal": 0,
      "groups_worse": 0,
      "maximum_group_excess": -1.0384246706962585e-07,
      "baseline_max_abs_error": 0.011474609375,
      "refit_max_abs_error": 0.012939453125,
      "tensor_sha256": [
        "0a43eba2ee6ccae1ca12495bb06c5339a511acd4558af629b6e6900bfa34cf5a",
        "fa61c18c1add8b05163f3efeab9b85e9fe92b0802e160f421608ecccb44648d6",
        "ee6ee6f27740ce54219771fbd466094a365981ba79f35a8d71aee60eedc50689"
      ],
      "batch_split_equal": false,
      "packed_codes_equal": true,
      "serialization_equal": true,
      "seconds": 0.04659037501551211
    }
  ],
  "budget_sha256": "7606c3c94f0c59ab1ff55459a83f52ed7c4bb6619b20eb3bcef34f06c3dbfd4d",
  "producer_sha256": "8a0dec39e35942e44245babfa8fcfaf8dc548803e87b7ad054da502ebb2d995e",
  "implementation_sha256": "747303b670c7ce0ebe04893758b8a5bb95f7a881451b16bbc02f69b842823332",
  "model_runs": 0,
  "weight_bytes_written": 0,
  "source_files": [
    {
      "name": "model-00001.safetensors",
      "path": "model-00001.safetensors",
      "size": 10039592993,
      "sha256": "206c2e6ee138c902115f0686a43e0d56097518945bbcd6d3ab10bf916278f86c",
      "optional": false
    },
    {
      "name": "model-00006.safetensors",
      "path": "model-00006.safetensors",
      "size": 10262727991,
      "sha256": "9231085f2723a8a3e26fc00836a789400527320ef8a6e219df6974ea4f8eee95",
      "optional": false
    },
    {
      "name": "model-00010.safetensors",
      "path": "model-00010.safetensors",
      "size": 10237786674,
      "sha256": "115466ffb3e92a8e2a338d72395f7c32a176dadc791d2049ff9a8daadb347ed7",
      "optional": false
    }
  ],
  "peak_process_bytes": 434455344,
  "allocated_staging_before": 369438228480,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 37723422720,
    "swapins": 440,
    "swapouts": 3020,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   552765.\nPages active:                                 343303.\nPages inactive:                              1603367.\nPages speculative:                              6394.\nPages throttled:                                   0.\nPages wired down:                             176792.\nPages purgeable:                                2471.\n\"Translation faults\":                     3049635409.\nPages copy-on-write:                       190513783.\nPages zero filled:                        8427138858.\nPages reactivated:                         379318495.\nPages purged:                               14357730.\nFile-backed pages:                           1747219.\nAnonymous pages:                              205845.\nPages stored in compressor:                   855280.\nPages occupied by compressor:                 402033.\nDecompressions:                            125110046.\nCompressions:                              141789742.\nPageins:                                  3851062737.\nPageouts:                                     600080.\nSwapins:                                         440.\nSwapouts:                                       3020.\nPages tagged:                                 126302.\nPages tagged resident:                         85771.\nPages tagged compressed:                       40531.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5260.\nPages tag-storage free:                         1014.\nPages tag-storage non-tag pageable:            92022.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6442112.\nTagged compressions:                         1101666.\nTagged decompressions:                        959599.\n"
  },
  "mlx_version": "0.32.2",
  "numpy_version": "2.5.2",
  "packing": {
    "independent_byte_equal": true,
    "mlx_decode_equal": true,
    "first_octet_group_hex": "88c6fa",
    "checked_codes": 16384
  },
  "seconds": 14.261859124992043,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 37208539136,
    "swapins": 440,
    "swapouts": 3020,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     4911.\nPages active:                                 313009.\nPages inactive:                              2194935.\nPages speculative:                               330.\nPages throttled:                                   0.\nPages wired down:                             184545.\nPages purgeable:                                2499.\n\"Translation faults\":                     3049784371.\nPages copy-on-write:                       190519331.\nPages zero filled:                        8427353078.\nPages reactivated:                         379318495.\nPages purged:                               14357771.\nFile-backed pages:                           2263619.\nAnonymous pages:                              244655.\nPages stored in compressor:                   831813.\nPages occupied by compressor:                 386118.\nDecompressions:                            125133507.\nCompressions:                              141789742.\nPageins:                                  3852993861.\nPageouts:                                     600176.\nSwapins:                                         440.\nSwapouts:                                       3020.\nPages tagged:                                 126892.\nPages tagged resident:                         86363.\nPages tagged compressed:                       40529.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 5260.\nPages tag-storage free:                         1438.\nPages tag-storage non-tag pageable:            91598.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6441536.\nTagged compressions:                         1101666.\nTagged decompressions:                        959601.\n"
  }
}
````
