---
type: community-report
id: 01m3f79brdcej337fbn3jzkecq
created: 2026-09-26T16:03:04.077553+00:00
updated: 2026-09-26T16:03:11.124359+00:00
summary: 'Measured: MacBook M4 Pro, 24 GB'
captured_at: 2026-09-26
machines: '[[records/machines/macbook-pro-m4-pro-24gb]]'
reporter: davidcavazos
title: 'Measured: MacBook M4 Pro, 24 GB'
url: https://github.com/carloslfu/slotstream/issues/41
---
Issue opened 2026-09-25T16:30:55Z; captured 2026-09-26.

The following issue body and comments are preserved verbatim from the
GitHub response. Numbers and interpretations inside them are the authors' reports.
One redaction: the weights path printed a macOS home directory, replaced
with `/Users/<user>/`. Nothing else is changed.

## Original issue body

### Mac

MacBook Pro M4 Pro, 2024

### Unified memory

24 GB

### SSD

512 GB

### macOS version

26.6.2

### slotstream --version

0.2.24

### Memory plan

```text
device: applegpu_g16s  |  26 GB RAM (17.4 GB reclaimable now), 24.7 GB Metal working set
model:  48 layers x 512 experts x 2.76 MB (24576 records = 67.9 GB streamed from SSD)
weights: present by size, 105.3 GB at /Users/<user>/.slotstream/models/qwen38-flash-next-mlx-4bit (run pull --verify for hashes)

slotstream memory plan (auto)
  device: 26 GB RAM (17.4 GB reclaimable now), 24.7 GB Metal working set
  target: 15.9 GB total process budget, not a RAM usage goal   (adaptive limit: --memory-limit-gb N; fixed cache: --memory-gb N)
  cache:  ~53 of 512 experts per layer  (2546 global slots = 7.0 GB pool)
  plan:   ~14.9 GB full-workload envelope, ~8 tok/s warm decode (est. from M5 Pro anchors)
  memory: 7.0 GB expert cache at load; 7.9 GB allowed for runtime, context and workspace; 1.0 GB budget headroom. Short requests can use less.
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 1024 tokens per pass (~165 tok/s here; costs ~1.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~3.3 min before its first token here, follow-up turns read only what is new
  reuse:  up to 32768 tokens across 4 conversations (~1.2 GB), so a follow-up turn re-prefills only what is new
  note:   only 17.4 GB of 26 GB RAM is reclaimable right now (other apps hold the rest) — sized down from the usual 18.0 GB; close apps and restart for full speed, or force a size with --memory-gb
memory-feasible window: 177152 tokens; separate from the 30.0-minute request-to-first-token policy

context window: automatic, 32768 tokens on this machine's memory tier. Auto takes the largest
window that keeps speculative decoding, retains one complete conversation, and adds at most 10%
to the estimated time of a 2000-token prompt with a 400-token reply:
Cache reductions above the measured decode range are declined, even when the estimate is flat.
   window   experts/layer   draft   lookahead    pass   typical request   full-window wait
    32768          69/512     off         off    1024     59.5 s (+0.0%)   ~3.3 min   <- auto
    65536          49/512     off         off    1024    66.9 s (+12.4%)   ~7.8 min   (adds 12.4% to a typical request, above the 10% limit)
   131072          15/512     off         off     256   155.9 s (+162.0%)   not yet calibrated   (adds 162.0% to a typical request, above the 10% limit)
   262144   does not fit with one complete conversation retained
  --max-context N chooses any window up to 262144. A larger window costs memory and
  reading time; it does not guarantee answer quality over very long context.

memory controls (with none, auto is the default):
  --memory-limit-gb G     adaptive ceiling; cache shrinks and recovers within it
  --memory-gb G           total process budget with a fixed cache
  --experts-per-layer N   precise: cache N of 512 per layer (pool = N x 0.133 GB)
  --pool-gb G             raw pool size (1 GB = 7.5 experts/layer)
Use the adaptive ceiling alone. Among fixed controls, experts-per-layer
takes precedence over pool-gb, then memory-gb.
min ~13/layer = 8.1 GB total. The pool is one global cache shared across
all layers -- per-layer is the unit of intuition (a token activates 10
of its 512 per layer), not a quota: hot layers borrow slots from cold.

what a memory target buys (conservative warm-decode estimate from
measured M5 Pro anchors: 30/layer = 6.0, 150/layer = 11.6; the last
column is the wait before the first token of a prompt filling the
whole context, follow-up turns read only what is new):
  target     experts/layer  est. warm decode   pass    full 32768-token prompt
     8.1 GB         13/512      ~ 3 tok/s     256   ~6.4 min
    10.0 GB         20/512      ~ 4 tok/s     256   ~6.4 min
    12.0 GB         31/512      ~ 6 tok/s     512   ~4.4 min
    16.0 GB         54/512      ~ 8 tok/s    1024   ~3.3 min
    24.0 GB   more than is reclaimable right now for a 32768-token window
    28.0 GB   above this Mac's 24.7 GB Metal working set
    36.0 GB   above this Mac's 24.7 GB Metal working set
    48.0 GB   above this Mac's 24.7 GB Metal working set
    73.0 GB   above this Mac's 24.7 GB Metal working set

time to first token at this plan, by prompt length (the pass shrinks past ~4k
tokens so its transient memory stays inside what was measured):
  2k ~12 s · 8k ~50 s · 16k ~1.7 min · 32k ~3.3 min (the cap)
  context state is ~27 KiB per token, up to the model's 262144-token limit.
  `slotstream context-check --tokens N` reads an N-token synthetic prompt on this Mac and
  stops early if reclaimable memory falls below its floor or its time limit passes.
```

