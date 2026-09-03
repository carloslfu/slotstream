---
type: run
id: 01m2xjs9u5x1m4oszy7p0j6f3g
created: 2026-09-02T22:21:19+00:00
updated: 2026-09-02T22:21:19+00:00
summary: 'Live tool-calling gates against the tools-branch server on the pinned 4-bit checkpoint: format quality 4/4, full tool loop pass, prefix-cache extend hits across loop turns.'
binary: 'local release build of the tools branch, built 2026-09-02 (same build as the verify.sh run record)'
captured_at: 2026-09-02T21:40:00+00:00
command: 'python3 /tmp/ss_toolgate.py (script reproduced in sources/notes; server: slotstream serve --port 11477 --memory-gb 12 --no-elastic)'
discarded: false
machines:
- '[[records/machines/macbook-pro-m3-max-48gb]]'
title: live tool-loop gates, tools branch, 2026-09-02
tool: manual probes
---

The Phase 0 question — can the 4-bit MoE emit well-formed tool calls —
answered through the real server path (parsed `tool_calls`, not raw text):

- Format quality 4/4 at temperature 0: picks the right tool among two
  (get_time vs get_weather), emits a valid typed enum argument
  (`{"unit":"c","city":"Berlin"}`), and does not call a tool when none is
  needed (finish stop, content `4`).
- Full loop: assistant tool_calls -> tool role result -> final answer
  incorporating the tool payload ("It's currently **2:32 PM** in Paris"),
  finish stop, no spurious calls. First leg 23 s (cold 12 GB plan), second
  leg 31 s.
- Prefix cache: counters show genuine extend-only hits across loop turns
  (hits 0->2 over the runs, held state grows with the conversation);
  identical resend misses by design, as documented.

Leg-2 first attempt read FAIL only because the probe asserted a literal
"14:32" while the model correctly localized the payload to 2:32 PM; the
assertion was fixed and the gate passes.
