import AppKit
import SwiftUI
import CoreText
import Combine
import Vision
@testable import SevraMac
import SevraRuntime
import SevraPresentation

/// Offscreen check of the thinking controls in the production Mac views.
///
/// The real `ContentView` and `AppModel` run over the scripted engine in a
/// scratch Home. Controls are found by their rendered labels with on-device
/// text recognition and clicked with synthesized mouse events, so the check
/// exercises what a person sees and presses: the Think longer switch, Send,
/// the live clock and thought preview, Answer now, the details popover with
/// the working notes, the thinking line above the reply, the optional speed
/// line and live speed, and the typical-time hint, in light and dark
/// appearance. Popover content is rendered from its own view. Snapshots go to
/// `SEVRA_UI_OUT`. The window lives far outside every display, the process
/// never activates, and no user Home is touched. Run it with
/// `Tools/check_sevra_thinking_ui.sh`.
@main struct ThinkingUIChecks {
    @MainActor static func main() async throws {
        setvbuf(stdout, nil, _IOLBF, 0)
        _ = NSApplication.shared
        NSApp.setActivationPolicy(.prohibited)
        let env = ProcessInfo.processInfo.environment
        let out = URL(fileURLWithPath: env["SEVRA_UI_OUT"] ?? FileManager.default.temporaryDirectory.appendingPathComponent("sevra-ui-probe").path)
        try FileManager.default.createDirectory(at: out, withIntermediateDirectories: true)
        let fonts = URL(fileURLWithPath: env["SEVRA_FONTS"] ?? "apps/macos/Resources/Fonts")
        for name in ["Inter", "Poppins-Medium"] {
            CTFontManagerRegisterFontsForURL(fonts.appendingPathComponent(name + ".ttf") as CFURL, .process, nil)
        }
        let home = out.appendingPathComponent("home")
        try? FileManager.default.removeItem(at: home)
        let dbmd = URL(fileURLWithPath: env["SEVRA_DBMD"] ?? NSHomeDirectory() + "/.dbmd/bin/dbmd")
        let words = ["The", "user", "asks", "when", "a", "train", "arrives.", "Departure", "is", "9:40", "and", "the", "trip", "takes", "2", "hours", "35", "minutes.", "Adding", "the", "hours", "first", "gives", "11:40,", "then", "35", "minutes", "more", "gives", "12:15.", "I", "should", "also", "check", "whether", "the", "duration", "crosses", "noon,", "which", "it", "does,", "so", "the", "answer", "stays", "in", "the", "same", "day."]
        let trace = (0..<8).flatMap { _ in words }.joined(separator: " ")
        let engine = ScriptedInference(turns: [EngineTurn(text: "The train arrives at **12:15**. Two hours after 9:40 is 11:40, and 35 minutes more is 12:15."),
                                               EngineTurn(text: "You are welcome. The same arithmetic works for any trip: add the hours first, then the minutes, and carry past sixty.")],
                                       delayNanoseconds: 40_000_000, thinkingTraces: [trace])
        // Response details start off, as they do for a person.
        UserDefaults.standard.removeObject(forKey: "responseDetails.visible")
        defer { UserDefaults.standard.removeObject(forKey: "responseDetails.visible") }
        let runtime = try SevraRuntime(homeURL: home, dbmd: dbmd, inference: engine)
        let model = AppModel()
        model.runtime = runtime
        // The same composer observation the app's start() installs.
        model.observeComposers()
        await model.refresh()
        try await model.composer.open("home")
        try await model.journalComposer.open("journal")
        let poll = Task { while !Task.isCancelled { await model.refresh(); try? await Task.sleep(nanoseconds: 100_000_000) } }
        defer { poll.cancel() }

        let size = NSSize(width: 1120, height: 760)
        let window = NSWindow(contentRect: NSRect(origin: .zero, size: size), styleMask: [.borderless], backing: .buffered, defer: false)
        window.appearance = NSAppearance(named: .aqua)
        let host = NSHostingView(rootView: ContentView(model: model))
        window.contentView = host
        // SwiftUI controls only take clicks from a window the window server knows,
        // so the window is ordered in far outside every display. The process never
        // activates, owns no Dock icon and nothing is drawn on a screen.
        window.setFrameOrigin(NSPoint(x: -30000, y: -30000))
        window.orderFront(nil)
        if NSScreen.screens.contains(where: { $0.frame.intersects(window.frame) }) || window.occlusionState.contains(.visible) {
            print("FAIL: the check window would be visible on a display; stopping"); window.orderOut(nil); exit(1)
        }

        var failures = 0
        func check(_ condition: @autoclosure () -> Bool, _ message: String) {
            if condition() { print("PASS: \(message)") } else { failures += 1; print("FAIL: \(message)") }
        }
        func settle(_ seconds: Double = 12, _ what: String, _ predicate: () -> Bool) async throws {
            let deadline = Date().addingTimeInterval(seconds)
            while Date() < deadline {
                host.layoutSubtreeIfNeeded()
                if predicate() { return }
                try await Task.sleep(nanoseconds: 20_000_000)
            }
            throw NSError(domain: "ThinkingUIChecks", code: 1, userInfo: [NSLocalizedDescriptionKey: "Timed out waiting for " + what])
        }
        func pause(_ seconds: Double) async throws {
            let deadline = Date().addingTimeInterval(seconds)
            while Date() < deadline { host.layoutSubtreeIfNeeded(); try await Task.sleep(nanoseconds: 20_000_000) }
        }
        func render() -> NSBitmapImageRep {
            host.layoutSubtreeIfNeeded(); host.displayIfNeeded()
            let bounds = host.bounds
            let rep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: Int(bounds.width) * 2, pixelsHigh: Int(bounds.height) * 2, bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
            rep.size = bounds.size
            host.cacheDisplay(in: bounds, to: rep)
            return rep
        }
        func snapshot(_ name: String) throws -> NSBitmapImageRep {
            let rep = render()
            let url = out.appendingPathComponent(name + ".png")
            try rep.representation(using: .png, properties: [:])!.write(to: url)
            print("SNAPSHOT: \(url.path)")
            return rep
        }
        struct Line { let text: String; let candidate: VNRecognizedText; let box: CGRect }
        func read(_ rep: NSBitmapImageRep) throws -> [Line] {
            guard let image = rep.cgImage else { return [] }
            let request = VNRecognizeTextRequest()
            request.recognitionLevel = .accurate
            request.usesLanguageCorrection = false
            try VNImageRequestHandler(cgImage: image, options: [:]).perform([request])
            return (request.results ?? []).compactMap { observation in
                guard let top = observation.topCandidates(1).first else { return nil }
                return Line(text: top.string, candidate: top, box: observation.boundingBox)
            }
        }
        /// Window-coordinate rectangle of a visible label, or nil when it is not on screen.
        func labelRect(_ label: String, in lines: [Line]) -> NSRect? {
            for line in lines {
                guard let range = line.text.range(of: label, options: .caseInsensitive) else { continue }
                let box = ((try? line.candidate.boundingBox(for: range)) ?? nil)?.boundingBox ?? line.box
                return NSRect(x: box.minX * size.width, y: box.minY * size.height, width: box.width * size.width, height: box.height * size.height)
            }
            return nil
        }
        func locate(_ label: String, in lines: [Line]) -> NSPoint? {
            labelRect(label, in: lines).map { NSPoint(x: $0.midX, y: $0.midY) }
        }
        func visible(_ label: String, _ lines: [Line]) -> Bool { locate(label, in: lines) != nil }
        func click(_ point: NSPoint) async throws {
            let time = ProcessInfo.processInfo.systemUptime
            guard let down = NSEvent.mouseEvent(with: .leftMouseDown, location: point, modifierFlags: [], timestamp: time, windowNumber: window.windowNumber, context: nil, eventNumber: 1, clickCount: 1, pressure: 1),
                  let up = NSEvent.mouseEvent(with: .leftMouseUp, location: point, modifierFlags: [], timestamp: time + 0.06, windowNumber: window.windowNumber, context: nil, eventNumber: 2, clickCount: 1, pressure: 0) else { return }
            window.sendEvent(down)
            try await pause(0.06)
            window.sendEvent(up)
        }
        /// Renders, finds the label a person would click, and clicks it.
        func clickLabel(_ label: String) async throws -> Bool {
            guard let point = locate(label, in: try read(render())) else { print("  label not visible: \(label)"); return false }
            print("  click \(label) at (\(Int(point.x)), \(Int(point.y)))")
            try await click(point)
            return true
        }
        /// Clicks a link in the conversation the way NSTextView does once it has
        /// tracked a click: the link under the rendered label, through the view's
        /// own delegate. (Pumping AppKit's event queue in this never-run process
        /// ends it, so the check does not synthesize the text view's tracking.)
        func clickTextLabel(_ label: String) async throws -> Bool {
            guard let point = locate(label, in: try read(render())), let conversation = model.textSession.conversation, let storage = conversation.textStorage else {
                print("  label not visible: \(label)"); return false
            }
            let index = conversation.characterIndexForInsertion(at: conversation.convert(point, from: nil))
            for candidate in [index, index - 1] where candidate >= 0 && candidate < storage.length {
                guard let url = storage.attribute(.link, at: candidate, effectiveRange: nil) as? URL else { continue }
                print("  click link \(label) at (\(Int(point.x)), \(Int(point.y)))")
                conversation.clicked(onLink: url, at: candidate)
                try await pause(0.3)
                return true
            }
            print("  no link under \(label)"); return false
        }
        /// The details popover's own view, rendered at the snapshot scale.
        func popover(_ name: String) throws -> [Line] {
            guard let view = model.details.contentView else { print("  no details popover is open"); return [] }
            view.layoutSubtreeIfNeeded(); view.displayIfNeeded()
            let bounds = view.bounds
            let rep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: Int(bounds.width) * 2, pixelsHigh: Int(bounds.height) * 2, bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
            rep.size = bounds.size
            view.cacheDisplay(in: bounds, to: rep)
            // The popover window draws the material behind this view, so the
            // capture is flattened onto the window background before reading:
            // transparent pixels would otherwise read as black.
            let flat = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: rep.pixelsWide, pixelsHigh: rep.pixelsHigh, bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
            flat.size = bounds.size
            NSGraphicsContext.saveGraphicsState()
            NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: flat)
            view.effectiveAppearance.performAsCurrentDrawingAppearance {
                NSColor.windowBackgroundColor.setFill(); NSRect(origin: .zero, size: bounds.size).fill()
            }
            rep.draw(in: NSRect(origin: .zero, size: bounds.size), from: .zero, operation: .sourceOver, fraction: 1, respectFlipped: true, hints: nil)
            NSGraphicsContext.restoreGraphicsState()
            let url = out.appendingPathComponent(name + ".png")
            try flat.representation(using: .png, properties: [:])!.write(to: url)
            print("SNAPSHOT: \(url.path)")
            let lines = try read(flat)
            print("  popover text: " + lines.map(\.text).joined(separator: " | "))
            return lines
        }
        func closePopover() async throws {
            model.details.close()
            try await settle(4, "the details popover to close") { model.details.contentView == nil }
        }
        func textView(_ view: NSView) -> NSTextView? {
            if let text = view as? NSTextView, text.accessibilityIdentifier() == "message-composer" { return text }
            for child in view.subviews { if let found = textView(child) { return found } }
            return nil
        }

