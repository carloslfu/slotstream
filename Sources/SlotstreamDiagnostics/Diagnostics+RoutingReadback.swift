import MLX
import Slotstream

extension Diagnostics {
    /// Deferred decode barriers: between barriers a layer's router forecast and
    /// completed-layer tick ride the next routing readback. Work runs once, in
    /// queue order, after the queue has emptied; one wait is split evenly; a
    /// pass that ends early drops the queue without running it; work queued by
    /// a finisher waits for the next readback.
    public static func expertLookaheadRoutingReadback() throws -> CheckReport {
        var c = CheckBuilder("expert-lookahead-routing-readback")
        let queue = RoutingReadbackQueue()
        c.expect("new queue is empty", queue.isEmpty && queue.arrays.isEmpty)
        queue.drain(waited: 1)
        c.expect("draining an empty queue does nothing", queue.isEmpty && queue.count == 0)

        var ran: [Int] = []
        var shares: [Double] = []
        let first = MLXArray([Int32(1), 2, 3]), second = MLXArray([Int32(4)]), third = MLXArray([Int32(5), 6])
        queue.enqueue([first, second]) { ran.append(0); shares.append($0) }
        queue.enqueue([]) { ran.append(1); shares.append($0) }
        queue.enqueue([third]) { ran.append(2); shares.append($0) }
        c.equal("queued finishers", queue.count, 3)
        c.equal("queued arrays", queue.arrays.count, 3)
        eval(queue.arrays)
        c.equal("queued arrays keep order", queue.arrays.map { $0.asArray(Int32.self) }, [[1, 2, 3], [4], [5, 6]])
        queue.drain(waited: 0.9)
        c.equal("finishers run once, in order", ran, [0, 1, 2])
        c.expect("one wait is split evenly", shares.allSatisfy { abs($0 - 0.3) < 1e-12 }, "\(shares)")
        c.expect("drain empties the queue", queue.isEmpty && queue.arrays.isEmpty)
        queue.drain(waited: 0.9)
        c.equal("a second drain runs nothing", ran, [0, 1, 2])

        ran.removeAll()
        queue.enqueue([first]) { _ in ran.append(3) }
        queue.discard()
        queue.drain(waited: 1)
        c.expect("discard drops queued work unrun", ran.isEmpty && queue.isEmpty && queue.arrays.isEmpty)

        shares.removeAll()
        queue.enqueue([]) { _ in
            ran.append(4)
            queue.enqueue([second]) { ran.append(5); shares.append($0) }
        }
        queue.drain(waited: 0.5)
        c.equal("work queued by a finisher waits", ran, [4])
        c.equal("that work stays queued", queue.count, 1)
        queue.drain(waited: 0.25)
        c.equal("it runs at the next drain", ran, [4, 5])
        c.equal("with that drain's wait", shares, [0.25])
        return c.report()
    }
}
