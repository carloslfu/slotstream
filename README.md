# slotstream

[![release](https://github.com/carloslfu/slotstream/actions/workflows/release.yml/badge.svg)](https://github.com/carloslfu/slotstream/actions/workflows/release.yml) [![latest release](https://img.shields.io/github/v/release/carloslfu/slotstream?label=latest%20release)](https://github.com/carloslfu/slotstream/releases/latest) [![GitHub stars](https://img.shields.io/github/stars/carloslfu/slotstream?style=flat&logo=github&label=stars)](https://github.com/carloslfu/slotstream/stargazers)

**Run a 105 GB model on a 48 GB Mac.**

slotstream runs Qwen3.8-Flash-Next, a 125-billion-parameter model, by keeping
most of its weights on SSD and loading the parts it needs into memory. On a
48 GB M5 Pro, it generates about 12 tokens per second once the cache warms up.
After the model download, inference works offline on your Mac.

Use it from the terminal, a chat app such as Open WebUI, or your own code
through its Ollama and OpenAI chat API subsets. It's a Swift binary for Apple
Silicon, with no Python required.

[Install](#install) · [Hardware](#will-it-run-on-my-mac) · [API](docs/API.md) ·
[Troubleshooting](docs/TROUBLESHOOTING.md)

> **We're building Sevra on Slotstream.** A personal, local-first app with one
> continuous conversation, a journal, and knowledge in files you own. The app
> is in development. The Slotstream CLI, APIs, and Swift package remain
> independently usable. [See Sevra and join the waitlist](https://www.sevrahq.com/).

## Will it run on my Mac?

You need an **Apple Silicon Mac, macOS 14 or later, and about 110 GB of free
SSD space**. Check the free space before starting: the model download is much
larger than the program itself. The installer has been tested on macOS 14 and
15; runtime testing so far is on macOS 26.

The model files, called *weights*, use a compact 4-bit format. Smaller Macs
can run it too, with lower speeds. An 8 GB Mac needs swap even at the minimum
memory target and can become slow to use.

<details>
<summary>Memory targets, speed estimates, and measured results</summary>

These are the memory plans and speed estimates from `slotstream doctor
--sim-ram N`. Speeds are based on the 48 GB M5 Pro; your chip, SSD, and other
running apps affect the result.

| Mac RAM | Automatic memory target | Estimated generation speed |
|---|---|---|
| 8 GB | 8.1 GB | ~3 tok/s; requires swap and can slow the whole Mac |
| 16 GB | 10 GB | ~4 tok/s |
| 24 GB | 16 GB | ~8 tok/s |
| 32 GB | 22 GB | ~9 tok/s |
| 48 GB and up | 33 GB | ~12 tok/s on the M5 Pro |

A **token** is a small piece of text, often part of a word. `tok/s` means
tokens per second. These speeds describe *warm decode*: generating a reply
after the cache has filled. The first reply also needs time to process your
prompt.

The estimates can differ substantially from results measured on real Macs.
A 16 GB Mac mini M2 with base storage reached **1.41 tok/s**; a 128 GB M5 Max
was faster than the M5 Pro estimate. See the credited results and test
conditions in [Hardware measurements](docs/HARDWARE.md). The 8, 24, and 32 GB
tiers still need reports.

</details>

## Install

Open Terminal and run:

```bash
curl -fsSL https://raw.githubusercontent.com/carloslfu/slotstream/main/install.sh | sh
```

This installs the latest release in `~/.slotstream/bin` and makes the
`slotstream` command available. If your terminal can't find it, open a new
terminal window. Run the same installer again to upgrade.

Check your Mac before downloading the model:

```bash
slotstream doctor
```

This shows the memory plan, estimated speed, and available disk space without
loading or downloading the model.

## Use it

For your first reply, run:

```bash
slotstream run --prompt "Why is the sky blue?"
```

On first use, slotstream offers to download the model. It shows the size,
destination, and free space, then asks for confirmation. Once the download
finishes, it processes your prompt and prints the reply.

### The 105 GB download

The full download is 105.3 GB across 25 files, including an optional 1.5 GB
draft head used to speed up generation. To download the weights before
starting a run, use `slotstream pull`. Downloads resume after an interruption,
and each file is checked against a pinned SHA-256 hash before use.

Allow several hours on a home connection. At 100 Mbps, the transfer alone
takes roughly 2 h 20; at 25 Mbps, roughly 9 h. You only need to download the
weights once.

<details>
<summary>Download speed and verification details</summary>

`pull` uses eight TCP connections. A full download on a 1 Gbit/s datacenter
link measured 112 MB/s and took 16 minutes. One connection reached about
70 MB/s from a datacenter; latency and your connection speed affect both.

Files come from a mirror of a pinned Hugging Face revision, with the original
repository as fallback. Both must match the hashes compiled into the binary.
A source without the optional draft head can still complete the download;
slotstream then runs with speculative decode off.

To check an existing download, run `slotstream pull --verify` (8 s here on the
development Mac). See [Troubleshooting](docs/TROUBLESHOOTING.md) to move the
weights, check a damaged file, or reclaim the disk space.

</details>

### Chat apps and the API

Start the server:

```bash
slotstream serve
```

Leave it running. In another terminal, send a message:

```bash
curl localhost:11434/api/chat -d '{
  "model": "qwen3.8-flash-next:4bit",
  "messages": [{"role": "user", "content": "Hello"}]
}'
```

This streams the reply as JSON. Set `"stream": false` to receive one complete
response. Stop the server with **Ctrl+C** when you're done.

For Open WebUI, use `http://localhost:11434` as the Ollama server address. For
an OpenAI SDK, use `http://localhost:11434/v1` as the base URL and any string
as the API key. These addresses work for clients running directly on the same
Mac; a client in a container needs its own networking setup.

Open WebUI, the Ollama CLI, and OpenAI SDKs have been tested. The server
supports chat, streaming, images, and sampling options. Tool calling is
available through the [fx gateway](#coding-agents); the Ollama and OpenAI
endpoints currently reject tools, JSON-schema output, and logprobs with a
400 error. See the [API reference](docs/API.md) for the supported fields.

### Pictures

Pass a local image to the command-line tool:

```bash
slotstream run --image cat.jpg --prompt "What is in this picture?"
```

Images also work through all three server APIs. API clients must send the
image bytes as base64 or a `data:` URL; the server won't fetch a web URL or
read a `file://` path. See [image request examples](docs/API.md#images).

Each resized image uses up to 2,304 tokens of the conversation's context.
The image encoder, or *vision tower*, loads on the first image and adds
0.9 GB to the text memory plan. The server rejects the request if there isn't
room. Use `slotstream serve --vision off` to disable images.

In a measured conversation, the first image turn took 15.4 s and the
follow-up took 1.8 s because its image state was reused. This tests the image
path and reuse; the project has not measured general image-answer accuracy.

### Coding agents

You can use [fx](https://fx.sh) with slotstream for tasks that read files,
write code, and call tools. The server implements the Vercel AI SDK gateway
protocol that fx uses.

Follow the [fx setup guide](docs/FX.md) to create a separate local profile.
Use its `ask` permission mode: automatic action reviews time out on this
setup, and long-session compaction is unreliable.

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

<details>
<summary>Prefill and speculative decode measurements</summary>

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

[MEASUREMENTS.md](MEASUREMENTS.md) includes the configurations, comparisons,
and failed experiments behind these results.

</details>

## Context

**Prompt, conversation history, images, and reply share a 32,768-token limit.**
This is the largest context slotstream has measured. The model was trained
for 262,144 tokens, but slotstream doesn't yet support that full window.
`serve --max-context N` can lower the limit.

At the limit, the estimated wait before the first token is about 3.0 min for
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

By default, slotstream chooses a memory target for your Mac and prints it at
startup. It takes the lowest of 33 GB, 70% of RAM, and 2 GB below the Metal
working-set limit, then reduces that target if other apps are using memory.
The draft head can raise the ceiling to 34.6 GB as described above.

The 33 GB ceiling comes from tests where a larger cache stopped improving
speed. It doesn't mean every Mac has the same speed: the chip and SSD still
matter. The plan uses decimal GB, so a Mac sold as 48 GB appears as about
52 GB in its device line.

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
check that it fits before starting. See the [memory options](docs/CLI.md#memory-options)
for the other controls and their precedence.

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
reads and allocations under control. The [design](PLAN.md) covers the details.

## Why this exists

I have a 48 GB MacBook Pro and wanted to run this model on it. The stock loader
pushed the machine into 48 GB of swap before producing a token. I built
slotstream to keep the shared weights in memory and stream the experts from
SSD, with a cache that leaves room for other apps.

The [measurements](MEASUREMENTS.md#m07--the-naive-path-fails-why-slotstream-exists)
start with that failed load. The launch was also
[discussed on Hacker News](https://news.ycombinator.com/item?id=49524447), with
227 points and 114 comments, reaching No. 1 on Show HN and No. 8 on the front
page on September 1, 2026.

## FAQ

### Will this wear out my SSD?

Generation reads the model weights without rewriting them. The main source
of extra writes is macOS swap when memory runs short. Automatic sizing helps
avoid that, but an 8 GB Mac or an oversized manual cache can still swap heavily.

### Can I run it on Linux or Windows?

The current engine requires Apple Silicon, MLX, and Metal. Its cache uses the
memory shared by the CPU and GPU. Windows and Linux support for AMD and NVIDIA
is planned for Sevra; it isn't available in the current engine.

### Can I use a different model?

slotstream supports only `qwen3.8-flash-next:4bit`. Its layers, memory planner,
and weight loader are specific to that model. Qwen3.8-27B, Llama, and DeepSeek
aren't supported. See [Related projects](#related-projects) for other runtimes.

## Status and limits

- **Hardware:** the development measurements use a 48 GB M5 Pro. Community
  reports cover other Macs; several memory tiers remain estimates. See
  [Hardware measurements](docs/HARDWARE.md).
- **Concurrency:** one model process per user, with one generation at a time.
- **Compatibility:** macOS 14/15 runtime testing is still needed. Tool calling
  works through the fx gateway; the OpenAI and Ollama subsets don't support it.
- **Vision:** the image encoder is checked against an independent reference
  and the APIs are tested with images. There is no general vision accuracy
  benchmark or comparison with another runtime yet.

## Use it from Swift

Add the package to your `Package.swift` dependencies:

```swift
.package(url: "https://github.com/carloslfu/slotstream.git", .upToNextMinor(from: "0.2.3"))
```

You can inspect a memory plan before downloading or loading the model:

```swift
import Slotstream

let plan = try Planner.plan(PlanRequest(memoryGB: 16), on: Machine.current())
print(plan.banner())
print(WeightStore.default.status())
```

The [Swift library guide](docs/LIBRARY.md) covers setup, weight downloads,
serving, and the Metal shader library needed by command-line builds.

## Docs

| Guide | What you'll find |
|---|---|
| [Command reference](docs/CLI.md) | Commands, flags, file locations, and environment variables |
| [API reference](docs/API.md) | Endpoints, request examples, streaming, and errors |
| [Troubleshooting](docs/TROUBLESHOOTING.md) | Slow replies, port conflicts, downloads, and uninstalling |
| [Hardware measurements](docs/HARDWARE.md) | Results from real Macs and how to submit yours |
| [Swift library](docs/LIBRARY.md) | Using slotstream in an app or tool |
| [fx setup](docs/FX.md) | Running a coding agent with the local model |
| [Changelog](CHANGELOG.md) | Changes by release |
| [Design and plan](PLAN.md) | Architecture, decisions, and upcoming work |
| [Measurements](MEASUREMENTS.md) | Evidence and methods behind performance claims |

[db/](db/DB.md) is the public [db.md](https://github.com/carloslfu/db.md) store
that holds the measurements, claims, plans, and raw runs. `PLAN.md` and
`MEASUREMENTS.md` are generated from its records. For AI agents,
[llms.txt](llms.txt) is the index and [llms-full.txt](llms-full.txt) combines
the documentation into one file.

<a id="testing"></a>

## Building and testing

To build from source, install Apple's Command Line Tools, then run:

```bash
git clone https://github.com/carloslfu/slotstream
cd slotstream
make build
make checks
```

`make checks` runs without weights, network access, or a GPU. `make checks-all`
adds the MLX tests. `Tools/verify.sh` tests against the real model, including
reference comparisons, cache resizes, speculative decode, and server
regressions. [Testing](docs/TESTING.md) explains the suites and coverage gaps;
[Contributing](CONTRIBUTING.md) covers the development workflow.

Release builds come from tagged commits in GitHub Actions. After downloading
a release archive, you can verify its provenance with the GitHub CLI:

```bash
gh attestation verify slotstream-arm64.tar.gz --repo carloslfu/slotstream
```

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

## Support

[Submit a measurement report](https://github.com/carloslfu/slotstream/issues/new?template=measurement-report.yml)
to help replace the remaining hardware estimates. Reports from 8, 24, and
32 GB Macs, older chips, or external SSDs are useful. A 16 GB Mac with a fast
SSD would help separate disk speed from memory capacity. The
[procedure](docs/HARDWARE.md#how-to-measure) takes about ten minutes once the
weights are downloaded, and reports are credited to their authors.

GitHub Sponsors is being set up to fund hardware testing. Purchases and
rentals funded by sponsorship will be recorded in this repository.

## Who made this

I'm [Carlos Galarza](https://www.carlosgalarza.com). I work on efficient AI
and Executable Rationality, making machine cognition explicit and runnable.
I also help teams run open models on their own hardware and debug unreliable
agent workflows. For consulting or help measuring your Mac, write to
[carloslfu@gmail.com](mailto:carloslfu@gmail.com).

## Star history

<a href="https://github.com/carloslfu/slotstream/stargazers">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/assets/star-history-dark.svg">
    <img alt="slotstream GitHub star history" src="docs/assets/star-history.svg" width="960">
  </picture>
</a>

Updated weekly by this repository's [workflow](.github/workflows/star-history.yml).

## License

MIT. `Sources/Slotstream/Vendored/GatedDelta.swift` is ported from
[mlx-swift-lm](https://github.com/ml-explore/mlx-swift-lm) (MIT).
`Tools/reference/` includes the community `qwen4_exp.py` used as the test
reference. Model weights come from
[pipenetwork/Qwen3.8-Flash-Next-MLX-4bit](https://huggingface.co/pipenetwork/Qwen3.8-Flash-Next-MLX-4bit)
and remain under the Qwen community license.
