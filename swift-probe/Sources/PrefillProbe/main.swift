// Prefill transient probes: the two bounds the pass needs before it can grow.
//
// The prefill pass is chunked because its transients scale with the chunk, and
// the chunk count is what multiplies expert reads (a pass re-reads nearly the
// whole routed expert set, so bytes ~ passes). Two transients scale with the
// chunk and neither is bounded today:
//
//   moe   — MoELayer.sweep returns (B,S,K,H) and the combine holds up to three
//           copies of it. K=10, so that is 51.2 KB per token per copy. The
//           alternative is a weighted scatter-add into a (B*S,H) accumulator
//           per staging group, which never materialises the K axis.
//   idx   — AttentionTuning.queryBlock blocks the SDPA, but QSAIndexer, which
//           produces its mask, runs over the whole pass: scores is
//           S x (ctx/4) x 4 f32 and three S x ctx boolean masks. So the QSA
//           layer is still O(pass x context) and the query block bounds only
//           half of it.
//
// Neither probe needs model weights; shapes come from config.json.

import Foundation
import MLX
import MLXFast
import MLXNN
import MLXRandom

let H = 2560, K = 10, E = 512, GROUP = 32
let idxHeads = 4, idxHeadDim = 128, idxRatio = 4, idxBudget = 2048

func peakGB() -> Double { Double(MLX.Memory.peakMemory) / 1e9 }
func resetPeak() { MLX.Memory.peakMemory = 0 }
func gb(_ b: Int) -> String { String(format: "%.2f GB", Double(b) / 1e9) }

// ---------------------------------------------------------------- routing
/// A plausible routed set: skewed like the real trace (top 10% of experts take
/// ~70% of the uses), K distinct experts per token, then the engine's counting
/// sort by expert id.
func routing(tokens S: Int, seed: UInt64) -> (ids: [Int32], order: [Int32], inv: [Int32],
                                              start: [Int], present: [Int]) {
    var s = seed
    func next() -> Double { s = s &* 6364136223846793005 &+ 1442695040888963407; return Double(s >> 11) / Double(1 << 53) }
    // zipf-ish popularity
    let pop = (0 ..< E).map { 1.0 / pow(Double($0) + 2.0, 1.05) }
    let tot = pop.reduce(0, +)
    var cdf: [Double] = []; var acc = 0.0
    for p in pop { acc += p / tot; cdf.append(acc) }
    func draw() -> Int {
        let u = next(); var lo = 0, hi = E - 1
        while lo < hi { let m = (lo + hi) / 2; if cdf[m] < u { lo = m + 1 } else { hi = m } }
        return lo
    }
    var ids = [Int32](repeating: 0, count: S * K)
    for t in 0 ..< S {
        var seen = Set<Int>()
        for k in 0 ..< K { var e = draw(); while seen.contains(e) { e = draw() }; seen.insert(e); ids[t * K + k] = Int32(e) }
    }
    var count = [Int](repeating: 0, count: E)
    for e in ids { count[Int(e)] += 1 }
    var start = [Int](repeating: 0, count: E + 1)
    for e in 0 ..< E { start[e + 1] = start[e] + count[e] }
    var fill = start
    var order = [Int32](repeating: 0, count: ids.count)
    for (r, e) in ids.enumerated() { order[fill[Int(e)]] = Int32(r); fill[Int(e)] += 1 }
    var inv = [Int32](repeating: 0, count: ids.count)
    for (i, r) in order.enumerated() { inv[Int(r)] = Int32(i) }
    return (ids, order, inv, start, (0 ..< E).filter { count[$0] > 0 })
}

