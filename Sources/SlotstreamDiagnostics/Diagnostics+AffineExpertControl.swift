import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Full-stack arithmetic and residency checks for one explicitly pinned
    /// research control. No raw native F32 is saved and no pack is activated.
    public static func affineExpertControl(baseline: URL, control: URL, reference: URL,
                                          referenceSHA256: String, output: URL, referenceArithmetic: Bool = false) throws -> Data {
        let artifact = try AffineExpertControl.identify(control: control)
        struct Point: Decodable { let path: String, shape: [Int], bytes: Int, sha256: String }
        struct Fixture: Decodable {
            let schema: Int, complete: Bool, qualification: Bool, control_manifest_sha256: String
            let normalization: String, tokens: [Int], points: [Point], raw_f32_bytes: Int
            let relative_maximum_bound: Double
        }
        let raw = try AffineExpertControl.bounded(reference.appendingPathComponent("receipt.json"),
            maximum: 4_000_000, sha256: referenceSHA256)
        let fixture = try JSONDecoder().decode(Fixture.self, from: raw)
        guard fixture.schema == 1, fixture.complete, !fixture.qualification,
              fixture.control_manifest_sha256 == artifact.manifestSHA256,
              fixture.normalization == "original-already-folded-bf16-unchanged-v1",
              fixture.tokens == [9707, 11, 1246, 525, 498, 30], fixture.points.count == 49,
              fixture.raw_f32_bytes == 12_789_760, fixture.relative_maximum_bound == 0.02 else {
            throw ModelError("native affine control requires its frozen six-token full-stack reference")
        }
        var references: [String: [Float]] = [:]
        for (i, point) in fixture.points.enumerated() {
            let name = i < 48 ? "layer_\(i).f32" : "logits.f32"
            let shape = i < 48 ? [1, 6, 10240] : [248320]
            guard point.path == name, point.shape == shape, point.bytes == shape.reduce(4, *), references[name] == nil else {
                throw ModelError("affine reference point differs from its frozen geometry")
            }
            let bytes = try AffineExpertControl.bounded(reference.appendingPathComponent(name), maximum: point.bytes, sha256: point.sha256)
            guard bytes.count == point.bytes else { throw ModelError("truncated affine reference") }
            let values: [Float] = bytes.withUnsafeBytes { buffer in
                stride(from: 0, to: buffer.count, by: 4).map { buffer.loadUnaligned(fromByteOffset: $0, as: Float.self) }
            }
            guard values.allSatisfy(\.isFinite) else { throw ModelError("nonfinite affine reference") }
            references[name] = values
        }
        guard ProcessInfo.processInfo.environment.keys.allSatisfy({ !$0.hasPrefix("SLOTSTREAM_") }) else {
            throw ModelError("affine control requires unmodified deployed optimization defaults")
        }
        try ModelProcessGuard.acquire()
        guard let before = ProcessMemory.vmActivity(), before.reclaimableBytes >= 13_000_000_000 else {
            throw ModelError("affine control requires 13 GB actual reclaimable memory")
        }
        let manager = FileManager.default
        guard !manager.fileExists(atPath: output.path) else { throw ModelError("affine result directory must be new") }
        try manager.createDirectory(at: output, withIntermediateDirectories: false, attributes: [.posixPermissions: 0o700])
        let oldCache = MLX.Memory.cacheLimit, oldLimit = MLX.Memory.memoryLimit
        MLX.Memory.cacheLimit = 128_000_000; MLX.Memory.memoryLimit = min(oldLimit, 8_000_000_000)
        defer { Stream.gpu.synchronize(); MLX.Memory.clearCache(); MLX.Memory.cacheLimit = oldCache; MLX.Memory.memoryLimit = oldLimit }
        let started = ProcessInfo.processInfo.systemUptime
        func guardResources() throws {
            guard ProcessMemory.peakResidentBytes() > 0, ProcessMemory.peakResidentBytes() <= 10_000_000_000,
                  let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= 3_000_000_000,
                  ProcessInfo.processInfo.systemUptime - started <= 1800 else {
                throw ModelError("affine control exceeded its process, headroom or time bound")
            }
        }
        var guardFailure: Error?
        let index = try AffineExpertControl.open(baseline: baseline, control: control, artifact: artifact, shouldContinue: {
            do { try guardResources(); return true } catch { guardFailure = error; return false }
        })
        if let guardFailure { throw guardFailure }
        try guardResources()
        var passes = [[String: Any]](), exact: [String: String] = [:]
        let model = try Qwen4ExpModel(index: index, poolSlots: 640, embeddingRowCache: nil,
            affineControlReferenceArithmetic: referenceArithmetic)
        try model.validate()
        guard model.pool.recordBytes == 2_150_400 else { throw ModelError("native control record size differs") }
        let encoder = JSONEncoder(); encoder.outputFormatting = [.sortedKeys]
        var result: [String: Any] = ["schema": 1, "complete": false, "qualification": false,
            "control_manifest_sha256": artifact.manifestSHA256, "reference_manifest_sha256": referenceSHA256,
            "relative_maximum_bound": fixture.relative_maximum_bound, "record_bytes": model.pool.recordBytes,
            "arithmetic": referenceArithmetic ? "pr1788-affine3-explicit-v1" : "native-deployed-defaults",
            "slots": [640, 640, 800, 640], "saved_raw_f32_bytes": 0,
            "allocation_scope": "Fixed small slot counts. Public planner remains conservatively priced at the original four-bit geometry."]
        func save() throws -> Data {
            result["passes"] = passes; result["peak_process_bytes"] = ProcessMemory.peakResidentBytes()
            let data = try JSONSerialization.data(withJSONObject: result, options: [.prettyPrinted, .sortedKeys])
            try data.write(to: output.appendingPathComponent("receipt.json"), options: .atomic)
            return data
        }
        do {
            for (pass, slots) in [640, 640, 800, 640].enumerated() {
                try guardResources()
                if model.pool.slots != slots {
                    guard ProcessMemory.peakResidentBytes() + UInt64(model.pool.growthTransientBytes(to: slots)) <= 10_000_000_000 else {
                        throw ModelError("affine resize overlap exceeds the process reservation")
                    }
                    model.pool.resize(to: slots)
                }
                var observations = [[String: Any]](), failure: Error?
                func observe(_ name: String, _ array: MLXArray) throws {
                    let actual = array.asType(.float32).asArray(Float.self)
                    guard let expected = references[name], actual.count == expected.count,
                          actual.allSatisfy(\.isFinite) else { throw ModelError("affine point shape or finiteness differs") }
                    let sha = actual.withUnsafeBytes { AffineExpertControl.digest(Data($0)) }
                    var maxAbs: Float = 0, scale: Float = 0
                    for i in actual.indices { maxAbs = max(maxAbs, abs(actual[i] - expected[i])); scale = max(scale, abs(expected[i])) }
                    let relative = maxAbs / max(scale, 1e-6)
                    let same = pass == 0 || exact[name] == sha
                    if pass == 0 { exact[name] = sha }
                    observations.append(["point": name, "relative_maximum": relative, "maximum_absolute": maxAbs,
                        "sha256": sha, "reference_passed": relative < 0.02, "residency_exact": same])
                    result["incomplete_pass"] = ["pass": pass, "slots": slots, "points": observations]
                    _ = try save()
                    try guardResources()
                }
                let state = model.makeState()
                try withError {
                    let mixed = try model.hiddenStatesChecked(fixture.tokens, state: state) { layer, array in
                        guard failure == nil else { return }
                        do { try observe("layer_\(layer).f32", array) } catch { failure = error }
                    }
                    if let failure { throw failure }
                    // Preserve the reference's full six-row head arithmetic.
                    let logits = model.draftLogits(mixed).asType(.float32)
                    eval(logits)
                    guard logits.shape == [1, 6, 248320] else { throw ModelError("native affine readout geometry differs") }
                    try observe("logits.f32", logits[0, 5])
                }
                // The low-level forward leaves its last layer pinned for its
                // caller. Match Generator's explicit joined request cleanup.
                Stream.gpu.synchronize()
                let pinsAtComputeBoundary = model.pool.pinnedSlotCount
                model.pool.unpinAll()
                guard state.tokenCount == 6, observations.count == 49,
                      pinsAtComputeBoundary <= 60, model.pool.pinnedSlotCount == 0 else {
                    throw ModelError("incomplete native affine forward or retained pins")
                }
                let passed = observations.allSatisfy { $0["reference_passed"] as? Bool == true && $0["residency_exact"] as? Bool == true }
                passes.append(["pass": pass, "slots": slots, "points": observations, "passed": passed,
                    "consumed_tokens": state.tokenCount, "pins_at_compute_boundary": pinsAtComputeBoundary,
                    "pins_after_joined_cleanup": model.pool.pinnedSlotCount])
                result.removeValue(forKey: "incomplete_pass")
                _ = try save()
                guard passed else { throw ModelError("native affine arithmetic or exact residency gate failed") }
            }
            try index.verifyAuthenticatedFilesUnchanged(); try guardResources()
            result["complete"] = true; result["seconds"] = ProcessInfo.processInfo.systemUptime - started
            result["before"] = try JSONSerialization.jsonObject(with: encoder.encode(before))
            return try save()
        } catch {
            result["failure"] = String(describing: error); _ = try save(); throw error
        }
    }
}
