---
type: run
id: 01m1srcqk15dxhs6jqjxfgr7gg
created: 2026-09-05T21:43:00.959354+00:00
updated: 2026-09-05T21:43:44.419990+00:00
summary: Completed 65,520-token prompt exceeds a plan that still priced the default context
binary: Slotstream 0.2.7; exact SHA-256 in body
captured_at: 2026-09-05
command: Exact command in body
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Hermes long-context first counterexample
tool: slotstream context-check
---
# Hermes context qualification: first counterexample

The installed release read the complete synthetic prompt and generated its one-token reply. This run tests capacity, not long-context answer accuracy. Its reported `fits: false` is preserved: the diagnostic used a plan for the default context then changed the engine's limit. Extra active-context state was not charged before sizing the pool. The process stayed below the requested total target but exceeded the announced expected peak. A qualified larger served window needs planning with the requested context before allocation and another real measurement.

Command (the installed binary and local checkpoint):

```sh
~/.slotstream/bin/slotstream context-check --model ~/.slotstream/models/qwen38-flash-next-mlx-4bit --memory-gb 10 --vision off --mtp off --tokens 65520 --json
```

Binary version: 0.2.7. SHA-256: `3f7860883f0ae4e2e1559edb61d7e032f3de330bd960d1ac6e2577e94028a4b7`. Release source: `b88fdb2cf1f4070c838bccac59911ad2625d25bb`.

One model process ran. Reclaimable memory was checked before launch and the built-in between-pass guard did not abort. A source build and model-free checks ran during prefill, so the duration/rate is excluded from throughput claims. This evidence records the completed length and per-process peak counterexample; it does not qualify a production memory plan or a performance estimate. No cache purge or memory-pressure injection was used.

## Exact stdout

```json
{"aborted":null,"fits":false,"passes":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,240],"peak_rss_gb":9.3578570400000007,"plan_expected_peak_gb":8.9994969600000001,"prefill_chunk":256,"prefill_seconds":977.15380597114563,"prefill_tok_s":67.051880266569555,"prefill_tokens":65520,"tokens":65520}
```

## Exact stderr

```text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (31.4 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.7s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
```
