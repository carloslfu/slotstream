// The loopback AI Gateway dialect: what fx speaks.
//
// fx (vercel-labs/fx) has three providers and no plugin point, but its gateway
// client honours `FX_GATEWAY_CHAT_URL` and `FX_GATEWAY_BASE_URL` when they name
// an `http://` loopback address with an explicit port. So the way to serve fx
// without forking it is to *be* an AI Gateway on 127.0.0.1: speak the Vercel AI
// SDK Language Model Specification v4 over gateway protocol 0.0.1.
//
// This file is the whole contract, and it is deliberately pure: parsing,
// validation, event construction and the catalogue are static functions over
// values, with no socket and no engine. That is what lets the T0 gates run the
// real contract on any machine in milliseconds, weights and GPU absent.
//
// Three details of fx's consumer decide shapes here, and each cost a live
// capture to learn:
//
//   * `finishReason` must be an OBJECT with a string `unified`. A plain string
//     aborts the turn with `InvalidProviderFinishReason`, which is what the
//     first capture hit (upstream issue #514).
//   * usage totals must be NESTED: `usage.inputTokens.total`. A flat integer is
//     silently dropped and the user is told the turn cost nothing.
//   * the response head must be written before generation starts. fx gives the
//     head 30 s while the main stream itself has no deadline, and a cold 6k
//     prefill takes minutes. Anything that can fail must therefore fail before
//     the head goes out; after it, a failure is an in-stream `error` part.

import Foundation

public enum GatewayDialect {

    // MARK: - Errors

    /// A request that never reaches the model. `code` is the stable snake_case
    /// identifier, `message` the sentence fx shows the user.
    public struct Failure: Error, Equatable {
        public let code: String
        public let message: String
        public init(_ code: String, _ message: String) {
            self.code = code
            self.message = message
        }
        public var body: [String: Any] {
            ["error": ["code": code, "message": message, "type": "invalid_request_error"]]
        }
    }

    // MARK: - Request

    public enum ToolChoice: Equatable, Sendable {
        case auto
        /// The wire value is "none". The case is NOT called `none`: in any
        /// optional context Swift resolves a bare `.none` to `Optional.none`,
        /// so `choice == .none` silently compares against nil instead. The
        /// first gate written against this hit exactly that.
        case disabled
        case required
        case tool(String)

        public var isNamedTool: Bool {
            if case .tool = self { return true }
            return false
        }
        public var label: String {
            switch self {
            case .auto: return "auto"
            case .disabled: return "none"
            case .required: return "required"
            case .tool(let n): return "tool(\(n))"
            }
        }
    }

    /// Which reasoning the request asked for.
    public struct Reasoning: Equatable, Sendable {
        public let thinking: Bool
        public let effort: String?
    }

    public struct Request {
        public var messages: [ChatMessage]
        public var tools: [ToolDefinition]
        public var toolChoice: ToolChoice
        public var maxOutputTokens: Int?
        public var temperature: Float?
        public var topP: Float?
        public var topK: Int?
        public var presencePenalty: Float?
        public var seed: Int?
        public var stopSequences: [String]
        public var reasoning: Reasoning
        public var modelID: String
    }

    /// Top-level fields the v4 specification defines. Anything outside this set
    /// is refused by name, which is this server's house style at every other
    /// endpoint. The set is pinned to the SPECIFICATION rather than to what fx
    /// happens to send, so a field the spec already defines and a future fx
    /// starts sending is ignored rather than fatal.
    static let knownFields: Set<String> = [
        "prompt", "tools", "toolChoice", "maxOutputTokens", "temperature", "topP", "topK",
        "presencePenalty", "frequencyPenalty", "seed", "stopSequences", "responseFormat",
        "reasoning", "providerOptions", "headers", "includeRawChunks", "abortSignal",
    ]

    // MARK: - Header validation

    public static let protocolVersion = "0.0.1"
    public static let specificationVersion = "4"

