import AppKit
import SwiftUI
import SevraRuntime

/// Sources, reviewed changes, mini-apps and skills.
extension AppModel {
    // MARK: sources

    var attachments: [AttachmentInfo] { snapshot?.attachments[selectedID] ?? [] }

    func attach() {
        let picker = NSOpenPanel()
        picker.canChooseDirectories = true; picker.canChooseFiles = true; picker.allowsMultipleSelection = true
        picker.prompt = "Attach"
        picker.message = "Choose files or folders for this thread. Sevra reads them, and changes a folder only if you allow it. Every change waits for your review."
        guard picker.runModal() == .OK else { return }
        attachFiles(picker.urls)
    }

    func attachFiles(_ urls: [URL]) {
        guard !urls.isEmpty else { return }
        guard !working, !attaching else { error = "Attach sources after the current response finishes."; return }
        let id = selectedID
        attaching = true
        error = nil
        Task {
            defer { attaching = false }
            var problems: [String] = []
            for url in urls.prefix(SourceLimits.attachments) {
                do { try await runtime?.attach(threadID: id, folder: url) }
                catch { problems.append(url.lastPathComponent + ": " + error.localizedDescription) }
            }
            if urls.count > SourceLimits.attachments { problems.append("A thread can have at most \(SourceLimits.attachments) attachments.") }
            if !problems.isEmpty { self.error = problems.joined(separator: "\n") }
            await refresh()
            focusRevision += 1
        }
    }

    func setAccess(_ attachment: AttachmentInfo, to access: AttachmentAccess) {
        let id = selectedID
        perform { try await $0.setAccess(threadID: id, attachmentID: attachment.id, access: access) }
    }

    func detach(_ attachment: AttachmentInfo) {
        let id = selectedID
        perform { try await $0.detach(threadID: id, attachmentID: attachment.id) }
    }

    // MARK: changes

    /// The change set on screen: the one awaiting review, or one chosen from
    /// this thread's history.
    var reviewedChanges: ChangeSet? {
        guard let thread else { return nil }
        if let id = reviewedChangeSetID { return thread.allRuns.compactMap(\.changes).first { $0.id == id } }
        return thread.run?.changes
    }

    func reviewChanges(_ set: ChangeSet? = nil) {
        panel = "Changes"
        reviewedChangeSetID = set?.id
    }

    func approveChanges(_ set: ChangeSet) {
        guard !applyingChanges else { return }
        applyingChanges = true
        let id = selectedID
        perform { runtime in
            defer { self.applyingChanges = false }
            let result = try await runtime.approveChanges(threadID: id, changeSetID: set.id, digest: set.digest)
            self.reviewedChangeSetID = result.id
            self.notice = result.state == .applied ? "Changes written." : "Some changes were not written. Details are in the review."
        }
    }

    func discardChanges(_ set: ChangeSet) {
        let id = selectedID
        perform { runtime in
            try await runtime.discardChanges(threadID: id, changeSetID: set.id)
            if self.selectedID == id { self.panel = "" }
        }
    }

    func undoChanges(_ set: ChangeSet) {
        guard !applyingChanges else { return }
        let alert = NSAlert()
        alert.messageText = "Undo these changes?"
        alert.informativeText = "Sevra puts back the previous version of each changed file and moves new files to the Trash. A file edited since then is left as it is."
        alert.addButton(withTitle: "Undo Changes"); alert.addButton(withTitle: "Cancel")
        guard alert.runModal() == .alertFirstButtonReturn else { return }
        applyingChanges = true
        let id = selectedID
        perform { runtime in
            defer { self.applyingChanges = false }
            let result = try await runtime.undoChanges(threadID: id, changeSetID: set.id)
            self.reviewedChangeSetID = result.id
            self.notice = result.state == .undone ? "Changes undone." : "Some changes could not be undone. Details are in the review."
        }
    }

    // MARK: apps

    var apps: [MiniApp] { (snapshot?.home.apps ?? []).sorted { $0.created > $1.created } }

