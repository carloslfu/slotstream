import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Bounded physical-feasibility probe, independent of planner estimates.
    /// One fixed floor-sized pool and one synthetic fixture; timings are screens.
    public static func prefillOpportunityCompute(modelDir: URL) async throws -> CheckReport {
        let environment = ProcessInfo.processInfo.environment
        guard let path = environment["SLOTSTREAM_OPPORTUNITY_PROMPT_FILE"],
              let chunk = Int(environment["SLOTSTREAM_PREFILL_CHUNK"] ?? ""),
              [256, 512, 1024].contains(chunk) else {
            throw ModelError("compute probe requires a prompt file and a 256/512/1024-token chunk")
        }
        MLX.Memory.cacheLimit = 128 << 20
        let engine = try await Engine(modelDir: modelDir, poolSlots: Geometry.floorSlots)
        let ids = engine.tokenizer.encode(text: try String(contentsOfFile: path, encoding: .utf8), addSpecialTokens: false)
        guard [8195, 16387].contains(ids.count) else { throw ModelError("compute probe requires a frozen 8195/16387-token fixture") }
        let generator = engine.generator
        generator.prefillChunk = chunk; generator.prefillCacheLimit = 128 << 20
        generator.readScopeFootprintLimitBytes = 10_000_000_000
        generator.footprintSampling = true
        engine.model.optimizations = try InferenceOptimizations.environment()
        var params = SampleParams.greedy; params.maxTokens = 1
        let request = RequestController(configuration: try ContextConfiguration(maxPrefillWaitMinutes: 0), slackBytes: 3_000_000_000)
        let result = generator.generate(promptIds: ids, params: params, eosIds: [], cache: nil, request: request)
        if let error = result.1.runtimeError { throw ModelError(error) }
        let observation: [String: Any] = ["output_ids": result.0,
            "read_scopes": result.1.prefillPasses, "compute_passes": result.1.prefillComputePasses]
        FileHandle.standardError.write(try JSONSerialization.data(withJSONObject: observation, options: [.sortedKeys]) + Data("\n".utf8))
        var c = CheckBuilder("prefill-opportunity-compute")
        c.equal("whole prompt computed", result.1.prefillTokens, ids.count)
        c.expect("physical peak within 10 GB", result.1.peakMemoryGB <= 10)
        c.measure("chunk", Double(chunk)); c.measure("pool_slots", Double(engine.model.pool.slots))
        c.measure("prefill_seconds", result.1.prefillSeconds)
        c.measure("expert_read_bytes", Double(result.1.prefillReadBytes))
        c.measure("physical_peak_gb", result.1.peakMemoryGB)
        return c.report()
    }

    public static func fusedWorkspaceReservation() -> CheckReport {
        var c = CheckBuilder("fused-workspace-reservation")
        let platform = OptimizationPlatform(machineModel: "Mac17,9", chip: "Apple M5 Pro",
            osBuild: "25G83", nativeARM64: true)
        let defaults = InferenceOptimizations.deploymentCandidate(on: platform)
        func policy(_ options: InferenceOptimizations = defaults, gpu: Bool = true,
                    nax: Bool = true, bf16: Bool = true, dimension: Int = 256,
                    heads: Int = 24, kv: Int = 2,
                    vision: Bool = false, small: Bool = false) -> PrefillReadPolicy {
            PrefillReadPolicy(options: options, gpu: gpu, nax: nax, bf16: bf16,
                headDimension: dimension, attentionHeads: heads, kvHeads: kv,
                vision: vision, smallPass: small)
        }
        c.equal("qualified default enables fused accounting without a setting", defaults.fusedPrefillWorkspace, true)
        c.equal("qualified default delegates group sizing to the runtime", defaults.automaticReadScopeLimit, nil)
        c.equal("qualified request prices fused attention", policy().fusedKVHeads, 2)
        c.expect("bounded writes can double an MTP group", policy().permitsBoundedWrites(scope: 16384, ordinaryScope: 8192, mtp: true))
        for (scope, ordinary, mtp) in [(16384, 8448, true), (8192, 4096, true),
                                      (16384, 8192, false), (16385, 8192, true), (16384, 0, true)] {
            c.expect("bounded writes avoid unqualified or marginal tradeoff \(scope)/\(ordinary)/\(mtp)",
                !policy().permitsBoundedWrites(scope: scope, ordinaryScope: ordinary, mtp: mtp))
        }
        c.expect("unqualified main attention cannot select bounded writes",
            !policy(InferenceOptimizations()).permitsBoundedWrites(scope: 16384, ordinaryScope: 8192, mtp: true))
        func expert(_ writeBytes: Int?) -> Int {
            ContextWorkspace.expertWorkspaceBytes(tokens: 16384, tile: 1024, experts: 512,
                topK: 10, hidden: 2048, intermediate: 768, recordBytes: Int(Geometry.recordBytes),
                loadBatch: 32, largestWriteBytes: writeBytes)
        }
        c.expect("piecewise writes reduce assembly peak", expert(Int(Geometry.recordBytes) * 256) < expert(nil))
        c.equal("whole-workspace replacement keeps original price", expert(Int(Geometry.recordBytes) * 512), expert(nil))
        c.equal("invalid zero piece refuses", expert(0), Int.max)
        c.equal("invalid oversized piece refuses", expert(Int.max), Int.max)
        for position in [0, 256, 768, 7936, 8192, 16384, 32768] {
            let limit = policy().maximumScope(at: position, maxChunk: 256, gpu: true, override: nil)
            c.equal("automatic envelope at \(position)", limit, position < 8192 ? 16384 - position : 8192)
            if let passes = PrefillSchedule.automaticScopePasses(remaining: 32771 - position,
                at: position, maxChunk: 256, checkpoint: nil, maximumScope: limit),
               passes.reduce(0, +) > 8192 {
                c.expect("expanded group ends within fused key envelope \(position)", position + passes.reduce(0, +) <= 16384)
            }
        }
        for chunk in [64, 128, 512, 1024, 2048, 4096] {
            c.equal("other compute shapes retain group cap \(chunk)",
                policy().maximumScope(at: 0, maxChunk: chunk, gpu: true, override: nil), 8192)
        }
        var unfused = defaults; unfused.fusedPrefillAttention = nil
        var original = defaults; original.fusedPrefillWorkspace = nil
        var terminal = defaults; terminal.terminalPrefillPruning = true
        var selected = defaults; selected.selectedTextAttention = true
        let fallbacks = [policy(InferenceOptimizations()), policy(unfused), policy(original),
            policy(terminal), policy(selected), policy(gpu: false), policy(nax: false),
            policy(bf16: false), policy(dimension: 128), policy(heads: 0), policy(kv: 0),
            policy(kv: 5), policy(kv: 48), policy(vision: true), policy(small: true)]
        for (i, fallback) in fallbacks.enumerated() {
            c.equal("fallback \(i) retains full attention reservation", fallback.fusedKVHeads, nil)
            c.equal("fallback \(i) cannot inherit larger automatic reads",
                fallback.maximumScope(at: 0, maxChunk: 256, gpu: true, override: nil), 8192)
        }
        c.equal("CPU cannot use diagnostic larger envelope",
            policy().maximumScope(at: 0, maxChunk: 256, gpu: false, override: 16384), 8192)
        c.equal("diagnostic control can cap automatic reads",
            policy().maximumScope(at: 0, maxChunk: 256, gpu: true, override: 8192), 8192)
        for pass in [1, 8, 64, 256, 512, 1024] {
            for context in [8192, 16384, 32768] where PrefillSchedule.fits(pass, at: context - pass) {
                let old = ContextWorkspace.prefillBytes(pass: pass, context: context)
                let new = ContextWorkspace.prefillBytes(pass: pass, context: context, fusedKVHeads: 2)
                c.expect("bounded reservation \(pass)/\(context)", new > 0 && new <= old)
                if pass != 256 || context > 16384 { c.equal("unqualified shape fallback \(pass)/\(context)", new, old) }
                let padded = ContextWorkspace.prefillBytes(pass: pass, context: context, padSmallQueries: true, fusedKVHeads: 2)
                c.equal("padded fallback \(pass)/\(context)", padded,
                    ContextWorkspace.prefillBytes(pass: pass, context: context, padSmallQueries: true))
                c.equal("invalid GQA fallback \(pass)/\(context)",
                    ContextWorkspace.prefillBytes(pass: pass, context: context, fusedKVHeads: 5), old)
            }
        }
        c.equal("nil preserves public reservation", ContextWorkspace.prefillBytes(pass: 256, context: 16384, fusedKVHeads: nil),
            ContextWorkspace.prefillBytes(pass: 256, context: 16384))
        func draft(_ passes: [Int], at: Int = 0, hidden: Int = 2048, hc: Int = 4) -> Int {
            ContextWorkspace.mtpPrefillBytes(passes: passes, at: at,
                hiddenSize: hidden, hcCount: hc, attentionHeads: 24)
        }
        c.equal("first token has no predecessor or draft work", draft([1]), 0)
        c.equal("first draft pass is 255 rows with full main output retained", draft([256]),
            ContextWorkspace.prefillBytes(pass: 255, context: 255) + 256 * 2048 * 4 * 4)
        c.equal("resumed draft keeps all rows at shifted key positions", draft([256], at: 8192),
            ContextWorkspace.prefillBytes(pass: 256, context: 8447) + 256 * 2048 * 4 * 4)
        c.equal("draft peak includes every retained main row across larger scopes",
            draft(Array(repeating: 256, count: 64)),
            ContextWorkspace.prefillBytes(pass: 256, context: 16383) + 16384 * 2048 * 4 * 4)
        c.equal("short tail cannot erase the preceding draft peak", draft([256, 3], at: 8192),
            ContextWorkspace.prefillBytes(pass: 256, context: 8447) + 259 * 2048 * 4 * 4)
        c.equal("first-token-only pass preserves the next draft origin", draft([1, 256]),
            ContextWorkspace.prefillBytes(pass: 256, context: 256) + 257 * 2048 * 4 * 4)
        for passes in [[], [0], [-1], [4097], [Int.max]] {
            c.equal("invalid draft passes refuse \(passes)", draft(passes), Int.max)
        }
        c.equal("negative draft origin refuses", draft([256], at: -1), Int.max)
        c.equal("draft model limit refuses", draft([256], at: ContextPolicy.modelLimit - 1), Int.max)
        c.equal("draft query-key bound refuses", draft([4096], at: 32768), Int.max)
        c.equal("draft hidden byte overflow refuses", draft([256], hidden: Int.max), Int.max)
        c.equal("invalid hidden geometry refuses", draft([256], hc: 0), Int.max)
        c.equal("invalid envelope still refuses", ContextWorkspace.prefillBytes(pass: 4096, context: 32768, fusedKVHeads: 2), Int.max)
        c.expect("released memory must be observed before admission",
            !ContextWorkspace.fitsAutomaticScope(footprintBytes: 9_000_000_000, allocationBytes: 2_000_000_000, limitBytes: 10_000_000_000))
        let originalGroup = PrefillSchedule.automaticScopePasses(remaining: 16387, at: 0, maxChunk: 256, checkpoint: nil)
        let larger = PrefillSchedule.automaticScopePasses(remaining: 16387, at: 0, maxChunk: 256, checkpoint: nil, maximumScope: 16384)
        c.equal("original read maximum unchanged", originalGroup?.reduce(0, +), 8192)
        c.equal("larger prototype retains chronological passes", larger, Array(repeating: 256, count: 64))
        c.equal("larger group preserves shared checkpoint", PrefillSchedule.automaticScopePasses(
            remaining: 16387, at: 0, maxChunk: 256, checkpoint: 2304, maximumScope: 16384), Array(repeating: 256, count: 9))
        c.equal("larger group keeps other compute families bounded", PrefillSchedule.automaticScopePasses(
            remaining: 16387, at: 0, maxChunk: 512, checkpoint: nil, maximumScope: 16384)?.reduce(0, +), 4096)
        do {
            let automatic = try InferenceOptimizations.resolving(environment: [:], defaults: defaults)
            c.equal("empty environment preserves automatic policy", policy(automatic).fusedKVHeads, 2)
            for key in ["SLOTSTREAM_OPT_FUSED_PREFILL", "SLOTSTREAM_OPT_FUSED_WORKSPACE"] {
                let disabled = try InferenceOptimizations.resolving(environment: [key: "0"], defaults: defaults)
                c.equal("\(key) disables combined policy", policy(disabled).fusedKVHeads, nil)
                c.equal("\(key) restores original automatic cap",
                    policy(disabled).maximumScope(at: 0, maxChunk: 256, gpu: true, override: nil), 8192)
            }
            let configured = try InferenceOptimizations.environment([
                "SLOTSTREAM_OPT_FUSED_WORKSPACE": "1", "SLOTSTREAM_OPT_AUTO_SCOPE_LIMIT": "16384"])
            c.equal("explicit larger read envelope", configured.automaticReadScopeLimit, 16384)
            c.equal("explicit fused reservation", configured.fusedPrefillWorkspace, true)
            var saved = try JSONSerialization.jsonObject(with: JSONEncoder().encode(configured)) as! [String: Any]
            saved.removeValue(forKey: "automaticReadScopeLimit"); saved.removeValue(forKey: "fusedPrefillWorkspace")
            let legacy = try JSONDecoder().decode(InferenceOptimizations.self,
                from: JSONSerialization.data(withJSONObject: saved))
            c.equal("older settings retain original read envelope", legacy.automaticReadScopeLimit, nil)
            c.equal("older settings retain original reservation", legacy.fusedPrefillWorkspace, nil)
            for invalid in ["0", "16385", "banana"] {
                c.expect("invalid read envelope refuses \(invalid)",
                    (try? InferenceOptimizations.environment(["SLOTSTREAM_OPT_AUTO_SCOPE_LIMIT": invalid])) == nil)
            }
        } catch { c.expect("control serialization and resolution", false) }
        return c.report()
    }

    /// Exact scheduling qualification. Fingerprint each completed state and
    /// release it before building the next arm; never retain two long contexts.
    public static func prefillOpportunityEquality(modelDir: URL, tokens: Int, mtp: Bool = false) throws -> CheckReport {
        guard [8195, 16387].contains(tokens) else { throw ModelError("equality requires 8195 or 16387 tokens") }
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: Geometry.floorSlots)
        if mtp { try model.enableMTP(modelDir: modelDir) }
        let generator = Generator(model: model)
        generator.prefillChunk = 256; generator.prefillCacheLimit = 128 << 20
        generator.readScopeFootprintLimitBytes = 10_000_000_000
        generator.footprintSampling = true
        let ids = (0 ..< tokens).map { 1000 + (($0 * 7919) % 200_000) }
        var params = SampleParams.greedy; params.maxTokens = mtp ? 16 : 1
        var c = CheckBuilder("prefill-opportunity-equality")
        let piece = model.pool.largestWorkspacePieceBytes
        c.expect("measured workspace piece is bounded by the complete workspace",
            piece > 0 && piece < model.cfg.numExperts * model.pool.recordBytes)
        var captured: [Float] = []
        generator.promptLogitsObserver = { captured = $0 }
        var referenceLogits: [UInt32] = [], referenceNext: [UInt32] = []
        var referenceState: [String: String] = [:], referenceIDs: [Int] = [], referencePasses: [Int] = []
        for candidate in [true, false] {
            var options = try InferenceOptimizations.environment()
            if !candidate {
                options.fusedPrefillWorkspace = nil
                options.automaticReadScopeLimit = nil
            }
            options.prefixCheckpointTokens = 0
            model.optimizations = options
            let cache = PrefixCache(maxTokens: 32768)
            let request = RequestController(configuration: try ContextConfiguration(maxPrefillWaitMinutes: 0), slackBytes: 3_000_000_000)
            var pricingEvents = 0
            generator.automaticScopePricingObserver = { groups, bytes, footprint in
                if pricingEvents < 3 {
                    let row: [String: Any] = ["candidate": candidate, "footprint": footprint,
                        "scope_tokens": groups.map { $0.reduce(0, +) }, "allocation_bytes": bytes]
                    if let data = try? JSONSerialization.data(withJSONObject: row, options: [.sortedKeys]) {
                        FileHandle.standardError.write(data + Data("\n".utf8))
                    }
                }
                pricingEvents += 1
            }
            captured = []
            let writesBefore = model.pool.workspacePieceWriteCompletions
            let result = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache, request: request)
            if let error = result.1.runtimeError { throw ModelError(error) }
            let label = candidate ? "candidate" : "baseline"
            c.equal("\(label): completes prompt", result.1.prefillTokens, tokens)
            c.expect("\(label): physical peak within 10 GB", result.1.peakMemoryGB <= 10)
            c.measure("\(label).peak_gb", result.1.peakMemoryGB)
            c.measure("\(label).expert_bytes", Double(result.1.prefillReadBytes))
            c.measure("\(label).largest_scope", Double(result.1.prefillPasses.max() ?? 0))
            c.measure("\(label).piecewise_writes", Double(model.pool.workspacePieceWriteCompletions - writesBefore))
            if candidate && mtp && tokens == 16387 {
                c.expect("automatic MTP exercises bounded workspace writes", model.pool.workspacePieceWriteCompletions > writesBefore)
            }
            guard let hit = cache.take(matching: ids + result.0 + [907], reserveTokens: tokens + params.maxTokens + 4) else {
                throw ModelError("completed state was not retained")
            }
            let fingerprint = hit.state.diagnosticTensors().mapValues { array in
                "\(array.dtype):\(array.shape):\(SHA256.hash(data: array.asData(access: .copy).data))"
            }
            let next = model.lastLogits([907], state: hit.state)
            eval(next)
            let nextBits = next.asType(.float32).asArray(Float.self).map(\.bitPattern)
            if candidate {
                c.expect("larger grouping actually exercised", (result.1.prefillPasses.max() ?? 0) > 8192 || tokens == 8195)
                if tokens == 16387 && !mtp {
                    c.equal("fresh candidate exercises the full read envelope", result.1.prefillPasses.first, 16384)
                }
            }
            if !candidate {
                c.equal("raw prompt logits bit exact", captured.map(\.bitPattern), referenceLogits)
                c.equal("all retained state bytes exact", fingerprint, referenceState)
                c.equal("teacher forced continuation bit exact", nextBits, referenceNext)
                c.equal("output ids exact", result.0, referenceIDs)
                c.equal("chronological compute passes exact", result.1.prefillComputePasses, referencePasses)
            } else {
                referenceLogits = captured.map(\.bitPattern); referenceNext = nextBits
                referenceState = fingerprint; referenceIDs = result.0; referencePasses = result.1.prefillComputePasses
            }
            cache.drop()
            MLX.Memory.clearCache()
        }
        generator.automaticScopePricingObserver = nil
        c.expect("continuation and fingerprinting also stay within 10 GB", ProcessMemory.peakResidentGB <= 10)
        c.measure("complete_diagnostic_peak_gb", ProcessMemory.peakResidentGB)
        return c.report()
    }

    /// Capture real attention inputs from three layers at the requested key
    /// length. Synthetic inventory only, new output directory, no timing claim.
    public static func prefillOpportunityCapture(modelDir: URL, tokens: Int) async throws -> CheckReport {
        guard [8192, 16384].contains(tokens),
              let path = ProcessInfo.processInfo.environment["SLOTSTREAM_CAPTURE_ATTENTION"] else {
            throw ModelError("capture requires 8192/16384 tokens and a new SLOTSTREAM_CAPTURE_ATTENTION directory")
        }
        let directory = URL(fileURLWithPath: path)
        guard !FileManager.default.fileExists(atPath: path) else { throw ModelError("capture directory already exists") }
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: false)
        MLX.Memory.cacheLimit = 128 << 20
        let engine = try await Engine(modelDir: modelDir, poolSlots: Geometry.floorSlots)
        let generator = engine.generator
        generator.prefillChunk = 256; generator.prefillCacheLimit = 128 << 20
        generator.readScopeFootprintLimitBytes = 10_000_000_000
        generator.footprintSampling = true
        engine.model.optimizations = try InferenceOptimizations.environment()
        let text = (1 ... 1999).map {
            "Crate \($0) holds \($0 * 3) bolts, ships on day \($0 % 7 + 1), and belongs to warehouse \($0 % 19 + 1). Check the inventory counts carefully."
        }.joined(separator: "\n")
        let ids = Array(engine.tokenizer.encode(text: text, addSpecialTokens: false).prefix(tokens))
        var captures = 0, failure: Error?
        FusedPrefillAttention.diagnosticTap = { q, k, v, keep in
            guard captures < 3, q.dim(2) == 256, k.dim(2) == tokens else { return }
            do {
                try MLX.save(arrays: ["q": q, "k": k, "v": v, "mask": keep.asType(.uint8)],
                    url: directory.appendingPathComponent("attention-\(captures).safetensors"))
                captures += 1
            } catch { failure = error }
        }
        defer { FusedPrefillAttention.diagnosticTap = nil }
        var params = SampleParams.greedy; params.maxTokens = 1
        let request = RequestController(configuration: try ContextConfiguration(maxPrefillWaitMinutes: 0), slackBytes: 3_000_000_000)
        let result = generator.generate(promptIds: ids, params: params, eosIds: [], cache: nil, request: request)
        if let failure { throw failure }
        if let error = result.1.runtimeError { throw ModelError(error) }
        var c = CheckBuilder("prefill-opportunity-capture")
        c.equal("whole prompt", result.1.prefillTokens, tokens)
        c.equal("three real layers captured", captures, 3)
        c.expect("process stays within 10 GB", result.1.peakMemoryGB <= 10)
        c.measure("peak_gb", result.1.peakMemoryGB)
        c.measure("read_bytes", Double(result.1.prefillReadBytes))
        return c.report()
    }
}
