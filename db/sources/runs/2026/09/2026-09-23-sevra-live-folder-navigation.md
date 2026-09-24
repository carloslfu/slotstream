---
type: run
id: 01m37qgxmt1f12etecehepp0v1
created: 2026-09-23T18:12:53.530313+00:00
updated: 2026-09-23T18:13:18.361633+00:00
summary: Live folder navigation, reliable continuation and real-model reviewed edits
binary: 9d14b663cd309690564909521e00b4e9e5505ef43820f9769bcb2b03801990f9
captured_at: 2026-09-23
command: sevra-mac-checks --sources; sevra-mac-checks --real-sources --home NEW_DIR; bash Tools/check_sevra_mac.sh; bash Tools/check_sevra_apps_ui.sh; bash Tools/build_sevra_mac.sh; native cua_repl; Tools/brain_gates.sh
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Sevra live folder navigation qualification
tool: Native Mac runtime, model and UI checks
---
[Capture](../../../artifacts/sevra-live-folder-navigation-2026-09-23/capture.tar.gz), [manifest](../../../artifacts/sevra-live-folder-navigation-2026-09-23/manifest.json). Archive SHA-256: `6420ac407ad8ac33b5e1f76cfd1ffe4f79759dca6cedc3d78a2584273e7f076c`. Every archived member was read back and verified against the manifest. Functional qualification only; the live-machine observations do not establish an inference or overall performance gain.

## Reproduction and correction

The prior implementation refused an entire 2,001-file folder, left no source tools after refusal, missed files created after attachment, retained old names after renames and skipped five later matches in a 25-match file. The original reproduction source, results and source identity are preserved under `prior-reproduction/`.

The replacement accepts a scoped root descriptor without enumerating the tree. It provides live direct-directory listing, recursive filename discovery, scoped content search and relative-path reads. Cursors retain bounded native directory streams and validate current ancestors; file-search continuation also binds the byte position to the exact source and extracted text. An initial attempt to reopen streams with old Darwin directory cookies repeated pages and was replaced before qualification. IDs name attachment-relative paths rather than an unbounded registered inventory.

## Functional and model evidence

`--sources` and the full runtime runner passed against the final production runtime. The synthetic 12,001-file folder attached, listed each file exactly once and yielded its late content target through continuation. Search returned all 57 matching lines in one file with correct UTF-8 offsets. Tests cover new files, rename, delete, atomic replacement, query-bound cursors, directory and content changes, cancellation, unreadable/omitted coverage, depth scoping, dependency scoping, single-file grants, hidden entries, symbolic links, detachment and bounded descriptors across multiple sessions. A changed file must be read again before an edit can be staged.

`--real-sources` ran one model at a time with an explicit 10 GB budget after a real memory preflight. Four actual model jobs completed: an accurate explanation of how to attach files; filename discovery and a cited random code in a folder with 2,502 files; rediscovery after a rename and changed random code without reattachment; and exactly one staged edit. The source remained unchanged before approval, approval wrote the exact reviewed text, and undo restored the original bytes. `real/receipt.json` preserves prompts, answers, actual tool traces, excerpts and an empty failure list. The test process exited before compilation resumed.

The native pipeline passed composer persistence, presentation, scrolling, thinking controls, memory UI and the complete runtime suite, including document/OCR isolation, reviewed writes, restart and recovery, knowledge bases, skills, mini-apps and the new live-source checks. The first apps UI run failed because its scripted model still emitted obsolete `file-1` IDs. After updating that fixture to use the actual path handles, `apps-ui-final.log` passed the complete production review, Write, Undo and mini-app flows. Both the original failure and the passing rerun are retained. Documentation/brain gates passed with zero errors and the two existing historical log warnings; no unrelated log history was rewritten.

## Rebuilt native app

App SHA-256: `2dbb7c2b6fcbf55e8f2e3c61e332c2bc5099b73a95253ddab71b5bf67a02118e`. Check-runner SHA-256: `9d14b663cd309690564909521e00b4e9e5505ef43820f9769bcb2b03801990f9`. The bundle's build-input manifest matches the current development source bytes, and ad-hoc signing verification passed. Native UI automation attached the synthetic large folder through the ordinary file picker, observed the live-folder chip and no size error, then deliberately retried the same folder. The duplicate error offered Dismiss without the unrelated Home-reconciliation action. The test attachment was removed, its empty test thread archived, and the user's original conversation restored. No private conversation text or file-picker contents were archived.

The source snapshot and implementation patch preserve the tested app changes. Preexisting engine optimization work was left unchanged and is outside this change. This is local development qualification, not a signed public-release or Xcode CI certificate. Broad search remains bounded and may require continuations; skipped coverage is explicit. There is no background filesystem index or unrestricted Mac/screen/shell access.
