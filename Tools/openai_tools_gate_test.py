"""Run the real typed-argument predicate on values, without importing the live gate."""
import ast
import json
from pathlib import Path
import unittest

SOURCE = Path(__file__).with_name('openai_tools_gate.py')


def typed_arguments_pass(arguments, *, name='read_file', stream=False):
    tree = ast.parse(SOURCE.read_text())
    main = next(node for node in tree.body if isinstance(node, ast.FunctionDef) and node.name == 'main')
    loop = next(node for node in main.body if isinstance(node, ast.For)
                and isinstance(node.target, ast.Name) and node.target.id == 'stream')
    start = next(index for index, node in enumerate(loop.body) if isinstance(node, ast.Assign)
                 and any(isinstance(target, ast.Name) and target.id == 'call' for target in node.targets))
    end = next(index for index, node in enumerate(loop.body) if isinstance(node, ast.Expr)
               and isinstance(node.value, ast.Call) and isinstance(node.value.func, ast.Name)
               and node.value.func.id == 'check' and isinstance(node.value.args[0], ast.BinOp)
               and isinstance(node.value.args[0].right, ast.Constant)
               and node.value.args[0].right.value == ' preserves function and typed arguments')
    observed = []
    # Only the selected source predicate is evaluated. No request/completion helper,
    # module-level import, CLI entry point, HTTP client or model is executed.
    scope = {'json': json, 'label': 'stream' if stream else 'nonstream',
             'calls': [{'function': {'name': name, 'arguments': json.dumps(arguments)}}],
             'check': lambda label, condition, detail=None: observed.append(condition)}
    exec(compile(ast.Module(body=loop.body[start:end + 1], type_ignores=[]), str(SOURCE), 'exec'), scope)
    if len(observed) != 1:
        raise RuntimeError('typed-argument predicate extraction changed')
    return observed[0]


class OpenAITypedArguments(unittest.TestCase):
    def test_integer_argument_is_accepted_in_both_call_paths(self):
        for stream in [False, True]:
            with self.subTest(stream=stream):
                self.assertTrue(typed_arguments_pass({'path': 'diagnostic.txt', 'start_line': 1}, stream=stream))

    def test_boolean_is_not_an_integer_argument(self):
        for stream in [False, True]:
            with self.subTest(stream=stream):
                self.assertFalse(typed_arguments_pass({'path': 'diagnostic.txt', 'start_line': True}, stream=stream))

    def test_other_wrong_values_still_fail(self):
        for value in [False, None, '1', 0, 2, 1.5]:
            with self.subTest(value=value):
                self.assertFalse(typed_arguments_pass({'path': 'diagnostic.txt', 'start_line': value}))
        for arguments in [{'path': 'other.txt', 'start_line': 1}, {'path': 'diagnostic.txt'},
                          {'path': 'diagnostic.txt', 'start_line': 1, 'extra': 'unexpected'}]:
            with self.subTest(arguments=arguments):
                self.assertFalse(typed_arguments_pass(arguments))
        self.assertFalse(typed_arguments_pass({'path': 'diagnostic.txt', 'start_line': 1}, name='other_tool'))

    def test_integral_number_compatibility_is_preserved(self):
        self.assertTrue(typed_arguments_pass({'path': 'diagnostic.txt', 'start_line': 1.0}))


if __name__ == '__main__':
    unittest.main()
