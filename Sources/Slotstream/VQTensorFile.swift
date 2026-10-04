import CoreFoundation
import CryptoKit
import Darwin
import Foundation

/// Experimental, immutable safetensors access. The caller must authenticate
/// the supplied identities against its pinned pack manifest. This constructor
/// verifies the entire payload through the same owned descriptor later used
/// for tensor reads; a header hash alone never admits model bytes.
package final class VQTensorFile {
    package static let maximumRead = 1_000_000
    package static let maximumPackedRecordRead = 2_621_440
    package struct Identity {
        package let fileBytes: Int
        package let headerBytes: Int
        package let headerSHA256: String
        package let fileSHA256: String
        package init(fileBytes: Int, headerBytes: Int, headerSHA256: String, fileSHA256: String) {
            self.fileBytes = fileBytes; self.headerBytes = headerBytes
            self.headerSHA256 = headerSHA256; self.fileSHA256 = fileSHA256
        }
    }
    private struct Stamp: Equatable {
        let device: dev_t, inode: ino_t, bytes: off_t
        let modifiedSeconds: Int, modifiedNanos: Int, changedSeconds: Int, changedNanos: Int
        init(_ value: stat) {
            device = value.st_dev; inode = value.st_ino; bytes = value.st_size
            modifiedSeconds = value.st_mtimespec.tv_sec; modifiedNanos = value.st_mtimespec.tv_nsec
            changedSeconds = value.st_ctimespec.tv_sec; changedNanos = value.st_ctimespec.tv_nsec
        }
    }
    private let descriptor: Int32
    private let url: URL
    private let stamp: Stamp
    private let byteRanges: [Int: Set<Int>]
    package let tensors: [String: TensorRef]
    package let uncachedRandomReads: Bool
    /// The complete payload digest verified through this owned descriptor.
    package let fileSHA256: String

    private static func hash(_ data: Data) -> String {
        SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined()
    }
    private static func status(_ fd: Int32) throws -> stat {
        var value = stat()
        guard fstat(fd, &value) == 0 else { throw ModelError("cannot inspect owned VQ tensor descriptor") }
        return value
    }
    private static func raw(_ fd: Int32, offset: Int, count: Int, maximumSyscall: Int = maximumRead,
                            shouldContinue: () -> Bool = { true }) throws -> Data {
        // Header reads may exceed a payload read, but are still bounded before
        // allocation. Ordinary syscalls stay at one megabyte. Only an explicit
        // authenticated packed-record read admits its complete bounded row.
        guard offset >= 0, count > 0, count <= 4_000_000,
              (maximumRead...maximumPackedRecordRead).contains(maximumSyscall),
              !offset.addingReportingOverflow(count).overflow else { throw CheckpointReadError.invalidRange }
        var data = Data(count: count)
        try data.withUnsafeMutableBytes { buffer in
            try ExactRead.transfer(into: buffer.baseAddress!, offset: offset, count: count, shouldContinue: shouldContinue) { destination, remaining, position in
                let got = pread(fd, destination, min(remaining, maximumSyscall), off_t(position))
                return .init(count: got, error: got < 0 ? errno : 0)
            }
        }
        return data
    }

    package init(url: URL, identity: Identity, uncachedRandomReads: Bool = false, shouldContinue: () -> Bool = { true }) throws {
        func validSHA(_ value: String) -> Bool {
            value.utf8.count == 64 && value.utf8.allSatisfy { (48...57).contains($0) || (97...102).contains($0) }
        }
        guard identity.fileBytes > 8, identity.fileBytes <= 200_000_000_000,
              (1...4_000_000).contains(identity.headerBytes), identity.headerBytes <= identity.fileBytes - 8,
              validSHA(identity.headerSHA256), validSHA(identity.fileSHA256) else {
            throw ModelError("invalid pinned VQ safetensors identity")
        }
        let fd = open(url.path, O_RDONLY | O_NOFOLLOW | O_NONBLOCK | O_CLOEXEC)
        guard fd >= 0 else { throw ModelError("cannot open regular VQ tensor file") }
        do {
            let initial = try Self.status(fd)
            guard initial.st_mode & S_IFMT == S_IFREG, initial.st_size == Int64(identity.fileBytes) else {
                throw ModelError("VQ tensor file kind or size differs from its pinned identity")
            }
            let prefix = try Self.raw(fd, offset: 0, count: 8, shouldContinue: shouldContinue)
            let length = prefix.withUnsafeBytes { UInt64(littleEndian: $0.loadUnaligned(as: UInt64.self)) }
            guard length == UInt64(identity.headerBytes) else { throw ModelError("VQ tensor header extent changed") }
            let header = try Self.raw(fd, offset: 8, count: identity.headerBytes, shouldContinue: shouldContinue)
            guard Self.hash(header) == identity.headerSHA256,
                  let object = try JSONSerialization.jsonObject(with: header) as? [String: Any] else {
                throw ModelError("VQ tensor header identity or JSON is invalid")
            }
            let dataStart = 8 + identity.headerBytes, dataBytes = identity.fileBytes - dataStart
            var parsed: [String: TensorRef] = [:]
            func integer(_ value: Any) throws -> Int {
                guard let n = value as? NSNumber, CFGetTypeID(n) != CFBooleanGetTypeID(),
                      !["f", "d"].contains(String(cString: n.objCType)),
                      let result = value as? Int, result >= 0 else { throw ModelError("invalid VQ tensor extent") }
                return result
            }
            for (name, value) in object where name != "__metadata__" {
                guard let value = value as? [String: Any], let dtype = value["dtype"] as? String,
                      let dimensions = value["shape"] as? [Any], let offsets = value["data_offsets"] as? [Any],
                      offsets.count == 2 else { throw ModelError("malformed VQ tensor header entry") }
                let shape = try dimensions.map(integer), range = try offsets.map(integer)
                guard range[0] <= range[1], range[1] <= dataBytes else { throw CheckpointReadError.invalidRange }
                let ref = TensorRef(file: url, dtype: dtype, shape: shape,
                    byteOffset: dataStart + range[0], byteCount: range[1] - range[0])
                guard ref.itemSize > 0 else { throw ModelError("unsupported VQ tensor dtype") }
                var bytes = ref.itemSize
                for size in shape { bytes = try QuantizationBytes.product(bytes, size) }
                guard bytes == ref.byteCount else { throw ModelError("VQ tensor bytes do not match its shape") }
                parsed[name] = ref
            }
            var cursor = dataStart
            for ref in parsed.values.sorted(by: { ($0.byteOffset, $0.byteCount) < ($1.byteOffset, $1.byteCount) }) {
                guard ref.byteOffset == cursor else { throw ModelError("VQ tensor payload has holes or overlaps") }
                cursor += ref.byteCount
            }
            guard cursor == identity.fileBytes else { throw ModelError("VQ tensors do not cover their file") }
            var digest = SHA256(), offset = 0
            while offset < identity.fileBytes {
                guard shouldContinue() else { throw CheckpointReadError.cancelled }
                let count = min(Self.maximumRead, identity.fileBytes - offset)
                digest.update(data: try Self.raw(fd, offset: offset, count: count, shouldContinue: shouldContinue)); offset += count
            }
            guard shouldContinue() else { throw CheckpointReadError.cancelled }
            guard digest.finalize().map({ String(format: "%02x", $0) }).joined() == identity.fileSHA256,
                  Stamp(try Self.status(fd)) == Stamp(initial) else {
                throw ModelError("VQ tensor payload changed or failed its complete-file digest")
            }
            // Research opt-in, frozen before the owner is published to read
            // lanes. Authentication is unchanged and does not imply cold SSD.
            // These hints cover this entire shard, including its dense tensors.
            if uncachedRandomReads {
                guard fcntl(fd, F_NOCACHE, 1) == 0, fcntl(fd, F_RDAHEAD, 0) == 0 else {
                    throw ModelError("cannot configure uncached random VQ shard reads")
                }
            }
            self.uncachedRandomReads = uncachedRandomReads
            self.fileSHA256 = identity.fileSHA256
            descriptor = fd; self.url = url; stamp = Stamp(initial); tensors = parsed
            byteRanges = Dictionary(grouping: parsed.values, by: \.byteOffset).mapValues { Set($0.map(\.byteCount)) }
        } catch {
            close(fd)
            throw error
        }
    }

    deinit { close(descriptor) }

    package func verifyUnchanged() throws {
        guard Stamp(try Self.status(descriptor)) == stamp else { throw ModelError("owned VQ tensor file changed") }
    }

    /// Borrowed only while the owning index remains alive. Ordinary tensor
    /// reads use readDirect so mutations are checked around every transfer.
    package func checkedDescriptor() throws -> Int32 {
        try verifyUnchanged()
        return descriptor
    }

    /// Allocation-free affine checkpoint access into an already reserved
    /// destination. The complete range must belong to one authenticated
    /// tensor; individual syscalls stay bounded. This does not enlarge the
    /// allocation-returning read API or packed-record admission above.
    package func readDirect(into destination: UnsafeMutableRawPointer, ref: TensorRef,
                            offset: Int, count: Int, shouldContinue: () -> Bool = { true }) throws {
        guard ref.file == url, byteRanges[ref.byteOffset]?.contains(ref.byteCount) == true else {
            throw CheckpointReadError.invalidRange
        }
        let absolute = try ExactRead.tensorOffset(base: ref.byteOffset, length: ref.byteCount, offset: offset, count: count)
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        try verifyUnchanged()
        try ExactRead.transfer(into: destination, offset: absolute, count: count, shouldContinue: shouldContinue) { pointer, remaining, position in
            let got = pread(descriptor, pointer, min(remaining, Self.maximumRead), off_t(position))
            return .init(count: got, error: got < 0 ? errno : 0)
        }
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        try verifyUnchanged()
    }

    /// Retaining this object retains the verified descriptor. Partial reads,
    /// cancellation or a changed file publish no Data to the caller.
    package func read(_ name: String, offset: Int, count: Int,
                      shouldContinue: () -> Bool = { true }) throws -> Data {
        try readBounded(name, offset: offset, count: count, limit: Self.maximumRead, shouldContinue: shouldContinue)
    }

    /// Separate admission for the two inspected aligned complete-record rows.
    /// No generic tensor request gains a larger payload limit.
    package func readPackedRecord(expert: Int, shouldContinue: () -> Bool = { true }) throws -> Data {
        guard (0..<512).contains(expert), tensors.count == 1, let ref = tensors["records"],
              ref.dtype == "U8", ref.shape.count == 2, ref.shape[0] == 512,
              [1_851_392, 2_621_440].contains(ref.rowBytes), ref.shape[1] == ref.rowBytes else {
            throw CheckpointReadError.invalidRange
        }
        return try readBounded("records", offset: expert * ref.rowBytes, count: ref.rowBytes,
                               limit: Self.maximumPackedRecordRead, shouldContinue: shouldContinue)
    }

    private func readBounded(_ name: String, offset: Int, count: Int, limit: Int,
                             shouldContinue: () -> Bool) throws -> Data {
        guard let ref = tensors[name], (1...limit).contains(count) else {
            throw CheckpointReadError.invalidRange
        }
        let absolute = try ExactRead.tensorOffset(base: ref.byteOffset, length: ref.byteCount, offset: offset, count: count)
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        try verifyUnchanged()
        let data = try Self.raw(descriptor, offset: absolute, count: count, maximumSyscall: limit,
                                shouldContinue: shouldContinue)
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        try verifyUnchanged()
        return data
    }
}
