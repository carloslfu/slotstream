import Darwin
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Use the ordinary Engine, request ownership and HTTP handler with the
    /// authenticated alternate. The deliberately conservative planning budget
    /// is distinct from this test's ten-GB physical watchdog and fixed small
    /// arena. Nothing enters the supported registry or becomes active on disk.
    public static func affineEngine(baseline: URL, control: URL, table: URL,
                                    profile: URL, mtp: Bool, output: URL, streamedDraft: Bool = false) async throws -> Data {
        guard !streamedDraft || mtp else { throw ModelError("streamed draft requires drafting") }
        let profileSHA = "8e9ffd40c71d34bca08a55e7af55fda8ac7d45429f3ff7febef077d31bface7c"
        let bytes = try AffineExpertControl.bounded(profile, maximum: 100_000, sha256: profileSHA)
        guard let frozen = try JSONSerialization.jsonObject(with: bytes) as? [String: Any],
              let prompt = frozen["prompt"] as? [Int], prompt.count == 44,
              !FileManager.default.fileExists(atPath: output.path),
              !ProcessInfo.processInfo.environment.keys.contains(where: {
                  $0.hasPrefix("SLOTSTREAM_") || $0.hasPrefix("SS_DEBUG") || $0.hasPrefix("VQ_") || $0.hasPrefix("VQLAB_")
              }) else { throw ModelError("affine Engine check requires frozen inputs, new output and no ambient overrides") }
        guard let before = ProcessMemory.vmActivity(), before.reclaimableBytes >= 13_000_000_000 else {
            throw ModelError("affine Engine check requires 13 GB actual reclaimable memory")
        }
        try FileManager.default.createDirectory(at: output, withIntermediateDirectories: false)
        let oldCache = MLX.Memory.cacheLimit, oldLimit = MLX.Memory.memoryLimit
        MLX.Memory.cacheLimit = 128_000_000
        MLX.Memory.memoryLimit = min(oldLimit, 9_000_000_000)
        defer { Stream.gpu.synchronize(); MLX.Memory.clearCache(); MLX.Memory.cacheLimit = oldCache; MLX.Memory.memoryLimit = oldLimit }
        let started = ProcessInfo.processInfo.systemUptime
        func guardResources() throws {
            guard ProcessMemory.peakResidentBytes() <= 10_000_000_000,
                  let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= 3_000_000_000,
                  ProcessInfo.processInfo.systemUptime - started < 1800 else {
                throw ModelError("affine Engine check exceeded its physical resource envelope")
            }
        }
        let resource = PackMemoryProfile.affine3Control
        let target = mtp ? 14.0 : 12.0
        func plan(_ slots: Int, source: MemoryPlan.Source = .memoryGB) -> MemoryPlan {
            MemoryPlan(source: source, slots: slots, targetGB: target,
                ramGB: Planner.deviceRAMGB(), workingSetGB: Planner.deviceWorkingSetGB(),
                ramPercent: Planner.defaultRAMPercent, availableGB: Planner.deviceAvailableGB(), clamped: false,
                // Price both the active stepped capacity and one retained
                // complete-prompt state, including its raw vocabulary row.
                prefillChunk: 256, prefixCacheTokens: 4096, mtpEnabled: mtp, visionEnabled: false,
                maxContextTokens: 8192, notes: ["bounded Engine integration fixture; physical process limited to ten GB"],
                memoryLimitGB: source == .auto ? target : nil, mtpStreamedExperts: streamedDraft, resources: resource)
        }
        var c = CheckBuilder("affine-engine-\(mtp ? "draft" : "plain")")
        var observations: [[String: Any]] = [], complete = false
        func save(_ failure: String? = nil) throws -> Data {
            var result: [String: Any] = ["schema": 1, "complete": complete, "qualification": false,
                "control_manifest_sha256": AffineExpertControl.manifestSHA256,
                "rotary_sha256": VQRotaryCoefficients.sha256, "profile_sha256": profileSHA,
                "resource_identity": resource.identity, "mtp": mtp, "streamed_draft": streamedDraft, "initial_plan": plan(800).json(),
                "maximum_physical_process_bytes": 10_000_000_000, "observations": observations,
                "peak_process_bytes": ProcessMemory.peakResidentBytes(),
                "seconds": ProcessInfo.processInfo.systemUptime - started,
                "report": try JSONSerialization.jsonObject(with: JSONEncoder().encode(c.report()))]
            result["failure"] = failure
            let data = try JSONSerialization.data(withJSONObject: result, options: [.prettyPrinted, .sortedKeys])
            try data.write(to: output.appendingPathComponent("receipt.json"), options: .atomic)
            return data
        }
        let temporary = output.appendingPathComponent("private-fixtures")
        try FileManager.default.createDirectory(at: temporary, withIntermediateDirectories: false,
            attributes: [.posixPermissions: 0o700])
        defer { try? FileManager.default.removeItem(at: temporary) }
        do {
            // Capture then remove only this test's copies. The production
            // tokenizer must finish from its own verified bytes, including
            // Unicode vocabulary keys, without reopening those source paths.
            let copied = temporary.appendingPathComponent("metadata")
            try FileManager.default.createDirectory(at: copied, withIntermediateDirectories: false)
            for name in PinnedTokenizerMetadata.names {
                try FileManager.default.copyItem(at: baseline.appendingPathComponent(name), to: copied.appendingPathComponent(name))
            }
            let captured = try PinnedTokenizerMetadata(directory: copied)
            try FileManager.default.removeItem(at: copied)
            let independentTokenizer = try await captured.load()
            do {
                _ = try await Engine(modelDir: baseline, plan: plan(800))
                c.expect("original loader rejects candidate accounting before allocation", false)
            } catch {
                c.expect("original loader rejects candidate accounting before allocation",
                    String(describing: error).contains("same pack"))
            }
            let engine = try await Engine(modelDir: baseline,
                affineSource: AffineEngineSource(control: control, coefficients: table), plan: plan(800))
            engine.gpuKeepAlive = .off
            engine.generator.footprintSampling = true
            engine.generator.draftDepth = 2
            c.equal("actual cache bytes use the alternate record", engine.poolSnapshot().poolBytes, 800 * 2_150_400)
            c.equal("context metadata uses admitted candidate limit", engine.contextPolicyJSON["implementation_limit"] as? Int, 32768)
            c.expect("unsupported image capability is absent", !engine.visionAvailable && !engine.visionAllowed)
            c.expect("automatic read scopes cannot change reference dispatch", engine.model.optimizations.automaticReadScope == false)
            c.expect("resident draft matches the requested mode", (engine.model.mtpHead != nil) == mtp)
            c.equal("independent draft expert placement matches the plan", engine.model.mtpHead?.expertStream != nil, streamedDraft)
            let admittedHead = engine.model.mtpHead
            do {
                try engine.model.enableMTP(modelDir: baseline, streamedExperts: true)
                c.expect("legacy draft loader cannot reinterpret the alternate recipe", false)
            } catch {
                c.expect("legacy draft loader cannot reinterpret the alternate recipe",
                    String(describing: error).contains("independently authenticated draft"))
            }
            c.expect("rejected loader preserves the admitted head", engine.model.mtpHead === admittedHead)
            for text in ["café, Cafe\u{301}", "你好，世界", "مرحبا بالعالم", "<|im_start|>assistant\n"] {
                c.equal("owned tokenizer preserves \(text)", independentTokenizer.encode(text: text), engine.tokenizer.encode(text: text))
            }
            engine.generator.prefillChunk = 4096
            c.equal("public prefill assignment respects the plan", engine.generator.prefillChunk, 256)
            engine.visionAllowed = true
            do { _ = try engine.ensureVisionTower(); c.expect("image toggle cannot bypass pack capability", false) }
            catch { c.expect("image toggle cannot bypass pack capability", String(describing: error).contains("not admitted")) }
            engine.visionAllowed = false
            do {
                let state = engine.model.makeState(), fetched = engine.model.pool.recordsFetched
                do {
                    _ = try engine.model.lastLogitsChecked(Array(repeating: 100, count: 513), state: state)
                    c.expect("oversized direct dispatch refused", false)
                } catch { c.expect("oversized direct dispatch refused", String(describing: error).contains("query-row bound")) }
                c.equal("invalid dispatch changes no state", state.tokenCount, 0)
                c.equal("invalid dispatch reads no expert", engine.model.pool.recordsFetched, fetched)
            }
            var params = SampleParams.greedy; params.maxTokens = 16; params.seed = 7
            let request = try engine.beginRequest()
            let first = engine.generate(promptIds: prompt, params: params, request: request)
            c.equal("Engine matches independently checked greedy tokens", first.ids,
                [760, 1156, 369, 9859, 883, 264, 10597, 8282, 5265, 310, 2136, 14791, 14, 2581, 42903, 11])
            c.expect("candidate does not inherit baseline prefill ETA", request.estimatedPrefillSeconds == nil)
            c.expect("initial request completes successfully", first.stats.requestFailure == nil && first.stats.runtimeError == nil)
            let repeatResult = engine.generate(promptIds: prompt, params: params)
            c.equal("complete-prompt reuse preserves IDs", repeatResult.ids, first.ids)
            c.expect("complete-prompt cache actually reused", repeatResult.stats.completePromptHits > 0)
            observations.append(["case": "greedy", "ids": first.ids, "repeat_ids": repeatResult.ids,
                "complete_prompt_hits": repeatResult.stats.completePromptHits])
            try guardResources(); _ = try save()

            let disk = try engine.enablePersistentPrefixCache(.init(directory: temporary.appendingPathComponent("prefix"),
                maxBytes: 700_000_000, minimumTokens: 16))
            c.expect("persistent identity includes alternate manifest", disk.identity.components["weights"]?.contains(AffineExpertControl.manifestSHA256) == true)
            c.expect("persistent identity includes rotary identity", disk.identity.components["weights"]?.contains(VQRotaryCoefficients.sha256) == true)
            c.expect("persistent identity includes tokenizer", disk.identity.components["tokenizer_metadata"]?.contains("0997f410") == true)
            var changedIdentity = disk.identity.components; changedIdentity["weights"] = "another-pack"
            c.expect("a different pack cannot reuse the identity", PersistentPrefixIdentity(components: changedIdentity).digest != disk.identity.digest)
            let longPrompt = (0..<260).map { 100 + ($0 * 17 % 1000) }
            var short = params; short.maxTokens = 4
            engine.dropPrefixCache()
            let primed = engine.generate(promptIds: longPrompt, params: short)
            let continuation = longPrompt + [123]
            let memory = engine.generate(promptIds: continuation, params: short)
            c.expect("aligned memory prefix is actually reused", memory.stats.reusedPrefixTokens >= 256)
            c.expect("prefill state reached the persistent tier", disk.storedStates > 0)
            engine.dropPrefixCache()
            let restored = engine.generate(promptIds: continuation, params: short)
            c.expect("empty memory tier restores disk state", (restored.stats.persistentPrefix?.restoredTokens ?? 0) >= 256)
            c.equal("disk and memory continuations match", restored.ids, memory.ids)
            engine.disablePersistentPrefixCache(); engine.dropPrefixCache()
            let cold = engine.generate(promptIds: continuation, params: short)
            c.equal("reused continuation matches fresh prefill", memory.ids, cold.ids)
            c.expect("all continuation requests succeed", [primed, memory, restored, cold].allSatisfy {
                !$0.ids.isEmpty && $0.stats.requestFailure == nil && $0.stats.runtimeError == nil
            })
            observations.append(["case": "prefix", "memory_tokens": memory.stats.reusedPrefixTokens,
                "disk_tokens": restored.stats.persistentPrefix?.restoredTokens ?? 0,
                "memory_ids": memory.ids, "disk_ids": restored.ids, "cold_ids": cold.ids])
            try guardResources(); _ = try save()

            engine.dropPrefixCache()
            var emitted = 0
            let cancelControl = try engine.beginRequest()
            let cancelled = engine.generate(promptIds: prompt, params: params, onToken: { _, _ in
                emitted += 1
                if emitted == 5 { cancelControl.cancel(); return false }
                return true
            }, request: cancelControl)
            // Text callbacks may group tokens to preserve Unicode boundaries.
            c.equal("cancellation stops text callbacks", emitted, 5)
            c.expect("cancellation stops before the output limit", !cancelled.ids.isEmpty && cancelled.ids.count < params.maxTokens)
            c.equal("callback cancellation keeps the committed prefix", cancelled.ids, Array(first.ids.prefix(cancelled.ids.count)))
            c.equal("cancelled output is explicitly marked", cancelled.stats.requestFailure?.code, .clientCancelled)
            let afterCancellation = engine.generate(promptIds: prompt, params: params)
            c.equal("retry after cancellation preserves exact IDs", afterCancellation.ids, first.ids)
            engine.dropPrefixCache()
            engine.updatePlan(plan(800, source: .auto))
            let governor = MemoryGovernor(engine: engine)
            let savedAvailability = Planner.availabilityOverride
            defer { Planner.availabilityOverride = savedAvailability }
            Planner.availabilityOverride = 0
            governor.pressureNow(.critical)
            c.equal("live pressure shrinks the actual alternate arena", engine.poolSnapshot().slots, 640)
            c.equal("live pressure retains saved ceiling", engine.currentPlan?.memoryLimitGB, target)
            c.equal("live pressure retains resource identity", engine.currentPlan?.resources, resource)
            let refused = engine.generate(promptIds: prompt, params: params)
            c.expect("infeasible allocation refuses before inference", refused.ids.isEmpty && refused.stats.requestFailure?.code == .insufficientMemory)
            Planner.availabilityOverride = savedAvailability
            governor.pollNow()
            c.equal("recovery cooldown holds the small arena", engine.poolSnapshot().slots, 640)
            let recovered = engine.generate(promptIds: prompt, params: params)
            c.equal("live shrink and recovery preserve exact IDs", recovered.ids, first.ids)
            // Explicit warm-resize diagnostic, not a simulated headroom grant.
            // Its transient must fit both the plan and the physical watchdog.
            engine.dropPrefixCache(); MLX.Memory.clearCache()
            let transient = engine.model.pool.growthTransientBytes(to: 800)
            guard ProcessMemory.residentBytes() + UInt64(transient) <= 10_000_000_000,
                  GovernorPolicy.growthFits(footprintBytes: ProcessMemory.residentBytes(), transientBytes: transient,
                    availableGB: Planner.deviceAvailableGB(), targetGB: target, ramGB: Planner.deviceRAMGB()) else {
                throw ModelError("bounded alternate growth cannot fit its actual transient")
            }
            engine.withExclusive {
                engine.model.pool.resize(to: 800); engine.updatePlan(plan(800)); engine.publishPoolSnapshot()
            }
            let grown = engine.generate(promptIds: prompt, params: params)
            c.equal("warm resize preserves exact output", grown.ids, first.ids)
            c.equal("warm resize reports actual byte geometry", engine.poolSnapshot().poolBytes, 800 * 2_150_400)
            observations.append(["case": "governor", "recovered_ids": recovered.ids, "grown_ids": grown.ids,
                "growth_transient_bytes": transient, "saved_ceiling_gb": target])
            try guardResources(); _ = try save()

            signal(SIGPIPE, SIG_IGN)
            let server = Server(engine: engine, port: 0)
            let metadata = try OutputHTTPConnection(server: server, path: "/api/tags", object: nil).readResponse()
            c.expect("HTTP catalogue names the active alternate", metadata.head.contains("200") && metadata.body.contains(engine.modelName))
            let catalogue = try JSONSerialization.jsonObject(with: Data(metadata.body.utf8)) as? [String: Any]
            let card = (catalogue?["models"] as? [[String: Any]])?.first
            c.equal("HTTP catalogue reports the actual quantization", (card?["details"] as? [String: Any])?["quantization_level"] as? String, engine.modelQuantization)
            c.equal("HTTP catalogue binds the authenticated artifact", card?["digest"] as? String, engine.modelDigest)
            c.expect("alternate digest cannot claim the original pack", engine.modelDigest.hasPrefix("sha256:"))
            c.expect("generic aliases select the loaded artifact", engine.acceptsModelName("qwen3.8-flash-next") && engine.acceptsModelName("qwen3.8-flash-next:latest"))
            for pinned in ["qwen3.8-flash-next:4bit", "qwen38-flash-next-mlx-4bit"] {
                let fetched = engine.model.pool.recordsFetched
                let refused = try OutputHTTPConnection(server: server, path: "/api/generate", object: [
                    "model": pinned, "prompt": "Count one, two, three.", "stream": false,
                ]).readResponse()
                c.expect("HTTP refuses the explicitly pinned original", !refused.head.contains("200") && refused.body.contains("is not loaded"))
                c.equal("wrong-artifact request cannot start inference", engine.model.pool.recordsFetched, fetched)
            }
            let text = "Count one, two, three."
            var wireParams = params; wireParams.maxTokens = 8
            let native = engine.generate(promptIds: engine.tokenizer.encode(text: text), params: wireParams)
            let response = try OutputHTTPConnection(server: server, path: "/api/generate", object: [
                "model": engine.modelName, "prompt": text, "raw": true, "stream": false,
                "options": ["temperature": 0, "seed": 7, "num_predict": 8],
            ]).readResponse()
            let parsed = try JSONSerialization.jsonObject(with: Data(response.body.utf8)) as? [String: Any]
            c.expect("HTTP generation completes with success", response.head.contains("200") && (parsed?["done"] as? Bool) == true)
            c.equal("HTTP generation matches the direct Engine", parsed?["response"] as? String, native.text)
            c.equal("HTTP generation identifies the loaded pack", parsed?["model"] as? String, engine.modelName)
            observations.append(["case": "http", "status": response.head, "body": parsed ?? [:]])
            try guardResources()
            complete = c.report().passed
            return try save()
        } catch { _ = try? save(String(describing: error)); throw error }
    }
}
