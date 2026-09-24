import Foundation
import Darwin

extension DocumentReader {
    /// The helper bundled beside Sevra, or an explicit development override.
    public static func locateHelper() -> URL? {
        let fm = FileManager.default
        var candidates: [URL] = []
        if let path = ProcessInfo.processInfo.environment["SEVRA_EXTRACT"], path.hasPrefix("/") { candidates.append(URL(fileURLWithPath: path)) }
        candidates.append(Bundle.main.bundleURL.appendingPathComponent("Contents/Helpers/sevra-extract"))
        if let executable = Bundle.main.executableURL { candidates.append(executable.deletingLastPathComponent().appendingPathComponent("sevra-extract")) }
        return candidates.first { fm.isExecutableFile(atPath: $0.path) }
    }

    /// Check dependency only: the memory a helper's limit counts for its
    /// process group, including the tools it starts.
    public static func processGroupFootprint(_ group: pid_t) -> UInt64 { BoundedProcess.groupFootprint(group) }
}

extension SevraRuntime {
    // MARK: review decisions

    /// After a review decision, the run completes once nothing awaits review.
    func settle(_ thread: inout WorkThread, status: String) {
        guard var value = thread.run else { return }
        if value.awaitingReview {
            value.state = .needsYou
            value.status = status + " Other items still need your review."
            thread.lifecycle = .needsYou
        } else {
            value.state = .completed
            value.status = status
            thread.lifecycle = .done
        }
        thread.run = value
    }

    public func approveChanges(threadID: String, changeSetID: String, digest: String) async throws -> ChangeSet {
        try requireReviewable()
        let i = try threadIndex(threadID)
        guard let set = home.threads[i].run?.changes, set.id == changeSetID, set.state == .proposed, set.digest == digest,
              home.threads[i].run?.state == .needsYou else { throw SevraError.refused("These changes changed or are no longer awaiting approval. Review the current version.") }
        guard !applyingChanges else { throw SevraError.refused("Other changes are being written. Try again in a moment.") }
        guard let session = sources[threadID] else {
            throw SevraError.refused("Attach " + set.roots.values.map(\.name).sorted().joined(separator: ", ") + " again to write these changes. Sevra keeps folder access only while a folder is attached.")
        }
        applyingChanges = true
        defer { applyingChanges = false }
        var applier = ChangeApplier(session: session, home: homeURL)
        applier.fault = changeFault
        // Mark the set as applying first, and on disk before any file is
        // written, so a crash is reported, not replayed.
        try update { $0.threads[i].run?.changes?.state = .applying }
        do { try await durable() } catch {
            try? updateThread(threadID) { $0.run?.changes?.state = .proposed }
            throw error
        }
        let result: ChangeSet
        do {
            result = try await Task.detached(priority: .userInitiated) { try applier.apply(set, cancellation: Cancellation()) }.value
        } catch {
            try updateThread(threadID) { $0.run?.changes?.state = .proposed }
            throw error
        }
        let applied = result.changes.filter { $0.status == .applied }
        // Writing awaited, so find the thread again by identity.
        try updateThread(threadID) { t in
            t.run?.changes = result
            t.run?.trace.append("files: applied \(applied.count) of \(result.changes.count) after exact review " + digest.prefix(16))
            let names = applied.map(\.display).prefix(6).joined(separator: ", ")
            var message = applied.isEmpty ? "No files were changed." : "Wrote \(applied.count == 1 ? "1 file" : "\(applied.count) files"): \(names)\(applied.count > 6 ? " and more" : "")."
            if let note = result.note { message += " " + note }
            t.messages.append(Message(role: "assistant", text: message, runID: t.run?.id))
            settle(&t, status: result.state == .applied ? "Changes written" : "Some changes were not written")
        }
        for change in applied { if let id = change.fileID { session.forget(id) } }
        return result
    }

    /// Check dependency only: observe durable steps while applying changes.
    public func setChangeFault(_ fault: (@Sendable (String) -> Void)?) { changeFault = fault }

    public func discardChanges(threadID: String, changeSetID: String) throws {
        try requireOpen()
        let i = try threadIndex(threadID)
        guard home.threads[i].run?.changes?.id == changeSetID, home.threads[i].run?.changes?.state == .proposed else { return }
        try update { h in
            h.threads[i].run?.changes?.state = .rejected
            for j in (h.threads[i].run?.changes?.changes.indices ?? [].indices) { h.threads[i].run?.changes?.changes[j].content = "" }
            h.threads[i].run?.trace.append("files: discarded without writing")
            settle(&h.threads[i], status: "Changes discarded. Nothing was written.")
        }
    }

