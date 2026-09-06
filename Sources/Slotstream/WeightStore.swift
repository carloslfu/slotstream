// WeightStore: the 105.3 GB of weights as an addressable thing — where they
// are, whether they are complete and sound, and how to fetch them.
//
// All of this used to sit inside the `pull` subcommand, so nothing but the
// binary could ask whether a model was present, and a host app had no way to
// find out before trying to load one. The download engine itself is
// WeightDownload.swift; this is the surface over it.
//
// Nothing here prints. `verify` and `download` take a log sink so the CLI can
// render exactly what it always has, and a host app gets silence by default.

import Foundation
#if canImport(CryptoKit)
import CryptoKit
#else
import Crypto
#endif

/// Whether the weights are usable, and what it would take to make them so.
public enum WeightStatus: Sendable, Equatable {
    /// Every required file is present at the pinned size and digest.
    case ready
    /// Nothing downloaded yet.
    case missing(needBytes: Int64, freeDiskBytes: Int64)
    /// A partial download; `remainingBytes` counts chunk-map progress.
    case incomplete(remainingBytes: Int64, freeDiskBytes: Int64)
    /// Present at the right size but the wrong bytes — the case size alone
    /// cannot see, and the reason startup hashes before loading.
    case corrupt(paths: [String], repairBytes: Int64, freeDiskBytes: Int64)

    public var isReady: Bool { self == .ready }

    /// Free disk where the weights land, when the status knows it. A host that
    /// cannot see this will start a 105 GB pull that cannot finish.
    public var freeDiskBytes: Int64? {
        switch self {
        case .ready: return nil
        case let .missing(_, free), let .incomplete(_, free): return free
        case let .corrupt(_, _, free): return free
        }
    }

    /// Bytes that still have to be fetched, zero when ready.
    public var bytesToFetch: Int64 {
        switch self {
        case .ready: return 0
        case let .missing(need, _), let .incomplete(need, _): return need
        case let .corrupt(_, repair, _): return repair
        }
    }
}

public enum WeightTransport: String, Sendable { case automatic, compressed, raw }

/// How to fetch. Defaults match the flags and the environment the CLI reads.
public struct PullOptions: Sendable {
    /// Raw-file bases. Setting these selects the raw path in automatic mode;
    /// nil uses the compressed CDN, with pinned raw mirrors as fallback.
    public var sources: [String]?
    /// TCP connections, each its own URLSession. Capped at 32.
    public var connections: Int?
    public var transport: WeightTransport
    public var cancellation: PullCancellation?

    public init(sources: [String]? = nil, connections: Int? = nil) {
        self.init(sources: sources, connections: connections, transport: .automatic)
    }

    public init(sources: [String]? = nil, connections: Int? = nil, transport: WeightTransport, cancellation: PullCancellation? = nil) {
        self.sources = sources
        self.connections = connections
        self.transport = transport
        self.cancellation = cancellation
    }

    public init(sources: [String]? = nil, connections: Int? = nil, cancellation: PullCancellation?) {
        self.init(sources: sources, connections: connections, transport: .automatic, cancellation: cancellation)
    }
}

public struct WeightStore: Sendable {
    /// A line of human-readable progress. The library never decides where it goes.
    public typealias Log = @Sendable (String) -> Void

    /// The directory the weights live in.
    public let modelDirectory: URL

    public init(modelDirectory: URL) {
        self.modelDirectory = modelDirectory
    }

    /// `~/.slotstream/models/<pinned dir>`, or the dev checkout's copy when
    /// there is one. Honours $HOME.
    public static var `default`: WeightStore {
        WeightStore(modelDirectory: ModelLocator.resolve(PinnedModel.name))
    }

    /// The store for whatever `--model` named: a path, or the pinned name.
    public static func resolving(_ spec: String) -> WeightStore {
        WeightStore(modelDirectory: ModelLocator.resolve(spec))
    }

