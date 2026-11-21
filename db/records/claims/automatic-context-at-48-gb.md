---
type: claim
id: 01m2tmnkaxse2vcfrydkfh8nw5
created: 2026-09-18T16:12:53.469274+00:00
updated: 2026-11-21T11:19:23.120093977+00:00
summary: Automatic context preserves unmeasured cache at the simulated 48 GB tier
basis: derived
gate: Tools/planner_gates.sh; Tools/context_proxy.swift C23
needle: 32,768 at 48 GB
supported_by: '[[records/measurements/memory-budget-context-policy-2026-09-18]]'
surfaces: docs/HARDWARE.md, llms.txt, docs/API.md, docs/HERMES.md
title: Automatic context preserves unmeasured cache at the simulated 48 GB tier
status: withdrawn
---


Withdrawn on 2026-11-21: with retained conversations charged inside the active context, auto takes 131,072 tokens at the simulated 48 GB tier ([[records/claims/automatic-context-at-48-gb-131072]], [[records/measurements/retention-shares-active-capacity-2026-11-21]]). A cache above the measured decode range is still preserved, now shown at 52 GB.
