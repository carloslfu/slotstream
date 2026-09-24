// Persistent prefix cache: configuration, identity and the file format. The
// pure decisions live in PersistentPrefixPolicy.swift; the tier itself in
// PersistentPrefixCache.swift, PersistentPrefixSave.swift and
// PersistentPrefixRestore.swift.
//
// A persisted state is one head file plus the segment files holding its rows.
//
//   <40 hex>.slotprefix   head: token ids, the fixed recurrent arrays and the
//                         draft head's last row, and for every sequence array
//                         (KV, indexer raw and pooled rows, draft KV and
//                         indexer) the ordered segment extents of its live rows
//   <32 hex>.slotseg      segment: absolute row ranges of sequence arrays,
//                         written once and never modified
//
// A turn that continues a persisted state writes a new head and one segment
// holding only the rows that are new since that state; its other extents
// reuse the earlier segments. Both kinds share one container (little-endian):
//
//   "SLOTPFX1"            8 bytes
//   payloads              back to back, in header order
//   header JSON           records with offsets and CRC-32 per payload
//   footer                32 bytes: header offset (u64), header length (u64),
//                         header CRC-32 (u32), reserved (u32), "SLOTEND1"
//
// A fixed array is the row-major bytes of its whole allocated shape. A rows
// record holds rows start..<end for each leading chunk (for KV, each head),
// back to back. Restore places rows in buffers of the allocated shape the head
// records, so capacity, strides and allocated bytes match the saved state.

import CryptoKit
import Foundation
import MLX
import zlib

/// Where persisted conversation states live and how much disk they may use.
///
/// The tier is off unless a caller names a directory. The defaults are
/// provisional starting values for that opt-in tier, not measured optima;
/// `records/design/measured-operating-policies` states each tradeoff.
public struct PersistentPrefixConfiguration: Sendable, Equatable {
    public var directory: URL
    /// Ceiling on every head and segment file in the directory.
    public var maxBytes: Int64
    /// Shortest committed state worth writing, in tokens. Every write stores
    /// the fixed recurrent arrays, so a short conversation that prefills in
    /// seconds is not worth that write on every turn.
    public var minimumTokens: Int
    /// A state neither written nor restored for longer than this is removed,
    /// so conversation contents do not stay on disk indefinitely. Nil keeps
    /// states until the quota needs their room.
    public var maxAge: TimeInterval?

    public static let defaultMaxBytes: Int64 = 20_000_000_000
    public static let defaultMinimumTokens = 1024
    public static let defaultMaxAgeDays = 30
    public static let defaultMaxAge = TimeInterval(defaultMaxAgeDays) * 86_400

    public init(directory: URL, maxBytes: Int64 = PersistentPrefixConfiguration.defaultMaxBytes,
                minimumTokens: Int = PersistentPrefixConfiguration.defaultMinimumTokens,
                maxAge: TimeInterval? = PersistentPrefixConfiguration.defaultMaxAge) {
        self.directory = directory
        self.maxBytes = maxBytes
        self.minimumTokens = minimumTokens
        self.maxAge = maxAge
    }
}

/// The exact code, model files, cache geometry and numerical settings a
/// persisted state belongs to. A state written under any other identity is
/// never restored: its numbers may describe a different computation.
public struct PersistentPrefixIdentity: Equatable {
    /// SHA-256 over the sorted components; the only identity written to files.
    public let digest: String
    package let components: [String: String]
    /// Settings captured with the identity. A request running under different
    /// settings neither restores nor writes.
    package let optimizations: InferenceOptimizations?

    package init(components: [String: String], optimizations: InferenceOptimizations? = nil) {
        self.components = components
        self.optimizations = optimizations
        let canonical = components.keys.sorted().map { "\($0)=\(components[$0]!)" }.joined(separator: "\n")
        digest = PersistentPrefixFile.hex(SHA256.hash(data: Data(canonical.utf8)))
    }

