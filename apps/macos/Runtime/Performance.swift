import Foundation
import Slotstream

public struct PerformancePreferences: Codable, Equatable, Sendable {
    public enum Budget: String, Codable, CaseIterable, Sendable { case automatic, custom }
    public enum Readiness: String, Codable, CaseIterable, Sendable { case automatic, keepReady }
    public var budget: Budget
    public var customGB: Double
    /// Optional for decoding preferences saved before first-use tracking existed.
    public var hasCustomLimit: Bool?
    public var readiness: Readiness
    public init(budget: Budget = .automatic, customGB: Double = 10, readiness: Readiness = .automatic) {
        self.budget = budget; self.customGB = customGB; self.readiness = readiness
        self.hasCustomLimit = budget == .custom || customGB != 10
    }
    public static func restore(_ data: Data?) -> Self {
        guard let data, var value = try? JSONDecoder().decode(Self.self, from: data),
              value.customGB.isFinite, value.customGB >= PerformancePolicy.minimumGB else { return .init() }
        // The old automatic default stored 10 even before Custom was used.
        if value.hasCustomLimit == nil { value.hasCustomLimit = value.budget == .custom || value.customGB != 10 }
        return value
    }

    public func selectingBudget(_ choice: Budget, currentGB: Double?, maximumGB: Double) -> Self {
        var next = self
        next.budget = choice
        if choice == .custom {
            let initial = hasCustomLimit == true ? customGB : (currentGB ?? Planner.usefulCeilingGB)
            next.customGB = min(maximumGB, max(PerformancePolicy.minimumGB, initial))
            next.hasCustomLimit = true
        }
        return next
    }
}

/// Product policy for the currently supported text model. It reuses the
/// engine's adaptive ceiling and preserves its independent CLI.
public enum PerformancePolicy {
    /// The engine's smallest automatic window. At the 10 GB test plan the
    /// planner reports the same 9.0 GB peak as the former 8,192-token window
    /// and one fewer cached expert per layer (doctor, September 17, 2026).
    /// Documents, file changes and apps need the room.
    public static let contextTokens = 32768
    /// Short chats need stable intermediate checkpoints before the next turn.
    /// Keep 512-token compute passes below 1,536 prompt tokens; longer inputs
    /// retain the engine's throughput schedule. Keep its workspace reservation
    /// so read sharing and pressure recovery still have room. These are measured
    /// Desktop operating choices, not numerical limits or CLI policy.
    /// Rationale and revision gate: db/records/decisions/sevra-app-speed-defaults-2026-09-23.md.
    public static let shortPromptTokens = 1536
    public static let shortPromptChunk = 512
    /// Seconds after releasing the model before another allocation plan. XNU's
    /// host-statistics cache lasts one second; a small margin avoids its edge.
    /// Only immediate reloads wait, and always use a new real reading afterward.
    public static let memoryObservationDelay: TimeInterval = 1.05
    // Round the engine floor UP to a half GB for an accessible native control.
    public static let minimumGB = ceil(Planner.minMemoryGB * 2) / 2
    public static func maximumGB(on machine: Machine) -> Double {
        guard machine.ramGB.isFinite, machine.workingSetGB.isFinite else { return 0 }
        return floor(Planner.maximumMemoryLimitGB(ramGB: machine.ramGB,
            workingSetGB: machine.workingSetGB) * 2) / 2
    }
    public static func validate(_ preferences: PerformancePreferences, on machine: Machine) throws {
        guard preferences.customGB.isFinite, preferences.customGB >= minimumGB else {
            throw SevraError.refused("Choose a memory limit within the supported range.")
        }
        if preferences.budget == .custom, preferences.customGB > maximumGB(on: machine) {
            throw SevraError.refused("This memory limit exceeds the supported budget on this Mac. Choose Automatic or a lower limit.")
        }
    }
    public static func plan(_ preferences: PerformancePreferences, on machine: Machine) throws -> MemoryPlan {
        try plan(preferences, on: machine, mtpAvailable: MTPWeights.present(modelDir: WeightStore.default.modelDirectory))
    }
    public static func plan(_ preferences: PerformancePreferences, on machine: Machine, mtpAvailable: Bool,
                            decodeLookahead: DecodeLookaheadPlanning = .automatic) throws -> MemoryPlan {
        try validate(preferences, on: machine)
        guard let available = machine.availableGB, available.isFinite, available > 0,
              machine.ramGB.isFinite, machine.ramGB > 0, machine.workingSetGB.isFinite else {
            throw SevraError.unavailable("Sevra cannot read available memory right now. Try again in a moment.")
        }
        // Preserve the selected ceiling independently of the budget available
        // now, so pressure recovery does not fall back to the automatic default.
        // Desktop's displayed ceiling includes the draft head. The independent
        // CLI may lift its automatic model ceiling by MTP's resident cost; an
        // explicit adaptive ceiling keeps this app's total budget unchanged.
        let ceiling = preferences.budget == .custom ? preferences.customGB : Planner.usefulCeilingGB
        let plan: MemoryPlan
        do {
            // Use the engine's qualified automatic MTP and lookahead policy.
            // The head is optional and its full cost must fit before enabling it.
            plan = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil, memoryLimitGB: ceiling,
                ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: available,
                mtp: .auto, mtpAvailable: mtpAvailable, vision: .off, maxContextTokens: contextTokens,
                simulated: machine.isSimulated, qualification: false, decodeLookahead: decodeLookahead)
        } catch {
            throw SevraError.refused("There isn’t enough memory available for this model. Close a large app and try again. Your conversation is preserved.")
        }
        let limit = preferences.budget == .custom ? preferences.customGB : Planner.usefulCeilingGB
        let feasible = min(limit, machine.workingSetGB - 2,
                           available - Planner.availabilitySlackGB(ramGB: machine.ramGB))
        // The CLI's historical advisory floor is not permission for Desktop
        // to load a profile that cannot fit. Never force it or shorten context.
        guard let target = plan.targetGB, target <= feasible + 0.0001,
              plan.expectedPeakGB <= feasible + 0.0001 else {
            throw SevraError.refused("There isn’t enough memory available for this model. Close a large app and try again. Your conversation is preserved.")
        }
        return plan
    }
    /// Conservative development idle policy in seconds, not a measured optimum.
    /// Amortize observed preparation cost without keeping a large model forever.
    /// Revisit after paired cold/warm workflow measurements on supported Macs.
    public static func idleDelay(preparationSeconds: Double, conservingPower: Bool) -> TimeInterval {
        let cost = preparationSeconds.isFinite ? max(0, preparationSeconds) : 0
        return min(1800, max(conservingPower ? 300 : 600, cost * 4))
    }
    public static func shouldRelease(idleSeconds: Double, preparationSeconds: Double,
                                     preferences: PerformancePreferences, pressure: Bool,
                                     conservingPower: Bool, userPresent: Bool = false) -> Bool {
        // Reading an answer or composing the next message is still active use.
        // Keep a loaded model while the app is foreground, unless the Mac needs
        // memory or is conserving power. Never load a model solely for readiness.
        pressure || (preferences.readiness == .automatic && (!userPresent || conservingPower) && idleSeconds >= idleDelay(
            preparationSeconds: preparationSeconds, conservingPower: conservingPower))
    }
}

