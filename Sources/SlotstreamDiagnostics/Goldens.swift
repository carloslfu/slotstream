// Goldens: values this implementation must reproduce exactly, compared against
// an independent reference (numpy, transformers, or the pinned MLX Python
// model). Returning the values instead of printing them means the CLI, the
// catalogue and a host app all compare the same bytes.

import Foundation
import MLX
import Slotstream

public enum Goldens {
    /// Sampling from synthetic logits, for comparison with Tools/sampler_ref.py.
    ///
    /// Both sides build their logits from the same splitmix64 stream using only
    /// exactly representable float operations, so agreement is bit-for-bit and
    /// a disagreement is a real difference, not rounding.
    public static func samplerLogits(vocab: Int, seed: UInt64) -> [Float] {
        var st = seed
        return (0 ..< vocab).map { _ in
            st = Splitmix.mix(st)
            // 24 bits / 2^24 is exact in f32; x8 and -4 are exact scalings.
            return Float(st >> 40) / Float(1 << 24) * 8.0 - 4.0
        }
    }

    /// The token ids the sampler draws. Needs MLX (and so the Metal library).
    public static func sampler(
        vocab: Int = 256, draws: Int = 24, seed: UInt64 = 7, logitSeed: UInt64 = 99,
        params: SampleParams = SampleParams(), accumulate: Bool = false
    ) throws -> [Int] {
        guard vocab > 0 else { throw SlotstreamError.invalidPlan("--vocab must be greater than zero") }
        guard draws >= 0 else { throw SlotstreamError.invalidPlan("--draws must not be negative") }
        let arr = MLXArray(samplerLogits(vocab: vocab, seed: logitSeed))
        let p = params.sanitized()
        var sampler = Sampler(seed: seed)
        let optimizations = try InferenceOptimizations.environment()
        sampler.valueOnlyTopK = optimizations.valueOnlySamplerThreshold
        sampler.deviceDraw = optimizations.deviceSamplerDraw
        var generated = Set<Int>()
        var picks: [Int] = []
        for _ in 0 ..< draws {
            let t = sampler.next(arr, params: p, generated: generated)
            picks.append(t)
            if accumulate { generated.insert(t) }
        }
        return picks
    }
}

extension Diagnostics {
    /// Literal expectations independently preserve the penalty when a tiny
    /// positive temperature overflows finite logits before the draw.
    static func samplerFallback(_ c: inout CheckBuilder) {
        let cases: [(String, [Float], Set<Int>, Float, Float, Int, Float, Float, Int)] = [
            // Adjusted [98.5, 99] must select 1 even though raw argmax is 0.
            ("penalty", [100, 99], [0], 1.5, 1e-37, 0, 1, 0, 1),
            ("filtered penalty", [100, 99], [0], 1.5, 1e-37, 1, 0.8, 0.1, 1),
            // Reward reverses the raw winner; negative quotients overflow too.
            ("reward", [99, 100], [0], -1.5, 1e-37, 0, 1, 0, 0),
            ("negative logits", [-100, -101], [0], 1.5, 1e-37, 0, 1, 0, 1),
            ("zero penalty", [100, 99], [0], 0, 1e-37, 0, 1, 0, 0),
            ("empty history", [100, 99], [], 1.5, 1e-37, 0, 1, 0, 0),
            ("greedy penalty", [100, 99], [0], 1.5, 0, 0, 1, 0, 1),
        ]
        for (name, values, seen, penalty, temperature, k, topP, minP, expected) in cases {
            var p = SampleParams()
            p.temperature = temperature; p.presencePenalty = penalty
            p.topK = k; p.topP = topP; p.minP = minP
            p = p.sanitized()
            let logits = MLXArray(values)
            for device in [false, true] {
                for threshold in [false, true] {
                    var sampler = Sampler(seed: 7)
                    sampler.deviceDraw = device; sampler.valueOnlyTopK = threshold
                    let label = "fallback \(name), device=\(device), threshold=\(threshold)"
                    c.equal(label, sampler.next(logits, params: p, generated: seen), expected)
                    c.equal("\(label) RNG", sampler.rngState,
                            temperature > 0 ? Splitmix.mix(8) : UInt64(7))
                }
            }
        }

        // Ordinary finite draws must agree across source paths. Record the
        // baseline token so before/after runs can also detect a shared change.
        var p = SampleParams()
        p.temperature = 0.8; p.topK = 3; p.topP = 0.9
        p.minP = 0.1; p.presencePenalty = 0.5
        let logits = MLXArray([Float(2), 0, -1, 1])
        let seen: Set<Int> = [0]
        var baseline = Sampler(seed: 7)
        let expected = baseline.next(logits, params: p, generated: seen)
        c.measure("sampler-finite-control-token", Double(expected))
        c.equal("finite control baseline RNG", baseline.rngState, Splitmix.mix(8))
        for device in [false, true] {
            for threshold in [false, true] where device || threshold {
                var sampler = Sampler(seed: 7)
                sampler.deviceDraw = device; sampler.valueOnlyTopK = threshold
                let label = "finite control, device=\(device), threshold=\(threshold)"
                c.equal(label, sampler.next(logits, params: p, generated: seen), expected)
                c.equal("\(label) RNG", sampler.rngState, baseline.rngState)
            }
        }
    }

