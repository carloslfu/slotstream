<a id="measured-on-real-macs"></a>

# Hardware and speed

## What you need

- An Apple Silicon Mac, with macOS 14 or later.
- About 110 GB of free SSD space for the model.

Choose Apple menu → About This Mac to check your chip and memory. The
installer has been tested on macOS 14 and 15; model runs have been tested
on macOS 26. Windows, Linux, and Intel Macs are not supported by this engine.

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
cache has warmed up. The first reply also needs time to load the model and
process your question. Long conversations take longer to process.

Your chip, SSD, and other running apps affect speed. A memory size alone
isn't enough to predict it.

<a id="rows"></a>

## Results

These results were measured on real Macs, using different releases and settings:

| Mac | Memory | Reply speed |
|---|---|---|
| **MacBook Pro, M5 Pro (our development Mac), 0.2.16 configuration at a 20 GB target** | **48 GB** | **13.47 tok/s** |
| Same M5 Pro, historical 0.2.3 result | 48 GB | ~12 tok/s |
| Mac mini, M2 (base storage) | 16 GB | 1.41 tok/s |
| MacBook Air, M5 | 32 GB | 6.22 tok/s |
| MacBook Pro, M5 Max, 0.2.3, auto (34.6 GB target) | 128 GB | ~21–22 tok/s |
| Same M5 Max, 0.2.3, 48 GB target | 128 GB | ~26.9 tok/s |
| Same M5 Max, 0.2.3, 73 GB target | 128 GB | ~31.5 tok/s |

The latest M5 Pro result comes from the pre-release benchmark of the
configuration shipped in 0.2.16. The M5 Pro results are from the author; the
others are community reports.
The 18, 24 and 36 GB sizes still need reports, and 8 GB Macs don't run the
model. Open the details below for versions, settings, and credits.

<details>
<summary>Full results and test conditions</summary>