    /// Whether this copy can be loaded, and what it would cost to fix it.
    ///
    /// Size alone cannot tell a good file from same-size corruption, so a
    /// complete-looking copy is hashed before it is called ready. That takes
    /// seconds and is the reason a damaged tokenizer never reaches the engine.
    public func status() -> WeightStatus {
        let free = Self.freeDiskBytes(near: modelDirectory)
        let remaining = Self.remainingBytes(at: modelDirectory)
        if remaining > 0 {
            let have = PinnedModel.requiredBytes - remaining
            return have > 0
                ? .incomplete(remainingBytes: remaining, freeDiskBytes: free)
                : .missing(needBytes: remaining, freeDiskBytes: free)
        }
        let bad = Self.invalidFiles(at: modelDirectory)
        if bad.isEmpty { return .ready }
        return .corrupt(
            paths: bad.map(\.path), repairBytes: bad.reduce(0) { $0 + $1.size },
            freeDiskBytes: free)
    }

    /// Free bytes on the volume the weights land on, walking up to the nearest
    /// directory that exists.
    public static func freeDiskBytes(near url: URL) -> Int64 {
        let fm = FileManager.default
        var probe = url
        while !fm.fileExists(atPath: probe.path), probe.path != "/" {
            probe.deleteLastPathComponent()
        }
        return (try? fm.attributesOfFileSystem(forPath: probe.path))?[.systemFreeSize]
            as? Int64 ?? 0
    }

    /// Re-hash this copy against the pinned digests.
    public func verify(log: Log = { _ in }) throws {
        try Self.verify(at: modelDirectory, log: log)
    }

    /// Fetch what is missing. Resumable: rerunning continues an interrupted
    /// pull from its chunk map.
    public func download(_ options: PullOptions = .init(), log: Log = { _ in }) throws {
        try Self.download(
            to: modelDirectory, connections: options.connections, sources: options.sources,
            transport: options.transport, cancellation: options.cancellation, log: log)
    }

    // MARK: verify

    public static func verify(at dest: URL, log: Log = { _ in }) throws {
        let fm = FileManager.default
        guard fm.fileExists(atPath: dest.path) else {
            throw SlotstreamError.pull("nothing at \(dest.path) — run `slotstream pull` first")
        }
        log("verifying \(PinnedModel.files.count) files at \(dest.path) against "
            + "\(PinnedModel.repo) @ \(String(PinnedModel.revision.prefix(12)))")
        var failures: [String] = []
        var absent: [String] = []  // optional files not downloaded
        let lock = NSLock()
        let files = PinnedModel.files
        guard files.allSatisfy({ $0.sha256 != nil }) else {
            throw SlotstreamError.pull("internal manifest error: every pinned file must have a sha256")
        }
        DispatchQueue.concurrentPerform(iterations: files.count) { i in
            let f = files[i]
            // resolvingSymlinksInPath: attributesOfItem does not follow a
            // symlink, so a symlinked weight file reported the link's own size
            // and every file looked corrupt.
            let url = dest.appendingPathComponent(f.path).resolvingSymlinksInPath()
            var problem: String? = nil
            var absentOptional = false
            if let attrs = try? fm.attributesOfItem(atPath: url.path),
                let size = attrs[.size] as? Int64
            {
                if size != f.size {
                    problem = "size \(size) != \(f.size)"
                } else if let want = f.sha256 {
                    let got = sha256(of: url)
                    if got != want { problem = "sha256 mismatch" }
                }
            } else if f.optional {
                absentOptional = true
            } else {
                problem = "missing"
            }
            lock.lock()
            if let p = problem {
                failures.append("\(f.path): \(p)")
                log("  FAIL  \(f.path): \(p)")
            } else if absentOptional {
                absent.append(f.path)
                log("  skip  \(f.path) (optional, not downloaded; `slotstream pull` fetches it)")
            } else {
                log("  ok    \(f.path)")
            }
            lock.unlock()
        }
        if failures.isEmpty {
            let present = files.filter { !absent.contains($0.path) }
            let bytes = present.reduce(Int64(0)) { $0 + $1.size }
            log("VERIFY PASS: \(absent.isEmpty ? "all " : "")\(present.count) files match the pinned revision by sha256 "
                + String(format: "(%.1f GB)", Double(bytes) / 1e9)
                + (absent.isEmpty ? "" : "; optional not downloaded: \(absent.joined(separator: ", "))"))
        } else {
            log("VERIFY FAIL: \(failures.count) file(s) — run `slotstream pull` to repair")
            throw SlotstreamError.weightsCorrupt(failures)
        }
    }

