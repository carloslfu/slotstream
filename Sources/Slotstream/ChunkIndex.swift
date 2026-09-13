// Chunk index for the disk-persisted prefix KV cache.
//
// One node = one chunk's append-only attention state plus the recurrent state
// at its endpoint. Prefill nodes normally end at `prefillChunk` boundaries;
// terminal decode nodes may have any positive length. Nodes are chained by
// parent: chunk N's key is
// `sha256(parent_sha || sha256(chunk_embeddings))`, so two conversations
// that share a parent but diverge in the next token range get distinct keys
// and never alias.
//
// On disk, each chunk lives at `kvcache_dir/<key>/` with three files:
//   - `data.kv` — the chunk delta plus endpoint recurrent state
//   - `parent_sha.bin` — parent key as hex UTF-8 (or empty at the root)
//   - `emb_sha.bin` — embedding hash as hex UTF-8
//
// The metadata DB (SQLite, journal_mode=WAL) holds:
//   - last_used: timestamp of most recent save or load
//   - hits: times this content matched again (a load walk, or a re-save of
//     the identical node); the value signal the eviction score is built from
//   - size_bytes: total bytes occupied by this chunk's directory
//   - parent_sha: parent's key (NULL for depth 0)
//
// Eviction: when total size exceeds the quota (--kv-cache-size, else env
// SLOTSTREAM_KVCACHE_MAX_GB, default 20), the saver deletes leaves whose
// combined size clears the deficit. Leaves are binned into four age
// quartiles by last_used; the oldest bin goes first — all of it one tier —
// and younger bins only if the quota still demands it, so a freshly saved
// node is never the first thing its own saver evicts. Within a tier the
// victim is the least valuable checkpoint by `ChunkIndex.evictionScore`
// (decayed hit count times token density, the score ds4's KV store evicts
// by), oldest then shallowest breaking a tie: a node that keeps being
// matched, or that stores many tokens per byte, outlives a fat one that is
// never read. A parent with live children is protected: its value is the max
// of its own and all its descendants' last_used. Passes repeat until the
// quota holds, so a dead turn chain drains to its root.
// DiskCache.enforceQuota runs the same policy at startup when the CLI flag
// lowers the quota; it also sweeps the evicted chunks' directories off the
// disk.
//
// Crashes mid-save leave a `.kv.partial` file in the chunk directory; the
// next save for that key detects the partial and rewrites. The metadata DB
// is updated only after the `.kv.partial` is renamed atomically to `data.kv`,
// so a crash before rename leaves no DB row pointing at partial data.

import Foundation
import CryptoKit
import SQLite3

/// Process-wide SQLite handle. Single connection per process; serialized
/// internally. WAL mode tolerates concurrent readers (future split: stats
/// tool) but writers serialize, which is what we want.
public final class ChunkIndex {
    /// Process-wide index singleton. Public so CLI-side checks can exercise
    /// the eviction policy without a model; the DB opens at DiskCache.dir on
    /// first touch, so overrides must be applied before the first use.
    public static let shared = ChunkIndex()

    /// Model-identity namespace, mixed into every key at depth 0. Set by the
    /// model when it loads (from config.json + the weight shard sizes). The
    /// key already hashes chunk embeddings, so tokenizer/embedding drift
    /// changes every key on its own; this catches a same-shape weight swap
    /// (re-quantized revision) that would otherwise serve stale KV built by
    /// different attention/MLP weights. Empty until a model loads, which is
    /// also when nothing can save or load yet.
    public static var vault = ""

    private var db: OpaquePointer?
    private let serial = DispatchQueue(label: "slotstream.chunkindex")
    private let dbPath: URL

    private convenience init() {
        self.init(directory: DiskCache.dir)
    }

