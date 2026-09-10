import Foundation

/// A bounded cancellation request. Object identity prevents a delayed
/// acknowledgement from clearing a newer event (including counter wraparound).
package final class PressureTicket {
    package let requestedAt = RuntimeClock.now()
}

package final class PressureBoundary: @unchecked Sendable {
    private let lock = NSLock()
    private var pending: PressureTicket?

    package init() {}

    package func request() -> PressureTicket {
        lock.lock(); defer { lock.unlock() }
        let ticket = PressureTicket()
        pending = ticket
        return ticket
    }

    package func snapshot() -> PressureTicket? {
        lock.lock(); defer { lock.unlock() }
        return pending
    }

    package func acknowledge(_ ticket: PressureTicket) {
        lock.lock(); defer { lock.unlock() }
        if pending === ticket { pending = nil }
    }
}

/// Polling must not queue behind generation on the same dispatch queue that
/// delivers OS pressure events. Resizing still owns this gate exclusively.
package final class GenerationGate: @unchecked Sendable {
    private let mutex = NSLock()
    package init() {}
    package func lock() { mutex.lock() }
    package func unlock() { mutex.unlock() }
    package func lock(request: RequestController) throws {
        while !mutex.try() {
            try request.check(phase: "generation queue")
            Thread.sleep(forTimeInterval: 0.005)
        }
        do { try request.check(phase: "generation queue") }
        catch { mutex.unlock(); throw error }
    }
    @discardableResult
    package func tryWithExclusive(_ body: () -> Void) -> Bool {
        guard mutex.try() else { return false }
        defer { mutex.unlock() }
        body()
        return true
    }
}
