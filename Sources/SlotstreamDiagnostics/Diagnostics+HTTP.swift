// The serving layer's framing and routing rules, without a socket.
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
        c.measure("max_body_bytes", Double(Server.maxBodyBytes))
        return c.report()
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
