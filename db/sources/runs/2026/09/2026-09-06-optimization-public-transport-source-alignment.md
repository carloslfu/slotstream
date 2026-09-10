---
type: run
id: 01m1wcneveq53nxc928reats12
created: 2026-09-06T22:15:47.310904+00:00
updated: 2026-09-06T22:15:47.616546+00:00
summary: V197 exact public transport source alignment and unrun V198 shared correctness queue
binary: unbuilt shared source
captured_at: 2026-09-06
command: public e498 three-file source alignment; V198 queue syntax parse only
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: V197 exact public transport source alignment and unrun V198 shared correctness queue
tool: exact source integration and bounded queue preparation
---
V197 reconciles the optimization/context source with the transport task's qualified public runtime while installed-release acceptance is still in progress. Only DownloadHTTP.swift, PinnedTransport.swift and Version.swift are imported from the isolated release candidate. Every shared preimage and public after-image is checked before any write. Their exact bytes match public source commit e498b2d0162cefa314ba9931ebd38c3a0c47f371; transport reports the later documentation/main/tag commit f3b5a5405edd8d9419eb6de3be439fcbb2ba4d72. The v0.2.11 value is preserved from that owner-approved public release, not a new version or publication decision by this task. Public transport docs/tools/canonical brain records remain owned by the transport task for a reviewed final merge packet after its installed acceptance. No fast-forward, reset, stash, commit or publication was performed here.

All143 Source files in the shared optimization checkout and isolated context checkout now hash-identically, including V193 scope checkpoint handling, V194 live governor feasibility and V196 diagnostic-only portable entries. They will consume one common frozen build after transport explicitly returns the Mac. Source equality is not executable/build-archive identity; the single actual successor build will establish that identity.

The accompanying V198 queue is prepared but has never launched. It bounds the shared -j2 build to13GB reclaimable preflight, runs T0, context CLI, sampler/pure-governor and planner first, then real plain/MTP governors before the combined native set. It stops at the first failure without retries. The complete sequence includes ordinary/MTP integration, corrected MTP work, complete-prompt and prefix-retention plain/MTP, read failure, context serving, image reuse, ngram/cache and the V193 cold scope lifecycle. The scope case uses640slots,1024-row read groups,256compute,1280prompt and1output, with conservative20.112GB reclaimable preflight from the larger4096-scope envelope; it claims no10GB process-capacity qualification. Other native groups require13GB preflight. The work deadline is55minutes plus one cleanup minute, and incomplete queues cannot be marked passed. Driver syntax parses; this is not native execution evidence.

Performance, capacity, full acceptance, portable native variants, long scope families, P5 and default activation are outside this correctness queue. Every heavy category remains held until transport's explicit handback. The download task reports all25 original file hashes matched, but this integration record does not independently claim or duplicate its still-pending installed-release acceptance. Optimization defaults remain unchanged.


Artifact `/tmp/slotstream-optimization-execution/public-transport-v197/after/Sources/Slotstream/DownloadHTTP.swift` — 12568 bytes; SHA-256 `341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc`.

````text
// Bounded HTTP fetches shared by the compressed transport and its raw fallback.
import Foundation
import CSlotpack
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
#if canImport(Glibc)
import Glibc
#else
import Darwin
#endif

/// A host can cancel a pull without losing verified resume progress.
public final class PullCancellation: @unchecked Sendable {
    private let lock = NSLock()
    private var cancelled = false
    public init() {}
    public func cancel() { lock.lock(); cancelled = true; lock.unlock() }
    public var isCancelled: Bool { lock.lock(); defer { lock.unlock() }; return cancelled }
    func check() throws { if isCancelled { throw DownloadCancelled() } }
}
struct DownloadCancelled: Error, LocalizedError {
    var errorDescription: String? { "download cancelled; rerun to resume" }
}
struct DownloadHTTPError: Error, LocalizedError {
    let status: Int
    let retryAfter: Double?
    var errorDescription: String? {
        (200..<300).contains(status) ? "source returned an unexpected range, length, or encoding" : "download source returned HTTP \(status)"
    }
}

enum DownloadRetry {
    /// Hugging Face advertises five-minute resolver windows in RateLimit.
    /// Preserve the server's wait instead of exhausting retries before reset.
    static func delay(status: Int, retryAfter: String?, rateLimit: String?, now: Date = Date()) -> Double? {
        var delays = [Double]()
        if let value = retryAfter {
            if let seconds = Double(value), seconds.isFinite, seconds >= 0 {
                delays.append(seconds)
            } else {
                let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "en_US_POSIX")
                formatter.timeZone = TimeZone(secondsFromGMT: 0)
                formatter.dateFormat = "EEE',' dd MMM yyyy HH':'mm':'ss z"
                if let date = formatter.date(from: value) { delays.append(max(0, date.timeIntervalSince(now))) }
            }
        }
        if status == 429, let rateLimit {
            for field in rateLimit.components(separatedBy: CharacterSet(charactersIn: ";,")) {
                let field = field.trimmingCharacters(in: .whitespaces)
                if field.hasPrefix("t="), let seconds = Double(field.dropFirst(2)), seconds.isFinite, seconds >= 0 {
                    delays.append(seconds + 1) // Allow the advertised whole-second window to finish.
                }
            }
        }
        if let delay = delays.max() { return min(600, delay) }
        return status == 429 ? 300 : nil
    }
}

enum DownloadFiles {
    /// Small local control files are bounded before allocation and may not be
    /// symlinks, devices, FIFOs, or sockets. A malformed map simply loses its
    /// optimization; final model files still require their pinned digest.
    static func readSmall(_ url: URL, limit: Int) -> Data? {
        let fd = open(url.path, O_RDONLY | O_NOFOLLOW | O_NONBLOCK)
        guard fd >= 0 else { return nil }
        defer { close(fd) }
        var info = stat()
        guard fstat(fd, &info) == 0, (info.st_mode & S_IFMT) == S_IFREG,
            info.st_size >= 0, info.st_size <= limit else { return nil }
        let handle = FileHandle(fileDescriptor: fd, closeOnDealloc: false)
        guard let data = try? handle.read(upToCount: limit+1), data.count <= limit else { return nil }
        return data
    }
}