    /// Reads the executable image that contains this code, config.json, and
    /// the first and last 4 MiB of every weight file. Sampled weight content
    /// rather than modification times: a copied model keeps its cache, and a
    /// different checkpoint with identical file sizes does not inherit it.
    public static func make(model: Qwen4ExpModel, modelDirectory: URL) throws -> PersistentPrefixIdentity {
        let directory = modelDirectory.resolvingSymlinksInPath()
        var weights = try CheckpointIndex.shardFiles(in: directory)
        let draft = MTPWeights.fileURL(modelDir: directory)
        if FileManager.default.fileExists(atPath: draft.path) { weights.append(draft) }
        guard !weights.isEmpty else {
            throw ModelError("no weight files in \(directory.path) to identify persisted prefix states")
        }
        guard let code = codeDigest else {
            throw ModelError("cannot read the executable image to identify persisted prefix states")
        }
        let config = try Data(contentsOf: directory.appendingPathComponent("config.json"))
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]
        let cfg = model.cfg
        let geometry = [cfg.hiddenSize, cfg.numKVHeads, cfg.headDim, cfg.indexerHeadDim, cfg.indexerBudget,
                        cfg.indexerCompressRatio, cfg.linearNumKHeads, cfg.linearNumVHeads, cfg.linearKHeadDim,
                        cfg.linearVHeadDim, cfg.convKernel, cfg.pleConvKernel, cfg.ngramSize, cfg.hcCount,
                        cfg.eosTokenId]
        return PersistentPrefixIdentity(components: [
            "format": String(PersistentPrefixFile.formatVersion),
            "slotstream": SlotstreamBuild.version,
            "code": code,
            "config": hex(SHA256.hash(data: config)),
            "weights": try weights.map(sampledDigest).joined(separator: ","),
            "layers": "\(model.runLayers):" + cfg.layerTypes.prefix(model.runLayers).joined(separator: ","),
            "ple_layers": cfg.pleLayerIds.map(String.init).joined(separator: ","),
            "geometry": geometry.map(String.init).joined(separator: ","),
            "optimizations": String(decoding: try encoder.encode(model.optimizations), as: UTF8.self),
            "attention_backend": FusedPrefillAttention.cacheIdentity,
            "context_arithmetic": String(PromptCheckpointKey.currentContextArithmetic),
        ], optimizations: model.optimizations)
    }

    private static func hex(_ digest: SHA256.Digest) -> String { PersistentPrefixFile.hex(digest) }

    /// The image holding this module, which is the executable for a static
    /// link and the library for a dynamic one. Hashed once per process.
    private static let codeDigest: String? = {
        var info = Dl_info()
        guard dladdr(#dsohandle, &info) != 0, let name = info.dli_fname else { return nil }
        let fd = open(name, O_RDONLY | O_CLOEXEC)
        guard fd >= 0 else { return nil }
        defer { close(fd) }
        var hasher = SHA256()
        var buffer = [UInt8](repeating: 0, count: 16 << 20)
        while true {
            let n = buffer.withUnsafeMutableBytes { read(fd, $0.baseAddress, $0.count) }
            if n < 0 && errno == EINTR { continue }
            guard n >= 0 else { return nil }
            if n == 0 { break }
            buffer.withUnsafeBytes { hasher.update(bufferPointer: UnsafeRawBufferPointer(rebasing: $0[0 ..< n])) }
        }
        return hex(hasher.finalize())
    }()

    private static func sampledDigest(_ url: URL) throws -> String {
        let fd = open(url.path, O_RDONLY | O_CLOEXEC)
        guard fd >= 0 else { throw ModelError("cannot read \(url.path) to identify persisted prefix states") }
        defer { close(fd) }
        var info = stat()
        guard fstat(fd, &info) == 0 else { throw ModelError("cannot stat \(url.path)") }
        let size = Int64(info.st_size)
        let window = min(Int64(4 << 20), size)
        var hasher = SHA256()
        var buffer = [UInt8](repeating: 0, count: Int(window))
        for start in Set([Int64(0), size - window]).sorted() {
            try buffer.withUnsafeMutableBytes {
                try PersistentPrefixFile.readAll(fd, $0.baseAddress!, Int(window), at: start)
            }
            hasher.update(data: buffer)
        }
        return "\(url.lastPathComponent):\(size):\(hex(hasher.finalize()))"
    }
}

/// A file that cannot describe a valid state for this identity. It is removed
/// on sight and the request falls back to an ordinary prefill.
package struct PersistentPrefixFileError: Error, CustomStringConvertible {
    package let description: String
    /// Segments whose bytes failed a check; every head using them is unusable.
    package let segments: Set<String>
    package init(_ description: String, segments: Set<String> = []) {
        self.description = description
        self.segments = segments
    }
}

