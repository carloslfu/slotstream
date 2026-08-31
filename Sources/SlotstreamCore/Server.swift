// Minimal dependency-free HTTP/1.1 server exposing the Ollama API surface
// (/api/*) plus the OpenAI-compatible /v1/chat/completions. Localhost,
// single-flight generation, chunked streaming (NDJSON for /api, SSE for /v1).

import CoreFoundation
import Foundation

public struct ServerError: Error, CustomStringConvertible {
    public let description: String
    public init(_ s: String) { description = s }
}

public final class Server {
    let engine: Engine
    let port: UInt16
    /// Total on-disk size of the weights, reported by /api/tags and /api/ps.
    /// Supplied by the caller so it can come from the pinned manifest rather
    /// than a second hand-maintained copy of the number.
    let weightsBytes: Int
    var listenFD: Int32 = -1

    public init(engine: Engine, port: UInt16, weightsBytes: Int = 0, listenFD: Int32 = -1) {
        self.engine = engine
        self.port = port
        self.weightsBytes = weightsBytes
        self.listenFD = listenFD
    }

    /// Claim the port. Callers bind *before* loading the model so "address
    /// already in use" — running `serve` twice is the common case — costs a
    /// second and one sentence instead of a full load and a fatalError.
    public static func bindPort(_ port: UInt16) throws -> Int32 {
        let fd = socket(AF_INET, SOCK_STREAM, 0)
        guard fd >= 0 else {
            throw ServerError("cannot create a socket: \(String(cString: strerror(errno)))")
        }
        var yes: Int32 = 1
        setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &yes, socklen_t(MemoryLayout<Int32>.size))
        var addr = sockaddr_in()
        addr.sin_family = sa_family_t(AF_INET)
        addr.sin_port = port.bigEndian
        addr.sin_addr = in_addr(s_addr: inet_addr("127.0.0.1"))
        let rc = withUnsafePointer(to: &addr) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                bind(fd, $0, socklen_t(MemoryLayout<sockaddr_in>.size))
            }
        }
        guard rc == 0 else {
            let why = String(cString: strerror(errno))
            close(fd)
            throw ServerError(
                "cannot listen on 127.0.0.1:\(port): \(why)"
                    + (errno == EADDRINUSE
                        ? " — another slotstream (or Ollama) is already there; "
                            + "stop it or pass --port" : ""))
        }
        return fd
    }

    /// Bounded so a client that opens sockets and never speaks cannot exhaust
    /// the thread pool (each connection costs one thread).
    static let maxConcurrentConnections = 8
    private let connSlots = DispatchSemaphore(value: maxConcurrentConnections)

    public func run() throws -> Never {
        // A client that disappears mid-stream makes write() raise SIGPIPE, whose
        // default action kills the process. Ignoring it turns that into EPIPE,
        // which is what `send` already handles by returning false.
        signal(SIGPIPE, SIG_IGN)
        if listenFD < 0 { listenFD = try Self.bindPort(port) }
        listen(listenFD, 16)
        print("slotstream listening on http://127.0.0.1:\(port)")
        print("""
        try it:
          curl localhost:\(port)/api/chat -d '{"model": "\(engine.modelName)", "messages": [{"role": "user", "content": "hello"}]}'
        or point any Ollama or OpenAI client at http://localhost:\(port)
        """)
        fflush(stdout)  // visible immediately even when stdout is a file/pipe
        while true {
            let fd = accept(listenFD, nil, nil)
            if fd < 0 { continue }
            // A stalled client must not pin a thread forever: give reads a
            // deadline, and cap how many connections can be in flight.
            var tv = timeval(tv_sec: 30, tv_usec: 0)
            setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, &tv, socklen_t(MemoryLayout<timeval>.size))
            var st = timeval(tv_sec: 120, tv_usec: 0)
            setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, &st, socklen_t(MemoryLayout<timeval>.size))
            var one: Int32 = 1
            setsockopt(fd, SOL_SOCKET, SO_NOSIGPIPE, &one, socklen_t(MemoryLayout<Int32>.size))
            connSlots.wait()
            Thread.detachNewThread { [weak self] in
                defer { self?.connSlots.signal() }
                self?.handle(fd)
            }
        }
    }

    // MARK: connection handling

    struct Request {
        var method = ""
        var path = ""
        var body = Data()
        var headers: [String: String] = [:]
    }

    /// Largest request body accepted. Prompts are text; anything past this is
    /// a mistake or an attack, and reading it unbounded is how a local process
    /// gets OOM-killed.
    static let maxBodyBytes = 4 << 20

    private func readRequest(_ fd: Int32) -> Request? {
        var buf = Data()
        var tmp = [UInt8](repeating: 0, count: 65536)
        var headerEnd: Range<Data.Index>? = nil
        while headerEnd == nil {
            let n = read(fd, &tmp, tmp.count)
            if n <= 0 { return nil }
            buf.append(contentsOf: tmp[0 ..< n])
            headerEnd = buf.range(of: Data("\r\n\r\n".utf8))
            if headerEnd == nil, buf.count > 64 << 10 { return nil }
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
            if kv.count == 2 {
                let key = kv[0].trimmingCharacters(in: .whitespaces).lowercased()
                let value = kv[1].trimmingCharacters(in: .whitespaces)
                req.headers[key] = value
                if key == "content-length" { contentLength = Int(value) ?? -1 }
            }
        }
        if contentLength < 0 || contentLength > Self.maxBodyBytes { return nil }
        var body = Data(buf[headerEnd!.upperBound...].prefix(contentLength))
        while body.count < contentLength {
            let n = read(fd, &tmp, min(tmp.count, contentLength - body.count))
            if n <= 0 { break }
            body.append(contentsOf: tmp[0 ..< n])
            if body.count > Self.maxBodyBytes { return nil }
        }
        guard body.count == contentLength else { return nil }
        req.body = body
        return req
    }

    private func send(_ fd: Int32, _ data: Data) -> Bool {
        var sent = 0
        return data.withUnsafeBytes { raw -> Bool in
            while sent < data.count {
                let n = write(fd, raw.baseAddress! + sent, data.count - sent)
                if n < 0 && errno == EINTR { continue }
                if n <= 0 { return false }
                sent += n
            }
            return true
        }
    }

    /// Browser clients need CORS, but a wildcard turns any website the user
    /// visits into an unauthenticated caller of this expensive local service.
    /// Echo only loopback origins, including their arbitrary development port.
    private static func corsHeaders(origin: String?) -> String? {
        guard let origin, !origin.isEmpty else { return "" }
        guard let u = URL(string: origin), let host = u.host?.lowercased(),
            u.scheme == "http" || u.scheme == "https",
            host == "localhost" || host == "127.0.0.1" || host == "0.0.0.0" || host == "::1"
        else { return nil }
        return "Access-Control-Allow-Origin: \(origin)\r\nVary: Origin\r\n"
    }

    private func respondJSON(
        _ fd: Int32, _ obj: Any, status: String = "200 OK", cors: String = ""
    ) {
        let body = (try? JSONSerialization.data(withJSONObject: obj)) ?? Data("{}".utf8)
        var head = "HTTP/1.1 \(status)\r\nContent-Type: application/json\r\n" + cors
        head += "Content-Length: \(body.count)\r\nConnection: close\r\n\r\n"
        _ = send(fd, Data(head.utf8) + body)
    }

    private func startChunked(_ fd: Int32, contentType: String, cors: String) -> Bool {
        let head = "HTTP/1.1 200 OK\r\nContent-Type: \(contentType)\r\n" + cors
            + "Transfer-Encoding: chunked\r\nConnection: close\r\n\r\n"
        return send(fd, Data(head.utf8))
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

    /// A nonblocking peek distinguishes an idle connected peer (EAGAIN) from
    /// EOF. Generation checks it before every prefill chunk and decode token,
    /// including non-streaming requests that otherwise would not write until
    /// all work had already been done.
    private func peerAlive(_ fd: Int32) -> Bool {
        var byte: UInt8 = 0
        let n = recv(fd, &byte, 1, MSG_PEEK | MSG_DONTWAIT)
        if n == 0 { return false }
        if n > 0 { return true }
        return errno == EAGAIN || errno == EWOULDBLOCK || errno == EINTR
    }

    // MARK: routing

    private func handle(_ fd: Int32) {
        defer { close(fd) }
        guard let req = readRequest(fd) else { return }
        let origin = req.headers["origin"]
        guard let cors = Self.corsHeaders(origin: origin) else {
            respondJSON(
                fd, ["error": "browser origin is not allowed"],
                status: "403 Forbidden")
            return
        }
        if req.method == "OPTIONS" {  // CORS preflight
            let head = "HTTP/1.1 204 No Content\r\n" + cors
                + "Access-Control-Allow-Methods: GET, POST, DELETE, OPTIONS\r\n"
                + "Access-Control-Allow-Headers: Content-Type, Authorization\r\n"
                + "Access-Control-Allow-Private-Network: true\r\n"
                + "Access-Control-Max-Age: 86400\r\nConnection: close\r\n\r\n"
            _ = send(fd, Data(head.utf8))
            return
        }
        let parsed = (try? JSONSerialization.jsonObject(with: req.body)) as? [String: Any]
        if req.method == "POST", !req.body.isEmpty, parsed == nil {
            respondJSON(
                fd, ["error": "invalid JSON body"], status: "400 Bad Request", cors: cors)
            return
        }
        let json = parsed ?? [:]
        switch (req.method, req.path) {
        case ("GET", "/api/version"):
            respondJSON(fd, ["version": SlotstreamBuild.version], cors: cors)
        case ("GET", "/api/tags"), ("GET", "/api/tags/"):
            respondJSON(fd, ["models": [modelCard()]], cors: cors)
        case ("GET", "/api/ps"):
            respondJSON(fd, ["models": [modelCard(loaded: true)]], cors: cors)
        case ("POST", "/api/show"):
            if let e = modelError(json) {
                respondJSON(fd, ["error": e], status: "404 Not Found", cors: cors)
                return
            }
            if let e = Self.unsupportedKey(json, allowed: ["model", "verbose"]) {
                respondJSON(fd, ["error": e], status: "400 Bad Request", cors: cors)
                return
            }
            if json["verbose"] != nil, Self.bool(json["verbose"]) == nil {
                respondJSON(
                    fd, ["error": "verbose must be true or false"],
                    status: "400 Bad Request", cors: cors)
                return
            }
            respondJSON(
                fd,
                [
                    "modelfile": "# slotstream: SSD-streamed qwen4_exp",
                    "parameters": "",
                    "template": "{{ .Prompt }}",
                    "details": modelDetails(live: true),
                    "model_info": [
                        "general.architecture": "qwen4_exp",
                        "general.parameter_count": 176_000_000_000,
                    ],
                ], cors: cors)
        case ("POST", "/api/chat"):
            apiChat(fd, json, cors: cors)
        case ("POST", "/api/generate"):
            apiGenerate(fd, json, cors: cors)
        case ("POST", "/v1/chat/completions"):
            v1Chat(fd, json, cors: cors)
        case ("GET", "/v1/models"):
            respondJSON(
                fd,
                [
                    "object": "list",
                    "data": [["id": engine.modelName, "object": "model", "owned_by": "slotstream"]],
                ], cors: cors)
        case ("POST", "/api/embed"), ("POST", "/api/embeddings"):
            respondJSON(
                fd, ["error": "model does not support embeddings"],
                status: "400 Bad Request", cors: cors)
        case ("POST", "/api/pull"), ("POST", "/api/create"):
            respondJSON(
                fd, ["error": "use `slotstream pull` on the host"],
                status: "501 Not Implemented", cors: cors)
        case ("HEAD", _):
            // A HEAD response carries headers only; sending a body is a protocol error.
            let head = "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n" + cors
                + "Content-Length: 0\r\nConnection: close\r\n\r\n"
            _ = send(fd, Data(head.utf8))
        case ("GET", "/"):
            respondJSON(fd, ["status": "ok", "engine": "slotstream"], cors: cors)
        default:
            respondJSON(
                fd, ["error": "not found: \(req.method) \(req.path)"],
                status: "404 Not Found", cors: cors)
        }
    }

    /// `live: false` for /api/tags and /api/ps, which are *listings* — a
    /// client may cache or diff them, so per-request counters do not belong
    /// there. /api/show is the endpoint that reports runtime state.
    private func modelDetails(live: Bool = false) -> [String: Any] {
        let pool = engine.poolSnapshot()
        var d: [String: Any] = [
            "format": "safetensors", "family": "qwen4_exp",
            "parameter_size": "176B-A6B", "quantization_level": "4bit",
            "expert_cache_per_layer": Int(pool.slotsPerLayer.rounded()),
            "experts_per_layer": engine.model.cfg.numExperts,
        ]
        if let plan = engine.currentPlan { d["memory_plan"] = plan.json() }
        if live { d["prefix_cache"] = engine.prefixCache.json() }
        return d
    }

    private func modelCard(loaded: Bool = false) -> [String: Any] {
        let pool = engine.poolSnapshot()
        var c: [String: Any] = [
            "name": engine.modelName, "model": engine.modelName,
            "modified_at": iso(Date()), "size": weightsBytes,
            "digest": "slotstream-qwen38-flash-next-4bit",
            "details": modelDetails(),
        ]
        if loaded {
            c["expires_at"] = iso(Date().addingTimeInterval(3600))
            c["size_vram"] = pool.poolBytes
        }
        return c
    }

    private func iso(_ d: Date) -> String {
        ISO8601DateFormatter().string(from: d)
    }

    // MARK: params

    /// OpenAI clients may send `content` as a string or as an array of typed
    /// parts. Taking `as? String` alone silently drops the whole message, so
    /// the text parts are joined here instead.
    static func contentText(_ v: Any?) -> String {
        if let s = v as? String { return s }
        if let parts = v as? [[String: Any]] {
            return parts.compactMap { part -> String? in
                if let t = part["text"] as? String { return t }
                return nil
            }.joined()
        }
        return ""
    }

    private static func messages(_ json: [String: Any]) -> [ChatMessage] {
        (json["messages"] as? [[String: Any]] ?? []).map {
            ChatMessage(role: $0["role"] as? String ?? "user", content: contentText($0["content"]))
        }
    }

    /// JSON numbers arrive as NSNumber; accept ints where a float is expected.
    private static func num(_ v: Any?) -> Double? {
        guard let n = v as? NSNumber,
            CFGetTypeID(n) != CFBooleanGetTypeID()
        else { return nil }
        let d = n.doubleValue
        // Every current numeric API field is ultimately stored as Float.
        // Accepting 1e300 only to turn it into infinity made a syntactically
        // valid request silently select a different sampler mode.
        guard d.isFinite, Float(d).isFinite else { return nil }
        return d
    }

    /// Swift's NSNumber bridge reports JSON `1` as `is Bool`, and JSON `true`
    /// as `as? Int == 1`. CoreFoundation's type id is the only reliable way to
    /// keep JSON booleans, integers, and ordinary numbers distinct here.
    private static func int(_ v: Any?) -> Int? {
        guard let n = v as? NSNumber,
            CFGetTypeID(n) != CFBooleanGetTypeID()
        else { return nil }
        return v as? Int
    }

    private static func bool(_ v: Any?) -> Bool? {
        guard let n = v as? NSNumber,
            CFGetTypeID(n) == CFBooleanGetTypeID()
        else { return nil }
        return n.boolValue
    }

    private static func stopList(_ v: Any?) -> [String]? {
        if let a = v as? [String] { return a.filter { !$0.isEmpty } }
        if let s = v as? String, !s.isEmpty { return [s] }
        return nil
    }

    private func modelError(_ json: [String: Any]) -> String? {
        guard let raw = json["model"] else { return nil }
        guard let requested = raw as? String else { return "model must be text" }
        guard !requested.isEmpty else { return "model must not be empty" }
        let accepted = [engine.modelName, "qwen3.8-flash-next:4bit", "qwen38-flash-next-mlx-4bit"]
        return accepted.contains(requested)
            ? nil : "model '\(requested)' is not loaded; this server has only '\(engine.modelName)'"
    }

    private static func unsupportedKey(
        _ json: [String: Any], allowed: Set<String>
    ) -> String? {
        let extras = Set(json.keys).subtracting(allowed).sorted()
        return extras.isEmpty ? nil
            : "unsupported request field(s): \(extras.joined(separator: ", "))"
    }

    private static func messageError(_ json: [String: Any]) -> String? {
        guard let raw = json["messages"] as? [[String: Any]] else {
            return "messages must be an array"
        }
        for (i, m) in raw.enumerated() {
            let extra = Set(m.keys).subtracting(["role", "content"])
            if !extra.isEmpty {
                return "messages[\(i)] has unsupported field(s): "
                    + extra.sorted().joined(separator: ", ")
            }
            if m["tool_calls"] != nil || m["tool_call_id"] != nil || m["images"] != nil {
                return "messages[\(i)] uses tools or images, which this server does not support"
            }
            guard let role = m["role"] as? String,
                ["system", "user", "assistant"].contains(role)
            else { return "messages[\(i)].role must be system, user, or assistant" }
            if let parts = m["content"] as? [[String: Any]] {
                for (j, part) in parts.enumerated() {
                    let extra = Set(part.keys).subtracting(["type", "text"])
                    if !extra.isEmpty {
                        return "messages[\(i)].content[\(j)] has unsupported field(s): "
                            + extra.sorted().joined(separator: ", ")
                    }
                    let kind = (part["type"] as? String) ?? "text"
                    if kind != "text" && kind != "input_text" {
                        return "messages[\(i)] contains unsupported content type '\(kind)'"
                    }
                    if part["text"] as? String == nil {
                        return "messages[\(i)] has a text part without text"
                    }
                }
            } else if m["content"] as? String == nil {
                return "messages[\(i)].content must be text"
            }
        }
        return nil
    }

    private static func optionsError(_ json: [String: Any]) -> String? {
        guard let options = json["options"] else { return nil }
        guard let o = options as? [String: Any] else { return "options must be an object" }
        let allowed: Set<String> = [
            "temperature", "top_p", "top_k", "min_p", "presence_penalty",
            "num_predict", "seed", "stop",
        ]
        let extras = Set(o.keys).subtracting(allowed).sorted()
        if !extras.isEmpty {
            return "unsupported options field(s): \(extras.joined(separator: ", "))"
        }
        for key in ["temperature", "top_p", "min_p", "presence_penalty"]
        where o[key] != nil && num(o[key]) == nil {
            return "options.\(key) must be a number"
        }
        for key in ["top_k", "num_predict", "seed"]
        where o[key] != nil && int(o[key]) == nil {
            return "options.\(key) must be an integer"
        }
        if let stop = o["stop"], !(stop is String) && !(stop is [String]) {
            return "options.stop must be text or an array of text"
        }
        return nil
    }

    private func ollamaValidationError(
        _ json: [String: Any], allowed: Set<String>, messages: Bool = false
    ) -> String? {
        if let e = modelError(json) { return e }
        if let e = Self.unsupportedKey(json, allowed: allowed) { return e }
        if let e = Self.optionsError(json) { return e }
        if json["think"] != nil, Self.bool(json["think"]) == nil {
            return "think must be true or false; named reasoning levels are not supported"
        }
        if json["stream"] != nil, Self.bool(json["stream"]) == nil {
            return "stream must be true or false"
        }
        return messages ? Self.messageError(json) : nil
    }

    private func openAIValidationError(_ json: [String: Any]) -> String? {
        if let e = modelError(json) { return e }
        let allowed: Set<String> = [
            "model", "messages", "stream", "temperature", "top_p", "top_k",
            "presence_penalty", "max_tokens", "max_completion_tokens", "seed",
            "stop", "stream_options",
        ]
        if let e = Self.unsupportedKey(json, allowed: allowed) { return e }
        if let e = Self.messageError(json) { return e }
        for key in ["temperature", "top_p", "presence_penalty"]
        where json[key] != nil && Self.num(json[key]) == nil {
            return "\(key) must be a number"
        }
        for key in ["top_k", "max_tokens", "max_completion_tokens", "seed"]
        where json[key] != nil && Self.int(json[key]) == nil {
            return "\(key) must be an integer"
        }
        for key in ["max_tokens", "max_completion_tokens"] {
            if let value = Self.int(json[key]), value <= 0 {
                return "\(key) must be greater than zero"
            }
        }
        if let stop = json["stop"], !(stop is String) && !(stop is [String]) {
            return "stop must be text or an array of text"
        }
        if json["stream"] != nil, Self.bool(json["stream"]) == nil {
            return "stream must be true or false"
        }
        if json["stream_options"] != nil,
            json["stream_options"] as? [String: Any] == nil
        {
            return "stream_options must be an object"
        }
        if let o = json["stream_options"] as? [String: Any] {
            let extras = Set(o.keys).subtracting(["include_usage"])
            if !extras.isEmpty {
                return "unsupported stream_options field(s): \(extras.sorted().joined(separator: ", "))"
            }
            if o["include_usage"] != nil, Self.bool(o["include_usage"]) == nil {
                return "stream_options.include_usage must be true or false"
            }
        }
        return nil
    }

    private func sampleParams(_ json: [String: Any]) -> SampleParams {
        let thinking = Self.bool(json["think"]) ?? false
        var p: SampleParams = thinking ? .thinking : .instruct
        if let o = json["options"] as? [String: Any] {
            if let v = Self.num(o["temperature"]) { p.temperature = Float(v) }
            if let v = Self.num(o["top_p"]) { p.topP = Float(v) }
            if let v = Self.int(o["top_k"]) { p.topK = v }
            if let v = Self.num(o["min_p"]) { p.minP = Float(v) }
            if let v = Self.num(o["presence_penalty"]) { p.presencePenalty = Float(v) }
            if let v = Self.int(o["num_predict"]) { p.maxTokens = v }
            // Ollama uses -1 for "random seed"; UInt64(-1) would trap.
            if let v = Self.int(o["seed"]) { p.seed = v < 0 ? nil : UInt64(v) }
            if let s = Self.stopList(o["stop"]) { p.stop = s }
        }
        return p.sanitized()
    }

    // MARK: /api/chat

    private func apiChat(_ fd: Int32, _ json: [String: Any], cors: String) {
        if let e = ollamaValidationError(
            json, allowed: ["model", "messages", "stream", "think", "options"],
            messages: true)
        {
            respondJSON(fd, ["error": e], status: "400 Bad Request", cors: cors)
            return
        }
        let msgs = Self.messages(json)
        let stream = Self.bool(json["stream"]) ?? true
        let thinking = Self.bool(json["think"]) ?? false
        let params = sampleParams(json)
        guard !msgs.isEmpty else {
            respondJSON(
                fd, ["error": "messages must not be empty"],
                status: "400 Bad Request", cors: cors)
            return
        }
        guard let ids = try? engine.encodeChat(msgs, thinking: thinking) else {
            respondJSON(
                fd, ["error": "chat template failed"],
                status: "500 Internal Server Error", cors: cors)
            return
        }
        if let e = engine.contextError(promptTokens: ids.count) {
            respondJSON(fd, ["error": e], status: "400 Bad Request", cors: cors)
            return
        }
        let t0 = Date()
        if stream, !startChunked(fd, contentType: "application/x-ndjson", cors: cors) { return }
        var alive = true
        let callback: ((Int, String) -> Bool)? = stream ? { _, delta in
            guard alive, !delta.isEmpty else { return alive }
            let obj: [String: Any] = [
                "model": self.engine.modelName, "created_at": self.iso(Date()),
                "message": ["role": "assistant", "content": delta], "done": false,
            ]
            alive = self.chunk(
                fd, (try! JSONSerialization.data(withJSONObject: obj)) + Data("\n".utf8))
            return alive
        } : nil
        let (text, _, stats) = engine.generate(
            promptIds: ids, params: params,
            shouldContinue: { self.peerAlive(fd) }, onToken: callback)
        let final: [String: Any] = [
            "model": engine.modelName, "created_at": iso(Date()),
            "message": ["role": "assistant", "content": stream ? "" : text],
            "done": true, "done_reason": stats.finishReason,
            "total_duration": Int(-t0.timeIntervalSinceNow * 1e9),
            "prompt_eval_count": stats.promptTokens,
            "prompt_eval_duration": Int(stats.prefillSeconds * 1e9),
            "eval_count": stats.decodeTokens,
            "eval_duration": Int(stats.decodeSeconds * 1e9),
        ]
        if stream, alive {
            chunk(fd, (try! JSONSerialization.data(withJSONObject: final)) + Data("\n".utf8))
            endChunked(fd)
        } else {
            if alive { respondJSON(fd, final, cors: cors) }
        }
    }

    // MARK: /api/generate

    private func apiGenerate(_ fd: Int32, _ json: [String: Any], cors: String) {
        if let e = ollamaValidationError(
            json,
            allowed: ["model", "prompt", "system", "raw", "stream", "think", "options"])
        {
            respondJSON(fd, ["error": e], status: "400 Bad Request", cors: cors)
            return
        }
        if json["prompt"] != nil, json["prompt"] as? String == nil {
            respondJSON(
                fd, ["error": "prompt must be text"],
                status: "400 Bad Request", cors: cors)
            return
        }
        if json["system"] != nil, json["system"] as? String == nil {
            respondJSON(
                fd, ["error": "system must be text"],
                status: "400 Bad Request", cors: cors)
            return
        }
        if json["raw"] != nil, Self.bool(json["raw"]) == nil {
            respondJSON(
                fd, ["error": "raw must be true or false"],
                status: "400 Bad Request", cors: cors)
            return
        }
        let prompt = json["prompt"] as? String ?? ""
        let raw = Self.bool(json["raw"]) ?? false
        let stream = Self.bool(json["stream"]) ?? true
        let thinking = Self.bool(json["think"]) ?? false
        guard !prompt.isEmpty else {
            respondJSON(
                fd, ["error": "prompt must not be empty"],
                status: "400 Bad Request", cors: cors)
            return
        }
        if raw, thinking || json["system"] != nil {
            respondJSON(
                fd, ["error": "raw generation cannot apply system or think; remove raw or those fields"],
                status: "400 Bad Request", cors: cors)
            return
        }
        let params = sampleParams(json)
        let ids: [Int]
        if raw {
            ids = engine.tokenizer.encode(text: prompt)
        } else {
            var messages: [ChatMessage] = []
            if let system = json["system"] as? String, !system.isEmpty {
                messages.append(ChatMessage(role: "system", content: system))
            }
            messages.append(ChatMessage(role: "user", content: prompt))
            ids = (try? engine.encodeChat(messages, thinking: thinking)) ?? []
        }
        // An empty prompt would leave the first logits uninitialized and make
        // the sampler invent a token out of nothing.
        guard !ids.isEmpty else {
            respondJSON(
                fd, ["error": "prompt must not be empty"],
                status: "400 Bad Request", cors: cors)
            return
        }
        if let e = engine.contextError(promptTokens: ids.count) {
            respondJSON(fd, ["error": e], status: "400 Bad Request", cors: cors)
            return
        }
        let t0 = Date()
        if stream, !startChunked(fd, contentType: "application/x-ndjson", cors: cors) { return }
        var alive = true
        let callback: ((Int, String) -> Bool)? = stream ? { _, delta in
            guard alive, !delta.isEmpty else { return alive }
            let obj: [String: Any] = [
                "model": self.engine.modelName, "created_at": self.iso(Date()),
                "response": delta, "done": false,
            ]
            alive = self.chunk(
                fd, (try! JSONSerialization.data(withJSONObject: obj)) + Data("\n".utf8))
            return alive
        } : nil
        let (text, _, stats) = engine.generate(
            promptIds: ids, params: params,
            shouldContinue: { self.peerAlive(fd) }, onToken: callback)
        let final: [String: Any] = [
            "model": engine.modelName, "created_at": iso(Date()),
            "response": stream ? "" : text, "done": true, "done_reason": stats.finishReason,
            "total_duration": Int(-t0.timeIntervalSinceNow * 1e9),
            "prompt_eval_count": stats.promptTokens,
            "prompt_eval_duration": Int(stats.prefillSeconds * 1e9),
            "eval_count": stats.decodeTokens,
            "eval_duration": Int(stats.decodeSeconds * 1e9),
        ]
        if stream, alive {
            chunk(fd, (try! JSONSerialization.data(withJSONObject: final)) + Data("\n".utf8))
            endChunked(fd)
        } else {
            if alive { respondJSON(fd, final, cors: cors) }
        }
    }

    // MARK: /v1/chat/completions (OpenAI, SSE streaming)

    private func v1Chat(_ fd: Int32, _ json: [String: Any], cors: String) {
        if let e = openAIValidationError(json) {
            respondJSON(
                fd, ["error": ["message": e, "type": "invalid_request_error"]],
                status: "400 Bad Request", cors: cors)
            return
        }
        let msgs = Self.messages(json)
        let stream = Self.bool(json["stream"]) ?? false
        var params = SampleParams.instruct
        if let v = Self.num(json["temperature"]) { params.temperature = Float(v) }
        if let v = Self.num(json["top_p"]) { params.topP = Float(v) }
        if let v = Self.int(json["top_k"]) { params.topK = v }
        if let v = Self.num(json["presence_penalty"]) { params.presencePenalty = Float(v) }
        if let v = Self.int(json["max_tokens"]) { params.maxTokens = v }
        if let v = Self.int(json["max_completion_tokens"]) { params.maxTokens = v }
        if let v = Self.int(json["seed"]) {
            params.seed = UInt64(bitPattern: Int64(v))
        }
        if let v = Self.stopList(json["stop"]) { params.stop = v }
        params = params.sanitized()
        let wantUsage = Self.bool(
            (json["stream_options"] as? [String: Any])?["include_usage"]) ?? false
        guard !msgs.isEmpty else {
            respondJSON(
                fd, ["error": ["message": "messages must not be empty"]],
                status: "400 Bad Request", cors: cors)
            return
        }
        guard let ids = try? engine.encodeChat(msgs, thinking: false) else {
            respondJSON(
                fd, ["error": ["message": "template failed"]],
                status: "500 Internal Server Error", cors: cors)
            return
        }
        if let e = engine.contextError(promptTokens: ids.count) {
            respondJSON(
                fd, ["error": ["message": e]], status: "400 Bad Request", cors: cors)
            return
        }
        let rid = "chatcmpl-\(UUID().uuidString.prefix(8))"
        if stream, !startChunked(fd, contentType: "text/event-stream", cors: cors) { return }
        var alive = true
        let callback: ((Int, String) -> Bool)? = stream ? { _, delta in
            guard alive, !delta.isEmpty else { return alive }
            let obj: [String: Any] = [
                "id": rid, "object": "chat.completion.chunk",
                "created": Int(Date().timeIntervalSince1970), "model": self.engine.modelName,
                "choices": [["index": 0, "delta": ["content": delta], "finish_reason": NSNull()]],
            ]
            let data = try! JSONSerialization.data(withJSONObject: obj)
            alive = self.chunk(fd, Data("data: ".utf8) + data + Data("\n\n".utf8))
            return alive
        } : nil
        let (text, _, stats) = engine.generate(
            promptIds: ids, params: params,
            shouldContinue: { self.peerAlive(fd) }, onToken: callback)
        if stream, alive {
            var fin: [String: Any] = [
                "id": rid, "object": "chat.completion.chunk",
                "created": Int(Date().timeIntervalSince1970), "model": engine.modelName,
                "choices": [["index": 0, "delta": [:], "finish_reason": stats.finishReason]],
            ]
            if wantUsage {
                fin["usage"] = [
                    "prompt_tokens": stats.promptTokens,
                    "completion_tokens": stats.decodeTokens,
                    "total_tokens": stats.promptTokens + stats.decodeTokens,
                ]
            }
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
                            "index": 0, "finish_reason": stats.finishReason,
                            "message": ["role": "assistant", "content": text],
                        ]
                    ],
                    "usage": [
                        "prompt_tokens": stats.promptTokens,
                        "completion_tokens": stats.decodeTokens,
                        "total_tokens": stats.promptTokens + stats.decodeTokens,
                    ],
                ], cors: cors)
        }
    }
}
