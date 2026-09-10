import MLX

/// Shape-controlled prototype using the pinned backend's established kernels.
/// No new shader or changed projection/rotary arithmetic is introduced.
package enum VisionAttention {
    package static func apply(queries q: MLXArray, keys k: MLXArray, values v: MLXArray,
                              padding: Int = 0, preserveQueryRounding: Bool = false,
                              queryTile: Int = 0, onQueryTile: (() -> Void)? = nil) -> MLXArray {
        checkpointCompatibility {
            try applyChecked(queries: q, keys: k, values: v, padding: padding,
                preserveQueryRounding: preserveQueryRounding, queryTile: queryTile, onQueryTile: onQueryTile)
        }
    }

    package static func applyChecked(queries q: MLXArray, keys k: MLXArray, values v: MLXArray,
                              padding: Int = 0, preserveQueryRounding: Bool = false,
                              queryTile: Int = 0, onQueryTile: (() -> Void)? = nil, request: RequestController? = nil) throws -> MLXArray {
        let width = q.dim(-1)
        let scale = 1 / Float(width).squareRoot()
        precondition(queryTile == 0 || (queryTile == 256 && padding == 0 && !preserveQueryRounding),
            "vision query tiling must use the independent 256-row original-attention candidate")
        if queryTile == 256, width == 72, q.ndim == 4, q.dim(2) > queryTile {
            var pieces: [MLXArray] = []
            for start in stride(from: 0, to: q.dim(2), by: queryTile) {
                try request?.check(phase: "vision query tile")
                let queries = q[0..., 0..., start..<min(start + queryTile, q.dim(2)), 0...]
                let output = MLXFast.scaledDotProductAttention(queries: queries,
                    keys: k, values: v, scale: scale, mask: .none)
                // Materialize each query tile before constructing the next.
                // Only completed output rows survive; N-by-N scores cannot
                // accumulate across the lazy graphs for separate tiles.
                eval(output)
                onQueryTile?()
                pieces.append(output)
            }
            return concatenated(pieces, axis: 2)
        }
        guard width == 72, [80, 128].contains(padding),
              q.ndim == 4, k.ndim == 4, v.ndim == 4,
              k.dim(-1) == width, v.dim(-1) == width else {
            return MLXFast.scaledDotProductAttention(queries: q, keys: k, values: v, scale: scale, mask: .none)
        }
        func padded(_ x: MLXArray) -> MLXArray {
            var shape = x.shape; shape[shape.count - 1] = padding - width
            return concatenated([x, MLXArray.zeros(shape, dtype: x.dtype)], axis: -1)
        }
        // Padding adds zero dot-product terms. Scale stays tied to the actual
        // 72 dimensions, and the value output is cropped back to those rows.
        // The pinned fallback rounds BOTH the scale constant and the scaled
        // query to the input dtype before QK. This independent successor keeps
        // that boundary while using a unit-scale fused kernel. Score/softmax
        // rounding can still differ and requires full-tower numerical gates.
        let query = preserveQueryRounding ? q * MLXArray(scale).asType(q.dtype) : q
        let output = MLXFast.scaledDotProductAttention(queries: padded(query), keys: padded(k),
            values: padded(v), scale: preserveQueryRounding ? 1 : scale, mask: .none)
        return output[0..., 0..., 0..., 0 ..< width]
    }
}
