import Darwin
import Foundation
import MLX
import Slotstream

/// Complete Engine configurations, separate from the fixed fourteen-GB
/// quality protocol. Inputs and settings are frozen before any timing run.
private struct QuantizationPerformanceProtocol: Decodable {
    struct Case: Decodable {
        let id: String
        let work: String
        let promptTokens: [Int]
        let outputTokens: Int
        let prefix: String
        let minimumReusedTokens: Int
    }
    let schema: Int
    let kind: String
    let scope: String
    let artifact: String
    let memoryBytes: Int
    let memoryMode: String
    let contextLimit: Int
    let draftMode: String
    let draftDepth: Int
    let draftPlacement: String
    let lookahead: String
    let originalCorrectionSha256: String?
    let prefixCache: Bool
    let liveMemory: String
    let gpuKeepAlive: String
    let maximumSeconds: Int
    let requestSeconds: Int
    let seed: Int
    let tokenizerSha256: String
    let cases: [Case]

    static func decode(_ data: Data) throws -> Self {
        let keys: Set<String> = ["schema", "kind", "scope", "artifact", "memory_bytes", "memory_mode",
            "context_limit", "draft_mode", "draft_depth", "draft_placement", "lookahead",
            "original_correction_sha256", "prefix_cache", "live_memory", "gpu_keep_alive",
            "maximum_seconds", "request_seconds", "seed", "tokenizer_sha256", "cases"]
        let caseKeys: Set<String> = ["id", "work", "prompt_tokens", "output_tokens", "prefix", "minimum_reused_tokens"]
        guard !data.isEmpty, data.count <= 4_000_000,
              let object = try JSONSerialization.jsonObject(with: data) as? [String: Any],
              Set(object.keys) == keys, let rows = object["cases"] as? [[String: Any]],
              rows.allSatisfy({ Set($0.keys) == caseKeys }) else {
            throw ModelError("performance protocol has unknown, missing or oversized input fields")
        }
        let decoder = JSONDecoder(); decoder.keyDecodingStrategy = .convertFromSnakeCase
        let value = try decoder.decode(Self.self, from: data)
        guard value.schema == 1, value.kind == "same-model-engine-performance-v1",
              ["pilot", "held-out"].contains(value.scope), ["original", "affine3"].contains(value.artifact),
              (8_100_000_000...24_000_000_000).contains(value.memoryBytes), value.memoryBytes.isMultiple(of: 100_000_000),
              ["ceiling", "target"].contains(value.memoryMode), [8192, 32768].contains(value.contextLimit),
              ["off", "on", "auto"].contains(value.draftMode), (0...4).contains(value.draftDepth),
              (value.draftMode == "off") == (value.draftDepth == 0),
              ["automatic", "streamed", "resident"].contains(value.draftPlacement),
              (value.artifact == "original" ? ["off", "automatic"] : ["off", "uncorrected"]).contains(value.lookahead),
              value.originalCorrectionSha256 == nil || (value.artifact == "original" && value.lookahead == "automatic"
                && value.originalCorrectionSha256 == RouterTapCorrection.shippedSHA256),
              ["automatic", "fixed"].contains(value.liveMemory), ["auto", "on", "off"].contains(value.gpuKeepAlive),
              value.liveMemory != "automatic" || value.memoryMode == "ceiling",
              (1...7200).contains(value.maximumSeconds), (1...1800).contains(value.requestSeconds),
              value.requestSeconds <= value.maximumSeconds, value.seed == 7,
              value.tokenizerSha256 == PinnedModel.files.first(where: { $0.path == "tokenizer.json" })?.sha256,
              (1...16).contains(value.cases.count), Set(value.cases.map(\.id)).count == value.cases.count else {
            throw ModelError("performance configuration exceeds its explicit artifact, feature or resource scope")
        }
        for (index, item) in value.cases.enumerated() {
            guard (1...64).contains(item.id.utf8.count), item.id.allSatisfy({ $0.isASCII && ($0.isLetter || $0.isNumber || $0 == "-" || $0 == "_") }),
                  ["fixed", "natural"].contains(item.work),
                  (item.work == "fixed" ? [128, 256, 512, 1024] : [128, 256, 512, 1024, 2048]).contains(item.outputTokens),
                  !item.promptTokens.isEmpty, item.promptTokens.count <= value.contextLimit - item.outputTokens,
                  item.promptTokens.allSatisfy({ (0..<248320).contains($0) }),
                  ["reset", "retain"].contains(item.prefix),
                  item.minimumReusedTokens >= 0, item.minimumReusedTokens <= item.promptTokens.count,
                  item.prefix == "retain" || item.minimumReusedTokens == 0,
                  item.prefix != "retain" || (index > 0 && value.prefixCache && item.minimumReusedTokens > 0) else {
                throw ModelError("performance case exceeds its frozen complete-work or cache contract")
            }
        }
        return value
    }

