import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationSlotSlices(wordWrites: Bool = false) -> CheckReport {
        // Preserve the existing nonthrowing public diagnostic entry point.
        do { return try optimizationSlotWriteComponents(wordWrites: wordWrites, cpuWrites: false) }
        catch {
            var c = CheckBuilder("optimization-slot-slices")
            c.expect("component execution", false, String(describing: error))
            return c.report()
        }
    }

    public static func optimizationCPUSlotWrites() throws -> CheckReport {
        try optimizationSlotWriteComponents(wordWrites: false, cpuWrites: true)
    }

    private static func optimizationSlotWriteComponents(wordWrites: Bool, cpuWrites: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 64 << 20
        var c = CheckBuilder(cpuWrites ? "optimization-slot-cpu" : wordWrites ? "optimization-slot-words" : "optimization-slot-slices")
        if cpuWrites {
            c.expect("CPU writes remain default off", try !InferenceOptimizations.environment([:]).cpuSlotWrites)
            c.expect("CPU writes can be explicitly selected", try InferenceOptimizations.environment(["SLOTSTREAM_OPT_SLOT_CPU": "1"]).cpuSlotWrites)
            for env in [["SLOTSTREAM_OPT_SLOT_CPU": "true"],
                        ["SLOTSTREAM_OPT_SLOT_CPU": "1", "SLOTSTREAM_OPT_SLOT_WORDS": "1"],
                        ["SLOTSTREAM_OPT_SLOT_CPU": "1", "SLOTSTREAM_OPT_SLOT_SLICES": "1"]] {
                do {
                    _ = try InferenceOptimizations.environment(env)
                    c.expect("invalid CPU configuration rejected \(env)", false)
                } catch { c.expect("invalid CPU configuration rejected \(env)", true) }
            }
        }
        let patterns: [[Int32]] = [[], [0], [63], [2, 3, 4], [62, 63, 0, 1],
            [9, 10, 2, 3], [0, 2], [0, 2, 4], Array(0 ..< 32),
            (0..<32).map { Int32($0 * 2) }, (0..<32).reversed().map { Int32($0 * 2) },
            Array(0 ..< 33), [3, 3], [-1], [64], [Int32.max], [Int32.min]]
        for slots in patterns {
            let runs = SlotWriteRun.plan(slots, capacity: 64)
            let valid = !slots.isEmpty && slots.count <= 32 && Set(slots).count == slots.count
                && slots.allSatisfy { $0 >= 0 && $0 < 64 }
            let runCount = slots.enumerated().filter { $0.offset == 0 || Int($0.element) != Int(slots[$0.offset - 1]) + 1 }.count
            c.equal("plan \(slots)", runs != nil, valid && runCount <= 2)
            if let runs {
                c.equal("source coverage \(slots)", runs.flatMap { Array($0.source) }, Array(slots.indices))
                c.equal("destination order \(slots)", runs.flatMap { Array($0.destination).map(Int32.init) }, slots)
            }
            if cpuWrites {
                let cpuRuns = SlotWriteRun.plan(slots, capacity: 64, maximumRuns: 32)
                c.equal("CPU full run plan \(slots)", cpuRuns != nil, valid)
                if let cpuRuns {
                    c.equal("CPU source coverage \(slots)", cpuRuns.flatMap { Array($0.source) }, Array(slots.indices))
                    c.equal("CPU destination order \(slots)", cpuRuns.flatMap { Array($0.destination).map(Int32.init) }, slots)
                }
            }
        }
        c.expect("invalid capacity", SlotWriteRun.plan([0], capacity: 0) == nil)
        for limit in [0, 33, Int.min, Int.max] {
            c.expect("invalid run limit \(limit)", SlotWriteRun.plan([0], capacity: 64, maximumRuns: limit) == nil)
        }
        // Every byte pattern, including signed zero, NaNs and infinities in
        // BF16, is copied as data. Floating-point equality cannot test this.
        for dtype in [DType.uint32, .bfloat16] {
            for width in [1, 3, 128, 1024] {
                let words = (0 ..< 64 * width).map { UInt32(truncatingIfNeeded: $0 &* 2_654_435_761) }
                let initial = dtype == .uint32 ? MLXArray(words, [64, width])
                    : MLXArray(words.map { UInt16(truncatingIfNeeded: $0) }, [64, width]).view(dtype: .bfloat16)
                eval(initial)
                for slots in patterns where !slots.isEmpty && slots.count <= 32
                    && Set(slots).count == slots.count && slots.allSatisfy({ $0 >= 0 && $0 < 64 }) {
                    let values = (0 ..< slots.count * width).map { UInt32(truncatingIfNeeded: $0 &* 805_459_861 &+ 137) }
                    let updates = dtype == .uint32 ? MLXArray(values, [slots.count, width])
                        : MLXArray(values.map { UInt16(truncatingIfNeeded: $0) }, [slots.count, width]).view(dtype: .bfloat16)
                    let reference = initial.reshaped(initial.shape)
                    var candidate = initial.reshaped(initial.shape)
                    let idx = MLXArray(slots)
                    reference[idx] = updates
                    if cpuWrites {
                        candidate = try CPUSlotWrite.apply(to: candidate, from: updates, slots: slots)
                        let shaped = initial.reshaped([64, width, 1])
                        let changed = try CPUSlotWrite.apply(to: shaped,
                            from: updates.reshaped([slots.count, width, 1]), slots: slots)
                        eval(changed)
                        c.equal("CPU restored 3D shape \(dtype) width=\(width)", changed.shape, [64, width, 1])
                        c.expect("CPU 3D exact bytes \(dtype) width=\(width) slots=\(slots)",
                            (changed.reshaped([-1]).view(dtype: .uint8) .== reference.reshaped([-1]).view(dtype: .uint8)).all().item(Bool.self))
                    } else if wordWrites {
                        candidate = WordSlotWrite.apply(to: candidate, from: updates, at: idx)
                        c.equal("word eligibility \(dtype) width=\(width)", WordSlotWrite.eligible(initial, updates),
                            dtype == .bfloat16 && width.isMultiple(of: 2))
                        // A last dimension of one must still pack complete
                        // rows after flattening, then restore the exact shape.
                        let shaped = initial.reshaped([64, width, 1])
                        let changed = WordSlotWrite.apply(to: shaped,
                            from: updates.reshaped([slots.count, width, 1]), at: idx)
                        eval(changed)
                        c.equal("restored 3D shape \(dtype) width=\(width)", changed.shape, [64, width, 1])
                        c.expect("3D exact bytes \(dtype) width=\(width) slots=\(slots)",
                            (changed.reshaped([-1]).view(dtype: .uint8) .== reference.reshaped([-1]).view(dtype: .uint8)).all().item(Bool.self))
                    } else if let runs = SlotWriteRun.plan(slots, capacity: 64) {
                        SlotWriteRun.apply(runs, to: candidate, from: updates)
                    } else { candidate[idx] = updates }
                    eval(reference, candidate)
                    c.expect("exact bytes \(dtype) width=\(width) slots=\(slots)",
                        (reference.reshaped([-1]).view(dtype: .uint8) .== candidate.reshaped([-1]).view(dtype: .uint8)).all().item(Bool.self))
                    // Both views share the original storage before updates.
                    // Its surviving reader must still see all original bytes.
                    let original = dtype == .uint32 ? MLXArray(words, [64, width])
                        : MLXArray(words.map { UInt16(truncatingIfNeeded: $0) }, [64, width]).view(dtype: .bfloat16)
                    c.expect("retained reader unchanged \(dtype) width=\(width) slots=\(slots)",
                        (initial.reshaped([-1]).view(dtype: .uint8) .== original.reshaped([-1]).view(dtype: .uint8)).all().item(Bool.self))
                }
            }
        }
        if cpuWrites {
            let original = MLXArray(Array(0..<4096).map(UInt32.init), [64, 64])
            eval(original)
            var destination = original.reshaped(original.shape)
            let alias = destination
            let view = destination[0..<32]
            // The pinned StreamOrDevice.stream implementation ignores its
            // argument. Use the TaskLocal default facility and assert the
            // selected stream is distinct, rather than silently testing the
            // ordinary GPU stream twice.
            let pendingReader = Stream.withNewDefaultStream(device: .gpu) {
                c.expect("reader uses a distinct GPU stream", StreamOrDevice.default.stream != Stream.gpu)
                let reader = (destination + UInt32(1)).sum()
                asyncEval(reader)
                return reader
            }
            let update = MLXArray.zeros([3, 64], dtype: .uint32)
            destination = try CPUSlotWrite.apply(to: destination, from: update, slots: [1, 7, 11])
            let consumer = destination.sum()
            eval(destination, consumer, pendingReader)
            c.expect("same Swift object alias retains old bytes", (alias .== original).all().item(Bool.self))
            c.expect("retained view keeps old bytes", (view .== original[0..<32]).all().item(Bool.self))
            c.equal("other GPU stream reader preserves original values", pendingReader.item(UInt32.self), UInt32(4096 * 4097 / 2))
            var expectedTotal: UInt32 = 0
            for i in 0..<4096 where ![1, 7, 11].contains(i / 64) { expectedTotal += UInt32(i) }
            c.equal("GPU consumer sees CPU update", consumer.item(UInt32.self), expectedTotal)
            for slots: [Int32] in [[], [-1], [64], [3, 3], Array(0..<33)] {
                do {
                    _ = try CPUSlotWrite.apply(to: destination,
                        from: MLXArray.zeros([slots.count, 64], dtype: .uint32), slots: slots)
                    c.expect("invalid CPU rows rejected \(slots)", false)
                } catch { c.expect("invalid CPU rows rejected \(slots)", true) }
                c.equal("rejection leaves destination unchanged \(slots)", destination.sum().item(UInt32.self), consumer.item(UInt32.self))
            }
            for shape in [[1, 63], [2, 64], [64]] {
                do {
                    _ = try CPUSlotWrite.apply(to: destination,
                        from: MLXArray.zeros(shape, dtype: .uint32), slots: [1])
                    c.expect("invalid CPU source shape rejected \(shape)", false)
                } catch { c.expect("invalid CPU source shape rejected \(shape)", true) }
                c.equal("shape rejection leaves destination unchanged \(shape)", destination.sum().item(UInt32.self), expectedTotal)
            }
            do {
                _ = try CPUSlotWrite.apply(to: destination,
                    from: MLXArray.zeros([1, 64], dtype: .bfloat16), slots: [1])
                c.expect("CPU dtype mismatch rejected", false)
            } catch { c.expect("CPU dtype mismatch rejected", true) }
            c.equal("dtype rejection leaves destination unchanged", destination.sum().item(UInt32.self), expectedTotal)
            var exclusive = MLXArray(Array(0..<4096).map(UInt32.init), [64, 64])
            eval(exclusive)
            func address(_ a: MLXArray) -> UInt {
                a.asData(access: .noCopyIfContiguous).data.withUnsafeBytes { UInt(bitPattern: $0.baseAddress!) }
            }
            let before = address(exclusive)
            exclusive = try CPUSlotWrite.apply(to: exclusive, from: update, slots: [1, 7, 11])
            eval(exclusive)
            c.measure("exclusive_storage_reused", before == address(exclusive) ? 1 : 0)
            c.equal("exclusive CPU update preserves full contents", exclusive.sum().item(UInt32.self), consumer.item(UInt32.self))
        }
        return c.report()
    }
}