    public func undoChanges(threadID: String, changeSetID: String) async throws -> ChangeSet {
        try requireOpen()
        let i = try threadIndex(threadID)
        let thread = home.threads[i]
        guard let set = thread.allRuns.compactMap(\.changes).first(where: { $0.id == changeSetID }), [.applied, .partial].contains(set.state) else {
            throw SevraError.refused("Only written changes can be undone.")
        }
        guard !applyingChanges else { throw SevraError.refused("Other changes are being written. Try again in a moment.") }
        guard let session = sources[threadID] else {
            throw SevraError.refused("Attach " + set.roots.values.map(\.name).sorted().joined(separator: ", ") + " again, with changes allowed, to undo.")
        }
        applyingChanges = true
        defer { applyingChanges = false }
        let applier = ChangeApplier(session: session, home: homeURL)
        let result = try await Task.detached(priority: .userInitiated) { try applier.undo(set) }.value
        // Undoing awaited, so find the thread again by identity.
        try updateThread(threadID) { t in
            func replace(_ run: inout Run?) { if run?.changes?.id == changeSetID { run?.changes = result } }
            replace(&t.run)
            for j in (t.pastRuns ?? []).indices {
                var past: Run? = t.pastRuns?[j]
                replace(&past)
                if let past { t.pastRuns?[j] = past }
            }
            let undone = result.changes.filter { $0.status == .undone }.count
            t.messages.append(Message(role: "assistant", text: result.state == .undone ? "Undid \(undone == 1 ? "1 change" : "\(undone) changes")." : "Undid \(undone) of the changes. " + (result.note ?? ""), runID: t.run?.id))
        }
        for change in result.changes { if let id = change.fileID { session.forget(id) } }
        return result
    }

    // MARK: apps

    public func approveApp(threadID: String, proposalID: String, digest: String) async throws -> String {
        try requireReviewable()
        let i = try threadIndex(threadID)
        guard let proposal = home.threads[i].run?.appProposal, proposal.id == proposalID, proposal.digest == digest,
              home.threads[i].run?.state == .needsYou else { throw SevraError.refused("The app changed or is no longer awaiting approval. Review its current version.") }
        var apps = home.apps ?? []
        let appIndex: Int
        if let id = proposal.appID, let existing = apps.firstIndex(where: { $0.id == id }) { appIndex = existing }
        else {
            apps.append(MiniApp(id: UUID().uuidString.lowercased(), name: proposal.name, description: proposal.description, versions: [], active: nil, threadID: threadID, created: Date()))
            appIndex = apps.count - 1
        }
        let number = (apps[appIndex].latest?.number ?? 0) + 1
        let html = Data(proposal.html.utf8)
        let version = AppVersion(number: number, digest: digestBytes(html), bytes: html.count, collections: proposal.collections, created: Date(),
                                 threadID: threadID, runID: home.threads[i].run?.id)
        apps[appIndex].name = proposal.name
        apps[appIndex].description = proposal.description
        apps[appIndex].versions.append(version)
        apps[appIndex].active = number
        apps[appIndex].removed = false
        let app = apps[appIndex]
        let manifest: [String: Any] = ["name": app.name, "description": app.description, "version": number, "sha256": version.digest,
                                       "data": proposal.collections.map { ["collection": $0.name, "access": $0.access.rawValue] }, "created": AppRecord.formatter.string(from: version.created)]
        let files = [HomeStore.OwnedFile(path: app.folder(number) + "/index.html", content: html),
                     HomeStore.OwnedFile(path: app.folder(number) + "/app.json", content: try JSONSerialization.data(withJSONObject: manifest, options: [.sortedKeys, .prettyPrinted]))]
        try update({ h in
            h.apps = apps
            h.threads[i].run?.appProposal = nil
            h.threads[i].run?.published = "app:" + app.id
            h.threads[i].run?.trace.append("app: version \(number) published and turned on after exact review " + digest.prefix(16))
            h.threads[i].messages.append(Message(role: "assistant", text: "\(app.name) is ready (version \(number)). Open it from Apps.", runID: h.threads[i].run?.id))
            settle(&h.threads[i], status: "App turned on")
        }, files: files)
        // The version's files are on disk before it gets access.
        try await durable()
        try await changeGrants { $0[app.id] = AppGrant(version: number, collections: proposal.collections, granted: Date()) }
        return app.id
    }