    /// Versions are checked before anything else: a mismatch means the client
    /// and this dialect disagree about the wire, and every later error would be
    /// a misleading symptom of that.
    public static func validateHeaders(_ headers: [String: String]) -> Failure? {
        if let v = headers["ai-language-model-specification-version"], v != specificationVersion {
            return Failure(
                "unsupported_specification_version",
                "this endpoint speaks language model specification version \(specificationVersion), not \(v)"
            )
        }
        if let v = headers["ai-gateway-protocol-version"], v != protocolVersion {
            return Failure(
                "unsupported_protocol_version",
                "this endpoint speaks AI Gateway protocol \(protocolVersion), not \(v)")
        }
        return nil
    }

    // MARK: - Parsing

    public static func parse(_ json: [String: Any], modelID: String) -> Result<Request, Failure> {
        let unknown = Set(json.keys).subtracting(knownFields).sorted()
        if !unknown.isEmpty {
            return .failure(
                Failure(
                    "unsupported_field",
                    "unsupported request field(s): \(unknown.joined(separator: ", "))"))
        }
        guard let promptRaw = json["prompt"] as? [[String: Any]] else {
            return .failure(Failure("invalid_prompt", "`prompt` must be an array of messages"))
        }
        if let rf = json["responseFormat"] as? [String: Any],
            let t = rf["type"] as? String, t != "text"
        {
            return .failure(
                Failure(
                    "response_format_unsupported",
                    "this model serves text only; `responseFormat.type` must be \"text\""))
        }
        if let f = num(json["frequencyPenalty"]), f != 0 {
            return .failure(
                Failure(
                    "frequency_penalty_unsupported",
                    "frequency_penalty is not supported; only 0 is accepted"))
        }

        let messages: [ChatMessage]
        switch mapPrompt(promptRaw) {
        case .success(let m): messages = m
        case .failure(let e): return .failure(e)
        }

        var tools: [ToolDefinition] = []
        if let raw = json["tools"] as? [[String: Any]] {
            for t in raw {
                // Provider-executed tools are dropped before rendering: the
                // model cannot run them, and showing it a tool nothing will
                // execute invites a call that can only fail.
                let kind = t["type"] as? String ?? "function"
                guard kind == "function" else { continue }
                guard let name = t["name"] as? String else {
                    return .failure(Failure("invalid_tool", "every function tool needs a `name`"))
                }
                let params = t["inputSchema"].map { JSONValue.from($0) } ?? .object([:])
                tools.append(
                    ToolDefinition(
                        name: name, description: t["description"] as? String ?? "",
                        parameters: params))
            }
        }

        var choice = ToolChoice.auto
        if let tc = json["toolChoice"] as? [String: Any] {
            switch tc["type"] as? String {
            case "auto", nil: choice = .auto
            case "none": choice = .disabled
            case "required": choice = .required
            case "tool":
                guard let n = tc["toolName"] as? String else {
                    return .failure(
                        Failure("invalid_tool_choice", "`toolChoice.type: tool` needs `toolName`"))
                }
                choice = .tool(n)
            case .some(let other):
                return .failure(
                    Failure("invalid_tool_choice", "unknown toolChoice type '\(other)'"))
            }
        }

        var stops: [String] = []
        if let s = json["stopSequences"] as? [String] { stops = s }

        return .success(
            Request(
                messages: messages, tools: tools, toolChoice: choice,
                maxOutputTokens: int(json["maxOutputTokens"]),
                temperature: num(json["temperature"]).map { Float($0) },
                topP: num(json["topP"]).map { Float($0) },
                topK: int(json["topK"]),
                presencePenalty: num(json["presencePenalty"]).map { Float($0) },
                seed: int(json["seed"]), stopSequences: stops,
                reasoning: mapReasoning(json["reasoning"]), modelID: modelID))
    }

