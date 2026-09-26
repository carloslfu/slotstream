// The serving layer's framing and routing rules, without loading a model.
//
// Every rule here was a real bug: a malformed request that dropped the
// connection instead of answering, a legal request form that 404'd, or a
// wildcard that would have let any website drive an expensive local model.
// They were only reachable through a live server with 105 GB of weights
// loaded, which is why they ran nowhere but this Mac.

import Foundation
import Slotstream

extension Diagnostics {
    public static func httpFraming() -> CheckReport {
        var c = CheckBuilder("http-framing")

        func head(_ lines: [String]) -> String { lines.joined(separator: "\r\n") }
        func ok(_ outcome: Server.HeadOutcome) -> (Server.Request, Int)? {
            if case let .ok(r, n) = outcome { return (r, n) }
            return nil
        }
        func failure(_ outcome: Server.HeadOutcome) -> (String, String)? {
            if case let .fail(s, m) = outcome { return (s, m) }
            return nil
        }

        // The ordinary case still parses.
        let plain = Server.parseHead(head([
            "POST /api/chat HTTP/1.1", "Host: 127.0.0.1:11434", "Content-Length: 17",
            "Content-Type: application/json",
        ]))
        if let (req, length) = ok(plain) {
            c.equal("a normal request parses its method", req.method, "POST")
            c.equal("...and its path", req.path, "/api/chat")
            c.equal("...and its content length", length, 17)
            c.equal("...and lowercases header names", req.headers["content-type"], "application/json")
        } else {
            c.expect("a normal request parses", false, "\(plain)")
        }

        // A chunked body carries no Content-Length, so it used to be read as
        // zero bytes and failed much further in as "messages must be an array".
        let chunked = failure(Server.parseHead(head([
            "POST /api/chat HTTP/1.1", "Transfer-Encoding: chunked",
        ])))
        c.equal("a chunked body is 411, not an empty read", chunked?.0, "411 Length Required")
        c.expect(
            "...and the message says what to send instead",
            chunked?.1.contains("Content-Length") == true, chunked?.1 ?? "no failure")

        // A body larger than the cap is refused before it is read, not after a
        // local process has been OOM-killed reading it.
        let big = failure(Server.parseHead(head([
            "POST /api/chat HTTP/1.1", "Content-Length: \(Server.maxBodyBytes + 1)",
        ])))
        c.equal("an oversized body is 413", big?.0, "413 Content Too Large")
        c.expect(
            "a body exactly at the cap is accepted",
            ok(Server.parseHead(head([
                "POST /api/chat HTTP/1.1", "Content-Length: \(Server.maxBodyBytes)",
            ]))) != nil)

        // A malformed length is a status line, not a dropped connection.
        let bad = failure(Server.parseHead(head([
            "POST /api/chat HTTP/1.1", "Content-Length: banana",
        ])))
        c.equal("a malformed Content-Length is 400", bad?.0, "400 Bad Request")
        let negative = failure(Server.parseHead(head([
            "POST /api/chat HTTP/1.1", "Content-Length: -1",
        ])))
        c.equal("a negative Content-Length is 400", negative?.0, "400 Bad Request")

        // No Content-Length at all is a zero-length body, which is what GET is.
        if let (_, length) = ok(Server.parseHead(head(["GET /api/tags HTTP/1.1"]))) {
            c.equal("no Content-Length means no body", length, 0)
        } else {
            c.expect("no Content-Length means no body", false)
        }
        // An oversized body is read and discarded before the 413, so a client
        // that is still uploading gets the answer instead of a reset. That
        // discarding is bounded at both ends: one that declared a huge body
        // and then went quiet must not hold its 413 until the connection's
        // read deadline, which is what it did when this was written.
        var served = 0
        var left = Server.drainBody(1 << 20, chunk: 4096,
                                    read: { served += $0; return $0 }, expired: { false })
        c.equal("a client that keeps sending is drained to the end", left, 0)
        c.equal("...reading every declared byte", served, 1 << 20)
        left = Server.drainBody(1 << 20, chunk: 4096, read: { _ in 0 }, expired: { false })
        c.equal("a client that stops sending ends the drain", left, 1 << 20)
        var reads = 0
        left = Server.drainBody(1 << 20, chunk: 4096,
                                read: { reads += 1; return $0 }, expired: { reads >= 3 })
        c.equal("a trickling client ends the drain at its deadline", left, (1 << 20) - 3 * 4096)
        c.expect("a chunk is waited for less than a whole request is",
                 Server.drainChunkSeconds < Server.readTimeoutSeconds)
        c.expect("and the whole drain no longer than one request's deadline",
                 Server.maxDrainSeconds <= Double(Server.readTimeoutSeconds))
        c.measure("max_body_bytes", Double(Server.maxBodyBytes))
        c.measure("max_drain_seconds", Server.maxDrainSeconds)
        do { try httpHeaderBounds(&c) }
        catch { c.expect("header-bound socket fixtures complete", false, String(describing: error)) }
        return c.report()
    }

