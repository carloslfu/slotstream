---
type: measurement
id: 01m356k60e0jphnxapd9q2xrdm
created: 2026-09-22T18:38:32.974923+00:00
updated: 2026-09-22T18:38:32.974923+00:00
summary: Keep the latest qualified decode result and rough ranges; add scoped prompt-policy and reuse results, and mark historical planner calibration.
date: 2026-09-22
doc: measurements
level: '3'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
order: '1630'
runs: '[[sources/runs/2026/09/2026-09-22-speed-tables-planner-review]]'
title: Public speed tables checked against the latest evidence
status: analysis
---
The README's warm-reply ranges and hardware guide's measured decode table already contain the latest qualified public warm-decode reference: 15.86 tok/s on 0.2.19 at a 22 GB target. The recent installed-release audit does not replace that held-out sustained-decode benchmark. Short requests have no consistent gain and long first-request studies mostly cap output at one token. A recent prefill or cache percentage must not inflate the decode table or community reports.

The public surfaces were missing the qualified prompt-policy and reuse results. README and HARDWARE now show the same scoped table: inventory/MTP prefill arm medians 155.22 to 53.94 seconds with 65.40% median paired reduction, and prose follow-up request medians 30.73 to 4.42 seconds with 85.62% median paired reduction. Each comparison has three clean pairs, matching generated IDs, one tested binary per comparison, and a 10 GB target on the 48 GB M5 Pro. The first is pre-release policy qualification; the second tests the installed release. Neither measures the whole release delta. The prose number covers the follow-up only and compares existing reuse against disabled checkpoints.

Sources: [[records/measurements/mtp-prefill-policy-2026-09-21]] and [[records/measurements/published-prompt-speed-audit-2026-09-22]]. Their original eligibility and exclusions remain unchanged. The hardware guide links complete methods and explicitly excludes contaminated or insufficiently repeated timings from the public table.

Read-only simulations of the installed 0.2.23 binary reproduce every current automatic memory/context row and the documented rounded full-window wait estimates. The planner still uses its historical reference curve. The narrow new experiments do not qualify a replacement curve across pass sizes, position, hardware, MTP and memory budgets, so no estimator or runtime setting changes. The guide now states that calibration limit explicitly. Raw plan verification: [[sources/runs/2026/09/2026-09-22-speed-tables-planner-review]].
