using System;

namespace Gaddzeit.Kata.Domain
{
    public class InvalidLineItemException : Exception
    {
        public InvalidLineItemException(string message) : base(message) {}
    }
}