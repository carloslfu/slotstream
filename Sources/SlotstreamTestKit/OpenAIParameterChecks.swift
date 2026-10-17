import Foundation
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    /// The production OpenAI handler calls this parameter-validation seam
    /// after null normalization and its model/conversation/feature guards.
    static func openAIParameterValidation() throws -> CheckReport {
        var c = CheckBuilder("openai-parameter-validation")

        func wire(_ input: [String: Any]) throws -> [String: Any] {
            let data = try JSONSerialization.data(withJSONObject: input)
            guard let result = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                throw ServerError("fixture JSON is not an object")
            }
            return result
        }
        func error(_ input: [String: Any]) throws -> String? {
            // The handler's existing withoutNulls is internal to Slotstream.
            // Prepare its documented top-level normalized input at this seam.
            let normalized = try wire(input).filter { !($0.value is NSNull) }
            return Server.openAIParameterError(normalized)
        }

        let malformed: [(String, Any)] = [
            ("numeric text", "0.8"), ("true", true), ("false", false),
            ("array", [0.8]), ("object", ["value": 0.8]),
            ("finite Double outside Float", 1e300),
        ]
        for (label, value) in malformed {
            let failure = try error(["min_p": value])
            c.expect("min_p rejects \(label)", failure?.contains("min_p") == true)
        }
        // These cannot be encoded as JSON. The shared production helper must
        // still apply the same finite-number contract to supplied values.
        for (label, value) in [("NaN", Double.nan), ("positive infinity", Double.infinity),
                               ("negative infinity", -Double.infinity)] {
            c.expect("min_p rejects direct \(label)",
                Server.openAIParameterError(["min_p": value])?.contains("min_p") == true)
        }

        let legal: [(String, Any)] = [
            ("zero Int", 0), ("one Int", 1), ("fraction", 0.25),
            ("negative finite value is left for clamping", -0.5),
            ("above-one finite value is left for clamping", 1.5),
        ]
        for (label, value) in legal {
            c.expect("min_p accepts \(label)", try error(["min_p": value]) == nil)
        }
        c.expect("omitted min_p stays unset", try error([:]) == nil)
        c.expect("top-level null min_p stays unset after handler normalization",
            try error(["min_p": NSNull()]) == nil)

        // The seam extraction must preserve the rest of the old tail, not
        // replace it with a special test-only min_p validator.
        for key in ["temperature", "top_p", "presence_penalty"] {
            for (label, value) in malformed {
                c.expect("\(key) keeps rejecting \(label)",
                    try error([key: value])?.contains(key) == true)
            }
            for (label, value) in legal {
                c.expect("\(key) keeps accepting \(label)", try error([key: value]) == nil)
            }
        }
        for key in ["top_k", "max_tokens", "max_completion_tokens", "seed"] {
            for (label, value) in [("true", true as Any), ("fraction", 1.5 as Any),
                                   ("text", "1" as Any)] {
                c.expect("\(key) keeps rejecting \(label)",
                    try error([key: value]) == "\(key) must be an integer")
            }
            c.expect("\(key) accepts positive integer", try error([key: 2]) == nil)
        }
        for key in ["max_tokens", "max_completion_tokens"] {
            for value in [0, -1] {
                c.equal("\(key) keeps positive-budget requirement \(value)",
                    try error([key: value]), "\(key) must be greater than zero")
            }
        }
        c.expect("negative top_k keeps prior accepted domain", try error(["top_k": -1]) == nil)
        c.expect("negative seed keeps prior accepted domain", try error(["seed": -1]) == nil)

        for (label, input) in [
            ("text stop", ["stop": "END"] as [String: Any]),
            ("array stop", ["stop": ["END", "DONE"]]),
            ("empty stop array", ["stop": [] as [String]]),
            ("stream true", ["stream": true]), ("stream false", ["stream": false]),
            ("empty stream options", ["stream_options": [:] as [String: Any]]),
            ("include usage true", ["stream_options": ["include_usage": true]]),
            ("include usage false", ["stream_options": ["include_usage": false]]),
        ] {
            c.expect("unchanged tail accepts \(label)", try error(input) == nil)
        }
        let refusals: [(String, [String: Any], String)] = [
            ("numeric stop", ["stop": 1], "stop must be text or an array of text"),
            ("mixed stop array", ["stop": ["END", 1]], "stop must be text or an array of text"),
            ("numeric stream", ["stream": 1], "stream must be true or false"),
            ("text stream", ["stream": "true"], "stream must be true or false"),
            ("array stream options", ["stream_options": [] as [Any]], "stream_options must be an object"),
            ("text stream options", ["stream_options": "x"], "stream_options must be an object"),
            ("unknown stream option", ["stream_options": ["zzz": true, "aaa": true]],
                "unsupported stream_options field(s): aaa, zzz"),
            ("numeric include_usage", ["stream_options": ["include_usage": 1]],
                "stream_options.include_usage must be true or false"),
        ]
        for (label, input, expected) in refusals {
            c.equal("unchanged tail rejects \(label)", try error(input), expected)
        }
        return c.report()
    }
}
