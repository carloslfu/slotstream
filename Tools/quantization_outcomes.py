#!/usr/bin/env python3
"""Complete-task outcome grading; no sampling or promotion policy.

Plain outcomes must actually terminate. Pinned IFEval runs separately with
CPU, physical-memory, I/O and wall bounds; it evaluates strings, never model
code. Coding responses use the separate native sandbox. Dataset versions,
runtime/source digests, sample exclusions and request budgets belong to the
prospectively frozen caller protocol, not to these grading functions.
"""
from decimal import Decimal, InvalidOperation
from dataclasses import dataclass
import json
import random
import re
import sys
from pathlib import Path

# The native session journals at most two MiB per event. Price a complete
# answer and its grader fixture inside the same finite I/O envelope rather
# than truncating a correct long answer or inheriting the coding-code limit.
INSTRUCTION_PAYLOAD_LIMIT = 2 << 20


class TaskBudgetExceeded(Exception):
    """Trusted session owner reports a predeclared task admission refusal.

    The caller must verify the native event and retain its complete journal.
    Never wrap a crash, timeout, corrupt response or grader failure in this
    exception: those invalidate execution instead of producing a task score.
    """


def terminal(response):
    if not isinstance(response, dict) or not isinstance(response.get('choices'), list) or len(response['choices']) != 1:
        raise ValueError('one complete native choice required')
    choice = response['choices'][0]
    if not isinstance(choice, dict) or not isinstance(choice.get('finish_reason'), str):
        raise ValueError('complete native choice metadata required')
    message = choice.get('message')
    if not isinstance(message, dict) or message.get('role') != 'assistant':
        raise ValueError('native assistant message required')
    if choice.get('finish_reason') != 'stop' or message.get('tool_calls'):
        return None
    content = message.get('content')
    if not isinstance(content, str): raise ValueError('native text content required')
    return content


def exact_number(text, answer):
    if not isinstance(text, str) or not isinstance(answer, str) or len(answer) > 64:
        raise ValueError('text and bounded reference number required')
    try: reference = Decimal(answer.replace(',', ''))
    except InvalidOperation as error: raise ValueError('invalid reference number') from error
    if not reference.is_finite(): raise ValueError('finite reference number required')
    rows = re.findall(r'^\s*####\s*([-+]?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?)\s*$', text, re.M)
    if len(rows) != 1 or len(rows[0]) > 64: return False
    try: return Decimal(rows[0].replace(',', '')) == reference
    except InvalidOperation: return False


def normalize_schema(value):
    if isinstance(value, dict):
        converted = {k: normalize_schema(v) for k, v in value.items()}
        if isinstance(converted.get('type'), str):
            converted['type'] = {'dict':'object','float':'number','int':'integer','tuple':'array','bool':'boolean'}.get(converted['type'], converted['type'])
        return converted
    if isinstance(value, list): return [normalize_schema(x) for x in value]
    return value


def tools_for(entry, source, classes):
    tools = []
    excluded = set(entry.get('excluded_function', []))
    for name in entry['involved_classes']:
        path = Path(source)/'data/multi_turn_func_doc'/(classes[name]+'.json')
        for line in path.read_text().splitlines():
            row = json.loads(line)
            if row['name'] in excluded: continue
            tools.append({'type':'function','function':{'name':row['name'],'description':row['description'],'parameters':normalize_schema(row['parameters'])}})
    names = [x['function']['name'] for x in tools]
    if len(names) != len(set(names)): raise ValueError('ambiguous tool names')
    return tools


@dataclass(frozen=True)
class ToolLimits:
    """Explicit fixture bounds, supplied by the prospective caller protocol.

    The round ceiling matches the app's current twelve-round job bound. The
    case call bound leaves room for reference calls in the isolated BFCL
    executor. It does not grant any authority to operate real external tools.
    """
    steps_per_turn: int
    calls_per_step: int
    calls_per_case: int

    def __post_init__(self):
        for value, maximum in [(self.steps_per_turn, 12), (self.calls_per_step, 8), (self.calls_per_case, 96)]:
            if type(value) is not int or not 1 <= value <= maximum:
                raise ValueError('tool fixture limit exceeds its reviewed scope')


