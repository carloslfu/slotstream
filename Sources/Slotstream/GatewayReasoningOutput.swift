import Foundation

/// Gateway reasoning frames assembled on values before Server writes them.
/// The server supplies the shared ThinkSplitter's thinking and content spans.
package struct GatewayReasoningOutput {
    private var open = false

    package init() {}

    package mutating func push(thinking think: String, content: String) -> [[String: Any]] {
        var parts: [[String: Any]] = []
        if !think.isEmpty {
            if !open {
                parts.append(["type": "reasoning-start", "id": "r0"])
                open = true
            }
            parts.append([
                "type": "reasoning-delta", "id": "r0", "delta": think,
            ])
        }
        if open, !content.isEmpty {
            parts.append(["type": "reasoning-end", "id": "r0"])
            open = false
        }
        return parts
    }

    package mutating func finish(thinking think: String) -> [[String: Any]] {
        var parts: [[String: Any]] = []
        if !think.isEmpty {
            if !open {
                parts.append(["type": "reasoning-start", "id": "r0"])
                open = true
            }
            parts.append([
                "type": "reasoning-delta", "id": "r0", "delta": think,
            ])
        }
        if open {
            parts.append(["type": "reasoning-end", "id": "r0"])
            open = false
        }
        return parts
    }
}
