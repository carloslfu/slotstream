// Expert Lookahead diagnostics: the teacher capture that writes training
// shards, and the fresh-process benchmark arm the Python driver pairs.
//
// Both are experiment tooling behind explicit subcommands. Neither changes a
// default, installs anything or runs unless asked; both bind the exact flags
// the frozen protocol pins (draft depth two, adaptive/tail off, chunk 256,
// prefix retention off, MTP on) and refuse to run otherwise.

import ArgumentParser
import CryptoKit
import Foundation
import MLX
import Slotstream
import SlotstreamDiagnostics

// MARK: shared

enum ExpertLookaheadCLI {
    struct Frozen: Decodable {
        var runId: String
        var env: [String: String]
        var draftDepth: Int
        var prefillChunk: Int
        var memoryGB: Double
        var maxContext: Int
        var seed: UInt64
        var thinking: Bool
        enum CodingKeys: String, CodingKey {
            case runId = "run_id", env, draftDepth = "draft_depth", prefillChunk = "prefill_chunk"
            case memoryGB = "memory_gb", maxContext = "max_context", seed, thinking
        }
    }

    static func loadProtocol(_ path: String) throws -> Frozen {
        try JSONDecoder().decode(Frozen.self, from: Data(contentsOf: URL(fileURLWithPath: path)))
    }

    /// The frozen mode, checked against the live process rather than assumed.
    static func verify(_ p: Frozen, engine: Engine, plan: MemoryPlan) throws {
        let env = ProcessInfo.processInfo.environment
        for (key, value) in p.env where env[key] != value {
            throw PlanError("protocol pins \(key)=\(value) but the process has \(env[key] ?? "<unset>")")
        }
        guard engine.generator.draftDepth == p.draftDepth else {
            throw PlanError("draft depth \(engine.generator.draftDepth) differs from the protocol's \(p.draftDepth)")
        }
        guard engine.model.optimizations.adaptiveSpeculation == false, engine.model.optimizations.boundedDraftTail == false else {
            throw PlanError("adaptive speculation and draft-tail shortening must be off")
        }
        guard engine.generator.prefillChunk == p.prefillChunk else {
            throw PlanError("prefill chunk \(engine.generator.prefillChunk) differs from the protocol's \(p.prefillChunk)")
        }
        guard !engine.prefixCache.enabled else { throw PlanError("prefix retention must be disabled") }
        guard engine.model.mtpHead != nil, engine.generator.speculationEnabled else { throw PlanError("the MTP draft head must be loaded") }
        guard plan.mtpEnabled, plan.targetGB == p.memoryGB else {
            throw PlanError("plan target \(plan.targetGB.map { String($0) } ?? "nil") GB with mtp \(plan.mtpEnabled) differs from the protocol")
        }
    }

    static func sha256Hex(_ data: Data) -> String { SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined() }

    static func fileDigest(_ path: String) -> String? {
        guard let handle = FileHandle(forReadingAtPath: path) else { return nil }
        defer { try? handle.close() }
        var hasher = SHA256()
        while let part = try? handle.read(upToCount: 4 << 20), !part.isEmpty { hasher.update(data: part) }
        return hasher.finalize().map { String(format: "%02x", $0) }.joined()
    }

    static func executablePath() -> String {
        Bundle.main.executablePath ?? CommandLine.arguments[0]
    }

    /// Identity of the running process for the run/arm records.
    static func identity(engine: Engine, plan: MemoryPlan, modelURL: URL) throws -> [String: Any] {
        let exe = executablePath()
        var d: [String: Any] = [
            "version": SlotstreamBuild.version,
            "executable": exe,
            "executable_sha256": fileDigest(exe) ?? "",
            "model_dir": modelURL.path,
            "plan": plan.json(),
            "optimizations": try JSONSerialization.jsonObject(with: JSONEncoder().encode(engine.model.optimizations)),
            "draft_depth": engine.generator.draftDepth,
            "prefill_chunk": engine.generator.prefillChunk,
            "pool_slots": engine.model.pool.slots,
            "record_bytes": engine.model.pool.recordBytes,
            "layers": engine.model.cfg.numLayers, "experts": engine.model.cfg.numExperts,
            "top_k": engine.model.cfg.topK, "hidden": engine.model.cfg.hiddenSize,
            "hc_count": engine.model.cfg.hcCount,
            "mtp": engine.model.mtpHead != nil,
            "prefix_cache_enabled": engine.prefixCache.enabled,
        ]
        let env = ProcessInfo.processInfo.environment
        d["env"] = env.filter { $0.key.hasPrefix("SLOTSTREAM_") }
        if let identity = try? String(contentsOf: URL(fileURLWithPath: exe).deletingLastPathComponent()
                .appendingPathComponent("build-identity.json"), encoding: .utf8) {
            d["build_identity"] = (try? JSONSerialization.jsonObject(with: Data(identity.utf8))) ?? identity
        }
        return d
    }

