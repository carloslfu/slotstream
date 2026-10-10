// T0: malformed Gateway values must not become default settings or empty history.
import Foundation
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    private static var gatewayIntegrityUser: [String: Any] {
        ["role": "user", "content": [["type": "text", "text": "read the file"]]]
    }

    private static func gatewayIntegrityParse(_ body: [String: Any]) -> Result<GatewayDialect.Request, GatewayDialect.Failure> {
        do {
            let data = try JSONSerialization.data(withJSONObject: body)
            guard let wire = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                return .failure(.init("fixture_error", "expected a JSON object"))
            }
            return GatewayDialect.parse(wire, modelID: "m")
        } catch {
            return .failure(.init("fixture_error", "fixture is not serializable JSON"))
        }
    }

    private static func gatewayIntegrityFailure(_ body: [String: Any]) -> String? {
        if case .failure(let error) = gatewayIntegrityParse(body) { return error.code }
        return nil
    }

    static func gatewayRequestShapes() -> CheckReport {
        var c = CheckBuilder("gateway-request-shapes")
        let base = fxBody(prompt: [gatewayIntegrityUser])
        func setting(_ key: String, _ value: Any) -> [String: Any] {
            var body = base; body[key] = value; return body
        }
        for (label, value) in [
            ("text", "none" as Any), ("number", 1 as Any),
            ("object", ["type": "function"] as Any),
            ("mixed array", [readFileTool, "bad"] as [Any]),
        ] {
            c.equal("tools rejects \(label)", gatewayIntegrityFailure(setting("tools", value)), "invalid_tool")
        }
        var emptyName = readFileTool; emptyName["name"] = ""
        var badDescription = readFileTool; badDescription["description"] = 4
        var badSchema = readFileTool; badSchema["inputSchema"] = "object"
        var nullSchema = readFileTool; nullSchema["inputSchema"] = NSNull()
        var badType = readFileTool; badType["type"] = 1
        var unknownType = readFileTool; unknownType["type"] = "unknown"
        for (label, tools) in [
            ("empty name", [emptyName]), ("duplicate name", [readFileTool, readFileTool]),
            ("numeric description", [badDescription]), ("text schema", [badSchema]),
            ("null schema", [nullSchema]), ("numeric type", [badType]), ("unknown type", [unknownType]),
        ] {
            c.equal("function tools reject \(label)", gatewayIntegrityFailure(setting("tools", tools)), "invalid_tool")
        }
        for (label, value) in [
            ("text", "none" as Any), ("number", 1 as Any), ("array", [] as [Any]),
            ("missing tag", [:] as [String: Any]), ("numeric tag", ["type": 1] as [String: Any]),
        ] {
            var body = setting("toolChoice", value); body["tools"] = [readFileTool]
            c.equal("toolChoice rejects \(label)", gatewayIntegrityFailure(body), "invalid_tool_choice")
        }
        for (label, value) in [
            ("text", "text" as Any), ("array", [] as [Any]),
            ("missing tag", [:] as [String: Any]), ("numeric tag", ["type": 1] as [String: Any]),
        ] {
            c.equal("responseFormat rejects \(label)", gatewayIntegrityFailure(setting("responseFormat", value)), "invalid_request")
        }
        for (label, value) in [
            ("text", "END" as Any), ("number", 1 as Any),
            ("mixed array", ["END", 1] as [Any]), ("object", [:] as [String: Any]),
        ] {
            c.equal("stopSequences rejects \(label)", gatewayIntegrityFailure(setting("stopSequences", value)), "invalid_request")
        }
        for key in ["tools", "toolChoice", "responseFormat", "stopSequences"] {
            c.expect("top-level null \(key) remains omitted", gatewayIntegrityFailure(setting(key, NSNull())) == nil)
        }
        var minimalTool = readFileTool
        minimalTool.removeValue(forKey: "type")
        minimalTool.removeValue(forKey: "description")
        minimalTool.removeValue(forKey: "inputSchema")
        c.expect("legacy function defaults remain supported", gatewayIntegrityFailure(setting("tools", [minimalTool])) == nil)
        var nullDescription = readFileTool; nullDescription["description"] = NSNull()
        c.expect("optional null description remains omitted", gatewayIntegrityFailure(setting("tools", [nullDescription])) == nil)
        c.expect("provider tools remain filtered", gatewayIntegrityFailure(setting("tools", [["type": "provider", "name": "remote"]])) == nil)
        c.expect("empty tool array remains valid", gatewayIntegrityFailure(setting("tools", [] as [Any])) == nil)
        c.expect("text format remains valid", gatewayIntegrityFailure(setting("responseFormat", ["type": "text"])) == nil)
        c.equal("constrained format retains refusal", gatewayIntegrityFailure(setting("responseFormat", ["type": "json"])), "response_format_unsupported")
        if case .success(let request) = gatewayIntegrityParse(setting("stopSequences", ["END", "DONE"])) {
            c.equal("stop sequences retained", request.stopSequences, ["END", "DONE"])
        } else { c.expect("valid stop sequences parse", false) }
        return c.report()
    }

    private static func gatewayIntegrityHistory(input: Any?, output: Any?) -> [String: Any] {
        var call: [String: Any] = ["type": "tool-call", "toolCallId": "c", "toolName": "read_file"]
        if let input { call["input"] = input }
        var result: [String: Any] = ["type": "tool-result", "toolCallId": "c", "toolName": "read_file"]
        if let output { result["output"] = output }
        return fxBody(prompt: [
            gatewayIntegrityUser,
            ["role": "assistant", "content": [call]],
            ["role": "tool", "content": [result]],
        ])
    }

    static func gatewayCallInputShapes() -> CheckReport {
        var c = CheckBuilder("gateway-call-input-shapes")
        let output: [String: Any] = ["type": "text", "value": "contents"]
        let rejected: [(String, Any?)] = [
            ("missing", nil), ("null", NSNull()), ("number", 1), ("Boolean", true),
            ("array", [1, 2]), ("malformed JSON", "{"), ("JSON array", "[1]"),
            ("JSON number", "1"), ("JSON null", "null"), ("JSON text", "\"file\""),
        ]
        for (label, input) in rejected {
            c.equal("call input rejects \(label)", gatewayIntegrityFailure(gatewayIntegrityHistory(input: input, output: output)), "invalid_tool_call")
        }
        for (label, input) in [
            ("empty object", [:] as Any), ("empty JSON object", "{}" as Any),
            ("object", ["path": "hello.txt", "timeout": NSNull()] as Any),
            ("JSON object", #"{"path":"hello.txt","timeout":null}"# as Any),
        ] {
            if case .success(let request) = gatewayIntegrityParse(gatewayIntegrityHistory(input: input, output: output)) {
                c.equal("\(label): one call retained", request.messages[1].toolCalls.count, 1)
                let call = request.messages[1].toolCalls.first
                if label.hasPrefix("empty") {
                    c.equal("\(label): empty arguments retained", call?.inputJSON, "{}")
                } else {
                    c.equal("\(label): path retained", call?.arguments["path"], .string("hello.txt"))
                    c.equal("\(label): null argument retained", call?.arguments["timeout"], .null)
                }
                c.equal("\(label): tool result retained", request.messages.last?.content, "contents")
            } else { c.expect("\(label) parses", false) }
        }
        return c.report()
    }

    static func gatewayResultOutputShapes() -> CheckReport {
        var c = CheckBuilder("gateway-result-output-shapes")
        let input: [String: Any] = ["path": "hello.txt"]
        let rejected: [(String, Any?)] = [
            ("missing output", nil), ("null output", NSNull()), ("text output", "contents"),
            ("missing tag", [:] as [String: Any]), ("numeric tag", ["type": 1]),
            ("missing text", ["type": "text"]), ("null text", ["type": "text", "value": NSNull()]),
            ("numeric text", ["type": "text", "value": 7]),
            ("missing error text", ["type": "error-text"]), ("numeric error text", ["type": "error-text", "value": 7]),
            ("missing JSON", ["type": "json"]), ("missing error JSON", ["type": "error-json"]),
            ("numeric denial reason", ["type": "execution-denied", "reason": 7]),
            ("missing content", ["type": "content"]), ("null content", ["type": "content", "value": NSNull()]),
            ("text content", ["type": "content", "value": "contents"]),
            ("mixed content array", ["type": "content", "value": [["type": "text", "text": "a"], "b"] as [Any]]),
            ("missing content text", ["type": "content", "value": [["type": "text"]]]),
            ("numeric content text", ["type": "content", "value": [["type": "text", "text": 7]]]),
        ]
        for (label, output) in rejected {
            c.equal("result rejects \(label)", gatewayIntegrityFailure(gatewayIntegrityHistory(input: input, output: output)), "invalid_tool_result")
        }
        let accepted: [(String, [String: Any], String)] = [
            ("empty text", ["type": "text", "value": ""], ""),
            ("empty error text", ["type": "error-text", "value": ""], ""),
            ("explicit JSON null", ["type": "json", "value": NSNull()], "null"),
            ("explicit error JSON null", ["type": "error-json", "value": NSNull()], "null"),
            ("nested JSON", ["type": "json", "value": ["value": NSNull(), "ok": true]], #"{"ok":true,"value":null}"#),
            ("empty content", ["type": "content", "value": [] as [Any]], ""),
            ("text content", ["type": "content", "value": [["type": "text", "text": "a"], ["type": "text", "text": "b"]]], "a\nb"),
            ("denied without reason", ["type": "execution-denied"], "Denied: no reason given"),
            ("denied with null reason", ["type": "execution-denied", "reason": NSNull()], "Denied: no reason given"),
            ("denied with reason", ["type": "execution-denied", "reason": "no"], "Denied: no"),
        ]
        for (label, output, expected) in accepted {
            if case .success(let request) = gatewayIntegrityParse(gatewayIntegrityHistory(input: input, output: output)) {
                c.equal("\(label): payload retained", request.messages.last?.content, expected)
            } else { c.expect("\(label) parses", false) }
        }
        c.equal("unknown output tag remains unsupported", gatewayIntegrityFailure(gatewayIntegrityHistory(input: input, output: ["type": "unknown", "value": "x"])), "unsupported_tool_output")
        c.equal("media output remains unsupported", gatewayIntegrityFailure(gatewayIntegrityHistory(input: input, output: ["type": "content", "value": [["type": "file", "mediaType": "image/png"]]])), "unsupported_tool_output")
        return c.report()
    }
}
