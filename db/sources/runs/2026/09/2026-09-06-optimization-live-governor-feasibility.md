---
type: run
id: 01m1wbdkc6qa3c51ypxvy9zh5c
created: 2026-09-06T21:54:01.222980+00:00
updated: 2026-09-06T21:54:01.578917+00:00
summary: V194 live governor rejects ordinary-context advisory overcommit
binary: unbuilt source
captured_at: 2026-09-06
command: governor-default-feasibility-v1 exact source integration
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: V194 live governor rejects ordinary-context advisory overcommit
tool: source review and exact integration
---
V194 applies the minimal reviewed live-governor feasibility correction after preserving V193's eight plain-mode failures. The startup planner deliberately allows an advisory floor at ordinary context sizes; the live governor may not treat that warning as permission to admit new work after an infeasible replan. desiredPlan now checks the complete resolved expectedPeakBytes against both min(workingSetGB, creditedAvailableGB - availabilitySlackGB) and the total-memory target, at every context cap. It uses the same ledger and physical-budget arithmetic as ContextFeasibility, preserving loaded MTP/vision components and restart credit. Startup Planner, explicit knob behavior, pressure cancellation, resize deadbands, cooldowns and the eight existing refusal assertions are unchanged.

The exact two source preimages were checked before copying either file; after hashes match the context-owned packet. Added pure regression coverage spans context1/1024/32768/65536, plain/required-MTP, infeasible floor, no imaginary smaller arena and feasible recovery with the loaded head preserved:32 assertions. These new assertions and the changed Swift source are unbuilt and untested at capture. No model/build/performance/capacity/storage job launched; transport retains the Mac until explicit handback. Optimization defaults remain off. Required successor qualification must rebuild this source, pass the existing governor policy catalogue and both real plain/MTP pressure-boundary variants without relaxing refusal criteria.


Artifact `/tmp/slotstream-optimization-execution/governor-feasibility-v194/after/Sources/Slotstream/Governor.swift` — 21116 bytes; SHA-256 `5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48`.

