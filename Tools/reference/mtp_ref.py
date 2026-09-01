# MLX reference for the Qwen4Exp MTP (multi-token-prediction) block.
#
# Semantics follow vLLM's Qwen4ExpMultiTokenPredictor ("scheme A"), the only
# public inference implementation of this head:
#   - fusion is residual_linear_shared: fc_embedding projects the (normed)
#     token embedding [T,H]; fc_hidden (one [H,H] weight SHARED across the hc
#     branches) projects the (full-width-normed) backbone multi stream
#     [T,hc,H]; the embedding is added as a residual to every branch.
#   - the backbone hidden fed in is the PRE-final-mixer multi stream
#     [T, hc*H] — from the main model on step 0, from the previous draft
#     step's own multi stream on later steps.
#   - one full_attention DecoderLayer (no PLE), then the MTP's own
#     hyper_connection_mixer collapses to [T,H] for the shared lm_head; the
#     pre-mixer multi stream is kept as the next step's hidden input.
#
# Weight conventions match Tools/mtp_convert.py output: centered norms
# (incl. both pre_fc norms) already have +1 folded in, so plain RMSNorm
# modules apply here.

import copy

import mlx.core as mx
import mlx.nn as nn

from qwen4_exp import (  # vendored reference, same directory
    DecoderLayer,
    GatedResidual,
    RMSNorm,
    RotaryEmbedding,
    TextArgs,
    _AttnCache,
)


def mtp_args(args: TextArgs) -> TextArgs:
    a = copy.copy(args)
    a.layer_types = ["full_attention"]
    a.ple_layer_ids = []
    return a


class MTPModule(nn.Module):
    """The MTP head minus the shared pieces (embed_tokens, lm_head, rope)."""

    def __init__(self, args: TextArgs):
        super().__init__()
        a = mtp_args(args)
        self.hc = a.hc_count
        self.d = a.hidden_size
        self.fc_embedding = nn.Linear(self.d, self.d, bias=False)
        self.fc_hidden = nn.Linear(self.d, self.d, bias=False)
        self.pre_fc_norm_embedding = RMSNorm(self.d, eps=a.rms_norm_eps)
        self.pre_fc_norm_hidden = RMSNorm(self.hc * self.d, eps=a.rms_norm_eps)
        self.layers = [DecoderLayer(a, 0)]
        self.hyper_connection_mixer = GatedResidual(a, use_combine=False)

    def fuse(self, embedded: mx.array, hidden_multi: mx.array) -> mx.array:
        """(B,T,H) embedded tokens + (B,T,hc*H) backbone multi -> (B,T,hc*H)."""
        b, t, _ = embedded.shape
        e = self.fc_embedding(self.pre_fc_norm_embedding(embedded))
        h = self.pre_fc_norm_hidden(hidden_multi).reshape(b, t, self.hc, self.d)
        h = self.fc_hidden(h)
        h = e[..., None, :] + h
        return h.reshape(b, t, self.hc * self.d)

    def __call__(
        self,
        embedded: mx.array,
        hidden_multi: mx.array,
        rope: RotaryEmbedding,
        cache: _AttnCache | None,
    ) -> tuple[mx.array, mx.array]:
        """Returns (sample_hidden (B,T,H) for lm_head, multi (B,T,hc*H) for
        the next draft step)."""
        h = self.fuse(embedded, hidden_multi)
        # Mirrors the runtime's mask choice (and the vendored model's
        # create_attention_mask result): fused causal for multi-token steps,
        # nothing for single-token decode.
        mask = "causal" if h.shape[1] > 1 else None
        idx_cache = cache.indexer if cache is not None else None
        h = self.layers[0](h, rope, mask, None, cache, idx_cache, None, None)
        return self.hyper_connection_mixer(h), h


def load_mtp(mtp_safetensors: str, args: TextArgs) -> MTPModule:
    weights = mx.load(mtp_safetensors)
    weights = {k.removeprefix("mtp."): v for k, v in weights.items()}
    model = MTPModule(args)
    nn.quantize(
        model,
        group_size=64,
        bits=4,
        class_predicate=lambda p, m: f"{p}.scales" in weights,
    )
    model.load_weights(list(weights.items()))
    model.eval()
    return model
