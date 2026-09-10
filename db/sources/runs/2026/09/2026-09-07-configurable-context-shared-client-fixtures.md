---
type: run
id: 01m1wvg2h43m19rtfth6m4yhqs
created: 2026-09-07T02:34:59.492956+00:00
updated: 2026-09-07T02:34:59.771535+00:00
summary: Context consumer, Hermes and published gateway fixtures integrated into shared Tools
binary: 9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9
captured_at: 2026-09-07
command: Exact commands and frozen identity below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Context consumer, Hermes and published gateway fixtures integrated into shared Tools
tool: Native Swift diagnostics and Python CLI gates
---
# Complete client-fixture handoff

A final source/worktree delta review found three context-owned client fixtures
that had not yet reached the shared Tools directory. The reviewed integration
preserves exact preimages and copies the already exercised context versions.
No provider, model, compiler or live client call is launched during integration.

The public Swift consumer fixture names the dependency explicitly so isolated
worktree basenames do not change SwiftPM package identity. It checks the old
function-value API signatures plus additive context/request controls and limits
compilation to two jobs. Its earlier real compilation evidence remains at
[[sources/runs/2026/09/2026-09-06-configurable-context-external-swift-consumer-pass]].
That result is identified prior-build evidence, not a newly performed V215
external compile or final C22 completion.

The actual Hermes fixture now accepts the exact expected server context, with
65536 unchanged as its default, and checks CLI/discovery against that choice.
Its accepted input range respects Hermes's64000minimum and the262144model
limit without claiming that every window is supported or qualified. Four
invalid-window invocations return parser exit2 before creating output state
or importing the external checkout. No live request is sent.

The published AI SDK gateway fixture is now present at its documented path.
It permits only the selected loopback fetch origin, verifies discovered context,
requires a completed greeting and one allowlisted fixture read/tool round trip,
and saves exact requests/responses. Identified previous32K/65K outcomes remain
[[sources/runs/2026/09/2026-09-06-configurable-context-actual-32k-client-contracts]]
and [[sources/runs/2026/09/2026-09-06-configurable-context-actual-65k-client-pass]].
It is successful-client evidence, not the separate strict receiving-side
error/EOF/length authority gate or a Sevra H2 certification.

Shell/Python/Node syntax checks pass. The exact three Tools hashes and four
invalid Hermes invocations are below. RuntimeV215, public65536/default32768,
frozen capacity drivers and all sixteen unrun P5 main rungs remain unchanged.
This loaded-machine source carries no resource or timing claim. Final public
mode, full resource, CI/release, installed inference and rollback remain open.

## Frozen build identity

```json
{
  "binary_sha256": "9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "dbdef8e89d59e853fabca4661eff67851fd097c8680beed9fab5fb465a0b819d"
}
```

## context-client-tools-integration/receipt.json

SHA-256 `f54a0fa9c7a1fe97a88bf186eb3166a73518febe9443cea9b8e5fdd12760f4aa`; 3399 bytes.

