# slotstream

Run **Qwen3.8-Flash-Next** on a Mac that cannot hold it. The model is 104 GB at
4-bit; slotstream streams it from SSD and runs it in whatever memory you give
it, down to an 8.1 GB planned floor. One Swift binary with the commonly used
Ollama and OpenAI chat/generate endpoints.

| on a 48 GB Mac | |
|---|---|
| Warm decode | ~12 tok/s |
| Cold start to first token | ~3 s |
| Peak memory | 32 GB (auto-sized; you can cap it) |
| Weights on disk | 104 GB |

## Will it run on my Mac

**Disk is the gate that bites first.** You need ~110 GB free, so a 512 GB Mac
is the realistic minimum however much memory it has. The weights are a one-time
104 GB download: well under an hour on a fast connection, several hours on a
slow one (table [below](#the-104-gb-download)).

| memory | expect |
|---|---|
| 8 GB | below the 8.1 GB floor; `doctor` warns that it will page |
| 16 GB | ~5 tok/s estimated |
| 24 GB | ~8 tok/s estimated |
| 32 GB | ~10 tok/s estimated |
| 48 GB and up | ~12 tok/s — and auto stops at 33 GB here, so the rest of the machine stays yours |

Only the 48 GB row is measured on real hardware; the rest come from the same
measured curve, and smaller Macs also have slower SSDs. Run
`slotstream doctor` to see what your machine would get, and whether you have
the disk for the weights, **before** downloading anything.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/carloslfu/slotstream/main/install.sh | sh
```

Installs a prebuilt binary to `~/.slotstream/bin` and puts it on your PATH.
Needs Apple Silicon and macOS 14+. Re-run the same line to upgrade; uninstall
with `rm -rf ~/.slotstream`.

Releases are built by CI from the tagged commit with signed provenance, so you
can check an asset yourself rather than trusting the download:

```bash
gh attestation verify slotstream-arm64.tar.gz --repo carloslfu/slotstream
```

Or build it yourself — Command Line Tools are enough, no Xcode needed:

```bash
git clone https://github.com/carloslfu/slotstream && cd slotstream
make build
```

### The 104 GB download

The binary is small; the weights are not. 103.8 GB across 24 files, one time.
`serve` and `run` offer the download on first run, and `slotstream pull` does
it on its own:

```bash
slotstream serve
```

Either way it prints the size, the destination and your free disk and waits for
a yes before transferring anything, and it refuses outright if the disk cannot
hold it.

**Hugging Face is the bottleneck, not your link.** Past four connections it
plateaus: 4, 8, 16 and 32 all landed in the same 36 to 57 MB/s band, and so did
`hf_xet`, Hugging Face's own fastest client, while the same link did 134 MB/s
to an ordinary host. So past roughly 400 Mbps, more bandwidth
buys nothing:

| your connection | wait |
|---|---|
| 400 Mbps or faster | 30–50 min — Hugging Face's day, not your link |
| 200 Mbps | ~1 h 10 |
| 100 Mbps | ~2 h 20 |
| 50 Mbps | ~4 h 40 |
| 25 Mbps | ~9 h |

A real install here took 35 min; the top row is wide because Hugging Face's own
throughput moved between sessions. The rows below it are arithmetic over
103.8 GB at your full rated speed, so treat them as best cases.

Interrupting is safe: it resumes at the exact byte it stopped on, and all
24 files are checked against sha256 hashes compiled into the binary, so a
truncated, same-size, or corrupted download cannot reach the engine.
`pull --verify` re-hashes an existing copy in under 10 s —
7.7 s here, hashed in parallel.

## Use it

`serve` listens on port 11434 and implements the chat/generate subset used by
Ollama clients and OpenAI SDKs:

```bash
curl localhost:11434/api/chat -d '{
  "model": "qwen3.8-flash-next:4bit",
  "messages": [{"role": "user", "content": "hello"}]
}'
```

```bash
OLLAMA_HOST=http://localhost:11434 ollama run qwen3.8-flash-next:4bit
```

Open WebUI, the Ollama CLI, and the OpenAI SDKs are tested for this subset.
Streaming, CORS, and the usual sampling options (`temperature`, `top_p`,
`top_k`, `min_p`, `presence_penalty`, `seed`, `num_predict`, `stop`) are all
supported. Unsupported semantics such as tools, images, JSON-schema output,
logprobs, and alternate model names return a clear 400 instead of being
silently ignored.

Follow-up turns in a conversation only prefill what is new, so time to first
token stays flat as a chat grows — measured over eight turns, 6.0 s instead of
climbing to 25.8 s. One consequence worth knowing: reusing that state is not
bit-identical to recomputing it, so a reply can occasionally differ where two
tokens were nearly tied. `--no-prefix-cache` turns it off if you need exact
reproducibility.

Prompt plus completion is capped at 32,768 tokens (`--max-context`). Long prompts are the
slow axis: prefill runs at roughly 50 tok/s on a 16 GB Mac and 125 on a 48 GB
one, so an 8,000-token prompt waits somewhere between about a minute and about
three before its first token. A per-user lock enforces one model process at a time.

## Memory

With no flags slotstream sizes itself to your machine and tells you what it
chose. This is a 48 GB Mac — it reads 52 GB because everything here counts in
decimal GB, while Apple markets the same memory as 48:

```
slotstream memory plan (auto)
  device: 52 GB RAM (36.0 GB reclaimable now), 40.2 GB Metal working set
  target: 33.0 GB total for this process   (override: --memory-gb N | --max-ram-percent P)
  cache:  ~152 of 512 experts per layer  (7280 global slots = 20.1 GB pool)
  expect: ~32.0 GB peak, ~12 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 4096 tokens per pass (~125 tok/s here; costs ~5.3 GB of the target)
  reuse:  up to 32768 tokens across 4 conversations (~1.2 GB), so a follow-up turn re-prefills only what is new
```

It takes the lowest of three limits: **33 GB**, **70% of RAM**, and the Metal
working-set limit, and it sizes down further when other apps are actually
holding memory rather than swapping them out.

33 GB is the interesting one. It is not politeness, it is the knee: the
smallest target where the expert cache clears the decode plateau *and* the
budget still affords the fast 4,096-token prefill pass. Swept a GB at a time,
nothing between 34 and 84 GB improves either number. So a 64 GB or 128 GB Mac
asks for the same 33 GB a 48 GB Mac does — the extra would buy nothing, and
`doctor` says so rather than leaving you to wonder. It
also **stays elastic while running**: it re-checks every 15 s and resizes the
cache between requests, shrinking under pressure and growing back once things
are calm. Output is byte-identical across resizes.

`--max-ram-percent P` moves the 70% share without you having to work out the
GB. The other two limits still apply, so it can lower the target but not raise
it past the knee.

Three flags replace auto outright, first one wins, and any of them will go past
33 GB if you want to try it — full expert residency (all 512 per layer, so no
routed-expert SSD reads; n-gram rows still stream) needs about 88 GB and has
never been measured:

- `--memory-gb G` — total memory for the process. Minimum 8.1.
- `--experts-per-layer N` — cache size directly, of the model's 512. Each costs
  0.133 GB.
- `--pool-gb G` — raw pool size.

`slotstream doctor` prints the plan any of these would produce, `--sim-ram` /
`--sim-available` preview a different machine entirely, and `--json` emits the
plan for scripts with the estimates unrounded.

## How it works

Almost all of the model's bytes sit in two places: 68 GB of routed experts
(512 per layer, 10 active per token) and a 32 GB n-gram table. The dense trunk
is only 3.8 GB and stays resident. Experts are read with `pread` into a fixed
pool of cache slots shared by all 48 layers, so hot layers borrow slots from
cold ones.

**Cache size changes speed, never output.** Greedy decoding is byte-identical
between a 4 GB cache and a 24 GB one, and that equivalence is a standing test.

Why not just mmap the file? MLX cannot materialize part of a memory-mapped
tensor: a top-10 expert gather evaluates all 512 experts of that layer, and a
16-row n-gram lookup evaluates the whole 250 MB shard, so an mmap path loads
~100 GB and dies. The stock `mlx_lm.load()` route took this 48 GB machine into
48 GB of swap without producing a token.

## Status and limits

Working, and measured on **one machine** — an M5 Pro with 48 GB. The smaller
tiers are derived from its curve, not run on real 16 GB hardware.

Known gaps:

- **Long prompts are slow to start.** Everything in the prompt is processed
  before the first token appears. Prefill is ~10x faster per token than
  generation (~113 tok/s against ~11), but you pay it for every prompt token up
  front: a 15-token prompt starts in under 2 s, an 8,000-token one takes about
  70. Within a conversation you only pay it once — follow-up turns reuse the
  previous state. Compute is now the bulk of that time, and closing it means a
  grouped-GEMM kernel.
- **macOS 14 and 15** have only had the installer exercised, not the runtime.

[PLAN.md](PLAN.md) has the design and the milestone tracker;
[MEASUREMENTS.md](MEASUREMENTS.md) has every number here with its method,
including the experiments that failed.

## Testing

`Tools/verify.sh` is the acceptance battery — 81 checks covering weight
provenance, goldens against a version-matched Python reference, planner
behaviour across simulated machines, byte-equality across cache sizes and live
resizes, the `--memory-gb` promise, and a serving-robustness suite of inputs
that used to crash the server.

`Tools/e2e_release.sh` runs 31 more against the *installed* binary from
`curl | sh`, which is the thing users actually get.

The parts that need no weights (planner, sampler vs a numpy reference,
governor policy, API robustness) run in CI on every release build.

## License

MIT. `Sources/SlotstreamCore/Vendored/GatedDelta.swift` is ported from
[mlx-swift-lm](https://github.com/ml-explore/mlx-swift-lm) (MIT), and
`Tools/reference/` vendors the community `qwen4_exp.py` used as the test
oracle. Weights come from
[pipenetwork/Qwen3.8-Flash-Next-MLX-4bit](https://huggingface.co/pipenetwork/Qwen3.8-Flash-Next-MLX-4bit)
and remain under the Qwen community license.
