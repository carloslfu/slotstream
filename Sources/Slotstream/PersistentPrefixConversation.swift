import Foundation
import Darwin

extension PersistentPrefixCache {
    /// Attach exact generated ids to an existing aligned checkpoint. Only
    /// Transcript extension lookup reads these ids; restore still uses `entry.tokens`.
    /// This preserves omitted reasoning across restarts without saving an
    /// unaligned recurrent state or allowing it to resume as a checkpoint.
    @discardableResult
    package func rememberConversation(tokens: [Int]) -> Bool {
        guard !tokens.isEmpty, tokens.count <= ContextPolicy.modelLimit,
              tokens.allSatisfy({ $0 >= 0 && $0 <= Int(Int32.max) }) else { return false }
        return operations.withLock {
            let now = Self.now()
            guard var entry = lock.withLock({
                heads.filter { $0.identity == identity.digest && tokens.starts(with: $0.tokens)
                    && !PersistentPrefixPolicy.isExpired($0, now: now, maxAge: configuration.maxAge) }
                    .max { $0.tokens.count < $1.tokens.count }
            }) else { return false }
            if entry.splicingTokens == tokens { return true }
            let source = path(entry.file)
            let temporary = path(".\(entry.file).\(UUID().uuidString).tmp")
            defer { unlink(temporary) }
            do {
                let original = open(source, O_RDONLY | O_CLOEXEC)
                guard original >= 0 else { throw PersistentPrefixFileError("cannot open conversation checkpoint") }
                defer { close(original) }
                let (data, payloadEnd) = try PersistentPrefixFile.readHeaderData(original, size: entry.bytes)
                var header = try JSONDecoder().decode(PersistentPrefixFile.Head.self, from: data)
                header.splicingTokens = tokens
                let json = try PersistentPrefixFile.encodeHeader(header)
                let size = payloadEnd + Int64(json.count + PersistentPrefixFile.footerBytes)
                // The metadata is charged to the same file and quota. Never
                // evict a useful numerical checkpoint just to retain spelling.
                guard storedBytes - entry.bytes + size <= configuration.maxBytes,
                      Self.availableBytes(configuration.directory) >= size + Self.minimumFreeBytes else {
                    report("conversation token metadata skipped: disk quota or free-space limit")
                    return false
                }
                // APFS clones share the large immutable tensor payload. Other
                // filesystems copy it through a bounded buffer, never Data(file).
                let cloned = clonefile(source, temporary, 0) == 0
                let fd = open(temporary, O_WRONLY | O_CLOEXEC | (cloned ? 0 : O_CREAT | O_EXCL), 0o600)
                guard fd >= 0 else { throw PersistentPrefixFileError("cannot create conversation checkpoint") }
                defer { close(fd) }
                if !cloned {
                    var buffer = [UInt8](repeating: 0, count: 64 << 10)
                    var offset: Int64 = 0
                    while offset < payloadEnd {
                        let count = Int(min(Int64(buffer.count), payloadEnd - offset))
                        try buffer.withUnsafeMutableBytes {
                            try PersistentPrefixFile.readAll(original, $0.baseAddress!, count, at: offset)
                            try PersistentPrefixFile.writeAll(fd, $0.baseAddress!, count)
                        }
                        offset += Int64(count)
                    }
                }
                guard ftruncate(fd, off_t(payloadEnd)) == 0, lseek(fd, off_t(payloadEnd), SEEK_SET) >= 0 else {
                    throw PersistentPrefixFileError("cannot replace conversation header")
                }
                try json.withUnsafeBytes { try PersistentPrefixFile.writeAll(fd, $0.baseAddress!, $0.count) }
                let crc = json.withUnsafeBytes { PersistentPrefixFile.crc32($0.baseAddress, $0.count) }
                let footer = PersistentPrefixFile.footer(headerOffset: payloadEnd, headerLength: json.count, headerCRC: crc)
                try footer.withUnsafeBytes { try PersistentPrefixFile.writeAll(fd, $0.baseAddress!, $0.count) }
                guard rename(temporary, source) == 0 else { throw PersistentPrefixFileError("cannot publish conversation header") }
                entry.splicingTokens = tokens
                entry.bytes = size
                entry.lastUsed = now
                lock.withLock {
                    if let index = heads.firstIndex(where: { $0.file == entry.file }) { heads[index] = entry }
                    counters.writtenBytes += cloned ? Int64(json.count + footer.count) : size
                }
                return true
            } catch {
                report("conversation token metadata not saved: \(error)")
                return false
            }
        }
    }
}
