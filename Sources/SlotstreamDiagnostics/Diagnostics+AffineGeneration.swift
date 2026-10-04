import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// A self-fed sequence: native samples become the next native input.
    /// Reference rows retain the predeclared affine bound; cache histories
    /// must preserve exact native bytes. Nothing is installed or activated.
    public static func affineGeneration(baseline: URL, control: URL, reference: URL,
        referenceSHA256: String, output: URL) throws -> Data {
        let artifact = try AffineExpertControl.identify(control: control)
        struct Point: Decodable { let path: String, shape: [Int], bytes: Int, sha256: String }
        struct Hidden: Decodable { let layer: Int, shape: [Int], sha256: String }
        struct Step: Decodable { let step: Int, input_ids: [Int], sampled: Int, points: [Hidden], logits: Point }
        struct Profile: Decodable { let prompt: [Int], max_new_tokens: Int, minimum_steps: Int, eos_token_id: Int }
        struct Fixture: Decodable {
            let schema: Int, complete: Bool, qualification: Bool, control_manifest_sha256: String
            let normalization: String, profile_sha256: String, profile: Profile, steps: [Step], generated: [Int]
            let raw_f32_bytes: Int, consumed_tokens: Int, relative_maximum_bound: Double
        }
        let raw = try AffineExpertControl.bounded(reference.appendingPathComponent("receipt.json"),
            maximum: 4_000_000, sha256: referenceSHA256)
        let fixture = try JSONDecoder().decode(Fixture.self, from: raw)
        guard fixture.schema == 1, fixture.complete, !fixture.qualification,
              fixture.control_manifest_sha256 == artifact.manifestSHA256,
              fixture.normalization == "original-already-folded-bf16-unchanged-v1",
              fixture.profile_sha256 == "8e9ffd40c71d34bca08a55e7af55fda8ac7d45429f3ff7febef077d31bface7c",
              fixture.profile.prompt.count == 44, fixture.profile.max_new_tokens == 16,
              fixture.profile.minimum_steps == 8, fixture.profile.eos_token_id == 248044,
              (8...16).contains(fixture.steps.count), fixture.generated.count == fixture.steps.count,
              fixture.raw_f32_bytes == fixture.steps.count * 248320 * 4,
              fixture.consumed_tokens == 44 + fixture.steps.count - 1,
              fixture.relative_maximum_bound == 0.02,
              !fixture.generated.dropLast().contains(248044),
              fixture.generated.last == 248044 || fixture.steps.count == 16,
              (fixture.profile.prompt + fixture.generated).allSatisfy({ (0..<248320).contains($0) }) else {
            throw ModelError("affine generation requires its complete frozen reference")
        }
        var references: [[Float]] = []
        for (number, step) in fixture.steps.enumerated() {
            let point = step.logits
            guard step.step == number, step.sampled == fixture.generated[number],
                  step.input_ids == (number == 0 ? fixture.profile.prompt : [fixture.generated[number - 1]]),
                  point.path == String(format: "logits-%02d.f32", number),
                  point.shape == [248320], point.bytes == 248320 * 4,
                  step.points.count == 48,
                  step.points.enumerated().allSatisfy({ $0.offset == $0.element.layer
                      && $0.element.shape == [1, step.input_ids.count, 10240]
                      && $0.element.sha256.count == 64 }) else { throw ModelError("incomplete affine autoregressive chain") }
            let bytes = try AffineExpertControl.bounded(reference.appendingPathComponent(point.path),
                maximum: point.bytes, sha256: point.sha256)
            guard bytes.count == point.bytes else { throw ModelError("truncated affine generation row") }
            let values = bytes.withUnsafeBytes { buffer in
                stride(from: 0, to: buffer.count, by: 4).map { buffer.loadUnaligned(fromByteOffset: $0, as: Float.self) }
            }
            guard values.allSatisfy(\.isFinite) else { throw ModelError("nonfinite affine generation reference") }
            references.append(values)
        }
        guard !FileManager.default.fileExists(atPath: output.path),
              !ProcessInfo.processInfo.environment.keys.contains(where: {
                  $0.hasPrefix("SLOTSTREAM_") || $0.hasPrefix("SS_DEBUG") || $0.hasPrefix("VQ_") || $0.hasPrefix("VQLAB_")
              }) else { throw ModelError("affine generation requires new output and no ambient overrides") }
        try ModelProcessGuard.acquire()
        guard let before = ProcessMemory.vmActivity(), before.reclaimableBytes >= 13_000_000_000 else {
            throw ModelError("affine generation requires 13 GB actual reclaimable memory")
        }
        try FileManager.default.createDirectory(at: output, withIntermediateDirectories: false)
        let oldCache = MLX.Memory.cacheLimit, oldLimit = MLX.Memory.memoryLimit
        MLX.Memory.cacheLimit = 128_000_000; MLX.Memory.memoryLimit = min(oldLimit, 8_000_000_000)
        defer { Stream.gpu.synchronize(); MLX.Memory.clearCache(); MLX.Memory.cacheLimit = oldCache; MLX.Memory.memoryLimit = oldLimit }
        let started = ProcessInfo.processInfo.systemUptime
        func guardResources() throws {
            guard ProcessMemory.peakResidentBytes() <= 10_000_000_000,
                  let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= 3_000_000_000,
                  ProcessInfo.processInfo.systemUptime - started < 1800 else {
                throw ModelError("affine generation exceeded its resource reservation")
            }
        }
        var result: [String: Any] = ["schema": 1, "complete": false, "qualification": false,
            "control_manifest_sha256": artifact.manifestSHA256, "reference_sha256": referenceSHA256,
            "arithmetic": "pr1788-affine3-explicit-v1", "relative_maximum_bound": 0.02,
            "slots": [640, 640, 800, 640], "saved_raw_f32_bytes": 0]
        var passes: [[String: Any]] = []
        func save() throws -> Data {
            result["passes"] = passes; result["peak_process_bytes"] = ProcessMemory.peakResidentBytes()
            let data = try JSONSerialization.data(withJSONObject: result, options: [.prettyPrinted, .sortedKeys])
            try data.write(to: output.appendingPathComponent("receipt.json"), options: .atomic)
            return data
        }
        do {
            let index = try AffineExpertControl.open(baseline: baseline, control: control, artifact: artifact,
                shouldContinue: { (try? guardResources()) != nil })
            let model = try Qwen4ExpModel(index: index, poolSlots: 640, embeddingRowCache: nil,
                affineControlReferenceArithmetic: true)
            try model.validate()
            defer { Stream.gpu.synchronize(); model.pool.unpinAll() }
            var exact: [String: String] = [:]
            for (pass, slots) in [640, 640, 800, 640].enumerated() {
                try guardResources()
                if model.pool.slots != slots {
                    guard ProcessMemory.peakResidentBytes() + UInt64(model.pool.growthTransientBytes(to: slots)) <= 10_000_000_000 else {
                        throw ModelError("affine generation resize overlap exceeds its reservation")
                    }
                    model.pool.resize(to: slots)
                }
                let state = model.makeState()
                var ids = fixture.profile.prompt, generated: [Int] = [], observations: [[String: Any]] = []
                for (step, expected) in fixture.steps.enumerated() {
                    var hiddenExact = true, residencyExact = true, hiddenCount = 0
                    var hiddenPoints: [[String: Any]] = []
                    let mixed = try withError {
                        try model.hiddenStatesChecked(ids, state: state) { layer, value in
                            let floats = value.asType(.float32).asArray(Float.self)
                            let sha = floats.withUnsafeBytes { AffineExpertControl.digest(Data($0)) }
                            let key = "\(step):\(layer)"
                            hiddenExact = hiddenExact && sha == expected.points[layer].sha256
                            hiddenPoints.append(["layer": layer, "sha256": sha, "reference_exact": sha == expected.points[layer].sha256])
                            residencyExact = residencyExact && (pass == 0 || exact[key] == sha)
                            if pass == 0 { exact[key] = sha }
                            hiddenCount += 1
                        }
                    }
                    let logits = model.draftLogits(mixed).asType(.float32)
                    eval(logits)
                    guard logits.shape == [1, ids.count, 248320] else { throw ModelError("affine generation readout shape changed") }
                    let row = logits[0, ids.count - 1]
                    let values = row.asArray(Float.self), reference = references[step]
                    guard values.allSatisfy(\.isFinite), hiddenCount == 48 else { throw ModelError("nonfinite or incomplete native generation") }
                    let sampled = argMax(row).item(Int.self)
                    let sha = values.withUnsafeBytes { AffineExpertControl.digest(Data($0)) }
                    let key = "\(step):logits"
                    residencyExact = residencyExact && (pass == 0 || exact[key] == sha)
                    if pass == 0 { exact[key] = sha }
                    var error: Float = 0, scale: Float = 0
                    for i in values.indices { error = max(error, abs(values[i] - reference[i])); scale = max(scale, abs(reference[i])) }
                    let relative = error / max(scale, 1e-6)
                    generated.append(sampled)
                    observations.append(["step": step, "sampled": sampled, "reference_sampled": expected.sampled,
                        "relative_maximum": relative, "maximum_absolute": error, "sha256": sha,
                        "reference_logit_exact": sha == expected.logits.sha256,
                        "reference_hidden_exact": hiddenExact, "hidden_points": hiddenPoints, "residency_exact": residencyExact])
                    result["incomplete_pass"] = ["pass": pass, "steps": observations]
                    _ = try save()
                    guard sampled == expected.sampled, relative < 0.02, residencyExact else {
                        throw ModelError("native affine generation reference or residency gate failed")
                    }
                    ids = [sampled]; try guardResources()
                }
                Stream.gpu.synchronize(); model.pool.unpinAll()
                guard state.tokenCount == fixture.consumed_tokens, generated == fixture.generated,
                      model.pool.pinnedSlotCount == 0 else { throw ModelError("affine generation consumed boundary differs") }
                passes.append(["pass": pass, "slots": slots, "generated": generated,
                    "consumed_tokens": state.tokenCount, "steps": observations, "passed": true])
                result.removeValue(forKey: "incomplete_pass"); _ = try save()
            }
            let generator = Generator(model: model)
            generator.prefillChunk = 512; generator.prefillCacheLimit = 128_000_000
            generator.speculationEnabled = false
            var params = SampleParams.greedy; params.maxTokens = fixture.steps.count; params.seed = 42
            let (ids, stats) = generator.generate(promptIds: fixture.profile.prompt, params: params,
                eosIds: [248044], shouldContinue: { (try? guardResources()) != nil })
            result["generator"] = ["ids": ids, "stats": try JSONSerialization.jsonObject(with: JSONEncoder().encode(stats))]
            _ = try save()
            guard ids == fixture.generated, stats.runtimeError == nil, stats.requestFailure == nil,
                  model.pool.pinnedSlotCount == 0 else { throw ModelError("production generator differs from the affine reference sequence") }
            try index.verifyAuthenticatedFilesUnchanged(); try guardResources()
            result["complete"] = true; result["seconds"] = ProcessInfo.processInfo.systemUptime - started
            result["before"] = try JSONSerialization.jsonObject(with: JSONEncoder().encode(before))
            return try save()
        } catch { result["failure"] = String(describing: error); _ = try save(); throw error }
    }
}
