import Foundation
import MLX
import MLXNN
import Slotstream

// Component candidates only. They are deliberately absent from model dispatch
// until trained-weight equality and a complete-operation timing gate pass.
private let compiledGLU = compile(shapeless: true) { (g: MLXArray, u: MLXArray) in
    (g * sigmoid(g)) * u
}

private struct ProjectionIsland {
    let original: [QLinear]
    let weight: MLXArray
    let scales: MLXArray?
    let biases: MLXArray?
    let ends: [Int]
    var duplicatedBytes: Int { weight.nbytes + (scales?.nbytes ?? 0) + (biases?.nbytes ?? 0) }

    init(_ original: [QLinear]) throws {
        guard let first = original.first, original.count > 1,
            original.allSatisfy({ $0.w.ndim == 2 && $0.w.dim(1) == first.w.dim(1)
                && $0.w.dtype == first.w.dtype && $0.groupSize == first.groupSize
                && $0.bits == first.bits && $0.isQuantized == first.isQuantized
                && ($0.biases != nil) == (first.biases != nil) }) else {
            throw ModelError("projection-island inputs have incompatible quantization or geometry")
        }
        self.original = original
        weight = concatenated(original.map(\.w), axis: 0)
        scales = first.scales == nil ? nil : concatenated(original.map { $0.scales! }, axis: 0)
        biases = first.biases == nil ? nil : concatenated(original.map { $0.biases! }, axis: 0)
        var count = 0
        ends = original.map { count += $0.w.dim(0); return count }
        eval([weight] + [scales, biases].compactMap { $0 })
    }

    func call(_ x: MLXArray, fused: Bool) -> [MLXArray] {
        guard fused else { return original.map { $0(x) } }
        let y: MLXArray
        if let scales {
            y = quantizedMM(x, weight, scales: scales, biases: biases, transpose: true,
                groupSize: original[0].groupSize, bits: original[0].bits)
        } else { y = matmul(x, weight.transposed()) }
        var begin = 0
        return ends.map { end in
            defer { begin = end }
            return y[.ellipsis, begin..<end]
        }
    }
}

