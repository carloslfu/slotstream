import Foundation
#if canImport(CryptoKit)
import CryptoKit
#else
import Crypto
#endif

/// Evidence describes a complete configuration, never just a bit width.
public enum ModelPackSelectionEvidence: String, Codable, Sendable {
    case measured, estimated, unknown
}

public enum ModelPackFeature: String, Codable, Sendable, Hashable, CaseIterable {
    case text, tools, images, draft, prefixReuse
}

/// Read-only identity used at a selection boundary. Unknown storage does not
/// inherit the internal disk's measurements. A volume identity distinguishes
/// a measured disk from another disk with the same general location.
public struct ModelPackHardware: Equatable, Sendable {
    public enum Storage: String, Codable, Sendable, Hashable { case internalLocal, externalLocal, remote, unknown }
    public let model: String?
    public let chip: String?
    public let osBuild: String?
    public let nativeARM64: Bool
    public let storage: Storage
    public let volumeID: String?
    public let thermalState: String?
    public let lowPowerModeEnabled: Bool?

    public init(model: String?, chip: String?, osBuild: String?, nativeARM64: Bool,
                storage: Storage, volumeID: String?) {
        self.init(model: model, chip: chip, osBuild: osBuild, nativeARM64: nativeARM64,
            storage: storage, volumeID: volumeID, thermalState: nil, lowPowerModeEnabled: nil)
    }

    public init(model: String?, chip: String?, osBuild: String?, nativeARM64: Bool,
                storage: Storage, volumeID: String?, thermalState: String?, lowPowerModeEnabled: Bool?) {
        self.model = model; self.chip = chip; self.osBuild = osBuild
        self.nativeARM64 = nativeARM64; self.storage = storage; self.volumeID = volumeID
        self.thermalState = thermalState; self.lowPowerModeEnabled = lowPowerModeEnabled
    }

    /// The current complete-performance protocol admits this operating state.
    /// A different or unreadable state keeps measured speed evidence absent.
    package var admitsMeasuredConditions: Bool { thermalState == "nominal" && lowPowerModeEnabled == false }

    public static func current(modelDirectory: URL) -> Self {
        let platform = OptimizationPlatform.current
        let conditions = ProcessMemory.operatingConditions()
        let values = try? modelDirectory.resourceValues(forKeys: [
            .volumeIsLocalKey, .volumeIsInternalKey, .volumeUUIDStringKey])
        let storage: Storage
        if values?.volumeIsLocal == false { storage = .remote }
        else if values?.volumeIsLocal == true, let internalDisk = values?.volumeIsInternal {
            storage = internalDisk ? .internalLocal : .externalLocal
        } else { storage = .unknown }
        return Self(model: platform.machineModel, chip: platform.chip, osBuild: platform.osBuild,
            nativeARM64: platform.nativeARM64, storage: storage, volumeID: values?.volumeUUIDString,
            thermalState: conditions.thermalState, lowPowerModeEnabled: conditions.lowPowerModeEnabled)
    }
}

/// A proposed plan, not an allocation or proof that on-disk bytes are valid.
/// The execution policy names all non-planner choices (draft depth, sidecars,
/// short-prompt policy, power controls and live management). Changing any of
/// those choices requires a new policy identity and its affected evidence.
public struct ModelPackCandidate: Sendable {
    public let packID: String
    public let manifestDigest: String
    public let executionPolicyID: String
    public let configurationDigest: String
    public let targetBytes: Int64
    public let expectedPeakBytes: Int64
    public let contextTokens: Int
    public let features: Set<ModelPackFeature>
    public let simulated: Bool

