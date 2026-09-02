---
type: measurement
id: 01m2xju1b7c8m6qu9r3l8i5h2
created: 2026-09-02T22:21:19+00:00
updated: 2026-09-02T22:21:19+00:00
summary: 'Tool-calling branch (PR #2) first build and live gates on a second machine: batteries green but the machine-dependent mtp-parity gate; the 4-bit MoE emits well-formed tool calls and loops.'
date: 2026-09-02
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m3-max-48gb]]'
milestone: tools
order: '660'
runs:
- '[[sources/runs/2026/09/2026-09-02-verify-tools-branch-macbook-pro-m3-max]]'
- '[[sources/runs/2026/09/2026-09-02-live-tool-gates-macbook-pro-m3-max]]'
- '[[sources/runs/2026/09/2026-09-02-tools-block-cost-macbook-pro-m3-max]]'
title: 'Tool-calling branch: first build, live gates, and costs (2026-09-02)'
status: measured
---

The tool-calling PR (jasen215, `8fe6e65`) had never been compiled when it
landed. Cherry-picked onto current main (resolving three seams against the
newer context-policy and keep_alive work), then integrated with main's
validator architecture, which the raw PR contradicted: main's no-op set
still rejected every non-empty `tools` request, and `tools`/`tool_choice`
were missing from the OpenAI allowed-field set, so the PR's parser would
have been dead code on `/v1/chat/completions`. Fixed, plus a streaming
correctness bug in the PR's `ToolStream`: it tracked emission position in
Characters, which go stale when an appended scalar merges into the previous
grapheme — streamed emoji lost the variation selector that the non-streamed
path kept. Rewritten on UTF-8 byte offsets with a held-back tail so a
`<tool_call>` tag split across deltas never leaks into content.

**Verification (first ever for this branch).** Full battery: 275 pass,
1 fail — the fail is `mtp-parity`, which the 0.2.2 release binary fails on
the same machine with byte-identical numbers, and which persists after a
local fixture regeneration per the documented recipe; dispositioned as
pre-existing machine-dependent mlxbf kernel drift (the PR touches no MTP
code; behavioral MTP gates pass). Robustness suite 73/0 including seven new
tool-calling cases on both endpoints.

**Does the model do tools?** Yes, surprisingly well at 4-bit: format gate
4/4 (right tool choice among two, valid typed enum argument, no call when
unneeded) and a complete tool loop with the payload incorporated into the
final answer. Prefix-cache extend hits engage across loop turns. Cost of
announcing tools: 311 prompt tokens for two schemas (~150 each), ~2.4 s of
extra first-turn prefill at this machine's standing plan.

**Open for upstream:** the mtp-parity gate needs a per-machine fixture
regeneration story; the battery's TOTAL_WEIGHT_BYTES constant assumes the
24-file manifest even when the optional 25th file is installed (made
draft-head-aware locally).
