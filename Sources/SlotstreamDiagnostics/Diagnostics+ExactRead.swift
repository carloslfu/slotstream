import Darwin
import Foundation
import Slotstream

extension Diagnostics {
    public static func optimizationExactRead() -> CheckReport {
        var c = CheckBuilder("optimization-exact-read")
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
}
