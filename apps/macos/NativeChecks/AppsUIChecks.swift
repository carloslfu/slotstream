import AppKit
import SwiftUI
import CoreText
import Combine
import Vision
import WebKit
@testable import SevraMac
import SevraRuntime
import SevraPresentation

/// Offscreen checks of the mini-app host and the review views.
///
/// Part one loads a hostile page into the production app host and proves it
/// reaches no network: a loopback listener counts every connection attempt,
/// and the page reports what its own fetch, socket, beacon, popup and peer
/// connection calls could do. Part two runs the real `ContentView` over a
/// scripted engine and clicks through a file-change review with undo, then an
/// app review, activation and first data write. Web content is read through
/// script evaluation, since a web view draws out of process. Snapshots go to
/// `SEVRA_UI_OUT`. Run it with `Tools/check_sevra_apps_ui.sh`.
final class LoopbackListener: @unchecked Sendable {
    let port: UInt16
    private let fd: Int32
    private let lock = NSLock()
    private var accepted: [String] = []
    var connections: [String] { lock.lock(); defer { lock.unlock() }; return accepted }
    init() {
        let socketFD = socket(AF_INET, SOCK_STREAM, 0)
        var yes: Int32 = 1
        setsockopt(socketFD, SOL_SOCKET, SO_REUSEADDR, &yes, socklen_t(MemoryLayout<Int32>.size))
        var address = sockaddr_in()
        address.sin_len = UInt8(MemoryLayout<sockaddr_in>.size); address.sin_family = sa_family_t(AF_INET); address.sin_addr.s_addr = inet_addr("127.0.0.1")
        _ = withUnsafePointer(to: &address) { $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { bind(socketFD, $0, socklen_t(MemoryLayout<sockaddr_in>.size)) } }
        listen(socketFD, 16)
        var bound = sockaddr_in(), length = socklen_t(MemoryLayout<sockaddr_in>.size)
        _ = withUnsafeMutablePointer(to: &bound) { $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { getsockname(socketFD, $0, &length) } }
        fd = socketFD
        port = UInt16(bigEndian: bound.sin_port)
        Thread.detachNewThread { [weak self] in
            while true {
                let client = accept(socketFD, nil, nil)
                if client < 0 { return }
                var buffer = [UInt8](repeating: 0, count: 512)
                let n = read(client, &buffer, buffer.count)
                let line = n > 0 ? String(decoding: buffer.prefix(n), as: UTF8.self).split(separator: "\r\n").first.map(String.init) ?? "" : ""
                self?.lock.lock(); self?.accepted.append(line); self?.lock.unlock()
                close(client)
            }
        }
    }
    func stop() { close(fd) }
}

/// Counts datagrams, such as the STUN requests a peer connection sends.
final class DatagramListener: @unchecked Sendable {
    let port: UInt16
    private let fd: Int32
    private let lock = NSLock()
    private var count = 0
    var datagrams: Int { lock.lock(); defer { lock.unlock() }; return count }
    init() {
        let socketFD = socket(AF_INET, SOCK_DGRAM, 0)
        var address = sockaddr_in()
        address.sin_len = UInt8(MemoryLayout<sockaddr_in>.size); address.sin_family = sa_family_t(AF_INET); address.sin_addr.s_addr = inet_addr("127.0.0.1")
        _ = withUnsafePointer(to: &address) { $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { bind(socketFD, $0, socklen_t(MemoryLayout<sockaddr_in>.size)) } }
        var bound = sockaddr_in(), length = socklen_t(MemoryLayout<sockaddr_in>.size)
        _ = withUnsafeMutablePointer(to: &bound) { $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { getsockname(socketFD, $0, &length) } }
        fd = socketFD
        port = UInt16(bigEndian: bound.sin_port)
        Thread.detachNewThread { [weak self] in
            var buffer = [UInt8](repeating: 0, count: 2048)
            while true {
                let n = recv(socketFD, &buffer, buffer.count, 0)
                if n < 0 { return }
                self?.lock.lock(); self?.count += 1; self?.lock.unlock()
            }
        }
    }
    func stop() { close(fd) }
}

