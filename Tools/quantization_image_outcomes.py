"""Complete image-answer fixtures for a separately frozen paired protocol.

One embedded image and up to four user turns. No URLs, file reads, model
launches or external actions. The protocol owner pins the entire case and its
source/gold provenance before inference. These focused product fixtures do
not provide statistical noninferiority for arbitrary image tasks.
"""
import base64
import hashlib
import json
import re

from quantization_inventory import unique_json
from quantization_outcomes import TaskBudgetExceeded, terminal

MAX_IMAGE_BYTES = 450_000
SYSTEM = ('Answer each image question with exactly one JSON object containing the key '
          'answer. Use the answer type and labels requested by the question. '
          'Do not include Markdown, explanations, or extra keys.')


def validate(case):
    if (type(case) is not dict or set(case) != {'id', 'family', 'mime', 'image_base64', 'image_sha256', 'turns'}
            or case['family'] != 'image' or type(case['id']) is not str
            or re.fullmatch(r'[a-zA-Z0-9_-]{1,64}', case['id']) is None
            or case['mime'] not in ('image/png', 'image/jpeg')
            or type(case['image_base64']) is not str or len(case['image_base64']) > 600_000
            or type(case['turns']) is not list or not 1 <= len(case['turns']) <= 4):
        raise ValueError('invalid bounded image fixture')
    try:
        raw = base64.b64decode(case['image_base64'], validate=True)
    except (ValueError, TypeError) as error:
        raise ValueError('invalid embedded image') from error
    signature = b'\x89PNG\r\n\x1a\n' if case['mime'] == 'image/png' else b'\xff\xd8\xff'
    if (not 0 < len(raw) <= MAX_IMAGE_BYTES or not raw.startswith(signature)
            or hashlib.sha256(raw).hexdigest() != case['image_sha256']):
        raise ValueError('image bytes differ from their pinned identity or format')
    for turn in case['turns']:
        if (type(turn) is not dict or set(turn) != {'question', 'answer'}
                or type(turn['question']) is not str or not 1 <= len(turn['question'].encode()) <= 8192
                or type(turn['answer']) not in (str, int)
                or (type(turn['answer']) is str and not 1 <= len(turn['answer'].encode()) <= 128)
                or (type(turn['answer']) is int and not 0 <= turn['answer'] <= 1000)):
            raise ValueError('image fixture requires bounded typed reference answers')
    return case


def make_case(identity, raw, mime, turns):
    if type(raw) is not bytes or not 0 < len(raw) <= MAX_IMAGE_BYTES:
        raise ValueError('bounded original image bytes required')
    # Copy the structured gold so later caller mutation cannot change the case.
    return validate({'id': identity, 'family': 'image', 'mime': mime,
                     'image_base64': base64.b64encode(raw).decode(),
                     'image_sha256': hashlib.sha256(raw).hexdigest(),
                     'turns': json.loads(json.dumps(turns, allow_nan=False))})


def grade(response, expected):
    if type(expected) not in (str, int):
        raise ValueError('image grading requires a typed reference answer')
    text = terminal(response)
    if text is None:
        return False
    try:
        value = unique_json(text.encode())
    except (ValueError, TypeError, UnicodeError):
        return False
    return (type(value) is dict and set(value) == {'answer'}
            and type(value['answer']) is type(expected) and value['answer'] == expected)


def run_case(session, case):
    validate(case)
    history = [{'role': 'system', 'content': SYSTEM}]
    results = []
    for index, turn in enumerate(case['turns']):
        content = turn['question']
        if index == 0:
            content = [{'type': 'image_url', 'image_url': {
                'url': 'data:' + case['mime'] + ';base64,' + case['image_base64']}},
                {'type': 'text', 'text': content}]
        history.append({'role': 'user', 'content': content})
        try:
            response = session.chat(history)
        except TaskBudgetExceeded as error:
            return {'passed': False, 'turns': results, 'failed_turn': index,
                    'refusal': str(error), 'reason': 'complete reply reservation refused'}
        results.append({'passed': grade(response, turn['answer']), 'response': response})
        if terminal(response) is None:
            return {'passed': False, 'turns': results, 'failed_turn': index,
                    'reason': 'image turn did not complete with text'}
        history.append(response['choices'][0]['message'])
    return {'passed': all(turn['passed'] for turn in results), 'turns': results}
