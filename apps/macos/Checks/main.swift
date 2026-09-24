import Foundation
import SevraRuntime
import Slotstream

func require(_ value: @autoclosure () -> Bool, _ message: String) throws { if !value() { throw SevraError.refused("CHECK FAILED: " + message) } }
let sem = DispatchSemaphore(value: 0)
var result: Int32 = 0
do { try crashChildIfRequested() } catch { fputs(error.localizedDescription + "\n", stderr); exit(1) }
if holdMemoryChildIfRequested() { exit(0) }
Task {
    // Signal last, after every cleanup in this task has run.
    defer { sem.signal() }
    do {
        if try await crashApplyChildIfRequested() { return }
        if try seedAuditUIIfRequested() { return }
        if try seedUIIfRequested() { return }
        if try seedPromotionUIIfRequested() { return }
        if try await auditIfRequested() { return }
        if try await realSpeedCheckIfRequested() { return }
        if try await realPerformanceCheckIfRequested() { return }
        if try await realCheckIfRequested() { return }
        if try await realThinkingCheckIfRequested() { return }
        if try await realMetricsCheckIfRequested() { return }
        if try await realCacheCheckIfRequested() { return }
        if try await realSourcesIfRequested() { return }
        if try await realBasicsCheckIfRequested() { return }
        let root = FileManager.default.temporaryDirectory.resolvingSymlinksInPath().appendingPathComponent("sevra-check-" + UUID().uuidString)
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: root) }
        let dbmd = URL(fileURLWithPath: ProcessInfo.processInfo.environment["SEVRA_DBMD"] ?? NSHomeDirectory() + "/.dbmd/bin/dbmd")
        if CommandLine.arguments.contains("--external-drafts") { try await externalDraftChecks(root: root, dbmd: dbmd); return }
        if CommandLine.arguments.contains("--archive") { try await archiveChecks(root: root, dbmd: dbmd); return }
        if CommandLine.arguments.contains("--context-window") { try await longConversationChecks(root: root, dbmd: dbmd); return }
        if CommandLine.arguments.contains("--performance") { try await performanceChecks(root: root, dbmd: dbmd); return }
        if CommandLine.arguments.contains("--thinking") { try await thinkingChecks(root: root, dbmd: dbmd); return }
        if CommandLine.arguments.contains("--response-details") { try await responseDetailsChecks(root: root, dbmd: dbmd); return }
        if CommandLine.arguments.contains("--sources") { try await sourceNavigationChecks(root: root, dbmd: dbmd); return }
        if CommandLine.arguments.contains("--basics") { try await basicsChecks(root: root, dbmd: dbmd); return }
        let folder = root.appendingPathComponent("sources")
        try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
        try Data("The launch date is October 12. The budget is 400 dollars.\n".utf8).write(to: folder.appendingPathComponent("notes.md"))
        let script = ScriptedInference(turns: [
            EngineTurn(text: "", calls: [ProposedTool(name: "source.list", arguments: [:])]),
            EngineTurn(text: "", calls: [ProposedTool(name: "source.read", arguments: ["id": .string("a1:notes.md")])]),
            EngineTurn(text: "Here is a briefing to review.", calls: [ProposedTool(name: "artifact.propose", arguments: ["filename": .string("briefing.md"), "content": .string("# Briefing\n\nThe launch is October 12 with a budget of 400 dollars. [S1]\n")])])
        ])
        let home = root.appendingPathComponent("Home")
        var runtime: SevraRuntime? = try SevraRuntime(homeURL: home, dbmd: dbmd, inference: script)
        do { _ = try HomeStore(root: home, dbmd: dbmd); throw SevraError.refused("CHECK FAILED: second owner accepted") } catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "exclusive Home owner") }
        try await runtime!.attach(threadID: "home", folder: folder)
        let input = "Read the notes and propose a saved briefing."
        let runID = try await runtime!.submit(threadID: "home", text: input, nonce: "submit-1")
        let duplicate = try await runtime!.submit(threadID: "home", text: input, nonce: "submit-1")
        try require(runID == duplicate, "duplicate submit maps to one run")
        var snapshot = await runtime!.snapshot()
        for _ in 0..<200 {
            snapshot = await runtime!.snapshot()
            if snapshot.home.threads[0].run?.state == .needsYou { break }
            try await Task.sleep(nanoseconds: 20_000_000)
        }
        let proposal = snapshot.home.threads[0].run!.proposal
        try require(proposal != nil, "tool loop reaches approval")
        try require(!FileManager.default.fileExists(atPath: home.appendingPathComponent("artifacts/briefing.md").path), "proposal cannot save itself")
        do { _ = try await runtime!.approve(threadID: "home", proposalID: proposal!.id, digest: "wrong"); throw SevraError.refused("CHECK FAILED: stale approval accepted") } catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "approval binds exact digest") }
        let artifact = try await runtime!.approve(threadID: "home", proposalID: proposal!.id, digest: proposal!.digest)
        let artifactText = try String(contentsOfFile: artifact, encoding: .utf8)
        try require(artifactText == proposal!.content, "exact artifact bytes")
        let preview = try await runtime!.readSavedArtifact(threadID: "home")
        try require(preview == artifactText, "native saved-document preview returns current bytes")
        let artifactURL = URL(fileURLWithPath: artifact)
        try FileManager.default.removeItem(at: artifactURL)
        try FileManager.default.createSymbolicLink(at: artifactURL, withDestinationURL: home.appendingPathComponent("db/DB.md"))
        do { _ = try await runtime!.readSavedArtifact(threadID: "home"); throw SevraError.refused("CHECK FAILED: saved document followed symlink") } catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "saved document symlink refused") }
        try FileManager.default.removeItem(at: artifactURL)
        try Data(repeating: 65, count: 1_048_577).write(to: artifactURL)
        do { _ = try await runtime!.readSavedArtifact(threadID: "home"); throw SevraError.refused("CHECK FAILED: oversized preview accepted") } catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "saved document read budget enforced") }
        try Data(artifactText.utf8).write(to: artifactURL)
        print("PASS: saved document preview, symlink refusal and read budget")
        try await runtime!.saveDraft(threadID: "home", text: "unsent durable draft")
        let privateID = try await runtime!.newThread(mode: .incognito)
        try await runtime!.saveDraft(threadID: privateID, text: "PRIVATE-CANARY-9387")
        try await runtime!.shutdown(); runtime = nil
        let reopened = try HomeStore(root: home, dbmd: dbmd)
        let saved = try reopened.load()
        try require(saved.threads.count == 1 && saved.threads[0].draft == "unsent durable draft", "restart retains draft and excludes incognito")
        try inspectCanaryFiles(home, canary: "PRIVATE-CANARY-9387")
        print("PASS: owner exclusion, real dbmd persistence, duplicate submit, bounded tool loop, exact approval, artifact publication, restart, draft, incognito")
        do { try EngineTurn(text: "", calls: [ProposedTool(name: "source.list", arguments: [:])], finishReason: "length").validate(); throw SevraError.refused("CHECK FAILED: truncated calls accepted") } catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "whole-turn completion gate") }
        do { try EngineTurn(text: "", calls: [ProposedTool(name: "source.list", arguments: [:]), ProposedTool(name: "shell", arguments: [:])]).validate(); throw SevraError.refused("CHECK FAILED: undeclared tool accepted") } catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "validate complete set before execution") }
        let source = try SourceFolder(url: folder)
        let single = try SourceFolder(url: folder.appendingPathComponent("notes.md"))
        try Data("Sibling must stay outside the grant".utf8).write(to: folder.appendingPathComponent("sibling.md"))
        let singleList = try single.execute(ProposedTool(name: "source.list", arguments: [:]), cancellation: Cancellation())
        try require(singleList.contains("notes.md") && !singleList.contains("sibling.md"), "file selection grants only the selected item")
        _ = try single.execute(ProposedTool(name: "source.read", arguments: ["id": .string("a1:notes.md")]), cancellation: Cancellation())
        do { _ = try single.execute(ProposedTool(name: "source.read", arguments: ["id": .string("a1:sibling.md")]), cancellation: Cancellation()); throw SevraError.refused("CHECK FAILED: single-file grant exposed sibling") } catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "sibling identifier refused") }
        try FileManager.default.removeItem(at: folder.appendingPathComponent("notes.md"))
        try FileManager.default.createSymbolicLink(at: folder.appendingPathComponent("notes.md"), withDestinationURL: home.appendingPathComponent("db/DB.md"))
        do { _ = try SourceFolder(url: folder.appendingPathComponent("notes.md")); throw SevraError.refused("CHECK FAILED: selected symlink accepted") } catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "selected symlink refused") }
        do { _ = try source.execute(ProposedTool(name: "source.read", arguments: ["id": .string("a1:notes.md")]), cancellation: Cancellation()); throw SevraError.refused("CHECK FAILED: symlink substitution accepted") } catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "source symlink substitution denied") }
        print("PASS: terminal gating, undeclared tools, single-file scope, sibling refusal, source symlink substitution")
        try await auditChecks(root: root, dbmd: dbmd)
        try await archiveChecks(root: root, dbmd: dbmd)
        try await externalDraftChecks(root: root, dbmd: dbmd)
        try await longConversationChecks(root: root, dbmd: dbmd)
        try await promotionChecks(root: root, dbmd: dbmd)
        try await performanceChecks(root: root, dbmd: dbmd)
        try await writeBehindChecks(root: root, dbmd: dbmd)
        try await adverseChecks(root: root, dbmd: dbmd)
        try await ipcChecks(root: root, dbmd: dbmd)
        try await personalLoopChecks(root: root, dbmd: dbmd)
        try await thinkingChecks(root: root, dbmd: dbmd)
        try await responseDetailsChecks(root: root, dbmd: dbmd)
        try await basicsChecks(root: root, dbmd: dbmd)
        try await sourceNavigationChecks(root: root, dbmd: dbmd)
    } catch { fputs(error.localizedDescription + "\n", stderr); result = 1 }
}
sem.wait(); exit(result)