/// Reads WebKit's own feature state back, independently of the host code.
@MainActor func featuresOff(_ preferences: WKPreferences, _ keys: [String]) -> [String: Bool] {
    let listSelector = NSSelectorFromString("_features"), getSelector = NSSelectorFromString("_isEnabledForFeature:")
    guard preferences.responds(to: getSelector),
          let features = (WKPreferences.self as AnyObject).perform(listSelector)?.takeUnretainedValue() as? [NSObject] else { return [:] }
    typealias Getter = @convention(c) (AnyObject, Selector, AnyObject) -> Bool
    let get = unsafeBitCast(preferences.method(for: getSelector), to: Getter.self)
    var result: [String: Bool] = [:]
    for feature in features {
        if let key = feature.value(forKey: "key") as? String, keys.contains(key) { result[key] = !get(preferences, getSelector, feature) }
    }
    return result
}

/// Records what a page stored while answering with the real app protocol.
final class RecordingBroker: @unchecked Sendable {
    private let lock = NSLock()
    private var created: [[String: Any]] = []
    let data: AppPreviewData
    init(collections: [AppCollection]) {
        data = AppPreviewData(name: "Probe", collections: collections)
    }
    var records: [[String: Any]] { lock.lock(); defer { lock.unlock() }; return created }
    func handle(_ request: Data) -> Data {
        if let body = try? JSONSerialization.jsonObject(with: request) as? [String: Any], body["op"] as? String == "create",
           body["collection"] as? String == "probe", let value = body["data"] as? [String: Any] {
            lock.lock(); created.append(value); lock.unlock()
        }
        return data.request(request)
    }
}