````text
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
import MLX

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
        /// The RAM share auto may target; mirrors --max-ram-percent.
        public var ramPercent: Double
        public var mtpEnabled: Bool
        public var visionEnabled: Bool
        public var visionResidentReserved: Bool
        public var maxContextTokens: Int
        public var runtimeAllocationPolicy: RuntimeAllocationPolicy?
        public var ownedAdditionalBytes: Int
        public var contextQualification: Bool
        /// nil = no such event yet in this process.
        public var secondsSincePressure: Double?
        public var secondsSinceResize: Double?
        /// Set when this tick is an OS pressure event rather than a poll.
        public var pressure: Pressure?

        public init(
            currentSlots: Int, availableGB: Double, ramGB: Double, workingSetGB: Double,
            ramPercent: Double = Planner.defaultRAMPercent,
            secondsSincePressure: Double? = nil, secondsSinceResize: Double? = nil,
            pressure: Pressure? = nil,
            mtpEnabled: Bool = false, visionEnabled: Bool = false,
            visionResidentReserved: Bool = false,
            maxContextTokens: Int = ContextPolicy.defaultTokens,
            runtimeAllocationPolicy: RuntimeAllocationPolicy? = nil,
            ownedAdditionalBytes: Int = 0, contextQualification: Bool = false
        ) {
            self.ramPercent = ramPercent
            self.currentSlots = currentSlots
            self.availableGB = availableGB
            self.ramGB = ramGB
            self.workingSetGB = workingSetGB
            self.secondsSincePressure = secondsSincePressure
            self.secondsSinceResize = secondsSinceResize
            self.pressure = pressure
            self.mtpEnabled = mtpEnabled
            self.visionEnabled = visionEnabled
            self.visionResidentReserved = visionResidentReserved
            self.maxContextTokens = maxContextTokens
            self.runtimeAllocationPolicy = runtimeAllocationPolicy
            self.ownedAdditionalBytes = max(0, ownedAdditionalBytes)
            self.contextQualification = contextQualification
        }
    }

    public enum Decision: Equatable {
        case hold
        case resize(slots: Int, reason: String)
    }

    public static let growCooldown: TimeInterval = 60
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
    public static func desiredPlan(_ i: Inputs) -> MemoryPlan? {
        let credited = i.availableGB + Geometry.gb(i.currentSlots) + Planner.fixedFootprintGB
            + (i.mtpEnabled ? Planner.mtpResidentGB : 0)
            + (i.visionResidentReserved ? Planner.visionResidentGB : 0)
            + Double(i.ownedAdditionalBytes) / 1e9
        guard let plan = try? Planner.plan(
            expertsPerLayer: nil, poolGB: nil, memoryGB: nil,
            ramGB: i.ramGB, workingSetGB: i.workingSetGB, availableGB: credited,
            ramPercent: i.ramPercent,
            mtp: i.mtpEnabled ? .on : .off, mtpAvailable: i.mtpEnabled,
            vision: i.visionEnabled ? .on : .off, visionAvailable: i.visionEnabled,
            visionResidentReserved: i.visionResidentReserved, maxContextTokens: i.maxContextTokens,
            qualification: i.contextQualification, runtimePolicy: i.runtimeAllocationPolicy),
            plan.mtpEnabled == i.mtpEnabled else { return nil }
        // Startup preserves a legacy advisory floor at ordinary contexts.
        // A live governor must not interpret that advisory as permission to
        // admit work after an infeasible replan. Price the complete resolved
        // allocation against the same credited physical budget at every cap.
        let physical = min(i.workingSetGB,
            credited - Planner.availabilitySlackGB(ramGB: i.ramGB))
        let peak = Double(plan.memoryLedger.expectedPeakBytes)
        guard physical.isFinite, physical > 0, peak <= physical * 1e9,
              plan.targetGB.map({ peak <= $0 * 1e9 }) ?? true else { return nil }
        // A startup planner may decline a head under pressure, but the live
        // governor has no operation that unloads an already resident head.
        return plan
    }

    public static func desiredSlots(_ i: Inputs) -> Int? {
        desiredPlan(i)?.slots
    }

    /// Live allocation controls for a resize. Availability-driven targets come
    /// directly from a fresh planner result, so preserve that result's prefill
    /// and prefix budgets. Deriving them again from the already-net expert pool
    /// double-subtracts their cost: at the 33 GB knee it downgraded a recovered
    /// server from the planned 4096-token pass to 2048. A pressure-event target
    /// can be an arbitrary extra shed, so it deliberately uses the conservative
    /// pool-only fallback.
    public static func liveControls(
        for targetSlots: Int, inputs i: Inputs
    ) -> (prefillChunk: Int, prefixCacheTokens: Int) {
        if let p = desiredPlan(i), p.slots == targetSlots {
            return (p.prefillChunk, p.prefixCacheTokens)
        }
        let gb = Geometry.gb(targetSlots)
        return (
            min(Planner.prefillChunkFor(poolBudgetGB: gb, contextCap: i.maxContextTokens), i.runtimeAllocationPolicy?.prefillChunkOverride ?? 4096),
            i.runtimeAllocationPolicy?.prefixCacheEnabled == false ? 0 : Planner.prefixCacheTokensFor(poolBudgetGB: gb, contextCap: i.maxContextTokens))
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
        guard let d = desired else { return settle(Geometry.floorSlots, i.currentSlots, "context plan unavailable") }
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

public final class MemoryGovernor: @unchecked Sendable {
    private let engine: Engine
    private let queue = DispatchQueue(label: "slotstream.governor")
    private let queueKey = DispatchSpecificKey<UInt8>()
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
        queue.setSpecific(key: queueKey, value: 1)
    }

    // All daemon state, including start/stop and diagnostic events, belongs
    // to the queue. Engine allocation and metadata have their own locks.
    private func onQueue<T>(_ body: () -> T) -> T {
        if DispatchQueue.getSpecific(key: queueKey) != nil { return body() }
        return queue.sync(execute: body)
    }

    public func start() {
        onQueue { startOnQueue() }
    }

    private func startOnQueue() {
        guard pressure == nil, timer == nil else { return }
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

    /// Enqueue cancellation without waiting behind a pressure event that is
    /// itself waiting for the caller's generation lock. A later start() is
    /// serialized after this cancellation.
    public func stop() {
        if DispatchQueue.getSpecific(key: queueKey) != nil { stopOnQueue() }
        else { queue.async { self.stopOnQueue() } }
    }

    private func stopOnQueue() {
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
            ramPercent: cur.ramPercent,
            secondsSincePressure: lastPressureAt.map { now.timeIntervalSince($0) },
            secondsSinceResize: lastResizeAt.map { now.timeIntervalSince($0) },
            pressure: pressure,
            mtpEnabled: cur.mtpEnabled, visionEnabled: cur.visionEnabled,
            visionResidentReserved: cur.visionResidentReserved,
            maxContextTokens: cur.maxContextTokens,
            runtimeAllocationPolicy: cur.runtimeAllocationPolicy,
            ownedAdditionalBytes: engine.prefixCache.ownedAdditionalBytes(mtpResident: cur.mtpEnabled),
            contextQualification: cur.contextQualification)
    }

    /// OS pressure events see what availability math cannot: compressor and
    /// swap strain from system-wide overcommit. Shed an absolute chunk —
    /// repeated events keep shedding until the pressure stops.
    private func onPressure(critical: Bool) {
        lastPressureAt = Date()
        act(critical ? .critical : .warning)
    }

    private func poll() { act(nil) }

    /// Run one poll cycle immediately, as the 15 s timer would.
    ///
    /// Exists so the *governor* can be driven end to end — poll, decide, take
    /// the generation lock, resize, update the plan, log — rather than only its
    /// policy function. `slotstream elastic-drill` uses it with
    /// `Planner.availabilityOverride` so that path is covered without putting
    /// the machine under real memory pressure, which is the one way this had
    /// never been exercised on a shipped build.
    public func pollNow() { onQueue { act(nil) } }

    /// Bounded diagnostic event; uses the real queue and resize path without
    /// inducing OS pressure or inventing additional available memory.
    package func pressureNow(_ pressure: GovernorPolicy.Pressure, requested: (() -> Void)? = nil) {
        onQueue {
            lastPressureAt = Date()
            act(pressure, requested: requested)
        }
    }

    private func act(_ pressure: GovernorPolicy.Pressure?, requested: (() -> Void)? = nil) {
        // Read policy and mutate the arena under one generation lock. A first
        // image can reserve resident memory while a governor tick is waiting;
        // a decision sampled before the lock would spend that reservation.
        let applyDecision = {
            guard let i = self.inputs(pressure: pressure) else { return }
            self.engine.setAllocationUnavailable(GovernorPolicy.desiredPlan(i) == nil
                ? RequestFailure(.insufficientMemory, "the configured context no longer fits current availability; retry after memory recovers") : nil)
            if pressure != nil {
                // Even at the arena floor there can be inexpensive memory to
                // return. No live reader exists while this gate is held.
                self.engine.prefixCache.drop()
                MLX.Memory.clearCache()
            }
            if case let .resize(slots, reason) = GovernorPolicy.decide(i) {
                let controls = GovernorPolicy.liveControls(for: slots, inputs: i)
                self.apply(
                    slots, plan: self.engine.currentPlan, reason: reason,
                    prefillChunk: controls.prefillChunk,
                    prefixCacheTokens: controls.prefixCacheTokens)
            }
        }
        // Request cancellation observes pressure independently of optimization controls.
        guard engine.currentPlan?.source == .auto else { requested?(); return }
        if pressure == nil {
            engine.tryWithExclusive(applyDecision)
        } else {
            let ticket = engine.pressureBoundary.request()
            requested?()
            engine.withExclusive {
                defer { engine.pressureBoundary.acknowledge(ticket) }
                applyDecision()
            }
        }
    }

    private func apply(
        _ slots: Int, plan: MemoryPlan?, reason: String,
        prefillChunk: Int, prefixCacheTokens: Int
    ) {
        let target = slots  // already clamped by GovernorPolicy.decide
        let before = engine.model.pool.slots
        guard target != before else { return }
        let growing = target > before
        let ref = plan ?? engine.currentPlan
        // --max-context is also a hard ceiling on any one retained history.
        // A later governor resize must not undo the cap Serve applied at startup.
        let livePrefixTokens = min(prefixCacheTokens, engine.maxContextTokens)
        var after = before
        do {
            // Shrinking means memory is wanted elsewhere. The retained
            // conversation state is the cheapest thing to give back — up to
            // ~0.9 GB, recovered by one re-prefill on the next turn — so it
            // goes before the pool is starved further. Growing keeps it: the
            // machine has room and the next turn should still be fast.
            if !growing { engine.prefixCache.drop() }
            engine.model.pool.resize(to: target)
            after = engine.model.pool.slots
            engine.publishPoolSnapshot()
            // These are live allocation controls, not merely fields in the
            // reported plan. Leaving startup values here let a shrunken server
            // allocate the old large prefill and refill the old cache ceiling.
            if ref?.runtimeAllocationPolicy != nil {
                engine.generator.setPrefillBudgetCeiling(prefillChunk)
                engine.prefixCache.setBudgetLimit(livePrefixTokens)
            }
            engine.generator.prefillChunk = prefillChunk
            engine.prefixCache.configure(maxTokens: livePrefixTokens)
            engine.updatePlan(MemoryPlan(
                source: .auto, slots: after, targetGB: ref?.targetGB,
                ramGB: ref?.ramGB ?? Planner.deviceRAMGB(),
                workingSetGB: ref?.workingSetGB ?? Planner.deviceWorkingSetGB(),
                ramPercent: ref?.ramPercent ?? Planner.defaultRAMPercent,
                availableGB: ref?.availableGB, clamped: ref?.clamped ?? false,
                prefillChunk: prefillChunk, prefixCacheTokens: livePrefixTokens,
                mtpEnabled: ref?.mtpEnabled ?? false,
                visionEnabled: ref?.visionEnabled ?? false,
                visionResidentReserved: ref?.visionResidentReserved ?? false,
                maxContextTokens: engine.maxContextTokens,
                notes: [String(
                    format: "elastic: resized ~%.0f → ~%.0f experts/layer (%@)",
                    Geometry.perLayer(before), Geometry.perLayer(after), reason)],
                runtimeAllocationPolicy: ref?.runtimeAllocationPolicy,
                maxPrefillWaitMinutes: ref?.maxPrefillWaitMinutes ?? 30,
                contextQualification: ref?.contextQualification ?? false))
        }
        lastResizeAt = Date()
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

````

Artifact `/tmp/slotstream-optimization-execution/governor-feasibility-v194/after/Sources/SlotstreamDiagnostics/Diagnostics+Context.swift` — 29343 bytes; SHA-256 `48ec4e1c4e1e24666d1833ee2019eda081f67db200b6a59169b735fec767c3fa`.

````text
import Foundation
import Slotstream

extension Diagnostics {
    public static func configurableContext() throws -> CheckReport {
        var c = CheckBuilder("configurable-context")
        let cacheModel = UUID(), cacheOptions = InferenceOptimizations()
        let currentKey = PromptCheckpointKey(model: cacheModel, optimizations: cacheOptions,
            prefillChunk: 256, mtp: false)
        c.equal("prompt cache defaults to the current arithmetic epoch", currentKey.contextArithmetic, 1)
        c.expect("old arithmetic cannot match a current prompt checkpoint", currentKey != PromptCheckpointKey(
            model: cacheModel, optimizations: cacheOptions, prefillChunk: 256, mtp: false, contextArithmetic: 0))
        let caps = [1, 1024, 4096, 8192, 32768, 32769, 65535, 65536, 65537,
                    128255, 128256, 128257, 131071, 131072, 131073, 262143, 262144]
        for cap in caps {
            let bytes = ContextGeometry.sequenceBytes(tokens: cap)
            // Independent allocator geometry, not a restatement of a helper call.
            let rows = ((cap + 1023) / 1024) * 1024
            c.equal("main allocated capacity \(cap)", bytes, rows * 12 * (2 * 2 * 256 + 128) * 2)
            c.equal("MTP allocated capacity \(cap)", ContextGeometry.sequenceBytes(tokens: cap, mtp: true),
                    rows * 13 * (2 * 2 * 256 + 128) * 2)
        }
        c.equal("overflowing capacity is refused", ContextGeometry.sequenceBytes(tokens: Int.max), Int.max)
        c.equal("negative capacity is refused", ContextGeometry.sequenceBytes(tokens: -1), Int.max)
        // These represent separately owned buffers, including different spare
        // main/draft capacities after rollback. A large unrelated buffer cannot
        // pay for a replacement, and old storage is not yet reclaimable.
        let keyRow = 2 * 256 * 2
        let mainGrowth = ContextGeometry.nextBufferAllocationBytes(tokens: 1025,
            rowBytes: keyRow, allocatedBytes: 1024 * keyRow)
        let draftSpare = ContextGeometry.nextBufferAllocationBytes(tokens: 1024,
            rowBytes: keyRow, allocatedBytes: 4096 * keyRow)
        c.equal("main growth charges complete replacement", mainGrowth, 2048 * keyRow)
        c.equal("draft can reuse its own spare rows", draftSpare, 0)
        c.equal("draft spare does not offset main growth", mainGrowth + draftSpare, 2048 * keyRow)
        c.equal("matching buffer reuses existing capacity", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1024, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 0)
        c.equal("absent pooled indexer needs its own allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1025, rowBytes: 256, allocatedBytes: 0, step: 256), 1280 * 256)
        c.equal("compact raw growth preserves its 256-row step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 304, rowBytes: 256, allocatedBytes: 256 * 256, step: 256), 512 * 256)
        c.equal("compact tail copy is a new allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 32, rowBytes: 256, allocatedBytes: 0, step: 256), 256 * 256)
        c.equal("provisional batch crosses the next allocation step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1023 + 1 + 16, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 2048 * keyRow)
        c.equal("checkpoint copy cannot spend shared backing", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1000, rowBytes: keyRow, allocatedBytes: 0), 1024 * keyRow)
        c.equal("invalid allocation geometry refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: Int.max, rowBytes: keyRow, allocatedBytes: 0), Int.max)
        c.equal("negative owned byte count refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1, rowBytes: keyRow, allocatedBytes: -1), Int.max)
        for room in 0 ... 18 {
            let depth = ContextPolicy.maximumDraftDepth(requested: 16, at: 65536 - room, limit: 65536)
            c.equal("provisional context bounds draft depth/\(room)", depth, min(16, max(0, room - 1)))
            if room > 0 { c.expect("pending plus drafts remain inside context/\(room)", 1 + depth <= room) }
        }
        c.equal("Hermes transient anchor remains fixed", ContextMemoryLedger.transientReserveBytes(context: 65536), 905_969_664)
        c.equal("default has no extra reserve", ContextMemoryLedger.transientReserveBytes(context: 32768), 0)
        // Concurrent requests see one unchanged injected reading. Atomic
        // reservations, not real large allocations, decide how many fit.
        let reservations = RequestMemoryReservations()
        let resultLock = NSLock()
        var accepted: [RequestController] = []
        var refusals = 0
        let reservationPolicy = try ContextConfiguration(maxPrefillWaitMinutes: 0)
        DispatchQueue.concurrentPerform(iterations: 8) { _ in
            let control = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000,
                availableGB: { 0.010 })
            do {
                try control.attachReservations(reservations)
                try control.reservePreparedImageBytes(4_000_000)
                resultLock.withLock { accepted.append(control) }
            } catch { resultLock.withLock { refusals += 1 } }
        }
        c.equal("concurrent preparations cannot spend the same headroom", accepted.count, 2)
        c.equal("excess concurrent preparations refuse before allocation", refusals, 6)
        c.equal("queued decoded pixels remain reserved", reservations.reservedBytes, 8_000_000)
        if let active = accepted.first {
            do { try active.check(nextAllocationBytes: 3_000_000, phase: "test active generation") } catch {}
            c.equal("generation cannot spend queued preparation ownership", active.failure?.code, .insufficientMemory)
            c.equal("failed dispatch preserves retained-pixel reservations", reservations.reservedBytes, 8_000_000)
        }
        var retainedPreparation: RequestController? = accepted.popLast()
        accepted.removeAll()
        c.equal("prepared-image owner keeps its lease after request queue release", reservations.reservedBytes, 4_000_000)
        withExtendedLifetime(retainedPreparation) {}
        retainedPreparation = nil
        c.equal("last preparation owner releases its exact reservation", reservations.reservedBytes, 0)
        do {
            let fresh = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000, availableGB: { 0.010 })
            try fresh.attachReservations(reservations)
            try fresh.checkInputBytes(100_000)
            try fresh.checkInputBytes(1)
            c.equal("shorter later input check cannot release retained copies", reservations.reservedBytes, 1_600_000)
            try fresh.check(nextAllocationBytes: 4_000_000, phase: "test dispatch")
            c.equal("prepared and pending dispatch bytes are separately reserved", reservations.reservedBytes, 5_600_000)
            fresh.releaseDispatchReservation()
            c.equal("completed dispatch releases only transient ownership", reservations.reservedBytes, 1_600_000)
        }
        c.equal("request completion returns all reservations", reservations.reservedBytes, 0)
        for cap in caps {
            for target in [8.1, 10, 16, 24, 33] {
                for mtp in [Planner.MTPMode.off, .on, .auto] {
                    do {
                        let p = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44,
                            mtp: mtp, mtpAvailable: true, vision: .off, maxContextTokens: cap,
                            simulated: true, qualification: true)
                        c.expect("fit \(cap)/\(target)/\(mtp)", p.memoryLedger.expectedPeakBytes <= Int(target * 1e9))
                        c.equal("preserve window \(cap)/\(target)/\(mtp)", p.maxContextTokens, cap)
                        if mtp == .on { c.expect("forced MTP stays on \(cap)/\(target)", p.mtpEnabled) }
                    } catch {
                        c.expect("bounded refusal \(cap)/\(target)/\(mtp)", !String(describing: error).isEmpty)
                    }
                }
            }
        }
        let baseline = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off, simulated: true)
        let small = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off,
            maxContextTokens: 1024, simulated: true)
        c.expect("short cap refunds retention instead of reserving 32K", small.prefixCacheTokens <= 1024 && small.slots > baseline.slots)
        let machine = Machine.simulated(ramGB: 51.5, workingSetGB: 40.2, availableGB: 44)
        for target in [8.1, 10, 16, 24, 33] {
            let request = PlanRequest(memoryGB: target, mtp: .off, vision: .off, maxContextTokens: ContextPolicy.modelLimit)
            let result = Planner.contextFeasibility(request, on: machine, qualification: true)
            c.expect("solver maximum accepted at \(target)", result.maximumPlan != nil)
            if result.maximumFeasibleWindow < ContextPolicy.modelLimit {
                let next = result.maximumFeasibleWindow + 1
                let p = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: next, simulated: true, qualification: true)
                c.expect("next solver token refused at \(target)", p == nil)
            }
        }
        for chunk in [64, 128, 256, 512, 1024, 2048, 4096] {
            for start in [0, 1, 32768, 65535, 128255, 128256, 128257, 131071, 262079, 262143] {
                let count = ContextPolicy.modelLimit - start
                var position = start
                let passes = PrefillSchedule.passes(tokens: count, from: start, maxChunk: chunk)
                var bounded = !passes.isEmpty
                for n in passes {
                    // Ordinary scheduling has always clamped small batch
                    // overrides up to 256. The 64-row floor applies only
                    // after the 256-row query/key product no longer fits.
                    let floor = 256 * (position + 256) <= 4096 * 8016 ? 256 : 64
                    bounded = bounded && n > 0 && n <= max(floor, chunk)
                        && n * (position + n) <= 4096 * 8016
                    position += n
                }
                c.expect("bounded schedule \(chunk) from \(start)", bounded && position == ContextPolicy.modelLimit)
            }
        }
        c.expect("overflowing schedule is refused", PrefillSchedule.passes(tokens: Int.max, from: Int.max, maxChunk: 4096).isEmpty)
        c.expect("uncalibrated late schedule is unknown", PrefillSchedule.estimateSeconds(tokens: 262144, maxChunk: 4096) == nil)
        c.expect("Hermes schedule retains an estimate", PrefillSchedule.estimateSeconds(tokens: 65536, maxChunk: 4096) != nil)
        let oddLate = PrefillSchedule.computePasses(tokens: 512, from: 200000, maxChunk: 4095)
        c.equal("diagnostic odd late schedule matches the canonical runtime shape", oddLate.map(\.tokens), Array(repeating: 64, count: 8))
        c.equal("diagnostic includes masked canonical columns", oddLate.map(\.keyExtent),
            Array(repeating: 200256, count: 4) + Array(repeating: 200512, count: 4))
        c.expect("diagnostic includes physical query rows", oddLate.allSatisfy { $0.queryRows == 64 })
        let paddedTail = PrefillSchedule.computePasses(tokens: 449, from: 200000, maxChunk: 4095)
        c.equal("diagnostic tail reports its padded query geometry", paddedTail.last?.queryRows, 64)
        c.equal("diagnostic tail preserves its one logical token", paddedTail.last?.tokens, 1)

        var tick: UInt64 = 0
        var available = 10.0
        var connected = true
        var pressure = false
        func controller(wait: Double = 1, cap: Int = 65536) throws -> RequestController {
            try RequestController(configuration: ContextConfiguration(maxContextTokens: cap, maxPrefillWaitMinutes: wait),
                slackBytes: 1_500_000_000, clock: { tick }, availableGB: { available },
                connected: { connected }, pressure: { pressure })
        }
        for invalid in [Double.nan, .infinity, -.infinity, -1, Double.greatestFiniteMagnitude] {
            c.expect("invalid duration \(invalid) refused", (try? ContextConfiguration(maxPrefillWaitMinutes: invalid)) == nil)
        }
        let estimated = try controller()
        do { try estimated.admit(missingTokens: 32768, from: 0, maxChunk: 256) } catch {}
        c.equal("cold estimate refuses before prefill", estimated.failure?.code, .prefillWaitExceeded)
        let reused = try controller()
        try reused.admit(missingTokens: 32, from: 64000, maxChunk: 4096)
        c.expect("fast continuation admits from its real position", reused.failure == nil)
        tick = 61_000_000_000
        do { try reused.check(phase: "image preparation") } catch {}
        c.equal("elapsed preparation still trips deadline", reused.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let queue = try controller()
        tick = 61_000_000_000
        do { try queue.check(phase: "queue") } catch {}
        c.equal("queue uses same clock", queue.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let decoding = try controller()
        decoding.sampledFirstToken(); tick = 61_000_000_000
        try decoding.check(phase: "decode")
        c.expect("decode does not inherit the prefill deadline", decoding.failure == nil)
        let timeless = try controller(wait: 0)
        tick += 100_000_000_000; try timeless.check()
        available = 1
        do { try timeless.check(nextAllocationBytes: 1) } catch {}
        c.equal("zero time policy retains memory guard", timeless.failure?.code, .insufficientMemory)
        available = 3
        let growth = try controller(wait: 0)
        do { try growth.check(nextAllocationBytes: 2_000_000_000) } catch {}
        c.equal("next allocation is charged before it starts", growth.failure?.code, .insufficientMemory)
        available = 10; pressure = true
        let pressed = try controller(wait: 0)
        do { try pressed.check() } catch {}
        c.equal("pressure is independent of time", pressed.failure?.code, .insufficientMemory)
        pressure = false; connected = false
        let cancelled = try controller()
        do { try cancelled.check() } catch {}
        c.equal("disconnect is typed cancellation", cancelled.failure?.code, .clientCancelled)
        c.expect("failed request cannot retain state", !cancelled.mayRetainState)
        let unknown = RequestController(configuration: try ContextConfiguration(maxContextTokens: 65536),
            slackBytes: 1_500_000_000, availableGB: { nil })
        do { try unknown.check(nextAllocationBytes: 1) } catch {}
        c.equal("unknown memory refuses long-state growth", unknown.failure?.code, .insufficientMemory)
        var governor = GovernorPolicy.Inputs(currentSlots: 2000, availableGB: 4, ramGB: 51.5,
            workingSetGB: 40.2, maxContextTokens: 65536)
        let empty = GovernorPolicy.desiredPlan(governor)
        governor.ownedAdditionalBytes = 1_000_000_000
        let owned = GovernorPolicy.desiredPlan(governor)
        c.expect("owned memory changes replan credit", (owned?.targetGB ?? 0) > (empty?.targetGB ?? 0))
        c.equal("request cap survives ownership credit", owned?.maxContextTokens, 65536)
        governor.availableGB = 0; governor.currentSlots = Geometry.floorSlots
        governor.maxContextTokens = ContextPolicy.modelLimit; governor.contextQualification = true
        governor.ownedAdditionalBytes = 0
        c.expect("infeasible governor plan is explicit", GovernorPolicy.desiredPlan(governor) == nil)
        for cap in [1, 1024, ContextPolicy.defaultTokens, ContextPolicy.mtpLimit] {
            for mtp in [false, true] {
                let exhausted = GovernorPolicy.Inputs(currentSlots: Geometry.floorSlots,
                    availableGB: 0, ramGB: 51.5, workingSetGB: 40.2,
                    mtpEnabled: mtp, maxContextTokens: cap)
                c.expect("ordinary startup advisory cannot authorize live work/\(cap)/\(mtp)",
                    GovernorPolicy.desiredPlan(exhausted) == nil)
                c.equal("infeasible floor does not invent a smaller arena/\(cap)/\(mtp)",
                    GovernorPolicy.decide(exhausted), .hold)
                var recovered = exhausted
                recovered.availableGB = 10
                if let plan = GovernorPolicy.desiredPlan(recovered) {
                    let physical = min(recovered.workingSetGB, recovered.availableGB
                        + Geometry.gb(recovered.currentSlots) + Planner.fixedFootprintGB
                        + (mtp ? Planner.mtpResidentGB : 0)
                        - Planner.availabilitySlackGB(ramGB: recovered.ramGB))
                    c.expect("recovery fits its credited physical budget/\(cap)/\(mtp)",
                        Double(plan.memoryLedger.expectedPeakBytes) <= physical * 1e9)
                    c.equal("feasible recovery preserves required head/\(cap)/\(mtp)", plan.mtpEnabled, mtp)
                } else {
                    c.expect("ordinary context has a feasible pure recovery/\(cap)/\(mtp)", false)
                }
            }
        }
        c.equal("overflowing public ledger saturates to refusal", ContextMemoryLedger(slots: Int.max,
            context: Int.max, chunk: Int.max, retentionTokens: Int.max, mtp: true, visionResident: true).expectedPeakBytes, Int.max)
        let originalVision = ContextWorkspace.visionBytes(patches: 9216)
        let tiledVision = ContextWorkspace.visionBytes(patches: 9216, queryTile: 256)
        c.expect("vision charge uses actual query bound", originalVision > tiledVision * 4)
        c.equal("unsupported vision mode is refused", ContextWorkspace.visionBytes(patches: 9216, queryTile: 512), Int.max)
        c.expect("late 64 pass retains context-dependent workspace", ContextWorkspace.prefillBytes(pass: 64, context: 262144) > 64 * 1_300_000)
        for override in [1, 64, 128, 256, 257, 511, 513, 1023, 2047, 4095, 4096] {
            for position in [0, 32768, 65535, 65536] {
                c.expect("ordinary window preserves original floor/\(override)/\(position)",
                    PrefillSchedule.chunk(at: position, maxChunk: override) >= 256)
            }
        }
        c.equal("projection shape padding is charged before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 256), 256 * 1_300_000)
        c.equal("invalid projection shape refuses before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 257), Int.max)
        c.equal("unbounded 128 final pass is refused", ContextWorkspace.prefillBytes(pass: 128, context: 262144), Int.max)
        c.equal("small attention domain stops at actual prompt end", ContextWorkspace.keyExtent(pass: 64,
            context: 448, referenceEnd: 470), 470)
        c.equal("small attention domain follows exact prefix origin", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 17, referenceEnd: 515), 273)
        c.equal("invalid reference domain fails closed", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 18, referenceEnd: 515), Int.max)
        c.equal("one-row tail preserves matrix query dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 449, referenceEnd: 449), 64)
        c.equal("canonical one-row terminal keeps vector dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 513, referenceEnd: 513), 1)
        c.equal("one-row tail prices its real key domain", ContextWorkspace.keyExtent(pass: 1,
            context: 449, referenceEnd: 449), 449)
        c.expect("padded tail workspace includes physical queries", ContextWorkspace.prefillBytes(pass: 1,
            context: 262143, referenceEnd: 262144, minimumProjectionRows: 256, padSmallQueries: true)
            >= 64 * 262144 * (24 * 8 + 16))
        for override in [64, 68, 127, 128, 136, 137, 255] {
            c.equal("late odd override selects a qualified full-pass shape/\(override)",
                ContextWorkspace.boundedSmallPass(requested: override, at: 200000,
                    referenceStart: 200000, referenceEnd: 262144), override >= 128 ? 128 : 64)
        }
        for origin in [0, 1, 17, 130001, 131073] {
            var position = max(origin, 256273), total = 0
            while position < ContextPolicy.modelLimit {
                let n = ContextWorkspace.boundedSmallPass(requested: 128, at: position,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                guard n > 0 else { c.expect("small-pass schedule advances/\(origin)", false); break }
                let extent = ContextWorkspace.keyExtent(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                let queries = ContextWorkspace.queryRows(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                c.expect("actual padded product stays bounded/\(origin)/\(position)",
                    queries * extent <= PrefillSchedule.measuredQueryKeyProduct)
                c.expect("small pass never crosses its reference domain/\(origin)/\(position)",
                    n <= 256 - ((position - origin) % 256))
                position += n; total += n
            }
            c.equal("small-pass schedule closes/\(origin)", total, ContextPolicy.modelLimit - max(origin, 256273))
        }
        let busy = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
            on: Machine.simulated(ramGB: 16, workingSetGB: 12, availableGB: 5))
        c.equal("busy machine never calls an unphysical window feasible", busy.maximumFeasibleWindow, 0)
        for prefix in [false, true] {
            let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
            let result = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
                on: machine, runtimePolicy: policy, qualification: true)
            c.expect("solver freezes actual retention policy \(prefix)", result.maximumPlan?.runtimeAllocationPolicy == policy)
            if let maximum = result.maximumPlan, maximum.maxContextTokens < ContextPolicy.modelLimit {
                let next = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 10,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: maximum.maxContextTokens + 1,
                    simulated: true, qualification: true, runtimePolicy: policy)
                c.expect("same-policy next token fails \(prefix)", next == nil)
            }
        }
        c.expect("negative scope start is refused", PrefillSchedule.scopePasses(remaining: 10,
            at: -1, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        c.expect("overflowing scope is refused", PrefillSchedule.scopePasses(remaining: Int.max,
            at: 262140, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        let inputGuard = RequestController(configuration: try ContextConfiguration(), slackBytes: 0, availableGB: { 10 })
        do { try inputGuard.check(nextAllocationBytes: -1) } catch {}
        c.equal("negative public allocation cannot bypass guard", inputGuard.failure?.code, .invalidConfiguration)
        c.equal("negative public workspace scope refuses safely", ContextWorkspace.prefillBytes(pass: 64, context: 1024, scope: Int.min), Int.max)
        var nested = JSONValue.string("payload")
        for _ in 0 ..< 64 { nested = .array([nested]) }
        c.equal("deep input is bounded before template recursion", ContextInputMemory.bytes(nested), Int.max)
        let tool = ToolDefinition(name: "read", description: "description", parameters: .object(["long": .string(String(repeating: "x", count: 5000))]))
        c.expect("tool schema charged before tokenization", ContextInputMemory.bytes(messages: [], tools: [tool]) >= 5000)
        // Freeze a whole-machine reading, then account for what an existing
        // instance actually owns. Restart planning and a settled governor
        // must agree across cap, retention, mode and availability changes.
        var governorCaps = Set<Int>()
        for cap in [8192, 32768, 65536, 131072, 262144] {
            for prefix in [false, true] {
                let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
                for mode in [0, 1, 2] where mode == 0 || cap <= 65536 {
                    for whole in [10.0, 18.0, 44.0] {
                        let label = "governor \(cap)/prefix=\(prefix)/mode=\(mode)/available=\(whole)"
                        let initial = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: whole,
                            mtp: mode == 1 ? .on : .off, mtpAvailable: mode == 1,
                            vision: mode == 2 ? .on : .off, visionAvailable: mode == 2,
                            visionResidentReserved: mode == 2, maxContextTokens: cap,
                            qualification: true, runtimePolicy: policy)
                        guard let initial else { continue }
                        let additional = ContextGeometry.additionalActiveBytes(tokens: cap, mtp: mode == 1)
                        let held = prefix ? min(initial.prefixCacheTokens, 8192) * PrefixCache.bytesPerToken : 0
                        let owned = additional + held + (held > 0 ? PrefixCache.fixedBytesPerEntry : 0)
                        let physical = whole - initial.poolGB - Planner.fixedFootprintGB
                            - (mode == 1 ? Planner.mtpResidentGB : 0)
                            - (mode == 2 ? Planner.visionResidentGB : 0) - Double(owned) / 1e9
                        guard physical >= 0 else { continue }
                        governorCaps.insert(cap)
                        var input = GovernorPolicy.Inputs(currentSlots: initial.slots, availableGB: physical,
                            ramGB: 51.5, workingSetGB: 40.2, mtpEnabled: mode == 1,
                            visionEnabled: mode == 2, visionResidentReserved: mode == 2,
                            maxContextTokens: cap, runtimeAllocationPolicy: policy,
                            ownedAdditionalBytes: owned, contextQualification: true)
                        let settled = GovernorPolicy.desiredPlan(input)
                        c.expect("\(label): same allocation after ownership credit", settled.map { abs($0.slots - initial.slots) <= 1 } ?? false)
                        c.equal("\(label): settled policy holds", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): chunk policy persists", settled?.prefillChunk, 256)
                        c.equal("\(label): mode persists", settled?.mtpEnabled, mode == 1)
                        if !prefix { c.equal("\(label): no retention resurrection", settled?.prefixCacheTokens, 0) }
                        input.pressure = .critical
                        let decision = GovernorPolicy.decide(input)
                        if case .resize(let slots, _) = decision {
                            c.expect("\(label): pressure gives memory back", slots < input.currentSlots && slots >= Geometry.floorSlots)
                            input.availableGB += Geometry.gb(input.currentSlots - slots)
                            input.currentSlots = slots
                        }
                        input.pressure = nil; input.secondsSincePressure = 1
                        c.equal("\(label): recovery respects cooldown", GovernorPolicy.decide(input), .hold)
                        input.secondsSincePressure = 61; input.secondsSinceResize = 61
                        if case .resize(let slots, _) = GovernorPolicy.decide(input) {
                            input.availableGB -= Geometry.gb(slots - input.currentSlots)
                            input.currentSlots = slots
                        }
                        c.equal("\(label): one recovery step settles", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): context survives recovery", GovernorPolicy.desiredPlan(input)?.maxContextTokens, cap)
                    }
                }
            }
        }
        c.equal("governor matrix executes every intended cap", governorCaps, Set([8192, 32768, 65536, 131072, 262144]))
        return c.report()
    }
}

````

Artifact `/tmp/slotstream-optimization-execution/governor-feasibility-v194/before/Sources/Slotstream/Governor.swift` — 20481 bytes; SHA-256 `af44af93916c9fcbea08744c9d343915e65914edf69909dfe25c420ff0b9a129`.

````text
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
import MLX

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
        /// The RAM share auto may target; mirrors --max-ram-percent.
        public var ramPercent: Double
        public var mtpEnabled: Bool
        public var visionEnabled: Bool
        public var visionResidentReserved: Bool
        public var maxContextTokens: Int
        public var runtimeAllocationPolicy: RuntimeAllocationPolicy?
        public var ownedAdditionalBytes: Int
        public var contextQualification: Bool
        /// nil = no such event yet in this process.
        public var secondsSincePressure: Double?
        public var secondsSinceResize: Double?
        /// Set when this tick is an OS pressure event rather than a poll.
        public var pressure: Pressure?

        public init(
            currentSlots: Int, availableGB: Double, ramGB: Double, workingSetGB: Double,
            ramPercent: Double = Planner.defaultRAMPercent,
            secondsSincePressure: Double? = nil, secondsSinceResize: Double? = nil,
            pressure: Pressure? = nil,
            mtpEnabled: Bool = false, visionEnabled: Bool = false,
            visionResidentReserved: Bool = false,
            maxContextTokens: Int = ContextPolicy.defaultTokens,
            runtimeAllocationPolicy: RuntimeAllocationPolicy? = nil,
            ownedAdditionalBytes: Int = 0, contextQualification: Bool = false
        ) {
            self.ramPercent = ramPercent
            self.currentSlots = currentSlots
            self.availableGB = availableGB
            self.ramGB = ramGB
            self.workingSetGB = workingSetGB
            self.secondsSincePressure = secondsSincePressure
            self.secondsSinceResize = secondsSinceResize
            self.pressure = pressure
            self.mtpEnabled = mtpEnabled
            self.visionEnabled = visionEnabled
            self.visionResidentReserved = visionResidentReserved
            self.maxContextTokens = maxContextTokens
            self.runtimeAllocationPolicy = runtimeAllocationPolicy
            self.ownedAdditionalBytes = max(0, ownedAdditionalBytes)
            self.contextQualification = contextQualification
        }
    }

    public enum Decision: Equatable {
        case hold
        case resize(slots: Int, reason: String)
    }

    public static let growCooldown: TimeInterval = 60
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
    public static func desiredPlan(_ i: Inputs) -> MemoryPlan? {
        let credited = i.availableGB + Geometry.gb(i.currentSlots) + Planner.fixedFootprintGB
            + (i.mtpEnabled ? Planner.mtpResidentGB : 0)
            + (i.visionResidentReserved ? Planner.visionResidentGB : 0)
            + Double(i.ownedAdditionalBytes) / 1e9
        guard let plan = try? Planner.plan(
            expertsPerLayer: nil, poolGB: nil, memoryGB: nil,
            ramGB: i.ramGB, workingSetGB: i.workingSetGB, availableGB: credited,
            ramPercent: i.ramPercent,
            mtp: i.mtpEnabled ? .on : .off, mtpAvailable: i.mtpEnabled,
            vision: i.visionEnabled ? .on : .off, visionAvailable: i.visionEnabled,
            visionResidentReserved: i.visionResidentReserved, maxContextTokens: i.maxContextTokens,
            qualification: i.contextQualification, runtimePolicy: i.runtimeAllocationPolicy),
            plan.mtpEnabled == i.mtpEnabled else { return nil }
        // A startup planner may decline a head under pressure, but the live
        // governor has no operation that unloads an already resident head.
        return plan
    }

    public static func desiredSlots(_ i: Inputs) -> Int? {
        desiredPlan(i)?.slots
    }

    /// Live allocation controls for a resize. Availability-driven targets come
    /// directly from a fresh planner result, so preserve that result's prefill
    /// and prefix budgets. Deriving them again from the already-net expert pool
    /// double-subtracts their cost: at the 33 GB knee it downgraded a recovered
    /// server from the planned 4096-token pass to 2048. A pressure-event target
    /// can be an arbitrary extra shed, so it deliberately uses the conservative
    /// pool-only fallback.
    public static func liveControls(
        for targetSlots: Int, inputs i: Inputs
    ) -> (prefillChunk: Int, prefixCacheTokens: Int) {
        if let p = desiredPlan(i), p.slots == targetSlots {
            return (p.prefillChunk, p.prefixCacheTokens)
        }
        let gb = Geometry.gb(targetSlots)
        return (
            min(Planner.prefillChunkFor(poolBudgetGB: gb, contextCap: i.maxContextTokens), i.runtimeAllocationPolicy?.prefillChunkOverride ?? 4096),
            i.runtimeAllocationPolicy?.prefixCacheEnabled == false ? 0 : Planner.prefixCacheTokensFor(poolBudgetGB: gb, contextCap: i.maxContextTokens))
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
        guard let d = desired else { return settle(Geometry.floorSlots, i.currentSlots, "context plan unavailable") }
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

public final class MemoryGovernor: @unchecked Sendable {
    private let engine: Engine
    private let queue = DispatchQueue(label: "slotstream.governor")
    private let queueKey = DispatchSpecificKey<UInt8>()
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
        queue.setSpecific(key: queueKey, value: 1)
    }

    // All daemon state, including start/stop and diagnostic events, belongs
    // to the queue. Engine allocation and metadata have their own locks.
    private func onQueue<T>(_ body: () -> T) -> T {
        if DispatchQueue.getSpecific(key: queueKey) != nil { return body() }
        return queue.sync(execute: body)
    }

    public func start() {
        onQueue { startOnQueue() }
    }

    private func startOnQueue() {
        guard pressure == nil, timer == nil else { return }
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

    /// Enqueue cancellation without waiting behind a pressure event that is
    /// itself waiting for the caller's generation lock. A later start() is
    /// serialized after this cancellation.
    public func stop() {
        if DispatchQueue.getSpecific(key: queueKey) != nil { stopOnQueue() }
        else { queue.async { self.stopOnQueue() } }
    }

    private func stopOnQueue() {
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
            ramPercent: cur.ramPercent,
            secondsSincePressure: lastPressureAt.map { now.timeIntervalSince($0) },
            secondsSinceResize: lastResizeAt.map { now.timeIntervalSince($0) },
            pressure: pressure,
            mtpEnabled: cur.mtpEnabled, visionEnabled: cur.visionEnabled,
            visionResidentReserved: cur.visionResidentReserved,
            maxContextTokens: cur.maxContextTokens,
            runtimeAllocationPolicy: cur.runtimeAllocationPolicy,
            ownedAdditionalBytes: engine.prefixCache.ownedAdditionalBytes(mtpResident: cur.mtpEnabled),
            contextQualification: cur.contextQualification)
    }

    /// OS pressure events see what availability math cannot: compressor and
    /// swap strain from system-wide overcommit. Shed an absolute chunk —
    /// repeated events keep shedding until the pressure stops.
    private func onPressure(critical: Bool) {
        lastPressureAt = Date()
        act(critical ? .critical : .warning)
    }

    private func poll() { act(nil) }

    /// Run one poll cycle immediately, as the 15 s timer would.
    ///
    /// Exists so the *governor* can be driven end to end — poll, decide, take
    /// the generation lock, resize, update the plan, log — rather than only its
    /// policy function. `slotstream elastic-drill` uses it with
    /// `Planner.availabilityOverride` so that path is covered without putting
    /// the machine under real memory pressure, which is the one way this had
    /// never been exercised on a shipped build.
    public func pollNow() { onQueue { act(nil) } }

    /// Bounded diagnostic event; uses the real queue and resize path without
    /// inducing OS pressure or inventing additional available memory.
    package func pressureNow(_ pressure: GovernorPolicy.Pressure, requested: (() -> Void)? = nil) {
        onQueue {
            lastPressureAt = Date()
            act(pressure, requested: requested)
        }
    }

    private func act(_ pressure: GovernorPolicy.Pressure?, requested: (() -> Void)? = nil) {
        // Read policy and mutate the arena under one generation lock. A first
        // image can reserve resident memory while a governor tick is waiting;
        // a decision sampled before the lock would spend that reservation.
        let applyDecision = {
            guard let i = self.inputs(pressure: pressure) else { return }
            self.engine.setAllocationUnavailable(GovernorPolicy.desiredPlan(i) == nil
                ? RequestFailure(.insufficientMemory, "the configured context no longer fits current availability; retry after memory recovers") : nil)
            if pressure != nil {
                // Even at the arena floor there can be inexpensive memory to
                // return. No live reader exists while this gate is held.
                self.engine.prefixCache.drop()
                MLX.Memory.clearCache()
            }
            if case let .resize(slots, reason) = GovernorPolicy.decide(i) {
                let controls = GovernorPolicy.liveControls(for: slots, inputs: i)
                self.apply(
                    slots, plan: self.engine.currentPlan, reason: reason,
                    prefillChunk: controls.prefillChunk,
                    prefixCacheTokens: controls.prefixCacheTokens)
            }
        }
        // Request cancellation observes pressure independently of optimization controls.
        guard engine.currentPlan?.source == .auto else { requested?(); return }
        if pressure == nil {
            engine.tryWithExclusive(applyDecision)
        } else {
            let ticket = engine.pressureBoundary.request()
            requested?()
            engine.withExclusive {
                defer { engine.pressureBoundary.acknowledge(ticket) }
                applyDecision()
            }
        }
    }

    private func apply(
        _ slots: Int, plan: MemoryPlan?, reason: String,
        prefillChunk: Int, prefixCacheTokens: Int
    ) {
        let target = slots  // already clamped by GovernorPolicy.decide
        let before = engine.model.pool.slots
        guard target != before else { return }
        let growing = target > before
        let ref = plan ?? engine.currentPlan
        // --max-context is also a hard ceiling on any one retained history.
        // A later governor resize must not undo the cap Serve applied at startup.
        let livePrefixTokens = min(prefixCacheTokens, engine.maxContextTokens)
        var after = before
        do {
            // Shrinking means memory is wanted elsewhere. The retained
            // conversation state is the cheapest thing to give back — up to
            // ~0.9 GB, recovered by one re-prefill on the next turn — so it
            // goes before the pool is starved further. Growing keeps it: the
            // machine has room and the next turn should still be fast.
            if !growing { engine.prefixCache.drop() }
            engine.model.pool.resize(to: target)
            after = engine.model.pool.slots
            engine.publishPoolSnapshot()
            // These are live allocation controls, not merely fields in the
            // reported plan. Leaving startup values here let a shrunken server
            // allocate the old large prefill and refill the old cache ceiling.
            if ref?.runtimeAllocationPolicy != nil {
                engine.generator.setPrefillBudgetCeiling(prefillChunk)
                engine.prefixCache.setBudgetLimit(livePrefixTokens)
            }
            engine.generator.prefillChunk = prefillChunk
            engine.prefixCache.configure(maxTokens: livePrefixTokens)
            engine.updatePlan(MemoryPlan(
                source: .auto, slots: after, targetGB: ref?.targetGB,
                ramGB: ref?.ramGB ?? Planner.deviceRAMGB(),
                workingSetGB: ref?.workingSetGB ?? Planner.deviceWorkingSetGB(),
                ramPercent: ref?.ramPercent ?? Planner.defaultRAMPercent,
                availableGB: ref?.availableGB, clamped: ref?.clamped ?? false,
                prefillChunk: prefillChunk, prefixCacheTokens: livePrefixTokens,
                mtpEnabled: ref?.mtpEnabled ?? false,
                visionEnabled: ref?.visionEnabled ?? false,
                visionResidentReserved: ref?.visionResidentReserved ?? false,
                maxContextTokens: engine.maxContextTokens,
                notes: [String(
                    format: "elastic: resized ~%.0f → ~%.0f experts/layer (%@)",
                    Geometry.perLayer(before), Geometry.perLayer(after), reason)],
                runtimeAllocationPolicy: ref?.runtimeAllocationPolicy,
                maxPrefillWaitMinutes: ref?.maxPrefillWaitMinutes ?? 30,
                contextQualification: ref?.contextQualification ?? false))
        }
        lastResizeAt = Date()
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

````

Artifact `/tmp/slotstream-optimization-execution/governor-feasibility-v194/before/Sources/SlotstreamDiagnostics/Diagnostics+Context.swift` — 27771 bytes; SHA-256 `f4419fbe8e88de30cec00761fad4507e41ce611ffe4cef2f87175c7423e7e4b5`.

````text
import Foundation
import Slotstream

extension Diagnostics {
    public static func configurableContext() throws -> CheckReport {
        var c = CheckBuilder("configurable-context")
        let cacheModel = UUID(), cacheOptions = InferenceOptimizations()
        let currentKey = PromptCheckpointKey(model: cacheModel, optimizations: cacheOptions,
            prefillChunk: 256, mtp: false)
        c.equal("prompt cache defaults to the current arithmetic epoch", currentKey.contextArithmetic, 1)
        c.expect("old arithmetic cannot match a current prompt checkpoint", currentKey != PromptCheckpointKey(
            model: cacheModel, optimizations: cacheOptions, prefillChunk: 256, mtp: false, contextArithmetic: 0))
        let caps = [1, 1024, 4096, 8192, 32768, 32769, 65535, 65536, 65537,
                    128255, 128256, 128257, 131071, 131072, 131073, 262143, 262144]
        for cap in caps {
            let bytes = ContextGeometry.sequenceBytes(tokens: cap)
            // Independent allocator geometry, not a restatement of a helper call.
            let rows = ((cap + 1023) / 1024) * 1024
            c.equal("main allocated capacity \(cap)", bytes, rows * 12 * (2 * 2 * 256 + 128) * 2)
            c.equal("MTP allocated capacity \(cap)", ContextGeometry.sequenceBytes(tokens: cap, mtp: true),
                    rows * 13 * (2 * 2 * 256 + 128) * 2)
        }
        c.equal("overflowing capacity is refused", ContextGeometry.sequenceBytes(tokens: Int.max), Int.max)
        c.equal("negative capacity is refused", ContextGeometry.sequenceBytes(tokens: -1), Int.max)
        // These represent separately owned buffers, including different spare
        // main/draft capacities after rollback. A large unrelated buffer cannot
        // pay for a replacement, and old storage is not yet reclaimable.
        let keyRow = 2 * 256 * 2
        let mainGrowth = ContextGeometry.nextBufferAllocationBytes(tokens: 1025,
            rowBytes: keyRow, allocatedBytes: 1024 * keyRow)
        let draftSpare = ContextGeometry.nextBufferAllocationBytes(tokens: 1024,
            rowBytes: keyRow, allocatedBytes: 4096 * keyRow)
        c.equal("main growth charges complete replacement", mainGrowth, 2048 * keyRow)
        c.equal("draft can reuse its own spare rows", draftSpare, 0)
        c.equal("draft spare does not offset main growth", mainGrowth + draftSpare, 2048 * keyRow)
        c.equal("matching buffer reuses existing capacity", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1024, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 0)
        c.equal("absent pooled indexer needs its own allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1025, rowBytes: 256, allocatedBytes: 0, step: 256), 1280 * 256)
        c.equal("compact raw growth preserves its 256-row step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 304, rowBytes: 256, allocatedBytes: 256 * 256, step: 256), 512 * 256)
        c.equal("compact tail copy is a new allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 32, rowBytes: 256, allocatedBytes: 0, step: 256), 256 * 256)
        c.equal("provisional batch crosses the next allocation step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1023 + 1 + 16, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 2048 * keyRow)
        c.equal("checkpoint copy cannot spend shared backing", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1000, rowBytes: keyRow, allocatedBytes: 0), 1024 * keyRow)
        c.equal("invalid allocation geometry refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: Int.max, rowBytes: keyRow, allocatedBytes: 0), Int.max)
        c.equal("negative owned byte count refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1, rowBytes: keyRow, allocatedBytes: -1), Int.max)
        for room in 0 ... 18 {
            let depth = ContextPolicy.maximumDraftDepth(requested: 16, at: 65536 - room, limit: 65536)
            c.equal("provisional context bounds draft depth/\(room)", depth, min(16, max(0, room - 1)))
            if room > 0 { c.expect("pending plus drafts remain inside context/\(room)", 1 + depth <= room) }
        }
        c.equal("Hermes transient anchor remains fixed", ContextMemoryLedger.transientReserveBytes(context: 65536), 905_969_664)
        c.equal("default has no extra reserve", ContextMemoryLedger.transientReserveBytes(context: 32768), 0)
        // Concurrent requests see one unchanged injected reading. Atomic
        // reservations, not real large allocations, decide how many fit.
        let reservations = RequestMemoryReservations()
        let resultLock = NSLock()
        var accepted: [RequestController] = []
        var refusals = 0
        let reservationPolicy = try ContextConfiguration(maxPrefillWaitMinutes: 0)
        DispatchQueue.concurrentPerform(iterations: 8) { _ in
            let control = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000,
                availableGB: { 0.010 })
            do {
                try control.attachReservations(reservations)
                try control.reservePreparedImageBytes(4_000_000)
                resultLock.withLock { accepted.append(control) }
            } catch { resultLock.withLock { refusals += 1 } }
        }
        c.equal("concurrent preparations cannot spend the same headroom", accepted.count, 2)
        c.equal("excess concurrent preparations refuse before allocation", refusals, 6)
        c.equal("queued decoded pixels remain reserved", reservations.reservedBytes, 8_000_000)
        if let active = accepted.first {
            do { try active.check(nextAllocationBytes: 3_000_000, phase: "test active generation") } catch {}
            c.equal("generation cannot spend queued preparation ownership", active.failure?.code, .insufficientMemory)
            c.equal("failed dispatch preserves retained-pixel reservations", reservations.reservedBytes, 8_000_000)
        }
        var retainedPreparation: RequestController? = accepted.popLast()
        accepted.removeAll()
        c.equal("prepared-image owner keeps its lease after request queue release", reservations.reservedBytes, 4_000_000)
        withExtendedLifetime(retainedPreparation) {}
        retainedPreparation = nil
        c.equal("last preparation owner releases its exact reservation", reservations.reservedBytes, 0)
        do {
            let fresh = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000, availableGB: { 0.010 })
            try fresh.attachReservations(reservations)
            try fresh.checkInputBytes(100_000)
            try fresh.checkInputBytes(1)
            c.equal("shorter later input check cannot release retained copies", reservations.reservedBytes, 1_600_000)
            try fresh.check(nextAllocationBytes: 4_000_000, phase: "test dispatch")
            c.equal("prepared and pending dispatch bytes are separately reserved", reservations.reservedBytes, 5_600_000)
            fresh.releaseDispatchReservation()
            c.equal("completed dispatch releases only transient ownership", reservations.reservedBytes, 1_600_000)
        }
        c.equal("request completion returns all reservations", reservations.reservedBytes, 0)
        for cap in caps {
            for target in [8.1, 10, 16, 24, 33] {
                for mtp in [Planner.MTPMode.off, .on, .auto] {
                    do {
                        let p = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44,
                            mtp: mtp, mtpAvailable: true, vision: .off, maxContextTokens: cap,
                            simulated: true, qualification: true)
                        c.expect("fit \(cap)/\(target)/\(mtp)", p.memoryLedger.expectedPeakBytes <= Int(target * 1e9))
                        c.equal("preserve window \(cap)/\(target)/\(mtp)", p.maxContextTokens, cap)
                        if mtp == .on { c.expect("forced MTP stays on \(cap)/\(target)", p.mtpEnabled) }
                    } catch {
                        c.expect("bounded refusal \(cap)/\(target)/\(mtp)", !String(describing: error).isEmpty)
                    }
                }
            }
        }
        let baseline = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off, simulated: true)
        let small = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off,
            maxContextTokens: 1024, simulated: true)
        c.expect("short cap refunds retention instead of reserving 32K", small.prefixCacheTokens <= 1024 && small.slots > baseline.slots)
        let machine = Machine.simulated(ramGB: 51.5, workingSetGB: 40.2, availableGB: 44)
        for target in [8.1, 10, 16, 24, 33] {
            let request = PlanRequest(memoryGB: target, mtp: .off, vision: .off, maxContextTokens: ContextPolicy.modelLimit)
            let result = Planner.contextFeasibility(request, on: machine, qualification: true)
            c.expect("solver maximum accepted at \(target)", result.maximumPlan != nil)
            if result.maximumFeasibleWindow < ContextPolicy.modelLimit {
                let next = result.maximumFeasibleWindow + 1
                let p = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: next, simulated: true, qualification: true)
                c.expect("next solver token refused at \(target)", p == nil)
            }
        }
        for chunk in [64, 128, 256, 512, 1024, 2048, 4096] {
            for start in [0, 1, 32768, 65535, 128255, 128256, 128257, 131071, 262079, 262143] {
                let count = ContextPolicy.modelLimit - start
                var position = start
                let passes = PrefillSchedule.passes(tokens: count, from: start, maxChunk: chunk)
                var bounded = !passes.isEmpty
                for n in passes {
                    // Ordinary scheduling has always clamped small batch
                    // overrides up to 256. The 64-row floor applies only
                    // after the 256-row query/key product no longer fits.
                    let floor = 256 * (position + 256) <= 4096 * 8016 ? 256 : 64
                    bounded = bounded && n > 0 && n <= max(floor, chunk)
                        && n * (position + n) <= 4096 * 8016
                    position += n
                }
                c.expect("bounded schedule \(chunk) from \(start)", bounded && position == ContextPolicy.modelLimit)
            }
        }
        c.expect("overflowing schedule is refused", PrefillSchedule.passes(tokens: Int.max, from: Int.max, maxChunk: 4096).isEmpty)
        c.expect("uncalibrated late schedule is unknown", PrefillSchedule.estimateSeconds(tokens: 262144, maxChunk: 4096) == nil)
        c.expect("Hermes schedule retains an estimate", PrefillSchedule.estimateSeconds(tokens: 65536, maxChunk: 4096) != nil)
        let oddLate = PrefillSchedule.computePasses(tokens: 512, from: 200000, maxChunk: 4095)
        c.equal("diagnostic odd late schedule matches the canonical runtime shape", oddLate.map(\.tokens), Array(repeating: 64, count: 8))
        c.equal("diagnostic includes masked canonical columns", oddLate.map(\.keyExtent),
            Array(repeating: 200256, count: 4) + Array(repeating: 200512, count: 4))
        c.expect("diagnostic includes physical query rows", oddLate.allSatisfy { $0.queryRows == 64 })
        let paddedTail = PrefillSchedule.computePasses(tokens: 449, from: 200000, maxChunk: 4095)
        c.equal("diagnostic tail reports its padded query geometry", paddedTail.last?.queryRows, 64)
        c.equal("diagnostic tail preserves its one logical token", paddedTail.last?.tokens, 1)

        var tick: UInt64 = 0
        var available = 10.0
        var connected = true
        var pressure = false
        func controller(wait: Double = 1, cap: Int = 65536) throws -> RequestController {
            try RequestController(configuration: ContextConfiguration(maxContextTokens: cap, maxPrefillWaitMinutes: wait),
                slackBytes: 1_500_000_000, clock: { tick }, availableGB: { available },
                connected: { connected }, pressure: { pressure })
        }
        for invalid in [Double.nan, .infinity, -.infinity, -1, Double.greatestFiniteMagnitude] {
            c.expect("invalid duration \(invalid) refused", (try? ContextConfiguration(maxPrefillWaitMinutes: invalid)) == nil)
        }
        let estimated = try controller()
        do { try estimated.admit(missingTokens: 32768, from: 0, maxChunk: 256) } catch {}
        c.equal("cold estimate refuses before prefill", estimated.failure?.code, .prefillWaitExceeded)
        let reused = try controller()
        try reused.admit(missingTokens: 32, from: 64000, maxChunk: 4096)
        c.expect("fast continuation admits from its real position", reused.failure == nil)
        tick = 61_000_000_000
        do { try reused.check(phase: "image preparation") } catch {}
        c.equal("elapsed preparation still trips deadline", reused.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let queue = try controller()
        tick = 61_000_000_000
        do { try queue.check(phase: "queue") } catch {}
        c.equal("queue uses same clock", queue.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let decoding = try controller()
        decoding.sampledFirstToken(); tick = 61_000_000_000
        try decoding.check(phase: "decode")
        c.expect("decode does not inherit the prefill deadline", decoding.failure == nil)
        let timeless = try controller(wait: 0)
        tick += 100_000_000_000; try timeless.check()
        available = 1
        do { try timeless.check(nextAllocationBytes: 1) } catch {}
        c.equal("zero time policy retains memory guard", timeless.failure?.code, .insufficientMemory)
        available = 3
        let growth = try controller(wait: 0)
        do { try growth.check(nextAllocationBytes: 2_000_000_000) } catch {}
        c.equal("next allocation is charged before it starts", growth.failure?.code, .insufficientMemory)
        available = 10; pressure = true
        let pressed = try controller(wait: 0)
        do { try pressed.check() } catch {}
        c.equal("pressure is independent of time", pressed.failure?.code, .insufficientMemory)
        pressure = false; connected = false
        let cancelled = try controller()
        do { try cancelled.check() } catch {}
        c.equal("disconnect is typed cancellation", cancelled.failure?.code, .clientCancelled)
        c.expect("failed request cannot retain state", !cancelled.mayRetainState)
        let unknown = RequestController(configuration: try ContextConfiguration(maxContextTokens: 65536),
            slackBytes: 1_500_000_000, availableGB: { nil })
        do { try unknown.check(nextAllocationBytes: 1) } catch {}
        c.equal("unknown memory refuses long-state growth", unknown.failure?.code, .insufficientMemory)
        var governor = GovernorPolicy.Inputs(currentSlots: 2000, availableGB: 4, ramGB: 51.5,
            workingSetGB: 40.2, maxContextTokens: 65536)
        let empty = GovernorPolicy.desiredPlan(governor)
        governor.ownedAdditionalBytes = 1_000_000_000
        let owned = GovernorPolicy.desiredPlan(governor)
        c.expect("owned memory changes replan credit", (owned?.targetGB ?? 0) > (empty?.targetGB ?? 0))
        c.equal("request cap survives ownership credit", owned?.maxContextTokens, 65536)
        governor.availableGB = 0; governor.currentSlots = Geometry.floorSlots
        governor.maxContextTokens = ContextPolicy.modelLimit; governor.contextQualification = true
        governor.ownedAdditionalBytes = 0
        c.expect("infeasible governor plan is explicit", GovernorPolicy.desiredPlan(governor) == nil)
        c.equal("overflowing public ledger saturates to refusal", ContextMemoryLedger(slots: Int.max,
            context: Int.max, chunk: Int.max, retentionTokens: Int.max, mtp: true, visionResident: true).expectedPeakBytes, Int.max)
        let originalVision = ContextWorkspace.visionBytes(patches: 9216)
        let tiledVision = ContextWorkspace.visionBytes(patches: 9216, queryTile: 256)
        c.expect("vision charge uses actual query bound", originalVision > tiledVision * 4)
        c.equal("unsupported vision mode is refused", ContextWorkspace.visionBytes(patches: 9216, queryTile: 512), Int.max)
        c.expect("late 64 pass retains context-dependent workspace", ContextWorkspace.prefillBytes(pass: 64, context: 262144) > 64 * 1_300_000)
        for override in [1, 64, 128, 256, 257, 511, 513, 1023, 2047, 4095, 4096] {
            for position in [0, 32768, 65535, 65536] {
                c.expect("ordinary window preserves original floor/\(override)/\(position)",
                    PrefillSchedule.chunk(at: position, maxChunk: override) >= 256)
            }
        }
        c.equal("projection shape padding is charged before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 256), 256 * 1_300_000)
        c.equal("invalid projection shape refuses before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 257), Int.max)
        c.equal("unbounded 128 final pass is refused", ContextWorkspace.prefillBytes(pass: 128, context: 262144), Int.max)
        c.equal("small attention domain stops at actual prompt end", ContextWorkspace.keyExtent(pass: 64,
            context: 448, referenceEnd: 470), 470)
        c.equal("small attention domain follows exact prefix origin", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 17, referenceEnd: 515), 273)
        c.equal("invalid reference domain fails closed", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 18, referenceEnd: 515), Int.max)
        c.equal("one-row tail preserves matrix query dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 449, referenceEnd: 449), 64)
        c.equal("canonical one-row terminal keeps vector dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 513, referenceEnd: 513), 1)
        c.equal("one-row tail prices its real key domain", ContextWorkspace.keyExtent(pass: 1,
            context: 449, referenceEnd: 449), 449)
        c.expect("padded tail workspace includes physical queries", ContextWorkspace.prefillBytes(pass: 1,
            context: 262143, referenceEnd: 262144, minimumProjectionRows: 256, padSmallQueries: true)
            >= 64 * 262144 * (24 * 8 + 16))
        for override in [64, 68, 127, 128, 136, 137, 255] {
            c.equal("late odd override selects a qualified full-pass shape/\(override)",
                ContextWorkspace.boundedSmallPass(requested: override, at: 200000,
                    referenceStart: 200000, referenceEnd: 262144), override >= 128 ? 128 : 64)
        }
        for origin in [0, 1, 17, 130001, 131073] {
            var position = max(origin, 256273), total = 0
            while position < ContextPolicy.modelLimit {
                let n = ContextWorkspace.boundedSmallPass(requested: 128, at: position,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                guard n > 0 else { c.expect("small-pass schedule advances/\(origin)", false); break }
                let extent = ContextWorkspace.keyExtent(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                let queries = ContextWorkspace.queryRows(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                c.expect("actual padded product stays bounded/\(origin)/\(position)",
                    queries * extent <= PrefillSchedule.measuredQueryKeyProduct)
                c.expect("small pass never crosses its reference domain/\(origin)/\(position)",
                    n <= 256 - ((position - origin) % 256))
                position += n; total += n
            }
            c.equal("small-pass schedule closes/\(origin)", total, ContextPolicy.modelLimit - max(origin, 256273))
        }
        let busy = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
            on: Machine.simulated(ramGB: 16, workingSetGB: 12, availableGB: 5))
        c.equal("busy machine never calls an unphysical window feasible", busy.maximumFeasibleWindow, 0)
        for prefix in [false, true] {
            let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
            let result = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
                on: machine, runtimePolicy: policy, qualification: true)
            c.expect("solver freezes actual retention policy \(prefix)", result.maximumPlan?.runtimeAllocationPolicy == policy)
            if let maximum = result.maximumPlan, maximum.maxContextTokens < ContextPolicy.modelLimit {
                let next = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 10,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: maximum.maxContextTokens + 1,
                    simulated: true, qualification: true, runtimePolicy: policy)
                c.expect("same-policy next token fails \(prefix)", next == nil)
            }
        }
        c.expect("negative scope start is refused", PrefillSchedule.scopePasses(remaining: 10,
            at: -1, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        c.expect("overflowing scope is refused", PrefillSchedule.scopePasses(remaining: Int.max,
            at: 262140, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        let inputGuard = RequestController(configuration: try ContextConfiguration(), slackBytes: 0, availableGB: { 10 })
        do { try inputGuard.check(nextAllocationBytes: -1) } catch {}
        c.equal("negative public allocation cannot bypass guard", inputGuard.failure?.code, .invalidConfiguration)
        c.equal("negative public workspace scope refuses safely", ContextWorkspace.prefillBytes(pass: 64, context: 1024, scope: Int.min), Int.max)
        var nested = JSONValue.string("payload")
        for _ in 0 ..< 64 { nested = .array([nested]) }
        c.equal("deep input is bounded before template recursion", ContextInputMemory.bytes(nested), Int.max)
        let tool = ToolDefinition(name: "read", description: "description", parameters: .object(["long": .string(String(repeating: "x", count: 5000))]))
        c.expect("tool schema charged before tokenization", ContextInputMemory.bytes(messages: [], tools: [tool]) >= 5000)
        // Freeze a whole-machine reading, then account for what an existing
        // instance actually owns. Restart planning and a settled governor
        // must agree across cap, retention, mode and availability changes.
        var governorCaps = Set<Int>()
        for cap in [8192, 32768, 65536, 131072, 262144] {
            for prefix in [false, true] {
                let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
                for mode in [0, 1, 2] where mode == 0 || cap <= 65536 {
                    for whole in [10.0, 18.0, 44.0] {
                        let label = "governor \(cap)/prefix=\(prefix)/mode=\(mode)/available=\(whole)"
                        let initial = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: whole,
                            mtp: mode == 1 ? .on : .off, mtpAvailable: mode == 1,
                            vision: mode == 2 ? .on : .off, visionAvailable: mode == 2,
                            visionResidentReserved: mode == 2, maxContextTokens: cap,
                            qualification: true, runtimePolicy: policy)
                        guard let initial else { continue }
                        let additional = ContextGeometry.additionalActiveBytes(tokens: cap, mtp: mode == 1)
                        let held = prefix ? min(initial.prefixCacheTokens, 8192) * PrefixCache.bytesPerToken : 0
                        let owned = additional + held + (held > 0 ? PrefixCache.fixedBytesPerEntry : 0)
                        let physical = whole - initial.poolGB - Planner.fixedFootprintGB
                            - (mode == 1 ? Planner.mtpResidentGB : 0)
                            - (mode == 2 ? Planner.visionResidentGB : 0) - Double(owned) / 1e9
                        guard physical >= 0 else { continue }
                        governorCaps.insert(cap)
                        var input = GovernorPolicy.Inputs(currentSlots: initial.slots, availableGB: physical,
                            ramGB: 51.5, workingSetGB: 40.2, mtpEnabled: mode == 1,
                            visionEnabled: mode == 2, visionResidentReserved: mode == 2,
                            maxContextTokens: cap, runtimeAllocationPolicy: policy,
                            ownedAdditionalBytes: owned, contextQualification: true)
                        let settled = GovernorPolicy.desiredPlan(input)
                        c.expect("\(label): same allocation after ownership credit", settled.map { abs($0.slots - initial.slots) <= 1 } ?? false)
                        c.equal("\(label): settled policy holds", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): chunk policy persists", settled?.prefillChunk, 256)
                        c.equal("\(label): mode persists", settled?.mtpEnabled, mode == 1)
                        if !prefix { c.equal("\(label): no retention resurrection", settled?.prefixCacheTokens, 0) }
                        input.pressure = .critical
                        let decision = GovernorPolicy.decide(input)
                        if case .resize(let slots, _) = decision {
                            c.expect("\(label): pressure gives memory back", slots < input.currentSlots && slots >= Geometry.floorSlots)
                            input.availableGB += Geometry.gb(input.currentSlots - slots)
                            input.currentSlots = slots
                        }
                        input.pressure = nil; input.secondsSincePressure = 1
                        c.equal("\(label): recovery respects cooldown", GovernorPolicy.decide(input), .hold)
                        input.secondsSincePressure = 61; input.secondsSinceResize = 61
                        if case .resize(let slots, _) = GovernorPolicy.decide(input) {
                            input.availableGB -= Geometry.gb(slots - input.currentSlots)
                            input.currentSlots = slots
                        }
                        c.equal("\(label): one recovery step settles", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): context survives recovery", GovernorPolicy.desiredPlan(input)?.maxContextTokens, cap)
                    }
                }
            }
        }
        c.equal("governor matrix executes every intended cap", governorCaps, Set([8192, 32768, 65536, 131072, 262144]))
        return c.report()
    }
}

````

Artifact `/tmp/slotstream-optimization-execution/governor-feasibility-v194/fix.patch` — 3480 bytes; SHA-256 `e397891da2d5677bc13858c0be6363b60c4cffc5483763aa074c138d8194c6a0`.

````text
--- a/Sources/Slotstream/Governor.swift
+++ b/Sources/Slotstream/Governor.swift
@@ -120,6 +120,15 @@
             visionResidentReserved: i.visionResidentReserved, maxContextTokens: i.maxContextTokens,
             qualification: i.contextQualification, runtimePolicy: i.runtimeAllocationPolicy),
             plan.mtpEnabled == i.mtpEnabled else { return nil }
+        // Startup preserves a legacy advisory floor at ordinary contexts.
+        // A live governor must not interpret that advisory as permission to
+        // admit work after an infeasible replan. Price the complete resolved
+        // allocation against the same credited physical budget at every cap.
+        let physical = min(i.workingSetGB,
+            credited - Planner.availabilitySlackGB(ramGB: i.ramGB))
+        let peak = Double(plan.memoryLedger.expectedPeakBytes)
+        guard physical.isFinite, physical > 0, peak <= physical * 1e9,
+              plan.targetGB.map({ peak <= $0 * 1e9 }) ?? true else { return nil }
         // A startup planner may decline a head under pressure, but the live
         // governor has no operation that unloads an already resident head.
         return plan
--- a/Sources/SlotstreamDiagnostics/Diagnostics+Context.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+Context.swift
@@ -228,6 +228,30 @@
         governor.maxContextTokens = ContextPolicy.modelLimit; governor.contextQualification = true
         governor.ownedAdditionalBytes = 0
         c.expect("infeasible governor plan is explicit", GovernorPolicy.desiredPlan(governor) == nil)
+        for cap in [1, 1024, ContextPolicy.defaultTokens, ContextPolicy.mtpLimit] {
+            for mtp in [false, true] {
+                let exhausted = GovernorPolicy.Inputs(currentSlots: Geometry.floorSlots,
+                    availableGB: 0, ramGB: 51.5, workingSetGB: 40.2,
+                    mtpEnabled: mtp, maxContextTokens: cap)
+                c.expect("ordinary startup advisory cannot authorize live work/\(cap)/\(mtp)",
+                    GovernorPolicy.desiredPlan(exhausted) == nil)
+                c.equal("infeasible floor does not invent a smaller arena/\(cap)/\(mtp)",
+                    GovernorPolicy.decide(exhausted), .hold)
+                var recovered = exhausted
+                recovered.availableGB = 10
+                if let plan = GovernorPolicy.desiredPlan(recovered) {
+                    let physical = min(recovered.workingSetGB, recovered.availableGB
+                        + Geometry.gb(recovered.currentSlots) + Planner.fixedFootprintGB
+                        + (mtp ? Planner.mtpResidentGB : 0)
+                        - Planner.availabilitySlackGB(ramGB: recovered.ramGB))
+                    c.expect("recovery fits its credited physical budget/\(cap)/\(mtp)",
+                        Double(plan.memoryLedger.expectedPeakBytes) <= physical * 1e9)
+                    c.equal("feasible recovery preserves required head/\(cap)/\(mtp)", plan.mtpEnabled, mtp)
+                } else {
+                    c.expect("ordinary context has a feasible pure recovery/\(cap)/\(mtp)", false)
+                }
+            }
+        }
         c.equal("overflowing public ledger saturates to refusal", ContextMemoryLedger(slots: Int.max,
             context: Int.max, chunk: Int.max, retentionTokens: Int.max, mtp: true, visionResident: true).expectedPeakBytes, Int.max)
         let originalVision = ContextWorkspace.visionBytes(patches: 9216)

````

Artifact `/tmp/slotstream-optimization-execution/governor-feasibility-v194/proposal-manifest.json` — 851 bytes; SHA-256 `db91cb1f639cc3ca0b05ad9e84cc85e9a876acb4794aa9eca69f4d44f1498ee3`.

````text
{
  "files": [
    {
      "path": "Sources/Slotstream/Governor.swift",
      "before_sha256": "af44af93916c9fcbea08744c9d343915e65914edf69909dfe25c420ff0b9a129",
      "after_sha256": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift",
      "before_sha256": "f4419fbe8e88de30cec00761fad4507e41ce611ffe4cef2f87175c7423e7e4b5",
      "after_sha256": "48ec4e1c4e1e24666d1833ee2019eda081f67db200b6a59169b735fec767c3fa"
    }
  ],
  "status": "isolated source only; unbuilt and untested",
  "reason": "Live feasibility may not inherit startup advisory-floor behavior at ordinary contexts",
  "preserved": "Startup planner/default snapshots, diagnostic failure criteria, resize deadbands and mandatory loaded components",
  "added_pure_assertions": 32
}

````

Artifact `/tmp/slotstream-optimization-execution/governor-feasibility-v194/receipt.json` — 901 bytes; SHA-256 `2e30fd33ab3a33352a072741ba7b554fd47f13c76a07d6178c4de69d83e011a1`.

````text
{
  "applied": true,
  "applied_at_unix": 1788731565.897679,
  "files": [
    {
      "path": "Sources/Slotstream/Governor.swift",
      "before_sha256": "af44af93916c9fcbea08744c9d343915e65914edf69909dfe25c420ff0b9a129",
      "after_sha256": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift",
      "before_sha256": "f4419fbe8e88de30cec00761fad4507e41ce611ffe4cef2f87175c7423e7e4b5",
      "after_sha256": "48ec4e1c4e1e24666d1833ee2019eda081f67db200b6a59169b735fec767c3fa"
    }
  ],
  "classification": "source-only; unbuilt/untested; heavy work held for transport",
  "prior_failure": "V193 governor-boundary 72/80; eight refusal assertions unchanged",
  "review": "Matches existing ContextFeasibility checks with the credited physical budget; preserves startup Planner and resize deadbands."
}

````
