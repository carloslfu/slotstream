---
type: machine
id: 01m39nfatf9emxb7z30648fxp2
created: 2026-09-24T12:15:33.198798+00:00
updated: 2026-09-24T12:15:33.198798+00:00
summary: The 32 GB MacBook Air (Apple M5, macOS 27) the 2026-09-24 live shared-prefix acceptance ran on
chip: Apple M5
kind: mac
os: macOS 27.0 (Darwin 27)
ram_gb: '32'
ssd: internal 994.61 GB
title: MacBook Air, Apple M5, 32 GB (local test host)
---
The machine the 2026-09-24 live shared-prefix acceptance ran on: a MacBook Air
(Mac17,3), Apple M5, 10 cores (4 performance, 6 efficiency), 32 GB of unified
memory (the engine prints 34 GB decimal) and a 994.61 GB internal SSD, on
macOS 27.0 (Darwin 27).

`slotstream serve --memory-gb 10` planned "~21 of 512 experts per layer (1013
global slots = 2.8 GB pool)", a "~9.0 GB full-workload envelope" and a
256-token prefill pass at about 85 tok/s, after reporting "20.7 GB reclaimable
now" against a 26.8 GB Metal working set. The disk tier held 0.36 GB of its
8 GB quota after the acceptance.

Smaller than [[records/machines/macbook-pro-m5-pro-48gb]], the 48 GB dev Mac
every number through 2026-09-02 came from. Results on this machine are
functional acceptance on a 32 GB Mac of the kind the project targets; no
timing is claimed from them.
