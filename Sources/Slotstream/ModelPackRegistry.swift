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
    public let files: [PinnedModel.File]
    public let directoryName: String
    public let layout: String
    public let compatibility: String
    /// Evidence for the existing supported path, not a speed certification.
    public let supportEvidence: [String]
    /// Empty until complete profiles pass the new hardware/quality protocol.
    public let qualifiedAutomaticProfiles: [String]

    public var requiredBytes: Int64 { files.filter { !$0.optional }.reduce(0) { $0 + $1.size } }
    public var totalBytes: Int64 { files.reduce(0) { $0 + $1.size } }
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
}

public enum ModelPackRegistry {
    public static let baseline = ModelPack(id: PinnedModel.name, title: "Original 4-bit",
        checkpointRevision: "de4b8e4d43b917e7706784d8bb445c9af86a3540",
        conversionRevision: PinnedModel.revision, files: PinnedModel.files,
        directoryName: PinnedModel.dirName, layout: "affine-4-group64-ple-group32",
        compatibility: "slotstream-affine-v1",
        supportEvidence: ["db/records/plan/same-model-quantization-and-automatic-memory-2026-10-02.md"],
        qualifiedAutomaticProfiles: [])

    /// Research VQ exports intentionally do not appear here. A smaller bit
    /// label or component parity cannot grant service or download eligibility.
    public static let supported: [ModelPack] = [baseline]

    public static func resolve(_ selection: ModelPackSelection) throws -> ModelPackDecision {
        switch selection {
        case .automatic:
            return ModelPackDecision(pack: baseline,
                reason: "Uses the original pack while alternative quantizations are being qualified.", automatic: true)
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

/// Startup selection and ongoing allocation management are independent.
/// Fixed capacity still observes pressure and may refuse or stop a request.
public enum LiveMemoryManagement: String, Codable, CaseIterable, Sendable {
    case automatic, fixed
}