// ------------------------------------------------------------------- moe
func moeProbe(tokens S: Int, rounds: Int) {
    let (_, order, inv, start, present) = routing(tokens: S, seed: 0xC0FFEE &+ UInt64(S))
    let rows = S * K
    let tokenOf = order.map { $0 / Int32(K) }
    // per-row routing weight, in original row order (softmax over K)
    var w = [Float](repeating: 0, count: rows)
    var st: UInt64 = 12345
    for t in 0 ..< S {
        var e = [Float](repeating: 0, count: K); var sum: Float = 0
        for k in 0 ..< K { st = st &* 6364136223846793005 &+ 1442695040888963407
            e[k] = expf(Float(Double(st >> 11) / Double(1 << 53)) * 2 - 1); sum += e[k] }
        for k in 0 ..< K { w[t * K + k] = e[k] / sum }
    }
    let wSorted = order.map { w[Int($0)] }
    // group boundaries exactly as MoELayer.sweep walks them
    var groups: [(lo: Int, hi: Int, rowLo: Int, rowHi: Int)] = []
    var g = 0
    while g < present.count {
        let hi = min(g + GROUP, present.count)
        groups.append((g, hi, start[present[g]], start[present[hi - 1] + 1]))
        g = hi
    }
    // Synthetic per-group expert outputs, exactly the shapes the GEMM emits.
    // Generated per group by a closure: path A must keep every group alive
    // until the concatenate, path B must not, and that difference IS the
    // finding — so the probe must not hand both arms a prebuilt array.
    func makeGroup(_ i: Int, _ seed: Int) -> MLXArray {
        MLXRandom.key(UInt64(seed &* 1000 &+ i)).asType(.uint32)
        return MLXRandom.normal([groups[i].rowHi - groups[i].rowLo, 1, H]).asType(.bfloat16)
    }
    let weightsBSK = MLXArray(w, [1, S, K]).asType(.bfloat16)
    let invA = MLXArray(inv)
    let tokIdx = groups.map { MLXArray(Array(tokenOf[$0.rowLo ..< $0.rowHi])) }
    let wG = groups.map { MLXArray(Array(wSorted[$0.rowLo ..< $0.rowHi])) }

    print(String(format: "  pass %5d tokens | rows %6d | groups %2d | routed experts %3d | (B,S,K,H) = %@",
                 S, rows, groups.count, present.count, gb(S * K * H * 2)))

    // --- A: what ships today. Every group stays alive to the concatenate.
    var tA = 0.0, pA = 0.0
    for r in 0 ..< rounds {
        resetPeak(); let t0 = Date()
        var outs: [MLXArray] = []
        for i in groups.indices { outs.append(makeGroup(i, r)) }
        let all = concatenated(outs, axis: 0).squeezed(axis: 1)
        let experts = all[invA].reshaped([1, S, K, H])
        let out = (experts * weightsBSK.expandedDimensions(axis: -1)).sum(axis: -2).asType(.bfloat16)
        eval(out)
        tA += -t0.timeIntervalSinceNow; pA = max(pA, peakGB())
    }

    // --- B: weighted scatter-add per group; a group dies as soon as it folds.
    var tB = 0.0, pB = 0.0
    for r in 0 ..< rounds {
        resetPeak(); let t0 = Date()
        var accum = MLXArray.zeros([S, H], dtype: .float32)
        for i in groups.indices {
            let o = makeGroup(i, r)
            accum = accum.at[tokIdx[i]].add(
                o.squeezed(axis: 1).asType(.float32) * wG[i].expandedDimensions(axis: -1))
            eval(accum)  // fold now, so the group's rows are released now
        }
        let out = accum.reshaped([1, S, H]).asType(.bfloat16)
        eval(out)
        tB += -t0.timeIntervalSinceNow; pB = max(pB, peakGB())
    }

    // --- exactness on ONE identical input, against an f32 reference
    var fixed: [MLXArray] = []
    for i in groups.indices { fixed.append(makeGroup(i, 777)) }
    eval(fixed)
    let allF = concatenated(fixed, axis: 0).squeezed(axis: 1)
    let outA = (allF[invA].reshaped([1, S, K, H]) * weightsBSK.expandedDimensions(axis: -1))
        .sum(axis: -2).asType(.float32)
    let outRef = (allF[invA].reshaped([1, S, K, H]).asType(.float32)
        * weightsBSK.expandedDimensions(axis: -1).asType(.float32)).sum(axis: -2)
    var accF = MLXArray.zeros([S, H], dtype: .float32)
    for (i, o) in fixed.enumerated() {
        accF = accF.at[tokIdx[i]].add(o.squeezed(axis: 1).asType(.float32) * wG[i].expandedDimensions(axis: -1))
    }
    let outB = accF.reshaped([1, S, H])
    let spread = (outRef.max() - outRef.min()).item(Float.self)
    let dA = abs(outA - outRef).max().item(Float.self)
    let dB = abs(outB - outRef).max().item(Float.self)
    let dAB = abs(outA - outB).max().item(Float.self)

    print(String(format: "    A  keep all groups, (B,S,K,H) combine:  %6.1f ms   peak %5.2f GB", tA / Double(rounds) * 1000, pA))
    print(String(format: "    B  fold each group, scatter-add f32:    %6.1f ms   peak %5.2f GB   (x%.2f time, x%.2f peak, -%@)",
                 tB / Double(rounds) * 1000, pB, tB / tA, pB / max(pA, 1e-9), gb(Int((pA - pB) * 1e9))))
    print(String(format: "    vs an f32 reference: A err %.3e, B err %.3e, |A-B| %.3e of a %.3e spread (%.4f%%)",
                 dA, dB, dAB, spread, 100 * Double(dAB) / Double(spread)))
}

