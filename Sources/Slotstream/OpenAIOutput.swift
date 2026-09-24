import Foundation

/// Completed calls and provisional wire deltas are separate. Consumers execute
/// only completed calls; Chat Completions can show arguments during generation.
public final class OpenAIOutput {
    public private(set) var text = ""
    public private(set) var reasoning = ""
    public private(set) var calls: [ParsedToolCall] = []
    public private(set) var error: String?
    public var finishedSingleCall: Bool { !parallel && !calls.isEmpty }
    private let names: Set<String>
    private let choice: GatewayDialect.ToolChoice
    private let parallel: Bool
    private let streamToolArguments: Bool
    private let allowLengthTruncation: Bool
    private var pending: (id: String, name: String, arguments: String)?
    private var incomplete = false
    private var truncated = false

    public init(tools: [ToolDefinition], choice: GatewayDialect.ToolChoice, parallel: Bool,
                streamToolArguments: Bool = false, allowLengthTruncation: Bool = false) {
        names = Set(tools.map { $0.name }); self.choice = choice; self.parallel = parallel
        self.streamToolArguments = streamToolArguments
        self.allowLengthTruncation = allowLengthTruncation
    }

    public func reasoningDelta(_ value: String) -> [String: Any] {
        reasoning += value
        return ["reasoning_content": value]
    }

    public func consume(_ events: [ToolStreamEvent]) -> [[String: Any]] {
        var deltas: [[String: Any]] = []
        for event in events {
            guard error == nil, !finishedSingleCall else { break }
            switch event {
            case .text(let value):
                if !value.isEmpty { text += value; deltas.append(["content": value]) }
            case .toolCall(let call):
                guard validate(call.name) else { break }
                var wire = OpenAIDialect.toolCall(call)
                wire["index"] = calls.count
                if !streamToolArguments || pending?.id != call.id { deltas.append(["tool_calls": [wire]]) }
                calls.append(call)
                pending = nil
            case .malformed:
                incomplete = true
                error = "model produced an incomplete or malformed tool call"
            case .toolInputStart(let id, let name):
                guard validate(name) else { break }
                pending = (id, name, "")
                if streamToolArguments {
                    deltas.append(["tool_calls": [["index": calls.count, "id": id, "type": "function",
                        "function": ["name": name, "arguments": ""]]]])
                }
            case .toolInputDelta(let id, let value):
                guard pending?.id == id else { break }
                pending!.arguments += value
                if streamToolArguments, !value.isEmpty {
                    deltas.append(["tool_calls": [["index": calls.count, "function": ["arguments": value]]]])
                }
            case .toolInputEnd:
                break
            }
        }
        return deltas
    }

    public func finishReason(_ reason: String) -> String {
        if reason == "length", allowLengthTruncation {
            truncated = true
            if incomplete { error = nil }
            return "length"
        }
        if calls.isEmpty && (choice == .required || choice.isNamedTool) {
            error = error ?? "model did not satisfy tool_choice: \(choice.label)"
        }
        return calls.isEmpty ? reason : "tool_calls"
    }

    private func validate(_ name: String) -> Bool {
        guard names.contains(name) else {
            error = "model called an undeclared tool: \(name)"; return false
        }
        if case .tool(let required) = choice, name != required {
            error = "model did not satisfy the named tool_choice"; return false
        }
        return true
    }

    public var message: [String: Any] {
        var message: [String: Any] = ["role": "assistant", "content": text]
        var wireCalls = calls.map { OpenAIDialect.toolCall($0) }
        if truncated, let pending {
            wireCalls.append(["id": pending.id, "type": "function",
                "function": ["name": pending.name, "arguments": pending.arguments]])
        }
        if !wireCalls.isEmpty {
            message["tool_calls"] = wireCalls
            if text.isEmpty { message["content"] = NSNull() }
        }
        if !reasoning.isEmpty { message["reasoning_content"] = reasoning }
        return message
    }
}
