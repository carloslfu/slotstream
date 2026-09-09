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
| Engine start, before processing the prompt | ~2 s |
| Peak memory with automatic sizing | 32 GB |

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

Speculative decode uses a small draft head to propose a token for the main
model to verify. The draft was accepted 86% of the time in the measured test.
At a 28 GB target, one draft improved greedy decode by ×1.24
(10.3 → 12.8 tok/s); the improvement was ×1.18 with default server sampling.

`--mtp auto` enables this when the expert cache can still hold 120 experts
per layer after allocating 1.6 GB for the head. Below that threshold it stays
off, because the tested smaller caches lost speed. The automatic ceiling is
34.6 GB with the head enabled. `--mtp off` disables it.

[MEASUREMENTS.md](../MEASUREMENTS.md) includes the configurations, comparisons,
and failed experiments behind these results.

## Context

**Prompt, conversation history, images, and reply share a 32,768-token limit
by default.** Use `serve --max-context 65536` for the larger 65,536-token
window, including Hermes. The planner charges extra state and transient memory
before allocating the expert cache. The pinned model configuration allows 262,144 tokens, but
slotstream doesn't support that full window. The long-context qualification
is a capacity and memory check, not a long-context answer-quality benchmark.

At the default limit, the estimated wait before the first token is about 3.0 min for
the 48 GB M5 Pro plan and 6.4 min for the 16 GB plan. The latter comes from
the M5 Pro's curve; a slower SSD can take longer. Follow-up turns reuse
unchanged history while it remains cached.

Context state uses about 27 KiB per token. The larger cost of a long prompt
is processing time. slotstream reduces the prefill batch size as context grows
to keep temporary memory within the measured range.

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
The draft head can raise the ceiling to 34.6 GB as described in [Speed](#speed).

The 33 GB ceiling is our current best-supported balance of speed and memory
use for this model. Development-Mac tests showed diminishing speed gains as
the expert cache grew. This supports a conservative default; it does not
establish an optimum for every Mac or workload. We'll adjust the default as
real measurements show a better tradeoff. The historical larger-target sweep
inspected planner estimates, which hold flat beyond the verified cache sizes;
it was not a benchmark of those larger allocations. See the
[cache measurements](../db/records/measurements/warm-decode-re-anchored-and-the-live-governor-finally-observed-2026-08.md)
and [sizing interpretation](../db/records/measurements/automatic-memory-default-evidence-scope-2026-09-09.md).

The chip and SSD still matter. The plan uses decimal GB, so a Mac sold as
48 GB appears as about 52 GB in its device line.

While the server runs, it checks memory pressure every 15 s and resizes its
cache between requests. It gives memory back under pressure and grows again
when space is available. Greedy output stays byte-identical across cache
sizes and resizes.

To set a memory target yourself:

```bash
slotstream doctor --memory-gb 16
slotstream serve --memory-gb 16
```

`--memory-gb` sets the total process target, with a minimum of 8.1 GB. An
explicit size stays fixed and bypasses automatic availability checks, so
check that it fits before starting. See the [memory options](CLI.md#memory-options)
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
The image encoder, or *vision tower*, loads on the first image and adds
0.9 GB to the text memory plan. The server rejects the request if there isn't
room. Use `slotstream serve --vision off` to disable images.

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
