"""Metadata for a standalone, same-parent affine expert artifact.

Pure construction only: callers authenticate the parent config/index, expert
manifest and source descriptors. Header geometry does not authenticate tensor
payloads. Export must independently verify all files before a completion
manifest can be written; this module cannot qualify or install a model.
"""
import copy
import hashlib
import json
import re
import unicodedata

from affine_expert_control import FAMILIES, LAYERS, metadata
from quantization_inventory import LIMIT, validate_header


MAX_METADATA = 4_000_000


def encoded(value):
    raw = (json.dumps(value, sort_keys=True, indent=2, ensure_ascii=False,
                      allow_nan=False) + '\n').encode('utf-8')
    if not 0 < len(raw) <= MAX_METADATA:
        raise ValueError('standalone metadata exceeds its bounded envelope')
    return raw


def module_names():
    return tuple(f'model.layers.{layer}.mlp.switch_mlp.{family}'
                 for layer in range(LAYERS) for family, _, _ in FAMILIES)


def expert_tensors(bits):
    return {f'language_model.model.layers.{layer}.mlp.switch_mlp.{family}.{suffix}': item
            for layer in range(LAYERS) for family, rows, columns in FAMILIES
            for suffix, item in metadata(rows, columns, bits).items()}


def configuration(parent):
    """Change only the routed main experts; preserve every other recipe.

    Both original aliases are kept coherent. The original config must also be
    preserved separately by export for the unchanged tokenizer, vision and
    draft component provenance. No claim of a BF16 conversion is implied.
    """
    if type(parent) is not dict:
        raise ValueError('expected a parent configuration object')
    primary, alias = parent.get('quantization'), parent.get('quantization_config')
    if type(primary) is not dict or type(alias) is not dict or encoded(primary) != encoded(alias):
        raise ValueError('parent quantization aliases must agree')
    default = {key: primary.get(key) for key in ('bits', 'group_size')}
    if any(type(value) is not int for value in default.values()):
        raise ValueError('parent quantization defaults must be integers')
    result = copy.deepcopy(parent)
    for name in module_names():
        paths = (name, 'language_model.' + name)
        overrides = [primary[path] for path in paths if path in primary]
        recipes = overrides or [default]
        if any(type(value) is not dict or set(value) != {'bits', 'group_size'}
               or any(type(v) is not int for v in value.values())
               or value != {'bits': 4, 'group_size': 64} for value in recipes):
            raise ValueError('parent expert recipe differs from affine four-bit group-64')
        for field in ('quantization', 'quantization_config'):
            # One canonical module spelling avoids ambiguous alias precedence.
            result[field].pop('language_model.' + name, None)
            result[field][name] = {'bits': 3, 'group_size': 64}
    return result


def _flat_name(name):
    if (type(name) is not str or not name or name in ('.', '..')
            or any(character in name for character in ('/', '\\', '\0'))):
        raise ValueError('standalone index requires flat filenames')
    return name


def index(parent, retained, experts):
    """Build exact complete tensor coverage from actual output headers.

    retained rows carry source/output names, output header and payload_bytes.
    experts use output/header/payload_bytes. No payload is read or fabricated.
    The old index total_size is deliberately recomputed from tensor extents;
    neither old shard headers nor removed four-bit experts belong in it.
    """
    if type(parent) is not dict or type(parent.get('weight_map')) is not dict:
        raise ValueError('expected a parent tensor index')
    original = parent['weight_map']
    if (not original or any(type(key) is not str or key == '__metadata__' for key in original)):
        raise ValueError('parent index has invalid tensor names')
    for value in original.values():
        _flat_name(value)
    expected = expert_tensors(3)
    if not set(expected) <= set(original) or len(original) <= len(expected):
        raise ValueError('parent must contain all experts and retained tensors')
    if type(retained) not in (list, tuple) or type(experts) not in (list, tuple) or len(experts) != LAYERS:
        raise ValueError('expected retained shards and every expert layer')
    weight_map, files = {}, set()
    payload_bytes = 0
    for is_expert, rows in ((False, retained), (True, experts)):
        for row in rows:
            name = _flat_name(row['output'])
            folded = unicodedata.normalize('NFC', name).casefold()
            if folded in files:
                raise ValueError('duplicate or case-aliased standalone shard')
            files.add(folded)
            header, size = row['header'], row['payload_bytes']
            if type(size) is not int or size < 0 or size > LIMIT:
                raise ValueError('invalid standalone tensor payload extent')
            validate_header(header, size)
            names = set(header) - {'__metadata__'}
            if not names:
                raise ValueError('empty standalone tensor shard')
            if is_expert:
                match = re.fullmatch(r'experts-(\d{2})\.safetensors', name)
                if match is None or int(match[1]) >= LAYERS:
                    raise ValueError('unexpected standalone expert shard')
                prefix = f'language_model.model.layers.{int(match[1])}.mlp.switch_mlp.'
                if names != {key for key in expected if key.startswith(prefix)}:
                    raise ValueError('expert shard has missing or extra tensors')
            else:
                source = _flat_name(row['source'])
                if (names & set(expected) or names != {key for key, value in original.items()
                                                       if value == source and key not in expected}):
                    raise ValueError('retained shard differs from its parent coverage')
            for key in names:
                if key not in original or key in weight_map:
                    raise ValueError('standalone index duplicates or invents a tensor')
                item = header[key]
                if is_expert and {field: item[field] for field in ('dtype', 'shape')} != expected[key]:
                    raise ValueError('standalone expert geometry changed')
                first, last = item['data_offsets']
                payload_bytes += last - first
                if payload_bytes > LIMIT:
                    raise ValueError('standalone aggregate tensor size overflows')
                weight_map[key] = name
    if set(weight_map) != set(original):
        raise ValueError('standalone index is incomplete')
    return {'metadata': {'total_size': payload_bytes}, 'weight_map': weight_map}


def metadata_files(parent_config, parent_index, retained, experts):
    """Return deterministic file bytes and pins, never a completed pack."""
    data = {'config.json': encoded(configuration(parent_config)),
            'model.safetensors.index.json': encoded(index(parent_index, retained, experts))}
    pins = [{'path': name, 'size': len(raw), 'sha256': hashlib.sha256(raw).hexdigest(), 'optional': False}
            for name, raw in sorted(data.items())]
    return data, pins
