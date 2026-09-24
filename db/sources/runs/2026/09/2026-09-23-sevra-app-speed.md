---
type: run
id: 01m36jm9f34zgk9d7xc9hxevt4
created: 2026-09-23T07:28:06.627415+00:00
updated: 2026-09-23T07:28:07.298739+00:00
summary: Actual Sevra development-app speed and MTP diagnostic
binary: 0d780f879331f23cd7ede9301047a00e3e811e3ad1ae2450138ac4aa92419624; comparison bbdfcaffa8959ac1ca3e39d1f804cc4491aaa98dd8f649d5f239713a6ba10499
captured_at: 2026-09-23
command: Native composer; measure_app.py; slotstream mtp-bench --memory-gb 33 --vision off --max-context 32768 --max-tokens 192 --pairs 3 --arms plain,spec
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Actual Sevra development-app speed and MTP diagnostic
tool: Actual native app, authenticated sevra-local client, native memory probe and installed mtp-bench
---
The running native app was exercised in a new synthetic test conversation. The first request was submitted through the native composer, the remaining three through its authenticated local client into the same app-owned runtime. No second inference process ran beside it. All requests completed and their metrics remained visible in the app. The test conversation used no remembered facts, excerpts or tools.

[Capture](../../../artifacts/sevra-app-speed-2026-09-23/capture.tar.gz), [file manifest](../../../artifacts/sevra-app-speed-2026-09-23/manifest.json). Archive SHA-256: `ecfa50f2b611efca4e1057818d457422a650d42108cddcadc46bd23167c3bf05`. Every archived file was read back and checked against its manifest. The app receipts, synthetic prompts, numeric host observations, exact app build-input hashes, comparison command and stdout are preserved. Unrelated process command paths and the person's original conversation are not in the capture.

App executable SHA-256: `0d780f879331f23cd7ede9301047a00e3e811e3ad1ae2450138ac4aa92419624`. The bundle manifest was written September 21 at 14:47 local time. Its embedded version source hashes to the 0.2.22 declaration, but other source hashes include then-uncommitted work; it must not be described as an exact public v0.2.22 artifact. Twenty-seven recorded build inputs differ from the present working checkout, including engine, prefill, cache and tool-streaming sources. Desktop's Performance.swift and Inference.swift still match their manifest hashes.

The actual app used Automatic, resolved to a 33 GB budget, context 32768, thinking off and the desktop's explicit MTP-off policy. Its three substantive outputs had 258, 304 and 271 tokens. A two-token final answer tests latency, not steady decode speed. Numeric receipts distinguish model load, prompt read, first token and answer generation. The app monitor observed nominal thermal state, low-power mode off, 239 global swap-in pages and no swap-out pages; these timings describe the observed session, not clean benchmark anchors.

For a separate MTP experiment, the app released its model, but its process-lifetime exclusivity lock correctly refused another model process. That refusal is preserved in mtp-comparison.log. The app was then quit normally, with its conversation saved. A fresh preflight measured 39.27 GB reclaimable; the installed v0.2.24 executable ran at a fixed 33 GB target, vision off, 32768 context and 192-token cap. The plain/spec arms share one warmed engine and expert pool, rotating order over three pairs. Both retain the draft head, so this isolates the decode loop rather than comparing two independently allocated app plans.

The three plain rates were 13.53, 13.50 and 13.48 tok/s. Speculative rates were 17.45, 17.69 and 17.18. Each arm repeated its own output exactly, but the arms diverged from token 18. The comparison interval observed 973 global swap-in pages, no swap-out pages, nominal thermal state and low-power mode off. It is marked discarded for clean comparative speed claims; the observed difference is an investigation lead. Peak sampled comparison footprint was 26.69 GB. The process exited zero and was reaped, and the original app was reopened with its settings unchanged.
