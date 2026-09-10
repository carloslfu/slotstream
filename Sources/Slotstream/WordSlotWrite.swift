import MLX

/// Copy two adjacent BF16 values as one unchanged UInt32 word. The pinned
/// Metal backend implements BF16 indexed stores with packed-word CAS, whereas
/// UInt32 stores use native atomic stores. No floating-point arithmetic runs.
/// Callers must supply unique destination rows, as SlotPool reservations do.
package enum WordSlotWrite {
    package static func eligible(_ destination: MLXArray, _ source: MLXArray) -> Bool {
        destination.dtype == .bfloat16 && source.dtype == .bfloat16
            && destination.ndim >= 2 && source.ndim == destination.ndim
            && Array(destination.shape.dropFirst()) == Array(source.shape.dropFirst())
            && destination.dim(0) > 0 && source.dim(0) > 0
            && (destination.size / destination.dim(0)).isMultiple(of: 2)
    }

    package static func apply(to destination: MLXArray, from source: MLXArray, at indices: MLXArray) -> MLXArray {
        guard eligible(destination, source) else {
            destination[indices] = source
            return destination
        }
        let shape = destination.shape
        let words = destination.reshaped([destination.dim(0), -1]).view(dtype: .uint32)
        words[indices] = source.reshaped([source.dim(0), -1]).view(dtype: .uint32)
        return words.view(dtype: .bfloat16).reshaped(shape)
    }
}
