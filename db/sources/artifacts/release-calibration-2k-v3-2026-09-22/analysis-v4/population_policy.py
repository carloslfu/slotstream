"""Apply explicit curator exclusions without changing captured verdicts."""
import json


def adjudicate(row, relative_path, policies):
    population = relative_path.split('/')[0]
    reasons = policies.get(population, {}).get('manual_exclusions', {}).get(relative_path, [])
    if not reasons:
        return dict(row)
    result = dict(row)
    result['original_environment_eligible'] = row['environment_eligible']
    result['original_strict_global_swap_eligible'] = row['strict_global_swap_eligible']
    result['manual_exclusions'] = list(reasons)
    result['exclusions'] = sorted(set(row.get('exclusions', []) + reasons))
    result['environment_eligible'] = False
    result['strict_global_swap_eligible'] = False
    return result


def request_history(path, row):
    manifest = path.parent.parent.parent / 'manifest.json'
    if not manifest.exists():
        return {'server_history': 'unknown', 'fixture_position': None}
    capture = json.loads(manifest.read_text())
    profile = capture['protocol']['profiles'][row['profile']]
    fixtures = profile['prefill_fixtures' if row['stage'] in ('prefill_miss', 'repeat') else 'decode_fixtures']
    offset = (row['round'] - 1) % len(fixtures)
    order = fixtures[offset:] + fixtures[:offset]
    position = order.index(row['fixture'])
    return {'server_history': 'first_prompt' if position == 0 else 'after_other_prompts',
            'fixture_position': position}
