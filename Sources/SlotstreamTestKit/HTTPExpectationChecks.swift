import Foundation
import Darwin
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    private final class HTTPReadResult: @unchecked Sendable {
        let lock = NSLock()
        var value: Server.ReadOutcome?
        func store(_ value: Server.ReadOutcome) { lock.lock(); self.value = value; lock.unlock() }
        func load() -> Server.ReadOutcome? { lock.lock(); defer { lock.unlock() }; return value }
    }

    static func httpExpectations() throws -> CheckReport {
        var c = CheckBuilder("http-expectations")
        func exchange(_ fields: [String], version: String = "HTTP/1.1", upload: Bool = false,
                      prequeued: Bool = false) throws -> (String, Server.ReadOutcome?) {
            var sockets: [Int32] = [-1, -1]
            guard socketpair(AF_UNIX, SOCK_STREAM, 0, &sockets) == 0 else { throw ServerError("cannot create expectation fixture") }
            let client = sockets[0], server = sockets[1]
            let done = DispatchSemaphore(value: 0)
            let result = HTTPReadResult()
            var joined = false, readerStarted = false
            defer {
                shutdown(client, SHUT_RDWR); shutdown(server, SHUT_RDWR)
                // Every exit joins the reader before closing/reusing descriptors.
                if readerStarted && !joined { done.wait() }
                close(client); close(server)
            }
            for fd in sockets {
                var one: Int32 = 1
                var receive = timeval(tv_sec: fd == client ? 1 : 5, tv_usec: 0)
                var send = timeval(tv_sec: 1, tv_usec: 0)
                guard setsockopt(fd, SOL_SOCKET, SO_NOSIGPIPE, &one, socklen_t(MemoryLayout<Int32>.size)) == 0,
                      setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, &receive, socklen_t(MemoryLayout<timeval>.size)) == 0,
                      setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, &send, socklen_t(MemoryLayout<timeval>.size)) == 0 else {
                    // No reader has been started on this error path.
                    joined = true
                    throw ServerError("cannot bound expectation fixture I/O")
                }
            }
            func send(_ data: Data) throws {
                try data.withUnsafeBytes { raw in
                    var offset = 0
                    while offset < raw.count {
                        let n = write(client, raw.baseAddress!.advanced(by: offset), raw.count - offset)
                        if n < 0 && errno == EINTR { continue }
                        guard n > 0 else { throw ServerError("cannot send expectation fixture") }
                        offset += n
                    }
                }
            }
            let head = (["POST /v1/responses \(version)"] + fields).joined(separator: "\r\n") + "\r\n\r\n"
            if prequeued { try send(Data((head + "{}").utf8)) }
            readerStarted = true
            Thread.detachNewThread {
                result.store(Server.readRequest(server))
                done.signal()
            }
            if !prequeued { try send(Data(head.utf8)) }
            var interim = ""
            if upload {
                var bytes = [UInt8](repeating: 0, count: 64)
                var received = Data()
                while received.count < 64 && received.range(of: Data("\r\n\r\n".utf8)) == nil {
                    let count = read(client, &bytes, min(bytes.count, 64 - received.count))
                    if count < 0 && errno == EINTR { continue }
                    if count <= 0 { break }
                    received.append(contentsOf: bytes.prefix(count))
                }
                interim = String(decoding: received, as: UTF8.self)
                try send(Data("{}".utf8))
            }
            joined = done.wait(timeout: .now() + 1) == .success
            if joined && !upload {
                var bytes = [UInt8](repeating: 0, count: 64)
                let count = recv(client, &bytes, bytes.count, MSG_DONTWAIT)
                if count > 0 { interim = String(decoding: bytes.prefix(count), as: UTF8.self) }
            }
            return (interim, joined ? result.load() : nil)
        }
        for fields in [["Expect: 100-continue"], ["eXpEcT: 100-CoNtInUe"],
                       ["Expect: 100-continue, 100-continue"], ["Expect: 100-continue", "Expect: 100-continue"]] {
            let (interim, outcome) = try exchange(["Content-Length: 2"] + fields, upload: true)
            c.equal("upload receives 100 before sending its body: \(fields)", interim, "HTTP/1.1 100 Continue\r\n\r\n")
            if case let .ok(request)? = outcome {
                c.equal("handshake preserves exact body", request.body, Data("{}".utf8))
            } else { c.expect("handshake completes admitted request", false) }
        }
        for fields in [["Expect: something-else"], ["Expect: 100-continue, something-else"],
                       ["Expect: something-else", "Expect: 100-continue"], ["Expect: 100-continue; x=y"]] {
            let (interim, outcome) = try exchange(["Content-Length: 2"] + fields)
            c.equal("unsupported expectation gets no interim success", interim, "")
            if case let .fail(status, _, target)? = outcome {
                c.equal("unsupported expectation is refused before body upload", status, "417 Expectation Failed")
                c.equal("expectation refusal preserves dialect target", target, "/v1/responses")
            } else {
                c.expect("unsupported expectation is refused without waiting for body", false)
                c.expect("expectation refusal preserves dialect target", false)
            }
        }
        for (fields, status) in [(["Content-Length: \(Server.maxBodyBytes + 1)"], "413 Content Too Large"),
                                  (["Content-Length: 2", "Content-Length: 3"], "400 Bad Request")] {
            let (interim, outcome) = try exchange(fields + ["Expect: 100-continue"])
            c.equal("rejected head never gets 100", interim, "")
            if case let .fail(actual, _, target)? = outcome {
                c.equal("head refusal does not wait for expected body", actual, status)
                c.equal("head refusal preserves dialect target", target, "/v1/responses")
            } else {
                c.expect("invalid head gets immediate final refusal", false)
                c.expect("head refusal preserves dialect target", false)
            }
        }
        for (version, value) in [("HTTP/1.1", ""), ("HTTP/1.1", ", ,"), ("HTTP/1.0", "something-else")] {
            let head = "POST /v1/responses \(version)\r\nContent-Length: 0\r\nExpect: \(value)"
            if case .ok = Server.parseHead(head) { c.expect("empty expectations and HTTP/1.0 unknown expectations are ignored", true) }
            else { c.expect("empty expectations and HTTP/1.0 unknown expectations are ignored", false) }
        }
        for (version, fields, prequeued) in [("HTTP/1.0", ["Content-Length: 2", "Expect: 100-continue"], true),
                                              ("HTTP/1.1", ["Content-Length: 2", "Expect: 100-continue"], true),
                                              ("HTTP/1.1", ["Content-Length: 0", "Expect: 100-continue"], false)] {
            let (interim, outcome) = try exchange(fields, version: version, prequeued: prequeued)
            c.equal("no unnecessary interim for HTTP/1.0, received body, or empty body", interim, "")
            if case let .ok(request)? = outcome { c.equal("non-waiting request still parses", request.body, Data((prequeued ? "{}" : "").utf8)) }
            else { c.expect("non-waiting request accepted", false) }
        }
        // A caller of the package reader need not have run Server.run's
        // process-wide signal setup. A closed peer must not kill this process.
        var sockets: [Int32] = [-1, -1]
        guard socketpair(AF_UNIX, SOCK_STREAM, 0, &sockets) == 0 else { throw ServerError("cannot create closed-peer fixture") }
        defer { close(sockets[1]) }
        let head = Data("POST /v1/responses HTTP/1.1\r\nContent-Length: 2\r\nExpect: 100-continue\r\n\r\n".utf8)
        let queued = head.withUnsafeBytes { write(sockets[0], $0.baseAddress!, $0.count) }
        close(sockets[0])
        guard queued == head.count else { throw ServerError("cannot queue closed-peer fixture") }
        if case .closed = Server.readRequest(sockets[1]) { c.expect("peer disappearing before interim response is a closed request", true) }
        else { c.expect("peer disappearing before interim response is a closed request", false) }
        return c.report()
    }
}
