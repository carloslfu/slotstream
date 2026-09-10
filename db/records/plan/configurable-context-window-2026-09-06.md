---
type: plan
id: 01m1vgtznvvvt2hm9z1aw6dew2
created: 2026-09-06T14:09:28.251268+00:00
updated: 2026-09-07T07:42:59.010569+00:00
summary: 'Configurable context through the model limit: shared byte accounting, request guards, bounded prefill and staged qualification'
date: 2026-09-06
doc: plan
kind: queue-item
level: '3'
order: '336'
title: Configurable context window — 2026-09-06
---
**Status: software implementation and proxy acceptance delivered; native qualification and release deferred (2026-09-07).** This is the
engineering execution authority for configurable context. The complete review
was handed off on approval to implement all phases. The command-center record
becomes a rationale/status pointer. No private brain content is required here.

The implementation is being developed against an isolated snapshot of HEAD
`cf5bc50c11aed8eb7b01f1d5d7b9270d1e20dc7d` and the concurrent optimization
source closure, preserving other sessions' work. The public implementation
ceiling stays at 65,536 until the full qualification gate passes. The default
remains 32,768. Hermes's bounded request override remains supported.

Source ownership: this feature owns the context delta across planning,
governor, request control, generation, CLI and dialect delivery. The separate
[[records/plan/whole-engine-optimization-2026-09-04]] owns optimization candidate
activation. Builds and model runs share the existing single-process lock;
measured runs may not overlap. The final delta is reviewed against intervening
shared changes before landing on main.

P0 baseline evidence: [[sources/runs/2026/09/2026-09-06-configurable-context-baseline]].
`Tools/fixtures/context-default-v1.json` freezes an explicit stable allocation
projection from the installed 0.2.10 binary. Four simulated tiers each returned
identical JSON on two runs. New policy fields have an explicit additive schema.
This is regression evidence, not full-window capacity qualification.

The following reviewed contracts and C01–C22 acceptance cases remain binding.
No phase is closed merely because its code has been written.

## 1. Product and compatibility contract

The goal remains a **32768-token default**, with an explicitly chosen server
or `run` window up to the pinned model's **262144-token configured limit**
when the implementation and machine can support it. No automatic context
shrinking/growing, model catalog, RoPE extension, implicit summarization,
history truncation or sliding-window semantics are introduced.

Use separate, named values:

- **Model limit:** read from, and validated against, the pinned checkpoint's
  configuration. This is a configuration limit, not a quality guarantee.
- **Implementation limit:** highest window the current schedule, capacity
  accounting and release qualification support. It remains 65536 until the
  relevant gates pass; the full goal is not complete while this is below 262144.
- **Configured window:** user's startup choice, never silently lowered by the
  planner, governor, lazy vision load or client discovery.
- **Request window:** at most the configured window. Preserve existing OpenAI
  `options.num_ctx` and the ordinary unset/null behavior.
- **Measured evidence:** actual prompt and output counts, exact build/model,
  options, hardware and measurement method; never a universal scalar called
  "verified here" on a machine where the test did not run.

Context counts the final tokenized input, including templates, system/tool
history and expanded image tokens, plus generated tokens. Retain the existing
completion-budget clamp to available room. Over-limit input fails before model
work; it is never silently trimmed. Preserve the legacy zero-room behavior
where already documented, while OpenAI continues to reject a request with no
reply room. Freeze those exact boundaries rather than accidentally changing
them while sharing the admission code.

Keep the published `ContextPolicy.maxTokens`, `defaultTokens`, existing
initializers and planner overloads source-compatible. Add named fields and
overloads rather than requiring the old plan's destructive symbol rename.
Existing overloads delegate with the actual legacy default; all engine paths
use the new explicit configuration. A Swift consumer compatibility fixture is
required, not only successful compilation of this repository.

`Engine.maxContextTokens` is currently publicly mutable. New configuration must
be validated before allocation. Preserve source compatibility for legacy
callers, but detect an invalid assignment or an attempted increase beyond the
engine's allocated plan before generation and return a typed failure through
the checked API/legacy result. Do not merely alter metadata or retain an
unchecked setter as a way to bypass the limit. This is not a hot-resize API.

## 2. Shared memory and feasibility model

One pure calculation owns planning, feasibility, `doctor`, live metadata,
lazy vision reservation and governor controls. It prices the same controls
the allocator uses. Compute in checked integer bytes where possible and only
format GB at the boundary. Rounded JSON must not decide fit.

The ledger distinguishes:

1. Fixed resident/runtime allowance, including the already-budgeted default
   active state and one fixed recurrent state.
2. Active **allocated sequence capacity**, including allocation rounding,
   indexer storage and the MTP sequence when loaded; charge growth above the
   included baseline once. Reuse the capacity arithmetic already present in
   `Qwen4ExpModel.sequenceCapacityBytes`, extracting a pure geometry helper if
   needed so planning requires neither weights nor a model allocation.
3. The four-entry cache's shared retained-capacity ceiling and up to three
   additional fixed recurrent states; actual runtime charges must be bounded
   by the same reservation. Count prompt checkpoints and their logits too.
4. The selected prefill/attention/indexer workspaces, expert staging, allocator
   cache envelope, and separately qualified long-context transient reserve.
5. MTP resident weights, lazy vision resident/load/workspace costs, and other
   resolved runtime reservations. Flags must not make charged controls diverge
   from active controls or take the same credit twice.
6. The existing planning margin and current-availability slack, each once and
   with its own meaning. A declared target is not available physical memory.

The current `extraContextMemoryGB` derives its reserve from `maxTokens`.
Decouple the measured reserve anchor from the public maximum **before raising
that maximum**: otherwise changing one constant reprices the existing 65K
configuration without evidence. Preserve its established envelope until a
replacement measurement justifies a different one. Do not interpolate an
unmeasured transient peak or credit default-off optimizations as free memory.

Every path through `prefillChunkFor`, `slotsForTarget`, `prefixCacheGB`,
`finish`, `expectedPeakGB`, runtime-policy application and governor fallback
must receive the resolved cap and use the same ledger. A locally correct
`finish` alone leaves the actual pool selection incorrect.

Resolve a **feasibility result**, not the old one-line inversion of
`target - minMemoryGB`. It contains the requested window, maximum feasible
window under the same policy, limiting resource, selected controls and byte
breakdown. Determine it using the real discrete candidate calculation;
binary search is allowed only after proving its fit predicate monotone.
Clamps, rounded capacities, minimum pool, MTP choices and pass transitions must
not make the reported maximum accept a configuration the planner rejects.
Pool slot count itself need not be monotone in context: a smaller prefill pass
can free room for more slots. Account for the total, not that misleading proxy.
Report this as a memory-feasible ceiling; it is distinct from the cold-prompt
length allowed by the time policy. `doctor` shows both costs without implying
that memory feasibility guarantees admission under the deadline.

Policy handling is explicit:

- **Auto:** preserve the selected window and existing RAM-share/working-set
  policy. Adjust pool, pass, retention and optional MTP around it; refuse if
  no feasible configuration exists. Never take `.hold` after an infeasible
  replan as permission to start another unsafe request.
- **Total-memory target:** fit the whole resolved plan inside that target.
  Also check real reclaimable memory before allocation; a large explicit
  target does not defeat the request safety guard.
- **Pinned experts/pool:** honor that pool, calculate full cost, and refuse a
  raised context it cannot support. Do not quietly shrink the requested pool.
  Preserve the documented legacy advisory behavior at ordinary caps; the new
  request guard still applies even with explicit sizing or `--no-elastic`.
