import CryptoKit
import Foundation
import SevraRuntime
import Slotstream

/// Real-model app cache lifecycle, using only an explicitly disposable Home.
func realCacheCheckIfRequested() async throws -> Bool {
    guard CommandLine.arguments.contains("--real-cache") else { return false }
    let args = CommandLine.arguments
    guard let i = args.firstIndex(of: "--home"), i + 1 < args.count else { throw SevraError.refused("A real cache check requires a new --home directory.") }
    let home = URL(fileURLWithPath: args[i + 1]).standardizedFileURL
    let budget = try realCheckBudget()
    guard !FileManager.default.fileExists(atPath: home.path), (Machine.current().availableGB ?? 0) >= budget + 3 else {
        throw SevraError.refused("Use a new disposable Home and the selected budget plus 3 GB reclaimable memory.")
    }
    try FileManager.default.createDirectory(at: home, withIntermediateDirectories: true)
    let engine = LocalInference(memoryGB: budget)
    let thread = WorkThread(title: "Cache fixture")
    let context = InferenceCacheContext(home: home, thread: thread, thinking: false)
    func files() throws -> [String: String] {
        guard let directory = context.directory,
              let walker = FileManager.default.enumerator(at: directory, includingPropertiesForKeys: [.isRegularFileKey]) else { return [:] }
        var result: [String: String] = [:]
        for case let file as URL in walker where try file.resourceValues(forKeys: [.isRegularFileKey]).isRegularFile == true {
            let handle = try FileHandle(forReadingFrom: file); defer { try? handle.close() }
            var hash = SHA256()
            while let data = try handle.read(upToCount: 1 << 20), !data.isEmpty { hash.update(data: data) }
            result[file.lastPathComponent] = hash.finalize().map { String(format: "%02x", $0) }.joined()
        }
        return result
    }
    func ask(_ history: [ChatMessage], thinking: ThinkingRequest? = nil) async throws -> EngineTurn {
        try await engine.turn(history: history, tools: [], thinking: thinking, replyTokens: 256,
            control: ThinkingControl(), cancellation: Cancellation(), buffer: TurnBuffer())
    }
    do {
        try await engine.prepareCache(context)
        let inventory = (1 ... 128).map { "Crate \($0) holds \($0 * 3) bolts and ships on day \($0 % 7 + 1)." }.joined(separator: " ")
        var history = [ChatMessage(role: "user", content: inventory + " How many bolts are in crate 37? Answer with just the number.")]
        let first = try await ask(history)
        let firstStats = await engine.lastStats[0]
        try require((firstStats.persistentPrefix?.savedTokens ?? 0) >= 2048, "ordinary app turn saves an eligible checkpoint")
        try require(first.text.contains("111"), "first inventory answer is correct")
        print("CACHE_RELOAD before available=\(Machine.current().availableGB ?? -1) footprint=\(ProcessMemory.residentBytes())")
        await engine.unload()
        print("CACHE_RELOAD after available=\(Machine.current().availableGB ?? -1) footprint=\(ProcessMemory.residentBytes())")
        history += [ChatMessage(role: "assistant", content: first.text), ChatMessage(role: "user", content: "And crate 12? Just the number.")]
        let warm = try await ask(history)
        let warmStats = await engine.lastStats[0]
        print("CACHE_RELOAD warm budget=\(warm.metrics?.budgetGB ?? -1) load=\(warm.metrics?.loadSeconds ?? -1) drafts=\(warmStats.draftedTokens)")
        try require((warmStats.persistentPrefix?.restoredTokens ?? 0) >= 2048, "app reload restores a real disk checkpoint")
        try require(warm.text.contains("36"), "restored inventory answer is correct")
        let privateContext = InferenceCacheContext(home: home, thread: WorkThread(title: "Private", mode: .incognito), thinking: false)
        try await engine.prepareCache(privateContext)
        let before = try files()
        let cold = try await ask(history)
        let coldStats = await engine.lastStats[0]
        try require(cold.text == warm.text && coldStats.reusedPrefixTokens == 0, "private context drops held state and matches cold output")
        let afterPrivate = try files()
        try require(coldStats.persistentPrefix == nil && afterPrivate == before, "incognito neither restores nor changes disk cache")
        try require(warmStats.prefillTokens < coldStats.prefillTokens, "disk hit avoids real prompt work")

        // Direct callers are protected even without another prepareCache call.
        try await engine.prepareCache(context)
        let beforeThought = try files()
        _ = try await ask([ChatMessage(role: "user", content: "What is 17 times 23? Answer with the number.")],
            thinking: ThinkingRequest(level: ThinkingPolicy.level, budgetTokens: 8, replyTokens: 256, seed: 5))
        let thoughtStats = await engine.lastStats
        try require(thoughtStats.count == 2 && thoughtStats.allSatisfy { $0.persistentPrefix == nil }, "direct thinking call detaches disk before encoding")
        try require(([firstStats, warmStats, coldStats] + thoughtStats).allSatisfy { $0.peakMemoryGB <= budget },
            "app cache and both phases stay within the selected process limit")
        let afterThought = try files()
        try require(afterThought == beforeThought, "thought transition leaves all cache files byte-identical")
        if args.contains("--mtp-profile-gb") {
            let cancellation = Cancellation(), buffer = TurnBuffer()
            let running = Task {
                try await engine.turn(history: [ChatMessage(role: "user", content: "Count from 1 to 100, one number per line.")], tools: [],
                    thinking: nil, replyTokens: 256, control: ThinkingControl(), cancellation: cancellation, buffer: buffer)
            }
            var observed = false
            for _ in 0..<3000 {
                if (buffer.generation()?.tokens ?? 0) >= 8 { observed = true; break }
                try await Task.sleep(nanoseconds: 10_000_000)
            }
            cancellation.cancel()
            do { _ = try await running.value; throw SevraError.refused("CHECK FAILED: active cancellation was ignored") }
            catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "cancellation fails the incomplete turn") }
            try require(observed, "cancellation occurs during real token generation")
            let recovered = try await ask([ChatMessage(role: "user", content: "What is 6 times 7? Just the number.")])
            try require(recovered.text.contains("42"), "a correct request follows cancelled MTP generation")
            let offered = ToolCatalog.specs(for: [.read]).filter { $0.name == "source.list" }
            let tool = try await engine.turn(history: [
                ChatMessage(role: "system", content: "Use the provided source.list tool to inspect attached files. Do not invent file names."),
                ChatMessage(role: "user", content: "List the attached files using source.list now.")
            ], tools: offered.map(\.definition), cancellation: Cancellation(), buffer: TurnBuffer())
            try tool.validate(offered: offered)
            try require(tool.calls.count == 1 && tool.calls[0].name == "source.list", "MTP streams one complete typed tool call")
            print("PASS: MTP cancellation, correct recovery and complete typed tool call")
            let short = (1...40).map { "Crate \($0) holds \($0 * 3) bolts and ships on day \($0 % 7 + 1)." }.joined(separator: " ")
            var growing = [ChatMessage(role: "user", content: short + " How many bolts are in crate 10? Just the number.")]
            let opening = try await ask(growing)
            let openingStats = await engine.lastStats[0]
            try require(openingStats.promptTokens > 512 && openingStats.promptTokens < 1536, "fixture creates a short-chat checkpoint")
            growing += [ChatMessage(role: "assistant", content: opening.text), ChatMessage(role: "user", content: inventory + " How many bolts are in crate 37? Just the number.")]
            let crossed = try await ask(growing)
            let crossedStats = await engine.lastStats[0]
            try require(crossedStats.promptTokens >= 1536 && crossedStats.reusedPrefixTokens == 0, "long-prompt crossover rejects the old short-pass checkpoint")
            try await engine.prepareCache(privateContext)
            let fresh = try await ask(growing)
            try require(fresh.text == crossed.text && fresh.text.contains("111"), "schedule crossover matches a fresh long-prompt answer")
            let endingStats = await engine.lastStats
            try require(endingStats.allSatisfy { $0.peakMemoryGB <= budget }, "MTP lifecycle peak stays within the selected budget")
            print("PASS: short-to-long schedule crossover, fresh-output parity and bounded MTP lifecycle peak")
        }
        print(String(decoding: try JSONSerialization.data(withJSONObject: [
            "saved_tokens": firstStats.persistentPrefix?.savedTokens ?? 0,
            "restored_tokens": warmStats.persistentPrefix?.restoredTokens ?? 0,
            "warm_read_tokens": warmStats.prefillTokens, "cold_read_tokens": coldStats.prefillTokens,
            "warm_read_seconds": warmStats.prefillSeconds, "cold_read_seconds": coldStats.prefillSeconds,
            "answer": warm.text, "privacy_files_unchanged": true,
            "peak_physical_gb": ([firstStats, warmStats, coldStats] + thoughtStats).map(\.peakMemoryGB).max() ?? 0,
            "disk_files_before_private": before, "disk_files_after_private": afterPrivate,
            "disk_files_before_thinking": beforeThought, "disk_files_after_thinking": afterThought
        ], options: [.prettyPrinted, .sortedKeys]), as: UTF8.self))
        await engine.unload()
        return true
    } catch { await engine.unload(); throw error }
}