def tool_case(session, case, bundle, source, classes, limits):
    """Run complete user turns with actual isolated fixture results.

    `session.chat` owns native identity, context/reservation, request and
    physical limits. `bundle` owns the pinned offline fixtures and OS boundary.
    Model task failures stay outcomes; execution/bootstrap failures propagate
    and invalidate the evaluation instead of becoming a failed model score.
    """
    import quantization_bfcl as bfcl
    if not isinstance(limits, ToolLimits):
        raise ValueError('explicit checked tool limits required')
    entry = case['entry']; tools = tools_for(entry, source, classes)
    names = {x['function']['name'] for x in tools}
    history = [{'role':'system','content':'Use the provided tools to complete each user request in the offline fixture. Inspect state when needed, use actual tool results, and finish each request with a concise answer. Do not invent missing information or claim an action succeeded without a tool result.'}]
    turns, steps, responses = [], [], []
    calls = 0
    seen_ids = set()

    class TaskFailure(Exception):
        pass

    from quantization_code_sandbox import MAX_PAYLOAD
    def payload_bytes(value):
        return len(json.dumps(value, ensure_ascii=False, allow_nan=False).encode())
    # An unpriceable source fixture is an infrastructure problem. Once the
    # fixed fixture fits, growth caused by generated calls is a declared task
    # limit. Refuse it before executing the proposed next step.
    if any(payload_bytes(value) > MAX_PAYLOAD for value in [
            {'mode':'replay','entry':entry,'steps':[]},
            {'mode':'grade','entry':entry,'turns':[],'gold':case['gold']}]):
        raise ValueError('offline source fixture exceeds its input envelope')
    def bounded_run(value):
        if payload_bytes(value) > MAX_PAYLOAD:
            raise TaskFailure('generated tool trace exceeds its declared input envelope')
        return bundle.run(value)

    try:
        for question in entry['question']:
            history += question; turn = []; turns.append(turn)
            for _ in range(limits.steps_per_turn):
                response = session.chat(history, tools); responses.append(response)
                if (not isinstance(response, dict) or not isinstance(response.get('choices'), list)
                        or len(response['choices']) != 1 or not isinstance(response['choices'][0], dict)):
                    raise ValueError('one complete native tool choice required')
                choice = response['choices'][0]; message = choice.get('message'); reason = choice.get('finish_reason')
                if not isinstance(message, dict) or message.get('role') != 'assistant' or not isinstance(reason, str):
                    raise ValueError('native assistant tool-choice metadata required')
                if reason == 'stop':
                    if message.get('tool_calls'): raise TaskFailure('tool calls after terminal stop')
                    if not isinstance(message.get('content'), str): raise ValueError('native terminal content required')
                    history.append(message); break
                if reason != 'tool_calls': raise TaskFailure('tool turn did not finish before its output limit')
                raw = message.get('tool_calls')
                if not isinstance(raw, list) or not 1 <= len(raw) <= limits.calls_per_step:
                    raise TaskFailure('tool calls exceed the step bound')
                try:
                    decoded = [bfcl.model_call(x['function']) for x in raw]
                    ids = [x['id'] for x in raw]
                    if (any(not isinstance(x, str) or not x for x in ids) or len(set(ids)) != len(ids)
                            or seen_ids.intersection(ids)):
                        raise ValueError('tool call IDs must be distinct nonempty strings')
                    if any(x['name'] not in names for x in decoded):
                        raise ValueError('tool call names an undeclared function')
                except (ValueError, TypeError, KeyError, json.JSONDecodeError) as error:
                    raise TaskFailure('invalid structured tool arguments: '+str(error))
                calls += len(decoded)
                if calls > limits.calls_per_case: raise TaskFailure('tool calls exceed the case bound')
                seen_ids.update(ids)
                proposed_steps = steps + [decoded]
                result = bounded_run({'mode':'replay','entry':entry,'steps':proposed_steps})
                returned = result['result']['results'][-1]
                if len(returned) != len(raw) or any(not isinstance(x, str) for x in returned):
                    raise ValueError('offline tool executor returned incomplete results')
                turn.append(decoded); steps = proposed_steps
                history.append(message)
                history += [{'role':'tool','tool_call_id':call['id'],'content':value} for call,value in zip(raw,returned)]
            else:
                raise TaskFailure('tool steps exceeded their per-turn bound')
        graded = bounded_run({'mode':'grade','entry':entry,'turns':turns,'gold':case['gold']})
        passed = graded['result']['valid']
        if type(passed) is not bool: raise ValueError('offline tool grader returned a nonbinary result')
        return {'passed':passed,'grade':graded,'responses':responses,'turns':turns,'history':history,'calls':calls}
    except (TaskFailure, TaskBudgetExceeded) as error:
        return {'passed':False,'reason':str(error),'responses':responses,'turns':turns,'history':history,'calls':calls}


