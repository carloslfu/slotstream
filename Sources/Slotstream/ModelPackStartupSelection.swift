import Foundation
#if canImport(CryptoKit)
import CryptoKit
#else
import Crypto
#endif

/// One pack's components and storage observed at an idle selection boundary.
/// This is planning information, not authentication or acceptance of a download.
/// Loading must verify the selected files and obtain fresh real headroom.
public struct ModelPackStartupObservation: Sendable {
    public let packID: String
    public let manifestDigest: String
    public let hardware: ModelPackHardware
    public let mtpAvailable: Bool
    public let originalLookahead: DecodeLookaheadPlanning

    public init(pack: ModelPack, hardware: ModelPackHardware, mtpAvailable: Bool,
                originalLookahead: DecodeLookaheadPlanning = .automatic) {
        packID = pack.id; manifestDigest = pack.manifestDigest; self.hardware = hardware
        self.mtpAvailable = mtpAvailable; self.originalLookahead = originalLookahead
    }

    /// Checks optional component availability and authenticates a declared
    /// original forecast, without opening tensor weights. The complete pack
    /// verifier remains the authority for installed content. Call once at the
    /// selection boundary, never from the telemetry poll or live governor.
    public static func current(pack: ModelPack, modelDirectory: URL) -> Self {
        Self(pack: pack, hardware: .current(modelDirectory: modelDirectory),
            mtpAvailable: MTPWeights.present(modelDir: modelDirectory),
            originalLookahead: pack.startupDefaults.lookahead == .originalAutomatic
                ? .environment(modelDirectory: modelDirectory) : .off)
    }
}

public extension ModelPack {
    /// Binds the reviewed recipe and any active original correction to the
    /// proposed complete plan. Experimental environment overrides have no
    /// matching product recipe and therefore carry no automatic evidence.
    func startupCandidate(plan: MemoryPlan, liveMemory: LiveMemoryManagement,
                          observation: ModelPackStartupObservation) throws -> ModelPackCandidate? {
        guard observation.packID == id, observation.manifestDigest == manifestDigest,
              plan.maxContextTokens == startupDefaults.contextTokens else {
            throw PlanError("The startup observation belongs to a different pack or context")
        }
        try startupDefaults.validate(resources: memoryProfile)
        let forecast: String
        switch startupDefaults.lookahead {
        case .off:
            guard !plan.decodeLookahead else { return nil }
            forecast = "off"
        case .uncorrected:
            guard plan.decodeLookahead, plan.lookaheadReserveBytes == DecodeLookahead.reserveBytes else { return nil }
            forecast = "uncorrected"
        case .originalAutomatic:
            switch observation.originalLookahead {
            case .automatic:
                forecast = plan.decodeLookahead ? "uncorrected" : "off"
            case .automaticCorrected(let bytes):
                let pins = decodeForecastFiles.filter { $0.size == bytes }
                guard pins.count == 1 else { return nil }
                forecast = plan.decodeLookahead ? pins[0].sha256 : "off"
            case .off, .reserved, .retained:
                return nil
            }
        }
        let object: [String: Any] = ["schema": 1,
            "recipe": startupDefaults.executionIdentity(liveMemory: liveMemory), "forecast": forecast]
        let bytes = try JSONSerialization.data(withJSONObject: object, options: [.sortedKeys])
        let identity = SHA256.hash(data: bytes).map { String(format: "%02x", $0) }.joined()
        return try ModelPackCandidate(pack: self, plan: plan, executionPolicyID: identity,
            tools: true, prefixReuse: startupDefaults.prefixCacheEnabled, hardware: observation.hardware)
    }
}

public extension ModelPackRegistry {
    /// Construct actual proposals for this load boundary from each pack's own
    /// recipe and ledger. A missing, unaccepted or infeasible pack contributes
    /// no candidate. An empty result still permits the ordinary supported
    /// fallback decision; it never makes that fallback safe to allocate.
    ///
    /// An automatic ceiling is stable per pack. The context uses their largest
    /// ceiling only as an outer bound; every candidate has already been planned
    /// inside its own ceiling. A custom ceiling applies exactly to every pack.
    static func startupContext(on machine: Machine, hardware: ModelPackHardware,
                               contextTokens: Int, requiredFeatures: Set<ModelPackFeature>,
                               customMemoryGB: Double? = nil, liveMemory: LiveMemoryManagement = .automatic,
                               observations: [ModelPackStartupObservation],
                               acceptedInstalledManifests: [String: String],
                               incumbentPackID: String? = nil) throws -> ModelPackSelectionContext {
        guard contextTokens > 0, Set(observations.map(\.packID)).count == observations.count else {
            throw PlanError("Auto selection needs one unambiguous observation per installed pack")
        }
        let customBytes = customMemoryGB.flatMap(AutomaticPackPolicy.bytes)
        if customMemoryGB != nil, customBytes == nil || customBytes == 0 {
            throw PlanError("The saved memory limit must be positive and finite")
        }
        let byID = Dictionary(uniqueKeysWithValues: observations.map { ($0.packID, $0) })
        var candidates: [ModelPackCandidate] = []
        var ceilings: [Int64] = []
        for pack in supported {
            guard let observation = byID[pack.id], observation.manifestDigest == pack.manifestDigest,
                  acceptedInstalledManifests[pack.id] == pack.manifestDigest,
                  pack.startupDefaults.contextTokens == contextTokens else { continue }
            if let ceiling = try? pack.automaticMemoryCeilingGB(on: machine),
               let bytes = AutomaticPackPolicy.bytes(ceiling) { ceilings.append(bytes) }
            guard let plan = try? pack.startupPlan(customMemoryGB: customMemoryGB, on: machine,
                mtpAvailable: observation.mtpAvailable, originalLookahead: observation.originalLookahead),
                let candidate = try pack.startupCandidate(plan: plan, liveMemory: liveMemory, observation: observation),
                candidate.features.isSuperset(of: requiredFeatures) else { continue }
            candidates.append(candidate)
        }
        return ModelPackSelectionContext(machine: machine, hardware: hardware,
            ceilingBytes: customBytes ?? ceilings.max() ?? 0, contextTokens: contextTokens,
            requiredFeatures: requiredFeatures, acceptedInstalledManifests: acceptedInstalledManifests,
            candidates: candidates, incumbentPackID: incumbentPackID)
    }
}
