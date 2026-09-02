---
type: measurement
id: 01m1hhwkxk7j25jmqxrvfh4sf3
created: 2026-09-02T17:15:26.003167+00:00
updated: 2026-09-02T17:15:26.003167+00:00
summary: 'Adversarial review of the serving layer (2026-08-29): 0.1.5'
date: 2026-08-29
doc: measurements
level: '3'
machines:
- '[[records/machines/macbook-pro-m5-pro-48gb]]'
milestone: M4/M5/M6
order: '330'
source: '[[sources/docs/2026/09/measurements-md-2026-09-02]]'
title: 'Adversarial review of the serving layer (2026-08-29): 0.1.5'
status: measured
---

An end-to-end adversarial pass over the whole system. The numerical core came
through clean; the serving layer did not. Everything below was reproduced
against a running server before it was fixed, and each case is now a gate in
`Tools/api_robustness.sh`.

**Held up under attack.** The acceptance battery genuinely passes (re-run, not
taken on trust). Weight provenance over all 103.8 GB, layer parity against the
Python reference, cache-size and live-resize byte-equality, and the
`--memory-gb` promise all hold. `MoELayer` matches the reference block line for
line. The slot-pool floor survives full 256-token prefill chunks. The planner
refuses or clamps every out-of-range knob and explains itself. Parallel
download and resume are exact: after `kill -9` mid-transfer the chunk map
claimed 1,073.7 MB against 1,369.1 MB actually on disk — under-promising by the
in-flight partials, which is the safe direction — and the resume continued from
those chunks rather than restarting. Multi-source fallback works (HF answers
401 for a missing repo, the file moves to the next base). Preallocation is
genuinely sparse: 103.8 GB apparent, 3.3 MB on disk.

**Three inputs killed the process.** No SIGPIPE disposition was ever set, so a
client vanishing mid-stream terminated the server with signal 13 — which also
meant the `alive` flag threaded through every streaming handler was dead code,
since `write` could never return `-1`. `"seed": -1` trapped in `UInt64(v)`, and
`"num_predict": -1` trapped forming `0 ..< -1`; both are Ollama's *documented*
defaults for "random seed" and "generate until EOS". Fixed by ignoring SIGPIPE
(plus `SO_NOSIGPIPE` per socket), and by clamping every sampling knob in one
place, `SampleParams.sanitized()`.

**Streaming silently corrupted some responses.** A reply beginning with a
character whose UTF-8 spans several tokens lost its opening: asking for five
emoji returned `🚀🔥⭐❤️🌳` unstreamed and `⭐❤` streamed, on all four streaming
surfaces. The incremental detokenizer cleared its token list whenever nothing
had been emitted yet — exactly the state a leading emoji is in while it waits
for the token that completes it. The first fix exposed a second, subtler bug:
diffing decoded text by `Character` drops a scalar that merges into the
grapheme cluster already sent, so `❤️` streamed as `❤` (the U+FE0F variation
selector vanished). The diff is now scalar-exact.

**The sampler had an unguarded 0/0.** Any filter that empties the candidate set
— `top_p` at or below 0, `min_p` above 1 — made `probs / probs.sum()` produce
NaN, after which the server emitted token 0 forever (`!!!!!!`). The
normalization is gone: the uniform draw is scaled by the unnormalized CDF total
instead, which removes the division and, because `u < 1`, also removes the
float-tail case where every CDF entry compared below `u` and the pick ran off
the end onto a zero-probability token.

**Two limits were missing.** There was no context cap at all, and the memory
plan does not model KV growth: a 7,960-token prompt peaked at 8.3 GB against a
7.9 GB plan, and under `--memory-gb 8` it reached 7.9 GB, consuming almost the
entire 0.5 GB planning margin. KV plus indexer state costs **27.0 KiB per
token** (12 QSA layers x [2 x 2 heads x 256 dims x 2 B] + 12 x 128 x 2 B), so
32k tokens would add 0.91 GB and break the promise outright. Prompts are now
capped at 32,768 tokens (`--max-context`) and refused with a 400. Separately,
the connection handler had no read timeout and one thread per connection: 300
idle sockets produced 314 threads. Reads now time out, connections are capped
at 64, and request bodies are bounded like headers already were.

**QSA indexer, previously untested past its budget.** A 7,960-token prompt with
the answer planted in the first sentence retrieved it correctly, so the sparse
path is exercised end to end for the first time. It also priced the naive
prefill honestly: **30 to 32 tok/s**, i.e. about four minutes to first token at
8k. That, not memory, was what made long contexts impractical — see the next
section, which sized the prefill pass from the memory plan and took it to
92 tok/s (about 90 s at 8k).

**The load path, found by asking "is anything missing?".** The first pass
concentrated on the request path and waved the checkpoint reader through
because the weights are hash-verified. That was the wrong test: `--model`
accepts any directory. Pointing it at a directory with no safetensors, with a
corrupt header, or with another model's tensors each trapped (exit 133) after
printing the memory plan. `serve` on a port already in use — running it twice,
the single most likely operator mistake — loaded the entire model and *then*
hit `fatalError("bind failed")`; it now fails in 0.03 s with a sentence naming
the fix, because the port is claimed before the model loads. `--max-context 0`
was validated after the load too. `posix_memalign` failing in the expert read
path was a force-unwrap. And `pull --verify` used `attributesOfItem`, which
does not follow symlinks, so a model directory of symlinked weights reported
all 24 files corrupt and sent the user into a 104 GB re-download. Each of these
is now a gate in `Tools/planner_gates.sh`, which needs no weights.

**Smaller things corrected.** `/api/version` reported 0.1.0 from a hard-coded
string (now one constant, checked against the binary in CI); `/api/tags`
reported a weights size 23.3 MB off the manifest (now read from it); the
planner's floor was described as 14 experts/layer in every user-facing message
while being 13.3 (640/48), with one `doctor` screen printing both; `Geometry`
carried a comment claiming it was "validated against config.json at engine
init" when no such check existed (now `Geometry.check` runs in
`Qwen4ExpModel.validate`); the n-gram row-cache counters were never reset, so
they accumulated across every request in a `serve` process; `IndexerCache`
re-concatenated the whole cache each token where `KVCache` next to it grows in
blocks; the safetensors header length was read with an alignment-requiring
`load`; the GatedDelta kernel guarded `Dk % 32` but not the `Hv % Hk` ratio it
also assumes; `SS_DEBUG_LAYER` was read from `ProcessInfo` 48 times per token;
and in `pull`, the periodic map flush could `fsync` and rewrite the map of a
file whose descriptor the finishing path had already closed.

Also fixed for compatibility, each now a gate: `stop` sequences were accepted
and ignored, OpenAI array-form message content was silently dropped, an empty
prompt sampled a first token from an uninitialized tensor, malformed JSON
returned 500 "chat template failed", `HEAD` returned a body, `/api/generate`
omitted `prompt_eval_duration`, and `done_reason`/`finish_reason` was always
"stop" even when the run hit the token limit.

**Deliberately not changed.** The presence penalty is applied before the
temperature division, which matches HuggingFace's processor order; the
consequence is that API `temperature: 0` is argmax over *penalized* logits
while CLI `--greedy` zeroes the penalty, so the two are not identical by
construction. Attempts to make them diverge on real prompts did not succeed.
Unknown model names are still accepted rather than 404'd: one model exists and
its name is advertised in `/api/tags`, so leniency costs nothing.
