import AppKit
import SwiftUI
import WebKit
import Network
import SevraRuntime

/// One mini-app to show: an approved version backed by Home data, or a draft
/// under review backed by scratch data.
struct MiniAppSession: Equatable {
    var appID: String
    var version: Int
    var name: String
    var html: String
    var collections: [AppCollection]
    var preview: Bool
}

/// Runs one mini-app in its own web view with no network, no navigation, no
/// new windows, no downloads and no storage that outlives it. The page gets
/// one capability: `window.sevra`, whose requests the host answers for this
/// app and version only. Isolation never depends on reviewing the app's code.
@MainActor final class MiniAppController: NSObject, WKNavigationDelegate, WKUIDelegate {
    static let scheme = "sevra-app"
    static let origin = "sevra-app://app/"
    /// Content security for the one document the host serves.
    static let policy = "default-src 'none'; script-src 'unsafe-inline'; style-src 'unsafe-inline'; img-src data: blob:; font-src data:; media-src data: blob:; connect-src 'none'; frame-src 'none'; child-src 'none'; worker-src 'none'; object-src 'none'; form-action 'none'; base-uri 'none'"

    let session: MiniAppSession
    private let broker: @Sendable (Data) async -> Data
    private let onLink: (URL) -> Void
    private(set) var webView: WKWebView?
    private(set) var failure: String?
    /// True once the page has drawn, or failed to.
    private(set) var ready = false
    private var dialogs = 0
    var onFailure: ((String) -> Void)?
    var onReady: (() -> Void)?

    init(session: MiniAppSession, broker: @escaping @Sendable (Data) async -> Data, onLink: @escaping (URL) -> Void) {
        self.session = session
        self.broker = broker
        self.onLink = onLink
        super.init()
    }

    private static var compiledRules: WKContentRuleList?
    /// Blocks every load that is not the app's own document. Compiled once.
    static func rules() async throws -> WKContentRuleList {
        if let compiledRules { return compiledRules }
        let source = #"[{"trigger":{"url-filter":".*"},"action":{"type":"block"}},{"trigger":{"url-filter":"^sevra-app:"},"action":{"type":"ignore-previous-rules"}}]"#
        let list: WKContentRuleList = try await withCheckedThrowingContinuation { continuation in
            WKContentRuleListStore.default().compileContentRuleList(forIdentifier: "sevra-app-offline-1", encodedContentRuleList: source) { list, error in
                if let list { continuation.resume(returning: list) }
                else { continuation.resume(throwing: error ?? SevraError.unavailable("The app sandbox rules could not be prepared.")) }
            }
        }
        compiledRules = list
        return list
    }

    /// A loopback port Sevra holds without listening. Every connection to it
    /// is refused, and no other process can take it while Sevra runs.
    private static let blackHole: UInt16? = {
        let fd = socket(AF_INET, SOCK_STREAM, 0)
        guard fd >= 0 else { return nil }
        var address = sockaddr_in()
        address.sin_len = UInt8(MemoryLayout<sockaddr_in>.size); address.sin_family = sa_family_t(AF_INET); address.sin_addr.s_addr = inet_addr("127.0.0.1")
        let bound = withUnsafePointer(to: &address) { $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { Darwin.bind(fd, $0, socklen_t(MemoryLayout<sockaddr_in>.size)) } }
        var actual = sockaddr_in(), length = socklen_t(MemoryLayout<sockaddr_in>.size)
        guard bound == 0, withUnsafeMutablePointer(to: &actual, { $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { getsockname(fd, $0, &length) } }) == 0 else { Darwin.close(fd); return nil }
        return UInt16(bigEndian: actual.sin_port)
    }()

    /// Turns off a WebKit preference by its setter when this WebKit has it.
    private static func disable(_ preferences: WKPreferences, _ key: String) {
        let setter = "_set" + key.prefix(1).uppercased() + key.dropFirst() + ":"
        guard preferences.responds(to: NSSelectorFromString(setter)) else { return }
        preferences.setValue(false, forKey: key)
    }

    /// WebKit features that open connections outside resource loads: peer
    /// connections, and link hints that resolve or connect to a host.
    static let networkFeatures: Set<String> = ["PeerConnectionEnabled", "LinkPreconnect", "LinkDNSPrefetchEnabled", "LinkPreloadEnabled",
                                               "LinkPreconnectEarlyHintsEnabled", "LinkPrefetchEnabled", "SpeculationRulesPrefetchEnabled"]

