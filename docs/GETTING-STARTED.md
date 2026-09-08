# Get started with Slotstream

This guide takes you from installation to your first reply. You don't need
Python or a developer account. You'll copy a few commands into Terminal.

## Before you start

You need an **Apple Silicon Mac, macOS 14 or later, and about 110 GB of free
SSD space**. Choose Apple menu → About This Mac to check your chip and memory.
The installer has been tested on macOS 14 and 15; runtime testing so far is
on macOS 26.

Macs with less memory run more slowly. An 8 GB Mac needs swap, which uses disk
space as extra memory and can slow down the whole computer. See the
[hardware guide](HARDWARE.md) for measurements from real Macs and estimates
for other memory sizes.

Slotstream currently runs one model, Qwen3.8-Flash-Next, on Apple Silicon.
Windows, Linux, and other models are not supported by the current engine.

## Install

Open Terminal: press **Command+Space**, type `Terminal`, and press **Enter**.
Paste the following command and press **Enter**:

```sh
curl -fsSL https://raw.githubusercontent.com/carloslfu/slotstream/main/install.sh | sh
```

This installs the latest release. If a later command says `slotstream` is
not found, open a new Terminal window and try again.

Check your Mac before downloading the model:

```sh
slotstream doctor
```

This shows available disk space, the planned memory use, and estimated speed.
It doesn't download or load the model. Check that you have enough free disk
space before continuing. Close memory-heavy apps if the report says memory
is tight.

## Ask for your first reply

Run:

```sh
slotstream run --prompt "Why is the sky blue?"
```

On first use, Slotstream shows the model download size, destination, and
free space, then asks for confirmation. Press **Enter** to accept, or type
`n` and press **Enter** to decline.

Once the download finishes, Slotstream loads the model, processes your
question, and prints the reply. The first reply may take a while to begin;
Terminal shows progress. When your normal terminal prompt returns, the
command has finished. Run it again with a different question in the quotes.
Each `run` command starts a fresh conversation.

For an ongoing conversation, use a [chat app](CLIENTS.md) or
[Hermes](HERMES.md).

## Downloading the model

You only need to download the model once. To download it before asking a
question, run:

```sh
slotstream pull
```

Slotstream downloads **88.3 GB** of compressed files from
[Hugging Face](https://huggingface.co/carloslfu/Qwen3.8-Flash-Next-MLX-4bit-Slotpack)
and restores the **105.3 GB** model on your SSD. No Hugging Face account is
needed. Afterward, the model runs offline; any web tools in a connected
agent still need their own internet access.

The transfer alone is estimated at about 2 hours at 100 Mbps or 8 hours at 25 Mbps.
Connection overhead and processing add to that time. You can stop with
**Control+C** and run the same command later to resume. Downloaded files are
checked for corruption automatically.

For an interrupted or damaged download, moving the files to another disk,
or reclaiming disk space, see [Troubleshooting](TROUBLESHOOTING.md).
Developers can read about compression and verification in the
[download format notes](DOWNLOAD-FORMAT.md).

## Ask about a picture

Put a picture named `cat.jpg` in your Downloads folder, then run:

```sh
slotstream run --image "$HOME/Downloads/cat.jpg" --prompt "What is in this picture?"
```

Replace `cat.jpg` with your file's name. Keep the quotes around the path if
it contains spaces. Images need extra memory, so Slotstream may refuse an
image when there isn't enough room. The image features have been tested,
but general image-answer accuracy has not been benchmarked.

## Connect an app or agent

- [Hermes](HERMES.md): chat and work with files and tools through a local model.
- [Open WebUI and other chat apps](CLIENTS.md): use a chat interface with Slotstream.
- [fx](FX.md): use a coding agent. Read its permission and long-session limitations before starting.

Install the app separately, then follow its connection guide. Keep the
Slotstream server running while the app uses it. Slotstream runs one model
process at a time, so stop a server with **Control+C** before using `slotstream run`.

## Update or get help

Run the installer command again to update Slotstream. Check the installed
version with `slotstream --version`. If a server was running during the
update, stop it with **Control+C** and start it again to use the new version.

See [Troubleshooting](TROUBLESHOOTING.md) for slow replies, startup errors,
downloads, and uninstalling. If you need to report a problem, include your
Mac model, memory, Slotstream version, the command you ran, and the error
message. Remove any private file contents or credentials from the report.

## Common questions

**Will this wear out my SSD?** Generation reads the model files without
rewriting them. macOS swap adds writes when memory runs short. Automatic
memory sizing helps, but a small Mac or an oversized manual setting can
still swap heavily.

**Can I use a different model or another operating system?** The current
engine supports only `qwen3.8-flash-next:4bit` on Apple Silicon. Windows and
Linux support for AMD and NVIDIA is planned for Sevra. See
[related projects](ENGINEERING.md#related-projects) for other runtimes.