    /// Turns on a version the person chose, with exactly the access it shows.
    public func activateApp(appID: String, version: Int) async throws {
        try requireOpen(); try requireActiveHome()
        var apps = home.apps ?? []
        guard let index = apps.firstIndex(where: { $0.id == appID }), let chosen = apps[index].versions.first(where: { $0.number == version }) else { throw SevraError.refused("That app version is not available.") }
        _ = try appSource(apps[index], version: chosen)
        apps[index].active = version
        apps[index].removed = false
        try update { $0.apps = apps }
        // Access follows the saved choice, so a crash never leaves a grant
        // for a version Home does not show as on.
        try await durable()
        try await changeGrants { $0[appID] = AppGrant(version: version, collections: chosen.collections, granted: Date()) }
    }

    /// Turns an app off. With `remove`, it also leaves the Apps list. Its
    /// data and versions stay in Home either way.
    public func deactivateApp(appID: String, remove: Bool) async throws {
        try requireOpen()
        guard (home.apps ?? []).contains(where: { $0.id == appID }) else { return }
        // Access ends first, in memory at once and then on disk.
        try await changeGrants { $0.removeValue(forKey: appID) }
        // Saving awaited, so apply the change to the apps as they are now.
        try update { h in
            guard let at = h.apps?.firstIndex(where: { $0.id == appID }) else { return }
            h.apps?[at].active = nil
            if remove { h.apps?[at].removed = true }
        }
    }

    public func restoreApp(appID: String) throws {
        try requireOpen()
        var apps = home.apps ?? []
        guard let index = apps.firstIndex(where: { $0.id == appID }) else { return }
        apps[index].removed = false
        try update { $0.apps = apps }
    }

    func appSource(_ app: MiniApp, version: AppVersion) throws -> String {
        let data = try HomeStore.readOwned(app.folder(version.number) + "/index.html", at: homeURL, limit: Extensions.appBytes)
        guard digestBytes(data) == version.digest else { throw SevraError.conflict("\(app.name) version \(version.number) changed outside Sevra, so it will not run. Restore it from a backup or turn on another version.") }
        return String(decoding: data, as: UTF8.self)
    }

    /// The exact bytes for the app host. The host serves nothing else.
    public func appDocument(appID: String, version: Int? = nil) throws -> (app: MiniApp, version: AppVersion, html: String, grant: AppGrant?) {
        guard let app = (home.apps ?? []).first(where: { $0.id == appID }) else { throw SevraError.refused("This app is no longer available.") }
        guard let chosen = version.flatMap({ number in app.versions.first { $0.number == number } }) ?? app.activeVersion ?? app.latest else { throw SevraError.refused("This app has no versions.") }
        let grant = grants[appID].flatMap { $0.version == chosen.number ? $0 : nil }
        return (app, chosen, try appSource(app, version: chosen), grant)
    }

    func readApp(_ call: ProposedTool, used: inout Int) throws -> String {
        let requested = try call.string("app_id")
        guard let app = (home.apps ?? []).first(where: { !$0.removed && ($0.id == requested || $0.name.caseInsensitiveCompare(requested) == .orderedSame) }) else {
            let names = (home.apps ?? []).filter { !$0.removed }.map { "\($0.name) (\($0.id))" }
            throw SevraError.refused(names.isEmpty ? "There are no apps yet." : "No app matches. Apps: " + names.joined(separator: ", "))
        }
        guard let version = app.activeVersion ?? app.latest else { throw SevraError.refused("This app has no versions.") }
        let html = Array(try appSource(app, version: version).utf8)
        let start = try call.integer("offset", default: 0)
        guard start <= html.count else { throw SevraError.refused("Invalid offset.") }
        let remaining = 96 * 1024 - used
        guard remaining > 0 else { throw SevraError.refused("This job has read as much app source as it can.") }
        var end = min(html.count, start + min(24 * 1024, remaining))
        while end > start && String(bytes: html[start..<end], encoding: .utf8) == nil { end -= 1 }
        used += end - start
        var result: [String: Any] = ["app_id": app.id, "name": app.name, "description": app.description, "version": version.number,
                                     "data": version.collections.map { $0.name + ":" + $0.access.rawValue }.joined(separator: ","),
                                     "offset": start, "bytes": html.count, "html": String(decoding: html[start..<end], as: UTF8.self)]
        if end < html.count { result["next"] = end }
        return json(result)
    }

    // MARK: app data

    /// Loads a collection once, reading its records in the writer.
    func loadCollection(_ collection: String) async throws {
        guard appRecords[collection] == nil else { return }
        let bodies = try await writer.perform { store in
            try store.documents(under: "records/app-data/\(collection)/").map { try store.trackedBody($0) }
        }
        var records: [String: AppRecord] = [:]
        for body in bodies {
            guard let record = AppRecord.decode(body), record.collection == collection else { continue }
            records[record.id] = record
        }
        // Another request may have loaded it, and saved to it, meanwhile.
        if appRecords[collection] == nil { appRecords[collection] = records }
    }