// ------------------------------------------------------------------- idx
func rope(_ pos: MLXArray, dim: Int, base: Float) -> (MLXArray, MLXArray) {
    let exps = MLXArray(stride(from: 0, to: Int32(dim), by: 2).map { Float($0) / Float(dim) })
    let inv = pow(MLXArray(base), -exps)
    let freqs = pos.asType(.float32).expandedDimensions(axis: -1) * inv
    let emb = concatenated([freqs, freqs], axis: -1)
    return (cos(emb), sin(emb))
}
func ropePartial(_ x: MLXArray, _ c: MLXArray, _ s: MLXArray) -> MLXArray {
    let d = c.dim(-1)
    let cc = c.asType(x.dtype), ss = s.asType(x.dtype)
    let xr = x[.ellipsis, 0 ..< d], xp = x[.ellipsis, d...]
    let half = d / 2
    let rot = concatenated([-xr[.ellipsis, half...], xr[.ellipsis, 0 ..< half]], axis: -1)
    let rotated = xr * cc + rot * ss
    return xp.dim(-1) > 0 ? concatenated([rotated, xp], axis: -1) : rotated
}

/// QSAIndexer's mask for queries [lo,hi) of a pass starting at `offset`,
/// against `kvLen` keys. Whole-pass when lo=0, hi=S.
func indexerMask(q: MLXArray, rawK: MLXArray, offset: Int, lo: Int, hi: Int) -> MLXArray {
    let kvLen = rawK.dim(1)
    let nBlocks = kvLen / idxRatio
    let blockTopK = idxBudget / idxRatio
    var pooled = rawK[0..., 0 ..< (nBlocks * idxRatio), 0...]
        .reshaped([1, nBlocks, idxRatio, idxHeadDim])
    pooled = pooled.asType(.float32).mean(axis: 2).asType(rawK.dtype)
    let blockStarts = MLXArray((0 ..< nBlocks).map { Int32($0 * idxRatio) })
    let (cK, sK) = rope(blockStarts.expandedDimensions(axis: 0), dim: idxHeadDim / 4 * 1, base: 1e7)
    pooled = ropePartial(pooled, cK, sK)
    let qPos = MLXArray((offset + lo ..< offset + hi).map { Int32($0) })
    let (cQ, sQ) = rope(qPos.expandedDimensions(axis: 0), dim: idxHeadDim / 4 * 1, base: 1e7)
    let qb = ropePartial(q[0..., lo ..< hi, 0..., 0...],
                         cQ.expandedDimensions(axis: 2), sQ.expandedDimensions(axis: 2))
    let S = hi - lo
    var scores = einsum("bshd,bnd->bsnh", qb.asType(.float32), pooled.asType(.float32))
    scores = maximum(scores, 0).sum(axis: -1) / Float(idxHeadDim).squareRoot()
    let blockEnd = blockStarts + Int32(idxRatio - 1)
    let visible = blockEnd.reshaped([1, 1, nBlocks]) .<= qPos.reshaped([1, S, 1])
    scores = which(visible, scores, MLXArray(-Float.infinity))
    let k = Swift.min(blockTopK, nBlocks)
    var top = argPartition(-scores, kth: k - 1, axis: -1)[.ellipsis, ..<k].asType(.int32)
    top = which(takeAlong(broadcast(visible, to: [1, S, nBlocks]), top, axis: -1), top, MLXArray(Int32(nBlocks)))
    var keepBlock = MLXArray.zeros([1, S, nBlocks + 1], dtype: .bool)
    keepBlock = putAlong(keepBlock, top, values: MLXArray(true), axis: -1)[.ellipsis, ..<nBlocks]
    var keep = repeated(keepBlock, count: idxRatio, axis: -1)
    let tail = kvLen - nBlocks * idxRatio
    if tail > 0 { keep = concatenated([keep, MLXArray.zeros([1, S, tail], dtype: .bool)], axis: -1) }
    let keyPos = MLXArray((0 ..< kvLen).map { Int32($0) }).reshaped([1, 1, kvLen])
    let qp = qPos.reshaped([1, S, 1])
    let ownBlockStart = ((qp + 1) / Int32(idxRatio)) * Int32(idxRatio)
    let ownTail = (keyPos .>= ownBlockStart) .&& (keyPos .<= qp)
    keep = (keep .|| ownTail) .&& (keyPos .<= qp)
    return keep.expandedDimensions(axis: 1)
}