    /// Turns off the named WebKit features this WebKit knows. Returns the
    /// ones that read back as off. These switches are WebKit's own feature flags.
    private static func disableFeatures(_ preferences: WKPreferences, _ keys: Set<String>) -> Set<String> {
        let listSelector = NSSelectorFromString("_features"), setSelector = NSSelectorFromString("_setEnabled:forFeature:")
        let getSelector = NSSelectorFromString("_isEnabledForFeature:")
        guard WKPreferences.responds(to: listSelector), preferences.responds(to: setSelector),
              let features = (WKPreferences.self as AnyObject).perform(listSelector)?.takeUnretainedValue() as? [NSObject] else { return [] }
        typealias Setter = @convention(c) (AnyObject, Selector, Bool, AnyObject) -> Void
        typealias Getter = @convention(c) (AnyObject, Selector, AnyObject) -> Bool
        let set = unsafeBitCast(preferences.method(for: setSelector), to: Setter.self)
        let get = preferences.responds(to: getSelector) ? unsafeBitCast(preferences.method(for: getSelector), to: Getter.self) : nil
        var disabled: Set<String> = []
        for feature in features {
            guard let key = feature.value(forKey: "key") as? String, keys.contains(key) else { continue }
            set(preferences, setSelector, false, feature)
            if get?(preferences, getSelector, feature) != true { disabled.insert(key) }
        }
        return disabled
    }

    /// Reads a WebKit Boolean preference through its private getter, if any.
    private static func flag(_ preferences: WKPreferences, _ getter: String) -> Bool? {
        let selector = NSSelectorFromString(getter)
        guard preferences.responds(to: selector) else { return nil }
        typealias Getter = @convention(c) (AnyObject, Selector) -> Bool
        return unsafeBitCast(preferences.method(for: selector), to: Getter.self)(preferences, selector)
    }

    /// Content rules and the proxy cannot see peer connections, link
    /// preconnects or DNS prefetches. Each must be verifiably off before any
    /// app runs.
    private static func networkSwitchesOff(_ preferences: WKPreferences, disabled: Set<String>) -> Bool {
        let peer = disabled.contains("PeerConnectionEnabled") || flag(preferences, "_peerConnectionEnabled") == false
        let preconnect = disabled.contains("LinkPreconnect")
        let lookups = disabled.contains("LinkDNSPrefetchEnabled") || flag(preferences, "_dnsPrefetchingEnabled") == false
        return peer && preconnect && lookups
    }

    /// The bridge script. It defines `window.sevra` and removes peer
    /// connections, the one web API that could reach a network without a load.
    static let bridge = """
    (() => {
      const handler = window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.sevra;
      const call = (op, fields) => handler.postMessage(JSON.stringify(Object.assign({ op }, fields))).then((text) => {
        const reply = JSON.parse(text);
        if (reply.ok) return reply.result;
        const error = new Error((reply.error && reply.error.message) || 'Request failed');
        error.code = reply.error && reply.error.code;
        throw error;
      });
      const api = Object.freeze({
        info: () => call('info', {}),
        list: (collection, options) => call('list', { collection, archived: !!(options && options.archived), limit: options && options.limit }),
        get: (collection, id) => call('get', { collection, id }),
        create: (collection, data) => call('create', { collection, data }),
        update: (collection, id, data, revision) => call('update', { collection, id, data, revision }),
        archive: (collection, id, revision) => call('archive', { collection, id, revision }),
        restore: (collection, id, revision) => call('restore', { collection, id, revision }),
      });
      Object.defineProperty(window, 'sevra', { value: api, writable: false, configurable: false, enumerable: false });
      for (const name of ['RTCPeerConnection', 'webkitRTCPeerConnection', 'RTCDataChannel', 'RTCSessionDescription', 'RTCIceCandidate']) {
        try { Object.defineProperty(window, name, { value: undefined, writable: false, configurable: false }); } catch (error) {}
      }
    })();
    """