    /// Open (or create) the metadata database under `directory`. A directory
    /// that cannot hold it — read-only, full, or otherwise unwritable — leaves
    /// the index closed instead of failing the process: reads answer "no rows",
    /// writes are dropped, and `isOpen` reports which happened.
    package init(directory: URL) {
        dbPath = directory.appendingPathComponent("metadata.db")
        try? FileManager.default.createDirectory(
            at: directory, withIntermediateDirectories: true)
        if sqlite3_open(dbPath.path, &db) != SQLITE_OK {
            FileHandle.standardError.write(
                Data("[kvcache] metadata.db open failed: \(String(cString: sqlite3_errmsg(db))) — disk cache disabled\n".utf8))
            db = nil
            return
        }
        // WAL: readers don't block writers, one writer at a time.
        sqlite3_exec(db, "PRAGMA journal_mode=WAL;", nil, nil, nil)
        sqlite3_exec(db, "PRAGMA synchronous=NORMAL;", nil, nil, nil)
        sqlite3_exec(db, "PRAGMA foreign_keys=ON;", nil, nil, nil)
        let schema = """
        CREATE TABLE IF NOT EXISTS chunks (
          key TEXT PRIMARY KEY,
          parent_sha TEXT,
          depth INTEGER NOT NULL,
          parent_token_count INTEGER,
          token_count INTEGER,
          size_bytes INTEGER NOT NULL,
          hits INTEGER NOT NULL DEFAULT 0,
          last_used REAL NOT NULL
        );
        CREATE INDEX IF NOT EXISTS chunks_parent ON chunks(parent_sha);
        CREATE INDEX IF NOT EXISTS chunks_last_used ON chunks(last_used);
        """
        // No FK on parent_sha: a child chunk can be inserted before its
        // parent (both are queued together in the save path), and SQLite's
        // foreign_keys check would reject the child until the parent's row
        // is visible. The chain walk stops at the first missing key anyway,
        // so the orphan is harmless — sweepOrphans() drops it on the next
        // eviction pass if nothing reconciles it.
        sqlite3_exec(db, "PRAGMA foreign_keys=OFF;", nil, nil, nil)
        if sqlite3_exec(db, schema, nil, nil, nil) != SQLITE_OK {
            FileHandle.standardError.write(
                Data("[kvcache] schema init failed: \(String(cString: sqlite3_errmsg(db)))\n".utf8))
        }
        // Existing v4 indexes predate variable-length terminal nodes. Nullable
        // columns keep those rows readable while new saves populate boundaries.
        sqlite3_exec(db, "ALTER TABLE chunks ADD COLUMN parent_token_count INTEGER;", nil, nil, nil)
        sqlite3_exec(db, "ALTER TABLE chunks ADD COLUMN token_count INTEGER;", nil, nil, nil)
        // v4 indexes predate hit counting; those rows start at 0 hits and are
        // scored on density alone, which is the honest reading of a node
        // whose reads were never recorded.
        sqlite3_exec(db, "ALTER TABLE chunks ADD COLUMN hits INTEGER NOT NULL DEFAULT 0;", nil, nil, nil)
        sqlite3_exec(
            db,
            "CREATE INDEX IF NOT EXISTS chunks_boundary ON chunks(parent_sha, parent_token_count, token_count);",
            nil, nil, nil)
    }

    deinit { if db != nil { sqlite3_close(db) } }

    /// Derive the model-identity namespace from the checkout that will build
    /// the states saved under it: a hash of config.json plus the weight shard
    /// sizes (name + byte count). Call once from Qwen4ExpModel.init, before
    /// any save or load can run.
    public static func setVault(modelDir: URL) {
        var parts: [String] = []
        let fm = FileManager.default
        if let cfg = try? Data(contentsOf: modelDir.appendingPathComponent("config.json")) {
            let digest = SHA256.hash(data: cfg)
            parts.append(digest.map { String(format: "%02x", $0) }.joined())
        }
        if let shards = try? fm.contentsOfDirectory(
            at: modelDir, includingPropertiesForKeys: [.fileSizeKey])
        {
            for shard in shards.sorted(by: { $0.lastPathComponent < $1.lastPathComponent })
            where shard.lastPathComponent.hasPrefix("model")
                && shard.pathExtension == "safetensors"
            {
                let size = (try? shard.resourceValues(forKeys: [.fileSizeKey]).fileSize) ?? 0
                parts.append("\(shard.lastPathComponent):\(size)")
            }
        }
        vault = parts.joined(separator: ",")
    }

