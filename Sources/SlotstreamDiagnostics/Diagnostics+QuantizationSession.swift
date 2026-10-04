import Darwin
import Foundation
import MLX
import Slotstream

/// A frozen bounded conversation instrument. It executes the production HTTP
/// handler through short-lived loopback connections; it never executes tools.
/// A separate offline fixture owner supplies tool results and grades outcomes.
private struct QuantizationSessionProtocol: Decodable {
    let schema: Int
    let kind: String
    let scope: String
    let memoryBytes: Int
    let contextLimit: Int
    let outputLimit: Int
    let draftDepth: Int
    let prefixCache: Bool
    let maximumRequests: Int
    let maximumSeconds: Int
    let seed: Int
    var vision: Bool { kind == "quantization-image-session-v1" }
    var reservesCompleteReply: Bool { kind == "quantization-tool-session-v2" || vision }
    /// Full original photographs retain their separately adopted six-GB
    /// preflight reserve; the live three-GB headroom guard still applies.
    var requiredPreflightBytes: Int { memoryBytes + (vision ? 6_000_000_000 : 3_000_000_000) }

    func checkReplyRoom(promptTokens: Int) throws {
        guard promptTokens >= 0, promptTokens <= contextLimit - outputLimit else {
            throw ModelError("session prompt does not leave the complete frozen reply allowance inside its context")
        }
    }

    static func load(_ file: URL, sha256: String) throws -> Self {
        let data = try AffineExpertControl.bounded(file, maximum: 64_000, sha256: sha256)
        let keys: Set<String> = ["schema", "kind", "scope", "memory_bytes", "context_limit", "output_limit",
            "draft_depth", "prefix_cache", "maximum_requests", "maximum_seconds", "seed"]
        guard let object = try JSONSerialization.jsonObject(with: data) as? [String: Any],
              Set(object.keys) == keys else { throw ModelError("session protocol has unknown or missing fields") }
        let decoder = JSONDecoder(); decoder.keyDecodingStrategy = .convertFromSnakeCase
        let value = try decoder.decode(Self.self, from: data)
        let outputLimits = value.reservesCompleteReply ? [128, 512, 1024, 2048, 4096, 12288] : [128, 512, 1024, 2048]
        guard value.schema == 1, ["quantization-tool-session-v1", "quantization-tool-session-v2", "quantization-image-session-v1"].contains(value.kind),
              ["instrument-check", "held-out"].contains(value.scope),
              (10_000_000_000...(value.vision ? 14_500_000_000 : 14_000_000_000)).contains(value.memoryBytes),
              value.memoryBytes.isMultiple(of: 100_000_000),
              [8192, 32768].contains(value.contextLimit), outputLimits.contains(value.outputLimit),
              value.outputLimit < value.contextLimit,
              [0, 2].contains(value.draftDepth), (1...(value.vision ? 32 : 256)).contains(value.maximumRequests),
              (1...1800).contains(value.maximumSeconds), value.seed == 7 else {
            throw ModelError("conversation protocol exceeds its declared resource or arithmetic scope")
        }
        return value
    }
}

/// Incremental framing bounds an unfinished line too. Polling keeps the
/// session's wall deadline effective when its owner disappears or goes idle.
private final class QuantizationSessionInput {
    private var buffered = Data()
    private let maximum = 1 << 20
    private let input: Int32

    init(input: Int32 = STDIN_FILENO) { self.input = input }

    func next(check: () throws -> Void) throws -> [String: Any]? {
        while true {
            try check()
            if let newline = buffered.firstIndex(of: 10) {
                let raw = Data(buffered[..<newline]); buffered = Data(buffered[buffered.index(after: newline)...])
                guard !raw.isEmpty, let value = try JSONSerialization.jsonObject(with: raw) as? [String: Any] else {
                    throw ModelError("session input must contain nonempty JSON objects")
                }
                return value
            }
            var descriptor = pollfd(fd: input, events: Int16(POLLIN), revents: 0)
            let ready = poll(&descriptor, 1, 250)
            if ready < 0 && errno == EINTR { continue }
            guard ready >= 0 else { throw ModelError("session input polling failed") }
            if ready == 0 { continue }
            var bytes = [UInt8](repeating: 0, count: 8192)
            let count = read(input, &bytes, bytes.count)
            if count < 0 && errno == EINTR { continue }
            guard count >= 0 else { throw ModelError("session input read failed") }
            if count == 0 {
                guard buffered.isEmpty else { throw ModelError("session input ended inside a JSON frame") }
                return nil
            }
            buffered.append(contentsOf: bytes.prefix(count))
            guard buffered.count <= maximum else { throw ModelError("session input exceeds one MiB") }
        }
    }
}