    /// Builds the view once the blocking rules are ready. Without them the
    /// app does not run at all.
    func load() async {
        guard webView == nil else { return }
        let rules: WKContentRuleList
        do { rules = try await Self.rules() } catch {
            fail("This app cannot run because its offline protection could not be prepared.")
            return
        }
        guard let hole = Self.blackHole, let port = NWEndpoint.Port(rawValue: hole) else {
            fail("This app cannot run because its offline protection could not be prepared.")
            return
        }
        let configuration = WKWebViewConfiguration()
        let store = WKWebsiteDataStore.nonPersistent()
        // Content rules stop loads. Anything that connects without a load,
        // such as a preconnect hint or a beacon, meets a proxy that refuses it.
        let refused = NWEndpoint.hostPort(host: "127.0.0.1", port: port)
        store.proxyConfigurations = [ProxyConfiguration(httpCONNECTProxy: refused), ProxyConfiguration(socksv5Proxy: refused)]
        configuration.websiteDataStore = store
        // Peer connections and link hints use their own sockets, outside
        // loads and proxies. Without a way to turn them off, apps do not run.
        let disabled = Self.disableFeatures(configuration.preferences, Self.networkFeatures)
        Self.disable(configuration.preferences, "peerConnectionEnabled")
        Self.disable(configuration.preferences, "DNSPrefetchingEnabled")
        guard Self.networkSwitchesOff(configuration.preferences, disabled: disabled) else {
            fail("This app cannot run because this version of macOS does not let Sevra keep it offline.")
            return
        }
        configuration.setURLSchemeHandler(SchemeHandler(owner: self), forURLScheme: Self.scheme)
        configuration.preferences.javaScriptCanOpenWindowsAutomatically = false
        configuration.preferences.isFraudulentWebsiteWarningEnabled = false
        configuration.preferences.isElementFullscreenEnabled = false
        configuration.allowsAirPlayForMediaPlayback = false
        configuration.mediaTypesRequiringUserActionForPlayback = .all
        configuration.applicationNameForUserAgent = "SevraApp"
        let content = WKUserContentController()
        content.add(rules)
        content.addScriptMessageHandler(MessageHandler(owner: self), contentWorld: .page, name: "sevra")
        content.addUserScript(WKUserScript(source: Self.bridge, injectionTime: .atDocumentStart, forMainFrameOnly: false, in: .page))
        configuration.userContentController = content
        let view = WKWebView(frame: .zero, configuration: configuration)
        view.navigationDelegate = self
        view.uiDelegate = self
        view.allowsBackForwardNavigationGestures = false
        view.allowsLinkPreview = false
        view.allowsMagnification = true
        if #available(macOS 13.3, *) { view.isInspectable = false }
        // Shown once the page has drawn, so a dark app never flashes white.
        view.isHidden = true
        view.setAccessibilityLabel(session.name)
        webView = view
        view.load(URLRequest(url: URL(string: Self.origin + "index.html")!))
    }

    /// Stops the app. Its scratch storage goes with the view.
    func close() {
        guard let view = webView else { return }
        view.stopLoading()
        view.navigationDelegate = nil; view.uiDelegate = nil
        view.configuration.userContentController.removeAllScriptMessageHandlers()
        view.configuration.userContentController.removeAllUserScripts()
        view.removeFromSuperview()
        webView = nil
    }

    /// Tells the page a collection it can read changed.
    func notifyChange(collection: String) {
        guard session.collections.contains(where: { $0.name == collection }), let webView else { return }
        let name = collection.unicodeScalars.allSatisfy { CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz0123456789-").contains($0) } ? collection : ""
        guard !name.isEmpty else { return }
        webView.evaluateJavaScript("window.dispatchEvent(new CustomEvent('sevra-change', { detail: { collection: '\(name)' } }))", in: nil, in: .page) { _ in }
    }

    private func fail(_ message: String) {
        failure = message
        onFailure?(message)
    }

    // MARK: serving

    fileprivate func serve(_ task: WKURLSchemeTask) {
        let url = task.request.url
        guard let url, url.scheme == Self.scheme, url.host == "app", ["/", "/index.html"].contains(url.path) else {
            task.didFailWithError(URLError(.fileDoesNotExist))
            return
        }
        let body = Data(session.html.utf8)
        let headers = ["Content-Type": "text/html; charset=utf-8", "Content-Security-Policy": Self.policy,
                       "X-Content-Type-Options": "nosniff", "Cache-Control": "no-store", "Content-Length": String(body.count)]
        guard let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: headers) else {
            task.didFailWithError(URLError(.cannotParseResponse)); return
        }
        task.didReceive(response)
        task.didReceive(body)
        task.didFinish()
    }

    fileprivate func handle(_ message: WKScriptMessage, reply: @escaping (Any?, String?) -> Void) {
        guard message.frameInfo.isMainFrame, message.frameInfo.securityOrigin.protocol == Self.scheme,
              let text = message.body as? String, text.utf8.count <= 256 * 1024 else {
            reply(nil, "Refused"); return
        }
        let broker = self.broker
        // Like the Home broker, a preview never echoes an app's own saves.
        Task {
            let data = await broker(Data(text.utf8))
            reply(String(decoding: data, as: UTF8.self), nil)
        }
    }

