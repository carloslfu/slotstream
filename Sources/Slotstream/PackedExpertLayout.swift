import CryptoKit
import Darwin
import Foundation

/// An optional, derived pool-read layout. The original tensor layout remains
/// the sweep path. Construction and loading are explicit, bounded operations.
/// The complete payload is verified at load, then an owned descriptor and
/// pre/post-read file stamps detect ordinary file replacement/mutation. This
/// is not an adversarial immutability guarantee or a per-read bit-rot check.
package final class PackedExpertLayout {
    package struct Stamp: Codable, Equatable {
        let device: Int32
        let inode: UInt64
        let size: Int64
        let modifiedSeconds: Int
        let modifiedNanos: Int
        let changedSeconds: Int
        let changedNanos: Int
        let links: UInt16
        package init(fd: Int32) throws {
            var s = stat()
            guard fstat(fd, &s) == 0, (s.st_mode & S_IFMT) == S_IFREG else {
                throw ModelError("packed layout needs a readable regular file")
            }
            device = s.st_dev; inode = s.st_ino; size = s.st_size
            modifiedSeconds = s.st_mtimespec.tv_sec; modifiedNanos = s.st_mtimespec.tv_nsec
            changedSeconds = s.st_ctimespec.tv_sec; changedNanos = s.st_ctimespec.tv_nsec
            links = s.st_nlink
        }
    }
    package struct Manifest: Codable {
        var version = 1
        var layout = "slotstream-pool-layer-expert-piece-v1"
        var modelIdentity: String
        var layers: Int
        var experts: Int
        var pieces: [Int]
        var layerSHA256: [String]
    }
    private let fd: Int32
    private let stamp: Stamp
    package let manifest: Manifest
    package let recordBytes: Int
    package let verifiedBytes: Int
    package let verificationSeconds: Double
    package var readFault: ReadFault?
    package var beforeReadCommit: (() throws -> Void)?
    deinit { close(fd) }

    private static func geometry(_ m: Manifest) throws -> (record: Int, layer: Int, total: Int) {
        guard m.version == 1, m.layout == "slotstream-pool-layer-expert-piece-v1",
            (1...256).contains(m.layers), (1...512).contains(m.experts),
            m.pieces.count == 9, m.pieces.allSatisfy({ $0 > 0 && $0 <= 16 << 20 }),
            m.modelIdentity.count == 64, m.layerSHA256.count == m.layers,
            m.layerSHA256.allSatisfy({ $0.count == 64 && $0.allSatisfy({ "0123456789abcdef".contains($0) }) })
        else { throw ModelError("unsupported packed expert layout identity or geometry") }
        let record = m.pieces.reduce(0,+)
        let layer = record.multipliedReportingOverflow(by: m.experts)
        let total = layer.partialValue.multipliedReportingOverflow(by: m.layers)
        guard !layer.overflow, !total.overflow else { throw CheckpointReadError.invalidRange }
        return (record,layer.partialValue,total.partialValue)
    }
    package static func openRead(_ url: URL) throws -> Int32 {
        let fd = open(url.path, O_RDONLY | O_NOFOLLOW | O_CLOEXEC)
        guard fd >= 0 else { throw ModelError("cannot open packed-layout input \(url.lastPathComponent): \(String(cString: strerror(errno)))") }
        guard fcntl(fd, F_NOCACHE, 1) == 0, fcntl(fd, F_RDAHEAD, 0) == 0 else {
            close(fd); throw ModelError("cannot configure packed-layout uncached I/O")
        }
        return fd
    }
    package static func read(_ fd: Int32, into p: UnsafeMutableRawPointer, offset: Int, count: Int) throws {
        try ExactRead.transfer(into: p, offset: offset, count: count) { dst, n, pos in
            let rc = Darwin.pread(fd,dst,n,off_t(pos))
            return .init(count: rc, error: rc < 0 ? errno : 0)
        }
    }
    private static func hash(_ fd: Int32, offset: Int, count: Int) throws -> String {
        var buffer = [UInt8](repeating: 0, count: min(count,1 << 20))
        var hash = SHA256(); var done = 0
        try buffer.withUnsafeMutableBytes { raw in
            while done < count {
                let n = min(raw.count,count-done)
                try read(fd,into: raw.baseAddress!,offset: offset+done,count: n)
                hash.update(bufferPointer: UnsafeRawBufferPointer(start: raw.baseAddress, count: n))
                done += n
            }
        }
        return hash.finalize().map { String(format: "%02x",$0) }.joined()
    }
    package static func hex(_ data: Data) -> String {
        SHA256.hash(data: data).map { String(format: "%02x",$0) }.joined()
    }
    package init(directory: URL, identity: String, layers: Int, experts: Int, pieces: [Int],
        afterVerification: (() throws -> Void)? = nil) throws {
        let start = ProcessInfo.processInfo.systemUptime
        let metaFD = try Self.openRead(directory.appendingPathComponent("manifest.json"))
        defer { close(metaFD) }
        let metaStamp = try Stamp(fd: metaFD)
        guard metaStamp.size > 0, metaStamp.size <= 1 << 20 else { throw ModelError("packed manifest exceeds its bound") }
        var data = Data(count: Int(metaStamp.size))
        try data.withUnsafeMutableBytes { try Self.read(metaFD,into: $0.baseAddress!,offset: 0,count: $0.count) }
        let m = try JSONDecoder().decode(Manifest.self,from: data)
        let g = try Self.geometry(m)
        guard m.modelIdentity == identity, m.layers == layers, m.experts == experts, m.pieces == pieces else {
            throw ModelError("packed layout does not match this checkpoint, quantization or tensor order")
        }
        let opened = try Self.openRead(directory.appendingPathComponent("experts.bin"))
        var transferred = false
        defer { if !transferred { close(opened) } }
        let original = try Stamp(fd: opened)
        guard original.size == g.total else { throw ModelError("packed expert payload has the wrong length") }
        let failure = JoinedReadFailure()
        // Four 1 MiB hash buffers; no model/GPU allocation or full-file mapping.
        let lanes = min(4,m.layers)
        DispatchQueue.concurrentPerform(iterations: lanes) { lane in
            for layer in stride(from: lane,to: m.layers,by: lanes) {
                do {
                    guard try Self.hash(opened,offset: layer*g.layer,count: g.layer) == m.layerSHA256[layer] else {
                        throw ModelError("packed expert payload checksum mismatch at layer \(layer)")
                    }
                } catch { failure.record(error) }
            }
        }
        try failure.finish()
        try afterVerification?()
        guard try Stamp(fd: opened) == original, try Stamp(fd: metaFD) == metaStamp else {
            throw ModelError("packed layout changed during verification")
        }
        fd = opened; stamp = original; manifest = m; recordBytes = g.record; verifiedBytes = g.total
        verificationSeconds = ProcessInfo.processInfo.systemUptime-start
        transferred = true
    }
    package func checkUnchanged() throws {
        guard try Stamp(fd: fd) == stamp else { throw ModelError("packed expert payload changed after verification") }
    }
    /// Caller owns all output columns and discards them if any worker fails.
    /// Every worker joins before scratch is released or the error propagates.
    package func readBatch(_ keys: [ExpertKey], buffers: [UnsafeMutableRawPointer], queueDepth: Int) throws {
        guard !keys.isEmpty, buffers.count == 9,
            keys.allSatisfy({ (0..<manifest.layers).contains($0.layer) && (0..<manifest.experts).contains($0.expert) })
        else { throw CheckpointReadError.invalidRange }
        try checkUnchanged()
        let failure = JoinedReadFailure(); let lanes = min(max(queueDepth,1),keys.count)
        DispatchQueue.concurrentPerform(iterations: lanes) { lane in
            var scratch: UnsafeMutableRawPointer?
            let rc = posix_memalign(&scratch,16384,recordBytes)
            guard rc == 0, let scratch else {
                failure.record(ModelError("out of memory staging packed expert record")); return
            }
            defer { free(scratch) }
            for row in stride(from: lane,to: keys.count,by: lanes) {
                do {
                    try readFault?.beforeRead()
                    let key = keys[row]
                    try Self.read(fd,into: scratch,offset: (key.layer*manifest.experts+key.expert)*recordBytes,count: recordBytes)
                    var offset = 0
                    for (piece,bytes) in manifest.pieces.enumerated() {
                        memcpy(buffers[piece]+row*bytes,scratch+offset,bytes); offset += bytes
                    }
                } catch { failure.record(error) }
            }
        }
        try failure.finish()
        try beforeReadCommit?()
        try checkUnchanged()
    }
    /// The reader is a bounded seam for construction tests; production reads
    /// only the indexed original tensor spans. Faults run before publication.
    package static func build(directory: URL, identity: String, layers: Int, experts: Int, pieces: [Int],
        sourceUnchanged: () throws -> Void,
        reader: (Int,Int,Int,UnsafeMutableRawPointer) throws -> Void,
        fault: ((String,Int) throws -> Void)? = nil) throws -> Manifest {
        var m = Manifest(modelIdentity: identity,layers: layers,experts: experts,pieces: pieces,
            layerSHA256: Array(repeating: String(repeating:"0",count:64),count:layers))
        let g = try geometry(m)
        let fm = FileManager.default
        guard !fm.fileExists(atPath: directory.path) else { throw ModelError("packed layout destination already exists") }
        let parent = directory.deletingLastPathComponent()
        let temp = parent.appendingPathComponent(".slotstream-pack-\(UUID().uuidString)",isDirectory:true)
        try fm.createDirectory(at: temp,withIntermediateDirectories:false,attributes:[.posixPermissions:0o700])
        defer { try? fm.removeItem(at: temp) }
        let output = temp.appendingPathComponent("experts.bin")
        let out = open(output.path,O_CREAT | O_EXCL | O_RDWR | O_CLOEXEC,0o600)
        guard out >= 0 else { throw ModelError("cannot create packed expert payload") }
        defer { close(out) }
        guard fcntl(out,F_NOCACHE,1) == 0, ftruncate(out,off_t(g.total)) == 0 else {
            throw ModelError("cannot allocate packed expert payload")
        }
        try sourceUnchanged()
        let failure = JoinedReadFailure(); let resultLock = NSLock()
        let lanes = min(layers,4)
        DispatchQueue.concurrentPerform(iterations: lanes) { lane in
            var data = Data(count:g.record)
            for layer in stride(from:lane,to:layers,by:lanes) {
                do {
                    var hasher = SHA256()
                    for expert in 0..<experts {
                        try data.withUnsafeMutableBytes { raw in
                            var offset = 0
                            for (piece,bytes) in pieces.enumerated() {
                                try reader(layer,expert,piece,raw.baseAddress!+offset); offset += bytes
                            }
                            hasher.update(bufferPointer:UnsafeRawBufferPointer(raw))
                            var done = 0; let position = (layer*experts+expert)*g.record
                            while done < raw.count {
                                let n = pwrite(out,raw.baseAddress!+done,raw.count-done,off_t(position+done))
                                if n < 0 && errno == EINTR { continue }
                                guard n > 0, n <= raw.count-done else { throw ModelError("packed expert write failed: \(String(cString:strerror(errno)))") }
                                done += n
                            }
                        }
                        try fault?("write",layer*experts+expert)
                    }
                    let digest = hasher.finalize().map { String(format:"%02x",$0) }.joined()
                    resultLock.withLock { m.layerSHA256[layer] = digest }
                } catch { failure.record(error) }
            }
        }
        try failure.finish()
        guard fsync(out) == 0 else { throw ModelError("cannot sync packed expert payload") }
        let encoder = JSONEncoder(); encoder.outputFormatting = [.sortedKeys,.prettyPrinted]
        let metadata = try encoder.encode(m)
        let metaURL = temp.appendingPathComponent("manifest.json")
        try metadata.write(to:metaURL,options:.withoutOverwriting)
        let meta = open(metaURL.path,O_RDONLY | O_NOFOLLOW | O_CLOEXEC)
        guard meta >= 0 else { throw ModelError("cannot open packed manifest for sync") }
        defer { close(meta) }
        guard fsync(meta) == 0 else { throw ModelError("cannot sync packed manifest") }
        // Verify stored bytes independently of the buffers sent to pwrite.
        _ = try PackedExpertLayout(directory:temp,identity:identity,layers:layers,experts:experts,pieces:pieces)
        try sourceUnchanged()
        try fault?("publish",layers*experts)
        let tempFD = open(temp.path,O_RDONLY | O_CLOEXEC)
        guard tempFD >= 0 else { throw ModelError("cannot open packed temporary directory") }
        defer { close(tempFD) }
        guard fsync(tempFD) == 0 else { throw ModelError("cannot sync packed temporary directory") }
        guard renamex_np(temp.path,directory.path,UInt32(RENAME_EXCL)) == 0 else {
            throw ModelError("cannot publish packed layout without replacing an existing destination")
        }
        let parentFD = open(parent.path,O_RDONLY | O_CLOEXEC)
        guard parentFD >= 0 else { throw ModelError("cannot open packed layout parent directory") }
        defer { close(parentFD) }
        guard fsync(parentFD) == 0 else { throw ModelError("packed layout is published but parent sync failed") }
        return m
    }
}
