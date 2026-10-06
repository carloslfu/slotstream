import Foundation
#if canImport(CryptoKit)
import CryptoKit
#else
import Crypto
#endif

/// Product selection sits above the independent pinned engine API. A saved
/// explicit identity survives an app upgrade even if that pack is unavailable.
public enum ModelPackSelection: Codable, Hashable, Sendable {
    case automatic
    case pack(String)
}

/// A reviewed, immutable deployment of the same checkpoint. Construction is
/// deliberately private to this module: downloaded metadata cannot add a
/// model to the product allowlist or confer qualification on itself.
public struct ModelPack: Sendable {
    public let id: String
    public let title: String
    public let checkpointRevision: String
    public let conversionRevision: String
    let deployment: WeightDeployment
    package let memoryProfile: PackMemoryProfile
    public let startupDefaults: ModelPackStartupDefaults
    public var files: [PinnedModel.File] { deployment.files }
    public let directoryName: String
    public let layout: String
    public let compatibility: String
    /// Evidence for the existing supported path, not a speed certification.
    public let supportEvidence: [String]
    /// Empty until complete profiles pass the new hardware/quality protocol.
    public let qualifiedAutomaticProfiles: [String]
    /// Separately qualified optional forecasting bytes for this deployment.
    /// New packs must opt in explicitly; sharing a checkpoint does not confer
    /// compatibility with the original correction or its performance evidence.
    public let decodeForecastFiles: [TapCorrectionSidecar.File]

    public var requiredBytes: Int64 { deployment.requiredBytes }
    public var totalBytes: Int64 { deployment.totalBytes }
    public var manifestDigest: String {
        // Fixed field names plus sorted file entries bind optional components,
        // tokenizer, template and licenses as well as weight shards.
        let rows = files.sorted { $0.path < $1.path }.map {
            [$0.path, String($0.size), $0.sha256 ?? "missing", $0.optional ? "optional" : "required"]
        }
        let object: [String: Any] = ["schema": 1, "id": id, "checkpoint": checkpointRevision,
            "conversion": conversionRevision, "layout": layout, "compatibility": compatibility, "files": rows]
        let bytes = try! JSONSerialization.data(withJSONObject: object, options: [.sortedKeys])
        return SHA256.hash(data: bytes).map { String(format: "%02x", $0) }.joined()
    }
}

public struct ModelPackDecision: Sendable {
    public let pack: ModelPack
    public let reason: String
    public let automatic: Bool
    public let automaticProfileID: String?
    public let configurationDigest: String?
    public let evidence: ModelPackSelectionEvidence
    public let measuredDecodeLowerBound: Double?
    public let meetsMeasuredSpeedTarget: Bool

    init(pack: ModelPack, reason: String, automatic: Bool, automaticProfileID: String? = nil,
         configurationDigest: String? = nil, evidence: ModelPackSelectionEvidence = .unknown, measuredDecodeLowerBound: Double? = nil,
         meetsMeasuredSpeedTarget: Bool = false) {
        self.pack = pack; self.reason = reason; self.automatic = automatic
        self.automaticProfileID = automaticProfileID; self.evidence = evidence
        self.configurationDigest = configurationDigest
        self.measuredDecodeLowerBound = measuredDecodeLowerBound
        self.meetsMeasuredSpeedTarget = meetsMeasuredSpeedTarget
    }
}

public enum ModelPackRegistry {
    public static let baseline = ModelPack(id: PinnedModel.name, title: "Original 4-bit",
        checkpointRevision: "de4b8e4d43b917e7706784d8bb445c9af86a3540",
        conversionRevision: PinnedModel.revision, deployment: .original, memoryProfile: .original, startupDefaults: .original,
        directoryName: PinnedModel.dirName, layout: "affine-4-group64-ple-group32",
        compatibility: "slotstream-affine-v1",
        supportEvidence: ["db/records/plan/same-model-quantization-and-automatic-memory-2026-10-02.md",
            "db/sources/runs/2026/10/2026-10-05-practical-attention-comparison.md",
            "db/sources/runs/2026/10/2026-10-05-practical-desktop-ceiling.md"],
        qualifiedAutomaticProfiles: [], decodeForecastFiles: TapCorrectionSidecar.files)

