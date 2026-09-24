import AppKit
import SwiftUI
import SevraRuntime

/// Colors shared with the main view, derived the same way.
struct Palette {
    var scheme: ColorScheme
    var contrast: ColorSchemeContrast
    var secondary: Color { contrast == .increased ? .primary : scheme == .dark ? Color(red: 184/255, green: 182/255, blue: 170/255) : Color(red: 99/255, green: 97/255, blue: 91/255) }
    var boundary: Color { contrast == .increased ? .primary : scheme == .dark ? Color(red: 133/255, green: 130/255, blue: 119/255) : Color(red: 133/255, green: 130/255, blue: 121/255) }
    var elevated: Color { scheme == .dark ? Color(red: 37/255, green: 37/255, blue: 34/255) : .white }
    var added: Color { Color.green.opacity(contrast == .increased ? 0.28 : scheme == .dark ? 0.2 : 0.13) }
    var removed: Color { Color.red.opacity(contrast == .increased ? 0.28 : scheme == .dark ? 0.2 : 0.11) }
    var attention: Color { Color.orange.opacity(0.1) }
}

/// Wraps chips onto as many lines as they need.
struct FlowLayout: Layout {
    var spacing: CGFloat = 6
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let width = proposal.width ?? .infinity
        var x: CGFloat = 0, y: CGFloat = 0, row: CGFloat = 0, widest: CGFloat = 0
        for view in subviews {
            let size = view.sizeThatFits(.unspecified)
            if x > 0 && x + size.width > width { y += row + spacing; x = 0; row = 0 }
            x += size.width + spacing
            row = max(row, size.height)
            widest = max(widest, x - spacing)
        }
        return CGSize(width: proposal.width ?? widest, height: y + row)
    }
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var x = bounds.minX, y = bounds.minY, row: CGFloat = 0
        for view in subviews {
            let size = view.sizeThatFits(.unspecified)
            if x > bounds.minX && x + size.width > bounds.maxX { y += row + spacing; x = bounds.minX; row = 0 }
            view.place(at: CGPoint(x: x, y: y), proposal: ProposedViewSize(size))
            x += size.width + spacing
            row = max(row, size.height)
        }
    }
}

// MARK: attachments

struct AttachmentBar: View {
    @ObservedObject var model: AppModel
    var palette: Palette
    var body: some View {
        FlowLayout(spacing: 6) {
            ForEach(model.attachments) { chip($0) }
        }.frame(maxWidth: .infinity, alignment: .leading).accessibilityElement(children: .contain).accessibilityLabel("Attached sources")
    }

    private func detail(_ item: AttachmentInfo) -> String {
        switch item.kind {
        case .knowledge: return "db.md knowledge base"
        case .file: return "One file"
        case .folder:
            guard let count = item.files else { return "Live folder · browsed when needed" }
            let files = count == 1 ? "1 file" : "\(count) files"
            return item.skipped > 0 ? files + " · \(item.skipped) skipped (links, dependencies or unreadable)" : files
        }
    }

    private func chip(_ item: AttachmentInfo) -> some View {
        let incognito = model.thread?.mode == .incognito
        return HStack(spacing: 6) {
            Image(systemName: item.kind == .knowledge ? "books.vertical" : item.kind == .folder ? "folder" : "doc").accessibilityHidden(true)
            Text(item.name).lineLimit(1).truncationMode(.middle).frame(maxWidth: 200, alignment: .leading)
            Menu {
                Picker("Access", selection: Binding(get: { item.access }, set: { model.setAccess(item, to: $0) })) {
                    Text("Read only").tag(AttachmentAccess.read)
                    Text(item.kind == .knowledge ? "Can propose record changes" : "Can propose changes").tag(AttachmentAccess.change)
                }.pickerStyle(.inline).disabled(incognito)
                Divider()
                Text(detail(item))
                if incognito { Text("Incognito threads read files but never change them.") }
                else { Text("Every change waits for your review before anything is written.") }
                Divider()
                Button("Show in Finder") { NSWorkspace.shared.activateFileViewerSelecting([URL(fileURLWithPath: item.path)]) }
                Button("Remove from This Thread") { model.detach(item) }
            } label: {
                Text(item.access == .change ? "Can change" : "Read only").foregroundStyle(item.access == .change ? Color.accentColor : palette.secondary)
            }.menuStyle(.borderlessButton).fixedSize().disabled(model.working)
                .help("Choose whether Sevra may propose changes to \(item.name)")
            NativeIconButton(symbol: "xmark", title: "Remove \(item.name)", help: "Remove from this thread. The original stays unchanged.", action: { model.detach(item) })
                .frame(width: 16, height: 16).disabled(model.working)
        }
        .font(.callout)
        .padding(.leading, 8).padding(.trailing, 4).padding(.vertical, 3)
        .background(Color.primary.opacity(0.05), in: Capsule())
        .help(item.path + "\n" + detail(item))
        .accessibilityElement(children: .contain)
        .accessibilityLabel(item.name + ", " + detail(item) + ", " + (item.access == .change ? "can propose changes" : "read only"))
    }
}