    /// Starts the draft app with scratch data while its review is open.
    func startPreview() async {
        guard panel == "App review", let proposal = thread?.run?.appProposal else { return }
        let key = "preview:" + proposal.id
        if appPreview?.session.appID == key { return }
        closePreview()
        let data = AppPreviewData(proposal: proposal)
        let controller = MiniAppController(session: MiniAppSession(appID: key, version: 0, name: proposal.name, html: proposal.html, collections: proposal.collections, preview: true),
                                           broker: { data.request($0) }, onLink: { [weak self] url in self?.pendingLink = url })
        appPreview = controller
        // Collections belong to the Home, so a new app can see records other
        // apps saved under the same name. The review says so.
        var counts: [String: Int] = [:]
        for collection in proposal.collections { counts[collection.name] = await runtime?.appRecordCount(collection: collection.name) ?? 0 }
        guard appPreview === controller else { return }
        appReviewCounts = counts
        await controller.load()
        objectWillChange.send()
    }

    func closePreview() {
        appPreview?.close()
        appPreview = nil
    }

    func approveApp(_ proposal: AppProposal) {
        guard !approving else { return }
        approving = true
        let id = selectedID
        perform { runtime in
            defer { self.approving = false }
            let appID = try await runtime.approveApp(threadID: id, proposalID: proposal.id, digest: proposal.digest)
            self.closePreview()
            await self.refresh()
            self.openApp(appID)
        }
    }

    func discardApp(_ proposal: AppProposal) {
        let id = selectedID
        closePreview()
        perform { runtime in
            try await runtime.discardApp(threadID: id, proposalID: proposal.id)
            if self.selectedID == id { self.panel = "" }
        }
    }

    /// `show` brings the app to the front. A reopen that keeps an open app in
    /// step with Home (a version switch or a changed grant) passes false, so it
    /// never takes the person away from what they are looking at.
    func openApp(_ appID: String, show: Bool = true) {
        guard let runtime, openingApp != appID else { return }
        openingApp = appID
        // Show the app's panel at once; the canvas shows progress until the
        // app's first paint.
        if show {
            openingAppName = snapshot?.home.apps?.first { $0.id == appID }?.name
            panel = "App"
        }
        Task {
            defer { openingApp = nil; openingAppName = nil }
            do {
                let document = try await runtime.appDocument(appID: appID)
                guard document.app.active == document.version.number, !document.app.removed else {
                    if show && panel == "App" && runningApp?.session.appID != appID { panel = "Apps" }
                    error = "Turn on \(document.app.name) in Apps & Skills before opening it."
                    return
                }
                let collections = document.grant?.collections ?? []
                if let current = runningApp, current.session.appID == appID, current.session.version == document.version.number,
                   current.session.collections == collections, current.failure == nil {
                    return
                }
                runningApp?.close()
                let version = document.version.number
                let session = MiniAppSession(appID: appID, version: version, name: document.app.name, html: document.html,
                                             collections: collections, preview: false)
                let controller = MiniAppController(session: session, broker: { data in await runtime.appRequest(appID: appID, version: version, request: data) },
                                                   onLink: { [weak self] url in self?.pendingLink = url })
                controller.onFailure = { [weak self] message in self?.appFailure = message }
                controller.onReady = { [weak self] in self?.objectWillChange.send() }
                runningApp = controller
                appFailure = nil
                await controller.load()
                objectWillChange.send()
            } catch { self.error = error.localizedDescription }
        }
    }

    func closeApp() {
        runningApp?.close()
        runningApp = nil
        appFailure = nil
        if panel == "App" { panel = "" }
    }

    func reloadApp() {
        guard let running = runningApp else { return }
        let appID = running.session.appID
        running.close()
        runningApp = nil
        openApp(appID)
    }

    func setApp(_ app: MiniApp, active version: Int?) {
        perform { runtime in
            if let version { try await runtime.activateApp(appID: app.id, version: version) }
            else { try await runtime.deactivateApp(appID: app.id, remove: false) }
        }
    }

    func removeApp(_ app: MiniApp) {
        let alert = NSAlert()
        alert.messageText = "Remove \(app.name)?"
        alert.informativeText = "The app turns off and leaves your Apps list. Its versions and the data it saved stay in your Home, so you can restore it later."
        alert.addButton(withTitle: "Remove App"); alert.addButton(withTitle: "Cancel")
        guard alert.runModal() == .alertFirstButtonReturn else { return }
        if runningApp?.session.appID == app.id { closeApp() }
        perform { try await $0.deactivateApp(appID: app.id, remove: true) }
    }

