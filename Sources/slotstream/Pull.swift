// slotstream pull: download and verify the pinned model weights.
//
// Parallel (64 MB chunks from every file share one work queue, so every
// connection stays busy to the last byte), resumable (an on-disk chunk map
// per file, so resume is exact even though chunks land out of order),
// hash-verified (upstream LFS sha256 from the pinned revision, embedded in
// PinnedModel.swift so integrity never depends on a live API), disk-checked
// before any bytes move. A stranger runs: `slotstream pull` → `slotstream serve`.

import ArgumentParser
import Foundation
#if canImport(CryptoKit)
import CryptoKit
#else
import Crypto
#endif
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
#if canImport(Glibc)
import Glibc
#endif
#if !canImport(ObjectiveC)
/// Darwin's autoreleasepool has no Linux counterpart; the body simply runs.
/// (Linux is not a supported platform; this lets `Tools/pull_bench_linux.sh`
/// exercise the exact download code from a gigabit datacenter link.)
func autoreleasepool<T>(invoking body: () throws -> T) rethrows -> T { try body() }
#endif

private struct PullIntegrityError: Error, LocalizedError {
    let file: String
    var errorDescription: String? {
        "\(file): sha256 mismatch after download — the source returned bytes "
            + "that do not match the pinned revision"
    }
}

enum ModelLocator {
    /// Respect $HOME when set (redirecting 104 GB of weights is a real use
    /// case); Foundation's homeDirectoryForCurrentUser ignores it.
    static var home: URL {
        if let h = ProcessInfo.processInfo.environment["HOME"], !h.isEmpty {
            return URL(fileURLWithPath: h)
        }
        return FileManager.default.homeDirectoryForCurrentUser
    }
    static var userModelsDir: URL {
        home.appendingPathComponent(".slotstream/models")
    }
    static var repoLocalDir: URL {
        URL(fileURLWithPath: #filePath)  // Sources/slotstream/Pull.swift
            .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
            .appendingPathComponent("models/\(PinnedModel.dirName)")
    }

    /// Resolve a --model value: an existing path wins; the pinned model name
    /// resolves to the dev checkout copy if present, else ~/.slotstream/models.
    static func resolve(_ spec: String) -> URL {
        let expanded = (spec as NSString).expandingTildeInPath
        if FileManager.default.fileExists(atPath: expanded) {
            return URL(fileURLWithPath: expanded)
        }
        if spec == PinnedModel.name || spec == PinnedModel.dirName {
            if FileManager.default.fileExists(atPath: repoLocalDir.path) { return repoLocalDir }
            return userModelsDir.appendingPathComponent(PinnedModel.dirName)
        }
        return URL(fileURLWithPath: expanded)
    }
}

/// Where the weight bytes come from. Integrity never comes from a source —
/// every file must match the sha256/size manifest compiled into the binary —
/// so a wrong or stale source fails closed and the next one is tried.
enum WeightSources {
    /// Ordered download bases; `<base>/<file path>` must serve the file.
    /// Override with SLOTSTREAM_WEIGHTS_SOURCES (comma-separated bases,
    /// tried in order), e.g. a private mirror or a local cache.
    static var bases: [String] {
        if let env = ProcessInfo.processInfo.environment["SLOTSTREAM_WEIGHTS_SOURCES"],
            !env.isEmpty
        {
            let list = env.split(separator: ",")
                .map { $0.trimmingCharacters(in: .whitespaces) }
                .filter { !$0.isEmpty }
            if !list.isEmpty { return list }
        }
        return defaults
    }
    static let defaults = [
        // Mirror under the slotstream author's account: byte-identical to the
        // pinned upstream revision (same sha256s), so slotstream keeps working
        // if the upstream conversion moves, gates, or disappears.
        "https://huggingface.co/\(PinnedModel.mirrorRepo)/resolve/\(PinnedModel.mirrorRevision)",
        "https://huggingface.co/\(PinnedModel.repo)/resolve/\(PinnedModel.revision)",
    ]
}

/// Fetch shape. Eight TCP connections by default, each owned by its own
/// URLSession: HTTP/2 multiplexes every request in a session over one
/// connection and ignores `httpMaximumConnectionsPerHost` (Apple documents
/// this), so until 0.2.1 a single session pulled at one connection's speed
/// whatever the flag said. One connection is bounded by TCP window over
/// round-trip time: ~72 MB/s from a 1 Gbit/s datacenter link 35 ms from the
/// Hugging Face bridge, 25 to 40 from a home link 100 ms away. Eight real
/// connections measured 112 MB/s over a full install from that datacenter
/// link (the port), and 50 to 63 at home, where the path caps every host in
/// that band (MEASUREMENTS.md, 2026-09-01). 64 MB chunks keep the retry unit small
/// without making the chunk map big (about 1,600 chunks for the whole 103.8 GB).
enum PullTuning {
    static let chunkBytes: Int64 = 64 << 20
    static var connections: Int {
        if let s = ProcessInfo.processInfo.environment["SLOTSTREAM_PULL_CONNECTIONS"],
            let n = Int(s), n > 0
        {
            return min(n, 32)
        }
        return 8
    }
}

/// One unit of work: bytes [start, start+length) of one file.
private struct Chunk {
    let file: Int  // index into PinnedModel.files
    let index: Int  // chunk number within that file
    let start: Int64
    let length: Int64
}

/// A file being downloaded: an fd on its .part plus the chunk map that makes
/// resume exact when chunks land out of order.
private final class PartFile {
    let file: PinnedModel.File
    let part: URL
    let finalURL: URL
    let mapURL: URL
    /// -1 once closed. Guarded by `ioLock` together with every use of the fd:
    /// the periodic map flush and the finish-and-rename path both touch it, and
    /// fsyncing a descriptor another thread has already closed can land on
    /// whatever file inherited that number.
    var fd: Int32
    let ioLock = NSLock()
    var chunkDone: [UInt8]
    var pending: Int
    var sourceIdx = 0
    var dirty = false

