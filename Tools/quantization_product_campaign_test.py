import base64
import copy
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import quantization_product_campaign as m

NATIVE_PINS = m.native_pins


class ProductCampaignChecks(unittest.TestCase):
    def fixture(self, root, family='long_context'):
        root = Path(root)
        if family == 'image':
            raw = base64.b64decode('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==')
            cases = [m.images.make_case('image-'+str(i), raw, 'image/png',
                     [{'question':'Which color? Answer with a string.', 'answer':'red'},
                      {'question':'How many colors? Answer with an integer.', 'answer':1}]) for i in range(2)]
        else:
            cases = [m.long_context.make_case('product-fixture-'+str(i), 12, i) for i in range(2)]
        native = {'schema':1,'kind':'quantization-image-session-v1' if family == 'image' else 'quantization-tool-session-v2',
                  'scope':'instrument-check','memory_bytes':14_500_000_000 if family == 'image' else 14_000_000_000,
                  'context_limit':32768,'output_limit':512,'draft_depth':2,'prefix_cache':True,
                  'maximum_requests':4,'maximum_seconds':1800,'seed':7}
        paths = {'cases':'cases.json','native_protocol':'native.json','binary':'native/slotstream',
                 'metallib':'native/mlx.metallib','rotary':'angles.bin','control':'control','baseline':str(root/'parent')}
        blobs = {'cases.json':json.dumps(cases).encode(), 'native.json':json.dumps(native).encode(),
                 'native/slotstream':b'unexecuted binary fixture', 'native/mlx.metallib':b'Metal fixture',
                 'angles.bin':b'coefficient fixture', 'control/manifest.json':b'{}'}
        for name, raw in blobs.items():
            path=root/name; path.parent.mkdir(exist_ok=True,parents=True); path.write_bytes(raw)
        pins=NATIVE_PINS(family)
        pins['candidate']['control_manifest_sha256']=m.campaign.digest(root/'control/manifest.json')
        pins['candidate']['rotary_sha256']=m.campaign.digest(root/'angles.bin')
        # Only artifact bytes are miniature here. The production Session's
        # framing, watchdog and physical guards have their own executable
        # child-process tests; these checks exercise product orchestration.
        mocked=patch.object(m,'native_pins',return_value=pins); mocked.start(); self.addCleanup(mocked.stop)
        protocol={'schema':1,'kind':'quantization-product-outcomes-v1','family':family,'acceptance':m.ACCEPTANCE,
                  'driver_sha256':m.campaign.digest(m.__file__),'paths':paths,
                  'files':{name:m.campaign.digest(root/name) for name in blobs},
                  'native_protocol_sha256':m.campaign.digest(root/'native.json'),
                  'native_pins':pins,'helper_sha256':m.helper_pins(),'case_ids':[case['id'] for case in cases],
                  'resource':{'preflight_gb':20.5 if family=='image' else 17,'headroom_bytes':3_000_000_000,
                              'maximum_model_sessions':4,'maximum_parent_bytes':256_000_000,
                              'maximum_campaign_seconds':21_600,'maximum_output_bytes':32_000_000,
                              'maximum_research_staging_bytes':430_000_000_000,
                              'new_weight_bytes':0,'new_raw_logit_bytes':0,'paid_compute_usd':0}}
        return protocol,native,cases

    def protocol_file(self,root,protocol):
        path=Path(root)/'protocol.json';m.campaign.write(path,protocol)
        return path,m.campaign.digest(path)

    def fake(self,protocol,native,cases,mode=None):
        trace=[]
        class Session:
            active=0
            def __init__(self,command,output,native,protocol,arm,row,**kwargs):
                if Session.active: raise AssertionError('overlapping model sessions')
                self.index=int(Path(output).parent.name.split('-')[1]);self.arm=arm;self.row=row
                trace.append(('start',self.index,arm));self.count=0;self.resets=0;self.refusals=0;self.closed=False
                if mode=='startup':
                    row['startup_failure']='injected startup'; raise RuntimeError('injected startup')
                Session.active+=1
                self.identity={**protocol['native_pins'][arm],**native,'loaded':True,
                               'protocol_sha256':protocol['native_protocol_sha256'],'protocol_kind':native['kind'],
                               'vision':protocol['family']=='image',
                               'required_preflight_bytes':int(protocol['resource']['preflight_gb']*1e9),
                               'vision_query_tile':256,'vision_attention_padding':0,
                               'plan':{'target_gb':native['memory_bytes']/1e9,'max_context_tokens':32768,
                                       'availability_clamped':False,'vision':protocol['family']=='image',
                                       'decode_lookahead':False,'mtp':True,'mtp_streamed_experts':True,
                                       'runtime_prefix_cache_enabled':True,
                                       'memory_ledger':{'expected_peak_bytes':native['memory_bytes']-1}}}
                row['identity']=self.identity
            def reset(self):self.resets+=1
            def chat(self,messages,tools=None):
                turn=cases[self.index]['turns'][self.count];self.count+=1
                if mode=='crash':raise RuntimeError('injected transport failure')
                if mode=='refusal' and self.arm=='candidate':
                    self.refusals+=1;raise m.campaign.outcomes.TaskBudgetExceeded('native reservation refused')
                value=turn['answer'] if protocol['family']=='image' else turn['expected']
                value={'answer':value} if protocol['family']=='image' else value
                if mode=='wrong' and self.arm=='candidate' and self.count==1:value={'wrong':True}
                return {'choices':[{'finish_reason':'stop','message':{'role':'assistant','content':json.dumps(value)}}]}
            def finish(self):
                if mode=='finish':raise RuntimeError('injected finish failure')
                self.row['receipt']={**self.identity,'complete':True,'requests':self.count,
                                     'resets':self.resets,'admission_refusals':self.refusals}
                self.row['complete']=True
            def close(self):
                if self.closed:return
                self.closed=True;Session.active-=1;trace.append(('close',self.index,self.arm))
                if mode=='cleanup':
                    self.row['cleanup_failure']='injected cleanup';raise RuntimeError('injected cleanup')
        return Session,trace

    def run_all(self,root,protocol,native,cases,mode=None):
        path,sha=self.protocol_file(root,protocol);output=Path(root)/'run'
        session,trace=self.fake(protocol,native,cases,mode)
        with patch.object(m.campaign,'Session',session):
            for index in range(len(cases)):m.run_job(path,sha,root,output,index)
        self.assertEqual(session.active,0)
        return m.analyze(path,sha,root,output),trace,output

    def test_complete_long_conversations_run_serially_with_alternating_pair_order(self):
        with tempfile.TemporaryDirectory() as root:
            protocol,native,cases=self.fixture(root)
            result,trace,_=self.run_all(root,protocol,native,cases)
            self.assertTrue(result['passed']);self.assertFalse(result['qualification'])
            self.assertEqual(result['regressions'],[])
            self.assertEqual(trace,[('start',0,'original'),('close',0,'original'),('start',0,'candidate'),('close',0,'candidate'),
                                    ('start',1,'candidate'),('close',1,'candidate'),('start',1,'original'),('close',1,'original')])

    def test_complete_image_conversations_use_the_separate_vision_protocol(self):
        with tempfile.TemporaryDirectory() as root:
            protocol,native,cases=self.fixture(root,'image')
            result,_,_=self.run_all(root,protocol,native,cases)
            self.assertTrue(result['passed']);self.assertEqual(len(result['pairs']),2)
            protocol['resource']['preflight_gb']=17
            with self.assertRaisesRegex(ValueError,'resource envelope'):m.validate(protocol,root)

    def test_wrong_answers_and_verified_refusals_are_preserved_as_failed_product_outcomes(self):
        for mode in ['wrong','refusal']:
            with self.subTest(mode=mode),tempfile.TemporaryDirectory() as root:
                protocol,native,cases=self.fixture(root)
                result,_,_=self.run_all(root,protocol,native,cases,mode)
                self.assertFalse(result['passed']);self.assertTrue(result['complete'])
                self.assertEqual(result['regressions'],[case['id'] for case in cases])

    def test_execution_and_cleanup_failures_are_not_scored_or_retried(self):
        for mode in ['startup','crash','finish','cleanup']:
            with self.subTest(mode=mode),tempfile.TemporaryDirectory() as root:
                protocol,native,cases=self.fixture(root);path,sha=self.protocol_file(root,protocol)
                output=Path(root)/'run';session,trace=self.fake(protocol,native,cases,mode)
                with patch.object(m.campaign,'Session',session):
                    with self.assertRaisesRegex(RuntimeError,'injected'):m.run_job(path,sha,root,output,0)
                    with self.assertRaises(FileExistsError):m.run_job(path,sha,root,output,0)
                    with self.assertRaises(ValueError):m.run_job(path,sha,root,output,1)
                self.assertEqual(session.active,0)
                receipt=m.campaign.read(output/'job-0000/receipt.json')
                self.assertFalse(receipt['complete']);self.assertIn('failure',receipt)
                with self.assertRaises(ValueError):m.analyze(path,sha,root,output)
                self.assertEqual(sum(row[0]=='start' for row in trace),1)

    def test_modified_sources_helpers_settings_cases_and_unpriced_work_are_refused(self):
        with tempfile.TemporaryDirectory() as root:
            protocol,_,_=self.fixture(root)
            changes=[lambda x:x.update(driver_sha256='0'*64),lambda x:x['helper_sha256'].clear(),
                     lambda x:x['case_ids'].reverse(),lambda x:x['native_pins']['original'].clear(),
                     lambda x:x['resource'].update(new_weight_bytes=1),lambda x:x['resource'].update(paid_compute_usd=True),
                     lambda x:x['resource'].update(maximum_output_bytes=600_000_000),
                     lambda x:x['paths'].update(baseline='relative/model'),
                     lambda x:x['files'].update({'../escape':'a'*64})]
            for edit in changes:
                changed=copy.deepcopy(protocol);edit(changed)
                with self.assertRaises(ValueError):m.validate(changed,root)
            (Path(root)/'native/slotstream').write_bytes(b'changed')
            with self.assertRaisesRegex(ValueError,'input changed'):m.validate(protocol,root)

    def test_native_full_reply_context_draft_and_image_mode_cannot_drift(self):
        with tempfile.TemporaryDirectory() as root:
            protocol,native,_=self.fixture(root)
            for change in [{'draft_depth':0},{'prefix_cache':False},{'context_limit':8192},{'memory_bytes':15_000_000_000},
                           {'kind':'quantization-image-session-v1'},{'output_limit':4096},{'maximum_requests':32}]:
                changed=copy.deepcopy(protocol);m.campaign.write(Path(root)/'native.json',{**native,**change})
                sha=m.campaign.digest(Path(root)/'native.json')
                changed['files']['native.json']=sha;changed['native_protocol_sha256']=sha
                with self.assertRaisesRegex(ValueError,'native configuration'):m.validate(changed,root)

    def test_analysis_regrades_responses_and_rejects_missing_native_completion(self):
        with tempfile.TemporaryDirectory() as root:
            protocol,native,cases=self.fixture(root)
            _,_,output=self.run_all(root,protocol,native,cases)
            path=output/'job-0000/receipt.json';original=m.campaign.read(path)
            edits=[lambda x:x['outcomes'][0]['turns'][0]['response']['choices'][0]['message'].update(content='{}'),
                   lambda x:x['sessions'][0]['receipt'].update(complete=False),
                   lambda x:x['sessions'][0]['receipt'].update(resets=True),
                   lambda x:x['sessions'][0]['receipt'].update(requests=1),
                   lambda x:x['outcomes'][0]['turns'].pop(),lambda x:x['sessions'].reverse()]
            proto,sha=self.protocol_file(root,protocol)
            for edit in edits:
                changed=copy.deepcopy(original);edit(changed);m.campaign.write(path,changed)
                with self.assertRaises(ValueError):m.analyze(proto,sha,root,output)

    def test_spent_budget_is_carried_forward_and_cannot_start_another_arm(self):
        with tempfile.TemporaryDirectory() as root:
            protocol,native,cases=self.fixture(root);protocol['resource']['maximum_campaign_seconds']=10
            path,sha=self.protocol_file(root,protocol);output=Path(root)/'run'
            session,trace=self.fake(protocol,native,cases)
            with patch.object(m.campaign,'Session',session):m.run_job(path,sha,root,output,0)
            prior=output/'job-0000/receipt.json';value=m.campaign.read(prior);value['seconds']=11;m.campaign.write(prior,value)
            before=len(trace)
            with patch.object(m.campaign,'Session',session),self.assertRaises(TimeoutError):
                m.run_job(path,sha,root,output,1)
            self.assertEqual(len(trace),before);self.assertEqual(session.active,0)


if __name__=='__main__':
    unittest.main()