extension Diagnostics {
    public static func optimizationComputeIslands(modelDir: URL, timed: Bool = false,
                                                 quantizedOnly: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        var c = CheckBuilder("optimization-compute-islands")
        let index = try CheckpointIndex(dir: modelDir)
        // ResidentWeights acquires the same native process lock as inference.
        let resident = try ResidentWeights(index: index, embeddingRowCache: true)
        func exact(_ a: MLXArray, _ b: MLXArray) -> Bool {
            a.shape == b.shape && a.dtype == b.dtype &&
                (a.reshaped([-1]).view(dtype: .uint8) .== b.reshaped([-1]).view(dtype: .uint8)).all().item(Bool.self)
        }
        // Every finite BF16 value, including both zero signs and subnormals.
        let finite = (UInt32(0)...UInt32(65535)).compactMap { bits -> UInt16? in
            bits & 0x7f80 == 0x7f80 ? nil : UInt16(bits)
        }
        let gate = MLXArray(finite).view(dtype: .bfloat16)
        // Non-power-of-two multipliers are important: multiplying by powers
        // of two alone can hide an incorrectly removed BF16 rounding boundary.
        for value: Float in [-128, -2, -1.296875, -0.0, 0, 0.5, 0.70703125, 1,
                             1.0078125, 1.1015625, 3.140625, 128] {
            let up = MLXArray.full(gate.shape, values: MLXArray(value), dtype: .bfloat16)
            let expected = MLXNN.silu(gate) * up
            let actual = compiledGLU(gate, up)
            c.expect("all finite BF16 gates, multiplier \(value): exact bytes", exact(actual, expected))
        }
        for stride in [31, 79, 7919] {
            let paired = finite.indices.map { finite[($0 * stride + 503) % finite.count] }
            let up = MLXArray(paired).view(dtype: .bfloat16)
            c.expect("varying finite BF16 multiplier permutation \(stride): exact bytes",
                exact(compiledGLU(gate, up), MLXNN.silu(gate) * up))
        }
        guard let layer = index.config.layerTypes.firstIndex(of: "linear_attention") else {
            throw ModelError("compute-island probe requires the curated recurrent layer")
        }
        let groups: [(String, [String])] = [
            ("shared-gate-up", ["mlp.shared_expert.gate_proj", "mlp.shared_expert.up_proj"]),
            ("gdn-qkv-z", ["linear_attn.in_proj_qkv", "linear_attn.in_proj_z"]),
            ("gdn-b-a", ["linear_attn.in_proj_b", "linear_attn.in_proj_a"])
        ]
        for (label, names) in groups {
            // The original dense B/A group remains an executable numerical
            // counterexample. It is excluded from the explicitly named
            // quantized successor, never enabled through a row-specific patch.
            if quantizedOnly && label == "gdn-b-a" { continue }
            let island = try ProjectionIsland(names.map { resident.linear("model.layers.\(layer).\($0)") })
            c.measure("\(label).duplicated_weight_bytes", Double(island.duplicatedBytes))
            c.measure("\(label).output_columns", Double(island.ends.last!))
            c.measure("\(label).quantized", island.original[0].isQuantized ? 1 : 0)
            for rows in [1, 2, 8, 16, 32, 256, 257, 1024] {
                let count: Int = rows * index.config.hiddenSize
                var values = [Float](repeating: 0, count: count)
                for i in values.indices {
                    let integer: Int = (i * 31 + 7) % 257 - 128
                    values[i] = Float(integer) / Float(131)
                }
                let storage = MLXArray(values, [1, index.config.hiddenSize, rows]).asType(.bfloat16)
                eval(storage)
                // Materialized transposed input exercises input-contiguity
                // handling as well as the actual quantized row-count dispatch.
                let strided = storage.transposed(0, 2, 1)
                let x = contiguous(strided)
                eval(x)
                let reference: [MLXArray] = island.call(x, fused: false)
                let combined: [MLXArray] = island.call(x, fused: true)
                eval(reference + combined)
                let key = "\(label).rows_\(rows)"
                var projectionExact = true
                for i in reference.indices { projectionExact = exact(reference[i], combined[i]) && projectionExact }
                c.expect("\(key): exact projection slices", projectionExact)
                let stridedReference = island.call(strided, fused: false)
                let stridedCombined = island.call(strided, fused: true)
                var stridedExact = true
                for i in stridedReference.indices { stridedExact = exact(stridedReference[i], stridedCombined[i]) && stridedExact }
                c.expect("\(key): noncontiguous input exact", stridedExact)
                if label == "shared-gate-up" {
                    c.expect("\(key): combined GLU exact", exact(compiledGLU(combined[0], combined[1]),
                        MLXNN.silu(reference[0]) * reference[1]))
                    c.expect("\(key): pointwise GLU alone exact", exact(compiledGLU(reference[0], reference[1]),
                        MLXNN.silu(reference[0]) * reference[1]))
                }
                guard timed else { continue }
                guard c.report().passed else { return c.report() }
                // Profile the complete projection group, including output
                // slicing/strides. Projection weights are already materialized;
                // their duplication above is an explicit additional cost.
                let arms = label == "shared-gate-up" ? ["reference", "pointwise", "projection", "combined"] : ["reference", "projection"]
                func execute(_ arm: String) -> [MLXArray] {
                    let outputs = island.call(x, fused: arm == "projection" || arm == "combined")
                    if label != "shared-gate-up" { return outputs }
                    return [arm == "pointwise" || arm == "combined"
                        ? compiledGLU(outputs[0], outputs[1]) : MLXNN.silu(outputs[0]) * outputs[1]]
                }
                for arm in arms { for _ in 0..<3 { eval(execute(arm)) } }
                for round in 1...5 {
                    for arm in round.isMultiple(of: 2) ? Array(arms.reversed()) : arms {
                        let vm0 = ProcessMemory.vmActivity(), power0 = ProcessMemory.operatingConditions()
                        let footprint = FootprintSampler(intervalMilliseconds: 5)
                        let start = RuntimeClock.now()
                        for _ in 0..<16 { eval(execute(arm)) }
                        let seconds = RuntimeClock.seconds(since: start)
                        let peak = footprint.finish()
                        let vm1 = ProcessMemory.vmActivity(), power1 = ProcessMemory.operatingConditions()
                        let clean = vm0 != nil && vm1 != nil && vm0!.swapins == vm1!.swapins && vm0!.swapouts == vm1!.swapouts
                        let nominal = power0.thermalState == "nominal" && power1.thermalState == "nominal"
                            && !power0.lowPowerModeEnabled && !power1.lowPowerModeEnabled
                        let fits = peak.samples > 0 && peak.peakBytes > 0 && peak.peakBytes <= 7_000_000_000
                        let cell = "\(key).round_\(round).\(arm)"
                        c.expect("\(cell): clean resource interval", clean && nominal && fits)
                        c.measure("\(cell).seconds", seconds)
                        c.measure("\(cell).peak_bytes", Double(peak.peakBytes))
                        if !clean || !nominal || !fits { return c.report() }
                    }
                }
            }
        }
        return c.report()
    }
}
