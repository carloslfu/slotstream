---
type: community-report
id: 01m21s4mvn263gc7fcyvd7jekk
created: 2026-09-09T00:30:00.053438+00:00
updated: 2026-09-09T00:30:56.914826+00:00
summary: 'Measured: MacBook Air, Apple M5, 32 GB'
captured_at: 2026-09-08
machines: '[[records/machines/macbook-air-m5-32gb]]'
reporter: arczhi
title: 'Measured: MacBook Air, Apple M5, 32 GB'
url: https://github.com/carloslfu/slotstream/issues/12
---
Issue opened 2026-09-07T09:51:46Z; captured 2026-09-08.

The following issue body and comments are preserved verbatim from the
GitHub response. Numbers and interpretations inside them are the authors' reports.

## Original issue body

### Mac

MacBook Air M5 2026

### Unified memory

32GB

### SSD

1T

### macOS version

26.6.2

### slotstream --version

0.2.11

### Memory plan

```text
device: 34 GB RAM
target: 22.0 GB total for this process
cache: ~75 of 512 experts per layer
pool: 10.0 GB
prefill chunk: 2048 tokens
estimated warm decode: ~9 tok/s
estimated prefill: ~205 tok/s
max context: 65516 tokens
```

### Cold generation

```text
The standardized cold generation completed with one fresh process:


-- prefill 29 tok in 5.84s (5.0 tok/s)
-- prefill split: io 2.39s + scatter 0.00s + compute 3.45s | 4781 records (13.2 GB, 5.5 GB/s)
-- decode 128 tok in 19.38s (6.60 tok/s)
-- decode split: io 7.25s + scatter 0.09s + compute 12.04s | 12817 records
-- expert cache ~89/512 experts per layer, hit rate 0.791 | ngram rows 32h/2016m | peak 15.7 GB | total 25.2s


The cold run used a short 29-token prompt, so its prefill rate is not comparable to the 8192-token context-check result.
```

### Warm decode

```text
Three identical requests were sent to one running server with the same 22 GB plan:


request 1: decode 6.29 tok/s, prefill 8.89 tok/s, total 23.50s
request 2: decode 6.28 tok/s, prefill 10.06 tok/s, total 23.16s
request 3: decode 6.22 tok/s, prefill 10.04 tok/s, total 23.38s


The third request is the warm result: **6.22 tok/s**. The three-request average was 6.26 tok/s.
```

### Long prompt

```text
Command:


slotstream context-check \
  --model .slotstream/models \
  --memory-gb 22 \
  --vision off \
  --mtp off \
  --tokens 8192 \
  --sample-footprint \
  --json


Raw output:


{"aborted":null,"completed":true,"decode_tokens":1,"fits":true,"footprint_samples":3290,"passes":[2048,2048,2048,2048],"peak_observed_gb":20.582141672,"peak_rss_gb":17.754754792,"plan_expected_peak_gb":20.999980288,"prefill_chunk":2048,"prefill_seconds":64.8707000017,"prefill_tok_s":126.281973215,"prefill_tokens":8192,"sample_interval_ms":20,"sampled_footprint_peak_bytes":20582141672,"tokens":8192}


Result: the 8192-token prompt completed in 64.87s at 126.28 tok/s, fit within the plan, reached a sampled physical-footprint peak of 20.58 GB, and reached a process RSS peak of 17.75 GB.
```

### Notes

This is **INCREDIBLE**  project which made me to run a 125B model locally ! Thanks Bro.

### Listing

- [x] You may add this row to docs/HARDWARE.md credited to my GitHub handle.

## Comment by @carloslfu

2026-09-08T14:37:29Z · https://github.com/carloslfu/slotstream/issues/12#issuecomment-5586869547

love it! thanks!!
