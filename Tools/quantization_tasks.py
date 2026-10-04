#!/usr/bin/env python3
"""Grade frozen completed-task transcripts without executing external actions.

Coding answers run only as bounded, restricted pure functions in a disposable
worker. This calibration scorer never assigns model qualification. Frozen
pilot cases remain disjoint from a future held-out protocol.
"""
import argparse
import ast
import copy
import hashlib
import json
import itertools
import math
import operator
from pathlib import Path
import re
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).absolute().parent))
from quantization_inventory import unique_json


def load(path, bound=32_000_000):
    with path.open('rb') as handle:
        raw = handle.read(bound + 1)
    if not raw or len(raw) > bound:
        raise ValueError('bounded nonempty task evidence required')
    return unique_json(raw), hashlib.sha256(raw).hexdigest()


def code_body(text):
    text = text.strip()
    if text.startswith('```'):
        match = re.fullmatch(r'```(?:python)?\s*\n(.*?)\n```', text, re.S)
        if not match:
            raise ValueError('coding answer must contain exactly one Python function')
        text = match.group(1)
    if not text or len(text.encode()) > 16_000:
        raise ValueError('coding answer exceeds its source bound')
    return text


def validate_code(text, name):
    tree = ast.parse(code_body(text))
    if len(tree.body) != 1 or not isinstance(tree.body[0], ast.FunctionDef) or tree.body[0].name != name:
        raise ValueError('expected exactly the requested function')
    functions = [n for n in ast.walk(tree) if isinstance(n, ast.FunctionDef)]
    if len(functions) != 1:
        raise ValueError('nested functions are outside the pure-function protocol')
    allowed = (ast.Module, ast.FunctionDef, ast.arguments, ast.arg, ast.Return,
               ast.Assign, ast.AugAssign, ast.Expr, ast.If, ast.For, ast.While,
               ast.Break, ast.Continue, ast.Pass, ast.IfExp, ast.Call, ast.keyword,
               ast.Name, ast.Load, ast.Store, ast.Constant, ast.List, ast.Tuple,
               ast.Dict, ast.Set, ast.Subscript, ast.Slice, ast.Attribute,
               ast.ListComp, ast.SetComp, ast.DictComp, ast.GeneratorExp, ast.comprehension,
               ast.BinOp, ast.UnaryOp, ast.BoolOp, ast.Compare,
               ast.Add, ast.Sub, ast.Mult, ast.Div, ast.FloorDiv, ast.Mod,
               ast.UAdd, ast.USub, ast.Not, ast.And, ast.Or,
               ast.Eq, ast.NotEq, ast.Lt, ast.LtE, ast.Gt, ast.GtE, ast.In, ast.NotIn, ast.Is, ast.IsNot)
    methods = {'append', 'extend', 'add', 'get', 'items', 'values', 'keys',
               'pop', 'sort', 'reverse', 'copy', 'remove', 'count', 'index', 'setdefault'}
    nodes = list(ast.walk(tree))
    called_attributes = {id(node.func) for node in nodes if isinstance(node, ast.Call) and isinstance(node.func, ast.Attribute)}
    if len(nodes) > 4096:
        raise ValueError('coding syntax exceeds its node bound')
    for node in nodes:
        if not isinstance(node, allowed):
            raise ValueError('unsupported pure-function syntax: ' + type(node).__name__)
        if isinstance(node, ast.Attribute) and node.attr not in methods:
            raise ValueError('attribute outside the collection-method allowlist')
        if isinstance(node, ast.Attribute) and id(node) not in called_attributes:
            raise ValueError('collection methods must be called directly')
        if isinstance(node, ast.Name) and node.id.startswith(('__', '_bounded_')):
            raise ValueError('introspection names are forbidden')
        if isinstance(node, ast.Constant):
            if isinstance(node.value, (int, float)) and abs(node.value) > 1_000_000:
                raise ValueError('numeric literal exceeds its bound')
            if isinstance(node.value, (str, bytes)) and len(node.value) > 4096:
                raise ValueError('literal exceeds its bound')
        if isinstance(node, ast.FunctionDef) and (node.decorator_list or node.returns):
            raise ValueError('decorators and annotations are outside the protocol')
        if isinstance(node, ast.arg) and node.annotation:
            raise ValueError('annotations are outside the protocol')
        if isinstance(node, ast.comprehension) and node.is_async:
            raise ValueError('asynchronous code is forbidden')
    return tree


