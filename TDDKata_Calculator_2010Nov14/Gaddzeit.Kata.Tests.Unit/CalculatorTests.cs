﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gaddzeit.Kata.Domain;
using NUnit.Framework;

namespace Gaddzeit.Kata.Tests.Unit
{
    [TestFixture]
    public class CalculatorTests
    {
        [Test]
        public void AddMethod_ZeroLengthInput_Returns0()
        {
            var sut = new Calculator();
            int result = sut.Add("");

            Assert.AreEqual(0, result);
        }

        [Test]
        public void AddMethod_OneLengthInput_ReturnsEquivalent()
        {
            var sut = new Calculator();

            int result = sut.Add("3");
            Assert.AreEqual(3, result);

            int result2 = sut.Add("5");
            Assert.AreEqual(5, result2);
        }
    }
}