func idxProbe(pass S: Int, context ctx: Int, blocks: [Int], budgetGB: Double) {
    let offset = ctx - S
    let nBlocks = ctx / idxRatio
    let predicted = Double(S) * Double(nBlocks) * Double(idxHeads) * 4 * 3 / 1e9
    print(String(format: "  pass %5d over %6d keys | scores %d x %d x %d f32 -> predicted ~%.2f GB",
                 S, ctx, S, nBlocks, idxHeads, predicted))
    let q = MLXRandom.normal([1, S, idxHeads, idxHeadDim]).asType(.bfloat16)
    let rawK = MLXRandom.normal([1, ctx, idxHeadDim]).asType(.bfloat16)
    eval(q, rawK)
    var whole: MLXArray? = nil
    if predicted <= budgetGB {
        resetPeak(); let t0 = Date()
        let m = indexerMask(q: q, rawK: rawK, offset: offset, lo: 0, hi: S); eval(m)
        let dt = -t0.timeIntervalSinceNow
        print(String(format: "    whole pass:            %7.1f ms   peak %5.2f GB", dt * 1000, peakGB()))
        whole = m
    } else {
        print(String(format: "    whole pass:            SKIPPED (predicted %.2f GB over the %.1f GB probe budget)", predicted, budgetGB))
    }
    for b in blocks where b < S {
        resetPeak(); let t0 = Date()
        var parts: [MLXArray] = []
        var lo = 0
        while lo < S {
            let hi = Swift.min(lo + b, S)
            let m = indexerMask(q: q, rawK: rawK, offset: offset, lo: lo, hi: hi)
            eval(m); parts.append(m); lo = hi
        }
        let cat = concatenated(parts, axis: 2); eval(cat)
        let dt = -t0.timeIntervalSinceNow
        var exact = "—"
        if let w = whole { exact = (cat .!= w).sum().item(Int.self) == 0 ? "bit-identical" : "DIFFERS" }
        print(String(format: "    blocked %4d:          %7.1f ms   peak %5.2f GB   %@", b, dt * 1000, peakGB(), exact))
    }
}

// ------------------------------------------------------------------- ple
// PLELayer runs at layer 1 only, but the phase trace names it as the pass's
// high-water mark (8.57 GB at a 2048-token pass against a 7.60 GB layer-end
// baseline) — the same height as unblocked attention, which is why blocking
// attention alone moved the process peak by 0.00 GB. Every op in it is
// per-token except the dilated short conv, which carries (k-1)*dilation rows.
// So it can be blocked with a carry. This probe asks whether that is exact and
// what it costs.
func rms(_ x: MLXArray, group g: Int) -> MLXArray {
    let shape = x.shape
    var v = x.reshaped(Array(shape.dropLast()) + [-1, g])
    let vf = v.asType(.float32)
    v = (vf * rsqrt(vf.square().mean(axis: -1, keepDims: true) + 1e-6)).asType(x.dtype)
    return v.reshaped(shape)
}
let hcCount = 4, pleConvK = 4, pleDilation = 3
let pleStateLen = (pleConvK - 1) * pleDilation

