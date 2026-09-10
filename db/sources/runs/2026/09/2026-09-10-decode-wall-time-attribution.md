---
type: run
id: 01m26qfx84c1mcktttrqztvyrj
created: 2026-09-10T22:37:24.100602+00:00
updated: 2026-09-10T22:37:49.327246+00:00
summary: Decode wall-time attribution on the M5 Pro, with production untouched
binary: .build/decode-attribution-20260910/worktree/.build/release/slotstream; SHA256 3121d93bdd1040cdb0500b4444a043cc0e59fb51c6b3ad12696a2dad0250471c
captured_at: 2026-09-10
command: python3 .build/decode-attribution-20260910/bench.py; exact per-study arguments and launched commands in raw-results-and-driver.tar.gz
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Decode wall-time attribution on the M5 Pro, with production untouched
tool: Isolated Slotstream host spans and native Metal timestamp counters
---
Accepted timing evidence for one 512-output pair, three 128-output pairs at a 24 GB target with MTP, and one 128-output plus one 32-output control pair at a 10 GB target without MTP. Raw results include every exclusion; see [[sources/runs/2026/09/2026-09-10-decode-attribution-discarded-attempts]].

Artifacts are captured before the derived measurement record:

- [Exact artifact manifest](../../../artifacts/decode-attribution-2026-09-10/manifest.json).
- [Raw results, resources, requests, build logs and final analysis driver](../../../artifacts/decode-attribution-2026-09-10/raw-results-and-driver.tar.gz).
- [Frozen native instrumentation sources](../../../artifacts/decode-attribution-2026-09-10/profiled-source.tar.gz).
- [Full derived partition, per-pair data and validation diagnostics](../../../artifacts/decode-attribution-2026-09-10/analysis.json).
- [Normal server restoration proof](../../../artifacts/decode-attribution-2026-09-10/restoration-proof.json).

Every measured trace from a clean matched pair is retained as a separate lossless `.json.xz` artifact. Decompression was SHA-256 checked against the original raw JSON. Warmup and invalid traces remain in the ignored local build directory; the durable archive retains all their request-level results and resources. Native counters use original Metal encoder boundaries, with tagged primitive origins and CPU/GPU clock correlation. No GPU evaluation, wait or encoder split was added within the timed decode loop in mode4. The original per-study manifest's description omits mode4; its modes array, trace header, arguments and frozen source establish what actually ran. Later driver changes add contention checks; later offline analysis separates untagged passes. The native binary remains the frozen one.

Exact final analysis tool output:

