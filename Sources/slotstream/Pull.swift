// slotstream pull: download and verify the pinned model weights.
//
// Resumable (HTTP Range against a .part file), hash-verified (upstream LFS
// sha256 from the pinned revision, embedded in PinnedModel.swift so integrity
// never depends on a live API), disk-checked before any bytes move. A stranger
// runs: `slotstream pull` → `slotstream serve`.

import ArgumentParser
import CryptoKit
import Foundation

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
        "https://huggingface.co/\(PinnedModel.repo)/resolve/\(PinnedModel.revision)"
    ]
}

struct Pull: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Download the model weights (resumable, hash-verified). Then: slotstream serve")

    @Argument(help: "Model to pull (only \(PinnedModel.name) exists in v0)")
    var model: String = PinnedModel.name

    @Option(name: .customLong("dir"), help: "Destination directory (default ~/.slotstream/models/\(PinnedModel.dirName))")
    var dir: String?

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
        try Self.download(to: dest)
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
        DispatchQueue.concurrentPerform(iterations: files.count) { i in
            let f = files[i]
            let url = dest.appendingPathComponent(f.path)
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
            print("VERIFY PASS: all \(files.count) files match the pinned revision "
                + String(format: "(%.1f GB)", Double(PinnedModel.totalBytes) / 1e9))
        } else {
            print("VERIFY FAIL: \(failures.count) file(s) — run `slotstream pull` to repair")
            throw ExitCode(2)
        }
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

    /// Bytes still to download at `dest` (counting .part progress), by size
    /// only — hashes are verify's job. 0 means every file is present whole.
    static func remainingBytes(at dest: URL) -> Int64 {
        let fm = FileManager.default
        var remaining: Int64 = 0
        for f in PinnedModel.files {
            let final = dest.appendingPathComponent(f.path)
            if let size = (try? fm.attributesOfItem(atPath: final.path))?[.size] as? Int64,
                size == f.size { continue }
            let part = final.appendingPathExtension("part")
            let have = (try? fm.attributesOfItem(atPath: part.path))?[.size] as? Int64 ?? 0
            remaining += f.size - min(have, f.size)
        }
        return remaining
    }

    // MARK: download

    static func download(to dest: URL) throws {
        let fm = FileManager.default
        try fm.createDirectory(at: dest, withIntermediateDirectories: true)

        // what remains?
        var todo: [(PinnedModel.File, Int64)] = []  // (file, bytes already present in .part)
        var remaining: Int64 = 0
        for f in PinnedModel.files {
            let final = dest.appendingPathComponent(f.path)
            if let attrs = try? fm.attributesOfItem(atPath: final.path),
                (attrs[.size] as? Int64) == f.size
            {
                continue  // present with the right size; hashes checked in verify
            }
            let part = final.appendingPathExtension("part")
            let have = (try? fm.attributesOfItem(atPath: part.path))?[.size] as? Int64 ?? 0
            todo.append((f, min(have, f.size)))
            remaining += f.size - min(have, f.size)
        }
        if todo.isEmpty {
            print("all \(PinnedModel.files.count) files already present")
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
        print(String(
            format: "pulling %@ @ %@: %d file(s), %.1f GB to go (resumable — rerun to continue)",
            PinnedModel.repo, String(PinnedModel.revision.prefix(12)), todo.count,
            Double(remaining) / 1e9))
        let bases = WeightSources.bases
        print("source: \(bases[0])")
        for b in bases.dropFirst() { print("fallback: \(b)") }

        var done: Int64 = PinnedModel.totalBytes - remaining
        for (f, have) in todo {
            try downloadFile(f, to: dest, resumeFrom: have, totalDone: &done)
        }
    }

    static func downloadFile(
        _ f: PinnedModel.File, to dest: URL, resumeFrom: Int64, totalDone: inout Int64
    ) throws {
        let final = dest.appendingPathComponent(f.path)
        let part = final.appendingPathExtension("part")
        var offset = resumeFrom
        let bases = WeightSources.bases
        var lastError: Error?
        var succeeded = false
        for (i, base) in bases.enumerated() {
            var attempt = 0
            while true {
                attempt += 1
                do {
                    try fetchRange(f, base: base, into: part, from: offset, totalDone: &totalDone)
                    succeeded = true
                    break
                } catch {
                    lastError = error
                    offset = (try? FileManager.default.attributesOfItem(atPath: part.path))?[
                        .size] as? Int64 ?? 0
                    // a permanent refusal (404/403/...) means this source
                    // doesn't have the file — go straight to the next one
                    let code = (error as NSError).code
                    let permanent = (error as NSError).domain == "pull"
                        && (400 ..< 500).contains(code) && code != 429
                    if permanent || attempt >= 5 { break }
                    FileHandle.standardError.write(
                        "  retrying \(f.path) from \(offset / 1_000_000) MB (\(error.localizedDescription))\n"
                            .data(using: .utf8)!)
                    Thread.sleep(forTimeInterval: Double(attempt) * 2)
                }
            }
            if succeeded { break }
            if i + 1 < bases.count {
                FileHandle.standardError.write(
                    "  source unavailable for \(f.path) (\(lastError?.localizedDescription ?? "?")) — trying fallback: \(bases[i + 1])\n"
                        .data(using: .utf8)!)
            }
        }
        guard succeeded else {
            throw ValidationError(
                "\(f.path): download failed from all \(bases.count) source(s) (\(lastError?.localizedDescription ?? "?")) — rerun `slotstream pull` to resume")
        }
        // hash before accepting (only LFS files carry hashes)
        if let want = f.sha256 {
            let got = sha256(of: part)
            guard got == want else {
                try? FileManager.default.removeItem(at: part)
                throw ValidationError(
                    "\(f.path): sha256 mismatch after download — corrupted transfer; rerun `slotstream pull`")
            }
        }
        _ = try? FileManager.default.removeItem(at: final)
        try FileManager.default.moveItem(at: part, to: final)
    }

    /// Stream one file (from byte `from`) into `part`, appending. Throws on
    /// network errors; progress goes to stderr about once per 2 s.
    static func fetchRange(
        _ f: PinnedModel.File, base: String, into part: URL, from: Int64, totalDone: inout Int64
    ) throws {
        let fm = FileManager.default
        if !fm.fileExists(atPath: part.path) {
            fm.createFile(atPath: part.path, contents: nil)
        }
        let fh = try FileHandle(forWritingTo: part)
        defer { try? fh.close() }
        try fh.truncate(atOffset: UInt64(from))
        try fh.seekToEnd()

        let urlStr = "\(base)/\(f.path)"
        var req = URLRequest(url: URL(string: urlStr)!)
        req.timeoutInterval = 60
        if from > 0 { req.setValue("bytes=\(from)-", forHTTPHeaderField: "Range") }

        final class Sink: NSObject, URLSessionDataDelegate {
            let fh: FileHandle
            let name: String
            let fileTotal: Int64
            var fileDone: Int64
            var grandDone: Int64
            let grandTotal = PinnedModel.totalBytes
            var lastPrint = Date.distantPast
            var lastBytes: Int64
            var lastRate = 0.0
            var error: Error?
            let sem = DispatchSemaphore(value: 0)
            init(fh: FileHandle, name: String, fileTotal: Int64, start: Int64, grandStart: Int64) {
                self.fh = fh
                self.name = name
                self.fileTotal = fileTotal
                self.fileDone = start
                self.grandDone = grandStart
                self.lastBytes = start
            }
            func urlSession(
                _ s: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse,
                completionHandler: @escaping (URLSession.ResponseDisposition) -> Void
            ) {
                let code = (response as? HTTPURLResponse)?.statusCode ?? 0
                if code == 200 || code == 206 {
                    completionHandler(.allow)
                } else {
                    error = NSError(
                        domain: "pull", code: code,
                        userInfo: [NSLocalizedDescriptionKey: "HTTP \(code)"])
                    completionHandler(.cancel)
                }
            }
            func urlSession(_ s: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
                fh.write(data)
                fileDone += Int64(data.count)
                grandDone += Int64(data.count)
                let now = Date()
                if now.timeIntervalSince(lastPrint) >= 2 {
                    let dt = now.timeIntervalSince(lastPrint)
                    if lastPrint != Date.distantPast {
                        lastRate = Double(fileDone - lastBytes) / dt
                    }
                    lastPrint = now
                    lastBytes = fileDone
                    let eta = lastRate > 0 ? Double(grandTotal - grandDone) / lastRate : 0
                    FileHandle.standardError.write(String(
                        format: "  %@ %5.1f%% (%.2f/%.2f GB) | total %.1f/%.1f GB | %.0f MB/s eta %dm%02ds\n",
                        name, 100 * Double(fileDone) / Double(fileTotal), Double(fileDone) / 1e9,
                        Double(fileTotal) / 1e9, Double(grandDone) / 1e9, Double(grandTotal) / 1e9,
                        lastRate / 1e6, Int(eta) / 60, Int(eta) % 60).data(using: .utf8)!)
                }
            }
            func urlSession(_ s: URLSession, task: URLSessionTask, didCompleteWithError e: Error?) {
                if error == nil { error = e }
                sem.signal()
            }
        }

        let sink = Sink(fh: fh, name: f.path, fileTotal: f.size, start: from, grandStart: totalDone)
        let cfg = URLSessionConfiguration.ephemeral
        cfg.timeoutIntervalForResource = 7 * 24 * 3600
        let session = URLSession(configuration: cfg, delegate: sink, delegateQueue: nil)
        session.dataTask(with: req).resume()
        sink.sem.wait()
        session.finishTasksAndInvalidate()
        totalDone = sink.grandDone
        if let e = sink.error { throw e }
        let written = (try? fm.attributesOfItem(atPath: part.path))?[.size] as? Int64 ?? -1
        guard written == f.size else {
            throw NSError(
                domain: "pull", code: 1,
                userInfo: [NSLocalizedDescriptionKey: "incomplete: \(written)/\(f.size) bytes"])
        }
    }
}