        // 1. Home: the switch is present and off, with the plain local hint.
        try await settle(12, "the Home screen") { model.snapshot != nil && model.selectedID == "home" && model.composer.ready }
        try await pause(0.8)
        var lines = try read(try snapshot("01-home-idle"))
        check(visible("Think longer", lines), "Home composer shows the Think longer switch")
        check(visible("Local on this Mac", lines), "Home hint stays plain while thinking is off")

        // 2. A new thread starts with thinking off.
        model.newThread()
        try await settle(12, "a new thread") { model.selectedID != "home" && model.thread != nil && model.composer.ready }
        try await pause(0.8)
        lines = try read(try snapshot("02-thread-thinking-off"))
        check(!model.thinkingEnabled && visible("Think longer", lines), "a new thread starts with Think longer off")

        // 3. Clicking the switch turns thinking on for this thread and changes the hint.
        let clicked1 = try await clickLabel("Think longer"); check(clicked1, "Think longer is clickable")
        try await settle(6, "thinking to turn on") { model.thinkingEnabled }
        try await pause(0.6)
        lines = try read(try snapshot("03-thread-thinking-on"))
        check(model.thread?.thinking == true, "the thread remembers the switch")
        check(visible("Thinks before answering", lines), "the hint explains the switch while it is on")