- **MTP:** explicit `on` fails if it cannot remain on; `auto` may choose off
  with a note explaining the context tradeoff. A live governor never unloads
  an already resident head by pretending it is off in the next plan.
- **Vision:** replan before the first tower load with the same cap, respecting
  current donated pool capacity. If the image/window combination cannot fit,
  reject the image request and leave ordinary text usable at the same cap.

Qualification may initially support 262K text with MTP off while retaining a
smaller qualified range for other modes. Freeze and publish those mode limits:
forced MTP at an unsupported startup cap fails, automatic MTP explains why it
stays off, and an unsupported long image request fails before tower work. Never
advertise an unqualified 262K vision/MTP capability from the text result or
silently reduce the server's configured text window. This disposition must be
explicit in C12/C19 before a text-only qualification can close P5.

For governor credit, use a coherent snapshot of memory actually owned and
releasable, distinguishing it from unused reservation and memory already
included in reclaimable availability. Credit each byte at most once. Include
held additional sequence capacity when appropriate; never add the worst-case
future context or a no-longer-live prefill transient merely because it is in
the plan. Preserve the conservative fixed/resident treatment until its own
replacement is measured. Test no allocated long state, filled state, prefix
eviction, allocation rounding, pressure shrink and recovery. Repeated replans
must converge without growing into reservations or progressively ratcheting down.

Refund below-default **retention** over-reservation as a correctness fix.
Refunding the baseline active-context allowance is separate, deferred work:
the fixed footprint has not been proved to shrink by exactly 27648 bytes per
token. It is not required for completing the main 262K feature.

## 3. A safe prefill schedule before opening 262K

The selected path is to keep every actual query-by-key product within the
existing bound and support smaller late-context passes. At the model ceiling,
a 128-token pass is too large for that bound; a power-of-two schedule reaches
64. Passes below 256 use a different existing execution/eviction path and lack
current throughput anchors, so they require component correctness and memory
qualification. The comment about the floor is not proof either of feasibility
or impossibility: inspect the path and test it.

Implement the bounded candidate schedule first behind diagnostic qualification.
Cover fresh prefill, a reused prefix at an arbitrary position, non-power-of-two
tails, MTP, image boundaries and any enabled grouped read scope. A read scope
cannot turn several bounded passes into one unbounded attention operation.
Check `from + tokens`, products and capacity rounding for overflow before
allocating a pass list. No exemption of the form `product fits OR chunk ==
minChunk` is permitted in the new full-window gate.

Measure valid sub-256 cost anchors before pricing them. If the selected path
fails correctness or acceptable bounded operation, keep the public cap at the
qualified limit and revise P4 using evidence; do not raise the product bound or
claim completion. A tiled attention alternative belongs to the existing
optimization program and needs its own measured integration, not an assumed fix.

`context-check` must request the candidate cap through the same planner before
loading. A diagnostic-only checked path may plan above the currently published
implementation limit, up to the model limit, to avoid a circular qualification
gate. It still enforces physical feasibility and cancellation. Remove the
post-load `engine.maxContextTokens = target + 16` escape and the `maxTokens * 8`
input bound. Explicit prompt plus reply reserve must fit the model limit;
the diagnostic must actually complete the requested prompt and output before
reporting `fits`. Partial work and allocation failure are counterexamples.

## 4. Admission, wait and interruption contract

Expose `--max-context` and `--max-prefill-wait <minutes>` consistently on
`serve`, `run` and `doctor`, backed by shared library configuration. Proposed
wait default: **30 minutes**, `0` disables only the time policy. Reject NaN,
infinity, negative values and duration overflow before loading. Neither `0`
nor `--no-elastic` disables memory or context bounds.

Define the wait budget as **request-to-first-model-token wall time after the
complete request is accepted for processing**: it includes queueing, prompt
preparation, image work and prefill, excludes request upload, model startup and
decode after the first sampled token. CLI starts at its equivalent post-load
request boundary. A monotonic clock controls it. Publish queue/preparation and
prefill timings separately; neither keepalives nor reasoning visibility resets
the clock. A queue wait must remain cancellable rather than taking an
uninterruptible generation lock.

The estimate is an early refusal aid, not the deadline or a guarantee. At the
generation lock, resolve the actual current plan and exact reusable state,
then price only missing input tokens **from their absolute context position**.
Include known preparation work and elapsed queue time. If the estimate exceeds
the remaining budget, reject before prefill; the wall-clock deadline catches
underestimation. An unknown estimate must be labeled unknown and remain subject
to the deadline, never represented as zero or measured throughput. Cold input
can fail while a valid reused continuation succeeds. If a cache lookup is only
a preview, revalidate/reserve it under the same lock before admitting work.
The controller must exist before preparation begins. Compute bounded expanded
image/token geometry before expensive tower inference; pass cancellation into
the preparation path itself. A guard first created inside `generate` cannot
retroactively bound earlier image work or queueing.

Default preservation means the same context default and ordinary successful
behavior/allocation, not a promise that a new 30-minute deadline never affects
an old request. Slow storage, queueing and other apps can exceed an M5 estimate.
Document the intentional new bounded failure behavior and exercise both 32K
and the already-supported Hermes 65K path. No stale 13.7-minute figure is a proof
that the default cannot fire on every machine.

Add a typed request outcome/controller shared by `Engine` admission and the
generator's existing cancellation seams. Distinguish pressure/insufficient
memory, deadline, client cancellation, inference error and successful stop.
Do not make a generic `shouldContinue == false` mean normal completion.
Preserve legacy nonthrowing APIs with additive error/status data or checked
variants; do not turn recoverable input/resource errors into a process trap.

Memory checks run before image/tower allocation, state reservation, each bounded
prefill pass/scope, and during decode at safe commit boundaries. Test sufficient
headroom for the **next allocation** plus slack, not just a fixed free-memory
threshold after allocating. Unknown memory readings cannot authorize new
above-default context growth. A checkpoint check cannot guarantee that another
app will never allocate concurrently; say that honestly and bound the work until
the next cancellation point. Preserve the existing responsive-governor seam
without enabling unrelated experimental optimizations as a side effect.

On abort, join readers and synchronize outstanding GPU users before releasing
buffers/pins. Memory-pressure abort drops active/retained state needed for
recovery and must not immediately store the partial state back into the cache.
Other cancellation may retain only a validated whole-stack checkpoint within
the budget; no incomplete recurrent/MTP/image state can be reused. No tool
proposal from an unsuccessful turn becomes executable. The next short request
must either run normally or receive an explicit still-unavailable error.

### HTTP and client behavior

| Failure point | Required behavior |
| --- | --- |
| Invalid cap/input or predicted wait above policy, before headers | Typed HTTP 400 with actual limit/estimate and actionable remediation |
| Memory/deadline refusal before headers, including a queued request | Typed HTTP 503 naming the resource or deadline; no generation |
| Memory/deadline/inference failure after streaming headers | Dialect-valid terminal error, then close; never try to change HTTP status |
| Client disconnect | Stop bounded work and release state; do not attempt a success response |
| Normal completed inference | Existing dialect finish semantics, exact usage and bounded output |

