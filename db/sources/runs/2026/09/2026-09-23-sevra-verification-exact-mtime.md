---
type: run
id: 01m37gack5qc5221kn9zn7rjxy
created: 2026-09-23T16:06:59.429575+00:00
updated: 2026-09-23T16:09:29.703076+00:00
summary: Sevra verification rejects corruption with exact nanosecond mtime restored
binary: cc083b210d917aca84dbd8de6d652767ba16d074cb02a1781feb11f8c3d6e116
captured_at: 2026-09-23
command: swift build; sevra-mac-checks --performance
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Sevra verification rejects corruption with exact nanosecond mtime restored
tool: sevra-mac-checks --performance
---
The session verification test now writes corruption through a file handle and restores the original nanosecond timespec with `utimensat`. It asserts unchanged inode, size and exact modification time before requiring the verifier to reject the corrupted bytes. This avoids Foundation Date rounding accidentally invalidating the cache through mtime alone. The production implementation is unchanged from b665f88; this strengthens its regression evidence. No model weights are loaded by this check.

Commands:
```text
swift build --package-path apps/macos -c release --product sevra-mac-checks -j 2
SEVRA_EXTRACT=$PWD/apps/macos/.build/release/sevra-extract apps/macos/.build/release/sevra-mac-checks --performance
```

Both commands exited zero. The build took 17.59 seconds. Source SHA-256: `aa99d4301f158a88442da562e9790c81c8abe6dedeeb71bd1274378b20f813df`. Checker executable SHA-256: `cc083b210d917aca84dbd8de6d652767ba16d074cb02a1781feb11f8c3d6e116`.

Raw output:
```text
PASS: session model verification, same-size corruption, restored mtime, repair, optional arrival, replacement, symlink, cancellation and verification mutation; cached=true
PASS: memory plans 85 accepted / 215 safely refused; custom ceilings, unavailable readings, persistence, stable ranges and idle/pressure policy
PASS: deferred budget coalescing, queued submission during handoff, active release refusal, idle release and draft preservation
PASS: sleep cancellation, queued interruption, unload, admission guard, wake without replay and explicit recovery
PASS: context overflow preserves messages and refuses instead of silently trimming history
```
