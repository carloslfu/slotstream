// OpenAI conversation/tool semantics. The engine and native tool parser are
// shared with the gateway; only the wire representation differs.
import Foundation

public enum OpenAIDialect {
    public struct Failure: Error, CustomStringConvertible {
        public let description: String
        public init(_ description: String) { self.description = description }
    }

    public struct Conversation {
        public var messages: [ChatMessage]
        public var tools: [ToolDefinition]
        public var choice: GatewayDialect.ToolChoice
        public var parallel: Bool
        public var thinking: Bool
        public var effort: String?
        public var contextLimit: Int
    }

    public static func conversation(_ json: [String: Any], contextLimit: Int) throws -> Conversation {
        var tools: [ToolDefinition] = []
        if let value = json["tools"] {
            guard let list = value as? [[String: Any]] else { throw Failure("tools must be an array of function tools") }
            var names = Set<String>()
            for tool in list {
                guard Set(tool.keys).isSubset(of: ["type", "function"]), tool["type"] as? String == "function",
                    let f = tool["function"] as? [String: Any],
                    Set(f.keys).isSubset(of: ["name", "description", "parameters", "strict"]),
                    let name = f["name"] as? String, !name.isEmpty, names.insert(name).inserted
                else { throw Failure("tools must contain uniquely named function definitions") }
                if let strict = f["strict"], !(strict is NSNull), boolean(strict) != false {
                    throw Failure("strict tool schemas are not supported; omit strict or use false")
                }
                if let description = f["description"], !(description is String) { throw Failure("tool description must be text") }
                let parameters = f["parameters"] ?? ["type": "object", "properties": [:]] as [String: Any]
                guard let schema = parameters as? [String: Any] else { throw Failure("tool parameters must be a JSON Schema object") }
                tools.append(ToolDefinition(name: name, description: f["description"] as? String ?? "", parameters: JSONValue.from(schema)))
            }
        }
        var choice = GatewayDialect.ToolChoice.auto
        if let value = json["tool_choice"] {
            switch value as? String {
            case "auto": choice = .auto
            case "none": choice = .disabled
            case "required": choice = .required
            default:
                guard let object = value as? [String: Any], object["type"] as? String == "function",
                    Set(object.keys).isSubset(of: ["type", "function"]),
                    let function = object["function"] as? [String: Any], Set(function.keys) == ["name"],
                    let name = function["name"] as? String, tools.contains(where: { $0.name == name })
                else { throw Failure("tool_choice must be auto, none, required, or a declared function") }
                choice = .tool(name)
            }
        }
        if choice == .required && tools.isEmpty { throw Failure("tool_choice required needs at least one tool") }
        let parallel: Bool
        if let value = json["parallel_tool_calls"] {
            guard let b = boolean(value) else { throw Failure("parallel_tool_calls must be true or false") }
            parallel = b
        } else { parallel = true }

        var thinking = false
        var effort: String?
        if let value = json["reasoning_effort"] {
            guard let label = value as? String,
                ["none", "minimal", "low", "medium", "high", "xhigh", "max"].contains(label)
            else { throw Failure("reasoning_effort must be none, minimal, low, medium, high, xhigh, or max") }
            let mapped = GatewayDialect.mapReasoning(label)
            thinking = mapped.thinking; effort = mapped.effort
        }
        if let value = json["think"] {
            guard let b = boolean(value) else { throw Failure("think must be true or false") }
            if json["reasoning_effort"] != nil && b != thinking { throw Failure("think conflicts with reasoning_effort") }
            thinking = b
        }
        var limit = contextLimit
        if let value = json["options"] {
            guard let options = value as? [String: Any], Set(options.keys).isSubset(of: ["num_ctx"]) else {
                throw Failure("OpenAI options supports only num_ctx")
            }
            if let raw = options["num_ctx"] {
                guard let n = integer(raw), n > 0, n <= contextLimit else {
                    throw Failure("options.num_ctx must be between 1 and the served context limit \(contextLimit)")
                }
                limit = n
            }
        }

        guard let raw = json["messages"] as? [[String: Any]], !raw.isEmpty else { throw Failure("messages must be a nonempty array") }
        var messages: [ChatMessage] = []
        var systems: [String] = []
        var pending: [String: String] = [:]
        var pendingOrder: [String] = []
        var pendingResults: [String: ChatMessage] = [:]
        var ids = Set<String>()
        for (i, message) in raw.enumerated() {
            let m = message.filter { !($0.value is NSNull) }
            guard let role = m["role"] as? String, ["system", "developer", "user", "assistant", "tool"].contains(role) else {
                throw Failure("messages[\(i)].role must be system, developer, user, assistant, or tool")
            }
            var allowed: Set<String> = ["role", "content", "images"]
            if role == "assistant" { allowed.formUnion(["tool_calls", "reasoning_content", "reasoning"]) }
            if role == "tool" { allowed.formUnion(["tool_call_id", "name"]) }
            let extra = Set(m.keys).subtracting(allowed)
            guard extra.isEmpty else { throw Failure("messages[\(i)] has unsupported field(s): \(extra.sorted().joined(separator: ", "))") }
            if role != "tool" && !pending.isEmpty { throw Failure("messages[\(i)] must first supply results for outstanding tool calls") }
            let content = try content(m["content"], allowEmpty: role == "assistant")
            var images = content.images
            if let value = m["images"] {
                guard let list = value as? [String] else { throw Failure("messages[\(i)].images must be an array of base64 strings") }
                images += list
            }
            if (role == "system" || role == "developer") {
                guard messages.isEmpty, images.isEmpty else { throw Failure("system/developer messages must precede the conversation and contain only text") }
                systems.append(content.text)
                continue
            }
            var output = ChatMessage(role: role, content: content.text)
            output.images = images
            if role == "assistant" {
                if m["reasoning"] != nil && m["reasoning_content"] != nil { throw Failure("use only one assistant reasoning field") }
                if let reason = m["reasoning_content"] ?? m["reasoning"] {
                    guard let text = reason as? String else { throw Failure("assistant reasoning_content must be text") }
                    output.reasoning = text
                }
                if let value = m["tool_calls"] {
                    guard let calls = value as? [[String: Any]] else { throw Failure("assistant tool_calls must be an array") }
                    for call in calls {
                        guard Set(call.keys).isSubset(of: ["id", "type", "function"]), call["type"] as? String == "function",
                            let id = call["id"] as? String, !id.isEmpty, ids.insert(id).inserted,
                            let function = call["function"] as? [String: Any], Set(function.keys) == ["name", "arguments"],
                            let name = function["name"] as? String, !name.isEmpty,
                            let arguments = function["arguments"] as? String,
                            case .object(let object)? = JSONValue.parse(arguments)
                        else { throw Failure("assistant tool_calls need unique IDs, function names, and JSON object argument strings") }
                        pending[id] = name
                        pendingOrder.append(id)
                        output.toolCalls.append(ParsedToolCall(id: id, name: name, arguments: object))
                    }
                }
            } else if role == "tool" {
                guard let id = m["tool_call_id"] as? String, let name = pending.removeValue(forKey: id) else {
                    throw Failure("tool result must reference an outstanding tool_call_id exactly once")
                }
                if let supplied = m["name"], supplied as? String != name { throw Failure("tool result name does not match its call") }
                output.toolCallId = id; output.toolName = name
                // OpenAI results can arrive in any order. The native model
                // template omits call IDs and pairs results positionally, so
                // restore the assistant's call order before rendering them.
                pendingResults[id] = output
                if pending.isEmpty {
                    messages.append(contentsOf: pendingOrder.map { pendingResults[$0]! })
                    pendingOrder.removeAll(); pendingResults.removeAll()
                }
                continue
            }
            messages.append(output)
        }
        guard pending.isEmpty else { throw Failure("messages are missing tool results") }
        if !systems.isEmpty { messages.insert(ChatMessage(role: "system", content: systems.joined(separator: "\n\n")), at: 0) }
        return Conversation(messages: messages, tools: tools, choice: choice, parallel: parallel,
                            thinking: thinking, effort: effort, contextLimit: limit)
    }

