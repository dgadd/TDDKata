using System;

namespace Gaddzeit.Kata.Domain
{
    public class Calculator
    {
        public int Add(string numbersToAdd)
        {
            return string.IsNullOrEmpty(numbersToAdd) ? 0 : Convert.ToInt32(numbersToAdd);
        }
    }
}