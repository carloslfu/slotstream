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
