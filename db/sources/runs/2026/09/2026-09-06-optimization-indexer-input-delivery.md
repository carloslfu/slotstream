---
type: run
id: 01m1whq85ejx4dafgtw62z58fq
created: 2026-09-06T23:44:08.877990+00:00
updated: 2026-09-06T23:44:09.284885+00:00
summary: Indexer V204 input delivery failure and exact V206 initializer correction
binary: V202 source anchor b64b07cff525003546694e8a129d7996a11987fb9b5350b47e0a882b9c848daf
captured_at: 2026-09-06
command: V204 synthetic probe; V206 one-line initializer fix; V207 unrun successor
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Indexer V204 input delivery failure and exact V206 initializer correction
tool: bounded MLX Metal component driver and source correction
---
V204 failed input delivery after181.357014seconds including180-second quiet: Invalid type float32 received in array initialization. Zero score comparisons and zero timing cells ran. Original default/kernel/math gates unchanged; no rejection or speed claim for the mathematical candidate. Explicit23:40:55UTC clean return with free model lock/no native/compiler processes. V206 fixes only the exact-value MLX scalar initializer. V207 successor remains UNRUN and requires a new explicit context synthetic-only interval; no automatic retry or replacement data exists.

## /Users/carlos/Projects/slotstream/.build/optimization/indexer-component-v204/manifest.json

SHA256 `a040ba758ec52ffb0eab0d253d75f5ec8f39beec663c97e59450f1bf737d82c2`

```
{
  "classification": "Synthetic GPU score component; no production dispatch or full-model throughput claim",
  "spec_sha256": "e4e17a1ee911f32e48dbd449d1eb076bc77502096e404a95f1c1ac8f2176c21d",
  "command": [
    "/Users/carlos/Projects/slotstream/.venv31/bin/python",
    "/Users/carlos/Projects/slotstream/Tools/indexer_score_probe.py",
    "--candidate",
    "/Users/carlos/Projects/slotstream/.build/optimization/merged-context-build-v202/candidate",
    "--out",
    "/Users/carlos/Projects/slotstream/.build/optimization/indexer-component-v204/probe"
  ],
  "outer_child_seconds": 840,
  "whole_interval_seconds": 900,
  "completed": false,
  "inference_adopted": false,
  "identity": {
    "binary_sha256": "b64b07cff525003546694e8a129d7996a11987fb9b5350b47e0a882b9c848daf",
    "source_archive_sha256": "38707bb9cd38ddefe5a793451b55da56012dac1e03332b129d88577831622664",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28562898944,
    "swapins": 43826428,
    "swapouts": 77363405,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   366002.\nPages active:                                1020646.\nPages inactive:                               667998.\nPages speculative:                            361370.\nPages throttled:                                   0.\nPages wired down:                             223237.\nPages purgeable:                                3005.\n\"Translation faults\":                    15007543252.\nPages copy-on-write:                       702921259.\nPages zero filled:                       20858058471.\nPages reactivated:                        3421849257.\nPages purged:                               71054873.\nFile-backed pages:                           1374334.\nAnonymous pages:                              675680.\nPages stored in compressor:                  1717665.\nPages occupied by compressor:                 443633.\nDecompressions:                           1160633582.\nCompressions:                             1473004379.\nPageins:                                  7315771168.\nPageouts:                                   11009110.\nSwapins:                                    43826428.\nSwapouts:                                   77363405.\nPages tagged:                                 155213.\nPages tagged resident:                        119031.\nPages tagged compressed:                       36182.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6789.\nPages tag-storage free:                         3219.\nPages tag-storage non-tag pageable:            88288.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6450624.\nTagged compressions:                        11029320.\nTagged decompressions:                      10187273.\n"
  },
  "exit_code": 1,
  "result_sha256": "df62fb96331633f994ece0429b1adddd507668d88955cab289e011c11cad0c7a",
  "correctness_passed": false,
  "shapes": [],
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28293349376,
    "swapins": 43826444,
    "swapouts": 77363405,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   345844.\nPages active:                                1042708.\nPages inactive:                               675206.\nPages speculative:                            369630.\nPages throttled:                                   0.\nPages wired down:                             221616.\nPages purgeable:                                3051.\n\"Translation faults\":                    15008176664.\nPages copy-on-write:                       702973799.\nPages zero filled:                       20858501777.\nPages reactivated:                        3421850238.\nPages purged:                               71056413.\nFile-backed pages:                           1377994.\nAnonymous pages:                              709550.\nPages stored in compressor:                  1687628.\nPages occupied by compressor:                 427055.\nDecompressions:                           1160662731.\nCompressions:                             1473004379.\nPageins:                                  7315773690.\nPageouts:                                   11009110.\nSwapins:                                    43826444.\nSwapouts:                                   77363405.\nPages tagged:                                 155476.\nPages tagged resident:                        119415.\nPages tagged compressed:                       36061.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6789.\nPages tag-storage free:                         3488.\nPages tag-storage non-tag pageable:            88019.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6432256.\nTagged compressions:                        11029320.\nTagged decompressions:                      10187387.\n"
  },
  "elapsed_seconds": 181.35701370799998,
  "interval_respected": true
}

```

## /Users/carlos/Projects/slotstream/.build/optimization/indexer-component-v204/probe/Layers.swift

SHA256 `1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120`

