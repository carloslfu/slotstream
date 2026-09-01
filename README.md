# slotstream

[![release](https://github.com/carloslfu/slotstream/actions/workflows/release.yml/badge.svg)](https://github.com/carloslfu/slotstream/actions/workflows/release.yml)

Run **Qwen3.8-Flash-Next** on a Mac that can't hold it. The model is a
125B-parameter mixture-of-experts, 104 GB on disk at 4-bit; slotstream streams
it from SSD and runs it in whatever memory you give it. One Swift binary, no
Python; it speaks the Ollama and OpenAI chat APIs, so your existing tools work
unchanged.

| on a 48 GB M5 Pro | |
|---|---|
| Warm decode | ~12 tok/s |
| Cold start to first token | ~3 s |
| Peak memory | 32 GB (auto-sized; you can cap it) |
| Weights on disk | 104 GB |

## Will it run on my Mac?

Apple Silicon, macOS 14+, and ~110 GB of free disk. Disk bites first: whatever
your memory, a 512 GB Mac is the realistic minimum.

Auto-sizing never takes the whole machine. What each tier gets:

| your Mac | slotstream takes | warm decode |
|---|---|---|
| 8 GB | 8.1 GB — the floor | ~3 tok/s, and `doctor` warns it will page |
| 16 GB | 10 GB | ~4 tok/s |
| 24 GB | 16 GB | ~8 tok/s |
| 32 GB | 22 GB | ~9 tok/s |
| 48 GB and up | 33 GB — more buys nothing, see [Memory](#memory) | ~12 tok/s |

These rows come straight from `slotstream doctor --sim-ram N`, so you can
reproduce them. Only the 48 GB row is measured on real hardware; the others
are estimates from its curve, and smaller Macs also have slower SSDs. Run
`slotstream doctor` before downloading anything — it prints your machine's
plan and whether the disk can hold the weights.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/carloslfu/slotstream/main/install.sh | sh
```

Installs a prebuilt binary to `~/.slotstream/bin` and puts it on your PATH.
Re-run the same line to upgrade; uninstall with `rm -rf ~/.slotstream`.

Releases are built by CI from the tagged commit with signed provenance, so you
can verify an asset instead of trusting the download:

```bash
gh attestation verify slotstream-arm64.tar.gz --repo carloslfu/slotstream
```

Or build it yourself — Command Line Tools are enough, no Xcode needed:

```bash
git clone https://github.com/carloslfu/slotstream && cd slotstream
make build
```

### The 104 GB download

The binary is small; the weights are not — 103.8 GB across 24 files, one time.
`serve` and `run` offer the download on first use, or `slotstream pull` does
it directly. Before transferring anything it prints the size, the destination,
and your free disk, waits for a yes, and refuses outright if the disk can't
hold it.

A real install took 35 minutes. Hugging Face caps the transfer at roughly
36–57 MB/s however many connections you open, so past ~400 Mbps the wait is
Hugging Face's day, not your link. At 100 Mbps plan on ~2 h 20; at 25 Mbps,
~9 h.

Interrupting is safe: `pull` resumes exactly where it left off, and all
24 files are checked against sha256 hashes compiled into the binary, so a
truncated or corrupted download can't reach the engine. `pull --verify`
re-hashes an existing copy any time — 8 s here.

## Use it

First taste, no server:

```bash
slotstream run --prompt "why is the sky blue?"
```

For everything else, `serve` listens on port 11434 and implements the
chat/generate subset used by Ollama clients and OpenAI SDKs:

```bash
slotstream serve
```

```bash
curl localhost:11434/api/chat -d '{
  "model": "qwen3.8-flash-next:4bit",
  "messages": [{"role": "user", "content": "hello"}]
}'
```

```bash
OLLAMA_HOST=http://localhost:11434 ollama run qwen3.8-flash-next:4bit
```

Open WebUI, the Ollama CLI, and the OpenAI SDKs are tested against this
subset. Streaming, CORS, and the usual sampling options all work; what isn't
supported — tools, images, JSON-schema output, logprobs — returns a clear 400
instead of being silently ignored. The full surface — every endpoint, field,
default, and error — is in [docs/API.md](docs/API.md).

Prompt plus completion is capped at 32,768 tokens (`--max-context`), and one
model process runs at a time. Long prompts are the slow axis: the whole prompt
is processed before the first token appears, so 8,000 tokens wait about a
minute on a 48 GB Mac and over three on a 16 GB one.

Within a conversation you only pay that once. Follow-up turns prefill just
what's new, so time to first token stays flat as the chat grows — 6.0 s at
turn eight instead of 25.8 s. Reused state isn't bit-identical to recomputing
it, so a reply can occasionally differ where two tokens were nearly tied;
`--no-prefix-cache` turns it off if you need exact reproducibility.

On machines with room to spare, decode can also go speculative (`--mtp`): the
model ships a draft head that predicts the token after next, so slotstream
drafts a few tokens ahead and verifies them in one batched pass — measured
86% right on the first draft. The head costs a fixed 1.6 GB, and auto only
turns it on once the expert cache is already near its best (~26 GB of target
and up); below that, the same memory buys more as cache — measured, not
assumed. It also needs a one-time 1.5 GB conversion (`Tools/mtp_convert.py`),
because the community checkpoint dropped the head's tensors; without the
file, everything simply runs with it off.

## Memory

With no flags, slotstream sizes itself to your machine and tells you what it
chose. This is a 48 GB Mac — it reads 52 because everything here counts in
decimal GB:

```
slotstream memory plan (auto)
  device: 52 GB RAM (36.0 GB reclaimable now), 40.2 GB Metal working set
  target: 33.0 GB total for this process   (override: --memory-gb N | --max-ram-percent P)
  cache:  ~152 of 512 experts per layer  (7280 global slots = 20.1 GB pool)
  expect: ~32.0 GB peak, ~12 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 4096 tokens per pass (~125 tok/s here; costs ~5.3 GB of the target)
  reuse:  up to 32768 tokens across 4 conversations (~1.2 GB), so a follow-up turn re-prefills only what is new
```

Auto takes the lowest of three limits — 33 GB, 70% of RAM, and 2 GB under the
Metal working-set limit — and sizes down further while other apps are actually
holding memory. The 33 GB cap is the knee of the measured curve, not
politeness: in a GB-at-a-time sweep, nothing between 34 and 84 GB decoded or
prefilled any faster, so a 128 GB Mac gets the same plan a 48 GB one does
(34.6 GB with the draft head on — its 1.6 GB rides on top, and the cache
still reaches the knee). While running, it re-checks every 15 s and resizes
the cache between requests,
shrinking under pressure and growing back once the pressure passes. Output is
byte-identical across resizes.

To cap it yourself, `--memory-gb G` sets the total for the process — minimum
8.1, and it will go past 33 if you want to experiment. `--max-ram-percent P`
moves the 70% share, and `--experts-per-layer` / `--pool-gb` size the cache
directly. `slotstream doctor` prints the plan any of these would produce
without loading anything.

## How it works

Almost all of the model's bytes sit in two places: 68 GB of routed experts
(512 per layer, 10 active per token) and a 32 GB n-gram table. The dense trunk
is only 3.8 GB and stays resident. Experts are read with `pread` into a fixed
pool of cache slots shared by all 48 layers, so hot layers borrow slots from
cold ones.

**Cache size changes speed, never output.** Greedy decoding is byte-identical
between a 4 GB cache and a 24 GB one, and that equivalence is a standing test.

Why not just mmap the file? MLX (Apple's ML framework) can't materialize part
of a memory-mapped tensor: a top-10 expert gather evaluates all 512 experts of
that layer, so an mmap path loads ~100 GB and dies. The stock `mlx_lm.load()`
route took this 48 GB machine into 48 GB of swap without producing a token.

## Status and limits

Working, and measured on one machine — an M5 Pro with 48 GB. The smaller tiers
are estimates from its curve, not runs on real hardware.

- **One model.** v0 runs exactly `qwen3.8-flash-next:4bit`; the engine is
  built around this model's geometry, and `pull` knows no other name.
- **Long prompts start slow.** The whole prompt is processed before the first
  token — about 70 s for 8,000 tokens on the measured machine.
- **macOS 14 and 15** have only had the installer exercised, not the runtime.
- **Speculative decode is measured where it loses, estimated where it wins.**
  At small caches the A/B says ×0.96 — so auto keeps it off there. The
  ×1.5–1.9 at large caches is arithmetic from the measured 86% accept rate,
  pending an A/B on a machine with 26 GB free.

## Docs

- [docs/API.md](docs/API.md) — every endpoint, accepted field, sampling
  default, and deliberate 400.
- [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) — port clashes, paging,
  moving or verifying the weights.
- `slotstream <command> --help` — every flag, with the reasoning behind it.
- [PLAN.md](PLAN.md) — the design and the milestone tracker.
- [MEASUREMENTS.md](MEASUREMENTS.md) — every number here with its method,
  including the experiments that failed.
- [llms.txt](llms.txt) — a map of all of this for AI agents.

## Testing

`Tools/verify.sh` is the acceptance battery: weight provenance, goldens
against a version-matched Python reference, byte-equality across cache sizes
and live resizes, the speculative-decode gates, and a serving-robustness
suite of inputs that used to crash the server. `Tools/e2e_release.sh` tests
the other thing users actually touch — the `curl | sh` install and the binary
it leaves behind. The parts that need no weights run in CI on every release
build.

## License

MIT. `Sources/SlotstreamCore/Vendored/GatedDelta.swift` is ported from
[mlx-swift-lm](https://github.com/ml-explore/mlx-swift-lm) (MIT), and
`Tools/reference/` vendors the community `qwen4_exp.py` used as the test
oracle. Weights come from
[pipenetwork/Qwen3.8-Flash-Next-MLX-4bit](https://huggingface.co/pipenetwork/Qwen3.8-Flash-Next-MLX-4bit)
and remain under the Qwen community license.
