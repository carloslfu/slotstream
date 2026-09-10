import MLX

/// One allocation per quantized tensor, with the original projections retained
/// as row views. The payload is shared, not an additional resident weight copy.
package struct PackedProjectionPair {
    package let combined: QLinear
    package let first: QLinear
    package let second: QLinear
    package let split: Int
    package var payloadBytes: Int {
        combined.w.nbytes + (combined.scales?.nbytes ?? 0) + (combined.biases?.nbytes ?? 0)
    }

    package init?(_ a: QLinear, _ b: QLinear) {
        guard a.bits == 4, b.bits == a.bits, a.groupSize > 0, b.groupSize == a.groupSize,
              a.w.ndim == 2, b.w.ndim == 2, a.w.dtype == .uint32, b.w.dtype == a.w.dtype,
              a.w.dim(0) > 0, b.w.dim(0) > 0, a.w.dim(1) > 0, b.w.dim(1) == a.w.dim(1),
              let sa = a.scales, let sb = b.scales, let ba = a.biases, let bb = b.biases,
              sa.ndim == 2, sb.ndim == 2, ba.ndim == 2, bb.ndim == 2,
              sa.dtype == sb.dtype, ba.dtype == sa.dtype, bb.dtype == sa.dtype else { return nil }
        let width = a.w.dim(1).multipliedReportingOverflow(by: 8)
        guard !width.overflow, width.partialValue % a.groupSize == 0 else { return nil }
        let groups = width.partialValue / a.groupSize
        guard sa.shape == [a.w.dim(0), groups], ba.shape == sa.shape,
              sb.shape == [b.w.dim(0), groups], bb.shape == sb.shape else { return nil }
        let weight = concatenated([a.w, b.w], axis: 0)
        let scales = concatenated([sa, sb], axis: 0)
        let biases = concatenated([ba, bb], axis: 0)
        // Evaluate one layer at a time before replacing its dictionary entries.
        // This releases its old backing instead of retaining all old + new layers.
        eval(weight, scales, biases)
        split = a.w.dim(0)
        combined = QLinear(w: weight, scales: scales, biases: biases,
            groupSize: a.groupSize, bits: a.bits)
        first = QLinear(w: weight[0..<split, 0...], scales: scales[0..<split, 0...],
            biases: biases[0..<split, 0...], groupSize: a.groupSize, bits: a.bits)
        second = QLinear(w: weight[split..., 0...], scales: scales[split..., 0...],
            biases: biases[split..., 0...], groupSize: b.groupSize, bits: b.bits)
        eval(first.w, first.scales!, first.biases!, second.w, second.scales!, second.biases!)
    }

    package func supportsOneToken(_ x: MLXArray) -> Bool {
        x.ndim == 3 && x.dim(0) == 1 && x.dim(1) == 1 && x.dtype == .bfloat16
            && x.dim(2) == combined.w.dim(1) * 8
    }

    package func callAsFunction(_ x: MLXArray) -> (MLXArray, MLXArray) {
        let y = combined(x)
        return (y[.ellipsis, 0..<split], y[.ellipsis, split...])
    }
}