```
// qwen4_exp blocks, ported 1:1 from the vendored reference implementation
// (Tools/reference/qwen4_exp.py). Weights come from ResidentWeights (trunk)
// and SlotPool/NgramStore (streamed).

import Foundation
import MLX
import MLXFast
import MLXNN

// MARK: - norms

/// RMSNorm; with groupSize set, statistics are computed per group of `groupSize`
/// (hyper-connections normalize each of the hc streams separately).
struct RMSNorm {
    let weight: MLXArray
    let eps: Float
    let groupSize: Int?

    func callAsFunction(_ x: MLXArray, compiledFinish: Bool = false) -> MLXArray {
        guard let g = groupSize else {
            return MLXFast.rmsNorm(x, weight: weight, eps: eps)
        }
        let shape = x.shape
        var v = x.reshaped(Array(shape.dropLast()) + [-1, g])
        let vf = v.asType(.float32)
        if compiledFinish, CompiledArithmetic.prepare() {
            let result = CompiledArithmetic.execute(v, meanSquare: vf.square().mean(axis: -1, keepDims: true),
                weight: weight.reshaped([-1, g]), epsilon: eps)
            return result.reshaped(shape)
        }
        v = (vf * rsqrt(vf.square().mean(axis: -1, keepDims: true) + eps)).asType(x.dtype)
        return v.reshaped(shape) * weight
    }
}

/// Gated RMSNorm used by GDN output (sigmoid gate for this model).
struct RMSNormGated {
    let weight: MLXArray
    let eps: Float
    let sigmoidGate: Bool

    func callAsFunction(_ x: MLXArray, gate: MLXArray) -> MLXArray {
        let out = MLXFast.rmsNorm(x, weight: weight, eps: eps)
        let gf = gate.asType(.float32)
        let g = sigmoidGate ? sigmoid(gf) : MLXNN.silu(gf)
        return (g * out.asType(.float32)).asType(x.dtype)
    }
}

@inline(__always) func l2normQK(_ x: MLXArray, eps: Float = 1e-6) -> MLXArray {
    let xf = x.asType(.float32)
    return (xf * rsqrt(xf.square().sum(axis: -1, keepDims: true) + eps)).asType(x.dtype)
}

// MARK: - rope

public struct Rope {
    let invFreq: MLXArray  // (dim/2) f32
    let dim: Int
    private let tables = RopeTables()
    public var sharedTables: Bool {
        get { tables.enabled }
        nonmutating set { tables.configure(newValue) }
    }

    package var fusedRotation: Bool {
        get { tables.fusedRotation }
        nonmutating set { tables.fusedRotation = newValue }
    }
    package var fusedRotationsScheduled: Int { tables.fusedRotationsScheduled }
    package var tableHits: Int { tables.hits }
    package var tableBuilds: Int { tables.builds }

    package func rotate(_ x: MLXArray, _ cosine: MLXArray, _ sine: MLXArray) -> MLXArray {
        guard tables.fusedRotation, PartialRotation.supported(x, cosine, sine) else {
            return ropePartial(x, cosine, sine)
        }
        tables.fusedRotationsScheduled += 1
        return PartialRotation.apply(x, cosine, sine)
    }

    public init(dim: Int, base: Float) {
        self.dim = dim
        let exps = MLXArray(stride(from: 0, to: Int32(dim), by: 2).map { Float($0) / Float(dim) })
        self.invFreq = pow(MLXArray(base), -exps)
    }

    /// positions (B, T) -> cos/sin (B, T, dim)
    func callAsFunction(_ positions: MLXArray) -> (MLXArray, MLXArray) {
        let freqs = positions.asType(.float32).expandedDimensions(axis: -1) * invFreq
        let emb = concatenated([freqs, freqs], axis: -1)
        return (cos(emb), sin(emb))
    }

    /// All text, image placeholders and draft entries use absolute cache
    /// positions. Equal geometry within this Rope instance shares angles;
    /// values are still formed by the reference multiply/cos/sin sequence.
    package func table(start: Int, count: Int, stride: Int = 1) -> (MLXArray, MLXArray) {
        tables.get(start: start, count: count, stride: stride) {
            self(MLXArray((0 ..< count).map { Int32(start + $0 * stride) }).expandedDimensions(axis: 0))
        }
    }

}

private final class RopeTables {
    struct Key: Equatable { let start: Int; let count: Int; let stride: Int }
    private var entries: [(Key, (MLXArray, MLXArray))] = []
    private(set) var enabled = false
    var fusedRotation = false
    var fusedRotationsScheduled = 0
    private(set) var hits = 0
    private(set) var builds = 0
    func configure(_ enabled: Bool) {
        if self.enabled != enabled { entries.removeAll(); self.enabled = enabled }
    }
    func get(start: Int, count: Int, stride: Int, make: () -> (MLXArray, MLXArray)) -> (MLXArray, MLXArray) {
        guard enabled else { builds += 1; return make() }
        let key = Key(start: start, count: count, stride: stride)
        if let i = entries.firstIndex(where: { $0.0 == key }) {
            hits += 1
            let entry = entries.remove(at: i); entries.append(entry); return entry.1
        }
        builds += 1
        let value = make()
        // One query range and one completed-block range. This never grows
        // with conversation count or context iterations.
        if entries.count == 2 { entries.removeFirst() }
        entries.append((key, value))
        return value
    }
}

/// Apply rope to the first `d` dims only (partial rotary), NeoX half-rotation.
func ropePartial(_ x: MLXArray, _ cosA: MLXArray, _ sinA: MLXArray) -> MLXArray {
    let d = cosA.dim(-1)
    let c = cosA.asType(x.dtype)
    let s = sinA.asType(x.dtype)
    let xr = x[.ellipsis, 0 ..< d]
    let xp = x[.ellipsis, d...]
    let half = d / 2
    let x1 = xr[.ellipsis, 0 ..< half]
    let x2 = xr[.ellipsis, half...]
    let rot = concatenated([-x2, x1], axis: -1)
    let rotated = xr * c + rot * s
    return xp.dim(-1) > 0 ? concatenated([rotated, xp], axis: -1) : rotated
}

// MARK: - caches

final class KVCache {
    var keys: MLXArray?
    var values: MLXArray?
    var offset = 0
    let step = 1024
    var allocatedBytes: Int { (keys?.nbytes ?? 0) + (values?.nbytes ?? 0) }

    /// Distinct Swift array contexts share the existing MLX storage. Indexed
    /// updates then retain the other branch's reader and copy on write.
    func copyForPrefix(to target: KVCache) {
        target.keys = keys.map { $0.reshaped($0.shape) }
        target.values = values.map { $0.reshaped($0.shape) }
        target.offset = offset
    }

    func updateAndFetch(_ k: MLXArray, _ v: MLXArray) -> (MLXArray, MLXArray) {
        let prev = offset
        let s = k.dim(2)
        if keys == nil || prev + s > keys!.dim(2) {
            let newCap = ((prev + s + step - 1) / step) * step
            let b = k.dim(0)
            let h = k.dim(1)
            let grownK = MLXArray.zeros([b, h, newCap, k.dim(3)], dtype: k.dtype)
            let grownV = MLXArray.zeros([b, h, newCap, v.dim(3)], dtype: v.dtype)
            if let ok = keys, prev > 0 {
                grownK[0..., 0..., 0 ..< prev, 0...] = ok[0..., 0..., 0 ..< prev, 0...]
                grownV[0..., 0..., 0 ..< prev, 0...] = values![0..., 0..., 0 ..< prev, 0...]
            }
            keys = grownK
            values = grownV
        }
        keys![0..., 0..., prev ..< (prev + s), 0...] = k
        values![0..., 0..., prev ..< (prev + s), 0...] = v
        offset = prev + s
        return (keys![0..., 0..., 0 ..< offset, 0...], values![0..., 0..., 0 ..< offset, 0...])
    }

    /// Roll back to `n` entries. Bytes past `n` stay in the buffer but are
    /// dead: the next update writes over them, and fetches slice 0..<offset.
    func trim(to n: Int) { offset = min(offset, max(0, n)) }
}

/// Grown in blocks like KVCache rather than re-concatenated per token: a
/// fresh `concatenated` every step copies the whole cache each time, which is
/// quadratic in context length. Values are identical either way.
package final class IndexerCache {
    private var buf: MLXArray?  // (B, cap, dim)
    private var pooledBuf: MLXArray?
    private var pooledCount = 0
    private var pooledRatio = 1
    package private(set) var offset = 0
    package private(set) var rawBase = 0
    package let compactRaw: Bool
    private var preserveRaw = false
    let step = 1024
    package var allocatedBytes: Int { (buf?.nbytes ?? 0) + (pooledBuf?.nbytes ?? 0) }
    package var rawAllocatedBytes: Int { buf?.nbytes ?? 0 }
    package var pooledAllocatedBytes: Int { pooledBuf?.nbytes ?? 0 }
    package init(compactRaw: Bool = false) { self.compactRaw = compactRaw }

    func copyForPrefix(to target: IndexerCache) {
        precondition(target.compactRaw == compactRaw)
        target.buf = buf.map { $0.reshaped($0.shape) }
        target.pooledBuf = pooledBuf.map { $0.reshaped($0.shape) }
        target.pooledCount = pooledCount; target.pooledRatio = pooledRatio
        target.offset = offset; target.rawBase = rawBase
        target.preserveRaw = false
    }

    func forkForPrefix() -> IndexerCache {
        let result = IndexerCache(compactRaw: compactRaw)
        copyForPrefix(to: result)
        return result
    }

    package func prefixForkFields() -> [String: MLXArray] {
        var result = ["offset": MLXArray(Int64(offset)), "rawBase": MLXArray(Int64(rawBase)),
            "pooledCount": MLXArray(Int64(pooledCount)), "pooledRatio": MLXArray(Int64(pooledRatio))]
        if let pooledBuf, pooledCount > 0 { result["pooled"] = pooledBuf[0..., 0 ..< pooledCount, 0...] }
        return result
    }

    package struct Snapshot {
        fileprivate var raw: MLXArray?
        fileprivate var pooled: MLXArray?
        fileprivate var offset: Int
        fileprivate var rawBase: Int
        fileprivate var pooledCount: Int
        fileprivate var ratio: Int
    }

    package func snapshot() -> Snapshot? {
        guard compactRaw else { return nil }
        return Snapshot(raw: buf, pooled: pooledBuf, offset: offset, rawBase: rawBase,
                        pooledCount: pooledCount, ratio: pooledRatio)
    }

    package func restore(_ saved: Snapshot) {
        buf = saved.raw; pooledBuf = saved.pooled; offset = saved.offset
        rawBase = saved.rawBase; pooledCount = saved.pooledCount; pooledRatio = saved.ratio
        preserveRaw = false
        materializeStorage()
    }

    /// A recording pass can have an arbitrary public length. Keep all its
    /// raw rows until rollback chooses its committed position; no draft-depth
    /// assumption is allowed to change State.rollback's contract.
    package func preserveRecordingRows(_ on: Bool) {
        preserveRaw = on
        if !on { compactCompletedRaw() }
    }

    package func update(_ k: MLXArray) -> MLXArray {
        let s = k.dim(1)
        let live = offset - rawBase
        let allocationStep = compactRaw && rawBase > 0 ? 256 : step
        if buf == nil || live + s > buf!.dim(1) {
            let newCap = ((live + s + allocationStep - 1) / allocationStep) * allocationStep
            let grown = MLXArray.zeros([k.dim(0), newCap, k.dim(2)], dtype: k.dtype)
            if let old = buf, live > 0 {
                grown[0..., 0 ..< live, 0...] = old[0..., 0 ..< live, 0...]
            }
            buf = grown
        }
        buf![0..., live ..< (live + s), 0...] = k
        offset += s
        return buf![0..., 0 ..< (offset - rawBase), 0...]
    }

    /// Roll back to `n` entries (see KVCache.trim).
    package func trim(to n: Int) {
        precondition(!compactRaw || max(0, n) >= rawBase, "released indexer history requires its checkpoint")
        offset = min(offset, max(0, n))
        // A partial block must be rebuilt from the retained raw rows after
        // speculation overwrites its rejected suffix.
        pooledCount = min(pooledCount, offset / pooledRatio)
    }

    package func completedBlocks(
        count: Int, ratio: Int, transform: (Int, Int) -> MLXArray
    ) -> MLXArray {
        precondition(count > 0 && ratio > 0)
        if pooledRatio != ratio {
            precondition(rawBase == 0, "released indexer history cannot change compression ratio")
            pooledBuf = nil; pooledCount = 0; pooledRatio = ratio
        }
        if count > pooledCount {
            let added = transform(pooledCount, count)
            if pooledBuf == nil || pooledBuf!.dim(1) < count {
                let capacity = ((count + 255) / 256) * 256
                let grown = MLXArray.zeros([added.dim(0), capacity, added.dim(2)], dtype: added.dtype)
                if let old = pooledBuf, pooledCount > 0 {
                    grown[0..., 0 ..< pooledCount, 0...] = old[0..., 0 ..< pooledCount, 0...]
                }
                pooledBuf = grown
            }
            pooledBuf![0..., pooledCount ..< count, 0...] = added
            pooledCount = count
        }
        compactCompletedRaw()
        return pooledBuf![0..., 0 ..< count, 0...]
    }

    private func compactCompletedRaw() {
        guard compactRaw, !preserveRaw, let old = buf, pooledCount > 0 else { return }
        // Only completed keys can replace raw rows. Retain a small aligned
        // tail and amortize copies; a StateCheckpoint owns any earlier undo.
        let first = min(pooledCount * pooledRatio, max(0, offset - 32) / pooledRatio * pooledRatio)
        guard first - rawBase >= 256 else { return }
        let live = offset - first
        let capacity = max(256, ((live + 255) / 256) * 256)
        let owned = MLXArray.zeros([old.dim(0), capacity, old.dim(2)], dtype: old.dtype)
        if live > 0 { owned[0..., 0 ..< live, 0...] = old[0..., (first - rawBase) ..< (offset - rawBase), 0...] }
        // Complete both dependents before dropping their oversized parent.
        if let pooledBuf { eval(owned, pooledBuf) } else { eval(owned) }
        buf = owned; rawBase = first
    }

    package func materializeStorage() {
        if let b = buf { eval(b) }
        if let p = pooledBuf { eval(p) }
    }

    package func diagnosticValues() -> MLXArray? {
        buf.map { $0[0..., 0 ..< (offset - rawBase), 0...] }
    }
}

final class LinearCache {
    var convState: MLXArray?  // (B, K-1, convDim)
    var ssmState: MLXArray?  // (B, Hv, Dv, Dk) f32
    var pleConvState: MLXArray?  // (B, (k-1)*dilation, hcDim)
    var ngramCtx: [Int64] = []  // rolling last (ngramSize-1) token ids
    /// While a speculative verify pass runs, the state after each of its
    /// positions (index t = state after consuming t+1 of the pass's
    /// tokens), so a rejection rolls back by position instead of re-running
    /// the kept tokens. Empty outside a recording pass.
    var record = false
    var convStates: [MLXArray] = []
    var ssmStates: [MLXArray] = []
    var pleConvStates: [MLXArray] = []

    func forkForPrefix() throws -> LinearCache {
        guard !record, convStates.isEmpty, ssmStates.isEmpty, pleConvStates.isEmpty else {
            throw ModelError("cannot fork a prefix during speculative state recording")
        }
        let result = LinearCache()
        // Windows must not keep a whole prefill activation alive. Full FP32
        // recurrent arrays are already replaced on every recurrence step.
        result.convState = convState.map { contiguous($0).reshaped($0.shape) }
        result.pleConvState = pleConvState.map { contiguous($0).reshaped($0.shape) }
        result.ssmState = ssmState.map { $0.reshaped($0.shape) }
        result.ngramCtx = ngramCtx
        eval([result.convState, result.pleConvState, result.ssmState].compactMap { $0 })
        return result
    }

    func compactWindows() {
        if let window = convState { convState = contiguous(window) }
        if let window = pleConvState { pleConvState = contiguous(window) }
        // eval alone does not detach a view. contiguous copies oversized
        // backing allocations in the pinned MLX implementation.
        if let window = convState { eval(window) }
        if let window = pleConvState { eval(window) }
        // Recording windows intentionally share one bounded verify parent.
        // rollback compacts the selected window after releasing the others.
    }

    func clearRecording() {
        record = false
        convStates = []
        ssmStates = []
        pleConvStates = []
    }
}

// MARK: - QSA (sparse attention)

final class QSAIndexer {
    var minimumProjectionRows = 0
    var incrementalBlocks = false
    var denseBypass = false
    var specializedSelector = false
    private(set) var specializedRows = 0
    let cfg: ModelConfig
    let proj: QLinear
    let qNorm: RMSNorm
    let kNorm: RMSNorm
    let blockTopK: Int

    convenience init(_ w: TensorSource, layer: Int) {
        self.init(w, base: "model.layers.\(layer).self_attn.indexer")
    }

    init(_ w: TensorSource, base b: String) {
        cfg = w.config
        proj = w.linear(b + ".index_qk_proj")
        qNorm = RMSNorm(weight: w.tensor(b + ".q_layernorm.weight"), eps: cfg.rmsNormEps, groupSize: nil)
        kNorm = RMSNorm(weight: w.tensor(b + ".k_layernorm.weight"), eps: cfg.rmsNormEps, groupSize: nil)
        blockTopK = cfg.indexerBudget / cfg.indexerCompressRatio
    }

    /// Preparation appends each key once. Query tiles subsequently select
    /// from this same full block domain, so partition tie order stays defined
    /// by the original block IDs, including invisible blocks.
    func prepare(_ x: MLXArray, rope: Rope, cache: IndexerCache?, offset: Int) -> QSASelection? {
        let (B, S) = (x.dim(0), x.dim(1))
        let qk = proj(x, minimumRows: minimumProjectionRows)
        let split = cfg.indexerNHeads * cfg.indexerHeadDim
        var q = qk[.ellipsis, 0 ..< split].reshaped([B, S, cfg.indexerNHeads, cfg.indexerHeadDim])
        var rawK = qk[.ellipsis, split...].reshaped([B, S, cfg.indexerHeadDim])
        if let c = cache { rawK = c.update(rawK) }
        let kvLen = cache?.offset ?? rawK.dim(1)
        if kvLen <= cfg.indexerBudget { return nil }

        let ratio = cfg.indexerCompressRatio
        let nBlocks = kvLen / ratio
        let rawBase = cache?.rawBase ?? 0
        let blockStarts = MLXArray((0 ..< nBlocks).map { Int32($0 * ratio) })
        func transform(_ lo: Int, _ hi: Int) -> MLXArray {
            let rows = rawK[0..., (lo * ratio - rawBase) ..< (hi * ratio - rawBase), 0...]
                .reshaped([B, hi - lo, ratio, cfg.indexerHeadDim])
            let normalized = kNorm(rows.asType(.float32).mean(axis: 2).asType(rawK.dtype))
            let (cK, sK) = rope.table(start: lo * ratio, count: hi - lo, stride: ratio)
            return rope.rotate(normalized, cK, sK)
        }
        let pooled: MLXArray
        if let cache, incrementalBlocks || cache.compactRaw {
            pooled = cache.completedBlocks(count: nBlocks, ratio: ratio, transform: transform)
        } else { pooled = transform(0, nBlocks) }

        let (cQ, sQ) = rope.table(start: offset, count: S)
        q = qNorm(q)
        q = rope.rotate(
            q, cQ.expandedDimensions(axis: 2), sQ.expandedDimensions(axis: 2))

        return QSASelection(q: q, pooled: pooled, blockStarts: blockStarts,
                            offset: offset, kvLen: kvLen, ratio: ratio,
                            blockTopK: blockTopK, headDim: cfg.indexerHeadDim,
                            denseBypass: denseBypass, specializedSelector: specializedSelector,
                            onSpecialized: specializedSelector ? { [weak self] count in self?.specializedRows += count } : nil)
    }

    /// Original full-pass mask remains available as the exact reference.
    func appendKeysOnly(_ x: MLXArray, rope: Rope, cache: IndexerCache) {
        let split = cfg.indexerNHeads * cfg.indexerHeadDim
        let raw = proj(x, minimumRows: minimumProjectionRows)[.ellipsis, split...].reshaped([x.dim(0), x.dim(1), cfg.indexerHeadDim])
        let rows = cache.update(raw)
        if cache.compactRaw, cache.offset > cfg.indexerBudget {
            let ratio = cfg.indexerCompressRatio, base = cache.rawBase
            _ = cache.completedBlocks(count: cache.offset / ratio, ratio: ratio) { lo, hi in
                let block = rows[0..., (lo * ratio - base) ..< (hi * ratio - base), 0...]
                    .reshaped([x.dim(0), hi - lo, ratio, cfg.indexerHeadDim])
                let normalized = self.kNorm(block.asType(.float32).mean(axis: 2).asType(rows.dtype))
                let (c, s) = rope.table(start: lo * ratio, count: hi - lo, stride: ratio)
                return rope.rotate(normalized, c, s)
            }
        }
        cache.materializeStorage()
    }

    /// Original full-pass mask remains available as the exact reference.
    func callAsFunction(_ x: MLXArray, rope: Rope, cache: IndexerCache?, offset: Int) -> MLXArray? {
        prepare(x, rope: rope, cache: cache, offset: offset)?
            .mask(lo: 0, hi: x.dim(1), keyEnd: offset + x.dim(1))
    }
}

/// Prepared indexer inputs; scores and keep masks live only for one query
/// tile. It owns no state and cannot append or rewind cache entries.
package struct QSASelection {
    let q: MLXArray
    let pooled: MLXArray
    let blockStarts: MLXArray
    let offset: Int
    let kvLen: Int
    let ratio: Int
    let blockTopK: Int
    let headDim: Int
    let denseBypass: Bool
    let specializedSelector: Bool
    let onSpecialized: ((Int) -> Void)?

    package init(q: MLXArray, pooled: MLXArray, blockStarts: MLXArray,
                 offset: Int, kvLen: Int, ratio: Int, blockTopK: Int,
                 headDim: Int, denseBypass: Bool = false, specializedSelector: Bool = false,
                 onSpecialized: ((Int) -> Void)? = nil) {
        self.q = q; self.pooled = pooled; self.blockStarts = blockStarts
        self.offset = offset; self.kvLen = kvLen; self.ratio = ratio
        self.blockTopK = blockTopK; self.headDim = headDim
        self.denseBypass = denseBypass
        self.specializedSelector = specializedSelector
        self.onSpecialized = onSpecialized
    }

    package func mask(lo: Int, hi: Int, keyEnd: Int) -> MLXArray {
        let (B, S, nBlocks) = (q.dim(0), hi - lo, pooled.dim(1))
        let qPos = MLXArray((offset + lo ..< offset + hi).map { Int32($0) })
        // At query p there are floor((p+1)/ratio) complete visible blocks.
        // If even the last query fits the selection budget, all visible
        // blocks plus its partial own block are exactly the causal keep set.
        // Keep a boolean mask and the same full key domain/attention shapes;
        // switching to a different causal-kernel dispatch is a separate probe.
        if denseBypass, ratio > 0, (offset + hi) / ratio <= blockTopK {
            // NaN visible scores sort after invisible -infinity in the pinned
            // selector, so "all visible fit" alone is insufficient. This
            // conservative operand bound excludes NaNs/infinities and leaves
            // ample headroom against dot-product/head-sum overflow. Its scalar
            // synchronization cost belongs in this candidate's timing gate.
            let terms = Float(headDim) * Float(q.dim(2))
            let limit = sqrt(Float.greatestFiniteMagnitude / max(1, terms)) / 4
            let bounded = (abs(q[0..., lo ..< hi, 0..., 0...]).asType(.float32) .<= limit).all()
                .&& (abs(pooled).asType(.float32) .<= limit).all()
            if bounded.item(Bool.self) {
                let keys = MLXArray((0 ..< keyEnd).map(Int32.init)).reshaped([1, 1, keyEnd])
                return broadcast(keys .<= qPos.reshaped([1, S, 1]), to: [B, S, keyEnd])
                    .expandedDimensions(axis: 1)
            }
        }
        var scores = einsum(
            "bshd,bnd->bsnh", q[0..., lo ..< hi, 0..., 0...].asType(.float32), pooled.asType(.float32))
        scores = maximum(scores, 0).sum(axis: -1) / sqrt(Float(headDim))

        let blockEnd = blockStarts + Int32(ratio - 1)
        let visible = blockEnd.reshaped([1, 1, nBlocks]) .<= qPos.reshaped([1, S, 1])
        scores = which(visible, scores, MLXArray(-Float.infinity))

        let k = min(blockTopK, nBlocks)
        let keepBlock: MLXArray
        if specializedSelector {
            if BlockSelection.supported(scores, k: k), BlockSelection.prepare() { onSpecialized?(B * S) }
            keepBlock = BlockSelection.keep(scores, k: k, enabled: true) .&& visible
        } else {
            var top = argPartition(-scores, kth: k - 1, axis: -1)[.ellipsis, ..<k].asType(.int32)
            top = which(takeAlong(broadcast(visible, to: [B, S, nBlocks]), top, axis: -1), top, MLXArray(Int32(nBlocks)))
            var storage = MLXArray.zeros([B, S, nBlocks + 1], dtype: .bool)
            storage = putAlong(storage, top, values: MLXArray(true), axis: -1)
            keepBlock = storage[.ellipsis, ..<nBlocks]
        }

        var keep = repeated(keepBlock, count: ratio, axis: -1)
        let tail = kvLen - nBlocks * ratio
        if tail > 0 {
            keep = concatenated([keep, MLXArray.zeros([B, S, tail], dtype: .bool)], axis: -1)
        }
        let keyPos = MLXArray((0 ..< kvLen).map { Int32($0) }).reshaped([1, 1, kvLen])
        let qp = qPos.reshaped([1, S, 1])
        // MLX tensor `/` is true division even for Int32 inputs. Flooring
        // here is essential: otherwise ownBlockStart becomes qp+1 and every
        // partial current block is silently omitted from sparse attention.
        let ownBlockStart = floorDivide(qp + 1, Int32(ratio)) * Int32(ratio)
        let ownTail = (keyPos .>= ownBlockStart) .&& (keyPos .<= qp)
        keep = (keep .|| ownTail) .&& (keyPos .<= qp)
        return keep[0..., 0..., 0 ..< keyEnd].expandedDimensions(axis: 1)
    }

    /// Unchanged score arithmetic and original partition domain. Only the
    /// selected complete-block IDs escape; the attention consumer reconstructs
    /// causality and the own partial block from absolute query positions.
    package func compactBlocks(lo: Int, hi: Int) -> MLXArray {
        let (B, S, nBlocks) = (q.dim(0), hi - lo, pooled.dim(1))
        let positions = MLXArray((offset + lo ..< offset + hi).map(Int32.init))
        var scores = einsum("bshd,bnd->bsnh",
            q[0..., lo ..< hi, 0..., 0...].asType(.float32), pooled.asType(.float32))
        scores = maximum(scores, 0).sum(axis: -1) / sqrt(Float(headDim))
        let visible = (blockStarts + Int32(ratio - 1)).reshaped([1, 1, nBlocks])
            .<= positions.reshaped([1, S, 1])
        scores = which(visible, scores, MLXArray(-Float.infinity))
        let count = min(blockTopK, nBlocks)
        let top = argPartition(-scores, kth: count - 1, axis: -1)[.ellipsis, ..<count].asType(.int32)
        return which(takeAlong(broadcast(visible, to: [B, S, nBlocks]), top, axis: -1),
            top, MLXArray(Int32(nBlocks)))
    }
}

final class QSAAttention {
    var minimumProjectionRows = 0
    var stableSmallKeyDomain = false
    var smallReferenceStart = 0
    var smallReferenceEnd = ContextPolicy.modelLimit
    private(set) var paddedSmallKeyDomains = 0
    private(set) var paddedSmallQueryRows = 0
    var boundedIndexer = false
    var selectedAttention = false
    private(set) var selectedAttentionTiles = 0
    var debugSink: ((String, MLXArray) -> Void)? = nil
    let cfg: ModelConfig
    let qProj: QLinear
    let kProj: QLinear
    let vProj: QLinear
    let oProj: QLinear
    let qNorm: RMSNorm
    let kNorm: RMSNorm
    let indexer: QSAIndexer
    let scale: Float

    convenience init(_ w: TensorSource, layer: Int) {
        self.init(w, base: "model.layers.\(layer).self_attn")
    }

    init(_ w: TensorSource, base b: String) {
        cfg = w.config
        qProj = w.linear(b + ".q_proj")
        kProj = w.linear(b + ".k_proj")
        vProj = w.linear(b + ".v_proj")
        oProj = w.linear(b + ".o_proj")
        qNorm = RMSNorm(weight: w.tensor(b + ".q_norm.weight"), eps: cfg.rmsNormEps, groupSize: nil)
        kNorm = RMSNorm(weight: w.tensor(b + ".k_norm.weight"), eps: cfg.rmsNormEps, groupSize: nil)
        indexer = QSAIndexer(w, base: b + ".indexer")
        scale = 1.0 / sqrt(Float(cfg.headDim))
    }

    /// An intermediate terminal layer needs only keys and values for later
    /// tokens. Keep the same full-row projection/norm/RoPE shapes and finish
    /// cache writes; queries, attention outputs and MoE cannot affect state.
    func appendKeysOnly(_ x: MLXArray, rope: Rope, cache: KVCache, idxCache: IndexerCache) {
        let (B, S, D) = (x.dim(0), x.dim(1), cfg.headDim)
        let offset = cache.offset
        indexer.appendKeysOnly(x, rope: rope, cache: idxCache)
        var k = kNorm(kProj(x, minimumRows: minimumProjectionRows).reshaped([B, S, cfg.numKVHeads, D])).transposed(0, 2, 1, 3)
        let v = vProj(x, minimumRows: minimumProjectionRows).reshaped([B, S, cfg.numKVHeads, D]).transposed(0, 2, 1, 3)
        let (c, s) = rope.table(start: offset, count: S)
        k = rope.rotate(k, c.expandedDimensions(axis: 1), s.expandedDimensions(axis: 1))
        let retained = cache.updateAndFetch(k, v)
        eval(retained.0, retained.1)
    }

    func callAsFunction(
        _ x: MLXArray, rope: Rope, cache: KVCache, idxCache: IndexerCache, lastQueryOnly: Bool = false
    ) -> MLXArray {
        let (B, S) = (x.dim(0), x.dim(1))
        let offset = cache.offset
        let H = cfg.numAttentionHeads
        let D = cfg.headDim

        let selection = indexer.prepare(x, rope: rope, cache: idxCache, offset: offset)
        let pruneLastQuery = lastQueryOnly && S > InferenceOptimizations.terminalQueryTile
        let useSelected = selectedAttention && S > 8 && !pruneLastQuery
        let sparse = boundedIndexer || useSelected || pruneLastQuery ? nil : selection?.mask(lo: 0, hi: S, keyEnd: offset + S)

        let qg = qProj(x, minimumRows: minimumProjectionRows).reshaped([B, S, H, 2 * D])
        var q = qg[.ellipsis, 0 ..< D]
        let gate = qg[.ellipsis, D...].reshaped([B, S, H * D])
        debugSink?("qgRaw", qg)
        q = qNorm(q).transposed(0, 2, 1, 3)
        var k = kNorm(kProj(x, minimumRows: minimumProjectionRows).reshaped([B, S, cfg.numKVHeads, D])).transposed(0, 2, 1, 3)
        var v = vProj(x, minimumRows: minimumProjectionRows).reshaped([B, S, cfg.numKVHeads, D]).transposed(0, 2, 1, 3)
        debugSink?("qNormed", q)
        debugSink?("kNormed", k)
        debugSink?("v", v)

        var (c, s) = rope.table(start: offset, count: S)
        c = c.expandedDimensions(axis: 1)
        s = s.expandedDimensions(axis: 1)
        q = rope.rotate(q, c, s)
        k = rope.rotate(k, c, s)

        (k, v) = cache.updateAndFetch(k, v)

        if pruneLastQuery {
            // Preserve matrix dispatch with one 64-row terminal tile. The
            // single-query predecessor changed final router rank. This bounded
            // successor has its own unchanged numerical/state gates; shorter
            // passes retain their entire original attention/HC geometry.
            let rows = InferenceOptimizations.terminalQueryTile
            let first = S - rows
            let queries = q[0..., 0..., first..., 0...]
            let mask = selection?.mask(lo: first, hi: S, keyEnd: offset + S)
            let attended = Self.attend(q: queries, k: k, v: v, sparse: mask,
                base: offset + first, scale: scale, block: rows)
            let flattened = attended.transposed(0, 2, 1, 3).reshaped([B, rows, H * D])
            return oProj(flattened * sigmoid(gate[0..., first..., 0...]), minimumRows: minimumProjectionRows)
        }

        debugSink?("qRoped", q)
        debugSink?("kRoped", k)
        if stableSmallKeyDomain, S < 256 {
            let actual = k.dim(2)
            let extent = ContextWorkspace.keyExtent(pass: S, context: actual,
                referenceStart: smallReferenceStart, referenceEnd: smallReferenceEnd)
            let queryRows = ContextWorkspace.queryRows(pass: S, context: actual,
                referenceStart: smallReferenceStart, referenceEnd: smallReferenceEnd)
            if (extent > actual || queryRows > S), extent <= ContextPolicy.modelLimit,
               queryRows <= PrefillSchedule.measuredQueryKeyProduct / extent {
                // Masked future columns preserve the established 256-row
                // prefill's softmax reduction domain. They never enter state,
                // selection, or a logical token count; only Q x padded K is
                // charged to the next-dispatch workspace bound.
                let paddedK = extent > actual ? concatenated([k, MLXArray.zeros([B, cfg.numKVHeads, extent - actual, D], dtype: k.dtype)], axis: 2) : k
                let paddedV = extent > actual ? concatenated([v, MLXArray.zeros([B, cfg.numKVHeads, extent - actual, D], dtype: v.dtype)], axis: 2) : v
                var keep: MLXArray
                if let selected = selection?.mask(lo: 0, hi: S, keyEnd: actual) {
                    keep = concatenated([selected, MLXArray.zeros([B, 1, S, extent - actual], dtype: .bool)], axis: -1)
                } else {
                    let queries = MLXArray((offset ..< offset + S).map(Int32.init)).reshaped([1, 1, S, 1])
                    let keys = MLXArray((0 ..< extent).map(Int32.init)).reshaped([1, 1, 1, extent])
                    keep = queries .>= keys
                }
                var queries = q
                if queryRows > S {
                    queries = concatenated([q, broadcast(q[0..., 0..., (S - 1) ..< S, 0...],
                        to: [B, H, queryRows - S, D])], axis: 2)
                    keep = concatenated([keep, broadcast(keep[0..., 0..., (S - 1) ..< S, 0...],
                        to: [B, 1, queryRows - S, extent])], axis: 2)
                    paddedSmallQueryRows += queryRows - S
                }
                let attended = Self.attend(q: queries, k: paddedK, v: paddedV, sparse: keep,
                    base: offset, scale: scale, block: queryRows)[0..., 0..., 0 ..< S, 0...]
                if extent > actual { paddedSmallKeyDomains += 1 }
                let flattened = attended.transposed(0, 2, 1, 3).reshaped([B, S, H * D])
                return oProj(flattened * sigmoid(gate), minimumRows: minimumProjectionRows)
            }
        }
        var out = Self.attend(
            q: q, k: k, v: v, sparse: sparse, base: offset, scale: scale,
            block: boundedIndexer && selection != nil
                ? min(256, AttentionTuning.queryBlock(pass: S, context: k.dim(2)))
                : AttentionTuning.queryBlock(pass: S, context: k.dim(2)),
            selection: boundedIndexer || useSelected ? selection : nil,
            selectedAttention: useSelected,
            onSelected: { [weak self] in self?.selectedAttentionTiles += 1 })
        debugSink?("sdpaOut", out)
        out = out.transposed(0, 2, 1, 3).reshaped([B, S, H * D])
        return oProj(out * sigmoid(gate), minimumRows: minimumProjectionRows)
    }

    /// Attention over a pass, in blocks of queries.
    ///
    /// Mask semantics mirror the reference: fused-causal sdpa when the indexer
    /// is inactive (bit-parity with mlx-lm's "causal" string mask), and the
    /// boolean keep-set (already causal) when it is.
    ///
    /// **Why the pass is split.** MLX 0.31.1 admits the fused prefill kernel
    /// only for head dims 64, 80 and 128 (`sdpa_full_supported_head_dim` in
    /// `scaled_dot_product_attention.cpp`). These layers run at head dim 256,
    /// so every pass longer than 8 tokens takes the unfused path in
    /// `fast.cpp`, which materialises the whole `[24, pass, context]` score
    /// matrix — a transient that grows with pass x context, which is what
    /// `PrefillSchedule` shrinks the pass to stay ahead of. Splitting the
    /// queries bounds it to `[24, block, context]`.
    ///
    /// **Why it is exact.** The fallback builds its causal mask as
    /// `arange(kL - qL, qL + (kL - qL)) >= arange(0, kL)`, so queries align to
    /// the END of the keys: a block `[lo, hi)` of a pass that starts at
    /// context position `base` sees exactly keys `[0, base + hi)`, which
    /// reproduces the same mask rows. Every output row depends only on its own
    /// query and all keys, so nothing is re-associated. Measured
    /// bit-identical at blocks of 256 and up and 1.3x faster
    /// (`swift-probe/Sources/AttnProbe`); a block of 128 measured 1.6e-3 of
    /// logit spread at one shape, which is why 256 is the floor.
    ///
    /// **The per-block `eval` is load-bearing, not tidiness.** Without it MLX
    /// builds the whole graph before evaluating anything and holds every
    /// block's score matrix at once: measured 6.5 GB at a 4096-token pass over
    /// a 32k context, exactly what not blocking costs. With it, 0.76 GB.
    static func attend(
        q: MLXArray, k: MLXArray, v: MLXArray, sparse: MLXArray?, base: Int,
        scale: Float, block: Int, selection: QSASelection? = nil,
        selectedAttention: Bool = false, onSelected: (() -> Void)? = nil
    ) -> MLXArray {
        let S = q.dim(2)
        if selectedAttention, S > 8, scale == 0.0625, sparse == nil,
           selection == nil || selection!.ratio == 4,
           SelectedAttention.prepare() {
            // Initialization precedes model state mutation at request entry.
            // Query tiling also bounds compact selection scores. The kernel
            // never materializes a query-by-key attention matrix.
            var outs: [MLXArray] = []
            var lo = 0
            while lo < S {
                var hi = min(S, lo + 256)
                if S - hi <= 8 { hi = S }
                let query = q[0..., 0..., lo ..< hi, 0...]
                let ids = selection?.compactBlocks(lo: lo, hi: hi)
                guard SelectedAttention.supported(q: query, k: k, v: v, base: base + lo, blocks: ids) else {
                    // Capability/shape fallback is pure, before kernel work
                    // for this tile. No error recovery after GPU mutation.
                    return attend(q: q, k: k, v: v, sparse: sparse, base: base,
                        scale: scale, block: block, selection: selection)
                }
                let out = SelectedAttention.execute(q: query, k: k, v: v, base: base + lo, blocks: ids)
                eval(out); outs.append(out); onSelected?()
                lo = hi
            }
            return concatenated(outs, axis: 2)
        }
        func mask(_ sp: MLXArray?, queries: Int) -> MLXFast.ScaledDotProductAttentionMaskMode {
            if let sp { return .array(sp) }
            // A single query sits at the last key position, so every key it is
            // handed is already visible to it and no mask is needed.
            return queries > 1 ? .causal : .none
        }
        if block >= S {
            return MLXFast.scaledDotProductAttention(
                queries: q, keys: k, values: v, scale: scale, mask: mask(selection?.mask(lo: 0, hi: S, keyEnd: base + S) ?? sparse, queries: S))
        }
        var outs: [MLXArray] = []
        outs.reserveCapacity((S + block - 1) / block)
        var lo = 0
        while lo < S {
            var hi = Swift.min(lo + block, S)
            if selection != nil, S - hi < block { hi = S }
            // Keep the reference softmax key domain for explicit sparse
            // masks. Truncating masked future columns can change its reduction
            // tree. Merge a short final tile so it cannot switch to the <=8
            // query vector kernel: a 256 target therefore bounds tiles at 511.
            let kEnd = selection != nil ? k.dim(2) : base + hi
            let o = MLXFast.scaledDotProductAttention(
                queries: q[0..., 0..., lo ..< hi, 0...],
                keys: k[0..., 0..., 0 ..< kEnd, 0...],
                values: v[0..., 0..., 0 ..< kEnd, 0...],
                scale: scale,
                mask: mask(selection?.mask(lo: lo, hi: hi, keyEnd: kEnd)
                    ?? sparse?[0..., 0..., lo ..< hi, 0 ..< kEnd], queries: hi - lo))
            eval(o)
            outs.append(o)
            lo = hi
        }
        return concatenated(outs, axis: 2)
    }
}

/// How a pass is split across the sparse-attention layers.
///
/// **This is a bound, not an optimisation, and the measurements say so.**
/// Splitting the queries was built expecting it to cut peak memory; measured
/// end to end it does not, because the score matrix is not where the pass
/// peaks. Interleaved A/B on the 7,960-token acceptance prompt at a pinned
/// 20-experts-per-layer pool: peak 7.35/7.70/8.50 GB whole against
/// 7.40/7.75/8.50 blocked at passes of 512/1024/2048, and a 16,384-token
/// `context-check` read 8.58 GB whole against 8.64 GB blocked. The high-water
/// mark sits in the MoE sweep's activations, so bounding attention lowers
/// something that was never the maximum. Output was byte-identical throughout.
///
/// So the default threshold is set to make blocking a **no-op at every
/// configuration the planner produces today**: it engages only above
/// `PrefillSchedule.measuredQueryKeyProduct`, which is exactly where the
/// schedule currently shrinks the pass instead. That keeps the measured
/// envelope unchanged while capping a transient that would otherwise grow
/// without limit as the context cap rises, and it is what would let the pass
/// stay large at a long context rather than halving. Do not turn it on below
/// the threshold expecting memory back; it costs a few percent and returns
/// nothing.
///
/// The block is a function of the pass and the context alone, never of the
/// pool or of what is resident, so it cannot touch the golden-equivalence
/// invariant (§6.1).
public enum AttentionTuning {
    /// Below this a block stops being exact: 128 measured 1.6e-3 of logit
    /// spread against the whole pass, where 256 and up measured 0.0.
    public static let minQueryBlock = 256
    /// Query-by-key elements one call may score before the pass is split. The
    /// same product the prefill schedule treats as measured-safe, so blocking
    /// never engages inside the envelope the measurements cover.
    public static var queryKeyBudget: Int { PrefillSchedule.measuredQueryKeyProduct }

    /// `SLOTSTREAM_ATTN_BLOCK=0` forces the single-call pass at any size (the
    /// A/B arm); any other positive value pins the block.
    static let override: Int? = {
        guard let raw = ProcessInfo.processInfo.environment["SLOTSTREAM_ATTN_BLOCK"],
            let n = Int(raw)
        else { return nil }
        return n
    }()

    /// The query block for a pass of `pass` tokens ending at `context`, or
    /// `Int.max` for "do not split".
    public static func queryBlock(pass: Int, context: Int) -> Int {
        if let o = override { return o <= 0 ? Int.max : o }
        let ctx = Swift.max(1, context)
        if pass * ctx <= queryKeyBudget { return Int.max }
        var b = pass
        while b > minQueryBlock, b * ctx > queryKeyBudget { b /= 2 }
        return b
    }
}

// MARK: - Gated DeltaNet

final class GDNLayer {
    var minimumProjectionRows = 0
    var fuseInputProjection = false
    private(set) var fusedProjectionsScheduled = 0
    let packedInput: PackedProjectionPair?
    var fusedRecording = false
    var phaseProfile: GDNPhaseProfile?
    let layerIndex: Int
    let cfg: ModelConfig
    let inQKV: QLinear
    let inZ: QLinear
    let inB: QLinear
    let inA: QLinear
    let convWeight: MLXArray  // (convDim, K, 1)
    let dtBias: MLXArray
    let aLog: MLXArray
    let norm: RMSNormGated
    let outProj: QLinear
    let keyDim: Int
    let valueDim: Int
    let convDim: Int

    init(_ w: ResidentWeights, layer: Int) {
        layerIndex = layer
        cfg = w.config
        let b = "model.layers.\(layer).linear_attn"
        inQKV = w.linear(b + ".in_proj_qkv")
        inZ = w.linear(b + ".in_proj_z")
        packedInput = w.packedGDNProjections[layer]
        inB = w.linear(b + ".in_proj_b")
        inA = w.linear(b + ".in_proj_a")
        convWeight = w.tensor(b + ".conv1d.weight")
        dtBias = w.tensor(b + ".dt_bias")
        aLog = w.tensor(b + ".A_log")
        norm = RMSNormGated(
            weight: w.tensor(b + ".norm.weight"), eps: cfg.rmsNormEps,
            sigmoidGate: cfg.outputGateType == "sigmoid")
        outProj = w.linear(b + ".out_proj")
        keyDim = cfg.linearNumKHeads * cfg.linearKHeadDim
        valueDim = cfg.linearNumVHeads * cfg.linearVHeadDim
        convDim = 2 * keyDim + valueDim
    }

    func callAsFunction(_ x: MLXArray, cache: LinearCache?) -> MLXArray {
        let (B, S) = (x.dim(0), x.dim(1))
        let profile = phaseProfile
        let inputStart = profile == nil ? 0 : RuntimeClock.now()
        if profile != nil {
            eval([x] + [cache?.convState, cache?.ssmState].compactMap { $0 })
        }
        let preparationStart = profile == nil ? 0 : RuntimeClock.now()
        let mixed: MLXArray, zProjection: MLXArray
        if fuseInputProjection, let packedInput, packedInput.supportsOneToken(x) {
            let projected = packedInput(x)
            mixed = projected.0; zProjection = projected.1
            fusedProjectionsScheduled += 1
        } else {
            mixed = inQKV(x, minimumRows: minimumProjectionRows)
            zProjection = inZ(x, minimumRows: minimumProjectionRows)
        }
        let z = zProjection.reshaped([B, S, cfg.linearNumVHeads, cfg.linearVHeadDim])
        let bProj = inB(x, minimumRows: minimumProjectionRows)
        let aProj = inA(x, minimumRows: minimumProjectionRows)

        let K = cfg.convKernel
        let convState =
            cache?.convState
            ?? MLXArray.zeros([B, K - 1, convDim], dtype: x.dtype)
        let convInput = concatenated([convState, mixed], axis: 1)
        if let c = cache {
            c.convState = convInput[0..., (convInput.dim(1) - (K - 1))..., 0...]
            if c.record {
                // window of K-1 rows ending after position t
                c.convStates = (0 ..< S).map { t in convInput[0..., (t + 1) ..< (t + K), 0...] }
            }
        }
        let convOut = MLXNN.silu(conv1d(convInput, convWeight, groups: convDim))

        var q = convOut[.ellipsis, 0 ..< keyDim]
            .reshaped([B, S, cfg.linearNumKHeads, cfg.linearKHeadDim])
        var k = convOut[.ellipsis, keyDim ..< (2 * keyDim)]
            .reshaped([B, S, cfg.linearNumKHeads, cfg.linearKHeadDim])
        let v = convOut[.ellipsis, (2 * keyDim)...]
            .reshaped([B, S, cfg.linearNumVHeads, cfg.linearVHeadDim])

        q = l2normQK(q) * Float(pow(Double(cfg.linearKHeadDim), -0.5))
        k = l2normQK(k)

        if profile != nil { eval(q, k, v, z, aProj, bProj, aLog, dtBias) }
        let recurrenceStart = profile == nil ? 0 : RuntimeClock.now()

        let y: MLXArray
        if let c = cache, c.record, S > 1, fusedRecording {
            let recorded = gatedDeltaUpdateRecording(q: q, k: k, v: v, a: aProj, b: bProj,
                aLog: aLog, dtBias: dtBias, state: c.ssmState)
            y = recorded.output
            c.ssmStates = recorded.states
            c.ssmState = recorded.states.last
        } else if let c = cache, c.record, S > 1 {
            // Step the recurrence one token at a time so every intermediate
            // state is available for a speculative rollback. The state is
            // fp32 between steps exactly as inside the fused kernel, so the
            // outputs match the batched pass.
            var st = c.ssmState
            var ys: [MLXArray] = []
            var states: [MLXArray] = []
            for t in 0 ..< S {
                let (yt, nt) = gatedDeltaUpdate(
                    q: q[0..., t ..< (t + 1)], k: k[0..., t ..< (t + 1)], v: v[0..., t ..< (t + 1)],
                    a: aProj[0..., t ..< (t + 1)], b: bProj[0..., t ..< (t + 1)],
                    aLog: aLog, dtBias: dtBias, state: st, mask: nil)
                ys.append(yt)
                states.append(nt)
                st = nt
            }
            y = concatenated(ys, axis: 1)
            c.ssmStates = states
            c.ssmState = st
        } else {
            let (yy, newState) = gatedDeltaUpdate(
                q: q, k: k, v: v, a: aProj, b: bProj,
                aLog: aLog, dtBias: dtBias,
                state: cache?.ssmState, mask: nil)
            cache?.ssmState = newState
            y = yy
        }
        if profile != nil {
            eval([y] + [cache?.ssmState].compactMap { $0 } + (cache?.ssmStates ?? []))
        }
        let finishStart = profile == nil ? 0 : RuntimeClock.now()
        let result = outProj(norm(y, gate: z).reshaped([B, S, valueDim]), minimumRows: minimumProjectionRows)
        if let profile {
            eval([result] + [cache?.convState].compactMap { $0 } + (cache?.convStates ?? []))
            let end = RuntimeClock.now()
            profile.append(layer: layerIndex, tokens: S,
                input: Double(preparationStart - inputStart) / 1e9,
                preparation: Double(recurrenceStart - preparationStart) / 1e9,
                recurrence: Double(finishStart - recurrenceStart) / 1e9,
                finish: Double(end - finishStart) / 1e9)
        }
        return result
    }
}

// MARK: - MoE

final class MoELayer {
    var minimumProjectionRows = 0
    // Context qualification successor: preserve the established grouped QMM
    // arithmetic for bounded 64/128-token prefill. Decode is unchanged.
    var smallPrefillSweep = false
    var contextNumericsObserver: ((String, MLXArray) -> Void)?
    private(set) var smallPrefillSweeps = 0
    var specializedRouter = false
    var overlapShared = false
    private(set) var sharedPrelaunches = 0
    var overlapResident = false
    private(set) var residentPrelaunches = 0
    private(set) var residentJoins = 0
    private(set) var residentJoinSeconds = 0.0
    var routerObserver: ((Int, [Int32]) -> Void)?
    var useLayerWorkspace = false
    var workspaceTokenTile = 256
    var workspaceComputeRanges: [Range<Int>] = []
    var disjointOutput = false
    var boundedRows = false
    let cfg: ModelConfig
    let layer: Int
    let routerProjection: RouterProjection
    let sharedGate: QLinear
    let sharedGateProj: QLinear
    let sharedUpProj: QLinear
    let sharedDownProj: QLinear
    let pool: SlotPool

    init(_ w: ResidentWeights, layer: Int, pool: SlotPool) {
        cfg = w.config
        self.layer = layer
        self.pool = pool
        let b = "model.layers.\(layer).mlp"
        routerProjection = RouterProjection(w.tensor(b + ".gate.weight"))
        sharedGate = w.linear(b + ".shared_expert_gate")
        sharedGateProj = w.linear(b + ".shared_expert.gate_proj")
        sharedUpProj = w.linear(b + ".shared_expert.up_proj")
        sharedDownProj = w.linear(b + ".shared_expert.down_proj")
    }

    func callAsFunction(_ x: MLXArray) throws -> MLXArray {
        let (B, S) = (x.dim(0), x.dim(1))
        // The reference matmul promotes the BF16 router to FP32. An optional
        // pre-materialized copy removes that repeated conversion at extra cost.
        let logits: MLXArray
        if useLayerWorkspace, !workspaceComputeRanges.isEmpty {
            var pieces: [MLXArray] = []
            for range in workspaceComputeRanges {
                let piece = routerProjection(x[0..., range, 0...])
                eval(piece); pieces.append(piece)
            }
            logits = concatenated(pieces, axis: 1)
        } else { logits = routerProjection(x) }
        contextNumericsObserver?("router", logits)
        let idx = RouterSelection.indices(logits, k: cfg.topK, enabled: specializedRouter)
        let weights = softmax(takeAlong(logits, idx, axis: -1), axis: -1, precise: true)

        // routing decision to CPU
        let expertIds = idx.asType(.int32).asArray(Int32.self)  // B*S*topK
        if RouterTrace.on {
            RouterTrace.record(layer: layer, tokens: B * S, topK: cfg.topK, ids: expertIds)
        }
        routerObserver?(layer, expertIds)
        func sharedParts(_ input: MLXArray) -> (MLXArray, MLXArray) {
            let value = sharedDownProj(MLXNN.silu(sharedGateProj(input, minimumRows: minimumProjectionRows))
                * sharedUpProj(input, minimumRows: minimumProjectionRows), minimumRows: minimumProjectionRows)
            let gate = sharedGate(input, minimumRows: minimumProjectionRows)
            contextNumericsObserver?("sharedValue", value)
            contextNumericsObserver?("sharedGate", gate)
            return (value, gate)
        }
        func shared(_ input: MLXArray) -> MLXArray {
            let (value, gate) = sharedParts(input)
            return sigmoid(gate) * value
        }
        // Router materialization above has already completed the input and
        // every prior pool reader. These resident projections do not read or
        // mutate expert slots, so their work can run while ensure/sweep reads.
        // Stop at the two matmul outputs: leave the final sigmoid/product/add
        // in the original graph to preserve its rounding/fusion boundary.
        var earlyShared: (MLXArray, MLXArray)?
        if overlapShared && !useLayerWorkspace {
            let parts = sharedParts(x)
            asyncEval(parts.0, parts.1)
            earlyShared = parts
            sharedPrelaunches += 1
        }
        pool.unpinAll()
        let routed: MLXArray
        if useLayerWorkspace, B * S >= SweepTuning.minTokens {
            routed = try workspaceRouted(x, expertIds: expertIds, weights: weights)
        } else {
            let smallSweep = smallPrefillSweep && B * S >= 64 && B * S < 256
                && SweepTuning.minTokens != Int.max
            if smallSweep { smallPrefillSweeps += 1 }
            let experts = try B * S >= SweepTuning.minTokens || smallSweep
                ? sweep(x, expertIds: expertIds) : cached(x, expertIds: expertIds)
            routed = (experts * weights.expandedDimensions(axis: -1)).sum(axis: -2).asType(x.dtype)
        }

        contextNumericsObserver?("routed", routed)
        if useLayerWorkspace, !workspaceComputeRanges.isEmpty {
            var outputs: [MLXArray] = []
            for range in workspaceComputeRanges {
                let value = shared(x[0..., range, 0...])
                eval(value); outputs.append(value)
            }
            return routed + concatenated(outputs, axis: 1)
        }
        if let (value, gate) = earlyShared { return routed + sigmoid(gate) * value }
        return routed + shared(x)
    }

    /// Workspace C: keep one layer's expert weights, reduce one token tile
    /// at a time in canonical router-rank order, and retain only N x H output.
    /// It trades E x recordBytes for removing N x K x H live output/product.
    private func workspaceRouted(_ x: MLXArray, expertIds: [Int32], weights: MLXArray) throws -> MLXArray {
        let (B, S, K, H, E) = (x.dim(0), x.dim(1), cfg.topK, cfg.hiddenSize, cfg.numExperts)
        let countStart = RuntimeClock.now()
        var count = [Int](repeating: 0, count: E)
        for e in expertIds { count[Int(e)] += 1 }
        let active = (0 ..< E).filter { count[$0] > 0 }
        pool.sweepSortSeconds += RuntimeClock.seconds(since: countStart)
        let w = try pool.layerWorkspaceChecked(layer: layer, experts: active)
        MemTrace.mark("workspace-loaded", nil)
        if pool.admitOnSweep, SlotPool.sweepAdmitEnabled {
            let quota = max(1, pool.slots / cfg.numLayers)
            // Share reads across the scope while preserving the existing
            // final chronological pass's admission policy and decode warmth.
            var admissionCount = count
            if let tail = workspaceComputeRanges.last {
                admissionCount = [Int](repeating: 0, count: E)
                for e in expertIds[(tail.lowerBound * K) ..< (tail.upperBound * K)] { admissionCount[Int(e)] += 1 }
            }
            let hot = active.filter { admissionCount[$0] > 0 }.sorted {
                admissionCount[$0] != admissionCount[$1] ? admissionCount[$0] > admissionCount[$1] : $0 < $1
            }
            let picked = Array(hot.prefix(quota)).sorted { a, b in
                let ar = pool.isResident(ExpertKey(layer, a)), br = pool.isResident(ExpertKey(layer, b))
                return ar != br ? ar : a < b
            }
            pool.admit(layer: layer, experts: picked, rows: picked, from: w)
            pool.commitAdmissions()
        }
        MemTrace.mark("workspace-admitted", nil)
        let flat = x.reshaped([B * S, H])
        let routeWeights = weights.reshaped([B * S, K])
        var outs: [MLXArray] = []
        var lo = 0
        while lo < B * S {
            var hi = min(B * S, lo + min(4096, max(256, workspaceTokenTile)))
            // Merge only a small dispatch tail, not an entire nearly-full
            // tile. The live output bound is tile + 255 tokens.
            if B * S - hi < 256 { hi = B * S }
            let n = hi - lo, rows = n * K
            let sortStart = RuntimeClock.now()
            let ids = Array(expertIds[(lo * K) ..< (hi * K)])
            var starts = [Int](repeating: 0, count: E + 1)
            for e in ids { starts[Int(e) + 1] += 1 }
            for e in 0 ..< E { starts[e + 1] += starts[e] }
            var fill = starts
            var order = [Int32](repeating: 0, count: rows)
            for (r, e) in ids.enumerated() {
                order[fill[Int(e)]] = Int32(r); fill[Int(e)] += 1
            }
            var inverse = [Int32](repeating: 0, count: rows)
            for (sorted, original) in order.enumerated() { inverse[Int(original)] = Int32(sorted) }
            var ridx = order.map { ids[Int($0)] }
            pool.sweepSortSeconds += RuntimeClock.seconds(since: sortStart)
            var gathered = flat[MLXArray(order.map { Int32(lo) + $0 / Int32(K) })].expandedDimensions(axis: 1)
            let pad = max(0, max(16, 4 * E) - rows)
            if pad > 0 {
                ridx.append(contentsOf: repeatElement(ridx.last!, count: pad))
                gathered = concatenated([gathered,
                    broadcast(gathered[(rows - 1) ..< rows], to: [pad, 1, H])], axis: 0)
            }
            let indices = MLXArray(ridx)
            let g = gatherQuantizedMM(gathered, w[0], scales: w[1], biases: w[2], rhsIndices: indices,
                transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits, sortedIndices: true)
            let u = gatherQuantizedMM(gathered, w[3], scales: w[4], biases: w[5], rhsIndices: indices,
                transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits, sortedIndices: true)
            let d = gatherQuantizedMM(MLXNN.silu(g) * u, w[6], scales: w[7], biases: w[8], rhsIndices: indices,
                transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits, sortedIndices: true)
            let canonical = d[0 ..< rows].squeezed(axis: 1)[MLXArray(inverse)].reshaped([n, K, H])
            let reduced = (canonical * routeWeights[lo ..< hi].expandedDimensions(axis: -1))
                .sum(axis: -2).asType(x.dtype)
            let waitStart = RuntimeClock.now()
            eval(reduced)
            MemTrace.mark("workspace-reduced", nil)
            pool.sweepWaitSeconds += RuntimeClock.seconds(since: waitStart)
            outs.append(reduced)
            lo = hi
        }
        return concatenated(outs, axis: 0).reshaped([B, S, H])
    }

    /// The pool path: pin the routed experts in the slot pool and gather over
    /// it, one matvec per (token, expert). Returns every expert's output,
    /// (B,S,topK,H).
    private func cached(_ x: MLXArray, expertIds: [Int32]) throws -> MLXArray {
        let (B, S) = (x.dim(0), x.dim(1))
        var uniq: [ExpertKey] = []
        var seen: [ExpertKey: Int] = [:]
        for e in expertIds {
            let key = ExpertKey(layer, Int(e))
            if seen[key] == nil {
                seen[key] = uniq.count
                uniq.append(key)
            }
        }
        func project(_ slotIds: [Int32]) -> MLXArray {
            let count = slotIds.count / (B * S)
            let slotIdx = MLXArray(slotIds, [B, S, count])
            let xe = x.expandedDimensions(axes: [-2, -3])
            let g = gatherQuantizedMM(
                xe, pool.pools[0], scales: pool.pools[1], biases: pool.pools[2],
                rhsIndices: slotIdx, transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits)
            let u = gatherQuantizedMM(
                xe, pool.pools[3], scales: pool.pools[4], biases: pool.pools[5],
                rhsIndices: slotIdx, transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits)
            let hidden = MLXNN.silu(g) * u
            return gatherQuantizedMM(
                hidden, pool.pools[6], scales: pool.pools[7], biases: pool.pools[8],
                rhsIndices: slotIdx, transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits)
                .squeezed(axis: -2)
        }
        var readyRanks: [Int] = []
        var ready: MLXArray?
        let slotOf: [Int]
        // Only split the batch of independent one-row QMV operations. Larger
        // token batches retain the original kernel/grouping and sweep rules.
        if overlapResident && B == 1 && S == 1 {
            slotOf = try pool.ensureOverlapping(uniq, reservedHits: { existing in
                readyRanks = expertIds.indices.filter { existing[seen[ExpertKey(self.layer, Int(expertIds[$0]))]!] >= 0 }
                guard !readyRanks.isEmpty else { return }
                let slots = readyRanks.map { Int32(existing[seen[ExpertKey(self.layer, Int(expertIds[$0]))]!]) }
                ready = project(slots)
                asyncEval(ready!)
                self.residentPrelaunches += 1
            }, finishReaders: {
                if let ready {
                    let start = RuntimeClock.now()
                    eval(ready)
                    self.residentJoins += 1
                    self.residentJoinSeconds += RuntimeClock.seconds(since: start)
                }
            })
        } else { slotOf = try pool.ensureChecked(uniq) }
        let slotIds = expertIds.map { Int32(slotOf[seen[ExpertKey(layer, Int($0))]!]) }
        guard let ready else { return project(slotIds) }
        let readySet = Set(readyRanks)
        let missingRanks = expertIds.indices.filter { !readySet.contains($0) }
        let missing = project(missingRanks.map { slotIds[$0] })
        let order = readyRanks + missingRanks
        var inverse = Array(repeating: Int32(0), count: expertIds.count)
        for (position, rank) in order.enumerated() { inverse[rank] = Int32(position) }
        // The outer router weighting/reduction still sees original rank order.
        return take(concatenated([ready, missing], axis: 2), MLXArray(inverse), axis: 2)
    }

    /// The sweep (PLAN §3.3): rows sorted by expert; the layer's experts in
    /// groups of `ExpertStore.defaultLoadBatch`, resident ones copied out of
    /// the pool and the rest read from the checkpoint in contiguous runs; one
    /// grouped GEMM per projection and group over that group's rows. Sorting
    /// the rows is what reaches MLX's `gather_qmm_rhs` kernel, which reads an
    /// expert's weights once per tile of tokens instead of once per token —
    /// where the old pass spent most of its compute. Resident groups go first
    /// so that admission (final pass only) can never evict a resident expert
    /// this layer has not copied yet.
    private func sweep(_ x: MLXArray, expertIds: [Int32]) throws -> MLXArray {
        let (B, S, K, H, E) = (x.dim(0), x.dim(1), cfg.topK, cfg.hiddenSize, cfg.numExperts)
        let rows = B * S * K
        let tSort = RuntimeClock.now()
        var count = [Int](repeating: 0, count: E)
        for e in expertIds { count[Int(e)] += 1 }
        let resident = (0 ..< E).map { count[$0] > 0 && pool.isResident(ExpertKey(layer, $0)) }
        // Counting sort of the rows by (resident first, then expert id):
        // stable, linear, and a function of the routing alone.
        func bucket(_ e: Int) -> Int { (resident[e] ? 0 : E) + e }
        var start = [Int](repeating: 0, count: 2 * E + 1)
        for e in 0 ..< E where count[e] > 0 { start[bucket(e) + 1] = count[e] }
        for b in 0 ..< 2 * E { start[b + 1] += start[b] }
        var fill = start
        var order = [Int32](repeating: 0, count: rows)
        for (r, e) in expertIds.enumerated() {
            let b = bucket(Int(e))
            order[fill[b]] = Int32(r)
            fill[b] += 1
        }
        var invOrder = disjointOutput ? [] : [Int32](repeating: 0, count: rows)
        if !disjointOutput {
            for (s, r) in order.enumerated() { invOrder[Int(r)] = Int32(s) }
        }
        pool.sweepSortSeconds += RuntimeClock.seconds(since: tSort)
        // The token each sorted row belongs to. Gathering the rows for the
        // whole pass up front materialised one replicated copy of it —
        // rows x hidden, so K=10 times the hidden state, 105 MB at a
        // 2048-token pass and 210 at 4096 — and held it for the whole layer
        // while each group used a 32-expert slice. The gather happens per
        // group instead; the kernel is handed exactly the same rows in the
        // same order, so the arithmetic is untouched.
        let flat = x.reshaped([B * S, H])
        let tokenOf = order.map { $0 / Int32(K) }
        // SLOTSTREAM_SWEEP_ROWS=all restores the up-front gather for an A/B.
        let xsAll: MLXArray? = SweepTuning.gatherAllRows
            ? flat[MLXArray(tokenOf)].expandedDimensions(axis: 1) : nil

        // The final pass of a prompt admits each layer's hottest experts, its
        // fair share of the pool, so decode starts warm.
        var admitSet = Set<Int>()
        if pool.admitOnSweep, SlotPool.sweepAdmitEnabled {
            let quota = max(1, pool.slots / cfg.numLayers)
            let hot = (0 ..< E).filter { count[$0] > 0 }
                .sorted { count[$0] != count[$1] ? count[$0] > count[$1] : $0 < $1 }
            admitSet = Set(hot.prefix(quota))
        }

        let groupSize = ExpertStore.defaultLoadBatch
        var outs: [MLXArray] = []
        var orderedOutput: MLXArray? = disjointOutput
            ? MLXArray.zeros([rows, H], dtype: x.dtype) : nil
        var inFlight: MLXArray? = nil
        for source in 0 ..< 2 {  // 0: resident (out of the pool), 1: from the checkpoint
            let ids = (0 ..< E).filter { count[$0] > 0 && resident[$0] == (source == 0) }
            var lo = 0
            while lo < ids.count {
                let hi = min(lo + groupSize, ids.count)
                let group = Array(ids[lo ..< hi])
                let w = try
                    source == 0
                    ? pool.gatherResident(group.map { ExpertKey(layer, $0) })
                    : pool.readStagedChecked(layer: layer, experts: group)
                let rowLo = start[bucket(group[0])]
                let rowHi = start[bucket(group[group.count - 1]) + 1]
                // Admission remains once per loaded group. All of its rows
                // reuse these exact weight arrays, including across row tiles.
                if !admitSet.isEmpty {
                    let picks = group.enumerated().filter { admitSet.contains($0.element) }
                    if !picks.isEmpty {
                        pool.admit(
                            layer: layer, experts: picks.map { $0.element },
                            rows: picks.map { $0.offset }, from: w)
                    }
                }
                var localOf = [Int32](repeating: -1, count: E)
                for (j, e) in group.enumerated() { localOf[e] = Int32(j) }
                let tileSize = boundedRows ? 256 : rowHi - rowLo
                var row = rowLo
                while row < rowHi {
                    let end = min(row + tileSize, rowHi)
                    let n = end - row
                    // Preserve the grouped kernel dispatch even for a short
                    // tile. Padding repeats its last real row and expert.
                    let pad = max(0, max(16, 4 * group.count) - n)
                    var local = order[row ..< end].map { localOf[Int(expertIds[Int($0)])] }
                    local.append(contentsOf: repeatElement(local.last!, count: pad))
                    var xg = xsAll.map { $0[row ..< end] }
                        ?? flat[MLXArray(Array(tokenOf[row ..< end]))].expandedDimensions(axis: 1)
                    if pad > 0 {
                        xg = concatenated(
                            [xg, broadcast(xg[(n - 1) ..< n], to: [pad, 1, H])], axis: 0)
                    }
                    let ridx = MLXArray(local)
                    let g = gatherQuantizedMM(
                        xg, w[0], scales: w[1], biases: w[2], rhsIndices: ridx, transpose: true,
                        groupSize: cfg.qGroup, bits: cfg.qBits, sortedIndices: true)
                    let u = gatherQuantizedMM(
                        xg, w[3], scales: w[4], biases: w[5], rhsIndices: ridx, transpose: true,
                        groupSize: cfg.qGroup, bits: cfg.qBits, sortedIndices: true)
                    let dAll = gatherQuantizedMM(
                        MLXNN.silu(g) * u, w[6], scales: w[7], biases: w[8], rhsIndices: ridx,
                        transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits, sortedIndices: true)
                    let d = pad > 0 ? dAll[0 ..< n] : dAll
                    let completed: MLXArray
                    if let output = orderedOutput {
                        // Router rank is the destination, with each row written
                        // exactly once. No floating-point accumulation here;
                        // the existing K-axis reduction below is unchanged.
                        completed = putAlong(output,
                            MLXArray(Array(order[row ..< end])).expandedDimensions(axis: 1),
                            values: d.squeezed(axis: 1), axis: 0)
                        orderedOutput = completed
                    } else {
                        outs.append(d)
                        completed = d
                    }
                    asyncEval(completed)
                    if let prev = inFlight {
                        let tWait = RuntimeClock.now()
                        eval(prev)
                        pool.sweepWaitSeconds += RuntimeClock.seconds(since: tWait)
                    }
                    inFlight = completed
                    row = end
                }
                lo = hi
            }
        }
        pool.commitAdmissions()
        if let output = orderedOutput { return output.reshaped([B, S, K, H]) }
        let all = concatenated(outs, axis: 0).squeezed(axis: 1)  // (rows, H), sorted
        return all[MLXArray(invOrder)].reshaped([B, S, K, H])
    }
}

/// The prefill sweep's one knob, public so `sweep-check` can flip it in
/// process and measurements can A/B it (`SLOTSTREAM_SWEEP=0`).
public enum SweepTuning {
    /// Inputs of this many tokens or more, which only a prefill pass is, take
    /// the sweep: each layer's routed experts stream through staging groups
    /// and MLX's grouped GEMM and never touch the slot pool. Shorter inputs
    /// (decode, speculative verify passes, short follow-up turns) gather over
    /// the pool as before. The choice is a function of the token count alone,
    /// never of the pool, so pool size and contents still cannot change the
    /// math (the golden-equivalence invariant). `Int.max` forces the pool path
    /// at every size.
    /// Whether the sweep gathers every sorted row up front (what shipped
    /// through 0.2.3) instead of per staging group. `SLOTSTREAM_SWEEP_ROWS=all`
    /// restores it for an A/B; the rows the kernel sees are identical either
    /// way, only how long the replicated copy is held changes.
    public static let gatherAllRows: Bool =
        ProcessInfo.processInfo.environment["SLOTSTREAM_SWEEP_ROWS"] == "all"

    public static var minTokens: Int =
        ProcessInfo.processInfo.environment["SLOTSTREAM_SWEEP"] == "0" ? Int.max : 256
}

// MARK: - hyper-connections

final class GatedResidual {
    var minimumProjectionRows = 0
    var compiledNormFinish = false
    private(set) var compiledFinishes = 0
    let cfg: ModelConfig
    let hcNorm: RMSNorm
    let down: QLinear
    let up: QLinear
    let inject: MLXArray?  // (hc, hcDim), bf16
    var debugName: String? = nil

    init(_ w: TensorSource, base: String, useCombine: Bool) {
        cfg = w.config
        hcNorm = RMSNorm(
            weight: w.tensor(base + ".hc_norm.weight"), eps: cfg.rmsNormEps,
            groupSize: cfg.hiddenSize)
        down = w.linear(base + ".input_mix_weight_down")
        up = w.linear(base + ".input_mix_weight_up")
        inject = useCombine ? w.tensor(base + ".block_inject_weight.weight") : nil
    }

    /// hyper (B,S,hc*H) -> (mixed (B,S,H), hyper, inject (B,S,hc)) or just mixed.
    func callAsFunction(_ hyper: MLXArray) -> (MLXArray, MLXArray?) {
        let useCompiled = compiledNormFinish && CompiledArithmetic.prepare()
        if useCompiled { compiledFinishes += 1 }
        let normed = hcNorm(hyper, compiledFinish: useCompiled)
        if let n = debugName { Qwen4ExpModel.debugDump(n + "_normed", normed) }
        let downOut = down(normed, minimumRows: minimumProjectionRows)
        if let n = debugName { Qwen4ExpModel.debugDump(n + "_down", downOut) }
        var w = MLXNN.silu(downOut / Float(cfg.hcCount))
        w = sigmoid(up(w, minimumRows: minimumProjectionRows))
        if let n = debugName { Qwen4ExpModel.debugDump(n + "_wup", w) }
        let shape = Array(w.shape.dropLast()) + [cfg.hcCount, cfg.hiddenSize]
        let mixed = (w.reshaped(shape) * normed.reshaped(shape)).mean(axis: -2)
        guard let injW = inject else { return (mixed, nil) }
        let projected = QLinear.withReferenceRows(normed, minimumRows: minimumProjectionRows) { matmul($0, injW.transposed()) }
        let injected = 2 * sigmoid(projected / Float(cfg.hcCount))
        return (mixed, injected)
    }
}

// MARK: - PLE

final class PLELayer {
    var minimumProjectionRows = 0
    var boundedTokens = false
    let cfg: ModelConfig
    let store: NgramStore
    let keyProj: QLinear
    let valueProj: QLinear
    let normKey: RMSNorm
    let normQuery: RMSNorm
    let normConv: RMSNorm
    let convWeight: MLXArray
    let dilation: Int
    let stateLen: Int

    init(_ w: ResidentWeights, layer: Int, store: NgramStore) {
        cfg = w.config
        self.store = store
        let b = "model.layers.\(layer).ple"
        keyProj = w.linear(b + ".key_proj")
        valueProj = w.linear(b + ".value_proj")
        let hcDim = cfg.hcCount * cfg.hiddenSize
        _ = hcDim
        normKey = RMSNorm(weight: w.tensor(b + ".norm_key.weight"), eps: cfg.rmsNormEps, groupSize: cfg.hiddenSize)
        normQuery = RMSNorm(weight: w.tensor(b + ".norm_query.weight"), eps: cfg.rmsNormEps, groupSize: cfg.hiddenSize)
        normConv = RMSNorm(weight: w.tensor(b + ".norm_conv.weight"), eps: cfg.rmsNormEps, groupSize: cfg.hiddenSize)
        convWeight = w.tensor(b + ".conv1d.weight")
        dilation = cfg.ngramSize
        stateLen = (cfg.pleConvKernel - 1) * dilation
    }

    private func shortConv(_ x: MLXArray, cache: LinearCache?) -> MLXArray {
        let S = x.dim(1)
        let state =
            cache?.pleConvState
            ?? MLXArray.zeros([x.dim(0), stateLen, x.dim(-1)], dtype: x.dtype)
        let full = concatenated([state, x], axis: 1)
        if let c = cache {
            c.pleConvState = full[0..., (full.dim(1) - stateLen)..., 0...]
            if c.record {
                c.pleConvStates = (0 ..< S).map { t in full[0..., (t + 1) ..< (t + 1 + stateLen), 0...] }
            }
        }
        let window = full[0..., (full.dim(1) - (stateLen + S))..., 0...]
        return MLXNN.silu(conv1d(window, convWeight, dilation: dilation, groups: convWeight.dim(0)))
    }

    /// hidden (B,S,hc*H); ids/prevCtx handled CPU-side via NgramStore.
    func callAsFunction(_ hidden: MLXArray, history: [Int64], nNew: Int, cache: LinearCache?) throws -> MLXArray {
        if boundedTokens, nNew > 256, let cache, !cache.record {
            var outputs: [MLXArray] = []
            let base = history.count - nNew
            for lo in stride(from: 0, to: nNew, by: 256) {
                let hi = min(nNew, lo + 256)
                let contextStart = max(0, base + lo - (cfg.ngramSize - 1))
                let ids = Array(history[contextStart ..< base + hi])
                let result = try transform(hidden[0..., lo ..< hi, 0...], history: ids, nNew: hi - lo, cache: cache)
                // Materialize before the next tile replaces the convolution
                // window. Projection, gating and conv workspaces stay bounded.
                eval(result)
                outputs.append(result)
            }
            return concatenated(outputs, axis: 1)
        }
        return try transform(hidden, history: history, nNew: nNew, cache: cache)
    }

    private func transform(_ hidden: MLXArray, history: [Int64], nNew: Int, cache: LinearCache?) throws -> MLXArray {
        let emb = try store.embeddingChecked(history: history, nNew: nNew).asType(hidden.dtype)
        var key = normKey(keyProj(emb, minimumRows: minimumProjectionRows))
        let keyShape = Array(key.shape.dropLast()) + [cfg.hcCount, cfg.hiddenSize]
        key = key.reshaped(keyShape)
        let value = valueProj(emb, minimumRows: minimumProjectionRows)
        var query = normQuery(hidden)
        query = query.reshaped(keyShape)

        var gate = (key * query).sum(axis: -1, keepDims: true) / sqrt(Float(cfg.hiddenSize))
        gate = sqrt(maximum(abs(gate), 1e-6)) * sign(gate)
        var gated = sigmoid(gate) * value.expandedDimensions(axis: -2)
        gated = gated.reshaped(Array(gated.shape.dropLast(2)) + [cfg.hcCount * cfg.hiddenSize])
        return gated + shortConv(normConv(gated), cache: cache)
    }
}

```

