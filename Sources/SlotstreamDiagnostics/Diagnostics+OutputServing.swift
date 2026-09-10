import Darwin
import Foundation
import MLX
import Slotstream

/// A real loopback connection entering the same HTTP handler as Server.run.
/// The diagnostic owns only the client; handle() owns and closes the accepted fd.
private final class OutputHTTPConnection {
    let client: Int32
    let serverFD: Int32
    let done = DispatchGroup()
    private var closed = false

    init(server: Server, path: String, object: [String: Any]?, narrowWindow: Bool = false) throws {
        let listener = try Server.bindPort(0)
        defer { close(listener) }
        guard listen(listener, 1) == 0 else { throw ModelError("diagnostic listen failed") }
        var address = sockaddr_in(), length = socklen_t(MemoryLayout<sockaddr_in>.size)
        let named = withUnsafeMutablePointer(to: &address) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { getsockname(listener, $0, &length) }
        }
        guard named == 0 else { throw ModelError("diagnostic socket address failed") }
        client = socket(AF_INET, SOCK_STREAM, 0)
        guard client >= 0 else { throw ModelError("diagnostic client socket failed") }
        if narrowWindow {
            var size: Int32 = 1024
            guard setsockopt(client, SOL_SOCKET, SO_RCVBUF, &size, socklen_t(MemoryLayout<Int32>.size)) == 0 else {
                close(client); throw ModelError("diagnostic receive window failed")
            }
        }
        let connectingClient = client
        let connected = withUnsafePointer(to: &address) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { connect(connectingClient, $0, length) }
        }
        guard connected == 0 else { close(client); throw ModelError("diagnostic connect failed") }
        serverFD = accept(listener, nil, nil)
        guard serverFD >= 0 else { close(client); throw ModelError("diagnostic accept failed") }
        var timeout = timeval(tv_sec: 30, tv_usec: 0), one: Int32 = 1
        for fd in [client, serverFD] {
            setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, &timeout, socklen_t(MemoryLayout<timeval>.size))
            setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, &timeout, socklen_t(MemoryLayout<timeval>.size))
            setsockopt(fd, SOL_SOCKET, SO_NOSIGPIPE, &one, socklen_t(MemoryLayout<Int32>.size))
        }
        if narrowWindow {
            var size: Int32 = 1024
            setsockopt(serverFD, SOL_SOCKET, SO_SNDBUF, &size, socklen_t(MemoryLayout<Int32>.size))
        }
        let payload: Data
        do { payload = try object.map { try JSONSerialization.data(withJSONObject: $0) } ?? Data() }
        catch { close(client); close(serverFD); throw error }
        let method = object == nil ? "GET" : "POST"
        let header = "\(method) \(path) HTTP/1.1\r\nHost: localhost\r\nContent-Type: application/json\r\nContent-Length: \(payload.count)\r\nConnection: close\r\n\r\n"
        let request = Data(header.utf8) + payload
        done.enter()
        let peer = serverFD, completion = done
        Thread.detachNewThread { server.handle(peer); completion.leave() }
        do {
            try request.withUnsafeBytes { bytes in
                var sent = 0
                while sent < bytes.count {
                    let n = Darwin.send(client, bytes.baseAddress! + sent, bytes.count - sent, 0)
                    if n < 0 && errno == EINTR { continue }
                    guard n > 0 else { throw ModelError("diagnostic request write failed") }
                    sent += n
                }
            }
        } catch { closeAndJoin(); throw error }
    }

    func closeAndJoin() {
        guard !closed else { return }
        closed = true
        shutdown(client, SHUT_RDWR)
        // A failed case still cancels the producer and joins before another
        // model operation can begin. Never close/recycle the handler's fd here.
        let joined = done.wait(timeout: .now() + 30)
        close(client)
        precondition(joined == .success, "diagnostic handler failed to drain after disconnect")
    }
    deinit { closeAndJoin() }

    func readResponse() throws -> (head: String, body: String) {
        var wire = Data(), buffer = [UInt8](repeating: 0, count: 8192)
        while true {
            let n = recv(client, &buffer, buffer.count, 0)
            if n < 0 && errno == EINTR { continue }
            guard n >= 0 else { throw ModelError("diagnostic response timed out") }
            if n == 0 { break }
            wire.append(contentsOf: buffer.prefix(n))
            guard wire.count <= 1 << 20 else { throw ModelError("diagnostic response exceeded 1 MiB") }
        }
        guard done.wait(timeout: .now() + 5) == .success,
              let separator = wire.range(of: Data("\r\n\r\n".utf8)) else {
            throw ModelError("diagnostic response lacks completed HTTP head")
        }
        let head = String(decoding: wire[..<separator.lowerBound], as: UTF8.self)
        let raw = Data(wire[separator.upperBound...])
        guard head.lowercased().contains("transfer-encoding: chunked") else {
            return (head, String(decoding: raw, as: UTF8.self))
        }
        var body = Data(), cursor = 0
        while cursor < raw.count {
            guard let end = raw[cursor...].range(of: Data("\r\n".utf8)),
                  let n = Int(String(decoding: raw[cursor..<end.lowerBound], as: UTF8.self), radix: 16) else {
                throw ModelError("diagnostic invalid chunk length")
            }
            cursor = end.upperBound
            guard n >= 0, n <= raw.count - cursor, raw.count - cursor - n >= 2,
                  raw[cursor+n] == 13, raw[cursor+n+1] == 10 else {
                throw ModelError("diagnostic truncated chunk")
            }
            if n == 0 {
                guard cursor + 2 == raw.count else { throw ModelError("diagnostic trailing response bytes") }
                return (head, String(decoding: body, as: UTF8.self))
            }
            body.append(raw[cursor..<cursor+n]); cursor += n + 2
        }
        throw ModelError("diagnostic missing final HTTP chunk")
    }
}

