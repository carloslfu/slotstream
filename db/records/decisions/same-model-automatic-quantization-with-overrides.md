---
type: decision
meta-type: conclusion
id: 01m3yz0p9gc5x79xhmw1en2x81
created: 2026-10-02T18:46:22.256017+00:00
updated: 2026-10-03T19:15:45.465154+00:00
summary: Default to automatic same-model quantization selection while preserving independent user pack and memory-ceiling overrides.
decided_on: 2026-10-02
evidence: '[[records/plan/same-model-quantization-and-automatic-memory-2026-10-02]], [[records/decisions/vq-weights-behind-qualification-gates]], [[records/decisions/adaptive-memory-limits]]'
reversible_if: The owner changes the same-model or control direction, or measured quality and hardware results require an explicit scope revision.
title: Automatic same model quantization with user overrides
status: standing
---
Owner direction recorded October 2, 2026: pursue the same Flash Next checkpoint across the 16 to 64 GB Mac target range using qualified quantizations, with automatic selection as the default and user overrides for the supported pack and memory ceiling. The implementation plan is [[records/plan/same-model-quantization-and-automatic-memory-2026-10-02]].

Keep two independent automatic mechanisms. At setup or a safe load boundary, selection chooses the pack and initial resource plan from hardware, requested features, usable memory and qualification evidence. During execution, the governor shrinks and regrows allocations within the active pack and saved ceiling. Runtime pressure never silently changes quantization, overwrites the saved ceiling or truncates an admitted request's context.

This supersedes only the September 30 product rule in [[records/decisions/vq-weights-behind-qualification-gates]] that users do not choose a bit width. Auto remains the default; supported manual choices remain available and visible. Preserve that decision's reference-parity, quality, performance, pinned-distribution and explicit-upgrade gates. Existing installed packs and independent engine clients do not change silently.

The 20 committed generation tokens/s target applies across the intended automatic hardware profiles. It is not an achieved result, an instantaneous-rate guarantee or evidence for arbitrary manual settings. Memory-target reductions on the development Mac test budget behavior on that Mac; they do not emulate another chip or SSD. Larger-memory estimates cannot qualify real 64 GB performance.

This records the requested scope and control semantics. The plan's candidate ranking, evaluation margins and implementation details remain proposals subject to its gates. No new model, shipped default, performance claim or release is approved by this record. The wider maintained-model architecture in [[records/design/sevra-maintained-model-integration]] remains intact.

October 3 scope correction: [[records/decisions/single-mac-quantization-validation]] removes validation on other physical Macs from completion requirements. Use the available 48 GB Mac, safe lower memory targets and conservative estimates for other configurations. Keep measured and estimated evidence distinct; do not make missing other-Mac access a blocker. The engineering plan carries the revised gates.
