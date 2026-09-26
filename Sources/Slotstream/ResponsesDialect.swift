// The OpenAI Responses API dialect: what Codex speaks.
//
// OpenAI removed Chat Completions from Codex in February 2026 (openai/codex
// discussion 7782), so `POST /v1/responses` is the only wire Codex can drive
// this server over. This file is the whole contract, and it is deliberately
// pure in the style of GatewayDialect: parsing, validation and event
// construction are functions over values, with no socket and no engine, so the
// T0 gates run the real contract on any machine in milliseconds.
//
// Four details of Codex's consumer decide shapes here; each was read from its
// source (codex-rs/codex-api/src/sse/responses.rs, codex-rs/core/src/session/turn.rs)
// because each is a way to be silently wrong:
//
//   * `response.output_item.added` must precede the first `output_text.delta`
//     of a message. Codex only streams text for an *active* item; deltas that
//     arrive before the item was announced are dropped from the live view.
//   * The idle timer counts SSE events, not bytes, so a comment line does not
//     reset it. A multi-minute prefill needs real `response.in_progress`
//     events as its keepalive.
//   * `response.completed` must carry `response.id` and `usage`, and a stream
//     that closes without it is an error. `response.incomplete` is an error
//     too, so it is used only for the case the specification names: the reply
//     ran out of tokens before it finished, with no complete call to deliver.
//   * `response.failed` is read for `error.code`; `context_length_exceeded`
//     is the one code Codex understands specially.
//
// Codex echoes a reasoning item's `summary` on the next turn and drops its raw
// `content`, so the model's `<think>` text streams as summary text: that is
// what the user sees in Codex, and what comes back for the template to replay.

import Foundation

public enum ResponsesDialect {

    // MARK: - Errors

    /// A request that never reaches the model. `code` is the stable snake_case
    /// identifier, `message` the sentence the client shows. The body is the
    /// OpenAI error shape, which is also what Codex reads on a 400.
    public struct Failure: Error, Equatable, CustomStringConvertible {
        public let code: String
        public let message: String
        public init(_ code: String, _ message: String) {
            self.code = code
            self.message = message
        }
        public var description: String { message }
        public var body: [String: Any] {
            ["error": ["message": message, "type": "invalid_request_error", "code": code]]
        }
    }

    // MARK: - Request

    public struct Request {
        public var messages: [ChatMessage]
        public var tools: [ToolDefinition]
        public var choice: GatewayDialect.ToolChoice
        public var parallel: Bool
        public var thinking: Bool
        public var effort: String?
        public var maxOutputTokens: Int?
        public var temperature: Float?
        public var topP: Float?
        public var stream: Bool
        /// Namespaces whose member tools were flattened to `namespace.name`;
        /// a call to one is reported back with its `namespace` field set.
        public var namespaces: Set<String>
        /// Freeform (`custom`) tools, rendered for the model as functions with
        /// one `input` parameter; a call to one is reported back as a
        /// `custom_tool_call` carrying that text as its `input`.
        public var freeform: Set<String>
        /// Request parameters the response object repeats; see `echoed`.
        public var echo: [String: Any]
        public var hasImages: Bool { messages.contains { !$0.images.isEmpty } }
    }

    /// Top-level fields the Responses API defines, plus the two Codex adds
    /// (`client_metadata`, `access_programs`). Anything outside this set is
    /// refused by name, this server's house style. The set is pinned to the
    /// specification rather than to what Codex sends today, so a field the
    /// API already defines and a future Codex starts sending is handled by
    /// the rules below rather than being fatal.
    static let knownFields: Set<String> = [
        "model", "input", "instructions", "tools", "tool_choice", "parallel_tool_calls",
        "reasoning", "max_output_tokens", "temperature", "top_p", "stream", "store", "include",
        "metadata", "prompt_cache_key", "prompt_cache_retention", "safety_identifier", "user",
        "service_tier", "stream_options", "text", "truncation", "previous_response_id",
        "conversation", "background", "max_tool_calls", "top_logprobs", "prompt",
        "context_management", "client_metadata", "access_programs",
    ]

    /// Tool types the API executes on its own servers. The model cannot run
    /// them here, so they are dropped before rendering, as the gateway does:
    /// showing the model a tool nothing will execute invites a call that can
    /// only fail. Codex never sends them to a custom provider.
    static let hostedToolTypes: Set<String> = [
        "web_search", "web_search_preview", "web_search_preview_2025_03_11", "file_search",
    ]

    /// Reasoning effort labels the API defines. `none` and `minimal` switch
    /// thinking off; the rest map through the gateway's table so every dialect
    /// agrees on what "high" means for this model.
    static let effortLabels: Set<String> = ["none", "minimal", "low", "medium", "high", "xhigh", "max"]

