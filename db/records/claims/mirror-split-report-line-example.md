---
type: claim
id: 01m2s5pv9rprq78znbq67gqsw3
created: 2026-09-18T06:25:00.000000+00:00
updated: 2026-09-18T06:25:00.000000+00:00
summary: The sample mirror-split report line in docs/CLI.md is transcribed from a recorded run, not invented
basis: measured
gate: none; the line is sample output, so nothing in the build reproduces it
needle: '-- mirror split: --model 61.80 GB (71.4%), --mirror #1 24.70 GB (28.6%) over the whole run'
supported_by:
- '[[records/measurements/mirror-reads-across-two-disks-2026-09-18]]'
surfaces: docs/CLI.md
title: The sample mirror-split line comes from a recorded run
status: current
---
Sample output in documentation is still a set of public numbers, so it gets a
claim. This line is the first mirrored round of the A/B verbatim: 61.80 GB served
by the copy at `--model` and 24.70 GB by the copy at `--mirror #1`, 86.50 GB
together. That total is much larger than the 18.1 GB of prefill reads and
23.1 GB of decode reads the same report gives, and the wording "over the whole
run" is why: the phase counters attribute only what was read during their own
phase, while the mirror counter sits on `Checkpoint.readRouted`, the single
routed path every checkpoint read passes through, so it also counts the reads
made before the first token. The run was not measured finely enough to say how
the remainder divides.

The percentages in the line are the same quantity as
[[records/claims/mirror-internal-disk-serves-29-percent]] measures, taken from one
round rather than across the three, which is why the line reads 28.6% where the
prose rounds to "about 29%".
