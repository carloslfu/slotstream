import CryptoKit
import Darwin
import Foundation

/// Explicit research adapter for the reproducible four-to-three-bit expert
/// control. It does not register, install, activate or qualify a product pack.
/// All non-expert tensors stay in the exact original checkpoint.
package enum AffineExpertControl {
    package static let manifestSHA256 = "af31bd191fbd82dc998fe29cae230c7f3e6977bd355c827bf42e643b7680f182"
    package static let policy = "pinned-affine4-to-affine3-group64-experts-only-v1"
    private struct File: Decodable { let path: String, size: Int, sha256: String }
    private struct Manifest: Decodable {
        let schema: Int, complete: Bool, qualification: Bool, policy: String
        let parent_revision: String, baseline_config_sha256: String, baseline_index_sha256: String
        let layers: [Int], files: [File], expected_output_bytes: Int
    }
    private struct Index: Decodable { let weight_map: [String: String] }

    package static func digest(_ data: Data) -> String {
        SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined()
    }

    package static func bounded(_ path: URL, maximum: Int, sha256: String? = nil) throws -> Data {
        guard (1...4_000_000).contains(maximum) else { throw ModelError("invalid affine metadata bound") }
        let fd = Darwin.open(path.path, O_RDONLY | O_NOFOLLOW | O_NONBLOCK | O_CLOEXEC)
        guard fd >= 0 else { throw ModelError("cannot open affine control metadata") }
        let handle = FileHandle(fileDescriptor: fd, closeOnDealloc: true)
        defer { try? handle.close() }
        var value = stat()
        guard fstat(fd, &value) == 0, value.st_mode & S_IFMT == S_IFREG,
              (1...Int64(maximum)).contains(value.st_size),
              let data = try handle.read(upToCount: maximum + 1), data.count == Int(value.st_size),
              sha256 == nil || digest(data) == sha256 else {
            throw ModelError("affine control metadata differs from its bounded identity")
        }
        return data
    }

    private static func file(_ url: URL, bytes: Int, sha256: String,
                             shouldContinue: () -> Bool) throws -> VQTensorFile {
        // The preliminary bounded header describes the final owner's exact
        // identity. That owner rechecks header and complete payload through
        // its own descriptor, so a path replacement cannot pass admission.
        let fd = Darwin.open(url.path, O_RDONLY | O_NOFOLLOW | O_NONBLOCK | O_CLOEXEC)
        guard fd >= 0 else { throw ModelError("cannot inspect affine tensor file") }
        let handle = FileHandle(fileDescriptor: fd, closeOnDealloc: true)
        defer { try? handle.close() }
        var value = stat()
        guard fstat(fd, &value) == 0, value.st_mode & S_IFMT == S_IFREG, value.st_size == Int64(bytes),
              let prefix = try handle.read(upToCount: 8), prefix.count == 8 else {
            throw ModelError("affine tensor file size or kind differs")
        }
        let size = prefix.withUnsafeBytes { UInt64(littleEndian: $0.loadUnaligned(as: UInt64.self)) }
        guard (1...4_000_000).contains(size), size < UInt64(bytes - 8),
              let header = try handle.read(upToCount: Int(size)), header.count == Int(size) else {
            throw ModelError("affine tensor header exceeds its bound")
        }
        return try VQTensorFile(url: url, identity: .init(fileBytes: bytes, headerBytes: Int(size),
            headerSHA256: digest(header), fileSHA256: sha256), uncachedRandomReads: true,
            shouldContinue: shouldContinue)
    }

    package static func open(baseline: URL, control: URL,
                             shouldContinue: () -> Bool = { true }) throws -> CheckpointIndex {
        let baseline = baseline.resolvingSymlinksInPath(), control = control.resolvingSymlinksInPath()
        func pinned(_ name: String) throws -> Data {
            guard let pin = PinnedModel.files.first(where: { $0.path == name }),
                  let sha = pin.sha256, pin.size > 0, pin.size <= 4_000_000 else {
                throw ModelError("missing original affine metadata pin")
            }
            let raw = try bounded(baseline.appendingPathComponent(name), maximum: Int(pin.size), sha256: sha)
            guard raw.count == Int(pin.size) else { throw ModelError("original affine metadata size changed") }
            return raw
        }
        let manifestData = try bounded(control.appendingPathComponent("manifest.json"), maximum: 4_000_000, sha256: manifestSHA256)
        let manifest = try JSONDecoder().decode(Manifest.self, from: manifestData)
        let configData = try pinned("config.json"), indexData = try pinned("model.safetensors.index.json")
        guard manifest.schema == 1, manifest.complete, !manifest.qualification, manifest.policy == policy,
              manifest.parent_revision == PinnedModel.revision,
              manifest.baseline_config_sha256 == digest(configData), manifest.baseline_index_sha256 == digest(indexData),
              manifest.layers == Array(0..<48), manifest.files.count == 48,
              manifest.expected_output_bytes == 52_848_290_992 else {
            throw ModelError("requires the complete pinned expert-only affine control")
        }
        let original = try JSONDecoder().decode(Index.self, from: indexData).weight_map
        let config = try ModelConfig.parse(configData, label: "authenticated original configuration")
        var owners: [URL: VQTensorFile] = [:], tensors: [String: TensorRef] = [:]
        let names = Set(original.values)
        let originalFiles = PinnedModel.files.filter { !$0.optional && names.contains($0.path) }
        guard original.count == 3215, names.count == 11, originalFiles.count == names.count else {
            throw ModelError("original affine tensor coverage changed")
        }
        for pin in originalFiles.sorted(by: { $0.path < $1.path }) {
            guard shouldContinue(), let sha = pin.sha256 else { throw CheckpointReadError.cancelled }
            let path = baseline.appendingPathComponent(pin.path)
            let owner = try file(path, bytes: Int(pin.size), sha256: sha, shouldContinue: shouldContinue)
            guard Set(owner.tensors.keys) == Set(original.filter { $0.value == pin.path }.keys) else {
                throw ModelError("original tensor file differs from the pinned index")
            }
            owners[path] = owner
            for (key, ref) in owner.tensors {
                let name = key.hasPrefix("language_model.") ? String(key.dropFirst("language_model.".count)) : key
                guard tensors[name] == nil else { throw ModelError("duplicate original affine tensor") }
                tensors[name] = ref
            }
        }
        let expectedFiles = Set((0..<48).map { String(format: "experts-%02d.safetensors", $0) })
        guard Set(manifest.files.map(\.path)) == expectedFiles else { throw ModelError("controlled expert files differ") }
        var total = 0
        for layer in 0..<48 {
            let name = String(format: "experts-%02d.safetensors", layer)
            guard let pin = manifest.files.first(where: { $0.path == name }) else { throw ModelError("missing controlled layer") }
            let path = control.appendingPathComponent(name)
            let owner = try file(path, bytes: pin.size, sha256: pin.sha256, shouldContinue: shouldContinue)
            var expected: Set<String> = []
            for (projection, rows, columns) in [("gate_proj", 640, 2560), ("up_proj", 640, 2560), ("down_proj", 2560, 640)] {
                let module = "model.layers.\(layer).mlp.switch_mlp.\(projection)"
                guard try config.affineQuantization(for: module) == AffineQuantization(bits: 4, groupSize: 64) else {
                    throw ModelError("controlled expert parent descriptor changed")
                }
                for suffix in ["weight", "scales", "biases"] {
                    let key = "language_model." + module + "." + suffix
                    let shape = [512, rows, suffix == "weight" ? columns * 3 / 32 : columns / 64]
                    guard let ref = owner.tensors[key], ref.shape == shape,
                          ref.dtype == (suffix == "weight" ? "U32" : "BF16"), tensors[module + "." + suffix] != nil else {
                        throw ModelError("controlled affine tensor geometry changed")
                    }
                    tensors[module + "." + suffix] = ref; expected.insert(key)
                }
            }
            guard Set(owner.tensors.keys) == expected else { throw ModelError("controlled layer has extra tensors") }
            owners[path] = owner; total = try QuantizationBytes.sum(total, pin.size)
        }
        guard total == manifest.expected_output_bytes, shouldContinue() else { throw ModelError("incomplete affine control") }
        for owner in owners.values { try owner.verifyUnchanged() }
        return try CheckpointIndex(authenticatedDirectory: baseline, config: config.withAffineExpertControl(), files: owners, tensors: tensors)
    }
}
