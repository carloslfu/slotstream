import Foundation

/// Runs read lanes on real threads, so `queueDepth` lanes can all be blocked in
/// `pread` at once. `DispatchQueue.concurrentPerform` runs at most one iteration
/// per CPU and starts no replacement while one blocks, which held 32 demand
/// lanes to about 9 reads in flight on a 10-core M4 and split those 9 across
/// mirror replicas. CPU-bound loops should keep using `concurrentPerform`.
///
/// Threads stay parked between calls because a demand read happens once per
/// layer, and starting 32 threads each time would cost about as long as the
/// read's own fixed latency. Calls may overlap; the pool grows to the largest
/// number of lanes waiting at once.
package final class BlockingReadLanes: @unchecked Sendable {
    package static let shared = BlockingReadLanes()

    private final class Call {
        let body: (Int) -> Void
        var unfinishedLanes: Int
        init(body: @escaping (Int) -> Void, unfinishedLanes: Int) {
            self.body = body
            self.unfinishedLanes = unfinishedLanes
        }
    }

    private let condition = NSCondition()
    private var waiting: [(call: Call, lane: Int)] = []
    private var parkedThreads = 0

    package init() {}

    /// Runs `body` once per lane and returns after every lane has returned. The
    /// caller runs lane 0 itself.
    package func run(lanes: Int, _ body: (Int) -> Void) {
        guard lanes > 1 else {
            if lanes == 1 { body(0) }
            return
        }
        withoutActuallyEscaping(body) { escapable in
            let call = Call(body: escapable, unfinishedLanes: lanes - 1)
            condition.lock()
            waiting.append(contentsOf: (1 ..< lanes).map { (call, $0) })
            let threadsToStart = max(0, waiting.count - parkedThreads)
            condition.broadcast()
            condition.unlock()
            for _ in 0 ..< threadsToStart { startThread() }

            escapable(0)

            condition.lock()
            while call.unfinishedLanes > 0 { condition.wait() }
            condition.unlock()
        }
    }

    private func startThread() {
        let thread = Thread { [self] in serveLanes() }
        thread.qualityOfService = .userInitiated
        thread.start()
    }

    private func serveLanes() {
        condition.lock()
        while true {
            while waiting.isEmpty {
                parkedThreads += 1
                condition.wait()
                parkedThreads -= 1
            }
            let (call, lane) = waiting.removeFirst()
            condition.unlock()
            call.body(lane)
            condition.lock()
            call.unfinishedLanes -= 1
            if call.unfinishedLanes == 0 { condition.broadcast() }
        }
    }
}
