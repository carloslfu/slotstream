import Foundation
import SevraRuntime
import Slotstream

func realCheckIfRequested() async throws -> Bool {
    guard CommandLine.arguments.contains("--real") else { return false }
    let args = CommandLine.arguments
    func option(_ name: String) -> String? { guard let i = args.firstIndex(of: name), i + 1 < args.count else { return nil }; return args[i + 1] }
    guard let source = option("--source"), let destination = option("--home") else { throw SevraError.refused("A real check requires explicit --source and a new --home directory.") }
    let home = URL(fileURLWithPath: destination).standardizedFileURL
    guard !FileManager.default.fileExists(atPath: home.path) else { throw SevraError.refused("Real checks require a new disposable Home.") }
    let dbmd = URL(fileURLWithPath: ProcessInfo.processInfo.environment["SEVRA_DBMD"] ?? NSHomeDirectory() + "/.dbmd/bin/dbmd")
    let machine = Machine.current()
    let budget = try realCheckBudget()
    guard (machine.availableGB ?? 0) >= budget + 3 else { throw SevraError.refused("The real check requires the selected plan plus at least 3 GB headroom.") }
    var runtime: SevraRuntime? = try SevraRuntime(homeURL: home, dbmd: dbmd, inference: LocalInference(memoryGB: budget))
    try await runtime!.attach(threadID: "home", folder: URL(fileURLWithPath: source))
    let prompt = "Read both Cedar pilot documents in the attached folder. Use your source tools, then propose cedar-briefing.md with a short cited briefing: launch date, owners, budget, prerequisites and main risk. Keep it under 150 words."
    let runID = try await runtime!.submit(threadID: "home", text: prompt, nonce: "real-workspace-brief")
    var thread: WorkThread?
    var previous = ""
    for _ in 0..<660 {
        let snapshot = await runtime!.snapshot()
        thread = snapshot.home.threads[0]
        let status = thread?.run?.status ?? ""
        if status != previous { print(status); fflush(stdout); previous = status }
        if thread?.run?.state == .needsYou || thread?.run?.state.terminal == true { break }
        try await Task.sleep(nanoseconds: 1_000_000_000)
    }
    guard let current = thread, current.run?.state == .needsYou, let proposal = current.run?.proposal else {
        try? await runtime?.shutdown(); throw SevraError.refused("Real workflow did not reach review: " + (thread?.run?.status ?? "timeout"))
    }
    let receipt: [String: Any] = ["run_id": runID, "phase": "needsYou", "prompt": prompt, "content": proposal.content, "proposal_digest": proposal.digest,
                                 "trace": current.run?.trace ?? [], "citations": proposal.citations.map { ["id": $0.id, "path": $0.path, "source_sha256": $0.hash, "start": $0.start, "length": $0.length, "excerpt": $0.content ?? ""] as [String: Any] },
                                 "artifact_exists_before_approval": FileManager.default.fileExists(atPath: home.appendingPathComponent("artifacts/cedar-briefing.md").path)]
    print(String(decoding: try JSONSerialization.data(withJSONObject: receipt, options: [.sortedKeys, .prettyPrinted]), as: UTF8.self)); fflush(stdout)
    let content = proposal.content.lowercased()
    let rubric = ["october 12", "maya", "leo", "400", "keyboard", "rollback", "interrupt"]
    for term in rubric { try require(content.contains(term), "real briefing includes " + term) }
    try require(proposal.content.split(whereSeparator: { $0.isWhitespace }).count <= 150, "real briefing respects the word budget")
    try require(Set(proposal.citations.map(\.path)).count == 2 && proposal.citations.allSatisfy { $0.content != nil }, "real briefing cites retained excerpts from both sources")
    try require(!FileManager.default.fileExists(atPath: home.appendingPathComponent("artifacts/cedar-briefing.md").path), "real model cannot commit its proposal")
    // The harness acts as the reviewer for this synthetic fixture, after the
    // complete proposal has been captured and the frozen rubric checked.
    let saved = try await runtime!.approve(threadID: "home", proposalID: proposal.id, digest: proposal.digest)
    let data = try Data(contentsOf: URL(fileURLWithPath: saved))
    try require(data == Data(proposal.content.utf8), "real approved artifact matches reviewed bytes")
    try await runtime!.shutdown(); runtime = nil
    let reopened = try HomeStore(root: home, dbmd: dbmd)
    let restored = try reopened.load()
    try require(restored.threads[0].run?.artifact == "artifacts/cedar-briefing.md" && restored.threads[0].run?.state == .completed, "real artifact and thread recover together")
    print("PASS: real local model, typed source loop, frozen Cedar rubric, exact reviewed commit and reopened durable Home")
    print("artifact_sha256=" + digestBytes(data))
    return true
}

