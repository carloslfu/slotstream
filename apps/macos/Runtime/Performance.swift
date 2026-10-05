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
    public var quantization: ModelPackSelection
    public var liveMemory: LiveMemoryManagement
    public init(budget: Budget = .automatic, customGB: Double = 10, readiness: Readiness = .automatic,
                quantization: ModelPackSelection = .automatic, liveMemory: LiveMemoryManagement = .automatic) {
        self.budget = budget; self.customGB = customGB; self.readiness = readiness
        self.quantization = quantization; self.liveMemory = liveMemory
        self.hasCustomLimit = budget == .custom || customGB != 10
    }
    private enum CodingKeys: String, CodingKey { case budget, customGB, hasCustomLimit, readiness, quantization, liveMemory }
    public init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        budget = try c.decode(Budget.self, forKey: .budget)
        customGB = try c.decode(Double.self, forKey: .customGB)
        readiness = try c.decode(Readiness.self, forKey: .readiness)
        hasCustomLimit = try c.decodeIfPresent(Bool.self, forKey: .hasCustomLimit)
        quantization = try c.decodeIfPresent(ModelPackSelection.self, forKey: .quantization) ?? .automatic
        liveMemory = try c.decodeIfPresent(LiveMemoryManagement.self, forKey: .liveMemory) ?? .automatic
    }
    public static func restore(_ data: Data?) -> Self {
        guard let data, var value = try? JSONDecoder().decode(Self.self, from: data),
              value.customGB.isFinite, value.customGB > 0 else { return .init() }
        // The old automatic default stored 10 even before Custom was used.
        if value.hasCustomLimit == nil { value.hasCustomLimit = value.budget == .custom || value.customGB != 10 }
        return value
    }

    /// Readiness and an inactive custom value do not change the loaded model.
    package func matchesConfiguration(_ other: Self) -> Bool {
        quantization == other.quantization && budget == other.budget && liveMemory == other.liveMemory
            && (budget != .custom || customGB == other.customGB)
    }

    public func selectingBudget(_ choice: Budget, currentGB: Double?, maximumGB: Double) -> Self {
        selectingBudget(choice, currentGB: currentGB, minimumGB: PerformancePolicy.minimumGB, maximumGB: maximumGB)
    }
    public func selectingBudget(_ choice: Budget, currentGB: Double?, minimumGB: Double, maximumGB: Double) -> Self {
        var next = self
        next.budget = choice
        if choice == .custom {
            // A saved choice survives a different hardware/pack range. Load
            // validation explains an invalid choice instead of changing it.
            if hasCustomLimit != true, minimumGB.isFinite, minimumGB > 0,
               maximumGB.isFinite, maximumGB >= minimumGB {
                let initial = currentGB.flatMap { $0.isFinite && $0 > 0 ? $0 : nil } ?? Planner.usefulCeilingGB
                next.customGB = min(maximumGB, max(minimumGB, initial))
            }
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
    public static let contextTokens = ModelPackRegistry.baseline.startupDefaults.contextTokens
    /// Short chats need stable intermediate checkpoints before the next turn.
    /// Keep 512-token compute passes below 1,536 prompt tokens; longer inputs
    /// retain the engine's throughput schedule. Keep its workspace reservation
    /// so read sharing and pressure recovery still have room. These are measured
    /// Desktop operating choices, not numerical limits or CLI policy.
    /// Rationale and revision gate: db/records/decisions/sevra-app-speed-defaults-2026-09-23.md.
    public static let shortPromptTokens = ModelPackRegistry.baseline.startupDefaults.shortPromptTokens
    public static let shortPromptChunk = ModelPackRegistry.baseline.startupDefaults.shortPromptChunk
    /// Seconds after releasing the model before another allocation plan. XNU's
    /// host-statistics cache lasts one second; a small margin avoids its edge.
    /// Only immediate reloads wait, and always use a new real reading afterward.
    public static let memoryObservationDelay: TimeInterval = 1.05
    // Derive the displayed floor from the same complete text/context ledger
    // as admission, at the native control's half-GB resolution. The simulated
    // hardware only removes transient availability from this range inquiry.
    public static let minimumGB: Double = {
        return (try? ModelPackRegistry.baseline.startupMemoryRange(
            on: .simulated(ramGB: 64)))?.minimumGB ?? ceil(Planner.minMemoryGB * 2) / 2
    }()
    public static func maximumGB(on machine: Machine) -> Double {
        guard machine.ramGB.isFinite, machine.workingSetGB.isFinite else { return 0 }
        return floor(Planner.maximumMemoryLimitGB(ramGB: machine.ramGB,
            workingSetGB: machine.workingSetGB) * 2) / 2
    }
    public static func validate(_ preferences: PerformancePreferences, on machine: Machine) throws {
        try validate(preferences, on: machine, pack: ModelPackRegistry.resolve(preferences.quantization).pack)
    }
    package static func validate(_ preferences: PerformancePreferences, on machine: Machine, pack: ModelPack) throws {
        try validateSaved(preferences)
        if case .pack(let requested) = preferences.quantization, requested != pack.id {
            throw SevraError.refused("The planned model does not match your saved quantization choice.")
        }
        guard preferences.budget == .custom else { return }
        let range: ModelPackMemoryRange
        do {
            // A hardware control range prices required components even before
            // their download. Actual startup separately checks their presence.
            range = try pack.startupMemoryRange(on: machine, mtpAvailable: true)
        } catch {
            throw SevraError.refused("This Mac cannot fit the selected model and context within its supported memory range. Your saved limit is preserved.")
        }
        guard preferences.customGB >= range.minimumGB else {
            throw SevraError.refused("Choose a memory limit within the supported range.")
        }
        if preferences.customGB > range.maximumGB {
            throw SevraError.refused("This memory limit exceeds the supported budget on this Mac. Choose Automatic or a lower limit.")
        }
    }
    /// A preference can be saved even when a new pack or another Mac cannot
    /// apply it. Feasibility belongs to activation, never silent migration.
    public static func validateSaved(_ preferences: PerformancePreferences) throws {
        guard preferences.customGB.isFinite, preferences.customGB > 0 else {
            throw SevraError.refused("Choose a positive, finite memory limit.")
        }
    }
    public static func ceilingGB(_ preferences: PerformancePreferences, on machine: Machine) -> Double {
        if preferences.budget == .custom { return preferences.customGB }
        guard let pack = try? ModelPackRegistry.resolve(preferences.quantization).pack else { return 0 }
        return (try? pack.automaticMemoryCeilingGB(on: machine)) ?? 0
    }
    public static func plan(_ preferences: PerformancePreferences, on machine: Machine) throws -> MemoryPlan {
        try plan(preferences, on: machine, mtpAvailable: MTPWeights.present(modelDir: WeightStore.default.modelDirectory))
    }
    public static func plan(_ preferences: PerformancePreferences, on machine: Machine, mtpAvailable: Bool,
                            decodeLookahead: DecodeLookaheadPlanning = .automatic) throws -> MemoryPlan {
        try plan(preferences, pack: ModelPackRegistry.resolve(preferences.quantization).pack, on: machine,
            mtpAvailable: mtpAvailable, decodeLookahead: decodeLookahead)
    }
    /// Activation has already frozen its exact supported pack. Do not rerun
    /// Auto here or price an alternate selection with the original geometry.
    package static func plan(_ preferences: PerformancePreferences, pack: ModelPack, on machine: Machine,
                             mtpAvailable: Bool, decodeLookahead: DecodeLookaheadPlanning = .automatic) throws -> MemoryPlan {
        guard pack.startupDefaults.draftMode != .on || mtpAvailable else {
            throw SevraError.unavailable("A required model component is missing. Finish model setup before sending.")
        }
        try validate(preferences, on: machine, pack: pack)
        guard let available = machine.availableGB, available.isFinite, available > 0,
              machine.ramGB.isFinite, machine.ramGB > 0, machine.workingSetGB.isFinite else {
            throw SevraError.unavailable("Sevra cannot read available memory right now. Try again in a moment.")
        }
        // Preserve the selected ceiling independently of the budget available
        // now, so pressure recovery does not fall back to the automatic default.
        // Desktop's displayed ceiling includes the draft head. The independent
        // CLI may lift its automatic model ceiling by MTP's resident cost; an
        // explicit adaptive ceiling keeps this app's total budget unchanged.
        let ceiling: Double
        if preferences.budget == .custom { ceiling = preferences.customGB }
        else { ceiling = try pack.automaticMemoryCeilingGB(on: machine) }
        let plan: MemoryPlan
        do {
            // Use the engine's qualified automatic MTP and lookahead policy.
            // The head is optional and its full cost must fit before enabling it.
            plan = try pack.startupPlan(customMemoryGB: preferences.budget == .custom ? preferences.customGB : nil,
                on: machine, mtpAvailable: mtpAvailable, originalLookahead: decodeLookahead)
        } catch {
            throw SevraError.refused("There isn’t enough memory available for this model. Close a large app and try again. Your conversation is preserved.")
        }
        let limit = ceiling
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
    public var physicalGB: Double? = nil
    public var ceilingGB: Double? = nil
    public var appliedCeilingGB: Double? = nil
    public var failure: String? = nil
    public var activationFailure: String? = nil
    public var activationRecoveryAvailable = false
    public var canRepairActivation: Bool {
        activationRecoveryAvailable && !busy && (!pending || failure != nil)
    }
    public var activePack: String? = nil
    public var selectionReason: String? = nil
    public var configuration: AppliedModelConfiguration? = nil
    public var minimumGB: Double = PerformancePolicy.minimumGB
    public var memoryRangeAvailable = true
    public var selectionEvidence: ModelPackSelectionEvidence = .unknown
    public var measuredDecodeLowerBound: Double? = nil
    public var meetsMeasuredSpeedTarget = false
}

/// Metadata-only comparison against an already confirmed loaded runtime. It
/// cannot grant evidence or activation authority. The telemetry owner creates
/// it only from Engine's observation after health and durable activation.
package struct PerformanceProfileBinding: Sendable {
    package let generation: UUID
    package let pack: ModelPack
    package let candidate: ModelPackCandidate
    package let hardware: ModelPackHardware
    package let preferences: PerformancePreferences

    package init(generation: UUID, pack: ModelPack, candidate: ModelPackCandidate,
                 hardware: ModelPackHardware, preferences: PerformancePreferences) {
        self.generation = generation; self.pack = pack; self.candidate = candidate
        self.hardware = hardware; self.preferences = preferences
    }

    package func matches(plan: MemoryPlan?, generation: UUID?, hardware: ModelPackHardware,
                         preferences: PerformancePreferences, pressure: Bool) -> Bool {
        guard !pressure, self.generation == generation, self.hardware == hardware,
              self.preferences.matchesConfiguration(preferences), !candidate.simulated,
              let plan, !plan.simulated,
              let current = try? ModelPackCandidate(pack: pack, plan: plan,
                executionPolicyID: candidate.executionPolicyID,
                tools: candidate.features.contains(.tools), prefixReuse: pack.startupDefaults.prefixCacheEnabled,
                hardware: hardware) else { return false }
        return current.configurationDigest == candidate.configurationDigest
    }
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
    private var configuration: AppliedModelConfiguration?
    private var activationFailure: String?
    private var activationRecoveryAvailable = false
    private var selectedConfiguration: (decision: ModelPackDecision, preferences: PerformancePreferences)?
    private var confirmedProfile: (decision: ModelPackDecision, binding: PerformanceProfileBinding)?
    private struct RangeKey: Equatable {
        let manifest: String
        let startupPolicy: String
        let ramGB: Double
        let workingSetGB: Double
    }
    private var cachedRange: (key: RangeKey, value: ModelPackMemoryRange?)?
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
    public var activationFailureMessage: String? { lock.lock(); defer { lock.unlock() }; return activationFailure }
    var hasRecoverableActivationFailure: Bool {
        lock.lock(); defer { lock.unlock() }; return activationFailure != nil && activationRecoveryAvailable
    }
    func update(state: String, detail: String, engine: Engine? = nil) {
        lock.lock(); defer { lock.unlock() }
        self.state = state; self.detail = detail; self.engine = engine
    }
    func prepared(in seconds: Double) { lock.lock(); preparationSeconds = max(preparationSeconds, seconds); lock.unlock() }
    func applied(_ configuration: AppliedModelConfiguration?, confirmed: ModelPackDecision? = nil,
                 observed: LoadedModelPackCandidate? = nil, preferences: PerformancePreferences? = nil) {
        lock.lock(); defer { lock.unlock() }
        self.configuration = configuration
        confirmedProfile = nil
        guard let configuration, let confirmed, let observed, let preferences,
              confirmed.evidence != .unknown,
              configuration.packID == confirmed.pack.id,
              configuration.manifestDigest == confirmed.pack.manifestDigest,
              configuration.liveMemory == preferences.liveMemory,
              confirmed.configurationDigest == observed.candidate.configurationDigest else { return }
        confirmedProfile = (confirmed, PerformanceProfileBinding(generation: configuration.generation,
            pack: confirmed.pack, candidate: observed.candidate, hardware: observed.hardware, preferences: preferences))
    }
    func selected(_ decision: ModelPackDecision, preferences: PerformancePreferences) {
        lock.lock(); selectedConfiguration = (decision, preferences); lock.unlock()
    }
    func activationFailed(_ message: String?, recoveryAvailable: Bool = false) {
        lock.lock(); activationFailure = message
        activationRecoveryAvailable = message != nil && recoveryAvailable
        lock.unlock()
    }
    public func snapshot(preferences: PerformancePreferences, pending: Bool, busy: Bool) -> PerformanceSnapshot {
        lock.lock()
        let current = engine, state = self.state, detail = self.detail, seconds = preparationSeconds, pressure = self.pressure,
            configuration = self.configuration, activationFailure = self.activationFailure,
            activationRecoveryAvailable = self.activationRecoveryAvailable,
            selectedConfiguration = self.selectedConfiguration, confirmedProfile = self.confirmedProfile
        lock.unlock()
        let machine = Machine.current()
        // Credit only Sevra's physical footprint, never RSS plus GPU memory.
        let bytes = ProcessMemory.residentBytes()
        var credited = machine
        if let available = machine.availableGB { credited.availableGB = min(machine.ramGB, available + Double(bytes) / 1e9) }
        let plan = current?.currentPlan
        let conditions = ProcessMemory.operatingConditions()
        let conserving = conditions.lowPowerModeEnabled || ["serious", "critical"].contains(conditions.thermalState)
        // Ranges depend on hardware and selected context/components, never
        // live availability. Price only when this key changes, outside the
        // telemetry lock; polling and governor updates reuse that result.
        let selected = selectedConfiguration.flatMap { value -> ModelPackDecision? in
            value.preferences.matchesConfiguration(preferences) ? value.decision : nil
        }
        // No generation lock, model-file verification or lazy tensor load is
        // allowed here. Live resizing changes currentPlan's complete digest.
        // A different power/thermal/storage observation also withholds proof.
        let confirmed: ModelPackDecision?
        if !pending, activationFailure == nil, let current, let confirmedProfile,
           configuration?.packID == confirmedProfile.binding.pack.id,
           confirmedProfile.binding.matches(plan: plan, generation: configuration?.generation,
            hardware: .current(modelDirectory: current.modelDir), preferences: preferences, pressure: pressure) {
            confirmed = confirmedProfile.decision
        } else { confirmed = nil }
        let reason = Self.selectionReason(selection: preferences.quantization, proposed: selected,
            confirmed: confirmed?.reason, loaded: current != nil, pending: pending,
            activationFailed: activationFailure != nil)
        let rangeChoice: ModelPackSelection
        if preferences.quantization == .automatic, let packID = configuration?.packID {
            rangeChoice = .pack(packID)
        } else if let selected { rangeChoice = .pack(selected.pack.id)
        } else { rangeChoice = preferences.quantization }
        let rangePack = try? ModelPackRegistry.resolve(rangeChoice).pack
        let recommendedLookahead: DecodeLookaheadPlanning = plan.map {
            .retained(enabled: $0.decodeLookahead, bytes: $0.lookaheadReserveBytes)
        } ?? .automatic
        let recommendation = rangePack.flatMap { pack in
            try? pack.startupPlan(on: credited, mtpAvailable: plan?.mtpEnabled ?? false,
                originalLookahead: recommendedLookahead)
        }
        let rangeKey = RangeKey(manifest: rangePack?.manifestDigest ?? "unavailable",
            startupPolicy: rangePack?.startupDefaults.recipeIdentity ?? "unavailable",
            ramGB: machine.ramGB, workingSetGB: machine.workingSetGB)
        lock.lock(); let cached = cachedRange; lock.unlock()
        let range: ModelPackMemoryRange?
        if let cached, cached.key == rangeKey { range = cached.value }
        else {
            range = try? rangePack?.startupMemoryRange(on: machine, mtpAvailable: true)
            lock.lock(); cachedRange = (rangeKey, range); lock.unlock()
        }
        let selectedCeiling: Double?
        if preferences.budget == .custom { selectedCeiling = preferences.customGB }
        else { selectedCeiling = try? rangePack?.automaticMemoryCeilingGB(on: machine) }
        return PerformanceSnapshot(preferences: preferences, pending: pending, state: state,
            loaded: current != nil, busy: busy, usedGB: bytes == 0 ? nil : Double(bytes) / 1e9,
            budgetGB: plan?.targetGB, recommendationGB: recommendation?.targetGB,
            maximumGB: range?.maximumGB ?? PerformancePolicy.maximumGB(on: machine),
            detail: pressure ? "Giving memory back to your Mac." : detail,
            idleMinutes: Int(ceil(PerformancePolicy.idleDelay(preparationSeconds: seconds, conservingPower: conserving) / 60)),
            physicalGB: machine.ramGB, ceilingGB: selectedCeiling,
            appliedCeilingGB: plan?.memoryLimitGB,
            activationFailure: activationFailure,
            activationRecoveryAvailable: activationRecoveryAvailable,
            activePack: current == nil ? nil : configuration?.packID,
            selectionReason: reason,
            configuration: current == nil ? nil : configuration,
            minimumGB: range?.minimumGB ?? PerformancePolicy.minimumGB,
            memoryRangeAvailable: range != nil,
            selectionEvidence: confirmed?.evidence ?? .unknown,
            measuredDecodeLowerBound: confirmed?.measuredDecodeLowerBound,
            meetsMeasuredSpeedTarget: confirmed?.meetsMeasuredSpeedTarget ?? false)
    }

    package static func selectionReason(selection: ModelPackSelection, proposed: ModelPackDecision?,
                                        confirmed: String?, loaded: Bool, pending: Bool, activationFailed: Bool) -> String? {
        if pending { return "Your selection will be checked when the new settings apply." }
        if activationFailed { return "Your requested settings did not activate. Any restored model keeps its previous configuration." }
        if case .pack = selection { return (try? ModelPackRegistry.resolve(selection))?.reason }
        if loaded {
            return confirmed ?? "Automatic selection is active. Speed is not verified for the current configuration and conditions."
        }
        if proposed?.automaticProfileID != nil {
            return "An automatic configuration is selected. Its files and actual settings will be checked when the model loads."
        }
        return "Automatic selection will check the supported configurations when the model loads."
    }
}

public extension Inference {
    var performanceTelemetry: PerformanceTelemetry? { nil }
    func configure(_ preferences: PerformancePreferences) async throws {
        try PerformancePolicy.validate(preferences, on: .current())
    }
}
