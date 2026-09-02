---
type: measurement
id: 01m1hhwmde309q87992wc2y5sp
created: 2026-09-02T17:15:26.510444+00:00
updated: 2026-09-02T17:15:26.510444+00:00
summary: 'Why one connection is slow: window over round trip'
date: 2026-09-01
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
- '[[records/machines/linux-host-helsinki-1gbit]]'
milestone: M10
order: '530'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'Why one connection is slow: window over round trip'
status: analysis
---

macOS caps a single TCP receive window at 4 MiB (`net.inet.tcp.autorcvbufmax`).
Per-connection throughput cannot exceed window / RTT. The TCP handshake to the
host that serves the bytes is 99 ms from Popayán, giving a ceiling near 42 MB/s
before any loss (measured 25 to 40); from Helsinki it is 35 ms, so the window
does not bind there (measured 72, set by the far end).

Where the bytes come from: `resolve/` answers 302 to
`us.aws.cdn.hf.co/xet-bridge-us/...`, the LFS bridge Hugging Face documents as
reconstructing a Xet-backed file for plain HTTP clients. That hostname resolves
through GeoDNS to Amazon EC2 addresses (checked against `ip-ranges.json`):
`us-east-1` for Colombia, `eu-west-3` (Paris) for Helsinki. The responses carry
CloudFront headers, but the TCP connection terminates at EC2, one region per
continent, so every user pays a regional round trip per connection.
