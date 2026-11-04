<a id="use-claude-code-with-slotstream"></a>

# Use Claude Code with Slotstream

Run Anthropic's Claude Code on the model Slotstream serves. Claude Code edits
files and runs commands through its own tools; Slotstream provides the model
over the Anthropic Messages API on your Mac. No Anthropic account or API key
is needed, and the model runs offline.

## Before you start

- Slotstream 0.2.21 or later, installed with its model, from the
  [getting started guide](GETTING-STARTED.md). `slotstream --version` shows
  yours; the install command updates it.
- Claude Code installed, from its
  [setup guide](https://code.claude.com/docs/en/setup).

These steps were verified with Claude Code 2.1.270. If a newer version
behaves differently, start with the troubleshooting table at the end.

## Start Claude Code

In Terminal, go to your project directory and run:

```sh
slotstream launch claude
```

If Slotstream is not running, this starts it in the background first and shows
its start until the model answers. The first reply then takes a while: Claude
Code's instructions and tool descriptions, about 15,000 tokens, are read once
before the first token. Later turns, and later sessions, read only what is
new.

The server keeps running while Claude Code runs, and stops 30 minutes after
the last session ends. `slotstream stop` stops it sooner, and
`tail -f ~/.slotstream/logs/serve.log` shows what it is doing. To start the
server yourself instead, see [run the server yourself](#run-the-server-yourself).

`slotstream launch claude` asks the server for its model and window, then
starts Claude Code with:

- the server as its API address, a placeholder token, and the Slotstream
  model for every model name Claude Code uses, so subagents and background
  tasks run on your Mac too;
- the served context window and reply limit, so Claude Code compacts the
  conversation before it outgrows the window;
- thinking off, request and stream timeouts long enough for a first
  prompt, and Claude Code's nonessential network traffic (telemetry, error
  reports, update checks) off;
- its `WebSearch` tool off, since it runs on Anthropic's servers.

The connection is passed with `--settings`. Claude Code applies those
settings over the `env` in your own settings files, so nothing there can send
this run elsewhere: Claude Code's switches for Bedrock, Vertex, Foundry and
its other cloud providers are turned off, and any `ANTHROPIC_API_KEY` or
`apiKeyHelper` is cleared, so no key of yours reaches the server. An exported
`CLAUDE_CODE_OAUTH_TOKEN` is not sent either; the placeholder token is. Your
settings files are not changed, and plain `claude` keeps using your
account. A managed settings file from your organization still takes
precedence over the launch.

Anything after `claude` goes to Claude Code:

```sh
slotstream launch claude --continue
slotstream launch claude -p "Summarize this repository"
```

If the server runs on another port, pass it before the tool name:
`slotstream launch --port 8080 claude`. To see the command and settings
without starting anything, add `--dry-run`.

## Try it

Ask for something that needs a file edit and a command:

```text
Create a file named hello.txt whose entire content is the single line: SLOTSTREAM OK. Then read the file back and tell me exactly what it contains.
```

Claude Code writes the file with its `Write` tool, reads it back, and reports
the contents. Check that `hello.txt` exists and holds the line.

Pictures you paste into Claude Code are read by the model on your Mac.

## Thinking

Thinking is off by default, which is faster. To turn it on, set
`MAX_THINKING_TOKENS` to any positive number; `CLAUDE_CODE_EFFORT_LEVEL`
(`low`, `medium` or `high`, the default) sets how much the model thinks:

```sh
MAX_THINKING_TOKENS=1 CLAUDE_CODE_EFFORT_LEVEL=low slotstream launch claude
```

Claude Code asks for its thinking to be hidden, so it shows that the model is
thinking but not the text.

## What differs from Claude

- **Cost.** Claude Code estimates a price for a model it does not know, so its
  cost figures are not zero. Nothing is billed; the model runs on your Mac.
- **Web search.** Claude Code's `WebSearch` tool runs on Anthropic's servers,
  so the launch turns it off.
- **Files.** Text files and pictures work. PDF documents and files uploaded
  through the Files API do not.
- **Prompt caching.** Claude Code's cache markers are ignored. Slotstream
  reuses prompts on its own: a conversation's next turn reads only what is
  new, and a new session starts from the instructions an earlier session
  read. See [shared prompts](#keep-shared-prompts-on-disk).
- **Model choice.** The model aliases `opus`, `sonnet` and `haiku`, in
  `/model`, `--model` and subagent settings, all run the Slotstream model. A
  full Claude model name, such as one pinned in a subagent file, is refused
  with a not-found error; use an alias there instead.

<a id="keep-shared-prompts-on-disk"></a>

## Keep shared prompts on disk

The server keeps a few recent conversations in memory. When other
conversations fill that space, a new Claude Code session would read the
instructions again. A server `slotstream launch` starts also keeps them on
disk, in `~/.slotstream/prefix-cache`, so new sessions start from the saved
instructions, also after the server restarts. `slotstream prefix-cache` lists
what is saved, and `slotstream prefix-cache --clear` removes it while no server
runs. [The `serve` reference](CLI.md#slotstream-serve) describes the directory
and its disk quota.

<a id="run-the-server-yourself"></a>

## Run the server yourself

To watch the server or choose its window, start it in its own Terminal window
before `slotstream launch claude`:

```sh
slotstream serve --max-context 65536 --prefix-cache-dir ~/.slotstream/prefix-cache
```

Wait for `slotstream listening on http://127.0.0.1:11434`. `slotstream launch
claude` then uses this server as it is, and it runs until you press
**Control+C** in its window or run `slotstream stop`. The larger window leaves
more room for the conversation. On a Mac with little memory it can leave too
little to keep a whole conversation for the next turn:
`slotstream doctor --max-context 65536` shows how much is kept at that size.
A server `slotstream launch` starts uses the window `slotstream doctor` picks.

## Configure Claude Code yourself

`slotstream launch claude` is the simplest way to start. To start `claude`
directly instead, set these variables first. Use the model name and window
that `curl -s http://127.0.0.1:11434/v1/models` shows:

```sh
export ANTHROPIC_BASE_URL=http://127.0.0.1:11434
export ANTHROPIC_AUTH_TOKEN=slotstream-local
export ANTHROPIC_MODEL=qwen3.8-flash-next:4bit
export ANTHROPIC_DEFAULT_OPUS_MODEL=qwen3.8-flash-next:4bit
export ANTHROPIC_DEFAULT_SONNET_MODEL=qwen3.8-flash-next:4bit
export ANTHROPIC_DEFAULT_HAIKU_MODEL=qwen3.8-flash-next:4bit
export ANTHROPIC_DEFAULT_FABLE_MODEL=qwen3.8-flash-next:4bit
export ANTHROPIC_SMALL_FAST_MODEL=qwen3.8-flash-next:4bit
export CLAUDE_CODE_MAX_CONTEXT_TOKENS=65536
export CLAUDE_CODE_MAX_OUTPUT_TOKENS=8192
export CLAUDE_CODE_ATTRIBUTION_HEADER=0
export MAX_THINKING_TOKENS=0
export API_TIMEOUT_MS=1800000
export CLAUDE_STREAM_IDLE_TIMEOUT_MS=1800000
export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1
unset ANTHROPIC_API_KEY CLAUDE_CODE_USE_BEDROCK CLAUDE_CODE_USE_VERTEX \
  CLAUDE_CODE_USE_FOUNDRY CLAUDE_CODE_USE_ANTHROPIC_AWS \
  CLAUDE_CODE_USE_ANTHROPIC_GOOGLE_CLOUD CLAUDE_CODE_USE_MANTLE CLAUDE_CODE_USE_GATEWAY
claude --disallowedTools WebSearch
```

An `env` block in a Claude Code settings file overrides these variables, so
first remove any `ANTHROPIC_` and `CLAUDE_CODE_USE_` entries, and any
`apiKeyHelper`, from `~/.claude/settings.json` and the project's
`.claude/settings.json`.

`CLAUDE_CODE_ATTRIBUTION_HEADER=0` removes a line that changes with every
conversation from the start of the instructions; Slotstream ignores that line
anyway.

## Troubleshooting

| Problem | What to check |
|---|---|
| `slotstream launch: no Slotstream server answered on port 11434` | You ran it with `--no-start`. Start `slotstream serve` in another Terminal window, or run `slotstream launch claude` without `--no-start`. If the server uses another port, pass it with `--port`. |
| `another Slotstream model process is running` | A server on another port, `slotstream run` or a check holds the model, and only one fits in memory. Stop it, or pass that server's port with `--port`. |
| `Slotstream stopped while starting` | The lines above it, and `~/.slotstream/logs/serve.log`, say why. If memory is short, close memory-heavy apps or pass a smaller `--memory-gb`. |
| ``slotstream launch: `claude` is not on your PATH`` | Install Claude Code from its setup guide, or add the folder that holds `claude` to `PATH`. |
| `does not have the Anthropic Messages API Claude Code needs` | The server is older than 0.2.21. Update Slotstream with the install command and restart the server. |
| Claude Code asks you to log in | It was started without the connection. Start it with `slotstream launch claude`. |
| `API Error: Request timed out` | The first prompt took longer than Claude Code waited. Give the server more memory so the prompt reads faster (`slotstream stop`, then `slotstream launch --memory-gb <gb> claude`), or export larger `API_TIMEOUT_MS` and `CLAUDE_STREAM_IDLE_TIMEOUT_MS` values before `slotstream launch claude`. |
| `the server on port 11434 is busy` | Every connection the server takes is in use. Wait for running requests to finish and try again. |
| `prompt is too long` | The conversation outgrew the window. Claude Code compacts it and continues; if it keeps happening, [run the server yourself](#run-the-server-yourself) with a larger `--max-context`. |
| `ignoring request field(s)` in the server's log | Claude Code sent options Slotstream does not use. The request still runs; the message appears once per field. |
| Every new session reads the instructions again | With a server you started yourself, add `--prefix-cache-dir`; see [keep shared prompts on disk](#keep-shared-prompts-on-disk). |
| Connection refused | The server stopped, with `slotstream stop` or 30 minutes after the last session. Run `slotstream launch claude` again. Otherwise check that the port matches; see [port conflicts](TROUBLESHOOTING.md#the-server-cant-listen-on-port-11434). |

For details of the wire protocol, see the [API reference](API.md#v1messages).
[General troubleshooting](TROUBLESHOOTING.md) covers startup, memory, and
model files.
