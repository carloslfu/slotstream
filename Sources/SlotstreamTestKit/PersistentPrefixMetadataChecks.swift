// T0: tiny checksum-valid containers with invalid array metadata. These use
// the real disk reader and startup indexer, without model weights or MLX arrays.
import Foundation
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    static func persistentPrefixMetadataBounds() throws -> CheckReport {
        var c = CheckBuilder("persistent-prefix-metadata-bounds")
        typealias File = PersistentPrefixFile
        let fm = FileManager.default
        let directory = fm.temporaryDirectory.appendingPathComponent("slotstream-prefix-metadata-\(UUID().uuidString)")
        try fm.createDirectory(at: directory, withIntermediateDirectories: true)
        defer { try? fm.removeItem(at: directory) }
        let identity = PersistentPrefixIdentity(components: ["fixture": "metadata-bounds"])
        var original: [String: Data] = [:]
        var serial = 0
        func write(extra: [UInt8]? = nil, change: (inout File.Head) -> Void = { _ in }) throws -> String {
            serial += 1
            let tokens = [serial]
            let name = File.fileName(identity: identity.digest, tokens: tokens)
            let payloads = [File.tokenBytes(tokens)] + (extra.map { [$0] } ?? [])
            let url = directory.appendingPathComponent(name)
            _ = try File.writeContainer(to: url.path, payloads: payloads.map { .host($0) },
                expected: payloads.map { Int64($0.count) }) { placed in
                let arrays: [[String: Any]] = placed.enumerated().map { index, record in
                    ["name": index == 0 ? "tokens" : "fixture", "dtype": index == 0 ? "int32" : "uint8",
                     "shape": [index == 0 ? 1 : payloads[index].count], "axis": 0,
                     "length": index == 0 ? 1 : payloads[index].count,
                     "offset": record.offset, "byteCount": record.byteCount, "crc32": record.crc32]
                }
                let metadata: [String: Any] = ["format": File.formatVersion, "kind": "head", "identity": identity.digest,
                    "tokenCount": 1, "continued": false, "compactStateWindows": false, "ngramContext": [], "linear": [],
                    "attention": [], "arrays": arrays, "sequences": [], "sequenceBytes": 0, "residentBytes": extra?.count ?? 0]
                var header = try JSONDecoder().decode(File.Head.self, from: JSONSerialization.data(withJSONObject: metadata))
                change(&header)
                return try File.encodeHeader(header)
            }
            original[name] = try Data(contentsOf: url)
            return name
        }
        let valid = [try write(), try write(extra: [1, 2, 3, 4]), try write(extra: [])]
        for name in valid {
            if case let .head(entry) = try PersistentPrefixCache.readFile(directory: directory, name: name) {
                c.equal("valid head retains its token", entry.tokens.count, 1)
            } else { c.expect("valid head is readable", false) }
        }
        let invalid: [(String, String)] = [
            ("first array overflow", try write { $0.arrays[0].byteCount = Int64.max }),
            ("later array overflow", try write(extra: [1]) { $0.arrays[1].byteCount = Int64.max }),
            ("cumulative overflow", try write(extra: [1]) {
                $0.arrays[0].byteCount = Int64.max - 8
                $0.arrays[1].offset = Int64.max
                $0.arrays[1].byteCount = 1
            }),
            ("negative byte count", try write { $0.arrays[0].byteCount = -1 }),
            ("minimum byte count", try write { $0.arrays[0].byteCount = Int64.min }),
            ("past actual payload", try write { $0.arrays[0].byteCount += 1 }),
            ("incomplete coverage", try write { $0.arrays[0].byteCount -= 1 }),
            ("gap before later array", try write(extra: [1]) { $0.arrays[1].offset += 1 }),
            ("overlap before later array", try write(extra: [1]) { $0.arrays[1].offset -= 1 }),
            ("duplicate name", try write(extra: [1]) { $0.arrays[1].name = "tokens" }),
            ("maximum offset", try write { $0.arrays[0].offset = Int64.max }),
        ]
        for (label, name) in invalid {
            do {
                _ = try PersistentPrefixCache.readFile(directory: directory, name: name)
                c.expect(label + " is rejected", false)
            } catch is PersistentPrefixFileError {
                c.expect(label + " is an invalid file, not a process trap", true)
            }
        }
        let report = try PersistentPrefixCache.inspect(directory: directory)
        c.equal("inspection keeps valid heads", report.states.count, valid.count)
        c.equal("inspection counts invalid heads", report.unreadableFiles, invalid.count)
        for (name, bytes) in original {
            c.equal("inspection preserves \(name)", try Data(contentsOf: directory.appendingPathComponent(name)), bytes)
        }
        let tier = try PersistentPrefixCache(configuration: .init(directory: directory,
            maxBytes: 1 << 20, minimumTokens: 1, maxAge: nil), identity: identity)
        c.equal("startup retains valid heads", tier.storedStates, valid.count)
        c.equal("startup rejects malformed metadata", tier.maintenance.unreadable, invalid.count)
        for name in valid {
            c.equal("startup preserves \(name)", try Data(contentsOf: directory.appendingPathComponent(name)), original[name]!)
        }
        for (label, name) in invalid {
            c.expect("startup removes " + label, !fm.fileExists(atPath: directory.appendingPathComponent(name).path))
        }
        return c.report()
    }
}
