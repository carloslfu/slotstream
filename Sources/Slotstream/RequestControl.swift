import Foundation

public struct ContextConfiguration: Sendable, Equatable {
    public static let defaultWaitMinutes = 30.0
    public let maxContextTokens: Int
    public let maxPrefillWaitMinutes: Double
    /// Explicit diagnostic qualification, never inferred from a mutable cap.
    public let qualification: Bool

    public init(maxContextTokens: Int = ContextPolicy.defaultTokens,
                maxPrefillWaitMinutes: Double = defaultWaitMinutes,
                qualification: Bool = false) throws {
        if let why = ContextPolicy.validationError(maxContextTokens, qualification: qualification) {
            throw RequestFailure(.contextLengthExceeded, why)
        }
        guard maxPrefillWaitMinutes.isFinite, maxPrefillWaitMinutes >= 0,
              maxPrefillWaitMinutes <= Double(UInt64.max) / 60 / 1e9 else {
            throw RequestFailure(.invalidConfiguration,
                "--max-prefill-wait must be finite, nonnegative minutes within the monotonic timer range; 0 disables only the time policy")
        }
        self.maxContextTokens = maxContextTokens
        self.maxPrefillWaitMinutes = maxPrefillWaitMinutes
        self.qualification = qualification
    }
}

public struct RequestFailure: Error, CustomStringConvertible, Codable, Sendable, Equatable {
    public enum Code: String, Codable, Sendable {
        case contextLengthExceeded = "context_length_exceeded"
        case invalidConfiguration = "invalid_configuration"
        case prefillWaitExceeded = "prefill_wait_exceeded"
        case insufficientMemory = "insufficient_memory"
        case prefillDeadlineExceeded = "prefill_deadline_exceeded"
        case clientCancelled = "client_cancelled"
        case inferenceError = "inference_error"
    }
    public let code: Code
    public let message: String
    public var elapsedSeconds: Double?
    public var limitSeconds: Double?
    public var estimatedSeconds: Double?
    public var requiredBytes: Int?
    public var availableBytes: Int?
    public init(_ code: Code, _ message: String) { self.code = code; self.message = message }
    public var description: String { message }
    public var httpStatus: String {
        switch code {
        case .contextLengthExceeded, .invalidConfiguration, .prefillWaitExceeded: return "400 Bad Request"
        case .insufficientMemory, .prefillDeadlineExceeded: return "503 Service Unavailable"
        case .clientCancelled: return "499 Client Closed Request"
        case .inferenceError: return "500 Internal Server Error"
        }
    }
    public var json: [String: Any] {
        var result: [String: Any] = ["code": code.rawValue, "type": code.rawValue, "message": message]
        if let elapsedSeconds { result["elapsed_seconds"] = elapsedSeconds }
        if let limitSeconds { result["limit_seconds"] = limitSeconds }
        if let estimatedSeconds { result["estimated_seconds"] = estimatedSeconds }
        if let requiredBytes { result["required_bytes"] = requiredBytes }
        if let availableBytes { result["available_bytes"] = availableBytes }
        return result
    }
}

/// Atomic admission for allocations that concurrent accepted requests have
/// reserved but may not have materialized yet. Retained preparation stays
/// charged until its controller is released, including time in the queue.
package final class RequestMemoryReservations: @unchecked Sendable {
    private let lock = NSLock()
    private var entries: [UUID: [String: Int]] = [:]
    package init() {}
    package var reservedBytes: Int { lock.withLock { entries.values.reduce(0) { ContextBytes.sum($0, $1.values.reduce(0) { ContextBytes.sum($0, $1) }) } } }
    package func release(_ id: UUID) { lock.withLock { _ = entries.removeValue(forKey: id) } }
    package func releaseDispatch(_ id: UUID) { lock.withLock { entries[id]?["dispatch"] = nil } }

    package func check(_ id: UUID, kind: String?, bytes: Int, slack: Int,
                       available: () -> Double?, phase: String) throws {
        _ = try select(id, kind: kind, allocations: [bytes], slack: slack,
            available: available, phase: phase)
    }

    /// Selection and ownership are one transaction. A rejected preferred
    /// workspace must neither poison the request nor reserve its bytes.
    package func chooseDispatch(_ id: UUID, preferredBytes: Int, fallbackBytes: Int,
                                slack: Int, available: () -> Double?, phase: String) throws -> Bool {
        try select(id, kind: "dispatch", allocations: [preferredBytes, fallbackBytes],
            slack: slack, available: available, phase: phase) == 0
    }

    package func chooseDispatch(_ id: UUID, alternativeBytes: [Int], fallbackBytes: Int,
                                slack: Int, available: () -> Double?, phase: String) throws -> Int? {
        let selected = try select(id, kind: "dispatch", allocations: alternativeBytes + [fallbackBytes],
            slack: slack, available: available, phase: phase)
        return selected < alternativeBytes.count ? selected : nil
    }

    private func select(_ id: UUID, kind: String?, allocations: [Int], slack: Int,
                        available: () -> Double?, phase: String) throws -> Int {
        try lock.withLock {
            let previous = entries[id] ?? [:]
            let others = entries.reduce(0) { sum, entry in
                entry.key == id ? sum : ContextBytes.sum(sum, entry.value.values.reduce(0) { ContextBytes.sum($0, $1) })
            }
            guard let gb = available(), gb.isFinite, gb >= 0, gb < Double(Int.max) / 1e9 else {
                throw RequestFailure(.insufficientMemory, "reclaimable memory is unreadable during \(phase)")
            }
            let observed = Int(gb * 1e9)
            var required = Int.max
            for (index, bytes) in allocations.enumerated() {
                var own = previous
                if let kind { own[kind] = kind == "dispatch" ? bytes : max(own[kind] ?? 0, bytes) }
                let proposed = kind == nil ? 0 : own.values.reduce(0) { ContextBytes.sum($0, $1) }
                required = ContextBytes.sum(others, proposed, slack)
                if required < Int.max, observed >= required {
                    if kind != nil { entries[id] = own }
                    return index
                }
            }
            var failure = RequestFailure(.insufficientMemory,
                "insufficient memory for \(phase), queued requests and safety headroom; retry after other requests finish")
            failure.requiredBytes = required; failure.availableBytes = observed
            throw failure
        }
    }

}