/// A synchronous public pull must release its caller's log before returning.
/// A late URLSession delegate release may keep this empty forwarder alive.
final class DownloadLog: @unchecked Sendable {
    private let lock = NSLock()
    private var sink: WeightStore.Log?
    init(_ sink: @escaping WeightStore.Log) { self.sink = sink }
    func write(_ line: String) {
        lock.lock(); defer { lock.unlock() }
        sink?(line)
    }
    func close() { lock.lock(); sink = nil; lock.unlock() }
}

final class DownloadDirectoryLock {
    private let fd: Int32
    init(_ dest: URL) throws {
        fd = open(dest.appendingPathComponent(".pull.lock").path, O_RDWR | O_CREAT | O_NOFOLLOW | O_NONBLOCK, 0o600)
        guard fd >= 0 else { throw SlotstreamError.pull("cannot open download lock") }
        var info = stat()
        guard fstat(fd, &info) == 0, (info.st_mode & S_IFMT) == S_IFREG, info.st_nlink == 1 else {
            close(fd); throw SlotstreamError.pull("download lock must be a regular file with a single link")
        }
        guard flock(fd, LOCK_EX | LOCK_NB) == 0 else {
            close(fd)
            throw SlotstreamError.pull("another download is already writing this directory")
        }
    }
    deinit { _ = flock(fd, LOCK_UN); close(fd) }
}

/// One persistent session per worker, preserving independent TCP connections.
/// Response length is bounded before and during delivery, even for a lying server.
final class DownloadHTTP: NSObject, URLSessionDataDelegate, @unchecked Sendable {
    private var session: URLSession!
    private var body = Data()
    private var failure: Error?
    private var expected = 0
    private var range: (start: Int64, total: Int64)?
    private var sem = DispatchSemaphore(value: 0)
    private let cancellation: PullCancellation
    private let progress: @Sendable (Int64) -> Void
    private let timeout: Double
    private let retry: @Sendable () -> Void
    private let shouldStop: @Sendable () -> Bool
    private let flow: @Sendable (String) -> Void
    private let cache: @Sendable (String) -> Void
    private var redirectURLs: [String: URL] = [:]
    private var requestKey = ""

    init(cancellation: PullCancellation, timeout: Double = 60, shouldStop: @escaping @Sendable () -> Bool = { false }, retry: @escaping @Sendable () -> Void = {},
         flow: @escaping @Sendable (String) -> Void = { _ in },
         cache: @escaping @Sendable (String) -> Void = { _ in },
         progress: @escaping @Sendable (Int64) -> Void = { _ in }) {
        self.cancellation = cancellation
        self.progress = progress
        self.timeout = timeout
        self.retry = retry
        self.shouldStop = shouldStop
        self.flow = flow; self.cache = cache
        super.init()
        let config = URLSessionConfiguration.ephemeral
        config.httpMaximumConnectionsPerHost = 1
        config.timeoutIntervalForRequest = timeout
        config.timeoutIntervalForResource = max(120, timeout * 20)
        config.urlCache = nil
        config.httpCookieStorage = nil
        session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }
    func close() { session.invalidateAndCancel() }

    /// Retry bounded transient failures. Signed raw-file redirects are cached only
    /// in memory and refreshed after an expired URL; their queries never reach logs.
    func fetch(_ url: URL, size: Int, range: (start: Int64, total: Int64)? = nil) throws -> Data {
        guard size > 0, size <= Int(SLOTPACK_MAX_ENCODED) else {
            throw SlotstreamError.pull("invalid HTTP transfer size")
        }
        var last: Error = SlotstreamError.pull("download failed")
        for attempt in 0..<4 {
            try cancellation.check()
            if shouldStop() { throw SlotstreamError.pull("download stopped after another chunk failed") }
            do { return try once(url, size: size, range: range) }
            catch {
                let ns = error as NSError
                last = ns.domain == NSURLErrorDomain ? SlotstreamError.pull("network transfer failed (URLSession code \(ns.code)); rerun to resume") : error
                retry()
                if error is DownloadCancelled { throw error }
                var delay = min(8.0, pow(2, Double(attempt)))
                if let response = error as? DownloadHTTPError {
                    if (200..<300).contains(response.status) {
                        if redirectURLs.removeValue(forKey: url.absoluteString) != nil { continue }
                        throw error
                    }
                    if response.status == 401 || response.status == 403 {
                        if redirectURLs.removeValue(forKey: url.absoluteString) != nil { continue }
                    }
                    if (400..<500).contains(response.status), response.status != 408,
                        response.status != 429 { throw error }
                    delay = response.retryAfter ?? delay
                }
                if attempt < 3 {
                    let until = Date().addingTimeInterval(delay)
                    while Date() < until { try cancellation.check(); if shouldStop() { throw last }; Thread.sleep(forTimeInterval: min(0.1, max(0, until.timeIntervalSinceNow))) }
                }
            }
        }
        throw last
    }
    private func once(_ url: URL, size: Int, range: (start: Int64, total: Int64)?) throws -> Data {
        body = Data(); body.reserveCapacity(size)
        defer { body = Data() }
        failure = nil; expected = size; self.range = range
        sem = DispatchSemaphore(value: 0); requestKey = url.absoluteString
        var request = URLRequest(url: range == nil ? url : (redirectURLs[requestKey] ?? url))
        request.timeoutInterval = timeout
        request.setValue("identity", forHTTPHeaderField: "Accept-Encoding")
        request.setValue("Slotstream/1 (+https://github.com/carloslfu/slotstream)", forHTTPHeaderField: "User-Agent")
        if let range {
            request.setValue("bytes=\(range.start)-\(range.start + Int64(size) - 1)", forHTTPHeaderField: "Range")
        }
        let task = session.dataTask(with: request)
        task.resume()
        while sem.wait(timeout: .now() + .milliseconds(100)) == .timedOut {
            if cancellation.isCancelled || shouldStop() { task.cancel() }
        }
        try cancellation.check()
        if let failure { throw failure }
        guard body.count == size else { throw SlotstreamError.pull("short HTTP body") }
        return body
    }
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask,
                    didReceive response: URLResponse,
                    completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        guard let http = response as? HTTPURLResponse else {
            failure = SlotstreamError.pull("non-HTTP download response"); completionHandler(.cancel); return
        }
        let status = http.statusCode
        var valid = status == 200
        if let range {
            valid = status == 206 && WeightStore.validContentRange(http.value(forHTTPHeaderField: "Content-Range"), start: range.start, length: Int64(expected), total: range.total)
            if status == 200, range.start == 0, Int64(expected) == range.total { valid = true }
        }
        let encoding = http.value(forHTTPHeaderField: "Content-Encoding")?.lowercased()
        if !valid || (encoding != nil && encoding != "identity") ||
            (response.expectedContentLength >= 0 && response.expectedContentLength != Int64(expected)) {
            let retry = DownloadRetry.delay(status: status,
                retryAfter: http.value(forHTTPHeaderField: "Retry-After"),
                rateLimit: http.value(forHTTPHeaderField: "RateLimit"))
            failure = DownloadHTTPError(status: status, retryAfter: retry)
            completionHandler(.cancel); return
        }
        if range != nil, let resolved = http.url, resolved != dataTask.originalRequest?.url {
            redirectURLs[requestKey] = resolved
        }
        if let status = http.value(forHTTPHeaderField: "CF-Cache-Status") { cache(status.uppercased()) }
        completionHandler(.allow)
    }
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        guard failure == nil else { return }
        guard data.count <= expected - body.count else {
            failure = SlotstreamError.pull("HTTP body exceeded its declared object size")
            dataTask.cancel(); return
        }
        body.append(data); progress(Int64(data.count))
    }
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if failure == nil { failure = error }
        sem.signal()
    }
    #if canImport(Darwin)
    func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
        guard let tx = metrics.transactionMetrics.last, let local = tx.localPort, let remote = tx.remoteAddress else { return }
        flow("\(remote):\(tx.remotePort ?? 0)<-\(local)")
    }
    #endif

}

