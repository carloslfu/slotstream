// Native tool-call parsing, in the model's own grammar.
//
// Qwen3.8-Flash-Next does not emit JSON tool calls. Its chat template teaches
// it an XML-ish form, and that is what the weights actually produce:
//
//     <tool_call>
//     <function=read_file>
//     <parameter=path>
//     hello.txt
//     </parameter>
//     </function>
//     </tool_call>
//
// Prose may precede the first call and follow the last one; several calls may
// appear in one turn. Nothing else is in the grammar.
//
// Why a splitter rather than a regex over the finished text. The API streams,
// so the parser is fed token deltas and must never emit half of a tag as text:
// a client that sees "<tool" in its transcript has already been given a wrong
// answer, and no later correction removes it. `ThinkSplitter` solves the same
// problem for `</think>` by withholding the tail of its buffer; this holds back
// the longest suffix that could still become an opening tag, which is a shorter
// hold than a fixed one and lets ordinary prose stream immediately.
//
// Why coercion needs the schema. The grammar is untyped: every parameter
// arrives as raw text between two tags. The client asked for typed JSON, so
// `{"start_line": 1}` and `{"start_line": "1"}` are different answers and only
// one of them satisfies the tool. Six of fx's sixteen schemas use `enum`,
// `anyOf`, or nested objects, so a string-only passthrough is not an option.
// The declared type decides; anything that fails to parse falls back to the
// raw string rather than dropping the parameter, because a tool reporting a
// bad argument is a better failure than a call that silently lost one.

import Foundation

/// A JSON value, restricted to what a tool argument can be. Deliberately a
/// concrete enum and not `Any`: the parser's output is compared in gates, and
/// `Any` is neither `Equatable` nor `Sendable`.
public enum JSONValue: Sendable, Equatable {
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case array([JSONValue])
    case object([String: JSONValue])
    case null

    /// The Foundation value, for `JSONSerialization` and for the chat template.
    ///
    /// A JSON null crosses as an EMPTY OPTIONAL, never as `NSNull`. This is not
    /// a style choice: swift-jinja's `Value(any:)` maps Swift `nil` to Jinja
    /// null and *throws* on `NSNull` — "Cannot convert value of type NSNull to
    /// Jinja Value" — so an `NSNull` anywhere in a tool schema, a replayed tool
    /// call's arguments, or a tool result fails the whole turn with a 400. fx
    /// sends `"default": null` inside tool schemas and nulls for unset optional
    /// arguments, so this is the common case, not an exotic one. A boxed empty
    /// Optional reaches the bridge's Mirror path and degrades to null, which
    /// renders as `null` and keeps array positions intact.
    public var any: Any {
        switch self {
        case .string(let s): return s
        case .int(let i): return i
        case .double(let d): return d
        case .bool(let b): return b
        case .array(let a): return a.map { $0.any }
        case .object(let o): return o.mapValues { $0.any }
        case .null: return Self.templateNull
        }
    }

    /// An empty `Optional` boxed as `Any`. See `any`.
    public static let templateNull: Any = Optional<String>.none as Any

    /// Is there an `NSNull` anywhere in this value's bridged form? The gate for
    /// the rule above; nothing in production should ever answer true.
    public var bridgesAnyNSNull: Bool {
        switch self {
        case .null: return Self.templateNull is NSNull
        case .array(let a): return a.contains { $0.bridgesAnyNSNull }
        case .object(let o): return o.values.contains { $0.bridgesAnyNSNull }
        default: return false
        }
    }