    /// Research VQ exports intentionally do not appear here. A smaller bit
    /// label or component parity cannot grant service or download eligibility.
    public static let supported: [ModelPack] = [baseline]

    /// The exact exported bundle exercises the same loader, planner and
    /// startup recipe used by product owners. It stays outside supported,
    /// setup offers and Auto until practical qualification and distribution
    /// are complete. Empty sources cannot initiate a public download.
    package static let researchStandalone = ModelPack(id: PinnedAffineStandalone.id, title: "Smaller 3-bit experts",
        checkpointRevision: baseline.checkpointRevision,
        conversionRevision: PinnedAffineStandalone.manifestSHA256,
        deployment: try! WeightDeployment(repository: "local-standalone-affine3",
            revision: PinnedAffineStandalone.manifestSHA256, files: PinnedAffineStandalone.files, rawBases: []),
        memoryProfile: .affine3Native, startupDefaults: .affine3Standalone,
        directoryName: PinnedAffineStandalone.directoryName, layout: "affine-3-group64-experts-original-dense-draft",
        compatibility: "slotstream-affine3-standalone-v1",
        supportEvidence: ["db/records/plan/same-model-quantization-and-automatic-memory-2026-10-02.md"],
        qualifiedAutomaticProfiles: [], decodeForecastFiles: [])

    /// Populated only after complete outcome, memory, latency and throughput
    /// review. The matching implementation cannot qualify a research export.
    package static let automaticProfiles: [AutomaticPackProfile] = []

    public static func resolve(_ selection: ModelPackSelection) throws -> ModelPackDecision {
        try resolve(selection, selectionContext: nil)
    }

    /// Planning only. The product must still authenticate the selected pack,
    /// enforce current admission and freeze its decision before activation.
    public static func resolve(_ selection: ModelPackSelection,
                               context: ModelPackSelectionContext) throws -> ModelPackDecision {
        try resolve(selection, selectionContext: context)
    }

    /// Revalidate the frozen profile against an observed loaded candidate.
    /// The machine is the real admission observation taken before allocation;
    /// hardware and candidate controls are observed after the startup check.
    /// This confirms evidence only and never selects another pack or allocates.
    public static func confirm(_ proposed: ModelPackDecision, candidate loaded: LoadedModelPackCandidate?,
                               admissionMachine: Machine,
                               ceilingBytes: Int64, requiredFeatures: Set<ModelPackFeature>) -> ModelPackDecision? {
        guard proposed.automatic, let profileID = proposed.automaticProfileID, let loaded,
              !admissionMachine.isSimulated, admissionMachine.ramGB == loaded.physicalRAMGB else { return nil }
        let candidate = loaded.candidate
        guard
              candidate.packID == proposed.pack.id, candidate.manifestDigest == proposed.pack.manifestDigest else { return nil }
        let context = ModelPackSelectionContext(machine: admissionMachine, hardware: loaded.hardware,
            ceilingBytes: ceilingBytes, contextTokens: candidate.contextTokens,
            requiredFeatures: requiredFeatures,
            acceptedInstalledManifests: [candidate.packID: candidate.manifestDigest],
            candidates: [candidate], incumbentPackID: candidate.packID)
        guard let confirmed = try? resolve(.automatic, context: context),
              confirmed.pack.id == proposed.pack.id, confirmed.automaticProfileID == profileID,
              confirmed.evidence != .unknown else { return nil }
        return confirmed
    }

