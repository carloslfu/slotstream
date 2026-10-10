import AppKit
import SwiftUI
import Vision
import CoreText
@testable import SevraMac
import SevraRuntime
import SevraPresentation

/// Real dbmd, production navigation and views, disposable Homes, no model.
@main struct HomeUIChecks {
    @MainActor static func main() async throws {
        setvbuf(stdout, nil, _IOLBF, 0)
        NSApplication.shared.setActivationPolicy(.prohibited)
        let env = ProcessInfo.processInfo.environment
        let fonts = URL(fileURLWithPath: env["SEVRA_FONTS"]!)
        for name in ["Inter", "Poppins-Medium"] {
            CTFontManagerRegisterFontsForURL(fonts.appendingPathComponent(name + ".ttf") as CFURL, .process, nil)
        }
        let out = URL(fileURLWithPath: env["SEVRA_UI_OUT"]!).resolvingSymlinksInPath()
        let root = out.appendingPathComponent("fixtures-" + UUID().uuidString)
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: root) }
        let dbmd = URL(fileURLWithPath: env["SEVRA_DBMD"]!)
        let suite = "Sevra.HomeChecks." + UUID().uuidString
        let defaults = UserDefaults(suiteName: suite)!
        defer { defaults.removePersistentDomain(forName: suite) }
        let a = root.appendingPathComponent("Personal", isDirectory: true)
        let b = root.appendingPathComponent("Research", isDirectory: true)
        defaults.set(a.path, forKey: "homes.selected.v1")
        let homes = HomeNavigation(defaults: defaults, environment: [:])
        homes.makeRuntime = { url in
            try SevraRuntime(homeURL: url, dbmd: dbmd, inference: ScriptedInference(
                turns: [EngineTurn(text: String(repeating: "Working on a long response. ", count: 120))], delayNanoseconds: 50_000_000))
        }
        var current = AppModel(homeURL: a, homes: homes)
        current.runtime = try await homes.makeRuntime!(a)
        let window = NSWindow(contentRect: NSRect(x: -30000, y: -30000, width: 1120, height: 760), styleMask: [.borderless], backing: .buffered, defer: false)
        window.setFrameOrigin(NSPoint(x: -30000, y: -30000))
        window.appearance = NSAppearance(named: .aqua)
        func host() { window.contentView = NSHostingView(rootView: ContentView(model: current).defaultAppStorage(defaults)) }
        host(); window.orderFront(nil)
        defer { window.orderOut(nil) }
        precondition(!NSScreen.screens.contains { $0.frame.intersects(window.frame) })
        homes.didOpen = { next in current = next; host(); next.start() }
        current.start()
        func require(_ condition: Bool, _ label: String) throws {
            guard condition else { throw NSError(domain: "HomeChecks", code: 1, userInfo: [NSLocalizedDescriptionKey: label]) }
            print("PASS: " + label)
        }
        func ready() async throws {
            let deadline = Date().addingTimeInterval(20)
            while !current.composer.ready || current.openingHome {
                guard Date() < deadline else { throw NSError(domain: "HomeChecks", code: 2, userInfo: [NSLocalizedDescriptionKey: current.error ?? "Home did not open"]) }
                try await Task.sleep(nanoseconds: 30_000_000)
            }
        }
        func snapshot(_ name: String) throws -> CGImage {
            guard let view = window.contentView else { fatalError() }
            view.layoutSubtreeIfNeeded(); view.displayIfNeeded()
            let rep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: Int(view.bounds.width * 2), pixelsHigh: Int(view.bounds.height * 2), bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
            rep.size = view.bounds.size
            view.cacheDisplay(in: view.bounds, to: rep)
            try rep.representation(using: .png, properties: [:])!.write(to: out.appendingPathComponent(name + ".png"))
            return rep.cgImage!
        }
        func text(_ image: CGImage) throws -> String {
            let request = VNRecognizeTextRequest(); request.recognitionLevel = .accurate
            try VNImageRequestHandler(cgImage: image).perform([request])
            return (request.results ?? []).compactMap { $0.topCandidates(1).first?.string }.joined(separator: "\n")
        }
        try await ready()
        try require(current.homeURL == a, "initial Home opens")
        let firstRuntime = current.runtime!
        current.edited("Personal draft survives switching")
        current.journalComposer.edit("Personal journal draft")
        try require(await homes.switchHome(to: b, intent: .new), "create and switch to a separate Home")
        try await ready()
        try require(current.draft.isEmpty && current.journalComposer.text.isEmpty, "new Home has no previous Home drafts")
        let firstID = await firstRuntime.snapshot().home.id
        try require(await current.runtime!.snapshot().home.id != firstID, "Homes have separate identities")
        var refused = false
        do { _ = try await firstRuntime.saveDraft(threadID: "home", text: "stale writer") }
        catch { refused = true }
        try require(refused, "closed runtime rejects stale writes")
        current.edited("Research draft stays in Research")
        try require(await homes.switchHome(to: a), "return to prior Home while old runtime is still retained")
        try await ready()
        try require(current.draft == "Personal draft survives switching", "conversation draft restored exactly")
        try require(current.journalComposer.text == "Personal journal draft", "journal draft restored exactly")
        try require(HomeNavigation(defaults: defaults, environment: [:]).current == a, "last selected Home persists for next launch")
        let explicit = HomeNavigation(defaults: defaults, environment: ["SEVRA_HOME": b.path])
        explicit.opened(b)
        try require(HomeNavigation(defaults: defaults, environment: [:]).current == a, "explicit development Home does not replace saved startup Home")
        let missing = root.appendingPathComponent("Disconnected")
        try require(!(await homes.switchHome(to: missing)), "missing recent Home is refused")
        try require(!FileManager.default.fileExists(atPath: missing.path) && current.homeURL == a, "missing Home is not silently recreated")
        homes.showing = false; homes.error = nil
        let occupied = root.appendingPathComponent("Existing files")
        try FileManager.default.createDirectory(at: occupied, withIntermediateDirectories: true)
        try Data("Keep these bytes".utf8).write(to: occupied.appendingPathComponent("keep.txt"))
        try require(!(await homes.switchHome(to: occupied, intent: .new)), "new Home refuses a nonempty folder")
        try require(try String(contentsOf: occupied.appendingPathComponent("keep.txt"), encoding: .utf8) == "Keep these bytes", "existing unrelated files preserved")
        try require(!(await homes.switchHome(to: a.appendingPathComponent("Nested"), intent: .new)), "nested Homes refused")
        let link = root.appendingPathComponent("Alias")
        try FileManager.default.createSymbolicLink(at: link, withDestinationURL: b)
        try require(!(await homes.switchHome(to: link)), "symbolic-link Home refused")
        let holder = try await homes.makeRuntime!(b)
        current.edited("Keep working when destination is busy")
        try require(!(await homes.switchHome(to: b)), "Home owned by another session is refused")
        try require(current.homeURL == a && current.composer.ready && current.draft == "Keep working when destination is busy", "failed open leaves the current Home usable")
        try await holder.shutdown()
        // A real conflicting write must block switching without submitting a draft.
        _ = try await current.runtime!.saveDraft(threadID: "home", text: "Other editor's draft")
        current.edited("My unsaved version")
        try require(!(await homes.switchHome(to: b)), "draft conflict blocks switching")
        try require(current.homeURL == a && current.composer.issue != nil, "conflicting draft remains visible in old Home")
        current.composer.useSavedDraft()
        // Incognito closes only after confirmation and a valid destination.
        _ = try await current.runtime!.newThread(mode: .incognito, title: "Private")
        try require(!(await homes.switchHome(to: b, confirm: { false })), "cancel preserves Incognito and current Home")
        try require(await current.runtime!.snapshot().home.threads.contains { $0.mode == .incognito }, "cancel does not erase Incognito")
        try require(await homes.switchHome(to: b, confirm: { true }), "confirmed switch closes Incognito")
        try await ready()
        try require(current.draft == "Research draft stays in Research", "second Home retains only its own draft")
        try require(await homes.switchHome(to: a), "switch back after private session")
        try await ready()
        try require(!(await current.runtime!.snapshot().home.threads.contains { $0.mode == .incognito }), "Incognito does not survive reopening")
        let activeRuntime = current.runtime!
        _ = try await activeRuntime.submit(threadID: "home", text: "Long response", nonce: UUID().uuidString)
        try require(!(await homes.switchHome(to: b, confirm: { false })), "cancel keeps active Home")
        try require(await homes.switchHome(to: b, confirm: { true }), "confirmed switch stops active work before handoff")
        try await ready()
        try require(!(await activeRuntime.snapshot().home.threads.contains { $0.run?.state.terminal == false && $0.run?.state != .needsYou }), "old work is terminal before next Home is shown")
        homes.error = nil; homes.showing = false
        window.contentView = NSHostingView(rootView: HomeChooser(homes: homes))
        window.setContentSize(NSSize(width: 390, height: 440))
        try await Task.sleep(nanoseconds: 400_000_000)
        let chooser = try text(snapshot("home-chooser-light"))
        try require(chooser.contains("Personal") && chooser.contains("Research") && chooser.contains("New Home") && chooser.contains("Open Home"), "chooser renders current and recent Homes with create/open actions")
        window.appearance = NSAppearance(named: .darkAqua)
        _ = try snapshot("home-chooser-dark")
        // Click the actual rendered recent-Home row, not just its action method.
        let request = VNRecognizeTextRequest(); request.recognitionLevel = .accurate
        try VNImageRequestHandler(cgImage: snapshot("home-chooser-click")).perform([request])
        guard let row = request.results?.first(where: { $0.topCandidates(1).first?.string == "Personal" }), let view = window.contentView else {
            throw NSError(domain: "HomeChecks", code: 3, userInfo: [NSLocalizedDescriptionKey: "Recent Home row is not visible"])
        }
        let point = NSPoint(x: row.boundingBox.midX * view.bounds.width, y: row.boundingBox.midY * view.bounds.height)
        let time = ProcessInfo.processInfo.systemUptime
        let down = NSEvent.mouseEvent(with: .leftMouseDown, location: point, modifierFlags: [], timestamp: time, windowNumber: window.windowNumber, context: nil, eventNumber: 1, clickCount: 1, pressure: 1)!
        let up = NSEvent.mouseEvent(with: .leftMouseUp, location: point, modifierFlags: [], timestamp: time + 0.05, windowNumber: window.windowNumber, context: nil, eventNumber: 2, clickCount: 1, pressure: 0)!
        window.sendEvent(down); try await Task.sleep(nanoseconds: 50_000_000); window.sendEvent(up)
        let clickDeadline = Date().addingTimeInterval(15)
        while current.homeURL.path != a.path && Date() < clickDeadline { try await Task.sleep(nanoseconds: 30_000_000) }
        try require(current.homeURL.path == a.path, "clicking the rendered recent Home switches the actual session")
        try await ready()

        window.setContentSize(NSSize(width: 1120, height: 760)); window.appearance = NSAppearance(named: .aqua); host()
        try await Task.sleep(nanoseconds: 400_000_000)
        try require(try text(snapshot("sidebar-light")).contains("Current Home"), "Home switcher is visible in production sidebar")
        window.appearance = NSAppearance(named: .darkAqua)
        _ = try snapshot("sidebar-dark")
        window.setContentSize(NSSize(width: 620, height: 660))
        NotificationCenter.default.post(name: .sevraShowHomes, object: nil)
        try await Task.sleep(nanoseconds: 400_000_000)
        try require(homes.showing, "Home menu remains reachable with collapsed navigation")
        homes.showing = false
        try require(await current.quit(), "final Home closes cleanly")
        current.releaseHomeSession()
        print("Home switching and native UI checks passed.")
    }
}