    /// Compact JSON for one value, used to build the streamed input deltas.
    /// Key order inside an object is sorted so a delta stream is reproducible
    /// across processes; Swift dictionaries have no stable order of their own.
    public var jsonText: String {
        switch self {
        case .string(let s): return Self.quote(s)
        case .int(let i): return String(i)
        case .double(let d):
            // A whole double must not print as "1.0" where the schema said
            // number and the tool expects 1; JSON has one numeric type.
            if d == d.rounded(), abs(d) < 1e15 { return String(Int(d)) }
            return String(d)
        case .bool(let b): return b ? "true" : "false"
        case .array(let a): return "[" + a.map { $0.jsonText }.joined(separator: ",") + "]"
        case .object(let o):
            let body = o.keys.sorted().map { Self.quote($0) + ":" + o[$0]!.jsonText }
            return "{" + body.joined(separator: ",") + "}"
        case .null: return "null"
        }
    }

    public static func quote(_ s: String) -> String {
        var out = "\""
        for ch in s.unicodeScalars {
            switch ch {
            case "\"": out += "\\\""
            case "\\": out += "\\\\"
            case "\n": out += "\\n"
            case "\r": out += "\\r"
            case "\t": out += "\\t"
            default:
                if ch.value < 0x20 {
                    out += String(format: "\\u%04x", ch.value)
                } else {
                    out.unicodeScalars.append(ch)
                }
            }
        }
        return out + "\""
    }

    /// Parse text as JSON, or return nil. `fragmentsAllowed` so a bare number
    /// or string parses too.
    static func parse(_ text: String) -> JSONValue? {
        guard let data = text.data(using: .utf8),
            let obj = try? JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed])
        else { return nil }
        return from(obj)
    }

    static func from(_ obj: Any) -> JSONValue {
        switch obj {
        case let n as NSNumber:
            // NSNumber erases Bool into 0/1; the objCType tells them apart.
            if CFGetTypeID(n) == CFBooleanGetTypeID() { return .bool(n.boolValue) }
            if let i = Int(exactly: n) { return .int(i) }
            return .double(n.doubleValue)
        case let s as String: return .string(s)
        case let a as [Any]: return .array(a.map { from($0) })
        case let o as [String: Any]: return .object(o.mapValues { from($0) })
        default: return .null
        }
    }
}

/// The declared type of one tool parameter. `unknown` covers unresolved unions
/// and a parameter the schema does not mention at all.
public enum ToolParamKind: String, Sendable, Equatable {
    case string, integer, number, boolean, array, object, unknown
}

/// One tool as the parser needs it: a name and its parameters' declared types.
public struct ToolSchema: Sendable, Equatable {
    public let name: String
    public let params: [String: ToolParamKind]

    public init(name: String, params: [String: ToolParamKind]) {
        self.name = name
        self.params = params
    }
}

/// One parsed call.
public struct ParsedToolCall: Sendable, Equatable {
    public let id: String
    public let name: String
    public let arguments: [String: JSONValue]
    /// Parameter names in the order the model emitted them.
    ///
    /// Not decoration: the input is streamed as `tool-input-delta` fragments as
    /// each parameter closes, and the client concatenates them. If the final
    /// `input` were key-sorted instead, the accumulated deltas and the final
    /// object would disagree whenever the model emitted out of alphabetical
    /// order, which is most calls with more than one parameter. Emission order
    /// is also stable run to run, where Swift's dictionary order is not.
    public let order: [String]

    public init(id: String, name: String, arguments: [String: JSONValue], order: [String] = []) {
        self.id = id
        self.name = name
        self.arguments = arguments
        self.order = order.isEmpty ? arguments.keys.sorted() : order
    }

    /// The compact JSON object the wire carries as `input`.
    public var inputJSON: String {
        let body = order.compactMap { k in
            arguments[k].map { JSONValue.quote(k) + ":" + $0.jsonText }
        }
        return "{" + body.joined(separator: ",") + "}"
    }
}

/// What the parser emits, in order.
public enum ToolStreamEvent: Sendable, Equatable {
    case text(String)
    case toolInputStart(id: String, name: String)
    case toolInputDelta(id: String, delta: String)
    case toolInputEnd(id: String)
    case toolCall(ParsedToolCall)
    /// A `<tool_call>` block that never closed before the sequence ended. The
    /// text is returned verbatim so nothing the model produced is lost, and the
    /// turn finishes as ordinary text.
    case malformed(String)
}

