"""Run the actual installed-release shell gate against local process fixtures.

The fake curl never opens a socket. Fault cases preserve plausible text while
breaking completion, exit status or retention, so text matches cannot certify
a failed installed generation. No model, compiler or real install is used.
"""
import argparse
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

SCRIPT = Path(__file__).with_name('e2e_release.sh')

FAKE_BINARY = r'''#!/usr/bin/env python3
import json,os,sys
if sys.argv[1:] == ['--version']:
    print('0.2.11')
    raise SystemExit(23 if os.environ.get('E2E_FAULT') == 'version-exit' else 0)
if sys.argv[1] == 'doctor' and '--sim-available' in sys.argv:
    print(json.dumps({'error':{'code':'insufficient_memory'}}))
    raise SystemExit(int(os.environ.get('E2E_DOCTOR_EXIT','2')))
print('fixture accepted')
'''

FAKE_CURL = r'''#!/usr/bin/env python3
import json,os,sys
from pathlib import Path
args=sys.argv[1:]
url=next(arg for arg in args if arg.startswith('http://'))
fault=os.environ.get('E2E_FAULT','')
root=Path(os.environ['E2E_FIXTURE_ROOT'])
def option(name):
    return args[args.index(name)+1] if name in args else None
raw=option('-d') or option('--data-binary') or '{}'
if raw.startswith('@'): raw=Path(raw[1:]).read_text()
status=200; exit_code=0
if '-I' in args:
    print('HTTP/1.1 200 OK\r\nContent-Length: 0\r\n\r\n',end='')
    raise SystemExit(0)
try: request=json.loads(raw)
except ValueError: request=None
if request is None:
    status=400; body={'error':'invalid JSON'}
elif url.endswith('/api/version'): body={'version':'0.2.11'}
elif url.endswith(('/api/tags','/api/ps','/v1/models')): body={'models':['qwen3.8-flash-next']}
elif url.endswith('/api/show'):
    hits=int((root/'hits').read_text()) if (root/'hits').exists() else 0
    body={'details':{'memory_plan':{'max_context_tokens':32768},'prefix_cache':{'hits':hits}}}
elif url.endswith('/v1/chat/completions'):
    body={'choices':[{'message':{'role':'assistant','content':'ARRAYOK'},'finish_reason':'stop'}],
          'usage':{'completion_tokens':4}}
    if fault=='openai-curl-exit': exit_code=23
    elif fault=='openai-http-error': status=503
    elif fault=='openai-error-finish': body['choices'][0]['finish_reason']='error'
    elif fault=='openai-null-finish': body['choices'][0]['finish_reason']=None
    elif fault=='openai-tool-finish': body['choices'][0]['finish_reason']='tool_calls'
    elif fault=='openai-error-field': body['error']={'message':'failed inference'}
    elif fault=='openai-zero-tokens': body['usage']['completion_tokens']=0
    elif fault=='openai-bool-tokens': body['usage']['completion_tokens']=True
    elif fault=='openai-missing-usage': del body['usage']
elif url.endswith('/api/chat'):
    messages=request.get('messages',[])
    if not messages: body={'done':True,'done_reason':'load'}
    else:
        prompt=messages[-1]['content']; options=request.get('options',{})
        text='OK'
        if 'HELLO' in prompt: text='HELLO'
        elif 'LONGOK' in prompt: text='LONGOK'
        elif '日本語' in prompt: text='🚀🔥⭐❤️🌳 café 日本語'
        elif prompt.startswith('Count:'): text='one two three four five'
        elif prompt.startswith('Count from'): text='1 2 3 '
        elif prompt.startswith('Name one planet'): text='Mars'
        elif prompt.startswith('Bigger than'):
            text='No'; (root/'hits').write_text('1')
        body={'message':{'role':'assistant','content':text},'done':True,'done_reason':'stop','eval_count':5}
        if prompt.startswith('x ') and len(prompt)>32768*2:
            status=400; body={'error':'over context','code':'context_length_exceeded'}
        elif fault=='prefix-error' and prompt.startswith('Bigger than'):
            body={'error':'inference failed','code':'inference_error'}
        elif fault=='sampling-error' and options.get('seed')==-1:
            body={'error':'inference failed','message':{}}
        elif fault=='concurrent-error' and prompt=='Say OK' and options=={'temperature':0,'num_predict':4}:
            body['error']='failed after sampling'
        elif fault=='short-curl-exit' and 'HELLO' in prompt: exit_code=23
        elif prompt.startswith('Count from'):
            if fault=='stop-error': body={'error':'inference failed','code':'inference_error'}
            elif fault=='stop-curl-exit': exit_code=23
            elif fault=='stop-zero-tokens': body['eval_count']=0
            elif fault=='stop-unfinished': body['done']=False
            elif fault=='stop-error-reason': body['done_reason']='error'
        elif prompt.startswith('Count:'):
            if request.get('stream'):
                delta={'message':body['message'],'done':False}
                terminal={**body,'message':{'role':'assistant','content':''}}
                frames=[delta,terminal]
                if fault=='stream-eof': frames=[delta]
                elif fault=='stream-error': frames=[delta,{'error':'inference failed'}]
                elif fault=='stream-duplicate-terminal': frames.append(terminal)
                elif fault=='stream-after-terminal': frames.append({'message':{'role':'assistant','content':''},'done':False})
                elif fault=='stream-empty-error': frames=[{'error':'inference failed'}]
                body='\n'.join(json.dumps(frame) for frame in frames)+'\n'
            elif fault=='stream-empty-error': body={'error':'inference failed'}
else: raise SystemExit('unhandled fixture URL')
if not isinstance(body,str): body=json.dumps(body,separators=(',',':'))
output=option('-o')
if output:
    Path(output).write_text(body)
else: print(body,end='')
if option('-w'): print(status,end='')
if status>=400 and any(arg in ('-f','--fail') or arg.startswith('-f') for arg in args): exit_code=22
raise SystemExit(exit_code)
'''