    /// fx sends `reasoning` as a bare effort label, and only when the catalogue
    /// advertised `reasoning_options`. Thinking is off by default because it is
    /// both faster and cache-friendlier, and because it is the shape the model
    /// was measured producing well-formed calls in.
    static func mapReasoning(_ raw: Any?) -> Reasoning {
        guard let label = (raw as? String) ?? ((raw as? [String: Any])?["effort"] as? String)
        else { return Reasoning(thinking: false, effort: nil) }
        switch label {
        case "none", "minimal", "off": return Reasoning(thinking: false, effort: nil)
        case "low": return Reasoning(thinking: true, effort: "low")
        case "medium": return Reasoning(thinking: true, effort: "medium")
        case "high", "xhigh", "max": return Reasoning(thinking: true, effort: "xhigh")
        default: return Reasoning(thinking: true, effort: nil)
        }
    }

    /// v4 prompt messages to template messages.
    public static func mapPrompt(_ raw: [[String: Any]]) -> Result<[ChatMessage], Failure> {
        var out: [ChatMessage] = []
        var systems: [String] = []
        var sawNonSystem = false

        for (i, m) in raw.enumerated() {
            let role = m["role"] as? String ?? ""
            switch role {
            case "system":
                // The template renders one system turn and rejects a later one,
                // so a system message after the conversation starts cannot be
                // honoured and must not be silently dropped.
                if sawNonSystem {
                    return .failure(
                        Failure(
                            "system_after_conversation",
                            "prompt[\(i)]: a system message may not follow another role"))
                }
                systems.append(stringContent(m["content"]))
            case "user":
                sawNonSystem = true
                var parts: [String] = []
                var images: [String] = []
                for p in (m["content"] as? [[String: Any]] ?? []) {
                    switch p["type"] as? String {
                    case "text": parts.append(p["text"] as? String ?? "")
                    case "file":
                        // fx sends a picture as a file part with an image
                        // media type and inline `data`. Anything else — a PDF,
                        // an audio clip, a URL to fetch — is still refused,
                        // and says which it was.
                        let media = (p["mediaType"] as? String ?? p["media_type"] as? String ?? "")
                            .lowercased()
                        guard media.hasPrefix("image/") else {
                            return .failure(
                                Failure(
                                    "unsupported_file_part",
                                    "prompt[\(i)]: this model reads images; a `file` part of type "
                                        + "'\(media.isEmpty ? "unknown" : media)' is not supported"))
                        }
                        guard let data = p["data"] as? String, !data.isEmpty else {
                            return .failure(
                                Failure(
                                    "unsupported_file_part",
                                    "prompt[\(i)]: image `file` part must carry inline `data` "
                                        + "(base64 or a data: URL)"))
                        }
                        images.append(data)
                    default:
                        return .failure(
                            Failure(
                                "unsupported_part",
                                "prompt[\(i)]: unsupported user content part '\(p["type"] as? String ?? "?")'"
                            ))
                    }
                }
                var user = ChatMessage(role: "user", content: parts.joined(separator: "\n"))
                user.images = images
                out.append(user)
            case "assistant":
                sawNonSystem = true
                var text: [String] = []
                var reasoning: [String] = []
                var calls: [ParsedToolCall] = []
                for p in (m["content"] as? [[String: Any]] ?? []) {
                    switch p["type"] as? String {
                    case "text": text.append(p["text"] as? String ?? "")
                    case "reasoning": reasoning.append(p["text"] as? String ?? "")
                    case "tool-call":
                        let id = p["toolCallId"] as? String ?? ""
                        let name = p["toolName"] as? String ?? ""
                        // `input` is a JSON string in the specification, but fx
                        // sends the object; both are accepted.
                        var args: [String: JSONValue] = [:]
                        var order: [String] = []
                        if let s = p["input"] as? String, case .object(let o)? = JSONValue.parse(s)
                        {
                            args = o
                            order = o.keys.sorted()
                        } else if let o = p["input"] as? [String: Any] {
                            args = o.mapValues { JSONValue.from($0) }
                            order = args.keys.sorted()
                        }
                        calls.append(
                            ParsedToolCall(id: id, name: name, arguments: args, order: order))
                    default:
                        return .failure(
                            Failure(
                                "unsupported_part",
                                "prompt[\(i)]: unsupported assistant content part '\(p["type"] as? String ?? "?")'"
                            ))
                    }
                }
                out.append(
                    ChatMessage(
                        role: "assistant", content: text.joined(),
                        reasoning: reasoning.isEmpty ? nil : reasoning.joined(),
                        toolCalls: calls))
            case "tool":
                sawNonSystem = true
                for p in (m["content"] as? [[String: Any]] ?? []) {
                    guard p["type"] as? String == "tool-result" else {
                        return .failure(
                            Failure(
                                "unsupported_part",
                                "prompt[\(i)]: a tool message carries `tool-result` parts only"))
                    }
                    switch toolResultText(p["output"]) {
                    case .success(let text):
                        out.append(
                            ChatMessage(
                                role: "tool", content: text,
                                toolCallId: p["toolCallId"] as? String,
                                toolName: p["toolName"] as? String))
                    case .failure(let e): return .failure(e)
                    }
                }
            default:
                return .failure(
                    Failure("unsupported_role", "prompt[\(i)]: unsupported role '\(role)'"))
            }
        }

        if out.last?.role == "assistant" {
            return .failure(
                Failure(
                    "assistant_prefill_unsupported",
                    "a prompt may not end with an assistant message"))
        }
        if !systems.isEmpty {
            out.insert(
                ChatMessage(role: "system", content: systems.joined(separator: "\n\n")), at: 0)
        }
        return .success(out)
    }

