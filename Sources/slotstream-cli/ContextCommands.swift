// context-check: measure what a long prompt really costs on this Mac.
// prefill-schedule: the pass ladder and the wait it implies, no weights needed.

import ArgumentParser
import Foundation
import Slotstream

// MARK: prefill-schedule

struct PrefillScheduleCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "prefill-schedule",
        abstract: "Print the prefill passes a prompt runs and the wait they imply (no weights needed)")
    @Option(help: "Largest pass the plan allows (the `prefill:` line of the banner)")
    var chunk: Int = 4096
    @Option(help: "Prompt length in tokens") var tokens: Int = ContextPolicy.defaultTokens
    @Option(help: "Tokens already held by the state (a prefix-cache hit)") var from: Int = 0
    @Flag(name: .customLong("json"), help: "Machine-readable output") var asJSON = false

    func validate() throws {
        guard chunk >= 1, chunk <= 65_536 else { throw ValidationError("--chunk must be between 1 and 65536") }
        guard tokens >= 1 else { throw ValidationError("--tokens must be at least 1") }
        guard from >= 0, from <= ContextPolicy.modelLimit,
              tokens <= ContextPolicy.modelLimit - from else {
            throw ValidationError("--from plus --tokens must fit the pinned model limit of \(ContextPolicy.modelLimit)")
        }
    }

    func run() throws {
        let tailAware = try InferenceOptimizations.environment().tailAwarePrefill
        let compute = PrefillSchedule.computePasses(tokens: tokens, from: from, maxChunk: chunk, tailAware: tailAware)
        let passes = compute.map(\.tokens)
        let secs = PrefillSchedule.estSeconds(tokens: tokens, from: from, maxChunk: chunk, tailAware: tailAware)
        if asJSON {
            let d: [String: Any] = [
                "chunk": chunk, "tokens": tokens, "from": from,
                "passes": passes, "pass_count": passes.count, "tail_aware": tailAware,
                "compute_query_rows": compute.map(\.queryRows), "compute_key_extents": compute.map(\.keyExtent),
                "est_seconds": secs.isFinite ? secs as Any : NSNull(),
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
            + "(4096 x 8016, the largest measured), including masked columns and padded query rows; "
            + "full late passes can shrink to \(PrefillSchedule.minChunk), with shorter terminal tails")
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
    @Option(help: "Required output tokens, reserved before loading") var replyTokens: Int = 16
    @Option(help: "Accepted request to first token budget in minutes; 0 disables only time")
    var maxPrefillWait = 30.0
    @Option(help: "Independent wall-clock ceiling for each diagnostic rung") var wallSeconds = 7200.0
    @Flag(help: "Compatibility flag; context qualification always samples physical footprint every 20 ms")
    var sampleFootprint = false
    @Flag(help: "Run 2048, 4096, ... up to --tokens, stopping at the first rung that leaves the plan")
    var ladder = false
    @Flag(help: "Print the unqualified plan and exact runtime controls without loading an Engine")
    var planOnly = false
    @Option(help: "Retain this many distinct conversations and interleave follow-ups before the capacity request (0...4)")
    var warmConversations = 0
    @Option(help: "Prompt tokens in each retained warm-up conversation") var warmTokens = 2048
    @Option(name: .customLong("min-free-gb"),
            help: "Abort a pass when reclaimable memory falls below this (default: the planner's slack, 5% of RAM, at least 1.5 GB)")
    var minFreeGB: Double?
    @Flag(name: .customLong("json"), help: "Machine-readable output, one object per rung") var asJSON = false

    func validate() throws {
        guard tokens >= 16 else { throw ValidationError("--tokens must be at least 16") }
        guard replyTokens > 0, replyTokens < ContextPolicy.modelLimit,
              tokens <= ContextPolicy.modelLimit - replyTokens else {
            throw ValidationError("--tokens plus --reply-tokens must fit the model limit of \(ContextPolicy.modelLimit)")
        }
        _ = try ContextConfiguration(maxContextTokens: tokens + replyTokens,
            maxPrefillWaitMinutes: maxPrefillWait, qualification: true)
        guard wallSeconds.isFinite, wallSeconds > 0, wallSeconds <= 86_400 else {
            throw ValidationError("--wall-seconds must be finite, positive and at most 86400")
        }
        if let m = minFreeGB, !(m.isFinite && m >= 0) {
            throw ValidationError("--min-free-gb must be a finite number >= 0")
        }
        guard (0...PrefixCache.maxEntries).contains(warmConversations), warmTokens >= 16,
              warmTokens <= ContextPolicy.modelLimit - 4 else {
            throw ValidationError("--warm-conversations must be 0...4 and --warm-tokens must fit the model window with four tokens of follow-up room")
        }
        if warmConversations > 0 {
            guard !ladder, warmTokens <= tokens + replyTokens - 4 else {
                throw ValidationError("retained-context qualification requires one rung and warm-up plus follow-up room inside its configured window")
            }
        }
    }

    /// A deterministic filler that tokenizes densely and never repeats a
    /// sentence within the window, so the n-gram store cannot short-cut it.
    static func filler(tokens n: Int, conversation: Int = 0, tokenizer: (String) -> [Int]) -> [Int] {
        var text = conversation == 0 ? "Context check. " : "Context check conversation \(conversation). "
        var i = 0
        var nextCheck = 50
        while true {
            text += "Record \(i): the sensor on line \(i % 97) reported \(37 + (i * 31) % 500) units at "
                + "\(i % 24):\(String(format: "%02d", (i * 7) % 60)), and technician \((i * 13) % 1000) filed note \(i). "
            i += 1
            if i == nextCheck {
                let ids = tokenizer(text)
                if ids.count >= n { return Array(ids.prefix(n)) }
                nextCheck *= 2
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
        let plan = try model.announcedPlan(maxContext: target + replyTokens,
            prefixCacheEnabled: warmConversations > 0, maxPrefillWait: maxPrefillWait, qualification: true)
        if planOnly {
            let output: [String: Any] = [
                "kind": "unqualified-context-plan", "qualified": false,
                "plan": plan.json(), "model_revision": PinnedModel.revision,
                "warm_conversations": warmConversations, "warm_tokens": warmTokens,
                "optimizations": try JSONSerialization.jsonObject(
                    with: JSONEncoder().encode(InferenceOptimizations.environment())),
            ]
            print(String(decoding: try JSONSerialization.data(withJSONObject: output, options: [.sortedKeys]), as: UTF8.self))
            return
        }
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                // Missing observations must never compare equal and turn
                // an unobserved memory/swap interval into a passing result.
                engine.generator.footprintSampling = true
                // Cold rungs have no retained state. The separate retained
                // diagnostic deliberately fills and reuses four real states.
                engine.prefixCache.enabled = warmConversations > 0
                engine.prefixCache.drop()
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
                    FileHandle.standardError.write("  \(line)\n".data(using: .utf8)!)
                }
                progress.tailAware = engine.model.optimizations.tailAwarePrefill
                engine.generator.onPrefillProgress = progress.report
                let retainedStarted = RuntimeClock.now()
                var warmup: [[String: Any]] = []
                var warmupFailure: String?
                var warmInputs: [[Int]] = []
                var warmOutputs: [[Int]] = []
                if warmConversations > 0 {
                    for conversation in 1...warmConversations {
                        warmInputs.append(Self.filler(tokens: warmTokens, conversation: conversation) {
                            engine.tokenizer.encode(text: $0)
                        })
                    }
                    // Complete all first turns before revisiting each client;
                    // this proves interleaving rather than immediate reuse.
                    for phase in 0...1 {
                        for (index, initial) in warmInputs.enumerated() {
                            var ids = initial
                            var expectedReuse = 0
                            if phase == 1 {
                                guard let retained = engine.prefixCache.peek(extending: Array(initial.dropLast())),
                                      retained.starts(with: initial) else {
                                    warmupFailure = "warm conversation \(index) was evicted before its interleaved follow-up"
                                    break
                                }
                                expectedReuse = retained.count
                                ids = initial + warmOutputs[index] + [1000 + index]
                                guard ids.starts(with: retained) else {
                                    warmupFailure = "retained state differs from the conversation's actual completed delivery"
                                    break
                                }
                            }
                            var params = SampleParams.greedy; params.maxTokens = 1
                            let control = try engine.beginRequest()
                            let delivery = engine.generate(promptIds: ids, params: params, shouldContinue: {
                                if RuntimeClock.seconds(since: retainedStarted) >= wallSeconds {
                                    warmupFailure = "retained diagnostic wall-clock ceiling exceeded"
                                    control.cancel(); return false
                                }
                                if let available = Planner.deviceAvailableGB(), available < slack {
                                    warmupFailure = "warm-up reclaimable memory fell below the frozen slack"
                                    control.cancel(); return false
                                }
                                return true
                            }, request: control)
                            let stats = delivery.stats
                            if phase == 0 { warmOutputs.append(delivery.ids) }
                            let complete = stats.runtimeError == nil && !stats.memoryPressureCancelled
                                && stats.prefillTokens == ids.count - expectedReuse
                                && stats.reusedPrefixTokens == expectedReuse && delivery.ids.count == 1
                                && stats.decodeTokens == 1
                            let noSwap = stats.generatorVMBefore != nil && stats.generatorVMAfter != nil
                                && stats.generatorVMBefore?.swapins == stats.generatorVMAfter?.swapins
                                && stats.generatorVMBefore?.swapouts == stats.generatorVMAfter?.swapouts
                            let peak = max(stats.peakMemoryGB, Double(stats.sampledFootprint?.peakBytes ?? 0) / 1e9)
                            let observed = (stats.sampledFootprint?.samples ?? 0) > 0
                                && (stats.sampledFootprint?.peakBytes ?? 0) > 0 && stats.lifetimeRSSPeakBytes > 0
                            let fits = complete && noSwap && observed && peak <= plan.expectedPeakGB && warmupFailure == nil
                            warmup.append([
                                "conversation": index, "phase": phase, "prompt_ids": ids,
                                "output_ids": delivery.ids, "text": delivery.text, "expected_reuse": expectedReuse,
                                "stats": try JSONSerialization.jsonObject(with: JSONEncoder().encode(stats)),
                                "retained": engine.prefixCache.json(), "fits": fits,
                            ])
                            if !fits {
                                warmupFailure = warmupFailure ?? "retained warm-up failed completion, reuse, memory or swap contract"
                                break
                            }
                        }
                        if warmupFailure != nil { break }
                    }
                }
                let retainedBefore = engine.prefixCache.json()
                if let failure = warmupFailure {
                    let output: [String: Any] = ["kind": "retained-context-warmup-failure",
                        "fits": false, "aborted": failure, "warmup": warmup,
                        "retained_before": retainedBefore, "main_request_started": false]
                    print(String(decoding: try JSONSerialization.data(withJSONObject: output, options: [.sortedKeys]), as: UTF8.self))
                    throw PlanError(failure)
                }
                var fitsSoFar = true
                for n in rungs {
                    let ids = Array(all.prefix(n))
                    var aborted: String?
                    var params = SampleParams.greedy
                    params.maxTokens = replyTokens
                    let control = try engine.beginRequest()
                    let rungStarted = warmConversations > 0 ? retainedStarted : RuntimeClock.now()
                    var timings: [[String: Any]] = []
                    var previousDone = 0, previousElapsed = 0.0
                    var lastProgressSeconds = 0.0
                    engine.generator.onPrefillProgressAbsolute = { done, total, elapsed, base in
                        guard done > previousDone else { return }
                        timings.append(["from": base + previousDone, "tokens": done - previousDone,
                            "seconds": elapsed - previousElapsed])
                        previousDone = done; previousElapsed = elapsed
                        if elapsed - lastProgressSeconds >= 30 {
                            FileHandle.standardError.write(Data("  context-check progress: \(done)/\(total) missing tokens committed\n".utf8))
                            lastProgressSeconds = elapsed
                        }
                    }
                    let (text, outputIds, stats) = engine.generate(
                        promptIds: ids, params: params,
                        shouldContinue: {
                            if RuntimeClock.seconds(since: rungStarted) >= wallSeconds {
                                aborted = "diagnostic wall-clock ceiling exceeded"
                                control.cancel(); return false
                            }
                            // The guard: stop before the machine pays in swap.
                            if let a = Planner.deviceAvailableGB(), a < slack {
                                aborted = String(format: "reclaimable memory fell to %.1f GB (floor %.1f)", a, slack)
                                return false
                            }
                            return true
                        }, request: control)
                    engine.generator.onPrefillProgressAbsolute = nil
                    let retainedAfter = engine.prefixCache.json()
                    engine.dropPrefixCache()
                    let peak = max(stats.peakMemoryGB, Double(stats.sampledFootprint?.peakBytes ?? 0) / 1e9)
                    let completed = stats.runtimeError == nil && !stats.memoryPressureCancelled
                        && stats.prefillTokens == n && stats.decodeTokens == replyTokens
                    let noSwap = stats.generatorVMBefore != nil && stats.generatorVMAfter != nil
                        && stats.generatorVMBefore?.swapins == stats.generatorVMAfter?.swapins
                        && stats.generatorVMBefore?.swapouts == stats.generatorVMAfter?.swapouts
                    let observed = (stats.sampledFootprint?.samples ?? 0) > 0
                        && (stats.sampledFootprint?.peakBytes ?? 0) > 0 && stats.lifetimeRSSPeakBytes > 0
                    let fits = aborted == nil && completed && observed && peak <= plan.expectedPeakGB && noSwap
                    let verdict: String
                    if let a = aborted {
                        verdict = "ABORTED at \(stats.prefillTokens) tokens: \(a)"
                    } else if !completed {
                        verdict = "INCOMPLETE: \(stats.runtimeError ?? "prompt or reply did not complete")"
                    } else if !noSwap || !observed {
                        verdict = "EXCLUDED: swap activity or missing memory observations during the request"
                    } else if fits {
                        verdict = "OK"
                    } else {
                        verdict = String(format: "OVER the plan by %.1f GB", peak - plan.expectedPeakGB)
                    }
                    if asJSON {
                        let d: [String: Any] = [
                            "text": text, "output_ids": outputIds,
                            "tokens": n, "reply_tokens": replyTokens, "configured_context": plan.maxContextTokens, "prompt_ids": ids, "prefill_tokens": stats.prefillTokens,
                            "prefill_seconds": stats.prefillSeconds, "prefill_tok_s": stats.prefillTPS,
                            "peak_rss_gb": Double(stats.lifetimeRSSPeakBytes) / 1e9,
                            "process_peak_bound_gb": peak,
                            "plan_expected_peak_gb": plan.expectedPeakGB,
                            "stats": try JSONSerialization.jsonObject(with: JSONEncoder().encode(stats)),
                            "optimizations": try JSONSerialization.jsonObject(with: JSONEncoder().encode(engine.model.optimizations)),
                            "prefill_chunk": engine.generator.prefillChunk,
                            "pass_timings": timings,
                            "passes": stats.prefillPasses,
                            "compute_passes": stats.prefillComputePasses,
                            "compute_key_extents": stats.prefillComputeKeyExtents,
                            "compute_query_rows": stats.prefillComputeQueryRows,
                            "memory_ledger": plan.memoryLedger.json,
                            "warmup": warmup, "retained_before": retainedBefore, "retained_after": retainedAfter,
                            "model_revision": PinnedModel.revision,
                            "fits": fits, "aborted": aborted ?? NSNull(),
                            "verdict": verdict,
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
                    if fitsSoFar {
                        print("verdict: \(target) prompt tokens plus \(replyTokens) output tokens completed inside the plan on this Mac. "
                            + "Ordinary serving defaults to \(ContextPolicy.defaultTokens); its implementation ceiling remains \(cap). "
                            + "A larger supported window requires an explicit --max-context. Diagnostic success does not raise that ceiling.")
                    } else {
                        print("verdict: the plan does not cover this prompt length here; lower --tokens, raise "
                            + "--memory-gb if the machine has room, or close other apps and retry.")
                    }
                }
                result = fitsSoFar ? .success(()) : .failure(PlanError("context qualification failed; preserved output contains the incomplete or over-budget rung"))
            } catch {
                result = .failure(error)
            }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}
