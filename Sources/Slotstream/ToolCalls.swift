// Parses the model's native <tool_call> XML output (the shape the chat
// template teaches, e.g.
//   <tool_call>
//   <function=list_files>
//   <parameter=path>
//   .
//   </parameter>
//   </function>
//   </tool_call>
// ) into OpenAI-style function tool calls. The model emits these as plain
// text; the server translates them into the wire format clients expect.

import Foundation

public struct ParsedToolCall {
    public let name: String
    /// parameter name -> raw string value
    public let params: [String: String]
    public init(name: String, params: [String: String]) {
        self.name = name
        self.params = params
    }
}

/// Parse every fully-closed <tool_call> block in `text`. Blocks whose closing
/// tag never appears are ignored (the generator may still be mid-call).
public func parseToolCalls(_ text: String) -> [ParsedToolCall] {
    var calls: [ParsedToolCall] = []
    var rest = text[...]
    while let open = rest.range(of: "<tool_call>") {
        guard let close = rest[open.upperBound...].range(of: "</tool_call>") else { break }
        let body = rest[open.upperBound ..< close.lowerBound]
        if let fnOpen = body.range(of: "<function="),
            let fnNameEnd = body[fnOpen.upperBound...].range(of: ">")
        {
            let name = String(body[fnOpen.upperBound ..< fnNameEnd.lowerBound])
                .trimmingCharacters(in: .whitespacesAndNewlines)
            let fnRest = body[fnNameEnd.upperBound...]
            if let fnEnd = fnRest.range(of: "</function>") {
                var params: [String: String] = [:]
                var p = fnRest[..<fnEnd.lowerBound]
                while let pOpen = p.range(of: "<parameter="),
                    let pNameEnd = p[pOpen.upperBound...].range(of: ">")
                {
                    let pName = String(p[pOpen.upperBound ..< pNameEnd.lowerBound])
                        .trimmingCharacters(in: .whitespacesAndNewlines)
                    let after = p[pNameEnd.upperBound...]
                    guard let pClose = after.range(of: "</parameter>") else { break }
                    let pVal = String(after[..<pClose.lowerBound])
                        .trimmingCharacters(in: .newlines)
                    params[pName] = pVal
                    p = after[pClose.upperBound...]
                }
                calls.append(ParsedToolCall(name: name, params: params))
            }
        }
        rest = rest[close.upperBound...]
    }
    return calls
}

/// Serialize parsed params into the JSON string OpenAI puts in
/// tool_calls[].function.arguments. Each raw value is parsed as JSON when it
/// can be (so "3" -> 3, "true" -> true) and kept as a string otherwise.
public func toolArgumentsJSON(_ params: [String: String]) -> String {
    var args: [String: Any] = [:]
    for (k, v) in params {
        if let data = v.data(using: .utf8),
            let obj = try? JSONSerialization.jsonObject(with: data)
        {
            args[k] = obj
        } else {
            args[k] = v
        }
    }
    return (try? String(data: JSONSerialization.data(withJSONObject: args), encoding: .utf8)) ?? "{}"
}

/// OpenAI-style tool_call payload (name + arguments JSON) for one parsed call.
public func openAIToolCall(_ call: ParsedToolCall, id: String) -> [String: Any] {
    [
        "id": id, "type": "function",
        "function": ["name": call.name, "arguments": toolArgumentsJSON(call.params)],
    ]
}
