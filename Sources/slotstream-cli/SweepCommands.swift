// The prefill sweep's gates. A pass of 256 tokens or more streams each
// layer's experts through staging groups and MLX's grouped GEMM instead of
// gathering over the slot pool (Layers.swift, MoELayer.sweep). Three things
// must hold for that to be the same computation: it stays inside the band
// that re-chunking a plain prefill already moves the logits by (the control
// prefix-check established), it is deterministic, and it is blind to what
// the pool holds — the golden-equivalence invariant, which for the sweep
// means the same bytes reach the same kernel whether an expert was copied
// out of the pool or read from the checkpoint.

import ArgumentParser
import Foundation
import MLX
import Slotstream

struct SweepCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "sweep-check",
        abstract: "Prove the prefill sweep matches the pool path, is deterministic, and ignores what the pool holds")
    @OptionGroup var model: ModelOptions
    @Option(help: "Slots to run with (small keeps the check cheap; these properties are size-independent)")
    var slots: Int = Geometry.floorSlots

    /// Ordinary prose, long enough that one pass is well past the sweep's
    /// threshold and routes broadly (about 700 tokens). Varied on purpose:
    /// a repeated sentence routes to a few dozen experts per layer and would
    /// leave most of the sweep untested.
    static let text = """
        A lighthouse keeper on the northern coast kept a ledger of every ship that passed, \
        noting the weather, the hour, and whether the vessel answered her lamp. Over forty \
        years the ledger filled eleven volumes, and when the light was automated she donated \
        them to the maritime museum, where a curator found that the entries predicted storms \
        better than the almanac of the time. The museum now runs a small exhibit on the ledger, \
        with one page open to a night in 1911 when three ships turned back within an hour. \
        In a different field entirely, a bakery in a mountain town discovered that its sourdough \
        rose faster on days when the pressure dropped, and the head baker started reading the \
        barometer before deciding how long to proof the loaves. Customers noticed nothing except \
        that the bread was reliably good, which was the point. A physics teacher who bought bread \
        there every Saturday wrote the observation up for a hobbyist journal, with a table of \
        proofing times against pressure readings and a careful note that the sample was small. \
        Elsewhere, a municipal water utility replaced its paper inspection forms with tablets and \
        found that inspectors wrote shorter notes but photographed more, so the engineers who read \
        the reports learned to look at the pictures first. The utility measured the change by \
        counting how many follow-up visits each report triggered; the number fell by a fifth in the \
        first year and then held. A composer working on a piece for two pianos asked the players \
        to rehearse in separate rooms with a shared metronome, and only combine the parts in the \
        final week, so that each would learn to hold tempo without leaning on the other. The \
        premiere was tight and slightly cold, according to one review, and warm and precise \
        according to another; the composer kept both clippings in the score. On a farm that grows \
        seed potatoes for other farms, the rotation runs seven years, and the family keeps a map \
        of every field going back to 1952, with the varieties and the yields and the years a blight \
        got in. The map is drawn in pencil on butcher paper and photographed each winter. A \
        translator of technical manuals keeps a list of words that mean different things in the \
        two languages she works between, and adds to it whenever a reviewer flags a sentence; \
        the list has more than nine hundred entries and she reads it once a year, in January, \
        because that is when the work is slow. Finally, a small observatory that measures the \
        brightness of variable stars lets visitors take one measurement each on open nights, \
        and includes their numbers in the published series with a mark, and over a decade the \
        visitors' points have proven no worse than the staff's.
        """

    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let poolSlots = slots
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, poolSlots: poolSlots)
                var failures: [String] = []
                func note(_ s: String) {
                    FileHandle.standardError.write((s + "\n").data(using: .utf8)!)
                }
                let ids = try engine.encodeChat(
                    [ChatMessage(role: "user", content: Self.text)], thinking: false)
                guard ids.count >= 2 * 256 else {
                    throw ModelError("sweep-check prompt is only \(ids.count) tokens; the sweep needs 256 per pass")
                }
                func logits(_ how: PrefixCheck.Build) -> [Float] {
                    PrefixCheck.logits(engine, ids: ids, how)
                }
                let defaultMin = SweepTuning.minTokens

                // ---- 1. The sweep on an empty pool, twice: deterministic.
                let sweepCold = logits(.whole)
                let sweepAgain = logits(.whole)
                let deterministic = sweepCold == sweepAgain
                note("  sweep on a cold pool, run twice: \(deterministic ? "identical" : "DIFFERS")")
                if !deterministic { failures.append("the sweep is not deterministic run to run") }

                // ---- 2. The pool path, whole and re-chunked: the control band.
                // Re-chunking a plain prefill is the existing chunk-equivalence
                // gate; whatever it moves the logits by is the size of "the
                // same answer, summed differently" on this model.
                SweepTuning.minTokens = Int.max
                let poolWhole = logits(.whole)
                let (ctrl7, _) = PrefixCheck.compare(poolWhole, logits(.chunked(7)))
                let (ctrl256, _) = PrefixCheck.compare(poolWhole, logits(.chunked(256)))
                let control = max(ctrl7, ctrl256)
                SweepTuning.minTokens = defaultMin

                // ---- 3. The sweep against the pool path, inside the band.
                let (rel, sameTop1) = PrefixCheck.compare(poolWhole, sweepCold)
                let bound = max(control * 3, 0.01)
                note(String(
                    format: "  sweep vs pool path: %.3f%% of logit spread (prefill-rechunk control %.3f%%, bound %.3f%%), top-1 %@",
                    rel * 100, control * 100, bound * 100, sameTop1 ? "same" : "differs"))
                if rel > bound {
                    failures.append(String(
                        format: "sweep moves logits %.3f%% of spread, over the %.3f%% bound set by the prefill-rechunk control",
                        rel * 100, bound * 100))
                }

                // ---- 4. The sweep re-chunked at its smallest pass: same band.
                let (relChunk, _) = PrefixCheck.compare(sweepCold, logits(.chunked(256)))
                note(String(format: "  sweep whole vs sweep in 256-token passes: %.3f%% of spread", relChunk * 100))
                if relChunk > bound {
                    failures.append(String(
                        format: "re-chunking the sweep moves logits %.3f%%, over the %.3f%% bound", relChunk * 100, bound * 100))
                }

                // ---- 5. Blind to the pool. The pool path above loaded this
                // prompt's experts, so the sweep now copies many of them out
                // of the pool instead of reading them; the bytes and the kernel
                // are the same, so the logits must be bit-identical.
                let residentBefore = engine.model.pool.hits
                let sweepWarm = logits(.whole)
                let copied = engine.model.pool.hits - residentBefore
                let blind = sweepWarm == sweepCold
                note("  sweep on the warm pool (\(copied) experts copied out of it): \(blind ? "identical to the cold sweep" : "DIFFERS from the cold sweep")")
                if copied == 0 { failures.append("the warm sweep copied nothing out of the pool, so pool-blindness was not exercised") }
                if !blind { failures.append("the sweep's logits depend on what the pool holds") }

                // ---- 6. Admission leaves the pool consistent. A generate
                // whose last pass is a sweep admits the prompt's hot experts
                // into the pool; the pool path's math may not change (a wrong
                // slot map would), and the sweep must still be blind to it.
                engine.generator.prefillChunk = 4096
                var p = SampleParams.greedy
                p.maxTokens = 1
                let (_, st) = engine.generator.generate(promptIds: ids, params: p, eosIds: engine.eosIds)
                SweepTuning.minTokens = Int.max
                let poolAfter = logits(.whole)
                SweepTuning.minTokens = defaultMin
                let sweepAfter = logits(.whole)
                let poolSame = poolAfter == poolWhole
                let sweepSame = sweepAfter == sweepCold
                note("  after a generate that admitted the prompt's hot experts (prefill \(st.prefillTokens) tokens): pool path \(poolSame ? "identical" : "DIFFERS"), sweep \(sweepSame ? "identical" : "DIFFERS")")
                if !poolSame { failures.append("sweep admission changed the pool path's logits: the slot map is inconsistent") }
                if !sweepSame { failures.append("the sweep's logits changed after admission") }

                if failures.isEmpty {
                    print(String(
                        format: "SWEEP CHECK PASS: deterministic; %.3f%% of spread vs the pool path inside the %.3f%% prefill-rechunk bound; identical on a cold and a warm pool; admission leaves the pool consistent",
                        rel * 100, bound * 100))
                } else {
                    for f in failures { note("FAIL: " + f) }
                    throw ModelError("sweep-check failed: \(failures.count) gate(s)")
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
