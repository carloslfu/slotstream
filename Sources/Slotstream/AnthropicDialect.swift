// The Anthropic Messages API dialect: what Claude Code speaks.
//
// `POST /v1/messages`, with `ANTHROPIC_BASE_URL` pointed at this server, is how
// Claude Code, Pi's `anthropic-messages` providers and the Anthropic SDKs reach
// a local model. Like ResponsesDialect, this file is pure: parsing, validation
// and event construction are functions over values, with no socket and no
// engine, so the T0 gates run the real contract on any machine in milliseconds.
//
// Five decisions differ from the OpenAI dialects, each for a reason read from
// Claude Code 2.1.270's requests and its gateway guide:
//
//   * Unknown top-level fields are ignored, not refused. Claude Code adds a
//     request field in most releases, each paired with a beta header, and its
//     gateway guide asks servers in the path to accept them. A refusal would
//     break every Claude Code update until this file caught up. Fields that
//     ask for behavior this server cannot provide (`container`, `mcp_servers`,
//     `output_config.format`) are still refused by name, and ignored names are
//     reported to the client in the `x-slotstream-ignored-fields` header.
//   * The attribution line Claude Code puts at the top of the system prompt
//     (`x-anthropic-billing-header: ...`) is removed, as Anthropic's own API
//     removes it. It changes with every conversation, so keeping it would give
//     every prompt a different first line and defeat shared-prefix reuse.
//   * Thinking follows the request: off unless `thinking` asks for it. This
//     model's template thinks or does not, so `adaptive` means on, at the
//     requested `output_config.effort`.
//   * A thinking block's `signature` carries its own text. Claude Code asks
//     for `display: "omitted"` and replays the empty block it received; the
//     signature is what lets the model's reasoning survive a tool loop.
//   * A prompt over the window fails with `prompt is too long: N tokens > M
//     maximum`, the message Claude Code reads to compact and retry.

import Foundation

public enum AnthropicDialect {

    // MARK: - Errors

    /// A request that never reaches the model, in Anthropic's error shape.
    public struct Failure: Error, Equatable, CustomStringConvertible {
        public let type: String
        public let message: String
        public let status: String
        public init(_ message: String, type: String = "invalid_request_error", status: String = "400 Bad Request") {
            self.type = type
            self.message = message
            self.status = status
        }
        public var description: String { message }
        public var body: [String: Any] { AnthropicDialect.errorBody(type: type, message: message) }
    }

    public static func errorBody(type: String, message: String) -> [String: Any] {
        ["type": "error", "error": ["type": type, "message": message] as [String: Any]]
    }

    /// The Anthropic error type for an HTTP status this server returns.
    /// Claude Code retries `overloaded_error`, so a transient memory refusal
    /// maps there; everything else keeps the meaning of its status.
    public static func errorType(httpStatus: String) -> String {
        switch httpStatus.prefix(3) {
        case "400": return "invalid_request_error"
        case "401": return "authentication_error"
        case "403": return "permission_error"
        case "404": return "not_found_error"
        case "413": return "request_too_large"
        case "429": return "rate_limit_error"
        case "503", "529": return "overloaded_error"
        default: return "api_error"
        }
    }

    /// The overflow message. Claude Code matches this form to start its own
    /// compaction, so the wording is part of the contract.
    public static func promptTooLong(tokens: Int, maximum: Int) -> String {
        "prompt is too long: \(tokens) tokens > \(maximum) maximum"
    }

    // MARK: - Request

    public struct Request {
        public var messages: [ChatMessage]
        public var tools: [ToolDefinition]
        public var choice: GatewayDialect.ToolChoice
        public var parallel: Bool
        public var thinking: Bool
        public var effort: String?
        /// False for `thinking.display: "omitted"`: thinking blocks then carry
        /// only their signature, as Anthropic's do.
        public var showThinking: Bool
        /// Zero only for a token count, which needs no reply budget.
        public var maxTokens: Int
        public var temperature: Float?
        public var topP: Float?
        public var topK: Int?
        public var stopSequences: [String]
        public var stream: Bool
        /// Top-level fields this server does not know, ignored by name.
        public var ignored: [String]
        public var hasImages: Bool { messages.contains { !$0.images.isEmpty } }
    }

    /// Fields with an effect here.
    static let handledFields: Set<String> = [
        "model", "messages", "max_tokens", "system", "stop_sequences", "stream",
        "temperature", "top_p", "top_k", "tools", "tool_choice", "thinking", "output_config",
    ]

