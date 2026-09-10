import Foundation

/// CPU-only, immutable-address lookahead. Its owner either joins and consumes
/// the complete rows once, or cancels and joins before dropping the ticket.
/// The worker never touches the cache, model state, MLX or pool mappings.
package final class NgramPrefetch {
    package let prefix: [Int64]
    package let missing: [Int64]
    package let cacheRevision: UInt64
    private let group = DispatchGroup()
    private let lock = NSLock()
    private var cancelled = false
    private var result: Result<[[Float]],Error>?
    package init(prefix: [Int64], missing: [Int64], cacheRevision: UInt64,
        reader: @escaping (Int64, () -> Bool) throws -> [Float]) {
        precondition(!missing.isEmpty && missing.count <= 16_384)
        self.prefix = prefix; self.missing = missing; self.cacheRevision = cacheRevision
        group.enter()
        DispatchQueue.global(qos:.userInitiated).async {
            defer { self.group.leave() }
            var rows = [[Float]](repeating:[],count:missing.count)
            let failure = JoinedReadFailure(); let lanes = min(32,missing.count)
            rows.withUnsafeMutableBufferPointer { buffer in
                DispatchQueue.concurrentPerform(iterations:lanes) { lane in
                    for row in stride(from:lane,to:missing.count,by:lanes) {
                        if self.isCancelled { break }
                        do { buffer[row] = try reader(missing[row],{ !self.isCancelled }) }
                        catch { failure.record(error) }
                    }
                }
            }
            let outcome: Result<[[Float]],Error>
            do {
                try failure.finish()
                if self.isCancelled { throw CheckpointReadError.cancelled }
                outcome = .success(rows)
            } catch { outcome = .failure(error) }
            self.lock.withLock { self.result = outcome }
        }
    }
    private var isCancelled: Bool { lock.withLock { cancelled } }
    package func cancelAndJoin() {
        lock.withLock { cancelled = true }
        group.wait()
        lock.withLock { result = nil }
    }
    package func joinedRows() throws -> [[Float]] {
        group.wait()
        return try lock.withLock {
            guard !cancelled else { throw CheckpointReadError.cancelled }
            return try result!.get()
        }
    }
}
