// Router traces, so the cache simulator can finally be fed real data.
//
// M1 — the expert-locality study — has been open since the beginning: the
// simulator (`Tools/cachesim.py`) and the collector for the Python reference
// (`Tools/trace_routers.py`) were both built in 2026-08, but no trace was ever
// taken from a bounded forward pass, because at the time no bounded forward
// pass existed. It does now, and the decode split says 44% of decode time at a
// small cache is reading expert records, so which records the cache keeps is
// the question that decides that number.
//
// `SLOTSTREAM_ROUTER_TRACE=<path>` records every routing decision the model
// makes and writes it on exit. The format is a flat stream a reader
// reassembles: per MoE call, `layer`, `tokens`, `topK` as little-endian int32,
// then `tokens * topK` int16 expert ids. Layers are visited in order within a
// pass, so a reader groups by pass without needing a pass id.
//
// The trace is off unless the variable is set, and reading it costs one static
// Bool per MoE call.

import Foundation

public enum RouterTrace {
    public static let path: String? =
        ProcessInfo.processInfo.environment["SLOTSTREAM_ROUTER_TRACE"]
    public static let on: Bool = path != nil

    private static let lock = NSLock()
    private static var buffer = Data()
    private static var calls = 0
    private static var uses = 0

    public static func record(layer: Int, tokens: Int, topK: Int, ids: [Int32]) {
        guard on else { return }
        lock.lock()
        defer { lock.unlock() }
        var header = [Int32(layer), Int32(tokens), Int32(topK)]
        header.withUnsafeBytes { buffer.append(contentsOf: $0) }
        var small = [Int16](repeating: 0, count: ids.count)
        for (i, v) in ids.enumerated() { small[i] = Int16(truncatingIfNeeded: v) }
        small.withUnsafeBytes { buffer.append(contentsOf: $0) }
        calls += 1
        uses += ids.count
    }

    /// Write the trace out. Called once, at the end of a generation.
    @discardableResult
    public static func flush() -> String? {
        guard on, let path else { return nil }
        lock.lock()
        defer { lock.unlock() }
        guard !buffer.isEmpty else { return nil }
        try? buffer.write(to: URL(fileURLWithPath: path))
        let line = "router trace: \(calls) MoE calls, \(uses) expert-uses -> \(path)"
        buffer = Data()
        calls = 0
        uses = 0
        return line
    }
}