extension Diagnostics {
    /// The explicit manifest must precede every model allocation. Candidate
    /// mode remains outside the supported pack registry and product Auto.
    public static func quantizationSession(protocolFile: URL, protocolSHA256: String,
        baseline: URL, control: URL?, table: URL?, output: URL, planOnly: Bool = false,
        standaloneManifestSHA256: String? = nil) async throws -> Data {
        guard (control == nil) == (table == nil), !FileManager.default.fileExists(atPath: output.path),
              standaloneManifestSHA256 == nil || (control == nil && table == nil),
              !ProcessInfo.processInfo.environment.keys.contains(where: {
                  $0.hasPrefix("SLOTSTREAM_") || $0.hasPrefix("SS_DEBUG") || $0.hasPrefix("VQ_") || $0.hasPrefix("VQLAB_")
              }) else { throw ModelError("session requires explicit clean inputs, paired candidate paths and new output") }
        let specification = try QuantizationSessionProtocol.load(protocolFile, sha256: protocolSHA256)
        let standalone = try standaloneManifestSHA256.map { try AffineStandalonePack(directory: baseline, manifestSHA256: $0) }
        let artifact: AffineExpertControl.Artifact?
        if standalone != nil { artifact = .minmax }
        else { artifact = try control.map { try AffineExpertControl.identify(control: $0) } }
        let resources: PackMemoryProfile = artifact == nil ? .original
            : (specification.vision ? .affine3GroupedVisionControl : .affine3GroupedControl)
        let plan = try Planner.plan(resources: resources, expertsPerLayer: nil, poolGB: nil,
            memoryGB: Double(specification.memoryBytes) / 1e9,
            mtp: specification.draftDepth > 0 ? .on : .off, mtpAvailable: specification.draftDepth > 0,
            vision: specification.vision ? .on : .off, visionAvailable: specification.vision,
            maxContextTokens: specification.contextLimit, qualification: false,
            runtimePolicy: RuntimeAllocationPolicy(prefixCacheEnabled: specification.prefixCache),
            decodeLookahead: .off, mtpExperts: .streamed)
        guard plan.source == .memoryGB, plan.targetGB == Double(specification.memoryBytes) / 1e9,
              plan.mtpEnabled == (specification.draftDepth > 0),
              plan.maxContextTokens == specification.contextLimit, !plan.decodeLookahead,
              plan.visionEnabled == specification.vision,
              plan.mtpStreamedExperts == (specification.draftDepth > 0),
              plan.expectedPeakGB <= Double(specification.memoryBytes) / 1e9 else {
            throw ModelError("session planning changed a frozen setting or exceeded the ceiling")
        }
        try FileManager.default.createDirectory(at: output, withIntermediateDirectories: false,
            attributes: [.posixPermissions: 0o700])
        var identity: [String: Any] = ["schema": 1, "complete": false, "qualification": false,
            "scope": specification.scope, "protocol_sha256": protocolSHA256, "protocol_kind": specification.kind,
            "vision": specification.vision, "required_preflight_bytes": specification.requiredPreflightBytes,
            "resource_identity": resources.identity, "plan": plan.json(),
            "draft_depth": specification.draftDepth, "seed": specification.seed,
            "prefix_cache": specification.prefixCache, "output_limit": specification.outputLimit,
            "maximum_requests": specification.maximumRequests, "maximum_seconds": specification.maximumSeconds,
            "baseline_revision": PinnedModel.revision, "loaded": false, "requests": 0, "resets": 0,
            "admission_refusals": 0]
        if let artifact {
            identity["control_manifest_sha256"] = artifact.manifestSHA256
            identity["control_policy"] = artifact.policy
            identity["rotary_sha256"] = VQRotaryCoefficients.sha256
            identity["standalone_manifest_sha256"] = standalone?.manifestSHA256
        } else { identity["manifest_sha256"] = ModelPackRegistry.baseline.manifestDigest }
        func serialize(_ value: [String: Any]) throws -> Data {
            try JSONSerialization.data(withJSONObject: value, options: [.sortedKeys])
        }
        func save() throws -> Data {
            let data = try serialize(identity)
            try data.write(to: output.appendingPathComponent("receipt.json"), options: .atomic)
            return data
        }
        _ = try save()
        if planOnly { identity["complete"] = true; return try save() }
        try ModelProcessGuard.acquire()
        guard let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= UInt64(specification.requiredPreflightBytes) else {
            throw ModelError("session needs \(specification.requiredPreflightBytes) bytes of actual reclaimable memory")
        }
        let started = ProcessInfo.processInfo.systemUptime
        let oldLimit = MLX.Memory.memoryLimit, oldCache = MLX.Memory.cacheLimit
        MLX.Memory.memoryLimit = min(oldLimit, specification.memoryBytes - 1_000_000_000)
        MLX.Memory.cacheLimit = 128_000_000
        defer { Stream.gpu.synchronize(); MLX.Memory.clearCache(); MLX.Memory.cacheLimit = oldCache; MLX.Memory.memoryLimit = oldLimit }
        func checkResources() throws {
            guard ProcessInfo.processInfo.systemUptime - started < Double(specification.maximumSeconds),
                  ProcessMemory.peakResidentBytes() <= UInt64(specification.memoryBytes),
                  let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= 3_000_000_000 else {
                throw ModelError("session exceeded its time, physical process or actual headroom envelope")
            }
        }
        let journalURL = output.appendingPathComponent("conversation.jsonl")
        guard FileManager.default.createFile(atPath: journalURL.path, contents: Data(), attributes: [.posixPermissions: 0o600]) else {
            throw ModelError("cannot create session transcript")
        }
        let journal = try FileHandle(forWritingTo: journalURL)
        defer { try? journal.close() }
        var journalBytes = 0
        func emit(_ value: [String: Any]) throws {
            let data = try serialize(value) + Data([10])
            guard data.count <= 2 << 20, journalBytes <= 64_000_000 - data.count else {
                throw ModelError("session transcript exceeds its frozen storage bound")
            }
            try journal.write(contentsOf: data); try journal.synchronize()
            journalBytes += data.count
            try FileHandle.standardOutput.write(contentsOf: data)
        }
        do {
            let engine: Engine
            if let standalone {
                engine = try await Engine(modelDir: standalone.directory,
                    affineSource: AffineEngineSource(standalone: standalone, vision: specification.vision), plan: plan)
            } else if let control, let table, let artifact {
                engine = try await Engine(modelDir: baseline,
                    affineSource: AffineEngineSource(control: control, artifact: artifact, coefficients: table,
                        piecewiseAllocation: true, groupedExperts: true, vision: specification.vision), plan: plan)
            } else {
                try WeightStore.verify(at: baseline)
                engine = try await Engine(modelDir: baseline, plan: plan)
            }
            engine.generator.draftDepth = max(1, specification.draftDepth)
            engine.generator.footprintSampling = true
            engine.prefixCache.enabled = specification.prefixCache
            engine.gpuKeepAlive = .off
            guard (engine.model.mtpHead != nil) == (specification.draftDepth > 0),
                  engine.visionAllowed == specification.vision,
                  !specification.vision || engine.visionAvailable,
                  (engine.model.mtpHead?.expertStream != nil) == (specification.draftDepth > 0) else {
                throw ModelError("session loaded another draft configuration")
            }
            if specification.vision {
                let options = engine.model.optimizations
                guard options.visionQueryTile == 256, options.visionAttentionPadding == 0 else {
                    throw ModelError("image sessions require the separately bounded query-tiled vision mode")
                }
                identity["vision_query_tile"] = options.visionQueryTile
                identity["vision_attention_padding"] = options.visionAttentionPadding
            }
            try checkResources()
            identity["loaded"] = true; identity["model"] = engine.modelName
            identity["load_seconds"] = ProcessInfo.processInfo.systemUptime - started
            _ = try save()
            signal(SIGPIPE, SIG_IGN)
            let server = Server(engine: engine, port: 0)
            try emit(["event": "ready", "identity": identity])
            let input = QuantizationSessionInput()
            var seen = Set<String>(), requests = 0, resets = 0, refusals = 0, finished = false
            while let row = try input.next(check: checkResources) {
                guard let operation = row["op"] as? String else { throw ModelError("session frame has no operation") }
                if operation == "finish" {
                    guard Set(row.keys) == ["op"] else { throw ModelError("finish frame has unexpected fields") }
                    finished = true; break
                }
                guard let id = row["id"] as? String, (1...64).contains(id.utf8.count),
                      id.allSatisfy({ $0.isASCII && ($0.isLetter || $0.isNumber || $0 == "-" || $0 == "_") }),
                      seen.insert(id).inserted else { throw ModelError("session request identities must be unique and bounded") }
                if operation == "reset" {
                    guard Set(row.keys) == ["op", "id"], resets < specification.maximumRequests else {
                        throw ModelError("session reset exceeds its frame or count bound")
                    }
                    engine.withExclusive { engine.prefixCache.drop() }
                    resets += 1; identity["resets"] = resets; _ = try save()
                    try emit(["event": "reset", "id": id]); continue
                }
                guard operation == "chat", Set(row.keys) == ["op", "id", "body"],
                      requests < specification.maximumRequests, var body = row["body"] as? [String: Any],
                      Set(body.keys).isSubset(of: ["messages", "tools"]), body["messages"] != nil else {
                    throw ModelError("session chat exceeds its frame, body or count bound")
                }
                body["model"] = engine.modelName; body["stream"] = false; body["think"] = false
                body["temperature"] = 0; body["seed"] = specification.seed; body["max_tokens"] = specification.outputLimit
                // V1 remains the frozen sizing-pilot behavior. V2 separately
                // admits the app's ordinary/proposal reply limits and reserves
                // every requested output token before entering generation.
                // These are the same two text-rendering paths as the OpenAI
                // handler. The observed HTTP usage below must agree exactly;
                // a future handler change cannot silently invalidate the gate.
                var reservedPromptTokens: Int?
                if specification.reservesCompleteReply {
                    let request = try OpenAIDialect.conversation(body, contextLimit: specification.contextLimit)
                    let images = request.messages.flatMap { $0.images }
                    guard specification.vision || images.isEmpty else {
                        throw ModelError("text outcome sessions do not admit image requests")
                    }
                    let raw = body["messages"] as? [[String: Any]] ?? []
                    let extended = !request.tools.isEmpty
                        || request.messages.contains { $0.role == "tool" || !$0.toolCalls.isEmpty || $0.reasoning != nil }
                        || raw.contains { $0["role"] as? String == "developer" }
                        || raw.filter { $0["role"] as? String == "system" }.count > 1
                    let ids: [Int]
                    if extended && !images.isEmpty {
                        // Image requests take encodeChatWithVision in the
                        // production handler, which renders encodeChat first.
                        ids = try engine.encodeChat(request.messages, tools: request.tools, thinking: false, effort: nil)
                    } else if extended {
                        ids = try engine.encodeChatSpliced(request.messages, tools: request.tools, thinking: false, effort: nil)
                    } else {
                        ids = try engine.encodeChatOpenAI(messages: Server.templateMessages(body), tools: nil, thinking: false)
                    }
                    let promptTokens = try engine.countImageTokens(baseCount: ids.count, sources: images)
                    if promptTokens > specification.contextLimit - specification.outputLimit {
                        // A complete tool workflow may exhaust its declared
                        // context. Record that task outcome without silently
                        // shortening the reply or killing unrelated cases.
                        // This is an instrument admission event, never a fake
                        // HTTP response and never a model/tool execution.
                        try checkResources()
                        requests += 1; refusals += 1
                        try emit(["event": "admission_refusal", "id": id,
                            "code": "reply_reservation_exceeded", "request": body,
                            "prompt_tokens": promptTokens, "output_limit": specification.outputLimit,
                            "context_limit": specification.contextLimit])
                        identity["requests"] = requests; identity["resets"] = resets
                        identity["admission_refusals"] = refusals
                        identity["peak_process_bytes"] = ProcessMemory.peakResidentBytes()
                        _ = try save(); continue
                    }
                    try specification.checkReplyRoom(promptTokens: promptTokens)
                    reservedPromptTokens = promptTokens
                    try checkResources()
                }
                let began = ProcessInfo.processInfo.systemUptime
                let response = try OutputHTTPConnection(server: server, path: "/v1/chat/completions", object: body,
                    timeoutSeconds: specification.maximumSeconds).readResponse()
                let parsed = try JSONSerialization.jsonObject(with: Data(response.body.utf8))
                try checkResources()
                guard engine.model.pool.pinnedSlotCount == 0 else { throw ModelError("session response retained expert pins") }
                requests += 1
                var event: [String: Any] = ["event": "response", "id": id, "request": body, "http_head": response.head,
                    "response": parsed, "request_seconds": ProcessInfo.processInfo.systemUptime - began,
                    "peak_process_bytes": ProcessMemory.peakResidentBytes()]
                if specification.vision, let current = engine.currentPlan { event["applied_plan"] = current.json() }
                if let reservedPromptTokens { event["reserved_prompt_tokens"] = reservedPromptTokens }
                try emit(event)
                if let reservedPromptTokens, response.head.hasPrefix("HTTP/1.1 200") {
                    guard let object = parsed as? [String: Any], let usage = object["usage"] as? [String: Any],
                          usage["prompt_tokens"] as? Int == reservedPromptTokens else {
                        throw ModelError("actual HTTP prompt differs from the frozen reply reservation")
                    }
                }
                identity["requests"] = requests; identity["resets"] = resets
                identity["peak_process_bytes"] = ProcessMemory.peakResidentBytes(); _ = try save()
            }
            guard finished, requests > 0 else { throw ModelError("session ended without an explicit completed conversation") }
            try checkResources()
            identity["complete"] = true; identity["seconds"] = ProcessInfo.processInfo.systemUptime - started
            let data = try save(); try emit(["event": "complete", "receipt": identity]); return data
        } catch {
            identity["failure"] = String(describing: error); identity["peak_process_bytes"] = ProcessMemory.peakResidentBytes()
            _ = try? save(); throw error
        }
    }

