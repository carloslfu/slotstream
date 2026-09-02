# Troubleshooting

### "cannot listen on 127.0.0.1:11434 … another slotstream (or Ollama) is already there"

Ollama defaults to the same port. Stop one of them, or run
`slotstream serve --port 11500` and point your client at that. slotstream
claims the port *before* loading the model, so this costs a second and one
sentence, not a full load.

### `ollama run` says "unsupported request field(s): name, options, system, template"

0.2.0 refuses the empty fields the Ollama CLI always sends, so `ollama run`
stops before the first message. Fixed on `main` and in the next release;
until you upgrade, use curl, Open WebUI, or an OpenAI SDK pointed at
`http://localhost:11434/v1` ([docs/API.md](API.md)).

### "another Slotstream model process is already running for this user"

One model process per user, by design: a 100 GB-class model doesn't share a
Mac with a sibling. `pgrep -fl slotstream` shows what's running; stop it and
retry.

### Everything is slow, or the whole Mac is

Run `slotstream doctor`. If the expected peak exceeds your Metal working set
it says so; that means paging. Close the big apps (browsers hold gigabytes),
or lower the target with `--memory-gb`. On an 8 GB Mac the floor itself
pages; that tier is for the curious.

### Decode is slower than the tier table says

Compare the `target:` line of the plan printed at startup with your row in
the README table.

- Lower than the row, with a `note:` about reclaimable memory: other apps
  were holding memory at startup, so auto took less. Close them and restart,
  or pin the row's target, e.g. `slotstream serve --memory-gb 22` on a 32 GB
  Mac. A pinned size skips the availability check, so it pages if that
  memory is not actually free.
- Same as the row: the cache is full size and the disk is the limit. Only
  the 48 GB row is measured; the rest are estimated from a 48 GB M5 Pro, and
  base-storage Macs have slower SSDs. No memory flag changes that.

### The first token takes forever

The whole prompt is read before the first token. `slotstream doctor` ends
with the wait to expect by prompt length at your plan (about 5.5 min for a
full 32k prompt on a 48 GB Mac, 13.7 min on a 16 GB one), and `run` and
`serve` print progress lines for any prompt over 2k tokens, so silence past
a few seconds is not a hang. Follow-up turns in the same conversation read
only what is new. `slotstream context-check --tokens N` measures a prompt of
any length on your Mac.

### A download was interrupted, or looks suspect

Re-run `slotstream pull`; it resumes where it stopped. `slotstream pull
--verify` re-hashes all 25 files against the pinned sha256s in seconds (the
optional draft head is skipped when absent) and
names the bad file, if there is one.

### Putting the weights on an external disk

```bash
slotstream pull --dir /Volumes/big/qwen38
slotstream serve --model /Volumes/big/qwen38
```

Anything that takes `--model` accepts a directory path. In 0.2.0 pass the
real directory, not a symlink to it: `run` and `serve` refuse a symlinked
weights folder ("couldn't be opened") even though `doctor` and `pull --verify`
accept one; fixed on `main`. Expect slower decode: external disks rarely
match the internal SSD.

### Reclaiming the disk

The weights live in `~/.slotstream/models` (105 GB). Delete that folder to
get the space back and keep the binary, or `rm -rf ~/.slotstream` to remove
everything; a full uninstall also drops the `/usr/local/bin/slotstream`
wrapper or the PATH line the installer said it added.

### `slotstream: command not found` right after installing

The installer puts a wrapper in `/usr/local/bin` when it can write there, and
otherwise adds one line to your shell profile. Open a new terminal (or
`exec $SHELL`) and retry.

### macOS 14 or 15

The installer is tested there; the runtime isn't yet. If something breaks,
open an issue with your `slotstream doctor` output.
