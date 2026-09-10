# Model download and Slotpack v1

Fresh `slotstream pull` downloads use immutable, losslessly compressed objects
from the public Hugging Face mirror. No download token is needed. The installed
model retains the original safetensors, tokenizer, configuration, and draft-head bytes.
Inference does not load the transport format or require a decoder at runtime.

The compressed package has its own `-Slotpack` repository. The original
repository remains usable by ordinary Hugging Face clients without downloading
both representations. Use Slotstream to reconstruct the compressed package;
its objects are not directly loadable model files.

The complete package is **88,295,438,048 bytes**, including its manifest,
representing **105,264,463,248 original bytes**: **16.12% fewer bytes**.
The manifest is embedded in the executable, so a normal pull transfers only
the objects. This is a measured byte reduction, not a promised reduction in
total installation time. Decoding and writing overlap downloads; a slow CPU
or disk can limit a very fast connection.

## Download behavior and measured checks

The installed model has 25 files, including the optional 1.5 GB draft head.
A missing draft head still allows inference with speculative decode off.
Decoding and disk writes overlap the transfer. The client starts at eight
independent connections and increases concurrency only when measured
throughput improves. `--connections` fixes the count; `--transport raw`
selects the original file-based download. Existing raw partial downloads
keep their progress automatically.

Each compressed object, reconstructed chunk, and final file is hash-checked.
Unavailable objects fall back to the pinned Hugging Face files.

For historical context, the raw downloader measured 112 MB/s for a complete
install on a 1 Gbit/s datacenter link. A full `slotstream pull --verify`
measured 8 s on the development Mac. These measurements do not predict a
new user's download or verification time. See the [download measurements](../db/records/measurements/lossless-model-download-2026-09-05.md)
and [current hosting acceptance](../db/records/measurements/hugging-face-lossless-download-2026-09-06.md).

## Integrity and publication

`PinnedModel.swift` remains the authority for original paths, lengths, SHA-256
digests, and optional-file status. `PinnedTransportManifest.swift` embeds a
manifest and its SHA-256. Loading the manifest checks its own digest and exact
agreement with every original pin before any network request.

The current manifest is
`cf5461819d34044fcfaff7be230ea6c9ba595247a3f3018033c8dc85bc363a38`.
Its public prefix is:

```text
https://huggingface.co/carloslfu/Qwen3.8-Flash-Next-MLX-4bit-Slotpack/resolve/<pinned-revision>/slotpack/v1/<manifest-sha256>/
```

The manifest names original files and an ordered array of objects. Every
object records its compressed length and SHA-256, reconstructed length and
SHA-256, and one to three original file ranges. Ranges concatenate in that
order inside the decoded object. Complete, non-overlapping coverage of every
original file is mandatory. No object may mix required and optional files.

Objects live at `objects/<first-two-hash-characters>/<sha256>.bin`. Each is at
most 40 MiB plus a 32-byte header. `PinnedTransport.swift` selects the exact
Hugging Face commit, and the manifest pins every object's bytes independently
of its host. Hugging Face supplies large-file delivery and caching. The
compressed representation does not depend on a Cloudflare product.

A new model or representation gets a new immutable prefix. Do not overwrite
an existing package with different bytes. Upload every object, verify public
reads and a complete client reconstruction, then release the embedded pin.
Cache hits can improve the route and origin load; they do not reduce the
object's byte count. Server-requested throttle waits remain cancellable.

### Hosting cost and older releases

