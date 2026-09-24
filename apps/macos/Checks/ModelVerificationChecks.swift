import Darwin
import Foundation
import SevraRuntime

private func checkModelVerification(_ value: Bool, _ message: String) throws { try require(value, message) }

func modelVerificationChecks(root: URL) throws {
    let folder = root.appendingPathComponent("model-verification")
    try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
    let file = folder.appendingPathComponent("weight"), optional = folder.appendingPathComponent("optional")
    let good = Data("verified weights".utf8)
    try good.write(to: file)
    let cache = ModelVerificationCache()
    var hashes = 0
    func check() throws -> Bool {
        try cache.check(files: [file, optional], shouldContinue: { true }) {
            hashes += 1; return try Data(contentsOf: file) == good
        }
    }
    try checkModelVerification(try check(), "first load verifies model bytes")
    let first = hashes
    try checkModelVerification(try check(), "unchanged model stays ready")
    // The repo's supported local Mac check volume is APFS. Other filesystems
    // deliberately fall back to hashing and make no reload-speed claim.
    let reusable = hashes == first
    var original = stat()
    try checkModelVerification(lstat(file.path, &original) == 0, "capture exact file timestamps")
    let writer = try FileHandle(forWritingTo: file)
    try writer.write(contentsOf: Data("corrupt! weights".utf8)); try writer.close()
    // Date conversion can round nanoseconds and accidentally invalidate the
    // cache through mtime alone. Restore the exact timespec on the same inode.
    let timestamps = [original.st_atimespec, original.st_mtimespec]
    let restored = timestamps.withUnsafeBufferPointer { utimensat(AT_FDCWD, file.path, $0.baseAddress, 0) }
    try checkModelVerification(restored == 0, "restore exact modification time")
    var changed = stat()
    try checkModelVerification(lstat(file.path, &changed) == 0 && changed.st_ino == original.st_ino
        && changed.st_size == original.st_size && changed.st_mtimespec.tv_sec == original.st_mtimespec.tv_sec
        && changed.st_mtimespec.tv_nsec == original.st_mtimespec.tv_nsec, "corruption preserves inode, size and exact mtime")
    try checkModelVerification(!(try check()), "same-size corruption with restored mtime is rejected")
    try good.write(to: file); try checkModelVerification(try check(), "a repaired model is reverified")
    let beforeOptional = hashes
    try good.write(to: optional); try checkModelVerification(try check(), "new optional file is reverified")
    try checkModelVerification(hashes > beforeOptional, "optional-file arrival invalidates the proof")
    let beforeRemoval = hashes
    try FileManager.default.removeItem(at: optional)
    try checkModelVerification(try check(), "removed optional file is reverified")
    try checkModelVerification(hashes > beforeRemoval, "optional-file removal invalidates the proof")
    let replacement = folder.appendingPathComponent("replacement")
    try good.write(to: replacement)
    try FileManager.default.removeItem(at: file)
    try FileManager.default.moveItem(at: replacement, to: file)
    let beforeReplacement = hashes
    try checkModelVerification(try check(), "replacement file is verified")
    try checkModelVerification(hashes > beforeReplacement, "replacement invalidates the proof")
    let target = folder.appendingPathComponent("target")
    try good.write(to: target)
    try FileManager.default.removeItem(at: file)
    try FileManager.default.createSymbolicLink(at: file, withDestinationURL: target)
    let beforeLink = hashes
    try checkModelVerification(try check(), "symlink target is verified")
    try checkModelVerification(hashes > beforeLink, "symlink retarget invalidates the proof")
    do {
        _ = try cache.check(files: [file, optional], shouldContinue: { false }) { throw SevraError.refused("CHECK FAILED: cancelled verification ran") }
        throw SevraError.refused("CHECK FAILED: cancelled cache hit accepted")
    } catch { try checkModelVerification(!error.localizedDescription.contains("CHECK FAILED"), "cached proof still respects cancellation") }
    if reusable {
        let changed = ModelVerificationCache()
        do {
            _ = try changed.check(files: [file], shouldContinue: { true }) { try Data("changed contents".utf8).write(to: target); return true }
            throw SevraError.refused("CHECK FAILED: mutation during verification accepted")
        } catch { try checkModelVerification(!error.localizedDescription.contains("CHECK FAILED"), "mutation while hashing fails closed") }
    }
    print("PASS: session model verification, same-size corruption, restored mtime, repair, optional arrival, replacement, symlink, cancellation and verification mutation; cached=\(reusable)")
}