def grade(family, case, response, *, instruction_source=None, runtime=None):
    text = terminal(response)
    if text is None: return {'passed':False,'reason':'no completed plain answer'}
    if family == 'facts': return {'passed':text.strip()==case['answer'],'method':'exact-option'}
    if family == 'multilingual': return {'passed':exact_number(text,case['answer']),'method':'exact-final-number'}
    if family == 'coding':
        from quantization_code_sandbox import MAX_PAYLOAD, grade as code_grade
        fixture = {'text':'','function':case['function'],'literal_tests':case['tests']}
        if len(json.dumps(fixture,ensure_ascii=False).encode()) > MAX_PAYLOAD:
            raise ValueError('coding source fixture exceeds its input envelope')
        fixture['text'] = text
        if len(json.dumps(fixture,ensure_ascii=False).encode()) > MAX_PAYLOAD:
            return {'passed':False,'reason':'coding answer exceeds its declared input envelope'}
        return code_grade(text, case['function'], case['tests'])
    if family == 'instruction':
        if instruction_source is None or runtime is None: raise ValueError('pinned instruction grader required')
        sys.path.insert(0,str(Path(runtime).absolute()));sys.path.insert(0,str(Path(instruction_source).absolute()))
        import nltk
        import langdetect
        from instruction_following_eval import evaluation_lib
        nltk.data.path[:] = [str(Path(instruction_source).absolute()/'nltk_data')]
        random.seed(0);langdetect.DetectorFactory.seed=0
        example=evaluation_lib.InputExample(**case['grader'])
        result=evaluation_lib.test_instruction_following_strict(example,{example.prompt:text})
        return {'passed':result.follow_all_instructions,'instructions':result.follow_instruction_list,'method':'upstream-strict-prompt'}
    raise ValueError('unknown text outcome family')


def isolated_instruction(case, response, instruction_source, runtime):
    from quantization_code_sandbox import _bounded_process, runtime_executable
    text=terminal(response)
    if text is None:return {'passed':False,'reason':'no completed plain answer'}
    # Usage, timing and model metadata stay in the caller's journal. The
    # grader needs only the complete text, and never interprets metadata.
    payload=json.dumps({'case':case,'text':text,'instruction_source':str(Path(instruction_source).absolute()),'runtime':str(Path(runtime).absolute())},ensure_ascii=False).encode()
    result=_bounded_process([str(runtime_executable()),'-I','-S','-B',str(Path(__file__).resolve()),'--instruction-worker'],payload,timeout=8,maximum_payload=INSTRUCTION_PAYLOAD_LIMIT)
    if result['exit_code']:raise RuntimeError('instruction grader infrastructure failed: '+result['stderr'].decode(errors='replace')[:1000])
    value=json.loads(result['stdout'])
    if not isinstance(value,dict) or type(value.get('passed')) is not bool:raise ValueError('invalid instruction outcome')
    return value


if __name__=='__main__':
    if sys.argv[1:]!=['--instruction-worker']:raise SystemExit('use the checked grading interface')
    import ctypes,ctypes.util,os,resource,signal
    resource.setrlimit(resource.RLIMIT_CPU,(6,7))
    lib=ctypes.CDLL(ctypes.util.find_library('proc'));peak=[0]
    def check(*_):
        buf=ctypes.create_string_buffer(296)
        if lib.proc_pid_rusage(os.getpid(),4,buf)!=0:raise RuntimeError('missing instruction-worker physical observation')
        physical=max(int.from_bytes(buf.raw[72:80],'little'),int.from_bytes(buf.raw[240:248],'little'));peak[0]=max(peak[0],physical)
        if physical>256_000_000:raise MemoryError('instruction-worker physical ceiling')
    signal.signal(signal.SIGALRM,check);signal.setitimer(signal.ITIMER_REAL,.05,.05)
    raw=sys.stdin.buffer.read(INSTRUCTION_PAYLOAD_LIMIT+1)
    if len(raw)>INSTRUCTION_PAYLOAD_LIMIT:raise ValueError('instruction payload exceeds bound')
    request=json.loads(raw)
    response={'choices':[{'finish_reason':'stop','message':{'role':'assistant','content':request['text']}}]}
    result=grade('instruction',request['case'],response,instruction_source=request['instruction_source'],runtime=request['runtime'])
    check();signal.setitimer(signal.ITIMER_REAL,0);result['peak_worker_bytes']=peak[0]
    print(json.dumps(result))