    init(file: PinnedModel.File, dest: URL, fd: Int32, chunkDone: [UInt8], pending: Int) {
        self.file = file
        self.finalURL = dest.appendingPathComponent(file.path)
        self.part = finalURL.appendingPathExtension("part")
        self.mapURL = finalURL.appendingPathExtension("partmap")
        self.fd = fd
        self.chunkDone = chunkDone
        self.pending = pending
    }
}

/// In-flight state for one chunk request.
private final class ChunkState {
    let fd: Int32
    let chunk: Chunk
    var writeOffset: Int64
    var received: Int64 = 0
    var error: Error?
    let sem = DispatchSemaphore(value: 0)
    init(fd: Int32, chunk: Chunk) {
        self.fd = fd
        self.chunk = chunk
        self.writeOffset = chunk.start
    }
}

/// Runs the whole pull: N worker threads pulling chunks off one shared queue,
/// one URLSession (so connections are reused), and a background queue that
/// hashes and renames each file the moment its last chunk lands, overlapping
/// verification with the download that is still running.
private final class PullJob: NSObject, URLSessionDataDelegate {
    let dest: URL
    let bases: [String]
    let connections: Int

    private var parts: [Int: PartFile] = [:]
    private var queue: [Chunk] = []
    private var nextChunk = 0
    private var live: [Int: ChunkState] = [:]

    private let lock = NSLock()
    private var failure: Error?
    private var hashFailure: Error?
    private var filesLeft = 0

    private var grandDone: Int64 = 0
    private var lastPrint = Date()
    private var startTime = Date()
    private var startBytes: Int64 = 0
    private var rate = 0.0

    private let hashQueue = DispatchQueue(label: "slotstream.pull.hash")
    private let hashGroup = DispatchGroup()

    // One URLSession per worker, all built in init. A session multiplexes
    // every request to a host over a single HTTP/2 connection and ignores
    // `httpMaximumConnectionsPerHost`, so N connections take N sessions.
    // Requests are keyed by our own id (`taskDescription`): task identifiers
    // are only unique within a session, and an earlier build that keyed on
    // them had in-flight state collide across sessions.
    private var sessions: [URLSession] = []
    private var nextRequestID = 1
    /// The TCP connection each session most recently carried a chunk body on
    /// (from task metrics), so the connection count is measured on every pull
    /// rather than assumed. Keyed by session: a reconnect replaces that
    /// session's entry instead of inflating the count.
    private var connectionBySession: [ObjectIdentifier: String] = [:]
    private var connectionsReported = false

    init(dest: URL, bases: [String], connections: Int) {
        self.dest = dest
        self.bases = bases
        self.connections = connections
        super.init()
        for _ in 0 ..< connections {
            let cfg = URLSessionConfiguration.ephemeral
            cfg.timeoutIntervalForRequest = 60
            cfg.timeoutIntervalForResource = 7 * 24 * 3600
            cfg.httpMaximumConnectionsPerHost = 1
            sessions.append(URLSession(configuration: cfg, delegate: self, delegateQueue: nil))
        }
    }

    // MARK: plan