    var resources: PackMemoryProfile {
        artifact == "original" ? .original : (lookahead == "uncorrected" ? .affine3GroupedLookaheadControl : .affine3GroupedControl)
    }
    var placement: Planner.MTPExpertPlacement {
        draftPlacement == "automatic" ? .automatic : (draftPlacement == "streamed" ? .streamed : .resident)
    }
}

extension Diagnostics {
    /// Pure protocol checks; these do not load a model, compiler or Metal.
    public static func quantizationPerformanceProtocol() throws -> CheckReport {
        var c = CheckBuilder("quantization-performance-protocol")
        let item: [String: Any] = ["id": "fixed-short", "work": "fixed", "prompt_tokens": [100, 200],
            "output_tokens": 128, "prefix": "reset", "minimum_reused_tokens": 0]
        let original: [String: Any] = ["schema": 1, "kind": "same-model-engine-performance-v1", "scope": "pilot",
            "artifact": "original", "memory_bytes": 14_000_000_000, "memory_mode": "ceiling", "context_limit": 8192,
            "draft_mode": "auto", "draft_depth": 2, "draft_placement": "automatic", "lookahead": "automatic",
            "original_correction_sha256": NSNull(), "prefix_cache": true, "live_memory": "automatic",
            "gpu_keep_alive": "auto", "maximum_seconds": 3600, "request_seconds": 600, "seed": 7,
            "tokenizer_sha256": PinnedModel.files.first(where: { $0.path == "tokenizer.json" })!.sha256!, "cases": [item]]
        func parse(_ value: [String: Any]) throws -> QuantizationPerformanceProtocol {
            try QuantizationPerformanceProtocol.decode(JSONSerialization.data(withJSONObject: value, options: [.sortedKeys]))
        }
        c.equal("complete original profile keeps its own resource identity", try parse(original).resources, .original)
        var candidate = original; candidate["artifact"] = "affine3"; candidate["draft_mode"] = "on"
        candidate["draft_placement"] = "streamed"; candidate["lookahead"] = "uncorrected"
        c.equal("experimental candidate receives only its explicit lookahead identity",
            try parse(candidate).resources, .affine3GroupedLookaheadControl)
        candidate["lookahead"] = "off"
        c.equal("ordinary candidate retains its prior resource identity", try parse(candidate).resources, .affine3GroupedControl)
        var natural = item; natural["work"] = "natural"; natural["output_tokens"] = 2048
        var naturalProfile = original; naturalProfile["cases"] = [natural]
        c.equal("natural completion retains its separate reply ceiling", try parse(naturalProfile).cases[0].outputTokens, 2048)
        var boundary = item; boundary["prompt_tokens"] = Array(repeating: 100, count: 8192 - 128)
        var boundaryProfile = original; boundaryProfile["cases"] = [boundary]
        c.equal("prompt admission reserves the entire frozen reply", try parse(boundaryProfile).cases[0].promptTokens.count, 8192 - 128)
        var retained = item; retained["id"] = "retained"; retained["prefix"] = "retain"; retained["minimum_reused_tokens"] = 2
        var warm = original; warm["cases"] = [item, retained]
        c.equal("warm timing requires a predecessor and explicit minimum reuse", try parse(warm).cases[1].minimumReusedTokens, 2)
        let edits: [(String, Any)] = [("schema", true), ("kind", "unknown"), ("extra", 1), ("artifact", "downloaded"),
            ("memory_bytes", 8_000_000_000), ("memory_bytes", 24_100_000_000), ("memory_bytes", 14_000_000_001),
            ("memory_mode", "simulate"), ("memory_mode", "target"), ("context_limit", 65536),
            ("draft_depth", 0), ("draft_depth", 5), ("draft_mode", "off"), ("draft_placement", "unknown"),
            ("lookahead", "uncorrected"), ("original_correction_sha256", "unreviewed"), ("live_memory", "disabled"),
            ("gpu_keep_alive", "unknown"), ("maximum_seconds", 7201), ("request_seconds", 1801),
            ("seed", 8), ("tokenizer_sha256", "unknown"), ("cases", []), ("cases", [item, item])]
        for (key, value) in edits {
            var changed = original; changed[key] = value
            do { _ = try parse(changed); c.expect("unfrozen configuration is refused/\(key)", false) }
            catch { c.expect("unfrozen configuration is refused/\(key)", true) }
        }
        for (key, value): (String, Any) in [("id", "../escape"), ("id", ""), ("extra", 1), ("work", "unknown"),
            ("prompt_tokens", []), ("prompt_tokens", [-1]), ("prompt_tokens", [248320]),
            ("prompt_tokens", Array(repeating: 100, count: 8192 - 127)), ("output_tokens", 2048),
            ("prefix", "retain"), ("prefix", "unknown"), ("minimum_reused_tokens", 1)] {
            var changed = item; changed[key] = value; var profile = original; profile["cases"] = [changed]
            do { _ = try parse(profile); c.expect("invalid work or cache contract is refused/\(key)", false) }
            catch { c.expect("invalid work or cache contract is refused/\(key)", true) }
        }
        warm["prefix_cache"] = false
        do { _ = try parse(warm); c.expect("warm cache cannot be declared when disabled", false) }
        catch { c.expect("warm cache cannot be declared when disabled", true) }
        candidate["lookahead"] = "automatic"
        do { _ = try parse(candidate); c.expect("candidate cannot borrow original automatic lookahead", false) }
        catch { c.expect("candidate cannot borrow original automatic lookahead", true) }
        return c.report()
    }

