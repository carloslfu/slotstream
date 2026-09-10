<a id="measured-on-real-macs"></a>

# Hardware and speed

## What you need

- An Apple Silicon Mac, with macOS 14 or later.
- About 110 GB of free SSD space for the model.

Choose Apple menu → About This Mac to check your chip and memory. The
installer has been tested on macOS 14 and 15; model runs have been tested
on macOS 26. Windows, Linux, and Intel Macs are not supported by this engine.

An 8 GB Mac needs swap, which uses disk space as extra memory and can slow
down the whole computer. Close memory-heavy apps before running the model.

To check your own Mac without downloading or loading anything, run:

```sh
slotstream doctor
```

## Understanding speed

A **token** is a small piece of text, often part of a word. `tok/s` means
tokens per second. The speeds below describe a reply after the model's
cache has warmed up. The first reply also needs time to load the model and
process your question. Long conversations take longer to process.

Your chip, SSD, and other running apps affect speed. A memory size alone
isn't enough to predict it.

<a id="rows"></a>

## Results

These results were measured on real Macs, using different releases and settings:

| Mac | Memory | Reply speed |
|---|---|---|
| MacBook Pro, M5 Pro | 48 GB | ~12 tok/s |
| Mac mini, M2 (base storage) | 16 GB | 1.41 tok/s |
| MacBook Air, M5 | 32 GB | 6.22 tok/s |
| MacBook Pro, M5 Max | 128 GB | ~21–22 tok/s |

The M5 Pro result is from the author; the others are community reports.
The 8 and 24 GB sizes still need reports. Open the details below for
versions, settings, and credits.

<details>
<summary>Full results and test conditions</summary>

| Mac | Memory | SSD | macOS | slotstream | Plan | Warm decode | Long prompt | Peak | Reported by |
|---|---|---|---|---|---|---|---|---|---|
| MacBook Pro, M5 Pro | 48 GB | internal, 2 TB | 26.6 | 0.2.3 | auto: 33 GB target, ~152 experts/layer | ~12 tok/s; 12.8 with `--mtp` at a 28 GB target | ~220 tok/s at a 4096-token pass (est.) | 32 GB | [@carloslfu](https://github.com/carloslfu), 2026-09-02 |
| Mac mini, M2 | 16 GB | internal, 256 GB | 26.6.2 | 0.2.2 | auto: 10.2 GB target, ~21 experts/layer | **1.41 tok/s** | not measured; `context-check` postdates 0.2.2 | 6.1 GB | [@flol's report](https://github.com/carloslfu/slotstream/issues/5), 2026-09-02 |
| MacBook Air, M5 | 32 GB | 1 TB; location not specified | 26.6.2 | 0.2.11 | 22 GB target, ~75 experts/layer planned | **6.22 tok/s** | 126.28 tok/s for 8192 tokens, 2048-token passes | 17.75 GB RSS on the long prompt | [@arczhi's report](https://github.com/carloslfu/slotstream/issues/12), 2026-09-07 |
| MacBook Pro 16", M5 Max | 128 GB | internal, 2 TB | 26.6.2 | 0.2.3 | auto: 34.6 GB target, ~152 experts/layer | ~21–22 tok/s with speculative decoding | not measured | not measured; server path only | [@waterliu1981's update](https://github.com/carloslfu/slotstream/issues/6#issuecomment-5520489176), 2026-09-03 |

The 16 GB M2 and 32 GB M5 Air results are below the planner's estimates;
the 128 GB M5 Max result is above its estimate. The planner uses the M5 Pro
curve and doesn't model these differences.

A 16 GB Mac with a fast SSD would help separate disk speed from memory
capacity: the existing 16 GB and 48 GB machines differ in both. Reports from
older chips and external SSDs would also help test the estimates.

The Air's long-prompt test explicitly used a 22 GB target with vision and
speculative decoding off. Its full warm-server command and system load were
not supplied. The M5 Max row uses the reporter's updated results after
moving from 0.2.1 to 0.2.3. Community results have not been independently
rerun by the author.

Full methods, raw reports, and limits are in [MEASUREMENTS.md](../MEASUREMENTS.md):
the M5 Pro throughout, the M2 in C1, the M5 Max in C2, and the M5 Air in C3.

### What the columns mean

- **Plan**: the target and cache size `slotstream doctor` prints with nothing
  else running. Auto sizes down while other apps hold memory, so say what was
  open.
- **Warm decode**: tokens per second on the third identical request to a
  running server, once the expert cache has warmed up. The first generation
  in a fresh process is colder and slower; report it too.
- **Long prompt**: prefill tokens per second from `context-check`, which
  reads a synthetic prompt through the real engine and stops before the
  machine swaps.
- **Peak**: the highest resident memory used by the process (RSS), printed
  by `run` and `context-check`. This is measured separately from the plan's
  estimate.

</details>

## Speed estimates

These estimates come from the 48 GB M5 Pro and can differ substantially
from results on other Macs. In particular, the 16 GB M2 above ran much
slower than its estimate. Use the measured results when available.

| Mac RAM | Automatic memory target | Estimated generation speed |
|---|---|---|
| 8 GB | 8.1 GB | ~3 tok/s; requires swap and can slow the whole Mac |
| 16 GB | 10 GB | ~4 tok/s |
| 24 GB | 16 GB | ~8 tok/s |
| 32 GB | 22 GB | ~9 tok/s |
| 48 GB and up | 33 GB | ~12 tok/s on the M5 Pro |

The repeated target on larger Macs is the intentional default for this model,
based on the best measured tradeoff supported so far. These simulated rows do
not establish that larger allocations cannot help another Mac. See
[memory defaults and overrides](../README.md#why-doesnt-slotstream-use-all-of-my-ram).

## How to measure

Context is a startup choice, with a 32,768-token default. Slotstream 0.2.12
adds the feasibility report and request-wait controls described here.
Use `doctor --json` with the intended `--max-context` and memory policy to inspect the feasible
window before loading. A memory-feasible window does not promise a short wait:
the request-to-first-token budget defaults to 30 minutes, including preparation
and queueing. Setting `--max-prefill-wait 0` disables only that time policy.

Keep the configured window, prompt count and required reply count with each
result. Capacity evidence needs a complete prompt and reply, sampled physical
footprint, RSS and unchanged swap counters. Report MTP and vision separately;
a text-only capacity result does not qualify those modes or answer quality.

Allow about ten minutes once the weights are downloaded. Close other
memory-heavy apps and check that the Mac is not swapping. Run one model
process at a time.

To share your Mac's results, follow the [measurement steps](TESTING.md#measure-your-mac),
then open a [measurement report](https://github.com/carloslfu/slotstream/issues/new?template=measurement-report.yml).
Allow about ten minutes once the model is downloaded. Reports are credited
to their authors.

The full [engineering notes](ENGINEERING.md#speed) explain prompt-processing
time, memory use, and the methods behind the performance claims.
