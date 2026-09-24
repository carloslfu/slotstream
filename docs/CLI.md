# Command reference

This page covers everyday commands, memory settings, and common diagnostics.
Run `slotstream <command> --help` for the options in your installed version.
Only one model process can run per user at a time.

The shared `run` context option, request-wait controls, feasibility metadata
and expanded `context-check` flags below are available starting in Slotstream 0.2.14.

<a id="where-things-live"></a>

## File locations

| Path | What |
|---|---|
| `~/.slotstream/bin/` | Symlink to the active release: the `slotstream` binary and its `mlx.metallib`. |
| `~/.slotstream/releases/<sha256>-macos<NN>/` | Each installed release, content-addressed. The installer stages a release here, verifies it, then switches the `bin` symlink. |
| `~/.slotstream/launch/codex/` | The model descriptions and base instructions `slotstream launch codex` gives Codex, one per Codex version and window. |
| `~/.slotstream/launch/server-<port>.json` | The server `slotstream launch` started on that port, by process id and start time, so a later launch knows it may restart it. |
| `~/.slotstream/launch/start-<port>.lock` | Held while a launch may start a server on that port, so a second launch waits for that server. |
| `~/.slotstream/logs/serve.log` | The log of the server `slotstream launch` started (`serve-<port>.log` on another port), with the previous start's as `.1`. |
| `~/.slotstream/prefix-cache/` | Prompt caches the server `slotstream launch` started keeps on disk: token ids and model state, 20 GB at most. `slotstream prefix-cache` lists or clears them. |
| `~/.slotstream/models/qwen38-flash-next-mlx-4bit/` | The weights: 25 files, 105.3 GB (the 1.5 GB draft head is optional). Compressed pulls use `.slotpack-state.json` and `.slotpack.part` files while in progress; legacy raw pulls use `.partmap` and `.part`. |
| `/usr/local/bin/slotstream`, or a PATH line in `~/.zshrc` / `~/.bash_profile` | How the installer puts the command on your PATH (the wrapper when `/usr/local/bin` is writable, the profile line otherwise). |
| `/tmp/slotstream-model-<uid>.lock` | The one-process lock, held while a model is loaded. |

## Reading tokens per second

`slotstream run` prints a `-- decode` line with average `tok/s` after the
response, and a separate prefill rate for reading the prompt. Add
`--stats-json stats.json` to save the raw generation measurements.

When using an existing `slotstream serve`, the Ollama-compatible `/api/chat`
and `/api/generate` endpoints return `eval_count` and `eval_duration` in the
final response. For streaming, read the final frame. Duration is in
nanoseconds: divide the count by `eval_duration / 1e9` when that duration is
positive. This measures the decode phase and excludes prefill. The ordinary
OpenAI-compatible response supplies token usage without these duration fields.

