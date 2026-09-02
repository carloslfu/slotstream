---
type: design
meta-type: conclusion
id: 01m1hhwnbbmez0xhbrt0wkby5d
created: 2026-09-02T17:15:27.467669+00:00
updated: 2026-09-02T17:15:27.467669+00:00
summary: Presets v1 (est. columns to be replaced by M8 measurements)
date: 2026-08-28
doc: plan
level: '3'
order: '160'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: Presets v1 (est. columns to be replaced by M8 measurements)
---

Budget rule: total footprint ≤ ~65–70% of RAM **and** under
`max_recommended_working_set_size`, leaving OS+apps alive. ✅measured on this Mac:
working set = **37.4 GiB of 48 GB** (78%), so the real ceiling is tighter than "RAM"
everywhere — `doctor` must read this value, not infer it from `hw.memsize`. Also
✅measured: `max_buffer_length` = **28.1 GiB**, which caps any *single* MLXArray;
harmless in the 9-tensor pool layout (a 204-experts/layer = 27 GB pool's largest tensor is 8.0 GiB) but
it would have been binding for a single-tensor pool.

Resident floor ✅measured at **3.822 GB** (everything except experts and n-gram),
up from the 3.3 GB estimated — footprints below include this.

**✅ Auto-tuning planner implemented (2026-08-28), replacing named presets as the
default UX.** `SlotstreamCore/Plan.swift` is the single policy used by run/serve/
doctor and echoed in `/api/show` `details.memory_plan`. Policy: ceiling =
min(70% of RAM, working set − 2 GB), then **clamped to currently reclaimable
memory** (free + purgeable + file-cache pages via `host_statistics64` — what can
be taken without compressing/swapping other apps; `kern.memorystatus_level` was
rejected as too optimistic) minus max(1.5 GB, 5% RAM) slack, with an explanatory
note whenever the clamp binds; quiet machine ⇒ clamp never binds ⇒ deterministic.
Pool = target − 3.9 GB fixed footprint (resident weights + n-gram row cache)
− 0.5 GB margin; floor 640 global slots (~14/layer); min honest target 6.2 GB.
Precedence `--experts-per-layer` > `--pool-gb` > `--memory-gb` > auto, losing
knobs noted, never silently dropped; explicit knobs are never resized by the
clamp (informational note only). `doctor --sim-ram/--sim-working-set/
--sim-available` previews any machine; `Tools/planner_gates.sh` pins seven setups
(48 GB pristine/busy, 16 GB pristine/busy, 8 GB, 128 GB, explicit-on-busy).
✅Measured live under a 21.5 GB incompressible hog: auto sized 36.1 → 10.7 GB
(47/layer), generated at a 9.4 GB actual peak with no thrash, and recovered to
34.4 GB when the hog exited.

**✅ Elastic pool implemented (2026-08-28): `serve` resizes the cache while
running.** `SlotstreamCore/Governor.swift` re-runs the feasibility replan every
15 s (crediting the pool + fixed footprint a restart would release; absolute
dead-bands −1 GB shrink / +2 GB grow, one-step convergence) and subscribes to
OS memory-pressure events as the overcommit backstop (warning ≥2 GB/15%,
critical ≥4 GB/50%, repeated events keep shedding; growth waits 60 s of calm).
Resizes run strictly between requests under the generation lock: grow copies
contents piece-by-piece (transient ≤ one piece), shrink frees before
reallocating (transient = max(old,new), restarts cold — under pressure,
holding two pools to keep warmth would spike memory at the wrong moment).
Auto-sized pools only; explicit knobs and `--no-elastic` pin. Byte-exactness
across live resizes is a standing gate (`slotstream elastic-check`), and live
hog experiments (shed cascade, identical outputs under pressure, contents-kept
recovery, macOS-swaps-idle equilibrium) are in MEASUREMENTS.
The startup announce prints device, target, experts/layer cached, expected peak,
and est. warm tok/s (log-linear between the measured anchors 30/layer = 5.6 and
181/layer = 20.0, flat above — decode is launch-bound past ~181/layer). Promise
✅measured: `--memory-gb 8` → 27/layer, **7.0 GB actual peak** (predicted 7.5),
5.2 tok/s, byte-identical greedy output; auto on this Mac → 36.1 GB target,
239/layer, **35.0 GB actual peak** (predicted 35.6). The preset table below
remains the cross-machine *map*; the planner is the *mechanism* that lands each
machine on its row without anyone reading the table.

| Preset | RAM | **Experts/layer cached** (of 512) | Cache mem | Footprint | Ctx default | h est. | Decode est. | Measured |
|---|---|---|---|---|---|---|---|---|
| `max192` | ≥192 GB | **512** + ngram resident, MTP on | 67.9 GB | ~110 GB | 262k | 1.0 | 40–80 | — |
| `big128` | 128 GB | **512**; ngram streamed | 67.9 GB | ~79 GB | 262k | 1.0 | 35–70 | — |
| `big96` | 96 GB | **~414**; ngram streamed | ~55 GB | ~63 GB | 128k | ~0.99 | 30–60 | — |
| `big64` | 64 GB | **~271** | ~36 GB | ~42 GB | 128k | .93–.98 | 25–45 | — |
| `pro48` ← this Mac | 48 GB | **~204** | ~27 GB | ~32 GB | 64k | .88–.96 | 18–35 | 20.0 warm @181/layer |
| `mid32` | 32 GB | **~121** | ~16 GB | ~21 GB | 32k | .80–.92 | 12–25 | — |
| `mid24` | 24 GB | **~79** | ~10.5 GB | ~15.5 GB | 32k | .70–.87 | 8–16 | — |
| `lite16` | 16 GB | **~41** | ~5.5 GB | ~10 GB | 16k | .55–.80 | 4–9 | 5.6 @30/layer (emulated) |
| `edge8` (experimental) | 8 GB | **~14** (the floor) | ~1.8 GB | ~5 GB | 8k | .30–.60 | 1–4 | — |

**The decode-est. column is now known to be too pessimistic at the low end.** With
17.3 GB/s measured, IO alone floors decode at ~13 tok/s even at h=0, so `lite16`
(4–9) and `edge8` (1–4) are wrong *as IO estimates*; their real limit is memory
pressure and compute. Those bands are left unrevised deliberately — M8 replaces them
with measurements rather than a second round of guessing.

Notes: fully-resident-incl-ngram on a 128 GB Mac (~110 GB with KV) exceeds the default
wired limit (~96 GB) — possible only with an explicit `iogpu.wired_limit_mb` bump, which
is why `big128` streams the n-gram store instead: it needs no sysctl and loses almost
nothing (n-gram IO is ✅measured at 16 rows ≈ 1.6 KB/token, exact-prefetched). Smaller Macs also have slower SSDs (1.5–3.5 GB/s) — folded into the est. bands;
`lite16`/`edge8` use trunk @4-bit to shave the floor; `edge8` may additionally need the
compact 3-bit expert build and a raised `iogpu.wired_limit_mb` (doctor detects + explains,
never auto-sudos). External USB4 NVMe (~3 GB/s) is a supported weights location — worth a
row in the matrix for 256 GB-internal-disk Macs.

---