Freeze codes such as `context_length_exceeded`, `prefill_wait_exceeded`,
`insufficient_memory` and `prefill_deadline_exceeded`, with elapsed/limit/estimate
fields when available. Keep existing unknown/inference errors distinguishable.
Stream headers must follow checked admission; errors after
that point still require the in-stream path. Failed OpenAI turns emit no
successful finish or success `[DONE]`; Ollama emits an error without a normal
`done: true`; the gateway emits its defined failure terminal. Preserve the
error-before-success behavior already added in the working tree.

Expose machine-readable policy/estimates before work through `doctor` and
discovery. Keep logs/progress current after governor changes; do not capture
the startup chunk forever. Existing SSE keepalives preserve transport liveness
but are not ETA or evidence the model progressed. Do not insert arbitrary
progress JSON into a client's content stream. Document required client timeout
settings, including Hermes, without expanding this feature into a new job API.

## 5. Implementation order and gates

These are dependency gates, not time estimates. P0–P4 can improve ordinary
and Hermes serving while the public ceiling stays at 65536. P5 opens larger
windows only after qualification; P6 releases the complete feature.

| Phase | Work | Exit evidence |
| --- | --- | --- |
| P0 — freeze and handoff | Capture actual source/binary/model identities and current successful/error fixtures; project this engineering plan into Slotstream's `records/plan/` without private paths; make this record a pointer at handoff | Four deterministic default-tier snapshots, source-compatible consumer fixture, dialect baselines and named ownership of overlapping files |
| P1 — accounting | Shared byte ledger, explicit cap threading, feasibility result, governor ownership credit and unavailable-state handling | C01–C05; unchanged frozen default allocation fields; exposed original counterexamples now pass |
| P2 — admission/API | Shared context/wait configuration, `run` parity, checked engine admission and metadata | C09–C12; existing library callers and Hermes remain compatible |
| P3 — interruption/wire | Memory/deadline controller, cancellable queue and safe cleanup, typed errors in all dialects | C13–C17; fake failures plus a small live interrupted request and successful recovery |
| P4 — schedule | Bounded late-context passes and checked diagnostics; measured costs and memory for the new path | C06–C08; no unqualified product or fabricated throughput anchor |
| P5 — full-window qualification | Preregistered incremental capacity runs against the exact candidate, then raise the implementation limit to the maximum proved within the model limit | C18–C20; all claimed endpoint/configuration combinations have evidence; no claim of full completion below 262144 |
| P6 — documentation/release | Update authoritative records and public surfaces; complete relevant existing acceptance, installed-binary and client gates; publish through normal CI workflow | C21–C22; released and installed build identity, compatibility and limitations recorded |

### Acceptance cases

| ID | Required case and observable result |
| --- | --- |
| C01 | Default 16/24/32/48 GB simulated tiers: pin RAM, working set, availability, model capabilities, MTP, vision and environment. Canonicalize an explicit versioned projection of existing allocation/sampling fields; repeat twice and compare byte-for-byte. Additive fields are separately schema-checked. Never refresh a failing golden automatically. |
| C02 | Cap matrix 1, 1024, 4096, 8192, 32768, 32769, 65536, 128256, 131072, 262144 and neighbors; floor/knee/busy targets, MTP off/on/auto, vision absent/allowed/resident, cache enabled/disabled and pinned pool policies. Accepted plans fit exact ledger limits; rejected plans name their actual constraint. |
| C03 | Solver maximum is accepted and its next token is refused under identical fixed inputs, unless already at model/support maximum. Include allocation-step boundaries and forced MTP failure. No expected answer is hardcoded from RAM-tier marketing. |
| C04 | Prefix reservation equals runtime's bounded allocated-capacity cost; lowered caps recover retention over-reservation; raised caps never spend that reserve on experts. Four interleaved conversations, prompt checkpoints, image histories and MTP capacity are covered. |
| C05 | Governor under quiet/busy/pressure/recovery inputs preserves the cap and loaded components, credits only owned/releasable memory once, converges, respects cooldowns and blocks new work when infeasible. Test both no long state and allocated long state; old 1024-cap tests alone are insufficient. |
| C06 | Every actual schedule pass from arbitrary prefix positions satisfies the product bound, including the final pass at 262144, 64/128/256 transitions, short tails and any enabled scopes; totals are exact with no floor exemption. |
| C07 | Sub-256 model path: deterministic repeatability, bounded state/capacity, correct offsets, MTP rollback, prefix extension and numerical behavior within the preregistered rechunking control. Do not require byte-equality across different batch geometries or loosen tolerances after observing output. |
| C08 | Diagnostics reject negative/overflow/out-of-model lengths and missing reply reserve before load, charge the candidate context before allocation, enforce the same guard, and mark abort/incomplete prefill/no output as failure. |
| C09 | `serve`, `run`, `doctor`, direct checked Engine calls and applicable legacy adapters resolve the same configuration. An invalid legacy cap assignment cannot allocate or silently alter the advertised server contract. |
| C10 | Final templated and image-expanded token counts govern cap-minus-one/exact-cap/cap-plus-one requests. Output clamp and zero-room behavior match each frozen public contract. Integer overflow and null/default forms fail or pass deliberately. |
| C11 | Hermes/OpenAI bounded `options.num_ctx` passes at/below the served cap, rejects zero and inflation, and never changes another request's cap. Ollama still rejects unsupported non-default controls; gateway output allowance stays valid. |
| C12 | `doctor`, `/api/show`, `/v1/models` and gateway catalog report the configured usable window rather than the model maximum. Policy and evidence metadata are additive and consistent after resizing and lazy vision loading. |
| C13 | Fake monotonic clock proves estimate refusal, deadline despite a too-fast estimate, zero-disabled time policy, queue/preparation accounting, no timer reset on keepalive, cancellation before first allocation and no timeout on a valid fast reused continuation. |
| C14 | Fake availability/pressure at admission, image work, each prefill boundary and decode causes typed failure with bounded stop latency. Fixed-size, no-elastic and unreadable-memory paths remain covered without inducing real system pressure. |
| C15 | Cleanup proves joined readers, completed GPU users, released pins and restored allocator limits; invalid state is not retained, pressure-aborted state is not immediately re-cached, and a fresh short request recovers. |
| C16 | HTTP/SSE/NDJSON tests before and after committed headers for all dialects: right status or terminal error, no success tail, no extra output after terminal, disconnect/backpressure does not hang. Existing successful text/tools/vision behavior survives. |
| C17 | Strict consumer fixture rejects tool calls followed by error, timeout, EOF or `length`, even when arguments are valid JSON. Engine release gates its own terminal contract and existing real clients. The actual db.md/Rust receiving-side gate remains owned by Sevra H2/F2; it is required before claiming that end-to-end integration safe, not a new dependency on shipping Sevra Desktop. |
| C18 | Increasing supported prompt lengths with reply room, including a near-ceiling prompt and nontrivial decode reaching the configured total cap. Preserve exact tokens/configuration, full completion, sampled physical footprint, RSS, MLX peaks, swap and abort state. A one-token 65K diagnostic does not prove all decode/vision/MTP combinations. |
| C19 | Cold state and already-filled/interleaved retention; minimum-feasible, pass-transition and ordinary targets; MTP and vision combinations actually advertised at the new cap. Unsupported combinations fail explicitly rather than inheriting a text-only measurement. |
| C20 | Live small controlled deadline/guard interruption and recovery; one model process at a time with real reclaimable memory checked and several GB spare. Use injected guard triggers, not a memory hog or simulated RAM to authorize real allocations. |
| C21 | Existing relevant `brain_gates.sh`, `planner_gates.sh`, `sampler_gates.sh`, `static_gates.sh`, catalogue, prefix/MTP/vision/HTTP suites and installed `e2e_release.sh` pass on identified candidate builds. Claims and generated docs agree. No generic passing suite is substituted for C01–C20. |
| C22 | Public Swift consumer, actual Hermes and applicable Ollama/gateway clients; ordinary 32K and existing 65K remain usable. CI release, installer, version, binary/model hashes and a rollback preserving the prior 65K-capable install are recorded. |

