# Changelog

What each release changed, newest first. `curl | sh` installs the latest
release; anything under **Unreleased** is on `main` only.

## Unreleased

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
