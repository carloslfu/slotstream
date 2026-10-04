import CryptoKit
import Darwin
import Foundation

/// Authenticate CPU-only file owners before publishing any checkpoint state.
/// The caller's admission callback stays on its calling thread. Workers see
/// only immutable file identities and a synchronized cancellation flag; they
/// never access MLX, the Engine, its planner, or its request controller.
package enum AuthenticatedTensorBatch {
    package static let maximumFiles = 64
    package static let maximumLanes = 4
    package static let maximumTotalBytes = 200_000_000_000

    package struct Input: Sendable {
        package let url: URL
        package let bytes: Int
        package let sha256: String
        package init(url: URL, bytes: Int, sha256: String) {
            self.url = url; self.bytes = bytes; self.sha256 = sha256
        }
    }

    /// Each owner is created and then exclusively transferred by one worker.
    /// The dictionary and stop/error fields are locked. No owner escapes until
    /// all workers have joined, including on cancellation or a sibling failure.
    private final class Results: @unchecked Sendable {
        private let lock = NSLock()
        private var stopped = false
        private var failure: Error?
        private var owners: [Int: VQTensorFile] = [:]
        var canContinue: Bool { lock.withLock { !stopped } }
        func cancel() { lock.withLock { stopped = true } }
        func fail(_ error: Error) {
            lock.withLock {
                if failure == nil { failure = error }
                stopped = true
            }
        }
        func record(_ owner: VQTensorFile, at index: Int) {
            lock.withLock { if !stopped { owners[index] = owner } }
        }
        func discard() { lock.withLock { owners.removeAll() } }
        func finish(count: Int) throws -> [VQTensorFile] {
            try lock.withLock {
                if let failure { throw failure }
                guard !stopped, owners.count == count else { throw CheckpointReadError.cancelled }
                return (0..<count).map { owners[$0]! }
            }
        }
    }

    /// The preliminary bounded header defines the final owner's identity.
    /// That owner opens its own descriptor and verifies the same header and
    /// complete payload before use. Replacing a path cannot substitute bytes.
    private static func open(_ input: Input, shouldContinue: () -> Bool) throws -> VQTensorFile {
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        let fd = Darwin.open(input.url.path, O_RDONLY | O_NOFOLLOW | O_NONBLOCK | O_CLOEXEC)
        guard fd >= 0 else { throw ModelError("cannot inspect authenticated tensor file") }
        let handle = FileHandle(fileDescriptor: fd, closeOnDealloc: true)
        defer { try? handle.close() }
        var value = stat()
        guard fstat(fd, &value) == 0, value.st_mode & S_IFMT == S_IFREG,
              value.st_size == Int64(input.bytes),
              let prefix = try handle.read(upToCount: 8), prefix.count == 8 else {
            throw ModelError("authenticated tensor file size or kind differs")
        }
        let size = prefix.withUnsafeBytes { UInt64(littleEndian: $0.loadUnaligned(as: UInt64.self)) }
        guard (1...4_000_000).contains(size), size < UInt64(input.bytes - 8),
              let header = try handle.read(upToCount: Int(size)), header.count == Int(size) else {
            throw ModelError("authenticated tensor header exceeds its bound")
        }
        return try VQTensorFile(url: input.url, identity: .init(fileBytes: input.bytes, headerBytes: Int(size),
            headerSHA256: SHA256.hash(data: header).map { String(format: "%02x", $0) }.joined(), fileSHA256: input.sha256),
            uncachedRandomReads: true, shouldContinue: shouldContinue)
    }

    /// Four lanes are a bounded startup hypothesis, not a measured optimum.
    /// Per lane, authentication owns at most two bounded headers, one hash
    /// chunk and parsed metadata. Complete payloads are never materialized.
    /// The existing file reader keeps its one-MB payload syscall bound.
    package static func open(_ inputs: [Input], lanes: Int = maximumLanes,
                             shouldContinue: () -> Bool = { true }) throws -> [VQTensorFile] {
        guard (1...maximumFiles).contains(inputs.count), (1...maximumLanes).contains(lanes),
              Set(inputs.map(\.url)).count == inputs.count else {
            throw ModelError("authenticated tensor batch exceeds its file or lane bound")
        }
        var total = 0
        for input in inputs {
            guard input.url.isFileURL, input.bytes > 8, input.bytes <= maximumTotalBytes,
                  input.sha256.utf8.count == 64,
                  input.sha256.utf8.allSatisfy({ (48...57).contains($0) || (97...102).contains($0) }) else {
                throw ModelError("invalid authenticated tensor batch identity")
            }
            total = try QuantizationBytes.sum(total, input.bytes)
        }
        guard total <= maximumTotalBytes else { throw ModelError("authenticated tensor batch exceeds its byte bound") }
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        let results = Results(), group = DispatchGroup(), count = min(lanes, inputs.count)
        defer { results.discard() }
        let queue = DispatchQueue(label: "slotstream.tensor-authentication", attributes: .concurrent)
        for lane in 0..<count {
            group.enter()
            queue.async {
                defer { group.leave() }
                for index in stride(from: lane, to: inputs.count, by: count) {
                    guard results.canContinue else { break }
                    do {
                        try autoreleasepool {
                            results.record(try open(inputs[index], shouldContinue: { results.canContinue }), at: index)
                        }
                    } catch {
                        results.fail(error)
                    }
                }
            }
        }
        var callerCancelled = false
        while group.wait(timeout: .now() + .milliseconds(25)) == .timedOut {
            if !callerCancelled && !shouldContinue() {
                callerCancelled = true; results.cancel()
            }
        }
        // No return or throw above can abandon a worker. A failed lane stops
        // siblings at their next bounded read; all owned descriptors drain.
        guard !callerCancelled, shouldContinue() else { throw CheckpointReadError.cancelled }
        let owners = try results.finish(count: inputs.count)
        for owner in owners { try owner.verifyUnchanged() }
        return owners
    }
}
