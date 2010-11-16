using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gaddzeit.Support.Model;
using NUnit.Framework;

namespace Gaddzeit.Kata.Tests.Unit
{
    [TestFixture]
    public class CustomerTests
    {
        [Test]
        public void Constructor_NoInputParams_IsInstanceOfDomainEntity()
        {
            var sut = new Customer();
            Assert.IsInstanceOf(typeof(DomainEntity), sut);
        }
    }
}
