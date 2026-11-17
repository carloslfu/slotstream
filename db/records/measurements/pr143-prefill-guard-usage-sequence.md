---
type: measurement
id: 01m7fzpy7m0rk3nj1cgqt7zj30
created: 2026-11-15T16:12:42.100414602+00:00
updated: 2026-11-15T16:12:42.100414602+00:00
summary: 'PR #143: the corrected prefill guard admits a 138240-token usage session the old guard refused'
date: 2026-11-15
doc: measurements
level: '2'
machines: '[[records/machines/mac-mini-m4-32gb-three-copies]]'
order: '1970'
runs: '[[sources/runs/2026/11/2026-11-15-pr143-guard-usage]]'
title: 'PR #143: the corrected prefill guard admits a 138240-token usage session the old guard refused'
status: measured
---
The prefill guard refuses a request when its estimated peak exceeds the memory still available. Before PR #143 it charged a full copy of every sequence buffer whenever a buffer grew. PR #143 makes the charge match how the buffers are actually replaced: `62fb305c` charges a full copy only while the live buffers alias a retained checkpoint, and `53f3fa58` charges regrowth as every buffer's growth plus the largest old buffer alive during its copy. `200fb398` also prices unfused prefill attention at the BF16 width MLX allocates instead of two fp32 copies.

The comparison runs one usage sequence on release builds of `db0f6c8c` (the wired limit with the old guard), `53f3fa58` (both sequence-charging fixes) and `200fb398` (the PR head) on [[records/machines/mac-mini-m4-32gb-three-copies]]: `--memory-gb 27 --max-context 138240`, MTP and vision on, three copies, 2968 expert slots, 256-token prefill passes and a disk prefix cache. After an image request, one main conversation starts at 100027 tokens and grows by about 4096 tokens per turn to 124878, with two side conversations, a side follow-up and a title request in between. The last main turn (126986 tokens) asks for a long reply, and a fresh process then restores 126976 of its tokens from disk and replays it. Raw requests, responses, manifests and server logs are in [[sources/runs/2026/11/2026-11-15-pr143-guard-usage]].

| Build | Outcome | Highest phase peak | Swapouts | Swapins |
|---|---|---:|---:|---:|
| `db0f6c8c` | refused the third main turn (108310 tokens, 4374 to prefill): required 10412284006 bytes, available 10313596928 | 21.20 GB before the refusal | 0 | 0 |
| `53f3fa58` | the image request, all 12 sequence requests and the disk-restore replay complete | 25.64 GB | 20 | 0 |
| `200fb398` | the image request, all 12 sequence requests and the disk-restore replay complete | 25.53 GB | 0 | 0 |

Peaks are the server's per-phase physical high-water marks; the highest is the long-reply turn in both completed runs. Swap counts are global `vm_stat` deltas over each run; the 20 swapouts are 0.33 MB. In both completed runs the long reply decodes 299 tokens and ends on its own, and the restarted process restores 126976 tokens and prefills 10.

The old guard's refusal is a false refusal: the same request on the same machine and plan runs under the corrected guard, and the run's highest peak, 25.64 GB, stays inside the 27 GB target. This record does not separate the two sequence-charging fixes, because `53f3fa58` carries both. The BF16 pricing in `200fb398` changes no outcome in this sequence. This is one machine and one workload; it shows that the corrected guard admits a realistic long session that the old guard refused, and that the admitted session stays inside its target.
