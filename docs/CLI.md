# Command reference

Every command and flag in the released binary. `slotstream <command> --help`
carries the same text with longer discussion per flag; this page is the map.
Any command that loads the model takes the per-user lock, so one model
process runs at a time.

## Where things live

| Path | What |
|---|---|
| `~/.slotstream/bin/` | Symlink to the active release: the `slotstream` binary and its `mlx.metallib`. |
| `~/.slotstream/releases/<sha256>-macos<NN>/` | Each installed release, content-addressed. The installer stages a release here, verifies it, then switches the `bin` symlink. |
| `~/.slotstream/models/qwen38-flash-next-mlx-4bit/` | The weights: 25 files, 105.3 GB (the 1.5 GB draft head is optional). `.partmap` files exist only while a download is in progress. |
| `/usr/local/bin/slotstream`, or a PATH line in `~/.zshrc` / `~/.bash_profile` | How the installer puts the command on your PATH (the wrapper when `/usr/local/bin` is writable, the profile line otherwise). |
| `/tmp/slotstream-model-<uid>.lock` | The one-process lock, held while a model is loaded. |

## Everyday commands

### `slotstream run`

Generate once from a prompt, with no server.

| Flag | Meaning |
|---|---|
| `--prompt <text>` | The prompt (default: "Why is the sky blue?"). |
| `--max-tokens <n>` | Tokens to generate; `<= 0` means as many as the context allows (default 128). |
| `--greedy` | Deterministic greedy sampling. |
| `--raw` | Send the prompt without the chat template. |
| `--think` | Enable the model's thinking mode. |

