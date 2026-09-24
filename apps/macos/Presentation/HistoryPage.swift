import Foundation

/// A viewport contains bounded messages and source bytes. A single oversized
/// message is retained intact in source form; it is never silently truncated.
public enum HistoryPage {
    /// Default page bounds.
    public static let messages = 80, bytes = 524288
    public static func nextEnd(byteCounts: [Int], startingAt: Int, messageLimit: Int = 80, byteLimit: Int = 524288) -> Int {
        let start = min(byteCounts.count, max(0, startingAt)); var end = start, bytes = 0
        while end < byteCounts.count && end - start < messageLimit {
            let next = max(0, byteCounts[end])
            if end > start && next > byteLimit - min(bytes, byteLimit) { break }
            bytes += next; end += 1
        }
        return end
    }
    public static func range(byteCounts: [Int], endingAt: Int?, messageLimit: Int = 80, byteLimit: Int = 524288) -> Range<Int> {
        let end = min(byteCounts.count, max(0, endingAt ?? byteCounts.count))
        var start = end, bytes = 0
        while start > 0 && end - start < messageLimit {
            let next = max(0, byteCounts[start - 1])
            if start < end && next > byteLimit - min(bytes, byteLimit) { break }
            bytes += next; start -= 1
        }
        return start..<end
    }
}

/// Keeps the latest page's first message in place while new messages arrive,
/// so a new message is added to the page instead of shifting its start by one,
/// which lays out every message again and moves a reader who scrolled up.
/// The page moves on once it holds half again its usual bounds, or twice
/// them while the reader is away from the latest message.
public final class LatestPage {
    private var threadID = ""
    private var startID: String?
    public init() {}
    public func reset() { startID = nil }
    public func range(ids: [String], byteCounts: [Int], threadID thread: String, readingEarlier: Bool = false) -> Range<Int> {
        let standard = HistoryPage.range(byteCounts: byteCounts, endingAt: nil)
        let factor = readingEarlier ? 2 : 1.5
        if thread == threadID, let startID, let start = ids.firstIndex(of: startID), start <= standard.lowerBound,
           Double(ids.count - start) <= Double(HistoryPage.messages) * factor,
           Double(byteCounts[start...].reduce(0, +)) <= Double(HistoryPage.bytes) * factor {
            return start..<ids.count
        }
        threadID = thread
        startID = standard.isEmpty ? nil : ids[standard.lowerBound]
        return standard
    }
}