    public init(pack: ModelPack, plan: MemoryPlan, executionPolicyID: String,
                tools: Bool, prefixReuse: Bool) throws {
        try Planner.validateAdaptiveMemoryPolicy(plan)
        guard !executionPolicyID.isEmpty, plan.resources == pack.memoryProfile, let target = plan.targetGB,
              let bytes = AutomaticPackPolicy.bytes(target), bytes > 0,
              plan.memoryLedger.expectedPeakBytes > 0 else {
            throw PlanError("Auto selection requires a complete, finite memory plan")
        }
        var features: Set<ModelPackFeature> = [.text]
        if tools { features.insert(.tools) }
        if plan.visionEnabled { features.insert(.images) }
        if plan.mtpEnabled { features.insert(.draft) }
        if prefixReuse && plan.runtimeAllocationPolicy?.prefixCacheEnabled != false && plan.prefixCacheTokens > 0 {
            features.insert(.prefixReuse)
        }
        let configuration: [String: Any] = ["schema": 1, "pack": pack.manifestDigest,
            "execution_policy": executionPolicyID, "resource_profile": plan.resources.identity,
            "target_bytes": bytes, "expected_peak_bytes": plan.memoryLedger.expectedPeakBytes,
            "ceiling_bytes": plan.memoryLimitGB.flatMap(AutomaticPackPolicy.bytes) as Any? ?? NSNull(),
            "planning_source": plan.source.rawValue,
            "context_qualification": plan.contextQualification,
            "slots": plan.slots, "context_tokens": plan.maxContextTokens,
            "prefill_chunk": plan.prefillChunk, "prefix_tokens": plan.prefixCacheTokens,
            "features": features.map(\.rawValue).sorted(), "draft_streamed": plan.mtpStreamedExperts,
            "vision_resident": plan.visionResidentReserved, "lookahead": plan.decodeLookahead,
            "lookahead_bytes": plan.lookaheadReserveBytes,
            "prefill_override": plan.runtimeAllocationPolicy?.prefillChunkOverride as Any? ?? NSNull(),
            "prefix_enabled": plan.runtimeAllocationPolicy?.prefixCacheEnabled ?? true]
        let data = try JSONSerialization.data(withJSONObject: configuration, options: [.sortedKeys])
        self.init(packID: pack.id, manifestDigest: pack.manifestDigest, executionPolicyID: executionPolicyID,
            configurationDigest: SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined(),
            targetBytes: bytes, expectedPeakBytes: Int64(plan.memoryLedger.expectedPeakBytes),
            contextTokens: plan.maxContextTokens, features: features, simulated: plan.simulated)
    }

    package init(packID: String, manifestDigest: String, executionPolicyID: String, configurationDigest: String,
                 targetBytes: Int64, expectedPeakBytes: Int64, contextTokens: Int,
                 features: Set<ModelPackFeature>, simulated: Bool) {
        self.packID = packID; self.manifestDigest = manifestDigest; self.executionPolicyID = executionPolicyID
        self.configurationDigest = configurationDigest; self.targetBytes = targetBytes
        self.expectedPeakBytes = expectedPeakBytes; self.contextTokens = contextTokens
        self.features = features; self.simulated = simulated
    }
}

/// The caller supplies only installed packs whose use the user has accepted.
/// Selection never downloads, authenticates a payload, or waives admission.
/// Preserve this snapshot for one decision; do not call from the live governor.
public struct ModelPackSelectionContext: Sendable {
    public let machine: Machine
    public let hardware: ModelPackHardware
    public let ceilingBytes: Int64
    public let contextTokens: Int
    public let requiredFeatures: Set<ModelPackFeature>
    public let acceptedInstalledManifests: [String: String]
    public let candidates: [ModelPackCandidate]
    public let incumbentPackID: String?

    public init(machine: Machine, hardware: ModelPackHardware, ceilingBytes: Int64, contextTokens: Int,
                requiredFeatures: Set<ModelPackFeature>, acceptedInstalledManifests: [String: String],
                candidates: [ModelPackCandidate], incumbentPackID: String? = nil) {
        self.machine = machine; self.hardware = hardware; self.ceilingBytes = ceilingBytes
        self.contextTokens = contextTokens; self.requiredFeatures = requiredFeatures
        self.acceptedInstalledManifests = acceptedInstalledManifests; self.candidates = candidates
        self.incumbentPackID = incumbentPackID
    }
}

