import Foundation
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    static func responsesHistoryIntegrity() throws -> CheckReport {
        var c = CheckBuilder("responses-history-integrity")
        let user: [String: Any] = ["role": "user", "content": "Read the file"]
        func parse(arguments: Any? = "{}", output: Any? = "contents", custom: Bool = false) throws -> ResponsesDialect.Request {
            var call: [String: Any] = ["type": custom ? "custom_tool_call" : "function_call", "call_id": "c", "name": "read_file"]
            if custom { call["input"] = "read important.txt" } else { call["arguments"] = arguments }
            var result: [String: Any] = ["type": custom ? "custom_tool_call_output" : "function_call_output", "call_id": "c"]
            result["output"] = output
            // Exercise the same Foundation JSON boundary as a wire request.
            let body: [String: Any] = ["input": [user, call, result], "store": false]
            let wire = try JSONSerialization.data(withJSONObject: body)
            let decoded = try JSONSerialization.jsonObject(with: wire) as! [String: Any]
            return try ResponsesDialect.parse(decoded)
        }
        func refuses(arguments: Any? = "{}", output: Any? = "contents", custom: Bool = false, field: String) -> Bool {
            do { _ = try parse(arguments: arguments, output: output, custom: custom); return false }
            catch let failure as ResponsesDialect.Failure {
                return failure.code == "invalid_request" && failure.message.contains(field)
            } catch { return false }
        }

        for (label, value) in [("missing", nil), ("null", NSNull()), ("object", ["path": "important.txt"]),
                               ("array", ["important.txt"]), ("boolean", true), ("number", 7)] as [(String, Any?)] {
            c.expect("\(label) arguments cannot fabricate an empty call", refuses(arguments: value, field: "arguments"))
        }
        for text in ["{}", "", " \n\t"] {
            let parsed = try parse(arguments: text)
            c.equal("explicit empty argument compatibility survives \(text.debugDescription)", parsed.messages[1].toolCalls.first?.arguments, [:])
        }
        let arguments = try parse(arguments: #"{"path":"important.txt","nested":{"n":2},"enabled":false,"nothing":null}"#)
        c.equal("valid object arguments retain every value", arguments.messages[1].toolCalls.first?.arguments,
                ["path": .string("important.txt"), "nested": .object(["n": .int(2)]), "enabled": .bool(false), "nothing": .null])
        for custom in [false, true] {
            for (label, value) in [("missing", nil), ("null", NSNull())] as [(String, Any?)] {
                c.expect("\(label) output cannot fabricate an empty \(custom ? "custom" : "function") result",
                         refuses(output: value, custom: custom, field: "output"))
            }
            for output in ["", [] as [Any]] as [Any] {
                let parsed = try parse(output: output, custom: custom)
                c.equal("explicit empty output remains valid for custom=\(custom)", parsed.messages.last?.content, "")
                c.equal("empty output still belongs to its call", parsed.messages.last?.toolCallId, "c")
            }
            let parts: [[String: Any]] = [["type": "input_text", "text": "one"], ["type": "output_text", "text": "two"]]
            c.equal("valid result parts retain their order", try parse(output: parts, custom: custom).messages.last?.content, "one\ntwo")
        }
        for value in ["{", "[]", "true", "null", "1", #""text""#] {
            c.expect("invalid or nonobject JSON string stays refused \(value)", refuses(arguments: value, field: "arguments"))
        }
        return c.report()
    }
}
