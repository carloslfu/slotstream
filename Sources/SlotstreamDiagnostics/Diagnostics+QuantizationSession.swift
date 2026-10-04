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

    static func load(_ file: URL, sha256: String) throws -> Self {
        let data = try AffineExpertControl.bounded(file, maximum: 64_000, sha256: sha256)
        let keys: Set<String> = ["schema", "kind", "scope", "memory_bytes", "context_limit", "output_limit",
            "draft_depth", "prefix_cache", "maximum_requests", "maximum_seconds", "seed"]
        guard let object = try JSONSerialization.jsonObject(with: data) as? [String: Any],
              Set(object.keys) == keys else { throw ModelError("session protocol has unknown or missing fields") }
        let decoder = JSONDecoder(); decoder.keyDecodingStrategy = .convertFromSnakeCase
        let value = try decoder.decode(Self.self, from: data)
        guard value.schema == 1, value.kind == "quantization-tool-session-v1",
              ["instrument-check", "held-out"].contains(value.scope),
              (10_000_000_000...14_000_000_000).contains(value.memoryBytes),
              value.memoryBytes.isMultiple(of: 100_000_000),
              [8192, 32768].contains(value.contextLimit), [128, 512, 1024, 2048].contains(value.outputLimit),
              [0, 2].contains(value.draftDepth), (1...256).contains(value.maximumRequests),
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
        baseline: URL, control: URL?, table: URL?, output: URL, planOnly: Bool = false) async throws -> Data {
        guard (control == nil) == (table == nil), !FileManager.default.fileExists(atPath: output.path),
              !ProcessInfo.processInfo.environment.keys.contains(where: {
                  $0.hasPrefix("SLOTSTREAM_") || $0.hasPrefix("SS_DEBUG") || $0.hasPrefix("VQ_") || $0.hasPrefix("VQLAB_")
              }) else { throw ModelError("session requires explicit clean inputs, paired candidate paths and new output") }
        let specification = try QuantizationSessionProtocol.load(protocolFile, sha256: protocolSHA256)
        let resources: PackMemoryProfile = control == nil ? .original : .affine3GroupedControl
        let plan = try Planner.plan(resources: resources, expertsPerLayer: nil, poolGB: nil,
            memoryGB: Double(specification.memoryBytes) / 1e9,
            mtp: specification.draftDepth > 0 ? .on : .off, mtpAvailable: specification.draftDepth > 0,
            vision: .off, maxContextTokens: specification.contextLimit, qualification: false,
            runtimePolicy: RuntimeAllocationPolicy(prefixCacheEnabled: specification.prefixCache),
            decodeLookahead: .off, mtpExperts: .streamed)
        guard plan.source == .memoryGB, plan.targetGB == Double(specification.memoryBytes) / 1e9,
              plan.mtpEnabled == (specification.draftDepth > 0),
              plan.maxContextTokens == specification.contextLimit, !plan.decodeLookahead,
              plan.mtpStreamedExperts == (specification.draftDepth > 0),
              plan.expectedPeakGB <= Double(specification.memoryBytes) / 1e9 else {
            throw ModelError("session planning changed a frozen setting or exceeded the ceiling")
        }
        try FileManager.default.createDirectory(at: output, withIntermediateDirectories: false,
            attributes: [.posixPermissions: 0o700])
        var identity: [String: Any] = ["schema": 1, "complete": false, "qualification": false,
            "scope": specification.scope, "protocol_sha256": protocolSHA256,
            "resource_identity": resources.identity, "plan": plan.json(),
            "draft_depth": specification.draftDepth, "seed": specification.seed,
            "prefix_cache": specification.prefixCache, "output_limit": specification.outputLimit,
            "maximum_requests": specification.maximumRequests, "maximum_seconds": specification.maximumSeconds,
            "baseline_revision": PinnedModel.revision, "loaded": false, "requests": 0, "resets": 0]
        if control != nil {
            identity["control_manifest_sha256"] = AffineExpertControl.manifestSHA256
            identity["rotary_sha256"] = VQRotaryCoefficients.sha256
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
        guard let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= UInt64(specification.memoryBytes + 3_000_000_000) else {
            throw ModelError("session needs its physical ceiling plus three GB actual reclaimable memory")
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
            if let control, let table {
                engine = try await Engine(modelDir: baseline,
                    affineSource: AffineEngineSource(control: control, coefficients: table,
                        piecewiseAllocation: true, groupedExperts: true), plan: plan)
            } else {
                try WeightStore.verify(at: baseline)
                engine = try await Engine(modelDir: baseline, plan: plan)
            }
            engine.generator.draftDepth = max(1, specification.draftDepth)
            engine.generator.footprintSampling = true
            engine.prefixCache.enabled = specification.prefixCache
            engine.gpuKeepAlive = .off
            guard (engine.model.mtpHead != nil) == (specification.draftDepth > 0),
                  (engine.model.mtpHead?.expertStream != nil) == (specification.draftDepth > 0) else {
                throw ModelError("session loaded another draft configuration")
            }
            try checkResources()
            identity["loaded"] = true; identity["model"] = engine.modelName
            identity["load_seconds"] = ProcessInfo.processInfo.systemUptime - started
            _ = try save()
            signal(SIGPIPE, SIG_IGN)
            let server = Server(engine: engine, port: 0)
            try emit(["event": "ready", "identity": identity])
            let input = QuantizationSessionInput()
            var seen = Set<String>(), requests = 0, resets = 0, finished = false
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
                let began = ProcessInfo.processInfo.systemUptime
                let response = try OutputHTTPConnection(server: server, path: "/v1/chat/completions", object: body,
                    timeoutSeconds: specification.maximumSeconds).readResponse()
                let parsed = try JSONSerialization.jsonObject(with: Data(response.body.utf8))
                try checkResources()
                guard engine.model.pool.pinnedSlotCount == 0 else { throw ModelError("session response retained expert pins") }
                requests += 1
                try emit(["event": "response", "id": id, "request": body, "http_head": response.head,
                    "response": parsed, "request_seconds": ProcessInfo.processInfo.systemUptime - began,
                    "peak_process_bytes": ProcessMemory.peakResidentBytes()])
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
        return c.report()
    }
}