    /// Stable key derivation. `parentSha` is nil for depth 0. The vault
    /// namespace is mixed in before the chain so a different model identity
    /// can never collide with this one at any depth.
    public static func makeKey(parentSha: String?, embeddings: [Float]) -> String {
        var hasher = SHA256()
        if !vault.isEmpty {
            hasher.update(data: Data("vault=\(vault.count)".utf8))
            hasher.update(data: Data(vault.utf8))
        }
        if let p = parentSha { hasher.update(data: Data(p.utf8)) }
        // Hash the embeddings in deterministic little-endian order. The caller
        // passes a flat [Float] slice of the chunk's dequantized embedding
        // matrix; any byte-identical prefix produces the same hash, so the
        // chain matches across processes that re-derive from the same weights.
        let n = embeddings.count
        var buf = Data(capacity: n * 4)
        for v in embeddings {
            var f = v.bitPattern.littleEndian
            withUnsafeBytes(of: &f) { buf.append(contentsOf: $0) }
        }
        hasher.update(data: buf)
        let digest = hasher.finalize()
        return digest.map { String(format: "%02x", $0) }.joined()
    }

    /// Record a freshly saved chunk. Returns the resolved key (caller needs
    /// it to write the parent_sha.bin and emb_sha.bin files).
    public func register(
        key: String, parentSha: String?, depth: Int,
        parentTokenCount: Int, tokenCount: Int, sizeBytes: Int
    ) {
        serial.sync {
            let stmt = prepare("""
            INSERT INTO chunks(
              key, parent_sha, depth, parent_token_count, token_count,
              size_bytes, last_used)
            VALUES (?, ?, ?, ?, ?, ?, ?)
            ON CONFLICT(key) DO UPDATE SET
              parent_sha=excluded.parent_sha,
              depth=excluded.depth,
              parent_token_count=excluded.parent_token_count,
              token_count=excluded.token_count,
              size_bytes=excluded.size_bytes,
              last_used=excluded.last_used;
            """)
            defer { sqlite3_finalize(stmt) }
            let now = Date().timeIntervalSince1970
            sqlite3_bind_text(stmt, 1, key, -1, SQLITE_TRANSIENT)
            if let p = parentSha {
                sqlite3_bind_text(stmt, 2, p, -1, SQLITE_TRANSIENT)
            } else {
                sqlite3_bind_null(stmt, 2)
            }
            sqlite3_bind_int(stmt, 3, Int32(depth))
            sqlite3_bind_int64(stmt, 4, Int64(parentTokenCount))
            sqlite3_bind_int64(stmt, 5, Int64(tokenCount))
            sqlite3_bind_int64(stmt, 6, Int64(sizeBytes))
            sqlite3_bind_double(stmt, 7, now)
            if sqlite3_step(stmt) != SQLITE_DONE {
                FileHandle.standardError.write(
                    Data("[kvcache] register failed for \(key.prefix(12)): \(String(cString: sqlite3_errmsg(db)))\n".utf8))
            }
        }
    }

    /// Update last_used on a hit so LRU sorts correctly.
    public func touch(key: String) {
        serial.sync { touchInternal(key: key) }
    }

    /// Whether the metadata index knows this content-addressed chunk.
    public func contains(key: String) -> Bool {
        serial.sync {
            let stmt = prepare("SELECT 1 FROM chunks WHERE key = ? LIMIT 1;")
            defer { sqlite3_finalize(stmt) }
            sqlite3_bind_text(stmt, 1, key, -1, SQLITE_TRANSIENT)
            return sqlite3_step(stmt) == SQLITE_ROW
        }
    }

    /// Possible variable-length children rooted at a known state boundary.
    /// The caller validates content by deriving each key from prompt embeddings.
    public func childEndpoints(
        parentSha: String?, parentTokenCount: Int, before tokenCount: Int
    ) -> [(key: String, tokenCount: Int)] {
        serial.sync {
            let parentClause = parentSha == nil ? "parent_sha IS NULL" : "parent_sha = ?"
            let stmt = prepare("""
            SELECT key, token_count FROM chunks
            WHERE \(parentClause)
              AND parent_token_count = ?
              AND token_count > parent_token_count
              AND token_count < ?
            ORDER BY token_count DESC;
            """)
            defer { sqlite3_finalize(stmt) }
            var bind: Int32 = 1
            if let parentSha {
                sqlite3_bind_text(stmt, bind, parentSha, -1, SQLITE_TRANSIENT)
                bind += 1
            }
            sqlite3_bind_int64(stmt, bind, Int64(parentTokenCount))
            sqlite3_bind_int64(stmt, bind + 1, Int64(tokenCount))
            var result: [(String, Int)] = []
            while sqlite3_step(stmt) == SQLITE_ROW {
                guard let key = sqlite3_column_text(stmt, 0) else { continue }
                result.append((String(cString: key), Int(sqlite3_column_int64(stmt, 1))))
            }
            return result
        }
    }

