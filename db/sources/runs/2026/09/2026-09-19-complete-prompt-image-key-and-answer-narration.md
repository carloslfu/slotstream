---
type: run
id: 01m2wzx64wfhv5ez8vx418gyr4
created: 2026-09-19T14:07:45.308265+00:00
updated: 2026-09-19T14:07:49.446003+00:00
summary: The complete-prompt check looked up image states with the wrong key and now passes 274 and 289; Sevra answers drop tool-round narration; the real-model PDF fixture is byte-stable
binary: slotstream 40754da10539690b; slotstream-checks cbcefb75ab03fa1d; sevra-mac-checks 71a870c90e6a4426 (final; 46232b686dbe5fd4 before the fixture pin)
captured_at: 2026-09-19
command: slotstream optimization-state-check --variant complete-prompt, complete-prompt-mtp, integrated, prefix-vision; slotstream-checks --tier t0 --tier t1; bash Tools/check_sevra_mac.sh; sevra-mac-checks --basics with the runtime change reverted; sevra-mac-checks --real-basics three times; SEVRA_APP_UNDER_TEST=<app> bash Tools/check_sevra_apps_ui.sh
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Complete-prompt image key, the draft handoff under the resume rule, and answers without tool-round narration
tool: slotstream optimization-state-check, slotstream-checks, Tools/check_sevra_mac.sh, sevra-mac-checks, Tools/check_sevra_apps_ui.sh
---
The 2026-09-17 conversation-resume work left three things open: a model check that stopped at its first image case, a thermal gate, and a Sevra answer that opened with the model's narration. Verifying the answer fix found a fourth, a test PDF whose bytes changed on every run. All runs are on one development Mac, on the same weights, from `main` at `2872820` plus the changes described here.

## The complete-prompt check stopped at its first image case

`slotstream optimization-state-check --variant complete-prompt` threw `complete-prompt diagnostic lost consumed state` at its sixth case, a 273-token prompt with an image at position 1. It did so on 0.2.22, on the frozen build of 2026-09-17 12:31 that predates the resume rule, and with `SLOTSTREAM_OPT_ALIGNED_RESUME=0`.

The cause was in the check, not the cache. Tiling vision queries changes the rows an image produces, so generation keys an image prompt's retained states on segments whose preparation identity names the tile. The deployed family, `integrationCandidate`, tiles queries at 256 since the unified qualification commit of 2026-09-10. The check kept looking retained states up with `VisionPrompt.segments`, the untiled identity, so `PrefixCache.imagesAgree` refused every image lookup. On 2026-09-06, before tiling joined the family, the same check passed 273 plain and 281 speculative assertions.

Two consequences were hidden behind that stop. The check's "public API remains strictly extend-only" assertion used the same wrong key, so for images it passed without testing anything. And the check never reached its later cases, which include every speculative-decoding case.

The fix gives the key one source. `VisionPrompt.cacheSegments(for:)` derives it from the request's optimizations, and generation, the complete-prompt check and the integrated check all call it. `Generator` computes exactly the segments it computed before.

## What the speculative cases found once they ran

With the image key fixed, the speculative variant ran to its end and failed 4 of 282 assertions, all in the plain-to-draft handoff. The check still expected the handoff from before the resume rule: a state built without the draft head finishes the next request plain, and the request after that rebuilds with the head. Under the rule a request only continues a state built under its own settings, draft mode included, so the plain state is refused. That is the rule working, and the check was out of date.

The handoff is now checked both ways:

```
PASS  rule off: plain cached state finishes current request plain
PASS  rule off: plain-to-draft transition really reused state
PASS  rule off: complete prompt with missing head is not an MTP hit
PASS  rule off: missing draft head is rebuilt from the full prompt
PASS  rule off: rebuilt draft participates
PASS  rule off: rebuilt draft checkpoint can be reused completely
PASS  rule off: reused draft output is exact
PASS  rule on: a plain state is not continued by a draft request
PASS  rule on: the draft request reads its whole prompt
PASS  rule on: the draft takes part from the first request
PASS  rule on: the draft request answers what a cold read does
PASS  rule on: rebuilt draft checkpoint can be reused completely
PASS  rule on: reused draft output is exact
```

## Engine checks

