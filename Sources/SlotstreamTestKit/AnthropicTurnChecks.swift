// T0: partitioning one Anthropic turn into adjacent messages of the same
// role must not change the model input or bypass tool-result validation.

import Foundation
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    static func anthropicLogicalTurns() -> CheckReport {
        var c = CheckBuilder("anthropic-logical-turns")
        typealias Block = [String: Any]
        func message(_ role: String, _ content: Any) -> Block {
            ["role": role, "content": content]
        }
        func parse(_ messages: [Block], counting: Bool = false) throws -> [ChatMessage] {
            try AnthropicDialect.parse([
                "model": "m", "max_tokens": 100, "messages": messages,
            ], counting: counting).messages
        }
        func same(_ lhs: [ChatMessage], _ rhs: [ChatMessage]) -> Bool {
            lhs.count == rhs.count && zip(lhs, rhs).allSatisfy { a, b in
                a.role == b.role && a.content == b.content && a.reasoning == b.reasoning
                    && a.toolCalls == b.toolCalls && a.toolCallId == b.toolCallId
                    && a.toolName == b.toolName && a.images == b.images
            }
        }
        func equivalent(_ name: String, _ messages: [Block], to expected: [ChatMessage], counting: Bool = false) {
            do { c.expect(name, same(try parse(messages, counting: counting), expected)) }
            catch { c.expect(name, false, "\(error)") }
        }
        func rejected(_ name: String, _ messages: [Block], _ fragment: String, counting: Bool = false) {
            do { _ = try parse(messages, counting: counting); c.expect(name, false, "accepted") }
            catch let f as AnthropicDialect.Failure {
                c.expect(name, f.message.contains(fragment) && f.type == "invalid_request_error", f.message)
            } catch { c.expect(name, false, "\(error)") }
        }
        // Every possible placement of message boundaries between these blocks.
        func partitions(_ role: String, _ blocks: [Block]) -> [[Block]] {
            (0..<(1 << (blocks.count - 1))).map { mask in
                var groups: [[Block]] = [[blocks[0]]]
                for i in 1..<blocks.count {
                    if mask & (1 << (i - 1)) != 0 { groups.append([]) }
                    groups[groups.count - 1].append(blocks[i])
                }
                return groups.map { message(role, $0) }
            }
        }
        let image: Block = ["type": "image", "source": [
            "type": "base64", "media_type": "image/png", "data": "iVBORw0KGgo=",
        ]]
        let callA: Block = ["type": "tool_use", "id": "a", "name": "Read", "input": ["file": "a.txt"]]
        let callB: Block = ["type": "tool_use", "id": "b", "name": "Read", "input": ["file": "b.txt"]]
        let resultA: Block = ["type": "tool_result", "tool_use_id": "a", "content": "denied", "is_error": true]
        let resultB: Block = ["type": "tool_result", "tool_use_id": "b", "content": [
            ["type": "text", "text": "B contents"], image,
        ]]
        let text: Block = ["type": "text", "text": "Continue."]
        let start = message("user", "Read both files.")
        let assistant: [Block] = [
            ["type": "thinking", "thinking": "", "signature": AnthropicDialect.signature(for: "Read both.")],
            ["type": "text", "text": "Reading."], callA,
            ["type": "text", "text": "Also B."], callB,
        ]
        let user = [resultB, resultA, text, image]
        let merged = [start, message("assistant", assistant), message("user", user)]
        do {
            let expected = try parse(merged)
            c.equal("merged roles", expected.map(\.role), ["user", "assistant", "tool", "tool", "user"])
            c.equal("results follow call order", expected.filter { $0.role == "tool" }.map(\.toolCallId), ["a", "b"])
            c.equal("error result retained", expected.first { $0.toolCallId == "a" }?.content, "Error: denied")
            c.equal("result image retained", expected.first { $0.toolCallId == "b" }?.images, ["data:image/png;base64,iVBORw0KGgo="])
            c.equal("thinking signature replayed", expected.first { $0.role == "assistant" }?.reasoning, "Read both.")
            for (a, left) in partitions("assistant", assistant).enumerated() {
                for (u, right) in partitions("user", user).enumerated() {
                    let split = [start] + left + right
                    equivalent("partition \(a)/\(u) generates", split, to: expected)
                    equivalent("partition \(a)/\(u) counts", split, to: expected, counting: true)
                }
            }
            equivalent("empty messages inside logical turns", [start,
                message("assistant", [Block]()), message("assistant", [callA]),
                message("assistant", [Block]()), message("assistant", [callB]),
                message("user", [Block]()), message("user", [resultB]),
                message("user", [Block]()), message("user", [resultA]), message("user", [Block]()),
            ], to: try parse([start, message("assistant", [callA, callB]), message("user", [resultB, resultA])]))
            let ordinary: [Block] = [["type": "text", "text": "One"], image, ["type": "text", "text": "Two"]]
            let ordinaryExpected = try parse([message("user", ordinary)])
            c.equal("ordinary user text joins once", ordinaryExpected.map(\.content), ["One\n\nTwo"])
            for (i, split) in partitions("user", ordinary).enumerated() {
                equivalent("ordinary partition \(i)", split, to: ordinaryExpected)
            }
            equivalent("strings and blocks share a user turn", [message("user", "One"),
                message("user", [image]), message("user", "Two")], to: ordinaryExpected)
            let cycles = [start, message("assistant", [callA]), message("user", [resultA]),
                message("user", "Next"), message("assistant", [callB]), message("user", [resultB]),
                message("user", "Done")]
            equivalent("accumulators reset between tool turns", cycles, to: try parse([
                start, message("assistant", [callA]), message("user", [resultA, ["type": "text", "text": "Next"]]),
                message("assistant", [callB]), message("user", [resultB, ["type": "text", "text": "Done"]]),
            ]))
            equivalent("count_tokens accepts a split final assistant", [start, message("assistant", "One"),
                message("assistant", "Two")], to: try parse([start, message("assistant", "OneTwo")], counting: true), counting: true)
            equivalent("late system remains a boundary", [message("user", "One"), message("system", "Context"),
                message("user", "Two")], to: [ChatMessage(role: "user", content: "One"),
                    ChatMessage(role: "user", content: "Context"), ChatMessage(role: "user", content: "Two")])
        } catch { c.expect("merged controls parse", false, "\(error)") }

        let calls = [start, message("assistant", [callA, callB])]
        rejected("missing result at end of split user turn", calls + [message("user", [resultA]),
            message("user", [text])], "messages.3: tool_use ids")
        rejected("missing result before next assistant", calls + [message("user", [resultA]),
            message("assistant", "Done")], "messages.2: tool_use ids")
        rejected("duplicate result across user messages", calls + [message("user", [resultA]),
            message("user", [resultB, resultA])], "messages.3.content.1: tool_result")
        rejected("orphan result in later user message", calls + [message("user", [resultA, resultB]),
            message("user", [["type": "tool_result", "tool_use_id": "unknown", "content": "x"]])],
                 "messages.3.content.0: tool_result")
        rejected("duplicate call across assistant messages", [start, message("assistant", [callA]),
            message("assistant", [callA]), message("user", [resultA])], "messages.2.content.0: tool_use id 'a' is used twice")
        rejected("tool IDs stay unique across completed turns", [start, message("assistant", [callA]),
            message("user", [resultA]), message("assistant", [callA]), message("user", [resultA])], "messages.3.content.0: tool_use id 'a' is used twice")
        rejected("system cannot separate calls from results", calls + [message("system", "Context"),
            message("user", [resultA, resultB])], "messages.2: tool_use ids")
        rejected("system cannot extend a partial result turn", calls + [message("user", [resultA]),
            message("system", [Block]()), message("user", [resultB])], "messages.2: tool_use ids")
        rejected("malformed block keeps its original location", calls + [message("user", [resultA]),
            message("user", [resultB, ["type": "text", "text": 42]])], "messages.3.content.1.text")
        rejected("malformed content keeps its original location", calls + [message("user", [resultA]),
            message("user", 42)], "messages.3.content: must be text")
        rejected("user cannot add a tool call", calls + [message("user", [resultA]),
            message("user", [callB])], "messages.3.content.0: content type 'tool_use'")
        rejected("assistant cannot carry a tool result", [start, message("assistant", [callA]),
            message("assistant", [resultA])], "messages.2.content.0: content type 'tool_result'")
        rejected("generation still rejects a split assistant prefill", [start, message("assistant", "One"),
            message("assistant", "Two")], "continuing a partial assistant reply")
        rejected("dangling split calls remain invalid for token counting", [start, message("assistant", [callA]),
            message("assistant", [callB])], "no tool_result after them", counting: true)
        return c.report()
    }
}
