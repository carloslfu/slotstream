# slotstream

**Run a 105 GB model on a 48 GB Mac.**

Slotstream runs Qwen3.8-Flash-Next by keeping most of the model on your SSD
and loading the parts it needs into memory. After the download, the model
runs offline on your Mac. Use it in Terminal, a chat app, or an agent such
as Hermes.

[Get started](docs/GETTING-STARTED.md) · [Use Hermes](docs/HERMES.md) ·
[Get help](docs/TROUBLESHOOTING.md) · [Latest release](https://github.com/carloslfu/slotstream/releases/latest)

## Will it run on my Mac?

You need an **Apple Silicon Mac, macOS 14 or later, and about 110 GB of free
SSD space**. Macs with less memory run more slowly; an 8 GB Mac can become
slow to use. Runtime testing on macOS 14 and 15 is still needed.

Slotstream currently supports this one model on Mac. See the
[hardware guide](docs/HARDWARE.md) for results from real Macs and speed estimates.

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

On first use, Slotstream asks to download the model. This is a large,
one-time download and can take hours. Interrupted downloads resume when
you run the command again. The [getting-started guide](docs/GETTING-STARTED.md)
walks through each step.

<a id="downloading-the-model"></a>
<a id="chat-apps-and-the-api"></a>
<a id="pictures"></a>
<a id="coding-agents"></a>
<a id="faq"></a>
<a id="will-this-wear-out-my-ssd"></a>
<a id="can-i-run-it-on-linux-or-windows"></a>
<a id="can-i-use-a-different-model"></a>

## Guides

| I want to… | Start here |
|---|---|
| Install, download the model, or ask about a picture | [Get started](docs/GETTING-STARTED.md) |
| Use Hermes to work with files and tools | [Hermes setup](docs/HERMES.md) |
| Connect Open WebUI, another chat app, or fx | [Connect apps and agents](docs/CLIENTS.md) |
| Check how fast it runs on my Mac | [Hardware and speed](docs/HARDWARE.md) |
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

For developers: [engineering notes](docs/ENGINEERING.md),
[command reference](docs/CLI.md), [API reference](docs/API.md),
[Swift library](docs/LIBRARY.md), and [contributing](CONTRIBUTING.md).

<a id="why-this-exists"></a>
<a id="support"></a>

## Who made this

I'm [Carlos Galarza](https://www.carlosgalarza.com). I built Slotstream to
run this model on my own Mac. [Report a problem](https://github.com/carloslfu/slotstream/issues)
or [share your Mac's results](docs/HARDWARE.md#how-to-measure).
For consulting or help, write to [carloslfu@gmail.com](mailto:carloslfu@gmail.com).

I'm also building **Sevra**, a personal, local-first app powered by Slotstream.
The app is in development. The Slotstream CLI, APIs, and Swift package remain
independently usable. [See Sevra and join the waitlist](https://www.sevrahq.com/).

<a id="star-history"></a>

[Star history](docs/ENGINEERING.md#star-history) · [Changelog](CHANGELOG.md)

## License

[MIT](LICENSE). Model weights are separately covered by the
[Qwen community license](https://huggingface.co/pipenetwork/Qwen3.8-Flash-Next-MLX-4bit).
See [credits](docs/ENGINEERING.md#credits) for the upstream code and model.