    public static func parse(_ raw: [String: Any]) throws -> Request {
        let json = raw.filter { !($0.value is NSNull) }
        let unknown = Set(json.keys).subtracting(knownFields).sorted()
        if !unknown.isEmpty {
            throw Failure("unsupported_field", "unsupported request field(s): \(unknown.joined(separator: ", "))")
        }
        // Server-side state. This server stores nothing, so every request must
        // carry its whole conversation, which is what Codex does (`store: false`).
        for key in ["previous_response_id", "conversation"] where json[key] != nil {
            throw Failure("stored_state_unsupported",
                "\(key) is not supported: this server stores no responses; send the full input each time")
        }
        if json["prompt"] != nil {
            throw Failure("unsupported_field", "prompt templates are not supported; send instructions and input")
        }
        if json["context_management"] != nil {
            throw Failure("unsupported_field", "context_management is not supported; the client owns compaction")
        }
        if let v = json["background"] {
            guard let b = boolean(v) else { throw Failure("invalid_request", "background must be true or false") }
            if b { throw Failure("unsupported_field", "background responses are not supported; stream or wait for the reply") }
        }
        for key in ["max_tool_calls", "top_logprobs"] where json[key] != nil {
            throw Failure("unsupported_field", "\(key) is not supported")
        }
        if let v = json["truncation"] {
            guard let s = v as? String, s == "disabled" || s == "auto" else {
                throw Failure("invalid_request", "truncation must be \"disabled\" or \"auto\"")
            }
            if s == "auto" {
                throw Failure("unsupported_field",
                    "truncation \"auto\" is not supported: this server never drops context; send a shorter input")
            }
        }
        if let v = json["text"] {
            guard let text = v as? [String: Any] else { throw Failure("invalid_request", "text must be an object") }
            let extra = Set(text.keys).subtracting(["format", "verbosity"]).sorted()
            if !extra.isEmpty { throw Failure("unsupported_field", "unsupported text field(s): \(extra.joined(separator: ", "))") }
            if let format = text["format"], !(format is NSNull) {
                guard let f = format as? [String: Any], (f["type"] as? String) == "text" else {
                    throw Failure("unsupported_field",
                        "text.format is not supported for constrained output; only {\"type\": \"text\"} is supported")
                }
            }
            if let verbosity = text["verbosity"], !(verbosity is NSNull) {
                guard let s = verbosity as? String, ["low", "medium", "high"].contains(s) else {
                    throw Failure("invalid_request", "text.verbosity must be low, medium, or high")
                }
            }
        }
        // Accepted without effect: `store` (nothing is stored either way, and
        // the API's default is true, so refusing it would refuse every stock
        // client), `include` (encrypted reasoning does not exist here),
        // `metadata`, `prompt_cache_key`, `prompt_cache_retention`,
        // `safety_identifier`, `user`, `service_tier`, `stream_options`,
        // `client_metadata`, `access_programs`. Their types are still checked
        // so a malformed request is named rather than half-read.
        if json["store"] != nil, boolean(json["store"]!) == nil { throw Failure("invalid_request", "store must be true or false") }
        if let v = json["include"], !(v is [Any]) { throw Failure("invalid_request", "include must be an array") }
        if let v = json["metadata"], !(v is [String: Any]) { throw Failure("invalid_request", "metadata must be an object") }
        for key in ["prompt_cache_key", "safety_identifier", "user", "service_tier", "prompt_cache_retention"]
        where json[key] != nil && json[key] as? String == nil {
            throw Failure("invalid_request", "\(key) must be text")
        }
        for key in ["stream_options", "client_metadata", "access_programs"]
        where json[key] != nil && json[key] as? [String: Any] == nil {
            throw Failure("invalid_request", "\(key) must be an object")
        }
        if json["model"] != nil, json["model"] as? String == nil { throw Failure("invalid_request", "model must be text") }

        let stream: Bool
        if let v = json["stream"] {
            guard let b = boolean(v) else { throw Failure("invalid_request", "stream must be true or false") }
            stream = b
        } else { stream = false }

        var maxOutputTokens: Int?
        if let v = json["max_output_tokens"] {
            guard let n = integer(v), n > 0 else { throw Failure("invalid_request", "max_output_tokens must be a positive integer") }
            maxOutputTokens = n
        }
        var temperature: Float?
        if let v = json["temperature"] {
            guard let d = number(v) else { throw Failure("invalid_request", "temperature must be a number") }
            temperature = Float(d)
        }
        var topP: Float?
        if let v = json["top_p"] {
            guard let d = number(v) else { throw Failure("invalid_request", "top_p must be a number") }
            topP = Float(d)
        }

        let (tools, names, namespaces, freeform) = try parseTools(json["tools"])
        let choice = try parseToolChoice(json["tool_choice"], declared: names)
        if choice == .required && tools.isEmpty { throw Failure("invalid_request", "tool_choice required needs at least one tool") }
        let parallel: Bool
        if let v = json["parallel_tool_calls"] {
            guard let b = boolean(v) else { throw Failure("invalid_request", "parallel_tool_calls must be true or false") }
            parallel = b
        } else { parallel = true }
        let (thinking, effort) = try parseReasoning(json["reasoning"])

        var systems: [String] = []
        if let v = json["instructions"] {
            guard let s = v as? String else { throw Failure("invalid_request", "instructions must be text") }
            if !s.isEmpty { systems.append(s) }
        }
        var messages: [ChatMessage]
        switch json["input"] {
        case let text as String:
            guard !text.isEmpty else { throw Failure("invalid_request", "input must not be empty") }
            messages = [ChatMessage(role: "user", content: text)]
        case let items as [Any]:
            guard !items.isEmpty else { throw Failure("invalid_request", "input must not be empty") }
            messages = try parseItems(items, leadingSystems: &systems)
        case nil:
            throw Failure("invalid_request", "input is required: text or an array of items")
        default:
            throw Failure("invalid_request", "input must be text or an array of items")
        }
        guard !messages.isEmpty else {
            throw Failure("invalid_request", "input needs at least one user, assistant, or tool item")
        }
        if messages.last?.role == "assistant" {
            throw Failure("assistant_prefill_unsupported", "input may not end with an assistant item")
        }
        if !systems.isEmpty {
            messages.insert(ChatMessage(role: "system", content: systems.joined(separator: "\n\n")), at: 0)
        }
        return Request(messages: messages, tools: tools, choice: choice, parallel: parallel,
            thinking: thinking, effort: effort, maxOutputTokens: maxOutputTokens,
            temperature: temperature, topP: topP, stream: stream, namespaces: namespaces, freeform: freeform,
            echo: echoed(json))
    }

