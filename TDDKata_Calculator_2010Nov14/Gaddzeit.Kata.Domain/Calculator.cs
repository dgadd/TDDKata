using System;
using System.Collections.Generic;

namespace Gaddzeit.Kata.Domain
{
    public class Calculator
    {
        public int Add(string numbersToAdd)
        {
            numbersToAdd = numbersToAdd.Replace('\n', ',');
            if(numbersToAdd.Contains(","))
            {
                var numbers = numbersToAdd.Split(',');
                return Sum(numbers);
            }
            return string.IsNullOrEmpty(numbersToAdd) ? 0 : Convert.ToInt32(numbersToAdd);
        }

        private static int Sum(IEnumerable<string> numbers)
        {
            var total = 0;
            foreach (var number in numbers)
            {
                if(!string.IsNullOrEmpty(number))
                    total += Convert.ToInt32(number);
            }
            return total;
        }
    }
}