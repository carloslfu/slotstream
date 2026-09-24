import Foundation
import SevraRuntime

// A distinct internal executable preserves the existing `sevra` compatibility CLI.
let args = Array(CommandLine.arguments.dropFirst())
func option(_ name: String) -> String? { guard let i = args.firstIndex(of: name), i + 1 < args.count else { return nil }; return args[i + 1] }
if args.contains("--help") || args.isEmpty {
    print("""
    sevra-local chat --home PATH [--dbmd PATH] --prompt TEXT [--thread ID] [--source FOLDER] [--model PATH] [--nonce ID] [--think]
    sevra-local status --home PATH [--dbmd PATH] [--thread ID]
    sevra-local stop --home PATH [--thread ID]
    sevra-local answer-now --home PATH [--thread ID]
    --think turns thinking on for the thread (sticky); answer-now ends the current thought and answers from it.
    Attaches to an existing Mac owner; --dbmd is required to start its own owner.
    Artifact proposals require exact-content review in the native app. No automatic approval.
    """); exit(0)
}
guard let home = option("--home") else { fputs("--home is required\n", stderr); exit(2) }
let homeURL = URL(fileURLWithPath: home).standardizedFileURL
let threadID = option("--thread") ?? "home"
let client = LocalClient(home: homeURL)
let semaphore = DispatchSemaphore(value: 0)
var status: Int32 = 0
let signalSource = DispatchSource.makeSignalSource(signal: SIGINT, queue: .global())
signal(SIGINT, SIG_IGN)
signalSource.setEventHandler { _ = try? client.request(LocalRequest(operation: "stop", threadID: threadID)) }
signalSource.resume()
Task {
    var owner: SevraRuntime?
    var endpoint: LocalEndpoint?
    do {
        if let dbmd = option("--dbmd") {
            do {
                let engine = option("--model").map { LocalInference(model: URL(fileURLWithPath: $0)) } ?? LocalInference()
                let runtime = try SevraRuntime(homeURL: homeURL, dbmd: URL(fileURLWithPath: dbmd), inference: engine)
                owner = runtime; endpoint = try LocalEndpoint(runtime: runtime)
            } catch SevraError.ownerBusy { /* Attach only to the authenticated current owner. */ }
        }
        if args.first == "status" {
            let reply = try client.request(LocalRequest(operation: "status", threadID: threadID))
            print("Home: \(reply.homeID ?? "unknown") · \(reply.thread?.title ?? "unknown") · \(reply.thread?.run?.status ?? "Ready")")
        } else if args.first == "stop" {
            _ = try client.request(LocalRequest(operation: "stop", threadID: threadID)); print("Stop requested")
        } else if args.first == "answer-now" {
            _ = try client.request(LocalRequest(operation: "answer-now", threadID: threadID)); print("Answer requested")
        } else if args.first == "chat", let prompt = option("--prompt") {
            if let source = option("--source") { _ = try client.request(LocalRequest(operation: "attach", threadID: threadID, path: source)) }
            if args.contains("--think") { _ = try client.request(LocalRequest(operation: "think", threadID: threadID, text: "on")) }
            // An explicitly supplied nonce lets a caller reconcile an uncertain
            // acceptance without silently creating a second request.
            let nonce = option("--nonce") ?? UUID().uuidString
            let accepted = try client.request(LocalRequest(operation: "submit", threadID: threadID, text: prompt, nonce: nonce))
            fputs("Accepted run \(accepted.runID ?? "unknown"); nonce \(nonce)\n", stderr)
            var shown = ""
            var shownStatus = ""
            while true {
                let reply = try client.request(LocalRequest(operation: "status", threadID: threadID))
                guard let thread = reply.thread else { throw SevraError.unavailable("The selected thread is unavailable.") }
                guard thread.run?.id == accepted.runID else {
                    print("This run is no longer the current response. Review its saved history in Sevra."); break
                }
                if let status = thread.run?.status, status.hasPrefix("Thinking") || status.hasPrefix("Finishing"), status != shownStatus {
                    fputs("\r" + status + "        ", stderr); shownStatus = status
                }
                let text = thread.messages.last(where: { $0.role == "assistant" })?.text ?? ""
                if text.hasPrefix(shown) { print(text.dropFirst(shown.count), terminator: ""); fflush(stdout) }; shown = text
                if let run = thread.run, run.state.terminal || run.state == .needsYou {
                    if let receipt = run.thinking { fputs("\r" + receipt.line + "\n", stderr) }
                    if let metrics = run.metrics, let line = ResponseMetricsFormat.line(metrics) { fputs(line + "\n", stderr) }
                    print("\n\(run.status)")
                    if let proposal = run.proposal { print("Review pending: \(proposal.filename)\n\(proposal.content)") }
                    if run.state == .failed { status = 1 }; break
                }
                try await Task.sleep(nanoseconds: 150_000_000)
            }
        } else { throw SevraError.unavailable("Unsupported internal command.") }
    } catch { fputs(error.localizedDescription + "\n", stderr); status = 1 }
    do { try await owner?.shutdown() } catch { fputs(error.localizedDescription + "\n", stderr); status = 1 }
    endpoint?.stop()
    semaphore.signal()
}
semaphore.wait(); exit(status)