    /// Fields the API defines that change nothing on this server. Their types
    /// are still checked. `context_management` asks the API to clear old
    /// thinking or tool results; keeping them costs context, never correctness.
    static let inertFields: Set<String> = ["metadata", "context_management", "service_tier"]

    /// Fields that ask the API to run something on its own servers.
    static let refusedFields: [String: String] = [
        "container": "code execution containers are not available; tools run in the client",
        "mcp_servers": "remote MCP servers are not available; connect MCP tools in the client",
    ]

    /// Tool types the API runs on its own servers. Nothing here can run them,
    /// so they are dropped before rendering, as the Responses dialect drops
    /// hosted tools: showing the model a tool that cannot run invites a call
    /// that can only fail.
    static let hostedToolPrefixes = ["web_search_", "web_fetch_", "code_execution_", "tool_search_tool_", "mcp_toolset",
                                     "advisor_"]

    /// Effort labels `output_config.effort` takes.
    static let effortLabels: Set<String> = ["low", "medium", "high", "xhigh", "max"]

    /// The attribution line Claude Code prepends to the system prompt.
    static let attributionPrefix = "x-anthropic-billing-header:"

    static let imageMediaTypes: Set<String> = ["image/jpeg", "image/png", "image/gif", "image/webp"]

    /// Parse a Messages request. `counting` is the count_tokens form, which
    /// has no `max_tokens` and no sampling.
    public static func parse(_ raw: [String: Any], counting: Bool = false) throws -> Request {
        let json = raw.filter { !($0.value is NSNull) }
        for key in refusedFields.keys.sorted() where json[key] != nil {
            throw Failure("\(key): not supported; \(refusedFields[key]!)")
        }
        let known = handledFields.union(inertFields).union(refusedFields.keys)
        let ignored = Set(json.keys).subtracting(known).sorted()
        if let v = json["metadata"], !(v is [String: Any]) { throw Failure("metadata: must be an object") }
        if let v = json["context_management"], !(v is [String: Any]) { throw Failure("context_management: must be an object") }
        if let v = json["service_tier"], !(v is String) { throw Failure("service_tier: must be text") }
        guard json["model"] != nil else { throw Failure("model: field required") }
        guard json["model"] is String else { throw Failure("model: must be text") }

        var maxTokens = 0
        if let v = json["max_tokens"] {
            guard let n = integer(v), n > 0 else { throw Failure("max_tokens: must be a positive integer") }
            maxTokens = n
        } else if !counting {
            throw Failure("max_tokens: field required")
        }
        var stream = false
        if let v = json["stream"] {
            guard let b = boolean(v) else { throw Failure("stream: must be true or false") }
            stream = b
        }
        var temperature: Float?
        if let v = json["temperature"] {
            guard let d = number(v), d >= 0 else { throw Failure("temperature: must be a number of at least 0") }
            temperature = Float(d)
        }
        var topP: Float?
        if let v = json["top_p"] {
            guard let d = number(v), d >= 0, d <= 1 else { throw Failure("top_p: must be a number from 0 to 1") }
            topP = Float(d)
        }
        var topK: Int?
        if let v = json["top_k"] {
            guard let n = integer(v), n >= 0 else { throw Failure("top_k: must be an integer of at least 0") }
            topK = n
        }
        var stops: [String] = []
        if let v = json["stop_sequences"] {
            guard let list = v as? [Any], list.allSatisfy({ $0 is String }) else {
                throw Failure("stop_sequences: must be an array of text")
            }
            stops = (list as! [String]).filter { !$0.isEmpty }
        }

        let (tools, hosted) = try parseTools(json["tools"])
        let (choice, parallel) = try parseToolChoice(json["tool_choice"], declared: Set(tools.map(\.name)), hosted: hosted)
        if choice == .required && tools.isEmpty {
            throw Failure("tool_choice: \"any\" needs at least one tool")
        }
        let (thinking, effort, showThinking) = try parseThinking(json["thinking"], json["output_config"])

        var systems = try parseSystem(json["system"])
        var messages = try parseMessages(json["messages"], systems: &systems, counting: counting)
        if !systems.isEmpty {
            messages.insert(ChatMessage(role: "system", content: systems.joined(separator: "\n\n")), at: 0)
        }
        return Request(messages: messages, tools: tools, choice: choice, parallel: parallel,
            thinking: thinking, effort: effort, showThinking: showThinking, maxTokens: maxTokens,
            temperature: temperature, topP: topP, topK: topK, stopSequences: stops, stream: stream,
            ignored: ignored)
    }

    // MARK: Tools

