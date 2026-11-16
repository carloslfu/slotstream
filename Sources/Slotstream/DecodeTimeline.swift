// Where a decode pass's time goes, in order.
//
// The stats split decode into totals, and a stack sampler at 10 ms cannot
// resolve a layer that takes about 8 ms. Neither shows whether the GPU sat idle
// while a read was outstanding, or whether a read could have started earlier,
// because both questions depend on the order of events inside one layer.
//
// `SLOTSTREAM_DECODE_TIMELINE=<path>` records one span per step of the layer
// loop and writes JSON lines at the end of a `run`: `span`, `layer`, `count`,
// `start_ns`, `end_ns`, all on the `RuntimeClock` timebase. `count` is the
// step's size: tokens for a verify pass, the barrier period for a barrier,
// routed ids for a routing wait, misses for an ensure, records for a demand
// read, tickets for a join and pieces for a prefetch read.
//
// A routing wait is the time until a layer's routes come back from the GPU.
// Evaluation is lazy, so it includes whatever earlier work was still queued,
// such as the previous layer's experts. It is not the router's own cost.
//
// The buffer is allocated once, so a recording never allocates inside a layer.
// Off unless the variable is set, and then each site costs one static Bool.

import Foundation

package enum DecodeTimeline {
    package enum Span: String, CaseIterable {
        case verifyPass = "verify-pass"
        case layer
        case routingWait = "routing-wait"
        case ensure
        case demandRead = "demand-read"
        case ticketJoin = "ticket-join"
        case barrier
        case prefetchRead = "prefetch-read"
    }

    package struct Event {
        package let span: Span
        package let layer: Int32
        package let count: Int32
        package let startNanos: UInt64
        package let endNanos: UInt64

        package init(span: Span, layer: Int32, count: Int32, startNanos: UInt64, endNanos: UInt64) {
            self.span = span; self.layer = layer; self.count = count
            self.startNanos = startNanos; self.endNanos = endNanos
        }

        package var jsonLine: String {
            "{\"span\":\"\(span.rawValue)\",\"layer\":\(layer),\"count\":\(count),"
                + "\"start_ns\":\(startNanos),\"end_ns\":\(endNanos)}\n"
        }
    }

    package static let path: String? =
        ProcessInfo.processInfo.environment["SLOTSTREAM_DECODE_TIMELINE"]
    package static let on: Bool = path != nil

    /// About 64 MB at most, committed only as it is filled. A 256-token decode
    /// with every piece prefetched stays near 1.2 million events.
    private static let capacity = 1 << 21
    private static let lock = NSLock()
    private static let events = UnsafeMutablePointer<Event>.allocate(capacity: capacity)
    private static var used = 0
    private static var dropped = 0

    /// Close a span that began at `start`. Prefetch workers call this concurrently.
    package static func record(_ span: Span, layer: Int, count: Int, start: UInt64) {
        guard on else { return }
        let end = RuntimeClock.now()
        lock.lock()
        defer { lock.unlock() }
        guard used < capacity else { dropped += 1; return }
        (events + used).initialize(to: Event(span: span, layer: Int32(truncatingIfNeeded: layer),
                                             count: Int32(truncatingIfNeeded: count),
                                             startNanos: start, endNanos: end))
        used += 1
    }

    /// Write the timeline out and report it. Called once, at the end of a generation.
    @discardableResult
    package static func flush() -> String? {
        guard on, let path else { return nil }
        lock.lock()
        defer { lock.unlock() }
        guard used > 0 else { return nil }
        do {
            try write(UnsafeBufferPointer(start: events, count: used), to: path)
        } catch {
            return "decode timeline: could not write \(path): \(error)"
        }
        let line = "decode timeline: \(used) spans, \(dropped) dropped -> \(path)"
        used = 0
        dropped = 0
        return line
    }

    /// Events per block written to the file, about 0.8 MB of text.
    package static let writeBlockEvents = 8192

    /// Write `events` to `path` as JSON lines, one block at a time, so the text
    /// of a full buffer (about 200 MB) is never held in memory at once.
    package static func write(_ events: UnsafeBufferPointer<Event>, to path: String) throws {
        guard FileManager.default.createFile(atPath: path, contents: nil),
              let file = FileHandle(forWritingAtPath: path) else {
            throw CocoaError(.fileWriteUnknown)
        }
        defer { try? file.close() }
        var block = ""
        block.reserveCapacity(writeBlockEvents * 104)
        var pending = 0
        for event in events {
            block += event.jsonLine
            pending += 1
            if pending == writeBlockEvents {
                try file.write(contentsOf: Data(block.utf8))
                block.removeAll(keepingCapacity: true)
                pending = 0
            }
        }
        if pending > 0 { try file.write(contentsOf: Data(block.utf8)) }
    }
}
