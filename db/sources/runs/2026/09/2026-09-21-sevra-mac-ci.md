---
type: run
id: 01m31b4v2espnsxvf25q14te8t
created: 2026-09-21T06:41:08.174259+00:00
updated: 2026-09-21T06:41:08.806964+00:00
summary: 'The Sevra Mac app''s own CI: the Xcode project built on all five runs, and runner-only check failures were fixed until the fifth run passed'
binary: GitHub Actions runs 35560821742, 35561511349, 35562962544, 35564705903, 35566058309 and 35567513919; source revisions 40209f8, 3ff83ff, 70f48f8, c0b7cd4, 92dffed and 859c28e
captured_at: 2026-09-21
command: bash Tools/check_sevra_mac.sh; bash Tools/build_sevra_xcode.sh
discarded: 'false'
machines: '[[records/machines/github-actions-macos-26]]'
title: 'The Sevra Mac app in CI: scripted checks and its first Xcode builds'
tool: 'GitHub Actions sevra-mac workflow: Tools/check_sevra_mac.sh and Tools/build_sevra_xcode.sh'
---
Until 2026-09-21 nothing in CI built or checked the Sevra Mac app in `apps/macos`. `ci.yml` skipped only documentation, so an app push ran the engine's three jobs and came back green without the app being built, and nothing had ever built the Xcode project, because the development Mac has only the Command Line Tools. From commit `40209f8` the app has its own workflow, `sevra-mac.yml`, on the [[records/machines/github-actions-macos-26]] pool. It runs on changes to the app, to the engine sources and packages the app builds on, and to its scripts. `ci.yml` now ignores `apps/**`, so it keeps testing the engine alone and its release gate is unchanged.

## What it runs

- `checks` installs the pinned dbmd 0.13.4 with `Tools/dbmd_install.sh` and runs `bash Tools/check_sevra_mac.sh`, the command a development Mac runs: the composer and presentation suites, the offscreen scroll, thinking and apps checks, and `sevra-mac-checks` over scripted inference in disposable Homes. No model weights are involved. From `70f48f8` the script runs every suite even after one fails and ends by naming the failed suites, so one run reports every failure. The offscreen snapshots are kept as the run's artifact.
- `xcode` installs the pinned dbmd and Metal library and runs `bash Tools/build_sevra_xcode.sh`: a Release build of `apps/macos/Sevra.xcodeproj` for Apple silicon, ad hoc signed. The script seeds Xcode's package pins from `apps/macos/Package.resolved` and fails if Xcode resolved any other version, if the bundle lacks its executable, Metal library, dbmd or document helper, or if `codesign --verify --deep --strict` fails.

`Tools/check_sevra_scroll.sh` listed its objects with ripgrep, which a clean Mac may not have. Commit `7d028af` uses `find`, which lists the same objects for all five targets on the development Mac.

Every job ran on runner image `macos-26-arm64` version 20260907.0351.1, macOS 26.6.2 (25G83), with Xcode 26.6 selected.

## Runs

| GitHub Actions run | commit | `checks` | `xcode` |
|---|---|---|---|
| 35560821742 | `40209f8` | failed in the composer suite, 506 s | passed, 465 s |
| 35561511349 | `3ff83ff` | failed in the thinking UI check, 1,187 s | passed, 445 s |
| 35562962544 | `70f48f8` | three suites failed, 1,128 s | passed, 620 s |
| 35564705903 | `c0b7cd4` | failed only in image and scan recognition, 1,065 s | passed, 493 s |
| 35566058309 | `92dffed` | passed, 1,251 s, with image and scan recognition skipped | passed, 501 s |

The first run was the project's first Xcode build anywhere. Its log ends:

```
** BUILD SUCCEEDED **
Xcode built the 13 pinned package versions
built and verified .build/xcode/Build/Products/Release/Sevra.app
```

The first run's `checks` job stopped at the first suite, the composer checks:

```
FAIL: Line 163: one debounced save
```

That check made 100 edits with a 10 ms debounce and gave the save a fixed 40 ms. On the runner the save had not landed in time. It had passed on every development Mac run, so it was timing, not the app. Commit `3ff83ff` waits for the save on the clock, up to 10 seconds, then requires exactly one save, of the newest text, and gives the check that nothing is saved after Send twenty debounce periods instead of four.

The second run passed the composer suite, the presentation suite and the scroll check, then failed one assertion of the thinking UI check:

```
FAIL: opened working notes show the streaming thought and its privacy line
```

The check clicks the chevron of the collapsed "Working notes (thinking)" disclosure while a scripted thought streams. The runner clicked at (319, 164), on the chevron in its own snapshot and at the point where the same click opens the disclosure on the development Mac, but the snapshot taken 0.6 s later, `04-thinking-live.png`, still shows it closed. Commit `286c6b8`, the response-details work from another session, replaces that disclosure with a details popover and this click with a direct activation of the link, so the check was left to it. Because the script stopped at its first failing suite, the apps UI check and `sevra-mac-checks` never ran, which is why `70f48f8` runs every suite.