def worker(payload):
    import resource
    resource.setrlimit(resource.RLIMIT_CPU, (2, 3))
    # Darwin refuses RLIMIT_AS/RLIMIT_DATA below its shared VM mapping. Bound
    # actual allocation-producing operations instead, observe resident peaks,
    # and retain the parent's wall deadline. Linux also gets an address limit.
    if sys.platform != 'darwin':
        resource.setrlimit(resource.RLIMIT_AS, (512_000_000, 512_000_000))
    resource.setrlimit(resource.RLIMIT_FSIZE, (1024, 1024))
    resource.setrlimit(resource.RLIMIT_NOFILE, (32, 32))
    tree = validate_code(payload['text'], payload['function'])
    budget = 50_000

    def trace(frame, event, arg):
        nonlocal budget
        budget -= 1
        if budget < 0:
            raise RuntimeError('pure-function execution budget exhausted')
        if budget % 64 == 0:
            peak = resource.getrusage(resource.RUSAGE_SELF).ru_maxrss * (1 if sys.platform == 'darwin' else 1024)
            # Stop below the declared worker ceiling, leaving room for the
            # bounded current operation and error/JSON reporting.
            if peak > 128_000_000:
                raise MemoryError('pure-function resident-memory budget exhausted')
        return trace

    def bounded_range(*args):
        value = range(*args)
        if len(value) > 4096:
            raise ValueError('range exceeds its bound')
        return value

    def bounded_items(value):
        values = list(itertools.islice(iter(value), 4097))
        if len(values) > 4096:
            raise ValueError('collection exceeds its bound')
        return values

    def checked(value):
        if isinstance(value, (str, bytes, list, tuple, dict, set)) and len(value) > 4096:
            raise ValueError('collection exceeds its bound')
        if isinstance(value, int) and value.bit_length() > 128:
            raise ValueError('integer exceeds its bound')
        if isinstance(value, float) and not math.isfinite(value):
            raise ValueError('nonfinite arithmetic')
        return value

    operations = {'Add': operator.add, 'Sub': operator.sub, 'Mult': operator.mul,
                  'Div': operator.truediv, 'FloorDiv': operator.floordiv, 'Mod': operator.mod}

    def binary(kind, left, right):
        checked(left); checked(right)
        if kind == 'Add' and isinstance(left, (str, bytes, list, tuple)):
            if type(left) is not type(right) or len(left) + len(right) > 4096:
                raise ValueError('concatenation exceeds its bound')
        elif type(left) not in (int, float, bool) or type(right) not in (int, float, bool):
            raise ValueError('only bounded numeric arithmetic or concatenation is allowed')
        return checked(operations[kind](left, right))

    def method(value, name, *args, **kwargs):
        checked(value)
        if type(value) not in (list, tuple, dict, set, str):
            raise ValueError('method receiver is not a builtin collection')
        if name in ('append', 'add', 'setdefault') and len(value) >= 4096:
            raise ValueError('collection growth exceeds its bound')
        if name == 'extend':
            if len(args) != 1 or kwargs:
                raise ValueError('invalid extend arguments')
            args = (bounded_items(args[0]),)
            if len(value) + len(args[0]) > 4096:
                raise ValueError('collection growth exceeds its bound')
        return checked(getattr(value, name)(*args, **kwargs))

    def augmented(kind, left, right):
        result = binary(kind, left, right)
        if kind == 'Add' and isinstance(left, list):
            left[:] = result
            return left
        return result

    class BoundedOperations(ast.NodeTransformer):
        def visit_BinOp(self, node):
            self.generic_visit(node)
            return ast.copy_location(ast.Call(ast.Name('_bounded_binary', ast.Load()),
                [ast.Constant(type(node.op).__name__), node.left, node.right], []), node)

        def visit_AugAssign(self, node):
            # Keep single evaluation of subscription targets by refusing that
            # uncommon form; ordinary assignment supports the same fixes.
            if not isinstance(node.target, ast.Name):
                raise ValueError('augmented subscription is outside the bounded protocol')
            value = ast.Call(ast.Name('_bounded_augmented', ast.Load()),
                [ast.Constant(type(node.op).__name__), ast.Name(node.target.id, ast.Load()), self.visit(node.value)], [])
            return ast.copy_location(ast.Assign([node.target], value), node)

        def visit_Call(self, node):
            self.generic_visit(node)
            if isinstance(node.func, ast.Attribute):
                return ast.copy_location(ast.Call(ast.Name('_bounded_method', ast.Load()),
                    [node.func.value, ast.Constant(node.func.attr)] + node.args, node.keywords), node)
            return node

    tree = ast.fix_missing_locations(BoundedOperations().visit(tree))
    safe = {'range': bounded_range, 'len': len, 'min': min, 'max': max,
            'sum': lambda values, start=0: checked(sum(bounded_items(values), start)),
            'sorted': lambda values, **kw: sorted(bounded_items(values), **kw),
            'list': lambda values=(): bounded_items(values), 'tuple': lambda values=(): tuple(bounded_items(values)),
            'dict': lambda values=(): dict(bounded_items(values.items() if isinstance(values, dict) else values)),
            'set': lambda values=(): set(bounded_items(values)), 'enumerate': enumerate, 'zip': zip,
            'abs': abs, 'all': all, 'any': any, 'reversed': reversed}
    namespace = {'__builtins__': safe, '_bounded_binary': binary, '_bounded_method': method,
                 '_bounded_augmented': augmented}
    tests = payload['tests']
    if not isinstance(tests, list) or not 1 <= len(tests) <= 64:
        raise ValueError('bounded test cases required')
    sys.settrace(trace)
    try:
        exec(compile(tree, '<bounded-quality-function>', 'exec'), namespace)
        observations = []
        for test in tests:
            args = copy.deepcopy(test['args'])
            before = copy.deepcopy(args)
            result = namespace[payload['function']](*args)
            passed = result == test['value'] and args == before
            observations.append({'passed': passed, 'input_unchanged': args == before})
        return {'passed': all(x['passed'] for x in observations), 'tests': observations}
    finally:
        sys.settrace(None)