    private static func content(_ value: Any?, allowEmpty: Bool) throws -> (text: String, images: [String]) {
        if value == nil && allowEmpty { return ("", []) }
        if let text = value as? String { return (text, []) }
        guard let parts = value as? [[String: Any]] else { throw Failure("message content must be text or a content array") }
        var text: [String] = [], images: [String] = []
        for part in parts {
            guard Set(part.keys).isSubset(of: ["type", "text", "image_url", "image"]) else { throw Failure("unsupported content part field") }
            let kind = part["type"] as? String ?? "text"
            if kind == "text" || kind == "input_text" {
                guard let t = part["text"] as? String else { throw Failure("text content part needs text") }
                text.append(t)
            } else if kind == "image_url" || kind == "image" || part["image_url"] != nil || part["image"] != nil {
                let image = part["image_url"] ?? part["image"]
                guard let url = (image as? String) ?? ((image as? [String: Any])?["url"] as? String) else { throw Failure("image content part needs a usable url") }
                images.append(url)
            } else { throw Failure("unsupported content type '\(kind)'") }
        }
        return (text.joined(), images)
    }

    private static func boolean(_ value: Any) -> Bool? {
        guard let n = value as? NSNumber, CFGetTypeID(n) == CFBooleanGetTypeID() else { return nil }
        return n.boolValue
    }
    private static func integer(_ value: Any) -> Int? {
        guard let n = value as? NSNumber, CFGetTypeID(n) != CFBooleanGetTypeID() else { return nil }
        return Int(exactly: n)
    }

    public static func toolCall(_ call: ParsedToolCall) -> [String: Any] {
        ["id": call.id, "type": "function", "function": ["name": call.name, "arguments": call.inputJSON]]
    }
}
