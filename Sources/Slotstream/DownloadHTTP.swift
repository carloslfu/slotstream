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
