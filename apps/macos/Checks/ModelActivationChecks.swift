import Darwin
import Foundation
import SevraRuntime
import Slotstream

func modelActivationChecks(root: URL, dbmd: URL) async throws {
    typealias Journal = ModelActivationJournal
    func check(_ value: Bool, _ message: String) throws { try require(value, message) }
    let original = try Journal.Selection(.init(budget: .custom, customGB: 10))
    let requested = try Journal.Selection(.init(budget: .custom, customGB: 9, liveMemory: .fixed))
    func receipt(_ selection: Journal.Selection) -> Journal.Receipt {
        .init(selection: selection, generation: UUID(), arithmeticIdentity: String(repeating: "a", count: 64), healthTokens: 4)
    }
    func expectFailure(_ label: String, _ action: () throws -> Void) throws {
        do { try action(); throw SevraError.refused("CHECK FAILED: " + label) }
        catch { try check(!error.localizedDescription.contains("CHECK FAILED"), label) }
    }
    func advanceToCheck(_ journal: Journal, _ id: UUID) throws {
        for phase in [Journal.Phase.verified, .loading, .checking] { try journal.advance(id, to: phase) }
    }
    func seed(_ directory: URL) throws -> Journal.Receipt {
        let journal = try Journal(directory: directory)
        let id = try journal.begin(original), good = receipt(original)
        try advanceToCheck(journal, id); try journal.commit(id, receipt: good)
        return good
    }

    // Reopen after each durable phase, as a different inference owner would
    // after termination. None of these fixtures allocates an Engine or GPU.
    for phase in [Journal.Phase.requested, .verified, .loading, .checking] {
        let directory = root.appendingPathComponent("activation-" + phase.rawValue)
        let good = try seed(directory)
        var journal: Journal? = try Journal(directory: directory)
        let id = try journal!.begin(requested)
        for step in [Journal.Phase.verified, .loading, .checking] {
            if journal!.state.attempt?.phase == phase { break }
            try journal!.advance(id, to: step)
        }
        try check(journal!.state.lastGood == good, "staging never changes the active receipt")
        try expectFailure("second activation owner excluded") { _ = try Journal(directory: directory) }
        try expectFailure("unverified attempt cannot commit") {
            if phase != .checking { try journal!.commit(id, receipt: receipt(requested)) }
            else { try journal!.commit(UUID(), receipt: receipt(requested)) }
        }
        journal = nil
        journal = try Journal(directory: directory)
        try check(try journal!.recoverInterrupted(), "unfinished activation is recovered")
        try check(journal!.state.lastGood == good && journal!.state.attempt?.selection == requested
            && journal!.state.attempt?.failure == "interrupted", "restart preserves prior pack and requested override")
        try check(try !journal!.recoverInterrupted(), "recovery is idempotent")
        let retry = try journal!.begin(requested)
        try expectFailure("stale activation cannot advance") { try journal!.advance(id, to: .verified) }
        try journal!.fail(id)
        try check(journal!.state.attempt?.id == retry && journal!.state.attempt?.phase == .requested,
            "stale failure cannot invalidate a newer attempt")
        try advanceToCheck(journal!, retry)
        let activated = receipt(requested)
        try journal!.commit(retry, receipt: activated)
        journal = nil
        journal = try Journal(directory: directory)
        try check(try !journal!.recoverInterrupted(), "completed health and commit survive restart")
        try check(journal!.state.lastGood == activated, "completed activation has its own identity")
    }

    for point in [Journal.WritePoint.beforeWrite, .beforeRename, .afterRename] {
        let directory = root.appendingPathComponent("activation-write-" + UUID().uuidString)
        let good = try seed(directory)
        var armed = false
        var journal: Journal? = try Journal(directory: directory, fault: { observed in
            if armed, observed == point { armed = false; throw SevraError.refused("Injected storage interruption") }
        })
        let id = try journal!.begin(requested)
        try advanceToCheck(journal!, id)
        armed = true
        try expectFailure("failed activation write is not acknowledged") { try journal!.commit(id, receipt: receipt(requested)) }
        try journal!.fail(id)
        try check(journal!.state.lastGood == good && journal!.state.attempt?.phase == .failed,
            "an unacknowledged commit restores its prior pointer")
        let restored = receipt(original)
        try journal!.restored(id, receipt: restored)
        try check(journal!.state.attempt?.phase == .failed && journal!.state.lastGood == restored,
            "rollback does not satisfy the failed requested configuration")
        try expectFailure("rollback cannot choose an unrelated requested selection") {
            try journal!.restored(id, receipt: receipt(requested))
        }
        journal = nil
        let reopened = try Journal(directory: directory)
        try check(reopened.state.lastGood == restored && reopened.state.attempt?.selection == requested,
            "rollback keeps the user's requested settings through restart")
    }

    let cancelled = root.appendingPathComponent("activation-cancelled")
    do {
        let journal = try Journal(directory: cancelled)
        let id = try journal.begin(original)
        try journal.fail(id, cancelled: true)
        try check(journal.state.lastGood == nil && journal.state.attempt?.failure == "cancelled",
            "cancelled first setup is never an installed healthy model")
    }
    for invalid in [Data("{not json".utf8), Data(repeating: 65, count: 65_537)] {
        let directory = root.appendingPathComponent("activation-corrupt-" + UUID().uuidString)
        _ = try seed(directory)
        try invalid.write(to: directory.appendingPathComponent("state.json"))
        try expectFailure("corrupt or oversized state fails closed") { _ = try Journal(directory: directory) }
        try check(try Data(contentsOf: directory.appendingPathComponent("state.json")) == invalid,
            "unreadable activation history is not erased")
    }
    let symlink = root.appendingPathComponent("activation-symlink")
    _ = try seed(symlink)
    let external = root.appendingPathComponent("outside-activation.json")
    let canary = Data("preserved".utf8); try canary.write(to: external)
    try FileManager.default.removeItem(at: symlink.appendingPathComponent("state.json"))
    try FileManager.default.createSymbolicLink(at: symlink.appendingPathComponent("state.json"), withDestinationURL: external)
    try expectFailure("symlink activation history refused") { _ = try Journal(directory: symlink) }
    try check(try Data(contentsOf: external) == canary, "activation never mutates a symlink target")

    // A real LocalInference owner must retain failure and accept an explicit
    // settings retry without ever initializing Metal for missing weights.
    let missing = root.appendingPathComponent("missing-model")
    let localJournal = root.appendingPathComponent("missing-activation")
    let inference = LocalInference(model: missing, activationDirectory: localJournal)
    for expected in ["missing or incomplete", "did not activate"] {
        do {
            _ = try await inference.turn(history: [.init(role: "user", content: "Hello")], tools: [],
                cancellation: Cancellation(), buffer: TurnBuffer())
            throw SevraError.refused("CHECK FAILED: missing model produced a response")
        } catch { try check(error.localizedDescription.contains(expected), "missing pack and blocked retry remain distinct") }
    }
    try await inference.configure(.init())
    do {
        _ = try await inference.turn(history: [.init(role: "user", content: "Hello")], tools: [],
            cancellation: Cancellation(), buffer: TurnBuffer())
        throw SevraError.refused("CHECK FAILED: retry used a different model")
    } catch { try check(error.localizedDescription.contains("missing or incomplete"), "explicit settings permit one new verified attempt") }
    await inference.unload()
    try check(inference.performanceTelemetry?.isLoaded == false, "failed activation owns no model")

    // Failures before a journal is open or an intent is written must also
    // stop admission. An explicit retry can recheck storage, but must never
    // discard corrupt history or silently cycle through queued requests.
    let corruptDirectory = root.appendingPathComponent("activation-bootstrap-corrupt")
    try FileManager.default.createDirectory(at: corruptDirectory, withIntermediateDirectories: true)
    let corruptState = Data("{not json".utf8)
    try corruptState.write(to: corruptDirectory.appendingPathComponent("state.json"))
    let corruptInference = LocalInference(model: missing, activationDirectory: corruptDirectory)
    let writeFailureInference = LocalInference(model: missing, preferences: .init(),
        activationDirectory: root.appendingPathComponent("activation-bootstrap-write"), activationWriteFault: { point in
            if point == .beforeWrite { throw SevraError.refused("Injected initial intent failure") }
        })
    for (owner, initialError) in [(corruptInference, "unreadable"), (writeFailureInference, "Injected initial intent failure")] {
        for expected in [initialError, "did not activate"] {
            do {
                _ = try await owner.turn(history: [.init(role: "user", content: "Hello")], tools: [],
                    cancellation: Cancellation(), buffer: TurnBuffer())
                throw SevraError.refused("CHECK FAILED: activation bootstrap failure admitted work")
            } catch { try check(error.localizedDescription.contains(expected), "bootstrap failure blocks another request") }
            try check(owner.performanceTelemetry?.activationFailureMessage != nil,
                "bootstrap failure is visible to queue admission")
        }
    }
    try await corruptInference.configure(.init())
    do {
        _ = try await corruptInference.turn(history: [.init(role: "user", content: "Hello")], tools: [],
            cancellation: Cancellation(), buffer: TurnBuffer())
        throw SevraError.refused("CHECK FAILED: explicit retry erased corrupt history")
    } catch { try check(error.localizedDescription.contains("unreadable"), "explicit retry rechecks retained corrupt history") }
    try check(try Data(contentsOf: corruptDirectory.appendingPathComponent("state.json")) == corruptState,
        "retry preserves unreadable activation bytes")

    let queuedInference = LocalInference(model: missing, activationDirectory: root.appendingPathComponent("queue-activation"))
    let runtime = try SevraRuntime(homeURL: root.appendingPathComponent("activation-queue-home"), dbmd: dbmd,
        inference: queuedInference)
    let second = try await runtime.newThread(mode: .shared)
    _ = try await runtime.submit(threadID: "home", text: "First request", nonce: "activation-first")
    _ = try await runtime.submit(threadID: second, text: "Keep this request queued", nonce: "activation-queued")
    for _ in 0..<300 {
        let snapshot = await runtime.snapshot()
        if snapshot.home.threads.first(where: { $0.id == "home" })?.run?.state == .failed { break }
        try await Task.sleep(nanoseconds: 10_000_000)
    }
    try await Task.sleep(nanoseconds: 50_000_000)
    let queue = await runtime.snapshot()
    try check(queue.home.threads.first(where: { $0.id == "home" })?.run?.state == .failed,
        "the failed activation terminates its original request")
    try check(queue.home.threads.first(where: { $0.id == second })?.run?.state == .queued,
        "other queued work waits for explicit activation recovery")
    try await runtime.shutdown()
    print("PASS: durable activation phases, exclusive ownership, stale callbacks, interrupted writes, rollback, bounded state and weights-free retry")
}

