# slotstream

Run Qwen3.8-Flash-Next locally on a Mac that can't hold it. The model is
104 GB at 4-bit (125B mixture-of-experts plus a 51B n-gram store). slotstream
streams it from SSD, so it runs in whatever memory you give it, down to about
7 GB. MLX and Swift, one binary, Ollama-compatible API.

Two things make this model a good fit for streaming. Almost all of its bytes
sit in two places: 68 GB of routed experts (512 per layer, 10 active per token)
and a 32 GB n-gram embedding table whose rows are selected by token ids alone,
which means they can be prefetched before the forward pass needs them. The
dense trunk is 3.8 GB and stays resident. Experts are fetched with `pread` into
a fixed pool of cache slots shared by all 48 layers; hot layers take slots from
cold ones. Cache size changes speed, never output: greedy decoding is
byte-identical between a 4 GB cache and a 24 GB cache, and that equivalence is
a standing test.

Measured on an M5 Pro with 48 GB and a 2 TB SSD (method and full data in
[MEASUREMENTS.md](MEASUREMENTS.md)):

| what | measured |
|---|---|
| Decode, warm cache | 20.0 tok/s |
| Decode, cold cache | 7.8 to 10.4 tok/s |
| Cold start to first token | about 12 s |
| Peak memory with a 24 GB cache | 27.3 GB |
| Smallest run so far | 7.3 GB peak, 5.6 tok/s |

## What Mac do I need

Any Apple Silicon Mac with 16 GB of memory, and about 110 GB of free disk for
the weights. Disk is the gate that bites first: a 256 GB Mac rarely has that
much free, so 512 GB or larger is the realistic minimum. What you get scales
with memory:

| memory | what to expect |
|---|---|
| 8 GB | too small: the 6.2 GB minimum doesn't fit alongside macOS, and `doctor` says so instead of letting it thrash |
| 16 GB | runs; about 4 to 7 tok/s depending on what else is open |
| 24 GB | the comfortable minimum alongside normal use; roughly 9 to 13 tok/s |
| 32 GB | roughly 12 to 17 tok/s |
| 48 GB and up | 20 tok/s, measured; past a 24 GB cache decode is compute-bound, so more memory buys headroom for the rest of your apps, not speed |

