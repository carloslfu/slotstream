// T0: attribution stripping must retain the actual system instructions.
import Foundation
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    static func anthropicAttribution() throws -> CheckReport {
        var c = CheckBuilder("anthropic-attribution")
        let header = "x-anthropic-billing-header: fixture;"
        let prompt = "Answer only with PINE.\r\nKeep this second line."
        let user: [String: Any] = ["role": "user", "content": "Ping"]
        func parse(_ system: String, shape: String = "string", counting: Bool = false) throws -> AnthropicDialect.Request {
            var body: [String: Any] = ["model": "m", "messages": [user]]
            if !counting { body["max_tokens"] = 1 }
            switch shape {
            case "blocks":
                body["system"] = [["type": "text", "text": system]]
            case "message":
                body["messages"] = [["role": "system", "content": system], user]
            default:
                body["system"] = system
            }
            // JSON escapes must arrive at the same parser boundary as HTTP input.
            let data = try JSONSerialization.data(withJSONObject: body)
            let decoded = try JSONSerialization.jsonObject(with: data) as! [String: Any]
            return try AnthropicDialect.parse(decoded, counting: counting)
        }

        for newline in ["\n", "\r\n"] {
            let label = newline == "\n" ? "LF" : "CRLF"
            for shape in ["string", "blocks", "message"] {
                for counting in [false, true] {
                    let name = "\(label) \(shape) counting=\(counting)"
                    let request = try parse(header + newline + prompt, shape: shape, counting: counting)
                    c.equal("\(name) keeps system and user roles", request.messages.map(\.role), ["system", "user"])
                    c.equal("\(name) removes only the attribution line", request.messages.first?.content, prompt)
                    c.equal("\(name) keeps the user text", request.messages.last?.content, "Ping")
                }
            }
            let trimmed = try parse(header + newline + newline + "Keep this." + newline)
            c.equal("\(label) retains the existing suffix newline trimming", trimmed.messages.first?.content, "Keep this.")
            let bare = try parse(header + newline)
            c.equal("\(label) attribution-only leaves no system turn", bare.messages.map(\.role), ["user"])
        }

        let bare = try parse(header)
        c.equal("attribution without a separator leaves no system turn", bare.messages.map(\.role), ["user"])
        for text in ["\nKeep blank lines.\r\n", "Ordinary\r\nsystem\ntext.",
                     "Keep this.\r\n" + header + "\nKeep that."] {
            c.equal("unprefixed system text stays unchanged: \(text.debugDescription)",
                    try parse(text).messages.first?.content, text)
        }
        let mixed = try parse(header + "\r\nFirst instruction.\nSecond instruction.")
        c.equal("CRLF is removed before a later LF can hide the first instruction",
                mixed.messages.first?.content, "First instruction.\nSecond instruction.")
        return c.report()
    }
}
