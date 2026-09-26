import Darwin
import Foundation
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    /// Real, tiny containers and OS permission failures, without tensors.
    static func persistentPrefixReadFailures() throws -> CheckReport {
        var c = CheckBuilder("persistent-prefix-read-failures")
        guard geteuid() != 0 else {
            c.skip("permission failures require an unprivileged user")
            return c.report()
        }
        let fm = FileManager.default
        let root = fm.temporaryDirectory.appendingPathComponent("slotstream-prefix-io-\(UUID().uuidString)")
        defer { try? fm.removeItem(at: root) }
        let identity = PersistentPrefixIdentity(components: ["fixture": "read-failures"])
        let tokens = [11, 12, 13]
        let headName = PersistentPrefixFile.fileName(identity: identity.digest, tokens: tokens)
        let segmentName = String(repeating: "a", count: 32) + ".slotseg"
        func config(_ directory: URL) -> PersistentPrefixConfiguration {
            PersistentPrefixConfiguration(directory: directory, maxBytes: 1 << 20, minimumTokens: 1, maxAge: nil)
        }
        func container(_ payload: [UInt8], _ header: [String: Any]) throws -> Data {
            let json = try JSONSerialization.data(withJSONObject: header, options: [.sortedKeys])
            let crc = json.withUnsafeBytes { PersistentPrefixFile.crc32($0.baseAddress, $0.count) }
            return Data(PersistentPrefixFile.magic + payload) + json + Data(PersistentPrefixFile.footer(
                headerOffset: Int64(8 + payload.count), headerLength: json.count, headerCRC: crc))
        }
        let tokenBytes: [UInt8] = [11, 0, 0, 0, 12, 0, 0, 0, 13, 0, 0, 0]
        let tokenCRC = tokenBytes.withUnsafeBytes { PersistentPrefixFile.crc32($0.baseAddress, $0.count) }
        let head = try container(tokenBytes, [
            "format": PersistentPrefixFile.formatVersion, "kind": "head", "identity": identity.digest,
            "tokenCount": 3, "continued": false, "compactStateWindows": false,
            "ngramContext": [], "linear": [], "attention": [], "sequenceBytes": 1, "residentBytes": 1,
            "arrays": [["name": "tokens", "dtype": "int32", "shape": [3], "axis": 0, "length": 3,
                "offset": 8, "byteCount": 12, "crc32": tokenCRC]],
            "sequences": [["name": "rows", "dtype": "uint8", "shape": [1], "axis": 0, "base": 0, "live": 1,
                "extents": [["segment": segmentName, "start": 0, "end": 1]]]],
        ])
        let row: [UInt8] = [42]
        let rowCRC = row.withUnsafeBytes { PersistentPrefixFile.crc32($0.baseAddress, $0.count) }
        let segment = try container(row, [
            "format": PersistentPrefixFile.formatVersion, "kind": "segment", "identity": identity.digest,
            "rows": [["name": "rows", "dtype": "uint8", "leading": [], "trailing": [],
                "start": 0, "end": 1, "offset": 8, "byteCount": 1, "crc32": rowCRC]],
        ])
        func fixture(_ label: String) throws -> URL {
            let directory = root.appendingPathComponent(label)
            try PersistentPrefixCache.prepareDirectory(directory)
            try head.write(to: directory.appendingPathComponent(headName))
            try segment.write(to: directory.appendingPathComponent(segmentName))
            return directory
        }
        for name in [headName, segmentName] {
            let label = name == headName ? "head" : "segment"
            let directory = try fixture(label)
            do {
                let tier = try PersistentPrefixCache(configuration: config(directory), identity: identity)
                c.equal("\(label): valid fixture indexes", tier.indexedEntries.first?.tokens, tokens)
                c.equal("\(label): valid fixture has its segment", tier.storedSegments, 1)
            }
            let unreadable = directory.appendingPathComponent(name)
            guard chmod(unreadable.path, 0) == 0 else { throw ModelError("cannot set fixture permissions") }
            defer { chmod(unreadable.path, 0o600) }
            do {
                _ = try PersistentPrefixCache.readFile(directory: directory, name: name)
                c.expect("\(label): OS denies reading", false)
            } catch {
                c.expect("\(label): read error does not condemn the file", !(error is PersistentPrefixFileError))
            }
            do {
                _ = try PersistentPrefixCache(configuration: config(directory), identity: identity)
                c.expect("\(label): incomplete index is refused", false)
            } catch {
                c.expect("\(label): incomplete index is refused", true)
            }
            c.expect("\(label): failed open preserves the head", fm.fileExists(atPath: directory.appendingPathComponent(headName).path))
            c.expect("\(label): failed open preserves its segment", fm.fileExists(atPath: directory.appendingPathComponent(segmentName).path))
            _ = chmod(unreadable.path, 0o600)
            c.equal("\(label): head bytes survive", try? Data(contentsOf: directory.appendingPathComponent(headName)), head)
            c.equal("\(label): segment bytes survive", try? Data(contentsOf: directory.appendingPathComponent(segmentName)), segment)
            // Reopening also proves that a failed initializer released its lock.
            let retry = try PersistentPrefixCache(configuration: config(directory), identity: identity)
            c.equal("\(label): retry recovers the state", retry.indexedEntries.first?.tokens, tokens)
            c.equal("\(label): retry recovers its segment", retry.storedSegments, 1)
            c.equal("\(label): retry removes nothing", retry.maintenance.files, 0)
        }

        // Real corruption still permits cleanup, including dependent files.
        for kind in ["head", "segment"] {
            let directory = try fixture("corrupt-" + kind)
            let name = kind == "head" ? headName : segmentName
            try Data([0]).write(to: directory.appendingPathComponent(name))
            let tier = try PersistentPrefixCache(configuration: config(directory), identity: identity)
            c.equal("\(kind): truncated file is removed", tier.maintenance.unreadable, 1)
            c.equal("\(kind): dependent files are collected", tier.maintenance.files, 2)
            c.equal("\(kind): invalid state is not indexed", tier.storedStates, 0)
            c.expect("\(kind): corruption cleanup erases both files",
                !fm.fileExists(atPath: directory.appendingPathComponent(headName).path)
                    && !fm.fileExists(atPath: directory.appendingPathComponent(segmentName).path))
        }
        let missing = try fixture("missing-segment")
        try fm.removeItem(at: missing.appendingPathComponent(segmentName))
        do {
            _ = try PersistentPrefixCache.readFile(directory: missing, name: segmentName)
            c.expect("a missing file remains unusable", false)
        } catch {
            c.expect("a missing file remains unusable", error is PersistentPrefixFileError)
        }
        let tier = try PersistentPrefixCache(configuration: config(missing), identity: identity)
        c.equal("a genuinely missing segment removes its head", tier.maintenance.incomplete, 1)
        return c.report()
    }
}