Only the 48 GB row is measured on real hardware. The others are estimates
from its anchors and haven't run on physically smaller Macs yet; smaller
Macs also have slower SSDs, which mostly slows the cold cache, not warm
decode. `slotstream doctor` shows what auto would pick on your machine
before you download anything, and the `--sim-ram/--sim-available` flags
preview any other machine.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/carloslfu/slotstream/main/install.sh | sh
```

One line: it installs the prebuilt binary into `~/.slotstream/bin`, puts it on
your PATH, and offers to start the server, which asks before downloading the
model (104 GB, resumable). The script is [install.sh](install.sh) in this
repo, and the release tarball is sha256-checked before anything runs.
Releases are built by CI from the tagged commit with signed provenance; each
release notes its commit and build log, and
`gh attestation verify slotstream-arm64.tar.gz --repo carloslfu/slotstream`
checks an asset independently. Re-run the same line to upgrade; uninstall
with `rm -rf ~/.slotstream` plus the PATH line it added, if any.

Needs an Apple Silicon Mac, macOS 14 or newer, and about 110 GB of free disk.
To build from source instead:

```bash
git clone https://github.com/carloslfu/slotstream && cd slotstream
make build      # needs the Swift toolchain; Command Line Tools are enough
.build/release/slotstream serve
```

The weights are the pinned pipenetwork MLX conversion, downloaded from a
byte-identical mirror under the maintainer's account with the original as
fallback (same sha256s either way, and every file is checked against hashes
compiled into the binary, so integrity never depends on which source
answered). `SLOTSTREAM_WEIGHTS_SOURCES` overrides the list with your own.
Weights are stored in
`~/.slotstream/models/` (a dev checkout's `models/` directory is used first if
present). `serve` and `run` offer the download when weights are missing or
partial (an interrupted download resumes from where it stopped);
`slotstream pull` runs it directly. Either way, the download checks disk
space before moving bytes and refuses any file whose sha256 doesn't match the
pinned revision, so a corrupted download can never become garbage tokens.
`pull --verify` re-hashes an existing copy, about 14 s for all of it.

The download runs 8 connections at once over 64 MB chunks drawn from one
queue, so every connection stays busy across file boundaries and to the last
byte. That measured 36 to 55 MB/s here against 28 to 40 on a
single connection, which is also what `hf_xet`, Hugging Face's own fastest
client, gets. The ceiling is Hugging Face's, not the link's: the same link
sustains 134 MB/s to a plain datacenter host, and Cloudflare R2 was measured
and found no faster (42 to 51), so the weights stay where they are. That is
about 35 to 45 minutes for the 103.8 GB, and your own link may be slower.
`--connections N` (or `SLOTSTREAM_PULL_CONNECTIONS`) changes it. Interrupting
is safe at any point: each file keeps a small chunk map beside it, so a
resumed pull refetches at most the last few seconds of work rather than
starting the file over.

## The server

`serve` speaks the Ollama API (`/api/chat`, `/api/generate`, `/api/tags`,
`/api/show`, `/api/ps`, `/api/version`) plus `/v1/chat/completions` and
`/v1/models`, with NDJSON and SSE streaming and CORS, so existing Ollama and
OpenAI clients and browser GUIs work unchanged. Sampling options
(`temperature`, `top_p`, `top_k`, `min_p`, `presence_penalty`, `seed`,
`num_predict`/`max_tokens`, `stop`) are honored on both surfaces, and message
content may be a string or OpenAI's array-of-parts form. `/api/show` reports
the live memory plan. Run one instance per machine; two model processes will
fight over the same memory.

Prompts are capped at 32,768 tokens (`--max-context`). The cap exists because
a long prompt is not free in either axis the rest of this page promises: KV
plus indexer state costs about 27 KiB per token *on top of* the memory plan,
and prefill is chunked rather than a dense sweep, so it runs at about 92
tokens a second. An 8,000-token prompt takes about 90 seconds before the
first token appears.
Going past the cap is refused with a 400 rather than silently stalling.

A follow-up turn only prefills what is new. The state that produced one reply
is kept and reused when the next prompt starts with exactly the tokens it
consumed, which is the ordinary shape of a chat or a tool loop. Measured over
eight turns growing to a 1,237-token prompt, time to first token stayed **flat
at 6.0 s** instead of climbing to **25.8 s**. Four conversations are held at
once, not one, because clients interleave their own requests — Open WebUI asks
for a chat title straight after every reply, and a single-slot cache never
survived it. Anything else — an edited earlier message, a different
conversation — rebuilds, because the recurrent state can be continued but never
rewound. Reuse is not bit-identical to a cold rebuild and
cannot be: the same tokens in a different batching sum in a different order.
Measured, it perturbs the logits *less* than re-chunking a plain prefill already
does, so a reply may occasionally differ where two tokens were nearly tied.
`--no-prefix-cache` pins the old behaviour when you want reproducibility.

Out-of-range sampling values are clamped rather than trusted, malformed or
oversized requests are rejected, and a client that disappears mid-stream is
just a closed socket. `Tools/api_robustness.sh` is the standing gate for all
of that: every case in it either crashed the server or silently corrupted
output before 0.1.5.

## Memory

With no flags, slotstream sizes itself. At startup it reads total RAM, the
Metal working-set limit, and how much memory is reclaimable right now, then
announces what it chose:

```
slotstream memory plan (auto)
  device: 52 GB RAM (36.9 GB reclaimable now), 40.2 GB Metal working set
  target: 34.4 GB total for this process   (override: --memory-gb N | --experts-per-layer N)
  cache:  ~226 of 512 experts per layer  (10832 global slots = 29.9 GB pool)
  expect: ~33.8 GB peak, ~20 tok/s warm decode (est. from M5 Pro anchors)