    /// Open every incomplete file, adopt whatever is already on disk, and build
    /// the chunk queue. Returns the number of bytes still to fetch.
    func plan() throws -> Int64 {
        let fm = FileManager.default
        var remaining: Int64 = 0
        // A throw partway through would otherwise strand the descriptors opened
        // for earlier files; `serve` calls this in-process.
        var ok = false
        defer {
            if !ok {
                for pf in parts.values where pf.fd >= 0 {
                    close(pf.fd)
                    pf.fd = -1
                }
                parts.removeAll()
            }
        }
        for (i, f) in PinnedModel.files.enumerated() {
            let finalURL = dest.appendingPathComponent(f.path)
            let resolvedFinal = finalURL.resolvingSymlinksInPath()
            if Pull.fileMatches(resolvedFinal, size: f.size, sha256: f.sha256) {
                continue
            }
            try fm.createDirectory(
                at: finalURL.deletingLastPathComponent(), withIntermediateDirectories: true)
            let part = finalURL.appendingPathExtension("part")
            let mapURL = finalURL.appendingPathExtension("partmap")
            // A same-size corrupt final used to be skipped forever. Remove only
            // the manifest path (not a symlink target) and any stale resume map,
            // then rebuild it through the ordinary verified download path.
            if fm.fileExists(atPath: finalURL.path) {
                try fm.removeItem(at: finalURL)
                try? fm.removeItem(at: part)
                try? fm.removeItem(at: mapURL)
            }
            let n = Pull.chunkCount(f.size)
            var map = [UInt8](repeating: 0, count: n)
            if let d = try? Data(contentsOf: mapURL), d.count == n {
                map = [UInt8](d)
            } else if let ps = (try? fm.attributesOfItem(atPath: part.path))?[.size] as? Int64,
                ps > 0, ps < f.size
            {
                // pre-0.1.4 .part files were a strict sequential append, so
                // whole chunks below the high-water mark are already good.
                for c in 0 ..< Int(ps / PullTuning.chunkBytes) { map[c] = 1 }
            }
            let fd = open(part.path, O_WRONLY | O_CREAT, 0o644)
            guard fd >= 0 else {
                throw ValidationError(
                    "cannot open \(part.path): \(String(cString: strerror(errno)))")
            }
            guard ftruncate(fd, off_t(f.size)) == 0 else {
                close(fd)
                throw ValidationError(
                    "cannot size \(part.path): \(String(cString: strerror(errno)))")
            }
            var pending = 0
            for c in 0 ..< n where map[c] == 0 {
                let start = Int64(c) * PullTuning.chunkBytes
                let len = Pull.chunkLength(f.size, c)
                queue.append(Chunk(file: i, index: c, start: start, length: len))
                remaining += len
                pending += 1
            }
            if pending == 0 {
                // every chunk already present: hash and rename without fetching
                close(fd)
                let pf = PartFile(file: f, dest: dest, fd: -1, chunkDone: map, pending: 0)
                filesLeft += 1
                finishFile(pf, alreadyClosed: true)
            } else {
                parts[i] = PartFile(file: f, dest: dest, fd: fd, chunkDone: map, pending: pending)
                filesLeft += 1
            }
        }
        grandDone = PinnedModel.totalBytes - remaining
        startBytes = grandDone
        ok = true
        return remaining
    }

    // MARK: run

    func run() throws {
        guard !queue.isEmpty else {
            hashGroup.wait()
            sessions.forEach { $0.invalidateAndCancel() }
            if let e = hashFailure { throw e }
            return
        }
        startTime = Date()
        lastPrint = startTime
        let group = DispatchGroup()
        for i in 0 ..< connections {
            group.enter()
            let session = sessions[i]
            let t = Thread { [weak self] in
                self?.workerLoop(session: session)
                group.leave()
            }
            t.stackSize = 512 << 10
            t.start()
        }
        group.wait()
        hashGroup.wait()
        sessions.forEach { $0.invalidateAndCancel() }
        flushMaps(force: true)
        // whatever is still incomplete keeps its map and its fd until here;
        // serve calls this in-process, so the fds must not outlive the pull
        lock.lock()
        for pf in parts.values {
            pf.ioLock.lock()
            if pf.fd >= 0 {
                close(pf.fd)
                pf.fd = -1
            }
            pf.ioLock.unlock()
        }
        parts.removeAll()
        let err = failure ?? hashFailure
        lock.unlock()
        if let err { throw err }
    }