/// Splits a generated stream into text and tool calls.
///
/// Feed it the deltas that survive `ThinkSplitter` (reasoning is never scanned
/// for calls) and it returns the events for each. `flush()` closes the stream.
public final class ToolCallSplitter {
    private enum State {
        case text
        case call  // inside <tool_call>, before <function=…>
        case params  // inside <function=…>, between parameters
        case value(String)  // inside <parameter=NAME>
        case closing  // after </function>, before </tool_call>
    }

    private static let openTag = "<tool_call>"
    private static let closeTag = "</tool_call>"
    private static let funcOpen = "<function="
    private static let funcClose = "</function>"
    private static let paramOpen = "<parameter="
    private static let paramClose = "</parameter>"

    /// Every tag the parser can be waiting for. The hold-back must protect the
    /// longest of them, or a tag split across two deltas leaks as text.
    private static let allTags = [openTag, closeTag, funcOpen, funcClose, paramOpen, paramClose]

    private let schemas: [String: ToolSchema]
    private let nextID: @Sendable () -> String

    private var buf = ""
    private var state: State = .text
    private var currentID = ""
    private var currentName = ""
    private var currentArgs: [String: JSONValue] = [:]
    private var currentOrder: [String] = []
    private var emittedAnyArg = false
    private var valueRaw = ""
    private var streamsString = false
    private var valueAtStart = true
    /// Everything consumed since `<tool_call>`, so a block that never closes
    /// can be returned verbatim rather than vanishing.
    private var rawCall = ""

    public init(tools: [ToolSchema], idFactory: (@Sendable () -> String)? = nil) {
        var byName: [String: ToolSchema] = [:]
        for t in tools { byName[t.name] = t }
        self.schemas = byName
        self.nextID = idFactory ?? { ToolCallSplitter.randomID() }
    }

    /// `call_` plus eight hex characters. Unique per call within a process;
    /// the client only needs to match a result back to its call.
    public static func randomID() -> String {
        let n = UInt32.random(in: 0...UInt32.max)
        return "call_" + String(format: "%08x", n)
    }