    private static func resolve(_ selection: ModelPackSelection,
                                selectionContext: ModelPackSelectionContext?) throws -> ModelPackDecision {
        switch selection {
        case .automatic:
            if let context = selectionContext,
               let match = AutomaticPackPolicy.choose(context, profiles: automaticProfiles.filter { profile in
                    supported.contains { $0.id == profile.packID && $0.qualifiedAutomaticProfiles.contains(profile.id) }
               },
                    registeredManifests: Dictionary(uniqueKeysWithValues: supported.map { ($0.id, $0.manifestDigest) })),
               let pack = supported.first(where: { $0.id == match.profile.packID &&
                    $0.qualifiedAutomaticProfiles.contains(match.profile.id) }) {
                let reason: String
                if match.evidence == .estimated {
                    reason = "Uses a conservative estimate for this Mac and your memory limit. Speed is not measured on this configuration."
                } else if match.targetMet {
                    reason = "Uses a configuration that met the generation-speed target in matching hardware tests. Current performance can vary."
                } else {
                    reason = "Matches a measured configuration within your memory limit. The generation-speed target is still unmet."
                }
                return ModelPackDecision(pack: pack, reason: reason, automatic: true,
                    automaticProfileID: match.profile.id, configurationDigest: match.candidate.configurationDigest,
                    evidence: match.evidence,
                    measuredDecodeLowerBound: match.decodeLowerBound, meetsMeasuredSpeedTarget: match.targetMet)
            }
            let retained = selectionContext.flatMap { context in
                supported.first { $0.id == context.incumbentPackID &&
                    context.acceptedInstalledManifests[$0.id] == $0.manifestDigest }
            }
            let chosen = retained ?? baseline
            // The practical comparisons support keeping the original, but
            // their descriptive medians are not a decode lower bound for an
            // exact loaded profile. Preserve unknown evidence and no target
            // claim. Do not manufacture configuration or hardware identities
            // that the historical receipts did not record.
            return ModelPackDecision(pack: chosen,
                reason: chosen.id == baseline.id
                    ? "Recommends Original 4-bit: tested alternatives have not improved both speed and quality. Speed is not verified for your current configuration."
                    : "Keeps your installed pack; no qualified profile matches this configuration.",
                automatic: true)
        case .pack(let id):
            guard let pack = supported.first(where: { $0.id == id }) else {
                throw SelectionError()
            }
            return ModelPackDecision(pack: pack, reason: "Uses your selected quantization.", automatic: false)
        }
    }

    public struct SelectionError: Error, LocalizedError {
        public var errorDescription: String? {
            "The selected model pack is unavailable in this build. Choose Automatic or a supported pack. Your saved choice has been preserved."
        }
    }
}

public extension WeightStore {
    /// Use only a compiled supported pack. An arbitrary downloaded manifest
    /// cannot construct ModelPack or authorize model selection.
    init(modelDirectory: URL, pack: ModelPack) {
        self.init(modelDirectory: modelDirectory, deployment: pack.deployment)
    }
}

extension ModelPack {
    /// The product's selected deployment must keep its own allocation and
    /// loader contract. This check is shared by Desktop and the opt-in CLI;
    /// adding a registry entry alone cannot enable a new representation.
    package func validateLoadPlan(_ plan: MemoryPlan) throws {
        guard plan.resources == memoryProfile else {
            throw PlanError("The selected model pack and load plan have different resource contracts")
        }
        let admitted = [ModelPackRegistry.baseline, ModelPackRegistry.researchStandalone]
        guard admitted.contains(where: { $0.id == id && $0.manifestDigest == manifestDigest }) else {
            throw PlanError("The selected model pack has no supported loader in this build")
        }
        guard !plan.simulated else { throw SlotstreamError.simulatedDeviceCannotLoad }
    }
}

/// Startup selection and ongoing allocation management are independent.
/// Fixed capacity still observes pressure and may refuse or stop a request.
public enum LiveMemoryManagement: String, Codable, CaseIterable, Sendable {
    case automatic, fixed
}
