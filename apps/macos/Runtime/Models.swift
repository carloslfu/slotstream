import Foundation
import CryptoKit

public struct DraftState: Equatable, Sendable {
    public var text: String
    public var revision: Int
    public init(text: String, revision: Int) { self.text = text; self.revision = revision }
}
public struct DraftConflict: Error, LocalizedError {
    public let current: DraftState
    public var errorDescription: String? { "The saved draft changed. Your current text has been preserved." }
    public init(current: DraftState) { self.current = current }
}

public enum SevraError: Error, LocalizedError {
    case refused(String), conflict(String), unavailable(String), ownerBusy, cancelled
    public var errorDescription: String? {
        switch self {
        case .refused(let s), .conflict(let s), .unavailable(let s): return s
        case .cancelled: return "Stopped. No further actions will run."
        case .ownerBusy: return "This Home is already open in another Sevra process. Attach to its local endpoint or use its window."
        }
    }
}

public enum MemoryMode: String, Codable, CaseIterable, Sendable {
    case shared, threadOnly, incognito
    public var title: String { switch self {
    case .shared: return "Shared memory"
    case .threadOnly: return "Thread only"
    case .incognito: return "Incognito"
    } }
}
public enum ThreadLifecycle: String, Codable, CaseIterable, Sendable { case open, needsYou, done, archived }
public enum RunState: String, Codable, Sendable {
    case queued, loading, running, needsYou, stopping, completed, stopped, failed, interrupted
    public var terminal: Bool { [.completed, .stopped, .failed, .interrupted].contains(self) }
}
public struct Message: Codable, Identifiable, Sendable, Equatable {
    public var id = UUID().uuidString.lowercased()
    public var role: String
    public var text: String
    public var date = Date()
    public var runID: String?
    public init(role: String, text: String, runID: String? = nil) { self.role = role; self.text = text; self.runID = runID }
}
public struct Citation: Codable, Identifiable, Sendable, Equatable {
    public var id: String
    public var path: String
    /// SHA-256 of the source file's bytes.
    public var hash: String
    /// UTF-8 byte range in the file, or in its deterministic extracted text.
    public var start: Int
    public var length: Int
    public var content: String?
    /// The first PDF page the excerpt covers.
    public var page: Int? = nil
    /// How the text was obtained when it is not the file itself: pdfkit,
    /// dbmd, appkit or ocr.
    public var method: String? = nil
    public init(id: String, path: String, hash: String, start: Int, length: Int, content: String?, page: Int? = nil, method: String? = nil) {
        self.id = id; self.path = path; self.hash = hash; self.start = start; self.length = length; self.content = content; self.page = page; self.method = method
    }
    public var location: String {
        var parts: [String] = []
        if let page { parts.append("page \(page)") }
        if method == "ocr" { parts.append("recognized text") }
        return parts.joined(separator: " · ")
    }
}
public struct ArtifactProposal: Codable, Identifiable, Sendable, Equatable {
    public var id: String
    public var filename: String
    public var content: String
    public var citations: [Citation]
    public var digest: String { digestBytes((try? encoded(self)) ?? Data()) }
    public init(id: String, filename: String, content: String, citations: [Citation]) { self.id = id; self.filename = filename; self.content = content; self.citations = citations }
}
public struct Run: Codable, Identifiable, Sendable, Equatable {
    public var id: String
    public var nonce: String
    public var inputDigest: String
    public var state: RunState
    public var status: String
    public var proposal: ArtifactProposal?
    public var artifact: String?
    public var trace: [String] = []
    public var order: Int?
    public var excerpts: [Citation]?
    public var context: ContextReceipt?
    /// Metadata only. The thought itself is never stored.
    public var thinking: ThinkingReceipt?
    /// What the response cost on this Mac: tokens, times and rates the engine
    /// measured. Numbers only. Absent for runs recorded before it existed.
    public var metrics: ResponseMetrics?
    /// File changes staged by this run, awaiting review or already applied.
    public var changes: ChangeSet?
    public var appProposal: AppProposal?
    public var skillProposal: SkillProposal?
    /// The skill this run followed, if any.
    public var skill: SkillUse?
    /// Tool groups offered to the model for this run.
    public var tools: [ToolGroup]?
    /// The app or skill this run published, for links in the conversation.
    public var published: String?
    public var awaitingReview: Bool { proposal != nil || appProposal != nil || skillProposal != nil || changes?.state == .proposed }
}
public struct WorkThread: Codable, Identifiable, Sendable, Equatable {
    public var id: String
    public var title: String
    public var mode: MemoryMode
    public var readsSharedMemory: Bool?
    public var lifecycle: ThreadLifecycle = .open
    public var pinned = false
    public var messages: [Message] = []
    public var draft = ""
    public var draftRevision: Int?
    public var run: Run?
    public var pastRuns: [Run]?
    public var promotedMessageIDs: [String] = []
    /// Sticky per thread: think before each answer until turned off. Absent means off.
    public var thinking: Bool?
    public init(id: String = UUID().uuidString.lowercased(), title: String, mode: MemoryMode = .shared) {
        self.id = id; self.title = title; self.mode = mode
        self.readsSharedMemory = mode != .incognito
    }
    public var allRuns: [Run] { (pastRuns ?? []) + (run.map { [$0] } ?? []) }
    public var savedRuns: [Run] { allRuns.filter { $0.artifact != nil } }
}
public struct MemoryRecord: Codable, Identifiable, Sendable, Equatable {
    public var id = UUID().uuidString.lowercased()
    public var text: String
    public var threadID: String
    public var messageID: String
    public var admitted: Bool
    public var forgotten = false
    public var supersedes: String?
    public var scope: MemoryMode?
    public var date = Date()
}
public struct HomeState: Codable, Sendable, Equatable {
    public var schema = 1
    public var storageLayout: Int?
    public var id = UUID().uuidString.lowercased()
    public var threads = [WorkThread(id: "home", title: "Home")]
    public var memories: [MemoryRecord] = []
    public var journal: [Message] = []
    public var journalDraft: String?
    public var journalDraftRevision: Int?
    public var journalSubmissions: [AcceptedSubmission]?
    public var revision = 0
    public var submissions: [AcceptedSubmission]?
    public var skills: [Skill]?
    public var apps: [MiniApp]?
    public init() {}

