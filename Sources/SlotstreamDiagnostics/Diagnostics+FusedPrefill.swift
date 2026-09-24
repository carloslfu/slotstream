import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Independent scalar Double oracle over the actual BF16 inputs. Includes
    /// causal alignment, masked future columns, GQA, odd tails and strided Q.
    public static func fusedPrefillAttention() -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        var c = CheckBuilder("fused-prefill-attention")
        func values(_ count: Int, _ multiplier: Int, _ add: Int, _ modulus: Int, _ subtract: Int) -> [Float] {
            var result = [Float](); result.reserveCapacity(count)
            for i in 0 ..< count {
                let integer: Int = (i * multiplier + add) % modulus - subtract
                result.append(Float(integer) / Float(64))
            }
            return result
        }
        for (b, h, hk, s, n) in [(2, 4, 2, 17, 257), (1, 24, 2, 256, 8192),
                                  (1, 24, 2, 259, 8211)] {
            let base = n - s
            let q0 = MLXArray(values(b * h * s * 256, 31, 7, 257, 128), [b, h, s, 256]).asType(.bfloat16)
            let q = contiguous(q0.transposed(0, 1, 3, 2)).transposed(0, 1, 3, 2)
            let k = MLXArray(values(b * hk * n * 256, 43, 13, 263, 131), [b, hk, n, 256]).asType(.bfloat16)
            let v = MLXArray(values(b * hk * n * 256, 59, 17, 269, 134), [b, hk, n, 256]).asType(.bfloat16)
            let qa = q.asType(.float32).asArray(Float.self).map(Double.init)
            let ka = k.asType(.float32).asArray(Float.self).map(Double.init)
            let va = v.asType(.float32).asArray(Float.self).map(Double.init)
            for sparse in [false, true] {
                func visible(_ row: Int, _ key: Int) -> Bool {
                    key <= base + row && (!sparse || key / 4 % 4 == row % 4 || key >= (base + row) / 4 * 4)
                }
                let mask = sparse ? MLXArray((0 ..< s * n).map { UInt8(visible($0 / n, $0 % n) ? 1 : 0) }, [1, 1, s, n]).asType(.bool) : nil
                let mode: MLXFast.ScaledDotProductAttentionMaskMode = mask.map { .array($0) } ?? .causal
                let ref = MLXFast.scaledDotProductAttention(queries: q, keys: k, values: v, scale: 0.0625, mask: mode)
                var calls = 0
                let got = FusedPrefillAttention.diagnosticProductionAttention(q: q, k: k, v: v,
                    mask: mask, base: base, block: 256, onFused: { calls += 1 })
                let ra = ref.asType(.float32).asArray(Float.self)
                let ga = got.asType(.float32).asArray(Float.self)
                let label = "B\(b).H\(h).S\(s).N\(n).sparse\(sparse)"
                c.expect(label + ": finite complete output", got.shape == q.shape && ga.allSatisfy(\.isFinite))
                c.equal(label + ": capability controls dispatch", calls > 0, FusedPrefillAttention.available)
                var re = 0.0, ce = 0.0, norm = 0.0
                for batch in 0 ..< b { for head in [0, h - 1] { for row in [0, s / 2, s - 1] {
                    let qb = ((batch * h + head) * s + row) * 256
                    let kb = (batch * hk + head / (h / hk)) * n * 256
                    let keys = (0 ..< n).filter { visible(row, $0) }
                    let scores = keys.map { key -> Double in
                        var dot = 0.0
                        for d in 0 ..< 256 { dot += qa[qb + d] * ka[kb + key * 256 + d] }
                        return dot / 16
                    }
                    let peak = scores.max()!
                    let weights = scores.map { exp($0 - peak) }
                    let total = weights.reduce(0, +)
                    for d in 0 ..< 256 {
                        var oracle = 0.0
                        for (i, key) in keys.enumerated() { oracle += weights[i] * va[kb + key * 256 + d] }
                        oracle /= total
                        re += pow(Double(ra[qb + d]) - oracle, 2)
                        ce += pow(Double(ga[qb + d]) - oracle, 2)
                        norm += oracle * oracle
                    }
                } } }
                let refError = sqrt(re / max(norm, 1e-30)), error = sqrt(ce / max(norm, 1e-30))
                c.measure(label + ".reference_relative_l2", refError)
                c.measure(label + ".fused_relative_l2", error)
                c.expect(label + ": independent numerical fidelity", error <= max(refError * 1.1, 0.005))
                let repeatOutput = FusedPrefillAttention.diagnosticProductionAttention(q: q, k: k, v: v,
                    mask: mask, base: base, block: 256)
                c.expect(label + ": repeatable bits", ga.map(\.bitPattern) == repeatOutput.asType(.float32).asArray(Float.self).map(\.bitPattern))
            }
        }
        for rows in [1, 2, 3, 8, 9] { for dtype: DType in [.float32, .bfloat16] {
            let q = MLXArray.ones([1, 24, rows, 256], dtype: dtype)
            let k = MLXArray.ones([1, 2, 33, 256], dtype: dtype)
            let v = MLXArray((0 ..< 2 * 33 * 256).map { Float($0 % 23) / 32 }, [1, 2, 33, 256]).asType(dtype)
            guard rows <= 8 || dtype != .bfloat16 else { continue }
            var calls = 0
            let got = FusedPrefillAttention.diagnosticProductionAttention(q: q, k: k, v: v,
                mask: nil, base: 33 - rows, block: 256, onFused: { calls += 1 })
            let ref = MLXFast.scaledDotProductAttention(queries: q, keys: k, values: v, scale: 0.0625, mask: rows == 1 ? .none : .causal)
            c.expect("S\(rows).\(dtype): exact fallback", calls == 0 && (got .== ref).all().item(Bool.self))
        } }
        let query = MLXArray.zeros([1, 24, 9, 256], dtype: .bfloat16)
        let key = MLXArray.zeros([1, 2, 33, 256], dtype: .bfloat16)
        c.expect("CPU default never forces a Metal-only kernel", Device.withDefaultDevice(.cpu) {
            !FusedPrefillAttention.supported(q: query, k: key, v: key)
        })
        return c.report()
    }
}
