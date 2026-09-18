import Foundation

/// Routes checkpoint reads across byte-identical copies of the same model.
///
/// Every replica holds the same bytes, so any replica can serve any read, but
/// the disks they sit on are not equally fast: on the qualifying Mac mini the
/// external NVMe sustains 3.2 GB/s and the internal one 1.8 GB/s. Splitting
/// reads evenly between them is slower than using the fast disk alone whenever
/// few reads are in flight, because every second read waits out the slow disk
/// with nothing to overlap it. At one read in flight those disks deliver 1.13
/// and 2.09 GB/s, so alternating strictly between them yields their harmonic
/// mean, 1.47 GB/s, 30% below simply using the fast one.
///
/// So this router does not balance. It estimates when each replica would finish
/// a read submitted now, as the bytes already queued there plus this read over
/// the throughput that replica has lately achieved, and submits to the earliest
/// finisher. Both ends of the concurrency range then come out right without a
/// threshold to tune: while the replicas are idle there is nothing queued and
/// the estimate is decided by throughput alone, so the fast disk takes
/// essentially everything; once it has a backlog the queued bytes lift its
/// estimate past the slow disk's and the surplus spills across. Across three
/// paired 200-token decodes that settles at a median 71.4% / 28.6% of bytes,
/// which `iostat` confirms at the devices as 69.4% / 30.6%, and it lifts
/// prefill from 3.2 GB/s to 4.4 GB/s and decode from 6.11 to 7.35 tok/s against
/// the same runs on the external disk alone.
///
/// Two properties of the measurement are what make this work, and both were
/// learned by getting them wrong first.
///
/// The throughput is measured in aggregate — bytes completed over the time the
/// replica had at least one read in flight — rather than from the duration of
/// individual reads. A single read's wall clock already contains the wait
/// behind everything else queued on the same disk, so an estimate built from it
/// gets worse the more work the replica is given, and multiplying it by the
/// queue counts that same wait twice. The first version did exactly that and
/// ran away: the internal disk took 2410 reads, measured itself at under
/// 5 MB/s because those reads had been waiting on each other, and was never
/// chosen again across the following 40,000 reads. The external disk was
/// meanwhile estimated at 0.10 GB/s while `iostat` showed it delivering
/// 2.1 GB/s. Aggregate throughput inverts that feedback, because giving a
/// replica more concurrent work makes it measure faster rather than slower, up
/// to its own ceiling.
///
/// A measurement also expires. A replica is only measured while it is being
/// used, so any reading that argues against using it is self-sealing: one
/// unlucky probe — the internal disk caught mid-stall behind the engine's own
/// startup allocations — excluded it for an entire run, and because it was
/// excluded the reading that condemned it was never revisited. Past
/// `measurementLifetime` an idle replica's reading is discarded rather than
/// kept, so the next claim measures that disk as it is now. The cost is one
/// probe per second per starved replica, against reads that arrive by the
/// thousand per second.
///
/// No device is described to the router. Each replica's throughput is learned
/// from its own completed reads, so a mirror across two equal disks balances
/// evenly, and a mirror whose fast disk degrades re-weights itself without
/// anyone re-measuring the hardware.
package final class MirrorRouter {
    /// How long an idle replica's throughput reading stays usable.
    private static let measurementLifetime: UInt64 = 1_000_000_000

    private struct Replica {
        var queuedReads = 0
        var queuedBytes = 0
        var servedBytes = 0
        /// Bytes and elapsed nanoseconds behind the current throughput reading,
        /// which is a recent window rather than the lifetime of the run.
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

    package init(replicaCount: Int) {
        precondition(replicaCount > 0, "a mirror needs at least one replica")
        replicas = Array(repeating: Replica(), count: replicaCount)
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
        let now = DispatchTime.now().uptimeNanoseconds
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
        let now = DispatchTime.now().uptimeNanoseconds
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

    /// Bytes each replica has served, in replica order. Reporting the split is
    /// the only way to tell a working mirror from one where a replica is
    /// present but never chosen.
    package func servedBytes() -> [Int] {
        lock.lock()
        defer { lock.unlock() }
        return replicas.map(\.servedBytes)
    }
}
