import MLX

/// Experimental shared-memory update using MLX's own CPU primitive. The graph
/// owns all inputs and cross-stream dependencies; there are no raw writes or
/// manual assumptions that an evaluated array has no surviving GPU reader.
/// A fresh Swift context preserves external aliases and permits donation only
/// when MLX proves exclusive storage ownership at evaluation.
package enum CPUSlotWrite {
    package static func apply(to destination: MLXArray, from source: MLXArray,
                              slots: [Int32]) throws -> MLXArray {
        guard destination.ndim >= 2, source.ndim == destination.ndim,
            destination.dtype == source.dtype,
            Array(destination.shape.dropFirst()) == Array(source.shape.dropFirst()),
            !slots.isEmpty, slots.count <= 32, source.dim(0) == slots.count,
            Set(slots).count == slots.count,
            slots.allSatisfy({ $0 >= 0 && Int($0) < destination.dim(0) }) else {
            throw ModelError("invalid CPU slot update geometry or destination rows")
        }
        let result = destination.reshaped(destination.shape, stream: .cpu)
        // The pinned generic CPU scatter visits each element individually.
        // Every validated batch has at most 32 runs; use the contiguous copy
        // primitive even when CLOCK returns many disjoint destination rows.
        // Donation and cross-stream dependencies still belong to MLX.
        guard let runs = SlotWriteRun.plan(slots, capacity: destination.dim(0), maximumRuns: 32) else {
            throw ModelError("invalid CPU slot copy plan")
        }
        for run in runs {
            result[run.destination, stream: .cpu] = source[run.source, stream: .cpu]
        }
        return result
    }
}
