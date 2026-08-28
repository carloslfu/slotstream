// Memory planning: turn "how much of this Mac may I use" into slot counts.
//
// One policy, used by the CLI (run/serve/doctor), printed at startup, and
// exposed over /api/show — so what the process *does* and what it *says* can
// never drift apart.

import Foundation
import MLX

/// Model geometry the cache math speaks in. Validated against config.json at
/// engine init; the planner needs it before the checkpoint is opened.
public enum Geometry {
    public static let layers = 48
    public static let expertsPerLayer = 512
    public static let recordBytes = 2_764_800.0
    public static let totalRecords = layers * expertsPerLayer
    /// Prefill can pin up to one full layer of experts (256-token chunk × top-10
    /// covers ~all 512) plus an in-flight miss batch; below this the eviction
    /// scan has no victim. 640 global ≈ 13/layer equivalent.
    public static let floorSlots = 640

    public static func gb(_ globalSlots: Int) -> Double { Double(globalSlots) * recordBytes / 1e9 }
    public static func perLayer(_ globalSlots: Int) -> Double { Double(globalSlots) / Double(layers) }
    /// GB of pool per expert-per-layer (N experts/layer costs N × this).
    public static var gbPerExpertPerLayer: Double { Double(layers) * recordBytes / 1e9 }
}

public struct PlanError: Error, CustomStringConvertible {
    public let description: String
    init(_ s: String) { description = s }
}

/// The resolved memory decision: which knob decided it, what it costs, and
/// what to expect. Everything user-facing about memory comes from here.
public struct MemoryPlan {
    public enum Source: String {
        case expertsPerLayer = "--experts-per-layer"
        case poolGB = "--pool-gb"
        case memoryGB = "--memory-gb"
        case auto = "auto"
    }

    public let source: Source
    public let slots: Int
    /// Total-process target in GB when the plan came from --memory-gb or auto.
    public let targetGB: Double?
    public let ramGB: Double
    public let workingSetGB: Double
    public let notes: [String]

    public var expertsPerLayerCached: Double { Geometry.perLayer(slots) }
    public var poolGB: Double { Geometry.gb(slots) }
    public var expectedPeakGB: Double { poolGB + Planner.fixedFootprintGB }
    public var estWarmTokS: Double { Planner.estWarmTokS(expertsPerLayer: expertsPerLayerCached) }
    public var fullyResident: Bool { slots >= Geometry.totalRecords }

    /// The startup announce: device, decision, expectation, override hint.
    public func banner() -> String {
        var l: [String] = []
        l.append("slotstream memory plan (\(source.rawValue))")
        l.append(String(
            format: "  device: %.0f GB RAM, %.1f GB Metal working set", ramGB, workingSetGB))
        if let t = targetGB {
            let hint = source == .auto
                ? "   (override: --memory-gb N | --experts-per-layer N)"
                : ""
            l.append(String(format: "  target: %.1f GB total for this process%@", t, hint))
        }
        if fullyResident {
            l.append(String(
                format: "  cache:  all %d experts per layer resident (%.1f GB pool)",
                Geometry.expertsPerLayer, poolGB))
        } else {
            l.append(String(
                format: "  cache:  ~%.0f of %d experts per layer  (%d global slots = %.1f GB pool)",
                expertsPerLayerCached, Geometry.expertsPerLayer, slots, poolGB))
        }
        l.append(String(
            format: "  expect: ~%.1f GB peak, ~%.0f tok/s warm decode (est. from M5 Pro anchors)",
            expectedPeakGB, estWarmTokS))
        for n in notes { l.append("  note:   \(n)") }
        return l.joined(separator: "\n")
    }

    /// Machine-readable form for /api/show.
    public func json() -> [String: Any] {
        var d: [String: Any] = [
            "source": source.rawValue,
            "experts_per_layer_cached": Int(expertsPerLayerCached.rounded()),
            "pool_slots": slots,
            "pool_gb": (poolGB * 10).rounded() / 10,
            "expected_peak_gb": (expectedPeakGB * 10).rounded() / 10,
            "device_ram_gb": (ramGB * 10).rounded() / 10,
            "device_working_set_gb": (workingSetGB * 10).rounded() / 10,
            "fully_resident": fullyResident,
        ]
        if let t = targetGB { d["target_gb"] = (t * 10).rounded() / 10 }
        if !notes.isEmpty { d["notes"] = notes }
        return d
    }
}

public enum Planner {
    /// Non-pool footprint, measured: resident weights 3.82 GB + n-gram row
    /// cache ≤0.13 GB + activations. Measured whole-run peaks came in at
    /// pool + ~3.3; we model 3.9 so predictions err high, never low.
    public static let fixedFootprintGB = 3.9
    /// Extra slack when deriving a pool from a total-memory target, so the
    /// promise ("stays under G") survives transients.
    public static let planningMarginGB = 0.5
    /// Smallest honest total-memory target: floor pool + footprint + margin.
    public static var minMemoryGB: Double {
        ((Geometry.gb(Geometry.floorSlots) + fixedFootprintGB + planningMarginGB) * 10)
            .rounded(.up) / 10
    }