/// Real model, bounded budgets: a forced close still answers, Answer now ends
/// a thought early, a thought may close on its own, and a later plain turn
/// continues the same thread. Prints one JSON receipt for the evidence record.
func realThinkingCheckIfRequested() async throws -> Bool {
    guard CommandLine.arguments.contains("--real-thinking") else { return false }
    let args = CommandLine.arguments
    func option(_ name: String) -> String? { guard let i = args.firstIndex(of: name), i + 1 < args.count else { return nil }; return args[i + 1] }
    guard let destination = option("--home") else { throw SevraError.refused("A real thinking check requires a new --home directory.") }
    let home = URL(fileURLWithPath: destination).standardizedFileURL
    guard !FileManager.default.fileExists(atPath: home.path) else { throw SevraError.refused("Real checks require a new disposable Home.") }
    let dbmd = URL(fileURLWithPath: ProcessInfo.processInfo.environment["SEVRA_DBMD"] ?? NSHomeDirectory() + "/.dbmd/bin/dbmd")
    let machine = Machine.current()
    let budget = try realCheckBudget()
    guard (machine.availableGB ?? 0) >= budget + 3 else { throw SevraError.refused("The real check requires the selected plan plus at least 3 GB headroom.") }
    let forcedBudget = Int(option("--budget") ?? "") ?? 96
    let answerAfter = Double(option("--answer-after") ?? "") ?? 8
    var runtime: SevraRuntime? = try SevraRuntime(homeURL: home, dbmd: dbmd, inference: LocalInference(memoryGB: budget))
    let thread = try await runtime!.newThread(title: "Thinking")
    try await runtime!.setThinking(threadID: thread, enabled: true)
    var receipts: [[String: Any]] = []
    func watch(_ runID: String, answerNowAfter: Double? = nil) async throws -> WorkThread {
        var previous = ""
        var requested = false
        let started = Date()
        for _ in 0..<1800 {
            let s = await runtime!.snapshot()
            guard let t = s.home.threads.first(where: { $0.id == thread }) else { throw SevraError.unavailable("thread vanished") }
            let status = t.run?.status ?? ""
            if status != previous, !status.hasPrefix("Thinking"), !status.hasPrefix("Finishing") { print(status); fflush(stdout); previous = status }
            if let after = answerNowAfter, !requested, let live = s.thinking, live.runID == runID, live.active, live.seconds >= after {
                try await runtime!.answerNow(threadID: thread); requested = true
                print("answer now requested after \(String(format: "%.1f", live.seconds)) s and \(live.text.utf8.count) bytes of thought"); fflush(stdout)
            }
            if t.run?.id == runID, t.run?.state.terminal == true { return t }
            try await Task.sleep(nanoseconds: 500_000_000)
        }
        throw SevraError.refused("CHECK FAILED: run did not finish within \(Int(Date().timeIntervalSince(started))) s")
    }
    func record(_ phase: String, _ t: WorkThread, _ live: String?) {
        let run = t.run!
        let answer = t.messages.last { $0.role == "assistant" && $0.runID == run.id }?.text ?? ""
        var entry: [String: Any] = ["phase": phase, "state": run.state.rawValue, "status": run.status, "answer_chars": answer.utf8.count, "answer_preview": String(answer.prefix(240))]
        if let r = run.thinking { entry["thinking"] = ["level": r.level, "budget_tokens": r.budgetTokens, "tokens": r.tokens, "seconds": r.seconds, "ending": r.ending.rawValue] }
        if let live { entry["thought_chars"] = live.utf8.count; entry["thought_preview"] = String(live.prefix(240)) }
        receipts.append(entry)
        print(String(decoding: try! JSONSerialization.data(withJSONObject: entry, options: [.sortedKeys, .prettyPrinted]), as: UTF8.self)); fflush(stdout)
    }
    // Phase A: a budget too small to finish reasoning must still yield an answer.
    await runtime!.setThinkingOverride(ThinkingRequest(level: ThinkingPolicy.level, budgetTokens: forcedBudget, replyTokens: ThinkingPolicy.replyTokens, seed: 7))
    let a = try await runtime!.submit(threadID: thread, text: "A train leaves at 9:40 and the trip takes 2 hours and 35 minutes. What time does it arrive? Work it out step by step, then give the arrival time in one sentence.", nonce: "real-think-budget")
    let aResult = try await watch(a)
    let aTrace = await runtime!.snapshot().thinkingTraces[a]?.joined(separator: "\n\n")
    record("forced_close", aResult, aTrace)
    try require(aResult.run?.state == .completed, "forced close completes: " + (aResult.run?.status ?? ""))
    try require(aResult.run?.thinking?.ending == .budget && (aResult.run?.thinking?.tokens ?? 0) <= forcedBudget, "budget ended the thought within its bound")
    try require((aResult.messages.last?.text.utf8.count ?? 0) > 0 && (aResult.messages.last?.text.contains("12:15") ?? false), "forced-close answer is present and correct")
    // Phase B: Answer now ends a long thought and the answer follows.
    await runtime!.setThinkingOverride(ThinkingRequest(level: ThinkingPolicy.level, budgetTokens: 4096, replyTokens: ThinkingPolicy.replyTokens, seed: 11))
    let b = try await runtime!.submit(threadID: thread, text: "Plan a three-day walking trip through a hilly region for two people, with distances, rest days and what could go wrong. Think it through carefully before answering, then keep the answer under 150 words.", nonce: "real-think-answer-now")
    let bResult = try await watch(b, answerNowAfter: answerAfter)
    let bTrace = await runtime!.snapshot().thinkingTraces[b]?.joined(separator: "\n\n")
    record("answer_now", bResult, bTrace)
    try require(bResult.run?.state == .completed && bResult.run?.thinking?.ending == .answerNow, "answer now ended the thought and the run completed")
    try require((bResult.messages.last?.text.utf8.count ?? 0) > 0, "answer now still produced an answer")
    // Phase C: the app's own budget; the thought may close on its own.
    await runtime!.setThinkingOverride(nil)
    let c = try await runtime!.submit(threadID: thread, text: "What is 12 times 12? Answer with the number only.", nonce: "real-think-natural")
    let cResult = try await watch(c)
    let cTrace = await runtime!.snapshot().thinkingTraces[c]?.joined(separator: "\n\n")
    record("app_budget", cResult, cTrace)
    try require(cResult.run?.state == .completed && cResult.run?.thinking != nil && (cResult.messages.last?.text.contains("144") ?? false), "app-budget thought answers correctly")
    // Phase D: thinking off again in the same thread, continuing after thought turns.
    try await runtime!.setThinking(threadID: thread, enabled: false)
    let d = try await runtime!.submit(threadID: thread, text: "Reply with the single word hello.", nonce: "real-think-off")
    let dResult = try await watch(d)
    record("thinking_off", dResult, nil)
    try require(dResult.run?.state == .completed && dResult.run?.thinking == nil && (dResult.messages.last?.text.lowercased().contains("hello") ?? false), "a plain turn follows thought turns in the same thread")
    try await runtime!.shutdown(); runtime = nil
    let reopened = try HomeStore(root: home, dbmd: dbmd).load()
    let saved = reopened.threads.first { $0.id == thread }
    try require(saved?.allRuns.filter { $0.thinking != nil }.count == 3, "three receipts persisted, no thought text")
    for trace in [aTrace, bTrace, cTrace].compactMap({ $0 }) {
        let probe = String(trace.split(separator: " ").prefix(12).joined(separator: " "))
        if probe.utf8.count >= 24 { try inspectCanaryFiles(home, canary: probe) }
    }
    print(String(decoding: try JSONSerialization.data(withJSONObject: ["phases": receipts, "forced_budget_tokens": forcedBudget, "answer_now_after_seconds": answerAfter], options: [.sortedKeys, .prettyPrinted]), as: UTF8.self))
    print("PASS: real thinking forced close, answer now, app budget, plain follow-up, persisted receipts without thought text")
    return true
}
