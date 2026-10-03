---
type: machine
id: 01m2s4e4fs0dxr88w41bb9qs22
created: 2026-09-18T05:20:00+00:00
updated: 2026-10-03T23:51:11.480000977+00:00
summary: Mac mini M4 with 32 GB RAM, internal Apple SSD and external SN8100; paired mirror-read measurements.
chip: Apple M4
kind: mac
os: macOS 15.7.4 (24G517)
ram_gb: '32'
ssd: internal 251 GB APPLE SSD AP0256Z on Apple Fabric, and an external 2 TB WD_BLACK SN8100 in an OWC Express 1M2 enclosure on Thunderbolt 4
title: Mac mini, Apple M4, 32 GB, two disks
---
Mac mini (Mac16,10), Apple M4 with four performance and six efficiency cores, 32 GB nameplate unified memory, macOS 15.7.4. The planner reports decimal RAM (about 34.36 GB) rather than Apple's nameplate figure.

The internal Apple SSD and external 2 TB WD_BLACK SN8100 in an OWC Express 1M2 enclosure on Thunderbolt 4 hold copies of the same pinned checkpoint. Both copies passed all 25 pinned SHA256 checks (105.3 GB) on the f37412f executable before its paired inference campaign; the optional tap-correction sidecar is absent on both. The internal disk has limited free space, so builds, test fixtures and evidence use the external disk.

The per-copy read split is learned by the mirror router. This machine's measured file-read profile is [[records/measurements/mirror-physical-read-witness-2026-10-04]], backed by all 36 physical-device counter witnesses. File-reader rates and inference throughput have different protocols; do not add the disk medians to predict decode speed.

The recorded `iogpu.wired_limit_mb` value is `28700` (rechecked October 4 Europe/Berlin); it was not changed for this campaign. The inference protocol checks actual reclaimable headroom before each process and records its complete public runtime profile.
