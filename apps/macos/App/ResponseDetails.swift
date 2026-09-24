import AppKit
import SwiftUI
import SevraRuntime
import SevraPresentation

/// One popover at a time for a response's details. It closes when the person
/// clicks elsewhere or presses Escape, and returns focus where it was.
@MainActor final class ResponseDetailsPresenter: NSObject, NSPopoverDelegate {
    private var popover: NSPopover?
    private var anchors: [String: WeakView] = [:]
    private(set) var shownRunID: String?
    private weak var returnFocus: NSResponder?
    final class WeakView { weak var view: NSView?; init(_ view: NSView) { self.view = view } }
    func register(_ view: NSView, as key: String) { anchors[key] = WeakView(view) }
    func anchor(_ key: String) -> NSView? { anchors[key]?.view.flatMap { $0.window == nil ? nil : $0 } }
    /// The content on screen, for checks that render it.
    var contentView: NSView? { popover?.isShown == true ? popover?.contentViewController?.view : nil }
    func show(_ content: some View, runID: String, relativeTo rect: NSRect, of view: NSView) {
        popover?.delegate = nil; popover?.close()
        returnFocus = view.window?.firstResponder
        let host = NSHostingController(rootView: content)
        host.sizingOptions = [.preferredContentSize]
        let next = NSPopover()
        next.behavior = .transient
        next.animates = !NSWorkspace.shared.accessibilityDisplayShouldReduceMotion
        next.contentViewController = host
        next.delegate = self
        popover = next; shownRunID = runID
        next.show(relativeTo: rect, of: view, preferredEdge: .maxY)
    }
    func close() {
        // Do not leave owner-directed dismissal waiting for an AppKit
        // animation while the response content is still updating.
        popover?.animates = false
        popover?.close()
    }
    func popoverDidClose(_ notification: Notification) {
        guard (notification.object as? NSPopover) === popover else { return }
        popover = nil; shownRunID = nil
        if let returnFocus, let window = (returnFocus as? NSView)?.window { window.makeFirstResponder(returnFocus) }
        returnFocus = nil
    }
}

/// Places a popover anchor behind a SwiftUI view.
struct DetailsAnchor: NSViewRepresentable {
    let presenter: ResponseDetailsPresenter
    let key: String
    func makeNSView(context: Context) -> NSView { let view = NSView(); presenter.register(view, as: key); return view }
    func updateNSView(_ view: NSView, context: Context) { presenter.register(view, as: key) }
}

/// The last lines of a running thought, fading at the top once they
/// overflow, so a person can see what Sevra is working through without
/// opening anything. The full notes are one click away.
struct ThoughtPreview: View {
    let text: String
    var palette: Palette
    static let lines: CGFloat = 3
    @State private var overflow = false
    private var limit: CGFloat { ceil(NSLayoutManager().defaultLineHeight(for: NSFont.preferredFont(forTextStyle: .callout)) * Self.lines) }
    var body: some View {
        Text(ThinkingPolicy.preview(text))
            .font(.callout)
            .foregroundStyle(palette.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .fixedSize(horizontal: false, vertical: true)
            .background(GeometryReader { geometry in Color.clear.preference(key: PreviewHeight.self, value: geometry.size.height) })
            .onPreferenceChange(PreviewHeight.self) { height in
                let next = height > limit + 1
                if overflow != next { overflow = next }
            }
            .frame(maxHeight: limit, alignment: .bottom)
            .clipped()
            .mask {
                if overflow {
                    LinearGradient(stops: [.init(color: .black.opacity(0), location: 0), .init(color: .black, location: 0.45)], startPoint: .top, endPoint: .bottom)
                } else { Rectangle() }
            }
    }
    private struct PreviewHeight: PreferenceKey {
        static let defaultValue: CGFloat = 0
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) { value = max(value, nextValue()) }
    }
}