        // 4. Typing into the real composer and clicking Send starts a visible thought.
        guard let composer = textView(host) else { print("FAIL: composer text view not found"); exit(1) }
        window.makeFirstResponder(composer)
        composer.insertText("A train leaves at 9:40 and the trip takes 2 hours 35 minutes. When does it arrive?", replacementRange: composer.selectedRange())
        try await settle(6, "the draft to be sendable") { model.composer.canSend }
        try await pause(0.4)
        let clicked2 = try await clickLabel("Send"); check(clicked2, "Send is clickable")
        try await settle(20, "a live thought") { (model.liveThinking?.active ?? false) && (model.liveThinking?.text.count ?? 0) > 120 }
        try await pause(0.3)
        check(model.thread?.run?.status.hasPrefix("Thinking… ") == true, "run status shows Thinking with a clock: \(model.thread?.run?.status ?? "")")
        lines = try read(render())
        check(visible("Thinking", lines) && visible("Answer now", lines), "Thinking status and Answer now are visible while the thought runs")
        lines = try read(try snapshot("04-thinking-live"))
        check(!visible("Working notes (thinking)", lines), "the collapsed notes box is gone")
        check(model.liveThinking?.active == true && ["arrives", "Departure", "noon", "same day", "hours first"].contains { visible($0, lines) }, "the last lines of the thought are visible while it runs")
        guard let anchor = model.details.anchor("thought") else { print("FAIL: the thought preview is not on screen"); exit(1) }
        let previewFrame = anchor.convert(anchor.bounds, to: nil)
        check(previewFrame.height > 20 && previewFrame.height < 70, "the preview keeps to a few lines: \(Int(previewFrame.height)) points")
        try await click(NSPoint(x: previewFrame.midX, y: previewFrame.midY))
        try await settle(6, "the details popover") { model.details.contentView != nil }
        try await pause(0.6)
        lines = try popover("05-details-while-thinking")
        check(visible("Response details", lines) && visible("Thinking", lines), "clicking the preview opens the response's details")
        check(visible("Departure is 9:40", lines) || visible("the answer stays", lines), "the details show the streaming working notes")
        check(visible("not saved or remembered", lines), "the working notes state their privacy")
        try await closePopover()
        // A longer thought keeps to the same few lines, fading at the top.
        try await settle(20, "a longer thought") { (model.liveThinking?.text.count ?? 0) > 700 }
        try await pause(0.3)
        lines = try read(try snapshot("05b-thinking-long"))
        let longFrame = model.details.anchor("thought").map { $0.convert($0.bounds, to: nil) } ?? .zero
        check(model.liveThinking?.active == true && longFrame.height > 30 && longFrame.height < 70, "a long thought stays within the preview's few lines: \(Int(longFrame.height)) points")

