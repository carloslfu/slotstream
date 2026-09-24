import Foundation
import SevraRuntime
import Slotstream

/// Ordinary checks stay at 10 GB. A larger MTP allocation is an explicitly
/// requested performance profile, admitted only against real free memory.
func realCheckBudget() throws -> Double {
    let args = CommandLine.arguments
    guard let index = args.firstIndex(of: "--mtp-profile-gb") else { return 10 }
    guard index + 1 < args.count, let budget = Double(args[index + 1]), budget.isFinite,
          budget >= 10, budget <= 33, (Machine.current().availableGB ?? 0) >= budget + 3 else {
        throw SevraError.refused("The MTP measurement needs a budget between 10 and 33 GB and target plus 3 GB reclaimable.")
    }
    let model = WeightStore.default.modelDirectory
    let plan = try PerformancePolicy.plan(.init(budget: .custom, customGB: budget), on: .current(),
        mtpAvailable: MTPWeights.present(modelDir: model), decodeLookahead: .environment(modelDirectory: model))
    try require(plan.mtpEnabled && plan.targetGB == budget, "the requested measurement actually enables MTP at its full budget")
    print("MTP_PROFILE " + String(decoding: try JSONSerialization.data(withJSONObject: plan.json(), options: [.sortedKeys]), as: UTF8.self))
    return budget
}

