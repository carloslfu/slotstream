// Elastic pool governor: resizes the expert cache while the server runs.
//
// The pool is a cache, and the machine's memory state changes over a daemon's
// lifetime — a startup-time size can't be right forever. The governor listens
// to macOS memory-pressure events (the OS pushes warning/critical — a better
// signal than any polling) plus a slow availability poll, and resizes the pool
// strictly between requests under the engine's generation lock.
//
// Policy: shrink fast, grow slow. Two complementary signals:
//   - availability (poll, 15 s): the feasibility replan — "what would a fresh
//     auto start pick right now", crediting everything a restart would release
//     (pool + fixed footprint). Converges in ONE step; dead-bands are absolute
//     GB (shrink at −1 GB, grow at +2 GB) because a relative trigger can never
//     fire when the honest adjustment is a few GB on a large pool. Handles
//     apps opening/closing gently. Note availability alone cannot see
//     overcommit that macOS already absorbed into compressor/swap.
//   - OS pressure events (warning/critical): the OS's own compressor/swap
//     view. Shed an absolute chunk immediately (warning: ≥2 GB / 15%,
//     critical: ≥4 GB / 50%); repeated events keep shedding. Growth waits for
//     60 s of calm after any event.
//   - elastic applies to auto-sized pools only: an explicit knob is the user's
//     stated intent and is never resized (same principle as the startup clamp).
//
// Correctness is untouched by construction: the golden-equivalence gate proves
// output is byte-identical at any pool size, and `slotstream elastic-check`
// re-proves it across live grow/shrink in one process.

import Foundation

/// The resize decision, split out from the daemon that applies it.
///
/// Keeping it a pure function of (current size, availability, recent history)
/// is what makes the policy testable: `slotstream governor-check` drives every
/// branch — shrink, grow, dead-bands, cooldowns, both pressure levels, the
/// floor and the cap — deterministically, with no model loaded and without
/// putting the machine under real memory pressure to observe it.
public enum GovernorPolicy {
    public enum Pressure: String { case warning, critical }

    public struct Inputs {
        public var currentSlots: Int
        public var availableGB: Double
        public var ramGB: Double
        public var workingSetGB: Double
        /// nil = no such event yet in this process.
        public var secondsSincePressure: Double?
        public var secondsSinceResize: Double?
        /// Set when this tick is an OS pressure event rather than a poll.
        public var pressure: Pressure?

        public init(
            currentSlots: Int, availableGB: Double, ramGB: Double, workingSetGB: Double,
            secondsSincePressure: Double? = nil, secondsSinceResize: Double? = nil,
            pressure: Pressure? = nil
        ) {
            self.currentSlots = currentSlots
            self.availableGB = availableGB
            self.ramGB = ramGB
            self.workingSetGB = workingSetGB
            self.secondsSincePressure = secondsSincePressure
            self.secondsSinceResize = secondsSinceResize
            self.pressure = pressure
        }
    }

    public enum Decision: Equatable {
        case hold
        case resize(slots: Int, reason: String)
    }

    static let growCooldown: TimeInterval = 60
    static let shrinkDeadbandGB = 1.0
    static let growDeadbandGB = 2.0

    private static func settle(_ target: Int, _ current: Int, _ reason: String) -> Decision {
        let t = max(Geometry.floorSlots, min(target, Geometry.totalRecords))
        return t == current ? .hold : .resize(slots: t, reason: reason)
    }

    /// What auto would choose if slotstream restarted right now: reclaimable
    /// memory credited with everything we hold that a restart would release —
    /// the pool AND the fixed footprint (the planner subtracts the fixed
    /// footprint again when deriving slots, so without this credit the steady
    /// state under contention double-reserves ~4 GB).
    public static func desiredSlots(_ i: Inputs) -> Int? {
        let credited = i.availableGB + Geometry.gb(i.currentSlots) + Planner.fixedFootprintGB
        return try? Planner.plan(
            expertsPerLayer: nil, poolGB: nil, memoryGB: nil,
            ramGB: i.ramGB, workingSetGB: i.workingSetGB, availableGB: credited).slots
    }

    public static func decide(_ i: Inputs) -> Decision {
        let curGB = Geometry.gb(i.currentSlots)
        let desired = desiredSlots(i)
        // OS pressure events see what availability math cannot: compressor and
        // swap strain from system-wide overcommit. Shed an absolute chunk —
        // repeated events keep shedding until the pressure stops.
        if let p = i.pressure {
            let shedGB = p == .critical ? max(4.0, curGB * 0.5) : max(2.0, curGB * 0.15)
            var target = Int((curGB - shedGB) * 1e9 / Geometry.recordBytes)
            if let d = desired { target = min(target, d) }
            return settle(target, i.currentSlots, "memory pressure (\(p.rawValue))")
        }
        guard let d = desired else { return .hold }
        let desiredGB = Geometry.gb(d)
        if desiredGB <= curGB - shrinkDeadbandGB {
            return settle(d, i.currentSlots, "availability dropped")
        }
        if desiredGB >= curGB + growDeadbandGB {
            let calm = i.secondsSincePressure.map { $0 > growCooldown } ?? true
            let cooled = i.secondsSinceResize.map { $0 > growCooldown } ?? true
            if calm, cooled { return settle(d, i.currentSlots, "memory freed") }
        }
        return .hold
    }
}

