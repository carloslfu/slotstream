import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationIndexerVisibility() -> CheckReport {
        var c = CheckBuilder("optimization-indexer-visibility")
        let positions = MLXArray((0 ..< 12).map(Int32.init))
        let starts = floorDivide(positions + 1, Int32(4)) * Int32(4)
        c.equal("partial-block starts retain integer dtype", starts.dtype, .int32)
        c.equal("floor-division oracle at every remainder", starts.asArray(Int32.self),
            [0, 0, 0, 4, 4, 4, 4, 8, 8, 8, 8, 12])
        // The final absolute query, not the total stored key length, determines
        // whether every complete visible block fits. Exercise both batch sizes,
        // the four-token boundary and the first 513-block query.
        for batch in [1, 2] {
            for end in [1, 2, 3, 4, 5, 6, 7, 8, 256, 2048, 2049, 2050, 2051, 2052, 2053, 2060] {
                let count = min(8, end), keys = 4097, blocks = keys / 4
                for pattern in 0 ..< 6 {
                    let values: [Float] = [0, 1, .nan, .greatestFiniteMagnitude, .infinity, 1]
                    let value = values[pattern]
                    let q = MLXArray.full([batch, count, 4, 16], values: MLXArray(value))
                    let pooled = MLXArray.full([batch, blocks, 16], values: MLXArray(pattern == 5 ? Float.nan : Float(1)))
                    let starts = MLXArray((0 ..< blocks).map { Int32($0 * 4) })
                    func mask(_ enabled: Bool) -> MLXArray {
                        QSASelection(q: q, pooled: pooled, blockStarts: starts,
                            offset: end - count, kvLen: keys, ratio: 4,
                            blockTopK: 512, headDim: 16, denseBypass: enabled)
                            .mask(lo: 0, hi: count, keyEnd: keys)
                    }
                    let reference = mask(false), candidate = mask(true)
                    c.expect("batch \(batch), end \(end), pattern \(pattern): exact mask",
                        (reference .== candidate).all().item(Bool.self))
                    if pattern < 2 {
                        let counts = candidate.asType(.int32).sum(axis: -1).asArray(Int32.self)
                        let start = end - count + 1
                        let oneBatch: [Int32] = (start ... end).map { (position: Int) -> Int32 in
                            let complete = min(position / 4, 512)
                            return Int32(complete * 4 + position % 4)
                        }
                        c.equal("batch \(batch), end \(end), pattern \(pattern): exact causal cardinalities",
                            counts, Array(repeating: oneBatch, count: batch).flatMap { $0 })
                    }
                }
            }
        }
        // Independent scalar oracle with exactly representable integer dot
        // products. Verify the actual retained key IDs, including nontrivial
        // score ordering, ties and the transition into 513 visible blocks.
        let (batch, count, heads, dim, keys, offset) = (2, 13, 4, 16, 4097, 2044)
        let blocks = keys / 4
        let qValues = (0 ..< batch * count * heads * dim).map { (($0 * 19 + $0 / 11) % 7) - 3 }
        let kValues = (0 ..< batch * blocks * dim).map { (($0 * 23 + $0 / 17) % 7) - 3 }
        let q = MLXArray(qValues.map(Float.init), [batch, count, heads, dim])
        let pooled = MLXArray(kValues.map(Float.init), [batch, blocks, dim])
        let blockStarts = MLXArray((0 ..< blocks).map { Int32($0 * 4) })
        var expected = [UInt8](repeating: 0, count: batch * count * keys)
        for b in 0 ..< batch {
            for row in 0 ..< count {
                let position = offset + row
                var scored: [(Int, Int)] = []
                for block in 0 ..< min(blocks, (position + 1) / 4) {
                    var score = 0
                    for head in 0 ..< heads {
                        var dot = 0
                        for d in 0 ..< dim {
                            dot += qValues[((b * count + row) * heads + head) * dim + d]
                                * kValues[(b * blocks + block) * dim + d]
                        }
                        score += max(0, dot)
                    }
                    scored.append((block, score))
                }
                scored.sort { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1 }
                let base = (b * count + row) * keys
                for (block, _) in scored.prefix(512) {
                    for key in block * 4 ..< block * 4 + 4 { expected[base + key] = 1 }
                }
                let tailStart = ((position + 1) / 4) * 4
                if tailStart <= position {
                    for key in tailStart ... position { expected[base + key] = 1 }
                }
            }
        }
        for enabled in [false, true] {
            let selection = QSASelection(q: q, pooled: pooled, blockStarts: blockStarts,
                offset: offset, kvLen: keys, ratio: 4, blockTopK: 512,
                headDim: dim, denseBypass: enabled)
            let full = selection.mask(lo: 0, hi: count, keyEnd: keys)
            let tiled = concatenated([selection.mask(lo: 0, hi: 7, keyEnd: keys),
                selection.mask(lo: 7, hi: count, keyEnd: keys)], axis: 2)
            c.expect("scalar score/key-set oracle, dense \(enabled)", full.asType(.uint8).asArray(UInt8.self) == expected)
            c.expect("tiled scalar score/key-set oracle, dense \(enabled)", tiled.asType(.uint8).asArray(UInt8.self) == expected)
        }
        return c.report()
    }

    public static func optimizationRouterSelection() -> CheckReport {
        var c = CheckBuilder("optimization-router-selection")
        c.expect("specialized kernel initialized and active", RouterSelection.prepare())
        var rows: [[Float]] = []
        rows.append((0 ..< 512).map { Float($0) })
        rows.append(Array(rows[0].reversed()))
        rows.append([Float](repeating: 1, count: 512))
        rows.append((0 ..< 512).map { $0 % 2 == 0 ? Float(0) : -Float(0) })
        rows.append((0 ..< 512).map { $0 < 9 ? Float(1) : Float(0.25) })
        rows.append((0 ..< 512).map { $0 % 7 == 0 ? Float.infinity : -Float.infinity })
        rows.append([Float](repeating: .nan, count: 512))
        rows.append((0 ..< 512).map { Float(bitPattern: [UInt32(1), 0x80000001, 0x007fffff, 0x807fffff, 0, 0x80000000][$0 % 6]) })
        let edgeBits: [UInt32] = [0xff800000, 0x7f800000, 0x7fc00001, 0xffc00001,
            0, 0x80000000, 1, 0x80000001, 0x7f7fffff, 0xff7fffff, 0x00800000, 0x80800000]
        rows.append((0 ..< 512).map { Float(bitPattern: edgeBits[$0 % edgeBits.count]) })
        var rng = UInt64(0x1ab90f68)
        for _ in 0 ..< 24 {
            rows.append((0 ..< 512).map { _ in
                rng ^= rng << 13; rng ^= rng >> 7; rng ^= rng << 17
                return Float(bitPattern: UInt32(truncatingIfNeeded: rng))
            })
        }
        let x = MLXArray(rows.flatMap { $0 }, [rows.count, 512])
        let ref = RouterSelection.reference(x, k: 10)
        let got = RouterSelection.indices(x, k: 10, enabled: true)
        eval(ref, got)
        c.expect("ordered indices equal pinned MLX sort", (ref .== got).all().item(Bool.self))
        let output = got.asArray(UInt32.self)
        for (row, values) in rows.enumerated() {
            let values = values.map { ($0.bitPattern & 0x7fffffff) < 0x00800000 ? Float(0) : $0 }
            let oracle = values.indices.sorted { a, b in
                if values[a].isNaN != values[b].isNaN { return !values[a].isNaN }
                if values[a].isNaN || values[a] == values[b] { return a < b }
                return values[a] > values[b]
            }.prefix(10).map(UInt32.init)
            c.equal("stable bit-order oracle row \(row)", Array(output[row * 10 ..< (row + 1) * 10]), oracle)
        }
        for _ in 0 ..< 3 {
            c.expect("selector repeatability", (got .== RouterSelection.indices(x, k: 10, enabled: true)).all().item(Bool.self))
        }
        let strided = contiguous(x.transposed()).transposed()
        c.expect("noncontiguous input", (ref .== RouterSelection.indices(strided, k: 10, enabled: true)).all().item(Bool.self))
        c.expect("unsupported width uses reference", (RouterSelection.indices(x[0..., ..<511], k: 10, enabled: true)
            .== RouterSelection.reference(x[0..., ..<511], k: 10)).all().item(Bool.self))
        c.expect("unsupported K uses reference", (RouterSelection.indices(x, k: 1, enabled: true)
            .== RouterSelection.reference(x, k: 1)).all().item(Bool.self))
        c.expect("BF16 uses reference", (RouterSelection.indices(x.asType(.bfloat16), k: 10, enabled: true)
            .== RouterSelection.reference(x.asType(.bfloat16), k: 10)).all().item(Bool.self))
        c.expect("explicit reference switch", (ref .== RouterSelection.indices(x, k: 10, enabled: false)).all().item(Bool.self))
        // Fixed inputs and interleaved kernel timings only. A real request gate
        // must independently establish whether selector work is material.
        for count in [1, 32, 256, 4096] {
            let finiteRow = (0 ..< 512).map { Float(($0 * 7919) % 65536 - 32768) / 4096 }
            let input = MLXArray(Array(repeating: finiteRow, count: count).flatMap { $0 }, [count, 512])
            eval(input)
            for enabled in [false, true] { eval(RouterSelection.indices(input, k: 10, enabled: enabled)) }
            var baseline: [Double] = [], candidate: [Double] = []
            for round in 0 ..< 5 {
                for enabled in round % 2 == 0 ? [false, true] : [true, false] {
                    let start = RuntimeClock.now()
                    for _ in 0 ..< 20 { eval(RouterSelection.indices(input, k: 10, enabled: enabled)) }
                    let seconds = RuntimeClock.seconds(since: start) / 20
                    if enabled { candidate.append(seconds) } else { baseline.append(seconds) }
                }
            }
            c.measure("reference_\(count)_seconds", baseline.sorted()[2])
            c.measure("candidate_\(count)_seconds", candidate.sorted()[2])
            c.measure("paired_\(count)_reduction", zip(baseline, candidate).map { 1 - $1 / $0 }.sorted()[2])
        }
        return c.report()
    }
}
