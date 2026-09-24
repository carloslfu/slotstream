import AppKit

struct MacCommand {
    var title: String
    var key: String
    var modifiers: NSEvent.ModifierFlags = .command
    var shortcut: String
    static let owned: [MacCommand] = [
        .init(title: "New Thread", key: "n", shortcut: "⌘N"),
        .init(title: "New Incognito Thread", key: "n", modifiers: [.command, .shift], shortcut: "⌘⇧N"),
        .init(title: "Search Home…", key: "k", shortcut: "⌘K"),
        .init(title: "Find in Current Document…", key: "f", shortcut: "⌘F"),
        .init(title: "Settings…", key: ",", shortcut: "⌘,"),
        .init(title: "Focus Composer", key: "l", shortcut: "⌘L"),
        .init(title: "Focus Conversation", key: "l", modifiers: [.command, .shift], shortcut: "⌘⇧L"),
        .init(title: "Jump to Latest Message", key: "\u{F701}", modifiers: [.command, .control], shortcut: "⌃⌘↓"),
        .init(title: "Response Details", key: "i", modifiers: [.command, .option], shortcut: "⌥⌘I"),
        .init(title: "Home", key: "1", shortcut: "⌘1"),
        .init(title: "Apps & Skills", key: "2", shortcut: "⌘2"),
        .init(title: "Attach Files…", key: "a", modifiers: [.command, .shift], shortcut: "⌘⇧A"),
        .init(title: "Toggle Sidebar", key: "s", modifiers: [.command, .control], shortcut: "⌃⌘S")
    ]
    static let reference = owned + [
        .init(title: "Send message", key: "", shortcut: "Return"),
        .init(title: "New line", key: "", shortcut: "Shift+Return"),
        .init(title: "Close panel", key: "", shortcut: "Escape"),
        .init(title: "Close window", key: "w", shortcut: "⌘W"),
        .init(title: "Quit", key: "q", shortcut: "⌘Q")
    ]
}