P5's protocol is frozen before measurements: candidate source/options, lengths,
memory targets, MTP/vision/cache modes, required output tokens, hard stop
conditions and per-run time ceiling. Advance one rung only after the previous
one completes within its budget; stop after a failed rung and preserve it.
Wait may be disabled deliberately for a bounded diagnostic, but the independent
measurement wall-clock ceiling and memory guard remain active. There is no
obligation to hold a loaded model for hours merely to label the plan reviewed.

A complete-window qualification separates **capacity/memory**, **latency
estimate calibration**, **numerical parity**, and **answer quality**. It does
not claim quality from a synthetic filler; general long-context quality work
remains separate. No default changes or planner credits are earned by unrelated
experimental optimization results.

## 6. Documentation, ownership and completion

Update hand-edited `README.md`, `docs/CLI.md`, `docs/API.md`, `docs/HERMES.md`,
`docs/TROUBLESHOOTING.md`, `docs/HARDWARE.md`, `docs/TESTING.md`, `CHANGELOG.md`,
`llms.txt` and the context rule in the repository's `CLAUDE.md`/`AGENTS.md`.
Generate `MEASUREMENTS.md` and `PLAN.md` from the engineering db.md records;
generate `llms-full.txt` through its existing script. Source evidence stays
append-only, with measurements, public-number claims and release references
updated together. Do not leave a shipped context feature under `Unreleased`.

Coordinate the owning changes with the current whole-engine optimization plan
(`db/records/plan/whole-engine-optimization-2026-09-04.md` in Slotstream).
Reuse its capacity, checked-read, cancellation, output and prefix primitives;
do not enable its full candidate bundle to implement this feature. Freeze the
actual source closure, preserve other sessions' edits, and rerun only affected
acceptance when overlapping code changes. H1 owns the common engine turn;
H2 owns safe consumption; this plan owns configurable context and its guards.

**Completion requires every applicable C01–C22 gate and a qualified
262144-token implementation limit.** The current 65K feature, this design
review, a simulated acceptance, or an updated status field is not completion.
The below-default active-state credit remains explicitly deferred. If measured
hardware or latency prevents full qualification, report the precise partial
limit and preserved counterexample instead of changing the goal silently.


### Implementation evidence and open gate (2026-09-06)

[[sources/runs/2026/09/2026-09-06-configurable-context-components-v1]] records
stable installed-default projections, shared accounting/admission/controller
implementation, and passing component/HTTP cleanup checks after fixing retained
expert pins and vision budget fit. These are bounded implementation gates;
they do not close the whole C01–C22 matrix. Public source compatibility and
remaining live mode/lifecycle checks are still pending.

[[sources/runs/2026/09/2026-09-06-configurable-context-small-pass-counterexample]]
and [[sources/runs/2026/09/2026-09-06-configurable-context-small-pass-diagnosis]]
preserve failed numerical gates and the mechanistic follow-up. The original
small-pass path and its grouped-expert successor both fail the frozen state
and continuation contract. A four-layer probe finds exact first-layer inputs
and attention but differing expert output. Routing/shared-expert shape
controls are being investigated; no thresholds or frozen outputs changed.
The observations in [[sources/runs/2026/09/2026-09-06-configurable-context-observations]]
exclude contaminated timing/capacity inferences. P4 remains open. P5 has not
started; the public implementation limit stays 65536. P6 publication and
installed-client acceptance remain open. This feature is not complete.

### Expanded component checks and preserved counterexamples (2026-09-06)

[[sources/runs/2026/09/2026-09-06-configurable-context-components-v2]] and
[[sources/runs/2026/09/2026-09-06-configurable-context-cli-policy-and-driver-v1]]
record the expanded CPU/governor/CLI contracts and the capacity driver's
fail-closed rejection tests. They preserve the ordinary allocation fixture.
The expanded live HTTP matrix is still pending. Source review subsequently
moved HTTP request acceptance before JSON parsing and put CLI prompt-file
reading and cumulative image preparation under that same request's guards;
those later changes are not covered by build 11.

[[sources/runs/2026/09/2026-09-06-configurable-context-router-shape-counterexample]]
and [[sources/runs/2026/09/2026-09-06-configurable-context-key-domain-counterexample]]
preserve the router-padding and reference-key-domain successors. Both retain
nine continuation/rollback failures under the original C07 criteria. Candidate
repeatability passes but does not override those failures. A prospective
successor preserves the reference row shape of token-wise resident projections,
including the plain indexer projection. It never pads recurrent updates or
logical attention query rows. Its additional workspace is explicitly priced.
It remains unbuilt and unqualified at this entry; no numerical tolerance or
expected token was changed. P4, P5, and P6 remain open, and the public cap stays
65536. All overlapping-run timing and capacity interpretations are excluded.

### First exact small-pass witness and HTTP pressure correction (2026-09-06)

[[sources/runs/2026/09/2026-09-06-configurable-context-projection-shape-first-pass]]
records build 12 passing all 1605 frozen assertions for the first 64-row
projection-shape witness, with every recorded candidate drift exactly zero.
This supersedes the preceding unbuilt status for that exact witness only.
The 128-row, partial, reused-prefix, short-tail and sparse-indexer cases remain
pending. Later source edits preserve the original 256-row floor at ordinary
caps, align short terminal router projections, and bound late passes against
their actual reference key domain; these are not yet built or verified.

[[sources/runs/2026/09/2026-09-06-configurable-context-http-pressure-counterexample]]
preserves 114 failures in the expanded build 11 HTTP matrix. Build 12 fixes
the supplied-controller pressure bypass and the actual-length prefix fixture,
but the corrected expanded matrix still requires a live run.
[[sources/runs/2026/09/2026-09-06-configurable-context-components-v3]] records
build 12's 21171 CPU, 95 CLI and 64 planner assertions. These passing component
checks do not replace the open HTTP, numerical or public-consumer gates.
All overlapping-run timing and capacity interpretations remain excluded.
P4, P5 and P6 remain open; implementation limit 65536 and default 32768 persist.

### Expanded HTTP pass, six exact witnesses and remaining tail failure (2026-09-06)

[[sources/runs/2026/09/2026-09-06-configurable-context-http-pressure-correction]]
records build 13 passing the corrected 835-assertion HTTP matrix, with CLI95
and planner64 also passing. The 114-failure predecessor remains preserved.
[[sources/runs/2026/09/2026-09-06-configurable-context-projection-prefix-pass]]
records both 64/128-row candidates passing all1605 frozen assertions, with
zero candidate drift, for each ordinary, partial-terminal and reused-prefix
witness. The sequence then stopped on two failures in the one-row-tail case:
[[sources/runs/2026/09/2026-09-06-configurable-context-short-tail-counterexample]].
No sparse-prefix witness or capacity rung ran in that sequence.
The eight obsolete minimum-floor test expectations are separately preserved in
[[sources/runs/2026/09/2026-09-06-configurable-context-floor-fixture-counterexample]].

