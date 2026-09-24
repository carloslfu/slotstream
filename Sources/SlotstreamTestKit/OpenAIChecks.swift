import Foundation
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    static var openAIChecks: [Check] {
        [Check("openai-conversation", tier: .t0) { try openAIConversation() },
         Check("openai-tool-output", tier: .t0) { try openAIToolOutput() },
         Check("prefill-progress", tier: .t0) { prefillProgress() },
         Check("openai-context-budget", tier: .t0) { try openAIContextBudget() }]
    }

    static var openAIReadTool: [String: Any] {
        ["type": "function", "function": ["name": "read_file", "description": "Read a file.",
            "parameters": ["type": "object", "properties": ["path": ["type": "string"],
                "start_line": ["type": "integer"]], "required": ["path"]]]]
    }

    static func openAIConversation() throws -> CheckReport {
        var c = CheckBuilder("openai-conversation")
        let user: [String: Any] = ["role": "user", "content": "Read hello.txt"]
        let call: [String: Any] = ["id": "call_42", "type": "function",
            "function": ["name": "read_file", "arguments": #"{"path":"hello.txt","start_line":1}"#]]
        let assistant: [String: Any] = ["role": "assistant", "content": NSNull(),
            "reasoning_content": "I need the file.", "tool_calls": [call]]
        let result: [String: Any] = ["role": "tool", "tool_call_id": "call_42", "content": "fixture42"]
        let base: [String: Any] = ["messages": [user], "tools": [openAIReadTool]]
        func parse(_ extra: [String: Any]) throws -> OpenAIDialect.Conversation {
            try OpenAIDialect.conversation(base.merging(extra) { _, new in new }, contextLimit: 65_536)
        }
        func rejected(_ extra: [String: Any]) -> Bool { (try? parse(extra)) == nil }
        // The plain OpenAI path still uses the shared image/text template.
        // These two client dialects must preserve the same image bytes and
        // text order while tool turns use the extended message representation.
        let textParts: [[String: Any]] = [["type": "text", "text": "Hello, "],
            ["type": "text", "text": "world."]]
        let plain = Server.templateMessages(["messages": [["role": "user", "content": textParts]]])
        c.equal("plain text parts keep their order", plain.first?["content"] as? String, "Hello, world.")
        let imagePart: [String: Any] = ["type": "image_url", "image_url": ["url": "fixture-bytes"]]
        let imageParts = [imagePart] + textParts
        let typed = Server.templateMessages(["messages": [["role": "user", "content": imageParts]]])
        c.equal("OpenAI images retain every typed part", (typed.first?["content"] as? [[String: Any]])?.count, 3)
        let preserved = (typed.first?["content"] as? [[String: Any]])?.first?["image_url"] as? [String: Any]
        c.equal("OpenAI image bytes pass through intact", preserved?["url"] as? String, "fixture-bytes")
        let ollama = Server.templateMessages(["messages": [["role": "user", "content": "Describe.", "images": ["fixture-bytes"]]]])
        let combined = ollama.first?["content"] as? [[String: Any]]
        c.equal("Ollama image precedes its text", combined?.first?["type"] as? String, "image_url")
        c.equal("Ollama text survives image conversion", combined?.last?["text"] as? String, "Describe.")
        let nullText = Server.templateMessages(["messages": [["role": "assistant", "content": NSNull()]]])
        c.equal("null content stays an empty template string", nullText.first?["content"] as? String, "")
        c.expect("stock SDK no-op defaults remain accepted", Server.openAINoOpError([
            "n": 1, "frequency_penalty": 0, "logprobs": false, "logit_bias": [:],
            "response_format": ["type": "text"], "user": "local-user"]) == nil)
        for unsupported: [String: Any] in [["n": 2], ["frequency_penalty": 1],
            ["logprobs": true], ["top_logprobs": 1], ["logit_bias": ["42": 1]], ["user": 123]] {
            c.expect("unsupported SDK option fails explicitly: \(unsupported.keys.sorted())",
                Server.openAINoOpError(unsupported) != nil)
        }
        // Pi and the OpenAI SDKs send `store: false` by default (issue #19).
        c.expect("store and the other stateless fields are read", ["store", "metadata", "prompt_cache_key",
            "prompt_cache_retention", "safety_identifier", "service_tier", "min_p"].allSatisfy { Server.openAIChatFields.contains($0) })
        c.expect("store false and request labels are accepted without effect",
            Server.openAINoOpError(["store": false]) == nil
                && Server.openAINoOpError(["metadata": ["session": "a"], "prompt_cache_key": "k",
                    "prompt_cache_retention": "24h", "safety_identifier": "s", "service_tier": "auto"]) == nil)
        c.expect("store true asks for a stored completion, which is refused by name",
            Server.openAINoOpError(["store": true])?.contains("store: true") == true)
        c.equal("omitted output cap uses the advertised budget", GatewayDialect.outputBudget(contextCap: 65536), 8192)
        for request: [String: Any] in [["tools": [openAIReadTool]], ["messages": [["role": "tool", "content": "result"]]],
                                       ["messages": [["role": "assistant", "tool_calls": [call]]]]] {
            c.expect("Ollama tool refusal names the supported route", Server.ollamaToolError(request)?.contains("/v1/chat/completions") == true)
        }
        for malformed: [String: Any] in [["store": "no"], ["store": 0], ["metadata": ["n": 1]], ["metadata": "x"],
            ["prompt_cache_key": 1], ["prompt_cache_retention": 24], ["safety_identifier": false], ["service_tier": ["auto"]]] {
            c.expect("a malformed stateless field is named: \(malformed.keys.sorted())",
                Server.openAINoOpError(malformed)?.contains(malformed.keys.first!) == true)
        }
        c.expect("an unknown field is still refused", !Server.openAIChatFields.contains("previous_response_id"))
        let constrained = Server.openAINoOpError(["response_format": ["type": "json_schema"]]) ?? ""
        c.expect("constrained-output error triggers Hermes's plain title fallback",
            constrained.contains("response_format is not supported"))
        let first = try parse(["reasoning_effort": "none", "think": false,
            "options": ["num_ctx": 64_000], "parallel_tool_calls": false])
        c.equal("requested context retained", first.contextLimit, 64_000)
        c.expect("reasoning none and single call retained", !first.thinking && !first.parallel)
        c.equal("tool schema retained", first.tools.first?.name, "read_file")
        let history = try parse(["messages": [user, assistant, result, user]])
        c.equal("history call ID retained", history.messages[1].toolCalls.first?.id, "call_42")
        c.equal("history integer retained", history.messages[1].toolCalls.first?.arguments["start_line"], .int(1))
        c.equal("result matches function", history.messages[2].toolName, "read_file")
        c.equal("reasoning retained", history.messages[1].reasoning, "I need the file.")
        var secondCall = call; secondCall["id"] = "call_43"
        var twoCalls = assistant; twoCalls["tool_calls"] = [call, secondCall]
        let secondResult: [String: Any] = ["role": "tool", "tool_call_id": "call_43", "content": "second fixture"]
        let reversed = try parse(["messages": [user, twoCalls, secondResult, result, user]])
        c.equal("out-of-order results restore first call identity", reversed.messages[2].toolCallId, "call_42")
        c.equal("out-of-order results restore first call content", reversed.messages[2].content, "fixture42")
        c.equal("out-of-order results restore second call content", reversed.messages[3].content, "second fixture")
        c.expect("history survives removed current tool definitions", !rejected(["messages": [user, assistant, result], "tools": []]))
        c.expect("missing result refused", rejected(["messages": [user, assistant]]))
        c.expect("orphan result refused", rejected(["messages": [user, result]]))
        c.expect("duplicate result refused", rejected(["messages": [user, assistant, result, result]]))
        c.expect("intervening user refused", rejected(["messages": [user, assistant, user, result]]))
        c.expect("mismatched result name refused", rejected(["messages": [user, assistant,
            result.merging(["name": "different"]) { _, new in new }]]))
        c.expect("numeric boolean refused", rejected(["parallel_tool_calls": 1]))
        c.expect("conflicting reasoning refused", rejected(["reasoning_effort": "none", "think": true]))
        c.expect("server context cannot be inflated", rejected(["options": ["num_ctx": 1_000_000]]))
        c.expect("fractional context refused", rejected(["options": ["num_ctx": 100.5]]))
        c.expect("unknown option refused", rejected(["options": ["num_predict": 10]]))
        c.expect("required needs tools", rejected(["tool_choice": "required", "tools": []]))
        c.expect("named choice must be declared", rejected(["tool_choice": ["type": "function", "function": ["name": "missing"]]]))
        var strict = openAIReadTool
        var function = strict["function"] as! [String: Any]
        function["strict"] = true; strict["function"] = function
        c.expect("strict schema guarantee is not invented", rejected(["tools": [strict]]))
        c.expect("unsupported message field refused", rejected(["messages": [user.merging(["name": "extra"]) { _, new in new }]]))
        let dev = try parse(["messages": [["role": "system", "content": "One"],
            ["role": "developer", "content": "Two"], user]])
        c.equal("initial instructions preserved", dev.messages.first?.content, "One\n\nTwo")
        return c.report()
    }

    static func openAIToolOutput() throws -> CheckReport {
        var c = CheckBuilder("openai-tool-output")
        let tools = try OpenAIDialect.conversation(["messages": [["role": "user", "content": "hi"]],
            "tools": [openAIReadTool]], contextLimit: 65_536).tools
        func output(parallel: Bool = true, choice: GatewayDialect.ToolChoice = .auto) -> OpenAIOutput {
            OpenAIOutput(tools: tools, choice: choice, parallel: parallel)
        }
        func canonical(_ message: [String: Any]) throws -> Data {
            try JSONSerialization.data(withJSONObject: message, options: [.sortedKeys])
        }
        let complete = output()
        _ = complete.consume(ToolCallSplitter.parseAll(proseThenCall, tools: tools.map { $0.schema }, idFactory: countingIDs()))
        c.equal("tool finish reason", complete.finishReason("stop"), "tool_calls")
        c.equal("typed argument is JSON, not XML", complete.calls.first?.inputJSON, #"{"path":"hello.txt","start_line":1}"#)
        let expected = try canonical(complete.message)
        let chars = Array(proseThenCall)
        for split in 0...chars.count {
            let parser = ToolCallSplitter(tools: tools.map { $0.schema }, idFactory: countingIDs())
            let streamed = output()
            _ = streamed.consume(parser.push(String(chars[..<split])))
            _ = streamed.consume(parser.push(String(chars[split...])))
            _ = streamed.consume(parser.flush())
            c.expect("stream matches whole at split \(split)", try canonical(streamed.message) == expected)
        }
        let parser = ToolCallSplitter(tools: tools.map { $0.schema }, idFactory: countingIDs())
        let partial = output()
        let prefix = "<tool_call>\n<function=read_file>\n<parameter=path>\nhello.txt\n</parameter>"
        let provisional = partial.consume(parser.push(prefix))
        c.expect("partial call never published", partial.calls.isEmpty && provisional.allSatisfy { $0["tool_calls"] == nil })
        _ = partial.consume(parser.flush())
        c.expect("truncation explicitly fails", partial.error != nil && partial.calls.isEmpty)
        let single = output(parallel: false)
        _ = single.consume(ToolCallSplitter.parseAll(oneCall + oneCall, tools: tools.map { $0.schema }, idFactory: countingIDs()))
        c.expect("parallel false exposes exactly one call", single.calls.count == 1 && single.finishedSingleCall)
        let multiple = output()
        let deltas = multiple.consume(ToolCallSplitter.parseAll(oneCall + oneCall, tools: tools.map { $0.schema }, idFactory: countingIDs()))
        let indices = deltas.compactMap { ($0["tool_calls"] as? [[String: Any]])?.first?["index"] as? Int }
        c.equal("parallel call indices", indices, [0, 1])
        c.expect("parallel IDs distinct", multiple.calls.count == 2 && multiple.calls[0].id != multiple.calls[1].id)
        let required = output(choice: .required)
        _ = required.consume([.text("I forgot to call it.")]); _ = required.finishReason("stop")
        c.expect("required cannot silently degrade to text", required.error != nil)
        let unknown = output()
        _ = unknown.consume([.toolCall(ParsedToolCall(id: "bad", name: "undeclared", arguments: [:]))])
        c.expect("undeclared tool not exposed", unknown.error != nil && unknown.calls.isEmpty)
        let reasoning = output()
        _ = reasoning.reasoningDelta("Private deliberation.")
        _ = reasoning.consume([.text("Answer.")])
        c.equal("reasoning separate from answer", reasoning.message["content"] as? String, "Answer.")
        c.equal("reasoning wire field", reasoning.message["reasoning_content"] as? String, "Private deliberation.")
        // Reassemble the actual Chat Completions argument deltas, not just the
        // final parser object. Clients must see file contents before </parameter>.
        for split in 0...chars.count {
            let parser = ToolCallSplitter(tools: tools.map { $0.schema }, idFactory: countingIDs())
            let output = OpenAIOutput(tools: tools, choice: .required, parallel: true,
                streamToolArguments: true, allowLengthTruncation: true)
            let events = output.consume(parser.push(String(chars[..<split])))
                + output.consume(parser.push(String(chars[split...]))) + output.consume(parser.flush())
            let wire = events.flatMap { $0["tool_calls"] as? [[String: Any]] ?? [] }
            let arguments = wire.compactMap { ($0["function"] as? [String: Any])?["arguments"] as? String }.joined()
            c.equal("wire arguments at split \(split)", arguments, complete.calls[0].inputJSON)
            c.equal("identity emitted once at split \(split)", wire.filter { $0["id"] != nil }.count, 1)
        }
        let stringShapes: [(String, JSONValue)] = [
            ("scalar", .object(["type": .string("string")])),
            ("nullable anyOf", .object(["anyOf": .array([
                .object(["type": .string("string")]), .object(["type": .string("null")])])])),
            ("nullable type array", .object(["type": .array([.string("string"), .string("null")])])),
            ("null first type array", .object(["type": .array([.string("null"), .string("string")])])),
        ]
        for (label, shape) in stringShapes {
            let definition = ToolDefinition(name: "read_file", description: "", parameters: .object([
                "type": .string("object"), "properties": .object(["path": shape])]))
            let longParser = ToolCallSplitter(tools: [definition.schema], idFactory: countingIDs())
            let longOutput = OpenAIOutput(tools: [definition], choice: .required, parallel: true,
                streamToolArguments: true, allowLengthTruncation: true)
            _ = longOutput.consume(longParser.push("<tool_call><function=read_file><parameter=path>\n"))
            let span = "a\\\"\t🙂\n"
            var fragments = 0
            for _ in 0..<16_000 {
                let deltas = longOutput.consume(longParser.push(span))
                fragments += deltas.count
            }
            c.expect("\(label): large argument streams before its closing tag", fragments > 15_000 && longOutput.calls.isEmpty)
            _ = longOutput.consume(longParser.flush())
            c.equal("\(label): truncated argument ends with length", longOutput.finishReason("length"), "length")
            c.expect("\(label): length is not a server error or executable completion", longOutput.error == nil && longOutput.calls.isEmpty)
            let pending = (longOutput.message["tool_calls"] as? [[String: Any]])?.first?["function"] as? [String: Any]
            c.equal("\(label): truncated wire preserves every stable string byte", pending?["arguments"] as? String,
                "{\"path\":\"" + String(JSONValue.quote(String(repeating: span, count: 16_000)).dropFirst().dropLast()))
        }
        let cappedBeforeCall = OpenAIOutput(tools: tools, choice: .required, parallel: true,
            streamToolArguments: true, allowLengthTruncation: true)
        c.equal("budget before required call is still length", cappedBeforeCall.finishReason("length"), "length")
        c.expect("budget exhaustion is not tool refusal", cappedBeforeCall.error == nil)
        let invalid = OpenAIOutput(tools: tools, choice: .required, parallel: true,
            streamToolArguments: true, allowLengthTruncation: true)
        c.expect("undeclared provisional name is not sent", invalid.consume([.toolInputStart(id: "bad", name: "absent")]).isEmpty)
        _ = invalid.finishReason("length")
        c.expect("length cannot hide an undeclared tool", invalid.error != nil)
        return c.report()
    }

    static func prefillProgress() -> CheckReport {
        var c = CheckBuilder("prefill-progress")
        var lines: [String] = []
        let progress = PrefillProgressReporter(quietBelowTokens: 2048, maxChunk: 256) { lines.append($0) }
        progress.report(done: 0, total: 50_000, elapsed: 0)
        progress.report(done: 1000, total: 50_000, elapsed: 10)
        c.expect("below-quarter progress is visible", lines.last?.contains("1000/50000") == true)
        progress.report(done: 1100, total: 50_000, elapsed: 20)
        c.expect("ETA uses slow recent passes", lines.last?.contains("10 tok/s recently") == true)
        let count = lines.count
        progress.report(done: 1110, total: 50_000, elapsed: 21)
        c.equal("fast updates do not flood logs", lines.count, count)
        progress.report(done: 0, total: 50_000, elapsed: 0)
        progress.report(done: 500, total: 50_000, elapsed: 5)
        c.expect("same-sized retry resets elapsed sample", lines.last?.contains("100 tok/s recently") == true)
        progress.report(done: 10, total: 200, elapsed: 30, base: 30_000)
        c.expect("slow short restored suffix is visible", lines.last?.contains("10/200") == true)
        return c.report()
    }

    static func openAIContextBudget() throws -> CheckReport {
        var c = CheckBuilder("openai-context-budget")
        let ordinary = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 10,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 30, vision: .off, simulated: true)
        let hermes = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 10,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 30, vision: .off,
            maxContextTokens: 65_536, simulated: true)
        c.equal("ordinary planning default remains unchanged", ordinary.maxContextTokens, 32_768)
        c.equal("library request default remains unchanged", PlanRequest().maxContextTokens, 32_768)
        c.equal("fixed footprint still includes only default state", ContextPolicy.tokensInFixedFootprint, 32_768)
        c.equal("default has no additional charge", Planner.extraContextStateGB(maxContextTokens: ordinary.maxContextTokens), 0)
        c.expect("larger context charged before pool allocation", hermes.slots < ordinary.slots)
        c.expect("larger context has explicit active-state charge", Planner.extraContextStateGB(maxContextTokens: hermes.maxContextTokens) > 0)
        c.equal("default has no added transient reserve", Planner.extraContextMemoryGB(maxContextTokens: ordinary.maxContextTokens), 0)
        c.expect("larger context also reserves the measured transient gap",
            Planner.extraContextMemoryGB(maxContextTokens: hermes.maxContextTokens)
                - Planner.extraContextStateGB(maxContextTokens: hermes.maxContextTokens) > 0.8)
        c.expect("insufficient auto memory refuses the larger context", (try? Planner.plan(
            expertsPerLayer: nil, poolGB: nil, memoryGB: nil,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 10,
            vision: .off, maxContextTokens: 65_536, simulated: true)) == nil)
        c.expect("undersized explicit target refuses the larger context", (try? Planner.plan(
            expertsPerLayer: nil, poolGB: nil, memoryGB: 8.1,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 30,
            vision: .off, maxContextTokens: 65_536, simulated: true)) == nil)
        let governor = GovernorPolicy.Inputs(currentSlots: hermes.slots, availableGB: 20,
            ramGB: 51.5, workingSetGB: 40.2, maxContextTokens: hermes.maxContextTokens)
        c.equal("governor replan retains selected context", GovernorPolicy.desiredPlan(governor)?.maxContextTokens, 65_536)
        var starved = governor; starved.availableGB = 0
        c.expect("unaffordable context refuses a new allocation", GovernorPolicy.desiredSlots(starved) == nil)
        c.equal("unaffordable context already at the floor holds", GovernorPolicy.decide(starved), .hold)
        starved.currentSlots = Geometry.floorSlots + 1
        c.equal("unaffordable context sheds cache to its floor", GovernorPolicy.decide(starved),
            .resize(slots: Geometry.floorSlots, reason: "context plan unavailable"))
        c.expect("both expected peaks stay below requested target", ordinary.expectedPeakGB <= 10 && hermes.expectedPeakGB <= 10)
        c.expect("reuse bound does not exceed request context", hermes.prefixCacheTokens <= hermes.maxContextTokens)
        c.expect("the Hermes minimum is actually accepted", ContextPolicy.validationError(64_000) == nil)
        c.expect("the pinned model limit is accepted", ContextPolicy.validationError(ContextPolicy.modelLimit) == nil)
        c.expect("the ceiling still rejects windows past the model limit",
            ContextPolicy.validationError(ContextPolicy.modelLimit + 1) != nil)
        return c.report()
    }
}
