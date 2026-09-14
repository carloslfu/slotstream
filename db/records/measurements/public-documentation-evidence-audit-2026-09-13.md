---
type: measurement
meta-type: conclusion
id: 01m2dkvr1yd4rsc7rmd83h2fy2
created: 2026-09-13T14:48:38.718039+00:00
updated: 2026-09-13T16:42:28.626985+00:00
summary: 'Public documentation audit: correct performance, memory, simulation and release scope; no new benchmark'
date: 2026-09-13
doc: measurements
level: '2'
order: '1380'
runs: '[[sources/runs/2026/09/2026-09-13-public-docs-audit-plans]]'
title: Public documentation evidence and scope audit
status: analysis
---
This is a documentation and evidence-scope audit, not a new model benchmark
or a release qualification. It follows the README memory-tier correction in
[[records/measurements/c2-macbook-pro-m5-max-128gb-community]].

## Scope and evidence

Read README.md, all Markdown guides under docs/, llms.txt, CONTRIBUTING.md,
SECURITY.md and the current release-preparation notes. Checked the related
claims, supersession notes, planner and context accounting, vision admission,
CLI behavior, package/build instructions and published release metadata.
Generated MEASUREMENTS.md and PLAN.md remain projections of the canonical
records; historical source/run bytes and past release entries are preserved.

[[sources/runs/2026/09/2026-09-13-public-docs-audit-plans]] captures the exact
binary identity, eighteen default/larger-context simulations and the latest
published release at audit time. They are planner observations only. The
working tree concurrently contained unrelated source edits, so neither these
observations nor the planner gates qualify those edits.

## Corrections

- Kept the positive same-Mac larger-cache evidence visible. The old flat
  development-Mac number does not establish a larger-memory speed ceiling.
- Labeled prompt-processing waits as M5 Pro-based estimates. They exclude
  startup, queues, image preparation and reasoning before visible answers.
  Near-full requests must leave reply room.
- Distinguished decimal-GB simulations from marketed Mac memory and showed
  that the auto-target/MTP columns use the default window. Recommendations
  are separate simulations whose actual fit depends on available memory,
  Metal capacity, selected context and draft weights.
- Limited the draft-enabled automatic ceiling to its default-context scope;
  larger windows add draft-context charges. The draft activation threshold
  is evaluated before the separate lookahead reservation.
- Corrected image memory on the engineering, Hermes and AI-facing pages:
  auto/total-target plans reserve the tower inside the target; explicit
  pool-size settings preserve the pool and add resident bytes to the expected
  footprint. Both need real headroom and image workspace.
- Clarified that main sequence-cache bytes per allocated token exclude
  recurrent, retained, draft and transient allocations. Manual targets keep
  request-memory safeguards despite disabling automatic resizing.
- Scoped cache equality to fixed generation settings; total-target changes
  may also change prefill or MTP. Labeled the early engine-load figure
  historical and excluded current full-file verification from that timing.
- Scoped queue-depth observations to their historical development-Mac run.
  Preserved the separate attribution study's supported component results
  after checking its newer evidence; they describe tuning prompts, not
  independent held-out improvements.
- Distinguished candidate measurements and prepared version headings from
  a published installer release. Removed the stale unreleased label from
  features delivered earlier.
- Corrected build-versus-T0 network requirements, removed a duplicated
  library paragraph, repaired the stale README memory reference, and
  updated stale contributor activation/plateau language.

The claim records carry the refined scopes. The semantic review requirement
is canonical in [[records/design/measured-operating-policies]] and projected
into CONTRIBUTING.md. It supplements the existing text-match gate.

## Verification and limits

All 73 existing planner gates passed against the available binary, and all
179 claim-to-surface checks passed. A local-link scan found all 160 checked
links and fragments resolvable. Generated-doc parity, full-store validation,
Markdown table-column checks and diff whitespace are checked after the final
edits. The store has two unchanged historical-log warnings; no log history
is rewritten to silence them.

The direct sources support the corrections. This audit did not rerun real
model performance, every client integration or other hardware, and does not
certify a future client/library version. It does not assert that every
possible documentation error has been ruled out. No runtime defaults changed
in this task; no public release or push was performed.

## Follow-up: useful estimates, 2026-09-13

The user requested best-effort estimates after questioning High/Ultra again.
README now presents broad ranges separately from measured configurations.
[[records/measurements/hardware-planning-ranges-2026-09-13]] owns the endpoint
construction and explicitly unmeasured hardware transfers. Installed RAM,
process target and software version have separate measured-table columns.
The hardware guide's allocation table no longer mixes allocation, measured
speeds and larger-cache estimates in the same column. Old section anchors
remain usable. Existing source bytes are unchanged.
