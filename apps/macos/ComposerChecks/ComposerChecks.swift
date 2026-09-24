import Foundation
import SevraPresentation
import SevraRuntime

private struct Failure: Error, LocalizedError {
    let errorDescription: String?
    init(_ text: String) { errorDescription = text }
}
private func check(_ condition: Bool, _ label: String, line: Int = #line) throws {
    if !condition { throw Failure("Line \(line): \(label)") }
}
@MainActor private func eventually(_ label: String, _ predicate: () -> Bool) async throws {
    for _ in 0..<3000 {
        if predicate() { return }
        await Task.yield()
    }
    throw Failure("Timed out: " + label)
}
/// Waits on the clock for work a timer schedules, which yielding cannot reach.
/// A shared CI Mac can run a debounced save long after its delay.
@MainActor private func within(_ seconds: Double, _ label: String, _ predicate: () -> Bool) async throws {
    let deadline = Date().addingTimeInterval(seconds)
    while !predicate() {
        guard Date() < deadline else { throw Failure("Timed out: " + label) }
        try await Task.sleep(nanoseconds: 5_000_000)
    }
}
@MainActor private final class Gate {
    var entered = false
    var continuation: CheckedContinuation<Void, Never>?
    func wait() async { entered = true; await withCheckedContinuation { continuation = $0 } }
    func release() { continuation?.resume(); continuation = nil }
}
@MainActor private final class Store {
    typealias Draft = ComposerSession.Draft
    var drafts = ["home": Draft(text: "", revision: 0), "other": Draft(text: "other saved", revision: 7)]
    var writes: [(String, String, Int)] = []
    var messages: [(String, String, String)] = []
    var nonces: [String] = []
    var accepted = Set<String>()
    var writeGate: Gate?, sendGate: Gate?, readGate: Gate?
    var failWrite = false, failRead = false, failSend = false, loseSendReceipt = false, loseWriteReceipt = false
    var revisionConflicts = 0
    var concurrentWrites = 0, maximumConcurrentWrites = 0
    func begin() { concurrentWrites += 1; maximumConcurrentWrites = max(maximumConcurrentWrites, concurrentWrites) }
    func read(_ id: String) async throws -> Draft {
        if let gate = readGate { readGate = nil; await gate.wait() }
        if failRead { throw Failure("Read unavailable") }
        return drafts[id]!
    }
    func write(_ id: String, _ text: String, _ revision: Int) async throws -> Draft {
        begin(); defer { concurrentWrites -= 1 }; writes.append((id, text, revision))
        if let gate = writeGate { writeGate = nil; await gate.wait() }
        if failWrite { throw Failure("Disk unavailable") }
        if revisionConflicts > 0 { revisionConflicts -= 1; drafts[id]!.revision += 1 }
        if drafts[id]!.text == text { return drafts[id]! }
        guard drafts[id]!.revision == revision else { throw ComposerSession.Changed(drafts[id]!) }
        drafts[id] = Draft(text: text, revision: revision + 1)
        if loseWriteReceipt { loseWriteReceipt = false; throw Failure("Lost acknowledgement") }
        return drafts[id]!
    }
    func send(_ id: String, _ text: String, _ nonce: String, _ revision: Int, _ remaining: String) async throws -> Draft {
        begin(); defer { concurrentWrites -= 1 }; nonces.append(nonce)
        if let gate = sendGate { sendGate = nil; await gate.wait() }
        if accepted.contains(nonce) { return drafts[id]! }
        if failSend { throw Failure("Send unavailable") }
        guard drafts[id]!.revision == revision else { throw ComposerSession.Changed(drafts[id]!) }
        accepted.insert(nonce); messages.append((id, text, nonce))
        drafts[id] = Draft(text: remaining, revision: revision + 1)
        if loseSendReceipt { loseSendReceipt = false; throw Failure("Lost acceptance acknowledgement") }
        return drafts[id]!
    }
    func session(delay: UInt64 = 60_000_000_000) async throws -> ComposerSession {
        let session = ComposerSession(store: .init(read: read, write: write, send: send), debounceNanoseconds: delay)
        try await session.open("home")
        return session
    }
}