    private func workerLoop(session: URLSession) {
        while let chunk = nextWork() {
            var lastError: Error?
            var attempt = 0
            var ok = false
            while true {
                attempt += 1
                let (base, srcIdx) = currentSource(for: chunk.file)
                do {
                    try fetch(chunk, base: base, session: session)
                    ok = true
                    break
                } catch {
                    lastError = error
                    let ns = error as NSError
                    let permanent =
                        ns.domain == "pull" && (400 ..< 500).contains(ns.code) && ns.code != 429
                    if permanent || attempt >= 5 {
                        // A source that is missing the file, repeatedly times
                        // out, or returns 5xx is not a reason to ignore the
                        // configured fallback.
                        if advanceSource(for: chunk.file, from: srcIdx) {
                            attempt = 0
                            continue
                        }
                        break
                    }
                    Thread.sleep(forTimeInterval: Double(attempt) * 2)
                }
            }
            if ok {
                completeChunk(chunk)
            } else {
                recordFailure(chunk, lastError)
                return
            }
        }
    }

    private func nextWork() -> Chunk? {
        lock.lock()
        defer { lock.unlock() }
        guard failure == nil, hashFailure == nil, nextChunk < queue.count else { return nil }
        let c = queue[nextChunk]
        nextChunk += 1
        return c
    }

    private func currentSource(for file: Int) -> (String, Int) {
        lock.lock()
        defer { lock.unlock() }
        let i = parts[file]?.sourceIdx ?? 0
        return (bases[min(i, bases.count - 1)], i)
    }

    private func advanceSource(for file: Int, from i: Int) -> Bool {
        lock.lock()
        guard let pf = parts[file] else {
            lock.unlock()
            return false
        }
        if pf.sourceIdx == i { pf.sourceIdx += 1 }
        let next = pf.sourceIdx
        let name = pf.file.path
        lock.unlock()
        guard next < bases.count else { return false }
        FileHandle.standardError.write(
            "  \(name): source failed — trying \(bases[next])\n".data(using: .utf8)!)
        return true
    }

    private func recordFailure(_ chunk: Chunk, _ error: Error?) {
        lock.lock()
        if failure == nil {
            failure = ValidationError(
                "\(PinnedModel.files[chunk.file].path): download failed from all "
                    + "\(bases.count) source(s) (\(error?.localizedDescription ?? "?")) — "
                    + "rerun `slotstream pull` to resume")
        }
        lock.unlock()
    }

    // MARK: one chunk

    private func fetch(_ chunk: Chunk, base: String, session: URLSession) throws {
        let f = PinnedModel.files[chunk.file]
        lock.lock()
        let fd = parts[chunk.file]?.fd ?? -1
        lock.unlock()
        guard fd >= 0 else { return }

        guard let url = URL(string: "\(base)/\(f.path)") else {
            throw NSError(
                domain: "pull", code: 400,
                userInfo: [NSLocalizedDescriptionKey: "bad source URL for \(f.path)"])
        }
        var req = URLRequest(url: url)
        req.timeoutInterval = 60
        req.setValue(
            "bytes=\(chunk.start)-\(chunk.start + chunk.length - 1)",
            forHTTPHeaderField: "Range")
        // URLSession may otherwise transparently decode a compressed body;
        // byte ranges and their offsets are defined over the stored bytes.
        req.setValue("identity", forHTTPHeaderField: "Accept-Encoding")

        let state = ChunkState(fd: fd, chunk: chunk)
        let task = session.dataTask(with: req)
        lock.lock()
        let rid = nextRequestID
        nextRequestID += 1
        live[rid] = state
        lock.unlock()
        task.taskDescription = String(rid)
        task.resume()
        state.sem.wait()
        lock.lock()
        live.removeValue(forKey: rid)
        lock.unlock()

        if let e = state.error { throw e }
        guard state.received == chunk.length else {
            throw NSError(
                domain: "pull", code: 1,
                userInfo: [
                    NSLocalizedDescriptionKey: "short chunk: \(state.received)/\(chunk.length) bytes"
                ])
        }
    }

    private func state(of task: URLSessionTask) -> ChunkState? {
        guard let rid = Int(task.taskDescription ?? "") else { return nil }
        lock.lock()
        defer { lock.unlock() }
        return live[rid]
    }

    func urlSession(
        _ s: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse,
        completionHandler: @escaping (URLSession.ResponseDisposition) -> Void
    ) {
        let st = state(of: dataTask)
        guard let st else {
            completionHandler(.cancel)
            return
        }
        let code = (response as? HTTPURLResponse)?.statusCode ?? 0
        let http = response as? HTTPURLResponse
        let wholeFile =
            st.chunk.start == 0 && st.chunk.length == PinnedModel.files[st.chunk.file].size
        let validRange = code == 206 && Pull.validContentRange(
            http?.value(forHTTPHeaderField: "Content-Range"),
            start: st.chunk.start, length: st.chunk.length,
            total: PinnedModel.files[st.chunk.file].size)
        if validRange || (code == 200 && wholeFile) {
            completionHandler(.allow)
        } else {
            // 200 for a partial range means the server ignored Range; accepting
            // it would write the whole file into one chunk slot.
            st.error = NSError(
                domain: "pull", code: code == 200 ? 1 : code,
                userInfo: [
                    NSLocalizedDescriptionKey: code == 200
                        ? "server ignored the Range request"
                        : code == 206 ? "invalid Content-Range" : "HTTP \(code)"
                ])
            completionHandler(.cancel)
        }
    }