/// Compiled reviewed evidence only. There is no decoder for remote profiles.
/// Measured points bind exact RAM, disk, OS and configuration. Estimates name
/// measured anchors and a reviewed scope; they never carry a measured rate.
package struct AutomaticPackProfile: Sendable {
    package enum Evidence: Sendable {
        case measured(hardware: ModelPackHardware, ramBytes: Int64, configurationDigest: String,
                      decodeLowerBound: Double, reference: String)
        case estimated(models: Set<String>, chips: Set<String>, osBuilds: Set<String>,
                       storage: Set<ModelPackHardware.Storage>, ramBytes: ClosedRange<Int64>,
                       targetBytes: ClosedRange<Int64>, anchors: [String], rationale: String)
    }
    package let id: String
    package let packID: String
    package let manifestDigest: String
    package let executionPolicyID: String
    package let contextTokens: Int
    package let features: Set<ModelPackFeature>
    /// Smaller ranks are higher quality. Assigned only after outcome gates.
    package let qualityRank: Int
    package let qualityReference: String
    package let evidence: Evidence

    package init(id: String, packID: String, manifestDigest: String, executionPolicyID: String,
                 contextTokens: Int, features: Set<ModelPackFeature>, qualityRank: Int,
                 qualityReference: String, evidence: Evidence) {
        self.id = id; self.packID = packID; self.manifestDigest = manifestDigest
        self.executionPolicyID = executionPolicyID; self.contextTokens = contextTokens
        self.features = features; self.qualityRank = qualityRank
        self.qualityReference = qualityReference; self.evidence = evidence
    }
}

