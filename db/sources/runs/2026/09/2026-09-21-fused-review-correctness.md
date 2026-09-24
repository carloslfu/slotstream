---
type: run
id: 01m32memsry64tgkekmq1v8cks
created: 2026-09-21T18:43:01.047773+00:00
updated: 2026-09-21T18:43:08.911321+00:00
summary: 'Fused attention reassessment: numerical fidelity, symmetric controls and real tasks'
binary: MLX 0.32.2 isolated Swift build; see identity.json in the archive
captured_at: 2026-09-21
command: accuracy.py; run.py selected-attention-family fused-review
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Fused attention reassessment: numerical fidelity, symmetric controls and real tasks'
tool: Python MLX and isolated native Swift diagnostics
---
[Raw experiment, source archive and dependency-dispatch excerpts](../../../artifacts/fused-review-2026-09-21/correctness.tar.gz), with [verified member hashes](../../../artifacts/fused-review-2026-09-21/correctness-manifest.json).

The isolated experimental build retains the MLX 0.32.2 Swift pin ab924c82ead3b970caaa1c0ac11171de23f0305a and its matching metallib. Exact source and binary hashes are in identity.json. It is separate from the shipping MLX 0.31.1 checkout. Only one model process runs at a time after a real reclaimable-memory preflight; the full-model fixtures use 640 slots and a 10 GB footprint ceiling. No deployment or release occurred.

accuracy.py compares both BF16 implementations against a NumPy float64 attention reference, computed from exactly the same rounded BF16 Q/K/V inputs. It checks eight query rows across all 24 query heads, two KV heads, head dimension 256, three fixed seeds, causal and selected-block masks, query lengths 256/259, key lengths 8192/32768/8211. All 12 cases are finite and fused relative-L2 error is smaller in every case. Median unfused/fused error ratio is 2.562232, range 2.465350 to 2.681446. This is sampled component fidelity, not full-model accuracy or a task-quality certification.

The selected-attention-family rerun preserves the original seven candidate-token checks and adds the same seven checks for the ordinary 512-token rechunking control. The candidate reproduces its three mismatches; the control also fails continued-2103 (367 versus reference 643). Total 813/817 checks pass. All prior numerical/state/routing bands still pass. Candidate and control prefill use the same MLX version. The fixture contains arbitrary token IDs; teacher-forced continuations and rollback checks do not have semantically correct answers. Top-five logits and top-two margins are recorded for all three arms. This does not erase the original cross-kernel parity failures.

fused-review checks four independently specified inventory tasks at 3935 to 4190 prompt tokens, with 256-row compute, 4096-token read scopes, greedy decoding and thinking disabled. Both backends return identical token sequences for all four prompts. Retrieval, JSON extraction and a typed record_inventory tool call are correct. Both answer 966 for an arithmetic question whose correct answer is 714. The two failed arithmetic assertions are preserved, so the functional report is 35/37, not a full pass. A tool call is parsed and checked, never executed externally. This small semantic comparison detects no candidate-only regression but proves neither broad quality parity nor general reliability.

The same candidate backend separately reuses 2048 tokens and exactly reproduces cold logits bit for bit, as well as the greedy token, with no runtime errors. That preserves the warm/cold invariant on this fixture even though changing backends can change token choices. Every observed full-model functional physical peak stays below 10 GB.

The code audit records a dispatch distinction: this checkout still defaults D256 to fused only with at least 1024 causal queries and no array mask; force_fused bypasses those heuristics after support checks and reaches the NAX kernel with the explicit sparse masks used here. The subsequent automatic array-mask dispatch change is not needed by this forced path. Upstream work belongs to [wyanzhao](https://github.com/ml-explore/mlx/pull/3842), [hojin12312](https://github.com/ml-explore/mlx/pull/4185), and [dwijenpatel](https://github.com/ml-explore/mlx/pull/4416), respectively for the D256 NAX kernel, force_fused API and later array-mask dispatch. This task implemented the integration and reassessment harness.

The first reassessment build failed because a diagnostic called an internal JSON parser across module boundaries. The corrected diagnostic uses Foundation JSON parsing; the successful build and failed attempt are both retained. The completed correctness results do not qualify timing. Paired performance is a separate experiment.