A prospective successor prices separate physical replacement allocations for
main, draft, raw and pooled caches, guards the complete provisional draft span,
and atomically reserves concurrent preparation and pending dispatch ownership.
Prepared-image ownership retains its reservation through queueing and use.
Tiny matrix-prefill tails pad only attention query work, crop before state,
and report physical query rows independently of logical token counts.
Those later changes require new identified CPU, live HTTP and numerical runs.
No failed criterion was loosened. P4/P5/P6 remain open, with default32768 and
public implementation65536 unchanged. Overlapping-run timing and capacity
interpretations remain excluded.

### Allocation ownership and complete bounded shape matrix (2026-09-06)

[[sources/runs/2026/09/2026-09-06-configurable-context-allocation-ownership-pass]]
records build 15 passing 22191 T0, 95 CLI, 64 planner and 835 HTTP assertions.
Per-buffer replacement guards, provisional MTP span bounds and atomic
simultaneous preparation/dispatch reservations now have bounded regression
evidence. Actual MTP-head and large-context capacity remain separate gates.

[[sources/runs/2026/09/2026-09-06-configurable-context-short-tail-and-sparse-prefix-pass]]
records four more C07 cases, each passing all 1605 unchanged assertions.
The 64-row short-tail case has one nonzero logits measure within the frozen
band; every greedy token matches. With build 13's six exact cases, this
completes the bounded predeclared shape/prefix matrix for the diagnostic family.
All overlapping timing and capacity interpretations are excluded.

Normal Generator family activation, exact runtime-control binding in the
capacity driver and odd late-chunk canonicalization are later unbuilt edits.
The optimization owner has three-way merged the extracted non-numerical v3
component into newer shared source; that combined source requires its own
build and regression gates. P4 integration and P5/P6 remain open. The default
32768, public implementation ceiling 65536 and separate MTP/vision caps persist.

### Combined source and actual MTP cancellation correction (2026-09-06)

[[sources/runs/2026/09/2026-09-06-configurable-context-combined-shape-and-http-pass]]
records all ten fixed C07 witnesses on build 16, each passing 1605 unchanged
assertions, plus 22249 T0, 102 CLI, 64 planner and 835 HTTP assertions. The
combined source preserves the optimization owner's V176 changes. The following
[[sources/runs/2026/09/2026-09-06-configurable-context-mtp-cancellation-exclusivity-counterexample]]
then stops that batch: caller cancellation touched stats while speculative
decode held an exclusive inout borrow. The failed binary and stderr remain.

Build 17 separates callback cancellation from the borrowed statistics and adds
real typed MTP cancellation at zero, one and three delivered tokens, cleanup
and recovery. The corrected actual MTP-retention gate passes 198 assertions;
lifecycle passes 138. Remaining tests in this identified batch are ongoing.
The exact public e498b2d transport source and published Hermes documentation
are incorporated in the isolated candidate, preserving the reserved v0.2.11
release. No shared source, public tag or installed binary is changed here.
The optimization owner independently applied the minimal correction to shared
v3 source. All download-overlap timing and capacity interpretations are excluded.
P5's quiet full-window and retained-state capacity runs have not started; P6
public consumer, actual clients and release/installed acceptance remain open.

### MTP recovery pass and bounded pressure follow-up (2026-09-06)

[[sources/runs/2026/09/2026-09-06-configurable-context-mtp-cancellation-recovery-pass]]
records build 17 passing actual MTP retention/cancellation/recovery (198),
lifecycle (138), T0 (33 groups / 22249), CLI (102) and planner (64).
[[sources/runs/2026/09/2026-09-06-configurable-context-unchanged-adaptive-mtp-counterexample]]
preserves the sole, exact known V50 adaptive-candidate mismatch. That option
remains disabled. The separate
[[sources/runs/2026/09/2026-09-06-configurable-context-governor-invocation-prerequisite]]
is an invocation error, followed by prospective pressure/recovery fixture and
observability corrections. Build 18 is pending verification at this capture.
No numerical tolerance, old failure, or optimization adoption gate changes.
P5 and P6 remain open; overlap correctness is not capacity or timing evidence.

### Pressure recovery pass and actual four-conversation witness (2026-09-06)

[[sources/runs/2026/09/2026-09-06-configurable-context-pressure-feasible-recovery-pass]]
records build 18 passing fixed-MTP pressure cancellation and feasible recovery
(80 assertions), HTTP (835), and T0 (33 groups / 22249). New work stays refused
while the configured plan is infeasible; a physically bounded recovery poll
clears the latch without growing the arena, then preserves exact output.
[[sources/runs/2026/09/2026-09-06-configurable-context-retained-functional-swap-exclusion]]
records eight completed, correctly reused warm-up turns followed by the entire
4096+16-token main request. Its strict capacity verdict remains excluded due
to eight system swap-in pages during overlapping download. This is functional
wiring evidence only. C19 still requires a clean identified capacity interval.
The public Swift consumer build is in progress; no P5 run or release occurred.

### Actual clients and external public consumer (2026-09-06)

[[sources/runs/2026/09/2026-09-06-configurable-context-actual-32k-client-contracts]]
records actual Ollama and published AI SDK gateway success at the ordinary
window, and Hermes's own expected minimum-context refusal before inference.
[[sources/runs/2026/09/2026-09-06-configurable-context-actual-65k-client-pass]]
records all three clients passing at the documented Hermes window, including
real tool dispatch, follow-up, title and bounded request context. Hermes CLI,
forced compression and image extensions remain unrun on this candidate.

[[sources/runs/2026/09/2026-09-06-configurable-context-external-swift-consumer-pass]]
records build19 passing original public API signatures from an external
SwiftPM package and the unchanged strict warning gate. The preceding
[[sources/runs/2026/09/2026-09-06-configurable-context-external-consumer-deprecation-counterexample]]
remains evidence. Build19 includes a shared prompt-checkpoint arithmetic epoch
and explicit old-epoch rejection; T0 passes33groups/22251assertions. The native
complete-prompt MTP gate remains in progress at this capture. P5, the remaining
C21 native gates, public release, installation and rollback remain open.

### Complete-prompt epoch integration passes (2026-09-06)

[[sources/runs/2026/09/2026-09-06-configurable-context-complete-prompt-epoch-pass]]
records all281native MTP/vision/cache lifecycle assertions passing on build19.
The centralized arithmetic key now agrees across Generator and direct callers,
and stale epoch0 identities are refused. This supersedes the preceding
in-progress status for this exact bounded gate only. The full-window capacity
ladder and its retained/minimum/transition variants remain unrun; existing C21
native suites and public release/install/rollback remain open.

### Static regression passes; native continuation prerequisite (2026-09-06)

[[sources/runs/2026/09/2026-09-06-configurable-context-static-and-sampler-prerequisite]]
records the full static suite passing on build 19, including installer fixtures
and planner gates. The sampler then stopped before execution because the
isolated checkout did not select the existing NumPy parity environment. The
environment is now identified; the next bounded batch supplies PYTHON
explicitly. No numerical or model result is inferred from that failed launch.
The following native suites, P5, release and installed acceptance remain open.

### Existing native gates and mandatory-MTP planning defect (2026-09-06)

[[sources/runs/2026/09/2026-09-06-configurable-context-native-regression-and-mtp-plan-counterexample]]
records build19 passing sampler/governor, n-gram/template/layer parity, exact
8.1GB/10GB output, live cache resizing, prefix reuse, sweep and MTP-head parity.
The following MTP check was intentionally stopped after source review exposed
an unpriced head loaded after an MTP-off plan. Four diagnostic entry points
are being corrected to reserve the head before Engine construction. Their
combined image leg and the full governor drill have explicit larger bounded
test targets; neither has passed on the prospective source yet.

