# slotstream

[![Latest release](https://img.shields.io/github/v/release/carloslfu/slotstream?label=latest%20release)](https://github.com/carloslfu/slotstream/releases/latest)
[![GitHub stars](https://img.shields.io/github/stars/carloslfu/slotstream?style=flat&logo=github&label=stars)](#star-history)

**Run a 105 GB AI model on a 48 GB Mac.**

Slotstream runs Qwen3.8-Flash-Next on your Mac by keeping most of the model
on SSD and loading the parts it needs into memory. After a one-time download,
the model works offline. No Python or cloud API account is required.

Use it to chat, ask about pictures, or work with files through an agent such
as Hermes. Developers can connect their own apps through its APIs or Swift library.

[Get started](#install) · [Performance](#speed) · [Guides](#guides) · [Get help](#support)

> **I'm building Sevra on Slotstream: private, personal AI optimized for your computer.**
> Sevra will choose a tested model for your hardware and keep that choice current
> as models improve, with inference, memory and tools tuned together. You'll
> control what it remembers and can access. The app is in development, starting
> with Mac.
> [See Sevra and join the waitlist](https://www.sevrahq.com/).
> Slotstream's command-line tool, APIs, and Swift library remain independently usable.

## Will it run on my Mac?

You need an **Apple Silicon Mac with at least 16 GB of memory, macOS 14 or
later, and about 110 GB of free SSD space**. Choose Apple menu → About This Mac
to check your chip and memory.

On an 8 GB Mac even the smallest memory plan doesn't fit, so Slotstream refuses
to start instead of swapping. On larger Macs, speed depends on the chip, SSD,
and available memory. The installer has been tested on macOS 14 and 15; model
runs have been tested on macOS 26. Windows, Linux, and Intel Macs are not
currently supported.

## Speed

`tok/s` means tokens per second; a token is a small piece of text, often part
of a word. Speeds describe replies after the model has warmed up.

**The decode lookahead introduced in 0.2.16 measured 1.11x faster decode.**
It predicts which parts of the model the next layers will need and reads them
from the SSD before they're requested, keeps a faster copy of the routing
weights, and waits for the GPU less often. On prompts it was never tuned on,
the development Mac went from 11.79 to 13.47 tok/s at a 20 GB memory target,
with identical output. Both configurations used speculative decoding. These
are pre-release benchmark results for the configuration shipped in 0.2.16;
the [latest published release](https://github.com/carloslfu/slotstream/releases/latest)
determines what the installer downloads.

<a id="speed-by-memory"></a>
<a id="speed-by-mac-memory"></a>

### Estimated speed by memory

These are rough planning ranges, combining community reports with estimates
from the development Mac. They describe warm replies across different Macs
and settings, with higher speeds generally requiring a faster chip and SSD.

| Memory tier | Installed RAM | Estimated warm reply speed | Automatic context window |
|---|---|---|---|
| Compatibility | 8 GB | **Support coming soon.** The current model doesn't fit yet. | Not available yet |
| Low | 16–<24 GB | ~1–6 tok/s | 32,768 tokens |
| Medium | 24–<48 GB | ~6–14 tok/s | 32,768 through 32 GB; 65,536 from 36 GB |
| High | 48–<96 GB | ~13–27 tok/s | 65,536 at 48 GB; 131,072 at 64 GB |
| Ultra | 96 GB+ | ~20–32 tok/s | 262,144 tokens, the model's full window |

The High range now uses our latest **13.47 tok/s measured on a 48 GB M5 Pro**
as its lower reference, rounded to a whole token for the estimate. Older
chips and slower SSDs can fall below it.

**The upper ends of High and Ultra assume an M5 Max-class chip, a fast
internal SSD and a larger manually selected memory target.** Auto mode keeps
a conservative ceiling, so extra installed RAM alone may leave the target
unchanged. The High upper estimate transfers the 128 GB M5 Max's 48 GB
target result to a comparable Mac with enough available memory; that smaller
Mac has not been benchmarked. Ultra is based on the same M5 Max's auto-to-73 GB
target sweep. Slower chips, other workloads or memory pressure can put a Mac
outside these ranges. These are estimates, not measured limits or statistical
confidence intervals. See the [estimate basis](docs/HARDWARE.md#planning-ranges)
and the actual results below.

### Measured on real Macs

These reply speeds were measured on real Macs after the model warmed up.
Chip, SSD, workload, release and memory target all affect speed. Installed
RAM alone doesn't define a performance tier.

| Mac | Installed RAM | Slotstream | Process memory target | Warm reply speed |
|---|---|---|---|---|
| Mac mini, M2 (base storage) | 16 GB | 0.2.2 | 10.2 GB (auto) | 1.41 tok/s |
| MacBook Air, M5 | 32 GB | 0.2.11 | 22 GB | 6.22 tok/s |
| **MacBook Pro, M5 Pro (our development Mac)** | **48 GB** | 0.2.16 configuration, pre-release benchmark | 20 GB | **13.47 tok/s** |
| Same M5 Pro, historical result | 48 GB | 0.2.3 | 33 GB (auto) | ~12 tok/s |
| MacBook Pro, M5 Max | 128 GB | 0.2.3 | 34.6 GB (auto) | ~21–22 tok/s |
| Same M5 Max | 128 GB | 0.2.3 | 48 GB (manual) | ~26.9 tok/s |
| Same M5 Max | 128 GB | 0.2.3 | 73 GB (manual) | ~31.5 tok/s |

Our latest M5 Pro result is the median across eligible runs in a held-out
comparison (34 of 36 pairs eligible), with two speculative drafts and decode
lookahead. The other Macs are community reports.
They use different releases and settings, including speculative decoding on
the M5 Max. See [hardware results and test conditions](docs/HARDWARE.md) for
credits and methods. The two M5 Pro rows also change software and settings,
so they do not isolate the effect of memory.

**A larger memory target can improve speed.** The M5 Max figures come from
the [same machine with speculative decoding enabled](https://github.com/carloslfu/slotstream/issues/6#issuecomment-5520489176).
Its targets are total-process budgets in decimal GB, separate from the Mac's
installed memory. Those community results have not been independently rerun
or remeasured on 0.2.16, and are not predictions for every Mac with that much RAM.

The 13.47 tok/s M5 Pro result is a measured reference, not a speed ceiling
for larger Macs. The [hardware guide](docs/HARDWARE.md#speed-estimates) lists
the automatic plans and remaining estimate limits. See
[memory defaults and overrides](#why-doesnt-slotstream-use-all-of-my-ram)
to try a larger cache.

### Memory and context

An 8 GB Mac cannot fit the model's smallest plan. More RAM can leave room
for a larger expert cache or conversation, subject to the engine's limits
and the memory available while other apps are running.

**Auto mode picks the memory target, cache size, speculative decoding and
context window for your Mac.** It takes the largest window of 32,768, 65,536,
131,072 or 262,144 tokens that keeps speculative decoding, keeps one complete
conversation ready for follow-up turns, and adds at most a tenth to the
planner's estimate for a typical request. In decimal-GB simulations that is
32,768 tokens through 32 GB, 65,536 from 36 GB, 131,072 at 64 GB and the
model's full 262,144 from 96 GB. Available memory, the Metal limit and
draft-head availability can change the result. A Mac that is busy at startup
gets a smaller window rather than losing speculative decoding. Run
`slotstream doctor` to see the choice and why each larger window was or wasn't
taken, and see the [hardware guide](docs/HARDWARE.md#automatic-memory-plans)
for every plan.

**You can set the window yourself.** `--max-context 65536` fixes a
65,536-token window, and any size up to 262,144 is accepted. A larger window
reserves more memory, which can shrink the expert cache, and a long prompt
takes longer to read. Requests with images use at most 65,536 tokens.
For prompts near 32,768 tokens, the M5 Pro-based estimate is about 3 minutes
of prefill for simulated plans from 24 GB; near 65,536 it is about 8 minutes.
Windows above 128,256 tokens have no calibrated estimate yet. On the
development Mac, a full 131,072-token prompt took 38 minutes to read at a
16 GB target.
These are estimated prompt-processing times, not measured waits across Macs;
startup, queueing, images and reasoning before visible answer text can add time.

**Starting a reply takes additional time.** Slotstream must first process
your question and conversation history. Long prompts can take minutes;
follow-up turns can reuse unchanged history. Terminal shows progress while
you wait.

The 0.2.14 optimization work improves prompt reuse and reduces runtime memory.
The [integrated measurements](MEASUREMENTS.md#final-integrated-optimization-results)
separate time to the first token, sustained generation, and process memory.
The benefit depends on your workload; sustained generation did not improve
across every tested configuration.

## Install

Open Terminal and paste this command:

```sh
curl -fsSL https://raw.githubusercontent.com/carloslfu/slotstream/main/install.sh | sh
```

Run the same command to update. If `slotstream` isn't found afterward, open
a new terminal window.

## Use it

Check your Mac, then ask for a first reply:

```sh
slotstream doctor
slotstream run --prompt "Why is the sky blue?"
```

<a id="downloading-the-model"></a>

`doctor` checks memory and disk space without loading the model. The first
`run` asks to download it, then prints a reply. This download can take hours,
but you only need to do it once. Interrupted downloads resume when you try
again. Follow the [step-by-step setup](docs/GETTING-STARTED.md) for more help.

<a id="chat-apps-and-the-api"></a>
<a id="pictures"></a>
<a id="coding-agents"></a>
<a id="docs"></a>

## Guides

| What would you like to do? | Guide |
|---|---|
| Chat in Open WebUI or another app | [Connect a chat app](docs/CLIENTS.md) |
| Work with files and tools through an agent | [Use Hermes](docs/HERMES.md) |
| Ask about a picture | [Use an image](docs/GETTING-STARTED.md#ask-about-a-picture) |
| Use a coding agent | [Connect fx](docs/FX.md) |
| Fix a problem, move the model, or uninstall | [Troubleshooting](docs/TROUBLESHOOTING.md) |

Install chat apps and agents separately. They provide the interface and tools;
Slotstream runs the model. Keep its server running while a connected app uses it.

<a id="use-it-from-swift"></a>
<a id="testing"></a>
<a id="building-and-testing"></a>

For developers, the [engineering guide](docs/ENGINEERING.md) links to the
OpenAI- and Ollama-compatible API references, Swift library, command options,
build instructions, and tests. [Release notes](CHANGELOG.md) show what changed.

## How it works

Qwen3.8-Flash-Next is a *mixture-of-experts* model: generating each piece of
text uses only a subset of its expert networks. Slotstream keeps shared
weights in memory and reads the needed experts from SSD into a cache.
Frequently used experts stay in RAM, reducing repeated disk reads.

<a id="memory"></a>

The whole model stays available even though it doesn't all fit in memory.
Slotstream chooses a memory target for your Mac and adjusts its cache as
other apps need room. Cache size changes speed without removing experts
from the model. The [engineering explanation](docs/ENGINEERING.md#how-it-works)
covers the implementation.

<a id="context"></a>

## Status and limits

- **One generation at a time:** connected apps share the same running model.
- **Conversation length is limited:** longer histories take more memory and
  time. [Speed by Mac memory](#speed-by-memory) recommends a window for each
  memory size, and the Hermes guide includes the larger window it needs.
- **Testing:** image input and tool calling have
  integration tests, but there is no broad image-accuracy benchmark or
  completed comparison with other models on the same Mac.

The default request budget allows 30 minutes to the first sampled token,
including queueing and preparation. `--max-prefill-wait` changes that budget;
see [request limits and errors](docs/API.md#request-deadlines-and-resource-failures).

## FAQ

### How many draft tokens does speculative decoding use?

It proposes two tokens per round when enabled (default 2). This is the current
choice for mixed workloads; more guesses can add verification work without
making generation faster. The [CLI guide](docs/CLI.md#speculative-decode)
explains the override and how automatic activation works.

### Does it work offline?

Yes, after downloading the model. Inference runs on your Mac. Connected
agents may still use internet services for web searches or other tools;
their settings determine what those tools send.

### Why doesn't Slotstream use all of my RAM?

Auto has a **33 GB** base memory ceiling, or **34.6 GB** with speculative
decoding at the 32,768-token window. The larger windows auto picks from 36 GB
add their own context state and retained conversation, so that ceiling can
rise. RAM-share and available-memory bounds still
apply. This conservative default comes from the development Mac's measurements
and leaves memory for
other apps. It is not a limit on how much memory can improve performance:
the [M5 Max cache sweep](docs/HARDWARE.md#does-more-memory-help) reports faster
replies with larger targets. How much a larger cache helps depends on the
chip, SSD, workload and settings; the automatic policy has not yet been
qualified across those configurations.

If your Mac has spare memory, you can try a larger target. Stop any running
server, then preview this example without loading the model:

```sh
slotstream doctor --memory-gb 40
```

If the plan fits the available memory and Metal working-set limit with
headroom, start the server with the same target:

```sh
slotstream serve --memory-gb 40
```

Replace `40` with your chosen total-process budget in decimal GB. An explicit
target keeps the cache fixed and disables automatic resizing, so leave room
for macOS and other apps and watch memory pressure. See the
[memory options](docs/CLI.md#memory-options) for details.

### Will this wear out my SSD?

Generation reads the model files without rewriting them. macOS swap adds
writes when memory runs short. Automatic memory sizing helps, but a small
Mac or an oversized manual setting can still swap heavily.

### Can I run it on Linux or Windows?

Support for AMD and NVIDIA on Windows and Linux is planned for Sevra.
It isn't available in the current Slotstream engine.

<a id="related-projects"></a>

### Can I use a different model?

Not with Slotstream today. Its loader and memory planner are built for this
model. See [related projects](docs/ENGINEERING.md#related-projects) for runtimes
with different model and hardware support.

## Why this exists

I wanted to run this model on my own Mac, but the standard loader exhausted
memory before producing a reply. Slotstream grew out of that experiment.
The [published measurements](MEASUREMENTS.md#m07--the-naive-path-fails-why-slotstream-exists)
include that failed load and the experiments that followed.

The project was also [discussed on Hacker News](https://news.ycombinator.com/item?id=49524447).
The questions and hardware reports from that discussion help guide the work.

## Support

[Report a bug](https://github.com/carloslfu/slotstream/issues/new) if something
doesn't work, or [share your Mac's results](docs/HARDWARE.md#how-to-measure)
to help others know what to expect. Reports are credited to their authors.
Code and documentation contributions are welcome; see
[Contributing](CONTRIBUTING.md) for the workflow.

## Grants and sponsors

<p>
  <a href="https://github.com/rauchg">
    <img src="https://avatars.githubusercontent.com/u/13041?v=4&amp;s=160" width="80" height="80" alt="Guillermo Rauch's GitHub profile photo"><br>
    <strong>Guillermo Rauch</strong>
  </a>
</p>

Slotstream was selected for [Guillermo Rauch's personal grants for foundational
open-source software](https://rauchg-oss-grants.vercel.app/).
Thank you for supporting its development.

## Who made this

I'm [Carlos Galarza](https://www.carlosgalarza.com). I work on efficient AI
and Executable Rationality, making machine cognition explicit and runnable.
I also help teams run open models on their own hardware and debug agent
workflows. For help or consulting, [email me](mailto:carloslfu@gmail.com).

## Star history

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/star-history-dark.svg">
  <img alt="Slotstream GitHub star history, updated weekly" src="docs/assets/star-history.svg" width="960">
</picture>

The badge at the top shows the latest star count; this chart is updated weekly.

## License

Slotstream is [MIT-licensed](LICENSE). The model weights have their own
[Qwen community license](https://huggingface.co/pipenetwork/Qwen3.8-Flash-Next-MLX-4bit/blob/main/LICENSE).
See [credits](docs/ENGINEERING.md#credits) for the model and code this project builds on.
