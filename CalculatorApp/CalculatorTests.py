from random import randint
from Calculator import Calculator

__author__ = 'dgadd'

import unittest


class MyTestCase(unittest.TestCase):
    def test_addMethod_zeroLengthInput_returnsZero(self):
        expected = 0
        sut = Calculator()
        result = sut.add("")
        self.assertEqual(expected, result, msg="Zero length input should return 0.")

    def test_addMethod_oneLengthInput_returnsEquivalent(self):
        expected = 8
        sut = Calculator()
        result = sut.add("8")
        self.assertEqual(expected, result, msg="One length input should return equivalent.")

    def test_addMethod_twoLengthInput_returnsSum(self):
        expected = 10
        sut = Calculator()
        result = sut.add("3,7")
        self.assertEqual(expected, result, msg="Two length input should return sum.")

    def test_addMethod_anyLengthInput_returnsSum(self):
        randomNumber = randint(111,999)
        expected = 0
        numbersToAdd = ""
        for i in range(111, randomNumber):
            numbersToAdd += "%s," % (i)
            expected += i

        sut = Calculator()
        result = sut.add(numbersToAdd)
        self.assertEqual(expected, result, msg="Any length input should return sum.")

if __name__ == '__main__':
    unittest.main()
