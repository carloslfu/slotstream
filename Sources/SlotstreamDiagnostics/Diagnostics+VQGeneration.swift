import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// A fixed, genuinely autoregressive check. The native argmax, not the
    /// fixture's token, becomes the next input. Final sampled token is unconsumed.
    public static func quantizationGeneration(source: URL, inventory: URL, profileURL: URL,
                                              fixtureDirectory: URL, output: URL, residentRecords: Bool = false, residentText: Bool = false, wideRecords: Bool = false, parallelRecords: Bool = false,
                                              denseOverlayBaseline: URL? = nil, denseOverlayManifest: URL? = nil, reinvestDenseSavings: Bool = false, uncachedExpertReads: Bool = false, packedRecordDirectory: URL? = nil) throws -> Data {
        struct Profile: Decodable, Equatable {
            let schema: Int, profile: String, prompt: [Int], sampling: String
            let max_new_tokens: Int, minimum_steps: Int, eos_token_id: Int
        }
        guard (!wideRecords && !parallelRecords) || (residentRecords && residentText) else { throw ModelError("wide banks and parallel VQ reads require resident text and records") }
        guard packedRecordDirectory == nil || (reinvestDenseSavings && !uncachedExpertReads) else {
            throw ModelError("packed VQ research requires reinvested banks and buffered reads")
        }
        guard !uncachedExpertReads || (denseOverlayBaseline != nil && reinvestDenseSavings && wideRecords && parallelRecords && residentText && residentRecords) else {
            throw ModelError("uncached expert shard research requires the fixed reinvested composite profile")
        }
        guard !reinvestDenseSavings || (denseOverlayBaseline != nil && wideRecords && parallelRecords && residentText && residentRecords) else {
            throw ModelError("dense reinvestment requires the composite and wide parallel residency")
        }
        guard (denseOverlayBaseline == nil) == (denseOverlayManifest == nil) else {
            throw ModelError("dense composite requires both baseline and manifest")
        }
        struct Boundary: Decodable {
            let layer: Int, name: String, shape: [Int], dtype: String, bytes: Int, sha256: String
            var key: String { "\(layer):\(name)" }
        }
        struct Step: Decodable {
            let step: Int, input_ids: [Int], sampled: Int, boundaries: [Boundary]
        }
        struct Manifest: Decodable {
            struct Artifact: Decodable { let inventory_sha256: String }
            let execution_profile: VQReferenceExecution?
            let runtime_sha256: String?
            let schema: Int, profile: Profile, profile_sha256: String, architecture_sha256: String, normalization: String
            let generated: [Int], steps: [Step], consumed_tokens: Int, stop: String
            let artifact: Artifact?, vq_parent: Artifact?
            let composite_sha256: String?, policy: String?
        }
        func digest(_ data: Data) -> String { SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined() }
        func read(_ url: URL, limit: Int) throws -> Data {
            let file = try FileHandle(forReadingFrom: url)
            defer { try? file.close() }
            guard let raw = try file.read(upToCount: limit + 1), !raw.isEmpty, raw.count <= limit else {
                throw ModelError("VQ generation metadata exceeds its byte bound")
            }
            return raw
        }
        let profileRaw = try read(profileURL, limit: 32_000)
        let profileHash = digest(profileRaw)
        guard profileHash == "8e9ffd40c71d34bca08a55e7af55fda8ac7d45429f3ff7febef077d31bface7c" else {
            throw ModelError("VQ generation requires the frozen greedy profile")
        }
        let profile = try JSONDecoder().decode(Profile.self, from: profileRaw)
        let raw = try read(fixtureDirectory.appendingPathComponent("generation.json"), limit: 2_000_000)
        let manifest = try JSONDecoder().decode(Manifest.self, from: raw)
        let parent: Manifest.Artifact
        if denseOverlayBaseline != nil {
            guard manifest.artifact == nil, let bound = manifest.vq_parent,
                  VQDenseOverlay.Profile.matches(identity: manifest.composite_sha256,
                    inventory: bound.inventory_sha256, policy: manifest.policy) else {
                throw ModelError("dense composite requires its own generated fixture identity")
            }
            parent = bound
        } else {
            guard let bound = manifest.artifact, manifest.vq_parent == nil,
                  manifest.composite_sha256 == nil, manifest.policy == nil else {
                throw ModelError("ordinary VQ generation refuses composite fixtures")
            }
            parent = bound
        }
        guard manifest.schema == 1, manifest.profile == profile, manifest.profile_sha256 == profileHash,
              manifest.architecture_sha256 == "d6470a2131a64ff37024dfffd2b5bc8c3f4db625f0f3b1ceec7fe346852c1a87",
              manifest.normalization == "vq-raw-zero-centered-to-pr1788-folded-bf16-v1",
              (profile.minimum_steps...profile.max_new_tokens).contains(manifest.steps.count),
              manifest.generated.count == manifest.steps.count,
              manifest.generated.allSatisfy({ (0..<248_320).contains($0) }),
              !manifest.generated.dropLast().contains(profile.eos_token_id),
              manifest.consumed_tokens == profile.prompt.count + manifest.steps.count - 1 else {
            throw ModelError("VQ generated fixture does not bind the complete frozen sequence")
        }
        let eos = manifest.generated.last == profile.eos_token_id
        guard manifest.stop == (eos ? "eos" : "length"), eos || manifest.steps.count == profile.max_new_tokens else {
            throw ModelError("VQ generated fixture has an inconsistent stop condition")
        }
        var expectedKeys = Set<String>()
        for layer in -1...48 {
            let names: [String]
            switch layer {
            case -1: names = ["embedded"]
            case 48: names = ["mixed", "logits"]
            case 1: names = ["hidden", "conv", "state", "ple_conv"]
            case let layer where (layer + 1) % 4 == 0: names = ["hidden", "keys", "values", "indexer"]
            default: names = ["hidden", "conv", "state"]
            }
            for name in names { expectedKeys.insert("\(layer):\(name)") }
        }
        var entries: [[String: Boundary]] = []
        for (index, step) in manifest.steps.enumerated() {
            guard step.step == index, step.sampled == manifest.generated[index],
                  step.input_ids == (index == 0 ? profile.prompt : [manifest.generated[index - 1]]),
                  step.boundaries.count == expectedKeys.count else {
                throw ModelError("VQ generated fixture has a broken autoregressive chain")
            }
            var row: [String: Boundary] = [:]
            for entry in step.boundaries {
                guard expectedKeys.contains(entry.key), row[entry.key] == nil,
                      ["F16", "BF16", "F32"].contains(entry.dtype), (1...5).contains(entry.shape.count),
                      entry.shape.allSatisfy({ $0 > 0 }),
                      entry.sha256.range(of: "^[0-9a-f]{64}$", options: .regularExpression) != nil else {
                    throw ModelError("invalid VQ generated boundary identity or geometry")
                }
                var bytes = entry.dtype == "F32" ? 4 : 2
                for dimension in entry.shape {
                    guard dimension <= 200_000_000 / bytes else { throw ModelError("VQ generated boundary exceeds its byte bound") }
                    bytes *= dimension
                }
                guard bytes == entry.bytes else { throw ModelError("VQ generated boundary byte count mismatch") }
                row[entry.key] = entry
            }
            guard Set(row.keys) == expectedKeys else { throw ModelError("VQ generated fixture omits a state boundary") }
            entries.append(row)
        }
        guard !ProcessInfo.processInfo.environment.keys.contains(where: {
            $0.hasPrefix("SLOTSTREAM_") || $0.hasPrefix("SS_DEBUG") || $0.hasPrefix("VQ_") || $0.hasPrefix("VQLAB_")
        }) else { throw ModelError("VQ generation check requires no developer overrides") }
        try VQReferenceExecution.validate(inventorySHA: parent.inventory_sha256,
            runtimeSHA: manifest.runtime_sha256, profile: manifest.execution_profile)
        try ModelProcessGuard.acquire()
        guard let before = ProcessMemory.vmActivity(), before.reclaimableBytes >= 13_000_000_000 else {
            throw ModelError("VQ generation check requires 13 GB actual reclaimable memory")
        }
        let checkpoint = try VQCheckpoint(directory: source, inventory: inventory,
            denseOverlayBaseline: denseOverlayBaseline, denseOverlayManifest: denseOverlayManifest, uncachedExpertReads: uncachedExpertReads, packedRecordDirectory: packedRecordDirectory)
        guard checkpoint.inventorySHA256 == parent.inventory_sha256 else { throw ModelError("VQ generated fixture and checkpoint differ") }
        let manager = FileManager.default
        guard !manager.fileExists(atPath: output.path) else { throw ModelError("VQ generation output directory must be new") }
        try manager.createDirectory(at: output, withIntermediateDirectories: false, attributes: [.posixPermissions: 0o700])
        let oldCache = MLX.Memory.cacheLimit, oldLimit = MLX.Memory.memoryLimit
        MLX.Memory.cacheLimit = 128_000_000; MLX.Memory.memoryLimit = min(oldLimit, residentText ? (wideRecords ? 9_000_000_000 : 8_500_000_000) : 3_000_000_000)
        defer {
            Stream.gpu.synchronize(); MLX.Memory.clearCache()
            MLX.Memory.cacheLimit = oldCache; MLX.Memory.memoryLimit = oldLimit
        }
        if residentText {
            let prior = checkpoint.verifiedFileCount
            do {
                _ = try VQResidentText(checkpoint, maximumPayloadBytes: checkpoint.residentTextPayloadBytes - 1)
                throw ModelError("undersized VQ resident text budget was accepted")
            } catch let error as ModelError {
                guard error.description.contains("below its authenticated payload"), checkpoint.verifiedFileCount == prior else { throw error }
            }
        }
        let model = VQModelProbe(checkpoint)
        if residentText { try model.enableResidentText() }
        if residentRecords { try model.enableResidentRecords(wide: wideRecords, parallelReads: parallelRecords, reinvestDenseSavings: reinvestDenseSavings) }
        var c = CheckBuilder("quantization-generated-sequence"), observed: [String: String] = [:]
        var tokens = profile.prompt, generated: [Int] = [], traceLayer = -1, traceValues: [String: MLXArray] = [:]
        var consumedTokens = 0
        let encoder = JSONEncoder(); encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        func receipt(_ failure: String?) throws -> Data {
            var object: [String: Any] = ["schema": 1, "profile": profile.profile, "profile_sha256": profileHash,
                "scope": "greedy numerical/state parity; no task quality or throughput qualification", "qualification": "unproven",
                "fixture_sha256": digest(raw), "inventory_sha256": checkpoint.inventorySHA256,
                "report": try JSONSerialization.jsonObject(with: encoder.encode(c.report())), "observed": observed,
                "generated": generated, "consumed_tokens": consumedTokens, "maximum_record_batches": model.maximumRecordBatches,
                "maximum_live_experts": model.maximumLiveExperts, "peak_process_bytes": ProcessMemory.peakResidentBytes(),
                "peak_mlx_bytes": MLX.Memory.peakMemory, "verified_files": checkpoint.verifiedFileCount,
                "verified_payload_bytes": checkpoint.verifiedPayloadBytes,
                "before": try JSONSerialization.jsonObject(with: encoder.encode(before))]
            object["resident_record_cache"] = model.recordCacheStats ?? [:]
            object["resident_text"] = model.residentTextStats ?? [:]
            object["process_bound_bytes"] = model.processByteLimit
            object["composite_sha256"] = checkpoint.compositeSHA256
            object["record_storage"] = checkpoint.recordStorage
            object["packed_manifest_sha256"] = checkpoint.packedManifestSHA256
            object["packed_verified_files"] = checkpoint.packedVerifiedFiles
            object["packed_verified_bytes"] = checkpoint.packedVerifiedBytes
            object["expert_file_read_policy"] = checkpoint.expertReadPolicy
            object["uncached_expert_files"] = checkpoint.uncachedExpertFileCount
            object["overlay_verified_files"] = checkpoint.overlayVerifiedFileCount
            object["overlay_verified_payload_bytes"] = checkpoint.overlayVerifiedPayloadBytes
            if let failure { object["failure"] = failure }
            let data = try JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted, .sortedKeys])
            try data.write(to: output.appendingPathComponent("receipt.json"), options: .atomic)
            return data
        }
        do {
            try withError {
                for (step, expected) in manifest.steps.enumerated() {
                    var sampled: Int?
                    try model.forward(tokens, observe: { layer, name, value in
                        let local = "\(layer):\(name)", key = "\(step):\(local)"
                        guard let entry = entries[step][local], observed[key] == nil else { throw ModelError("unexpected VQ generated boundary") }
                        eval(value)
                        let dtype = value.dtype == .bfloat16 ? "BF16" : value.dtype == .float32 ? "F32" : value.dtype == .float16 ? "F16" : "unsupported"
                        let geometry = value.shape == entry.shape && dtype == entry.dtype && value.nbytes == entry.bytes
                        guard value.nbytes <= 200_000_000 else { throw ModelError("native VQ generated boundary exceeds its byte bound") }
                        let finite = all(isFinite(value)).item(Bool.self), actual = digest(value.asData(access: .copy).data)
                        observed[key] = actual
                        c.expect(key + " geometry", geometry); c.expect(key + " finite", finite); c.equal(key + " complete byte hash", actual, entry.sha256)
                        guard geometry && finite && actual == entry.sha256 else {
                            try save(arrays: [name: value], url: output.appendingPathComponent("mismatch.safetensors"))
                            throw ModelError("VQ generated sequence mismatch at " + key)
                        }
                        if layer == 48, name == "logits" { sampled = argMax(value[0, tokens.count - 1, 0...]).item(Int.self) }
                    }, trace: { layer, name, value in
                        if traceLayer != layer { traceValues.removeAll(); traceLayer = layer }
                        traceValues[name] = value
                    })
                    guard let sampled else { throw ModelError("native VQ generation did not produce a sample") }
                    consumedTokens += tokens.count
                    generated.append(sampled)
                    c.equal("step \(step) actual greedy sample", sampled, expected.sampled)
                    guard sampled == expected.sampled else { throw ModelError("VQ greedy token differs at step \(step)") }
                    fputs("VQ greedy step \(step) exact, token \(sampled)\n", stderr)
                    if sampled == profile.eos_token_id { break }
                    tokens = [sampled]
                }
            }
            c.equal("every generated state boundary", observed.count, expectedKeys.count * manifest.steps.count)
            c.equal("actual autoregressive sequence", generated, manifest.generated)
            c.equal("final sampled token remains unconsumed", consumedTokens, manifest.consumed_tokens)
            c.expect("bounded complete expert staging", model.maximumLiveExperts <= 32)
            if residentRecords {
                guard let stats = model.recordCacheStats else { throw ModelError("resident cache was not configured") }
                c.equal("all inspected allocation classes resident", stats["allocation_classes"], checkpoint.recordClassCount)
                c.equal("complete reserved record capacity", stats["total_capacity"], (reinvestDenseSavings ? 1824 : (wideRecords ? 512 + (checkpoint.recordClassCount - 1) * 96 : checkpoint.recordClassCount * 96)))
                c.equal("class maximum matches requested profile", stats["maximum_bank_capacity"], reinvestDenseSavings ? 1536 : (wideRecords ? 512 : 96))
                c.equal("requested reinvestment applied", stats["dense_savings_reinvested"], reinvestDenseSavings ? 1 : 0)
                if reinvestDenseSavings {
                    c.equal("exact reinvested bank bytes", stats["reserved_bank_bytes"], 3_583_180_800)
                    c.equal("reinvested secondary capacity", stats["minimum_bank_capacity"], 288)
                    c.equal("every enlarged record is occupied", stats["occupied_records"], 1824)
                    c.equal("largest physical slot executed", stats["maximum_executed_slot"], 1535)
                    c.equal("secondary final physical slot executed", stats["minimum_class_maximum_executed_slot"], 287)
                }
                c.equal("all record leases released", stats["pinned_records"], 0)
                c.equal("requested read mode applied", stats["parallel_read_lanes"], parallelRecords ? 12 : 0)
                c.expect("parallel staging remains bounded", (stats["maximum_read_staging_bytes"] ?? Int.max) <= VQRecordReadBatch.maximumStagingBytes)
                c.expect("parallel mode exercises demanded staging", !parallelRecords || (stats["maximum_read_staging_bytes"] ?? 0) > 0)
                c.expect("resident cache serves real hits", (stats["hits"] ?? 0) > 0)
                c.expect("resident cache loads and evicts", (stats["loads"] ?? 0) > 0 && (stats["evictions"] ?? 0) > 0)
                c.expect("resident books fit reserved bytes", (stats["resident_book_bytes"] ?? Int.max) <= (stats["maximum_book_bytes"] ?? 0))
            }
            if residentText {
                guard let stats = model.residentTextStats else { throw ModelError("resident text was not configured") }
                c.equal("all text families resident", stats["resident_families"], 50)
                c.equal("exact text payload reservation", stats["payload_bytes"], checkpoint.residentTextPayloadBytes)
                c.expect("resident text serves repeated forwards", (stats["dense_hits"] ?? 0) > 49 && (stats["embedding_hits"] ?? 0) > 1)
            }
            guard ProcessMemory.peakResidentBytes() <= model.processByteLimit else { throw ModelError("VQ generation exceeded its configured process bound") }
            c.equal("every packed record file authenticated", checkpoint.packedVerifiedFiles, packedRecordDirectory == nil ? 0 : 48)
            c.equal("exact packed file bytes authenticated", checkpoint.packedVerifiedBytes, packedRecordDirectory == nil ? 0 : VQPackedExperts.totalFileBytes)
            c.equal("requested expert shard read policy applied", checkpoint.uncachedExpertFileCount, uncachedExpertReads ? 9 : 0)
            let data = try receipt(nil)
            guard c.report().passed else { throw ModelError("VQ generated sequence assertions failed") }
            return data
        } catch {
            if !traceValues.isEmpty { try save(arrays: traceValues, url: output.appendingPathComponent("trace-layer-\(traceLayer).safetensors")) }
            _ = try receipt(String(describing: error))
            throw error
        }
    }
}
