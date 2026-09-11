---
type: run
id: 01m28wn2cdm8mjs2kt8n3p0yfy
created: 2026-09-11T18:46:04.941061+00:00
updated: 2026-09-11T18:46:04.941061+00:00
summary: v0.2.15 CI-artifact acceptance 25/25, publication with verified attestation, installation and installed-release acceptance 31/31.
binary: 8abb02b639285335b4fc3113819ebc6fe084bbf017fab2b4a52de3e471a551e3
captured_at: 2026-09-11
command: verify_ci.py; publish_verify.py; installed_checks.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: v0.2.15 published, installed and accepted
tool: Tools/verify.sh on the CI artifact, gh release publication and attestation, install.sh, Tools/e2e_release.sh on the installed binary
---
Four phases ran in order against the exact CI artifact, with every user application and unrelated workload left open: complete model acceptance on the downloaded CI binary, tag publication and provenance verification, local installation, and installed-release acceptance.

**Model acceptance on the exact CI binary.** `bash Tools/verify.sh` completed in 1,103.765867948532 seconds with `passed 25, failed 0`. The candidate is archive SHA-256 `d9ea8246d7868620a0c9e0766f7ba637522739d66da8e5fa5d44b2190fc6d4fa` and binary SHA-256 `8abb02b639285335b4fc3113819ebc6fe084bbf017fab2b4a52de3e471a551e3`, its 150 compiled inputs matching the tagged source, with the eight frozen drivers hashed before and after. The twenty-five gates are the sixteen numbered checks plus weights provenance, planner gates, sampler and governor gates, the full elastic drill, speculative decode gates, the behavioural quality probe, the serving robustness suite, vision tower parity and the vision serving suite.

The interval recorded 271 system-wide swap-ins and zero swap-outs. Reclaimable memory was 28,482,207,744 bytes before and 30,258,495,488 bytes after. Under [[records/decisions/global-paging-is-diagnostic]] those counters are diagnostics: acceptance was decided by the original numerical and work assertions, the actual process ceilings and the headroom guards, all of which held.

**Publication.** Tag `v0.2.15` on commit `48d11f288237e9b697264621297890eead7ffb0a`. Main CI run 34626184507 succeeded across coverage, weights-free and public-library jobs; release workflow run 34629147966 succeeded and published at 2026-09-11T17:42:30Z. The public archive was downloaded again and re-verified independently: its archive and binary digests match the CI artifact exactly, its build identity matches, and `gh attestation verify` confirmed the sigstore bundle for `carloslfu/slotstream` at `refs/tags/v0.2.15`.

**Installation.** The installer replaced 0.2.14 with 0.2.15, exit code 0. The installed binary hashes to `8abb02b639285335b4fc3113819ebc6fe084bbf017fab2b4a52de3e471a551e3`, byte-identical to both the CI candidate and the downloaded public candidate.

**Installed-release acceptance.** `e2e_release.sh` against the installed binary at `--memory-gb 10 --mtp on --vision off` returned `passed 31, failed 0`, covering API and CLI compatibility, streaming deltas, Unicode, long prompts, malformed and hostile input, seeded sampling, prefix reuse, four concurrent clients and disconnect recovery.

Its default probe carried no depth override and confirms the shipped default on the public binary:

```json
{
  "draftedTokens": 30,
  "verifyPasses": 15,
  "acceptedDrafts": 16,
  "decodeTokens": 32,
  "lifetimePhysicalFootprintPeakBytes": 7203164480,
  "lifetimeRSSPeakBytes": 4730060800,
  "physicalFootprintEndBytes": 7203164480,
  "peakMemoryGB": 7.20316448,
  "mlxPeakMemoryGB": 6.537863808,
  "generatorVMBefore": { "swapins": 44557282, "swapouts": 78206983 },
  "generatorVMAfter": { "swapins": 44557282, "swapouts": 78206983 }
}
```

Thirty drafted tokens over fifteen verification passes is exactly two drafts per pass, the new default reaching a user through the published artifact. The lifetime physical-footprint peak of 7,203,164,480 bytes stayed under the 10 GB target, and this generator interval observed no paging at all.

**Closure.** No Slotstream process remains, the native model lock is free, the installed version reports 0.2.15, no user application was closed or paused at any point, and no persistent production instrumentation or environment setting changed.

This run qualifies the published artifact functionally. It makes no clean-timing or throughput claim: the acceptance interval was deliberately shared with the machine's ordinary workload. Expert lookahead and expert prefetching remain unimplemented planned work.

[Raw checks and source](../../../artifacts/release-v0-2-15-published-2026-09-11/raw-checks-and-source.tar.gz): 80 members, SHA-256 `d30187697532e1527e5fc0c8feac36e1617eeeda0cd5bff2a030710a98565d4d`. Every archive member was extracted and verified byte-for-byte. Eleven large binaries, the two candidate binaries, the two downloaded archives, the three Metal libraries, the two vision-parity dumps and the local build's binaries, are identified by digest in the manifest rather than shipped.