    public func push(_ s: String) -> [ToolStreamEvent] {
        buf += s
        var out: [ToolStreamEvent] = []
        loop: while true {
            switch state {
            case .text:
                if let r = buf.range(of: Self.openTag) {
                    let before = String(buf[..<r.lowerBound])
                    if !before.isEmpty { out.append(.text(before)) }
                    rawCall = Self.openTag
                    buf = String(buf[r.upperBound...])
                    state = .call
                    continue loop
                }
                // No opening tag yet: emit everything that cannot become one.
                let keep = Self.holdback(buf, Self.openTag)
                let emit = String(buf.dropLast(keep))
                if !emit.isEmpty { out.append(.text(emit)) }
                buf = String(buf.suffix(keep))
                break loop

            case .call:
                // Between <tool_call> and <function=NAME>. Only whitespace is
                // expected here, and an empty call closes straight away.
                //
                // Both tags must be located before either is acted on. Taking
                // whichever one happened to be in the buffer swallowed a whole
                // call when the complete text arrived in one push: `</tool_call>`
                // was already present, so the empty-call path consumed the
                // function and its parameters as if nothing had been called.
                let fOpen = buf.range(of: Self.funcOpen)
                let cTag = buf.range(of: Self.closeTag)
                if let ct = cTag, fOpen == nil || ct.lowerBound < fOpen!.lowerBound {
                    rawCall += String(buf[..<ct.upperBound])
                    buf = String(buf[ct.upperBound...])
                    resetCall()
                    state = .text
                    continue loop
                }
                guard let r = fOpen else { break loop }
                let after = buf[r.upperBound...]
                guard let gt = after.firstIndex(of: ">") else { break loop }
                currentName = String(after[..<gt])
                currentID = nextID()
                currentArgs = [:]
                currentOrder = []
                emittedAnyArg = false
                rawCall += String(buf[..<buf.index(after: gt)])
                buf = String(buf[buf.index(after: gt)...])
                out.append(.toolInputStart(id: currentID, name: currentName))
                state = .params
                continue loop

            case .params:
                let pOpen = buf.range(of: Self.paramOpen)
                let fClose = buf.range(of: Self.funcClose)
                let cTag = buf.range(of: Self.closeTag)
                // Whichever terminator comes first decides.
                let first = [pOpen, fClose, cTag].compactMap { $0 }
                    .min { $0.lowerBound < $1.lowerBound }
                guard let hit = first else { break loop }
                if hit == pOpen {
                    let after = buf[hit.upperBound...]
                    guard let gt = after.firstIndex(of: ">") else { break loop }
                    let name = String(after[..<gt])
                    guard currentArgs[name] == nil else {
                        out.append(.malformed(rawCall + buf))
                        buf = ""
                        resetCall()
                        state = .text
                        return out
                    }
                    rawCall += String(buf[..<buf.index(after: gt)])
                    buf = String(buf[buf.index(after: gt)...])
                    valueRaw = ""
                    valueAtStart = true
                    streamsString = schemas[currentName]?.params[name] == .string
                    if streamsString {
                        out.append(.toolInputDelta(id: currentID,
                            delta: (emittedAnyArg ? "," : "{") + JSONValue.quote(name) + ":\""))
                    }
                    state = .value(name)
                    continue loop
                }
                // </function> ends the parameters but not the block: the
                // call is emitted only once </tool_call> is consumed, so a
                // truncated block is reported malformed instead of being
                // dispatched. A bare </tool_call> here completes it directly.
                rawCall += String(buf[..<hit.upperBound])
                buf = String(buf[hit.upperBound...])
                if hit == cTag {
                    out.append(contentsOf: finishCall())
                    state = .text
                } else {
                    state = .closing
                }
                continue loop

            case .value(let param):
                guard let r = buf.range(of: Self.paramClose) else {
                    // Search only a bounded tail on the next push. Keeping a
                    // closing tag's length also withholds its framing newline.
                    // The old code rescanned the entire growing argument on
                    // every token and never streamed a long file's contents.
                    let keep = min(buf.count, Self.paramClose.count)
                    consumeValue(String(buf.dropLast(keep)), final: false, into: &out)
                    buf = String(buf.suffix(keep))
                    break loop
                }
                consumeValue(String(buf[..<r.lowerBound]), final: true, into: &out)
                rawCall += Self.paramClose
                buf = String(buf[r.upperBound...])
                let kind = schemas[currentName]?.params[param] ?? .unknown
                let value = Self.coerce(valueRaw, as: kind)
                if currentArgs[param] == nil { currentOrder.append(param) }
                currentArgs[param] = value
                out.append(.toolInputDelta(id: currentID, delta: streamsString ? "\""
                    : (emittedAnyArg ? "," : "{") + JSONValue.quote(param) + ":" + value.jsonText))
                emittedAnyArg = true
                state = .params
                continue loop

            case .closing:
                guard let r = buf.range(of: Self.closeTag) else { break loop }
                rawCall += String(buf[..<r.upperBound])
                buf = String(buf[r.upperBound...])
                out.append(contentsOf: finishCall())
                state = .text
                continue loop
            }
        }
        return out
    }

    /// Close the stream. Anything still buffered is text; an unterminated call
    /// is returned verbatim as `malformed` and the turn ends as text.
    public func flush() -> [ToolStreamEvent] {
        var out: [ToolStreamEvent] = []
        switch state {
        case .text:
            if !buf.isEmpty { out.append(.text(buf)) }
        case .value:
            // A length-limited reply still owns the stable argument text it
            // generated. Do not lose the decoder's final holdback on flush.
            let keep = Self.holdback(buf, Self.paramClose)
            let tail = String(buf.suffix(keep))
            consumeValue(String(buf.dropLast(keep)), final: false, into: &out)
            out.append(.malformed(rawCall + tail))
        case .call, .params, .closing:
            out.append(.malformed(rawCall + buf))
        }
        buf = ""
        rawCall = ""
        state = .text
        return out
    }

