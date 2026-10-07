---
type: measurement
id: 01m4bxs0787v5kzz3ydt0n40a5
created: 2026-10-07T19:34:49.320599+00:00
updated: 2026-10-07T19:34:49.320599+00:00
summary: v0.2.28 published and accepted
date: 2026-10-07
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
note: Exact CI bytes passed complete native and isolated public-install acceptance; no new throughput qualification.
order: '1720'
runs: '[[sources/runs/2026/10/2026-10-07-release-0-2-28-published-and-installed]]'
title: v0.2.28 published and accepted
status: measured
---
**[v0.2.28](https://github.com/carloslfu/slotstream/releases/tag/v0.2.28) is published and accepted.** It ships maintained-pack selection in the CLI, observed-footprint memory planning, complete-allocation checks for fixed caches, and request-prefetch cleanup. Original four-bit remains the only supported pack. Experimental quantizations remain research-only; this engine release does not distribute a Desktop installer.

Published 2026-10-07T19:24:58Z from source commit `71ebedd173aab089260f9085adc581cd9c20f1d4`. The complete engine source closure in the accepted CI archive matches current main; intervening commits change only documentation and research records. Release documentation is in `2e6b543b6d6cf81f24f023e39aea2c352ceeb48a`.

Archive SHA-256: `1947c1b325f80097f0eac3f86da2ef7b091ced32d50e4487703f683f28b0980b`. Executable SHA-256: `fee022e64b37abd25260d2c5552fda4d9a66383c86e68449d814dd284c94d9e0`.

| Acceptance | Result |
| --- | --- |
| Exact-source hosted CI | Engine, instrumented coverage, external library consumer, Mac app and context contracts passed |
| Complete native battery on the CI executable | 35 gates passed, zero failures or skips; includes quality 15/15, API robustness 74/74 and vision serving 25/25 |
| Public distribution | Published archive matches the preserved CI archive; checksum, GitHub provenance and build identity verified |
| Public installer | Unchanged public installer fetched the latest release into an isolated installation; installed executable matches CI bytes; user installation and shell profiles unchanged |
| Installed serving | 31/31 checks passed with Auto quantization, a 10 GB adaptive ceiling, 32,768-token context and MTP on; owned server reaped and no model processes remained |

The linked run preserves raw native, installer and serving logs, commands, identities, workflow receipts and cleanup evidence. Global paging remains diagnostic: the native run observed swap-ins without increased swap-outs, while process-memory and functional gates passed. These checks establish functional and distribution acceptance, not a new throughput result or qualification of other Macs. The broader same-checkpoint speed target remains unmet, as recorded in the closed [[records/plan/same-model-quantization-and-automatic-memory-2026-10-02]] plan.