The qualification driver's full-file hash operation now holds the inference
exclusion lock. Nine provider-free rejection/locking groups pass, including
busy-lock refusal and release. The P0 handoff is also reflected in the private
planning pointer; Slotstream's engineering store owns execution and evidence.
No full-window protocol has run. P5 and the remaining C21/C22 release gates
stay open, and the public context ceiling remains65536.

### Explicit resource contracts and real Hermes extensions (2026-09-06)

[[sources/runs/2026/09/2026-09-06-configurable-context-budget-and-schedule-component-pass]]
records build20 compiling the reviewed diagnostic-budget and actual-schedule
corrections, with T0 33/22256, CLI116, sampler/governor and the full static
suite passing. Required MTP heads are reserved before allocation; the full
governor and image/MTP checks require explicit larger targets and validated
whole-interval memory receipts. Their native execution remains pending.

[[sources/runs/2026/09/2026-09-06-configurable-context-actual-hermes-cli-pass]]
and [[sources/runs/2026/09/2026-09-06-configurable-context-actual-hermes-compression-pass]]
record the actual pinned client's successful CLI and forced compression at65K.
The summary finishes normally, reduces history and preserves the exact fact
in a real follow-up answer. Both extensions finish within their frozen bounded
ceilings; owned children exit and the shared lock is verified free afterward.
Timing and capacity interpretations remain excluded during download overlap.

The optional V193 read-scope checkpoint delta is imported only after this
identified group ends. It preserves existing compute boundaries, affects only
enabled positive-budget retention, and remains unbuilt in the context worktree.
P5's clean full-window/retained/minimum/pass-transition protocols, remaining
vision/native gates, and P6 release/install/rollback remain open. No public
context increase or qualification protocol execution is claimed.

### Ordinary-context live feasibility gap (2026-09-06)

[[sources/runs/2026/09/2026-09-06-configurable-context-ordinary-governor-feasibility-counterexample]]
records the shared V193 continuation: T0 33/22263, CLI116, HTTP835 and
image-reuse76 pass, then the plain governor gate stops on eight failures.
The startup planner's ordinary-context floor advisory was being accepted by
the live governor without a separate complete-ledger physical-fit check.
The source correction preserves startup defaults, deadbands and the original
refusal assertions, adding pure plain/MTP floor/recovery coverage. It remains
unbuilt; both native variants and the existing governor suite must pass before
C05 is closed. The failure is not waived by the earlier MTP-only result.
P5 and release/installed acceptance remain open.

### Governor fixture classification after physical-fit correction (2026-09-06)

[[sources/runs/2026/09/2026-09-06-configurable-context-governor-advisory-fixture-counterexample]]
records shared V198: compilation passes; T0 returns32of33groups and22295
assertions with20failed expectations in four old ordinary-context fixtures.
All32new exhaustion/recovery assertions pass. Both reviewers independently
verify through the frozen public doctor that the old10GB whole-availability
rows require7.919289600/7.921999104GB while only7.425GB remains after safety
slack. A successful legacy startup advisory cannot imply live feasibility.

The diagnostic-only correction retains every original10/18/44GB input, checks
refusal/floor/still-unavailable behavior for the exact four invalid advisories,
and adds12GB feasible near-floor rows. Existing settlement/cooldown/recovery
assertions remain for feasible plans. The production guard, deadbands,
allocation goldens and numerical tolerances are unchanged. The revised fixture
is unbuilt at this capture, and both native governors still must pass; C05
remains open. No CLI or model case followed the failed T0 run.

The verified transport release and exact evidence packet are integrated while
preserving context documentation, shipped Hermes history and restored original
historical sources. This prepares a common successor source closure; it is
not context capacity qualification. P5 and P6 remain open, with default32768
and public ceiling65536 unchanged.

### Shared regression and excluded full-resource interval (2026-09-06)

[[sources/runs/2026/09/2026-09-06-optimization-merged-correctness-v202]]
records the exact shared V202 candidate: all 19 correctness groups pass,
including T0 33/22346, both native governor variants at 80 assertions,
the 832-assertion combined scope lifecycle, and the 835-assertion HTTP suite.
The production feasibility correction and revised advisory classification
now pass their relevant pure and native checks. Experimental defaults remain
off. This correctness result does not qualify a larger context window.

[[sources/runs/2026/09/2026-09-06-configurable-context-full-resource-swap-exclusion]]
preserves the full 13 GB elastic drill's incomplete first attempt: the first
answer is exact and the sampled footprint remains below the ceiling, but
eight global swap-ins stop the diagnostic before a second completed answer.
Two controls without an owned model also observe swap-ins. No process is
attributed from global counters, no resource criterion is relaxed, and the
full MTP/image diagnostic does not start after the failure.

[[sources/runs/2026/09/2026-09-06-configurable-context-vision-target-counterexample]]
records independent tower/reference parity and the subsequent 10 GB image
suite's four failures. Full-size fruit and two-image requests receive the
correct typed memory refusal. The raw 21-pass report also exposes one fixture
false positive: an empty error answer counted as different image content.
Its prospective correction requires successful, nonempty responses. The
full-image successor reserves its actual attention workspace at 14.5 GB with
a 3072-token prefill reservation and a 20.5 GB real preflight; the ordinary
quality probe remains at 10 GB. Its outcome is not yet recorded here.

P5 has not run. Full resource, retained/minimum/pass-transition capacity and
remaining client/release/installed acceptance remain open. The public ceiling
is still 65536 and the default is 32768. Neither a plan nor an excluded
interval is a 262144-token qualification.

### Full images and actual clients complete (2026-09-06)

[[sources/runs/2026/09/2026-09-06-configurable-context-full-image-and-actual-client-pass]]
records all 25 full-image assertions passing on V202, including successful
nonempty responses for the different-picture predicate. The original images
use an explicit 14.5 GB total target and a 3072-token prefill reservation,
after a 20.5 GB real preflight. That override is local to the full-image
server. The original 10 GB refusal remains preserved. A separate ordinary
10 GB server passes all 15 quality assertions. Actual pinned Hermes at 65K
passes its tool/follow-up/title/image flow with exactly one fixture tool
execution, and actual Ollama returns the dog image's correct subject.

`Tools/verify.sh`, the helper and testing instructions now carry that exact
full-image profile. The helper's semantic correction was exercised; its
subsequent header edit is documentation only. No runtime source, model
ceiling, default option, image fixture or memory criterion changed. Timing
and capacity conclusions remain excluded because global swap-ins continue.
Full resource, P5 and release/installed acceptance remain open.

### Structured overflow refusals and verification completeness (2026-09-07)

[[sources/runs/2026/09/2026-09-07-configurable-context-ollama-overflow-wire-counterexample]]
preserves the original HTTP suite's 73/74 result and four independently
recorded live HTTP 400 responses. Length enforcement works, but the old
shell assertion matches obsolete prose and both Ollama overflow branches
omit the structured code/details used by other refusals. A focused source
successor keeps the legacy string and status, adds the existing typed
refusal wrapper, and exercises 21 new pre-header/code/no-success assertions
across all seven dialect variants. The shell suite now checks status and
code directly. Its shared build and affected acceptance are pending.

