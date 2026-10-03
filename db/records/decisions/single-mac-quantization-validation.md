---
type: decision
meta-type: conclusion
id: 01m41k37538fgm38yence48yc2
created: 2026-10-03T19:15:45.443896+00:00
updated: 2026-10-03T19:15:45.443896+00:00
summary: Complete quantization and Auto work with the available 48 GB Mac; other-Mac physical validation is not a completion requirement.
decided_on: 2026-10-03
evidence: '[[records/plan/same-model-quantization-and-automatic-memory-2026-10-02]], [[records/decisions/same-model-automatic-quantization-with-overrides]]'
reversible_if: The owner explicitly adds other physical Macs to the required validation scope.
title: Validate quantization on the available Mac and estimate other configurations
status: standing
---
Owner direction, October 3, 2026: only the existing 48 GB development Mac is available. Validation on physical Macs with other memory capacities is not part of the required implementation program. Make the best supported decisions with this machine and do not stop the plan or withhold a release solely because other hardware is unavailable.

Complete local quality, correctness, memory and paired performance checks. Use explicit lower memory targets for safe allocation/cache experiments on this Mac, and deterministic planner-only fixtures for other chip/RAM profiles. Use conservative, clearly labeled estimates for other Macs and for configurations beyond the available capacity. Never inflate simulated availability into a real allocation or describe an estimate as a measured result.

Automatic selection remains the default, with independent pack, ceiling and live-memory controls. Other-Mac defaults may use locally qualified packs and conservative estimated policies; preserve a supported fallback and manual choices. The 20 committed generation tokens/s goal remains visible, with measured, estimated, unknown and failed evidence distinguished. This decision does not establish the target as achieved or waive local quality, safety or performance work.

This replaces only the mandatory multi-Mac validation/rollout gate in [[records/plan/same-model-quantization-and-automatic-memory-2026-10-02]] and refines [[records/decisions/same-model-automatic-quantization-with-overrides]]. Optional future community or hardware results may improve the estimates, but are not needed to complete this program. The plan remains the authority for implementation status.