package enum PersistentPrefixFile {
    package static let formatVersion = 3
    package static let headExtension = "slotprefix"
    package static let segmentExtension = "slotseg"
    package static let magic: [UInt8] = Array("SLOTPFX1".utf8)
    package static let footerMagic: [UInt8] = Array("SLOTEND1".utf8)
    package static let footerBytes = 32
    /// Records and small contexts only; token ids and rows are payloads.
    package static let maximumHeaderBytes = 16 << 20
    /// Sanity bound so a damaged header cannot request an absurd allocation.
    /// The largest real array, a KV buffer at the model limit, is ~270 MiB.
    package static let maximumArrayBytes = 16 << 30

    package enum Kind: String, Codable, Sendable { case head, segment }

    package struct ArrayRecord: Codable, Equatable, Sendable {
        package var name: String
        package var dtype: String
        /// Allocated shape, restored exactly.
        package var shape: [Int]
        /// The axis whose leading `length` rows are written.
        package var axis: Int
        package var length: Int
        package var offset: Int64
        package var byteCount: Int64
        package var crc32: UInt32
    }

    package struct IndexerRecord: Codable, Equatable, Sendable {
        package var offset: Int
        package var rawBase: Int
        package var compactRaw: Bool
        package var pooledCount: Int
        package var pooledRatio: Int
    }

    package struct LinearRecord: Codable, Equatable, Sendable {
        package var layer: Int
        package var ngramContext: [Int64]
    }

    package struct AttentionRecord: Codable, Equatable, Sendable {
        package var layer: Int
        package var kvOffset: Int
        package var indexer: IndexerRecord
    }

    package struct DraftRecord: Codable, Equatable, Sendable {
        package var kvOffset: Int
        package var indexer: IndexerRecord
    }

    /// Absolute rows start..<end of one sequence array, held by a segment.
    package struct Extent: Codable, Hashable, Sendable {
        package var segment: String
        package var start: Int
        package var end: Int
        package init(segment: String, start: Int, end: Int) {
            self.segment = segment; self.start = start; self.end = end
        }
    }

    /// One sequence array of a head: allocated shape, the absolute row at
    /// buffer index 0, how many rows are live, and the extents holding them.
    package struct SequenceRecord: Codable, Equatable, Sendable {
        package var name: String
        package var dtype: String
        package var shape: [Int]
        package var axis: Int
        package var base: Int
        package var live: Int
        package var extents: [Extent]
        package var end: Int { base + live }
        package var leading: [Int] { axis >= 0 && axis < shape.count ? Array(shape[..<axis]) : [] }
        package var trailing: [Int] { axis >= 0 && axis < shape.count ? Array(shape[(axis + 1)...]) : [] }

        package init(name: String, dtype: String, shape: [Int], axis: Int, base: Int, live: Int, extents: [Extent]) {
            self.name = name; self.dtype = dtype; self.shape = shape; self.axis = axis
            self.base = base; self.live = live; self.extents = extents
        }
    }

    /// Rows start..<end of one sequence array inside a segment.
    package struct RowsRecord: Codable, Equatable, Sendable {
        package var name: String
        package var dtype: String
        package var leading: [Int]
        package var trailing: [Int]
        package var start: Int
        package var end: Int
        package var offset: Int64
        package var byteCount: Int64
        package var crc32: UInt32

        package init(name: String, dtype: String, leading: [Int], trailing: [Int], start: Int, end: Int,
                     offset: Int64, byteCount: Int64, crc32: UInt32) {
            self.name = name; self.dtype = dtype; self.leading = leading; self.trailing = trailing
            self.start = start; self.end = end; self.offset = offset; self.byteCount = byteCount; self.crc32 = crc32
        }
    }

    package struct Head: Codable, Equatable, Sendable {
        package var format: Int
        package var kind: Kind
        package var identity: String
        package var tokenCount: Int
        /// The state continued an earlier persisted state of its conversation.
        package var continued: Bool
        /// Written inside a prompt at a boundary other conversations start
        /// with, rather than after a reply. Absent means false.
        package var shared: Bool?
        package var compactStateWindows: Bool
        package var ngramContext: [Int64]
        package var linear: [LinearRecord]
        package var attention: [AttentionRecord]
        package var draft: DraftRecord?
        /// Payloads of this file: token ids, recurrent arrays, draft row.
        package var arrays: [ArrayRecord]
        package var sequences: [SequenceRecord]
        /// KV, indexer and draft capacity: what PrefixCache charges per token.
        package var sequenceBytes: Int
        /// Every restored buffer, recurrent state included.
        package var residentBytes: Int
        /// Exact conversation ids for re-rendering history. These may extend
        /// the numerical checkpoint and are NEVER a state-resume boundary.
        package var splicingTokens: [Int]? = nil
        /// Producing pass size, only for a state made entirely by aligned
        /// prefill. Absent on legacy or mixed prefill/decode states.
        package var prefillChunk: Int? = nil
    }

    package struct Segment: Codable, Equatable, Sendable {
        package var format: Int
        package var kind: Kind
        package var identity: String
        package var rows: [RowsRecord]
    }

    /// Enough of any header to classify a file written by any format.
    package struct Probe: Decodable {
        package let format: Int
        package let kind: Kind?
        package let identity: String
    }

    package struct Layout: Equatable, Sendable {
        package let leading: Int
        package let rowBytes: Int
        package let logicalBytes: Int
        package let capacityBytes: Int
    }

    private static func product(_ values: [Int]) -> Int? {
        var result = 1
        for value in values {
            let (next, overflow) = result.multipliedReportingOverflow(by: value)
            if overflow { return nil }
            result = next
        }
        return result
    }

    /// Byte geometry of one array, or nil for any invalid or overflowing shape.
    package static func layout(shape: [Int], axis: Int, length: Int, itemBytes: Int) -> Layout? {
        guard !shape.isEmpty, shape.allSatisfy({ $0 > 0 }), axis >= 0, axis < shape.count,
              length >= 0, length <= shape[axis], itemBytes > 0,
              let leading = product(Array(shape[..<axis])), let trailing = product(Array(shape[(axis + 1)...])),
              let rowBytes = product([trailing, itemBytes]), let chunk = product([leading, rowBytes]),
              let logical = product([chunk, length]), let capacity = product([chunk, shape[axis]]),
              capacity <= maximumArrayBytes else { return nil }
        return Layout(leading: leading, rowBytes: rowBytes, logicalBytes: logical, capacityBytes: capacity)
    }

    /// Chunks and bytes per row for rows along an axis with these dims before
    /// and after it; bytes of `count` rows stay within one array's bound.
    package static func rows(leading: [Int], trailing: [Int], itemBytes: Int,
                             count: Int) -> (chunks: Int, rowBytes: Int, bytes: Int)? {
        guard leading.allSatisfy({ $0 > 0 }), trailing.allSatisfy({ $0 > 0 }), itemBytes > 0, count >= 0,
              let chunks = product(leading), let rowBytes = product(trailing + [itemBytes]),
              let bytes = product([chunks, rowBytes, count]), bytes <= maximumArrayBytes else { return nil }
        return (chunks, rowBytes, bytes)
    }

    package static func footer(headerOffset: Int64, headerLength: Int, headerCRC: UInt32) -> [UInt8] {
        var bytes: [UInt8] = []
        bytes.reserveCapacity(footerBytes)
        withUnsafeBytes(of: UInt64(headerOffset).littleEndian) { bytes.append(contentsOf: $0) }
        withUnsafeBytes(of: UInt64(headerLength).littleEndian) { bytes.append(contentsOf: $0) }
        withUnsafeBytes(of: headerCRC.littleEndian) { bytes.append(contentsOf: $0) }
        withUnsafeBytes(of: UInt32(0)) { bytes.append(contentsOf: $0) }
        bytes.append(contentsOf: footerMagic)
        return bytes
    }

    /// The header location, or nil unless the footer is intact and the header
    /// ends exactly where the footer begins.
    package static func parseFooter(_ bytes: [UInt8], fileSize: Int64) -> (offset: Int64, length: Int, crc: UInt32)? {
        guard bytes.count == footerBytes, Array(bytes[24 ..< 32]) == footerMagic else { return nil }
        func unsigned(_ at: Int, _ count: Int) -> UInt64 {
            (0 ..< count).reduce(UInt64(0)) { $0 | UInt64(bytes[at + $1]) << (8 * UInt64($1)) }
        }
        let offset = unsigned(0, 8), length = unsigned(8, 8)
        guard offset >= UInt64(magic.count), length > 0, length <= UInt64(maximumHeaderBytes),
              fileSize >= Int64(magic.count + footerBytes),
              offset <= UInt64(fileSize), offset + length == UInt64(fileSize - Int64(footerBytes)) else { return nil }
        return (Int64(offset), Int(length), UInt32(unsigned(16, 4)))
    }

    /// Head names are deterministic per identity and token sequence, so a
    /// repeated save replaces its own head atomically.
    package static func fileName(identity: String, tokens: some Collection<Int>) -> String {
        var hasher = SHA256()
        hasher.update(data: Data(identity.utf8))
        tokens.map { Int64($0).littleEndian }.withUnsafeBytes { hasher.update(bufferPointer: $0) }
        return String(hex(hasher.finalize()).prefix(40)) + "." + headExtension
    }

    /// Segment names are random: a segment is never rewritten in place.
    package static func newSegmentName() -> String {
        UUID().uuidString.replacingOccurrences(of: "-", with: "").lowercased() + "." + segmentExtension
    }

    private static func isName(_ name: String, hexDigits: Int, extension ext: String) -> Bool {
        guard name.hasSuffix("." + ext) else { return false }
        let stem = name.dropLast(ext.count + 1)
        return stem.count == hexDigits && stem.allSatisfy { ("0" ... "9").contains($0) || ("a" ... "f").contains($0) }
    }

    package static func isHeadName(_ name: String) -> Bool { isName(name, hexDigits: 40, extension: headExtension) }
    /// Names read from a header are opened only when they pass this check.
    package static func isSegmentName(_ name: String) -> Bool { isName(name, hexDigits: 32, extension: segmentExtension) }

    package static func hex<S: Sequence>(_ bytes: S) -> String where S.Element == UInt8 {
        bytes.map { String(format: "%02x", $0) }.joined()
    }

    package static func crc32(_ pointer: UnsafeRawPointer?, _ count: Int, seed: UInt32 = 0) -> UInt32 {
        guard let pointer, count > 0 else { return seed }
        var crc = UInt(seed)
        var done = 0
        while done < count {
            let chunk = min(count - done, 1 << 30)
            crc = zlib.crc32(crc, pointer.advanced(by: done).assumingMemoryBound(to: UInt8.self), uInt(chunk))
            done += chunk
        }
        return UInt32(truncatingIfNeeded: crc)
    }

    package static func name(of dtype: DType) -> String? {
        switch dtype {
        case .bool: return "bool"
        case .uint8: return "uint8"
        case .uint32: return "uint32"
        case .int32: return "int32"
        case .int64: return "int64"
        case .float16: return "float16"
        case .bfloat16: return "bfloat16"
        case .float32: return "float32"
        default: return nil
        }
    }

    package static func dtype(named name: String) -> DType? {
        switch name {
        case "bool": return .bool
        case "uint8": return .uint8
        case "uint32": return .uint32
        case "int32": return .int32
        case "int64": return .int64
        case "float16": return .float16
        case "bfloat16": return .bfloat16
        case "float32": return .float32
        default: return nil
        }
    }

    package static func encodeHeader<T: Encodable>(_ header: T) throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]
        let json = try encoder.encode(header)
        guard json.count <= maximumHeaderBytes else { throw ModelError("prefix state header is too large") }
        return json
    }

    /// One payload of a container: host bytes, or an array view copied
    /// contiguously when written, so the transient is one array at a time.
    package enum Payload {
        case host([UInt8])
        case array(MLXArray)
    }

    package struct Placed: Equatable, Sendable {
        package var offset: Int64
        package var byteCount: Int64
        package var crc32: UInt32
    }

    /// Write magic, payloads, the header built from where each payload
    /// landed, and the footer to a new file. `expected` is each payload's byte
    /// count; any difference fails the write. Returns the file size.
    package static func writeContainer(to path: String, payloads: [Payload], expected: [Int64],
                                       header: ([Placed]) throws -> Data) throws -> Int64 {
        guard payloads.count == expected.count else { throw ModelError("prefix state payloads are inconsistent") }
        let fd = open(path, O_WRONLY | O_CREAT | O_EXCL | O_CLOEXEC, 0o600)
        guard fd >= 0 else { throw ModelError("cannot create \(path): \(String(cString: strerror(errno)))") }
        defer { close(fd) }
        try magic.withUnsafeBytes { try writeAll(fd, $0.baseAddress!, $0.count) }
        var offset = Int64(magic.count)
        var placed: [Placed] = []
        placed.reserveCapacity(payloads.count)
        func emit(_ raw: UnsafeRawBufferPointer, _ index: Int) throws {
            guard Int64(raw.count) == expected[index] else {
                throw ModelError("prefix state payload \(index) has \(raw.count) bytes, expected \(expected[index])")
            }
            let crc = crc32(raw.baseAddress, raw.count)
            if raw.count > 0 { try writeAll(fd, raw.baseAddress!, raw.count) }
            placed.append(Placed(offset: offset, byteCount: Int64(raw.count), crc32: crc))
            offset += Int64(raw.count)
        }
        for (index, payload) in payloads.enumerated() {
            switch payload {
            case .host(let bytes):
                try bytes.withUnsafeBytes { try emit($0, index) }
            case .array(let view):
                guard expected[index] > 0 else { try emit(UnsafeRawBufferPointer(start: nil, count: 0), index); continue }
                let owned = contiguous(view)
                eval(owned)
                try withExtendedLifetime(owned) {
                    let data = owned.asData(access: .noCopyIfContiguous).data
                    try data.withUnsafeBytes { try emit($0, index) }
                }
            }
        }
        let json = try header(placed)
        guard json.count <= maximumHeaderBytes else { throw ModelError("prefix state header is too large") }
        let crc = json.withUnsafeBytes { crc32($0.baseAddress, $0.count) }
        try json.withUnsafeBytes { try writeAll(fd, $0.baseAddress!, $0.count) }
        let tail = footer(headerOffset: offset, headerLength: json.count, headerCRC: crc)
        try tail.withUnsafeBytes { try writeAll(fd, $0.baseAddress!, $0.count) }
        return offset + Int64(json.count + tail.count)
    }

    /// The header JSON of an intact container and where its payloads end.
    package static func readHeaderData(_ fd: Int32, size: Int64) throws -> (data: Data, payloadEnd: Int64) {
        guard size >= Int64(magic.count + footerBytes) else { throw PersistentPrefixFileError("file is too short") }
        var head = [UInt8](repeating: 0, count: magic.count)
        try head.withUnsafeMutableBytes { try readAll(fd, $0.baseAddress!, $0.count, at: 0) }
        guard head == magic else { throw PersistentPrefixFileError("not a prefix state file") }
        var foot = [UInt8](repeating: 0, count: footerBytes)
        try foot.withUnsafeMutableBytes { try readAll(fd, $0.baseAddress!, $0.count, at: size - Int64($0.count)) }
        guard let footer = parseFooter(foot, fileSize: size) else { throw PersistentPrefixFileError("damaged footer") }
        var json = [UInt8](repeating: 0, count: footer.length)
        try json.withUnsafeMutableBytes { try readAll(fd, $0.baseAddress!, $0.count, at: footer.offset) }
        guard json.withUnsafeBytes({ crc32($0.baseAddress, $0.count) }) == footer.crc else {
            throw PersistentPrefixFileError("header checksum mismatch")
        }
        return (Data(json), footer.offset)
    }

    /// Token ids as little-endian Int32, the head's first payload.
    package static func tokenBytes(_ tokens: [Int]) -> [UInt8] {
        var bytes = [UInt8]()
        bytes.reserveCapacity(tokens.count * 4)
        for token in tokens { withUnsafeBytes(of: Int32(truncatingIfNeeded: token).littleEndian) { bytes.append(contentsOf: $0) } }
        return bytes
    }

    static func readAll(_ fd: Int32, _ pointer: UnsafeMutableRawPointer, _ count: Int, at offset: Int64) throws {
        var done = 0
        while done < count {
            let n = pread(fd, pointer.advanced(by: done), min(count - done, 1 << 30), off_t(offset + Int64(done)))
            if n < 0 && errno == EINTR { continue }
            guard n >= 0 else { throw ModelError("prefix cache read failed: \(String(cString: strerror(errno)))") }
            guard n > 0 else { throw PersistentPrefixFileError("file ends before its recorded data") }
            done += n
        }
    }

    static func writeAll(_ fd: Int32, _ pointer: UnsafeRawPointer, _ count: Int) throws {
        var done = 0
        while done < count {
            let n = Darwin.write(fd, pointer.advanced(by: done), min(count - done, 1 << 30))
            if n < 0 && errno == EINTR { continue }
            guard n > 0 else { throw ModelError("prefix cache write failed: \(String(cString: strerror(errno)))") }
            done += n
        }
    }
}