````text
{
  "files": [
    {
      "path": "Tools/consumer_smoke.sh",
      "before_sha256": "374661ab0d9ed3f7edcc64b8b0a0cb7b9f12c513dc83b84eca98c0dc1e846c08",
      "after_sha256": "04c94469a42792c54e0702f6244da78cc04ae0f4e913a3a5cdf102901373384d",
      "after_bytes": 4259
    },
    {
      "path": "Tools/hermes_integration_gate.py",
      "before_sha256": "a2ec8feb1737abede28713945687760513c52c6d3823b4e04c0fa831752389b3",
      "after_sha256": "517c4b7fbdc5a24bedb7924cb57051ec65b58d44d0c0df40e7119ab44e54b0f6",
      "after_bytes": 12762
    },
    {
      "path": "Tools/gateway_client_gate.mjs",
      "before_sha256": null,
      "after_sha256": "7a5b605d18d6044fa4d038d169ace4b6541222a3d98977f2b773e204c34864dd",
      "after_bytes": 4849
    }
  ],
  "checks": [
    {
      "command": [
        "bash",
        "-n",
        "<context-worktree>/Tools/consumer_smoke.sh"
      ],
      "exit": 0,
      "stdout": "",
      "stderr": ""
    },
    {
      "command": [
        "python3",
        "-m",
        "py_compile",
        "<context-worktree>/Tools/hermes_integration_gate.py"
      ],
      "exit": 0,
      "stdout": "",
      "stderr": ""
    },
    {
      "command": [
        "node",
        "--check",
        "<context-worktree>/Tools/gateway_client_gate.mjs"
      ],
      "exit": 0,
      "stdout": "",
      "stderr": ""
    },
    {
      "case": "Hermes context 0",
      "exit": 2,
      "output_directory_created": false,
      "stderr": "usage: hermes_integration_gate.py [-h] [--port PORT] [--context CONTEXT]\n                                  [--cli] [--compress] [--image IMAGE]\n                                  source output\nhermes_integration_gate.py: error: --context must satisfy Hermes Agent\u2019s 64000-token minimum and fit the pinned model limit\n"
    },
    {
      "case": "Hermes context 32768",
      "exit": 2,
      "output_directory_created": false,
      "stderr": "usage: hermes_integration_gate.py [-h] [--port PORT] [--context CONTEXT]\n                                  [--cli] [--compress] [--image IMAGE]\n                                  source output\nhermes_integration_gate.py: error: --context must satisfy Hermes Agent\u2019s 64000-token minimum and fit the pinned model limit\n"
    },
    {
      "case": "Hermes context 63999",
      "exit": 2,
      "output_directory_created": false,
      "stderr": "usage: hermes_integration_gate.py [-h] [--port PORT] [--context CONTEXT]\n                                  [--cli] [--compress] [--image IMAGE]\n                                  source output\nhermes_integration_gate.py: error: --context must satisfy Hermes Agent\u2019s 64000-token minimum and fit the pinned model limit\n"
    },
    {
      "case": "Hermes context 262145",
      "exit": 2,
      "output_directory_created": false,
      "stderr": "usage: hermes_integration_gate.py [-h] [--port PORT] [--context CONTEXT]\n                                  [--cli] [--compress] [--image IMAGE]\n                                  source output\nhermes_integration_gate.py: error: --context must satisfy Hermes Agent\u2019s 64000-token minimum and fit the pinned model limit\n"
    }
  ],
  "existing_actual_client_evidence": "identified prior32K/65K gateway/Hermes and external Swift consumer runs remain in context engineering records",
  "new_compilation_or_model_or_network_run": false,
  "runtime_changes": false
}

````

## context-client-tools-integration/after/Tools/consumer_smoke.sh

SHA-256 `04c94469a42792c54e0702f6244da78cc04ae0f4e913a3a5cdf102901373384d`; 4259 bytes.

````text
#!/bin/bash
# Can something outside this repository actually use it?
#
# Until the package declared products, the answer was no: SwiftPM refused at
# graph resolution with "product 'SlotstreamCore' ... not found in package
# 'slotstream'". Nothing inside the repo would ever have noticed, because the
# binary builds either way. This builds a throwaway package that depends on the
# checkout by path, imports both libraries, and runs.
set -euo pipefail
cd "$(dirname "$0")/.."
REPO=$PWD
WORK=$(mktemp -d)
trap 'rm -rf "$WORK"' EXIT
mkdir -p "$WORK/Sources/Consumer"

cat > "$WORK/Package.swift" <<SWIFT
// swift-tools-version: 6.0
import PackageDescription
let package = Package(
    name: "Consumer", platforms: [.macOS(.v14)],
    dependencies: [.package(name: "slotstream", path: "$REPO")],
    targets: [.executableTarget(name: "Consumer", dependencies: [
        .product(name: "Slotstream", package: "slotstream"),
        .product(name: "SlotstreamDiagnostics", package: "slotstream"),
    ], swiftSettings: [.swiftLanguageMode(.v5)])]
)
SWIFT

cat > "$WORK/Sources/Consumer/main.swift" <<'SWIFT'
import Foundation
import Slotstream
import SlotstreamDiagnostics

