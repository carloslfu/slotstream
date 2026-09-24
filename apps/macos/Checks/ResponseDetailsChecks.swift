import Foundation
import SevraRuntime
import Slotstream

/// Response details: each run records what the response cost from the
/// engine's own numbers, summed over the job's model rounds with a refused
/// round included; thinking reads as one receipt with one note per round;
/// live speed is observable while the model writes; and nothing recorded
/// carries conversation or thought text.
func responseDetailsChecks(root: URL, dbmd: URL) async throws {
    // Arithmetic and wording from exact numbers.
    var first = ResponseMetrics()
    first.answerTokens = 100; first.answerSeconds = 10; first.thoughtTokens = 50; first.thoughtSeconds = 5
    first.readTokens = 400; first.readSeconds = 2; first.cachedTokens = 3000; first.contextTokens = 3400; first.windowTokens = 32768
    first.firstTokenSeconds = 2.5; first.loadSeconds = 18.2; first.rounds = 1; first.expertHitRate = 0.9; first.budgetGB = 9; first.customBudget = true
    first.memoryLimitGB = 48
    var second = ResponseMetrics()
    second.answerTokens = 150; second.answerSeconds = 10; second.readTokens = 600; second.readSeconds = 3; second.cachedTokens = 3400
    second.contextTokens = 4100; second.windowTokens = 32768; second.firstTokenSeconds = 1; second.rounds = 1; second.expertHitRate = 0.6
    let total = first.adding(second)
    try require(total.answerTokens == 250 && total.answerSeconds == 20 && total.thoughtTokens == 50 && total.readTokens == 1000 && total.readSeconds == 5, "rounds add their tokens and times")
    try require(total.cachedTokens == 3000 && total.contextTokens == 4100 && total.firstTokenSeconds == 2.5 && total.loadSeconds == 18.2 && total.rounds == 2, "the first round keeps its start and cache; the largest prompt is the context")
    try require(abs((total.expertHitRate ?? 0) - 0.75) < 1e-9 && total.budgetGB == 9 && total.customBudget == true, "the hit rate is weighted by the tokens each round wrote")
    try require(ResponseMetrics().adding(second) == second, "adding a round to nothing is that round")
    let line = ResponseMetricsFormat.line(total)
    try require(line == "12.5 tok/s · 250 tokens · 2.5 s to first token · model loaded in 18 s", "the line under a reply: \(line ?? "none")")
    try require(ResponseMetricsFormat.line(ResponseMetrics()) == nil, "no line without numbers")
    let report = ResponseMetricsFormat.report(total, thinking: nil)
    try require(report.contains("Writing: 250 tokens in 20 s, 12.5 tok/s") && report.contains("Expert cache hits while writing: 75%") && report.contains("Memory budget: about 9.0 GB, within your 48.0 GB limit") && ResponseMetricsFormat.budgetText(20.14, custom: false) == "about 20.1 GB, automatic", "copied details state every number:\n\(report)")
    try require(total.memoryLimitGB == 48, "multiple rounds preserve the saved ceiling separately from the current budget")
    var recovered = second; recovered.budgetGB = 20; recovered.customBudget = true; recovered.memoryLimitGB = 48
    let afterRecovery = total.adding(recovered)
    try require(afterRecovery.budgetGB == 20 && afterRecovery.memoryLimitGB == 48, "recovery changes the budget, not the saved ceiling")
    var automatic = recovered; automatic.customBudget = false; automatic.memoryLimitGB = nil
    try require(afterRecovery.adding(automatic).memoryLimitGB == nil, "an automatic round cannot inherit a stale custom ceiling")
    let encodedMetrics = try JSONEncoder().encode(total)
    let decoded = try JSONDecoder().decode(ResponseMetrics.self, from: encodedMetrics)
    try require(decoded == total, "saved response ceiling survives restart")
    var legacyMetrics = try JSONSerialization.jsonObject(with: encodedMetrics) as! [String: Any]
    legacyMetrics.removeValue(forKey: "memoryLimitGB")
    let restored = try JSONDecoder().decode(ResponseMetrics.self, from: JSONSerialization.data(withJSONObject: legacyMetrics))
    try require(restored.memoryLimitGB == nil && !ResponseMetricsFormat.report(restored, thinking: nil).contains("your limit"), "older responses do not invent a saved ceiling")

    let closed = ThinkingReceipt(level: "low", budgetTokens: 768, tokens: 40, seconds: 7.6, ending: .closed)
    let merged = closed.merged(with: ThinkingReceipt(level: "low", budgetTokens: 768, tokens: 20, seconds: 4.4, ending: .closed))
    try require(merged.tokens == 60 && merged.seconds == 12 && merged.steps == 2, "two thoughts add up")
    try require(merged.summary == "Thought for 12 s over 2 steps" && merged.line == "Thought for 12 s over 2 steps before answering.", "a job's thinking reads as one: \(merged.line)")
    try require(closed.summary == "Thought for 8 s" && ThinkingReceipt(level: "low", budgetTokens: 768, tokens: 9, seconds: 3, ending: .answerNow).summary == "Thought for 3 s, then answered when you asked", "one thought keeps the familiar wording")
    let flowing = ThinkingPolicy.preview("First **idea**\n\n- a `step`   next")
    try require(flowing == "First idea - a step next", "the preview flows as plain text: \(flowing)")
    let tail = ThinkingPolicy.preview(String(repeating: "word ", count: 400) + "final thought", limit: 60)
    try require(tail.hasPrefix("…") && tail.hasSuffix("final thought") && tail.count <= 61 && !tail.dropFirst().hasPrefix(" "), "a long thought shows its end from a word boundary: \(tail)")
    print("PASS: response numbers add up across rounds, the reply line and copied details state them, receipts merge, the thought preview flows")

    // A thinking job with a refused round: exact per-round numbers add up,
    // and every round's thought is kept as its own step.
    let canary = "DETAIL-CANARY-7731"
    let source = root.appendingPathComponent("details-sources")
    try FileManager.default.createDirectory(at: source, withIntermediateDirectories: true)
    try Data("The launch date is October 12.\n".utf8).write(to: source.appendingPathComponent("notes.md"))
    func exact(_ tokens: Int, _ seconds: Double, context: Int) -> ResponseMetrics {
        var m = ResponseMetrics(); m.answerTokens = tokens; m.answerSeconds = seconds; m.contextTokens = context; m.rounds = 1; m.firstTokenSeconds = 1; return m
    }
    let engine = ScriptedInference(turns: [
        EngineTurn(text: "", calls: [ProposedTool(name: "source.read", arguments: ["id": .string("a1:notes.md")]), ProposedTool(name: "source.list", arguments: ["limit": .int(1)])], metrics: exact(30, 3, context: 900)),
        EngineTurn(text: "", calls: [ProposedTool(name: "source.read", arguments: ["id": .string("a1:notes.md")])], metrics: exact(20, 2, context: 1000)),
        EngineTurn(text: "The launch is October 12.", metrics: exact(10, 1, context: 1400)),
    ], thinkingTraces: [canary + " first look", canary + " second look", canary + " final look"])
    let home = root.appendingPathComponent("details")
    var runtime: SevraRuntime? = try SevraRuntime(homeURL: home, dbmd: dbmd, inference: engine)
    let thread = try await runtime!.newThread(title: "Details")
    try await runtime!.setThinking(threadID: thread, enabled: true)
    try await runtime!.attach(threadID: thread, folder: source)
    let jobRun = try await runtime!.submit(threadID: thread, text: "When is the launch?", nonce: "details-job")
    let job = try await terminal(runtime!, thread)
    let expected = exact(30, 3, context: 900).adding(exact(20, 2, context: 1000)).adding(exact(10, 1, context: 1400))
    try require(job.run?.state == .completed && job.run?.metrics == expected && expected.rounds == 3 && expected.answerTokens == 60, "a job's numbers are the sum of its rounds, the refused one included")
    let steps = await runtime!.snapshot().thinkingTraces[jobRun] ?? []
    try require(job.run?.thinking?.steps == 3 && steps.count == 3 && steps.allSatisfy { $0.contains(canary) }, "each round's thought is its own step, the refused round's too")
    try await runtime!.detach(threadID: thread)
    try await runtime!.shutdown(); runtime = nil
    let saved = try HomeStore(root: home, dbmd: dbmd).load().threads.first { $0.id == thread }
    try require(saved?.run?.metrics == expected && saved?.run?.thinking?.steps == 3, "numbers and the merged receipt persist with the run")
    let encoded = try JSONSerialization.jsonObject(with: JSONEncoder().encode(expected)) as? [String: Any] ?? [:]
    try require(!encoded.isEmpty && encoded.values.allSatisfy { $0 is NSNumber }, "recorded numbers carry no text")
    try inspectCanaryFiles(home, canary: canary)
    // A run recorded before numbers and steps existed still decodes, as one step with no numbers.
    var legacy = try JSONSerialization.jsonObject(with: JSONEncoder().encode(job.run!)) as? [String: Any] ?? [:]
    legacy["metrics"] = nil
    if var receipt = legacy["thinking"] as? [String: Any] { receipt["steps"] = nil; legacy["thinking"] = receipt }
    let old = try JSONDecoder().decode(Run.self, from: JSONSerialization.data(withJSONObject: legacy))
    try require(legacy["thinking"] != nil && old.metrics == nil && old.thinking?.steps == nil && old.thinking?.tokens == job.run?.thinking?.tokens && old.thinking?.line.contains("steps") == false, "a run recorded before numbers and steps decodes as one step with no numbers")

    // Live speed while a delayed engine thinks and then writes.
    let reply = String(repeating: "steady ", count: 40)
    let live = ScriptedInference(turns: [EngineTurn(text: reply)], delayNanoseconds: 2_000_000, thinkingTraces: [canary + String(repeating: " pondering", count: 40)])
    let liveRuntime = try SevraRuntime(homeURL: root.appendingPathComponent("details-live"), dbmd: dbmd, inference: live)
    let liveThread = try await liveRuntime.newThread(title: "Live")
    try await liveRuntime.setThinking(threadID: liveThread, enabled: true)
    let liveRun = try await liveRuntime.submit(threadID: liveThread, text: "Say something steady.", nonce: "details-live")
    var thinkingRate = false, answerRate = false
    for _ in 0..<4000 {
        let s = await liveRuntime.snapshot()
        if let g = s.generation, g.runID == liveRun, g.threadID == liveThread, g.rate != nil {
            if g.thinking { thinkingRate = true } else { answerRate = true }
        }
        if s.home.threads.first(where: { $0.id == liveThread })?.run?.state.terminal == true { break }
        try await Task.sleep(nanoseconds: 1_000_000)
    }
    let finished = await liveRuntime.snapshot()
    let liveMetrics = finished.home.threads.first { $0.id == liveThread }?.run?.metrics
    try require(thinkingRate && answerRate && finished.generation == nil, "live speed is observable for the thought and the reply, and ends with the run")
    try require(liveMetrics?.answerTokens == reply.count && liveMetrics?.thoughtTokens == 41 && liveMetrics?.answerRate != nil && liveMetrics?.firstTokenSeconds != nil && liveMetrics?.rounds == 1, "a plain run records its own numbers")
    try await liveRuntime.shutdown()

    // Working notes stay for the eight most recent runs; the ninth drops the oldest.
    let many = ScriptedInference(turns: (0..<9).map { EngineTurn(text: "Answer \($0).") }, thinkingTraces: (0..<9).map { canary + " note \($0)" })
    let manyRuntime = try SevraRuntime(homeURL: root.appendingPathComponent("details-many"), dbmd: dbmd, inference: many)
    let manyThread = try await manyRuntime.newThread(title: "Many")
    try await manyRuntime.setThinking(threadID: manyThread, enabled: true)
    var runs: [String] = []
    for i in 0..<9 {
        runs.append(try await manyRuntime.submit(threadID: manyThread, text: "Question \(i)", nonce: "many-\(i)"))
        _ = try await terminal(manyRuntime, manyThread)
    }
    let kept = await manyRuntime.snapshot().thinkingTraces
    try require(kept[runs[0]] == nil && kept.count == 8 && runs.dropFirst().enumerated().allSatisfy { kept[$0.element] == [canary + " note \($0.offset + 1) "] }, "working notes stay for the eight most recent runs")
    try await manyRuntime.shutdown()
    print("PASS: a thinking job records exact per-round numbers, a refused round counts, thoughts keep one step per round, numbers persist without text, older runs still decode, live speed while thinking and writing, notes for the eight most recent runs")
}