    /// EOF, malformed frames and cancellation must be testable without weights.
    public static func quantizationSessionFraming() throws -> CheckReport {
        var c = CheckBuilder("quantization-session-framing")
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: false)
        defer { try? FileManager.default.removeItem(at: directory) }
        func readFrames(_ data: Data) throws -> [[String: Any]] {
            let file = directory.appendingPathComponent(UUID().uuidString)
            try data.write(to: file)
            let handle = try FileHandle(forReadingFrom: file)
            defer { try? handle.close() }
            let input = QuantizationSessionInput(input: handle.fileDescriptor)
            var frames: [[String: Any]] = []
            while let frame = try input.next(check: {}) { frames.append(frame) }
            return frames
        }
        c.equal("clean EOF is explicit and contains no request", try readFrames(Data()).count, 0)
        let frames = try readFrames(Data("{\"op\":\"reset\",\"id\":\"one\"}\n{\"op\":\"finish\"}\n".utf8))
        c.equal("coalesced frames preserve order", frames.compactMap { $0["op"] as? String }, ["reset", "finish"])
        for (name, data) in [
            ("unfinished object", Data("{\"op\":\"finish\"}".utf8)),
            ("truncated JSON", Data("{\"op\":\n".utf8)),
            ("empty line", Data([10])), ("array", Data("[]\n".utf8)),
            ("unbounded unfinished frame", Data(repeating: 32, count: (1 << 20) + 1))
        ] {
            var refused = false
            do { _ = try readFrames(data) } catch { refused = true }
            c.expect("refuse \(name)", refused)
        }
        var descriptors: [Int32] = [-1, -1]
        guard pipe(&descriptors) == 0 else { throw ModelError("cannot create idle input fixture") }
        defer { close(descriptors[0]); close(descriptors[1]) }
        let idle = QuantizationSessionInput(input: descriptors[0])
        var polls = 0, cancelled = false
        do {
            _ = try idle.next {
                polls += 1
                if polls == 2 { throw ModelError("fixture deadline") }
            }
        } catch { cancelled = true }
        c.expect("idle input returns control to the resource deadline", cancelled && polls == 2)
        var protocolObject: [String: Any] = ["schema": 1, "kind": "quantization-tool-session-v2",
            "scope": "instrument-check", "memory_bytes": 10_000_000_000, "context_limit": 32768,
            "output_limit": 4096, "draft_depth": 2, "prefix_cache": true, "maximum_requests": 8,
            "maximum_seconds": 1800, "seed": 7]
        func loadProtocol(_ object: [String: Any]) throws -> QuantizationSessionProtocol {
            let data = try JSONSerialization.data(withJSONObject: object, options: [.sortedKeys])
            let file = directory.appendingPathComponent(UUID().uuidString)
            try data.write(to: file)
            return try QuantizationSessionProtocol.load(file, sha256: AffineExpertControl.digest(data))
        }
        for output in [4096, 12288] {
            protocolObject["output_limit"] = output
            let protocolValue = try loadProtocol(protocolObject)
            c.expect("V2 admits the explicit app reply limit \(output)", protocolValue.reservesCompleteReply)
            try protocolValue.checkReplyRoom(promptTokens: protocolValue.contextLimit - output)
            for tokens in [-1, protocolValue.contextLimit - output + 1, Int.max] {
                var refused = false
                do { try protocolValue.checkReplyRoom(promptTokens: tokens) } catch { refused = true }
                c.expect("V2 refuses incomplete reply reservation \(output)/\(tokens)", refused)
            }
        }
        for (name, change) in [
            ("V1 retains its smaller output scope", ["kind": "quantization-tool-session-v1"] as [String: Any]),
            ("proposal does not fit an eight-K context", ["context_limit": 8192]),
            ("unpriced output limit", ["output_limit": 8192]),
            ("unknown protocol version", ["kind": "quantization-tool-session-v3"])
        ] {
            var changed = protocolObject
            for (key, value) in change { changed[key] = value }
            var refused = false
            do { _ = try loadProtocol(changed) } catch { refused = true }
            c.expect(name, refused)
        }
        var imageProtocol = protocolObject
        imageProtocol["kind"] = "quantization-image-session-v1"
        imageProtocol["memory_bytes"] = 14_500_000_000
        imageProtocol["maximum_requests"] = 32
        imageProtocol["output_limit"] = 512
        let imageValue = try loadProtocol(imageProtocol)
        c.expect("image protocol separately admits owned vision", imageValue.vision && imageValue.reservesCompleteReply)
        c.equal("full photographs retain their actual preflight reserve", imageValue.requiredPreflightBytes, 20_500_000_000)
        try imageValue.checkReplyRoom(promptTokens: imageValue.contextLimit - imageValue.outputLimit)
        for (name, change) in [
            ("text protocols cannot inherit the larger image budget", ["kind": "quantization-tool-session-v2"] as [String: Any]),
            ("image process ceiling stays bounded", ["memory_bytes": 14_600_000_000]),
            ("image transcripts retain a smaller request envelope", ["maximum_requests": 33]),
            ("image reply allowance stays explicit", ["output_limit": 8192]),
            ("image sessions retain checked draft depths", ["draft_depth": 3])
        ] {
            var changed = imageProtocol
            for (key, value) in change { changed[key] = value }
            var refused = false
            do { _ = try loadProtocol(changed) } catch { refused = true }
            c.expect(name, refused)
        }
        // Metadata and planner checks only. The deployed query tile bounds
        // vision workspace independently of the candidate's 512-row language
        // prefill cap. These checks do not execute a tower or certify a peak.
        let options = try InferenceOptimizations.environment([:])
        c.equal("image session retains deployed vision query tiling", options.visionQueryTile, 256)
        c.equal("image session retains unpadded tiled vision arithmetic", options.visionAttentionPadding, 0)
        let configuration = VisionConfig()
        let bounds = VisionPreprocess.effectiveBounds(cfgMin: 65_536, cfgMax: 16_777_216)
        for resources in [PackMemoryProfile.original, .affine3GroupedVisionControl] {
            let plan = try Planner.plan(resources: resources, expertsPerLayer: nil, poolGB: nil, memoryGB: 14.5,
                ramGB: 48, workingSetGB: 36, availableGB: 28,
                mtp: .on, mtpAvailable: true, vision: .on, visionAvailable: true,
                maxContextTokens: 32_768, simulated: true, qualification: false,
                runtimePolicy: RuntimeAllocationPolicy(prefixCacheEnabled: true),
                decodeLookahead: .off, mtpExperts: .streamed)
            let loaded = try Planner.loadingVision(plan, availableGB: 28)
            c.expect("\(resources.identity): image plan retains context and complete draft", loaded.maxContextTokens == 32_768
                && loaded.mtpEnabled && loaded.mtpStreamedExperts && loaded.visionResidentReserved)
            c.expect("\(resources.identity): tower reservation never grows the arena", loaded.slots <= plan.slots)
            for (width, height) in [(846, 859), (1206, 1570), (512, 512), (256, 256), (1536, 1536)] {
                let image = try VisionTower.plan(height: height, width: width, cfg: configuration, bounds: bounds)
                let workspace = ContextBytes.sum(ContextWorkspace.visionBytes(patches: image.patches,
                    hidden: configuration.hiddenSize, heads: configuration.numHeads,
                    queryTile: options.visionQueryTile, padding: options.visionAttentionPadding),
                    try VisionPreprocess.decodedImageCharge(width: width, height: height))
                let ledger = loaded.memoryLedger
                let peak = ContextBytes.sum(ledger.expectedPeakBytes - ledger.prefillBytes,
                                            max(ledger.prefillBytes, workspace))
                c.expect("\(resources.identity): \(width)x\(height) has complete workspace inside target", peak <= 14_500_000_000)
                c.measure("\(resources.identity).\(width)x\(height).workspace_bytes", Double(workspace))
            }
        }
        return c.report()
    }
}
