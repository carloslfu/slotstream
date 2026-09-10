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
                    if product > PrefillSchedule.measuredQueryKeyProduct
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
        c.equal("actual tail fits without a third pass",
                PrefillSchedule.passes(tokens: 7960, maxChunk: 4096, tailAware: true), [4096, 3864])
        c.equal("reference tail is preserved as the control",
                PrefillSchedule.passes(tokens: 7960, maxChunk: 4096), [4096, 2048, 1816])
        var tailsBounded = true
        for base in stride(from: 0, through: ContextPolicy.maxTokens - 1, by: 127) {
            for remaining in [1, 3, 255, 256, 257, 2047, 2048, 3864, 4095, 4096, 4097] {
                guard base + remaining <= ContextPolicy.maxTokens else { continue }
                for limit in [256, 1024, 4096] {
                    var position = base
                    let passes = PrefillSchedule.passes(tokens: remaining, from: base, maxChunk: limit, tailAware: true)
                    if passes.reduce(0, +) != remaining { tailsBounded = false }
                    for pass in passes {
                        if pass <= 0 || pass > limit || pass * (position + pass) > PrefillSchedule.measuredQueryKeyProduct { tailsBounded = false }
                        position += pass
                    }
                }
            }
        }
        c.expect("tail schedule covers reused offsets, boundaries and all supported context", tailsBounded)
        var scopesPreserveSchedule = true
        for tail in [false, true] {
            for base in [0, 255, 4096, 8016, 16384, 30000] {
                for length in [1, 255, 256, 1025, 7960, 8192] where base + length <= 32768 {
                    for chunk in [256, 1024, 4096] {
                        for scope in [1024, 4096, 8192] {
                            var passes: [Int] = [], pos = base
                            while pos < base + length {
                                let group = PrefillSchedule.scopePasses(remaining: base + length - pos,
                                    at: pos, maxChunk: chunk, maxScope: scope, tailAware: tail)
                                if group.isEmpty { scopesPreserveSchedule = false; break }
                                let total = group.reduce(0, +)
                                if group.count > 1 && total > scope { scopesPreserveSchedule = false }
                                passes += group; pos += total
                            }
                            if passes != PrefillSchedule.passes(tokens: length, from: base, maxChunk: chunk, tailAware: tail) {
                                scopesPreserveSchedule = false
                            }
                        }
                    }
                }
            }
        }
        c.expect("read scopes preserve every bounded compute pass", scopesPreserveSchedule)
        let checkpointScope = PrefillSchedule.scopePasses(remaining: 1280, at: 0,
            maxChunk: 256, maxScope: 1024, tailAware: false)
        c.equal("read-sharing group contains the existing checkpoint boundary", checkpointScope, [256, 256, 256, 256])
        c.equal("retention preserves that boundary without splitting compute", PrefillSchedule.preservingCheckpoint(
            checkpointScope, from: 0, checkpoint: 256), [256])
        c.equal("later boundary preserves all preceding compute passes", PrefillSchedule.preservingCheckpoint(
            checkpointScope, from: 0, checkpoint: 512), [256, 256])
        c.equal("interior token never rebatches a compute pass", PrefillSchedule.preservingCheckpoint(
            checkpointScope, from: 0, checkpoint: 255), checkpointScope)
        c.equal("a reused checkpoint does not shorten the next read scope", PrefillSchedule.preservingCheckpoint(
            checkpointScope, from: 256, checkpoint: 256), checkpointScope)
        c.equal("disabled retention preserves the read scope", PrefillSchedule.preservingCheckpoint(
            checkpointScope, from: 0, checkpoint: 0), checkpointScope)
        c.equal("out-of-range checkpoint preserves the read scope", PrefillSchedule.preservingCheckpoint(
            checkpointScope, from: 0, checkpoint: Int.max), checkpointScope)
        c.equal("zero remainder makes no pass", PrefillSchedule.next(remaining: 0, at: 32768, maxChunk: 4096, tailAware: true), 0)
        c.equal("out-of-model diagnostic position has no legal pass", PrefillSchedule.chunk(at: Int.max, maxChunk: Int.max), 0)

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