public final class MemoryGovernor {
    private let engine: Engine
    private let queue = DispatchQueue(label: "slotstream.governor")
    private var pressure: DispatchSourceMemoryPressure?
    private var timer: DispatchSourceTimer?
    private var lastPressureAt: Date? = nil
    private var lastResizeAt: Date? = nil

    // policy constants — dead-bands are absolute GB, not relative: the
    // feasibility replan converges in one step, and a relative trigger can
    // never fire when the honest adjustment is a few GB on a large pool.
    static let pollInterval: TimeInterval = 15
    static let growCooldown: TimeInterval = 60
    static let shrinkDeadbandGB = 1.0  // shed when desired ≤ current − 1 GB
    static let growDeadbandGB = 2.0    // grow when desired ≥ current + 2 GB

    public init(engine: Engine) {
        self.engine = engine
    }

    public func start() {
        // Startup sizing counts as the first resize: launch-time availability
        // can undercount for a minute (page reclaim lag from a predecessor
        // process), and growing on that transient reading causes churn.
        lastResizeAt = Date()
        let p = DispatchSource.makeMemoryPressureSource(eventMask: [.warning, .critical], queue: queue)
        p.setEventHandler { [weak self] in
            guard let self, let src = self.pressure else { return }
            self.onPressure(critical: src.data.contains(.critical))
        }
        p.resume()
        pressure = p
        let t = DispatchSource.makeTimerSource(queue: queue)
        t.schedule(deadline: .now() + Self.pollInterval, repeating: Self.pollInterval)
        t.setEventHandler { [weak self] in self?.poll() }
        t.resume()
        timer = t
        log("on — cache auto-resizes with memory availability between requests (--no-elastic to pin)")
    }

    public func stop() {
        pressure?.cancel()
        timer?.cancel()
        pressure = nil
        timer = nil
    }

    /// What auto would choose if slotstream restarted right now: reclaimable
    /// memory credited with everything we hold that a restart would release —
    /// the pool AND the fixed footprint (the planner subtracts the fixed
    /// footprint again when deriving slots from the target; without this
    /// credit the steady state under contention double-reserves ~4 GB).
    /// Gather what the policy needs. Returns nil when elastic does not apply
    /// (an explicit size is the user's stated intent) or availability is
    /// unreadable (then nothing is resized).
    private func inputs(pressure: GovernorPolicy.Pressure?) -> GovernorPolicy.Inputs? {
        guard let cur = engine.currentPlan, cur.source == .auto else { return nil }
        guard let avail = Planner.availabilityOverride ?? Planner.deviceAvailableGB() else {
            return nil
        }
        let now = Date()
        return GovernorPolicy.Inputs(
            currentSlots: engine.model.pool.slots,
            availableGB: avail,
            ramGB: cur.ramGB,
            workingSetGB: cur.workingSetGB,
            secondsSincePressure: lastPressureAt.map { now.timeIntervalSince($0) },
            secondsSinceResize: lastResizeAt.map { now.timeIntervalSince($0) },
            pressure: pressure)
    }

    /// OS pressure events see what availability math cannot: compressor and
    /// swap strain from system-wide overcommit. Shed an absolute chunk —
    /// repeated events keep shedding until the pressure stops.
    private func onPressure(critical: Bool) {
        lastPressureAt = Date()
        act(critical ? .critical : .warning)
    }

    private func poll() { act(nil) }

    private func act(_ pressure: GovernorPolicy.Pressure?) {
        guard let i = inputs(pressure: pressure) else { return }
        if case let .resize(slots, reason) = GovernorPolicy.decide(i) {
            apply(slots, plan: engine.currentPlan, reason: reason)
        }
    }

    private func apply(_ slots: Int, plan: MemoryPlan?, reason: String) {
        let target = slots  // already clamped by GovernorPolicy.decide
        let before = engine.model.pool.slots
        guard target != before else { return }
        let growing = target > before
        engine.withExclusive {
            engine.model.pool.resize(to: target)
        }
        lastResizeAt = Date()
        let after = engine.model.pool.slots
        let ref = plan ?? engine.currentPlan
        engine.updatePlan(MemoryPlan(
            source: .auto, slots: after, targetGB: ref?.targetGB,
            ramGB: ref?.ramGB ?? Planner.deviceRAMGB(),
            workingSetGB: ref?.workingSetGB ?? Planner.deviceWorkingSetGB(),
            availableGB: ref?.availableGB, clamped: ref?.clamped ?? false,
            prefillChunk: ref?.prefillChunk ?? Planner.prefillChunkFor(
                poolBudgetGB: Geometry.gb(after)),
            notes: [String(
                format: "elastic: resized ~%.0f → ~%.0f experts/layer (%@)",
                Geometry.perLayer(before), Geometry.perLayer(after), reason)]))
        log(String(
            format: "%@ — cache ~%.0f → ~%.0f experts/layer (%.1f → %.1f GB pool%@)",
            reason, Geometry.perLayer(before), Geometry.perLayer(after),
            Geometry.gb(before), Geometry.gb(after),
            growing ? ", contents kept" : ", cold — refills from SSD"))
    }

    private func log(_ s: String) {
        FileHandle.standardError.write("elastic: \(s)\n".data(using: .utf8)!)
    }
}
