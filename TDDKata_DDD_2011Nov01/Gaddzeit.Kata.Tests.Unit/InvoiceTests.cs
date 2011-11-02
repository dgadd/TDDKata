using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gaddzeit.Kata.Domain;
using NUnit.Framework;

namespace Gaddzeit.Kata.Tests.Unit
{
    [TestFixture]
    public class InvoiceTests
    {
        [Test]
        public void Constructor_NoINputs_IsInstanceOfDomainEntityBase()
        {
            var sut = new Invoice();
            Assert.IsInstanceOf(typeof(DomainEntityBase), sut);
        }
    }
}
