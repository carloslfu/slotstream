import Foundation
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    /// Real splitter + production Gateway reasoning and text/tool assemblers.
    /// No generated output or socket is needed to check these wire values.
    static func gatewayReasoningTail() throws -> CheckReport {
        var c = CheckBuilder("gateway-reasoning-tail")

        func assemble(_ chunks: [String], thinking: Bool = true,
                      tools: [ToolDefinition] = []) throws -> [[String: Any]] {
            let splitter = thinking ? ThinkSplitter() : nil
            var reasoning = GatewayReasoningOutput()
            let output = GatewayOutput(tools: tools, choice: .auto)
            let parser = ToolCallSplitter(tools: tools.map(\.schema), idFactory: { "call_fixture" })
            var parts: [[String: Any]] = []
            func body(_ text: String) {
                if !text.isEmpty {
                    parts += output.consume(output.acceptsToolCalls ? parser.push(text) : [.text(text)])
                }
            }
            for delta in chunks where !delta.isEmpty {
                if let splitter {
                    let (think, content) = splitter.push(delta)
                    parts += reasoning.push(thinking: think, content: content)
                    body(content)
                } else { body(delta) }
            }
            if let splitter {
                let (think, content) = splitter.flush()
                parts += reasoning.finish(thinking: think)
                body(content)
            }
            if output.acceptsToolCalls { parts += output.consume(parser.flush()) }
            parts += output.finish()

            // Exercise the exact Gateway SSE frame serializer as well as the
            // production state. Parse its JSON back before asserting values.
            return try parts.map { part in
                let frame = GatewayDialect.frame(part)
                guard frame.hasPrefix("data: "), frame.hasSuffix("\n\n"),
                      let object = try JSONSerialization.jsonObject(
                        with: Data(frame.dropFirst(6).dropLast(2).utf8)) as? [String: Any]
                else { throw ServerError("invalid Gateway fixture frame") }
                return object
            }
        }
        func types(_ parts: [[String: Any]]) -> [String] {
            parts.compactMap { $0["type"] as? String }
        }
        func deltas(_ kind: String, _ parts: [[String: Any]]) -> String {
            parts.filter { $0["type"] as? String == kind }
                .compactMap { $0["delta"] as? String }.joined()
        }
        func check(_ label: String, _ chunks: [String], reason: String, answer: String,
                   thinking: Bool = true) throws {
            let parts = try assemble(chunks, thinking: thinking)
            let kinds = types(parts)
            let reasoning = parts.filter { ($0["type"] as? String ?? "").hasPrefix("reasoning-") }
            c.equal("\(label): complete reasoning survives", deltas("reasoning-delta", parts), reason)
            c.equal("\(label): complete answer survives", deltas("text-delta", parts), answer)
            c.equal("\(label): reasoning start count", kinds.filter { $0 == "reasoning-start" }.count,
                reason.isEmpty ? 0 : 1)
            c.equal("\(label): reasoning end count", kinds.filter { $0 == "reasoning-end" }.count,
                reason.isEmpty ? 0 : 1)
            c.expect("\(label): stable reasoning block identity", reasoning.allSatisfy { $0["id"] as? String == "r0" })
            if !reason.isEmpty {
                c.equal("\(label): reasoning starts before its deltas", reasoning.first?["type"] as? String, "reasoning-start")
                c.equal("\(label): reasoning closes after its deltas", reasoning.last?["type"] as? String, "reasoning-end")
            }
            if let end = kinds.firstIndex(of: "reasoning-end"), let text = kinds.firstIndex(of: "text-start") {
                c.expect("\(label): reasoning closes before answer begins", end < text)
            }
            c.expect("\(label): no error or invented tool", !kinds.contains("error") && !kinds.contains("tool-call"))
        }

        for count in 1...7 {
            let text = String(repeating: "x", count: count)
            try check("short \(count) whole", [text], reason: text, answer: "")
            try check("short \(count) per character", text.map(String.init), reason: text, answer: "")
        }
        for (label, text) in [("eight", "abcdefgh"), ("long", "a longer reasoning tail"),
                              ("Unicode short", "猫😀é"), ("combining short", "e\u{301}猫😀")] {
            try check("\(label) whole", [text], reason: text, answer: "")
            try check("\(label) per character", text.map(String.init), reason: text, answer: "")
        }
        try check("initially open then later chunks", ["abcdefgh", "ijk", "lmn"],
            reason: "abcdefghijklmn", answer: "")
        try check("empty output", [], reason: "", answer: "")
        try check("empty chunks", ["", "", ""], reason: "", answer: "")

        let closed: [(String, String, String, String)] = [
            ("closed", "thought</think>\n\nanswer\nkept", "thought", "answer\nkept"),
            ("empty thought", "</think>\nanswer", "", "answer"),
            ("empty answer", "abc</think>", "abc", ""),
            ("Unicode closed", "猫😀e\u{301}</think>\n好", "猫😀e\u{301}", "好"),
        ]
        for (label, text, reason, answer) in closed {
            let scalars = Array(text.unicodeScalars)
            for cut in 0...scalars.count {
                let left = String(String.UnicodeScalarView(scalars[..<cut]))
                let right = String(String.UnicodeScalarView(scalars[cut...]))
                try check("\(label) scalar split \(cut)", [left, right], reason: reason, answer: answer)
            }
        }
        let literal = "abc</think>\nanswer"
        try check("thinking disabled preserves literal markup", ["abc</thi", "nk>\nanswer"],
            reason: "", answer: literal, thinking: false)

        let read = ToolDefinition(name: "read_file", description: "", parameters: .object([
            "type": .string("object"), "properties": .object(["path": .object(["type": .string("string")])]),
        ]))
        let call = "<tool_call><function=read_file><parameter=path>a.txt</parameter></function></tool_call>"
        let toolParts = try assemble(["why</think>\nbefore", call, "after"], tools: [read])
        let toolTypes = types(toolParts)
        c.equal("tool turn preserves reasoning", deltas("reasoning-delta", toolParts), "why")
        c.equal("tool turn preserves surrounding answer", deltas("text-delta", toolParts), "beforeafter")
        c.equal("tool turn still has exactly one call", toolTypes.filter { $0 == "tool-call" }.count, 1)
        if let end = toolTypes.firstIndex(of: "reasoning-end"), let start = toolTypes.firstIndex(of: "tool-input-start") {
            c.expect("reasoning ends before tool input begins", end < start)
        } else { c.expect("reasoning end and tool start both exist", false) }

        var state = GatewayReasoningOutput()
        let opening = state.push(thinking: "visible", content: "")
        c.equal("open state starts once", types(opening), ["reasoning-start", "reasoning-delta"])
        let tail = state.finish(thinking: " tail")
        c.equal("already-open final tail precedes close", types(tail), ["reasoning-delta", "reasoning-end"])
        c.equal("already-open final tail is exact", deltas("reasoning-delta", tail), " tail")
        c.expect("empty second finish does not repeat end", state.finish(thinking: "").isEmpty)
        return c.report()
    }
}
