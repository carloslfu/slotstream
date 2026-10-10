import Foundation

/// Routes reads to the replica with the earliest estimated completion time:
/// (queued bytes + this read) / recently observed throughput.
/// Throughput uses aggregate completed bytes over busy time, so concurrent
/// reads do not count the same queueing delay repeatedly. Idle measurements
/// expire to let a stalled or unused disk recover. Failed reads release their
/// reservations without contributing served bytes.
package final class MirrorRouter {
    /// How long an idle replica's throughput reading stays usable.
    private static let measurementLifetime: UInt64 = 1_000_000_000

    private struct Replica {
        var queuedReads = 0
        var queuedBytes = 0
        var servedBytes = 0
        /// Aggregate completed bytes and busy time; reset when an idle
        /// measurement expires.
        var measuredBytes = 0
        var measuredNanos: UInt64 = 0
        /// Start of the interval during which this replica has had at least one
        /// read in flight, or zero while it is idle. A replica that never falls
        /// idle would otherwise report no elapsed time at all, so the open
        /// interval is added at the point the reading is asked for.
        var busySince: UInt64 = 0
        var touchedAt: UInt64 = 0

        /// Seconds until a read of `bytes` submitted now would finish here. A
        /// replica with no usable reading answers zero, which reads as
        /// "finishes instantly" and is what gets it probed.
        func finishEstimate(adding bytes: Int, now: UInt64) -> Double {
            let elapsed = Double(measuredNanos + (queuedReads > 0 ? now - busySince : 0)) / 1e9
            guard measuredBytes > 0, elapsed > 0 else { return 0 }
            return Double(queuedBytes + bytes) * elapsed / Double(measuredBytes)
        }

        /// True when this replica is idle and has been idle long enough that
        /// its reading no longer describes the disk. A replica with a read in
        /// flight is never stale, however long that read is taking: it is being
        /// measured right now, and diverting more reads onto a disk that is
        /// visibly struggling is the opposite of what the estimate is for.
        func isStale(now: UInt64) -> Bool {
            queuedReads == 0 && now - touchedAt > MirrorRouter.measurementLifetime
        }
    }

    private var replicas: [Replica]
    private let lock = NSLock()
    private let now: () -> UInt64

    package init(replicaCount: Int, now: @escaping () -> UInt64 = { DispatchTime.now().uptimeNanoseconds }) {
        precondition(replicaCount > 0, "a mirror needs at least one replica")
        replicas = Array(repeating: Replica(), count: replicaCount)
        self.now = now
    }

    package var replicaCount: Int { replicas.count }

    /// Reserves a replica for one read of `byteCount` and returns its index.
    /// The caller must pass that index and the same `byteCount` to `release`
    /// when the read ends, including when it fails, or the replica is left
    /// looking permanently busier than it is.
    package func claim(byteCount: Int) -> Int {
        lock.lock()
        defer { lock.unlock() }
        // Read the clock under the lock, not before it: timestamps taken
        // outside order themselves independently of the lock, and a claim that
        // entered holding an older reading than the `busySince` already stored
        // underflows the elapsed-time subtraction.
        let now = self.now()
        var chosen = 0
        var soonest = Double.infinity
        for index in replicas.indices {
            if replicas[index].isStale(now: now) {
                replicas[index].measuredBytes = 0
                replicas[index].measuredNanos = 0
            }
            let finish = replicas[index].finishEstimate(adding: byteCount, now: now)
            if finish < soonest {
                soonest = finish
                chosen = index
            }
        }
        if replicas[chosen].queuedReads == 0 { replicas[chosen].busySince = now }
        replicas[chosen].queuedReads += 1
        replicas[chosen].queuedBytes += byteCount
        replicas[chosen].touchedAt = now
        return chosen
    }

    /// Ends a read that `claim` reserved, with the `byteCount` it reserved. A
    /// read that failed or was cancelled passes `completed: false`: it occupied
    /// the replica, so its time counts, but bytes it never delivered must not
    /// count as throughput.
    package func release(_ index: Int, byteCount: Int, completed: Bool) {
        lock.lock()
        defer { lock.unlock() }
        let now = self.now()
        replicas[index].queuedReads -= 1
        replicas[index].queuedBytes -= byteCount
        replicas[index].touchedAt = now
        if completed {
            replicas[index].servedBytes += byteCount
            replicas[index].measuredBytes += byteCount
        }
        if replicas[index].queuedReads == 0 {
            replicas[index].measuredNanos += now - replicas[index].busySince
            replicas[index].busySince = 0
        }
    }

    /// Cumulative bytes served by each replica, in replica order.
    package func servedBytes() -> [Int] {
        lock.lock()
        defer { lock.unlock() }
        return replicas.map(\.servedBytes)
    }
}
