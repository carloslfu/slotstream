# Command reference

This page covers everyday commands, memory settings, and common diagnostics.
Run `slotstream <command> --help` for the options in your installed version.
Only one model process can run per user at a time.

<a id="where-things-live"></a>

## File locations

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
| `--image <path>` | Attach a local image; repeat the flag for multiple images. |

Plus the [memory options](#memory-options) below.

### `slotstream serve`

Start the local API server. See the [API reference](API.md) for the Ollama
and OpenAI endpoints and the [fx guide](FX.md) for the AI SDK gateway.

| Flag | Meaning |
|---|---|
| `--port <n>` | Listen port on 127.0.0.1 (default 11434). |
| `--max-context <n>` | Maximum tokens shared by prompt and reply. Default and ceiling: 32768. You can lower the cap; a prompt above it returns 400. Context state uses about 27 KiB per token. |
| `--no-elastic` | Pin the cache at its startup size. By default an auto-sized cache resizes between requests as memory pressure changes; explicit sizes are always pinned. |
| `--no-prefix-cache` | Process each prompt from scratch. Useful for reproducibility comparisons. |

Plus the memory options.

### `slotstream pull [model]`

Download the model weights with resumable transfers and hash verification.
The only model name is `qwen3.8-flash-next:4bit`, which is also the default.

| Flag | Meaning |
|---|---|
| `--dir <path>` | Destination directory (default `~/.slotstream/models/qwen38-flash-next-mlx-4bit`). |
| `--connections <n>` | Parallel TCP connections (default 8, cap 32). Eight measured 112 MB/s for a full download on a 1 Gbit/s link. `pull` reports the active count. |
| `--verify` | Check existing files against pinned SHA-256 hashes without downloading. |

Weights placed elsewhere are used by passing that directory to `--model`, or
by symlinking it into the default location. Symlinked directories work from
0.2.1 onward.

### `slotstream doctor`

Show your Mac's memory plan, disk space, and estimated speed. This command
never loads the model and can run while the server is working.

| Flag | Meaning |
|---|---|
| `--sim-ram <gb>` | Preview a Mac with this much RAM. Assumes no other apps are using memory unless `--sim-available` is set; working set defaults to 75% of RAM. |
| `--sim-working-set <gb>` | Use this Metal working-set limit in the simulation. |
| `--sim-available <gb>` | Use this much available memory in the simulation. |
| `--max-context <n>` | Preview the plan `serve --max-context n` would announce. |
| `--json` | The resolved plan as JSON, with estimates unrounded (`max_context_tokens`, `est_prefill_s_at_max_context`). |

Plus the memory options, so `doctor --memory-gb 16` shows exactly what
`serve --memory-gb 16` would do. The report ends with the wait before the
first token by prompt length at that plan, and the tier table carries the
wait for a prompt filling the whole context.

### `slotstream context-check`

Measure how long a synthetic prompt takes on your Mac, with conversation
reuse disabled. It reports seconds, tokens per second, and peak process
memory against the plan. It checks available memory between passes and
stops if it falls below the threshold.

Stop any running model process first. Results are printed without writing
files; contributors can register them in the measurement records under `db/`.

| Flag | Meaning |
|---|---|
| `--tokens <n>` | Prompt length (default 8192; at most 262144). |
| `--ladder` | Run 2048, 4096, … up to `--tokens`, stopping at the first rung that leaves the plan. |
| `--min-free-gb <gb>` | Abort a pass when reclaimable memory falls below this (default: the planner's slack, 5% of RAM, at least 1.5 GB). |
| `--json` | One JSON object per rung. |

Plus the memory options; give it the same target you would give `serve`.

## Memory options

Shared by `run`, `serve`, `doctor`, and every check that loads the model.
With none of them, auto sizes the process to the machine (see the README's
Memory section).

| Flag | Meaning |
|---|---|
| `--model <name or dir>` | Model name (resolves to `~/.slotstream/models`, or a dev checkout's `models/`) or a directory path. |
| `--memory-gb <gb>` | Total process memory target, in decimal GB. The cache gets what remains after fixed allocations and a 1 GB margin. Minimum 8.1; use this option for a manual target. |
| `--experts-per-layer <n>` | Expert cache size directly, 1…512. Each of the 48 layers has 512 experts of 2.76 MB and the cache holds `n × 48` of them, so the pool is `n × 0.133 GB`: 30/layer is 4 GB, 181 is 24 GB, 226 is 30 GB. The pool is one global cache; hot layers borrow slots from cold ones. |
| `--pool-gb <gb>` | Raw expert-pool size (1 GB is about 7.5 experts per layer). |
| `--vision auto\|on\|off` | Accept images (default `auto`). `auto` loads the image encoder on first use; `on` also requires the checkpoint to contain vision weights; `off` rejects images. |
| `--mtp auto\|on\|off` | Speculative decode (default `auto`); see [Speculative decode](#speculative-decode). |
| `--max-ram-percent <p>` | Auto only: the largest share of RAM auto may target (default 70). Lowers the target for other apps; cannot raise it past the ~33 GB ceiling. Ignored when an explicit size is given. |

Precedence when several are given: `--experts-per-layer` beats `--pool-gb`,
which beats `--memory-gb`. An explicit size stays fixed and
bypasses automatic availability checks. Preview it with `doctor` and make
sure the memory is available before loading the model.

## Environment variables

| Variable | Read by | Meaning |
|---|---|---|
| `SLOTSTREAM_WEIGHTS_SOURCES` | `pull` | Comma-separated download bases tried in order (a private mirror, a local cache). Every file must still match the compiled-in hashes. |
| `SLOTSTREAM_PULL_CONNECTIONS` | `pull` | Parallel connections, capped at 32; same as `--connections`. |
| `SLOTSTREAM_PREFIX_CACHE` | engine | `0` disables conversation prefix reuse, like `--no-prefix-cache`. |
| `SLOTSTREAM_PREFILL_CHUNK` | engine | Override the largest prefill pass in tokens instead of taking it from the memory plan; the schedule still shrinks it as the context grows. Measurement work only. |
| `SLOTSTREAM_IO_QUEUE_DEPTH` | engine | Expert read parallelism, 1…128 (default 12; measured flat from 12 to 32, worse above). |
| `SLOTSTREAM_EXPERT_LOAD_BATCH` | engine | Expert records staged at once during prefill, 1…512 (default 32): the sweep's group size on a pass of 256 tokens or more, the pool's load slice below that. Bounds peak memory on long prompts. |
| `SLOTSTREAM_SWEEP` | engine | `0` runs every prefill pass through the slot pool the way 0.2.2 and earlier did, instead of the sweep. A/B work only; slower. |
| `SLOTSTREAM_SWEEP_ADMIT` | engine | `0` stops the last pass of a prompt from admitting the prompt's hottest experts into the pool, so decode starts cold. A/B work only. |
| `SLOTSTREAM_SWEEP_TRACE` | engine | `1` prints, after each prefill, where the sweep's time went: reads, waiting for the GPU, sorting rows, copies out of the pool, and MLX's peak and cache. |
| `SLOTSTREAM_PREFILL_CACHE_MB` | engine | MLX buffer-cache cap while a prompt is read. The plan sets 512 at targets of 12 GB and under (the sweep's varying array sizes otherwise fill the 2 GB cache, 1.7 GB of peak at the floor) and no cap above, where it costs ~6% of prefill; this forces a value at any target. |
| `SLOTSTREAM_ROOT_DIR` | installer | Install somewhere other than `~/.slotstream`. |
| `SLOTSTREAM_RELEASE_BASE` | installer | Fetch the release from another base URL (CI uses it to test unpublished builds). |

## Checks and diagnostics

These checks help diagnose an installation. The first group needs no weights;
the second loads the model. Use small explicit memory targets for model
checks (`--memory-gb 8.1` to `10`) and stop other model processes first.
See [Testing](TESTING.md) for the full suites.

**Weights-free**

| Command | Proves |
|---|---|
| `runtime-check` | Process RSS accounting and the prefix cache's four-conversation bound. |
| `governor-check` | The elastic resize policy across pressure, availability, and cooldowns. |
| `sampler-golden` | Sampling from reproducible synthetic logits, compared against `Tools/sampler_ref.py`. Flags: `--vocab`, `--draws`, `--seed`, `--logit-seed`, `--temperature`, `--top-p`, `--top-k`, `--min-p`, `--presence-penalty`, `--accumulate`. |
| `pull-check` | Same-size corruption detection and HTTP range validation in the downloader. |
| `prefill-schedule` | The prefill passes a prompt runs at a given pass size and the wait they imply; the same arithmetic `doctor` and the 400 message use. `--chunk` (4096), `--tokens` (32768), `--from` (0), `--json`. |

**Load the model**

| Command | Proves |
|---|---|
| `elastic-check` | Greedy output is byte-identical across a live pool grow and shrink. `--max-tokens` (24), `--big-slots` (960; lower it on small machines). |
| `elastic-drill` | The live governor shrinks under pressure, honors the grow cooldown, grows back, and output never changes. `--slots` (4000), `--quick` skips the 60 s cooldown wait. |
| `prefix-check` | Conversation prefix reuse is equivalent, bounded, and deterministic. `--slots` (640), `--max-tokens` (24). |
| `sweep-check` | The prefill sweep (passes of 256 tokens or more) stays inside the prefill-rechunk band against the pool path, is deterministic, gives bit-identical logits on a cold and a warm pool, and leaves the pool consistent after admission. `--slots` (640). |
| `parity` | N truncated layers match the Python reference dumps. `--layers` (4), `--tokens`, `--compare <dir>`, `--out <dir>`. |
| `template-check` | Renders the chat template for a canned conversation and prints token ids. `--think`. |
| `ngram-golden` | Prints n-gram row ids for a token sequence, for comparison with Python. `--tokens`. |
| `dequant-golden` | CPU-dequantizes one n-gram row for comparison with `mx.dequantize`. `--gid` (12345). |

<a id="new-in-020"></a>

## Speculative decode

- `--mtp auto|on|off` on `run`, `serve`, and `doctor`: speculative decode with the
  model's draft head, `mtp.safetensors`, which `pull` fetches with the
  weights. The file is optional; downloads can complete without it. `on`
  without the file is an error; `auto`, the default, turns it on when the
  cache still reaches 120 experts per layer after the head's 1.6 GB (a 28 GB
  target) and stays off below that, where it reduced speed in tests. At that size
  it measured ×1.24 decode; MEASUREMENTS.md M9 has the ladder and the
  ceiling.
- `mtp-parity`, `mtp-accept`, `mtp-check`: the draft head's parity with the
  Python reference, its measured accept rate (`--depth`, default 4), and the
  speculative-decode gates.
- `SLOTSTREAM_DRAFT_DEPTH`: draft chain depth, 1–16 (default 1, by
  measurement: longer verification passes cost more, and one draft was best or tied
  at the tested cache sizes; MEASUREMENTS.md M9). Rejected drafts roll
  back to recorded state. This override is for experiments.
