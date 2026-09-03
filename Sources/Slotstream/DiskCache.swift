// Disk-persisted chunk KV cache: saves prefix states after each prefill chunk
// plus the variable-length endpoint after decode, and reloads them to skip
// recomputation. Layout:
//   ~/.slotstream/kvcache/
//     metadata.db                 SQLite index (parent chains, last_used, sizes)
//     <key>/
//       data.kv                   chunk delta + endpoint recurrent state
//                                 (one .kv.partial is
//                                 rewritten atomically; final name is data.kv)
//       parent_sha.bin            parent chunk's key as hex UTF-8, empty at depth 0
//       emb_sha.bin               embedding sha256 as hex UTF-8
// Key derivation lives in ChunkIndex.makeKey and binds chunks to their
// ancestors: sha256(parent_sha || sha256(chunk_embeddings)). Two conversations
// that share the first 4096 tokens but diverge at position 4097 get two
// distinct keys at depth 1, so a content match can never produce a wrong
// KVCache (the linear-attention / MTP recurrent states can't be rewound).

import Foundation
import CryptoKit
import MLX

public enum DiskCache {
    /// The disk tier is OFF unless someone asks for it: the CLI flags
    /// (--disk-kv-cache / --disk-kv-cache-size), the env vars
    /// (SLOTSTREAM_KVCACHE_DIR / SLOTSTREAM_KVCACHE_MAX_GB /
    /// SLOTSTREAM_KVCACHE_ENABLE=1), and only
    /// after an explicit opt-in. Default-off keeps every offline gate hermetic
    /// — a check's first process must see a cold prompt even if a later
    /// process will reuse it, and earlier saves by a previous process must
    /// never turn a "cold" baseline warm. SLOTSTREAM_KVCACHE_DISABLE=1 wins
    /// over everything.
    static var enabled: Bool {
        let env = ProcessInfo.processInfo.environment
        if env["SLOTSTREAM_KVCACHE_DISABLE"] == "1" { return false }
        if env["SLOTSTREAM_KVCACHE_ENABLE"] == "1" { return true }
        if dirOverride != nil || maxBytesOverride != nil { return true }
        if env["SLOTSTREAM_KVCACHE_DIR"] != nil || env["SLOTSTREAM_KVCACHE_MAX_GB"] != nil {
            return true
        }
        return false
    }
    /// Explicit process-global override. Set by the CLI's --disk-kv-cache;
    /// takes precedence over the env var so a single command-line invocation
    /// is hermetic. Reads from `DiskCache.dir` everywhere, so it just has
    /// to be set before any chunk is touched.
    public static var dirOverride: String?
    /// Explicit process-global quota override, in GB. Set by the CLI's
    /// --kv-cache-size; takes precedence over SLOTSTREAM_KVCACHE_MAX_GB so a
    /// single invocation is hermetic. Must be set before the first save or
    /// enforcement (the CLI applies it in announcedPlan, before the model).
    public static var maxBytesOverride: Double?
    static var dir: URL {
        if let o = dirOverride, !o.isEmpty {
            return URL(fileURLWithPath: o)
        }
        if let s = ProcessInfo.processInfo.environment["SLOTSTREAM_KVCACHE_DIR"], !s.isEmpty {
            return URL(fileURLWithPath: s)
        }
        return FileManager.default.homeDirectoryForCurrentUser
            .appendingPathComponent(".slotstream/kvcache", isDirectory: true)
    }
    /// On-disk quota. Old entries beyond this are evicted leaf-first.
    static var maxBytes: Int {
        let gb = maxBytesOverride
            ?? ProcessInfo.processInfo.environment["SLOTSTREAM_KVCACHE_MAX_GB"]
                .flatMap { Double($0) }
            ?? 20.0
        return Int(gb * 1_073_741_824.0)
    }

    /// Force the on-disk cache under its quota with the existing eviction
    /// policy (`ChunkIndex.evictLeaves`): least recently valuable subtrees
    /// first, leaves only, so a parent with live children is protected.
    /// No-op while under quota. Returns bytes freed. Runs at startup when
    /// --kv-cache-size is given, and after every save.
    @discardableResult
    public static func enforceQuota() -> Int {
        let max = maxBytes
        let total = ChunkIndex.shared.totalBytes()
        guard total > max else { return 0 }
        let freed = ChunkIndex.shared.evictLeaves(bytesNeeded: total - max, maxBytes: max)
        if freed > 0 {
            sweepOrphans()
            log("evicted \(freed) bytes, now \(ChunkIndex.shared.totalBytes()) bytes on disk")
        }
        return freed
    }

