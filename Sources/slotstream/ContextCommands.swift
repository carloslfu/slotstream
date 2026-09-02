// context-check: measure what a long prompt really costs on this Mac.
// prefill-schedule: the pass ladder and the wait it implies, no weights needed.

import ArgumentParser
import Foundation
import SlotstreamCore

// MARK: prefill-schedule

struct PrefillScheduleCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "prefill-schedule",
        abstract: "Print the prefill passes a prompt runs and the wait they imply (no weights needed)")
    @Option(help: "Largest pass the plan allows (the `prefill:` line of the banner)")
    var chunk: Int = 4096
    @Option(help: "Prompt length in tokens") var tokens: Int = ContextPolicy.maxTokens
    @Option(help: "Tokens already held by the state (a prefix-cache hit)") var from: Int = 0
    @Flag(name: .customLong("json"), help: "Machine-readable output") var asJSON = false

    func validate() throws {
        guard chunk >= 1, chunk <= 65_536 else { throw ValidationError("--chunk must be between 1 and 65536") }
        guard tokens >= 1 else { throw ValidationError("--tokens must be at least 1") }
        guard from >= 0 else { throw ValidationError("--from must not be negative") }
    }

    func run() throws {
        let passes = PrefillSchedule.passes(tokens: tokens, from: from, maxChunk: chunk)
        let secs = PrefillSchedule.estSeconds(tokens: tokens, from: from, maxChunk: chunk)
        if asJSON {
            let d: [String: Any] = [
                "chunk": chunk, "tokens": tokens, "from": from,
                "passes": passes, "pass_count": passes.count,
                "est_seconds": secs,
                "measured_query_key_product": PrefillSchedule.measuredQueryKeyProduct,
                "min_chunk": PrefillSchedule.minChunk,
            ]
            let data = try JSONSerialization.data(withJSONObject: d, options: [.prettyPrinted, .sortedKeys])
            print(String(decoding: data, as: UTF8.self))
            return
        }
        // Collapse the ladder into runs: "4096 x1, 2048 x5, ..."
        var runs: [(Int, Int)] = []
        for p in passes {
            if let last = runs.last, last.0 == p { runs[runs.count - 1].1 += 1 } else { runs.append((p, 1)) }
        }
        print("reading \(tokens) tokens from position \(from) with a \(chunk)-token pass:")
        print("  passes: " + runs.map { "\($0.0) x\($0.1)" }.joined(separator: ", ")
            + " (\(passes.count) passes)")
        print("  wait:   ~\(PrefillSchedule.describe(seconds: secs)) before the first token "
            + "(measured per-pass rates, see MEASUREMENTS.md)")
        print("  rule:   pass x context stays under \(PrefillSchedule.measuredQueryKeyProduct) "
            + "(4096 x 8016, the largest measured), never below \(PrefillSchedule.minChunk)")
    }
}

// MARK: context-check