    func urlSession(_ s: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        let st = state(of: dataTask)
        guard let st, st.error == nil else { return }
        guard st.received + Int64(data.count) <= st.chunk.length else {
            st.error = NSError(
                domain: "pull", code: 1,
                userInfo: [NSLocalizedDescriptionKey: "server sent more than the requested range"])
            dataTask.cancel()
            return
        }
        var wrote = 0
        data.withUnsafeBytes { (raw: UnsafeRawBufferPointer) in
            guard var p = raw.baseAddress else { return }
            var n = raw.count
            var off = st.writeOffset
            while n > 0 {
                let w = pwrite(st.fd, p, n, off_t(off))
                if w <= 0 {
                    st.error = NSError(
                        domain: "pull", code: 1,
                        userInfo: [
                            NSLocalizedDescriptionKey:
                                "write failed: \(String(cString: strerror(errno)))"
                        ])
                    break
                }
                n -= w
                p = p.advanced(by: w)
                off += Int64(w)
                wrote += w
            }
            st.writeOffset = off
        }
        st.received += Int64(wrote)
        noteProgress(Int64(wrote))
    }

    func urlSession(_ s: URLSession, task: URLSessionTask, didCompleteWithError e: Error?) {
        let st = state(of: task)
        guard let st else { return }
        if st.error == nil, let e { st.error = e }
        st.sem.signal()
    }

    #if canImport(Darwin)
    /// Count the TCP connections that actually carry chunk bodies and say so
    /// once, as soon as every worker's session has completed a chunk. "8
    /// connections" was a claim this code did not keep for four releases; now
    /// it is a number it measures.
    func urlSession(
        _ s: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics
    ) {
        // The last transaction carried the body; earlier ones are the redirect.
        guard let tx = metrics.transactionMetrics.last else { return }
        let key = "\(tx.remoteAddress ?? "?"):\(tx.remotePort ?? 0)<-\(tx.localPort ?? 0)"
        lock.lock()
        connectionBySession[ObjectIdentifier(s)] = key
        let report = !connectionsReported && connectionBySession.count == connections
        if report { connectionsReported = true }
        let n = Set(connectionBySession.values).count
        lock.unlock()
        guard report else { return }
        var line = "  \(n) connection\(n == 1 ? "" : "s") in use"
        if n < connections { line += " — expected \(connections); URLSession coalesced some" }
        FileHandle.standardError.write((line + "\n").data(using: .utf8)!)
    }
    #endif

    // MARK: bookkeeping

    private func completeChunk(_ chunk: Chunk) {
        var finished: PartFile?
        lock.lock()
        if let pf = parts[chunk.file] {
            pf.chunkDone[chunk.index] = 1
            pf.dirty = true
            pf.pending -= 1
            if pf.pending == 0 {
                finished = pf
                parts.removeValue(forKey: chunk.file)
            }
        }
        lock.unlock()
        if let pf = finished {
            finishFile(pf, alreadyClosed: false)
        }
        flushMaps(force: false)
    }

    /// Hash and rename on a background queue so verification of a finished file
    /// overlaps the download of the next one.
    private func finishFile(_ pf: PartFile, alreadyClosed: Bool) {
        if !alreadyClosed {
            pf.ioLock.lock()
            if pf.fd >= 0 {
                fsync(pf.fd)
                close(pf.fd)
                pf.fd = -1
            }
            pf.ioLock.unlock()
        }
        hashGroup.enter()
        hashQueue.async { [self] in
            defer { hashGroup.leave() }
            let fm = FileManager.default
            do {
                if let want = pf.file.sha256 {
                    let got = Pull.sha256(of: pf.part)
                    guard got == want else {
                        try? fm.removeItem(at: pf.part)
                        try? fm.removeItem(at: pf.mapURL)
                        throw PullIntegrityError(file: pf.file.path)
                    }
                }
                _ = try? fm.removeItem(at: pf.finalURL)
                try fm.moveItem(at: pf.part, to: pf.finalURL)
                try? fm.removeItem(at: pf.mapURL)
                lock.lock()
                filesLeft -= 1
                lock.unlock()
                FileHandle.standardError.write(
                    "  done  \(pf.file.path)\n".data(using: .utf8)!)
            } catch {
                lock.lock()
                if hashFailure == nil { hashFailure = error }
                lock.unlock()
            }
        }
    }