    /// Serial queue so chunk saves during one prefill (4096, 8192, 12288...)
    /// write one at a time instead of three ~1 GB flushes racing each other
    /// and the running prefill for memory and disk bandwidth.
    static let saveQueue = DispatchQueue(label: "slotstream.kvcache.save", qos: .utility)

    /// Bytes the cache volume can still take (important-usage capacity), for
    /// the disk-full guard. Best-effort: nil when the volume is unreadable.
    private static func volumeFreeBytes(at url: URL) -> Int? {
        (try? url.resourceValues(forKeys: [.volumeAvailableCapacityForImportantUsageKey]))
            .flatMap { $0.volumeAvailableCapacityForImportantUsage }
            .flatMap { Int(exactly: $0) }
    }

    /// Upper-bound estimate of the serialized payload for one save. Overstates
    /// wherever a checkpoint holds a grown-but-partially-used buffer (the KV
    /// capacity beyond the snapshot); overstating is the safe direction for a
    /// disk-headroom guard.
    private static func estimatedContentBytes(_ cp: StateCheckpoint) -> Int {
        var total = 0
        func add(_ a: MLXArray?) {
            guard let a = a else { return }
            let n = a.shape.reduce(1) { $0 * max(1, $1) }
            total += n * 4
        }
        for a in cp.conv.values { add(a) }
        for a in cp.ssm.values { add(a) }
        for a in cp.pleConv.values { add(a) }
        for (k, v) in cp.kv.values { add(k); add(v) }
        for a in cp.indexer.values { add(a) }
        if let lm = cp.lastMulti { add(lm) }
        if let (k, v) = cp.mtpKV { add(k); add(v) }
        if let b = cp.mtpIndexer { add(b) }
        return total
    }

    /// Drop enough leaves to free `bytesNeeded` physical bytes: the leaf-first
    /// policy, plus sweeping the directories off the disk (evictLeaves removes
    /// index rows only). Never touches non-leaf chunks. A full volume must
    /// degrade to dropping the oldest chunks rather than fail a save.
    private static func evictForFreeSpace(_ bytesNeeded: Int) -> Int {
        guard bytesNeeded > 0 else { return 0 }
        let freed = ChunkIndex.shared.evictLeaves(bytesNeeded: bytesNeeded, maxBytes: Int.max)
        if freed > 0 { sweepOrphans() }
        return freed
    }

    /// Block until every queued save has finished. Safe to call from the
    /// main thread; never call from inside a save callback.
    public static func flush() {
        saveQueue.sync { }
    }

    static func log(_ s: String) {
        FileHandle.standardError.write(Data("[kvcache] \(s)\n".utf8))
    }

    // MARK: - key derivation (delegates to ChunkIndex; per-chunk hashes)

    /// Compute sha256 of a row-major embedding slice. Side-file only; the
    /// key itself is derived in ChunkIndex.makeKey so lookups and saves can
    /// never disagree about what identifies a chunk.
    static func embeddingSha(embeddings: [Float]) -> String {
        var hasher = SHA256()
        var buf = Data(capacity: embeddings.count * 4)
        for v in embeddings {
            var f = v.bitPattern.littleEndian
            withUnsafeBytes(of: &f) { buf.append(contentsOf: $0) }
        }
        hasher.update(data: buf)
        return hasher.finalize().map { String(format: "%02x", $0) }.joined()
    }

    // MARK: - save

