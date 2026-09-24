import Foundation
import SevraRuntime
import Slotstream

/// One bounded model instance, disposable source files and a disposable Home.
/// Ordinary CI uses sourceNavigationChecks; this opt-in gate checks the model
/// can actually use the live tool schemas and produce a reviewable edit.
func realSourcesIfRequested() async throws -> Bool {
    let args = CommandLine.arguments
    guard args.contains("--real-sources") else { return false }
    guard let i = args.firstIndex(of: "--home"), i + 1 < args.count else { throw SevraError.refused("Use --real-sources --home with a new disposable directory.") }
    let base = URL(fileURLWithPath: args[i + 1]).standardizedFileURL
    guard !FileManager.default.fileExists(atPath: base.path), (Machine.current().availableGB ?? 0) >= 13 else {
        throw SevraError.refused("This check needs a new directory and the 10 GB model budget plus 3 GB headroom.")
    }
    let fm = FileManager.default
    let documents = base.appendingPathComponent("Documents"), notes = documents.appendingPathComponent("Notes")
    try fm.createDirectory(at: notes, withIntermediateDirectories: true)
    for n in 0..<2_501 { try Data().write(to: documents.appendingPathComponent("fixture-\(n).bin")) }
    let initialCode = "PINE-" + UUID().uuidString.prefix(8)
    let revisedCode = "CEDAR-" + UUID().uuidString.prefix(8)
    let old = notes.appendingPathComponent("launch-plan.md"), new = notes.appendingPathComponent("launch-revised.md")
    try Data("# Launch\nLaunch code: \(initialCode)\nStatus: draft\n".utf8).write(to: old)
    let dbmd = URL(fileURLWithPath: ProcessInfo.processInfo.environment["SEVRA_DBMD"] ?? NSHomeDirectory() + "/.dbmd/bin/dbmd")
    let runtime = try SevraRuntime(homeURL: base.appendingPathComponent("Home"), dbmd: dbmd, inference: LocalInference(memoryGB: 10))
    var records: [[String: Any]] = []
    var failures: [String] = []
    func expect(_ value: Bool, _ label: String) { print((value ? "PASS: " : "FAIL: ") + label); fflush(stdout); if !value { failures.append(label) } }
    func run(_ thread: String, _ prompt: String, _ nonce: String) async throws -> WorkThread {
        try await runtime.submit(threadID: thread, text: prompt, nonce: nonce)
        var last = ""
        for _ in 0..<900 {
            let snapshot = await runtime.snapshot()
            let current = snapshot.home.threads.first { $0.id == thread }!
            if let status = current.run?.status, status != last { print(status); fflush(stdout); last = status }
            if current.run?.state.terminal == true || current.run?.state == .needsYou {
                records.append(["prompt": prompt, "state": current.run?.state.rawValue ?? "", "answer": current.messages.last(where: { $0.role == "assistant" })?.text ?? "",
                                "trace": current.run?.trace ?? [], "excerpts": current.run?.excerpts?.map { ["path": $0.path, "content": $0.content ?? "", "sha256": $0.hash] } ?? []])
                return current
            }
            try await Task.sleep(nanoseconds: 1_000_000_000)
        }
        try await runtime.stop(threadID: thread)
        throw SevraError.refused("The live source check exceeded its wait budget.")
    }
    do {
        let plain = try await runtime.newThread(mode: .threadOnly)
        let capabilities = try await run(plain, "Do you have access to files on my Mac? How can I give you access?", "capabilities")
        let explanation = capabilities.messages.last(where: { $0.role == "assistant" })?.text.lowercased() ?? ""
        expect(capabilities.run?.state == .completed && explanation.contains("attach") && !explanation.contains("running on a server"), "model explains attaching files without claiming remote execution")
        let thread = try await runtime.newThread(mode: .threadOnly, title: "Live folder qualification")
        let attachment = try await runtime.attach(threadID: thread, folder: documents)
        let first = try await run(thread, "Find launch-plan.md inside the attached folder. Read it and tell me its launch code. Cite the file.", "first")
        expect(first.run?.state == .completed && first.messages.last?.text.contains(initialCode) == true && first.run?.excerpts?.contains(where: { $0.content?.contains(initialCode) == true }) == true, "model finds and reads a file in a folder beyond the old attachment limit")
        try fm.moveItem(at: old, to: new)
        try Data("# Launch\nLaunch code: \(revisedCode)\nStatus: draft\n".utf8).write(to: new, options: .atomic)
        let second = try await run(thread, "The plan was renamed to launch-revised.md and its code changed. Find it and read the current launch code. Cite the current file.", "renamed")
        expect(second.run?.state == .completed && second.messages.last?.text.contains(revisedCode) == true && second.run?.excerpts?.contains(where: { $0.path.hasSuffix("launch-revised.md") && $0.content?.contains(revisedCode) == true }) == true, "model discovers a rename and fresh content without reattaching")
        try await runtime.setAccess(threadID: thread, attachmentID: attachment.id, access: .change)
        let third = try await run(thread, "In launch-revised.md, change Status: draft to Status: approved. Read the file first and propose exactly that edit for my review.", "edit")
        let before = try String(contentsOf: new, encoding: .utf8)
        expect(third.run?.state == .needsYou && third.run?.changes?.changes.count == 1 && before.contains("Status: draft"), "model stages exactly one change and leaves the source untouched for review")
        if let set = third.run?.changes {
            let applied = try await runtime.approveChanges(threadID: thread, changeSetID: set.id, digest: set.digest)
            let after = try String(contentsOf: new, encoding: .utf8)
            expect(applied.state == .applied && after == before.replacingOccurrences(of: "Status: draft", with: "Status: approved"), "owner approval applies the exact reviewed edit")
            _ = try await runtime.undoChanges(threadID: thread, changeSetID: set.id)
            expect(try String(contentsOf: new, encoding: .utf8) == before, "undo restores the exact pre-edit bytes")
        }
        try await runtime.shutdown()
    } catch {
        failures.append(error.localizedDescription)
        try? await runtime.shutdown()
    }
    let receipt: [String: Any] = ["model_budget_gb": 10, "initial_code": initialCode, "revised_code": revisedCode, "runs": records, "failures": failures]
    try JSONSerialization.data(withJSONObject: receipt, options: [.prettyPrinted, .sortedKeys]).write(to: base.appendingPathComponent("receipt.json"))
    try require(failures.isEmpty, failures.joined(separator: "; "))
    return true
}