@main struct ComposerChecks {
    @MainActor static func main() async {
        var passed = 0
        func run(_ name: String, _ body: () async throws -> Void) async throws {
            try await body(); passed += 1; print("PASS: " + name)
        }
        do {
            try await run("External adoption refreshes clean drafts and preserves competing unsaved text") {
                let store = Store(), session = try await store.session()
                store.drafts["home"] = .init(text: "Adopted external draft", revision: 1)
                try await session.reloadAfterExternalReview()
                try check(session.text == "Adopted external draft" && session.saved, "clean composer refreshed")
                session.edit("My unsaved competing version")
                store.drafts["home"] = .init(text: "Second external draft", revision: 2)
                try await session.reloadAfterExternalReview()
                try check(session.text == "My unsaved competing version" && !session.canSend && store.writes.isEmpty, "local edit stays visible without implicit overwrite")
                await session.keepMyDraft()
                try check(store.drafts["home"]?.text == "My unsaved competing version", "explicit local choice writes against adopted revision")
                session.finish()
            }
            try await run("Continue in thread saves Home before creation and rejects overlapping clicks") {
                let store = Store(), session = try await store.session(), gate = Gate()
                var creations = 0
                session.edit("Unsent Home draft")
                let first = Task { try await session.move(prepare: {
                    try check(store.drafts["home"]?.text == "Unsent Home draft", "Home draft saved before promotion")
                    creations += 1
                    await gate.wait()
                    return ("other", store.drafts["other"]!)
                }) }
                try await eventually("promotion entered") { gate.entered }
                let second = try await session.move(prepare: { creations += 1; return ("other", store.drafts["other"]!) })
                try check(!second && creations == 1, "repeated click cannot create another destination")
                session.edit("Home draft typed during promotion")
                gate.release()
                try check(try await first.value, "promotion navigated")
                try check(store.drafts["home"]?.text == "Home draft typed during promotion", "late Home edits preserved")
                try check(session.threadID == "other" && session.text == "other saved", "existing continuation draft restored")
                session.finish()
            }
            try await run("Continue in thread cannot create a destination when saving Home fails") {
                let store = Store(), session = try await store.session()
                store.failWrite = true; session.edit("Keep this Home draft")
                var creations = 0
                let moved = try await session.move(prepare: { creations += 1; return ("other", store.drafts["other"]!) })
                try check(!moved && creations == 0 && session.threadID == "home" && session.text == "Keep this Home draft", "failed save preserves Home without creating a thread")
                session.finish()
            }
            try await run("old stale-snapshot sequence reproduces a rejected draft") {
                let store = Store()
                _ = try await store.write("home", "first", 0)
                do { _ = try await store.write("home", "second", 0); throw Failure("Old sequence did not reproduce") }
                catch is ComposerSession.Changed { }
            }
            try await run("back-to-back saves use acknowledged revisions without any display refresh") {
                let store = Store(), session = try await store.session()
                try check(!session.canSend, "empty composer cannot send")
                session.edit("first"); try check(await session.flush(), "first save")
                try check(session.canSend, "saved nonempty composer can send")
                session.edit("second"); try check(await session.flush(), "second save")
                try check(store.writes.map { $0.2 } == [0, 1], "fresh revisions")
                try check(session.issue == nil && session.saved && store.drafts["home"]?.text == "second", "latest saved")
                session.finish()
            }
            try await run("overlapping save callers coalesce edits and never write concurrently") {
                let store = Store(), session = try await store.session(), gate = Gate()
                store.writeGate = gate; session.edit("first")
                let first = Task { await session.flush() }
                try await eventually("first write") { gate.entered }
                for n in 1...200 { session.edit("newest \(n) 👩🏽‍💻\n第二行\n") }
                let other = Task { await session.flush() }
                await Task.yield(); gate.release()
                let firstResult = await first.value, otherResult = await other.value
                try check(firstResult && otherResult, "both callers finish")
                try check(store.writes.count == 2 && store.maximumConcurrentWrites == 1, "coalesced serial writes")
                try check(store.drafts["home"]?.text == session.text && session.saved && session.issue == nil, "latest exact bytes")
                session.finish()
            }
            try await run("undo to the previous saved text during an in-flight write persists the undo") {
                let store = Store(), session = try await store.session(), gate = Gate()
                session.edit("keep"); _ = await session.flush()
                store.writeGate = gate; session.edit("temporary")
                let save = Task { await session.flush() }
                try await eventually("temporary write") { gate.entered }
                session.edit("keep"); gate.release(); _ = await save.value
                try check(store.drafts["home"]?.text == "keep" && session.saved, "undo cannot be lost")
                session.finish()
            }
            try await run("debounce saves only the newest edit and cancels pending work after Send") {
                let store = Store(), session = try await store.session(delay: 10_000_000)
                for n in 0..<100 { session.edit("draft \(n)") }
                try await within(10, "debounced save") { session.saved && !store.writes.isEmpty }
                try check(store.writes.count == 1 && store.drafts["home"]?.text == "draft 99", "one debounced save of the newest edit")
                session.edit("send now"); try check(await session.send(), "send before debounce")
                // Nothing may be saved after Send; give a pending save twenty delays to appear.
                try await Task.sleep(nanoseconds: 200_000_000)
                try check(session.text.isEmpty && session.saved && store.drafts["home"]?.text == "", "no stale restoration")
                try check(store.messages.count == 1 && session.issue == nil, "one message, no warning")
                session.finish()
            }
            try await run("typing that never pauses still saves about once per wait, never back to back") {
                let store = Store()
                let session = ComposerSession(store: .init(read: store.read, write: store.write, send: store.send),
                                              debounceNanoseconds: 300_000_000, maxWaitNanoseconds: 600_000_000)
                try await session.open("home")
                // Type until three saves happen. A slow machine types more
                // slowly, so this counts saves, not time; the pause check keeps
                // every save attributable to the wait bound, not to a pause.
                let start = Date()
                var n = 0, last = Date(), longestPause = 0.0, saves: [Date] = []
                while store.writes.count < 3 && Date().timeIntervalSince(start) < 6 {
                    n += 1; session.edit("typing \(n)")
                    try await Task.sleep(nanoseconds: 20_000_000)
                    let now = Date(); longestPause = max(longestPause, now.timeIntervalSince(last)); last = now
                    while saves.count < store.writes.count { saves.append(now) }
                }
                try check(longestPause < 0.3, "typing never paused as long as the debounce (longest \(Int(longestPause * 1000)) ms)")
                try check(saves.count >= 3, "saved while typing without a pause (\(saves.count) writes in \(Int(Date().timeIntervalSince(start) * 1000)) ms)")
                let gaps = zip(saves.dropFirst(), saves).map { $0.timeIntervalSince($1) }
                try check(gaps.allSatisfy { $0 >= 0.4 }, "one write per wait, not back to back (gaps \(gaps.map { Int($0 * 1000) }) ms)")
                try await within(10, "final save after typing stops") { session.saved }
                try check(store.drafts["home"]?.text == "typing \(n)" && store.maximumConcurrentWrites == 1, "newest text saved, one write at a time")
                session.finish()
            }
            try await run("Send before autosave atomically accepts the prompt and clears the older draft") {
                let store = Store(), session = try await store.session()
                session.edit("older saved"); _ = await session.flush()
                session.edit("send newer"); try check(await session.send(), "send")
                try check(store.messages.first?.1 == "send newer" && store.drafts["home"]?.text == "", "no old draft remains")
                session.edit("follow-up"); try check(await session.flush(), "follow-up uses new revision")
                try check(session.issue == nil, "no warning")
                session.finish()
            }
            try await run("Send waits for an in-flight save and preserves typing before acceptance") {
                let store = Store(), session = try await store.session(), gate = Gate(), acceptance = Gate()
                store.writeGate = gate; session.edit("prompt")
                let save = Task { await session.flush() }
                try await eventually("write") { gate.entered }
                store.sendGate = acceptance
                let send = Task { await session.send() }
                try await eventually("send queued") { session.sending }
                session.edit("next draft\n café 👋"); gate.release()
                try await eventually("acceptance") { acceptance.entered }
                try check(!(await session.send()), "double Send refused")
                try check(!(await session.prepareToClose()), "close refused while accepting")
                acceptance.release(); _ = await save.value
                try check(await send.value, "accepted")
                _ = await session.flush()
                try check(store.messages.count == 1 && store.messages[0].1 == "prompt", "original prompt only")
                try check(store.drafts["home"]?.text == "next draft\n café 👋" && session.text == "next draft\n café 👋", "new text retained")
                try check(store.maximumConcurrentWrites == 1, "Send serialized with autosave")
                session.finish()
            }
            try await run("typing during acceptance survives the cleared draft receipt") {
                let store = Store(), session = try await store.session(), gate = Gate()
                session.edit("prompt"); store.sendGate = gate
                let send = Task { await session.send() }
                try await eventually("send") { gate.entered }
                session.edit("next, typed during Send"); gate.release(); _ = await send.value
                _ = await session.flush()
                try check(store.drafts["home"]?.text == session.text && session.text == "next, typed during Send", "new text saved")
                session.finish()
            }
            try await run("edit-away-and-back while sending counts as a new draft") {
                let store = Store(), session = try await store.session(), gate = Gate()
                session.edit("repeat me"); store.sendGate = gate
                let send = Task { await session.send() }
                try await eventually("send") { gate.entered }
                session.edit("different"); session.edit("repeat me"); gate.release(); _ = await send.value
                _ = await session.flush()
                try check(session.text == "repeat me" && store.drafts["home"]?.text == "repeat me", "generation protects new identical text")
                session.finish()
            }
            try await run("failed save keeps text, blocks navigation/close and clears only after recovery") {
                let store = Store(), session = try await store.session()
                store.failWrite = true; session.edit("irreplaceable")
                try check(!(await session.flush()), "failure returned")
                try check(session.issue != nil && !session.saved && session.text == "irreplaceable", "text and actionable status")
                try check(!session.canSend, "save failure disables Send")
                try check(!(try await session.move(to: "other")), "navigation blocked")
                try check(!(await session.prepareToClose()), "close blocked")
                try check(session.threadID == "home", "same owner")
                store.failWrite = false; try check(await session.retry(), "retry")
                try check(session.issue == nil && session.saved, "warning cleared")
                try check(session.canSend, "Send restored after recovery")
                session.finish()
            }
            try await run("lost save acknowledgement reconciles exact persisted text") {
                let store = Store(), session = try await store.session()
                store.loseWriteReceipt = true; session.edit("committed")
                _ = await session.flush(); try check(session.issue != nil, "uncertainty shown")
                try check(await session.retry(), "retry confirms persisted value")
                session.edit("later"); try check(await session.flush(), "recovered revision")
                try check(session.issue == nil && store.drafts["home"]?.text == "later", "fully recovered")
                session.finish()
            }
            try await run("failed Send and lost acceptance receipt reuse nonce without duplicating messages") {
                for lostReceipt in [false, true] {
                    let store = Store(), session = try await store.session()
                    store.failSend = !lostReceipt; store.loseSendReceipt = lostReceipt
                    session.edit("only once"); try check(!(await session.send()), "failure")
                    try check(session.text == "only once" && session.issue != nil, "prompt preserved")
                    store.failSend = false; try check(await session.retry(), "retry")
                    try check(store.messages.count == 1 && Set(store.nonces).count == 1, "one acceptance with stable nonce")
                    try check(session.text.isEmpty && session.saved && session.issue == nil, "clean after retry")
                    session.finish()
                }
            }
            try await run("an idempotent Send retry never erases a subsequently changed saved draft") {
                let store = Store(), session = try await store.session()
                session.edit("accepted once"); store.loseSendReceipt = true
                _ = await session.send()
                store.drafts["home"] = .init(text: "newer from another client", revision: 5)
                try check(await session.retry(), "existing acceptance returned")
                try check(store.messages.count == 1 && session.issue != nil, "accepted once, competing draft surfaced")
                try check(store.drafts["home"]?.text == "newer from another client", "other draft preserved")
                session.finish()
            }
            try await run("revision-only conflicts recover silently and retry storms are bounded") {
                let store = Store(), session = try await store.session()
                store.revisionConflicts = 1; session.edit("safe")
                try check(await session.flush(), "rebase")
                try check(session.issue == nil, "no spurious banner")
                store.revisionConflicts = 10; session.edit("bounded")
                let before = store.writes.count; try check(!(await session.flush()), "bounded failure")
                try check(store.writes.count - before == 3 && session.text == "bounded", "retry bound and retained text")
                store.revisionConflicts = 0; _ = await session.retry(); session.finish()
            }
            try await run("real competing edits preserve both versions and require an explicit choice") {
                let store = Store(), session = try await store.session()
                session.edit("mine"); store.drafts["home"] = .init(text: "theirs", revision: 1)
                try check(!(await session.flush()), "conflict")
                try check(session.text == "mine" && store.drafts["home"]?.text == "theirs", "both preserved")
                session.edit("mine revised"); try check(!(await session.retry()), "no blind retry")
                await session.keepMyDraft()
                try check(session.saved && session.issue == nil && store.drafts["home"]?.text == "mine revised", "explicit local choice")
                session.edit("unsaved again"); store.drafts["home"] = .init(text: "saved choice", revision: 8)
                _ = await session.flush(); session.useSavedDraft()
                try check(session.text == "saved choice" && session.saved && session.issue == nil, "explicit saved choice")
                session.finish()
            }
            try await run("another change during conflict resolution is not overwritten") {
                let store = Store(), session = try await store.session()
                session.edit("mine"); store.drafts["home"] = .init(text: "second", revision: 1)
                _ = await session.flush()
                store.drafts["home"] = .init(text: "third", revision: 2)
                await session.keepMyDraft()
                try check(session.issue != nil && session.text == "mine" && store.drafts["home"]?.text == "third", "new conflict preserved")
                session.finish()
            }
            try await run("navigation saves typing during destination loading and keeps drafts in their own threads") {
                let store = Store(), session = try await store.session(), gate = Gate()
                session.edit("before move"); store.readGate = gate
                let move = Task { try await session.move(to: "other") }
                try await eventually("destination read") { gate.entered }
                session.edit("typed while opening other")
                try check(!(await session.send()), "Send cannot race navigation")
                gate.release(); try check(try await move.value, "move completed")
                try check(session.threadID == "other" && session.text == "other saved", "destination hydrated")
                try check(store.drafts["home"]?.text == "typed while opening other", "origin saved last edit")
                session.edit("other edited"); _ = try await session.move(to: "home")
                try check(session.text == "typed while opening other" && store.drafts["other"]?.text == "other edited", "both drafts bound correctly")
                session.finish()
            }
            try await run("failed destination read leaves the current composer intact") {
                let store = Store(), session = try await store.session()
                session.edit("remain here"); store.failRead = true
                do { _ = try await session.move(to: "other"); throw Failure("read failure swallowed") }
                catch let error as Failure { try check(error.errorDescription == "Read unavailable", "expected read failure") }
                try check(session.threadID == "home" && session.text == "remain here" && !session.transitioning, "current draft intact")
                session.finish()
            }
            try await run("close drains the in-flight writer before reporting safe to close") {
                let store = Store(), session = try await store.session(), gate = Gate()
                session.edit("survive closing"); store.writeGate = gate
                let save = Task { await session.flush() }
                try await eventually("write") { gate.entered }
                let close = Task { await session.prepareToClose() }
                await Task.yield(); session.edit("last edit before close"); gate.release()
                _ = await save.value; try check(await close.value, "close safe")
                try check(store.drafts["home"]?.text == "last edit before close", "durable latest text")
                session.finish()
            }
            try await run("quit freezes edits during shutdown and restores editing when shutdown fails") {
                let store = Store(), session = try await store.session(), gate = Gate()
                session.edit("last durable draft")
                let close = Task { try await session.close { await gate.wait(); throw Failure("Shutdown failed") } }
                try await eventually("shutdown") { gate.entered }
                try check(session.closing && session.saved, "saved before shutdown")
                try check(!session.canSend, "Send disabled during shutdown")
                session.edit("cannot type into a disabled closing editor")
                try check(session.text == "last durable draft", "frozen while shutting down")
                let moved = try await session.move(to: "other"), sent = await session.send()
                try check(!moved && !sent, "navigation and Send blocked")
                gate.release()
                do { _ = try await close.value; throw Failure("Missing shutdown error") }
                catch let error as Failure { try check(error.errorDescription == "Shutdown failed", "expected failure") }
                try check(!session.closing, "editing restored")
                session.edit("edited after failed shutdown"); try check(await session.flush(), "can save again")
                session.finish()
            }
            try await run("mixed typing, clearing, Unicode, thread changes and sending retain exact drafts") {
                let store = Store(), session = try await store.session()
                var seed: UInt64 = 0x5E7A
                var expected = ["home": "", "other": "other saved"]
                for n in 0..<200 {
                    seed = seed &* 6364136223846793005 &+ 1
                    let id = session.threadID
                    switch (seed >> 32) % 5 {
                    case 0, 1:
                        let text = n.isMultiple(of: 7) ? "" : "\(n) café 👩🏽‍💻\n\t日本語\n"
                        session.edit(text); expected[id] = text
                    case 2:
                        try check(await session.flush(), "mixed save")
                    case 3:
                        let next = id == "home" ? "other" : "home"
                        _ = try await session.move(to: next)
                        try check(session.text == expected[next], "mixed navigation")
                    default:
                        if !session.text.isEmpty {
                            let prompt = session.text; try check(await session.send(), "mixed Send")
                            expected[id] = ""; try check(store.messages.last?.1 == prompt, "exact mixed prompt")
                        }
                    }
                    try check(session.text == expected[session.threadID] && session.issue == nil, "oracle at step \(n)")
                }
                _ = await session.flush()
                try check(store.drafts.allSatisfy { expected[$0.key] == $0.value.text }, "all final drafts exact")
                try check(store.maximumConcurrentWrites == 1, "one writer throughout")
                session.finish()
            }
            try await run("discarding Incognito drains pending saves before changing owner") {
                let store = Store(), session = try await store.session(), gate = Gate()
                session.edit("private pending"); store.writeGate = gate
                let save = Task { await session.flush() }
                try await eventually("private write") { gate.entered }
                let move = Task { try await session.move(prepare: { ("other", store.drafts["other"]!) }, discardCurrent: true) }
                await Task.yield(); gate.release(); _ = await save.value
                try check(try await move.value, "moved")
                try check(session.threadID == "other" && session.text == "other saved", "no private draft in destination")
                session.finish()
            }
            try await runtimeChecks()
            try await journalChecks()
            print("PASS: \(passed) composer scenarios plus real-runtime persistence checks")
        } catch { fputs("FAIL: \(error.localizedDescription)\n", stderr); exit(1) }
    }

