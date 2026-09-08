# Hermes engineering notes

The [Hermes setup guide](HERMES.md) is the user walkthrough and the source
for the complete tested configuration. These notes explain the integration
and its limits for developers and people adjusting that configuration.

## Protocol and ownership

Hermes uses the OpenAI chat-completions endpoint. Slotstream translates its
function definitions, calls, results, and reasoning into the same native model
format used by the fx gateway. Tool execution and argument validation belong
to Hermes. Slotstream does not implement the OpenAI Responses API or
constrained JSON generation. See the [API reference](API.md).

## Context and memory

The startup command in the [setup guide](HERMES.md#start-slotstream) matches the
qualified setup with speculative decoding disabled.
Hermes requires a larger context than Slotstream's ordinary default. The
explicit flag selects the qualified window and charges its extra active state
and a measured transient reserve before allocating the expert cache. The
minimum memory target rises with this larger window. If overriding automatic
planning, inspect `slotstream doctor --max-context 65536` first and choose a
target that fits your Mac. Long prompts must still be read before the first
answer token.

## Discovery, images, and timeouts

The placeholder key is for this local endpoint. Hermes uses chat completions.
The explicit context setting is reproducible; the server also exposes the
same runtime window through model discovery, so automatic discovery works.
Vision discovery also reflects whether this server accepts images. With the
vision weights available and vision enabled, Hermes can send image attachments.
The first image loads the vision tower in addition to the announced text
plan. Image admission checks available memory and can refuse the additional
load when there is not enough headroom.
The local stream timeout allows a long cold prefill to finish; it remains
bounded and should be adjusted to measurements on slower hardware.
The explicit completion allowance leaves room for input history and complete
tool arguments. Increase it for tasks that need larger tool payloads while
keeping room for the input history.

## Summaries and titles

Route auxiliary compression and titles to `main` to keep them on Slotstream.
Hermes omits the usual output-limit argument on custom-provider auxiliary
calls. The compression-specific `extra_body` gives its summary a separate
budget while ordinary chat keeps its existing default. Compression can take
several minutes on a long history. Compressing a very short conversation may
increase its size because Hermes adds a structured handoff and retains recent
messages; test it on a history with a substantial middle to summarize.
Title generation can request constrained JSON first; Slotstream explicitly
rejects that unsupported mode, and Hermes retries without the constraint.
This fallback does not provide a strict JSON-schema guarantee.

## Integration checks

The automated protocol gate runs against an already-running server:

```sh
python3 Tools/openai_tools_gate.py --output /tmp/slotstream-openai-tools.jsonl
```

The gate preserves requests and responses and executes no tools. It checks
streamed and non-streamed tool loops, typed arguments and IDs, reasoning,
discovery, tool-choice behavior, and rejection of invalid histories. The
ordinary API and image regression suites remain separate.

Run the command from a source checkout, with the server already running.
For tests through the actual Hermes client, including compression and images,
see [OpenAI agent integration](TESTING.md#openai-agent-integration).
The [integration measurement](../db/records/measurements/hermes-context-and-openai-integration-2026-09-05.md)
records exact client commits, build identities, observed failures, passing
checks, and the limits of the qualification. These results cover those tested
versions and paths; they do not establish compatibility with every future client.
