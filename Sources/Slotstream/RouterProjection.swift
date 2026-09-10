import MLX

/// The pinned matmul promotes a BF16 weight when activations are FP32. Keep
/// that exact promoted tensor only for the explicit cache experiment. The
/// original remains owned by the checkpoint/resident set and is still charged.
package final class RouterProjection {
    package var minimumRows = 0
    private let original: MLXArray
    private var promoted: MLXArray?
    private var enabled = false
    package private(set) var materializations = 0
    package var cachedBytes: Int { promoted?.nbytes ?? 0 }

    package init(_ weight: MLXArray) { original = weight }

    package func configure(cached: Bool) {
        guard cached != enabled else { return }
        enabled = cached
        if cached, original.dtype != .float32 {
            let value = original.asType(.float32)
            eval(value)
            promoted = value
            materializations += 1
        } else { promoted = nil }
    }

    package func callAsFunction(_ x: MLXArray) -> MLXArray {
        let rows = x.size / x.dim(-1)
        if rows > 0, rows < minimumRows {
            let flat = x.reshaped([rows, x.dim(-1)])
            let padded = concatenated([flat, broadcast(flat[(rows - 1)...], to: [minimumRows - rows, x.dim(-1)])], axis: 0)
            let output = matmul(padded.asType(.float32), (promoted ?? original).transposed())[0 ..< rows]
            return output.reshaped(Array(x.shape.dropLast()) + [original.dim(0)])
        }
        return matmul(x.asType(.float32), (promoted ?? original).transposed())
    }
}