    private func touchInternal(key: String) {
        let stmt = prepare("UPDATE chunks SET last_used = ?, hits = hits + 1 WHERE key = ?;")
        defer { sqlite3_finalize(stmt) }
        sqlite3_bind_double(stmt, 1, Date().timeIntervalSince1970)
        sqlite3_bind_text(stmt, 2, key, -1, SQLITE_TRANSIENT)
        sqlite3_step(stmt)
    }

    /// Weight-free gates park a leaf at a chosen age and hit count, and read
    /// back what the live path recorded; the live path only ever writes "now"
    /// and increments. Both are `package` like `DiskWriteTrace`, and neither
    /// can create a row.
    package func setActivity(key: String, hits: Int, lastUsed: Double) {
        serial.sync {
            let stmt = prepare("UPDATE chunks SET hits = ?, last_used = ? WHERE key = ?;")
            defer { sqlite3_finalize(stmt) }
            sqlite3_bind_int(stmt, 1, Int32(hits))
            sqlite3_bind_double(stmt, 2, lastUsed)
            sqlite3_bind_text(stmt, 3, key, -1, SQLITE_TRANSIENT)
            sqlite3_step(stmt)
        }
    }

    package func activity(key: String) -> (hits: Int, lastUsed: Double)? {
        serial.sync {
            let stmt = prepare("SELECT hits, last_used FROM chunks WHERE key = ? LIMIT 1;")
            defer { sqlite3_finalize(stmt) }
            sqlite3_bind_text(stmt, 1, key, -1, SQLITE_TRANSIENT)
            guard sqlite3_step(stmt) == SQLITE_ROW else { return nil }
            return (Int(sqlite3_column_int64(stmt, 0)), sqlite3_column_double(stmt, 1))
        }
    }

    /// Total disk usage summed across rows. Includes the directory itself,
    /// not the kvcache parent dir.
    public func totalBytes() -> Int {
        serial.sync {
            let stmt = prepare("SELECT COALESCE(SUM(size_bytes), 0) FROM chunks;")
            defer { sqlite3_finalize(stmt) }
            guard sqlite3_step(stmt) == SQLITE_ROW else { return 0 }
            return Int(sqlite3_column_int64(stmt, 0))
        }
    }

    /// One eviction candidate: a chunk with no children.
    private typealias Leaf = (
        key: String, size: Int, depth: Int, lastUsed: Double, tokens: Int, hits: Int
    )

    /// ds4's KV-store value: `(decayed hits + 1) x tokens / bytes`. Hits decay
    /// with a six-hour half-life (ds4's DS4_KVSTORE_HIT_HALF_LIFE_SECONDS), so
    /// a node that earned its keep this morning has lost most of that claim by
    /// the evening, and one untouched for days scores as if never matched
    /// (below `minEffectiveHits`). The `+ 1` keeps unmatched nodes comparable:
    /// they are then ranked on density alone — tokens of reusable context per
    /// byte — which is the right order for two checkpoints of one age, because
    /// a decode endpoint carrying a handful of tokens pays the same ~113 MB of
    /// recurrent state as a chunk node carrying a thousand. A size- or
    /// token-less row scores 0 and is taken first.
    public static let hitHalfLifeSeconds: Double = 6 * 60 * 60
    public static let minEffectiveHits: Double = 0.01

    public static func evictionScore(
        hits: Int, tokenCount: Int, sizeBytes: Int, lastUsed: Double, now: Double
    ) -> Double {
        guard sizeBytes > 0, tokenCount > 0 else { return 0 }
        var effectiveHits = Double(hits) * exp2(-max(0, now - lastUsed) / hitHalfLifeSeconds)
        if effectiveHits < minEffectiveHits { effectiveHits = 0 }
        return (effectiveHits + 1) * Double(tokenCount) / Double(sizeBytes)
    }