    /// Quiet manifest check for run/serve startup. Returning the actual files
    /// lets the caller quote an honest repair size before asking permission.
    public static func invalidFiles(at dest: URL) -> [PinnedModel.File] {
        let fm = FileManager.default
        let lock = NSLock()
        var invalid: [PinnedModel.File] = []
        DispatchQueue.concurrentPerform(iterations: PinnedModel.files.count) { i in
            let f = PinnedModel.files[i]
            let url = dest.appendingPathComponent(f.path).resolvingSymlinksInPath()
            let size = (try? fm.attributesOfItem(atPath: url.path))?[.size] as? Int64
            if size == nil && f.optional { return }  // absent optional file: nothing to repair
            let good = size == f.size && f.sha256.map { sha256(of: url) == $0 } == true
            if !good { lock.withLock { invalid.append(f) } }
        }
        return invalid.sorted { $0.path < $1.path }
    }

    public static func sha256(of url: URL) -> String {
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

    public static func fileMatches(_ url: URL, size: Int64, sha256 expected: String?) -> Bool {
        let target = url.resolvingSymlinksInPath()
        guard let expected,
            let actualSize = (try? FileManager.default.attributesOfItem(atPath: target.path))?[.size]
                as? Int64,
            actualSize == size
        else { return false }
        return sha256(of: target) == expected
    }

    /// Validate the exact byte range a 206 response claims. Length alone is
    /// insufficient: a proxy can return the right number of wrong-position bytes.
    public static func validContentRange(
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

    public static func chunkCount(_ size: Int64) -> Int {
        max(1, Int((size + PullTuning.chunkBytes - 1) / PullTuning.chunkBytes))
    }

    public static func chunkLength(_ size: Int64, _ index: Int) -> Int64 {
        let start = Int64(index) * PullTuning.chunkBytes
        return max(0, min(PullTuning.chunkBytes, size - start))
    }

    /// A reference estimate at 100 MB/s. Actual rate depends on the link,
    /// route, source, storage, and concurrent load; this is not a source ceiling.
    public static func etaHint(_ bytes: Int64) -> String {
        let seconds = Double(bytes) / 100e6
        if seconds < 120 { return "~\(max(1, Int((seconds / 60).rounded()))) min" }
        if seconds < 3600 { return "~\(Int((seconds / 60).rounded())) min" }
        return String(format: "~%.1f h", seconds / 3600)
    }

    /// Bytes still to download at `dest` (counting chunk-map progress), by size
    /// only — hashes are verify's job. 0 means every file is present whole.
    public static func remainingBytes(at dest: URL) -> Int64 {
        let fm = FileManager.default
        var remaining: Int64 = 0
        let compressedHave = SlotpackDownload.resumeModelBytes(at: dest)
        for f in PinnedModel.files {
            let final = dest.appendingPathComponent(f.path)
            if f.optional && !fm.fileExists(atPath: final.path) { continue }
            let resolved = final.resolvingSymlinksInPath()
            if let size = (try? fm.attributesOfItem(atPath: resolved.path))?[.size] as? Int64,
                size == f.size { continue }
            let part = final.appendingPathExtension("part")
            let mapURL = final.appendingPathExtension("partmap")
            let n = chunkCount(f.size)
            var have: Int64 = compressedHave[f.path, default: 0]
            if let ps = (try? fm.attributesOfItem(atPath: part.path))?[.size] as? Int64, ps == f.size,
                let d = DownloadFiles.readSmall(mapURL, limit: n), d.count == n, d.allSatisfy({ $0 <= 1 }) {
                let rawHave = d.enumerated().reduce(Int64(0)) { total, row in total + (row.element == 1 ? chunkLength(f.size,row.offset) : 0) }
                have = max(have, rawHave)
            } else if let ps = (try? fm.attributesOfItem(atPath: part.path))?[.size] as? Int64,
                ps < f.size
            {
                have = max(have, ps)  // pre-0.1.4 sequential .part
            }
            remaining += f.size - min(have, f.size)
        }
        return remaining
    }

    // MARK: download

    /// Preserve the original call and function-reference signature.
    public static func download(
        to dest: URL, connections: Int? = nil, sources: [String]? = nil,
        log: Log = { _ in }
    ) throws {
        try download(to: dest, connections: connections, sources: sources, transport: .automatic, log: log)
    }

    public static func download(
        to dest: URL, connections: Int? = nil, sources: [String]? = nil,
        transport: WeightTransport, cancellation: PullCancellation? = nil,
        log: Log = { _ in }
    ) throws {
        // The public operation is synchronous. Session invalidation may release
        // its delegate later, so detach the caller's nonescaping sink before
        // returning even if a drained worker is temporarily retained by Foundation.
        try withoutActuallyEscaping(log) { sink in
            let forwarding = DownloadLog(sink)
            defer { forwarding.close() }
            try downloadImpl(to: dest, connections: connections, sources: sources,
                transport: transport, cancellation: cancellation, log: { forwarding.write($0) })
        }
    }

    private static func downloadImpl(
        to dest: URL, connections: Int?, sources: [String]?,
        transport: WeightTransport, cancellation: PullCancellation?,
        log: @escaping Log
    ) throws {
        let fm = FileManager.default
        try fm.createDirectory(at: dest, withIntermediateDirectories: true)
        let lease = try DownloadDirectoryLock(dest)
        defer { withExtendedLifetime(lease) {} }
        let cancellation = cancellation ?? PullCancellation()
        try cancellation.check()

        let conns = max(1, min(connections ?? PullTuning.connections, 32))
        let bases = sources ?? WeightSources.bases
        guard !bases.isEmpty else { throw SlotstreamError.pull("no download sources configured") }
        let env = ProcessInfo.processInfo.environment
        let selected = transport == .automatic ? WeightTransport(rawValue: env["SLOTSTREAM_PULL_TRANSPORT"] ?? "automatic") ?? .automatic : transport
        let legacyResume = PinnedModel.files.contains { file in
            fm.fileExists(atPath: dest.appendingPathComponent(file.path).appendingPathExtension("part").path)
        }
        let rawOverride = sources != nil || env["SLOTSTREAM_WEIGHTS_SOURCES"]?.isEmpty == false
        let compressed = selected == .compressed || (selected == .automatic && !rawOverride && !legacyResume)
        if compressed, !PinnedTransport.manifestJSON.isEmpty {
            let manifest = try PinnedTransport.manifest.get()
            for repair in 0...1 {
                let job = SlotpackDownload(manifest: manifest, digest: PinnedTransport.manifestSHA256,
                    dest: dest, bases: PinnedTransport.bases, rawBases: bases, connections: conns,
                    cancellation: cancellation, adaptive: connections == nil && env["SLOTSTREAM_PULL_CONNECTIONS"] == nil, log: log)
                do { try job.run(); return }
                catch is PullIntegrityError where repair == 0 {
                    log("partial file failed its final hash; repairing its chunks once")
                }
            }
        } else if selected == .compressed {
            throw SlotstreamError.pull("this build does not contain a qualified compressed package")
        }
        if legacyResume, selected == .automatic { log("continuing the existing raw download; new installs use compressed chunks") }
        var lastIntegrityError: Error?
        for start in bases.indices {
            let selected = Array(bases[start...])
            let job = PullJob(dest: dest, bases: selected, connections: conns, cancellation: cancellation, log: log)
            defer { job.shutdown() }
            let remaining = try job.plan()
            if remaining == 0 {
                try job.run()  // may still have files to hash and rename
                log("all \(PinnedModel.files.count) files already present and hash-verified")
                return
            }

            // disk check before any bytes move
            let free = (try? fm.attributesOfFileSystem(forPath: dest.path))?[
                .systemFreeSize] as? Int64 ?? 0
            let needed = remaining + 2_000_000_000
            guard free >= needed else {
                throw SlotstreamError.pull(String(
                    format: "not enough disk: need %.1f GB (%.1f GB to download + 2 GB margin), have %.1f GB free at %@",
                    Double(needed) / 1e9, Double(remaining) / 1e9, Double(free) / 1e9, dest.path))
            }
            log("reference estimate: \(WeightStore.etaHint(remaining)) at 100 MB/s; actual progress is measured")
            log(String(
                format: "pulling %@ @ %@: %.1f GB to go over %d connections (resumable — rerun to continue)",
                PinnedModel.repo, String(PinnedModel.revision.prefix(12)),
                Double(remaining) / 1e9, conns))
            log("source: \(WeightSources.display(selected[0]))")
            for b in selected.dropFirst() { log("fallback: \(WeightSources.display(b))") }
            do {
                try job.run()
                return
            } catch let e as PullIntegrityError {
                lastIntegrityError = e
                guard start + 1 < bases.count else { throw e }
                log("\(e.localizedDescription) — retrying from the next source")
            }
        }
        if let lastIntegrityError { throw lastIntegrityError }
    }
}