    /// One request from an app's isolated view. Identity and access come from
    /// the host's own records for the app and version, never the request.
    public func appRequest(appID: String, version: Int, request: Data) async -> Data {
        func reply(_ value: Any) -> Data { (try? JSONSerialization.data(withJSONObject: ["ok": true, "result": value])) ?? Data() }
        func failure(_ code: String, _ message: String) -> Data { (try? JSONSerialization.data(withJSONObject: ["ok": false, "error": ["code": code, "message": message]])) ?? Data() }
        do {
            guard request.count <= 256 * 1024, let body = (try? JSONSerialization.jsonObject(with: request)) as? [String: Any], let op = body["op"] as? String else {
                return failure("invalid", "Malformed request.")
            }
            guard !shuttingDown, !storagePaused else { return failure("paused", "Sevra has paused saving. Your data is preserved.") }
            if let review = restoreReview, !review.reviewed { return failure("paused", "Review this restored Home before using apps.") }
            guard let app = (home.apps ?? []).first(where: { $0.id == appID }), !app.removed, app.active == version,
                  let active = app.activeVersion else { return failure("inactive", "This app is turned off.") }
            guard let grant = grants[appID], grant.version == version else { return failure("inactive", "Turn this app on again to allow its data access.") }
            // Access is what this device granted, limited to what the active
            // version declares. The request never names its own authority.
            let allowed = grant.collections.filter { active.collections.contains($0) }
            if AppData.writes.contains(op) {
                var budget = appWriteBudgets[appID] ?? AppWriteBudget()
                let spent = budget.take()
                appWriteBudgets[appID] = budget
                guard spent else { return failure("busy", AppData.busy) }
            }
            // The one collection a request names is loaded before it is
            // handled; loading reads in the writer and may await.
            if let collection = body["collection"] as? String, allowed.contains(where: { $0.name == collection }) {
                try await loadCollection(collection)
                guard !shuttingDown, !storagePaused else { return failure("paused", "Sevra has paused saving. Your data is preserved.") }
            }
            let outcome = try AppData.handle(op: op, body: body, name: app.name, version: version, collections: allowed, appID: appID, now: Date()) { collection in
                appRecords[collection] ?? [:]
            }
            switch outcome {
            case .reply(let value): return reply(value)
            case .failure(let code, let message): return failure(code, message)
            case .save(let record, let value):
                let document = HomeStore.Document(path: record.path, type: "sevra-app-record", body: record.body, immutable: false, summary: "Mini-app record in \(record.collection)")
                // The record counts at once, so a second write to it while
                // this one saves sees its revision. The app hears success
                // only once the record is on disk; if that fails, nothing
                // was written and the record is as it was.
                let previous = appRecords[record.collection]?[record.id]
                appRecords[record.collection, default: [:]][record.id] = record
                let ticket = saves.submit(records: SaveQueue.Batch(state: home, revision: home.revision, documents: [document]))
                do { try await saves.wait(ticket: ticket) } catch {
                    if appRecords[record.collection]?[record.id] == record { appRecords[record.collection]?[record.id] = previous }
                    throw error
                }
                appDataRevision[record.collection, default: 0] += 1
                appDataWrites[appID, default: [:]][record.collection, default: 0] += 1
                return reply(value)
            }
        } catch {
            // A record changed outside Sevra pauses writes until reviewed.
            if case SevraError.conflict = error { pausedHere = true; lastErrorForApps(error) }
            return failure("error", error.localizedDescription)
        }
    }

    /// Discards an app proposal without publishing anything.
    public func discardApp(threadID: String, proposalID: String) throws {
        try requireOpen()
        let i = try threadIndex(threadID)
        guard home.threads[i].run?.appProposal?.id == proposalID else { return }
        try update { h in
            h.threads[i].run?.appProposal = nil
            h.threads[i].run?.trace.append("app: draft discarded")
            settle(&h.threads[i], status: "App discarded. Nothing was published.")
        }
    }

    /// Discards a skill proposal without publishing anything.
    public func discardSkill(threadID: String, proposalID: String) throws {
        try requireOpen()
        let i = try threadIndex(threadID)
        guard home.threads[i].run?.skillProposal?.id == proposalID else { return }
        try update { h in
            h.threads[i].run?.skillProposal = nil
            h.threads[i].run?.trace.append("skill: draft discarded")
            settle(&h.threads[i], status: "Skill discarded. Nothing was published.")
        }
    }

    public func appRecordCount(collection: String) async -> Int {
        do { try await loadCollection(collection) } catch { return 0 }
        return appRecords[collection]?.count ?? 0
    }