The third run, with every suite running, failed three: the same thinking UI assertion, the Apps & Skills check and `sevra-mac-checks`.

- The Apps & Skills check looked for "/app" in the text Vision recognizes from its snapshot. The runner's snapshot shows the row correctly, but Vision reads it as "lapp"; on the development Mac's own snapshot it reads "/skill" as "Iskill". Commit `7412310` finds both built-in skills by their descriptions, which Vision reads in full on both.
- `sevra-mac-checks` stopped right after its memory plans with "This memory limit exceeds the supported budget on this Mac. Choose Automatic or a lower limit." Its deferred-budget block set custom limits of 10 and 9 GB, and the runtime checks a custom limit against the Mac it runs on, which on the runner cannot hold 10 GB. The error ended the suite before its adverse, IPC, personal-loop, thinking and basics checks ran. Commit `c0b7cd4` runs the same steps with Automatic preferences on a Mac that cannot hold 10 GB; a Mac that can keeps the custom limits.

The fourth run passed both UI suites, the thinking check now through the details popover, and `sevra-mac-checks` ran every suite on CI for the first time. Everything passed except one step of the basics suite: reading an image failed with "Text recognition is unavailable on this Mac right now." The document helper proves that Vision works inside its sandbox before it recognizes a page, and on the runner that self-test fails, although Vision reads the UI checks' snapshots outside the sandbox on the same runner. Commit `0bcf695` sets `SEVRA_CHECKS_OCR_OPTIONAL` in the workflow, and only then does the basics suite accept exactly that error and skip the image and scan assertions, printing a SKIP line. A development Mac must still recognize them.

The fifth run, on `92dffed`, passed both jobs. Every suite ran, and the basics suite printed its one SKIP line for image and scan recognition.

The path filters behaved as intended. The engine and workflow push `40209f8` started `ci`, `sevra-mac`, `context-proxies` and `docs`; the app-only push `3ff83ff` started `sevra-mac` alone. The script-only push `70f48f8` also started `ci` and `context-proxies`, which watch all of `Tools/`. That is intended: the engine's static gates syntax-check every `Tools/*.sh`. Commit `92dffed` adds `sevra-mac.yml` to the engine workflow's ignored paths, so a change to only the app's workflow no longer starts the engine's jobs. Runs superseded by a later push were cancelled to free macOS runners.

## Engine CI

The engine's coverage job for `70f48f8` failed `expert-lookahead-forecast-merge`, although `weights-free` passed the same check on that commit and the engine code was unchanged from the passing `40209f8`. The check issued two tickets at one tick for a single I/O lane. Their workers start in no fixed order, and on the slower instrumented build the second read all of its pieces before the first reached the piece the check holds. Commit `405e157` issues the holding ticket alone and the second a tick later, while the lane is held. All 69 engine checks then passed in coverage for `c0b7cd4`, but the ratchet saw `Sources/Slotstream/ExpertPrefetch.swift` fall from 87.57% to 87.28%: the waiting ticket was now usually discarded before it ever waited for the lane, so no waiting ticket's priority was evaluated. Commit `146e05e` runs the demand batch that follows a split claim, so the promoted ticket reads its remaining pieces at demand priority on every run, and the check asserts it.

The coverage job for `92dffed` then passed all 69 checks, and `ExpertPrefetch.swift` was within its allowance again, covering the same lines as the passing `40209f8`. The ratchet failed `Sources/Slotstream/SlotpackDownload.swift` instead, 97.18% to 96.55%: 308 of 319 lines against a floor recorded at 310. The run for `40209f8` had reached two lines that run only when a fetched object waits more than 100 ms for a decode slot. The run for `c0b7cd4` reached neither but counted two lines of a worker loop with an execution count of 18446744073709551615, a wrapped-around negative count from LLVM's profile counters rather than a real execution; the commit message of `859c28e` calls that a scheduling loop. The ratchet allows a drop of two lines, but floors are stored to two decimals, and this one had rounded up from 97.1787, so the exact two-line drop failed by 0.0013 points. Commit `859c28e` allows for the rounding; replayed on that run's lcov the ratchet passes, a three-line drop still fails, and a new case in `Tools/coverage_ratchet_test.py` covers both. The engine workflow then passed all three jobs on `859c28e`, run 35567513919: `weights-free`, `public-library` and `coverage`, with no file below its floor.

## Not covered

The real-model checks need the weights and stay on a development Mac. The runner uses the published dbmd 0.13.4, while the development Mac uses a local 0.13.5 build. Image and scan recognition, which the runner cannot do inside the helper's sandbox, is checked only on a development Mac. CI builds the Xcode app but does not launch it. A Developer ID signature, notarization and an App Sandbox build remain open.