    private func finishCall() -> [ToolStreamEvent] {
        var out: [ToolStreamEvent] = []
        // A call with no parameters still needs a syntactically whole input.
        out.append(.toolInputDelta(id: currentID, delta: emittedAnyArg ? "}" : "{}"))
        out.append(.toolInputEnd(id: currentID))
        out.append(
            .toolCall(
                ParsedToolCall(
                    id: currentID, name: currentName, arguments: currentArgs,
                    order: currentOrder)))
        resetCall()
        return out
    }

    private func resetCall() {
        currentID = ""
        currentName = ""
        currentArgs = [:]
        currentOrder = []
        emittedAnyArg = false
        rawCall = ""
        valueRaw = ""
    }

    private func consumeValue(_ raw: String, final: Bool, into out: inout [ToolStreamEvent]) {
        valueRaw += raw
        rawCall += raw
        guard streamsString else { return }
        var value = raw
        if valueAtStart, !value.isEmpty {
            if value.hasPrefix("\n") { value.removeFirst() }
            valueAtStart = false
        }
        if final, value.hasSuffix("\n") { value.removeLast() }
        if !value.isEmpty {
            // Escape each stable span, without adding another pair of quotes.
            out.append(.toolInputDelta(id: currentID,
                delta: String(JSONValue.quote(value).dropFirst().dropLast())))
        }
    }

    /// How many trailing characters of `s` must be withheld because they could
    /// still grow into `tag`. Zero for ordinary prose, so text streams at once.
    public static func holdback(_ s: String, _ tag: String) -> Int {
        let tail = s.suffix(tag.count - 1)
        let maxLen = tail.count
        if maxLen <= 0 { return 0 }
        for len in stride(from: maxLen, through: 1, by: -1) {
            if tag.hasPrefix(tail.suffix(len)) { return len }
        }
        return 0
    }

    /// The declared type decides how a raw span becomes JSON.
    ///
    /// The template writes a newline after `<parameter=NAME>` and before
    /// `</parameter>`; both are framing, not content, and exactly one of each
    /// is removed. A value that itself ends in a blank line therefore survives.
    public static func coerce(_ raw: String, as kind: ToolParamKind) -> JSONValue {
        var v = raw
        if v.hasPrefix("\n") { v.removeFirst() }
        if v.hasSuffix("\n") { v.removeLast() }
        let trimmed = v.trimmingCharacters(in: .whitespacesAndNewlines)
        switch kind {
        case .string:
            return .string(v)
        case .integer:
            // `Int(d)` traps outside Int's range, and a model can write 1e20
            // or inf; those stay numbers, or text, rather than end the process.
            if let i = Int(trimmed) { return .int(i) }
            if let d = Double(trimmed), d.isFinite { return Int(exactly: d).map(JSONValue.int) ?? .double(d) }
            return .string(v)
        case .number:
            if let i = Int(trimmed) { return .int(i) }
            // JSON has no infinity or NaN.
            if let d = Double(trimmed), d.isFinite { return .double(d) }
            return .string(v)
        case .boolean:
            if trimmed == "true" { return .bool(true) }
            if trimmed == "false" { return .bool(false) }
            return .string(v)
        case .array, .object:
            if let parsed = JSONValue.parse(trimmed) { return parsed }
            return .string(v)
        case .unknown:
            // `anyOf` and undeclared names: take JSON when it is unambiguous,
            // and a bare word stays a string rather than becoming a number.
            if trimmed.hasPrefix("{") || trimmed.hasPrefix("[") {
                if let parsed = JSONValue.parse(trimmed) { return parsed }
            }
            if trimmed == "true" { return .bool(true) }
            if trimmed == "false" { return .bool(false) }
            if let i = Int(trimmed) { return .int(i) }
            return .string(v)
        }
    }

