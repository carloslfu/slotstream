---
type: run
id: 01m2x3mnv7myf498twvfxqpngn
created: 2026-09-19T15:13:00.775733+00:00
updated: 2026-09-19T15:13:01.465600+00:00
summary: Told only that files were attached, the model asked what "this" meant; with each attachment named, "what is this?" reads the attached PDF
binary: sevra-mac-checks 7d58f0727e996043
captured_at: 2026-09-19
command: sevra-mac-checks --basics, also with the attachment note removed; bash Tools/check_sevra_mac.sh; sevra-mac-checks --real-basics --home <new>
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Sevra names attachments, so "what is this?" reads the attached file
tool: sevra-mac-checks, Tools/check_sevra_mac.sh
---
In the live Sevra app on 2026-09-19, a person attached one PDF to a thread, read only, and asked "what uis this?". The model answered that it did not have enough context to know what "this" referred to, and asked whether it was a file, an error message or something else. It had called no tool, so the run's Activity was empty.

## Cause

The run offered the `read` and `document` tool groups, so the file tools were there. The system instructions said only "Attached files: use source.list, source.search and source.read before answering from them". Nothing named the attachment, so a question with no noun gave the model nothing to point "this" at, and it asked rather than read.

## Fix

The instructions now list the thread's attachments, one line each, with the name quoted as data (at most 120 characters), the kind and the access:

```
Attached to this thread:
- "pitch-deck.pdf" (file, read only)
When the request says "this", "it" or "the file" without naming something else, it means these attachments. Read them with the source tools before answering, instead of asking what the person means.
```

A name is chosen by the person and can say anything, so it is quoted and escaped like other untrusted data. The line changes only when an attachment or its access changes.

## Checks

The new scripted check `attachmentReferenceChecks` in the basics suite confirms three things. A thread with one attached PDF names it and says what "this" refers to. After the access changes, and a second file whose name holds quotation marks is attached, both lines are current and the name stays quoted. A thread with nothing attached names nothing. With the note removed from the runtime, the check fails on the first assertion. `bash Tools/check_sevra_mac.sh` passes every suite.

The real-model basics check gained a fourth job that asks exactly "what is this?" about the attached `cedar-report.pdf`. At the 10 GB plan it passed all fourteen checks in 636 seconds with no swap growth. The model listed and read the file, then described it:

```
activity: Model: I'll take a look at the attached file.
          source.list: returned bounded source data
          source.read: returned bounded source data
answer:   **cedar-report.pdf** is a short 3-page briefing about the "Cedar" pilot program. It covers three points [S1]: ...
```

The answer names the north region and three clinics, the $7,300 budget held by the operations team, and the vendor-delay risk. The edit job wrote the same file as before, SHA-256 `646bb50f7a5184693ac355518a0ddaca2854e55e528f640b897bbf7b8d00db7d`. The PDF job's answer is worded differently from the pinned-fixture runs, because its instructions now name its attached folder. That is a different input, not variance.
