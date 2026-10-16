"""Run the actual usage parser without importing its server-starting module."""
import ast
import copy
import json
from pathlib import Path
import unittest

source = Path(__file__).with_name('token_usage_proxy.py')
functions = [node for node in ast.parse(source.read_text()).body
             if isinstance(node, ast.FunctionDef) and node.name == 'usage_of']
assert len(functions) == 1
namespace = {'json': json}
exec(compile(ast.Module(body=functions, type_ignores=[]), str(source), 'exec'), namespace)
usage_of = namespace['usage_of']


def sse(*frames):
    return '\n\n'.join('data: ' + json.dumps(frame) for frame in frames) + '\n\ndata: [DONE]\n'


class ProtocolUsage(unittest.TestCase):
    def anthropic(self):
        return {'type': 'message', 'content': [],
                'usage': {'input_tokens': 4000, 'cache_read_input_tokens': 0, 'output_tokens': 12}}

    def tool(self):
        return {'type': 'tool_use', 'id': 'tool_fixture', 'name': 'record_metrics',
                'input': {'usage': {'input_tokens': 100, 'cache_read_input_tokens': 3900, 'output_tokens': 9}}}

    def test_supported_json_envelopes(self):
        cases = [
            (self.anthropic(), {'prompt': 4000, 'reused': 0, 'output': 12}),
            ({'object': 'chat.completion', 'usage': {'prompt_tokens': 4000, 'completion_tokens': 12,
                'prompt_tokens_details': {'cached_tokens': 200}}}, {'prompt': 4000, 'reused': 200, 'output': 12}),
            ({'object': 'response', 'usage': {'input_tokens': 4000, 'output_tokens': 12,
                'input_tokens_details': {'cached_tokens': 200}}}, {'prompt': 4000, 'reused': 200, 'output': 12}),
        ]
        for body, expected in cases:
            with self.subTest(body=body):
                self.assertEqual(usage_of(json.dumps(body)), expected)

    def test_anthropic_stream_merges_start_and_delta_usage(self):
        message = self.anthropic()
        message['usage']['output_tokens'] = 0
        stream = sse({'type': 'message_start', 'message': message},
                     {'type': 'message_delta', 'usage': {'output_tokens': 12}})
        self.assertEqual(usage_of(stream), {'prompt': 4000, 'reused': 0, 'output': 12})

    def test_chat_stream_ignores_null_usage_and_done_marker(self):
        stream = sse({'object': 'chat.completion.chunk', 'usage': None},
                     {'object': 'chat.completion.chunk', 'usage': {'prompt_tokens': 30, 'completion_tokens': 5}})
        self.assertEqual(usage_of(stream), {'prompt': 30, 'reused': 0, 'output': 5})

    def test_responses_stream_owned_envelopes(self):
        for event in ['response.completed', 'response.incomplete']:
            with self.subTest(event=event):
                body = {'type': event, 'response': {'object': 'response',
                    'usage': {'input_tokens': 40, 'output_tokens': 7, 'input_tokens_details': {'cached_tokens': 10}}}}
                self.assertEqual(usage_of(sse(body)), {'prompt': 40, 'reused': 10, 'output': 7})

    def test_tool_input_cannot_override_real_message_usage(self):
        message = self.anthropic()
        message['content'] = [self.tool()]
        self.assertEqual(usage_of(json.dumps(message)), {'prompt': 4000, 'reused': 0, 'output': 12})

    def test_domain_counts_cannot_turn_zero_reuse_into_gate_success(self):
        message = self.anthropic()
        message['content'] = [self.tool()]
        actual = usage_of(json.dumps(message))
        # coding_agents_gate.sh's first_reuse threshold, with its main-request filter.
        self.assertFalse(actual['prompt'] >= 1000 and actual['reused'] >= actual['prompt'] // 2)

    def test_domain_payload_cannot_fabricate_missing_usage(self):
        for body in [{'type': 'message', 'content': [self.tool()]},
                     {'object': 'response', 'output': [{'type': 'tool_result', 'result': self.tool()['input']}]},
                     [self.tool()['input']]]:
            with self.subTest(body=body):
                self.assertEqual(usage_of(json.dumps(body)), {})

    def test_responses_echoed_schema_defaults_are_not_token_usage(self):
        schema = {'type': 'function', 'name': 'record_metrics', 'parameters': {'type': 'object',
                  'properties': {'report': {'default': {'usage': {'input_tokens': 99, 'output_tokens': 9,
                                                               'input_tokens_details': {'cached_tokens': 90}}}}}}}
        for event in ['response.created', 'response.failed']:
            with self.subTest(event=event):
                self.assertEqual(usage_of(sse({'type': event, 'response': {'tools': [schema]}})), {})
        response = {'object': 'response', 'tools': [schema], 'usage': {'input_tokens': 40, 'output_tokens': 7}}
        self.assertEqual(usage_of(json.dumps(response)), {'prompt': 40, 'reused': 0, 'output': 7})
        self.assertEqual(usage_of(sse({'type': 'response.completed', 'response': response})),
                         {'prompt': 40, 'reused': 0, 'output': 7})

    def test_malformed_or_unowned_frames_do_not_add_counts(self):
        for body in ['not json', '{}', 'null', '[]', 'data: [DONE]',
                     json.dumps({'type': {}, 'message': self.anthropic()}),
                     json.dumps({'content': self.anthropic()})]:
            with self.subTest(body=body):
                self.assertEqual(usage_of(body), {})


if __name__ == '__main__':
    unittest.main()
