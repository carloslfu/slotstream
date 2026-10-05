import Foundation
import SevraRuntime
import Slotstream

private func verifyPerformance(_ value: Bool, _ message: String) throws { try require(value, message) }

private actor PerformanceProbe: Inference {
    nonisolated let simulated = true
    var calls = 0
    var changes: [PerformancePreferences] = []
    var releases = 0
    var held = true
    var holdConfiguration = false
    var configuring = false
    var failConfiguration = false
    var configurationAttempts = 0
    var remainingConfigurationFailures = 0
    var setupAcceptances = 0
    func acceptModelSetup(_ setup: ModelSetup) { setupAcceptances += 1 }
    func holdSettings(_ value: Bool) { holdConfiguration = value }
    func failSettings(_ value: Bool) { failConfiguration = value }
    func failNextSettings(_ count: Int) { remainingConfigurationFailures = count }
    func configure(_ value: PerformancePreferences) async throws {
        configuring = true
        configurationAttempts += 1
        defer { configuring = false }
        while holdConfiguration { try? await Task.sleep(nanoseconds: 5_000_000) }
        if remainingConfigurationFailures > 0 {
            remainingConfigurationFailures -= 1
            throw SevraError.refused("Injected obsolete configuration failure")
        }
        if failConfiguration { throw SevraError.refused("Injected configuration failure") }
        changes.append(value); configuring = false
    }
    func unload() { releases += 1 }
    func release() { held = false }
    func turn(history: [ChatMessage], tools: [ToolDefinition], cancellation: Cancellation, buffer: TurnBuffer) async throws -> EngineTurn {
        calls += 1
        while held { try cancellation.check(); try await Task.sleep(nanoseconds: 5_000_000) }
        try cancellation.check(); _ = buffer.append("Ready")
        return EngineTurn(text: "Ready", calls: [])
    }
}
private func eventually(_ predicate: () async -> Bool) async throws {
    for _ in 0..<1000 {
        if await predicate() { return }
        try await Task.sleep(nanoseconds: 10_000_000)
    }
    throw SevraError.refused("CHECK FAILED: lifecycle did not settle")
}
func performanceChecks(root: URL, dbmd: URL) async throws {
    try modelVerificationChecks(root: root)
    try await modelActivationChecks(root: root, dbmd: dbmd)
    var plans = 0, refused = 0
    for ram in [8.0, 16, 24, 32, 48, 64, 96, 128] {
        for available in [0.0, 3, 8, 10, 13, 20, 35, 70] where available <= ram {
            let machine = Machine.simulated(ramGB: ram, availableGB: available)
            for preference in [PerformancePreferences(), .init(budget: .custom, customGB: 10),
                               .init(budget: .custom, customGB: 20), .init(budget: .custom, customGB: 33),
                               .init(budget: .custom, customGB: 48), .init(budget: .custom, customGB: 60)] {
                do {
                    let plan = try PerformancePolicy.plan(preference, on: machine)
                    try verifyPerformance(plan.simulated && plan.source == .auto, "custom is elastic and simulated plans stay simulated")
                    try verifyPerformance(plan.expectedPeakGB <= (plan.targetGB ?? 0) + 0.0001, "full allocation fits target")
                    try verifyPerformance((plan.targetGB ?? 0) <= available - Planner.availabilitySlackGB(ramGB: ram) + 0.0001, "no advisory floor overcommit")
                    if preference.budget == .custom { try verifyPerformance((plan.targetGB ?? 0) <= preference.customGB + 0.0001, "custom upper bound") }
                    plans += 1
                } catch {
                    try verifyPerformance(!error.localizedDescription.contains("CHECK FAILED"), error.localizedDescription)
                    refused += 1
                }
            }
        }
    }
    try verifyPerformance(plans > 0 && refused > 0, "sweep includes accepted and refused plans")
    let roomy = Machine.simulated(ramGB: 48, availableGB: 40)
    let admittedRange = try ModelPackRegistry.baseline.memoryRange(for: .init(mtp: .auto, vision: .off,
        maxContextTokens: PerformancePolicy.contextTokens), on: roomy)
    try verifyPerformance(PerformancePolicy.minimumGB == admittedRange.minimumGB &&
        PerformancePolicy.maximumGB(on: roomy) == admittedRange.maximumGB,
        "native control endpoints derive from the current pack and context ledger")
    let minimum = try PerformancePolicy.plan(.init(budget: .custom, customGB: admittedRange.minimumGB),
        on: roomy, mtpAvailable: false)
    try verifyPerformance(minimum.expectedPeakGB <= admittedRange.minimumGB, "displayed minimum admits the complete requested context")
    let frozenPackPlan = try PerformancePolicy.plan(.init(budget: .custom, customGB: 10),
        pack: ModelPackRegistry.baseline, on: roomy, mtpAvailable: false)
    try verifyPerformance(frozenPackPlan.targetGB == 10 && frozenPackPlan.memoryLimitGB == 10,
        "activation plans its frozen pack without selecting again")
    let ownedStartup = try ModelPackRegistry.baseline.startupPlan(customMemoryGB: 10, on: roomy)
    let ownedJSON = try JSONSerialization.data(withJSONObject: ownedStartup.json(), options: [.sortedKeys])
    let frozenJSON = try JSONSerialization.data(withJSONObject: frozenPackPlan.json(), options: [.sortedKeys])
    try verifyPerformance(ownedJSON == frozenJSON,
        "Desktop delegates its complete plan to the frozen pack's own recipe")
    try verifyPerformance(PerformancePolicy.contextTokens == ModelPackRegistry.baseline.startupDefaults.contextTokens &&
        PerformancePolicy.shortPromptTokens == ModelPackRegistry.baseline.startupDefaults.shortPromptTokens &&
        PerformancePolicy.shortPromptChunk == ModelPackRegistry.baseline.startupDefaults.shortPromptChunk,
        "legacy product constants project the original compiled recipe")
    let fast = try PerformancePolicy.plan(.init(), on: roomy, mtpAvailable: true)
    try verifyPerformance(fast.mtpEnabled && fast.decodeLookahead, "Desktop enables qualified automatic MTP and lookahead when they fit")
    try verifyPerformance(fast.targetGB == Planner.usefulCeilingGB && fast.memoryLimitGB == Planner.usefulCeilingGB,
        "automatic MTP charges the head inside the displayed total ceiling")
    let corrected = try PerformancePolicy.plan(.init(), on: roomy, mtpAvailable: true, decodeLookahead: .automaticCorrected(bytes: 40_000_000))
    try verifyPerformance(corrected.lookaheadReserveBytes > fast.lookaheadReserveBytes && corrected.slots < fast.slots
        && corrected.targetGB == fast.targetGB, "a shipped forecast correction is charged inside the same budget")
    let small = try PerformancePolicy.plan(.init(budget: .custom, customGB: 10), on: roomy, mtpAvailable: true)
    try verifyPerformance(!small.mtpEnabled, "a small budget retains ordinary decoding")
    let absent = try PerformancePolicy.plan(.init(), on: roomy, mtpAvailable: false)
    try verifyPerformance(!absent.mtpEnabled, "an absent optional draft head never blocks chat")
    let big = Machine.simulated(ramGB: 64 * 1.073741824, availableGB: 62)
    let custom = PerformancePreferences(budget: .custom, customGB: 48)
    let larger = try PerformancePolicy.plan(custom, on: big)
    try verifyPerformance(larger.targetGB == 48 && larger.memoryLimitGB == 48, "custom can exceed automatic default")
    try verifyPerformance(larger.slots > PerformancePolicy.plan(.init(), on: big).slots, "larger custom limit buys more cache")
    let first = PerformancePreferences().selectingBudget(.custom, currentGB: 33, maximumGB: PerformancePolicy.maximumGB(on: big))
    try verifyPerformance(first.customGB == 33, "first Custom keeps the current budget")
    let firstWithComponents = PerformancePreferences().selectingBudget(.custom, currentGB: 10, minimumGB: 12, maximumGB: 33)
    try verifyPerformance(firstWithComponents.customGB == 12, "first Custom respects the selected pack/component floor")
    let savedWithComponents = PerformancePreferences(budget: .custom, customGB: 10)
        .selectingBudget(.custom, currentGB: 14, minimumGB: 12, maximumGB: 33)
    try verifyPerformance(savedWithComponents.customGB == 10, "a saved value below a changed floor stays visible and unchanged")
    let returned = custom.selectingBudget(.automatic, currentGB: 20, maximumGB: 49.5)
        .selectingBudget(.custom, currentGB: 20, maximumGB: 49.5)
    try verifyPerformance(returned.customGB == 48, "returning to Custom preserves user's last limit")
    let moved = custom.selectingBudget(.automatic, currentGB: 10, maximumGB: 12)
        .selectingBudget(.custom, currentGB: 10, maximumGB: 12)
    try verifyPerformance(moved.customGB == 48, "moving to a smaller range does not overwrite a saved limit")
    let belowFloor = PerformancePreferences(budget: .custom, customGB: 7)
    try verifyPerformance(PerformancePreferences.restore(try JSONEncoder().encode(belowFloor)) == belowFloor,
        "a saved value below a new floor remains visible for correction")
    let autoRetained = belowFloor.selectingBudget(.automatic, currentGB: 10, maximumGB: 33)
    try PerformancePolicy.validate(autoRetained, on: roomy)
    try verifyPerformance(PerformancePolicy.ceilingGB(.init(), on: .simulated(ramGB: 16, availableGB: 15)) ==
        PerformancePolicy.ceilingGB(.init(), on: .simulated(ramGB: 16, availableGB: 3)), "busy startup does not lower the automatic ceiling")
    try verifyPerformance(PerformancePolicy.ceilingGB(.init(), on: .simulated(ramGB: 16, availableGB: 15)) <=
        PerformancePolicy.maximumGB(on: .simulated(ramGB: 16)), "automatic ceiling fits the stable hardware range")
    try verifyPerformance(PerformancePreferences.restore(try JSONEncoder().encode(custom)) == custom, "large limit survives restart")
    let legacy = PerformancePreferences.restore(Data("{\"budget\":\"automatic\",\"customGB\":10,\"readiness\":\"automatic\"}".utf8))
    try verifyPerformance(legacy.quantization == .automatic && legacy.liveMemory == .automatic,
        "old preferences gain independent automatic defaults")
    let explicit = PerformancePreferences(budget: .custom, customGB: 10,
        quantization: .pack(ModelPackRegistry.baseline.id), liveMemory: .fixed)
    try verifyPerformance(PerformancePreferences.restore(try JSONEncoder().encode(explicit)) == explicit,
        "all independent controls survive restart")
    let changedBudget = explicit.selectingBudget(.automatic, currentGB: 10, maximumGB: 33)
    try verifyPerformance(changedBudget.quantization == explicit.quantization && changedBudget.liveMemory == .fixed,
        "budget changes do not overwrite quantization or runtime adjustment")
    let removed = PerformancePreferences(quantization: .pack("removed-pack"))
    let restoredRemoved = PerformancePreferences.restore(try JSONEncoder().encode(removed))
    try verifyPerformance(restoredRemoved == removed, "an unavailable explicit pack stays saved")
    try PerformancePolicy.validateSaved(restoredRemoved)
    do {
        try PerformancePolicy.validate(restoredRemoved, on: roomy)
        throw SevraError.refused("CHECK FAILED: removed pack silently fell back")
    } catch { try verifyPerformance(!error.localizedDescription.contains("CHECK FAILED"), "unavailable pack blocks activation") }
    let recovering = LocalInference(preferences: removed)
    try await recovering.configure(.init())
    try verifyPerformance(recovering.performanceTelemetry?.isLoaded == false, "choosing Auto recovers an unavailable selection without loading")
    let fixedPlan = try PerformancePolicy.plan(explicit, on: roomy, mtpAvailable: false)
    let adaptivePlan = try PerformancePolicy.plan(.init(budget: .custom, customGB: 10), on: roomy, mtpAvailable: false)
    try verifyPerformance(fixedPlan.slots == adaptivePlan.slots && fixedPlan.memoryLimitGB == adaptivePlan.memoryLimitGB,
        "live adjustment choice does not change startup selection or ceiling")
    try verifyPerformance(legacy.selectingBudget(.custom, currentGB: 24, maximumGB: 33).customGB == 24, "old unused default adopts current budget")
    let savedLegacy = PerformancePreferences.restore(Data("{\"budget\":\"custom\",\"customGB\":10,\"readiness\":\"automatic\"}".utf8))
    try verifyPerformance(savedLegacy.selectingBudget(.custom, currentGB: 24, maximumGB: 33).customGB == 10, "old explicit custom budget retained")
    let machine = Machine.simulated(ramGB: 48, availableGB: 30)
    for invalid in [Double.nan, .infinity, -1, 0, 1, 1000] {
        do { _ = try PerformancePolicy.plan(.init(budget: .custom, customGB: invalid), on: machine); throw SevraError.refused("CHECK FAILED: invalid custom accepted") }
        catch { try verifyPerformance(!error.localizedDescription.contains("CHECK FAILED"), "invalid custom refused") }
    }
    for available: Double? in [nil, .nan, .infinity, -1] {
        do { _ = try PerformancePolicy.plan(.init(), on: .simulated(ramGB: 48, availableGB: available)); throw SevraError.refused("CHECK FAILED: unreadable availability accepted") }
        catch { try verifyPerformance(!error.localizedDescription.contains("CHECK FAILED"), "unreadable availability fails closed") }
    }
    try verifyPerformance(PerformancePolicy.maximumGB(on: machine) == PerformancePolicy.maximumGB(on: .simulated(ramGB: 48, availableGB: 3)), "slider hardware range does not move with other apps")
    let saved = PerformancePreferences(budget: .custom, customGB: 10, readiness: .keepReady)
    try verifyPerformance(PerformancePreferences.restore(try JSONEncoder().encode(saved)) == saved, "preferences round trip")
    for bad in [nil, Data(), Data("{\"budget\":\"future\"}".utf8)] as [Data?] {
        try verifyPerformance(PerformancePreferences.restore(bad) == .init(), "bad preferences recover to Automatic")
    }
    for cost in [0.0, 90, 300, 600, .infinity, .nan] {
        let delay = PerformancePolicy.idleDelay(preparationSeconds: cost, conservingPower: false)
        try verifyPerformance((600...1800).contains(delay), "idle delay bounded")
        try verifyPerformance(!PerformancePolicy.shouldRelease(idleSeconds: delay - 1, preparationSeconds: cost, preferences: .init(), pressure: false, conservingPower: false), "no premature idle release")
        try verifyPerformance(PerformancePolicy.shouldRelease(idleSeconds: delay, preparationSeconds: cost, preferences: .init(), pressure: false, conservingPower: false), "release at deadline")
        try verifyPerformance(!PerformancePolicy.shouldRelease(idleSeconds: delay + 1, preparationSeconds: cost, preferences: saved, pressure: false, conservingPower: false), "keep ready retained")
        try verifyPerformance(PerformancePolicy.shouldRelease(idleSeconds: 0, preparationSeconds: cost, preferences: saved, pressure: true, conservingPower: false), "pressure overrides keep ready")
        try verifyPerformance(!PerformancePolicy.shouldRelease(idleSeconds: delay + 1, preparationSeconds: cost, preferences: .init(), pressure: false, conservingPower: false, userPresent: true), "reading or composing in foreground keeps the model ready")
        try verifyPerformance(PerformancePolicy.shouldRelease(idleSeconds: delay + 1, preparationSeconds: cost, preferences: .init(), pressure: false, conservingPower: true, userPresent: true), "power saving still releases an idle foreground model")
        try verifyPerformance(PerformancePolicy.shouldRelease(idleSeconds: 0, preparationSeconds: cost, preferences: .init(), pressure: true, conservingPower: false, userPresent: true), "pressure overrides foreground readiness")
    }
    print("PASS: memory plans \(plans) accepted / \(refused) safely refused; custom ceilings, unavailable readings, persistence, stable ranges and idle/pressure policy")

    let probe = PerformanceProbe()
    let runtime = try SevraRuntime(homeURL: root.appendingPathComponent("performance-home"), dbmd: dbmd, inference: probe)
    try await runtime.saveDraft(threadID: "home", text: "Draft survives resource changes")
    _ = try await runtime.submit(threadID: "home", text: "A bounded question", nonce: "perf-1")
    try await eventually { await probe.calls == 1 }
    // The runtime checks a custom limit against the Mac it runs on. A Mac too
    // small for the 10 GB test limit, such as a CI runner, runs the same
    // coalescing and handoff with Automatic preferences.
    let budget: PerformancePreferences.Budget =
        (try? PerformancePolicy.validate(.init(budget: .custom, customGB: 10), on: .current())) != nil ? .custom : .automatic
    try await runtime.setPerformancePreferences(.init(budget: budget, customGB: 10))
    try await runtime.setPerformancePreferences(.init(budget: budget, customGB: 9))
    let earlyChanges = await probe.changes
    try verifyPerformance(earlyChanges.isEmpty, "budget change never interrupts current response")
    do { try await runtime.unload(); throw SevraError.refused("CHECK FAILED: released active model") }
    catch { try verifyPerformance(!error.localizedDescription.contains("CHECK FAILED"), "active release refused") }
    await probe.release()
    try await eventually { await probe.changes.last?.customGB == 9 }
    try verifyPerformance(await runtime.snapshot().home.threads[0].draft == "Draft survives resource changes", "resource changes retain draft")
    try await runtime.unload()
    try verifyPerformance(await probe.releases == 1, "explicit idle release")
    await probe.holdSettings(true)
    let changing = Task { try await runtime.setPerformancePreferences(.init(budget: budget, customGB: 10)) }
    try await eventually { await probe.configuring }
    _ = try await runtime.submit(threadID: "home", text: "Accepted while changing budget", nonce: "perf-2")
    try verifyPerformance(await probe.calls == 1, "new request waits for settings handoff")
    await probe.holdSettings(false); try await changing.value
    try await eventually { await runtime.snapshot().home.threads[0].run?.state == .completed }
    try verifyPerformance(await probe.calls == 2, "queued request starts after settings handoff")
    // An actual async configure failure must not admit the request accepted
    // during that transition against the old settings, even on a later tick.
    await probe.holdSettings(true); await probe.failSettings(true)
    let failing = Task { try await runtime.setPerformancePreferences(.init(budget: budget, customGB: 9)) }
    try await eventually { await probe.configuring }
    _ = try await runtime.submit(threadID: "home", text: "Wait for requested settings", nonce: "perf-3")
    await probe.holdSettings(false)
    do { try await failing.value; throw SevraError.refused("CHECK FAILED: injected settings failure succeeded") }
    catch { try verifyPerformance(!error.localizedDescription.contains("CHECK FAILED"), "configuration failure surfaced") }
    let failedAttempts = await probe.configurationAttempts
    await runtime.maintainPerformance()
    try verifyPerformance(await probe.calls == 2, "failed configuration cannot run queued work on the old settings")
    try verifyPerformance(await probe.configurationAttempts == failedAttempts, "a failed transition is not silently retried")
    try verifyPerformance(await runtime.snapshot().home.threads[0].run?.state == .queued, "failed activation preserves queued request")
    await probe.failSettings(false)
    try await runtime.setPerformancePreferences(.init(budget: budget, customGB: 10))
    try await eventually { await probe.calls == 3 }
    try await eventually { await runtime.snapshot().home.threads[0].run?.state == .completed }
    try verifyPerformance(await probe.calls == 3, "explicit corrected settings resume queued work exactly once")
    try await runtime.setPerformancePreferences(.init(budget: budget, customGB: 10), revision: 2)
    let orderedAttempts = await probe.configurationAttempts
    try await runtime.setPerformancePreferences(.init(budget: budget, customGB: 9), revision: 1)
    try await runtime.setPerformancePreferences(.init(budget: budget, customGB: 9), revision: 2)
    try verifyPerformance(await probe.configurationAttempts == orderedAttempts, "delayed and duplicate UI revisions cannot replace newer settings")
    // Incognito acceptance needs no disk wait, but must still be revalidated
    // after an asynchronous configuration handoff.
    await probe.holdSettings(true)
    let privateChange = Task { try await runtime.setPerformancePreferences(.init(budget: budget, customGB: 9)) }
    try await eventually { await probe.configuring }
    let privateID = try await runtime.newThread(mode: .incognito)
    _ = try await runtime.submit(threadID: privateID, text: "Close before settings finish", nonce: "perf-private")
    try await runtime.closeIncognito(threadID: privateID)
    await probe.holdSettings(false); try await privateChange.value
    try verifyPerformance(await probe.calls == 3, "closed Incognito request is not revived by settings completion")
    await probe.holdSettings(true); await probe.failNextSettings(1)
    let attemptsBeforeReturn = await probe.configurationAttempts
    let returning = Task { try await runtime.setPerformancePreferences(.init(budget: budget, customGB: 9)) }
    try await eventually { await probe.configuring }
    try await runtime.setPerformancePreferences(.init(budget: budget, customGB: 10))
    try await runtime.setPerformancePreferences(.init(budget: budget, customGB: 9))
    await probe.holdSettings(false); try await returning.value
    try verifyPerformance(await probe.configurationAttempts == attemptsBeforeReturn + 2,
        "returning to the same value has a new generation and supersedes an obsolete failed attempt")
    try verifyPerformance(await probe.changes.last?.customGB == 9, "latest return selection applies")
    try await runtime.shutdown()
    print("PASS: deferred budget coalescing, queued submission during handoff, active release refusal, idle release and draft preservation")

    // This probe certifies queue ownership only, not files or setup readiness.
    // The real LocalInference refuses the unchecked setup in activation checks.
    let setupProbe = PerformanceProbe()
    await setupProbe.release()
    let setupRuntime = try SevraRuntime(homeURL: root.appendingPathComponent("setup-performance-home"), dbmd: dbmd, inference: setupProbe)
    let setup = ModelSetup(model: root.appendingPathComponent("setup-probe-no-weights"))
    do { try await setupRuntime.acceptModelSetup(setup); throw SevraError.refused("CHECK FAILED: accepted setup outside maintenance") }
    catch { try verifyPerformance(!error.localizedDescription.contains("CHECK FAILED"), "setup acceptance requires stopped local work") }
    try verifyPerformance(await setupProbe.setupAcceptances == 0, "an invalid setup boundary never reaches inference")
    try await setupRuntime.beginModelMaintenance()
    try await setupRuntime.acceptModelSetup(setup)
    try verifyPerformance(await setupProbe.setupAcceptances == 1, "completed setup acceptance reaches its inference owner once")
    await setupProbe.holdSettings(true)
    await setupRuntime.endModelMaintenance()
    let submittingAfterSetup = Task { try await setupRuntime.submit(threadID: "home", text: "Use the accepted configuration", nonce: "setup-boundary") }
    try await eventually { await setupProbe.configuring }
    try verifyPerformance(await setupProbe.calls == 0, "queued work cannot use old settings after accepted setup")
    await setupProbe.holdSettings(false)
    _ = try await submittingAfterSetup.value
    try await eventually { await setupRuntime.snapshot().home.threads[0].run?.state == .completed }
    try verifyPerformance(await setupProbe.calls == 1, "work runs once after the accepted setup configuration applies")
    try await setupRuntime.shutdown()
    print("PASS: accepted setup remains inside maintenance and forces the next configuration boundary")

    let sleeper = PerformanceProbe()
    let sleepRuntime = try SevraRuntime(homeURL: root.appendingPathComponent("sleep-home"), dbmd: dbmd, inference: sleeper)
    _ = try await sleepRuntime.submit(threadID: "home", text: "Active work", nonce: "sleep-1")
    try await eventually { await sleeper.calls == 1 }
    let queued = try await sleepRuntime.newThread()
    _ = try await sleepRuntime.submit(threadID: queued, text: "Queued work", nonce: "sleep-2")
    try await sleepRuntime.prepareForSleep()
    let asleep = await sleepRuntime.snapshot()
    try verifyPerformance(asleep.home.threads[0].run?.state == .stopped && asleep.home.threads[1].run?.state == .interrupted, "sleep stops active and queued work")
    do { _ = try await sleepRuntime.submit(threadID: queued, text: "No asleep submission", nonce: "sleep-3"); throw SevraError.refused("CHECK FAILED: accepted asleep") }
    catch { try verifyPerformance(!error.localizedDescription.contains("CHECK FAILED"), "asleep admission refused") }
    await sleepRuntime.wake()
    try verifyPerformance(await sleeper.calls == 1, "wake never replays interrupted work")
    await sleeper.release()
    _ = try await sleepRuntime.submit(threadID: queued, text: "Explicit new request", nonce: "sleep-4")
    try await eventually { await sleepRuntime.snapshot().home.threads[1].run?.state == .completed }
    try await sleepRuntime.shutdown()
    print("PASS: sleep cancellation, queued interruption, unload, admission guard, wake without replay and explicit recovery")

    let contextProbe = PerformanceProbe()
    let contextRuntime = try SevraRuntime(homeURL: root.appendingPathComponent("context-home"), dbmd: dbmd, inference: contextProbe)
    let oversized = String(repeating: "x", count: 16001)
    _ = try await contextRuntime.submit(threadID: "home", text: oversized, nonce: "long-1")
    try await eventually { await contextRuntime.snapshot().home.threads[0].run?.state == .failed }
    try verifyPerformance(await contextProbe.calls == 0, "oversized history never silently disappears into model call")
    try verifyPerformance(await contextRuntime.snapshot().home.threads[0].messages.first?.text == oversized, "oversized input remains available")
    try await contextRuntime.shutdown()
    print("PASS: context overflow preserves messages and refuses instead of silently trimming history")
}