    func restoreApp(_ app: MiniApp) { perform { try await $0.restoreApp(appID: app.id) } }

    /// Keeps open views in step with Home: data changes reach the app, and a
    /// version switch or removal reopens or closes it.
    func syncApps() {
        // The open app hears only about changes it did not make. Echoing its
        // own saves lets an app that saves on every change feed itself.
        let revisions = snapshot?.appDataRevision ?? [:]
        let openID = runningApp?.session.appID
        let own = openID.flatMap { snapshot?.appDataWrites[$0] } ?? [:]
        var others: [String: Int] = [:]
        for (collection, value) in revisions { others[collection] = value - (own[collection] ?? 0) }
        if openID != seenAppRevisionsOwner {
            // A newly opened app loads current data itself.
            seenAppRevisions = others
            seenAppRevisionsOwner = openID
        } else if others != seenAppRevisions {
            for (collection, value) in others where (seenAppRevisions[collection] ?? 0) != value { runningApp?.notifyChange(collection: collection) }
            seenAppRevisions = others
        }
        if let preview = appPreview, thread?.run?.appProposal.map({ "preview:" + $0.id }) != preview.session.appID { closePreview() }
        guard let running = runningApp, openingApp == nil else { return }
        let app = snapshot?.home.apps?.first { $0.id == running.session.appID }
        guard let app, !app.removed, let active = app.active else { closeApp(); return }
        // Reopen only when what the app runs with changed: its version, or the
        // data access this device granted it. A missing grant, such as in a
        // restored Home, opens with no data access and is not a change.
        let granted = snapshot?.grants[app.id].flatMap { $0.version == active ? $0.collections : nil } ?? []
        if active != running.session.version || granted != running.session.collections { openApp(app.id, show: false) }
    }

    // MARK: skills

    var skills: [Skill] { (snapshot?.home.skills ?? []).sorted { $0.name < $1.name } }

    /// Skills offered in the composer: built-ins, then the person's own.
    var skillChoices: [(name: String, detail: String)] {
        let own = skills.filter { !$0.removed && $0.active != nil }.map { (name: $0.name, detail: $0.description) }
        guard thread?.mode != .incognito else { return own }
        return Extensions.builtIns.map { (name: $0.name, detail: $0.title) } + own
    }

    /// Starts the draft with `/name`, keeping what was already written.
    func useSkill(_ name: String) {
        var body = draft
        if body.hasPrefix("/") { body = String(body.drop { !$0.isWhitespace }).trimmingCharacters(in: .whitespaces) }
        edited("/" + name + " " + body)
        panel = ""
        focusRevision += 1
    }

    func approveSkill(_ proposal: SkillProposal) {
        guard !approving else { return }
        approving = true
        let id = selectedID
        perform { runtime in
            defer { self.approving = false }
            _ = try await runtime.approveSkill(threadID: id, proposalID: proposal.id, digest: proposal.digest)
            if self.selectedID == id { self.panel = "" }
            self.notice = "/\(proposal.name) is ready."
        }
    }

    func discardSkill(_ proposal: SkillProposal) {
        let id = selectedID
        perform { runtime in
            try await runtime.discardSkill(threadID: id, proposalID: proposal.id)
            if self.selectedID == id { self.panel = "" }
        }
    }

    func setSkill(_ skill: Skill, active version: Int?) {
        perform { try await $0.setSkill(skillID: skill.id, active: version) }
    }

    func removeSkill(_ skill: Skill) {
        let alert = NSAlert()
        alert.messageText = "Remove /\(skill.name)?"
        alert.informativeText = "The skill turns off and leaves your list. Its versions stay in your Home, so you can restore it later."
        alert.addButton(withTitle: "Remove Skill"); alert.addButton(withTitle: "Cancel")
        guard alert.runModal() == .alertFirstButtonReturn else { return }
        perform { try await $0.setSkill(skillID: skill.id, active: nil, remove: true) }
    }

    func viewSkill(_ skill: Skill, version: Int? = nil) {
        guard let number = version ?? skill.active ?? skill.latest?.number else { return }
        perform { runtime in
            let text = try await runtime.skillText(skillID: skill.id, version: number)
            self.skillPreview = (name: "/\(skill.name) · version \(number)", text: text)
        }
    }
}