    /// The request parameters a response object repeats. The API returns
    /// `tools`, `tool_choice`, `parallel_tool_calls` and the sampling and text
    /// settings on every response, and the official SDK models declare the
    /// first three as required, so a client that validates the object finds
    /// them. Values are repeated as sent, with the API's defaults where absent;
    /// `store` is always false and `previous_response_id` null because
    /// nothing is kept.
    public static func echoed(_ json: [String: Any]) -> [String: Any] {
        var text: [String: Any] = ["format": ["type": "text"] as [String: Any]]
        if let sent = json["text"] as? [String: Any] {
            if let format = sent["format"] as? [String: Any] { text["format"] = format }
            if let verbosity = sent["verbosity"] as? String { text["verbosity"] = verbosity }
        }
        return [
            "tools": json["tools"] ?? ([] as [Any]),
            "tool_choice": json["tool_choice"] ?? "auto",
            "parallel_tool_calls": json["parallel_tool_calls"] ?? true,
            "instructions": json["instructions"] ?? NSNull(),
            "temperature": json["temperature"] ?? NSNull(),
            "top_p": json["top_p"] ?? NSNull(),
            "max_output_tokens": json["max_output_tokens"] ?? NSNull(),
            "reasoning": json["reasoning"] ?? NSNull(),
            "text": text,
            "truncation": json["truncation"] ?? "disabled",
            "metadata": json["metadata"] ?? ([:] as [String: Any]),
            "user": json["user"] ?? NSNull(),
            "service_tier": json["service_tier"] ?? NSNull(),
            "previous_response_id": NSNull(),
            "background": false,
            "store": false,
        ]
    }

    // MARK: Tools

    /// Function tools, plus Codex's `namespace` bundles flattened to
    /// `namespace.name` functions.
    ///
    /// Codex sends its multi-agent tools as one `namespace` tool holding the
    /// functions, and calls one as `name` with a separate `namespace` field.
    /// The model's grammar has one flat function name, so a member renders as
    /// `namespace.name`, and a call to that dotted name is reported back split
    /// into the two fields Codex routes on. Hosted tools are dropped; every
    /// other tool type is refused by name.
    static func parseTools(_ value: Any?) throws -> ([ToolDefinition], Set<String>, Set<String>, Set<String>) {
        guard let value else { return ([], [], [], []) }
        guard let list = value as? [[String: Any]] else { throw Failure("invalid_request", "tools must be an array of tool objects") }
        var tools: [ToolDefinition] = []
        var names = Set<String>()
        var namespaces = Set<String>()
        var freeform = Set<String>()
        for (i, raw) in list.enumerated() {
            let tool = raw.filter { !($0.value is NSNull) }
            guard let type = tool["type"] as? String else { throw Failure("invalid_request", "tools[\(i)] needs a type") }
            if hostedToolTypes.contains(type) { continue }
            switch type {
            case "function":
                let definition = try functionTool(tool, at: "tools[\(i)]")
                guard names.insert(definition.name).inserted else {
                    throw Failure("invalid_request", "tools[\(i)]: duplicate function name '\(definition.name)'")
                }
                tools.append(definition)
            case "custom":
                // A freeform tool takes one block of raw text. Codex's
                // `apply_patch` is one, with a Lark grammar that the model is
                // shown in the description so it knows the syntax; the server
                // does not enforce the grammar, the receiving tool does.
                try require(tool, "tools[\(i)]", allowed: ["type", "name", "description", "format", "defer_loading"])
                guard let name = tool["name"] as? String, !name.isEmpty else { throw Failure("invalid_request", "tools[\(i)] needs a name") }
                guard names.insert(name).inserted else { throw Failure("invalid_request", "tools[\(i)]: duplicate tool name '\(name)'") }
                var description = tool["description"] as? String ?? ""
                if let format = tool["format"] as? [String: Any], (format["type"] as? String) == "grammar",
                    let definition = format["definition"] as? String, !definition.isEmpty {
                    let syntax = format["syntax"] as? String ?? "grammar"
                    description += "\n\nThe input must follow this \(syntax) grammar:\n" + definition
                }
                tools.append(ToolDefinition(name: name, description: description, parameters: .object([
                    "type": .string("object"),
                    "properties": .object(["input": .object([
                        "type": .string("string"),
                        "description": .string("The complete raw input for this tool, exactly as it should be received."),
                    ])]),
                    "required": .array([.string("input")]),
                ])))
                freeform.insert(name)
            case "namespace":
                try require(tool, "tools[\(i)]", allowed: ["type", "name", "description", "tools"])
                guard let namespace = tool["name"] as? String, !namespace.isEmpty, !namespace.contains(".") else {
                    throw Failure("invalid_request", "tools[\(i)]: a namespace needs a name without dots")
                }
                guard let members = tool["tools"] as? [[String: Any]] else {
                    throw Failure("invalid_request", "tools[\(i)].tools must be an array of function tools")
                }
                let about = tool["description"] as? String ?? ""
                for (j, rawMember) in members.enumerated() {
                    let member = rawMember.filter { !($0.value is NSNull) }
                    guard (member["type"] as? String) == "function" else {
                        throw Failure("unsupported_tool", "tools[\(i)].tools[\(j)]: only function tools are supported inside a namespace")
                    }
                    let definition = try functionTool(member, at: "tools[\(i)].tools[\(j)]")
                    let name = namespace + "." + definition.name
                    guard names.insert(name).inserted else {
                        throw Failure("invalid_request", "tools[\(i)].tools[\(j)]: duplicate function name '\(name)'")
                    }
                    let description = about.isEmpty ? definition.description : about + " " + definition.description
                    tools.append(ToolDefinition(name: name, description: description, parameters: definition.parameters))
                }
                namespaces.insert(namespace)
            default:
                throw Failure("unsupported_tool", "tools[\(i)]: tool type '\(type)' is not supported; only function tools run here")
            }
        }
        return (tools, names, namespaces, freeform)
    }