    /// The declared tools, and the names of the server tools dropped from them.
    static func parseTools(_ value: Any?) throws -> ([ToolDefinition], Set<String>) {
        guard let value else { return ([], []) }
        guard let list = value as? [Any] else { throw Failure("tools: must be an array") }
        var tools: [ToolDefinition] = []
        var names = Set<String>()
        var hosted = Set<String>()
        for (i, element) in list.enumerated() {
            guard let raw = element as? [String: Any] else { throw Failure("tools.\(i): must be an object") }
            let tool = raw.filter { !($0.value is NSNull) }
            let type = tool["type"] as? String ?? "custom"
            if type != "custom" {
                if hostedToolPrefixes.contains(where: { type.hasPrefix($0) }) {
                    if let name = tool["name"] as? String { hosted.insert(name) }
                    continue
                }
                throw Failure("tools.\(i): tool type '\(type)' is not supported here; declare the tool with a name, description and input_schema")
            }
            // `cache_control`, `strict`, `defer_loading`, `eager_input_streaming`,
            // `input_examples` and `allowed_callers` change delivery, not the
            // schema the model is shown. `strict` is not enforced: calls are
            // checked for well-formed JSON, not validated against the schema.
            guard let name = tool["name"] as? String, !name.isEmpty else { throw Failure("tools.\(i).name: field required") }
            guard names.insert(name).inserted else { throw Failure("tools: tool names must be unique; '\(name)' appears twice") }
            if let d = tool["description"], !(d is String) { throw Failure("tools.\(i).description: must be text") }
            guard let schema = tool["input_schema"] as? [String: Any] else {
                throw Failure("tools.\(i).input_schema: must be a JSON Schema object")
            }
            tools.append(ToolDefinition(name: name, description: tool["description"] as? String ?? "",
                                        parameters: JSONValue.from(schema)))
        }
        return (tools, hosted)
    }

    static func parseToolChoice(_ value: Any?, declared: Set<String>,
                                hosted: Set<String> = []) throws -> (GatewayDialect.ToolChoice, Bool) {
        guard let value else { return (.auto, true) }
        guard let object = value as? [String: Any], let type = object["type"] as? String else {
            throw Failure("tool_choice: must be an object with a type")
        }
        var parallel = true
        if let v = object["disable_parallel_tool_use"], !(v is NSNull) {
            guard let b = boolean(v) else { throw Failure("tool_choice.disable_parallel_tool_use: must be true or false") }
            parallel = !b
        }
        switch type {
        case "auto": return (.auto, parallel)
        case "any": return (.required, parallel)
        case "none": return (.disabled, parallel)
        case "tool":
            // Claude Code's WebSearch asks for the hosted `web_search` tool by
            // name; say why it cannot run rather than that it is undeclared.
            if let name = object["name"] as? String, hosted.contains(name) {
                throw Failure("tool_choice.name: '\(name)' is a server tool that runs on Anthropic's servers; this server cannot run it")
            }
            guard let name = object["name"] as? String, declared.contains(name) else {
                throw Failure("tool_choice.name: must name a declared tool")
            }
            return (.tool(name), parallel)
        default:
            throw Failure("tool_choice.type: must be auto, any, tool, or none")
        }
    }

    /// `thinking` and `output_config` together decide whether the model
    /// thinks, at what effort, and whether the client sees the text.
    static func parseThinking(_ thinkingValue: Any?, _ outputConfig: Any?) throws -> (Bool, String?, Bool) {
        var label: String?
        if let value = outputConfig {
            guard let config = value as? [String: Any] else { throw Failure("output_config: must be an object") }
            if let format = config["format"], !(format is NSNull) {
                throw Failure("output_config.format: not supported; constrained output is not available on this server")
            }
            if let effort = config["effort"], !(effort is NSNull) {
                guard let s = effort as? String, effortLabels.contains(s) else {
                    throw Failure("output_config.effort: must be low, medium, high, xhigh, or max")
                }
                label = s
            }
        }
        guard let value = thinkingValue else { return (false, nil, true) }
        guard let object = value as? [String: Any], let type = object["type"] as? String else {
            throw Failure("thinking: must be an object with a type")
        }
        var show = true
        if let display = object["display"], !(display is NSNull) {
            // `omitted` hides the text; every other mode, including ones added
            // after this file was written, shows it.
            guard let s = display as? String else { throw Failure("thinking.display: must be text") }
            show = s != "omitted"
        }
        switch type {
        case "disabled":
            return (false, nil, show)
        case "enabled":
            guard let budget = object["budget_tokens"].flatMap(integer), budget > 0 else {
                throw Failure("thinking.budget_tokens: must be a positive integer")
            }
            // An explicit effort wins; otherwise the budget picks one.
            let mapped = GatewayDialect.mapReasoning(label ?? (budget < 4096 ? "low" : budget < 16384 ? "medium" : "high"))
            return (true, mapped.effort, show)
        case "adaptive":
            let mapped = GatewayDialect.mapReasoning(label ?? "high")
            return (mapped.thinking, mapped.effort, show)
        default:
            throw Failure("thinking.type: must be enabled, adaptive, or disabled")
        }
    }

