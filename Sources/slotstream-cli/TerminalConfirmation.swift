import Foundation
#if canImport(Darwin)
import Darwin
#else
import Glibc
#endif

/// Ask on the terminal used for input. Returns nil without a usable prompt
/// endpoint (including piped stdin and no /dev/tty), so callers can fail
/// with instructions instead of waiting without a visible question.
func askYesNo(_ prompt: String) -> Bool? {
    func parse(_ s: String) -> Bool {
        let t = s.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        return t.isEmpty || t == "y" || t == "yes"
    }
    if isatty(0) == 1 {
        guard let name = ttyname(0) else { return nil }
        let path = String(cString: name)
        let fd = open(path, O_WRONLY | O_NOCTTY)
        guard fd >= 0 else { return nil }
        guard let tty = fdopen(fd, "w") else {
            close(fd)
            return nil
        }
        defer { fclose(tty) }
        guard fputs(prompt, tty) >= 0, fflush(tty) == 0 else { return nil }
        guard let line = readLine() else { return false }
        return parse(line)
    }
    guard let tty = fopen("/dev/tty", "r+") else { return nil }
    defer { fclose(tty) }
    guard fputs(prompt, tty) >= 0, fflush(tty) == 0 else { return nil }
    var buf = [CChar](repeating: 0, count: 64)
    guard fgets(&buf, 64, tty) != nil else { return false }
    return parse(String(cString: buf))
}
