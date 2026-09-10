import Darwin
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Fake observations through real handlers, GPU work and cleanup. A single
    /// floor pool serves every case; no simulated value authorizes more memory.
    public static func contextServing(modelDir: URL) async throws -> CheckReport {
        let plan = try Planner.plan(expertsPerLayer: nil, poolGB: 1.769472, memoryGB: nil,
            mtp: .off, vision: .off, maxContextTokens: 65536)
        let engine = try await Engine(modelDir: modelDir, plan: plan)
        engine.generator.speculationEnabled = false
        engine.generator.prefillChunk = 256
        engine.generator.prefillCacheLimit = 64 << 20
        let server = Server(engine: engine, port: 0)
        signal(SIGPIPE, SIG_IGN)
        var c = CheckBuilder("context-serving")
        defer {
            engine.requestControllerOverride = nil; engine.model.routerObserver = nil
            if let ticket = engine.pressureBoundary.snapshot() { engine.pressureBoundary.acknowledge(ticket) }
        }
        func exchange(_ path: String,_ object: [String:Any]?) throws -> (head: String,body: String) {
            let payload = try object.map { try JSONSerialization.data(withJSONObject: $0) } ?? Data()
            var fds: [Int32] = [-1,-1]
            guard socketpair(AF_UNIX,SOCK_STREAM,0,&fds)==0 else { throw ModelError("socketpair failed") }
            let client = fds[0], peer = fds[1]
            var timeout = timeval(tv_sec: 30,tv_usec: 0), one: Int32 = 1
            for fd in fds {
                setsockopt(fd,SOL_SOCKET,SO_RCVTIMEO,&timeout,socklen_t(MemoryLayout<timeval>.size))
                setsockopt(fd,SOL_SOCKET,SO_SNDTIMEO,&timeout,socklen_t(MemoryLayout<timeval>.size))
                setsockopt(fd,SOL_SOCKET,SO_NOSIGPIPE,&one,socklen_t(MemoryLayout<Int32>.size))
            }
            let finished = DispatchSemaphore(value: 0)
            Thread.detachNewThread { server.handle(peer); finished.signal() }
            defer { shutdown(client,SHUT_RDWR); close(client) }
            let method = object == nil ? "GET" : "POST"
            let head = "\(method) \(path) HTTP/1.1\r\nHost: localhost\r\nContent-Type: application/json\r\nContent-Length: \(payload.count)\r\nConnection: close\r\n\r\n"
            let request = Data(head.utf8)+payload
            var wire = Data()
            do {
                try request.withUnsafeBytes { buffer in
                    var sent = 0
                    while sent < buffer.count {
                        let n = Darwin.send(client,buffer.baseAddress!+sent,buffer.count-sent,0)
                        if n<0 && errno==EINTR { continue }
                        guard n>0 else { throw ModelError("request write failed") }
                        sent += n
                    }
                }
                var buffer = [UInt8](repeating: 0,count: 8192)
                while true {
                    let n = recv(client,&buffer,buffer.count,0)
                    if n<0 && errno==EINTR { continue }
                    guard n>=0 else { throw ModelError("response read failed or timed out") }
                    if n==0 { break }
                    wire.append(contentsOf: buffer.prefix(n))
                    guard wire.count <= 1<<20 else { throw ModelError("response exceeds diagnostic bound") }
                }
            } catch {
                shutdown(client,SHUT_RDWR)
                guard finished.wait(timeout: .now()+30) == .success else { throw ModelError("handler did not finish after disconnect") }
                throw error
            }
            guard finished.wait(timeout: .now()+30) == .success else { throw ModelError("handler did not finish") }
            guard let separator = wire.range(of: Data("\r\n\r\n".utf8)) else { throw ModelError("missing HTTP head") }
            let responseHead = String(decoding: wire[..<separator.lowerBound],as: UTF8.self)
            let raw = Data(wire[separator.upperBound...])
            if !responseHead.lowercased().contains("transfer-encoding: chunked") {
                return (responseHead,String(decoding: raw,as: UTF8.self))
            }
            var body = Data(), cursor = 0
            while cursor<raw.count {
                guard let end = raw[cursor...].range(of: Data("\r\n".utf8)),
                    let n = Int(String(decoding: raw[cursor..<end.lowerBound],as: UTF8.self),radix: 16)
                else { throw ModelError("malformed chunk length") }
                cursor = end.upperBound
                guard n>=0,n<=raw.count-cursor,raw.count-cursor-n>=2,
                    raw[cursor+n]==13,raw[cursor+n+1]==10 else { throw ModelError("incomplete HTTP chunk") }
                if n==0 {
                    guard cursor+2==raw.count else { throw ModelError("unexpected trailing HTTP bytes") }
                    return (responseHead,String(decoding: body,as: UTF8.self))
                }
                body.append(raw[cursor..<cursor+n]); cursor += n+2
            }
            throw ModelError("missing terminating HTTP chunk")
        }
        let text = "Print exactly: one two three four five six seven eight."
        let variants: [(String,String,Bool,[String:Any])] = [
            ("generate JSON","/api/generate",false,["model":engine.modelName,"prompt":text,"raw":true,"stream":false,"options":["num_predict":8,"temperature":0,"seed":7]]),
            ("generate NDJSON","/api/generate",true,["model":engine.modelName,"prompt":text,"raw":true,"stream":true,"options":["num_predict":8,"temperature":0,"seed":7]]),
            ("chat JSON","/api/chat",false,["model":engine.modelName,"messages":[["role":"user","content":text]],"think":false,"stream":false,"options":["num_predict":8,"temperature":0,"seed":7]]),
            ("chat NDJSON","/api/chat",true,["model":engine.modelName,"messages":[["role":"user","content":text]],"think":false,"stream":true,"options":["num_predict":8,"temperature":0,"seed":7]]),
            ("OpenAI JSON","/v1/chat/completions",false,["model":engine.modelName,"messages":[["role":"user","content":text]],"stream":false,"max_tokens":8,"temperature":0,"seed":7]),
            ("OpenAI SSE","/v1/chat/completions",true,["model":engine.modelName,"messages":[["role":"user","content":text]],"stream":true,"max_tokens":8,"temperature":0,"seed":7]),
            ("Gateway SSE","/v3/ai/language-model",true,["prompt":[["role":"user","content":[["type":"text","text":text]]]],"toolChoice":["type":"auto"],"maxOutputTokens":8,"temperature":0,"seed":7]),
        ]

        for queued in [false, true] {
            engine.model.optimizations.boundedOutputQueue = queued
            for mode in ["memory-before", "deadline-before", "memory-after", "deadline-after", "pressure-before", "pressure-after", "memory-decode"] {
                for (name, path, stream, body) in variants {
                    let label = "\(name)/\(mode)/queued=\(queued)"
                    engine.dropPrefixCache()
                    var tick: UInt64 = 0
                    var available = mode == "memory-before" ? 0.0 : 1_000.0
                    var fired = false
                    var firstLayerCalls = 0
                    var ticket: PressureTicket?
                    defer {
                        if let ticket { engine.pressureBoundary.acknowledge(ticket) }
                        engine.requestControllerOverride = nil; engine.model.routerObserver = nil
                    }
                    if mode == "pressure-before" { ticket = engine.pressureBoundary.request() }
                    let config = try ContextConfiguration(maxContextTokens: 65536,
                        maxPrefillWaitMinutes: mode.hasPrefix("deadline") ? 1 : 0)
                    engine.requestControllerOverride = {
                        let value = RequestController(configuration: config, slackBytes: 1_500_000_000,
                            clock: { tick }, availableGB: { available })
                        if mode == "deadline-before" { tick = 61_000_000_000 }
                        return value
                    }
                    engine.model.routerObserver = { layer, _ in
                        if layer == 0 { firstLayerCalls += 1 }
                        if layer == 0 && (mode.hasSuffix("after") || (mode == "memory-decode" && firstLayerCalls == 2)) {
                            fired = true
                            if mode.hasPrefix("memory") { available = 0 }
                            else if mode.hasPrefix("pressure") { ticket = engine.pressureBoundary.request() }
                            else { tick = 61_000_000_000 }
                        }
                    }
                    let response = try exchange(path, body)
                    engine.requestControllerOverride = nil; engine.model.routerObserver = nil
                    let after = !mode.hasSuffix("before")
                    let code = mode.hasPrefix("deadline") ? "prefill_deadline_exceeded" : "insufficient_memory"
                    c.expect("\(label): correct header status", response.head.hasPrefix(after && stream ? "HTTP/1.1 200" : "HTTP/1.1 503"), response.head)
                    c.expect("\(label): typed terminal", response.body.contains(code), response.body)
                    c.equal("\(label): model only runs after admission", fired, after)
                    c.expect("\(label): no success DONE", !response.body.contains("[DONE]"))
                    let lines = response.body.split(separator: "\n").map(String.init)
                    let objects = try lines.compactMap { line -> [String: Any]? in
                        var value = line.trimmingCharacters(in: .whitespacesAndNewlines)
                        if value.hasPrefix("data:") { value = String(value.dropFirst(5)).trimmingCharacters(in: .whitespaces) }
                        if !value.hasPrefix("{") { return nil }
                        return try JSONSerialization.jsonObject(with: Data(value.utf8)) as? [String: Any]
                    }
                    c.expect("\(label): no successful finish", !objects.contains { object in
                        if object["done"] as? Bool == true || object["type"] as? String == "finish" { return true }
                        return (object["choices"] as? [[String: Any]] ?? []).contains {
                            $0["finish_reason"] != nil && !($0["finish_reason"] is NSNull)
                        }
                    })
                    c.equal("\(label): pins released", engine.model.pool.pinnedSlotCount, 0)
                    c.equal("\(label): failed state absent", engine.prefixCache.heldTokens, 0)
                    c.equal("\(label): allocator limit restored", MLX.Memory.cacheLimit, 2 << 30)
                }
                let retry = try exchange("/api/generate", ["model": engine.modelName, "prompt": "Say only ok", "stream": false,
                    "options": ["num_predict": 4, "temperature": 0, "seed": 7]])
                c.expect("\(mode)/\(queued): healthy request after faults", retry.head.hasPrefix("HTTP/1.1 200") && !retry.body.contains("\"error\""), retry.body)
            }
        }
        // The first sampled token closes only the time policy. Advance the
        // fake clock inside the next real model forward, through HTTP, and
        // require successful completion rather than a terminal time error.
        for queued in [false, true] {
            engine.model.optimizations.boundedOutputQueue = queued
            engine.dropPrefixCache()
            var tick: UInt64 = 0, forwards = 0
            let config = try ContextConfiguration(maxContextTokens: 65536, maxPrefillWaitMinutes: 1)
            engine.requestControllerOverride = {
                RequestController(configuration: config, slackBytes: 0, clock: { tick }, availableGB: { 1000 })
            }
            engine.model.routerObserver = { layer, _ in
                if layer == 0 {
                    forwards += 1
                    if forwards > 1 { tick = 61_000_000_000 }
                }
            }
            let response = try exchange(variants[1].1, variants[1].3)
            engine.requestControllerOverride = nil; engine.model.routerObserver = nil
            c.expect("decode after deadline/\(queued): clock actually advanced", tick > 60_000_000_000)
            c.expect("decode after deadline/\(queued): healthy HTTP completion", response.head.hasPrefix("HTTP/1.1 200")
                && response.body.contains("\"done\":true") && !response.body.contains("\"error\""), response.body)
            c.equal("decode after deadline/\(queued): released pins", engine.model.pool.pinnedSlotCount, 0)
        }
        // Admission prices only the exact, consumed prefix handed over by the
        // cache. The same prompt must fail this short estimate policy cold.
        engine.dropPrefixCache()
        var single = SampleParams.greedy; single.maxTokens = 1
        let prefix = (0 ..< 515).map { 1000 + (($0 * 7919) % 200_000) }
        let seed = engine.generate(promptIds: prefix, params: single)
        c.expect("warm admission: seed succeeds", seed.stats.runtimeError == nil && seed.ids.count == 1)
        // The baseline consumes its last sampled token; the separately gated
        // skipped-final-forward path does not. Use actual retained IDs in
        // either family instead of assuming where generation stopped.
        let retained = engine.prefixCache.peek(extending: prefix) ?? prefix
        c.equal("warm admission: seed retained exact consumed history", engine.prefixCache.heldTokens, retained.count)
        let continuation = retained + [907]
        let tight = try ContextConfiguration(maxContextTokens: 65536, maxPrefillWaitMinutes: 0.02)
        func tightControl() -> RequestController {
            RequestController(configuration: tight, slackBytes: 0, clock: { 0 }, availableGB: { 1000 })
        }
        let warmControl = tightControl()
        let warm = engine.generate(promptIds: continuation, params: single, request: warmControl)
        c.expect("warm admission: only missing token is admitted", warm.stats.runtimeError == nil
            && warm.stats.reusedPrefixTokens == retained.count && warm.stats.prefillTokens == 1,
            "reused=\(warm.stats.reusedPrefixTokens), expected=\(retained.count), prefilled=\(warm.stats.prefillTokens), error=\(warm.stats.runtimeError ?? "none")")
        c.expect("warm admission: retained estimate is inside budget", warmControl.estimatedPrefillSeconds.map { $0 < 1.2 } ?? false)
        engine.dropPrefixCache()
        let cold = engine.generate(promptIds: continuation, params: single, request: tightControl())
        c.equal("cold admission: identical total prompt refused", cold.stats.requestFailure?.code, .prefillWaitExceeded)
        c.equal("cold admission: no prompt computation", cold.stats.prefillTokens, 0)
        c.equal("cold admission: truthful submitted token count", cold.stats.promptTokens, continuation.count)
        c.equal("cold admission: failed state absent", engine.prefixCache.heldTokens, 0)
        // A client's cap cannot change the server or a later client's request.
        var restricted = variants[4].3
        restricted["options"] = ["num_ctx": 1]
        let limited = try exchange(variants[4].1, restricted)
        c.expect("client cap: typed pre-header refusal", limited.head.hasPrefix("HTTP/1.1 400")
            && limited.body.contains("context_length_exceeded"), limited.body)
        c.equal("client cap: server remains unchanged", engine.maxContextTokens, 65536)
        let independent = try exchange(variants[4].1, variants[4].3)
        c.expect("client cap: later client succeeds", independent.head.hasPrefix("HTTP/1.1 200")
            && !independent.body.contains("\"error\""), independent.body)
        let templated = try engine.encodeWithVision(messages: [["role":"user", "content":text]], tools: nil, thinking: false).0
        let rawCount = engine.tokenizer.encode(text: text).count
        for (name, path, _, body) in [variants[0], variants[2], variants[4]] {
            let count = path == "/api/generate" ? rawCount : templated.count
            for room in [-1, 0, 1] {
                engine.dropPrefixCache()
                engine.maxContextTokens = count + room
                let response = try exchange(path, body)
                let rejects = room < 0 || (path.hasPrefix("/v1/") && room == 0)
                c.expect("\(name)/room=\(room): final tokenized cap governs status",
                    response.head.hasPrefix(rejects ? "HTTP/1.1 400" : "HTTP/1.1 200"), response.body)
                if !rejects {
                    let object = try JSONSerialization.jsonObject(with: Data(response.body.utf8)) as! [String:Any]
                    let decoded = object["eval_count"] as? Int
                        ?? ((object["usage"] as? [String:Any])?["completion_tokens"] as? Int)
                    c.equal("\(name)/room=\(room): output budget is clamped", decoded, room)
                }
            }
        }
        // Over-length admission must expose a stable code before any streaming
        // headers. A code embedded only in a human-readable sentence is not a
        // machine-readable failure, even when the HTTP status is correct.
        for (name, path, _, body) in variants {
            engine.dropPrefixCache()
            engine.maxContextTokens = 1
            let response = try exchange(path, body)
            c.expect("\(name): over-context refusal precedes streaming headers",
                response.head.hasPrefix("HTTP/1.1 400")
                && !response.head.lowercased().contains("transfer-encoding: chunked"), response.body)
            let object = try JSONSerialization.jsonObject(with: Data(response.body.utf8)) as! [String:Any]
            let code = object["code"] as? String ?? (object["error"] as? [String:Any])?["code"] as? String
            c.equal("\(name): over-context refusal has structured code", code, "context_length_exceeded")
            c.expect("\(name): refused context has no success payload",
                object["done"] as? Bool != true && object["choices"] == nil
                && object["response"] == nil && object["message"] == nil, response.body)
        }
        engine.maxContextTokens = 65536
        // A genuine occupied generation gate, with a clock advancing while
        // the second request waits. Metadata must remain independent of it.
        let held = DispatchSemaphore(value: 0), release = DispatchSemaphore(value: 0), ended = DispatchSemaphore(value: 0)
        Thread.detachNewThread {
            engine.withExclusive { held.signal(); release.wait() }
            ended.signal()
        }
        defer { release.signal() }
        guard held.wait(timeout: .now() + 5) == .success else { throw ModelError("queue holder did not start") }
        var queueChecks: UInt64 = 0
        let queueConfig = try ContextConfiguration(maxContextTokens: 65536, maxPrefillWaitMinutes: 1)
        engine.requestControllerOverride = {
            RequestController(configuration: queueConfig, slackBytes: 0, clock: {
                queueChecks += 1; return queueChecks * 10_000_000_000
            }, availableGB: { 1_000 })
        }
        let refused = try exchange("/v1/chat/completions", variants[5].3)
        c.expect("queued request expires before headers", refused.head.hasPrefix("HTTP/1.1 503") && refused.body.contains("prefill_deadline_exceeded"), refused.body)
        engine.requestControllerOverride = nil
        for path in ["/v1/models", "/coding-agent/v1/models"] {
            let metadata = try exchange(path, nil)
            c.expect("\(path): metadata stays responsive during occupied generation gate", metadata.head.hasPrefix("HTTP/1.1 200") && metadata.body.contains("context_policy"))
        }
        release.signal()
        guard ended.wait(timeout: .now() + 5) == .success else { throw ModelError("queue holder did not finish") }
        // Checked legacy mutation cannot enlarge an already allocated engine.
        engine.maxContextTokens = ContextPolicy.modelLimit
        c.equal("invalid legacy mutation preserves advertised cap", engine.maxContextTokens, 65536)
        let failed = engine.generate(promptIds: [1000], params: .greedy)
        c.equal("invalid legacy mutation fails without allocation", failed.stats.requestFailure?.code, .invalidConfiguration)
        engine.maxContextTokens = 65536
        let healthy = try exchange("/api/generate", ["model": engine.modelName, "prompt": "Say ok", "stream": false, "options": ["num_predict": 2]])
        c.expect("valid legacy assignment recovers", healthy.head.hasPrefix("HTTP/1.1 200"))
        return c.report()
    }
}