// Existing callers may forward nonescaping logs and hold the original API
// as function values. Compile these without starting any download.
func forwardInstance(_ store: WeightStore, log: WeightStore.Log) throws {
    try store.download(log: log)
}
func forwardStatic(_ directory: URL, log: WeightStore.Log) throws {
    try WeightStore.download(to: directory, log: log)
}
let oldDownload: (URL, Int?, [String]?, WeightStore.Log) throws -> Void = WeightStore.download
let oldOptions: ([String]?, Int?) -> PullOptions = PullOptions.init
let cancelled = PullCancellation()
cancelled.cancel()
let cancelledOptions = PullOptions(cancellation: cancelled)

// Preserve existing public function-value signatures and ordinary calls.
func legacyEngineMethods(_ engine: Engine) {
    let generate: ([Int], SampleParams, VisionPrompt?, (() -> Bool)?, ((Int, String) -> Bool)?) -> (text: String, ids: [Int], stats: GenStats) = engine.generate
    let images: ([[String: Any]], [[String: Any]]?, Bool) throws -> ([Int], VisionPrompt?) = engine.encodeWithVision
    let typedImages: ([ChatMessage], [ToolDefinition], Bool, String?) throws -> ([Int], VisionPrompt?) = engine.encodeChatWithVision
    let tower: () throws -> VisionTower = engine.ensureVisionTower
    _ = (generate, images, typedImages, tower)
}
let oldPlanner: (PlanRequest, Machine, Bool, Bool) throws -> MemoryPlan = Planner.plan
let loosePlanner: (Int?, Double?, Double?, Double?, Double?, Double?, Double?, Planner.MTPMode, Bool, Planner.VisionMode, Bool, Bool, Int, Bool) throws -> MemoryPlan = Planner.plan
let policy = try ContextConfiguration(maxContextTokens: 65536, maxPrefillWaitMinutes: 0)
precondition(policy.maxContextTokens == 65536)
let controller = RequestController(configuration: policy, slackBytes: 0, availableGB: { 100 })
try controller.check()

// Plan for a machine, without one byte of weights and without touching Metal.
let plan = try Planner.plan(PlanRequest(memoryGB: 16), on: Machine.simulated(ramGB: 32))
precondition(plan.slots > 0, "a 16 GB plan should size a pool")
precondition(plan.simulated, "a simulated machine must mark its plan")

// Ask about the weights without trying to load them.
let status = WeightStore.default.status()
precondition(status.bytesToFetch >= 0)

// Price a long prompt.
let wait = PrefillSchedule.estSeconds(tokens: 8000, maxChunk: plan.prefillChunk)
precondition(wait > 0)

// Run one of the library's own diagnostics.
let report = Diagnostics.prefillSchedule()
precondition(report.passed, "prefill-schedule should pass")

print("consumer ok: \(Int(plan.expertsPerLayerCached))/layer, "
    + "\(PrefillSchedule.describe(seconds: wait)) for 8k tokens, "
    + "\(PinnedModel.files.count) pinned files, diagnostics \(report.items.count) assertions")
SWIFT

cd "$WORK"
# Only a compiler diagnostic fails this ("path:line:col: error: ..."); SwiftPM's
# own cache chatter can contain the word too ("skipping cache due to an
# error: ...") and took a green build down once.
swift build -j 2 2>&1 | grep -E '(^|: )error: |warning: .*deprecated' && exit 1
.build/debug/Consumer

````

## context-client-tools-integration/after/Tools/hermes_integration_gate.py

SHA-256 `517c4b7fbdc5a24bedb7924cb57051ec65b58d44d0c0df40e7119ab44e54b0f6`; 12762 bytes.

````text
#!/usr/bin/env python3
"""Exercise an unmodified, separately installed Hermes checkout against loopback."""
import argparse, base64, ipaddress, json, os, shlex, sys, traceback
from pathlib import Path

p = argparse.ArgumentParser()
p.add_argument('source', type=Path)
p.add_argument('output', type=Path)
p.add_argument('--port', type=int, default=11434)
p.add_argument('--context', type=int, default=65536,
               help='Exact configured server window expected from discovery and CLI settings')
