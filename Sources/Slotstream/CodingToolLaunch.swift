// `slotstream launch`: start a coding agent already connected to this server.
//
// Everything a person would otherwise copy from a guide (the provider entry,
// the served context window, the model catalog Codex needs, the environment
// Claude Code reads) is built here from what the running server reports. A
// plan is a value: the CLI asks the server, reads the few files involved and
// passes them in, and the T0 gates build plans for every tool without a
// server, a tool or a file system.
//
// Rules every plan follows:
//
//   * The user's own configuration is left alone. Codex and Claude Code get
//     command-line settings and environment variables for this run only;
//     opencode gets its inline configuration variable; Hermes gets its own
//     home folder, the one docs/HERMES.md already uses. Pi reads custom
//     providers only from its models file, so one `slotstream` entry is set
//     there and every other entry is kept as written.
//   * Connection settings always point here. Preferences stay the user's: a
//     variable they exported, a model they name on the command line, or a
//     Claude Code setting in their own files wins over a launch default.
//   * No prompt leaves the Mac by a side route. Each plan closes the ways its
//     tool would otherwise reach a hosted model: Claude Code's provider
//     switches and keys, Hermes's side tasks, opencode's other providers and
//     agents, and Codex Cloud.
//   * Thinking starts off, as in every guide. It is the mode the model's tool
//     calls were measured in, and it is much faster. Each tool's own control
//     turns it on.
//   * One command works on a Mac with nothing running. When no server
//     answers, launch starts one in the background (BackgroundServer) that
//     outlives the tool, since its prompt cache is what makes the next
//     session fast, and stops once no launched tool has used it for a while.
//     A server someone started is used as it is and never restarted.

import Foundation

