---
type: run
id: 01m8cqzwbek6htbarg2974xcwr
created: 2026-11-26T20:15:45.006349437+00:00
updated: 2026-11-26T20:15:49.930129026+00:00
summary: 'slotstream doctor on main d30ee840 and PR #145 at the real-Mac device readings and the simulated tiers, with and without the draft head'
binary: main d30ee840 f562e5725cf7c275b5dd2a41ba1f343b424855e5b6a0988adcb20cc62458c4b9; pr e744ac2d def51dcfd32e8d4e7fbb42c953ddec6f59ae6c452a2db810ecf5ce9977d1c53d
captured_at: 2026-11-26
command: python3 2026-11-26-real-mac-automatic-plans.py; it runs slotstream doctor --json per build, tier, reading and draft-head setting
discarded: 'false'
machines: '[[records/machines/mac-mini-m4-32gb-three-copies]]'
title: Automatic plans at real-Mac device readings
tool: slotstream doctor
---
[2026-11-26-real-mac-automatic-plans.json](2026-11-26-real-mac-automatic-plans.json) is the raw output (SHA-256 `fc9e7ae7602d98d823e494d6610489f684f575a72eef5cc91c4d525338b9f68d`) of [2026-11-26-real-mac-automatic-plans.py](2026-11-26-real-mac-automatic-plans.py).

Two release builds: `main` at `d30ee840` and `pr` at `e744ac2d`, the PR #145 head. Each ran `slotstream doctor` with no model memory in use, on four tiers and two readings per tier:

- real: the device readings the planner gates use for a real Mac of that size: `--sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5`, `25.8 / 18 / 21`, `34.4 / 25.8 / 29` and `51.5 / 40.2 / 44`.
- simulated: `--sim-ram 16`, `24`, `32` and `48`, which the planner treats as that many decimal GB with a 75% working set.

Each pair ran with the draft head available and with `--mtp off --vision off`. Every row records the automatic window, the experts per layer of the chosen plan, the target, whether speculative decoding is on and streamed, and the reason given for every candidate window.
