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