func pleBlock(emb: MLXArray, hidden: MLXArray, kW: MLXArray, vW: MLXArray,
              convW: MLXArray, carry: MLXArray) -> (MLXArray, MLXArray) {
    let S = emb.dim(1)
    var key = rms(matmul(emb, kW), group: H)
    let keyShape = [1, S, hcCount, H]
    key = key.reshaped(keyShape)
    let value = matmul(emb, vW)
    let query = rms(hidden, group: H).reshaped(keyShape)
    var gate = (key * query).sum(axis: -1, keepDims: true) / Float(H).squareRoot()
    gate = sqrt(maximum(abs(gate), 1e-6)) * sign(gate)
    var gated = sigmoid(gate) * value.expandedDimensions(axis: -2)
    gated = gated.reshaped([1, S, hcCount * H])
    let normed = rms(gated, group: H)
    let full = concatenated([carry, normed], axis: 1)
    let newCarry = full[0..., (full.dim(1) - pleStateLen)..., 0...]
    let window = full[0..., (full.dim(1) - (pleStateLen + S))..., 0...]
    let conv = MLXNN.silu(conv1d(window, convW, dilation: pleDilation, groups: convW.dim(0)))
    return (gated + conv, newCarry)
}

func pleProbe(tokens S: Int, blocks: [Int]) {
    let emb = MLXRandom.normal([1, S, H]).asType(.bfloat16)
    let hidden = MLXRandom.normal([1, S, hcCount * H]).asType(.bfloat16)
    let kW = (MLXRandom.normal([H, hcCount * H]) * 0.02).asType(.bfloat16)
    let vW = (MLXRandom.normal([H, H]) * 0.02).asType(.bfloat16)
    let convW = (MLXRandom.normal([hcCount * H, pleConvK, 1]) * 0.1).asType(.bfloat16)
    let zero = MLXArray.zeros([1, pleStateLen, hcCount * H], dtype: .bfloat16)
    eval(emb, hidden, kW, vW, convW, zero)
    print(String(format: "  pass %5d tokens | hidden (B,S,hc*H) = %@", S, gb(S * hcCount * H * 2)))
    resetPeak(); var t0 = Date()
    let (whole, _) = pleBlock(emb: emb, hidden: hidden, kW: kW, vW: vW, convW: convW, carry: zero)
    eval(whole)
    print(String(format: "    whole pass:     %7.1f ms   peak %5.2f GB", -t0.timeIntervalSinceNow * 1000, peakGB()))
    for b in blocks where b < S {
        resetPeak(); t0 = Date()
        var parts: [MLXArray] = []
        var carry = zero
        var lo = 0
        while lo < S {
            let hi = Swift.min(lo + b, S)
            let (o, c) = pleBlock(emb: emb[0..., lo ..< hi, 0...], hidden: hidden[0..., lo ..< hi, 0...],
                                  kW: kW, vW: vW, convW: convW, carry: carry)
            eval(o, c); parts.append(o); carry = c; lo = hi
        }
        let cat = concatenated(parts, axis: 1); eval(cat)
        let dt = -t0.timeIntervalSinceNow
        let bad = (cat .!= whole).sum().item(Int.self)
        print(String(format: "    blocked %4d:   %7.1f ms   peak %5.2f GB   %@", b, dt * 1000, peakGB(),
                     bad == 0 ? "bit-identical" : "DIFFERS in \(bad) elements"))
    }
}

// ------------------------------------------------------------------ main
let args = CommandLine.arguments
let mode = args.count > 1 ? args[1] : "all"
if mode == "moe" || mode == "all" {
    print("\n=== E4: MoE combine — (B,S,K,H) materialisation vs weighted scatter-add ===")
    for S in [1024, 2048, 4096] { moeProbe(tokens: S, rounds: 3) }
}
if mode == "ple" || mode == "all" {
    print("\n=== E6: PLE (layer 1) — whole pass vs blocked with a conv carry ===")
    for S in [1024, 2048, 4096] { pleProbe(tokens: S, blocks: [1024, 512, 256]) }
}
if mode == "idx" || mode == "all" {
    print("\n=== E5: QSA indexer — whole pass vs query-blocked (exactness + transient) ===")
    for (p, c) in [(2048, 8016), (4096, 8016), (4096, 16384), (4096, 32768)] {
        idxProbe(pass: p, context: c, blocks: [1024, 512, 256], budgetGB: 4.0)
    }
}
