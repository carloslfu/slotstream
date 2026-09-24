// T0: `slotstream launch` plans, on values. No server, no tool, no files.
//
// Each plan is checked for the two promises the command makes: the tool is
// connected to this server with the served window, and the user's own
// configuration and choices survive.

import Foundation
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    static var launchChecks: [Check] {
        [Check("launch-plans", tier: .t0) { launchPlans() },
         Check("launch-server", tier: .t0) { launchServer() }]
    }

    static func launchPlans() -> CheckReport {
        var c = CheckBuilder("launch-plans")
        typealias L = CodingToolLaunch
        let server = L.Server(port: 11434, model: "qwen3.8-flash-next:4bit", contextWindow: 32768, maxOutputTokens: 8192)
        func inputs(_ arguments: [String] = [], env: [String: String] = [:], window: Int = 32768) -> L.Inputs {
            var s = server
            s.contextWindow = window
            return L.Inputs(server: s, arguments: arguments, environment: env, home: "/Users/me")
        }
        func failure(_ tool: L.Tool, _ i: L.Inputs, _ fragment: String) -> Bool {
            do { _ = try L.plan(tool, i); return false }
            catch let f as L.Failure { return f.message.contains(fragment) }
            catch { return false }
        }
        func object(_ text: String?) -> [String: Any] {
            text.flatMap { (try? JSONSerialization.jsonObject(with: Data($0.utf8))) as? [String: Any] } ?? [:]
        }

        // What the server says about itself.
        let models: [String: Any] = ["object": "list", "data": [[
            "id": "qwen3.8-flash-next:4bit", "owned_by": "slotstream", "context_window": 65536, "max_output_tokens": 8192,
        ]]]
        c.equal("a Slotstream model list is read", L.Server.from(models: models, port: 8080),
                L.Server(port: 8080, model: "qwen3.8-flash-next:4bit", contextWindow: 65536, maxOutputTokens: 8192))
        let ollama: [String: Any] = ["object": "list", "data": [["id": "llama3", "owned_by": "library"]]]
        c.expect("another server on the port is not mistaken for Slotstream", L.Server.from(models: ollama, port: 11434) == nil)
        let older: [String: Any] = ["data": [["id": "m", "owned_by": "slotstream", "context_window": 32768]]]
        c.equal("a missing reply budget falls back to the served budget", L.Server.from(models: older, port: 1)?.maxOutputTokens,
                GatewayDialect.outputBudget(contextCap: 32768))
        for bad in ["evil{env:HOME}", "two\nlines", "", String(repeating: "m", count: 129), "a b", "q\"uote"] {
            let entry: [String: Any] = ["data": [["id": bad, "owned_by": "slotstream", "context_window": 65536]]]
            c.expect("a model name with unsafe characters is refused: \(String(bad.debugDescription.prefix(24)))", L.Server.from(models: entry, port: 1) == nil)
        }
        c.expect("a model name with the served characters is read",
                 L.Server.isValidModelName("org/model-1.5_b:4bit") && L.Server.isValidModelName(String(repeating: "m", count: 128)))
        c.equal("tool names and aliases", ["claude", "claude-code", "Codex", "pi", "opencode", "hermes-agent", "cursor"]
            .map { L.Tool(name: $0)?.rawValue }, ["claude", "claude", "codex", "pi", "opencode", "hermes", nil])
        c.expect("helpers find options in both spellings", L.has(["--model=x"], ["--model"]) && L.has(["-m", "x"], ["-m"])
                 && !L.has(["--models"], ["--model"]) && L.optionValue(["a", "--settings", "{}"], "--settings")?.index == 1)
        c.expect("words after -- are not options", !L.has(["--", "--model"], ["--model"])
                 && L.optionValue(["--settings", "--", "{}"], "--settings") == nil
                 && L.optionValue(["--", "--settings", "{}"], "--settings") == nil)
        let secret = object(L.redacted(#"{"env":{"ANTHROPIC_API_KEY":"sk-1","KEEP":"1","GITHUB_TOKEN":"g"},"apiKey":"slotstream-local","apiKeyHelper":"","maxTokens":5,"list":[{"password":"p"}],"providers":{"x":{"apiKey":"k2"}}}"#))
        let secretEnv = secret["env"] as? [String: Any] ?? [:]
        c.expect("a dry run hides keys and tokens",
                 secretEnv["ANTHROPIC_API_KEY"] as? String == "<hidden>" && secretEnv["GITHUB_TOKEN"] as? String == "<hidden>"
                    && ((secret["list"] as? [[String: Any]])?.first?["password"] as? String) == "<hidden>"
                    && (((secret["providers"] as? [String: Any])?["x"] as? [String: Any])?["apiKey"] as? String) == "<hidden>")
        c.expect("a dry run keeps everything else",
                 secretEnv["KEEP"] as? String == "1" && secret["apiKey"] as? String == "slotstream-local"
                    && secret["apiKeyHelper"] as? String == "" && secret["maxTokens"] as? Int == 5)
        c.equal("text that is not a JSON object is shown as it is", L.redacted("--continue"), "--continue")
        let counts = object(L.redacted(#"{"env":{"CLAUDE_CODE_MAX_OUTPUT_TOKENS":"8192","MAX_THINKING_TOKENS":"0","ANTHROPIC_AUTH_TOKEN":"real"}}"#))["env"] as? [String: Any] ?? [:]
        c.expect("a dry run shows token counts but hides a token",
                 counts["CLAUDE_CODE_MAX_OUTPUT_TOKENS"] as? String == "8192" && counts["MAX_THINKING_TOKENS"] as? String == "0"
                    && counts["ANTHROPIC_AUTH_TOKEN"] as? String == "<hidden>")

        // Claude Code.
        do {
            let plan = try L.plan(.claude, inputs(["-p", "hello"]))
            c.equal("the settings come first, then the user's arguments", Array(plan.arguments.dropFirst(2)), ["-p", "hello"])
            c.equal("settings are passed on the command line", plan.arguments.first, "--settings")
            let settings = object(plan.arguments[safe: 1])
            let env = settings["env"] as? [String: String] ?? [:]
            c.equal("settings point Claude Code here", env["ANTHROPIC_BASE_URL"], "http://127.0.0.1:11434")
            c.equal("settings carry the window Claude Code plans with", env["CLAUDE_CODE_MAX_CONTEXT_TOKENS"], "32768")
            c.equal("settings carry the reply budget", env["CLAUDE_CODE_MAX_OUTPUT_TOKENS"], "8192")
            c.equal("every model alias is this model", ["OPUS", "SONNET", "HAIKU", "FABLE"].map { env["ANTHROPIC_DEFAULT_\($0)_MODEL"] },
                    Array(repeating: "qwen3.8-flash-next:4bit", count: 4))
            c.equal("the variables match the settings", plan.environment["ANTHROPIC_MODEL"], "qwen3.8-flash-next:4bit")
            c.equal("a placeholder token is set", plan.environment["ANTHROPIC_AUTH_TOKEN"], "slotstream-local")
            c.equal("the attribution line is turned off", plan.environment["CLAUDE_CODE_ATTRIBUTION_HEADER"], "0")
            c.equal("thinking starts off", plan.environment["MAX_THINKING_TOKENS"], "0")
            c.equal("a long first read is allowed", plan.environment["API_TIMEOUT_MS"], "1800000")
            c.equal("nonessential traffic is off", plan.environment["CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC"], "1")
            c.expect("the defaults stay out of the settings, so the user's own settings can change them",
                     env["MAX_THINKING_TOKENS"] == nil && env["API_TIMEOUT_MS"] == nil)
            let switches = ["CLAUDE_CODE_USE_BEDROCK", "CLAUDE_CODE_USE_VERTEX", "CLAUDE_CODE_USE_FOUNDRY",
                            "CLAUDE_CODE_USE_ANTHROPIC_AWS", "CLAUDE_CODE_USE_ANTHROPIC_GOOGLE_CLOUD",
                            "CLAUDE_CODE_USE_MANTLE", "CLAUDE_CODE_USE_GATEWAY"]
            c.expect("a real API key and every cloud switch are removed for this run",
                     (["ANTHROPIC_API_KEY"] + switches).allSatisfy(plan.removedEnvironment.contains))
            c.expect("the settings turn every cloud switch off, since a settings file can turn one on",
                     switches.allSatisfy { env[$0] == "0" })
            c.expect("the settings clear the API key and the key helper, which would be sent to the port",
                     env["ANTHROPIC_API_KEY"] == "" && settings["apiKeyHelper"] as? String == "")
            c.equal("background requests use this model too", env["ANTHROPIC_SMALL_FAST_MODEL"], "qwen3.8-flash-next:4bit")
            c.equal("the hosted web search is denied", (settings["permissions"] as? [String: Any])?["deny"] as? [String], ["WebSearch"])
            c.equal("a long wait between stream events is allowed", plan.environment["CLAUDE_STREAM_IDLE_TIMEOUT_MS"], "1800000")
            c.expect("a short window gets a note", plan.notes.contains { $0.contains("--max-context 65536") })
            c.expect("no files are written for Claude Code", plan.files.isEmpty)

            let exported = try L.plan(.claude, inputs(env: ["MAX_THINKING_TOKENS": "16000", "API_TIMEOUT_MS": "60000",
                                                           "CLAUDE_STREAM_IDLE_TIMEOUT_MS": "600000"]))
            c.expect("exported preferences win over launch defaults",
                     exported.environment["MAX_THINKING_TOKENS"] == nil && exported.environment["API_TIMEOUT_MS"] == nil
                        && exported.environment["CLAUDE_STREAM_IDLE_TIMEOUT_MS"] == nil)
            let wide = try L.plan(.claude, inputs(window: 131072))
            c.expect("a wide window needs no note", !wide.notes.contains { $0.contains("--max-context") })

            var own = inputs(["--settings", #"{"permissions":{"allow":["Bash"]}}"#, "--continue"])
            own.claudeUserSettings = ["permissions": ["allow": ["Bash"], "deny": ["Read(./.env)", "WebSearch"]],
                                      "apiKeyHelper": "/usr/local/bin/key",
                                      "env": ["ANTHROPIC_BASE_URL": "https://example.com", "KEEP": "1",
                                              "ANTHROPIC_API_KEY": "sk-user", "CLAUDE_CODE_USE_BEDROCK": "1"]]
            let merged = try L.plan(.claude, own)
            c.equal("the user's --settings is replaced by one merged value", merged.arguments.filter { $0 == "--settings" }.count, 1)
            c.equal("other user arguments stay", merged.arguments.last, "--continue")
            let mergedSettings = object(merged.arguments[safe: 1])
            let mergedEnv = mergedSettings["env"] as? [String: String] ?? [:]
            c.equal("the user's other settings survive", ((mergedSettings["permissions"] as? [String: Any])?["allow"] as? [String]), ["Bash"])
            c.equal("the user's other variables survive", mergedEnv["KEEP"], "1")
            c.equal("the connection wins over the user's base URL", mergedEnv["ANTHROPIC_BASE_URL"], "http://127.0.0.1:11434")
            c.expect("the user's key, key helper and cloud switch are overridden",
                     mergedEnv["ANTHROPIC_API_KEY"] == "" && mergedEnv["CLAUDE_CODE_USE_BEDROCK"] == "0"
                        && mergedSettings["apiKeyHelper"] as? String == "")
            c.equal("the user's deny rules are kept, with web search once",
                    ((mergedSettings["permissions"] as? [String: Any])?["deny"] as? [String]), ["Read(./.env)", "WebSearch"])
            var equals = inputs(["--settings={}", "-p", "x"])
            equals.claudeUserSettings = [:]
            c.equal("the --settings=value spelling is replaced too",
                    try L.plan(.claude, equals).arguments.filter { $0.hasPrefix("--settings") }, ["--settings"])
            var broken = inputs()
            broken.claudeUserSettings = ["env": "not an object"]
            c.expect("a malformed env in the user's settings is named", failure(.claude, broken, "`env`"))
            var brokenPermissions = inputs()
            brokenPermissions.claudeUserSettings = ["permissions": ["WebSearch"]]
            c.expect("malformed permissions in the user's settings are named", failure(.claude, brokenPermissions, "`permissions`"))
        } catch { c.expect("Claude Code plans build", false, "\(error)") }
        c.expect("a window too small for Claude Code is refused with the fix",
                 failure(.claude, inputs(window: 16384), "--max-context 32768"))
        c.expect("a window too small for Codex is refused with the fix",
                 failure(.codex, inputs(window: 16384), "--max-context 32768"))
        c.expect("Pi and opencode work in 16,384 tokens",
                 (try? L.plan(.pi, inputs(window: 16384))) != nil && (try? L.plan(.opencode, inputs(window: 16384))) != nil)
        c.expect("a window too small for any tool is refused with the fix",
                 failure(.pi, inputs(window: 8192), "--max-context 16384"))

        // Codex.
        do {
            var i = inputs(["exec", "fix the tests"])
            i.codexVersion = "0.148.0"
            i.codexInstructions = "You are a coding agent running in the Codex CLI."
            let plan = try L.plan(.codex, i)
            let catalogPath = "/Users/me/.slotstream/launch/codex/catalog-0.148.0-32768.json"
            let connection = [
                "-c", #"model="qwen3.8-flash-next:4bit""#,
                "-c", #"model_provider="slotstream""#,
                "-c", "model_catalog_json=\"\(catalogPath)\"",
                "-c", #"model_providers.slotstream={name="Slotstream", base_url="http://127.0.0.1:11434/v1", wire_api="responses", stream_idle_timeout_ms=1800000}"#,
            ]
            c.equal("Codex gets its connection as -c settings on the command it runs", plan.arguments,
                    ["exec"] + connection + ["fix the tests"])
            // Codex ignores every -c above the deepest command that has its
            // own, so the connection and the user's settings both go there.
            func placed(_ user: [String]) -> [String] {
                var i = inputs(user)
                i.codexVersion = "0.148.0"
                i.codexInstructions = "x"
                return (try? L.plan(.codex, i).arguments) ?? []
            }
            let mine = ["-c", #"approval_policy="never""#]
            c.equal("no command: the connection comes first", placed(["fix it"]), connection + ["fix it"])
            c.equal("nothing at all: only the connection", placed([]), connection)
            c.equal("the user's own -c on exec stays after the connection",
                    placed(["exec"] + mine + ["-s", "workspace-write", "hi"]),
                    ["exec"] + connection + mine + ["-s", "workspace-write", "hi"])
            c.equal("a -c above the command moves down with the connection", placed(mine + ["exec", "hi"]),
                    ["exec"] + connection + mine + ["hi"])
            c.equal("attached -c forms move too", placed(["--config=a=1", "-cb=2", "e", "hi"]),
                    ["e"] + connection + ["--config=a=1", "-cb=2", "hi"])
            c.equal("a nested command gets the connection", placed(["exec", "--json", "resume", "--last"] + mine),
                    ["exec", "--json", "resume"] + connection + ["--last"] + mine)
            c.equal("a -c between the two commands moves below the nested one",
                    placed(["exec"] + mine + ["resume", "--last"]), ["exec", "resume"] + connection + mine + ["--last"])
            c.equal("an option's value is not a command", placed(["-m", "exec", "hi"]), connection + ["-m", "exec", "hi"])
            c.equal("-c's own value is not a command", placed(["-c", "exec", "hi"]), connection + ["-c", "exec", "hi"])
            c.equal("images take every word up to the next option", placed(["-i", "a.png", "exec", "hi"]),
                    connection + ["-i", "a.png", "exec", "hi"])
            c.equal("a word after -- is not a command", placed(["--", "exec"]), connection + ["--", "exec"])
            c.equal("help takes no settings", placed(["help", "exec"]), connection + ["help", "exec"])
            c.equal("the prompt ends the search for commands", placed(["exec", "review this", "resume"]),
                    ["exec"] + connection + ["review this", "resume"])
            c.equal("a dangling -c is kept", placed(["exec", "-c"]), ["exec"] + connection + ["-c"])
            c.equal("one catalog is written, keyed by Codex version and window", plan.files.map(\.path), [catalogPath])
            let entry = (object(plan.files.first?.contents)["models"] as? [[String: Any]])?.first ?? [:]
            c.equal("the catalog names this model", entry["slug"] as? String, "qwen3.8-flash-next:4bit")
            c.equal("the catalog declares apply_patch", entry["apply_patch_tool_type"] as? String, "freeform")
            c.equal("the catalog carries the served window",
                    [entry["context_window"] as? Int, entry["max_context_window"] as? Int], [32768, 32768])
            c.equal("the catalog carries Codex's own instructions", entry["base_instructions"] as? String, i.codexInstructions)
            c.expect("Codex needs no variables", plan.environment.isEmpty && plan.removedEnvironment.isEmpty)
            c.equal("the instructions come from the tag of the installed version", L.codexInstructionsURL(version: "0.148.0"),
                    "https://raw.githubusercontent.com/openai/codex/rust-v0.148.0/codex-rs/models-manager/prompt.md")
            var missing = inputs()
            missing.codexVersion = "0.148.0"
            c.expect("a plan without instructions is refused", failure(.codex, missing, "instructions"))
            func refused(_ user: [String], _ fragment: String) -> Bool {
                var i = inputs(user)
                i.codexVersion = "0.148.0"
                i.codexInstructions = "x"
                return failure(.codex, i, fragment)
            }
            c.expect("Codex Cloud is refused, since it runs on OpenAI's servers",
                     refused(["cloud", "exec", "fix it"], "codex cloud") && refused(["-c", "a=1", "cloud"], "codex cloud")
                        && L.codexRefusal(["cloud"]) != nil)
            c.expect("a prompt that says cloud is not Codex Cloud",
                     !refused(["exec", "cloud"], "codex cloud") && !refused(["--", "cloud"], "codex cloud"))
            c.expect("a JSON schema reply is refused with the reason",
                     refused(["exec", "--output-schema", "s.json", "hi"], "--output-schema")
                        && refused(["exec", "--output-schema=s.json", "hi"], "--output-schema")
                        && !refused(["exec", "--", "--output-schema"], "--output-schema"))
            c.expect("refusals come before the instructions are needed", L.codexRefusal(["exec", "--output-schema", "s"]) != nil
                     && failure(.codex, inputs(["cloud"]), "codex cloud"))
            c.equal("versions are read with their prerelease part",
                    ["codex-cli 0.148.0\n", "codex-cli 0.149.0-alpha.3", "codex 1.2.3-rc.1+build", "codex-cli dev"]
                        .map(L.codexVersion(fromOutput:)),
                    ["0.148.0", "0.149.0-alpha.3", "1.2.3-rc.1", nil])
            let prompt = "You are a coding agent running in the Codex CLI. " + String(repeating: "Be precise. ", count: 100)
            c.expect("Codex's instructions are recognized, and an error page or a stray file is not",
                     L.looksLikeCodexInstructions(prompt) && !L.looksLikeCodexInstructions("404: Not Found")
                        && !L.looksLikeCodexInstructions("<html>" + prompt)
                        && !L.looksLikeCodexInstructions(String(repeating: "x", count: 2000)))
        } catch { c.expect("Codex plans build", false, "\(error)") }
        c.equal("TOML strings are escaped", L.toml("a \"b\" c\\d\ne\u{1}"), #""a \"b\" c\\d\ne\u0001""#)

        // Pi.
        do {
            let fresh = try L.plan(.pi, inputs(["-p", "hi"]))
            c.equal("Pi gets the provider, the model and thinking off, then the user's arguments", fresh.arguments,
                    ["--provider", "slotstream", "--model", "qwen3.8-flash-next:4bit", "--thinking", "off", "-p", "hi"])
            c.equal("the models file is Pi's default one", fresh.files.map(\.path), ["/Users/me/.pi/agent/models.json"])
            let provider = (object(fresh.files.first?.contents)["providers"] as? [String: Any])?["slotstream"] as? [String: Any] ?? [:]
            c.equal("the provider points here over chat completions",
                    [provider["baseUrl"] as? String, provider["api"] as? String], ["http://127.0.0.1:11434/v1", "openai-completions"])
            c.equal("the provider has a placeholder key Pi requires", provider["apiKey"] as? String, "slotstream-local")
            c.equal("older servers are spared the store field", (provider["compat"] as? [String: Any])?["supportsStore"] as? Bool, false)
            c.equal("strict tool schemas, which the server refuses, are off",
                    (provider["compat"] as? [String: Any])?["supportsStrictMode"] as? Bool, false)
            c.expect("a dry run shows only the slotstream entry",
                     fresh.files.first?.preview?.contains("\"slotstream\"") == true
                        && fresh.files.first?.preview?.contains("stays as it is") == true)
            let model = (provider["models"] as? [[String: Any]])?.first ?? [:]
            c.equal("the model carries the served window and budget",
                    [model["contextWindow"] as? Int, model["maxTokens"] as? Int], [32768, 8192])
            c.expect("the model takes pictures and can think", (model["input"] as? [String]) == ["text", "image"]
                     && model["reasoning"] as? Bool == true)
            c.expect("the file ends with a newline", fresh.files.first?.contents.hasSuffix("\n") == true)

            var existing = inputs()
            existing.piModels = #"{"providers": {"ollama": {"baseUrl": "http://localhost:11434/v1", "api": "openai-completions", "models": [{"id": "llama3"}]}, "slotstream": {"baseUrl": "http://old"}}, "note": "kept"}"#
            let updated = object(try L.plan(.pi, existing).files.first?.contents)
            let providers = updated["providers"] as? [String: Any] ?? [:]
            c.equal("other providers are kept", providers.keys.sorted(), ["ollama", "slotstream"])
            c.equal("an old slotstream entry is replaced", (providers["slotstream"] as? [String: Any])?["baseUrl"] as? String,
                    "http://127.0.0.1:11434/v1")
            c.equal("other top-level entries are kept", updated["note"] as? String, "kept")
            c.expect("the note says the others are unchanged",
                     try L.plan(.pi, existing).files.first?.note?.contains("unchanged") == true)
            c.expect("a dry run does not show other providers",
                     try L.plan(.pi, existing).files.first?.preview?.contains("ollama") == false)

            // The file is the user's: its order, its numbers and its own
            // settings for this provider survive the edit.
            var written = inputs()
            written.piModels = #"{"z": 1.0, "providers": {"ollama": {"apiKey": "sk-o", "cost": {"input": 0.15, "big": 1e3}}, "slotstream": {"baseUrl": "http://old", "headers": {"X": "1"}, "compat": {"supportsStore": true, "other": 2}, "models": [{"id": "retired"}, {"id": "qwen3.8-flash-next:4bit", "name": "Mine", "contextWindow": 1, "maxTokens": 2}]}}, "a": "\u00e9\ud83d\ude00"}"#
            let text = try L.plan(.pi, written).files.first?.contents ?? ""
            c.expect("numbers keep their exact text", text.contains("\"z\": 1.0") && text.contains("\"input\": 0.15")
                     && text.contains("\"big\": 1e3"))
            let order = ["\"z\"", "\"providers\"", "\"a\""].compactMap { text.range(of: $0)?.lowerBound }
            c.expect("keys keep their order", order.count == 3 && order == order.sorted())
            let reread = object(text)
            let mine = (reread["providers"] as? [String: Any])?["slotstream"] as? [String: Any] ?? [:]
            let mineModels = mine["models"] as? [[String: Any]] ?? []
            c.equal("the user's other models for this provider are kept", mineModels.map { $0["id"] as? String },
                    ["retired", "qwen3.8-flash-next:4bit"])
            c.equal("the user's name for the model is kept, and the window follows the server",
                    [mineModels.last?["name"] as? String, (mineModels.last?["contextWindow"] as? Int).map { String($0) },
                     (mineModels.last?["maxTokens"] as? Int).map { String($0) }], ["Mine", "32768", "8192"])
            c.equal("the user's other settings for this provider are kept",
                    (mine["headers"] as? [String: String])?["X"], "1")
            c.expect("the settings the server needs win, and the user's other compat settings stay",
                     (mine["compat"] as? [String: Any])?["supportsStore"] as? Bool == false
                        && (mine["compat"] as? [String: Any])?["other"] as? Int == 2)
            c.equal("text survives, including escapes", reread["a"] as? String, "\u{E9}\u{1F600}")
            c.equal("a second launch leaves the file as the first one wrote it", try? L.piModels(existing: text, server: server), text)

            let chosen = try L.plan(.pi, inputs(["--model", "anthropic/claude", "--thinking", "high"]))
            c.equal("a model or thinking level the user names wins", chosen.arguments, ["--model", "anthropic/claude", "--thinking", "high"])
            c.equal("a model list the user names wins too", try L.plan(.pi, inputs(["--models", "a,b"])).arguments,
                    ["--thinking", "off", "--models", "a,b"])
            c.equal("the provider alone gets the model, which Pi needs to use it",
                    try L.plan(.pi, inputs(["--provider", "slotstream", "-p", "hi"])).arguments,
                    ["--model", "qwen3.8-flash-next:4bit", "--thinking", "off", "--provider", "slotstream", "-p", "hi"])
            c.expect("another provider without a model is refused with the reason",
                     failure(.pi, inputs(["--provider", "openai", "-p", "hi"]), "only together with `--model`"))
            let install = try L.plan(.pi, inputs(["install", "npm:foo"]))
            c.equal("Pi's own commands pass through untouched", install.arguments, ["install", "npm:foo"])
            c.expect("...without a note about the model", install.notes.isEmpty)
            c.equal("a command word later on is a prompt", try L.plan(.pi, inputs(["-p", "list"])).arguments.suffix(2), ["-p", "list"])
            let relocated = try L.plan(.pi, inputs(env: ["PI_CODING_AGENT_DIR": "/tmp/pi-agent"]))
            c.equal("PI_CODING_AGENT_DIR is honored", relocated.files.first?.path, "/tmp/pi-agent/models.json")
            var jsonc = inputs()
            jsonc.piModels = "{ // a comment\n \"providers\": {} }"
            c.expect("a models file that is not plain JSON is left alone", failure(.pi, jsonc, "left as it is"))
            var wrong = inputs()
            wrong.piModels = #"{"providers": []}"#
            c.expect("a providers entry that is not an object is left alone", failure(.pi, wrong, "not an object"))
            var empty = inputs()
            empty.piModels = "  \n"
            c.expect("an empty models file is filled", (try? L.plan(.pi, empty))?.files.count == 1)
        } catch { c.expect("Pi plans build", false, "\(error)") }

        // opencode.
        do {
            let plan = try L.plan(.opencode, inputs(["run", "hi"]))
            c.equal("opencode keeps the user's arguments", plan.arguments, ["run", "hi"])
            let config = object(plan.environment["OPENCODE_CONFIG_CONTENT"])
            let provider = (config["provider"] as? [String: Any])?["slotstream"] as? [String: Any] ?? [:]
            c.equal("the provider uses the OpenAI-compatible package", provider["npm"] as? String, "@ai-sdk/openai-compatible")
            c.equal("the provider points here", (provider["options"] as? [String: Any])?["baseURL"] as? String, "http://127.0.0.1:11434/v1")
            let limit = ((provider["models"] as? [String: Any])?["qwen3.8-flash-next:4bit"] as? [String: Any])?["limit"] as? [String: Any]
            c.equal("the model carries the served window and budget", [limit?["context"] as? Int, limit?["output"] as? Int], [32768, 8192])
            c.equal("the main and small models are this model",
                    [config["model"] as? String, config["small_model"] as? String],
                    ["slotstream/qwen3.8-flash-next:4bit", "slotstream/qwen3.8-flash-next:4bit"])
            c.expect("opencode's own files are not touched", plan.files.isEmpty)
            c.equal("only this provider is enabled, so nothing pinned elsewhere can run",
                    config["enabled_providers"] as? [String], ["slotstream"])
            c.equal("no disabled list can switch it off", (config["disabled_providers"] as? [String])?.count, 0)
            let agents = config["agent"] as? [String: Any] ?? [:]
            c.equal("the build and plan agents use this model even when the user's files name another",
                    ["build", "plan"].map { (agents[$0] as? [String: Any])?["model"] as? String },
                    ["slotstream/qwen3.8-flash-next:4bit", "slotstream/qwen3.8-flash-next:4bit"])
            let merged = try L.plan(.opencode, inputs(env: ["OPENCODE_CONFIG_CONTENT": #"{"provider":{"lmstudio":{"npm":"x"}},"theme":"dark","enabled_providers":["lmstudio"],"agent":{"build":{"model":"lmstudio/x","temperature":0.1},"review":{"model":"lmstudio/y"}}}"#]))
            let mergedConfig = object(merged.environment["OPENCODE_CONFIG_CONTENT"])
            c.equal("an exported inline configuration keeps its other providers",
                    ((mergedConfig["provider"] as? [String: Any]) ?? [:]).keys.sorted(), ["lmstudio", "slotstream"])
            c.equal("...and its other settings", mergedConfig["theme"] as? String, "dark")
            let mergedAgents = mergedConfig["agent"] as? [String: Any] ?? [:]
            c.expect("an exported agent keeps its settings but not its model",
                     (mergedAgents["build"] as? [String: Any])?["temperature"] as? Double == 0.1
                        && (mergedAgents["build"] as? [String: Any])?["model"] as? String == "slotstream/qwen3.8-flash-next:4bit"
                        && (mergedAgents["review"] as? [String: Any])?["model"] as? String == "lmstudio/y")
            c.equal("an exported provider list is replaced", mergedConfig["enabled_providers"] as? [String], ["slotstream"])
            c.expect("an exported inline configuration that is not JSON is refused",
                     failure(.opencode, inputs(env: ["OPENCODE_CONFIG_CONTENT": "theme=dark"]), "not a JSON object"))
        } catch { c.expect("opencode plans build", false, "\(error)") }

        // Hermes.
        do {
            c.expect("Hermes on a 32,768-token window is refused with the fix",
                     failure(.hermes, inputs(), "--max-context 65536"))
            let fresh = try L.plan(.hermes, inputs(window: 65536))
            c.equal("Hermes starts chat on this provider, pinned to its folder's own profile", fresh.arguments,
                    ["--profile", "default", "chat", "--provider", "slotstream", "--model", "qwen3.8-flash-next:4bit"])
            c.equal("Hermes gets its own home", fresh.environment["HERMES_HOME"], "/Users/me/.hermes-slotstream")
            c.equal("the guide's configuration is written when there is none", fresh.files.map(\.path),
                    ["/Users/me/.hermes-slotstream/config.yaml"])
            let yaml = fresh.files.first?.contents ?? ""
            let values = L.yamlScalars(yaml)
            c.equal("the configuration points here with the served window",
                    ["providers.slotstream.base_url", "model.context_length", "agent.reasoning_effort", "model.provider", "model.default"]
                        .map { values[$0] },
                    ["http://127.0.0.1:11434/v1", "65536", "none", "slotstream", "qwen3.8-flash-next:4bit"])
            c.expect("the model name is quoted in the YAML", yaml.contains(#"default: "qwen3.8-flash-next:4bit""#))
            c.equal("every Hermes side task is pinned to this model", L.hermesSideTasks.filter { values["auxiliary.\($0).provider"] != "main" }, [])
            c.equal("Hermes 0.21 has eighteen side tasks", L.hermesSideTasks.count, 18)
            c.equal("slow side tasks may wait for a cold prompt",
                    ["vision", "compression", "title_generation"].map { values["auxiliary.\($0).timeout"] }, ["1800", "1800", "1800"])
            var generated = inputs(window: 65536)
            generated.hermesConfig = yaml
            let again = try L.plan(.hermes, generated)
            c.expect("the written configuration passes its own checks with no notes but the model's",
                     again.files.isEmpty && again.notes.count == 1)
            var stale = inputs(window: 65536)
            stale.hermesConfig = yaml.replacingOccurrences(of: "context_length: 65536", with: "context_length: 131072")
            c.expect("a written window larger than the server's is refused with the fix",
                     failure(.hermes, stale, "context_length to 131072") && failure(.hermes, stale, "--max-context 131072"))
            var small = inputs(window: 65536)
            small.hermesConfig = yaml.replacingOccurrences(of: "context_length: 65536", with: "context_length: 32768  # mine")
            c.expect("a written window smaller than the server's gets a note",
                     (try? L.plan(.hermes, small))?.notes.contains { $0.contains("below the server's 65536-token window") } == true)
            var existing = inputs(["chat", "-q", "Read note.txt"], window: 65536)
            existing.hermesConfig = "model:\n  provider: slotstream\nproviders:\n  slotstream:\n    base_url: http://localhost:11434/v1\n"
            let kept = try L.plan(.hermes, existing)
            c.expect("an existing configuration is never rewritten", kept.files.isEmpty)
            c.equal("chat arguments keep their place", kept.arguments,
                    ["--profile", "default", "chat", "--provider", "slotstream", "--model", "qwen3.8-flash-next:4bit",
                     "-q", "Read note.txt"])
            c.expect("a localhost address for this port is accepted silently", !kept.notes.contains { $0.contains("does not point") })
            c.expect("a configuration without the side-task pins gets a note naming them",
                     kept.notes.contains { $0.contains("side tasks: vision, compression, title_generation, approval") })
            var elsewhere = inputs(["-z", "hi"], window: 65536)
            elsewhere.hermesConfig = "providers:\n  slotstream:\n    base_url: http://localhost:9999/v1\n"
            let top = try L.plan(.hermes, elsewhere)
            c.equal("top-level use gets the provider flags first", top.arguments,
                    ["--profile", "default", "--provider", "slotstream", "--model", "qwen3.8-flash-next:4bit", "-z", "hi"])
            c.expect("a configuration for another port gets a note", top.notes.contains { $0.contains("does not point at port 11434") })
            var other = inputs(window: 65536)
            other.hermesConfig = "model:\n  provider: openrouter\n"
            c.expect("a configuration without the provider is refused with the fix", failure(.hermes, other, "HERMES_HOME"))
            let named = try L.plan(.hermes, inputs(["chat", "-m", "other"], window: 65536))
            c.equal("a model the user names wins", named.arguments, ["--profile", "default", "chat", "-m", "other"])
            let profile = try L.plan(.hermes, inputs(["-p", "work", "chat"], window: 65536))
            c.equal("a profile the user names wins", profile.arguments,
                    ["-p", "work", "chat", "--provider", "slotstream", "--model", "qwen3.8-flash-next:4bit"])
            let profileHome = try L.plan(.hermes, inputs(env: ["HERMES_HOME": "/Users/me/.hermes/profiles/local"], window: 65536))
            c.equal("a HERMES_HOME that is a profile folder is used as it is", profileHome.arguments,
                    ["chat", "--provider", "slotstream", "--model", "qwen3.8-flash-next:4bit"])
            let scanned = L.yamlScalars("""
                # comment: ignored
                model:
                  provider: 'slotstream'   # mine
                  default: "a: b # c"
                list:
                  - item: 1
                auxiliary:
                  approval: {provider: main, timeout: 30}
                  vision:
                    provider: auto
                top: value
                """)
            c.equal("the YAML reader handles comments, quotes, lists and flow mappings",
                    ["model.provider", "model.default", "auxiliary.approval.provider", "auxiliary.approval.timeout",
                     "auxiliary.vision.provider", "top", "comment"].map { scanned[$0] },
                    ["slotstream", "a: b # c", "main", "30", "auto", "value", nil])
            let custom = try L.plan(.hermes, inputs(env: ["HERMES_HOME": "/tmp/hermes-test"], window: 65536))
            c.equal("HERMES_HOME is honored", custom.files.first?.path, "/tmp/hermes-test/config.yaml")
        } catch { c.expect("Hermes plans build", false, "\(error)") }
        return c.report()
    }
    /// The server launch starts, finds or restarts, and the activity that
    /// decides when that server stops by itself.
    static func launchServer() -> CheckReport {
        var c = CheckBuilder("launch-server")
        typealias L = CodingToolLaunch
        typealias B = L.BackgroundServer

        // Where its files go and how it is started.
        c.equal("the default port logs to serve.log", B.logPath(home: "/Users/me", port: 11434),
                "/Users/me/.slotstream/logs/serve.log")
        c.equal("another port logs to its own file", B.logPath(home: "/Users/me", port: 8080),
                "/Users/me/.slotstream/logs/serve-8080.log")
        c.equal("launch records its server per port", B.statePath(home: "/Users/me", port: 8080),
                "/Users/me/.slotstream/launch/server-8080.json")
        c.equal("launches that may start a server take a lock per port", B.startLockPath(home: "/Users/me", port: 8080),
                "/Users/me/.slotstream/launch/start-8080.lock")
        c.equal("prompt caches go to one folder", B.prefixCacheDirectory(home: "/Users/me"),
                "/Users/me/.slotstream/prefix-cache")
        c.equal("the default idle stop is 30 minutes", B.defaultIdleMinutes, 30)
        c.equal("the longest idle stop is a week", L.maximumIdleMinutes, 10_080)
        c.equal("a started server keeps the automatic window, caches on disk and stops when idle",
                B.serveArguments(port: 11434, window: nil, memoryGB: nil, idleMinutes: 30,
                                 prefixCacheDirectory: "/Users/me/.slotstream/prefix-cache"),
                ["serve", "--port", "11434", "--prefix-cache-dir", "/Users/me/.slotstream/prefix-cache",
                 "--idle-exit", "30"])
        c.equal("a window and a memory target are passed on; 0 keeps it running",
                B.serveArguments(port: 8080, window: 65536, memoryGB: 12.5, idleMinutes: 0, prefixCacheDirectory: "/c"),
                ["serve", "--port", "8080", "--max-context", "65536", "--memory-gb", "12.5", "--prefix-cache-dir", "/c"])
        c.equal("a fractional idle stop is written as typed", B.number(0.25), "0.25")
        for limit in [8.15, 9.99, 48.123456789, Double.greatestFiniteMagnitude] {
            let arguments = B.serveArguments(port: 8080, window: nil, memoryGB: nil, memoryLimitGB: limit,
                idleMinutes: 0, prefixCacheDirectory: "/c")
            let index = arguments.firstIndex(of: "--memory-limit-gb")!
            c.equal("child server receives the exact fractional ceiling \(limit)", Double(arguments[index + 1]), limit)
        }
        c.equal("an adaptive ceiling is forwarded without pinning the cache",
                B.serveArguments(port: 8080, window: nil, memoryGB: nil, memoryLimitGB: 48,
                    idleMinutes: 0, prefixCacheDirectory: "/c"),
                ["serve", "--port", "8080", "--memory-limit-gb", "48", "--prefix-cache-dir", "/c"])
        let adaptiveStatus = L.ServerStatus(pid: 123, port: 8080, contextWindow: 32768,
            activeRequests: 0, clients: 1, idleExitMinutes: 30, memorySource: "auto",
            memoryTargetGB: 20, memoryLimitGB: 48)
        c.equal("a busy server still honors its saved adaptive limit",
            L.memoryLimitNote(requested: 48, port: 8080, status: adaptiveStatus), nil)
        c.expect("a different adaptive limit is explained without replacing the server",
            L.memoryLimitNote(requested: 40, port: 8080, status: adaptiveStatus)?.contains("--memory-limit-gb 40 did not apply") == true)
        c.expect("an older server cannot silently claim the requested adaptive limit",
            L.memoryLimitNote(requested: 48, port: 8080, status: nil)?.contains("did not apply") == true)
        for tool in L.Tool.allCases {
            c.equal("\(tool.rawValue) fits the smallest automatic window, unless it is Hermes",
                    B.window(for: tool, automatic: ContextPolicy.defaultTokens), tool == .hermes ? 65536 : nil)
            c.equal("\(tool.rawValue) keeps a larger automatic window",
                    B.window(for: tool, automatic: 131_072), nil)
        }
        c.equal("the smallest automatic window is 32,768 tokens", ContextPolicy.automaticWindows.min(), ContextPolicy.defaultTokens)
        c.expect("the started message names the stop command, the port and the log",
                 B.startedMessage(port: 8080, log: "/l", idleMinutes: 30)
                    == "Slotstream is running in the background on port 8080. It stops 30 minutes after its last agent "
                    + "exits; `slotstream stop --port 8080` stops it sooner. Its log is /l.")
        c.expect("a server with no idle stop says so",
                 B.startedMessage(port: 11434, log: "/l", idleMinutes: 0).contains("It keeps running until `slotstream stop`."))
        c.expect("a dry run describes the server it would start",
                 B.wouldStartMessage(port: 11434, log: "/l", idleMinutes: 30).hasPrefix("It would keep its log in /l. It stops 30 minutes"))

        // What the server reports, read back by launch and stop.
        let quiet = ServerActivity.Snapshot(activeRequests: 0, clients: 0, idleSeconds: 12.34)
        let body = Server.statusBody(pid: 4242, port: 8080, version: "0.2.21", model: "m", contextWindow: 65536,
                                     startedAt: 1, activity: quiet, idleExitSeconds: 1800,
                                     memorySource: "--memory-gb", memoryTargetGB: 12)
        let wire = (try? JSONSerialization.data(withJSONObject: body))
            .flatMap { (try? JSONSerialization.jsonObject(with: $0)) as? [String: Any] } ?? [:]
        c.equal("the status the server sends is the status launch reads", L.ServerStatus.from(wire),
                L.ServerStatus(pid: 4242, port: 8080, contextWindow: 65536, activeRequests: 0, clients: 0, idleExitMinutes: 30,
                               memorySource: "--memory-gb", memoryTargetGB: 12))
        c.equal("idle time is reported to a tenth of a second", wire["idle_seconds"] as? Double, 12.3)
        let adaptiveBody = Server.statusBody(pid: 123, port: 8080, version: "v", model: "m", contextWindow: 32768,
            startedAt: 1, activity: .init(activeRequests: 0, clients: 1, idleSeconds: 0), idleExitSeconds: 1800,
            memorySource: "auto", memoryTargetGB: 20, memoryLimitGB: 48)
        let adaptiveWire = (try? JSONSerialization.data(withJSONObject: adaptiveBody))
            .flatMap { (try? JSONSerialization.jsonObject(with: $0)) as? [String: Any] } ?? [:]
        c.equal("adaptive ceiling survives the real status wire format", L.ServerStatus.from(adaptiveWire), adaptiveStatus)
        let noIdle = Server.statusBody(pid: 7, port: 1, version: "v", model: "m", contextWindow: 1, startedAt: 1,
                                       activity: quiet, idleExitSeconds: nil)
        let noIdleWire = (try? JSONSerialization.data(withJSONObject: noIdle))
            .flatMap { (try? JSONSerialization.jsonObject(with: $0)) as? [String: Any] } ?? [:]
        c.equal("a server that never stops by itself reports no idle stop",
                L.ServerStatus.from(noIdleWire)?.idleExitMinutes, nil)
        c.expect("a server with no plan to report reports none",
                 noIdleWire["memory_source"] is NSNull && L.ServerStatus.from(noIdleWire)?.memoryTargetGB == nil)

        // The note when --memory-gb meets a running server.
        func memory(_ source: String?, _ target: Double?) -> L.ServerStatus {
            L.ServerStatus(pid: 1, port: 8080, contextWindow: 32768, activeRequests: 0, clients: 0,
                           idleExitMinutes: 30, memorySource: source, memoryTargetGB: target)
        }
        c.equal("a server with the same target needs no note",
                L.memoryNote(requested: 12, port: 8080, status: memory("--memory-gb", 12)), nil)
        c.equal("a server with another target is named",
                L.memoryNote(requested: 11, port: 8080, status: memory("--memory-gb", 12.5)),
                "The server on port 8080 was already running with a 12.5 GB memory target, so --memory-gb 11 did not "
                    + "apply. Stop it with `slotstream stop --port 8080` and run this again to start one with that target.")
        c.expect("an automatic server is named as automatic",
                 L.memoryNote(requested: 12, port: 11434, status: memory("auto", 30))?
                    .hasPrefix("The server on port 11434 was already running with its memory target chosen automatically, "
                               + "so --memory-gb 12 did not apply. Stop it with `slotstream stop` ") == true)
        c.expect("a server that does not say still gets the note",
                 L.memoryNote(requested: 12, port: 11434, status: nil)?
                    .hasPrefix("The server on port 11434 was already running, so --memory-gb 12 did not apply.") == true
                 && L.memoryNote(requested: 12, port: 11434, status: memory("--pool-gb", nil)) != nil)
        var foreign = wire
        foreign["server"] = "ollama"
        c.equal("a status from another server is not read", L.ServerStatus.from(foreign), nil)
        for bad: Any in [0, -1, Int(Int32.max) + 1, "1"] {
            var odd = wire
            odd["pid"] = bad
            c.equal("a status with pid \(bad) is not read", L.ServerStatus.from(odd), nil)
        }
        let process = ProcessIdentity(pid: 99, startSeconds: 1_789_660_800, startMicroseconds: 250)
        let started = L.StartedServer(process: process, port: 8080, log: "/l")
        c.equal("what launch records reads back", L.StartedServer.from(started.json), started)
        let written = (try? JSONSerialization.data(withJSONObject: started.json))
            .flatMap { (try? JSONSerialization.jsonObject(with: $0)) as? [String: Any] } ?? [:]
        c.equal("and reads back from its file", L.StartedServer.from(written), started)
        c.equal("a record without a pid is ignored", L.StartedServer.from(["port": 1, "log": "/l"]), nil)
        var timeless = started.json
        timeless["started_seconds"] = nil
        c.equal("a record without the process's start time is ignored", L.StartedServer.from(timeless), nil)
        let answering = L.ServerStatus(pid: 99, port: 8080, contextWindow: 32768, activeRequests: 0, clients: 0,
                                       idleExitMinutes: 30)
        c.expect("the recorded server is the one answering", started.answers(answering, running: process))
        var reused = process
        reused.startMicroseconds += 1
        c.expect("a later process with the recorded id is not it", !started.answers(answering, running: reused))
        c.expect("an exited server is not it", !started.answers(answering, running: nil))
        var elsewhere = answering
        elsewhere.pid = 5
        c.expect("another process answering is not it", !started.answers(elsewhere, running: process))
        elsewhere = answering
        elsewhere.port = 8081
        c.expect("a server on another port is not it", !started.answers(elsewhere, running: process))
        c.expect("no status is not it", !started.answers(nil, running: process))

        // A running server whose window is too small.
        let small = L.Server(port: 8080, model: "m", contextWindow: 32768, maxOutputTokens: 8192)
        func status(pid: Int32 = 99, active: Int = 0, clients: Int = 0) -> L.ServerStatus {
            L.ServerStatus(pid: pid, port: 8080, contextWindow: 32768, activeRequests: active, clients: clients,
                           idleExitMinutes: 30)
        }
        func refusal(_ action: L.SmallWindow, _ fragment: String) -> Bool {
            if case .refuse(let failure) = action { return failure.message.contains(fragment) }
            return false
        }
        c.equal("an idle server launch started is restarted",
                L.smallWindow(tool: .hermes, server: small, status: status(), startedByLaunch: true), .restart(pid: 99))
        c.expect("a server launch did not start is left running",
                 refusal(L.smallWindow(tool: .hermes, server: small, status: status(pid: 5), startedByLaunch: false),
                         "was not started by `slotstream launch`, so it was left running")
                    && refusal(L.smallWindow(tool: .hermes, server: small, status: status(), startedByLaunch: false),
                               "`slotstream stop --port 8080`")
                    && refusal(L.smallWindow(tool: .hermes, server: small, status: nil, startedByLaunch: true),
                               "slotstream serve --max-context 65536"))
        c.expect("a started server another agent uses is left running",
                 refusal(L.smallWindow(tool: .hermes, server: small, status: status(clients: 1), startedByLaunch: true),
                         "still in use by another agent")
                    && refusal(L.smallWindow(tool: .hermes, server: small, status: status(active: 1), startedByLaunch: true),
                               "still in use by another agent"))
        c.expect("the refusal says what the tool needs and what the server has",
                 refusal(L.smallWindow(tool: .hermes, server: small, status: nil, startedByLaunch: false),
                         "Hermes needs a context window of at least 65536 tokens, and the server on port 8080 has 32768."))

        // Choosing the agent.
        let installed: [L.Tool] = [.claude, .codex, .hermes]
        c.equal("an empty answer takes the first agent", L.pickTool("\n", installed: installed), .claude)
        c.equal("a number picks from the list", L.pickTool(" 3 ", installed: installed), .hermes)
        c.equal("a name picks that agent", L.pickTool("Codex", installed: installed), .codex)
        c.equal("an alias picks that agent", L.pickTool("claude-code", installed: installed), .claude)
        for answer in ["0", "4", "-1", "pi", "vim"] {
            c.equal("'\(answer)' picks nothing", L.pickTool(answer, installed: installed), nil)
        }
        c.equal("nothing installed picks nothing", L.pickTool("", installed: []), nil)
        c.equal("the menu numbers the installed agents", L.pickerMenu(installed: [.claude, .pi]),
                "Which agent should Slotstream start?\n  1. Claude Code (slotstream launch claude)\n"
                    + "  2. Pi (slotstream launch pi)\n")

        // When the server may stop by itself.
        var now = 1000.0
        var running: [Int32: ProcessIdentity] = [:]
        let activity = ServerActivity(clock: { now }, identify: { running[$0] })
        now += 60
        c.equal("a new server is idle from its start", activity.snapshot().idleSeconds, 60)
        c.expect("a request starts", activity.begin())
        now += 3600
        c.equal("a running request is not idle time", activity.snapshot(),
                ServerActivity.Snapshot(activeRequests: 1, clients: 0, idleSeconds: 0))
        c.expect("a server with a running request does not stop", !activity.stopIfIdle(for: 1800))
        activity.end()
        now += 600
        c.equal("idle time counts from the last request's end", activity.snapshot().idleSeconds, 600)
        c.expect("an unknown process cannot keep the server running", !activity.register(pid: 77))
        running[77] = ProcessIdentity(pid: 77, startSeconds: 5, startMicroseconds: 1)
        c.expect("a running agent registers", activity.register(pid: 77))
        now += 7200
        c.equal("a registered agent that runs is not idle time", activity.snapshot(),
                ServerActivity.Snapshot(activeRequests: 0, clients: 1, idleSeconds: 0))
        c.expect("a server with a running agent does not stop", !activity.stopIfIdle(for: 1800))
        running[77] = ProcessIdentity(pid: 77, startSeconds: 9, startMicroseconds: 0)
        now += 10
        c.equal("another process with the agent's id is not the agent", activity.snapshot(),
                ServerActivity.Snapshot(activeRequests: 0, clients: 0, idleSeconds: 0))
        now += 1799
        c.expect("idle time counts from the agent's exit", !activity.stopIfIdle(for: 1800))
        now += 1
        c.expect("the server stops after the idle time", activity.stopIfIdle(for: 1800))
        c.expect("a stopping server takes no new request", !activity.begin())
        c.equal("a refused request is not counted", activity.snapshot().activeRequests, 0)
        c.expect("status checks are not use; every other request is",
                 !Server.countsAsActivity("/slotstream/status") && !Server.countsAsActivity("/slotstream/status?x=1")
                    && Server.countsAsActivity("/v1/models") && Server.countsAsActivity("/slotstream/clients")
                    && Server.countsAsActivity("/"))
        c.expect("the stopping refusal says what to do", Server.stoppingMessage.contains("run `slotstream launch`"))

        // Registering a process over HTTP.
        var registered: [Int32: ProcessIdentity] = [:]
        let clients = ServerActivity(clock: { now }, identify: { registered[$0] })
        registered[42] = ProcessIdentity(pid: 42, startSeconds: 1, startMicroseconds: 2)
        let accepted = Server.registerClient(["pid": 42], activity: clients)
        c.expect("a running process is registered and counted",
                 accepted.status == "200 OK" && accepted.body["clients"] as? Int == 1)
        let unknown = Server.registerClient(["pid": 43], activity: clients)
        c.expect("an unknown process is refused by id",
                 unknown.status == "400 Bad Request"
                    && unknown.body["error"] as? String == "no running process 43 of this user")
        for bad: Any in [0, -1, Int(Int32.max) + 1, "42", 42.5, true, NSNull()] {
            let refused = Server.registerClient(["pid": bad], activity: clients)
            c.expect("pid \(bad) is refused", refused.status == "400 Bad Request"
                        && refused.body["error"] as? String == "pid must be a positive process id")
        }
        c.expect("a body without a pid is refused",
                 Server.registerClient([:], activity: clients).status == "400 Bad Request")
        c.equal("refusals register nothing", clients.snapshot().clients, 1)

        // The model lock launch tests before it starts a server.
        let lockPath = NSTemporaryDirectory() + "slotstream-launch-check-\(getpid()).lock"
        setenv("SLOTSTREAM_MODEL_LOCK_PATH", lockPath, 1)
        defer {
            unsetenv("SLOTSTREAM_MODEL_LOCK_PATH")
            try? FileManager.default.removeItem(atPath: lockPath)
        }
        FileManager.default.createFile(atPath: lockPath, contents: nil)
        c.expect("a free model lock is not held by another process", !ModelProcessGuard.heldByAnotherProcess())
        let held = open(lockPath, O_RDWR)
        c.expect("a lock held through another open file is seen as held",
                 held >= 0 && flock(held, LOCK_EX | LOCK_NB) == 0 && ModelProcessGuard.heldByAnotherProcess())
        if held >= 0 {
            flock(held, LOCK_UN)
            close(held)
        }
        c.expect("and free again once it is released", !ModelProcessGuard.heldByAnotherProcess())
        c.expect("a lock file that does not exist is not held",
                 { setenv("SLOTSTREAM_MODEL_LOCK_PATH", lockPath + ".missing", 1)
                   defer { setenv("SLOTSTREAM_MODEL_LOCK_PATH", lockPath, 1) }
                   return !ModelProcessGuard.heldByAnotherProcess() }())

        // The process facts it relies on, on this Mac.
        let me = ProcessIdentity.of(getpid())
        c.expect("this process is running", me != nil && me == ProcessIdentity.of(getpid()))
        c.expect("no process has id 0 or a negative id", ProcessIdentity.of(0) == nil && ProcessIdentity.of(-5) == nil)
        c.expect("this process's executable is found",
                 ProcessIdentity.executablePath(getpid()).map { FileManager.default.isExecutableFile(atPath: $0) } == true)
        c.expect("another user's process does not count", ProcessIdentity.of(1) == nil)
        var child = pid_t()
        let argv: [UnsafeMutablePointer<CChar>?] = [strdup("/usr/bin/true"), nil]
        defer { argv.forEach { free($0) } }
        if posix_spawn(&child, "/usr/bin/true", nil, nil, argv, nil) == 0 {
            // Exited but not yet collected: a zombie still has its id.
            let deadline = Date().addingTimeInterval(5)
            while ProcessIdentity.of(child) != nil, Date() < deadline { usleep(10_000) }
            c.expect("an exited process awaiting collection does not count",
                     ProcessIdentity.of(child) == nil && kill(child, 0) == 0)
            var result: Int32 = 0
            waitpid(child, &result, 0)
        } else {
            c.expect("a child process starts", false)
        }
        return c.report()
    }
}

private extension Array {
    subscript(safe index: Int) -> Element? { indices.contains(index) ? self[index] : nil }
}
