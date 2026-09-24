import Foundation
import SevraRuntime
import Slotstream

func seedAuditUIIfRequested() throws -> Bool {
    let args = CommandLine.arguments
    guard let i = args.firstIndex(of: "--seed-audit-ui"), args.count > i + 2 else { return false }
    let home = URL(fileURLWithPath: args[i+1]), source = URL(fileURLWithPath: args[i+2])
    guard !FileManager.default.fileExists(atPath: home.path) else { throw SevraError.refused("Audit UI fixtures require a new disposable Home.") }
    let dbmd = URL(fileURLWithPath: ProcessInfo.processInfo.environment["SEVRA_DBMD"] ?? NSHomeDirectory() + "/.dbmd/bin/dbmd")
    let store = try HomeStore(root: home, dbmd: dbmd)
    let reader = try SourceFolder(url: source)
    _ = try reader.execute(ProposedTool(name: "source.read", arguments: ["path": .string(source.lastPathComponent)]), cancellation: Cancellation())
    let content = "# Synthetic audit document\n\n" + (try String(contentsOf: source, encoding: .utf8)) + "\nRetained public source. [S1]\n"
    func run(_ name: String) throws -> Run {
        try JSONDecoder().decode(Run.self, from: JSONSerialization.data(withJSONObject: ["id": UUID().uuidString.lowercased(), "nonce": name, "inputDigest": digestText(name), "state": "completed", "status": "Synthetic UI fixture. No model was run.", "trace": []]))
    }
    var state = HomeState()
    for n in 1...90 { state.threads[0].messages.append(Message(role: n % 2 == 1 ? "user" : "assistant", text: "Synthetic history item \(n): review paging and conversation search.")) }
    var history = WorkThread(title: "Audit document history")
    var first = try run("first")
    first.excerpts = reader.citations; first.artifact = "artifacts/audit-first.md"
    history.pastRuns = [first]; history.run = try run("later")
    history.messages = [Message(role: "user", text: "Create the synthetic first document.", runID: first.id), Message(role: "assistant", text: content, runID: first.id), Message(role: "user", text: "Now continue the conversation.", runID: history.run!.id), Message(role: "assistant", text: "The earlier document and citation should remain reachable.", runID: history.run!.id)]
    history.draft = "Preserved conversation draft"
    state.threads.append(history)
    var review = WorkThread(title: "Audit pending review")
    var pending = try run("review"); pending.state = .needsYou
    pending.proposal = ArtifactProposal(id: UUID().uuidString.lowercased(), filename: "audit-reviewed.md", content: content, citations: reader.citations)
    pending.excerpts = reader.citations
    review.run = pending; review.lifecycle = .needsYou
    review.messages = [Message(role: "user", text: "Propose this synthetic document for review.", runID: pending.id), Message(role: "assistant", text: content, runID: pending.id)]
    state.threads.append(review)
    state.journalDraft = "Synthetic journal draft ready to save"; state.journalDraftRevision = 1
    try store.save(state, artifact: ArtifactProposal(id: first.id, filename: "audit-first.md", content: content, citations: reader.citations))
    print("Seeded synthetic audit Home: history paging, past document/citation, pending review and durable journal draft. No model was run.")
    return true
}

func seedUIIfRequested() throws -> Bool {
    let args = CommandLine.arguments
    guard let i = args.firstIndex(of: "--seed-ui"), args.count > i + 2 else { return false }
    let home = URL(fileURLWithPath: args[i+1]), source = URL(fileURLWithPath: args[i+2])
    let dbmd = URL(fileURLWithPath: ProcessInfo.processInfo.environment["SEVRA_DBMD"] ?? NSHomeDirectory() + "/.dbmd/bin/dbmd")
    let store = try HomeStore(root: home, dbmd: dbmd)
    var state = try store.load()
    var thread = WorkThread(id: "00000000-0000-4000-8000-000000000042", title: "Native UI review")
    let input = "Show a clearly labeled test document for checking Markdown, tables, code, links and Unicode."
    let reader = try SourceFolder(url: source)
    _ = try reader.execute(ProposedTool(name: "source.read", arguments: ["path": .string(source.lastPathComponent)]), cancellation: Cancellation())
    let runID = UUID().uuidString.lowercased()
    let content = try String(contentsOf: source, encoding: .utf8) + "\nThe public UI fixture is the evidence for this review. [S1]\n"
    var run = try JSONDecoder().decode(Run.self, from: JSONSerialization.data(withJSONObject: ["id": runID, "nonce": "ui-fixture-" + runID, "inputDigest": digestText(input), "state": "needsYou", "status": "UI test document ready to inspect. No model was run.", "trace": ["Read the public Markdown fixture through the scoped native reader."]]))
    run.proposal = ArtifactProposal(id: UUID().uuidString.lowercased(), filename: "native-ui-review.md", content: content, citations: reader.citations)
    run.excerpts = reader.citations
    thread.run = run; thread.lifecycle = .needsYou
    thread.messages = [Message(role: "user", text: input, runID: runID), Message(role: "assistant", text: content, runID: runID)]
    thread.draft = "A draft stays here while I inspect the document."
    if let j = state.threads.firstIndex(where: { $0.id == thread.id }) { state.threads[j] = thread } else { state.threads.append(thread) }
    try store.save(state)
    print("Seeded labeled native UI review fixture through HomeStore/dbmd; no model loaded.")
    return true
}
