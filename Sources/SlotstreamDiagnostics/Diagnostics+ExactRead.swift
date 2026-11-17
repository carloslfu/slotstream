import Darwin
import Foundation
import Slotstream

extension Diagnostics {
    public static func optimizationExactRead() -> CheckReport {
        var c = CheckBuilder("optimization-exact-read")
        readLaneChecks(&c)
        var destination = [UInt8](repeating: 0xaa, count: 23)
        let expected = (0..<17).map { UInt8($0 * 13) }
        var calls = 0, requests: [(Int, Int)] = []
        do {
            try destination.withUnsafeMutableBytes { bytes in
                try ExactRead.transfer(into: bytes.baseAddress!, offset: 100, count: expected.count) { pointer, count, offset in
                    calls += 1; requests.append((count, offset))
                    if calls == 1 || calls == 4 { return .init(count: -1, error: EINTR) }
                    let n = min(3, count), start = offset - 100
                    for i in 0..<n { pointer.storeBytes(of: expected[start + i], toByteOffset: i, as: UInt8.self) }
                    return .init(count: n)
                }
            }
            c.equal("short/interrupted reads assemble exact bytes", Array(destination.prefix(17)), expected)
            c.equal("read never touches bytes after requested range", Array(destination.suffix(6)), Array(repeating: 0xaa, count: 6))
            c.equal("EINTR retries at unchanged first position", requests[0].1, requests[1].1)
            c.equal("all successful byte ranges are consumed", requests.last!.1 + requests.last!.0, 117)
        } catch { c.expect("short/interrupted reads complete", false, String(describing: error)) }
        func fails(_ name: String, offset: Int = 0, count: Int = 17,
                   continuing: @escaping () -> Bool = { true },
                   reader: @escaping (UnsafeMutableRawPointer, Int, Int) -> ExactRead.Outcome,
                   matches: (CheckpointReadError) -> Bool) {
            do {
                try destination.withUnsafeMutableBytes { bytes in
                    try ExactRead.transfer(into: bytes.baseAddress!, offset: offset, count: count,
                        shouldContinue: continuing, read: reader)
                }
                c.expect(name, false, "partial read was accepted")
            } catch let error as CheckpointReadError { c.expect(name, matches(error), error.description) }
            catch { c.expect(name, false, String(describing: error)) }
        }
        fails("EOF is distinct from a stale errno", reader: { _, _, _ in .init(count: 0, error: EINTR) }) {
            if case .unexpectedEOF(offset: 0) = $0 { return true }; return false
        }
        var partialCalls = 0
        fails("error after partial data is not success", reader: { _, _, _ in
            partialCalls += 1; return partialCalls == 1 ? .init(count: 5) : .init(count: -1, error: EIO)
        }) { if case .system(offset: 5, code: EIO) = $0 { return true }; return false }
        var interruptedCalls = 0
        fails("cancellation interrupts an EINTR retry loop", continuing: { interruptedCalls < 3 }, reader: { _, _, _ in
            interruptedCalls += 1; return .init(count: -1, error: EINTR)
        }) { if case .cancelled = $0 { return true }; return false }
        c.equal("cancel stops at the third interruption", interruptedCalls, 3)
        var invalidReads = 0
        for (offset, count) in [(-1, 2), (0, -1), (Int.max, 1)] {
            fails("invalid range \(offset)/\(count)", offset: offset, count: count, reader: { _, _, _ in
                invalidReads += 1; return .init(count: 1)
            }) { if case .invalidRange = $0 { return true }; return false }
        }
        c.equal("invalid ranges never call the reader", invalidReads, 0)
        fails("impossible read progress is rejected", reader: { _, count, _ in .init(count: count + 1) }) {
            if case .invalidProgress = $0 { return true }; return false
        }
        do {
            try destination.withUnsafeMutableBytes { bytes in
                try ExactRead.transfer(into: bytes.baseAddress!, offset: 0, count: 0, shouldContinue: { false }) { _, _, _ in
                    invalidReads += 1; return .init(count: -1, error: EIO)
                }
            }
            c.equal("empty transfer performs no I/O", invalidReads, 0)
        } catch { c.expect("empty transfer succeeds", false) }
        return c.report()
    }

