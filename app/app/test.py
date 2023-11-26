"""
Sample tests
"""

from django.test import SimpleTestCase
from app import calc


class CalcTests(SimpleTestCase):

    def test_fibonacci(self):

        result = calc.fibonacci_series(10)

        self.assertEqual(result, 89)
