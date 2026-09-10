import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationEmbeddingRows(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 64 << 20
        let index = try CheckpointIndex(dir: modelDir)
        let rows = try EmbeddingRows(index: index, capacity: 17)
        var files: [URL: [String: MLXArray]] = [:]
        var tensors: [MLXArray] = []
        for (name, ref) in zip(EmbeddingRows.names, rows.refs) {
            if files[ref.file] == nil { files[ref.file] = try loadArrays(url: ref.file) }
            guard let a = files[ref.file]?[name] ?? files[ref.file]?["language_model." + name] else {
                throw ModelError("embedding row reference missing \(name)")
            }
            tensors.append(a)
        }
        files.removeAll()
        eval(tensors)
        var c = CheckBuilder("optimization-embedding-rows")
        func reference(_ ids: [Int], shape: [Int]) -> MLXArray {
            // Keep the oracle's lookup a matrix; dequantize does not accept
            // a rank-one weight vector for a scalar-ID take.
            let idx = MLXArray(ids)
            return dequantized(take(tensors[0], idx, axis: 0), scales: take(tensors[1], idx, axis: 0),
                biases: take(tensors[2], idx, axis: 0), groupSize: index.config.qGroup, bits: index.config.qBits)
                .reshaped(shape + [index.config.hiddenSize])
        }
        func exact(_ ids: [Int], shape: [Int], label: String) throws {
            let expected = reference(ids, shape: shape), actual = try rows.gather(ids, shape: shape)
            c.equal("\(label): dtype", actual.dtype, expected.dtype)
            c.equal("\(label): shape", actual.shape, expected.shape)
            c.expect("\(label): every output bit", actual.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self) ==
                expected.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))
            c.expect("\(label): fixed row capacity", rows.cachedRows <= 17)
        }
        try exact([0], shape: [], label: "scalar first row")
        try exact([index.config.vocabSize - 1], shape: [1, 1], label: "last vocabulary row")
        for n in [1, 16, 17, 18, 255, 256, 1024, 4096] {
            let ids = (0 ..< n).map { (1000 + $0 * 7919) % index.config.vocabSize }
            try exact(ids, shape: [1, n], label: "unique\(n)")
            try exact(Array(ids.reversed()), shape: [n], label: "reverse\(n)")
        }
        try exact([17,17,19,17,19,23], shape: [2,3], label: "duplicate multidimensional IDs")
        let empty = try rows.gather([], shape: [1,0])
        c.equal("empty shape", empty.shape, [1,0,index.config.hiddenSize])
        rows.clear()
        let held = try rows.gather([17,19,23], shape: [1,3])
        eval(held)
        let bits = held.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self)
        for round in 0 ..< 4 {
            try exact((0 ..< 32).map { 1700 + $0 + round * 32 }, shape: [1,32], label: "eviction\(round)")
        }
        rows.clear()
        c.equal("previous output survives eviction and cache release", held.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self), bits)
        for (ids, shape) in [([-1],[1]),([index.config.vocabSize],[1]),([17],[2]),([17],[-1]),([17],[Int.max,2]),([],[0,Int.max]),(Array(repeating:17,count:4097),[4097])] {
            do { _ = try rows.gather(ids, shape: shape); c.expect("invalid input rejected",false) }
            catch { c.expect("invalid input rejected",true) }
        }
        for faultPoint in [0,1,2,17,94] {
            rows.clear(); _ = try rows.gather([17], shape: [1])
            let misses = rows.uniqueRowMisses, hits = rows.uniqueRowHits
            let fault = ReadFault(afterJobs: faultPoint)
            rows.readFault = fault
            do { _ = try rows.gather(Array(1000 ..< 1032), shape: [1,32]); c.expect("fault\(faultPoint): propagated",false) }
            catch { c.expect("fault\(faultPoint): propagated",true) }
            rows.readFault = nil
            c.expect("fault\(faultPoint): actually fired",fault.hasFired)
            c.equal("fault\(faultPoint): previous cache unchanged",rows.cachedRows,1)
            c.equal("fault\(faultPoint): no partial miss publication",rows.uniqueRowMisses,misses)
            c.equal("fault\(faultPoint): no partial hit publication",rows.uniqueRowHits,hits)
            try exact(Array(1000 ..< 1032), shape: [1,32], label: "fault\(faultPoint) retry")
        }
        c.equal("exact resident embedding payload", rows.residentPayloadBytes, 357_580_800)
        c.measure("resident_reference_payload_bytes",Double(rows.residentPayloadBytes))
        c.measure("cached_payload_bytes",Double(rows.cachedPayloadBytes))
        c.measure("end_physical_bytes",Double(ProcessMemory.residentBytes()))
        return c.report()
    }
}
