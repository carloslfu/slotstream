import CryptoKit
import Darwin
import Foundation
import MLX
import Slotstream
import Tokenizers

extension Diagnostics {
    /// An explicit bounded evaluation instrument. A transcript is evidence for
    /// an external frozen grader, never its own quality qualification.
    public static func quantizationTasks(protocolFile: URL, protocolSHA256: String,
        baseline: URL, source: URL?, inventory: URL?, composite: URL?, table: URL?,
        draftDepth: Int, output: URL, prepareOnly: Bool = false) async throws -> Data {
        guard (source == nil) == (inventory == nil),
              source != nil || (composite == nil && table == nil && draftDepth == 0),
              source == nil || table != nil,
              (0...4).contains(draftDepth), draftDepth == 0 || composite != nil,
              !FileManager.default.fileExists(atPath: output.path),
              !ProcessInfo.processInfo.environment.keys.contains(where: {
                  $0.hasPrefix("SLOTSTREAM_") || $0.hasPrefix("SS_DEBUG") || $0.hasPrefix("VQ_") || $0.hasPrefix("VQLAB_")
              }) else { throw ModelError("task evaluation needs explicit paired artifacts, new output and no ambient overrides") }
        func digest(_ data: Data) -> String { SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined() }
        func read(_ url: URL, bound: Int) throws -> Data {
            let fd = open(url.path, O_RDONLY | O_NOFOLLOW | O_NONBLOCK | O_CLOEXEC)
            guard fd >= 0 else { throw ModelError("cannot read evaluation input") }
            let file = FileHandle(fileDescriptor: fd, closeOnDealloc: true)
            defer { try? file.close() }
            var info = stat()
            guard fstat(fd, &info) == 0, info.st_mode & S_IFMT == S_IFREG,
                  info.st_size > 0, info.st_size <= bound,
                  let bytes = try file.read(upToCount: bound + 1), bytes.count == info.st_size else {
                throw ModelError("evaluation input is not a bounded complete regular file")
            }
            return bytes
        }
        let raw = try read(protocolFile, bound: 8_000_000)
        guard protocolSHA256.count == 64, digest(raw) == protocolSHA256,
              let protocolObject = try JSONSerialization.jsonObject(with: raw) as? [String: Any],
              protocolObject["schema"] as? Int == 1,
              let split = protocolObject["scope"] as? String, ["pilot", "held-out"].contains(split),
              let cases = protocolObject["cases"] as? [[String: Any]], (1...64).contains(cases.count),
              let context = protocolObject["context_limit"] as? Int, [4096, 8192, 32768].contains(context),
              let cap = protocolObject["output_limit"] as? Int, [128, 512, 1024, 2048].contains(cap),
              protocolObject["sampling"] as? String == "greedy",
              protocolObject["memory_bytes"] as? Int == 10_000_000_000 else {
            throw ModelError("evaluation protocol differs from its frozen bounded identity")
        }
        // Authenticate every tokenizer input before any template is rendered.
        let tokenizerNames: Set<String> = ["tokenizer.json", "tokenizer_config.json", "chat_template.jinja", "config.json", "generation_config.json", "merges.txt", "vocab.json"]
        for file in PinnedModel.files where tokenizerNames.contains(file.path) {
            let bytes = try read(baseline.appendingPathComponent(file.path), bound: Int(file.size))
            guard bytes.count == file.size, digest(bytes) == file.sha256 else { throw ModelError("original tokenizer or template identity changed") }
        }
        let tokenizer = try await AutoTokenizer.from(modelFolder: baseline)
        let prepared = protocolObject["prepared"] as? Bool == true
        guard prepareOnly ? !prepared : prepared else {
            throw ModelError("render the evaluation protocol once with --prepare-only, then use its frozen token contexts for every arm")
        }
        if prepared {
            guard protocolObject["tokenizer_sha256"] as? String == PinnedModel.files.first(where: { $0.path == "tokenizer.json" })?.sha256,
                  let parent = protocolObject["parent_protocol_sha256"] as? String,
                  parent.count == 64, parent.allSatisfy({ $0.isASCII && $0.isHexDigit }) else {
                throw ModelError("prepared task protocol lost its tokenizer or parent identity")
            }
        }
        var rendered: [(id: String, family: String, tokens: [Int], tools: [ToolDefinition])] = []
        var frozenCases: [[String: Any]] = []
        var seen = Set<String>()
        for row in cases {
            guard let id = row["id"] as? String, (1...64).contains(id.utf8.count),
                  id.allSatisfy({ $0.isASCII && ($0.isLetter || $0.isNumber || $0 == "-" || $0 == "_") }),
                  seen.insert(id).inserted,
                  let family = row["family"] as? String, !family.isEmpty,
                  let request = row["request"] as? [String: Any],
                  Set(request.keys).isSubset(of: ["messages", "tools", "think"]) else { throw ModelError("invalid or duplicate evaluation case") }
            let conversation = try OpenAIDialect.conversation(request, contextLimit: context)
            guard !conversation.thinking, conversation.messages.allSatisfy({ $0.images.isEmpty }) else {
                throw ModelError("this evaluation protocol admits explicit non-thinking text and tool tasks")
            }
            let tokens: [Int]
            if prepared {
                guard let frozen = row["tokens"] as? [Int] else { throw ModelError("prepared task has no frozen token context") }
                tokens = frozen
            } else {
                tokens = try tokenizer.applyChatTemplate(messages: conversation.messages.map(\.templateValue),
                    tools: conversation.tools.isEmpty ? nil : conversation.tools.map(\.templateValue),
                    additionalContext: ["enable_thinking": false])
            }
            guard !tokens.isEmpty, tokens.count + cap <= context,
                  tokens.allSatisfy({ (0..<248320).contains($0) }) else { throw ModelError("task exceeds its frozen context reservation") }
            rendered.append((id, family, tokens, conversation.tools))
            var frozen = row; frozen["tokens"] = tokens; frozenCases.append(frozen)
        }
        if prepareOnly {
            var frozen = protocolObject
            frozen["prepared"] = true; frozen["parent_protocol_sha256"] = protocolSHA256
            frozen["cases"] = frozenCases
            frozen["tokenizer_sha256"] = PinnedModel.files.first { $0.path == "tokenizer.json" }!.sha256
            let data = try JSONSerialization.data(withJSONObject: frozen, options: [.prettyPrinted, .sortedKeys])
            guard data.count <= 8_000_000 else { throw ModelError("prepared protocol exceeds its bounded size; use smaller frozen batches") }
            try FileManager.default.createDirectory(at: output, withIntermediateDirectories: false)
            try data.write(to: output.appendingPathComponent("prepared.json"), options: .withoutOverwriting)
            return data
        }
        try ModelProcessGuard.acquire()
        guard let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= 13_000_000_000 else {
            throw ModelError("task evaluation requires 13 GB real reclaimable memory")
        }
        try FileManager.default.createDirectory(at: output, withIntermediateDirectories: false)
        try raw.write(to: output.appendingPathComponent("protocol.json"), options: .withoutOverwriting)
        let oldCache = MLX.Memory.cacheLimit, oldLimit = MLX.Memory.memoryLimit
        MLX.Memory.cacheLimit = 128_000_000; MLX.Memory.memoryLimit = min(oldLimit, 9_000_000_000)
        defer { Stream.gpu.synchronize(); MLX.Memory.clearCache(); MLX.Memory.cacheLimit = oldCache; MLX.Memory.memoryLimit = oldLimit }
        var candidate: VQModelProbe?, baselineEngine: Engine?, empty: StateCheckpoint?
        var identity: [String: Any] = ["baseline_revision": PinnedModel.revision]
        var rows: [[String: Any]] = []
        func receipt(_ complete: Bool, _ failure: String? = nil) throws -> Data {
            var value: [String: Any] = ["schema": 1, "complete": complete, "qualification": "unproven",
                "scope": split, "protocol_sha256": protocolSHA256, "context_limit": context, "output_limit": cap,
                "draft_depth": draftDepth, "sampling": "greedy", "identity": identity, "cases": rows,
                "peak_process_bytes": ProcessMemory.peakResidentBytes(), "process_bound_bytes": 10_000_000_000,
                "timing_scope": "functional task evidence only; paired timing eligibility is separate"]
            value["failure"] = failure
            let data = try JSONSerialization.data(withJSONObject: value, options: [.prettyPrinted, .sortedKeys])
            try data.write(to: output.appendingPathComponent("receipt.json"), options: .atomic)
            return data
        }
        do {
            if let source, let inventory, let table {
                let checkpoint = try VQCheckpoint(directory: source, inventory: inventory,
                    denseOverlayBaseline: composite == nil ? nil : baseline, denseOverlayManifest: composite)
                let model = VQModelProbe(checkpoint, verificationArithmetic: true)
                try model.enableResidentText()
                try model.enableResidentRecords(wide: true, parallelReads: true)
                try model.enableExtendedContext(VQRotaryCoefficients(url: table), limit: context)
                if draftDepth > 0 { try model.enableOriginalDraft(baseline: baseline) }
                candidate = model; empty = try model.snapshot()
                identity["inventory_sha256"] = checkpoint.inventorySHA256
                identity["composite_sha256"] = checkpoint.compositeSHA256
                identity["arithmetic"] = "vq-reference-with-row-invariant-verification-v1"
                identity["rotary_sha256"] = VQRotaryCoefficients.sha256
            } else {
                try WeightStore.verify(at: baseline)
                let plan = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 10,
                    mtp: .off, vision: .off, maxContextTokens: context)
                let engine = try await Engine(modelDir: baseline, plan: plan)
                engine.prefixCache.enabled = false
                baselineEngine = engine
                identity["manifest_sha256"] = ModelPackRegistry.baseline.manifestDigest
                identity["arithmetic"] = "native-deployed-defaults"
                identity["plan"] = plan.json()
            }
            _ = try receipt(false)
            for item in rendered {
                let start = ProcessInfo.processInfo.systemUptime
                var samples: [Double] = [], resourceFailure = false
                func keepGoing() -> Bool {
                    guard ProcessInfo.processInfo.systemUptime - start < 1800,
                          ProcessMemory.peakResidentBytes() <= 10_000_000_000,
                          let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= 3_000_000_000 else {
                        resourceFailure = true; return false
                    }
                    return true
                }
                var params = SampleParams.greedy; params.maxTokens = cap; params.seed = 42
                var ids: [Int], reason: String, detail: [String: Any] = [:]
                if let model = candidate, let empty {
                    let result = try withError {
                        try model.restore(empty)
                        return try VQGenerationProbe.generate(model: model, prompt: item.tokens, params: params,
                            draftDepth: draftDepth, eosIDs: [248044, 248046], shouldContinue: keepGoing,
                            onToken: { _ in samples.append(ProcessInfo.processInfo.systemUptime - start); return true }, outputLimit: cap)
                    }
                    ids = result.tokens; reason = result.reason
                    detail = ["consumed_tokens": result.consumedTokens, "drafted": result.drafted, "accepted": result.accepted]
                    guard model.hasCommittedBoundary else { throw ModelError("candidate task did not leave a committed state") }
                } else if let engine = baselineEngine {
                    engine.dropPrefixCache()
                    let result = engine.generate(promptIds: item.tokens, params: params, shouldContinue: keepGoing,
                        onToken: { _, _ in samples.append(ProcessInfo.processInfo.systemUptime - start); return true })
                    if let error = result.stats.runtimeError { throw ModelError(error) }
                    if let error = result.stats.requestFailure { throw error }
                    ids = result.ids; reason = result.stats.finishReason
                    detail["stats"] = try JSONSerialization.jsonObject(with: JSONEncoder().encode(result.stats))
                } else { throw ModelError("task producer was not loaded") }
                guard !resourceFailure, keepGoing() else { throw ModelError("task evaluation exceeded its time or physical-memory reservation") }
                let text = tokenizer.decode(tokens: ids, skipSpecialTokens: false)
                let splitter = ToolCallSplitter(tools: item.tools.map(\.schema))
                let events = splitter.push(text) + splitter.flush()
                var calls: [[String: Any]] = [], malformed = false, prose = ""
                for event in events {
                    switch event {
                    case .toolCall(let call): calls.append(["name": call.name, "arguments_json": call.inputJSON])
                    case .malformed: malformed = true
                    case .text(let part): prose += part
                    default: break
                    }
                }
                rows.append(["id": item.id, "family": item.family, "prompt_tokens": item.tokens,
                    "output_tokens": ids, "text": text, "prose": prose, "tool_calls": calls, "malformed_tool_call": malformed,
                    "reason": reason, "emission_seconds": samples, "request_seconds": ProcessInfo.processInfo.systemUptime - start,
                    "detail": detail, "peak_process_bytes": ProcessMemory.peakResidentBytes()])
                _ = try receipt(false)
            }
            return try receipt(true)
        } catch { _ = try receipt(false, String(describing: error)); throw error }
    }
}