p.add_argument('--cli', action='store_true')
p.add_argument('--compress', action='store_true')
p.add_argument('--image', type=Path, help='JPEG fixture for real Hermes vision discovery and inference')
a = p.parse_args()
if not 64000 <= a.context <= 262144:
    p.error('--context must satisfy Hermes Agent’s 64000-token minimum and fit the pinned model limit')
source = a.source.resolve()
image_path = a.image.resolve() if a.image else None
out = a.output.resolve(); out.mkdir(parents=True, exist_ok=True)
fixture = out / 'fixture'; fixture.mkdir(exist_ok=True)
marker = 'HERMES_SLOTSTREAM_INTEGRATION_42'
(fixture / 'diagnostic.txt').write_text(marker + '\n')
os.chdir(fixture)
os.environ.update(HERMES_HOME=str(out / 'home'), OPENAI_API_KEY='local-test-placeholder',
    OPENAI_BASE_URL=f'http://127.0.0.1:{a.port}/v1', NO_PROXY='*',
    TERMINAL_CWD=str(fixture), TERMINAL_ENV='local')
sys.path.insert(0, str(source))
blocked = []
def audit(event, args):
    if event == 'socket.connect' and isinstance(args[1], tuple):
        host = args[1][0]
        try: allowed = ipaddress.ip_address(host).is_loopback
        except ValueError: allowed = host == 'localhost'
        if not allowed:
            blocked.append(str(args[1]))
            raise PermissionError('Hermes gate permits only loopback network connections')
sys.addaudithook(audit)
import yaml, httpx
home = Path(os.environ['HERMES_HOME']); home.mkdir(exist_ok=True)
cfg = {'model': {'default': 'qwen3.8-flash-next:4bit', 'provider': 'custom',
        'base_url': os.environ['OPENAI_BASE_URL'], 'max_tokens': 4096},
    'agent': {'max_iterations': 4, 'local_stream_stale_timeout': 1800}, 'compression': {'enabled': True},
    'auxiliary': {'compression': {'provider': 'main', 'extra_body': {'max_tokens': 4096, 'temperature': 0.2, 'presence_penalty': 0}}, 'title_generation': {'provider': 'main'}},
    'memory': {'memory_enabled': False, 'user_profile_enabled': False},
    'terminal': {'cwd': str(fixture), 'env_type': 'local'}, 'display': {'show_reasoning': False}}
# The agent gate checks discovery; the CLI gate checks the explicit guide setting.
if a.cli: cfg['model']['context_length'] = a.context
(home / 'config.yaml').write_text(yaml.safe_dump(cfg))
requests = []; executions = []; summary = {}; agent = None
send = httpx.Client.send
def capture(self, request, *args, **kwargs):
    record = {'method': request.method, 'url': str(request.url)}
    try: record['request'] = json.loads(request.content) if request.content else None
    except Exception: record['request'] = '<stream>'
    requests.append(record)
    response = send(self, request, *args, **kwargs)
    record['status'] = response.status_code
    if response.status_code >= 400: record['response'] = response.read().decode()
    elif response.is_stream_consumed:
        record['response'] = response.content.decode()
    else:
        original_stream = response.stream
        class CapturedStream(httpx.SyncByteStream):
            def __iter__(self):
                chunks = []
                try:
                    for chunk in original_stream:
                        chunks.append(chunk)
                        yield chunk
                finally:
                    record['response'] = b''.join(chunks).decode()
            def close(self): original_stream.close()
        response.stream = CapturedStream()
    return response