/// Everything recorded about one response: its thinking and working notes,
/// how fast it wrote and read, what it used and what it did.
struct ResponseDetailsView: View {
    @ObservedObject var model: AppModel
    let threadID: String
    let runID: String
    @Environment(\.colorScheme) private var scheme
    @Environment(\.colorSchemeContrast) private var contrast
    private var palette: Palette { Palette(scheme: scheme, contrast: contrast) }
    private var thread: WorkThread? { model.snapshot?.home.threads.first { $0.id == threadID } }
    private var run: Run? { thread?.allRuns.first { $0.id == runID } }
    private var live: ThinkingObservation? { model.snapshot?.thinking.flatMap { $0.runID == runID ? $0 : nil } }
    private var generation: GenerationObservation? { model.snapshot?.generation.flatMap { $0.runID == runID ? $0 : nil } }
    private var notes: [String] {
        var steps = model.snapshot?.thinkingTraces[runID] ?? []
        if let live, !live.text.isEmpty { steps.append(live.text) }
        return steps
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .firstTextBaseline) {
                Text("Response details").font(.headline)
                Spacer()
                if let run, let metrics = run.metrics {
                    Button("Copy") { model.copyText(ResponseMetricsFormat.report(metrics, thinking: run.thinking)) }
                        .controlSize(.small).help("Copy these numbers as text. Working notes and messages are not included.")
                        .accessibilityIdentifier("copy-response-details")
                }
            }
            if let run {
                if run.thinking != nil || live != nil || !notes.isEmpty { thinking(run) }
                speed(run)
                if let context = run.context { contextSection(context) }
                if !run.trace.isEmpty {
                    DisclosureGroup("Activity (\(run.trace.count))") {
                        ScrollView { VStack(alignment: .leading, spacing: 6) { ForEach(Array(run.trace.enumerated()), id: \.offset) { Text($0.element).font(.caption).textSelection(.enabled).frame(maxWidth: .infinity, alignment: .leading) } } }.frame(maxHeight: 120)
                    }.font(.callout)
                }
            } else {
                Text("This response is no longer in this Home.").foregroundStyle(palette.secondary)
            }
        }
        .padding(16).frame(width: 440, alignment: .leading)
        .accessibilityElement(children: .contain).accessibilityIdentifier("response-details")
    }
    private func heading(_ title: String) -> some View { Text(title).font(.subheadline.weight(.semibold)) }
    @ViewBuilder private func thinking(_ run: Run) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            heading("Thinking")
            if let live, live.active {
                // The run's own status: "Thinking… 0:42", or "Finishing the thought…" after Answer now.
                Text(run.status.hasPrefix("Thinking") || run.status.hasPrefix("Finishing") ? run.status : "Thinking… " + ThinkingPolicy.clock(live.seconds)).monospacedDigit()
            } else if let receipt = model.thoughtReceipt(for: run) {
                // Includes a finished thought whose answer is still arriving.
                Text(receipt.line).accessibilityIdentifier("thinking-receipt")
            }
            if let metrics = run.metrics, metrics.thoughtTokens > 0 {
                Text(ResponseMetricsFormat.tokens(metrics.thoughtTokens) + (metrics.thoughtRate.map { " at " + ResponseMetricsFormat.rate($0) + " tokens per second" } ?? ""))
                    .font(.callout).foregroundStyle(palette.secondary).monospacedDigit()
            }
            if notes.isEmpty {
                Text(live?.active == true ? "Working notes appear here as Sevra thinks." : "Working notes are kept only while Sevra is open, so these are no longer available.")
                    .font(.callout).foregroundStyle(palette.secondary).fixedSize(horizontal: false, vertical: true)
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(Array(notes.enumerated()), id: \.offset) { index, note in
                            VStack(alignment: .leading, spacing: 4) {
                                if notes.count > 1 { Text("Step \(index + 1)").font(.caption.weight(.semibold)).foregroundStyle(palette.secondary) }
                                Text(note).font(.callout).textSelection(.enabled).frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }.padding(10)
                }
                .defaultScrollAnchor(live?.active == true ? .bottom : .top)
                .frame(maxHeight: 220).background(palette.secondary.opacity(0.08), in: RoundedRectangle(cornerRadius: 6))
                .accessibilityLabel("Working notes").accessibilityIdentifier("working-notes")
                Text("Working notes are not saved or remembered. They stay only while Sevra is open.").font(.caption).foregroundStyle(palette.secondary).fixedSize(horizontal: false, vertical: true)
            }
        }
    }
    @ViewBuilder private func speed(_ run: Run) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            heading("Speed")
            if let m = run.metrics {
                Grid(alignment: .leading, horizontalSpacing: 14, verticalSpacing: 5) {
                    if let rate = m.answerRate { row("Writing", ResponseMetricsFormat.rate(rate) + " tokens per second") }
                    if m.answerTokens > 0 { row("Written", ResponseMetricsFormat.tokens(m.answerTokens) + " in " + ResponseMetricsFormat.seconds(m.answerSeconds)) }
                    if let first = m.firstTokenSeconds { row("First token", "after " + ResponseMetricsFormat.seconds(first)) }
                    if m.readTokens > 0 { row("Reading", ResponseMetricsFormat.tokens(m.readTokens) + " in " + ResponseMetricsFormat.seconds(m.readSeconds) + (m.readRate.map { ", " + ResponseMetricsFormat.rate($0) + " per second" } ?? "")) }
                    if m.cachedTokens > 0 { row("Reused", ResponseMetricsFormat.tokens(m.cachedTokens) + " from earlier in the conversation") }
                    if m.contextTokens > 0 { row("Context", ResponseMetricsFormat.count(m.contextTokens) + (m.windowTokens > 0 ? " of " + ResponseMetricsFormat.count(m.windowTokens) : "") + " tokens") }
                    if let load = m.loadSeconds { row("Model load", ResponseMetricsFormat.seconds(load) + ", before this response started") }
                    if m.rounds > 1 { row("Model rounds", "\(m.rounds), with tool results in between") }
                    if let hits = m.expertHitRate { row("Expert cache", "\(Int((hits * 100).rounded()))% already in memory while writing") }
                    if let budget = m.budgetGB { row("Memory budget", ResponseMetricsFormat.budgetText(budget, custom: m.customBudget == true, limitGB: m.memoryLimitGB)) }
                }
                if !(run.state.terminal || run.state == .needsYou) {
                    // A job with tools records each model round as it finishes.
                    Text("So far, from the model rounds that have finished. The totals are complete when the response finishes.")
                        .font(.callout).foregroundStyle(palette.secondary).fixedSize(horizontal: false, vertical: true)
                }
            } else if let g = generation, let rate = g.rate {
                Text(ResponseMetricsFormat.rate(rate) + " tokens per second so far" + (g.thinking ? " while thinking" : "")).monospacedDigit()
                Text("The full numbers appear when the response finishes.").font(.callout).foregroundStyle(palette.secondary)
            } else if run.state.terminal || run.state == .needsYou {
                Text("No numbers were recorded for this response.").font(.callout).foregroundStyle(palette.secondary)
            } else {
                Text("The numbers appear when the response finishes.").font(.callout).foregroundStyle(palette.secondary)
            }
        }
    }
    private func row(_ label: String, _ value: String) -> some View {
        GridRow {
            Text(label).foregroundStyle(palette.secondary).gridColumnAlignment(.leading)
            Text(value).monospacedDigit().textSelection(.enabled).fixedSize(horizontal: false, vertical: true)
        }.font(.callout)
    }
    /// "12 messages and 3 saved memories", or "1 message, no saved memories".
    static func contextSummary(_ context: ContextReceipt) -> String {
        let messages = "\(context.messageIDs.count) \(context.messageIDs.count == 1 ? "message" : "messages")"
        switch context.memoryIDs.count {
        case 0: return messages + ", no saved memories"
        case 1: return messages + " and 1 saved memory"
        case let n: return messages + " and \(n) saved memories"
        }
    }
    private func contextSection(_ context: ContextReceipt) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            heading("Context")
            HStack(alignment: .firstTextBaseline) {
                Text(Self.contextSummary(context)).font(.callout)
                Spacer()
                Button("Inspect") { model.inspectContext(threadID: threadID, runID: runID) }.controlSize(.small)
                    .help("See the history and memories this response started from")
            }
        }
    }
}