    /// The whole-text parse, for non-streamed replies and for the gate that
    /// asserts a split stream and a single push agree.
    public static func parseAll(
        _ text: String, tools: [ToolSchema], idFactory: (@Sendable () -> String)? = nil
    ) -> [ToolStreamEvent] {
        let s = ToolCallSplitter(tools: tools, idFactory: idFactory)
        return s.push(text) + s.flush()
    }
}

/// A tool as the client declared it: the raw JSON Schema the template renders,
/// plus the reduced type table the parser coerces with.
///
/// One type holds both because they must not drift. The schema the model is
/// shown and the schema its answer is typed against are the same document; a
/// second, hand-maintained copy of the parameter types would be a silent way
/// for a call to be parsed against a tool the model never saw.
public struct ToolDefinition: Sendable {
    public let name: String
    public let description: String
    /// The JSON Schema object for the parameters, verbatim from the request.
    public let parameters: JSONValue

    public init(name: String, description: String, parameters: JSONValue) {
        self.name = name
        self.description = description
        self.parameters = parameters
    }

    /// The parameter types, including a single non-null type expressed through
    /// `type: ["string", "null"]` or `anyOf`. Genuine unions and unrecognized
    /// declarations stay `.unknown`. A nullable string must retain its bytes
    /// and stream just like the equivalent scalar string declaration.
    public var schema: ToolSchema {
        var params: [String: ToolParamKind] = [:]
        if case .object(let root) = parameters, case .object(let props)? = root["properties"] {
            for (key, value) in props {
                guard case .object(let field) = value else {
                    params[key] = .unknown
                    continue
                }
                if let type = field["type"] {
                    params[key] = Self.typeKind(type) ?? .unknown
                } else if let resolved = Self.anyOfKind(field["anyOf"]) {
                    // `anyOf: [{"type":"string"},{"type":"null"}]` is how fx
                    // declares an optional string, and it is the shape of three
                    // of the five required fields on its `terminal` tool. Left
                    // as `.unknown` the coercion would read a numeric-looking
                    // command or working directory as a number and fx would
                    // reject the call, so a union of one real type plus null is
                    // resolved to that type.
                    params[key] = resolved
                } else {
                    params[key] = .unknown
                }
            }
        }
        return ToolSchema(name: name, params: params)
    }

    private static func typeKind(_ raw: JSONValue) -> ToolParamKind? {
        if case .string(let type) = raw { return ToolParamKind(rawValue: type) }
        guard case .array(let options) = raw else { return nil }
        var types: [String] = []
        for option in options {
            guard case .string(let type) = option else { return nil }
            types.append(type)
        }
        return singleNonNullKind(types)
    }

    private static func singleNonNullKind(_ types: [String]) -> ToolParamKind? {
        let concrete = types.filter { $0 != "null" }
        guard concrete.count == 1 else { return nil }
        return ToolParamKind(rawValue: concrete[0])
    }

    /// The single non-null type in an `anyOf`, when there is exactly one.
    /// A genuine union of two real types stays `.unknown`, where the
    /// conservative coercion is the right answer.
    static func anyOfKind(_ raw: JSONValue?) -> ToolParamKind? {
        guard case .array(let options)? = raw else { return nil }
        var types: [String] = []
        for option in options {
            guard case .object(let o) = option, case .string(let t)? = o["type"] else {
                return nil
            }
            types.append(t)
        }
        return singleNonNullKind(types)
    }

    /// The value the chat template expects in its `tools` list.
    public var templateValue: [String: any Sendable] {
        [
            "type": "function",
            "function": [
                "name": name,
                "description": description,
                "parameters": parameters.any,
            ] as [String: any Sendable],
        ]
    }
}