// MARK: changes

struct DiffView: View {
    var lines: [DiffLine]
    var truncated: Bool
    var palette: Palette
    private func number(_ value: Int?) -> String { value.map(String.init) ?? "" }
    var body: some View {
        // Lazy: a long preview lays out only the lines on screen.
        LazyVStack(alignment: .leading, spacing: 0) {
            ForEach(Array(lines.enumerated()), id: \.offset) { _, line in
                if line.kind == .gap {
                    Text("⋯").foregroundStyle(palette.secondary).padding(.leading, 90).padding(.vertical, 2).accessibilityLabel("Unchanged lines omitted")
                } else {
                    HStack(alignment: .firstTextBaseline, spacing: 8) {
                        Text(number(line.oldLine)).frame(width: 34, alignment: .trailing).foregroundStyle(palette.secondary)
                        Text(number(line.newLine)).frame(width: 34, alignment: .trailing).foregroundStyle(palette.secondary)
                        Text(line.kind == .added ? "+" : line.kind == .removed ? "−" : " ").frame(width: 10)
                        Text(line.text.isEmpty ? " " : line.text).frame(maxWidth: .infinity, alignment: .leading).fixedSize(horizontal: false, vertical: true)
                    }
                    .font(.system(size: 12, design: .monospaced))
                    .padding(.vertical, 1).padding(.trailing, 8)
                    .background(line.kind == .added ? palette.added : line.kind == .removed ? palette.removed : .clear)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel((line.kind == .added ? "Added line \(number(line.newLine))" : line.kind == .removed ? "Removed line \(number(line.oldLine))" : "Line \(number(line.newLine))") + ": " + line.text)
                }
            }
            if truncated {
                Text("The preview is shortened. Use Show complete text to read everything that will be written.").font(.caption).foregroundStyle(palette.secondary).padding(8)
            }
        }.textSelection(.enabled)
    }
}

struct ChangesPanel: View {
    @ObservedObject var model: AppModel
    var palette: Palette
    @State private var fullText: FileChange?

