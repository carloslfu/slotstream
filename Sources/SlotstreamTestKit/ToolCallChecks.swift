// T0: the tool-call parser, on fixtures. No MLX, no weights, no tokenizer.
//
// The property that matters most is that a stream and a whole text agree. The
// model's grammar is delivered a token at a time, and every tag in it can be
// split across two deltas; a parser that is correct only on complete text is
// correct only in the gate. So the central check re-runs one fixture split at
// *every* character boundary and requires the same events each time.

import Foundation
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    /// fx's real schemas, reduced to what the parser needs. The types are the
    /// ones fx actually declares, including the `anyOf` fields on `terminal`.
    static var fxToolSchemas: [ToolSchema] {
        [
            ToolSchema(
                name: "read_file",
                params: ["path": .string, "start_line": .integer, "end_line": .integer]),
            ToolSchema(
                name: "write_file", params: ["path": .string, "content": .string]),
            ToolSchema(
                name: "edit_file",
                params: ["path": .string, "old_string": .string, "new_string": .string,
                         "replace_all": .boolean]),
            ToolSchema(
                name: "terminal",
                params: ["command": .string, "timeout": .unknown, "background": .unknown]),
            ToolSchema(
                name: "list_dir", params: ["path": .string, "depth": .integer]),
            ToolSchema(
                name: "grep",
                params: ["pattern": .string, "path": .string, "glob": .string,
                         "case_sensitive": .boolean]),
            ToolSchema(
                name: "todo_write", params: ["todos": .array, "merge": .boolean]),
            ToolSchema(
                name: "task", params: ["prompt": .string, "context": .object]),
        ]
    }

    /// A deterministic id factory, so a gate can compare events by value.
    static func countingIDs() -> @Sendable () -> String {
        let box = Counter()
        return { box.next() }
    }

    static var toolCallChecks: [Check] {
        [
            Check("toolcall-check", tier: .t0) { toolCallParsing() },
            Check("toolcall-stream-check", tier: .t0) { toolCallStreaming() },
            Check("toolcall-coercion", tier: .t0) { toolCallCoercion() },
            Check("tool-schema-refs", tier: .t0) { toolSchemaRefs() },
            Check("tool-schema-ref-output", tier: .t0) { toolSchemaRefOutput() },
            Check("tool-schema-string-enum", tier: .t0) { toolSchemaStringEnum() },
            Check("toolcall-unicode-string-stream", tier: .t0) { toolCallUnicodeStringStream() },
            Check("tool-schema-ref-dialects", tier: .t0) { try toolSchemaRefDialects() },
        ]
    }

    // MARK: - shapes

    static let oneCall = """
        <tool_call>
        <function=read_file>
        <parameter=path>
        hello.txt
        </parameter>
        </function>
        </tool_call>
        """

    static let proseThenCall = """
        Let me read it.
        <tool_call>
        <function=read_file>
        <parameter=path>
        hello.txt
        </parameter>
        <parameter=start_line>
        1
        </parameter>
        </function>
        </tool_call>
        """

    static let twoCalls = """
        <tool_call>
        <function=read_file>
        <parameter=path>
        a.txt
        </parameter>
        </function>
        </tool_call>
        <tool_call>
        <function=list_dir>
        <parameter=path>
        .
        </parameter>
        <parameter=depth>
        2
        </parameter>
        </function>
        </tool_call>
        """

    static func toolCallParsing() -> CheckReport {
        var c = CheckBuilder("toolcall-check")
        let tools = fxToolSchemas

        // One call, nothing else.
        var ev = ToolCallSplitter.parseAll(oneCall, tools: tools, idFactory: countingIDs())
        c.equal("one call: assembled events", normalize(ev), ["start:read_file",
            #"delta:{"path":"hello.txt"}"#, "end", #"call:read_file:{"path":"hello.txt"}"#])
        if case .toolCall(let call) = ev.last {
            c.equal("one call: name", call.name, "read_file")
            c.equal("one call: input", call.inputJSON, #"{"path":"hello.txt"}"#)
            c.equal("one call: id", call.id, "call_00000001")
        } else {
            c.expect("one call: ends with a tool call", false)
        }

        // Prose before a call is text; the call still parses.
        ev = ToolCallSplitter.parseAll(proseThenCall, tools: tools, idFactory: countingIDs())
        if case .text(let t) = ev.first {
            c.equal("prose: leading text", t, "Let me read it.\n")
        } else {
            c.expect("prose: leads with text", false)
        }
        if case .toolCall(let call) = ev.last {
            // start_line is declared integer, so it must not arrive quoted.
            c.equal(
                "prose: typed input", call.inputJSON, #"{"path":"hello.txt","start_line":1}"#)
        } else {
            c.expect("prose: ends with a tool call", false)
        }

        // Two calls in one turn.
        ev = ToolCallSplitter.parseAll(twoCalls, tools: tools, idFactory: countingIDs())
        let calls = ev.compactMap { if case .toolCall(let x) = $0 { return x } else { return nil } }
        c.equal("two calls: count", calls.count, 2)
        if calls.count == 2 {
            c.equal("two calls: first", calls[0].inputJSON, #"{"path":"a.txt"}"#)
            c.equal("two calls: second", calls[1].inputJSON, #"{"path":".","depth":2}"#)
            c.expect("two calls: distinct ids", calls[0].id != calls[1].id)
        }

        // Text after the last call survives.
        ev = ToolCallSplitter.parseAll(
            oneCall + "\nDone.", tools: tools, idFactory: countingIDs())
        if case .text(let t) = ev.last {
            c.equal("trailing text", t, "\nDone.")
        } else {
            c.expect("trailing text is kept", false)
        }

        // A block that never closes is returned verbatim, not swallowed.
        let broken = "<tool_call>\n<function=read_file>\n<parameter=path>\nhello.txt"
        ev = ToolCallSplitter.parseAll(broken, tools: tools, idFactory: countingIDs())
        let malformed = ev.compactMap {
            if case .malformed(let x) = $0 { return x } else { return nil }
        }
        c.equal("unterminated: one malformed event", malformed.count, 1)
        c.equal("unterminated: verbatim", malformed.first ?? "", broken)
        c.expect(
            "unterminated: no tool call emitted",
            !ev.contains { if case .toolCall = $0 { return true } else { return false } })

        // A call with no parameters still produces a whole JSON object.
        ev = ToolCallSplitter.parseAll(
            "<tool_call>\n<function=list_dir>\n</function>\n</tool_call>",
            tools: tools, idFactory: countingIDs())
        if case .toolCall(let call) = ev.last {
            c.equal("no parameters: input", call.inputJSON, "{}")
        } else {
            c.expect("no parameters: still a call", false)
        }

        // The streamed deltas must concatenate into exactly the final input.
        for fixture in [oneCall, proseThenCall, twoCalls] {
            let events = ToolCallSplitter.parseAll(
                fixture, tools: tools, idFactory: countingIDs())
            var byID: [String: String] = [:]
            for e in events {
                if case .toolInputDelta(let id, let d) = e { byID[id, default: ""] += d }
            }
            for e in events {
                if case .toolCall(let call) = e {
                    c.equal(
                        "deltas concatenate to input (\(call.name))", byID[call.id] ?? "",
                        call.inputJSON)
                }
            }
        }
        return c.report()
    }

    /// The stream property: any split of the same text yields the same events.
    static func toolCallStreaming() -> CheckReport {
        var c = CheckBuilder("toolcall-stream-check")
        let tools = fxToolSchemas

        for (label, fixture) in [
            ("one call", oneCall), ("prose", proseThenCall), ("two calls", twoCalls),
            ("trailing", oneCall + "\nDone."),
        ] {
            let whole = normalize(
                ToolCallSplitter.parseAll(fixture, tools: tools, idFactory: countingIDs()))
            var mismatches = 0
            var leaked = 0
            let chars = Array(fixture)
            for cut in 0...chars.count {
                let s = ToolCallSplitter(tools: tools, idFactory: countingIDs())
                var ev: [ToolStreamEvent] = []
                ev += s.push(String(chars[0..<cut]))
                ev += s.push(String(chars[cut...]))
                ev += s.flush()
                if normalize(ev) != whole { mismatches += 1 }
                // No emitted text may contain a fragment of a tag.
                for e in ev {
                    if case .text(let t) = e, t.contains("<tool_call") || t.contains("<function")
                        || t.contains("<parameter") || t.contains("</function")
                    {
                        leaked += 1
                    }
                }
            }
            c.equal("\(label): every split agrees (\(chars.count + 1) splits)", mismatches, 0)
            c.equal("\(label): no partial tag leaks as text", leaked, 0)
        }

        // One character at a time is the worst case a real stream can produce.
        for (label, fixture) in [("one call", oneCall), ("two calls", twoCalls)] {
            let whole = normalize(
                ToolCallSplitter.parseAll(fixture, tools: tools, idFactory: countingIDs()))
            let s = ToolCallSplitter(tools: tools, idFactory: countingIDs())
            var ev: [ToolStreamEvent] = []
            for ch in fixture { ev += s.push(String(ch)) }
            ev += s.flush()
            c.equal("\(label): character-by-character agrees", normalize(ev), whole)
        }

        // Hold-back is exactly as long as it must be: ordinary prose streams
        // immediately, and only a real tag prefix is withheld.
        c.equal("holdback: plain text", ToolCallSplitter.holdback("hello", "<tool_call>"), 0)
        c.equal("holdback: partial tag", ToolCallSplitter.holdback("ab<tool", "<tool_call>"), 5)
        c.equal("holdback: bare <", ToolCallSplitter.holdback("x<", "<tool_call>"), 1)
        c.equal("holdback: complete tag not held", ToolCallSplitter.holdback("x<tool_call>", "<tool_call>"), 0)
        return c.report()
    }

    /// Coercion, one row per declared type, plus the fallbacks.
    static func toolCallCoercion() -> CheckReport {
        var c = CheckBuilder("toolcall-coercion")
        func coerce(_ raw: String, _ kind: ToolParamKind) -> String {
            ToolCallSplitter.coerce(raw, as: kind).jsonText
        }
        // The framing newlines are removed, exactly one of each.
        c.equal("string: framing newlines", coerce("\nhello.txt\n", .string), #""hello.txt""#)
        c.equal("string: inner newline kept", coerce("\na\nb\n", .string), #""a\nb""#)
        c.equal("string: blank line kept", coerce("\nx\n\n", .string), #""x\n""#)
        c.equal("string: numeric stays string", coerce("\n42\n", .string), #""42""#)
        c.equal("integer", coerce("\n42\n", .integer), "42")
        c.equal("integer: negative", coerce("\n-7\n", .integer), "-7")
        c.equal("integer: not a number falls back", coerce("\nabc\n", .integer), #""abc""#)
        for value in ["1e20", "-1e20", "9223372036854775808", "1e309", "inf", "nan"] {
            for kind: ToolParamKind in [.integer, .number] {
                let result = ToolCallSplitter.coerce(value, as: kind)
                c.expect("out-of-range numeric output stays serializable: \(value)/\(kind)",
                    (try? JSONSerialization.jsonObject(with: Data(result.jsonText.utf8), options: [.fragmentsAllowed])) != nil)
            }
        }
        c.equal("number: integral prints as int", coerce("\n2\n", .number), "2")
        c.equal("number: fractional", coerce("\n2.5\n", .number), "2.5")
        c.equal("boolean true", coerce("\ntrue\n", .boolean), "true")
        c.equal("boolean false", coerce("\nfalse\n", .boolean), "false")
        c.equal("boolean: junk falls back", coerce("\nyes\n", .boolean), #""yes""#)
        c.equal("array", coerce("\n[1,2]\n", .array), "[1,2]")
        c.equal("array: junk falls back", coerce("\nnot json\n", .array), #""not json""#)
        c.equal("object", coerce(#"{"a":1}"#, .object), #"{"a":1}"#)
        c.equal("object: key order is sorted", coerce(#"{"b":1,"a":2}"#, .object), #"{"a":2,"b":1}"#)
        // anyOf / undeclared: unambiguous JSON only, a bare word stays a word.
        c.equal("unknown: bare word", coerce("\nhello\n", .unknown), #""hello""#)
        c.equal("unknown: integer", coerce("\n30\n", .unknown), "30")
        c.equal("unknown: boolean", coerce("\ntrue\n", .unknown), "true")
        c.equal("unknown: object", coerce(#"{"a":1}"#, .unknown), #"{"a":1}"#)
        // An undeclared parameter name is a string, never dropped.
        let ev = ToolCallSplitter.parseAll(
            "<tool_call>\n<function=read_file>\n<parameter=nonesuch>\nv\n</parameter>\n</function>\n</tool_call>",
            tools: fxToolSchemas, idFactory: countingIDs())
        if case .toolCall(let call) = ev.last {
            c.equal("undeclared parameter is kept", call.inputJSON, #"{"nonesuch":"v"}"#)
        } else {
            c.expect("undeclared parameter still parses", false)
        }
        // A missing required parameter is still emitted: the tool reports it.
        let missing = ToolCallSplitter.parseAll(
            "<tool_call>\n<function=read_file>\n<parameter=start_line>\n3\n</parameter>\n</function>\n</tool_call>",
            tools: fxToolSchemas, idFactory: countingIDs())
        if case .toolCall(let call) = missing.last {
            c.equal("missing required parameter passes through", call.inputJSON, #"{"start_line":3}"#)
        } else {
            c.expect("missing required parameter still parses", false)
        }
        // JSON escaping in a value must survive the round trip.
        c.equal(
            "string: quotes and backslashes escaped",
            coerce("\nsay \"hi\"\\\n", .string), #""say \"hi\"\\""#)
        return c.report()
    }

    static let referencedToolParameters: JSONValue = .object([
        "type": .string("object"),
        "$defs": .object(["Text": .object(["type": .string("string")])]),
        "properties": .object(["value": .object(["$ref": .string("#/$defs/Text")])]),
    ])

    static func toolSchemaRefs() -> CheckReport {
        var c = CheckBuilder("tool-schema-refs")
        func kind(_ field: JSONValue, definitions: [String: JSONValue] = [:]) -> ToolParamKind? {
            ToolDefinition(name: "echo", description: "", parameters: .object([
                "$defs": .object(definitions), "properties": .object(["value": field]),
            ])).schema.params["value"]
        }
        func ref(_ pointer: String) -> JSONValue { .object(["$ref": .string(pointer)]) }
        let string: JSONValue = .object(["type": .string("string")])
        let defs: [String: JSONValue] = [
            "Text": string, "Alias": ref("#/$defs/Text"),
            "a/b~c": string, "~1": string, "white space": string, "雪": string, "": string,
            "Nullable": .object(["anyOf": .array([ref("#/$defs/Text"), .object(["type": .string("null")])])]),
            "Null": .object(["type": .string("null")]),
            "List": .array([string]),
            "Self": ref("#/$defs/Self"), "A": ref("#/$defs/B"), "B": ref("#/$defs/A"),
            "Scalar": .string("string"), "BooleanSchema": .bool(true),
            "Resource": .object(["$id": .string("other.json"), "$defs": .object(["Text": string]),
                "properties": .object(["text": ref("#/$defs/Text")])]),
        ]
        for pointer in ["#/$defs/Text", "#/$defs/Alias", "#/$defs/a~1b~0c", "#/$defs/~01",
                        "#/$defs/white%20space", "#/$defs/%E9%9B%AA", "#/$defs/", "#/$defs/List/0",
                        "#/%24defs/Text", "#/$defs/Nullable"] {
            c.equal("local pointer resolves: \(pointer)", kind(ref(pointer), definitions: defs), .string)
        }
        for pointer in ["#/$defs/Missing", "#/$defs/Self", "#/$defs/A", "#anchor", "other.json#/$defs/Text",
                        "https://example.invalid/schema", "#/$defs/Scalar", "#/$defs/BooleanSchema",
                        "#/$defs/List/00", "#/$defs/List/-", "#/$defs/List/1", "#/$defs/a~2b",
                        "#/$defs/white%ZZspace", "#/$defs/Resource", "#/$defs/Resource/properties/text"] {
            c.equal("unsupported pointer stays unknown: \(pointer)", kind(ref(pointer), definitions: defs), .unknown)
        }
        c.equal("nullable anyOf resolves referenced null and string", kind(.object([
            "anyOf": .array([ref("#/$defs/Text"), ref("#/$defs/Null")]),
        ]), definitions: defs), .string)
        c.equal("mixed anyOf remains ambiguous", kind(.object([
            "anyOf": .array([ref("#/$defs/Text"), .object(["type": .string("number")])]),
        ]), definitions: defs), .unknown)
        c.equal("repeated union branches retain their single type", kind(.object([
            "anyOf": .array([ref("#/$defs/Text"), ref("#/$defs/Text")]),
        ]), definitions: defs), .string)
        c.equal("an unresolved branch keeps a repeated-type union unknown", kind(.object([
            "anyOf": .array([string, string, ref("#/$defs/Missing")]),
        ]), definitions: defs), .unknown)
        c.equal("repetition does not hide a distinct concrete type", kind(.object([
            "anyOf": .array([string, string, .object(["type": .string("number")])]),
        ]), definitions: defs), .unknown)
        c.equal("ref annotations do not hide its type", kind(.object([
            "$ref": .string("#/$defs/Text"), "description": .string("Text"), "default": .null,
        ]), definitions: defs), .string)
        c.equal("a ref sibling retains its directly declared type", kind(.object([
            "$ref": .string("#/$defs/Text"), "type": .string("number"),
        ]), definitions: defs), .number)
        for pointer in ["#/$defs/Text", "#/$defs/Missing", "#/$defs/Self", "other.json#/$defs/Text", "#bad~2"] {
            c.equal("a direct string survives a ref sibling: \(pointer)", kind(.object([
                "$ref": .string(pointer), "type": .string("string"),
            ]), definitions: defs), .string)
        }
        c.equal("nullable type siblings retain the original inference", kind(.object([
            "$ref": .string("#/$defs/Text"), "type": .array([.string("number"), .string("null")]),
        ]), definitions: defs), .number)
        c.equal("anyOf siblings retain the original inference", kind(.object([
            "$ref": .string("#/$defs/Missing"),
            "anyOf": .array([string, .object(["type": .string("null")])]),
        ]), definitions: defs), .string)
        c.equal("sibling fallback preserves the resource boundary", kind(.object([
            "$id": .string("other.json"), "$ref": .string("#/$defs/Text"),
            "anyOf": .array([ref("#/$defs/Text"), .object(["type": .string("null")])]),
        ]), definitions: defs), .unknown)
        let siblingRoot: JSONValue = .object([
            "$ref": .string("#/$defs/Other"),
            "$defs": .object(["Text": string, "Other": .object([
                "properties": .object(["ignored": .object(["type": .string("number")])]),
            ])]),
            "properties": .object(["direct": string, "referenced": ref("#/$defs/Text")]),
        ])
        let siblingTool = ToolDefinition(name: "echo", description: "", parameters: siblingRoot)
        c.equal("root ref preserves its own properties", siblingTool.schema.params,
            ["direct": .string, "referenced": .string])
        let siblingEvents = ToolCallSplitter.parseAll(
            "<tool_call><function=echo><parameter=direct>00123</parameter></function></tool_call>",
            tools: [siblingTool.schema], idFactory: countingIDs())
        let siblingCall = siblingEvents.compactMap { if case .toolCall(let call) = $0 { return call }; return nil }.first
        c.equal("root ref sibling preserves string argument bytes",
            siblingCall?.arguments["direct"], .string("00123"))
        c.equal("ref composition is not flattened", kind(.object([
            "$ref": .string("#/$defs/Text"), "allOf": .array([string]),
        ]), definitions: defs), .unknown)
        c.equal("a local id changes the reference resource", kind(.object([
            "$id": .string("other.json"), "$ref": .string("#/$defs/Text"),
        ]), definitions: defs), .unknown)
        for id in ["$id", "id"] {
            c.equal("\(id) does not hide a direct type", kind(.object([
                id: .string("other.json"), "type": .string("string"),
            ])), .string)
            c.equal("\(id) does not hide direct nullable types", kind(.object([
                id: .string("other.json"), "anyOf": .array([string, .object(["type": .string("null")])]),
            ])), .string)
            c.equal("\(id) prevents nested anyOf references from using the outer resource", kind(.object([
                id: .string("other.json"), "anyOf": .array([ref("#/$defs/Text"), .object(["type": .string("null")])]),
            ]), definitions: defs), .unknown)
            c.equal("definition named \(id) is not a resource boundary",
                kind(ref("#/$defs/Text"), definitions: [id: string, "Text": string]), .string)
        }
        c.equal("pointer matches exact Unicode code points",
            kind(ref("#/$defs/e\u{0301}"), definitions: ["é": string]), .unknown)
        c.equal("exact decomposed Unicode key resolves",
            kind(ref("#/$defs/e\u{0301}"), definitions: ["e\u{0301}": string]), .string)
        for (key, pointer) in [("tilde~\u{0301}key", "#/$defs/tilde~0\u{0301}key"),
                               ("slash/\u{0301}key", "#/$defs/slash~1\u{0301}key"),
                               ("\u{0301}leading", "#/$defs/\u{0301}leading")] {
            c.equal("pointer grammar uses code points: \(pointer)",
                kind(ref(pointer), definitions: [key: string]), .string)
        }
        var deep = string
        for _ in 0..<200 { deep = .object(["anyOf": .array([deep, .object(["type": .string("null")])])]) }
        c.equal("excessive nesting is bounded", kind(deep), .unknown)
        var chain: [String: JSONValue] = ["200": string]
        for i in 0..<200 { chain[String(i)] = ref("#/$defs/\(i + 1)") }
        c.equal("excessive ref chain is bounded", kind(ref("#/$defs/0"), definitions: chain), .unknown)

        let parameters: JSONValue = .object([
            "$id": .string("https://example.invalid/tool"), "$ref": .string("#/definitions/Params"),
            "definitions": .object(["Text": string, "Params": .object([
                "type": .string("object"), "properties": .object([
                    "first": ref("#/definitions/Text"), "second": ref("#/definitions/Text"),
                    "recursive": ref("#"),
                ]),
            ])]),
        ])
        let tool = ToolDefinition(name: "echo", description: "", parameters: parameters)
        c.equal("root ref and legacy definitions", tool.schema.params["first"], .string)
        c.equal("independent properties may share references", tool.schema.params["second"], .string)
        c.equal("recursive object needs no recursive value coercion", tool.schema.params["recursive"], .object)
        let template = tool.templateValue["function"] as? [String: any Sendable]
        let templateParameters = template?["parameters"]
            .flatMap { try? JSONSerialization.data(withJSONObject: $0, options: [.sortedKeys]) }
        let originalParameters = try? JSONSerialization.data(withJSONObject: parameters.any, options: [.sortedKeys])
        c.expect("original schema document serializes", originalParameters != nil)
        c.equal("prompt retains the original schema document", templateParameters, originalParameters)
        c.equal("root ref loop terminates", ToolDefinition(name: "echo", description: "",
            parameters: ref("#")).schema.params, [:])
        return c.report()
    }

    static func toolSchemaRefOutput() -> CheckReport {
        var c = CheckBuilder("tool-schema-ref-output")
        let cases: [(ToolParamKind, String, JSONValue)] = [
            (.string, "00123", .string("00123")), (.string, "false", .string("false")),
            (.string, #"{"flag":true}"#, .string(#"{"flag":true}"#)),
            (.string, " \t雪🙂\nnext\n", .string(" \t雪🙂\nnext\n")),
            (.number, "1.25", .double(1.25)), (.number, "1e-3", .double(0.001)),
            (.integer, "42", .int(42)), (.boolean, "false", .bool(false)),
            (.object, #"{"code":"00123","flag":"false","nested":["1",null]}"#,
                .object(["code": .string("00123"), "flag": .string("false"), "nested": .array([.string("1"), .null])])),
            (.array, #"["00123","false",{"code":"00123"}]"#,
                .array([.string("00123"), .string("false"), .object(["code": .string("00123")])])),
        ]
        for (type, raw, expected) in cases {
            let scalar: JSONValue = .object(["type": .string(type.rawValue)])
            let alternate: JSONValue
            switch type {
            case .string: alternate = .string("other")
            case .integer: alternate = .int(43)
            case .number: alternate = .double(2.75)
            case .boolean: alternate = .bool(true)
            case .object: alternate = .object(["other": .bool(true)])
            case .array: alternate = .array([.int(2)])
            case .unknown: alternate = .null
            }
            let direct = ToolDefinition(name: "echo", description: "", parameters: .object([
                "properties": .object(["value": scalar]),
            ]))
            let referenced = ToolDefinition(name: "echo", description: "", parameters: .object([
                "$defs": .object(["Value": scalar]), "properties": .object([
                    "value": .object(["anyOf": .array([.object(["$ref": .string("#/$defs/Value")]),
                        .object(["type": .string("null")])])]),
                ]),
            ]))
            let variants: [(String, ToolDefinition)] = [
                ("referenced", referenced),
                ("same-type anyOf", ToolDefinition(name: "echo", description: "", parameters: .object([
                    "properties": .object(["value": .object(["anyOf": .array([scalar, scalar])])]),
                ]))),
                ("same-type enums", ToolDefinition(name: "echo", description: "", parameters: .object([
                    "properties": .object(["value": .object(["anyOf": .array([
                        .object(["type": .string(type.rawValue), "enum": .array([expected])]),
                        .object(["type": .string(type.rawValue), "enum": .array([alternate])]),
                    ])])]),
                ]))),
                ("nested nullable anyOf", ToolDefinition(name: "echo", description: "", parameters: .object([
                    "$defs": .object(["Value": scalar]), "properties": .object(["value": .object([
                        "anyOf": .array([
                            .object(["anyOf": .array([scalar, .object(["type": .string("null")])])]),
                            .object(["$ref": .string("#/$defs/Value")]),
                        ]),
                    ])]),
                ]))),
            ]
            let xml = "<tool_call>\n<function=echo>\n<parameter=value>\n\(raw)\n</parameter>\n</function>\n</tool_call>"
            let whole = ToolCallSplitter.parseAll(xml, tools: [direct.schema], idFactory: countingIDs())
            let chars = Array(xml)
            for (label, definition) in variants {
                let label = "\(type)/\(raw)/\(label)"
                c.equal("\(label): declared type is retained", definition.schema.params["value"], type)
                var mismatches = 0
                for cut in 0...chars.count {
                    let parser = ToolCallSplitter(tools: [definition.schema], idFactory: countingIDs())
                    let events = parser.push(String(chars[..<cut])) + parser.push(String(chars[cut...])) + parser.flush()
                    if normalize(events) != normalize(whole) { mismatches += 1 }
                }
                c.equal("\(label): every split matches direct type", mismatches, 0)
                let parser = ToolCallSplitter(tools: [definition.schema], idFactory: countingIDs())
                let events = chars.flatMap { parser.push(String($0)) } + parser.flush()
                c.equal("\(label): character stream matches direct type", normalize(events), normalize(whole))
                let call = events.compactMap { if case .toolCall(let call) = $0 { return call }; return nil }.first
                c.equal("\(label): value retains JSON type and contents", call?.arguments["value"], expected)
                let deltas = events.compactMap { if case .toolInputDelta(_, let delta) = $0 { return delta }; return nil }.joined()
                c.equal("\(label): streamed JSON equals final input", call?.inputJSON, deltas)
            }
        }
        return c.report()
    }

    static func toolSchemaStringEnum() -> CheckReport {
        var c = CheckBuilder("tool-schema-string-enum")
        func definition(_ field: JSONValue, definitions: [String: JSONValue] = [:],
                        draft: String? = nil) -> ToolDefinition {
            var root: [String: JSONValue] = [
                "type": .string("object"), "properties": .object(["value": field]),
                "required": .array([.string("value")]), "additionalProperties": .bool(false),
                "definitions": .object(definitions),
            ]
            if let draft { root["$schema"] = .string(draft) }
            return ToolDefinition(name: "echo", description: "", parameters: .object(root))
        }
        let cases: [(String, String)] = [
            ("0", #"{"value":"0"}"#),
            ("00123", #"{"value":"00123"}"#),
            ("false", #"{"value":"false"}"#),
            (#"{"key":1}"#, #"{"value":"{\"key\":1}"}"#),
            ("[1]", #"{"value":"[1]"}"#),
            (" \t雪🙂\nnext\n", #"{"value":" \t雪🙂\nnext\n"}"#),
        ]
        for (raw, expectedJSON) in cases {
            let values = [JSONValue.string(raw), .string("other")]
            let leaf: JSONValue = .object(["enum": .array(values)])
            let branches: [JSONValue] = [
                .object(["enum": .array([.string(raw)])]),
                .object(["enum": .array([.string("other")])]),
            ]
            let variants: [(String, ToolDefinition)] = [
                ("typed control", definition(.object(["type": .string("string"), "enum": .array(values)]))),
                ("direct enum", definition(leaf)),
                ("reversed enum", definition(.object(["enum": .array(Array(values.reversed()))]))),
                ("referenced enum", definition(.object(["$ref": .string("#/definitions/Value")]),
                                               definitions: ["Value": leaf])),
                ("enum anyOf", definition(.object(["anyOf": .array(branches)]))),
                ("reversed enum anyOf", definition(.object(["anyOf": .array(Array(branches.reversed()))]))),
            ]
            let xml = "<tool_call>\n<function=echo>\n<parameter=value>\n\(raw)\n</parameter>\n</function>\n</tool_call>"
            let expectedEvents = ["start:echo", "delta:" + expectedJSON, "end", "call:echo:" + expectedJSON]
            let chars = Array(xml)
            for (name, tool) in variants {
                let label = "\(name)/\(raw)"
                c.equal("\(label): string inferred", tool.schema.params["value"], .string)
                let whole = ToolCallSplitter.parseAll(xml, tools: [tool.schema], idFactory: countingIDs())
                c.equal("\(label): whole text has literal JSON", normalize(whole), expectedEvents)
                let call = whole.compactMap { if case .toolCall(let call) = $0 { return call }; return nil }.first
                c.equal("\(label): value retains string bytes", call?.arguments["value"], .string(raw))
                c.equal("\(label): final JSON matches literal", call?.inputJSON, expectedJSON)
                var mismatches = 0
                for cut in 0...chars.count {
                    let parser = ToolCallSplitter(tools: [tool.schema], idFactory: countingIDs())
                    let events = parser.push(String(chars[..<cut])) + parser.push(String(chars[cut...])) + parser.flush()
                    if normalize(events) != expectedEvents { mismatches += 1 }
                }
                c.equal("\(label): every split has literal JSON", mismatches, 0)
                let parser = ToolCallSplitter(tools: [tool.schema], idFactory: countingIDs())
                let streamed = chars.flatMap { parser.push(String($0)) } + parser.flush()
                c.equal("\(label): character stream has literal JSON", normalize(streamed), expectedEvents)
                let deltas = streamed.compactMap { if case .toolInputDelta(_, let delta) = $0 { return delta }; return nil }.joined()
                c.equal("\(label): deltas match literal JSON", deltas, expectedJSON)
                let template = tool.templateValue["function"] as? [String: any Sendable]
                let supplied = try? JSONSerialization.data(withJSONObject: tool.parameters.any, options: [.sortedKeys])
                let rendered = template?["parameters"]
                    .flatMap { try? JSONSerialization.data(withJSONObject: $0, options: [.sortedKeys]) }
                c.expect("\(label): source schema serializes", supplied != nil)
                c.equal("\(label): prompt schema unchanged", rendered, supplied)
            }
        }

        let strings: JSONValue = .array([.string("0"), .string("1")])
        let controls: [(String, JSONValue)] = [
            ("mixed enum", .object(["enum": .array([.string("0"), .int(0)])])),
            ("nullable enum", .object(["enum": .array([.string("0"), .null])])),
            ("integer enum", .object(["enum": .array([.int(0), .int(1)])])),
            ("boolean enum", .object(["enum": .array([.bool(false), .bool(true)])])),
            ("no type or enum", .object([:])),
            ("empty enum", .object(["enum": .array([])])),
            ("malformed enum", .object(["enum": .string("0")])),
            ("explicit union retains priority", .object([
                "type": .array([.string("string"), .string("integer")]), "enum": strings,
            ])),
            ("anyOf retains priority", .object([
                "anyOf": .array([.object(["type": .string("string")]), .object(["type": .string("integer")])]),
                "enum": strings,
            ])),
            ("unresolved union remains unknown", .object([
                "anyOf": .array([.object(["enum": strings]), .object(["$ref": .string("#/definitions/Missing")])]),
                "enum": strings,
            ])),
            ("enum proof stops at work bound", .object([
                "enum": .array((0..<200).map { .string(String($0)) }),
            ])),
        ]
        for (name, field) in controls {
            c.equal("\(name): conservative unknown", definition(field).schema.params["value"], .unknown)
        }
        // Draft-07 ignores enum siblings of a reference. Do not newly infer
        // a string from a field the resolver deliberately left unresolved.
        let sibling = definition(.object(["$ref": .string("#/definitions/N"), "enum": strings]),
            definitions: ["N": .object(["type": .string("integer")])],
            draft: "http://json-schema.org/draft-07/schema#")
        c.equal("ref sibling retains unknown", sibling.schema.params["value"], .unknown)
        let events = ToolCallSplitter.parseAll(
            "<tool_call>\n<function=echo>\n<parameter=value>\n0\n</parameter>\n</function>\n</tool_call>",
            tools: [sibling.schema], idFactory: countingIDs())
        let call = events.compactMap { if case .toolCall(let call) = $0 { return call }; return nil }.first
        c.equal("draft-07 ref sibling preserves integer", call?.arguments["value"], .int(0))
        c.equal("draft-07 ref sibling final JSON", call?.inputJSON, #"{"value":0}"#)
        return c.report()
    }

    static func toolCallUnicodeStringStream() -> CheckReport {
        var c = CheckBuilder("toolcall-unicode-string-stream")
        let tool = ToolSchema(name: "write_file", params: ["content": .string])
        // The expected JSON is literal: do not reuse the parser's quoting or
        // Character-based event normalization as the oracle for Unicode bytes.
        let cases: [(String, String, String)] = [
            ("leading acute", "\u{0301}suffix", "{\"content\":\"\u{0301}suffix\"}"),
            ("leading variation selector", "\u{FE0F}suffix", "{\"content\":\"\u{FE0F}suffix\"}"),
            ("leading joiner", "\u{200D}suffix", "{\"content\":\"\u{200D}suffix\"}"),
            ("leading nonjoiner", "\u{200C}suffix", "{\"content\":\"\u{200C}suffix\"}"),
            ("leading two marks", "\u{0301}\u{0327}suffix", "{\"content\":\"\u{0301}\u{0327}suffix\"}"),
            ("leading mark with escapes", "\u{0301}\"\\\t\n雪🙂", "{\"content\":\"\u{0301}\\\"\\\\\\t\\n雪🙂\"}"),
            ("leading mark long value", "\u{0301}abcdefghijklmnopqrstuvwxyz0123456789",
             "{\"content\":\"\u{0301}abcdefghijklmnopqrstuvwxyz0123456789\"}"),
            ("trailing prepend", "A\u{0600}", "{\"content\":\"A\u{0600}\"}"),
            ("base with mark control", "e\u{0301}suffix", "{\"content\":\"e\u{0301}suffix\"}"),
            ("emoji joiner control", "👩\u{200D}💻", "{\"content\":\"👩\u{200D}💻\"}"),
            ("ASCII escapes control", "\"\\\t\n", #"{"content":"\"\\\t\n"}"#),
            ("empty control", "", #"{"content":""}"#),
        ]
        func shape(_ events: [ToolStreamEvent]) -> [String] {
            var result: [String] = []
            for event in events {
                let kind: String
                switch event {
                case .toolInputStart(_, let name): kind = "start:\(name)"
                case .toolInputDelta: kind = "delta"
                case .toolInputEnd: kind = "end"
                case .toolCall(let call): kind = "call:\(call.name)"
                case .text: kind = "text"
                case .malformed: kind = "malformed"
                }
                if kind != "delta" || result.last != kind { result.append(kind) }
            }
            return result
        }
        func call(_ events: [ToolStreamEvent]) -> ParsedToolCall? {
            events.compactMap { if case .toolCall(let call) = $0 { return call }; return nil }.first
        }
        func argumentBytes(_ call: ParsedToolCall?) -> [UInt8]? {
            guard case .string(let value) = call?.arguments["content"] else { return nil }
            return Array(value.utf8)
        }
        func deltaBytes(_ events: [ToolStreamEvent]) -> [UInt8] {
            events.compactMap { if case .toolInputDelta(_, let delta) = $0 { return delta }; return nil }
                .flatMap { Array($0.utf8) }
        }
        let expectedShape = ["start:write_file", "delta", "end", "call:write_file"]
        for (name, raw, expectedJSON) in cases {
            let xml = "<tool_call>\n<function=write_file>\n<parameter=content>\n\(raw)\n</parameter>\n</function>\n</tool_call>"
            let expectedBytes = Array(expectedJSON.utf8)
            func complete(_ events: [ToolStreamEvent]) -> Bool {
                let final = call(events)
                return shape(events) == expectedShape && final?.arguments.count == 1
                    && argumentBytes(final) == Array(raw.utf8)
                    && final.map { Array($0.inputJSON.utf8) } == expectedBytes
            }
            let whole = ToolCallSplitter.parseAll(xml, tools: [tool], idFactory: countingIDs())
            c.equal("\(name): whole event shape", shape(whole), expectedShape)
            c.equal("\(name): whole argument bytes", argumentBytes(call(whole)), Array(raw.utf8))
            c.equal("\(name): whole final JSON bytes", call(whole).map { Array($0.inputJSON.utf8) }, expectedBytes)
            c.equal("\(name): whole delta JSON bytes", deltaBytes(whole), expectedBytes)
            // A token boundary can split a grapheme cluster. Cover every
            // Unicode scalar boundary, including within combining sequences.
            let scalars = xml.unicodeScalars.map(String.init)
            var finalMismatches = 0
            var deltaMismatches = 0
            for cut in 0...scalars.count {
                let parser = ToolCallSplitter(tools: [tool], idFactory: countingIDs())
                let events = parser.push(scalars[..<cut].joined())
                    + parser.push(scalars[cut...].joined()) + parser.flush()
                if !complete(events) { finalMismatches += 1 }
                if deltaBytes(events) != expectedBytes { deltaMismatches += 1 }
            }
            c.equal("\(name): every scalar split final value", finalMismatches, 0)
            c.equal("\(name): every scalar split delta JSON bytes", deltaMismatches, 0)
            let parser = ToolCallSplitter(tools: [tool], idFactory: countingIDs())
            let streamed = scalars.flatMap { parser.push($0) } + parser.flush()
            c.expect("\(name): scalar stream final value", complete(streamed))
            c.equal("\(name): scalar stream delta JSON bytes", deltaBytes(streamed), expectedBytes)
        }
        return c.report()
    }

    static func toolSchemaRefDialects() throws -> CheckReport {
        var c = CheckBuilder("tool-schema-ref-dialects")
        let schema = referencedToolParameters.any
        let function: [String: Any] = ["name": "echo", "parameters": schema]
        let openAI = try OpenAIDialect.conversation([
            "messages": [["role": "user", "content": "echo"]],
            "tools": [["type": "function", "function": function]],
        ], contextLimit: 32768).tools
        let responses = try ResponsesDialect.parse([
            "input": "echo", "tools": [function.merging(["type": "function"]) { _, new in new }],
        ]).tools
        let anthropic = try AnthropicDialect.parse([
            "model": "m", "max_tokens": 16, "messages": [["role": "user", "content": "echo"]],
            "tools": [["name": "echo", "input_schema": schema]],
        ]).tools
        let gateway = try GatewayDialect.parse([
            "prompt": [["role": "user", "content": [["type": "text", "text": "echo"]]]],
            "tools": [["type": "function", "name": "echo", "inputSchema": schema]],
        ], modelID: "m").get().tools
        for (name, tools) in [("OpenAI", openAI), ("Responses", responses), ("Anthropic", anthropic), ("Gateway", gateway)] {
            c.equal("\(name): raw schema is retained", tools.first?.parameters, referencedToolParameters)
            c.equal("\(name): local reference reaches type inference", tools.first?.schema.params["value"], .string)
            let events = ToolCallSplitter.parseAll(
                "<tool_call>\n<function=echo>\n<parameter=value>\n00123\n</parameter>\n</function>\n</tool_call>",
                tools: tools.map(\.schema))
            let call = events.compactMap { if case .toolCall(let call) = $0 { return call }; return nil }.first
            c.equal("\(name): argument bytes survive", call?.arguments["value"], .string("00123"))
        }
        return c.report()
    }

    /// Events with ids normalized away, so two runs compare by shape and value.
    ///
    /// Adjacent text events are coalesced: how prose is chunked depends on the
    /// delta boundaries and is not a semantic difference. What must not vary is
    /// the concatenated text, the calls, and their order.
    static func normalize(_ events: [ToolStreamEvent]) -> [String] {
        var out: [String] = []
        for s in rawNormalize(events) {
            if let prefix = ["text:", "delta:"].first(where: { s.hasPrefix($0) }),
               let last = out.last, last.hasPrefix(prefix) {
                out[out.count - 1] = last + String(s.dropFirst(prefix.count))
            } else {
                out.append(s)
            }
        }
        return out
    }

    static func rawNormalize(_ events: [ToolStreamEvent]) -> [String] {
        events.map { e in
            switch e {
            case .text(let t): return "text:\(t)"
            case .toolInputStart(_, let n): return "start:\(n)"
            case .toolInputDelta(_, let d): return "delta:\(d)"
            case .toolInputEnd: return "end"
            case .toolCall(let c): return "call:\(c.name):\(c.inputJSON)"
            case .malformed(let t): return "malformed:\(t)"
            }
        }
    }
}

/// A tiny counter behind a lock, so the id factory can be `@Sendable`.
final class Counter: @unchecked Sendable {
    private var n = 0
    private let lock = NSLock()
    func next() -> String {
        lock.lock()
        defer { lock.unlock() }
        n += 1
        return String(format: "call_%08x", n)
    }
}