```text
natural-smoke-32 1 clean pairs
final-small-128 1 clean pairs
final-large-mtp-128-v2 3 clean pairs
final-large-mtp-512-v2 1 clean pairs
natural-smoke-32 {'SSD file-read workers and waits': 40.77900358630481, 'CPU graph evaluation, scheduling and synchronization': 13.603464156984804, 'CPU Metal command preparation and driver calls': 10.124153222156895, 'GPU recurrent layers, with associated normalization and routing': 10.103749184083155, 'GPU expert calculations and output mixing': 5.425202725989985, 'GPU cache writes and expert calculations together': 5.074995368554811, 'GPU writes from staging RAM into the expert cache': 3.1280713843113026, 'GPU attention layers, with associated normalization': 2.3732737580793692, 'Allocate and wrap RAM staging buffers': 2.0891434863781155, 'CPU model graphs, cache bookkeeping, MTP state and output': 5.2066852994971455, 'GPU vocabulary, ngram embedding, MTP head, sampling and other passes': 1.2924533863911807, 'GPU remaining normalization, routing and residual operations': 0.7998044412684266} -1.5992992097851655
final-small-128 {'SSD file-read workers and waits': 40.8196131611975, 'CPU graph evaluation, scheduling and synchronization': 13.568146012402273, 'CPU Metal command preparation and driver calls': 10.167694747384953, 'GPU recurrent layers, with associated normalization and routing': 9.976168085201914, 'GPU expert calculations and output mixing': 5.460744124622361, 'GPU cache writes and expert calculations together': 5.097094804020251, 'GPU writes from staging RAM into the expert cache': 3.2357609798001565, 'GPU attention layers, with associated normalization': 2.3588686386551587, 'Allocate and wrap RAM staging buffers': 2.0261471854941417, 'CPU model graphs, cache bookkeeping, MTP state and output': 5.219442043726536, 'GPU vocabulary, ngram embedding, MTP head, sampling and other passes': 1.288300855539842, 'GPU remaining normalization, routing and residual operations': 0.7820193619549061} -0.3291261424720471
final-large-mtp-128-v2 {'SSD file-read workers and waits': 30.24868780664152, 'CPU Metal command preparation and driver calls': 11.243954065581551, 'GPU recurrent layers, with associated normalization and routing': 10.249327558501435, 'CPU graph evaluation, scheduling and synchronization': 10.486260570862825, 'GPU expert calculations and output mixing': 8.627105450381913, 'CPU model graphs, cache bookkeeping, MTP state and output': 13.911336598984033, 'GPU cache writes and expert calculations together': 4.088808078006426, 'GPU attention layers, with associated normalization': 2.519737461619293, 'GPU remaining normalization, routing and residual operations': 2.2359211276282096, 'GPU writes from staging RAM into the expert cache': 1.6831296356741068, 'Allocate and wrap RAM staging buffers': 1.7535716246807724, 'GPU vocabulary, ngram embedding, MTP head, sampling and other passes': 2.9521600214379085} -0.5581309160265002
final-large-mtp-512-v2 {'SSD file-read workers and waits': 33.66536005852758, 'CPU graph evaluation, scheduling and synchronization': 10.429658216155476, 'CPU Metal command preparation and driver calls': 9.955588893304762, 'GPU recurrent layers, with associated normalization and routing': 9.790136183778078, 'GPU expert calculations and output mixing': 8.159303956924465, 'GPU cache writes and expert calculations together': 4.689037552601397, 'CPU model graphs, cache bookkeeping, MTP state and output': 12.363468097932364, 'GPU attention layers, with associated normalization': 2.468408420368538, 'GPU remaining normalization, routing and residual operations': 2.1355061583666397, 'GPU writes from staging RAM into the expert cache': 1.8816671590539549, 'Allocate and wrap RAM staging buffers': 1.6095444776335306, 'GPU vocabulary, ngram embedding, MTP head, sampling and other passes': 2.8523208253532104} -3.404923634467427
```

Exact artifact manifest:

