import Foundation
import Slotstream

/// What one response cost on this Mac, as the engine measured it. Recorded
/// with the run so a person can look at it later: numbers only, never the
/// thought or any conversation text, and never sent anywhere.
public struct ResponseMetrics: Codable, Sendable, Equatable {
    /// Tokens the model wrote for the reply, tool calls included, and the
    /// decode time they took, summed over the job's model requests. Reading
    /// the context is not part of these.
    public var answerTokens = 0
    public var answerSeconds = 0.0
    /// The same for thoughts, when the thread thinks.
    public var thoughtTokens = 0
    public var thoughtSeconds = 0.0
    /// Prompt tokens the model had to compute, and the time that took,
    /// summed over the job's model requests.
    public var readTokens = 0
    public var readSeconds = 0.0
    /// Prompt tokens the first request took from an earlier state of the
    /// conversation instead of reading them again.
    public var cachedTokens = 0
    /// The largest prompt this response used, and the window it had.
    public var contextTokens = 0
    public var windowTokens = 0
    /// From the start of the first request, after any model load, to the
    /// first token the model generated, thought or answer.
    public var firstTokenSeconds: Double?
    /// Present when this response had to load the model first.
    public var loadSeconds: Double?
    /// Model requests in the job. More than one when it used tools.
    public var rounds = 0
    /// Share of expert lookups while writing that were already in memory,
    /// weighted by the tokens each request wrote.
    public var expertHitRate: Double?
    /// The current process budget, which can be below the person's saved limit.
    public var budgetGB: Double?
    public var customBudget: Bool?
    public var memoryLimitGB: Double?
    public init() {}

    public var answerRate: Double? { Self.rate(answerTokens, answerSeconds) }
    public var thoughtRate: Double? { Self.rate(thoughtTokens, thoughtSeconds) }
    public var readRate: Double? { Self.rate(readTokens, readSeconds) }
    static func rate(_ tokens: Int, _ seconds: Double) -> Double? {
        tokens > 0 && seconds > 0 && seconds.isFinite ? Double(tokens) / seconds : nil
    }

    /// Adds one engine request of the current turn. Reading adds up over the
    /// requests, whatever each one had to read; only the first request's
    /// reuse counts as reuse from earlier in the conversation.
    mutating func record(_ stats: GenStats, thought: Bool, first: Bool) {
        let written = answerTokens + thoughtTokens
        if thought { thoughtTokens += stats.decodeTokens; thoughtSeconds += stats.decodeSeconds }
        else { answerTokens += stats.decodeTokens; answerSeconds += stats.decodeSeconds }
        if first { cachedTokens = stats.reusedPrefixTokens }
        readTokens += stats.prefillTokens; readSeconds += stats.prefillSeconds
        contextTokens = max(contextTokens, stats.promptTokens)
        if stats.decodeTokens > 0 {
            let before = Double(written), added = Double(stats.decodeTokens)
            expertHitRate = ((expertHitRate ?? 0) * before + stats.expertHitRate * added) / (before + added)
        }
    }

    /// A job's total after another of its model requests. Sums what adds up,
    /// keeps the first request's start, and weights the hit rate by tokens.
    public func adding(_ next: ResponseMetrics) -> ResponseMetrics {
        var total = self
        total.answerTokens += next.answerTokens; total.answerSeconds += next.answerSeconds
        total.thoughtTokens += next.thoughtTokens; total.thoughtSeconds += next.thoughtSeconds
        total.readTokens += next.readTokens; total.readSeconds += next.readSeconds
        if rounds == 0 { total.cachedTokens = next.cachedTokens }
        total.contextTokens = max(contextTokens, next.contextTokens)
        total.windowTokens = max(windowTokens, next.windowTokens)
        total.firstTokenSeconds = rounds == 0 ? next.firstTokenSeconds : firstTokenSeconds ?? next.firstTokenSeconds
        if loadSeconds != nil || next.loadSeconds != nil { total.loadSeconds = (loadSeconds ?? 0) + (next.loadSeconds ?? 0) }
        total.rounds += next.rounds
        let mine = Double(answerTokens + thoughtTokens), theirs = Double(next.answerTokens + next.thoughtTokens)
        switch (expertHitRate, next.expertHitRate) {
        case let (a?, b?): total.expertHitRate = mine + theirs > 0 ? (a * mine + b * theirs) / (mine + theirs) : nil
        case let (a, b): total.expertHitRate = a ?? b
        }
        total.budgetGB = next.budgetGB ?? budgetGB
        total.customBudget = next.customBudget ?? customBudget
        total.memoryLimitGB = next.customBudget != nil ? next.memoryLimitGB : memoryLimitGB
        return total
    }
}

