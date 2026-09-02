---
type: run
id: 01m1htchazp80vnrsyhfs8ktp8
created: 2026-09-02T19:43:56.255116+00:00
updated: 2026-09-02T19:43:56.255116+00:00
summary: context-check --tokens 8192 --memory-gb 16 --json, sweep and 0.2.2 code, dev Mac, 2026-09-02
binary: 'sweep: local release builds of e09bcac plus the sweep (Sources exported to a scratch tree; n2b, then n2d = the shipped code); baseline: local release build of e09bcac'
captured_at: 2026-09-02
command: slotstream context-check --tokens 8192 --memory-gb 16 --json
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: context-check --tokens 8192 --memory-gb 16 --json, sweep and 0.2.2 code, dev Mac, 2026-09-02
tool: context-check
---
## ctx16_new.json

```json
{"aborted":null,"fits":true,"passes":[1024,1024,1024,1024,1024,1024,1024,1024],"peak_rss_gb":13.216272224000001,"plan_expected_peak_gb":14.999033087999997,"prefill_chunk":1024,"prefill_seconds":53.749498009681702,"prefill_tok_s":152.4107257434182,"prefill_tokens":8192,"tokens":8192}
```

## ctx16_base.json

```json
{"aborted":null,"fits":true,"passes":[1024,1024,1024,1024,1024,1024,1024,1024],"peak_rss_gb":13.11080832,"plan_expected_peak_gb":14.999033087999997,"prefill_chunk":1024,"prefill_seconds":127.67141103744507,"prefill_tok_s":64.164717327337655,"prefill_tokens":8192,"tokens":8192}
```

## ctxfin_new.json

```json
{"aborted":null,"fits":true,"passes":[1024,1024,1024,1024,1024,1024,1024,1024],"peak_rss_gb":13.174820656,"plan_expected_peak_gb":14.999033087999997,"prefill_chunk":1024,"prefill_seconds":52.931633949279785,"prefill_tok_s":154.76567392288982,"prefill_tokens":8192,"tokens":8192}
```

