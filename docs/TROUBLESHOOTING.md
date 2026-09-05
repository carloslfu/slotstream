# Troubleshooting

Start with `slotstream doctor`. It checks your Mac's memory plan and disk
space without loading the model.

## `slotstream: command not found` after installing

Open a new terminal and try again. The installer either creates a wrapper in
`/usr/local/bin` or adds `~/.slotstream/bin` to your shell's PATH. Its final
message tells you which it used.

## The server can't listen on port 11434

Ollama uses the same port by default. Stop the existing server, or choose
another port:

```bash
slotstream serve --port 11500
```

Use port 11500 in your client settings too. slotstream checks the port before
loading the model.

## Another model process is already running

slotstream allows one model process per user to limit memory use. Check
what's running with `pgrep -fl slotstream`, then stop your existing `serve`,
`run`, or diagnostic command before retrying. For a server in a terminal,
press **Ctrl+C** in that terminal.

## The whole Mac is slow

Run `slotstream doctor` and look for memory warnings. If the planned peak
exceeds the Metal working-set limit, the model may need to page memory to
disk. Close memory-heavy apps or lower the target with `--memory-gb`.

An 8 GB Mac needs swap even at the minimum target. It may remain slow with
other apps closed.

## Generation is slower than the estimate

Compare the startup plan's `target:` line with the README table:

- **A lower target:** other apps were using memory, so automatic sizing
  chose a smaller cache. Close those apps and let the server resize, or
  restart it. Avoid forcing a larger target unless the memory is available.
- **The same target:** the estimate may not fit your hardware. Chip speed,
  SSD speed, and thermal limits also matter. A base-storage Mac mini M2
  measured much slower than the M5 Pro-based estimate. See
  [Hardware measurements](HARDWARE.md).

The first generation also starts with a cold cache. Compare repeated requests
when checking warm decode speed.

## The first token takes a long time

The model processes the prompt before generating a reply. `slotstream doctor`
shows estimated waits for different prompt lengths. A full 32k prompt is
estimated at about 3.0 min for the 48 GB M5 Pro plan and 6.4 min for the 16 GB
plan; slower SSDs can take longer.

`run` and `serve` print progress for long prompts. Follow-up turns reuse
unchanged conversation history while it remains cached. To measure a prompt
on your Mac, stop the server and run `slotstream context-check --tokens 8192`.

## A download was interrupted or may be damaged

Run `slotstream pull` again to resume. To check existing files without
downloading anything:

```bash
slotstream pull --verify
```

It checks the files against pinned SHA-256 hashes and names any damaged file.
The optional draft head is skipped if absent.

## Store the weights on another disk

```bash
slotstream pull --dir /Volumes/big/qwen38
slotstream serve --model /Volumes/big/qwen38
```

Replace `/Volumes/big/qwen38` with your destination. You can also point
`--model` at an existing weights directory. SSD speed affects generation,
so an external disk may be slower than the internal one.

## Reclaim disk space or uninstall

Delete `~/.slotstream/models` to remove the downloaded weights and keep the
program. This frees about 105 GB after a full download.

To remove both the program and the weights, delete `~/.slotstream`. Also
remove the `/usr/local/bin/slotstream` wrapper or the PATH entry the installer
added to your shell profile. If you chose a custom install or model directory,
remove that directory instead.

## Problems with older versions

Version 0.2.0 rejected fields sent by `ollama run` and couldn't load a weights
directory through a symlink. Both were fixed in 0.2.1. Run the installer again
to upgrade; `slotstream --version` shows your installed version.

## Problems on macOS 14 or 15

The installer is tested on these versions; the runtime still needs testing.
[Open an issue](https://github.com/carloslfu/slotstream/issues/new) with the
error and your `slotstream doctor` output.