    @MainActor private static func runtimeChecks() async throws {
        let root = FileManager.default.temporaryDirectory.resolvingSymlinksInPath().appendingPathComponent("sevra-composer-" + UUID().uuidString)
        defer { try? FileManager.default.removeItem(at: root) }
        let dbmd = URL(fileURLWithPath: ProcessInfo.processInfo.environment["SEVRA_DBMD"] ?? NSHomeDirectory() + "/.dbmd/bin/dbmd")
        do {
        let runtimeRef = try SevraRuntime(homeURL: root, dbmd: dbmd, inference: ScriptedInference(turns: [EngineTurn(text: "OK")]))
        let session = ComposerSession(store: .init(
            read: { id in let v = try await runtimeRef.draftState(threadID: id); return .init(text: v.text, revision: v.revision) },
            write: { id, text, revision in
                do { let v = try await runtimeRef.saveDraft(threadID: id, text: text, expectedRevision: revision); return .init(text: v.text, revision: v.revision) }
                catch let changed as DraftConflict { throw ComposerSession.Changed(.init(text: changed.current.text, revision: changed.current.revision)) }
            },
            send: { id, text, nonce, revision, remaining in
                do { let v = try await runtimeRef.submitDraft(threadID: id, text: text, nonce: nonce, expectedRevision: revision, remainingDraft: remaining); return .init(text: v.text, revision: v.revision) }
                catch let changed as DraftConflict { throw ComposerSession.Changed(.init(text: changed.current.text, revision: changed.current.revision)) }
            }), debounceNanoseconds: 60_000_000_000)
        try await session.open("home")
        session.edit(String(repeating: "x", count: 65_537))
        try check(!(await session.flush()) && session.issue != nil, "oversized draft refused with retained text")
        session.edit(String(repeating: "x", count: 65_536)); try check(await session.flush(), "draft limit boundary accepted")
        session.edit(String(repeating: "x", count: 16_385))
        try check(!(await session.send()) && session.text.utf8.count == 16_385, "oversized message retained")
        session.edit("old persisted"); try check(await session.flush(), "real save")
        session.edit("actual prompt"); try check(await session.send(), "real acceptance")
        let submitted = await runtimeRef.snapshot()
        try check(submitted.home.threads[0].messages.first?.text == "actual prompt" && submitted.home.threads[0].draft.isEmpty, "atomic accept/clear")
        do { _ = try await runtimeRef.saveDraft(threadID: "home", text: "old persisted", expectedRevision: 1); throw Failure("stale write restored sent draft") }
        catch is DraftConflict { }
        session.edit("reopen exactly 👋\n  café\n"); try check(await session.prepareToClose(), "real close flush")
        let draftFile = root.appendingPathComponent("db/records/drafts/home.md")
        let original = try Data(contentsOf: draftFile)
        let external = original + Data("\nExternal edit must survive.\n".utf8)
        try external.write(to: draftFile)
        do { _ = try await runtimeRef.saveDraft(threadID: "home", text: session.text); throw Failure("No-op incorrectly acknowledged an externally edited store") }
        catch let error as Failure { throw error }
        catch { try check(try Data(contentsOf: draftFile) == external, "external bytes preserved") }
        try original.write(to: draftFile)
        let incognito = try await runtimeRef.newThread(mode: .incognito)
        try await runtimeRef.saveDraft(threadID: incognito, text: "INCOGNITO-COMPOSER-CANARY")
        session.finish(); try await runtimeRef.shutdown()
        }
        let reopened = try HomeStore(root: root, dbmd: dbmd)
        let recovered = try reopened.load()
        try check(recovered.threads.count == 1 && recovered.threads[0].draft == "reopen exactly 👋\n  café\n", "close/reopen exact bytes and no Incognito")
        let index = try String(contentsOf: root.appendingPathComponent("db/records/drafts/home.md"), encoding: .utf8)
        try check(index.contains("reopen exactly") && !index.contains("old persisted"), "real dbmd draft record updated")
        try inspectIncognito(root)
        print("PASS: real dbmd persistence, atomic Send, stale-save refusal, external-edit/no-op refusal, exact reopen and Incognito exclusion")
    }
    @MainActor private static func journalChecks() async throws {
        let root = FileManager.default.temporaryDirectory.resolvingSymlinksInPath().appendingPathComponent("sevra-journal-" + UUID().uuidString)
        defer { try? FileManager.default.removeItem(at: root) }
        let dbmd = URL(fileURLWithPath: ProcessInfo.processInfo.environment["SEVRA_DBMD"] ?? NSHomeDirectory() + "/.dbmd/bin/dbmd")
        do {
            let runtime = try SevraRuntime(homeURL: root, dbmd: dbmd, inference: ScriptedInference(turns: []))
            let gate = Gate()
            var loseReceipt = true
            let session = ComposerSession(store: .init(
                read: { _ in let v = await runtime.journalDraftState(); return .init(text: v.text, revision: v.revision) },
                write: { _, text, revision in
                    do { let v = try await runtime.saveJournalDraft(text: text, expectedRevision: revision); return .init(text: v.text, revision: v.revision) }
                    catch let changed as DraftConflict { throw ComposerSession.Changed(.init(text: changed.current.text, revision: changed.current.revision)) }
                },
                send: { _, text, nonce, revision, remaining in
                    if loseReceipt { await gate.wait() }
                    let v = try await runtime.submitJournalDraft(text: text, nonce: nonce, expectedRevision: revision, remainingDraft: remaining)
                    if loseReceipt { loseReceipt = false; throw Failure("Lost journal acceptance receipt") }
                    return .init(text: v.text, revision: v.revision)
                }), debounceNanoseconds: 60_000_000_000)
            try await session.open("journal")
            session.edit("Exact journal entry café 👋"); try check(await session.flush(), "journal draft saved")
            let accepted = Task { await session.send() }
            try await eventually("journal acceptance") { gate.entered }
            try check(!(await session.send()), "double Save is blocked while accepting")
            gate.release()
            try check(!(await accepted.value), "uncertain journal result is surfaced")
            try check(await session.retry(), "uncertain acceptance retry reconciles")
            session.edit("Next journal draft remains after restart")
            try check(try await session.close(perform: { try await runtime.shutdown() }), "journal flush and close")
            session.finish()
        }
        let restored = try HomeStore(root: root, dbmd: dbmd).load()
        try check(restored.journal.map(\.text) == ["Exact journal entry café 👋"], "one exact entry after duplicate and lost receipt")
        try check(restored.journalDraft == "Next journal draft remains after restart", "journal draft survives quit/reopen")
        print("PASS: production journal coordinator, double Save, lost acceptance retry and exact entry/draft restart")
    }
    private static func inspectIncognito(_ root: URL) throws {
        let files = FileManager.default.enumerator(at: root, includingPropertiesForKeys: [.isRegularFileKey])!
        for case let url as URL in files {
            if let data = try? Data(contentsOf: url), let text = String(data: data, encoding: .utf8) {
                try check(!text.contains("INCOGNITO-COMPOSER-CANARY"), "Incognito absent from disk")
            }
        }
    }
}