Public Hugging Face hosting avoids publisher charges per model download under
its current best-effort public-repository policy. Storage and rate limits still
apply; no paid plan or billing fallback is enabled by the downloader. See
[Hugging Face storage policy](https://huggingface.co/docs/hub/en/storage-limits)
and [request limits](https://huggingface.co/docs/hub/en/rate-limits).

The earlier `weights.sevra.page/slotpack/v1/` URLs are compatibility redirects
to the same package on Hugging Face. `Tools/slotpack/legacy-redirect/` deploys
only static assets and `_redirects`, with no Worker script, R2 binding, or
proxy. Cloudflare documents these static asset requests and storage as
[free and unlimited](https://developers.cloudflare.com/workers/static-assets/billing-and-limitations/).
Keep the hostname excluded from the application Worker's wildcard route.
New clients contact Hugging Face directly.

Upgrade older releases for the new server-throttle handling. An earlier client
on a very fast or shared connection may need to rerun its resumable pull after
a Hugging Face request-limit window resets.

Cloudflare analytics now describe only older clients' redirect traffic, not
the model bytes delivered by Hugging Face. Hugging Face's default model counter
counts selected query files; this client fetches hash-named objects and embeds
the manifest, so that counter does not measure compressed pulls or completed
installs. GitHub release-asset counts remain an acquisition proxy. No telemetry
is added. See [Hugging Face's counting rules](https://huggingface.co/docs/hub/en/models-download-stats).

Before retiring an old hosted copy, qualify a complete anonymous pull through
the new default against every original file hash, and verify that an earlier
released client follows the legacy redirects and reconstructs missing files.
Preserve historical publication evidence when retiring storage.

## Codec

`Sources/CSlotpack` implements the bounded codec in C, with no external codec
dependency. Its four byte-renormalized rANS states use the standard
[rANS equations](https://github.com/rygorous/ryg_rans). Encoding happens offline.

All wire integers are little endian. The fixed header is:

| Offset | Field |
|---|---|
| 0 | Eight bytes: `SLTPK001` |
| 8 | Reconstructed byte length, uint32 |
| 12 | Representation kind, uint32 |
| 16 | Packed weight byte length, uint32; zero except kind 3 |
| 20 | Quantization group size, uint32; zero except kind 3 |
| 24, 28 | Reserved uint32 values, both zero |

Kind 0 copies raw bytes. Kind 1 codes arbitrary bytes. Kind 2 codes exact
16-bit words. Kind 3 codes a concatenation of packed four-bit weights, BF16
scales, and BF16 biases. The encoder uses raw kind 0 when compression would
increase the framed size. Original safetensors headers and all small files
are included; no data is inferred from a different model version.

Generic sections begin with a uint32 count of used symbols, followed by
ascending sparse `(symbol delta, frequency)` pairs in canonical unsigned
base-128 varints. The first delta is from zero; subsequent deltas are from
the preceding symbol plus one. Frequencies sum exactly to 4096 for bytes or
65536 for 16-bit words. A uint32 stream length precedes four uint32 rANS
states and the renormalization bytes. The lower state bound is `1 << 23`;
decoded symbols alternate across the four states. The decoder requires exact
stream consumption and all terminal states equal to that bound.

For kind 3, the number of groups is twice the packed weight length divided
by the group size, which must be 32 or 64. Each group contributes two scale
bytes and two bias bytes. The encoder stores exact scales, a byte center
derived from round-to-nearest-even `-bias / scale` clamped to 0–255, and an
exact signed modular residual from the predicted BF16 bias. The prediction
rounds `-scale * center` to BF16 with integer arithmetic. Non-finite cases
use a defined zero prediction and retain their exact residuals. Signed
residuals are zigzag-encoded as 16-bit words; no precision is discarded.

Those three generic sections are followed by a uint32 count of quantization
contexts. Each context has a uint32 key and sixteen varint frequencies
summing to 4096. The key is
`center * 1024 + ((scale_bits & 32767) >> 5)`. At most 2048 distinct contexts
are permitted. The final rANS section codes low then high weight nibbles
using the context of their quantization group. Contexts, frequencies, lengths,
arithmetic bounds, terminal states, and all buffer boundaries are checked.

## Download lifecycle

The downloader uses a persistent URLSession per network worker. Automatic
mode starts with eight workers and tries sixteen, then thirty-two only while
measured throughput improves. Retries, a decoder backlog, or a throughput
plateau stop expansion. An explicit `--connections` value fixes the count.
Decoder concurrency, queued buffers, and completed operation lifetimes are bounded independently.

Every object is checked against its compressed SHA-256 before decoding.
Decoded bytes must match the reconstructed SHA-256 before they reach their
disjoint original ranges. Workers sync affected partial files before marking
an object complete in `.slotpack-state.json`. Final files replace
`*.slotpack.part` only after their original whole-file SHA-256 passes. A
damaged resume reconstructs the affected file's chunks and verifies again.

Retries do not advance verified progress twice. SIGINT/SIGTERM cancel active
requests, drain in-flight writes, and preserve completed chunks. A directory
lock prevents simultaneous writers. Partial files reject symlinks, hard
links, and non-regular files; valid final-file symlinks remain reusable.
Small resume metadata is bounded before allocation. Disk admission charges
the remaining reconstructed allocation plus a margin, not compressed size.

If a compressed object is missing or corrupt, the same original ranges are
retrieved from pinned Hugging Face sources and checked against the decoded
object digest. Signed redirects are cached in memory and refreshed after
expiry. An unavailable optional draft head may be skipped after its writers
drain; a required-file failure cannot report success.

`--transport raw`, explicit `PullOptions.sources`, or
`SLOTSTREAM_WEIGHTS_SOURCES` retain raw-file mirror compatibility. Automatic
mode also preserves an existing legacy `.part` download and its `.partmap`.
`--transport compressed` explicitly selects the new layout. Switching formats
reuses completed original files; partial progress belongs to its own format.

## Reproduce and qualify

Building and embedding require Python 3.9 or later and a C compiler;
Hugging Face publication additionally requires `huggingface_hub` (qualified
with version 1.29.0). Publication uses an existing `HF_TOKEN` or
`--token-stdin`, writes no credential, preserves existing repository files,
and resumes from the actual committed inventory. A conflicting object at an
existing immutable package path is rejected.

```sh
python3 Tools/slotpack/pack.py --model /path/to/original-model --output /path/to/package --workers 8
python3 Tools/slotpack/publish_hf.py --package /path/to/package --repo OWNER/MODEL --receipt /path/to/upload.json
python3 Tools/slotpack/embed.py --package /path/to/package
python3 Tools/slotpack/checks.py
```

Pin the resulting Hugging Face commit in `PinnedTransport.swift` and the
legacy redirect, then complete public qualification before release.
`publish_r2.py` remains a historical optional publisher; it is not the default.

The builder verifies every original file, every compressed round trip, and
complete coverage before writing its manifest and build receipt. The gates
exercise exhaustive finite BF16 prediction cases, randomized centers,
malformed/truncated frames under sanitizers, manifest corruption, real HTTP
fallbacks, cancellation/resume, damaged resumes, file safety, and legacy raw
multi-chunk downloads. `codec_fuzz.c` additionally supports libFuzzer with
AddressSanitizer and UndefinedBehaviorSanitizer on a toolchain providing it.

Use `full_pull.py` for complete loopback or public-CDN qualification. A CLI
run with `--binary /path/to/slotstream --base-url PUBLIC_PREFIX
--default-source` clears transport overrides and tests the actual default.
Its receipt records the binary and source hashes, fresh/resumed status,
CDN/connection observations, zero required raw fallback, and independently
computed SHA-256 hashes of every installed original file. A full public
default qualification must pass before releasing a new package pin.

`Tools/coverage.sh --lcov FILE` also instruments the real manifest, HTTP,
legacy raw, and sustained-memory fixtures. It unions their line hits with
the catalogue, mapping immutable source snapshots back to their exact source
files. Transport files use the union of physical source-line hits; unrelated
files retain their original LLVM summaries. Function and branch denominators
from separate executables are not combined.