| Mac | Memory | SSD | macOS | slotstream | Plan | Warm decode | Long prompt | Reported memory | Reported by |
|---|---|---|---|---|---|---|---|---|---|
| MacBook Pro, M5 Pro | 48 GB | internal, 2 TB | 26.6.2 | 0.2.16 candidate | 20 GB target, two drafts, decode lookahead, ~88 experts/layer | 11.79 to 13.47 tok/s with the lookahead, arm medians over eligible runs from 34 held-out pairs | not measured | not recorded | [@carloslfu](https://github.com/carloslfu), 2026-09-13 |
| MacBook Pro, M5 Pro | 48 GB | internal, 2 TB | 26.6 | 0.2.3 | auto: 33 GB target, ~152 experts/layer | ~12 tok/s; 12.8 with `--mtp` at a 28 GB memory target | ~220 tok/s at a 4096-token pass (est.) | 32 GB (estimate) | [@carloslfu](https://github.com/carloslfu), 2026-09-02 |
| Mac mini, M2 | 16 GB | internal, 256 GB | 26.6.2 | 0.2.2 | auto: 10.2 GB target, ~21 experts/layer | **1.41 tok/s** | not measured; `context-check` postdates 0.2.2 | 6.1 GB | [@flol's report](https://github.com/carloslfu/slotstream/issues/5), 2026-09-02 |
| MacBook Air, M5 | 32 GB | 1 TB; location not specified | 26.6.2 | 0.2.11 | 22 GB target, ~75 experts/layer planned | **6.22 tok/s** | 126.28 tok/s for 8192 tokens, 2048-token passes | 17.75 GB RSS on the long prompt | [@arczhi's report](https://github.com/carloslfu/slotstream/issues/12), 2026-09-07 |
| MacBook Pro 16", M5 Max | 128 GB | internal, 2 TB | 26.6.2 | 0.2.3 | auto: 34.6 GB target, ~152 experts/layer | ~21–22 tok/s with speculative decoding | not measured | not measured; server path only | [@waterliu1981's update](https://github.com/carloslfu/slotstream/issues/6#issuecomment-5520489176), 2026-09-03 |
| Same M5 Max | 128 GB | internal, 2 TB | 26.6.2 | 0.2.3 | manual: 48 GB target, ~253 experts/layer | ~26.9 tok/s with speculative decoding | not measured | not measured | same report |
| Same M5 Max | 128 GB | internal, 2 TB | 26.6.2 | 0.2.3 | manual: 73 GB target, ~401–441 experts/layer as reported | ~31.5 tok/s with speculative decoding | not measured | not measured | same report |

The historical memory values retain their original measurement limits. The
M5 Pro figure is a planner estimate, and older reported values do not establish
the kernel lifetime footprint peak added by the reporting correction. These
hardware configurations have not been requalified with the new counter.

The 16 GB M2 and 32 GB M5 Air results are below the planner's estimates;
the 128 GB M5 Max result is above its estimate. The planner uses the M5 Pro
curve and doesn't model these differences.

A 16 GB Mac with a fast SSD would help separate disk speed from memory
capacity: the existing 16 GB and 48 GB machines differ in both. Reports from
older chips and external SSDs would also help test the estimates.

The Air's long-prompt test explicitly used a 22 GB target with vision and
speculative decoding off. Its full warm-server command and system load were
not supplied. The M5 Max row uses the reporter's updated results after
moving from 0.2.1 to 0.2.3. Community results have not been independently
rerun by the author.

Full methods, raw reports, and limits are in [MEASUREMENTS.md](../MEASUREMENTS.md):
the M5 Pro throughout, the M2 in C1, the M5 Max in C2, and the M5 Air in C3.

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

## Does more memory help?

Yes, a larger expert cache can reduce SSD reads and improve reply speed.
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
| 24–<48 GB | ~6–14 tok/s | The 32 GB M5 Air reported 6.22 tok/s; the M5 Pro achieved 13.47 tok/s at a 20 GB process target. The upper end assumes a comparable chip and SSD with enough memory for that configuration; it has not been timed on a Mac in this band. |
| 48–<96 GB | ~13–27 tok/s | The latest 48 GB M5 Pro result is 13.47 tok/s, rounded down for this estimate; its older ~12 tok/s result remains historical evidence. The upper end transfers the M5 Max's 26.9 tok/s at a 48 GB process target to a comparable Mac with enough available memory. That run used a 128 GB Mac; it was not a measurement of a 48 GB Mac. |
| 96 GB+ | ~20–32 tok/s | The 128 GB M5 Max reported about 21 to 22 tok/s in auto and 31.5 tok/s at a 73 GB process target. Applying this range to other Macs in the band is an estimate. |

The Ultra lower endpoint allows for the same reporter's roughly 20 tok/s
warm auto runs on 0.2.1; the main results table uses the updated 0.2.3 report.
The upper ends of High and Ultra assume an M5 Max-class chip, fast internal
SSD, speculative decoding and manual targets that leave room for macOS and
other apps. A 48 GB process target cannot consume all of a Mac's installed
48 GB; it needs a larger machine. These ranges mix releases, so they are not
predictions for a single current build. No release-speedup multiplier was
applied to community reports.

A slow SSD, older chip, different prompt, draft acceptance or memory pressure
can produce results outside the ranges. More RAM helps only when the engine
can use it to reduce a bottleneck; the band labels do not establish a causal
speed ranking. In particular, there is no measured performance boundary at
96 GB. The shared context recommendation reflects the current planning
guidance, independently of reply speed.

### Automatic memory plans

The columns describe 0.2.17 source plans in auto mode, which picks the
context window along with the target and speculative decoding. The draft file
is available and no other apps hold memory. Simulated RAM is in decimal GB; a
Mac's marketed memory capacity can produce a different decimal-GB device
reading and target. Auto picks 32,768 tokens through 32 GB of simulated RAM,
65,536 from 36 GB, 131,072 at 64 GB and 262,144 from 96 GB.

| Simulated RAM (decimal GB) | Automatic memory target | Speculative decoding | Automatic context window |
|---|---|---|---|
| 8 GB | No plan fits | Not applicable | Not applicable |
| 16 GB | 10 GB | Off | 32,768 |
| 18 GB | 11.5 GB | Off | 32,768 |
| 24 GB | 16 GB | Off | 32,768 |
| 32 GB | 22 GB | On | 32,768 |
| 36 GB | 25 GB | On | 65,536 |
| 48 GB | 33.6 GB | On | 65,536 |
| 64 GB | 43.2 GB | On | 131,072 |
| 96 or 128 GB | 54.7 GB | On | 262,144 |

Speculative decoding in the source plans includes 0.2.16's decode lookahead.
These are allocation plans, not measured performance tiers. The matching
M5 Pro-based warm-decode estimates without speculative decoding are
~4 tok/s at 16 GB, ~5.5 tok/s at 18 GB and ~8 tok/s at 24 GB of simulated
RAM. The estimate of ~10 tok/s at 32 GB instead uses the two-draft
measurement at 76 experts per layer on 0.2.14. It assumes the M5 Pro's chip
and SSD; the real M5 Air result above was slower.

The 13.47 tok/s result with lookahead at about 88 experts per layer is a measured reference,
not a prediction for larger caches. Larger caches have not been timed with
0.2.16 yet; the M5 Max sweep above
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
At 48 GB, 131,072 tokens would add 15%; at 64 GB, 262,144 would add 18%.
From 64 GB the larger window's memory comes from room the 32,768-token plan
leaves unused, so the cache keeps its size and the target rises above that
plan's 34.6 GB, to 43.2 GB at 64 GB and 54.7 GB from 96 GB. Real available
memory and Metal limits can change these decisions; a busy start lowers the
window before it gives up speculative decoding. `--max-context N` fixes any
window up to 262,144; on a 32 GB Mac, `--max-context 65536` gives the larger
window without speculative decoding.

For prompts near 32,768 tokens, the planner estimates about 3 minutes of
prefill from 24 GB and 6.4 minutes at 16 GB; near 65,536 it estimates
about 8 minutes from 24 GB. These estimates use the M5 Pro's prefill curve,
not measurements on those memory sizes. Windows above 128,256 tokens have no
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
