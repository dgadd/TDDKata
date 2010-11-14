using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gaddzeit.Domain;
using NUnit.Framework;
namespace Gaddzeit.Kata.Tests.Unit
{
    [TestFixture]
    public class CalculatorTests
    {
        [Test]
        public void AddMethod_ZeroLengthInput_ReturnsZero()
        {
            var sut = new Calculator();
            int result = sut.Add("");

            Assert.AreEqual(0, result);
        }
    }
}
