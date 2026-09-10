import Darwin
import Foundation

public enum CheckpointReadError: Error, CustomStringConvertible {
    case invalidRange, cancelled, unexpectedEOF(offset: Int), system(offset: Int, code: Int32)
    case invalidProgress
    public var description: String {
        switch self {
        case .invalidRange: return "checkpoint read range is outside its tensor or overflows"
        case .cancelled: return "checkpoint read cancelled before completion"
        case let .unexpectedEOF(offset): return "checkpoint ended before the requested bytes at offset \(offset)"
        case let .system(offset, code): return "checkpoint read at offset \(offset) failed: \(String(cString: strerror(code)))"
        case .invalidProgress: return "checkpoint reader returned more bytes than requested"
        }
    }
}

/// A bounded syscall seam. A completed transfer is the only publishable
/// outcome; callers must discard the partially written destination on error.
package enum ExactRead {
    package static func tensorOffset(base: Int, length: Int, offset: Int, count: Int) throws -> Int {
        guard base >= 0, length >= 0, offset >= 0, count >= 0,
            offset <= length, count <= length - offset,
            !base.addingReportingOverflow(offset).overflow else { throw CheckpointReadError.invalidRange }
        let absolute = base + offset
        guard !absolute.addingReportingOverflow(count).overflow else { throw CheckpointReadError.invalidRange }
        return absolute
    }
    package struct Outcome {
        package let count: Int
        package let error: Int32
        package init(count: Int, error: Int32 = 0) { self.count = count; self.error = error }
    }
    package static func transfer(into destination: UnsafeMutableRawPointer, offset: Int, count: Int,
        shouldContinue: () -> Bool = { true },
        read: (UnsafeMutableRawPointer, Int, Int) -> Outcome) throws {
        guard offset >= 0, count >= 0, !offset.addingReportingOverflow(count).overflow else {
            throw CheckpointReadError.invalidRange
        }
        var done = 0
        while done < count {
            guard shouldContinue() else { throw CheckpointReadError.cancelled }
            let next = read(destination + done, count - done, offset + done)
            if next.count < 0 {
                if next.error == EINTR { continue }
                throw CheckpointReadError.system(offset: offset + done, code: next.error)
            }
            guard next.count > 0 else { throw CheckpointReadError.unexpectedEOF(offset: offset + done) }
            guard next.count <= count - done else { throw CheckpointReadError.invalidProgress }
            done += next.count
        }
    }
}

/// concurrentPerform joins every worker before this result is inspected.
/// Successful jobs need no shared lock; errors are retained once and the
/// entire partially filled destination is discarded after the join.
package final class JoinedReadFailure {
    private let lock = NSLock()
    private var first: Error?
    package func record(_ error: Error) {
        lock.lock(); defer { lock.unlock() }
        if first == nil { first = error }
    }
    package func finish() throws {
        lock.lock(); defer { lock.unlock() }
        if let first { throw first }
    }
}

/// One-shot bounded diagnostic seam. It never modifies checkpoint files.
/// Install/remove only between reads; claims can arrive on several I/O lanes.
package final class ReadFault {
    private let lock = NSLock()
    private var remaining: Int
    private let error: CheckpointReadError
    package init(afterJobs: Int, error: CheckpointReadError = .system(offset: 0, code: EIO)) {
        precondition(afterJobs >= 0)
        remaining = afterJobs; self.error = error
    }
    package func beforeRead() throws {
        lock.lock(); defer { lock.unlock() }
        if remaining == 0 { remaining = -1; throw error }
        if remaining > 0 { remaining -= 1 }
    }
    package var hasFired: Bool {
        lock.lock(); defer { lock.unlock() }
        return remaining < 0
    }
}
