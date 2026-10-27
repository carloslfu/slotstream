import Foundation
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    static func toolCallNullableScalars() -> CheckReport {
        var c = CheckBuilder("toolcall-nullable-scalars")
        func definition(_ field: JSONValue, definitions: [String: JSONValue] = [:]) -> ToolDefinition {
            ToolDefinition(name: "set_value", description: "", parameters: .object([
                "type": .string("object"), "$defs": .object(definitions),
                "properties": .object(["value": field]),
            ]))
        }
        func events(_ xml: String, _ schema: ToolSchema, cut: Int? = nil, characters: Bool = false) -> [ToolStreamEvent] {
            let parser = ToolCallSplitter(tools: [schema], idFactory: { "call_test" })
            let chars = Array(xml)
            if characters { return chars.flatMap { parser.push(String($0)) } + parser.flush() }
            guard let cut else { return parser.push(xml) + parser.flush() }
            return parser.push(String(chars[..<cut])) + parser.push(String(chars[cut...])) + parser.flush()
        }
        func matches(_ events: [ToolStreamEvent], _ arguments: [String: JSONValue], _ json: String) -> Bool {
            let calls = events.compactMap { if case .toolCall(let call) = $0 { return call }; return nil }
            let deltas = events.compactMap { if case .toolInputDelta(_, let text) = $0 { return text }; return nil }.joined()
            return calls.count == 1 && calls[0].arguments == arguments && calls[0].inputJSON == json && deltas == json
                && !events.contains { if case .malformed = $0 { return true }; return false }
        }
        func check(_ label: String, _ tool: ToolDefinition, raw: String, value: JSONValue, json: String, splits: Bool = false) {
            let xml = "<tool_call>\n<function=set_value>\n<parameter=value>\n\(raw)\n</parameter>\n</function>\n</tool_call>"
            c.expect("\(label): whole call retains value and JSON type", matches(events(xml, tool.schema), ["value": value], json))
            if splits {
                var mismatches = 0
                for cut in 0...xml.count {
                    if !matches(events(xml, tool.schema, cut: cut), ["value": value], json) { mismatches += 1 }
                }
                c.equal("\(label): every two-part split retains null", mismatches, 0)
                c.expect("\(label): character stream retains null", matches(events(xml, tool.schema, characters: true), ["value": value], json))
            }
        }

        let nullType: JSONValue = .object(["type": .string("null")])
        for (kind, raw, value, json) in [
            ("integer", "7", JSONValue.int(7), #"{"value":7}"#),
            ("number", "2.5", .double(2.5), #"{"value":2.5}"#),
            ("boolean", "false", .bool(false), #"{"value":false}"#),
        ] {
            let scalar: JSONValue = .object(["type": .string(kind)])
            let array: JSONValue = .object(["type": .array([.string(kind), .string("null")])])
            let variants: [(String, ToolDefinition)] = [
                ("type array", definition(array)),
                ("anyOf", definition(.object(["anyOf": .array([scalar, nullType])]))),
                ("nullable reference", definition(.object(["$ref": .string("#/$defs/Value")]), definitions: ["Value": array])),
                ("referenced alternatives", definition(.object(["anyOf": .array([
                    .object(["$ref": .string("#/$defs/Value")]), .object(["$ref": .string("#/$defs/Null")]),
                ])]), definitions: ["Value": scalar, "Null": nullType])),
            ]
            for (label, tool) in variants {
                check("\(kind)/\(label)", tool, raw: "null", value: .null, json: #"{"value":null}"#, splits: true)
                check("\(kind)/\(label) concrete value", tool, raw: raw, value: value, json: json)
            }
            check("\(kind) nullable whitespace", definition(array), raw: " \tnull \t", value: .null, json: #"{"value":null}"#)
            check("\(kind) nonnullable fallback", definition(scalar), raw: "null", value: .string("null"), json: #"{"value":"null"}"#)
            check("\(kind) null default does not declare a null type", definition(.object([
                "type": .string(kind), "default": .null,
            ])), raw: "null", value: .string("null"), json: #"{"value":"null"}"#)
        }
        for field: JSONValue in [
            .object(["type": .string("string")]),
            .object(["type": .array([.string("string"), .string("null")])]),
            .object(["anyOf": .array([.object(["type": .string("integer")]), .object(["$ref": .string("#/$defs/Missing")]), nullType])]),
            .object(["type": .array([.string("integer"), .string("boolean"), .string("null")])]),
        ] {
            check("literal string or unresolved type remains conservative", definition(field), raw: "null", value: .string("null"), json: #"{"value":"null"}"#)
        }
        for kind in ["array", "object"] {
            check("\(kind) null keeps JSON parsing", definition(.object(["type": .array([.string(kind), .string("null")])])),
                  raw: "null", value: .null, json: #"{"value":null}"#)
        }
        let multiple = ToolDefinition(name: "set_value", description: "", parameters: .object([
            "properties": .object([
                "value": .object(["type": .array([.string("integer"), .string("null")])]),
                "enabled": .object(["type": .array([.string("boolean"), .string("null")])]),
            ]),
        ]))
        c.expect("nullable metadata follows each parameter in a character stream", matches(events(
            "<tool_call><function=set_value><parameter=value>\nnull\n</parameter><parameter=enabled>\nfalse\n</parameter></function></tool_call>",
            multiple.schema, characters: true), ["value": .null, "enabled": .bool(false)], #"{"value":null,"enabled":false}"#))
        let oldInitializer: (String, [String: ToolParamKind]) -> ToolSchema = ToolSchema.init
        let oldCoerce: (String, ToolParamKind) -> JSONValue = ToolCallSplitter.coerce
        c.equal("legacy coerce function keeps its fallback", oldCoerce("null", .integer), .string("null"))
        let legacy = oldInitializer("set_value", ["value": .integer])
        c.expect("legacy schema function keeps nonnullable behavior", matches(events(
            "<tool_call><function=set_value><parameter=value>\nnull\n</parameter></function></tool_call>", legacy),
            ["value": .string("null")], #"{"value":"null"}"#))
        return c.report()
    }
}