    // MARK: navigation

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, preferences: WKWebpagePreferences, decisionHandler: @escaping (WKNavigationActionPolicy, WKWebpagePreferences) -> Void) {
        let url = navigationAction.request.url
        if navigationAction.shouldPerformDownload { decisionHandler(.cancel, preferences); return }
        // The only document is the app itself, so moving within it (anchors,
        // reload, history) is harmless. Forms and everything else are not.
        if let url, url.scheme == Self.scheme, url.host == "app", ["/", "/index.html"].contains(url.path), navigationAction.targetFrame?.isMainFrame == true,
           [.other, .reload, .linkActivated, .backForward].contains(navigationAction.navigationType) {
            decisionHandler(.allow, preferences); return
        }
        if let url, navigationAction.navigationType == .linkActivated, ["http", "https", "mailto"].contains(url.scheme?.lowercased() ?? "") { onLink(url) }
        decisionHandler(.cancel, preferences)
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(navigationResponse.canShowMIMEType && navigationResponse.isForMainFrame ? .allow : .cancel)
    }

    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if let url = navigationAction.request.url, ["http", "https", "mailto"].contains(url.scheme?.lowercased() ?? "") { onLink(url) }
        return nil
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.isHidden = false
        if !ready { ready = true; onReady?() }
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        webView.isHidden = false
        if (error as NSError).code != NSURLErrorCancelled { fail("\(session.name) could not be opened.") }
        if !ready { ready = true; onReady?() }
    }

    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        fail("\(session.name) stopped unexpectedly. Its saved data is unchanged. Open it again to continue.")
    }

    func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping (WKPermissionDecision) -> Void) {
        decisionHandler(.deny)
    }

    // MARK: dialogs

    /// Simple dialogs are shown with the app's name. A page that keeps opening
    /// them is quietly ignored after a few.
    private func dialogAllowed() -> Bool { dialogs += 1; return dialogs <= 5 }

    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        guard dialogAllowed() else { completionHandler(); return }
        let alert = NSAlert(); alert.messageText = session.name; alert.informativeText = String(message.prefix(1000))
        alert.addButton(withTitle: "OK")
        alert.runModal()
        completionHandler()
    }

    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        guard dialogAllowed() else { completionHandler(false); return }
        let alert = NSAlert(); alert.messageText = session.name; alert.informativeText = String(message.prefix(1000))
        alert.addButton(withTitle: "OK"); alert.addButton(withTitle: "Cancel")
        completionHandler(alert.runModal() == .alertFirstButtonReturn)
    }

    func webView(_ webView: WKWebView, runOpenPanelWith parameters: WKOpenPanelParameters, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping ([URL]?) -> Void) {
        // The person chooses what the app may read. The page receives the
        // file's contents, never access to its folder.
        let panel = NSOpenPanel()
        panel.canChooseDirectories = false
        panel.allowsMultipleSelection = parameters.allowsMultipleSelection
        panel.message = "Choose a file for \(session.name). The app can read it, but nothing leaves this Mac."
        completionHandler(panel.runModal() == .OK ? panel.urls : nil)
    }
}

/// Weak bridges: WebKit retains its handlers, and the controller owns the view.
private final class SchemeHandler: NSObject, WKURLSchemeHandler {
    weak var owner: MiniAppController?
    init(owner: MiniAppController) { self.owner = owner }
    func webView(_ webView: WKWebView, start urlSchemeTask: WKURLSchemeTask) {
        MainActor.assumeIsolated {
            guard let owner else { urlSchemeTask.didFailWithError(URLError(.cancelled)); return }
            owner.serve(urlSchemeTask)
        }
    }
    func webView(_ webView: WKWebView, stop urlSchemeTask: WKURLSchemeTask) {}
}

private final class MessageHandler: NSObject, WKScriptMessageHandlerWithReply {
    weak var owner: MiniAppController?
    init(owner: MiniAppController) { self.owner = owner }
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage, replyHandler: @escaping (Any?, String?) -> Void) {
        MainActor.assumeIsolated {
            guard let owner else { replyHandler(nil, "Closed"); return }
            owner.handle(message, reply: replyHandler)
        }
    }
}

/// Shows a controller's web view.
struct MiniAppView: NSViewRepresentable {
    let controller: MiniAppController
    func makeNSView(context: Context) -> NSView {
        let container = NSView()
        attach(to: container)
        return container
    }
    func updateNSView(_ container: NSView, context: Context) { attach(to: container) }
    private func attach(to container: NSView) {
        guard let view = controller.webView, view.superview !== container else { return }
        container.subviews.forEach { $0.removeFromSuperview() }
        view.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(view)
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            view.topAnchor.constraint(equalTo: container.topAnchor),
            view.bottomAnchor.constraint(equalTo: container.bottomAnchor),
        ])
    }
}
