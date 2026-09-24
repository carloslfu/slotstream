import AppKit
import SwiftUI
import SevraRuntime
import SevraPresentation

struct ContentView: View {
    @ObservedObject var model: AppModel
    var onContentLeadingChanged: (CGFloat) -> Void = { _ in }
    @Environment(\.colorScheme) private var scheme
    @Environment(\.colorSchemeContrast) private var contrast
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @AppStorage("sidebarVisible") private var rail = true
    @AppStorage("sidebarWidth") private var railWidth = 232.0
    @AppStorage("contentFontSize") private var fontSize = 16.0
    @State private var overlayRail = false
    @State private var dragStart: Double?
    @State private var composerHeight: CGFloat = 52
    @State private var composerFocused = false
    @State private var renameText = ""
    @State private var editingMemory: String?
    @State private var memoryCorrection = ""
    @State private var pageEndID: String?
    @State private var latestPage = LatestPage()
    @State private var outline: [DocumentRegion] = []
    @State private var artifactOutline: [DocumentRegion] = []
    @State private var scrolledAwayFromLatest = false
    @State private var sourceMode = false
    @State private var artifactSourceMode = false
    @State private var documentNotice = ""
    @State private var showSources = false
    @State private var settingsCategory = SettingsCategory.general
    @State private var selectedSearchID: String?
    @FocusState private var searchFocused: Bool
    @FocusState private var renameFocused: Bool
    @FocusState private var journalFocused: Bool
    @FocusState private var navigationFocused: Bool
    private var canvas: Color { scheme == .dark ? Color(red: 27/255, green: 27/255, blue: 25/255) : Color(red: 244/255, green: 243/255, blue: 238/255) }
    private var elevated: Color { scheme == .dark ? Color(red: 37/255, green: 37/255, blue: 34/255) : .white }
    private var secondaryInk: Color { contrast == .increased ? .primary : scheme == .dark ? Color(red: 184/255, green: 182/255, blue: 170/255) : Color(red: 99/255, green: 97/255, blue: 91/255) }
    private var boundary: Color { contrast == .increased ? .primary : scheme == .dark ? Color(red: 133/255, green: 130/255, blue: 119/255) : Color(red: 133/255, green: 130/255, blue: 121/255) }
    private var palette: Palette { Palette(scheme: scheme, contrast: contrast) }
    private var messages: [Message] { model.conversationMessages }
    private func speaker(_ message: Message) -> String {
        (message.role == "user" ? "You" : "Sevra") + ((model.thread?.promotedMessageIDs.contains(message.id) ?? false) ? " · From Home" : "")
    }
    private var allSource: String { messages.map { "## " + speaker($0) + "\n\n" + $0.text }.joined(separator: "\n\n") }
    private var artifactOpen: Bool { model.panel == "Artifact" }
    private var ready: Bool { model.composer.ready }
    var body: some View {
        GeometryReader { geometry in
            let wide = geometry.size.width >= 960
            let split = artifactOpen && geometry.size.width >= max(1100, fontSize * 64)
            let showRail = wide && rail && !split
            let contentLeading = showRail ? railWidth + 7 : 0
            ZStack(alignment: .leading) {
                HStack(spacing: 0) {
                    if showRail {
                        sidebar(height: geometry.size.height).frame(width: railWidth)
                        Rectangle().fill(Color.primary.opacity(0.08)).frame(width: 1).frame(width: 7).contentShape(Rectangle())
                            .gesture(DragGesture().onChanged { value in
                                if dragStart == nil { dragStart = railWidth }; railWidth = min(280, max(200, (dragStart ?? 232) + value.translation.width))
                            }.onEnded { _ in dragStart = nil })
                            .onHover { if $0 { NSCursor.resizeLeftRight.push() } else { NSCursor.pop() } }
                            .help("Drag to resize the sidebar").accessibilityLabel("Sidebar width").accessibilityValue("\(Int(railWidth)) points")
                            .accessibilityAdjustableAction { direction in railWidth = min(280, max(200, railWidth + (direction == .increment ? 8 : -8))) }
                    }
                    VStack(spacing: 0) {
                        if model.restoreNeedsReview {
                            HStack {
                                Image(systemName: "pause.circle")
                                Text("Restored Home · AI is paused until you review this snapshot.")
                                Spacer()
                                Button("Review snapshot…", action: model.reviewRestoredHome)
                            }.padding(12).background(Color.orange.opacity(0.08))
                        }
                        errorBanner
                        if split {
                            HSplitView {
                                VStack(spacing: 0) { conversation(); ComposerObserver(composer: model.composer) { composer(maxHeight: geometry.size.height * 0.30, compact: true) } }.frame(minWidth: 360, idealWidth: 430, maxWidth: 520)
                                artifact.frame(minWidth: 480)
                            }
                        } else {
                            mainContent
                            if model.panel.isEmpty || artifactOpen { ComposerObserver(composer: model.composer) { composer(maxHeight: geometry.size.height * 0.30, compact: artifactOpen) } }
                        }
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                }.disabled(overlayRail).accessibilityHidden(overlayRail)
                if overlayRail {
                    Button { dismissNavigation() } label: { Color.black.opacity(0.18).frame(maxWidth: .infinity, maxHeight: .infinity) }.buttonStyle(.plain).accessibilityLabel("Close navigation")
                    VStack(spacing: 0) {
                        HStack { Text("Navigation").font(.headline); Spacer(); NativeIconButton(symbol: "xmark", title: "Close navigation", help: "Close navigation (Escape)", action: dismissNavigation).frame(width: 28, height: 28).focusable().focused($navigationFocused) }.padding(16)
                        sidebar(height: geometry.size.height - 56)
                    }.frame(width: min(280, geometry.size.width - 48)).background(canvas).shadow(color: .black.opacity(0.12), radius: 12, x: 4).accessibilityElement(children: .contain)
                        .onAppear { navigationFocused = false; DispatchQueue.main.async { navigationFocused = true } }
                }
            }.background(canvas)
                .onReceive(NotificationCenter.default.publisher(for: .sevraToggleSidebar)) { _ in
                    if !wide || split {
                        if overlayRail { dismissNavigation() }
                        else { model.textSession.rememberFocus(); overlayRail = true }
                    } else { rail.toggle() }
                }
                .onChange(of: wide) { _, _ in overlayRail = false }
                .onAppear { onContentLeadingChanged(contentLeading) }
                .onChange(of: contentLeading) { _, value in onContentLeadingChanged(value) }
        }.frame(minWidth: 620, minHeight: 400)
        .onChange(of: model.selectedID) { _, id in
            pageEndID = nil; scrolledAwayFromLatest = false; sourceMode = false; artifactSourceMode = false; outline = []; artifactOutline = []; documentNotice = ""; overlayRail = false
            model.textSession.pendingLatestDocumentID = nil
            if id != "home", model.thread?.lifecycle != .archived { model.sidebar.archiveOnly = false }
            latestPage.reset()
        }
        .onChange(of: model.panel) { _, value in
            overlayRail = false; documentNotice = ""
            if value != "Artifact" { artifactOutline = []; artifactSourceMode = false }
            if value == "Rename" { renameText = model.thread?.title ?? "" }
        }
        .onExitCommand(perform: escape)
        .onReceive(NotificationCenter.default.publisher(for: .sevraEscape)) { _ in escape() }
        .onReceive(NotificationCenter.default.publisher(for: .sevraJumpToLatest)) { notification in
            guard model.panel.isEmpty || artifactOpen, !messages.isEmpty else { return }
            jumpToLatest(focus: notification.userInfo?["focus"] as? Bool ?? true)
        }
        .sheet(item: $model.selectedCitation) { citation in sourceSheet(citation) }
        .sheet(isPresented: Binding(get: { model.pendingLink != nil }, set: { if !$0 { model.pendingLink = nil } })) { linkSheet }
    }
    private func escape() {
        if overlayRail { dismissNavigation() }
        else if model.selectedCitation != nil { model.selectedCitation = nil }
        else if model.pendingLink != nil { model.pendingLink = nil }
        else if !model.panel.isEmpty { model.closePanel() }
    }
    private func dismissNavigation() { overlayRail = false; model.textSession.restoreFocus() }
    @ViewBuilder private func sidebar(height: CGFloat) -> some View {
        if height < 600 { ScrollView { sidebar.frame(height: 600) }.accessibilityLabel("Navigation") }
        else { sidebar }
    }
    private var sidebar: some View { SidebarView(state: model.sidebar, model: model, secondaryInk: secondaryInk) }
    private var homeChanges: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if model.externalChanges.isEmpty { Text("No external changes were found in owned Home records.") }
                ForEach(model.externalChanges) { change in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(change.path).font(.headline).textSelection(.enabled)
                        Text(change.reason).font(.callout).foregroundStyle(.secondary)
                        if let previous = change.previousDraft {
                            Text("Previously saved draft").font(.subheadline.bold())
                            Text(previous.isEmpty ? "Empty draft" : previous).textSelection(.enabled)
                        }
                        if let draft = change.externalDraft {
                            Text("Edited file").font(.subheadline.bold())
                            Text(draft.isEmpty ? "Empty draft" : draft).textSelection(.enabled)
                        }
                    }.padding().background(.quaternary.opacity(0.35), in: RoundedRectangle(cornerRadius: 8))
                }
                HStack {
                    Button("Inspect again", action: model.inspectHomeChanges)
                    Spacer()
                    if !model.externalChanges.isEmpty && model.externalChanges.allSatisfy(\.canAdopt) {
                        Button("Adopt reviewed drafts", action: model.adoptExternalDrafts).buttonStyle(.borderedProminent).disabled(model.reviewingChanges)
                    } else if !model.externalChanges.isEmpty { Button("Restore a backup…", action: model.restoreHomeBackup) }
                }
            }.frame(maxWidth: 720, alignment: .leading).padding(24).frame(maxWidth: .infinity)
        }
    }
    @ViewBuilder private var errorBanner: some View {
        if let error = model.error {
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: "exclamationmark.triangle").accessibilityHidden(true)
                Text(error).font(.callout).textSelection(.enabled).frame(maxWidth: .infinity, alignment: .leading)
                if model.snapshot?.storageNeedsReview == true {
                    Button("Inspect Home changes…", action: model.inspectHomeChanges)
                }
                NativeIconButton(symbol: "xmark", title: "Dismiss error", help: "Dismiss this message", action: model.dismissError).frame(width: 28, height: 28)
            }.padding(12).background(Color.orange.opacity(0.08)).accessibilityElement(children: .contain).accessibilityLabel("Attention")
        }
    }
    /// Panels cover the conversation instead of replacing it. It stays laid
    /// out underneath, hidden and out of reach, so returning from a panel
    /// needs no new layout of a long history.
    @ViewBuilder private var mainContent: some View {
        let covered = Self.panels.contains(model.panel)
        ZStack {
            conversation(covered: covered)
                .opacity(covered ? 0 : 1).allowsHitTesting(!covered).accessibilityHidden(covered).disabled(covered)
            if covered { panelContent.frame(maxWidth: .infinity, maxHeight: .infinity) }
        }
    }
    private static let panels: Set<String> = ["Settings", "Search", "Needs you", "Knowledge", "Journal", "Rename", "Artifact", "Context", "Home changes", "Changes", "App review", "Skill review", "Apps", "App"]
    @ViewBuilder private var panelContent: some View {
        switch model.panel {
        case "Settings": settings
        case "Search": search
        case "Needs you": needsYou
        case "Knowledge": knowledge
        case "Journal": ComposerObserver(composer: model.journalComposer) { journal }
        case "Rename": rename
        case "Artifact": artifact
        case "Context": contextInspector
        case "Home changes": homeChanges
        case "Changes": ChangesPanel(model: model, palette: palette)
        case "App review": AppReviewPanel(model: model, palette: palette)
        case "Skill review": SkillReviewPanel(model: model, palette: palette)
        case "Apps": AppsPanel(model: model, palette: palette)
        case "App": AppCanvas(model: model, palette: palette)
        default: EmptyView()
        }
    }
    private func conversation(covered: Bool = false) -> some View {
        VStack(spacing: 0) {
            if !ready {
                VStack(spacing: 16) { if model.error == nil { ProgressView(); Text("Opening your Home…") } else { Text("Your Home could not be opened.").font(.headline); Text("Your saved files have been preserved. The message above explains what needs attention.").foregroundStyle(secondaryInk).multilineTextAlignment(.center) } }.padding(32).frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if messages.isEmpty {
                VStack(alignment: .leading, spacing: 14) {
                    Spacer()
                    Text(model.thread?.mode == .incognito ? "A private place to think." : "What would you like to work on?").font(.custom("Poppins-Medium", size: 24))
                    Text(model.thread?.mode == .incognito ? "This thread stays out of saved history and shared memory. It disappears when you close it." : "Ask something, or bring a file and work through it together.").font(.custom("Inter-Regular", size: 16)).foregroundStyle(secondaryInk).fixedSize(horizontal: false, vertical: true)
                    HStack(spacing: 12) {
                        Button { model.attach() } label: { Label("Attach files or folders", systemImage: "paperclip") }.disabled(!ready || model.working || model.attaching || model.aiPaused).help(attachHelp)
                        if model.thread?.mode != .incognito {
                            Button { model.useSkill("app") } label: { Label("Build an app", systemImage: "square.grid.2x2") }.disabled(!ready || model.aiPaused).help("Start a request for a mini-app that runs inside Sevra")
                        }
                    }.padding(.top, 4)
                    Text("Try: Summarize this PDF with citations, fix the dates in my notes, or search my knowledge base.").font(.callout).foregroundStyle(secondaryInk)
                    Spacer()
                }.padding(.vertical, 32).readingColumn()
            } else {
                documentToolbar
                Transcript(documentID: model.selectedID + ":" + (pageEndID ?? "latest"), sections: loadedSections, fontSize: fontSize, sourceMode: sourceMode, hidden: covered, session: model.textSession, onLink: model.inspectLink, onNotice: { if !covered, documentNotice != $0 { documentNotice = $0 } }, onOutline: { outline = $0 }, onScrollAwayFromLatest: { scrolledAwayFromLatest = $0 }, onDetails: model.showDetails)
                    .overlay(alignment: .bottom) {
                        if scrolledAwayFromLatest || pageEndID != nil {
                            NativeIconButton(symbol: "arrow.down", title: "Jump to latest message", help: "Jump to latest message (⌃⌘↓)", prominent: true, action: { jumpToLatest() })
                                .frame(width: 36, height: 36)
                                .background(elevated, in: Circle())
                                .overlay(Circle().stroke(boundary, lineWidth: contrast == .increased ? 2 : 1))
                                .shadow(color: .black.opacity(scheme == .dark ? 0.22 : 0.1), radius: 3, y: 1)
                                .padding(.bottom, 12)
                        }
                    }.frame(maxWidth: 752).padding(.horizontal, 8).frame(maxWidth: .infinity)
                if !documentNotice.isEmpty { Text(documentNotice).font(.caption).foregroundStyle(secondaryInk).textSelection(.enabled).readingColumn() }
            }
            runStatus
        }
    }
    private func jumpToLatest(focus: Bool = true) {
        if pageEndID != nil {
            model.textSession.pendingLatestDocumentID = model.selectedID + ":latest"
            model.textSession.pendingLatestFocus = focus
            pageEndID = nil
        } else { model.textSession.conversation?.jumpToLatest(focus: focus) }
    }
    private var page: Range<Int> {
        let counts = model.conversationByteCounts
        guard let pageEndID else { return latestPage.range(ids: model.conversationMessageIDs, byteCounts: counts, threadID: model.selectedID, readingEarlier: scrolledAwayFromLatest) }
        return HistoryPage.range(byteCounts: counts, endingAt: messages.firstIndex { $0.id == pageEndID }.map { $0 + 1 })
    }
    private var loadedSections: [DocumentSection] {
        messages[page].map { m in
            var section = DocumentSection(id: m.id, speaker: speaker(m), source: m.text, citationIDs: model.citationIDs(for: m))
            if m.role == "assistant", let (threadID, run) = model.run(for: m), let link = ResponseDetailsLink.url(threadID: threadID, runID: run.id) {
                section.details = link
                if let summary = model.thoughtSummary(for: run) {
                    section.lead = DocumentAnnotation(text: summary + " ›", link: link, help: "Show the working notes and details for this response")
                }
                if model.showResponseDetails, run.state.terminal || run.state == .needsYou, let metrics = run.metrics, let line = ResponseMetricsFormat.line(metrics) {
                    section.trail = DocumentAnnotation(text: line, link: link, help: "Show the details for this response")
                }
            }
            return section
        }
    }
    private var documentToolbar: some View {
        HStack(spacing: 12) {
            if model.thread?.promotedMessageIDs.isEmpty == false {
                Button("View in Home") { model.navigate("home") }.help("Open Home. The original messages stay there.")
            }
            if page.lowerBound > 0 { Button("Earlier") { pageEndID = messages[page.lowerBound - 1].id }.help("Read the previous page of messages") }
            if pageEndID != nil { Button("Newer") { let end = HistoryPage.nextEnd(byteCounts: model.conversationByteCounts, startingAt: page.upperBound); pageEndID = end == messages.count ? nil : messages[end - 1].id }.help("Read the next page of messages") }
            if page.count < messages.count { Text("\(page.lowerBound + 1)–\(page.upperBound) of \(messages.count)").font(.caption).foregroundStyle(secondaryInk).help("Find and selection apply to this page. Export includes the full conversation.") }
            Spacer()
            if let runs = model.thread?.savedRuns, !runs.isEmpty {
                Menu("Documents") {
                    ForEach(runs) { run in Button((run.artifact ?? "Document").split(separator: "/").last.map(String.init) ?? "Document") { model.openArtifact(runID: run.id) } }
                }.menuStyle(.borderlessButton).fixedSize().help("Open a saved document from this thread")
            }
            if !sourceMode && !outline.isEmpty { outlineMenu(outline, artifact: false) }
            NativeIconMenu(symbol: "doc.text", title: "Conversation options", help: "Conversation options: Markdown source, response details, copy, export, and find", items: [
                NativeMenuAction(title: "Show Markdown source", checked: sourceMode) { sourceMode.toggle() },
                NativeMenuAction(title: "Show response details", checked: model.showResponseDetails) { model.toggleResponseDetails() },
                NativeMenuAction(title: "Copy conversation as Markdown") { model.copyText(allSource) },
                NativeMenuAction(title: "Export Markdown…") { model.exportText(allSource, filename: "conversation.md") },
                NativeMenuAction(title: "Find in conversation…") { model.textSession.conversation?.findDocument() }
            ]).frame(width: 28, height: 28)
        }.font(.callout).controlSize(.small).padding(.top, 4).readingColumn()
    }
    private func outlineMenu(_ regions: [DocumentRegion], artifact: Bool) -> some View {
        let showingSource = artifact ? artifactSourceMode : sourceMode
        return NativeIconMenu(symbol: "list.bullet", title: artifact ? "Document outline" : "Conversation outline",
                       help: showingSource ? "Switch off Markdown source to use the outline" : regions.isEmpty ? "Outline: no headings, code blocks, or tables in this view" : "Outline: jump to a heading, code block, or table",
                       items: regions.isEmpty ? [NativeMenuAction(title: showingSource ? "Switch off Markdown source to use the outline" : "No headings, code blocks, or tables", enabled: false)] : regions.map { region in
            NativeMenuAction(title: region.kind == .code ? "Code · " + region.title : region.title) {
                (artifact ? model.textSession.artifact : model.textSession.conversation)?.jump(to: region)
            }
        }).frame(width: 28, height: 28)
    }
    @ViewBuilder private var runStatus: some View {
        if let run = model.thread?.run {
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .center, spacing: 10) {
                    if !run.state.terminal && run.state != .needsYou { ProgressView().controlSize(.small) }
                    else { Image(systemName: run.state == .needsYou ? "doc.badge.clock" : run.state == .completed ? "checkmark.circle" : "exclamationmark.circle").foregroundStyle(secondaryInk).accessibilityHidden(true) }
                    Text(run.status + liveSpeed(run)).font(.callout).foregroundStyle(secondaryInk).lineLimit(3).textSelection(.enabled).monospacedDigit()
                    Spacer(minLength: 4)
                    if run.proposal != nil { Button("Review document") { model.panel = "Artifact" }.buttonStyle(.borderedProminent) }
                    if run.appProposal != nil { Button("Review app") { model.panel = "App review" }.buttonStyle(.borderedProminent) }
                    if run.skillProposal != nil { Button("Review skill") { model.panel = "Skill review" }.buttonStyle(.borderedProminent) }
                    if let changes = run.changes {
                        if changes.state == .proposed { Button("Review changes") { model.reviewChanges() }.buttonStyle(.borderedProminent).accessibilityIdentifier("review-changes") }
                        else if changes.state != .rejected { Button("Changes") { model.reviewChanges(changes) }.help("See what was written, or undo it") }
                    }
                    if let published = run.published, published.hasPrefix("app:"), model.snapshot?.home.apps?.contains(where: { $0.id == published.dropFirst(4) && $0.active != nil && !$0.removed }) == true {
                        Button("Open app") { model.openApp(String(published.dropFirst(4))) }
                    }
                    if run.artifact != nil && !artifactOpen { Button("Open document") { model.openArtifact() } }
                    if [.failed, .interrupted, .stopped].contains(run.state) { Button("Edit and retry", action: model.prepareRetry).help("Copy the request to your draft so you can edit and send it again") }
                    if run.context != nil { Button("Context") { model.contextRunID = nil; model.panel = "Context" }.help("Inspect the history and memories used for this response") }
                    if model.selectedID == "home", run.state == .completed, let t = model.thread {
                        let ids = t.messages.filter { $0.runID == run.id }.map(\.id)
                        let continuation = model.snapshot?.home.continuation(of: ids)
                        Button(continuation == nil ? "Continue in thread" : "Open thread") { model.continueInThread(messageIDs: ids) }
                            .help(continuation.map { "Continue in “\($0.title)”" } ?? "Start a thread with this Home exchange as context")
                            .disabled(model.composer.transitioning || model.composer.sending)
                    }
                }
                if let context = run.context, context.omittedMessages > 0 {
                    Text("Using a recent conversation window and labeled excerpts. Earlier history remains searchable.").font(.caption).foregroundStyle(secondaryInk)
                }
                if let live = model.liveThinking, live.runID == run.id, live.active, !live.text.isEmpty {
                    // Indented to the status text, so the thought reads as part of "Thinking…".
                    Button { model.showDetails(threadID: model.selectedID, runID: run.id, anchor: "thought") } label: { ThoughtPreview(text: live.text, palette: palette) }
                        .buttonStyle(.plain).background(DetailsAnchor(presenter: model.details, key: "thought")).padding(.leading, 26)
                        .help("Show all working notes. They are not saved or remembered.")
                        .accessibilityElement(children: .ignore).accessibilityLabel("Working notes")
                        .accessibilityValue(ThinkingPolicy.preview(live.text, limit: 160)).accessibilityHint("Shows all working notes and details")
                        .accessibilityAddTraits(.isButton).accessibilityIdentifier("thinking-preview")
                } else if let receipt = run.thinking, !replyShown(run) {
                    // A response that ended without text still says how its thinking ended.
                    Button { model.showDetails(threadID: model.selectedID, runID: run.id, anchor: "status") } label: { Text(receipt.summary + " ›") }
                        .buttonStyle(.plain).font(.caption).foregroundStyle(secondaryInk)
                        .help("Show the working notes and details for this response").accessibilityIdentifier("thinking-receipt")
                }
                if !run.trace.isEmpty {
                    DisclosureGroup("Activity") {
                        ScrollView { VStack(alignment: .leading, spacing: 6) { ForEach(Array(run.trace.enumerated()), id: \.offset) { Text($0.element).font(.caption).textSelection(.enabled).frame(maxWidth: .infinity, alignment: .leading) } } }.frame(maxHeight: 130)
                    }.font(.callout)
                }
            }.padding(.vertical, 8).readingColumn()
                .background(DetailsAnchor(presenter: model.details, key: "status"))
        }
    }
    /// " · 12.8 tok/s" while the model writes, when response details are on.
    private func liveSpeed(_ run: Run) -> String {
        guard model.showResponseDetails, let g = model.liveGeneration, g.runID == run.id, let rate = g.rate, !run.state.terminal else { return "" }
        return " · " + ResponseMetricsFormat.rate(rate) + " tok/s"
    }
    /// Whether the conversation shows this run's reply, which then carries its thinking line.
    private func replyShown(_ run: Run) -> Bool {
        messages.contains { $0.role == "assistant" && $0.runID == run.id }
    }
    private func composer(maxHeight: CGFloat, compact: Bool) -> some View {
        VStack(spacing: 8) {
            composerIssue
            if model.attaching { HStack { ProgressView().controlSize(.small); Text("Preparing source…").font(.callout); Spacer() } }
            if !model.attachments.isEmpty { AttachmentBar(model: model, palette: palette).padding(.horizontal, 4) }
            VStack(spacing: 0) {
                ZStack(alignment: .topLeading) {
                    if model.draft.isEmpty { Text(model.busy ? "Draft your next message…" : "Message Sevra…").font(.custom("Inter-Regular", size: fontSize)).foregroundStyle(secondaryInk).padding(.leading, 15).padding(.top, 10).allowsHitTesting(false).accessibilityHidden(true) }
                    Composer(text: Binding(get: { model.draft }, set: model.edited), documentID: model.selectedID, session: model.textSession, fontSize: fontSize,
                        canSend: model.composer.canSend && !model.busy && !model.attaching && !model.aiPaused, focusRevision: model.focusRevision,
                        onHeight: { if composerHeight != $0 { composerHeight = $0 } }, onFocus: { composerFocused = $0 }, onFiles: model.attachFiles, send: model.send)
                        .id(model.selectedID).frame(height: min(max(compact ? 42 : 52, composerHeight), max(52, min(fontSize * 12, maxHeight - 44)))).disabled(!ready || model.composer.closing)
                }
                HStack(spacing: 8) {
                    NativeIconButton(symbol: "paperclip", title: "Attach files or folders", help: attachHelp, action: model.attach).frame(width: 28, height: 28).disabled(!ready || model.working || model.attaching || model.aiPaused)
                    SkillMenu(model: model).frame(width: 28, height: 28).disabled(!ready || model.aiPaused)
                    Menu {
                        if model.thread?.mode == .incognito {
                            Text("This thread is not saved and uses no shared memory.")
                        } else {
                            Picker("Memory scope", selection: Binding(get: { model.thread?.mode ?? .shared }, set: changeMode)) {
                                Text("Shared memory").tag(MemoryMode.shared)
                                Text("Thread only").tag(MemoryMode.threadOnly)
                            }.pickerStyle(.inline)
                            Divider()
                            Text("Shared memory uses memories you saved.")
                            Text("Thread only can read shared memories; new memories stay in this thread.")
                            if model.thread?.mode == .threadOnly && model.thread?.readsSharedMemory != true {
                                Text("This older thread still reads only its own memories.")
                                Button("Allow shared memories here") { changeMode(.threadOnly) }
                            }
                        }
                        Divider(); Button("New Incognito Thread") { model.newThread(.incognito) }
                    } label: { Label(model.thread?.mode.title ?? "Shared memory", systemImage: model.thread?.mode == .incognito ? "eye.slash" : "circle.hexagongrid") }.disabled(!ready || model.busy)
                        .help("Choose which memories this thread can use")
                    Toggle(isOn: Binding(get: { model.thinkingEnabled }, set: { _ in model.toggleThinking() })) { Label("Think longer", systemImage: "brain") }
                        .toggleStyle(.button).disabled(!ready || model.thinkingUnavailable).help(thinkHelp)
                        .accessibilityIdentifier("think-longer").accessibilityHint(thinkHelp)
                    Spacer(minLength: 8)
                    if model.busy {
                        if model.liveThinking?.active == true {
                            Button("Answer now", action: model.answerNow).accessibilityIdentifier("answer-now")
                                .help("End the thought now and answer from what Sevra has so far")
                        }
                        Button(model.thread?.run?.state == .stopping ? "Stopping…" : model.thread?.run?.state == .queued ? "Cancel" : model.thread?.run?.state == .needsYou ? "Cancel review" : "Stop", action: model.stop)
                            .disabled(model.thread?.run?.state == .stopping).accessibilityIdentifier("stop-response").help(model.thread?.run?.state == .queued ? "Remove this message from the queue" : model.thread?.run?.state == .needsYou ? "Cancel this review. Nothing waiting for review is saved or written" : "Stop the current response and further tool actions")
                    } else {
                        Button(action: model.send) { Label(model.otherThreadWorking ? "Queue" : "Send", systemImage: "arrow.up") }.buttonStyle(.borderedProminent)
                            .disabled(!model.composer.canSend || model.attaching || model.aiPaused).accessibilityIdentifier("send-message").help(sendHelp).accessibilityHint(sendHelp)
                    }
                }.padding(10)
            }.background(elevated).clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(composerFocused ? Color.accentColor : boundary, lineWidth: composerFocused || contrast == .increased ? 2 : 1))
            ViewThatFits(in: .horizontal) {
                HStack { composerHint; Spacer(); Text("Shift+Return for a new line").foregroundStyle(secondaryInk) }
                composerHint
            }.font(.caption)
        }.padding(.top, 8).padding(.bottom, 16).readingColumn()
    }
    private var attachHelp: String {
        model.aiPaused ? "Review Home changes before attaching a source" : model.working ? "Attach sources after this response finishes" : "Attach files, folders or a db.md knowledge base. Sevra reads them; changes need your permission and review."
    }
    private var typicalThinking: String? { model.typicalThinkingSeconds.map { "Recently about " + ThinkingPolicy.describe($0) + " extra." } }
    private var thinkHelp: String {
        if model.aiPaused { return "Review Home changes before changing thinking" }
        if model.thinkingEnabled {
            return model.snapshot?.attachmentNames[model.selectedID] != nil
                ? "Sevra thinks before each answer in this thread, including while it reads your sources. Turn off for faster replies."
                : "Sevra thinks before each answer in this thread. Turn off for faster replies."
        }
        return "Take more time before answering. " + (typicalThinking ?? "Adds time on this Mac.") + " You can press Answer now at any point."
    }
    private var thinkingHint: String { "Thinks before answering. " + (typicalThinking ?? "Answer now ends a thought early.") }
    private var sendHelp: String {
        if model.aiPaused { return "Review Home changes before sending" }
        if model.attaching { return "Wait for the attached source to finish preparing" }
        if model.composer.issue != nil { return "Resolve the draft issue before sending" }
        if !model.composer.canSend { return "Write a message to send it (Return)" }
        return model.otherThreadWorking ? "Queue this message after the current response (Return)" : "Send message (Return)"
    }
    private var composerHint: some View {
        Text(model.composer.issue != nil ? "Draft needs attention." : model.submitting ? "Sending…" : !model.draftSaved ? "Saving draft…" : !model.notice.isEmpty ? model.notice : model.busy && !model.draft.isEmpty ? "Finish or stop this response to send." : model.thread?.mode == .incognito ? "Discarded when you close this thread." : model.thinkingEnabled && !model.busy ? thinkingHint : "Local on this Mac.").foregroundStyle(secondaryInk)
    }
    @ViewBuilder private var composerIssue: some View { draftIssue(model.composer) }
    @ViewBuilder private func draftIssue(_ composer: ComposerSession) -> some View {
        if let issue = composer.issue {
            VStack(alignment: .leading, spacing: 8) {
                Text(issue.message).font(.callout).textSelection(.enabled)
                if case .conflict(let current) = issue {
                    DisclosureGroup("Saved draft") {
                        ScrollView { Text(current.text.isEmpty ? "Empty draft" : current.text).textSelection(.enabled).frame(maxWidth: .infinity, alignment: .leading) }.frame(maxHeight: 120)
                    }
                    HStack {
                        Button("Keep My Draft") { Task { await composer.keepMyDraft() } }
                        Button("Use Saved Draft") { composer.useSavedDraft() }
                        Button("Copy My Draft") { model.copyText(composer.text) }
                    }
                } else {
                    HStack {
                        Button({ if case .send = issue { return "Retry Send" }; return "Retry Save" }()) { Task { await composer.retry() } }
                        Button("Copy Draft") { model.copyText(composer.text) }
                    }
                }
            }.padding(12).frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.orange.opacity(0.08)).clipShape(RoundedRectangle(cornerRadius: 8))
                .accessibilityElement(children: .contain).accessibilityLabel("Draft needs attention")
        }
    }
    private func changeMode(_ mode: MemoryMode) { let id = model.selectedID; model.perform { try await $0.changeMode(threadID: id, mode: mode) } }
    private var settings: some View {
        VStack(spacing: 0) {
            SettingsTabs(value: $settingsCategory).frame(width: 360, height: 28)
                .padding(.top, 20).padding(.bottom, 8)
            Form {
                switch settingsCategory {
                case .general:
                    Section("Appearance") {
                        LabeledContent("Appearance") { AppearanceControl(value: Binding(get: { model.appearance }, set: model.setAppearance)).frame(width: 220, height: 26) }
                        HStack { Slider(value: $fontSize, in: 14...24, step: 1) { Text("Text size") }.help("Adjust conversation and document text size"); Text("\(Int(fontSize)) pt").monospacedDigit().frame(width: 45) }
                        Text("A comfortable space to read and write.").font(.custom("Inter-Regular", size: fontSize)).fixedSize(horizontal: false, vertical: true).padding(.vertical, 6)
                        Slider(value: $railWidth, in: 200...280, step: 8) { Text("Sidebar width") }.help("Adjust the width of the navigation sidebar")
                    }
                    Section("Your Home") {
                        Text(model.homeURL.path).textSelection(.enabled).foregroundStyle(secondaryInk)
                        Button("Open Home folder") { NSWorkspace.shared.open(model.homeURL) }.help("Open this Home in Finder")
                        HStack {
                            Button("Back up Home…", action: model.backUpHome).disabled(model.runtime == nil).help("Save a verified copy of conversations, drafts, and owned files")
                            Button("Restore backup…", action: model.restoreHomeBackup).help("Restore into a separate Home with AI paused for review")
                        }.disabled(model.transferringHome)
                        if model.transferringHome { ProgressView("Verifying Home files…") }
                        if !model.homeTransferMessage.isEmpty { Text(model.homeTransferMessage).font(.callout).textSelection(.enabled) }
                        if let backup = model.backupURL { Button("Reveal backup") { NSWorkspace.shared.activateFileViewerSelecting([backup]) } }
                        if model.restoredHomeURL != nil { Button("Open restored Home", action: model.openRestoredHome) }
                        Text("Backups include drafts and owned files. Restores open as a separate Home with AI paused for privacy review.").font(.caption).foregroundStyle(secondaryInk)
                        Text("Conversations and inference stay local. No account, app analytics or automatic reports.").foregroundStyle(secondaryInk)
                    }
                case .model:
                    PerformanceSettings(model: model, performance: model.performanceState)
                    Section("Model files") {
                        if let setup = model.setupStatus {
                            Text(setup.phase).font(.headline)
                            if setup.detail != setup.phase {
                                Text(setup.phase == "Not checked" ? "Check whether the model files are ready on this Mac." : setup.detail).foregroundStyle(secondaryInk).textSelection(.enabled)
                            }
                            if setup.requiredBytes > 0 && !setup.busy && setup.phase != "Not checked" { LabeledContent("Files remaining", value: ByteCountFormatter.string(fromByteCount: setup.requiredBytes, countStyle: .file)) }
                            if setup.freeBytes > 0 { LabeledContent("Available storage", value: ByteCountFormatter.string(fromByteCount: setup.freeBytes, countStyle: .file)).accessibilityElement(children: .ignore).accessibilityLabel("Available storage").accessibilityValue(ByteCountFormatter.string(fromByteCount: setup.freeBytes, countStyle: .file)) }
                            if setup.busy || model.preparingModel {
                                HStack { ProgressView().controlSize(.small); Button("Stop setup") { model.setup?.cancel() }.help("Stop model setup; completed downloads are kept") }
                            } else {
                                HStack {
                                    Button("Check local model") { model.setUpModel(download: false) }.help("Verify the model files already on this Mac")
                                    if !setup.ready { Button("Download or repair…") { model.setUpModel(download: true) }.help("Download missing model files or repair damaged files") }
                                }.disabled(model.busy || !ready)
                                if !setup.ready { Text("Downloads contact the model host. Conversation data is not sent.").font(.callout).foregroundStyle(secondaryInk) }
                            }
                        }
                    }
                case .keyboard:
                    Section("Keyboard shortcuts") {
                        ForEach(MacCommand.reference, id: \.title) { command in
                            LabeledContent(command.title) { Text(command.shortcut).foregroundStyle(secondaryInk).monospaced() }
                                .accessibilityElement(children: .ignore)
                                .accessibilityLabel(command.title).accessibilityValue(command.shortcut)
                        }
                    }
                }
            }.formStyle(.grouped).scrollContentBackground(.hidden).id(settingsCategory)
        }.frame(maxWidth: 800).frame(maxWidth: .infinity).background(canvas)
    }
    /// The response whose context is shown: one chosen from its details, or the latest.
    private var contextRun: Run? {
        if let id = model.contextRunID, let run = model.snapshot?.home.threads.lazy.compactMap({ $0.allRuns.first { $0.id == id } }).first { return run }
        return model.thread?.run
    }
    private var contextInspector: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let context = contextRun?.context {
                    Text("Starting context for this response").font(.title2)
                    Text("\(context.messageIDs.count) complete \(context.messageIDs.count == 1 ? "message" : "messages") · \(context.memoryIDs.count) saved \(context.memoryIDs.count == 1 ? "memory" : "memories")").foregroundStyle(secondaryInk)
                    if context.omittedMessages > 0 || context.omittedMemories > 0 {
                        Text("\(context.omittedMessages) older messages remain in history. \(context.omittedMemories) eligible memories were outside this response's selection.").font(.callout).foregroundStyle(secondaryInk)
                    }
                    Text("This is the conversation context selected before the response began. Later source reads are available in Activity and document citations.").font(.callout).foregroundStyle(secondaryInk)
                    DisclosureGroup("Messages included") {
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(context.messageIDs, id: \.self) { id in
                                if let message = model.snapshot?.home.threads.flatMap(\.messages).first(where: { $0.id == id }) {
                                    Text(message.role == "user" ? "You" : "Sevra").font(.caption).foregroundStyle(secondaryInk)
                                    Text(message.text).textSelection(.enabled).frame(maxWidth: .infinity, alignment: .leading)
                                } else { Text("This message is no longer available in the current Home.").foregroundStyle(secondaryInk) }
                            }
                        }.padding(.top, 8)
                    }
                    if !context.memoryIDs.isEmpty {
                        Text("Saved memories").font(.headline)
                        Text("Selected by matching words, thread scope and recency within a bounded budget.").font(.callout).foregroundStyle(secondaryInk)
                        ForEach(context.memoryIDs, id: \.self) { id in
                            if let memory = model.snapshot?.home.memories.first(where: { $0.id == id }) {
                                Text(memory.text).textSelection(.enabled)
                                if memory.forgotten { Text("No longer eligible for future responses.").font(.caption).foregroundStyle(secondaryInk) }
                            }
                        }
                    }
                    if !context.earlierExcerpts.isEmpty {
                        Text("Earlier conversation excerpts").font(.headline)
                        Text("Partial source text, not a complete summary.").font(.callout).foregroundStyle(secondaryInk)
                        ForEach(context.earlierExcerpts, id: \.messageID) { excerpt in
                            Text(excerpt.role == "user" ? "You" : "Sevra").font(.caption).foregroundStyle(secondaryInk)
                            Text(excerpt.text + (excerpt.truncated ? "…" : "")).textSelection(.enabled)
                        }
                    }
                } else { Text("Send a message to inspect its context.").foregroundStyle(secondaryInk) }
            }.padding(.vertical, 24).readingColumn()
        }
    }
    private var search: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextField("Search saved threads in this Home", text: $model.query).textFieldStyle(.roundedBorder).focused($searchFocused).accessibilityLabel("Search saved threads")
                .onSubmit(openSearchSelection)
                .onKeyPress(.downArrow) { moveSearchWithKeyboard(1) }
                .onKeyPress(.upArrow) { moveSearchWithKeyboard(-1) }
                .help("Use the arrow keys to select a thread, then Return to open it.")
            Text("Includes archived threads. Incognito and forgotten source messages are excluded.").font(.caption).foregroundStyle(secondaryInk)
            ScrollViewReader { proxy in
              ScrollView {
                LazyVStack(alignment: .leading, spacing: 4) {
                    let results = model.searchResults
                    if results.isEmpty { emptyState("No matching threads", detail: "Try a different word or a shorter phrase.") }
                    ForEach(results) { t in
                        Button { model.navigate(t.id) } label: {
                            VStack(alignment: .leading, spacing: 6) {
                                Text(t.title).font(.headline).lineLimit(2)
                                Text(t.mode.title + " · " + t.lifecycle.title).font(.caption).foregroundStyle(secondaryInk)
                            }.frame(maxWidth: .infinity, alignment: .leading).padding(.vertical, 6)
                        }.buttonStyle(RailButton(selected: selectedSearchID == t.id)).id(t.id)
                            .accessibilityAddTraits(selectedSearchID == t.id ? .isSelected : [])
                    }
                }
              }.onChange(of: selectedSearchID) { _, id in if let id { proxy.scrollTo(id) } }
            }
        }.padding(.vertical, 24).readingColumn()
            .onAppear { selectedSearchID = model.searchResults.first?.id; searchFocused = false; DispatchQueue.main.async { searchFocused = true } }
            .onChange(of: model.searchResults) { _, results in selectedSearchID = results.first?.id }
    }
    private func moveSearchWithKeyboard(_ offset: Int) -> KeyPress.Result {
        // The input method owns arrow keys while composing marked text.
        if (NSApp.keyWindow?.firstResponder as? NSTextView)?.hasMarkedText() == true { return .ignored }
        moveSearchSelection(offset)
        return .handled
    }
    private func moveSearchSelection(_ offset: Int) {
        let results = model.searchResults
        guard !results.isEmpty else { selectedSearchID = nil; return }
        let current = results.firstIndex { $0.id == selectedSearchID } ?? (offset > 0 ? -1 : results.count)
        selectedSearchID = results[min(results.count - 1, max(0, current + offset))].id
    }
    private func openSearchSelection() {
        guard let result = model.searchResults.first(where: { $0.id == selectedSearchID }) ?? model.searchResults.first else { return }
        model.navigate(result.id)
    }
    private var needsYou: some View {
        ScrollView { VStack(alignment: .leading, spacing: 20) {
            let pending = model.snapshot?.home.threads.filter { $0.run?.state == .needsYou } ?? []
            if pending.isEmpty { emptyState("Nothing needs your attention", detail: "Documents, file changes, apps and skills waiting for review appear here.") }
            ForEach(pending) { t in
                VStack(alignment: .leading, spacing: 10) {
                    Text(t.title).font(.headline)
                    Text(reviewSummary(t.run)).foregroundStyle(secondaryInk)
                    HStack { Button(reviewTitle(t.run)) { model.navigateToReview(t.id) }.buttonStyle(.borderedProminent); Text(t.mode.title).font(.caption).foregroundStyle(secondaryInk) }
                }.frame(maxWidth: .infinity, alignment: .leading); Divider()
            }
        }.padding(.vertical, 24).readingColumn() }
    }
    private var artifact: some View {
        VStack(spacing: 0) {
            if let p = model.thread?.run?.proposal { artifactBody(id: p.id, filename: p.filename, text: p.content, citations: p.citations, proposal: p) }
            else if let saved = model.savedDocument, saved.threadID == model.selectedID { artifactBody(id: "saved:" + saved.runID, filename: (saved.path as NSString).lastPathComponent, text: saved.text, citations: saved.citations, proposal: nil) }
            else { emptyState("No document open", detail: "Return to the conversation to choose a saved document or review a proposal.") }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    private func artifactBody(id: String, filename: String, text: String, citations: [Citation], proposal: ArtifactProposal?) -> some View {
        VStack(spacing: 0) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(filename).font(.headline).lineLimit(2).help(filename).textSelection(.enabled)
                    Text(proposal == nil ? "Current saved file · Read-only" : "Review before creating a file in Home/artifacts.").font(.caption).foregroundStyle(secondaryInk)
                }
                Spacer()
                if !artifactSourceMode && !artifactOutline.isEmpty { outlineMenu(artifactOutline, artifact: true) }
                NativeIconMenu(symbol: "doc.text", title: "Document options", help: proposal == nil ? "Document options: Markdown source, copy, export, and find" : "Document options: Markdown source, copy, and find", items:
                    [NativeMenuAction(title: "Show Markdown source", checked: artifactSourceMode) { artifactSourceMode.toggle() },
                     NativeMenuAction(title: "Copy Markdown") { model.copyText(text) }] +
                    (proposal == nil ? [NativeMenuAction(title: "Export Markdown…") { model.exportText(text, filename: filename) }] : []) +
                    [NativeMenuAction(title: "Find in document…") { model.textSession.artifact?.findDocument() }]
                ).frame(width: 28, height: 28)
            }.padding(24)
            Transcript(documentID: id, sections: [DocumentSection(id: id, source: text, citationIDs: Set(citations.map(\.id)))], fontSize: fontSize, sourceMode: artifactSourceMode, label: "Document preview", horizontalInset: 24, session: model.textSession, onLink: model.inspectLink, onNotice: { if documentNotice != $0 { documentNotice = $0 } }, onOutline: { artifactOutline = $0 })
            if !documentNotice.isEmpty { Text(documentNotice).font(.caption).foregroundStyle(secondaryInk).padding(.horizontal, 24) }
            if !citations.isEmpty {
                DisclosureGroup("Sources (\(citations.count))", isExpanded: $showSources) {
                    ScrollView { VStack(alignment: .leading, spacing: 8) { ForEach(citations) { citation in
                        Button { model.selectedCitation = citation } label: { HStack { Text("[\(citation.id)]").monospaced(); Text(citation.path).lineLimit(1); Spacer(); Image(systemName: "arrow.up.right") }.frame(maxWidth: .infinity, alignment: .leading) }.buttonStyle(.plain).help("Inspect " + citation.path).accessibilityLabel("Source \(citation.id): \(citation.path)")
                    } } }.frame(maxHeight: 100)
                }.font(.callout).padding(.horizontal, 24).padding(.vertical, 12)
            }
            HStack {
                if let proposal {
                    Button("Reject") { model.stop(); model.closePanel() }.help("Discard this proposal without creating a file")
                    Spacer(); Button(model.approving ? "Saving…" : "Save document") { model.approve(proposal) }.buttonStyle(.borderedProminent).disabled(model.approving || model.aiPaused).accessibilityIdentifier("approve-artifact").help("Create the reviewed document in this Home’s artifacts folder")
                } else {
                    Button("Reveal in Finder") { if let saved = model.savedDocument { NSWorkspace.shared.activateFileViewerSelecting([model.homeURL.appendingPathComponent(saved.path)]) } }
                    Spacer(); Button("Back to conversation") { model.closePanel() }
                }
            }.padding(24)
        }
    }
    private func sourceSheet(_ c: Citation) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack { Text("Source \(c.id)").font(.title2.bold()); Spacer(); Button("Done") { model.selectedCitation = nil; model.textSession.restoreFocus() }.keyboardShortcut(.cancelAction) }
            Text(c.path).font(.headline).textSelection(.enabled)
            Text("Saved evidence excerpt").foregroundStyle(secondaryInk)
            ScrollView { Text(c.content ?? "This earlier development run retained the source hash and byte range, but not the excerpt text.").font(.custom("Inter-Regular", size: fontSize)).textSelection(.enabled).frame(maxWidth: .infinity, alignment: .leading) }.frame(minHeight: 120, maxHeight: 330)
            DisclosureGroup("Evidence details") { Text("Bytes \(c.start)..<\(c.start + c.length)\nSHA-256 \(c.hash)").font(.system(.caption, design: .monospaced)).textSelection(.enabled) }
            if let content = c.content { Button("Copy excerpt") { model.copyText(content) } }
        }.padding(24).frame(width: 530).background(canvas)
    }
    private var linkSheet: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Open this link?").font(.title2.bold())
            Text(model.pendingLink?.absoluteString ?? "").textSelection(.enabled).fixedSize(horizontal: false, vertical: true)
            Text("This opens your browser and may connect to the website. Sevra has not loaded a preview.").foregroundStyle(secondaryInk)
            HStack { Button("Cancel") { model.pendingLink = nil }.keyboardShortcut(.cancelAction); Spacer(); Button("Open in browser") { if let url = model.pendingLink { NSWorkspace.shared.open(url) }; model.pendingLink = nil }.buttonStyle(.borderedProminent) }
        }.padding(24).frame(width: 460).background(canvas)
    }
    private var rename: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Rename thread").font(.title2.bold())
            TextField("Thread title", text: $renameText).textFieldStyle(.roundedBorder).focused($renameFocused).onSubmit(saveRename)
            HStack { Button("Cancel") { model.closePanel() }; Button("Rename", action: saveRename).buttonStyle(.borderedProminent).disabled(renameText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) }
            Spacer()
        }.padding(.vertical, 24).readingColumn().onAppear { renameText = model.thread?.title ?? ""; renameFocused = false; DispatchQueue.main.async { renameFocused = true } }
    }
    private func saveRename() { let id = model.selectedID, title = renameText; model.perform { try await $0.rename(threadID: id, title: title); model.closePanel() } }
    private var knowledge: some View {
        ScrollView { VStack(alignment: .leading, spacing: 20) {
            Text("You decide what Sevra remembers.").font(.title2.bold())
            Text("Save messages you want Sevra to use again. Forget stops using a memory and its source in future replies; the conversation stays in your history.").foregroundStyle(secondaryInk)
            Text("The current local context uses the latest eligible memories, with their complete saved text.").font(.caption).foregroundStyle(secondaryInk)
            if model.snapshot?.home.memories.isEmpty != false { emptyState("No saved memories yet", detail: model.thread?.mode == .incognito ? "Incognito messages stay out of memory." : "Choose a message from a saved conversation to remember it.") }
            ForEach(model.snapshot?.home.memories ?? []) { m in
                VStack(alignment: .leading, spacing: 10) {
                    Text(m.text).font(.custom("Inter-Regular", size: fontSize)).textSelection(.enabled)
                    HStack {
                        Text(m.forgotten ? "No longer used" : m.scope == .threadOnly ? "Saved for this thread" : "Saved for shared memory").font(.caption).foregroundStyle(secondaryInk)
                        Spacer()
                        if !m.forgotten { Button("Correct") { editingMemory = m.id; memoryCorrection = m.text }; Button("Forget") { model.perform { try await $0.forget(memoryID: m.id) } } }
                    }
                    if editingMemory == m.id {
                        TextField("Corrected memory", text: $memoryCorrection, axis: .vertical).textFieldStyle(.roundedBorder)
                        if memoryCorrection.utf8.count > 2048 { Text("Shorten this memory before saving it.").font(.caption).foregroundStyle(secondaryInk) }
                        HStack { Button("Cancel") { editingMemory = nil }; Button("Save correction") { let text = memoryCorrection; model.perform { try await $0.correct(memoryID: m.id, text: text); editingMemory = nil } }.disabled(memoryCorrection.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || memoryCorrection.utf8.count > 2048) }
                    }
                }; Divider()
            }
            if let t = model.thread, t.mode != .incognito {
                let remembered = Set((model.snapshot?.home.memories ?? []).filter { !$0.forgotten }.map(\.messageID))
                let candidates = t.messages.filter { $0.role == "user" && !remembered.contains($0.id) }.suffix(5)
                if !candidates.isEmpty { Text(t.id == "home" ? "From Home" : "From this thread").font(.headline) }
                ForEach(candidates) { m in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(m.text).lineLimit(4).textSelection(.enabled)
                        Button("Remember this message") { model.perform { try await $0.remember(threadID: t.id, messageID: m.id, text: m.text, admitted: true) } }.disabled(m.text.utf8.count > 2048)
                        if m.text.utf8.count > 2048 { Text("This message is too long to save as a memory.").font(.caption).foregroundStyle(secondaryInk) }
                    }
                }
            }
        }.padding(.vertical, 24).readingColumn() }
    }
    private var journal: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("New entry").font(.headline)
            TextField("Write a journal entry", text: Binding(get: { model.journalComposer.text }, set: { model.journalComposer.edit($0) }), axis: .vertical).textFieldStyle(.roundedBorder).lineLimit(3...6).focused($journalFocused)
            draftIssue(model.journalComposer)
            HStack {
                Text(model.journalComposer.sending ? "Saving entry…" : model.journalComposer.saved ? "Draft saved in this Home." : "Saving draft…").font(.caption).foregroundStyle(secondaryInk)
                Spacer()
                Button("Save entry", action: model.saveJournal).buttonStyle(.borderedProminent).disabled(!model.journalComposer.canSend || model.journalComposer.text.utf8.count > 16384)
            }
            if model.journalComposer.text.utf8.count > 16384 { Text("Shorten this entry before saving. Your draft is preserved.").font(.caption).foregroundStyle(secondaryInk) }
            Divider()
            ScrollView { LazyVStack(alignment: .leading, spacing: 20) {
                if model.snapshot?.home.journal.isEmpty != false { emptyState("Your journal starts here", detail: "Keep notes and reflections you want to return to.") }
                ForEach(model.snapshot?.home.journal.reversed() ?? [].reversed()) { entry in VStack(alignment: .leading, spacing: 8) { Text(entry.date, style: .date).font(.caption).foregroundStyle(secondaryInk); Text(entry.text).font(.custom("Inter-Regular", size: fontSize)).textSelection(.enabled) }; Divider() }
            }.frame(maxWidth: .infinity, alignment: .leading) }
        }.padding(.vertical, 24).readingColumn().onAppear { journalFocused = false; DispatchQueue.main.async { journalFocused = true } }
    }
    private func reviewTitle(_ run: Run?) -> String {
        switch run.map(AppModel.reviewPanel) {
        case "App review": return "Review app"
        case "Skill review": return "Review skill"
        case "Changes": return "Review changes"
        default: return "Review document"
        }
    }
    private func reviewSummary(_ run: Run?) -> String {
        guard let run else { return "Review needed" }
        if let proposal = run.proposal { return proposal.filename }
        if let app = run.appProposal { return "App: " + app.name }
        if let skill = run.skillProposal { return "Skill: /" + skill.name }
        if let changes = run.changes, changes.state == .proposed { return "File changes: " + changes.summary }
        return run.status
    }
    private func emptyState(_ title: String, detail: String) -> some View {
        VStack(alignment: .leading, spacing: 8) { Text(title).font(.headline); Text(detail).foregroundStyle(secondaryInk).fixedSize(horizontal: false, vertical: true) }.padding(.vertical, 20).frame(maxWidth: .infinity, alignment: .leading)
    }
}
struct RailButton: ButtonStyle {
    var selected: Bool
    @Environment(\.controlActiveState) private var activeState
    @State private var hovered = false
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.font(.system(size: 13, weight: selected ? .medium : .regular))
            .frame(maxWidth: .infinity, minHeight: 28, alignment: .leading).padding(.horizontal, 12).padding(.vertical, 4)
            .background(Color.primary.opacity(configuration.isPressed ? 0.12 : selected ? (activeState == .inactive ? 0.055 : 0.09) : hovered ? 0.04 : 0))
            .clipShape(RoundedRectangle(cornerRadius: 6)).contentShape(Rectangle()).onHover { hovered = $0 }
    }
}
private extension View {
    /// Shared readable width and edge gutters for content, actions and composer.
    func readingColumn() -> some View {
        frame(maxWidth: 720, alignment: .leading).padding(.horizontal, 24).frame(maxWidth: .infinity)
    }
}
extension Notification.Name {
    static let sevraEscape = Notification.Name("SevraEscape")
    static let sevraJumpToLatest = Notification.Name("SevraJumpToLatest")
    static let sevraFind = Notification.Name("SevraFindDocument")
    static let sevraToggleSidebar = Notification.Name("SevraToggleSidebar")
}

