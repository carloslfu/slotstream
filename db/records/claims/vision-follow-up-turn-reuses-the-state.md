---
type: claim
id: 01m1mtw5vwxgwpmxqg1rrq6v01
created: 2026-09-03T23:50:12.092082+00:00
updated: 2026-09-03T23:50:12.109889+00:00
summary: A follow-up turn about the same picture takes 1.8 s where the first took 15.4 s
basis: measured
gate: Tools/vision_serving.py asserts the follow-up is under 70% of the first
needle: 15.4 s
supported_by: '[[records/measurements/v1-the-vision-tower-cost-and-correctness-2026-09-03]]'
surfaces: README.md
title: A follow-up turn about the same picture takes 1.8 s where the first took 15.4 s
status: current
---
Measured at `--memory-gb 10` on the dev Mac (V1): the prefix cache hands over the state built for the picture, so the tower does not run again and prefill reads only the new text. The absolute numbers are one machine at one cache size; the ratio is the claim.