def grade_python(text, rubric):
    # Validation happens in both processes; the worker receives no credentials,
    # paths, imports, command strings or general-purpose interpreter builtins.
    validate_code(text, rubric['function'])
    payload = json.dumps({'text': text, 'function': rubric['function'], 'tests': rubric['tests']})
    if len(payload.encode()) > 64_000:
        raise ValueError('coding grader payload exceeds its bound')
    result = subprocess.run([sys.executable, '-I', str(Path(__file__).absolute()), '--worker'],
        input=payload, text=True, capture_output=True, timeout=4,
        env={'PATH': '/usr/bin:/bin'}, cwd='/')
    if result.returncode:
        return {'passed': False, 'reason': 'bounded coding worker failed', 'exit_code': result.returncode}
    return unique_json(result.stdout.encode())


def tool_result(name, arguments):
    if name == 'sum_numbers':
        if set(arguments) != {'numbers'} or not isinstance(arguments['numbers'], list):
            raise ValueError('invalid sum tool schema')
        if len(arguments['numbers']) > 1024 or any(type(n) is not int for n in arguments['numbers']):
            raise ValueError('invalid bounded integer list')
        return sum(arguments['numbers'])
    if name == 'lookup_record':
        if arguments != {'id': 'café-42'}:
            raise ValueError('unknown local fixture record')
        return {'id': 'café-42', 'stock': 17}
    if name == 'filter_records':
        if set(arguments) != {'min_score', 'active_only'} or type(arguments['min_score']) is not int or type(arguments['active_only']) is not bool:
            raise ValueError('invalid filter tool schema')
        records = [('r1', 9, True), ('r2', 15, True), ('r3', 20, False), ('r4', 23, True)]
        return [id for id, score, active in records if score >= arguments['min_score'] and (active or not arguments['active_only'])]
    raise ValueError('tool has no permitted local fixture')


def grade_case(case, output):
    rubric = case['grade']
    if output.get('reason') != 'stop':
        return {'passed': False, 'reason': 'answer did not reach a terminal stop'}
    if output.get('malformed_tool_call'):
        return {'passed': False, 'reason': 'malformed tool call'}
    kind = rubric['kind']
    text = output['text'].strip()
    try:
        if kind == 'tool':
            calls = output.get('tool_calls')
            if not isinstance(calls, list) or len(calls) != 1 or calls[0]['name'] != rubric['name']:
                return {'passed': False, 'reason': 'expected one declared tool call'}
            arguments = unique_json(calls[0]['arguments_json'].encode())
            if json.dumps(arguments, sort_keys=True) != json.dumps(rubric['arguments'], sort_keys=True):
                return {'passed': False, 'reason': 'tool arguments differ from the task'}
            result = tool_result(calls[0]['name'], arguments)
            return {'passed': result == rubric['result'], 'executed_fixture_result': result}
        if output.get('tool_calls'):
            return {'passed': False, 'reason': 'unexpected tool call'}
        if kind == 'text':
            return {'passed': text == rubric['value']}
        if kind == 'json':
            result = unique_json(text.encode())
            return {'passed': json.dumps(result, sort_keys=True) == json.dumps(rubric['value'], sort_keys=True)}
        if kind == 'python':
            return grade_python(text, rubric)
        raise ValueError('unknown grader')
    except (ValueError, SyntaxError, TypeError, KeyError, subprocess.TimeoutExpired) as error:
        return {'passed': False, 'reason': type(error).__name__ + ': ' + str(error)}


