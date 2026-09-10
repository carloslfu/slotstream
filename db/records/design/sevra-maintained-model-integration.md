---
type: design
id: 01m21xw595ac9n303q61m8kvtq
created: 2026-09-09T01:52:44.837037+00:00
updated: 2026-09-09T01:52:44.837037+00:00
summary: 'Sevra integration: versioned hardware/model profiles, full-stack qualification, maintained updates and documentation tied to implementation.'
date: 2026-09-08
doc: plan
level: '2'
order: '5'
title: 'Sevra integration: maintained model choices for hardware'
---
Owner-approved engineering direction, September 8, 2026. Implementation of
the maintained-selection lifecycle is planned; the current Slotstream engine
continues to support its documented checkpoint and independent interfaces.

Sevra will select and maintain a small set of models for supported hardware,
optimizing inference, context, tools, memory and the interface as one experience.
The appropriate model may differ by hardware profile and change as better
choices qualify. The permanent single-flagship constraint is superseded at the
product level. This does not change existing engine defaults, weights or goldens.

Engineering requirements for that integration:

- Bind a versioned hardware profile to exact model/quantization, tokenizer,
  template, engine/runtime and resource defaults. The product owns model
  selection; the engine validates the selected pack and execution plan.
- Qualify each candidate on the same hardware against the current choice and
  credible alternatives. Score correct complete tasks and total latency,
  context, memory, storage and sustained behavior, not decode speed alone.
- Integrate and test only a few selected targets deeply. Current sparse-MoE
  optimizations and numerical gates remain exact. New graphs need explicit
  implementation and qualification; there is no general runner fallback.
- Keep model-dependent cache identities exact. A model/template/runtime change
  invalidates incompatible derived state; durable user data and permissions
  survive. Do not change a running request's model or silently route it remotely.
- Preserve documented Slotstream CLI/API/Swift behavior. New product selection
  does not silently retarget pinned or existing engine clients.
- Plan transactional model updates with clear notices, deferral, resource
  accounting, interrupted-update recovery and supported rollback. Offline use
  retains the installed qualified setup. Normal users need no model catalog or
  backend expertise; supported resource/context controls remain available.
- Before advertising a new model/profile, record its actual native support
  evidence and full application conformance. A narrow initial Mac release can
  use the current model; no full future matrix is a prerequisite.

Documentation is part of each implementation change. Update the relevant
canonical design/plan/measurement/claim records, README, hardware/API docs and
changelog alongside the behavior; regenerate PLAN.md with Tools/projections.py
and llms-full.txt with Tools/llms_full.sh. Distinguish engine evidence from app
support, estimates from measurements and planned features from released ones.
Keep old installation and embedding links working. Current README wording can
describe the product direction only with the app's in-development status.

This section specifies engine/product integration constraints. It is not an
implementation receipt, a model selection, a benchmark win or a binary release.
