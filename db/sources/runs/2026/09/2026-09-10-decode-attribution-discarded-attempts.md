---
type: run
id: 01m26qfx766b7rd8hddk1s774r
created: 2026-09-10T22:37:24.070010+00:00
updated: 2026-09-10T22:38:19.455910+00:00
summary: Decode attribution discarded attempts and rejected profiler
binary: .build/decode-attribution-20260910/worktree/.build/release/slotstream; SHA256 3121d93bdd1040cdb0500b4444a043cc0e59fb51c6b3ad12696a2dad0250471c
captured_at: 2026-09-10
command: python3 .build/decode-attribution-20260910/bench.py; exact per-study arguments and launched commands in raw-results-and-driver.tar.gz
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Decode attribution discarded attempts and rejected profiler
tool: Isolated Slotstream host spans and native Metal timestamp counters
---
These observations are retained and excluded from the timing claims in the accepted run. A paired comparison rejects the entire round if either arm fails; a clean sibling never rescues its invalid pair. The complete raw results, resource observations, protocol outputs, and available driver logs are in the [raw archive](../../../artifacts/decode-attribution-2026-09-10/raw-results-and-driver.tar.gz). The [manifest](../../../artifacts/decode-attribution-2026-09-10/manifest.json) binds its exact bytes.

The first GPU diagnostic exceeded the device's counter-buffer size limit and was replaced by bounded rolling buffers. The first prose fixture ended before the requested output length. A large-cache arm was refused before launch because temporary post-shutdown headroom had not recovered. Later delivery waits before preflight. The first 512-output study was invalidated by swap-ins and a competing checkpoint-download task; that task was left alone. The next study rejects rounds one and two for decode-time swap-ins and accepts only round three. No excluded observation is used as a performance baseline.

The alternate per-phase encoder-splitting diagnostic is also excluded from the production breakdown: its 32-token pair took 4.686017167 seconds versus 4.231742666 disabled, a 10.73% increase. Its output/work parity did not make the altered scheduling representative. Accepted mode4 retains the original encoder boundaries.

Exact per-cell exclusion observations follow. All successful sibling cells and parity observations remain in the same archive.

```json
[
  {
    "study": "final-large-mtp-128",
    "round": 1,
    "mode": 4,
    "error": "InsufficientHeadroom: 18.10 GB reclaimable; need 29.00 GB",
    "exclusions": null,
    "decode_seconds": null
  },
  {
    "study": "final-large-mtp-128-v2",
    "round": 3,
    "mode": 0,
    "error": null,
    "exclusions": [
      "global swap activity during decode"
    ],
    "decode_seconds": 10.055026292
  },
  {
    "study": "final-large-mtp-512",
    "round": 1,
    "mode": 0,
    "error": null,
    "exclusions": [
      "global swap activity during decode"
    ],
    "decode_seconds": 56.166961625
  },
  {
    "study": "final-large-mtp-512",
    "round": 1,
    "mode": 4,
    "error": "RuntimeError: competing work: [{'pid': 8648, 'executable': '/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/Resources/Python.app/Contents/MacOS/Python', 'kind': 'checkpoint transport or packaging job'}, {'pid': 8781, 'executable': '/Users/carlos/Projects/slotstream/.build/transport-v1/build-f5ba5bbbc30947feb38118b6232745b6/download-harness', 'kind': 'checkpoint download test'}]",
    "exclusions": null,
    "decode_seconds": null
  },
  {
    "study": "final-large-mtp-512-v2",
    "round": 1,
    "mode": 0,
    "error": null,
    "exclusions": [
      "global swap activity during decode"
    ],
    "decode_seconds": 43.521748166
  },
  {
    "study": "final-large-mtp-512-v2",
    "round": 1,
    "mode": 4,
    "error": null,
    "exclusions": [
      "global swap activity during decode"
    ],
    "decode_seconds": 42.619667959
  },
  {
    "study": "final-large-mtp-512-v2",
    "round": 2,
    "mode": 4,
    "error": null,
    "exclusions": [
      "global swap activity during decode"
    ],
    "decode_seconds": 45.22225325
  },
  {
    "study": "final-large-mtp-512-v2",
    "round": 2,
    "mode": 0,
    "error": null,
    "exclusions": [
      "global swap activity during decode"
    ],
    "decode_seconds": 42.029949458
  },
  {
    "study": "final-small-128",
    "round": 2,
    "mode": 0,
    "error": null,
    "exclusions": [
      "global swap activity during decode"
    ],
    "decode_seconds": 17.952640959
  },
  {
    "study": "paired-small-128-v1",
    "round": 1,
    "mode": 0,
    "error": null,
    "exclusions": [
      "global swap activity",
      "incomplete output budget"
    ],
    "decode_seconds": 13.373404417
  },
  {
    "study": "smoke-32",
    "round": 1,
    "mode": 1,
    "error": null,
    "exclusions": [
      "global swap activity"
    ],
    "decode_seconds": 4.461408417
  },
  {
    "study": "smoke-gpu-32",
    "round": 1,
    "mode": 2,
    "error": "ValueError: missing or malformed completion framing",
    "exclusions": null,
    "decode_seconds": null
  }
]
```
