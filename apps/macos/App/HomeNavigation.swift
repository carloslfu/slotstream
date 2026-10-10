import AppKit
import SwiftUI
import SevraRuntime

/// Device-local navigation, separate from the contents and authority of a Home.
@MainActor final class HomeNavigation: ObservableObject {
    @Published private(set) var current: URL
    @Published private(set) var recent: [URL]
    @Published private(set) var switching = false
    @Published var showing = false
    @Published var error: String?
    let initialIntent: HomeOpenIntent
    private let defaults: UserDefaults
    private let remembersSelection: Bool
    weak var model: AppModel?
    var didOpen: ((AppModel) -> Void)?
    /// Native checks replace inference only; storage and switching stay real.
    var makeRuntime: ((URL) async throws -> SevraRuntime)?

    init(defaults: UserDefaults = .standard, environment: [String: String] = ProcessInfo.processInfo.environment) {
        self.defaults = defaults
        if let explicit = environment["SEVRA_HOME"] {
            current = URL(fileURLWithPath: explicit, isDirectory: true).standardizedFileURL
            initialIntent = .initial
            remembersSelection = false
        } else if let saved = defaults.string(forKey: "homes.selected.v1") {
            current = URL(fileURLWithPath: saved, isDirectory: true).standardizedFileURL
            initialIntent = .existing
            remembersSelection = true
        } else {
            current = HomeLocation.defaultURL
            initialIntent = .initial
            remembersSelection = true
        }
        recent = (defaults.stringArray(forKey: "homes.recent.v1") ?? []).map { URL(fileURLWithPath: $0, isDirectory: true).standardizedFileURL }
    }

    func opened(_ url: URL) {
        current = URL(fileURLWithPath: url.path, isDirectory: true).standardizedFileURL
        // Explicit development Homes do not change the person's startup Home.
        recent = [current] + recent.filter { $0.path != current.path }
        recent = Array(recent.prefix(12))
        guard remembersSelection else { return }
        defaults.set(url.path, forKey: "homes.selected.v1")
        defaults.set(recent.map(\.path), forKey: "homes.recent.v1")
    }

    func forget(_ url: URL) {
        guard url.path != current.path else { return }
        recent.removeAll { $0.path == url.path }
        defaults.set(recent.map(\.path), forKey: "homes.recent.v1")
    }

    func chooseNew() {
        guard !switching else { return }
        showing = false
        let picker = NSSavePanel()
        picker.title = "New Home"
        picker.message = "Choose a name and location. This Home will have its own conversations, memory, apps and skills."
        picker.nameFieldStringValue = "New Home"
        picker.directoryURL = current.deletingLastPathComponent()
        picker.canCreateDirectories = true
        picker.prompt = "Create Home"
        guard picker.runModal() == .OK, let url = picker.url else { return }
        request(url, intent: .new)
    }

    func chooseExisting() {
        guard !switching else { return }
        showing = false
        let picker = NSOpenPanel()
        picker.title = "Open Home"
        picker.message = "Choose a Sevra Home folder. Its conversations and memory stay separate from your other Homes."
        picker.canChooseFiles = false; picker.canChooseDirectories = true; picker.allowsMultipleSelection = false
        picker.directoryURL = current.deletingLastPathComponent(); picker.prompt = "Open Home"
        guard picker.runModal() == .OK, let url = picker.url else { return }
        request(url, intent: .existing)
    }

    func request(_ url: URL, intent: HomeOpenIntent = .existing) {
        Task { _ = await switchHome(to: url, intent: intent) }
    }

