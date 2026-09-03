// Where a pass actually peaks.
//
// Two changes that should each have removed a few hundred MB from a prefill
// pass — bounding the attention score matrix, and not gathering the sweep's
// replicated rows up front — moved the measured peak by 0.00 GB, because both
// transients sit below the high-water mark rather than at it. Guessing which
// allocation is the maximum wasted both experiments, so this measures it.
//
// `SLOTSTREAM_MEM_TRACE=1` evaluates each phase of a layer as it finishes and
// records the high-water MLX active memory during it. **Forcing evaluation
// changes the profile it is measuring**: an eval releases what a lazy graph
// would still be holding, and it serialises work the scheduler would overlap.
// So the phase numbers attribute a transient to a phase; they do not reproduce
// the untraced peak, and a run with this on is not a memory measurement. That
// is why it is a diagnostic behind an environment variable.

import Foundation
import MLX

public enum MemTrace {
    public static let on = ProcessInfo.processInfo.environment["SLOTSTREAM_MEM_TRACE"] == "1"

    private static let lock = NSLock()
    private static var layer = -1
    private static var kind = ""
    private static var peaks: [String: (peak: Int, layer: Int)] = [:]
    private static var order: [String] = []

    public static func enterLayer(_ l: Int, kind k: String) {
        guard on else { return }
        lock.lock()
        layer = l
        kind = k
        lock.unlock()
        MLX.Memory.peakMemory = 0
    }

    /// Evaluate this phase's output and record the high-water active memory
    /// reached while producing it.
    public static func mark(_ phase: String, _ out: MLXArray?) {
        guard on else { return }
        if let o = out { eval(o) }
        let peak = MLX.Memory.peakMemory
        MLX.Memory.peakMemory = 0
        lock.lock()
        defer { lock.unlock() }
        let key = "\(kind)/\(phase)"
        if peaks[key] == nil {
            order.append(key)
            peaks[key] = (peak, layer)
        } else if peak > peaks[key]!.peak {
            peaks[key] = (peak, layer)
        }
    }

    /// The phases, worst first. `active` is MLX's high-water during the phase,
    /// so it includes everything resident at the time (pool, trunk, caches),
    /// not just what the phase allocated.
    public static func report() -> String {
        guard on else { return "" }
        lock.lock()
        defer { lock.unlock() }
        var lines = ["mem trace: high-water MLX active memory during each phase (GB)"]
        for key in order.sorted(by: { (peaks[$0]?.peak ?? 0) > (peaks[$1]?.peak ?? 0) }) {
            guard let v = peaks[key] else { continue }
            let name = key.padding(toLength: 18, withPad: " ", startingAt: 0)
            lines.append(String(format: "  %@ %6.2f  (worst at layer %d)",
                                name, Double(v.peak) / 1e9, v.layer))
        }
        return lines.joined(separator: "\n")
    }
}