    var body: some View {
        if let set = model.reviewedChanges {
            VStack(spacing: 0) {
                header(set)
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(set.changes) { change in card(change, in: set) }
                    }.padding(24)
                }
                Divider()
                footer(set).padding(16)
            }
            .sheet(item: $fullText) { change in
                VStack(alignment: .leading, spacing: 12) {
                    HStack { Text(change.display).font(.headline).textSelection(.enabled); Spacer(); Button("Done") { fullText = nil }.keyboardShortcut(.cancelAction) }
                    Text("The complete text Sevra will write.").font(.callout).foregroundStyle(palette.secondary)
                    ScrollView { Text(change.content).font(.system(size: 12, design: .monospaced)).textSelection(.enabled).frame(maxWidth: .infinity, alignment: .leading) }
                    Button("Copy") { model.copyText(change.content) }
                }.padding(24).frame(width: 640, height: 520)
            }
        } else {
            VStack(alignment: .leading, spacing: 8) {
                Text("No changes to review").font(.headline)
                Text("When Sevra proposes file changes, they appear here before anything is written.").foregroundStyle(palette.secondary)
            }.padding(24).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }

    private func title(_ set: ChangeSet) -> String {
        switch set.state {
        case .proposed: return "Review changes"
        case .applying: return "Writing changes…"
        case .applied: return "Changes written"
        case .partial: return "Some changes were written"
        case .undone: return "Changes undone"
        case .rejected: return "Changes not written"
        }
    }

    private func header(_ set: ChangeSet) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title(set)).font(.title2.bold())
            let places = set.roots.values.map(\.name).sorted().joined(separator: ", ")
            Text(set.summary + (places.isEmpty ? "" : " in " + places)).foregroundStyle(palette.secondary)
            if set.state == .proposed {
                Text("Nothing has been written yet. Sevra checks that each file is unchanged since it was read, keeps the previous version, and replaces files in one step.")
                    .font(.callout).foregroundStyle(palette.secondary).fixedSize(horizontal: false, vertical: true)
            }
            if let note = set.note {
                Label(note, systemImage: "exclamationmark.triangle").font(.callout).padding(10)
                    .frame(maxWidth: .infinity, alignment: .leading).background(palette.attention, in: RoundedRectangle(cornerRadius: 8))
            }
        }.padding(.horizontal, 24).padding(.top, 20).padding(.bottom, 8).frame(maxWidth: .infinity, alignment: .leading)
    }

    private func status(_ change: FileChange) -> String? {
        switch change.status {
        case .pending: return nil
        case .applied: return "Written"
        case .undone: return change.trashedPath == nil ? "Restored" : "Moved to Trash"
        case .conflict: return "Not written"
        case .skipped: return "Skipped"
        }
    }

    private func card(_ change: FileChange, in set: ChangeSet) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .firstTextBaseline, spacing: 8) {
                Image(systemName: change.isCreation ? "doc.badge.plus" : "pencil").foregroundStyle(palette.secondary).accessibilityHidden(true)
                Text(change.display).font(.system(size: 13, weight: .semibold, design: .monospaced)).lineLimit(2).truncationMode(.middle).textSelection(.enabled)
                Spacer(minLength: 8)
                if change.added > 0 { Text("+\(change.added)").foregroundStyle(.green).monospacedDigit() }
                if change.removed > 0 { Text("−\(change.removed)").foregroundStyle(.red).monospacedDigit() }
                if let status = status(change) { Text(status).font(.caption.weight(.medium)).padding(.horizontal, 6).padding(.vertical, 2).background(Color.primary.opacity(0.07), in: Capsule()) }
            }.font(.callout)
            if let type = change.recordType {
                Text("New db.md record · type \(type) · \(change.recordSummary ?? "")").font(.caption).foregroundStyle(palette.secondary)
            }
            if change.preview.isEmpty {
                Text(change.isCreation ? "An empty file." : "No preview is available for this change.").font(.caption).foregroundStyle(palette.secondary)
            } else {
                DiffView(lines: change.preview, truncated: change.previewTruncated, palette: palette)
                    .padding(.vertical, 6)
                    .background(palette.elevated, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(palette.boundary.opacity(0.4), lineWidth: 1))
            }
            if set.state == .proposed && !change.content.isEmpty {
                Button("Show complete text") { fullText = change }.controlSize(.small)
            }
            if let trashed = change.trashedPath {
                Button("Show in Trash") { NSWorkspace.shared.activateFileViewerSelecting([URL(fileURLWithPath: trashed)]) }.controlSize(.small)
            }
        }
    }

    @ViewBuilder private func footer(_ set: ChangeSet) -> some View {
        HStack {
            switch set.state {
            case .proposed:
                Button("Discard") { model.discardChanges(set) }.help("Write nothing and close this review")
                Spacer()
                if model.attachments.isEmpty {
                    Text("Attach the folder again to write these changes.").font(.callout).foregroundStyle(palette.secondary)
                }
                Button(model.applyingChanges ? "Writing…" : set.changes.count == 1 ? "Write 1 File" : "Write \(set.changes.count) Files") { model.approveChanges(set) }
                    .buttonStyle(.borderedProminent).disabled(model.applyingChanges || model.aiPaused || model.working)
                    .accessibilityIdentifier("approve-changes").help("Write exactly the changes shown")
            case .applied, .partial:
                Button(model.applyingChanges ? "Undoing…" : "Undo Changes") { model.undoChanges(set) }.disabled(model.applyingChanges)
                    .help("Put back the previous versions and move new files to the Trash")
                Spacer()
                Button("Back to Conversation") { model.closePanel() }
            default:
                Spacer()
                Button("Back to Conversation") { model.closePanel() }
            }
        }
    }
}

// MARK: apps and skills

private func accessLines(_ collections: [AppCollection]) -> [String] {
    collections.map { $0.name + ($0.access == .write ? " · read and change" : " · read only") }
}

struct AppReviewPanel: View {
    @ObservedObject var model: AppModel
    var palette: Palette
    @State private var showSource = false

