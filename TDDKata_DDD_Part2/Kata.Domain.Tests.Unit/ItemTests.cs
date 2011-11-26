using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gaddzeit.Kata.Domain;
using NUnit.Framework;

namespace Gaddzeit.Kata.Tests.Unit
{
    [TestFixture]
    public class ItemTests
    {
        [Test]
        public void Constructor_NoINputs_IsInstanceOfDomainEntityBase()
        {
            var sut = new Item();
            Assert.IsInstanceOf(typeof(DomainEntityBase), sut);
        }
    }
}