    @discardableResult func switchHome(to requested: URL, intent: HomeOpenIntent = .existing,
                                      confirm: (() -> Bool)? = nil) async -> Bool {
        guard !switching, let previous = model else { return false }
        if requested.standardizedFileURL.path == current.path, previous.runtime != nil { showing = false; return true }
        switching = true; error = nil
        defer { switching = false }
        do {
            let url = try HomeLocation.validate(requested, intent: intent)
            guard !previous.openingHome, !previous.preparingModel, !previous.transferringHome, !previous.applyingChanges,
                  !previous.approving, !previous.attaching, !previous.preparingForSleep else {
                throw SevraError.refused("Finish the current setup, transfer or file operation before switching Homes.")
            }
            let state = await previous.runtime?.snapshot()
            let working = state?.home.threads.contains { $0.run?.state.terminal == false && $0.run?.state != .needsYou } == true
            let privateThreads = state?.home.threads.contains { $0.mode == .incognito } == true
            if working || privateThreads {
                let accepted: Bool
                if let confirm { accepted = confirm() }
                else {
                    let alert = NSAlert()
                    alert.messageText = "Switch to \(url.lastPathComponent)?"
                    alert.informativeText = [working ? "Running and queued work will stop." : nil,
                        privateThreads ? "Incognito conversations will close and will not be saved." : nil,
                        "Saved conversations and drafts stay in this Home."].compactMap { $0 }.joined(separator: " ")
                    alert.addButton(withTitle: "Switch Home"); alert.addButton(withTitle: "Stay Here")
                    accepted = alert.runModal() == .alertFirstButtonReturn
                }
                guard accepted else { return false }
            }
            // A failed or conflicting draft save leaves the current session intact.
            guard await previous.prepareHomeSwitch() else {
                throw SevraError.refused("Your draft could not be saved. Resolve the draft message before switching Homes.")
            }
            // Reserve and verify the destination before closing the current owner.
            // Constructing an inference adapter neither loads nor runs a model.
            let nextRuntime: SevraRuntime
            if let makeRuntime { nextRuntime = try await makeRuntime(url) }
            else { nextRuntime = try await previous.makeHomeRuntime(at: url) }
            previous.closePreview(); previous.closeApp()
            guard await previous.quit() else {
                try? await nextRuntime.shutdown()
                throw SevraError.refused(previous.error ?? "This Home could not finish saving. It is still open.")
            }
            previous.releaseHomeSession()
            let next = AppModel(homeURL: url, homes: self)
            next.runtime = nextRuntime
            model = next
            opened(url); showing = false
            didOpen?(next)
            return true
        } catch {
            self.error = error.localizedDescription
            previous.error = error.localizedDescription
            showing = true
            return false
        }
    }
}

struct HomeSwitcher: View {
    @ObservedObject var homes: HomeNavigation
    var body: some View {
        Button { homes.showing.toggle() } label: {
            HStack(spacing: 9) {
                Image(systemName: "house").accessibilityHidden(true)
                VStack(alignment: .leading, spacing: 2) {
                    Text("Current Home").font(.caption).foregroundStyle(.secondary)
                    Text(homes.current.lastPathComponent).font(.body.weight(.medium)).lineLimit(1)
                }
                Spacer(minLength: 4)
                if homes.switching { ProgressView().controlSize(.small) }
                else { Image(systemName: "chevron.up.chevron.down").font(.caption).accessibilityHidden(true) }
            }.padding(.horizontal, 11).padding(.vertical, 9).contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .background(Color.primary.opacity(0.055), in: RoundedRectangle(cornerRadius: 8))
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.primary.opacity(0.09), lineWidth: 1))
        .help("Switch Home · " + homes.current.path)
        .accessibilityLabel("Switch Home, current Home: " + homes.current.lastPathComponent)
        .accessibilityIdentifier("home-switcher")
        .popover(isPresented: $homes.showing, arrowEdge: .trailing) { HomeChooser(homes: homes) }
    }
}

struct HomeChooser: View {
    @ObservedObject var homes: HomeNavigation
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Homes").font(.headline)
            Text("Separate conversations, memory, apps and skills.").font(.callout).foregroundStyle(.secondary)
            if let error = homes.error { Text(error).font(.callout).foregroundStyle(.red).textSelection(.enabled).accessibilityLabel("Home could not be opened: " + error) }
            ScrollView {
                VStack(spacing: 3) {
                    ForEach([homes.current] + homes.recent.filter { $0.path != homes.current.path }, id: \.path) { url in
                        Button { homes.request(url) } label: {
                            HStack(spacing: 10) {
                                Image(systemName: url.path == homes.current.path ? "checkmark" : "folder").frame(width: 16)
                                VStack(alignment: .leading, spacing: 3) {
                                    Text(url.lastPathComponent).fontWeight(url.path == homes.current.path ? .semibold : .regular)
                                    Text(url.path).font(.caption).foregroundStyle(.secondary).lineLimit(2).truncationMode(.middle)
                                }.frame(maxWidth: .infinity, alignment: .leading)
                            }.padding(8).contentShape(Rectangle())
                        }.buttonStyle(.plain).help(url.path)
                            .contextMenu { if url.path != homes.current.path { Button("Remove from Recent Homes") { homes.forget(url) } } }
                    }
                }
            }.frame(height: min(260, CGFloat(1 + homes.recent.filter { $0.path != homes.current.path }.count) * 68))
            Divider()
            Button("New Home…", action: homes.chooseNew).accessibilityIdentifier("new-home")
            Button("Open Home…", action: homes.chooseExisting).accessibilityIdentifier("open-home")
            Button("Show Current Home in Finder") { NSWorkspace.shared.open(homes.current) }
        }.padding(18).frame(width: 340).background(Color(nsColor: .windowBackgroundColor)).disabled(homes.switching)
    }
}

extension Notification.Name { static let sevraShowHomes = Notification.Name("sevra.showHomes") }
