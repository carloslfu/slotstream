// Minimal dependency-free HTTP/1.1 server exposing the Ollama API surface
// (/api/*) plus the OpenAI-compatible /v1/chat/completions. Localhost,
// single-flight generation, chunked streaming (NDJSON for /api, SSE for /v1).

import Foundation

public final class Server {
    let engine: Engine
    let port: UInt16
    var listenFD: Int32 = -1

    public init(engine: Engine, port: UInt16) {
        self.engine = engine
        self.port = port
    }

    public func run() throws -> Never {
        listenFD = socket(AF_INET, SOCK_STREAM, 0)
        var yes: Int32 = 1
        setsockopt(listenFD, SOL_SOCKET, SO_REUSEADDR, &yes, socklen_t(MemoryLayout<Int32>.size))
        var addr = sockaddr_in()
        addr.sin_family = sa_family_t(AF_INET)
        addr.sin_port = port.bigEndian
        addr.sin_addr = in_addr(s_addr: inet_addr("127.0.0.1"))
        let bindResult = withUnsafePointer(to: &addr) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                bind(listenFD, $0, socklen_t(MemoryLayout<sockaddr_in>.size))
            }
        }
        guard bindResult == 0 else { fatalError("bind :\(port) failed (in use?)") }
        listen(listenFD, 16)
        print("slotstream listening on http://127.0.0.1:\(port)")
        while true {
            let fd = accept(listenFD, nil, nil)
            if fd < 0 { continue }
            Thread.detachNewThread { [weak self] in self?.handle(fd) }
        }
    }

    // MARK: connection handling

    struct Request {
        var method = ""
        var path = ""
        var body = Data()
    }

    private func readRequest(_ fd: Int32) -> Request? {
        var buf = Data()
        var tmp = [UInt8](repeating: 0, count: 65536)
        var headerEnd: Range<Data.Index>? = nil
        while headerEnd == nil {
            let n = read(fd, &tmp, tmp.count)
            if n <= 0 { return nil }
            buf.append(contentsOf: tmp[0 ..< n])
            headerEnd = buf.range(of: Data("\r\n\r\n".utf8))
            if buf.count > 32 << 20 { return nil }
        }
        let headData = buf[..<headerEnd!.lowerBound]
        let head = String(data: headData, encoding: .utf8) ?? ""
        var req = Request()
        let lines = head.split(separator: "\r\n", omittingEmptySubsequences: false)
        let parts = lines.first?.split(separator: " ") ?? []
        if parts.count >= 2 {
            req.method = String(parts[0])
            req.path = String(parts[1])
        }
        var contentLength = 0
        for l in lines.dropFirst() {
            let kv = l.split(separator: ":", maxSplits: 1)
            if kv.count == 2, kv[0].lowercased() == "content-length" {
                contentLength = Int(kv[1].trimmingCharacters(in: .whitespaces)) ?? 0
            }
        }
        var body = Data(buf[headerEnd!.upperBound...])
        while body.count < contentLength {
            let n = read(fd, &tmp, min(tmp.count, contentLength - body.count))
            if n <= 0 { break }
            body.append(contentsOf: tmp[0 ..< n])
        }
        req.body = body
        return req
    }

    private func send(_ fd: Int32, _ data: Data) -> Bool {
        var sent = 0
        return data.withUnsafeBytes { raw -> Bool in
            while sent < data.count {
                let n = write(fd, raw.baseAddress! + sent, data.count - sent)
                if n <= 0 { return false }
                sent += n
            }
            return true
        }
    }

    private func respondJSON(_ fd: Int32, _ obj: Any, status: String = "200 OK") {
        let body = (try? JSONSerialization.data(withJSONObject: obj)) ?? Data("{}".utf8)
        var head = "HTTP/1.1 \(status)\r\nContent-Type: application/json\r\n"
        head += "Content-Length: \(body.count)\r\nConnection: close\r\n\r\n"
        _ = send(fd, Data(head.utf8) + body)
    }

    private func startChunked(_ fd: Int32, contentType: String) {
        let head = "HTTP/1.1 200 OK\r\nContent-Type: \(contentType)\r\n"
            + "Transfer-Encoding: chunked\r\nConnection: close\r\n\r\n"
        _ = send(fd, Data(head.utf8))
    }

    @discardableResult
    private func chunk(_ fd: Int32, _ payload: Data) -> Bool {
        var d = Data(String(format: "%x\r\n", payload.count).utf8)
        d += payload
        d += Data("\r\n".utf8)
        return send(fd, d)
    }

    private func endChunked(_ fd: Int32) {
        _ = send(fd, Data("0\r\n\r\n".utf8))
    }

    // MARK: routing

    private func handle(_ fd: Int32) {
        defer { close(fd) }
        guard let req = readRequest(fd) else { return }
        let json = (try? JSONSerialization.jsonObject(with: req.body)) as? [String: Any] ?? [:]
        switch (req.method, req.path) {
        case ("GET", "/api/version"):
            respondJSON(fd, ["version": "0.1.0-slotstream"])
        case ("GET", "/api/tags"), ("GET", "/api/tags/"):
            respondJSON(fd, ["models": [modelCard()]])
        case ("GET", "/api/ps"):
            respondJSON(fd, ["models": [modelCard(loaded: true)]])
        case ("POST", "/api/show"):
            respondJSON(
                fd,
                [
                    "modelfile": "# slotstream: SSD-streamed qwen4_exp",
                    "parameters": "",
                    "template": "{{ .Prompt }}",
                    "details": modelDetails(),
                    "model_info": [
                        "general.architecture": "qwen4_exp",
                        "general.parameter_count": 176_000_000_000,
                    ],
                ])
        case ("POST", "/api/chat"):
            apiChat(fd, json)
        case ("POST", "/api/generate"):
            apiGenerate(fd, json)
        case ("POST", "/v1/chat/completions"):
            v1Chat(fd, json)
        case ("GET", "/v1/models"):
            respondJSON(
                fd,
                [
                    "object": "list",
                    "data": [["id": engine.modelName, "object": "model", "owned_by": "slotstream"]],
                ])
        case ("POST", "/api/embed"), ("POST", "/api/embeddings"):
            respondJSON(fd, ["error": "model does not support embeddings"], status: "400 Bad Request")
        case ("POST", "/api/pull"), ("POST", "/api/create"):
            respondJSON(
                fd, ["error": "use `slotstream pull` on the host"], status: "501 Not Implemented")
        case ("HEAD", _), ("GET", "/"):
            respondJSON(fd, ["status": "ok", "engine": "slotstream"])
        default:
            respondJSON(fd, ["error": "not found: \(req.method) \(req.path)"], status: "404 Not Found")
        }
    }

    private func modelDetails() -> [String: Any] {
        var d: [String: Any] = [
            "format": "safetensors", "family": "qwen4_exp",
            "parameter_size": "176B-A6B", "quantization_level": "4bit",
            "expert_cache_per_layer": Int(engine.model.pool.slotsPerLayer.rounded()),
            "experts_per_layer": engine.model.cfg.numExperts,
        ]
        if let plan = engine.currentPlan { d["memory_plan"] = plan.json() }
        return d
    }

    private func modelCard(loaded: Bool = false) -> [String: Any] {
        var c: [String: Any] = [
            "name": engine.modelName, "model": engine.modelName,
            "modified_at": iso(Date()), "size": 103_770_199_081,
            "digest": "slotstream-qwen38-flash-next-4bit",
            "details": modelDetails(),
        ]
        if loaded {
            c["expires_at"] = iso(Date().addingTimeInterval(3600))
            c["size_vram"] = engine.model.pool.poolBytes
        }
        return c
    }

    private func iso(_ d: Date) -> String {
        ISO8601DateFormatter().string(from: d)
    }

    // MARK: params

    private func sampleParams(_ json: [String: Any]) -> SampleParams {
        let thinking = (json["think"] as? Bool) ?? false
        var p: SampleParams = thinking ? .thinking : .instruct
        if let o = json["options"] as? [String: Any] {
            if let v = o["temperature"] as? Double { p.temperature = Float(v) }
            if let v = o["top_p"] as? Double { p.topP = Float(v) }
            if let v = o["top_k"] as? Int { p.topK = v }
            if let v = o["min_p"] as? Double { p.minP = Float(v) }
            if let v = o["presence_penalty"] as? Double { p.presencePenalty = Float(v) }
            if let v = o["num_predict"] as? Int { p.maxTokens = v }
            if let v = o["seed"] as? Int { p.seed = UInt64(v) }
        }
        return p
    }

    // MARK: /api/chat

    private func apiChat(_ fd: Int32, _ json: [String: Any]) {
        let msgs = (json["messages"] as? [[String: Any]] ?? []).map {
            ChatMessage(role: $0["role"] as? String ?? "user", content: $0["content"] as? String ?? "")
        }
        let stream = (json["stream"] as? Bool) ?? true
        let thinking = (json["think"] as? Bool) ?? false
        let params = sampleParams(json)
        guard let ids = try? engine.encodeChat(msgs, thinking: thinking) else {
            respondJSON(fd, ["error": "chat template failed"], status: "500 Internal Server Error")
            return
        }
        let t0 = Date()
        if stream { startChunked(fd, contentType: "application/x-ndjson") }
        var alive = true
        let (text, _, stats) = engine.generate(promptIds: ids, params: params) { _, delta in
            guard stream, alive, !delta.isEmpty else { return alive }
            let obj: [String: Any] = [
                "model": self.engine.modelName, "created_at": self.iso(Date()),
                "message": ["role": "assistant", "content": delta], "done": false,
            ]
            alive = self.chunk(fd, (try! JSONSerialization.data(withJSONObject: obj)) + Data("\n".utf8))
            return alive
        }
        let final: [String: Any] = [
            "model": engine.modelName, "created_at": iso(Date()),
            "message": ["role": "assistant", "content": stream ? "" : text],
            "done": true, "done_reason": "stop",
            "total_duration": Int(-t0.timeIntervalSinceNow * 1e9),
            "prompt_eval_count": stats.prefillTokens,
            "prompt_eval_duration": Int(stats.prefillSeconds * 1e9),
            "eval_count": stats.decodeTokens,
            "eval_duration": Int(stats.decodeSeconds * 1e9),
        ]
        if stream {
            chunk(fd, (try! JSONSerialization.data(withJSONObject: final)) + Data("\n".utf8))
            endChunked(fd)
        } else {
            respondJSON(fd, final)
        }
    }

    // MARK: /api/generate

    private func apiGenerate(_ fd: Int32, _ json: [String: Any]) {
        let prompt = json["prompt"] as? String ?? ""
        let raw = (json["raw"] as? Bool) ?? false
        let stream = (json["stream"] as? Bool) ?? true
        let params = sampleParams(json)
        let ids: [Int]
        if raw {
            ids = engine.tokenizer.encode(text: prompt)
        } else {
            ids = (try? engine.encodeChat([ChatMessage(role: "user", content: prompt)], thinking: false)) ?? []
        }
        let t0 = Date()
        if stream { startChunked(fd, contentType: "application/x-ndjson") }
        var alive = true
        let (text, _, stats) = engine.generate(promptIds: ids, params: params) { _, delta in
            guard stream, alive, !delta.isEmpty else { return alive }
            let obj: [String: Any] = [
                "model": self.engine.modelName, "created_at": self.iso(Date()),
                "response": delta, "done": false,
            ]
            alive = self.chunk(fd, (try! JSONSerialization.data(withJSONObject: obj)) + Data("\n".utf8))
            return alive
        }
        let final: [String: Any] = [
            "model": engine.modelName, "created_at": iso(Date()),
            "response": stream ? "" : text, "done": true, "done_reason": "stop",
            "total_duration": Int(-t0.timeIntervalSinceNow * 1e9),
            "prompt_eval_count": stats.prefillTokens,
            "eval_count": stats.decodeTokens,
            "eval_duration": Int(stats.decodeSeconds * 1e9),
        ]
        if stream {
            chunk(fd, (try! JSONSerialization.data(withJSONObject: final)) + Data("\n".utf8))
            endChunked(fd)
        } else {
            respondJSON(fd, final)
        }
    }

    // MARK: /v1/chat/completions (OpenAI, SSE streaming)

    private func v1Chat(_ fd: Int32, _ json: [String: Any]) {
        let msgs = (json["messages"] as? [[String: Any]] ?? []).map {
            ChatMessage(role: $0["role"] as? String ?? "user", content: $0["content"] as? String ?? "")
        }
        let stream = (json["stream"] as? Bool) ?? false
        var params = SampleParams.instruct
        if let v = json["temperature"] as? Double { params.temperature = Float(v) }
        if let v = json["top_p"] as? Double { params.topP = Float(v) }
        if let v = json["max_tokens"] as? Int { params.maxTokens = v }
        if let v = json["max_completion_tokens"] as? Int { params.maxTokens = v }
        guard let ids = try? engine.encodeChat(msgs, thinking: false) else {
            respondJSON(fd, ["error": ["message": "template failed"]], status: "500 Internal Server Error")
            return
        }
        let rid = "chatcmpl-\(UUID().uuidString.prefix(8))"
        if stream { startChunked(fd, contentType: "text/event-stream") }
        var alive = true
        let (text, _, stats) = engine.generate(promptIds: ids, params: params) { _, delta in
            guard stream, alive, !delta.isEmpty else { return alive }
            let obj: [String: Any] = [
                "id": rid, "object": "chat.completion.chunk",
                "created": Int(Date().timeIntervalSince1970), "model": self.engine.modelName,
                "choices": [["index": 0, "delta": ["content": delta], "finish_reason": NSNull()]],
            ]
            let data = try! JSONSerialization.data(withJSONObject: obj)
            alive = self.chunk(fd, Data("data: ".utf8) + data + Data("\n\n".utf8))
            return alive
        }
        if stream {
            let fin: [String: Any] = [
                "id": rid, "object": "chat.completion.chunk",
                "created": Int(Date().timeIntervalSince1970), "model": engine.modelName,
                "choices": [["index": 0, "delta": [:], "finish_reason": "stop"]],
            ]
            chunk(fd, Data("data: ".utf8) + (try! JSONSerialization.data(withJSONObject: fin)) + Data("\n\n".utf8))
            chunk(fd, Data("data: [DONE]\n\n".utf8))
            endChunked(fd)
        } else {
            respondJSON(
                fd,
                [
                    "id": rid, "object": "chat.completion",
                    "created": Int(Date().timeIntervalSince1970), "model": engine.modelName,
                    "choices": [
                        [
                            "index": 0, "finish_reason": "stop",
                            "message": ["role": "assistant", "content": text],
                        ]
                    ],
                    "usage": [
                        "prompt_tokens": stats.prefillTokens,
                        "completion_tokens": stats.decodeTokens,
                        "total_tokens": stats.prefillTokens + stats.decodeTokens,
                    ],
                ])
        }
    }
}
