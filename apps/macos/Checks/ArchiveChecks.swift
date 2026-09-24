import Foundation
import SevraRuntime
import Slotstream

func archiveChecks(root: URL, dbmd: URL) async throws {
    let source = root.appendingPathComponent("archive-source")
    try FileManager.default.createDirectory(at: source, withIntermediateDirectories: true)
    try Data("Cedar review evidence: verify backups before enabling AI.".utf8).write(to: source.appendingPathComponent("notes.md"))
    let probe = ScriptedInference(turns: [
        EngineTurn(text: "", calls: [ProposedTool(name: "source.read", arguments: ["id": .string("a1:notes.md")])]),
        EngineTurn(text: "Review this document.", calls: [ProposedTool(name: "artifact.propose", arguments: ["filename": .string("archive-proof.md"), "content": .string("# Restored proposal\n\nVerify before enabling AI. [S1]\n")])])])
    let runtime = try SevraRuntime(homeURL: root.appendingPathComponent("archive-owner"), dbmd: dbmd, inference: probe)
    try await runtime.attach(threadID: "home", folder: source)
    try await runtime.submit(threadID: "home", text: "Read and propose the backup proof", nonce: "archive-proof")
    let pending = try await terminal(runtime, "home")
    let proposal = pending.run!.proposal!
    try await runtime.saveDraft(threadID: "home", text: "Unsent café 👋 draft")
    _ = try await runtime.saveJournalDraft(text: "Journal before backup", expectedRevision: 0)
    try await runtime.remember(threadID: "home", messageID: pending.messages[0].id, text: "Remember the reviewed backup", admitted: true)
    let privateID = try await runtime.newThread(mode: .incognito)
    try await runtime.saveDraft(threadID: privateID, text: "ARCHIVE-INCOGNITO-CANARY")
    let archive = root.appendingPathComponent("proof.sevrahome")
    let cacheDirectory = runtime.homeURL.appendingPathComponent(".sevra/prefix-cache")
    try FileManager.default.createDirectory(at: cacheDirectory, withIntermediateDirectories: true)
    try Data("INFERENCE-CACHE-BACKUP-CANARY".utf8).write(to: cacheDirectory.appendingPathComponent("fixture"))
    let exported = try await runtime.exportHome(to: archive)
    try require(exported.manifest.homeDataComplete && !exported.manifest.evidenceComplete && !exported.manifest.authorityReady && !exported.manifest.runtimeReady, "backup distinguishes owned data, external evidence, runtime and authority")
    try require(exported.manifest.files.contains { $0.path.hasPrefix("db/records/drafts/") }, "backup includes persistent drafts")
    try require(!exported.manifest.files.contains { $0.path.contains(".sevra") || $0.path.contains(".dbmd") }, "backup excludes device authority and disposable indexes")
    try inspectCanaryFiles(archive, canary: "ARCHIVE-INCOGNITO-CANARY")
    try inspectCanaryFiles(archive, canary: "INFERENCE-CACHE-BACKUP-CANARY")
    let nested = archive.appendingPathComponent("Nested restored Home")
    do { _ = try HomeArchive.restore(archive, to: nested, dbmd: dbmd); throw SevraError.refused("CHECK FAILED: nested restore changed backup") }
    catch { try require(!error.localizedDescription.contains("CHECK FAILED") && !FileManager.default.fileExists(atPath: nested.path), "restore cannot publish into its source backup") }
    let inspected = try HomeArchive.inspect(archive)
    try require(inspected.digest == exported.digest, "exact manifest is inspectable")
    let current = await runtime.snapshot()
    try await runtime.forget(memoryID: current.home.memories[0].id)
    let newer = await runtime.snapshot()
    let destination = root.appendingPathComponent("Restored Home")
    _ = try HomeArchive.restore(archive, to: destination, dbmd: dbmd, knownHome: newer.home)
    let restoredProbe = ScriptedInference(turns: [EngineTurn(text: "Explicit new work")])
    let restored = try SevraRuntime(homeURL: destination, dbmd: dbmd, inference: restoredProbe)
    let reopened = await restored.snapshot()
    try require(reopened.restoreReview?.reviewed == false && reopened.restoreReview?.privacyEpochKnown == true && reopened.restoreReview?.mergedExclusions == 1, "newer known suppression merges before restored AI can run")
    try require(reopened.home.memories[0].forgotten && !reopened.home.memories[0].admitted, "old snapshot never undoes a known Forget")
    try require(reopened.home.threads.count == 1 && reopened.home.threads[0].draft == "Unsent café 👋 draft" && reopened.home.journalDraft == "Journal before backup", "restore retains exact persistent drafts and excludes Incognito")
    try require(reopened.attachmentNames.isEmpty && reopened.home.threads[0].run?.proposal?.content == proposal.content, "restore preserves inert proposal content without restoring source grants")
    let fresh = try await restored.newThread()
    do { try await restored.submit(threadID: fresh, text: "Do not run before review", nonce: "blocked"); throw SevraError.refused("CHECK FAILED: restored AI ran") }
    catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "restored generation requires explicit dated-snapshot review") }
    do { _ = try await restored.approve(threadID: "home", proposalID: proposal.id, digest: proposal.digest); throw SevraError.refused("CHECK FAILED: restored approval ran") }
    catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "restored proposal cannot publish before current review") }
    let observed = await restoredProbe.observedContexts
    try require(observed.isEmpty, "opening a restore never calls inference")
    try await restored.acknowledgeRestore(archiveDigest: inspected.digest)
    try await restored.submit(threadID: fresh, text: "Explicit new work", nonce: "enabled")
    _ = try await terminal(restored, fresh)
    _ = try await restored.approve(threadID: "home", proposalID: proposal.id, digest: proposal.digest)
    let restoredArtifact = try String(contentsOf: destination.appendingPathComponent("artifacts/archive-proof.md"), encoding: .utf8)
    try require(restoredArtifact == proposal.content, "new exact approval can publish a restored proposal")
    try await restored.shutdown()
    do { _ = try HomeArchive.restore(archive, to: destination, dbmd: dbmd); throw SevraError.refused("CHECK FAILED: restore replaced a Home") }
    catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "existing restore destinations are never replaced") }
    let orphan = root.appendingPathComponent("Orphan restore")
    _ = try HomeArchive.restore(archive, to: orphan, dbmd: dbmd)
    do {
        let owner = try HomeStore(root: orphan, dbmd: dbmd)
        try require(owner.restoreReview?.privacyEpochKnown == false && owner.restoreReview?.reviewed == false, "standalone old snapshot has an unknown privacy epoch")
    }
    let corrupt = root.appendingPathComponent("corrupt.sevrahome")
    try FileManager.default.copyItem(at: archive, to: corrupt)
    try Data("corrupt".utf8).write(to: corrupt.appendingPathComponent("sevra.toml"))
    let rejected = root.appendingPathComponent("Must not exist")
    do { _ = try HomeArchive.restore(corrupt, to: rejected, dbmd: dbmd); throw SevraError.refused("CHECK FAILED: corrupt restore published") }
    catch { try require(!error.localizedDescription.contains("CHECK FAILED") && !FileManager.default.fileExists(atPath: rejected.path), "corruption leaves no partial restored Home") }
    for variant in ["missing", "symlink", "undeclared", "traversal", "collision"] {
        let bad = root.appendingPathComponent(variant + ".sevrahome")
        try FileManager.default.copyItem(at: archive, to: bad)
        if variant == "missing" { try FileManager.default.removeItem(at: bad.appendingPathComponent("sevra.toml")) }
        if variant == "symlink" {
            try FileManager.default.removeItem(at: bad.appendingPathComponent("sevra.toml"))
            try FileManager.default.createSymbolicLink(at: bad.appendingPathComponent("sevra.toml"), withDestinationURL: archive.appendingPathComponent("sevra.toml"))
        }
        if variant == "undeclared" {
            try FileManager.default.createDirectory(at: bad.appendingPathComponent("artifacts"), withIntermediateDirectories: true)
            try Data("unregistered".utf8).write(to: bad.appendingPathComponent("artifacts/unregistered.md"))
        }
        if variant == "traversal" || variant == "collision" {
            let manifestURL = bad.appendingPathComponent("manifest.json")
            var json = try JSONSerialization.jsonObject(with: Data(contentsOf: manifestURL)) as! [String: Any]
            var files = json["files"] as! [[String: Any]]
            if variant == "traversal" { files[0]["path"] = "../outside" }
            else { var duplicate = files[0]; duplicate["path"] = (duplicate["path"] as! String).uppercased(); files.append(duplicate) }
            json["files"] = files
            try JSONSerialization.data(withJSONObject: json).write(to: manifestURL)
        }
        do { _ = try HomeArchive.inspect(bad); throw SevraError.refused("CHECK FAILED: accepted " + variant) }
        catch { try require(!error.localizedDescription.contains("CHECK FAILED"), variant + " backup is refused") }
    }
    let aliasBackup = URL(fileURLWithPath: "/tmp/sevra-archive-alias-" + UUID().uuidString + ".sevrahome")
    defer { try? FileManager.default.removeItem(at: aliasBackup) }
    _ = try await runtime.exportHome(to: aliasBackup)
    _ = try HomeArchive.inspect(aliasBackup)
    try await runtime.shutdown()
    print("PASS: coherent Home backup, complete manifest, exact drafts, pending review, inert restore, explicit activation, monotonic Forget, unknown epochs, corruption/missing/symlink/path/collision/closure refusal and create-only publication")
}