/// One accepted request owns one monotonic clock, including all queue and
/// preparation work. Neither transport activity nor prefix reuse restarts it.
/// Injectable observations exercise refusal without stressing the machine.
public final class RequestController: @unchecked Sendable {
    public let configuration: ContextConfiguration
    public let slackBytes: Int
    private let clock: () -> UInt64
    private let available: () -> Double?
    private let connected: () -> Bool
    private let pressure: () -> Bool
    private let started: UInt64
    private let lock = NSLock()
    private var failureValue: RequestFailure?
    private var firstToken = false
    private var estimateValue: Double?
    private let reservationID = UUID()
    private var reservations: RequestMemoryReservations?
    public var estimatedPrefillSeconds: Double? { lock.withLock { estimateValue } }

    public init(configuration: ContextConfiguration, slackBytes: Int,
                clock: @escaping () -> UInt64 = { DispatchTime.now().uptimeNanoseconds },
                availableGB: @escaping () -> Double? = { Planner.deviceAvailableGB() },
                connected: @escaping () -> Bool = { true }, pressure: @escaping () -> Bool = { false }) {
        self.configuration = configuration
        self.slackBytes = max(0, slackBytes)
        self.clock = clock; self.available = availableGB; self.connected = connected; self.pressure = pressure
        started = clock()
    }
    deinit { reservations?.release(reservationID) }
    package func attachReservations(_ pool: RequestMemoryReservations) throws {
        try lock.withLock {
            if let reservations, reservations !== pool {
                throw RequestFailure(.invalidConfiguration, "a request cannot move between engine memory budgets")
            }
            reservations = pool
        }
    }
    package func releaseDispatchReservation() {
        lock.withLock { reservations?.releaseDispatch(reservationID) }
    }
    public var elapsedSeconds: Double {
        let now = clock()
        return Double(now >= started ? now - started : 0) / 1e9
    }
    public var failure: RequestFailure? { lock.withLock { failureValue } }
    public var mayRetainState: Bool { failure == nil }
    @discardableResult public func fail(_ error: RequestFailure) -> RequestFailure {
        lock.withLock {
            if failureValue == nil { failureValue = error }
            return failureValue!
        }
    }
    public func cancel() { fail(RequestFailure(.clientCancelled, "the client cancelled this request")) }
    public func sampledFirstToken() { lock.withLock { firstToken = true } }

    /// Check before an allocation, not after it. Only actually reusable bytes
    /// can be subtracted by callers; future reservations never authorize growth.
    public func check(nextAllocationBytes: Int = 0, phase: String = "inference") throws {
        if let failure { throw failure }
        guard nextAllocationBytes >= 0 else {
            throw fail(RequestFailure(.invalidConfiguration, "allocation byte count must be nonnegative"))
        }
        if !connected() { throw fail(RequestFailure(.clientCancelled, "the client disconnected during \(phase)")) }
        let elapsed = elapsedSeconds
        let seconds = configuration.maxPrefillWaitMinutes * 60
        if seconds > 0, !lock.withLock({ firstToken }), elapsed >= seconds {
            var error = RequestFailure(.prefillDeadlineExceeded,
                "request-to-first-token deadline exceeded during \(phase); send less context or raise --max-prefill-wait")
            error.elapsedSeconds = elapsed; error.limitSeconds = seconds
            throw fail(error)
        }
        if pressure() {
            throw fail(RequestFailure(.insufficientMemory, "memory pressure interrupted \(phase); retry after memory becomes available"))
        }
        if let pool = lock.withLock({ reservations }) {
            do {
                try pool.check(reservationID, kind: nextAllocationBytes > 0 ? "dispatch" : nil,
                    bytes: nextAllocationBytes, slack: slackBytes, available: available, phase: phase)
            } catch let error as RequestFailure { throw fail(error) }
            return
        }
        let (required, overflow) = max(0, nextAllocationBytes).addingReportingOverflow(slackBytes)
        guard !overflow else { throw fail(RequestFailure(.insufficientMemory, "allocation size exceeds the supported memory range")) }
        let reading = available()
        if let gb = reading, gb.isFinite, gb >= 0, gb < Double(Int.max) / 1e9 {
            let bytes = Int(gb * 1e9)
            if bytes < required {
                var error = RequestFailure(.insufficientMemory,
                    "insufficient reclaimable memory for \(phase) and safety headroom; close other apps or lower the memory/context target")
                error.requiredBytes = required; error.availableBytes = bytes
                throw fail(error)
            }
        } else if configuration.maxContextTokens > ContextPolicy.defaultTokens && nextAllocationBytes > 0 {
            throw fail(RequestFailure(.insufficientMemory,
                "reclaimable memory is unreadable; refusing additional long-context allocation during \(phase)"))
        }
    }

