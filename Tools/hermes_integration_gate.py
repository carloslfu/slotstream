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