    /// Rolling digest of every main-router decision, from IDs the layer has
    /// already materialized on the host. Common to every arm and mode.
    final class RouterDigest {
        private var hasher = SHA256()
        private(set) var layers = 0
        private(set) var ids = 0
        func observe(_ layer: Int, _ ids: [Int32]) {
            var head = UInt32(layer).littleEndian
            withUnsafeBytes(of: &head) { hasher.update(bufferPointer: $0) }
            ids.withUnsafeBufferPointer { hasher.update(bufferPointer: UnsafeRawBufferPointer($0)) }
            layers += 1
            self.ids += ids.count
        }
        func finish() -> String { hasher.finalize().map { String(format: "%02x", $0) }.joined() }
    }

    /// Fresh per-request teacher state inside one long-lived process: no
    /// resident expert, no cached n-gram row, no cached embedding row, no
    /// retained prefix. Storage stays allocated; only mappings clear.
    static func resetTeacher(_ engine: Engine) throws -> Double {
        let start = RuntimeClock.now()
        Stream.gpu.synchronize()
        engine.model.pool.commitAdmissions()
        engine.model.pool.unpinAll()
        try engine.model.pool.diagnosticDiscardResidency()
        engine.model.ngram.diagnosticClearRows()
        engine.model.resident.clearEmbeddingRows()
        engine.prefixCache.drop()
        Stream.gpu.synchronize()
        return RuntimeClock.seconds(since: start)
    }

    static func statsJSON(_ stats: GenStats) throws -> Any {
        try JSONSerialization.jsonObject(with: JSONEncoder().encode(stats))
    }

    static func vmJSON() -> [String: Any] {
        guard let vm = ProcessMemory.vmActivity() else { return [:] }
        return (try? JSONSerialization.jsonObject(with: JSONEncoder().encode(vm)) as? [String: Any]) ?? [:]
    }
}

// MARK: expert-lookahead-capture

