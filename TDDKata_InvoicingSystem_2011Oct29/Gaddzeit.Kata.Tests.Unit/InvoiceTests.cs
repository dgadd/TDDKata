using System.Collections.Generic;
using Gaddzeit.Kata.Domain;
using NUnit.Framework;

namespace Gaddzeit.Kata.Tests.Unit
{
    [TestFixture]
    public class InvoiceTests
    {
        [Test]
        public void Constructor_NoInput_IsInstanceOfDomainEntityBase()
        {
            var sut = new Invoice();
            Assert.IsInstanceOf(typeof(DomainEntityBase), sut);
        }

        [Test]
        public void LineItemsMethod_NoInputs_ReturnssIEnumerableLineItems()
        {
            var sut = new Invoice();
            Assert.IsFalse(typeof(Invoice).GetProperty("LineItems").CanWrite);
        }
    }
}