/// Uses the ordinary LocalInference owner and real original pack. The only
/// injected behavior is one failed activation write after runtime allocation.
/// No fake headroom or extra model process is used.
func realActivationCheckIfRequested() async throws -> Bool {
    guard CommandLine.arguments.contains("--activation-real") else { return false }
    let args = CommandLine.arguments
    guard let index = args.firstIndex(of: "--home"), index + 1 < args.count else {
        throw SevraError.refused("Pass a new disposable --home for activation evidence.")
    }
    let root = URL(fileURLWithPath: args[index + 1])
    guard !FileManager.default.fileExists(atPath: root.path), (Machine.current().availableGB ?? 0) >= 13 else {
        throw SevraError.refused("Activation check requires a new directory and 13 GB real reclaimable memory.")
    }
    let original = PerformancePreferences(budget: .custom, customGB: 10)
    let requested = PerformancePreferences(budget: .custom, customGB: 9, liveMemory: .fixed)
    let model = WeightStore.default.modelDirectory
    var remainingWrites = 0
    var remainingCommittedWrites = 0
    var commitCancellation: Cancellation?
    func activationFault(_ point: ModelActivationJournal.WritePoint) throws {
        if point == .afterRename, remainingCommittedWrites > 0 {
            remainingCommittedWrites -= 1
            if remainingCommittedWrites == 0 { commitCancellation?.cancel() }
        }
        guard point == .beforeRename, remainingWrites > 0 else { return }
        remainingWrites -= 1
        if remainingWrites == 0 { throw SevraError.refused("Injected activation storage failure") }
    }
    var inference: LocalInference? = LocalInference(model: model, preferences: original, activationDirectory: root,
        activationWriteFault: activationFault)
    func state() throws -> ModelActivationJournal.State {
        try JSONDecoder().decode(ModelActivationJournal.State.self,
            from: Data(contentsOf: root.appendingPathComponent("state.json")))
    }
    func run(cancellation: Cancellation = Cancellation()) async throws -> EngineTurn {
        try await inference!.turn(history: [.init(role: "user", content: "Reply with only OK.")], tools: [],
            cancellation: cancellation, buffer: TurnBuffer())
    }
    func check(_ value: Bool, _ message: String) throws { try require(value, message) }
    do {
        let first = try await run()
        try check(first.text.trimmingCharacters(in: .whitespacesAndNewlines) == "OK", "initial real model responds")
        let initial = try state()
        try check(initial.attempt?.phase == .committed && initial.lastGood?.selection.preferences == original,
            "real health check precedes the initial activation receipt")
        try check(initial.lastGood?.generation == first.metrics?.configurations?.first?.generation,
            "the real response owns the committed generation")
        // requested, verified, loading, checking: fail the fourth durable
        // transition after the replacement Engine exists, before health/commit.
        remainingWrites = 4
        try await inference!.configure(requested)
        do { _ = try await run(); throw SevraError.refused("CHECK FAILED: injected change completed") }
        catch { try check(error.localizedDescription.contains("Injected activation storage failure"), "real change fails at the frozen transition") }
        let failed = try state()
        let telemetry = inference!.performanceTelemetry!.snapshot(preferences: requested, pending: false, busy: false)
        try check(failed.attempt?.phase == .failed && failed.attempt?.selection.preferences == requested,
            "failed real activation preserves the requested override")
        try check(failed.lastGood?.selection.preferences == original && telemetry.appliedCeilingGB == 10,
            "rollback reloads the prior configuration under its own ceiling")
        try check(telemetry.loaded && telemetry.state == "Model change failed" && telemetry.preferences == requested,
            "rollback is visible without replacing saved settings")
        try check(failed.lastGood?.generation != initial.lastGood?.generation,
            "rollback is a fresh runtime, never two resident engines")
        do { _ = try await run(); throw SevraError.refused("CHECK FAILED: failed-selection work ran against rollback") }
        catch { try check(error.localizedDescription.contains("did not activate"), "failed-selection work stays blocked") }
        try check(await inference!.lastStats.isEmpty, "blocked work executes no generation")
        try await inference!.configure(requested)
        let retried = try await run()
        try check(retried.text.trimmingCharacters(in: .whitespacesAndNewlines) == "OK", "explicit retry completes")
        try check(try state().lastGood?.selection.preferences == requested, "explicit retry commits its requested settings")
        let committed = try state().lastGood?.generation
        await inference!.unload(); inference = nil
        inference = LocalInference(model: model, preferences: requested, activationDirectory: root,
            activationWriteFault: activationFault)
        let restarted = try await run()
        try check(restarted.text.trimmingCharacters(in: .whitespacesAndNewlines) == "OK", "new owner revalidates and loads committed pack")
        try check(try state().lastGood?.generation != committed, "a new owner has a fresh load generation")
        let beforeCancellation = try state().lastGood
        await inference!.unload()
        remainingCommittedWrites = 5 // requested, verified, loading, checking, committed
        commitCancellation = Cancellation()
        do {
            _ = try await run(cancellation: commitCancellation!)
            throw SevraError.refused("CHECK FAILED: cancellation during commit published a runtime")
        } catch {
            try check(commitCancellation!.isCancelled && !error.localizedDescription.contains("CHECK FAILED"),
                "cancellation during durable commit returns without publication")
        }
        try check(try state().attempt?.failure == "cancelled" && state().lastGood == beforeCancellation,
            "cancelled publication preserves the prior health receipt")
        let cancelledStats = await inference!.lastStats
        try check(inference!.performanceTelemetry?.isLoaded == false && cancelledStats.isEmpty,
            "cancelled publication owns neither a loaded runtime nor a response")
        let afterCancellation = try await run()
        try check(afterCancellation.text.trimmingCharacters(in: .whitespacesAndNewlines) == "OK",
            "a new request can retry a user-cancelled activation")
        await inference!.unload(); inference = nil
        print("PASS: real bounded health, durable activation, partial-load failure, sequential rollback, blocked failed-selection work, explicit retry, new-owner recovery and cancellation during commit")
    } catch {
        await inference?.unload(); inference = nil
        throw error
    }
    return true
}