    /// Timings and raw observations only. A separately frozen paired owner
    /// controls eligibility, repetitions, aggregation and qualification.
    public static func quantizationPerformance(protocolFile: URL, protocolSHA256: String,
        baseline: URL, control: URL?, table: URL?, output: URL, planOnly: Bool = false) async throws -> Data {
        guard (control == nil) == (table == nil), !FileManager.default.fileExists(atPath: output.path),
              !ProcessInfo.processInfo.environment.keys.contains(where: {
                  $0.hasPrefix("SLOTSTREAM_") || $0.hasPrefix("SS_DEBUG") || $0.hasPrefix("VQ_") || $0.hasPrefix("VQLAB_")
              }) else { throw ModelError("performance evaluation requires explicit artifacts, new output and no ambient overrides") }
        let raw = try AffineExpertControl.bounded(protocolFile, maximum: 4_000_000, sha256: protocolSHA256)
        let specification = try QuantizationPerformanceProtocol.decode(raw)
        guard (specification.artifact == "affine3") == (control != nil) else { throw ModelError("performance artifact and loader differ") }
        let artifact = try control.map { try AffineExpertControl.identify(control: $0) }
        guard artifact == nil || artifact == AffineExpertControl.Artifact.minmax else { throw ModelError("performance candidate is not the admitted minmax artifact") }
        let located = specification.lookahead == "automatic"
            ? RouterTapCorrection.shipped(modelDirectory: baseline, env: [:]).located : nil
        if specification.lookahead == "automatic", located == nil,
           FileManager.default.fileExists(atPath: baseline.appendingPathComponent(RouterTapCorrection.shippedRelativePath).path) {
            throw ModelError("a present but unrecognized original lookahead correction cannot enter a frozen performance configuration")
        }
        guard located?.sha256 == specification.originalCorrectionSha256 else {
            throw ModelError("installed original lookahead correction differs from its frozen identity")
        }
        let lookahead: DecodeLookaheadPlanning
        switch specification.lookahead {
        case "uncorrected": lookahead = .retained(enabled: true, bytes: DecodeLookahead.reserveBytes)
        case "automatic": lookahead = located.map { .automaticCorrected(bytes: $0.header.fileBytes) } ?? .automatic
        default: lookahead = .off
        }
        let memoryGB = Double(specification.memoryBytes) / 1e9
        let plan = try Planner.plan(resources: specification.resources, expertsPerLayer: nil, poolGB: nil,
            memoryGB: specification.memoryMode == "target" ? memoryGB : nil,
            memoryLimitGB: specification.memoryMode == "ceiling" ? memoryGB : nil,
            mtp: Planner.MTPMode(rawValue: specification.draftMode)!, mtpAvailable: specification.draftDepth > 0,
            vision: .off, maxContextTokens: specification.contextLimit, qualification: false,
            runtimePolicy: RuntimeAllocationPolicy(prefixCacheEnabled: specification.prefixCache),
            decodeLookahead: lookahead, mtpExperts: specification.placement)
        guard plan.expectedPeakGB <= memoryGB, (plan.targetGB ?? .infinity) <= memoryGB,
              plan.maxContextTokens == specification.contextLimit else { throw ModelError("performance plan exceeded its frozen ceiling") }
        try FileManager.default.createDirectory(at: output, withIntermediateDirectories: false,
            attributes: [.posixPermissions: 0o700])
        try raw.write(to: output.appendingPathComponent("protocol.json"), options: .withoutOverwriting)
        let started = ProcessInfo.processInfo.systemUptime
        var record: [String: Any] = ["schema": 1, "complete": false, "qualification": false,
            "protocol_sha256": protocolSHA256, "scope": specification.scope, "artifact": specification.artifact,
            "plan_only": planOnly, "loaded": false, "plan": plan.json(), "resource_identity": specification.resources.identity,
            "memory_ceiling_bytes": specification.memoryBytes, "required_preflight_bytes": specification.memoryBytes + 3_000_000_000,
            "baseline_revision": PinnedModel.revision, "cases": []]
        record["original_correction_sha256"] = located?.sha256
        record["artifact_manifest_sha256"] = artifact?.manifestSHA256 ?? ModelPackRegistry.baseline.manifestDigest
        func json<T: Encodable>(_ value: T) throws -> Any { try JSONSerialization.jsonObject(with: JSONEncoder().encode(value)) }
        func save() throws -> Data {
            record["seconds"] = ProcessInfo.processInfo.systemUptime - started
            record["peak_process_bytes"] = ProcessMemory.peakResidentBytes()
            let data = try JSONSerialization.data(withJSONObject: record, options: [.sortedKeys])
            guard data.count <= 16_000_000 else { throw ModelError("performance receipt exceeded its explicit storage bound") }
            try data.write(to: output.appendingPathComponent("receipt.json"), options: .atomic)
            return data
        }
        if planOnly { record["complete"] = true; return try save() }
        var governor: MemoryGovernor?
        var previousMLX: (cache: Int, memory: Int)?
        defer {
            if let previousMLX {
                Stream.gpu.synchronize(); MLX.Memory.clearCache()
                MLX.Memory.cacheLimit = previousMLX.cache; MLX.Memory.memoryLimit = previousMLX.memory
            }
        }
        var nextResourceCheck = 0.0
        func check(force: Bool = false) throws {
            let now = ProcessInfo.processInfo.systemUptime
            guard now - started < Double(specification.maximumSeconds) else { throw ModelError("performance process deadline") }
            if force || now >= nextResourceCheck {
                let peak = ProcessMemory.peakResidentBytes()
                guard peak > 0, peak <= UInt64(specification.memoryBytes),
                      let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= 3_000_000_000 else {
                    throw ModelError("performance process lost its physical envelope or real headroom")
                }
                var pressure: Int32 = 0, size = MemoryLayout<Int32>.size
                guard sysctlbyname("kern.memorystatus_vm_pressure_level", &pressure, &size, nil, 0) == 0, pressure == 1 else {
                    throw ModelError("performance process stopped for OS memory pressure")
                }
                nextResourceCheck = now + 0.25
            }
        }
        do {
            _ = try save(); try ModelProcessGuard.acquire()
            let preflight = ProcessMemory.vmActivity(); record["preflight"] = try json(preflight)
            guard let preflight, preflight.reclaimableBytes >= UInt64(specification.memoryBytes + 3_000_000_000) else {
                throw ModelError("performance configuration needs its full physical ceiling plus three GB actual reclaimable memory")
            }
            try check(force: true)
            let oldCache = MLX.Memory.cacheLimit, oldLimit = MLX.Memory.memoryLimit
            previousMLX = (oldCache, oldLimit)
            MLX.Memory.cacheLimit = 128_000_000
            MLX.Memory.memoryLimit = min(oldLimit, specification.memoryBytes - 1_000_000_000)
            record["load_conditions"] = try json(ProcessMemory.operatingConditions())
            let loadStarted = ProcessInfo.processInfo.systemUptime
            let loaded: Engine
            if let control, let table {
                loaded = try await Engine(modelDir: baseline,
                    affineSource: AffineEngineSource(control: control, coefficients: table,
                        piecewiseAllocation: true, groupedExperts: true, decodeLookahead: specification.lookahead == "uncorrected"), plan: plan)
            } else {
                try WeightStore.verify(at: baseline); try check(force: true)
                loaded = try await Engine(modelDir: baseline, plan: plan)
            }
            loaded.gpuKeepAlive = GPUKeepAlive.Policy(rawValue: specification.gpuKeepAlive)!
            loaded.generator.draftDepth = max(1, specification.draftDepth)
            loaded.generator.footprintSampling = true
            loaded.prefixCache.enabled = specification.prefixCache
            guard (loaded.model.mtpHead != nil) == plan.mtpEnabled,
                  (loaded.model.mtpHead?.expertStream != nil) == plan.mtpStreamedExperts,
                  (loaded.model.lookahead?.prefetch != nil) == plan.decodeLookahead,
                  !plan.decodeLookahead || loaded.model.lookahead?.prefetch?.tapCorrection?.identity == specification.originalCorrectionSha256 else {
                throw ModelError("loaded performance features differ from the complete plan")
            }
            record["load_seconds"] = ProcessInfo.processInfo.systemUptime - loadStarted
            record["loaded"] = true; record["arithmetic_identity"] = loaded.model.authenticatedArtifactIdentity ?? "native-deployed-defaults"
            let owner = MemoryGovernor(engine: loaded, management: LiveMemoryManagement(rawValue: specification.liveMemory)!)
            governor = owner; owner.start()
            try check(force: true); _ = try save()
            var rows: [[String: Any]] = []
            for item in specification.cases {
                if item.prefix == "reset" { loaded.dropPrefixCache() }
                let requestStart = ProcessInfo.processInfo.systemUptime
                let planBefore = loaded.currentPlan?.json() ?? [:]
                let before = ProcessMemory.vmActivity()
                var operating = [ProcessMemory.operatingConditions()], nextOperating = requestStart + 1
                var emissions: [[String: Any]] = [], failure: Error?
                func continuing() -> Bool {
                    do {
                        try check()
                        let now = ProcessInfo.processInfo.systemUptime
                        guard now - requestStart < Double(specification.requestSeconds) else { throw ModelError("performance request deadline") }
                        if now >= nextOperating { operating.append(ProcessMemory.operatingConditions()); nextOperating = now + 1 }
                        return true
                    } catch { failure = error; return false }
                }
                let emission: (Int, String) -> Bool = { _, text in
                    emissions.append(["seconds": ProcessInfo.processInfo.systemUptime - requestStart, "utf8_bytes": text.utf8.count])
                    return continuing()
                }
                var params = SampleParams.greedy; params.seed = UInt64(specification.seed); params.maxTokens = item.outputTokens
                let result = item.work == "fixed"
                    ? try loaded.generateFixedWorkDiagnostic(promptIds: item.promptTokens, params: params, shouldContinue: continuing, onToken: emission)
                    : loaded.generate(promptIds: item.promptTokens, params: params, shouldContinue: continuing, onToken: emission)
                let seconds = ProcessInfo.processInfo.systemUptime - requestStart
                operating.append(ProcessMemory.operatingConditions())
                var row: [String: Any] = ["id": item.id, "work": item.work, "prefix": item.prefix,
                    "prompt_tokens": item.promptTokens, "output_tokens": result.ids, "text": result.text,
                    "stats": try json(result.stats), "request_wall_seconds": seconds, "text_emissions": emissions,
                    "operating_conditions": try json(operating), "plan_before": planBefore, "plan_after": loaded.currentPlan?.json() ?? [:],
                    "natural_task_completed": item.work == "natural" && result.stats.finishReason == "stop",
                    "visible_text_retokenized_tokens": loaded.tokenizer.encode(text: result.text).count]
                row["vm_before"] = try json(before); row["vm_after"] = try json(ProcessMemory.vmActivity())
                rows.append(row); record["cases"] = rows; _ = try save()
                if let failure { throw failure }
                if let error = result.stats.requestFailure { throw error }
                if let error = result.stats.runtimeError { throw ModelError(error) }
                guard !result.ids.isEmpty, result.stats.decodeTokens == result.ids.count,
                      result.stats.interTokenSeconds.count == max(0, result.ids.count - 1),
                      item.work != "fixed" || (result.ids.count == item.outputTokens && result.stats.finishReason == "length"),
                      result.stats.reusedPrefixTokens >= item.minimumReusedTokens,
                      loaded.model.pool.pinnedSlotCount == 0 else { throw ModelError("performance request did not deliver its complete frozen work or cache state") }
                try check(force: true)
            }
            await owner.stopAndWait(); governor = nil
            try loaded.model.pool.expertStore.index.verifyAuthenticatedFilesUnchanged()
            try check(force: true); record["complete"] = true
            return try save()
        } catch {
            if let governor { await governor.stopAndWait() }
            record["failure"] = String(describing: error); record["complete"] = false
            _ = try save(); throw error
        }
    }
}
