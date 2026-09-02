---
type: measurement
id: 01m1hhwmgt23m721x7s71yb1kx
created: 2026-09-02T17:15:26.618014+00:00
updated: 2026-09-02T17:15:26.618014+00:00
summary: The fix and its gates
date: 2026-09-01
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
- '[[records/machines/linux-host-helsinki-1gbit]]'
milestone: M10
order: '560'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: The fix and its gates
status: measured
---

One `URLSession` per worker (`httpMaximumConnectionsPerHost = 1` each, shared
delegate; the delegate already keyed tasks by its own `taskDescription`, so
sessions cannot collide). After every session has completed a chunk, `pull`
prints the distinct TCP connections it measured from task metrics — the first
version counted after two chunks per worker and once reported "15 of 16"
because one slower session had not finished its first chunk; it now waits for
all of them.

| gate | result |
|---|---|
| `Tools/static_gates.sh` | pass (planner 64/64, pull-check, runtime-check, installer, llms-full current) |
| `pull --verify` on the installed weights | VERIFY PASS, 9.5 s |
| full 24-file pull from a local Range server (SSD) | "8 connections in use", 3,183 MB/s, VERIFY PASS in 64 s |
| live mirror, `--connections 8`, 50 s | 8 flows in `nettop`, "8 connections in use", 57 to 63 MB/s cumulative (38 to 41 same evening before the fix) |
| live mirror, `--connections 16` | 16 flows, "16 connections in use", 63 MB/s (the link) |
| live mirror, `--connections 1` | 15 MB/s |
| kill at 3.0 GB, rerun | "101.0 GB to go", continues from the chunk map |
| Linux, 1 Gbit/s Hetzner port, Docker, exact `Pull.swift` via `Tools/pull_bench_linux.sh`, 8 connections, whole 103.8 GB | VERIFY PASS, 24/24 files; 112 MB/s average across the whole 103.8 GB, about 15.5 min wall (started 03:07 UTC, verified by 03:23); the port is 1000 Mbit/s |

What this does not settle: the reporting user's own ceiling (his link, not the
client, once eight real connections exist); anything above 1 Gbit/s (public
reports put Hugging Face at 500 MB/s to 1 GB/s with `hf_transfer` on 10 Gbit
links, unmeasured here); whether Popayán's 62 MB/s band is the ISP or CDN
peering; and the R2 custom-domain path.
