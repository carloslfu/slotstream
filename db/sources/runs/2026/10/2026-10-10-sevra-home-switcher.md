---
type: run
id: 01m4jwdzvem8ce90q2g6d1y0fy
created: 2026-10-10T12:26:00.942390+00:00
updated: 2026-10-10T12:26:13.613293+00:00
summary: Native Home switching, exact draft persistence, isolation and offscreen UI acceptance with the final development bundle
binary: 8f317da74054809fc5375b03e2e9ef2df7b6b211e76e8c30ec749abd3825eab2
captured_at: 2026-10-10
command: bash Tools/check_sevra_mac.sh; bash Tools/build_sevra_mac.sh; plutil -lint apps/macos/Sevra.xcodeproj/project.pbxproj; git diff --check
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Sevra native Home switching acceptance
tool: SwiftPM, native AppKit UI and real dbmd with scripted inference
---
# Native Home switching acceptance

Captured on the MacBook Pro M5 Pro with 48 GB unified memory. This is functional development-app evidence with scripted inference and real dbmd 0.14.6. No model was loaded. It makes no inference-performance, public-release, complete VoiceOver or live IME claim.

Commands completed with exit status 0:

```sh
bash Tools/check_sevra_mac.sh > /tmp/sevra-home-full-checks.log 2>&1
bash Tools/build_sevra_mac.sh > /tmp/sevra-home-bundle.log 2>&1
plutil -lint apps/macos/Sevra.xcodeproj/project.pbxproj
git diff --check
```

The full Mac script ran composer, presentation, scrolling, thinking UI, apps UI, memory UI, Home UI, runtime and settings-without-Metal checks. There were no failed suites. Swift linking emitted existing expired Clang module-cache debug-information warnings; these did not prevent successful checks or bundle construction. This was a SwiftPM build, not an Xcode project build.

The Home suite constructs actual AppModel, HomeNavigation, ContentView and HomeChooser with disposable Homes. It substitutes only the inference adapter. It clicks a rendered recent-Home row through AppKit events, then verifies that the active session changed. Light and dark chooser/sidebar renders were inspected. The compact-layout check verifies that the menu reveals the chooser; it is not a full keyboard or assistive-technology qualification. No user Home was opened or mutated by these checks.

## Raw Home suite output

Contiguous excerpt from the full Mac check log, starting at `PASS: initial Home opens` and ending at `Home switching and native UI checks passed.`:

```text
PASS: initial Home opens
PASS: create and switch to a separate Home
PASS: new Home has no previous Home drafts
PASS: Homes have separate identities
PASS: closed runtime rejects stale writes
PASS: return to prior Home while old runtime is still retained
PASS: conversation draft restored exactly
PASS: journal draft restored exactly
PASS: last selected Home persists for next launch
PASS: explicit development Home does not replace saved startup Home
PASS: missing recent Home is refused
PASS: missing Home is not silently recreated
PASS: new Home refuses a nonempty folder
PASS: existing unrelated files preserved
PASS: nested Homes refused
PASS: symbolic-link Home refused
PASS: Home owned by another session is refused
PASS: failed open leaves the current Home usable
PASS: draft conflict blocks switching
PASS: conflicting draft remains visible in old Home
PASS: cancel preserves Incognito and current Home
PASS: cancel does not erase Incognito
PASS: confirmed switch closes Incognito
PASS: second Home retains only its own draft
PASS: switch back after private session
PASS: Incognito does not survive reopening
PASS: cancel keeps active Home
PASS: confirmed switch stops active work before handoff
PASS: old work is terminal before next Home is shown
PASS: chooser renders current and recent Homes with create/open actions
PASS: clicking the rendered recent Home switches the actual session
PASS: Home switcher is visible in production sidebar
PASS: Home menu remains reachable with collapsed navigation
PASS: final Home closes cleanly
Home switching and native UI checks passed.
```

## Raw final build completion output

Lines selected with `rg "^Build of product '" /tmp/sevra-home-bundle.log`:

```text
Build of product 'Sevra' complete! (20.63s)
Build of product 'sevra-extract' complete! (0.29s)
```

## Delivered development bundle

Final bundle: `.build/Sevra.app`. Ad-hoc signing is not public distribution qualification. SHA-256 values below were computed after signing; the input manifest records the original dbmd helper hash before signing.

```text
8f317da74054809fc5375b03e2e9ef2df7b6b211e76e8c30ec749abd3825eab2  .build/Sevra.app/Contents/MacOS/Sevra
d831bfcb6f700e2f60dc80852b33ae504496f157992254fa92dab2de0027c46b  .build/Sevra.app/Contents/Helpers/dbmd
303d0c1dd4306f140152e72a0f7e3d9fdc8e26328e3ffd369fd424bb8849ce87  .build/Sevra.app/Contents/Resources/build-inputs.json
```
