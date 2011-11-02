using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gaddzeit.Kata.Domain;
using NUnit.Framework;

namespace Gaddzeit.Kata.Tests.Unit
{
    [TestFixture]
    public class MoneyTests
    {
        [Test]
        public void Constructor_AmountAndCurrencyInputs_MatchGetterProperties()
        {
            const decimal amount = 3.25M;
            const string currency = "CDN";
            var sut = new Money(amount, currency);

            Assert.AreEqual(amount, sut.Amount);
            Assert.AreEqual(currency, sut.Currency);
        }

        [Test]
        public void Constructor_AmountAndCurrencyInputs_AreReadOnly()
        {
            const decimal amount = 3.25M;
            const string currency = "CDN";
            var sut = new Money(amount, currency);

            Assert.IsFalse(sut.GetType().GetProperty("Amount").CanWrite);
            Assert.IsFalse(sut.GetType().GetProperty("Currency").CanWrite);
        }

        [Test]
        public void TwoInstances_SameCurrencyAndAmountInputs_AreEqual()
        {
            const decimal amount = 3.25M;
            const string currency = "CDN";
            var sut1 = new Money(amount, currency);
            var sut2 = new Money(amount, currency);

            Assert.AreEqual(sut1, sut2);
        }

    }
}