class InstalledReleaseGate(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-e2e-fixture-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        (self.root/'bin').mkdir()
        (self.root/'plain').mkdir()
        (self.root/"quoted's candidate").mkdir()
        self.binary = self.root/'plain/slotstream'
        self.quoted = self.root/"quoted's candidate/slotstream"
        for binary in [self.binary,self.quoted]:
            binary.write_text(FAKE_BINARY); binary.chmod(0o755)
            (binary.parent/'mlx.metallib').write_bytes(b'fixture metal\n')
        curl = self.root/'bin/curl'
        curl.write_text(FAKE_CURL); curl.chmod(0o755)
        # The old script had global /tmp filenames. Relocate those three paths
        # only in its test copy so regression demonstration cannot clobber an
        # unrelated run. The shell predicates and control flow are unchanged.
        script = SCRIPT.read_text()
        for name in ['ss_long.json','ss_big.json','ss_big_error.json']:
            script = script.replace('/tmp/'+name,str(self.root/name))
        self.script = self.root/'e2e_release.sh'
        self.script.write_text(script)

    def run_gate(self, fault='', binary=None, **extra):
        env = {k:v for k,v in os.environ.items() if k!='BIN' and not k.startswith(('SLOTSTREAM_','SS_DEBUG','E2E_'))}
        env.update(BIN=str(binary or self.binary), E2E_FAULT=fault,
                   E2E_FIXTURE_ROOT=str(self.root), PATH=str(self.root/'bin')+os.pathsep+os.environ['PATH'])
        env.update(extra)
        return subprocess.run(['bash',str(self.script),'12345'],env=env,
                              capture_output=True,text=True,timeout=20)

    def expect_fault(self, fault, predicate):
        result = self.run_gate(fault)
        self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
        self.assertNotEqual(result.returncode,0,result.stdout+result.stderr)

    def test_complete_responses_pass(self):
        result = self.run_gate()
        self.assertEqual(result.returncode,0,result.stdout+result.stderr)
        self.assertIn('failed 0',result.stdout)

    def test_quoted_installed_binary_path_passes(self):
        result = self.run_gate(binary=self.quoted)
        self.assertEqual(result.returncode,0,result.stdout+result.stderr)

    def test_missing_colocated_metallib_fails(self):
        (self.binary.parent/'mlx.metallib').unlink()
        result = self.run_gate()
        self.assertIn('FAIL  metallib shipped beside the binary',result.stdout)
        self.assertNotEqual(result.returncode,0)

    def test_failed_version_command_cannot_match_server(self):
        self.expect_fault('version-exit','installed binary reports a version')

    def test_doctor_refusal_still_requires_exit_two(self):
        result = self.run_gate(E2E_DOCTOR_EXIT='0')
        self.assertIn('FAIL  doctor refuses unavailable memory on a busy 16 GB Mac',result.stdout)
        self.assertIn('FAIL  doctor refuses unavailable memory on an 8 GB Mac',result.stdout)
        self.assertNotEqual(result.returncode,0)

    def test_identical_text_before_eof_is_not_stream_success(self):
        self.expect_fault('stream-eof','stream != nonstream')

    def test_identical_text_before_error_is_not_stream_success(self):
        self.expect_fault('stream-error','stream != nonstream')

    def test_repeated_terminal_is_not_stream_success(self):
        self.expect_fault('stream-duplicate-terminal','stream != nonstream')

    def test_frame_after_terminal_is_not_stream_success(self):
        self.expect_fault('stream-after-terminal','stream != nonstream')

    def test_matching_empty_failed_responses_are_not_parity(self):
        self.expect_fault('stream-empty-error','stream != nonstream')

    def test_failed_empty_response_does_not_honor_stop(self):
        self.expect_fault('stop-error','stop sequence ->')

    def test_valid_stop_text_with_failed_curl_does_not_pass(self):
        self.expect_fault('stop-curl-exit','stop sequence ->')

    def test_zero_generated_tokens_do_not_honor_stop(self):
        self.expect_fault('stop-zero-tokens','stop sequence ->')

    def test_incomplete_response_does_not_honor_stop(self):
        self.expect_fault('stop-unfinished','stop sequence ->')

    def test_error_finish_does_not_honor_stop(self):
        self.expect_fault('stop-error-reason','stop sequence ->')

    def test_matching_short_text_with_failed_curl_does_not_pass(self):
        self.expect_fault('short-curl-exit','short prompt ->')

    def test_retention_hit_with_failed_delivery_does_not_pass(self):
        self.expect_fault('prefix-error','no prefix reuse')

    def test_message_field_in_error_is_not_sampling_success(self):
        self.expect_fault('sampling-error','seed -1 (Ollama default) survives')

    def test_completed_counts_with_error_are_not_concurrency_success(self):
        self.expect_fault('concurrent-error','one or more concurrent generations failed')

    def test_openai_matching_content_with_failed_curl_is_not_success(self):
        self.expect_fault('openai-curl-exit','openai array ->')

    def test_openai_matching_content_with_http_error_is_not_success(self):
        self.expect_fault('openai-http-error','openai array ->')

    def test_openai_error_finish_is_not_success(self):
        self.expect_fault('openai-error-finish','openai array ->')

    def test_openai_null_finish_is_not_success(self):
        self.expect_fault('openai-null-finish','openai array ->')

    def test_openai_tool_proposal_is_not_the_requested_text_completion(self):
        self.expect_fault('openai-tool-finish','openai array ->')

    def test_openai_error_field_with_content_is_not_success(self):
        self.expect_fault('openai-error-field','openai array ->')

    def test_openai_zero_output_tokens_is_not_success(self):
        self.expect_fault('openai-zero-tokens','openai array ->')

    def test_openai_boolean_output_count_is_not_success(self):
        self.expect_fault('openai-bool-tokens','openai array ->')

    def test_openai_missing_usage_is_not_success(self):
        self.expect_fault('openai-missing-usage','openai array ->')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script',type=Path,default=SCRIPT)
    options,remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0],*remaining])
