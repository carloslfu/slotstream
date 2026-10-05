import Foundation
#if canImport(CryptoKit)
import CryptoKit
#else
import Crypto
#endif

/// The complete product startup recipe for a maintained pack. These are
/// compiled operating choices, separate from the independent CLI defaults,
/// current headroom and the user's live-memory preference. A new pack must
/// provide its own recipe; neither its bit width nor a downloaded manifest
/// inherits the original pack's ceiling or optimizations.
public struct ModelPackStartupDefaults: Sendable {
    public enum Lookahead: String, Sendable { case originalAutomatic, off, uncorrected }
    /// Compatibility interpretation for activation records written before
    /// explicit startup recipes. Keep this identity when later defaults change.
    public static let legacyOriginalPolicyID = "original-desktop-startup-v1"

    public let id: String
    public let automaticCeilingBytes: Int64
    public let contextTokens: Int
    public let draftMode: Planner.MTPMode
    public let draftPlacement: Planner.MTPExpertPlacement
    public let draftDepth: Int
    public let lookahead: Lookahead
    public let prefixCacheEnabled: Bool
    public let shortPromptTokens: Int
    public let shortPromptChunk: Int
    public let gpuKeepAlive: GPUKeepAlive.Policy
    public let reference: String

    package init(id: String, automaticCeilingBytes: Int64, contextTokens: Int,
                 draftMode: Planner.MTPMode, draftPlacement: Planner.MTPExpertPlacement,
                 draftDepth: Int, lookahead: Lookahead, prefixCacheEnabled: Bool,
                 shortPromptTokens: Int, shortPromptChunk: Int,
                 gpuKeepAlive: GPUKeepAlive.Policy, reference: String) {
        self.id = id; self.automaticCeilingBytes = automaticCeilingBytes
        self.contextTokens = contextTokens; self.draftMode = draftMode
        self.draftPlacement = draftPlacement; self.draftDepth = draftDepth
        self.lookahead = lookahead; self.prefixCacheEnabled = prefixCacheEnabled
        self.shortPromptTokens = shortPromptTokens; self.shortPromptChunk = shortPromptChunk
        self.gpuKeepAlive = gpuKeepAlive; self.reference = reference
    }

    /// Existing Desktop choices, moved without enlarging any budget or
    /// claiming new qualification. The total ceiling already includes MTP.
    package static let original = Self(id: legacyOriginalPolicyID,
        automaticCeilingBytes: Int64(Planner.usefulCeilingGB * 1e9), contextTokens: 32768,
        draftMode: .auto, draftPlacement: .automatic, draftDepth: 2,
        lookahead: .originalAutomatic, prefixCacheEnabled: true,
        shortPromptTokens: 1536, shortPromptChunk: 512, gpuKeepAlive: .auto,
        reference: "db/records/decisions/sevra-app-speed-defaults-2026-09-23.md")

    package func validate(resources: PackMemoryProfile) throws {
        guard !id.isEmpty, id.utf8.count <= 128, !reference.isEmpty,
              automaticCeilingBytes > 0, automaticCeilingBytes <= 1_000_000_000_000,
              automaticCeilingBytes.isMultiple(of: 100_000_000),
              Double(automaticCeilingBytes) / 1e9 >= resources.minimumMemoryGB,
              (1...resources.maximumContext).contains(contextTokens),
              (0...4).contains(draftDepth), (draftMode == .off) == (draftDepth == 0),
              draftMode == .off || draftPlacement != .streamed || resources.supportsStreamedDraft,
              (0...contextTokens).contains(shortPromptTokens),
              (256...4096).contains(shortPromptChunk),
              lookahead != .originalAutomatic || resources == .original,
              lookahead != .uncorrected || resources == .affine3GroupedLookaheadControl else {
            throw PlanError("This pack's startup recipe is incomplete or incompatible with its resource contract")
        }
    }

    public var request: PlanRequest {
        var value = PlanRequest(mtp: draftMode, vision: .off, maxContextTokens: contextTokens)
        value.mtpExperts = draftPlacement
        return value
    }

    package func planningLookahead(original: DecodeLookaheadPlanning) -> DecodeLookaheadPlanning {
        switch lookahead {
        case .originalAutomatic: return original
        case .off: return .off
        case .uncorrected: return .retained(enabled: true, bytes: DecodeLookahead.reserveBytes)
        }
    }

    package var runtimePolicy: RuntimeAllocationPolicy? {
        get throws {
            // Keep the existing original plan JSON and reservation arithmetic.
            // Disabling a cache must explicitly credit its freed reservation.
            if prefixCacheEnabled { return nil }
            return try RuntimeAllocationPolicy(prefixCacheEnabled: false)
        }
    }

