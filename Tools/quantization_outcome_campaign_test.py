import copy
import json
import os
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

import quantization_outcome_campaign as q


class CampaignTests(unittest.TestCase):
    def fixture(self, root):
        root = Path(root)
        native = {'schema':1, 'kind':'quantization-tool-session-v2', 'scope':'instrument-check',
            'memory_bytes':14_000_000_000, 'context_limit':32768, 'output_limit':4096,
            'draft_depth':2, 'prefix_cache':True, 'maximum_requests':256, 'maximum_seconds':1800, 'seed':7}
        tasks = {'tools':[{'id':'a'}, {'id':'b'}]}
        for name, value in [('native.json',native), ('tasks.json',tasks), ('bundle.json',{})]:
            q.write(root / name, value)
        (root / 'binary').write_text('fixture, never executed\n')
        protocol = {'schema':1, 'kind':'same-model-outcome-campaign-v1', 'scope':'instrument-check',
            'driver_sha256':q.digest(q.__file__),
            'analysis_method':'fixed-weight-paired-tango-mover-bonferroni-v1',
            'task_ids':{'tools':['a','b']}, 'sample_counts':{'tools':2}, 'pilot_exclusions':{'tools':['pilot']},
            'jobs':[{'index':0,'family':'tools','ids':['a'],'arms':['original','candidate']},
                    {'index':1,'family':'tools','ids':['b'],'arms':['candidate','original']}],
            'paths':{'tasks':'tasks.json','binary':'binary','native_protocol':'native.json','bfcl_manifest':'bundle.json'},
            'files':{name:q.digest(root / name) for name in ['native.json','tasks.json','binary','bundle.json']},
            'native_protocol_sha256':q.digest(root / 'native.json'),
            'native_pins':{'original':{'manifest_sha256':'a'*64}, 'candidate':{'control_manifest_sha256':'b'*64}},
            'resource':{'preflight_gb':17, 'headroom_bytes':3_000_000_000, 'maximum_parent_bytes':256_000_000,
                'maximum_model_sessions':4, 'maximum_campaign_seconds':7200,
                'new_weight_bytes':0, 'new_raw_logit_bytes':0, 'paid_compute_usd':0,
                'new_task_session_cutoff_seconds':600, 'maximum_output_bytes':500_000_000,
                'maximum_research_staging_bytes':430_000_000_000},
            'tool_limits':{'steps_per_turn':12,'calls_per_step':8,'calls_per_case':96},
            'family_weights':{'tools':1.}, 'family_margins':{'tools':.05}, 'overall_margin':.02, 'alpha':.05}
        return protocol, tasks, native

    def native_identity(self, protocol, native):
        return {'loaded':True, 'protocol_sha256':protocol['native_protocol_sha256'],
            **{key:native[key] for key in ['draft_depth','prefix_cache','output_limit','maximum_requests','maximum_seconds','scope','seed']},
            'protocol_kind':native['kind'], 'manifest_sha256':'a'*64,
            'plan':{'target_gb':14, 'max_context_tokens':32768, 'availability_clamped':False,
                'vision':False, 'decode_lookahead':False, 'mtp':True, 'mtp_streamed_experts':True,
                'runtime_prefix_cache_enabled':True}}

    def test_selection_rejects_contamination_omission_duplicates_and_arm_changes(self):
        with tempfile.TemporaryDirectory() as directory:
            protocol, tasks, _ = self.fixture(directory)
            q.validate_selection(tasks, protocol)
            for edit in [lambda p:p['pilot_exclusions']['tools'].append('a'),
                         lambda p:p['task_ids']['tools'].reverse(),
                         lambda p:p['jobs'].pop(),
                         lambda p:p['jobs'][1]['ids'].append('b'),
                         lambda p:p['jobs'][1]['arms'].reverse(),
                         lambda p:p.update(scope='held-out')]:
                altered = copy.deepcopy(protocol); edit(altered)
                with self.assertRaises(ValueError): q.validate_selection(tasks, altered)

    def test_every_frozen_input_and_analysis_setting_is_checked_before_launch(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory); protocol, tasks, native = self.fixture(root)
            self.assertEqual(q.validate_inputs(protocol, tasks, root), native)
            for edit in [lambda p:p['files'].pop('tasks.json'),
                         lambda p:p['family_weights'].update(tools=.5),
                         lambda p:p['tool_limits'].update(calls_per_case=97),
                         lambda p:p['resource'].update(maximum_campaign_seconds=259201),
                         lambda p:p['resource'].update(maximum_model_sessions=5),
                         lambda p:p['resource'].update(headroom_bytes=1)]:
                altered = copy.deepcopy(protocol); edit(altered)
                with self.assertRaises(ValueError): q.validate_inputs(altered, tasks, root)
            (root / 'binary').write_text('changed\n')
            with self.assertRaisesRegex(ValueError, 'frozen input changed'): q.validate_inputs(protocol,tasks,root)

    def test_native_identity_retains_artifact_plan_and_complete_features(self):
        with tempfile.TemporaryDirectory() as directory:
            protocol, _, native = self.fixture(directory); identity = self.native_identity(protocol,native)
            check = lambda value:q.validate_native(value,native,protocol['native_pins'],'original',protocol['native_protocol_sha256'])
            check(identity)
            for edit in [lambda p:p.update(manifest_sha256='b'*64), lambda p:p.update(output_limit=1024),
                         lambda p:p['plan'].update(target_gb=10), lambda p:p['plan'].update(availability_clamped=True),
                         lambda p:p['plan'].update(mtp_streamed_experts=False), lambda p:p['plan'].update(runtime_prefix_cache_enabled=False)]:
                altered = copy.deepcopy(identity); edit(altered)
                with self.assertRaises(ValueError):check(altered)

    def response(self, native, messages):
        return {'event':'response','id':'call-1','http_head':'HTTP/1.1 200 OK\r\nContent-Type: application/json',
            'request':{'messages':messages,'max_tokens':4096,'seed':7,'temperature':0,'stream':False,'think':False},
            'reserved_prompt_tokens':12, 'response':{'usage':{'prompt_tokens':12,'completion_tokens':1,'total_tokens':13},
                'choices':[{'finish_reason':'stop','message':{'role':'assistant','content':'5'}}]}}

    def test_only_a_bound_verified_context_refusal_becomes_a_task_outcome(self):
        with tempfile.TemporaryDirectory() as directory:
            _, _, native = self.fixture(directory); messages=[{'role':'user','content':'Test.'}]
            event=self.response(native,messages)
            self.assertEqual(q.verify_response(event,'call-1',messages,None,native),event['response'])
            for edit in [lambda e:e.update(id='another'), lambda e:e['request'].update(messages=[]),
                         lambda e:e['request'].update(max_tokens=128), lambda e:e['request'].update(think=True),
                         lambda e:e.update(reserved_prompt_tokens=13),
                         lambda e:e['response']['usage'].update(total_tokens=14)]:
                altered=copy.deepcopy(event);edit(altered)
                with self.assertRaises(ValueError):q.verify_response(altered,'call-1',messages,None,native)
            refusal={k:v for k,v in event.items() if k in ('id','request')}
            refusal.update(event='admission_refusal',code='reply_reservation_exceeded',context_limit=32768,output_limit=4096,prompt_tokens=28673)
            with self.assertRaises(q.outcomes.TaskBudgetExceeded):q.verify_response(refusal,'call-1',messages,None,native)
            for edit in [lambda e:e.update(prompt_tokens=28672),lambda e:e.update(context_limit=8192),
                         lambda e:e.update(code='worker_crash'),lambda e:e.update(response={})]:
                altered=copy.deepcopy(refusal);edit(altered)
                with self.assertRaises(ValueError):q.verify_response(altered,'call-1',messages,None,native)
            event['http_head']='HTTP/1.1 500 Error\r\n'
            with self.assertRaises(RuntimeError):q.verify_response(event,'call-1',messages,None,native)

    def test_complete_pairs_required_for_analysis_and_launched_jobs_are_never_replaced(self):
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory);protocol,tasks,_=self.fixture(root)
            path=root/'protocol.json';q.write(path,protocol);pin=q.digest(path);output=root/'runs';output.mkdir()
            with self.assertRaises(FileNotFoundError):q.analyze(path,pin,root,output)
            for job in protocol['jobs']:
                folder=output/f"job-{job['index']:04d}";folder.mkdir()
                value={'complete':True,'protocol_sha256':pin,'job':job,'seconds':1,'sessions':[{}],
                    'outcomes':[{'arm':arm,'id':job['ids'][0],'passed':True} for arm in job['arms']]}
                q.write(folder/'receipt.json',value)
            result=q.analyze(path,pin,root,output)
            self.assertEqual(len(result['paired_rows']),2);self.assertFalse(result['qualification'])
            with patch.object(q,'Session',side_effect=AssertionError('must not launch')):
                with self.assertRaises(FileExistsError):q.run_job(path,pin,root,output,0)
            record=q.read(output/'job-0000/receipt.json');record['complete']=False;q.write(output/'job-0000/receipt.json',record)
            with self.assertRaises(ValueError):q.analyze(path,pin,root,output)
            with patch.object(q,'Session',side_effect=AssertionError('must not launch')):
                with self.assertRaises(ValueError):q.run_job(path,pin,root,output,1)

    def test_unexpected_ready_identity_drains_the_owned_child(self):
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory);protocol,_,native=self.fixture(root)
            identity=self.native_identity(protocol,native);identity['manifest_sha256']='wrong'
            fixture=root/'child.py'
            fixture.write_text('import json,time\nprint('+repr(json.dumps({'event':'ready','identity':identity}))+',flush=True)\ntime.sleep(30)\n')
            row={}
            with patch.object(q,'quiet_preflight',return_value={}):
                with self.assertRaisesRegex(ValueError,'native artifact differs'):
                    q.Session([sys.executable,str(fixture)],root/'native',native,protocol,'original',row)
            with self.assertRaises(ProcessLookupError):os.kill(row['pid'],0)
            self.assertIn('after',row)

    def test_native_child_completion_and_premature_eof_are_distinct(self):
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory);protocol,_,native=self.fixture(root)
            identity=self.native_identity(protocol,native)
            fixture=root/'child.py'
            fixture.write_text('''import json,sys
identity=json.loads(sys.argv[1]);print(json.dumps({'event':'ready','identity':identity}),flush=True)
resets=0
for line in sys.stdin:
    value=json.loads(line)
    if value['op']=='reset':
        resets+=1;print(json.dumps({'event':'reset','id':value['id']}),flush=True)
    elif value['op']=='finish':
        if sys.argv[2]=='eof':break
        identity.update(complete=True,requests=0,resets=resets,admission_refusals=0)
        print(json.dumps({'event':'complete','receipt':identity}),flush=True);break
''')
            for mode in ('complete','eof'):
                row={}
                with patch.object(q,'quiet_preflight',return_value={}):
                    session=q.Session([sys.executable,str(fixture),json.dumps(identity),mode],root/mode,native,protocol,'original',row)
                try:
                    session.reset()
                    if mode=='eof':
                        with self.assertRaisesRegex(RuntimeError,'ended before'):session.finish()
                    else:
                        session.finish();self.assertTrue(row['complete'])
                finally:session.close()
                self.assertTrue(session.child.stdin.closed);self.assertTrue(session.child.stdout.closed)
                with self.assertRaises(ProcessLookupError):os.kill(row['pid'],0)

    def test_pressure_and_campaign_deadlines_abort_without_fabricating_an_outcome(self):
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory);protocol,_,native=self.fixture(root)
            identity=self.native_identity(protocol,native)
            fixture=root/'child.py'
            fixture.write_text('import time\nprint('+repr(json.dumps({'event':'ready','identity':identity}))+',flush=True)\ntime.sleep(30)\n')
            for mode in ('pressure','deadline'):
                row={}
                with patch.object(q,'quiet_preflight',return_value={}),patch.object(q,'vm_snapshot',return_value={'reclaimable_bytes':0 if mode=='pressure' else 50_000_000_000}):
                    session=q.Session([sys.executable,str(fixture)],root/mode,native,protocol,'original',row,
                        campaign_deadline=q.time.monotonic()+.1 if mode=='deadline' else None)
                    try:
                        with self.assertRaises(MemoryError if mode=='pressure' else TimeoutError):session.receive({'never'})
                    finally:session.close()
                self.assertNotIn('complete',row)
                with self.assertRaises(ProcessLookupError):os.kill(row['pid'],0)


if __name__=='__main__':unittest.main()
