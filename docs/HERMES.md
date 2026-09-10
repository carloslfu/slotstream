# Hermes with Slotstream

Hermes is installed separately. For shared provider settings and connection
troubleshooting, see [Connect apps and agents](CLIENTS.md).

Hermes uses the OpenAI chat-completions endpoint. Slotstream translates its
function definitions, calls, results, and reasoning into the same native model
format used by the fx gateway.

This support requires Slotstream 0.2.8 or later. Run the
[installer](../README.md#install) again to update an older installation, and
confirm the version with `slotstream --version`.

## Start Slotstream

Start one server:

```sh
slotstream serve --max-context 65536 --mtp off
```

This command matches the qualified setup with speculative decoding disabled.
Hermes requires a larger context than Slotstream's ordinary default. The
explicit flag selects the qualified window and charges its extra active state
and a measured transient reserve before allocating the expert cache. The
minimum memory target rises with this larger window. If overriding automatic
planning, inspect `slotstream doctor --max-context 65536` first and choose a
target that fits your Mac. Long prompts must still be read before the first
answer token.

## Configure Hermes

Use a separate Hermes home to keep existing provider settings intact:

```sh
mkdir -p ~/.hermes-slotstream
```

Save the following as `~/.hermes-slotstream/config.yaml`:

```yaml
model:
  provider: custom
  base_url: http://localhost:11434/v1
  default: qwen3.8-flash-next:4bit
  context_length: 65536
  max_tokens: 4096
agent:
  local_stream_stale_timeout: 1800
auxiliary:
  compression:
    provider: main
    extra_body:
      max_tokens: 4096
      temperature: 0.2
      presence_penalty: 0
  title_generation:
    provider: main
compression:
  enabled: true
```

With [Hermes](https://github.com/NousResearch/hermes-agent) installed, start it
from the directory where it should work:

```sh
HERMES_HOME="$HOME/.hermes-slotstream" OPENAI_API_KEY=unused \
  hermes chat --provider custom --model qwen3.8-flash-next:4bit --reasoning none
```

The placeholder key is for this local endpoint. Hermes uses chat completions.
The explicit context setting is reproducible; the server also exposes the
same runtime window through model discovery, so automatic discovery works.
Vision discovery also reflects whether this server accepts images. With the
vision weights available and vision enabled, Hermes can send image attachments.
The first image reserves the tower's memory inside the server target; a target
that can only fit text at this context size can refuse that additional load.
The local stream timeout allows a long cold prefill to finish. In unreleased
source builds, the server's `--max-prefill-wait` is a separate request deadline, defaulting to 30 minutes
and including queueing and preparation. If deliberately raising that server
budget, raise the client's stale-stream timeout and HTTP read timeout enough
to let the server return its own terminal result. Keepalives do not extend the
server budget. A deadline or resource error must not execute a pending tool
call or be treated as a completed summary.
The explicit completion allowance leaves room for input history and complete
tool arguments. Increase it for tasks that need larger tool payloads while
keeping room for the input history.

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

## Verify the loop

In an empty test directory, create a file containing a distinctive code. Ask
Hermes to read it with its terminal tool and report the exact contents. Then
ask for the code again from conversation history. This checks a real tool
call, its returned result, and a follow-up turn.

The automated protocol gate runs against an already-running server:

```sh
python3 Tools/openai_tools_gate.py --output /tmp/slotstream-openai-tools.jsonl
```

The gate preserves requests and responses and executes no tools. It checks
streamed and non-streamed tool loops, typed arguments and IDs, reasoning,
discovery, tool-choice behavior, and rejection of invalid histories. The
ordinary API and image regression suites remain separate.

Use the [API reference](API.md) for supported fields and limits. Tool
execution and argument validation belong to Hermes. Slotstream does not
implement the OpenAI Responses API or constrained JSON generation.

The [integration measurement](../db/records/measurements/hermes-context-and-openai-integration-2026-09-05.md)
records exact client commits, build identities, observed failures, passing
checks, and the limits of the qualification.
