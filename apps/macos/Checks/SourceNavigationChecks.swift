import Foundation
import Darwin
import SevraRuntime
import Slotstream

private func sourceRequire(_ value: @autoclosure () throws -> Bool, _ message: String) throws {
    let actual = try value()
    try require(actual, message)
}
private func sourceCall(_ session: SourceSession, _ name: String, _ args: [String: JSONValue] = [:], cancellation: Cancellation = Cancellation()) throws -> [String: Any] {
    let call = ProposedTool(name: name, arguments: args)
    try call.validate(offered: ToolCatalog.specs(for: session.groups))
    let result = try session.execute(call, cancellation: cancellation)
    return try JSONSerialization.jsonObject(with: Data(result.utf8)) as! [String: Any]
}
private func sourceRefuses(_ label: String, _ fragment: String? = nil, _ body: () throws -> Void) throws {
    var reason: String?
    do { try body() } catch { reason = error.localizedDescription }
    try sourceRequire(reason != nil && (fragment == nil || reason!.contains(fragment!)), label + ": " + (reason ?? "accepted"))
}
private func sourceRows(_ result: [String: Any], _ key: String = "files") -> [[String: Any]] { result[key] as? [[String: Any]] ?? [] }
private func sourcePages(_ session: SourceSession, _ name: String, _ args: [String: JSONValue] = [:], key: String = "files") throws -> [[String: Any]] {
    var arguments = args, rows: [[String: Any]] = [], pages = 0
    while true {
        let page = try sourceCall(session, name, arguments)
        rows += sourceRows(page, key); pages += 1
        try sourceRequire(pages < 2_000, "source pagination terminates")
        if let next = page["next_cursor"] as? String { arguments["cursor"] = .string(next) }
        else { try sourceRequire(page["complete"] as? Bool == true, "last page explicitly finishes"); break }
    }
    return rows
}

