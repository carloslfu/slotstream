import Foundation
import Darwin
import Slotstream

extension Diagnostics {
    /// Real socket pairs exercise kernel backpressure without a model, external
    /// clients or large allocations. Every writer joins before either fd closes.
    public static func optimizationOutput() throws -> CheckReport { try optimizationOutput(tcp: false) }
    public static func optimizationOutputTCP() throws -> CheckReport { try optimizationOutput(tcp: true) }

    private static func optimizationOutput(tcp: Bool) throws -> CheckReport {
        var c = CheckBuilder("optimization-bounded-output\(tcp ? "-tcp" : "")")
        c.expect("output queue is opt-in", !InferenceOptimizations().boundedOutputQueue)
        c.expect("typed output queue control", try InferenceOptimizations.environment(["SLOTSTREAM_OPT_OUTPUT_QUEUE": "1"]).boundedOutputQueue)
        func sockets() throws -> (Int32, Int32) {
            var pair: [Int32] = [-1, -1]
            if tcp {
                let listener = socket(AF_INET, SOCK_STREAM, 0)
                guard listener >= 0 else { throw ModelError("TCP listener failed: \(errno)") }
                defer { close(listener) }
                var address = sockaddr_in()
                address.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
                address.sin_family = sa_family_t(AF_INET)
                address.sin_addr.s_addr = inet_addr("127.0.0.1")
                var length = socklen_t(MemoryLayout<sockaddr_in>.size)
                let bound = withUnsafePointer(to: &address) { p in
                    p.withMemoryRebound(to: sockaddr.self, capacity: 1) { Darwin.bind(listener, $0, length) }
                }
                guard bound == 0, listen(listener, 1) == 0 else { throw ModelError("TCP bind/listen failed: \(errno)") }
                let named = withUnsafeMutablePointer(to: &address) { p in
                    p.withMemoryRebound(to: sockaddr.self, capacity: 1) { getsockname(listener, $0, &length) }
                }
                guard named == 0 else { throw ModelError("TCP address failed: \(errno)") }
                let peer = socket(AF_INET, SOCK_STREAM, 0)
                guard peer >= 0 else { throw ModelError("TCP peer failed: \(errno)") }
                var receiveSize: Int32 = 1024
                // Bound the advertised receive window before the handshake.
                guard setsockopt(peer, SOL_SOCKET, SO_RCVBUF, &receiveSize,
                    socklen_t(MemoryLayout<Int32>.size)) == 0 else {
                    close(peer); throw ModelError("TCP receive window failed: \(errno)")
                }
                let connected = withUnsafePointer(to: &address) { p in
                    p.withMemoryRebound(to: sockaddr.self, capacity: 1) { Darwin.connect(peer, $0, length) }
                }
                guard connected == 0 else { close(peer); throw ModelError("TCP connect failed: \(errno)") }
                let fd = accept(listener, nil, nil)
                guard fd >= 0 else { close(peer); throw ModelError("TCP accept failed: \(errno)") }
                pair = [fd, peer]
            } else {
                guard socketpair(AF_UNIX, SOCK_STREAM, 0, &pair) == 0 else {
                    throw ModelError("socketpair failed: \(errno)")
                }
            }
            var size: Int32 = 1024
            setsockopt(pair[0], SOL_SOCKET, SO_SNDBUF, &size, socklen_t(MemoryLayout<Int32>.size))
            return (pair[0], pair[1])
        }
        do {
            let (fd, peer) = try sockets()
            defer { close(fd); close(peer) }
            let writer = BoundedOutput(fd: fd)
            c.expect("empty queue finishes", writer.finish())
            c.expect("finished queue rejects new bytes", !writer.enqueue(Data([1])))
            c.equal("empty queue writes nothing", writer.snapshot.writtenBytes, 0)
            c.expect("finish is idempotent", writer.finish())
        }
        do {
            let (fd, peer) = try sockets()
            defer { close(fd); close(peer) }
            let writer = BoundedOutput(fd: fd, maxBytes: 4096)
            // Deliberately split both a multibyte scalar and an HTTP delimiter.
            let expected = Data("9\r\nA😀中B\r\n0\r\n\r\n".utf8)
            let cuts = [0, 6, 8, 12, expected.count]
            for i in 0 ..< cuts.count - 1 {
                c.expect("enqueue fragment \(i)", writer.enqueue(expected.subdata(in: cuts[i] ..< cuts[i + 1])))
            }
            c.expect("ordered frames drain", writer.finish())
            c.equal("descriptor flags restored after joining", fcntl(fd, F_GETFL) & O_NONBLOCK, 0)
            var got = Data()
            while got.count < expected.count {
                var ready = pollfd(fd: peer, events: Int16(POLLIN), revents: 0)
                guard poll(&ready, 1, 1000) > 0 else { break }
                var bytes = [UInt8](repeating: 0, count: 7)
                let n = read(peer, &bytes, bytes.count)
                guard n > 0 else { break }
                got.append(contentsOf: bytes.prefix(n))
            }
            c.equal("byte-exact FIFO across scalar and framing splits", got, expected)
            let s = writer.snapshot
            c.equal("written frame count", s.writtenFrames, 4)
            c.equal("queued bytes", s.queuedBytes, expected.count)
            c.equal("written bytes", s.writtenBytes, expected.count)
            c.expect("first socket write observed", s.firstWriteSeconds != nil)
            c.expect("owned storage bounded", s.peakOwnedBytes <= 4096)
        }
        do {
            let (fd, peer) = try sockets()
            defer { close(fd); close(peer) }
            let writer = BoundedOutput(fd: fd, maxBytes: 64)
            c.expect("oversized frame rejected atomically", !writer.enqueue(Data(count: 65)))
            c.expect("oversized frame cancels producer", !writer.alive)
            c.expect("oversized frame drain fails", !writer.finish())
            c.equal("oversized frame never queued", writer.snapshot.queuedBytes, 0)
            c.equal("oversized frame never written", writer.snapshot.writtenBytes, 0)
        }
        do {
            let (fd, peer) = try sockets()
            defer { close(fd); close(peer) }
            let writer = BoundedOutput(fd: fd, maxBytes: 128 << 10, maxFrames: 1, writeTimeout: 0.2)
            c.expect("one in-flight frame accepted", writer.enqueue(Data(count: 64 << 10)))
            let t = RuntimeClock.now()
            c.expect("in-flight frame counts toward saturation", !writer.enqueue(Data([1])))
            c.expect("saturation never blocks inference callback", RuntimeClock.seconds(since: t) < 0.1)
            c.expect("saturated writer joins with failure", !writer.finish())
            c.expect("saturation cleanup is bounded", RuntimeClock.seconds(since: t) < 1)
            c.expect("saturated owned storage bounded", writer.snapshot.peakOwnedBytes <= 128 << 10)
        }
        do {
            let (fd, peer) = try sockets()
            defer { close(fd); close(peer) }
            let writer = BoundedOutput(fd: fd, maxBytes: 512 << 10, writeTimeout: 0.15)
            let t = RuntimeClock.now()
            c.expect("stalled-peer frame accepted", writer.enqueue(Data(count: 512 << 10)))
            c.expect("non-reading peer times out", !writer.finish())
            let s = writer.snapshot
            c.expect("stalled peer cannot extend drain deadline", RuntimeClock.seconds(since: t) < 1)
            c.expect("socket stalls observed", s.socketWaitSeconds > 0)
            c.expect("queued and written bytes stay distinct", s.writtenBytes < s.queuedBytes)
            c.equal("partial frame is not a written frame", s.writtenFrames, 0)
        }
        do {
            let (fd, peer) = try sockets()
            defer { close(fd) }
            let writer = BoundedOutput(fd: fd, writeTimeout: 0.2)
            if tcp {
                // A FIN is a half-close: a subsequent local send can succeed
                // before the peer's lack of a reader becomes observable.
                // Establish an abortive close and observe its reset first.
                var abortive = linger(l_onoff: 1, l_linger: 0)
                guard setsockopt(peer, SOL_SOCKET, SO_LINGER, &abortive,
                    socklen_t(MemoryLayout<linger>.size)) == 0 else {
                    close(peer); throw ModelError("TCP abortive close setup failed: \(errno)")
                }
            }
            close(peer)
            if tcp {
                var event = pollfd(fd: fd, events: Int16(POLLIN), revents: 0)
                c.expect("TCP reset becomes observable", poll(&event, 1, 1000) > 0)
                var byte: UInt8 = 0
                let read = recv(fd, &byte, 1, MSG_PEEK | MSG_DONTWAIT), error = errno
                c.expect("abortive peer close reports ECONNRESET", read < 0 && error == ECONNRESET)
            }
            _ = writer.enqueue(Data([1, 2, 3]))
            c.expect("disconnected peer fails without SIGPIPE", !writer.finish())
            c.expect("disconnect error latched for cancellation", writer.snapshot.failed)
            c.equal("observed disconnect accepts no complete frame for writing", writer.snapshot.writtenFrames, 0)
        }
        return c.report()
    }
}