## /Users/carlos/Projects/slotstream/.build/optimization/indexer-component-v204/probe/indexer_score_probe.py

SHA256 `2d4e35ab66d49e4d0cb42b68e0ddf043c20cbbe18b0730bce87926f00fcd65a4`

```
#!/usr/bin/env python3
"""Bounded four-head indexer score prototype; never production dispatch.

The original FP32 GEMM is compared with one SIMD group per head and one
threadgroup per query/block pair. Positive parts are taken before summing
heads. This removes the four score planes but changes dot-product grouping;
numerical, selection, trained-state and serving gates remain distinct.
MLX is imported only after taking the shared reservation and checking memory.
"""
import argparse
import fcntl
import hashlib
import importlib.metadata
import json
import math
import os
from pathlib import Path
import resource
import shutil
import signal
import statistics
import sys
import tarfile
import time

from prefill_bench import digest, preflight, vm_snapshot
from serve_bench import competing_jobs, verified_build, wait_for_quiet_workspace


KERNEL = r'''
const uint lane = thread_index_in_simdgroup;
const uint head = simdgroup_index_in_threadgroup;
const uint pair = threadgroup_position_in_grid.x;
const uint row = pair / Blocks, block = pair % Blocks;
threadgroup float positive[4];
float dot = 0.0f;
for (uint d = lane; d < 128; d += 32) {
    dot = fma(query[(row * 4 + head) * 128 + d],
              key[block * 128 + d], dot);
}
dot = simd_sum(dot);
// Match MLX Maximum's floating-point branch, including NaN and signed zero.
if (lane == 0) positive[head] = metal::isnan(dot) ? dot : (dot > 0.0f ? dot : 0.0f);
threadgroup_barrier(mem_flags::mem_threadgroup);
if (head == 0 && lane == 0) {
    float total = positive[0];
    total = total + positive[1];
    total = total + positive[2];
    total = total + positive[3];
    output[pair] = total / denominator[0];
}
'''


def contract():
    return {
        'classification': 'Synthetic FP32 score component; no model, capacity or serving claim',
        'heads': 4, 'head_dim': 128, 'compression_ratio': 4, 'block_top_k': 512,
        'seed': 20260906177, 'mlx': '0.31.1',
        'correctness_shapes': [[q, n] for q in [1, 8, 64, 256] for n in [511, 512, 513, 2048]],
        'special_inputs': ['zero', 'opposed-heads', 'tied-keys', 'cancellation', 'nan', 'infinity'],
        'timing_shapes': [[1, 2048], [256, 2048], [256, 8192]],
        'rounds': 5, 'calls_per_cell': 16, 'warmups_per_arm': 2,
        'reverse_even_round_order': True, 'replacement_rounds': 0,
        'minimum_clean_pairs': 5, 'minimum_median_reduction': .05,
        'minimum_positive_fraction': .8, 'required_exact_visible_keep_masks': True,
        'timing_inputs_require_own_numerical_and_selection_checks': True,
        'numerical_bound': 'Each finite score versus FP64: 2*gamma(132)*sum(abs(q*k) over finite dot-product heads)/sqrt(128) + 8*FP32.tiny; gamma(n)=n*epsilon/(1-n*epsilon). Negative-infinite heads have exactly zero positive part; exceptional patterns must also match.',
        'maximum_lifetime_rss_bytes': 2_000_000_000,
        'maximum_mlx_peak_bytes': 1_000_000_000,
        'require_nominal_thermal_state_and_normal_power': True,
        'required_reclaimable_gb': 7,
        'abort_on_resource_change': True,
        'initial_quiet_seconds': 180,
        'maximum_run_seconds': 900,
        'later_gates': 'A component win only earns trained-model state/route and fixed-total-memory serving qualification; no default change here.',
    }


def operating_conditions():
    """Read the same Foundation observations as native ProcessMemory."""
    import ctypes
    ctypes.CDLL('/System/Library/Frameworks/Foundation.framework/Foundation')
    objc = ctypes.CDLL('/usr/lib/libobjc.A.dylib')
    objc.objc_getClass.argtypes = [ctypes.c_char_p]
    objc.objc_getClass.restype = ctypes.c_void_p
    objc.sel_registerName.argtypes = [ctypes.c_char_p]
    objc.sel_registerName.restype = ctypes.c_void_p
    pointer = ctypes.CFUNCTYPE(ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p)(('objc_msgSend', objc))
    integer = ctypes.CFUNCTYPE(ctypes.c_long, ctypes.c_void_p, ctypes.c_void_p)(('objc_msgSend', objc))
    boolean = ctypes.CFUNCTYPE(ctypes.c_bool, ctypes.c_void_p, ctypes.c_void_p)(('objc_msgSend', objc))
    info = pointer(objc.objc_getClass(b'NSProcessInfo'), objc.sel_registerName(b'processInfo'))
    if not info:
        raise RuntimeError('Foundation process observation unavailable')
    thermal = integer(info, objc.sel_registerName(b'thermalState'))
    low_power = boolean(info, objc.sel_registerName(b'isLowPowerModeEnabled'))
    if thermal not in [0, 1, 2, 3] or low_power not in [0, 1]:
        raise RuntimeError('unrecognized Foundation operating conditions')
    return {'thermal_state': thermal, 'low_power': bool(low_power), 'nominal': thermal == 0 and low_power == 0}


def paired_result(cells, spec):
    rounds = {}
    for cell in cells:
        key = (cell['round'], cell['arm'])
        if (type(key[0]) is not int or not 1 <= key[0] <= spec['rounds']
                or key[1] not in ['reference', 'fused'] or key in rounds):
            raise ValueError('duplicate, extra or foreign component cell')
        seconds = cell.get('seconds')
        if type(seconds) not in [int, float] or not math.isfinite(seconds) or seconds <= 0:
            raise ValueError('completed component time must be positive and finite')
        rounds[key] = cell
    reductions = []
    for number in range(1, spec['rounds'] + 1):
        a, b = rounds.get((number, 'reference')), rounds.get((number, 'fused'))
        if a is not None and b is not None and a.get('valid') is True and b.get('valid') is True:
            reductions.append(1 - b['seconds'] / a['seconds'])
    median = statistics.median(reductions) if reductions else None
    positive = sum(x > 0 for x in reductions) / len(reductions) if reductions else None
    complete = len(rounds) == 2 * spec['rounds']
    return {'complete': complete, 'clean_pairs': len(reductions), 'reductions': reductions,
            'median_reduction': median, 'positive_fraction': positive,
            'component_benefit_passed': complete and len(reductions) >= spec['minimum_clean_pairs']
            and median >= spec['minimum_median_reduction'] and positive >= spec['minimum_positive_fraction']}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--candidate', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    if sys.platform != 'darwin':
        raise ValueError('the RSS byte contract and Metal prototype require macOS')
    if any(k.startswith('SLOTSTREAM_') for k in os.environ):
        raise ValueError('component screen forbids inference environment overrides')
    if competing_jobs():
        raise RuntimeError('another build/storage job is running; component was not launched')
    build = verified_build(args.candidate / 'slotstream')
    spec = contract()
    if importlib.metadata.version('mlx') != spec['mlx']:
        raise ValueError('requires pinned MLX 0.31.1')
    source_name = 'Sources/Slotstream/Layers.swift'
    with tarfile.open(args.candidate / 'build-source.tar.gz') as archive:
        source = archive.extractfile(source_name).read()
    if digest_bytes(source) != build['identity']['source'][source_name]:
        raise ValueError('reference score source identity differs')
    if b'scores = maximum(scores, 0).sum(axis: -1) / sqrt(Float(headDim))' not in source:
        raise ValueError('review changed reference score arithmetic before making a successor')
    args.out.mkdir(parents=True, exist_ok=False)
    record = {'protocol': spec, 'reference_build': build, 'checks': [], 'timings': [],
              'completed': False, 'correctness_passed': False, 'inference_adopted': False,
              'probe_sha256': digest(Path(__file__))}
    shutil.copy2(__file__, args.out / Path(__file__).name)
    (args.out / 'Layers.swift').write_bytes(source)
    (args.out / 'kernel.metal').write_text(KERNEL)
    (args.out / 'protocol.json').write_text(json.dumps(record, indent=2) + '\n')
    def deadline_expired(_number, _frame):
        raise TimeoutError('fixed component deadline expired; no replacement')
    previous_alarm = signal.signal(signal.SIGALRM, deadline_expired)
    signal.alarm(spec['maximum_run_seconds'])
    try:
        # Preflight checks the lock before this process reserves it. The lock
        # remains held through MLX evaluation, so native models cannot overlap.
        record['before'] = preflight(spec['required_reclaimable_gb'])
        with open(f'/tmp/slotstream-model-{os.getuid()}.lock', 'a') as guard:
            fcntl.flock(guard, fcntl.LOCK_EX | fcntl.LOCK_NB)
            record['quiet'] = wait_for_quiet_workspace({'stable_seconds': spec['initial_quiet_seconds'],
                                                        'maximum_wait_seconds': 600})
            if competing_jobs():
                raise RuntimeError('workspace became busy during quiet period')
            if vm_snapshot()['reclaimable_bytes'] < spec['required_reclaimable_gb'] * 1e9:
                raise RuntimeError('headroom fell before MLX initialization')
            import mlx.core as mx
            import numpy as np
            mx.set_cache_limit(64 << 20)
            record['operating_conditions_before'] = operating_conditions()
            if not record['operating_conditions_before']['nominal']:
                raise RuntimeError('component requires nominal operating conditions')
            kernel = mx.fast.metal_kernel(name='slotstream_indexer_four_head_component',
                input_names=['query', 'key', 'denominator'], output_names=['output'], source=KERNEL)
            rng = np.random.default_rng(spec['seed'])
            denominator = mx.array([np.sqrt(np.float32(128))])

            def inputs(q, n, kind='random'):
                query = rng.standard_normal((1, q, 4, 128)).astype(np.float32)
                key = rng.standard_normal((1, n, 128)).astype(np.float32)
                if kind == 'zero': query.fill(0)
                if kind == 'opposed-heads':
                    query.fill(0); key.fill(0)
                    query[0, :, :, 0] = [1, -1, 2, -2]; key[0, :, 0] = 1
                if kind == 'tied-keys': key[:] = key[:, :1]
                if kind == 'cancellation':
                    query[:] = np.tile([8192, 1, -8192, -1], 32); key.fill(1)
                if kind in ['nan', 'infinity']:
                    query[0, 0, 0, 0] = np.nan if kind == 'nan' else np.inf
                # Production inputs are BF16 values promoted before einsum.
                arrays = [mx.array(x).astype(mx.bfloat16).astype(mx.float32) for x in [query, key]]
                mx.eval(*arrays)
                return arrays

            def score(query, key, arm):
                if arm == 'reference':
                    dots = mx.einsum('bshd,bnd->bsnh', query, key)
                    return mx.maximum(dots, 0).sum(axis=-1) / denominator[0]
                q, n = query.shape[1], key.shape[1]
                return kernel(inputs=[query, key, denominator], template=[('Blocks', n)],
                    grid=(q * n * 128, 1, 1), threadgroup=(128, 1, 1),
                    output_shapes=[[1, q, n]], output_dtypes=[mx.float32])[0]

            def keep(scores, q, n):
                # Keep the original whole-domain partition, visibility and
                # sentinel behavior. Incomplete own-block tails are unchanged
                # because this prototype replaces score production only.
                positions = mx.arange(q, dtype=mx.int32) + (4 * n - q - 2)
                visible = (mx.arange(n, dtype=mx.int32) * 4 + 3)[None, None, :] <= positions[None, :, None]
                ranked = mx.where(visible, scores, -float('inf'))
                count = min(512, n)
                top = mx.argpartition(-ranked, kth=count - 1, axis=-1)[..., :count].astype(mx.int32)
                top = mx.where(mx.take_along_axis(mx.broadcast_to(visible, scores.shape), top, axis=-1), top, n)
                indices = np.array(top)[0]
                mask = np.zeros((q, n), dtype=np.bool_)
                for row in range(q):
                    mask[row, indices[row][indices[row] < n]] = True
                return mask

            cases = [(q, n, 'random') for q, n in spec['correctness_shapes']]
            cases += [(8, 513, kind) for kind in spec['special_inputs']]
            def check_inputs(query, key, kind, stage):
                q, n = query.shape[1], key.shape[1]
                outputs = [score(query, key, arm) for arm in ['reference', 'fused']]
                mx.eval(*outputs)
                actual = [np.array(x) for x in outputs]
                exact_mask = bool(np.array_equal(keep(outputs[0], q, n), keep(outputs[1], q, n)))
                q64, k64 = [np.array(x).astype(np.float64) for x in [query, key]]
                # Exceptional rows still contain many finite outputs; verify
                # those against the oracle instead of only matching NaN/Inf.
                with np.errstate(invalid='ignore', over='ignore'):
                    dots64 = np.einsum('bshd,bnd->bsnh', q64, k64)
                    truth = np.maximum(dots64, 0).sum(axis=-1) / float(np.sqrt(np.float32(128)))
                    head_mass = np.einsum('bshd,bnd->bsnh', np.abs(q64), np.abs(k64), optimize=True)
                    # A -Inf head is killed exactly by its positive part. Its
                    # infinite input mass must not make the finite heads'
                    # error bound infinite and silently vacuous.
                    mass = np.where(np.isfinite(dots64), head_mass, 0).sum(axis=-1)
                    eps = np.finfo(np.float32).eps
                    bound = 2 * (132 * eps / (1 - 132 * eps)) * mass / float(np.sqrt(np.float32(128))) + 8 * np.finfo(np.float32).tiny
                finite = np.isfinite(truth)
                patterns_match = bool(np.array_equal(np.isnan(actual[0]), np.isnan(actual[1]))
                    and np.array_equal(np.isposinf(actual[0]), np.isposinf(actual[1]))
                    and np.array_equal(np.isneginf(actual[0]), np.isneginf(actual[1])))
                errors = [float(np.max(np.abs(x[finite] - truth[finite]), initial=0)) for x in actual]
                numerical = patterns_match and bool(np.isfinite(bound[finite]).all()) and all(bool(np.isfinite(x[finite]).all()
                    and np.all(np.abs(x[finite] - truth[finite]) <= bound[finite])) for x in actual)
                if kind not in ['nan', 'infinity']:
                    numerical = numerical and bool(finite.all())
                details = {'reference_max_finite_error': errors[0], 'candidate_max_finite_error': errors[1],
                           'finite_oracle_scores': int(finite.sum()),
                           'exceptional_patterns_match': patterns_match,
                           'max_finite_bound': float(np.max(bound[finite], initial=0))}
                result = {'queries': q, 'blocks': n, 'input_kind': kind, 'stage': stage,
                    'exact_visible_keep_mask': exact_mask, 'numerical_passed': numerical,
                    'input_sha256': [digest_bytes(np.array(x).tobytes()) for x in [query, key]],
                    'passed': exact_mask and numerical, **details}
                record['checks'].append(result)
                return result

            for q, n, kind in cases:
                check_inputs(*inputs(q, n, kind), kind, 'correctness')
            record['correctness_passed'] = all(c['passed'] for c in record['checks'])
            if not record['correctness_passed']:
                record['stopped_reason'] = 'component numerical or selection counterexample; timing not run'
                raise RuntimeError(record['stopped_reason'])
            for q, n in spec['timing_shapes']:
                query, key = inputs(q, n)
                checked = check_inputs(query, key, 'random', 'timing-input')
                if not checked['passed']:
                    record['correctness_passed'] = False
                    raise RuntimeError('timing input failed numerical or selection check; timing not run')
                for arm in ['reference', 'fused']:
                    for _ in range(spec['warmups_per_arm']): mx.eval(score(query, key, arm))
                cells = []
                group = {'queries': q, 'blocks': n, 'input_sha256': checked['input_sha256'], 'cells': cells}
                record['timings'].append(group)
                for number in range(1, spec['rounds'] + 1):
                    for arm in (['reference', 'fused'] if number % 2 else ['fused', 'reference']):
                        power_before = operating_conditions()
                        before = vm_snapshot(); mx.reset_peak_memory(); start = time.monotonic()
                        for _ in range(spec['calls_per_cell']): mx.eval(score(query, key, arm))
                        elapsed = (time.monotonic() - start) / spec['calls_per_cell']
                        after = vm_snapshot()
                        power_after = operating_conditions()
                        peak = mx.get_peak_memory(); rss = resource.getrusage(resource.RUSAGE_SELF).ru_maxrss
                        clean = all(before[k] == after[k] for k in ['swapins', 'swapouts'])
                        valid = (clean and power_before['nominal'] and power_after['nominal']
                            and 0 < peak <= spec['maximum_mlx_peak_bytes'] and 0 < rss <= spec['maximum_lifetime_rss_bytes'])
                        cells.append({'round': number, 'arm': arm, 'seconds': elapsed, 'valid': valid,
                            'mlx_peak_bytes': peak, 'lifetime_rss_bytes': rss,
                            'power_before': power_before, 'power_after': power_after,
                            'swap_delta': {k: after[k] - before[k] for k in ['swapins', 'swapouts']}})
                        if not valid: raise RuntimeError('component resource interval invalid; no replacement')
                group['assessment'] = paired_result(cells, spec)
            record['completed'] = True
    except Exception as error:
        record['error'] = f'{type(error).__name__}: {error}'
    finally:
        signal.alarm(0)
        signal.signal(signal.SIGALRM, previous_alarm)
        record['after'] = vm_snapshot()
        record['sources_unchanged'] = record['probe_sha256'] == digest(Path(__file__))
        (args.out / 'result.json').write_text(json.dumps(record, indent=2) + '\n')
        print(json.dumps({k: record[k] for k in ['completed', 'correctness_passed', 'error', 'stopped_reason'] if k in record}), flush=True)
    return 0 if record['completed'] and record['correctness_passed'] and record['sources_unchanged'] else 1


def digest_bytes(data):
    return hashlib.sha256(data).hexdigest()


if __name__ == '__main__':
    raise SystemExit(main())

```

