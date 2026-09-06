import Foundation
#if canImport(CryptoKit)
import CryptoKit
#else
import Crypto
#endif
import CSlotpack

struct SlotpackManifest: Codable {
    struct Range: Codable {
        let file: Int
        let offset: Int64
        let length: Int
    }
    struct Object: Codable {
        let sha256: String
        let size: Int
        let rawSize: Int
        let rawSHA256: String
        let ranges: [Range]
        var path: String { "objects/\(sha256.prefix(2))/\(sha256).bin" }
    }
    let format: String
    let files: [PinnedModel.File]
    let objects: [Object]

    static func digest(_ bytes: Data) -> String {
        SHA256.hash(data: bytes).map { String(format: "%02x", $0) }.joined()
    }
    static func validDigest(_ s: String) -> Bool {
        s.utf8.count == 64 && s.utf8.allSatisfy { (48...57).contains($0) || (97...102).contains($0) }
    }
    static func load(_ data: Data, digest: String, files pins: [PinnedModel.File]) throws -> Self {
        guard data.count <= 16 << 20, validDigest(digest), Self.digest(data) == digest else {
            throw SlotstreamError.pull("compressed manifest does not match its pinned SHA-256")
        }
        let manifest = try JSONDecoder().decode(Self.self, from: data)
        try manifest.validate(files: pins)
        return manifest
    }
    func validate(files pins: [PinnedModel.File]) throws {
        func invalid() -> SlotstreamError { .pull("invalid compressed manifest") }
        guard format == "slotpack-v1", files.count == pins.count,
            !objects.isEmpty, objects.count <= 20_000 else { throw invalid() }
        for (file, pin) in zip(files, pins) {
            guard file.path == pin.path, file.size == pin.size, file.size > 0,
                file.sha256 == pin.sha256, file.optional == pin.optional,
                file.sha256.map(Self.validDigest) == true,
                !file.path.isEmpty, !file.path.contains("/"), file.path != ".", file.path != ".."
            else { throw invalid() }
        }
        var coverage = Array(repeating: [(Int64, Int64)](), count: files.count)
        for object in objects {
            guard Self.validDigest(object.sha256), Self.validDigest(object.rawSHA256),
                object.size >= 32, object.size <= Int(SLOTPACK_MAX_ENCODED),
                object.rawSize > 0, object.rawSize <= Int(SLOTPACK_MAX_RAW),
                (1...3).contains(object.ranges.count) else { throw invalid() }
            var sum = 0
            var optional: Bool?
            for range in object.ranges {
                guard files.indices.contains(range.file), range.offset >= 0,
                    range.length > 0, range.length <= object.rawSize,
                    range.offset <= files[range.file].size - Int64(range.length)
                else { throw invalid() }
                if let optional, optional != files[range.file].optional { throw invalid() }
                optional = files[range.file].optional
                sum += range.length
                coverage[range.file].append((range.offset, range.offset + Int64(range.length)))
            }
            guard sum == object.rawSize else { throw invalid() }
        }
        for (i, ranges) in coverage.enumerated() {
            var end: Int64 = 0
            for range in ranges.sorted(by: { $0.0 < $1.0 }) {
                guard range.0 == end else { throw invalid() }
                end = range.1
            }
            guard end == files[i].size else { throw invalid() }
        }
    }
    static func decode(_ encoded: Data, object: Object) throws -> Data {
        guard encoded.count == object.size, digest(encoded) == object.sha256 else {
            throw SlotstreamError.pull("compressed object SHA-256 mismatch")
        }
        return try decodeVerified(encoded, object: object)
    }
    /// The HTTP worker has already checked encoded size and SHA-256 before
    /// handing this immutable Data to the bounded decode queue.
    static func decodeVerified(_ encoded: Data, object: Object) throws -> Data {
        guard encoded.count == object.size else { throw SlotstreamError.pull("compressed object size mismatch") }
        guard object.rawSize > 0, object.rawSize <= Int(SLOTPACK_MAX_RAW) else {
            throw SlotstreamError.pull("invalid reconstruction size")
        }
        var raw = Data(count: object.rawSize)
        let code = raw.withUnsafeMutableBytes { output in
            encoded.withUnsafeBytes { input in
                slotpack_decode(input.bindMemory(to: UInt8.self).baseAddress, encoded.count,
                    output.bindMemory(to: UInt8.self).baseAddress, object.rawSize)
            }
        }
        guard code == 0, digest(raw) == object.rawSHA256 else {
            throw SlotstreamError.pull("compressed object reconstruction failed verification")
        }
        return raw
    }
}
