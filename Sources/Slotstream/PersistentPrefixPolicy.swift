// Persistent prefix cache: the index entries, lineage and the pure decisions,
// kept free of disk and GPU access so `persistent-prefix-policy` checks every
// branch.

import Foundation

/// One head in the directory as the index knows it. Heads written under
/// another identity or format carry no token ids and only count bytes.
package struct PersistentPrefixEntry: Equatable, Sendable {
    package let file: String
    package let identity: String
    package let tokens: [Int]
    package var splicingTokens: [Int]? = nil
    package let prefillChunk: Int?
    package var bytes: Int64
    package var lastUsed: Double
    package let sequenceBytes: Int
    package let residentBytes: Int
    package let hasDraft: Bool
    /// The state continued an earlier persisted state of its conversation.
    package let continued: Bool
    /// Written inside a prompt, at a boundary other conversations start with
    /// (a system prompt, a shared document), rather than at the end of a
    /// reply. A later save of a conversation that extends it never replaces
    /// it: it is not that conversation's previous turn.
    package let shared: Bool
    /// Sequence arrays by name, with the extents holding their rows.
    package let sequences: [String: PersistentPrefixFile.SequenceRecord]
    /// Every segment the head references.
    package let segments: Set<String>

    package init(file: String, identity: String, tokens: [Int], bytes: Int64, lastUsed: Double,
                 sequenceBytes: Int = 0, residentBytes: Int = 0, hasDraft: Bool = false, continued: Bool = false,
                 shared: Bool = false, prefillChunk: Int? = nil, sequences: [String: PersistentPrefixFile.SequenceRecord] = [:]) {
        self.prefillChunk = prefillChunk
        self.file = file; self.identity = identity; self.tokens = tokens; self.bytes = bytes
        self.lastUsed = lastUsed; self.sequenceBytes = sequenceBytes; self.residentBytes = residentBytes
        self.hasDraft = hasDraft; self.continued = continued; self.shared = shared; self.sequences = sequences
        segments = Set(sequences.values.flatMap { $0.extents.map(\.segment) })
    }
}

/// One segment file as the index knows it.
package struct PersistentPrefixSegmentEntry: Equatable, Sendable {
    package let file: String
    package let identity: String
    package let bytes: Int64
    /// Rows by array name; a segment holds at most one range per array.
    package let rows: [String: PersistentPrefixFile.RowsRecord]

    package init(file: String, identity: String, bytes: Int64, rows: [String: PersistentPrefixFile.RowsRecord]) {
        self.file = file; self.identity = identity; self.bytes = bytes; self.rows = rows
    }
}

/// The persisted head a live state's committed rows are known to equal,
/// because the state was written as that head or restored from it and has
/// only grown since. A later save of the state references that head's
/// segments for the rows below its boundary and writes only newer rows.
package struct PersistentPrefixLineage: Equatable, Sendable {
    /// The tier instance that wrote or read the head.
    package let tier: UUID
    /// The head's file name, derived from the identity and token ids.
    package let head: String
    package let tokenCount: Int
    package let sequences: [String: PersistentPrefixFile.SequenceRecord]

    package init(tier: UUID, head: String, tokenCount: Int, sequences: [String: PersistentPrefixFile.SequenceRecord]) {
        self.tier = tier; self.head = head; self.tokenCount = tokenCount; self.sequences = sequences
    }
}

extension Qwen4ExpModel.State {
    /// A rewind below the persisted boundary may rewrite those rows with other
    /// bits, so they no longer equal the head's.
    func dropPersistedLineage(below tokens: Int, draftRows: Int? = nil) {
        guard let lineage = persistedLineage else { return }
        let draft = lineage.sequences["draft.kv.keys"]?.live
        if lineage.tokenCount > tokens || (draftRows != nil && draft != nil && draftRows! < draft!) {
            persistedLineage = nil
        }
    }
}

/// Eviction classes, in removal order.
package enum PersistentPrefixValue: Int, Comparable, Sendable, CaseIterable {
    /// Written by another binary, model, setting or format: never usable here.
    case foreign
    /// Unused for longer than the configured maximum age.
    case expired
    /// Never continued and not extended by a later state: most one-off requests.
    case oneOff
    /// Extended by a later state, and kept so its last turn can be regenerated
    /// or edited without re-reading the conversation.
    case parent
    /// The latest state of a conversation that has been continued.
    case conversation
    /// A prefix at least two conversations that do not continue each other
    /// start with: every later conversation that starts with it skips that
    /// prompt, so it outlasts any single conversation.
    case shared

    package static func < (a: PersistentPrefixValue, b: PersistentPrefixValue) -> Bool { a.rawValue < b.rawValue }

    package var label: String {
        switch self {
        case .foreign: return "other build"
        case .expired: return "expired"
        case .oneOff: return "one-off"
        case .parent: return "parent"
        case .conversation: return "conversation"
        case .shared: return "shared prefix"
        }
    }
}