The full verification script also now treats missing vision-reference
dependencies and insufficient full-image headroom as failed acceptance,
while preserving the no-launch behavior and rerun guidance. The reviewed
provider-free shell/predicate checks live in the shared V209 evidence;
no mandatory vision skip can silently yield a passing full battery.

The successful V202 client source is marked discarded for resource/timing
measurement because its recorded global swap-ins are nonzero. Its exact
raw body and passing correctness assertions are preserved unchanged. The
flag is measurement disposition, not a claim that those client assertions
failed. The independent runtime correction leaves default 32768, public
65536, all optional defaults and the memory ledger unchanged.

### Additional OpenAI code field found by the unchanged matrix (2026-09-07)

[[sources/runs/2026/09/2026-09-07-optimization-typed-context-wire-counterexample]]
preserves the shared V211 successor. Build, T0 22346 and CLI116 pass; the
extended context matrix passes 854 of 856 assertions and stops before the
two actual HTTP suites. All four Ollama structured-code cases pass. Only
the OpenAI JSON/SSE structured-code checks fail: their local helper puts
the code in the existing type field but omits error.code.

The one-line V214 correction adds error.code while retaining type, message
and HTTP status. The same 856 assertions and actual suites are being rebuilt
and rerun on V215. No fixture, criterion, default, context ceiling or memory
constant changes. The V211 result remains preserved, not replaced.

A byte-exact local rollback copy of installed public v0.2.11 is prepared
with both binary and Metal hashes; its doctor accepts configured65536. This
is preservation and a model-free configuration check only: rollback itself
and installation of the new context work have not run.

### Current integrated gate map (2026-09-07)

[[sources/runs/2026/09/2026-09-07-optimization-typed-context-correctness]]
records V215 passing T0 (33 groups, 22346 assertions), CLI116, all856 native
context-serving assertions, all74 actual API robustness assertions and the
four actual overflow requests. The two Ollama error codes and the additive
OpenAI error.code are present. Existing error text/type/status and successful
delivery are preserved. V215 changes no inference arithmetic, memory credit,
optimizer default or public context ceiling from the preceding integration.
Its native context-serving interval observes eight global swap-ins, and API
robustness observes28. The source is marked discarded:true for resource and
timing use; these predicate results support correctness only. V211's matching
metadata correction also preserves its complete original failed body/raw bytes.

| Acceptance | Current evidence and remaining boundary |
| --- | --- |
| C01–C03 | Frozen ordinary allocation goldens, additive CLI schema and discrete feasibility pass on the integrated source. Additional actual minimum-target accepted/refused neighbors are now recorded. No golden was refreshed. |
| C04–C05 | Owned-allocation and interleaved retention contracts pass; the corrected governor passes both80-assertion native variants in V202. Full-window retention capacity remains C19. |
| C06–C07 | All ten bounded numerical shape/prefix witnesses pass their1605 unchanged assertions and greedy-ID criteria; the full schedule satisfies actual query/key bounds. Normal long-window activation still requires P5 execution. |
| C08–C15 | Checked diagnostics, entrypoints, exact limits, deadline/queue clocks, ownership, pressure interruption and cleanup/recovery pass the identified component and live matrices. Their contaminated intervals carry no resource/timing claim. |
| C16–C17 | V215 passes all seven dialect variants and real HTTP overflow/robustness checks. The strict consumer fixture is engine-side evidence; actual Sevra H2 receiving-side action authority remains outside this claim. |
| C18–C19 | Eight exact prospective protocols are prepared, covering sixteen main rungs: memory/pass transitions, cold and four-conversation retained ladders through262144, then exact minimum-target full-window variants. None has executed or performed its mandatory full payload verification. |
| C20 | Live injected deadline/guard interruption and recovery are exercised without a memory hog or overlapping model. Existing full resource acceptance still remains open under C21. |
| C21 | Identified native, static, planner, sampler, numerical, image, cache and HTTP checks pass within their stated scopes. The full governor resource battery stopped on swap-ins; the remaining whole-process resource/recall battery and combined MTP/image resource completion remain open. |
| C22 | Public Swift compatibility, actual32K Ollama/gateway and65K Hermes/Ollama/gateway checks pass. Full images and actual Hermes CLI/compaction/image behavior have separate evidence. Context release, installed e2e and actual rollback remain unrun. |

The ordinary-target protocols are preserved at
[[sources/runs/2026/09/2026-09-07-configurable-context-v215-capacity-protocols]];
their exact minimum and pass-transition additions and campaign order are at
[[sources/runs/2026/09/2026-09-07-configurable-context-v215-minimum-and-transition-protocols]].
The campaign stops at the first failed profile/rung. A further83.21061301231384s
idle control observes16 global swap-ins with no owned model, preserved at
[[sources/runs/2026/09/2026-09-07-configurable-context-v215-idle-swap-control]].
No clean resource retry or capacity run followed that control.

[[sources/runs/2026/09/2026-09-07-configurable-context-installed-gate-discovery-preparation]]
records correcting the installed gate's discovery nesting before execution.
A subsequent review identified that its previously added expected doctor
refusal also needs explicit exit-status handling under pipefail; that bounded
harness correction is in review, with no installed run attempted.

P5 and P6 remain open. Public context stays65536, default32768, and the
separately qualified MTP/vision limits65536. The saved public0.2.11 binary
and Metal library prepare rollback but do not prove it. No context release,
installation, whole-plan completion or262144 support is claimed.

### Final harness review and resource hold (2026-09-07)

The bounded release-shell review is complete. Its exact20case-tested
correction now requires the expected doctor exit2 under pipefail as well as
typed insufficient_memory, validates the nested discovery cap before any POST,
and requires context_length_exceeded alongside HTTP400. This supersedes the
preceding pending harness status; the installed model suite itself is unrun.
The original failed proposal and passing successor are preserved at
[[sources/runs/2026/09/2026-09-07-optimization-default-and-release-acceptance-review]].
All143runtime source files still match the exactV215archive in both worktrees,
recorded at
[[sources/runs/2026/09/2026-09-07-configurable-context-v215-prepared-state-audit]].

The final readiness snapshot has21,662,023,680reclaimable bytes, below the
ordinary capacity profile's25GB prerequisite, with further background swap
activity. There is no owned model/compiler and the model lock is free. The
raw snapshot is at
[[sources/runs/2026/09/2026-09-07-configurable-context-v215-capacity-preflight-hold]].
No capacity or full resource run was attempted. The eight frozen profiles
remain unconsumed; P5/P6, remaining resource acceptance, installation and
rollback remain open. Default32768 and public65536 remain in force.

### Selected-candidate acceptance correction (2026-09-07)

[[sources/runs/2026/09/2026-09-07-configurable-context-candidate-selection-acceptance]] preserves the full five-file acceptance correction and its
first counterexamples. Static, planner and installer gates consistently use
the explicitly selected candidate, including paths with spaces/apostrophes.
The installer packages that executable and its colocated Metal library, then
verifies exact installed bytes through fresh/repeated activation, checksum
refusal and legacy upgrade. The static entrypoint retains the mandatory
qualification-driver checks. All64 planner assertions remain unchanged.

Six static-selection fixtures, ten real-install.sh selection/fault fixtures,
and the unchanged nine qualification-driver groups pass. The old installer
fails seven of the same ten cases. A separate private fixture installation of
V215 also passes exact binary/Metal identity; the real user installation and
rollback remain unexercised. This does not close release/installed C22.

