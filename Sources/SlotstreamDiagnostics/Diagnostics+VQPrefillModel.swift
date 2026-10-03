import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Full logical tensor hashes at the fixed ordinary-prefill batch shape.
    /// Hashes cover every byte, not selected logits or a numerical tolerance.
    public static func quantizationPrefillModel(source: URL, inventory: URL, fixtureDirectory: URL, output: URL, sparse: Bool = false, residentRecords: Bool = false, residentText: Bool = false, wideRecords: Bool = false, parallelRecords: Bool = false, denseOverlayBaseline: URL? = nil, denseOverlayManifest: URL? = nil, reinvestDenseSavings: Bool = false, uncachedExpertReads: Bool = false, packedRecordDirectory: URL? = nil, parallelPrefillReads: Bool = false) throws -> Data {
        guard !parallelPrefillReads || (sparse && wideRecords && parallelRecords && residentRecords && residentText) else {
            throw ModelError("parallel VQ prefill requires sparse wide parallel residency")
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
            let layer: Int, step: Int, name: String, shape: [Int], dtype: String, bytes: Int, sha256: String
            var key: String { "\(step):\(layer):\(name)" }
        }
        struct Manifest: Decodable {
            struct Artifact: Decodable { let inventory_sha256: String }
            let execution_profile: VQReferenceExecution?
            let runtime_sha256: String?
            let schema: Int, profile: String, architecture_sha256: String, normalization: String
            let passes: [[Int]], boundaries: [Boundary]
            let artifact: Artifact?, vq_parent: Artifact?
            let composite_sha256: String?, policy: String?
        }
        func digest(_ data: Data) -> String { SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined() }
        let file = try FileHandle(forReadingFrom: fixtureDirectory.appendingPathComponent("model.json"))
        defer { try? file.close() }
        guard let raw = try file.read(upToCount: 2_000_001), raw.count <= 2_000_000 else { throw ModelError("VQ prefill model manifest exceeds its bound") }
        let manifest = try JSONDecoder().decode(Manifest.self, from: raw)
        let parent: Manifest.Artifact
        if denseOverlayBaseline != nil {
            guard manifest.artifact == nil, let bound = manifest.vq_parent,
                  bound.inventory_sha256 == VQDenseOverlay.parentInventorySHA256,
                  manifest.composite_sha256 == VQDenseOverlay.identitySHA256,
                  manifest.policy == "vq32-experts-ple-with-pinned-affine4-dense-v1" else {
                throw ModelError("dense composite requires its own prefill fixture identity")
            }
            parent = bound
        } else {
            guard let bound = manifest.artifact, manifest.vq_parent == nil,
                  manifest.composite_sha256 == nil, manifest.policy == nil else {
                throw ModelError("ordinary VQ prefill refuses composite fixtures")
            }
            parent = bound
        }
        var prompt = (0..<(sparse ? 2053 : 512)).map { 100 + ($0 * 37) % 10000 }; prompt[255] = 248044
        let passes = stride(from: 0, to: prompt.count, by: 512).map { start in
            Array(prompt[start..<min(start + 512, prompt.count)])
        } + [[101]]
        let expectedSparse = sparse ? 24 : 0
        guard manifest.schema == 1, manifest.profile == (sparse ? "sparse2053-decode1-v1" : "prefill512-decode1-v1"), manifest.passes == passes,
              manifest.architecture_sha256 == "d6470a2131a64ff37024dfffd2b5bc8c3f4db625f0f3b1ceec7fe346852c1a87",
              manifest.normalization == "vq-raw-zero-centered-to-pr1788-folded-bf16-v1",
              manifest.boundaries.count == passes.count * 160 + expectedSparse else { throw ModelError("VQ prefill model fixture does not bind the fixed reference profile") }
        var expectedKeys = Set<String>()
        for layer in -1...48 {
            let keys: [String]
            switch layer {
            case -1: keys = ["embedded"]
            case 48: keys = ["mixed", "logits"]
            case 1: keys = ["hidden", "conv", "state", "ple_conv"]
            case let layer where (layer + 1) % 4 == 0: keys = ["hidden", "keys", "values", "indexer"]
            default: keys = ["hidden", "conv", "state"]
            }
            for step in passes.indices {
                for key in keys { expectedKeys.insert("\(step):\(layer):\(key)") }
                if sparse && step >= 4 && layer >= 0 && layer < 48 && (layer + 1) % 4 == 0 {
                    expectedKeys.insert("\(step):\(layer):sparse_mask")
                }
            }
        }
        var entries: [String: Boundary] = [:]
        for entry in manifest.boundaries {
            guard expectedKeys.contains(entry.key), entries[entry.key] == nil,
                  ["F16", "BF16", "F32", "BOOL"].contains(entry.dtype), (1...5).contains(entry.shape.count),
                  entry.shape.allSatisfy({ $0 > 0 }),
                  entry.sha256.range(of: "^[0-9a-f]{64}$", options: .regularExpression) != nil else {
                throw ModelError("invalid VQ prefill boundary identity or geometry")
            }
            var bytes = entry.dtype == "F32" ? 4 : entry.dtype == "BOOL" ? 1 : 2
            for dimension in entry.shape {
                guard dimension <= 600_000_000 / bytes else { throw ModelError("VQ prefill boundary exceeds its byte bound") }
                bytes *= dimension
            }
            guard bytes == entry.bytes else { throw ModelError("VQ prefill boundary byte count mismatch") }
            entries[entry.key] = entry
        }
        guard Set(entries.keys) == expectedKeys else { throw ModelError("missing VQ prefill boundaries") }
        guard !ProcessInfo.processInfo.environment.keys.contains(where: {
            $0.hasPrefix("SLOTSTREAM_") || $0.hasPrefix("SS_DEBUG") || $0.hasPrefix("VQ_") || $0.hasPrefix("VQLAB_")
        }) else { throw ModelError("VQ prefill model requires no developer overrides") }
        try VQReferenceExecution.validate(inventorySHA: parent.inventory_sha256,
            runtimeSHA: manifest.runtime_sha256, profile: manifest.execution_profile)
        try ModelProcessGuard.acquire()
        guard let before = ProcessMemory.vmActivity(), before.reclaimableBytes >= 13_000_000_000 else {
            throw ModelError("VQ prefill model requires 13 GB actual reclaimable memory")
        }
        let checkpoint = try VQCheckpoint(directory: source, inventory: inventory,
            denseOverlayBaseline: denseOverlayBaseline, denseOverlayManifest: denseOverlayManifest, uncachedExpertReads: uncachedExpertReads, packedRecordDirectory: packedRecordDirectory)
        guard checkpoint.inventorySHA256 == parent.inventory_sha256 else { throw ModelError("VQ prefill fixture and checkpoint differ") }
        let manager = FileManager.default
        guard !manager.fileExists(atPath: output.path) else { throw ModelError("VQ prefill output directory must be new") }
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
        if residentRecords { try model.enableResidentRecords(wide: wideRecords, parallelReads: parallelRecords, reinvestDenseSavings: reinvestDenseSavings, parallelPrefillReads: parallelPrefillReads) }
        var c = CheckBuilder("quantization-prefill-model"), observed: [String: String] = [:]
        var traceLayer = -1, traceValues: [String: MLXArray] = [:]
        let encoder = JSONEncoder(); encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        func receipt(_ failure: String?) throws -> Data {
            var object: [String: Any] = ["schema": 1, "profile": manifest.profile, "qualification": "unproven",
                "scope": "complete prefill arithmetic and one continuation; no generation qualification",
                "fixture_sha256": digest(raw), "inventory_sha256": checkpoint.inventorySHA256,
                "report": try JSONSerialization.jsonObject(with: encoder.encode(c.report())), "observed": observed,
                "segmented_prefill_layers": model.segmentedPrefillLayers, "sparse_attention_layers": model.sparseAttentionLayers,
                "maximum_record_batches": model.maximumRecordBatches, "maximum_live_experts": model.maximumLiveExperts,
                "peak_process_bytes": ProcessMemory.peakResidentBytes(), "peak_mlx_bytes": MLX.Memory.peakMemory,
                "verified_files": checkpoint.verifiedFileCount, "verified_payload_bytes": checkpoint.verifiedPayloadBytes,
                "before": try JSONSerialization.jsonObject(with: encoder.encode(before))]
            object["parallel_prefill_reads"] = parallelPrefillReads
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
                for (step, tokens) in manifest.passes.enumerated() {
                    let cacheBefore = model.recordCacheStats
                    try model.forward(tokens, observe: { layer, name, value in
                        let key = "\(step):\(layer):\(name)"
                        guard let entry = entries[key], observed[key] == nil else { throw ModelError("unexpected VQ prefill boundary") }
                        eval(value)
                        let dtype = value.dtype == .bfloat16 ? "BF16" : value.dtype == .float32 ? "F32" : value.dtype == .float16 ? "F16" : value.dtype == .bool ? "BOOL" : "unsupported"
                        let geometry = value.shape == entry.shape && dtype == entry.dtype && value.nbytes == entry.bytes
                        guard value.nbytes <= 600_000_000 else { throw ModelError("native VQ prefill boundary exceeds its byte bound") }
                        let finite = all(isFinite(value)).item(Bool.self)
                        let actual = digest(value.asData(access: .copy).data)
                        observed[key] = actual
                        c.expect(key + " geometry", geometry); c.expect(key + " finite", finite); c.equal(key + " complete byte hash", actual, entry.sha256)
                        guard geometry && finite && actual == entry.sha256 else {
                            // This new read-path experiment reserves at most
                            // 16 MB for a failure tensor. Preserve every full
                            // hash even when a vocabulary readout exceeds it.
                            if !parallelPrefillReads || value.nbytes <= 16_000_000 {
                                try save(arrays: [name: value], url: output.appendingPathComponent("mismatch.safetensors"))
                            }
                            throw ModelError("VQ prefill model mismatch at " + key)
                        }
                        if name == "hidden" { fputs("VQ prefill P\(step) L\(layer) exact\n", stderr) }
                    }, trace: { layer, name, value in
                        if traceLayer != layer { traceValues.removeAll(); traceLayer = layer }
                        traceValues[name] = value
                    })
                    if parallelPrefillReads, tokens.count > 409 {
                        for field in ["hits", "loads", "evictions", "occupied_records", "pinned_records", "total_capacity"] {
                            c.equal("P\(step) prefill preserves expert-bank \(field)", model.recordCacheStats?[field], cacheBefore?[field])
                        }
                    }
                }
            }
            c.equal("every full logical tensor compared", observed.count, expectedKeys.count)
            c.equal("every large pass used segmented prefill", model.segmentedPrefillLayers, sparse ? 192 : 48)
            c.equal("actual sparse masks compared", model.sparseAttentionLayers, expectedSparse)
            c.expect("bounded complete staging", model.maximumLiveExperts <= 32)
            if residentRecords {
                guard let stats = model.recordCacheStats else { throw ModelError("resident cache was not configured") }
                c.equal("all inspected allocation classes resident", stats["allocation_classes"], checkpoint.recordClassCount)
                c.equal("complete reserved record capacity", stats["total_capacity"], (reinvestDenseSavings ? 1824 : (wideRecords ? 512 + (checkpoint.recordClassCount - 1) * 96 : checkpoint.recordClassCount * 96)))
                c.equal("class maximum matches requested profile", stats["maximum_bank_capacity"], reinvestDenseSavings ? 1536 : (wideRecords ? 512 : 96))
                c.equal("requested reinvestment applied", stats["dense_savings_reinvested"], reinvestDenseSavings ? 1 : 0)
                if reinvestDenseSavings {
                    c.equal("exact reinvested bank bytes", stats["reserved_bank_bytes"], 3_583_180_800)
                    c.equal("reinvested secondary capacity", stats["minimum_bank_capacity"], 288)
                }
                c.equal("all record leases released", stats["pinned_records"], 0)
                c.equal("requested read mode applied", stats["parallel_read_lanes"], parallelRecords ? 12 : 0)
                c.expect("parallel staging remains bounded", (stats["maximum_read_staging_bytes"] ?? Int.max) <= VQRecordReadBatch.maximumStagingBytes)
                c.expect("parallel mode exercises demanded staging", !parallelRecords || (stats["maximum_read_staging_bytes"] ?? 0) > 0)
                c.expect("parallel prefill staging remains bounded", (stats["maximum_prefill_staging_bytes"] ?? Int.max) <= VQPrefillRecords.maximumReservationBytes)
                c.expect("requested parallel prefill actually reads full batches", parallelPrefillReads
                    ? (stats["prefill_read_batches"] ?? 0) > model.segmentedPrefillLayers && (stats["prefill_read_records"] ?? 0) > 0
                    : (stats["prefill_read_batches"] ?? -1) == 0)
                c.expect("resident cache serves real hits", (stats["hits"] ?? 0) > 0)
                c.expect("resident cache loads demanded records", (stats["loads"] ?? 0) > 0)
                c.expect("ordinary cache exercises eviction", reinvestDenseSavings || (stats["evictions"] ?? 0) > 0)
                c.expect("resident books fit reserved bytes", (stats["resident_book_bytes"] ?? Int.max) <= (stats["maximum_book_bytes"] ?? 0))
            }
            if residentText {
                guard let stats = model.residentTextStats else { throw ModelError("resident text was not configured") }
                c.equal("all text families resident", stats["resident_families"], 50)
                c.equal("exact text payload reservation", stats["payload_bytes"], checkpoint.residentTextPayloadBytes)
                c.expect("resident text serves repeated forwards", (stats["dense_hits"] ?? 0) > 49 && (stats["embedding_hits"] ?? 0) > 1)
            }
            guard ProcessMemory.peakResidentBytes() <= model.processByteLimit else { throw ModelError("VQ prefill model exceeded its configured process bound") }
            c.equal("every packed record file authenticated", checkpoint.packedVerifiedFiles, packedRecordDirectory == nil ? 0 : 48)
            c.equal("exact packed file bytes authenticated", checkpoint.packedVerifiedBytes, packedRecordDirectory == nil ? 0 : VQPackedExperts.totalFileBytes)
            c.equal("requested expert shard read policy applied", checkpoint.uncachedExpertFileCount, uncachedExpertReads ? 9 : 0)
            let result = try receipt(nil)
            guard c.report().passed else { throw ModelError("VQ prefill model assertions failed") }
            return result
        } catch {
            if !traceValues.isEmpty {
                try save(arrays: traceValues, url: output.appendingPathComponent("trace-layer-\(traceLayer).safetensors"))
            }
            _ = try receipt(String(describing: error))
            throw error
        }
    }
}