    /// Resolve quoted Home events without copying or changing their ownership.
    /// Display retains forgotten history; inference applies AI-use suppression.
    public func quotedHomeMessages(for thread: WorkThread) -> [Message] {
        guard thread.id != "home", !thread.promotedMessageIDs.isEmpty else { return [] }
        let ids = Set(thread.promotedMessageIDs)
        return threads.first { $0.id == "home" }?.messages.filter { ids.contains($0.id) } ?? []
    }
    public func conversationMessages(for thread: WorkThread) -> [Message] {
        quotedHomeMessages(for: thread) + thread.messages
    }
    public func continuation(of messageIDs: [String]) -> WorkThread? {
        let ids = Set(messageIDs)
        guard !ids.isEmpty else { return nil }
        return threads.first { $0.id != "home" && $0.mode != .incognito && Set($0.promotedMessageIDs) == ids }
    }
    public func citations(for messageID: String, in thread: WorkThread) -> [Citation] {
        let owner = thread.promotedMessageIDs.contains(messageID) ? threads.first { $0.id == "home" } : thread
        guard let owner, let message = owner.messages.first(where: { $0.id == messageID }),
              let run = owner.allRuns.first(where: { $0.id == message.runID }) else { return [] }
        return run.excerpts ?? []
    }
}
public struct AcceptedSubmission: Codable, Sendable, Equatable {
    public var threadID: String
    public var nonce: String
    public var digest: String
    public var runID: String
}
public struct RuntimeSnapshot: Sendable, Equatable {
    public var home: HomeState
    public var modelStatus: String
    public var attachments: [String: [AttachmentInfo]] = [:]
    public var attachmentNames: [String: String] { attachments.mapValues { $0.map(\.name).joined(separator: ", ") } }
    public var error: String?
    public var simulated: Bool
    public var performance: PerformanceSnapshot? = nil
    public var restoreReview: HomeRestoreReview? = nil
    public var storageNeedsReview = false
    /// The current thought, if one is running or just finished in this run.
    public var thinking: ThinkingObservation? = nil
    /// Recent thoughts by run id, one entry per thought in the run, kept in
    /// memory while Sevra is open.
    public var thinkingTraces: [String: [String]] = [:]
    /// Live writing speed of the response that is running. Memory only.
    public var generation: GenerationObservation? = nil
    /// Increments per collection when mini-app data changes.
    public var appDataRevision: [String: Int] = [:]
    /// The same counts for writes each app made itself, by app ID. An open
    /// app hears only about changes it did not make, so its own saves cannot
    /// feed a reload loop.
    public var appDataWrites: [String: [String: Int]] = [:]
    /// Device-local app data grants, by app ID.
    public var grants: [String: AppGrant] = [:]
    /// Whether this build can read documents, images and knowledge bases.
    public var documentsAvailable = false
}
/// How fast the running response is writing, from token arrival times. The
/// numbers recorded with the run come from the engine when it finishes.
public struct GenerationObservation: Sendable, Equatable {
    public var threadID: String
    public var runID: String
    /// True while the model is thinking, false once it writes the reply.
    public var thinking: Bool
    public var tokens: Int
    /// Between the first and the latest token of this phase.
    public var seconds: Double
    public init(threadID: String, runID: String, thinking: Bool, tokens: Int, seconds: Double) {
        self.threadID = threadID; self.runID = runID; self.thinking = thinking; self.tokens = tokens; self.seconds = seconds
    }
    /// Tokens per second over the intervals seen so far. Nil until two
    /// tokens have arrived, so a first token cannot claim a rate.
    public var rate: Double? { tokens >= 2 && seconds > 0 ? Double(tokens - 1) / seconds : nil }
}
public func digestText(_ s: String) -> String { digestBytes(Data(s.utf8)) }
public func digestBytes(_ d: Data) -> String {
    // Lowercase hex without String(format:), which dominated hashing many
    // small records.
    let digits = Array("0123456789abcdef".utf8)
    var hex = [UInt8](); hex.reserveCapacity(64)
    for byte in SHA256.hash(data: d) { hex.append(digits[Int(byte >> 4)]); hex.append(digits[Int(byte & 0x0f)]) }
    return String(decoding: hex, as: UTF8.self)
}
func encoded<T: Encodable>(_ value: T) throws -> Data {
    let e = JSONEncoder(); e.outputFormatting = [.sortedKeys]; e.dateEncodingStrategy = .iso8601
    return try e.encode(value)
}
func decoded<T: Decodable>(_ type: T.Type, _ data: Data) throws -> T {
    let d = JSONDecoder(); d.dateDecodingStrategy = .iso8601; return try d.decode(type, from: data)
}

/// Cancellation bypasses the actor/executor performing synchronous inference.
public final class Cancellation: @unchecked Sendable {
    private let lock = NSLock()
    private var value = false
    public init() {}
    public var isCancelled: Bool { lock.lock(); defer { lock.unlock() }; return value }
    public func cancel() { lock.lock(); value = true; lock.unlock() }
    public func check() throws { if isCancelled { throw SevraError.cancelled } }
}
