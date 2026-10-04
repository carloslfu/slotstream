import copy
import hashlib
import json
import unittest
from unittest.mock import patch

import affine_standalone_metadata as m
from affine_expert_control import sized_header


class StandaloneMetadataChecks(unittest.TestCase):
    def fixtures(self):
        quant = {'bits': 4, 'group_size': 64,
                 'model.layers.1.ple.ple_embedding.ngram_embedding.shard_0': {'bits': 4, 'group_size': 32},
                 'mtp.layers.0.mlp.switch_mlp.gate_proj': {'bits': 4, 'group_size': 64}}
        config = {'architectures': ['Qwen4ExpForConditionalGeneration'],
                  'model_file': 'qwen4_exp.py', 'vision_config': {'hidden_size': 1024},
                  'text_config': {'num_hidden_layers': 48, 'eos_token_id': 42},
                  'quantization': quant, 'quantization_config': copy.deepcopy(quant)}
        original = {'metadata': {'total_size': 1, 'obsolete': True},
                    'weight_map': {'dense.weight': 'model-00001.safetensors'}}
        retained = [{'source': 'model-00001.safetensors', 'output': 'retained-00001.safetensors',
                     'header': {'dense.weight': {'dtype': 'BF16', 'shape': [2], 'data_offsets': [0, 4]}},
                     'payload_bytes': 4}]
        experts = []
        for layer in range(48):
            header, _, size = sized_header(layer)
            experts.append({'output': f'experts-{layer:02d}.safetensors', 'header': header, 'payload_bytes': size})
            original['weight_map'].update({key: 'model-00001.safetensors' for key in header})
        return config, original, retained, experts

    def test_only_main_expert_recipes_change_without_mutating_the_parent(self):
        config, _, _, _ = self.fixtures(); before = copy.deepcopy(config)
        name = m.module_names()[0]
        for field in ('quantization', 'quantization_config'):
            config[field]['language_model.' + name] = {'bits': 4, 'group_size': 64}
        result = m.configuration(config)
        self.assertEqual(len(m.module_names()), 144)
        for field in ('quantization', 'quantization_config'):
            self.assertNotIn('language_model.' + name, result[field])
            for module in m.module_names():
                self.assertEqual(result[field][module], {'bits': 3, 'group_size': 64})
            for key, value in before[field].items():
                self.assertEqual(result[field][key], value)
        for key in ('architectures', 'model_file', 'vision_config', 'text_config'):
            self.assertEqual(result[key], config[key])
        self.assertNotIn(name, config['quantization'])
        result['text_config']['eos_token_id'] = 99
        self.assertEqual(config['text_config']['eos_token_id'], 42)
        self.assertIsNot(result['quantization'], result['quantization_config'])

    def test_parent_alias_and_recipe_failures_are_explicit(self):
        config, _, _, _ = self.fixtures(); name = m.module_names()[0]
        for recipe in ({'bits': 3, 'group_size': 64}, {'bits': 4, 'group_size': 32},
                       {'bits': True, 'group_size': 64}, {'bits': 4, 'group_size': 64, 'mode': 'affine'}, False):
            wrong = copy.deepcopy(config)
            for field in ('quantization', 'quantization_config'):
                wrong[field][name] = recipe
            with self.subTest(recipe=recipe), self.assertRaises(ValueError):
                m.configuration(wrong)
        for mutate in (lambda x: x.pop('quantization_config'),
                       lambda x: x['quantization_config'].update(bits=3),
                       lambda x: x['quantization'].update(group_size=True)):
            wrong = copy.deepcopy(config); mutate(wrong)
            with self.assertRaises(ValueError): m.configuration(wrong)
        # Python considers True equal to 1; serialized metadata must not.
        config['quantization']['extra'] = 1; config['quantization_config']['extra'] = True
        with self.assertRaises(ValueError): m.configuration(config)

    def test_conflicting_prefixed_alias_cannot_hide_behind_precedence(self):
        config, _, _, _ = self.fixtures(); name = m.module_names()[0]
        for field in ('quantization', 'quantization_config'):
            config[field][name] = {'bits': 8, 'group_size': 64}
            config[field]['language_model.' + name] = {'bits': 4, 'group_size': 64}
        with self.assertRaises(ValueError): m.configuration(config)

    def test_complete_index_uses_actual_output_payload_and_preserves_tensor_names(self):
        _, original, retained, experts = self.fixtures()
        before = copy.deepcopy(original)
        result = m.index(original, retained, experts)
        self.assertEqual(set(result['weight_map']), set(original['weight_map']))
        self.assertEqual(result['weight_map']['dense.weight'], 'retained-00001.safetensors')
        self.assertEqual(result['metadata'], {'total_size': 4 + sum(x['payload_bytes'] for x in experts)})
        self.assertEqual(original, before)
        for layer in range(48):
            names = [key for key in result['weight_map'] if key.startswith(f'language_model.model.layers.{layer}.')]
            self.assertEqual(len(names), 9)
            self.assertTrue(all(result['weight_map'][key] == f'experts-{layer:02d}.safetensors' for key in names))

    def test_missing_extra_duplicate_foreign_and_misplaced_tensors_are_refused(self):
        _, original, retained, experts = self.fixtures()
        bad = [([], experts), (retained, experts[:-1]), (retained, experts + experts[:1]),
               (retained + retained, experts)]
        other = copy.deepcopy(retained); other[0]['source'] = 'model-00002.safetensors'; bad.append((other, experts))
        other = copy.deepcopy(experts); other[0]['output'] = 'experts-48.safetensors'; bad.append((retained, other))
        other = copy.deepcopy(experts); other[0]['output'] = 'experts-01.safetensors'; bad.append((retained, other))
        other = copy.deepcopy(experts); key = next(iter(other[0]['header'])); item = other[0]['header'].pop(key)
        other[0]['header']['foreign.tensor'] = item; bad.append((retained, other))
        other = copy.deepcopy(experts); key = next(iter(other[0]['header']))
        # Keep the byte extent valid while changing the quantized geometry.
        shape = other[0]['header'][key]['shape']; shape[0] //= 2; shape[1] *= 2
        bad.append((retained, other))
        for kept, converted in bad:
            with self.subTest(kept=len(kept), converted=len(converted)), self.assertRaises(ValueError):
                m.index(original, kept, converted)
        broken = copy.deepcopy(original); broken['weight_map'].pop(next(iter(m.expert_tensors(3))))
        with self.assertRaises(ValueError): m.index(broken, retained, experts)

    def test_unsafe_paths_payload_bounds_and_header_coverage_are_refused(self):
        _, original, retained, experts = self.fixtures()
        for name in ('', '.', '..', '../escape', 'sub/file', 'sub\\file', 'nul\0file'):
            other = copy.deepcopy(retained); other[0]['output'] = name
            with self.subTest(name=name), self.assertRaises(ValueError): m.index(original, other, experts)
        for size in (True, -1, m.LIMIT + 1, 3, 5):
            other = copy.deepcopy(retained); other[0]['payload_bytes'] = size
            with self.subTest(size=size), self.assertRaises(ValueError): m.index(original, other, experts)

    def test_deterministic_metadata_pins_and_serialization_bounds(self):
        config, original, retained, experts = self.fixtures()
        files, pins = m.metadata_files(config, original, retained, experts)
        self.assertEqual(m.metadata_files(config, original, retained, list(reversed(experts))), (files, pins))
        self.assertEqual(set(files), {'config.json', 'model.safetensors.index.json'})
        for pin in pins:
            self.assertEqual(pin['sha256'], hashlib.sha256(files[pin['path']]).hexdigest())
            self.assertEqual(pin['size'], len(files[pin['path']]))
            self.assertIs(pin['optional'], False)
            self.assertNotIn('qualification', json.loads(files[pin['path']]))
        with patch.object(m, 'MAX_METADATA', 32), self.assertRaises(ValueError):
            m.metadata_files(config, original, retained, experts)
        with self.assertRaises(ValueError): m.encoded({'value': float('nan')})


if __name__ == '__main__':
    unittest.main()