    public static func deviceRAMGB() -> Double {
        Double(ProcessInfo.processInfo.physicalMemory) / 1e9
    }

    public static func deviceWorkingSetGB() -> Double {
        let ws = Double(MLX.GPU.deviceInfo().maxRecommendedWorkingSetSize) / 1e9
        return ws > 0 ? ws : deviceRAMGB() * 0.75
    }

    /// Auto policy: leave 30% of RAM to the OS and the user's other apps, and
    /// stay 2 GB under the Metal recommended working set — whichever binds.
    public static func autoTargetGB(ramGB: Double, workingSetGB: Double) -> Double {
        min(0.70 * ramGB, workingSetGB - 2.0)
    }

    /// Warm-decode estimate from the measured M5 Pro anchors
    /// (30/layer → 5.6 tok/s, 181/layer → 20.0; ≥181 is kernel-launch-bound,
    /// so the curve flattens). Log-linear between anchors. Other machines'
    /// SSD/GPU shift this; it is a shape, not a promise.
    public static func estWarmTokS(expertsPerLayer e: Double) -> Double {
        let (e0, r0) = (30.0, 5.6)
        let (e1, r1) = (181.0, 20.0)
        if e >= e1 { return r1 }
        let t = log(max(e, 1) / e0) / log(e1 / e0)
        return r0 * pow(r1 / r0, t)
    }

    public static func slotsForTarget(_ targetGB: Double) -> Int {
        let pool = targetGB - fixedFootprintGB - planningMarginGB
        return min(
            Geometry.totalRecords,
            max(Geometry.floorSlots, Int(pool * 1e9 / Geometry.recordBytes)))
    }

    /// Resolve the knobs. Precedence: --experts-per-layer > --pool-gb >
    /// --memory-gb > auto. Losing knobs are noted, never silently dropped.
    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil
    ) throws -> MemoryPlan {
        let ram = ramGB ?? deviceRAMGB()
        let ws = workingSetGB ?? deviceWorkingSetGB()
        var notes: [String] = []

        func finish(_ source: MemoryPlan.Source, _ slots: Int, target: Double?) -> MemoryPlan {
            let capped = min(slots, Geometry.totalRecords)
            let floored = max(capped, Geometry.floorSlots)
            if floored > capped {
                notes.append(String(
                    format: "raised to the floor of %d slots (~14/layer): below it a prefill chunk can pin every slot",
                    Geometry.floorSlots))
            }
            let peak = Geometry.gb(floored) + fixedFootprintGB
            if peak > ws, source != .memoryGB {  // memoryGB branch words its own note
                notes.append(String(
                    format: "expected peak %.1f GB exceeds the %.1f GB Metal working set — expect paging; close other apps or lower the knob",
                    peak, ws))
            }
            return MemoryPlan(
                source: source, slots: floored, targetGB: target,
                ramGB: ram, workingSetGB: ws, notes: notes)
        }

        if let n = expertsPerLayer {
            guard n >= 1 else { throw PlanError("--experts-per-layer must be ≥ 1") }
            if poolGB != nil { notes.append("--pool-gb ignored (--experts-per-layer takes precedence)") }
            if memoryGB != nil { notes.append("--memory-gb ignored (--experts-per-layer takes precedence)") }
            return finish(.expertsPerLayer, min(n, Geometry.expertsPerLayer) * Geometry.layers, target: nil)
        }
        if let g = poolGB {
            guard g > 0 else { throw PlanError("--pool-gb must be > 0") }
            if memoryGB != nil { notes.append("--memory-gb ignored (--pool-gb takes precedence)") }
            return finish(.poolGB, Int(g * 1e9 / Geometry.recordBytes), target: nil)
        }
        if let m = memoryGB {
            guard m >= minMemoryGB else {
                throw PlanError(String(
                    format: "--memory-gb %.1f is below the minimum %.1f GB (floor cache of ~14 experts/layer = %.1f GB pool, plus the %.1f GB fixed footprint of resident weights + n-gram cache, plus %.1f GB margin)",
                    m, minMemoryGB, Geometry.gb(Geometry.floorSlots), fixedFootprintGB,
                    planningMarginGB))
            }
            if m > ws {
                notes.append(String(
                    format: "target %.1f GB exceeds the %.1f GB Metal working set; the OS may page — auto would pick %.1f GB here",
                    m, ws, max(minMemoryGB, autoTargetGB(ramGB: ram, workingSetGB: ws))))
            }
            return finish(.memoryGB, slotsForTarget(m), target: m)
        }

        // auto: the default
        let raw = autoTargetGB(ramGB: ram, workingSetGB: ws)
        let target = max(minMemoryGB, raw)
        if raw < minMemoryGB {
            notes.append(String(
                format: "this machine (%.0f GB RAM) is below the comfortable minimum — running at the %.1f GB floor; expect slow decode and close other apps",
                ram, minMemoryGB))
        }
        return finish(.auto, slotsForTarget(target), target: target)
    }
}