    /// Sampling properties that hold without a reference to diff against: a
    /// seed reproduces, a different seed does not, greedy is deterministic, and
    /// every draw is inside the vocabulary. The numpy comparison itself stays
    /// in `Tools/sampler_gates.sh`, which owns the reference.
    public static func samplerBehaviour() throws -> CheckReport {
        var c = CheckBuilder("sampler-behaviour")
        samplerFallback(&c)

        let a = try Goldens.sampler(draws: 16, seed: 4242)
        let b = try Goldens.sampler(draws: 16, seed: 4242)
        let d = try Goldens.sampler(draws: 16, seed: 4243)
        c.equal("a seed reproduces exactly", a, b)
        c.expect("a different seed draws differently", a != d, "\(a.prefix(4)) vs \(d.prefix(4))")
        c.expect("every draw is inside the vocabulary", a.allSatisfy { $0 >= 0 && $0 < 256 })
        c.equal("the requested number of draws come back", a.count, 16)

        var greedy = SampleParams()
        greedy.temperature = 0
        let g1 = try Goldens.sampler(draws: 8, seed: 1, params: greedy)
        let g2 = try Goldens.sampler(draws: 8, seed: 999, params: greedy)
        c.equal("greedy ignores the seed", g1, g2)
        c.expect("greedy repeats one token", Set(g1).count == 1, "\(g1)")

        // The sanitizer's job: out-of-range knobs are clamped into the range
        // the sampler is defined on rather than emptying the candidate set,
        // which used to make it emit token 0 forever.
        var wild = SampleParams()
        wild.topP = 0
        wild.minP = 5
        wild.topK = -3
        let w = try Goldens.sampler(draws: 8, seed: 5, params: wild)
        c.equal("out-of-range knobs still draw", w.count, 8)
        c.expect("out-of-range knobs do not collapse to token 0", Set(w) != [0], "\(w)")

        c.equal("an empty draw count returns nothing", try Goldens.sampler(draws: 0), [])
        let distributions: [[Float]] = [
            [Float(0)], [0, -0.0, 0, 1, 1, 1, -1, -1],
            [.infinity, 1, -.infinity, 0], [.nan, 2, 1, 0],
            [-.infinity, -.infinity, -.infinity],
            Goldens.samplerLogits(vocab: 257, seed: 99),
            Goldens.samplerLogits(vocab: 248320, seed: 13),
        ]
        for values in distributions {
            for k in [1, 2, 20, values.count - 1, values.count] {
                for topP: Float in [0.1, 0.8, 1] {
                    var p = SampleParams(); p.topK = k; p.topP = topP
                    p.minP = 0.1; p.presencePenalty = 1.5
                    p = p.sanitized()
                    var ref = Sampler(seed: 7), got = Sampler(seed: 7)
                    var draw = Sampler(seed: 7), both = Sampler(seed: 7)
                    got.valueOnlyTopK = true
                    draw.deviceDraw = true
                    both.deviceDraw = true; both.valueOnlyTopK = true
                    let logits = MLXArray(values)
                    var seen = Set<Int>(), rp: [Int] = [], gp: [Int] = [], dp: [Int] = [], bp: [Int] = []
                    for _ in 0 ..< 8 {
                        let r = ref.next(logits, params: p, generated: seen)
                        let g = got.next(logits, params: p, generated: seen)
                        dp.append(draw.next(logits, params: p, generated: seen))
                        bp.append(both.next(logits, params: p, generated: seen))
                        rp.append(r); gp.append(g); seen.insert(r)
                    }
                    c.equal("value-only threshold: n\(values.count) k\(k) p\(topP)", gp, rp)
                    c.equal("threshold RNG: n\(values.count) k\(k) p\(topP)", got.rngState, ref.rngState)
                    c.equal("device draw: n\(values.count) k\(k) p\(topP)", dp, rp)
                    c.equal("device RNG: n\(values.count) k\(k) p\(topP)", draw.rngState, ref.rngState)
                    c.equal("combined draw: n\(values.count) k\(k) p\(topP)", bp, rp)
                    c.equal("combined RNG: n\(values.count) k\(k) p\(topP)", both.rngState, ref.rngState)
                }
            }
        }
        for device in [false, true] {
            for threshold in [false, true] {
                var sampler = Sampler(seed: 7_046_029_254_386_353_130)
                sampler.deviceDraw = device; sampler.valueOnlyTopK = threshold
                var p = SampleParams(); p.temperature = 1; p.topK = 1; p.topP = 1; p.presencePenalty = 0
                let picked = sampler.next(MLXArray([-Float.infinity, Float(0), -Float.infinity]), params: p, generated: [])
                c.equal("zero draw skips leading zero mass, device=\(device), threshold=\(threshold)", picked, 1)
                c.equal("zero draw preserves exact RNG transition, device=\(device), threshold=\(threshold)", sampler.rngState, 0)
            }
        }
        c.measure("vocab", 256)
        return c.report()
    }
}
