import copy
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
from types import SimpleNamespace
import quantization_outcomes as q


class OutcomeTests(unittest.TestCase):
    def response(self, text, reason='stop', **message):
        return {'choices':[{'finish_reason':reason,'message':{'role':'assistant','content':text,**message}}]}

    def test_only_complete_plain_answers_are_scored(self):
        self.assertEqual(q.terminal(self.response('A')), 'A')
        for response in [self.response('A','length'),self.response('','tool_calls',tool_calls=[{}]),
                         self.response('A',tool_calls=[{}])]:
            self.assertIsNone(q.terminal(response))
            self.assertFalse(q.grade('facts',{'answer':'A'},response)['passed'])
        for response in [{}, {'choices':[]}, {'choices':[None]}, {'choices':[{}]},
                         {'choices':[{'finish_reason':'stop','message':{'role':'tool','content':'A'}}]},
                         self.response(None), {'choices':self.response('A')['choices']*2}]:
            with self.assertRaises(ValueError):q.terminal(response)

    def test_fact_grade_does_not_extract_a_favorable_letter(self):
        for text in ['A',' A\n']:
            self.assertTrue(q.grade('facts',{'answer':'A'},self.response(text))['passed'])
        for text in ['a','A or B','The answer is A.','B','(A)']:
            self.assertFalse(q.grade('facts',{'answer':'A'},self.response(text))['passed'])

    def test_numeric_grade_requires_one_unambiguous_final_line(self):
        for text,answer in [('Work.\n#### 1,234','1234'),('#### -0.50','-0.5'),('#### +5\n','5')]:
            self.assertTrue(q.exact_number(text,answer))
        for text in ['5','#### 5\n#### 5','#### 5 or 6','#### NaN','#### Infinity','#### 1,23','#### 5e0','#### 5 apples']:
            self.assertFalse(q.exact_number(text,'5'))
        for answer in ['NaN','Infinity','bad','9'*65]:
            with self.assertRaises(ValueError):q.exact_number('#### 5',answer)

    def test_schema_normalization_keeps_descriptions_and_exclusions(self):
        schema={'type':'dict','properties':{'a':{'type':'float','description':'type: int'},
                'b':{'type':'array','items':{'type':'int'}}},'required':['a']}
        original=copy.deepcopy(schema);out=q.normalize_schema(schema)
        self.assertEqual(schema,original);self.assertEqual(out['type'],'object')
        self.assertEqual(out['properties']['a'],{'type':'number','description':'type: int'})
        self.assertEqual(out['properties']['b']['items']['type'],'integer')
        with tempfile.TemporaryDirectory() as root:
            path=Path(root)/'data/multi_turn_func_doc';path.mkdir(parents=True)
            rows=[{'name':name,'description':'offline operation','parameters':schema} for name in ['add','omit']]
            (path/'math.json').write_text(''.join(json.dumps(x)+'\n' for x in rows))
            tools=q.tools_for({'involved_classes':['Math'],'excluded_function':['omit']},root,{'Math':'math'})
            self.assertEqual([x['function']['name'] for x in tools],['add'])
            (path/'math.json').write_text(json.dumps(rows[0])+'\n'+json.dumps(rows[0])+'\n')
            with self.assertRaises(ValueError):q.tools_for({'involved_classes':['Math']},root,{'Math':'math'})

    def test_execution_and_infrastructure_outcomes_remain_distinct(self):
        case={'function':'repair','tests':[{'arguments_python':['2'],'value_python':'3'}]}
        with patch('quantization_code_sandbox.grade',return_value={'passed':False,'reason':'wrong result'}) as grader:
            result=q.grade('coding',case,self.response('def repair(x): return x'))
            self.assertFalse(result['passed']);grader.assert_called_once_with('def repair(x): return x','repair',case['tests'])
        with patch('quantization_code_sandbox.grade',side_effect=RuntimeError('worker startup')):
            with self.assertRaises(RuntimeError):q.grade('coding',case,self.response('def repair(x): return x'))
        with patch('quantization_code_sandbox.runtime_executable',return_value=Path('/runtime')):
            for result in [{'exit_code':1,'stderr':b'bootstrap','stdout':b''},
                           {'exit_code':0,'stderr':b'','stdout':b'{"passed":1}'},
                           {'exit_code':0,'stderr':b'','stdout':b'{}'}]:
                with patch('quantization_code_sandbox._bounded_process',return_value=result),self.assertRaises((RuntimeError,ValueError)):
                    q.isolated_instruction({},self.response('text'),'/fixture','/packages')
        with self.assertRaises(ValueError):q.grade('unknown',{},self.response('text'))

    def test_instruction_boundary_preserves_complete_text_and_excludes_metadata(self):
        text='complete long answer '*8000
        response=self.response(text);response['usage']={'irrelevant':'large metadata'}
        with patch('quantization_code_sandbox.runtime_executable',return_value=Path('/runtime')),\
             patch('quantization_code_sandbox._bounded_process',return_value={'exit_code':0,'stdout':b'{"passed":true}','stderr':b''}) as worker:
            self.assertTrue(q.isolated_instruction({'grader':{}},response,'/fixture','/packages')['passed'])
            args,kwargs=worker.call_args;payload=json.loads(args[1])
            self.assertEqual(payload['text'],text);self.assertNotIn('response',payload)
            self.assertEqual(kwargs['maximum_payload'],q.INSTRUCTION_PAYLOAD_LIMIT)
            self.assertGreater(len(args[1]),64000)
            worker.reset_mock()
            self.assertFalse(q.isolated_instruction({},self.response('unfinished','length'),'/fixture','/packages')['passed'])
            worker.assert_not_called()

    def tool_fixture(self, root):
        source=Path(root);path=source/'data/multi_turn_func_doc';path.mkdir(parents=True)
        (path/'math.json').write_text(json.dumps({'name':'add','description':'Return the actual sum',
            'parameters':{'type':'dict','properties':{'a':{'type':'integer'},'b':{'type':'integer'}},'required':['a','b']}})+'\n')
        case={'entry':{'involved_classes':['Math'],'question':[[{'role':'user','content':'Add two and three.'}],
                      [{'role':'user','content':'Add four to that.'}]]},'gold':['fixture-gold']}
        return source,case,{'Math':'math'}

    def tool_response(self, call_id, a, b, name='add'):
        return self.response('', 'tool_calls', tool_calls=[{'id':call_id,'type':'function',
            'function':{'name':name,'arguments':json.dumps({'a':a,'b':b})}}])

    def test_complete_multi_turn_fixture_consumes_actual_results(self):
        with tempfile.TemporaryDirectory() as root:
            source,case,classes=self.tool_fixture(root);observed=[];graded=[]
            replies=[self.tool_response('one',2,3),self.response('5'),self.tool_response('two',5,4),self.response('9')]
            def chat(history, tools):
                observed.append(copy.deepcopy(history));return replies[len(observed)-1]
            def execute(payload):
                if payload['mode']=='grade':
                    graded.append(copy.deepcopy(payload));return {'result':{'valid':True}}
                result=[[str(sum(call['kwargs'].values())) for call in step] for step in payload['steps']]
                return {'result':{'results':result}}
            result=q.tool_case(SimpleNamespace(chat=chat),case,SimpleNamespace(run=execute),source,classes,q.ToolLimits(12,8,96))
            self.assertTrue(result['passed']);self.assertEqual(result['calls'],2)
            self.assertEqual(observed[1][-1],{'role':'tool','tool_call_id':'one','content':'5'})
            self.assertEqual(observed[3][-1],{'role':'tool','tool_call_id':'two','content':'9'})
            self.assertEqual(len(graded),1);self.assertEqual(len(graded[0]['turns']),2)
            self.assertEqual(graded[0]['gold'],case['gold'])

    def test_invalid_calls_and_budget_exhaustion_never_get_success_credit(self):
        for values in [(0,8,96),(13,8,96),(12,9,96),(12,8,97),(True,8,96)]:
            with self.assertRaises(ValueError):q.ToolLimits(*values)
        with tempfile.TemporaryDirectory() as root:
            source,case,classes=self.tool_fixture(root)
            wrong=self.tool_response('one',2,3,name='undeclared')
            duplicate=self.tool_response('one',2,3);duplicate['choices'][0]['message']['tool_calls']*=2
            for response in [wrong,duplicate,self.response('unfinished','length')]:
                bundle=SimpleNamespace(run=lambda _:self.fail('invalid call must not execute'))
                result=q.tool_case(SimpleNamespace(chat=lambda *args:response),case,bundle,source,classes,q.ToolLimits(12,8,96))
                self.assertFalse(result['passed'])
            bundle=SimpleNamespace(run=lambda _: {'result':{'results':[['5']]}})
            result=q.tool_case(SimpleNamespace(chat=lambda *args:self.tool_response('one',2,3)),case,bundle,source,classes,q.ToolLimits(1,8,96))
            self.assertFalse(result['passed']);self.assertIn('steps exceeded',result['reason'])
            def fail(_):raise RuntimeError('fixture bootstrap failed')
            with self.assertRaises(RuntimeError):
                q.tool_case(SimpleNamespace(chat=lambda *args:self.tool_response('one',2,3)),case,SimpleNamespace(run=fail),source,classes,q.ToolLimits(12,8,96))

    def test_context_admission_refusal_keeps_prior_tool_results_without_replay(self):
        with tempfile.TemporaryDirectory() as root:
            source,case,classes=self.tool_fixture(root);requests=[];executions=[]
            def chat(history, tools):
                requests.append(copy.deepcopy(history))
                if len(requests)==1:return self.tool_response('one',2,3)
                raise q.TaskBudgetExceeded('reply_reservation_exceeded')
            def execute(payload):
                executions.append(copy.deepcopy(payload));return {'result':{'results':[['5']]}}
            result=q.tool_case(SimpleNamespace(chat=chat),case,SimpleNamespace(run=execute),source,classes,q.ToolLimits(12,8,96))
            self.assertFalse(result['passed']);self.assertEqual(result['calls'],1)
            self.assertEqual(result['reason'],'reply_reservation_exceeded')
            self.assertEqual(len(executions),1)
            self.assertEqual(requests[1][-1],{'role':'tool','tool_call_id':'one','content':'5'})
            self.assertEqual(result['history'][-1],requests[1][-1])


if __name__=='__main__':unittest.main()