@main struct AppsUIChecks {
    @MainActor static func main() async throws {
        setvbuf(stdout, nil, _IOLBF, 0)
        _ = NSApplication.shared
        NSApp.setActivationPolicy(.prohibited)
        let env = ProcessInfo.processInfo.environment
        let out = URL(fileURLWithPath: env["SEVRA_UI_OUT"] ?? FileManager.default.temporaryDirectory.appendingPathComponent("sevra-apps-ui").path)
        try FileManager.default.createDirectory(at: out, withIntermediateDirectories: true)
        let fonts = URL(fileURLWithPath: env["SEVRA_FONTS"] ?? "apps/macos/Resources/Fonts")
        for name in ["Inter", "Poppins-Medium"] {
            CTFontManagerRegisterFontsForURL(fonts.appendingPathComponent(name + ".ttf") as CFURL, .process, nil)
        }
        var failures = 0
        func check(_ condition: Bool, _ message: String) {
            if condition { print("PASS: \(message)") } else { failures += 1; print("FAIL: \(message)") }
        }
        func wait(_ seconds: Double, _ what: String, _ predicate: () async -> Bool) async throws {
            let deadline = Date().addingTimeInterval(seconds)
            while Date() < deadline {
                if await predicate() { return }
                try await Task.sleep(nanoseconds: 50_000_000)
            }
            throw NSError(domain: "AppsUIChecks", code: 1, userInfo: [NSLocalizedDescriptionKey: "Timed out waiting for " + what])
        }
        func offscreen(_ size: NSSize) -> NSWindow {
            let window = NSWindow(contentRect: NSRect(origin: .zero, size: size), styleMask: [.borderless], backing: .buffered, defer: false)
            window.appearance = NSAppearance(named: .aqua)
            window.setFrameOrigin(NSPoint(x: -30000, y: -30000))
            window.orderFront(nil)
            if NSScreen.screens.contains(where: { $0.frame.intersects(window.frame) }) || window.occlusionState.contains(.visible) {
                print("FAIL: the check window would be visible on a display; stopping"); window.orderOut(nil); exit(1)
            }
            return window
        }
        func evaluate(_ view: WKWebView?, _ script: String) async -> Any? {
            guard let view else { return nil }
            return try? await view.evaluateJavaScript(script, contentWorld: .page)
        }

        // MARK: 0. a counter app a model built, when one is named

        // SEVRA_APP_UNDER_TEST names an app's index.html and SEVRA_APP_DATA its
        // collections. The app runs twice in the production host over one
        // scratch store: plus is clicked three times, then the reopened app
        // must show 3 and the store must hold a single record.
        if let path = env["SEVRA_APP_UNDER_TEST"] {
            let html = try String(contentsOfFile: path, encoding: .utf8)
            let collections = try AppCollection.parse(env["SEVRA_APP_DATA"] ?? "")
            let store = AppPreviewData(name: "Under test", collections: collections)
            func open(_ label: String) async throws -> (MiniAppController, NSWindow, WKWebView) {
                let controller = MiniAppController(session: MiniAppSession(appID: "under-test", version: 1, name: "Under test", html: html, collections: collections, preview: false),
                                                   broker: { store.request($0) }, onLink: { _ in })
                let window = offscreen(NSSize(width: 800, height: 600))
                await controller.load()
                guard let view = controller.webView else { print("FAIL: the \(label) app view did not load: \(controller.failure ?? "")"); exit(1) }
                window.contentView = view
                try await wait(15, "the \(label) app to load") { (await evaluate(view, "document.readyState") as? String) == "complete" }
                try await Task.sleep(nanoseconds: 1_500_000_000)
                return (controller, window, view)
            }
            let plus = "(() => { const b = [...document.querySelectorAll('button')].find((x) => /^\\s*[+＋]\\s*$/.test(x.textContent) || /increase|increment|plus|add one/i.test(x.getAttribute('aria-label') || x.title || '')); if (!b) return false; b.click(); return true; })()"
            var (controller, window, view) = try await open("first")
            var clicked = 0
            for _ in 0..<3 {
                if (await evaluate(view, plus) as? Bool) == true { clicked += 1 }
                try await Task.sleep(nanoseconds: 600_000_000)
            }
            check(clicked == 3, "the app has a plus button that can be clicked three times")
            let firstText = (await evaluate(view, "document.body.innerText") as? String) ?? ""
            check(firstText.contains("3"), "the app shows 3 after three clicks")
            controller.close(); window.contentView = nil; window.orderOut(nil)
            (controller, window, view) = try await open("reopened")
            let reopenedText = (await evaluate(view, "document.body.innerText") as? String) ?? ""
            let listed = collections.reduce(0) { total, collection in
                let reply = try? JSONSerialization.jsonObject(with: store.request(Data(#"{"op":"list","collection":"\#(collection.name)"}"#.utf8))) as? [String: Any]
                return total + ((reply?["result"] as? [Any])?.count ?? 0)
            }
            check(reopenedText.contains("3"), "the reopened app still shows 3 (\(reopenedText.split(separator: "\n").joined(separator: " | ")))")
            check(listed == 1, "the app kept one record instead of creating one per opening (\(listed))")
            controller.close(); window.contentView = nil; window.orderOut(nil)
            print(failures == 0 ? "PASS: the app under test keeps its count across reopening" : "FAIL: \(failures) checks failed")
            exit(failures == 0 ? 0 : 1)
        }

        // MARK: 1. host isolation

        let listener = LoopbackListener()
        let datagrams = DatagramListener()
        let target = "http://127.0.0.1:\(listener.port)"
        let hostile = """
        <!doctype html><html><head><meta charset="utf-8"><title>Probe</title>
        <link rel="stylesheet" href="\(target)/style.css"><link rel="dns-prefetch" href="\(target)/"><link rel="preconnect" href="\(target)/">
        <style>body { background: url(\(target)/background.png); } @font-face { font-family: X; src: url(\(target)/font.woff); }</style>
        <script src="\(target)/script.js"></script>
        </head><body><p id="status">Probe running</p>
        <img src="\(target)/image.png"><iframe src="\(target)/frame"></iframe><iframe srcdoc="<p>inner</p>" id="inner"></iframe>
        <video src="\(target)/video.mp4" autoplay muted></video>
        <form id="form" action="\(target)/form" method="post"><input name="x" value="1"></form>
        <a id="link" href="\(target)/link" ping="\(target)/ping">link</a>
        <link rel="icon" href="\(target)/favicon.ico"><link rel="prefetch" href="\(target)/prefetch"><link rel="preload" as="fetch" href="\(target)/preload">
        <script>
        window.addEventListener('sevra-change', (event) => { window.lastChange = event.detail.collection; });
        (async () => {
          const report = {};
          const attempt = async (name, run) => { try { await run(); report[name] = 'allowed'; } catch (error) { report[name] = 'blocked'; } };
          await attempt('fetch', () => fetch('\(target)/fetch'));
          await attempt('fetchSelf', () => fetch('sevra-app://app/other'));
          await attempt('xhr', () => new Promise((ok, fail) => { const x = new XMLHttpRequest(); x.open('GET', '\(target)/xhr'); x.onload = ok; x.onerror = fail; x.send(); }));
          await attempt('websocket', () => new Promise((ok, fail) => { const w = new WebSocket('ws://127.0.0.1:\(listener.port)/ws'); w.onopen = ok; w.onerror = fail; setTimeout(fail, 1500); }));
          await attempt('eventsource', () => new Promise((ok, fail) => { const s = new EventSource('\(target)/sse'); s.onopen = ok; s.onerror = fail; setTimeout(fail, 1500); }));
          await attempt('worker', () => new Promise((ok, fail) => { const w = new Worker('\(target)/worker.js'); w.onerror = fail; setTimeout(ok, 800); }));
          report.beacon = navigator.sendBeacon ? String(navigator.sendBeacon('\(target)/beacon', 'x')) : 'none';
          report.rtc = typeof RTCPeerConnection;
          try { const frame = document.getElementById('inner'); report.innerRtc = frame.contentWindow ? typeof frame.contentWindow.RTCPeerConnection : 'no window'; } catch (error) { report.innerRtc = 'denied'; }
          const peer = async (Constructor) => {
            if (typeof Constructor !== 'function') return 'unavailable';
            try {
              const connection = new Constructor({ iceServers: [{ urls: 'stun:127.0.0.1:\(datagrams.port)' }] });
              connection.createDataChannel('probe');
              await connection.setLocalDescription(await connection.createOffer());
              await new Promise((done) => setTimeout(done, 1500));
              return 'created';
            } catch (error) { return 'failed'; }
          };
          const fresh = document.createElement('iframe');
          document.body.appendChild(fresh);
          report.freshRtc = await peer(fresh.contentWindow && fresh.contentWindow.RTCPeerConnection);
          report.popup = String(window.open('\(target)/popup') !== null);
          report.stored = localStorage.getItem('probe');
          localStorage.setItem('probe', 'kept');
          report.info = JSON.stringify(await sevra.info());
          try { await sevra.create('secrets', { x: 1 }); report.undeclared = 'allowed'; } catch (error) { report.undeclared = error.code; }
          report.overwrite = (() => { try { window.sevra = null; return String(window.sevra === null); } catch (error) { return 'refused'; } })();
          const created = await sevra.create('probe', { report: JSON.stringify(report) });
          window.probeReport = report;
          document.getElementById('status').textContent = 'Probe finished ' + created.id;
          try { document.getElementById('form').submit(); } catch (error) {}
          document.getElementById('link').click();
          setTimeout(() => { location.href = '\(target)/away'; }, 50);
          setTimeout(() => { const meta = document.createElement('meta'); meta.httpEquiv = 'refresh'; meta.content = '0; url=\(target)/refresh'; document.head.appendChild(meta); }, 100);
        })();
        </script></body></html>
        """
        let collections = [AppCollection(name: "probe", access: .write)]
        var links: [URL] = []
        func probe(_ label: String) async throws -> [String: Any] {
            let broker = RecordingBroker(collections: collections)
            let controller = MiniAppController(session: MiniAppSession(appID: "probe", version: 1, name: "Probe", html: hostile, collections: collections, preview: false),
                                               broker: { broker.handle($0) }, onLink: { links.append($0) })
            let window = offscreen(NSSize(width: 800, height: 600))
            await controller.load()
            guard let view = controller.webView else { throw NSError(domain: "AppsUIChecks", code: 2, userInfo: [NSLocalizedDescriptionKey: "the app view did not load"]) }
            window.contentView = view
            try await wait(15, "the \(label) probe to report") { broker.records.count >= 1 }
            try await Task.sleep(nanoseconds: 2_500_000_000)
            let json = (broker.records.first?["report"] as? String) ?? "{}"
            var report = (try? JSONSerialization.jsonObject(with: Data(json.utf8)) as? [String: Any]) ?? [:]
            report["url"] = view.url?.absoluteString ?? ""
            report["switchesOff"] = featuresOff(view.configuration.preferences, ["PeerConnectionEnabled", "LinkPreconnect", "LinkDNSPrefetchEnabled"])
            controller.notifyChange(collection: "probe")
            controller.notifyChange(collection: "secrets")
            try await Task.sleep(nanoseconds: 300_000_000)
            report["lastChange"] = await evaluate(view, "window.lastChange || ''") ?? ""
            report["records"] = broker.records.count
            controller.close()
            window.contentView = nil; window.orderOut(nil)
            return report
        }
        let first = try await probe("first")
        print("  report: \(first)")
        check(listener.connections.isEmpty, "the page made no network connection (attempts seen: \(listener.connections))")
        check((first["switchesOff"] as? [String: Bool]) == ["PeerConnectionEnabled": true, "LinkPreconnect": true, "LinkDNSPrefetchEnabled": true],
              "WebKit reports peer connections, link preconnects and DNS prefetching off (\(first["switchesOff"] ?? "unreadable"))")
        for name in ["fetch", "fetchSelf", "xhr", "websocket", "eventsource"] {
            check(first[name] as? String == "blocked", "\(name) is blocked")
        }
        print("  sendBeacon queued: \(first["beacon"] ?? "")")
        check(first["rtc"] as? String == "undefined", "peer connections are unavailable")
        check(datagrams.datagrams == 0, "no peer connection sent a datagram (\(datagrams.datagrams) seen; fresh frame: \(first["freshRtc"] ?? ""), srcdoc frame: \(first["innerRtc"] ?? ""))")
        check(first["popup"] as? String == "false", "the page cannot open windows")
        check(first["undeclared"] as? String == "denied", "an undeclared collection is refused")
        check(first["overwrite"] as? String != "true", "the page cannot replace the Sevra API")
        check((first["info"] as? String)?.contains("\"probe\"") == true, "info reports only the declared collection")
        check(first["url"] as? String == "sevra-app://app/index.html", "navigation away is refused (at \(first["url"] ?? ""))")
        check(first["lastChange"] as? String == "probe", "the page hears changes to its own collection only")
        check(first["records"] as? Int == 1, "the declared write reached the broker once")
        let second = try await probe("second")
        check(second["stored"] is NSNull || second["stored"] == nil, "browser storage does not outlive the app view (\(second["stored"] ?? "nil"))")
        try await Task.sleep(nanoseconds: 2_000_000_000)
        check(listener.connections.isEmpty, "a second run and both teardowns made no network connection (attempts seen: \(listener.connections))")
        print("  links offered to the person: \(links.map(\.absoluteString))")
        check(datagrams.datagrams == 0, "a second run sent no datagram either")
        listener.stop(); datagrams.stop()

        // MARK: 2. review flows in the production views

        let home = out.appendingPathComponent("home")
        try? FileManager.default.removeItem(at: home)
        let folder = out.appendingPathComponent("Plans")
        try? FileManager.default.removeItem(at: folder)
        try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
        let plan = folder.appendingPathComponent("plan.md")
        let original = "# Launch plan\n\nOwner: Maya\nStatus: draft\nRegion: north\n"
        try Data(original.utf8).write(to: plan)
        let app = """
        <!doctype html><html><head><meta charset="utf-8"><title>Habits</title>
        <style>body{font:16px -apple-system,system-ui;margin:24px;color:#222;background:#fff}@media (prefers-color-scheme: dark){body{color:#eee;background:#1b1b19}}</style>
        </head><body><h1>Habit tracker</h1><ul id="list"></ul>
        <script>
        async function load() {
          const items = await sevra.list('habits');
          document.getElementById('list').replaceChildren(...items.map((item) => { const li = document.createElement('li'); li.textContent = item.data.name; return li; }));
          return items;
        }
        window.addEventListener('sevra-change', load);
        load().then((items) => { if (items.length === 0) return sevra.create('habits', { name: 'Walk every morning' }).then(load); });
        </script></body></html>
        """
        // The pattern a local model wrote in a real run: it looks for a record
        // id it chose itself, creates one on every load when that fails, and
        // reloads on every change. Its own saves must not feed it.
        let selfFeeding = """
        <!doctype html><html><head><meta charset="utf-8"><title>Tally</title></head><body><p id="n">0</p>
        <script>
        async function load() {
          const rows = await sevra.list('tally');
          if (!rows.find((row) => row.id === 'count')) { await sevra.create('tally', { count: 0 }); }
          document.getElementById('n').textContent = String(rows.length);
        }
        window.addEventListener('sevra-change', load);
        load();
        </script></body></html>
        """
        let dbmd = URL(fileURLWithPath: env["SEVRA_DBMD"] ?? NSHomeDirectory() + "/.dbmd/bin/dbmd")
        let engine = ScriptedInference(turns: [
            EngineTurn(text: "", calls: [ProposedTool(name: "source.read", arguments: ["path": .string("plan.md")])]),
            EngineTurn(text: "", calls: [ProposedTool(name: "file.edit", arguments: ["id": .string("a1:plan.md"), "old": .string("Status: draft"), "new": .string("Status: approved")])]),
            EngineTurn(text: "I marked the plan approved. Review the change before it is written."),
            EngineTurn(text: "Here is a habit tracker.", calls: [ProposedTool(name: "app.propose", arguments: ["name": .string("Habits"), "description": .string("Track daily habits."),
                                                                                                          "data": .string("habits:write"), "html": .string(app)])]),
            EngineTurn(text: "Here is a streak view.", calls: [ProposedTool(name: "app.propose", arguments: ["name": .string("Streaks"), "description": .string("Show habit streaks."),
                                                                                                        "data": .string("habits:read"), "html": .string(app.replacingOccurrences(of: "Habit tracker", with: "Streaks"))])]),
            EngineTurn(text: "Here is a tally.", calls: [ProposedTool(name: "app.propose", arguments: ["name": .string("Tally"), "description": .string("Keep a tally."),
                                                                                                  "data": .string("tally:write"), "html": .string(selfFeeding)])]),
        ], delayNanoseconds: 2_000_000)
        guard let helper = env["SEVRA_EXTRACT"].map(URL.init(fileURLWithPath:)) else { print("FAIL: set SEVRA_EXTRACT"); exit(1) }
        let runtime = try SevraRuntime(homeURL: home, dbmd: dbmd, inference: engine, helper: helper)
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
        let window = offscreen(size)
        let host = NSHostingView(rootView: ContentView(model: model))
        window.contentView = host
        func pause(_ seconds: Double) async throws {
            let deadline = Date().addingTimeInterval(seconds)
            while Date() < deadline { host.layoutSubtreeIfNeeded(); try await Task.sleep(nanoseconds: 20_000_000) }
        }
        func settle(_ seconds: Double, _ what: String, _ predicate: () -> Bool) async throws {
            try await wait(seconds, what) { host.layoutSubtreeIfNeeded(); return predicate() }
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
        func locate(_ label: String, in lines: [Line]) -> NSPoint? {
            for line in lines {
                guard let range = line.text.range(of: label, options: .caseInsensitive) else { continue }
                let box = ((try? line.candidate.boundingBox(for: range)) ?? nil)?.boundingBox ?? line.box
                return NSPoint(x: box.midX * size.width, y: box.midY * size.height)
            }
            return nil
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
        func clickLabel(_ label: String) async throws -> Bool {
            guard let point = locate(label, in: try read(render())) else { print("  label not visible: \(label)"); return false }
            print("  click \(label) at (\(Int(point.x)), \(Int(point.y)))")
            try await click(point)
            return true
        }
        func textView(_ view: NSView) -> NSTextView? {
            if let text = view as? NSTextView, text.accessibilityIdentifier() == "message-composer" { return text }
            for child in view.subviews { if let found = textView(child) { return found } }
            return nil
        }
        func type(_ text: String) async throws {
            guard let composer = textView(host) else { print("FAIL: composer text view not found"); exit(1) }
            window.makeFirstResponder(composer)
            composer.insertText(text, replacementRange: composer.selectedRange())
            try await settle(6, "the draft to be sendable") { model.composer.canSend }
            try await pause(0.3)
        }

        // A thread with a changeable folder.
        try await settle(12, "the Home screen") { model.snapshot != nil && model.composer.ready }
        model.newThread()
        try await settle(12, "a new thread") { model.selectedID != "home" && model.thread != nil && model.composer.ready }
        let thread = model.selectedID
        let attached = try await runtime.attach(threadID: thread, folder: folder)
        try await runtime.setAccess(threadID: thread, attachmentID: attached.id, access: .change)
        await model.refresh()
        try await pause(0.8)
        var lines = try read(try snapshot("01-folder-attached"))
        check(visible("Plans", lines) && visible("Can change", lines), "the attached folder shows as a chip that can change")

        try await type("Mark the plan approved")
        let sent = try await clickLabel("Send"); check(sent, "Send is clickable")
        try await settle(20, "the change review") { model.thread?.run?.state == .needsYou && model.thread?.run?.changes != nil }
        try await pause(0.8)
        lines = try read(try snapshot("02-changes-waiting"))
        check(visible("Review changes", lines), "the run offers Review changes")
        check((try String(contentsOf: plan, encoding: .utf8)) == original, "nothing is written while the review waits")
        let reviewed = try await clickLabel("Review changes"); check(reviewed, "Review changes is clickable")
        try await settle(6, "the changes panel") { model.panel == "Changes" }
        try await pause(0.8)
        lines = try read(try snapshot("03-changes-review"))
        check(visible("Status: approved", lines) && visible("Status: draft", lines), "the review shows the removed and added lines")
        check(visible("Write 1 File", lines) && visible("Discard", lines), "the review offers Write and Discard")
        window.appearance = NSAppearance(named: .darkAqua)
        try await pause(0.6)
        _ = try snapshot("03-changes-review-dark")
        window.appearance = NSAppearance(named: .aqua)
        try await pause(0.4)
        let wrote = try await clickLabel("Write 1 File"); check(wrote, "Write 1 File is clickable")
        try await settle(10, "the file to change") { (try? String(contentsOf: plan, encoding: .utf8))?.contains("Status: approved") == true }
        try await settle(6, "the written state") { model.reviewedChanges?.state == .applied }
        try await pause(0.8)
        lines = try read(try snapshot("04-changes-written"))
        check(visible("Changes written", lines) && visible("Undo Changes", lines), "after writing, the panel offers Undo")
        model.closePanel()

        // An app, reviewed with scratch data, then turned on.
        model.newThread()
        try await settle(12, "an app thread") { model.selectedID != thread && model.thread != nil && model.composer.ready }
        try await type("Build a habit tracker mini-app")
        let sentApp = try await clickLabel("Send"); check(sentApp, "Send is clickable for the app request")
        try await settle(20, "the app review") { model.thread?.run?.appProposal != nil }
        try await pause(0.6)
        let reviewApp = try await clickLabel("Review app"); check(reviewApp, "Review app is clickable")
        try await settle(10, "the app preview") { model.panel == "App review" && model.appPreview?.webView != nil }
        try await wait(10, "the preview to draw its data") {
            (await evaluate(model.appPreview?.webView, "document.body.innerText") as? String)?.contains("Walk every morning") == true
        }
        check(true, "the preview runs the app against scratch data")
        let previewCount = await runtime.appRecordCount(collection: "habits")
        check(previewCount == 0, "the preview wrote nothing to Home")
        try await pause(0.6)
        lines = try read(try snapshot("05-app-review"))
        check(visible("Turn On App", lines) && visible("habits", lines), "the review shows the data access and Turn On App")
        let turnedOn = try await clickLabel("Turn On App"); check(turnedOn, "Turn On App is clickable")
        try await settle(15, "the app to open") { model.panel == "App" && model.runningApp?.webView != nil }
        try await wait(15, "the app's first saved record") { await runtime.appRecordCount(collection: "habits") == 1 }
        try await wait(10, "the app to show its saved record") {
            (await evaluate(model.runningApp?.webView, "document.body.innerText") as? String)?.contains("Walk every morning") == true
        }
        check(true, "the approved app saved and shows a Home record")
        try await pause(0.6)
        lines = try read(try snapshot("06-app-open"))
        check(visible("Offline", lines) && visible("Habits", lines), "the app canvas names the app and its offline boundary")
        model.panel = "Apps"
        try await pause(0.8)
        lines = try read(try snapshot("07-apps-and-skills"))
        // Text recognition can read a command's leading slash as a letter, "/app"
        // as "lapp" on a CI runner's rendering, so the built-in skills are found
        // by their descriptions.
        check(visible("Apps & Skills", lines) && visible("Open", lines) && visible("Create or change a small app", lines)
              && visible("Turn a repeatable workflow into a skill", lines), "Apps & Skills lists the app and the built-in skills")
        window.appearance = NSAppearance(named: .darkAqua)
        try await pause(0.6)
        _ = try snapshot("07-apps-and-skills-dark")
        window.appearance = NSAppearance(named: .aqua)

        // A second app that asks for the same collection shows what is already saved there.
        let appThread = model.selectedID
        model.closeApp()
        model.closePanel()
        model.newThread()
        try await settle(12, "a second app thread") { model.selectedID != appThread && model.selectedID != thread && model.thread != nil && model.composer.ready }
        try await type("Build a habit streak mini-app")
        let sentSecond = try await clickLabel("Send"); check(sentSecond, "Send is clickable for the second app request")
        try await settle(20, "the second app review") { model.thread?.run?.appProposal?.name == "Streaks" }
        try await pause(0.6)
        let reviewSecond = try await clickLabel("Review app"); check(reviewSecond, "Review app is clickable for the second app")
        try await settle(10, "the shared collection count") { model.panel == "App review" && model.appReviewCounts["habits"] == 1 }
        try await pause(0.8)
        lines = try read(try snapshot("08-shared-collection-review"))
        check(visible("already holds 1 saved record", lines) && visible("share its records", lines), "a review names records other apps already saved in a collection")
        model.closePreview()

        // An app that saves whenever it hears a change must not hear its own saves.
        let streaksThread = model.selectedID
        model.closePanel()
        model.newThread()
        try await settle(12, "a third app thread") { ![appThread, thread, streaksThread].contains(model.selectedID) && model.thread != nil && model.composer.ready }
        try await type("Build a tally mini-app")
        let sentThird = try await clickLabel("Send"); check(sentThird, "Send is clickable for the third app request")
        try await settle(20, "the third app review") { model.thread?.run?.appProposal?.name == "Tally" }
        guard let tally = model.thread?.run?.appProposal else { print("FAIL: no tally proposal"); exit(1) }
        let tallyID = try await runtime.approveApp(threadID: model.selectedID, proposalID: tally.id, digest: tally.digest)
        await model.refresh()
        model.openApp(tallyID)
        try await settle(15, "the tally app to open") { model.panel == "App" && model.runningApp?.webView != nil }
        try await wait(15, "the tally app's first save") { await runtime.appRecordCount(collection: "tally") >= 1 }
        try await pause(4)
        let tallies = await runtime.appRecordCount(collection: "tally")
        check(tallies == 1, "an app's own saves are not echoed back to it, so a save-on-change app stays at one record (\(tallies))")
        model.closeApp()

        model.closeApp()
        window.orderOut(nil)
        window.contentView = nil
        try await runtime.shutdown()
        print(failures == 0 ? "PASS: mini-app isolation and review flows work in the production Mac views" : "FAIL: \(failures) checks failed")
        exit(failures == 0 ? 0 : 1)
    }
}
