---
type: measurement
id: 01m1hhwm6nzd62qbsyrcbxnaz2
created: 2026-09-02T17:15:26.293628+00:00
updated: 2026-09-02T17:15:26.293628+00:00
summary: 'Parity: bit-exact, after two false alarms worth recording'
date: 2026-09-01
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M9
order: '440'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'Parity: bit-exact, after two false alarms worth recording'
status: measured
---

`slotstream mtp-parity` compares the Swift head against the MLX Python
reference (`Tools/reference/mtp_ref.py`) on a stored fixture. Final result:
**max abs 0.00000 on all four outputs** — prefill sample/multi and cached
decode sample/multi are bit-identical. Getting there surfaced two lessons:

1. **Random fixture inputs are adversarial for THIS layer.** The MTP block's
   norms run hot (raw q_norm mean 2.68 vs 0.28 on a main layer), and its
   attention logits reached **680** with top-2 gaps as small as **0.5** on
   random inputs. Sub-ulp cross-implementation noise flips near-tie argmax
   keys and reads as a 20% output error. Feeding Python's sdpa the Swift-dumped
   q/k/v byte-for-byte returned Swift's output exactly — the ops were never
   wrong, the near-tie lottery was. The fixture now uses REAL captured inputs
   (`slotstream mtp-fixture-inputs`).
2. **The reference must run on the mlx the Swift build pins.** mlx-swift is
   0.31.x; a fixture generated under Python mlx 0.32.2 disagreed at 5–15%
   (kernel reduction orders moved between versions), regenerated under 0.31.1
   it is bit-exact. Same lesson as the layer-parity work, now written down:
   `make_mtp_fixture.py` runs under `.venv31` and says so.
