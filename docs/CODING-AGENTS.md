<a id="coding-agents"></a>

# Use coding agents with Slotstream

Coding agents such as Claude Code, Codex, Pi, opencode and Hermes run their
own loop: they read your files, run commands and ask a model what to do next.
Slotstream can be that model, running on your Mac. One command starts an
agent already connected to it:

```sh
slotstream launch <agent>
```

| Agent | Command | Guide |
|---|---|---|
| Claude Code | `slotstream launch claude` | [Claude Code](CLAUDE-CODE.md) |
| Codex | `slotstream launch codex` | [Codex](CODEX.md) |
| Pi | `slotstream launch pi` | [Pi](#pi) below |
| opencode | `slotstream launch opencode` | [opencode](#opencode) below |
| Hermes | `slotstream launch hermes` | [Hermes](HERMES.md) |

`slotstream launch` needs Slotstream 0.2.21 or later and the agent itself,
installed separately. These agent versions were verified: Claude Code
2.1.270, Codex 0.148.0, Pi 0.85.1, opencode 1.18.31 and Hermes 0.21.1.

## How it works

In your project's folder, run `slotstream launch` with the agent's name, or
without one to pick from the agents installed. It asks the server for its
model and context window, connects the agent to it, and starts the agent in
the same window. The agent then works as usual. Everything after the agent's
name is passed to the agent, for example
`slotstream launch pi -p "Summarize this repository"`.

When no server is running, `slotstream launch` starts one in the background
first and shows its start until the model answers:

- with the context window `slotstream doctor` picks for this Mac, or 65,536
  tokens for Hermes when that is smaller, since Hermes needs it;
- with prompt caches on disk in `~/.slotstream/prefix-cache`, so an agent's
  instructions are read once, also across restarts;
- with its log in `~/.slotstream/logs/serve.log`.

That server keeps running while any agent `slotstream launch` opened runs, so
the next session starts from the instructions already read. It stops 30
minutes after the last agent exits; `slotstream stop` stops it sooner.

To watch the server or choose its window, run it yourself in its own Terminal
window before `slotstream launch`:

```sh
slotstream serve --max-context 65536
```

The agents' instructions and tool descriptions are long, and the larger
window leaves room for the conversation. Hermes needs it; for the others it
helps on a Mac with memory to spare. `slotstream launch` uses a server you
started as it is, and never restarts it.

Options for `slotstream launch` go before the agent's name:

| Option | Meaning |
|---|---|
| `--port <n>` | The port the server listens on (default 11434). |
| `--memory-gb <gb>` | Memory target for a server it starts. Default: automatic. |
| `--idle-exit <minutes>` | How long a server it starts keeps running after the last agent exits (default 30); `0` keeps it running until `slotstream stop`. |
| `--no-start` | Use a running server only. |
| `--dry-run` | Print the server it would start, the command, variables and files, and start, download and write nothing. Keys and tokens are hidden. |

Each agent is connected in the way that leaves your own setup alone:

| Agent | How the connection is passed | What stays yours |
|---|---|---|
| Claude Code | Variables and `--settings` for this run | Your settings files and login |
| Codex | `-c` settings for this run, and a model description under `~/.slotstream/launch/codex/` | `~/.codex/config.toml` |
| Pi | A `slotstream` provider in Pi's `models.json` (`~/.pi/agent/` by default) | Everything else in that file, as written, and your default model |
| opencode | The `OPENCODE_CONFIG_CONTENT` variable for this run | Your opencode configuration files |
| Hermes | Its own folder, `~/.hermes-slotstream`, created once | Your usual `~/.hermes` |

The launch also closes the ways an agent could send your code to a hosted
model while you think it runs on your Mac. Claude Code's cloud provider
switches are turned off and its API key and key helper cleared for the run,
and its `WebSearch` tool, which runs on Anthropic's servers, is turned off.
opencode may use only the `slotstream` provider during the run. Hermes's
side tasks, such as the check that decides whether a command needs your
approval, use the same model. `codex cloud`, which runs tasks on OpenAI's
servers, is refused.

Thinking starts off, which is faster; each guide shows how to turn it on.
The first reply of a session takes a while, because the agent's instructions
are read before the first token; the server's log shows the progress, and
later turns read only what is new.

<a id="pi"></a>

## Pi

[Pi](https://github.com/earendil-works/pi) is a minimal terminal coding
agent. Install it with:

```sh
npm install -g @earendil-works/pi-coding-agent
```

Start Pi in your project:

```sh
slotstream launch pi
```

Pi reads custom providers from `~/.pi/agent/models.json` by default. If you
set `PI_CODING_AGENT_DIR` to another directory, the launch uses `models.json`
there instead. It adds a `slotstream` provider, or updates its address and
window. Everything else in the file stays as you wrote it, including other
models you added to that provider, and a file that is a link to your dotfiles
stays a link. It
then starts Pi with `--provider slotstream --model qwen3.8-flash-next:4bit
--thinking off`. A `--model` or `--thinking` you pass yourself replaces the
launch's own. Pi uses `--provider` only together with `--model`, so
`--provider slotstream` alone gets the model added, and another provider
without a model is refused. Pi's own commands, such as `pi install` or
`pi update`, pass through unchanged. Your default model does not change:
plain `pi` starts as before, and the Slotstream model appears in Pi's model
list.

To think before answering, pass a level: `slotstream launch pi --thinking
low` (or `medium` or `high`).

### Configure Pi yourself

To add the provider by hand, put this in `~/.pi/agent/models.json` (or
`$PI_CODING_AGENT_DIR/models.json` when using a custom directory), merged
with any providers already there:

```json
{
  "providers": {
    "slotstream": {
      "baseUrl": "http://127.0.0.1:11434/v1",
      "api": "openai-completions",
      "apiKey": "slotstream-local",
      "compat": { "supportsStore": false, "supportsStrictMode": false },
      "models": [
        {
          "id": "qwen3.8-flash-next:4bit",
          "name": "Qwen3.8-Flash-Next (Slotstream)",
          "reasoning": true,
          "thinkingLevelMap": { "minimal": null, "xhigh": null, "max": null },
          "input": ["text", "image"],
          "contextWindow": 65536,
          "maxTokens": 8192,
          "cost": { "input": 0, "output": 0, "cacheRead": 0, "cacheWrite": 0 }
        }
      ]
    }
  }
}
```

Set `contextWindow` to the window `slotstream serve` reports, and start the
server yourself as shown in [how it works](#how-it-works). Then run
`pi --provider slotstream --model qwen3.8-flash-next:4bit --thinking off`.
Pi asks for medium thinking unless told otherwise, so keep `--thinking off`
for the faster mode.

<a id="opencode"></a>

## opencode

[opencode](https://opencode.ai) is a terminal coding agent with its own
interface. Install it with:

```sh
npm install -g opencode-ai
```

Start it in your project:

```sh
slotstream launch opencode
```

The launch passes a `slotstream` provider, and the Slotstream model as the
main model, the small model opencode uses for titles, and the model of its
`build` and `plan` agents, in the `OPENCODE_CONFIG_CONTENT` variable. It also
enables only the `slotstream` provider for the run, so an agent or command
set to another provider fails instead of sending your code there. opencode
merges that with your own configuration files, which stay unchanged. If you
already export `OPENCODE_CONFIG_CONTENT`, the launch adds to it.

For a single task without the interface, use `slotstream launch opencode run
"Summarize this repository"`.

### Configure opencode yourself

To use Slotstream from plain `opencode`, add the provider to
`~/.config/opencode/opencode.json`:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "model": "slotstream/qwen3.8-flash-next:4bit",
  "small_model": "slotstream/qwen3.8-flash-next:4bit",
  "provider": {
    "slotstream": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "Slotstream",
      "options": {
        "baseURL": "http://127.0.0.1:11434/v1",
        "apiKey": "slotstream-local"
      },
      "models": {
        "qwen3.8-flash-next:4bit": {
          "name": "Qwen3.8-Flash-Next (Slotstream)",
          "tool_call": true,
          "attachment": true,
          "limit": { "context": 65536, "output": 8192 }
        }
      }
    }
  }
}
```

Set `limit.context` to the window `slotstream serve` reports, and start the
server yourself as shown in [how it works](#how-it-works).

This sets the default and small models. Existing agent or command model
overrides can still select another provider. For local-only use, also set
`enabled_providers` to `["slotstream"]`, ensure `slotstream` is not disabled,
and point explicit agent and command models at
`slotstream/qwen3.8-flash-next:4bit`. This provider restriction applies to
all sessions that read that configuration. `slotstream launch opencode`
applies it only for that run and sets the `build` and `plan` models
automatically.

## Troubleshooting

| Problem | What to check |
|---|---|
| `slotstream launch: no Slotstream server answered on port 11434` | You ran it with `--no-start`. Start `slotstream serve` in another Terminal window, or run it without `--no-start`. If the server uses another port, pass it with `--port`. |
| `another Slotstream model process is running` | A server on another port, `slotstream run` or a check holds the model, and only one fits in memory. Stop it, or pass that server's port with `--port`. |
| `Slotstream stopped while starting` | The lines above it, and `~/.slotstream/logs/serve.log`, say why. If memory is short, close memory-heavy apps or pass a smaller `--memory-gb`. |
| ``slotstream launch: `pi` is not on your PATH`` | Install the agent with the command in its section, or add the folder that holds it to `PATH`. |
| `the server on port 11434 is not Slotstream` | Another server, such as Ollama, uses the port. Stop it, or start Slotstream with `--port` and pass the same port to `slotstream launch`. |
| `needs a context window of at least` | You started the server yourself, or another agent is using it. Stop it with `slotstream stop` (or Control+C in its window) once it is free and run the launch again; it starts a server with that window. |
| `Pi's models file is not plain JSON` | The file has comments or another format the launch does not rewrite. Add the provider by hand as shown above. |
| Pi says `Unknown provider "slotstream"` | Pi could not read its models file. Its warning above names the entry to fix; Pi ignores the whole file while any entry is invalid. |
| `` Pi uses `--provider` only together with `--model` `` | Name a model with `--model`, or run `pi` directly to use another provider. |
| opencode fails with `UnknownError` | After `slotstream launch`, this can mean an agent or command names a model from another provider, which the launch does not enable. Set that model to `slotstream/qwen3.8-flash-next:4bit`. If the configuration already uses Slotstream, check the error details and opencode logs for the actual cause. |
| `the server on port 11434 is busy` | Every connection the server takes is in use. Wait for running requests to finish and try again. |
| The first reply is slow | `tail -f ~/.slotstream/logs/serve.log` shows its progress, or the Slotstream window when you started the server yourself. Long first prompts take minutes on small memory targets. |
| A new session reads the instructions again | With a server you started yourself, add `--prefix-cache-dir` to keep shared instructions on disk, as in [the Claude Code guide](CLAUDE-CODE.md#keep-shared-prompts-on-disk). A server `slotstream launch` starts does this already. |
| Connection refused | The server stopped, with `slotstream stop` or 30 minutes after the last agent exited. Run `slotstream launch` again. |

[Connect apps and agents](CLIENTS.md) covers chat apps and other
OpenAI-compatible clients. For the wire protocols, see the
[API reference](API.md).
