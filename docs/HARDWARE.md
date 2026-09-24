<a id="measured-on-real-macs"></a>

# Hardware and speed

## What you need

- An Apple Silicon Mac, with macOS 14 or later.
- About 110 GB of free SSD space for the model.

Choose Apple menu → About This Mac to check your chip and memory. The
installer has been tested on macOS 14 and 15; model runs have been tested
on macOS 26. Windows, Linux, and Intel Macs are not supported by this engine.

Slotstream is built for Macs with 16 to 64 GB of memory, where the model
cannot fit. It runs on 96 GB and larger Macs too, where the model fits in
memory, but it is not optimized for them; see
[Who it's for](../README.md#who-its-for).

**Compatibility-tier support is coming soon.** An 8 GB Mac can't run the
current model: even the smallest memory plan needs more
memory than it has, so Slotstream refuses to start instead of swapping. On
other Macs, close memory-heavy apps before running the model.

To check your own Mac without downloading or loading anything, run:

```sh
slotstream doctor
```

## Understanding speed

A **token** is a small piece of text, often part of a word. `tok/s` means
tokens per second. The speeds below describe a reply after the model's
cache has warmed up. Prompt-processing measurements appear separately below.
The first reply also needs time to load the model and
process your question. Long conversations take longer to process.

Your chip, SSD, and other running apps affect speed. A memory size alone
isn't enough to predict it.

<a id="rows"></a>

## Results

These reply-generation results were measured on real Macs, using different
releases and settings. The leading result remains the latest qualified warm
decode benchmark. The [0.2.23 calibration attempt](../db/records/measurements/release-speed-calibration-2026-09-22.md)
has not yet qualified a replacement full-answer baseline:

| Mac | Memory | Reply speed |
|---|---|---|
| **MacBook Pro, M5 Pro (our development Mac), 0.2.19 at a 22 GB target** | **48 GB** | **15.86 tok/s** |
| Same M5 Pro, 0.2.16 configuration at a 20 GB target | 48 GB | 13.47 tok/s |
| Same M5 Pro, historical 0.2.3 result | 48 GB | ~12 tok/s |
| Mac mini, M2 (base storage) | 16 GB | 1.41 tok/s |
| MacBook Air, M5 | 32 GB | 6.22 tok/s |
| MacBook Pro, M4 Max | 36 GB | 8.41 tok/s |
| MacBook Pro, M3 Max | 64 GB | 12.38 tok/s |
| MacBook Pro, M4 Max | 64 GB | 15.93 tok/s |
| Same M4 Max, model on a 10 Gb/s external SSD | 64 GB | 2.98 tok/s |
| MacBook Pro, M5 Max, 0.2.3, auto (34.6 GB target) | 128 GB | ~21–22 tok/s |
| Same M5 Max, 0.2.3, 48 GB target | 128 GB | ~26.9 tok/s |
| Same M5 Max, 0.2.3, 73 GB target | 128 GB | ~31.5 tok/s |

The historical leading M5 Pro result is the 0.2.19 release benchmark of the
shipping forecast against the 0.2.18 forecast (1.10x faster, 14.38 to 15.86 tok/s,
identical output). Both arms used smaller prompt passes and disabled prefix
caching, so more of the same budget held experts. These are controlled
benchmark settings, not today's automatic configuration; the 0.2.16 row is the pre-release benchmark of that release's
configuration. The M5 Pro results are from the author; the
others are community reports. The M5 Max rows are outside the target range:
the model fits in memory on that Mac, and engines that keep it resident
report faster replies there.
The 18 and 24 GB sizes still need reports, and 8 GB Macs don't run the
model. Open the details below for versions, settings, and credits.

<details>
<summary>Full results and test conditions</summary>

| Mac | Memory | SSD | macOS | slotstream | Plan | Warm decode | Long prompt | Reported memory | Reported by |
|---|---|---|---|---|---|---|---|---|---|
| MacBook Pro, M5 Pro | 48 GB | internal, 2 TB | 26.6.2 | 0.2.19 | 22 GB target, two drafts, corrected decode forecast, ~100 experts/layer | 14.38 to 15.86 tok/s with the corrected forecast, arm medians over counted cells from 24 held-out pairs | not measured | not recorded | [@carloslfu](https://github.com/carloslfu), 2026-09-16 |
| MacBook Pro, M5 Pro | 48 GB | internal, 2 TB | 26.6.2 | 0.2.16 candidate | 20 GB target, two drafts, decode lookahead, ~88 experts/layer | 11.79 to 13.47 tok/s with the lookahead, arm medians over eligible runs from 34 held-out pairs | not measured | not recorded | [@carloslfu](https://github.com/carloslfu), 2026-09-13 |
| MacBook Pro, M5 Pro | 48 GB | internal, 2 TB | 26.6 | 0.2.3 | auto: 33 GB target, ~152 experts/layer | ~12 tok/s; 12.8 with `--mtp` at a 28 GB memory target | ~220 tok/s at a 4096-token pass (est.) | 32 GB (estimate) | [@carloslfu](https://github.com/carloslfu), 2026-09-02 |
| Mac mini, M2 | 16 GB | internal, 256 GB | 26.6.2 | 0.2.2 | auto: 10.2 GB target, ~21 experts/layer | **1.41 tok/s** | not measured; `context-check` postdates 0.2.2 | 6.1 GB | [@flol's report](https://github.com/carloslfu/slotstream/issues/5), 2026-09-02 |
| Same Mac mini, M2 | 16 GB | internal, 256 GB | 26.6.2 | 0.2.3 | auto: 10.7 GB target, ~25 experts/layer | **1.48 tok/s** | 11 tok/s for 8192 tokens (12.1 min) | 8.1 GB RSS on the long prompt | [@flol's re-run](https://github.com/carloslfu/slotstream/issues/5#issuecomment-5525389653), 2026-09-03 |
| MacBook Air, M5 | 32 GB | 1 TB; location not specified | 26.6.2 | 0.2.11 | 22 GB target, ~75 experts/layer planned | **6.22 tok/s** | 126.28 tok/s for 8192 tokens, 2048-token passes | 17.75 GB RSS on the long prompt | [@arczhi's report](https://github.com/carloslfu/slotstream/issues/12), 2026-09-07 |
| MacBook Pro, M4 Max | 36 GB | internal, 1 TB | 26.0.1 | 0.2.22 | auto: 27.1 GB target, ~90 experts/layer | **8.41 tok/s** | 166 tok/s for 8192 tokens (27.1 GB target) | 24.8 GB process peak on the long prompt | [@JohnClarkson's report](https://github.com/carloslfu/slotstream/issues/26), 2026-09-20 |
| MacBook Pro 14", M3 Max | 64 GB | 512 GB; location not specified | 27.0 | 0.2.18 | auto: 48.1 GB target, ~119 experts/layer | **12.38 tok/s** | 213 tok/s for 8192 tokens (34.6 GB target) | 30.1 GB process peak on the long prompt | [@merken's report](https://github.com/carloslfu/slotstream/issues/20), 2026-09-16 |
| MacBook Pro 16", M4 Max | 64 GB | internal, 1 TB | 27.0 | 0.2.22 | auto: 48.1 GB target, ~119 experts/layer | **15.93 tok/s** | 270 tok/s for 8192 tokens (34.6 GB target) | 30.1 GB process peak on the long prompt | [@YenHub's report](https://github.com/carloslfu/slotstream/issues/22), 2026-09-19 |
| Same M4 Max, external SSD | 64 GB | external, 1 TB, USB 3.2 Gen 2 (10 Gb/s) | 27.0 | 0.2.22 | auto: 48.1 GB target, ~119 experts/layer | **2.98 tok/s** | 51 tok/s for 8192 tokens (34.6 GB target) | 30.2 GB process peak on the long prompt | [@YenHub's report](https://github.com/carloslfu/slotstream/issues/23), 2026-09-19 |
| MacBook Pro 16", M5 Max | 128 GB | internal, 2 TB | 26.6.2 | 0.2.3 | auto: 34.6 GB target, ~152 experts/layer | ~21–22 tok/s with speculative decoding | not measured | not measured; server path only | [@waterliu1981's update](https://github.com/carloslfu/slotstream/issues/6#issuecomment-5520489176), 2026-09-03 |
| Same M5 Max | 128 GB | internal, 2 TB | 26.6.2 | 0.2.3 | manual: 48 GB target, ~253 experts/layer | ~26.9 tok/s with speculative decoding | not measured | not measured | same report |
| Same M5 Max | 128 GB | internal, 2 TB | 26.6.2 | 0.2.3 | manual: 73 GB target, ~401–441 experts/layer as reported | ~31.5 tok/s with speculative decoding | not measured | not measured | same report |

The historical memory values retain their original measurement limits. The
M5 Pro figure is a planner estimate, and older reported values do not establish
the kernel lifetime footprint peak added by the reporting correction. These
hardware configurations have not been requalified with the new counter.

The 16 GB M2 and 32 GB M5 Air results are below the planner's estimates,
and the 36 GB M4 Max's 8.41 tok/s is just under its ~9. The 64 GB M3 Max and
the 64 GB M4 Max on its internal SSD are above their ~11 estimate, and the
128 GB M5 Max result is above its estimate. The planner uses the M5 Pro curve
and doesn't model these differences.

The 64 GB M4 Max separates disk speed from everything else: with the same
plan and release, it decoded 15.93 tok/s from its internal SSD and 2.98 tok/s
from a 10 Gb/s USB drive that read 0.9 GB/s. A 16 GB Mac with a fast SSD would
still help separate disk speed from memory capacity at the small end.

The three 0.2.22 reports ran without the decode-forecast file added in 0.2.19.
Their logs print `no correction at lookahead/tap-correction-attention-rank128-v1.safetensors`.
`slotstream pull` fetches the 37.5 MB file; through 0.2.24, the download
`slotstream run` offers on first use did not.

The Air's long-prompt test explicitly used a 22 GB target with vision and
speculative decoding off. Its full warm-server command and system load were
not supplied. The M5 Max row uses the reporter's updated results after
moving from 0.2.1 to 0.2.3. Community results have not been independently
rerun by the author.

Full methods, raw reports, and limits are in [MEASUREMENTS.md](../MEASUREMENTS.md):
the M5 Pro throughout, the M2 in C1, the M5 Max in C2, the M5 Air in C3, the
M3 Max in C4, the 64 GB M4 Max in C5 and the 36 GB M4 Max in C6.

### What the columns mean

- **Plan**: the target and cache size `slotstream doctor` prints with nothing
  else running. Auto sizes down while other apps hold memory, so say what was
  open.
- **Warm decode**: tokens per second on the third identical request to a
  running server, once the expert cache has warmed up. The first generation
  in a fresh process is colder and slower; report it too.
- **Long prompt**: prefill tokens per second from `context-check`, which
  reads a synthetic prompt through the real engine with process-budget and
  real-headroom safeguards. Keep paging observations with any timing result.
- **Peak**: the process-memory bound reported by `run` and `context-check`,
  combining native lifetime physical-footprint and RSS peaks with current
  usage; request samples are separate observations. This is measured separately
  from the plan's estimate.

</details>

## Recent prompt-processing results

Changes shipped in 0.2.23 have separate prompt-processing measurements on the
48 GB M5 Pro at a 10 GB target. Each row has three clean matched pairs and
identical generated token IDs within every pair. Times are medians within
each arm; the percentage is the median of paired reductions, so it need not
equal the percentage calculated from the two displayed medians.

| Workload | Matched control | Median times, control → enabled | Median paired time reduction |
|---|---|---|---|
| 16K inventory prompt, MTP on | Larger-read workspace policy off | 155.22 s → 53.94 s prefill | 65.40% |
| 2K prose follow-up, MTP off | Prefix checkpoints disabled | 30.73 s → 4.42 s request | 85.62% |

The inventory fixture reads 16,387 synthetic tokens with two MTP drafts and
emits 11 tokens before its stop token. Both arms use fused attention; the
control disables fused-workspace accounting. It qualifies the automatic
read policy before release, not the complete change from the prior release.
See the [policy qualification](../db/records/measurements/mtp-prefill-policy-2026-09-21.md).

The prose fixture tests the installed release. It reads 2,090 tokens on its
first request, then 2,092 on the follow-up, reusing 2,048 and emitting the
same 16 capped output tokens in both arms. The table measures only the
follow-up. Only one complete two-request pair passes the timing gates, so the
percentage is not a repeated full-session result. Earlier releases already
had prefix caching; this is its benefit against disabled checkpoints, not an
incremental release gain.

The [published-release audit](../db/records/measurements/published-prompt-speed-audit-2026-09-22.md)
also covers other prompt types, lengths, budgets, MTP settings and disk reuse.
Short requests show no consistent speedup. Paging-affected long-request
comparisons stay excluded from qualified timing claims; the larger-memory
release comparison and kernel-only attribution have too few clean pairs for
a repeated claim. None of these percentages updates the warm reply-speed
ranges or establishes a speedup on another Mac.

### Fresh installed-release first reads and exact repeats

The same development Mac and memory target were measured with ordinary
caching and planner-owned settings. The table separates prompt processing
from the full repeated request, which includes a capped reply:

| Prompt | Eligible first reads / repeats | First-read prefill range | Median repeated request |
|---|---:|---:|---:|
| 2K code | 4 / 3 | 13.86–28.11 s | 2.79 s |
| 2K prose | 3 / 3 | 14.91–26.51 s | 3.22 s |

The prospective desktop load and process-page-in screen passed for the
included observations. Several runs had system swap-ins; the stricter global
no-swap subset is insufficient for a repeated first-read claim. Request
history changed read batching despite an unchanged memory plan. The linked
[measurement](../db/records/measurements/release-prefill-2k-2026-09-22.md)
keeps server-first prompts and later misses separate and preserves every
excluded request. These observations do not establish a new decode headline,
a general ETA correction, or a whole-release speedup.

## Does more memory help?

Within Slotstream, yes: a larger expert cache reduces SSD reads and improves
reply speed. From 96 GB the model fits in memory; Slotstream runs there and
benefits from a larger cache, but that is not the case it is optimized for,
and engines that keep the model resident report faster replies there. See
[Who it's for](../README.md#who-its-for).
The clearest community evidence is
[@waterliu1981's cache sweep](https://github.com/carloslfu/slotstream/issues/6#issuecomment-5520489176)
on the same M5 Max, using Slotstream 0.2.3 with speculative decoding enabled:

| Total-process memory target | Reported warm reply speed |
|---|---|
| 34.6 GB (auto) | ~21–22 tok/s |
| 48 GB (manual) | ~26.9 tok/s |
| 73 GB (manual) | ~31.5 tok/s |

All three runs used the same Mac with 128 GB installed memory. The targets
are decimal GB budgets, not measured process peaks or installed-memory
requirements. This comparison supports a gain from allocating more memory
on that machine; comparing its auto result with the M5 Pro alone would not
isolate the effect of memory.

The manual rows are the reporter's warm-speed summaries, without the repeated
per-run timings supplied for auto. They have not been independently rerun or
remeasured on 0.2.16. The report does not establish a universal scaling curve,
a best automatic target, or a larger qualified context window. See
[memory defaults and overrides](../README.md#why-doesnt-slotstream-use-all-of-my-ram)
to try a larger target while leaving room for macOS and other apps.

## Speed estimates

### Planning ranges

The README's estimates combine the real reports above with the development
Mac's measured configurations and planner curve. They are rough expectations
across hardware and settings, not a fitted scaling model or statistical
confidence intervals. Endpoints are rounded outward to whole tok/s.

| Installed RAM | Estimated warm reply speed | Basis and main inference |
|---|---|---|
| 16–<24 GB | ~1–6 tok/s | The M2 mini reported 1.41 tok/s; the M5 Pro-based 16/18 GB simulations estimate about 4 to 5.5 tok/s. The upper end has not been measured on a real Mac in this band. |
| 24–<48 GB | ~6–16 tok/s | The 32 GB M5 Air reported 6.22 tok/s on 0.2.11; the M5 Pro measured 15.86 tok/s on 0.2.19 at a 22 GB process target, rounded outward to 16. That benchmark used different prompt-workspace and cache settings from today's automatic plan. The upper end assumes a comparable chip and SSD; no Mac in this band has been timed on 0.2.19. The 36 GB M4 Max reported 8.41 tok/s on 0.2.22, inside the range. |
| 48–<96 GB | ~15–27 tok/s | The lower reference rounds down from the 48 GB M5 Pro's 15.86 tok/s on 0.2.19 at a 22 GB target, below its own 33.6 GB automatic target, whose larger cache has not been timed; the 0.2.16 result at a 20 GB target was 13.47 tok/s, and the older ~12 tok/s result remains historical evidence. A 64 GB M4 Max reported 15.93 tok/s on 0.2.22. A 64 GB M3 Max reported 12.38 tok/s on 0.2.18, below this range; a rerun on the current release is pending. The upper end transfers the M5 Max's 26.9 tok/s at a 48 GB process target to a comparable Mac with enough available memory. That run used a 128 GB Mac; it was not a measurement of a 48 GB Mac. |
| 96 GB+ | ~20–32 tok/s | The 128 GB M5 Max reported about 21 to 22 tok/s in auto and 31.5 tok/s at a 73 GB process target. Applying this range to other Macs in the band is an estimate. This row is outside Slotstream's target range: the model fits in memory from 96 GB. |

The 96 GB+ row's lower endpoint allows for the same reporter's roughly 20 tok/s
warm auto runs on 0.2.1; the main results table uses the updated 0.2.3 report.
The upper ends of High and the 96 GB+ row assume an M5 Max-class chip, fast
internal SSD, speculative decoding and manual targets that leave room for macOS and
other apps. A 48 GB process target cannot consume all of a Mac's installed
48 GB; it needs a larger machine. These ranges mix releases, so they are not
predictions for a single current build. No release-speedup multiplier was
applied to community reports.

A slow SSD, older chip, different prompt, draft acceptance or memory pressure
can produce results outside the ranges. The 64 GB M4 Max decoded 2.98 tok/s
with the model on a 10 Gb/s external drive, far below its band. More RAM
helps only when the engine can use it to reduce a bottleneck; the band labels do not establish a causal
speed ranking. In particular, there is no measured performance boundary at
96 GB. The shared context recommendation reflects the current planning
guidance, independently of reply speed.

### Automatic memory plans

The columns were checked against the published 0.2.23 binary. They describe
the plans in auto mode, which picks the
context window along with the target and speculative decoding. The draft file
is available and no other apps hold memory. Simulated RAM is in decimal GB; a
Mac's marketed memory capacity can produce a different decimal-GB device
reading and target. Auto picks 32,768 tokens through 32 GB of simulated RAM,
65,536 at 36 GB, 32,768 at 48 GB, 131,072 at 64 GB and 262,144 from 96 GB.

| Simulated RAM (decimal GB) | Automatic memory target | Speculative decoding | Automatic context window |
|---|---|---|---|
| 8 GB | No plan fits | Not applicable | Not applicable |
| 16 GB | 10 GB | Off | 32,768 |
| 18 GB | 11.5 GB | Off | 32,768 |
| 24 GB | 16 GB | Off | 32,768 |
| 32 GB | 22 GB | On | 32,768 |
| 36 GB | 25 GB | On | 65,536 |
| 48 GB | 33.6 GB | On | 32,768 |
| 64 GB | 43.2 GB | On | 131,072 |
| 96 or 128 GB | 54.7 GB | On | 262,144 |

Speculative decoding in the source plans includes 0.2.16's decode lookahead.
These are allocation plans, not measured performance tiers. The matching
M5 Pro-based warm-decode estimates without speculative decoding are
~4 tok/s at 16 GB, ~5.5 tok/s at 18 GB and ~8 tok/s at 24 GB of simulated
RAM. The historical 22 GB benchmark measured 15.86 tok/s on 0.2.19 with two
drafts at about 100 experts per layer (14.38 with the 0.2.18 forecast).
Although its total budget matches the 32 GB simulation, its smaller prompt
passes and disabled prefix cache leave a different expert pool. It does not
measure the current automatic plan. The earlier estimate of about 10 tok/s
came from a two-draft measurement at 76 experts per layer on 0.2.14; the real
M5 Air result above was slower. A shared memory budget does not establish
matching runtime settings or speed.

The 15.86 tok/s result with the corrected forecast at about 100 experts per
layer, and the 13.47 tok/s result of 0.2.16 at about 88, are measured references,
not predictions for larger caches. Larger caches have not been timed with
0.2.19 yet; the M5 Max sweep above
demonstrates gains beyond auto with an earlier release. Do not apply the
development Mac's release speedup to those community figures.

**Auto mode picks the memory target, cache size, speculative decoding and
context window.** It takes the largest window of 32,768, 65,536, 131,072 or
262,144 tokens that keeps speculative decoding and the decode lookahead as the
32,768-token plan has them, keeps one complete conversation of that length for
follow-up turns, and adds at most 10% to the planner's estimate for a typical
request of 2,000 prompt tokens and a 400-token reply. `slotstream doctor
--sim-ram <GB>` shows every candidate and its reason. At 24 GB a 65,536-token
window would add 18%, and at 32 GB it would turn speculative decoding off.
At 36 GB it adds 9%, as the cache drops from 96 to 75 experts per layer.
At 48 GB, auto keeps the original cache because its size exceeds the measured
decode range: the estimate cannot price the loss, even when it reports little
or no change. At 64 GB, 262,144 would add 18%.
From 64 GB the larger window's memory comes from room the 32,768-token plan
leaves unused, so the cache keeps its size and the target rises above that
plan's 34.6 GB, to 43.2 GB at 64 GB and 54.7 GB from 96 GB. Real available
memory and Metal limits can change these decisions; a busy start applies the
same cache and speed rules before choosing its window. A larger Mac can
therefore receive a smaller window when widening it would sacrifice cache
whose performance benefit is unmeasured. `--max-context N` fixes any
window up to 262,144; on a 32 GB Mac, `--max-context 65536` gives the larger
window without speculative decoding.

For prompts near 32,768 tokens, the planner estimates about 3 minutes of
prefill from 24 GB and 6.4 minutes at 16 GB; near 65,536 it estimates
about 8 minutes from 24 GB. These estimates use the M5 Pro's prefill curve,
not measurements on those memory sizes. The planner's historical prefill
curve has not been recalibrated for the new read policy; the bounded results
above cannot supply a multiplier for every pass size, prompt and context.
Windows above 128,256 tokens have no
calibrated estimate yet. On the development Mac, a full 131,072-token prompt
took 38 minutes to read at a 16 GB target, and its passes slowed as the prompt
grew: the planner's estimates, which ignore position, came within a few
percent of the measured time at 65,536 tokens and fell about a third short of
it past that. Leave room for the reply in the
configured window. Startup, queueing, images and reasoning before visible
answer text add to the user's wait.

The repeated target from 96 GB is the intentional conservative default: the
33 GB base ceiling plus the draft head and the full window's charge. Auto does
not increase its ceiling for the M5 Max's demonstrated larger-cache gains. These simulated plans
describe allocation policy; they do not measure speed. See
[memory defaults and overrides](../README.md#why-doesnt-slotstream-use-all-of-my-ram).

## How to measure

Context is a startup choice. Since 0.2.17 auto picks it for each Mac and
`--max-context` fixes it; 0.2.14 added the feasibility report and request-wait
controls described here.
Use `doctor --json` with the intended `--max-context` and memory policy to inspect the feasible
window before loading. A memory-feasible window does not promise a short wait:
the request-to-first-token budget defaults to 30 minutes, including preparation
and queueing. Setting `--max-prefill-wait 0` disables only that time policy.

Keep the configured window, prompt count and required reply count with each
result. Capacity evidence needs a complete prompt and reply and process memory
within budget, including sampled footprint and lifetime peaks. Record global
paging separately; it does not identify which application caused it. Report MTP and vision separately;
a text-only capacity result does not qualify those modes or answer quality.

Allow about ten minutes once the weights are downloaded. Close other
memory-heavy apps if you want clean speed measurements, and exclude timing
intervals affected by paging. Functional checks can run with other apps open
when the memory and pressure safeguards permit it. Run one model
process at a time.

To share your Mac's results, follow the [measurement steps](TESTING.md#measure-your-mac),
then open a [measurement report](https://github.com/carloslfu/slotstream/issues/new?template=measurement-report.yml).
Allow about ten minutes once the model is downloaded. Reports are credited
to their authors.

The full [engineering notes](ENGINEERING.md#speed) explain prompt-processing
time, memory use, and the methods behind the performance claims.
