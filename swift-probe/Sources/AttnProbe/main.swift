// QSA attention transient probe.
//
// The question: what does one prefill pass through a `full_attention` layer
// actually cost in transient memory, and can query sub-blocking bound it
// without changing the numbers?
//
// Why it should be expensive. MLX 0.31.1's `ScaledDotProductAttention::
// use_fallback` admits the fused prefill kernel only for head dims 64, 80 and
// 128 (`sdpa_full_supported_head_dim`). This model's QSA layers run at head
// dim 256, so every pass longer than 8 tokens takes the unfused path in
// fast.cpp, which materialises `scores = matmul(q, k^T)` at
// [B, n_kv, n_repeats, L_q, L_kv], then a same-sized `where(mask, ...)`, then
// a softmax over it. The transient therefore scales with pass x context, not
// with the pass alone -- which is what the prefill schedule works around by
// halving the pass as the context grows.
//
// Why sub-blocking should be exact. The fallback builds its causal mask as
// `arange(kL - qL, qL + (kL - qL)) >= arange(0, kL)`, i.e. queries align to
// the END of the keys. So a block of queries [lo, hi) of a pass that starts at
// context position `base` sees exactly keys [0, base + hi), and passing that
// slice with `.causal` reproduces the same mask rows. Each output row depends
// only on its own query and all keys, so the per-row math is unchanged; the
// only freedom is the reduction order the kernel picks for a different L_kv,
// which is what this probe measures rather than assumes.
//
// Nothing here needs model weights. Shapes come from config.json:
// 24 query heads, 2 KV heads, head dim 256.

import Foundation
import MLX
import MLXFast
import MLXRandom

// MARK: - geometry (config.json: text_config)

let numQHeads = 24
let numKVHeads = 2
let headDim = 256
let scale = 1.0 / Float(headDim).squareRoot()
let indexerBudget = 2048
let indexerCompressRatio = 4

// MARK: - options

struct Options {
    var rounds = 5
    /// Refuse any configuration whose predicted whole-pass transient exceeds
    /// this. The dev Mac is shared with live apps; a 4096-token pass over a
    /// 32k context would materialise ~19 GB and take the machine down.
    var budgetGB = 6.0
    var blocks = [1024, 512, 256, 128]
    /// Run only the blocked variants. The whole-pass arm at a long context
    /// would materialise several GB on a machine shared with live apps; this
    /// measures the arm we would actually ship without ever building it.
    var skipWhole = false
    var configs: [(pass: Int, context: Int)] = [
        (1024, 1024), (1024, 2048), (2048, 2048),
        (1024, 8016), (2048, 8016), (4096, 8016),
    ]
}

var opts = Options()
var args = Array(CommandLine.arguments.dropFirst())
var i = 0
while i < args.count {
    switch args[i] {
    case "--rounds": opts.rounds = Int(args[i + 1])!; i += 2
    case "--budget-gb": opts.budgetGB = Double(args[i + 1])!; i += 2
    case "--blocks": opts.blocks = args[i + 1].split(separator: ",").map { Int($0)! }; i += 2
    case "--skip-whole": opts.skipWhole = true; i += 1
    case "--config":
        let p = args[i + 1].split(separator: ":").map { Int($0)! }
        opts.configs = [(p[0], p[1])]
        i += 2
    default: i += 1
    }
}

// MARK: - helpers

func peakGB() -> Double { Double(MLX.Memory.peakMemory) / 1e9 }

/// One score matrix at [n_q_heads, L_q, L_kv] in bf16. The first version of
/// this probe charged three (matmul output, masked copy, softmax output) and
/// over-predicted the measured peak by 2.6x: MLX donates the buffer through
/// `where` and `softmax`, so about one is live at a time.
func predictedTransientGB(pass: Int, context: Int) -> Double {
    Double(numQHeads) * Double(pass) * Double(context) * 2.0 / 1e9
}

func median(_ xs: [Double]) -> Double {
    let s = xs.sorted()
    return s.count % 2 == 1 ? s[s.count / 2] : (s[s.count / 2 - 1] + s[s.count / 2]) / 2
}

/// Whole pass in one call, the way QSAAttention does it today.
func attnWhole(
    q: MLXArray, k: MLXArray, v: MLXArray, sparse: MLXArray?
) -> MLXArray {
    let mode: MLXFast.ScaledDotProductAttentionMaskMode =
        sparse.map { .array($0) } ?? .causal
    return MLXFast.scaledDotProductAttention(
        queries: q, keys: k, values: v, scale: scale, mask: mode)
}

/// The same pass in query blocks. `base` is the context the state already
/// held, so block [lo, hi) attends over keys [0, base + hi).
func attnBlocked(
    q: MLXArray, k: MLXArray, v: MLXArray, sparse: MLXArray?, base: Int, block: Int,
    evalEach: Bool = false
) -> MLXArray {
    let S = q.dim(2)
    if block >= S { return attnWhole(q: q, k: k, v: v, sparse: sparse) }
    var outs: [MLXArray] = []
    outs.reserveCapacity((S + block - 1) / block)
    var lo = 0
    while lo < S {
        let hi = Swift.min(lo + block, S)
        let kEnd = base + hi
        let qb = q[0..., 0..., lo ..< hi, 0...]
        let kb = k[0..., 0..., 0 ..< kEnd, 0...]
        let vb = v[0..., 0..., 0 ..< kEnd, 0...]
        let mode: MLXFast.ScaledDotProductAttentionMaskMode
        if let sp = sparse {
            mode = .array(sp[0..., 0..., lo ..< hi, 0 ..< kEnd])
        } else {
            mode = .causal
        }
        let o = MLXFast.scaledDotProductAttention(
            queries: qb, keys: kb, values: vb, scale: scale, mask: mode)
        // Without this, MLX builds the whole graph first and may keep several
        // blocks' score matrices alive at once, which defeats the point.
        if evalEach { eval(o) }
        outs.append(o)
        lo = hi
    }
    return concatenated(outs, axis: 2)
}