| check | before | after |
|---|---|---|
| `optimization-state-check --variant complete-prompt` | threw at the first image case | 274 pass, 0 fail |
| `optimization-state-check --variant complete-prompt-mtp` | threw at the first image case | 289 pass, 0 fail |
| `optimization-state-check --variant integrated` | | 286 pass, 0 fail |
| `optimization-state-check --variant prefix-vision` | | 32 pass, 0 fail |
| `slotstream-checks --tier t0 --tier t1` | | 69 checks, 31,261 assertions, 0 fail |

The intermediate speculative run, with the image key fixed and the old handoff expectations, was 278 pass and 4 fail.

## all-hit-replay was the machine, not the code

On 2026-09-17, after a day of model runs, `optimization-state-check --variant all-hit-replay` stopped in its first round on one failure: the gate that requires nominal thermal state and Low Power Mode off before and after the replay. That round's exact-logits, all-hits, swap and footprint assertions passed. On 2026-09-18, with the machine cool, it passed all 109 assertions. The gate is meant to refuse a replay taken while the Mac is throttled, so nothing changed.

## Sevra answers no longer open with the model's narration

The real-model basics job's PDF answer began "I'll look through the attached files to find the report and the Cedar pilot budget." before the answer. The runtime appended every round's text to the reply, including the words the model writes before calling a tool.

Now the words in a round that calls a working tool go to the run's Activity as one line, bounded to 280 characters, ahead of the calls they introduce. The reply is the final round's text, or the text beside a proposal. If the final round has no text of its own, the reply keeps what the model wrote along the way, so a finished job never ends empty.

The new scripted check `narrationChecks` in the basics suite covers a two-round job, a final round with no text and an over-long line. Reverting the runtime change makes it fail on the narration text:

```
CHECK FAILED: the answer is the final round's text alone (I'll look through the attached files to find the budget.
```

With the change, `bash Tools/check_sevra_mac.sh` passes every suite, including the offscreen view checks.

The real-model basics check, `sevra-mac-checks --real-basics` at the 10 GB plan with 961 expert slots, passed all twelve checks in 585 seconds with no swap growth. Its PDF answer now starts with the answer, and the words moved to the run's Activity:

```
answer:   **Approved Cedar pilot budget: $7,300**, held by the operations team [S1].

          This appears on **page 2** of `cedar-report.pdf` [S1].
activity: Model: I'll look through the attached files to find the report and the Cedar pilot budget.
          source.list: returned bounded source data
          source.search: returned bounded source data
          source.read: returned bounded source data
```

The edit trace is unchanged, `source.list`, `source.read`, `file.edit: staged for review`, and writes the same file, SHA-256 `646bb50f7a5184693ac355518a0ddaca2854e55e528f640b897bbf7b8d00db7d`. The counter app it proposed passed the app-under-test harness: it showed 3 after reopening and kept one record.

## The PDF fixture changed on every run

That answer is worded differently from the one on 2026-09-18, which read "The approved Cedar pilot budget is **$7,300**". The engine plan was the same, 961 slots, and the engine computes the same thing in both builds. The input changed: Quartz stamps every PDF with the time and a random document ID, so the generated `cedar-report.pdf` had a different SHA-256 on every run (`7b91cdfe…`, `907ede21…`, `bc80537b…`, `d7ff37d1…` across four runs), and `source.read` returns that SHA-256 to the model. Two runs on 2026-09-17 happened to give the same answer; the note that they matched "because answers are decoded greedily" gave the wrong reason.

`Fixture.pdf` now pins the creation and modification times and the document ID to fixed values of the same length, so every byte offset stays valid. An encrypted fixture keeps its ID, because the key that opens it is derived from it. The basics suite asserts that two generated PDFs are identical, and PDFKit reads the pinned files.

Two runs of the real-model check on the pinned fixture, one after the other on the same Home path, passed all twelve checks in 582 and 543 seconds. They gave the same excerpt hash, `b2e981097a516816…`, the same PDF answer and Activity, the same edit, and the same app file, SHA-256 `4cbc8fcaf1ff8d22…`, which passed the app-under-test harness:

```
answer:   **Approved Cedar pilot budget: $7,300**, held by the operations team.

          This appears on **page 2** of `cedar-report.pdf` [S1].
```

## Not changed

The window between Sevra's record re-check and dbmd's own write stays open. dbmd 0.13.5-dev.4 has no compare-and-set: `body set` takes no expected hash and re-stamps `updated` with its indexes written through, so the runtime cannot make dbmd's write conditional or place dbmd's result itself without taking over the index. Closing it needs that option in dbmd.