    // MARK: System and messages

    static func parseSystem(_ value: Any?) throws -> [String] {
        guard let value else { return [] }
        if let text = value as? String {
            let kept = withoutAttribution(text)
            return kept.isEmpty ? [] : [kept]
        }
        guard let blocks = value as? [Any] else { throw Failure("system: must be text or an array of text blocks") }
        var out: [String] = []
        for (i, element) in blocks.enumerated() {
            guard let block = element as? [String: Any], (block["type"] as? String) == "text",
                  let text = block["text"] as? String else {
                throw Failure("system.\(i): must be a text block")
            }
            let kept = withoutAttribution(text)
            if !kept.isEmpty { out.append(kept) }
        }
        return out
    }

    /// The text without a leading attribution line.
    static func withoutAttribution(_ text: String) -> String {
        guard text.hasPrefix(attributionPrefix) else { return text }
        guard let newline = text.firstIndex(of: "\n") else { return "" }
        return String(text[text.index(after: newline)...]).trimmingCharacters(in: .newlines)
    }

    /// Anthropic messages to template messages.
    ///
    /// An assistant turn's `tool_use` blocks must be answered by `tool_result`
    /// blocks at the start of the next user message; the template wants one
    /// tool message per call, in call order, so results are re-ordered by
    /// their call and any text or pictures in that user message follow them.
    /// Consecutive messages of one role are one turn, as the API treats them.
    /// A `system` message before the conversation joins the system prompt;
    /// after it starts, it renders as user text, because the template renders
    /// one system turn and rejects a later one.
    static func parseMessages(_ value: Any?, systems: inout [String], counting: Bool = false) throws -> [ChatMessage] {
        guard let value else { throw Failure("messages: field required") }
        guard let list = value as? [Any] else { throw Failure("messages: must be an array") }
        guard !list.isEmpty else { throw Failure("messages: at least one message is required") }
        var out: [ChatMessage] = []
        var assistant: ChatMessage?
        var pending: [(id: String, name: String)] = []
        var toolIDs = Set<String>()
        var userResults: [String: ChatMessage] = [:]
        var userTexts: [String] = []
        var userImages: [String] = []
        var started = false

        func flushAssistant() {
            if let a = assistant { out.append(a); assistant = nil }
        }
        func unanswered(_ i: Int) -> Failure {
            Failure("messages.\(i): tool_use ids were found without tool_result blocks immediately after: "
                + pending.map(\.id).joined(separator: ", "))
        }

        for (i, element) in list.enumerated() {
            guard let raw = element as? [String: Any] else { throw Failure("messages.\(i): must be an object") }
            let message = raw.filter { !($0.value is NSNull) }
            guard let role = message["role"] as? String else { throw Failure("messages.\(i).role: field required") }
            let blocks = try contentBlocks(message["content"], at: "messages.\(i).content")
            switch role {
            case "user":
                flushAssistant()
                started = true
                for (j, block) in blocks.enumerated() {
                    let label = "messages.\(i).content.\(j)"
                    switch block["type"] as? String ?? "" {
                    case "tool_result":
                        guard let id = block["tool_use_id"] as? String,
                              let call = pending.first(where: { $0.id == id }), userResults[id] == nil else {
                            throw Failure("\(label): tool_result must answer a tool_use from the previous assistant message, once")
                        }
                        let result = try toolResult(block, at: label)
                        var m = ChatMessage(role: "tool", content: result.text, toolCallId: id, toolName: call.name)
                        m.images = result.images
                        userResults[id] = m
                    case "text":
                        userTexts.append(try text(block, at: label))
                    case "image":
                        userImages.append(try imageSource(block, at: label))
                    case "document":
                        userTexts.append(try documentText(block, at: label))
                    case "search_result":
                        userTexts.append(try searchResultText(block, at: label))
                    case let other:
                        throw Failure("\(label): content type '\(other)' is not supported in a user message")
                    }
                }
                // Validate and emit a whole user turn, even when its results
                // arrive in several adjacent messages. Parsing each message
                // above keeps errors at their original content-block index.
                if i + 1 < list.count, (list[i + 1] as? [String: Any])?["role"] as? String == "user" {
                    continue
                }
                if !pending.isEmpty {
                    guard pending.allSatisfy({ userResults[$0.id] != nil }) else { throw unanswered(i) }
                    out.append(contentsOf: pending.map { userResults[$0.id]! })
                    pending.removeAll()
                }
                if !userTexts.isEmpty || !userImages.isEmpty {
                    var m = ChatMessage(role: "user", content: userTexts.joined(separator: "\n\n"))
                    m.images = userImages
                    out.append(m)
                }
                userResults.removeAll()
                userTexts.removeAll()
                userImages.removeAll()
            case "assistant":
                // Calls may span adjacent assistant messages in the same turn.
                guard assistant != nil || pending.isEmpty else { throw unanswered(i) }
                started = true
                var a = assistant ?? ChatMessage(role: "assistant", content: "")
                for (j, block) in blocks.enumerated() {
                    let label = "messages.\(i).content.\(j)"
                    switch block["type"] as? String ?? "" {
                    case "text":
                        a.content += try text(block, at: label)
                    case "thinking":
                        let replayed = try thinkingText(block, at: label)
                        if !replayed.isEmpty { a.reasoning = (a.reasoning.map { $0 + "\n" } ?? "") + replayed }
                    case "redacted_thinking":
                        continue  // Encrypted by another provider; nothing here can read it.
                    case "tool_use":
                        guard let id = block["id"] as? String, !id.isEmpty else { throw Failure("\(label).id: field required") }
                        guard let name = block["name"] as? String, !name.isEmpty else { throw Failure("\(label).name: field required") }
                        guard toolIDs.insert(id).inserted else { throw Failure("\(label): tool_use id '\(id)' is used twice") }
                        guard let input = block["input"] as? [String: Any] else { throw Failure("\(label).input: must be an object") }
                        guard case .object(let arguments) = JSONValue.from(input) else { throw Failure("\(label).input: must be an object") }
                        a.toolCalls.append(ParsedToolCall(id: id, name: name, arguments: arguments))
                        pending.append((id, name))
                    case let other:
                        throw Failure("\(label): content type '\(other)' is not supported in an assistant message")
                    }
                }
                assistant = a
            case "system":
                guard pending.isEmpty else { throw unanswered(i) }
                var texts: [String] = []
                for (j, block) in blocks.enumerated() {
                    let type = block["type"] as? String ?? ""
                    // Claude Code announces tools that became available late
                    // this way; every declared tool is already rendered.
                    if type == "tool_addition" || type == "tool_removal" { continue }
                    guard type == "text" else {
                        throw Failure("messages.\(i).content.\(j): a system message carries text, not '\(type)'")
                    }
                    texts.append(withoutAttribution(try text(block, at: "messages.\(i).content.\(j)")))
                }
                let joined = texts.filter { !$0.isEmpty }.joined(separator: "\n\n")
                guard !joined.isEmpty else { continue }
                if started {
                    flushAssistant()
                    out.append(ChatMessage(role: "user", content: joined))
                } else {
                    systems.append(joined)
                }
            default:
                throw Failure("messages.\(i).role: must be user or assistant")
            }
        }
        guard pending.isEmpty else {
            throw Failure("messages: the last assistant message has tool_use blocks with no tool_result after them")
        }
        flushAssistant()
        guard out.contains(where: { $0.role == "user" || $0.role == "tool" }) else {
            throw Failure("messages: at least one user message is required")
        }
        if out.last?.role == "assistant" && !counting {
            throw Failure("messages: the last message must be from the user; continuing a partial assistant reply is not supported")
        }
        return out
    }