/// The indexer's keep-mask, in the shape QSAIndexer produces: [B, 1, S, kvLen]
/// boolean, causal, with each query keeping `budget/ratio` blocks of `ratio`
/// keys plus its own block. Built here from a deterministic pattern rather
/// than from real scores -- the probe measures the attention cost of carrying
/// such a mask, not the indexer's choice.
func syntheticKeepMask(pass: Int, context: Int, base: Int) -> MLXArray {
    let keyPos = MLXArray((0 ..< context).map { Int32($0) }).reshaped([1, 1, 1, context])
    let qPos = MLXArray((base ..< (base + pass)).map { Int32($0) }).reshaped([1, 1, pass, 1])
    let causal = keyPos .<= qPos
    // Keep the most recent `indexerBudget` keys: the shape of a real keep set
    // (a fixed budget of blocks), which is what makes the mask dense enough to
    // be worth measuring.
    let recent = keyPos .> (qPos - Int32(indexerBudget))
    return causal .&& recent
}

// MARK: - run

print("QSA attention transient probe (MLX 0.31.1)")
print("heads \(numQHeads)q/\(numKVHeads)kv x \(headDim), rounds \(opts.rounds), budget \(String(format: "%.1f", opts.budgetGB)) GB")
print("")

for cfg in opts.configs {
    let pass = cfg.pass
    let context = cfg.context
    guard context >= pass else { continue }
    let base = context - pass
    let predicted = predictedTransientGB(pass: pass, context: context)
    let sparseActive = context > indexerBudget

    print("── pass \(pass) over context \(context) (base \(base), mask: \(sparseActive ? "indexer keep-set" : "causal")) ──")
    if predicted > opts.budgetGB && !opts.skipWhole {
        print(String(
            format: "   SKIPPED: predicted whole-pass transient %.2f GB exceeds the %.1f GB budget",
            predicted, opts.budgetGB))
        print("")
        continue
    }

    let q = MLXRandom.normal([1, numQHeads, pass, headDim]).asType(.bfloat16)
    let k = MLXRandom.normal([1, numKVHeads, context, headDim]).asType(.bfloat16)
    let v = MLXRandom.normal([1, numKVHeads, context, headDim]).asType(.bfloat16)
    let sparse = sparseActive ? syntheticKeepMask(pass: pass, context: context, base: base) : nil
    eval(q, k, v)
    if let s = sparse { eval(s) }

    // Variants: whole pass, then each block size that actually splits it.
    var variants: [(name: String, block: Int, evalEach: Bool)] =
        opts.skipWhole ? [] : [("whole", pass, false)]
    for b in opts.blocks where b < pass { variants.append(("blk \(b)", b, false)) }
    for b in opts.blocks where b < pass { variants.append(("blk \(b) ev", b, true)) }

    var times: [String: [Double]] = [:]
    var peaks: [String: [Double]] = [:]
    var reference: MLXArray? = nil
    var maxDiff: [String: Double] = [:]

    // Warm every variant once before timing anything, so no variant pays for
    // first-use kernel compilation in its measured rounds.
    for vr in variants {
        let out = attnBlocked(
            q: q, k: k, v: v, sparse: sparse, base: base, block: vr.block, evalEach: vr.evalEach)
        eval(out)
        if reference == nil { reference = out }
    }
    let ref = reference!
    for vr in variants.dropFirst() {
        let out = attnBlocked(
            q: q, k: k, v: v, sparse: sparse, base: base, block: vr.block, evalEach: vr.evalEach)
        eval(out)
        let d = abs(out.asType(.float32) - ref.asType(.float32)).max().item(Float.self)
        let m = abs(ref.asType(.float32)).max().item(Float.self)
        maxDiff[vr.name] = Double(m > 0 ? d / m : d)
    }

    // Interleaved rounds: a single run on this machine varies 10-15%, and
    // running all of one variant then all of another lets a background task
    // land entirely on one arm.
    for _ in 0 ..< opts.rounds {
        for vr in variants {
            MLX.Memory.peakMemory = 0
            let t = Date()
            let out = attnBlocked(
                q: q, k: k, v: v, sparse: sparse, base: base, block: vr.block,
                evalEach: vr.evalEach)
            eval(out)
            let dt = -t.timeIntervalSinceNow
            times[vr.name, default: []].append(dt * 1000)
            peaks[vr.name, default: []].append(peakGB())
        }
    }

    func pad(_ s: String, _ w: Int, right: Bool = false) -> String {
        let padding = String(repeating: " ", count: Swift.max(0, w - s.count))
        return right ? s + padding : padding + s
    }
    print("   " + pad("variant", 12, right: true) + pad("ms", 10) + pad("peak GB", 12)
        + pad("vs whole", 14) + pad("rel diff", 12))
    let refName = variants[0].name
    let wholeMs = median(times[refName]!)
    for vr in variants {
        let ms = median(times[vr.name]!)
        let pk = median(peaks[vr.name]!)
        let rel = vr.name == refName ? "-" : String(format: "%.2fx", wholeMs / ms)
        let diff = vr.name == refName ? "-" : String(format: "%.2e", maxDiff[vr.name] ?? 0)
        print("   " + pad(vr.name, 12, right: true) + pad(String(format: "%.1f", ms), 10)
            + pad(String(format: "%.3f", pk), 12) + pad(rel, 14) + pad(diff, 12))
    }
    print(String(format: "   one score matrix at this shape: %.2f GB", predicted))
    print("")
}
