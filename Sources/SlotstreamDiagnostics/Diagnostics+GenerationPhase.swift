import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func generationPhase(modelDir: URL, mtp: Bool = false) async throws -> CheckReport {
        let engine = try await Engine(modelDir: modelDir, poolSlots: Geometry.floorSlots)
        if mtp {
            try engine.model.enableMTP(modelDir: modelDir)
            engine.generator.speculationEnabled = true
        }
        engine.generator.prefillChunk = 256
        engine.model.optimizations.automaticReadScope = false
        var c = CheckBuilder(mtp ? "generation-phase-mtp" : "generation-phase")
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("slotstream-phase-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: directory) }
        let tier = try engine.enablePersistentPrefixCache(.init(directory: directory, minimumTokens: 1))
        let prompt = try engine.encodeChat([ChatMessage(role: "user", content:
            String(repeating: "The shop records seventeen trays with twenty-three rolls each. ", count: 26)
                + "How many rolls are in seventeen trays? Answer with the number.")], thinking: true)
        let suffix = engine.tokenizer.encode(text: "</think>\n\n", addSpecialTokens: false)
        var first = SampleParams.greedy; first.maxTokens = 4
        var second = SampleParams.greedy; second.maxTokens = 3
        var observed: [[Float]] = []
        engine.generator.promptLogitsObserver = { observed.append($0) }
        var seen = 0
        let phases = try engine.generatePhased(promptIds: prompt, first: first, second: second,
            onFirstToken: { _, _ in seen += 1; return seen < 3 }, transition: { _ in suffix })
        c.expect("both phases complete", phases.first.stats.runtimeError == nil && phases.second.stats.runtimeError == nil)
        c.equal("callback ends the first phase only", phases.first.ids.count, 3)
        c.equal("answer gets its own output budget", phases.second.ids.count, 3)
        c.equal("only pending token and separator are read", phases.second.stats.prefillTokens, suffix.count + 1)
        c.equal("phase owns every previously consumed token", phases.second.stats.reusedPrefixTokens, prompt.count + 2)
        c.equal("both prompt-logit boundaries observed", observed.count, 2)
        c.equal("completed session releases all pool pins", engine.model.pool.pinnedSlotCount, 0)
        if mtp {
            c.expect("first phase actually speculates", phases.first.stats.verifyPasses > 0)
            c.expect("second phase preserves the draft state", phases.second.stats.verifyPasses > 0)
        }
        let answerLogits = observed.last ?? []
        c.equal("private phase writes no persistent state", tier.json()["states"] as? Int, 0)
        c.equal("private phase writes no persistent segments", tier.json()["segments"] as? Int, 0)

        // A later turn still rebuilds generated rows. Continuing a phase must
        // never mark its mixed prefill/decode state as cold-equivalent.
        let followup = prompt + phases.first.ids + suffix + phases.second.ids + [198, 1000]
        observed = []
        let warm = engine.generate(promptIds: followup, params: second)
        let warmLogits = observed.last ?? []
        engine.prefixCache.drop(); observed = []
        let cold = engine.generate(promptIds: followup, params: second)
        c.equal("later turn preserves cold output ids", warm.ids, cold.ids)
        c.expect("later turn preserves cold prompt logits", !warmLogits.isEmpty
            && warmLogits.map(\.bitPattern) == (observed.last ?? []).map(\.bitPattern))

        // Independent reference: ordinary prefill, then exactly the consumed
        // first-phase tokens, then its still-pending token plus forced suffix.
        // Feeding the pending token zero or two times changes this comparison.
        engine.generator.promptLogitsObserver = nil
        engine.prefixCache.drop()
        if !mtp {
        let state = engine.model.makeState()
        for lo in stride(from: 0, to: prompt.count, by: 256) {
            eval(engine.model.lastLogits(Array(prompt[lo ..< min(prompt.count, lo + 256)]), state: state))
        }
        for token in phases.first.ids.dropLast() { eval(engine.model.lastLogits([token], state: state)) }
        let reference = engine.model.lastLogits(Array(phases.first.ids.suffix(1)) + suffix, state: state)
        eval(reference)
        c.expect("transition logits match explicit pending-token reference bit for bit",
            !answerLogits.isEmpty && reference.reshaped([-1]).asType(.float32).asArray(Float.self).map(\.bitPattern) == answerLogits.map(\.bitPattern))
        c.equal("phase state has exact consumed length", state.tokenCount, prompt.count + phases.first.ids.count + suffix.count)
        }
        // Direct model calls above deliberately bypass Generator's cleanup.
        Stream.gpu.synchronize(); engine.model.pool.unpinAll()
        c.measure("first_prefill_tokens", Double(phases.first.stats.prefillTokens))
        c.measure("second_prefill_tokens", Double(phases.second.stats.prefillTokens))
        c.measure("second_prefill_seconds", phases.second.stats.prefillSeconds)
        c.measure("peak_physical_gb", phases.second.stats.peakMemoryGB)

        var keepGoing = true, answered = false
        do {
            _ = try engine.generatePhased(promptIds: Array(prompt.prefix(20)), first: first, second: second,
                shouldContinue: { keepGoing }, onFirstToken: { _, _ in keepGoing = false; return false },
                onSecondToken: { _, _ in answered = true; return true }, transition: { _ in suffix })
            c.expect("cancellation between phases is refused", false)
        } catch {
            c.equal("cancellation remains typed", (error as? RequestFailure)?.code, .clientCancelled)
        }
        c.expect("cancelled first phase emits no answer", !answered)
        c.equal("cancelled session releases pins", engine.model.pool.pinnedSlotCount, 0)
        let parent = RequestController(configuration: try ContextConfiguration(maxContextTokens: 512), slackBytes: 1234)
        let child = parent.nextGenerationPhase()
        c.equal("next phase keeps caller context limit", child.configuration.maxContextTokens, 512)
        c.equal("next phase keeps caller headroom", child.slackBytes, 1234)
        parent.cancel()
        do { try child.check(phase: "test"); c.expect("parent cancellation reaches next phase", false) }
        catch { c.equal("parent cancellation remains typed", (error as? RequestFailure)?.code, .clientCancelled) }
        return c.report()
    }
}
