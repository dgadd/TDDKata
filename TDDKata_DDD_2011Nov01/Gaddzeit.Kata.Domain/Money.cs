using System;

namespace Gaddzeit.Kata.Domain
{
    public struct Money
    {
        private readonly decimal _amount;
        private readonly string _currency;

        public Money(decimal amount, string currency)
        {
            _amount = amount;
            _currency = currency;
        }

        public decimal Amount
        {
            get {
                return _amount;
            }
        }

        public string Currency
        {
            get {
                return _currency;
            }
        }
    }
}