````

Artifact `/tmp/slotstream-optimization-execution/public-transport-v197/after/Sources/Slotstream/PinnedTransport.swift` — 880 bytes; SHA-256 `f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87`.

````text
import Foundation

// The embedded manifest pins the exact original files and every CDN object.
enum PinnedTransport {
    static let revision = "13ec15dcebdddc817b57f0f9087c5ef82018f10e"
    static let defaults = [
        "https://huggingface.co/carloslfu/Qwen3.8-Flash-Next-MLX-4bit-Slotpack/resolve/\(revision)/slotpack/v1/\(manifestSHA256)"
    ]
    static let manifest: Result<SlotpackManifest, Error> = Result {
        try SlotpackManifest.load(Data(manifestJSON.utf8), digest: manifestSHA256, files: PinnedModel.files)
    }
    static var bases: [String] {
        if let value = ProcessInfo.processInfo.environment["SLOTSTREAM_COMPRESSED_SOURCES"] {
            let sources = value.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }.filter { !$0.isEmpty }
            if !sources.isEmpty { return sources }
        }
        return defaults
    }
}

````

Artifact `/tmp/slotstream-optimization-execution/public-transport-v197/after/Sources/Slotstream/Version.swift` — 446 bytes; SHA-256 `8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8`.

````text
// Single source of truth for the version string: the CLI's --version, the
// /api/version response, and the release tag check in CI all read this.

public enum SlotstreamBuild {
    public static let version = "0.2.11"
}

/// Model name used in error messages. The pinned manifest lives in the
/// executable target, so Core keeps its own display string.
public enum PinnedModelName {
    public static let display = "qwen3.8-flash-next:4bit"
}

````

Artifact `/tmp/slotstream-optimization-execution/public-transport-v197/before/Sources/Slotstream/DownloadHTTP.swift` — 11499 bytes; SHA-256 `3aacbda8bb579967550700d6b8e9fd075905b87f9d0dc76681d058c8cd630b00`.

````text
// Bounded HTTP fetches shared by the compressed transport and its raw fallback.
import Foundation
import CSlotpack
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
#if canImport(Glibc)
import Glibc
#else
import Darwin
#endif

/// A host can cancel a pull without losing verified resume progress.
public final class PullCancellation: @unchecked Sendable {
    private let lock = NSLock()
    private var cancelled = false
    public init() {}
    public func cancel() { lock.lock(); cancelled = true; lock.unlock() }
    public var isCancelled: Bool { lock.lock(); defer { lock.unlock() }; return cancelled }
    func check() throws { if isCancelled { throw DownloadCancelled() } }
}
struct DownloadCancelled: Error, LocalizedError {
    var errorDescription: String? { "download cancelled; rerun to resume" }
}
struct DownloadHTTPError: Error, LocalizedError {
    let status: Int
    let retryAfter: Double?
    var errorDescription: String? {
        (200..<300).contains(status) ? "source returned an unexpected range, length, or encoding" : "download source returned HTTP \(status)"
    }
}

enum DownloadFiles {
    /// Small local control files are bounded before allocation and may not be
    /// symlinks, devices, FIFOs, or sockets. A malformed map simply loses its
    /// optimization; final model files still require their pinned digest.
    static func readSmall(_ url: URL, limit: Int) -> Data? {
        let fd = open(url.path, O_RDONLY | O_NOFOLLOW | O_NONBLOCK)
        guard fd >= 0 else { return nil }
        defer { close(fd) }
        var info = stat()
        guard fstat(fd, &info) == 0, (info.st_mode & S_IFMT) == S_IFREG,
            info.st_size >= 0, info.st_size <= limit else { return nil }
        let handle = FileHandle(fileDescriptor: fd, closeOnDealloc: false)
        guard let data = try? handle.read(upToCount: limit+1), data.count <= limit else { return nil }
        return data
    }
}

/// A synchronous public pull must release its caller's log before returning.
/// A late URLSession delegate release may keep this empty forwarder alive.
final class DownloadLog: @unchecked Sendable {
    private let lock = NSLock()
    private var sink: WeightStore.Log?
    init(_ sink: @escaping WeightStore.Log) { self.sink = sink }
    func write(_ line: String) {
        lock.lock(); defer { lock.unlock() }
        sink?(line)
    }
    func close() { lock.lock(); sink = nil; lock.unlock() }
}