httpx.Client.send = capture
try:
    if a.cli:
        import model_tools
        def refuse_cli_tool(*args, **kwargs):
            raise RuntimeError('The CLI greeting gate permits no tool execution')
        model_tools.handle_function_call = refuse_cli_tool
        from hermes_cli.main import main
        sys.argv = ['hermes', 'chat', '--cli', '--oneshot', '--ignore-rules', '--provider', 'custom',
            '--model', cfg['model']['default'], '--toolsets', 'terminal', '--reasoning', 'none',
            '--max-turns', '2', '--run-budget', '300', '-Q', '-q', 'Reply with exactly OK. Do not call a tool.']
        try: summary['cli_return'] = main()
        except SystemExit as e: summary['cli_exit'] = e.code
        summary['passed'] = summary.get('cli_exit', summary.get('cli_return')) in (None, 0)
        answers = []
        for record in requests:
            if not (record.get('request') or {}).get('stream'): continue
            pieces = []
            for line in record.get('response', '').splitlines():
                if line.startswith('data: ') and line != 'data: [DONE]':
                    for choice in json.loads(line[6:]).get('choices', []):
                        pieces.append(choice.get('delta', {}).get('content') or '')
            answers.append(''.join(pieces))
        summary['cli_answers'] = answers
        assert summary['passed'] and any(text.strip() == 'OK' for text in answers), summary
    else:
        import model_tools
        original_tool = model_tools.handle_function_call
        def guarded_tool(function_name, function_args, *args, **kwargs):
            # The real Hermes dispatcher and terminal execute only this fixture read.
            command = function_args.get('command', '')
            allowed = function_name == 'terminal' and shlex.split(command) in (
                ['cat', 'diagnostic.txt'], ['cat', './diagnostic.txt'], ['cat', str(fixture / 'diagnostic.txt')])
            allowed = allowed and function_args.get('workdir', str(fixture)) == str(fixture)
            if not allowed: raise RuntimeError(f'Unexpected diagnostic tool call: {function_name} {function_args}')
            result = original_tool(function_name, function_args, *args, **kwargs)
            executions.append({'name': function_name, 'args': function_args, 'result': result})
            return result
        model_tools.handle_function_call = guarded_tool
        from run_agent import AIAgent
        agent = AIAgent(model=cfg['model']['default'], provider='custom', api_mode='chat_completions',
            base_url=os.environ['OPENAI_BASE_URL'], api_key='local-test-placeholder',
            max_iterations=4, max_tokens=4096, reasoning_config={'enabled': False, 'effort': 'none'},
            enabled_toolsets=['terminal'], quiet_mode=True, skip_context_files=True,
            skip_memory=True, skip_background_review=True, run_budget_seconds=300)
        summary.update(context_length=agent.context_compressor.context_length,
            compression_threshold=agent.context_compressor.threshold_tokens,
            ollama_num_ctx=agent._ollama_num_ctx)
        assert summary['context_length'] == a.context, summary
        assert 0 < summary['compression_threshold'] < a.context, summary
        result = agent.run_conversation(user_message='Use the terminal tool to run exactly `cat diagnostic.txt` in the current directory. Then reply with only the file contents. Do not infer or invent them.')
        summary['tool_turn'] = result
        assert executions and marker in executions[0]['result'], executions
        assert result.get('completed') and not result.get('failed'), result
        assert marker in result.get('final_response', ''), result
        result2 = agent.run_conversation(user_message='What exact code did you just read? Answer from our conversation without using any tool.',
            conversation_history=result['messages'])
        summary['followup'] = result2
        assert result2.get('completed') and marker in result2.get('final_response', ''), result2
        from agent.title_generator import generate_title
        summary['title'] = generate_title('Diagnose a local Hermes and Slotstream integration', timeout=120,
            main_runtime=agent._current_main_runtime())
        assert summary['title'], 'Title generation failed'
        if image_path:
            from agent.model_metadata import query_ollama_supports_vision
            summary['vision_discovered'] = query_ollama_supports_vision(
                cfg['model']['default'], os.environ['OPENAI_BASE_URL'], 'local-test-placeholder')
            assert summary['vision_discovered'] is True, 'Hermes did not discover vision support'
            image_url = 'data:image/jpeg;base64,' + base64.b64encode(image_path.read_bytes()).decode()
            vision = agent.run_conversation(user_message=[
                {'type': 'text', 'text': 'Name the animal in this image in one word. Do not call any tool.'},
                {'type': 'image_url', 'image_url': {'url': image_url}}], conversation_history=[])
            summary['image_turn'] = vision
            assert vision.get('completed') and 'dog' in vision.get('final_response', '').lower(), vision
        if a.compress:
            compressor = agent.context_compressor
            transcript = [{'role': 'system', 'content': 'Keep important facts and answer precisely.'},
                {'role': 'user', 'content': 'We are auditing a test fixture. Keep its diagnostic code.'},
                {'role': 'assistant', 'content': 'I will preserve the diagnostic evidence.'}]
            for i in range(18):
                transcript += [{'role': 'user', 'content': (f'Observation {i}: the diagnostic code is {marker}. Preserve this exact code. ' if i == 3 else f'Observation {i}: routine background. ') + 'Repeated nonessential background. ' * 70},
                    {'role': 'assistant', 'content': f'Recorded observation {i}. ' + 'The transient background is not important. ' * 70}]
            before = len(requests)
            compacted = compressor.compress(transcript, force=True, focus_topic='Preserve the exact diagnostic code.')
            summary['compression'] = {'before_messages': len(transcript), 'after_messages': len(compacted),
                'before_chars': len(json.dumps(transcript)), 'after_chars': len(json.dumps(compacted)),
                'http_requests': len(requests) - before, 'messages': compacted,
                'telemetry': getattr(compressor, '_last_compression_telemetry', None)}
            assert len(requests) > before, 'Compression did not exercise the local model'
            assert len(json.dumps(compacted)) < len(json.dumps(transcript)), 'Compression did not reduce the transcript'
            finishes = []
            for record in requests[before:]:
                for line in record.get('response', '').splitlines():
                    if line.startswith('data: ') and line != 'data: [DONE]':
                        for choice in json.loads(line[6:]).get('choices', []):
                            if choice.get('finish_reason'): finishes.append(choice['finish_reason'])
            summary['compression']['finish_reasons'] = finishes
            assert finishes and all(reason == 'stop' for reason in finishes), 'Summary did not finish normally'
            after = agent.run_conversation(user_message='What is the exact diagnostic code? Answer from the conversation without a tool.', conversation_history=compacted)
            summary['after_compression'] = after
            assert after.get('completed') and marker in after.get('final_response', ''), after
        summary['passed'] = True