```json
{
  "inventory": [
    {
      "source": ".build/decode-attribution-20260910/natural-smoke-32/round-1-mode-4/trace-1.json",
      "raw_bytes": 15826175,
      "raw_sha256": "1a37941aa5f6803f20331b34203c5840481f007965f7a90afb271f1db2ddb69a",
      "artifact": "natural-smoke-32-round-1-trace.json.xz",
      "bytes": 2642156,
      "sha256": "9af65c70b1f7d38d416248fc85b8d11e16f6da3c792a0474d26aa5aaa7d40da6",
      "lossless_roundtrip": true
    },
    {
      "source": ".build/decode-attribution-20260910/final-small-128/round-1-mode-4/trace-1.json",
      "raw_bytes": 64851338,
      "raw_sha256": "40bbc38d08744d3fb8cf90c630d7d433e4ea34d26e460a7a31399cc3ec0f9bc4",
      "artifact": "final-small-128-round-1-trace.json.xz",
      "bytes": 10822592,
      "sha256": "801f66afabaa3a164aa74b8a22fda7fe3b40c4345a8c6ac03dcb43127f5ce116",
      "lossless_roundtrip": true
    },
    {
      "source": ".build/decode-attribution-20260910/final-large-mtp-128-v2/round-1-mode-4/trace-1.json",
      "raw_bytes": 45943293,
      "raw_sha256": "81105337d3ed1f06261d56571d1681a77a0bcad569a84664d73b31b2e886931a",
      "artifact": "final-large-mtp-128-v2-round-1-trace.json.xz",
      "bytes": 7721744,
      "sha256": "5a050dfd9811dd45170f85440fcb1931efae8ff62b30a3ad8a77d3c246e27ca2",
      "lossless_roundtrip": true
    },
    {
      "source": ".build/decode-attribution-20260910/final-large-mtp-128-v2/round-2-mode-4/trace-1.json",
      "raw_bytes": 45944466,
      "raw_sha256": "b6cc358fb026454e63e286910bf02b75ec15fb8ec4f92af2af6308db32c4e2a3",
      "artifact": "final-large-mtp-128-v2-round-2-trace.json.xz",
      "bytes": 7716692,
      "sha256": "379188735abfad1f5c4efd3ee0ac29140b310b9cc6a215a2d673ad384232e750",
      "lossless_roundtrip": true
    },
    {
      "source": ".build/decode-attribution-20260910/final-large-mtp-128-v2/round-4-mode-4/trace-1.json",
      "raw_bytes": 45939287,
      "raw_sha256": "7fbc67b09c72cb30b99d3417ca53724781b8031507152d574011b19f765121c7",
      "artifact": "final-large-mtp-128-v2-round-4-trace.json.xz",
      "bytes": 7904408,
      "sha256": "2c257ba3185f95c260c3a10bcc6334145f778a691000c35233eaa9c0b68e8698",
      "lossless_roundtrip": true
    },
    {
      "source": ".build/decode-attribution-20260910/final-large-mtp-512-v2/round-3-mode-4/trace-1.json",
      "raw_bytes": 187160666,
      "raw_sha256": "b09c996181989fb66a2a709dec9dae83aabff117d6bcf626ecd76781a59fbb38",
      "artifact": "final-large-mtp-512-v2-round-3-trace.json.xz",
      "bytes": 31498308,
      "sha256": "a077efbf9d9d593d0825e98c95faf342738e381858d2f28d5f94cd0006614825",
      "lossless_roundtrip": true
    },
    {
      "artifact": "analysis.json",
      "bytes": 109534,
      "sha256": "6a87ddead2d5b928c76a015739690e66ca2fb159184929517bedbdf22d6a5b73"
    },
    {
      "artifact": "profiled-source.tar.gz",
      "bytes": 28875,
      "sha256": "487454dac7b9c3407c8d267e09dd604a5c73abc43bba55ef305f284b16b703aa"
    },
    {
      "artifact": "raw-results-and-driver.tar.gz",
      "bytes": 533054,
      "sha256": "c496e5ecf0b83eaec8d5dba0e110f68180645b0f5c7e0c3381d67ed09606dbd1"
    },
    {
      "artifact": "restoration-proof.json",
      "bytes": 2443,
      "sha256": "20e5e132d34f72002fe2610130240502daeab3eb1311e248138a2dfbc5a5cea1"
    }
  ],
  "slotstream_base": "449f3841d65cbca8346ab6ae8092eb0948d92dbd",
  "binary_sha256": "3121d93bdd1040cdb0500b4444a043cc0e59fb51c6b3ad12696a2dad0250471c",
  "final_head": "63583180e154517a4f7785fc6d1d7ee1e9ff28e0",
  "raw_trace_policy": "All measured traces from clean matched pairs are losslessly archived. Raw request results, resource counters and errors from all studies are retained, including discarded attempts. Unqualified and warmup traces remain in the local ignored build directory.",
  "source_policy": "profiled-source.tar.gz freezes actual native code. The raw-results archive contains the later driver contention checks and final offline analysis. Native binary did not change after the source freeze.",
  "mode_label_correction": "The original per-study manifest prose omits mode4. The actual modes array, arguments, source and trace headers are authoritative. Mode4 uses original natural Metal encoder boundaries, without added within-decode evals, waits or splits."
}
```