final class DownloadDirectoryLock {
    private let fd: Int32
    init(_ dest: URL) throws {
        fd = open(dest.appendingPathComponent(".pull.lock").path, O_RDWR | O_CREAT | O_NOFOLLOW | O_NONBLOCK, 0o600)
        guard fd >= 0 else { throw SlotstreamError.pull("cannot open download lock") }
        var info = stat()
        guard fstat(fd, &info) == 0, (info.st_mode & S_IFMT) == S_IFREG, info.st_nlink == 1 else {
            close(fd); throw SlotstreamError.pull("download lock must be a regular file with a single link")
        }
        guard flock(fd, LOCK_EX | LOCK_NB) == 0 else {
            close(fd)
            throw SlotstreamError.pull("another download is already writing this directory")
        }
    }
    deinit { _ = flock(fd, LOCK_UN); close(fd) }
}

/// One persistent session per worker, preserving independent TCP connections.
/// Response length is bounded before and during delivery, even for a lying server.
final class DownloadHTTP: NSObject, URLSessionDataDelegate, @unchecked Sendable {
    private var session: URLSession!
    private var body = Data()
    private var failure: Error?
    private var expected = 0
    private var range: (start: Int64, total: Int64)?
    private var sem = DispatchSemaphore(value: 0)
    private let cancellation: PullCancellation
    private let progress: @Sendable (Int64) -> Void
    private let timeout: Double
    private let retry: @Sendable () -> Void
    private let shouldStop: @Sendable () -> Bool
    private let flow: @Sendable (String) -> Void
    private let cache: @Sendable (String) -> Void
    private var redirectURLs: [String: URL] = [:]
    private var requestKey = ""

    init(cancellation: PullCancellation, timeout: Double = 60, shouldStop: @escaping @Sendable () -> Bool = { false }, retry: @escaping @Sendable () -> Void = {},
         flow: @escaping @Sendable (String) -> Void = { _ in },
         cache: @escaping @Sendable (String) -> Void = { _ in },
         progress: @escaping @Sendable (Int64) -> Void = { _ in }) {
        self.cancellation = cancellation
        self.progress = progress
        self.timeout = timeout
        self.retry = retry
        self.shouldStop = shouldStop
        self.flow = flow; self.cache = cache
        super.init()
        let config = URLSessionConfiguration.ephemeral
        config.httpMaximumConnectionsPerHost = 1
        config.timeoutIntervalForRequest = timeout
        config.timeoutIntervalForResource = max(120, timeout * 20)
        config.urlCache = nil
        config.httpCookieStorage = nil
        session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }
    func close() { session.invalidateAndCancel() }

    /// Retry bounded transient failures. Signed raw-file redirects are cached only
    /// in memory and refreshed after an expired URL; their queries never reach logs.
    func fetch(_ url: URL, size: Int, range: (start: Int64, total: Int64)? = nil) throws -> Data {
        guard size > 0, size <= Int(SLOTPACK_MAX_ENCODED) else {
            throw SlotstreamError.pull("invalid HTTP transfer size")
        }
        var last: Error = SlotstreamError.pull("download failed")
        for attempt in 0..<4 {
            try cancellation.check()
            if shouldStop() { throw SlotstreamError.pull("download stopped after another chunk failed") }
            do { return try once(url, size: size, range: range) }
            catch {
                let ns = error as NSError
                last = ns.domain == NSURLErrorDomain ? SlotstreamError.pull("network transfer failed (URLSession code \(ns.code)); rerun to resume") : error
                retry()
                if error is DownloadCancelled { throw error }
                var delay = min(8.0, pow(2, Double(attempt)))
                if let response = error as? DownloadHTTPError {
                    if (200..<300).contains(response.status) {
                        if redirectURLs.removeValue(forKey: url.absoluteString) != nil { continue }
                        throw error
                    }
                    if response.status == 401 || response.status == 403 {
                        if redirectURLs.removeValue(forKey: url.absoluteString) != nil { continue }
                    }
                    if (400..<500).contains(response.status), response.status != 408,
                        response.status != 429 { throw error }
                    delay = response.retryAfter ?? delay
                }
                if attempt < 3 {
                    let until = Date().addingTimeInterval(delay)
                    while Date() < until { try cancellation.check(); if shouldStop() { throw last }; Thread.sleep(forTimeInterval: min(0.1, max(0, until.timeIntervalSinceNow))) }
                }
            }
        }
        throw last
    }
    private func once(_ url: URL, size: Int, range: (start: Int64, total: Int64)?) throws -> Data {
        body = Data(); body.reserveCapacity(size)
        defer { body = Data() }
        failure = nil; expected = size; self.range = range
        sem = DispatchSemaphore(value: 0); requestKey = url.absoluteString
        var request = URLRequest(url: range == nil ? url : (redirectURLs[requestKey] ?? url))
        request.timeoutInterval = timeout
        request.setValue("identity", forHTTPHeaderField: "Accept-Encoding")
        request.setValue("Slotstream/1 (+https://github.com/carloslfu/slotstream)", forHTTPHeaderField: "User-Agent")
        if let range {
            request.setValue("bytes=\(range.start)-\(range.start + Int64(size) - 1)", forHTTPHeaderField: "Range")
        }
        let task = session.dataTask(with: request)
        task.resume()
        while sem.wait(timeout: .now() + .milliseconds(100)) == .timedOut {
            if cancellation.isCancelled || shouldStop() { task.cancel() }
        }
        try cancellation.check()
        if let failure { throw failure }
        guard body.count == size else { throw SlotstreamError.pull("short HTTP body") }
        return body
    }
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask,
                    didReceive response: URLResponse,
                    completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        guard let http = response as? HTTPURLResponse else {
            failure = SlotstreamError.pull("non-HTTP download response"); completionHandler(.cancel); return
        }
        let status = http.statusCode
        var valid = status == 200
        if let range {
            valid = status == 206 && WeightStore.validContentRange(http.value(forHTTPHeaderField: "Content-Range"), start: range.start, length: Int64(expected), total: range.total)
            if status == 200, range.start == 0, Int64(expected) == range.total { valid = true }
        }
        let encoding = http.value(forHTTPHeaderField: "Content-Encoding")?.lowercased()
        if !valid || (encoding != nil && encoding != "identity") ||
            (response.expectedContentLength >= 0 && response.expectedContentLength != Int64(expected)) {
            var retry: Double?
            if let value = http.value(forHTTPHeaderField: "Retry-After") {
                if let seconds = Double(value), seconds.isFinite { retry = min(60, max(0, seconds)) }
                else {
                    let formatter = DateFormatter(); formatter.locale = Locale(identifier: "en_US_POSIX")
                    formatter.timeZone = TimeZone(secondsFromGMT: 0); formatter.dateFormat = "EEE',' dd MMM yyyy HH':'mm':'ss z"
                    retry = formatter.date(from: value).map { min(60, max(0, $0.timeIntervalSinceNow)) }
                }
            }
            failure = DownloadHTTPError(status: status, retryAfter: retry)
            completionHandler(.cancel); return
        }
        if range != nil, let resolved = http.url, resolved != dataTask.originalRequest?.url {
            redirectURLs[requestKey] = resolved
        }
        if let status = http.value(forHTTPHeaderField: "CF-Cache-Status") { cache(status.uppercased()) }
        completionHandler(.allow)
    }
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        guard failure == nil else { return }
        guard data.count <= expected - body.count else {
            failure = SlotstreamError.pull("HTTP body exceeded its declared object size")
            dataTask.cancel(); return
        }
        body.append(data); progress(Int64(data.count))
    }
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if failure == nil { failure = error }
        sem.signal()
    }
    #if canImport(Darwin)
    func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
        guard let tx = metrics.transactionMetrics.last, let local = tx.localPort, let remote = tx.remoteAddress else { return }
        flow("\(remote):\(tx.remotePort ?? 0)<-\(local)")
    }
    #endif

}