struct ExpertLookaheadCapture: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "expert-lookahead-capture",
        abstract: "Run the frozen teacher over a request list and write Expert Lookahead training shards")
    @OptionGroup var model: ModelOptions
    @Option(name: .customLong("protocol"), help: "Frozen protocol JSON from Tools/expert_lookahead.py prepare") var protocolPath: String
    @Option(help: "Run directory for shards and requests.jsonl") var out: String
    @Option(help: "JSON array of requests: id, family, split, kind, prompt, max_tokens") var requests: String
    @Option(help: "Capture start features: on | off") var features: String = "on"
    @Option(help: "Capture per-layer x2 for main verification passes: on | off") var x2: String = "on"
    @Option(help: "Install the collector at all: on | off (off is the parity control)") var capture: String = "on"
    @Option(help: "Stop after this many completed requests (0 = all)") var limit: Int = 0
    @Flag(help: "Skip requests already completed in requests.jsonl") var resume = false
    @Option(help: "Observer-only router-reuse strides to record (e.g. 2,1) when no router prefetch policy is installed")
    var forecastStrides: String = ""
    @Option(help: "C12 self-check: also record the stride-0 forecast (this layer's router on its true x2): on | off")
    var forecastSelfcheck: String = "off"
    @Option(help: "Record each forecast target's mixed input rows for the offline C12 recomputation: on | off")
    var forecastInputs: String = "off"

    typealias Request = ExpertLookaheadRequest

    func run() throws {
        for (name, value) in [("--features", features), ("--x2", x2), ("--capture", capture), ("--forecast-selfcheck", forecastSelfcheck),
                              ("--forecast-inputs", forecastInputs)] where !["on", "off"].contains(value) {
            throw PlanError("\(name) must be on or off")
        }
        let observerStrides: [Int] = try forecastStrides.split(separator: ",").map {
            guard let n = Int($0.trimmingCharacters(in: .whitespaces)), (1 ... 8).contains(n) else {
                throw PlanError("--forecast-strides must be integers in 1...8, comma-separated")
            }
            return n
        }
        let proto = try ExpertLookaheadCLI.loadProtocol(protocolPath)
        let list = try JSONDecoder().decode([Request].self, from: Data(contentsOf: URL(fileURLWithPath: requests)))
        let outURL = URL(fileURLWithPath: out, isDirectory: true)
        try FileManager.default.createDirectory(at: outURL, withIntermediateDirectories: true)
        let requestsLog = outURL.appendingPathComponent("requests.jsonl")
        var done = Set<String>()
        if resume, let text = try? String(contentsOf: requestsLog, encoding: .utf8) {
            for line in text.split(separator: "\n") {
                if let o = try? JSONSerialization.jsonObject(with: Data(line.utf8)) as? [String: Any],
                   o["complete"] as? Bool == true, let id = o["id"] as? String { done.insert(id) }
            }
        }
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let plan = try model.announcedPlan(maxContext: proto.maxContext, prefixCacheEnabled: false, requireMTP: true)
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                try ExpertLookaheadCLI.verify(proto, engine: engine, plan: plan)
                var header = try ExpertLookaheadCLI.identity(engine: engine, plan: plan, modelURL: model.modelURL)
                header["run_id"] = proto.runId
                header["capture"] = ["features": features == "on", "x2": x2 == "on", "installed": capture == "on",
                                     "forecast_selfcheck": forecastSelfcheck == "on", "forecast_inputs": forecastInputs == "on",
                                     "forecast_strides": observerStrides]
                header["schema"] = "expert-lookahead-shard-v2"
                if let scheduler = engine.model.lookahead?.prefetch {
                    let c = scheduler.configuration
                    header["prefetch"] = ["policy": c.policy.rawValue, "shadow": c.shadow, "enabled": c.enabled,
                                          "cap_records": c.capRecords, "lanes": c.lanes, "window": c.windowLayers,
                                          "top": c.topPerLayer, "strides": c.strides, "issue_cap": c.issueCapPerTarget,
                                          "memo_layers": c.memoLayers, "reserve_bytes": c.reserveBytes,
                                          "adoption": c.adoption.rawValue, "slot_cap": c.slotCap,
                                          "threshold": c.threshold.isFinite ? Double(c.threshold) : -1e30]
                }
                let collector: ExpertLookaheadCollector? = capture == "on"
                    ? try ExpertLookaheadCollector(directory: outURL, header: header,
                        captureX2: x2 == "on", captureFeatures: features == "on") : nil
                if let collector {
                    // A prefetch-enabled engine keeps its scheduler; the
                    // collector observes the same session.
                    let session = engine.model.lookahead ?? ExpertLookaheadSession()
                    session.observer = collector
                    session.observerForecastStrides = observerStrides
                    session.forecastSelfCheck = forecastSelfcheck == "on"
                    session.captureForecastInputs = forecastInputs == "on"
                    engine.model.lookahead = session
                }
                // The first launch names the run; a resumed launch keeps that file
                // and records its own identity beside it.
                let runName = capture == "on" ? "run.json" : "run-capture-off.json"
                let runURL = outURL.appendingPathComponent(runName)
                let identityURL = FileManager.default.fileExists(atPath: runURL.path)
                    ? outURL.appendingPathComponent("run-resumed-\(Int(Date().timeIntervalSince1970)).json") : runURL
                try JSONSerialization.data(withJSONObject: header, options: [.sortedKeys, .prettyPrinted])
                    .write(to: identityURL, options: .atomic)
                guard let log = FileHandle(forWritingAtPath: requestsLog.path) ?? {
                    FileManager.default.createFile(atPath: requestsLog.path, contents: nil); return FileHandle(forWritingAtPath: requestsLog.path)
                }() else { throw PlanError("cannot open \(requestsLog.path)") }
                try log.seekToEnd()
                var completed = 0
                var failures = 0
                let pending = list.filter { !done.contains($0.id) }
                FileHandle.standardError.write("[capture] \(pending.count) requests pending, \(done.count) already complete\n".data(using: .utf8)!)
                for request in pending {
                    if limit > 0, completed >= limit { break }
                    if let expected = request.promptSha256, request.digest != expected {
                        throw PlanError("request \(request.id) prompt hash does not match the frozen manifest")
                    }
                    let resetSeconds = try ExpertLookaheadCLI.resetTeacher(engine)
                    let control = try engine.beginRequest()
                    let ids = try engine.encodeChat(request.chatMessages, thinking: proto.thinking)
                    if let why = engine.contextError(promptTokens: ids.count) {
                        // Preserved as an incomplete row; never retried silently.
                        var line: [String: Any] = ["id": request.id, "family": request.family, "split": request.split,
                            "kind": request.kind, "complete": false, "error": why, "prompt_tokens": ids.count]
                        line["capture_installed"] = capture == "on"
                        var data = try JSONSerialization.data(withJSONObject: line, options: [.sortedKeys]); data.append(0x0A)
                        try log.write(contentsOf: data); try log.synchronize()
                        failures += 1
                        continue
                    }
                    let digest = ExpertLookaheadCLI.RouterDigest()
                    engine.model.routerObserver = { digest.observe($0, $1) }
                    try collector?.beginRequest(id: request.id)
                    var params = SampleParams.greedy
                    params.maxTokens = request.maxTokens
                    params.seed = proto.seed
                    let vmBefore = ExpertLookaheadCLI.vmJSON()
                    let started = RuntimeClock.now()
                    let (_, outputIds, stats) = engine.generate(promptIds: ids, params: params, request: control)
                    let wall = RuntimeClock.seconds(since: started)
                    engine.model.routerObserver = nil
                    let summary = try collector?.endRequest()
                    let complete = stats.runtimeError == nil && summary?.schemaViolation == nil
                        && (summary?.abortedPasses ?? 0) == 0
                    var line: [String: Any] = [
                        "id": request.id, "family": request.family, "split": request.split, "kind": request.kind,
                        "prompt_sha256": request.digest,
                        "prompt_tokens": ids.count, "max_tokens": request.maxTokens,
                        "output_ids": outputIds, "finish_reason": stats.finishReason,
                        "router_sha256": digest.finish(), "router_layers": digest.layers, "router_ids": digest.ids,
                        "wall_seconds": wall, "reset_seconds": resetSeconds,
                        "capture_installed": capture == "on",
                        "complete": complete,
                        "stats": try ExpertLookaheadCLI.statsJSON(stats),
                        "vm_before": vmBefore, "vm_after": ExpertLookaheadCLI.vmJSON(),
                        "pool_slots": engine.model.pool.slots,
                    ]
                    if let error = stats.runtimeError { line["error"] = error }
                    if let summary { line["capture"] = try JSONSerialization.jsonObject(with: JSONEncoder().encode(summary)) }
                    var data = try JSONSerialization.data(withJSONObject: line, options: [.sortedKeys])
                    data.append(0x0A)
                    try log.write(contentsOf: data)
                    try log.synchronize()
                    completed += 1
                    FileHandle.standardError.write(String(format: "[capture] %@ %@ %d prompt + %d output tokens, %.2f decode tok/s, hit %.3f, %.1f s%@\n",
                        request.id, request.kind, ids.count, outputIds.count, stats.decodeTPS, stats.expertHitRate, wall,
                        complete ? "" : " INCOMPLETE").data(using: .utf8)!)
                    if !complete {
                        // A pressure cancellation or schema violation is recorded and
                        // the run continues; `--resume` retries incomplete requests.
                        failures += 1
                        FileHandle.standardError.write("[capture] \(request.id) failed: \(stats.runtimeError ?? summary?.schemaViolation ?? "aborted pass")\n".data(using: .utf8)!)
                        if let violation = summary?.schemaViolation { throw PlanError("\(request.id): \(violation)") }
                    }
                }
                engine.model.lookahead?.observer = nil
                try log.close()
                if failures > 0 { throw PlanError("\(failures) request(s) incomplete; rerun with --resume") }
                result = .success(())
            } catch { result = .failure(error) }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

