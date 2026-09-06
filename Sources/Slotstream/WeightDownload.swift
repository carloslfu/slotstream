// Weight download: the engine behind `slotstream pull`.
//
// Parallel (64 MB chunks from every file share one work queue, so every
// connection stays busy to the last byte), resumable (an on-disk chunk map
// per file, so resume is exact even though chunks land out of order),
// hash-verified (upstream LFS sha256 from the pinned revision, embedded in
// PinnedModel.swift so integrity never depends on a live API), disk-checked
// before any bytes move. A stranger runs: `slotstream pull` → `slotstream serve`.

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

struct PullIntegrityError: Error, LocalizedError {
    let file: String
    var errorDescription: String? {
        "\(file): sha256 mismatch after download — the source returned bytes "
            + "that do not match the pinned revision"
    }
}

public enum ModelLocator {
    /// Respect $HOME when set (redirecting 104 GB of weights is a real use
    /// case); Foundation's homeDirectoryForCurrentUser ignores it.
    public static var home: URL {
        if let h = ProcessInfo.processInfo.environment["HOME"], !h.isEmpty {
            return URL(fileURLWithPath: h)
        }
        return FileManager.default.homeDirectoryForCurrentUser
    }
    public static var userModelsDir: URL {
        home.appendingPathComponent(".slotstream/models")
    }
    public static var repoLocalDir: URL {
        URL(fileURLWithPath: #filePath)  // Sources/Slotstream/WeightDownload.swift
            .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
            .appendingPathComponent("models/\(PinnedModel.dirName)")
    }

    /// Resolve a --model value: an existing path wins; the pinned model name
    /// resolves to the dev checkout copy if present, else ~/.slotstream/models.
    public static func resolve(_ spec: String) -> URL {
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
public enum WeightSources {
    /// Ordered download bases; `<base>/<file path>` must serve the file.
    /// Override with SLOTSTREAM_WEIGHTS_SOURCES (comma-separated bases,
    /// tried in order), e.g. a private mirror or a local cache.
    public static var bases: [String] {
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
    /// Content-addressed compressed object hosts used for new downloads.
    public static var compressedBases: [String] { PinnedTransport.bases }
    static func display(_ source: String) -> String {
        guard var url = URLComponents(string: source) else { return "configured source" }
        url.user = nil; url.password = nil; url.query = nil; url.fragment = nil
        return url.string ?? "configured source"
    }
    public static let defaults = [
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
public enum PullTuning {
    public static let chunkBytes: Int64 = 64 << 20
    public static var connections: Int {
        if let s = ProcessInfo.processInfo.environment["SLOTSTREAM_PULL_CONNECTIONS"],
            let n = Int(s), n > 0
        {
            return min(n, 32)
        }
        return 8
    }
}

/// One unit of work: bytes [start, start+length) of one file.
struct Chunk {
    let file: Int  // index into PinnedModel.files
    let index: Int  // chunk number within that file
    let start: Int64
    let length: Int64
}

/// A file being downloaded: an fd on its .part plus the chunk map that makes
/// resume exact when chunks land out of order.
final class PartFile {
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
final class ChunkState {
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
final class PullJob: NSObject, URLSessionDataDelegate {
    let dest: URL
    let files: [PinnedModel.File]
    let bases: [String]
    let connections: Int
    let log: WeightStore.Log
    let cancellation: PullCancellation
    private var wireBytes: Int64 = 0
    private let flushLock = NSLock()

    private var parts: [Int: PartFile] = [:]
    private var queue: [Chunk] = []
    private var nextChunk = 0
    private var live: [Int: ChunkState] = [:]

    private let lock = NSLock()
    private var failure: Error?
    private var hashFailure: Error?
    private var filesLeft = 0
    /// Optional files no source carried (indices into PinnedModel.files).
    private var skipped = Set<Int>()
    private var skippedBytes: Int64 = 0

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

    init(dest: URL, bases: [String], connections: Int, files: [PinnedModel.File] = PinnedModel.files, cancellation: PullCancellation = .init(), log: @escaping WeightStore.Log = { _ in }) {
        self.dest = dest
        self.files = files
        self.bases = bases
        self.connections = connections
        self.cancellation = cancellation
        self.log = log
        super.init()
        for _ in 0 ..< connections {
            let cfg = URLSessionConfiguration.ephemeral
            cfg.timeoutIntervalForRequest = 60
            cfg.timeoutIntervalForResource = 7 * 24 * 3600
            cfg.httpMaximumConnectionsPerHost = 1
            sessions.append(URLSession(configuration: cfg, delegate: self, delegateQueue: nil))
        }
    }

    /// Also closes sessions and descriptors when planning/disk checks fail.
    func shutdown() {
        sessions.forEach { $0.invalidateAndCancel() }
        hashGroup.wait()
        for part in parts.values {
            part.ioLock.lock()
            if part.fd >= 0 { close(part.fd); part.fd = -1 }
            part.ioLock.unlock()
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
        for (i, f) in files.enumerated() {
            try cancellation.check()
            let finalURL = dest.appendingPathComponent(f.path)
            let resolvedFinal = finalURL.resolvingSymlinksInPath()
            if WeightStore.fileMatches(resolvedFinal, size: f.size, sha256: f.sha256) {
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
            let n = WeightStore.chunkCount(f.size)
            var map = [UInt8](repeating: 0, count: n)
            var partStat = stat()
            let regularPart = lstat(part.path, &partStat) == 0 && (partStat.st_mode & S_IFMT) == S_IFREG
            if regularPart, partStat.st_size == f.size, let d = DownloadFiles.readSmall(mapURL, limit: n), d.count == n, d.allSatisfy({ $0 <= 1 }) {
                map = [UInt8](d)
            } else if regularPart, let ps = (try? fm.attributesOfItem(atPath: part.path))?[.size] as? Int64,
                ps > 0, ps < f.size
            {
                // pre-0.1.4 .part files were a strict sequential append, so
                // whole chunks below the high-water mark are already good.
                for c in 0 ..< Int(ps / PullTuning.chunkBytes) { map[c] = 1 }
            }
            let fd = open(part.path, O_WRONLY | O_CREAT | O_NOFOLLOW | O_NONBLOCK, 0o644)
            guard fd >= 0 else {
                throw SlotstreamError.pull(
                    "cannot open \(part.path): \(String(cString: strerror(errno)))")
            }
            var openedStat = stat()
            guard fstat(fd, &openedStat) == 0, (openedStat.st_mode & S_IFMT) == S_IFREG, openedStat.st_nlink == 1, ftruncate(fd, off_t(f.size)) == 0 else {
                close(fd)
                throw SlotstreamError.pull(
                    "cannot size \(part.path): \(String(cString: strerror(errno)))")
            }
            var pending = 0
            for c in 0 ..< n where map[c] == 0 {
                let start = Int64(c) * PullTuning.chunkBytes
                let len = WeightStore.chunkLength(f.size, c)
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
        grandDone = files.reduce(0) { $0 + $1.size } - remaining
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
        let timerQueue = DispatchQueue(label: "slotstream.pull.progress")
        let timer = DispatchSource.makeTimerSource(queue: timerQueue)
        timer.schedule(deadline: .now() + 2, repeating: 2)
        timer.setEventHandler { [weak self] in self?.flushMaps(force: false) }
        timer.resume()
        defer { timer.cancel(); timerQueue.sync {} }
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
        for index in skipped {
            if let pf = parts[index] {
                try? FileManager.default.removeItem(at: pf.part)
                try? FileManager.default.removeItem(at: pf.mapURL)
            }
        }
        parts.removeAll()
        let err = failure ?? hashFailure
        lock.unlock()
        try cancellation.check()
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
                    if error is DownloadCancelled { return }
                    lastError = error
                    let ns = error as NSError
                    let permanent =
                        ns.domain == "pull-protocol" || (ns.domain == "pull" && (400 ..< 500).contains(ns.code) && ns.code != 408 && ns.code != 429)
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
                    let until = Date().addingTimeInterval(Double(attempt) * 2)
                    while Date() < until && !cancellation.isCancelled { Thread.sleep(forTimeInterval: 0.1) }
                    if cancellation.isCancelled { return }
                }
            }
            if ok {
                completeChunk(chunk)
            } else if !recordFailure(chunk, lastError) {
                return
            }
        }
    }

    private func nextWork() -> Chunk? {
        lock.lock()
        defer { lock.unlock() }
        while !cancellation.isCancelled, failure == nil, hashFailure == nil, nextChunk < queue.count {
            let c = queue[nextChunk]
            nextChunk += 1
            if skipped.contains(c.file) { continue }  // an optional file no source carries
            return c
        }
        return nil
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
        let advanced = pf.sourceIdx == i
        if advanced { pf.sourceIdx += 1 }
        let next = pf.sourceIdx
        let name = pf.file.path
        lock.unlock()
        guard next < bases.count else { return false }
        // Every worker on this file lands here; only the first to notice says so.
        if advanced {
            log("\(name): source failed — trying next source")
        }
        return true
    }

    /// Every source failed for this chunk. A required file fails the pull; an
    /// optional one (the MTP draft head) is dropped: its part files go, its
    /// remaining chunks are skipped, and the pull stays green with a notice.
    /// Returns false when the worker should stop.
    private func recordFailure(_ chunk: Chunk, _ error: Error?) -> Bool {
        let f = files[chunk.file]
        lock.lock()
        if f.optional {
            let firstTime = !skipped.contains(chunk.file)
            skipped.insert(chunk.file)
            // Keep descriptors alive until every in-flight writer has drained.
            if firstTime, let pf = parts[chunk.file] {
                filesLeft -= 1
                skippedBytes += pf.file.size
            }
            lock.unlock()
            if firstTime {
                log("skip \(f.path): unavailable from every source; optional")
            }
            return true
        }
        if failure == nil {
            failure = SlotstreamError.pull(
                "\(f.path): download failed from all "
                    + "\(bases.count) source(s) (\(error?.localizedDescription ?? "?")) — "
                    + "rerun `slotstream pull` to resume")
        }
        lock.unlock()
        return false
    }

    // MARK: one chunk

    private func fetch(_ chunk: Chunk, base: String, session: URLSession) throws {
        try cancellation.check()
        let f = files[chunk.file]
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
        while state.sem.wait(timeout: .now() + .milliseconds(100)) == .timedOut {
            if cancellation.isCancelled { task.cancel() }
        }
        lock.lock()
        live.removeValue(forKey: rid)
        lock.unlock()

        try cancellation.check()
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
            st.chunk.start == 0 && st.chunk.length == files[st.chunk.file].size
        let validRange = code == 206 && WeightStore.validContentRange(
            http?.value(forHTTPHeaderField: "Content-Range"),
            start: st.chunk.start, length: st.chunk.length,
            total: files[st.chunk.file].size)
        let encoding = http?.value(forHTTPHeaderField: "Content-Encoding")?.lowercased()
        let lengthValid = response.expectedContentLength < 0 || response.expectedContentLength == st.chunk.length
        if (validRange || (code == 200 && wholeFile)) && lengthValid && (encoding == nil || encoding == "identity") {
            completionHandler(.allow)
        } else {
            // 200 for a partial range means the server ignored Range; accepting
            // it would write the whole file into one chunk slot.
            st.error = NSError(
                domain: (code == 200 || code == 206) ? "pull-protocol" : "pull", code: code,
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
                if w < 0 && errno == EINTR { continue }
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
        log(line)
    }
    #endif

    // MARK: bookkeeping

    private func completeChunk(_ chunk: Chunk) {
        var finished: PartFile?
        lock.lock()
        if !skipped.contains(chunk.file), let pf = parts[chunk.file] {
            grandDone += chunk.length
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
    }

    /// Hash and rename on a background queue so verification of a finished file
    /// overlaps the download of the next one.
    private func finishFile(_ pf: PartFile, alreadyClosed: Bool) {
        if !alreadyClosed {
            var syncFailed = false
            pf.ioLock.lock()
            if pf.fd >= 0 {
                syncFailed = fsync(pf.fd) != 0
                close(pf.fd)
                pf.fd = -1
            }
            pf.ioLock.unlock()
            if syncFailed {
                lock.lock()
                if failure == nil { failure = SlotstreamError.pull("cannot sync \(pf.file.path)") }
                lock.unlock()
                return
            }
        }
        hashGroup.enter()
        hashQueue.async { [self] in
            defer { hashGroup.leave() }
            let fm = FileManager.default
            do {
                if let want = pf.file.sha256 {
                    let got = WeightStore.sha256(of: pf.part)
                    guard got == want else {
                        try? fm.removeItem(at: pf.part)
                        try? fm.removeItem(at: pf.mapURL)
                        throw PullIntegrityError(file: pf.file.path)
                    }
                }
                guard rename(pf.part.path, pf.finalURL.path) == 0 else {
                    throw SlotstreamError.pull("cannot finalize \(pf.file.path)")
                }
                try? fm.removeItem(at: pf.mapURL)
                lock.lock()
                filesLeft -= 1
                lock.unlock()
                log("verified \(pf.file.path)")
            } catch {
                lock.lock()
                if hashFailure == nil { hashFailure = error }
                lock.unlock()
            }
        }
    }

    private func noteProgress(_ bytes: Int64) {
        lock.lock()
        wireBytes += bytes
        lock.unlock()
    }

    /// Every 2 s: flush the chunk maps (after fsyncing the data they claim, so
    /// a map never promises bytes that are not on disk) and print one line.
    private func flushMaps(force: Bool) {
        flushLock.lock(); defer { flushLock.unlock() }
        lock.lock()
        let now = Date()
        guard force || now.timeIntervalSince(lastPrint) >= 2 else {
            lock.unlock()
            return
        }
        let elapsed = now.timeIntervalSince(startTime)
        if elapsed > 0 { rate = Double(wireBytes) / elapsed }
        lastPrint = now
        var snapshots: [(PartFile, [UInt8])] = []
        for pf in parts.values where pf.dirty {
            pf.dirty = false
            snapshots.append((pf, pf.chunkDone))
        }
        let total = files.reduce(0) { $0 + $1.size } - skippedBytes
        let done = min(grandDone, total)
        let goodput = elapsed > 0 ? Double(max(0, grandDone - startBytes)) / elapsed : 0
        let left = filesLeft
        let quiet = force
        lock.unlock()

        for (pf, map) in snapshots {
            pf.ioLock.lock()
            // Skip a file that finished (and had its map removed) since the
            // snapshot was taken; rewriting its map would leave an orphan.
            if pf.fd >= 0 {
                do {
                    guard fsync(pf.fd) == 0 else { throw SlotstreamError.pull("cannot sync download data") }
                    try Data(map).write(to: pf.mapURL, options: .atomic)
                } catch {
                    pf.ioLock.unlock()
                    lock.lock(); if failure == nil { failure = error }; lock.unlock()
                    continue
                }
            }
            pf.ioLock.unlock()
        }
        guard !quiet, rate > 0 else { return }
        let eta = goodput > 0 && elapsed >= 5 && done - startBytes >= min(total - startBytes, 64 << 20) ? String(format: "%.0f s", Double(max(0,total-done))/goodput) : "measuring"
        log(String(format: "%.1f/%.1f GB verified chunks | %.1f MB/s received | ETA %@ | %d file(s) left",
            Double(done)/1e9, Double(total)/1e9, rate/1e6, eta, left))
    }
}
