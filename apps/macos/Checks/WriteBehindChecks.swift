import Foundation
import SevraRuntime

/// Clicks change memory at once and saves merge in the background; only a
/// promise of durability, such as a saved draft, waits for the disk.
func writeBehindChecks(root: URL, dbmd: URL) async throws {
    let home = root.appendingPathComponent("write-behind")
    var runtime: SevraRuntime? = try SevraRuntime(homeURL: home, dbmd: dbmd, inference: ScriptedInference(turns: []))
    let before = await runtime!.storageActivity().saves
    let clock = ContinuousClock(), start = clock.now
    var ids: [String] = []
    for i in 0..<40 { ids.append(try await runtime!.newThread(title: "Thread \(i)")) }
    for (i, id) in ids.enumerated() {
        try await runtime!.rename(threadID: id, title: "Renamed \(i)")
        try await runtime!.pin(threadID: id)
    }
    let clicks = clock.now - start
    // A save costs tens of milliseconds, so 120 clicks that each waited for
    // one would take seconds.
    try require(clicks < .milliseconds(1500), "120 clicks return without waiting for disk (\(clicks))")
    let draft = try await runtime!.saveDraft(threadID: ids[0], text: "durable draft")
    let saves = await runtime!.storageActivity().saves - before
    try require(saves < 60, "changes merge into fewer saves (\(saves) saves for 121 changes)")
    try await runtime!.shutdown(); runtime = nil
    let saved = try HomeStore(root: home, dbmd: dbmd).load()
    try require(saved.threads.filter { $0.title.hasPrefix("Renamed ") && $0.pinned }.count == 40
                && saved.threads.first { $0.id == ids[0] }?.draft == "durable draft" && draft.text == "durable draft",
                "every merged change reached disk")
    print("PASS: clicks apply at once, saves merge in the background, a saved draft waits for disk, nothing is lost (\(saves) saves)")
}