## /Users/carlos/Projects/slotstream/.build/optimization/indexer-component-v204/probe/kernel.metal

SHA256 `3509e281a7f610925dc285d0d19bae96f7880fb588e5745817b7ba29e333478e`

```

const uint lane = thread_index_in_simdgroup;
const uint head = simdgroup_index_in_threadgroup;
const uint pair = threadgroup_position_in_grid.x;
const uint row = pair / Blocks, block = pair % Blocks;
threadgroup float positive[4];
float dot = 0.0f;
for (uint d = lane; d < 128; d += 32) {
    dot = fma(query[(row * 4 + head) * 128 + d],
              key[block * 128 + d], dot);
}
dot = simd_sum(dot);
// Match MLX Maximum's floating-point branch, including NaN and signed zero.
if (lane == 0) positive[head] = metal::isnan(dot) ? dot : (dot > 0.0f ? dot : 0.0f);
threadgroup_barrier(mem_flags::mem_threadgroup);
if (head == 0 && lane == 0) {
    float total = positive[0];
    total = total + positive[1];
    total = total + positive[2];
    total = total + positive[3];
    output[pair] = total / denominator[0];
}

```

## /Users/carlos/Projects/slotstream/.build/optimization/indexer-component-v204/probe/protocol.json

SHA256 `403366b4277184c9083c4ce1e22d9c0ab5bfb1692207a3715696a39941c6ada3`