````

Artifact `/tmp/slotstream-optimization-execution/public-transport-v197/before/Sources/Slotstream/PinnedTransport.swift` — 748 bytes; SHA-256 `83fa3acc8ebdce01f52f2574ad4e0fe6e655e48882595e6d25cdcf340a311923`.

````text
import Foundation

// The embedded manifest pins the exact original files and every CDN object.
enum PinnedTransport {
    static let defaults = [
        "https://weights.sevra.page/slotpack/v1/\(manifestSHA256)"
    ]
    static let manifest: Result<SlotpackManifest, Error> = Result {
        try SlotpackManifest.load(Data(manifestJSON.utf8), digest: manifestSHA256, files: PinnedModel.files)
    }
    static var bases: [String] {
        if let value = ProcessInfo.processInfo.environment["SLOTSTREAM_COMPRESSED_SOURCES"] {
            let sources = value.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }.filter { !$0.isEmpty }
            if !sources.isEmpty { return sources }
        }
        return defaults
    }
}

````

Artifact `/tmp/slotstream-optimization-execution/public-transport-v197/before/Sources/Slotstream/Version.swift` — 446 bytes; SHA-256 `8c7c41044630f1b97a135df88a5094e68ab7e8edb9a56490279549f1d1b59861`.

````text
// Single source of truth for the version string: the CLI's --version, the
// /api/version response, and the release tag check in CI all read this.

public enum SlotstreamBuild {
    public static let version = "0.2.10"
}

/// Model name used in error messages. The pinned manifest lives in the
/// executable target, so Core keeps its own display string.
public enum PinnedModelName {
    public static let display = "qwen3.8-flash-next:4bit"
}

````

Artifact `/tmp/slotstream-optimization-execution/public-transport-v197/fix.patch` — 4125 bytes; SHA-256 `e21a65dace24d7f4e65e440a0d83512b33a51c52fcd239513173309fdd58ff5f`.

````text
--- a/Sources/Slotstream/DownloadHTTP.swift
+++ b/Sources/Slotstream/DownloadHTTP.swift
@@ -27,6 +27,35 @@
     let retryAfter: Double?
     var errorDescription: String? {
         (200..<300).contains(status) ? "source returned an unexpected range, length, or encoding" : "download source returned HTTP \(status)"
+    }
+}
+
+enum DownloadRetry {
+    /// Hugging Face advertises five-minute resolver windows in RateLimit.
+    /// Preserve the server's wait instead of exhausting retries before reset.
+    static func delay(status: Int, retryAfter: String?, rateLimit: String?, now: Date = Date()) -> Double? {
+        var delays = [Double]()
+        if let value = retryAfter {
+            if let seconds = Double(value), seconds.isFinite, seconds >= 0 {
+                delays.append(seconds)
+            } else {
+                let formatter = DateFormatter()
+                formatter.locale = Locale(identifier: "en_US_POSIX")
+                formatter.timeZone = TimeZone(secondsFromGMT: 0)
+                formatter.dateFormat = "EEE',' dd MMM yyyy HH':'mm':'ss z"
+                if let date = formatter.date(from: value) { delays.append(max(0, date.timeIntervalSince(now))) }
+            }
+        }
+        if status == 429, let rateLimit {
+            for field in rateLimit.components(separatedBy: CharacterSet(charactersIn: ";,")) {
+                let field = field.trimmingCharacters(in: .whitespaces)
+                if field.hasPrefix("t="), let seconds = Double(field.dropFirst(2)), seconds.isFinite, seconds >= 0 {
+                    delays.append(seconds + 1) // Allow the advertised whole-second window to finish.
+                }
+            }
+        }
+        if let delay = delays.max() { return min(600, delay) }
+        return status == 429 ? 300 : nil
     }
 }
 
@@ -191,15 +220,9 @@
         let encoding = http.value(forHTTPHeaderField: "Content-Encoding")?.lowercased()
         if !valid || (encoding != nil && encoding != "identity") ||
             (response.expectedContentLength >= 0 && response.expectedContentLength != Int64(expected)) {
-            var retry: Double?
-            if let value = http.value(forHTTPHeaderField: "Retry-After") {
-                if let seconds = Double(value), seconds.isFinite { retry = min(60, max(0, seconds)) }
-                else {
-                    let formatter = DateFormatter(); formatter.locale = Locale(identifier: "en_US_POSIX")
-                    formatter.timeZone = TimeZone(secondsFromGMT: 0); formatter.dateFormat = "EEE',' dd MMM yyyy HH':'mm':'ss z"
-                    retry = formatter.date(from: value).map { min(60, max(0, $0.timeIntervalSinceNow)) }
-                }
-            }
+            let retry = DownloadRetry.delay(status: status,
+                retryAfter: http.value(forHTTPHeaderField: "Retry-After"),
+                rateLimit: http.value(forHTTPHeaderField: "RateLimit"))
             failure = DownloadHTTPError(status: status, retryAfter: retry)
             completionHandler(.cancel); return
         }
