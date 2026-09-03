// Integrity decisions the downloader makes, checked without downloading
// 105 GB. Each one is a case where trusting the obvious signal — a file's
// size, a 206 response, a present file — would have accepted bad bytes.

import Foundation
import Slotstream

extension Diagnostics {
    public static func pullIntegrity() throws -> CheckReport {
        var c = CheckBuilder("pull-check")

        let dir = FileManager.default.temporaryDirectory
            .appendingPathComponent("slotstream-pull-check-\(UUID().uuidString)")
        try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: dir) }

        // Same-size corruption: the case a size check cannot see, which is why
        // a complete-looking copy is hashed before the engine loads it.
        let file = dir.appendingPathComponent("same-size")
        try Data("abc".utf8).write(to: file)
        let abc = "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"
        c.expect("matching file is accepted", WeightStore.fileMatches(file, size: 3, sha256: abc))
        try Data("xyz".utf8).write(to: file)
        c.expect(
            "same-size corruption is rejected", !WeightStore.fileMatches(file, size: 3, sha256: abc))

        // A 206 has to be checked for position, not just length: a proxy can
        // return the right number of bytes from the wrong offset.
        c.expect(
            "exact Content-Range is accepted",
            WeightStore.validContentRange("bytes 64-127/256", start: 64, length: 64, total: 256))
        c.expect(
            "wrong range start is rejected",
            !WeightStore.validContentRange("bytes 0-63/256", start: 64, length: 64, total: 256))
        c.expect(
            "wrong range total is rejected",
            !WeightStore.validContentRange("bytes 64-127/999", start: 64, length: 64, total: 256))
        c.expect(
            "unknown range total is rejected",
            !WeightStore.validContentRange("bytes 64-127/*", start: 64, length: 64, total: 256))

        c.expect(
            "every pinned file has a digest", PinnedModel.files.allSatisfy { $0.sha256 != nil })
        c.equal(
            "the draft head is pinned as the one optional file",
            PinnedModel.files.filter(\.optional).map(\.path), ["mtp.safetensors"])

        let manifestDir = dir.appendingPathComponent("manifest")
        try FileManager.default.createDirectory(at: manifestDir, withIntermediateDirectories: true)
        let invalid = WeightStore.invalidFiles(at: manifestDir).map(\.path)
        c.expect(
            "an absent optional file is not a repair; an absent required one is",
            !invalid.contains("mtp.safetensors") && invalid.contains("config.json"),
            "invalid: \(invalid.prefix(3))")

        // Status over that same empty directory: nothing downloaded, and the
        // free-disk figure a host needs before starting a 105 GB pull.
        let store = WeightStore(modelDirectory: manifestDir)
        let status = store.status()
        if case let .missing(need, free) = status {
            c.expect("an empty directory reads as missing", true)
            c.equal("missing needs the whole manifest", need, PinnedModel.totalBytes)
            c.expect("status carries free disk", free > 0, "free \(free)")
            c.measure("free_disk_bytes", Double(free))
        } else {
            c.expect("an empty directory reads as missing", false, "got \(status)")
        }
        c.equal("bytesToFetch agrees with the manifest", status.bytesToFetch, PinnedModel.totalBytes)
        c.expect("a missing copy is not ready", !status.isReady)

        c.measure("manifest_files", Double(PinnedModel.files.count))
        c.measure("manifest_total_bytes", Double(PinnedModel.totalBytes))
        c.measure("manifest_required_bytes", Double(PinnedModel.requiredBytes))
        return c.report()
    }
}
