import Foundation
import Darwin

/// One socket writer owns queued HTTP body bytes. The inference callback only
/// enqueues: neither a slow peer nor a full queue may wait under the engine lock.
/// The connection owner must finish/join this writer before closing its fd.
package final class BoundedOutput: @unchecked Sendable {
    package struct Snapshot: Codable {
        package var queuedBytes = 0
        package var writtenBytes = 0
        package var queuedFrames = 0
        package var writtenFrames = 0
        package var peakOwnedBytes = 0
        package var socketWaitSeconds = 0.0
        package var firstWriteSeconds: Double?
        package var failed = false
    }

    private let fd: Int32
    private let originalFlags: Int32
    private var flagsRestored = false
    private let maxBytes: Int
    private let maxFrames: Int
    private let writeTimeout: Double
    private let started = RuntimeClock.now()
    private let lock = NSLock()
    private let available = DispatchSemaphore(value: 0)
    private let done = DispatchGroup()
    private var queue: [Data] = []
    // Includes the worker's in-flight Data: a partial write does not release it.
    private var ownedBytes = 0
    private var ownedFrames = 0
    private var closing = false
    private var counters = Snapshot()

    package init(fd: Int32, maxBytes: Int = 1 << 20, maxFrames: Int = 64,
                 writeTimeout: Double = 5) {
        precondition(maxBytes > 0 && maxFrames > 0 && writeTimeout > 0 && writeTimeout <= 30)
        self.fd = fd
        originalFlags = fcntl(fd, F_GETFL)
        self.maxBytes = maxBytes
        self.maxFrames = maxFrames
        self.writeTimeout = writeTimeout
        var one: Int32 = 1
        setsockopt(fd, SOL_SOCKET, SO_NOSIGPIPE, &one, socklen_t(MemoryLayout<Int32>.size))
        // Darwin's local-socket send path did block with MSG_DONTWAIT alone
        // in the saturation gate. Set the descriptor mode as well, after the
        // request body has been read, and restore it only after joining.
        if originalFlags < 0 || fcntl(fd, F_SETFL, originalFlags | O_NONBLOCK) != 0 {
            counters.failed = true; closing = true
            available.signal()
        }
        done.enter()
        DispatchQueue(label: "slotstream.socket-output").async { self.work() }
    }

    package var alive: Bool {
        lock.lock(); defer { lock.unlock() }
        return !counters.failed && !closing
    }

    package var snapshot: Snapshot {
        lock.lock(); defer { lock.unlock() }
        return counters
    }

    /// Bytes are already framed. Rejection cancels the stream; no partial frame
    /// is enqueued and the producer must stop. Previously written bytes remain
    /// distinct from accepted-but-not-yet-written bytes in the counters.
    @discardableResult package func enqueue(_ data: Data) -> Bool {
        lock.lock()
        guard !closing && !counters.failed else { lock.unlock(); return false }
        guard data.count <= maxBytes - ownedBytes && ownedFrames < maxFrames else {
            failLocked(); lock.unlock(); available.signal(); return false
        }
        queue.append(data)
        ownedBytes += data.count; ownedFrames += 1
        counters.queuedBytes += data.count; counters.queuedFrames += 1
        counters.peakOwnedBytes = max(counters.peakOwnedBytes, ownedBytes)
        lock.unlock()
        available.signal()
        return true
    }

    package func cancel() {
        lock.lock(); failLocked(); lock.unlock()
        available.signal()
    }

    private func failLocked() {
        counters.failed = true
        closing = true
        // Drop pending storage now; the worker owns at most one bounded frame.
        for data in queue { ownedBytes -= data.count; ownedFrames -= 1 }
        queue.removeAll()
        shutdown(fd, SHUT_WR)
    }

    /// Called after generation releases its lock. The entire drain has one
    /// monotonic deadline, so a peer cannot extend it by accepting a byte at a time.
    @discardableResult package func finish() -> Bool {
        lock.lock(); closing = true; lock.unlock()
        available.signal()
        if done.wait(timeout: .now() + writeTimeout) == .timedOut {
            cancel()
            // send is nonblocking; poll wakes at least every 50 ms and observes
            // cancellation. Joining is mandatory before the owner closes/reuses fd.
            done.wait()
        }
        lock.lock()
        if !flagsRestored && originalFlags >= 0 {
            _ = fcntl(fd, F_SETFL, originalFlags)
            flagsRestored = true
        }
        let succeeded = !counters.failed
        lock.unlock()
        return succeeded
    }

    private var failed: Bool {
        lock.lock(); defer { lock.unlock() }
        return counters.failed
    }

    private func work() {
        defer { done.leave() }
        while true {
            available.wait()
            lock.lock()
            if counters.failed || (closing && queue.isEmpty) { lock.unlock(); return }
            guard !queue.isEmpty else { lock.unlock(); continue }
            let data = queue.removeFirst()
            lock.unlock()
            let written = write(data)
            lock.lock()
            ownedBytes -= data.count; ownedFrames -= 1
            if written { counters.writtenFrames += 1 }
            else { failLocked() }
            let exit = counters.failed || (closing && queue.isEmpty)
            lock.unlock()
            if exit { return }
        }
    }

    private func write(_ data: Data) -> Bool {
        let start = RuntimeClock.now()
        return data.withUnsafeBytes { bytes in
            var sent = 0
            while sent < bytes.count {
                if failed || RuntimeClock.seconds(since: start) >= writeTimeout { return false }
                let n = Darwin.send(fd, bytes.baseAddress! + sent, bytes.count - sent, MSG_DONTWAIT)
                if n > 0 {
                    sent += n
                    lock.lock()
                    counters.writtenBytes += n
                    if counters.firstWriteSeconds == nil {
                        counters.firstWriteSeconds = RuntimeClock.seconds(since: started)
                    }
                    lock.unlock()
                    continue
                }
                if n < 0 && errno == EINTR { continue }
                guard n < 0 && (errno == EAGAIN || errno == EWOULDBLOCK) else { return false }
                var event = pollfd(fd: fd, events: Int16(POLLOUT), revents: 0)
                let waitStart = RuntimeClock.now()
                let result = poll(&event, 1, 50)
                let waited = RuntimeClock.seconds(since: waitStart)
                lock.lock(); counters.socketWaitSeconds += waited; lock.unlock()
                if result < 0 && errno != EINTR { return false }
                if result > 0 && event.revents & Int16(POLLERR | POLLHUP | POLLNVAL) != 0 { return false }
            }
            return true
        }
    }
}
