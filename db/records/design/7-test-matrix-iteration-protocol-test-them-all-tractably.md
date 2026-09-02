---
type: design
meta-type: conclusion
id: 01m1hhwndfb1zzf2j9g409hzmd
created: 2026-09-02T17:15:27.535457+00:00
updated: 2026-09-02T17:15:27.535457+00:00
summary: 7. Test matrix & iteration protocol ("test them all", tractably)
date: 2026-08-28
doc: plan
level: '2'
order: '180'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 7. Test matrix & iteration protocol ("test them all", tractably)
---

Three stages so the combinatorics stay sane:

- **Stage A — simulator sweep (cheap, thousands of configs).** The M1 cache simulator
  replays recorded router traces against {policy × slot-count × prefetch-window} in
  minutes, no model needed. Output: h-curves per workload per tier → prune to top-3
  configs per tier.
- **Stage B — live sweeps on the dev Mac.** Real engine, real SSD: run Stage-A winners per
  tier using `--sim-ram` (hard-capped budgets emulating 8–32 GB on this 48 GB machine),
  plus the axes the simulator can't see (QD, staging, io-mode, dense-sweep threshold,
  quant recipe). `slotstream bench` emits JSON + markdown into `bench/results/<host>/`,
  committed.
- **Stage C — real machines.** The binary + `bench --suite full` is a 10-minute favor on
  any Mac. Validate ≥1 real ≤16 GB machine before claiming the tier (sim-RAM can't emulate
  the real wired-limit and slower SSD). Borrow/family machines; MacStadium rental is the
  fallback.

**Bench workloads** (fixed, versioned in `bench/workloads/`): W1 cold-start→first-token ·
W2 warm short chat (256/256) · W3 8k prefill+512 · W4 64k prefill+512 (≥48 GB tiers) ·
W5 15-min sustained generation (thermal/soak) · W6 agentic trace replay (many short
alternating turns — realistic expert locality) · W7 two queued clients.
**Metrics per run**: ttft, prefill tok/s, decode tok/s p50/p95, slot hit rate, GB read,
read amplification, peak phys_footprint, wired GPU MB, **swap delta (must be 0)**, SSD
MB/s, thermal pressure + energy (powermetrics).

**Iteration protocol** (repeat until §11 done): pick worst tier vs targets → profile
(Instruments Metal System Trace + fs_usage) → change one knob → bench → commit results +
update preset table → next. Locality traces from real usage (opt-in local stats) feed back
into hot-set lists.

---
