// T0: the Anthropic Messages API contract, on values. No socket, no engine.
//
// Claude Code is the client this dialect exists for, so the fixtures are the
// shapes Claude Code 2.1.270 sends: system blocks led by its attribution line,
// tools with only a name, description and input schema, `<system-reminder>`
// text blocks, a trailing `system` message with the environment, adaptive
// thinking with its display omitted, and a tool loop whose thinking blocks
// come back empty with their signatures. What is left for the live gates is
// that the server wires these functions to a socket and a model.

import Foundation
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    static var anthropicChecks: [Check] {
        [
            Check("anthropic-request", tier: .t0) { anthropicRequest() },
            Check("anthropic-logical-turns", tier: .t0) { anthropicLogicalTurns() },
            Check("anthropic-events", tier: .t0) { anthropicEvents() },
            Check("think-split-stream", tier: .t0) { thinkSplitStream() },
            Check("serving-edges", tier: .t0) { servingEdges() },
        ]
    }

    /// Small serving rules the coding-agent review found: numbers a model
    /// writes into tool arguments, stops that must not end reasoning, and the
    /// request target a refused request is answered by.
    static func servingEdges() -> CheckReport {
        var c = CheckBuilder("serving-edges")
        typealias T = ToolCallSplitter
        c.equal("an integer argument stays an integer", T.coerce("\n12\n", as: .integer), .int(12))
        c.equal("an integral float is an integer", T.coerce("3.0", as: .integer), .int(3))
        c.equal("an integer too large for Int stays a number instead of trapping", T.coerce("1e20", as: .integer), .double(1e20))
        c.equal("an infinite integer is text", T.coerce("inf", as: .integer), .string("inf"))
        c.equal("an infinite number is text, since JSON has none", T.coerce("-infinity", as: .number), .string("-infinity"))
        c.equal("NaN is text", T.coerce("nan", as: .number), .string("nan"))
        c.equal("a fraction is a number", T.coerce("0.25", as: .number), .double(0.25))

        let reply = "Counting 7 and more. 7</think>\n\nOne 7 two"
        c.equal("stops apply after the reasoning when the prompt opened it",
                Engine.answerStart(reply, reasoningOpen: true).flatMap { Engine.stopIndex(reply, [" 7"], from: $0) }
                    .map { reply.distance(from: reply.startIndex, to: $0) }, reply.distance(from: reply.startIndex,
                        to: reply.range(of: "One 7")!.lowerBound) + 3)
        c.expect("reasoning that never closes has no answer to stop",
                 Engine.answerStart("still 7 thinking", reasoningOpen: true) == nil)
        c.equal("without reasoning, stops apply from the start",
                Engine.stopIndex(reply, [" 7"], from: Engine.answerStart(reply, reasoningOpen: false))
                    .map { reply.distance(from: reply.startIndex, to: $0) }, 8)

        c.equal("the target of a refused request is read from its first line",
                Server.requestTarget("POST /v1/messages?beta=true HTTP/1.1\r\nContent-Length: 99"), "/v1/messages?beta=true")
        c.expect("a head without a target has none", Server.requestTarget("garbage") == nil)
        return c.report()
    }

    /// Every dialect that streams reasoning splits it with `ThinkSplitter`;
    /// the streamed answer must equal the one `split` gives for the whole text,
    /// wherever the deltas break.
    static func thinkSplitStream() -> CheckReport {
        var c = CheckBuilder("think-split-stream")
        let text = "Seventeen times twenty-three.</think>\n\n391\n\nDone."
        let whole = ThinkSplitter.split(text)
        c.equal("the whole text splits at the tag without the newlines after it", [whole.0, whole.1],
                ["Seventeen times twenty-three.", "391\n\nDone."])
        let scalars = Array(text.unicodeScalars)
        var agree = true
        for size in 1 ... 12 {
            let splitter = ThinkSplitter()
            var think = ""
            var answer = ""
            var start = 0
            while start < scalars.count {
                let piece = String(String.UnicodeScalarView(scalars[start ..< min(start + size, scalars.count)]))
                let (t, a) = splitter.push(piece)
                think += t
                answer += a
                start += size
            }
            let (t, a) = splitter.flush()
            think += t
            answer += a
            if think != whole.0 || answer != whole.1 {
                agree = false
                c.expect("deltas of \(size) characters split like the whole text", false, "\(think.debugDescription) | \(answer.debugDescription)")
            }
        }
        c.expect("deltas of every size from 1 to 12 split like the whole text", agree)
        let late = ThinkSplitter()
        let parts = ["a</think>", "\n", "\n", "b\n", "\nc"].map { late.push($0).1 }
        c.equal("newlines after the answer starts are kept", parts.joined(), "b\n\nc")
        let open = ThinkSplitter()
        let first = open.push("still thinking")
        let rest = open.flush()
        c.equal("reasoning that never closes is all thinking", [first.0 + rest.0, first.1 + rest.1], ["still thinking", ""])
        return c.report()
    }

    static let anthropicImage: [String: Any] = [
        "type": "image", "source": ["type": "base64", "media_type": "image/png", "data": "iVBORw0KGgo="],
    ]

    static var claudeCodeTools: [[String: Any]] {
        let bash: [String: Any] = [
            "name": "Bash", "description": "Executes a given bash command.",
            "input_schema": ["type": "object", "additionalProperties": false, "required": ["command"],
                             "properties": ["command": ["type": "string", "description": "The command to execute"],
                                            "timeout": ["type": "number"]]] as [String: Any],
        ]
        let read: [String: Any] = [
            "name": "Read", "description": "Reads a file from the local filesystem.",
            "input_schema": ["type": "object", "required": ["file_path"],
                             "properties": ["file_path": ["type": "string"], "offset": ["type": "integer"]]] as [String: Any],
        ]
        let write: [String: Any] = [
            "name": "Write", "description": "Writes a file to the local filesystem.",
            "input_schema": ["type": "object", "required": ["file_path", "content"],
                             "properties": ["file_path": ["type": "string"], "content": ["type": "string"]]] as [String: Any],
        ]
        return [bash, read, write]
    }

    /// A Claude Code first turn, reduced to the shapes that matter.
    static func claudeCodeBody(extra: [String: Any] = [:]) -> [String: Any] {
        let system: [[String: Any]] = [
            ["type": "text", "text": "x-anthropic-billing-header: cc_version=2.1.270.f7f; cc_entrypoint=sdk-cli;"],
            ["type": "text", "text": "You are a Claude agent.", "cache_control": ["type": "ephemeral"]],
            ["type": "text", "text": "Use the tools to help the user.", "cache_control": ["type": "ephemeral"]],
        ]
        let user: [String: Any] = ["role": "user", "content": [
            ["type": "text", "text": "<system-reminder>\nToday is a test.\n</system-reminder>"],
            ["type": "text", "text": "Create hello.txt"],
        ]]
        let environment: [String: Any] = ["role": "system", "content": [
            ["type": "text", "text": "# Environment\nPrimary working directory: /tmp/work",
             "cache_control": ["type": "ephemeral"]],
        ]]
        var body: [String: Any] = [
            "model": "qwen3.8-flash-next:4bit",
            "max_tokens": 32000,
            "stream": true,
            "system": system,
            "messages": [user, environment],
            "tools": claudeCodeTools,
            "thinking": ["type": "adaptive", "display": "omitted"],
            "output_config": ["effort": "high"],
            "context_management": ["edits": [["type": "clear_thinking_20251015", "keep": "all"]]],
            "metadata": ["user_id": "{\"session_id\":\"s\"}"],
        ]
        for (k, v) in extra { body[k] = v }
        return body
    }

    /// A later turn of the same conversation: a tool loop with two calls
    /// answered out of order, one with a picture and one with an error.
    static func claudeCodeLoop() -> [String: Any] {
        let thought = "I will write the file, then list it."
        let assistant: [String: Any] = ["role": "assistant", "content": [
            ["type": "thinking", "thinking": "", "signature": AnthropicDialect.signature(for: thought)],
            ["type": "text", "text": "Writing it now."],
            ["type": "tool_use", "id": "toolu_1", "name": "Write",
             "input": ["file_path": "hello.txt", "content": "SLOTSTREAM OK"]],
            ["type": "tool_use", "id": "toolu_2", "name": "Bash", "input": ["command": "ls", "timeout": 5000]],
        ]]
        let results: [String: Any] = ["role": "user", "content": [
            ["type": "tool_result", "tool_use_id": "toolu_2", "content": [
                ["type": "text", "text": "hello.txt"], anthropicImage]],
            ["type": "tool_result", "tool_use_id": "toolu_1", "content": "permission denied", "is_error": true],
            ["type": "text", "text": "Keep going."],
        ]]
        var body = claudeCodeBody()
        body["messages"] = (body["messages"] as! [[String: Any]]) + [assistant, results]
        return body
    }

    static func anthropicRequest() -> CheckReport {
        var c = CheckBuilder("anthropic-request")
        func rejected(_ body: [String: Any], _ fragment: String) -> Bool {
            do { _ = try AnthropicDialect.parse(body); return false }
            catch let f as AnthropicDialect.Failure { return f.message.contains(fragment) && f.type == "invalid_request_error" }
            catch { return false }
        }
        func with(_ extra: [String: Any]) -> [String: Any] { claudeCodeBody(extra: extra) }

        do {
            let r = try AnthropicDialect.parse(claudeCodeBody())
            c.equal("attribution line dropped, system blocks joined", r.messages.first?.content,
                    "You are a Claude agent.\n\nUse the tools to help the user.")
            c.equal("roles in template order", r.messages.map(\.role), ["system", "user", "user"])
            c.equal("text blocks of one message join", r.messages[1].content,
                    "<system-reminder>\nToday is a test.\n</system-reminder>\n\nCreate hello.txt")
            c.equal("a system message after the conversation starts renders as user text", r.messages[2].content,
                    "# Environment\nPrimary working directory: /tmp/work")
            c.equal("tools kept in order", r.tools.map(\.name), ["Bash", "Read", "Write"])
            c.equal("tool schema typed", r.tools.first?.schema.params["command"], .string)
            c.expect("adaptive thinking at high effort thinks at the top level", r.thinking && r.effort == "xhigh")
            c.expect("display omitted hides thinking text", !r.showThinking)
            c.equal("max_tokens read", r.maxTokens, 32000)
            c.expect("stream, auto choice and parallel calls read", r.stream && r.choice == .auto && r.parallel)
            c.equal("known fields are not reported as ignored", r.ignored, [])
            let later = try AnthropicDialect.parse(with(["speed": "fast", "inference_geo": "us"]))
            c.equal("unknown fields are ignored by name, sorted", later.ignored, ["inference_geo", "speed"])
        } catch { c.expect("Claude Code first turn parses", false, "\(error)") }

        do {
            let r = try AnthropicDialect.parse(claudeCodeLoop())
            c.equal("tool loop roles", r.messages.map(\.role), ["system", "user", "user", "assistant", "tool", "tool", "user"])
            let assistant = r.messages[3]
            c.equal("assistant text kept", assistant.content, "Writing it now.")
            c.equal("omitted thinking comes back from its signature", assistant.reasoning,
                    "I will write the file, then list it.")
            c.equal("calls attached in order", assistant.toolCalls.map(\.id), ["toolu_1", "toolu_2"])
            c.equal("call input typed", assistant.toolCalls.last?.arguments["timeout"], .int(5000))
            c.equal("results follow call order, not arrival order", r.messages[4].toolCallId, "toolu_1")
            c.equal("result names its tool", r.messages[4].toolName, "Write")
            c.equal("an error result says so", r.messages[4].content, "Error: permission denied")
            c.equal("a picture in a result is kept", r.messages[5].images, ["data:image/png;base64,iVBORw0KGgo="])
            c.equal("result text kept", r.messages[5].content, "hello.txt")
            c.equal("text after the results is a user turn", r.messages[6].content, "Keep going.")
            c.expect("pictures noticed", r.hasImages)
        } catch { c.expect("Claude Code tool loop parses", false, "\(error)") }

        // Thinking and effort.
        do {
            func parse(_ extra: [String: Any]) throws -> AnthropicDialect.Request {
                var body = claudeCodeBody(extra: extra)
                if extra["thinking"] is NSNull { body.removeValue(forKey: "thinking") }
                if extra["output_config"] is NSNull { body.removeValue(forKey: "output_config") }
                return try AnthropicDialect.parse(body)
            }
            let none = try parse(["thinking": NSNull()])
            c.expect("no thinking field means no thinking", !none.thinking && none.showThinking)
            let off = try parse(["thinking": ["type": "disabled"]])
            c.expect("disabled thinking is off", !off.thinking)
            let small = try parse(["thinking": ["type": "enabled", "budget_tokens": 2000], "output_config": NSNull()])
            c.expect("a small budget thinks at low effort", small.thinking && small.effort == "low" && small.showThinking)
            let budget = try parse(["thinking": ["type": "enabled", "budget_tokens": 8000], "output_config": NSNull()])
            c.equal("a middle budget thinks at medium effort", budget.effort, "medium")
            let explicit = try parse(["thinking": ["type": "enabled", "budget_tokens": 2000], "output_config": ["effort": "max"]])
            c.equal("an explicit effort wins over the budget", explicit.effort, "xhigh")
            let low = try parse(["output_config": ["effort": "low"]])
            c.expect("adaptive at low effort still thinks, at low effort", low.thinking && low.effort == "low")
            let shown = try parse(["thinking": ["type": "adaptive", "display": "summarized"]])
            c.expect("summarized thinking is shown", shown.showThinking)
            let newer = try parse(["thinking": ["type": "adaptive", "display": "updates"]])
            c.expect("a display mode added later is shown, not refused", newer.showThinking && newer.thinking)
        } catch { c.expect("thinking variants parse", false, "\(error)") }

        // Tool choice and tool types.
        do {
            let any = try AnthropicDialect.parse(with(["tool_choice": ["type": "any", "disable_parallel_tool_use": true]]))
            c.expect("any forces a call, and parallel calls can be turned off", any.choice == .required && !any.parallel)
            let named = try AnthropicDialect.parse(with(["tool_choice": ["type": "tool", "name": "Read"]]))
            c.expect("a named tool is forced", named.choice == .tool("Read"))
            let none = try AnthropicDialect.parse(with(["tool_choice": ["type": "none"]]))
            c.expect("none disables tools", none.choice == .disabled)
            let hosted = try AnthropicDialect.parse(with(["tools": claudeCodeTools + [
                ["type": "web_search_20250305", "name": "web_search", "max_uses": 5],
                ["type": "custom", "name": "Note", "input_schema": ["type": "object"], "strict": true,
                 "defer_loading": false, "cache_control": ["type": "ephemeral"]],
            ]]))
            c.equal("hosted tools are dropped, typed custom tools kept", hosted.tools.map(\.name), ["Bash", "Read", "Write", "Note"])
            let advisor = try AnthropicDialect.parse(with(["tools": claudeCodeTools + [["type": "advisor_20260301", "name": "advisor"]]]))
            c.equal("the hosted advisor tool is dropped too", advisor.tools.count, claudeCodeTools.count)
            let counted = try AnthropicDialect.parse(["model": "m", "messages": [["role": "user", "content": "hi"]]], counting: true)
            c.expect("a token count needs no max_tokens", counted.maxTokens == 0 && counted.messages.count == 1)
            let prefilled = try AnthropicDialect.parse(["model": "m", "messages": [
                ["role": "user", "content": "hi"], ["role": "assistant", "content": "Hello"]]], counting: true)
            c.equal("a token count may end with an assistant turn", prefilled.messages.map(\.role), ["user", "assistant"])
            let stops = try AnthropicDialect.parse(with(["stop_sequences": ["END", ""], "temperature": 0.2, "top_p": 0.9, "top_k": 10]))
            c.equal("stop sequences read, empty ones dropped", stops.stopSequences, ["END"])
            c.expect("sampling read", stops.temperature == 0.2 && stops.topP == 0.9 && stops.topK == 10)
        } catch { c.expect("choices and tool types parse", false, "\(error)") }

        // Content the API allows and this server reads.
        do {
            let document: [String: Any] = ["type": "document", "title": "Notes",
                                           "source": ["type": "text", "media_type": "text/plain", "data": "gate code MAPLE"]]
            let body: [String: Any] = [
                "model": "m", "max_tokens": 10,
                "system": "x-anthropic-billing-header: cc_version=1;\nYou are brief.",
                "messages": [
                    ["role": "system", "content": "Answer in English."],
                    ["role": "user", "content": [document, anthropicImage, ["type": "text", "text": "What is the code?"]]],
                    ["role": "assistant", "content": "It is"],
                    ["role": "assistant", "content": [["type": "redacted_thinking", "data": "abc"], ["type": "text", "text": " MAPLE."]]],
                    ["role": "user", "content": "Thanks."],
                ],
            ]
            let r = try AnthropicDialect.parse(body)
            c.equal("a leading system message joins the system prompt, attribution dropped", r.messages.first?.content,
                    "You are brief.\n\nAnswer in English.")
            c.equal("a text document is read inline with its title", r.messages[1].content,
                    "Notes\n\ngate code MAPLE\n\nWhat is the code?")
            c.equal("a user picture is kept", r.messages[1].images.count, 1)
            c.equal("consecutive assistant messages are one turn, redacted thinking skipped", r.messages[2].content, "It is MAPLE.")
            c.equal("roles", r.messages.map(\.role), ["system", "user", "assistant", "user"])
            let bare = try AnthropicDialect.parse(["model": "m", "max_tokens": 1,
                "system": "x-anthropic-billing-header: cc_version=1;", "messages": [["role": "user", "content": "hi"]]])
            c.equal("an attribution-only system prompt leaves no system turn", bare.messages.map(\.role), ["user"])
        } catch { c.expect("documents, pictures and merged turns parse", false, "\(error)") }

        // Refusals name their cause.
        var missingMax = claudeCodeBody(); missingMax.removeValue(forKey: "max_tokens")
        c.expect("max_tokens is required", rejected(missingMax, "max_tokens: field required"))
        var missingModel = claudeCodeBody(); missingModel.removeValue(forKey: "model")
        c.expect("model is required", rejected(missingModel, "model: field required"))
        c.expect("code execution containers are refused", rejected(with(["container": "c1"]), "container"))
        c.expect("remote MCP servers are refused", rejected(with(["mcp_servers": [["type": "url"]]]), "mcp_servers"))
        c.expect("constrained output is refused",
                 rejected(with(["output_config": ["format": ["type": "json_schema", "schema": [:]]]]), "output_config.format"))
        c.expect("an unknown effort is refused", rejected(with(["output_config": ["effort": "extreme"]]), "output_config.effort"))
        c.expect("an unknown thinking type is refused", rejected(with(["thinking": ["type": "sometimes"]]), "thinking.type"))
        c.expect("enabled thinking needs a budget", rejected(with(["thinking": ["type": "enabled"]]), "budget_tokens"))
        c.expect("an Anthropic-defined client tool is refused",
                 rejected(with(["tools": [["type": "bash_20250124", "name": "bash"]]]), "bash_20250124"))
        c.expect("duplicate tool names are refused", rejected(with(["tools": claudeCodeTools + [claudeCodeTools[0]]]), "unique"))
        c.expect("a tool needs a schema", rejected(with(["tools": [["name": "x"]]]), "input_schema"))
        c.expect("a forced tool must exist", rejected(with(["tool_choice": ["type": "tool", "name": "Nope"]]), "tool_choice.name"))
        // Claude Code's WebSearch sends only the hosted tool and forces it.
        c.expect("forcing a hosted tool says it cannot run here",
                 rejected(with(["tools": [["type": "web_search_20250305", "name": "web_search"]],
                                "tool_choice": ["type": "tool", "name": "web_search"]]), "runs on Anthropic's servers"))
        c.expect("any needs a tool", rejected(with(["tools": [], "tool_choice": ["type": "any"]]), "needs at least one tool"))
        c.expect("stop sequences must be text", rejected(with(["stop_sequences": [1]]), "stop_sequences"))
        c.expect("top_p above 1 is refused", rejected(with(["top_p": 1.5]), "top_p"))
        c.expect("max_tokens must be positive", rejected(with(["max_tokens": 0]), "max_tokens"))
        let urlImage: [String: Any] = ["type": "image", "source": ["type": "url", "url": "https://example.com/a.png"]]
        c.expect("image URLs are refused, nothing is fetched",
                 rejected(with(["messages": [["role": "user", "content": [urlImage]]]]), "image URLs"))
        let badMedia: [String: Any] = ["type": "image", "source": ["type": "base64", "media_type": "image/tiff", "data": "x"]]
        c.expect("an unsupported picture type is refused",
                 rejected(with(["messages": [["role": "user", "content": [badMedia]]]]), "media_type"))
        // A refused PDF would end the turn, and Claude Code would send it again
        // on every later one; the model is told instead.
        let pdf: [String: Any] = ["type": "document", "title": "Spec", "source": ["type": "base64", "media_type": "application/pdf", "data": "x"]]
        let pdfResult: [String: Any] = ["type": "tool_result", "tool_use_id": "t1", "content": [pdf]]
        let readCall: [String: Any] = ["role": "assistant", "content": [["type": "tool_use", "id": "t1", "name": "Read", "input": ["file_path": "a.pdf"]]]]
        do {
            let r = try AnthropicDialect.parse(with(["messages": [["role": "user", "content": [pdf, ["type": "text", "text": "Summarize"]]],
                                                                   readCall, ["role": "user", "content": [pdfResult]]]]))
            c.expect("a PDF becomes a note naming it and the way to read it",
                     r.messages[1].content.contains("'Spec' is not shown") && r.messages[1].content.contains("pdftotext"))
            c.expect("a PDF in a tool result becomes the same note", r.messages.last?.content.contains("is not shown") == true)
        } catch { c.expect("PDF documents parse as notes", false, "\(error)") }

        // Claude Code's late tool announcements and tool search results.
        do {
            let announced: [String: Any] = ["role": "system", "content": [
                ["type": "text", "text": "New tools are available."],
                ["type": "tool_addition", "tool": ["type": "tool_reference", "name": "mcp__docs__search"]],
                ["type": "tool_removal", "tool": ["type": "tool_reference", "name": "mcp__old__x"]],
            ]]
            let searchCall: [String: Any] = ["role": "assistant", "content": [["type": "tool_use", "id": "t2", "name": "ToolSearch", "input": ["query": "docs"]]]]
            let found: [String: Any] = ["role": "user", "content": [["type": "tool_result", "tool_use_id": "t2", "content": [
                ["type": "tool_reference", "tool_name": "mcp__docs__search"],
                ["type": "search_result", "title": "Guide", "source": "https://example.com/g", "content": [["type": "text", "text": "Use launch."]]],
            ]]]]
            let r = try AnthropicDialect.parse(with(["messages": [["role": "user", "content": "go"], announced, searchCall, found]]))
            c.equal("tool additions and removals leave only the text", r.messages[safe: 2]?.content, "New tools are available.")
            c.equal("tool references and search results read as text", r.messages.last?.content,
                    "Tool available: mcp__docs__search\nGuide\nSource: https://example.com/g\nUse launch.")
        } catch { c.expect("tool announcements and search results parse", false, "\(error)") }
        c.expect("other blocks in a system message are named",
                 rejected(with(["messages": [["role": "user", "content": "go"],
                                             ["role": "system", "content": [["type": "image", "source": [:]]]]]]), "not 'image'"))
        let call: [String: Any] = ["role": "assistant", "content": [["type": "tool_use", "id": "t1", "name": "Bash", "input": ["command": "ls"]]]]
        c.expect("a call without a result is refused",
                 rejected(with(["messages": [["role": "user", "content": "go"], call, ["role": "user", "content": "next"]]]), "without tool_result"))
        c.expect("a conversation ending in a call is refused",
                 rejected(with(["messages": [["role": "user", "content": "go"], call]]), "no tool_result"))
        let stray: [String: Any] = ["role": "user", "content": [["type": "tool_result", "tool_use_id": "t9", "content": "x"]]]
        c.expect("a result for an unknown call is refused",
                 rejected(with(["messages": [["role": "user", "content": "go"], call, stray]]), "tool_result must answer"))
        c.expect("continuing a partial assistant reply is refused",
                 rejected(with(["messages": [["role": "user", "content": "go"], ["role": "assistant", "content": "Sure"]]]), "last message"))
        c.expect("an unknown role is refused", rejected(with(["messages": [["role": "tool", "content": "x"]]]), "role"))
        c.expect("an empty conversation is refused", rejected(with(["messages": []]), "at least one message"))
        c.expect("a conversation without a user message is refused",
                 rejected(with(["messages": [["role": "system", "content": "x"]]]), "at least one user message"))
        let serverTool: [String: Any] = ["role": "assistant", "content": [["type": "server_tool_use", "id": "s", "name": "web_search", "input": [:]]]]
        c.expect("server tool history is refused",
                 rejected(with(["messages": [["role": "user", "content": "go"], serverTool, ["role": "user", "content": "x"]]]), "server_tool_use"))
        let reused: [String: Any] = ["role": "assistant", "content": [
            ["type": "tool_use", "id": "t1", "name": "Bash", "input": [:]],
            ["type": "tool_use", "id": "t1", "name": "Read", "input": [:]]]]
        c.expect("a reused call id is refused",
                 rejected(with(["messages": [["role": "user", "content": "go"], reused]]), "used twice"))
        c.expect("non-object input is refused",
                 rejected(with(["messages": [["role": "user", "content": "go"],
                    ["role": "assistant", "content": [["type": "tool_use", "id": "t1", "name": "Bash", "input": "ls"]]]]]), "input"))

        // The error surface.
        c.equal("errors use Anthropic's shape", (AnthropicDialect.Failure("bad").body["error"] as? [String: String])?["type"],
                "invalid_request_error")
        c.equal("the body is typed as an error", AnthropicDialect.Failure("bad").body["type"] as? String, "error")
        c.equal("overflow wording Claude Code compacts on", AnthropicDialect.promptTooLong(tokens: 40000, maximum: 32767),
                "prompt is too long: 40000 tokens > 32767 maximum")
        c.equal("status to error type", ["400 Bad Request", "404 Not Found", "413 Content Too Large", "503 Service Unavailable",
                                         "500 Internal Server Error"].map(AnthropicDialect.errorType(httpStatus:)),
                ["invalid_request_error", "not_found_error", "request_too_large", "overloaded_error", "api_error"])
        c.equal("only plain field names reach a header", Server.headerSafeFieldNames(["speed", "bad\r\nX-Evil: 1", "", "a.b-c_d"]),
                ["speed", "a.b-c_d"])
        c.equal("header names are capped", Server.headerSafeFieldNames((0 ..< 40).map { "f\($0)" }).count, 16)
        return c.report()
    }

    static func anthropicEvents() -> CheckReport {
        var c = CheckBuilder("anthropic-events")
        func decode(_ frame: String) -> (event: String, data: [String: Any])? {
            let lines = frame.components(separatedBy: "\n")
            guard lines.count == 4, lines[0].hasPrefix("event: "), lines[1].hasPrefix("data: "),
                  lines[2].isEmpty, lines[3].isEmpty,
                  let data = (try? JSONSerialization.jsonObject(with: Data(lines[1].dropFirst(6).utf8))) as? [String: Any]
            else { return nil }
            return (String(lines[0].dropFirst(7)), data)
        }

        let thought = "Plan: write, then check. ✓"
        let stream = AnthropicDialect.MessageStream(model: "qwen3.8-flash-next:4bit", showThinking: false, id: "msg_test")
        var frames: [String] = []
        frames += stream.start(promptTokens: 120)
        frames += stream.thinking("Plan: write, ")
        frames += stream.thinking("then check. ✓")
        frames += stream.text("Writing ")
        frames += stream.text("now.")
        frames += stream.toolUse(ParsedToolCall(id: "toolu_a", name: "Write",
            arguments: ["file_path": .string("hello.txt"), "content": .string("OK")], order: ["file_path", "content"]))
        let usage = AnthropicDialect.Usage(prompt: 120, cached: 100, output: 30)
        frames += stream.finish(engineReason: "stop", stopSequence: nil, usage: usage)
        let decoded = frames.compactMap(decode)
        c.equal("every frame is one well-formed event", decoded.count, frames.count)
        c.expect("each event names its own type", decoded.allSatisfy { $0.data["type"] as? String == $0.event })
        c.equal("event order", decoded.map(\.event), [
            "message_start", "ping",
            "content_block_start", "content_block_delta", "content_block_stop",
            "content_block_start", "content_block_delta", "content_block_delta", "content_block_stop",
            "content_block_start", "content_block_delta", "content_block_stop",
            "message_delta", "message_stop",
        ])
        let start = decoded.first?.data["message"] as? [String: Any]
        c.equal("the start reports the message id and model", start?["id"] as? String, "msg_test")
        c.equal("the start carries the whole prompt as input", (start?["usage"] as? [String: Any])?["input_tokens"] as? Int, 120)
        // Claude Code keeps a start's nonzero input when the final one is 0,
        // so a fully reused prompt must already say so at the start.
        let reusedStart = AnthropicDialect.MessageStream(model: "m").start(promptTokens: 120, reused: 120)
            .compactMap(decode).first?.data["message"] as? [String: Any]
        let reusedUsage = reusedStart?["usage"] as? [String: Any]
        c.equal("the start carries the reused split", [reusedUsage?["input_tokens"] as? Int, reusedUsage?["cache_read_input_tokens"] as? Int],
                [0, 120])
        c.expect("the start has no stop reason yet", start?["stop_reason"] is NSNull)
        let thinkingStart = decoded[2].data["content_block"] as? [String: Any]
        c.equal("thinking opens block 0", thinkingStart?["type"] as? String, "thinking")
        let signatureDelta = decoded[3].data["delta"] as? [String: Any]
        c.equal("omitted thinking streams only its signature", signatureDelta?["type"] as? String, "signature_delta")
        c.equal("the signature carries the reasoning",
                (signatureDelta?["signature"] as? String).flatMap(AnthropicDialect.reasoning(fromSignature:)), thought)
        c.equal("text opens block 1", decoded[5].data["index"] as? Int, 1)
        c.equal("text streams as text deltas", (decoded[6].data["delta"] as? [String: Any])?["text"] as? String, "Writing ")
        let toolStart = decoded[9].data["content_block"] as? [String: Any]
        c.equal("the call opens block 2 with its id and name", [toolStart?["id"] as? String, toolStart?["name"] as? String],
                ["toolu_a", "Write"])
        c.equal("the call input arrives whole, in emission order",
                (decoded[10].data["delta"] as? [String: Any])?["partial_json"] as? String,
                #"{"file_path":"hello.txt","content":"OK"}"#)
        let delta = decoded[12].data
        c.equal("a delivered call ends the turn as tool_use", (delta["delta"] as? [String: Any])?["stop_reason"] as? String, "tool_use")
        let finalUsage = delta["usage"] as? [String: Any]
        c.equal("usage splits the prompt into read and reused",
                [finalUsage?["input_tokens"] as? Int, finalUsage?["cache_read_input_tokens"] as? Int,
                 finalUsage?["cache_creation_input_tokens"] as? Int, finalUsage?["output_tokens"] as? Int],
                [20, 100, 0, 30])

        // The non-streaming message is the same content.
        let whole = stream.message(engineReason: "stop", stopSequence: nil, usage: usage)
        let content = whole["content"] as? [[String: Any]] ?? []
        c.equal("content block types", content.map { $0["type"] as? String ?? "" }, ["thinking", "text", "tool_use"])
        c.equal("omitted thinking text is empty", content.first?["thinking"] as? String, "")
        c.equal("text is whole", content[safe: 1]?["text"] as? String, "Writing now.")
        c.equal("tool input is an object", (content[safe: 2]?["input"] as? [String: Any])?["content"] as? String, "OK")
        c.equal("the message is typed", [whole["type"] as? String, whole["role"] as? String], ["message", "assistant"])

        // Stop reasons.
        func reason(_ engine: String, _ stop: String?, calls: Bool = false, show: Bool = true) -> [String: Any] {
            let s = AnthropicDialect.MessageStream(model: "m", showThinking: show)
            _ = s.text("x")
            if calls { _ = s.toolUse(ParsedToolCall(id: "t", name: "Bash", arguments: [:])) }
            return s.message(engineReason: engine, stopSequence: stop, usage: .init(prompt: 5, cached: 0, output: 1))
        }
        c.equal("a natural stop ends the turn", reason("stop", nil)["stop_reason"] as? String, "end_turn")
        c.equal("running out of room is max_tokens", reason("length", nil)["stop_reason"] as? String, "max_tokens")
        let stopped = reason("stop", "END")
        c.equal("a stop sequence is reported with its text",
                [stopped["stop_reason"] as? String, stopped["stop_sequence"] as? String], ["stop_sequence", "END"])
        c.equal("a call made before running out of room still ends as tool_use",
                reason("length", nil, calls: true)["stop_reason"] as? String, "tool_use")
        let windowed = AnthropicDialect.MessageStream(model: "m")
        _ = windowed.text("x")
        c.equal("a reply the window cut short says so",
                windowed.message(engineReason: "length", stopSequence: nil, usage: .init(prompt: 5, cached: 0, output: 1),
                                 windowLimited: true)["stop_reason"] as? String, "model_context_window_exceeded")
        c.equal("a window-limited reply that ended on its own is still end_turn",
                AnthropicDialect.MessageStream(model: "m").stopReason(engineReason: "stop", stopSequence: nil, windowLimited: true),
                "end_turn")

        // Keepalives: pings, except while hidden thinking is open.
        let quiet = AnthropicDialect.MessageStream(model: "m", showThinking: false)
        c.equal("before any block, the keepalive is a ping", decode(quiet.keepalive())?.event, "ping")
        _ = quiet.thinking("long reasoning")
        let hiddenKeepalive = decode(quiet.keepalive())
        c.equal("during hidden thinking, the keepalive is an empty thinking delta",
                [hiddenKeepalive?.event, (hiddenKeepalive?.data["delta"] as? [String: Any])?["type"] as? String,
                 (hiddenKeepalive?.data["delta"] as? [String: Any])?["thinking"] as? String],
                ["content_block_delta", "thinking_delta", ""])
        _ = quiet.text("answer")
        c.equal("once the answer streams, the keepalive is a ping again", decode(quiet.keepalive())?.event, "ping")
        let shownThinking = AnthropicDialect.MessageStream(model: "m", showThinking: true)
        _ = shownThinking.thinking("visible")
        c.equal("shown thinking keeps pings", decode(shownThinking.keepalive())?.event, "ping")
        c.expect("no stop sequence is null", reason("stop", nil)["stop_sequence"] is NSNull)

        // Shown thinking, and an error after the head went out.
        let visible = AnthropicDialect.MessageStream(model: "m", showThinking: true)
        let thinkingFrames = visible.thinking("abc").compactMap(decode)
        c.equal("shown thinking streams thinking deltas",
                (thinkingFrames.last?.data["delta"] as? [String: Any])?["thinking"] as? String, "abc")
        let failed = visible.fail(type: "api_error", message: "boom").compactMap(decode)
        c.equal("a late failure is one error event", failed.map(\.event), ["error"])
        c.equal("the error event carries type and message",
                (failed.first?.data["error"] as? [String: String]).map { [$0["type"], $0["message"]] }, ["api_error", "boom"])
        let afterFailure = visible.message(engineReason: "stop", stopSequence: nil, usage: .init(prompt: 1, cached: 0, output: 0))
        c.equal("an open block is not closed as complete after a failure", (afterFailure["content"] as? [Any])?.count, 0)

        // Usage never reports more reused than read, and signatures survive any text.
        c.equal("reuse is capped at the prompt", AnthropicDialect.Usage(prompt: 10, cached: 12, output: 0).json["cache_read_input_tokens"] as? Int, 10)
        let odd = "line one\nline \"two\" é 🧠 \u{0}"
        c.equal("a signature round-trips any text", AnthropicDialect.reasoning(fromSignature: AnthropicDialect.signature(for: odd)), odd)
        c.expect("a foreign signature is not read", AnthropicDialect.reasoning(fromSignature: "EqQBCgIYAhIM") == nil)
        c.expect("tool ids look like Anthropic's", AnthropicDialect.toolUseID().hasPrefix("toolu_")
                 && AnthropicDialect.toolUseID() != AnthropicDialect.toolUseID())
        return c.report()
    }
}

private extension Array {
    subscript(safe index: Int) -> Element? { indices.contains(index) ? self[index] : nil }
}
