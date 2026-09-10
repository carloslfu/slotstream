import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationGDNProjectionPacking(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 64 << 20
        MLX.Memory.clearCache()
        var c = CheckBuilder("optimization-gdn-projection-packing")
        let index = try CheckpointIndex(dir: modelDir)
        let initialActive = MLX.Memory.activeMemory
        let reference = try ResidentWeights(index: index, embeddingRowCache: true)
        let referenceLive = MLX.Memory.activeMemory - initialActive
        let beforePacked = MLX.Memory.activeMemory
        let packed = try ResidentWeights(index: index, embeddingRowCache: true, packGDNProjections: true)
        let packedLive = MLX.Memory.activeMemory - beforePacked
        c.measure("reference_resident_active_bytes", Double(referenceLive))
        c.measure("packed_resident_active_bytes", Double(packedLive))
        c.measure("packed_payload_bytes_already_in_named_tensors", Double(packed.packedGDNProjectionPayloadBytes))
        // Compare measured resident increments while both owners are alive.
        // A duplicated all-layer backing adds ~849MB and cannot pass this32MiB allowance.
        c.expect("packed resident has no second full projection payload", abs(packedLive - referenceLive) <= 32 << 20)
        c.equal("complete public named-tensor interface", Set(packed.arrays.keys), Set(reference.arrays.keys))
        let layers = index.config.layerTypes.indices.filter { index.config.layerTypes[$0] == "linear_attention" }
        c.equal("all recurrent layers packed", packed.packedGDNProjectionLayers, layers.count)
        c.equal("reference has no packed layers", reference.packedGDNProjectionLayers, 0)
        func exact(_ a: MLXArray, _ b: MLXArray) -> Bool {
            a.shape == b.shape && a.dtype == b.dtype &&
                (a.reshaped([-1]).view(dtype: .uint8) .== b.reshaped([-1]).view(dtype: .uint8)).all().item(Bool.self)
        }
        var expectedPayload = 0
        for layer in layers {
            let base = "model.layers.\(layer).linear_attn"
            guard let pair = packed.packedGDNProjections[layer] else { continue }
            for stem in ["in_proj_qkv", "in_proj_z"] {
                for suffix in ["weight", "scales", "biases"] {
                    let name = "\(base).\(stem).\(suffix)"
                    let a = reference.tensor(name), b = packed.tensor(name)
                    c.expect("layer\(layer): \(stem).\(suffix) exact bytes", exact(a, b))
                    // Preserve the evaluated backing layout without creating a
                    // contiguous copy; both array owners remain alive here.
                    c.equal("layer\(layer): \(stem).\(suffix) strides",
                        b.asData(access: .noCopy).strides, a.asData(access: .noCopy).strides)
                    expectedPayload += a.nbytes
                }
            }
            let a = reference.linear(base + ".in_proj_qkv"), b = reference.linear(base + ".in_proj_z")
            for rows in [1, 2, 256] {
                let values = (0..<(rows * index.config.hiddenSize)).map { Float(($0 * 31 + layer * 7) % 257 - 128) / 131 }
                let x = MLXArray(values, [1, rows, index.config.hiddenSize]).asType(.bfloat16)
                let r0 = a(x), r1 = b(x)
                let got = rows == 1 ? pair(x) : (pair.first(x), pair.second(x))
                c.expect("layer\(layer)/rows\(rows): exact QKV", exact(r0, got.0))
                c.expect("layer\(layer)/rows\(rows): exact Z", exact(r1, got.1))
                c.equal("layer\(layer)/rows\(rows): bounded fusion dispatch", pair.supportsOneToken(x), rows == 1)
            }
        }
        c.equal("shared backing payload counted once", packed.packedGDNProjectionPayloadBytes, expectedPayload)
        if let layer = layers.first, let pair = packed.packedGDNProjections[layer] {
            let width = index.config.hiddenSize
            for shape in [[2, 1, width], [1, 2, width], [1, 0, width], [1, 1, width + 1], [width]] {
                c.expect("unsupported input shape\(shape) retains fallback",
                    !pair.supportsOneToken(MLXArray.zeros(shape, dtype: .bfloat16)))
            }
            c.expect("FP32 input retains fallback", !pair.supportsOneToken(MLXArray.zeros([1, 1, width], dtype: .float32)))
            let a = pair.first, b = pair.second
            for invalid in [
                QLinear(w: a.w, scales: nil, biases: a.biases, groupSize: a.groupSize, bits: a.bits),
                QLinear(w: a.w, scales: a.scales, biases: nil, groupSize: a.groupSize, bits: a.bits),
                QLinear(w: a.w, scales: a.scales, biases: a.biases, groupSize: 0, bits: a.bits),
                QLinear(w: a.w, scales: a.scales, biases: a.biases, groupSize: a.groupSize, bits: 2),
                QLinear(w: a.w.reshaped([-1]), scales: a.scales, biases: a.biases, groupSize: a.groupSize, bits: a.bits),
                QLinear(w: a.w, scales: a.scales![0..<1, 0...], biases: a.biases, groupSize: a.groupSize, bits: a.bits)
            ].enumerated() {
                c.expect("invalid metadata\(invalid.offset) refuses packing", PackedProjectionPair(invalid.element, b) == nil)
            }
        }
        return c.report()
    }
}
