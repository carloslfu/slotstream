import copy
from contextlib import ExitStack
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import affine_standalone_export as m
from affine_expert_control import sized_header
from quantization_inventory import DTYPES, product, validate_header


class StandaloneExportPreparationChecks(unittest.TestCase):
    def fixture(self, root):
        root = Path(root); parent = root / 'parent'; parent.mkdir()
        control = root / 'experts'; control.mkdir()
        header, cursor = {}, 0
        for name, item in {**m.expert_tensors(4), 'dense.weight': {'dtype': 'BF16', 'shape': [2]}}.items():
            size = product(item['shape']) * DTYPES[item['dtype']]
            header[name] = {**item, 'data_offsets': [cursor, cursor + size]}; cursor += size
        virtual = {'model-00001.safetensors': (header, cursor)}
        quant = {'bits': 4, 'group_size': 64}
        config = {'quantization': quant, 'quantization_config': copy.deepcopy(quant),
                  'text_config': {'num_hidden_layers': 48}}
        index = {'weight_map': {key: 'model-00001.safetensors' for key in header}}
        data = {'config.json': m.encoded(config), 'model.safetensors.index.json': m.encoded(index),
                'README.md': b'Original model card', 'LICENSE': b'Original model license',
                'tokenizer.json': b'{}', 'chat_template.jinja': b'unchanged template',
                'mtp.safetensors': b'tiny draft fixture'}
        pins = []
        for name, raw in data.items():
            (parent / name).write_bytes(raw)
            pins.append({'path': name, 'size': len(raw), 'sha256': m.sha256(raw),
                         'optional': name == 'mtp.safetensors'})
        pins.append({'path': 'model-00001.safetensors', 'size': cursor + 8,
                     'sha256': 'a'*64, 'optional': False})
        files = []
        for layer in range(48):
            header, _, size = sized_header(layer)
            name = f'experts-{layer:02d}.safetensors'
            virtual[name] = (header, size)
            files.append({'path': name, 'size': size + 8, 'sha256': 'b'*64})
        manifest = {'complete': True, 'qualification': False, 'policy': m.POLICY,
                    'parent_revision': m.BASE_REVISION, 'files': files}
        raw = m.encoded(manifest); (control / 'manifest.json').write_bytes(raw)

        class HeaderSource:
            # These virtual descriptors exercise full-sized geometry without
            # creating sparse multi-GB files. They authenticate no payloads.
            def __init__(self, path, pin):
                self.header, size = copy.deepcopy(virtual[path.name])
                validate_header(self.header, size)
                if pin['size'] != size + 8: raise ValueError('virtual descriptor extent changed')
                self.base = 8
            def recheck(self): pass
            def close(self): pass

        stack = ExitStack(); self.addCleanup(stack.close)
        stack.enter_context(patch.object(m, 'pins', return_value=pins))
        stack.enter_context(patch.object(m, 'BASE_CONFIG', m.sha256(data['config.json'])))
        stack.enter_context(patch.object(m, 'BASE_INDEX', m.sha256(data['model.safetensors.index.json'])))
        stack.enter_context(patch.object(m, 'CONTROL_SHA256', m.sha256(raw)))
        stack.enter_context(patch.object(m, 'Source', HeaderSource))
        return parent, control, root / 'angles-f32le.bin', pins, virtual

    def test_complete_plan_has_explicit_component_ownership_and_exact_config_index(self):
        with tempfile.TemporaryDirectory() as tmp:
            parent, control, rotary, pins, _ = self.fixture(tmp)
            entries, identity, description = m.prepare(parent, control, rotary)
            names = {entry.name: entry for entry in entries}
            self.assertIs(description['payloads_authenticated'], False)
            self.assertIs(description['qualification'], False)
            self.assertEqual(description['file_count'], len(entries))
            self.assertEqual(description['file_bytes'], sum(entry.size for entry in entries))
            self.assertEqual(description['maximum_output_bytes'], description['file_bytes'] + m.MAX_MANIFEST)
            self.assertNotIn(tmp, m.encoded(description).decode())
            self.assertEqual(names['parent-config.json'].source_sha256, m.BASE_CONFIG)
            self.assertEqual(names['parent-model.safetensors.index.json'].source_sha256, m.BASE_INDEX)
            self.assertEqual(names['PARENT-README.md'].source, parent / 'README.md')
            self.assertEqual(names['README.md'].data, m.CARD)
            self.assertTrue(names['mtp.safetensors'].optional)
            self.assertEqual(names['angles-f32le.bin'].size, m.ROTARY_BYTES)
            self.assertEqual(identity['license_sha256'], names['LICENSE'].source_sha256)
            exported_config = json.loads(names['config.json'].data)
            self.assertEqual(exported_config['quantization']['model.layers.0.mlp.switch_mlp.gate_proj']['bits'], 3)
            exported_index = json.loads(names['model.safetensors.index.json'].data)
            self.assertEqual(exported_index['weight_map']['dense.weight'], 'retained-00001.safetensors')
            self.assertEqual(len(exported_index['weight_map']), 433)
            self.assertEqual(len([entry for entry in entries if entry.name.startswith('experts-')]), 48)
            self.assertEqual(names['retained-00001.safetensors'].selected, ('dense.weight',))
            for pin in pins:
                if pin['path'] != 'model-00001.safetensors':
                    self.assertEqual(sum(entry.source == parent / pin['path'] for entry in entries), 1)

    def test_changed_pinned_metadata_refuses_before_opening_any_tensor_source(self):
        for file in ['config.json', 'model.safetensors.index.json']:
            with self.subTest(file=file), tempfile.TemporaryDirectory() as tmp:
                parent, control, rotary, _, _ = self.fixture(tmp)
                (parent / file).write_bytes(b'changed')
                with patch.object(m, 'Source', side_effect=AssertionError('must reject first')):
                    with self.assertRaisesRegex(ValueError, 'metadata identity'):
                        m.prepare(parent, control, rotary)

    def test_incomplete_duplicate_and_escaping_expert_components_are_refused(self):
        for mode in ['missing', 'duplicate', 'path', 'incomplete', 'policy']:
            with self.subTest(mode=mode), tempfile.TemporaryDirectory() as tmp:
                parent, control, rotary, _, _ = self.fixture(tmp)
                path = control / 'manifest.json'; value = json.loads(path.read_bytes())
                if mode == 'missing': value['files'].pop()
                elif mode == 'duplicate': value['files'][-1] = value['files'][0]
                elif mode == 'path': value['files'][0]['path'] = '../escape'
                elif mode == 'incomplete': value['complete'] = False
                else: value['policy'] = 'foreign conversion'
                raw = m.encoded(value); path.write_bytes(raw)
                with patch.object(m, 'CONTROL_SHA256', m.sha256(raw)), self.assertRaises(ValueError):
                    m.prepare(parent, control, rotary)

    def test_parent_header_coverage_and_geometry_are_checked_before_export(self):
        for mode in ['coverage', 'geometry']:
            with self.subTest(mode=mode), tempfile.TemporaryDirectory() as tmp:
                parent, control, rotary, _, virtual = self.fixture(tmp)
                header, _ = virtual['model-00001.safetensors']
                name = next(iter(m.expert_tensors(4)))
                if mode == 'coverage': header['foreign.weight'] = header.pop('dense.weight')
                else:
                    header[name]['shape'][0] //= 2; header[name]['shape'][1] *= 2
                with self.assertRaisesRegex(ValueError, 'coverage|geometry'):
                    m.prepare(parent, control, rotary)

    def test_portable_description_binds_generated_bytes_and_subset_selection(self):
        with tempfile.TemporaryDirectory() as tmp:
            parent, control, rotary, _, _ = self.fixture(tmp)
            entries, _, description = m.prepare(parent, control, rotary)
            self.assertEqual(description['files'], [m.describe(entry) for entry in entries])
            self.assertEqual([row for row in description['files'] if row['operation'] == 'subset'][0]['tensors'],
                             ['dense.weight'])
            for entry, row in zip(entries, description['files']):
                if entry.data is not None: self.assertEqual(row['sha256'], m.sha256(entry.data))
                else: self.assertEqual(row['source_sha256'], entry.source_sha256)


if __name__ == '__main__':
    unittest.main()