    /// Evict leaves to free at least `bytesNeeded` bytes. Returns bytes
    /// actually freed. Candidates are leaves only — a parent with a live
    /// child is never dangled, and its value is the max of its own and all
    /// its descendants' last_used, recomputed before selection. Leaves are
    /// binned into four age quartiles by last_used: the oldest quartile goes
    /// first, all of it one tier (within a tier, `evictionScore` then LRU then
    /// shallowest depth), and younger tiers only if the quota still demands
    /// it. Recency must dominate depth because a live conversation's tip is
    /// also its shallowest leaf — depth-first ordering evicted the node the
    /// saver had just written — which is why age tiering is kept above the
    /// score rather than folded into it. Passes repeat until the quota holds,
    /// so a dead turn chain drains to its root.
    public func evictLeaves(bytesNeeded: Int, maxBytes: Int) -> Int {
        serial.sync {
            var freed = 0
            // Turn-boundary chains (one node per prompt, one per decode) make
            // dead conversations deep: a single pass can only see the current
            // tips, and each eviction exposes the next ancestor as a leaf.
            // Iterate lift/select/delete until the quota holds, nothing is a
            // leaf any more, or a pass stops shrinking the index (a failed
            // delete must not spin).
            var lastTotal = Int.max
            while true {
                // Lift parent.last_used to max(children.last_used) for non-leaves.
                // SQLite has no recursive CTE update that's cheap; instead, iterate
                // depths from deepest to 0, recomputing each non-leaf as
                // max(self.last_used, max(child.last_used)). Children whose parent
                // has been evicted are reclassified as roots (parent_sha NULL).
                let maxDepth = intScalar("SELECT COALESCE(MAX(depth), -1) FROM chunks;")
                if maxDepth < 0 { return 0 }
                for d in stride(from: maxDepth, through: 1, by: -1) {
                    let upd = prepare("""
                    UPDATE chunks
                    SET last_used = (
                      SELECT MAX(c2.last_used)
                      FROM chunks c2
                      WHERE c2.parent_sha = chunks.key
                    )
                    WHERE depth = ?
                      AND EXISTS (SELECT 1 FROM chunks c2 WHERE c2.parent_sha = chunks.key);
                    """)
                    sqlite3_bind_int(upd, 1, Int32(d))
                    sqlite3_step(upd)
                    sqlite3_finalize(upd)
                }

                // Select the current leaves — only chunks with no children
                // are candidates, so a live parent is never dangled.
                let stmt = prepare("""
                SELECT key, size_bytes, depth, last_used, COALESCE(token_count, 0), hits
                FROM chunks
                WHERE NOT EXISTS (SELECT 1 FROM chunks c2 WHERE c2.parent_sha = chunks.key);
                """)
                defer { sqlite3_finalize(stmt) }
                var leaves: [Leaf] = []
                while sqlite3_step(stmt) == SQLITE_ROW {
                    guard let keyC = sqlite3_column_text(stmt, 0) else { continue }
                    leaves.append((
                        String(cString: keyC),
                        Int(sqlite3_column_int64(stmt, 1)),
                        Int(sqlite3_column_int64(stmt, 2)),
                        sqlite3_column_double(stmt, 3),
                        Int(sqlite3_column_int64(stmt, 4)),
                        Int(sqlite3_column_int64(stmt, 5))))
                }

                // Age quartiles over the leaf frontier, oldest tier first:
                // within a tier every age counts the same — decay alone would
                // let an old favourite outrank the node just written — and the
                // score then LRU then shallowest depth order the victims. A
                // node saved seconds ago lands in the youngest tier and cannot
                // go while an older tier still has a leaf.
                let now = Date().timeIntervalSince1970
                func score(_ leaf: Leaf) -> Double {
                    ChunkIndex.evictionScore(
                        hits: leaf.hits, tokenCount: leaf.tokens,
                        sizeBytes: leaf.size, lastUsed: leaf.lastUsed, now: now)
                }
                let byAge = leaves.sorted { $0.lastUsed < $1.lastUsed }
                var tiers: [[Leaf]] = [[], [], [], []]
                for (i, leaf) in byAge.enumerated() {
                    tiers[min(3, 4 * i / max(byAge.count, 1))].append(leaf)
                }
                var progressed = false
                tierLoop: for tier in tiers {
                    for leaf in tier.sorted(by: {
                        (score($0), $0.lastUsed, $0.depth)
                            < (score($1), $1.lastUsed, $1.depth)
                    }) {
                        if freed >= bytesNeeded && totalBytesScalar() <= maxBytes {
                            break tierLoop
                        }
                        deleteChunk(key: leaf.key)
                        freed += leaf.size
                        progressed = true
                        FileHandle.standardError.write(
                            Data(("[kvcache] evicted \(leaf.key.prefix(12)) (\(leaf.size) bytes, "
                                + "\(leaf.tokens) tokens, \(leaf.hits) hits, score "
                                + String(format: "%.4f", score(leaf)) + ")\n").utf8))
                    }
                    if freed >= bytesNeeded && totalBytesScalar() <= maxBytes { break }
                }
                let total = totalBytesScalar()
                if !progressed || total >= lastTotal
                    || (freed >= bytesNeeded && total <= maxBytes)
                {
                    break
                }
                lastTotal = total
            }
            return freed
        }
    }

