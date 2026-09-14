---
type: decision
id: 01m2c4qtdh26x1va76e8p7jzf0
created: 2026-09-13T01:05:06.993525+00:00
updated: 2026-09-13T01:05:06.993525+00:00
summary: 'Residency speculation waits: only 2.2% to 2.5% of layer events are fully resident, too few to pay for rollback machinery'
decided_on: 2026-09-12
evidence: '[[records/measurements/decode-path-serialization-round-1-2026-09-12]]'
reversible_if: a prefetch operating point that keeps its throughput gain makes complete layers common enough that a residency-speculation prototype saves more synchronization than its rollback costs, in a paired run with exact outputs
title: Residency speculation waits until complete layers are common
status: standing
---
Residency speculation would skip a layer's routing readback when prefetch has already made every routed expert resident, verify that assumption later, and roll back on a miss using the speculative-decode state checkpoint. It is the only design identified that removes the routing synchronization itself, and so the only one that approaches the ceiling set by fully overlapping expert I/O, GPU work and host work.

Its value is bounded by how often a layer is complete. At the B0 setting the `layersComplete` counter measures 2.2% to 2.5% of layer events with no demand read: with top-10 routing over three verified positions and a hit rate near 0.7, every routed expert being resident is rare. Rollback machinery for a synchronization that could be skipped about one layer in forty is not justified, so the design waits.
