---
type: measurement
id: 01m1hhwmcaahm3yp75dpcrkkdr
created: 2026-09-02T17:15:26.474829+00:00
updated: 2026-09-02T17:15:26.474829+00:00
summary: 'The finding: eight requests, one connection'
date: 2026-09-01
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
- '[[records/machines/linux-host-helsinki-1gbit]]'
milestone: M10
order: '520'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'The finding: eight requests, one connection'
status: measured
---

`PullJob` made one `URLSession` with `httpMaximumConnectionsPerHost = 8` and
ran eight workers against it. Apple's documentation for that property says:
"HTTP/2 and later run multiple requests over a single connection and thus
ignore this property," and "This limit is per session, so if you use multiple
sessions, your app as a whole may exceed this limit." Hugging Face speaks
HTTP/2, so every pull since 0.1.4 ran eight streams on one connection.

Proof from inside the process: a reproduction of the exact configuration,
instrumented with `URLSessionTaskMetrics`, showed all eight 206 bodies on the
same local port, `isReusedConnection: true`; with one session per worker,
eight distinct ports. `nettop` on the real `slotstream pull --connections 8`
showed one data-carrying flow. Interleaved same-minute pairs on the home link:

| round | one session, 8 tasks | 8 sessions, 8 tasks |
|---|---|---|
| 1 | 16.0 MB/s, 1 connection | 41.5 MB/s, 8 connections |
| 2 | 28.5 MB/s, 1 connection | 56.8 MB/s, 8 connections |

Nothing else serializes the workers (read end to end: eight threads, each
`dataTask` + semaphore); the delegate's `pwrite` path is not the limit (the
local-server pull below runs it at 3.2 GB/s); the same server IP served both
modes; request counts are identical.
