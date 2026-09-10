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

You need an **Apple Silicon Mac, macOS 14 or later, and about 110 GB of free
SSD space**. Choose Apple menu → About This Mac to check your chip and memory.

Smaller Macs can run the model too, but speed depends on the chip, SSD, and
available memory. An 8 GB Mac needs swap and can slow down the whole computer.
The installer has been tested on macOS 14 and 15; model runs have been tested
on macOS 26. Windows, Linux, and Intel Macs are not currently supported.

## Speed

These reply speeds were measured on real Macs after the model warmed up.
`tok/s` means tokens per second; a token is a small piece of text, often
part of a word.

| Mac | Memory | Reply speed |
|---|---|---|
| MacBook Pro, M5 Pro | 48 GB | ~12 tok/s |
| Mac mini, M2 (base storage) | 16 GB | 1.41 tok/s |
| MacBook Air, M5 | 32 GB | 6.22 tok/s |
| MacBook Pro, M5 Max | 128 GB | ~21–22 tok/s |

The M5 Pro is the development Mac; the other rows are community reports.
They use different releases and settings, including speculative decoding on
the M5 Max. See [hardware results and test conditions](docs/HARDWARE.md) for
credits, methods, and separate estimates for other Macs.

**Starting a reply takes additional time.** Slotstream must first process
your question and conversation history. Long prompts can take minutes;
follow-up turns can reuse unchanged history. Terminal shows progress while
you wait.

The latest optimization work improves prompt reuse and reduces runtime memory.
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
  time. The Hermes guide includes the larger conversation window it needs.
- **Testing:** image input and tool calling have
  integration tests, but there is no broad image-accuracy benchmark or
  completed comparison with other models on the same Mac.

The default request budget allows 30 minutes to the first sampled token,
including queueing and preparation. `--max-prefill-wait` changes that budget;
see [request limits and errors](docs/API.md#request-deadlines-and-resource-failures).

## FAQ

### Does it work offline?

Yes, after downloading the model. Inference runs on your Mac. Connected
agents may still use internet services for web searches or other tools;
their settings determine what those tools send.

### Why doesn't Slotstream use all of my RAM?

Auto intentionally caps the total memory target at **33 GB**, or **34.6 GB**
with speculative decoding enabled, even on larger Macs. This is our current
best-supported balance of speed and memory use for this model: tests on the
development Mac showed diminishing speed gains from a larger expert cache.
We'll adjust the default as real measurements across hardware and workloads
show a better tradeoff. More allocated RAM does not guarantee more speed.

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
