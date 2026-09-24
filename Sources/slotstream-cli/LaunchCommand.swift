import ArgumentParser
import Foundation
import Slotstream

/// `slotstream launch <tool>`: find the server, or start one in the
/// background, write the few settings the tool needs, and replace this process
/// with the tool. The plan itself is `CodingToolLaunch`; this file is the input
/// and output around it.
struct Launch: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "launch",
        abstract: "Start a coding agent connected to Slotstream",
        discussion: """
            Tools: claude (Claude Code), codex, pi, opencode and hermes. Without a tool name, \
            launch lists the ones installed and asks which to start.

            When no server answers on the port, launch starts `slotstream serve` in the \
            background, with the window the tool needs, prompt caches kept on disk in \
            ~/.slotstream/prefix-cache, and its log in ~/.slotstream/logs. That server keeps \
            running while any agent launch opened is running, stops 30 minutes (--idle-exit) \
            after the last one exits, and stops at once with `slotstream stop`. A server you \
            started yourself is used as it is.

            Launch options go before the tool name. Everything after the tool name goes to the tool, \
            so `slotstream launch codex exec "fix the tests"` runs `codex exec "fix the tests"`.

            Your usual settings for these tools are left alone. Codex and Claude Code get their \
            connection for this run only, opencode through OPENCODE_CONFIG_CONTENT, and Hermes through \
            its own folder, ~/.hermes-slotstream. Pi reads providers only from its models file, so a \
            `slotstream` entry is set in ~/.pi/agent/models.json. Codex also needs a model catalog, \
            kept in ~/.slotstream/launch; the first launch with each Codex version downloads that \
            version's instructions from GitHub.
            """)

    @Option(help: "The port the server listens on.")
    var port: UInt16 = 11434

    @Option(name: .customLong("memory-gb"),
            help: "Memory target for a server launch starts, in GB, as `serve --memory-gb`. Default: automatic.")
    var memoryGB: Double?

    @Option(name: .customLong("memory-limit-gb"),
            help: "Adaptive memory ceiling for a server launch starts, in GB, as `serve --memory-limit-gb`.")
    var memoryLimitGB: Double?

    @Option(name: .customLong("idle-exit"),
            help: "Minutes a server launch starts keeps running after its last agent exits; 0 keeps it running.")
    var idleExit = CodingToolLaunch.BackgroundServer.defaultIdleMinutes

    @Flag(name: .customLong("no-start"), help: "Use a running server only; never start or restart one.")
    var noStart = false

    @Flag(name: .customLong("dry-run"),
          help: "Print the settings and command without starting a server, writing files or starting the tool.")
    var dryRun = false

    @Argument(help: "The tool to start: claude, codex, pi, opencode, or hermes.")
    var tool: String?

    @Argument(parsing: .captureForPassthrough, help: "Arguments passed to the tool.")
    var toolArguments: [String] = []

    func run() throws {
        do {
            try launch()
        } catch let failure as CodingToolLaunch.Failure {
            Self.say("slotstream launch: \(failure.message)")
            throw ExitCode.failure
        }
    }

    private func launch() throws {
        if let memoryGB, !(memoryGB.isFinite && memoryGB > 0) {
            throw CodingToolLaunch.Failure("--memory-gb must be a positive number of GB")
        }
        if let limit = memoryLimitGB {
            guard limit.isFinite, limit >= Planner.minMemoryGB else {
                throw CodingToolLaunch.Failure("--memory-limit-gb must be finite and at least \(Planner.minMemoryGB) GB")
            }
            guard memoryGB == nil else {
                throw CodingToolLaunch.Failure("--memory-limit-gb cannot be combined with --memory-gb")
            }
        }
        guard idleExit.isFinite, idleExit >= 0, idleExit <= CodingToolLaunch.maximumIdleMinutes else {
            throw CodingToolLaunch.Failure(
                "--idle-exit must be between 0 and \(Int(CodingToolLaunch.maximumIdleMinutes)) minutes")
        }
        let environment = ProcessInfo.processInfo.environment
        // $HOME first, as the tools themselves resolve it.
        let home = environment["HOME"].flatMap { $0.isEmpty ? nil : $0 }
            ?? FileManager.default.homeDirectoryForCurrentUser.path
        let path = environment["PATH"] ?? ""
        let tool = try chooseTool(path: path)
        guard let executable = Self.find(tool.executable, path: path) else {
            throw CodingToolLaunch.Failure("`\(tool.executable)` is not on your PATH. \(tool.installHint), then run this again.")
        }

        let port = Int(self.port)
        // From here until the tool starts, a second launch that might start
        // a server on this port waits, and then finds this one's server.
        if !dryRun && !noStart { try Self.lockStart(home: home, port: port) }
        let started = Self.startedServer(home: home, port: port)
        var server: CodingToolLaunch.Server
        /// The log of a server running in the background, when launch knows it.
        var background: String?
        var pending: [String] = []
        /// The server to start once the plan holds; a dry run and a running
        /// server that fits leave it as nil.
        var start: PendingStart?
        switch try Self.probe(port: port) {
        case .noAnswer:
            guard !noStart else {
                throw CodingToolLaunch.Failure("no Slotstream server answered on port \(port). "
                    + "Start it in another Terminal window with `\(Self.serveCommand(tool: tool, port: port))` "
                    + "and run this again, or run this without --no-start and launch starts one.")
            }
            let lines: [String]
            (server, lines) = expectedServer(tool: tool, home: home, port: port)
            if dryRun { pending = lines } else { start = PendingStart() }
        case .answered(let running):
            server = running
            let status = Self.status(port: port)
            let ours = started?.answers(status, running: status.flatMap { ProcessIdentity.of($0.pid) }) ?? false
            if ours { background = started?.log }
            if running.contextWindow < tool.minimumContext {
                switch CodingToolLaunch.smallWindow(tool: tool, server: running, status: status, startedByLaunch: ours) {
                case .refuse(let failure):
                    throw failure
                case .restart(let pid):
                    guard !noStart else {
                        throw CodingToolLaunch.Failure("\(tool.displayName) needs a context window of at least "
                            + "\(tool.minimumContext) tokens, and the server on port \(port) has "
                            + "\(running.contextWindow). Run this without --no-start to restart it with that window.")
                    }
                    let why = "the server `slotstream launch` started on port \(port) has a "
                        + "\(running.contextWindow)-token window and \(tool.displayName) needs \(tool.minimumContext)"
                    if dryRun {
                        pending.append("Would restart it with that window: \(why).")
                    } else {
                        start = PendingStart(window: tool.minimumContext, replacing: (pid, why))
                    }
                    server.contextWindow = tool.minimumContext
                    server.maxOutputTokens = GatewayDialect.outputBudget(contextCap: tool.minimumContext)
                }
            } else if let memoryLimitGB, let note = CodingToolLaunch.memoryLimitNote(requested: memoryLimitGB, port: port, status: status) {
                Self.say(note)
            } else if let memoryGB, let note = CodingToolLaunch.memoryNote(requested: memoryGB, port: port, status: status) {
                Self.say(note)
            }
            try Self.checkProtocols(server: running, tool: tool)
        }

        var inputs = CodingToolLaunch.Inputs(server: server, arguments: toolArguments, environment: environment, home: home)
        switch tool {
        case .codex:
            if let refusal = CodingToolLaunch.codexRefusal(toolArguments) { throw refusal }
            let version = try Self.codexVersion(executable)
            inputs.codexVersion = version
            if let text = try Self.codexInstructions(version: version, home: home, download: !dryRun) {
                inputs.codexInstructions = text
            } else {
                // A dry run fetches nothing; the catalog it describes holds
                // the instructions a real launch downloads once.
                inputs.codexInstructions = "(Codex \(version)'s instructions)"
                pending.append("Would download the instructions Codex \(version) ships, once, from "
                    + CodingToolLaunch.codexInstructionsURL(version: version))
            }
        case .pi:
            inputs.piModels = try Self.readIfPresent(CodingToolLaunch.piModelsPath(environment: environment, home: home))
        case .hermes:
            inputs.hermesConfig = try Self.readIfPresent(
                CodingToolLaunch.hermesHome(environment: environment, home: home) + "/config.yaml")
        case .claude:
            inputs.claudeUserSettings = try Self.claudeSettings(toolArguments)
        case .opencode:
            break
        }
        // Planned first with the server as it will be, so a setting the tool
        // cannot use stops the launch before a server spends minutes starting.
        var plan = try CodingToolLaunch.plan(tool, inputs)
        if let start {
            if let old = start.replacing {
                Self.say("Restarting Slotstream: \(old.reason).")
                try Self.stopServer(pid: old.pid, port: port)
            }
            server = try startServer(tool: tool, window: start.window, home: home, port: port)
            background = CodingToolLaunch.BackgroundServer.logPath(home: home, port: port)
            try Self.checkProtocols(server: server, tool: tool)
            inputs.server = server
            plan = try CodingToolLaunch.plan(tool, inputs)
        }

        if dryRun {
            for line in pending where !line.hasPrefix("Would download") { print(line) }
            let shown = plan.arguments.map { CodingToolLaunch.redacted($0) }
            print("Would run: " + ([executable] + shown).map(Self.shellQuoted).joined(separator: " "))
            if !plan.environment.isEmpty {
                print("With these variables:")
                for key in plan.environment.keys.sorted() {
                    print("  \(key)=\(Self.shellQuoted(CodingToolLaunch.redacted(plan.environment[key]!)))")
                }
            }
            if !plan.removedEnvironment.isEmpty {
                print("Without: " + plan.removedEnvironment.joined(separator: ", "))
            }
            for line in pending where line.hasPrefix("Would download") { print(line) }
            for file in plan.files {
                if tool == .codex {
                    print("Would write \(file.path)")
                    continue
                }
                print("Would write \(file.path) (\(file.contents.utf8.count) bytes)")
                let shown = file.preview ?? file.contents
                print(shown, terminator: shown.hasSuffix("\n") ? "" : "\n")
            }
            for note in plan.notes { print(note) }
            return
        }

        for file in plan.files {
            try Self.write(file)
            if let note = file.note { Self.say(note) }
        }
        for note in plan.notes { Self.say(note) }
        // The server stays while this process, which becomes the tool, runs.
        Self.register(port: port)
        let progress = background.map { "`tail -f \($0)` shows its progress" } ?? "the server window shows its progress"
        Self.say("Starting \(tool.displayName). Its first reply reads the whole prompt; \(progress).")
        try Self.exec(executable, arguments: plan.arguments, environment: environment,
                      set: plan.environment, remove: plan.removedEnvironment)
    }

    static func say(_ line: String) {
        FileHandle.standardError.write(Data((line + "\n").utf8))
    }

    // MARK: Choosing the tool

    private func chooseTool(path: String) throws -> CodingToolLaunch.Tool {
        if let name = tool {
            guard let tool = CodingToolLaunch.Tool(name: name) else {
                throw CodingToolLaunch.Failure("unknown tool '\(name)'; choose claude, codex, pi, opencode, or hermes")
            }
            return tool
        }
        let installed = CodingToolLaunch.Tool.allCases.filter { Self.find($0.executable, path: path) != nil }
        guard !installed.isEmpty else {
            throw CodingToolLaunch.Failure("none of the agents launch starts is on your PATH. "
                + CodingToolLaunch.Tool.allCases.map(\.installHint).joined(separator: ". ") + ".")
        }
        let names = installed.map(\.rawValue).joined(separator: ", ")
        guard isatty(0) == 1, isatty(2) == 1 else {
            throw CodingToolLaunch.Failure("name the agent to start, for example `slotstream launch \(installed[0].rawValue)`. "
                + "Installed: \(names).")
        }
        FileHandle.standardError.write(Data((CodingToolLaunch.pickerMenu(installed: installed)
            + "Number or name [1]: ").utf8))
        let answer = readLine() ?? ""
        guard let chosen = CodingToolLaunch.pickTool(answer, installed: installed) else {
            throw CodingToolLaunch.Failure("'\(answer.trimmingCharacters(in: .whitespacesAndNewlines))' is not one of "
                + "the installed agents: \(names)")
        }
        return chosen
    }

    // MARK: Server

    /// A server launch starts, with the window it asks for (nil: automatic, or
    /// what the tool needs) and the launch-started server it replaces.
    private struct PendingStart {
        var window: Int?
        var replacing: (pid: Int32, reason: String)?
    }

    enum Probe {
        case noAnswer
        case answered(CodingToolLaunch.Server)
    }

    static func serveCommand(tool: CodingToolLaunch.Tool, port: Int) -> String {
        (tool == .hermes ? "slotstream serve --max-context 65536" : "slotstream serve")
            + (port == 11434 ? "" : " --port \(port)")
    }

    /// What answers on the port. Nothing is `.noAnswer`; anything but a Slotstream
    /// server that can take a request is a failure naming what is there.
    static func probe(port: Int) throws -> Probe {
        let origin = "http://127.0.0.1:\(port)"
        let otherPort = "Stop it, or use another port with --port."
        guard var models = request("GET", origin + "/v1/models", direct: true) else { return .noAnswer }
        // A server on its way out answers 503 until the process exits. Wait
        // for the port rather than calling it busy or racing it for the port.
        if models.status == 503, Self.isStopping(models.body) {
            let deadline = Date().addingTimeInterval(20)
            while Date() < deadline {
                Thread.sleep(forTimeInterval: 0.25)
                guard let again = request("GET", origin + "/v1/models", direct: true) else { return .noAnswer }
                models = again
                if again.status != 503 || !Self.isStopping(again.body) { break }
            }
            if models.status == 503, Self.isStopping(models.body) {
                throw CodingToolLaunch.Failure("the server on port \(port) is still stopping. "
                    + "Run this again in a moment, and launch starts one.")
            }
        }
        guard models.status == 200 else {
            if models.status == 503 {
                throw CodingToolLaunch.Failure("the server on port \(port) is busy: every connection it takes is in use. "
                    + "Wait for the running requests to finish, and run this again.")
            }
            throw CodingToolLaunch.Failure("the server on port \(port) answered HTTP \(models.status) when asked for its model, "
                + "so it is not a Slotstream server this launcher can use. " + otherPort)
        }
        guard let json = (try? JSONSerialization.jsonObject(with: models.body)) as? [String: Any],
              let server = CodingToolLaunch.Server.from(models: json, port: port) else {
            throw CodingToolLaunch.Failure("the server on port \(port) is not Slotstream. " + otherPort)
        }
        return .answered(server)
    }

    /// Hold the lock that makes launches on this port take turns starting a
    /// server. It is released when this process exits or becomes the tool,
    /// and the server never inherits it.
    static func lockStart(home: String, port: Int) throws {
        let path = CodingToolLaunch.BackgroundServer.startLockPath(home: home, port: port)
        do {
            try FileManager.default.createDirectory(atPath: (path as NSString).deletingLastPathComponent,
                                                    withIntermediateDirectories: true,
                                                    attributes: [.posixPermissions: 0o700])
        } catch {
            throw CodingToolLaunch.Failure("could not create the folder for \(path): \(error.localizedDescription)")
        }
        let fd = open(path, O_RDWR | O_CREAT | O_CLOEXEC, 0o600)
        guard fd >= 0 else {
            throw CodingToolLaunch.Failure("could not open \(path): \(String(cString: strerror(errno)))")
        }
        if flock(fd, LOCK_EX | LOCK_NB) == 0 { return }
        guard errno == EWOULDBLOCK else {
            throw CodingToolLaunch.Failure("could not lock \(path): \(String(cString: strerror(errno)))")
        }
        say("Waiting for another `slotstream launch` on port \(port) to finish starting.")
        while flock(fd, LOCK_EX) != 0 {
            guard errno == EINTR else {
                throw CodingToolLaunch.Failure("could not lock \(path): \(String(cString: strerror(errno)))")
            }
        }
    }

    /// Whether a 503 is the refusal of a server that has decided to stop.
    static func isStopping(_ body: Data) -> Bool {
        let error = ((try? JSONSerialization.jsonObject(with: body)) as? [String: Any])?["error"] as? String
        return error == Server.stoppingMessage
    }

    /// `/slotstream/status`; nil from a server older than it.
    static func status(port: Int) -> CodingToolLaunch.ServerStatus? {
        guard let answer = request("GET", "http://127.0.0.1:\(port)/slotstream/status", direct: true),
              answer.status == 200,
              let json = (try? JSONSerialization.jsonObject(with: answer.body)) as? [String: Any] else { return nil }
        return CodingToolLaunch.ServerStatus.from(json)
    }

    /// The server launch started on this port, as it recorded it.
    static func startedServer(home: String, port: Int) -> CodingToolLaunch.StartedServer? {
        let path = CodingToolLaunch.BackgroundServer.statePath(home: home, port: port)
        guard let data = FileManager.default.contents(atPath: path),
              let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any] else { return nil }
        return CodingToolLaunch.StartedServer.from(json)
    }

    /// The APIs each tool needs, which older servers lack.
    static func checkProtocols(server: CodingToolLaunch.Server, tool: CodingToolLaunch.Tool) throws {
        let port = server.port
        let origin = server.origin
        switch tool {
        case .claude:
            // Claude Code speaks the Anthropic Messages API, which older
            // servers do not have; the token count is the cheapest request
            // that proves it is there.
            let probe = try JSONSerialization.data(withJSONObject: [
                "model": server.model, "messages": [["role": "user", "content": "hi"]],
            ])
            guard let counted = request("POST", origin + "/v1/messages/count_tokens", body: probe, direct: true) else {
                throw CodingToolLaunch.Failure("the server on port \(port) stopped answering. Check its log or window, and run this again.")
            }
            if counted.status == 503 {
                throw CodingToolLaunch.Failure("the server on port \(port) is busy: every connection it takes is in use. "
                    + "Wait for the running requests to finish, and run this again.")
            }
            guard counted.status == 200 else {
                throw CodingToolLaunch.Failure("the server on port \(port) does not have the Anthropic Messages API "
                    + "Claude Code needs. Update Slotstream with the install command, restart the server, and run this again.")
            }
        case .codex:
            // Codex speaks the Responses API, added in 0.2.20.
            if let answer = request("GET", origin + "/api/version", direct: true), answer.status == 200,
               let version = ((try? JSONSerialization.jsonObject(with: answer.body)) as? [String: Any])?["version"] as? String,
               compareVersions(version, "0.2.20") == .orderedAscending {
                throw CodingToolLaunch.Failure("the server is Slotstream \(version), and Codex needs 0.2.20 or later. "
                    + "Update Slotstream with the install command and restart the server.")
            }
        case .pi, .opencode, .hermes:
            break
        }
    }

    /// Keep the server running while this process, soon the tool, runs.
    /// A server older than the registry ignores it, as a manual one may.
    static func register(port: Int) {
        guard let body = try? JSONSerialization.data(withJSONObject: ["pid": Int(getpid())]) else { return }
        _ = request("POST", "http://127.0.0.1:\(port)/slotstream/clients", body: body, direct: true)
    }

    /// The server launch would start, as the plan sees it, and the lines a dry
    /// run shows for it.
    private func expectedServer(tool: CodingToolLaunch.Tool, home: String,
                              port: Int) -> (CodingToolLaunch.Server, [String]) {
        var lines: [String] = []
        var automatic = ContextPolicy.defaultTokens
        if let model = try? modelOptions() {
            if model.weightsMissing() {
                lines.append(String(format: "Would ask to download %@ (%.1f GB) first.",
                    PinnedModel.name, Double(PinnedModel.totalBytes) / 1e9))
            } else if let window = try? model.automaticWindow() {
                automatic = window
            }
        }
        let requested = CodingToolLaunch.BackgroundServer.window(for: tool, automatic: automatic)
        let window = requested ?? automatic
        let arguments = CodingToolLaunch.BackgroundServer.serveArguments(port: port, window: requested,
            memoryGB: memoryGB, memoryLimitGB: memoryLimitGB, idleMinutes: idleExit,
            prefixCacheDirectory: CodingToolLaunch.BackgroundServer.prefixCacheDirectory(home: home))
        lines.append("Would start a Slotstream server in the background: "
            + (["slotstream"] + arguments).map(Self.shellQuoted).joined(separator: " "))
        lines.append("  " + CodingToolLaunch.BackgroundServer.wouldStartMessage(port: port,
            log: CodingToolLaunch.BackgroundServer.logPath(home: home, port: port), idleMinutes: idleExit))
        let server = CodingToolLaunch.Server(port: port, model: PinnedModel.name, contextWindow: window,
            maxOutputTokens: GatewayDialect.outputBudget(contextCap: window))
        return (server, lines)
    }

    private func modelOptions() throws -> ModelOptions {
        let fixed = memoryGB.map { ["--memory-gb", CodingToolLaunch.BackgroundServer.number($0)] } ?? []
        let adaptive = memoryLimitGB.map { ["--memory-limit-gb", CodingToolLaunch.BackgroundServer.number($0)] } ?? []
        return try ModelOptions.parse(fixed + adaptive)
    }

    /// Start `slotstream serve` in the background and wait until it answers.
    /// A nil window keeps the automatic one unless the tool needs more.
    private func startServer(tool: CodingToolLaunch.Tool, window requested: Int?, home: String,
                             port: Int) throws -> CodingToolLaunch.Server {
        if ModelProcessGuard.heldByAnotherProcess() {
            throw CodingToolLaunch.Failure("another Slotstream model process is running for this user: a server on "
                + "another port, `slotstream run`, or a check. Only one fits in memory. Stop it, or pass that "
                + "server's port with --port.")
        }
        var window = requested
        do {
            let model = try modelOptions()
            // The download asks first, and fails with the command when there
            // is no terminal to ask on.
            if model.weightsMissing() { try model.ensureWeights() }
            if window == nil, tool.minimumContext > ContextPolicy.defaultTokens {
                window = CodingToolLaunch.BackgroundServer.window(for: tool, automatic: try model.automaticWindow())
            }
        } catch let failure as CodingToolLaunch.Failure {
            throw failure
        } catch {
            throw CodingToolLaunch.Failure("\(error)")
        }
        let log = CodingToolLaunch.BackgroundServer.logPath(home: home, port: port)
        let arguments = CodingToolLaunch.BackgroundServer.serveArguments(port: port, window: window,
            memoryGB: memoryGB, memoryLimitGB: memoryLimitGB, idleMinutes: idleExit,
            prefixCacheDirectory: CodingToolLaunch.BackgroundServer.prefixCacheDirectory(home: home))
        say("Starting Slotstream in the background: "
            + (["slotstream"] + arguments).map(Self.shellQuoted).joined(separator: " "))
        let executable = try Self.ownExecutable()
        // Control-C from here until the server answers stops the server too.
        let statePath = CodingToolLaunch.BackgroundServer.statePath(home: home, port: port)
        let starting = StartingServer()
        signal(SIGINT, SIG_IGN)
        let interrupt = DispatchSource.makeSignalSource(signal: SIGINT, queue: .global())
        interrupt.setEventHandler {
            if let pid = starting.interrupt() {
                kill(pid, SIGTERM)
                // The start holds the lock on this port, so the record is this
                // server's, or older and stale.
                unlink(statePath)
            }
            Self.say("\nslotstream launch: stopped the server it was starting.")
            _exit(130)
        }
        interrupt.resume()
        defer {
            interrupt.cancel()
            signal(SIGINT, SIG_DFL)
        }
        // The record is written before the Control-C handler can see the
        // process, so the handler never races the write.
        let pid = try starting.spawn {
            let pid = try Self.spawnInBackground(executable, arguments: arguments, log: log)
            // A server that already exited leaves nothing to record; the wait
            // below says why it stopped.
            guard let process = ProcessIdentity.of(pid) else { return pid }
            do {
                try Self.write(CodingToolLaunch.FileWrite(path: statePath, contents: String(decoding:
                    try JSONSerialization.data(withJSONObject:
                        CodingToolLaunch.StartedServer(process: process, port: port, log: log).json,
                        options: [.sortedKeys, .withoutEscapingSlashes]),
                    as: UTF8.self) + "\n"))
            } catch {
                kill(pid, SIGTERM)
                throw error
            }
            return pid
        }
        do {
            try Self.waitUntilReady(pid: pid, port: port, log: log)
        } catch {
            // A server that stopped leaves a stale record; one still starting
            // keeps it, so `slotstream stop` finds it.
            if ProcessIdentity.of(pid) == nil { unlink(statePath) }
            throw error
        }
        guard case .answered(let server) = try Self.probe(port: port) else {
            throw CodingToolLaunch.Failure("the server started but stopped answering. Its log is \(log).")
        }
        say(CodingToolLaunch.BackgroundServer.startedMessage(port: port, log: log, idleMinutes: idleExit))
        return server
    }

    private func say(_ line: String) { Self.say(line) }

    static func ownExecutable() throws -> String {
        if let path = Bundle.main.executablePath, FileManager.default.isExecutableFile(atPath: path) { return path }
        throw CodingToolLaunch.Failure("could not find the slotstream executable to start the server with")
    }

    /// Run a command in its own session, so a Control-C or a closed Terminal
    /// meant for the tool does not reach it, with its output in `log` (the
    /// previous run's kept beside it) and no other inherited descriptors.
    static func spawnInBackground(_ executable: String, arguments: [String], log: String) throws -> pid_t {
        let fm = FileManager.default
        do {
            try fm.createDirectory(atPath: (log as NSString).deletingLastPathComponent,
                                   withIntermediateDirectories: true, attributes: [.posixPermissions: 0o700])
        } catch {
            throw CodingToolLaunch.Failure("could not create the log folder for \(log): \(error.localizedDescription)")
        }
        if fm.fileExists(atPath: log) {
            try? fm.removeItem(atPath: log + ".1")
            try? fm.moveItem(atPath: log, toPath: log + ".1")
        }
        let output = open(log, O_WRONLY | O_CREAT | O_TRUNC | O_CLOEXEC, 0o600)
        guard output >= 0 else {
            throw CodingToolLaunch.Failure("could not open \(log): \(String(cString: strerror(errno)))")
        }
        defer { close(output) }

        var actions: posix_spawn_file_actions_t? = nil
        posix_spawn_file_actions_init(&actions)
        defer { posix_spawn_file_actions_destroy(&actions) }
        posix_spawn_file_actions_addopen(&actions, 0, "/dev/null", O_RDONLY, 0)
        posix_spawn_file_actions_adddup2(&actions, output, 1)
        posix_spawn_file_actions_adddup2(&actions, output, 2)
        // Out of the tool's project folder, which may be moved or unmounted.
        posix_spawn_file_actions_addchdir_np(&actions, "/")

        var attributes: posix_spawnattr_t? = nil
        posix_spawnattr_init(&attributes)
        defer { posix_spawnattr_destroy(&attributes) }
        let flags = POSIX_SPAWN_SETSID | POSIX_SPAWN_CLOEXEC_DEFAULT | POSIX_SPAWN_SETSIGDEF | POSIX_SPAWN_SETSIGMASK
        posix_spawnattr_setflags(&attributes, Int16(flags))
        var defaults = sigset_t()
        sigemptyset(&defaults)
        for signal in [SIGINT, SIGTERM, SIGHUP, SIGQUIT, SIGPIPE, SIGCHLD] { sigaddset(&defaults, signal) }
        posix_spawnattr_setsigdefault(&attributes, &defaults)
        var mask = sigset_t()
        sigemptyset(&mask)
        posix_spawnattr_setsigmask(&attributes, &mask)

        let argv: [UnsafeMutablePointer<CChar>?] = ([executable] + arguments).map { strdup($0) } + [nil]
        let envp: [UnsafeMutablePointer<CChar>?] = ProcessInfo.processInfo.environment
            .map { strdup("\($0.key)=\($0.value)") } + [nil]
        defer {
            argv.forEach { free($0) }
            envp.forEach { free($0) }
        }
        var pid = pid_t()
        let result = argv.withUnsafeBufferPointer { argvBuffer in
            envp.withUnsafeBufferPointer { envpBuffer in
                posix_spawn(&pid, executable, &actions, &attributes,
                            argvBuffer.baseAddress, envpBuffer.baseAddress)
            }
        }
        guard result == 0 else {
            throw CodingToolLaunch.Failure("could not start \(executable): \(String(cString: strerror(result)))")
        }
        return pid
    }

    /// The server being started, shared with the Control-C handler. Creating
    /// the process and reading its id take the same lock, so the handler
    /// either sees the id or runs before any process exists.
    final class StartingServer: @unchecked Sendable {
        private let lock = NSLock()
        private var value: pid_t?
        private var interrupted = false

        /// For the handler: the server's id, once its creation is over.
        func interrupt() -> pid_t? {
            lock.withLock {
                interrupted = true
                return value
            }
        }

        func spawn(_ start: () throws -> pid_t) throws -> pid_t {
            try lock.withLock {
                guard !interrupted else { throw CodingToolLaunch.Failure("interrupted") }
                let pid = try start()
                value = pid
                return pid
            }
        }
    }

    /// Show the server's start in this terminal until it answers.
    static func waitUntilReady(pid: pid_t, port: Int, log: String, timeout: TimeInterval = 600) throws {
        let reader = FileHandle(forReadingAtPath: log)
        defer { try? reader?.close() }
        var partial = ""
        var echoing = true
        func echo(final: Bool) {
            guard let reader else { return }
            partial += String(decoding: reader.availableData, as: UTF8.self)
            var lines = partial.components(separatedBy: "\n")
            partial = final ? "" : lines.removeLast()
            for line in lines where echoing && !line.isEmpty {
                // The listening line is the last one worth showing; the
                // server's own "try it" hints follow it.
                if line.hasPrefix("slotstream listening") { echoing = false; continue }
                say("  " + line)
            }
        }
        let deadline = Date().addingTimeInterval(timeout)
        while true {
            echo(final: false)
            var status: Int32 = 0
            if waitpid(pid, &status, WNOHANG) == pid {
                echo(final: true)
                throw CodingToolLaunch.Failure("Slotstream stopped while starting; the lines above say why. "
                    + "Its log is \(log).")
            }
            if case .answered = (try? probe(port: port)) ?? .noAnswer {
                echo(final: true)
                return
            }
            if Date() > deadline {
                throw CodingToolLaunch.Failure("Slotstream did not answer within \(Int(timeout / 60)) minutes. "
                    + "It is still starting in the background (pid \(pid)); its log is \(log), and "
                    + "`slotstream stop` stops it.")
            }
            Thread.sleep(forTimeInterval: 0.25)
        }
    }

    /// Ask the server to stop and wait until it has, reaping it when it is a
    /// child of this process.
    static func stopServer(pid: pid_t, port: Int, timeout: TimeInterval = 30) throws {
        guard let path = ProcessIdentity.executablePath(pid),
              URL(fileURLWithPath: path).lastPathComponent == "slotstream" else {
            throw CodingToolLaunch.Failure("process \(pid), which answered on port \(port), is not a slotstream "
                + "server, so it was not stopped")
        }
        if kill(pid, SIGTERM) != 0 {
            guard errno == ESRCH else {
                throw CodingToolLaunch.Failure("could not stop process \(pid): \(String(cString: strerror(errno)))")
            }
        }
        let deadline = Date().addingTimeInterval(timeout)
        while true {
            var status: Int32 = 0
            _ = waitpid(pid, &status, WNOHANG)
            if ProcessIdentity.of(pid) == nil, case .noAnswer = (try? probe(port: port)) ?? .noAnswer { return }
            if Date() > deadline {
                throw CodingToolLaunch.Failure("the server (pid \(pid)) is still stopping after \(Int(timeout)) seconds")
            }
            Thread.sleep(forTimeInterval: 0.2)
        }
    }

    /// One HTTP request. `direct` keeps it off any configured proxy, which a
    /// request to this Mac must never go through; other requests use the
    /// system's proxy settings like any download.
    static func request(_ method: String, _ url: String, body: Data? = nil,
                        timeout: TimeInterval = 5, direct: Bool) -> (status: Int, body: Data)? {
        guard let url = URL(string: url) else { return nil }
        var request = URLRequest(url: url, timeoutInterval: timeout)
        request.httpMethod = method
        if let body {
            request.httpBody = body
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        let configuration = URLSessionConfiguration.ephemeral
        if direct { configuration.connectionProxyDictionary = [:] }
        let session = URLSession(configuration: configuration)
        defer { session.finishTasksAndInvalidate() }
        let done = DispatchSemaphore(value: 0)
        var result: (status: Int, body: Data)?
        session.dataTask(with: request) { data, response, _ in
            if let http = response as? HTTPURLResponse { result = (http.statusCode, data ?? Data()) }
            done.signal()
        }.resume()
        done.wait()
        return result
    }

    static func compareVersions(_ a: String, _ b: String) -> ComparisonResult {
        let parse = { (s: String) in s.split(separator: ".").map { Int($0.prefix { $0.isNumber }) ?? 0 } }
        let (x, y) = (parse(a), parse(b))
        for i in 0 ..< max(x.count, y.count) {
            let (p, q) = (i < x.count ? x[i] : 0, i < y.count ? y[i] : 0)
            if p != q { return p < q ? .orderedAscending : .orderedDescending }
        }
        return .orderedSame
    }

    // MARK: Tools

    static func find(_ name: String, path: String) -> String? {
        for directory in path.split(separator: ":") where !directory.isEmpty {
            let candidate = (String(directory) as NSString).expandingTildeInPath + "/" + name
            var isDirectory: ObjCBool = false
            if FileManager.default.fileExists(atPath: candidate, isDirectory: &isDirectory), !isDirectory.boolValue,
               FileManager.default.isExecutableFile(atPath: candidate) {
                return candidate
            }
        }
        return nil
    }

    static func codexVersion(_ executable: String) throws -> String {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: executable)
        process.arguments = ["--version"]
        let output = Pipe()
        process.standardOutput = output
        process.standardError = FileHandle.nullDevice
        process.standardInput = FileHandle.nullDevice
        let exited = DispatchSemaphore(value: 0)
        process.terminationHandler = { _ in exited.signal() }
        do { try process.run() } catch {
            throw CodingToolLaunch.Failure("could not run `codex --version`: \(error.localizedDescription)")
        }
        // The answer is one short line, well under what the pipe holds, so it
        // is read once the process has exited.
        if exited.wait(timeout: .now() + 15) == .timedOut {
            process.terminate()
            throw CodingToolLaunch.Failure("`codex --version` did not answer within 15 seconds. "
                + "Check that `codex` starts, and run this again.")
        }
        let text = String(decoding: output.fileHandleForReading.readDataToEndOfFile(), as: UTF8.self)
        guard let version = CodingToolLaunch.codexVersion(fromOutput: text) else {
            throw CodingToolLaunch.Failure("could not read a version from `codex --version`: "
                + text.trimmingCharacters(in: .whitespacesAndNewlines))
        }
        return version
    }

    /// The base instructions the installed Codex ships, which a catalog entry
    /// has to carry. Downloaded once per Codex version and kept. Nil when the
    /// file is not kept yet and `download` is off.
    static func codexInstructions(version: String, home: String, download: Bool) throws -> String? {
        let path = CodingToolLaunch.codexInstructionsPath(home: home, version: version)
        if let cached = try readIfPresent(path), CodingToolLaunch.looksLikeCodexInstructions(cached) { return cached }
        guard download else { return nil }
        let url = CodingToolLaunch.codexInstructionsURL(version: version)
        say("Downloading the instructions Codex \(version) ships, once: \(url)")
        guard let answer = request("GET", url, timeout: 30, direct: false) else {
            throw CodingToolLaunch.Failure("could not download Codex \(version)'s instructions from \(url): no answer. "
                + "Check the network connection and run this again; it is needed once per Codex version.")
        }
        guard answer.status == 200, let text = String(data: answer.body, encoding: .utf8),
              CodingToolLaunch.looksLikeCodexInstructions(text) else {
            throw CodingToolLaunch.Failure("could not download Codex \(version)'s instructions from \(url) "
                + "(HTTP \(answer.status)). A version that is not published on GitHub has none to download; "
                + "otherwise run this again. It is needed once per Codex version.")
        }
        try write(CodingToolLaunch.FileWrite(path: path, contents: text))
        return text
    }

    /// The JSON a user passed to Claude Code with `--settings`, inline or as a file.
    static func claudeSettings(_ arguments: [String]) throws -> [String: Any]? {
        guard let value = CodingToolLaunch.optionValue(arguments, "--settings")?.value else { return nil }
        let trimmed = value.trimmingCharacters(in: .whitespacesAndNewlines)
        let text: String
        if trimmed.hasPrefix("{") {
            text = trimmed
        } else {
            let path = (value as NSString).expandingTildeInPath
            guard let contents = try readIfPresent(path) else {
                throw CodingToolLaunch.Failure("the --settings file \(path) does not exist")
            }
            text = contents
        }
        guard let object = (try? JSONSerialization.jsonObject(with: Data(text.utf8))) as? [String: Any] else {
            throw CodingToolLaunch.Failure("the --settings value for Claude Code is not a JSON object")
        }
        return object
    }

    // MARK: Files and exec

    static func readIfPresent(_ path: String) throws -> String? {
        guard FileManager.default.fileExists(atPath: path) else { return nil }
        do { return try String(contentsOfFile: path, encoding: .utf8) }
        catch { throw CodingToolLaunch.Failure("could not read \(path): \(error.localizedDescription)") }
    }

    /// Write owner-only, replacing any previous file in one step. A path that
    /// is a symbolic link, such as a models file kept with dotfiles, is
    /// written through to its target, so the link stays.
    static func write(_ file: CodingToolLaunch.FileWrite) throws {
        let url = URL(fileURLWithPath: file.path).resolvingSymlinksInPath()
        do {
            try FileManager.default.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true,
                                                    attributes: [.posixPermissions: 0o700])
            try Data(file.contents.utf8).write(to: url, options: .atomic)
            try FileManager.default.setAttributes([.posixPermissions: 0o600], ofItemAtPath: url.path)
        } catch {
            throw CodingToolLaunch.Failure("could not write \(file.path): \(error.localizedDescription)")
        }
    }

    /// A word as a shell reads it back. A leading `=` is quoted too, since
    /// zsh expands it into a command's path.
    static func shellQuoted(_ value: String) -> String {
        let safe = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_./:=@%+,")
        if !value.isEmpty, !value.hasPrefix("="), value.unicodeScalars.allSatisfy(safe.contains) { return value }
        return "'" + value.replacingOccurrences(of: "'", with: "'\\''") + "'"
    }

    static func exec(_ executable: String, arguments: [String], environment: [String: String],
                     set: [String: String], remove: [String]) throws {
        var env = environment
        for key in remove { env.removeValue(forKey: key) }
        for (key, value) in set { env[key] = value }
        let argv = [executable] + arguments
        var cArguments: [UnsafeMutablePointer<CChar>?] = argv.map { strdup($0) } + [nil]
        var cEnvironment: [UnsafeMutablePointer<CChar>?] = env.map { strdup("\($0.key)=\($0.value)") } + [nil]
        fflush(stdout)
        fflush(stderr)
        execve(executable, &cArguments, &cEnvironment)
        let reason = String(cString: strerror(errno))
        cArguments.forEach { free($0) }
        cEnvironment.forEach { free($0) }
        throw CodingToolLaunch.Failure("could not start \(executable): \(reason)")
    }
}