```
{
  "protocol": {
    "classification": "Synthetic FP32 score component; no model, capacity or serving claim",
    "heads": 4,
    "head_dim": 128,
    "compression_ratio": 4,
    "block_top_k": 512,
    "seed": 20260906177,
    "mlx": "0.31.1",
    "correctness_shapes": [
      [
        1,
        511
      ],
      [
        1,
        512
      ],
      [
        1,
        513
      ],
      [
        1,
        2048
      ],
      [
        8,
        511
      ],
      [
        8,
        512
      ],
      [
        8,
        513
      ],
      [
        8,
        2048
      ],
      [
        64,
        511
      ],
      [
        64,
        512
      ],
      [
        64,
        513
      ],
      [
        64,
        2048
      ],
      [
        256,
        511
      ],
      [
        256,
        512
      ],
      [
        256,
        513
      ],
      [
        256,
        2048
      ]
    ],
    "special_inputs": [
      "zero",
      "opposed-heads",
      "tied-keys",
      "cancellation",
      "nan",
      "infinity"
    ],
    "timing_shapes": [
      [
        1,
        2048
      ],
      [
        256,
        2048
      ],
      [
        256,
        8192
      ]
    ],
    "rounds": 5,
    "calls_per_cell": 16,
    "warmups_per_arm": 2,
    "reverse_even_round_order": true,
    "replacement_rounds": 0,
    "minimum_clean_pairs": 5,
    "minimum_median_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "required_exact_visible_keep_masks": true,
    "timing_inputs_require_own_numerical_and_selection_checks": true,
    "numerical_bound": "Each finite score versus FP64: 2*gamma(132)*sum(abs(q*k) over finite dot-product heads)/sqrt(128) + 8*FP32.tiny; gamma(n)=n*epsilon/(1-n*epsilon). Negative-infinite heads have exactly zero positive part; exceptional patterns must also match.",
    "maximum_lifetime_rss_bytes": 2000000000,
    "maximum_mlx_peak_bytes": 1000000000,
    "require_nominal_thermal_state_and_normal_power": true,
    "required_reclaimable_gb": 7,
    "abort_on_resource_change": true,
    "initial_quiet_seconds": 180,
    "maximum_run_seconds": 900,
    "later_gates": "A component win only earns trained-model state/route and fixed-total-memory serving qualification; no default change here."
  },
  "reference_build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/merged-context-build-v202/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "457d65426cca792bd8c1bd28e7d5bbcc812664090b535eeb0d355302679995d6",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
        "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
        "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
        "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
        "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
        "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
        "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
        "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
        "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
        "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
        "Sources/Slotstream/Plan.swift": "a25367b73877f2148d362be6fa5c396937bdac2bbea4a306963022ac3264af3b",
        "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
        "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
        "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
        "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "ecd2aa75aa09b6cde14a46bb27e91bf76dd13f77f25e409178c1669adf94810b",
        "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
        "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
        "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
        "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
        "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
        "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
        "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
        "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
        "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
        "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
        "Sources/Slotstream/Weights.swift": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
        "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
        "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "874e749a4d3663df07a12bbbca237b49ccce2d667c14c4d0285cca3dcc666747",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "d12a1d66c39d62cc773ba81ce1bf8ba88b82b096ad2f060398a39acfcf65b63c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
        "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
        "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
        "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
        "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
        "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
        "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
        "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
        "Sources/slotstream-cli/MTPCommands.swift": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
        "Sources/slotstream-cli/OptimizationCommands.swift": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
        "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
        "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
        "Sources/slotstream-cli/main.swift": "20e42483d78cd4bf92102435557301667c694ef9c4fd98463971b008f64ab820",
        "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "38707bb9cd38ddefe5a793451b55da56012dac1e03332b129d88577831622664",
      "binary_sha256": "b64b07cff525003546694e8a129d7996a11987fb9b5350b47e0a882b9c848daf",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "checks": [],
  "timings": [],
  "completed": false,
  "correctness_passed": false,
  "inference_adopted": false,
  "probe_sha256": "2d4e35ab66d49e4d0cb42b68e0ddf043c20cbbe18b0730bce87926f00fcd65a4"
}

```

