using System;

namespace Gaddzeit.Kata.Domain
{
    public class InvalidProductException : Exception
    {
        public InvalidProductException(string message) : base(message)
        {
        }
    }
}