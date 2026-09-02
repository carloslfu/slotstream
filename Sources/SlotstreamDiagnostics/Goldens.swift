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
    /// Sampling properties that hold without a reference to diff against: a
    /// seed reproduces, a different seed does not, greedy is deterministic, and
    /// every draw is inside the vocabulary. The numpy comparison itself stays
    /// in `Tools/sampler_gates.sh`, which owns the reference.
    public static func samplerBehaviour() throws -> CheckReport {
        var c = CheckBuilder("sampler-behaviour")

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
        c.measure("vocab", 256)
        return c.report()
    }
}
