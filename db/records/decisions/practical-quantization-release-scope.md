---
type: decision
id: 01m4687qphayfw93kjye9dfah4
created: 2026-10-05T14:42:11.281805+00:00
updated: 2026-10-06T00:56:20.317251+00:00
summary: Focused experiments toward the full same-model performance target; huge statistical campaign remains deferred
decided_on: 2026-10-05
evidence: '[[records/plan/same-model-quantization-and-automatic-memory-2026-10-02]]'
reversible_if: The owner changes the target or authorizes a broader evaluation program; candidate sequencing changes only with recorded evidence.
title: Practical completion scope for the same-model quantization release
status: standing
---
### October 5 clarification: full target, bounded experiments

The owner's latest instruction explicitly reopens two-bit, lower-bit VQ, mixed quantization and kernel/streaming/allocation work until the same-model, similar-quality twenty-token target is addressed across recommended 16–64 GB configurations. The earlier one-candidate restriction and three-bit-only sequencing are superseded. The active experiment order, concrete stop criteria and two independent automatic systems are in [[records/plan/same-model-quantization-and-automatic-memory-2026-10-02]]. This is not authorization to restart the huge statistical campaign or implement every format. Preserve the original wherever it wins, screen cheaply, integrate useful winners, and report evidence/options explicitly if the target proves infeasible without claiming completion. The original decision text below remains historical context.

The owner accepted the narrower approach on October 5 after identifying the implementation effort as impractical and over-engineered. Finish one useful smaller representation of the same Qwen checkpoint, default automatic selection with user overrides, and independent runtime memory management. Preserve the engineering already implemented and its existing safety gates.

The complete 138-job paired statistical campaign and additional generic research infrastructure are no longer prerequisites for this product slice. The stopped study remains incomplete and unchanged; do not restart it, substitute a subset into its frozen analysis, or claim noninferiority from its partial results. Its collected outputs remain available as historical evidence. This decision changes the product completion scope, not the old experiment's rules. The prior execution-recovery decisions remain historical authority for the attempts already made.

Proceed in this order: assemble the existing minmax three-bit expert pack with its original dense, draft, tokenizer and vision components; demonstrate a reproducible benefit under the actual app recipe at safe memory targets; then close representative quality and essential product failures using existing instruments. Reuse previously completed correctness and memory evidence where the source and artifact identities still match. Run additional checks only for uncovered behavior or changes.

Keep memory and format safety, parity, cancellation, request-bound settings, explicit download acceptance, reliable verification, rollback, and the final affected standard acceptance suite. The default and overrides must operate on the same checkpoint and must not change during a response. Other physical Macs remain outside the required program. Estimates must identify their assumptions.

Twenty committed tokens per second remains a measured engineering target for recommended configurations. A universal promise for arbitrary manual settings or unmeasured Macs is not a release claim. Publish measured speed, latency and quality limitations accurately. Any new performance comparison fixes its workloads and repeats before running and retains excluded or failed attempts. A smaller pack that has no practical benefit does not earn automatic promotion merely because it exists.

The model license remains independent of the engine's MIT license. Resolve the recorded commercial redistribution question before a public model-pack release; local engineering and evaluation continue. The complete prior evidence and this scope capture are preserved in [[sources/runs/2026/10/2026-10-05-practical-quantization-scope]].
