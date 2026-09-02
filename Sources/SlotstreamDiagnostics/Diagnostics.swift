// Diagnostics: the checks that used to live inside CLI subcommands.
//
// Each one is a function returning a CheckReport, so the same body serves the
// subcommand a user runs, the catalogue CI runs, and a host app that wants to
// verify its own installation. Nothing here prints.

import Foundation
import Slotstream

public enum Diagnostics {
    /// The prefill schedule's four properties, which the planner, `doctor`'s
    /// wait estimates and the over-length 400 all depend on:
    ///
    /// - **bounded**: a pass never attends over more query-by-key product than
    ///   any prefill measurement covered;
    /// - **floored**: it never shrinks below the smallest measured pass;
    /// - **complete**: the passes sum to the prompt, so no token is skipped;
    /// - **monotone**: reading more tokens never takes less time.
    ///
    /// This is the arithmetic behind every context number a user is shown, and
    /// it needs neither weights nor a GPU.
    public static func prefillSchedule() -> CheckReport {
        var c = CheckBuilder("prefill-schedule")
        let chunks = [256, 512, 1024, 2048, 4096]
        let lengths = [1, 255, 256, 1000, 2048, 8192, 16384, 32768]

        var boundedEverywhere = true
        var flooredEverywhere = true
        var completeEverywhere = true
        var worstProduct = 0

        for maxChunk in chunks {
            for tokens in lengths {
                var position = 0
                for pass in PrefillSchedule.passes(tokens: tokens, maxChunk: maxChunk) {
                    // The bound is on the pass the schedule chose, not on the
                    // final partial pass, which is only ever smaller.
                    let full = PrefillSchedule.chunk(at: position, maxChunk: maxChunk)
                    let product = full * (position + full)
                    worstProduct = max(worstProduct, product)
                    if full > PrefillSchedule.minChunk,
                        product > PrefillSchedule.measuredQueryKeyProduct
                    {
                        boundedEverywhere = false
                    }
                    if full < PrefillSchedule.minChunk { flooredEverywhere = false }
                    position += pass
                }
                if position != tokens { completeEverywhere = false }
            }
        }

        c.expect(
            "a pass never exceeds the measured query-by-key product",
            boundedEverywhere,
            "worst product \(worstProduct) > \(PrefillSchedule.measuredQueryKeyProduct)")
        c.expect("a pass never falls below the measured floor", flooredEverywhere)
        c.expect("the passes sum to the prompt", completeEverywhere)

        // Monotone in prompt length, at every pass size.
        var monotone = true
        for maxChunk in chunks {
            var previous = -1.0
            for tokens in stride(from: 0, through: 32_768, by: 512) {
                let s = PrefillSchedule.estSeconds(tokens: tokens, maxChunk: maxChunk)
                if s < previous { monotone = false }
                previous = s
            }
        }
        c.expect("reading more tokens never takes less time", monotone)

        // The schedule shrinks as the context grows: this is the property that
        // keeps a long prompt's transient inside what was measured, and the
        // reason the never-measured 8192 pass is not a candidate.
        let early = PrefillSchedule.chunk(at: 0, maxChunk: 4096)
        let late = PrefillSchedule.chunk(at: 31_000, maxChunk: 4096)
        c.expect("the pass shrinks as the context grows", late < early, "\(early) -> \(late)")
        c.expect("the shrunken pass is still at the floor or above", late >= PrefillSchedule.minChunk)

        // An empty prompt runs no passes and costs nothing.
        c.equal("an empty prompt runs no passes", PrefillSchedule.passes(tokens: 0, maxChunk: 4096).count, 0)
        c.equal("an empty prompt costs no time", PrefillSchedule.estSeconds(tokens: 0, maxChunk: 4096), 0)

        // A prompt already held costs nothing more: this is the prefix cache's
        // promise, priced.
        c.equal(
            "a fully cached prompt runs no passes",
            PrefillSchedule.passes(tokens: 0, from: 8000, maxChunk: 4096).count, 0)

        c.measure("worst_query_key_product", Double(worstProduct))
        c.measure("chunk_at_0", Double(early))
        c.measure("chunk_at_31k", Double(late))
        return c.report()
    }
}