    /// Content as blocks: text becomes one text block.
    static func contentBlocks(_ value: Any?, at label: String) throws -> [[String: Any]] {
        guard let value else { throw Failure("\(label): field required") }
        if let text = value as? String { return [["type": "text", "text": text]] }
        guard let list = value as? [Any] else { throw Failure("\(label): must be text or an array of content blocks") }
        return try list.enumerated().map { j, element in
            guard let block = element as? [String: Any], block["type"] is String else {
                throw Failure("\(label).\(j): must be a content block with a type")
            }
            return block.filter { !($0.value is NSNull) }
        }
    }

    static func text(_ block: [String: Any], at label: String) throws -> String {
        guard let text = block["text"] as? String else { throw Failure("\(label).text: must be text") }
        return text
    }

    /// Only inline pictures: a URL or file id names something this server
    /// would have to fetch or does not have.
    static func imageSource(_ block: [String: Any], at label: String) throws -> String {
        guard let source = block["source"] as? [String: Any], let kind = source["type"] as? String else {
            throw Failure("\(label).source: field required")
        }
        switch kind {
        case "base64":
            guard let media = source["media_type"] as? String, imageMediaTypes.contains(media) else {
                throw Failure("\(label).source.media_type: must be image/jpeg, image/png, image/gif, or image/webp")
            }
            guard let data = source["data"] as? String, !data.isEmpty else {
                throw Failure("\(label).source.data: field required")
            }
            return "data:\(media);base64,\(data)"
        case "url":
            throw Failure("\(label): image URLs are not supported; send the picture as base64")
        case "file":
            throw Failure("\(label): file ids are not supported; send the picture as base64")
        default:
            throw Failure("\(label).source.type: must be base64")
        }
    }

