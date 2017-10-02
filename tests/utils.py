import unittest

import pandoc_compose.utils as utils


class TestUtils(unittest.TestCase):
    def test_create_pandoc_opt(self):
        opts = {
            "string": "foo",
            "s": "bar",
            "flag": True,
            "useless": False,
            "f": True,
        }
        expected = [
            "--string foo",
            "-s bar",
            "--flag",
            '',
            "-f"
        ]

        result = list(map(utils.create_pandoc_opt, opts.items()))

        self.assertListEqual(result, expected)