    /// Save the node that ends at `tokens`. Prefill nodes normally end on the
    /// configured chunk boundary; post-decode terminal nodes need not. The
    /// key is computed synchronously by the caller so the next chunk's
    /// parent_sha can be derived without waiting for the IO. The actual
    /// write runs on the serial save queue; if the same key is queued twice
    /// (e.g. two requests racing on the same prefix), the second one no-ops.
    /// `parentSha` is the previous chunk's key, or nil for depth 0.
    public static func saveAsync(
        state: Qwen4ExpModel.State,
        tokenIds: [Int],
        key: String,
        parentSha: String?,
        depth: Int,
        embeddings: [Float],
        parentTokenCount: Int
    ) {
        guard enabled else { return }
        let embSha = embeddingSha(embeddings: embeddings)
        let base = dir.appendingPathComponent(key, isDirectory: true)
        let cp = state.checkpoint()
        let tokenCount = tokenIds.count
        guard parentTokenCount >= 0, parentTokenCount < tokenCount,
              cp.tokenCount == tokenCount
        else {
            log("SAVE FAILED for \(tokenCount) tokens depth=\(depth): invalid parent/token boundary")
            return
        }
        log("save queued: \(tokenIds.count) tokens depth=\(depth) key=\(key.prefix(12))")
        let t0 = Date()
        saveQueue.async {
            // The actual write. `needsSpaceRetry` lets a disk-full failure
            // evict the least-valuable leaves and try once more before giving
            // up — a save must degrade to dropping chunks, never crash on a
            // full volume.
            var needsSpaceRetry = true
            func performSave() throws {
                do {
                    // Already complete: skip. The check happens after queue
                    // dispatch so concurrent saves of the same key serialize.
                    let dataPath = base.appendingPathComponent("data.kv")
                    if cacheFileVersion(at: dataPath) == 4 {
                        let wasIndexed = ChunkIndex.shared.contains(key: key)
                        if wasIndexed {
                            ChunkIndex.shared.touch(key: key)
                        } else {
                            ChunkIndex.shared.register(
                                key: key, parentSha: parentSha, depth: depth,
                                parentTokenCount: parentTokenCount, tokenCount: tokenCount,
                                sizeBytes: directorySize(at: base))
                        }
                        let reconciliation = wasIndexed ? "" : "; restored missing index row"
                        log("save skipped: \(tokenIds.count) tokens depth=\(depth) key=\(key.prefix(12)) already complete on disk\(reconciliation)")
                        return
                    }
                    if FileManager.default.fileExists(atPath: dataPath.path) {
                        ChunkIndex.shared.remove(key: key)
                        log("save replacing: depth=\(depth) key=\(key.prefix(12)) old or malformed cache format")
                    }
                    // The write needs a real place to land. The checkpoint
                    // payload is the bulk; if the volume cannot take it, drop
                    // the least-valuable leaves first. On a physically full
                    // disk the post-write quota eviction won't run (the write
                    // fails first), so this guard is the only chance to make
                    // room.
                    if let free = volumeFreeBytes(at: base),
                       free < estimatedContentBytes(cp) {
                        let needed = estimatedContentBytes(cp) - free
                        let freed = evictForFreeSpace(needed)
                        log("save evicted \(freed) bytes to free disk space for \(tokenCount) tokens depth=\(depth)")
                    }
                    try FileManager.default.createDirectory(at: base, withIntermediateDirectories: true)
                    let partialPath = base.appendingPathComponent("data.kv.partial")
                    let parentPath = base.appendingPathComponent("parent_sha.bin")
                    let embPath = base.appendingPathComponent("emb_sha.bin")

                    // Crash-safe write: write to .partial, rename to data.kv on
                    // completion. POSIX rename on the same FS is atomic, so a
                    // crash mid-write leaves either the old data.kv or the
                    // .partial — never a half-written data.kv.
                    if FileManager.default.fileExists(atPath: partialPath.path) {
                        try? FileManager.default.removeItem(at: partialPath)
                    }
                    let fm = FileManager.default
                    fm.createFile(atPath: partialPath.path, contents: nil)
                    let outHandle = try FileHandle(forWritingTo: partialPath)

                    // Header line is one small JSON with the offsets the loader
                    // needs to restore the state without reading every .bin
                    // separately. Array blobs follow in a length-prefixed
                    // <shape,json,bytes> format identical to the old layout.
                    let meta: [String: Any] = [
                        "tokenCount": cp.tokenCount,
                        "parentTokenCount": parentTokenCount,
                        "ngramCtx": cp.ngramCtx,
                        "linearLayers": cp.linearLayers,
                        "pleLayers": cp.pleConv.keys.sorted(),
                        "kvLayers": cp.kvOffsets.keys.sorted(),
                        "indexerLayers": cp.indexerOffsets.keys.sorted(),
                        "mtpPresent": cp.mtpKV != nil,
                        "mtpStart": max(0, parentTokenCount - 1),
                        "mtpEnd": cp.mtpOffset,
                        "version": 4
                    ]
                    let metaData = try JSONSerialization.data(withJSONObject: meta, options: [])
                    try outHandle.write(contentsOf: metaData)
                    try outHandle.write(contentsOf: Data("\n".utf8))

                    func writeArray(_ arr: MLXArray?, name: String) throws {
                        guard let a = arr else { return }
                        let f32 = a.asType(.float32)
                        let shape = f32.shape
                        let arrData = f32.asArray(Float.self)
                        // liveDtype records what the running model held: the
                        // GDN SSM state is float32 by design (bf16 loses
                        // precision across the recurrence), everything else is
                        // bfloat16. Restoring ssm to bf16 corrupts it.
                        let live: String
                        switch a.dtype {
                        case .float32: live = "float32"
                        case .float16: live = "float16"
                        default: live = "bfloat16"
                        }
                        let header: [String: Any] = [
                            "name": name, "shape": shape, "dtype": "float32", "liveDtype": live]
                        let headerData = try JSONSerialization.data(withJSONObject: header, options: [])
                        var len = UInt32(headerData.count).littleEndian
                        var combined = Data()
                        withUnsafeBytes(of: &len) { combined.append(contentsOf: $0) }
                        combined.append(headerData)
                        arrData.withUnsafeBytes { combined.append(contentsOf: $0) }
                        try outHandle.write(contentsOf: combined)
                    }

                    for (l, arr) in cp.conv { try writeArray(arr, name: "conv_\(l)") }
                    for (l, arr) in cp.ssm { try writeArray(arr, name: "ssm_\(l)") }
                    for (l, arr) in cp.pleConv { try writeArray(arr, name: "pleConv_\(l)") }
                    if let lm = cp.lastMulti { try writeArray(lm, name: "lastMulti") }
                    let delta = parentTokenCount ..< tokenCount
                    for (l, off) in cp.kvOffsets {
                        guard off == tokenCount, let pair = cp.kv[l],
                              pair.keys.dim(2) >= tokenCount,
                              pair.values.dim(2) >= tokenCount
                        else { throw ModelError("incomplete KV snapshot for layer \(l)") }
                        try writeArray(
                            pair.keys[0..., 0..., delta, 0...], name: "kv_k_\(l)")
                        try writeArray(
                            pair.values[0..., 0..., delta, 0...], name: "kv_v_\(l)")
                    }
                    for (l, off) in cp.indexerOffsets {
                        guard off == tokenCount, let b = cp.indexer[l], b.dim(1) >= tokenCount
                        else { throw ModelError("incomplete indexer snapshot for layer \(l)") }
                        try writeArray(b[0..., delta, 0...], name: "indexer_\(l)")
                    }
                    if let (k, v) = cp.mtpKV {
                        let mtpStart = max(0, parentTokenCount - 1)
                        guard cp.mtpOffset == max(0, tokenCount - 1),
                              k.dim(2) >= cp.mtpOffset, v.dim(2) >= cp.mtpOffset,
                              let b = cp.mtpIndexer, b.dim(1) >= cp.mtpOffset
                        else { throw ModelError("incomplete MTP snapshot") }
                        let mtpDelta = mtpStart ..< cp.mtpOffset
                        try writeArray(k[0..., 0..., mtpDelta, 0...], name: "mtp_kv_k")
                        try writeArray(v[0..., 0..., mtpDelta, 0...], name: "mtp_kv_v")
                        try writeArray(b[0..., mtpDelta, 0...], name: "mtp_indexer")
                    } else if cp.mtpOffset != 0 {
                        throw ModelError("MTP offset has no cache arrays")
                    }

                    try outHandle.close()

                    // Atomic publish.
                    if fm.fileExists(atPath: dataPath.path) { try fm.removeItem(at: dataPath) }
                    try fm.moveItem(at: partialPath, to: dataPath)

                    // parent_sha and emb_sha are 32-byte binary, hex-encoded for
                    // cheap concatenation in makeKey.
                    let parentBytes = parentSha?.data(using: .utf8) ?? Data()
                    try parentBytes.write(to: parentPath)
                    try Data(embSha.utf8).write(to: embPath)

                    // Register in the index only after the file is published and
                    // committed. A crash before this point leaves no row, which
                    // is harmless: the next lookup won't find the chunk and will
                    // rebuild.
                    let dirSize = directorySize(at: base)
                    ChunkIndex.shared.register(
                        key: key, parentSha: parentSha, depth: depth,
                        parentTokenCount: parentTokenCount, tokenCount: tokenCount,
                        sizeBytes: dirSize)

                    // Eviction: if over quota, drop leaves until under quota.
                    enforceQuota()

                    log("save done: \(tokenIds.count) tokens depth=\(depth) key=\(key.prefix(12)) "
                        + "\(String(format: "%.1f", Double(dirSize) / 1e6)) MB in "
                        + String(format: "%.1fs", -t0.timeIntervalSinceNow))
                } catch {
                    // The payload could not be written. On the first failure,
                    // free space by evicting and try exactly once more — the
                    // two most common causes (a full volume, or a stale view
                    // of how full it is) both clear themselves. A genuine
                    // corruption error will fail the retry too and surface.
                    if needsSpaceRetry {
                        needsSpaceRetry = false
                        _ = evictForFreeSpace(estimatedContentBytes(cp))
                        try performSave()
                    } else {
                        throw error
                    }
                }
            }
            do {
                try performSave()
            } catch {
                log("SAVE FAILED for \(tokenIds.count) tokens depth=\(depth): \(error)")
                try? FileManager.default.removeItem(
                    at: base.appendingPathComponent("data.kv.partial"))
            }
        }
    }

