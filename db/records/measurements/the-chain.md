---
type: measurement
id: 01m1hhwmjx5ydtm3zn67bfa4s3
created: 2026-09-02T17:15:26.685764+00:00
updated: 2026-09-02T17:15:26.685764+00:00
summary: The chain
date: 2026-09-02
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
- '[[records/machines/linux-host-helsinki-1gbit]]'
milestone: M11
order: '590'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: The chain
status: measured
---

Wall time is bytes over the slowest of four terms: the client's link, the
source's per-client rate, connections × TCP window over round trip, and disk
plus hashing. The bytes are fixed (4-bit weights do not compress). Per term:

- **Client link.** The binding term at every vantage M10 measured. From
  Popayán, Hugging Face, R2 direct, Cloudflare's edge and a Cloudflare cache
  hit all landed at 47 to 62 MB/s over 8 connections; from Helsinki all four
  landed at 106 to 114, the 1 Gbit/s port.
- **Window over round trip.** macOS caps the receive window at 4 MiB
  (`net.inet.tcp.autorcvbufmax`), so one connection tops out near 42 MB/s at
  99 ms (Popayán to the Virginia bridge), near 60 at 70 ms (San Francisco to
  Virginia), near 140 at 30 ms. Eight connections cover a gigabit link up to
  roughly 300 ms of round trip; past that the default falls short.
- **Per-stream at the origin.** Object-store read paths cap near 70 MB/s per
  connection: from Helsinki one connection got 71 from Hugging Face and 68
  from R2 direct, while one connection to Cloudflare's edge got 103 and to a
  cache hit 100, which is the port. An edge cache has no per-stream cap that
  a gigabit link can see; an origin read path does.
- **Per node.** The `resolve` redirect lands on
  `us.aws.cdn.hf.co/xet-bridge-us/…` (checked 2026-09-02: HTTP/2, `206` with a
  correct `Content-Range` on a 10,039,592,993-byte shard, signed URL valid for
  about an hour). That hostname resolves to eleven A records, all EC2 and none
  inside CloudFront's published ranges (`ip-ranges.json`, service
  `CLOUDFRONT`). AWS documents 5 Gbps per single flow and 5 Gbps of internet
  egress per instance under 32 vCPUs (50% of the NIC above), so one bridge
  node is at most about 625 MB/s shared by every client on it, and the
  client's eight sessions almost certainly land on the same node.
- **Disk and hash.** Chunks stream to disk with `pwrite` as they arrive and
  files hash on completion; neither binds below several GB/s.