    /// Plain-text documents are read inline; PDFs and remote documents are not.
    static func documentText(_ block: [String: Any], at label: String) throws -> String {
        guard let source = block["source"] as? [String: Any], let kind = source["type"] as? String else {
            throw Failure("\(label).source: field required")
        }
        var body: String
        switch kind {
        case "text":
            guard let data = source["data"] as? String else { throw Failure("\(label).source.data: must be text") }
            body = data
        case "content":
            guard let parts = source["content"] as? [Any] else { throw Failure("\(label).source.content: must be an array") }
            body = try parts.enumerated().map { k, part -> String in
                guard let block = part as? [String: Any], (block["type"] as? String) == "text" else {
                    throw Failure("\(label).source.content.\(k): only text blocks can be read")
                }
                return try text(block, at: "\(label).source.content.\(k)")
            }.joined(separator: "\n\n")
        default:
            // Refusing would end the turn and, for Claude Code, repeat on every
            // turn after it; a note lets the model say so or extract the text.
            let name = (block["title"] as? String).map { " '\($0)'" } ?? ""
            return "[The document\(name) is not shown: this model reads plain text and pictures, not PDF or remote documents. "
                + "Extract its text first, for example with `pdftotext file.pdf -`.]"
        }
        if let title = block["title"] as? String, !title.isEmpty { body = title + "\n\n" + body }
        if let context = block["context"] as? String, !context.isEmpty { body = context + "\n\n" + body }
        return body
    }

    /// A search result as text: its title, source and text blocks.
    static func searchResultText(_ block: [String: Any], at label: String) throws -> String {
        guard let parts = block["content"] as? [Any] else { throw Failure("\(label).content: must be an array") }
        var lines: [String] = []
        if let title = block["title"] as? String, !title.isEmpty { lines.append(title) }
        if let source = block["source"] as? String, !source.isEmpty { lines.append("Source: " + source) }
        for (k, element) in parts.enumerated() {
            guard let part = element as? [String: Any], (part["type"] as? String) == "text" else {
                throw Failure("\(label).content.\(k): only text blocks can be read")
            }
            lines.append(try text(part, at: "\(label).content.\(k)"))
        }
        return lines.joined(separator: "\n")
    }

    static func toolResult(_ block: [String: Any], at label: String) throws -> (text: String, images: [String]) {
        var texts: [String] = []
        var images: [String] = []
        switch block["content"] {
        case nil:
            break
        case let text as String:
            texts.append(text)
        case let parts as [Any]:
            for (k, element) in parts.enumerated() {
                let partLabel = "\(label).content.\(k)"
                guard let part = element as? [String: Any] else { throw Failure("\(partLabel): must be a content block") }
                switch part["type"] as? String ?? "" {
                case "text": texts.append(try text(part, at: partLabel))
                case "image": images.append(try imageSource(part, at: partLabel))
                case "document": texts.append(try documentText(part, at: partLabel))
                case "tool_reference":
                    // Tool search results: the named tool is declared already.
                    guard let name = part["tool_name"] as? String else { throw Failure("\(partLabel).tool_name: must be text") }
                    texts.append("Tool available: \(name)")
                case "search_result": texts.append(try searchResultText(part, at: partLabel))
                case let other: throw Failure("\(partLabel): content type '\(other)' cannot be returned to the model here")
                }
            }
        default:
            throw Failure("\(label).content: must be text or an array of content blocks")
        }
        var joined = texts.joined(separator: "\n")
        if let flag = block["is_error"], !(flag is NSNull) {
            guard let isError = boolean(flag) else { throw Failure("\(label).is_error: must be true or false") }
            if isError { joined = joined.isEmpty ? "Error" : "Error: " + joined }
        }
        return (joined, images)
    }

