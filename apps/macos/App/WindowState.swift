import SwiftUI
import SevraRuntime
import SevraPresentation

/// What the sidebar shows. It publishes only when a row, a count or the
/// selection changes, so streaming text, typing and idle ticks never redraw
/// the thread list.
@MainActor final class SidebarState: ObservableObject {
    struct Row: Equatable, Identifiable {
        var id: String
        var title: String
        var mode: MemoryMode
        var lifecycle: ThreadLifecycle
        var pinned: Bool
        var state: RunState?
        /// No response is running or waiting for review.
        var idle: Bool { state?.terminal != false }
    }
    @Published private(set) var open: [Row] = []
    @Published private(set) var archived: [Row] = []
    @Published private(set) var needsYou = 0
    /// The thread the person chose, shown at once even while its draft and
    /// the previous thread's are still being saved.
    @Published private(set) var selectedID = "home"
    @Published private(set) var panel = ""
    @Published private(set) var ready = false
    @Published private(set) var runningApp: String?
    @Published var archiveOnly = false

    func show(selectedID: String? = nil, panel: String? = nil, ready: Bool? = nil, runningApp: String?? = nil) {
        if let selectedID, self.selectedID != selectedID { self.selectedID = selectedID }
        if let panel, self.panel != panel { self.panel = panel }
        if let ready, self.ready != ready { self.ready = ready }
        if let runningApp, self.runningApp != runningApp { self.runningApp = runningApp }
    }
    /// Rebuilds the rows from Home. Cheap: one pass over the threads, and a
    /// thread's last activity is its last message.
    func update(from home: HomeState) {
        var homeDates: [String: Date]?
        func lastActivity(_ thread: WorkThread) -> Date {
            if let date = thread.messages.last?.date { return date }
            guard !thread.promotedMessageIDs.isEmpty else { return .distantPast }
            if homeDates == nil {
                homeDates = Dictionary((home.threads.first { $0.id == "home" }?.messages ?? []).map { ($0.id, $0.date) }, uniquingKeysWith: { a, _ in a })
            }
            return thread.promotedMessageIDs.compactMap { homeDates?[$0] }.max() ?? .distantPast
        }
        var active: [(Row, Date)] = [], stored: [(Row, Date)] = []
        var waiting = 0
        for thread in home.threads {
            if thread.run?.state == .needsYou { waiting += 1 }
            guard thread.id != "home" else { continue }
            let row = Row(id: thread.id, title: thread.title, mode: thread.mode, lifecycle: thread.lifecycle, pinned: thread.pinned, state: thread.run?.state)
            if thread.lifecycle == .archived { stored.append((row, lastActivity(thread))) } else { active.append((row, lastActivity(thread))) }
        }
        func ordered(_ rows: [(Row, Date)]) -> [Row] {
            rows.sorted { $0.0.pinned != $1.0.pinned ? $0.0.pinned : $0.1 > $1.1 }.map(\.0)
        }
        let nextOpen = ordered(active), nextArchived = ordered(stored)
        if open != nextOpen { open = nextOpen }
        if archived != nextArchived { archived = nextArchived }
        if needsYou != waiting { needsYou = waiting }
    }
}

/// Memory and model state for the performance settings. Kept apart from
/// the window's model because its figures change on every maintenance tick.
@MainActor final class PerformanceState: ObservableObject {
    @Published var snapshot: PerformanceSnapshot?
}

/// One saved thread matching a search.
struct SearchResult: Identifiable, Equatable, Sendable {
    let id: String
    let title: String
    let mode: MemoryMode
    let lifecycle: ThreadLifecycle
    /// Saved threads whose title or unforgotten messages contain `query`,
    /// in Home order. Runs off the main thread; cancelled when superseded.
    static func matching(_ query: String, in home: HomeState, cancellation: Cancellation) -> [SearchResult]? {
        let forgotten = Set(home.memories.filter(\.forgotten).map(\.messageID))
        var results: [SearchResult] = []
        for thread in home.threads where thread.mode != .incognito {
            if cancellation.isCancelled { return nil }
            let found: Bool
            if query.isEmpty { found = true }
            else {
                let history = home.conversationMessages(for: thread)
                let suppressed = history.contains { forgotten.contains($0.id) }
                found = (!suppressed && thread.title.localizedCaseInsensitiveContains(query))
                    || history.contains { !forgotten.contains($0.id) && $0.text.localizedCaseInsensitiveContains(query) }
            }
            if found { results.append(SearchResult(id: thread.id, title: thread.title, mode: thread.mode, lifecycle: thread.lifecycle)) }
        }
        return results
    }
}

extension ThreadLifecycle {
    var title: String {
        switch self { case .open: return "Open"; case .needsYou: return "Needs you"; case .done: return "Done"; case .archived: return "Archived" }
    }
}

/// Observes one composer, so typing redraws only the part of the window
/// built by `content`, not everything that observes the window's model.
struct ComposerObserver<Content: View>: View {
    @ObservedObject var composer: ComposerSession
    @ViewBuilder var content: () -> Content
    var body: some View { content() }
}

