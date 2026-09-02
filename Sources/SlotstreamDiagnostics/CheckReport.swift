// The result of a diagnostic. Every check in this module returns one, and the
// CLI's `--json` is its encoding, so a run captured into the store under
// `db/sources/runs/` is the same bytes a host app would see.
//
// A check that needs the machine quiet reports `skipped` with the reason
// rather than failing — `elastic-drill`'s existing behaviour, which must not
// regress into a red gate on a busy Mac.

import Foundation

/// One assertion inside a check.
public struct CheckItem: Sendable, Codable {
    public var name: String
    public var passed: Bool
    /// What was actually observed, when that is worth printing on failure.
    public var detail: String?

    public init(name: String, passed: Bool, detail: String? = nil) {
        self.name = name
        self.passed = passed
        self.detail = detail
    }
}

public struct CheckReport: Sendable, Codable {
    public var name: String
    /// Nil unless the check declined to run; the string says why.
    public var skipped: String?
    public var items: [CheckItem]
    /// Numbers the check measured, for the store's run records.
    public var measurements: [String: Double]

    /// A skipped check is not a failure. An empty check is: a check that
    /// asserts nothing has silently stopped testing whatever it named.
    public var passed: Bool {
        if skipped != nil { return true }
        return !items.isEmpty && items.allSatisfy(\.passed)
    }

    public var failures: [CheckItem] { items.filter { !$0.passed } }

    public init(
        name: String, skipped: String? = nil, items: [CheckItem] = [],
        measurements: [String: Double] = [:]
    ) {
        self.name = name
        self.skipped = skipped
        self.items = items
        self.measurements = measurements
    }

    private enum CodingKeys: String, CodingKey {
        case name, skipped, items, measurements, passed
    }

    // `passed` is derived, but it is written out so a stored run reads
    // correctly without reimplementing the rule.
    public func encode(to encoder: any Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encode(name, forKey: .name)
        try c.encodeIfPresent(skipped, forKey: .skipped)
        try c.encode(items, forKey: .items)
        try c.encode(measurements, forKey: .measurements)
        try c.encode(passed, forKey: .passed)
    }

    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        name = try c.decode(String.self, forKey: .name)
        skipped = try c.decodeIfPresent(String.self, forKey: .skipped)
        items = try c.decode([CheckItem].self, forKey: .items)
        measurements = try c.decodeIfPresent([String: Double].self, forKey: .measurements) ?? [:]
    }
}

/// Accumulates items while a check runs.
public struct CheckBuilder {
    public let name: String
    private var items: [CheckItem] = []
    private var measurements: [String: Double] = [:]
    private var skipReason: String?

    public init(_ name: String) { self.name = name }

    public mutating func expect(_ name: String, _ passed: Bool, _ detail: @autoclosure () -> String? = nil) {
        items.append(CheckItem(name: name, passed: passed, detail: passed ? nil : detail()))
    }

    public mutating func equal<T: Equatable>(_ name: String, _ got: T, _ want: T) {
        items.append(
            CheckItem(
                name: name, passed: got == want,
                detail: got == want ? nil : "got \(got), want \(want)"))
    }

    public mutating func measure(_ key: String, _ value: Double) {
        measurements[key] = value
    }

    public mutating func skip(_ reason: String) { skipReason = reason }

    public func report() -> CheckReport {
        CheckReport(name: name, skipped: skipReason, items: items, measurements: measurements)
    }
}
