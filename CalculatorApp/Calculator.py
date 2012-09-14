import re

__author__ = 'dgadd'

class Calculator(object):
    def sum(self, numbersToAdd):
        numbersArray = re.split(r',', numbersToAdd)
        total = 0
        for numberString in numbersArray:
            if len(numberString) > 0:
                total += int(numberString)
        return total

    def add(self, numbersToAdd):
        if "," in numbersToAdd:
            return self.sum(numbersToAdd)

        return int(numbersToAdd) if len(numbersToAdd) > 0 else 0