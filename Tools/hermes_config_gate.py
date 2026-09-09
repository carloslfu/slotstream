#!/usr/bin/env python3
"""Check the guide through real Hermes configuration/request code, with fake HTTP.

Run with Hermes's Python environment. This is a configuration regression gate;
hermes_integration_gate.py separately requires a real Slotstream model server.
"""
import argparse
import copy
import ipaddress
import json
import os
from pathlib import Path
import subprocess
import sys
import traceback


def child(source, home, case):
    sys.path.insert(0, str(source))
    requests = []
    phase = 'startup'
    agent = None

    def deny_network(event, args):
        if event == 'socket.connect':
            raise PermissionError('Configuration gate performs no real network requests')
    sys.addaudithook(deny_network)

    import httpx

    def send(client, request, *args, **kwargs):
        try:
            body = json.loads(request.content) if request.content else {}
        except (ValueError, TypeError):
            body = {}
        row = {'phase': phase, 'method': request.method, 'url': str(request.url),
               'parameters': {k: v for k, v in body.items() if k not in ('messages', 'tools')},
               'tools_count': len(body.get('tools') or []),
               'timeout': request.extensions.get('timeout')}
        requests.append(row)
        host = request.url.host
        local = host == 'localhost'
        try:
            local = local or ipaddress.ip_address(host).is_loopback
        except ValueError:
            pass
        chat = request.url.path.endswith('/chat/completions')
        if chat and not local:
            raise AssertionError('Inference escaped the configured local endpoint: ' + str(request.url))
        status, response = 200, {}
        if not local:
            status, response = 403, {'error': 'Nonlocal metadata is unavailable in this fixture'}
        elif request.url.path == '/api/version':
            response = {'version': '0.2.11'}
        elif request.url.path == '/api/tags':
            response = {'models': [{'name': 'qwen3.8-flash-next:4bit'}]}
        elif request.url.path == '/api/show':
            response = {'model_info': {'general.architecture': 'qwen38', 'qwen38.context_length': 65536},
                        'capabilities': ['completion', 'tools']}
        elif request.url.path == '/v1/models':
            response = {'data': [{'id': 'qwen3.8-flash-next:4bit', 'context_length': 65536}]}
        elif chat:
            if case in ('unavailable', 'unauthorized'):
                status = 503 if case == 'unavailable' else 401
                response = {'error': {'message': 'Local fixture unavailable', 'type': 'server_error'}}
            elif body.get('response_format', {}).get('type') not in (None, 'text'):
                status = 400
                response = {'error': {'message': 'response_format is not supported for constrained output',
                                      'type': 'invalid_request_error'}}
            elif body.get('stream'):
                row['status'] = 200
                bad_summary = phase == 'compression' and case in ('truncated_summary', 'empty_summary')
                content = '' if bad_summary and case == 'empty_summary' else 'OK'
                finish = 'length' if bad_summary and case == 'truncated_summary' else 'stop'
                chunks = [
                    {'id': 'fixture', 'choices': [{'index': 0, 'delta': {'content': content}, 'finish_reason': None}]},
                    {'id': 'fixture', 'choices': [{'index': 0, 'delta': {}, 'finish_reason': finish}]},
                    {'id': 'fixture', 'choices': [], 'usage': {'prompt_tokens': 100, 'completion_tokens': 1}},
                ]
                data = ''.join('data: ' + json.dumps(c) + '\n\n' for c in chunks) + 'data: [DONE]\n\n'
                return httpx.Response(200, request=request, text=data,
                                      headers={'content-type': 'text/event-stream'})
            else:
                response = {'id': 'fixture', 'object': 'chat.completion', 'model': body.get('model'),
                            'choices': [{'index': 0, 'message': {'role': 'assistant', 'content': 'Local test title'},
                                         'finish_reason': 'stop'}]}
        else:
            status, response = 404, {'error': 'Unknown fixture route'}
        row['status'] = status
        return httpx.Response(status, request=request, json=response)

    httpx.Client.send = send

    async def async_send(client, request, *args, **kwargs):
        return send(client, request, *args, **kwargs)
    httpx.AsyncClient.send = async_send
    result = {'case': case, 'passed': False}
    try:
        if case == 'sticky_profile_override':
            sys.argv = ['hermes', '--profile', 'default']
        import hermes_cli.main  # Includes profile and .env bootstrap.
        from cli import HermesCLI
        cli = HermesCLI(model='qwen3.8-flash-next:4bit', provider='slotstream',
                        toolsets=['terminal'], max_turns=2, run_budget=30,
                        ignore_rules=True, verbose=False)
        cli._single_query_mode = True
        if case in ('missing_provider', 'disabled_provider'):
            try:
                initialized = cli._init_agent()
            except Exception as exc:
                initialized = False
                result['refusal'] = str(exc)
            assert not initialized, 'Missing/disabled named provider unexpectedly initialized'
            assert not any('/chat/completions' in r['url'] for r in requests)
        else:
            assert cli._init_agent(), 'Could not initialize the documented named provider'
            agent = cli.agent
            result['runtime'] = {'base_url': agent.base_url, 'context': agent.context_compressor.context_length,
                                 'reasoning': agent.reasoning_config, 'overrides': agent.request_overrides}
            assert agent.base_url.rstrip('/') == 'http://localhost:11434/v1'
            assert agent.context_compressor.context_length == 65536
            phase = 'main'
            response = agent.run_conversation(user_message='Reply with exactly OK. Do not use tools.')
            failed_case = case in ('unavailable', 'unauthorized')
            if failed_case:
                assert response.get('failed') or not response.get('completed'), response
            else:
                assert response.get('completed') and response.get('final_response', '').strip() == 'OK', response
            phase = 'title'
            from agent.title_generator import generate_title
            title = generate_title('Check local integration', main_runtime=agent._current_main_runtime())
            assert (title is None) if failed_case else bool(title)
            phase = 'compression'
            from agent.auxiliary_client import call_llm
            if case in ('truncated_summary', 'empty_summary'):
                history = [{'role': 'user' if i % 2 == 0 else 'assistant',
                            'content': f'Observation {i}. ' + 'Preserve this evidence. ' * 100}
                           for i in range(30)]
                original = copy.deepcopy(history)
                compacted = agent.context_compressor.compress(history, force=True)
                assert compacted == original and history == original, 'Failed summary changed the history'
                assert agent.context_compressor._last_compress_aborted
                result['failed_summary_preserved_history'] = True
            else:
                try:
                    summary = call_llm(task='compression', main_runtime=agent._current_main_runtime(),
                                       messages=[{'role': 'user', 'content': 'Summarize the test.'}])
                except Exception:
                    if not failed_case:
                        raise
                else:
                    assert not failed_case and summary.choices[0].message.content
            # CLI initialization installs automatic title callbacks. Those requests
            # can overlap the main turn and have their own smaller output budget.
            main = [r for r in requests if r['tools_count'] and '/chat/completions' in r['url']]
            assert main
            for r in main:
                assert r['parameters']['max_tokens'] == (2048 if case == 'changed_limit' else 4096), r
                assert r['parameters']['reasoning_effort'] == ('medium' if case == 'reasoning_medium' else 'none'), r
            for r in requests:
                if '/chat/completions' not in r['url']:
                    continue
                assert r['url'] == 'http://localhost:11434/v1/chat/completions', r
                if not r['tools_count'] and r['phase'] in ('title', 'compression'):
                    assert r['parameters']['max_tokens'] == (64 if r['phase'] == 'title' else 4096), r
                    assert r['timeout']['read'] == 1800, r
            if not failed_case:
                titles = [r for r in requests if r['phase'] == 'title' and '/chat/completions' in r['url']]
                assert {r['status'] for r in titles} == {400, 200} and titles[-1]['status'] == 200, titles
        result['passed'] = True
    except Exception:
        result['error'] = traceback.format_exc()
    finally:
        if agent:
            agent.close()
        result['requests'] = requests
        (home / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
    return 0 if result['passed'] else 1


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('source', type=Path)
    p.add_argument('output', type=Path)
    p.add_argument('--child', choices=['clean', 'conflicting_custom', 'reasoning_medium', 'changed_limit',
                                      'missing_provider', 'disabled_provider', 'unavailable', 'unauthorized',
                                      'truncated_summary', 'empty_summary', 'sticky_profile_override'])
    args = p.parse_args()
    source, out = args.source.resolve(), args.output.resolve()
    if args.child:
        return child(source, out, args.child)
    import yaml
    guide = (Path(__file__).resolve().parents[1] / 'docs/HERMES.md').read_text()
    config = yaml.safe_load(guide.split('```yaml\n', 1)[1].split('```', 1)[0])
    rows = []
    for case in ['clean', 'conflicting_custom', 'reasoning_medium', 'changed_limit',
                 'missing_provider', 'disabled_provider', 'unavailable', 'unauthorized',
                 'truncated_summary', 'empty_summary', 'sticky_profile_override']:
        home = out / case
        home.mkdir(parents=True, exist_ok=False)
        cfg = copy.deepcopy(config)
        env = {'PATH': str(Path(sys.executable).parent) + ':/usr/bin:/bin:/usr/sbin:/sbin',
               'HOME': str(home), 'HERMES_HOME': str(home), 'LANG': 'en_US.UTF-8',
               'HERMES_SKIP_DEPENDENCY_CHECK': '1', 'NO_PROXY': '*'}
        if case in ('conflicting_custom', 'unavailable', 'unauthorized'):
            cfg['providers']['custom'] = {'base_url': 'https://openrouter.ai/api/v1', 'api_key': 'unused'}
            cfg['custom_providers'] = [{'name': 'custom', 'base_url': 'https://openrouter.ai/api/v1', 'api_key': 'unused'}]
            env['CUSTOM_BASE_URL'] = 'https://openrouter.ai/api/v1'
            (home / '.env').write_text('CUSTOM_BASE_URL=https://openrouter.ai/api/v1\n'
                                      'OPENAI_BASE_URL=https://openrouter.ai/api/v1\n'
                                      'OPENROUTER_API_KEY=unused\n')
        if case == 'reasoning_medium':
            cfg['agent']['reasoning_effort'] = 'medium'
        if case == 'changed_limit':
            cfg['providers']['slotstream']['extra_body']['max_tokens'] = 2048
        if case == 'missing_provider':
            del cfg['providers']['slotstream']
        if case == 'disabled_provider':
            cfg['providers']['slotstream']['enabled'] = False
        if case == 'sticky_profile_override':
            (home / 'active_profile').write_text('stale-profile\n')
            stale = home / 'profiles' / 'stale-profile'
            stale.mkdir(parents=True)
            (stale / 'config.yaml').write_text('model:\n  provider: openrouter\n')
        (home / 'config.yaml').write_text(yaml.safe_dump(cfg))
        completed = subprocess.run([sys.executable, str(Path(__file__).resolve()), str(source), str(home),
                                    '--child', case], cwd=home, env=env, capture_output=True, text=True, timeout=120)
        (home / 'stdout.txt').write_text(completed.stdout)
        (home / 'stderr.txt').write_text(completed.stderr)
        result = json.loads((home / 'result.json').read_text())
        rows.append({'case': case, 'passed': result['passed'], 'error': result.get('error')})
        print(json.dumps(rows[-1]), flush=True)
    (out / 'result.json').write_text(json.dumps({'passed': all(r['passed'] for r in rows), 'cases': rows}, indent=2) + '\n')
    return 0 if all(r['passed'] for r in rows) else 1


if __name__ == '__main__':
    raise SystemExit(main())