    /// The reasoning a replayed thinking block stands for: its text, or the
    /// text this server stored in its signature when the client had asked for
    /// the text to be omitted.
    static func thinkingText(_ block: [String: Any], at label: String) throws -> String {
        guard let thinking = block["thinking"] as? String else { throw Failure("\(label).thinking: must be text") }
        if !thinking.isEmpty { return thinking }
        if let signature = block["signature"] as? String, let stored = reasoning(fromSignature: signature) { return stored }
        return ""
    }

    static let signaturePrefix = "slotstream.thinking.v1."

    /// A signature that carries the reasoning it signs. Anthropic's signatures
    /// are opaque and verified; this one is plain and trusted like the rest of
    /// a replayed conversation, which the client could rewrite anyway.
    public static func signature(for reasoning: String) -> String {
        signaturePrefix + Data(reasoning.utf8).base64EncodedString()
    }

    public static func reasoning(fromSignature signature: String) -> String? {
        guard signature.hasPrefix(signaturePrefix),
              let data = Data(base64Encoded: String(signature.dropFirst(signaturePrefix.count))) else { return nil }
        return String(data: data, encoding: .utf8)
    }

    static func boolean(_ value: Any) -> Bool? { ResponsesDialect.boolean(value) }
    static func integer(_ value: Any) -> Int? { ResponsesDialect.integer(value) }
    static func number(_ value: Any) -> Double? { ResponsesDialect.number(value) }

    static func newID(_ prefix: String) -> String {
        prefix + String(UUID().uuidString.replacingOccurrences(of: "-", with: "").lowercased().prefix(24))
    }

    public static func toolUseID() -> String { newID("toolu_") }

    // MARK: - Response and events

    public struct Usage: Equatable {
        /// Every prompt token, reused or not.
        public var prompt: Int
        /// Prompt tokens served from a retained state.
        public var cached: Int
        public var output: Int
        public init(prompt: Int, cached: Int, output: Int) {
            self.prompt = prompt
            self.cached = cached
            self.output = output
        }
        /// Anthropic splits the prompt: `input_tokens` is what was read this
        /// time and `cache_read_input_tokens` what was reused. Claude Code adds
        /// the two to know how full the window is.
        public var json: [String: Any] {
            ["input_tokens": max(0, prompt - cached), "cache_creation_input_tokens": 0,
             "cache_read_input_tokens": min(cached, prompt), "output_tokens": output]
        }
    }

    /// One message as it is being produced: the finished content blocks, the
    /// block currently open, and the SSE frames that describe each step.
    ///
    /// Every method returns frames and writes nothing; the server owns the
    /// socket and the T0 gates read the frames as values. The non-streaming
    /// reply is the same message object the stream describes.
    public final class MessageStream {
        public let id: String
        public let model: String
        public let showThinking: Bool
        private var content: [[String: Any]] = []
        private var open: (index: Int, thinking: Bool, text: String)?
        public private(set) var toolUses = 0

        public init(model: String, showThinking: Bool = true, id: String? = nil) {
            self.model = model
            self.showThinking = showThinking
            self.id = id ?? AnthropicDialect.newID("msg_")
        }

        public func frame(_ type: String, _ fields: [String: Any] = [:]) -> String {
            var object = fields
            object["type"] = type
            let data = (try? JSONSerialization.data(withJSONObject: object, options: [.sortedKeys])) ?? Data("{}".utf8)
            return "event: \(type)\ndata: " + String(decoding: data, as: UTF8.self) + "\n\n"
        }

        private func messageObject(stopReason: String?, stopSequence: String?, usage: [String: Any]) -> [String: Any] {
            [
                "id": id, "type": "message", "role": "assistant", "model": model, "content": content,
                "stop_reason": stopReason.map { $0 as Any } ?? NSNull(),
                "stop_sequence": stopSequence.map { $0 as Any } ?? NSNull(),
                "usage": usage,
            ]
        }

        /// `message_start` and a first `ping`, sent once the request is
        /// admitted, when the reused part of the prompt is known. Claude Code
        /// keeps a start's nonzero input count when the final one is zero, so
        /// the start must already carry the real split.
        public func start(promptTokens: Int, reused: Int = 0) -> [String] {
            [frame("message_start", ["message": messageObject(stopReason: nil, stopSequence: nil,
                usage: Usage(prompt: promptTokens, cached: reused, output: 0).json)]),
             ping()]
        }

        public func ping() -> String { frame("ping") }

        /// The event that keeps a quiet stream alive: a `ping`, or an empty
        /// thinking delta while hidden thinking is open. Claude Code's idle
        /// timer counts only its first 30 consecutive pings, so a long
        /// reasoning it does not display needs events it counts.
        public func keepalive() -> String {
            if let block = open, block.thinking, !showThinking {
                return frame("content_block_delta", [
                    "index": block.index, "delta": ["type": "thinking_delta", "thinking": ""],
                ])
            }
            return ping()
        }