        // 5. Answer now ends the thought; the answer appears with its thinking line.
        let clicked4 = try await clickLabel("Answer now"); check(clicked4, "Answer now is clickable")
        try await settle(30, "the run to finish") { model.thread?.run?.state.terminal == true }
        try await pause(0.8)
        let receipt = model.thread?.run?.thinking
        check(receipt?.ending == .answerNow, "the run records an Answer now receipt: \(receipt?.line ?? "none")")
        check(model.thread?.run?.state == .completed && (model.snapshot?.home.conversationMessages(for: model.thread!).last?.text.contains("12:15") ?? false), "the answer arrived after Answer now")
        check(model.thread?.run?.metrics?.answerTokens ?? 0 > 0, "the run recorded its numbers")
        lines = try read(try snapshot("06-answered"))
        check(visible("Thought for", lines) && visible("then answered when you asked", lines), "the reply shows how long Sevra thought, above the answer")
        check(!visible("Answer now", lines) && !visible("tok/s", lines), "Answer now is gone and no speed line shows while details are off")
        check(visible("Recently about", lines), "the composer hint now quotes a typical thinking time")

        // 6. The thinking line opens the same details, now with the receipt and numbers.
        let clicked5 = try await clickTextLabel("Thought for"); check(clicked5, "the thinking line is clickable")
        try await settle(6, "the details popover") { model.details.contentView != nil }
        try await pause(0.6)
        lines = try popover("07-details-after")
        check(visible("then answered when you asked", lines), "the details state how thinking ended")
        check(visible("Speed", lines) && visible("tokens per second", lines) && visible("First token", lines), "the details show the recorded speed")
        check(visible("Departure is 9:40", lines) || visible("the answer stays", lines), "the working notes remain while Sevra is open")
        try await closePopover()