## /Users/carlos/Projects/slotstream/.build/optimization/indexer-component-v204/probe/result.json

SHA256 `df62fb96331633f994ece0429b1adddd507668d88955cab289e011c11cad0c7a`

```
{
  "protocol": {
    "classification": "Synthetic FP32 score component; no model, capacity or serving claim",
    "heads": 4,
    "head_dim": 128,
    "compression_ratio": 4,
    "block_top_k": 512,
    "seed": 20260906177,
    "mlx": "0.31.1",
    "correctness_shapes": [
      [
        1,
        511
      ],
      [
        1,
        512
      ],
      [
        1,
        513
      ],
      [
        1,
        2048
      ],
      [
        8,
        511
      ],
      [
        8,
        512
      ],
      [
        8,
        513
      ],
      [
        8,
        2048
      ],
      [
        64,
        511
      ],
      [
        64,
        512
      ],
      [
        64,
        513
      ],
      [
        64,
        2048
      ],
      [
        256,
        511
      ],
      [
        256,
        512
      ],
      [
        256,
        513
      ],
      [
        256,
        2048
      ]
    ],
    "special_inputs": [
      "zero",
      "opposed-heads",
      "tied-keys",
      "cancellation",
      "nan",
      "infinity"
    ],
    "timing_shapes": [
      [
        1,
        2048
      ],
      [
        256,
        2048
      ],
      [
        256,
        8192
      ]
    ],
    "rounds": 5,
    "calls_per_cell": 16,
    "warmups_per_arm": 2,
    "reverse_even_round_order": true,
    "replacement_rounds": 0,
    "minimum_clean_pairs": 5,
    "minimum_median_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "required_exact_visible_keep_masks": true,
    "timing_inputs_require_own_numerical_and_selection_checks": true,
    "numerical_bound": "Each finite score versus FP64: 2*gamma(132)*sum(abs(q*k) over finite dot-product heads)/sqrt(128) + 8*FP32.tiny; gamma(n)=n*epsilon/(1-n*epsilon). Negative-infinite heads have exactly zero positive part; exceptional patterns must also match.",
    "maximum_lifetime_rss_bytes": 2000000000,
    "maximum_mlx_peak_bytes": 1000000000,
    "require_nominal_thermal_state_and_normal_power": true,
    "required_reclaimable_gb": 7,
    "abort_on_resource_change": true,
    "initial_quiet_seconds": 180,
    "maximum_run_seconds": 900,
    "later_gates": "A component win only earns trained-model state/route and fixed-total-memory serving qualification; no default change here."
  },
  "reference_build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/merged-context-build-v202/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "457d65426cca792bd8c1bd28e7d5bbcc812664090b535eeb0d355302679995d6",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
        "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
        "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
        "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
        "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
        "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
        "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
        "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
        "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
        "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
        "Sources/Slotstream/Plan.swift": "a25367b73877f2148d362be6fa5c396937bdac2bbea4a306963022ac3264af3b",
        "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
        "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
        "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
        "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "ecd2aa75aa09b6cde14a46bb27e91bf76dd13f77f25e409178c1669adf94810b",
        "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
        "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
        "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
        "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
        "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
        "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
        "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
        "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
        "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
        "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
        "Sources/Slotstream/Weights.swift": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
        "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
        "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "874e749a4d3663df07a12bbbca237b49ccce2d667c14c4d0285cca3dcc666747",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "d12a1d66c39d62cc773ba81ce1bf8ba88b82b096ad2f060398a39acfcf65b63c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
        "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
        "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
        "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
        "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
        "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
        "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
        "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
        "Sources/slotstream-cli/MTPCommands.swift": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
        "Sources/slotstream-cli/OptimizationCommands.swift": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
        "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
        "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
        "Sources/slotstream-cli/main.swift": "20e42483d78cd4bf92102435557301667c694ef9c4fd98463971b008f64ab820",
        "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "38707bb9cd38ddefe5a793451b55da56012dac1e03332b129d88577831622664",
      "binary_sha256": "b64b07cff525003546694e8a129d7996a11987fb9b5350b47e0a882b9c848daf",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "checks": [],
  "timings": [],
  "completed": false,
  "correctness_passed": false,
  "inference_adopted": false,
  "probe_sha256": "2d4e35ab66d49e4d0cb42b68e0ddf043c20cbbe18b0730bce87926f00fcd65a4",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28533391360,
    "swapins": 43826428,
    "swapouts": 77363405,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   363356.\nPages active:                                1024531.\nPages inactive:                               668065.\nPages speculative:                            361572.\nPages throttled:                                   0.\nPages wired down:                             221657.\nPages purgeable:                                3005.\n\"Translation faults\":                    15007550300.\nPages copy-on-write:                       702921990.\nPages zero filled:                       20858061008.\nPages reactivated:                        3421849257.\nPages purged:                               71054873.\nFile-backed pages:                           1375179.\nAnonymous pages:                              678989.\nPages stored in compressor:                  1717551.\nPages occupied by compressor:                 443545.\nDecompressions:                           1160633693.\nCompressions:                             1473004379.\nPageins:                                  7315771873.\nPageouts:                                   11009110.\nSwapins:                                    43826428.\nSwapouts:                                   77363405.\nPages tagged:                                 155212.\nPages tagged resident:                        119031.\nPages tagged compressed:                       36181.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6789.\nPages tag-storage free:                         3239.\nPages tag-storage non-tag pageable:            88268.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6450432.\nTagged compressions:                        11029320.\nTagged decompressions:                      10187274.\n"
  },
  "quiet": {
    "wait_seconds": 180.92729974980466,
    "quiet_seconds": 180.90177216683514,
    "samples": 89,
    "samples_with_competing_work": 0,
    "classification": "sampled known-job quiet interval, not continuous host isolation"
  },
  "operating_conditions_before": {
    "thermal_state": 0,
    "low_power": false,
    "nominal": true
  },
  "error": "ValueError: Invalid type float32 received in array initialization.",
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28255977472,
    "swapins": 43826444,
    "swapouts": 77363405,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   343567.\nPages active:                                1043574.\nPages inactive:                               676639.\nPages speculative:                            369632.\nPages throttled:                                   0.\nPages wired down:                             221653.\nPages purgeable:                                3051.\n\"Translation faults\":                    15008174800.\nPages copy-on-write:                       702973652.\nPages zero filled:                       20858501704.\nPages reactivated:                        3421850238.\nPages purged:                               71056413.\nFile-backed pages:                           1377990.\nAnonymous pages:                              711855.\nPages stored in compressor:                  1687628.\nPages occupied by compressor:                 427055.\nDecompressions:                           1160662731.\nCompressions:                             1473004379.\nPageins:                                  7315773687.\nPageouts:                                   11009110.\nSwapins:                                    43826444.\nSwapouts:                                   77363405.\nPages tagged:                                 155476.\nPages tagged resident:                        119415.\nPages tagged compressed:                       36061.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6789.\nPages tag-storage free:                         3487.\nPages tag-storage non-tag pageable:            88020.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6432256.\nTagged compressions:                        11029320.\nTagged decompressions:                      10187387.\n"
  },
  "sources_unchanged": true
}

```