        public func thinking(_ delta: String) -> [String] {
            guard !delta.isEmpty else { return [] }
            var out: [String] = []
            if open?.thinking != true {
                out += close()
                open = (content.count, true, "")
                out.append(frame("content_block_start", [
                    "index": content.count,
                    "content_block": ["type": "thinking", "thinking": "", "signature": ""],
                ]))
            }
            open!.text += delta
            if showThinking {
                out.append(frame("content_block_delta", [
                    "index": open!.index, "delta": ["type": "thinking_delta", "thinking": delta],
                ]))
            }
            return out
        }

        public func text(_ delta: String) -> [String] {
            guard !delta.isEmpty else { return [] }
            var out: [String] = []
            if open == nil || open!.thinking {
                out += close()
                open = (content.count, false, "")
                out.append(frame("content_block_start", [
                    "index": content.count, "content_block": ["type": "text", "text": ""],
                ]))
            }
            open!.text += delta
            out.append(frame("content_block_delta", [
                "index": open!.index, "delta": ["type": "text_delta", "text": delta],
            ]))
            return out
        }

        /// A complete call. The parser publishes a call only after its closing
        /// tag, so the input arrives whole: one delta, then the stop.
        public func toolUse(_ call: ParsedToolCall) -> [String] {
            var out = close()
            let index = content.count
            let inputText = call.inputJSON
            let input = (try? JSONSerialization.jsonObject(with: Data(inputText.utf8))) as? [String: Any] ?? [:]
            out.append(frame("content_block_start", [
                "index": index,
                "content_block": ["type": "tool_use", "id": call.id, "name": call.name, "input": [String: Any]()],
            ]))
            out.append(frame("content_block_delta", [
                "index": index, "delta": ["type": "input_json_delta", "partial_json": inputText],
            ]))
            out.append(frame("content_block_stop", ["index": index]))
            content.append(["type": "tool_use", "id": call.id, "name": call.name, "input": input])
            toolUses += 1
            return out
        }

        private func close() -> [String] {
            guard let block = open else { return [] }
            open = nil
            var out: [String] = []
            if block.thinking {
                let signature = AnthropicDialect.signature(for: block.text)
                out.append(frame("content_block_delta", [
                    "index": block.index, "delta": ["type": "signature_delta", "signature": signature],
                ]))
                content.append(["type": "thinking", "thinking": showThinking ? block.text : "", "signature": signature])
            } else {
                content.append(["type": "text", "text": block.text])
            }
            out.append(frame("content_block_stop", ["index": block.index]))
            return out
        }

        /// Why the reply ended. A delivered call wins: the client's next move
        /// is to run it, whatever stopped the model afterwards. A reply cut
        /// short by the window rather than by `max_tokens` says so, because a
        /// larger `max_tokens` would not have helped.
        public func stopReason(engineReason: String, stopSequence: String?, windowLimited: Bool = false) -> String {
            if toolUses > 0 { return "tool_use" }
            if stopSequence != nil { return "stop_sequence" }
            guard engineReason == "length" else { return "end_turn" }
            return windowLimited ? "model_context_window_exceeded" : "max_tokens"
        }

        public func finish(engineReason: String, stopSequence: String?, usage: Usage,
                           windowLimited: Bool = false) -> [String] {
            var out = close()
            let reason = stopReason(engineReason: engineReason, stopSequence: stopSequence, windowLimited: windowLimited)
            out.append(frame("message_delta", [
                "delta": ["stop_reason": reason,
                          "stop_sequence": (reason == "stop_sequence" ? stopSequence : nil).map { $0 as Any } ?? NSNull()],
                "usage": usage.json,
            ]))
            out.append(frame("message_stop"))
            return out
        }

        /// The non-streaming reply.
        public func message(engineReason: String, stopSequence: String?, usage: Usage,
                            windowLimited: Bool = false) -> [String: Any] {
            _ = close()
            let reason = stopReason(engineReason: engineReason, stopSequence: stopSequence, windowLimited: windowLimited)
            return messageObject(stopReason: reason, stopSequence: reason == "stop_sequence" ? stopSequence : nil,
                                 usage: usage.json)
        }

        /// An error after the head went out. Nothing open is closed as
        /// complete: a partial block must not read as a finished one.
        public func fail(type: String, message: String) -> [String] {
            open = nil
            return [frame("error", ["error": ["type": type, "message": message]])]
        }
    }
}
