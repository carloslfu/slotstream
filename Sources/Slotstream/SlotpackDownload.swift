import Foundation
#if canImport(Glibc)
import Glibc
#else
import Darwin
#endif

/// Verified object resume is independent of transport retries. Data reaches the
/// filesystem before its resume bit; final files appear only after the pinned
/// whole-file digest passes. All fd closes happen after every writer is done.
final class SlotpackDownload: @unchecked Sendable {
    private struct Resume: Codable { let manifest: String; var done: [UInt8] }
    private final class Part {
        let index: Int
        let file: PinnedModel.File
        let url: URL
        let final: URL
        var fd: Int32
        var pending: Int
        init(index: Int, file: PinnedModel.File, url: URL, final: URL, fd: Int32, pending: Int) {
            self.index = index; self.file = file; self.url = url; self.final = final
            self.fd = fd; self.pending = pending
        }
        deinit { if fd >= 0 { close(fd) } }
    }
    let manifest: SlotpackManifest
    let manifestDigest: String
    let dest: URL
    let bases: [String]
    let rawBases: [String]
    let connections: Int
    let adaptive: Bool
    private var activeConnections: Int
    let cancellation: PullCancellation
    let log: WeightStore.Log
    let timeout: Double
    private let lock = NSLock()
    private var parts: [Int: Part] = [:]
    private var completeFiles = Set<Int>()
    private var skippedFiles = Set<Int>()
    private var resume: Resume
    private var queue: [Int] = []
    private var next = 0
    private var failure: Error?
    private var wireBytes: Int64 = 0
    private var completeBytes: Int64 = 0
    private var neededBytes: Int64 = 0
    private var rawFallbacks = 0
    private var retryCount = 0
    private var flows: [Int: String] = [:]
    private var cacheCounts: [String: Int] = [:]
    private let hashQueue = DispatchQueue(label: "slotstream.transport.hash")
    private let hashGroup = DispatchGroup()
    private var stateURL: URL { dest.appendingPathComponent(".slotpack-state.json") }

    init(manifest: SlotpackManifest, digest: String, dest: URL, bases: [String], rawBases: [String],
         connections: Int, cancellation: PullCancellation, adaptive: Bool = false, timeout: Double = 60,
         log: @escaping WeightStore.Log) {
        self.manifest = manifest; self.manifestDigest = digest; self.dest = dest
        self.bases = bases; self.rawBases = rawBases; self.connections = max(1, min(32, connections))
        self.activeConnections = max(1, min(32, connections)); self.adaptive = adaptive
        self.cancellation = cancellation; self.timeout = timeout; self.log = log
        self.resume = Resume(manifest: digest, done: Array(repeating: 0, count: manifest.objects.count))
    }

    /// Logical model bytes already represented by durable compressed resume
    /// entries. This is a progress estimate; final readiness still hashes files.
    static func resumeModelBytes(at dest: URL) -> [String: Int64] {
        guard let data = DownloadFiles.readSmall(dest.appendingPathComponent(".slotpack-state.json"), limit: 1 << 20),
            let state = try? JSONDecoder().decode(Resume.self, from: data),
            state.manifest == PinnedTransport.manifestSHA256,
            case let .success(manifest) = PinnedTransport.manifest,
            state.done.count == manifest.objects.count, state.done.allSatisfy({ $0 <= 1 })
        else { return [:] }
        var partial = Set<Int>(), whole = Set<Int>()
        for (i,file) in manifest.files.enumerated() {
            let final = dest.appendingPathComponent(file.path)
            var st = stat()
            if stat(final.path,&st) == 0, st.st_size == file.size { whole.insert(i) }
            let part = final.appendingPathExtension("slotpack.part")
            if lstat(part.path,&st) == 0, (st.st_mode & S_IFMT) == S_IFREG, st.st_nlink == 1, st.st_size == file.size { partial.insert(i) }
        }
        var have = [String: Int64]()
        for (i,object) in manifest.objects.enumerated() where state.done[i] == 1 {
            guard object.ranges.allSatisfy({ partial.contains($0.file) || whole.contains($0.file) }) else { continue }
            for range in object.ranges where partial.contains(range.file) {
                have[manifest.files[range.file].path, default: 0] += Int64(range.length)
            }
        }
        return have
    }