def grade(protocol_path, receipts, output):
    protocol, protocol_sha = load(protocol_path, 8_000_000)
    if protocol.get('scope') != 'pilot' or protocol.get('prepared') is not True:
        raise ValueError('this calibration scorer only accepts prepared pilot protocols')
    cases = protocol['cases']
    by_id = {c['id']: c for c in cases}
    if len(by_id) != len(cases) or not cases:
        raise ValueError('duplicate or empty protocol')
    arms = []
    for path in receipts:
        receipt, receipt_sha = load(path)
        if (not receipt.get('complete') or receipt.get('protocol_sha256') != protocol_sha or receipt.get('scope') != 'pilot'
                or receipt.get('context_limit') != protocol['context_limit']
                or receipt.get('output_limit') != protocol['output_limit']
                or receipt.get('sampling') != protocol['sampling']
                or not 0 < receipt.get('peak_process_bytes', 0) <= protocol['memory_bytes']):
            raise ValueError('missing or mismatched complete task evidence')
        if protocol.get('engine_plan') is True:
            identity = receipt.get('identity', {})
            plan = identity.get('plan', {})
            ledger = plan.get('memory_ledger', {})
            depth = protocol.get('draft_depth')
            streamed = protocol.get('draft_experts') == 'streamed'
            allocation = protocol.get('affine_allocation', 'batched')
            affine = 'control_manifest_sha256' in identity
            grouped = affine and allocation == 'grouped'
            piecewise = affine and allocation in ('piecewise', 'grouped')
            resource = ('affine3-grouped-memory-v1' if grouped else
                        'affine3-piecewise-memory-v1' if piecewise else
                        'affine3-reference-memory-v3') if affine else 'original-affine4-memory-v1'
            if (type(depth) is not int or not 0 <= depth <= 4
                    or protocol.get('draft_experts') not in ('resident', 'streamed')
                    or (streamed and depth == 0)
                    or identity.get('engine_plan') is not True
                    or identity.get('streamed_draft') is not streamed
                    or allocation not in ('batched', 'piecewise', 'grouped')
                    or identity.get('piecewise_allocation', False) is not piecewise
                    or identity.get('grouped_experts', False) is not grouped
                    or plan.get('resource_profile') != resource
                    or ledger.get('resource_identity') != resource
                    or receipt.get('draft_depth') != depth
                    or receipt.get('process_bound_bytes') != protocol['memory_bytes']
                    or plan.get('target_gb') != protocol['memory_bytes'] / 1e9
                    or plan.get('source') != '--memory-gb'
                    or plan.get('mtp') is not (depth > 0)
                    or plan.get('mtp_streamed_experts') is not (depth > 0 and streamed)
                    or plan.get('max_context_tokens') != protocol['context_limit']
                    or plan.get('decode_lookahead') is not False
                    or plan.get('vision') is not False
                    or plan.get('prefix_cache_max_tokens') != 0
                    or not 0 < ledger.get('expected_peak_bytes', 0) <= protocol['memory_bytes']):
                raise ValueError('actual Engine plan differs from the frozen comparison budget or features')
        observed = receipt.get('cases', [])
        if [r['id'] for r in observed] != [c['id'] for c in cases]:
            raise ValueError('task coverage or order differs from the frozen protocol')
        scores = []
        for row in observed:
            case = by_id[row['id']]
            if row['prompt_tokens'] != case['tokens'] or row['family'] != case['family']:
                raise ValueError('task token context changed between arms')
            tokens = row.get('output_tokens')
            if (not isinstance(tokens, list) or len(tokens) > protocol['output_limit']
                    or any(type(token) is not int or not 0 <= token < 248320 for token in tokens)):
                raise ValueError('task output tokens exceed the frozen protocol')
            scores.append({'id': row['id'], 'family': row['family'], **grade_case(case, row)})
        arms.append({'receipt_sha256': receipt_sha, 'identity': receipt['identity'], 'scores': scores,
                     'passed': sum(s['passed'] for s in scores), 'total': len(scores)})
    result = {'schema': 1, 'scope': 'pilot', 'qualification': False, 'protocol_sha256': protocol_sha,
              'grader_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(), 'arms': arms}
    with output.open('x') as handle:
        handle.write(json.dumps(result, indent=2, ensure_ascii=False) + '\n')
    return result


def main():
    if sys.argv[1:] == ['--worker']:
        try:
            raw = sys.stdin.buffer.read(64_001)
            if len(raw) > 64_000:
                raise ValueError('worker input exceeds its bound')
            result = worker(unique_json(raw))
        except Exception as error:
            result = {'passed': False, 'reason': type(error).__name__ + ': ' + str(error)}
        print(json.dumps(result))
        return
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol', type=Path, required=True)
    parser.add_argument('--receipt', type=Path, action='append', required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    result = grade(args.protocol, args.receipt, args.output)
    print(json.dumps({'arms': [{'passed': a['passed'], 'total': a['total']} for a in result['arms']], 'qualification': False}))


if __name__ == '__main__':
    main()