// MARK: expert-lookahead-bench

struct ExpertLookaheadBench: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "expert-lookahead-bench",
        abstract: "One fresh-process benchmark arm: same-prompt warmup, then one measured request with exact identities")
    @OptionGroup var model: ModelOptions
    @Option(name: .customLong("protocol"), help: "Frozen protocol JSON") var protocolPath: String
    @Option(help: "One request JSON object (id, family, split, kind, messages, max_tokens, prompt_sha256)") var request: String
    @Option(help: "Write the arm record here") var out: String
    @Option(help: "Warmup outputs on the same prompt before the measured request") var warmupTokens: Int = 128
    @Option(help: "Measured request output cap") var maxTokens: Int = 512
    @Flag(help: "Sample physical footprint during the measured request") var sampleFootprint = false
    @Option(help: "Sampling temperature for a seeded correctness arm (0 = greedy, the timing mode)") var temperature: Double = 0
    @Option(help: "C08: cancel a request after this many outputs, then run the measured request as recovery (0 = off)")
    var cancelAfter: Int = 0

    func run() throws {
        let proto = try ExpertLookaheadCLI.loadProtocol(protocolPath)
        let requestSpec = try JSONDecoder().decode(ExpertLookaheadRequest.self, from: Data(contentsOf: URL(fileURLWithPath: request)))
        if let expected = requestSpec.promptSha256, requestSpec.digest != expected {
            throw PlanError("request \(requestSpec.id) prompt hash does not match the frozen manifest")
        }
        let launchStart = RuntimeClock.now()
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let plan = try model.announcedPlan(maxContext: proto.maxContext, prefixCacheEnabled: false, requireMTP: true)
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                let loadSeconds = RuntimeClock.seconds(since: launchStart)
                try ExpertLookaheadCLI.verify(proto, engine: engine, plan: plan)
                engine.generator.footprintSampling = sampleFootprint
                let ids = try engine.encodeChat(requestSpec.chatMessages, thinking: proto.thinking)
                if let why = engine.contextError(promptTokens: ids.count) { throw PlanError(why) }
                func request(_ cap: Int, cancelAfter: Int = 0) throws -> (ids: [Int], stats: GenStats, digest: String, layers: Int) {
                    let control = try engine.beginRequest()
                    let digest = ExpertLookaheadCLI.RouterDigest()
                    engine.model.routerObserver = { digest.observe($0, $1) }
                    defer { engine.model.routerObserver = nil }
                    var params: SampleParams = temperature > 0 ? .instruct : .greedy
                    if temperature > 0 { params.temperature = Float(temperature) }
                    params.maxTokens = cap
                    params.seed = proto.seed
                    var emitted = 0
                    let (_, out, stats) = engine.generate(promptIds: ids, params: params,
                        shouldContinue: cancelAfter > 0 ? { emitted < cancelAfter } : nil,
                        onToken: cancelAfter > 0 ? { _, _ in emitted += 1; return true } : nil,
                        request: control)
                    if cancelAfter == 0, let error = stats.runtimeError { throw PlanError(error) }
                    return (out, stats, digest.finish(), digest.layers)
                }
                let warm = try request(warmupTokens)
                var cancelled: (ids: [Int], stats: GenStats, digest: String, layers: Int)? = nil
                if cancelAfter > 0 { cancelled = try request(maxTokens, cancelAfter: cancelAfter) }
                let vmBefore = ExpertLookaheadCLI.vmJSON()
                let pageInsBefore = ProcessMemory.pageIns()
                let measured = try request(maxTokens)
                let pageInsAfter = ProcessMemory.pageIns()
                let vmAfter = ExpertLookaheadCLI.vmJSON()
                var record = try ExpertLookaheadCLI.identity(engine: engine, plan: plan, modelURL: model.modelURL)
                record["schema"] = "expert-lookahead-arm-v1"
                record["run_id"] = proto.runId
                record["prompt_sha256"] = requestSpec.digest
                record["request_id"] = requestSpec.id
                record["family"] = requestSpec.family
                record["kind"] = requestSpec.kind
                record["prompt_tokens"] = ids.count
                record["prompt_ids"] = ids
                record["load_seconds"] = loadSeconds
                record["warmup"] = ["max_tokens": warmupTokens, "output_ids": warm.ids, "router_sha256": warm.digest,
                                    "router_layers": warm.layers, "stats": try ExpertLookaheadCLI.statsJSON(warm.stats)]
                record["temperature"] = temperature
                if let cancelled {
                    record["cancelled"] = ["cancel_after": cancelAfter, "output_ids": cancelled.ids, "router_sha256": cancelled.digest,
                                           "finish_reason": cancelled.stats.finishReason,
                                           "stats": try ExpertLookaheadCLI.statsJSON(cancelled.stats)]
                }
                record["measured"] = ["max_tokens": maxTokens, "output_ids": measured.ids, "router_sha256": measured.digest,
                                      "router_layers": measured.layers, "stats": try ExpertLookaheadCLI.statsJSON(measured.stats),
                                      "vm_before": vmBefore, "vm_after": vmAfter,
                                      "pageins_before": pageInsBefore.map { Int($0) } ?? NSNull(),
                                      "pageins_after": pageInsAfter.map { Int($0) } ?? NSNull(),
                                      "pageins_delta": (pageInsBefore != nil && pageInsAfter != nil) ? Int(pageInsAfter! - pageInsBefore!) : NSNull(),
                                      "page_bytes": Int(vm_page_size)]
                record["prefetch_observation"] = measured.stats.expertPrefetch.map {
                    (try? JSONSerialization.jsonObject(with: JSONEncoder().encode($0))) ?? NSNull() } ?? NSNull()
                try JSONSerialization.data(withJSONObject: record, options: [.sortedKeys])
                    .write(to: URL(fileURLWithPath: out), options: .atomic)
                let s = measured.stats
                FileHandle.standardError.write(String(format: "[bench] %d outputs in %.2f s (%.2f tok/s), hit %.3f, %d demand records, %d adopted, ttft %.2f s\n",
                    s.decodeTokens, s.decodeSeconds, s.decodeTPS, s.expertHitRate, s.decodeRecords,
                    s.expertPrefetch?.adopted ?? 0, s.firstTokenSeconds ?? 0).data(using: .utf8)!)
                result = .success(())
            } catch { result = .failure(error) }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

