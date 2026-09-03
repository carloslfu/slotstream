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
        c.equal("one call: event count", ev.count, 5)  // start, 2 deltas, end, call
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

    /// Events with ids normalized away, so two runs compare by shape and value.
    ///
    /// Adjacent text events are coalesced: how prose is chunked depends on the
    /// delta boundaries and is not a semantic difference. What must not vary is
    /// the concatenated text, the calls, and their order.
    static func normalize(_ events: [ToolStreamEvent]) -> [String] {
        var out: [String] = []
        for s in rawNormalize(events) {
            if s.hasPrefix("text:"), let last = out.last, last.hasPrefix("text:") {
                out[out.count - 1] = last + String(s.dropFirst("text:".count))
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