except Exception as exc:
    summary.update(passed=False, error_type=type(exc).__name__, error=str(exc), traceback=traceback.format_exc())
    print(traceback.format_exc(), flush=True)
finally:
    if summary.get('passed'):
        main_requests = [r['request'] for r in requests if (r.get('request') or {}).get('stream')
            and (r.get('request') or {}).get('tools')]
        summary['main_output_budgets'] = [r.get('max_tokens') for r in main_requests]
        if not main_requests or any(r.get('max_tokens') != 4096 for r in main_requests):
            summary.update(passed=False, error='The documented main output budget was not used')
    if agent:
        try: agent.close()
        except Exception: pass
    summary.update(executions=executions, blocked_nonlocal_connections=blocked, expected_context=a.context)
    (out / 'result.json').write_text(json.dumps(summary, default=str, indent=2))
    (out / 'http.json').write_text(json.dumps(requests, default=str, indent=2))
    print(json.dumps({k: v for k, v in summary.items() if k not in ('tool_turn', 'followup', 'compression', 'after_compression', 'image_turn')}, default=str, indent=2), flush=True)
sys.exit(0 if summary.get('passed') else 1)

````

## context-client-tools-integration/after/Tools/gateway_client_gate.mjs

SHA-256 `7a5b605d18d6044fa4d038d169ace4b6541222a3d98977f2b773e204c34864dd`; 4849 bytes.

````text
#!/usr/bin/env node
// An unmodified published AI SDK gateway client against the local server.
// Install the pinned client dependencies in a separate fixture directory;
// this file neither loads credentials nor permits non-loopback fetches.
import assert from 'node:assert/strict';
import { createRequire } from 'node:module';
import { readFile, writeFile, mkdir } from 'node:fs/promises';
import { resolve } from 'node:path';

