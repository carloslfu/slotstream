import CryptoKit
import Darwin
import Foundation
import MLX

/// Research-only composite adapter. Its complete tensor map is immutable and
/// independently authenticated; public pack loading never constructs this type.
/// It owns baseline descriptors, preserves unmatched VQ tensors and never
/// copies an entire model into memory or rewrites an installed file.
package final class VQDenseOverlay {
    package static let identitySHA256 = "f31f100d47f062c415251d92a4c14956b2328e393294a9680eb2ba9c1664f645"
    package static let parentInventorySHA256 = "098c79fea05981b86145109a76cfcba5a22c51d4738cd3e9f00c23ae6d8531fe"
    package static let manifestSHA256 = "4cdae0e9c26b9a0dd07659cd9d71dd025ed110b49161c152df09d5a7f75ac28b"
    package static let residentPayloadBytes = 2_893_477_400
    /// Each research mixture binds its own VQ parent and complete tensor map.
    /// The original constants remain the historical 3.2 identity. In particular,
    /// admitting this 2.1 screen must not inherit the 3.2 timing or cache recipe.
    package struct Profile: Equatable, Sendable {
        package let manifest: String, identity: String, inventory: String, policy: String
        package static let vq32 = Self(manifest: VQDenseOverlay.manifestSHA256,
            identity: VQDenseOverlay.identitySHA256, inventory: VQDenseOverlay.parentInventorySHA256,
            policy: "vq32-experts-ple-with-pinned-affine4-dense-v1")
        package static let vq21 = Self(
            manifest: "e63df59b442df3fddb8b2fbaf68f9d1fb76e90f245fdeedddd450ad5a2697fae",
            identity: "bf922f0a087a0e357d527f9c31cd645aa1e96bb4ce5acc34973baed2e36752dd",
            inventory: "4f63194dec2e4c3bec31289d6503cc7c886685e16e7c4aac58116d4cf0c7f037",
            policy: "vq21-experts-ple-with-pinned-affine4-dense-v1")

        package static func select(manifest: String, inventory: String) throws -> Self {
            guard let profile = [vq32, vq21].first(where: {
                $0.manifest == manifest && $0.inventory == inventory
            }) else { throw ModelError("dense composite requires its exact manifest and VQ parent") }
            return profile
        }

        package static func matches(identity: String?, inventory: String, policy: String?) -> Bool {
            [vq32, vq21].contains { $0.identity == identity && $0.inventory == inventory && $0.policy == policy }
        }
    }
    package let profile: Profile
    private struct Tensor: Decodable {
        let dtype: String, shape: [Int], data_offsets: [Int]
        var bytes: Int { data_offsets[1] - data_offsets[0] }
    }
    private struct Module: Decodable {
        let module: String, keys: [String], baseline_keys: [String], shards: [String]
        let old: [Tensor], new: [Tensor]
    }
    private struct Source: Decodable { let path: String, size: Int, sha256: String, optional: Bool }
    private struct Header: Decodable { let parent: String, file: String, bytes: Int, header_sha256: String }
    private struct Manifest: Decodable {
        let policy: String, sha256: String, vq_inventory_sha256: String
        let modules: [Module], source_files: [Source], headers: [Header]
        let replaced_bytes: Int, replacement_bytes: Int
    }
    private struct Binding { let source: String, shard: String, tensor: Tensor }
    private let directory: URL
    private let bindings: [String: Binding]
    private let sources: [String: Source]
    private let headers: [String: Header]
    private var files: [String: VQTensorFile] = [:]
    package let recipes: [String: AffineQuantization]
    package let largestLoadCopyBytes: Int
    package var verifiedFileCount: Int { files.count }
    package var verifiedPayloadBytes: Int { files.keys.reduce(0) { $0 + sources[$1]!.size } }

    private static func digest(_ data: Data) -> String {
        SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined()
    }

    package init(baseline: URL, manifest: URL, inventorySHA256: String) throws {
        let fd = open(manifest.path, O_RDONLY | O_NOFOLLOW | O_NONBLOCK | O_CLOEXEC)
        guard fd >= 0 else { throw ModelError("cannot open dense composite manifest") }
        let handle = FileHandle(fileDescriptor: fd, closeOnDealloc: true)
        defer { try? handle.close() }
        var status = stat()
        guard fstat(fd, &status) == 0, status.st_mode & S_IFMT == S_IFREG,
              (1...4_000_000).contains(status.st_size),
              let raw = try handle.read(upToCount: 4_000_001), raw.count == Int(status.st_size) else {
            throw ModelError("dense composite requires its exact manifest and VQ parent")
        }
        let selected = try Profile.select(manifest: Self.digest(raw), inventory: inventorySHA256)
        guard var object = try JSONSerialization.jsonObject(with: raw) as? [String: Any],
              object.removeValue(forKey: "sha256") as? String == selected.identity else {
            throw ModelError("dense composite identity changed")
        }
        let canonical = try JSONSerialization.data(withJSONObject: object, options: [.sortedKeys, .withoutEscapingSlashes])
        guard Self.digest(canonical) == selected.identity else { throw ModelError("dense composite tensor map changed") }
        let spec = try JSONDecoder().decode(Manifest.self, from: raw)
        guard spec.policy == selected.policy, spec.sha256 == selected.identity,
              spec.vq_inventory_sha256 == inventorySHA256, spec.modules.count == 498,
              spec.replaced_bytes == 5_152_768_000, spec.replacement_bytes == 2_727_936_000 else {
            throw ModelError("dense composite identity or byte ledger differs")
        }
        var entries: [String: Binding] = [:], overrides: [String: AffineQuantization] = [:]
        var bytes = 0, largest = 0
        for module in spec.modules {
            guard module.keys.count == 3, module.baseline_keys.count == 3, module.shards.count == 3,
                  module.old.count == 3, module.new.count == 3, overrides[module.module] == nil else {
                throw ModelError("dense composite has incomplete tensor triples")
            }
            overrides[module.module] = try AffineQuantization(bits: 4, groupSize: 64)
            for index in 0..<3 {
                let key = module.keys[index], tensor = module.new[index]
                guard entries[key] == nil, tensor.data_offsets.count == 2, tensor.bytes > 0,
                      module.baseline_keys[index] == "language_model." + key else {
                    throw ModelError("dense composite has invalid tensor identity")
                }
                entries[key] = Binding(source: module.baseline_keys[index], shard: module.shards[index], tensor: tensor)
                bytes = try QuantizationBytes.sum(bytes, tensor.bytes); largest = max(largest, tensor.bytes)
            }
        }
        guard bytes == spec.replacement_bytes, entries.count == 1494 else { throw ModelError("dense composite is not complete") }
        var sourceMap: [String: Source] = [:], headerMap: [String: Header] = [:]
        for source in spec.source_files {
            guard !source.optional, sourceMap[source.path] == nil,
                  let pin = PinnedModel.files.first(where: { $0.path == source.path }),
                  pin.sha256 == source.sha256, pin.size == Int64(source.size), !pin.optional else {
                throw ModelError("dense composite baseline source differs from its pinned original")
            }
            sourceMap[source.path] = source
        }
        for header in spec.headers where header.parent == "baseline" {
            guard headerMap[header.file] == nil, sourceMap[header.file]?.size == header.bytes else {
                throw ModelError("dense composite baseline header differs")
            }
            headerMap[header.file] = header
        }
        guard Set(sourceMap.keys) == Set(entries.values.map(\.shard)), Set(headerMap.keys) == Set(sourceMap.keys),
              sourceMap.count == 9 else { throw ModelError("dense composite source coverage differs") }
        directory = baseline.resolvingSymlinksInPath(); bindings = entries; sources = sourceMap; headers = headerMap
        recipes = overrides; largestLoadCopyBytes = largest; profile = selected
    }

    package func bytes(for name: String) -> Int? { bindings[name]?.tensor.bytes }

    private func file(_ name: String, shouldContinue: () -> Bool) throws -> VQTensorFile {
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        if let file = files[name] { try file.verifyUnchanged(); return file }
        guard let source = sources[name], let expected = headers[name] else { throw ModelError("unbound dense composite shard") }
        let path = directory.appendingPathComponent(name)
        let fd = open(path.path, O_RDONLY | O_NOFOLLOW | O_NONBLOCK | O_CLOEXEC)
        guard fd >= 0 else { throw ModelError("cannot open dense composite source") }
        let reader = FileHandle(fileDescriptor: fd, closeOnDealloc: true)
        defer { try? reader.close() }
        var status = stat()
        guard fstat(fd, &status) == 0, status.st_mode & S_IFMT == S_IFREG, status.st_size == Int64(source.size),
              let prefix = try reader.read(upToCount: 8), prefix.count == 8 else {
            throw ModelError("dense composite source size or kind differs")
        }
        let size = prefix.withUnsafeBytes { UInt64(littleEndian: $0.loadUnaligned(as: UInt64.self)) }
        guard (1...4_000_000).contains(size), size < UInt64(source.size - 8),
              let header = try reader.read(upToCount: Int(size)), header.count == Int(size),
              Self.digest(prefix + header) == expected.header_sha256 else {
            throw ModelError("dense composite source header differs")
        }
        // The final owner independently verifies the entire original file and
        // its header. A replaced path between these opens therefore fails.
        let owner = try VQTensorFile(url: path, identity: .init(fileBytes: source.size,
            headerBytes: Int(size), headerSHA256: Self.digest(header), fileSHA256: source.sha256),
            shouldContinue: shouldContinue)
        for entry in bindings.values where entry.shard == name {
            guard let ref = owner.tensors[entry.source], ref.dtype == entry.tensor.dtype,
                  ref.shape == entry.tensor.shape, ref.byteCount == entry.tensor.bytes,
                  ref.byteOffset == 8 + Int(size) + entry.tensor.data_offsets[0] else {
                throw ModelError("dense composite tensor does not match its authenticated map")
            }
        }
        files[name] = owner
        return owner
    }

    package func authenticateAll(shouldContinue: () -> Bool = { true }) throws {
        for name in sources.keys.sorted() { _ = try file(name, shouldContinue: shouldContinue) }
    }

    package func array(_ name: String, rows: [Int]? = nil, maximumBytes: Int,
                       shouldContinue: () -> Bool = { true }) throws -> MLXArray {
        guard let entry = bindings[name], (1...800_000_000).contains(maximumBytes) else {
            throw ModelError("dense composite tensor or allocation bound is invalid")
        }
        let owner = try file(entry.shard, shouldContinue: shouldContinue)
        let tensor = entry.tensor, rowBytes = tensor.bytes / tensor.shape[0]
        let shape: [Int], ranges: [(Int, Int)]
        if let rows {
            guard (1...8192).contains(rows.count), rows.allSatisfy({ (0..<tensor.shape[0]).contains($0) }),
                  try QuantizationBytes.product(rows.count, rowBytes) <= maximumBytes else {
                throw ModelError("dense composite row request exceeds its bound")
            }
            shape = [rows.count] + Array(tensor.shape.dropFirst()); ranges = rows.map { ($0 * rowBytes, rowBytes) }
        } else {
            guard tensor.bytes <= maximumBytes else { throw ModelError("dense composite tensor exceeds its bound") }
            shape = tensor.shape; ranges = [(0, tensor.bytes)]
        }
        var data = Data(); data.reserveCapacity(ranges.reduce(0) { $0 + $1.1 })
        for (offset, count) in ranges {
            var at = 0
            while at < count {
                let amount = min(VQTensorFile.maximumRead, count - at)
                data.append(try owner.read(entry.source, offset: offset + at, count: amount, shouldContinue: shouldContinue)); at += amount
            }
        }
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        guard tensor.dtype == "U32" || tensor.dtype == "BF16" else { throw ModelError("dense composite tensor dtype changed") }
        return MLXArray(data, shape, dtype: tensor.dtype == "U32" ? .uint32 : .bfloat16)
    }
}