    /// Hardware-only ceiling. Opening another application cannot reduce this
    /// policy value; startup and the governor separately price real headroom.
    package func automaticCeilingGB(resources: PackMemoryProfile, on machine: Machine) throws -> Double {
        try validate(resources: resources)
        guard machine.ramGB.isFinite, machine.ramGB > 0,
              machine.workingSetGB.isFinite, machine.workingSetGB > 0,
              machine.workingSetGB <= machine.ramGB else {
            throw PlanError("Cannot derive this pack's automatic ceiling from unreadable hardware")
        }
        let maximum = floor(Planner.maximumMemoryLimitGB(ramGB: machine.ramGB,
            workingSetGB: machine.workingSetGB) * 2) / 2
        let ceiling = min(Double(automaticCeilingBytes) / 1e9, maximum)
        guard ceiling.isFinite, ceiling >= resources.minimumMemoryGB else {
            throw PlanError("This Mac cannot fit the pack within its supported memory budget")
        }
        return ceiling
    }

    package func range(pack: ModelPack, on machine: Machine, mtpAvailable: Bool,
                       originalLookahead: DecodeLookaheadPlanning) throws -> ModelPackMemoryRange {
        try validate(resources: pack.memoryProfile)
        return try pack.memoryRange(for: request, on: machine, mtpAvailable: mtpAvailable,
            runtimePolicy: runtimePolicy, decodeLookahead: planningLookahead(original: originalLookahead))
    }

    package func plan(pack: ModelPack, customMemoryGB: Double?, on machine: Machine,
                      mtpAvailable: Bool, originalLookahead: DecodeLookaheadPlanning) throws -> MemoryPlan {
        try validate(resources: pack.memoryProfile)
        let ceiling: Double
        if let customMemoryGB {
            let bounds = try range(pack: pack, on: machine, mtpAvailable: mtpAvailable,
                originalLookahead: originalLookahead)
            guard customMemoryGB.isFinite, customMemoryGB >= bounds.minimumGB,
                  customMemoryGB <= bounds.maximumGB else {
                throw PlanError("The saved limit is outside this pack's supported memory range; the value has not been changed")
            }
            ceiling = customMemoryGB
        } else {
            ceiling = try automaticCeilingGB(resources: pack.memoryProfile, on: machine)
        }
        guard let available = machine.availableGB, available.isFinite, available > 0,
              available <= machine.ramGB else {
            throw PlanError("Cannot admit a startup plan without real available-memory information")
        }
        var proposal = request; proposal.memoryLimitGB = ceiling
        let plan = try pack.plan(proposal, on: machine, mtpAvailable: mtpAvailable,
            runtimePolicy: runtimePolicy, decodeLookahead: planningLookahead(original: originalLookahead))
        try Planner.validateMemoryBudget(plan, availableGB: available)
        let feasible = min(ceiling, machine.workingSetGB - 2,
            available - Planner.availabilitySlackGB(ramGB: machine.ramGB))
        guard let bound = AutomaticPackPolicy.bytes(feasible),
              let target = plan.targetGB.flatMap(AutomaticPackPolicy.bytes), target <= bound,
              Int64(plan.memoryLedger.expectedPeakBytes) <= bound,
              plan.memoryLimitGB == ceiling, plan.maxContextTokens == contextTokens else {
            throw PlanError("This pack's complete startup allocation cannot fit the saved ceiling and current headroom")
        }
        return plan
    }

    /// Bind all non-planner choices as well as their reviewed policy version.
    /// The applied identity additionally binds the actual model arithmetic,
    /// correction bytes, complete plan and executable through prefix identity.
    package func executionIdentity(liveMemory: LiveMemoryManagement) -> String {
        let configuration: [String: Any] = ["schema": 1, "startup_policy": id,
            "automatic_ceiling_bytes": automaticCeilingBytes, "context_tokens": contextTokens,
            "draft_mode": draftMode.rawValue, "draft_placement": draftPlacement.rawValue, "draft_depth": draftDepth,
            "speculation_enabled": true,
            "lookahead": lookahead.rawValue, "prefix_cache": prefixCacheEnabled,
            "short_prompt_tokens": shortPromptTokens, "short_prompt_chunk": shortPromptChunk,
            "gpu_keep_alive": gpuKeepAlive.rawValue, "live_memory": liveMemory.rawValue]
        let bytes = try! JSONSerialization.data(withJSONObject: configuration, options: [.sortedKeys])
        return SHA256.hash(data: bytes).map { String(format: "%02x", $0) }.joined()
    }
}

public extension ModelPack {
    func automaticMemoryCeilingGB(on machine: Machine) throws -> Double {
        try startupDefaults.automaticCeilingGB(resources: memoryProfile, on: machine)
    }

    func startupMemoryRange(on machine: Machine, mtpAvailable: Bool = false,
                            originalLookahead: DecodeLookaheadPlanning = .automatic) throws -> ModelPackMemoryRange {
        try startupDefaults.range(pack: self, on: machine, mtpAvailable: mtpAvailable,
            originalLookahead: originalLookahead)
    }

    /// A nil custom limit selects this pack's reviewed automatic ceiling. A
    /// supplied value remains exact and may exceed that default within the
    /// hardware range. The result is a proposal, never an allocation waiver.
    func startupPlan(customMemoryGB: Double? = nil, on machine: Machine, mtpAvailable: Bool = false,
                     originalLookahead: DecodeLookaheadPlanning = .automatic) throws -> MemoryPlan {
        try startupDefaults.plan(pack: self, customMemoryGB: customMemoryGB, on: machine,
            mtpAvailable: mtpAvailable, originalLookahead: originalLookahead)
    }
}