/// Opt-in, real-device comparison of complete Desktop memory allocations.
/// Each invocation owns one engine; the driver interleaves separate processes.
func realSpeedCheckIfRequested() async throws -> Bool {
    let args = CommandLine.arguments
    guard args.contains("--real-speed") else { return false }
    func argument(_ name: String) -> String? {
        guard let i = args.firstIndex(of: name), i + 1 < args.count else { return nil }
        return args[i + 1]
    }
    guard let budget = argument("--memory-gb").flatMap(Double.init), budget.isFinite,
          budget >= 8.5, let arm = argument("--arm"),
          ["plain", "auto", "256", "512", "1024", "reserved256", "reserved512", "chat"].contains(arm),
          (Machine.current().availableGB ?? 0) >= budget + 3 else {
        throw SevraError.refused("Specify --memory-gb and --arm plain|auto|chat|256|512|1024|reserved256|reserved512, with target plus 3 GB reclaimable.")
    }
    let policy = try Int(arm).map { try RuntimeAllocationPolicy(prefillChunkOverride: $0) }
    let model = WeightStore.default.modelDirectory
    let plan = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: budget,
        mtp: arm == "plain" ? .off : .auto, mtpAvailable: MTPWeights.present(modelDir: model),
        vision: .off, maxContextTokens: PerformancePolicy.contextTokens,
        qualification: false, runtimePolicy: policy, decodeLookahead: .environment(modelDirectory: model))
    let engine = try await Engine(modelDir: model, plan: plan)
    if arm == "chat" {
        try engine.configureShortPromptPrefill(maxPromptTokens: PerformancePolicy.shortPromptTokens, chunk: PerformancePolicy.shortPromptChunk)
        for (limit, chunk) in [(-1, 512), (ContextPolicy.modelLimit + 1, 512), (1536, 255), (1536, 4097)] {
            do { try engine.configureShortPromptPrefill(maxPromptTokens: limit, chunk: chunk); throw SevraError.refused("CHECK FAILED: invalid short-prompt policy accepted") }
            catch { try require(!error.localizedDescription.contains("CHECK FAILED"), "invalid short-prompt policy is rejected") }
        }
    }
    // Keep the larger reservation available for automatic read sharing rather
    // than allocating every released workspace byte to the expert cache.
    if arm == "reserved256" { engine.generator.prefillChunk = min(256, plan.prefillChunk) }
    if arm == "reserved512" { engine.generator.prefillChunk = min(512, plan.prefillChunk) }
    defer { engine.dropPrefixCache() }
    func emit(_ value: [String: Any]) throws {
        print("SPEED " + String(decoding: try JSONSerialization.data(withJSONObject: value, options: [.sortedKeys]), as: UTF8.self))
        fflush(stdout)
    }
    try emit(["arm": arm, "plan": plan.json(), "conditions": ProcessMemory.operatingConditions().thermalState])
    var params = SampleParams(); params.temperature = 0; params.presencePenalty = 0; params.maxTokens = 96
    let inventory = (1...96).map { "Crate \($0) holds \($0 * 3) bolts and ships on day \($0 % 7 + 1)." }
    let system = ChatMessage(role: "system", content: "Answer directly and clearly. Do not use tools.")
    // Identical inputs across allocations, regardless of generated prose.
    var history = [system, ChatMessage(role: "user", content: inventory.prefix(20).joined(separator: " ") + " Explain how a bicycle stays balanced while moving, in about 120 words.")]
    for index in 0..<3 {
        if index > 0 {
            history += [ChatMessage(role: "assistant", content: inventory[(index * 12)..<(index * 12 + 12)].joined(separator: " ")),
                        ChatMessage(role: "user", content: index == 1 ? "Explain how rain forms and why some clouds do not produce rain, in about 120 words." : "Explain RAM, SSD storage and caching, in about 120 words.")]
        }
        let ids = try engine.encodeChatSpliced(history, tools: [], thinking: false, effort: nil)
        let result = engine.generate(promptIds: ids, params: params)
        try require(result.stats.runtimeError == nil && result.stats.decodeTokens > 0, "speed fixture completes")
        if arm == "chat" {
            try require(result.stats.prefillComputePasses.allSatisfy { $0 <= min(512, plan.prefillChunk) }, "short-chat compute stays within the live reservation")
        }
        let stats = try JSONSerialization.jsonObject(with: JSONEncoder().encode(result.stats))
        try emit(["arm": arm, "case": "conversation-\(index)", "stats": stats, "ids": result.ids])
        if index == 2 {
            // A hit must reproduce a fresh run using the same arithmetic policy.
            engine.dropPrefixCache()
            let cold = engine.generate(promptIds: ids, params: params)
            try require(cold.ids == result.ids, "reused and cold output tokens agree within the chosen policy")
            try emit(["arm": arm, "case": "conversation-cold-check", "stats": try JSONSerialization.jsonObject(with: JSONEncoder().encode(cold.stats)), "parity": true])
            if arm == "chat" {
                try engine.configureShortPromptPrefill(maxPromptTokens: 0, chunk: 512)
                try require(engine.generator.prefillChunk == plan.prefillChunk, "disabling the short-chat policy restores the planned schedule")
                try engine.configureShortPromptPrefill(maxPromptTokens: PerformancePolicy.shortPromptTokens, chunk: PerformancePolicy.shortPromptChunk)
            }
        }
    }
    if args.contains("--short-only") { return true }
    engine.dropPrefixCache(); params.maxTokens = 8
    let long = try engine.encodeChat([system, ChatMessage(role: "user", content: inventory.joined(separator: " ") + " How many bolts are in crate 37? Answer with just the number.")], thinking: false)
    let result = engine.generate(promptIds: long, params: params)
    try require(result.stats.runtimeError == nil && result.text.contains("111"), "long inventory is correct")
    try emit(["arm": arm, "case": "long-inventory", "stats": try JSONSerialization.jsonObject(with: JSONEncoder().encode(result.stats)), "correct": true])
    if args.contains("--extended") {
        engine.dropPrefixCache()
        let extended = (1...512).map { "Crate \($0) holds \($0 * 3) bolts and ships on day \($0 % 7 + 1)." }.joined(separator: " ")
        let prompt = try engine.encodeChat([system, ChatMessage(role: "user", content: extended + " How many bolts are in crate 37? Answer with just the number.")], thinking: false)
        let result = engine.generate(promptIds: prompt, params: params)
        try require(result.stats.runtimeError == nil && result.text.contains("111"), "extended inventory is correct")
        try emit(["arm": arm, "case": "extended-inventory", "stats": try JSONSerialization.jsonObject(with: JSONEncoder().encode(result.stats)), "correct": true])
    }
    return true
}
