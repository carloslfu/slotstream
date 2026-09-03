---
type: community-report
id: 01m1jpmebya7sb6s02y1257ajh
created: 2026-09-03T03:57:35.486152+00:00
updated: 2026-09-03T03:57:48.999191+00:00
summary: 'GitHub issue #5, @flol, 2026-09-02: Mac mini M2, 16 GB, 256 GB internal SSD, slotstream 0.2.2 — plan, cold generation, three warm-decode runs, and a failed context-check step, verbatim.'
captured_at: 2026-09-02
machines: '[[records/machines/mac-mini-m2-16gb]]'
reporter: '@flol'
title: 'Measurement report: Mac mini M2, 16 GB (issue #5, @flol)'
url: https://github.com/carloslfu/slotstream/issues/5
---
Measurement report from GitHub issue #5, filed 2026-09-02 by `@flol` against
the `measurement-report.yml` template, reproduced verbatim below. The reporter
ticked the box permitting a `docs/HARDWARE.md` row credited to their handle.

One redaction: the weights path printed a macOS home directory containing a
personal name, replaced with `/Users/<user>/`. Nothing else is changed —
the numbers, wording, and the failed step are as filed.

The **Long prompt** step failed. `slotstream context-check` landed in
`bc361f3`, after the v0.2.2 tag, while `docs/HARDWARE.md` shipped on `main`
telling reporters to run it. The reporter followed the published procedure
against the latest release and hit a command that does not exist in it.

---

### Mac

Mac Mini M2, 2023

### Unified memory

16 GB

### SSD

internal, 256 GB

### macOS version

26.6.2

### slotstream --version

0.2.2

### Memory plan

```text
device: applegpu_g14g  |  17 GB RAM (11.7 GB reclaimable now), 12.7 GB Metal working set
model:  48 layers x 512 experts x 2.76 MB (24576 records = 67.9 GB streamed from SSD)
weights: present by size, 105.3 GB at /Users/<user>/.slotstream/models/qwen38-flash-next-mlx-4bit (run pull --verify for hashes)

slotstream memory plan (auto)
  device: 17 GB RAM (11.7 GB reclaimable now), 12.7 GB Metal working set
  target: 10.2 GB total for this process   (override: --memory-gb N | --max-ram-percent P)
  cache:  ~21 of 512 experts per layer  (1025 global slots = 2.8 GB pool)
  expect: ~9.2 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  prefill: 256 tokens per pass (~40 tok/s here; costs ~0.3 GB of the target)
  reuse:  up to 14099 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
  note:   only 11.7 GB of 17 GB RAM is reclaimable right now (other apps hold the rest) — sized down from the usual 10.7 GB; close apps and restart for full speed, or force a size with --memory-gb

knobs (first one given wins; with none, auto is the default):
  --memory-gb G           easiest: total memory the process may use
  --experts-per-layer N   precise: cache N of 512 per layer (pool = N x 0.133 GB)
  --pool-gb G             raw pool size (1 GB = 7.5 experts/layer)
min ~13/layer = 8.1 GB total. The pool is one global cache shared across
all layers -- per-layer is the unit of intuition (a token activates 10
of its 512 per layer), not a quota: hot layers borrow slots from cold.

what a memory target buys (conservative warm-decode estimate from
measured M5 Pro anchors: 30/layer = 6.0, 150/layer = 11.6):
  target     experts/layer  est. warm decode
     8.1 GB         13/512      ~ 3 tok/s
    10.0 GB         20/512      ~ 4 tok/s
    12.0 GB         26/512      ~ 5 tok/s
    16.0 GB         54/512      ~ 8 tok/s
    24.0 GB        104/512      ~10 tok/s
    28.0 GB        134/512      ~11 tok/s
    36.0 GB        174/512      ~12 tok/s
    48.0 GB        265/512      ~12 tok/s
    73.0 GB        413/512      ~12 tok/s
```

### Cold generation

```text
-- prefill 28 tok in 10.93s (2.6 tok/s)
-- prefill split: io 8.66s + scatter 0.80s + compute 1.47s | 4778 records (13.2 GB, 1.5 GB/s)
-- decode 128 tok in 91.95s (1.39 tok/s)
-- expert cache ~19/512 experts per layer, hit rate 0.434 | ngram rows 136h/1912m | peak 6.1 GB | total 102.9s
```

### Warm decode

```text
decode 1.41 tok/s, prefill 2.6 tok/s
decode 1.41 tok/s, prefill 2.6 tok/s
decode 1.41 tok/s, prefill 2.6 tok/s
```

### Long prompt

```text
Error: Unexpected argument 'context-check'
```

### Notes

Seems like I'm running into the bandwidth limitation of the M2 single-chip SSD.

### Listing

- [x] You may add this row to docs/HARDWARE.md credited to my GitHub handle.