const [sdkRoot, output, portText = '11434', capText = '32768'] = process.argv.slice(2);
assert(sdkRoot && output, 'usage: gateway_client_gate.mjs SDK_ROOT OUTPUT [PORT] [CONTEXT]');
const port = Number(portText), context = Number(capText);
assert(Number.isInteger(port) && port > 0 && port <= 65535);
assert(Number.isInteger(context) && context >= 4096 && context <= 262144);
const require = createRequire(resolve(sdkRoot, 'package.json'));
const { createGateway } = require('@ai-sdk/gateway');
const { streamText, tool, jsonSchema, stepCountIs } = require('ai');
const out = resolve(output);
await mkdir(out, { recursive: true });
const marker = 'GATEWAY_SLOTSTREAM_INTEGRATION_42';
const fixture = resolve(out, 'diagnostic.txt');
await writeFile(fixture, marker + '\n');
const origin = `http://127.0.0.1:${port}`;
const requests = [], captures = [], executions = [];
const nativeFetch = globalThis.fetch;
async function localFetch(input, init) {
  const url = new URL(typeof input === 'string' || input instanceof URL ? input : input.url);
  assert.equal(url.origin, origin, 'the client gate permits only its loopback server');
  const row = { url: url.href, method: init?.method ?? 'GET', body: init?.body ? JSON.parse(init.body) : null };
  requests.push(row);
  const response = await nativeFetch(input, { ...init, redirect: 'error' });
  row.status = response.status;
  captures.push(response.clone().text().then(text => { row.response = text; }));
  return response;
}
const gateway = createGateway({ baseURL: `${origin}/v3/ai`, apiKey: 'local-test-placeholder', fetch: localFetch });
const modelID = 'slotstream/qwen3.8-flash-next:4bit';
const summary = { passed: false, expected_context: context, model: modelID, executions };
try {
  summary.dependencies = JSON.parse(await readFile(resolve(sdkRoot, 'package.json'), 'utf8')).dependencies;
  const response = await localFetch(`${origin}/coding-agent/v1/models`, { signal: AbortSignal.timeout(30000) });
  assert.equal(response.status, 200);
  const catalog = await response.json();
  const entry = catalog.data.find(row => row.id === modelID);
  assert.equal(entry?.context_window, context);
  assert(entry.max_tokens > 0 && entry.max_tokens < context);
  summary.catalog = entry;
  async function complete(options) {
    const events = [];
    const result = streamText({ model: gateway(modelID), maxRetries: 0, temperature: 0,
      maxOutputTokens: 128, abortSignal: AbortSignal.timeout(300000), ...options });
    for await (const event of result.fullStream) {
      if (event.type === 'error') throw event.error;
      events.push(event);
    }
    const delivered = { text: await result.text, finishReason: await result.finishReason,
      totalUsage: await result.totalUsage, events };
    assert.equal(delivered.finishReason, 'stop');
    assert(delivered.totalUsage.inputTokens > 0 && delivered.totalUsage.outputTokens > 0);
    return delivered;
  }
  summary.greeting = await complete({ prompt: 'Reply with exactly OK.' });
  assert.equal(summary.greeting.text.trim(), 'OK');
  summary.tool_turn = await complete({
    prompt: 'Call read_file once with path diagnostic.txt. Then reply only with its exact contents. Do not guess the contents.',
    tools: { read_file: tool({ description: 'Read the diagnostic fixture file.',
      inputSchema: jsonSchema({ type: 'object', properties: { path: { type: 'string' } }, required: ['path'], additionalProperties: false }),
      execute: async ({ path }) => {
        assert.equal(path, 'diagnostic.txt', 'only the declared fixture read is permitted');
        const contents = await readFile(fixture, 'utf8');
        executions.push({ path, contents });
        return contents;
      } }) },
    stopWhen: stepCountIs(3),
  });
  assert.equal(executions.length, 1);
  assert.equal(summary.tool_turn.text.trim(), marker);
  summary.passed = true;
} catch (error) {
  summary.error = { name: error.name, message: error.message, stack: error.stack };
} finally {
  await Promise.allSettled(captures);
  await writeFile(resolve(out, 'http.json'), JSON.stringify(requests, null, 2) + '\n');
  await writeFile(resolve(out, 'result.json'), JSON.stringify(summary, null, 2) + '\n');
  console.log(JSON.stringify({ passed: summary.passed, expected_context: context,
    requests: requests.length, executions: executions.length, error: summary.error?.message }));
  if (!summary.passed) process.exitCode = 1;
}

````