    // MARK: - lookup

    /// Walk the chain depth-by-depth. For each depth i, the caller supplies
    /// the embeddings of the chunk at `[i*chunk, (i+1)*chunk)` via `embed`.
    /// We compute the per-chunk key and stop at the first miss. Returns the
    /// longest prefix length whose chain is fully present, or nil.
    public static func longestPrefixHit(
        chunk: Int,
        embed: (Int) -> [Float]?
    ) -> Int? {
        guard enabled, chunk > 0 else { return nil }
        var parentSha: String? = nil
        var depth = 0
        while let embeddings = embed(depth) {
            let key = ChunkIndex.makeKey(parentSha: parentSha, embeddings: embeddings)
            let base = dir.appendingPathComponent(key, isDirectory: true)
            let dataPath = base.appendingPathComponent("data.kv")
            let isIndexed = ChunkIndex.shared.contains(key: key)
            let isOnDisk = FileManager.default.fileExists(atPath: dataPath.path)
            if isOnDisk, cacheFileVersion(at: dataPath) != 4 {
                if isIndexed { ChunkIndex.shared.remove(key: key) }
                log("chain break: depth=\(depth + 1) key=\(key.prefix(12)) old or malformed cache format; rebuild required")
                break
            }
            if isIndexed && isOnDisk {
                ChunkIndex.shared.touch(key: key)
                parentSha = key
                depth += 1
                continue
            }

            if isIndexed {
                ChunkIndex.shared.remove(key: key)
                log("chain break: depth=\(depth + 1) key=\(key.prefix(12)) indexed but data.kv is missing; removed stale index row")
                break
            }

            if isOnDisk {
                // A crash can publish data.kv and die before registering it.
                // The save path also regards this atomic file as complete, so
                // make lookup use the same source of truth and heal the index.
                ChunkIndex.shared.register(
                    key: key, parentSha: parentSha, depth: depth + 1,
                    parentTokenCount: depth * chunk, tokenCount: (depth + 1) * chunk,
                    sizeBytes: directorySize(at: base))
                log("lookup recovered: depth=\(depth + 1) key=\(key.prefix(12)) data.kv existed but index row was missing")
                parentSha = key
                depth += 1
                continue
            }

            let partialPath = base.appendingPathComponent("data.kv.partial")
            if FileManager.default.fileExists(atPath: partialPath.path) {
                log("chain break: depth=\(depth + 1) key=\(key.prefix(12)) index row missing; only data.kv.partial exists")
            } else if FileManager.default.fileExists(atPath: base.path) {
                log("chain break: depth=\(depth + 1) key=\(key.prefix(12)) index row and data.kv missing; key directory exists")
            } else {
                log("chain break: depth=\(depth + 1) key=\(key.prefix(12)) absent from index and disk")
            }
            break
        }
        return depth == 0 ? nil : depth * chunk
    }

