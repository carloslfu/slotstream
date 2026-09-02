---
type: claim
id: 01m1hhwp75pjdehj9dk1ne67hd
created: 2026-09-02T17:15:28.357070+00:00
updated: 2026-09-02T17:15:28.357070+00:00
summary: A full install runs at 112 MB/s from a 1 Gbit/s datacenter link
basis: measured
gate: none
needle: 112 MB/s
supported_by:
- '[[records/measurements/the-fix-and-its-gates]]'
- '[[records/measurements/post-release-0-2-1-installed-through-install-sh-2026-09-01]]'
surfaces: README.md, docs/CLI.md
title: A full install runs at 112 MB/s from a 1 Gbit/s datacenter link
status: current
---

Measured from the Helsinki 1 Gbit/s port with eight real TCP connections after the 0.2.1 fix: 112 MB/s, the port, a 15.5 to 16 minute install, VERIFY PASS. Home links measured 44 to 63 MB/s and cap every host alike. Nothing above 1 Gbit/s has been measured.