    /// Price both execution paths before dispatch. Prefer the read-sharing
    /// workspace when it fits, otherwise keep the ordinary chronological
    /// path. Only failure of the fallback becomes a sticky request failure.
    /// Unknown standalone observations retain the existing fallback policy;
    /// they never authorize the larger optional workspace.
    package func chooseAllocation(preferredBytes: Int, fallbackBytes: Int,
                                  phase: String) throws -> Bool {
        try chooseAllocation(alternativeBytes: [preferredBytes], fallbackBytes: fallbackBytes,
            phase: phase) != nil
    }

    /// Price alternatives in caller preference order under the same atomic
    /// ownership transaction. Rejected larger groups reserve no bytes and
    /// cannot make failure sticky while a smaller group or fallback fits.
    package func chooseAllocation(alternativeBytes: [Int], fallbackBytes: Int,
                                  phase: String) throws -> Int? {
        if let failure { throw failure }
        guard fallbackBytes >= 0, alternativeBytes.allSatisfy({ $0 >= fallbackBytes }) else {
            throw fail(RequestFailure(.invalidConfiguration,
                "preferred and fallback allocations must be nonnegative and ordered"))
        }
        if alternativeBytes.isEmpty {
            try check(nextAllocationBytes: fallbackBytes, phase: phase)
            return nil
        }
        // Preserve cancellation, deadlines, pressure and queued ownership.
        try check(phase: phase)
        if let pool = lock.withLock({ reservations }) {
            do {
                return try pool.chooseDispatch(reservationID, alternativeBytes: alternativeBytes,
                    fallbackBytes: fallbackBytes, slack: slackBytes, available: available, phase: phase)
            } catch let error as RequestFailure { throw fail(error) }
        }
        let requirements = alternativeBytes.map { ContextBytes.sum($0, slackBytes) }
        if requirements.contains(where: { $0 < Int.max }),
           let gb = available(), gb.isFinite, gb >= 0, gb < Double(Int.max) / 1e9 {
            let observed = Int(gb * 1e9)
            if let selected = requirements.firstIndex(where: { $0 < Int.max && observed >= $0 }) {
                return selected
            }
        }
        try check(nextAllocationBytes: fallbackBytes, phase: phase)
        return nil
    }

    /// Conservative temporary-copy allowance for templating/tokenization.
    /// Counting input must not itself serialize an arbitrarily large value.
    public func checkInputBytes(_ bytes: Int) throws {
        guard bytes >= 0 else { throw fail(RequestFailure(.invalidConfiguration, "invalid input byte count")) }
        try reservePreparation(kind: "input", bytes: ContextBytes.product(bytes, 16), phase: "prompt tokenization")
    }

    package func reservePreparedImageBytes(_ bytes: Int) throws {
        try reservePreparation(kind: "pixels", bytes: bytes, phase: "retained image preparation")
    }
    private func reservePreparation(kind: String, bytes: Int, phase: String) throws {
        guard bytes >= 0 else { throw fail(RequestFailure(.invalidConfiguration, "invalid preparation byte count")) }
        try check(phase: phase)
        if let pool = lock.withLock({ reservations }) {
            do { try pool.check(reservationID, kind: kind, bytes: bytes, slack: slackBytes, available: available, phase: phase) }
            catch let error as RequestFailure { throw fail(error) }
        } else { try check(nextAllocationBytes: bytes, phase: phase) }
    }

    public func admit(missingTokens: Int, from position: Int, maxChunk: Int,
                      tailAware: Bool = false) throws {
        try check(phase: "admission")
        let estimate = PrefillSchedule.estimateSeconds(tokens: missingTokens, from: position,
            maxChunk: maxChunk, tailAware: tailAware)
        lock.withLock { estimateValue = estimate }
        let limit = configuration.maxPrefillWaitMinutes * 60
        if limit > 0, let estimate, elapsedSeconds + estimate > limit {
            var error = RequestFailure(.prefillWaitExceeded,
                "estimated missing-context prefill exceeds the remaining wait budget; send less, reuse a valid prefix, or raise --max-prefill-wait")
            error.elapsedSeconds = elapsedSeconds; error.limitSeconds = limit; error.estimatedSeconds = estimate
            throw fail(error)
        }
    }
}