These are end-of-response statistics. A planner's expected speed is an
estimate; it is separate from the measured rate of a completed request.
[The serving benchmark and throughput expectations](../MEASUREMENTS.md#three-prompt-serving-benchmark-and-throughput-expectations)
show the observed variation, prompt-reuse behavior and measurement limits.

## Everyday commands

### `slotstream run`

Generate once from a prompt, with no server.

| Flag | Meaning |
|---|---|
| `--prompt <text>` | The prompt (default: "Why is the sky blue?"). |
| `--max-context <auto or n>` | Window shared by the final templated input and reply. Default `auto`; the same planning and bounds as `serve`. |
| `--max-prefill-wait <minutes>` | Accepted request to first sampled model token, including preparation. Default 30 minutes; `0` disables only the time policy. |
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
| `--max-context <auto or n>` | Maximum tokens shared by prompt and reply. Default `auto`: the largest of 32768, 65536, 131072 and 262144 tokens that keeps speculative decoding, retains one complete conversation and adds at most 10% to the estimated request time. Auto declines cache reductions above the measured decode range because their performance cost is unknown; `doctor` shows each tradeoff. A number fixes the window, from 1 to 262144, the model's limit. Requests with images stay within 65536. A larger window is priced before allocating the expert cache; a prompt above the configured cap returns 400. Main sequence-cache capacity costs about 27 KiB per token, plus recurrent, retained, draft and transient allocations. |
| `--max-prefill-wait <minutes>` | Accepted request to first sampled model token, including queueing, tokenization and images. Default 30 minutes; `0` disables only time. |
| `--no-elastic` | Pin the cache at its startup size. By default an auto-sized cache resizes between requests as memory pressure changes; explicit sizes are always pinned. |
| `--no-prefix-cache` | Process each prompt from scratch. Useful for reproducibility comparisons. |
| `--prefix-cache-dir <dir>` | Also keep conversation states on disk, so a restarted server, or a conversation longer than the in-memory cache holds, resumes from its last committed state instead of processing its prompt again. Off unless set. A state is written after its reply completes. The first write stores the fixed recurrent state and every cached token; each later turn writes the recurrent state plus only the tokens it added, keeps the previous turn's state so that reply can still be regenerated after a restart, and removes older states of the conversation. Files hold the conversation's token ids and model state and are used only by the same binary, model files and settings that wrote them; starting the server removes files from other builds. Requests with images are not written. The prefix conversations share is written too: when a prompt's system message ends 512 tokens or more in, or a prompt shares at least 512 tokens with a state already kept, that head is stored during the prompt's own prefill, rounded down to the prefill pass grid, the 256-token grid by default, so the next conversation with the same system prompt resumes from it, in the same process or after a restart. A shared prefix is kept once, is never replaced by the conversations that extend it, and is listed as such. `slotstream prefix-cache` lists or clears the directory. |
| `--prefix-cache-disk-gb <gb>` | Disk quota for `--prefix-cache-dir` (default 20), applied at startup and before each write. When it is full, states nobody continued go first, then previous-turn states kept for regenerating, then conversations, then the prefixes several conversations start from, least recently used first within each. |
| `--prefix-cache-min-tokens <n>` | Shortest state written to `--prefix-cache-dir` (default 2048 tokens), for conversation states and shared prefixes alike; a shorter shared prefix is still kept in memory. |
| `--prefix-cache-max-age-days <days>` | Remove states in `--prefix-cache-dir` unused for this many days (default 30), at startup and before writes. `0` keeps them until the quota needs room. |
| `--idle-exit <minutes>` | Stop after this many minutes with no request and no registered agent still running (default 0, keep serving). `slotstream launch` starts its server with 30 and registers each agent it opens through `POST /slotstream/clients`. The log says why the server stopped. |

Plus the memory options.

### `slotstream launch [agent] [arguments...]`

Start a coding agent connected to Slotstream. The agent is `claude`, `codex`,
`pi`, `opencode` or `hermes`; everything after its name is passed to it.
Without a name, the command lists the agents installed and asks which one to
start. It asks the server for its model, context window and reply limit,
prepares the agent's connection, and replaces itself with the agent, so the
agent runs in the same Terminal window. [Coding agents](CODING-AGENTS.md)
describes what each agent receives and which files are written.

When no server answers on the port, the command starts one in the background
and shows its start until it answers:

- with the window the agent needs (the automatic window, or 65,536 tokens for
  Hermes when the automatic one is smaller) and the `--memory-gb` given here;
- with prompt caches kept on disk in `~/.slotstream/prefix-cache`
  (`--prefix-cache-dir`, 20 GB at most), so a restarted server does not read an
  agent's instructions again;
- with its log in `~/.slotstream/logs/serve.log` (`serve-<port>.log` on another
  port), the previous start's kept as `.1`;
- in its own session, so Control-C and a closed Terminal reach only the agent.

That server keeps running while any agent `slotstream launch` opened is
running, and stops 30 minutes after the last one exits and its last request
ends (`--idle-exit`). `slotstream stop` stops it sooner. Control-C while it
starts stops it too. A server you started yourself is used as it is; the
command never restarts it. Two launches at the same time start one server:
the second waits for the first to finish starting, then uses its server.

| Flag | Meaning |
|---|---|
| `--port <n>` | The port the server listens on (default 11434). |
| `--memory-gb <gb>` | Memory target for a server this command starts, as in `serve`. Default: automatic. When a server with another target is already running, it is left as it is and a note names its target. |
| `--memory-limit-gb <gb>` | Adaptive ceiling for a server this command starts (development version). Cannot be combined with `--memory-gb`. An existing server keeps its settings; a note explains when the requested limit does not apply. |
| `--idle-exit <minutes>` | How long a server this command starts keeps running after its last agent exits (default 30, at most 10080); `0` keeps it running until `slotstream stop`. |
| `--no-start` | Use a running server only; never start or restart one. |
| `--dry-run` | Print the server it would start, the command, the variables it sets or removes, the files it would write, and notes; start, download and write nothing. Keys and tokens in the output are hidden, and for Pi only the `slotstream` entry of its models file is shown. |

The served window must reach the agent's minimum: 32,768 tokens for Claude Code
and Codex, 16,384 for Pi and opencode, 65,536 for Hermes. When the running
server's window is smaller, a server this command started and no agent is
using is restarted with the larger window; any other server is left running,
and the message says how to restart it.

It stops with a message, before starting the agent, when another server
answers on the port, when the server is busy with every connection it takes,
when another Slotstream model process runs for this user, when the model is
not downloaded and there is no terminal to ask on (with one, it asks first),
when the server is too old for the agent's API, or when the agent is not on
`PATH`. It also refuses what would not run on this Mac: `codex cloud`, Codex's
`--output-schema`, Pi with another `--provider` and no `--model`, and a Hermes
configuration whose `context_length` is larger than the served window. The
agent's arguments and files are checked before a server starts, so these
refusals come before the server's start, and before the model download is
offered. Codex needs its version's base instructions for the model
description; the first launch of each Codex version downloads them from the
Codex repository and keeps them under `~/.slotstream/launch/codex/`.

### `slotstream stop`

Stop the Slotstream server on a port: the one `slotstream launch` started in
the background, also while it is still starting, or one running in a Terminal
window. The server's requests end at once; prompt caches already on disk stay
for the next server. When no server answers, it says so and exits
successfully.

| Flag | Meaning |
|---|---|
| `--port <n>` | The port the server listens on (default 11434). |

### `slotstream prefix-cache`

Show what a `serve --prefix-cache-dir` directory holds, or clear it. Nothing is
loaded, so this works while no server runs; listing also works while one does.

| Flag | Meaning |
|---|---|
| `--dir <path>` | The directory given to `--prefix-cache-dir`. Default: `~/.slotstream/prefix-cache`, the one servers that `slotstream launch` starts use. |
| `--clear` | Remove every state file. Refused while a server or app holds the directory. |
| `--json` | Print JSON instead of text. |

Each state is listed with the build that wrote it, its token count, the size of
its own file and when it was last used. Cached tokens that several states share
are stored once and reported as one total.

### `slotstream pull [model]`

Download losslessly compressed model weights from Hugging Face, reconstructing
the original files with resumable transfers and hash verification.
The only model name is `qwen3.8-flash-next:4bit`, which is also the default.

| Flag | Meaning |
|---|---|
| `--dir <path>` | Destination directory (default `~/.slotstream/models/qwen38-flash-next-mlx-4bit`). |
| `--connections <n>` | Fixed independent connections, 1–32. Omit to start at 8 and test increases only while throughput improves. |
| `--transport automatic\|compressed\|raw` | Automatic uses compressed Hugging Face objects for new pulls and preserves legacy raw resumes. Explicit raw selects file-based mirrors. |
| `--verify` | Check existing files against pinned SHA-256 hashes without downloading. |

The complete compressed package uses **16.12% fewer bytes**. Decode and writes
overlap the transfer. Historical raw-path testing measured 112 MB/s on a
1 Gbit/s link; that is not a guarantee for another connection. Ctrl-C safely
preserves verified chunks. See [the download guide](DOWNLOAD-FORMAT.md).

Since 0.2.19, `pull` also fetches one optional file outside the compressed
package: the 37.5 MB decode forecast correction
`lookahead/tap-correction-attention-rank128-v1.safetensors`, verified by size and
SHA-256 against the pinned mirror commit. `--verify` reports it, an installed
model gets it by running `slotstream pull` again, and a model directory without
it runs the 0.2.16 forecast.

Weights placed elsewhere are used by passing that directory to `--model`, or
by symlinking it into the default location. Symlinked directories work from
0.2.1 onward.

### `slotstream doctor`

Show your Mac's memory plan, disk space, and estimated speed. This command
never loads the model and can run while the server is working.

| Flag | Meaning |
|---|---|
| `--sim-ram <gb>` | Preview this much RAM in decimal GB. Simulates memory capacity, not another chip or SSD. Assumes no other apps are using memory unless `--sim-available` is set; working set defaults to 75% of RAM. |
| `--sim-working-set <gb>` | Use this Metal working-set limit in the simulation. |
| `--sim-available <gb>` | Use this much available memory in the simulation. |
| `--max-context <auto or n>` | Default `auto` reports the automatic window, every candidate and the reason it was or wasn't taken. A number previews that window's allocation and reports the largest memory-feasible window under these inputs. |
| `--max-prefill-wait <minutes>` | Preview the request deadline separately from memory feasibility; default 30 minutes, `0` disables only time. |
| `--json` | The resolved plan as JSON, with estimates unrounded (`max_context_tokens`, `est_prefill_s_at_max_context`), plus `context_window_source` and, in auto mode, `automatic_context_window`. |

Plus the memory options, so `doctor --memory-gb 16` shows exactly what
`serve --memory-gb 16` would plan under the same conditions. Its estimated
prefill times use M5 Pro measurements; they exclude startup, queueing,
image preparation and reasoning before visible answer text. The full-window
estimate is a planning reference; actual requests also need room for a reply.

### `slotstream context-check`

Run an explicit capacity diagnostic with a synthetic prompt. Conversation
reuse is disabled by default; the retained-state mode first fills distinct
conversations and exercises their interleaved follow-ups. The report includes
actual prompt and reply IDs, compute shapes, sampled physical footprint and
swap observations. Incomplete output, exceeded process budgets and missing
required process-memory evidence fail qualification. Global paging is recorded
separately and does not fail capacity acceptance; it can exclude clean timing.

Stop any running model process first. Results are printed without writing
files; contributors can register them in the measurement records under `db/`.

| Flag | Meaning |
|---|---|
| `--tokens <n>` | Prompt length (default 8192); prompt plus the required reply must fit the model limit. |
| `--reply-tokens <n>` | Required nonempty output, reserved before model loading (default 16). An early stop is incomplete qualification. |
| `--max-prefill-wait <minutes>` | The same request deadline; `0` disables only this deadline. |
| `--wall-seconds <seconds>` | Independent hard duration bound per rung (default 7200). |
| `--plan-only` | Print the unqualified memory plan and resolved runtime controls without loading an engine. |
| `--warm-conversations <n>` | Fill and revisit retained conversations before the main request. Requires a single rung and enough configured room. |
| `--warm-tokens <n>` | Length of each distinct warm-up prompt. Its reply and follow-up must also fit the configured window. |
| `--sample-footprint` | Compatibility flag; this diagnostic always samples physical footprint in addition to lifetime process RSS and allocator telemetry. |
| `--ladder` | Run 2048, 4096, … up to `--tokens`, stopping at the first rung that leaves the plan. |
| `--min-free-gb <gb>` | Abort a pass when reclaimable memory falls below this (default: the planner's slack, 5% of RAM, at least 1.5 GB). |
| `--json` | One JSON object per rung. |

Plus the memory options; give it the same target you would give `serve`.
With retained conversations, the wall-clock ceiling covers both warm-up and
the main request. Diagnostic access above the public implementation ceiling
does not make that window supported by `serve` or `run`.

## Memory options

Shared by `run`, `serve`, `doctor`, and every check that loads the model.
With no sizing override, auto sizes the process to the machine (see
[memory defaults](../README.md#why-doesnt-slotstream-use-all-of-my-ram)).

| Flag | Meaning |
|---|---|
| `--model <name or dir>` | Model name (resolves to `~/.slotstream/models`, or a dev checkout's `models/`) or a directory path. |
| `--memory-limit-gb <gb>` | Adaptive total process ceiling, in decimal GB (development version). Can exceed the default model ceiling. The cache shrinks when other apps need memory and can grow back when it is available, within the saved limit and the Mac's supported budget. Cannot be combined with the fixed memory/cache options below. |
| `--memory-gb <gb>` | Total process memory budget, in decimal GB. The cache gets what remains after runtime, context, workspace and a nominal 1 GB margin. Near the minimum cache size, the plan can use part of that margin; `doctor` shows the actual planned headroom. Minimum 8.1 for the 32,768-token window; larger windows raise the minimum. This is a planning allowance, not an instruction to fill RAM. Conversation state and workspace use memory as needed, so measured usage can be lower. Auto picks the context window inside this target and preserves cache whose loss it cannot price; `--max-context N` chooses the context tradeoff explicitly. |
| `--experts-per-layer <n>` | Expert cache size directly, 1…512. Each of the 48 layers has 512 experts of 2.76 MB and the cache holds `n × 48` of them, so the pool is `n × 0.133 GB`: 30/layer is 4 GB, 181 is 24 GB, 226 is 30 GB. The pool is one global cache; hot layers borrow slots from cold ones. |
| `--pool-gb <gb>` | Raw expert-pool size (1 GB is about 7.5 experts per layer). |
| `--vision auto\|on\|off` | Accept images (default `auto`). `auto` loads the image encoder on first use; `on` also requires the checkpoint to contain vision weights; `off` rejects images. |
| `--mtp auto\|on\|off` | Speculative decode (default `auto`); see [Speculative decode](#speculative-decode). |
| `--max-ram-percent <p>` | Auto only: the largest share of RAM auto may target (default 70). Alone it cannot raise the 33 GB base ceiling plus enabled draft/context charges. With `--memory-limit-gb`, it can further lower that ceiling; without this percentage option the adaptive limit is bounded by hardware and availability. Ignored when a fixed size is given. |

Precedence when several are given: `--experts-per-layer` beats `--pool-gb`,
which beats `--memory-gb`. An explicit size keeps its expert-pool policy. Physical headroom is still
checked before model loading and request growth. Preview it with `doctor`;
an unavailable window is reported separately from a request that may take
too long to prefill.

`--memory-limit-gb` keeps resizing enabled unless you also pass `--no-elastic`.
The requested limit stays saved even when the current target is lower. `doctor`
and model startup use the same budget feasibility check, including at the
default context window. Metal's recommendation is read from the system;
Slotstream keeps additional headroom and checks live reclaimable memory too.


A larger context reserves allocated cache capacity, retained conversations,
resident components and transient work before assigning the expert pool.
`doctor --json` includes the byte ledger and a discrete feasibility result;
a smaller history does not turn unused long-context reservation into free RAM.
Unknown prefill estimates appear as JSON `null` and remain deadline-bound.
Neither a fixed pool nor `--no-elastic` disables request memory checks.

The target is a budget, so current usage can be lower while reserved context
and temporary workspace are unused. `doctor` previews a new plan; it does not
change an already running server. `/api/ps` includes that server's actual
`details.memory_plan`, including its sizing source, target and expert pool.
For an adaptive limit, `memory_limit_gb` is the saved ceiling and `target_gb`
is the current budget, which can be smaller.

For `run`, the default memory summary separates the **lifetime footprint peak**
from **current footprint**. The lifetime value includes loading and all earlier
requests in that process, including GPU memory already freed. With
`--sample-footprint`, the summary instead labels the sampled generation peak.
Saved statistics retain `peakMemoryGB` as the maximum of lifetime footprint,
lifetime RSS and current footprint; `lifetimePhysicalFootprintPeakBytes` exposes
the native footprint peak separately. Sampling remains useful for attributing
memory to a particular request and can miss allocations between samples.

## Optimization defaults

The CLI resolves the selected optimization family automatically: compact
runtime state and n-gram rows, bounded prompt-read grouping, committed prompt
checkpoints, bounded output buffering and memory-governor response. Long
prompt grouping is admitted only when its additional workspace fits; ordinary
chronological passes remain the fallback. Explicit prefill and optimization
controls retain their precedence and validation. With the draft head, the
[decode lookahead](#decode-lookahead) is on by default too, and so is the
[split verify attention](#speculative-decode) from 6,144 tokens of context.

Prompt checkpoints help only when the token and image history actually
matches. Use `--no-prefix-cache` for comparisons that require fresh prompt
computation. Query tiling bounds vision attention workspace; it does not grant
extra permanent expert-cache capacity. The specialized fused rotation keeps
its qualified platform and shape checks, with the original rotation elsewhere.

The `SLOTSTREAM_OPT_` switches remain available for reference comparisons and
qualification. They include experimental paths that were rejected or remain
conditional. Enabling every switch is not the selected configuration.
[Integrated measurements](../MEASUREMENTS.md#final-integrated-optimization-results)
report the tested workloads and limits; [the unified plan](../PLAN.md) retains
the disposition of each candidate.

The automatic ceiling is a conservative default based on development-Mac
measurements, separate from RAM-share and physical-memory bounds. The
[M5 Max community sweep](HARDWARE.md#does-more-memory-help) demonstrates gains
from larger manual targets; auto is not calibrated to every hardware profile.
See
[why auto retains a ceiling](ENGINEERING.md#memory) and the
[operating-policy contract](../db/records/design/measured-operating-policies.md).

## Environment variables

| Variable | Read by | Meaning |
|---|---|---|
| `SLOTSTREAM_WEIGHTS_SOURCES` | `pull` | Comma-separated raw-file bases tried in order. Selects raw transport in automatic mode; every file must match the original pins. |
| `SLOTSTREAM_COMPRESSED_SOURCES` | `pull` | Comma-separated Slotpack package bases; every object must match the embedded package. |
| `SLOTSTREAM_PULL_TRANSPORT` | `pull` | `automatic`, `compressed`, or `raw`; an explicit non-automatic CLI flag takes precedence. |
| `SLOTSTREAM_PULL_CONNECTIONS` | `pull` | Fixes parallel connections, capped at 32; the CLI flag takes precedence. |
| `SLOTSTREAM_PREFIX_CACHE` | engine | `0` disables conversation prefix reuse, like `--no-prefix-cache`. |
| `SLOTSTREAM_PREFILL_CHUNK` | engine | Override the largest prefill pass in tokens instead of taking it from the memory plan; the schedule still shrinks it as the context grows. Measurement work only. |
| `SLOTSTREAM_IO_QUEUE_DEPTH` | engine | Expert read parallelism, 1…128 (default 12). The development-Mac sweep found little benefit from 12 to 32; other SSDs and workloads can differ. |
| `SLOTSTREAM_EXPERT_LOAD_BATCH` | engine | Expert records staged at once during prefill, 1…512 (default 32): the sweep's group size on a pass of 256 tokens or more, the pool's load slice below that. Bounds peak memory on long prompts. |
| `SLOTSTREAM_SWEEP` | engine | `0` selects the older pool path instead of the prefill sweep when ordinary prefill is used. A/B work only; slower in the recorded development-Mac comparisons. Other optimization controls can select a different qualified path. |
| `SLOTSTREAM_SWEEP_ADMIT` | engine | `0` stops the last pass of a prompt from admitting the prompt's hottest experts into the pool, so decode starts cold. A/B work only. |
| `SLOTSTREAM_SWEEP_TRACE` | engine | `1` prints, after each prefill, where the sweep's time went: reads, waiting for the GPU, sorting rows, copies out of the pool, and MLX's peak and cache. |
| `SLOTSTREAM_PREFILL_CACHE_MB` | engine | MLX buffer-cache cap while a prompt is read. The plan sets 512 at targets of 12 GB and under (the sweep's varying array sizes otherwise fill the 2 GB cache, 1.7 GB of peak at the floor) and no cap above, where it costs ~6% of prefill; this forces a value at any target. |
| `SLOTSTREAM_OPT_EXPERT_PREFETCH` | engine | `0` turns off the decode lookahead and its 373 MiB charge (409 MiB with the checkpoint's forecast correction file). `1` selects an experimental prefetch configuration from the `SLOTSTREAM_EXPERT_PREFETCH_*` tuning variables instead; for comparisons only. |
| `SLOTSTREAM_OPT_ROUTER_WEIGHTS` | engine | `0` or `1` overrides the FP32 router weight cache that the decode lookahead turns on. |
| `SLOTSTREAM_OPT_VERIFY_SPLIT` | engine | `0` runs the speculative verify pass through the dense attention kernel at every context, the previous behavior. The default splits it into two-row vector-kernel calls from 6,144 tokens of context. |
| `SLOTSTREAM_OPT_VERIFY_SPLIT_CONTEXT` | engine | Context, in tokens, from which the verify pass splits (default 6144, the measured crossover on the development Mac); `0` splits at every context. |
| `SLOTSTREAM_OPT_ROW_INVARIANT` | engine | `1` selects the exact mode: the model's small dense matmuls run through one kernel at every row count, and the split verify attention makes one call per row. With `SLOTSTREAM_OPT_VERIFY_SPLIT_CONTEXT=0`, speculative and plain decode give identical output for draft depths up to 4. It changes plain decode's rounding, so it is off by default. |
| `SLOTSTREAM_DECODE_BARRIER_LAYERS` | engine | Layers between GPU drains, 1…48. The decode lookahead uses 4; `1` drains after every layer. A pass that could not keep that many layers of experts pinned drains after every layer anyway. |
| `SLOTSTREAM_EXPERT_PREFETCH_TAP` | engine | `boundary` keeps the 0.2.16 forecast (the layer-boundary router forecast at stride 2) when the correction file is present, charging 373 MiB instead of 409; the configuration 0.2.19 was benchmarked against. Other values belong to the experimental configuration and are for comparisons only. |
| `SLOTSTREAM_ROOT_DIR` | installer | Install somewhere other than `~/.slotstream`. |
| `SLOTSTREAM_RELEASE_BASE` | installer | Fetch the release from another base URL (CI uses it to test unpublished builds). |

## Checks and diagnostics

These checks help diagnose an installation. The first group needs no weights;
the second loads the model. Use small explicit memory targets for model
checks (`--memory-gb 8.1` to `10`) and stop other model processes first.
See [Testing](TESTING.md) for the full suites.

Fixed-profile diagnostics reject `--memory-limit-gb` because they use their
own bounded allocation. `prefix-exact-check` accepts it with `--plan`;
`elastic-drill` can exercise it within the diagnostic's separate memory ceiling.

**Weights-free**

| Command | Proves |
|---|---|
| `runtime-check` | Process RSS accounting and the prefix cache's four-conversation bound. |
| `governor-check` | The elastic resize policy across pressure, availability, and cooldowns. |
| `sampler-golden` | Sampling from reproducible synthetic logits, compared against `Tools/sampler_ref.py`. Flags: `--vocab`, `--draws`, `--seed`, `--logit-seed`, `--temperature`, `--top-p`, `--top-k`, `--min-p`, `--presence-penalty`, `--accumulate`. |
| `pull-check` | Same-size corruption detection and HTTP range validation in the downloader. |
| `prefill-schedule` | The prefill passes a prompt runs at a given pass size and the wait they imply; the same wait arithmetic `doctor` and the 400 message use. JSON includes actual canonical pass sizes, physical query rows and key extents, including numerical padding. `--chunk` (4096), `--tokens` (32768), `--from` (0), `--json`. |

**Load the model**

| Command | Proves |
|---|---|
| `elastic-check` | Greedy output is byte-identical across a live pool grow and shrink. `--max-tokens` (24), `--big-slots` (960; lower it on small machines). |
| `elastic-drill` | Drives the live governor through shrink, cooldown, recovery and exact output. `--slots` (4000), `--max-memory-gb` (10), `--quick` skips recovery. Use `--memory-limit-gb 10 --max-memory-gb 10 --mtp off` for small-cache pressure recovery, or `--slots 1000 --max-memory-gb 13 --memory-limit-gb 13 --mtp off` for the full availability drill. Both require the target plus 3 GB physically reclaimable and report sampled memory and swap. An insufficient ceiling refuses before model allocation. |
| `prefix-check` | Conversation prefix reuse is equivalent, bounded, and deterministic. `--slots` (640), `--max-tokens` (24). |
| `prefix-exact-check` | A continued conversation computes what a cold one does: same tokens and bit-identical prompt logits whether a turn resumed a retained state or read its whole prompt, with reuse still happening, an identical prompt reusing its complete state, an edited history rebuilding, and a second conversation resuming a shared prefix. `--slots` (640), `--max-tokens` (24), `--plan` to run a real memory plan so `--memory-gb` and `--mtp` apply. |
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
  cache reaches 76 experts per layer after the head's 1.6 GB and context
  charges, before the separate lookahead reservation. A 21 GB target qualifies
  at the default context; actual availability and the selected window can
  keep the head off on a larger Mac. Before 0.2.16 the floor
  was 120; two drafts later measured 31.7% faster than plain decode on the same
  memory at 76 per layer
  ([decision](../db/records/decisions/draft-head-auto-floor-76-per-layer.md)).
  The floor is separate from draft depth. The historical one-draft measurement
  at the former 28 GB memory target was ×1.24 decode; MEASUREMENTS.md M9
  preserves its configuration, ladder and ceiling.
- `mtp-parity`, `mtp-accept`, `mtp-check`, `mtp-rowcheck`: the draft head's
  parity with the Python reference, its measured accept rate (`--depth`,
  default 4), the speculative-decode gates, and the row-equality gate: in the
  exact mode, every row of a two-row and a three-row verify pass must equal
  the one-row pass at its position in the same mode bit for bit, and the
  state a three-row pass leaves must equal the state three one-row passes
  leave, on a prompt whose positions cross 1,024 keys (`--cross`), where the
  attention kernel changes, and one above the indexer budget (the stock
  deviation is reported alongside).
- The verify pass checks the drafts in one pass of draft depth plus one rows.
  The backend's vector attention kernel takes at most two such rows at this
  model's head layout, so a three-row pass used to fall to the dense kernel,
  which reads every cached key and whose cost grows with the context. From
  6,144 tokens of context the pass now runs two rows at a time through the
  vector kernel, the kernel plain decode's attention uses. The gain grows with
  the context. On a quiet machine at a 22 GB target, speculative decode
  measured 11.82 against 11.67 tok/s (x1.013) with a 16,356-token prompt,
  x1.085 on a second 16,356-token prompt and x1.29 with a 32,740-token prompt;
  the fetch-free pass is 32% cheaper at 32,740 tokens and 45% at 65,508. The
  split changes which drafts are accepted, so the 16k gain follows the prompt,
  1% and 8% in the two measured, while at 32k both arms accept alike.
  `SLOTSTREAM_OPT_VERIFY_SPLIT=0` restores the dense pass. Below the threshold
  the dense kernel is faster
  ([measurement](../db/records/measurements/speculative-verify-pass-split-attention-2026-09-17.md)).
- Exact mode: a multi-row pass rounds a little differently from one-row
  passes, so speculative and plain decode can pick different tokens at near
  ties. `SLOTSTREAM_OPT_ROW_INVARIANT=1` with
  `SLOTSTREAM_OPT_VERIFY_SPLIT_CONTEXT=0` removes the difference for draft
  depths up to 4. The small dense matmuls use one kernel at every row count,
  and each verify row attends in its own call over the keys plain decode
  reads, so the backend picks the same attention kernel. Every row of a verify
  pass then equals plain decode in the same mode, and a speculative run's
  output equals a plain run's. The mode changes plain decode's rounding too,
  and it costs 4 to 6% of plain decode's speed, so it is off by default;
  `mtp-rowcheck` gates it.
- `SLOTSTREAM_DRAFT_DEPTH`: draft chain depth, 1–16 (default 2).
  Two drafts are the adopted operating choice for mixed workloads. The recent
  automatic-memory comparison found two and three effectively tied overall;
  this is not a universal performance optimum. Rejected drafts roll back to
  recorded state. Explicit valid overrides still work; invalid values fall
  back to the default. See the [decision and evidence](../db/records/decisions/draft-depth-defaults-to-two.md).
  This changes draft depth when MTP is enabled, not the automatic activation
  floor or the RAM-share default.

### Decode lookahead

From 0.2.16 the decode lookahead runs by default with the draft head when
the cache reaches the same 76-per-layer floor before the lookahead's own
reservation. The final printed cache can therefore be smaller. As each layer's
routing comes back, the engine reads the model's state after the previous layer's
attention step, applies the next layer's router to it, corrects the result with a
small learned table shipped for the checkpoint
(`lookahead/tap-correction-attention-rank128-v1.safetensors`, 37.5 MB, which
`pull` fetches next to the weights), and reads the experts it picks from the SSD
straight into cache slots before that layer asks for them. It also keeps FP32
copies of the router weights and drains the GPU every four layers instead of
every layer. Output is unchanged.

The memory plan charges 373 MiB for it before sizing the expert cache, 409 MiB
when the correction file is present, and `doctor` prints `lookahead: on` with the
charge. On twelve held-out prompts at a 20 GB target with two drafts, the 0.2.16
lookahead decoded 1.11x faster than without it; the corrected forecast of 0.2.19
decoded 1.10x faster than the 0.2.18 forecast on eight held-out prompts at a 22 GB target,
14.38 to 15.86 tok/s (see the [expert lookahead guide](EXPERT-LOOKAHEAD.md)). A head
forced onto a smaller cache runs without it. `SLOTSTREAM_OPT_EXPERT_PREFETCH=0`
turns it off, `SLOTSTREAM_EXPERT_PREFETCH_TAP=boundary` keeps the 0.2.16 forecast
with the file present, and the two variables above override its router cache and
drain period. The
[decision](../db/records/decisions/decode-lookahead-default-with-the-draft-head.md)
and the [corrected forecast decision](../db/records/decisions/corrected-decode-forecast-default-with-the-sidecar.md)
record the evidence and limits.