/// Explicit, bounded real-model check. No availability override or memory hog.
func realPerformanceCheckIfRequested() async throws -> Bool {
    if try await realActivationCheckIfRequested() { return true }
    guard CommandLine.arguments.contains("--performance-real") else { return false }
    let args = CommandLine.arguments
    guard let i = args.firstIndex(of: "--home"), i + 1 < args.count else { throw SevraError.refused("Pass a new disposable --home.") }
    let root = URL(fileURLWithPath: args[i + 1])
    guard !FileManager.default.fileExists(atPath: root.path), (Machine.current().availableGB ?? 0) >= 13 else {
        throw SevraError.refused("Requires a new Home and 13 GB real reclaimable memory.")
    }
    let dbmd = URL(fileURLWithPath: ProcessInfo.processInfo.environment["SEVRA_DBMD"] ?? NSHomeDirectory() + "/.dbmd/bin/dbmd")
    let preferences = PerformancePreferences(budget: .custom, customGB: 10)
    let inference = LocalInference(preferences: preferences)
    let runtime = try SevraRuntime(homeURL: root, dbmd: dbmd, inference: inference, performancePreferences: preferences)
    await runtime.maintainPerformance()
    try verifyPerformance(await runtime.snapshot().performance?.loaded == false, "lazy startup")
    let vmBefore = ProcessMemory.vmActivity()
    var maximumFootprint = 0.0, maximumMetadataSeconds = 0.0
    var generations: [UUID] = []
    func request(_ text: String, nonce: String, changeDuringResponse: Bool = false) async throws {
        _ = try await runtime.submit(threadID: "home", text: text, nonce: nonce)
        let start = ProcessInfo.processInfo.systemUptime
        var changed = false
        for _ in 0..<3000 {
            let tick = ProcessInfo.processInfo.systemUptime
            await runtime.maintainPerformance()
            let snapshot = await runtime.snapshot()
            maximumMetadataSeconds = max(maximumMetadataSeconds, ProcessInfo.processInfo.systemUptime - tick)
            maximumFootprint = max(maximumFootprint, Double(ProcessMemory.residentBytes()) / 1e9)
            if changeDuringResponse, !changed, snapshot.performance?.state == "In use" {
                try await runtime.setPerformancePreferences(.init(budget: .custom, customGB: 9, liveMemory: .fixed))
                try verifyPerformance(await runtime.snapshot().performance?.pending == true, "real change is pending during response")
                changed = true
            }
            if let run = snapshot.home.threads[0].run, run.state.terminal {
                try verifyPerformance(run.state == .completed, "real turn completed: " + run.status)
                guard let configuration = run.metrics?.configurations?.first else {
                    throw SevraError.refused("CHECK FAILED: response has no applied configuration")
                }
                try verifyPerformance(run.metrics?.configurations?.count == 1
                    && configuration.packID == ModelPackRegistry.baseline.id
                    && configuration.manifestDigest == ModelPackRegistry.baseline.manifestDigest
                    && configuration.identity.count == 64, "real response binds one authenticated pack and engine generation")
                generations.append(configuration.generation)
                let expectedLimit = nonce == "reloaded" ? 9.0 : 10.0
                try verifyPerformance(configuration.liveMemory == (nonce == "reloaded" ? .fixed : .automatic),
                    "live management applies only after the response and reload")
                try verifyPerformance(run.metrics?.memoryLimitGB == expectedLimit
                    && (run.metrics?.budgetGB ?? .infinity) <= expectedLimit,
                    "response records its active ceiling independently of a pending setting change")
                if changeDuringResponse { try verifyPerformance(changed, "observed active setting change") }
                print("REAL_TURN \(nonce) seconds=\(ProcessInfo.processInfo.systemUptime - start) status=\(run.state.rawValue)")
                fflush(stdout); return
            }
            try await Task.sleep(nanoseconds: 100_000_000)
        }
        throw SevraError.refused("CHECK FAILED: real turn timed out")
    }
    do {
        try await runtime.saveDraft(threadID: "home", text: "Resource QA draft")
        try await request("Reply with only OK.", nonce: "cold")
        try verifyPerformance(inference.performanceTelemetry?.isLoaded == true, "warm model retained")
        try await request("Count from 1 to 12. No explanation.", nonce: "warm-change", changeDuringResponse: true)
        try await eventually { inference.performanceTelemetry?.isLoaded == false }
        await runtime.maintainPerformance()
        try verifyPerformance(await runtime.snapshot().performance?.preferences.customGB == 9, "latest limit applied")
        try await request("Reply with only OK.", nonce: "reloaded")
        try verifyPerformance(generations.count == 3 && generations[0] == generations[1] && generations[2] != generations[1],
            "an in-flight response keeps its generation; reload creates a new generation")
        await runtime.maintainPerformance()
        try verifyPerformance((await runtime.snapshot().performance?.budgetGB ?? 100) <= 9.0001, "new live budget respects custom ceiling")
        do {
            try await runtime.setPerformancePreferences(.init(budget: .custom, customGB: 7))
            throw SevraError.refused("CHECK FAILED: unsupported setting applied")
        } catch { try verifyPerformance(!error.localizedDescription.contains("CHECK FAILED"), "unsupported saved setting refused") }
        try verifyPerformance(inference.performanceTelemetry?.isLoaded == true, "invalid request preserves loaded configuration until release")
        let idleStart = ProcessInfo.processInfo.systemUptime
        await runtime.maintainPerformance(now: idleStart + 3601, userPresent: true)
        try verifyPerformance(inference.performanceTelemetry?.isLoaded == true, "foreground reading retains the real model")
        await runtime.maintainPerformance(now: idleStart + 3602)
        try verifyPerformance(inference.performanceTelemetry?.isLoaded == true, "leaving foreground starts a fresh idle interval")
        await runtime.maintainPerformance(now: idleStart + 7201)
        try verifyPerformance(inference.performanceTelemetry?.isLoaded == false, "failed settings do not prevent real automatic idle release")
        try verifyPerformance(await runtime.snapshot().performance?.preferences.customGB == 7,
            "idle release does not overwrite the failed saved choice")
        try verifyPerformance(await runtime.snapshot().home.threads[0].draft == "Resource QA draft", "draft survives real reloads")
        try await runtime.shutdown()
        try await Task.sleep(nanoseconds: 500_000_000)
        let vmAfter = ProcessMemory.vmActivity()
        print("REAL_MEMORY peak_sampled_gb=\(maximumFootprint) released_gb=\(Double(ProcessMemory.residentBytes()) / 1e9) maximum_metadata_seconds=\(maximumMetadataSeconds)")
        print("GLOBAL_VM before=\(String(describing: vmBefore)) after=\(String(describing: vmAfter))")
        try verifyPerformance(maximumFootprint <= 13, "bounded real process footprint")
        try verifyPerformance(maximumMetadataSeconds < 1, "metadata stays responsive during generation")
        print("PASS: real lazy load, warm follow-up, deferred custom change, drained release/reload, lower ceiling, automatic idle release and preserved draft")
    } catch {
        try? await runtime.shutdown(); throw error
    }
    return true
}
