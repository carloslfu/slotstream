import Foundation
import CryptoKit

/// Analytic byte geometry for one frozen VQ checkpoint. This does not load weights
/// or choose an arena alignment for the runtime.
package struct VQRecordProfile {
    package let revision: String
    package let recordBytesByLayer: [Int]
    /// Early records get their own one-expert slots; remaining layers use a
    /// smaller class. The runtime pool does not consume these profiles yet.
    package struct SlotClass {
        package let layers: Range<Int>
        package let slotPayloadBytes: Int
        package let slotStrideBytes: Int
    }
    package let earlyLayers: SlotClass
    package let remainingLayers: SlotClass
    package let codebookBytes: Int
    package let allExpertPayloadBytes: Int

    private static let pinnedModel = "TheDrainFlorist/Qwen3.8-Flash-Next-VQ-2.1bpw"
    private static let pinnedRevision = "8684640a3956b01c47f5d47f9b999e2ab8b985f1"

    private struct Manifest: Decodable {
        let schema: Int
        let model: String
        let revision: String
        let source: Source
        let modules: [Module]
        let tensors: [Tensor]
    }
    private struct Source: Decodable {
        let candidateReceiptSHA256: String
        let configSHA256: String
        let indexSHA256: String
        let headersReceiptSHA256: String
        let headers: [Header]
    }
    private struct Header: Decodable {
        let file: String
        let sha256: String
    }
    private struct Module: Decodable {
        let name: String
        let experts: Int
        let input: Int
        let output: Int
        let dim: Int
        let k: Int
        let group: Int
    }
    private struct Tensor: Decodable {
        let name: String
        let shape: [Int]
        let dtype: String
        let byteCount: Int
    }

    private static func add(_ a: Int, _ b: Int, _ context: String) throws -> Int {
        let (value, overflow) = a.addingReportingOverflow(b)
        guard !overflow else { throw ModelError("VQ \(context): byte addition overflow") }
        return value
    }
    private static func multiply(_ a: Int, _ b: Int, _ context: String) throws -> Int {
        let (value, overflow) = a.multipliedReportingOverflow(by: b)
        guard !overflow else { throw ModelError("VQ \(context): byte multiplication overflow") }
        return value
    }
    private static func validHash(_ value: String) -> Bool {
        value.count == 64 && value.utf8.allSatisfy { (48...57).contains($0) || (97...102).contains($0) }
    }
    private static func expectedTensor(_ tensor: Tensor, shape: [Int], dtype: String) throws {
        guard tensor.shape == shape, tensor.dtype == dtype else {
            throw ModelError("VQ \(tensor.name): unexpected shape or dtype")
        }
        guard tensor.byteCount >= 0, let width = ["U8": 1, "U32": 4, "F16": 2][tensor.dtype] else {
            throw ModelError("VQ \(tensor.name): unsupported dtype or byte count")
        }
        var bytes = width
        for dimension in tensor.shape {
            guard dimension > 0 else { throw ModelError("VQ \(tensor.name): nonpositive dimension") }
            bytes = try multiply(bytes, dimension, tensor.name)
        }
        guard bytes == tensor.byteCount else { throw ModelError("VQ \(tensor.name): declared byte count mismatch") }
    }

    package static func load(_ data: Data, alignment: Int) throws -> VQRecordProfile {
        guard alignment > 0, (alignment & (alignment - 1)) == 0 else {
            throw ModelError("VQ alignment must be a positive power of two")
        }
        let manifest: Manifest
        do { manifest = try JSONDecoder().decode(Manifest.self, from: data) }
        catch { throw ModelError("invalid VQ record manifest: \(error)") }
        guard manifest.schema == 1, manifest.model == pinnedModel, manifest.revision == pinnedRevision else {
            throw ModelError("unsupported VQ schema, model, or revision")
        }
        let source = manifest.source
        guard source.candidateReceiptSHA256 == "3fae529d9b264fed388c42a9265d4cae87dae28abf30484160414c5470f9a341",
              source.configSHA256 == "4299e87dc3b2d11e53c683d4f17f1196ccf95b75399ddd77d470e148aae1d929",
              source.indexSHA256 == "35f2f37dd0eda19f81cae8436d0c102c9e1ad13c4381bd8dea72a0d4a6ef25eb",
              source.headersReceiptSHA256 == "00dfd2ae6cecb1e3e9bbcddf8812fcbfc74173e02a92cf05205efdea0ad546d5" else {
            throw ModelError("VQ source hashes differ from frozen receipt")
        }
        guard source.headers.count == 139,
              Set(source.headers.map(\.file)).count == 139,
              Set(source.headers.map(\.sha256)).count == 139,
              source.headers.allSatisfy({ !$0.file.isEmpty && validHash($0.sha256) }) else {
            throw ModelError("VQ headers must contain 139 unique files and hashes")
        }
        guard manifest.modules.count == 144, manifest.tensors.count == 432 else {
            throw ModelError("VQ manifest must have 144 modules and 432 tensors")
        }
        let modulesByName = Dictionary(manifest.modules.map { ($0.name, $0) }, uniquingKeysWith: { first, _ in first })
        let tensorsByName = Dictionary(manifest.tensors.map { ($0.name, $0) }, uniquingKeysWith: { first, _ in first })
        guard modulesByName.count == 144, tensorsByName.count == 432 else {
            throw ModelError("VQ duplicate module or tensor name")
        }
        let expectedNames = Set(manifest.modules.flatMap { ["\($0.name).codes", "\($0.name).vq_scales", "\($0.name).codebook"] })
        guard Set(tensorsByName.keys) == expectedNames else {
            throw ModelError("VQ tensor set contains orphan, missing, or alternate affine suffix")
        }
        var layerBytes = [Int](repeating: 0, count: 48)
        var seenBases = Set<String>()
        var codebookBytes = 0
        for module in manifest.modules {
            let parts = module.name.split(separator: ".")
            guard parts.count == 6, parts[0] == "model", parts[1] == "layers",
                  let layer = Int(parts[2]), (0..<48).contains(layer),
                  parts[3] == "mlp", parts[4] == "switch_mlp",
                  ["gate_proj", "up_proj", "down_proj"].contains(String(parts[5])),
                  seenBases.insert("\(layer).\(parts[5])").inserted else {
                throw ModelError("VQ unexpected or duplicate module \(module.name)")
            }
            guard module.name == "model.layers.\(layer).mlp.switch_mlp.\(parts[5])" else {
                throw ModelError("VQ noncanonical module \(module.name)")
            }
            let isDown = parts[5] == "down_proj"
            guard module.experts == 512,
                  module.input == (isDown ? 640 : 2560),
                  module.output == (isDown ? 2560 : 640),
                  module.dim > 0, module.group > 0,
                  module.input % module.dim == 0, module.input % module.group == 0 else {
                throw ModelError("VQ alternate expert geometry in \(module.name)")
            }
            let codesDType: String
            switch (module.dim, module.k, module.group) {
            case (2, 256, 64): codesDType = "U8"
            case (4, 256, 64), (8, 16384, 64): codesDType = "U32"
            default: throw ModelError("VQ unsupported codebook tuple in \(module.name)")
            }
            let width: Int
            if codesDType == "U8" { width = module.input / module.dim }
            else {
                let groups = try add(module.input / module.dim, 31, module.name) / 32
                let bits = Int.bitWidth - (module.k - 1).leadingZeroBitCount
                width = try multiply(groups, bits, module.name)
            }
            guard let codes = tensorsByName["\(module.name).codes"],
                  let scales = tensorsByName["\(module.name).vq_scales"],
                  let book = tensorsByName["\(module.name).codebook"] else {
                throw ModelError("VQ missing tensor for \(module.name)")
            }
            try expectedTensor(codes, shape: [512, module.output, width], dtype: codesDType)
            try expectedTensor(scales, shape: [512, module.output, module.input / module.group], dtype: "F16")
            try expectedTensor(book, shape: [module.k, module.dim], dtype: "F16")
            guard codes.byteCount % 512 == 0, scales.byteCount % 512 == 0 else {
                throw ModelError("VQ expert tensors must divide by 512")
            }
            let payload = try add(codes.byteCount / 512, scales.byteCount / 512, module.name)
            layerBytes[layer] = try add(layerBytes[layer], payload, module.name)
            codebookBytes = try add(codebookBytes, book.byteCount, "shared codebooks")
        }
        guard seenBases.count == 144 else { throw ModelError("VQ missing layer/projection") }
        var oneExpert = 0
        for bytes in layerBytes { oneExpert = try add(oneExpert, bytes, "one-expert payload") }
        let allExperts = try multiply(oneExpert, 512, "all-expert payload")
        func slotClass(layers: Range<Int>) throws -> SlotClass {
            guard let maximum = layers.map({ layerBytes[$0] }).max() else {
                throw ModelError("VQ slot class has no layers")
            }
            let padded = try add(maximum, alignment - 1, "aligned stride")
            return SlotClass(layers: layers, slotPayloadBytes: maximum,
                slotStrideBytes: padded & ~(alignment - 1))
        }
        let earlyLayers = try slotClass(layers: 0..<2)
        let remainingLayers = try slotClass(layers: 2..<48)
        // The manifest is an audited, byte-for-byte fixture for one checkpoint.
        // Its source hash fields are labels inside the JSON, so structural checks
        // alone cannot bind the 144 tuples or 139 header identities to the audit.
        let fingerprint = SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined()
        guard fingerprint == "8d1d19432bc3c3f5084e69aaa6a4df37342b3201c9b4d82933a5beec857bde78" else {
            throw ModelError("VQ frozen manifest fingerprint mismatch")
        }
        return VQRecordProfile(revision: manifest.revision, recordBytesByLayer: layerBytes,
            earlyLayers: earlyLayers, remainingLayers: remainingLayers, codebookBytes: codebookBytes,
            allExpertPayloadBytes: allExperts)
    }

    /// Each expert occupies one slot within its layer class. Counts are physical
    /// slots, not bytes; the sum below is analytic allocation, not measured RSS.
    package func ledger(earlyLayerSlots: Int, remainingLayerSlots: Int) throws -> VQRecordLedger {
        func pool(_ geometry: SlotClass, count: Int, label: String) throws -> VQRecordLedger.Pool {
            let capacity = try Self.multiply(geometry.layers.count, 512, "slot capacity")
            guard (0...capacity).contains(count) else {
                throw ModelError("VQ \(label) slot count must be 0...\(capacity)")
            }
            let bytes = try Self.multiply(count, geometry.slotStrideBytes, "\(label) slot pool")
            return VQRecordLedger.Pool(geometry: geometry, slotCount: count, poolAllocatedBytes: bytes)
        }
        let early = try pool(earlyLayers, count: earlyLayerSlots, label: "early-layer")
        let remaining = try pool(remainingLayers, count: remainingLayerSlots, label: "remaining-layer")
        return VQRecordLedger(earlyLayers: early, remainingLayers: remaining,
            slotCount: try Self.add(early.slotCount, remaining.slotCount, "total slot count"),
            actualRecordBytesByLayer: recordBytesByLayer,
            poolAllocatedBytes: try Self.add(early.poolAllocatedBytes, remaining.poolAllocatedBytes, "slot pools"),
            allExpertPayloadBytes: allExpertPayloadBytes, sharedCodebookBytes: codebookBytes)
    }
}

package struct VQRecordLedger {
    package struct Pool {
        package let geometry: VQRecordProfile.SlotClass
        package let slotCount: Int
        package let poolAllocatedBytes: Int
    }
    package let earlyLayers: Pool
    package let remainingLayers: Pool
    package let slotCount: Int
    package let actualRecordBytesByLayer: [Int]
    package let poolAllocatedBytes: Int
    package let allExpertPayloadBytes: Int
    package let sharedCodebookBytes: Int
}
