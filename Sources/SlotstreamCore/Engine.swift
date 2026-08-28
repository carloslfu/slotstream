// High-level engine: model + tokenizer + chat templating, shared by CLI/server.

import Foundation
import MLX
import Tokenizers

public struct ChatMessage {
    public var role: String
    public var content: String
    public init(role: String, content: String) {
        self.role = role
        self.content = content
    }
}

public final class Engine {
    public let modelDir: URL
    public let model: Qwen4ExpModel
    public let generator: Generator
    public let tokenizer: any Tokenizers.Tokenizer
    public let eosIds: Set<Int>
    public let modelName: String
    private let lock = NSLock()

    public init(modelDir: URL, poolSlots: Int) async throws {
        self.modelDir = modelDir
        self.modelName = "qwen3.8-flash-next:4bit"
        let t0 = Date()
        let index = try CheckpointIndex(dir: modelDir)
        self.model = try Qwen4ExpModel(index: index, poolSlots: poolSlots)
        model.validate()
        self.generator = Generator(model: model)
        self.tokenizer = try await AutoTokenizer.from(modelFolder: modelDir)
        var eos: Set<Int> = [index.config.eosTokenId]
        if let e = tokenizer.eosTokenId { eos.insert(e) }
        // generation_config may list several
        if let d = try? Data(contentsOf: modelDir.appendingPathComponent("generation_config.json")),
            let o = try? JSONSerialization.jsonObject(with: d) as? [String: Any]
        {
            if let list = o["eos_token_id"] as? [Int] { list.forEach { eos.insert($0) } }
            if let one = o["eos_token_id"] as? Int { eos.insert(one) }
        }
        self.eosIds = eos
        let banner = "engine ready in \(String(format: "%.1f", -t0.timeIntervalSinceNow))s: "
            + "pool \(String(format: "%.1f", Double(model.pool.poolBytes) / 1e9)) GB "
            + "(\(model.pool.slots) slots), eos \(eos.sorted())\n"
        FileHandle.standardError.write(banner.data(using: .utf8)!)
    }

    public func encodeChat(_ messages: [ChatMessage], thinking: Bool) throws -> [Int] {
        let msgs: [[String: String]] = messages.map { ["role": $0.role, "content": $0.content] }
        return try tokenizer.applyChatTemplate(
            messages: msgs, tools: nil,
            additionalContext: ["enable_thinking": thinking])
    }

    /// Serialized generation (single-flight; callers queue on the lock).
    public func generate(
        promptIds: [Int], params: SampleParams,
        onToken: ((Int, String) -> Bool)? = nil
    ) -> (text: String, ids: [Int], stats: GenStats) {
        lock.lock()
        defer { lock.unlock() }
        var emitted = ""
        let (ids, stats) = generator.generate(
            promptIds: promptIds, params: params, eosIds: eosIds
        ) { [weak self] tok in
            guard let self, let cb = onToken else { return true }
            // streaming detokenization: decode all, emit the delta
            emitted = self.decodeForStream(current: emitted, next: tok, cb: cb)
            return !emitted.hasSuffix("\u{0}")
        }
        let text = tokenizer.decode(tokens: ids, skipSpecialTokens: true)
        return (text, ids, stats)
    }

    private var streamIds: [Int] = []
    private func decodeForStream(current: String, next: Int, cb: (Int, String) -> Bool) -> String {
        if current.isEmpty { streamIds = [] }
        streamIds.append(next)
        let full = tokenizer.decode(tokens: streamIds, skipSpecialTokens: true)
        var delta = ""
        if full.count >= current.count, full.hasPrefix(current) {
            delta = String(full.dropFirst(current.count))
        }
        // hold back trailing replacement chars (incomplete utf8 sequences)
        if delta.hasSuffix("\u{FFFD}") { delta = String(delta.dropLast()) }
        let keep = cb(next, delta)
        let out = current + delta
        return keep ? out : out + "\u{0}"
    }
}