## /Users/carlos/Projects/slotstream/.build/optimization/indexer-component-v204/return-audit.json

SHA256 `d8f5c950105d54c51f3ae1a309ae5ef0c21430b6ef3e62ebf099894996f60eea`

```
{
  "at_utc": "2026-09-06T23:40:55.863731+00:00",
  "model_lock_free": true,
  "model_or_build_processes": [],
  "driver_hashes_unchanged": true,
  "owned_driver_completed": true
}

```

## /Users/carlos/Projects/slotstream/.build/optimization/indexer-component-v204/stderr.txt

SHA256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`

```

```

## /Users/carlos/Projects/slotstream/.build/optimization/indexer-component-v204/stdout.txt

SHA256 `23457f48f936a2340f57a9bb221a9c60927d8f590a67abee9f3d9308ad413b64`

```
{"phase": "waiting for initial quiet workspace", "seconds": 0.0, "quiet_seconds": 0.0, "known_jobs": 0}
{"phase": "waiting for initial quiet workspace", "seconds": 30.9, "quiet_seconds": 30.9, "known_jobs": 0}
{"phase": "waiting for initial quiet workspace", "seconds": 61.7, "quiet_seconds": 61.6, "known_jobs": 0}
{"phase": "waiting for initial quiet workspace", "seconds": 92.5, "quiet_seconds": 92.5, "known_jobs": 0}
{"phase": "waiting for initial quiet workspace", "seconds": 123.4, "quiet_seconds": 123.3, "known_jobs": 0}
{"phase": "waiting for initial quiet workspace", "seconds": 154.2, "quiet_seconds": 154.2, "known_jobs": 0}
{"completed": false, "correctness_passed": false, "error": "ValueError: Invalid type float32 received in array initialization."}

