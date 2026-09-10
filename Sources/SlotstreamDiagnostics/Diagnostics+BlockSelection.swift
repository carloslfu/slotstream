import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationBlockSelection() -> CheckReport {
        var c = CheckBuilder("optimization-indexer-block-selection")
        c.expect("specialized block selector initialized", BlockSelection.prepare())
        let edge: [UInt32] = [0, 0x80000000, 1, 0x80000001, 0x7f800000, 0xff800000,
            0x7fc00001, 0xffc00001, 0x7f7fffff, 0xff7fffff, 0x00800000, 0x80800000]
        for n in [513, 514, 767, 768, 1024, 1025, 1536, 2048, 2051, 4095, 4096, 8192] {
            var seed = UInt64(0x1a8f7239)
            let rows: [[Float]] = [
                (0 ..< n).map(Float.init), (0 ..< n).reversed().map(Float.init),
                [Float](repeating: 0, count: n), [Float](repeating: .nan, count: n),
                (0 ..< n).map { Float(bitPattern: edge[$0 % edge.count]) },
                (0 ..< n).map { Float(bitPattern: [UInt32(1), 0x80000001, 0x007fffff, 0x807fffff][$0 % 4]) },
                (0 ..< n).map { $0 < 511 ? 2 : ($0 % 2 == 0 ? Float(0) : -Float(0)) },
                (0 ..< n).map { _ in
                    seed ^= seed << 13; seed ^= seed >> 7; seed ^= seed << 17
                    return Float(bitPattern: UInt32(truncatingIfNeeded: seed))
                },
            ]
            let x = MLXArray(rows.flatMap { $0 }, [rows.count, n])
            let reference = BlockSelection.reference(x, k: 512)
            let candidate = BlockSelection.keep(x, k: 512, enabled: true)
            c.expect("N=\(n): pinned MLX exact keep set", (reference .== candidate).all().item(Bool.self))
            c.equal("N=\(n): exactly 512 unique keys per row", candidate.asType(.int32).sum(axis: -1).asArray(Int32.self),
                    [Int32](repeating: 512, count: rows.count))
            let got = candidate.asType(.uint8).asArray(UInt8.self)
            for (row, values) in rows.enumerated() {
                let values = values.map { ($0.bitPattern & 0x7fffffff) < 0x00800000 ? Float(0) : $0 }
                let sorted = values.indices.sorted { a, b in
                    if values[a].isNaN != values[b].isNaN { return !values[a].isNaN }
                    if values[a].isNaN || values[a] == values[b] { return a < b }
                    return values[a] > values[b]
                }
                var expected = [UInt8](repeating: 0, count: n)
                for id in sorted.prefix(512) { expected[id] = 1 }
                c.equal("N=\(n), row \(row): scalar stable oracle", Array(got[row * n ..< (row + 1) * n]), expected)
            }
            let strided = contiguous(x.transposed()).transposed()
            c.expect("N=\(n): strided input", (reference .== BlockSelection.keep(strided, k: 512, enabled: true)).all().item(Bool.self))
            for _ in 0 ..< 2 {
                c.expect("N=\(n): repeatable", (candidate .== BlockSelection.keep(x, k: 512, enabled: true)).all().item(Bool.self))
            }
        }
        for (n, k, dtype) in [(512, 512, DType.float32), (1024, 1, .float32), (8193, 512, .float32),
                              (1024, 512, .bfloat16), (513, 0, .float32), (513, 514, .float32)] {
            let input = MLXArray((0 ..< n).map(Float.init)).asType(dtype)
            c.expect("fallback N=\(n), K=\(k), \(dtype)", (BlockSelection.keep(input, k: k, enabled: true)
                .== BlockSelection.reference(input, k: k)).all().item(Bool.self))
        }
        // Three AB/BA pairs of twenty completed evaluations on finite inputs.
        // Kernel+host completion overhead only; no production benefit implied.
        for n in [1024, 2048, 8192] {
            for rows in [1, 256] {
                let values = (0 ..< n).map { Float(($0 * 7919) % 65536 - 32768) / 4096 }
                let input = MLXArray(Array(repeating: values, count: rows).flatMap { $0 }, [rows, n])
                eval(input)
                for enabled in [false, true] { eval(BlockSelection.keep(input, k: 512, enabled: enabled)) }
                var reference: [Double] = [], candidate: [Double] = []
                for round in 0 ..< 3 {
                    for enabled in round % 2 == 0 ? [false, true] : [true, false] {
                        let start = RuntimeClock.now()
                        for _ in 0 ..< 20 { eval(BlockSelection.keep(input, k: 512, enabled: enabled)) }
                        let elapsed = RuntimeClock.seconds(since: start) / 20
                        if enabled { candidate.append(elapsed) } else { reference.append(elapsed) }
                    }
                }
                c.measure("N\(n).rows\(rows).reference_seconds", reference.sorted()[1])
                c.measure("N\(n).rows\(rows).candidate_seconds", candidate.sorted()[1])
                c.measure("N\(n).rows\(rows).paired_reduction", zip(reference, candidate).map { 1 - $1 / $0 }.sorted()[1])
            }
        }
        return c.report()
    }
}
