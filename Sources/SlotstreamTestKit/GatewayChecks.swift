// T0: the loopback AI Gateway contract, on values. No socket, no engine.
//
// Everything fx requires of this dialect is checkable without a model, because
// the dialect was written as pure functions for exactly that reason. What is
// left for the live gates is that the server wires these functions to a socket.

import Foundation
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    static var gatewayChecks: [Check] {
        [
            Check("gateway-request", tier: .t0) { gatewayRequest() },
            Check("gateway-prompt", tier: .t0) { gatewayPrompt() },
            Check("gateway-catalog", tier: .t0) { gatewayCatalog() },
            Check("gateway-events", tier: .t0) { gatewayEvents() },
            Check("chat-splice", tier: .t0) { chatSplice() },
            Check("gateway-null-bridge", tier: .t0) { gatewayNullBridge() },
            Check("gateway-anyof-types", tier: .t0) { gatewayAnyOfTypes() },
        ]
    }

    /// fx's real turn-1 body, reduced to the shapes that matter.
    static func fxBody(
        prompt: [[String: Any]], tools: [[String: Any]]? = nil, extra: [String: Any] = [:]
    ) -> [String: Any] {
        var b: [String: Any] = ["prompt": prompt, "toolChoice": ["type": "auto"]]
        if let t = tools { b["tools"] = t }
        for (k, v) in extra { b[k] = v }
        return b
    }

    static let readFileTool: [String: Any] = [
        "type": "function", "name": "read_file", "description": "Read a file.",
        "inputSchema": [
            "type": "object",
            "properties": [
                "path": ["type": "string"],
                "start_line": ["type": "integer"],
                "opts": ["anyOf": [["type": "string"], ["type": "integer"]]],
            ],
            "required": ["path"],
        ],
    ]

    static func gatewayRequest() -> CheckReport {
        var c = CheckBuilder("gateway-request")
        let user: [[String: Any]] = [
            ["role": "user", "content": [["type": "text", "text": "hi"]]]
        ]

        // Versions are pinned; a mismatch is named, not guessed at.
        c.expect(
            "matching headers pass",
            GatewayDialect.validateHeaders([
                "ai-gateway-protocol-version": "0.0.1",
                "ai-language-model-specification-version": "4",
            ]) == nil)
        c.equal(
            "wrong specification version",
            GatewayDialect.validateHeaders(["ai-language-model-specification-version": "5"])?.code,
            "unsupported_specification_version")
        c.equal(
            "wrong protocol version",
            GatewayDialect.validateHeaders(["ai-gateway-protocol-version": "0.0.2"])?.code,
            "unsupported_protocol_version")
        c.expect("absent headers are tolerated", GatewayDialect.validateHeaders([:]) == nil)

        // Field policy.
        c.equal(
            "unknown field is refused by name",
            failureCode(fxBody(prompt: user, extra: ["nonesuch": 1])), "unsupported_field")
        c.equal(
            "json responseFormat is refused",
            failureCode(
                fxBody(prompt: user, extra: ["responseFormat": ["type": "json", "schema": [:]]])),
            "response_format_unsupported")
        c.expect(
            "text responseFormat is accepted",
            failureCode(fxBody(prompt: user, extra: ["responseFormat": ["type": "text"]])) == nil)
        c.equal(
            "non-zero frequencyPenalty is refused",
            failureCode(fxBody(prompt: user, extra: ["frequencyPenalty": 0.5])),
            "frequency_penalty_unsupported")
        c.expect(
            "frequencyPenalty 0 is accepted",
            failureCode(fxBody(prompt: user, extra: ["frequencyPenalty": 0])) == nil)
        c.expect(
            "providerOptions is ignored, not refused",
            failureCode(
                fxBody(prompt: user, extra: ["providerOptions": ["gateway": ["speed": "fast"]]]))
                == nil)
        c.expect(
            "includeRawChunks is ignored",
            failureCode(fxBody(prompt: user, extra: ["includeRawChunks": true])) == nil)

        // Tools: functions are kept with their types, provider tools dropped.
        let withTools = fxBody(
            prompt: user,
            tools: [
                readFileTool,
                ["type": "provider", "id": "gateway.perplexity_search", "name": "perplexity_search"],
            ])
        if case .success(let r) = GatewayDialect.parse(withTools, modelID: "m") {
            c.equal("provider tools are dropped", r.tools.count, 1)
            c.equal("function tool name", r.tools.first?.name ?? "", "read_file")
            let schema = r.tools[0].schema
            c.equal("schema: string parameter", schema.params["path"], .string)
            c.equal("schema: integer parameter", schema.params["start_line"], .integer)
            // A union of two REAL types stays conservative.
            c.equal("schema: a two-type anyOf stays unknown", schema.params["opts"], .unknown)
        } else {
            c.expect("tools parse", false)
        }

        // toolChoice.
        func choice(_ tc: Any) -> GatewayDialect.ToolChoice? {
            var b = fxBody(prompt: user)
            b["toolChoice"] = tc
            if case .success(let r) = GatewayDialect.parse(b, modelID: "m") { return r.toolChoice }
            return nil
        }
        c.equal("toolChoice auto", choice(["type": "auto"]), .auto)
        c.equal("toolChoice none", choice(["type": "none"]), .disabled)
        c.equal("toolChoice required", choice(["type": "required"]), .required)
        c.equal(
            "toolChoice tool", choice(["type": "tool", "toolName": "read_file"]),
            .tool("read_file"))
        var noName = fxBody(prompt: user)
        noName["toolChoice"] = ["type": "tool"]
        c.equal("toolChoice tool without a name", failureCode(noName), "invalid_tool_choice")

        // Reasoning labels: exactly the four the catalogue advertises, plus the
        // aliases fx may send, plus a default for anything unrecognized.
        func reasoning(_ label: Any?) -> GatewayDialect.Reasoning? {
            var b = fxBody(prompt: user)
            if let l = label { b["reasoning"] = l }
            if case .success(let r) = GatewayDialect.parse(b, modelID: "m") { return r.reasoning }
            return nil
        }
        c.expect("no reasoning field: thinking off", reasoning(nil)?.thinking == false)
        c.expect("none: thinking off", reasoning("none")?.thinking == false)
        c.expect("minimal: thinking off", reasoning("minimal")?.thinking == false)
        c.equal("low maps to low", reasoning("low")?.effort ?? "", "low")
        c.equal("medium maps to medium", reasoning("medium")?.effort ?? "", "medium")
        c.equal("high maps to xhigh", reasoning("high")?.effort ?? "", "xhigh")
        c.equal("max maps to xhigh", reasoning("max")?.effort ?? "", "xhigh")
        c.expect("unknown label: thinking on, template default", reasoning("weird")?.thinking == true)
        c.expect("unknown label carries no effort", reasoning("weird")?.effort == nil)

        // Sampling knobs pass through.
        let knobs = fxBody(
            prompt: user,
            extra: [
                "maxOutputTokens": 2048, "temperature": 0.2, "topP": 0.9, "topK": 5,
                "presencePenalty": 0.1, "seed": 7, "stopSequences": ["STOP"],
            ])
        if case .success(let r) = GatewayDialect.parse(knobs, modelID: "m") {
            c.equal("maxOutputTokens", r.maxOutputTokens ?? 0, 2048)
            c.equal("seed", r.seed ?? 0, 7)
            c.equal("stopSequences", r.stopSequences, ["STOP"])
            c.equal("topK", r.topK ?? 0, 5)
        } else {
            c.expect("sampling knobs parse", false)
        }

        // Tool turns use their own defaults because the output is a grammar:
        // low variance, and no penalty for repeated closing tags.
        let agent = SampleParams.agent
        c.equal("agent temperature", agent.temperature, 0.2)
        c.equal("agent top-p", agent.topP, 0.9)
        c.equal("agent presence penalty", agent.presencePenalty, 0)
        return c.report()
    }

    static func gatewayPrompt() -> CheckReport {
        var c = CheckBuilder("gateway-prompt")

        // fx sends six system messages; they become one system turn, because
        // the template renders one and rejects a later one.
        let sixSystems: [[String: Any]] = (1...6).map {
            ["role": "system", "content": "S\($0)"]
        } + [["role": "user", "content": [["type": "text", "text": "hi"]]]]
        if case .success(let r) = GatewayDialect.parse(fxBody(prompt: sixSystems), modelID: "m") {
            c.equal("six systems become one", r.messages.filter { $0.role == "system" }.count, 1)
            c.equal(
                "systems joined by a blank line", r.messages.first?.content ?? "",
                "S1\n\nS2\n\nS3\n\nS4\n\nS5\n\nS6")
            c.equal("system comes first", r.messages.first?.role ?? "", "system")
        } else {
            c.expect("six systems parse", false)
        }

        // A system message after the conversation starts cannot be rendered.
        c.equal(
            "system after user is refused",
            failureCode(
                fxBody(prompt: [
                    ["role": "user", "content": [["type": "text", "text": "hi"]]],
                    ["role": "system", "content": "late"],
                ])), "system_after_conversation")

        // Images.
        c.equal(
            "user file part is refused",
            failureCode(
                fxBody(prompt: [
                    [
                        "role": "user",
                        "content": [["type": "file", "mediaType": "image/png", "data": "x"]],
                    ]
                ])), "images_unsupported")

        // A full tool round trip: assistant call, then the tool's result.
        let loop: [[String: Any]] = [
            ["role": "system", "content": "You are fx."],
            ["role": "user", "content": [["type": "text", "text": "read it"]]],
            [
                "role": "assistant",
                "content": [
                    ["type": "text", "text": "Let me read it."],
                    [
                        "type": "tool-call", "toolCallId": "call_1", "toolName": "read_file",
                        "input": ["path": "hello.txt"],
                    ],
                ],
            ],
            [
                "role": "tool",
                "content": [
                    [
                        "type": "tool-result", "toolCallId": "call_1", "toolName": "read_file",
                        "output": ["type": "text", "value": "hello from slotstream"],
                    ]
                ],
            ],
        ]
        if case .success(let r) = GatewayDialect.parse(fxBody(prompt: loop), modelID: "m") {
            c.equal("tool loop: message count", r.messages.count, 4)
            c.equal("tool loop: assistant text", r.messages[2].content, "Let me read it.")
            c.equal("tool loop: one call", r.messages[2].toolCalls.count, 1)
            c.equal("tool loop: call name", r.messages[2].toolCalls.first?.name ?? "", "read_file")
            c.equal(
                "tool loop: object input accepted",
                r.messages[2].toolCalls.first?.inputJSON ?? "", #"{"path":"hello.txt"}"#)
            c.equal("tool loop: result role", r.messages[3].role, "tool")
            c.equal("tool loop: result text", r.messages[3].content, "hello from slotstream")
            c.equal("tool loop: result id kept", r.messages[3].toolCallId ?? "", "call_1")
        } else {
            c.expect("tool loop parses", false)
        }

        // The specification says `input` is a JSON string; fx sends an object.
        // Both must work, and produce the same call.
        let asString: [[String: Any]] = [
            ["role": "user", "content": [["type": "text", "text": "x"]]],
            [
                "role": "assistant",
                "content": [
                    [
                        "type": "tool-call", "toolCallId": "c", "toolName": "read_file",
                        "input": #"{"path":"hello.txt"}"#,
                    ]
                ],
            ],
            [
                "role": "tool",
                "content": [
                    [
                        "type": "tool-result", "toolCallId": "c", "toolName": "read_file",
                        "output": ["type": "text", "value": "ok"],
                    ]
                ],
            ],
        ]
        if case .success(let r) = GatewayDialect.parse(fxBody(prompt: asString), modelID: "m") {
            c.equal(
                "tool-call input as a JSON string", r.messages[1].toolCalls.first?.inputJSON ?? "",
                #"{"path":"hello.txt"}"#)
        } else {
            c.expect("string input parses", false)
        }

        // Every tool-result output shape fx can send.
        func result(_ output: [String: Any]) -> String? {
            let p: [[String: Any]] = [
                ["role": "user", "content": [["type": "text", "text": "x"]]],
                [
                    "role": "tool",
                    "content": [
                        [
                            "type": "tool-result", "toolCallId": "c", "toolName": "t",
                            "output": output,
                        ]
                    ],
                ],
            ]
            if case .success(let r) = GatewayDialect.parse(fxBody(prompt: p), modelID: "m") {
                return r.messages.last?.content
            }
            return nil
        }
        c.equal("output text", result(["type": "text", "value": "v"]) ?? "", "v")
        c.equal("output error-text", result(["type": "error-text", "value": "boom"]) ?? "", "boom")
        c.equal(
            "output json is compact JSON",
            result(["type": "json", "value": ["b": 1, "a": 2]]) ?? "", #"{"a":2,"b":1}"#)
        c.equal(
            "output execution-denied",
            result(["type": "execution-denied", "reason": "user said no"]) ?? "",
            "Denied: user said no")
        c.equal(
            "output content joins text items",
            result(["type": "content", "value": [["type": "text", "text": "a"], ["type": "text", "text": "b"]]]) ?? "",
            "a\nb")

        // A prompt may not end on an assistant turn: fx sends that only to
        // vision models, and the template cannot render a prefill.
        c.equal(
            "assistant-final prompt is refused",
            failureCode(
                fxBody(prompt: [
                    ["role": "user", "content": [["type": "text", "text": "hi"]]],
                    ["role": "assistant", "content": [["type": "text", "text": "partial"]]],
                ])), "assistant_prefill_unsupported")
        return c.report()
    }

    /// The catalogue, and the invariant that makes fx plan correctly.
    static func gatewayCatalog() -> CheckReport {
        var c = CheckBuilder("gateway-catalog")
        // Every cap the planner can produce, including the small ones a
        // memory-constrained Mac gets, and the boundary at the output budget.
        let caps = [512, 1024, 2048, 4096, 8192, 8193, 12288, 16384, 24576, 32768]
        var violations: [String] = []
        var overCap: [String] = []
        for cap in caps {
            let cat = GatewayDialect.catalog(modelID: "slotstream/m", contextCap: cap)
            guard let data = cat["data"] as? [[String: Any]] else {
                violations.append("cap \(cap): no data")
                continue
            }
            c.equal("cap \(cap): four entries", data.count, 4)
            for e in data {
                let id = e["id"] as? String ?? "?"
                let window = e["context_window"] as? Int ?? 0
                let maxTokens = e["max_tokens"] as? Int ?? 0
                // The invariant. fx's usableInputTokens subtracts the output
                // budget ONLY when it is strictly smaller than the window, and
                // otherwise returns the whole window — leaving zero headroom
                // for the reply and deferring compaction to 4/5 of the cap.
                if maxTokens >= window { violations.append("\(id)@\(cap): \(maxTokens) >= \(window)") }
                // No alias may claim a window the server cannot serve.
                if window > cap { overCap.append("\(id)@\(cap): window \(window) > cap \(cap)") }
                // fx's usable figure must leave real room to answer in.
                let usable = maxTokens < window ? window - maxTokens : window
                if usable >= window && maxTokens < window {
                    violations.append("\(id)@\(cap): usable did not shrink")
                }
            }
        }
        c.equal("max_tokens < context_window at every cap", violations, [])
        c.equal("no alias window exceeds the live cap", overCap, [])

        // Shape fx's parser requires.
        let cat = GatewayDialect.catalog(modelID: "slotstream/m", contextCap: 32768)
        let data = cat["data"] as? [[String: Any]] ?? []
        c.equal("object is a list", cat["object"] as? String ?? "", "list")
        c.expect(
            "every entry is a language model",
            data.allSatisfy { ($0["type"] as? String) == "language" })
        c.expect(
            "every entry advertises tool-use",
            data.allSatisfy { ($0["tags"] as? [String])?.contains("tool-use") == true })
        c.expect(
            "no vision, web-search or caching tags",
            data.allSatisfy {
                let tags = Set($0["tags"] as? [String] ?? [])
                return tags.isDisjoint(with: [
                    "vision", "web-search", "explicit-caching", "implicit-caching", "file-input",
                ])
            })
        // `released` is fx's sort rank, not a date: the served model must come
        // first in `fx models`, above its own aliases.
        c.equal("served model sorts first", data.first?["id"] as? String ?? "", "slotstream/m")
        c.equal("served model rank", data.first?["released"] as? Int ?? -1, 1)
        c.expect(
            "aliases rank below it",
            data.dropFirst().allSatisfy { ($0["released"] as? Int) == 0 })
        // The three helper ids fx hardcodes must all be present, or fx plans
        // them with vendor defaults (256k for openai/, 1M for google/).
        let ids = Set(data.compactMap { $0["id"] as? String })
        for helper in ["moonshotai/kimi-k3", "openai/gpt-5.6-luna", "google/gemini-2.5-flash"] {
            c.expect("catalogue lists \(helper)", ids.contains(helper))
        }
        // Only the served model advertises reasoning: fx sends `reasoning` only
        // when the catalogue offers it, and the helper calls must not.
        c.expect("served model offers effort", data.first?["reasoning_options"] != nil)
        c.expect(
            "aliases offer no effort",
            data.dropFirst().allSatisfy { $0["reasoning_options"] == nil })
        // The compactor alias is small on both axes: its 120 s deadline is
        // bound by decode, not prefill.
        let compactor = data.first { ($0["id"] as? String) == "openai/gpt-5.6-luna" }
        c.expect(
            "compactor window is bounded", (compactor?["context_window"] as? Int ?? 0) <= 8192)
        c.expect(
            "compactor reply budget is small",
            (compactor?["max_tokens"] as? Int ?? 9999) <= GatewayDialect.compactBudget)
        return c.report()
    }

    /// The stream frames, byte for byte where fx is strict.
    static func gatewayEvents() -> CheckReport {
        var c = CheckBuilder("gateway-events")
        let f = GatewayDialect.frame(["type": "text-delta", "id": "t0", "delta": "hi"])
        c.expect("frame starts with `data: `", f.hasPrefix("data: "))
        c.expect("frame ends with a blank line", f.hasSuffix("\n\n"))
        c.expect("frame has no interior newline", !f.dropLast(2).contains("\n"))
        c.equal(
            "keepalive is a comment fx skips", GatewayDialect.keepalive, ": keepalive\n\n")

        // The finish frame is where fx is strictest, and where the first live
        // capture failed: a plain-string finishReason aborts the turn with
        // InvalidProviderFinishReason, and flat usage integers are dropped.
        let fin = GatewayDialect.finishFrame(
            reason: "tool-calls", rawReason: "tool_calls", inputTokens: 6136, cachedTokens: 6000,
            outputText: 25, outputReasoning: 4)
        let body = String(fin.dropFirst("data: ".count).dropLast(2))
        guard let obj = try? JSONSerialization.jsonObject(with: Data(body.utf8)) as? [String: Any]
        else {
            c.expect("finish frame is JSON", false)
            return c.report()
        }
        c.expect("finishReason is an object", obj["finishReason"] is [String: Any])
        let fr = obj["finishReason"] as? [String: Any] ?? [:]
        c.equal("finishReason.unified", fr["unified"] as? String ?? "", "tool-calls")
        c.equal("finishReason.raw", fr["raw"] as? String ?? "", "tool_calls")
        let usage = obj["usage"] as? [String: Any] ?? [:]
        let input = usage["inputTokens"] as? [String: Any] ?? [:]
        let output = usage["outputTokens"] as? [String: Any] ?? [:]
        c.expect("usage.inputTokens is nested", !input.isEmpty)
        c.equal("inputTokens.total", input["total"] as? Int ?? 0, 6136)
        c.equal("inputTokens.cacheRead is the prefix hit", input["cacheRead"] as? Int ?? 0, 6000)
        c.equal("inputTokens.noCache is what was prefilled", input["noCache"] as? Int ?? 0, 136)
        c.equal("outputTokens.total", output["total"] as? Int ?? 0, 29)
        c.equal("outputTokens.text", output["text"] as? Int ?? 0, 25)
        c.equal("outputTokens.reasoning", output["reasoning"] as? Int ?? 0, 4)

        // A cold prompt reads back as no reuse rather than negative noCache.
        let cold = GatewayDialect.finishFrame(
            reason: "stop", rawReason: "stop", inputTokens: 100, cachedTokens: 0, outputText: 1,
            outputReasoning: 0)
        c.expect("cold prompt: noCache equals total", cold.contains("\"noCache\":100"))

        // Unified finish reasons.
        c.equal(
            "a call makes the turn tool-calls",
            GatewayDialect.unifiedFinish("stop", hasToolCall: true).0, "tool-calls")
        c.equal(
            "the token limit is length",
            GatewayDialect.unifiedFinish("length", hasToolCall: false).0, "length")
        c.equal(
            "end of sequence is stop", GatewayDialect.unifiedFinish("stop", hasToolCall: false).0,
            "stop")
        c.expect(
            "every unified value is one fx accepts",
            ["stop", "length", "content-filter", "tool-calls", "error", "other"].contains(
                GatewayDialect.unifiedFinish("whatever", hasToolCall: false).0))
        return c.report()
    }

    /// The rule that decides whether held ids may stand in for a re-rendered
    /// assistant turn. It is the safety property of the splice: accept only
    /// when the generated text really is the turn the client replayed, because
    /// a wrong accept silently answers from another conversation's state.
    static func chatSplice() -> CheckReport {
        var c = CheckBuilder("chat-splice")
        let tools = [
            ToolDefinition(
                name: "read_file", description: "Read a file.",
                parameters: .object([
                    "type": .string("object"),
                    "properties": .object(["path": .object(["type": .string("string")])]),
                ]))
        ]
        let call = ParsedToolCall(
            id: "call_1", name: "read_file", arguments: ["path": .string("hello.txt")],
            order: ["path"])
        let turn = ChatMessage(
            role: "assistant", content: "Let me read it.", toolCalls: [call])
        let generated = """
            Let me read it.
            <tool_call>
            <function=read_file>
            <parameter=path>
            hello.txt
            </parameter>
            </function>
            </tool_call>
            """
        c.expect(
            "the turn that produced it is accepted",
            Engine.spliceDescribes(generated, turn, tools: tools))

        // Reasoning is ignored: the client dropping it is why the splice exists.
        c.expect(
            "reasoning in the generated text is ignored",
            Engine.spliceDescribes("<think>hmm</think>\n" + generated, turn, tools: tools))

        // Every way the held ids could describe a DIFFERENT turn must be refused.
        let otherArgs = ChatMessage(
            role: "assistant", content: "Let me read it.",
            toolCalls: [
                ParsedToolCall(
                    id: "call_1", name: "read_file", arguments: ["path": .string("other.txt")],
                    order: ["path"])
            ])
        c.expect(
            "different arguments are refused",
            !Engine.spliceDescribes(generated, otherArgs, tools: tools))
        let otherName = ChatMessage(
            role: "assistant", content: "Let me read it.",
            toolCalls: [
                ParsedToolCall(
                    id: "call_1", name: "list_dir", arguments: ["path": .string("hello.txt")],
                    order: ["path"])
            ])
        c.expect(
            "a different tool is refused",
            !Engine.spliceDescribes(generated, otherName, tools: tools))
        c.expect(
            "different text is refused",
            !Engine.spliceDescribes(
                generated, ChatMessage(role: "assistant", content: "Something else", toolCalls: [call]),
                tools: tools))
        c.expect(
            "a missing call is refused",
            !Engine.spliceDescribes(
                generated, ChatMessage(role: "assistant", content: "Let me read it."), tools: tools))
        c.expect(
            "an extra call is refused",
            !Engine.spliceDescribes(
                generated,
                ChatMessage(role: "assistant", content: "Let me read it.", toolCalls: [call, call]),
                tools: tools))
        c.expect(
            "an unterminated block is refused",
            !Engine.spliceDescribes(
                "Let me read it.\n<tool_call>\n<function=read_file>", turn, tools: tools))
        // Whitespace differences are tolerated: the client's copy has been
        // through its own JSON round trip.
        c.expect(
            "trailing whitespace is tolerated",
            Engine.spliceDescribes(generated + "\n\n", turn, tools: tools))
        // A plain text turn with no calls still matches.
        c.expect(
            "a plain text turn matches",
            Engine.spliceDescribes(
                "Just an answer.", ChatMessage(role: "assistant", content: "Just an answer."),
                tools: tools))
        return c.report()
    }

    /// JSON null must never cross into the chat template as `NSNull`.
    ///
    /// swift-jinja throws on `NSNull` and maps Swift nil to null, so a single
    /// `"default": null` inside one of fx's tool schemas failed the entire turn
    /// with a 400 and no output. Found in live use, not by these gates, which
    /// is why every path that can carry a null is now enumerated here.
    static func gatewayNullBridge() -> CheckReport {
        var c = CheckBuilder("gateway-null-bridge")
        c.expect("a bare null does not bridge to NSNull", !JSONValue.null.bridgesAnyNSNull)
        c.expect(
            "a null inside an object does not bridge to NSNull",
            !JSONValue.object(["a": .int(1), "b": .null]).bridgesAnyNSNull)
        c.expect(
            "a null inside an array does not bridge to NSNull",
            !JSONValue.array([.int(1), .null]).bridgesAnyNSNull)
        c.expect(
            "a deeply nested null does not bridge to NSNull",
            !JSONValue.object(["x": .array([.object(["y": .null])])]).bridgesAnyNSNull)
        c.expect("the null bridge value is not NSNull", !(JSONValue.templateNull is NSNull))

        // The three request shapes that carried a null in the live failure.
        let schemaWithNull: [String: Any] = [
            "type": "function", "name": "terminal", "description": "Run a command.",
            "inputSchema": [
                "type": "object",
                "properties": [
                    "command": ["type": "string"],
                    // fx really sends this.
                    "timeout": ["anyOf": [["type": "number"], ["type": "null"]], "default": NSNull()],
                ],
                "required": ["command"],
            ],
        ]
        let user: [[String: Any]] = [["role": "user", "content": [["type": "text", "text": "hi"]]]]
        if case .success(let r) = GatewayDialect.parse(
            fxBody(prompt: user, tools: [schemaWithNull]), modelID: "m")
        {
            c.expect(
                "a null inside a tool schema survives parsing",
                !r.tools[0].parameters.bridgesAnyNSNull)
            // The rendered value is what actually reaches the template.
            c.expect(
                "the rendered tool spec carries no NSNull",
                !containsNSNull(r.tools[0].templateValue))
        } else {
            c.expect("a tool schema with a null parses", false)
        }

        let withNullArgs: [[String: Any]] = user + [
            [
                "role": "assistant",
                "content": [[
                    "type": "tool-call", "toolCallId": "c1", "toolName": "terminal",
                    "input": ["command": "ls", "timeout": NSNull()],
                ]],
            ],
            [
                "role": "tool",
                "content": [[
                    "type": "tool-result", "toolCallId": "c1", "toolName": "terminal",
                    "output": ["type": "text", "value": "ok"],
                ]],
            ],
        ]
        if case .success(let r) = GatewayDialect.parse(
            fxBody(prompt: withNullArgs, tools: [schemaWithNull]), modelID: "m")
        {
            let assistant = r.messages.first { $0.role == "assistant" }
            c.expect(
                "a null tool-call argument renders without NSNull",
                assistant.map { !containsNSNull($0.templateValue) } ?? false)
            c.expect(
                "the null argument is kept, not dropped",
                assistant?.toolCalls.first?.arguments["timeout"] == JSONValue.null)
        } else {
            c.expect("a tool call with a null argument parses", false)
        }

        // A JSON tool result carrying a null becomes text, so it can never
        // reach the bridge, but the text must still say null.
        if case .success(let r) = GatewayDialect.parse(
            fxBody(prompt: user + [[
                "role": "tool",
                "content": [[
                    "type": "tool-result", "toolCallId": "c1", "toolName": "terminal",
                    "output": ["type": "json", "value": ["exit": 0, "stderr": NSNull()]],
                ]],
            ]]), modelID: "m")
        {
            c.equal(
                "a json tool result renders null as text", r.messages.last?.content ?? "",
                #"{"exit":0,"stderr":null}"#)
        } else {
            c.expect("a json tool result with a null parses", false)
        }
        return c.report()
    }

    /// fx's real `terminal` schema, captured from the wire, and the typing it
    /// must produce.
    ///
    /// Three of its five required fields are declared `anyOf: [{"type":"…"},
    /// {"type":"null"}]` — fx's way of writing an optional. Typed `.unknown`
    /// those coerce a numeric-looking command or working directory into a
    /// number, and fx rejects the call.
    static func gatewayAnyOfTypes() -> CheckReport {
        var c = CheckBuilder("gateway-anyof-types")
        let terminal: [String: Any] = [
            "type": "function", "name": "terminal", "description": "Run a command.",
            "inputSchema": [
                "type": "object",
                "properties": [
                    "action": ["type": "string", "enum": ["exec"]],
                    "command": ["anyOf": [["type": "string"], ["type": "null"]]],
                    "cwd": ["anyOf": [["type": "string"], ["type": "null"]]],
                    "profile": ["anyOf": [["type": "string"], ["type": "null"]]],
                    "timeout_ms": ["type": "integer", "minimum": 1, "maximum": 600000],
                    "count": ["anyOf": [["type": "integer"], ["type": "null"]]],
                    "flag": ["anyOf": [["type": "boolean"], ["type": "null"]]],
                    "either": ["anyOf": [["type": "string"], ["type": "integer"]]],
                ],
                "required": ["action", "command", "cwd", "profile", "timeout_ms"],
            ],
        ]
        let user: [[String: Any]] = [["role": "user", "content": [["type": "text", "text": "hi"]]]]
        guard case .success(let r) = GatewayDialect.parse(
            fxBody(prompt: user, tools: [terminal]), modelID: "m")
        else {
            c.expect("the terminal schema parses", false)
            return c.report()
        }
        let p = r.tools[0].schema.params
        c.equal("action is a string", p["action"], .string)
        c.equal("timeout_ms is an integer", p["timeout_ms"], .integer)
        c.equal("an optional string resolves to string", p["command"], .string)
        c.equal("an optional working directory resolves to string", p["cwd"], .string)
        c.equal("an optional enum resolves to string", p["profile"], .string)
        c.equal("an optional integer resolves to integer", p["count"], .integer)
        c.equal("an optional boolean resolves to boolean", p["flag"], .boolean)
        c.equal("a genuine two-type union stays unknown", p["either"], .unknown)

        // The failure this prevents: a numeric-looking value in an optional
        // string field must stay a string.
        let schema = r.tools[0].schema
        let call = """
            <tool_call>
            <function=terminal>
            <parameter=action>
            exec
            </parameter>
            <parameter=command>
            2024
            </parameter>
            <parameter=cwd>
            2024
            </parameter>
            <parameter=timeout_ms>
            30000
            </parameter>
            </function>
            </tool_call>
            """
        let events = ToolCallSplitter.parseAll(call, tools: [schema], idFactory: countingIDs())
        if case .toolCall(let made) = events.last {
            c.equal(
                "a numeric-looking command stays a string", made.arguments["command"],
                .string("2024"))
            c.equal(
                "a numeric-looking cwd stays a string", made.arguments["cwd"], .string("2024"))
            c.equal("timeout_ms is still a number", made.arguments["timeout_ms"], .int(30000))
            c.equal(
                "the emitted input is what fx expects", made.inputJSON,
                #"{"action":"exec","command":"2024","cwd":"2024","timeout_ms":30000}"#)
        } else {
            c.expect("the terminal call parses", false)
        }
        // A missing required field is passed through untouched: fx reports the
        // real error, and the model corrects itself. The server must not invent
        // a value for `profile`.
        if case .toolCall(let made) = events.last {
            c.expect("a missing required field is not invented", made.arguments["profile"] == nil)
        }
        return c.report()
    }

    /// Recursively: does this bridged structure contain an `NSNull`?
    static func containsNSNull(_ value: Any) -> Bool {
        if value is NSNull { return true }
        if let d = value as? [String: Any] { return d.values.contains { containsNSNull($0) } }
        if let a = value as? [Any] { return a.contains { containsNSNull($0) } }
        return false
    }

    static func failureCode(_ body: [String: Any]) -> String? {
        if case .failure(let f) = GatewayDialect.parse(body, modelID: "m") { return f.code }
        return nil
    }
}
