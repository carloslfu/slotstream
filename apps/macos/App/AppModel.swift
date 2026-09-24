import AppKit
import SwiftUI
import SevraRuntime
import SevraPresentation
import UniformTypeIdentifiers
import Combine

@MainActor final class AppModel: ObservableObject {
    @Published var snapshot: RuntimeSnapshot? { didSet { snapshotVersion &+= 1 } }
    /// Counts snapshot changes, so views can reuse what they derive from one.
    private var snapshotVersion = 0
    var selectedID: String { composer.threadID }
    var draft: String { composer.text }
    /// Parts of the window with their own observation: the sidebar and the
    /// memory figures change without redrawing the conversation, and the
    /// conversation streams without redrawing the sidebar.
    let sidebar = SidebarState()
    let performanceState = PerformanceState()
    @Published var panel = "" {
        willSet { if panel.isEmpty && !newValue.isEmpty { textSession.rememberFocus() } }
        didSet {
            if panel.isEmpty && !oldValue.isEmpty { DispatchQueue.main.async { self.textSession.restoreFocus() } }
            // A draft app runs only while its review is on screen.
            if oldValue == "App review" && panel != "App review" { closePreview() }
            if panel == "App review" && oldValue != "App review" { Task { await startPreview() } }
            if panel != "Changes" { reviewedChangeSetID = nil }
            if navigation == nil { sidebar.show(panel: panel) }
            if panel == "Search" && oldValue != "Search" { search(delay: 0) }
        }
    }
    @Published var applyingChanges = false
    @Published var reviewedChangeSetID: String?
    @Published var runningApp: MiniAppController? { didSet { sidebar.show(runningApp: .some(runningApp?.session.name)) } }
    @Published var appPreview: MiniAppController?
    /// Records already saved in each collection an app under review asks for.
    @Published var appReviewCounts: [String: Int] = [:]
    @Published var appFailure: String?
    @Published var skillPreview: (name: String, text: String)?
    var openingApp: String?
    /// The app being opened, shown until its view exists.
    @Published var openingAppName: String?
    var seenAppRevisions: [String: Int] = [:]
    var seenAppRevisionsOwner: String?
    @Published var focusRevision = 0
    @Published var notice = ""
    @Published var pendingLink: URL?
    @Published var selectedCitation: Citation?
    @Published var attaching = false
    let textSession = TextSession()
    private var dismissedError: String?
    private var lastAnnouncedState: String?
    private var lastThreadKey: String { "selectedThread." + digestText(homeURL.path) }