public struct PerformanceSnapshot: Sendable, Equatable {
    public var preferences: PerformancePreferences
    public var pending: Bool
    public var state: String
    public var loaded: Bool
    public var busy: Bool
    public var usedGB: Double?
    public var budgetGB: Double?
    public var recommendationGB: Double?
    public var maximumGB: Double
    public var detail: String
    public var idleMinutes: Int
}

/// Metadata has its own lock and never waits for the inference actor or the
/// generation lock. CPU and GPU allocations share one physical-footprint count.
public final class PerformanceTelemetry: @unchecked Sendable {
    private let lock = NSLock()
    private weak var engine: Engine?
    private var state = "Model not loaded"
    private var detail = "Loads when you send a message."
    private var preparationSeconds: Double = 0
    private var pressure = false
    private var monitor: DispatchSourceMemoryPressure?
    public init() {
        let source = DispatchSource.makeMemoryPressureSource(eventMask: [.normal, .warning, .critical],
            queue: DispatchQueue(label: "sevra.memory-status", qos: .utility))
        source.setEventHandler { [weak self, weak source] in
            guard let self, let source else { return }
            self.lock.lock(); self.pressure = !source.data.contains(.normal); self.lock.unlock()
        }
        source.resume(); monitor = source
    }
    deinit { monitor?.cancel() }
    public var underPressure: Bool { lock.lock(); defer { lock.unlock() }; return pressure }
    public var lastPreparationSeconds: Double { lock.lock(); defer { lock.unlock() }; return preparationSeconds }
    public var isLoaded: Bool { lock.lock(); defer { lock.unlock() }; return engine != nil }
    func update(state: String, detail: String, engine: Engine? = nil) {
        lock.lock(); defer { lock.unlock() }
        self.state = state; self.detail = detail; self.engine = engine
    }
    func prepared(in seconds: Double) { lock.lock(); preparationSeconds = max(preparationSeconds, seconds); lock.unlock() }
    public func snapshot(preferences: PerformancePreferences, pending: Bool, busy: Bool) -> PerformanceSnapshot {
        lock.lock()
        let current = engine, state = self.state, detail = self.detail, seconds = preparationSeconds, pressure = self.pressure
        lock.unlock()
        let machine = Machine.current()
        // Credit only Sevra's physical footprint, never RSS plus GPU memory.
        let bytes = ProcessMemory.residentBytes()
        var credited = machine
        if let available = machine.availableGB { credited.availableGB = min(machine.ramGB, available + Double(bytes) / 1e9) }
        let recommendation = try? PerformancePolicy.plan(.init(), on: credited)
        let plan = current?.currentPlan
        let conditions = ProcessMemory.operatingConditions()
        let conserving = conditions.lowPowerModeEnabled || ["serious", "critical"].contains(conditions.thermalState)
        return PerformanceSnapshot(preferences: preferences, pending: pending, state: state,
            loaded: current != nil, busy: busy, usedGB: bytes == 0 ? nil : Double(bytes) / 1e9,
            budgetGB: plan?.targetGB, recommendationGB: recommendation?.targetGB,
            maximumGB: PerformancePolicy.maximumGB(on: machine),
            detail: pressure ? "Giving memory back to your Mac." : detail,
            idleMinutes: Int(ceil(PerformancePolicy.idleDelay(preparationSeconds: seconds, conservingPower: conserving) / 60)))
    }
}

public extension Inference {
    var performanceTelemetry: PerformanceTelemetry? { nil }
    func configure(_ preferences: PerformancePreferences) async throws {}
}
