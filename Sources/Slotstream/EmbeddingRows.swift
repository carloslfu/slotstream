import Foundation
import MLX

/// Optional bounded input-embedding cache. Calls are serialized; workers fill
/// private packed rows and never touch MLX or caches. The output head is separate.
package final class EmbeddingRows {
    package static let names = ["model.embed_tokens.weight", "model.embed_tokens.scales", "model.embed_tokens.biases"]
    package let refs: [TensorRef]
    private let handles: [TensorReadHandle]
    private let config: ModelConfig
    private let capacity: Int
    private let offsets: [Int]
    private let rowBytes: Int
    private var cache: [Int: Data] = [:]
    private var order: FIFOKeys
    package var readFault: ReadFault?
    package private(set) var uniqueRowHits = 0
    package private(set) var uniqueRowMisses = 0
    package var cachedRows: Int { cache.count }
    package var cachedPayloadBytes: Int { cache.count * rowBytes }
    package var residentPayloadBytes: Int { refs.reduce(0) { $0 + $1.byteCount } }

    package init(index: CheckpointIndex, capacity: Int = 8192) throws {
        guard (1 ... 8192).contains(capacity) else { throw ModelError("embedding row capacity must be 1...8192") }
        let cfg = index.config
        let refs = try Self.names.map { name -> TensorRef in
            guard let ref = index.tensors[name] else { throw ModelError("missing embedding tensor \(name)") }
            return ref
        }
        guard cfg.qBits == 4, cfg.qGroup == 64, cfg.hiddenSize == 2560,
              refs[0].shape == [cfg.vocabSize, cfg.hiddenSize / 8], refs[0].dtype == "U32",
              refs[1].shape == [cfg.vocabSize, cfg.hiddenSize / cfg.qGroup], refs[1].dtype == "BF16",
              refs[2].shape == refs[1].shape, refs[2].dtype == "BF16" else {
            throw ModelError("embedding row candidate requires the exact curated quantized geometry")
        }
        try ModelProcessGuard.acquire()
        self.refs = refs; self.handles = refs.map { index.readHandle(for: $0) }
        self.config = cfg; self.capacity = capacity; self.order = FIFOKeys(capacity: capacity)
        self.offsets = [0, refs[0].rowBytes, refs[0].rowBytes + refs[1].rowBytes]
        self.rowBytes = refs.reduce(0) { $0 + $1.rowBytes }
    }

    private final class Job {
        let id: Int
        var row: Data?
        init(_ id: Int) { self.id = id }
    }
    package func clear() { cache.removeAll(); order.removeAll() }

    package func gather(_ ids: [Int], shape: [Int]) throws -> MLXArray {
        var count = 1
        for dim in shape {
            let next = count.multipliedReportingOverflow(by: dim)
            guard (0 ... 4096).contains(dim), !next.overflow else { throw ModelError("invalid embedding row shape") }
            count = next.partialValue
        }
        guard count == ids.count, ids.count <= 4096,
              ids.allSatisfy({ $0 >= 0 && $0 < config.vocabSize }) else {
            throw ModelError("embedding row candidate requires valid IDs and at most 4096 positions")
        }
        if ids.isEmpty { return MLXArray.zeros(shape + [config.hiddenSize], dtype: .bfloat16) }
        var seen = Set<Int>(), available: [Int: Data] = [:], jobs: [Job] = []
        var hits = 0
        for id in ids where seen.insert(id).inserted {
            if let row = cache[id] { available[id] = row; hits += 1 }
            else { jobs.append(Job(id)) }
        }
        let failure = JoinedReadFailure()
        let workers = min(32, jobs.count)
        if workers > 0 {
            DispatchQueue.concurrentPerform(iterations: workers) { worker in
                for i in stride(from: worker, to: jobs.count, by: workers) {
                    let job = jobs[i]
                    do {
                        var row = Data(count: rowBytes)
                        try row.withUnsafeMutableBytes { bytes in
                            for p in refs.indices {
                                try readFault?.beforeRead()
                                try handles[p].readChecked(into: bytes.baseAddress! + offsets[p],
                                    offset: job.id * refs[p].rowBytes, count: refs[p].rowBytes)
                            }
                        }
                        job.row = row
                    } catch { failure.record(error) }
                }
            }
        }
        // Join before any insertion/eviction. A failed piece or batch cannot
        // publish partial rows or change previously valid cache ownership.
        try failure.finish()
        for job in jobs {
            guard let row = job.row else { throw ModelError("embedding row job completed without bytes") }
            available[job.id] = row
        }
        for job in jobs {
            if cache.count == capacity, let old = order.popFirst() { cache.removeValue(forKey: Int(old)) }
            cache[job.id] = available[job.id]!
            order.append(Int64(job.id))
        }
        uniqueRowHits += hits; uniqueRowMisses += jobs.count
        var pieces: [MLXArray] = []
        for p in refs.indices {
            let stride = refs[p].rowBytes
            var data = Data(count: ids.count * stride)
            data.withUnsafeMutableBytes { output in
                for (i, id) in ids.enumerated() {
                    available[id]!.withUnsafeBytes { row in
                        memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
                    }
                }
            }
            // MLX dequantization requires a matrix even for a scalar ID.
            // Preserve the caller's shape only after independent row math.
            pieces.append(MLXArray(data, [ids.count, refs[p].shape[1]], dtype: p == 0 ? .uint32 : .bfloat16))
        }
        return dequantized(pieces[0], scales: pieces[1], biases: pieces[2],
            groupSize: config.qGroup, bits: config.qBits).reshaped(shape + [config.hiddenSize])
    }
}