    @Published var query = "" { didSet { if query != oldValue { search() } } }
    /// Filled off the main thread, so typing in Search never waits for a scan.
    @Published private(set) var searchResults: [SearchResult] = []
    private var searching: (task: Task<Void, Never>, cancellation: Cancellation)?
    @Published var savedDocument: (threadID: String, runID: String, path: String, text: String, citations: [Citation])?
    @Published var approving = false
    @Published var error: String?
    @Published var transferringHome = false
    @Published var restoredHomeURL: URL?
    @Published var backupURL: URL?
    @Published var homeTransferMessage = ""
    private var openedHomes: [Process] = []
    var restoreNeedsReview: Bool { snapshot?.restoreReview.map { !$0.reviewed } ?? false }
    var aiPaused: Bool { restoreNeedsReview || snapshot?.storageNeedsReview == true }
    var submitting: Bool { composer.sending }
    var draftSaved: Bool { composer.saved }
    private var composerChanges: AnyCancellable?
    private var selectionChanges: AnyCancellable?
    lazy var journalComposer = ComposerSession(store: .init(
        read: { [weak self] _ in
            guard let runtime = self?.runtime else { throw SevraError.unavailable("Your Home is still opening.") }
            let draft = await runtime.journalDraftState()
            return .init(text: draft.text, revision: draft.revision)
        },
        write: { [weak self] _, text, revision in
            guard let runtime = self?.runtime else { throw SevraError.unavailable("Your Home is still opening.") }
            do { let draft = try await runtime.saveJournalDraft(text: text, expectedRevision: revision); return .init(text: draft.text, revision: draft.revision) }
            catch let conflict as DraftConflict { throw ComposerSession.Changed(.init(text: conflict.current.text, revision: conflict.current.revision)) }
        },
        send: { [weak self] _, text, nonce, revision, remaining in
            guard let runtime = self?.runtime else { throw SevraError.unavailable("Your Home is still opening.") }
            do { let draft = try await runtime.submitJournalDraft(text: text, nonce: nonce, expectedRevision: revision, remainingDraft: remaining); return .init(text: draft.text, revision: draft.revision) }
            catch let conflict as DraftConflict { throw ComposerSession.Changed(.init(text: conflict.current.text, revision: conflict.current.revision)) }
        }))
    lazy var composer = ComposerSession(store: .init(
        read: { [weak self] id in
            guard let runtime = self?.runtime else { throw SevraError.unavailable("Your Home is still opening.") }
            let value = try await runtime.draftState(threadID: id)
            return .init(text: value.text, revision: value.revision)
        },
        write: { [weak self] id, text, revision in
            guard let runtime = self?.runtime else { throw SevraError.unavailable("Your Home is still opening.") }
            do {
                let value = try await runtime.saveDraft(threadID: id, text: text, expectedRevision: revision)
                return .init(text: value.text, revision: value.revision)
            } catch let conflict as DraftConflict {
                throw ComposerSession.Changed(.init(text: conflict.current.text, revision: conflict.current.revision))
            }
        },
        send: { [weak self] id, text, nonce, revision, remaining in
            guard let runtime = self?.runtime else { throw SevraError.unavailable("Your Home is still opening.") }
            do {
                let value = try await runtime.submitDraft(threadID: id, text: text, nonce: nonce, expectedRevision: revision, remainingDraft: remaining)
                return .init(text: value.text, revision: value.revision)
            } catch let conflict as DraftConflict {
                throw ComposerSession.Changed(.init(text: conflict.current.text, revision: conflict.current.revision))
            }
        }))
    @Published var setupStatus: ModelSetupStatus?
    @Published var preparingModel = false
    @Published var performancePreferences = PerformancePreferences.restore(UserDefaults.standard.data(forKey: "performance.preferences.v1"))
    @Published var preparingForSleep = false
    private var performancePoll: Task<Void, Never>?
    private var sleepTask: Task<Void, Never>?
    @Published var appearance = Appearance(rawValue: UserDefaults.standard.string(forKey: "appearance") ?? "System") ?? .system
    var runtime: SevraRuntime?
    var endpoint: LocalEndpoint?
    var setup: ModelSetup?
    var poll: Task<Void, Never>?
    var onFind: (() -> Void)?
    var thread: WorkThread? { conversation.thread }
    /// What the window derives from the selected thread in one snapshot. It is
    /// rebuilt once per snapshot or selection change, not on every read.
    private struct Conversation {
        var threadID = ""
        var version = -1
        var thread: WorkThread?
        var messages: [Message] = []
        /// Each message's ID and UTF-8 size, for choosing the page shown.
        var messageIDs: [String] = []
        var byteCounts: [Int] = []
        var runs: [String: (threadID: String, run: Run)] = [:]
        var citations: [String: Set<String>] = [:]
        /// A response is running in another thread.
        var otherWorking = false
    }
    private var conversationCache = Conversation()
    private var conversation: Conversation {
        let id = selectedID
        if conversationCache.threadID == id && conversationCache.version == snapshotVersion { return conversationCache }
        var next = Conversation(); next.threadID = id; next.version = snapshotVersion
        if let home = snapshot?.home, let thread = home.threads.first(where: { $0.id == id }) {
            next.thread = thread
            next.messages = home.conversationMessages(for: thread).filter { !$0.text.isEmpty }
            next.messageIDs = next.messages.map(\.id); next.byteCounts = next.messages.map { $0.text.utf8.count }
            // Home owns the messages a thread continues from, and their runs.
            let quoted = Set(thread.promotedMessageIDs)
            var own: [String: Run] = [:], homeRuns: [String: Run] = [:]
            for run in thread.allRuns { own[run.id] = run }
            if !quoted.isEmpty, let homeThread = home.threads.first(where: { $0.id == "home" }) { for run in homeThread.allRuns { homeRuns[run.id] = run } }
            for message in next.messages {
                let fromHome = quoted.contains(message.id)
                guard let runID = message.runID, let run = (fromHome ? homeRuns : own)[runID] else { continue }
                next.runs[message.id] = (fromHome ? "home" : thread.id, run)
                if let excerpts = run.excerpts, !excerpts.isEmpty { next.citations[message.id] = Set(excerpts.map(\.id)) }
            }
        }
        next.otherWorking = snapshot?.home.threads.contains { $0.id != id && $0.run?.state.terminal == false && $0.run?.state != .needsYou } ?? false
        conversationCache = next
        return next
    }
    /// The selected conversation's visible messages, oldest first.
    var conversationMessages: [Message] { conversation.messages }
    var conversationMessageIDs: [String] { conversation.messageIDs }
    var conversationByteCounts: [Int] { conversation.byteCounts }
    /// A response is running in a thread other than the selected one.
    var otherThreadWorking: Bool { conversation.otherWorking }
    /// Excerpt IDs a message may cite.
    func citationIDs(for message: Message) -> Set<String> { conversation.citations[message.id] ?? [] }
    var busy: Bool { thread?.run.map { !$0.state.terminal } ?? false }
    /// A response is running. A run waiting for review is not working.
    var working: Bool { thread?.run.map { !$0.state.terminal && $0.state != .needsYou } ?? false }
    var thinkingEnabled: Bool { thread?.thinking == true }
    /// Thinking stays off for tool turns in this version, so the switch is
    /// unavailable while a source is attached rather than silently ignored.
    /// Only a paused Home takes the switch away. A thread with an attached
    /// source thinks like any other: the person decides, not the attachment.
    var thinkingUnavailable: Bool { aiPaused }
    var liveThinking: ThinkingObservation? {
        guard let thought = snapshot?.thinking, thought.threadID == selectedID else { return nil }
        return thought
    }
    /// Median of the last ten completed thoughts on this Mac; the honest cost line.
    /// Recomputed when Home changes, not on every streamed update.
    var typicalThinkingSeconds: Double? {
        let key = (snapshot?.home.revision ?? -1, snapshot?.home.threads.count ?? 0)
        if let cached = typicalThinking, cached.key == key { return cached.value }
        let recent = (snapshot?.home.threads ?? []).flatMap { thread in
            thread.allRuns.compactMap { run in run.thinking.map { (run.order ?? 0, $0) } }
        }.filter { [.closed, .budget, .answerNow].contains($0.1.ending) && $0.1.tokens > 0 }
            .sorted { $0.0 < $1.0 }.suffix(10).map(\.1.seconds).sorted()
        let value = recent.isEmpty ? nil : recent[recent.count / 2]
        typicalThinking = (key, value)
        return value
    }
    private var typicalThinking: (key: (Int, Int), value: Double?)?
    func toggleThinking() {
        let id = selectedID, next = !thinkingEnabled
        perform { try await $0.setThinking(threadID: id, enabled: next) }
    }
    func answerNow() {
        let id = selectedID
        perform { try await $0.answerNow(threadID: id) }
    }
    /// The speed line under each reply and a live speed while one is written.
    /// Off until a person turns it on, then remembered on this Mac.
    @Published var showResponseDetails = UserDefaults.standard.bool(forKey: "responseDetails.visible")
    func toggleResponseDetails() {
        showResponseDetails.toggle()
        UserDefaults.standard.set(showResponseDetails, forKey: "responseDetails.visible")
    }
    let details = ResponseDetailsPresenter()
    /// The response the Context panel shows; nil means the thread's latest.
    @Published var contextRunID: String?
    var liveGeneration: GenerationObservation? {
        guard let g = snapshot?.generation, g.threadID == selectedID else { return nil }
        return g
    }
    /// The run that produced a message in this conversation, in the thread
    /// that owns it: Home owns the messages a thread continues from.
    func run(for message: Message) -> (threadID: String, run: Run)? { conversation.runs[message.id] }
    /// "Thought for 42 s" once a run's thinking has ended, including while
    /// its answer is still arriving and before the run records the round.
    /// The run's thinking so far, including a finished thought whose answer is
    /// still arriving. The runtime records a round and replaces its buffer in
    /// one step, so a recorded thought is never counted twice.
    func thoughtReceipt(for run: Run) -> ThinkingReceipt? {
        if let live = snapshot?.thinking, live.runID == run.id, !live.active {
            let current = ThinkingReceipt(level: ThinkingPolicy.level, budgetTokens: 0, tokens: 0, seconds: live.seconds, ending: live.ending ?? .closed)
            return run.thinking.map { $0.merged(with: current) } ?? current
        }
        return run.thinking
    }
    func thoughtSummary(for run: Run) -> String? { thoughtReceipt(for: run)?.summary }
    func showDetails(_ url: URL, relativeTo rect: NSRect, of view: NSView) {
        guard let target = ResponseDetailsLink.target(url) else { return }
        details.show(ResponseDetailsView(model: self, threadID: target.threadID, runID: target.runID), runID: target.runID, relativeTo: rect, of: view)
    }
    /// From a SwiftUI control that registered an anchor under this key.
    func showDetails(threadID: String, runID: String, anchor key: String) {
        guard let view = details.anchor(key) else { return }
        details.show(ResponseDetailsView(model: self, threadID: threadID, runID: runID), runID: runID, relativeTo: view.bounds, of: view)
    }
    /// The current thread's latest response, from the View menu.
    func showLatestDetails() {
        guard let thread, let run = thread.run else { return }
        showDetails(threadID: thread.id, runID: run.id, anchor: "status")
    }
    func inspectContext(threadID: String, runID: String) {
        details.close()
        contextRunID = runID
        panel = "Context"
    }
    var homeURL: URL {
        if let path = ProcessInfo.processInfo.environment["SEVRA_HOME"] { return URL(fileURLWithPath: path) }
        return FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Sevra/Home")
    }
    @Published var externalChanges: [ExternalHomeChange] = []
    @Published var reviewingChanges = false
    func inspectHomeChanges() {
        guard let runtime else { panel = "Settings"; return }
        Task {
            do { externalChanges = try await runtime.inspectExternalChanges(); panel = "Home changes" }
            catch { self.error = error.localizedDescription }
        }
    }
    func adoptExternalDrafts() {
        guard let runtime, !reviewingChanges else { return }
        let reviewed = Dictionary(uniqueKeysWithValues: externalChanges.map { ($0.path, $0.digest) })
        reviewingChanges = true
        Task {
            defer { reviewingChanges = false }
            do {
                try await runtime.reconcileExternalDrafts(reviewed: reviewed)
                try await composer.reloadAfterExternalReview()
                externalChanges = []; error = nil; dismissedError = nil; panel = ""; focusRevision += 1
                notice = "External drafts adopted. Previous versions are preserved locally."
                await refresh()
            } catch { self.error = error.localizedDescription; inspectHomeChanges() }
        }
    }
    func backUpHome() {
        guard let runtime, !transferringHome else { return }
        let panel = NSSavePanel(); panel.title = "Back up Home"
        panel.nameFieldStringValue = "Sevra Home.sevrahome"; panel.canCreateDirectories = true
        panel.message = "Includes saved conversations, drafts, memories, journal and owned files. Model weights and attached source folders stay separate."
        guard panel.runModal() == .OK, let destination = panel.url else { return }
        transferringHome = true; homeTransferMessage = ""
        Task {
            defer { transferringHome = false }
            do {
                let closed = try await composer.close {
                    guard try await self.journalComposer.close(perform: {
                        let result = try await runtime.exportHome(to: destination)
                        self.notice = result.manifest.evidenceComplete ? "Home backup verified and saved." : "Home backup saved. Original attached source folders are separate dependencies."
                        self.homeTransferMessage = self.notice; self.backupURL = result.url; self.error = nil
                    }) else { throw SevraError.refused("Finish saving the journal before backing up Home.") }
                }
                if !closed { error = "Finish the current draft operation before backing up Home." }
            } catch { self.error = error.localizedDescription }
        }
    }
    func restoreHomeBackup() {
        guard !transferringHome else { return }
        let picker = NSOpenPanel(); picker.title = "Choose Home backup"
        picker.canChooseFiles = false; picker.canChooseDirectories = true; picker.allowsMultipleSelection = false
        guard picker.runModal() == .OK, let archive = picker.url else { return }
        let destination = NSSavePanel(); destination.title = "Restore to a new Home"
        destination.nameFieldStringValue = "Restored Sevra Home"; destination.canCreateDirectories = true
        destination.directoryURL = archive.deletingLastPathComponent()
        destination.message = "Your current Home stays in place. The restored copy opens with AI paused until you review its dated privacy choices."
        guard destination.runModal() == .OK, let url = destination.url else { return }
        let dbmd = Bundle.main.bundleURL.appendingPathComponent("Contents/Helpers/dbmd")
        transferringHome = true; homeTransferMessage = ""
        Task {
            defer { transferringHome = false }
            do {
                let knownHome = await runtime?.snapshot().home
                let result = try await Task.detached(priority: .userInitiated) { try HomeArchive.restore(archive, to: url, dbmd: dbmd, knownHome: knownHome) }.value
                restoredHomeURL = result.url; notice = "Home restored and verified. Open it to review before enabling AI."
                homeTransferMessage = notice; self.error = nil
            } catch { self.error = error.localizedDescription }
        }
    }
    func openRestoredHome() {
        guard let url = restoredHomeURL, let executable = Bundle.main.executableURL else { return }
        if let existing = openedHomes.first(where: { $0.isRunning && $0.environment?["SEVRA_HOME"] == url.path }) {
            NSRunningApplication(processIdentifier: existing.processIdentifier)?.activate(options: [])
            return
        }
        let child = Process(); child.executableURL = executable
        child.environment = ["HOME": NSHomeDirectory(), "PATH": "/usr/bin:/bin", "LANG": "en_US.UTF-8", "SEVRA_HOME": url.path]
        child.standardOutput = FileHandle.nullDevice; child.standardError = FileHandle.nullDevice
        do { try child.run(); openedHomes.removeAll { !$0.isRunning }; openedHomes.append(child) }
        catch { self.error = error.localizedDescription }
    }
    func reviewRestoredHome() {
        guard let review = snapshot?.restoreReview, !review.reviewed, let runtime else { return }
        let alert = NSAlert(); alert.messageText = "Enable AI for this restored Home?"
        let privacy = review.privacyEpochKnown ? "Newer Forget decisions from the current Home were preserved. " : "Later Forget or correction choices may be missing. "
        alert.informativeText = "This snapshot is from " + review.snapshotDate.formatted(date: .abbreviated, time: .shortened) + ". " + privacy + "Inspect Knowledge and remove anything you no longer want used before enabling AI. No previous job restarts, no source folder is reattached and no document is saved by this choice."
        alert.addButton(withTitle: "Enable AI for this snapshot"); alert.addButton(withTitle: "Keep reviewing")
        guard alert.runModal() == .alertFirstButtonReturn else { return }
        Task { do { try await runtime.acknowledgeRestore(archiveDigest: review.archiveDigest); await refresh() } catch { self.error = error.localizedDescription } }
    }
    func start() {
        observeComposers()
        setAppearance(appearance)
        let root = homeURL
        let dbmd = Bundle.main.bundleURL.appendingPathComponent("Contents/Helpers/dbmd")
        let modelPath = ProcessInfo.processInfo.environment["SEVRA_MODEL"]
        let preferences = performancePreferences
        setup = modelPath.map { ModelSetup(model: URL(fileURLWithPath: $0)) } ?? ModelSetup()
        poll = Task {
            do {
                runtime = try await Task.detached(priority: .userInitiated) {
                    let engine = modelPath.map { LocalInference(model: URL(fileURLWithPath: $0), preferences: preferences) } ?? LocalInference(preferences: preferences)
                    return try SevraRuntime(homeURL: root, dbmd: dbmd, inference: engine, performancePreferences: preferences)
                }.value
                if let runtime { endpoint = try await Task.detached { try LocalEndpoint(runtime: runtime) }.value }
                await runtime?.maintainPerformance(userPresent: hasForegroundWindow)
                await runtime?.prepareModelAhead()
                // Compiled once; the first app opened later need not wait for it.
                Task { _ = try? await MiniAppController.rules() }
                performancePoll = Task { [weak self] in
                    while !Task.isCancelled {
                        try? await Task.sleep(nanoseconds: 2_000_000_000)
                        guard !Task.isCancelled else { break }
                        await self?.runtime?.maintainPerformance(userPresent: self?.hasForegroundWindow == true)
                    }
                }
                await refresh()
                let remembered = UserDefaults.standard.string(forKey: lastThreadKey)
                let id = snapshot?.home.threads.first { $0.id == remembered && $0.mode != .incognito }?.id ?? "home"
                try await composer.open(id); focusRevision += 1
                try await journalComposer.open("journal")
            } catch { self.error = error.localizedDescription; return }
            while !Task.isCancelled {
                await refresh()
                try? await Task.sleep(nanoseconds: 150_000_000)
            }
        }
    }
    /// Typing redraws only the composer, which observes its session
    /// directly. The rest of the window hears about the few composer changes
    /// it shows: which thread is open, and whether it is ready, sending,
    /// switching or closing.
    func observeComposers() {
        let composer = composer
        composerChanges = Publishers.MergeMany(
            composer.$threadID.dropFirst().map { _ in () }.eraseToAnyPublisher(),
            composer.$ready.dropFirst().map { _ in () }.eraseToAnyPublisher(),
            composer.$sending.dropFirst().map { _ in () }.eraseToAnyPublisher(),
            composer.$transitioning.dropFirst().map { _ in () }.eraseToAnyPublisher(),
            composer.$closing.dropFirst().map { _ in () }.eraseToAnyPublisher()
        ).sink { [weak self] in self?.objectWillChange.send() }
        selectionChanges = composer.$threadID.combineLatest(composer.$ready).sink { [weak self] id, ready in
            guard let self else { return }
            self.sidebar.show(ready: ready)
            if self.navigation == nil { self.sidebar.show(selectedID: id) }
        }
    }
    func refresh() async {
        guard let runtime else { return }
        var incoming = await runtime.snapshot()
        // Memory figures change on every maintenance tick; only the
        // performance settings show them, so they do not redraw the window.
        let performance = incoming.performance
        incoming.performance = nil
        if performanceState.snapshot != performance { performanceState.snapshot = performance }
        if snapshot != incoming {
            snapshot = incoming
            let rows = (sidebar.open, sidebar.archived)
            sidebar.update(from: incoming.home)
            // A new, renamed or archived thread changes what Search can find.
            if panel == "Search", rows.0 != sidebar.open || rows.1 != sidebar.archived { search(delay: 0) }
        }
        let setupValue = setup?.snapshot()
        if setupStatus != setupValue { setupStatus = setupValue }
        // Assigning the same message again would still redraw the window.
        if let failure = snapshot?.error, failure != dismissedError, error != failure { error = failure }
        syncApps()
        let state = thread?.run?.state.rawValue
        if state != lastAnnouncedState {
            lastAnnouncedState = state
            if let run = thread?.run, run.state.terminal || run.state == .needsYou {
                NSAccessibility.post(element: NSApplication.shared, notification: .announcementRequested,
                    userInfo: [.announcement: run.state == .needsYou ? "Document ready for your review." : run.status, .priority: 50])
            }
        }
    }
    func edited(_ value: String) {
        composer.edit(value)
    }
    func saveDraft() async {
        await composer.flush()
    }
    func saveJournal() { Task { _ = await journalComposer.send(); await refresh() } }
    /// The destination still being opened, while the previous thread's draft
    /// saves. The sidebar shows it at once; a later click replaces it.
    private var navigation: (id: String, panel: String)?
    private var navigating = false
    func navigate(_ id: String, panel destinationPanel: String = "") {
        navigation = (id, destinationPanel)
        sidebar.show(selectedID: id, panel: destinationPanel)
        guard !navigating else { return }
        navigating = true
        Task {
            defer {
                navigating = false; navigation = nil
                sidebar.show(selectedID: selectedID, panel: panel)
            }
            while let target = navigation {
                do {
                    // Another operation, such as a send, may hold the composer
                    // briefly. Wait for it instead of dropping the click.
                    var moved = try await composer.move(to: target.id)
                    var waits = 0
                    while !moved, composer.sending || composer.transitioning || composer.closing, waits < 250 {
                        try? await Task.sleep(nanoseconds: 20_000_000); waits += 1
                        guard navigation.map({ $0 == target }) == true else { break }
                        moved = try await composer.move(to: target.id)
                    }
                    guard navigation.map({ $0 == target }) == true else { continue }
                    navigation = nil
                    guard moved else { break }
                    panel = target.panel
                    await refresh()
                    if thread?.mode != .incognito { UserDefaults.standard.set(selectedID, forKey: lastThreadKey) }
                    focusRevision += 1
                } catch { self.error = error.localizedDescription; break }
            }
        }
    }
    func navigateToReview(_ id: String) {
        let run = snapshot?.home.threads.first { $0.id == id }?.run
        navigate(id, panel: run.map(Self.reviewPanel) ?? "Artifact")
    }
    /// The review a waiting run needs first.
    static func reviewPanel(for run: Run) -> String {
        if run.proposal != nil { return "Artifact" }
        if run.appProposal != nil { return "App review" }
        if run.skillProposal != nil { return "Skill review" }
        if run.changes?.state == .proposed { return "Changes" }
        return ""
    }
    func renameThread(_ id: String) {
        navigate(id, panel: "Rename")
    }
    func newThread(_ mode: MemoryMode = .shared) {
        perform { runtime in
            guard try await self.composer.move(prepare: {
                let id = try await runtime.newThread(mode: mode)
                return (id, .init(text: "", revision: 0))
            }) else { return }
            self.panel = ""; self.focusRevision += 1
            if mode != .incognito { UserDefaults.standard.set(self.selectedID, forKey: self.lastThreadKey) }
        }
    }
    func continueInThread(messageIDs: [String]) {
        perform { runtime in
            guard self.selectedID == "home" else { return }
            guard try await self.composer.move(prepare: {
                let id = try await runtime.promoteHome(messageIDs: messageIDs)
                let draft = try await runtime.draftState(threadID: id)
                // Publish the destination before activating its composer so
                // the first rendered frame already contains its Home quotes.
                await self.refresh()
                return (id, .init(text: draft.text, revision: draft.revision))
            }) else { return }
            self.panel = ""; self.focusRevision += 1
            UserDefaults.standard.set(self.selectedID, forKey: self.lastThreadKey)
        }
    }
    func send() {
        guard !preparingForSleep else { notice = "Sevra is preparing for sleep. Send again after your Mac wakes."; return }
        guard setup?.snapshot().busy != true else { error = "Finish model setup before sending."; return }
        guard !busy, !submitting, !attaching, !aiPaused, !composer.transitioning else { return }
        let id = selectedID
        Task {
            let accepted = await composer.send()
            await refresh()
            if accepted, selectedID == id {
                NotificationCenter.default.post(name: .sevraJumpToLatest, object: nil, userInfo: ["focus": false])
            }
        }
        // The runtime shows the message before it is on disk; show it here
        // too, instead of waiting for the next poll.
        Task { try? await Task.sleep(nanoseconds: 5_000_000); await refresh() }
    }
    func stop() {
        let id = selectedID
        if let i = snapshot?.home.threads.firstIndex(where: { $0.id == id }) {
            snapshot?.home.threads[i].run?.state = .stopping
            snapshot?.home.threads[i].run?.status = "Stopping"
        }
        perform { try await $0.stop(threadID: id) }
    }
    func approve(_ proposal: ArtifactProposal) {
        guard !approving else { return }; approving = true
        let id = selectedID
        perform { runtime in
            defer { self.approving = false }
            _ = try await runtime.approve(threadID: id, proposalID: proposal.id, digest: proposal.digest)
            await self.refresh()
            if self.selectedID == id { self.panel = ""; self.focusRevision += 1 }
        }
    }
    func openArtifact(runID: String? = nil) {
        guard let run = runID.flatMap({ id in thread?.savedRuns.first { $0.id == id } }) ?? (runID == nil ? thread?.savedRuns.last : nil), let path = run.artifact else { return }
        let id = selectedID
        perform { runtime in
            let text = try await runtime.readSavedArtifact(threadID: id, runID: run.id)
            guard self.selectedID == id else { return }
            self.savedDocument = (id, run.id, path, text, run.excerpts ?? []); self.panel = "Artifact"
        }
    }
    /// Scans Home for the query off the main thread. A newer query cancels
    /// an older scan; typing waits briefly so each keystroke does not scan.
    func search(delay: UInt64 = 60_000_000) {
        searching?.cancellation.cancel(); searching?.task.cancel()
        guard panel == "Search", let home = snapshot?.home else { return }
        let query = self.query, cancellation = Cancellation()
        let task = Task { [weak self] in
            if delay > 0, !query.isEmpty { do { try await Task.sleep(nanoseconds: delay) } catch { return } }
            let results = await Task.detached(priority: .userInitiated) { SearchResult.matching(query, in: home, cancellation: cancellation) }.value
            guard let self, let results, !cancellation.isCancelled, self.query == query else { return }
            if self.searchResults != results { self.searchResults = results }
        }
        searching = (task, cancellation)
    }
    func dismissError() { dismissedError = error; error = nil }
    func closePanel() { selectedCitation = nil; pendingLink = nil; panel = "" }
    func copyText(_ text: String) {
        guard text.utf8.count <= 4 * 1024 * 1024 else { error = "Use Export Markdown for this large document. Its text was not truncated."; return }
        NSPasteboard.general.clearContents(); NSPasteboard.general.setString(text, forType: .string)
        notice = "Copied"
        Task { try? await Task.sleep(nanoseconds: 2_000_000_000); if notice == "Copied" { notice = "" } }
    }
    func exportText(_ text: String, filename: String) {
        let picker = NSSavePanel(); picker.nameFieldStringValue = filename; picker.allowedContentTypes = [UTType(filenameExtension: "md") ?? .plainText]
        picker.title = "Export Markdown"; picker.message = "Save the complete Markdown source where you choose."
        guard picker.runModal() == .OK, let url = picker.url else { return }
        Task {
            do { try await Task.detached { try Data(text.utf8).write(to: url, options: .atomic) }.value; notice = "Exported " + url.lastPathComponent }
            catch { self.error = error.localizedDescription }
        }
    }
    func inspectLink(_ url: URL) {
        if url.scheme == "sevra-citation" {
            let components = url.pathComponents.filter { $0 != "/" }
            guard components.count == 2, let thread else { return }
            let citations: [Citation]
            if let proposal = thread.run?.proposal, proposal.id == components[0] { citations = proposal.citations }
            else if let saved = savedDocument, saved.threadID == selectedID, "saved:" + saved.runID == components[0] { citations = saved.citations }
            else { citations = snapshot?.home.citations(for: components[0], in: thread) ?? [] }
            guard let citation = citations.first(where: { $0.id == components[1] }) else { error = "The source for this citation is not available in this view."; return }
            selectedCitation = citation
        } else if MarkdownDocumentRenderer.externalURL(url.absoluteString) != nil { pendingLink = url }
    }
    func prepareRetry() {
        guard !busy, let text = thread?.messages.last(where: { $0.role == "user" })?.text else { return }
        if !draft.isEmpty { notice = "Your current draft is preserved. Send it when you are ready."; focusRevision += 1; return }
        edited(text); panel = ""; focusRevision += 1
    }
    func closeIncognito() {
        let id = selectedID
        perform { runtime in
            guard try await self.composer.move(prepare: {
                let value = try await runtime.draftState(threadID: "home")
                return ("home", .init(text: value.text, revision: value.revision))
            }, discardCurrent: true) else { return }
            try await runtime.closeIncognito(threadID: id)
            self.textSession.discard(id); self.panel = ""; self.focusRevision += 1
        }
    }
    func setAppearance(_ choice: Appearance) {
        appearance = choice; UserDefaults.standard.set(choice.rawValue, forKey: "appearance")
        switch choice {
        case .system: NSApp.appearance = nil
        case .light: NSApp.appearance = NSAppearance(named: .aqua)
        case .dark: NSApp.appearance = NSAppearance(named: .darkAqua)
        }
    }
    func setPerformance(_ value: PerformancePreferences) {
        guard let runtime else { return }
        guard value != performancePreferences else { return }
        do {
            try PerformancePolicy.validate(value, on: .current())
            UserDefaults.standard.set(try JSONEncoder().encode(value), forKey: "performance.preferences.v1")
            performancePreferences = value
        } catch { self.error = error.localizedDescription; return }
        // The view commits a slider on release or a number on Return/focus
        // loss. Preference writes never happen on every dragging frame.
        Task {
            do {
                try await runtime.setPerformancePreferences(performancePreferences)
                await runtime.maintainPerformance(userPresent: hasForegroundWindow); await refresh()
            } catch { self.error = error.localizedDescription }
        }
    }
    private var hasForegroundWindow: Bool {
        NSApp.isActive && NSApp.windows.contains { $0.isVisible && !$0.isMiniaturized }
    }
    func prepareForSleep() {
        preparingForSleep = true; setup?.cancel()
        sleepTask = Task {
            // Request runtime cancellation first; saving the composer never
            // submits it and does not authorize replay on wake.
            async let stop: Void? = runtime?.prepareForSleep()
            await composer.flush()
            if journalComposer.ready { await journalComposer.flush() }
            do { try await stop } catch { self.error = error.localizedDescription }
        }
    }
    func wake() {
        Task {
            await sleepTask?.value; sleepTask = nil
            await runtime?.wake(); preparingForSleep = false
            await runtime?.maintainPerformance(userPresent: hasForegroundWindow); await refresh()
        }
    }
    func setUpModel(download: Bool) {
        guard let runtime, let setup, !preparingModel else { return }
        preparingModel = true
        Task {
            var acquired = false
            do {
                try await runtime.beginModelMaintenance(); acquired = true
                try await Task.detached(priority: .utility) {
                    if download { try setup.download() } else { try setup.check() }
                }.value
            } catch SevraError.cancelled {
                // The setup panel already reports the deliberate stop.
            } catch { self.error = error.localizedDescription }
            if acquired { await runtime.endModelMaintenance() }
            preparingModel = false
            await refresh()
        }
    }
    func perform(_ operation: @escaping (SevraRuntime) async throws -> Void) {
        guard let runtime else { return }
        Task { do { try await operation(runtime); await refresh() } catch { self.error = error.localizedDescription } }
    }
    /// A send or thread switch in progress finishes first, so Close and Quit
    /// never silently do nothing while one runs.
    private func settleComposer() async {
        var waits = 0
        while (composer.sending || composer.transitioning || journalComposer.sending), waits < 250 {
            try? await Task.sleep(nanoseconds: 20_000_000); waits += 1
        }
    }
    func closeWindow() async -> Bool {
        guard composer.ready else { return true }
        await settleComposer()
        if journalComposer.ready, !(await journalComposer.prepareToClose()) { panel = "Journal"; return false }
        guard await composer.prepareToClose() else { return false }
        if thread?.mode == .incognito {
            let id = selectedID
            do {
                guard try await composer.move(to: "home") else { return false }
                try await runtime?.closeIncognito(threadID: id)
                textSession.discard(id); await refresh()
            } catch { self.error = error.localizedDescription; return false }
        }
        return true
    }
    func quit() async -> Bool {
        if preparingModel {
            setup?.cancel(); error = "Model setup is stopping. Quit again after its file writes finish."; return false
        }
        await settleComposer()
        if !composer.ready {
            poll?.cancel()
            do { try await runtime?.shutdown() }
            catch { self.error = error.localizedDescription; return false }
            endpoint?.stop(); performancePoll?.cancel(); return true
        }
        do {
            if journalComposer.ready {
                var closed = false
                guard try await journalComposer.close(perform: {
                    closed = try await self.composer.close(perform: { try await self.runtime?.shutdown() })
                }), closed else { if journalComposer.issue != nil { panel = "Journal" }; return false }
            } else {
                guard try await composer.close(perform: { try await self.runtime?.shutdown() }) else { return false }
            }
        }
        catch { self.error = error.localizedDescription; return false }
        composer.finish(); journalComposer.finish(); endpoint?.stop(); poll?.cancel(); performancePoll?.cancel()
        return true
    }
}
