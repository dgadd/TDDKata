using System.Collections.Generic;
using System.Linq;
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
        public void LineItemsMethod_NoInputs_IsIEnumerableLineItem()
        {
            var sut = new Invoice();
            Assert.IsInstanceOf(typeof(IEnumerable<LineItem>), sut.LineItems);
        }

        [Test]
        public void AddLineItemMethod_LineItemInput_IncrementsCount()
        {
            var sut = new Invoice();
            Assert.AreEqual(0, sut.LineItems.Count());
            sut.AddLineItem(new LineItem());
            Assert.AreEqual(1, sut.LineItems.Count());
        }
    }
}
