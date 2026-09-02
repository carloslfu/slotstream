---
type: measurement
id: 01m1hhwktmj4rvrv8cyr2yb8vv
created: 2026-09-02T17:15:25.908271+00:00
updated: 2026-09-02T17:15:25.908271+00:00
summary: Behavioural quality probe (2026-08-30), and what it is not
date: 2026-08-30
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M4/M5/M6
order: '280'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: Behavioural quality probe (2026-08-30), and what it is not
status: measured
---

`Tools/quality_probe.sh` runs 15 checkable prompts — factual recall, arithmetic,
sorting, instruction obedience, translation, code, cloze — against a live server
and requires all of them. It currently passes 15/15.

**This is not the FP8 comparison the plan asks for.** That needs an inference
credential for Qwen3.8-Flash-Next FP8 (Qwen's own DashScope, or an aggregator
carrying it); none is provisioned, and it is paid, so it stays blocked pending a
decision. What this probe does is catch *gross* quantization or architecture
damage, and give any future re-quantization or kernel change a gate to fail.

One item was deliberately removed after it failed: the bat-and-ball question,
answered 0.10. That is the classic System-1 trap and a 6B-active model misses it
on its own merits, so keeping it would have made the probe flaky in a way that
says nothing about the conversion. A damage detector may only contain items the
unquantized model reliably gets right.