    private func noteProgress(_ bytes: Int64) {
        lock.lock()
        grandDone += bytes
        lock.unlock()
    }

    /// Every 2 s: flush the chunk maps (after fsyncing the data they claim, so
    /// a map never promises bytes that are not on disk) and print one line.
    private func flushMaps(force: Bool) {
        lock.lock()
        let now = Date()
        guard force || now.timeIntervalSince(lastPrint) >= 2 else {
            lock.unlock()
            return
        }
        let elapsed = now.timeIntervalSince(startTime)
        if elapsed > 0 { rate = Double(grandDone - startBytes) / elapsed }
        lastPrint = now
        var snapshots: [(PartFile, [UInt8])] = []
        for pf in parts.values where pf.dirty {
            pf.dirty = false
            snapshots.append((pf, pf.chunkDone))
        }
        let done = grandDone
        let left = filesLeft
        let quiet = force
        lock.unlock()

        for (pf, map) in snapshots {
            pf.ioLock.lock()
            // Skip a file that finished (and had its map removed) since the
            // snapshot was taken; rewriting its map would leave an orphan.
            if pf.fd >= 0 {
                fsync(pf.fd)
                try? Data(map).write(to: pf.mapURL, options: .atomic)
            }
            pf.ioLock.unlock()
        }
        guard !quiet, rate > 0 else { return }
        let total = PinnedModel.totalBytes
        let eta = Double(total - done) / rate
        FileHandle.standardError.write(
            String(
                format: "  %.1f/%.1f GB | %.0f MB/s | eta %dm%02ds | %d file(s) left\n",
                Double(done) / 1e9, Double(total) / 1e9, rate / 1e6,
                Int(eta) / 60, Int(eta) % 60, left).data(using: .utf8)!)
    }
}

struct Pull: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Download the model weights (parallel, resumable, hash-verified). Then: slotstream serve")

    @Argument(help: "Model to pull (only \(PinnedModel.name) exists in v0)")
    var model: String = PinnedModel.name

    @Option(name: .customLong("dir"), help: "Destination directory (default ~/.slotstream/models/\(PinnedModel.dirName))")
    var dir: String?

    @Option(name: .customLong("connections"), help: "Parallel connections (default \(PullTuning.connections))")
    var connections: Int?

    @Flag(name: .customLong("verify"), help: "Verify an existing copy against the pinned upstream hashes; download nothing")
    var verifyOnly = false

    func run() throws {
        guard model == PinnedModel.name || model == PinnedModel.dirName else {
            throw ValidationError(
                "unknown model '\(model)' — v0 ships exactly one: \(PinnedModel.name)")
        }
        let dest = dir.map { URL(fileURLWithPath: ($0 as NSString).expandingTildeInPath) }
            ?? ModelLocator.resolve(model)
        if verifyOnly {
            try Self.verify(at: dest)
            return
        }
        try Self.download(to: dest, connections: connections)
        try Self.verify(at: dest)
        print("\nready. next:  slotstream serve     (or: slotstream run --prompt \"...\")")
    }

    // MARK: verify

    static func verify(at dest: URL) throws {
        let fm = FileManager.default
        guard fm.fileExists(atPath: dest.path) else {
            throw ValidationError("nothing at \(dest.path) — run `slotstream pull` first")
        }
        print("verifying \(PinnedModel.files.count) files at \(dest.path) against "
            + "\(PinnedModel.repo) @ \(String(PinnedModel.revision.prefix(12)))")
        var failures: [String] = []
        let lock = NSLock()
        let files = PinnedModel.files
        guard files.allSatisfy({ $0.sha256 != nil }) else {
            throw ValidationError("internal manifest error: every pinned file must have a sha256")
        }
        DispatchQueue.concurrentPerform(iterations: files.count) { i in
            let f = files[i]
            // resolvingSymlinksInPath: attributesOfItem does not follow a
            // symlink, so a symlinked weight file reported the link's own size
            // and every file looked corrupt.
            let url = dest.appendingPathComponent(f.path).resolvingSymlinksInPath()
            var problem: String? = nil
            if let attrs = try? fm.attributesOfItem(atPath: url.path),
                let size = attrs[.size] as? Int64
            {
                if size != f.size {
                    problem = "size \(size) != \(f.size)"
                } else if let want = f.sha256 {
                    let got = sha256(of: url)
                    if got != want { problem = "sha256 mismatch" }
                }
            } else {
                problem = "missing"
            }
            lock.lock()
            if let p = problem {
                failures.append("\(f.path): \(p)")
                print("  FAIL  \(f.path): \(p)")
            } else {
                print("  ok    \(f.path)")
            }
            lock.unlock()
        }
        if failures.isEmpty {
            print("VERIFY PASS: all \(files.count) files match the pinned revision by sha256 "
                + String(format: "(%.1f GB)", Double(PinnedModel.totalBytes) / 1e9))
        } else {
            print("VERIFY FAIL: \(failures.count) file(s) — run `slotstream pull` to repair")
            throw ExitCode(2)
        }
    }

