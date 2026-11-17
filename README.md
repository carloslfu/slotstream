# slotstream

[![Latest release](https://img.shields.io/github/v/release/carloslfu/slotstream?label=latest%20release)](https://github.com/carloslfu/slotstream/releases/latest)
[![GitHub stars](https://img.shields.io/github/stars/carloslfu/slotstream?style=flat&logo=github&label=stars)](#star-history)

**Run a 105 GB AI model on a Mac that can't hold it.**

Slotstream runs [Qwen3.8-Flash-Next](https://huggingface.co/pipenetwork/Qwen3.8-Flash-Next-MLX-4bit),
a 125-billion-parameter open model, on Apple Silicon Macs with **16 to 64 GB of
memory**. It streams experts from SSD and caches them in RAM. The engine is
fully native Swift on Apple's MLX and Metal, with no Python runtime or cloud
account. Inference works offline after the model download.

Chat, ask about pictures, or connect a coding agent. Slotstream provides a
CLI, Ollama-, OpenAI- and Anthropic-compatible APIs, and a Swift library.

[Get started](#install) · [Speed](#speed) · [Guides](#guides) · [About me](#who-made-this)

<a id="who-its-for"></a>
<a id="will-it-run-on-my-mac"></a>
<a id="can-i-run-it-on-linux-or-windows"></a>
<a id="is-slotstream-the-fastest-way-to-run-this-model"></a>

## Requirements

An **Apple Silicon Mac with at least 16 GB of memory, macOS 14 or later,
and about 110 GB of free SSD space**. Windows, Linux, Intel Macs and 8 GB Macs
are unsupported. On 96 GB and larger Macs, engines that keep the model fully
in memory report faster replies. See the [hardware guide](docs/HARDWARE.md#what-you-need).

<a id="available-now"></a>

## Install

Open Terminal and paste:

```sh
curl -fsSL https://raw.githubusercontent.com/carloslfu/slotstream/main/install.sh | sh
```

This installs the [latest release, v0.2.30](https://github.com/carloslfu/slotstream/releases/tag/v0.2.30).
Run the same command to update. If `slotstream` isn't found, open a new terminal.

## Use it

Check your Mac and ask for a first reply:

```sh
slotstream doctor
slotstream run --prompt "Why is the sky blue?"
```

<a id="downloading-the-model"></a>

The first `run` offers to download the model. It can take hours, but you only
need to do it once; interrupted downloads resume. `doctor` checks your Mac
without loading the model. See the [step-by-step setup](docs/GETTING-STARTED.md).

<a id="coding-agents"></a>

To use Claude Code on the local model, install Claude Code separately, then run:

```sh
slotstream launch claude
```

The same command works with `codex`, `pi`, `opencode` and `hermes` in place of
`claude`. It starts the server if needed and connects the agent. See the
[coding agent guide](docs/CODING-AGENTS.md) for setup.

## Speed

Development tests on October 5, 2026 measured **20.91–23.69 tok/s** (tokens per
second) across three workloads on a **48 GB M5 Pro**, using the original
4-bit model at a **33 GB** budget. These three-run medians used the archived
Mac app's startup settings; they do not measure current CLI defaults or
sustained speed. Loading and prompt processing add time; long prompts can
take minutes before a reply starts.

<a id="speed-by-memory"></a>
<a id="speed-by-mac-memory"></a>
<a id="what-to-expect-by-memory"></a>
<a id="recent-prompt-processing-results"></a>

See [results on real Macs](docs/HARDWARE.md#results),
[speed estimates by memory](docs/HARDWARE.md#planning-ranges) and
[prompt-processing results](docs/HARDWARE.md#recent-prompt-processing-results)
for the tables, test conditions and limits.

<a id="built-native"></a>
<a id="why-is-it-written-in-swift-and-not-python"></a>
<a id="memory"></a>
<a id="context"></a>
<a id="memory-and-context"></a>

## How it works

The model uses a *mixture-of-experts* architecture: each token needs only a
subset of its expert networks. Slotstream keeps shared weights in RAM and
reads the needed experts from SSD into a cache. More cache means fewer disk
reads, without removing experts from the model.

Swift owns the runtime, memory planner and cache; MLX and Metal do the GPU
work. Auto mode chooses a memory budget and context window for your Mac,
then adjusts the cache as other apps need room. The
[engineering guide](docs/ENGINEERING.md#how-it-works) explains the design.

## Who made this

I'm [Carlos Galarza](https://www.carlosgalarza.com). I build local AI and
make it run efficiently on the computers people already own. Slotstream is
written natively for the Mac and tuned as one system.

I also build AI agents and help teams with AI engineering, from integrating
models into products to debugging agent workflows. For help or consulting,
[email me](mailto:carloslfu@gmail.com).

<a id="chat-apps-and-the-api"></a>
<a id="pictures"></a>
<a id="docs"></a>
<a id="use-it-from-swift"></a>
<a id="testing"></a>
<a id="building-and-testing"></a>

## Guides

| What you want to do | Guide |
|---|---|
| Install, download the model or ask about a picture | [Get started](docs/GETTING-STARTED.md) |
| Connect Open WebUI or another chat app | [Chat apps](docs/CLIENTS.md) |
| Use Claude Code, Codex, Pi, opencode, Hermes or fx | [Coding agents](docs/CODING-AGENTS.md), [fx](docs/FX.md) |
| Check speed, memory or context on your Mac | [Hardware and speed](docs/HARDWARE.md) |
| Use the APIs or Swift library, build or test | [Engineering](docs/ENGINEERING.md) |
| Fix a problem, move the model or uninstall | [Troubleshooting](docs/TROUBLESHOOTING.md) |

Apps and agents supply the interface and tools; install them separately.
[Release notes](CHANGELOG.md) describe what's changed.

<a id="in-development"></a>
<a id="fast-and-smart"></a>
<a id="one-maintained-model"></a>
<a id="native-mac-app"></a>
<a id="earlier-experiments"></a>

## Status and limits

- **One maintained model:** [Qwen3.8-Flash-Next 4-bit](docs/MODELS.md), with
  text, tools and pictures. Other checkpoints are unsupported.
- **One generation at a time:** connected apps share the running model.
- **Long conversations take time and memory:** see the
  [context and memory plans](docs/HARDWARE.md#automatic-memory-plans).
- **No broad quality comparison yet:** image input and tool calling have
  integration tests, but no general image-accuracy benchmark or completed
  same-Mac comparison with other models.

The [Mac app](experiments/mac-app/README.md) and
[Fast/Q2 models](experiments/fast-q2/README.md) are archived. Current work
focuses on the engine, CLI, serving APIs and Swift library.

## FAQ

### Does it work offline?

Yes, after the model download. Connected agents may still use internet
services for their tools; their settings determine what those tools send.

### Why doesn't Slotstream use all of my RAM?

The budget leaves room for macOS, other apps and temporary model work.
You can preview a different budget with `slotstream doctor --memory-gb 40`.
See [memory defaults and overrides](docs/HARDWARE.md#memory-defaults-and-overrides)
before changing it.

### Will this wear out my SSD?

Generation reads model files without rewriting them. macOS swap and
conversation caching do write to disk. See the
[memory and disk guidance](docs/HARDWARE.md#memory-defaults-and-overrides).

<a id="related-projects"></a>
<a id="can-i-use-a-different-model"></a>

For other models or hardware, see [related projects](docs/ENGINEERING.md#related-projects).

## Why this exists

I wanted to run this model on my own Mac, but the standard loader exhausted
memory before producing a reply. The [measurements](MEASUREMENTS.md#m07--the-naive-path-fails-why-slotstream-exists)
start with that failed load. The project was also
[discussed on Hacker News](https://news.ycombinator.com/item?id=49524447).

## Support

[Report a bug](https://github.com/carloslfu/slotstream/issues/new),
[share your Mac's results](docs/HARDWARE.md#how-to-measure), or
[contribute](CONTRIBUTING.md). Hardware reports are credited to their authors.

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

## Star history

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/star-history-dark.svg">
  <img alt="Slotstream GitHub star history, updated weekly" src="docs/assets/star-history.svg" width="960">
</picture>

The badge shows the latest star count; this chart is updated weekly.

## License

Slotstream is [MIT-licensed](LICENSE). Model weights and included third-party
code retain their own licenses, including the model's
[Qwen community license](https://huggingface.co/pipenetwork/Qwen3.8-Flash-Next-MLX-4bit/blob/main/LICENSE).
See [third-party notices](THIRD_PARTY_NOTICES.md) and [credits](docs/ENGINEERING.md#credits).
