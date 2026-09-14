---
type: claim
id: 01m2dvvtvbqcynd9497yf9v1d2
created: 2026-09-13T17:08:30.187237+00:00
updated: 2026-09-13T17:08:30.187237+00:00
summary: A larger automatic window may add at most 10% to a typical request
basis: derived
gate: Tools/context_proxy.swift case C23
needle: at most 10%
supported_by: '[[records/measurements/automatic-context-window-plans-2026-09-13]]'
surfaces: docs/HARDWARE.md, docs/CLI.md, llms.txt
title: A larger automatic window may add at most 10% to a typical request
status: current
---
An operating choice, not a measurement: a larger automatic window may add at most 10% to the planner's estimated time for 2,000 prompt tokens and a 400-token reply against the 32,768-token plan (`ContextPolicy.automaticRequestTimeTolerance`). It admits 65,536 tokens at 36 GB, which costs 8.9%, and rejects 131,072 on the development Mac at 10.4% ([[records/measurements/automatic-context-window-plans-2026-09-13]]).
