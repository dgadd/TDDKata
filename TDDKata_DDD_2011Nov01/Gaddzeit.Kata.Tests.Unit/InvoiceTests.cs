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

        [Test]
        public void LineItemsProperty_Getter_IsReadOnlyCollection()
        {
            var sut = new Invoice();
            Assert.IsInstanceOf(typeof(IEnumerable<LineItem>), sut.LineItems);
        }

        [Test]
        public void AddLineItemsMethod_LineItemInput_IncrementLineItemsCollection()
        {
            var sut = new Invoice();
            Assert.AreEqual(0, sut.LineItems.Count());

            sut.AddLineItem(new LineItem());
            Assert.AreEqual(1, sut.LineItems.Count());
        }

        [Test]
        public void AddLineItemsMethod_SameLineItemTwiceInput_DoesNotIncrementLineItemsCollection()
        {
            var sut = new Invoice();
            var lineItem = new LineItem {Id = 3522};

            sut.AddLineItem(lineItem);
            Assert.AreEqual(1, sut.LineItems.Count());
            sut.AddLineItem(lineItem);
            Assert.AreEqual(1, sut.LineItems.Count());
        }

    }
}