package enum AutomaticPackPolicy {
    /// Product target, not a physical bound or a universal instantaneous rate.
    package static let targetTokensPerSecond = 20.0
    package struct Match {
        package let profile: AutomaticPackProfile
        package let candidate: ModelPackCandidate
        package let evidence: ModelPackSelectionEvidence
        package let decodeLowerBound: Double?
        package var targetMet: Bool { evidence == .measured && (decodeLowerBound ?? 0) >= targetTokensPerSecond }
    }

    package static func bytes(_ gb: Double) -> Int64? {
        let value = gb * 1e9
        guard value.isFinite, value >= 0, value < Double(Int64.max) else { return nil }
        return Int64(value.rounded(.down))
    }

    package static func choose(_ context: ModelPackSelectionContext, profiles: [AutomaticPackProfile],
                               registeredManifests: [String: String]) -> Match? {
        let machine = context.machine
        guard context.ceilingBytes > 0, context.contextTokens > 0, context.hardware.nativeARM64,
              let ram = bytes(machine.ramGB), ram > 0, let working = bytes(machine.workingSetGB), working > 0,
              let availability = machine.availableGB.flatMap(bytes), availability > 0,
              working <= ram, availability <= ram,
              let slack = bytes(Planner.availabilitySlackGB(ramGB: machine.ramGB)),
              availability >= slack, working >= 2_000_000_000 else { return nil }
        let feasible = min(context.ceilingBytes, working - 2_000_000_000, availability - slack)
        // Duplicate evidence IDs make anchor resolution ambiguous. Refuse the
        // registry as a whole instead of depending on collection order.
        guard Set(profiles.map(\.id)).count == profiles.count else { return nil }
        let byID = Dictionary(uniqueKeysWithValues: profiles.map { ($0.id, $0) })
        var matches: [Match] = []
        for profile in profiles {
            guard !profile.id.isEmpty, profile.qualityRank >= 0, !profile.qualityReference.isEmpty,
                  !profile.executionPolicyID.isEmpty, profile.contextTokens == context.contextTokens,
                  profile.features.isSuperset(of: context.requiredFeatures),
                  registeredManifests[profile.packID] == profile.manifestDigest,
                  context.acceptedInstalledManifests[profile.packID] == profile.manifestDigest else { continue }
            for candidate in context.candidates where candidate.packID == profile.packID {
                guard candidate.manifestDigest == profile.manifestDigest,
                      candidate.executionPolicyID == profile.executionPolicyID,
                      candidate.contextTokens == context.contextTokens, candidate.features == profile.features,
                      candidate.targetBytes > 0, candidate.targetBytes <= feasible,
                      candidate.expectedPeakBytes > 0, candidate.expectedPeakBytes <= candidate.targetBytes else { continue }
                switch profile.evidence {
                case let .measured(hardware, measuredRAM, digest, rate, reference):
                    guard !machine.isSimulated, !candidate.simulated, hardware == context.hardware,
                          hardware.admitsMeasuredConditions,
                          hardware.storage != .unknown, hardware.storage != .remote,
                          hardware.model?.isEmpty == false, hardware.chip?.isEmpty == false,
                          hardware.osBuild?.isEmpty == false, hardware.volumeID?.isEmpty == false,
                          measuredRAM == ram, digest == candidate.configurationDigest, !digest.isEmpty,
                          rate.isFinite, rate > 0, !reference.isEmpty else { continue }
                    matches.append(Match(profile: profile, candidate: candidate, evidence: .measured, decodeLowerBound: rate))
                case let .estimated(models, chips, builds, storage, rams, targets, anchors, rationale):
                    guard let model = context.hardware.model, let chip = context.hardware.chip,
                          let build = context.hardware.osBuild, models.contains(model), chips.contains(chip),
                          builds.contains(build), storage.contains(context.hardware.storage),
                          context.hardware.storage != .unknown, context.hardware.storage != .remote,
                          rams.lowerBound > 0, rams.contains(ram), targets.lowerBound > 0,
                          targets.contains(candidate.targetBytes), !anchors.isEmpty, !rationale.isEmpty,
                          Set(anchors).count == anchors.count else { continue }
                    let validAnchors = anchors.allSatisfy { id in
                        guard let anchor = byID[id], anchor.packID == profile.packID,
                              anchor.manifestDigest == profile.manifestDigest,
                              anchor.executionPolicyID == profile.executionPolicyID,
                              anchor.contextTokens == profile.contextTokens, anchor.features == profile.features,
                              anchor.qualityRank == profile.qualityRank, anchor.qualityReference == profile.qualityReference,
                              case let .measured(hardware, ram, digest, rate, reference) = anchor.evidence else { return false }
                        return hardware.nativeARM64 && hardware.admitsMeasuredConditions &&
                            hardware.storage != .unknown && hardware.storage != .remote &&
                            hardware.model?.isEmpty == false && hardware.chip?.isEmpty == false &&
                            hardware.osBuild?.isEmpty == false && hardware.volumeID?.isEmpty == false &&
                            ram > 0 && !digest.isEmpty && rate.isFinite && rate > 0 && !reference.isEmpty
                    }
                    guard validAnchors else { continue }
                    matches.append(Match(profile: profile, candidate: candidate, evidence: .estimated, decodeLowerBound: nil))
                }
            }
        }
        return matches.sorted { lhs, rhs in
            if lhs.targetMet != rhs.targetMet { return lhs.targetMet }
            if lhs.evidence != rhs.evidence { return lhs.evidence == .measured }
            if lhs.profile.qualityRank != rhs.profile.qualityRank { return lhs.profile.qualityRank < rhs.profile.qualityRank }
            if lhs.decodeLowerBound != rhs.decodeLowerBound { return (lhs.decodeLowerBound ?? 0) > (rhs.decodeLowerBound ?? 0) }
            let leftCurrent = lhs.profile.packID == context.incumbentPackID
            let rightCurrent = rhs.profile.packID == context.incumbentPackID
            if leftCurrent != rightCurrent { return leftCurrent }
            return lhs.profile.id < rhs.profile.id
        }.first
    }
}