    // MARK: - load

    /// Rebuild a state by applying `depth` fixed-size nodes and, when present,
    /// one variable-length terminal child.
    public static func loadState(
        for embed: (Int) -> [Float]?,
        depth: Int,
        terminalKey: String? = nil,
        tokenIds: [Int],
        template: Qwen4ExpModel.State
    ) -> Qwen4ExpModel.State? {
        guard enabled else {
            log("load skipped: disk cache disabled")
            return nil
        }
        guard depth > 0 || terminalKey != nil else {
            log("load failed: invalid chain depth \(depth)")
            return nil
        }
        var keys: [String] = []
        var parentSha: String? = nil
        for i in 0..<depth {
            guard let e = embed(i) else {
                log("load failed: embeddings unavailable at depth=\(i + 1)")
                return nil
            }
            let key = ChunkIndex.makeKey(parentSha: parentSha, embeddings: e)
            keys.append(key)
            parentSha = key
        }
        if let terminalKey { keys.append(terminalKey) }

        let state = template
        for (index, key) in keys.enumerated() {
            guard applyNode(key: key, depth: index + 1, to: state) else { return nil }
        }
        guard state.tokenCount == tokenIds.count else {
            log("load failed: chain restored \(state.tokenCount) tokens, expected \(tokenIds.count)")
            return nil
        }
        log("load done: \(tokenIds.count) tokens depth=\(depth) key=\(keys.last!.prefix(12)) from \(keys.count) nodes")
        return state
    }

