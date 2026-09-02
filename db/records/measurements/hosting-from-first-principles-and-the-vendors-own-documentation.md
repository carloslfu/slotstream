---
type: measurement
id: 01m1hhwmn6j9ke283bq4dd4j3n
created: 2026-09-02T17:15:26.758636+00:00
updated: 2026-09-02T17:15:26.758636+00:00
summary: Hosting, from first principles and the vendors' own documentation
date: 2026-09-02
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
- '[[records/machines/linux-host-helsinki-1gbit]]'
milestone: M11
order: '610'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: Hosting, from first principles and the vendors' own documentation
status: analysis
---

| Path | What the documentation and checks say | Verdict for speed |
|---|---|---|
| Hugging Face `resolve` bridge (today) | EC2 fleet, one region per continent seen (us-east-1, eu-west-3); anonymous `resolve` limited to 3,000 requests per 5 minutes per IP; signed bridge URL lasts about an hour | Equal to everything else at ≤ 1 Gbit/s; per-stream ~70 and per-node caps above that |
| Hugging Face Xet edge | `transfer.xethub.hf.co`, `cas-bridge.xethub.hf.co` and `cdn-lfs*.hf.co` resolve inside CloudFront's published ranges; xorbs are ≤ 64 MiB objects; CloudFront caches responses up to 50 GB; the protocol is public (token from the Hub, `GET /v2/reconstructions/{file_id}`, signed multi-range xorb fetches, LZ4 and byte-grouping chunk compression) with Rust and TypeScript reference clients | The only edge path that exists today for these exact bytes, free; the plain `resolve` client cannot use it; unmeasured |
| Cloudflare R2 + custom domain | No throughput limit documented on a custom domain (`r2.dev` is throttled); cacheable object limit 512 MB on Free/Pro/Business and 5 GB on Enterprise, `.safetensors` not a default-cached extension, so every 10 GB shard is served from R2 origin; zero egress, about US$1.60 a month of storage | Equal at gigabit (108 at 8 from Helsinki); an edge only if the shards are re-chunked below 512 MB; buys independence from Hugging Face, not speed |
| Own mirror on CloudFront + S3 | Caches the 10 GB shards whole; city-level POPs; about US$9 of egress per install | Faster only above ~3 Gbit/s per client |
| Vercel Blob | Amazon S3 underneath; served from 20 regional hubs on the network Vercel describes as cost-optimised "where ultra-low latency isn't essential"; cache cap 512 MB per blob, so every shard is origin on every request; US$0.05/GB transfer plus US$0.06/GB Fast Origin Transfer on each miss, about US$11.4 per install; simple-operation limits of 20/s (Hobby) and 120/s (Pro), and each 64 MB range on a >512 MB blob is one operation | No physics advantage over the bridge; a bill for the same speed |

Verdict: for every client at or below about 3 Gbit/s, which is every home
link and every 1 Gbit/s datacenter port, hosting cannot move the number, and
the default already sits at the physical ceiling. Above that, an edge with the
chunks hot a few milliseconds away is faster than the bridge, and the edge
that already exists for these bytes is Hugging Face's own Xet path through
CloudFront, which our HTTP `resolve` client bypasses.