    var body: some View {
        if let proposal = model.thread?.run?.appProposal {
            let existing = proposal.appID.flatMap { id in model.apps.first { $0.id == id } }
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(proposal.name).font(.title2.bold())
                    Text(existing.map { "Update to \($0.name) · becomes version \(($0.latest?.number ?? 0) + 1)" } ?? "New app").foregroundStyle(palette.secondary)
                    if !proposal.description.isEmpty { Text(proposal.description) }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Data it can use").font(.headline)
                        if proposal.collections.isEmpty { Text("None. It keeps nothing after it closes.").foregroundStyle(palette.secondary) }
                        ForEach(proposal.collections, id: \.name) { collection in
                            let saved = model.appReviewCounts[collection.name] ?? 0
                            Text(accessLines([collection])[0] + (saved > 0 ? " · already holds \(saved) saved \(saved == 1 ? "record" : "records")" : ""))
                        }
                        Text("It runs offline in its own view and cannot reach the internet or your files. Apps that use the same collection share its records.")
                            .font(.callout).foregroundStyle(palette.secondary).fixedSize(horizontal: false, vertical: true)
                    }
                    ForEach(proposal.notes, id: \.self) { note in
                        Label(note, systemImage: "exclamationmark.triangle").font(.callout).padding(8)
                            .frame(maxWidth: .infinity, alignment: .leading).background(palette.attention, in: RoundedRectangle(cornerRadius: 8))
                    }
                    Picker("View", selection: $showSource) { Text("Try it").tag(false); Text("Source").tag(true) }
                        .pickerStyle(.segmented).labelsHidden().fixedSize()
                }.padding(.horizontal, 24).padding(.top, 20).padding(.bottom, 12)
                Group {
                    if showSource {
                        ScrollView { Text(proposal.html).font(.system(size: 12, design: .monospaced)).textSelection(.enabled).frame(maxWidth: .infinity, alignment: .leading).padding(12) }
                    } else if let preview = model.appPreview {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Preview with scratch data. Nothing here is saved.").font(.caption).foregroundStyle(palette.secondary).padding(8)
                            MiniAppView(controller: preview)
                        }
                    } else {
                        ProgressView("Preparing preview…").frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(palette.elevated)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(palette.boundary.opacity(0.5), lineWidth: 1))
                .padding(.horizontal, 24)
                HStack {
                    Button("Discard") { model.discardApp(proposal) }.help("Publish nothing")
                    Spacer()
                    Button("Copy Source") { model.copyText(proposal.html) }
                    Button(model.approving ? "Turning On…" : "Turn On App") { model.approveApp(proposal) }
                        .buttonStyle(.borderedProminent).disabled(model.approving || model.aiPaused)
                        .accessibilityIdentifier("approve-app").help("Save this version and let it use the data listed above")
                }.padding(16)
            }
        } else {
            VStack(alignment: .leading, spacing: 8) {
                Text("No app to review").font(.headline)
                Text("Ask Sevra to build a mini-app, or type /app in the composer.").foregroundStyle(palette.secondary)
            }.padding(24).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

struct SkillReviewPanel: View {
    @ObservedObject var model: AppModel
    var palette: Palette
    var body: some View {
        if let proposal = model.thread?.run?.skillProposal {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("/" + proposal.name).font(.title2.bold().monospaced())
                    Text(proposal.skillID == nil ? "New skill" : "Update to an existing skill").foregroundStyle(palette.secondary)
                    Text(proposal.description)
                    Text(proposal.tools.isEmpty ? "Uses no tools." : "Expects: " + proposal.tools.map(\.rawValue).joined(separator: ", ") + ".")
                        .font(.callout).foregroundStyle(palette.secondary)
                    Text("A skill adds instructions to a request. It never grants access by itself; attachments and reviews still decide what Sevra can read and change.")
                        .font(.callout).foregroundStyle(palette.secondary).fixedSize(horizontal: false, vertical: true)
                }.padding(.horizontal, 24).padding(.top, 20).padding(.bottom, 12)
                ScrollView {
                    Text(proposal.instructions).font(.system(size: 13, design: .monospaced)).textSelection(.enabled)
                        .frame(maxWidth: .infinity, alignment: .leading).padding(12)
                }
                .background(palette.elevated).clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(palette.boundary.opacity(0.5), lineWidth: 1))
                .padding(.horizontal, 24)
                HStack {
                    Button("Discard") { model.discardSkill(proposal) }
                    Spacer()
                    Button(model.approving ? "Turning On…" : "Turn On Skill") { model.approveSkill(proposal) }
                        .buttonStyle(.borderedProminent).disabled(model.approving || model.aiPaused).accessibilityIdentifier("approve-skill")
                }.padding(16)
            }
        } else {
            VStack(alignment: .leading, spacing: 8) {
                Text("No skill to review").font(.headline)
                Text("Ask Sevra to save a workflow as a skill, or type /skill in the composer.").foregroundStyle(palette.secondary)
            }.padding(24).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

struct AppsPanel: View {
    @ObservedObject var model: AppModel
    var palette: Palette

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                Text("Apps & Skills").font(.title2.bold())
                Text("Ask Sevra for a small app or a repeatable workflow. You review every version before it runs. Apps work offline and see only the data you allow.")
                    .foregroundStyle(palette.secondary).fixedSize(horizontal: false, vertical: true)
                HStack {
                    Button { model.useSkill("app") } label: { Label("Build an App", systemImage: "square.grid.2x2") }
                    Button { model.useSkill("skill") } label: { Label("Save a Skill", systemImage: "sparkles") }
                }.disabled(model.thread?.mode == .incognito)

                Text("Apps").font(.headline).padding(.top, 8)
                let apps = model.apps.filter { !$0.removed }
                if apps.isEmpty { Text("No apps yet. Try “/app a tracker for my reading list”.").foregroundStyle(palette.secondary) }
                ForEach(apps) { app in appRow(app); Divider() }
                let removedApps = model.apps.filter(\.removed)
                if !removedApps.isEmpty {
                    DisclosureGroup("Removed apps (\(removedApps.count))") {
                        ForEach(removedApps) { app in
                            HStack { Text(app.name); Spacer(); Button("Restore") { model.restoreApp(app) } }.padding(.vertical, 4)
                        }
                    }
                }

                Text("Skills").font(.headline).padding(.top, 8)
                ForEach(Extensions.builtIns, id: \.name) { skill in
                    HStack(alignment: .firstTextBaseline) {
                        Text("/" + skill.name).font(.body.monospaced())
                        Text(skill.description).foregroundStyle(palette.secondary)
                        Spacer()
                        Text("Built in").font(.caption).foregroundStyle(palette.secondary)
                    }
                }
                let skills = model.skills.filter { !$0.removed }
                ForEach(skills) { skill in skillRow(skill); Divider() }
                let removedSkills = model.skills.filter(\.removed)
                if !removedSkills.isEmpty {
                    DisclosureGroup("Removed skills (\(removedSkills.count))") {
                        ForEach(removedSkills) { skill in
                            HStack { Text("/" + skill.name).monospaced(); Spacer(); Button("Restore") { model.setSkill(skill, active: skill.latest?.number) } }.padding(.vertical, 4)
                        }
                    }
                }
            }.padding(.vertical, 24).frame(maxWidth: 720, alignment: .leading).padding(.horizontal, 24).frame(maxWidth: .infinity)
        }
        .sheet(isPresented: Binding(get: { model.skillPreview != nil }, set: { if !$0 { model.skillPreview = nil } })) {
            VStack(alignment: .leading, spacing: 12) {
                HStack { Text(model.skillPreview?.name ?? "").font(.headline); Spacer(); Button("Done") { model.skillPreview = nil }.keyboardShortcut(.cancelAction) }
                ScrollView { Text(model.skillPreview?.text ?? "").font(.system(size: 12, design: .monospaced)).textSelection(.enabled).frame(maxWidth: .infinity, alignment: .leading) }
            }.padding(24).frame(width: 600, height: 480)
        }
    }

    private func versionTitle(_ number: Int, _ date: Date) -> String { "Version \(number) · " + date.formatted(date: .abbreviated, time: .shortened) }

    private func appRow(_ app: MiniApp) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(alignment: .firstTextBaseline) {
                Text(app.name).font(.body.weight(.semibold))
                Text(app.active.map { "Version \($0) · On" } ?? "Off").font(.caption).foregroundStyle(palette.secondary)
                Spacer()
                if app.active != nil { Button("Open") { model.openApp(app.id) }.buttonStyle(.borderedProminent).accessibilityLabel("Open \(app.name)") }
                Menu {
                    ForEach(app.versions.reversed()) { version in
                        Toggle(versionTitle(version.number, version.created), isOn: Binding(get: { app.active == version.number }, set: { if $0 { model.setApp(app, active: version.number) } }))
                    }
                    Divider()
                    if app.active != nil { Button("Turn Off") { model.setApp(app, active: nil) } }
                    Button("Remove…") { model.removeApp(app) }
                } label: { Image(systemName: "ellipsis.circle") }.menuStyle(.borderlessButton).fixedSize().help("Versions and settings for \(app.name)")
            }
            if !app.description.isEmpty { Text(app.description).foregroundStyle(palette.secondary) }
            let access = accessLines(app.activeVersion?.collections ?? app.latest?.collections ?? [])
            if !access.isEmpty { Text("Data: " + access.joined(separator: ", ")).font(.caption).foregroundStyle(palette.secondary) }
        }.padding(.vertical, 4)
    }

    private func skillRow(_ skill: Skill) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(alignment: .firstTextBaseline) {
                Text("/" + skill.name).font(.body.monospaced().weight(.semibold))
                Text(skill.active.map { "Version \($0) · On" } ?? "Off").font(.caption).foregroundStyle(palette.secondary)
                Spacer()
                Toggle("On", isOn: Binding(get: { skill.active != nil }, set: { model.setSkill(skill, active: $0 ? skill.latest?.number : nil) }))
                    .toggleStyle(.switch).labelsHidden().accessibilityLabel("Use /\(skill.name)")
                Menu {
                    Button("View Instructions") { model.viewSkill(skill) }
                    ForEach(skill.versions.reversed()) { version in
                        Toggle(versionTitle(version.number, version.created), isOn: Binding(get: { skill.active == version.number }, set: { if $0 { model.setSkill(skill, active: version.number) } }))
                    }
                    Divider()
                    Button("Remove…") { model.removeSkill(skill) }
                } label: { Image(systemName: "ellipsis.circle") }.menuStyle(.borderlessButton).fixedSize().help("Versions and settings for /\(skill.name)")
            }
            Text(skill.description).foregroundStyle(palette.secondary)
        }.padding(.vertical, 4)
    }
}

