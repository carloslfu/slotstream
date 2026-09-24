---
type: run
id: 01m394mhbfvhmtz6r1wkrcxwbe
created: 2026-09-24T07:21:17.935060+00:00
updated: 2026-09-24T07:21:34.737275+00:00
summary: Sevra window responsiveness before and after on a long-history Home, offscreen harness, diagnostic
binary: c1ff7e2663d215339ab3950bf199b53007df7c0b138f2f9e9897d6937f1ab404; comparison 3ef9523420ca63e418200387778f2ff45ee65e74e4926d53e5358460cd86b1cd
captured_at: 2026-09-24
command: ./wb-old and ./wb-new (offscreen window harness, fresh long-history Home copy each)
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Sevra window responsiveness on a long-history Home
tool: Offscreen window harness linked against optimized Sevra builds
---
Offscreen window harness for the Sevra Mac development app. It links the app's own modules from an optimized build with test access, opens a synthetic long-history Home, renders the production window content in a borderless window placed off screen, and times window updates for typing, a streamed reply, thread switches, returning from a panel, window resizing, a rename and search. A 4 ms main-queue timer records every main-thread stall. The same harness source ran against the code at `75430a5` (`apps/macos` and `Sources` byte-identical to that commit) and against the working tree with this session's responsiveness changes. Probes that only the new code supports (the layout stability holds and the kept-view note) are compiled out of the old build.

The Home has 1,002 threads and 9,990 messages, including one 2,000-message thread, about 32 MiB of text, copied fresh from the same seed for each run. Inference is scripted; no model was loaded.

The Mac was in ordinary use during the runs (a browser and other apps open, load average about 2.3), so these are diagnostic timings, not clean measurements, and the run is marked discarded. The differences between the two builds are large enough to show which interactions changed; no number here is a public claim.

"Thread switch until text" ends when the text view holds the destination thread's last message. "Return from a panel" ends when the conversation's text is visible again. The stability lines check that the text in view does not move while the rest of a long page is laid out: at the latest message, while idle, and at eight positions while scrolling up.

Commands, from the scratch harness directory, each with a fresh copy of the seed Home:

```text
swift build --package-path apps/macos -c release --product Sevra -j 2 -Xswiftc -enable-testing --scratch-path <build>
./build.sh <build> wb-new            # the working tree
./build.sh <old build> wb-old OLD    # 75430a5
BENCH_HOME=<Home copy> SEVRA_DBMD=$HOME/.dbmd/bin/dbmd SEVRA_FONTS=apps/macos/Resources/Fonts ./wb-old
BENCH_HOME=<Home copy> SEVRA_DBMD=$HOME/.dbmd/bin/dbmd SEVRA_FONTS=apps/macos/Resources/Fonts ./wb-new
```

Harness SHA-256: old `3ef9523420ca63e418200387778f2ff45ee65e74e4926d53e5358460cd86b1cd`, new `c1ff7e2663d215339ab3950bf199b53007df7c0b138f2f9e9897d6937f1ab404`. Both exited zero. A later change, made after these runs, reads the reader's line again whenever new text arrives while a page is still being laid out; it does not touch the timed paths.

Old code (`75430a5`):

```text
Home: 1002 threads, 9990 messages; conversation: 2000 messages
idle refresh + update:        median 0.1  p95 0.2  max 0.2 ms (n=20)  |  main-thread gaps p50 4.0  p99 5.9  max 6.0 ms, 0 over 50 ms
keystroke + update:           median 45.5  p95 46.9  max 67.2 ms (n=60)  |  main-thread gaps p50 4.1  p99 48.4  max 69.5 ms, 2 over 50 ms
streaming refresh + update:   median 76.4  p95 89.6  max 89.6 ms (n=20)  |  main-thread gaps p50 4.1  p99 110.0  max 201.0 ms, 35 over 50 ms
thread switch until selected: median 219.5  p95 222.3  max 222.3 ms (n=6)
thread switch until text:     median 420.1  p95 422.6  max 422.6 ms (n=6)  |  main-thread gaps p50 4.0  p99 160.7  max 222.7 ms, 16 over 50 ms
  return: synchronous update 124.0 ms, text visible after 364.3 ms
  return: synchronous update 122.0 ms, text visible after 361.9 ms
  return: synchronous update 118.9 ms, text visible after 360.3 ms
  return: synchronous update 123.4 ms, text visible after 363.0 ms
return from a panel:          median 363.0  p95 364.3  max 364.3 ms (n=4)  |  main-thread gaps p50 4.0  p99 127.8  max 156.9 ms, 12 over 50 ms
window resize frame + update: median 75.8  p95 150.6  max 151.8 ms (n=24)  |  main-thread gaps p50 4.1  p99 154.0  max 156.2 ms, 24 over 50 ms
rename + refresh + update:    median 73.9  p95 75.8  max 75.8 ms (n=10)  |  main-thread gaps p50 4.0  p99 6.0  max 78.8 ms, 10 over 50 ms
search keystroke + update:    median 310.5  p95 503.3  max 503.3 ms (n=8)  |  main-thread gaps p50 4.0  p99 311.6  max 504.6 ms, 8 over 50 ms
```