/// Reads a synthetic prompt of N tokens through the real engine and reports
/// what it cost: seconds, tok/s, and the process RSS high-water against the
/// plan's expected peak. It watches reclaimable memory between passes and
/// stops before the machine swaps; it writes nothing, so a number it prints
/// becomes a MEASUREMENTS.md entry by a person, not by the tool.
struct ContextCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "context-check",
        abstract: "Measure what reading an N-token prompt costs on this Mac: time, tok/s, peak memory, and whether it stayed inside the plan")
    @OptionGroup var model: ModelOptions
    @Option(help: "Prompt length in tokens (rungs double from 2048 up to here with --ladder)")
    var tokens: Int = 8192
    @Flag(help: "Run 2048, 4096, ... up to --tokens, stopping at the first rung that leaves the plan")
    var ladder = false
    @Option(name: .customLong("min-free-gb"),
            help: "Abort a pass when reclaimable memory falls below this (default: the planner's slack, 5% of RAM, at least 1.5 GB)")
    var minFreeGB: Double?
    @Flag(name: .customLong("json"), help: "Machine-readable output, one object per rung") var asJSON = false

    func validate() throws {
        guard tokens >= 16 else { throw ValidationError("--tokens must be at least 16") }
        guard tokens <= ContextPolicy.maxTokens * 8 else {
            throw ValidationError("--tokens is capped at \(ContextPolicy.maxTokens * 8) for one check")
        }
        if let m = minFreeGB, !(m.isFinite && m >= 0) {
            throw ValidationError("--min-free-gb must be a finite number >= 0")
        }
    }

    /// A deterministic filler that tokenizes densely and never repeats a
    /// sentence within the window, so the n-gram store cannot short-cut it.
    static func filler(tokens n: Int, tokenizer: (String) -> [Int]) -> [Int] {
        var text = "Context check. "
        var i = 0
        while true {
            text += "Record \(i): the sensor on line \(i % 97) reported \(37 + (i * 31) % 500) units at "
                + "\(i % 24):\(String(format: "%02d", (i * 7) % 60)), and technician \((i * 13) % 1000) filed note \(i). "
            i += 1
            if i % 50 == 0 {
                let ids = tokenizer(text)
                if ids.count >= n { return Array(ids.prefix(n)) }
            }
        }
    }

    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let target = tokens
        let ladder = self.ladder
        let asJSON = self.asJSON
        let minFree = minFreeGB
        let plan = try model.announcedPlan()
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                // A check must not reuse state between rungs, or the second
                // rung measures a prefix hit instead of a cold read.
                engine.prefixCache.enabled = false
                engine.prefixCache.drop()
                // Room for the rung plus its one-token reply. This is the
                // measurement seam, not a served limit: `serve` still validates
                // --max-context against the ceiling.
                engine.maxContextTokens = target + 16
                var rungs: [Int] = []
                if ladder {
                    var r = 2048
                    while r < target { rungs.append(r); r *= 2 }
                }
                rungs.append(target)
                let slack = minFree ?? Planner.availabilitySlackGB(ramGB: plan.ramGB)
                let all = Self.filler(tokens: rungs.max()!) { engine.tokenizer.encode(text: $0) }
                let progress = PrefillProgressReporter(
                    quietBelowTokens: 2048, maxChunk: engine.generator.prefillChunk) { line in
                    if !asJSON { FileHandle.standardError.write("  \(line)\n".data(using: .utf8)!) }
                }
                engine.generator.onPrefillProgress = progress.report
                var fitsSoFar = true
                for n in rungs {
                    let ids = Array(all.prefix(n))
                    var aborted: String?
                    var params = SampleParams.greedy
                    params.maxTokens = 1
                    let (_, _, stats) = engine.generate(
                        promptIds: ids, params: params,
                        shouldContinue: {
                            // The guard: stop before the machine pays in swap.
                            if let a = Planner.deviceAvailableGB(), a < slack {
                                aborted = String(format: "reclaimable memory fell to %.1f GB (floor %.1f)", a, slack)
                                return false
                            }
                            return true
                        })
                    engine.dropPrefixCache()
                    let peak = stats.peakMemoryGB
                    let fits = aborted == nil && peak <= plan.expectedPeakGB
                    let verdict: String
                    if let a = aborted {
                        verdict = "ABORTED at \(stats.prefillTokens) tokens: \(a)"
                    } else if fits {
                        verdict = "OK"
                    } else {
                        verdict = String(format: "OVER the plan by %.1f GB", peak - plan.expectedPeakGB)
                    }
                    if asJSON {
                        let d: [String: Any] = [
                            "tokens": n, "prefill_tokens": stats.prefillTokens,
                            "prefill_seconds": stats.prefillSeconds, "prefill_tok_s": stats.prefillTPS,
                            "peak_rss_gb": peak, "plan_expected_peak_gb": plan.expectedPeakGB,
                            "prefill_chunk": engine.generator.prefillChunk,
                            "passes": PrefillSchedule.passes(tokens: n, maxChunk: engine.generator.prefillChunk),
                            "fits": fits, "aborted": aborted ?? NSNull(),
                        ]
                        let data = try JSONSerialization.data(withJSONObject: d, options: [.sortedKeys])
                        print(String(decoding: data, as: UTF8.self))
                    } else {
                        print(String(
                            format: "context-check %6d tokens: %@ in %@ (%.0f tok/s), peak RSS %.1f GB vs plan %.1f GB — %@",
                            n, aborted == nil ? "read" : "stopped",
                            PrefillSchedule.describe(seconds: stats.prefillSeconds), stats.prefillTPS,
                            peak, plan.expectedPeakGB, verdict))
                    }
                    if !fits {
                        fitsSoFar = false
                        break
                    }
                }
                if !asJSON {
                    let cap = ContextPolicy.maxTokens
                    if fitsSoFar, target <= cap {
                        print("verdict: \(target) tokens stay inside the plan on this Mac; the ceiling is \(cap) "
                            + "(prompt + reply), so no flag is needed.")
                    } else if fitsSoFar {
                        print("verdict: \(target) tokens stayed inside the plan on this Mac. The ceiling is still "
                            + "\(cap) until this measurement is recorded in MEASUREMENTS.md and the planner "
                            + "charges the extra state (Context.swift explains the two steps).")
                    } else {
                        print("verdict: the plan does not cover this prompt length here; lower --tokens, raise "
                            + "--memory-gb if the machine has room, or close other apps and retry.")
                    }
                }
                result = .success(())
            } catch {
                result = .failure(error)
            }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}
