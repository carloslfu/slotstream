# Changelog

What each release changed, newest first. `curl | sh` installs the latest
release; anything under **Unreleased** is on `main` only.

## Unreleased

- **The model reads images.** The checkpoint has always carried a vision tower
  — 333 `vision_tower.*` tensors the weight loader skipped by name — and the
  chat template has always rendered an image part to `<|image_pad|>`. Now the
  tower runs and its rows are spliced under those placeholders, on every
  dialect: Ollama's `images` array on `/api/chat` and `/api/generate`, OpenAI
  `image_url` parts, AI-SDK `file` parts on the fx gateway (whose catalogue now
  advertises the `vision` tag), and `slotstream run --image`.

  Based on [#10](https://github.com/carloslfu/slotstream/pull/10) by
  [@msx98](https://github.com/msx98), whose port of the tower and, in
  particular, whose prefix-cache design — keying each placeholder run on a
  digest of the image's bytes, because every image expands to a run of the same
  token id — are the load-bearing parts of this.

  Reworked before landing: the tower's attention goes through
  `MLXFast.scaledDotProductAttention` with a per-block `eval` (written out, it
  materialized a float32 `[16, N, N]` score matrix twice per block — 5.4 GB
  each at the largest image); the splice is a concatenation of contiguous spans
  on the GPU rather than a scalar loop over a CPU copy of the hidden state, and
  can no longer disagree with itself about how many rows it was given; image
  sources are inline bytes only, where the previous fallback to
  `Data(contentsOf:)` would fetch an arbitrary host or read a local file
  through `file://`; the tower loads under the generation lock and only when
  the machine can spare it, and `serve` announces its 0.9 GB rather than taking
  it silently against a printed plan that did not include it.

  Gated: `vision-check` (59 weights-free assertions — the reference
  processor's geometry, the source policy, run clipping, request shaping),
  `Tools/vision_ref.py` (the tower against an independent float32
  implementation of the reference, inside the band bfloat16 itself spans),
  `Tools/vision_serving.py` (18 assertions over every dialect, against a real
  server, requiring the model to name what is in the photograph), plus a
  vision leg in `mtp-check` and six image cases in `api_robustness.sh`.

- **The request body cap is 32 MiB**, up from 4 MiB, so a base64 picture fits;
  the largest image accepted is 24 MiB decoded. The robustness suite's oversize
  probe moved with it — at 9,999,999 bytes it had silently stopped testing
  anything.

## 0.2.6 — 2026-09-03

- **An optional string in a tool schema is no longer read as a number.** fx
  writes an optional parameter as `anyOf: [{"type":"string"},{"type":"null"}]`,
  and three of the five required fields on its `terminal` tool are declared that
  way. Typed as an unknown union, the coercion took a numeric-looking value at
  face value, so a command or working directory like `2024` would have been sent
  as the integer 2024 and rejected. A union of exactly one real type plus null
  now resolves to that type; a genuine two-type union stays conservative. Found
  by capturing fx's real schemas off the wire rather than from a fixture.

## 0.2.5 — 2026-09-03

- **Fixed: a JSON null anywhere in an fx request failed the whole turn.** The
  chat-template bridge throws on `NSNull` and maps Swift `nil` to null, and the
  gateway dialect handed it `NSNull`, so a single `"default": null` inside one
  of fx's tool schemas — or a null for an unset optional argument in a replayed
  tool call — returned `400 template_error: Cannot convert value of type NSNull
  to Jinja Value` with no output at all. fx sends both routinely; the failure
  showed up on the first real multi-step task, one turn after a `terminal` call.
  Nulls now cross as an empty Optional, which the bridge degrades to null, so
  they render as `null` and array positions are preserved rather than dropped.
  Gated three ways: a T0 check that no path bridges an `NSNull`, and three live
  scenarios covering a null in a tool schema, in tool-call arguments, and in a
  JSON tool result.

## 0.2.4 — 2026-09-03

- **Decode is about 10% faster at small cache sizes, and the output is
  byte-identical.** `run` now prints a decode split beside the prefill one, and
  it found two things. The pool scatter was 20% of decode time and running at
  about 18 GB/s against a microbenchmark that writes slots at 49 to 75, because
  `SlotPool.ensure` ended every batch with a full GPU sync — 48 per token — that
  the gather in the same layer did not need. And the pool path was reading on
  the sweep's 12 lanes, tuned for long contiguous runs, where a layer's handful
  of nine-piece misses is latency-bound and wants more. Five interleaved rounds
  at 30 experts per layer: 6.93 to 7.63 tok/s, peak 7.5 to 7.8 GB, identical
  text. `SLOTSTREAM_SCATTER_MODE` and `SLOTSTREAM_POOL_QUEUE_DEPTH` are the A/B
  knobs; the sweep keeps its own `SLOTSTREAM_IO_QUEUE_DEPTH` of 12, because
  raising that one measured slower.
- **A pass can be read in query blocks, which bounds the attention transient
  without changing a number.** MLX 0.31.1 runs head dim 256 on its unfused
  attention path, materialising the whole `[24, pass, context]` score matrix;
  splitting the queries bounds it and is bit-identical at blocks of 256 and up.
  It is **off at every size the planner produces today** and engages only above
  the largest query-by-key product any prefill measurement covers — where the
  schedule already shrinks the pass — because measured end to end it lowers peak
  memory by 0.00 GB. The phase trace behind `SLOTSTREAM_MEM_TRACE=1` says why:
  attention, the PLE layer and the MoE sweep peak within 0.6 GB of each other,
  so bounding one alone can never lower the process. Recorded as a null result
  with its mechanism, not as an improvement.
- **M1 is closed, and the answer is that the eviction policy is not the lever.**
  The expert-locality study has been open since the first week: the simulator
  existed, the trace never did, because taking one needs a bounded forward pass.
  `SLOTSTREAM_ROUTER_TRACE` now records every routing decision and
  `Tools/trace_convert.py` feeds `Tools/cachesim.py`. On 220 decode steps at 30
  experts per layer, the shipped CLOCK measured 0.557 against LRU 0.568,
  LFU-decay 0.480, and an offline hot-set bound of 0.603 — so CLOCK stays. The
  same trace fixes the compulsory-miss ceiling for that workload at 0.906 and
  shows 10% of records serving 71% of accesses, which points the remaining work
  at capacity and a warm start rather than at eviction.
- The prefill sweep gathers each staging group's rows as it needs them instead
  of building one replicated copy of the whole pass up front (105 MB at a
  2048-token pass, 210 at 4096). Bit-identical; `sweep-check` reads the same
  3.320% of logit spread against the same control.
- **fx runs against slotstream.** A second HTTP dialect speaks the Vercel AI SDK
  Language Model Specification v4 over AI Gateway protocol 0.0.1, which is the
  wire [fx](https://fx.sh) uses. fx ships no plugin point, but its gateway client
  honours `FX_GATEWAY_CHAT_URL` and `FX_GATEWAY_BASE_URL` when they name an
  `http://` loopback address, so pointing it at a local server needs no fork and
  no patched binary: `POST /v3/ai/language-model` streams the turn,
  `GET /coding-agent/v1/models` is the catalogue, `GET /coding-agent/v1/credits`
  answers `fx credits`. Setup, limits and troubleshooting are in
  [docs/FX.md](docs/FX.md).
- **Native tool calling.** The model does not emit JSON tool calls; its template
  teaches it an XML form. That form is now parsed as it streams — several calls
  per turn, prose before and after, each argument typed against the tool's own
  JSON Schema — and a tag split across two token deltas can never leak into the
  user's transcript as text. Tool calls, tool results and reasoning also render
  back into a conversation, so an agent loop replays correctly.
- The catalogue derives every window from the running server's context cap
  rather than advertising a fixed one. fx reserves room for a reply only when
  the advertised reply budget is strictly smaller than the window; a fixed
  budget would, at small caps, tell fx it could fill the whole context with
  input and leave nothing to answer in.
- Agent turns get their own sampling defaults. The instruct default penalises
  repeated tokens, and the call format is obliged to repeat `</parameter>` and
  `</function>`, so the penalty pushed the model off the grammar exactly where
  it had to stay on it.
- The generated files cannot be committed stale. `llms-full.txt` comes from
  the docs and `MEASUREMENTS.md` / `PLAN.md` from the brain's records; a
  README edit that skipped the regenerate turned the docs job red, so
  `make hooks` now installs a pre-commit hook that regenerates them with
  the commit that moves their sources. The staleness check prints the drift
  it found instead of a bare verdict.

## 0.2.3 — 2026-09-02

- Reading a prompt is about twice as fast. A prefill pass of 256 tokens or
  more now sweeps each layer's experts through staging groups and MLX's
  grouped GEMM instead of gathering one matvec per token over the slot pool,
  reads consecutive experts as one contiguous `pread` per piece instead of
  nine ~307 KB pieces per record, and never writes the pool, so a long prompt
  no longer flushes what decode was using; the last pass admits the prompt's
  hottest experts so decode starts warm. Measured on the dev Mac, interleaved
  against 0.2.2's code: an 8k prompt at a 16 GB target 91 → 184 tok/s, ordinary
  prose 66 → 140, the 8.1 GB floor 51 → 93, `context-check --tokens 8192` 64 →
  152; at a matched 60-experts-per-layer pool a 4096-token pass reads 222
  tok/s (was 103). The n-gram rows a pass needs are now read in parallel
  rather than one at a time, which is where prose was paying ~35 s per 10k
  tokens. Peak memory is unchanged within 0.3 GB at 16 GB and 1.5 GB lower at the 8.1 GB floor, where MLX's buffer cache is now capped while a prompt is read.
  New gate `sweep-check`; `SLOTSTREAM_SWEEP=0`, `SLOTSTREAM_SWEEP_ADMIT=0`,
  `SLOTSTREAM_SWEEP_TRACE=1`, and `SLOTSTREAM_PREFILL_CACHE_MB` for A/B work.
  The planner's prefill estimates and the full-context waits on the README
  and in `doctor` moved with the measurements.
- slotstream is a Swift package as well as a binary. `Package.swift` declared
  no products, so nothing outside the repository could import it even by path:
  SwiftPM refused at graph resolution. There are now two library products —
  `Slotstream` (weights, planning, generation, serving) and
  `SlotstreamDiagnostics` (checks, goldens, benches) — beside the unchanged
  `slotstream` executable. `docs/LIBRARY.md` is the guide, including the part
  nobody guesses: MLX looks for its Metal shaders beside whichever executable
  is running.
- The weights are an addressable thing. `WeightStore.status()` answers ready /
  missing / incomplete / corrupt with the bytes still needed and the free disk
  where they land, so an app can ask before it tries to load, and a
  complete-looking copy is still hashed because size cannot see same-size
  corruption. `PinnedModel` is a public value; the download engine moved with
  it and no longer throws ArgumentParser's errors.
- The machine is a value, and a simulated one cannot allocate. `Machine`
  carries RAM, working set, availability and whether any of it was invented;
  a plan made for a simulated machine is marked and `Engine.load` refuses it.
  The global `Planner.availabilityOverride` is gone from the planning path.
  (Named `Machine`, not `Device`, because MLX exports its own `Device`.)
- Checks are library functions, not subcommand bodies. `runtime-check`,
  `governor-check`, `pull-check` and `sampler-golden` are `Diagnostics` and
  `Goldens` calls that return a report; the subcommands render it and print
  exactly what they always printed. New `slotstream-checks` runs the whole
  catalogue — 121 assertions across 9 checks, none needing weights — and CI
  runs it on every push alongside a coverage ratchet that holds a per-file
  floor.
- The serving layer's framing and routing rules are testable without a server:
  head parsing, the 411/413/431/400 decisions, absolute-form and query-string
  routing, and the loopback-only CORS policy. All of it previously needed a
  live server with 105 GB loaded.

- The repository carries its brain. `db/` is a public db.md store: every
  MEASUREMENTS.md and PLAN.md section is a record, every number on the README
  and the docs is a claim naming the measurement behind it and the surfaces
  it appears on, and decisions record what would reverse them. Both long
  documents are now generated from the records by `Tools/projections.py`,
  and `Tools/brain_gates.sh` (store validation, generated-document parity,
  the claims gate) runs in CI on every push.
- Docs: a Related projects section that names the peer engines and what each
  does differently, a Support section, `docs/HARDWARE.md` for rows measured
  on other Macs with an issue template to submit one, SECURITY.md, and
  CONTRIBUTING.md.
- CI runs the full build only when something other than prose changes; a
  docs-only push runs a twenty-second `docs` job (the llms-full.txt staleness
  check) instead.
- The serving layer answers while it is working. `/api/tags` and `/api/ps` read
  pool numbers through the *generation* lock, so both blocked for the length of
  a running request; with the accept loop also waiting on the connection
  semaphore, enough blocked metadata calls stopped the server answering
  anything at all, and a client polling either one saw a working server as a
  dead one. Pool numbers are published at each resize and read from a snapshot,
  and the accept loop never waits: a full pool answers 503.
- Reasoning no longer leaks into the answer. `think: true` returns the model's
  reasoning in `message.thinking` (`thinking` on `/api/generate`) and the reply
  in `content`; it used to hand clients the reasoning, a stray `</think>`, and
  the answer in one string.
- Deltas arrive per token. The incremental decoder waited for eight tokens
  before its first flush and held four back after it, so a client saw one delta
  per four tokens and nothing at all for a reply shorter than eight.
- An unseeded request is genuinely random. The sampler's default seed is a
  constant, so an unseeded request replayed the same text after every restart
  while the API documented the opposite. The seed is drawn at the HTTP boundary,
  leaving every offline gate deterministic.
- Stock clients work unchanged. JSON `null` means "not set" (the OpenAI client
  sends it for an unset `max_tokens`); `n: 1`, `frequency_penalty: 0`,
  `logprobs: false`, `logit_bias: {}`, `tools: []`, `response_format` text, and
  `user` are accepted at the value this server already implements and still
  refused at any other; `ollama show`'s empty `model` falls back to its `name`;
  and an untagged or `:latest` model name resolves to the only model. Knobs
  that would change the reply, such as `num_ctx` and `repeat_penalty`, are
  still refused rather than dropped.
- `ollama ps` reads correctly. It reported 104 GB of weights against a small
  pool and rendered "98% CPU" for a model running on the GPU; it now reports
  resident memory.
- HTTP framing is honest: 411 for a chunked body instead of reading it as
  empty, 413 for an oversized one instead of a bare connection reset, 431 for
  huge headers, 400 for a malformed `Content-Length`. A query string no longer
  404s the route, `HEAD` answers for the path actually asked for instead of a
  blanket 200, `/v1/models` carries `created`, and the first SSE delta carries
  the role. All of it is gated in `Tools/api_robustness.sh` (68 checks).

- Context length is documented and priced, and the cap is named for what it
  is. The 400 for a long prompt used to say "raise it with --max-context",
  a flag that could not go past the ceiling the server was already at; it
  now says the cap is the largest context measured so far (not a memory
  limit; context state is ~27 KiB per token) and what reading that prompt
  would have cost in time. `--max-context` above the ceiling is refused with
  the same explanation, on `serve` and `doctor`. The memory plan has a
  `context:` line and `/api/show` carries `max_context_tokens` and
  `est_prefill_s_at_max_context`; `doctor` ends with the wait before the
  first token by prompt length, and its tier table has a full-context column.
- Long prompts report progress: `run` and `serve` print the wait to expect
  and then one line per quarter for any prompt over 2k tokens.
- The prefill pass shrinks as the context grows (4096, 2048, 1024, 512 at
  about 4k, 14k, and 31k tokens), so a pass's query-by-key product never
  exceeds the largest one measured (a 4096-token pass finishing an 8,016-token
  prompt). Output is byte-identical at every pass size; the cost is some
  speed on the tail of a long prompt, and the plan's wait estimates include
  it. The never-measured 8192 pass is no longer a candidate.
- New `context-check` reads an N-token synthetic prompt through the real
  engine, reports seconds, tok/s, and peak memory against the plan, and stops
  before the machine swaps. New weights-free `prefill-schedule` prints the
  pass ladder and wait for any pass size. Gated in `planner_gates.sh`
  (bounded, floored, monotone, and equal to the doctor's wait) and one 2k rung
  in `verify.sh`.
- `pull`'s connection report counts the connections in use at once, one per
  session, instead of every distinct connection since the start; 0.2.1 could
  print "10 connections in use" for eight workers after two reconnects.
- `Tools/e2e_release.sh` expects the Ollama load acknowledgment for a chat
  with no messages, the 0.2.1 behaviour, instead of the 400 it asserted
  before; it was the one failing check of 31 against the installed 0.2.1.

## 0.2.2 — 2026-09-02

- Speculative decode pays, and ships. The draft head, `mtp.safetensors`
  (1.47 GB, sha256-pinned), is hosted on the weights mirror and pulled with
  everything else, so `--mtp auto` works out of the box on a large Mac. It is
  the manifest's one optional file: a source without it leaves the pull green
  with a notice and speculative decode off, `pull --verify` skips it when
  absent, and the startup check never asks to repair it. The weights are
  105.3 GB in 25 files.
- A rejected draft rolls back instead of re-running. The verify pass records
  the recurrent state after every position (the GDN recurrence stepped one
  token at a time, bit-identical to the fused kernel; conv windows sliced),
  so a rejection costs no model compute. Measured where auto enables the head
  (122 experts per layer, a quiet 48 GB Mac): ×1.24 decode with one draft
  (10.3 → 12.8 tok/s; ×1.33 on a code prompt, ×1.19 on a list, ×1.18 with the
  server's default sampling), up from ×1.17; ×1.20 at 57 per layer, up from
  ×1.12.
- One draft by default (was four). Four drafts lose at every size measured,
  ×0.88 even where auto turns the head on; one is best or tied everywhere and
  wastes the least on a rejection. `SLOTSTREAM_DRAFT_DEPTH` still overrides.
- The numbers are measured, not projected. The ×1.5–1.9 the 0.2.0 docs gave
  large caches assumed a five-token verify pass costs one token's pass; new
  hidden `mtp-passcost` measured 1.65 (a sixth of a pass per extra token),
  and auto's threshold reads 28 GB, not ~26. `mtp-check` bounds the reused
  speculative state's logits by the plain re-chunking band instead of
  comparing liveness, proves the recording pass exact against the batched
  one, and checks a rollback state by state against the plain path.
  `mtp-bench --sample` measures the sampled case.

## 0.2.1 — 2026-09-01

- `pull` opens the connections it claimed. Each of its eight connections is
  now its own URLSession: HTTP/2 multiplexes every request in a session over
  one TCP connection and ignores `httpMaximumConnectionsPerHost`, so every
  pull through 0.2.0 ran at one connection's speed — 25 to 40 MB/s from a home
  link 100 ms from Hugging Face, 72 from a gigabit datacenter link. Eight real
  connections measured 112 MB/s over a full install on that link (16 minutes)
  and 50 to 63 at home, and `pull` now prints the count it actually measured. The
  README's claim that Hugging Face caps the transfer near 55 MB/s was this bug
  seen from one link; it is withdrawn, as is the "R2 tested and rejected"
  verdict that rested on the same link (MEASUREMENTS.md, 2026-09-01).
- The Ollama CLI works again. 0.1.8's strict validator rejected the empty
  `name`/`system`/`template`/`options` the CLI's `/api/show` request always
  carries, so `ollama run` stopped before its first message. `/api/show` now
  accepts the deprecated `name` alias and empty overrides (non-empty ones stay
  a 400), advertises `capabilities`, chat/generate accept `keep_alive` and a
  null `options`, and generate accepts the empty `suffix`/`template` the
  CLI's one-shot mode sends (a non-empty suffix or template is still a 400).
  Ollama's documented "load" request (an empty prompt, or no messages), which
  the CLI sends when an interactive session opens, is acknowledged with
  `done_reason: "load"` instead of refused. Gated by `Tools/api_robustness.sh`
  with the CLI's exact request shapes.
- A weights directory reached through a symlink loads. Foundation refuses to
  list a symlinked directory, so `run` and `serve` failed with "couldn't be
  opened" while `doctor` and `pull --verify` worked; paths are now resolved
  once at the CLI boundary and in the shard index. Gated by `runtime-check`
  (weights-free) and a `verify.sh` run through a symlink.

## 0.2.0 — 2026-09-01

- Speculative decode with the model's draft head: `--mtp auto|on|off` on
  `run`, `serve`, and `doctor`. Auto enables it only at 120 or more experts per layer
  after its 1.6 GB charge, which raises the auto ceiling to 34.6 GB. Measured
  depth-1 accept rate 85.8%; ×0.96 at a 16 GB target, so it stays off there;
  the large-cache A/B is still pending.
- `Tools/mtp_convert.py` rebuilds `mtp.safetensors` (1.47 GB) from the
  official release with sha256 provenance; new `mtp-parity`, `mtp-accept`,
  `mtp-bench`, and `mtp-check` commands; `verify.sh` runs the MTP gates when
  the file is present.

## 0.1.10 — 2026-08-31

- Parity goldens ship in the repo, so a fresh clone can run the battery.

## 0.1.9 — 2026-08-31

- Installer and CI hardening; GitHub Actions runtimes updated.

## 0.1.8 — 2026-08-31

- Every weight file is checked against a sha256 manifest compiled into the
  binary; `pull --verify` covers all 24.
- Elastic drill and battery memory targets fixed; the `--memory-gb` promise
  re-verified and its measurements corrected.

## 0.1.7 — 2026-08-30

- Warm-decode estimates re-anchored on measurement; the planner no longer
  extrapolates past verified points.
- `Tools/e2e_release.sh`: acceptance run against the installed release.
- Live governor resize behavior observed and recorded.

## 0.1.6 — 2026-08-30

- Conversation prefix cache: follow-up turns prefill only what is new.
- Prefill pass size recalibrated.

## 0.1.5 and earlier — 2026-08-28 to 2026-08-29

- Serving robustness: every input that used to crash the server or corrupt
  its output is now a gated test.
- First public releases: the streaming engine, memory planner, `doctor`,
  `pull`, and the Ollama/OpenAI server. Details on the
  [releases page](https://github.com/carloslfu/slotstream/releases).