/// The navigation sidebar. It reads only `SidebarState`; the model is kept
/// for actions, so the list is not rebuilt when unrelated state changes.
/// Its inputs are references and a color, which SwiftUI compares cheaply.
struct SidebarView: View {
    @ObservedObject var state: SidebarState
    let model: AppModel
    let secondaryInk: Color
    private var rows: [SidebarState.Row] { state.archiveOnly ? state.archived : state.open }
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 6) {
                ObserverMark().fill(.primary).frame(width: 32, height: 32).accessibilityHidden(true)
                Text("sevra").font(.custom("Poppins-Medium", size: 26)).tracking(-0.65)
            }.padding(.horizontal, 12).padding(.top, 12).padding(.bottom, 8).accessibilityLabel("Sevra")
            railButton("Home", symbol: "house", selected: state.selectedID == "home" && state.panel.isEmpty) { model.navigate("home") }
            Button { model.panel = "Needs you" } label: {
                HStack { navigationLabel("Needs you", symbol: "tray"); Spacer(); if state.needsYou > 0 { Text("\(state.needsYou)").monospacedDigit().font(.caption.weight(.semibold)) } }
            }.buttonStyle(RailButton(selected: state.panel == "Needs you")).help("Review work waiting for your decision")
            HStack {
                Text(state.archiveOnly ? "Archived threads" : "Threads").font(.caption).foregroundStyle(secondaryInk)
                Spacer()
                NativeIconButton(symbol: "plus", title: "New Thread", help: "New thread (⌘N)", action: { model.newThread() }).frame(width: 28, height: 28).disabled(!state.ready)
            }.padding(.horizontal, 12).padding(.top, 16).padding(.bottom, 4)
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 3) {
                    if rows.isEmpty { Text(state.archiveOnly ? "No archived threads." : "Start a thread for ongoing work.").font(.callout).foregroundStyle(secondaryInk).padding(12) }
                    ForEach(rows) { row in threadRow(row) }
                }
            }.accessibilityLabel("Threads")
            Button { state.archiveOnly.toggle() } label: { navigationLabel(state.archiveOnly ? "Open threads" : "Archived", symbol: "archivebox") }.buttonStyle(RailButton(selected: state.archiveOnly)).help(state.archiveOnly ? "Show open and completed threads" : "Show archived threads")
            Divider().padding(.vertical, 4)
            railButton("Journal", symbol: "book.closed", selected: state.panel == "Journal") { model.panel = "Journal" }
            railButton("Apps & Skills", symbol: "square.grid.2x2", selected: state.panel == "Apps") { model.panel = "Apps" }
            if let running = state.runningApp {
                Button { model.panel = "App" } label: { navigationLabel(running, symbol: "app").padding(.leading, 12) }
                    .buttonStyle(RailButton(selected: state.panel == "App")).help("Return to \(running), which is open")
            }
            railButton("Knowledge", symbol: "square.stack", selected: state.panel == "Knowledge") { model.panel = "Knowledge" }
            railButton("Settings", symbol: "gearshape", selected: state.panel == "Settings") { model.panel = "Settings" }
            Text("Development build · Local only").font(.caption).foregroundStyle(secondaryInk).padding(12)
        }.padding(.horizontal, 8).padding(.bottom, 8)
    }
    private func threadRow(_ row: SidebarState.Row) -> some View {
        Button { model.navigate(row.id) } label: {
            HStack(alignment: .top, spacing: 10) {
                Image(systemName: row.mode == .incognito ? "eye.slash" : row.lifecycle == .needsYou ? "tray" : row.lifecycle == .done ? "checkmark.circle" : "text.bubble").frame(width: 16, height: 18).accessibilityHidden(true)
                VStack(alignment: .leading, spacing: 3) {
                    Text(row.title).lineLimit(2).multilineTextAlignment(.leading)
                    if !row.idle { Text(row.state == .needsYou ? "Review needed" : row.state == .queued ? "Queued" : "Working").font(.caption).foregroundStyle(secondaryInk) }
                }
                Spacer(minLength: 0)
                if row.pinned { Image(systemName: "pin.fill").font(.caption2).accessibilityLabel("Pinned") }
            }
        }.buttonStyle(RailButton(selected: state.selectedID == row.id && state.panel.isEmpty))
            .accessibilityLabel(row.title + ", " + row.mode.title + ", " + row.lifecycle.title)
            .help(row.title + " · " + row.lifecycle.title + ". Right-click for thread actions.").contextMenu { threadActions(row) }
    }
    private func railButton(_ title: String, symbol: String, selected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) { navigationLabel(title, symbol: symbol) }.buttonStyle(RailButton(selected: selected)).help(title == "Home" ? "Open your Home conversation (⌘1)" : title == "Knowledge" ? "Inspect, correct, or forget saved memories" : title == "Journal" ? "Read and write your personal journal" : title == "Apps & Skills" ? "Your mini-apps and skills (⌘2)" : "Appearance, model, and keyboard settings (⌘,)")
    }
    private func navigationLabel(_ title: String, symbol: String) -> some View {
        HStack(spacing: 10) { Image(systemName: symbol).frame(width: 16, height: 18).accessibilityHidden(true); Text(title) }
    }
    @ViewBuilder private func threadActions(_ t: SidebarState.Row) -> some View {
        let model = model
        Button(t.pinned ? "Unpin Thread" : "Pin Thread") { model.perform { try await $0.pin(threadID: t.id) } }
        Button("Rename Thread…") { model.renameThread(t.id) }
        Button(t.lifecycle == .done || t.lifecycle == .archived ? "Reopen Thread" : "Mark Done") { model.perform { try await $0.lifecycle(threadID: t.id, value: t.lifecycle == .done || t.lifecycle == .archived ? .open : .done) } }.disabled(!t.idle)
        if t.lifecycle != .archived {
            Button("Archive Thread") { model.perform { try await $0.lifecycle(threadID: t.id, value: .archived); if model.selectedID == t.id { model.navigate("home") } } }.disabled(!t.idle)
        }
        if t.mode == .incognito { Button("Close Incognito Thread") { if model.selectedID == t.id { model.closeIncognito() } else { model.perform { try await $0.closeIncognito(threadID: t.id); model.textSession.discard(t.id) } } } }
    }
}
