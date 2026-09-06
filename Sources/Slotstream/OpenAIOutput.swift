import Foundation

/// Both OpenAI response modes consume the same parser events. A tool call is
/// published only after its closing tag and JSON arguments have been received;
/// truncation can never hand a client an executable partial call.
public final class OpenAIOutput {
    public private(set) var text = ""
    public private(set) var reasoning = ""
    public private(set) var calls: [ParsedToolCall] = []
    public private(set) var error: String?
    public var finishedSingleCall: Bool { !parallel && !calls.isEmpty }
    private let names: Set<String>
    private let choice: GatewayDialect.ToolChoice
    private let parallel: Bool

    public init(tools: [ToolDefinition], choice: GatewayDialect.ToolChoice, parallel: Bool) {
        names = Set(tools.map { $0.name }); self.choice = choice; self.parallel = parallel
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
                guard names.contains(call.name) else {
                    error = "model called an undeclared tool: \(call.name)"; break
                }
                if case .tool(let name) = choice, call.name != name {
                    error = "model did not satisfy the named tool_choice"; break
                }
                var wire = OpenAIDialect.toolCall(call)
                wire["index"] = calls.count
                calls.append(call)
                deltas.append(["tool_calls": [wire]])
            case .malformed:
                error = "model produced an incomplete or malformed tool call"
            case .toolInputStart, .toolInputDelta, .toolInputEnd:
                break // Provisional parser events are not executable output.
            }
        }
        return deltas
    }

    public func finishReason(_ reason: String) -> String {
        if calls.isEmpty && (choice == .required || choice.isNamedTool) {
            error = error ?? "model did not satisfy tool_choice: \(choice.label)"
        }
        return calls.isEmpty ? reason : "tool_calls"
    }

    public var message: [String: Any] {
        var message: [String: Any] = ["role": "assistant", "content": text]
        if !calls.isEmpty {
            message["tool_calls"] = calls.map { OpenAIDialect.toolCall($0) }
            if text.isEmpty { message["content"] = NSNull() }
        }
        if !reasoning.isEmpty { message["reasoning_content"] = reasoning }
        return message
    }
}