        // 7. The optional speed line: off by default, on from the same control people use.
        model.toggleResponseDetails()
        try await pause(0.8)
        lines = try read(try snapshot("08-speed-line"))
        check(model.showResponseDetails && visible("tok/s", lines) && visible("to first token", lines), "turning details on adds the speed line under the reply")
        let clicked6 = try await clickTextLabel("tok/s"); check(clicked6, "the speed line is clickable")
        try await settle(6, "the details popover") { model.details.contentView != nil }
        try await pause(0.5)
        lines = try popover("09-details-from-speed-line")
        check(visible("Writing", lines) && visible("Written", lines), "the speed line opens the full numbers")
        try await closePopover()

        // 8. Dark appearance renders the same state, popover included.
        window.appearance = NSAppearance(named: .darkAqua)
        try await pause(0.8)
        lines = try read(try snapshot("10-speed-line-dark"))
        check(visible("tok/s", lines) && visible("Thought for", lines), "dark appearance keeps both lines readable")
        let clicked7 = try await clickTextLabel("Thought for"); check(clicked7, "the thinking line is clickable in dark appearance")
        try await settle(6, "the details popover") { model.details.contentView != nil }
        try await pause(0.5)
        lines = try popover("11-details-dark")
        check(visible("Response details", lines), "the details render in dark appearance")
        try await closePopover()
        window.appearance = NSAppearance(named: .aqua)
        try await pause(0.4)

        // 9. The switch turns off again from the same control.
        let clicked8 = try await clickLabel("Think longer"); check(clicked8, "Think longer is clickable again")
        try await settle(6, "thinking to turn off") { !model.thinkingEnabled }
        try await pause(0.6)
        lines = try read(render())
        check(model.thread?.thinking != true && visible("Local on this Mac", lines), "clicking again turns thinking off and restores the plain hint (thinking=\(String(describing: model.thread?.thinking)))")

        // 10. A plain reply with details on: live speed while it writes, then its own line and no thinking line.
        window.makeFirstResponder(composer)
        composer.insertText("Thanks!", replacementRange: composer.selectedRange())
        try await settle(6, "the draft to be sendable") { model.composer.canSend }
        let clicked9 = try await clickLabel("Send"); check(clicked9, "Send is clickable for a plain reply")
        try await settle(20, "a live writing speed") { model.liveGeneration?.rate != nil && model.thread?.run?.state.terminal == false }
        try await pause(0.3)
        lines = try read(try snapshot("12-live-speed"))
        check(visible("tok/s", lines) && (model.liveGeneration?.thinking == false), "the status shows the live writing speed")
        try await settle(30, "the plain run to finish") { model.thread?.run?.state.terminal == true }
        try await pause(0.8)
        lines = try read(try snapshot("13-plain-reply"))
        check(model.thread?.run?.thinking == nil && model.thread?.run?.metrics != nil, "the plain run has numbers and no thought")
        model.toggleResponseDetails()
        try await pause(0.6)
        lines = try read(render())
        check(!model.showResponseDetails && !visible("tok/s", lines) && visible("Thought for", lines), "turning details off removes the speed lines and keeps the thinking line")

        window.orderOut(nil)
        window.contentView = nil
        print(failures == 0 ? "PASS: thinking controls render and respond in the production Mac views" : "FAIL: \(failures) checks failed")
        exit(failures == 0 ? 0 : 1)
    }
}
