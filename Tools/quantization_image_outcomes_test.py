import base64
import copy
import json
import unittest

import quantization_image_outcomes as m
from vision_serving import solid_image_base64


def response(value, reason='stop', calls=None):
    message = {'role': 'assistant', 'content': value}
    if calls is not None: message['tool_calls'] = calls
    return {'choices': [{'finish_reason': reason, 'message': message}]}


class Session:
    def __init__(self, responses):
        self.responses = iter(responses); self.requests = []
    def chat(self, messages):
        self.requests.append(copy.deepcopy(messages))
        value = next(self.responses)
        if isinstance(value, BaseException): raise value
        return value


class ImageOutcomeChecks(unittest.TestCase):
    def fixture(self):
        return m.make_case('red-image', base64.b64decode(solid_image_base64((255, 0, 0))),
            'image/png', [{'question': 'What color? Use red, green, or blue.', 'answer': 'red'},
                          {'question': 'How many colors fill the image? Use an integer.', 'answer': 1}])

    def test_embedded_image_bytes_and_typed_gold_are_bound(self):
        case = self.fixture()
        self.assertIs(m.validate(case), case)
        for edit in [lambda x:x.update(image_sha256='0'*64),
                     lambda x:x.update(image_base64=x['image_base64']+'!'),
                     lambda x:x.update(mime='image/jpeg'),
                     lambda x:x.update(image_base64='https://example.com/image.png'),
                     lambda x:x['turns'][1].update(answer=True),
                     lambda x:x['turns'][1].update(answer=1001),
                     lambda x:x['turns'][0].update(question=''),
                     lambda x:x.update(turns=x['turns']*3),
                     lambda x:x.update(id='../image'), lambda x:x.update(extra=True)]:
            changed=copy.deepcopy(case);edit(changed)
            with self.assertRaises(ValueError):m.validate(changed)

    def test_reference_inputs_are_copied_and_bounded_before_encoding(self):
        raw=base64.b64decode(self.fixture()['image_base64'])
        turns=[{'question':'What color?', 'answer':'red'}]
        case=m.make_case('copy',raw,'image/png',turns);turns[0]['answer']='blue'
        self.assertEqual(case['turns'][0]['answer'],'red')
        with self.assertRaises(ValueError):m.make_case('large',b'x'*(m.MAX_IMAGE_BYTES+1),'image/png',turns)

    def test_grade_requires_terminal_exact_json_and_answer_type(self):
        self.assertTrue(m.grade(response('{"answer":"red"}'),'red'))
        self.assertTrue(m.grade(response('{"answer":1}'),1))
        for text in ['red', '```json\n{"answer":"red"}\n```', '{"answer":"blue"}',
                     '{"answer":"red","extra":0}', '{"answer":"red","answer":"red"}']:
            self.assertFalse(m.grade(response(text),'red'))
        self.assertFalse(m.grade(response('{"answer":true}'),1))
        self.assertFalse(m.grade(response('{"answer":"1"}'),1))
        self.assertFalse(m.grade(response('{"answer":"red"}',reason='length'),'red'))
        self.assertFalse(m.grade(response('{"answer":"red"}',calls=[{'id':'a'}]),'red'))

    def test_every_actual_answer_and_image_remain_in_history(self):
        first=response('{"answer":"red"}');second=response('{"answer":1}')
        session=Session([first,second]);case=self.fixture()
        result=m.run_case(session,case)
        self.assertTrue(result['passed']);self.assertEqual(len(result['turns']),2)
        sent=session.requests[0][1]['content'][0]['image_url']['url']
        self.assertEqual(sent,'data:image/png;base64,'+case['image_base64'])
        self.assertEqual(session.requests[1][1],session.requests[0][1])
        self.assertEqual(session.requests[1][2],first['choices'][0]['message'])
        self.assertIsInstance(session.requests[1][-1]['content'],str)
        session=Session([response('{"answer":"blue"}'),second])
        result=m.run_case(session,case)
        self.assertFalse(result['passed']);self.assertTrue(result['turns'][1]['passed'])
        self.assertEqual(session.requests[1][2]['content'],'{"answer":"blue"}')

    def test_nonterminal_and_native_refusal_are_outcomes_but_crashes_are_not(self):
        session=Session([response('{"answer":"red"}',reason='length')])
        self.assertFalse(m.run_case(session,self.fixture())['passed']);self.assertEqual(len(session.requests),1)
        session=Session([m.TaskBudgetExceeded('frozen reply cannot fit')])
        self.assertEqual(m.run_case(session,self.fixture())['failed_turn'],0)
        with self.assertRaises(RuntimeError):m.run_case(Session([RuntimeError('native crash')]),self.fixture())


if __name__ == '__main__':
    unittest.main()
