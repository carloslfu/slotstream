import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationSelectedAttention() -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        var c = CheckBuilder("optimization-selected-attention")
        c.expect("D256 kernel initialized for BF16 and FP32", SelectedAttention.prepare(), SelectedAttention.initializationIssue)
        guard SelectedAttention.prepare() else { return c.report() }
        // Independent scalar visibility expansion, including every partial
        // block remainder, invisible sentinels, ties and exceptional scores.
        for end in [1, 3, 4, 5, 2048, 2049, 2050, 2051, 2052, 4097] {
            let n = 4097, s = min(9, end), b = 2, blocks = n / 4
            for value: Float in [0, 1, .nan, .infinity] {
                let selection = QSASelection(q: MLXArray.full([b, s, 4, 16], values: MLXArray(value)),
                    pooled: MLXArray.ones([b, blocks, 16]),
                    blockStarts: MLXArray((0 ..< blocks).map { Int32($0 * 4) }),
                    offset: end - s, kvLen: n, ratio: 4, blockTopK: 512, headDim: 16)
                let ids = selection.compactBlocks(lo: 0, hi: s).asArray(Int32.self)
                var mask = [UInt8](repeating: 0, count: b * s * n)
                var unique = true
                for row in 0 ..< b * s {
                    let pos = end - s + row % s
                    let rowIDs = ids[row * 512 ..< (row + 1) * 512].filter { $0 < blocks }
                    unique = unique && Set(rowIDs).count == rowIDs.count
                    for id in rowIDs {
                        for key in Int(id) * 4 ..< Int(id) * 4 + 4 where key <= pos { mask[row * n + key] = 1 }
                    }
                    let own = ((pos + 1) / 4) * 4
                    for key in own ..< pos + 1 { mask[row * n + key] = 1 }
                }
                c.expect("compact IDs end \(end), value \(value): unique visible IDs", unique)
                c.expect("compact IDs end \(end), value \(value): exact reference keep set",
                    mask == selection.mask(lo: 0, hi: s, keyEnd: n).asType(.uint8).asArray(UInt8.self))
            }
        }

        // Float64 oracle consumes the actual rounded input arrays and a scalar
        // causal/selected key set, independently of the shader or MLX SDPA.
        for (b, h, hk, s, n) in [(1, 2, 1, 1, 1), (2, 4, 2, 8, 31), (1, 24, 2, 9, 33),
                                  (1, 2, 1, 17, 257), (1, 2, 1, 9, 2051), (1, 2, 1, 9, 4097)] {
            for dtype: DType in [.float32, .bfloat16] {
                for pattern in [0, 1, 2] {
                    let base = n - s, divisor: Float = pattern == 2 ? 4 : 64
                    let queryCount = b * h * s * 256, keyCount = b * hk * n * 256
                    let qa: [Float] = (0 ..< queryCount).map { (i: Int) -> Float in
                        let value = (i * 31 + 7) % 257 - 128
                        return pattern == 1 ? 0 : Float(value) / divisor
                    }
                    let ka: [Float] = (0 ..< keyCount).map { (i: Int) -> Float in
                        let value = (i * 43 + 13) % 263 - 131
                        return Float(value) / divisor
                    }
                    let va: [Float] = (0 ..< keyCount).map { (i: Int) -> Float in
                        let value = (i * 59 + 17) % 269 - 134
                        return Float(value) / Float(64)
                    }
                    // Force a noncontiguous view and let the wrapper own the
                    // contiguous input lifetimes for the asynchronous kernel.
                    let rawQ = MLXArray(qa, [b, h, s, 256]).asType(dtype)
                    let q = contiguous(rawQ.transposed(0, 1, 3, 2)).transposed(0, 1, 3, 2)
                    let k = MLXArray(ka, [b, hk, n, 256]).asType(dtype)
                    let v = MLXArray(va, [b, hk, n, 256]).asType(dtype)
                    if s <= 8 {
                        c.expect("short-query shape S\(s).\(dtype).pattern\(pattern) rejects prefill kernel",
                            !SelectedAttention.supported(q: q, k: k, v: v, base: base, blocks: nil))
                        let reference = MLXFast.scaledDotProductAttention(queries: q, keys: k, values: v,
                            scale: 0.0625, mask: s > 1 ? .causal : .none)
                        let candidate = SelectedAttention.diagnosticProductionAttention(q: q, k: k, v: v, base: base)
                        c.expect("short-query S\(s).\(dtype).pattern\(pattern): exact production fallback",
                            (reference .== candidate).all().item(Bool.self))
                        continue
                    }
                    let qv = q.asType(.float32).asArray(Float.self).map(Double.init)
                    let kv = k.asType(.float32).asArray(Float.self).map(Double.init)
                    let vv = v.asType(.float32).asArray(Float.self).map(Double.init)
                    for sparse in [false, true] {
                        let count = min(512, n / 4)
                        if sparse && count == 0 { continue }
                        // Reverse order makes the selected domain differ from
                        // chronological accumulation and includes future IDs.
                        let rowIDs = (0 ..< count).map { Int32(n / 4 - 1 - $0) }
                        let ids = sparse ? MLXArray(Array(repeating: rowIDs, count: b * s).flatMap { $0 }, [b, s, count]) : nil
                        var mask = [UInt8](repeating: 0, count: b * s * n)
                        for row in 0 ..< b * s {
                            let position = base + row % s, own = ((position + 1) / 4) * 4
                            if sparse {
                                for block in rowIDs where Int(block) * 4 + 3 <= position {
                                    for key in Int(block) * 4 ..< Int(block) * 4 + 4 { mask[row * n + key] = 1 }
                                }
                                for key in own ..< position + 1 { mask[row * n + key] = 1 }
                            } else { for key in 0 ... position { mask[row * n + key] = 1 } }
                        }
                        var oracle = [Double](repeating: 0, count: q.size)
                        for batch in 0 ..< b { for head in 0 ..< h { for row in 0 ..< s {
                            let qb = ((batch * h + head) * s + row) * 256
                            let kb = (batch * hk + head / (h / hk)) * n * 256
                            let visible = (0 ..< n).filter { mask[(batch * s + row) * n + $0] != 0 }
                            var scores = visible.map { key -> Double in
                                var dot = 0.0
                                for dim in 0 ..< 256 { dot += qv[qb + dim] * kv[kb + key * 256 + dim] }
                                return dot / 16
                            }
                            let maximum = scores.max()!, total = scores.reduce(0) { $0 + exp($1 - maximum) }
                            for i in scores.indices { scores[i] = exp(scores[i] - maximum) / total }
                            for (i, key) in visible.enumerated() {
                                for dim in 0 ..< 256 { oracle[qb + dim] += scores[i] * vv[kb + key * 256 + dim] }
                            }
                        } } }
                        func error(_ value: MLXArray) -> Double {
                            let array = value.asType(.float32).asArray(Float.self)
                            guard value.shape == q.shape, array.allSatisfy(\.isFinite) else { return .infinity }
                            return zip(array, oracle).reduce(0) { max($0, abs(Double($1.0) - $1.1)) }
                        }
                        let explicitMask = MLXArray(mask, [b, 1, s, n]).asType(.bool)
                        let reference = MLXFast.scaledDotProductAttention(queries: q, keys: k, values: v, scale: 0.0625, mask: .array(explicitMask))
                        let got = SelectedAttention.execute(q: q, k: k, v: v, base: base, blocks: ids)
                        let re = error(reference), ce = error(got)
                        let label = "B\(b).H\(h).HK\(hk).S\(s).N\(n).\(dtype).pattern\(pattern).sparse\(sparse)"
                        c.measure(label + ".reference_error", re); c.measure(label + ".candidate_error", ce)
                        c.expect(label + ": Float64 oracle band", re.isFinite && ce.isFinite && ce <= max(3 * re, dtype == .float32 ? 1e-5 : 0.01))
                        c.expect(label + ": repeatable output", (got .== SelectedAttention.execute(q: q, k: k, v: v, base: base, blocks: ids)).all().item(Bool.self))
                    }
                }
            }
        }
        let q = MLXArray.zeros([1, 24, 9, 256], dtype: .bfloat16)
        let k = MLXArray.zeros([1, 2, 32, 256], dtype: .bfloat16)
        c.expect("negative base rejected", !SelectedAttention.supported(q: q, k: k, v: k, base: -1, blocks: nil))
        c.expect("keys cannot end before queries", !SelectedAttention.supported(q: q, k: k, v: k, base: 31, blocks: nil))
        c.expect("mismatched dtype rejected", !SelectedAttention.supported(q: q, k: k, v: k.asType(.float32), base: 0, blocks: nil))
        c.expect("wrong head dimension rejected", !SelectedAttention.supported(q: q[0..., 0..., 0..., ..<128], k: k, v: k, base: 0, blocks: nil))
        c.expect("wrong selection shape rejected", !SelectedAttention.supported(q: q, k: k, v: k, base: 0, blocks: MLXArray.zeros([1, 8, 1], dtype: .int32)))
        for dtype: DType in [.float32, .bfloat16] {
            let query = MLXArray.zeros([1, 2, 9, 256], dtype: dtype)
            let key = MLXArray.zeros([1, 1, 32, 256], dtype: dtype)
            let values = MLXArray((0 ..< 32 * 256).map { Float($0 % 131) / 64 }, [1, 1, 32, 256]).asType(dtype)
            let sentinels = MLXArray(Array(repeating: Int32(8), count: 9), [1, 9, 1])
            var mask = [UInt8](repeating: 0, count: 9 * 32)
            for row in 0 ..< 9 {
                for pos in ((row + 1) / 4) * 4 ..< row + 1 { mask[row * 32 + pos] = 1 }
            }
            let reference = MLXFast.scaledDotProductAttention(queries: query, keys: key, values: values,
                scale: 0.0625, mask: .array(MLXArray(mask, [1, 1, 9, 32]).asType(.bool)))
            let candidate = SelectedAttention.execute(q: query, k: key, v: values, base: 0, blocks: sentinels)
            let maskedRows = MLXArray([Int32(3), Int32(7)])
            let delta = abs(take(candidate, maskedRows, axis: 2).asType(.float32)
                - take(reference, maskedRows, axis: 2).asType(.float32)).max().item(Float.self)
            c.expect("all-masked rows retain finite-minimum uniform semantics \(dtype)", delta.isFinite && delta <= (dtype == .float32 ? 1e-5 : 0.01))
        }
        return c.report()
    }
}
