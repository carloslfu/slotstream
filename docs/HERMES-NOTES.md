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

The startup command in the [setup guide](HERMES.md#start-slotstream) leaves
memory planning and speculative decoding on their automatic defaults.
Slotstream decides whether to enable the MTP draft head from its availability
and the planned expert cache. Hermes does not require an MTP override.
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
The auxiliary task timeouts are configured separately from the main stream
watchdog. Otherwise a long summary can time out while an equally long main
prefill would still be allowed to continue.

## Provider selection

The named `providers.slotstream` entry binds the endpoint, placeholder key,
API mode, and request overrides together. The launch command selects that
entry explicitly. A missing or disabled entry produces an initialization
error in the tested versions. Hermes can still log `provider=custom` for this
named endpoint; the resolved URL, not that internal label alone, identifies
the connection.

The older generic `custom` setup could collide with a saved provider also
named `custom`, including the legacy `custom_providers` list. `CUSTOM_BASE_URL`
from the shell or the profile's `.env` could also override the old
`model.base_url`. `OPENAI_BASE_URL` is not the routing override for that generic
Hermes path. The named setup is tested with all of these stale settings present.
This does not prevent someone from editing `providers.slotstream` itself or
deliberately configuring a fallback provider.

Explicit HTTP proxy variables are a separate routing layer. In both tested
Hermes versions, an HTTP proxy without local exclusions is selected even for
the local model URL. Include `localhost` and `127.0.0.1` in `NO_PROXY` and
`no_proxy` when using a proxy, preserving existing exclusions. The profile's
`.env` can override shell values. This condition does not explain a log that
already reports OpenRouter as the selected model endpoint.

## Output budgets

In the tested Hermes versions, CLI initialization does not forward
`model.max_tokens` to the agent. Our earlier guide put the limit there, and our
earlier integration gate constructed the agent directly with an explicit limit.
That bypassed the failing configuration path. Without a limit on the actual
request, Slotstream used its ordinary completion default and could cut off
long replies or tool arguments.

The guide now sets the main limit through
`providers.slotstream.extra_body.max_tokens`, which reaches the wire through
Hermes's named-provider request overrides. Auxiliary requests need their own
`extra_body.max_tokens`; they do not inherit this override. These are generation
ceilings. They do not repair Hermes's separate internal output-reservation
accounting, so leave compression enabled and room for input history. Larger
limits still have to fit the server's advertised `max_output_tokens` and
remaining context.

## Summaries and titles

Route auxiliary compression and titles to `main` to keep them on Slotstream.
Hermes omits the usual output-limit argument on custom-provider auxiliary
calls. Each task's `extra_body` supplies its own budget. Compression can take
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
The [configuration correction](../db/records/measurements/hermes-configuration-hardening-2026-09-08.md)
records the corrected guide and tests through the actual CLI configuration path.
Those live Hermes runs explicitly disabled MTP. The guide now follows
Slotstream's automatic default, but a live Hermes run with automatic MTP is
still pending. The gate records the selected server plan so that later runs
can distinguish enabled and disabled MTP coverage.
The earlier [protocol integration measurement](../db/records/measurements/hermes-context-and-openai-integration-2026-09-05.md)
records exact client commits, build identities, observed failures, passing
checks, and the limits of the qualification. These results cover those tested
versions and paths; they do not establish compatibility with every future client.

## Server request deadlines

Slotstream's `--max-prefill-wait` is a separate request deadline, including
queueing, preparation and image processing. If deliberately raising that
server budget, raise the client's stale-stream timeout and HTTP read timeout
enough to let the server return its own terminal result. Keepalives do not
extend the server budget. A deadline or resource error must not execute a
pending tool call or be treated as a completed summary. The first image
reserves the tower's memory inside the server target; a target that can only
fit text at the selected context size can refuse that additional load.

See [request limits and errors](API.md#request-deadlines-and-resource-failures).
