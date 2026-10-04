import CryptoKit
import Darwin
import Foundation
import Slotstream

/// Device-local activation history. It contains no prompts, conversations or
/// model bytes, and never turns downloaded metadata into a trusted pack.
/// The inference owner holds the lease for its lifetime, including idle unload.
package final class ModelActivationJournal {
    package enum Phase: String, Codable, CaseIterable {
        case requested, verified, loading, checking, committed, failed
        var unfinished: Bool { self != .committed && self != .failed }
    }
    package struct Selection: Codable, Equatable {
        package let preferences: PerformancePreferences
        package let packID: String
        package let manifest: String
        package init(_ preferences: PerformancePreferences) throws {
            try PerformancePolicy.validateSaved(preferences)
            let pack = try ModelPackRegistry.resolve(preferences.quantization).pack
            self.preferences = preferences; packID = pack.id; manifest = pack.manifestDigest
        }
        package func validate() throws {
            guard try Self(preferences) == self else {
                throw SevraError.refused("This model activation belongs to a different supported pack. Choose model settings again.")
            }
        }
    }
    package struct Receipt: Codable, Equatable {
        package let selection: Selection
        package let generation: UUID
        package let arithmeticIdentity: String
        package let healthTokens: Int
        package init(selection: Selection, generation: UUID, arithmeticIdentity: String, healthTokens: Int) {
            self.selection = selection; self.generation = generation
            self.arithmeticIdentity = arithmeticIdentity; self.healthTokens = healthTokens
        }
    }
    package struct Attempt: Codable, Equatable {
        package let id: UUID
        package let selection: Selection
        package let previous: Receipt?
        package var phase: Phase
        /// Fixed diagnostic codes only. Never persist an arbitrary error that
        /// might contain a prompt, tool result or a private filesystem path.
        package var failure: String?
    }
    package struct State: Codable, Equatable {
        package var schema = 1
        package var lastGood: Receipt?
        package var attempt: Attempt?
    }
    package enum WritePoint { case beforeWrite, beforeRename, afterRename, beforeArchive, afterArchive }
    package struct RecoverableHistory: Error, LocalizedError {
        package let message: String
        public var errorDescription: String? { message }
    }
    private let directory: Int32
    private let lease: Int32
    private let fault: ((WritePoint) throws -> Void)?
    package private(set) var state: State
    package let archivedRecordName: String?
    private static let maximumBytes = 65_536

    /// Separate roots prevent a custom model directory or a second install
    /// from changing the normal app's activation history.
    public static func defaultDirectory(model: URL) -> URL {
        let key = SHA256.hash(data: Data(model.standardizedFileURL.resolvingSymlinksInPath().path.utf8))
            .map { String(format: "%02x", $0) }.joined()
        return FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("Sevra/ModelActivation/" + key, isDirectory: true)
    }

    package init(directory url: URL, fault: ((WritePoint) throws -> Void)? = nil,
                 archiveInvalidState: Bool = false) throws {
        try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true,
            attributes: [.posixPermissions: 0o700])
        let dir = open(url.path, O_RDONLY | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC)
        guard dir >= 0 else { throw SevraError.refused("Cannot open local model activation history.") }
        var info = stat()
        guard fstat(dir, &info) == 0, info.st_uid == getuid() else {
            close(dir); throw SevraError.refused("Model activation history has a different owner.")
        }
        let lock = openat(dir, "owner.lock", O_RDWR | O_CREAT | O_NOFOLLOW | O_NONBLOCK | O_CLOEXEC, 0o600)
        guard lock >= 0 else { close(dir); throw SevraError.refused("Cannot lock model activation history.") }
        guard fstat(lock, &info) == 0, info.st_mode & S_IFMT == S_IFREG,
              info.st_uid == getuid(), info.st_nlink == 1, flock(lock, LOCK_EX | LOCK_NB) == 0 else {
            close(lock); close(dir)
            throw SevraError.refused("Another Sevra instance owns this model configuration. Close it before changing the model.")
        }
        var loaded = State(), archived: String?
        do {
            do { loaded = try Self.read(dir) }
            catch {
                // Repair is an explicit user action. Only move this owner's
                // regular, unshared record, under the same lifetime lease.
                // Rename preserves even an oversized record without reading
                // it into memory or copying/deleting any of its bytes.
                var item = stat()
                guard fstatat(dir, "state.json", &item, AT_SYMLINK_NOFOLLOW) == 0,
                      item.st_mode & S_IFMT == S_IFREG, item.st_uid == getuid(), item.st_nlink == 1 else { throw error }
                guard archiveInvalidState else { throw RecoverableHistory(message: error.localizedDescription) }
                guard (try? Self.read(dir)) == nil else {
                    throw SevraError.refused("The model setup record has changed. Retry settings to check it again.")
                }
                try fault?(.beforeArchive)
                var current = stat()
                guard fstatat(dir, "state.json", &current, AT_SYMLINK_NOFOLLOW) == 0,
                      current.st_dev == item.st_dev, current.st_ino == item.st_ino,
                      current.st_mode == item.st_mode, current.st_uid == item.st_uid,
                      current.st_nlink == item.st_nlink, current.st_size == item.st_size,
                      current.st_mtimespec.tv_sec == item.st_mtimespec.tv_sec,
                      current.st_mtimespec.tv_nsec == item.st_mtimespec.tv_nsec,
                      current.st_ctimespec.tv_sec == item.st_ctimespec.tv_sec,
                      current.st_ctimespec.tv_nsec == item.st_ctimespec.tv_nsec else {
                    throw SevraError.refused("The model setup record has changed. Retry settings to check it again.")
                }
                let name = "preserved-state-" + UUID().uuidString + ".json"
                guard renameatx_np(dir, "state.json", dir, name, UInt32(RENAME_EXCL)) == 0 else {
                    throw SevraError.refused("Cannot preserve the damaged model setup record. Its contents have not been replaced.")
                }
                try fault?(.afterArchive)
                guard fsync(dir) == 0 else {
                    throw SevraError.refused("Storage did not confirm the preserved model setup record. Retry settings to check it again.")
                }
                archived = name
            }
            guard !archiveInvalidState || archived != nil else {
                throw SevraError.refused("The model setup record is valid or has already been repaired. Retry settings to verify the model.")
            }
        } catch {
            flock(lock, LOCK_UN); close(lock); close(dir); throw error
        }
        state = loaded; archivedRecordName = archived
        directory = dir; lease = lock; self.fault = fault
    }
    deinit { flock(lease, LOCK_UN); close(lease); close(directory) }

    private static func read(_ directory: Int32) throws -> State {
        let fd = openat(directory, "state.json", O_RDONLY | O_NOFOLLOW | O_NONBLOCK | O_CLOEXEC)
        if fd < 0, errno == ENOENT { return State() }
        guard fd >= 0 else { throw SevraError.refused("Cannot read model activation history. Its previous contents have been preserved.") }
        let handle = FileHandle(fileDescriptor: fd, closeOnDealloc: true)
        defer { try? handle.close() }
        var info = stat()
        guard fstat(fd, &info) == 0, info.st_mode & S_IFMT == S_IFREG, info.st_uid == getuid(),
              info.st_nlink == 1, (1...Int64(maximumBytes)).contains(info.st_size),
              let data = try handle.read(upToCount: maximumBytes + 1), data.count == Int(info.st_size) else {
            throw SevraError.refused("Model activation history is invalid. Its previous contents have been preserved.")
        }
        let value: State
        do { value = try JSONDecoder().decode(State.self, from: data) }
        catch { throw SevraError.refused("Model activation history is unreadable. Its previous contents have been preserved.") }
        guard value.schema == 1 else { throw SevraError.refused("This model activation history needs a compatible Sevra version.") }
        if let good = value.lastGood {
            guard good.arithmeticIdentity.count == 64, good.arithmeticIdentity.allSatisfy({ $0.isHexDigit }),
                  (1...4).contains(good.healthTokens) else { throw SevraError.refused("Invalid model health receipt.") }
        }
        if let attempt = value.attempt {
            guard (attempt.phase == .failed) == (attempt.failure != nil),
                  attempt.failure == nil || ["interrupted", "activation", "cancelled"].contains(attempt.failure!),
                  attempt.phase != .committed || value.lastGood?.selection == attempt.selection else {
                throw SevraError.refused("Invalid model activation transition.")
            }
        }
        // Do not erase old receipts if a build no longer supports that pack.
        // Selection.validate is required immediately before loading it.
        return value
    }

    private func save(_ value: State) throws {
        let encoder = JSONEncoder(); encoder.outputFormatting = [.sortedKeys]
        let data = try encoder.encode(value)
        guard data.count <= Self.maximumBytes else { throw SevraError.refused("Model activation history exceeds its storage bound.") }
        try fault?(.beforeWrite)
        let temporary = ".state-" + UUID().uuidString
        let fd = openat(directory, temporary, O_WRONLY | O_CREAT | O_EXCL | O_NOFOLLOW | O_CLOEXEC, 0o600)
        guard fd >= 0 else { throw SevraError.refused("Cannot save model activation. Check free disk space.") }
        defer { close(fd); unlinkat(directory, temporary, 0) }
        do {
            try data.withUnsafeBytes { bytes in
                var offset = 0
                while offset < bytes.count {
                    let count = Darwin.write(fd, bytes.baseAddress!.advanced(by: offset), bytes.count - offset)
                    if count < 0, errno == EINTR { continue }
                    guard count > 0 else { throw SevraError.refused("Model activation could not be saved.") }
                    offset += count
                }
            }
            guard fcntl(fd, F_FULLFSYNC) == 0 else { throw SevraError.refused("Storage did not confirm model activation.") }
            try fault?(.beforeRename)
            guard renameat(directory, temporary, directory, "state.json") == 0 else {
                throw SevraError.refused("Cannot commit model activation.")
            }
            try fault?(.afterRename)
            guard fsync(directory) == 0 else { throw SevraError.refused("Storage did not confirm the activation directory.") }
            state = value
        } catch {
            // rename may have succeeded before a directory flush failed. Read
            // the real durable name instead of trusting an obsolete snapshot.
            state = try Self.read(directory)
            throw error
        }
    }
    package func recoverInterrupted() throws -> Bool {
        guard var attempt = state.attempt, attempt.phase.unfinished else { return false }
        attempt.phase = .failed; attempt.failure = "interrupted"
        var next = state; next.attempt = attempt; try save(next)
        return true
    }
    package func begin(_ selection: Selection) throws -> UUID {
        try selection.validate()
        guard state.attempt?.phase.unfinished != true else { throw SevraError.refused("A model activation is already in progress.") }
        let id = UUID()
        var next = state; next.attempt = Attempt(id: id, selection: selection, previous: state.lastGood,
            phase: .requested, failure: nil)
        try save(next); return id
    }
    package func advance(_ id: UUID, to phase: Phase) throws {
        guard var attempt = state.attempt, attempt.id == id,
              [.requested: Phase.verified, .verified: .loading, .loading: .checking][attempt.phase] == phase else {
            throw SevraError.refused("Stale or out-of-order model activation.")
        }
        attempt.phase = phase
        var next = state; next.attempt = attempt; try save(next)
    }
    package func commit(_ id: UUID, receipt: Receipt) throws {
        guard var attempt = state.attempt, attempt.id == id, attempt.phase == .checking,
              attempt.selection == receipt.selection, (1...4).contains(receipt.healthTokens),
              receipt.arithmeticIdentity.count == 64, receipt.arithmeticIdentity.allSatisfy({ $0.isHexDigit }) else {
            throw SevraError.refused("A model can activate only after its own completed health check.")
        }
        try receipt.selection.validate()
        attempt.phase = .committed
        var next = state; next.attempt = attempt; next.lastGood = receipt
        try save(next)
    }
    package func fail(_ id: UUID, cancelled: Bool = false) throws {
        guard var attempt = state.attempt, attempt.id == id, attempt.phase != .failed else { return }
        attempt.phase = .failed; attempt.failure = cancelled ? "cancelled" : "activation"
        // Also handles a commit whose rename succeeded but whose flush was
        // not acknowledged. The caller has not published that runtime yet.
        var next = state; next.attempt = attempt; next.lastGood = attempt.previous; try save(next)
    }
    package func restored(_ id: UUID, receipt: Receipt) throws {
        guard let attempt = state.attempt, attempt.id == id, attempt.phase == .failed,
              receipt.selection == attempt.previous?.selection, (1...4).contains(receipt.healthTokens),
              receipt.arithmeticIdentity.count == 64, receipt.arithmeticIdentity.allSatisfy({ $0.isHexDigit }) else {
            throw SevraError.refused("A rollback must restore the prior verified selection.")
        }
        try receipt.selection.validate()
        var next = state; next.lastGood = receipt; try save(next)
    }
}