--- a/Sources/Slotstream/PinnedTransport.swift
+++ b/Sources/Slotstream/PinnedTransport.swift
@@ -2,8 +2,9 @@
 
 // The embedded manifest pins the exact original files and every CDN object.
 enum PinnedTransport {
+    static let revision = "13ec15dcebdddc817b57f0f9087c5ef82018f10e"
     static let defaults = [
-        "https://weights.sevra.page/slotpack/v1/\(manifestSHA256)"
+        "https://huggingface.co/carloslfu/Qwen3.8-Flash-Next-MLX-4bit-Slotpack/resolve/\(revision)/slotpack/v1/\(manifestSHA256)"
     ]
     static let manifest: Result<SlotpackManifest, Error> = Result {
         try SlotpackManifest.load(Data(manifestJSON.utf8), digest: manifestSHA256, files: PinnedModel.files)
--- a/Sources/Slotstream/Version.swift
+++ b/Sources/Slotstream/Version.swift
@@ -2,7 +2,7 @@
 // /api/version response, and the release tag check in CI all read this.
 
 public enum SlotstreamBuild {
-    public static let version = "0.2.10"
+    public static let version = "0.2.11"
 }
 
 /// Model name used in error messages. The pinned manifest lives in the

````

Artifact `/tmp/slotstream-optimization-execution/public-transport-v197/manifest.json` — 1193 bytes; SHA-256 `ee0590093b4a5eefcf6e47d4a937bc1cc7f1ea9c50b174414b7dead93f71a519`.

````text
{
  "applied": true,
  "files": [
    {
      "path": "Sources/Slotstream/DownloadHTTP.swift",
      "before_sha256": "3aacbda8bb579967550700d6b8e9fd075905b87f9d0dc76681d058c8cd630b00",
      "after_sha256": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc"
    },
    {
      "path": "Sources/Slotstream/PinnedTransport.swift",
      "before_sha256": "83fa3acc8ebdce01f52f2574ad4e0fe6e655e48882595e6d25cdcf340a311923",
      "after_sha256": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87"
    },
    {
      "path": "Sources/Slotstream/Version.swift",
      "before_sha256": "8c7c41044630f1b97a135df88a5094e68ab7e8edb9a56490279549f1d1b59861",
      "after_sha256": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8"
    }
  ],
  "source_commit": "e498b2d0162cefa314ba9931ebd38c3a0c47f371",
  "public_main_and_tag": "f3b5a5405edd8d9419eb6de3be439fcbb2ba4d72",
  "version": "Preserved transport owner public v0.2.11; no independent version decision or publication",
  "status": "shared source integrated unbuilt; installed acceptance retains all heavy work",
  "remaining": "Transport owner public docs/tools/brain artifact reconciliation"
}

````

Artifact `/tmp/slotstream-optimization-execution/merged-native-queue-v198.json` — 26630 bytes; SHA-256 `324a94839f8cadde5d7abe5dfa0e4670cd83a2581cfa2afa5ca32e96bf580adc`.

````text
{
  "state": "UNRUN_REQUIRES_EXPLICIT_TRANSPORT_CLEAN_HANDBACK",
  "build": {
    "output": ".build/optimization/merged-context-build-v198",
    "jobs": 2,
    "required_reclaimable_gb": 13
  },
  "reference_source_sha256": {
    "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
    "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
    "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
    "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
    "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
    "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
    "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
    "Sources/Slotstream/ContextMemory.swift": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
    "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
    "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
    "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
    "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
    "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
    "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
    "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
    "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
    "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
    "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
    "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
    "Sources/Slotstream/Layers.swift": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
    "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
    "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
    "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
    "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
    "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
    "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
    "Sources/Slotstream/Optimizations.swift": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
    "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
    "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
    "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/Plan.swift": "a25367b73877f2148d362be6fa5c396937bdac2bbea4a306963022ac3264af3b",
    "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
    "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
    "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
    "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
    "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
    "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "ecd2aa75aa09b6cde14a46bb27e91bf76dd13f77f25e409178c1669adf94810b",
    "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
    "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
    "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
    "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
    "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
    "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
    "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
    "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
    "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
    "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
    "Sources/Slotstream/Weights.swift": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
    "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
    "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
    "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
    "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "48ec4e1c4e1e24666d1833ee2019eda081f67db200b6a59169b735fec767c3fa",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "874e749a4d3663df07a12bbbca237b49ccce2d667c14c4d0285cca3dcc666747",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
    "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
    "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
    "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "d12a1d66c39d62cc773ba81ce1bf8ba88b82b096ad2f060398a39acfcf65b63c",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
    "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
    "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
    "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
    "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
    "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
    "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
    "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
    "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
    "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
    "Sources/slotstream-cli/MTPCommands.swift": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
    "Sources/slotstream-cli/OptimizationCommands.swift": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
    "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
    "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
    "Sources/slotstream-cli/main.swift": "20e42483d78cd4bf92102435557301667c694ef9c4fd98463971b008f64ab820"
  },
  "native": [
    {
      "name": "governor-boundary",
      "command": [
        "optimization-state-check",
        "--variant",
        "governor-boundary",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 600,
      "environment": {
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1"
      },
      "purpose": "Final shared source correctness; excludes latency/capacity qualification"
    },
    {
      "name": "governor-boundary-mtp",
      "command": [
        "optimization-state-check",
        "--variant",
        "governor-boundary-mtp",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 600,
      "environment": {
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1"
      },
      "purpose": "Final shared source correctness; excludes latency/capacity qualification"
    },
    {
      "name": "integrated",
      "command": [
        "optimization-state-check",
        "--variant",
        "integrated",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "Final shared source correctness; excludes latency/capacity qualification"
    },
    {
      "name": "integrated-mtp",
      "command": [
        "optimization-state-check",
        "--variant",
        "integrated-mtp",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "Final shared source correctness; excludes latency/capacity qualification"
    },
    {
      "name": "mtp-work-integrated",
      "command": [
        "optimization-state-check",
        "--variant",
        "mtp-work-integrated",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "Final shared source correctness; excludes latency/capacity qualification"
    },
    {
      "name": "complete-prompt",
      "command": [
        "optimization-state-check",
        "--variant",
        "complete-prompt",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "Final shared source correctness; excludes latency/capacity qualification"
    },
    {
      "name": "complete-prompt-mtp",
      "command": [
        "optimization-state-check",
        "--variant",
        "complete-prompt-mtp",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "Final shared source correctness; excludes latency/capacity qualification"
    },
    {
      "name": "prefix-retention",
      "command": [
        "optimization-state-check",
        "--variant",
        "prefix-retention",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "Final shared source correctness; excludes latency/capacity qualification"
    },
    {
      "name": "prefix-retention-mtp",
      "command": [
        "optimization-state-check",
        "--variant",
        "prefix-retention-mtp",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "Final shared source correctness; excludes latency/capacity qualification"
    },
    {
      "name": "read-failure-serving",
      "command": [
        "optimization-state-check",
        "--variant",
        "read-failure-serving",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "Final shared source correctness; excludes latency/capacity qualification"
    },
    {
      "name": "context-serving",
      "command": [
        "optimization-state-check",
        "--variant",
        "context-serving",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "Final shared source correctness; excludes latency/capacity qualification"
    },
    {
      "name": "image-reuse",
      "command": [
        "optimization-state-check",
        "--variant",
        "image-reuse",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "Final shared source correctness; excludes latency/capacity qualification"
    },
    {
      "name": "ngram",
      "command": [
        "optimization-state-check",
        "--variant",
        "ngram",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "Final shared source correctness; excludes latency/capacity qualification"
    },
    {
      "name": "cache-bookkeeping",
      "command": [
        "optimization-state-check",
        "--variant",
        "cache-bookkeeping",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "Final shared source correctness; excludes latency/capacity qualification"
    },
    {
      "name": "scope-integrated-lifecycle",
      "command": [
        "optimization-state-check",
        "--variant",
        "scope-integrated-lifecycle",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 20.112,
      "timeout_seconds": 1800,
      "environment": {},
      "purpose": "V193 cold checkpoint/divergent followup plus existing cancellation;640slots,1024read groups,256compute,1280prompt,1output. Conservative full4096scope envelope preflight; correctness only, no10GB capacity claim."
    }
  ],
  "stop_on_failure": true,
  "implicit_retries": false,
  "performance_authorization": false,
  "tool_sha256": {
    "Tools/optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "Tools/serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "Tools/context_gates.py": "3c735af4c0db4946eff5ef7240859b705ac6e3931a535ec49b7db7ce30954b76",
    "Tools/sampler_gates.sh": "f0f8ee0caf3ab5494895a3511bfb634ad59c2e68871602dff9db56a9f0f86c4e",
    "Tools/sampler_ref.py": "faa87e6db26853b275322d18cab1994430315e19783b984ac28e1cdaf34395c3",
    "Tools/planner_gates.sh": "ded911c355af3502f1df27387653d8381da9697150b7560880f1e9e3acd14e40"
  },
  "excludes": [
    "performance/capacity",
    "full acceptance",
    "portable native gates",
    "scope family2051/4096",
    "scope MTP/vision",
    "P5 qualification",
    "public/default activation"
  ],
  "predecessors": "V193 failure, V194 live feasibility, V196 portable diagnostic plumbing and V197 exact public e498 runtime files; V195 tool binding has no native effect",
  "return_to_context": "Same frozen binary for remaining full diagnostics, clients and P5; do not rebuild unchanged source"
}

````

Artifact `/tmp/slotstream-optimization-execution/run_merged_native_v198.py` — 8613 bytes; SHA-256 `03fbd1d7b8ea560ae7b5e910b942266d0f97e6102f359412a33c89fa8d644701`.

````text
"""One explicit clean-handback correctness batch; never benchmarks."""
import hashlib, json, os, signal, subprocess, sys, time
from pathlib import Path

ROOT=Path('/Users/carlos/Projects/slotstream')
sys.path.insert(0,str(ROOT/'Tools'))
from optimization_build import build
from prefill_bench import digest, preflight, run_child, terminate_child_tree, vm_snapshot
from serve_bench import verified_build

QUEUE=Path('/tmp/slotstream-optimization-execution/merged-native-queue-v198.json')
spec=json.loads(QUEUE.read_text())
OUT=ROOT/'.build/optimization/merged-native-v198'
started=time.monotonic()
# Fifty-five minutes of work plus one minute for cleanup/return.
deadline=started+3300
summary={'classification':'Final shared source correctness after explicit clean handback; no timing/capacity claim',
         'queue_sha256':digest(QUEUE),'batch_wall_limit_seconds':3360,'rows':[], 'passed':False}

def remaining(): return deadline-time.monotonic()
def interrupted(signum, frame): raise KeyboardInterrupt(f'signal {signum}')
signal.signal(signal.SIGTERM,interrupted)
signal.signal(signal.SIGINT,interrupted)

def bounded_build_run(command, **kwargs):
    child=subprocess.Popen(command, start_new_session=True, **kwargs)
    try:
        code=child.wait(timeout=max(1,min(420,remaining()-20)))
        return subprocess.CompletedProcess(command,code)
    finally:
        if child.poll() is None: terminate_child_tree(child)

def save():
    summary['elapsed_seconds']=time.monotonic()-started
    (OUT/'manifest.json').write_text(json.dumps(summary,indent=2)+'\n')

def cli_checks(binary):
    if remaining() < 260: raise TimeoutError('not enough batch time for bounded CLI refusal checks')
    out=OUT/'context-cli';out.mkdir()
    env={k:v for k,v in os.environ.items() if not k.startswith('SLOTSTREAM_')}
    command=['python3',str(ROOT/'Tools/context_gates.py'),'--binary',str(binary),'--report',str(out/'report.json')]
    row={'name':'context-cli','command':command,'passed':False,'classification':'metadata and pre-allocation refusals only'}
    summary['rows'].append(row)
    begin=time.monotonic()
    try:
        print(json.dumps({'phase':'starting','name':'context-cli'}),flush=True)
        row['exit_code']=run_child(command,env,out,240)
        report=json.loads((out/'report.json').read_text())
        row['assertions']=len(report['assertions'])
        row['passed']=row['exit_code']==0 and report['passed'] is True and row['assertions']>0 and all(x['passed'] is True for x in report['assertions'])
    finally:
        row['duration_seconds']=time.monotonic()-begin
        (out/'manifest.json').write_text(json.dumps(row,indent=2)+'\n');save()
        print(json.dumps(row),flush=True)
    if not row['passed']: raise RuntimeError('context CLI refusal/reporting checks failed')

def shell_checks(binary, name, script):
    if remaining() < 260: raise TimeoutError('not enough batch time for shell correctness checks')
    out=OUT/name;out.mkdir()
    env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
    env.update(BIN=str(binary),SLOTSTREAM_TEST_BINARY=str(binary),PYTHON=str(ROOT/'.venv31/bin/python'))
    row={'name':name,'command':['bash',str(ROOT/script)],'passed':False,'classification':'provider-free sampler/planner/governor policy correctness','identity':verified_build(binary)['identity']}
    summary['rows'].append(row);begin=time.monotonic()
    try:
        print(json.dumps({'phase':'starting','name':name}),flush=True)
        row['exit_code']=run_child(row['command'],env,out,240)
        output=(out/'stdout.txt').read_text()
        import re
        matches=re.findall(r'^(?:planner|sampler \+ governor): passed (\d+), failed (\d+)$',output,re.M)
        row['assertions']=int(matches[0][0]) if len(matches)==1 else 0
        row['passed']=row['exit_code']==0 and len(matches)==1 and row['assertions']>0 and matches[0][1]=='0' and not re.search(r'^FAIL',output,re.M)
    finally:
        row['duration_seconds']=time.monotonic()-begin
        for file in ['stdout.txt','stderr.txt']:
            if (out/file).exists():row[file+'_sha256']=digest(out/file)
        (out/'manifest.json').write_text(json.dumps(row,indent=2)+'\n');save()
        print(json.dumps({k:row[k] for k in ['name','passed','assertions','duration_seconds']}),flush=True)
    if not row['passed']:raise RuntimeError(f'{name} failed; stopping the batch')

def native(binary, name, command, extra_env, ceiling=900, catalogue=False, required_gb=13):
    if remaining()<min(ceiling + 20, 300): return False
    verified_build(binary)
    out=OUT/name;out.mkdir()
    env={k:v for k,v in os.environ.items() if not k.startswith('SLOTSTREAM_')}
    env.update(extra_env)
    row={'name':name,'binary':str(binary),'identity':verified_build(binary)['identity'],
         'command':[str(binary.parent/'slotstream-checks' if catalogue else binary),*command],
         'environment':extra_env,'passed':False,'required_reclaimable_gb':required_gb,
         'classification':summary['classification']}
    summary['rows'].append(row)
    begin=time.monotonic()
    try:
        row['before']=preflight(required_gb)
        row['timeout_seconds']=int(min(ceiling,remaining()-20))
        print(json.dumps({'phase':'starting','name':name,'timeout_seconds':row['timeout_seconds']}),flush=True)
        row['exit_code']=run_child(row['command'],env,out,row['timeout_seconds'])
        report=json.loads((out/'stdout.txt').read_text())
        if catalogue:
            checks=report.get('checks',[])
            row['checks_sha256']=digest(binary.parent/'slotstream-checks')
            row['groups']=len(checks)
            row['assertions']=sum(len(c.get('items',[])) for c in checks)
            row['passed']=(row['exit_code']==0 and len(checks)>0 and report.get('failed')==0
                and report.get('skipped')==0 and report.get('passed')==len(checks)
                and all(c.get('passed') is True for c in checks))
        else:
            row['assertions']=len(report.get('items',[]))
            row['passed']=(row['exit_code']==0 and report.get('passed') is True
                and not report.get('skipped') and row['assertions']>0
                and all(c.get('passed') is True for c in report['items']))
    except BaseException as error:
        row['error']=f'{type(error).__name__}: {error}'
        if isinstance(error,KeyboardInterrupt): raise
    finally:
        row['after']=vm_snapshot();row['duration_seconds']=time.monotonic()-begin
        for file in ['stdout.txt','stderr.txt']:
            if (out/file).exists():row[file+'_sha256']=digest(out/file)
        (out/'manifest.json').write_text(json.dumps(row,indent=2)+'\n')
        save()
        print(json.dumps({k:row[k] for k in ['name','passed','assertions','duration_seconds','error'] if k in row}),flush=True)
    if not row['passed']: raise RuntimeError(f'{name} failed; stopping the batch')
    return True

OUT.mkdir(exist_ok=False)
try:
    actual={str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest()
        for p in sorted((ROOT/'Sources').rglob('*')) if p.is_file()}
    if actual!=spec['reference_source_sha256']:raise ValueError('source changed since the reviewed queue')
    if {name:digest(ROOT/name) for name in spec['tool_sha256']}!=spec['tool_sha256']: raise ValueError('driver changed since reviewed queue')
    receipt=build(ROOT,ROOT/spec['build']['output'],jobs=2,required_gb=13,run=bounded_build_run)
    summary['build']=receipt
    if not receipt['passed']:raise RuntimeError('shared build failed; no native test launched')
    binary=ROOT/spec['build']['output']/'candidate/slotstream'
    if not native(binary,'t0',['--tier','t0','--json'],{},ceiling=60,catalogue=True):
        raise TimeoutError('batch deadline reached before T0')
    cli_checks(binary)
    shell_checks(binary,'sampler-governor','Tools/sampler_gates.sh')
    shell_checks(binary,'planner','Tools/planner_gates.sh')
    for row in spec['native']:
        if not native(binary,row['name'],row['command'],row['environment'],row['timeout_seconds'],required_gb=row['required_reclaimable_gb']):
            summary['stopped_at_batch_boundary']=True
            break
    summary['complete_queue']=len(summary['rows'])==len(spec['native'])+4
    summary['passed']=summary['complete_queue'] and all(r['passed'] for r in summary['rows'])
except BaseException as error:
    summary['error']=f'{type(error).__name__}: {error}'
finally:
    save()
print(json.dumps({k:v for k,v in summary.items() if k not in ('rows','build')}),flush=True)
raise SystemExit(0 if summary['passed'] else 1)

````
