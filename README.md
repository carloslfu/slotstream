# slotstream

[![release](https://github.com/carloslfu/slotstream/actions/workflows/release.yml/badge.svg)](https://github.com/carloslfu/slotstream/actions/workflows/release.yml) [![latest release](https://img.shields.io/github/v/release/carloslfu/slotstream?label=latest%20release)](https://github.com/carloslfu/slotstream/releases/latest)

Run **Qwen3.8-Flash-Next** on a Mac that can't hold it. The model is a
125B-parameter mixture-of-experts, 104 GB on disk at 4-bit; slotstream streams
it from SSD and runs it in whatever memory you give it. It's one Swift binary,
no Python. It speaks the Ollama and OpenAI chat APIs, so your existing tools
work unchanged.

| on a 48 GB M5 Pro | |
|---|---|
| Warm decode | ~12 tok/s |
| Engine start | ~2 s (only the 3.8 GB trunk loads) |
| Peak memory | 32 GB (auto-sized; you can cap it) |
| Weights on disk | 104 GB |

## Will it run on my Mac?

You need Apple Silicon, macOS 14+, and ~110 GB of free disk. Disk bites
first: whatever your memory, a 512 GB Mac is the realistic minimum.

Auto-sizing never takes the whole machine. What each tier gets:

| your Mac | slotstream takes | warm decode |
|---|---|---|
| 8 GB | 8.1 GB, the floor | ~3 tok/s, and `doctor` warns it will page |
| 16 GB | 10 GB | ~4 tok/s |
| 24 GB | 16 GB | ~8 tok/s |
| 32 GB | 22 GB | ~9 tok/s |
| 48 GB and up | 33 GB (more buys nothing; see [Memory](#memory)) | ~12 tok/s |

These rows come straight from `slotstream doctor --sim-ram N`, so you can
reproduce them. Only the 48 GB row is measured on real hardware; the others
are estimates from its curve, and smaller Macs also have slower SSDs. The
middle column assumes nothing else is holding memory: with a browser open,
auto takes less and says so in the plan it prints at startup (see
[Memory](#memory)). Run `slotstream doctor` before downloading anything: it
prints your machine's plan and whether the disk can hold the weights.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/carloslfu/slotstream/main/install.sh | sh
```

Installs the latest release to `~/.slotstream/bin` and puts it on your PATH.
Re-run the same line to upgrade. To uninstall, `rm -rf ~/.slotstream` and
remove the `/usr/local/bin/slotstream` wrapper or the PATH line the installer
told you it added.

Releases are built by CI from the tagged commit with signed provenance, so you
can verify an asset instead of trusting the download:

```bash
gh attestation verify slotstream-arm64.tar.gz --repo carloslfu/slotstream
```

Or build `main` yourself. Command Line Tools are enough, no Xcode needed:

```bash
git clone https://github.com/carloslfu/slotstream && cd slotstream
make build
```

### The 104 GB download

The binary is small; the weights are not: 103.8 GB across 24 files, one time.
`serve` and `run` offer the download on first use, or `slotstream pull` does
it directly. Before transferring anything it prints the size, the destination,
and your free disk, waits for a yes, and refuses outright if the disk can't
hold it.

Your link sets the pace. `pull` opens eight TCP connections; a full install
from a 1 Gbit/s datacenter link measured 112 MB/s, 16 minutes for the whole
thing, which is the port. At 100 Mbps plan on ~2 h 20; at 25 Mbps, ~9 h. One
connection alone is bounded by the round trip to Hugging Face — about 70 MB/s
from a datacenter, 25 to 40 from a home link 100 ms away — which is why the
count matters and why `pull` prints how many it is actually using. (Through
0.2.0 it ran on one connection whatever the flag said; see the changelog.)

Interrupting is safe: `pull` picks up where it stopped, redoing at most the
few chunks that were in flight, and all 24 files are checked against sha256
hashes compiled into the binary, so a truncated or corrupted download can't
reach the engine. The files come from a mirror of the pinned revision, with
the original repo as fallback; the hashes are the same either way.
`pull --verify` re-hashes an existing copy any time (8 s here).

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

Open WebUI and the OpenAI SDKs are tested against this subset (the Ollama
CLI is not there yet; see [Status](#status-and-limits)). Streaming, CORS, and
the usual sampling options all work. What isn't supported (tools, images,
JSON-schema output, logprobs) returns a clear 400 instead of being silently
ignored. Every endpoint, field, default, and error is in
[docs/API.md](docs/API.md).

## Speed

Decode is the easy part: ~12 tok/s warm on a 48 GB Mac, and the tier table
above says what smaller ones get. The slow axis is the prompt. All of it is
processed before the first token appears, so 8,000 tokens wait about a minute
on a 48 GB Mac and over three on a 16 GB one. Prompt plus completion is
capped at 32,768 tokens (`--max-context`).

Within a conversation you only pay that once. Follow-up turns prefill just
what's new, so time to first token stays flat as the chat grows: over eight
turns at a 16 GB target, 6.0 s on the last turn instead of 25.8 s. Reused
state isn't bit-identical to recomputing it, so a reply can occasionally
differ where two tokens were nearly tied; `--no-prefix-cache` turns it off if
you need exact reproducibility.

Decode has one more gear on machines with room to spare, and it is a small
one. The model ships a draft head that predicts the token after next; with
`--mtp` (default `auto`, new in 0.2.0) slotstream drafts two tokens ahead
and verifies them in one batched pass, and the first draft is right 86% of
the time (measured). It only pays where the expert cache is already near
its best. On the dev Mac the 0.2.0 build, which drafted four tokens, lost at
every cache size that fit, from ×0.55 at 20 experts per layer to ×0.96 at
57; two drafts, the default now, reach ×1.12 at 57, and auto keeps the head
off below a 28 GB target either way. Past 120 per layer, where auto turns
it on, nothing has been measured yet, but the ceiling is: with every expert
resident a three-token verify pass costs 1.33 single passes (measured),
which caps the gain at about ×1.5 in the best case and, projecting the
measured fetch costs onto the plateau, nearer ×1.2 there. The head costs
1.6 GB on top of the cache, so the auto ceiling becomes 34.6 GB. It needs a
one-time conversion that pulls 4.9 GB from the official
release and writes a 1.5 GB `mtp.safetensors` next to the weights
(`Tools/mtp_convert.py`, run from a clone with the repo's Python
environment); without the file, everything runs with it off.

## Memory

With no flags, slotstream sizes itself to your machine and tells you what it
chose. This is a 48 GB Mac; it reads 52 because everything here counts in
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

Auto takes the lowest of three limits (33 GB, 70% of RAM, and 2 GB under the
Metal working-set limit) and sizes down further while other apps are actually
holding memory. The 33 GB cap is the knee of the measured curve, not
politeness: in a GB-at-a-time sweep, nothing between 34 and 84 GB decoded or
prefilled any faster, so a 128 GB Mac gets the same plan a 48 GB one does.
While running, slotstream re-checks every 15 s and resizes the cache between
requests, shrinking under pressure and growing back once the pressure passes.
Output is byte-identical across resizes.

To cap it yourself, `--memory-gb G` sets the total for the process (minimum
8.1, and it will go past 33 if you want to experiment). `--max-ram-percent P`
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

Working, and measured on one machine, an M5 Pro with 48 GB. The smaller tiers
are estimates from its curve, not runs on real hardware.

- **One model, one process.** v0 runs exactly `qwen3.8-flash-next:4bit`; the
  engine is built around its geometry, and `pull` knows no other name. A
  per-user lock allows one model process at a time.
- **macOS 14 and 15** have only had the installer exercised, not the runtime.
- **The Ollama CLI can't connect in 0.2.0.** Its requests carry fields the
  release's strict validator rejects (empty `name`, `system`, `template`,
  `options`, and Ollama's empty-prompt "load" request), so `ollama run` stops
  before the first message. Fixed on `main` and verified with a real
  `ollama run` in both modes; it ships in the next release. curl, Open WebUI,
  and the OpenAI SDKs work today.

## Docs

- [docs/API.md](docs/API.md): every endpoint, accepted field, sampling
  default, and deliberate 400.
- [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md): port clashes, paging,
  slow decode, moving or verifying the weights.
- [docs/CLI.md](docs/CLI.md): every command and flag, the memory knobs and
  their precedence, environment variables, where files live. (`slotstream
  <command> --help` carries the same text with more discussion.)
- [CHANGELOG.md](CHANGELOG.md): what each release changed.
- [PLAN.md](PLAN.md): the design and the milestone tracker.
- [MEASUREMENTS.md](MEASUREMENTS.md): every number here with its method,
  including the experiments that failed.
- [llms.txt](llms.txt): a map of all of this for AI agents, with the
  commands, memory knobs, and API essentials inline;
  [llms-full.txt](llms-full.txt) is every doc above in one file.

## Testing

`Tools/verify.sh` is the acceptance battery: weight provenance, goldens
against a version-matched Python reference, byte-equality across cache sizes
and live resizes, the speculative-decode gates, and a serving-robustness
suite of inputs that used to crash the server. `Tools/e2e_release.sh` tests the other thing users actually
touch: the `curl | sh` install and the binary it leaves behind. The parts
that need no weights run in CI on every release build.

## License

MIT. `Sources/SlotstreamCore/Vendored/GatedDelta.swift` is ported from
[mlx-swift-lm](https://github.com/ml-explore/mlx-swift-lm) (MIT), and
`Tools/reference/` vendors the community `qwen4_exp.py` used as the test
oracle. Weights come from
[pipenetwork/Qwen3.8-Flash-Next-MLX-4bit](https://huggingface.co/pipenetwork/Qwen3.8-Flash-Next-MLX-4bit)
and remain under the Qwen community license.