    /// Quiet manifest check for run/serve startup. Returning the actual files
    /// lets the caller quote an honest repair size before asking permission.
    static func invalidFiles(at dest: URL) -> [PinnedModel.File] {
        let fm = FileManager.default
        let lock = NSLock()
        var invalid: [PinnedModel.File] = []
        DispatchQueue.concurrentPerform(iterations: PinnedModel.files.count) { i in
            let f = PinnedModel.files[i]
            let url = dest.appendingPathComponent(f.path).resolvingSymlinksInPath()
            let size = (try? fm.attributesOfItem(atPath: url.path))?[.size] as? Int64
            let good = size == f.size && f.sha256.map { sha256(of: url) == $0 } == true
            if !good { lock.withLock { invalid.append(f) } }
        }
        return invalid.sorted { $0.path < $1.path }
    }

    static func sha256(of url: URL) -> String {
        guard let fh = try? FileHandle(forReadingFrom: url) else { return "" }
        defer { try? fh.close() }
        var hasher = SHA256()
        while autoreleasepool(invoking: {
            let chunk = fh.readData(ofLength: 8 << 20)
            if chunk.isEmpty { return false }
            hasher.update(data: chunk)
            return true
        }) {}
        return hasher.finalize().map { String(format: "%02x", $0) }.joined()
    }

    static func fileMatches(_ url: URL, size: Int64, sha256 expected: String?) -> Bool {
        guard let expected,
            let actualSize = (try? FileManager.default.attributesOfItem(atPath: url.path))?[.size]
                as? Int64,
            actualSize == size
        else { return false }
        return sha256(of: url) == expected
    }

    /// Validate the exact byte range a 206 response claims. Length alone is
    /// insufficient: a proxy can return the right number of wrong-position bytes.
    static func validContentRange(
        _ value: String?, start: Int64, length: Int64, total: Int64
    ) -> Bool {
        guard let value else { return false }
        let halves = value.split(separator: "/", maxSplits: 1)
        let left = halves.first?.split(separator: " ", maxSplits: 1)
        let bounds = left?.last?.split(separator: "-", maxSplits: 1)
        guard halves.count == 2, left?.first?.lowercased() == "bytes",
            bounds?.count == 2,
            let gotStart = Int64(bounds![0]), let gotEnd = Int64(bounds![1]),
            gotStart == start, gotEnd == start + length - 1,
            Int64(halves[1]) == total
        else { return false }
        return true
    }

    // MARK: chunk math

    static func chunkCount(_ size: Int64) -> Int {
        max(1, Int((size + PullTuning.chunkBytes - 1) / PullTuning.chunkBytes))
    }

    static func chunkLength(_ size: Int64, _ index: Int) -> Int64 {
        let start = Int64(index) * PullTuning.chunkBytes
        return max(0, min(PullTuning.chunkBytes, size - start))
    }

    /// Best case wall time for `bytes`, quoted at the fastest rate measured for
    /// this client: 112 MB/s over eight connections on a 1 Gbit/s datacenter
    /// link, a full install, where the port, not Hugging Face, was the limit
    /// (MEASUREMENTS.md, 2026-09-01). Anything slower is the user's link, which
    /// is why the call site labels this a floor; the progress line reports the
    /// real rate within two seconds.
    static func etaHint(_ bytes: Int64) -> String {
        let seconds = Double(bytes) / 100e6
        if seconds < 120 { return "~\(max(1, Int((seconds / 60).rounded()))) min" }
        if seconds < 3600 { return "~\(Int((seconds / 60).rounded())) min" }
        return String(format: "~%.1f h", seconds / 3600)
    }