    static func functionTool(_ tool: [String: Any], at label: String) throws -> ToolDefinition {
        // `output_schema` and `defer_loading` are Codex additions with no
        // effect on a server that renders the input schema only.
        try require(tool, label, allowed: ["type", "name", "description", "parameters", "strict", "output_schema", "defer_loading"])
        guard let name = tool["name"] as? String, !name.isEmpty else { throw Failure("invalid_request", "\(label) needs a name") }
        if let strict = tool["strict"], boolean(strict) != false {
            throw Failure("unsupported_tool", "\(label): strict tool schemas are not supported; omit strict or use false")
        }
        if let d = tool["description"], !(d is String) { throw Failure("invalid_request", "\(label).description must be text") }
        let parameters = tool["parameters"] ?? ["type": "object", "properties": [:]] as [String: Any]
        guard let schema = parameters as? [String: Any] else { throw Failure("invalid_request", "\(label).parameters must be a JSON Schema object") }
        return ToolDefinition(name: name, description: tool["description"] as? String ?? "", parameters: JSONValue.from(schema))
    }

    static func parseToolChoice(_ value: Any?, declared: Set<String>) throws -> GatewayDialect.ToolChoice {
        guard let value else { return .auto }
        if let s = value as? String {
            switch s {
            case "auto": return .auto
            case "none": return .disabled
            case "required": return .required
            default: throw Failure("invalid_request", "tool_choice must be auto, none, required, or a function object")
            }
        }
        guard let object = value as? [String: Any], let type = object["type"] as? String else {
            throw Failure("invalid_request", "tool_choice must be auto, none, required, or a function object")
        }
        guard type == "function" || type == "custom" else {
            throw Failure("unsupported_field", "tool_choice type '\(type)' is not supported; only a named function or custom tool can be forced")
        }
        guard Set(object.keys).isSubset(of: ["type", "name"]), let name = object["name"] as? String, declared.contains(name) else {
            throw Failure("invalid_request", "tool_choice must name a declared tool")
        }
        return .tool(name)
    }

    static func parseReasoning(_ value: Any?) throws -> (Bool, String?) {
        guard let value, !(value is NSNull) else { return (false, nil) }
        guard let object = value as? [String: Any] else { throw Failure("invalid_request", "reasoning must be an object") }
        let extra = Set(object.keys).subtracting(["effort", "summary", "generate_summary"]).sorted()
        if !extra.isEmpty { throw Failure("unsupported_field", "unsupported reasoning field(s): \(extra.joined(separator: ", "))") }
        // `summary` and `generate_summary` ask how much of the reasoning to
        // show; this server always streams what the model thought.
        guard let effort = object["effort"], !(effort is NSNull) else { return (false, nil) }
        guard let label = effort as? String, effortLabels.contains(label) else {
            throw Failure("invalid_request", "reasoning.effort must be none, minimal, low, medium, high, xhigh, or max")
        }
        let mapped = GatewayDialect.mapReasoning(label)
        return (mapped.thinking, mapped.effort)
    }

    // MARK: Input items