Working tree:

```text
Home: 1002 threads, 9990 messages; conversation: 2000 messages
idle refresh + update:        median 0.2  p95 0.2  max 0.2 ms (n=20)  |  main-thread gaps p50 4.0  p99 5.8  max 6.0 ms, 0 over 50 ms
keystroke + update:           median 6.0  p95 7.3  max 8.8 ms (n=60)  |  main-thread gaps p50 4.0  p99 8.3  max 10.6 ms, 0 over 50 ms
streaming refresh + update:   median 13.2  p95 14.3  max 19.6 ms (n=29)  |  main-thread gaps p50 4.1  p99 23.5  max 28.6 ms, 0 over 50 ms
thread switch until selected: median 42.6  p95 45.7  max 45.7 ms (n=6)
thread switch until text:     median 77.2  p95 80.9  max 80.9 ms (n=6)  |  main-thread gaps p50 4.0  p99 33.0  max 40.2 ms, 0 over 50 ms
  opened: partial layout true, height 43095
  reading at character 94312 while completing: held, partial layout now false, height 54546
stability: partial layout false, near latest true
  start: clip 54025–54547, view height 54546, visible glyphs 1571 from 188482 (first line at 53995), partial no
  after 0.4 s: clip 54025–54547, view height 54546, visible glyphs 1571 from 188482 (first line at 53995), partial no
  after 0.8 s: clip 54025–54547, view height 54546, visible glyphs 1571 from 188482 (first line at 53995), partial no
  after 1.2000000000000002 s: clip 54025–54547, view height 54546, visible glyphs 1571 from 188482 (first line at 53995), partial no
  after 1.6 s: clip 54025–54547, view height 54546, visible glyphs 1571 from 188482 (first line at 53995), partial no
  after 2.0 s: clip 54025–54547, view height 54546, visible glyphs 1571 from 188482 (first line at 53995), partial no
  after 2.4000000000000004 s: clip 54025–54547, view height 54546, visible glyphs 1571 from 188482 (first line at 53995), partial no
  after idle: partial layout false, height 54546
  top of page: character 0, origin 0
stability: 10/10 holds kept the visible text; back at latest true
  kept view: true, in a window: true, superview: true
  return: synchronous update 49.1 ms, text visible after 49.3 ms
  kept view: true, in a window: true, superview: true
  return: synchronous update 39.8 ms, text visible after 39.9 ms
  kept view: true, in a window: true, superview: true
  return: synchronous update 47.5 ms, text visible after 47.7 ms
  kept view: true, in a window: true, superview: true
  return: synchronous update 26.9 ms, text visible after 27.0 ms
return from a panel:          median 47.7  p95 49.3  max 49.3 ms (n=4)  |  main-thread gaps p50 4.0  p99 47.8  max 80.2 ms, 6 over 50 ms
window resize frame + update: median 7.0  p95 12.1  max 15.0 ms (n=24)  |  main-thread gaps p50 4.2  p99 34.8  max 36.6 ms, 0 over 50 ms
rename + refresh + update:    median 7.4  p95 16.3  max 16.3 ms (n=10)  |  main-thread gaps p50 4.0  p99 13.7  max 25.2 ms, 0 over 50 ms
search keystroke + update:    median 5.9  p95 18.2  max 18.2 ms (n=8)  |  main-thread gaps p50 4.0  p99 8.2  max 20.3 ms, 0 over 50 ms
search results: 1
```