    /// Bytes still to download at `dest` (counting chunk-map progress), by size
    /// only — hashes are verify's job. 0 means every file is present whole.
    static func remainingBytes(at dest: URL) -> Int64 {
        let fm = FileManager.default
        var remaining: Int64 = 0
        for f in PinnedModel.files {
            let final = dest.appendingPathComponent(f.path)
            let resolved = final.resolvingSymlinksInPath()
            if let size = (try? fm.attributesOfItem(atPath: resolved.path))?[.size] as? Int64,
                size == f.size { continue }
            let part = final.appendingPathExtension("part")
            let mapURL = final.appendingPathExtension("partmap")
            let n = chunkCount(f.size)
            var have: Int64 = 0
            if let d = try? Data(contentsOf: mapURL), d.count == n {
                for (i, b) in d.enumerated() where b == 1 { have += chunkLength(f.size, i) }
            } else if let ps = (try? fm.attributesOfItem(atPath: part.path))?[.size] as? Int64,
                ps < f.size
            {
                have = ps  // pre-0.1.4 sequential .part
            }
            remaining += f.size - min(have, f.size)
        }
        return remaining
    }

    // MARK: download

    static func download(to dest: URL, connections: Int? = nil) throws {
        let fm = FileManager.default
        try fm.createDirectory(at: dest, withIntermediateDirectories: true)

        let conns = max(1, min(connections ?? PullTuning.connections, 32))
        let bases = WeightSources.bases
        var lastIntegrityError: Error?
        for start in bases.indices {
            let selected = Array(bases[start...])
            let job = PullJob(dest: dest, bases: selected, connections: conns)
            let remaining = try job.plan()
            if remaining == 0 {
                try job.run()  // may still have files to hash and rename
                print("all \(PinnedModel.files.count) files already present and hash-verified")
                return
            }

            // disk check before any bytes move
            let free = (try? fm.attributesOfFileSystem(forPath: dest.path))?[
                .systemFreeSize] as? Int64 ?? 0
            let needed = remaining + 2_000_000_000
            guard free >= needed else {
                throw ValidationError(String(
                    format: "not enough disk: need %.1f GB (%.1f GB to download + 2 GB margin), have %.1f GB free at %@",
                    Double(needed) / 1e9, Double(remaining) / 1e9, Double(free) / 1e9, dest.path))
            }
            print("est. \(Self.etaHint(remaining)) at best (a 1 Gbit/s link) — a slower "
                + "link takes longer")
            print(String(
                format: "pulling %@ @ %@: %.1f GB to go over %d connections (resumable — rerun to continue)",
                PinnedModel.repo, String(PinnedModel.revision.prefix(12)),
                Double(remaining) / 1e9, conns))
            print("source: \(selected[0])")
            for b in selected.dropFirst() { print("fallback: \(b)") }
            fflush(stdout)
            do {
                try job.run()
                return
            } catch let e as PullIntegrityError {
                lastIntegrityError = e
                guard start + 1 < bases.count else { throw e }
                FileHandle.standardError.write(
                    "  \(e.localizedDescription) — retrying from the next source\n"
                        .data(using: .utf8)!)
            }
        }
        if let lastIntegrityError { throw lastIntegrityError }
    }
}

/// Weights-free regressions for integrity decisions that previously required a
/// 104 GB download to exercise.
struct PullCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "pull-check",
        abstract: "Check same-size corruption detection and HTTP range validation")

    func run() throws {
        var failures: [String] = []
        func check(_ name: String, _ condition: @autoclosure () -> Bool) {
            if condition() { print("PASS  \(name)") }
            else { print("FAIL  \(name)"); failures.append(name) }
        }
        let dir = FileManager.default.temporaryDirectory
            .appendingPathComponent("slotstream-pull-check-\(UUID().uuidString)")
        try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: dir) }
        let file = dir.appendingPathComponent("same-size")
        try Data("abc".utf8).write(to: file)
        let abc = "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"
        check("matching file is accepted", Pull.fileMatches(file, size: 3, sha256: abc))
        try Data("xyz".utf8).write(to: file)
        check("same-size corruption is rejected", !Pull.fileMatches(file, size: 3, sha256: abc))

        check("exact Content-Range is accepted", Pull.validContentRange(
            "bytes 64-127/256", start: 64, length: 64, total: 256))
        check("wrong range start is rejected", !Pull.validContentRange(
            "bytes 0-63/256", start: 64, length: 64, total: 256))
        check("wrong range total is rejected", !Pull.validContentRange(
            "bytes 64-127/999", start: 64, length: 64, total: 256))
        check("unknown range total is rejected", !Pull.validContentRange(
            "bytes 64-127/*", start: 64, length: 64, total: 256))
        check("every pinned file has a digest", PinnedModel.files.allSatisfy { $0.sha256 != nil })
        if !failures.isEmpty { throw ExitCode(2) }
        print("PULL CHECK PASS")
    }
}
