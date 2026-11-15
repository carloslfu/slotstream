import Foundation

/// Experimental, off by default (`SLOTSTREAM_OPT_DEMAND_THREADS=1`): runs the
/// demand path's read lanes on real threads, so every lane can be blocked in
/// `pread` at once. The default, `DispatchQueue.concurrentPerform`, runs at
/// most one iteration per CPU and starts no replacement while one blocks,
/// which held 32 demand lanes to about 9 reads in flight on a 10-core M4 and
/// split those 9 across mirror replicas. CPU-bound loops should keep using
/// `concurrentPerform`.
///
/// This is not a measured speedup. In the one comparison so far (PR #141, one
/// Mac mini with two and three checkpoint copies) more reads in flight raised
/// disk-only replay throughput but did not make generation faster. It stays a
/// switch for comparisons until an interleaved run of real generation shows a
/// gain; `ExpertStore.poolQueueDepth` keeps the meaning it was measured with.
///
/// Threads park between calls because a demand read happens once per layer,
/// and starting a call's worth of threads each time would cost about as long
/// as the read's own fixed latency. The pool is bounded three ways: it never
/// holds more threads than lanes are queued or running, never more than
/// `maximumThreads`, and a thread that finds no lane for `idleSeconds` exits.
/// Calls may overlap. Lanes beyond the thread limit wait for a free thread.
package final class BlockingReadLanes: @unchecked Sendable {
    package static let shared = BlockingReadLanes()

    /// The demand path's largest queue depth (`ExpertStore.poolQueueDepth`
    /// clamps to 128); the caller runs one of those lanes itself.
    package static let defaultMaximumThreads = 127

    private struct Lane {
        let body: (Int) -> Void
        let index: Int
        let done: DispatchGroup
    }

    private let condition = NSCondition()
    private let maximumThreads: Int
    private let idleSeconds: TimeInterval
    private var queued: [Lane] = []
    /// Lanes queued or running on a pool thread.
    private var unfinished = 0
    private var threads = 0
    private var parked = 0
    private var peak = 0
    private var started = 0

    package init(maximumThreads: Int = BlockingReadLanes.defaultMaximumThreads, idleSeconds: TimeInterval = 30) {
        self.maximumThreads = max(1, maximumThreads)
        self.idleSeconds = max(0, idleSeconds)
    }

    /// Pool threads alive now, the most that were ever alive at once, and how
    /// many were ever started.
    package var threadCount: Int { condition.lock(); defer { condition.unlock() }; return threads }
    package var peakThreadCount: Int { condition.lock(); defer { condition.unlock() }; return peak }
    package var startedThreadCount: Int { condition.lock(); defer { condition.unlock() }; return started }

    /// Runs `body` once per lane and returns after every lane has returned. The
    /// caller runs lane 0 itself.
    package func run(lanes: Int, _ body: (Int) -> Void) {
        guard lanes > 1 else {
            if lanes == 1 { body(0) }
            return
        }
        withoutActuallyEscaping(body) { escapable in
            let done = DispatchGroup()
            for _ in 1 ..< lanes { done.enter() }
            condition.lock()
            for index in 1 ..< lanes { queued.append(Lane(body: escapable, index: index, done: done)) }
            unfinished += lanes - 1
            // One thread per unfinished lane, counting every thread that
            // exists: parked, starting or still inside an earlier lane.
            let starting = max(0, min(maximumThreads, unfinished) - threads)
            threads += starting
            started += starting
            peak = max(peak, threads)
            // Wake one parked thread per new lane. A thread that is starting,
            // or finishing a lane, takes its next from the queue unprompted.
            for _ in 0 ..< min(lanes - 1, parked) { condition.signal() }
            condition.unlock()
            for _ in 0 ..< starting { startThread() }

            escapable(0)
            done.wait()
        }
    }

    private func startThread() {
        let thread = Thread { [self] in serveLanes() }
        thread.name = "slotstream.demand-read"
        // A demand read blocks a generation someone is waiting for.
        thread.qualityOfService = .userInitiated
        thread.start()
    }

    private func serveLanes() {
        condition.lock()
        while true {
            var deadline: Date?
            while queued.isEmpty {
                let until = deadline ?? Date(timeIntervalSinceNow: idleSeconds)
                deadline = until
                parked += 1
                let signaled = condition.wait(until: until)
                parked -= 1
                if !signaled, queued.isEmpty {
                    threads -= 1
                    condition.unlock()
                    return
                }
            }
            var lane: Lane? = queued.removeFirst()
            condition.unlock()
            let done = lane!.done
            autoreleasepool { lane!.body(lane!.index) }
            // `run` may return, and its closure stop being valid, the moment
            // the group empties: drop this thread's reference to it first.
            lane = nil
            condition.lock()
            unfinished -= 1
            done.leave()
        }
    }
}
