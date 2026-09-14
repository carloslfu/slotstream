// Process and cache safety invariants that are otherwise only observable
// during a 100+ GB model run. Weights-free on purpose: these are the rules a
// long run depends on, checked in milliseconds on every push.

import Foundation
import Slotstream

extension Diagnostics {
    public static func runtime() throws -> CheckReport {
        var c = CheckBuilder("runtime-check")

        if let before = ProcessMemory.vmActivity(), let after = ProcessMemory.vmActivity() {
            c.expect("request VM counters are monotonic", after.swapins >= before.swapins && after.swapouts >= before.swapouts)
            c.expect("request VM reclaimable bytes are available", before.reclaimableBytes > 0)
        } else { c.expect("request VM counters are available", false) }
        c.expect("process physical footprint is readable", ProcessMemory.residentBytes() > 0)
        c.expect("process compatibility high-water is readable", ProcessMemory.peakResidentBytes() > 0)
        c.expect("lifetime RSS is separately readable", ProcessMemory.lifetimeRSSPeakBytes() > 0)
        let currentFootprint = ProcessMemory.residentBytes()
        c.expect("kernel lifetime footprint includes current allocation",
            ProcessMemory.lifetimePhysicalFootprintPeakBytes() >= currentFootprint)
        var memoryStats = GenStats()
        memoryStats.recordProcessMemory()
        c.expect("statistics publish current and lifetime observations",
            memoryStats.physicalFootprintEndBytes > 0
                && (memoryStats.lifetimePhysicalFootprintPeakBytes ?? 0) >= memoryStats.physicalFootprintEndBytes
                && memoryStats.peakMemoryGB >= Double(memoryStats.lifetimeRSSPeakBytes) / 1e9)
        var oldStats = try JSONSerialization.jsonObject(with: JSONEncoder().encode(memoryStats)) as! [String: Any]
        oldStats.removeValue(forKey: "lifetimePhysicalFootprintPeakBytes")
        let oldDecoded = try JSONDecoder().decode(GenStats.self,
            from: JSONSerialization.data(withJSONObject: oldStats))
        c.expect("statistics predating the lifetime footprint field still decode",
            oldDecoded.lifetimePhysicalFootprintPeakBytes == nil && oldDecoded.peakMemoryGB == memoryStats.peakMemoryGB)
        let start = RuntimeClock.now()
        c.expect("monotonic duration is nonnegative", RuntimeClock.seconds(since: start) >= 0)
        let sampler = FootprintSampler()
        let observed = sampler.finish()
        c.expect("footprint sampler includes endpoints", observed.samples >= 2 && observed.peakBytes > 0)
        c.equal("automatic platform-qualified optimization defaults",
            try InferenceOptimizations.environment([:]), InferenceOptimizations.deploymentCandidate())
        let qualified = OptimizationPlatform(machineModel: "Mac17,9", chip: "Apple M5 Pro",
            osBuild: "25G83", nativeARM64: true)
        c.equal("qualified platform keeps the complete joint candidate",
            InferenceOptimizations.deploymentCandidate(on: qualified), .integrationCandidate)
        var fallback = InferenceOptimizations.integrationCandidate
        fallback.fusedRoPE = false
        let unknownPlatforms: [OptimizationPlatform] = [
            .init(machineModel: nil, chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: nil, osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: nil, nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: false),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "23A344", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "24A335", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G84", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "26A1", nativeARM64: true),
            .init(machineModel: "Mac14,6", chip: "Apple M2 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,10", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro extra", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "", chip: "", osBuild: "", nativeARM64: true),
        ]
        for (i, platform) in unknownPlatforms.enumerated() {
            c.equal("unqualified platform \(i) keeps portable work and original rotation",
                InferenceOptimizations.deploymentCandidate(on: platform), fallback)
        }
        c.equal("platform selection is deterministic", OptimizationPlatform.current, OptimizationPlatform.current)
        c.expect("explicit kernel qualification remains available",
            try InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "1"]).fusedRoPE)
        c.expect("explicit kernel fallback remains available",
            try !InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "0"]).fusedRoPE)
        let legacyOptions = try JSONEncoder().encode(InferenceOptimizations())
        let legacyObject = try JSONSerialization.jsonObject(with: legacyOptions) as! [String: Any]
        c.expect("reference control encoding omits unset automatic policy", legacyObject["automaticReadScope"] == nil)
        c.equal("old control JSON remains decodable", try JSONDecoder().decode(InferenceOptimizations.self,
            from: legacyOptions), InferenceOptimizations())
        var automatic = InferenceOptimizations.integrationCandidate
        automatic.automaticReadScope = true
        c.equal("automatic policy survives saved control round trip", try JSONDecoder().decode(InferenceOptimizations.self,
            from: JSONEncoder().encode(automatic)), automatic)
        c.equal("absent overrides preserve an inherited automatic policy",
            try InferenceOptimizations.resolving(environment: [:], defaults: automatic), automatic)
        var noAutomatic = automatic; noAutomatic.automaticReadScope = nil
        c.equal("explicit automatic zero restores the chronological policy",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_AUTO_READ_SCOPE": "0"], defaults: automatic), noAutomatic)
        c.equal("explicit automatic one enables only that policy",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_AUTO_READ_SCOPE": "1"], defaults: noAutomatic), automatic)
        for (name, value) in [("SLOTSTREAM_OPT_READ_SCOPE", "0"), ("SLOTSTREAM_OPT_LAYER_WORKSPACE", "0"),
                              ("SLOTSTREAM_OPT_INDEXER_TILES", "0"), ("SLOTSTREAM_OPT_PLE_TILES", "0"),
                              ("SLOTSTREAM_OPT_WORKSPACE_TILE", "256"), ("SLOTSTREAM_OPT_SCOPE_FRONTIER", "0"),
                              ("SLOTSTREAM_OPT_WORKSPACE_PIECES", "0")] {
            c.equal("manual scope control suppresses inherited automatic policy/\(name)",
                try InferenceOptimizations.resolving(environment: [name: value], defaults: automatic), noAutomatic)
        }
        for value in ["true", "-1", "2", ""] {
            do {
                _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_AUTO_READ_SCOPE": value])
                c.expect("malformed automatic policy must refuse/\(value)", false)
            } catch { c.expect("malformed automatic policy refuses/\(value)", true) }
        }
        var tiledVision = InferenceOptimizations.integrationCandidate
        tiledVision.visionQueryTile = 256
        tiledVision.visionAttentionPadding = 0
        c.equal("absent vision overrides retain inherited tiling",
            try InferenceOptimizations.resolving(environment: [:], defaults: tiledVision), tiledVision)
        c.equal("explicit zero padding leaves inherited tiling enabled",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_VISION_PADDING": "0"],
                defaults: tiledVision), tiledVision)
        var plainVision = tiledVision; plainVision.visionQueryTile = 0
        c.equal("explicit zero query tile selects original vision attention",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_VISION_QUERY_TILE": "0"],
                defaults: tiledVision), plainVision)
        for padding in [80, 128] {
            var paddedVision = plainVision; paddedVision.visionAttentionPadding = padding
            c.equal("explicit padding overrides inherited tiling/\(padding)",
                try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_VISION_PADDING": String(padding)],
                    defaults: tiledVision), paddedVision)
            c.equal("explicit tiling overrides inherited padding/\(padding)",
                try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_VISION_QUERY_TILE": "256"],
                    defaults: paddedVision), tiledVision)
            c.equal("explicit query zero retains inherited padding/\(padding)",
                try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_VISION_QUERY_TILE": "0"],
                    defaults: paddedVision), paddedVision)
            c.equal("explicit padding with query zero remains valid/\(padding)",
                try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_VISION_PADDING": String(padding),
                    "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0"], defaults: tiledVision), paddedVision)
            c.equal("explicit query tile with padding zero remains valid/\(padding)",
                try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_VISION_PADDING": "0",
                    "SLOTSTREAM_OPT_VISION_QUERY_TILE": "256"], defaults: paddedVision), tiledVision)
            for defaults in [plainVision, tiledVision, paddedVision] {
                do {
                    _ = try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_VISION_PADDING": String(padding),
                        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "256"], defaults: defaults)
                    c.expect("two explicit vision alternatives refuse/\(padding)", false)
                } catch { c.expect("two explicit vision alternatives refuse/\(padding)", true) }
            }
        }
        for (key, value) in [("SLOTSTREAM_OPT_VISION_PADDING", "bad"), ("SLOTSTREAM_OPT_VISION_PADDING", "256"),
                             ("SLOTSTREAM_OPT_VISION_QUERY_TILE", "bad"), ("SLOTSTREAM_OPT_VISION_QUERY_TILE", "128")] {
            do {
                _ = try InferenceOptimizations.resolving(environment: [key: value], defaults: tiledVision)
                c.expect("inherited vision defaults still reject malformed override/\(key)/\(value)", false)
            } catch { c.expect("inherited vision defaults still reject malformed override/\(key)/\(value)", true) }
        }
        let candidate = InferenceOptimizations.integrationCandidate
        c.expect("combined candidate preserves the original MTP verification shape",
            !candidate.boundedDraftTail)
        c.equal("absent overrides retain the selected default family",
            try InferenceOptimizations.resolving(environment: [:], defaults: candidate), candidate)
        let candidateFlags: [(String, WritableKeyPath<InferenceOptimizations, Bool>)] = [
            ("SLOTSTREAM_OPT_COMPACT_STATE", \.compactStateWindows),
            ("SLOTSTREAM_OPT_COMPACT_MTP", \.compactMTPRow),
            ("SLOTSTREAM_OPT_NGRAM_ROWS", \.compactNgramRows),
            ("SLOTSTREAM_OPT_FINAL_FORWARD", \.skipUnusedFinalForward),
            ("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", \.valueOnlySamplerThreshold),
            ("SLOTSTREAM_OPT_SAMPLER_DRAW", \.deviceSamplerDraw),
            ("SLOTSTREAM_OPT_OUTPUT_QUEUE", \.boundedOutputQueue),
            ("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR", \.responsiveGovernor),
            ("SLOTSTREAM_OPT_COMPLETE_PROMPT", \.completePromptCheckpoint),
            ("SLOTSTREAM_OPT_SHARED_ROPE", \.sharedRoPE),
            ("SLOTSTREAM_OPT_FUSED_ROPE", \.fusedRoPE),
        ]
        for (name, field) in candidateFlags {
            var disabled = candidate
            disabled[keyPath: field] = false
            c.equal("explicit zero disables only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "0"], defaults: candidate), disabled)
            c.equal("explicit one restores only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "1"], defaults: disabled), candidate)
        }
        var referenceOverrides = Dictionary(uniqueKeysWithValues: candidateFlags.map { ($0.0, "0") })
        referenceOverrides["SLOTSTREAM_OPT_PREFIX_CHECKPOINT"] = "0"
        referenceOverrides["SLOTSTREAM_OPT_AUTO_READ_SCOPE"] = "0"
        referenceOverrides["SLOTSTREAM_OPT_VISION_QUERY_TILE"] = "0"
        c.equal("explicit zeros restore the complete reference inference family",
            try InferenceOptimizations.resolving(environment: referenceOverrides, defaults: candidate),
            InferenceOptimizations())
        var noCheckpoint = candidate
        noCheckpoint.prefixCheckpointTokens = 0
        c.equal("explicit numeric zero disables inherited prefix retention",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0"],
                defaults: candidate), noCheckpoint)
        c.equal("non-optimization environment leaves the family intact",
            try InferenceOptimizations.resolving(environment: ["PATH": "/unused"], defaults: candidate), candidate)
        for env in [["SLOTSTREAM_OPT_COMPLETE_PROMPT": "false"], ["SLOTSTREAM_OPT_TYPO": "0"]] {
            do {
                _ = try InferenceOptimizations.resolving(environment: env, defaults: candidate)
                c.expect("selected defaults still reject invalid override \(env)", false)
            } catch { c.expect("selected defaults still reject invalid override \(env)", true) }
        }
        var scopedDefaults = candidate
        scopedDefaults.readScopeTokens = 4096
        scopedDefaults.layerExpertWorkspace = true
        scopedDefaults.boundedIndexer = true
        scopedDefaults.boundedPLE = true
        c.equal("valid inherited read scope retains its prerequisites",
            try InferenceOptimizations.resolving(environment: [:], defaults: scopedDefaults), scopedDefaults)
        for name in ["SLOTSTREAM_OPT_COMPACT_STATE", "SLOTSTREAM_OPT_COMPACT_MTP",
                     "SLOTSTREAM_OPT_LAYER_WORKSPACE", "SLOTSTREAM_OPT_INDEXER_TILES", "SLOTSTREAM_OPT_PLE_TILES"] {
            do {
                _ = try InferenceOptimizations.resolving(environment: [name: "0"], defaults: scopedDefaults)
                c.expect("inherited scope rejects disabled prerequisite \(name)", false)
            } catch { c.expect("inherited scope rejects disabled prerequisite \(name)", true) }
        }
        scopedDefaults.readScopeTokens = 0
        var manualScopeDefaults = scopedDefaults; manualScopeDefaults.automaticReadScope = nil
        c.equal("scope can be disabled while retaining its other independent work",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_READ_SCOPE": "0"],
                defaults: {
                    var value = scopedDefaults; value.readScopeTokens = 4096; return value
                }()), manualScopeDefaults)
        let environmentFunction: ([String: String]) throws -> InferenceOptimizations = InferenceOptimizations.environment
        c.equal("public environment function value keeps its signature and automatic default",
            try environmentFunction([:]), InferenceOptimizations.deploymentCandidate())
        c.expect("typed override enables compaction", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_COMPACT_STATE": "1"]).compactStateWindows)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPACT_STATE": "yes"])
            c.expect("malformed override refused", false)
        } catch { c.expect("malformed override refused", true) }

        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_TYPO": "1"])
            c.expect("unknown optimization refused", false)
        } catch { c.expect("unknown optimization refused", true) }

        for value in ["-1", "1", "16384", "bad"] {
            do {
                _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": value])
                c.expect("invalid read scope \(value) refused", false)
            } catch { c.expect("invalid read scope \(value) refused", true) }
        }
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": "8192"])
            c.expect("unbounded read scope refused", false)
        } catch { c.expect("unbounded read scope refused", true) }

        c.equal("explicit workspace tile is recorded", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048"]).workspaceTokenTile, 2048)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_WORKSPACE_TILE": "8192"])
            c.expect("unbounded workspace tile refused", false)
        } catch { c.expect("unbounded workspace tile refused", true) }

        c.equal("terminal output needs no speculative draft", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 1, bounded: true), 0)
        c.equal("draft count fits remaining output", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 3, bounded: true), 2)
        c.equal("public depth cannot exceed recording cap", Generator.effectiveDraftDepth(requested: Int.max, remainingOutputs: Int.max, bounded: false), 16)
        c.equal("negative remaining output cannot underflow", Generator.effectiveDraftDepth(requested: Int.min, remainingOutputs: Int.min, bounded: true), 0)

        // The prefix cache holds four conversations, not one: Open WebUI's
        // interleaved title request defeated a single slot.
        // Logical cache fixtures are never forwarded through the model, but
        // still declare exactly the number of represented token IDs.
        func fixture(_ count: Int) -> Qwen4ExpModel.State {
            let state = Qwen4ExpModel.State(); state.tokenCount = count; return state
        }
        let cache = PrefixCache(maxTokens: 100)
        for token in 1 ... PrefixCache.maxEntries {
            cache.store(state: fixture(1), tokens: [token])
        }
        c.equal(
            "prefix cache reaches its four-entry bound",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        cache.store(state: fixture(1), tokens: [PrefixCache.maxEntries])
        c.equal(
            "an identical history replaces instead of duplicating an entry",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        _ = cache.take(matching: [999], reserveTokens: 1)
        c.equal(
            "a miss evicts before allocating a fifth state",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries - 1)
        cache.configure(maxTokens: 2)
        c.expect("a smaller live token ceiling evicts immediately", cache.heldTokens <= 2)
        c.expect("held GB includes fixed recurrent state", cache.heldGB > 0.1)
        let growth = PrefixCache(maxTokens: 20)
        growth.store(state: fixture(4), tokens: [1, 2, 3, 4])
        growth.store(state: fixture(4), tokens: [7, 8, 9, 10])
        growth.store(state: fixture(4), tokens: [11, 12, 13, 14])
        c.expect("growing hit still reuses its state", growth.take(matching: [1, 2, 3, 4, 5], reserveTokens: 17) != nil)
        c.equal("growing hit reserves future state before allocation", growth.heldTokens, 0)
        growth.store(state: fixture(1), tokens: [4])
        c.expect("huge reservation safely misses", growth.take(matching: [9], reserveTokens: Int.max) == nil)
        c.equal("huge reservation releases held state", growth.heldTokens, 0)

        let capacity = PrefixCache(maxTokens: 4096)
        for token in 1 ... 4 { capacity.store(state: fixture(1), tokens: [token]) }
        c.expect("capacity reservation still hits", capacity.take(matching: [1, 2], reserveTokens: 2,
            reserveSequenceBytes: 4096 * PrefixCache.bytesPerToken) != nil)
        c.equal("capacity growth reserves bytes before reuse", capacity.heldTokens, 0)
        capacity.store(state: fixture(1), tokens: [7])
        _ = capacity.take(matching: [9], reserveSequenceBytes: Int.max)
        c.equal("saturated byte reservation evicts safely", capacity.heldTokens, 0)

        // Image keying. Every image expands to a run of the same placeholder
        // id, so ids alone cannot tell two pictures apart; the digest can, and
        // a match has to agree in both directions.
        let a = ImageHash(hashing: Data("picture A".utf8))
        let b = ImageHash(hashing: Data("picture B".utf8))
        c.expect("identical bytes hash alike", a == ImageHash(hashing: Data("picture A".utf8)))
        c.expect("different bytes do not", a != b)
        let held = [ImageSegment(start: 4, count: 8, hash: a)]
        c.expect(
            "the same image at the same offset matches",
            PrefixCache.imagesAgree(entry: held, prompt: held, upTo: 12))
        c.expect(
            "a swapped image does not",
            !PrefixCache.imagesAgree(
                entry: held, prompt: [ImageSegment(start: 4, count: 8, hash: b)], upTo: 12))
        c.expect(
            "an entry ending inside a run still matches that run",
            PrefixCache.imagesAgree(
                entry: [ImageSegment(start: 4, count: 3, hash: a)], prompt: held, upTo: 7))
        c.expect(
            "a text-only entry rejects a prompt with an image inside its range",
            !PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 12))
        c.expect(
            "an image beyond the entry's range is irrelevant to the match",
            PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 4))

        let vcache = PrefixCache(maxTokens: 100)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "a vision conversation is held, not discarded",
            vcache.take(matching: [1, 2, 3, 4], images: held, reserveTokens: 4) != nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the same ids with a different picture miss",
            vcache.take(
                matching: [1, 2, 3, 4], images: [ImageSegment(start: 4, count: 8, hash: b)],
                reserveTokens: 4) == nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the text-only splice never sees a vision entry",
            vcache.peek(extending: [1, 2]) == nil)

        // A client can re-render an assistant turn differently from the exact
        // ids the server generated (fx omits reasoning when it sends history
        // back). `peek` finds the longest retained extension for the splice,
        // but does not consume it before the ordinary cache match.
        let spliceCache = PrefixCache(maxTokens: 100)
        spliceCache.store(state: fixture(3), tokens: [7, 8, 9])
        spliceCache.store(state: fixture(4), tokens: [7, 8, 9, 10])
        c.equal(
            "prefix splice chooses the longest retained extension",
            spliceCache.peek(extending: [7, 8]), [7, 8, 9, 10])
        c.expect(
            "prefix splice is strict, not an identical-history match",
            spliceCache.peek(extending: [7, 8, 9, 10]) == nil)
        c.equal(
            "prefix splice lookup does not consume the retained state",
            spliceCache.take(matching: [7, 8, 9, 10, 11])?.reused, 4)
        spliceCache.enabled = false
        c.expect(
            "a disabled prefix cache offers no splice",
            spliceCache.peek(extending: [7]) == nil)

        // Disk quota enforcement (the --kv-cache-size path), weights-free:
        // a fake leaf with a v4 data.kv and an index row must leave the DB
        // AND the disk when a smaller quota forces eviction, and lookup must
        // not resurrect it through the unindexed-but-on-disk heal path.
        let kvDir = FileManager.default.temporaryDirectory
            .appendingPathComponent(
                "slotstream-runtimecheck-kv-\(Int(Date().timeIntervalSince1970 * 1000))",
                isDirectory: true)
        try? FileManager.default.createDirectory(
            at: kvDir, withIntermediateDirectories: true)
        DiskCache.dirOverride = kvDir.path
        defer {
            try? FileManager.default.removeItem(at: kvDir)
            DiskCache.dirOverride = nil
            DiskCache.maxBytesOverride = nil
        }
        let emb: [Float] = [0.5, -0.25, 1.0, 0.125]
        let key = ChunkIndex.makeKey(parentSha: nil, embeddings: emb)
        let chunkDir = kvDir.appendingPathComponent(key, isDirectory: true)
        try? FileManager.default.createDirectory(at: chunkDir, withIntermediateDirectories: true)
        try? Data("{\"version\":4}\n".utf8).write(
            to: chunkDir.appendingPathComponent("data.kv"))
        ChunkIndex.shared.register(
            key: key, parentSha: nil, depth: 0,
            parentTokenCount: 0, tokenCount: 128, sizeBytes: 1_000_000)
        DiskCache.maxBytesOverride = 1e-6  // ~1 KB: the 1 MB chunk is over quota
        let freed = DiskCache.enforceQuota()
        c.expect("forced eviction frees an over-quota leaf", freed >= 1_000_000)
        c.expect(
            "an evicted leaf's directory leaves the disk",
            !FileManager.default.fileExists(
                atPath: chunkDir.appendingPathComponent("data.kv").path))
        let resurrected = DiskCache.longestPrefixHit(
            chunk: 128, embed: { d in d == 0 ? emb : nil })
        c.expect("lookup does not resurrect an evicted chunk", resurrected == nil)
        DiskCache.maxBytesOverride = nil

        // The save line is the operator's only window into how often the disk
        // tier writes, so what it promises is a contract: cadence and quota
        // position must be readable from it, and a single sample must not claim
        // a rate. The write path itself needs a model; this does not.
        var writeTrace = DiskWriteTrace()
        let firstSave = writeTrace.note(bytes: 100_000_000, onDisk: 100_000_000,
            quota: 20_000_000_000, at: Date(timeIntervalSince1970: 1_000))
        c.expect("a first save reports the quota position",
            firstSave.contains("1 node / 0.10 GB") && firstSave.contains("disk 0.10 of 20.00 GB"))
        c.expect("a single save makes no cadence or rate claim",
            !firstSave.contains("since the last save") && !firstSave.contains("nodes/min"))
        let secondSave = writeTrace.note(bytes: 200_000_000, onDisk: 300_000_000,
            quota: 20_000_000_000, at: Date(timeIntervalSince1970: 1_022))
        c.expect("a later save reports the gap since the previous one",
            secondSave.contains("+22.0s since the last save"))
        c.expect("the trace accumulates the stored nodes, bytes and rate",
            secondSave.contains("2 nodes / 0.30 GB") && secondSave.contains("nodes/min")
                && secondSave.contains("disk 0.30 of 20.00 GB"))

        // The eviction score decides which checkpoint survives a full quota, so
        // its branches are a contract: hits decay with the half-life, a node
        // untouched for days falls back to density alone, and density is what
        // separates two never-read nodes of one age. Kept a pure function so
        // this needs no model.
        let scoreNow = Date().timeIntervalSince1970
        let hour: Double = 3600
        func densityScore(hits: Int, lastUsed: Double, size: Int = 1_000_000) -> Double {
            ChunkIndex.evictionScore(
                hits: hits, tokenCount: 1024, sizeBytes: size, lastUsed: lastUsed, now: scoreNow)
        }
        let denseFat = densityScore(hits: 0, lastUsed: scoreNow, size: 2_000_000)
        let denseLean = densityScore(hits: 0, lastUsed: scoreNow)
        c.expect("a never-matched node is scored on token density alone",
            abs(denseFat - Double(1024) / 2_000_000) < 1e-15 && denseLean > denseFat)
        c.expect("hits decay by half per half-life",
            abs(densityScore(hits: 4, lastUsed: scoreNow - ChunkIndex.hitHalfLifeSeconds)
                - densityScore(hits: 8, lastUsed: scoreNow - 2 * ChunkIndex.hitHalfLifeSeconds))
                < 1e-15)
        c.expect("a matched node outranks an unmatched one of the same age",
            densityScore(hits: 4, lastUsed: scoreNow - ChunkIndex.hitHalfLifeSeconds)
                > densityScore(hits: 0, lastUsed: scoreNow))
        c.expect("hits below the floor leave density alone",
            abs(densityScore(hits: 100, lastUsed: scoreNow - 20 * ChunkIndex.hitHalfLifeSeconds)
                - Double(1024) / 1_000_000) < 1e-15)
        c.expect("a row with no size or no tokens is taken first",
            ChunkIndex.evictionScore(
                hits: 9, tokenCount: 0, sizeBytes: 0, lastUsed: scoreNow, now: scoreNow) == 0)

        // Hits are recorded on every match (the live path writes "now" and
        // increments) and are what eviction then ranks by: of the two oldest
        // leaves, the one that keeps being matched must outlive the never-read
        // one, even though it is older and was the first victim under the old
        // shallowest-then-LRU order.
        var scored: [String] = []
        for i in 0 ..< 8 {
            let k = ChunkIndex.makeKey(parentSha: nil, embeddings: [Float(i), 0.25])
            let dir = kvDir.appendingPathComponent(k, isDirectory: true)
            try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
            try? Data("{\"version\":4}\n".utf8).write(to: dir.appendingPathComponent("data.kv"))
            ChunkIndex.shared.register(
                key: k, parentSha: nil, depth: 0,
                parentTokenCount: 0, tokenCount: 1024, sizeBytes: 1_000_000)
            ChunkIndex.shared.setActivity(
                key: k, hits: 0, lastUsed: scoreNow - Double(8 - i) * hour)
            scored.append(k)
        }
        ChunkIndex.shared.touch(key: scored[0])
        ChunkIndex.shared.touch(key: scored[0])
        c.equal("a match records a hit on the node it matched",
            ChunkIndex.shared.activity(key: scored[0])?.hits ?? -1, 2)
        ChunkIndex.shared.setActivity(key: scored[0], hits: 10, lastUsed: scoreNow - 8 * hour)
        DiskCache.maxBytesOverride = 7.0 / 1024.0  // 7 MB quota for 8 x 1 MB leaves
        _ = DiskCache.enforceQuota()
        let reusedLeaf = ChunkIndex.shared.contains(key: scored[0])
        let neverReadLeaf = ChunkIndex.shared.contains(key: scored[1])
        c.expect("the reused leaf outlives the older never-read one",
            reusedLeaf && !neverReadLeaf)
        DiskCache.maxBytesOverride = nil
        for k in scored { ChunkIndex.shared.remove(key: k) }

        // The write throttle's defaults are policy, not accident: the floor
        // stops a short delta from buying ~113 MB of recurrent state, and the
        // decode split is coarser than the prompt split because intermediate
        // decode nodes have no reader of their own.
        let savedMin = getenv("SLOTSTREAM_DISK_KV_MIN_TOKENS").map { String(cString: $0) }
        let savedDecode = getenv("SLOTSTREAM_DISK_KV_SPLIT_LONG_DECODES").map { String(cString: $0) }
        func restoreKnobs() {
            if let s = savedMin { setenv("SLOTSTREAM_DISK_KV_MIN_TOKENS", s, 1) }
            else { unsetenv("SLOTSTREAM_DISK_KV_MIN_TOKENS") }
            if let s = savedDecode { setenv("SLOTSTREAM_DISK_KV_SPLIT_LONG_DECODES", s, 1) }
            else { unsetenv("SLOTSTREAM_DISK_KV_SPLIT_LONG_DECODES") }
        }
        unsetenv("SLOTSTREAM_DISK_KV_MIN_TOKENS")
        unsetenv("SLOTSTREAM_DISK_KV_SPLIT_LONG_DECODES")
        c.expect("a short delta is not written at the measured floor",
            DiskCache.minNodeTokens == 1024)
        c.expect("the prompt split stays at every chunk boundary by default",
            DiskCache.promptSplitTokens == 0)
        c.expect("the decode split is coarser than the prompt split by default",
            DiskCache.decodeSplitTokens == DiskCache.decodeSplitDefaultTokens
                && DiskCache.decodeSplitDefaultTokens > 0)
        setenv("SLOTSTREAM_DISK_KV_MIN_TOKENS", "64", 1)
        setenv("SLOTSTREAM_DISK_KV_SPLIT_LONG_DECODES", "-1", 1)
        c.expect("the write throttle reads its env overrides",
            DiskCache.minNodeTokens == 64 && DiskCache.decodeSplitTokens == nil)
        setenv("SLOTSTREAM_DISK_KV_SPLIT_LONG_DECODES", "4096", 1)
        c.expect("a non-negative decode split threshold is honored",
            DiskCache.decodeSplitTokens == 4096)
        restoreKnobs()

        // A cache directory that cannot hold the database — read-only, full, or
        // an unwritable path — has to leave a closed index that answers every
        // read as empty. It used to call `sqlite3_prepare_v2(nil, ...)`, whose
        // SQLITE_MISUSE made `sqlite3_errmsg(nil)` answer "out of memory" and
        // repeat that line on every query, so an unwritable cache read as memory
        // exhaustion. `/dev/null/...` cannot be created or opened.
        let closed = ChunkIndex(
            directory: URL(fileURLWithPath: "/dev/null/slotstream-kvcache"))
        c.expect("a metadata directory that cannot open leaves the index closed",
            !closed.isOpen)
        c.expect("a closed index holds no key", !closed.contains(key: "closed"))
        c.expect("a closed index answers no parent", closed.parentSha(key: "closed") == nil)
        c.expect("a closed index answers no activity", closed.activity(key: "closed") == nil)
        c.equal("a closed index reports no bytes", closed.totalBytes(), 0)
        closed.register(key: "closed", parentSha: nil, depth: 0,
            parentTokenCount: 0, tokenCount: 4, sizeBytes: 16)
        closed.touch(key: "closed")
        c.expect("a closed index drops writes without trapping",
            !closed.contains(key: "closed") && closed.totalBytes() == 0)
        c.expect("a writable directory opens the index",
            ChunkIndex(directory: FileManager.default.temporaryDirectory
                .appendingPathComponent("ss-index-\(UUID().uuidString)")).isOpen)

        // The node body framing is what makes a saved chunk readable at all, so
        // the walk that reads it is a contract: it must find every named array
        // at the right offset (it now keeps an offset into the one file buffer
        // instead of re-copying the remainder after each array) and refuse a
        // truncated header, a truncated payload and leftover bytes. Framed with
        // the writer's own byte layout, no model needed.
        func framed(_ arrays: [(String, [Int], [Float])], trailing: Int = 0) -> Data {
            var out = Data()
            for (name, shape, values) in arrays {
                let header = try! JSONSerialization.data(
                    withJSONObject: ["name": name, "shape": shape, "dtype": "float32"])
                var len = UInt32(header.count).littleEndian
                withUnsafeBytes(of: &len) { out.append(contentsOf: $0) }
                out.append(header)
                out.append(contentsOf: values.withUnsafeBufferPointer { Data(buffer: $0) })
            }
            out.append(Data(repeating: 0x7f, count: trailing))
            return out
        }
        let cleanBody = framed(
            [("conv_0", [1, 4], [1, 2, 3, 4]), ("kv_k_0", [1, 2, 2], [5, 6, 7, 8])])
        do {
            let parsed = try NodeBody.arrays(in: cleanBody, from: 0)
            c.expect("a node body frames into its named arrays",
                parsed.count == 2
                    && parsed["conv_0"]?.asArray(Float.self) == [1, 2, 3, 4]
                    && parsed["kv_k_0"]?.shape == [1, 2, 2]
                    && parsed["kv_k_0"]?.asArray(Float.self) == [5, 6, 7, 8])
        } catch {
            c.expect("a node body frames into its named arrays", false, "\(error)")
        }
        var cutBody = cleanBody
        cutBody.removeLast(6)
        c.expect("a truncated node body names the array it stopped in", {
            do { _ = try NodeBody.arrays(in: cutBody, from: 0); return false }
            catch let failure as NodeBody.Failure {
                return failure.message == "truncated array data for kv_k_0"
            } catch { return false }
        }())
        var badHeader = Data()
        var badLen = UInt32(3).littleEndian
        withUnsafeBytes(of: &badLen) { badHeader.append(contentsOf: $0) }
        badHeader.append(Data("not".utf8))
        c.expect("a malformed array header is refused", {
            do { _ = try NodeBody.arrays(in: badHeader, from: 0); return false }
            catch let failure as NodeBody.Failure {
                return failure.message == "invalid array header JSON"
            } catch { return false }
        }())
        c.expect("leftover bytes after the last array are refused", {
            do { _ = try NodeBody.arrays(in: framed(
                [("conv_0", [1, 4], [1, 2, 3, 4])], trailing: 2), from: 0); return false }
            catch let failure as NodeBody.Failure {
                return failure.message == "trailing 2 bytes"
            } catch { return false }
        }())

        // Turn-boundary chains (one variable node per prompt, one per decode)
        // are walked by longestVariableChain over childEndpoints from the
        // deepest fixed boundary, each candidate re-verified against THIS
        // prompt's delta embeddings. Weights-free: synthetic embeddings stand
        // in for the model's — only key derivation, index rows and the
        // placeholder data.kv files matter. Fixed chain: two chunks of 128;
        // turn chain: prompt node at 300, decode node at 340, plus a foreign
        // row registered past the end whose content cannot re-derive.
        func registerNode(parent: String?, lo: Int, hi: Int, _ e: [Float]) -> String {
            let k = ChunkIndex.makeKey(parentSha: parent, embeddings: e)
            ChunkIndex.shared.register(
                key: k, parentSha: parent, depth: 0,
                parentTokenCount: lo, tokenCount: hi, sizeBytes: 16)
            let nodeDir = kvDir.appendingPathComponent(k, isDirectory: true)
            try? FileManager.default.createDirectory(
                at: nodeDir, withIntermediateDirectories: true)
            try? Data("{\"version\":4}\n".utf8).write(
                to: nodeDir.appendingPathComponent("data.kv"))
            return k
        }
        let emb0: [Float] = [0.5, -0.25, 1.0, 0.125]
        let emb1: [Float] = [1.5, 0.25, -1.0, 0.5]
        let turn0: [Float] = [2.0, 1.0, -0.5, 0.25]
        let turn1: [Float] = [0.125, -1.0, 2.0, 0.75]
        let rootKey = registerNode(parent: nil, lo: 0, hi: 128, emb0)
        let chunkKey = registerNode(parent: rootKey, lo: 128, hi: 256, emb1)
        let promptNodeKey = registerNode(parent: chunkKey, lo: 256, hi: 300, turn0)
        let decodeNodeKey = registerNode(parent: promptNodeKey, lo: 300, hi: 340, turn1)
        _ = registerNode(parent: decodeNodeKey, lo: 340, hi: 360, [9.0, 9.0, 9.0, 9.0])
        let fakeEmbed: (Int, Int) -> [Float]? = { lo, hi in
            switch (lo, hi) {
            case (0, 128): return emb0
            case (128, 256): return emb1
            case (256, 300): return turn0
            case (300, 340): return turn1
            default: return [3.0, 3.0, 3.0, 3.0]
            }
        }
        let fixed = DiskCache.longestPrefixHit(
            chunk: 128, embed: { d in d == 0 ? emb0 : d == 1 ? emb1 : nil })
        c.equal("fixed chain walk still reaches its boundary nodes", fixed, 256)
        let chain = DiskCache.longestVariableChain(
            parentSha: chunkKey, parentTokenCount: 256, promptCount: 380,
            embedRange: fakeEmbed)
        c.expect(
            "turn chain walks the prompt node then the decode node",
            chain.keys == [promptNodeKey, decodeNodeKey])
        c.equal(
            "turn chain ends at the last content-verified node", chain.end, 340)
        c.expect(
            "a foreign child never verifies, even with a matching boundary",
            DiskCache.longestVariableChain(
                parentSha: decodeNodeKey, parentTokenCount: 340, promptCount: 380,
                embedRange: fakeEmbed).keys.isEmpty)
        let short = DiskCache.longestVariableChain(
            parentSha: chunkKey, parentTokenCount: 256, promptCount: 320,
            embedRange: fakeEmbed)
        c.expect(
            "a prompt shorter than a held node stops below it, never rewinds",
            short.keys == [promptNodeKey] && short.end == 300)
        let cold = DiskCache.longestVariableChain(
            parentSha: nil, parentTokenCount: 0, promptCount: 380,
            embedRange: { _, _ in nil })
        c.expect(
            "a walk without embeddings verifies nothing",
            cold.keys.isEmpty && cold.end == 0)

        // A dead conversation is now a deep chain, and one eviction pass can
        // only see its current tip: quota enforcement must iterate until the
        // whole chain is gone (it used to free one node per pass).
        var chainPrev: String? = nil
        var deepChainKeys: [String] = []
        for i in 0..<4 {
            let k = registerNode(
                parent: chainPrev, lo: i * 10, hi: (i + 1) * 10,
                [Float(i + 10), 0.5, -0.5, 1.5])
            ChunkIndex.shared.register(
                key: k, parentSha: chainPrev, depth: i,
                parentTokenCount: i * 10, tokenCount: (i + 1) * 10,
                sizeBytes: 1_000_000)
            deepChainKeys.append(k)
            chainPrev = k
        }
        DiskCache.maxBytesOverride = 1e-6
        let freedDeep = DiskCache.enforceQuota()
        c.expect("quota enforcement eats a dead turn chain to its root", freedDeep >= 4_000_000)
        c.expect(
            "every node of the dead chain left the disk",
            deepChainKeys.allSatisfy {
                !FileManager.default.fileExists(
                    atPath: kvDir.appendingPathComponent($0, isDirectory: true)
                        .appendingPathComponent("data.kv").path)
            })
        DiskCache.maxBytesOverride = nil

        // Recency must outrank depth. A leaf saved seconds after its elders
        // sits in the youngest age tier and survives a deficit those elders
        // cover; under plain depth-first ordering the fresh depth-0 leaf went
        // first, which is how the saver evicted the node it had just written
        // (a live conversation's tip is also its shallowest leaf).
        var agePrev: String? = nil
        var ageTip = ""
        for i in 0..<4 {
            ageTip = registerNode(
                parent: agePrev, lo: 100 + i * 10, hi: 110 + i * 10,
                [Float(i + 40), 0.5, -0.5, 1.5])
            ChunkIndex.shared.register(
                key: ageTip, parentSha: agePrev, depth: i,
                parentTokenCount: 100 + i * 10, tokenCount: 110 + i * 10,
                sizeBytes: 1_000_000)
            agePrev = ageTip
        }
        let freshKey = registerNode(parent: nil, lo: 200, hi: 210, [7.0, 0.5, -0.5, 1.5])
        ChunkIndex.shared.register(
            key: freshKey, parentSha: nil, depth: 0,
            parentTokenCount: 200, tokenCount: 210, sizeBytes: 1_000_000)
        // Total ≈ 5 MB of rows; the quota leaves a deficit smaller than one
        // node — exactly the shape of the reported bug.
        DiskCache.maxBytesOverride = 4_200_000.0 / 1_073_741_824.0
        _ = DiskCache.enforceQuota()
        c.expect(
            "an old deep tip is evicted before a fresh shallow leaf",
            !ChunkIndex.shared.contains(key: ageTip))
        c.expect(
            "the freshest leaf survives a deficit its elders cover",
            ChunkIndex.shared.contains(key: freshKey))
        DiskCache.maxBytesOverride = nil

        // Weights behind a symlink: Foundation refuses to list the link itself,
        // so the index must resolve it first (it did not, before 0.2.1).
        let tmp = FileManager.default.temporaryDirectory
            .appendingPathComponent("slotstream-runtime-check-\(getpid())")
        let real = tmp.appendingPathComponent("real")
        let link = tmp.appendingPathComponent("link")
        try FileManager.default.createDirectory(at: real, withIntermediateDirectories: true)
        FileManager.default.createFile(
            atPath: real.appendingPathComponent("model-00001-of-00001.safetensors").path,
            contents: Data())
        try FileManager.default.createSymbolicLink(at: link, withDestinationURL: real)
        defer { try? FileManager.default.removeItem(at: tmp) }
        c.equal(
            "shard listing works through a symlinked model dir",
            (try? CheckpointIndex.shardFiles(in: link))?.count, 1)

        // The memory promise: a plan never expects to peak past its target.
        for target in [Planner.minMemoryGB, 10, 16, 30] where target >= Planner.minMemoryGB {
            let p = try Planner.plan(
                expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                ramGB: 64, workingSetGB: 64, availableGB: 64)
            c.expect(
                "\(target) GB plan stays inside its target",
                p.expectedPeakGB <= target + 0.01,
                "expected peak \(p.expectedPeakGB) GB")
            c.measure("peak_gb_at_\(Int(target))", p.expectedPeakGB)
        }
        return c.report()
    }
}
