import Foundation
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    static func persistentPrefixRewriteQuota() throws -> CheckReport {
        var c = CheckBuilder("persistent-prefix-rewrite-quota")
        let fm = FileManager.default
        let identity = PersistentPrefixIdentity(components: ["fixture": "retained-transcript-quota"])
        let checkpoint = [1, 2, 3]
        let conversation = checkpoint + Array(repeating: 248000, count: 12_000)
        let filename = PersistentPrefixFile.fileName(identity: identity.digest, tokens: checkpoint)
        for tight in [true, false] {
            let directory = fm.temporaryDirectory.appendingPathComponent("slotstream-quota-\(UUID().uuidString)")
            defer { try? fm.removeItem(at: directory) }
            let roomy = PersistentPrefixConfiguration(directory: directory, maxBytes: 1 << 20, minimumTokens: 1)
            let state = Qwen4ExpModel.State()
            state.tokenCount = checkpoint.count
            var tier: PersistentPrefixCache? = try PersistentPrefixCache(configuration: roomy, identity: identity)
            c.equal("bare committed host state saved", tier!.save(state: state, tokens: checkpoint).outcome, .saved)
            c.expect("long exact transcript attached", tier!.rememberConversation(tokens: conversation))
            let before = try Data(contentsOf: directory.appendingPathComponent(filename))
            c.expect("regression metadata exceeds the former fixed allowance", before.count > 65_536)
            c.equal("initial byte charge matches container", tier!.storedBytes, Int64(before.count))
            tier = nil
            let quota = tight ? Int64(before.count) : roomy.maxBytes
            tier = try PersistentPrefixCache(configuration: .init(directory: directory, maxBytes: quota, minimumTokens: 1), identity: identity)
            c.equal("transcript survived reopening", tier!.indexedEntries.first?.splicingTokens, conversation)
            let result = tier!.save(state: state, tokens: checkpoint, shared: true)
            let after = try Data(contentsOf: directory.appendingPathComponent(filename))
            if tight {
                c.expect("oversized shared upgrade is refused", result.outcome != .saved && result.outcome != .present, "\(result.outcome)")
                c.expect("quota refusal preserves old container bytes", after == before)
                c.equal("quota refusal preserves the old head class", tier!.indexedEntries.first?.shared, false)
                c.equal("failed rewrite claims no written bytes", result.bytes, 0)
            } else {
                c.equal("same upgrade succeeds with sufficient quota", result.outcome, .saved)
                c.equal("sufficient quota publishes shared flag", tier!.indexedEntries.first?.shared, true)
                c.expect("successful rewrite actually changes the head", after != before)
            }
            c.expect("rewrite never exceeds configured quota", tier!.storedBytes <= quota)
            c.equal("final accounting equals actual container bytes", tier!.storedBytes, Int64(after.count))
            c.equal("rewrite preserves exact transcript", tier!.indexedEntries.first?.splicingTokens, conversation)
            c.equal("one committed host checkpoint stays indexed", tier!.storedStates, 1)
            c.equal("host-only checkpoint needs no row segments", tier!.storedSegments, 0)
            c.expect("no interrupted file survives", !(try fm.contentsOfDirectory(atPath: directory.path)).contains { $0.hasSuffix(".tmp") })
            tier = nil
            let reopened = try PersistentPrefixCache(configuration: .init(directory: directory, maxBytes: quota, minimumTokens: 1), identity: identity)
            c.equal("head and transcript remain valid after restart", reopened.indexedEntries.first?.splicingTokens, conversation)
            c.equal("restart keeps the committed token boundary", reopened.indexedEntries.first?.tokens, checkpoint)
        }
        return c.report()
    }
}