struct AppCanvas: View {
    @ObservedObject var model: AppModel
    var palette: Palette
    private func opening(_ name: String) -> some View {
        VStack(spacing: 12) {
            ProgressView().controlSize(.small)
            Text("Opening \(name)…").font(.callout).foregroundStyle(palette.secondary)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).accessibilityElement(children: .combine)
    }
    var body: some View {
        if let running = model.runningApp {
            VStack(spacing: 0) {
                HStack(spacing: 12) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(running.session.name).font(.headline)
                        let access = accessLines(running.session.collections)
                        Text("Version \(running.session.version)" + (access.isEmpty ? " · No saved data" : " · " + access.joined(separator: ", ")))
                            .font(.caption).foregroundStyle(palette.secondary).lineLimit(1)
                    }
                    Spacer()
                    Label("Offline · own data only", systemImage: "lock.shield").font(.caption).foregroundStyle(palette.secondary)
                        .help("This app runs in its own view with no internet access. It sees only the data listed here, and only through Sevra.")
                    Button("Reload") { model.reloadApp() }.help("Start the app again. Saved data is unchanged.")
                    NativeIconButton(symbol: "xmark", title: "Close app", help: "Close this app", action: model.closeApp).frame(width: 28, height: 28)
                }.padding(.horizontal, 16).padding(.vertical, 10)
                Divider()
                if let failure = model.appFailure {
                    HStack {
                        Label(failure, systemImage: "exclamationmark.triangle").font(.callout)
                        Spacer()
                        Button("Open Again") { model.reloadApp() }
                    }.padding(10).background(palette.attention)
                }
                ZStack {
                    MiniAppView(controller: running).frame(maxWidth: .infinity, maxHeight: .infinity)
                    if !running.ready && model.appFailure == nil { opening(running.session.name) }
                }
            }
        } else if let name = model.openingAppName {
            opening(name)
        } else {
            VStack(alignment: .leading, spacing: 8) {
                Text("No app open").font(.headline)
                Text("Open an app from Apps & Skills.").foregroundStyle(palette.secondary)
                Button("Apps & Skills") { model.panel = "Apps" }
            }.padding(24).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

/// The composer's skill chooser.
struct SkillMenu: View {
    @ObservedObject var model: AppModel
    var body: some View {
        Menu {
            let choices = model.skillChoices
            if choices.isEmpty { Text("No skills are on.") }
            ForEach(choices, id: \.name) { choice in
                Button("/\(choice.name) · \(choice.detail)") { model.useSkill(choice.name) }
            }
            Divider()
            Button("Apps & Skills…") { model.panel = "Apps" }
        } label: { Image(systemName: "sparkles") }
            .menuStyle(.borderlessButton).menuIndicator(.hidden).fixedSize()
            .accessibilityLabel("Skills")
            .help("Use a skill: build a mini-app, save a workflow, or run one of yours")
    }
}