    /// Queue a bounded request before reading it. A head that crosses the
    /// reader's 64 KiB buffer then exercises the real multi-read path without
    /// relying on sleeps, network packet timing or a loaded engine.
    private static func httpHeaderBounds(_ c: inout CheckBuilder) throws {
        func read(_ bytes: Data) throws -> Server.ReadOutcome {
            var sockets: [Int32] = [-1, -1]
            guard socketpair(AF_UNIX, SOCK_STREAM, 0, &sockets) == 0 else {
                throw ServerError("cannot create HTTP framing socket pair")
            }
            defer { close(sockets[0]); close(sockets[1]) }
            var capacity: Int32 = 256 << 10
            let optionSize = socklen_t(MemoryLayout<Int32>.size)
            guard setsockopt(sockets[0], SOL_SOCKET, SO_SNDBUF, &capacity, optionSize) == 0,
                  setsockopt(sockets[1], SOL_SOCKET, SO_RCVBUF, &capacity, optionSize) == 0 else {
                throw ServerError("cannot size HTTP framing socket pair")
            }
            var timeout = timeval(tv_sec: 2, tv_usec: 0)
            guard setsockopt(sockets[0], SOL_SOCKET, SO_SNDTIMEO, &timeout,
                            socklen_t(MemoryLayout<timeval>.size)) == 0,
                  setsockopt(sockets[1], SOL_SOCKET, SO_RCVTIMEO, &timeout,
                            socklen_t(MemoryLayout<timeval>.size)) == 0 else {
                throw ServerError("cannot set HTTP framing socket deadlines")
            }
            try bytes.withUnsafeBytes { raw in
                var sent = 0
                while sent < raw.count {
                    let n = write(sockets[0], raw.baseAddress!.advanced(by: sent), raw.count - sent)
                    if n < 0 && errno == EINTR { continue }
                    guard n > 0 else { throw ServerError("cannot queue HTTP framing fixture") }
                    sent += n
                }
            }
            shutdown(sockets[0], SHUT_WR)
            return Server.readRequest(sockets[1])
        }
        func paddedHead(bytes: Int) -> Data {
            let prefix = "GET /v1/models HTTP/1.1\r\nX-Padding: "
            return Data((prefix + String(repeating: "a", count: bytes - prefix.utf8.count - 4)
                         + "\r\n\r\n").utf8)
        }
        func refused(_ label: String, _ bytes: Data, target: String) throws {
            if case let .fail(status, _, gotTarget) = try read(bytes) {
                c.equal(label + ": status", status, "431 Request Header Fields Too Large")
                c.equal(label + ": target retained", gotTarget, target)
            } else {
                c.expect(label + ": rejected", false)
            }
        }
        let limit = 64 << 10
        // Include terminators split at each of their four bytes across the
        // read boundary, plus the exact accepted ceiling.
        for size in (limit - 4)...limit {
            if case let .ok(request) = try read(paddedHead(bytes: size)) {
                c.equal("head of \(size) bytes: path", request.path, "/v1/models")
                c.equal("head of \(size) bytes: no body", request.body, Data())
            } else {
                c.expect("head of \(size) bytes: accepted", false)
            }
        }
        for size in [limit + 1, limit + 2, limit + 3, limit + 4, 80 << 10, 128 << 10] {
            try refused("head of \(size) bytes", paddedHead(bytes: size), target: "/v1/models")
        }
        try refused("unterminated head", Data(paddedHead(bytes: limit + 5).dropLast(4)), target: "/v1/models")
        try refused("UTF-8 byte bound", Data(("GET /v1/models HTTP/1.1\r\nX-Padding: "
                    + String(repeating: "é", count: 40 << 10) + "\r\n\r\n").utf8), target: "/v1/models")

        let body = Data((0..<(80 << 10)).map { UInt8(truncatingIfNeeded: $0) })
        let head = Data("POST /api/chat HTTP/1.1\r\nContent-Length: \(body.count)\r\n\r\n".utf8)
        if case let .ok(request) = try read(head + body) {
            c.equal("coalesced body is not counted as headers", request.body, body)
        } else {
            c.expect("coalesced body is accepted", false)
        }
    }

    public static func httpRouting() -> CheckReport {
        var c = CheckBuilder("http-routing")

        // A query string is not part of the route. It used to 404 the request.
        c.equal("a query string does not change the route",
                Server.routePath("/api/tags?nocache=1"), "/api/tags")
        c.equal("a bare path is unchanged", Server.routePath("/api/chat"), "/api/chat")
        c.equal("a trailing slash is the same route", Server.routePath("/api/tags/"), "/api/tags")
        c.equal("the root keeps its slash", Server.routePath("/"), "/")

        // Absolute-form targets are legal HTTP and are what proxies send.
        c.equal("an absolute-form target routes on its path",
                Server.routePath("http://127.0.0.1:11434/api/tags"), "/api/tags")
        c.equal("...including https",
                Server.routePath("https://localhost:11434/v1/models"), "/v1/models")
        c.equal("...and an authority with no path is the root",
                Server.routePath("http://127.0.0.1:11434"), "/")
        c.equal("...with the query still stripped",
                Server.routePath("http://127.0.0.1:11434/api/ps?x=1"), "/api/ps")

        // CORS: a wildcard would turn any website the user visits into an
        // unauthenticated caller of an expensive local model.
        c.equal("no Origin needs no CORS header", Server.corsHeaders(origin: nil), "")
        c.equal("an empty Origin needs no CORS header", Server.corsHeaders(origin: ""), "")
        for good in ["http://localhost:3000", "http://127.0.0.1:8080", "https://localhost",
                     "http://[::1]:5173"] {
            let h = Server.corsHeaders(origin: good)
            c.expect("loopback origin \(good) is echoed",
                     h?.contains("Access-Control-Allow-Origin: \(good)") == true, "got \(h ?? "nil")")
            c.expect("...and varies on Origin", h?.contains("Vary: Origin") == true)
        }
        for bad in ["https://attacker.example", "http://evil.localhost.attacker.com",
                    "file:///etc/passwd", "http://192.168.1.10:3000", "not a url"] {
            c.expect("foreign origin \(bad) is refused", Server.corsHeaders(origin: bad) == nil,
                     "got \(Server.corsHeaders(origin: bad) ?? "nil")")
        }
        return c.report()
    }
}
