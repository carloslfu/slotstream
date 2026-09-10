import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// One fresh-process arm of the full-cache component study. It executes
    /// the real PLE row hashing, reads, cache, and embedding assembly only;
    /// no language-model layer or expert matmul runs. Serving is a later gate.
    package static func optimizationNgramCache(modelDir: URL, compact: Bool, ring: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 64 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 10,
            embeddingRowCache: true)
        var options = InferenceOptimizations()
        options.compactNgramRows = compact; options.ngramRingOrder = ring
        model.optimizations = options
        let store = model.ngram
        // Compact row selection normally happens on model.forward. This
        // component deliberately does not execute a model layer.
        store.compactRows = compact; store.ringEvictionOrder = ring
        var c = CheckBuilder("optimization-ngram-cache-\(compact ? "compact" : "reference")\(ring ? "-ring" : "")")
        c.equal("actual row representation", store.compactRows, compact)
        c.equal("actual FIFO representation", store.ringEvictionOrder, ring)
        let fillTokens = 32_768, tile = 256, evictionTokens = 4_096, warmCalls = 128
        let tokenCount = fillTokens + evictionTokens
        let eos = Int64(model.cfg.eosTokenId)
        let ids: [Int64] = (0..<tokenCount).map { (position: Int) -> Int64 in
            if position % 997 == 996 { return eos }
            let mixed = (position * 7919) % 200_000
            return Int64(1000 + mixed)
        }
        var hashes: [String: String] = [:]
        func hash(_ values: [UInt8]) -> String { SHA256.hash(data: Data(values)).map { String(format: "%02x", $0) }.joined() }
        hashes["input_ids"] = ids.withUnsafeBytes { hash(Array($0)) }
        func embed(_ begin: Int, _ count: Int) throws -> MLXArray {
            let history = Array(ids[max(0, begin - (model.cfg.ngramSize - 1))..<begin + count])
            return try store.embeddingChecked(history: history, nNew: count)
        }
        func checkResources(_ stage: String) throws {
            guard let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= 7_000_000_000,
                  ProcessMemory.residentBytes() > 0, ProcessMemory.residentBytes() <= 5_000_000_000 else {
                throw ModelError("ngram component headroom/footprint limit during \(stage)")
            }
        }
        try checkResources("entry")
        let vmBefore = ProcessMemory.vmActivity(), powerBefore = ProcessMemory.operatingConditions()
        let sampler = FootprintSampler()
        let physicalBefore = ProcessMemory.residentBytes()
        var fillHash = SHA256()
        var lastFillHash = ""
        let fillStart = RuntimeClock.now()
        for begin in stride(from: 0, to: fillTokens, by: tile) {
            try autoreleasepool {
                let value = try embed(begin, tile)
                // Hash every emitted BF16 value. This is parity evidence;
                // fill time explicitly includes hashing and is secondary.
                let bytes = value.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self)
                fillHash.update(data: Data(bytes))
                if begin + tile == fillTokens { lastFillHash = hash(bytes) }
            }
            try checkResources("fill")
        }
        let fillSeconds = RuntimeClock.seconds(since: fillStart)
        hashes["fill_embeddings"] = fillHash.finalize().map { String(format: "%02x", $0) }.joined()
        let filledRows = store.cachedRowCount, filledPayload = store.cachedPayloadBytes
        Stream.gpu.synchronize(); MLX.Memory.clearCache()
        let physicalFilled = ProcessMemory.residentBytes()
        c.expect("large cache reached eviction regime", filledRows >= 360_000 && filledRows <= 400_000)
        c.equal("payload follows actual retained rows", filledPayload, filledRows * 160 * (compact ? 2 : 4))
        for _ in 0..<2 { eval(try embed(fillTokens - tile, tile)) }
        store.resetStats()
        let lookupStart = RuntimeClock.now()
        for _ in 0..<warmCalls { eval(try embed(fillTokens - tile, tile)) }
        let lookupSeconds = RuntimeClock.seconds(since: lookupStart)
        c.equal("warm assembly reads no new rows", store.rowMisses, 0)
        c.equal("warm assembly preserves cache occupancy", store.cachedRowCount, filledRows)
        c.measure("warm_row_hits", Double(store.rowHits))
        let warmHash = hash(try embed(fillTokens - tile, tile).reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))
        c.equal("cache-hit output matches the original fill", warmHash, lastFillHash)
        hashes["warm_embedding"] = warmHash
        store.resetStats()
        var evictionHash = SHA256(), evictionSeconds = 0.0
        for begin in stride(from: fillTokens, to: fillTokens + evictionTokens, by: tile) {
            try autoreleasepool {
                let start = RuntimeClock.now()
                let value = try embed(begin, tile); eval(value)
                evictionSeconds += RuntimeClock.seconds(since: start)
                evictionHash.update(data: Data(value.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self)))
            }
            try checkResources("eviction")
        }
        hashes["eviction_embeddings"] = evictionHash.finalize().map { String(format: "%02x", $0) }.joined()
        let misses = store.rowMisses
        // At least one full 40,000-row FIFO batch must have been evicted;
        // a merely large cache would not exercise either queue implementation.
        c.expect("measured phase crosses a full eviction batch", misses > 40_000 && filledRows + misses > 400_000)
        c.expect("cache remains bounded after eviction", store.cachedRowCount <= 400_000)
        c.expect("all row workers joined", !store.hasPendingPrefetch)
        Stream.gpu.synchronize(); MLX.Memory.clearCache()
        let footprint = sampler.finish(), vmAfter = ProcessMemory.vmActivity()
        let powerAfter = ProcessMemory.operatingConditions()
        c.expect("complete component VM interval is observable", vmBefore != nil && vmAfter != nil)
        // These observations exclude a performance interval without turning
        // unchanged arithmetic into a failed correctness assertion.
        if let vmBefore, let vmAfter {
            c.measure("swapins_before", Double(vmBefore.swapins)); c.measure("swapins_after", Double(vmAfter.swapins))
            c.measure("swapouts_before", Double(vmBefore.swapouts)); c.measure("swapouts_after", Double(vmAfter.swapouts))
        }
        c.measure("nominal_thermal_endpoints", powerBefore.thermalState == "nominal" && powerAfter.thermalState == "nominal" ? 1 : 0)
        c.measure("normal_power_endpoints", !powerBefore.lowPowerModeEnabled && !powerAfter.lowPowerModeEnabled ? 1 : 0)
        c.expect("sampled footprint is bounded", footprint.samples > 1 && footprint.peakBytes <= 5_000_000_000)
        c.expect("lifetime RSS is separately bounded", ProcessMemory.lifetimeRSSPeakBytes() > 0 && ProcessMemory.lifetimeRSSPeakBytes() <= 5_000_000_000)
        c.measure("compact", store.compactRows ? 1 : 0); c.measure("ring", store.ringEvictionOrder ? 1 : 0)
        c.measure("fill_tokens", Double(fillTokens)); c.measure("tile_tokens", Double(tile))
        c.measure("eviction_tokens", Double(evictionTokens)); c.measure("warm_calls", Double(warmCalls))
        c.measure("filled_rows", Double(filledRows)); c.measure("filled_payload_bytes", Double(filledPayload))
        c.measure("end_rows", Double(store.cachedRowCount)); c.measure("end_payload_bytes", Double(store.cachedPayloadBytes))
        c.measure("fill_seconds_including_hash", fillSeconds)
        c.measure("warm_assembly_seconds_per_call", lookupSeconds / Double(warmCalls))
        c.measure("eviction_assembly_seconds", evictionSeconds); c.measure("eviction_row_misses", Double(misses))
        c.measure("physical_before_bytes", Double(physicalBefore)); c.measure("physical_filled_bytes", Double(physicalFilled))
        c.measure("physical_end_bytes", Double(ProcessMemory.residentBytes()))
        c.measure("sampled_peak_bytes", Double(footprint.peakBytes)); c.measure("sampled_count", Double(footprint.samples))
        c.measure("lifetime_rss_peak_bytes", Double(ProcessMemory.lifetimeRSSPeakBytes()))
        c.measure("mlx_active_bytes", Double(MLX.Memory.activeMemory))
        var report = c.report()
        for key in hashes.keys.sorted() {
            report.items.append(CheckItem(name: "sha256:\(key)", passed: true, detail: hashes[key]))
        }
        return report
    }
}
