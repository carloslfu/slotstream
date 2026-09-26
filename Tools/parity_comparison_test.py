"""Exercise the CLI's real layer comparison without MLX or model weights."""
from pathlib import Path
import struct
import subprocess
import tempfile
import unittest


ROOT = Path(__file__).resolve().parent.parent


class ParityComparison(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temp = tempfile.TemporaryDirectory(prefix='slotstream-parity-')
        cls.addClassCleanup(cls.temp.cleanup)
        cls.root = Path(cls.temp.name)
        source = (ROOT / 'Sources/slotstream-cli/main.swift').read_text()
        # Keep file decoding, validation, error reduction and the final verdict
        # verbatim. Only model generation and ArgumentParser errors are replaced.
        parity = source.split('// MARK: parity\n', 1)[1].split('// MARK: doctor\n', 1)[0]
        start = '            var worst: Float = 0'
        end = '            if worst >= 2e-2 { throw ExitCode(2) }'
        if parity.count(start) != 1 or parity.count(end) != 1:
            raise ValueError('parity comparison boundary changed; review the harness')
        block = parity[parity.index(start):parity.index(end) + len(end)]
        swift = cls.root / 'main.swift'
        swift.write_text('''import Foundation
struct ValidationError: Error { let message: String; init(_ message: String) { self.message = message } }
struct ExitCode: Error { let code: Int32; init(_ code: Int32) { self.code = code } }
func compare(cmp: String, dumps: [Int: [Float]], layers: Int) throws {
''' + block + '''
}
let cmp = CommandLine.arguments[1]
let generated = CommandLine.arguments.dropFirst(2).map { argument in
    argument.split(separator: ",").map { Float(String($0))! }
}
let dumps = Dictionary(uniqueKeysWithValues: generated.enumerated().map { ($0.offset, $0.element) })
do { try compare(cmp: cmp, dumps: dumps, layers: generated.count) }
catch let error as ExitCode { exit(error.code) }
catch let error as ValidationError { print(error.message); exit(1) }
catch { print(error); exit(1) }
''')
        cls.binary = cls.root / 'compare'
        subprocess.run(['xcrun', 'swiftc', str(swift), '-o', str(cls.binary)],
                       check=True, capture_output=True, text=True, timeout=120)

    def compare(self, reference, generated):
        with tempfile.TemporaryDirectory(dir=self.root) as directory:
            for layer, values in enumerate(reference):
                (Path(directory) / f'layer_{layer}.bin').write_bytes(
                    struct.pack(f'={len(values)}f', *values))
            return subprocess.run([str(self.binary), directory] +
                                  [','.join(map(str, row)) for row in generated],
                                  text=True, capture_output=True, timeout=10)

    def test_finite_values_keep_existing_tolerance(self):
        for value, passed in [(2.0, True), (2.03, True), (2.09, False)]:
            with self.subTest(value=value):
                result = self.compare([[1, 2, 3]], [[1, value, 3]])
                self.assertEqual(result.returncode, 0 if passed else 2, result.stdout + result.stderr)
                self.assertIn('PARITY PASS' if passed else 'PARITY FAIL', result.stdout)

    def test_nonfinite_values_never_pass(self):
        for value in [float('nan'), float('inf'), -float('inf')]:
            for side in ['reference', 'generated', 'both']:
                for index in range(3):
                    with self.subTest(value=value, side=side, index=index):
                        reference, generated = [1, 2, 3], [1, 2, 3]
                        if side in ['reference', 'both']:
                            reference[index] = value
                        if side in ['generated', 'both']:
                            generated[index] = value
                        result = self.compare([[1, 2, 3], reference], [[1, 2, 3], generated])
                        self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)
                        self.assertNotIn('PARITY PASS', result.stdout)
                        self.assertIn('layer 1', result.stdout)
                        self.assertIn(f'index {index}', result.stdout)
                        self.assertIn('reference' if side == 'both' else side, result.stdout)

    def test_finite_subtraction_overflow_still_fails(self):
        largest = float.fromhex('0x1.fffffep+127')
        result = self.compare([[largest]], [[-largest]])
        self.assertEqual(result.returncode, 2, result.stdout + result.stderr)
        self.assertIn('PARITY FAIL', result.stdout)


if __name__ == '__main__':
    unittest.main()