    /// One tool result's output, as the text the template will render.
    static func toolResultText(_ output: Any?) -> Result<String, Failure> {
        guard let o = output as? [String: Any] else { return .success("") }
        switch o["type"] as? String {
        case "text", "error-text":
            return .success(o["value"] as? String ?? "")
        case "json", "error-json":
            return .success(JSONValue.from(o["value"] ?? NSNull()).jsonText)
        case "execution-denied":
            return .success("Denied: " + (o["reason"] as? String ?? "no reason given"))
        case "content":
            var parts: [String] = []
            for item in (o["value"] as? [[String: Any]] ?? []) {
                guard item["type"] as? String == "text" else {
                    return .failure(
                        Failure(
                            "unsupported_tool_output",
                            "a tool result may not carry media; send the picture as a user "
                                + "`file` part instead"))
                }
                parts.append(item["text"] as? String ?? "")
            }
            return .success(parts.joined(separator: "\n"))
        case .some(let other):
            return .failure(
                Failure("unsupported_tool_output", "unsupported tool result output '\(other)'"))
        case nil:
            return .success("")
        }
    }

    static func stringContent(_ raw: Any?) -> String {
        if let s = raw as? String { return s }
        if let parts = raw as? [[String: Any]] {
            return parts.compactMap { $0["text"] as? String }.joined(separator: "\n")
        }
        return ""
    }

    static func num(_ v: Any?) -> Double? {
        if let d = v as? Double { return d }
        if let i = v as? Int { return Double(i) }
        if let n = v as? NSNumber { return n.doubleValue }
        return nil
    }

    static func int(_ v: Any?) -> Int? {
        if let i = v as? Int { return i }
        if let n = v as? NSNumber { return n.intValue }
        return nil
    }

    // MARK: - Catalogue

