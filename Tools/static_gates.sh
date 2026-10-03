#!/bin/bash
# Fast, weights-free checks suitable for every pull request and release.
set -euo pipefail
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
export BIN SLOTSTREAM_TEST_BINARY="$BIN"

for f in install.sh Tools/*.sh .githooks/*; do
  bash -n "$f"
done
sh -n install.sh
python3 -m py_compile Tools/*.py Tools/reference/*.py Tools/slotpack/*.py
python3 Tools/static_gates_binary_test.py
python3 Tools/installer_gates_binary_test.py
python3 Tools/installer_metal_test.py
python3 Tools/verify_binary_test.py
python3 Tools/adaptive_memory_e2e_test.py
python3 Tools/parity_comparison_test.py
python3 Tools/sampler_gates_test.py
python3 Tools/planner_gates_test.py
python3 Tools/api_generation_test.py
python3 Tools/consumer_smoke_test.py
python3 Tools/e2e_release_test.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/context_qualification_checks.py
python3 Tools/process_cleanup_checks.py
python3 Tools/launch_request_deadline_test.py
python3 Tools/safetensors_empty_test.py
# These use tiny fixtures or mocked processes; none loads MLX, builds Swift,
# reads model weights, or takes the live model lock. Syntax checks alone do
# not exercise their benchmark validity and artifact-identity assertions.
for suite in build_identity optimization_build optimization_serial_build optimization_readiness thermal_readiness prefill_bench expert_layout_probe \
             ngram_cache_probe indexer_score_probe vision_capacity_gate vision_qualification \
             optimization_prerequisites optimization_soak optimization_campaign optimization_results \
             quantization_inventory quantization_baseline quantization_quality quantization_paired quantization_code_sandbox quantization_bfcl quantization_outcomes quantization_long_context quantization_image_outcomes quantization_product_campaign quantization_outcome_campaign quantization_outcome_continuation quantization_grader_source_audit quantization_grader_continuation quantization_tasks quantization_performance_metrics quantization_performance_campaign quantization_logit_pilot affine_expert_control affine_expert_reference affine_standalone_metadata affine_standalone_export affine_standalone_run research_payload_retirement standalone_bundle tensor_subset vq_kernel_sources vq_ple_stream vq_model_reference vq_execution_profile vq_draft_inventory vq_dense_overlay vq_dense_reinvestment vq_uncached_expert vq_contiguous_expert vq_record_repack vq_pilot_admission vq_model_fetch vq_rotary_table_source; do
  python3 "Tools/${suite}_test.py"
done
Tools/llms_full.sh --check

# The brain: the store validates, MEASUREMENTS.md and PLAN.md match their
# records, and every public number still has its needle on its surfaces.
Tools/brain_gates.sh

(cd bench/parity31 && shasum -a 256 -c SHA256SUMS)

if grep -En 'File\(path: .*sha256: nil\)' Sources/Slotstream/PinnedModel.swift; then
  echo "pinned manifest contains an unhashed file" >&2
  exit 1
fi

python3 Tools/mtp_process_guard_gate.py --binary "$BIN"
"$BIN" runtime-check
# Native OS accounting regression with at most 192 MiB of live Metal buffers.
# It compiles the production counter directly, without MLX or model weights.
python3 Tools/process_memory_gate.py
"$BIN" pull-check
python3 Tools/slotpack/cli_checks.py --binary "$BIN" --selection-only --receipt .build/model-pack-selection.json
python3 Tools/pull_interrupt_gate.py
python3 Tools/slotpack/checks.py
Tools/planner_gates.sh
python3 Tools/memory_override_gate.py --binary "$BIN"
Tools/installer_gates.sh

echo "STATIC GATES PASS"
