import AppKit
import SwiftUI
import CoreText
import Combine
import SevraRuntime

@main struct SevraMain {
    @MainActor static func main() {
        let application = NSApplication.shared
        let delegate = AppDelegate()
        application.delegate = delegate
        application.setActivationPolicy(.regular)
        withExtendedLifetime(delegate) { application.run() }
    }
}
@MainActor final class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate, NSMenuItemValidation, NSToolbarDelegate, NSMenuDelegate {
    let model = AppModel()
    var window: NSWindow!
    private var modelChanges: AnyCancellable?
    private let actionsMenu = NSMenu(title: "More")
    private let toolbarHeading = ToolbarHeading()
    private let toolbarSpacing = ToolbarSpacing()
    private var detailLeadingInset: CGFloat = 0
    private var alignmentScheduled = false
    func applicationDidFinishLaunching(_ notification: Notification) {
        for name in ["Inter", "Poppins-Medium"] {
            if let url = Bundle.main.url(forResource: name, withExtension: "ttf", subdirectory: "Fonts") { CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil) }
        }
        model.setAppearance(model.appearance)
        // Finder, Dock and About all use the same bundled, multiresolution icon.
        if let iconURL = Bundle.main.url(forResource: "Sevra", withExtension: "icns") {
            NSApp.applicationIconImage = NSImage(contentsOf: iconURL)
        }
        window = SevraWindow(contentRect: NSRect(x: 0, y: 0, width: 1120, height: 760), styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView], backing: .buffered, defer: false)
        window.title = "Home"; window.titlebarAppearsTransparent = true
        window.titleVisibility = .hidden
        window.toolbarStyle = .unified
        window.titlebarSeparatorStyle = .none
        window.minSize = NSSize(width: 620, height: 480); window.isReleasedWhenClosed = false
        window.delegate = self
        window.contentView = NSHostingView(rootView: ContentView(model: model, onContentLeadingChanged: { [weak self] leading in
            guard let self, self.detailLeadingInset != leading else { return }
            self.detailLeadingInset = leading
            self.scheduleToolbarAlignment()
        }))
        window.center(); window.setFrameAutosaveName("SevraMain")
        if let screen = window.screen ?? NSScreen.main, !screen.visibleFrame.intersects(window.frame) { window.center() }
        buildMenus(); buildToolbar(); window.makeKeyAndOrderFront(nil); NSApp.activate(ignoringOtherApps: true)
        // Observe after each published change, and only mutate chrome when its
        // displayed value changes. Streaming must not reconstruct the toolbar.
        modelChanges = model.objectWillChange.receive(on: RunLoop.main).sink { [weak self] in self?.updateToolbar() }
        NotificationCenter.default.addObserver(self, selector: #selector(find(_:)), name: .sevraFind, object: nil)
        NSWorkspace.shared.notificationCenter.addObserver(self, selector: #selector(willSleep(_:)), name: NSWorkspace.willSleepNotification, object: nil)
        NSWorkspace.shared.notificationCenter.addObserver(self, selector: #selector(didWake(_:)), name: NSWorkspace.didWakeNotification, object: nil)
        model.start()
    }
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool { false }
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        window.makeKeyAndOrderFront(nil); return true
    }
    func windowShouldClose(_ sender: NSWindow) -> Bool {
        Task { if await model.closeWindow() { sender.orderOut(nil) } }; return false
    }
    func windowDidResize(_ notification: Notification) { updateToolbar(); scheduleToolbarAlignment() }
    func windowDidUpdate(_ notification: Notification) { scheduleToolbarAlignment() }
    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
        Task { sender.reply(toApplicationShouldTerminate: await model.quit()) }
        return .terminateLater
    }
    @objc func newThread(_ sender: Any?) { model.newThread() }
    @objc func incognito(_ sender: Any?) { model.newThread(.incognito) }
    @objc func search(_ sender: Any?) { model.panel = "Search" }
    @objc func settings(_ sender: Any?) { model.panel = "Settings" }
    @objc func send(_ sender: Any?) { model.send() }
    @objc func stop(_ sender: Any?) { model.stop() }
    @objc func thinkLonger(_ sender: Any?) { model.toggleThinking() }
    @objc func answerNow(_ sender: Any?) { model.answerNow() }
    @objc func toggleResponseDetails(_ sender: Any?) { model.toggleResponseDetails() }
    @objc func responseDetails(_ sender: Any?) { model.showLatestDetails() }
    @objc func willSleep(_ notification: Notification) { model.prepareForSleep() }
    @objc func didWake(_ notification: Notification) { model.wake() }
    @objc func focusComposer(_ sender: Any?) { model.panel = ""; model.focusRevision += 1 }
    @objc func focusConversation(_ sender: Any?) { model.panel = ""; model.textSession.focusDocument() }
    @objc func jumpLatest(_ sender: Any?) { NotificationCenter.default.post(name: .sevraJumpToLatest, object: nil) }
    @objc func home(_ sender: Any?) { model.navigate("home") }
    @objc func toggleSidebar(_ sender: Any?) { NotificationCenter.default.post(name: .sevraToggleSidebar, object: nil) }
    @objc func back(_ sender: Any?) { model.closePanel() }
    @objc func revealHome(_ sender: Any?) { NSWorkspace.shared.open(model.homeURL) }
    @objc func attachSources(_ sender: Any?) { model.panel = ""; model.attach() }
    @objc func appsAndSkills(_ sender: Any?) { model.panel = "Apps" }
    func validateMenuItem(_ menuItem: NSMenuItem) -> Bool {
        if menuItem.action == #selector(send(_:)) { return model.composer.canSend && !model.busy && !model.submitting && !model.attaching && !model.aiPaused && !model.composer.transitioning }
        if menuItem.action == #selector(stop(_:)) { return model.busy && model.thread?.run?.state != .stopping }
        if menuItem.action == #selector(attachSources(_:)) { return model.composer.ready && !model.working && !model.attaching && !model.aiPaused }
        if menuItem.action == #selector(thinkLonger(_:)) { menuItem.state = model.thinkingEnabled ? .on : .off; return model.composer.ready && !model.thinkingUnavailable }
        if menuItem.action == #selector(answerNow(_:)) { return model.liveThinking?.active == true }
        if menuItem.action == #selector(toggleResponseDetails(_:)) { menuItem.state = model.showResponseDetails ? .on : .off; return true }
        if menuItem.action == #selector(responseDetails(_:)) { return model.panel.isEmpty && model.thread?.run != nil && model.details.anchor("status") != nil }
        if menuItem.action == #selector(newThread(_:)) || menuItem.action == #selector(incognito(_:)) { return model.composer.ready && !model.composer.transitioning }
        if menuItem.action == #selector(find(_:)) { return findTarget != nil }
        if menuItem.action == #selector(jumpLatest(_:)) { return (model.panel.isEmpty || model.panel == "Artifact") && model.textSession.visibleConversation != nil }
        return true
    }
    private var findTarget: DocumentTextView? {
        let current = window.firstResponder as? DocumentTextView
        let view = current ?? (model.panel == "Artifact" ? model.textSession.artifact : model.textSession.conversation)
        // The conversation stays in the window, hidden, under a panel.
        guard let view, view.window != nil, !view.isHiddenOrHasHiddenAncestor else { return nil }
        return view
    }
    @objc func find(_ sender: Any?) { findTarget?.findDocument() }
    private func buildMenus() {
        let main = NSMenu()
        func menu(_ title: String) -> NSMenu {
            let item = NSMenuItem(); item.title = title; let child = NSMenu(title: title); item.submenu = child; main.addItem(item); return child
        }
        func add(_ parent: NSMenu, _ title: String, _ action: Selector, _ key: String = "", _ modifiers: NSEvent.ModifierFlags = .command, target: AnyObject? = nil) {
            let command = MacCommand.owned.first { $0.title == title }
            let item = NSMenuItem(title: title, action: action, keyEquivalent: command?.key ?? key); item.keyEquivalentModifierMask = command?.modifiers ?? modifiers; item.target = target; parent.addItem(item)
        }
        let app = menu("Sevra")
        add(app, "About Sevra", #selector(NSApplication.orderFrontStandardAboutPanel(_:)))
        add(app, "Settings…", #selector(settings(_:)), ",", target: self)
        app.addItem(.separator()); add(app, "Hide Sevra", #selector(NSApplication.hide(_:)), "h")
        add(app, "Hide Others", #selector(NSApplication.hideOtherApplications(_:)), "h", [.command, .option])
        add(app, "Show All", #selector(NSApplication.unhideAllApplications(_:)))
        app.addItem(.separator()); add(app, "Quit Sevra", #selector(NSApplication.terminate(_:)), "q")
        let file = menu("File")
        add(file, "New Thread", #selector(newThread(_:)), "n", target: self)
        add(file, "New Incognito Thread", #selector(incognito(_:)), "n", [.command, .shift], target: self)
        add(file, "Attach Files…", #selector(attachSources(_:)), "a", [.command, .shift], target: self)
        add(file, "Send Message", #selector(send(_:)), "", target: self)
        add(file, "Stop Response", #selector(stop(_:)), "", target: self)
        file.addItem(.separator()); add(file, "Think Longer", #selector(thinkLonger(_:)), "", target: self)
        add(file, "Answer Now", #selector(answerNow(_:)), "", target: self)
        file.addItem(.separator()); add(file, "Close Window", #selector(NSWindow.performClose(_:)), "w")
        let edit = menu("Edit")
        add(edit, "Undo", Selector(("undo:")), "z"); add(edit, "Redo", Selector(("redo:")), "z", [.command, .shift])
        edit.addItem(.separator()); add(edit, "Cut", #selector(NSText.cut(_:)), "x"); add(edit, "Copy", #selector(NSText.copy(_:)), "c"); add(edit, "Paste", #selector(NSText.paste(_:)), "v"); add(edit, "Select All", #selector(NSText.selectAll(_:)), "a")
        edit.addItem(.separator()); add(edit, "Find in Current Document…", #selector(find(_:)), "f", target: self)
        add(edit, "Search Home…", #selector(search(_:)), "k", target: self)
        let view = menu("View"); add(view, "Home", #selector(home(_:)), "1", target: self)
        add(view, "Apps & Skills", #selector(appsAndSkills(_:)), "2", target: self)
        add(view, "Toggle Sidebar", #selector(toggleSidebar(_:)), target: self)
        view.addItem(.separator())
        add(view, "Focus Composer", #selector(focusComposer(_:)), target: self)
        add(view, "Focus Conversation", #selector(focusConversation(_:)), target: self)
        add(view, "Jump to Latest Message", #selector(jumpLatest(_:)), target: self)
        view.addItem(.separator())
        add(view, "Show Response Details", #selector(toggleResponseDetails(_:)), target: self)
        add(view, "Response Details", #selector(responseDetails(_:)), target: self)
        add(view, "Enter Full Screen", #selector(NSWindow.toggleFullScreen(_:)), "f", [.command, .control])
        let windows = menu("Window"); add(windows, "Minimize", #selector(NSWindow.performMiniaturize(_:)), "m"); add(windows, "Zoom", #selector(NSWindow.performZoom(_:)))
        NSApp.windowsMenu = windows; NSApp.mainMenu = main
    }

    private static let sidebarItem = NSToolbarItem.Identifier("Sevra.sidebar")
    private static let backItem = NSToolbarItem.Identifier("Sevra.back")
    private static let headingItem = NSToolbarItem.Identifier("Sevra.heading")
    private static let alignmentItem = NSToolbarItem.Identifier("Sevra.alignment")
    private static let searchItem = NSToolbarItem.Identifier("Sevra.search")
    private static let moreItem = NSToolbarItem.Identifier("Sevra.more")

    private func buildToolbar() {
        let toolbar = NSToolbar(identifier: "Sevra.main")
        toolbar.delegate = self
        toolbar.displayMode = .iconOnly
        toolbar.allowsUserCustomization = false
        if #available(macOS 15.0, *) { toolbar.allowsDisplayModeCustomization = false }
        actionsMenu.delegate = self
        window.toolbar = toolbar
        updateToolbar()
        scheduleToolbarAlignment()
    }

    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        [Self.sidebarItem, Self.alignmentItem, Self.headingItem, .flexibleSpace, Self.searchItem, Self.moreItem]
    }
    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        [Self.sidebarItem, Self.backItem, Self.alignmentItem, Self.headingItem, .flexibleSpace, Self.searchItem, Self.moreItem]
    }
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier identifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        let item: NSToolbarItem
        switch identifier {
        case Self.alignmentItem:
            item = NSToolbarItem(itemIdentifier: identifier)
            item.view = toolbarSpacing
            item.isBordered = false
            return item
        case Self.headingItem:
            item = NSToolbarItem(itemIdentifier: identifier)
            item.view = toolbarHeading
            item.label = "Current page"
            item.isBordered = false
            item.visibilityPriority = .low
            return item
        case Self.moreItem:
            let more = NSMenuToolbarItem(itemIdentifier: identifier)
            more.menu = actionsMenu
            more.showsIndicator = false
            more.image = NSImage(systemSymbolName: "ellipsis", accessibilityDescription: "More actions")
            more.label = "More actions"; more.toolTip = "Thread actions, Home folder, and settings"
            item = more
        case Self.sidebarItem, Self.backItem, Self.searchItem:
            item = NSToolbarItem(itemIdentifier: identifier)
            item.target = self
            if identifier == Self.sidebarItem {
                item.image = NSImage(systemSymbolName: "sidebar.left", accessibilityDescription: "Toggle Sidebar")
                item.label = "Toggle Sidebar"; item.toolTip = "Toggle Sidebar (⌃⌘S)"
                item.action = #selector(toggleSidebar(_:)); item.isNavigational = true
            } else if identifier == Self.backItem {
                item.image = NSImage(systemSymbolName: "chevron.left", accessibilityDescription: "Back to conversation")
                item.label = "Back to conversation"; item.toolTip = "Back to conversation (Escape)"
                item.action = #selector(back(_:)); item.isNavigational = true
            } else {
                // A native image-and-title button keeps Search named even at
                // the minimum window width, independent of toolbar display mode.
                let button = NSButton(title: "Search", image: NSImage(systemSymbolName: "magnifyingglass", accessibilityDescription: nil)!, target: self, action: #selector(search(_:)))
                button.bezelStyle = .texturedRounded; button.imagePosition = .imageLeading
                button.setAccessibilityLabel("Search Home")
                button.toolTip = "Search Home (⌘K)"; button.setAccessibilityHelp("Search Home (⌘K)")
                button.sizeToFit()
                item.view = button
                item.label = "Search Home…"; item.toolTip = "Search Home (⌘K)"
                item.action = #selector(search(_:))
            }
        default: return nil
        }
        item.isBordered = true
        item.visibilityPriority = .high
        return item
    }

    private func updateToolbar() {
        guard let window, let toolbar = window.toolbar else { return }
        for item in toolbar.items {
            if let help = item.toolTip, let view = item.view, view.toolTip != help { view.toolTip = help; view.setAccessibilityHelp(help) }
        }
        let conversation = model.panel.isEmpty || model.panel == "Artifact"
        let panelTitles = ["Apps": "Apps & Skills", "App review": "Review App", "Skill review": "Review Skill", "Changes": "File Changes", "Needs you": "Needs You"]
        let title = conversation ? (model.thread?.title ?? "Home") : model.panel == "App" ? (model.runningApp?.session.name ?? "App") : panelTitles[model.panel] ?? model.panel
        var subtitle = conversation ? (model.thread?.mode.title ?? "Shared memory") : model.panel == "App" ? "Mini-app · offline" : ""
        if conversation, let thread = model.thread, thread.id != "home" {
            let lifecycle: String
            switch thread.lifecycle {
            case .open: lifecycle = "Open"
            case .needsYou: lifecycle = "Needs you"
            case .done: lifecycle = "Done"
            case .archived: lifecycle = "Archived"
            }
            subtitle += " · " + lifecycle
        }
        if window.title != title { window.title = title }
        if window.subtitle != subtitle { window.subtitle = subtitle }
        // Reserve space for the native traffic lights, navigation, named Search
        // and More controls. Long titles truncate instead of going to overflow.
        toolbarHeading.update(title: title, subtitle: subtitle, availableWidth: window.frame.width - toolbarSpacing.width - (model.panel.isEmpty ? 380 : 420))
        let backIndex = toolbar.items.firstIndex { $0.itemIdentifier == Self.backItem }
        if !model.panel.isEmpty && backIndex == nil { toolbar.insertItem(withItemIdentifier: Self.backItem, at: 1); scheduleToolbarAlignment() }
        else if model.panel.isEmpty, let backIndex { toolbar.removeItem(at: backIndex); scheduleToolbarAlignment() }
    }

    private func scheduleToolbarAlignment(remainingPasses: Int = 3) {
        guard !alignmentScheduled else { return }
        alignmentScheduled = true
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.alignmentScheduled = false
            guard let window = self.window, let toolbar = window.toolbar, self.toolbarHeading.window != nil else { return }
            let spacerIndex = toolbar.items.firstIndex { $0.itemIdentifier == Self.alignmentItem }
            if self.detailLeadingInset == 0 {
                if let spacerIndex {
                    toolbar.removeItem(at: spacerIndex)
                    self.toolbarSpacing.width = 0
                    self.updateToolbar()
                }
                return
            }
            if spacerIndex == nil, let headingIndex = toolbar.items.firstIndex(where: { $0.itemIdentifier == Self.headingItem }) {
                toolbar.insertItem(withItemIdentifier: Self.alignmentItem, at: headingIndex)
                self.scheduleToolbarAlignment()
                return
            }
            window.contentView?.superview?.layoutSubtreeIfNeeded()
            // Measure the native navigation controls instead of positioning
            // traffic lights ourselves. The heading follows the detail pane as
            // its sidebar resizes, and stays clear of the controls when compact.
            let nativeLeading = self.toolbarHeading.convert(.zero, to: nil).x - self.toolbarSpacing.frame.width
            let contentLeading = window.contentView?.convert(NSPoint(x: self.detailLeadingInset + 24, y: 0), to: nil).x ?? 0
            let gap = self.detailLeadingInset > 0 ? max(0, contentLeading - nativeLeading) : 0
            if abs(self.toolbarSpacing.width - gap) > 0.5 {
                self.toolbarSpacing.width = gap
                self.updateToolbar()
                // AppKit can regroup controls after the spacer first appears.
                // Reconcile that layout once it has committed, with a bounded pass.
                if remainingPasses > 1 { self.scheduleToolbarAlignment(remainingPasses: remainingPasses - 1) }
            }
        }
    }

    // AppKit builds and tracks the pop-up menu, including keyboard navigation,
    // disabled states, accessibility and the current system appearance.
    func menuNeedsUpdate(_ menu: NSMenu) {
        guard menu === actionsMenu else { return }
        menu.removeAllItems()
        // The native pull-down reserves its first entry for the button title.
        // Give it a label so the first real command stays visible in the menu.
        menu.addItem(NSMenuItem(title: "More actions", action: nil, keyEquivalent: ""))
        func add(_ title: String, _ symbol: String, _ action: Selector, thread: WorkThread? = nil, enabled: Bool = true) {
            let command = MacCommand.owned.first { $0.title == title }
            let item = NSMenuItem(title: title, action: action, keyEquivalent: command?.key ?? "")
            item.keyEquivalentModifierMask = command?.modifiers ?? .command
            item.target = self
            item.image = NSImage(systemSymbolName: symbol, accessibilityDescription: nil)
            item.representedObject = thread?.id
            item.isEnabled = enabled
            menu.addItem(item)
        }
        menu.autoenablesItems = false
        add("New Thread", "square.and.pencil", #selector(newThread(_:)), enabled: model.composer.ready)
        add("New Incognito Thread", "eye.slash", #selector(incognito(_:)), enabled: model.composer.ready)
        if let thread = model.thread, thread.id != "home", model.panel.isEmpty || model.panel == "Artifact" {
            menu.addItem(.separator())
            add(thread.pinned ? "Unpin Thread" : "Pin Thread", "pin", #selector(pinThread(_:)), thread: thread)
            add("Rename Thread…", "pencil", #selector(renameThread(_:)), thread: thread)
            let reopen = thread.lifecycle == .done || thread.lifecycle == .archived
            add(reopen ? "Reopen Thread" : "Mark Done", reopen ? "arrow.uturn.backward" : "checkmark.circle", #selector(finishThread(_:)), thread: thread, enabled: thread.run?.state.terminal != false)
            if thread.lifecycle != .archived {
                add("Archive Thread", "archivebox", #selector(archiveThread(_:)), thread: thread, enabled: thread.run?.state.terminal != false)
            }
            if thread.mode == .incognito { add("Close Incognito Thread", "xmark", #selector(closeIncognito(_:)), thread: thread) }
        }
        menu.addItem(.separator())
        add("Attach Files…", "paperclip", #selector(attachSources(_:)), enabled: model.composer.ready && !model.working && !model.aiPaused)
        add("Apps & Skills", "square.grid.2x2", #selector(appsAndSkills(_:)))
        add("Reveal Home in Finder", "folder", #selector(revealHome(_:)))
        add("Settings…", "gearshape", #selector(settings(_:)))
    }
    private func menuThread(_ sender: NSMenuItem) -> WorkThread? {
        guard let id = sender.representedObject as? String else { return nil }
        return model.snapshot?.home.threads.first { $0.id == id }
    }
    @objc private func pinThread(_ sender: NSMenuItem) {
        guard let thread = menuThread(sender) else { return }
        model.perform { try await $0.pin(threadID: thread.id) }
    }
    @objc private func renameThread(_ sender: NSMenuItem) {
        guard let thread = menuThread(sender) else { return }; model.renameThread(thread.id)
    }
    @objc private func finishThread(_ sender: NSMenuItem) {
        guard let thread = menuThread(sender), thread.run?.state.terminal != false else { return }
        model.perform { try await $0.lifecycle(threadID: thread.id, value: thread.lifecycle == .done || thread.lifecycle == .archived ? .open : .done) }
    }
    @objc private func archiveThread(_ sender: NSMenuItem) {
        guard let thread = menuThread(sender), thread.run?.state.terminal != false else { return }
        model.perform { try await $0.lifecycle(threadID: thread.id, value: .archived); if self.model.selectedID == thread.id { self.model.navigate("home") } }
    }
    @objc private func closeIncognito(_ sender: NSMenuItem) {
        guard let thread = menuThread(sender), model.selectedID == thread.id, thread.mode == .incognito else { return }
        model.closeIncognito()
    }
}

/// Escape also reaches native document views and a window with no focused view.
/// Native sheets and text input handle their own cancellation first.
@MainActor private final class SevraWindow: NSWindow {
    override func sendEvent(_ event: NSEvent) {
        // The Find field's editor is a sibling of its document. Letting Escape
        // traverse that responder chain can select the other pane's document.
        // Close the visible native Find bar before dispatching panel dismissal.
        if event.type == .keyDown, event.keyCode == 53, attachedSheet == nil,
           (firstResponder as? NSTextView)?.hasMarkedText() != true {
            func findDocument(_ view: NSView) -> DocumentTextView? {
                if let document = view as? DocumentTextView,
                   document.enclosingScrollView?.isFindBarVisible == true { return document }
                for child in view.subviews { if let found = findDocument(child) { return found } }
                return nil
            }
            if let contentView, let document = findDocument(contentView) {
                document.cancelOperation(nil)
                makeFirstResponder(document)
                return
            }
        }
        super.sendEvent(event)
    }
    override func cancelOperation(_ sender: Any?) {
        NotificationCenter.default.post(name: .sevraEscape, object: nil)
    }
}

@MainActor private final class ToolbarSpacing: NSView {
    private var widthConstraint: NSLayoutConstraint!
    var width: CGFloat {
        get { widthConstraint.constant }
        set { widthConstraint.constant = max(1, newValue); invalidateIntrinsicContentSize() }
    }
    override init(frame frameRect: NSRect) {
        // AppKit measures toolbar views before the first alignment pass.
        // A positive placeholder avoids a zero-sized ambiguous toolbar item.
        super.init(frame: NSRect(x: 0, y: 0, width: 1, height: 1))
        widthConstraint = widthAnchor.constraint(equalToConstant: 1)
        NSLayoutConstraint.activate([widthConstraint, heightAnchor.constraint(equalToConstant: 1)])
        setAccessibilityElement(false)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override var intrinsicContentSize: NSSize { NSSize(width: widthConstraint?.constant ?? 1, height: 1) }
}

/// System typography with an explicit secondary line keeps the memory scope
/// visible even when AppKit suppresses a window subtitle in unified chrome.
@MainActor private final class ToolbarHeading: NSView {
    private let titleLabel = NSTextField(labelWithString: "Home")
    private let subtitleLabel = NSTextField(labelWithString: "Shared memory")
    private var headingWidth: NSLayoutConstraint!
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        titleLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        subtitleLabel.font = .systemFont(ofSize: 11)
        subtitleLabel.textColor = .secondaryLabelColor
        for label in [titleLabel, subtitleLabel] {
            label.lineBreakMode = .byTruncatingTail
            label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        }
        let stack = NSStackView(views: [titleLabel, subtitleLabel])
        stack.orientation = .vertical; stack.alignment = .leading; stack.spacing = 2
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        headingWidth = widthAnchor.constraint(equalToConstant: 100)
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            headingWidth,
            heightAnchor.constraint(equalToConstant: 34)
        ])
        setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override var intrinsicContentSize: NSSize {
        NSSize(width: headingWidth?.constant ?? 100, height: 34)
    }
    func update(title: String, subtitle: String, availableWidth: CGFloat) {
        if titleLabel.stringValue != title || subtitleLabel.stringValue != subtitle {
            titleLabel.stringValue = title; subtitleLabel.stringValue = subtitle
            subtitleLabel.isHidden = subtitle.isEmpty
            toolTip = subtitle.isEmpty ? title : title + "\n" + subtitle
        }
        let naturalWidth = max(titleLabel.intrinsicContentSize.width, subtitle.isEmpty ? 0 : subtitleLabel.intrinsicContentSize.width)
        let width = max(100, min(400, availableWidth, naturalWidth))
        if headingWidth.constant != width {
            headingWidth.constant = width
            invalidateIntrinsicContentSize()
        }
    }
}
