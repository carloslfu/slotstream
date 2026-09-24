import Foundation
import SevraRuntime
import Slotstream
import Darwin

private final class ReadGate: @unchecked Sendable {
    private let lock = NSLock()
    private var checks = 0
    func proceed() -> Bool { lock.lock(); defer { lock.unlock() }; checks += 1; return checks < 3 }
}

func auditChecks(root: URL, dbmd: URL) async throws {
    let aliasPath = "/private/tmp/sevra-path-audit-" + UUID().uuidString.lowercased()
    defer { try? FileManager.default.removeItem(atPath: aliasPath) }
    do {
        let pathRuntime = try SevraRuntime(homeURL: URL(fileURLWithPath: aliasPath), dbmd: dbmd, inference: ScriptedInference(turns: []))
        try await pathRuntime.saveDraft(threadID: "home", text: "Fresh URL restart canary")
        let endpoint = try LocalEndpoint(runtime: pathRuntime)
        let direct = try LocalClient(home: URL(fileURLWithPath: aliasPath)).request(LocalRequest(operation: "status"))
        let alias = try LocalClient(home: URL(fileURLWithPath: aliasPath.replacingOccurrences(of: "/private/tmp/", with: "/tmp/"))).request(LocalRequest(operation: "status"))
        try require(direct.homeID == alias.homeID, "macOS system aliases bind the same authenticated Home endpoint")
        endpoint.stop(); try await pathRuntime.shutdown()
    }
    do {
        let restored = try HomeStore(root: URL(fileURLWithPath: aliasPath), dbmd: dbmd).load()
        try require(restored.threads[0].draft == "Fresh URL restart canary", "fresh URL reopening accepts the physical macOS Home path")
    }
    let homeLink = root.appendingPathComponent("home-link")
    try FileManager.default.createSymbolicLink(at: homeLink, withDestinationURL: URL(fileURLWithPath: aliasPath))
    do { _ = try HomeStore(root: homeLink, dbmd: dbmd); throw SevraError.refused("CHECK FAILED: user Home symlink accepted") }
    catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "system path normalization still refuses user-created Home symlinks") }
    print("PASS: fresh-URL Home restart, macOS system-alias IPC binding and user-symlink refusal")
    let source = root.appendingPathComponent("audit-source.md")
    try Data("The audit project is Juniper. Launch is October 12.\n".utf8).write(to: source)
    let engine = ScriptedInference(turns: [
        EngineTurn(text: "", calls: [ProposedTool(name: "source.read", arguments: ["id": .string("a1:audit-source.md")])]),
        EngineTurn(text: "Juniper launches October 12. [S1]", calls: [ProposedTool(name: "artifact.propose", arguments: ["filename": .string("audit.md"), "content": .string("# Juniper\n\nLaunch is October 12. [S1]\n")])]),
        EngineTurn(text: "A later ordinary answer.")
    ])
    let path = root.appendingPathComponent("audit-history")
    var runtime: SevraRuntime? = try SevraRuntime(homeURL: path, dbmd: dbmd, inference: engine)
    let id = try await runtime!.newThread(title: "Historical documents")
    try await runtime!.attach(threadID: id, folder: source)
    try await runtime!.submit(threadID: id, text: "Read the source and propose audit.md", nonce: "document")
    let review = try await terminal(runtime!, id)
    let proposal = review.run!.proposal!
    let citedMessage = review.messages.last!.id
    _ = try await runtime!.approve(threadID: id, proposalID: proposal.id, digest: proposal.digest)
    try await runtime!.submit(threadID: id, text: "Now answer another question", nonce: "later")
    _ = try await terminal(runtime!, id)
    let recovered = try await runtime!.readSavedArtifact(threadID: id)
    try require(recovered == proposal.content, "a later response must not hide the previous saved document")
    var snapshot = await runtime!.snapshot()
    var thread = snapshot.home.threads.first { $0.id == id }!
    try require(snapshot.home.citations(for: citedMessage, in: thread).first?.content?.contains("Juniper") == true, "earlier citations survive a new run")
    try await runtime!.shutdown(); runtime = nil
    runtime = try SevraRuntime(homeURL: path, dbmd: dbmd, inference: engine)
    let reopened = try await runtime!.readSavedArtifact(threadID: id)
    try require(reopened == proposal.content, "historical document remains reachable after restart")
    snapshot = await runtime!.snapshot(); thread = snapshot.home.threads.first { $0.id == id }!
    try require(snapshot.home.citations(for: citedMessage, in: thread).first?.content?.contains("Juniper") == true, "historical citations survive restart")
    try require(thread.pastRuns?.count == 1 && thread.savedRuns.count == 1, "one retained past run and document")
    let entryText = "Journal entry with Unicode café 👋"
    let draft = try await runtime!.saveJournalDraft(text: entryText, expectedRevision: 0)
    let saved = try await runtime!.submitJournalDraft(text: entryText, nonce: "journal-entry", expectedRevision: draft.revision, remainingDraft: "New text typed during save")
    let duplicate = try await runtime!.submitJournalDraft(text: entryText, nonce: "journal-entry", expectedRevision: draft.revision, remainingDraft: "")
    try require(saved == duplicate && saved.text == "New text typed during save", "journal acceptance is idempotent and preserves later draft")
    do { _ = try await runtime!.saveJournalDraft(text: "stale", expectedRevision: 0); throw SevraError.refused("CHECK FAILED: stale journal draft accepted") }
    catch { try require(error is DraftConflict, "stale journal draft exposes a conflict") }
    do { _ = try await runtime!.submitJournalDraft(text: "changed", nonce: "journal-entry", expectedRevision: saved.revision, remainingDraft: ""); throw SevraError.refused("CHECK FAILED: changed journal nonce accepted") }
    catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "journal nonce binds content") }
    let beforeJournal = await runtime!.snapshot()
    try require(beforeJournal.home.journal.map(\.text) == [entryText], "journal cannot duplicate on repeated acceptance")
    try await runtime!.shutdown(); runtime = nil
    runtime = try SevraRuntime(homeURL: path, dbmd: dbmd, inference: engine)
    let journal = await runtime!.journalDraftState()
    try require(journal == saved, "journal draft survives restart")
    let reopenedJournal = await runtime!.snapshot()
    try require(reopenedJournal.home.journal.map(\.text) == [entryText], "journal entries survive restart")
    try await runtime!.shutdown()
    do { _ = try await runtime!.newThread(mode: .incognito); throw SevraError.refused("CHECK FAILED: thread created during shutdown") }
    catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "closed owner rejects new threads") }
    do { try await runtime!.journal(text: "after shutdown"); throw SevraError.refused("CHECK FAILED: journal accepted during shutdown") }
    catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "closed owner rejects journal writes") }
    runtime = nil
    print("PASS: historical documents and citations, journal atomic acceptance and restart, duplicate/revision refusal and closed-owner guards")

    let memoryEngine = ScriptedInference(turns: [EngineTurn(text: "Source response"), EngineTurn(text: "Recall checked")])
    let memoryRuntime = try SevraRuntime(homeURL: root.appendingPathComponent("audit-memory"), dbmd: dbmd, inference: memoryEngine)
    try await memoryRuntime.submit(threadID: "home", text: "A source for a long explicit memory", nonce: "memory")
    let origin = try await terminal(memoryRuntime, "home")
    let fullMemory = String(repeating: "Durable detail. ", count: 45) + "CANARY-AT-END-924"
    for _ in 0..<2 { try await memoryRuntime.remember(threadID: "home", messageID: origin.messages[0].id, text: fullMemory, admitted: true) }
    let memorySnapshot = await memoryRuntime.snapshot()
    try require(memorySnapshot.home.memories.count == 1, "repeated admission cannot duplicate a memory")
    let recall = try await memoryRuntime.newThread()
    try await memoryRuntime.submit(threadID: recall, text: "Recall the complete memory", nonce: "recall")
    _ = try await terminal(memoryRuntime, recall)
    let context = await memoryEngine.observedContexts.last!
    try require(context.first?.content.contains(fullMemory) == true, "eligible memories are not silently cut at 500 characters")
    try await memoryRuntime.shutdown()
    print("PASS: idempotent memory admission and complete eligible memory text in AI context")

    let malformed = [EngineTurn(text: "", finishReason: "tool_calls"),
        EngineTurn(text: "", calls: [ProposedTool(name: "source.read", arguments: ["id": .string("a1:audit-source.md")]), ProposedTool(name: "shell", arguments: [:])]),
        EngineTurn(text: "", calls: [ProposedTool(name: "artifact.propose", arguments: ["filename": .string("one.md"), "content": .string("One [S1]")]), ProposedTool(name: "artifact.propose", arguments: ["filename": .string("two.md"), "content": .string("Two [S1]")])])]
    for (index, response) in malformed.enumerated() {
        let invalid = try SevraRuntime(homeURL: root.appendingPathComponent("audit-tools-\(index)"), dbmd: dbmd, inference: ScriptedInference(turns: [response]))
        try await invalid.attach(threadID: "home", folder: source)
        try await invalid.submit(threadID: "home", text: "Inspect tool response validation", nonce: "invalid")
        let failed = try await terminal(invalid, "home")
        try require(failed.run?.state == .failed && failed.run?.excerpts?.isEmpty != false && failed.run?.proposal == nil, "invalid complete tool set executes no reads or proposals")
        try await invalid.shutdown()
    }
    print("PASS: malformed termination, undeclared mixed calls and multiple proposals fail before execution")

    let invalidReadSet = EngineTurn(text: "", calls: [ProposedTool(name: "source.read", arguments: ["id": .string("a1:audit-source.md")]), ProposedTool(name: "source.list", arguments: ["limit": .int(1)])])
    let repairEngine = ScriptedInference(turns: [invalidReadSet,
        EngineTurn(text: "", calls: [ProposedTool(name: "source.read", arguments: ["id": .string("a1:audit-source.md")])]),
        EngineTurn(text: "", calls: [ProposedTool(name: "artifact.propose", arguments: ["filename": .string("repaired.md"), "content": .string("Juniper launches October 12. [S1]")])])])
    let repair = try SevraRuntime(homeURL: root.appendingPathComponent("audit-correction"), dbmd: dbmd, inference: repairEngine)
    try await repair.attach(threadID: "home", folder: source)
    try await repair.submit(threadID: "home", text: "Read the source and propose a document", nonce: "repair")
    let corrected = try await terminal(repair, "home")
    try require(corrected.run?.state == .needsYou && corrected.run?.excerpts?.count == 1, "a rejected mixed set performs no partial read before bounded correction")
    try require(!FileManager.default.fileExists(atPath: repair.homeURL.appendingPathComponent("artifacts/repaired.md").path), "corrected proposal still requires review")
    let repairedContexts = await repairEngine.observedContexts
    try require(repairedContexts.count == 3 && repairedContexts[1].first?.role == "system" && repairedContexts[1].first?.content.contains("original user request and approval requirements remain unchanged") == true, "correction is explicit host schema feedback")
    try require(repairedContexts.allSatisfy { $0.first?.role == "system" && $0.dropFirst().allSatisfy { $0.role != "system" } }, "correction preserves the pinned template: system only at the beginning")
    try await repair.shutdown()
    for (name, turns, expectedCalls) in [
        ("exhausted", [invalidReadSet, invalidReadSet, EngineTurn(text: "must not run")], 2),
        ("unknown", [EngineTurn(text: "", calls: [ProposedTool(name: "source.list", arguments: ["limit": .int(1)]), ProposedTool(name: "shell", arguments: [:])]), EngineTurn(text: "must not run")], 1)
    ] {
        let probe = ScriptedInference(turns: turns)
        let rejected = try SevraRuntime(homeURL: root.appendingPathComponent("audit-correction-" + name), dbmd: dbmd, inference: probe)
        try await rejected.attach(threadID: "home", folder: source)
        try await rejected.submit(threadID: "home", text: "Check correction boundaries", nonce: name)
        let failed = try await terminal(rejected, "home")
        let contexts = await probe.observedContexts
        try require(failed.run?.state == .failed && contexts.count == expectedCalls && failed.run?.excerpts?.isEmpty != false, "correction is bounded; unknown tools fail the entire set")
        try await rejected.shutdown()
    }
    print("PASS: one bounded tool-schema correction, no partial execution, preserved review, exhausted-retry and unavailable-tool refusal")

    let misspelled = ProposedTool(name: "artifact=propose", arguments: ["filename": .string("spelling.md"), "content": .string("Juniper launches October 12. [S1]")])
    let spellingEngine = ScriptedInference(turns: [
        EngineTurn(text: "", calls: [ProposedTool(name: "source.read", arguments: ["id": .string("a1:audit-source.md")])]),
        EngineTurn(text: "", calls: [misspelled]),
        EngineTurn(text: "", calls: [ProposedTool(name: "artifact.propose", arguments: misspelled.arguments)])])
    let spelling = try SevraRuntime(homeURL: root.appendingPathComponent("audit-real-tool-spelling"), dbmd: dbmd, inference: spellingEngine)
    try await spelling.attach(threadID: "home", folder: source)
    try await spelling.submit(threadID: "home", text: "Read the source and propose a document", nonce: "spelling")
    let spellingReview = try await terminal(spelling, "home")
    let spellingContexts = await spellingEngine.observedContexts
    try require(spellingReview.run?.state == .needsYou && spellingContexts.count == 3 && spellingContexts[2].first?.content.contains("Use the exact tool name artifact.propose") == true, "observed tool-name misspelling receives one explicit correction")
    try require(!FileManager.default.fileExists(atPath: spelling.homeURL.appendingPathComponent("artifacts/spelling.md").path), "misspelled tool is never executed or silently mapped to a write")
    let stoppedProposal = spellingReview.run!.proposal!
    try await spelling.stop(threadID: "home")
    let stoppedReview = await spelling.snapshot()
    try require(stoppedReview.home.threads[0].run?.state == .stopped && stoppedReview.home.threads[0].run?.proposal == nil, "rejecting review clears the pending proposal")
    do { _ = try await spelling.approve(threadID: "home", proposalID: stoppedProposal.id, digest: stoppedProposal.digest); throw SevraError.refused("CHECK FAILED: rejected proposal saved") }
    catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "rejected proposal cannot be approved later") }
    try await spelling.shutdown()
    print("PASS: observed artifact=propose spelling correction without alias execution; rejection and stale approval refusal")

    let storagePath = root.appendingPathComponent("audit-storage")
    do {
        let store = try HomeStore(root: storagePath, dbmd: dbmd)
        try store.save(HomeState())
        for name in ["../escape.md", ".hidden.md", "nested/file.md", "wrong.txt"] {
            do { try store.save(HomeState(), artifact: ArtifactProposal(id: "invalid", filename: name, content: "bad", citations: [])); throw SevraError.refused("CHECK FAILED: invalid artifact staged") }
            catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "invalid artifact refused before recovery intent") }
            try require(!FileManager.default.fileExists(atPath: storagePath.appendingPathComponent(".sevra/recovery.json").path), "invalid artifact leaves no poisoned recovery intent")
        }
        var duplicateHome = HomeState(); duplicateHome.threads.append(WorkThread(id: "home", title: "Duplicate"))
        do { try store.save(duplicateHome); throw SevraError.refused("CHECK FAILED: duplicate Home identity accepted") }
        catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "duplicate Home identities refused before writes") }
        let intact = try store.load()
        try require(intact.threads.count == 1, "invalid writes leave the existing Home usable")
    }
    do { let store = try HomeStore(root: storagePath, dbmd: dbmd); _ = try store.load() }
    print("PASS: invalid artifact and duplicate identities do not poison durable recovery")

    let unicode = root.appendingPathComponent("unicode-source.md")
    try Data("é👋text".utf8).write(to: unicode)
    let reader = try SourceFolder(url: unicode)
    do { _ = try reader.execute(ProposedTool(name: "source.read", arguments: ["id": .string("a1:unicode-source.md"), "offset": .int(1)]), cancellation: Cancellation()); throw SevraError.refused("CHECK FAILED: split UTF-8 offset accepted") }
    catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "UTF-8 offset boundary enforced") }
    _ = try reader.execute(ProposedTool(name: "source.read", arguments: ["id": .string("a1:unicode-source.md"), "offset": .int(2)]), cancellation: Cancellation())
    try require(reader.citations.first?.content == "👋text", "valid Unicode offset preserves exact text")
    let badFolder = root.appendingPathComponent("source-init-failure")
    try FileManager.default.createDirectory(at: badFolder, withIntermediateDirectories: true)
    try FileManager.default.createSymbolicLink(at: badFolder.appendingPathComponent("link.md"), withDestinationURL: source)
    try Data("kept".utf8).write(to: badFolder.appendingPathComponent("plain.md"))
    let linked = try SourceFolder(url: badFolder)
    let linkedList = try linked.execute(ProposedTool(name: "source.list", arguments: [:]), cancellation: Cancellation())
    let skippedLinks = (try JSONSerialization.jsonObject(with: Data(linkedList.utf8)) as? [String: Any])?["skipped"] as? [String: Int]
    try require(linkedList.contains("plain.md") && !linkedList.contains("link.md") && skippedLinks == ["symbolic_links": 1], "symbolic links are skipped, never listed or followed")
    print("PASS: source Unicode boundaries and skipped symbolic links")

    let hashFile = root.appendingPathComponent("hash-cancellation.bin")
    try Data(repeating: 42, count: 16 * 1024 * 1024).write(to: hashFile)
    let expected = WeightStore.sha256(of: hashFile)
    let actual = try WeightStore.sha256(of: hashFile, shouldContinue: { true })
    try require(actual == expected, "cancellable verifier preserves SHA-256")
    let gate = ReadGate()
    do { _ = try WeightStore.sha256(of: hashFile, shouldContinue: { gate.proceed() }); throw SevraError.refused("CHECK FAILED: hashing ignored cancellation") }
    catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "hashing stops between bounded reads") }
    do { _ = try WeightStore(modelDirectory: root).status(shouldContinue: { false }); throw SevraError.refused("CHECK FAILED: status ignored cancellation") }
    catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "setup status respects initial cancellation") }
    print("PASS: model verification hash parity and mid-read cancellation without model allocation")
}

func auditIfRequested() async throws -> Bool {
    guard CommandLine.arguments.contains("--audit") else { return false }
    let root = FileManager.default.temporaryDirectory.resolvingSymlinksInPath().appendingPathComponent("sevra-audit-" + UUID().uuidString)
    try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
    defer { try? FileManager.default.removeItem(at: root) }
    let dbmd = URL(fileURLWithPath: ProcessInfo.processInfo.environment["SEVRA_DBMD"] ?? NSHomeDirectory() + "/.dbmd/bin/dbmd")
    try await auditChecks(root: root, dbmd: dbmd)
    return true
}