### Cold generation

```text
-- prefill 28 tok in 4.67s (6.0 tok/s)
-- prefill split: io 3.53s + scatter 0.01s | 4755 records (13.1 GB, 3.7 GB/s)
-- decode 128 tok in 40.40s (3.17 tok/s)
-- decode split: io 19.89s + scatter 0.08s | 23882 records
-- expert cache ~38/512 experts per layer, hit rate 0.608 | ngram rows 88h/1944m | lifetime footprint peak 8.827 GB, current footprint 8.827 GB | total 45.1s
```

### Warm decode

```text
decode 3.61 tok/s
decode 3.52 tok/s
decode 3.57 tok/s
```

### Long prompt

```text
slotstream memory plan (auto)
  device: 26 GB RAM (19.6 GB reclaimable now), 24.7 GB Metal working set
  target: 18.0 GB total process budget, not a RAM usage goal   (adaptive limit: --memory-limit-gb N; fixed cache: --memory-gb N)
  cache:  ~78 of 512 experts per layer  (3763 global slots = 10.4 GB pool)
  plan:   ~17.0 GB full-workload envelope, ~9 tok/s warm decode (est. from M5 Pro anchors)
  memory: 10.4 GB expert cache at load; 6.6 GB allowed for runtime, context and workspace; 1.0 GB budget headroom. Short requests can use less.
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 1024 tokens per pass (~165 tok/s here; costs ~1.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 8208 tokens per request (prompt + reply); a full-length prompt takes ~50 s before its first token here, follow-up turns read only what is new
  note:   prefill and prefix retention reservations match the explicit runtime controls
engine ready in 1.5s: expert cache ~78/512 per layer (3763 global slots = 10.4 GB), eos [248044, 248046]
  prefill: reading 8192 prompt tokens, ~50 s to the first token at this plan (follow-up turns read only what is new)
  prefill: 4096/8192 tokens (50%), 124 tok/s recently, ~33 s left at this rate
  context-check progress: 4096/8192 missing tokens committed
  prefill: 5120/8192 tokens (62%), 78 tok/s recently, ~39 s left at this rate
  prefill: 6144/8192 tokens (75%), 76 tok/s recently, ~27 s left at this rate
  prefill: 7168/8192 tokens (88%), 76 tok/s recently, ~14 s left at this rate
  context-check progress: 7168/8192 missing tokens committed
  prefill: done, 8192 tokens in 1.5 min (93 tok/s)
context-check   8192 tokens: read in 1.5 min (93 tok/s), process peak 16.6 GB vs plan 17.0 GB: OK
verdict: 8192 prompt tokens plus 16 output tokens completed inside the plan on this Mac. Serving chooses its window per machine (see `slotstream doctor`) and accepts --max-context up to 262144. Diagnostic success does not change that choice.
```

### Notes

Open:
- 1-2 terminals for the testing
- Safari with the HARDWARE, TESTING and the measurement issue tabs (3)
- Stats and Activity Monitor to check resource usage

Fresh system boot
Swap: 0 before and after the tests
Energy Mode: Automatic

No fans, no throttling I could detect.
Slightly warm, but significantly less than running Qwen 3.8 27B

### Listing

- [x] You may add this row to docs/HARDWARE.md credited to my GitHub handle.

## Comment by @davidcavazos

I did another round of warm decode:
```
decode 3.85 tok/s
decode 3.97 tok/s
decode 3.95 tok/s
```

Still seems pretty low on decode for the memory bandwidth available. I noticed total system memory footprint stays at around ~70%, slotstream server using 11.56 GB, and still ~7 GB free, 0 swap.

I tried using it in Pi agent for some tasks and disk reads seemed consistent at ~2 GB/s, but the server output didn't have tok/s so I couldn't measure it without instrumenting it.

I would love to see what a timeline profiler can tell us, there's probably areas in the data pipeline that could be improved.
