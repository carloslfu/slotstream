import Foundation
import SevraRuntime
import Slotstream

/// Real model, 10 GB plan: the numbers a run records are the engine's own.
/// A thinking turn that loads the model, a second thinking turn that reuses
/// the conversation's state, and a plain turn after switching thinking off,
/// in one thread. Each run's numbers are compared field by field with the
/// engine's statistics for exactly its requests. Prints one JSON receipt.
///
/// The engine resumes a request only at its own prefill pass boundaries, so
/// the opening message crosses the first boundary in either Desktop schedule.
/// A shorter conversation is
/// read again in full every turn, and no reuse would be recorded to compare.
func realMetricsCheckIfRequested() async throws -> Bool {
    guard CommandLine.arguments.contains("--real-metrics") else { return false }
    let args = CommandLine.arguments
    func option(_ name: String) -> String? { guard let i = args.firstIndex(of: name), i + 1 < args.count else { return nil }; return args[i + 1] }
    guard let destination = option("--home") else { throw SevraError.refused("A real metrics check requires a new --home directory.") }
    let home = URL(fileURLWithPath: destination).standardizedFileURL
    guard !FileManager.default.fileExists(atPath: home.path) else { throw SevraError.refused("Real checks require a new disposable Home.") }
    let dbmd = URL(fileURLWithPath: ProcessInfo.processInfo.environment["SEVRA_DBMD"] ?? NSHomeDirectory() + "/.dbmd/bin/dbmd")
    let budget = try realCheckBudget()
    guard (Machine.current().availableGB ?? 0) >= budget + 3 else { throw SevraError.refused("The real check requires the selected plan plus at least 3 GB headroom.") }
    let engine = LocalInference(memoryGB: budget)
    var runtime: SevraRuntime? = try SevraRuntime(homeURL: home, dbmd: dbmd, inference: engine)
    let thread = try await runtime!.newThread(title: "Metrics")
    var phases: [[String: Any]] = []

    func finish(_ runID: String) async throws -> Run {
        var previous = ""
        for _ in 0..<1200 {
            let s = await runtime!.snapshot()
            guard let t = s.home.threads.first(where: { $0.id == thread }), let run = t.run, run.id == runID else { throw SevraError.unavailable("run vanished") }
            if run.status != previous, !run.status.hasPrefix("Thinking") { print(run.status); fflush(stdout); previous = run.status }
            if run.state.terminal { return run }
            try await Task.sleep(nanoseconds: 500_000_000)
        }
        throw SevraError.refused("CHECK FAILED: run did not finish")
    }
    func near(_ a: Double, _ b: Double) -> Bool { abs(a - b) <= 1e-9 * max(1, abs(b)) }
    /// The run's numbers against the engine's statistics for its requests.
    func compare(_ phase: String, _ run: Run, thought: Bool) async throws {
        let stats = await engine.lastStats
        guard let m = run.metrics else { throw SevraError.refused("CHECK FAILED: \(phase) recorded no numbers") }
        try require(stats.count == (thought ? 2 : 1), "\(phase): one engine request per phase")
        let answer = stats[stats.count - 1], first = stats[0]
        let thoughtStats = thought ? stats[0] : nil
        try require(m.answerTokens == answer.decodeTokens && near(m.answerSeconds, answer.decodeSeconds), "\(phase): reply tokens and time are the engine's")
        try require(m.thoughtTokens == (thoughtStats?.decodeTokens ?? 0) && near(m.thoughtSeconds, thoughtStats?.decodeSeconds ?? 0), "\(phase): thought tokens and time are the engine's")
        try require(m.readTokens == stats.reduce(0) { $0 + $1.prefillTokens } && near(m.readSeconds, stats.reduce(0) { $0 + $1.prefillSeconds }), "\(phase): reading is the engine's prefill")
        try require(m.cachedTokens == first.reusedPrefixTokens && m.contextTokens == stats.map(\.promptTokens).max(), "\(phase): cache reuse and context size are the engine's")
        try require(m.rounds == 1 && m.windowTokens > 0 && m.budgetGB.map { $0 <= budget } == true && m.memoryLimitGB == budget && m.customBudget == true, "\(phase): current budget stays within the separately recorded limit")
        if args.contains("--mtp-profile-gb"), thought {
            try require(stats.reduce(0) { $0 + $1.draftedTokens } > 0, "\(phase): MTP actually drafts in the phased app turn")
        }
        try require(m.firstTokenSeconds.map { $0 > 0 && $0 < 600 } == true, "\(phase): first token time is measured")
        let written = stats.reduce(0) { $0 + $1.decodeTokens }
        let weighted = written > 0 ? stats.reduce(0.0) { $0 + $1.expertHitRate * Double($1.decodeTokens) } / Double(written) : nil
        try require(weighted.map { abs(($0) - (m.expertHitRate ?? -1)) < 1e-9 } ?? (m.expertHitRate == nil), "\(phase): expert hit rate is the engine's, weighted by tokens")
        var entry: [String: Any] = [
            "phase": phase, "state": run.state.rawValue, "line": ResponseMetricsFormat.line(m) ?? "",
            "answer_tokens": m.answerTokens, "answer_seconds": m.answerSeconds, "answer_tok_s": m.answerRate ?? 0,
            "engine_answer_decode_tps": answer.decodeTPS, "thought_tokens": m.thoughtTokens, "thought_seconds": m.thoughtSeconds,
            "read_tokens": m.readTokens, "read_seconds": m.readSeconds, "cached_tokens": m.cachedTokens, "context_tokens": m.contextTokens,
            "window_tokens": m.windowTokens, "first_token_seconds": m.firstTokenSeconds ?? -1, "load_seconds": m.loadSeconds ?? -1,
            "expert_hit_rate": m.expertHitRate ?? -1, "budget_gb": m.budgetGB ?? -1, "report": ResponseMetricsFormat.report(m, thinking: run.thinking)]
        if let r = run.thinking { entry["thinking"] = ["tokens": r.tokens, "seconds": r.seconds, "ending": r.ending.rawValue, "summary": r.summary] }
        // The engine's own view of each request, for the evidence record.
        entry["engine_requests"] = stats.map { s -> [String: Any] in
            ["prompt_tokens": s.promptTokens, "prefill_tokens": s.prefillTokens, "reused_prefix_tokens": s.reusedPrefixTokens,
             "prefill_seconds": s.prefillSeconds, "decode_tokens": s.decodeTokens, "decode_seconds": s.decodeSeconds, "decode_tps": s.decodeTPS,
             "first_token_seconds": s.firstTokenSeconds ?? -1, "aligned_resume_refusals": s.alignedResumeRefusals, "finish_reason": s.finishReason,
             "expert_hit_rate": s.expertHitRate, "drafted_tokens": s.draftedTokens, "accepted_drafts": s.acceptedDrafts]
        }
        phases.append(entry)
        print(String(decoding: try JSONSerialization.data(withJSONObject: entry, options: [.sortedKeys, .prettyPrinted]), as: UTF8.self)); fflush(stdout)
    }

    // A thinking turn loads the model, so its load time is recorded apart.
    try await runtime!.setThinking(threadID: thread, enabled: true)
    await runtime!.setThinkingOverride(ThinkingRequest(level: ThinkingPolicy.level, budgetTokens: Int(option("--budget") ?? "") ?? 96, replyTokens: ThinkingPolicy.replyTokens, seed: 5))
    let log = "I keep a small bakery's weekly production log and want one number checked before I share it with the team. Monday: 17 trays of rolls, 23 rolls on each tray. Tuesday: 12 trays of rolls, 24 rolls on each tray. Wednesday: 9 trays of croissants, 18 on each tray. Thursday: 14 trays of muffins, 12 on each tray. Friday: 20 trays of rolls, 23 on each tray. Saturday: 11 trays of bagels, 16 on each tray. Sunday: closed for cleaning. The log counts only full trays, and every tray on a given day holds the same number of items. The team plans flour orders from these counts, so the number has to be exact. How many rolls were baked on Monday? Think it through, then answer in one sentence."
    let ledger = (1...48).map { "Ledger entry \($0) has been checked." }.joined(separator: " ")
    let a = try await runtime!.submit(threadID: thread, text: ledger + " " + log, nonce: "real-metrics-think")
    let aRun = try await finish(a)
    try require(aRun.state == .completed, "the thinking turn completes: " + aRun.status)
    try await compare("thinking_turn", aRun, thought: true)
    try require(aRun.metrics?.loadSeconds.map { $0 > 0 } == true, "the first turn records the model load it waited for")
    let opening = await engine.lastStats.first?.promptTokens ?? 0
    try require(opening > 512, "the opening prompt passes the first pass boundary with room to spare: \(opening) tokens")
    // A second thought with the switch unchanged reuses the loaded model and
    // the conversation's state up to the first pass boundary the two prompts share.
    let b = try await runtime!.submit(threadID: thread, text: "And how many rolls on Tuesday? One sentence.", nonce: "real-metrics-think-again")
    let bRun = try await finish(b)
    try require(bRun.state == .completed, "the second thinking turn completes: " + bRun.status)
    try await compare("second_thinking_turn", bRun, thought: true)
    try require(bRun.metrics?.loadSeconds == nil, "a loaded model is not counted again")
    try require((bRun.metrics?.cachedTokens ?? 0) >= 256, "the second turn resumes the conversation from a pass boundary instead of reading it again")
    // A plain turn after switching thinking off. The switch changes the system
    // instructions, so this turn reads the conversation again, by contract.
    try await runtime!.setThinking(threadID: thread, enabled: false)
    await runtime!.setThinkingOverride(nil)
    let c = try await runtime!.submit(threadID: thread, text: "Now reply with the single word thanks.", nonce: "real-metrics-plain")
    let cRun = try await finish(c)
    try require(cRun.state == .completed, "the plain turn completes: " + cRun.status)
    try await compare("plain_turn_after_switch", cRun, thought: false)
    try require(cRun.metrics?.loadSeconds == nil && cRun.thinking == nil, "the plain turn records no load and no thought")
    try await runtime!.shutdown(); runtime = nil
    let saved = try HomeStore(root: home, dbmd: dbmd).load().threads.first { $0.id == thread }
    try require(saved?.allRuns.compactMap(\.metrics).count == 3, "every run's numbers persist")
    print(String(decoding: try JSONSerialization.data(withJSONObject: ["phases": phases, "model_plan_gb": budget], options: [.sortedKeys, .prettyPrinted]), as: UTF8.self))
    print("PASS: real recorded numbers equal the engine's for a thinking turn with model load, a second thinking turn with conversation reuse and a plain turn after switching")
    return true
}
