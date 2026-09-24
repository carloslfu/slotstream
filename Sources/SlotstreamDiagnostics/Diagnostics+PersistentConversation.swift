import Foundation
import Darwin
import Slotstream

extension Diagnostics {
    /// Real file format and atomic metadata replacement, without tensors or
    /// weights. The numerical state key must never grow with the transcript.
    public static func persistentConversationIDs() throws -> CheckReport {
        var c = CheckBuilder("persistent-conversation-ids")
        let root = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        defer { try? FileManager.default.removeItem(at: root) }
        try PersistentPrefixCache.prepareDirectory(root)
        let identity = PersistentPrefixIdentity(components: ["fixture": "conversation-ids"])
        let tokens = [1, 2, 3]
        let name = PersistentPrefixFile.fileName(identity: identity.digest, tokens: tokens)
        let bytes = PersistentPrefixFile.tokenBytes(tokens)
        let legacy: [String: Any] = ["format": PersistentPrefixFile.formatVersion,
            "kind": PersistentPrefixFile.Kind.head.rawValue, "identity": identity.digest,
            "tokenCount": 3, "continued": false, "compactStateWindows": false,
            "ngramContext": [], "linear": [], "attention": [], "arrays": [], "sequences": [],
            "sequenceBytes": 0, "residentBytes": 0]
        var header = try JSONDecoder().decode(PersistentPrefixFile.Head.self,
            from: JSONSerialization.data(withJSONObject: legacy))
        _ = try PersistentPrefixFile.writeContainer(to: root.appendingPathComponent(name).path,
            payloads: [.host(bytes)], expected: [Int64(bytes.count)]) { placed in
            let records: [[String: Any]] = [["name": "tokens", "dtype": "int32", "shape": [3], "axis": 0, "length": 3,
                "offset": placed[0].offset, "byteCount": placed[0].byteCount, "crc32": placed[0].crc32]]
            header.arrays = try JSONDecoder().decode([PersistentPrefixFile.ArrayRecord].self,
                from: JSONSerialization.data(withJSONObject: records))
            return try PersistentPrefixFile.encodeHeader(header)
        }
        let config = PersistentPrefixConfiguration(directory: root, maxBytes: 1 << 20, minimumTokens: 1)
        var tier: PersistentPrefixCache? = try PersistentPrefixCache(configuration: config, identity: identity)
        let conversation = [1, 2, 3, 4, 5, 6]
        c.expect("conversation metadata saved", tier!.rememberConversation(tokens: conversation))
        c.equal("splice sees generated suffix", tier!.longestExtension(of: [1, 2, 3, 4]), conversation)
        c.equal("resume remains at numerical checkpoint", tier!.candidate(extending: conversation,
            longerThan: 0, requireDraft: false)?.tokens, tokens)
        c.expect("mismatching history cannot attach", !tier!.rememberConversation(tokens: [9, 8, 7]))
        c.expect("negative ids are rejected", !tier!.rememberConversation(tokens: [1, 2, 3, -1]))
        let size = tier!.storedBytes
        tier = nil
        tier = try PersistentPrefixCache(configuration: config, identity: identity)
        c.equal("generated ids survive restart", tier!.longestExtension(of: [1, 2, 3, 4]), conversation)
        let cache = PrefixCache(maxTokens: 100)
        let other = [1, 2, 3, 9, 9, 9, 9, 9]
        let state = Qwen4ExpModel.State()
        state.tokenCount = other.count
        cache.store(state: state, tokens: other)
        cache.attachPersistent(tier)
        c.equal("restart still selects compatible disk metadata over a longer memory branch",
            cache.peek(extending: [1, 2, 3], matching: { $0 == conversation }), conversation)
        cache.attachPersistent(nil)
        c.equal("quota counts conversation metadata", tier!.storedBytes, size)
        c.equal("metadata survives ordinary format validation", tier!.indexedEntries.first?.splicingTokens, conversation)
        tier = nil
        let tight = PersistentPrefixConfiguration(directory: root, maxBytes: size, minimumTokens: 1)
        tier = try PersistentPrefixCache(configuration: tight, identity: identity)
        c.expect("metadata cannot exceed disk quota", !tier!.rememberConversation(tokens: conversation + Array(repeating: 7, count: 1000)))
        c.equal("quota refusal preserves prior transcript", tier!.longestExtension(of: [1, 2, 3, 4]), conversation)
        _ = tier!.removeStates(overlapping: conversation)
        c.expect("forgetting a conversation erases its ids too", tier!.longestExtension(of: [1, 2, 3, 4]) == nil)
        return c.report()
    }
}