    /// The model catalogue fx reads capabilities from.
    ///
    /// Every window is computed from the RUNNING server's context cap. It must
    /// be, and the reason is exact: fx's `usableInputTokens` subtracts the
    /// output budget only when it is strictly smaller than the window, and
    /// otherwise hands back the whole window. A catalogue that hardcoded
    /// `max_tokens: 8192` would therefore, at any cap of 8,192 or below, tell
    /// fx it may fill the entire context with input, reserve nothing for the
    /// reply, and defer compaction until four fifths of the whole cap.
    ///
    /// The three vendor ids are aliases of the one served model. fx uses them
    /// for the permission reviewer, the compactor and the vision fallback, and
    /// none is configurable; listing them stops fx planning those calls with
    /// the vendor defaults it would otherwise assume (256k for `openai/`, 1M
    /// for `google/`).
    public static func catalog(modelID: String, contextCap: Int, vision: Bool = false) -> [String: Any] {
        let out = outputBudget(contextCap: contextCap)
        let compactCap = min(contextCap, 8192)
        let compactOut = min(compactBudget, outputBudget(contextCap: compactCap))
        func entry(_ id: String, _ window: Int, _ maxTokens: Int, reasoning: Bool = false)
            -> [String: Any]
        {
            var e: [String: Any] = [
                "id": id, "type": "language", "released": id == modelID ? 1 : 0,
                "tags": vision ? ["tool-use", "vision"] : ["tool-use"],
                "context_window": window, "max_tokens": maxTokens,
            ]
            if reasoning {
                e["reasoning_options"] = [
                    ["type": "effort", "values": ["none", "low", "medium", "xhigh"]]
                ]
            }
            return e
        }
        return [
            "object": "list",
            "data": [
                entry(modelID, contextCap, out, reasoning: true),
                entry("moonshotai/kimi-k3", contextCap, out),
                entry("openai/gpt-5.6-luna", compactCap, compactOut),
                entry("google/gemini-2.5-flash", contextCap, out),
            ],
        ]
    }

    /// The reply budget advertised for the served model: a quarter of the cap,
    /// bounded so it is always strictly below the window and never absurd.
    public static func outputBudget(contextCap: Int) -> Int {
        // A quarter of the cap, floored so a small cap still allows a usable
        // reply and ceilinged at the largest budget worth advertising. The
        // final clamp is the invariant itself: strictly below the window, at
        // every cap, including the degenerate small ones where a quarter and a
        // floor would otherwise meet the cap exactly.
        let desired = min(8192, max(256, contextCap / 4))
        return max(1, min(desired, contextCap - 1))
    }

    /// The compactor alias's reply budget.
    ///
    /// fx gives a compaction call 120 s and asks for `accepted x 4` tokens
    /// capped by this. Decode is the binding constraint, not prefill: a
    /// 6k-token chunk is about a minute of prefill at the measured rate, which
    /// leaves roughly 700 tokens of summary at the measured decode rate. An
    /// alias advertising 2,048 would invite about 170 s of decode and time
    /// itself out.
    public static let compactBudget = 512

    // MARK: - Stream events

    /// One SSE frame. `data: ` then compact JSON then a blank line.
    public static func frame(_ obj: [String: Any]) -> String {
        let data = (try? JSONSerialization.data(withJSONObject: obj, options: [.sortedKeys]))
            ?? Data("{}".utf8)
        return "data: " + String(decoding: data, as: UTF8.self) + "\n\n"
    }

    /// A comment frame. fx's consumer skips any line starting with `:`, which
    /// makes this a keepalive that costs the client nothing: it keeps bytes
    /// moving during a multi-minute prefill so this server's own send timeout
    /// does not fire, while fx's main stream has no deadline to reset.
    public static let keepalive = ": keepalive\n\n"

    public static func finishFrame(
        reason: String, rawReason: String, inputTokens: Int, cachedTokens: Int,
        outputText: Int, outputReasoning: Int
    ) -> String {
        frame([
            "type": "finish",
            "finishReason": ["unified": reason, "raw": rawReason],
            "usage": [
                "inputTokens": [
                    "total": inputTokens, "noCache": max(0, inputTokens - cachedTokens),
                    "cacheRead": cachedTokens, "cacheWrite": 0,
                ],
                "outputTokens": [
                    "total": outputText + outputReasoning, "text": outputText,
                    "reasoning": outputReasoning,
                ],
            ],
        ])
    }

    /// fx maps the engine's own finish reason onto the six unified values.
    public static func unifiedFinish(_ engineReason: String, hasToolCall: Bool) -> (String, String)
    {
        if hasToolCall { return ("tool-calls", "tool_calls") }
        switch engineReason {
        case "length": return ("length", "length")
        case "stop": return ("stop", "stop")
        default: return ("stop", engineReason)
        }
    }
}
