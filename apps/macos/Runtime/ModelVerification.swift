import Darwin
import Foundation

/// A proof held only by this inference owner, never persisted or shared across
/// app launches. APFS file identity and nanosecond change times invalidate it on
/// writes, replacement, symlink retargeting, or optional-file arrival/removal.
/// A proof is also bound to the selected compiled manifest. Equal paths and
/// unchanged files cannot certify a different set of required hashes.
/// Other filesystems keep full verification on every load.
package final class ModelVerificationCache: @unchecked Sendable {
    private struct Version: Equatable {
        var path: String
        var device: Int32 = 0
        var inode: UInt64 = 0
        var generation: UInt32 = 0
        var size: Int64 = -1
        var modifiedSeconds: Int = 0
        var modifiedNanos: Int = 0
        var changedSeconds: Int = 0
        var changedNanos: Int = 0
    }
    private struct Proof: Equatable {
        let manifestDigest: String
        let versions: [Version]
    }
    private var verified: Proof?
    private let lock = NSLock()
    package init() {}
    private func versions(_ files: [URL]) -> [Version]? {
        var result: [Version] = []
        for file in files {
            let target = file.resolvingSymlinksInPath()
            var fs = statfs()
            guard statfs(target.deletingLastPathComponent().path, &fs) == 0 else { return nil }
            let type = withUnsafePointer(to: &fs.f_fstypename) {
                $0.withMemoryRebound(to: CChar.self, capacity: Int(MFSTYPENAMELEN)) { String(cString: $0) }
            }
            guard type == "apfs" else { return nil }
            var info = stat()
            guard lstat(target.path, &info) == 0 else {
                guard errno == ENOENT else { return nil }
                result.append(Version(path: target.path)); continue
            }
            guard info.st_mode & S_IFMT == S_IFREG else { return nil }
            result.append(Version(path: target.path, device: info.st_dev, inode: info.st_ino,
                generation: info.st_gen, size: info.st_size,
                modifiedSeconds: info.st_mtimespec.tv_sec, modifiedNanos: info.st_mtimespec.tv_nsec,
                changedSeconds: info.st_ctimespec.tv_sec, changedNanos: info.st_ctimespec.tv_nsec))
        }
        return result
    }
    /// The background preparation worker and inference owner share this proof.
    /// Serialize proof publication, including verification, across both callers.
    /// The first load always executes the
    /// pinned SHA-256 verifier; only an unchanged successful proof can be reused.
    package func check(manifestDigest: String, files: [URL], shouldContinue: () -> Bool,
                       verify: () throws -> Bool) throws -> Bool {
        lock.lock(); defer { lock.unlock() }
        guard shouldContinue() else { throw SevraError.cancelled }
        let before = versions(files)
        if let before, Proof(manifestDigest: manifestDigest, versions: before) == verified {
            guard shouldContinue() else { throw SevraError.cancelled }
            return true
        }
        verified = nil
        guard try verify() else { return false }
        guard shouldContinue() else { throw SevraError.cancelled }
        if let before {
            guard versions(files) == before else {
                throw SevraError.unavailable("The model files changed while being verified. Try again after the files finish changing.")
            }
            verified = Proof(manifestDigest: manifestDigest, versions: before)
        }
        return true
    }
}
