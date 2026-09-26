// T0: clearing persisted prefixes uses tiny temporary files, no model or GPU.

import Foundation
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    static func persistentPrefixClear() throws -> CheckReport {
        var c = CheckBuilder("persistent-prefix-clear")
        let fm = FileManager.default
        let dir = fm.temporaryDirectory.appendingPathComponent("slotstream-prefix-clear-\(UUID().uuidString)")
        try fm.createDirectory(at: dir, withIntermediateDirectories: true)
        defer { try? fm.removeItem(at: dir) }

        let states = ["head.slotprefix": 3, "rows.slotseg": 5, ".interrupted.tmp": 7]
        let preserved = ["notes.txt", "notes.tmp", ".keep", ".lock"]
        for (name, size) in states { try Data(count: size).write(to: dir.appendingPathComponent(name)) }
        for name in preserved { try Data("keep".utf8).write(to: dir.appendingPathComponent(name)) }
        let removed = try PersistentPrefixCache.clear(directory: dir)
        c.equal("clear counts heads, segments and interrupted writes", removed.files, 3)
        c.equal("clear counts only their removed bytes", removed.bytes, 15)
        c.equal("clear preserves unrelated files and the directory lock",
            Set(try fm.contentsOfDirectory(atPath: dir.path)), Set(preserved))
        for name in preserved {
            c.equal("clear preserves \(name) contents", try Data(contentsOf: dir.appendingPathComponent(name)), Data("keep".utf8))
        }

        let head = dir.appendingPathComponent("held.slotprefix")
        try Data(count: 11).write(to: head)
        do {
            let fd = open(dir.appendingPathComponent(".lock").path, O_RDWR | O_CLOEXEC)
            guard fd >= 0 else { throw ModelError("cannot open the check's directory lock") }
            defer { flock(fd, LOCK_UN); close(fd) }
            guard flock(fd, LOCK_EX | LOCK_NB) == 0 else { throw ModelError("cannot hold the check's directory lock") }
            var refused = false
            do { _ = try PersistentPrefixCache.clear(directory: dir) } catch { refused = true }
            c.expect("clear refuses a directory whose lock is held", refused)
            c.equal("lock contention preserves the cached file", try Data(contentsOf: head), Data(count: 11))
        }
        let unlocked = try PersistentPrefixCache.clear(directory: dir)
        c.equal("clear succeeds after the directory lock is released", unlocked.files, 1)
        c.equal("clear after lock contention reports the removed bytes", unlocked.bytes, 11)

        // unlink cannot remove a directory, even when the check runs as root.
        let blocked = dir.appendingPathComponent("blocked.slotprefix")
        try fm.createDirectory(at: blocked, withIntermediateDirectories: false)
        var failure: String?
        do { _ = try PersistentPrefixCache.clear(directory: dir) } catch { failure = String(describing: error) }
        c.expect("a failed unlink throws instead of reporting successful clearance", failure != nil)
        c.expect("the unlink failure identifies the path", failure?.contains(blocked.path) == true, failure)
        c.expect("the failed entry remains on disk", fm.fileExists(atPath: blocked.path))
        try fm.removeItem(at: blocked)
        try Data(count: 13).write(to: head)
        let retried = try PersistentPrefixCache.clear(directory: dir)
        c.equal("an unlink failure releases the directory lock for a later clear", retried.files, 1)
        c.equal("the later clear reports only its removed bytes", retried.bytes, 13)
        return c.report()
    }
}
