import CryptoKit
import Darwin
import Foundation
import MLX

/// Authenticated reference coefficients, independently generated from the
/// pinned architecture. Owning this component does not qualify a context
/// length; the caller retains a separately bounded execution window.
package final class VQRotaryCoefficients {
    package static let rows = 262_144
    package static let payloadBytes = rows * 2 * 32 * 4
    package static let sha256 = "f077c4de8473b644afae5b9f939ddb2e70dcdfd876ad3e04d79f05018f133d9a"
    private let values: MLXArray

    package static func supports(_ positions: [Int32]) -> Bool {
        !positions.isEmpty && positions.count <= rows
            && positions.allSatisfy { $0 >= 0 && $0 < Int32(rows) }
    }

    package init(url: URL, shouldContinue: () -> Bool = { true }) throws {
        try ModelProcessGuard.acquire()
        func admit(_ bytes: Int) throws {
            guard shouldContinue() else { throw CheckpointReadError.cancelled }
            guard let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= UInt64(bytes + 3_000_000_000),
                  ProcessMemory.peakResidentBytes() <= 10_000_000_000 else {
                throw ModelError("rotary component lost its load reservation or real headroom")
            }
        }
        try admit(2 * Self.payloadBytes)
        let fd = open(url.path, O_RDONLY | O_NOFOLLOW | O_NONBLOCK | O_CLOEXEC)
        guard fd >= 0 else { throw ModelError("cannot open regular rotary coefficient file") }
        defer { close(fd) }
        var before = stat()
        guard fstat(fd, &before) == 0, before.st_mode & S_IFMT == S_IFREG,
              before.st_size == Self.payloadBytes else {
            throw ModelError("rotary coefficient file kind or extent differs from its pinned identity")
        }
        var data = Data(count: Self.payloadBytes)
        try data.withUnsafeMutableBytes { buffer in
            for offset in stride(from: 0, to: Self.payloadBytes, by: 1_000_000) {
                try admit(Self.payloadBytes)
                let count = min(1_000_000, Self.payloadBytes - offset)
                try ExactRead.transfer(into: buffer.baseAddress!.advanced(by: offset), offset: offset,
                    count: count, shouldContinue: shouldContinue) { destination, remaining, position in
                    let got = pread(fd, destination, remaining, off_t(position))
                    return .init(count: got, error: got < 0 ? errno : 0)
                }
            }
        }
        var after = stat()
        guard SHA256.hash(data: data).map({ String(format: "%02x", $0) }).joined() == Self.sha256,
              fstat(fd, &after) == 0, before.st_dev == after.st_dev, before.st_ino == after.st_ino,
              before.st_size == after.st_size,
              before.st_mtimespec.tv_sec == after.st_mtimespec.tv_sec,
              before.st_mtimespec.tv_nsec == after.st_mtimespec.tv_nsec,
              before.st_ctimespec.tv_sec == after.st_ctimespec.tv_sec,
              before.st_ctimespec.tv_nsec == after.st_ctimespec.tv_nsec else {
            throw ModelError("rotary coefficient bytes changed or failed their complete digest")
        }
        try admit(Self.payloadBytes)
        // Apple Silicon is little-endian. The MLX array owns the captured
        // bytes, so later path/file changes cannot mutate its coefficients.
        let loaded = MLXArray(data, [Self.rows, 2, 32], dtype: .float32)
        eval(loaded)
        try admit(0)
        values = loaded
    }

    package func angles(_ positions: MLXArray) -> (MLXArray, MLXArray) {
        precondition(positions.ndim == 2 && positions.dtype == .int32
            && Self.supports(positions.reshaped([-1]).asArray(Int32.self)),
            "rotary positions exceed the authenticated coefficient component")
        let cosine = values[0..., 0, 0...][positions]
        let sine = values[0..., 1, 0...][positions]
        return (concatenated([cosine, cosine], axis: -1), concatenated([sine, sine], axis: -1))
    }
}
