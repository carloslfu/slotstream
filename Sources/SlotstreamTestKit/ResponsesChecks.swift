// T0: the Responses API contract, on values. No socket, no engine.
//
// Codex is the client this dialect exists for, so the fixtures are the shapes
// Codex sends to a custom provider: the base instructions in `instructions`,
// developer and user context messages, an assistant turn split into reasoning,
// message and function_call items, function_call_output items in any order,
// and its real tool schemas. What is left for the live gates is that the
// server wires these functions to a socket and a model.

import Foundation
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    static var responsesChecks: [Check] {
        [
            Check("responses-request", tier: .t0) { responsesRequest() },
            Check("responses-events", tier: .t0) { responsesEvents() },
            Check("responses-replay", tier: .t0) { responsesReplay() },
            Check("responses-codex-tools", tier: .t0) { responsesCodexTools() },
            Check("responses-codex-fixture", tier: .t0) { responsesCodexFixture() },
        ]
    }

    static let codexImage = "data:image/png;base64,iVBORw0KGgo="

    /// Codex's `exec_command`, as `codex-rs/core/src/tools/handlers/shell_spec.rs` builds it.
    static let codexExecCommandTool: [String: Any] = [
        "type": "function", "name": "exec_command", "strict": false,
        "description": "Runs a command in a PTY, returning output or a session ID for ongoing interaction.",
        "parameters": [
            "type": "object",
            "properties": [
                "cmd": ["type": "string", "description": "Shell command to execute."],
                "workdir": ["type": "string"],
                "tty": ["type": "boolean"],
                "yield_time_ms": ["type": "number"],
                "max_output_tokens": ["type": "number"],
                "shell": ["type": "string"],
                "login": ["type": "boolean"],
            ],
            "required": ["cmd"],
            "additionalProperties": false,
        ],
    ]

    static let codexWriteStdinTool: [String: Any] = [
        "type": "function", "name": "write_stdin", "strict": false,
        "description": "Writes characters to an existing unified exec session.",
        "parameters": [
            "type": "object",
            "properties": [
                "session_id": ["type": "number"],
                "chars": ["type": "string"],
                "yield_time_ms": ["type": "number"],
                "max_output_tokens": ["type": "number"],
            ],
            "required": ["session_id"],
            "additionalProperties": false,
        ],
    ]

    static let codexUpdatePlanTool: [String: Any] = [
        "type": "function", "name": "update_plan", "strict": false,
        "description": "Updates the task plan.",
        "parameters": [
            "type": "object",
            "properties": [
                "explanation": ["type": "string"],
                "plan": [
                    "type": "array",
                    "items": [
                        "type": "object",
                        "properties": ["step": ["type": "string"], "status": ["type": "string", "enum": ["pending", "in_progress", "completed"]]],
                        "required": ["step", "status"],
                        "additionalProperties": false,
                    ],
                ],
            ],
            "required": ["plan"],
            "additionalProperties": false,
        ],
    ]

    static let codexViewImageTool: [String: Any] = [
        "type": "function", "name": "view_image", "strict": false,
        "description": "View a local image file from the filesystem when visual inspection is needed.",
        "parameters": [
            "type": "object",
            "properties": ["path": ["type": "string", "description": "Local filesystem path to an image file."]],
            "required": ["path"],
            "additionalProperties": false,
        ],
        "output_schema": [
            "type": "object",
            "properties": ["image_url": ["type": "string"]],
            "required": ["image_url"],
            "additionalProperties": false,
        ],
    ]

    /// A Codex turn-3 body, reduced to the shapes that matter.
    static func codexBody(extra: [String: Any] = [:]) -> [String: Any] {
        let developer: [String: Any] = ["type": "message", "role": "developer",
            "content": [["type": "input_text", "text": "<permissions_instructions>\nworkspace-write\n</permissions_instructions>"]]]
        let user: [String: Any] = ["type": "message", "role": "user",
            "content": [["type": "input_text", "text": "Read hello.txt"],
                        ["type": "input_image", "image_url": codexImage, "detail": "high"]]]
        let reasoning: [String: Any] = ["type": "reasoning", "id": "rs_1",
            "summary": [["type": "summary_text", "text": "I need the file."]], "encrypted_content": NSNull()]
        let message: [String: Any] = ["type": "message", "id": "msg_1", "role": "assistant", "status": "completed",
            "phase": "commentary", "content": [["type": "output_text", "text": "Let me look.", "annotations": []]]]
        let call1: [String: Any] = ["type": "function_call", "id": "fc_1", "call_id": "call_1", "name": "exec_command",
            "arguments": #"{"cmd":"cat hello.txt","yield_time_ms":10000}"#, "status": "completed"]
        let call2: [String: Any] = ["type": "function_call", "id": "fc_2", "call_id": "call_2", "name": "view_image",
            "arguments": #"{"path":"shape.png"}"#]
        let out2: [String: Any] = ["type": "function_call_output", "call_id": "call_2",
            "output": [["type": "input_image", "image_url": codexImage, "detail": "high"]]]
        let out1: [String: Any] = ["type": "function_call_output", "call_id": "call_1", "output": "fixture42\n"]
        let later: [String: Any] = ["type": "message", "role": "developer",
            "content": [["type": "input_text", "text": "<model_switch>\nlow\n</model_switch>"]]]
        let again: [String: Any] = ["type": "message", "role": "user", "content": "And now?"]
        var body: [String: Any] = [
            "model": "qwen3.8-flash-next:4bit",
            "instructions": "You are Codex.",
            "input": [developer, user, reasoning, message, call1, call2, out2, out1, later, again],
            "tools": [codexExecCommandTool, codexViewImageTool, ["type": "web_search", "external_web_access": true]],
            "tool_choice": "auto",
            "parallel_tool_calls": true,
            "reasoning": ["effort": "low", "summary": "auto"],
            "store": false,
            "stream": true,
            "include": ["reasoning.encrypted_content"],
            "prompt_cache_key": "thread-1",
            "client_metadata": ["thread_id": "thread-1"],
        ]
        for (k, v) in extra { body[k] = v }
        return body
    }

    static func responsesRequest() -> CheckReport {
        var c = CheckBuilder("responses-request")
        func parse(_ extra: [String: Any] = [:]) throws -> ResponsesDialect.Request {
            try ResponsesDialect.parse(codexBody(extra: extra))
        }
        func rejected(_ extra: [String: Any], _ code: String? = nil) -> Bool {
            do { _ = try parse(extra); return false }
            catch let f as ResponsesDialect.Failure { return code == nil || f.code == code }
            catch { return false }
        }

        do {
            let r = try parse()
            c.equal("system joins instructions and leading developer text", r.messages.first?.content,
                "You are Codex.\n\n<permissions_instructions>\nworkspace-write\n</permissions_instructions>")
            c.equal("roles in template order",
                r.messages.map(\.role), ["system", "user", "assistant", "tool", "tool", "user", "user"])
            c.equal("user text kept", r.messages[1].content, "Read hello.txt")
            c.equal("user attachment kept inline", r.messages[1].images, [codexImage])
            c.equal("assistant items merge into one turn", r.messages[2].content, "Let me look.")
            c.equal("echoed summary becomes reasoning", r.messages[2].reasoning, "I need the file.")
            c.equal("both calls attached in order", r.messages[2].toolCalls.map(\.id), ["call_1", "call_2"])
            c.equal("call arguments typed", r.messages[2].toolCalls.first?.arguments["yield_time_ms"], .int(10000))
            c.equal("out-of-order outputs restore call order", r.messages[3].toolCallId, "call_1")
            c.equal("text output carried", r.messages[3].content, "fixture42\n")
            c.equal("view_image output carries its picture", r.messages[4].images, [codexImage])
            c.equal("picture output names its call", r.messages[4].toolName, "view_image")
            c.equal("a later developer message renders as user text", r.messages[5].content, "<model_switch>\nlow\n</model_switch>")
            c.equal("hosted web_search is dropped, function tools kept", r.tools.map(\.name), ["exec_command", "view_image"])
            c.equal("the response object will repeat the tools as sent", (r.echo["tools"] as? [Any])?.count, 3)
            c.equal("...and the reasoning setting", (r.echo["reasoning"] as? [String: Any])?["effort"] as? String, "low")
            c.expect("...and never claims to store", r.echo["store"] as? Bool == false)
            c.expect("reasoning low turns thinking on", r.thinking && r.effort == "low")
            c.expect("stream and parallel read", r.stream && r.parallel)
            c.expect("auto choice", r.choice == .auto)
            c.expect("images noticed", r.hasImages)
        } catch { c.expect("Codex body parses", false, "\(error)") }

        // Defaults and the API's own alternatives.
        do {
            let plain = try ResponsesDialect.parse(["model": "qwen3.8-flash-next:4bit", "input": "hi"])
            c.equal("string input is one user message", plain.messages.map(\.role), ["user"])
            c.expect("stream defaults off", !plain.stream)
            c.expect("parallel defaults on", plain.parallel)
            c.expect("no reasoning means no thinking", !plain.thinking)
            let none = try parse(["reasoning": ["effort": "none"]])
            c.expect("effort none turns thinking off", !none.thinking)
            let high = try parse(["reasoning": ["effort": "high"]])
            c.equal("effort high maps to the model's top level", high.effort, "xhigh")
            let forced = try parse(["tool_choice": ["type": "function", "name": "exec_command"]])
            c.expect("a named tool is forced", forced.choice == .tool("exec_command"))
            let quiet = try parse(["tool_choice": "none", "max_output_tokens": 64, "temperature": 0.1, "top_p": 0.9,
                                   "truncation": "disabled", "text": ["verbosity": "low", "format": ["type": "text"]],
                                   "metadata": ["k": "v"], "user": "u", "safety_identifier": "s", "service_tier": "default"])
            c.expect("none disables tools", quiet.choice == .disabled)
            c.equal("max_output_tokens read", quiet.maxOutputTokens, 64)
            c.equal("temperature read", quiet.temperature, 0.1)
        } catch { c.expect("alternatives parse", false, "\(error)") }

        // Refusals: every one names its cause.
        c.expect("stored state refused", rejected(["previous_response_id": "resp_1"], "stored_state_unsupported"))
        c.expect("conversation refused", rejected(["conversation": ["id": "conv_1"]], "stored_state_unsupported"))
        c.expect("background refused", rejected(["background": true], "unsupported_field"))
        c.expect("constrained output refused", rejected(["text": ["format": ["type": "json_schema", "schema": [:]]]], "unsupported_field"))
        c.expect("auto truncation refused", rejected(["truncation": "auto"], "unsupported_field"))
        c.expect("unknown field refused", rejected(["temperature_scale": 1], "unsupported_field"))
        do {
            let patchTool: [String: Any] = ["type": "custom", "name": "apply_patch", "description": "Use the `apply_patch` tool to edit files.",
                "format": ["type": "grammar", "syntax": "lark", "definition": "start: begin_patch hunk+ end_patch"]]
            let call: [String: Any] = ["type": "custom_tool_call", "call_id": "call_p", "name": "apply_patch",
                "input": "*** Begin Patch\n*** Add File: a.txt\n+hi\n*** End Patch"]
            let out: [String: Any] = ["type": "custom_tool_call_output", "call_id": "call_p", "output": "Done!"]
            let r = try parse(["tools": [patchTool], "input": [["role": "user", "content": "go"], call, out, ["role": "user", "content": "and?"]]])
            c.equal("a freeform tool renders as a one-parameter function", r.tools.map(\.name), ["apply_patch"])
            c.equal("its parameter is the raw input", r.tools.first?.schema.params["input"], .string)
            c.expect("the grammar is shown to the model", r.tools.first?.description.contains("lark grammar") == true)
            c.equal("freeform names remembered", r.freeform, ["apply_patch"])
            let forcedPatch = try parse(["tools": [patchTool], "tool_choice": ["type": "custom", "name": "apply_patch"]])
            c.expect("a freeform tool can be forced by a custom tool_choice", forcedPatch.choice == .tool("apply_patch"))
            let assistant = r.messages.first { $0.role == "assistant" }
            c.equal("a custom call replays as its input argument", assistant?.toolCalls.first?.arguments["input"],
                .string("*** Begin Patch\n*** Add File: a.txt\n+hi\n*** End Patch"))
            c.equal("its output replays as a tool message", r.messages.first { $0.role == "tool" }?.content, "Done!")
            let stream = ResponsesDialect.ResponseStream(model: "m", id: "resp_ff", createdAt: 1, freeform: r.freeform)
            let frames = stream.functionCall(ParsedToolCall(id: "call_p", name: "apply_patch",
                arguments: ["input": .string("*** Begin Patch\n*** End Patch")], order: ["input"]))
            let kinds = frames.compactMap { $0.split(separator: "\n").first.map { String($0.dropFirst("event: ".count)) } }
            c.equal("a freeform call streams as a custom tool call", kinds,
                ["response.output_item.added", "response.custom_tool_call_input.delta", "response.custom_tool_call_input.done", "response.output_item.done"])
            let data = frames.last?.split(separator: "\n").first { $0.hasPrefix("data: ") }.map { String($0.dropFirst("data: ".count)) } ?? "{}"
            let item = ((try? JSONSerialization.jsonObject(with: Data(data.utf8))) as? [String: Any])?["item"] as? [String: Any]
            c.equal("the item carries the raw input", item?["input"] as? String, "*** Begin Patch\n*** End Patch")
            c.equal("...as a custom_tool_call", item?["type"] as? String, "custom_tool_call")
        } catch { c.expect("freeform tool parses", false, "\(error)") }
        do {
            let bundle: [String: Any] = ["type": "namespace", "name": "multi_agent_v1",
                "description": "Tools for spawning and managing sub-agents.",
                "tools": [["type": "function", "name": "wait_agent", "strict": false, "description": "Wait.",
                           "parameters": ["type": "object", "properties": ["timeout_ms": ["type": "number"]]]]]]
            let call: [String: Any] = ["type": "function_call", "call_id": "call_9", "name": "wait_agent",
                "namespace": "multi_agent_v1", "arguments": #"{"timeout_ms":5}"#]
            let out: [String: Any] = ["type": "function_call_output", "call_id": "call_9", "output": "done"]
            let r = try parse(["tools": [bundle], "input": [["role": "user", "content": "go"], call, out, ["role": "user", "content": "and?"]]])
            c.equal("namespace members flatten to dotted functions", r.tools.map(\.name), ["multi_agent_v1.wait_agent"])
            c.expect("member keeps the namespace description", r.tools.first?.description.hasPrefix("Tools for spawning") == true)
            c.equal("namespaces remembered", r.namespaces, ["multi_agent_v1"])
            c.equal("a namespaced call replays under its dotted name", r.messages.first { $0.role == "assistant" }?.toolCalls.first?.name, "multi_agent_v1.wait_agent")
            let stream = ResponsesDialect.ResponseStream(model: "m", id: "resp_ns", createdAt: 1, namespaces: r.namespaces)
            let frames = stream.functionCall(ParsedToolCall(id: "call_9", name: "multi_agent_v1.wait_agent", arguments: ["timeout_ms": .int(5)]))
            let data = frames.last?.split(separator: "\n").first { $0.hasPrefix("data: ") }.map { String($0.dropFirst("data: ".count)) } ?? "{}"
            let item = ((try? JSONSerialization.jsonObject(with: Data(data.utf8))) as? [String: Any])?["item"] as? [String: Any]
            c.equal("a dotted call is reported with its namespace", item?["namespace"] as? String, "multi_agent_v1")
            c.equal("...and its bare name", item?["name"] as? String, "wait_agent")
            let plain = ResponsesDialect.ResponseStream(model: "m", id: "resp_plain", createdAt: 1)
            let plainData = plain.functionCall(ParsedToolCall(id: "c", name: "a.b", arguments: [:])).last?
                .split(separator: "\n").first { $0.hasPrefix("data: ") }.map { String($0.dropFirst("data: ".count)) } ?? "{}"
            let plainItem = ((try? JSONSerialization.jsonObject(with: Data(plainData.utf8))) as? [String: Any])?["item"] as? [String: Any]
            c.expect("an undeclared namespace leaves the name whole", plainItem?["name"] as? String == "a.b" && plainItem?["namespace"] == nil)
        } catch { c.expect("namespace bundle parses", false, "\(error)") }
        c.expect("non-function namespace member refused", rejected(["tools": [["type": "namespace", "name": "ns",
            "tools": [["type": "custom", "name": "x", "format": ["type": "grammar"]]]]]], "unsupported_tool"))
        var strict = codexExecCommandTool; strict["strict"] = true
        c.expect("strict schema guarantee is not invented", rejected(["tools": [strict]], "unsupported_tool"))
        c.expect("allowed_tools choice refused", rejected(["tool_choice": ["type": "allowed_tools", "mode": "auto", "tools": []]], "unsupported_field"))
        c.expect("undeclared forced tool refused", rejected(["tool_choice": ["type": "function", "name": "missing"]]))
        c.expect("unknown item type refused", rejected(["input": [["type": "local_shell_call", "call_id": "x", "action": [:]]]], "unsupported_item"))
        c.expect("file id image refused", rejected(["input": [["role": "user", "content": [["type": "input_image", "file_id": "file_1"]]]]], "unsupported_field"))
        c.expect("audio refused", rejected(["input": [["role": "user", "content": [["type": "input_audio", "audio_url": "data:audio/wav;base64,AA=="]]]]], "unsupported_field"))
        c.expect("foreign encrypted reasoning refused", rejected(["input": [["role": "user", "content": "hi"],
            ["type": "reasoning", "summary": [], "encrypted_content": "gAAAA"], ["role": "user", "content": "x"]]], "unsupported_field"))
        c.expect("trailing assistant refused", rejected(["input": [["role": "user", "content": "hi"], ["role": "assistant", "content": "prefill"]]], "assistant_prefill_unsupported"))
        c.expect("orphan output refused", rejected(["input": [["role": "user", "content": "hi"], ["type": "function_call_output", "call_id": "nope", "output": "x"]]]))
        c.expect("missing output refused", rejected(["input": [["role": "user", "content": "hi"],
            ["type": "function_call", "call_id": "c1", "name": "exec_command", "arguments": "{}"], ["role": "user", "content": "x"]]]))
        c.expect("duplicate output refused", rejected(["input": [["role": "user", "content": "hi"],
            ["type": "function_call", "call_id": "c1", "name": "exec_command", "arguments": "{}"],
            ["type": "function_call_output", "call_id": "c1", "output": "a"], ["type": "function_call_output", "call_id": "c1", "output": "b"],
            ["role": "user", "content": "x"]]]))
        c.expect("empty input refused", rejected(["input": []]))
        c.expect("developer image refused", rejected(["input": [["role": "developer", "content": [["type": "input_image", "image_url": codexImage]]], ["role": "user", "content": "hi"]]]))
        c.expect("numeric boolean refused", rejected(["parallel_tool_calls": 1]))
        c.expect("bad effort refused", rejected(["reasoning": ["effort": "lots"]]))
        c.expect("unknown item field refused", rejected(["input": [["role": "user", "content": "hi", "surprise": 1]]]))
        return c.report()
    }

    static func responsesEvents() -> CheckReport {
        var c = CheckBuilder("responses-events")
        func decode(_ frame: String) -> (event: String, data: [String: Any])? {
            let lines = frame.split(separator: "\n", omittingEmptySubsequences: false)
            guard lines.count >= 4, lines[0].hasPrefix("event: "), lines[1].hasPrefix("data: "),
                lines[2].isEmpty, lines[3].isEmpty,
                let obj = try? JSONSerialization.jsonObject(with: Data(lines[1].dropFirst("data: ".count).utf8)) as? [String: Any]
            else { return nil }
            return (String(lines[0].dropFirst("event: ".count)), obj)
        }
        let s = ResponsesDialect.ResponseStream(model: "qwen3.8-flash-next:4bit", id: "resp_fixture000000", createdAt: 1_700_000_000)
        var frames: [String] = []
        frames += s.created()
        frames += s.reasoning("I ")
        frames += s.reasoning("think")
        frames += s.text("Hel")
        frames += s.text("lo")
        frames += s.functionCall(ParsedToolCall(id: "call_1", name: "exec_command",
            arguments: ["cmd": .string("ls"), "yield_time_ms": .int(10000)], order: ["cmd", "yield_time_ms"]))
        frames += s.text("Done.")
        let usage = ResponsesDialect.Usage(input: 6136, cached: 6000, output: 29, reasoning: 4)
        frames += s.finish(engineReason: "stop", usage: usage)
        let decoded = frames.compactMap(decode)
        c.equal("every frame is event plus JSON data", decoded.count, frames.count)
        let kinds = decoded.map(\.event)
        c.expect("type field matches the event line", decoded.allSatisfy { ($0.data["type"] as? String) == $0.event })
        let sequence = decoded.compactMap { $0.data["sequence_number"] as? Int }
        c.equal("sequence numbers count from zero", sequence, Array(0..<frames.count))
        c.equal("stream opens with created then in_progress", Array(kinds.prefix(2)), ["response.created", "response.in_progress"])
        let response = decoded.first?.data["response"] as? [String: Any]
        c.equal("created carries the response id", response?["id"] as? String, "resp_fixture000000")
        c.equal("created status", response?["status"] as? String, "in_progress")
        func index(_ event: String, from: Int = 0) -> Int? { kinds[from...].firstIndex(of: event) }
        // Ordering rules Codex depends on.
        let reasoningAdded = index("response.output_item.added"), reasoningDelta = index("response.reasoning_summary_text.delta")
        c.expect("reasoning item announced before its first delta", reasoningAdded != nil && reasoningDelta != nil && reasoningAdded! < reasoningDelta!)
        let firstText = index("response.output_text.delta")
        let messageAdded = decoded.firstIndex { $0.event == "response.output_item.added" && (($0.data["item"] as? [String: Any])?["type"] as? String) == "message" }
        c.expect("message item announced before its first text delta", messageAdded != nil && firstText != nil && messageAdded! < firstText!)
        let textDelta = frames.compactMap(decode).first { $0.event == "response.output_text.delta" }
        c.expect("text deltas carry the empty logprobs list the SDK models require",
            (textDelta?.data["logprobs"] as? [Any])?.isEmpty == true)
        let reasoningDone = decoded.firstIndex { $0.event == "response.output_item.done" && (($0.data["item"] as? [String: Any])?["type"] as? String) == "reasoning" }
        c.expect("reasoning closes before text opens", reasoningDone != nil && messageAdded != nil && reasoningDone! < messageAdded!)
        let reasoningItem = decoded[reasoningDone ?? 0].data["item"] as? [String: Any]
        let summary = (reasoningItem?["summary"] as? [[String: Any]])?.first
        c.equal("reasoning summary text is the whole thought", summary?["text"] as? String, "I think")
        c.expect("reasoning item has no encrypted content", reasoningItem?["encrypted_content"] is NSNull)
        let callDone = decoded.firstIndex { $0.event == "response.output_item.done" && (($0.data["item"] as? [String: Any])?["type"] as? String) == "function_call" }
        let firstMessageDone = decoded.firstIndex { $0.event == "response.output_item.done" && (($0.data["item"] as? [String: Any])?["type"] as? String) == "message" }
        c.expect("text closes before the call is delivered", firstMessageDone != nil && callDone != nil && firstMessageDone! < callDone!)
        let callItem = decoded[callDone ?? 0].data["item"] as? [String: Any]
        c.equal("call keeps its id", callItem?["call_id"] as? String, "call_1")
        c.equal("call name", callItem?["name"] as? String, "exec_command")
        c.equal("arguments are compact JSON text in emission order", callItem?["arguments"] as? String, #"{"cmd":"ls","yield_time_ms":10000}"#)
        c.equal("call status completed", callItem?["status"] as? String, "completed")
        let argumentsDone = decoded.first { $0.event == "response.function_call_arguments.done" }
        c.equal("arguments.done repeats the arguments", argumentsDone?.data["arguments"] as? String, #"{"cmd":"ls","yield_time_ms":10000}"#)
        let firstMessage = decoded[firstMessageDone ?? 0].data["item"] as? [String: Any]
        let firstPart = (firstMessage?["content"] as? [[String: Any]])?.first
        c.equal("message text is the concatenated deltas", firstPart?["text"] as? String, "Hello")
        c.equal("message status completed", firstMessage?["status"] as? String, "completed")
        c.equal("stream ends with completed", kinds.last, "response.completed")
        let completed = decoded.last?.data["response"] as? [String: Any]
        c.equal("completed status", completed?["status"] as? String, "completed")
        c.equal("completed keeps the id", completed?["id"] as? String, "resp_fixture000000")
        let u = completed?["usage"] as? [String: Any]
        c.equal("usage.input_tokens", u?["input_tokens"] as? Int, 6136)
        c.equal("usage.output_tokens", u?["output_tokens"] as? Int, 29)
        c.equal("usage.total_tokens", u?["total_tokens"] as? Int, 6165)
        c.equal("cached tokens are the prefix hit", (u?["input_tokens_details"] as? [String: Any])?["cached_tokens"] as? Int, 6000)
        c.equal("cache writes are reported as zero", (u?["input_tokens_details"] as? [String: Any])?["cache_write_tokens"] as? Int, 0)
        c.equal("reasoning tokens reported", (u?["output_tokens_details"] as? [String: Any])?["reasoning_tokens"] as? Int, 4)
        let outputs = completed?["output"] as? [[String: Any]] ?? []
        c.equal("output lists every item in order", outputs.map { $0["type"] as? String ?? "" },
            ["reasoning", "message", "function_call", "message"])
        let ids = outputs.compactMap { $0["id"] as? String }
        c.equal("item ids are distinct", Set(ids).count, ids.count)
        c.expect("item ids carry the response suffix", ids.allSatisfy { $0.contains("fixture00000") })
        c.expect("accumulated text is both messages", s.text == "HelloDone." && s.reasoning == "I think")

        // The two endings that are not a plain completion.
        let cut = ResponsesDialect.ResponseStream(model: "m", id: "resp_cut", createdAt: 1)
        _ = cut.text("half")
        let cutFrames = cut.finish(engineReason: "length", usage: ResponsesDialect.Usage(input: 1, cached: 0, output: 8, reasoning: 0))
        let cutLast = decode(cutFrames.last ?? "")
        c.equal("running out of tokens is incomplete", cutLast?.event, "response.incomplete")
        c.equal("incomplete names its reason",
            ((cutLast?.data["response"] as? [String: Any])?["incomplete_details"] as? [String: Any])?["reason"] as? String, "max_output_tokens")
        let called = ResponsesDialect.ResponseStream(model: "m", id: "resp_called", createdAt: 1)
        _ = called.functionCall(ParsedToolCall(id: "c", name: "exec_command", arguments: [:]))
        c.equal("a delivered call completes even at the token limit",
            decode(called.finish(engineReason: "length", usage: ResponsesDialect.Usage(input: 1, cached: 0, output: 8, reasoning: 0)).last ?? "")?.event,
            "response.completed")
        let failed = ResponsesDialect.ResponseStream(model: "m", id: "resp_failed", createdAt: 1)
        _ = failed.text("partial")
        let failure = decode(failed.fail(code: "context_length_exceeded", message: "too long").first ?? "")
        c.equal("failure is response.failed", failure?.event, "response.failed")
        let err = (failure?.data["response"] as? [String: Any])?["error"] as? [String: Any]
        c.equal("failure carries the code Codex reads", err?["code"] as? String, "context_length_exceeded")
        c.equal("failure status", (failure?.data["response"] as? [String: Any])?["status"] as? String, "failed")
        c.expect("a failed partial item is not reported complete",
            ((failure?.data["response"] as? [String: Any])?["output"] as? [Any])?.isEmpty == true)
        let keep = decode(s.keepalive())
        c.equal("keepalive is a real event, not a comment", keep?.event, "response.in_progress")

        // The non-streaming reply is the completed frame's response.
        let whole = ResponsesDialect.ResponseStream(model: "m", id: "resp_whole", createdAt: 1)
        _ = whole.text("Hi")
        let object = whole.finished(engineReason: "stop", usage: ResponsesDialect.Usage(input: 2, cached: 0, output: 1, reasoning: 0))
        c.equal("non-stream object is completed", object["status"] as? String, "completed")
        c.equal("non-stream object lists its message", ((object["output"] as? [[String: Any]])?.first?["type"] as? String), "message")
        c.expect("non-stream object has usage", object["usage"] is [String: Any])
        c.equal("object repeats the default tool choice", object["tool_choice"] as? String, "auto")
        c.equal("object repeats parallel_tool_calls", object["parallel_tool_calls"] as? Bool, true)
        c.equal("object repeats an empty tool list", (object["tools"] as? [Any])?.count, 0)
        c.expect("object reports that nothing is stored", object["store"] as? Bool == false)
        c.expect("object nulls absent instructions", object["instructions"] is NSNull)
        c.equal("object text format defaults to text",
            ((object["text"] as? [String: Any])?["format"] as? [String: Any])?["type"] as? String, "text")
        let echoed = ResponsesDialect.ResponseStream(model: "m", id: "resp_echo", createdAt: 1,
            echo: ResponsesDialect.echoed(["tool_choice": "required", "temperature": 0.2, "text": ["verbosity": "low"]]))
        let echoObject = echoed.finished(engineReason: "stop", usage: ResponsesDialect.Usage(input: 1, cached: 0, output: 0, reasoning: 0))
        c.equal("object repeats a sent tool choice", echoObject["tool_choice"] as? String, "required")
        c.equal("object repeats a sent temperature", echoObject["temperature"] as? Double, 0.2)
        c.equal("object keeps the text format beside a sent verbosity",
            ((echoObject["text"] as? [String: Any])?["format"] as? [String: Any])?["type"] as? String, "text")
        c.equal("...and the verbosity", (echoObject["text"] as? [String: Any])?["verbosity"] as? String, "low")
        return c.report()
    }

    static func responsesReplay() -> CheckReport {
        var c = CheckBuilder("responses-replay")
        let user: [String: Any] = ["role": "user", "content": "Inspect the fixture."]
        let usage = ResponsesDialect.Usage(input: 1, cached: 0, output: 1, reasoning: 0)
        for custom in [false, true] {
            for reasoning in [false, true] {
                let label = "\(custom ? "custom" : "function") call followed by \(reasoning ? "reasoning" : "text")"
                let name = custom ? "apply_patch" : "exec_command"
                let tool: [String: Any] = ["type": custom ? "custom" : "function", "name": name]
                let s = ResponsesDialect.ResponseStream(model: "m", id: "resp_replay", createdAt: 1,
                    freeform: custom ? [name] : [])
                _ = s.text("Before.")
                _ = s.functionCall(ParsedToolCall(id: "call_1", name: name, arguments: ["input": .string("first")]))
                if reasoning { _ = s.reasoning("Continue thinking.") } else { _ = s.text("After.") }
                _ = s.functionCall(ParsedToolCall(id: "call_2", name: name, arguments: ["input": .string("second")]))
                let response = s.finished(engineReason: "stop", usage: usage)
                let resultType = custom ? "custom_tool_call_output" : "function_call_output"
                let first: [String: Any] = ["type": resultType, "call_id": "call_1", "output": "first result"]
                let second: [String: Any] = ["type": resultType, "call_id": "call_2", "output": "second result"]
                do {
                    // Clients append the complete output before the tool results.
                    // Cross the JSON boundary so this replays actual wire values.
                    let data = try JSONSerialization.data(withJSONObject: response)
                    let wire = try JSONSerialization.jsonObject(with: data) as! [String: Any]
                    let items = wire["output"] as! [[String: Any]]
                    let r = try ResponsesDialect.parse(["input": [user] + items + [second, first], "tools": [tool]])
                    c.equal("\(label): message roles", r.messages.map(\.role), ["user", "assistant", "tool", "tool"])
                    let assistant = r.messages.first { $0.role == "assistant" }
                    c.equal("\(label): content preserved", assistant?.content, reasoning ? "Before." : "Before.After.")
                    c.equal("\(label): reasoning preserved", assistant?.reasoning, reasoning ? "Continue thinking." : nil)
                    c.equal("\(label): calls stay in order", assistant?.toolCalls.map(\.id), ["call_1", "call_2"])
                    c.equal("\(label): arguments preserved", assistant?.toolCalls.map { $0.arguments["input"] },
                        [.string("first"), .string("second")])
                    c.equal("\(label): results restore call order", r.messages.filter { $0.role == "tool" }.map(\.toolCallId),
                        ["call_1", "call_2"])
                    c.equal("\(label): result content preserved", r.messages.filter { $0.role == "tool" }.map(\.content),
                        ["first result", "second result"])
                } catch { c.expect("\(label): complete response replays", false, "\(error)") }
            }
        }

        let call1: [String: Any] = ["type": "function_call", "call_id": "call_1", "name": "exec_command", "arguments": "{}"]
        let call2: [String: Any] = ["type": "function_call", "call_id": "call_2", "name": "exec_command", "arguments": "{}"]
        let result1: [String: Any] = ["type": "function_call_output", "call_id": "call_1", "output": "first result"]
        let result2: [String: Any] = ["type": "function_call_output", "call_id": "call_2", "output": "second result"]
        let text: [String: Any] = ["role": "assistant", "content": "Another turn."]
        let thought: [String: Any] = ["type": "reasoning", "summary": [["type": "summary_text", "text": "Another thought."]]]
        func rejected(_ items: [[String: Any]]) -> Bool {
            do { _ = try ResponsesDialect.parse(["input": items]); return false }
            catch let failure as ResponsesDialect.Failure { return failure.code == "invalid_request" }
            catch { return false }
        }
        c.expect("missing result still refused", rejected([user, call1, text]))
        c.expect("duplicate result still refused", rejected([user, call1, result1, result1]))
        c.expect("user before results still refused", rejected([user, call1, user, result1]))
        for (label, continuation) in [("text", text), ("reasoning", thought)] {
            let context: [String: Any] = ["role": "developer", "content": "Updated context."]
            c.expect("\(label) cannot continue a flushed turn", rejected([user, call1, context, continuation, result1]))
            c.expect("\(label) after partial results refused", rejected([user, call1, call2, result1, continuation, result2]))
            let call3: [String: Any] = ["type": "function_call", "call_id": "call_3", "name": "exec_command", "arguments": "{}"]
            let result3: [String: Any] = ["type": "function_call_output", "call_id": "call_3", "output": "third result"]
            c.expect("another call cannot reopen a flushed turn for \(label)",
                rejected([user, call1, context, call2, continuation, result1, result2]))
            c.expect("another call cannot reopen \(label) during partial results",
                rejected([user, call1, call2, result1, call3, continuation, result2, result3]))
        }
        do {
            let r = try ResponsesDialect.parse(["input": [user, call1, call2, result2, result1, thought, text, user]])
            c.equal("completed results allow a new assistant turn", r.messages.map(\.role),
                ["user", "assistant", "tool", "tool", "assistant", "user"])
            c.equal("new assistant turn keeps its own content", r.messages[4].content, "Another turn.")
            c.equal("new assistant turn keeps its own reasoning", r.messages[4].reasoning, "Another thought.")
        } catch { c.expect("completed results allow a new assistant turn", false, "\(error)") }
        return c.report()
    }

    static func responsesCodexTools() -> CheckReport {
        var c = CheckBuilder("responses-codex-tools")
        let body: [String: Any] = ["model": "qwen3.8-flash-next:4bit", "input": "hi",
            "tools": [codexExecCommandTool, codexWriteStdinTool, codexUpdatePlanTool, codexViewImageTool]]
        guard let request = try? ResponsesDialect.parse(body) else {
            c.expect("Codex's tool set parses", false)
            return c.report()
        }
        c.equal("all four tools kept", request.tools.map(\.name), ["exec_command", "write_stdin", "update_plan", "view_image"])
        let schemas = request.tools.map(\.schema)
        let exec = schemas[0], stdin = schemas[1], plan = schemas[2]
        c.equal("yield_time_ms is a number", exec.params["yield_time_ms"], .number)
        c.equal("tty is a boolean", exec.params["tty"], .boolean)
        c.equal("cmd is a string", exec.params["cmd"], .string)
        c.equal("session_id is a number", stdin.params["session_id"], .number)
        c.equal("plan is an array", plan.params["plan"], .array)

        // What the model emits for Codex's own apply_patch convention: a
        // multi-line heredoc inside `cmd`, with typed scalars beside it.
        let generated = """
            I'll write the file.

            <tool_call>
            <function=exec_command>
            <parameter=cmd>
            apply_patch <<'EOF'
            *** Begin Patch
            *** Add File: hello.txt
            +SLOTSTREAM OK
            *** End Patch
            EOF
            </parameter>
            <parameter=yield_time_ms>
            10000
            </parameter>
            <parameter=tty>
            false
            </parameter>
            </function>
            </tool_call>
            """
        let events = ToolCallSplitter.parseAll(generated, tools: schemas, idFactory: { "call_fixed" })
        let calls = events.compactMap { event -> ParsedToolCall? in
            if case .toolCall(let call) = event { return call }
            return nil
        }
        c.equal("one call parsed", calls.count, 1)
        let call = calls.first
        c.equal("heredoc survives as one string", call?.arguments["cmd"],
            .string("apply_patch <<'EOF'\n*** Begin Patch\n*** Add File: hello.txt\n+SLOTSTREAM OK\n*** End Patch\nEOF"))
        c.equal("number coerced", call?.arguments["yield_time_ms"], .int(10000))
        c.equal("boolean coerced", call?.arguments["tty"], .bool(false))
        let s = ResponsesDialect.ResponseStream(model: "m", id: "resp_tools", createdAt: 1)
        let frames = s.functionCall(call ?? ParsedToolCall(id: "x", name: "x", arguments: [:]))
        let done = frames.last ?? ""
        let data = done.split(separator: "\n").first { $0.hasPrefix("data: ") }.map { String($0.dropFirst("data: ".count)) } ?? "{}"
        let object = (try? JSONSerialization.jsonObject(with: Data(data.utf8))) as? [String: Any]
        let item = object?["item"] as? [String: Any]
        let arguments = item?["arguments"] as? String ?? ""
        let parsed = (try? JSONSerialization.jsonObject(with: Data(arguments.utf8))) as? [String: Any]
        c.equal("arguments round-trip as a JSON object Codex can parse", parsed?["yield_time_ms"] as? Int, 10000)
        c.equal("heredoc newlines survive JSON encoding", (parsed?["cmd"] as? String)?.components(separatedBy: "\n").count, 6)
        c.equal("boolean survives", parsed?["tty"] as? Bool, false)
        return c.report()
    }
}
