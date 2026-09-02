// The check catalogue: one body per check, three ways to run it.
//
// `slotstream-checks` runs this on a Command Line Tools machine, the CLI's
// subcommands call the same `Diagnostics` functions, and CI runs the runner so
// every check is reported by name. There is no XCTest or Swift Testing target:
// this toolchain ships neither, and a test target that cannot be compiled
// locally would be code nobody here can run. See docs/TESTING.md.

import Foundation
import SlotstreamDiagnostics

/// What a check needs from the machine. The runner refuses to run a tier the
/// machine cannot honour, rather than letting it fail confusingly.
public enum Tier: String, Sendable, Codable, CaseIterable, Comparable {
    /// Pure Swift: no MLX, no GPU, no files, no weights.
    case t0
    /// MLX kernels on random tensors. No weights. Needs the metallib.
    case t1
    /// Needs the pinned tokenizer fixture on disk.
    case t2
    /// Needs a synthetic checkpoint.
    case t3
    /// Needs the real 105 GB weights. Dev Mac only, never CI.
    case t4

    public static func < (a: Tier, b: Tier) -> Bool {
        let order = Tier.allCases
        return order.firstIndex(of: a)! < order.firstIndex(of: b)!
    }

    /// Tiers above T0 touch MLX and allocate GPU memory, so the runner never
    /// runs them concurrently: the per-user process guard deliberately permits
    /// several model objects inside one process, so nothing below this stops
    /// two checks stacking allocations on a shared machine.
    public var requiresSerialExecution: Bool { self != .t0 }
}

public struct Check: Sendable {
    public let name: String
    public let tier: Tier
    public let body: @Sendable () throws -> CheckReport

    public init(_ name: String, tier: Tier, body: @escaping @Sendable () throws -> CheckReport) {
        self.name = name
        self.tier = tier
        self.body = body
    }
}

public enum Catalogue {
    /// Every check, in the order the runner reports them.
    public static var all: [Check] {
        t0Checks
    }

    public static func matching(tiers: Set<Tier>, filter: String?) -> [Check] {
        all.filter { check in
            guard tiers.contains(check.tier) else { return false }
            guard let filter, !filter.isEmpty else { return true }
            return check.name.localizedCaseInsensitiveContains(filter)
        }
    }
}
