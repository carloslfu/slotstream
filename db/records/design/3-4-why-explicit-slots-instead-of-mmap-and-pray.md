---
type: design
meta-type: conclusion
id: 01m1hhwn2x2rnxd8pkjwsx2nq9
created: 2026-09-02T17:15:27.197312+00:00
updated: 2026-09-02T17:15:27.197312+00:00
summary: 3.4 Why explicit slots instead of mmap-and-pray
date: 2026-08-28
doc: plan
level: '3'
order: '80'
source: '[[sources/docs/2026/09/plan-md-2026-09-02]]'
title: 3.4 Why explicit slots instead of mmap-and-pray
---

llama.cpp/LM Studio can already mmap this model and let the page cache thrash. We don't,
because on macOS that path has: unbounded RSS → memory pressure → compressor/swap death
(writes!, the thing that actually wears SSDs and freezes Macs), no QD control, no
prefetch, no layout control, and double-caching. Explicit slots give: deterministic
footprint chosen per machine, F_NOCACHE reads (no page-cache duplication), record-aligned
layout, measured QD, exact PLE prefetch, and a dense-sweep prefill mode none of the mmap
runtimes have. (A `--io-mode=pagecache` flag is kept for A/B honesty — the OS cache as a
free-but-nondeterministic L2 is itself one of the combinations to test on big-RAM tiers.)
MLX gets us Metal-first compute on unified memory: SSD→RAM is the only copy; RAM→GPU is
free.

Also: reads don't meaningfully wear SSDs; sustained decode at ~20 tok/s × 100 MB/tok ≈
2 GB/s read is thermally and endurance-wise fine. What kills machines is swap — which this
design's fixed budget exists to prevent.

---
