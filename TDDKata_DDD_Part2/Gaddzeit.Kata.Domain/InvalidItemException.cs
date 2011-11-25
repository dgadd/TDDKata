using System;

namespace Gaddzeit.Kata.Domain
{
    public class InvalidItemException : Exception
    {
        public InvalidItemException(string message) : base(message)
        {
        }
    }
}