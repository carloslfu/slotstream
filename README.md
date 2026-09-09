# slotstream

**Run a 105 GB AI model on a 48 GB Mac.**

Slotstream runs Qwen3.8-Flash-Next on your Mac. Use it to chat, ask about
pictures, or work with files through an agent such as Hermes. The model
works offline after a one-time download.

It keeps most of the model on your SSD and loads the parts it needs into
memory, so the whole model doesn't have to fit in RAM.

**[Get started](#install)**

## Will it run on my Mac?

You need an **Apple Silicon Mac, macOS 14 or later, and about 110 GB of free
SSD space**. Slotstream currently supports this one model on Mac.

An 8 GB Mac can become slow to use. Model runs have been tested on macOS 26;
macOS 14 and 15 still need testing.

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

The first run asks to download the model. This can take hours, but you only
need to do it once. Interrupted downloads resume when you try again.
Follow the [step-by-step setup](docs/GETTING-STARTED.md) for more help.

<a id="downloading-the-model"></a>
<a id="chat-apps-and-the-api"></a>
<a id="pictures"></a>
<a id="coding-agents"></a>
<a id="faq"></a>
<a id="will-this-wear-out-my-ssd"></a>
<a id="can-i-run-it-on-linux-or-windows"></a>
<a id="can-i-use-a-different-model"></a>

## Guides

| What would you like to do? | Guide |
|---|---|
| Work with files and tools through an agent | [Use Hermes](docs/HERMES.md) |
| Chat in Open WebUI or another app | [Connect a chat app](docs/CLIENTS.md) |
| See how it runs on different Macs | [Hardware and speed](docs/HARDWARE.md) |
| Fix a problem or uninstall | [Troubleshooting](docs/TROUBLESHOOTING.md) |

<a id="docs"></a>
<a id="speed"></a>
<a id="context"></a>
<a id="memory"></a>
<a id="how-it-works"></a>
<a id="status-and-limits"></a>
<a id="use-it-from-swift"></a>
<a id="testing"></a>
<a id="building-and-testing"></a>
<a id="related-projects"></a>
<a id="star-history"></a>

[Developer documentation](docs/ENGINEERING.md) covers the API, Swift library,
commands, benchmarks, and contributing.

<a id="why-this-exists"></a>
<a id="support"></a>

## Who made this

I'm [Carlos Galarza](https://www.carlosgalarza.com). I built Slotstream to
run this model on my own Mac. You can [report a bug](https://github.com/carloslfu/slotstream/issues/new)
or [email me](mailto:carloslfu@gmail.com) for help or consulting.

I'm also building [Sevra](https://www.sevrahq.com/), a personal AI app powered
by Slotstream. The app is in development. Slotstream's command-line tool,
APIs, and Swift library remain independently usable.

## License

Slotstream is [MIT-licensed](LICENSE). The model weights have their own
[Qwen community license](https://huggingface.co/pipenetwork/Qwen3.8-Flash-Next-MLX-4bit/blob/main/LICENSE).