```

The prefill pass is sized from the same budget. It is expert-stream-bound —
one pass touches nearly every expert of every layer, so the whole set is
re-read about once per pass — which makes a bigger pass strictly faster and
strictly more memory-hungry. The plan takes at most a quarter of the pool
budget for it, so an 8 GB target prefills 512 tokens at a time and a 36 GB one
does 4096. That share was a fifth until the pass cost was measured properly: it
had been charged at about twice what it uses, which kept the planner one size
below the best one available. On an 8,016-token prompt at a 16 GB target,
fixing that moved prefill from **93.7 to 112.9 tok/s** while *lowering* peak
memory.

The target is 70% of RAM, kept 2 GB under the Metal working-set limit. If other
apps hold most of the machine, auto sizes down to what can be taken without
swapping anyone, and prints a note saying so. In one live test, a 21.5 GB
memory hog pushed auto from 36 GB down to 10.7 GB; the run completed normally
at a 9.4 GB peak with no thrash.

An auto-sized `serve` also stays elastic while running: it re-checks
availability every 15 s and resizes the cache between requests, shrinking when
other apps need the memory and growing back, contents intact, after a minute of
calm. OS memory-pressure events act as a backstop. Every resize is one stderr
line and shows up in `/api/show`. Output stays byte-identical across live
resizes; `slotstream elastic-check` proves that and runs in the test battery.

Explicit sizes are never adjusted. Three flags override auto, first one wins:

- `--memory-gb G`: total memory for the process. The cache gets what remains
  after the 3.9 GB fixed footprint (resident weights plus the n-gram row
  cache) and a 0.5 GB margin. Minimum 6.2. Measured: `--memory-gb 8` ran at a
  7.0 GB actual peak with byte-identical output.
- `--experts-per-layer N`: cache size in experts per layer, of the model's 512.
  Each costs 0.133 GB. Measured points: 30 runs in 7.3 GB total at 5.6 tok/s,
  181 runs in 27.3 GB at 20.0 tok/s, 512 is fully resident.
- `--pool-gb G`: raw pool size. 1 GB is about 7.5 experts per layer.

The floor is 13 experts per layer (640 global slots); below that a long
prefill could pin every slot. `slotstream doctor` prints the plan any flags would produce here, plus a
table of target sizes against expected speed, and takes
`--sim-ram/--sim-working-set/--sim-available` to preview any other machine
(`doctor --sim-ram 17.2 --sim-available 6` is a busy 16 GB Mac). The planner's
choices across seven such setups are pinned in the test battery.

## Why slots instead of mmap

MLX cannot materialize part of a memory-mapped tensor. A top-10 expert gather
evaluates all 512 experts of that layer, and a 16-row n-gram lookup evaluates
the whole 250 MB shard, so any mmap-based path loads about 100 GB and dies.
The stock `mlx_lm.load()` route took this 48 GB machine into 48 GB of swap
without producing a token. A preallocated pool filled by explicit reads is the
only bounded construction under MLX. The measurements behind this are in
MEASUREMENTS.md, sections M0.7 and M0.8.

## Testing

`Tools/verify.sh` is the acceptance battery: weight provenance (every file
re-hashed against the pinned upstream), goldens against the Python reference,
planner behavior across simulated machines, byte-equality across cache sizes
and across live resizes, prefix-reuse equivalence against a prefill-rechunk
control, the `--memory-gb` promise, and the serving-robustness suite. Currently 80 checks, all passing. The heavy gates size themselves to
the machine's free memory, so the suite also runs on small or busy machines.

`Tools/e2e_release.sh` is the separate post-release gate: it runs 31 checks
against the *installed* binary from `curl | sh` rather than the dev build —
install integrity, both API surfaces, short/long/unicode/streamed generation,
hostile inputs, live prefix reuse, concurrency, and a client disappearing
mid-stream.

A behavioural probe (`Tools/quality_probe.sh`, 15 checkable items) guards
against gross quantization damage; it is not a comparison against the FP8
reference, which needs an inference credential this project does not have.

Three parts run standalone and need no weights, so CI runs them on every
release build: `Tools/planner_gates.sh` (memory planning, and every way a
`--model` directory can be wrong), `Tools/sampler_gates.sh` (the sampler
compared token-for-token against the numpy reference in `Tools/sampler_ref.py`,
plus the elastic governor's decision policy driven through every branch), and
`Tools/api_robustness.sh`, which starts a server and replays the inputs that
used to crash it or corrupt its output. Everything else needs the downloaded weights,
and two gates (n-gram row ids and layer parity) additionally need
`bench/parity31/`, which `Tools/parity_ref.py` generates locally under
mlx 0.31.1 and which is not committed.

Parity is checked against Python mlx 0.31.1, the version mlx-swift vendors
(kernel changes between MLX versions are larger than porting error, so the
reference must be version-matched). Layers 0 and 1, which cover every
structural path (streamed MoE, gated DeltaNet, PLE injection,
hyper-connections), are bit-exact; deeper layers sit within a few bf16 ulps.

## Status

Working and measured on one machine. Known gaps: prefill is still a chunked
sweep rather than a dense one. Sizing the pass from the memory plan, then
recalibrating what a pass actually costs, took it from 40 to ~113 tok/s at 8k,
and long prompts remain the slow axis. Cross-layer read-ahead was built and
measured *slower* — the reads already saturate, so a background reader only
steals CPU from the thread feeding the GPU — and was removed; the remaining gap
is compute, which needs a grouped-GEMM Metal kernel and therefore Xcode on the
build machine. The small configurations were emulated here
rather than run on real 16 GB hardware. [PLAN.md](PLAN.md) has the design, the
byte math, and the milestone tracker.

## License

MIT. `Sources/SlotstreamCore/Vendored/GatedDelta.swift` is ported from
[mlx-swift-lm](https://github.com/ml-explore/mlx-swift-lm) (MIT), and
`Tools/reference/` vendors the community `qwen4_exp.py` used as the test
oracle. Weights are pulled from
[pipenetwork/Qwen3.8-Flash-Next-MLX-4bit](https://huggingface.co/pipenetwork/Qwen3.8-Flash-Next-MLX-4bit)
and remain under the Qwen community license.
