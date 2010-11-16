using System;
using System.Collections.Generic;

namespace Gaddzeit.Kata.Domain
{
    public class Calculator
    {
        public int Add(string numbersToAdd)
        {
            numbersToAdd = HandleCustomDelimeters(numbersToAdd);
            RejectDoubleDelimeters(numbersToAdd);
            if(numbersToAdd.Contains(","))
            {
                var numbers = numbersToAdd.Split(',');
                return Sum(numbers);
            }
            return string.IsNullOrEmpty(numbersToAdd) ? 0 : Convert.ToInt32(numbersToAdd);
        }

        private static string HandleCustomDelimeters(string numbersToAdd)
        {
            if(numbersToAdd.StartsWith("//"))
            {
                var customDelimeter = numbersToAdd.Substring(2, 1); // 2,3 in Java
                numbersToAdd = numbersToAdd.Substring(4);
                numbersToAdd = numbersToAdd.Replace(customDelimeter, ",");
            }
            numbersToAdd = numbersToAdd.Replace('\n', ',');
            return numbersToAdd;
        }

        private static void RejectDoubleDelimeters(string numbersToAdd)
        {
            if(numbersToAdd.Contains(",,"))
                throw new ArgumentException("You cannot use double delimeters.");
        }

        private static int Sum(IEnumerable<string> numbers)
        {
            var total = 0;
            foreach (var numberString in numbers)
            {
                if(!string.IsNullOrEmpty(numberString))
                {
                    var number = Convert.ToInt32(numberString);
                    if(number < 0)
                        throw new ArgumentException("You cannot use negative numbers.");
                    total += number;
                }
            }
            return total;
        }
    }
}