extension Run {
    /// Adds one model round's thinking and numbers to the run's totals.
    mutating func record(thinking receipt: ThinkingReceipt?, metrics spent: ResponseMetrics?) {
        if let receipt { thinking = thinking.map { $0.merged(with: receipt) } ?? receipt }
        if let spent { metrics = (metrics ?? ResponseMetrics()).adding(spent) }
    }
}

/// Plain text for the numbers, shared by the app, the local CLI and checks.
public enum ResponseMetricsFormat {
    /// "14.2", or "9" when a rate has no useful decimal at that size.
    public static func rate(_ value: Double) -> String {
        value >= 100 ? String(Int(value.rounded())) : String(format: "%.1f", value)
    }
    /// "0.8 s", "12 s" or "1 min 5 s".
    public static func seconds(_ value: Double) -> String {
        let v = max(0, value)
        if v < 10 { return String(format: "%.1f s", v) }
        return ThinkingPolicy.describe(v)
    }
    public static func count(_ value: Int) -> String { value.formatted(.number.grouping(.automatic)) }
    public static func tokens(_ value: Int) -> String { count(value) + (value == 1 ? " token" : " tokens") }
    /// A response's resolved budget and, when recorded, the separate saved ceiling.
    public static func budgetText(_ gb: Double, custom: Bool, limitGB: Double? = nil) -> String {
        if custom, let limitGB {
            return String(format: "about %.1f GB, within your %.1f GB limit", gb, limitGB)
        }
        return String(format: "about %.1f GB, %@", gb, custom ? "custom setting" : "automatic")
    }

    /// The one line under a reply, for example
    /// "14.2 tok/s · 318 tokens · 2.1 s to first token".
    public static func line(_ m: ResponseMetrics) -> String? {
        var parts: [String] = []
        if let rate = m.answerRate { parts.append(Self.rate(rate) + " tok/s") }
        if m.answerTokens > 0 { parts.append(tokens(m.answerTokens)) }
        if let first = m.firstTokenSeconds { parts.append(seconds(first) + " to first token") }
        if let load = m.loadSeconds { parts.append("model loaded in " + seconds(load)) }
        return parts.isEmpty ? nil : parts.joined(separator: " · ")
    }

    /// Everything, one fact per line, for Copy details and the CLI. Numbers
    /// only: no thought, prompt or reply text.
    public static func report(_ m: ResponseMetrics, thinking: ThinkingReceipt?) -> String {
        var lines: [String] = []
        if m.answerTokens > 0 {
            lines.append("Writing: \(tokens(m.answerTokens)) in \(seconds(m.answerSeconds))" + (m.answerRate.map { ", \(rate($0)) tok/s" } ?? ""))
        }
        if let thinking {
            var line = "Thinking: \(thinking.line)"
            if m.thoughtTokens > 0 { line += " \(tokens(m.thoughtTokens))" + (m.thoughtRate.map { ", \(rate($0)) tok/s" } ?? "") + "." }
            lines.append(line)
        }
        if let first = m.firstTokenSeconds { lines.append("First token: \(seconds(first))") }
        if m.readTokens > 0 || m.cachedTokens > 0 {
            lines.append("Reading: \(tokens(m.readTokens)) in \(seconds(m.readSeconds))" + (m.readRate.map { ", \(rate($0)) tok/s" } ?? "") + (m.cachedTokens > 0 ? "; \(count(m.cachedTokens)) reused from earlier in the conversation" : ""))
        }
        if m.contextTokens > 0 { lines.append("Context: \(count(m.contextTokens))" + (m.windowTokens > 0 ? " of \(count(m.windowTokens))" : "") + " tokens") }
        if let load = m.loadSeconds { lines.append("Model load: \(seconds(load))") }
        if m.rounds > 1 { lines.append("Model rounds: \(m.rounds)") }
        if let hits = m.expertHitRate { lines.append("Expert cache hits while writing: \(Int((hits * 100).rounded()))%") }
        if let budget = m.budgetGB { lines.append("Memory budget: " + budgetText(budget, custom: m.customBudget == true, limitGB: m.memoryLimitGB)) }
        return lines.joined(separator: "\n")
    }
}
