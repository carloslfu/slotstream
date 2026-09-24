import Foundation
import MLX
import MLXFast

/// Weights-free proofs of the two verify-pass controls on synthetic tensors,
/// for the check catalogue: with the row path on, a matmul over k rows equals
/// the same path over each row alone, bit for bit, on every dense shape the
/// model has; and each row of the split verify attention equals a one-row
/// attention pass over the keys that row's position holds. Values are
/// heavy-tailed (a normal times a log-normal scale, like residual streams)
/// from a seeded generator, several seeds per case.
package enum VerifyPassSelfCheck {
    package struct Result {
        package let name: String
        package let passed: Bool
    }

    /// Seeded heavy-tailed values: normal times exp(1.5 x normal), Box-Muller
    /// over a 64-bit LCG.
    static func values(_ shape: [Int], seed: UInt64, dtype: DType, scale: Float = 1) -> MLXArray {
        let count = shape.reduce(1, *)
        var state = seed &* 0x9E37_79B9_7F4A_7C15 &+ 0x2545_F491_4F6C_DD1D
        func uniform() -> Double {
            state = state &* 6_364_136_223_846_793_005 &+ 1_442_695_040_888_963_407
            return (Double(state >> 11) + 0.5) / Double(1 << 53)
        }
        func normal() -> Double {
            sqrt(-2 * log(uniform())) * cos(2 * Double.pi * uniform())
        }
        var out = [Float](repeating: 0, count: count)
        for i in 0 ..< count { out[i] = Float(normal() * exp(1.5 * normal())) * scale }
        return MLXArray(out, shape).asType(dtype)
    }

    /// The model's dense matmuls: the fp32 router, the bf16 GDN gate
    /// projections, shared-expert gate, indexer projection and inject weights.
    static let shapes: [(label: String, dtype: DType, k: Int, n: Int)] = [
        ("fp32 router 2560x512", .float32, 2560, 512),
        ("bf16 GDN gate 2560x48", .bfloat16, 2560, 48),
        ("bf16 shared-expert gate 2560x1", .bfloat16, 2560, 1),
        ("bf16 indexer 2560x640", .bfloat16, 2560, 640),
        ("bf16 inject 10240x4", .bfloat16, 10240, 4),
    ]
    static let seeds: [UInt64] = [1, 2, 3, 4, 5, 6]

    /// Every dense shape, rows 2 to 8 against the same path one row at a
    /// time, plus the fallback above eight rows.
    package static func matmulRows() -> [Result] {
        let previous = RowInvariantMatmul.enabled
        RowInvariantMatmul.enabled = true
        defer { RowInvariantMatmul.enabled = previous }
        var results: [Result] = []
        for (label, dtype, k, n) in shapes {
            var exact = true
            var engaged = true
            for seed in seeds {
                let w = values([n, k], seed: seed, dtype: dtype, scale: 0.05).transposed()
                for rows in [2, 3, 5, RowInvariantMatmul.maxRows] {
                    let x = values([1, rows, k], seed: seed &* 100 &+ UInt64(rows), dtype: dtype)
                    let before = RowInvariantMatmul.calls
                    let many = RowInvariantMatmul.rows(x, w)
                    var ones: [MLXArray] = []
                    for r in 0 ..< rows { ones.append(RowInvariantMatmul.rows(x[0..., r ..< r + 1, 0...], w)) }
                    let single = concatenated(ones, axis: 1)
                    eval(many, single)
                    engaged = engaged && RowInvariantMatmul.calls == before + 1 + rows
                    exact = exact && many.shape == [1, rows, n] && (many .== single).all().item(Bool.self)
                }
            }
            results.append(Result(name: "\(label): rows 2 to \(RowInvariantMatmul.maxRows) equal the path one row at a time, \(seeds.count) seeds", passed: exact))
            results.append(Result(name: "\(label): every row count from one to \(RowInvariantMatmul.maxRows) took the row path", passed: engaged))
            let w = values([n, k], seed: 99, dtype: dtype, scale: 0.05).transposed()
            let wide = values([1, RowInvariantMatmul.maxRows + 1, k], seed: 98, dtype: dtype)
            let before = RowInvariantMatmul.calls
            let fallback = RowInvariantMatmul.rows(wide, w)
            results.append(Result(name: "\(label): \(RowInvariantMatmul.maxRows + 1) rows keep the stock matmul",
                passed: RowInvariantMatmul.calls == before && (fallback .== matmul(wide, w)).all().item(Bool.self)))
        }
        return results
    }

    /// How often the stock arithmetic at several rows differs from the stock
    /// one-row matmul on the same inputs, per shape (rows 2, 3, 5 and 8 over
    /// every seed), and the stock three-row attention's largest deviation.
    /// Nonzero values show the checks above can fail on this backend.
    package static func stockDeviation() -> [(name: String, value: Double)] {
        let previous = RowInvariantMatmul.enabled
        RowInvariantMatmul.enabled = false
        defer { RowInvariantMatmul.enabled = previous }
        var out: [(name: String, value: Double)] = []
        for (label, dtype, k, n) in shapes {
            var differing = 0, cases = 0
            for seed in seeds {
                let w = values([n, k], seed: seed, dtype: dtype, scale: 0.05).transposed()
                for rows in [2, 3, 5, 8] {
                    let x = values([1, rows, k], seed: seed &* 100 &+ UInt64(rows), dtype: dtype)
                    let many = matmul(x, w)
                    let single = concatenated((0 ..< rows).map { matmul(x[0..., $0 ..< $0 + 1, 0...], w) }, axis: 1)
                    cases += 1
                    if !(many .== single).all().item(Bool.self) { differing += 1 }
                }
            }
            let key = label.replacingOccurrences(of: " ", with: "_")
            out.append((name: "stock_matmul_\(key)_cases_differing_of_\(cases)", value: Double(differing)))
        }
        let (h, hk, d, base, rows) = (24, 2, 256, 61, 3)
        let keys = base + rows
        let q = values([1, h, rows, d], seed: 7, dtype: .bfloat16, scale: 0.3)
        let kk = values([1, hk, keys, d], seed: 8, dtype: .bfloat16, scale: 0.3)
        let v = values([1, hk, keys, d], seed: 9, dtype: .bfloat16)
        let dense = MLXFast.scaledDotProductAttention(queries: q, keys: kk, values: v, scale: 1 / 16, mask: .causal)
        var worst: Float = 0
        for r in 0 ..< rows {
            let end = base + r + 1
            let one = MLXFast.scaledDotProductAttention(
                queries: q[0..., 0..., r ..< r + 1, 0...], keys: kk[0..., 0..., 0 ..< end, 0...],
                values: v[0..., 0..., 0 ..< end, 0...], scale: 1 / 16, mask: .none)
            worst = max(worst, abs(dense[0..., 0..., r ..< r + 1, 0...].asType(.float32) - one.asType(.float32)).max().item(Float.self))
        }
        out.append((name: "stock_attention_3_rows_max_abs_delta", value: Double(worst)))
        return out
    }

    /// Attention at the model's geometry (24 query heads, 2 key heads, head
    /// size 256, bf16) for 3, 4 and 8 rows over a short context, with no
    /// selection (the split builds a causal mask; a one-row pass uses none)
    /// and with a boolean selection mask that hides whole key blocks.
    package static func splitRows() -> [Result] {
        var results: [Result] = []
        let (h, hk, d, base) = (24, 2, 256, 61)
        let scale: Float = 1 / 16
        for rows in [3, 4, 8] {
            let keys = base + rows
            var exactNone = true, exactMask = true, engaged = true
            for seed in seeds.prefix(3) {
                let q = values([1, h, rows, d], seed: seed &* 10 &+ 1, dtype: .bfloat16, scale: 0.3)
                let k = values([1, hk, keys, d], seed: seed &* 10 &+ 2, dtype: .bfloat16, scale: 0.3)
                let v = values([1, hk, keys, d], seed: seed &* 10 &+ 3, dtype: .bfloat16)
                // A selection: keys in blocks of 4, three blocks hidden from every row, causal on top.
                let positions = MLXArray((0 ..< keys).map { Int32($0) })
                let last = MLXArray((0 ..< rows).map { Int32(base + $0) })
                let causal = positions.expandedDimensions(axis: 0) .<= last.expandedDimensions(axis: 1)
                let block = floorDivide(positions, MLXArray(Int32(4)))
                let hidden = [Int32(seed % 5) + 1, Int32(seed % 5) + 6, Int32(seed % 5) + 11]
                let visible = (block .!= MLXArray(hidden[0])) .&& (block .!= MLXArray(hidden[1])) .&& (block .!= MLXArray(hidden[2]))
                let selected = (causal .&& visible.expandedDimensions(axis: 0)).reshaped([1, 1, rows, keys])
                for sparse in [MLXArray?.none, Optional(selected)] {
                    var calls = 0
                    let got = QSAAttention.attend(q: q, k: k, v: v, sparse: sparse, base: base, scale: scale,
                        block: 1024, splitRows: true, onSplit: { calls += 1 })
                    eval(got)
                    engaged = engaged && calls == 1
                    var exact = true
                    for r in 0 ..< rows {
                        let end = base + r + 1
                        let mask: MLXFast.ScaledDotProductAttentionMaskMode
                        if let sparse { mask = .array(sparse[0..., 0..., r ..< r + 1, 0 ..< end]) } else { mask = .none }
                        let one = MLXFast.scaledDotProductAttention(
                            queries: q[0..., 0..., r ..< r + 1, 0...], keys: k[0..., 0..., 0 ..< end, 0...],
                            values: v[0..., 0..., 0 ..< end, 0...], scale: scale, mask: mask)
                        exact = exact && (got[0..., 0..., r ..< r + 1, 0...] .== one).all().item(Bool.self)
                    }
                    if sparse == nil { exactNone = exactNone && exact } else { exactMask = exactMask && exact }
                }
            }
            results.append(Result(name: "\(rows) rows took the split path", passed: engaged))
            results.append(Result(name: "\(rows) rows, no selection: every split row equals the one-row pass at its position", passed: exactNone))
            results.append(Result(name: "\(rows) rows, selection mask: every split row equals the one-row pass at its position", passed: exactMask))
        }
        return results
    }

    /// Key counts at which the pinned backend starts another attention
    /// kernel variant or block layout for one or two query rows at GQA 12:
    /// the two-pass kernel from 1,024 keys on Pro, Max and Ultra GPUs and
    /// from 4,096 on the others; new block counts above 1,024, 8,192, 32,768
    /// and 65,536 keys (Pro) and from 16,384 and 65,536 (Ultra).
    static let kernelBoundaries = [1024, 1025, 4096, 8193, 16384, 32769, 65536, 65537]

    /// Gaussian values with a log-normal scale on the GPU, for tensors too
    /// large for the host generator; deterministic for a seed.
    static func deviceValues(_ shape: [Int], seed: UInt64, dtype: DType, scale: Float = 1) -> MLXArray {
        let (a, b) = MLXRandom.split(key: MLXRandom.key(seed))
        let g = clip(MLXRandom.normal(shape, key: a), min: -6, max: 6)
        // Bounded tails keep every product finite in bf16.
        let spread = exp(1.5 * clip(MLXRandom.normal(shape, key: b), min: -4, max: 4))
        let out = (g * spread * scale).asType(dtype)
        eval(out)
        return out
    }

    /// The exact mode's attention across every kernel boundary, for 2, 3 and
    /// 5 rows whose last row sits on the boundary: each row equals the
    /// one-row pass at its position, with no selection and with a block
    /// selection. The split rows over the same inputs are counted, not
    /// required: a row whose own key count lies on the other side of a
    /// boundary from the pass's can round differently.
    package static func exactRows() -> (results: [Result], splitDiffering: [Int: Int], splitCompared: [Int: Int]) {
        var results: [Result] = []
        var splitDiffering: [Int: Int] = [:], splitCompared: [Int: Int] = [:]
        let (h, hk, d) = (24, 2, 256)
        let scale: Float = 1 / 16
        for (index, keys) in kernelBoundaries.enumerated() {
            let seed = UInt64(index) &* 31 &+ 17
            let k = deviceValues([1, hk, keys, d], seed: seed, dtype: .bfloat16, scale: 0.3)
            let v = deviceValues([1, hk, keys, d], seed: seed &+ 1, dtype: .bfloat16)
            let qAll = deviceValues([1, h, MultiRowAttention.exactMaxRows, d], seed: seed &+ 2, dtype: .bfloat16, scale: 0.3)
            var exactNone = true, exactMask = true
            for rows in [2, 3, MultiRowAttention.exactMaxRows] {
                let base = keys - rows
                let q = qAll[0..., 0..., 0 ..< rows, 0...]
                let positions = MLXArray((0 ..< keys).map { Int32($0) })
                let last = MLXArray((0 ..< rows).map { Int32(base + $0) })
                let causal = positions.expandedDimensions(axis: 0) .<= last.expandedDimensions(axis: 1)
                let block = floorDivide(positions, MLXArray(Int32(4)))
                let visible = floorDivide(block, MLXArray(Int32(7))) % MLXArray(Int32(3)) .!= MLXArray(Int32(1))
                let selected = (causal .&& visible.expandedDimensions(axis: 0)).reshaped([1, 1, rows, keys])
                for masked in [false, true] {
                    let masks: [MLXArray?] = (0 ..< rows).map {
                        masked ? selected[0..., 0..., $0 ..< $0 + 1, 0 ..< base + $0 + 1] : nil
                    }
                    let exact = MultiRowAttention.exactRows(q: q, k: k, v: v, base: base, scale: scale, masks: masks)
                    let split = QSAAttention.attend(q: q, k: k, v: v, sparse: masked ? selected : nil,
                        base: base, scale: scale, block: 1024, splitRows: true)
                    eval(exact, split)
                    for r in 0 ..< rows {
                        let end = base + r + 1
                        let mask: MLXFast.ScaledDotProductAttentionMaskMode
                        if let m = masks[r] { mask = .array(m) } else { mask = .none }
                        let one = MLXFast.scaledDotProductAttention(
                            queries: q[0..., 0..., r ..< r + 1, 0...], keys: k[0..., 0..., 0 ..< end, 0...],
                            values: v[0..., 0..., 0 ..< end, 0...], scale: scale, mask: mask)
                        let same = (exact[0..., 0..., r ..< r + 1, 0...] .== one).all().item(Bool.self)
                        if masked { exactMask = exactMask && same } else { exactNone = exactNone && same }
                        if rows >= MultiRowAttention.minRows {
                            splitCompared[keys, default: 0] += 1
                            if !(split[0..., 0..., r ..< r + 1, 0...] .== one).all().item(Bool.self) {
                                splitDiffering[keys, default: 0] += 1
                            }
                        }
                    }
                }
            }
            results.append(Result(name: "\(keys) keys, no selection: every exact row of 2, 3 and \(MultiRowAttention.exactMaxRows) row passes equals the one-row pass at its position", passed: exactNone))
            results.append(Result(name: "\(keys) keys, selection mask: every exact row of 2, 3 and \(MultiRowAttention.exactMaxRows) row passes equals the one-row pass at its position", passed: exactMask))
        }
        return (results, splitDiffering, splitCompared)
    }

    /// The exact mode's indexer selection: for each row of a three-row pass
    /// across a block boundary, `QSASelection.row` gives the mask a one-row
    /// pass at that position prepares from fresh arrays, while 138 blocks
    /// share one key so the kept set is decided by tie order at the budget.
    /// The whole-pass selection's rows are counted against the same masks.
    package static func indexerRows() -> (results: [Result], batchedDiffering: Int, compared: Int,
                                          scoresDiffering: Int) {
        let (heads, dim, ratio, budget) = (4, 128, 4, 2048)
        let (base, rows) = (2206, 3)
        let blocks = (base + rows) / ratio
        var batchedDiffering = 0, compared = 0, scoresDiffering = 0
        var exact = true, engaged = true
        for seed in seeds.prefix(3) {
            let q = (abs(values([1, rows, heads, dim], seed: seed &* 10 &+ 4, dtype: .float32)) * 0.2 + 0.1).asType(.bfloat16)
            // Keys: high (entries 2 to 3), one shared tied key (all ones) and low (0 to 0.5).
            let uniform = abs(values([1, blocks, dim], seed: seed &* 10 &+ 5, dtype: .float32))
            let unit = uniform / (uniform.max() + 1)
            let ids = MLXArray((0 ..< blocks).map { Int32($0) }).reshaped([1, blocks, 1])
            let tied = (ids % MLXArray(Int32(4))) .== MLXArray(Int32(1))
            let low = (ids % MLXArray(Int32(16))) .== MLXArray(Int32(3))
            let pooled = which(tied, MLXArray(Float(1)), which(low, unit * 0.5, unit + 2)).asType(.bfloat16)
            let starts = MLXArray((0 ..< blocks).map { Int32($0 * ratio) })
            let pass = QSASelection(q: q, pooled: pooled, blockStarts: starts, offset: base,
                kvLen: base + rows, ratio: ratio, blockTopK: budget / ratio, headDim: dim)
            let whole = pass.mask(lo: 0, hi: rows, keyEnd: base + rows)
            for r in 0 ..< rows {
                let keys = base + r + 1
                let own = keys / ratio
                guard let row = pass.row(r, budget: budget) else { engaged = false; continue }
                let fresh = QSASelection(
                    q: contiguous(q[0..., r ..< r + 1, 0..., 0...]), pooled: contiguous(pooled[0..., 0 ..< own, 0...]),
                    blockStarts: MLXArray((0 ..< own).map { Int32($0 * ratio) }), offset: base + r,
                    kvLen: keys, ratio: ratio, blockTopK: budget / ratio, headDim: dim)
                let reference = fresh.mask(lo: 0, hi: 1, keyEnd: keys)
                let got = row.mask(lo: 0, hi: 1, keyEnd: keys)
                exact = exact && got.shape == reference.shape && (got .== reference).all().item(Bool.self)
                compared += 1
                if !(whole[0..., 0..., r ..< r + 1, 0 ..< keys] .== reference).all().item(Bool.self) { batchedDiffering += 1 }
                // The block scores themselves, at the whole pass's shapes and at the row's.
                let wholeScores = einsum("bshd,bnd->bsnh", q.asType(.float32), pooled.asType(.float32))
                let rowScores = einsum("bshd,bnd->bsnh", contiguous(q[0..., r ..< r + 1, 0..., 0...]).asType(.float32),
                    contiguous(pooled[0..., 0 ..< own, 0...]).asType(.float32))
                if !(wholeScores[0..., r ..< r + 1, 0 ..< own, 0...] .== rowScores).all().item(Bool.self) { scoresDiffering += 1 }
            }
        }
        let below = QSASelection(q: MLXArray.zeros([1, 1, heads, dim]), pooled: MLXArray.zeros([1, 512, dim]),
            blockStarts: MLXArray((0 ..< 512).map { Int32($0 * ratio) }), offset: budget - 1,
            kvLen: budget + 1, ratio: ratio, blockTopK: budget / ratio, headDim: dim)
        return ([
            Result(name: "each row of a three-row pass across a block boundary selects what a one-row pass at its position selects, with tied blocks at the budget", passed: exact && engaged),
            Result(name: "a row whose one-row pass fits the indexer budget has no selection", passed: below.row(0, budget: budget) == nil),
        ], batchedDiffering, compared, scoresDiffering)
    }

    /// Quantized matmuls in the model's format (4 bits, groups of 64): one to
    /// `exactMaxRows` rows equal the same product one row at a time, for an
    /// output in each of the backend's batch-limit classes. Exact mode owns
    /// row-by-row quantized projections because MLX 0.32 changes kernels even
    /// below five rows. Stock six-to-eight-row deviations remain diagnostic.
    package static func quantizedRows() -> (results: [Result], wideDiffering: Int, wideCompared: Int) {
        var results: [Result] = []
        var wideDiffering = 0, wideCompared = 0
        let savedMode = RowInvariantMatmul.enabled
        defer { RowInvariantMatmul.enabled = savedMode }
        let cases: [(label: String, k: Int, n: Int)] = [
            ("2560x640", 2560, 640), ("2560x6144", 2560, 6144), ("10240x2560", 10240, 2560),
        ]
        for (index, (label, k, n)) in cases.enumerated() {
            let (wq, scales, biases) = quantized(
                deviceValues([n, k], seed: 700 &+ UInt64(index), dtype: .bfloat16, scale: 0.02), groupSize: 64, bits: 4)
            let x = deviceValues([1, RowInvariantMatmul.maxRows, k], seed: 800 &+ UInt64(index), dtype: .bfloat16)
            eval([wq, scales] + (biases.map { [$0] } ?? []))
            func product(_ a: MLXArray) -> MLXArray {
                quantizedMM(a, wq, scales: scales, biases: biases, transpose: true, groupSize: 64, bits: 4)
            }
            let linear = QLinear(w: wq, scales: scales, biases: biases, groupSize: 64, bits: 4)
            RowInvariantMatmul.enabled = false
            results.append(Result(name: "4-bit \(label): disabled mode preserves stock products",
                passed: (linear(x) .== product(x)).all().item(Bool.self)))
            RowInvariantMatmul.enabled = true
            let single = (0 ..< RowInvariantMatmul.maxRows).map { product(x[0..., $0 ..< $0 + 1, 0...]) }
            var exact = true
            for rows in 1 ... RowInvariantMatmul.maxRows {
                let many = rows <= MultiRowAttention.exactMaxRows
                    ? linear(x[0..., 0 ..< rows, 0...]) : product(x[0..., 0 ..< rows, 0...])
                eval(many)
                let same = (many .== concatenated(Array(single[0 ..< rows]), axis: 1)).all().item(Bool.self)
                if rows <= MultiRowAttention.exactMaxRows { exact = exact && same }
                else { wideCompared += 1; if !same { wideDiffering += 1 } }
            }
            results.append(Result(name: "4-bit \(label): 1 to \(MultiRowAttention.exactMaxRows) rows equal the product one row at a time", passed: exact))
        }
        return (results, wideDiffering, wideCompared)
    }
}
