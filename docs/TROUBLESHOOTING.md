# Troubleshooting

Start with `slotstream doctor`. It checks your Mac's memory and disk space
without loading the model. Find the problem that matches what you're seeing below.

## `slotstream: command not found` after installing

Open a new Terminal window and try again. If that doesn't help, run the
[installer](GETTING-STARTED.md#install) again and read its final message.
It tells you how the `slotstream` command was added to your shell.

## The server can't listen on port 11434

Another app is using the address Slotstream needs. Ollama uses the same
port by default. Stop that server, or start Slotstream on a different port:

```sh
slotstream serve --port 11500
```

Use port 11500 in your chat app's connection settings too. Slotstream checks
this before loading the model.

## Another model process is already running

Slotstream runs one model process at a time to limit memory use. Find the
Terminal window where you started it and press **Control+C** before retrying.
If you're unsure what's running, this command lists Slotstream processes:

```sh
pgrep -fl slotstream
```

## The whole Mac is slow

Close memory-heavy apps and check `slotstream doctor` for memory warnings.
Stop Slotstream with **Control+C** and restart it without custom memory
settings so it can choose a size that fits.

An 8 GB Mac needs swap, which uses disk space as extra memory, even at the
minimum setting. It may remain slow with other apps closed. See
[hardware and speed](HARDWARE.md) for the limits of smaller Macs.

For manual adjustments, read the [memory settings](CLI.md#memory-options).
Forcing a larger setting can make the whole Mac slower.

## Generation is slower than the estimate

The estimates don't account for every chip, SSD, or temperature. Compare
your Mac with the [measured results](HARDWARE.md#results), especially if it
has less memory or a slower disk.

Other apps can leave less memory for Slotstream. Close them and let the
server adjust, or restart it. Avoid forcing a larger memory setting just
to match an estimate.

Replies can also be slower just after starting the model. Later requests
can reuse parts already loaded into memory.

## The first token takes a long time

Slotstream has to process your question and conversation history before it
starts replying. The terminal shows progress during long requests.
`slotstream doctor` estimates waits for different prompt lengths.

For a full conversation at the default limit, the estimated wait is about
3.0 min for the 48 GB M5 Pro plan and 6.4 min for the 16 GB plan. These
estimates come from the M5 Pro; slower SSDs can take longer. Follow-up turns
reuse unchanged history while it stays in memory.

If Hermes or fx gives up before Slotstream replies, check the timeout
settings in the [Hermes guide](HERMES.md#troubleshooting) or
[fx guide](FX.md#the-first-turn-takes-minutes).

## A download was interrupted or may be damaged

Run this again to resume:

```sh
slotstream pull
```

Keep the partially downloaded files; Slotstream reuses its saved progress.
To check existing files without downloading anything, run:

```sh
slotstream pull --verify
```

It checks for corruption and names any damaged files. The optional file
used for speculative decoding is skipped if absent.

For transport options and how verification works, see the
[download reference](DOWNLOAD-FORMAT.md#download-behavior-and-measured-checks).

## Store the weights on another disk

The model files are also called *weights*. Replace the path below with a
folder on your external SSD. Keep the quotes if the path contains spaces:

```sh
slotstream pull --dir "/Volumes/My SSD/slotstream-model"
slotstream serve --model "/Volumes/My SSD/slotstream-model"
```

If the model files are already there, only the second command is needed.
An external disk may be slower than the internal SSD.

## Reclaim disk space or uninstall

Stop Slotstream first. In Finder, choose **Go → Go to Folder** and enter
`~/.slotstream` to find its files.

Delete the `models` folder there to remove the downloaded model and keep
the program. This frees about 105 GB after a full download.

To remove both, delete `~/.slotstream`. Also remove the
`/usr/local/bin/slotstream` wrapper or the PATH entry the installer added to
your shell profile. If you chose a custom install or model folder, use
that location instead. The [installation reference](CLI.md#file-locations)
lists the default paths.

## Problems with older versions

[Run the installer again](GETTING-STARTED.md#update-or-get-help) to update.
Then stop and restart any running server. `slotstream --version` shows your
installed version; the [changelog](../CHANGELOG.md) lists the fixes in each release.

## Problems on macOS 14 or 15

The installer has been tested on these versions; running the model still
needs testing. [Report a bug](https://github.com/carloslfu/slotstream/issues/new)
with the error and your `slotstream doctor` output.

For other unresolved problems, include your Mac model, memory, Slotstream
version, the command you ran, and the error message. Remove credentials
and private file contents before posting.