On the loaded machine, the old quoted planner path produces18pass/46fail.
The corrected quoted and normal paths both produce58pass/6fail, with the
same six malformed-checkpoint diagnostics blocked by the real startup memory
guard. A captured direct fixture shows9.2GB reclaimable and an8.1GB target,
then insufficient allocation headroom before checkpoint parsing. These failures
are preserved; no expected error or guard is weakened. A complete64/64 planner
and full static pass remain required on a quiet machine. All143runtime source
files still match frozenV215 in both worktrees; no frozen P5 driver changes.

P5/P6 remain open. Eight prospective profiles/sixteen main rungs remain unrun;
no model payload verification or capacity run starts during this work. Public
65536 and default32768 remain unchanged. Loaded-machine results carry no
resource or timing qualification.

### Final acceptance-script integration (2026-09-07)

[[sources/runs/2026/09/2026-09-07-optimization-verification-selected-paths]]
records the full verification entrypoint preserving the selected executable
through its evaluated call sites; its nine focused fixtures pass. Mandatory
vision, context-qualification and installer checks remain enforced.
[[sources/runs/2026/09/2026-09-07-configurable-context-sampler-exit-and-binary-selection]]
preserves the five original sampler false passes and the corrected eight-case
full-shell fixture, plus all17real V215 sampler/NumPy/governor checks passing.
API version checks now require both the selected quoted executable and a
successful process exit. No new full74-case API server run is claimed.

[[sources/runs/2026/09/2026-09-07-optimization-mandatory-sampler-and-final-handoff]]
records the final mandatory static wiring: sampler8/static9/syntax3pass,
exact integrated files,95public-number checks and zero validation errors.
All143runtime sources and the frozen capacity drivers remain unchanged.
The shared context plan, source closure, public docs and client fixtures are
now integrated. P5/P6 remain open: all eight capacity profiles/sixteen main
rungs are unrun; the current six headroom-blocked planner checks, remaining
full resource tests, actual final clients, release/installation and rollback
still require their own passing evidence. Public65536/default32768 remain.
### Final release-response acceptance review (2026-09-07)

[[sources/runs/2026/09/2026-09-07-optimization-serial-and-installed-gate-integration]]
records16original installed-gate false passes and one quoted-binary-path
failure, followed by19/19passing complete-shell fixtures and mandatory static
wiring. The separate successor at
[[sources/runs/2026/09/2026-09-07-configurable-context-openai-release-completion]]
preserves those19cases and exposes nine OpenAI false passes. All28complete-shell
fixtures pass after requiring successful curl, one successful text completion,
nonempty assistant content and a positive integer completion-token count.
These are local process/response fixtures; no real installed model, socket,
release or rollback ran. The original failed scripts and raw results remain
preserved. The existing mandatory static entrypoint runs the expanded suite.

[[sources/runs/2026/09/2026-09-07-optimization-cached-planner-build-and-typed-parity]]
separately records the successful temporary cached build and441exact typed
planner comparisons, with shared V215runtime/release/build state restored.
It grants no new context capacity or performance claim. All eight V215P5
profiles/sixteen main rungs remain unrun. Full resource acceptance, P5/P6,
actual installed/release/rollback gates remain open; the original ordinary
capacity preflight remains25GB, public context65536 and default32768.


The source/protocol dependency split is preserved at
[[sources/runs/2026/09/2026-09-07-optimization-planner-metadata-and-context-boundary]].
The full262Kexpansion campaign remains necessary for this context-expansion
goal, while unchanged32768/65536optimization retains its own applicable gates.
No context profile is waived. That source also records the corrected e2e_release.sh
executable bit; verify.sh remains at its tracked0644mode.

### Software delivery with native testing explicitly deferred (2026-09-07)

Carlos instructed: finish implementation, use proxies to test what can be tested, and prepare the full work for testing later without running model/hardware qualification on this Mac. This changes execution, not the meaning of capacity or release evidence. No memory wait loop remains. The current software delivery gate is the runnable source/proxy suite and a portable native qualification handoff; the original applicable native C01–C22 cases remain deferred, never relabeled as passes.

[[sources/runs/2026/09/2026-09-07-configurable-context-portable-software-acceptance]] captures 79 passing Python unittest cases across nine suites and 964167 assertions in the isolated Swift policy executable. Most assertions exercise schedule products across many dispatches, not independent model tasks. Production Plan, ContextGeometry, feasibility, GovernorPolicy and RequestController execute with inert device readings, fake clocks, synthetic availability and exact source-derived declarations. No SwiftPM/MLX build, tensor allocation, model, server or real pressure test ran. CI wiring is delivered but has not been executed remotely in this task.

Planner's three public device-reading functions now live in PlannerDevice.swift with byte-identical bodies; planning arithmetic, public signatures and availabilityOverride are unchanged. Context evidence validation rejects malformed/duplicate-terminal tool streams, invalid token IDs/types and missing MLX observations. Native readiness also refuses unknown/non-normal OS pressure. Counterexamples and before/after hashes are preserved in the source. Optional PlannerCostModel source joins the proxy compile/hash closure when present; previous frozen binaries and driver snapshots remain historical and immutable.

`make context-test` is the software command. Its fresh JSON report binds the actual source/driver closure, lists proxy coverage for every C01–C22 case, and keeps hardware/release qualification false. `Tools/context_acceptance.py prepare` exports source and exact acceptance profiles without a model. On the intended target, `bind` verifies a freshly built candidate's source archive and resolves only metadata/plan-only requests; retained profiles explicitly price their original warm-up lengths and retention mode. An old candidate is rejected before model access. `run-capacity --execute-on-target` runs required governor/MTP+vision resource gates and the original eight capacity profiles/sixteen main rungs sequentially, preserving minimum dependencies, full model verification, readiness and first-failure stop. This code was exercised with inert children, including successful binding and rejection of forged source and omitted/reordered profiles. Portable source export/extraction identity passed.

Public/default context stays65536/32768; MTP/vision limits stay65536. The full model-limit text path exists behind explicit diagnostic qualification. A larger public serving limit, real numerical/capacity/API/client acceptance, complete native build and release/install/rollback still need the intended target's evidence. They are deliberately deferred under Carlos's instruction and do not block delivering or reviewing the software. No full-feature release or measured262K support is claimed.

### Explicit window CLI testing (2026-09-07)

[[sources/runs/2026/09/2026-09-07-configurable-context-window-cli-matrix]] records the final model-free matrix against V215: 93 commands pass across 1024, 4096, 8192, 16384, 32768, 65536, 128256, 131072 and 262144 tokens. Public configuration accepts windows through65536 and explicitly refuses larger ones. Scheduling passes at every listed window for cold, middle-prefix and last-token starts, with requested chunks256/4095/4096 and actual padded query/key products bounded. Immediate public overflow and cold/continued model overflow are refused. Three adversarial validator tests pass; the original test-only ledger multiplier error is retained in the source.

`Tools/context_window_matrix.py` and the testing guide make this check repeatable without compilation or a model. Candidate artifacts and source snapshots are checked at both ends. The final restored-checkout receipt identifies Plan.swift and PlannerDevice.swift as the only V215 differences, so it remains identified-candidate CLI evidence rather than a new full build of current source. No runtime source changed for this matrix.

The software implementation is delivered, but the whole plan is not complete: full native capacity, final applicable build/numerical/resource/API/client gates, public-limit activation and release/install/rollback still require their own evidence. This latest request allowed feasible context testing; available resources did not support a fresh model launch. No native test, memory waiter or expanded-capacity claim was introduced. Existing proxy and historical model receipts retain their original scope.