```

## /tmp/slotstream-optimization-execution/indexer-component-v204-preparation/manifest.json

SHA256 `e4e17a1ee911f32e48dbd449d1eb076bc77502096e404a95f1c1ac8f2176c21d`

```
{
  "state": "UNRUN_REQUIRES_CONTEXT_EXPLICIT_15_MINUTE_HANDBACK_AFTER_FULL_RESOURCE_CLIENT_GATES",
  "candidate": "/Users/carlos/Projects/slotstream/.build/optimization/merged-context-build-v202/candidate",
  "identity": {
    "binary_sha256": "b64b07cff525003546694e8a129d7996a11987fb9b5350b47e0a882b9c848daf",
    "source_archive_sha256": "38707bb9cd38ddefe5a793451b55da56012dac1e03332b129d88577831622664",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "classification": "Synthetic GPU score component; no production dispatch or full-model throughput claim",
  "outer_child_seconds": 840,
  "cleanup_allowance_seconds": 60,
  "entire_interval_seconds": 900,
  "protocol_unchanged": true,
  "no_replacements": true,
  "no_build": true,
  "output": "/Users/carlos/Projects/slotstream/.build/optimization/indexer-component-v204",
  "command": [
    "/Users/carlos/Projects/slotstream/.venv31/bin/python",
    "/Users/carlos/Projects/slotstream/Tools/indexer_score_probe.py",
    "--candidate",
    "/Users/carlos/Projects/slotstream/.build/optimization/merged-context-build-v202/candidate",
    "--out",
    "/Users/carlos/Projects/slotstream/.build/optimization/indexer-component-v204/probe"
  ],
  "driver_sha256": {
    "indexer_score_probe.py": "2d4e35ab66d49e4d0cb42b68e0ddf043c20cbbe18b0730bce87926f00fcd65a4",
    "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb"
  }
}

```

## /tmp/slotstream-optimization-execution/indexer-component-v204-preparation/run.py

SHA256 `13edb638b8a7780df1ac472d0d0791b3045ae0bec97c3d79daa946100ff33690`

```
"""Run only after the context task explicitly returns its bounded interval."""
import json
import os
from pathlib import Path
import sys
import time

ROOT = Path('/Users/carlos/Projects/slotstream')
sys.path.insert(0, str(ROOT / 'Tools'))
from prefill_bench import digest, preflight, run_child, vm_snapshot
from serve_bench import verified_build

spec_path = Path(__file__).with_name('manifest.json')
spec = json.loads(spec_path.read_text())
out = Path(spec['output'])
started = time.monotonic()
record = {'classification': spec['classification'], 'spec_sha256': digest(spec_path),
          'command': spec['command'], 'outer_child_seconds': spec['outer_child_seconds'],
          'whole_interval_seconds': spec['entire_interval_seconds'],
          'completed': False, 'inference_adopted': False}
out.mkdir(parents=True, exist_ok=False)
try:
    for name, expected in spec['driver_sha256'].items():
        if digest(ROOT / 'Tools' / name) != expected:
            raise ValueError('reviewed component driver changed before launch')
    build = verified_build(Path(spec['candidate']) / 'slotstream')
    if any(build['identity'][key] != value for key, value in spec['identity'].items()):
        raise ValueError('frozen V202 candidate identity differs')
    record['identity'] = spec['identity']
    record['before'] = preflight(7)
    env = {k: v for k, v in os.environ.items()
           if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
    # The component's own fixed900-second protocol remains unchanged. This
    # shorter external deadline reserves cleanup within the granted interval;
    # expiration is preserved as incomplete evidence and earns no replacement.
    limit = min(spec['outer_child_seconds'], spec['outer_child_seconds'] -
                (time.monotonic() - started))
    if limit <= 0:
        raise TimeoutError('interval exhausted before component launch')
    record['exit_code'] = run_child(spec['command'], env, out, limit)
    result_path = out / 'probe' / 'result.json'
    if result_path.is_file():
        result = json.loads(result_path.read_text())
        record['result_sha256'] = digest(result_path)
        record['completed'] = record['exit_code'] == 0 and result.get('completed') is True
        record['correctness_passed'] = result.get('correctness_passed') is True
        record['shapes'] = [{key: group[key] for key in ['queries', 'blocks', 'assessment']
                             if key in group} for group in result.get('timings', [])]
except BaseException as error:
    record['error'] = f'{type(error).__name__}: {error}'
finally:
    record['after'] = vm_snapshot()
    record['elapsed_seconds'] = time.monotonic() - started
    record['interval_respected'] = record['elapsed_seconds'] <= spec['entire_interval_seconds']
    (out / 'manifest.json').write_text(json.dumps(record, indent=2) + '\n')
print(json.dumps(record), flush=True)
raise SystemExit(0 if record['completed'] and record.get('correctness_passed')
                 and record['interval_respected'] else 1)

```

## /tmp/slotstream-optimization-execution/indexer-initializer-v206/manifest.json

SHA256 `d9ccd062b5a5ad6e15ceaa1bd0f908a7c12d687af75b784bcd0bd1838cb40bdc`

```
{
  "classification": "one-line MLX input-delivery correction; no kernel, workload, oracle, gate, scope or default change",
  "failure": "V204 stopped with0 numerical cases/0 timings: MLX rejects NumPy float32 scalars nested in a Python list",
  "exactness": "Converting a NumPy float32 scalar to Python float preserves all32 bits exactly; explicit mx.float32 reconstructs the same denominator. The sqrt is unchanged.",
  "files": [
    {
      "path": "Tools/indexer_score_probe.py",
      "before_sha256": "2d4e35ab66d49e4d0cb42b68e0ddf043c20cbbe18b0730bce87926f00fcd65a4",
      "after_sha256": "b51796a075f6391b301cbe78eda3e82ac9378e16823e9ca48f0f1f97b166e8b0"
    }
  ]
}

```

## /tmp/slotstream-optimization-execution/indexer-initializer-v206/fix.patch

SHA256 `00e04ef937d3f40a545f734ccf973c539114ae43668b083a347709915a8676c3`

```
--- a/Tools/indexer_score_probe.py
+++ b/Tools/indexer_score_probe.py
@@ -179,7 +179,7 @@
             kernel = mx.fast.metal_kernel(name='slotstream_indexer_four_head_component',
                 input_names=['query', 'key', 'denominator'], output_names=['output'], source=KERNEL)
             rng = np.random.default_rng(spec['seed'])
-            denominator = mx.array([np.sqrt(np.float32(128))])
+            denominator = mx.array([float(np.sqrt(np.float32(128)))], dtype=mx.float32)
 
             def inputs(q, n, kind='random'):
                 query = rng.standard_normal((1, q, 4, 128)).astype(np.float32)

```

## /tmp/slotstream-optimization-execution/indexer-component-v207-preparation/manifest.json

SHA256 `6b5be920eee2c070360ba8f9d4a008b584e15e62b92f95a7cfaf86e62fd7c88c`

```
{
  "state": "UNRUN_REQUIRES_NEW_CONTEXT_EXPLICIT_SYNTHETIC_HANDBACK_AFTER_V206_DELIVERY_FIX",
  "candidate": "/Users/carlos/Projects/slotstream/.build/optimization/merged-context-build-v202/candidate",
  "identity": {
    "binary_sha256": "b64b07cff525003546694e8a129d7996a11987fb9b5350b47e0a882b9c848daf",
    "source_archive_sha256": "38707bb9cd38ddefe5a793451b55da56012dac1e03332b129d88577831622664",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "classification": "Synthetic GPU score component; no production dispatch or full-model throughput claim",
  "outer_child_seconds": 840,
  "cleanup_allowance_seconds": 60,
  "entire_interval_seconds": 900,
  "protocol_unchanged": true,
  "no_replacements": true,
  "no_build": true,
  "output": "/Users/carlos/Projects/slotstream/.build/optimization/indexer-component-v207",
  "command": [
    "/Users/carlos/Projects/slotstream/.venv31/bin/python",
    "/Users/carlos/Projects/slotstream/Tools/indexer_score_probe.py",
    "--candidate",
    "/Users/carlos/Projects/slotstream/.build/optimization/merged-context-build-v202/candidate",
    "--out",
    "/Users/carlos/Projects/slotstream/.build/optimization/indexer-component-v207/probe"
  ],
  "driver_sha256": {
    "indexer_score_probe.py": "b51796a075f6391b301cbe78eda3e82ac9378e16823e9ca48f0f1f97b166e8b0",
    "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb"
  }
}

```

## /tmp/slotstream-optimization-execution/indexer-component-v207-preparation/run.py

SHA256 `13edb638b8a7780df1ac472d0d0791b3045ae0bec97c3d79daa946100ff33690`

```
"""Run only after the context task explicitly returns its bounded interval."""
import json
import os
from pathlib import Path
import sys
import time

ROOT = Path('/Users/carlos/Projects/slotstream')
sys.path.insert(0, str(ROOT / 'Tools'))
from prefill_bench import digest, preflight, run_child, vm_snapshot
from serve_bench import verified_build

spec_path = Path(__file__).with_name('manifest.json')
spec = json.loads(spec_path.read_text())
out = Path(spec['output'])
started = time.monotonic()
record = {'classification': spec['classification'], 'spec_sha256': digest(spec_path),
          'command': spec['command'], 'outer_child_seconds': spec['outer_child_seconds'],
          'whole_interval_seconds': spec['entire_interval_seconds'],
          'completed': False, 'inference_adopted': False}
out.mkdir(parents=True, exist_ok=False)
try:
    for name, expected in spec['driver_sha256'].items():
        if digest(ROOT / 'Tools' / name) != expected:
            raise ValueError('reviewed component driver changed before launch')
    build = verified_build(Path(spec['candidate']) / 'slotstream')
    if any(build['identity'][key] != value for key, value in spec['identity'].items()):
        raise ValueError('frozen V202 candidate identity differs')
    record['identity'] = spec['identity']
    record['before'] = preflight(7)
    env = {k: v for k, v in os.environ.items()
           if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
    # The component's own fixed900-second protocol remains unchanged. This
    # shorter external deadline reserves cleanup within the granted interval;
    # expiration is preserved as incomplete evidence and earns no replacement.
    limit = min(spec['outer_child_seconds'], spec['outer_child_seconds'] -
                (time.monotonic() - started))
    if limit <= 0:
        raise TimeoutError('interval exhausted before component launch')
    record['exit_code'] = run_child(spec['command'], env, out, limit)
    result_path = out / 'probe' / 'result.json'
    if result_path.is_file():
        result = json.loads(result_path.read_text())
        record['result_sha256'] = digest(result_path)
        record['completed'] = record['exit_code'] == 0 and result.get('completed') is True
        record['correctness_passed'] = result.get('correctness_passed') is True
        record['shapes'] = [{key: group[key] for key in ['queries', 'blocks', 'assessment']
                             if key in group} for group in result.get('timings', [])]
except BaseException as error:
    record['error'] = f'{type(error).__name__}: {error}'
finally:
    record['after'] = vm_snapshot()
    record['elapsed_seconds'] = time.monotonic() - started
    record['interval_respected'] = record['elapsed_seconds'] <= spec['entire_interval_seconds']
    (out / 'manifest.json').write_text(json.dumps(record, indent=2) + '\n')
print(json.dumps(record), flush=True)
raise SystemExit(0 if record['completed'] and record.get('correctness_passed')
                 and record['interval_respected'] else 1)

```