    // MARK: skills

    public func approveSkill(threadID: String, proposalID: String, digest: String) async throws -> String {
        try requireReviewable()
        let i = try threadIndex(threadID)
        guard let proposal = home.threads[i].run?.skillProposal, proposal.id == proposalID, proposal.digest == digest,
              home.threads[i].run?.state == .needsYou else { throw SevraError.refused("The skill changed or is no longer awaiting approval. Review its current version.") }
        var skills = home.skills ?? []
        let skillIndex: Int
        if let id = proposal.skillID, let existing = skills.firstIndex(where: { $0.id == id }) { skillIndex = existing }
        else {
            guard !skills.contains(where: { !$0.removed && $0.name == proposal.name }) else { throw SevraError.refused("A skill named \(proposal.name) already exists.") }
            skills.append(Skill(id: UUID().uuidString.lowercased(), name: proposal.name, description: proposal.description, versions: [], active: nil, created: Date()))
            skillIndex = skills.count - 1
        }
        let number = (skills[skillIndex].latest?.number ?? 0) + 1
        let document = Data(proposal.document.utf8)
        skills[skillIndex].name = proposal.name
        skills[skillIndex].description = proposal.description
        skills[skillIndex].versions.append(SkillVersion(number: number, digest: digestBytes(document), tools: proposal.tools, created: Date(), threadID: threadID, runID: home.threads[i].run?.id))
        skills[skillIndex].active = number
        skills[skillIndex].removed = false
        let skill = skills[skillIndex]
        try update({ h in
            h.skills = skills
            h.threads[i].run?.skillProposal = nil
            h.threads[i].run?.published = "skill:" + skill.id
            h.threads[i].run?.trace.append("skill: version \(number) published and turned on after exact review " + digest.prefix(16))
            h.threads[i].messages.append(Message(role: "assistant", text: "The /\(skill.name) skill is ready (version \(number)). Choose it from Skills or type /\(skill.name).", runID: h.threads[i].run?.id))
            settle(&h.threads[i], status: "Skill turned on")
        }, files: [HomeStore.OwnedFile(path: skill.file(number), content: document)])
        // The skill file is on disk before the skill can be chosen.
        try await durable()
        return skill.id
    }

    public func setSkill(skillID: String, active version: Int?, remove: Bool = false) throws {
        try requireOpen()
        var skills = home.skills ?? []
        guard let index = skills.firstIndex(where: { $0.id == skillID }) else { return }
        if let version { guard skills[index].versions.contains(where: { $0.number == version }) else { throw SevraError.refused("That skill version is not available.") } }
        skills[index].active = version
        skills[index].removed = remove
        if !remove, version != nil { skills[index].removed = false }
        try update { $0.skills = skills }
    }

    public func skillText(skillID: String, version: Int) throws -> String {
        guard let skill = (home.skills ?? []).first(where: { $0.id == skillID }), let chosen = skill.versions.first(where: { $0.number == version }) else { throw SevraError.refused("That skill version is not available.") }
        let data = try HomeStore.readOwned(skill.file(version), at: homeURL, limit: Extensions.skillBytes + 4096)
        guard digestBytes(data) == chosen.digest else { throw SevraError.conflict("The /\(skill.name) skill changed outside Sevra, so it will not be used.") }
        return String(decoding: data, as: UTF8.self)
    }

    func resolveSkill(_ name: String?) -> SkillUse? {
        guard let name else { return nil }
        if Extensions.builtIns.contains(where: { $0.name == name }) { return SkillUse(id: "builtin:" + name, name: name, version: 1, builtIn: true) }
        guard let skill = (home.skills ?? []).first(where: { $0.name == name && !$0.removed }), let version = skill.active else { return nil }
        return SkillUse(id: skill.id, name: skill.name, version: version, builtIn: false)
    }

    func skillInstructions(_ use: SkillUse?) throws -> (use: SkillUse, instructions: String, tools: Set<ToolGroup>)? {
        guard let use else { return nil }
        if use.builtIn, let builtIn = Extensions.builtIns.first(where: { "builtin:" + $0.name == use.id }) { return (use, builtIn.instructions, builtIn.tools) }
        guard let skill = (home.skills ?? []).first(where: { $0.id == use.id }), let version = skill.versions.first(where: { $0.number == use.version }) else {
            throw SevraError.refused("The skill /\(use.name) is no longer available.")
        }
        let text = try skillText(skillID: skill.id, version: version.number)
        return (use, String(RecordText.body(of: text)).trimmingCharacters(in: .whitespacesAndNewlines), Set(version.tools))
    }
}
