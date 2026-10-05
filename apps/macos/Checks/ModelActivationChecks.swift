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

    // Durable selection retains the resolved pack independently of Auto.
    // Reopening or rollback validates that exact supported manifest instead
    // of asking a potentially newer hardware policy to select again.
    let selected = try Journal.Selection(.init(), pack: ModelPackRegistry.baseline)
    let encodedSelection = try JSONEncoder().encode(selected)
    let reopenedSelection = try JSONDecoder().decode(Journal.Selection.self, from: encodedSelection)
    try check(try reopenedSelection.validatedPack().manifestDigest == ModelPackRegistry.baseline.manifestDigest &&
        reopenedSelection.preferences.quantization == .automatic &&
        reopenedSelection.startupPolicyID == ModelPackRegistry.baseline.startupDefaults.id &&
        reopenedSelection.startupRecipeIdentity == ModelPackRegistry.baseline.startupDefaults.recipeIdentity,
        "durable Auto retains its exact pack, startup policy and the saved Auto choice")
    var legacyObject = try JSONSerialization.jsonObject(with: encodedSelection) as! [String: Any]
    legacyObject.removeValue(forKey: "startupPolicyID")
    legacyObject.removeValue(forKey: "startupRecipeIdentity")
    let legacySelection = try JSONDecoder().decode(Journal.Selection.self,
        from: JSONSerialization.data(withJSONObject: legacyObject))
    try legacySelection.validate()
    try check(legacySelection == selected && legacySelection.startupPolicyID == nil && legacySelection.startupRecipeIdentity == nil,
        "legacy original startup identity remains equivalent and does not unlock an automatic retry")
    try expectFailure("resolved pack cannot override an explicit unsupported choice") {
        _ = try Journal.Selection(.init(quantization: .pack("unavailable-pack")), pack: ModelPackRegistry.baseline)
    }
    let frozenDirectory = root.appendingPathComponent("activation-frozen-selection")
    let frozenJournal = try Journal(directory: frozenDirectory)
    for (key, value) in [("manifest", String(repeating: "f", count: 64)), ("packID", "unavailable-pack"),
                         ("packID", ""), ("startupPolicyID", "superseded-startup-policy"),
                         ("startupRecipeIdentity", String(repeating: "f", count: 64))] {
        var object = try JSONSerialization.jsonObject(with: encodedSelection) as! [String: Any]
        object[key] = value
        let altered = try JSONDecoder().decode(Journal.Selection.self, from: JSONSerialization.data(withJSONObject: object))
        try expectFailure("changed durable pack identity cannot load or begin activation") {
            _ = try frozenJournal.begin(altered)
        }
        try check(frozenJournal.state.attempt == nil && frozenJournal.state.lastGood == nil,
            "rejected selection creates no pending or healthy activation")
    }
    var readiness = selected.preferences; readiness.readiness = .keepReady
    readiness.customGB = 11; readiness.hasCustomLimit = true
    try check(selected.matchesRequestedConfiguration(readiness),
        "readiness and an inactive custom slider do not replace a pending Auto load")
    for changed in [PerformancePreferences(budget: .custom, customGB: 10),
                    PerformancePreferences(quantization: .pack(ModelPackRegistry.baseline.id)),
                    PerformancePreferences(liveMemory: .fixed)] {
        try check(!selected.matchesRequestedConfiguration(changed), "changed applied settings require a new selection")
    }
    try check(!original.matchesRequestedConfiguration(.init(budget: .custom, customGB: 9)),
        "a changed custom ceiling requires a new selection")

    let acceptanceDirectory = root.appendingPathComponent("activation-accepted-setup")
    let acceptanceGood = try seed(acceptanceDirectory)
    var acceptanceJournal: Journal? = try Journal(directory: acceptanceDirectory)
    try check(acceptanceJournal!.state.acceptedPacks == nil && acceptanceJournal!.acceptedManifests.isEmpty,
        "older original journals do not fabricate a new setup acceptance list")
    try acceptanceJournal!.accept(ModelPackRegistry.baseline)
    let accepted = try Data(contentsOf: acceptanceDirectory.appendingPathComponent("state.json"))
    try acceptanceJournal!.accept(ModelPackRegistry.baseline)
    try check(try Data(contentsOf: acceptanceDirectory.appendingPathComponent("state.json")) == accepted,
        "repeated setup acceptance preserves exact durable bytes")
    try check(acceptanceJournal!.state.lastGood == acceptanceGood &&
        acceptanceJournal!.acceptedManifests == [ModelPackRegistry.baseline.id: ModelPackRegistry.baseline.manifestDigest],
        "acceptance grants selection permission without replacing the healthy configuration")
    acceptanceJournal = nil
    acceptanceJournal = try Journal(directory: acceptanceDirectory)
    try check(acceptanceJournal!.state.acceptedPacks?.count == 1 && acceptanceJournal!.state.lastGood == acceptanceGood,
        "accepted version and prior health survive an offline restart")
    acceptanceJournal = nil
    let acceptanceObject = try JSONSerialization.jsonObject(with: accepted) as! [String: Any]
    let acceptedRows = acceptanceObject["acceptedPacks"] as! [[String: Any]]
    for (field, replacement) in [("packID", "future-supported-pack"), ("manifest", String(repeating: "f", count: 64)),
                                 ("startupPolicyID", "future-startup-policy"), ("startupRecipeIdentity", String(repeating: "f", count: 64))] {
        let directory = root.appendingPathComponent("activation-acceptance-version-" + field)
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        var object = acceptanceObject, rows = acceptedRows
        rows[0][field] = replacement; object["acceptedPacks"] = rows
        let bytes = try JSONSerialization.data(withJSONObject: object, options: [.sortedKeys])
        try bytes.write(to: directory.appendingPathComponent("state.json"))
        let journal = try Journal(directory: directory)
        try check(journal.acceptedManifests.isEmpty && journal.state.acceptedPacks?.count == 1,
            "unmatched accepted versions remain preserved and cannot authorize the current pack")
        try check(try Data(contentsOf: directory.appendingPathComponent("state.json")) == bytes,
            "inspection does not migrate a stale acceptance into current permission")
    }
    let tooManyAcceptedRows = (0..<65).map { index -> [String: Any] in
        var row = acceptedRows[0]; row["packID"] = "historical-pack-\(index)"; return row
    }
    for rows in [acceptedRows + acceptedRows, tooManyAcceptedRows,
                 [acceptedRows[0].merging(["manifest": "not-a-digest"], uniquingKeysWith: { _, new in new })]] {
        let directory = root.appendingPathComponent("activation-invalid-acceptance-" + UUID().uuidString)
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        var object = acceptanceObject; object["acceptedPacks"] = rows
        let bytes = try JSONSerialization.data(withJSONObject: object, options: [.sortedKeys])
        try bytes.write(to: directory.appendingPathComponent("state.json"))
        try expectFailure("duplicate, oversized or malformed acceptance history fails closed") { _ = try Journal(directory: directory) }
        try check(try Data(contentsOf: directory.appendingPathComponent("state.json")) == bytes,
            "rejected acceptance history preserves the original bytes")
    }
    for point in [Journal.WritePoint.beforeWrite, .beforeRename, .afterRename] {
        let directory = root.appendingPathComponent("activation-acceptance-write-" + UUID().uuidString)
        let good = try seed(directory)
        var armed = true
        var journal: Journal? = try Journal(directory: directory, fault: { observed in
            if armed, observed == point { armed = false; throw SevraError.refused("Injected acceptance interruption") }
        })
        try expectFailure("failed acceptance persistence is not acknowledged") { try journal!.accept(ModelPackRegistry.baseline) }
        try check(journal!.state.lastGood == good && journal!.state.attempt?.phase == .committed,
            "an acceptance write cannot replace or fail the active model transaction")
        journal = nil
        let reopened = try Journal(directory: directory)
        try check(reopened.state.lastGood == good, "acceptance interruption retains the prior healthy configuration")
        let expected = point == .afterRename ? 1 : 0
        try check((reopened.state.acceptedPacks?.count ?? 0) == expected,
            "acceptance interruption recovers the actual renamed state")
    }
    let absentSetup = ModelSetup(model: root.appendingPathComponent("not-installed-model"))
    let absentHistory = root.appendingPathComponent("unaccepted-model-history")
    let absentOwner = LocalInference(model: absentSetup.modelDirectory, activationDirectory: absentHistory)
    do { try await absentOwner.acceptModelSetup(absentSetup); throw SevraError.refused("CHECK FAILED: accepted unchecked setup") }
    catch { try check(!error.localizedDescription.contains("CHECK FAILED"), "an unchecked setup never grants acceptance") }
    try check(!FileManager.default.fileExists(atPath: absentHistory.path),
        "unchecked setup creates no acceptance history or model")

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
    let validRepair = root.appendingPathComponent("activation-valid-repair-refusal")
    let validReceipt = try seed(validRepair)
    try expectFailure("repair cannot reset a valid activation") { _ = try Journal(directory: validRepair, archiveInvalidState: true) }
    try check(try Journal(directory: validRepair).state.lastGood == validReceipt, "valid history survives an unnecessary repair")
    for invalid in [Data(), Data("{not json".utf8), Data(repeating: 65, count: 65_537)] {
        let directory = root.appendingPathComponent("activation-corrupt-" + UUID().uuidString)
        _ = try seed(directory)
        try invalid.write(to: directory.appendingPathComponent("state.json"))
        try expectFailure("corrupt or oversized state fails closed") { _ = try Journal(directory: directory) }
        try check(try Data(contentsOf: directory.appendingPathComponent("state.json")) == invalid,
            "unreadable activation history is not erased")
        let repaired = try Journal(directory: directory, archiveInvalidState: true)
        guard let name = repaired.archivedRecordName else { throw SevraError.refused("CHECK FAILED: repair has no preserved record") }
        try check(try Data(contentsOf: directory.appendingPathComponent(name)) == invalid,
            "explicit repair preserves every damaged byte")
        try check(repaired.state.lastGood == nil && repaired.state.attempt == nil,
            "repaired setup has no invented successful health receipt")
        try expectFailure("repair retains exclusive activation ownership") { _ = try Journal(directory: directory) }
        _ = try repaired.begin(original)
        try check(repaired.state.lastGood == nil && repaired.state.attempt?.phase == .requested,
            "repair requires a new verified healthy load")
    }
    for point in [Journal.WritePoint.beforeArchive, .afterArchive] {
        let directory = root.appendingPathComponent("activation-repair-interruption-" + UUID().uuidString)
        _ = try seed(directory)
        let invalid = Data("{interrupted repair".utf8)
        try invalid.write(to: directory.appendingPathComponent("state.json"))
        try expectFailure("interrupted repair is not acknowledged") {
            _ = try Journal(directory: directory, fault: { observed in
                if observed == point { throw SevraError.refused("Injected repair interruption") }
            }, archiveInvalidState: true)
        }
        let names = try FileManager.default.contentsOfDirectory(atPath: directory.path)
        let preserved = names.filter { $0.hasPrefix("preserved-state-") }
        try check(preserved.count == (point == .afterArchive ? 1 : 0), "repair interruption preserves exactly one record location")
        let name = preserved.first ?? "state.json"
        try check(try Data(contentsOf: directory.appendingPathComponent(name)) == invalid,
            "repair interruption preserves original bytes")
        if point == .afterArchive {
            let reopened = try Journal(directory: directory)
            try check(reopened.state.lastGood == nil && reopened.state.attempt == nil,
                "restart after archival still requires health and activation")
        }
    }
    let repairedElsewhere = root.appendingPathComponent("activation-repaired-before-archive")
    _ = try seed(repairedElsewhere)
    let goodBytes = try Data(contentsOf: repairedElsewhere.appendingPathComponent("state.json"))
    try Data("{stale repair".utf8).write(to: repairedElsewhere.appendingPathComponent("state.json"))
    try expectFailure("stale repair cannot move a replaced valid record") {
        _ = try Journal(directory: repairedElsewhere, fault: { point in
            if point == .beforeArchive { try goodBytes.write(to: repairedElsewhere.appendingPathComponent("state.json"), options: .atomic) }
        }, archiveInvalidState: true)
    }
    try check(try Data(contentsOf: repairedElsewhere.appendingPathComponent("state.json")) == goodBytes,
        "concurrent file repair remains at its original path")
    try check(try !FileManager.default.contentsOfDirectory(atPath: repairedElsewhere.path).contains(where: { $0.hasPrefix("preserved-state-") }),
        "stale repair creates no archive")
    let symlink = root.appendingPathComponent("activation-symlink")
    _ = try seed(symlink)
    let external = root.appendingPathComponent("outside-activation.json")
    let canary = Data("preserved".utf8); try canary.write(to: external)
    try FileManager.default.removeItem(at: symlink.appendingPathComponent("state.json"))
    try FileManager.default.createSymbolicLink(at: symlink.appendingPathComponent("state.json"), withDestinationURL: external)
    try expectFailure("symlink activation history refused") { _ = try Journal(directory: symlink) }
    try expectFailure("explicit repair cannot move a symlink") { _ = try Journal(directory: symlink, archiveInvalidState: true) }
    try check(try Data(contentsOf: external) == canary, "activation never mutates a symlink target")
    let linked = root.appendingPathComponent("activation-hardlink")
    _ = try seed(linked)
    try FileManager.default.removeItem(at: linked.appendingPathComponent("state.json"))
    try check(link(external.path, linked.appendingPathComponent("state.json").path) == 0, "create shared-inode refusal fixture")
    try expectFailure("repair cannot move a shared inode") { _ = try Journal(directory: linked, archiveInvalidState: true) }
    try check(try Data(contentsOf: external) == canary, "repair leaves a shared record untouched")

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
    try await inference.configure(.init(readiness: .keepReady))
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
    try check(corruptInference.performanceTelemetry?.snapshot(preferences: .init(), pending: false, busy: false).activationRecoveryAvailable == true,
        "damaged owned record exposes explicit repair")
    try await corruptInference.recoverModelActivation()
    try check(corruptInference.performanceTelemetry?.activationFailureMessage == nil && corruptInference.performanceTelemetry?.isLoaded == false,
        "repair clears the storage failure without loading a model")
    let preservedNames = try FileManager.default.contentsOfDirectory(atPath: corruptDirectory.path).filter { $0.hasPrefix("preserved-state-") }
    try check(preservedNames.count == 1 && (try Data(contentsOf: corruptDirectory.appendingPathComponent(preservedNames[0]))) == corruptState,
        "inference repair preserves the damaged record")
    do {
        _ = try await corruptInference.turn(history: [.init(role: "user", content: "Hello")], tools: [],
            cancellation: Cancellation(), buffer: TurnBuffer())
        throw SevraError.refused("CHECK FAILED: repair bypassed model verification")
    } catch { try check(error.localizedDescription.contains("missing or incomplete"), "repaired setup still verifies its complete model") }
    try check(corruptInference.performanceTelemetry?.snapshot(preferences: .init(), pending: false, busy: false).activationRecoveryAvailable == false,
        "a missing model does not offer destructive setup repair")
    do { try await corruptInference.recoverModelActivation(); throw SevraError.refused("CHECK FAILED: valid setup reset again") }
    catch { try check(!error.localizedDescription.contains("CHECK FAILED"), "repeat repair refuses valid setup") }

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
    let repairDirectory = root.appendingPathComponent("activation-runtime-repair")
    try FileManager.default.createDirectory(at: repairDirectory, withIntermediateDirectories: true)
    try corruptState.write(to: repairDirectory.appendingPathComponent("state.json"))
    let repairOwner = LocalInference(model: missing, activationDirectory: repairDirectory)
    let repairing = try SevraRuntime(homeURL: root.appendingPathComponent("activation-repair-home"), dbmd: dbmd, inference: repairOwner)
    let waiting = try await repairing.newThread(mode: .shared)
    _ = try await repairing.submit(threadID: "home", text: "Preserve my first request", nonce: "repair-first")
    _ = try await repairing.submit(threadID: waiting, text: "Preserve my queued request", nonce: "repair-queued")
    for _ in 0..<300 {
        if await repairing.snapshot().home.threads.first(where: { $0.id == "home" })?.run?.state == .failed { break }
        try await Task.sleep(nanoseconds: 10_000_000)
    }
    try await Task.sleep(nanoseconds: 50_000_000)
    try check(await repairing.snapshot().home.threads.first(where: { $0.id == waiting })?.run?.state == .queued,
        "corrupt setup keeps later work queued")
    try await repairing.recoverModelActivation()
    for _ in 0..<300 {
        if await repairing.snapshot().home.threads.first(where: { $0.id == waiting })?.run?.state == .failed { break }
        try await Task.sleep(nanoseconds: 10_000_000)
    }
    let repairedHome = await repairing.snapshot().home
    try check(repairedHome.threads.first(where: { $0.id == waiting })?.run?.state == .failed,
        "explicit repair resumes queued work through real missing-model verification")
    let messages = repairedHome.threads.flatMap(\.messages).map(\.text)
    try check(messages.contains("Preserve my first request") && messages.contains("Preserve my queued request"),
        "repair preserves conversations and queued input")
    try await repairing.shutdown()
    print("PASS: durable activation phases, exclusive ownership, stale callbacks, interrupted writes, rollback, bounded state, explicit preserved-record repair and weights-free retry")
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
        let configuration = first.metrics?.configurations?.first
        try check(configuration?.startupPolicyID == ModelPackRegistry.baseline.startupDefaults.id &&
            configuration?.executionPolicyIdentity?.count == 64 &&
            initial.lastGood?.selection.startupPolicyID == configuration?.startupPolicyID,
            "the real response and durable activation bind the applied startup recipe")
        let firstStats = await inference!.lastStats
        try check(!firstStats.isEmpty && firstStats.allSatisfy { stats in
            guard let maximum = stats.prefillChunkLimit, (256...4096).contains(maximum) else { return false }
            return stats.prefillComputePasses.allSatisfy { $0 <= maximum }
                && (stats.promptTokens >= PerformancePolicy.shortPromptTokens || maximum <= PerformancePolicy.shortPromptChunk)
        }, "the real app applies and reports the bounded short-prompt policy")
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
        do { try await inference!.recoverModelActivation(); throw SevraError.refused("CHECK FAILED: repair reset a loaded model") }
        catch { try check(!error.localizedDescription.contains("CHECK FAILED"), "repair cannot touch a healthy loaded owner") }
        await inference!.unload(); inference = nil
        // Only this invocation's new disposable history is damaged. The
        // installed pack, ordinary app history and all user Homes are untouched.
        try Data(contentsOf: root.appendingPathComponent("state.json"))
            .write(to: root.appendingPathComponent("healthy-before-repair-fixture.json"), options: .withoutOverwriting)
        let damaged = Data("{damaged activation fixture".utf8)
        try damaged.write(to: root.appendingPathComponent("state.json"))
        inference = LocalInference(model: model, preferences: requested, activationDirectory: root)
        do { _ = try await run(); throw SevraError.refused("CHECK FAILED: damaged setup loaded the model") }
        catch { try check(error.localizedDescription.contains("unreadable"), "damaged real setup refuses before model allocation") }
        try check(inference!.performanceTelemetry?.isLoaded == false, "damaged setup leaves the real model unloaded")
        try await inference!.recoverModelActivation()
        try check(try state().lastGood == nil && state().attempt?.phase == .requested,
            "repair creates intent without claiming a healthy model")
        let repaired = try await run()
        try check(repaired.text.trimmingCharacters(in: .whitespacesAndNewlines) == "OK", "real model works after explicit repair")
        let repairedState = try state()
        try check(repairedState.lastGood?.selection.preferences == requested
            && repairedState.lastGood?.generation == repaired.metrics?.configurations?.first?.generation
            && repairedState.attempt?.phase == .committed,
            "fresh real health and response bind the preserved requested settings")
        let archives = try FileManager.default.contentsOfDirectory(atPath: root.path).filter { $0.hasPrefix("preserved-state-") }
        try check(archives.count == 1 && (try Data(contentsOf: root.appendingPathComponent(archives[0]))) == damaged,
            "real repair preserves the exact damaged bytes")
        await inference!.unload(); inference = nil
        print("PASS: real bounded health, durable activation, partial-load failure, sequential rollback, blocked failed-selection work, explicit retry, new-owner recovery, cancellation during commit and preserved-record repair")
    } catch {
        await inference?.unload(); inference = nil
        throw error
    }
    return true
}