    /// The experimental demand-read threads (`SLOTSTREAM_OPT_DEMAND_THREADS`):
    /// every lane runs once, more lanes than CPUs can block at once, and the
    /// pool stays inside its three bounds. Private pools, so the shared one
    /// and its idle threads are never started by a check.
    private static func readLaneChecks(_ c: inout CheckBuilder) {
        let cpus = ProcessInfo.processInfo.activeProcessorCount
        /// Runs `calls` overlapping calls of `lanes` lanes each. Every lane
        /// blocks until `barrier` lanes have entered, as if each sat in pread.
        func blocked(_ pool: BlockingReadLanes, calls: Int, lanes: Int, barrier: Int)
            -> (together: Bool, ran: [[Int]], mostAtOnce: Int) {
            let entered = DispatchSemaphore(value: 0), release = DispatchSemaphore(value: 0)
            let coordinator = DispatchQueue(label: "exact-read-lane-barrier")
            let lock = NSLock(), returned = DispatchGroup()
            var together = false, ran = [[Int]](repeating: [], count: calls), inside = 0, mostAtOnce = 0
            coordinator.async {
                together = (0 ..< barrier).allSatisfy { _ in entered.wait(timeout: .now() + 20) == .success }
                for _ in 0 ..< calls * lanes { release.signal() }
            }
            for call in 0 ..< calls {
                returned.enter()
                Thread {
                    pool.run(lanes: lanes) { lane in
                        lock.lock(); ran[call].append(lane); inside += 1; mostAtOnce = max(mostAtOnce, inside); lock.unlock()
                        entered.signal()
                        release.wait()
                        lock.lock(); inside -= 1; lock.unlock()
                    }
                    returned.leave()
                }.start()
            }
            returned.wait()
            coordinator.sync {}
            return (together, ran.map { $0.sorted() }, mostAtOnce)
        }
        func eventually(_ condition: () -> Bool) -> Bool {
            for _ in 0 ..< 200 { if condition() { return true }; usleep(50_000) }
            return condition()
        }
        let laneCount = min(BlockingReadLanes.defaultMaximumThreads + 1, max(32, cpus * 3))
        // A long idle time, so a stalled runner cannot retire the threads
        // between the two calls; the idle exit is checked on the next pool.
        let pool = BlockingReadLanes(idleSeconds: 10)
        let all = blocked(pool, calls: 1, lanes: laneCount, barrier: laneCount)
        c.expect("read lanes all block at once beyond the CPU count", all.together && laneCount > cpus)
        c.equal("every read lane runs exactly once", all.ran, [Array(0 ..< laneCount)])
        c.equal("one thread per lane the caller does not run", pool.peakThreadCount, laneCount - 1)
        let again = blocked(pool, calls: 1, lanes: laneCount, barrier: laneCount)
        c.expect("a second call blocks every lane on the parked threads",
            again.together && pool.startedThreadCount == laneCount - 1)

        // Two calls at once each need their own threads, and no more than that.
        let overlapping = BlockingReadLanes(idleSeconds: 0.2)
        let pair = blocked(overlapping, calls: 2, lanes: 16, barrier: 32)
        c.expect("overlapping calls all block at once", pair.together)
        c.equal("overlapping calls each run every lane once", pair.ran, [Array(0 ..< 16), Array(0 ..< 16)])
        c.equal("overlapping calls start one thread per waiting lane", overlapping.startedThreadCount, 30)
        c.expect("idle read threads exit", eventually { overlapping.threadCount == 0 })

        // Past the thread limit the remaining lanes wait for a free thread.
        let bounded = BlockingReadLanes(maximumThreads: 4, idleSeconds: 0.2)
        let capped = blocked(bounded, calls: 1, lanes: 24, barrier: 5)
        c.expect("the thread limit holds",
            capped.together && bounded.peakThreadCount == 4 && capped.mostAtOnce == 5)
        c.equal("lanes beyond the thread limit still run once", capped.ran, [Array(0 ..< 24)])

        var single: [Int] = []
        let trivial = BlockingReadLanes(idleSeconds: 0)
        trivial.run(lanes: 1) { single.append($0) }
        trivial.run(lanes: 0) { single.append($0) }
        c.expect("one lane runs on the caller and no lanes run nothing",
            single == [0] && trivial.startedThreadCount == 0)
    }
}
