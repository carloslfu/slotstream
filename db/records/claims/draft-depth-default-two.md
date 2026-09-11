---
type: claim
id: 01m27vcffajt5cjah1x0329qe8
created: 2026-09-11T09:04:40.426147+00:00
updated: 2026-09-11T09:13:46.732026+00:00
summary: The adopted speculative draft-chain default is two tokens
basis: derived
gate: slotstream-checks --tier t0 --filter adaptive-speculation-policy
needle: default 2
supported_by: '[[records/measurements/draft-depth-two-default-2026-09-11]]'
surfaces: README.md, docs/CLI.md, docs/ENGINEERING.md, llms.txt
title: Speculative draft depth defaults to two
status: current
---
The code-defined operating default is two draft tokens when MTP is enabled. `Generator.defaultDraftDepth` owns the value, `resolveDraftDepth` preserves valid 1...16 overrides and falls back for absent/invalid values, and CLI help interpolates the same constant. This is a configuration claim, not a claim of a universal speed optimum. The user adopted the choice in [[records/decisions/draft-depth-defaults-to-two]] after [[records/measurements/mtp-depth-auto40-multitasking-2026-09-11]].
