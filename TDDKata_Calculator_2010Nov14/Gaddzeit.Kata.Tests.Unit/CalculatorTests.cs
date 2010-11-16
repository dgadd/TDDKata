using System;
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

        [Test]
        public void AddMethod_TwoLengthInput_ReturnsSum()
        {
            var sut = new Calculator();

            int result = sut.Add("3,5");
            Assert.AreEqual(8, result);

            int result2 = sut.Add("5,10");
            Assert.AreEqual(15, result2);
        }

        [Test]
        public void AddMethod_AnyLengthInput_ReturnsSum()
        {
            var howMany = new Random().Next(2, 1000);
            var expected = 0;
            var numbersToAdd = "";
            for(int i = 0; i < howMany; i++)
            {
                numbersToAdd += i + ",";
                expected += i;
            }
            var sut = new Calculator();

            int result = sut.Add(numbersToAdd);
            Assert.AreEqual(expected, result);
        }

        [Test]
        public void AddMethod_NewLineInput_ReturnsSum()
        {
            var sut = new Calculator();

            int result = sut.Add("3,5\n7");
            Assert.AreEqual(15, result);

            int result2 = sut.Add("4\n5,10");
            Assert.AreEqual(19, result2);
        }


        [Test]
        [ExpectedException(typeof(ArgumentException), ExpectedMessage = "You cannot use double delimeters.")]
        public void AddMethod_DoubleDelimeters_ThrowsException()
        {
            var sut = new Calculator();

            int result = sut.Add("3,5\n,7");
            Assert.AreEqual(15, result);

            int result2 = sut.Add("4,\n5,10");
            Assert.AreEqual(19, result2);
        }

        [Test]
        public void AddMethod_CustomDelimeterInput_ReturnsSum()
        {
            var sut = new Calculator();

            int result = sut.Add("//^\n2^3,5\n7");
            Assert.AreEqual(17, result);

            int result2 = sut.Add("//%\n4\n5,10%15");
            Assert.AreEqual(34, result2);
        }


        [Test]
        [ExpectedException(typeof(ArgumentException), ExpectedMessage = "You cannot use negative numbers: -5,-7,")]
        public void AddMethod_NegativeNumber_ThrowsException()
        {
            var sut = new Calculator();

            int result = sut.Add("3,-5,-7");
        }

        [Test]
        public void AddMethod_NumbersBiggerThan1000_AreIgnored()
        {
            var sut = new Calculator();

            int result = sut.Add("3,5,1005,999");
            Assert.AreEqual(1007, result);

            int result2 = sut.Add("344,1000,1200");
            Assert.AreEqual(1344, result2);
        }

    }
}
