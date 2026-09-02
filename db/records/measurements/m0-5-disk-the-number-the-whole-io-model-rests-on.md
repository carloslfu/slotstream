---
type: measurement
id: 01m1hhwkcdhcw5p5sya1frj9d5
created: 2026-09-02T17:15:25.453701+00:00
updated: 2026-09-02T17:15:25.453701+00:00
summary: M0.5 — Disk (the number the whole IO model rests on)
date: 2026-08-28
doc: measurements
level: '2'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M0
order: '80'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: M0.5 — Disk (the number the whole IO model rests on)
status: measured
---

**Methodology matters here and two earlier attempts were wrong.** Final method
(`Tools/coldread.c`): every offset read **at most once**, spread across 57 GB of
real model shards (≫ the ~35 GB usable page cache), `F_NOCACHE` + `F_RDAHEAD 0`, so
neither the page cache nor the SSD's own DRAM can serve a repeat.

APPLE SSD AP2048Z (2 TB), never-repeat cold random `pread`:

| Record | QD1 | QD4 | QD8 | QD16 | QD32 |
|---|---|---|---|---|---|
| **expert 2.7648 MB** | **9.46 GB/s** | 16.95 | **17.25** | 17.18 | **17.30 GB/s** |
| 16 KiB | 0.27 | — | 2.04 | — | 4.54 |
| 4 KiB | 0.08 | — | — | — | 1.11 |

Latency floor: 292 µs per 2.76 MB read at QD1 (→160 µs at QD8+); **53.6 µs** for
4 KiB and 60.1 µs for 16 KiB at QD1 — a genuine NVMe latency, which is the
independent evidence that these reads reach the device and are not cache hits.

**This SSD is ~2.5–3× faster than the plan assumed (5–7 GB/s).** 17.3 GB/s exceeds
PCIe 4.0 x4; Apple's controller is integrated into the SoC rather than behind a
discrete PCIe link, so it is not PCIe-bound. Treat it as measured-on-this-machine,
not as a number every Mac will hit — base-storage MacBook Airs will be far slower,
and Stage C on real small Macs must re-measure.

**Design consequences (large):**
- Expert-sized records are the sweet spot: they reach 55% of peak at **QD1** and
  saturate by QD8. Small-page IO is 100× worse at QD1 — which is the quantitative
  case against the page-granular mmap approach and *for* the record layout.
- Decode IO cost per token (480 expert-uses × 2.7648 MB × (1−h) ÷ 17.3 GB/s):

  | h | miss/token | IO ms/token | IO-bound ceiling |
  |---|---|---|---|
  | 0.98 | 26.5 MB | 1.5 | 650 tok/s |
  | 0.90 | 133 MB | 7.7 | 130 tok/s |
  | 0.50 | 663 MB | 38 | 26 tok/s |
  | **0.00** | 1,327 MB | **77** | **13 tok/s** |

  **Even a zero-hit cache sustains ~13 tok/s from IO alone.** The plan's small-Mac
  tiers (`lite16` 4–9, `edge8` 1–4 tok/s) were far too pessimistic *on the IO axis*;
  the binding constraint on small machines is memory and compute, not bandwidth.
- Dense-sweep prefill: a full 68 GB sweep costs 3.9 s → at 8k-token chunks that is
  ~2,100 tok/s IO-bound, so prefill will be compute-bound at every useful chunk size.

Superseded attempts, retained as method cautions: `Tools/diskbench.c` on a
freshly-written 12 GB file reported 28.8 GB/s sequential / 72 GB/s random —
impossible, because the file was wholly in the unified buffer cache and
**`F_NOCACHE` does not evict pages that are already cached**. `purge` requires sudo
(declined). A second run against one 10 GB shard gave 24.95 GB/s at QD32, still
inflated by repeat reads within the SSD's own cache. Only the never-repeat numbers
above are trustworthy.