    func run() throws {
        try manifest.validate(files: manifest.files)
        try cancellation.check()
        try plan()
        defer { parts.removeAll() }
        let begin = ProcessInfo.processInfo.systemUptime
        let total = neededBytes
        log(String(format: "compressed pull: %.2f GB remaining, %d connections; verified chunks resume automatically", Double(total)/1e9, connections))
        let decoders = max(1, min(8, ProcessInfo.processInfo.activeProcessorCount / 2))
        let decodeQueue = OperationQueue(); decodeQueue.maxConcurrentOperationCount = decoders
        let decodeSlots = DispatchSemaphore(value: decoders * 2)
        var tuner = DownloadConcurrency(initial: connections)
        var trialStart = begin
        var trialBytes: Int64 = 0
        var trialRetries = 0
        if adaptive { log("connection tuning starts at \(connections), capped at 32; extra connections must improve throughput") }
        let progressQueue = DispatchQueue(label: "slotstream.transport.progress")
        let timer = DispatchSource.makeTimerSource(queue: progressQueue)
        var previousTime = begin
        var previousWire: Int64 = 0
        timer.schedule(deadline: .now() + 2, repeating: 2)
        timer.setEventHandler { [self] in
            let now = ProcessInfo.processInfo.systemUptime
            lock.lock(); let received = wireBytes, done = completeBytes; let finalized = completeFiles.count; lock.unlock()
            let rate = Double(received - previousWire) / max(0.001, now - previousTime)
            let goodput = Double(done) / max(0.001, now - begin)
            let enoughProgress = done >= min(total, 64 << 20) && now - begin >= 5
            let eta = enoughProgress && goodput > 0 ? String(format: "%.0f s", Double(max(0,total-done))/goodput) : "measuring"
            log(String(format: "%.1f%% verified · %.1f MB/s received · ETA %@ · %d/%d files verified", total > 0 ? 100*Double(min(done,total))/Double(total) : 100, rate/1e6, eta, finalized, manifest.files.count))
            if adaptive, now - trialStart >= 30 {
                lock.lock(); let retries = retryCount; let nearlyDone = next * 5 >= queue.count * 4; lock.unlock()
                if !nearlyDone, let target = tuner.observe(bytesPerSecond: Double(received-trialBytes)/(now-trialStart), decodeBacklog: decodeQueue.operationCount >= decoders * 2, hadRetries: retries != trialRetries) {
                    lock.lock(); activeConnections = target; lock.unlock()
                    log("download connection trial: \(target) active")
                }
                trialStart = now; trialBytes = received; trialRetries = retries
            }
            previousWire = received; previousTime = now
        }
        timer.resume()
        defer { timer.cancel(); progressQueue.sync {} }
        // Bounded decode queue overlaps download with reconstruction. At most
        // two queued buffers per decoder, plus one response per HTTP worker.
        let group = DispatchGroup()
        for worker in 0..<(adaptive ? 32 : connections) {
            group.enter()
            DispatchQueue.global(qos: .utility).async { [self] in
                defer { group.leave() }
                let http = DownloadHTTP(cancellation: cancellation, timeout: timeout, shouldStop: { [weak self] in self?.failed ?? true }, retry: { [self] in
                    lock.lock(); retryCount += 1; lock.unlock()
                }, flow: { [self] flow in
                    lock.lock(); flows[worker] = flow; lock.unlock()
                }, cache: { [self] status in
                    lock.lock(); cacheCounts[status, default: 0] += 1; lock.unlock()
                }, progress: { [self] count in
                    lock.lock(); wireBytes += count; lock.unlock()
                })
                defer { http.close() }
                while let index = take(worker: worker) {
                    // Include operation creation: NSBlockOperation is autoreleased
                    // and retains its payload even after finishing until this pool
                    // drains. A pool around decoding alone does not bound memory.
                    autoreleasepool {
                    let object = manifest.objects[index]
                    do {
                        let payload = try autoreleasepool { try fetch(object, http: http) }
                        while decodeSlots.wait(timeout: .now() + .milliseconds(100)) == .timedOut {
                            try cancellation.check()
                            if failed { return }
                        }
                        if failed || cancellation.isCancelled { decodeSlots.signal(); return }
                        decodeQueue.addOperation { [self] in
                            defer { decodeSlots.signal() }
                            do {
                                try autoreleasepool {
                                    try cancellation.check()
                                    let raw = try payload.compressed ? SlotpackManifest.decodeVerified(payload.bytes, object: object) : payload.bytes
                                    try write(raw, index: index)
                                }
                            } catch { fail(error) }
                        }
                    } catch {
                        if object.ranges.allSatisfy({ manifest.files[$0.file].optional }), !(error is DownloadCancelled) {
                            lock.lock(); skippedFiles.formUnion(object.ranges.map(\.file)); lock.unlock()
                        } else { fail(error); return }
                    }
                    }
                }
            }
        }
        group.wait()
        decodeQueue.waitUntilAllOperationsAreFinished()
        hashGroup.wait()
        try cancellation.check()
        if let failure { throw failure }
        // A failed optional file is removed only after all network/decode work
        // has drained; no descriptor can be reused underneath another writer.
        for index in skippedFiles {
            if let part = parts.removeValue(forKey: index) {
                if part.fd >= 0 { close(part.fd); part.fd = -1 }
                try? FileManager.default.removeItem(at: part.url)
            }
            let final = dest.appendingPathComponent(manifest.files[index].path)
            if FileManager.default.fileExists(atPath: final.path), !WeightStore.fileMatches(final,
                size: manifest.files[index].size, sha256: manifest.files[index].sha256) {
                try FileManager.default.removeItem(at: final)
            }
            log("optional \(manifest.files[index].path) unavailable; model runs without it")
        }
        for (i, file) in manifest.files.enumerated() where !file.optional {
            guard completeFiles.contains(i) else { throw SlotstreamError.pull("required file was not verified: \(file.path)") }
        }
        try? FileManager.default.removeItem(at: stateURL)
        if !cacheCounts.isEmpty { log("CDN responses: " + cacheCounts.keys.sorted().map { "\($0)=\(cacheCounts[$0]!)" }.joined(separator: ", ")) }
        if !flows.isEmpty { log("\(Set(flows.filter { $0.key < activeConnections }.map { $0.value }).count) TCP connections observed across the active workers") }
        log(String(format: "download verified: %.2f GB received, %d raw fallback chunks, %.1f s", Double(wireBytes)/1e9, rawFallbacks, ProcessInfo.processInfo.systemUptime-begin))
    }
    private var failed: Bool { lock.lock(); defer { lock.unlock() }; return failure != nil }
    private func fail(_ error: Error) { lock.lock(); if failure == nil { failure = error }; lock.unlock() }
    private func take(worker: Int) -> Int? {
        while true {
            lock.lock()
            guard failure == nil, !cancellation.isCancelled, next < queue.count else { lock.unlock(); return nil }
            if worker >= activeConnections { lock.unlock(); Thread.sleep(forTimeInterval: 0.1); continue }
            let index = queue[next]; next += 1
            let skipped = manifest.objects[index].ranges.contains(where: { skippedFiles.contains($0.file) })
            lock.unlock()
            if !skipped { return index }
        }
    }
    private func plan() throws {
        if let bytes = DownloadFiles.readSmall(stateURL, limit: 1 << 20),
           let old = try? JSONDecoder().decode(Resume.self, from: bytes),
           old.manifest == manifestDigest, old.done.count == manifest.objects.count,
           old.done.allSatisfy({ $0 <= 1 }) { resume = old }
        var usable = Set<Int>()
        for (i, file) in manifest.files.enumerated() {
            try cancellation.check()
            let final = dest.appendingPathComponent(file.path)
            if WeightStore.fileMatches(final, size: file.size, sha256: file.sha256) {
                completeFiles.insert(i); continue
            }
            let partURL = final.appendingPathExtension("slotpack.part")
            var st = stat()
            if lstat(partURL.path, &st) == 0, (st.st_mode & S_IFMT) == S_IFREG, st.st_size == file.size { usable.insert(i) }
        }
        for (i, object) in manifest.objects.enumerated() {
            if object.ranges.allSatisfy({ completeFiles.contains($0.file) }) { resume.done[i] = 1 }
            else if object.ranges.contains(where: { !completeFiles.contains($0.file) && !usable.contains($0.file) }) { resume.done[i] = 0 }
        }
        var neededDisk: Int64 = 0
        for (i, file) in manifest.files.enumerated() where !completeFiles.contains(i) {
            let path = dest.appendingPathComponent(file.path).appendingPathExtension("slotpack.part")
            var st = stat()
            let allocated = lstat(path.path, &st) == 0 && (st.st_mode & S_IFMT) == S_IFREG ? Int64(st.st_blocks) * 512 : 0
            neededDisk += max(0, file.size - allocated)
        }
        let margin: Int64 = 2_000_000_000
        let free = WeightStore.freeDiskBytes(near: dest)
        guard neededDisk == 0 || free >= neededDisk + margin else {
            throw SlotstreamError.pull(String(format: "not enough disk: %.1f GB required for reconstructed files plus 2 GB margin; %.1f GB free", Double(neededDisk)/1e9, Double(free)/1e9))
        }
        for (i, file) in manifest.files.enumerated() where !completeFiles.contains(i) {
            let final = dest.appendingPathComponent(file.path), partURL = final.appendingPathExtension("slotpack.part")
            let fd = open(partURL.path, O_WRONLY | O_CREAT | O_NOFOLLOW | O_NONBLOCK, 0o600)
            guard fd >= 0 else { throw SlotstreamError.pull("cannot create partial file: \(file.path)") }
            var st = stat()
            guard fstat(fd, &st) == 0, (st.st_mode & S_IFMT) == S_IFREG, st.st_nlink == 1,
                ftruncate(fd, off_t(file.size)) == 0 else { close(fd); throw SlotstreamError.pull("cannot size partial file: \(file.path)") }
            let pending = manifest.objects.indices.filter { resume.done[$0] == 0 && manifest.objects[$0].ranges.contains(where: { $0.file == i }) }.count
            parts[i] = Part(index: i, file: file, url: partURL, final: final, fd: fd, pending: pending)
        }
        for i in manifest.objects.indices where resume.done[i] == 0 {
            queue.append(i); neededBytes += Int64(manifest.objects[i].size)
        }
        try saveResume()
        for part in parts.values where part.pending == 0 { finish(part) }
    }
    private func saveResume() throws {
        let data = try JSONEncoder().encode(resume)
        try data.write(to: stateURL, options: .atomic)
        let fd = open(stateURL.path, O_RDONLY | O_NOFOLLOW)
        guard fd >= 0 else { throw SlotstreamError.pull("cannot persist download resume map") }
        defer { close(fd) }
        guard fsync(fd) == 0 else { throw SlotstreamError.pull("cannot sync download resume map") }
    }
    private func fetch(_ object: SlotpackManifest.Object, http: DownloadHTTP) throws -> (bytes: Data, compressed: Bool) {
        var last: Error = SlotstreamError.pull("no download source")
        for base in bases {
            try cancellation.check()
            guard let url = URL(string: base + "/" + object.path), ["https", "http"].contains(url.scheme) else { continue }
            do {
                let encoded = try http.fetch(url, size: object.size)
                guard SlotpackManifest.digest(encoded) == object.sha256 else { throw SlotstreamError.pull("compressed object digest mismatch") }
                return (encoded, true)
            } catch { if error is DownloadCancelled { throw error }; last = error }
        }
        // A damaged/unavailable package object can still be reconstructed from
        // pinned raw ranges, without discarding any completed compressed chunks.
        for base in rawBases {
            do {
                var data = Data(); data.reserveCapacity(object.rawSize)
                for range in object.ranges {
                    let file = manifest.files[range.file]
                    guard let url = URL(string: base + "/" + file.path) else { throw SlotstreamError.pull("invalid source URL") }
                    data.append(try http.fetch(url, size: range.length, range: (range.offset, file.size)))
                }
                guard SlotpackManifest.digest(data) == object.rawSHA256 else { throw SlotstreamError.pull("raw fallback digest mismatch") }
                lock.lock(); rawFallbacks += 1; lock.unlock()
                return (data, false)
            } catch { if error is DownloadCancelled { throw error }; last = error }
        }
        throw last
    }
    private func write(_ data: Data, index: Int) throws {
        let object = manifest.objects[index]
        var offset = 0
        for range in object.ranges {
            // Part membership never mutates while workers run; only fd/pending
            // change when their last writer has completed.
            if let part = parts[range.file] {
                try data.withUnsafeBytes { bytes in
                    var written = 0
                    while written < range.length {
                        let count = pwrite(part.fd, bytes.baseAddress!.advanced(by: offset+written), range.length-written, off_t(range.offset+Int64(written)))
                        if count < 0 && errno == EINTR { continue }
                        guard count > 0 else { throw SlotstreamError.pull("writing \(part.file.path) failed: \(String(cString: strerror(errno)))") }
                        written += count
                    }
                }
            }
            offset += range.length
        }
        lock.lock(); defer { lock.unlock() }
        let touched = Set(object.ranges.map(\.file))
        for file in touched {
            if let part = parts[file], fsync(part.fd) != 0 { throw SlotstreamError.pull("cannot sync \(part.file.path)") }
        }
        resume.done[index] = 1
        do { try saveResume() } catch { resume.done[index] = 0; throw error }
        completeBytes += Int64(object.size)
        for file in touched {
            if let part = parts[file] {
                part.pending -= 1
                if part.pending == 0 { finish(part) }
            }
        }
    }
    private func finish(_ part: Part) {
        // Called only before workers start, or under lock after its last write.
        if part.fd >= 0 { close(part.fd); part.fd = -1 }
        hashGroup.enter()
        hashQueue.async { [self] in
            defer { hashGroup.leave() }
            guard WeightStore.fileMatches(part.url, size: part.file.size, sha256: part.file.sha256) else {
                lock.lock()
                for i in manifest.objects.indices where manifest.objects[i].ranges.contains(where: { $0.file == part.index }) { resume.done[i] = 0 }
                do { try saveResume() } catch { if failure == nil { failure = error } }
                if failure == nil { failure = PullIntegrityError(file: part.file.path) }
                lock.unlock()
                return
            }
            guard rename(part.url.path, part.final.path) == 0 else { fail(SlotstreamError.pull("cannot finalize \(part.file.path)")); return }
            lock.lock(); completeFiles.insert(part.index); lock.unlock()
            log("verified \(part.file.path)")
        }
    }
}