/// Which parent rows a save reuses, per sequence array.
package struct PersistentPrefixReuse: Equatable, Sendable {
    /// Parent extents the new head references, by array name.
    package var extents: [String: [PersistentPrefixFile.Extent]] = [:]
    /// The first row each array writes to the new segment.
    package var firstNewRow: [String: Int] = [:]
    /// Segments the new head keeps referencing.
    package var segments: Set<String> = []
    /// Reuse was refused because the head would reference too many segments.
    package var compacted = false
}

package enum PersistentPrefixPolicy {
    package typealias Extent = PersistentPrefixFile.Extent
    package typealias SequenceRecord = PersistentPrefixFile.SequenceRecord

    package static func isExpired(_ entry: PersistentPrefixEntry, now: Double, maxAge: TimeInterval?) -> Bool {
        guard let maxAge else { return false }
        return entry.lastUsed < now - maxAge
    }

    /// The longest own unexpired state the prompt strictly extends and that is
    /// longer than what memory already retains. Same extend-only rule as
    /// PrefixCache. A request that will speculate needs the draft cache, or it
    /// would finish plain and every later save of the conversation would lack it.
    /// `boundaries`, when given, are the incoming prompt's own prefill pass
    /// boundaries: a restored state of any other length would continue this
    /// read from a position it never reads through (PrefixResumeRule).
    package static func bestMatch(_ entries: [PersistentPrefixEntry], identity: String, prompt: [Int],
                                  longerThan retained: Int, requireDraft: Bool,
                                  now: Double, maxAge: TimeInterval?,
                                  boundaries: Set<Int>? = nil, prefillChunk: Int? = nil) -> PersistentPrefixEntry? {
        var best: PersistentPrefixEntry?
        for entry in entries where entry.identity == identity && !entry.tokens.isEmpty
            && entry.tokens.count > retained && prompt.count > entry.tokens.count
            && (!requireDraft || entry.hasDraft) && !isExpired(entry, now: now, maxAge: maxAge)
            && (boundaries?.contains(entry.tokens.count) ?? true)
            && (boundaries == nil || (prefillChunk != nil && entry.prefillChunk == prefillChunk))
            && prompt.starts(with: entry.tokens) {
            if best == nil || entry.tokens.count > best!.tokens.count { best = entry }
        }
        return best
    }

    /// The longest own unexpired state that strictly extends `prefix`: Engine's
    /// spliced encoding recovers a previous turn's exact ids from it.
    package static func longestExtension(_ entries: [PersistentPrefixEntry], identity: String, of prefix: [Int],
                                         now: Double, maxAge: TimeInterval?) -> [Int]? {
        var best: [Int]?
        for ids in extensions(entries, identity: identity, of: prefix, now: now, maxAge: maxAge) {
            if best == nil || ids.count > best!.count { best = ids }
        }
        return best
    }

    /// Metadata candidates only. The caller checks the assistant turn before
    /// choosing a branch; numerical restore still uses `bestMatch`.
    package static func extensions(_ entries: [PersistentPrefixEntry], identity: String, of prefix: [Int],
                                   now: Double, maxAge: TimeInterval?) -> [[Int]] {
        var candidates: [[Int]] = []
        for entry in entries where entry.identity == identity
            && !isExpired(entry, now: now, maxAge: maxAge) {
            let ids = entry.splicingTokens ?? entry.tokens
            guard ids.count > prefix.count, ids.starts(with: prefix) else { continue }
            candidates.append(ids)
        }
        return candidates
    }

    /// Own states a save of `tokens` makes redundant: every strict prefix
    /// except the longest, which stays so the last turn can be regenerated.
    /// A shared prefix is never one of them: it belongs to every conversation
    /// that starts with it, not to the one saving now.
    package static func redundantAncestors(_ entries: [PersistentPrefixEntry], identity: String,
                                           by tokens: [Int]) -> [PersistentPrefixEntry] {
        let prefixes = entries.filter { $0.identity == identity && !$0.tokens.isEmpty && !$0.shared
            && $0.tokens.count < tokens.count && tokens.starts(with: $0.tokens) }
        guard let parent = prefixes.max(by: { ($0.tokens.count, $1.file) < ($1.tokens.count, $0.file) }) else { return [] }
        return prefixes.filter { $0.file != parent.file }
    }

    /// How many tokens the longest own unexpired state has in common with
    /// the start of `prompt`. Zero when no state shares a first token. The
    /// state that shares the most is usually another conversation with the
    /// same system prompt or document: a save at that boundary lets every
    /// later prompt that starts the same way skip it.
    package static func longestCommonPrefix(_ entries: [PersistentPrefixEntry], identity: String, prompt: [Int],
                                            now: Double, maxAge: TimeInterval?) -> Int {
        var best = 0
        for entry in entries where entry.identity == identity && !entry.tokens.isEmpty
            && !isExpired(entry, now: now, maxAge: maxAge) {
            best = max(best, commonPrefixLength(entry.tokens, prompt))
        }
        return best
    }

    package static func commonPrefixLength(_ a: [Int], _ b: [Int]) -> Int {
        var n = 0
        let limit = min(a.count, b.count)
        while n < limit, a[n] == b[n] { n += 1 }
        return n
    }

    /// Where a prompt's system message ends, when it starts with one: the
    /// index just past the first turn end after the system header, so a state
    /// written there is a prefix of every later conversation with the same
    /// system prompt, whatever role follows. `header` and `turnEnd` are the
    /// template's ids for `<|im_start|>system\n` and `<|im_end|>\n`.
    package static func systemPrefixBoundary(_ ids: [Int], header: [Int], turnEnd: [Int]) -> Int? {
        guard !header.isEmpty, !turnEnd.isEmpty, ids.starts(with: header) else { return nil }
        var index = header.count
        while index + turnEnd.count <= ids.count {
            if ids[index ..< index + turnEnd.count].elementsEqual(turnEnd) { return index + turnEnd.count }
            index += 1
        }
        return nil
    }

    private static func extends(_ child: PersistentPrefixEntry, _ parent: PersistentPrefixEntry) -> Bool {
        child.identity == parent.identity && child.file != parent.file && !parent.tokens.isEmpty
            && child.tokens.count > parent.tokens.count
            && child.tokens[parent.tokens.count - 1] == parent.tokens[parent.tokens.count - 1]
            && child.tokens.starts(with: parent.tokens)
    }

    package static func value(of entry: PersistentPrefixEntry, in entries: [PersistentPrefixEntry], identity: String,
                              now: Double, maxAge: TimeInterval?) -> PersistentPrefixValue {
        if entry.identity != identity || entry.tokens.isEmpty { return .foreign }
        if isExpired(entry, now: now, maxAge: maxAge) { return .expired }
        let children = entries.filter { extends($0, entry) }
        // Lineages, not turns: a child that another child extends is the same
        // conversation one turn earlier. Two lineages make the state shared,
        // whether it was written as a shared prefix or as a reply that two
        // conversations happen to continue.
        let lineages = children.filter { child in !children.contains { extends($0, child) } }
        if lineages.count >= 2 { return .shared }
        if !children.isEmpty { return .parent }
        return entry.continued && !entry.shared ? .conversation : .oneOff
    }

    /// Removal order when space is needed: class, then least recently used,
    /// then name, so the order is deterministic.
    package static func evictionOrder(_ entries: [PersistentPrefixEntry], identity: String, now: Double,
                                      maxAge: TimeInterval?) -> [PersistentPrefixEntry] {
        entries.map { ($0, value(of: $0, in: entries, identity: identity, now: now, maxAge: maxAge)) }
            .sorted { a, b in
                if a.1 != b.1 { return a.1 < b.1 }
                if a.0.lastUsed != b.0.lastUsed { return a.0.lastUsed < b.0.lastUsed }
                return a.0.file < b.0.file
            }
            .map(\.0)
    }

    /// Bytes held with these heads kept: their files, plus every segment they
    /// or the incoming save (`pinned`) reference, each counted once.
    package static func heldBytes(_ entries: [PersistentPrefixEntry], segments: [String: Int64],
                                  pinned: Set<String>) -> Int64 {
        var referenced = pinned
        for entry in entries { referenced.formUnion(entry.segments) }
        return entries.reduce(Int64(0)) { $0 + $1.bytes } + referenced.reduce(Int64(0)) { $0 + (segments[$1] ?? 0) }
    }

    /// Heads to remove so `incoming` new bytes fit the quota once `freed`
    /// heads are gone. A segment's bytes return only when no remaining head
    /// and no pinned segment of the incoming save uses it. Nil when not even
    /// removing every head makes room.
    package static func evictionVictims(_ entries: [PersistentPrefixEntry], segments: [String: Int64],
                                        identity: String, quota: Int64, incoming: Int64, pinned: Set<String>,
                                        freed: Set<String>, now: Double,
                                        maxAge: TimeInterval?) -> [PersistentPrefixEntry]? {
        guard incoming >= 0, heldBytes([], segments: segments, pinned: pinned) + incoming <= quota else { return nil }
        var kept = entries.filter { !freed.contains($0.file) }
        var victims: [PersistentPrefixEntry] = []
        for victim in evictionOrder(kept, identity: identity, now: now, maxAge: maxAge) {
            if heldBytes(kept, segments: segments, pinned: pinned) + incoming <= quota { break }
            kept.removeAll { $0.file == victim.file }
            victims.append(victim)
        }
        return heldBytes(kept, segments: segments, pinned: pinned) + incoming <= quota ? victims : nil
    }

    /// Segments no head references.
    package static func unreferencedSegments(_ entries: [PersistentPrefixEntry],
                                             segments: some Collection<String>) -> [String] {
        let referenced = Set(entries.flatMap(\.segments))
        return segments.filter { !referenced.contains($0) }.sorted()
    }

    /// Do the extents tile rows base..<base+live exactly, in order, over
    /// valid segment names?
    package static func tiles(_ record: SequenceRecord) -> Bool {
        guard record.base >= 0, record.live >= 0 else { return false }
        var next = record.base
        for extent in record.extents {
            guard PersistentPrefixFile.isSegmentName(extent.segment), extent.start == next,
                  extent.end > extent.start else { return false }
            next = extent.end
        }
        return next == record.end
    }

    /// Extents clipped to rows start..<end, or nil unless they tile it exactly.
    package static func clip(_ extents: [Extent], from start: Int, to end: Int) -> [Extent]? {
        guard start <= end else { return nil }
        var result: [Extent] = []
        var next = start
        for extent in extents where extent.end > start && extent.start < end {
            let lo = max(extent.start, start), hi = min(extent.end, end)
            guard lo == next else { return nil }
            result.append(Extent(segment: extent.segment, start: lo, end: hi))
            next = hi
        }
        return next == end ? result : nil
    }

    /// Why an own head cannot be restored from these segments, or nil.
    package static func danglingReason(_ entry: PersistentPrefixEntry,
                                       segments: [String: PersistentPrefixSegmentEntry]) -> String? {
        for record in entry.sequences.values.sorted(by: { $0.name < $1.name }) {
            guard tiles(record) else { return "\(record.name) extents do not tile its live rows" }
            for extent in record.extents {
                guard let segment = segments[extent.segment], segment.identity == entry.identity else {
                    return "segment \(extent.segment) is missing"
                }
                guard let rows = segment.rows[record.name], rows.dtype == record.dtype,
                      rows.leading == record.leading, rows.trailing == record.trailing,
                      rows.start <= extent.start, extent.end <= rows.end else {
                    return "segment \(extent.segment) does not hold \(record.name) rows \(extent.start)..<\(extent.end)"
                }
            }
        }
        return nil
    }

    /// For each array of a new state, the parent extents it references and
    /// the first row it writes. `child` records carry no extents. A parent
    /// array is reused only with the same dtype and row geometry, a base no
    /// later than the child's, live rows the child still covers, and every
    /// segment present. Past `maximumSegments` referenced segments the save
    /// writes every row instead, so one head never needs a long chain.
    package static func reuse(child: [SequenceRecord], parent: [String: SequenceRecord]?,
                              segmentExists: (String) -> Bool, maximumSegments: Int) -> PersistentPrefixReuse {
        var plan = PersistentPrefixReuse()
        var writesRows = false
        for array in child {
            plan.extents[array.name] = []
            plan.firstNewRow[array.name] = array.base
            guard let old = parent?[array.name], old.dtype == array.dtype, old.axis == array.axis,
                  old.leading == array.leading, old.trailing == array.trailing,
                  old.base <= array.base, old.end <= array.end, tiles(old),
                  let kept = clip(old.extents, from: array.base, to: old.end),
                  kept.allSatisfy({ segmentExists($0.segment) }) else {
                writesRows = writesRows || array.live > 0
                continue
            }
            plan.extents[array.name] = kept
            plan.firstNewRow[array.name] = max(array.base, old.end)
            plan.segments.formUnion(kept.map(\.segment))
            writesRows = writesRows || array.end > max(array.base, old.end)
        }
        if plan.segments.count + (writesRows ? 1 : 0) > max(1, maximumSegments) {
            var compacted = PersistentPrefixReuse()
            for array in child {
                compacted.extents[array.name] = []
                compacted.firstNewRow[array.name] = array.base
            }
            compacted.compacted = true
            return compacted
        }
        return plan
    }
}