package enum CodingToolLaunch {

    package struct Failure: Error, Equatable, CustomStringConvertible {
        package let message: String
        package init(_ message: String) { self.message = message }
        package var description: String { message }
    }

    package enum Tool: String, CaseIterable {
        case claude, codex, pi, opencode, hermes

        package init?(name: String) {
            switch name.lowercased() {
            case "claude", "claude-code": self = .claude
            case "codex": self = .codex
            case "pi": self = .pi
            case "opencode": self = .opencode
            case "hermes", "hermes-agent": self = .hermes
            default: return nil
            }
        }

        /// The command that starts the tool.
        package var executable: String { rawValue }

        package var displayName: String {
            switch self {
            case .claude: return "Claude Code"
            case .codex: return "Codex"
            case .pi: return "Pi"
            case .opencode: return "opencode"
            case .hermes: return "Hermes"
            }
        }

        /// Where to get the tool when it is not installed.
        package var installHint: String {
            switch self {
            case .claude: return "Install Claude Code from https://code.claude.com/docs/en/setup"
            case .codex: return "Install Codex with `npm install -g @openai/codex`"
            case .pi: return "Install Pi with `npm install -g @earendil-works/pi-coding-agent`"
            case .opencode: return "Install opencode with `npm install -g opencode-ai`"
            case .hermes: return "Install Hermes from https://github.com/NousResearch/hermes-agent#quick-install"
            }
        }

        /// The guide that explains this connection, named in messages.
        package var guide: String {
            switch self {
            case .claude: return "docs/CLAUDE-CODE.md"
            case .codex: return "docs/CODEX.md"
            case .pi, .opencode: return "docs/CODING-AGENTS.md"
            case .hermes: return "docs/HERMES.md"
            }
        }

        /// The smallest window the tool can work in: its opening prompt plus
        /// a full reply, with room left for a conversation. Claude Code's
        /// instructions and tools take about 15,500 tokens and Codex's about
        /// 10,400, so with an 8,192-token reply neither fits in 16,384.
        /// Hermes refuses a model whose window is below 64,000 tokens
        /// (`MINIMUM_CONTEXT_LENGTH` in Hermes 0.21.1), so it needs the
        /// 65,536-token window its guide sets.
        /// db/records/design/measured-operating-policies.md
        package var minimumContext: Int {
            switch self {
            case .hermes: return 65_536
            case .claude, .codex: return 32_768
            case .pi, .opencode: return 16_384
            }
        }
    }

    /// What the running server reports about itself.
    package struct Server: Equatable {
        package var port: Int
        package var model: String
        package var contextWindow: Int
        package var maxOutputTokens: Int

        package init(port: Int, model: String, contextWindow: Int, maxOutputTokens: Int) {
            self.port = port
            self.model = model
            self.contextWindow = contextWindow
            self.maxOutputTokens = maxOutputTokens
        }

        package var origin: String { "http://127.0.0.1:\(port)" }
        package var openAIBase: String { origin + "/v1" }

        /// The name comes from whatever answers on the port and is written
        /// into JSON, TOML and YAML; opencode also expands `{env:…}` and
        /// `{file:…}` in its configuration. A name outside these characters
        /// is not one Slotstream serves, so it is refused.
        package static func isValidModelName(_ name: String) -> Bool {
            (1 ... 128).contains(name.utf8.count) && name.unicodeScalars.allSatisfy(modelNameCharacters.contains)
        }

        static let modelNameCharacters = CharacterSet(
            charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789._:/-")

        /// Read `GET /v1/models`. Nil when the answer is not Slotstream's,
        /// which is how an Ollama server on the same port is told apart.
        package static func from(models json: [String: Any], port: Int) -> Server? {
            guard let entry = (json["data"] as? [[String: Any]])?.first,
                  entry["owned_by"] as? String == "slotstream",
                  let model = entry["id"] as? String, isValidModelName(model),
                  let window = entry["context_window"] as? Int, window > 0
            else { return nil }
            let output = entry["max_output_tokens"] as? Int ?? GatewayDialect.outputBudget(contextCap: window)
            return Server(port: port, model: model, contextWindow: window, maxOutputTokens: max(1, min(output, window - 1)))
        }
    }

    package struct FileWrite: Equatable {
        package var path: String
        package var contents: String
        /// What to tell the user once the file is written.
        package var note: String?
        /// What a dry run shows instead of the whole file, when the file also
        /// holds the user's own entries.
        package var preview: String?
        package init(path: String, contents: String, note: String? = nil, preview: String? = nil) {
            self.path = path
            self.contents = contents
            self.note = note
            self.preview = preview
        }
    }

    package struct Plan {
        package var tool: Tool
        /// Arguments after the executable.
        package var arguments: [String]
        /// Variables set for the tool.
        package var environment: [String: String]
        /// Variables removed for the tool.
        package var removedEnvironment: [String]
        package var files: [FileWrite]
        package var notes: [String]
    }

    /// Everything a plan depends on besides the tool.
    package struct Inputs {
        package var server: Server
        /// What the user typed after the tool name.
        package var arguments: [String]
        /// The launcher's own environment.
        package var environment: [String: String]
        package var home: String
        /// `codex --version`, and the base instructions that version ships.
        package var codexVersion: String?
        package var codexInstructions: String?
        /// The current text of Pi's models file, nil when it does not exist.
        package var piModels: String?
        /// The current text of the Hermes configuration, nil when absent.
        package var hermesConfig: String?
        /// The JSON object of a `--settings` value the user passed to Claude Code.
        package var claudeUserSettings: [String: Any]?

        package init(server: Server, arguments: [String] = [], environment: [String: String] = [:],
                     home: String = "/Users/example") {
            self.server = server
            self.arguments = arguments
            self.environment = environment
            self.home = home
        }
    }

    package static func plan(_ tool: Tool, _ inputs: Inputs) throws -> Plan {
        guard inputs.server.contextWindow >= tool.minimumContext else {
            throw Failure("\(tool.displayName) needs a context window of at least \(tool.minimumContext) tokens, "
                + "and this server has \(inputs.server.contextWindow). Stop the server and start it again with "
                + "`slotstream serve --max-context \(tool.minimumContext)`. See \(tool.guide).")
        }
        switch tool {
        case .claude: return try claudePlan(inputs)
        case .codex: return try codexPlan(inputs)
        case .pi: return try piPlan(inputs)
        case .opencode: return try opencodePlan(inputs)
        case .hermes: return try hermesPlan(inputs)
        }
    }

    // MARK: - Arguments

    /// The words that can be options: everything before a `--`.
    static func optionWords(_ arguments: [String]) -> ArraySlice<String> {
        arguments.firstIndex(of: "--").map { arguments[..<$0] } ?? arguments[...]
    }

    /// Whether the user passed an option, as `--name value` or `--name=value`.
    package static func has(_ arguments: [String], _ names: [String]) -> Bool {
        optionWords(arguments).contains { argument in
            names.contains { argument == $0 || argument.hasPrefix($0 + "=") }
        }
    }

    /// Where the value of an option is, as (index of the option, value).
    package static func optionValue(_ arguments: [String], _ name: String) -> (index: Int, value: String)? {
        let words = optionWords(arguments)
        for i in words.indices {
            if words[i] == name, i + 1 < words.endIndex { return (i, words[i + 1]) }
            if words[i].hasPrefix(name + "=") { return (i, String(words[i].dropFirst(name.count + 1))) }
        }
        return nil
    }

    static func json(_ object: Any, pretty: Bool = false) -> String {
        var options: JSONSerialization.WritingOptions = [.sortedKeys, .withoutEscapingSlashes]
        if pretty { options.insert(.prettyPrinted) }
        let data = (try? JSONSerialization.data(withJSONObject: object, options: options)) ?? Data("{}".utf8)
        return String(decoding: data, as: UTF8.self)
    }

    /// Text for a dry run to print: a JSON object with its secrets hidden.
    /// Any string under a key that names a key, token, secret, password or
    /// credential is replaced, except this launcher's own placeholder. A key
    /// that counts tokens, such as `CLAUDE_CODE_MAX_OUTPUT_TOKENS`, is not a
    /// secret. Text that is not a JSON object is returned unchanged.
    package static func redacted(_ text: String) -> String {
        guard let object = try? JSONSerialization.jsonObject(with: Data(text.utf8)), object is [String: Any] else {
            return text
        }
        func hide(_ value: Any, key: String?) -> Any {
            if let dictionary = value as? [String: Any] {
                return dictionary.reduce(into: [String: Any]()) { $0[$1.key] = hide($1.value, key: $1.key) }
            }
            if let list = value as? [Any] { return list.map { hide($0, key: key) } }
            if let string = value as? String, !string.isEmpty, string != "slotstream-local",
               let key = key?.lowercased(), !key.hasSuffix("tokens"),
               secretKeyWords.contains(where: { key.contains($0) }) {
                return "<hidden>"
            }
            return value
        }
        return json(hide(object, key: nil))
    }

    static let secretKeyWords = ["key", "token", "secret", "password", "passwd", "credential", "authorization", "cookie"]

    // MARK: - Claude Code

    /// Variables Claude Code must see for this connection. A user's own
    /// settings file can set variables too, and it overrides the process
    /// environment, so these also go in `--settings`, which overrides it.
    static func claudeConnection(_ server: Server) -> [String: String] {
        var env = [
            "ANTHROPIC_BASE_URL": server.origin,
            "ANTHROPIC_AUTH_TOKEN": "slotstream-local",
            "ANTHROPIC_MODEL": server.model,
            // Background requests use this before the Haiku alias.
            "ANTHROPIC_SMALL_FAST_MODEL": server.model,
            // The window and reply budget Claude Code plans compaction with.
            // It assumes 200,000 tokens for a model it does not know.
            "CLAUDE_CODE_MAX_CONTEXT_TOKENS": "\(server.contextWindow)",
            "CLAUDE_CODE_MAX_OUTPUT_TOKENS": "\(server.maxOutputTokens)",
            // The attribution line changes with every conversation; the server
            // drops it anyway, and without it the prompt head never varies.
            "CLAUDE_CODE_ATTRIBUTION_HEADER": "0",
        ]
        // Model aliases, which subagents and background requests use.
        for alias in ["OPUS", "SONNET", "HAIKU", "FABLE"] { env["ANTHROPIC_DEFAULT_\(alias)_MODEL"] = server.model }
        return env
    }

    /// The switches that send Claude Code's requests to a cloud provider
    /// instead of `ANTHROPIC_BASE_URL`, as of 2.1.270. A settings file can
    /// turn one on, so `--settings` turns each off.
    static let claudeProviderSwitches = [
        "CLAUDE_CODE_USE_BEDROCK", "CLAUDE_CODE_USE_VERTEX", "CLAUDE_CODE_USE_FOUNDRY",
        "CLAUDE_CODE_USE_ANTHROPIC_AWS", "CLAUDE_CODE_USE_ANTHROPIC_GOOGLE_CLOUD",
        "CLAUDE_CODE_USE_MANTLE", "CLAUDE_CODE_USE_GATEWAY",
    ]

    /// Defaults the user can change by exporting a value or setting one in
    /// their own Claude Code settings.
    /// db/records/design/measured-operating-policies.md
    static let claudeDefaults: [String: String] = [
        // No thinking unless asked for; `MAX_THINKING_TOKENS=16000` asks.
        "MAX_THINKING_TOKENS": "0",
        // A cold prompt is read for minutes before the first token. The
        // request timeout covers the wait for the reply to start, and the
        // stream timeout the wait between events once it has.
        "API_TIMEOUT_MS": "1800000",
        "CLAUDE_STREAM_IDLE_TIMEOUT_MS": "1800000",
        // The model runs on this Mac; keep Claude Code's telemetry, error
        // reports and update checks off too.
        "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1",
    ]

    /// Claude Code tools that run on Anthropic's servers. Without them the
    /// model is not offered a search it cannot perform.
    static let claudeHostedTools = ["WebSearch"]

    static func claudePlan(_ inputs: Inputs) throws -> Plan {
        let connection = claudeConnection(inputs.server)
        var environment = connection
        for (key, value) in claudeDefaults where inputs.environment[key] == nil { environment[key] = value }

        // The user's `--settings`, if any, keeps everything it says except
        // the connection, which is merged over its `env`.
        var settings = inputs.claudeUserSettings ?? [:]
        if settings["env"] != nil && !(settings["env"] is [String: Any]) {
            throw Failure("the `env` in the Claude Code --settings you passed must be an object")
        }
        if settings["permissions"] != nil && !(settings["permissions"] is [String: Any]) {
            throw Failure("the `permissions` in the Claude Code --settings you passed must be an object")
        }
        var settingsEnv = settings["env"] as? [String: Any] ?? [:]
        for (key, value) in connection { settingsEnv[key] = value }
        // A key or key helper from any settings file would be sent to
        // whatever listens on the port, and a provider switch would send the
        // prompt to that provider instead.
        settingsEnv["ANTHROPIC_API_KEY"] = ""
        for key in claudeProviderSwitches { settingsEnv[key] = "0" }
        settings["env"] = settingsEnv
        settings["apiKeyHelper"] = ""
        var permissions = settings["permissions"] as? [String: Any] ?? [:]
        var deny = permissions["deny"] as? [Any] ?? []
        for tool in claudeHostedTools where !deny.contains(where: { $0 as? String == tool }) { deny.append(tool) }
        permissions["deny"] = deny
        settings["permissions"] = permissions

        var arguments = inputs.arguments
        if let existing = optionValue(arguments, "--settings") {
            let width = arguments[existing.index].hasPrefix("--settings=") ? 1 : 2
            arguments.removeSubrange(existing.index ..< existing.index + width)
        }
        arguments = ["--settings", json(settings)] + arguments

        var notes = ["Claude Code will use \(inputs.server.model) with a \(inputs.server.contextWindow)-token window."]
        if inputs.server.contextWindow < 65_536 {
            notes.append("Claude Code's instructions and tools take about 15,000 tokens of that window. "
                + "For longer sessions, stop the server and start it yourself with "
                + "`slotstream serve --max-context 65536`; `slotstream doctor --max-context 65536` first shows "
                + "how much of a conversation this Mac keeps at that size.")
        }
        return Plan(tool: .claude, arguments: arguments, environment: environment,
                    removedEnvironment: ["ANTHROPIC_API_KEY"] + claudeProviderSwitches,
                    files: [], notes: notes)
    }

    // MARK: - Codex

    /// A TOML basic string.
    package static func toml(_ value: String) -> String {
        var out = "\""
        for scalar in value.unicodeScalars {
            switch scalar {
            case "\"": out += "\\\""
            case "\\": out += "\\\\"
            case "\n": out += "\\n"
            case "\r": out += "\\r"
            case "\t": out += "\\t"
            default:
                if scalar.value < 0x20 || scalar.value == 0x7F {
                    out += String(format: "\\u%04X", scalar.value)
                } else {
                    out.unicodeScalars.append(scalar)
                }
            }
        }
        return out + "\""
    }

    /// The catalog entry that tells Codex the served window and declares
    /// `apply_patch`; the same entry `Tools/codex_catalog.py` writes.
    package static func codexCatalog(server: Server, instructions: String) -> String {
        let entry: [String: Any] = [
            "slug": server.model,
            "display_name": "Qwen3.8-Flash-Next via Slotstream",
            "description": "Local model served by Slotstream on this Mac.",
            "supported_reasoning_levels": [
                ["effort": "low", "description": "Brief thinking before each reply"],
                ["effort": "medium", "description": "Balanced thinking"],
                ["effort": "high", "description": "Thorough thinking, slower"],
            ],
            "shell_type": "unified_exec",
            "visibility": "list",
            "supported_in_api": true,
            "priority": 1,
            "availability_nux": NSNull(),
            "upgrade": NSNull(),
            "support_verbosity": false,
            "default_verbosity": NSNull(),
            "apply_patch_tool_type": "freeform",
            "truncation_policy": ["mode": "bytes", "limit": 10000],
            "experimental_supported_tools": [] as [Any],
            "context_window": server.contextWindow,
            "max_context_window": server.contextWindow,
            "base_instructions": instructions,
        ]
        return json(["models": [entry]], pretty: true) + "\n"
    }

    package static func codexCatalogPath(home: String, codexVersion: String, window: Int) -> String {
        "\(home)/.slotstream/launch/codex/catalog-\(codexVersion)-\(window).json"
    }

    package static func codexInstructionsURL(version: String) -> String {
        "https://raw.githubusercontent.com/openai/codex/rust-v\(version)/codex-rs/models-manager/prompt.md"
    }

    package static func codexInstructionsPath(home: String, version: String) -> String {
        "\(home)/.slotstream/launch/codex/instructions-\(version).md"
    }

    /// The version in `codex --version` output, prerelease part included,
    /// since the instructions are fetched by that exact tag.
    package static func codexVersion(fromOutput text: String) -> String? {
        guard let range = text.range(of: #"\d+\.\d+\.\d+(-[0-9A-Za-z]+(\.[0-9A-Za-z]+)*)?"#,
                                     options: .regularExpression)
        else { return nil }
        return String(text[range])
    }

    /// Whether a downloaded or cached file is Codex's base prompt rather than
    /// an error page or a stray file.
    package static func looksLikeCodexInstructions(_ text: String) -> Bool {
        text.count > 1000 && text.contains("Codex") && !text.hasPrefix("<")
    }

    /// Codex's commands, and the commands under each, as of 0.148. `help`
    /// is left out: it takes no settings.
    static let codexCommands: [String: Set<String>] = [
        "": ["exec", "e", "review", "login", "logout", "mcp", "plugin", "mcp-server", "app-server",
             "remote-control", "app", "completion", "update", "doctor", "sandbox", "debug", "apply", "a",
             "resume", "archive", "delete", "migrate-rollouts", "unarchive", "fork", "cloud", "exec-server",
             "features"],
        "exec": ["resume", "fork", "review"],
        "e": ["resume", "fork", "review"],
    ]

    /// Codex options that take the next word as their value.
    static let codexValueOptions: Set<String> = [
        "-c", "--config", "--enable", "--disable", "--remote", "--remote-auth-token-env", "-m", "--model",
        "--local-provider", "-p", "--profile", "-s", "--sandbox", "-C", "--cd", "--add-dir", "-a",
        "--ask-for-approval", "--output-schema", "--color", "-o", "--output-last-message", "--base",
        "--commit", "--title",
    ]

    /// The commands the user named, where the deepest one ends, and which
    /// words are `-c` settings, read the way Codex's parser reads them.
    static func codexScan(_ user: [String]) -> (commands: [String], end: Int, configWords: [Int]) {
        var commands: [String] = []
        var end = 0
        var configWords: [Int] = []
        var i = 0
        scan: while i < user.count {
            let word = user[i]
            if word == "--" { break }
            if word == "-i" || word == "--image" {
                // Every following word up to the next option is an image.
                i += 1
                while i < user.count, !user[i].hasPrefix("-") { i += 1 }
                continue
            }
            if word == "-c" || word == "--config" {
                configWords += [i, i + 1]
                i += 2
                continue
            }
            if word.hasPrefix("--config=") || (word.hasPrefix("-c") && !word.hasPrefix("--")) {
                configWords.append(i)
                i += 1
                continue
            }
            if word.hasPrefix("-") {
                i += codexValueOptions.contains(word) ? 2 : 1
                continue
            }
            guard let known = codexCommands[commands.last ?? ""], known.contains(word) else { break scan }
            commands.append(word)
            i += 1
            end = i
        }
        return (commands, end, configWords)
    }

    /// Codex uses the `-c` settings of only the deepest command given any:
    /// `codex -c a exec -c b` ignores `a`, and a prompt meant for this Mac
    /// would go to OpenAI. So the connection goes right after the deepest
    /// command, and every `-c` the user gave above it moves there too, after
    /// the connection, so that the user's win key by key.
    package static func codexArguments(settings: [String], user: [String]) -> [String] {
        let connection = settings.flatMap { ["-c", $0] }
        let scan = codexScan(user)
        guard scan.end > 0 else { return connection + user }
        let moving = Set(scan.configWords.filter { $0 < scan.end })
        let head = user[..<scan.end].indices.filter { !moving.contains($0) }.map { user[$0] }
        let moved = moving.sorted().filter { $0 < user.count }.map { user[$0] }
        return head + connection + moved + user[scan.end...]
    }

    /// Codex requests this launch cannot serve, refused before anything is
    /// downloaded or written.
    package static func codexRefusal(_ arguments: [String]) -> Failure? {
        if codexScan(arguments).commands.first == "cloud" {
            return Failure("`codex cloud` runs tasks on OpenAI's servers, not on this Mac, so `slotstream launch` "
                + "does not start it. Run `codex cloud` directly.")
        }
        if has(arguments, ["--output-schema"]) {
            return Failure("`--output-schema` asks for a reply that follows a JSON schema, which Slotstream "
                + "does not support yet. Run the task without it.")
        }
        return nil
    }

    static func codexPlan(_ inputs: Inputs) throws -> Plan {
        if let refusal = codexRefusal(inputs.arguments) { throw refusal }
        guard let version = inputs.codexVersion, let instructions = inputs.codexInstructions, !instructions.isEmpty else {
            throw Failure("Codex's version and base instructions are needed to describe the model to it")
        }
        let server = inputs.server
        let catalog = codexCatalogPath(home: inputs.home, codexVersion: version, window: server.contextWindow)
        let provider = "{name=\"Slotstream\", base_url=\(toml(server.openAIBase)), wire_api=\"responses\", "
            + "stream_idle_timeout_ms=1800000}"
        let settings = [
            "model=\(toml(server.model))",
            "model_provider=\"slotstream\"",
            "model_catalog_json=\(toml(catalog))",
            "model_providers.slotstream=\(provider)",
        ]
        return Plan(tool: .codex, arguments: codexArguments(settings: settings, user: inputs.arguments),
                    environment: [:], removedEnvironment: [],
                    files: [FileWrite(path: catalog, contents: codexCatalog(server: server, instructions: instructions))],
                    notes: ["Codex \(version) will use \(server.model) with a \(server.contextWindow)-token window."])
    }

    // MARK: - Pi

    package static func piModelsPath(environment: [String: String], home: String) -> String {
        let directory = environment["PI_CODING_AGENT_DIR"].flatMap { $0.isEmpty ? nil : $0 } ?? "\(home)/.pi/agent"
        return (directory as NSString).expandingTildeInPath + "/models.json"
    }

    /// Pi's commands, which it recognizes only as the first word and which
    /// take none of the model options.
    static let piCommands: Set<String> = ["install", "remove", "uninstall", "update", "list", "config", "auth"]

    /// The `slotstream` provider entry, over the one already in Pi's file.
    /// The connection, the window and the settings the server needs are set;
    /// anything else the user wrote there, including other models, is kept.
    package static func piProvider(_ server: Server, existing: OrderedJSON?) -> OrderedJSON {
        var provider = OrderedJSON.object([])
        if let existing, existing.isObject { provider = existing }
        provider["baseUrl"] = .string(server.openAIBase)
        provider["api"] = .string("openai-completions")
        // Pi lists a provider's models only once it has a key; the server
        // does not read it.
        if provider["apiKey"] == nil { provider["apiKey"] = .string("slotstream-local") }
        var compat = OrderedJSON.object([])
        if let existing = provider["compat"], existing.isObject { compat = existing }
        // Releases before 0.2.21 refuse `store`, and every release refuses
        // strict tool schemas.
        compat["supportsStore"] = .bool(false)
        compat["supportsStrictMode"] = .bool(false)
        provider["compat"] = compat

        var models: [OrderedJSON] = []
        if case .array(let list)? = provider["models"] { models = list }
        let index = models.firstIndex { $0["id"] == .string(server.model) }
        var model = index.map { models[$0] } ?? .object([("id", .string(server.model))])
        if model["name"] == nil { model["name"] = .string("Qwen3.8-Flash-Next (Slotstream)") }
        if model["reasoning"] == nil { model["reasoning"] = .bool(true) }
        if model["thinkingLevelMap"] == nil {
            // Pi's levels map onto the model's three; the rest are hidden.
            model["thinkingLevelMap"] = .object([("minimal", .null), ("xhigh", .null), ("max", .null)])
        }
        if model["input"] == nil { model["input"] = .array([.string("text"), .string("image")]) }
        model["contextWindow"] = .number("\(server.contextWindow)")
        model["maxTokens"] = .number("\(server.maxOutputTokens)")
        if model["cost"] == nil {
            model["cost"] = .object(["input", "output", "cacheRead", "cacheWrite"].map { ($0, .number("0")) })
        }
        if let index { models[index] = model } else { models.append(model) }
        provider["models"] = .array(models)
        return provider
    }

    /// Pi's models file with the `slotstream` provider set. Every other entry
    /// keeps its order and its exact numbers. A file that is not a JSON
    /// object is never rewritten.
    package static func piModels(existing: String?, server: Server) throws -> String {
        var root = OrderedJSON.object([])
        if let existing, !existing.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            guard (try? JSONSerialization.jsonObject(with: Data(existing.utf8))) is [String: Any],
                  let parsed = OrderedJSON.parse(existing) else {
                throw Failure("Pi's models file is not plain JSON, so it was left as it is. "
                    + "Add the `slotstream` provider from \(Tool.pi.guide) by hand.")
            }
            root = parsed
        }
        if let providers = root["providers"], !providers.isObject {
            throw Failure("the `providers` entry in Pi's models file is not an object, so the file was left as it is")
        }
        var providers = root["providers"] ?? .object([])
        providers["slotstream"] = piProvider(server, existing: providers["slotstream"])
        root["providers"] = providers
        return root.text() + "\n"
    }

    static func piPlan(_ inputs: Inputs) throws -> Plan {
        let path = piModelsPath(environment: inputs.environment, home: inputs.home)
        let contents = try piModels(existing: inputs.piModels, server: inputs.server)
        let given = inputs.arguments
        var arguments: [String] = []
        var notes: [String] = []
        if let first = given.first, piCommands.contains(first) {
            arguments = given
        } else {
            // Pi uses `--provider` only together with `--model`.
            if !has(given, ["--model", "--models"]) {
                if let provider = optionValue(given, "--provider") {
                    guard provider.value == "slotstream" else {
                        throw Failure("Pi uses `--provider` only together with `--model`. To start Pi on "
                            + "\(provider.value), run `pi` directly.")
                    }
                    arguments += ["--model", inputs.server.model]
                } else {
                    arguments += ["--provider", "slotstream", "--model", inputs.server.model]
                }
            }
            if !has(given, ["--thinking"]) { arguments += ["--thinking", "off"] }
            arguments += given
            notes.append("Pi will use \(inputs.server.model) with a \(inputs.server.contextWindow)-token window.")
        }
        let note = inputs.piModels == nil
            ? "Created \(path) with the `slotstream` provider."
            : "Set the `slotstream` provider in \(path); other providers are unchanged."
        let entry = OrderedJSON.parse(contents)?["providers"]?["slotstream"] ?? .null
        let preview = OrderedJSON.object([("providers", .object([("slotstream", entry)]))]).text()
            + "\n(Everything else in the file stays as it is.)\n"
        return Plan(tool: .pi, arguments: arguments, environment: [:], removedEnvironment: [],
                    files: [FileWrite(path: path, contents: contents, note: note, preview: preview)],
                    notes: notes)
    }

    // MARK: - opencode

    package static func opencodeProvider(_ server: Server) -> [String: Any] {
        [
            "npm": "@ai-sdk/openai-compatible",
            "name": "Slotstream",
            "options": ["baseURL": server.openAIBase, "apiKey": "slotstream-local"],
            "models": [
                server.model: [
                    "name": "Qwen3.8-Flash-Next (Slotstream)",
                    "tool_call": true,
                    "attachment": true,
                    "limit": ["context": server.contextWindow, "output": server.maxOutputTokens],
                ] as [String: Any],
            ],
        ]
    }

    /// The agents opencode starts with. An agent with its own model uses it
    /// instead of `model`, so these are pointed here too.
    static let opencodeAgents = ["build", "plan"]

    /// The inline configuration for opencode, merged into any the user
    /// already exported.
    package static func opencodeConfig(existing: String?, server: Server) throws -> String {
        var root: [String: Any] = [:]
        if let existing, !existing.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            guard let object = (try? JSONSerialization.jsonObject(with: Data(existing.utf8))) as? [String: Any] else {
                throw Failure("OPENCODE_CONFIG_CONTENT is set but is not a JSON object")
            }
            root = object
        }
        let model = "slotstream/\(server.model)"
        var providers = root["provider"] as? [String: Any] ?? [:]
        providers["slotstream"] = opencodeProvider(server)
        root["provider"] = providers
        root["$schema"] = root["$schema"] ?? "https://opencode.ai/config.json"
        // Titles and summaries use the small model; without one opencode
        // may reach for a hosted model.
        root["model"] = model
        root["small_model"] = model
        // This list replaces the one in the user's files, so an agent or a
        // command pinned to another provider fails instead of sending the
        // prompt there.
        root["enabled_providers"] = ["slotstream"]
        root["disabled_providers"] = [] as [String]
        var agents = root["agent"] as? [String: Any] ?? [:]
        for name in opencodeAgents {
            var agent = agents[name] as? [String: Any] ?? [:]
            agent["model"] = model
            agents[name] = agent
        }
        root["agent"] = agents
        return json(root)
    }

    static func opencodePlan(_ inputs: Inputs) throws -> Plan {
        let config = try opencodeConfig(existing: inputs.environment["OPENCODE_CONFIG_CONTENT"], server: inputs.server)
        return Plan(tool: .opencode, arguments: inputs.arguments, environment: ["OPENCODE_CONFIG_CONTENT": config],
                    removedEnvironment: [], files: [],
                    notes: ["opencode will use \(inputs.server.model) with a \(inputs.server.contextWindow)-token window."])
    }

    // MARK: - Hermes

    package static func hermesHome(environment: [String: String], home: String) -> String {
        let value = environment["HERMES_HOME"].flatMap { $0.isEmpty ? nil : $0 } ?? "\(home)/.hermes-slotstream"
        return (value as NSString).expandingTildeInPath
    }

    /// Hermes 0.21's side tasks. One left on `auto` tries OpenRouter, Nous
    /// and any provider key in the environment when this server is busy or
    /// stopped, so every one is pinned to the main model.
    package static let hermesSideTasks = [
        "vision", "compression", "title_generation", "approval", "skills_hub", "review", "mcp",
        "memory_query_rewrite", "tts_audio_tags", "triage_specifier", "kanban_decomposer",
        "profile_describer", "goal_judge", "curator", "monitor", "background_review",
        "moa_reference", "moa_aggregator",
    ]

    /// The side tasks with settings of their own below; the rest take only
    /// the provider, one line each.
    static let hermesDetailedTasks: Set<String> = ["vision", "compression", "title_generation"]

    /// The configuration from docs/HERMES.md, for this server.
    package static func hermesConfig(_ server: Server) -> String {
        let pinned = hermesSideTasks.filter { !hermesDetailedTasks.contains($0) }
            .map { "  \($0): {provider: main}\n" }.joined()
        return """
        model:
          provider: slotstream
          default: "\(server.model)"
          context_length: \(server.contextWindow)
        providers:
          slotstream:
            base_url: \(server.openAIBase)
            api_key: unused
            api_mode: chat_completions
            extra_body:
              max_tokens: 4096
        agent:
          reasoning_effort: none
          local_stream_stale_timeout: 1800
        auxiliary:
          vision:
            provider: main
            timeout: 1800
          compression:
            provider: main
            timeout: 1800
            extra_body:
              max_tokens: 4096
              temperature: 0.2
              presence_penalty: 0
          title_generation:
            provider: main
            timeout: 1800
            extra_body:
              max_tokens: 64

        """ + pinned + """
        compression:
          enabled: true

        """
    }

    /// The scalar values of a YAML file, by dotted key path. Only block
    /// mappings and one-line flow mappings are read, which covers the file
    /// this launcher writes and the usual hand edits of it; a value this
    /// cannot find is treated as absent.
    package static func yamlScalars(_ text: String) -> [String: String] {
        func unquote(_ value: String) -> String {
            var value = value.trimmingCharacters(in: .whitespaces)
            if value.count >= 2, let first = value.first, first == "\"" || first == "'", value.last == first {
                value = String(value.dropFirst().dropLast())
            }
            return value
        }
        func withoutComment(_ line: String) -> String {
            var quote: Character?
            var previous: Character = " "
            for (offset, character) in line.enumerated() {
                if let open = quote {
                    if character == open { quote = nil }
                } else if character == "\"" || character == "'" {
                    quote = character
                } else if character == "#", previous == " " || previous == "\t" {
                    return String(line.prefix(offset))
                }
                previous = character
            }
            return line
        }
        var result: [String: String] = [:]
        var stack: [(indent: Int, key: String)] = []
        for raw in text.components(separatedBy: .newlines) {
            let line = withoutComment(raw)
            let content = line.trimmingCharacters(in: .whitespaces)
            if content.isEmpty || content.hasPrefix("-") || content.hasPrefix("#") { continue }
            let indent = line.prefix { $0 == " " }.count
            guard let colon = content.range(of: ":") else { continue }
            let key = unquote(String(content[..<colon.lowerBound]))
            let value = String(content[colon.upperBound...]).trimmingCharacters(in: .whitespaces)
            while let last = stack.last, last.indent >= indent { stack.removeLast() }
            let path = (stack.map(\.key) + [key]).joined(separator: ".")
            if value.isEmpty {
                stack.append((indent, key))
            } else if value.hasPrefix("{"), value.hasSuffix("}") {
                for pair in value.dropFirst().dropLast().split(separator: ",") {
                    let parts = pair.split(separator: ":", maxSplits: 1)
                    guard parts.count == 2 else { continue }
                    result[path + "." + unquote(String(parts[0]))] = unquote(String(parts[1]))
                }
            } else {
                result[path] = unquote(value)
            }
        }
        return result
    }

    static func hermesPlan(_ inputs: Inputs) throws -> Plan {
        let server = inputs.server
        let homeFolder = hermesHome(environment: inputs.environment, home: inputs.home)
        let path = homeFolder + "/config.yaml"
        var files: [FileWrite] = []
        var notes: [String] = []
        if let existing = inputs.hermesConfig {
            // YAML the user may have edited is never rewritten; it is only
            // checked for what this launch depends on.
            guard existing.contains("slotstream:") else {
                throw Failure("\(path) has no `slotstream` provider. Add the configuration from \(Tool.hermes.guide), "
                    + "or set HERMES_HOME to a new folder and run this again.")
            }
            if !existing.contains(server.openAIBase) && !existing.contains("http://localhost:\(server.port)/v1") {
                notes.append("\(path) does not point at port \(server.port); Hermes will use the address written there.")
            }
            let values = yamlScalars(existing)
            // Hermes trusts this number over what the server reports.
            if let written = values["model.context_length"].flatMap({ Int($0) }) {
                if written > server.contextWindow {
                    throw Failure("\(path) sets context_length to \(written), but the server's window is "
                        + "\(server.contextWindow) tokens, so Hermes would send prompts the server refuses. "
                        + "Change context_length to \(server.contextWindow) in that file, or restart the server "
                        + "with `slotstream serve --max-context \(written)`.")
                }
                if written < server.contextWindow {
                    notes.append("\(path) sets context_length to \(written), below the server's "
                        + "\(server.contextWindow)-token window; Hermes compresses conversations at that size.")
                }
            }
            let unpinned = hermesSideTasks.filter { values["auxiliary.\($0).provider"] != "main" }
            if !unpinned.isEmpty {
                notes.append("\(path) does not set `provider: main` for these Hermes side tasks: "
                    + unpinned.joined(separator: ", ") + ". While this server is busy or stopped, Hermes may send "
                    + "them to a cloud provider. Add the `auxiliary` block from \(Tool.hermes.guide).")
            }
        } else {
            files.append(FileWrite(path: path, contents: hermesConfig(server),
                                   note: "Created \(path) for Hermes, following \(Tool.hermes.guide)."))
        }
        // The provider flags go right after `chat`, which may follow a
        // profile choice, or before everything for Hermes's top-level mode.
        let given = inputs.arguments
        let flags = has(given, ["--provider", "--model", "-m"]) ? [] : ["--provider", "slotstream", "--model", server.model]
        var command = 0
        while command < given.count {
            if ["-p", "--profile"].contains(given[command]) { command += 2 }
            else if given[command].hasPrefix("--profile=") { command += 1 }
            else { break }
        }
        var arguments: [String]
        if given.isEmpty {
            arguments = ["chat"] + flags
        } else if command < given.count, given[command] == "chat" {
            arguments = Array(given[...command]) + flags + given[(command + 1)...]
        } else {
            arguments = flags + given
        }
        // A profile made active with `hermes profile use` inside this folder
        // would replace its configuration; `--profile default` keeps the
        // folder's own, as the guide's diagnostic command does. A HERMES_HOME
        // that is itself a named profile folder is used as it is.
        let profileFolder = URL(fileURLWithPath: homeFolder).deletingLastPathComponent().lastPathComponent == "profiles"
        if !profileFolder && !has(inputs.arguments, ["-p", "--profile"]) {
            arguments = ["--profile", "default"] + arguments
        }
        notes.append("Hermes will use \(server.model) with a \(server.contextWindow)-token window.")
        return Plan(tool: .hermes, arguments: arguments, environment: ["HERMES_HOME": homeFolder],
                    removedEnvironment: [], files: files, notes: notes)
    }

    // MARK: - The server

    /// The longest `--idle-exit`, one week, in minutes.
    package static let maximumIdleMinutes = 10_080.0

    /// A server launch starts when none answers: in the background, with a
    /// log, prompt caches kept on disk, and a stop once no agent uses it.
    package enum BackgroundServer {
        /// How long a started server keeps running after its last agent
        /// exits and its last request ends. A restart takes seconds and the
        /// disk cache restores an agent's instructions, so the memory comes
        /// back soon after work stops.
        package static let defaultIdleMinutes = 30.0

        package static func prefixCacheDirectory(home: String) -> String { home + "/.slotstream/prefix-cache" }

        package static func logPath(home: String, port: Int) -> String {
            home + "/.slotstream/logs/" + (port == 11434 ? "serve.log" : "serve-\(port).log")
        }

        /// What launch records about a server it started, so a later launch
        /// knows the server is its own to restart.
        package static func statePath(home: String, port: Int) -> String {
            home + "/.slotstream/launch/server-\(port).json"
        }

        /// Held by the launch that may start or restart the server on a port,
        /// so a second launch waits and then uses that server.
        package static func startLockPath(home: String, port: Int) -> String {
            home + "/.slotstream/launch/start-\(port).lock"
        }

        /// `slotstream serve` arguments. A nil window keeps the automatic one.
        package static func serveArguments(port: Int, window: Int?, memoryGB: Double?, memoryLimitGB: Double? = nil, idleMinutes: Double,
                                           prefixCacheDirectory: String) -> [String] {
            var arguments = ["serve", "--port", "\(port)"]
            if let window { arguments += ["--max-context", "\(window)"] }
            if let memoryGB { arguments += ["--memory-gb", number(memoryGB)] }
            if let memoryLimitGB { arguments += ["--memory-limit-gb", number(memoryLimitGB)] }
            arguments += ["--prefix-cache-dir", prefixCacheDirectory]
            if idleMinutes > 0 { arguments += ["--idle-exit", number(idleMinutes)] }
            return arguments
        }

        /// The window to ask for. The automatic window is never below
        /// 32,768 tokens, which fits every tool but Hermes; nil keeps it.
        package static func window(for tool: Tool, automatic: Int) -> Int? {
            automatic >= tool.minimumContext ? nil : tool.minimumContext
        }

        package static func number(_ value: Double) -> String {
            // This is also used for child-process arguments. %g defaults to
            // six significant digits and could change a selected ceiling.
            let text = String(value)
            return text.hasSuffix(".0") ? String(text.dropLast(2)) : text
        }

        /// What the user reads once the server answers.
        package static func startedMessage(port: Int, log: String, idleMinutes: Double) -> String {
            "Slotstream is running in the background on port \(port). " + lifetime(port: port, idleMinutes: idleMinutes)
                + " Its log is \(log)."
        }

        /// What a dry run says about the server it would start.
        package static func wouldStartMessage(port: Int, log: String, idleMinutes: Double) -> String {
            "It would keep its log in \(log). " + lifetime(port: port, idleMinutes: idleMinutes)
        }

        static func lifetime(port: Int, idleMinutes: Double) -> String {
            let stop = port == 11434 ? "`slotstream stop`" : "`slotstream stop --port \(port)`"
            return idleMinutes > 0
                ? "It stops \(number(idleMinutes)) minutes after its last agent exits; \(stop) stops it sooner."
                : "It keeps running until \(stop)."
        }
    }

    /// `GET /slotstream/status`, as launch and `slotstream stop` read it.
    package struct ServerStatus: Equatable {
        package var pid: Int32
        package var port: Int
        package var contextWindow: Int
        package var activeRequests: Int
        package var clients: Int
        package var idleExitMinutes: Double?
        /// What sized the server's memory plan, as its flag (`--memory-gb`)
        /// or `auto`, and the target it gives, when the server says.
        package var memorySource: String?
        package var memoryTargetGB: Double?
        package var memoryLimitGB: Double?

        package init(pid: Int32, port: Int, contextWindow: Int, activeRequests: Int, clients: Int,
                     idleExitMinutes: Double?, memorySource: String? = nil, memoryTargetGB: Double? = nil,
                     memoryLimitGB: Double? = nil) {
            self.pid = pid
            self.port = port
            self.contextWindow = contextWindow
            self.activeRequests = activeRequests
            self.clients = clients
            self.idleExitMinutes = idleExitMinutes
            self.memorySource = memorySource
            self.memoryTargetGB = memoryTargetGB
            self.memoryLimitGB = memoryLimitGB
        }

        package static func from(_ json: [String: Any]) -> ServerStatus? {
            guard json["server"] as? String == "slotstream",
                  let pid = json["pid"] as? Int, (1 ... Int(Int32.max)).contains(pid),
                  let port = json["port"] as? Int,
                  let window = json["context_window"] as? Int,
                  let active = json["active_requests"] as? Int,
                  let clients = json["clients"] as? Int else { return nil }
            return ServerStatus(pid: Int32(pid), port: port, contextWindow: window, activeRequests: active,
                                clients: clients, idleExitMinutes: json["idle_exit_minutes"] as? Double,
                                memorySource: json["memory_source"] as? String,
                                memoryTargetGB: json["memory_target_gb"] as? Double,
                                memoryLimitGB: json["memory_limit_gb"] as? Double)
        }
    }

    /// What to say when `--memory-gb` was given and a server was already
    /// running: nil when that server has the same target, as when another
    /// launch just started it with it.
    package static func memoryNote(requested: Double, port: Int, status: ServerStatus?) -> String? {
        let asked = BackgroundServer.number(requested)
        let has: String
        switch (status?.memorySource, status?.memoryTargetGB) {
        case ("--memory-gb", let target?):
            if BackgroundServer.number(target) == asked { return nil }
            has = " with a \(BackgroundServer.number(target)) GB memory target"
        case ("auto", _):
            has = " with its memory target chosen automatically"
        default:
            has = ""
        }
        let stop = port == 11434 ? "slotstream stop" : "slotstream stop --port \(port)"
        return "The server on port \(port) was already running\(has), so --memory-gb \(asked) did not apply. "
            + "Stop it with `\(stop)` and run this again to start one with that target."
    }

    /// A saved adaptive limit is distinct from a smaller current target.
    package static func memoryLimitNote(requested: Double, port: Int, status: ServerStatus?) -> String? {
        if status?.memorySource == "auto", status?.memoryLimitGB == requested { return nil }
        let has = status?.memoryLimitGB.map { " with a \(BackgroundServer.number($0)) GB adaptive memory limit" } ?? ""
        let stop = port == 11434 ? "slotstream stop" : "slotstream stop --port \(port)"
        return "The server on port \(port) was already running\(has), so --memory-limit-gb \(BackgroundServer.number(requested)) did not apply. "
            + "Stop it with `\(stop)` and run this again to start one with that limit."
    }

    /// What launch wrote about the server it started.
    package struct StartedServer: Equatable {
        /// The process, with its start time, so a later process that reuses
        /// the id is not taken for it.
        package var process: ProcessIdentity
        package var port: Int
        package var log: String

        package init(process: ProcessIdentity, port: Int, log: String) {
            self.process = process
            self.port = port
            self.log = log
        }

        package var pid: Int32 { process.pid }

        package var json: [String: Any] {
            ["pid": Int(process.pid), "started_seconds": Int(process.startSeconds),
             "started_microseconds": Int(process.startMicroseconds), "port": port, "log": log]
        }

        package static func from(_ json: [String: Any]) -> StartedServer? {
            guard let pid = json["pid"] as? Int, (1 ... Int(Int32.max)).contains(pid),
                  let seconds = json["started_seconds"] as? Int, let microseconds = json["started_microseconds"] as? Int,
                  let port = json["port"] as? Int, let log = json["log"] as? String else { return nil }
            return StartedServer(process: ProcessIdentity(pid: Int32(pid), startSeconds: Int64(seconds),
                                                          startMicroseconds: Int64(microseconds)),
                                 port: port, log: log)
        }

        /// Whether the server answering on the port is this one. `running` is
        /// the process now holding the status's id, as `ProcessIdentity.of`
        /// reads it.
        package func answers(_ status: ServerStatus?, running: ProcessIdentity?) -> Bool {
            guard let status, status.pid == process.pid, status.port == port else { return false }
            return running == process
        }
    }

    /// A running server's window is too small for the tool: restart it, or
    /// say why it was left alone.
    package enum SmallWindow: Equatable {
        case restart(pid: Int32)
        case refuse(Failure)
    }

    /// Only a server launch started, and nobody is using, is restarted: a
    /// server someone started in a Terminal, or one an agent still talks
    /// to, stays as it is.
    package static func smallWindow(tool: Tool, server: Server, status: ServerStatus?,
                                    startedByLaunch: Bool) -> SmallWindow {
        let needs = "\(tool.displayName) needs a context window of at least \(tool.minimumContext) tokens, "
            + "and the server on port \(server.port) has \(server.contextWindow)."
        let stop = server.port == 11434 ? "slotstream stop" : "slotstream stop --port \(server.port)"
        guard let status, startedByLaunch else {
            return .refuse(Failure(needs + " It was not started by `slotstream launch`, so it was left running. "
                + "Stop it (`\(stop)` or Control-C in its window) and run this again, and launch starts one with "
                + "that window; or restart it yourself with `slotstream serve --max-context \(tool.minimumContext)`. "
                + "See \(tool.guide)."))
        }
        guard status.activeRequests == 0, status.clients == 0 else {
            return .refuse(Failure(needs + " The server `slotstream launch` started is still in use by another agent, "
                + "so it was left running. Run this again once that agent has exited, or stop the server with `\(stop)`."))
        }
        return .restart(pid: status.pid)
    }

    /// The agent chosen at the prompt: its number in `installed`, its name,
    /// or the first one for an empty answer.
    package static func pickTool(_ answer: String, installed: [Tool]) -> Tool? {
        guard !installed.isEmpty else { return nil }
        let text = answer.trimmingCharacters(in: .whitespacesAndNewlines)
        if text.isEmpty { return installed[0] }
        if let number = Int(text) { return (1 ... installed.count).contains(number) ? installed[number - 1] : nil }
        guard let tool = Tool(name: text), installed.contains(tool) else { return nil }
        return tool
    }

    package static func pickerMenu(installed: [Tool]) -> String {
        var lines = ["Which agent should Slotstream start?"]
        for (index, tool) in installed.enumerated() {
            lines.append("  \(index + 1). \(tool.displayName) (slotstream launch \(tool.rawValue))")
        }
        return lines.joined(separator: "\n") + "\n"
    }
}

