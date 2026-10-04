"""Prepare complete file ownership for the inspected affine-three-bit pack.

Preparation reads bounded headers and pinned small metadata only. It neither
authenticates weight payloads nor starts export. The caller freezes this plan,
prices the whole workspace and runs standalone_bundle.export under the existing
single-worker, process-memory, elapsed-time and real-headroom guards.
"""
from pathlib import Path
import json

from affine_expert_control import POLICY, Source
from affine_standalone_metadata import expert_tensors, metadata_files
from slotpack.pack import pins
from standalone_bundle import Entry, MAX_MANIFEST, encoded, sha256, valid_name
from tensor_subset import plan as subset_plan
from vq_dense_overlay import BASE_CONFIG, BASE_INDEX, BASE_REVISION, read_json

CONTROL_SHA256 = 'af31bd191fbd82dc998fe29cae230c7f3e6977bd355c827bf42e643b7680f182'
ROTARY_SHA256 = 'f077c4de8473b644afae5b9f939ddb2e70dcdfd876ad3e04d79f05018f133d9a'
ROTARY_BYTES = 67_108_864

CARD = b'''# Qwen3.8-Flash-Next with affine-three-bit routed experts

This research artifact retains the pinned affine-four-bit parent checkpoint's
dense, n-gram, vision and draft tensors. Its routed main experts were converted
from that existing four-bit checkpoint to affine three-bit, group size 64.
This is not a conversion from BF16. No fine-tuning or pruning was performed.

config.json and model.safetensors.index.json describe the complete exported
main model. parent-config.json and parent-model.safetensors.index.json preserve
the original metadata. PARENT-README.md and LICENSE retain the upstream model
card and license. The unchanged tokenizer and chat template retain their own
hashes. mtp.safetensors is the separate original draft component, with its
original configuration retained in parent-config.json. angles-f32le.bin is the
bounded reference rotary table used by the experimental native candidate.

expert-control-manifest.json records the expert conversion. The final
standalone-manifest.json pins every exported file and records retained-tensor
reconstruction. Completion proves exported bytes, not model quality, speed,
general loader compatibility or admission to Slotstream Auto. Product
qualification and explicit native standalone-loader verification remain
separate requirements. No remote architecture code is executed by export.

The model remains subject to the complete Qwen Community License in LICENSE.
Slotstream's engine license does not replace the model's license.
'''


def _copy(pin, source, name=None):
    return Entry(name or pin['path'], pin['size'], optional=pin['optional'],
                 source=source, source_size=pin['size'], source_sha256=pin['sha256']).validate()


