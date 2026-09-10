import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationCompactIndexer() -> CheckReport {
        var c = CheckBuilder("optimization-compact-indexer")
        func rows(_ start: Int, _ count: Int, salt: Int = 0) -> MLXArray {
            var values: [Float] = []
            values.reserveCapacity(count * 128)
            for p in start ..< start + count {
                for d in 0 ..< 128 { values.append(Float((p * 17 + d * 3 + salt) % 127 - 63)) }
            }
            return MLXArray(values).reshaped([1, count, 128]).asType(.bfloat16)
        }
        func append(_ cache: IndexerCache, _ values: MLXArray) -> MLXArray? {
            let raw = cache.update(values), base = cache.rawBase
            guard cache.offset > 2048 else { return nil }
            let pooled = cache.completedBlocks(count: cache.offset / 4, ratio: 4) { lo, hi in
                raw[0..., (lo * 4 - base) ..< (hi * 4 - base), 0...]
                    .reshaped([1, hi - lo, 4, 128]).asType(.float32).mean(axis: 2).asType(.bfloat16)
            }
            eval(pooled)
            return pooled
        }
        func exact(_ name: String, _ a: MLXArray?, _ b: MLXArray?) {
            guard let a, let b else { c.expect(name, a == nil && b == nil); return }
            c.expect(name, a.shape == b.shape && a.dtype == b.dtype && (a .== b).all().item(Bool.self))
        }
        let full = IndexerCache(), compact = IndexerCache(compactRaw: true)
        for end in [1, 255, 256, 1024, 2047, 2048, 2049, 2050, 2051, 2052, 2307, 2561, 4096, 8192] {
            let values = rows(full.offset, end - full.offset)
            exact("\(end): completed block values", append(full, values), append(compact, values))
            c.equal("\(end): absolute token position", compact.offset, full.offset)
            let raw = full.diagnosticValues()!
            exact("\(end): retained raw values", raw[0..., compact.rawBase ..< end, 0...], compact.diagnosticValues())
            if end <= 2048 { c.equal("\(end): dense history stays available", compact.rawBase, 0) }
        }
        c.expect("long context releases more than half the allocated indexer bytes", compact.allocatedBytes < full.allocatedBytes / 2)
        c.measure("full_bytes_8192", Double(full.allocatedBytes))
        c.measure("compact_bytes_8192", Double(compact.allocatedBytes))
        let saved = compact.snapshot()!
        let savedOffset = compact.offset
        let savedValues = contiguous(compact.diagnosticValues()!); eval(savedValues)
        _ = append(compact, rows(savedOffset, 1537, salt: 11))
        c.expect("long transaction releases rows past its old checkpoint", compact.rawBase > savedOffset)
        compact.restore(saved)
        c.equal("snapshot restores absolute position", compact.offset, savedOffset)
        exact("snapshot restores exact prior tail after long cancellation", compact.diagnosticValues(), savedValues)
        for keep in [1, 3, 4, 17, 255, 256, 512, 513] {
            compact.restore(saved)
            full.trim(to: savedOffset)
            compact.preserveRecordingRows(true)
            let values = rows(savedOffset, 513, salt: keep)
            exact("keep \(keep): recording blocks", append(full, values), append(compact, values))
            c.expect("recording keeps all rows needed by arbitrary public rollback", compact.rawBase < savedOffset)
            full.trim(to: savedOffset + keep); compact.trim(to: savedOffset + keep)
            compact.preserveRecordingRows(false)
            exact("keep \(keep): rejected partial block is rebuilt exactly",
                  append(full, rows(savedOffset + keep, 5, salt: 101)),
                  append(compact, rows(savedOffset + keep, 5, salt: 101)))
            let raw = full.diagnosticValues()!
            exact("keep \(keep): divergent continuation tail", raw[0..., compact.rawBase ..< full.offset, 0...], compact.diagnosticValues())
        }
        return c.report()
    }
}