private final class OutputWriterObservations: @unchecked Sendable {
    private let lock = NSLock()
    private var writers: [Int32: BoundedOutput] = [:]
    func put(_ fd: Int32, _ writer: BoundedOutput) { lock.lock(); writers[fd] = writer; lock.unlock() }
    func get(_ fd: Int32) -> BoundedOutput? { lock.lock(); defer { lock.unlock() }; return writers[fd] }
    func clear() { lock.lock(); writers.removeAll(); lock.unlock() }
}

extension Diagnostics {
    public static func optimizationOutputServing(modelDir: URL) async throws -> CheckReport {
        let plan = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 8.1,
            mtp: .off, mtpAvailable: false, vision: .off)
        let engine = try await Engine(modelDir: modelDir, plan: plan)
        return try outputServing(engine: engine, plan: plan)
    }

    private static func outputServing(engine: Engine, plan: MemoryPlan) throws -> CheckReport {
        guard engine.responsiveGovernor else { throw ModelError("output-serving requires SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR=1") }
        engine.generator.prefillChunk = 256
        engine.generator.speculationEnabled = false
        engine.model.optimizations.boundedOutputQueue = true
        engine.model.optimizations.compactStateWindows = true
        engine.model.optimizations.skipUnusedFinalForward = true
        engine.prefixCache.enabled = false
        MLX.Memory.cacheLimit = 128 << 20
        let server = Server(engine: engine, port: 0), observations = OutputWriterObservations()
        server.outputObserver = { observations.put($0, $1) }
        signal(SIGPIPE, SIG_IGN)
        var c = CheckBuilder("optimization-output-serving")
        let prompt = "Count from one to one thousand, writing every number in words, separated by commas. Do not abbreviate or stop early."
        let messages: [[String: Any]] = [["role": "user", "content": prompt]]
        let variants: [(String, String, [String: Any])] = [
            ("generate", "/api/generate", ["prompt": prompt, "raw": true, "stream": true,
                "options": ["num_predict": 256, "temperature": 0, "seed": 7]]),
            ("chat", "/api/chat", ["messages": messages, "stream": true, "think": false,
                "options": ["num_predict": 256, "temperature": 0, "seed": 7]]),
            ("OpenAI", "/v1/chat/completions", ["messages": messages, "stream": true,
                "max_tokens": 256, "temperature": 0, "seed": 7]),
            ("Gateway", "/v3/ai/language-model", ["prompt": [["role": "user", "content": [["type": "text", "text": prompt]]]],
                "toolChoice": ["type": "auto"], "maxOutputTokens": 256, "temperature": 0, "seed": 7])
        ]
        let fastBody: [String: Any] = ["prompt": "The capital of France is", "raw": true, "stream": false,
            "options": ["num_predict": 4, "temperature": 0, "seed": 7]]
        func fastRequest() throws -> String {
            let connection = try OutputHTTPConnection(server: server, path: "/api/generate", object: fastBody)
            defer { connection.closeAndJoin() }
            let response = try connection.readResponse()
            guard response.head.hasPrefix("HTTP/1.1 200"),
                let json = try JSONSerialization.jsonObject(with: Data(response.body.utf8)) as? [String: Any],
                json["done"] as? Bool == true, let text = json["response"] as? String else {
                throw ModelError("queued request failed: \(response.body)")
            }
            return text
        }
        let expected = try fastRequest()
        let ordinaryPins = engine.model.pool.pinnedSlotCount
        c.expect("baseline actual HTTP output is nonempty", !expected.isEmpty)
        for (name, path, body) in variants {
            let stalled = try OutputHTTPConnection(server: server, path: path, object: body, narrowWindow: true)
            defer { stalled.closeAndJoin() }
            let started = RuntimeClock.now()
            var writer: BoundedOutput?
            repeat {
                writer = observations.get(stalled.serverFD)
                if writer != nil { break }
                if stalled.done.wait(timeout: .now() + 0.025) == .success { break }
            } while RuntimeClock.seconds(since: started) < 10
            guard let writer else { throw ModelError("\(name): production writer was not created") }
            // A short bounded reply need not fill Darwin's TCP buffers, even
            // with a small requested socket window. Seed a declared 512 KiB
            // backlog through the SAME production queue, with valid HTTP and
            // NDJSON/SSE framing. This is controlled backlog injection, not a
            // claim that ordinary 256-token replies naturally saturate TCP.
            // No queue limit/deadline or model output is changed. Other tests
            // establish unmodified-stream byte equality.
            let padding = String(repeating: " ", count: 512 << 10)
            let payload = Data((name == "generate" || name == "chat"
                ? "{\"diagnostic_padding\":\"\(padding)\"}\n"
                : ": diagnostic_padding \(padding)\n\n").utf8)
            let backlog = Data("\(String(payload.count, radix: 16))\r\n".utf8) + payload + Data("\r\n".utf8)
            c.expect("\(name): bounded diagnostic backlog accepted", writer.enqueue(backlog))
            let backlogStart = RuntimeClock.now()
            while writer.snapshot.socketWaitSeconds == 0 && writer.alive
                && RuntimeClock.seconds(since: backlogStart) < 2 {
                _ = stalled.done.wait(timeout: .now() + 0.025)
            }
            guard writer.snapshot.socketWaitSeconds > 0 else {
                c.expect("\(name): actual TCP backlog stalls", false)
                return c.report()
            }
            c.expect("\(name): actual TCP writer stalls during generation", writer.alive)
            c.expect("\(name): inference gate is occupied before queued request", !engine.tryWithExclusive {})
            let health = try OutputHTTPConnection(server: server, path: "/", object: nil)
            let healthStart = RuntimeClock.now()
            let healthResult = try health.readResponse(); health.closeAndJoin()
            c.expect("\(name): health remains responsive during stall", healthResult.head.hasPrefix("HTTP/1.1 200") && RuntimeClock.seconds(since: healthStart) < 2)
            let queued = RuntimeClock.now()
            let actual = try fastRequest()
            let elapsed = RuntimeClock.seconds(since: queued)
            c.equal("\(name): queued inference recovers exact output", actual, expected)
            c.expect("\(name): slow peer cannot hold inference indefinitely", elapsed < 20, "\(elapsed) seconds")
            c.expect("\(name): stalled handler joins without reading its response", stalled.done.wait(timeout: .now() + 5) == .success)
            let snapshot = writer.snapshot
            c.expect("\(name): real writer deadline/failure observed", snapshot.failed && snapshot.socketWaitSeconds > 0)
            c.expect("\(name): production queue storage stays bounded", snapshot.peakOwnedBytes <= 1 << 20)
            c.expect("\(name): accepted and written bytes remain distinct", snapshot.queuedBytes > snapshot.writtenBytes)
            // Ordinary completion retains the final layer's bookkeeping pins;
            // the next forward/resize clears them after its existing barrier.
            // A stalled request must not accumulate pins across requests.
            c.equal("\(name): pin bookkeeping matches ordinary completion", engine.model.pool.pinnedSlotCount, ordinaryPins)
            c.expect("\(name): generation gate is available after both requests", engine.tryWithExclusive {})
            c.measure("\(name).queued_request_seconds", elapsed)
            c.measure("\(name).socket_wait_seconds", snapshot.socketWaitSeconds)
            c.measure("\(name).peak_owned_bytes", Double(snapshot.peakOwnedBytes))
            stalled.closeAndJoin(); observations.clear()
        }

        // Drive the real governor queue with a bounded shrink-only policy event,
        // without inducing OS pressure or pretending additional RAM exists.
        engine.updatePlan(MemoryPlan(source: .auto, slots: plan.slots, targetGB: plan.targetGB,
            ramGB: plan.ramGB, workingSetGB: plan.workingSetGB, ramPercent: plan.ramPercent,
            availableGB: 0, clamped: true, prefillChunk: 256, prefixCacheTokens: 1024,
            mtpEnabled: false, visionEnabled: false, maxContextTokens: plan.maxContextTokens,
            notes: ["real HTTP pressure diagnostic; existing bounded allocation, shrink only"]))
        let previous = Planner.availabilityOverride
        Planner.availabilityOverride = 0
        defer { Planner.availabilityOverride = previous }
        let governor = MemoryGovernor(engine: engine)
        let pressurePrompt = String(repeating: "This sentence keeps the prefix longer than one committed prefill pass. ", count: 50)
        let requested = DispatchSemaphore(value: 0), finished = DispatchSemaphore(value: 0)
        var triggered = false, acknowledged = false
        engine.generator.onPrefillProgress = { done, _, _ in
            guard !triggered, done >= 256 else { return }
            triggered = true
            DispatchQueue.global().async {
                governor.pressureNow(.critical) { requested.signal() }
                finished.signal()
            }
            acknowledged = requested.wait(timeout: .now() + 5) == .success
        }
        defer { engine.generator.onPrefillProgress = nil }
        let pressureBody: [String: Any] = ["prompt": [["role": "user", "content": [["type": "text", "text": pressurePrompt]]]],
            "toolChoice": ["type": "auto"], "maxOutputTokens": 8, "temperature": 0, "seed": 7]
        let pressure = try OutputHTTPConnection(server: server, path: "/v3/ai/language-model", object: pressureBody)
        let response = try pressure.readResponse(); pressure.closeAndJoin()
        engine.generator.onPrefillProgress = nil
        c.expect("Gateway: actual governor event reaches committed prefill", triggered && acknowledged)
        guard triggered, finished.wait(timeout: .now() + 10) == .success else { throw ModelError("HTTP pressure event failed to drain") }
        c.expect("Gateway: streamed pressure failure is explicit", response.head.hasPrefix("HTTP/1.1 200") && response.body.contains("memory pressure interrupted inference") && response.body.contains("inference_error"))
        c.expect("Gateway: pressure never emits a false successful finish", !response.body.contains("\"type\":\"finish\"") && !response.body.contains("[DONE]"))
        c.equal("Gateway: shrink respects pool floor", engine.poolSnapshot().slots, Geometry.floorSlots)
        c.expect("Gateway: completed pressure is acknowledged", engine.pressureBoundary.snapshot() == nil)
        c.equal("Gateway: pressure releases every expert pin", engine.model.pool.pinnedSlotCount, 0)
        c.equal("Gateway: retry after pressure is exact", try fastRequest(), expected)
        // A pending event must also fail a non-streamed request before model work.
        let ticket = engine.pressureBoundary.request()
        let refused = try OutputHTTPConnection(server: server, path: "/api/generate", object: fastBody)
        let refusal = try refused.readResponse(); refused.closeAndJoin()
        c.expect("queued JSON: pending pressure reports HTTP failure", refusal.head.hasPrefix("HTTP/1.1 500") && refusal.body.contains("memory pressure interrupted inference"))
        engine.pressureBoundary.acknowledge(ticket)
        c.equal("queued JSON: acknowledgement restores exact inference", try fastRequest(), expected)
        return c.report()
    }
}
