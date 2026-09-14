# Engineering notes

Technical background, performance measurements, and development references
for Slotstream. For installation and a first reply, start with
[Get started](GETTING-STARTED.md).

## References

| Topic | Documentation |
|---|---|
| Commands and configuration | [Command reference](CLI.md) |
| HTTP integration | [API reference](API.md), [Hermes notes](HERMES-NOTES.md), [fx protocol](FX.md#protocol-reference) |
| Embedding in an app | [Swift library](LIBRARY.md) |
| Build, test, and contribute | [Testing](TESTING.md), [Contributing](../CONTRIBUTING.md) |
| Download internals | [Slotpack format](DOWNLOAD-FORMAT.md) |
| Design and evidence | [Design and plan](../PLAN.md), [Measurements](../MEASUREMENTS.md), [Hardware reports](HARDWARE.md) |
| Security and releases | [Security](../SECURITY.md), [Changelog](../CHANGELOG.md), [Latest release](https://github.com/carloslfu/slotstream/releases/latest) |

The public [db.md store](../db/DB.md) holds the measurements, claims, plans,
and raw runs. `PLAN.md` and `MEASUREMENTS.md` are generated from its records.
For AI agents, [llms.txt](../llms.txt) is the index and
[llms-full.txt](../llms-full.txt) combines the documentation.

## How it works

Qwen3.8-Flash-Next is a *mixture-of-experts* model: each token uses only a
small subset of its expert networks. Most of its storage is 68 GB of routed
experts and a 32 GB n-gram lookup table. The 3.8 GB shared part stays in RAM.

slotstream reads experts from SSD into a fixed pool of cache slots. All
48 layers share that pool, so layers that need more slots can borrow them
from others. Keeping more experts in RAM reduces disk reads. It changes
speed without changing the expert weights used in the computation.

A memory-mapped file alone doesn't solve this in MLX, Apple's machine-learning
framework. The tested expert-gather operation materialized every expert in a
layer, even though the token needed only a few. Explicit slots keep those
reads and allocations under control. The [design](../PLAN.md) covers the details.

## Speed

On the 48 GB M5 Pro:

| Measurement | Result |
|---|---|
| Reply generation after the cache warms up | ~12 tok/s |
| Reply generation with speculative decoding and the 0.2.16 decode lookahead, 20 GB target | 13.47 tok/s, 1.11x faster than without the lookahead |
| Engine load in the original experiment, before processing the prompt | ~2 s (historical) |
| Planned memory with automatic sizing | 32 GB (estimate) |

That memory figure is the historical planner estimate, not a measurement of
the corrected kernel lifetime peak. Older reported values can miss GPU memory
freed before the observation. Current usage, lifetime peaks and request samples
are explained in the [memory controls](CLI.md#memory-options).
The engine-load timing also comes from an early measurement; it excludes the
current CLI's full weight-verification step and is not a current cold-start
or first-answer estimate.

**Long prompts take time before the first reply token.** Processing the prompt
is called *prefill*. The estimates for this Mac are about 9 s for 2,000 tokens
and 39 s for 8,000. Ordinary prose can take longer than the synthetic prompt
used by the estimator. `slotstream doctor` shows estimates for your memory
plan, and the terminal prints progress during long prompts.

The conversation cache avoids processing unchanged history again. In an
eight-turn test at a 16 GB target, the last turn started replying after
6.0 s with reuse, compared with 25.8 s without it. Reuse can change a reply
when two candidate tokens are nearly tied; use `--no-prefix-cache` for
comparisons that require a fresh computation every time.

### Prefill and speculative decode measurements

The prefill sweep groups work by expert and reads weights in contiguous
batches. On the development Mac, at a 16 GB memory target, an 8,000-token
prompt improved from 91 → 184 tok/s and prose from 66 → 140 tok/s. At the
8.1 GB floor, prefill improved from 51 → 93 tok/s. The planner estimates
about 220 tok/s for a 4,096-token pass on the M5 Pro. These results depend on
the prompt and configuration; they aren't measurements on a 16 GB Mac.

Speculative decode uses a small draft head to propose tokens for the main
model to verify. The current operating choice is two drafts (default 2).
The [adoption decision](../db/records/decisions/draft-depth-defaults-to-two.md)
records the workload tradeoff and the limits of the recent comparison.
In the historical one-draft test, the draft was accepted 86% of the time.
At a 28 GB memory target, that one-draft configuration improved greedy decode
by ×1.24 (10.3 → 12.8 tok/s); the improvement was ×1.18 with default server
sampling.

`--mtp auto` enables this when the expert cache can still hold 76 experts per
layer after allocating 1.6 GB for the head, before the separate lookahead
reservation, a 21 GB target at the 32,768-token window. Availability and
context can change activation. The floor was 120 until 0.2.16; on 0.2.14, two drafts decoded 31.7%
faster than plain decode on the same memory at 76 per layer. The automatic
ceiling is 34.6 GB with the head enabled at the 32,768-token window; larger
windows add their context charges. `--mtp off` disables the head.

With the head on, 0.2.16 also runs the decode lookahead. After each layer, the
router of the layer two ahead runs on the current hidden state, and the experts
it picks are read from the SSD straight into cache slots before that layer asks
for them. FP32 copies of the router weights save a conversion on every routing
call, and the GPU is drained every four layers instead of every layer, with
each forecast riding the next routing readback. On twelve held-out prompts at a
20 GB target with two drafts, decode was 1.11x faster than the previous default
(11.79 to 13.47 tok/s median) with identical output. In separate attribution
runs on the tuning prompts, the router copies and fewer drains added
about 2% each over prefetch alone. Those component results are specific to
that workload and are not separate held-out speedups. The
[decision](../db/records/decisions/decode-lookahead-default-with-the-draft-head.md)
records its 373 MiB charge, overrides and limits.

[MEASUREMENTS.md](../MEASUREMENTS.md) includes the configurations, comparisons,
and failed experiments behind these results.

## Context

**Prompt, conversation history, images, and reply share one window, which auto
picks for each Mac.** It takes the largest of 32,768, 65,536, 131,072 and
262,144 tokens that keeps speculative decoding, retains one complete
conversation and adds at most 10% to the planner's estimate for a typical
request. `serve --max-context 65536` fixes the window Hermes uses, and any size
up to the pinned model's 262,144 tokens is accepted; requests with images stay
within 65,536. The planner charges extra state and transient memory before
allocating the expert cache, and the automatic ceiling rises by the window's own
charge. Native runs on the development Mac cover 65,536 tokens and, since
0.2.17, 131,072 tokens with and without the draft head, both inside their memory
plans; 262,144 tokens is planned from the same ledger without a native run. The
long-context qualification is a capacity and memory check, not a long-context
answer-quality benchmark.

At 32,768 tokens, the estimated wait before the first token is about 3.0 min for
the 48 GB M5 Pro plan and 6.4 min for the 16 GB plan. The latter comes from
the M5 Pro's curve; a slower SSD can take longer. Follow-up turns reuse
unchanged history while it remains cached.

The main sequence cache uses about 27 KiB per allocated token of capacity,
rounded to allocation steps. Recurrent state, retained conversations, draft
state and transient workspace are additional charges, so this is not the
whole process cost per input token. Long prompts also cost processing time.
Slotstream reduces the prefill batch size as context grows to keep temporary
memory within the measured range.

To measure a long prompt on your Mac, stop any running server, then run:

```bash
slotstream context-check --tokens 16384
```

It reports time, speed, and peak memory, checking available memory between
passes. `slotstream prefill-schedule --chunk 4096 --tokens 32768` shows the
batch schedule without loading the model.

## Memory

Memory defaults follow the [measured operating policies](../db/records/design/measured-operating-policies.md).
That contract distinguishes model facts, safety and qualification limits,
operating defaults, and bounded estimates. Tuning choices carry evidence,
scope and revision criteria; maintaining those choices is part of the engine.

By default, slotstream chooses a memory target for your Mac and prints it at
startup. It takes the lowest of 33 GB, 70% of RAM, and 2 GB below the Metal
working-set limit, then reduces that target if other apps are using memory.
The draft head raises the base ceiling to 34.6 GB at the 32,768-token window;
the larger windows auto picks on bigger Macs add their context charges. See [Speed](#speed).

The 33 GB ceiling is a conservative default based on development-Mac
measurements. Those tests showed diminishing speed gains as
the expert cache grew. This supports a conservative default; it does not
establish an optimum for every Mac or workload. We'll adjust the default as
real measurements show a better tradeoff. The historical larger-target sweep
inspected planner estimates, which hold flat beyond the verified cache sizes;
it was not a benchmark of those larger allocations. See the
[cache measurements](../db/records/measurements/warm-decode-re-anchored-and-the-live-governor-finally-observed-2026-08.md)
and [sizing interpretation](../db/records/measurements/automatic-memory-default-evidence-scope-2026-09-09.md).

The [community M5 Max cache sweep](HARDWARE.md#does-more-memory-help) reports
faster replies with larger manual targets on the same machine. Auto has not
been calibrated to that hardware, and its fixed ceiling must not be read as
the maximum useful allocation.

The chip and SSD still matter. The plan uses decimal GB, so a Mac sold as
48 GB appears as about 52 GB in its device line.

While the server runs, it checks memory pressure every 15 s and resizes its
cache between requests. It gives memory back under pressure and grows again
when space is available. The cache-size and resize gates check byte-identical
greedy output with the other generation settings fixed. Changing the total
memory target can also change prefill grouping or enable speculative decoding;
those are separate changes, not part of that equality claim.

To set a memory target yourself:

```bash
slotstream doctor --memory-gb 16
slotstream serve --memory-gb 16
```

`--memory-gb` sets the total process target, with a minimum of 8.1 GB for the
default text context; larger windows and resident components need more room.
An explicit target disables automatic cache resizing, while loading and
request-memory safeguards remain active. Preview it before starting.
See the [memory options](CLI.md#memory-options)
for the other controls and their precedence.

## Status and limits

- **Hardware:** the development measurements use a 48 GB M5 Pro. Community
  reports cover other Macs; several memory tiers remain estimates. See
  [Hardware measurements](HARDWARE.md).
- **Concurrency:** one model process per user, with one generation at a time.
- **Compatibility:** macOS 14/15 runtime testing is still needed. Tool calling
  works through OpenAI chat completions and the fx gateway; the Ollama subset
  doesn't support it.
- **Vision:** the image encoder is checked against an independent reference
  and the APIs are tested with images. There is no general vision accuracy
  benchmark or comparison with another runtime yet.

## Why this exists

I have a 48 GB MacBook Pro and wanted to run this model on it. The stock loader
pushed the machine into 48 GB of swap before producing a token. I built
slotstream to keep the shared weights in memory and stream the experts from
SSD, with a cache that leaves room for other apps.

The [measurements](../MEASUREMENTS.md#m07--the-naive-path-fails-why-slotstream-exists)
start with that failed load. The launch was also
[discussed on Hacker News](https://news.ycombinator.com/item?id=49524447), with
227 points and 114 comments, reaching No. 1 on Show HN and No. 8 on the front
page on September 1, 2026.

## Related projects

Other projects approach local inference with different models, hardware,
and memory strategies:

- [llama.cpp](https://github.com/ggml-org/llama.cpp): inference across many
  models and CPU/GPU backends.
- [Rapid-MLX](https://github.com/raullenchai/Rapid-MLX) and
  [oMLX](https://github.com/jundot/omlx): local inference servers for Apple Silicon.
- [Whallm](https://github.com/yanun0323/Whallm),
  [SwiftLM](https://github.com/SharpAI/SwiftLM), and
  [Mference](https://github.com/NeelM0906/Mference): other approaches to running
  large models on Macs.
- [mlx-flash](https://github.com/matt-k-wong/mlx-flash),
  [samosa-chat](https://github.com/deepanwadhwa/samosa-chat),
  [deepseek-v4-flash-mlx](https://github.com/ssd-moe/deepseek-v4-flash-mlx),
  [streamlx](https://github.com/srcterm/streamlx), and
  [mlx-moe-offload](https://github.com/huckiyang/mlx-moe-offload): related work
  on inference with limited memory.

There isn't a completed comparison on the same Mac yet. Each project's
reported speeds use its own setup and shouldn't be read as a ranking.

## Star history

The [README](../README.md#star-history) shows the star count and history.
The chart is updated weekly by this repository's
[workflow](../.github/workflows/star-history.yml).

## Image memory and measurements

Each resized image uses up to 2,304 tokens of the conversation's context.
The image encoder, or *vision tower*, loads on the first image and reserves
0.9 GB inside an auto or `--memory-gb` process target, reducing expert capacity
as needed. An explicit pool-size setting retains its pool and adds the tower
to the expected footprint. Image pixels and attention also need workspace;
the server rejects the request if the budget or real headroom is insufficient.
Use `slotstream serve --vision off` to disable images.

In a measured conversation, the first image turn took 15.4 s and the
follow-up took 1.8 s because its image state was reused. This tests the image
path and reuse; the project has not measured general image-answer accuracy.

## Credits

MIT. [`Sources/Slotstream/Vendored/GatedDelta.swift`](../Sources/Slotstream/Vendored/GatedDelta.swift) is ported from
[mlx-swift-lm](https://github.com/ml-explore/mlx-swift-lm) (MIT).
[`Tools/reference/`](../Tools/reference/) includes the community `qwen4_exp.py` used as the test
reference. Model weights come from
[pipenetwork/Qwen3.8-Flash-Next-MLX-4bit](https://huggingface.co/pipenetwork/Qwen3.8-Flash-Next-MLX-4bit)
and remain under the [Qwen community license](https://huggingface.co/pipenetwork/Qwen3.8-Flash-Next-MLX-4bit/blob/main/LICENSE).
