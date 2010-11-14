using System;

namespace Gaddzeit.Kata.Domain
{
    public class Calculator
    {
        public int Add(string numbersToAdd)
        {
            if(numbersToAdd.Contains(","))
            {
                var numbers = numbersToAdd.Split(',');
                var total = 0;
                foreach (var number in numbers)
                {
                    if(!string.IsNullOrEmpty(number))
                        total += Convert.ToInt32(number);
                }
                return total;
            }
            return string.IsNullOrEmpty(numbersToAdd) ? 0 : Convert.ToInt32(numbersToAdd);
        }
    }
}