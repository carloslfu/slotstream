import MLX

/// CLOCK commonly reserves adjacent slots. A bounded number of slice updates
/// can use MLX's contiguous copy path instead of generic indexed scatter.
/// The source order, destination bytes and lazy dependency graph are preserved.
package struct SlotWriteRun: Equatable {
    package let source: Range<Int>
    package let destination: Range<Int>

    package static func plan(_ slots: [Int32], capacity: Int, maximumRuns: Int = 2) -> [SlotWriteRun]? {
        guard !slots.isEmpty, slots.count <= 32, capacity > 0,
              (1...32).contains(maximumRuns),
              slots.allSatisfy({ $0 >= 0 && Int($0) < capacity }),
              Set(slots).count == slots.count else { return nil }
        var result: [SlotWriteRun] = []
        var start = 0
        for end in 1 ... slots.count {
            if end < slots.count && Int(slots[end]) == Int(slots[end - 1]) + 1 { continue }
            result.append(SlotWriteRun(source: start ..< end,
                destination: Int(slots[start]) ..< (Int(slots[start]) + end - start)))
            if result.count > maximumRuns { return nil }
            start = end
        }
        return result
    }

    package static func apply(_ runs: [SlotWriteRun], to destination: MLXArray, from source: MLXArray) {
        for run in runs { destination[run.destination] = source[run.source] }
    }
}
