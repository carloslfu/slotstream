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
    private func desiredPlan() -> MemoryPlan? {
        guard let cur = engine.currentPlan, cur.source == .auto else { return nil }
        guard let avail = Planner.deviceAvailableGB() else { return nil }
        let credited = avail + Geometry.gb(engine.model.pool.slots) + Planner.fixedFootprintGB
        return try? Planner.plan(
            expertsPerLayer: nil, poolGB: nil, memoryGB: nil, availableGB: credited)
    }

    /// OS pressure events see what availability math cannot: compressor and
    /// swap strain from system-wide overcommit. Shed an absolute chunk —
    /// repeated events keep shedding until the pressure stops.
    private func onPressure(critical: Bool) {
        lastPressureAt = Date()
        let curGB = Geometry.gb(engine.model.pool.slots)
        let shedGB = critical ? max(4.0, curGB * 0.5) : max(2.0, curGB * 0.15)
        var target = Int((curGB - shedGB) * 1e9 / Geometry.recordBytes)
        let d = desiredPlan()
        if let d { target = min(target, d.slots) }
        apply(target, plan: d,
              reason: critical ? "memory pressure (critical)" : "memory pressure (warning)")
    }

    private func poll() {
        guard let d = desiredPlan() else { return }
        let curGB = Geometry.gb(engine.model.pool.slots)
        let desiredGB = Geometry.gb(d.slots)
        if desiredGB <= curGB - Self.shrinkDeadbandGB {
            apply(d.slots, plan: d, reason: "availability dropped")
        } else if desiredGB >= curGB + Self.growDeadbandGB {
            let now = Date()
            let calm = lastPressureAt.map { now.timeIntervalSince($0) > Self.growCooldown } ?? true
            let cooled = lastResizeAt.map { now.timeIntervalSince($0) > Self.growCooldown } ?? true
            if calm, cooled {
                apply(d.slots, plan: d, reason: "memory freed")
            }
        }
    }

    private func apply(_ slots: Int, plan: MemoryPlan?, reason: String) {
        let target = max(Geometry.floorSlots, min(slots, Geometry.totalRecords))
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