def prepare(parent, control, rotary):
    parent, control, rotary = Path(parent), Path(control), Path(rotary)
    original = pins()
    known = {pin['path']: pin for pin in original}
    if (len(known) != len(original) or any(not valid_name(name) for name in known)
            or known['config.json']['sha256'] != BASE_CONFIG
            or known['model.safetensors.index.json']['sha256'] != BASE_INDEX):
        raise ValueError('parent file registry differs from its inspected identity')
    config = read_json(parent / 'config.json', BASE_CONFIG)
    index = read_json(parent / 'model.safetensors.index.json', BASE_INDEX)
    converted = read_json(control / 'manifest.json', CONTROL_SHA256)
    if (converted.get('complete') is not True or converted.get('qualification') is not False
            or converted.get('parent_revision') != BASE_REVISION or converted.get('policy') != POLICY):
        raise ValueError('expert component differs from the inspected completed conversion')
    sources = set(index['weight_map'].values())
    if not sources <= set(known) or any(not valid_name(name) for name in sources):
        raise ValueError('parent tensor index references an unpinned shard')
    expected_old = expert_tensors(4)
    entries, retained, experts = [], [], []
    for number, name in enumerate(sorted(sources), 1):
        pin = known[name]
        source = Source(parent / name, pin)
        try:
            names = set(source.header) - {'__metadata__'}
            if names != {key for key, value in index['weight_map'].items() if value == name}:
                raise ValueError('parent shard and index coverage differ')
            for key in names & set(expected_old):
                if {field: source.header[key][field] for field in ('dtype', 'shape')} != expected_old[key]:
                    raise ValueError('parent expert layout differs from the inspected geometry')
            selected = tuple(sorted(names - set(expected_old)))
            # An experts-only shard contributes no retained file. Metadata
            # construction still checks complete original tensor coverage.
            if not selected:
                continue
            subset = subset_plan(source.header, pin['size'] - source.base, selected)
            output = f'retained-{number:05d}.safetensors'
            entries.append(Entry(output, subset.output_bytes, source=parent / name,
                                 source_size=pin['size'], source_sha256=pin['sha256'], selected=selected,
                                 prefix_sha256=sha256(subset.prefix)).validate())
            retained.append({'source': name, 'output': output, 'header': json.loads(subset.prefix[8:]),
                             'payload_bytes': subset.output_bytes - len(subset.prefix)})
            source.recheck()
        finally:
            source.close()
    for pin in converted['files']:
        if not valid_name(pin['path']):
            raise ValueError('expert component requires flat bounded paths')
        entry = _copy({**pin, 'optional': False}, control / pin['path'])
        source = Source(entry.source, pin)
        try:
            experts.append({'output': entry.name, 'header': source.header,
                            'payload_bytes': pin['size'] - source.base})
            source.recheck()
        finally:
            source.close()
        entries.append(entry)
    metadata, generated_pins = metadata_files(config, index, retained, experts)
    renamed = {'config.json': 'parent-config.json',
               'model.safetensors.index.json': 'parent-model.safetensors.index.json',
               'README.md': 'PARENT-README.md'}
    for pin in original:
        if pin['path'] not in sources:
            entries.append(_copy(pin, parent / pin['path'], renamed.get(pin['path'])))
    # The exact manifest length is checked by the pinned metadata read above.
    entries.append(Entry('expert-control-manifest.json', (control / 'manifest.json').stat().st_size,
                         source=control / 'manifest.json', source_size=(control / 'manifest.json').stat().st_size,
                         source_sha256=CONTROL_SHA256).validate())
    entries.append(Entry('angles-f32le.bin', ROTARY_BYTES, source=rotary, source_size=ROTARY_BYTES,
                         source_sha256=ROTARY_SHA256).validate())
    metadata['README.md'] = CARD
    entries.extend(Entry(name, len(raw), data=raw).validate() for name, raw in sorted(metadata.items()))
    if len({entry.name.casefold() for entry in entries}) != len(entries):
        raise ValueError('complete standalone plan has conflicting output names')
    identity = {'format': 'qwen-flash-next-affine3-experts-v1', 'parent_revision': BASE_REVISION,
                'parent_config_sha256': BASE_CONFIG, 'parent_index_sha256': BASE_INDEX,
                'expert_control_manifest_sha256': CONTROL_SHA256, 'conversion_policy': POLICY,
                'rotary_sha256': ROTARY_SHA256, 'license_sha256': known['LICENSE']['sha256'],
                'tokenizer_sha256': known['tokenizer.json']['sha256'],
                'template_sha256': known['chat_template.jinja']['sha256'],
                'draft_sha256': known['mtp.safetensors']['sha256']}
    description = {'schema': 1, 'identity': identity, 'payloads_authenticated': False, 'qualification': False,
                   'file_count': len(entries), 'file_bytes': sum(entry.size for entry in entries),
                   'manifest_reservation_bytes': MAX_MANIFEST, 'generated_model_metadata': generated_pins,
                   'files': [describe(entry) for entry in entries]}
    description['maximum_output_bytes'] = description['file_bytes'] + MAX_MANIFEST
    return tuple(entries), identity, description


def describe(entry):
    """Portable plan identity, without local paths or large generated bytes."""
    entry.validate()
    value = {'path': entry.name, 'size': entry.size, 'optional': entry.optional}
    if entry.data is not None:
        value.update(operation='generated', sha256=sha256(entry.data))
    else:
        value.update(operation='subset' if entry.selected else 'copy', source_name=entry.source.name,
                     source_size=entry.source_size, source_sha256=entry.source_sha256)
        if entry.selected:
            value.update(tensors=list(entry.selected), prefix_sha256=entry.prefix_sha256)
    return value