func sourceNavigationChecks(root: URL, dbmd: URL) async throws {
    let fm = FileManager.default
    let base = root.appendingPathComponent("live-sources")
    try fm.createDirectory(at: base, withIntermediateDirectories: true)
    func write(_ path: String, _ text: String = "") throws {
        let url = base.appendingPathComponent(path)
        try fm.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true)
        try Data(text.utf8).write(to: url, options: .atomic)
    }
    try write("workspace/nested/original.txt", "before\n")
    try write("outside.txt", "OUTSIDE-GRANT")
    let folder = base.appendingPathComponent("workspace")
    let session = SourceSession()
    let attached = try session.attach(url: folder, access: .change)
    try sourceRequire(attached.files == nil && session.groups.contains(.read), "folder attaches without an inventory or a claimed file count")
    var listing = try sourceCall(session, "source.list")
    try sourceRequire(sourceRows(listing).isEmpty && sourceRows(listing, "directories").map { $0["relative_path"] as? String } == ["nested"], "list shows immediate subfolders")
    var nested = try sourceCall(session, "source.list", ["path": .string("nested")])
    let id = sourceRows(nested)[0]["id"] as! String
    let first = try sourceCall(session, "source.read", ["id": .string(id)])
    try sourceRequire(first["content"] as? String == "before\n", "listed IDs read through the selected root")
    try write("workspace/nested/original.txt", "after\n")
    try sourceRefuses("an external change between reading and staging needs a fresh read", "changed after") {
        _ = try sourceCall(session, "file.write", ["id": .string(id), "content": .string("replacement\n")])
    }
    let fresh = try sourceCall(session, "source.read", ["id": .string(id)])
    try sourceRequire(fresh["content"] as? String == "after\n" && first["sha256"] as? String != fresh["sha256"] as? String, "atomic replacement invalidates cached text")
    _ = try sourceCall(session, "file.edit", ["id": .string(id), "old": .string("after"), "new": .string("reviewed")])
    try sourceRequire(session.staged.count == 1 && (try String(contentsOf: folder.appendingPathComponent("nested/original.txt"), encoding: .utf8)) == "after\n", "a fresh read permits staging, without changing the file")
    session.beginJob()
    try write("workspace/nested/new.txt", "NEW-FILE-CANARY\n")
    nested = try sourceCall(session, "source.list", ["path": .string("nested")])
    try sourceRequire(sourceRows(nested).count == 2, "new files are visible in the same attachment")
    let found = try sourcePages(session, "source.find", ["query": .string("new.txt")], key: "matches")
    let searched = try sourcePages(session, "source.search", ["query": .string("NEW-FILE-CANARY")], key: "matches")
    try sourceRequire(found.count == 1 && searched.count == 1, "filename and content search discover newly created files")
    try fm.moveItem(at: folder.appendingPathComponent("nested/new.txt"), to: folder.appendingPathComponent("nested/renamed.txt"))
    nested = try sourceCall(session, "source.list", ["path": .string("nested")])
    try sourceRequire(sourceRows(nested).contains { $0["relative_path"] as? String == "nested/renamed.txt" } && !sourceRows(nested).contains { $0["relative_path"] as? String == "nested/new.txt" }, "renames replace old names in live listings")
    try sourceRefuses("old path IDs cannot read a renamed file", "missing") { _ = try sourceCall(session, "source.read", ["id": .string(found[0]["id"] as! String)]) }
    let direct = try sourceCall(session, "source.read", ["path": .string("nested/renamed.txt")])
    try sourceRequire(direct["content"] as? String == "NEW-FILE-CANARY\n", "known relative paths read without prior discovery")
    try fm.removeItem(at: folder.appendingPathComponent("nested/renamed.txt"))
    try sourceRequire(try sourcePages(session, "source.find", ["query": .string("renamed")], key: "matches").isEmpty, "deleted files disappear from new searches")
    print("PASS: immediate folder grant, directory browsing, live creation/edit/rename/deletion, direct reads, stale-edit refusal")

    for bad in ["../outside.txt", "/etc/passwd", "nested/../../outside.txt", "nested\0/evil", "nested//original.txt", ".env"] {
        try sourceRefuses("path escape or hidden file refused: \(bad.debugDescription)") { _ = try sourceCall(session, "source.read", ["path": .string(bad)]) }
    }
    try fm.createSymbolicLink(at: folder.appendingPathComponent("external.txt"), withDestinationURL: base.appendingPathComponent("outside.txt"))
    try fm.createSymbolicLink(at: folder.appendingPathComponent("linkdir"), withDestinationURL: base)
    for path in ["external.txt", "linkdir/outside.txt"] {
        try sourceRefuses("symbolic-link traversal refused") { _ = try sourceCall(session, "source.read", ["path": .string(path)]) }
    }
    try sourceRefuses("directory symlink cannot be browsed") { _ = try sourceCall(session, "source.list", ["path": .string("linkdir")]) }
    try write("workspace/.env", "SECRET-CANARY")
    try write("workspace/node_modules/ignored.txt", "DEPENDENCY-CANARY")
    listing = try sourceCall(session, "source.list")
    try sourceRequire(sourceRows(listing).isEmpty && (listing["skipped"] as? [String: Int])?["symbolic_links"] == 2, "listing excludes hidden entries and symbolic links")
    try sourceRequire(try sourcePages(session, "source.search", ["query": .string("CANARY")], key: "matches").isEmpty, "default recursive search excludes hidden and dependency subtrees")
    let scoped = try sourcePages(session, "source.search", ["query": .string("DEPENDENCY-CANARY"), "path": .string("node_modules")], key: "matches")
    try sourceRequire(scoped.count == 1, "an explicitly scoped dependency folder remains navigable")
    let single = SourceSession()
    try single.attach(url: folder.appendingPathComponent("nested/original.txt"), access: .read)
    try sourceRefuses("a selected file does not grant its siblings") { _ = try sourceCall(single, "source.read", ["path": .string("../outside.txt")]) }
    try sourceRefuses("a forged file ID does not expand a single-file grant") { _ = try sourceCall(single, "source.read", ["id": .string("a1:renamed.txt")]) }
    try sourceRefuses("a file attachment cannot be used as a directory grant") { _ = try sourceCall(single, "source.list", ["path": .string("nested")]) }
    let hidden = SourceSession()
    try hidden.attach(url: folder.appendingPathComponent(".env"), access: .read)
    try sourceRequire(try sourceCall(hidden, "source.read", ["path": .string(".env")])["content"] as? String == "SECRET-CANARY", "explicitly selecting one hidden file authorizes only that file")
    let second = try session.attach(url: base.appendingPathComponent("outside.txt"), access: .read)
    try sourceRefuses("multiple attachments require an unambiguous scope") { _ = try sourceCall(session, "source.read", ["path": .string("outside.txt")]) }
    _ = try sourceCall(session, "source.read", ["attachment": .string(second.id), "path": .string("outside.txt")])
    session.detach(id: attached.id)
    try sourceRefuses("detaching revokes old IDs") { _ = try sourceCall(session, "source.read", ["id": .string(id)]) }
    _ = try sourceCall(session, "source.read", ["attachment": .string(second.id), "path": .string("outside.txt")])
    print("PASS: root confinement, hidden files, symlink boundaries, scoped dependency traversal, file-only grants, multi-source identity and detach")

    let large = base.appendingPathComponent("large")
    try fm.createDirectory(at: large, withIntermediateDirectories: true)
    let count = 12_001
    for n in 0..<count { try Data((n == count - 1 ? "LAST-CANARY" : "ordinary").utf8).write(to: large.appendingPathComponent("item-\(n).txt")) }
    let largeSession = SourceSession()
    let attachStart = ProcessInfo.processInfo.systemUptime
    try largeSession.attach(url: large, access: .read)
    print("OBSERVATION: \(count)-file attachment accepted in \(ProcessInfo.processInfo.systemUptime - attachStart) seconds (functional observation, not a benchmark)")
    let all = try sourcePages(largeSession, "source.list")
    try sourceRequire(all.count == count && Set(all.compactMap { $0["id"] as? String }).count == count, "all files paginate exactly once beyond both former limits")
    let late = try sourcePages(largeSession, "source.search", ["query": .string("LAST-CANARY")], key: "matches")
    try sourceRequire(late.count == 1 && late[0]["path"] as? String == "item-12000.txt", "bounded search continues across the large tree and finds the target")
    let initial = try sourceCall(largeSession, "source.list")
    let cursor = initial["next_cursor"] as! String
    try sourceRefuses("cursor cannot be used for another operation") { _ = try sourceCall(largeSession, "source.find", ["query": .string("item"), "cursor": .string(cursor)]) }
    try Data().write(to: large.appendingPathComponent("added.txt"))
    try sourceRefuses("a changed directory invalidates the continuation", "changed during") { _ = try sourceCall(largeSession, "source.list", ["cursor": .string(cursor)]) }
    let freshLarge = try sourcePages(largeSession, "source.list")
    try sourceRequire(freshLarge.count == count + 1, "restarting after mutation includes the new entry")
    let stopped = Cancellation(); stopped.cancel()
    try sourceRefuses("cancelled navigation stops", "Stopped") { _ = try sourceCall(largeSession, "source.list", cancellation: stopped) }
    try sourceRefuses("cancelled search stops", "Stopped") { _ = try sourceCall(largeSession, "source.search", ["query": .string("ordinary")], cancellation: stopped) }
    let descriptors = try fm.contentsOfDirectory(atPath: "/dev/fd").count
    for _ in 0..<100 { _ = try sourceCall(largeSession, "source.list") }
    try sourceRequire(try fm.contentsOfDirectory(atPath: "/dev/fd").count <= descriptors + SourceLimits.cursorCount, "abandoned cursors retain only the bounded directory streams")
    print("PASS: large folder acceptance, gap-free listing and search, changed-directory refusal, cancellation and descriptor cleanup")

    try write("matches/lines.txt", (0..<57).map { "é👋 needle number \($0)\n" }.joined())
    let matching = SourceSession()
    try matching.attach(url: base.appendingPathComponent("matches"), access: .read)
    let hits = try sourcePages(matching, "source.search", ["query": .string("needle")], key: "matches")
    try sourceRequire(hits.count == 57 && hits.compactMap { $0["line"] as? Int } == Array(1...57), "continuations preserve every matching line within one file")
    let excerpt = try sourceCall(matching, "source.read", ["id": .string(hits[20]["id"] as! String), "offset": .int(hits[20]["offset"] as! Int)])
    try sourceRequire((excerpt["content"] as? String)?.hasPrefix("needle number 20") == true, "continuation results keep exact UTF-8 read offsets")
    let partial = try sourceCall(matching, "source.search", ["query": .string("needle")])
    let token = partial["next_cursor"] as! String
    try sourceRefuses("search cursors bind the original query") { _ = try sourceCall(matching, "source.search", ["query": .string("number"), "cursor": .string(token)]) }
    // In-place content mutation leaves the parent directory unchanged.
    let handle = try FileHandle(forWritingTo: base.appendingPathComponent("matches/lines.txt"))
    try handle.write(contentsOf: Data("changed".utf8)); try handle.close()
    try sourceRefuses("modified file content invalidates within-file continuation", "file changed") { _ = try sourceCall(matching, "source.search", ["query": .string("needle"), "cursor": .string(token)]) }
    try write("matches/words.txt", "north plans the rollout\n")
    let words = try sourcePages(matching, "source.search", ["query": .string("north rollout"), "match": .string("words")], key: "matches")
    try sourceRequire(words.count == 1, "all-word search is explicit and resumable")
    print("PASS: within-file pagination, UTF-8 offsets, query binding, content mutation and explicit word matching")

    // The depth bound belongs to a recursive operation, not to the grant.
    let deep = Array(repeating: "d", count: SourceLimits.traversalDepth + 3).joined(separator: "/")
    try write("deep/" + deep + "/target.txt", "deep target")
    let deepSession = SourceSession()
    try deepSession.attach(url: base.appendingPathComponent("deep"), access: .read)
    let limited = try sourceCall(deepSession, "source.find", ["query": .string("target")])
    try sourceRequire((limited["skipped"] as? [String: Int])?["depth_limited_subtrees"] == 1, "recursive depth omissions are explicit")
    let deeper = try sourceCall(deepSession, "source.list", ["path": .string(deep)])
    try sourceRequire(sourceRows(deeper).count == 1, "the agent can navigate directly beyond one scan's depth budget")

    // Native directory streams are process-bounded across sessions, not only
    // within one thread. Eviction must fail an old cursor rather than repeat it.
    let medium = Array(repeating: "d", count: 15).joined(separator: "/")
    for n in 0..<45 { try write("pressure/" + medium + "/match-\(n).txt") }
    var held: [SourceSession] = [], tokens: [String] = []
    let beforePressure = try fm.contentsOfDirectory(atPath: "/dev/fd").count
    for _ in 0..<8 {
        let scope = SourceSession()
        try scope.attach(url: base.appendingPathComponent("pressure"), access: .read)
        let page = try sourceCall(scope, "source.find", ["query": .string("match-")])
        held.append(scope); tokens.append(page["next_cursor"] as! String)
    }
    try sourceRequire(try fm.contentsOfDirectory(atPath: "/dev/fd").count <= beforePressure + SourceLimits.directoryStreams + held.count, "directory stream budget applies across all sessions")
    try sourceRefuses("evicted cursors explicitly require restart", "expired") {
        _ = try sourceCall(held[0], "source.find", ["query": .string("match-"), "cursor": .string(tokens[0])])
    }
    let recovered = try sourcePages(held[0], "source.find", ["query": .string("match-")], key: "matches")
    try sourceRequire(recovered.count == 45, "a fresh operation works after resource eviction")
    held.removeAll()
    print("PASS: global stream ceiling, honest cursor eviction and complete restart")

    // Real owner integration, including Thread only, uses the same tools.
    let probe = ScriptedInference(turns: [EngineTurn(text: "Attach a folder with the paperclip."),
        EngineTurn(text: "", calls: [ProposedTool(name: "source.find", arguments: ["query": .string("target.txt")])]),
        EngineTurn(text: "", calls: [ProposedTool(name: "source.read", arguments: ["path": .string(deep + "/target.txt")])]),
        EngineTurn(text: "The file says deep target. [S1]")])
    let runtime = try SevraRuntime(homeURL: base.appendingPathComponent("Home"), dbmd: dbmd, inference: probe)
    let thread = try await runtime.newThread(mode: .threadOnly)
    try await runtime.submit(threadID: thread, text: "Can you access files on my Mac?", nonce: "capabilities")
    _ = try await terminal(runtime, thread)
    let prompts = await probe.observedContexts
    try sourceRequire(prompts[0][0].content.contains("running locally on this Mac") && prompts[0][0].content.contains("paperclip"), "capability prompt explains local execution and how to attach sources")
    try await runtime.attach(threadID: thread, folder: base.appendingPathComponent("deep"))
    try await runtime.submit(threadID: thread, text: "Read the target file", nonce: "live-files")
    let response = try await terminal(runtime, thread)
    try sourceRequire(response.run?.state == .completed && response.run?.excerpts?.first?.content == "deep target" && response.run?.tools?.contains(.read) == true, "Thread only supports live tools and real cited reads")
    try await runtime.shutdown()
    print("PASS: explicit depth coverage, direct deep navigation, accurate capability context and owner tool-loop integration")
}