/// A JSON value that keeps what a person wrote: the order of keys and the
/// exact text of numbers. Pi's models file is the user's, so it is changed
/// the way a careful hand edit would change it, not re-sorted or re-rounded.
/// Parse only text `JSONSerialization` has accepted; the reader assumes it is
/// well formed.
package indirect enum OrderedJSON: Equatable {
    case object([(String, OrderedJSON)])
    case array([OrderedJSON])
    case string(String)
    case number(String)
    case bool(Bool)
    case null

    package static func == (a: OrderedJSON, b: OrderedJSON) -> Bool {
        switch (a, b) {
        case let (.object(x), .object(y)):
            return x.count == y.count && zip(x, y).allSatisfy { $0.0 == $1.0 && $0.1 == $1.1 }
        case let (.array(x), .array(y)): return x == y
        case let (.string(x), .string(y)): return x == y
        case let (.number(x), .number(y)): return x == y
        case let (.bool(x), .bool(y)): return x == y
        case (.null, .null): return true
        default: return false
        }
    }

    package var isObject: Bool {
        if case .object = self { return true }
        return false
    }

    /// The value under a key; the last one wins, as in JavaScript. Setting
    /// replaces that one in place or adds the key at the end.
    package subscript(key: String) -> OrderedJSON? {
        get {
            guard case .object(let pairs) = self else { return nil }
            return pairs.last { $0.0 == key }?.1
        }
        set {
            guard case .object(var pairs) = self else { return }
            let index = pairs.lastIndex { $0.0 == key }
            switch (index, newValue) {
            case let (index?, value?): pairs[index].1 = value
            case let (nil, value?): pairs.append((key, value))
            case let (index?, nil): pairs.remove(at: index)
            case (nil, nil): break
            }
            self = .object(pairs)
        }
    }

    package static func parse(_ text: String) -> OrderedJSON? {
        var reader = Reader(scalars: Array(text.unicodeScalars))
        guard let value = reader.value() else { return nil }
        reader.skipSpace()
        return reader.at == reader.scalars.count ? value : nil
    }

    /// Two-space indented text, the layout Pi itself writes.
    package func text(indent: String = "") -> String {
        let inner = indent + "  "
        switch self {
        case .object(let pairs):
            if pairs.isEmpty { return "{}" }
            let lines = pairs.map { inner + Self.quoted($0.0) + ": " + $0.1.text(indent: inner) }
            return "{\n" + lines.joined(separator: ",\n") + "\n" + indent + "}"
        case .array(let items):
            if items.isEmpty { return "[]" }
            return "[\n" + items.map { inner + $0.text(indent: inner) }.joined(separator: ",\n") + "\n" + indent + "]"
        case .string(let value): return Self.quoted(value)
        case .number(let value): return value
        case .bool(let value): return value ? "true" : "false"
        case .null: return "null"
        }
    }

    static func quoted(_ value: String) -> String {
        var out = "\""
        for scalar in value.unicodeScalars {
            switch scalar {
            case "\"": out += "\\\""
            case "\\": out += "\\\\"
            case "\n": out += "\\n"
            case "\r": out += "\\r"
            case "\t": out += "\\t"
            default:
                if scalar.value < 0x20 { out += String(format: "\\u%04x", scalar.value) }
                else { out.unicodeScalars.append(scalar) }
            }
        }
        return out + "\""
    }

    struct Reader {
        let scalars: [Unicode.Scalar]
        var at = 0

        mutating func skipSpace() {
            while at < scalars.count, [" ", "\n", "\r", "\t"].contains(scalars[at]) { at += 1 }
        }

        mutating func value() -> OrderedJSON? {
            skipSpace()
            guard at < scalars.count else { return nil }
            switch scalars[at] {
            case "{":
                at += 1
                var pairs: [(String, OrderedJSON)] = []
                skipSpace()
                if at < scalars.count, scalars[at] == "}" { at += 1; return .object(pairs) }
                while true {
                    skipSpace()
                    guard let key = string() else { return nil }
                    skipSpace()
                    guard at < scalars.count, scalars[at] == ":" else { return nil }
                    at += 1
                    guard let item = value() else { return nil }
                    pairs.append((key, item))
                    skipSpace()
                    guard at < scalars.count else { return nil }
                    if scalars[at] == "," { at += 1; continue }
                    if scalars[at] == "}" { at += 1; return .object(pairs) }
                    return nil
                }
            case "[":
                at += 1
                var items: [OrderedJSON] = []
                skipSpace()
                if at < scalars.count, scalars[at] == "]" { at += 1; return .array(items) }
                while true {
                    guard let item = value() else { return nil }
                    items.append(item)
                    skipSpace()
                    guard at < scalars.count else { return nil }
                    if scalars[at] == "," { at += 1; continue }
                    if scalars[at] == "]" { at += 1; return .array(items) }
                    return nil
                }
            case "\"":
                return string().map(OrderedJSON.string)
            case "t", "f", "n":
                for (word, result) in [("true", OrderedJSON.bool(true)), ("false", .bool(false)), ("null", .null)] {
                    let letters = Array(word.unicodeScalars)
                    if at + letters.count <= scalars.count, Array(scalars[at ..< at + letters.count]) == letters {
                        at += letters.count
                        return result
                    }
                }
                return nil
            default:
                let start = at
                while at < scalars.count, "+-0123456789.eE".unicodeScalars.contains(scalars[at]) { at += 1 }
                guard at > start else { return nil }
                var text = ""
                text.unicodeScalars.append(contentsOf: scalars[start ..< at])
                return .number(text)
            }
        }

        mutating func string() -> String? {
            guard at < scalars.count, scalars[at] == "\"" else { return nil }
            at += 1
            var out = String.UnicodeScalarView()
            var high: UInt32?
            while at < scalars.count {
                let scalar = scalars[at]
                at += 1
                if scalar == "\"" { return String(out) }
                guard scalar == "\\" else { out.append(scalar); continue }
                guard at < scalars.count else { return nil }
                let escape = scalars[at]
                at += 1
                if escape == "u" {
                    guard at + 4 <= scalars.count else { return nil }
                    var hex = ""
                    hex.unicodeScalars.append(contentsOf: scalars[at ..< at + 4])
                    at += 4
                    guard let code = UInt32(hex, radix: 16) else { return nil }
                    if (0xD800 ... 0xDBFF).contains(code) {
                        high = code
                        continue
                    }
                    if (0xDC00 ... 0xDFFF).contains(code), let first = high,
                       let joined = Unicode.Scalar(0x10000 + ((first - 0xD800) << 10) + (code - 0xDC00)) {
                        out.append(joined)
                    } else {
                        out.append(Unicode.Scalar(code) ?? "\u{FFFD}")
                    }
                    high = nil
                    continue
                }
                high = nil
                switch escape {
                case "\"": out.append("\"")
                case "\\": out.append("\\")
                case "/": out.append("/")
                case "b": out.append("\u{08}")
                case "f": out.append("\u{0C}")
                case "n": out.append("\n")
                case "r": out.append("\r")
                case "t": out.append("\t")
                default: return nil
                }
            }
            return nil
        }
    }
}
