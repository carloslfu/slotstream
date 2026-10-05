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
        supportEvidence: ["db/records/plan/same-model-quantization-and-automatic-memory-2026-10-02.md"],
        qualifiedAutomaticProfiles: [], decodeForecastFiles: TapCorrectionSidecar.files)

    /// Research VQ exports intentionally do not appear here. A smaller bit
    /// label or component parity cannot grant service or download eligibility.
    public static let supported: [ModelPack] = [baseline]

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
            return ModelPackDecision(pack: retained ?? baseline,
                reason: selectionContext == nil
                    ? "Uses the original pack while alternative quantizations are being qualified."
                    : retained == nil
                        ? "Uses the supported original pack; no qualified installed profile matches this configuration."
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

/// Startup selection and ongoing allocation management are independent.
/// Fixed capacity still observes pressure and may refuse or stop a request.
public enum LiveMemoryManagement: String, Codable, CaseIterable, Sendable {
    case automatic, fixed
}
