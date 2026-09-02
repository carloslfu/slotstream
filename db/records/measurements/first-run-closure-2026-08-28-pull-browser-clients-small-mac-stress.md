---
type: measurement
id: 01m1hhwkqvxzjjdfp6dsxx1fjm
created: 2026-09-02T17:15:25.819927+00:00
updated: 2026-09-02T17:15:25.819927+00:00
summary: 'First-run closure (2026-08-28): pull, browser clients, small-Mac stress'
date: 2026-08-28
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M4/M5/M6
order: '220'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'First-run closure (2026-08-28): pull, browser clients, small-Mac stress'
status: measured
---

**`slotstream pull`** (weights acquisition — the missing half of install UX) is
implemented and proven against the real network:

- Manifest of all 24 files (103.8 GB) with upstream LFS sha256, embedded at
  build time from the pinned revision (`PinnedModel.swift`) — integrity never
  depends on a live API. Disk-space check before any bytes move.
- `pull --verify` hashed the full local 103.8 GB against upstream in **14 s**
  (parallel SHA256, ~7.4 GB/s): **24/24 match** — the dev copy is byte-exact
  provenance-verified. Now a standing verify.sh gate.
- Interrupted download **resumed from the exact byte offset** (356 MB into a
  10 GB shard, HTTP Range), and survived a live **HTTP 429** rate-limit with
  backoff-retry from the same offset.
- A shard deliberately truncated to 2.0 GB was completed over the network and
  **passed sha256** — range-stitching is byte-exact.
- A part with one flipped byte at offset 1e9 was caught by the hash gate,
  **deleted, and refused** with a clear message; the rerun re-downloads fresh.
- Model names now resolve (`--model` defaults to the pinned name → dev
  checkout or `~/.slotstream/models`), and missing weights say
  "run: slotstream pull" instead of a stack trace.

**Browser clients (CORS)**: all responses carry `Access-Control-Allow-Origin`
and OPTIONS preflight answers with methods/headers/private-network. Preflight
verified on the wire; then a **real browser** ran a streaming `/api/chat` from
page JS: 5 NDJSON chunks, exact expected content, CORS header present. The
cross-origin probe from a public https page was blocked by the test browser's
own request filter (`net::ERR_BLOCKED_BY_CLIENT` — an extension-level block,
not a server refusal), so that path is unproven here; the case real web GUIs
use (localhost page → localhost API) is the one proven.

**Small-Mac stress (what is testable without the hardware)**: a 659-token
prompt (three prefill chunks) at the absolute floor — 14 experts/layer,
1.8 GB pool — completed with no pin exhaustion and coherent output at
**6.1 GB peak**, 3.9 tok/s decode. The same prompt at the pristine-16-GB-Mac
auto size (`--memory-gb 9.8`) peaked at **9.6 GB — promise held**, with the
long-prefill transient consuming 0.3 GB of the 0.5 GB planning margin (that is
what the margin is for). Note: decode after a long prefill runs slower than
the short-prompt anchors (3.5 vs ~7 tok/s at 41/layer) — KV/indexer overhead
plus a prefill-polluted cache; the est. table is anchored on short prompts.

**Soak (bounded)**: `serve --memory-gb 10` ran ~40 min with a request every
45 s — 28/28 requests succeeded, latency flat at 6–7 s, RSS flat across the
whole window: **no leak, no drift, no crash**. (The request loop itself paused
when the machine slept; the server rode through it.)

**RSS finding → MLX cache limit**: that soak surfaced a real hidden footprint —
**15.1 GB RSS for a 10 GB-target server**. MLX's allocator retains freed
transients (per-request KV caches, activations) in an unbounded internal
cache; the Metal "peak" metric doesn't show it, real process memory does. Fix:
`GPU.set(cacheLimit: 2 GB)` at engine init. Measured after: **6.0 GB RSS,
flat across requests, identical 6–7 s latency** — real process memory now
tracks the announced plan instead of exceeding it by 50%.

**verify.sh is now memory-adaptive**: the heavy equality gates size themselves
to what is reclaimable (181/layer when ≥32 GB, 60/layer otherwise, printed
when scaled) — the equality properties are size-independent, and the suite
must be runnable on a 16 GB contributor machine, or a busy 48 GB one, without
swamping it. Current full battery: **15/15 PASS**.

**Operational lesson (learned the hard way):** stacking two slotstream
instances plus a full test load (browser, builds, request loops) on one 48 GB
machine overcommitted the host and crashed it. The governor protects a single
auto-sized instance against the rest of the system; it cannot protect against
deliberately stacked model processes. Rule, now in the README: **one instance
per machine**; test instances get small explicit `--memory-gb` sizes.