    private func deleteChunk(key: String) {
        // Drop the DB row first (CASCADE orphans to parent_sha NULL). The
        // directory is removed separately by the caller — we don't have
        // access to the file system here, and the caller already needs to
        // know the chunk path anyway.
        let stmt = prepare("DELETE FROM chunks WHERE key = ?;")
        sqlite3_bind_text(stmt, 1, key, -1, SQLITE_TRANSIENT)
        sqlite3_step(stmt)
        sqlite3_finalize(stmt)
    }

    public func remove(key: String) {
        serial.sync { deleteChunk(key: key) }
    }

    /// Read parent_sha back (or nil for depth 0).
    public func parentSha(key: String) -> String? {
        serial.sync {
            let stmt = prepare("SELECT parent_sha FROM chunks WHERE key = ? LIMIT 1;")
            defer { sqlite3_finalize(stmt) }
            sqlite3_bind_text(stmt, 1, key, -1, SQLITE_TRANSIENT)
            guard sqlite3_step(stmt) == SQLITE_ROW else { return nil }
            guard let p = sqlite3_column_text(stmt, 0) else { return nil }
            return String(cString: p)
        }
    }

    /// False when the metadata database could not be opened. The tier is then
    /// disabled: every query is answered from nothing and every write dropped.
    package var isOpen: Bool { db != nil }

    // MARK: - low-level

    private func prepare(_ sql: String) -> OpaquePointer? {
        // A failed open leaves no handle. `sqlite3_prepare_v2(nil, ...)` reports
        // SQLITE_MISUSE and `sqlite3_errmsg(nil)` answers "out of memory", so an
        // unwritable cache directory looked like memory exhaustion and repeated
        // that line on every query. The open failure is already reported once at
        // startup; a closed index is simply empty.
        guard let db = self.db else { return nil }
        var stmt: OpaquePointer?
        if sqlite3_prepare_v2(db, sql, -1, &stmt, nil) != SQLITE_OK {
            FileHandle.standardError.write(
                Data("[kvcache] prepare failed: \(String(cString: sqlite3_errmsg(db))) sql=\(sql)\n".utf8))
            return nil
        }
        return stmt
    }

    private func intScalar(_ sql: String) -> Int {
        let stmt = prepare(sql)
        defer { sqlite3_finalize(stmt) }
        guard sqlite3_step(stmt) == SQLITE_ROW else { return 0 }
        return Int(sqlite3_column_int64(stmt, 0))
    }

    private func totalBytesScalar() -> Int { intScalar("SELECT COALESCE(SUM(size_bytes),0) FROM chunks;") }
}

// SQLite needs the SQLITE_TRANSIENT macro; Swift's SQLite3 module exposes
// it as `unsafeBitCast(-1, to: sqlite3_destructor_type.self)` historically,
// but the Swift module also defines `SQLITE_TRANSIENT` as a global.
internal let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)