struct PerformanceSettings: View {
    @ObservedObject var model: AppModel
    @ObservedObject var performance: PerformanceState
    @State private var limitGB = 10.0
    @State private var limitText = "10"
    @State private var limitError: String?
    @State private var showMemoryDetails = false
    @FocusState private var editingNumber: Bool
    private var status: PerformanceSnapshot? { performance.snapshot }
    private var maximum: Double { max(PerformancePolicy.minimumGB, status?.maximumGB ?? PerformancePolicy.minimumGB) }
    private func gb(_ value: Double) -> String { value.formatted(.number.precision(.fractionLength(0...1))) + " GB" }
    private func updateLimit() {
        let saved = model.performancePreferences.customGB
        limitGB = min(maximum, max(PerformancePolicy.minimumGB, saved))
        // A saved limit can exceed this Mac's range after moving preferences
        // to another device. Show that actual value and let the person fix it;
        // displaying a silently clamped number would conceal the refusal.
        limitText = saved.formatted(.number.precision(.fractionLength(0...1)))
        limitError = status != nil && model.performancePreferences.budget == .custom
            && (saved < PerformancePolicy.minimumGB || saved > maximum)
            ? "Choose between \(gb(PerformancePolicy.minimumGB)) and \(gb(maximum))." : nil
    }
    private func commitLimit() {
        let normalized = limitText.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: Locale.current.decimalSeparator ?? ".", with: ".")
        guard let value = Double(normalized), value.isFinite,
              value >= PerformancePolicy.minimumGB, value <= maximum else {
            limitError = "Choose between \(gb(PerformancePolicy.minimumGB)) and \(gb(maximum))."; return
        }
        limitGB = value; limitError = nil
        var next = model.performancePreferences; next.customGB = value; next.hasCustomLimit = true
        if next != model.performancePreferences { model.setPerformance(next) }
    }
    var body: some View {
        Section("Performance") {
            Picker("Memory budget", selection: Binding(get: { model.performancePreferences.budget }, set: { choice in
                let next = model.performancePreferences.selectingBudget(choice,
                    currentGB: status?.budgetGB ?? status?.recommendationGB, maximumGB: maximum)
                model.setPerformance(next)
            })) {
                Text("Automatic (Recommended)").tag(PerformancePreferences.Budget.automatic)
                Text("Custom limit").tag(PerformancePreferences.Budget.custom)
            }.disabled(status == nil || (status?.maximumGB ?? 0) < PerformancePolicy.minimumGB).help("Let Sevra adjust its memory budget, or set your own maximum")
            if model.performancePreferences.budget == .custom {
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 12) {
                        Slider(value: $limitGB, in: PerformancePolicy.minimumGB...maximum, step: 0.5,
                               onEditingChanged: { editing in
                            if !editing {
                                limitText = limitGB.formatted(.number.precision(.fractionLength(0...1)))
                                commitLimit()
                            }
                        }) { Text("Maximum memory") }
                            .accessibilityValue(gb(limitGB)).help("Set the maximum memory budget; Sevra can use less when needed")
                        TextField("Limit", text: $limitText).labelsHidden()
                            .textFieldStyle(.roundedBorder).frame(width: 64).multilineTextAlignment(.trailing)
                            .focused($editingNumber).onSubmit(commitLimit)
                            .accessibilityLabel("Memory limit in gigabytes").help("Enter a memory limit in GB; press Return to apply")
                        Text("GB").foregroundStyle(.secondary)
                    }
                    if let limitError { Text(limitError).foregroundStyle(.red).font(.callout) }
                    Text("Use up to this amount. Sevra gives memory back when other apps need it and can use more again when it is available. Your limit stays saved.")
                        .font(.callout).foregroundStyle(.secondary).fixedSize(horizontal: false, vertical: true)
                    Text("Supported on this Mac: up to \(gb(maximum)).")
                        .font(.callout).foregroundStyle(.secondary)
                }
                .disabled(status == nil || (status?.maximumGB ?? 0) < PerformancePolicy.minimumGB)
            } else {
                Text("Adjusts to your Mac and other apps, keeping room for everyday work.")
                    .font(.callout).foregroundStyle(.secondary)
            }
            if let recommendation = status?.recommendationGB {
                LabeledContent("Recommended now", value: "Up to " + gb(recommendation))
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel("Recommended now").accessibilityValue("Up to " + gb(recommendation))
            }
            if let budget = status?.budgetGB {
                LabeledContent("Budget available now", value: "Up to " + gb(budget)).monospacedDigit()
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel("Budget available now").accessibilityValue("Up to " + gb(budget))
            }
            if status?.pending == true {
                Label("Applies after the current response", systemImage: "clock")
                    .font(.callout).foregroundStyle(.secondary)
            }
            Picker("Keep model ready", selection: Binding(get: { model.performancePreferences.readiness }, set: { choice in
                var next = model.performancePreferences; next.readiness = choice; model.setPerformance(next)
            })) {
                Text("Automatic").tag(PerformancePreferences.Readiness.automatic)
                Text("While app is open").tag(PerformancePreferences.Readiness.keepReady)
            }.disabled(status == nil).help("Automatic keeps the model ready while you use Sevra and releases it after idle time in the background")
            Text(model.performancePreferences.readiness == .automatic
                 ? "Keeps the model ready while you use Sevra. In the background, releases it after about \(status?.idleMinutes ?? 10) idle minutes. Memory pressure, power saving and sleep can release it sooner."
                 : "Keeps the model ready after your first message for faster follow-ups. Memory pressure and sleep can still release it.")
                .font(.callout).foregroundStyle(.secondary).fixedSize(horizontal: false, vertical: true)
            if let status {
                LabeledContent("Model", value: status.state)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel("Model").accessibilityValue(status.state)
                Text(status.detail).font(.callout).foregroundStyle(.secondary)
                DisclosureGroup("Memory details", isExpanded: $showMemoryDetails) {
                    if let used = status.usedGB {
                        LabeledContent("App memory", value: gb(used)).monospacedDigit()
                            .accessibilityElement(children: .ignore)
                            .accessibilityLabel("App memory").accessibilityValue(gb(used))
                    }
                    Text("Releasing memory keeps your saved chats and personal memory. The next message reloads the model. A larger cache can improve speed; it doesn’t change the model’s knowledge.")
                        .font(.callout).foregroundStyle(.secondary).fixedSize(horizontal: false, vertical: true)
                }
                Button("Release memory now") { model.perform { runtime in
                    try await runtime.unload(); await runtime.maintainPerformance()
                } }.disabled(!status.loaded || status.busy || model.preparingModel).help(status.busy ? "Available after the current response finishes" : !status.loaded ? "The model is already unloaded" : "Unload the model; saved conversations and memories stay unchanged")
            }
        }
        .onAppear(perform: updateLimit)
        .onChange(of: model.performancePreferences.customGB) { _, _ in updateLimit() }
        .onChange(of: model.performancePreferences.budget) { _, _ in updateLimit() }
        .onChange(of: maximum) { _, _ in if !editingNumber { updateLimit() } }
        .onChange(of: editingNumber) { was, isEditing in if was && !isEditing { commitLimit() } }
    }
}