    private static func applyNode(
        key: String, depth: Int, to state: Qwen4ExpModel.State
    ) -> Bool {
        let base = dir.appendingPathComponent(key, isDirectory: true)
        let dataPath = base.appendingPathComponent("data.kv")
        var accepted = false
        defer {
            if !accepted {
                ChunkIndex.shared.remove(key: key)
                try? FileManager.default.removeItem(at: dataPath)
                log("load invalidated: depth=\(depth) key=\(key.prefix(12)) will be rebuilt")
            }
        }
        guard FileManager.default.fileExists(atPath: dataPath.path) else {
            ChunkIndex.shared.remove(key: key)
            log("load failed: depth=\(depth) key=\(key.prefix(12)) indexed but data.kv is missing; removed stale index row")
            return false
        }
        guard let data = try? Data(contentsOf: dataPath) else {
            log("load: data.kv unreadable for key=\(key.prefix(12))")
            return false
        }
        guard let nlIndex = data.firstIndex(of: 0x0a) else {
            log("load: no header newline in data.kv for key=\(key.prefix(12)) (size \(data.count))")
            return false
        }
        let metaData = data[0..<nlIndex]
        guard let meta = try? JSONSerialization.jsonObject(with: metaData) as? [String: Any]
        else {
            log("load: bad meta header JSON for key=\(key.prefix(12))")
            return false
        }
        if (meta["version"] as? Int) != 4 {
            log("load: bad version \(meta["version"] ?? -1) for key=\(key.prefix(12))")
            return false
        }
        var body = data.subdata(in: (nlIndex + 1)..<data.count)

        // Read the body one array at a time. `body` is re-based to index 0
        // so the offsets below are correct. Each array on disk is
        // `<len:u32-le><header:len bytes of JSON><floats:shape-product*4 bytes>`,
        // and the float byte count is derived from the parsed shape so we
        // never consume into the next array's header.
        var arraysByName: [String: MLXArray] = [:]
        var bodyFailure: String? = nil
        while body.count >= 4 {
            let len = body[0..<4]
                .withUnsafeBytes { $0.load(as: UInt32.self).littleEndian }
            let headerSize = 4 + Int(len)
            guard body.count >= headerSize else {
                bodyFailure = "truncated array header"
                break
            }
            let headerData = body[4..<headerSize]
            guard let header = try? JSONSerialization.jsonObject(with: headerData) as? [String: Any],
                  let name = header["name"] as? String,
                  let shape = header["shape"] as? [Int]
            else {
                bodyFailure = "invalid array header JSON"
                break
            }
            var elementCount = 1
            var shapeIsValid = true
            for dim in shape {
                guard dim >= 0 else {
                    shapeIsValid = false
                    break
                }
                let (next, overflow) = elementCount.multipliedReportingOverflow(by: dim)
                guard !overflow else {
                    shapeIsValid = false
                    break
                }
                elementCount = next
            }
            let (dataBytes, byteOverflow) = elementCount.multipliedReportingOverflow(by: 4)
            guard shapeIsValid, !byteOverflow else {
                bodyFailure = "invalid or overflowing shape for \(name)"
                break
            }
            guard dataBytes <= body.count - headerSize else {
                bodyFailure = "truncated array data for \(name)"
                break
            }
            let raw = body[headerSize..<(headerSize + dataBytes)]
            body = body.subdata(in: (headerSize + dataBytes)..<body.count)
            let floats = raw.withUnsafeBytes { Array($0.bindMemory(to: Float.self)) }
            // Restore to the dtype the live model held (liveDtype, added in
            // v3 headers): the SSM state must come back as float32 or the
            // recurrence diverges. Older headers without the field restore
            // as bfloat16, which only the bf16 arrays did hold.
            let dt: DType
            switch header["liveDtype"] as? String {
            case "float32": dt = .float32
            case "float16": dt = .float16
            default: dt = .bfloat16
            }
            arraysByName[name] = MLXArray(floats, shape).asType(dt)
        }
        if bodyFailure == nil, !body.isEmpty {
            bodyFailure = "trailing \(body.count) bytes"
        }
        if let failure = bodyFailure {
            log("load failed: depth=\(depth) key=\(key.prefix(12)) \(failure)")
            return false
        }

        guard let tokenCount = meta["tokenCount"] as? Int,
              let parentTokenCount = meta["parentTokenCount"] as? Int,
              parentTokenCount == state.tokenCount,
              tokenCount > parentTokenCount
        else {
            log("load failed: depth=\(depth) key=\(key.prefix(12)) non-contiguous token boundary")
            return false
        }
        let deltaCount = tokenCount - parentTokenCount
        guard let linearLayers = meta["linearLayers"] as? [Int],
              Set(linearLayers) == Set(state.linear.keys),
              let kvLayers = meta["kvLayers"] as? [Int],
              Set(kvLayers) == Set(state.kv.keys),
              let indexerLayers = meta["indexerLayers"] as? [Int],
              Set(indexerLayers) == Set(state.indexer.keys),
              let pleLayers = meta["pleLayers"] as? [Int],
              Set(pleLayers) == state.expectedPLELayers
        else {
            log("load failed: depth=\(depth) key=\(key.prefix(12)) cache layer set mismatch")
            return false
        }

        for l in linearLayers {
            guard let conv = arraysByName["conv_\(l)"],
                  let ssm = arraysByName["ssm_\(l)"],
                  conv.shape == state.expectedConvShape, conv.dtype == .bfloat16,
                  ssm.shape == state.expectedSSMShape, ssm.dtype == .float32
            else {
                log("load failed: depth=\(depth) key=\(key.prefix(12)) bad recurrent arrays for layer \(l)")
                return false
            }
        }
        for l in pleLayers {
            guard let ple = arraysByName["pleConv_\(l)"],
                  ple.shape == state.expectedPLEShape, ple.dtype == .bfloat16
            else {
                log("load failed: depth=\(depth) key=\(key.prefix(12)) bad PLE array for layer \(l)")
                return false
            }
        }
        for l in kvLayers {
            guard let k = arraysByName["kv_k_\(l)"],
                  let v = arraysByName["kv_v_\(l)"],
                  k.ndim == 4, v.ndim == 4,
                  k.shape == [1, state.expectedKVHeads, deltaCount, state.expectedKVHeadDim],
                  v.shape == k.shape, k.dtype == .bfloat16, v.dtype == .bfloat16
            else {
                log("load failed: depth=\(depth) key=\(key.prefix(12)) bad KV delta for layer \(l)")
                return false
            }
        }
        for l in indexerLayers {
            guard let b = arraysByName["indexer_\(l)"],
                  b.shape == [1, deltaCount, state.expectedIndexerDim],
                  b.dtype == .bfloat16
            else {
                log("load failed: depth=\(depth) key=\(key.prefix(12)) bad indexer delta for layer \(l)")
                return false
            }
        }

        let mtpPresent = meta["mtpPresent"] as? Bool ?? false
        let mtpStart = meta["mtpStart"] as? Int ?? 0
        let mtpEnd = meta["mtpEnd"] as? Int ?? 0
        if mtpPresent {
            guard mtpStart == (state.mtp?.offset ?? 0), mtpEnd >= mtpStart,
                  let k = arraysByName["mtp_kv_k"],
                  let v = arraysByName["mtp_kv_v"],
                  let b = arraysByName["mtp_indexer"],
                  k.ndim == 4, v.ndim == 4, b.ndim == 3,
                  k.shape == [1, state.expectedKVHeads,
                              mtpEnd - mtpStart, state.expectedKVHeadDim],
                  v.shape == k.shape,
                  b.shape == [1, mtpEnd - mtpStart, state.expectedIndexerDim],
                  k.dtype == .bfloat16, v.dtype == .bfloat16,
                  b.dtype == .bfloat16,
                  arraysByName["lastMulti"] != nil
            else {
                log("load failed: depth=\(depth) key=\(key.prefix(12)) invalid MTP delta")
                return false
            }
        } else if state.mtp != nil
            || arraysByName["mtp_kv_k"] != nil
            || arraysByName["mtp_kv_v"] != nil
            || arraysByName["mtp_indexer"] != nil
        {
            log("load failed: depth=\(depth) key=\(key.prefix(12)) mixed MTP chain")
            return false
        }

        for l in linearLayers {
            state.linear[l]?.convState = arraysByName["conv_\(l)"]
            state.linear[l]?.ssmState = arraysByName["ssm_\(l)"]
            state.linear[l]?.pleConvState = arraysByName["pleConv_\(l)"]
        }
        for l in kvLayers {
            guard state.kv[l]!.append(
                keys: arraysByName["kv_k_\(l)"]!,
                values: arraysByName["kv_v_\(l)"]!)
            else { return false }
        }
        for l in indexerLayers {
            guard state.indexer[l]!.append(arraysByName["indexer_\(l)"]!) else { return false }
        }
        if mtpPresent {
            if state.mtp == nil { state.mtp = MTPState() }
            guard state.mtp!.kv.append(
                keys: arraysByName["mtp_kv_k"]!, values: arraysByName["mtp_kv_v"]!),
                  state.mtp!.indexer.append(arraysByName["mtp_indexer"]!),
                  state.mtp!.offset == mtpEnd
            else { return false }
        }
        let ngram: [Int64]
        if let saved = meta["ngramCtx"] as? [Int64] { ngram = saved }
        else if let saved = meta["ngramCtx"] as? [Int] { ngram = saved.map { Int64($0) } }
        else {
            log("load failed: depth=\(depth) key=\(key.prefix(12)) ngram context missing")
            return false
        }
        guard ngram.count == state.ngramCtx.count else {
            log("load failed: depth=\(depth) key=\(key.prefix(12)) bad ngram context")
            return false
        }
        state.ngramCtx = ngram
        state.tokenCount = tokenCount
        state.lastMulti = arraysByName["lastMulti"]

        var materialize = Array(arraysByName.values)
        for cache in state.kv.values {
            if let k = cache.keys { materialize.append(k) }
            if let v = cache.values { materialize.append(v) }
        }
        for cache in state.indexer.values {
            if let b = cache.snapshot() { materialize.append(b) }
        }
        if let mtp = state.mtp {
            if let k = mtp.kv.keys { materialize.append(k) }
            if let v = mtp.kv.values { materialize.append(v) }
            if let b = mtp.indexer.snapshot() { materialize.append(b) }
        }
        eval(materialize)
        ChunkIndex.shared.touch(key: key)
        accepted = true
        return true
    }

