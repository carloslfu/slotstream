import Darwin
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Real image ownership and serving checks for an explicit candidate.
    /// The original tower remains the byte-identical component reference;
    /// image answer quality is a separate gate. One model is ever allocated.
    public static func affineVision(baseline: URL, control: URL, table: URL, output: URL) async throws -> Data {
        let artifact = try AffineExpertControl.identify(control: control)
        guard !FileManager.default.fileExists(atPath: output.path),
              !ProcessInfo.processInfo.environment.keys.contains(where: {
                  $0.hasPrefix("SLOTSTREAM_") || $0.hasPrefix("SS_DEBUG") || $0.hasPrefix("VQ_") || $0.hasPrefix("VQLAB_")
              }), let before = ProcessMemory.vmActivity(), before.reclaimableBytes >= 13_000_000_000 else {
            throw ModelError("affine vision needs new output, explicit clean inputs and thirteen GB actual reclaimable memory")
        }
        try ModelProcessGuard.acquire()
        try FileManager.default.createDirectory(at: output, withIntermediateDirectories: false)
        let oldCache = MLX.Memory.cacheLimit, oldLimit = MLX.Memory.memoryLimit
        MLX.Memory.cacheLimit = 128_000_000; MLX.Memory.memoryLimit = min(oldLimit, 9_000_000_000)
        defer { Stream.gpu.synchronize(); MLX.Memory.clearCache(); MLX.Memory.cacheLimit = oldCache; MLX.Memory.memoryLimit = oldLimit }
        let started = ProcessInfo.processInfo.systemUptime
        func guardResources() throws {
            guard ProcessMemory.peakResidentBytes() <= 10_000_000_000,
                  let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= 3_000_000_000,
                  ProcessInfo.processInfo.systemUptime - started < 1800 else {
                throw ModelError("affine vision exceeded its physical process, headroom or time envelope")
            }
        }
        var c = CheckBuilder("affine-owned-vision"), complete = false
        var observations: [[String: Any]] = []
        func save(_ failure: String? = nil) throws -> Data {
            var value: [String: Any] = ["schema": 1, "complete": complete, "qualification": false,
                "scope": "Owned original vision component and candidate functional integration, not image quality or speed",
                "control_manifest_sha256": artifact.manifestSHA256,
                "rotary_sha256": VQRotaryCoefficients.sha256,
                "resource_identity": PackMemoryProfile.affine3GroupedVisionControl.identity,
                "vision_configuration_sha256": PinnedModel.files.first { $0.path == "config.json" }!.sha256!,
                "processor_sha256": PinnedModel.files.first { $0.path == "preprocessor_config.json" }!.sha256!,
                "peak_process_bytes": ProcessMemory.peakResidentBytes(), "maximum_process_bytes": 10_000_000_000,
                "seconds": ProcessInfo.processInfo.systemUptime - started, "observations": observations,
                "report": try JSONSerialization.jsonObject(with: JSONEncoder().encode(c.report()))]
            value["failure"] = failure
            let data = try JSONSerialization.data(withJSONObject: value, options: [.prettyPrinted, .sortedKeys])
            try data.write(to: output.appendingPathComponent("receipt.json"), options: .atomic)
            return data
        }
        let temporary = output.appendingPathComponent("metadata-fixture")
        defer { try? FileManager.default.removeItem(at: temporary) }
        do {
            try FileManager.default.createDirectory(at: temporary, withIntermediateDirectories: false)
            for name in ["config.json", "preprocessor_config.json"] {
                try FileManager.default.copyItem(at: baseline.appendingPathComponent(name), to: temporary.appendingPathComponent(name))
            }
            let metadata = try PinnedVisionMetadata(directory: temporary)
            try Data("{}".utf8).write(to: temporary.appendingPathComponent("preprocessor_config.json"))
            do { _ = try PinnedVisionMetadata(directory: temporary); c.expect("corrupt processor refused before allocation", false) }
            catch { c.expect("corrupt processor refused before allocation", true) }
            try FileManager.default.removeItem(at: temporary)
            let source = AffineEngineSource(control: control, artifact: artifact, coefficients: table,
                piecewiseAllocation: true, groupedExperts: true, vision: true)
            let plan = MemoryPlan(source: .memoryGB, slots: 640, targetGB: 14,
                ramGB: Planner.deviceRAMGB(), workingSetGB: Planner.deviceWorkingSetGB(),
                ramPercent: Planner.defaultRAMPercent, availableGB: Planner.deviceAvailableGB(), clamped: false,
                prefillChunk: 256, prefixCacheTokens: 4096, mtpEnabled: true, visionEnabled: true,
                maxContextTokens: 8192, notes: ["fixed small vision fixture; physical process bound remains ten GB"],
                memoryLimitGB: nil, mtpStreamedExperts: true, resources: source.resources)
            let engine = try await Engine(modelDir: baseline, affineSource: source, plan: plan)
            engine.gpuKeepAlive = .off; engine.generator.draftDepth = 2; engine.generator.footprintSampling = true
            c.expect("explicit image capability is available", engine.visionAvailable && engine.visionAllowed)
            c.equal("candidate advertises only its checked vision horizon", engine.contextPolicyJSON["vision_limit"] as? Int, 32768)
            let cancelled = try engine.beginRequest(); cancelled.cancel()
            do { _ = try engine.ensureVisionTower(request: cancelled); c.expect("cancelled tower allocation refused", false) }
            catch { c.expect("cancelled tower allocation refused", true) }
            c.expect("cancelled allocation publishes no tower", engine.visionTower == nil)
            do { _ = try engine.ensureVisionTower(request: nil, workspaceBytes: Int.max); c.expect("oversized image workspace refused", false) }
            catch { c.expect("oversized image workspace refused", true) }
            c.expect("workspace refusal publishes no tower", engine.visionTower == nil)
            let imageStrings = [
                "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
                "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA360e5gAAAABJRU5ErkJggg=="]
            let images = try imageStrings.map { try VisionPreprocess.decodeCGImage(Data(base64Encoded: $0)!) }
            func hashes(_ tower: VisionTower) throws -> [String] {
                try images.map { image in
                    let plan = try tower.plan(for: image)
                    let value = try tower.encodeChecked(image, plan: plan, attentionPadding: 0)
                    eval(value)
                    c.expect("finite complete image features", value.dtype == .bfloat16
                        && value.shape == [1, plan.mergedTokens, 2560] && isFinite(value).all().item(Bool.self))
                    try guardResources()
                    return AffineExpertControl.digest(value.asData(access: .copy).data)
                }
            }
            let index = engine.model.pool.expertStore.index
            do { _ = try VisionTower(index: index); c.expect("owned tensors reject path-based metadata", false) }
            catch { c.expect("owned tensors reject path-based metadata", true) }
            do { _ = try VisionTower(index: index, metadata: metadata, shouldContinue: { false }); c.expect("owned constructor cancellation refused", false) }
            catch { c.expect("owned constructor cancellation refused", true) }
            let copiedHashes: [String] = try {
                let copied = try VisionTower(index: index, metadata: metadata)
                return try hashes(copied)
            }()
            MLX.Memory.clearCache()
            let referenceHashes: [String] = try {
                let reference = try VisionTower(index: CheckpointIndex(dir: baseline))
                return try hashes(reference)
            }()
            c.equal("owned bytes with deleted metadata source match legacy image features", copiedHashes, referenceHashes)
            c.expect("the image fixtures produce distinct features", Set(referenceHashes).count == 2)
            MLX.Memory.clearCache()
            let tower = try engine.ensureVisionTower()
            c.equal("Engine's owned tower matches unchanged component arithmetic", try hashes(tower), referenceHashes)
            c.expect("tower loading retains its resident reservation", engine.currentPlan?.visionResidentReserved == true)
            c.equal("tower loading cannot grow the fixed arena", engine.poolSnapshot().slots, 640)
            observations.append(["kind": "component", "original_feature_hashes": referenceHashes,
                "owned_feature_hashes": copiedHashes, "plan": engine.currentPlan!.json()])
            _ = try save()
            signal(SIGPIPE, SIG_IGN)
            let server = Server(engine: engine, port: 0)
            let beforeInvalid = engine.model.pool.recordsFetched
            let invalid = try OutputHTTPConnection(server: server, path: "/api/chat", object: [
                "model": engine.modelName, "stream": false, "think": false,
                "messages": [["role": "user", "content": "Describe the image.", "images": ["file:///invalid-image"]]],
            ]).readResponse()
            c.expect("invalid HTTP image fails before model work", !invalid.head.contains("200"))
            c.equal("invalid HTTP image reads no experts", engine.model.pool.recordsFetched, beforeInvalid)
            for image in 0..<imageStrings.count {
                var message = ChatMessage(role: "user", content: "Describe this image briefly.")
                message.images = [imageStrings[image]]
                let messages = [ChatMessage(role: "system", content: "Be concise. " + String(repeating: "Remember the image. ", count: 64)), message]
                let counted = try engine.countChatTokens(messages, tools: [], thinking: false, effort: nil)
                let (ids, vision) = try engine.encodeChatWithVision(messages)
                c.equal("image \(image): count and prepared input agree", counted, ids.count)
                c.expect("image \(image): fixture crosses a prefill boundary", ids.count > 256)
                c.expect("image \(image): complete prepared geometry", vision != nil)
                var params = SampleParams.greedy; params.maxTokens = 16; params.seed = 7
                engine.prefixCache.drop(); engine.generator.speculationEnabled = false
                let plain = engine.generate(promptIds: ids, params: params, vision: vision)
                c.expect("image \(image): main-only response completes", plain.stats.runtimeError == nil
                    && plain.stats.requestFailure == nil && !plain.ids.isEmpty)
                engine.prefixCache.drop(); engine.generator.speculationEnabled = true
                let draft = engine.generate(promptIds: ids, params: params, vision: vision)
                c.expect("image \(image): drafted response completes", draft.stats.runtimeError == nil && draft.stats.requestFailure == nil)
                c.equal("image \(image): verified drafts preserve complete output", draft.ids, plain.ids)
                let warm = engine.generate(promptIds: ids, params: params, vision: vision)
                c.equal("image \(image): retained continuation preserves complete output", warm.ids, draft.ids)
                c.expect("image \(image): warm request exercises actual prefix reuse", warm.stats.reusedPrefixTokens > 0)
                c.expect("image \(image): continuation succeeds", warm.stats.runtimeError == nil && warm.stats.requestFailure == nil)
                c.equal("image \(image): no expert pins retained", engine.model.pool.pinnedSlotCount, 0)
                observations.append(["kind": "generation", "image": image, "prompt_tokens": ids,
                    "plain_ids": plain.ids, "draft_ids": draft.ids, "warm_ids": warm.ids,
                    "plain_stats": try JSONSerialization.jsonObject(with: JSONEncoder().encode(plain.stats)),
                    "draft_stats": try JSONSerialization.jsonObject(with: JSONEncoder().encode(draft.stats)),
                    "warm_stats": try JSONSerialization.jsonObject(with: JSONEncoder().encode(warm.stats))])
                let response = try OutputHTTPConnection(server: server, path: "/api/chat", object: [
                    "model": engine.modelName, "stream": false, "think": false,
                    "messages": [["role": "system", "content": messages[0].content],
                        ["role": "user", "content": message.content, "images": [imageStrings[image]]]],
                    "options": ["temperature": 0, "seed": 7, "num_predict": 16],
                ]).readResponse()
                let parsed = try JSONSerialization.jsonObject(with: Data(response.body.utf8)) as? [String: Any]
                let done = parsed?["done"] as? Bool
                let content = (parsed?["message"] as? [String: Any])?["content"] as? String
                let model = parsed?["model"] as? String
                c.expect("image \(image): real HTTP route completes", response.head.contains("200") && done == true)
                c.equal("image \(image): HTTP and direct Engine agree", content, warm.text)
                c.equal("image \(image): HTTP binds the candidate identity", model, engine.modelName)
                observations.append(["kind": "http-image", "image": image, "status": response.head, "body": parsed ?? [:]])
                try guardResources(); _ = try save()
            }
            engine.prefixCache.drop()
            let recoveryPrompt = try engine.encodeChat([ChatMessage(role: "user", content: "Reply only OK.")], thinking: false)
            var params = SampleParams.greedy; params.maxTokens = 8
            let recovery = engine.generate(promptIds: recoveryPrompt, params: params)
            c.expect("text after image requests remains usable", recovery.stats.runtimeError == nil
                && recovery.stats.requestFailure == nil && !recovery.ids.isEmpty)
            observations.append(["kind": "text-recovery", "ids": recovery.ids, "text": recovery.text])
            try guardResources()
            complete = c.report().passed
            return try save()
        } catch { _ = try? save(String(describing: error)); throw error }
    }
}
