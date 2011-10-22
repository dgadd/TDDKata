using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;

namespace Gaddzeit.Kata.Domain.Tests.Unit
{
    [TestFixture]
    public class GymTests
    {
        [Test]
        public void Constructor_NoInput_IsInstanceOfDomainEntityBase()
        {
            var sut = new Gym();
            Assert.IsInstanceOf(typeof(DomainEntityBase), sut);
        }
    }
}
