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
    /// the thread pool (each connection costs one thread). The accept loop
    /// never waits on this: a full pool answers 503 at once, because blocking
    /// the loop stops the server answering *anything* — a health check
    /// included — which a client cannot tell apart from a crash.
    static let maxConcurrentConnections = 32
    private let connSlots = DispatchSemaphore(value: maxConcurrentConnections)
    /// Unix time this process started serving; /v1/models reports it.
    private let startedAt = Int(Date().timeIntervalSince1970)

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
            // Never block the accept loop; see maxConcurrentConnections.
            guard connSlots.wait(timeout: .now()) == .success else {
                let body = Data(#"{"error":"server busy: too many open connections"}"#.utf8)
                let head = "HTTP/1.1 503 Service Unavailable\r\n"
                    + "Content-Type: application/json\r\nRetry-After: 1\r\n"
                    + "Content-Length: \(body.count)\r\nConnection: close\r\n\r\n"
                _ = self.send(fd, Data(head.utf8) + body)
                close(fd)
                continue
            }
            Thread.detachNewThread { [weak self] in
                defer { self?.connSlots.signal() }
                self?.handle(fd)
            }
        }
    }

    // MARK: connection handling

    package struct Request {
        package init() {}
        package var method = ""
        package var path = ""
        package var body = Data()
        package var headers: [String: String] = [:]
    }

    /// Largest request body accepted. Prompts are text; anything past this is
    /// a mistake or an attack, and reading it unbounded is how a local process
    /// gets OOM-killed.
    package static let maxBodyBytes = 4 << 20

    /// Why a request could not be read. `.closed` means the peer went away or
    /// timed out, so there is nobody left to tell; everything else gets a real
    /// status line, because dropping the connection reads as a crash.
    enum ReadOutcome {
        case ok(Request)
        case closed
        case fail(status: String, message: String)
    }

    private func readRequest(_ fd: Int32) -> ReadOutcome {
        var buf = Data()
        var tmp = [UInt8](repeating: 0, count: 65536)
        var headerEnd: Range<Data.Index>? = nil
        while headerEnd == nil {
            let n = read(fd, &tmp, tmp.count)
            if n <= 0 { return .closed }
            buf.append(contentsOf: tmp[0 ..< n])
            headerEnd = buf.range(of: Data("\r\n\r\n".utf8))
            if headerEnd == nil, buf.count > 64 << 10 {
                return .fail(
                    status: "431 Request Header Fields Too Large",
                    message: "request headers are larger than 64 KiB")
            }
        }
        let headData = buf[..<headerEnd!.lowerBound]
        let head = String(data: headData, encoding: .utf8) ?? ""
        let req: Request
        let contentLength: Int
        switch Self.parseHead(head) {
        case let .fail(status, message): return .fail(status: status, message: message)
        case let .ok(parsed, length):
            req = parsed
            contentLength = length
        }
        var body = Data(buf[headerEnd!.upperBound...].prefix(contentLength))
        while body.count < contentLength {
            let n = read(fd, &tmp, min(tmp.count, contentLength - body.count))
            if n <= 0 { break }
            body.append(contentsOf: tmp[0 ..< n])
        }
        guard body.count == contentLength else { return .closed }
        var complete = req
        complete.body = body
        return .ok(complete)
    }

    /// What the head said, or why the request cannot be served. Split out of
    /// the socket read so every framing rule below is reachable from a test
    /// with a string instead of a live server and a real client.
    package enum HeadOutcome {
        case ok(Request, contentLength: Int)
        case fail(status: String, message: String)
    }

    package static func parseHead(_ head: String) -> HeadOutcome {
        var req = Request()
        let lines = head.split(separator: "\r\n", omittingEmptySubsequences: false)
        let parts = lines.first?.split(separator: " ") ?? []
        if parts.count >= 2 {
            req.method = String(parts[0])
            req.path = String(parts[1])
        }
        var contentLength = 0
        var sawContentLength = false
        for l in lines.dropFirst() {
            let kv = l.split(separator: ":", maxSplits: 1)
            if kv.count == 2 {
                let key = kv[0].trimmingCharacters(in: .whitespaces).lowercased()
                let value = kv[1].trimmingCharacters(in: .whitespaces)
                req.headers[key] = value
                if key == "content-length" {
                    sawContentLength = true
                    contentLength = Int(value) ?? -1
                }
            }
        }
        // A chunked body carries no Content-Length, so it used to be read as
        // zero bytes and failed further in as "messages must be an array".
        if let te = req.headers["transfer-encoding"], te.lowercased().contains("chunked") {
            return .fail(
                status: "411 Length Required",
                message: "chunked request bodies are not supported; send Content-Length")
        }
        if sawContentLength, contentLength < 0 {
            return .fail(status: "400 Bad Request", message: "Content-Length is not a number")
        }
        if contentLength > maxBodyBytes {
            return .fail(
                status: "413 Content Too Large",
                message: "request body is larger than \(maxBodyBytes >> 20) MiB")
        }
        return .ok(req, contentLength: contentLength)
    }

    /// The path a request routes on: no query string, and no scheme or
    /// authority from the absolute-form target proxies send. Both are legal
    /// HTTP and both used to 404.
    package static func routePath(_ raw: String) -> String {
        var p = raw
        if let q = p.firstIndex(of: "?") { p = String(p[..<q]) }
        for scheme in ["http://", "https://"] where p.lowercased().hasPrefix(scheme) {
            let afterScheme = p.index(p.startIndex, offsetBy: scheme.count)
            if let slash = p[afterScheme...].firstIndex(of: "/") {
                p = String(p[slash...])
            } else {
                p = "/"
            }
        }
        return p.count > 1 && p.hasSuffix("/") ? String(p.dropLast()) : p
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
    package static func corsHeaders(origin: String?) -> String? {
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
        let req: Request
        switch readRequest(fd) {
        case .ok(let r): req = r
        case .closed: return
        case .fail(let status, let message):
            respondJSON(fd, ["error": message], status: status)
            return
        }
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
        let path = Self.routePath(req.path)
        switch (req.method, path) {
        case ("GET", "/api/version"):
            respondJSON(fd, ["version": SlotstreamBuild.version], cors: cors)
        case ("GET", "/api/tags"), ("GET", "/api/tags/"):
            respondJSON(fd, ["models": [modelCard()]], cors: cors)
        case ("GET", "/api/ps"):
            respondJSON(fd, ["models": [modelCard(loaded: true)]], cors: cors)
        case ("POST", "/api/show"):
            // The Ollama CLI's ShowRequest serializes every field, so a plain
            // `ollama run` opens with empty name/system/template/options.
            // Accept the deprecated `name` alias and empty overrides; a
            // non-empty override asks for modelfile semantics this server
            // does not have and stays a 400 (showOverrideError).
            var show = json
            // `ollama run` puts the name in `model` and sends an empty `name`;
            // `ollama show` does the exact reverse, so an empty `model` has to
            // fall back to the alias too, not merely a missing one.
            let modelBlank = show["model"] == nil || show["model"] is NSNull
                || (show["model"] as? String)?.isEmpty == true
            if modelBlank, let alias = show["name"] as? String, !alias.isEmpty {
                show["model"] = alias
            }
            if let e = modelError(show) {
                respondJSON(fd, ["error": e], status: "404 Not Found", cors: cors)
                return
            }
            if let e = Self.unsupportedKey(
                show, allowed: ["model", "name", "verbose", "system", "template", "options"])
            {
                respondJSON(fd, ["error": e], status: "400 Bad Request", cors: cors)
                return
            }
            if let e = Self.showOverrideError(show) {
                respondJSON(fd, ["error": e], status: "400 Bad Request", cors: cors)
                return
            }
            if show["verbose"] != nil, Self.bool(show["verbose"]) == nil {
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
                    "capabilities": ["completion"],
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
        case ("POST", "/v3/ai/language-model"), ("POST", "/v1/ai/language-model"):
            gatewayChat(fd, json, headers: req.headers, cors: cors)
        case ("GET", "/coding-agent/v1/models"):
            respondJSON(
                fd,
                GatewayDialect.catalog(
                    modelID: gatewayModelID, contextCap: engine.maxContextTokens), cors: cors)
        case ("GET", "/coding-agent/v1/credits"):
            // fx shows a balance for the gateway provider. A local model has no
            // billing; zero is the honest answer and keeps `fx credits` working.
            respondJSON(fd, ["balance": "0", "total_used": "0"], cors: cors)
        case ("GET", "/v1/models"):
            respondJSON(
                fd,
                [
                    "object": "list",
                    "data": [[
                        "id": engine.modelName, "object": "model",
                        "created": startedAt, "owned_by": "slotstream",
                    ]],
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
            // A HEAD response carries headers only; sending a body is a
            // protocol error. It still has to answer for the resource asked
            // for — a blanket 200 told every client that every path existed.
            let known: Set<String> = [
                "/", "/api/version", "/api/tags", "/api/ps", "/v1/models",
                "/coding-agent/v1/models", "/coding-agent/v1/credits",
            ]
            let status = known.contains(path) ? "200 OK" : "404 Not Found"
            let head = "HTTP/1.1 \(status)\r\nContent-Type: application/json\r\n" + cors
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
        var c: [String: Any] = [
            "name": engine.modelName, "model": engine.modelName,
            "modified_at": iso(Date()), "size": weightsBytes,
            "digest": "slotstream-qwen38-flash-next-4bit",
            "details": modelDetails(),
        ]
        if loaded {
            // Ollama reads these as "what this model costs right now" and
            // renders (size - size_vram) as a CPU share. Reporting 104 GB of
            // weights against a small pool made `ollama ps` claim ~98% CPU for
            // a model that runs on the GPU; resident memory is the honest
            // answer for a runtime that streams the rest from disk.
            let resident = Int(ProcessMemory.residentBytes())
            c["size"] = resident
            c["size_vram"] = resident
            c["expires_at"] = iso(Date().addingTimeInterval(3600))
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
        // Ollama clients routinely drop the tag or ask for ":latest". Both name
        // the only model here, and a name is not a semantic knob.
        let accepted = [
            engine.modelName, "qwen3.8-flash-next:4bit", "qwen38-flash-next-mlx-4bit",
            "qwen3.8-flash-next", "qwen3.8-flash-next:latest",
        ]
        return accepted.contains(requested)
            ? nil : "model '\(requested)' is not loaded; this server has only '\(engine.modelName)'"
    }

    /// JSON `null` means "not set" to every client SDK worth supporting: the
    /// OpenAI client serializes an unset `max_tokens` as null and the Ollama
    /// CLI sends a null `options`. Reading it as a present-but-wrong value
    /// turned a stock default request into a 400.
    static func withoutNulls(_ json: [String: Any]) -> [String: Any] {
        json.filter { !($0.value is NSNull) }
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

    /// Ollama's ShowRequest carries `system`, `template`, and `options` as
    /// modelfile overrides. Empty ones are what every client sends by default
    /// and mean nothing; a non-empty one would have to be silently ignored
    /// here, so it is refused instead.
    private static func showOverrideError(_ json: [String: Any]) -> String? {
        for key in ["system", "template"] {
            guard let v = json[key], !(v is NSNull) else { continue }
            guard let s = v as? String else { return "\(key) must be text" }
            if !s.isEmpty { return "\(key) overrides are not supported on this server" }
        }
        if let v = json["options"], !(v is NSNull) {
            guard let o = v as? [String: Any] else { return "options must be an object" }
            if !o.isEmpty { return "options overrides are not supported on /api/show" }
        }
        return nil
    }

    private static func optionsError(_ json: [String: Any]) -> String? {
        // The Ollama CLI sends `"options": null` when none are set.
        guard let options = json["options"], !(options is NSNull) else { return nil }
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

    /// Fields whose only supported value is the behaviour this server already
    /// has. A client sending the default is asking for exactly what it gets, so
    /// refusing it breaks stock SDKs for no semantic reason; any other value is
    /// a real feature and stays a 400. Nothing is silently dropped either way.
    private static func openAINoOpError(_ json: [String: Any]) -> String? {
        if json["n"] != nil, int(json["n"]) != 1 {
            return "n must be 1; this server returns a single choice"
        }
        if json["frequency_penalty"] != nil, num(json["frequency_penalty"]) != 0 {
            return "frequency_penalty is not supported (0 only); use presence_penalty"
        }
        if json["logprobs"] != nil, bool(json["logprobs"]) != false {
            return "logprobs are not supported"
        }
        if json["top_logprobs"] != nil { return "top_logprobs are not supported" }
        if let v = json["logit_bias"] {
            guard let map = v as? [String: Any], map.isEmpty else {
                return "logit_bias is not supported"
            }
        }
        if let v = json["response_format"] {
            guard let o = v as? [String: Any], (o["type"] as? String) == "text" else {
                return "only response_format {\"type\": \"text\"} is supported"
            }
        }
        if let v = json["tools"] {
            guard let list = v as? [Any], list.isEmpty else {
                return "tool calling is not supported"
            }
        }
        if json["tool_choice"] != nil, (json["tool_choice"] as? String) != "none" {
            return "tool calling is not supported"
        }
        if json["parallel_tool_calls"] != nil, bool(json["parallel_tool_calls"]) != false {
            return "tool calling is not supported"
        }
        if json["user"] != nil, json["user"] as? String == nil {
            return "user must be text"
        }
        return nil
    }

    private func openAIValidationError(_ json: [String: Any]) -> String? {
        if let e = modelError(json) { return e }
        let allowed: Set<String> = [
            "model", "messages", "stream", "temperature", "top_p", "top_k",
            "presence_penalty", "max_tokens", "max_completion_tokens", "seed",
            "stop", "stream_options",
            // Accepted only at the value this server already implements; see
            // openAINoOpError. Stock SDKs send these on every call.
            "n", "frequency_penalty", "logprobs", "top_logprobs", "logit_bias",
            "response_format", "tools", "tool_choice", "parallel_tool_calls", "user",
        ]
        if let e = Self.unsupportedKey(json, allowed: allowed) { return e }
        if let e = Self.openAINoOpError(json) { return e }
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
        // No seed means a different reply every time, which is what the API
        // documents and what clients expect. The sampler's own default is a
        // fixed constant, so without this an unseeded request replayed the
        // same text after every restart.
        if p.seed == nil { p.seed = Self.randomSeed() }
        return p.sanitized()
    }

    /// A fresh seed for a request that did not name one.
    static func randomSeed() -> UInt64 { UInt64.random(in: 1 ... UInt64.max) }

    // MARK: /api/chat

    private func apiChat(_ fd: Int32, _ rawJSON: [String: Any], cors: String) {
        let json = Self.withoutNulls(rawJSON)
        if let e = ollamaValidationError(
            json, allowed: ["model", "messages", "stream", "think", "options", "keep_alive"],
            messages: true)
        {
            respondJSON(fd, ["error": e], status: "400 Bad Request", cors: cors)
            return
        }
        let msgs = Self.messages(json)
        let stream = Self.bool(json["stream"]) ?? true
        let thinking = Self.bool(json["think"]) ?? false
        let params = sampleParams(json)
        // Ollama's documented "load" request (see apiGenerate): no messages
        // means load the model and return. Acknowledged without touching the
        // engine.
        guard !msgs.isEmpty else {
            respondJSON(
                fd,
                [
                    "model": engine.modelName, "created_at": iso(Date()),
                    "message": ["role": "assistant", "content": ""],
                    "done": true, "done_reason": "load",
                ], cors: cors)
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
        // With think on, the model reasons first and closes with `</think>`.
        // Ollama carries that in message.thinking; leaving it in the answer
        // handed clients the reasoning and a stray closing tag.
        let splitter = thinking ? ThinkSplitter() : nil
        var alive = true
        let callback: ((Int, String) -> Bool)? = stream ? { _, delta in
            guard alive, !delta.isEmpty else { return alive }
            var message: [String: Any] = ["role": "assistant"]
            if let sp = splitter {
                let (think, content) = sp.push(delta)
                if think.isEmpty, content.isEmpty { return alive }
                if !think.isEmpty { message["thinking"] = think }
                message["content"] = content
            } else {
                message["content"] = delta
            }
            let obj: [String: Any] = [
                "model": self.engine.modelName, "created_at": self.iso(Date()),
                "message": message, "done": false,
            ]
            alive = self.chunk(
                fd, (try! JSONSerialization.data(withJSONObject: obj)) + Data("\n".utf8))
            return alive
        } : nil
        let (text, _, stats) = engine.generate(
            promptIds: ids, params: params,
            shouldContinue: { self.peerAlive(fd) }, onToken: callback)
        var finalMessage: [String: Any] = ["role": "assistant"]
        if let sp = splitter {
            let (think, content) = stream ? sp.flush() : ThinkSplitter.split(text)
            if !think.isEmpty { finalMessage["thinking"] = think }
            finalMessage["content"] = content
        } else {
            finalMessage["content"] = stream ? "" : text
        }
        let final: [String: Any] = [
            "model": engine.modelName, "created_at": iso(Date()),
            "message": finalMessage,
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

    private func apiGenerate(_ fd: Int32, _ rawJSON: [String: Any], cors: String) {
        let json = Self.withoutNulls(rawJSON)
        if let e = ollamaValidationError(
            json,
            allowed: [
                "model", "prompt", "system", "raw", "stream", "think", "options", "keep_alive",
                "suffix", "template",
            ])
        {
            respondJSON(fd, ["error": e], status: "400 Bad Request", cors: cors)
            return
        }
        // The Ollama CLI's one-shot `ollama run model "prompt"` uses this
        // endpoint and serializes empty suffix/template. A non-empty suffix
        // asks for fill-in-the-middle and a non-empty template for a modelfile
        // override; neither exists here, so those stay a 400.
        for key in ["suffix", "template"] {
            guard let v = json[key], !(v is NSNull) else { continue }
            guard let s = v as? String else {
                respondJSON(fd, ["error": "\(key) must be text"], status: "400 Bad Request", cors: cors)
                return
            }
            if !s.isEmpty {
                let why = key == "suffix"
                    ? "fill-in-the-middle (suffix) is not supported"
                    : "template overrides are not supported on this server"
                respondJSON(fd, ["error": why], status: "400 Bad Request", cors: cors)
                return
            }
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
        // Ollama's documented "load" request: an empty prompt asks the server
        // to load the model and return at once, and the CLI sends one when an
        // interactive session opens. The model is always loaded here, so this
        // is an acknowledgment; nothing reaches the engine (an empty prompt
        // would leave the first logits uninitialized).
        guard !prompt.isEmpty else {
            respondJSON(
                fd,
                [
                    "model": engine.modelName, "created_at": iso(Date()),
                    "response": "", "done": true, "done_reason": "load",
                ], cors: cors)
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
        let splitter = thinking ? ThinkSplitter() : nil
        var alive = true
        let callback: ((Int, String) -> Bool)? = stream ? { _, delta in
            guard alive, !delta.isEmpty else { return alive }
            var obj: [String: Any] = [
                "model": self.engine.modelName, "created_at": self.iso(Date()),
                "done": false,
            ]
            if let sp = splitter {
                let (think, content) = sp.push(delta)
                if think.isEmpty, content.isEmpty { return alive }
                if !think.isEmpty { obj["thinking"] = think }
                obj["response"] = content
            } else {
                obj["response"] = delta
            }
            alive = self.chunk(
                fd, (try! JSONSerialization.data(withJSONObject: obj)) + Data("\n".utf8))
            return alive
        } : nil
        let (text, _, stats) = engine.generate(
            promptIds: ids, params: params,
            shouldContinue: { self.peerAlive(fd) }, onToken: callback)
        var finalResponse = stream ? "" : text
        var finalThinking = ""
        if let sp = splitter {
            let (think, content) = stream ? sp.flush() : ThinkSplitter.split(text)
            finalThinking = think
            finalResponse = content
        }
        var final: [String: Any] = [
            "model": engine.modelName, "created_at": iso(Date()),
            "response": finalResponse, "done": true, "done_reason": stats.finishReason,
            "total_duration": Int(-t0.timeIntervalSinceNow * 1e9),
            "prompt_eval_count": stats.promptTokens,
            "prompt_eval_duration": Int(stats.prefillSeconds * 1e9),
            "eval_count": stats.decodeTokens,
            "eval_duration": Int(stats.decodeSeconds * 1e9),
        ]
        if !finalThinking.isEmpty { final["thinking"] = finalThinking }
        if stream, alive {
            chunk(fd, (try! JSONSerialization.data(withJSONObject: final)) + Data("\n".utf8))
            endChunked(fd)
        } else {
            if alive { respondJSON(fd, final, cors: cors) }
        }
    }

    // MARK: /v3/ai/language-model (Vercel AI Gateway protocol 0.0.1, spec v4)

    /// The model id echoed back to fx. Any `ai-language-model-id` is accepted
    /// and resolves to the one served model, so fx's three fixed helper ids
    /// (reviewer, compactor, vision fallback) work without configuration.
    var gatewayModelID: String { "slotstream/" + engine.modelName }

    private func gatewayChat(
        _ fd: Int32, _ rawJSON: [String: Any], headers: [String: String], cors: String
    ) {
        func fail(_ f: GatewayDialect.Failure) {
            respondJSON(fd, f.body, status: "400 Bad Request", cors: cors)
        }
        if let e = GatewayDialect.validateHeaders(headers) { return fail(e) }
        let json = Self.withoutNulls(rawJSON)
        let request: GatewayDialect.Request
        switch GatewayDialect.parse(json, modelID: gatewayModelID) {
        case .success(let r): request = r
        case .failure(let e): return fail(e)
        }

        // toolChoice `none` renders no <tools> block; the history still
        // renders, so a compaction call over a tool conversation still reads.
        var messages = request.messages
        let renderTools = request.toolChoice == .disabled ? [] : request.tools
        if case .tool(let name) = request.toolChoice {
            messages = Self.instructing(messages, "You must call the \(name) tool now.")
        } else if request.toolChoice == .required {
            messages = Self.instructing(messages, "You must call one of the available tools now.")
        }

        let ids: [Int]
        do {
            ids = try engine.encodeChatSpliced(
                messages, tools: renderTools, thinking: request.reasoning.thinking,
                effort: request.reasoning.effort)
        } catch {
            return fail(GatewayDialect.Failure("template_error", "\(error)"))
        }
        guard !ids.isEmpty else {
            return fail(GatewayDialect.Failure("empty_prompt", "prompt must not be empty"))
        }
        if let e = engine.contextError(promptTokens: ids.count) {
            return fail(GatewayDialect.Failure("context_length_exceeded", e))
        }

        // Sampling. fx sends no limit on the agent step, so the default must be
        // the catalogue's advertised budget bounded by the room left in the
        // context — never the 512-token Ollama default, which truncates every
        // real edit.
        var params = SampleParams.agent
        let room = max(1, engine.maxContextTokens - ids.count)
        params.maxTokens = min(
            request.maxOutputTokens ?? GatewayDialect.outputBudget(
                contextCap: engine.maxContextTokens), room)
        if let v = request.temperature { params.temperature = v }
        if let v = request.topP { params.topP = v }
        if let v = request.topK { params.topK = v }
        if let v = request.presencePenalty { params.presencePenalty = v }
        if let v = request.seed { params.seed = UInt64(bitPattern: Int64(v)) }
        params.stop = request.stopSequences
        if request.seed == nil { params.seed = UInt64.random(in: 0...UInt64.max) }

        // The head goes out before generation begins. fx allows 30 s for the
        // head and no time at all for the stream, and a cold 6k-token prefill
        // is minutes; every failure that can be detected has been by now.
        guard startChunked(fd, contentType: "text/event-stream", cors: cors) else { return }
        var alive = true
        func emit(_ text: String) {
            guard alive else { return }
            alive = chunk(fd, Data(text.utf8))
        }
        emit(GatewayDialect.frame(["type": "stream-start", "warnings": []]))
        emit(
            GatewayDialect.frame([
                "type": "response-metadata",
                "id": "gen_" + String(format: "%08x", UInt32.random(in: 0...UInt32.max)),
                "modelId": gatewayModelID, "timestamp": iso(Date()),
            ]))

        let thinkSplitter = request.reasoning.thinking ? ThinkSplitter() : nil
        let toolSplitter = ToolCallSplitter(tools: renderTools.map { $0.schema })
        var textOpen = false
        var reasoningOpen = false
        var sawCall = false
        var reasoningTokens = 0
        var lastKeepalive = Date()
        var produced = false

        func flushEvents(_ events: [ToolStreamEvent]) {
            for e in events {
                switch e {
                case .text(let t):
                    guard !t.isEmpty else { continue }
                    if !textOpen {
                        emit(GatewayDialect.frame(["type": "text-start", "id": "t0"]))
                        textOpen = true
                    }
                    emit(
                        GatewayDialect.frame(["type": "text-delta", "id": "t0", "delta": t]))
                case .toolInputStart(let id, let name):
                    // A text block must close before a call opens: the parts
                    // are ordered in the specification even though fx ignores
                    // the text markers, and a reader that honours them would
                    // otherwise see a text block still open across the call.
                    if textOpen {
                        emit(GatewayDialect.frame(["type": "text-end", "id": "t0"]))
                        textOpen = false
                    }
                    emit(
                        GatewayDialect.frame([
                            "type": "tool-input-start", "id": id, "toolName": name,
                        ]))
                case .toolInputDelta(let id, let d):
                    emit(
                        GatewayDialect.frame(["type": "tool-input-delta", "id": id, "delta": d]))
                case .toolInputEnd(let id):
                    emit(GatewayDialect.frame(["type": "tool-input-end", "id": id]))
                case .toolCall(let call):
                    sawCall = true
                    emit(
                        GatewayDialect.frame([
                            "type": "tool-call", "toolCallId": call.id, "toolName": call.name,
                            "input": call.inputJSON,
                        ]))
                case .malformed(let t):
                    // Never lost: an unterminated block is the model's output
                    // and the user should see what it actually produced.
                    if !textOpen {
                        emit(GatewayDialect.frame(["type": "text-start", "id": "t0"]))
                        textOpen = true
                    }
                    emit(GatewayDialect.frame(["type": "text-delta", "id": "t0", "delta": t]))
                }
            }
        }

        let callback: (Int, String) -> Bool = { _, delta in
            guard alive, !delta.isEmpty else { return alive }
            produced = true
            var body = delta
            if let ts = thinkSplitter {
                let (think, content) = ts.push(delta)
                if !think.isEmpty {
                    reasoningTokens += 1
                    if !reasoningOpen {
                        emit(GatewayDialect.frame(["type": "reasoning-start", "id": "r0"]))
                        reasoningOpen = true
                    }
                    emit(
                        GatewayDialect.frame([
                            "type": "reasoning-delta", "id": "r0", "delta": think,
                        ]))
                }
                if reasoningOpen, !content.isEmpty {
                    emit(GatewayDialect.frame(["type": "reasoning-end", "id": "r0"]))
                    reasoningOpen = false
                }
                body = content
            }
            if !body.isEmpty { flushEvents(toolSplitter.push(body)) }
            return alive
        }

        let (_, _, stats) = engine.generate(
            promptIds: ids, params: params,
            shouldContinue: {
                // The one hook that runs during prefill. A multi-minute cold
                // prompt would otherwise send no bytes at all and trip this
                // server's own 120 s send timeout; fx skips comment lines by
                // design, so the keepalive costs the client nothing.
                if !produced, Date().timeIntervalSince(lastKeepalive) >= 10 {
                    lastKeepalive = Date()
                    self.chunk(fd, Data(GatewayDialect.keepalive.utf8))
                }
                return self.peerAlive(fd)
            }, onToken: callback)

        if let ts = thinkSplitter {
            let (think, content) = ts.flush()
            if !think.isEmpty, reasoningOpen {
                emit(
                    GatewayDialect.frame([
                        "type": "reasoning-delta", "id": "r0", "delta": think,
                    ]))
            }
            if reasoningOpen {
                emit(GatewayDialect.frame(["type": "reasoning-end", "id": "r0"]))
                reasoningOpen = false
            }
            if !content.isEmpty { flushEvents(toolSplitter.push(content)) }
        }
        flushEvents(toolSplitter.flush())
        if textOpen { emit(GatewayDialect.frame(["type": "text-end", "id": "t0"])) }

        // `required` was asked for and nothing was called. This cannot be a 400:
        // the head went out before generation. It is an in-stream error and a
        // finish reason that is not `tool-calls`.
        if !sawCall, request.toolChoice == .required || request.toolChoice.isNamedTool {
            emit(
                GatewayDialect.frame([
                    "type": "error",
                    "error": [
                        "message":
                            "tool_choice_unsatisfied: the model produced no tool call for toolChoice \(request.toolChoice.label)"
                    ],
                ]))
        }
        let (unified, raw) = GatewayDialect.unifiedFinish(stats.finishReason, hasToolCall: sawCall)
        emit(
            GatewayDialect.finishFrame(
                reason: unified, rawReason: raw, inputTokens: stats.promptTokens,
                cachedTokens: stats.reusedPrefixTokens,
                outputText: max(0, stats.decodeTokens - reasoningTokens),
                outputReasoning: reasoningTokens))
        emit("data: [DONE]\n\n")
        if alive { endChunked(fd) }
    }

    /// Append a one-line instruction to the system turn, adding one if the
    /// conversation has none. Used only for `toolChoice` `required` and `tool`,
    /// which fx sends on the reviewer and web-search calls.
    static func instructing(_ messages: [ChatMessage], _ line: String) -> [ChatMessage] {
        var out = messages
        if let i = out.firstIndex(where: { $0.role == "system" }) {
            out[i].content += "\n\n" + line
        } else {
            out.insert(ChatMessage(role: "system", content: line), at: 0)
        }
        return out
    }

    // MARK: /v1/chat/completions (OpenAI, SSE streaming)

    private func v1Chat(_ fd: Int32, _ rawJSON: [String: Any], cors: String) {
        let json = Self.withoutNulls(rawJSON)
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
        if params.seed == nil { params.seed = Self.randomSeed() }
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
        var sentRole = false
        let callback: ((Int, String) -> Bool)? = stream ? { _, delta in
            guard alive, !delta.isEmpty else { return alive }
            // OpenAI's first delta carries the role; clients look for it.
            var d: [String: Any] = ["content": delta]
            if !sentRole {
                d["role"] = "assistant"
                sentRole = true
            }
            let obj: [String: Any] = [
                "id": rid, "object": "chat.completion.chunk",
                "created": Int(Date().timeIntervalSince1970), "model": self.engine.modelName,
                "choices": [["index": 0, "delta": d, "finish_reason": NSNull()]],
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


/// Qwen emits its reasoning first and closes it with `</think>`. Ollama's
/// protocol carries that in `message.thinking` (`thinking` on /api/generate),
/// never in the answer. One instance follows one response.
final class ThinkSplitter {
    private static let tag = "</think>"
    private var buf = ""
    private var closed = false

    /// Splits one delta into (thinking, content). Until the tag arrives the
    /// last few characters are withheld, so a tag straddling two deltas is
    /// never emitted as reasoning text.
    func push(_ s: String) -> (String, String) {
        if closed { return ("", s) }
        buf += s
        if let r = buf.range(of: Self.tag) {
            let think = String(buf[..<r.lowerBound])
            var rest = String(buf[r.upperBound...])
            while rest.hasPrefix("\n") { rest.removeFirst() }
            buf = ""
            closed = true
            return (think, rest)
        }
        let keep = min(buf.count, Self.tag.count - 1)
        let emit = String(buf.dropLast(keep))
        buf = String(buf.suffix(keep))
        return (emit, "")
    }

    /// Whatever is still withheld when generation ends. A response that never
    /// closed its reasoning is all thinking and no answer, and says so.
    func flush() -> (String, String) {
        let rest = buf
        buf = ""
        return closed ? ("", rest) : (rest, "")
    }

    /// The same split over a whole non-streamed response.
    static func split(_ text: String) -> (String, String) {
        guard let r = text.range(of: tag) else { return (text, "") }
        var content = String(text[r.upperBound...])
        while content.hasPrefix("\n") { content.removeFirst() }
        return (String(text[..<r.lowerBound]), content)
    }
}
