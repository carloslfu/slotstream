---
type: run
id: 01m2xjv8c7d2n6qz0b3k8l5h4i
created: 2026-09-02T23:45:00+00:00
updated: 2026-09-02T23:45:00+00:00
summary: 'MTP parity gate fixed (regen-at-gate) and the tools-v1 build installed as the standing LaunchAgent server: bit-exact Swift-vs-Python stage forensics, then full battery 188/0.'
binary: 'local release build of the tools branch at 6006350 (mtp fix), built 2026-09-02 on this machine; installed as /Users/lance/.slotstream/tools/slotstream'
captured_at: 2026-09-02T23:40:00+00:00
command: 'stage dumps: slotstream mtp-parity --dump /tmp/mtp-swift + Tools/reference/make_mtp_fixture.py (patched reference); battery: Tools/verify.sh; standing server: launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.slotstream.serve.plist'
discarded: false
machines:
- '[[records/machines/macbook-pro-m3-max-48gb]]'
title: MTP parity fix and standing-server install, 2026-09-02
tool: manual probes + verify.sh
---

The mtp-parity gate, previously dispositioned as "pre-existing machine
dependence", was resolved forensically instead of waived:

- Stage-by-stage dumps of the Swift head (`mtp-parity --dump`: fuse, x1,
  attnOut, x2, moeOut per step) compared against a stage-dump-patched
  Python reference (same mlx 0.31.1 kernels) are **bit-exact — max abs
  0.00000 on every stage of both steps**, with 100% argmax agreement.
- The stored committed fixture (generated on another machine) disagrees
  with both implementations at identical magnitudes (rel 0.04-0.11), so it
  is the outlier: the MTP layer's sharp attention logits flip near-tie keys
  under cross-machine kernel drift.
- Fix (6006350): verify.sh regenerates inputs + reference locally at gate
  time with the pinned mlx 0.31.1 venv before mtp-parity. The earlier local
  regen failure was traced to an unpinned mlx_lm install that upgraded mlx
  past 0.31.1 (kernel drift, same failure class).
- Clean battery after the fix: 188 pass / 0 fail (mtp-parity PASS at
  0.00000; quality 15/15, reassembly 10/10, tools 7/7, robustness 73/0).

Standing server: the tools-v1 build is installed as LaunchAgent
com.slotstream.serve (RunAtLoad + KeepAlive, Interactive) serving 11434
with the auto memory plan. Live probe: OpenAI tool call with typed args
({"city":"Paris"}) and finish tool_calls; Ollama think split clean. The
metal library must sit next to the binary (cp Tools/lib/mlx-0.31.1.metallib
~/.slotstream/tools/), else the agent respawns on "Failed to load the
default metallib". Rebuild provenance in ~/.slotstream/tools/README.md;
stop before battery runs with launchctl bootout.