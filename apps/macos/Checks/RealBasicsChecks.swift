import Foundation
import SevraRuntime
import Slotstream

/// Real model, 10 GB plan, four basic jobs in one disposable Home:
/// a question answered from a PDF, a reviewed edit to a text file, a
/// mini-app proposal, and "what is this?" about one attached file. The harness is the reviewer for these synthetic
/// fixtures. Prints one JSON receipt for the evidence record.
func realBasicsCheckIfRequested() async throws -> Bool {
    guard CommandLine.arguments.contains("--real-basics") else { return false }
    let args = CommandLine.arguments
    func option(_ name: String) -> String? { guard let i = args.firstIndex(of: name), i + 1 < args.count else { return nil }; return args[i + 1] }
    guard let destination = option("--home") else { throw SevraError.refused("A real basics check requires a new --home directory.") }
    // `--think` turns the thread switch on for every job, which is how the
    // thinking-with-tools combination is measured against the plain runs.
    let thinking = args.contains("--think")
    let base = URL(fileURLWithPath: destination).standardizedFileURL
    guard !FileManager.default.fileExists(atPath: base.path) else { throw SevraError.refused("Real checks require a new disposable directory.") }
    let dbmd = URL(fileURLWithPath: ProcessInfo.processInfo.environment["SEVRA_DBMD"] ?? NSHomeDirectory() + "/.dbmd/bin/dbmd")
    guard let helper = DocumentReader.locateHelper() else { throw SevraError.refused("sevra-extract is missing. Set SEVRA_EXTRACT.") }
    let machine = Machine.current()
    guard (machine.availableGB ?? 0) >= 13 else { throw SevraError.refused("The real check requires the 10 GB plan plus at least 3 GB headroom.") }

    let reports = base.appendingPathComponent("Reports"), project = base.appendingPathComponent("Project")
    try FileManager.default.createDirectory(at: reports, withIntermediateDirectories: true)
    try FileManager.default.createDirectory(at: project, withIntermediateDirectories: true)
    try Fixture.pdf(pages: ["Cedar pilot overview. The pilot runs in the north region with three clinics.",
                            "Cedar budget. The approved pilot budget is 7300 dollars, held by the operations team.",
                            "Cedar risks. The main risk is a vendor delay in shipping tablets."]).write(to: reports.appendingPathComponent("cedar-report.pdf"))
    let planText = "# Cedar launch plan\n\nOwner: Maya\nStatus: draft\nRegion: north\n"
    try Data(planText.utf8).write(to: project.appendingPathComponent("plan.md"))
    try Data("# Notes\n\nKeep the launch calm.\n".utf8).write(to: project.appendingPathComponent("notes.md"))

    let started = Date()
    var runtime: SevraRuntime? = try SevraRuntime(homeURL: base.appendingPathComponent("Home"), dbmd: dbmd, inference: LocalInference(memoryGB: 10), helper: helper)
    var receipt: [String: Any] = ["model_plan_gb": 10, "thinking": thinking]
    func start(_ title: String) async throws -> String {
        let id = try await runtime!.newThread(title: title)
        if thinking { try await runtime!.setThinking(threadID: id, enabled: true) }
        return id
    }
    func thought(_ thread: WorkThread) -> [String: Any] {
        guard let receipt = thread.run?.thinking else { return ["ending": "none"] }
        return ["ending": receipt.ending.rawValue, "tokens": receipt.tokens, "seconds": Int(receipt.seconds)]
    }
    func watch(_ thread: String, limit: Int = 900) async throws -> WorkThread {
        var previous = ""
        for _ in 0..<limit {
            let snapshot = await runtime!.snapshot()
            guard let current = snapshot.home.threads.first(where: { $0.id == thread }) else { break }
            let status = current.run?.status ?? ""
            if status != previous { print("  " + status); fflush(stdout); previous = status }
            if current.run?.state == .needsYou || current.run?.state.terminal == true { return current }
            try await Task.sleep(nanoseconds: 1_000_000_000)
        }
        throw SevraError.refused("The real job did not finish in time.")
    }
    var failures: [String] = []
    func expect(_ condition: Bool, _ label: String) { print((condition ? "PASS: " : "FAIL: ") + label); if !condition { failures.append(label) } }

    // 1. A question answered from a PDF.
    let ask = try await start("PDF question")
    try await runtime!.attach(threadID: ask, folder: reports)
    let question = "What is the approved Cedar pilot budget, and which page of the report says so? Read the report before answering."
    try await runtime!.submit(threadID: ask, text: question, nonce: "real-pdf")
    var thread = try await watch(ask)
    let answer = thread.messages.last { $0.role == "assistant" }?.text ?? ""
    let excerpts = thread.run?.excerpts ?? []
    receipt["pdf"] = ["prompt": question, "state": thread.run?.state.rawValue ?? "", "answer": answer, "trace": thread.run?.trace ?? [],
                      "excerpts": excerpts.map { ["id": $0.id, "path": $0.path, "page": $0.page ?? 0, "method": $0.method ?? "", "sha256": $0.hash] as [String: Any] }, "thought": thought(thread)]
    expect(thread.run?.state == .completed, "the PDF question completes")
    expect(answer.contains("7300") || answer.contains("7,300"), "the answer states the budget from the PDF")
    let spoken = answer.lowercased()
    expect(spoken.contains("page 2") || spoken.contains("second page") || spoken.contains("page two"), "the answer names page 2")
    // A short report fits in one read, so the excerpt may start on page 1.
    expect(excerpts.contains { $0.method == "pdfkit" && ($0.content ?? "").contains("7300") }, "the run read the budget through the document reader")

    // 2. A reviewed edit to a text file.
    let edit = try await start("Plan edit")
    let folder = try await runtime!.attach(threadID: edit, folder: project)
    try await runtime!.setAccess(threadID: edit, attachmentID: folder.id, access: .change)
    let request = "In plan.md, change the status from draft to approved. Change nothing else."
    try await runtime!.submit(threadID: edit, text: request, nonce: "real-edit")
    thread = try await watch(edit)
    let set = thread.run?.changes
    receipt["edit"] = ["prompt": request, "state": thread.run?.state.rawValue ?? "", "trace": thread.run?.trace ?? [], "status": thread.run?.status ?? "",
                       "changes": (set?.changes ?? []).map { ["path": $0.display, "operation": $0.operation.rawValue, "added": $0.added, "removed": $0.removed] as [String: Any] }, "thought": thought(thread)]
    expect(thread.run?.state == .needsYou && set?.changes.count == 1 && set?.changes.first?.display == "plan.md", "the edit waits for review as one change to plan.md")
    expect((try String(contentsOf: project.appendingPathComponent("plan.md"), encoding: .utf8)) == planText, "nothing is written before review")
    if let set, set.changes.count == 1 {
        let applied = try await runtime!.approveChanges(threadID: edit, changeSetID: set.id, digest: set.digest)
        let written = try String(contentsOf: project.appendingPathComponent("plan.md"), encoding: .utf8)
        expect(applied.state == .applied && written == planText.replacingOccurrences(of: "Status: draft", with: "Status: approved"), "the approved edit changes exactly the status line")
        receipt["edit_written_sha256"] = digestText(written)
    }

    // 3. A mini-app proposal.
    let build = try await start("Counter app")
    let appRequest = "/app Build a small counter app with plus and minus buttons. Save the count in a collection named counter so it is kept."
    try await runtime!.submit(threadID: build, text: appRequest, nonce: "real-app")
    thread = try await watch(build, limit: 1800)
    let proposal = thread.run?.appProposal
    receipt["app"] = ["prompt": appRequest, "state": thread.run?.state.rawValue ?? "", "status": thread.run?.status ?? "", "trace": thread.run?.trace ?? [],
                      "name": proposal?.name ?? "", "collections": proposal?.collections.map { $0.name + ":" + $0.access.rawValue } ?? [],
                      "html_bytes": proposal?.html.utf8.count ?? 0, "html_sha256": proposal.map { digestText($0.html) } ?? "", "notes": proposal?.notes ?? [], "thought": thought(thread)]
    expect(proposal != nil && thread.run?.state == .needsYou, "the app request ends in an app review")
    if let proposal {
        let html = proposal.html.lowercased()
        expect(proposal.collections.contains(AppCollection(name: "counter", access: .write)), "the app declares the counter collection for writing")
        expect(html.contains("sevra.") && html.contains("<button"), "the app uses the Sevra data API and has buttons")
        // The host's own review notes, not a raw string search: an SVG
        // namespace or a comment is not a web resource.
        expect(!proposal.notes.contains { $0.contains("web resources") || $0.contains("network") }, "the app loads no web resources and uses no network API")
        let appID = try await runtime!.approveApp(threadID: build, proposalID: proposal.id, digest: proposal.digest)
        let info = try JSONSerialization.jsonObject(with: await runtime!.appRequest(appID: appID, version: 1, request: Data(#"{"op":"info"}"#.utf8))) as? [String: Any]
        expect(info?["ok"] as? Bool == true, "the approved app is on with its data access")
    }

    // 4. A vague question about one attached file. Told only that files
    // were attached, the model asked what "this" meant instead of reading it.
    let vague = try await start("Attached file")
    try await runtime!.attach(threadID: vague, folder: reports.appendingPathComponent("cedar-report.pdf"))
    let vagueQuestion = "what is this?"
    try await runtime!.submit(threadID: vague, text: vagueQuestion, nonce: "real-vague")
    thread = try await watch(vague)
    let described = thread.messages.last { $0.role == "assistant" }?.text ?? ""
    let vagueTrace = thread.run?.trace ?? []
    receipt["vague"] = ["prompt": vagueQuestion, "state": thread.run?.state.rawValue ?? "", "answer": described, "trace": vagueTrace, "thought": thought(thread)]
    expect(thread.run?.state == .completed && vagueTrace.contains { $0.hasPrefix("source.read:") && !$0.contains("refused") },
           "\"what is this?\" about one attached file reads it")
    expect(described.lowercased().contains("cedar"), "the answer describes the attached report")

    try await runtime!.shutdown(); runtime = nil
    receipt["seconds"] = Int(Date().timeIntervalSince(started))
    receipt["failures"] = failures
    print(String(decoding: try JSONSerialization.data(withJSONObject: receipt, options: [.sortedKeys, .prettyPrinted]), as: UTF8.self)); fflush(stdout)
    guard failures.isEmpty else { throw SevraError.refused("CHECK FAILED: real basics: " + failures.joined(separator: "; ")) }
    print("PASS: real local model answered from a PDF, proposed an exact reviewed edit and an app that passed its review checks, and read an attached file it was asked about as \"this\"")
    return true
}
