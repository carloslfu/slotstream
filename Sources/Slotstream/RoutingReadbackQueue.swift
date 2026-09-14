import MLX

/// Work a decode layer defers to the next routing readback. Between barriers
/// the host still waits once per layer, on the router indices it must read to
/// load experts; arrays queued here are evaluated in that same wait, and their
/// host work runs right after it, in the order it was queued. Model thread only.
package final class RoutingReadbackQueue {
    package private(set) var arrays: [MLXArray] = []
    private var finishers: [(Double) -> Void] = []

    package init() {}

    package var isEmpty: Bool { finishers.isEmpty }
    package var count: Int { finishers.count }

    /// Queue one layer's arrays and the host work that must follow their evaluation.
    package func enqueue(_ values: [MLXArray], finish: @escaping (Double) -> Void) {
        arrays.append(contentsOf: values)
        finishers.append(finish)
    }

    /// The queued arrays have been evaluated. Run every finisher in order, each
    /// charged an equal share of the one wait. The queue empties first, so a
    /// finisher may queue work for the next readback.
    package func drain(waited seconds: Double) {
        guard !finishers.isEmpty else { return }
        let work = finishers
        arrays.removeAll(keepingCapacity: true)
        finishers.removeAll(keepingCapacity: true)
        let share = seconds / Double(work.count)
        for finish in work { finish(share) }
    }

    /// Drop queued work unfinished, for a pass that ends early.
    package func discard() {
        arrays.removeAll(keepingCapacity: true)
        finishers.removeAll(keepingCapacity: true)
    }
}
