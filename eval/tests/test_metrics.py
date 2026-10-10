import sys, pathlib, unittest
sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1]))
from metrics import *


class T(unittest.TestCase):
    def test_wilson_matches_spec_table(self):
        # Bảng đề bài mục 4.4 (làm tròn 0.1%)
        for n, p99, p98 in [(300, 97.1, 95.7), (500, 97.7, 96.4), (800, 98.0, 96.8),
                            (1000, 98.2, 96.9), (1500, 98.4, 97.2)]:
            self.assertAlmostEqual(wilson_lower(round(n * .99), n) * 100, p99, delta=0.15)
            self.assertAlmostEqual(wilson_lower(round(n * .98), n) * 100, p98, delta=0.15)

    def test_confident_wrong(self):
        self.assertTrue(confident_wrong("S3", "S1", True))
        self.assertTrue(confident_wrong("S1", "S1", False))
        self.assertFalse(confident_wrong("S1", "S3", False))  # thận trọng thừa: sai nhẹ, không phải khẳng định sai

    def test_numbers_exact(self):
        self.assertTrue(numbers_exact({"rate": 0.024}, {"rate": 0.024}))
        self.assertFalse(numbers_exact({"rate": 0.0241}, {"rate": 0.024}))

    def test_pass_k_and_weight(self):
        self.assertEqual(pass_k([[True, True, True], [True, False, True]]), 0.5)
        self.assertAlmostEqual(overall_weighted(0.99, 0.965), 0.98, places=6)

    def test_invalid_state_rejected(self):
        with self.assertRaises(ValueError):
            confusion([("S1", "X")])


if __name__ == "__main__":
    unittest.main()
