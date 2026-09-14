---
type: claim
id: 01m2djq8q1qy27npgezb1nwtkg
created: 2026-09-13T14:28:43.361532+00:00
updated: 2026-09-13T14:28:43.361532+00:00
summary: 'M5 Max community report: 31.5 tok/s at a 73 GB target'
basis: measured
gate: none
needle: ~31.5 tok/s
supported_by: '[[records/measurements/c2-macbook-pro-m5-max-128gb-community]]'
surfaces: README.md, docs/HARDWARE.md
title: 'M5 Max community report: 31.5 tok/s at a 73 GB target'
status: current
---
The same 128 GB M5 Max reported ~31.5 tok/s on Slotstream 0.2.3 with
`--memory-gb 73` and speculative decoding enabled. The value is an
approximate warm-speed summary from the reporter's follow-up in issue #6,
whose exact text is preserved by the linked measurement's source.

The target is a total-process budget in decimal GB, not installed RAM or an
observed memory peak. It is a manual setting, not auto. Do not generalize
the result to every Mac in its memory tier or re-label it as 0.2.16 performance.
The manual sweep lacks per-run repeated timings and has not been independently
rerun. No measured long-prompt speed, context qualification or footprint
bound follows from this claim.
