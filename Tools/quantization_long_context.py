"""Synthetic long-conversation outcomes for a separately frozen protocol.

This module neither launches a model nor selects a context policy. A caller
must freeze the generated cases, exact tokenized lengths, native configuration,
artifact identities, resource budget and acceptance rule before answers. The
same bounded Session used by the task campaign can execute these conversations.
Passing these product fixtures is not statistical long-context noninferiority.
"""
import hashlib
import json
import random

from quantization_inventory import unique_json
from quantization_outcomes import TaskBudgetExceeded, terminal


FIELDS = ('project', 'owner', 'budget_dollars', 'status', 'handoff_code')
SYSTEM = ('Use only the supplied fictional project records. Later explicit updates replace '
          'earlier values for that project; other fields remain unchanged. Do not combine '
          'different projects. Answer every query with exactly one JSON object containing '
          'project, owner, budget_dollars, status, and handoff_code. budget_dollars must '
          'be an integer. Do not include Markdown, explanations, or extra keys.')


def make_case(seed, record_count, position):
    """Deterministic source and independent expected state for three turns.

    Record count is geometry, not a claimed token count. The caller must price
    each fully templated turn and its reply reservation with the pinned
    tokenizer before freezing a context label. Native admission remains final.
    """
    if (type(seed) is not str or not 1 <= len(seed.encode()) <= 128
            or type(record_count) is not int or not 12 <= record_count <= 512
            or type(position) is not int or not 0 <= position < record_count):
        raise ValueError('bounded seed, record count and target position required')
    rng = random.Random(int.from_bytes(hashlib.sha256(seed.encode()).digest(), 'big'))
    names = ['Amira', 'Bruno', 'Celia', 'Dario', 'Elena', 'Farah', 'Gita', 'Hugo',
             'Ines', 'Jonas', 'Keiko', 'Luca', 'Mara', 'Nadia', 'Omar', 'Priya']
    stages = ['planned', 'reviewing', 'approved', 'paused']
    projects = rng.sample(range(10_000, 99_999), record_count)
    codes = rng.sample(range(1_000_000, 9_999_999), record_count)
    records = [dict(project=f'P-{project}', owner=names[rng.randrange(len(names))],
                    budget_dollars=rng.randrange(100, 999)*100,
                    status=stages[rng.randrange(len(stages))], handoff_code=f'H-{code}')
               for project, code in zip(projects, codes)]
    paragraphs = []
    for index, row in enumerate(records):
        paragraphs.append(
            f"Project {row['project']}: owner {row['owner']}; authorized budget "
            f"{row['budget_dollars']} dollars; status {row['status']}; handoff code "
            f"{row['handoff_code']}. This entry is independent of project "
            f"{records[(index + 1) % record_count]['project']}; do not copy that project's values.")
    original = records[position].copy()
    updated = dict(original, owner=names[(names.index(original['owner'])+1) % len(names)],
                   budget_dollars=original['budget_dollars']+700,
                   status=stages[(stages.index(original['status'])+1) % len(stages)])
    query = f"Return the current record for project {original['project']} using the required JSON keys."
    neighbor = records[(position + record_count//2) % record_count]
    turns = [
        {'question': 'Fictional project register, initial snapshot:\n\n' + '\n\n'.join(paragraphs) + '\n\n' + query,
         'expected': original},
        {'question': f"Update for project {original['project']}: the owner is now {updated['owner']}, "
                     f"the authorized budget is now {updated['budget_dollars']} dollars, and the status is "
                     f"now {updated['status']}. The handoff code is unchanged.\n\n" + query,
         'expected': updated},
        {'question': f"A separate update for project {neighbor['project']}: its owner is now Noor, "
                     'its authorized budget is 1500 dollars, and its status is paused. '
                     'This changes only that separate project.\n\n' + query,
         'expected': updated.copy()},
    ]
    identity = hashlib.sha256(json.dumps([seed, record_count, position], separators=(',', ':')).encode()).hexdigest()
    case = {'id': 'long-'+identity[:24], 'family': 'long_context', 'seed': seed,
            'record_count': record_count, 'target_position': position,
            'system': SYSTEM, 'turns': turns}
    if len(json.dumps(case, ensure_ascii=False).encode()) > 512_000:
        raise ValueError('long conversation source exceeds its fixture envelope')
    return case


def grade_record(response, expected):
    if (type(expected) is not dict or set(expected) != set(FIELDS)
            or any(type(expected[key]) is not (int if key == 'budget_dollars' else str) for key in FIELDS)):
        raise ValueError('complete typed reference record required')
    text = terminal(response)
    if text is None:
        return False
    try:
        value = unique_json(text.encode())
    except (ValueError, TypeError, UnicodeError):
        return False
    return (type(value) is dict and set(value) == set(FIELDS)
            and all(type(value[key]) is type(expected[key]) and value[key] == expected[key] for key in FIELDS))


def run_case(session, case):
    """Keep actual assistant messages in history, including incorrect answers.

    A trusted native reply-reservation refusal is a failed outcome. Other
    execution or framing errors propagate, so a crashed engine or grader can
    never be silently counted as an ordinary task failure.
    """
    expected_case = make_case(case['seed'], case['record_count'], case['target_position'])
    if case != expected_case:
        raise ValueError('long-conversation fixture differs from its deterministic source')
    history = [{'role': 'system', 'content': case['system']}]
    results = []
    for index, turn in enumerate(case['turns']):
        history.append({'role': 'user', 'content': turn['question']})
        try:
            response = session.chat(history)
        except TaskBudgetExceeded as error:
            return {'passed': False, 'turns': results, 'failed_turn': index,
                    'refusal': str(error), 'reason': 'complete reply reservation refused'}
        passed = grade_record(response, turn['expected'])
        results.append({'passed': passed, 'response': response})
        # A terminal text answer, even a wrong one, is the state the model
        # really produced. A tool call or length-limited answer does not form
        # a completed user turn and fails the entire conversation.
        if terminal(response) is None:
            return {'passed': False, 'turns': results, 'failed_turn': index,
                    'reason': 'conversation turn did not complete with text'}
        history.append(response['choices'][0]['message'])
    return {'passed': all(turn['passed'] for turn in results), 'turns': results}