// MARK: request records

struct ExpertLookaheadRequest: Decodable {
    struct Message: Decodable { var role: String; var content: String }
    var id: String; var family: String; var split: String; var kind: String
    var messages: [Message]; var maxTokens: Int
    var promptSha256: String?
    enum CodingKeys: String, CodingKey {
        case id, family, split, kind, messages, maxTokens = "max_tokens", promptSha256 = "prompt_sha256"
    }
    var chatMessages: [ChatMessage] { messages.map { ChatMessage(role: $0.role, content: $0.content) } }
    /// Same digest as Tools/expert_lookahead.py request_digest: role and content, newline-joined.
    var digest: String {
        ExpertLookaheadCLI.sha256Hex(Data(messages.map { "\($0.role)\n\($0.content)" }.joined(separator: "\n").utf8))
    }
}

// MARK: expert-lookahead-predict (C10)

struct ExpertLookaheadPredict: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "expert-lookahead-predict",
        abstract: "Score a feature fixture with a prediction pack through the native predictor (export parity)")
    @Option(help: "Pack directory or pack.json") var pack: String
    @Option(help: "Fixture safetensors with uint16 features [N, 12800], int32 positions [N], float32 scores [N, 24576]") var fixture: String
    @Option(help: "Write the native scores and comparison here") var out: String
    @Option(help: "Predictor device: gpu | cpu") var device: String = "gpu"
    @Option(help: "Repeat the whole fixture this many times for timing") var repeats: Int = 1

    func run() throws {
        let cfg = try ModelConfig.load(from: ModelLocator.resolve(PinnedModel.name).resolvingSymlinksInPath())
        guard let dev = ExpertPrefetchConfiguration.Device(rawValue: device) else { throw PlanError("--device must be gpu or cpu") }
        let predictor = try ExpertPredictor(packPath: pack, cfg: cfg, device: dev)
        let arrays = try loadArrays(url: URL(fileURLWithPath: fixture))
        guard let features = arrays["features"], let positions = arrays["positions"], let reference = arrays["scores"] else {
            throw PlanError("fixture needs features, positions and scores")
        }
        let n = features.dim(0)
        let positionList = positions.asArray(Int32.self)
        let context = cfg.hcCount * cfg.hiddenSize
        var native: [[Float]] = []
        var seconds = 0.0
        for _ in 0 ..< max(1, repeats) {
            native.removeAll()
            let start = RuntimeClock.now()
            for i in 0 ..< n {
                let row = features[i].view(dtype: .bfloat16)
                let feature = ExpertLookaheadStartFeature(kind: Int(positionList[i]), token: 0,
                    context: row[0 ..< context].reshaped([1, 1, context]),
                    embedding: row[context...].reshaped([1, 1, cfg.hiddenSize]))
                native.append(predictor.unionScores([feature]))
            }
            seconds = RuntimeClock.seconds(since: start)
        }
        let ref = reference.asArray(Float.self)
        let width = reference.dim(1)
        var maxAbs: Float = 0, maxRel: Float = 0
        for i in 0 ..< n {
            for j in 0 ..< width {
                let a = native[i][j], b = ref[i * width + j]
                maxAbs = max(maxAbs, abs(a - b))
                maxRel = max(maxRel, abs(a - b) / max(abs(b), 1e-3))
            }
        }
        // Ranking parity is judged on the top-16 candidate SET per layer, which
        // is what the scheduler consumes. A set difference is a near tie when the
        // reference gap at the boundary is within four times the observed score
        // error; anything wider is a real mismatch. Order swaps inside the set
        // are reported separately.
        var rankMismatches = 0, comparedLayers = 0, nearTies = 0, orderSwaps = 0
        let tieBand = max(4 * maxAbs, 1e-6)
        for i in 0 ..< n {
            for l in 0 ..< cfg.numLayers {
                let base = l * cfg.numExperts
                let ns = Array(native[i][base ..< base + cfg.numExperts])
                let rs = Array(ref[(i * width + base) ..< (i * width + base + cfg.numExperts)])
                let nt = Array(ns.indices.sorted { ns[$0] != ns[$1] ? ns[$0] > ns[$1] : $0 < $1 }.prefix(16))
                let rtOrder = rs.indices.sorted { rs[$0] != rs[$1] ? rs[$0] > rs[$1] : $0 < $1 }
                let rt = Array(rtOrder.prefix(16))
                comparedLayers += 1
                if Set(nt) != Set(rt) {
                    let gap = rtOrder.count > 16 ? rs[rtOrder[15]] - rs[rtOrder[16]] : Float.infinity
                    if gap <= tieBand { nearTies += 1 } else { rankMismatches += 1 }
                } else if nt != rt {
                    orderSwaps += 1
                }
            }
        }
        let payload: [String: Any] = [
            "rows": n, "device": device, "seconds": seconds, "per_row_ms": n > 0 ? seconds * 1000 / Double(n) : 0,
            "max_abs_error": maxAbs, "max_rel_error": maxRel, "compared_layers": comparedLayers,
            "rank_mismatches": rankMismatches, "near_ties": nearTies, "order_swaps": orderSwaps, "tie_band": tieBand,
            "pack_identity": predictor.identity, "resident_bytes": predictor.residentBytes,
            "finite": native.allSatisfy { $0.allSatisfy(\.isFinite) },
        ]
        try JSONSerialization.data(withJSONObject: payload, options: [.sortedKeys, .prettyPrinted]).write(to: URL(fileURLWithPath: out))
        print(String(format: "predict: %d rows, %.3f ms/row on %@, max abs %.6f, max rel %.5f, set mismatches %d, near ties %d, order swaps %d",
            n, n > 0 ? seconds * 1000 / Double(n) : 0, device, maxAbs, maxRel, rankMismatches, nearTies, orderSwaps))
        if rankMismatches > 0 || !(native.allSatisfy { $0.allSatisfy(\.isFinite) }) { throw ExitCode(2) }
    }
}

// MARK: expert-lookahead-check

struct ExpertLookaheadCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "expert-lookahead-check",
        abstract: "Weights-free Expert Lookahead runtime checks: lane budget, tickets, scheduler and adoption lifetime")

    func run() throws {
        for report in try Diagnostics.expertLookaheadRuntime() {
            try CheckRendering.emit(report, banner: "\(report.name.uppercased()) PASS")
        }
    }
}