    // MARK: - utilities

    private static func cacheFileVersion(at url: URL) -> Int? {
        guard let handle = try? FileHandle(forReadingFrom: url) else { return nil }
        defer { try? handle.close() }
        guard let data = try? handle.read(upToCount: 4096),
              let nlIndex = data.firstIndex(of: 0x0a),
              let meta = try? JSONSerialization.jsonObject(
                with: data[0..<nlIndex]) as? [String: Any]
        else { return nil }
        return meta["version"] as? Int
    }

    private static func directorySize(at url: URL) -> Int {
        let fm = FileManager.default
        guard let it = fm.enumerator(
            at: url, includingPropertiesForKeys: [.fileSizeKey, .isRegularFileKey])
        else { return 0 }
        var total = 0
        for case let f as URL in it {
            let vals = try? f.resourceValues(forKeys: [.fileSizeKey, .isRegularFileKey])
            if vals?.isRegularFile == true { total += vals?.fileSize ?? 0 }
        }
        return total
    }

    /// Remove chunk directories whose key is no longer in the index — the
    /// leaves evictLeaves dropped (it deletes DB rows only; this is where the
    /// directory actually leaves the disk) — and directories that can never
    /// load (no data.kv: crash leftovers, legacy layouts). Called after
    /// eviction so a stale process can't be tripped up by the disk outlasting
    /// the DB. This also bounds the lookup-heal window: an unindexed data.kv
    /// would otherwise be re-registered by longestPrefixHit and resurrect a
    /// chunk the eviction deliberately chose to drop.
    private static func sweepOrphans() {
        let fm = FileManager.default
        guard let entries = try? fm.contentsOfDirectory(
            at: dir, includingPropertiesForKeys: [.isDirectoryKey]) else { return }
        for entry in entries {
            guard (try? entry.resourceValues(forKeys: [.isDirectoryKey]).isDirectory) == true
            else { continue }
            let dataPath = entry.appendingPathComponent("data.kv")
            if !ChunkIndex.shared.contains(key: entry.lastPathComponent)
                || !fm.fileExists(atPath: dataPath.path) {
                try? fm.removeItem(at: entry)
            }
        }
    }
}