Plus the [memory options](#memory-options) below.

### `slotstream serve`

The Ollama- and OpenAI-compatible server ([docs/API.md](API.md)).

| Flag | Meaning |
|---|---|
| `--port <n>` | Listen port on 127.0.0.1 (default 11434). |
| `--max-context <n>` | Longest prompt-plus-completion accepted, in tokens; past it a request is refused rather than left to stall (default 32768). |
| `--no-elastic` | Pin the cache at its startup size. By default an auto-sized cache resizes between requests as memory pressure changes; explicit sizes are always pinned. |
| `--no-prefix-cache` | Re-prefill every request from scratch instead of extending the previous request's state. |

Plus the memory options.

### `slotstream pull [model]`

Download the weights: parallel, resumable, hash-verified. The only model
name is `qwen3.8-flash-next:4bit`, which is also the default.

| Flag | Meaning |
|---|---|
| `--dir <path>` | Destination directory (default `~/.slotstream/models/qwen38-flash-next-mlx-4bit`). |
| `--connections <n>` | TCP connections, one URLSession each (default 8, cap 32). Eight fill a 1 Gbit/s link (112 MB/s on a full install); more buys nothing there or on slower links. `pull` prints the count it measures. |
| `--verify` | Re-hash an existing copy against the pinned sha256s and download nothing. |

Weights placed elsewhere are used by passing that directory to `--model`, or
by symlinking it into the default location so the model keeps its name (a
symlinked directory fails to open in 0.2.0; fixed on `main`).

### `slotstream doctor`

The device report, the plan your flags would produce, and what each memory
target buys. It never loads the model and takes no lock, so it is safe to run
any time.

| Flag | Meaning |
|---|---|
| `--sim-ram <gb>` | Preview the plan for a machine with this much RAM (pristine unless `--sim-available` is also given; working set defaults to 75% of RAM). |
| `--sim-working-set <gb>` | Pretend this Metal working-set limit. |
| `--sim-available <gb>` | Pretend this much memory is reclaimable right now. |
| `--json` | The resolved plan as JSON, with estimates unrounded. |

Plus the memory options, so `doctor --memory-gb 16` shows exactly what
`serve --memory-gb 16` would do.

## Memory options

Shared by `run`, `serve`, `doctor`, and every check that loads the model.
With none of them, auto sizes the process to the machine (see the README's
Memory section).

| Flag | Meaning |
|---|---|
| `--model <name or dir>` | Model name (resolves to `~/.slotstream/models`, or a dev checkout's `models/`) or a directory path. |
| `--memory-gb <gb>` | Total memory target for the whole process; the expert cache gets what remains after the resident, runtime, and context footprint plus a 1 GB margin. Minimum 8.1. The easiest knob. |
| `--experts-per-layer <n>` | Expert cache size directly, 1…512. Each of the 48 layers has 512 experts of 2.76 MB and the cache holds `n × 48` of them, so the pool is `n × 0.133 GB`: 30/layer is 4 GB, 181 is 24 GB, 226 is 30 GB. The pool is one global cache; hot layers borrow slots from cold ones. |
| `--pool-gb <gb>` | Raw expert-pool size (1 GB is about 7.5 experts per layer). |
| `--max-ram-percent <p>` | Auto only: the largest share of RAM auto may target (default 70). Lowers the target for other apps; cannot raise it past the ~33 GB knee. Ignored when an explicit knob is given. |

Precedence when several are given: `--experts-per-layer` beats `--pool-gb`,
which beats `--memory-gb`. An explicit size is pinned (no elastic resize) and
bypasses auto's availability clamp, which is exactly why it exists and why it
can drive a Mac into swap: prefer `--memory-gb` and check `doctor` first.

## Environment variables

| Variable | Read by | Meaning |
|---|---|---|
| `SLOTSTREAM_WEIGHTS_SOURCES` | `pull` | Comma-separated download bases tried in order (a private mirror, a local cache). Every file must still match the compiled-in hashes. |
| `SLOTSTREAM_PULL_CONNECTIONS` | `pull` | Parallel connections, capped at 32; same as `--connections`. |
| `SLOTSTREAM_PREFIX_CACHE` | engine | `0` disables conversation prefix reuse, like `--no-prefix-cache`. |
| `SLOTSTREAM_PREFILL_CHUNK` | engine | Override the prefill pass size in tokens instead of taking it from the memory plan. Measurement work only. |
| `SLOTSTREAM_IO_QUEUE_DEPTH` | engine | Expert read parallelism, 1…128 (default 12; measured flat from 12 to 32, worse above). |
| `SLOTSTREAM_EXPERT_LOAD_BATCH` | engine | Expert records staged at once during prefill, 1…512 (default 32; bounds peak memory on long prompts). |
| `SLOTSTREAM_ROOT_DIR` | installer | Install somewhere other than `~/.slotstream`. |
| `SLOTSTREAM_RELEASE_BASE` | installer | Fetch the release from another base URL (CI uses it to test unpublished builds). |

## Checks and diagnostics

These are the gates behind `Tools/verify.sh`, available in every install.
The first group needs no weights and runs in seconds; the second loads the
model, takes the lock, and allocates real memory, so give it a small target
(`--memory-gb 8.1` to `10`) the way the battery does.

**Weights-free**

| Command | Proves |
|---|---|
| `runtime-check` | Process RSS accounting and the prefix cache's four-conversation bound. |
| `governor-check` | The elastic resize policy across pressure, availability, and cooldowns. |
| `sampler-golden` | Sampling from reproducible synthetic logits, compared against `Tools/sampler_ref.py`. Flags: `--vocab`, `--draws`, `--seed`, `--logit-seed`, `--temperature`, `--top-p`, `--top-k`, `--min-p`, `--presence-penalty`, `--accumulate`. |
| `pull-check` | Same-size corruption detection and HTTP range validation in the downloader. |

**Load the model**

| Command | Proves |
|---|---|
| `elastic-check` | Greedy output is byte-identical across a live pool grow and shrink. `--max-tokens` (24), `--big-slots` (960; lower it on small machines). |
| `elastic-drill` | The live governor shrinks under pressure, honors the grow cooldown, grows back, and output never changes. `--slots` (4000), `--quick` skips the 60 s cooldown wait. |
| `prefix-check` | Conversation prefix reuse is equivalent, bounded, and deterministic. `--slots` (640), `--max-tokens` (24). |
| `parity` | N truncated layers match the Python reference dumps. `--layers` (4), `--tokens`, `--compare <dir>`, `--out <dir>`. |
| `template-check` | Renders the chat template for a canned conversation and prints token ids. `--think`. |
| `ngram-golden` | Prints n-gram row ids for a token sequence, for comparison with Python. `--tokens`. |
| `dequant-golden` | CPU-dequantizes one n-gram row for comparison with `mx.dequantize`. `--gid` (12345). |

## New in 0.2.0

- `--mtp auto|on|off` on `run`, `serve`, and `doctor`: speculative decode with the
  model's draft head, `mtp.safetensors`, which `pull` fetches with the
  weights (optional: a source without it leaves the pull green); `on`
  without the file is an error, `auto` is the
  default and stays off below a 28 GB target, where the cache still reaches
  120 experts per layer after the head's 1.6 GB. Measured on the dev Mac,
  the 0.2.0 build (four drafts) did not pay at any smaller cache (×0.55 to
  ×0.96 from 20 to 57 experts per layer, ×0.88 at 122); one draft, the
  default now, reads ×1.13 at 57 and ×1.17 at 122, the size auto enables it
  at. MEASUREMENTS.md M9 has the ladder and the measured ceiling.
- `mtp-parity`, `mtp-accept`, `mtp-check`: the draft head's parity with the
  Python reference, its measured accept rate (`--depth`, default 4), and the
  speculative-decode gates.
- `SLOTSTREAM_DRAFT_DEPTH`: draft chain depth, 1–16 (default 1, by
  measurement: a verify pass costs about a sixth of a pass per extra token
  and a rejection re-runs the kept tokens, so the shortest chain wins;
  MEASUREMENTS.md M9). Experiments only.
