// Does continuing a conversation compute what starting it fresh computes?
//
// `prefix-check` proves reuse is bounded and deterministic, and deliberately
// accepts that a resumed state is not bit-identical to a cold rebuild: it
// counts the replies that differ and prints the number without asserting on
// it. That acceptance was wrong. The engine's arithmetic depends on how tokens
// were grouped into passes and on whether each one was read or generated, and
// on 2026-09-17 the difference crossed a token: an agent turn whose fresh read
// scored `>` at 0.9576 and `]` at 0.0421 picked `]` through the cache, and the
// tool call it wrote arrived malformed.
//
// This check asserts the property that makes that impossible — the same ids
// and the same raw prompt logits, to the bit, whether the turn resumed a
// retained state or read its whole prompt — and that reuse still happens, so
// the property is not bought by disabling the cache.

import ArgumentParser
import Foundation
import Slotstream

struct PrefixExactCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "prefix-exact-check",
        abstract: "Prove a continued conversation computes exactly what a cold one does")
    @OptionGroup var model: ModelOptions
    @Option(help: "Slots to run with (small keeps the check cheap; the property is size-independent)")
    var slots: Int = Geometry.floorSlots
    @Option var maxTokens: Int = 24
    @Flag(help: "Run a real memory plan instead of bare slots, so --mtp and --memory-gb apply")
    var plan = false

    /// Long enough that turn one crosses several pass boundaries, which is
    /// the only way a later turn can resume anything at all.
    static let inventory = (1 ... 90)
        .map { "Crate \($0) holds \($0 * 3) bolts and ships on day \($0 % 7 + 1)." }
        .joined(separator: " ")
    static let turns = [
        "Here is the inventory.\n\n\(inventory)\n\nHow many bolts are in crate 37? Answer with just the number.",
        "And crate 12? Just the number.",
        "Which of those two crates ships earlier? One short sentence.",
    ]
    static let short = [
        "Name one planet. Answer with just the name.",
        "Is it bigger than Earth? Answer yes or no.",
        "Why? One short sentence.",
    ]

    struct Turn {
        var ids: [Int]
        var text: String
        var promptTokens: Int
        var reused: Int
        var logits: [Float]
        var stats: GenStats
    }

    func run() throws {
        if model.memoryLimitGB != nil && !plan {
            throw ValidationError("--memory-limit-gb requires --plan for this diagnostic")
        }
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let tokens = maxTokens, poolSlots = slots
        // A plan is what turns on speculative decoding, which puts the draft
        // head's cache inside every retained state and so inside the rule.
        let planned = plan ? try model.announcedPlan() : nil
        Task {
            do {
                let engine: Engine
                if let planned {
                    engine = try await Engine(modelDir: model.modelURL, plan: planned)
                } else {
                    engine = try await Engine(modelDir: model.modelURL, poolSlots: poolSlots)
                }
                var p = SampleParams.greedy
                p.maxTokens = tokens
                var failures: [String] = []
                var notes: [String] = []
                func note(_ s: String) {
                    notes.append(s)
                    FileHandle.standardError.write((s + "\n").data(using: .utf8)!)
                }
                let chunk = engine.generator.prefillChunk
                note("  pass size \(chunk) tokens, "
                    + "aligned resume \(engine.model.optimizations.resumesOnPassBoundaries ? "on" : "OFF")")

                var captured: [Float] = []
                engine.generator.promptLogitsObserver = { captured = $0 }
                func ask(_ history: [ChatMessage]) throws -> Turn {
                    captured = []
                    let ids = try engine.encodeChat(history, thinking: false)
                    let r = engine.generate(promptIds: ids, params: p)
                    if let error = r.stats.runtimeError { throw ModelError(error) }
                    return Turn(ids: r.ids, text: r.text, promptTokens: ids.count,
                        reused: r.stats.reusedPrefixTokens, logits: captured, stats: r.stats)
                }
                func conversation(_ script: [String], cached: Bool, edit: String? = nil) throws -> [Turn] {
                    engine.prefixCache.drop()
                    engine.prefixCache.enabled = cached
                    engine.prefixCache.resetStats()
                    var history: [ChatMessage] = []
                    var out: [Turn] = []
                    for (i, q) in script.enumerated() {
                        history.append(ChatMessage(role: "user", content: (i == 0 && edit != nil) ? edit! : q))
                        let turn = try ask(history)
                        history.append(ChatMessage(role: "assistant", content: turn.text))
                        out.append(turn)
                    }
                    return out
                }

                /// The whole point: same ids, and the same raw logits the
                /// prompt ends on, to the bit. A relative figure is printed so
                /// a failure says how far apart they are, not only that they
                /// are, but nothing below it is accepted.
                func identical(_ label: String, _ cold: [Turn], _ warm: [Turn]) {
                    for (i, (a, b)) in zip(cold, warm).enumerated() {
                        if a.ids != b.ids {
                            failures.append("\(label) turn \(i + 1): a resumed turn produced different tokens\n"
                                + "    cold: \(a.text.replacingOccurrences(of: "\n", with: " ").prefix(72))\n"
                                + "    warm: \(b.text.replacingOccurrences(of: "\n", with: " ").prefix(72))")
                        }
                        guard !a.logits.isEmpty, a.logits.count == b.logits.count else {
                            failures.append("\(label) turn \(i + 1): prompt logits were not observed")
                            continue
                        }
                        var worst: Float = 0
                        for (x, y) in zip(a.logits, b.logits) { worst = max(worst, abs(x - y)) }
                        let spread = max((a.logits.max() ?? 1) - (a.logits.min() ?? 0), 1e-6)
                        if worst != 0 {
                            failures.append(String(format:
                                "%@ turn %d: resumed prompt logits differ from a cold read by %.4f%% of their "
                                    + "spread; a continued conversation must compute the same sums",
                                label, i + 1, Double(worst / spread) * 100))
                        }
                        note(String(format: "  %@ turn %d: %d prompt tok, reused %d, logit delta %.6f%%",
                            label, i + 1, b.promptTokens, b.reused, Double(worst / spread) * 100))
                    }
                }

                // ---- 1. A long conversation, cold and continued.
                let cold = try conversation(Self.turns, cached: false)
                let warm = try conversation(Self.turns, cached: true)
                guard let first = cold.first, first.promptTokens > 2 * chunk else {
                    throw ModelError("the check's own prompt must cross at least two pass boundaries")
                }
                identical("long", cold, warm)
                if cold.contains(where: { $0.reused != 0 }) {
                    failures.append("a run with the cache off reused a state")
                }
                let reusing = warm.dropFirst().filter { $0.reused > 0 }.count
                if reusing == 0 {
                    failures.append("no turn resumed anything: exactness here would be vacuous")
                }
                // The snapshot each turn leaves has to be there for the next
                // one, or a long conversation re-reads more of itself every
                // turn even though the rule is satisfied.
                for i in 1 ..< warm.count where engine.model.optimizations.resumesOnPassBoundaries {
                    let deepest = PrefillSchedule.resumeBoundaries(tokens: warm[i - 1].promptTokens,
                        maxChunk: chunk, tailAware: engine.model.optimizations.tailAwarePrefill).max() ?? 0
                    if warm[i].reused < deepest {
                        failures.append("long turn \(i + 1) resumed at \(warm[i].reused) although turn \(i) "
                            + "reached \(deepest): the snapshot it left was not kept")
                    }
                }
                for (i, (a, b)) in zip(cold, warm).enumerated() {
                    note(String(format: "  long turn %d prefill: %.2fs cold, %.2fs continued (%d of %d tokens read)",
                        i + 1, a.stats.prefillSeconds, b.stats.prefillSeconds,
                        b.promptTokens - b.reused, b.promptTokens))
                }
                // Every resume is at a boundary of that turn's own prefill,
                // or is the whole prompt again with its retained logits.
                for (i, turn) in warm.enumerated() where turn.reused > 0 {
                    let boundaries = PrefillSchedule.resumeBoundaries(tokens: turn.promptTokens,
                        maxChunk: chunk, tailAware: engine.model.optimizations.tailAwarePrefill)
                    let exact = turn.reused == turn.promptTokens && turn.stats.completePromptHits > 0
                    if engine.model.optimizations.resumesOnPassBoundaries,
                       !boundaries.contains(turn.reused), !exact {
                        failures.append("long turn \(i + 1) resumed at \(turn.reused), which is not one of "
                            + "its own pass boundaries \(boundaries.sorted().suffix(4))")
                    }
                }

                // ---- 2. The same prompt again: the complete prompt and its
                //         retained logits, with no prefill at all.
                let repeatCold = try conversation([Self.turns[0]], cached: false)
                engine.prefixCache.enabled = true
                engine.prefixCache.resetStats()
                let repeatWarmFirst = try ask([ChatMessage(role: "user", content: Self.turns[0])])
                let repeatWarm = try ask([ChatMessage(role: "user", content: Self.turns[0])])
                identical("repeat", repeatCold, [repeatWarm])
                if repeatWarm.reused != repeatWarm.promptTokens || repeatWarm.stats.completePromptHits == 0 {
                    failures.append("an identical prompt did not reuse its own complete state "
                        + "(reused \(repeatWarm.reused) of \(repeatWarm.promptTokens))")
                }
                if repeatWarmFirst.ids != repeatWarm.ids {
                    failures.append("the same prompt answered differently on its second run")
                }

                // ---- 3. A conversation too short to have a boundary. Nothing
                //         is resumable; the answers must still be the cold ones.
                identical("short", try conversation(Self.short, cached: false),
                          try conversation(Self.short, cached: true))

                // ---- 4. A history edited before the first boundary cannot be
                //         continued at all, and must rebuild rather than
                //         resume a state built from other ids.
                let edited = try conversation([Self.turns[0]], cached: true,
                    edit: Self.turns[0].replacingOccurrences(of: "crate 37", with: "crate 38"))
                if edited.first?.reused != 0 {
                    failures.append("an edited history resumed \(edited.first?.reused ?? -1) tokens of a state "
                        + "built from different ids")
                }

                // ---- 5. A different conversation over the same long prefix:
                //         the boundary checkpoint is exactly what an agent
                //         reuses turn after turn, and it must be exact too.
                let sharedQuestion = Self.turns[0].replacingOccurrences(
                    of: "How many bolts are in crate 37? Answer with just the number.",
                    with: "How many bolts are in crate 5? Answer with just the number.")
                let sharedCold = try conversation([sharedQuestion], cached: false)
                engine.prefixCache.drop()
                engine.prefixCache.enabled = true
                engine.prefixCache.resetStats()
                _ = try ask([ChatMessage(role: "user", content: Self.turns[0])])
                let sharedWarm = try ask([ChatMessage(role: "user", content: sharedQuestion)])
                identical("shared prefix", sharedCold, [sharedWarm])
                if engine.model.optimizations.resumesOnPassBoundaries, sharedWarm.reused == 0 {
                    failures.append("a second conversation over the same long prefix resumed nothing")
                }

                if failures.isEmpty {
                    print("PREFIX EXACT CHECK PASS: every continued turn produced the same tokens and the "
                        + "same prompt logits as a cold read, \(reusing) of \(warm.count - 1) follow-up turns "
                        + "resumed a boundary state, an identical prompt reused its complete state, an edited "
                        + "history rebuilt, and a second conversation resumed the shared prefix")
                } else {
                    print("PREFIX EXACT CHECK FAIL")
                    for f in failures { print("  - \(f)") }
                    throw ExitCode(2)
                }
            } catch {
                result = .failure(error)
            }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}
