using System;

namespace Gaddzeit.Kata.Domain
{
    public class LineItemContentException : Exception
    {
        public LineItemContentException(string message) : base(message) {}
    }
}