    /// Conversation items to template messages.
    ///
    /// A Responses conversation is flat: an assistant turn arrives as separate
    /// `reasoning`, `message`, and `function_call` items, and tool results as
    /// `function_call_output` items keyed by `call_id`. The template wants one
    /// assistant message per turn with its calls attached, followed by one
    /// tool message per call in the order the calls were made, so consecutive
    /// assistant items are merged and results are re-ordered by their call.
    ///
    /// `system` and `developer` messages before the conversation starts join
    /// the instructions. After it starts they render as user text, which is
    /// what Codex itself does for its context fragments: the template renders
    /// one system turn and rejects a later one, so a mid-conversation
    /// developer message (Codex sends one after a model or mode switch) would
    /// otherwise fail the whole request.
    static func parseItems(_ items: [Any], leadingSystems systems: inout [String]) throws -> [ChatMessage] {
        var out: [ChatMessage] = []
        var assistant: ChatMessage?
        var pending: [String: String] = [:]
        var pendingOrder: [String] = []
        var pendingResults: [String: ChatMessage] = [:]
        var callIds = Set<String>()
        var started = false

        func flushAssistant() {
            if let a = assistant { out.append(a); assistant = nil }
        }
        func openAssistant() -> ChatMessage {
            assistant ?? ChatMessage(role: "assistant", content: "")
        }

        for (i, rawItem) in items.enumerated() {
            guard let itemRaw = rawItem as? [String: Any] else { throw Failure("invalid_request", "input[\(i)] must be an object") }
            let item = itemRaw.filter { !($0.value is NSNull) }
            let type = (item["type"] as? String) ?? (item["role"] != nil ? "message" : "")
            switch type {
            case "message":
                try require(item, "input[\(i)]", allowed: ["type", "id", "role", "content", "status", "phase", "internal_chat_message_metadata_passthrough"])
                guard let role = item["role"] as? String, ["system", "developer", "user", "assistant"].contains(role) else {
                    throw Failure("invalid_request", "input[\(i)].role must be system, developer, user, or assistant")
                }
                let content = try parseContent(item["content"], at: "input[\(i)]", allowEmpty: role == "assistant")
                switch role {
                case "system", "developer":
                    guard content.images.isEmpty else { throw Failure("invalid_request", "input[\(i)]: \(role) messages carry text only") }
                    if started || assistant != nil {
                        flushAssistant()
                        out.append(ChatMessage(role: "user", content: content.text))
                    } else {
                        systems.append(content.text)
                    }
                case "user":
                    flushAssistant()
                    started = true
                    if !pending.isEmpty { throw Failure("invalid_request", "input[\(i)] must first supply outputs for outstanding function calls") }
                    var m = ChatMessage(role: "user", content: content.text)
                    m.images = content.images
                    out.append(m)
                default:  // assistant
                    started = true
                    guard content.images.isEmpty else { throw Failure("invalid_request", "input[\(i)]: assistant messages carry text only") }
                    // Continuations must belong to the turn with every pending
                    // call, before any result arrives. A later call cannot
                    // reopen a turn flushed by intervening context.
                    if !pending.isEmpty && (assistant?.toolCalls.count != pending.count || !pendingResults.isEmpty) {
                        throw Failure("invalid_request", "input[\(i)] must first supply outputs for outstanding function calls")
                    }
                    var a = openAssistant()
                    a.content += content.text
                    assistant = a
                }
            case "reasoning":
                try require(item, "input[\(i)]", allowed: ["type", "id", "summary", "content", "encrypted_content", "status", "internal_chat_message_metadata_passthrough"])
                if let e = item["encrypted_content"] as? String, !e.isEmpty {
                    throw Failure("unsupported_field", "input[\(i)]: encrypted reasoning from another provider cannot be replayed here")
                }
                started = true
                if !pending.isEmpty && (assistant?.toolCalls.count != pending.count || !pendingResults.isEmpty) {
                    throw Failure("invalid_request", "input[\(i)] must first supply outputs for outstanding function calls")
                }
                let text = try reasoningText(item, at: "input[\(i)]")
                if !text.isEmpty {
                    var a = openAssistant()
                    a.reasoning = (a.reasoning.map { $0 + "\n" } ?? "") + text
                    assistant = a
                }
            case "function_call":
                try require(item, "input[\(i)]", allowed: ["type", "id", "call_id", "name", "arguments", "status", "namespace", "internal_chat_message_metadata_passthrough"])
                guard let bare = item["name"] as? String, !bare.isEmpty else { throw Failure("invalid_request", "input[\(i)] needs a function name") }
                let namespace = item["namespace"] as? String ?? ""
                let name = namespace.isEmpty ? bare : namespace + "." + bare
                guard let id = item["call_id"] as? String, !id.isEmpty else { throw Failure("invalid_request", "input[\(i)] needs a call_id") }
                guard callIds.insert(id).inserted else { throw Failure("invalid_request", "input[\(i)]: duplicate call_id '\(id)'") }
                let argumentsText = item["arguments"] as? String ?? ""
                let arguments: [String: JSONValue]
                if argumentsText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    arguments = [:]
                } else if case .object(let object)? = JSONValue.parse(argumentsText) {
                    arguments = object
                } else {
                    throw Failure("invalid_request", "input[\(i)].arguments must be a JSON object encoded as text")
                }
                started = true
                var a = openAssistant()
                a.toolCalls.append(ParsedToolCall(id: id, name: name, arguments: arguments))
                assistant = a
                pending[id] = name
                pendingOrder.append(id)
            case "custom_tool_call":
                try require(item, "input[\(i)]", allowed: ["type", "id", "call_id", "name", "input", "status", "namespace", "internal_chat_message_metadata_passthrough"])
                guard let name = item["name"] as? String, !name.isEmpty else { throw Failure("invalid_request", "input[\(i)] needs a tool name") }
                guard let id = item["call_id"] as? String, !id.isEmpty else { throw Failure("invalid_request", "input[\(i)] needs a call_id") }
                guard callIds.insert(id).inserted else { throw Failure("invalid_request", "input[\(i)]: duplicate call_id '\(id)'") }
                guard let input = item["input"] as? String else { throw Failure("invalid_request", "input[\(i)].input must be text") }
                started = true
                var a = openAssistant()
                a.toolCalls.append(ParsedToolCall(id: id, name: name, arguments: ["input": .string(input)], order: ["input"]))
                assistant = a
                pending[id] = name
                pendingOrder.append(id)
            case "function_call_output", "custom_tool_call_output":
                try require(item, "input[\(i)]", allowed: ["type", "id", "call_id", "output", "status", "name", "namespace", "internal_chat_message_metadata_passthrough"])
                guard let id = item["call_id"] as? String, let name = pending.removeValue(forKey: id) else {
                    throw Failure("invalid_request", "input[\(i)]: function_call_output must answer an outstanding call_id exactly once")
                }
                if let supplied = item["name"] as? String, !supplied.isEmpty, supplied != name {
                    throw Failure("invalid_request", "input[\(i)]: output name does not match its call")
                }
                flushAssistant()
                let content = try parseToolOutput(item["output"], at: "input[\(i)]")
                var result = ChatMessage(role: "tool", content: content.text, toolCallId: id, toolName: name)
                result.images = content.images
                pendingResults[id] = result
                if pending.isEmpty {
                    out.append(contentsOf: pendingOrder.map { pendingResults[$0]! })
                    pendingOrder.removeAll()
                    pendingResults.removeAll()
                }
            case "":
                throw Failure("invalid_request", "input[\(i)] needs a type")
            default:
                throw Failure("unsupported_item", "input[\(i)]: item type '\(type)' is not supported")
            }
        }
        flushAssistant()
        guard pending.isEmpty else { throw Failure("invalid_request", "input is missing outputs for function call(s): \(pendingOrder.joined(separator: ", "))") }
        return out
    }

    static func require(_ item: [String: Any], _ label: String, allowed: Set<String>) throws {
        let extra = Set(item.keys).subtracting(allowed).sorted()
        if !extra.isEmpty { throw Failure("invalid_request", "\(label) has unsupported field(s): \(extra.joined(separator: ", "))") }
    }

    /// Message content: text, or typed parts. Pictures come as `input_image`
    /// with an inline `image_url`, which is how Codex sends both a user's
    /// attachment and a `view_image` result. Only inline bytes are accepted;
    /// a `file_id` names a store this server does not have.
    static func parseContent(_ value: Any?, at label: String, allowEmpty: Bool) throws -> (text: String, images: [String]) {
        guard let value else {
            if allowEmpty { return ("", []) }
            throw Failure("invalid_request", "\(label) needs content")
        }
        if let text = value as? String { return (text, []) }
        guard let parts = value as? [[String: Any]] else { throw Failure("invalid_request", "\(label).content must be text or an array of parts") }
        var text: [String] = []
        var images: [String] = []
        for (j, rawPart) in parts.enumerated() {
            let part = rawPart.filter { !($0.value is NSNull) }
            let kind = part["type"] as? String ?? ""
            switch kind {
            case "input_text", "output_text", "text":
                try require(part, "\(label).content[\(j)]", allowed: ["type", "text", "annotations", "logprobs"])
                guard let t = part["text"] as? String else { throw Failure("invalid_request", "\(label).content[\(j)] needs text") }
                text.append(t)
            case "refusal":
                guard let t = part["refusal"] as? String else { throw Failure("invalid_request", "\(label).content[\(j)] needs refusal text") }
                text.append(t)
            case "input_image":
                try require(part, "\(label).content[\(j)]", allowed: ["type", "image_url", "file_id", "detail"])
                images.append(try imageSource(part, at: "\(label).content[\(j)]"))
            case "input_file":
                throw Failure("unsupported_field", "\(label).content[\(j)]: file inputs are not supported; send the text, or an image as input_image")
            case "input_audio":
                throw Failure("unsupported_field", "\(label).content[\(j)]: audio inputs are not supported")
            default:
                throw Failure("invalid_request", "\(label).content[\(j)]: unsupported content type '\(kind)'")
            }
        }
        return (text.joined(), images)
    }

    static func imageSource(_ part: [String: Any], at label: String) throws -> String {
        if part["file_id"] != nil {
            throw Failure("unsupported_field", "\(label): image file ids are not supported; send the picture inline as a data: URL")
        }
        guard let url = part["image_url"] as? String, !url.isEmpty else {
            throw Failure("invalid_request", "\(label): input_image needs an image_url (a data: URL or base64)")
        }
        return url
    }

    /// A tool result: plain text, or content items. Codex returns a
    /// `view_image` result as an `input_image` item, and the template renders
    /// a picture inside a tool response the same way it renders one in a user
    /// turn, so both are carried.
    static func parseToolOutput(_ value: Any?, at label: String) throws -> (text: String, images: [String]) {
        guard let value else { return ("", []) }
        if let text = value as? String { return (text, []) }
        guard let parts = value as? [[String: Any]] else { throw Failure("invalid_request", "\(label).output must be text or an array of content items") }
        var text: [String] = []
        var images: [String] = []
        for (j, rawPart) in parts.enumerated() {
            let part = rawPart.filter { !($0.value is NSNull) }
            switch part["type"] as? String ?? "" {
            case "input_text", "output_text", "text":
                guard let t = part["text"] as? String else { throw Failure("invalid_request", "\(label).output[\(j)] needs text") }
                text.append(t)
            case "input_image":
                images.append(try imageSource(part, at: "\(label).output[\(j)]"))
            case "input_file", "input_audio":
                throw Failure("unsupported_field", "\(label).output[\(j)]: only text and images can be returned to the model")
            case "encrypted_content":
                throw Failure("unsupported_field", "\(label).output[\(j)]: encrypted tool output from another provider cannot be replayed here")
            case let other:
                throw Failure("invalid_request", "\(label).output[\(j)]: unsupported content type '\(other)'")
            }
        }
        return (text.joined(separator: "\n"), images)
    }

    /// The text of a replayed reasoning item: raw `content` when a client kept
    /// it, otherwise the summary, which is all Codex keeps.
    static func reasoningText(_ item: [String: Any], at label: String) throws -> String {
        func texts(_ value: Any?, _ types: Set<String>, _ field: String) throws -> [String] {
            guard let value else { return [] }
            guard let parts = value as? [[String: Any]] else { throw Failure("invalid_request", "\(label).\(field) must be an array") }
            return try parts.map { part in
                guard let kind = part["type"] as? String, types.contains(kind), let t = part["text"] as? String else {
                    throw Failure("invalid_request", "\(label).\(field) has an unsupported part")
                }
                return t
            }
        }
        let content = try texts(item["content"], ["reasoning_text", "text"], "content")
        if !content.isEmpty { return content.joined(separator: "\n") }
        return try texts(item["summary"], ["summary_text"], "summary").joined(separator: "\n")
    }

    static func boolean(_ value: Any) -> Bool? {
        guard let n = value as? NSNumber, CFGetTypeID(n) == CFBooleanGetTypeID() else { return nil }
        return n.boolValue
    }
    static func integer(_ value: Any) -> Int? {
        guard let n = value as? NSNumber, CFGetTypeID(n) != CFBooleanGetTypeID() else { return nil }
        return Int(exactly: n)
    }
    static func number(_ value: Any) -> Double? {
        guard let n = value as? NSNumber, CFGetTypeID(n) != CFBooleanGetTypeID() else { return nil }
        let d = n.doubleValue
        guard d.isFinite, Float(d).isFinite else { return nil }
        return d
    }

    // MARK: - Response and events

    public struct Usage: Equatable {
        public var input: Int
        public var cached: Int
        public var output: Int
        public var reasoning: Int
        public init(input: Int, cached: Int, output: Int, reasoning: Int) {
            self.input = input; self.cached = cached; self.output = output; self.reasoning = reasoning
        }
        public var json: [String: Any] {
            [
                "input_tokens": input,
                "input_tokens_details": ["cached_tokens": cached, "cache_write_tokens": 0],
                "output_tokens": output,
                "output_tokens_details": ["reasoning_tokens": reasoning],
                "total_tokens": input + output,
            ]
        }
    }

    /// One response as it is being produced: the output items in order, the
    /// item currently open, and the event frames that describe each step.
    ///
    /// Every method returns the frames to write, in order, and never writes
    /// anything itself; the server owns the socket, and the T0 gates read the
    /// frames as values. The non-streaming reply is the same object the
    /// `response.completed` frame carries.
    public final class ResponseStream {
        public let id: String
        public let model: String
        public let createdAt: Int
        private var sequence = 0
        private var items: [[String: Any]] = []
        private var openText: (id: String, index: Int, text: String)?
        private var openReasoning: (id: String, index: Int, text: String)?
        private var counter = 0
        public private(set) var callCount = 0
        public private(set) var text = ""
        public private(set) var reasoning = ""

        /// Namespaces declared by the request; see `parseTools`.
        public let namespaces: Set<String>
        /// Freeform tools declared by the request; see `parseTools`.
        public let freeform: Set<String>
        /// Request parameters repeated on the response object; see `echoed`.
        public let echo: [String: Any]

        public init(model: String, id: String? = nil, createdAt: Int? = nil, namespaces: Set<String> = [],
                    freeform: Set<String> = [], echo: [String: Any] = ResponsesDialect.echoed([:])) {
            self.model = model
            self.namespaces = namespaces
            self.freeform = freeform
            self.echo = echo
            self.id = id ?? "resp_" + UUID().uuidString.replacingOccurrences(of: "-", with: "").lowercased()
            self.createdAt = createdAt ?? Int(Date().timeIntervalSince1970)
        }

        /// One SSE frame: the event name line, then `data: ` and compact JSON,
        /// then a blank line. Codex reads only the data; the event line is
        /// what the specification shows and what other consumers key on.
        public func frame(_ type: String, _ fields: [String: Any] = [:]) -> String {
            var object = fields
            object["type"] = type
            object["sequence_number"] = sequence
            sequence += 1
            let data = (try? JSONSerialization.data(withJSONObject: object, options: [.sortedKeys])) ?? Data("{}".utf8)
            return "event: \(type)\ndata: " + String(decoding: data, as: UTF8.self) + "\n\n"
        }

        private func nextItemID(_ prefix: String) -> String {
            counter += 1
            return "\(prefix)_\(id.dropFirst("resp_".count).prefix(12))_\(counter)"
        }

        /// The response object at this moment.
        public func responseObject(status: String, usage: Usage? = nil, error: [String: Any]? = nil,
                                   incompleteReason: String? = nil) -> [String: Any] {
            let errorValue: Any = error.map { $0 as Any } ?? NSNull()
            let incompleteValue: Any = incompleteReason.map { ["reason": $0] as [String: Any] as Any } ?? NSNull()
            var r = echo
            for (key, value) in [
                "id": id, "object": "response", "created_at": createdAt, "status": status,
                "model": model, "output": items, "error": errorValue,
                "incomplete_details": incompleteValue,
            ] as [String: Any] { r[key] = value }
            if let usage { r["usage"] = usage.json }
            return r
        }

        /// The frames that open a stream: `response.created`, then an
        /// `in_progress` so the client has two events before any token.
        public func created() -> [String] {
            [frame("response.created", ["response": responseObject(status: "in_progress")]),
             keepalive()]
        }

        /// A real event, not a comment: Codex's idle timer only resets on an
        /// event, and a cold prefill here is minutes long.
        public func keepalive() -> String {
            frame("response.in_progress", ["response": responseObject(status: "in_progress")])
        }

        public func reasoning(_ delta: String) -> [String] {
            guard !delta.isEmpty else { return [] }
            var out: [String] = []
            out += closeText()
            if openReasoning == nil {
                let itemID = nextItemID("rs")
                let index = items.count
                openReasoning = (itemID, index, "")
                out.append(frame("response.output_item.added", [
                    "output_index": index,
                    "item": ["id": itemID, "type": "reasoning", "summary": [] as [Any], "encrypted_content": NSNull()],
                ]))
                out.append(frame("response.reasoning_summary_part.added", [
                    "item_id": itemID, "output_index": index, "summary_index": 0,
                    "part": ["type": "summary_text", "text": ""],
                ]))
            }
            openReasoning!.text += delta
            reasoning += delta
            out.append(frame("response.reasoning_summary_text.delta", [
                "item_id": openReasoning!.id, "output_index": openReasoning!.index, "summary_index": 0, "delta": delta,
            ]))
            return out
        }

        public func text(_ delta: String) -> [String] {
            guard !delta.isEmpty else { return [] }
            var out: [String] = []
            out += closeReasoning()
            if openText == nil {
                let itemID = nextItemID("msg")
                let index = items.count
                openText = (itemID, index, "")
                out.append(frame("response.output_item.added", [
                    "output_index": index,
                    "item": ["id": itemID, "type": "message", "role": "assistant", "status": "in_progress",
                             "content": [] as [Any]],
                ]))
                out.append(frame("response.content_part.added", [
                    "item_id": itemID, "output_index": index, "content_index": 0,
                    "part": ["type": "output_text", "text": "", "annotations": [] as [Any]],
                ]))
            }
            openText!.text += delta
            text += delta
            out.append(frame("response.output_text.delta", [
                "item_id": openText!.id, "output_index": openText!.index, "content_index": 0, "delta": delta,
                "logprobs": [] as [Any],
            ]))
            return out
        }

        /// A complete call. The parser publishes a call only after its closing
        /// tag, so the arguments arrive whole: one delta, then done.
        public func functionCall(_ call: ParsedToolCall) -> [String] {
            var out: [String] = []
            out += closeReasoning()
            out += closeText()
            if freeform.contains(call.name) { return out + customToolCall(call) }
            let itemID = nextItemID("fc")
            let index = items.count
            let arguments = call.inputJSON
            var name = call.name
            var namespace: String?
            if let dot = call.name.firstIndex(of: "."), namespaces.contains(String(call.name[..<dot])) {
                namespace = String(call.name[..<dot])
                name = String(call.name[call.name.index(after: dot)...])
            }
            var opened: [String: Any] = ["id": itemID, "type": "function_call", "status": "in_progress",
                                         "call_id": call.id, "name": name, "arguments": ""]
            if let namespace { opened["namespace"] = namespace }
            out.append(frame("response.output_item.added", ["output_index": index, "item": opened]))
            out.append(frame("response.function_call_arguments.delta", [
                "item_id": itemID, "output_index": index, "delta": arguments,
            ]))
            out.append(frame("response.function_call_arguments.done", [
                "item_id": itemID, "output_index": index, "arguments": arguments,
            ]))
            var item: [String: Any] = ["id": itemID, "type": "function_call", "status": "completed",
                                       "call_id": call.id, "name": name, "arguments": arguments]
            if let namespace { item["namespace"] = namespace }
            items.append(item)
            callCount += 1
            out.append(frame("response.output_item.done", ["output_index": index, "item": item]))
            return out
        }

        /// A freeform call: the model's `input` argument is the tool's raw
        /// text, delivered as one `custom_tool_call` item.
        private func customToolCall(_ call: ParsedToolCall) -> [String] {
            let itemID = nextItemID("ctc")
            let index = items.count
            let input: String
            if case .string(let text)? = call.arguments["input"] { input = text } else { input = call.arguments["input"]?.jsonText ?? "" }
            var out: [String] = []
            out.append(frame("response.output_item.added", [
                "output_index": index,
                "item": ["id": itemID, "type": "custom_tool_call", "status": "in_progress",
                         "call_id": call.id, "name": call.name, "input": ""],
            ]))
            out.append(frame("response.custom_tool_call_input.delta", ["item_id": itemID, "output_index": index, "delta": input]))
            out.append(frame("response.custom_tool_call_input.done", ["item_id": itemID, "output_index": index, "input": input]))
            let item: [String: Any] = ["id": itemID, "type": "custom_tool_call", "status": "completed",
                                       "call_id": call.id, "name": call.name, "input": input]
            items.append(item)
            callCount += 1
            out.append(frame("response.output_item.done", ["output_index": index, "item": item]))
            return out
        }

        private func closeText() -> [String] {
            guard let open = openText else { return [] }
            openText = nil
            let part: [String: Any] = ["type": "output_text", "text": open.text, "annotations": [] as [Any]]
            let item: [String: Any] = ["id": open.id, "type": "message", "role": "assistant",
                                       "status": "completed", "content": [part]]
            items.append(item)
            return [
                frame("response.output_text.done", ["item_id": open.id, "output_index": open.index, "content_index": 0,
                                                    "text": open.text, "logprobs": [] as [Any]]),
                frame("response.content_part.done", ["item_id": open.id, "output_index": open.index, "content_index": 0, "part": part]),
                frame("response.output_item.done", ["output_index": open.index, "item": item]),
            ]
        }

        private func closeReasoning() -> [String] {
            guard let open = openReasoning else { return [] }
            openReasoning = nil
            let part: [String: Any] = ["type": "summary_text", "text": open.text]
            let item: [String: Any] = ["id": open.id, "type": "reasoning", "summary": [part], "encrypted_content": NSNull()]
            items.append(item)
            return [
                frame("response.reasoning_summary_text.done", ["item_id": open.id, "output_index": open.index, "summary_index": 0, "text": open.text]),
                frame("response.reasoning_summary_part.done", ["item_id": open.id, "output_index": open.index, "summary_index": 0, "part": part]),
                frame("response.output_item.done", ["output_index": open.index, "item": item]),
            ]
        }

        /// Whether a finished generation is complete or ran out of tokens.
        ///
        /// A delivered call is whole by construction, so a turn that made one
        /// and then hit the limit still completed: the client's next move is to
        /// run the call, and an `incomplete` would make Codex discard it.
        public func isIncomplete(engineReason: String) -> Bool {
            engineReason == "length" && callCount == 0
        }

        /// Close whatever is open and end the stream.
        public func finish(engineReason: String, usage: Usage) -> [String] {
            var out: [String] = []
            out += closeReasoning()
            out += closeText()
            if isIncomplete(engineReason: engineReason) {
                out.append(frame("response.incomplete", [
                    "response": responseObject(status: "incomplete", usage: usage, incompleteReason: "max_output_tokens"),
                ]))
            } else {
                out.append(frame("response.completed", ["response": responseObject(status: "completed", usage: usage)]))
            }
            return out
        }

        /// The non-streaming reply for a finished generation.
        public func finished(engineReason: String, usage: Usage) -> [String: Any] {
            _ = closeReasoning()
            _ = closeText()
            if isIncomplete(engineReason: engineReason) {
                return responseObject(status: "incomplete", usage: usage, incompleteReason: "max_output_tokens")
            }
            return responseObject(status: "completed", usage: usage)
        }

        /// An error after the head went out. Nothing open is closed as
        /// complete: a partial item must not read as a finished one.
        public func fail(code: String, message: String) -> [String] {
            openText = nil
            openReasoning = nil
            return [frame("response.failed", [
                "response": responseObject(status: "failed", error: ["code": code, "message": message]),
            ])]
        }
    }
}
