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

            sut.AddLineItem(new LineItem { Item = new Item { Id = 1324, SerialNumber = "MM1234" } });
            Assert.AreEqual(1, sut.LineItems.Count());
        }

        [Test]
        public void AddLineItemsMethod_SameLineItemTwiceInput_DoesNotIncrementLineItemsCollection()
        {
            var sut = new Invoice();
            var lineItem = new LineItem { Id = 3522, Item = new Item { Id = 1324, SerialNumber = "MM1234" } };

            sut.AddLineItem(lineItem);
            Assert.AreEqual(1, sut.LineItems.Count());
            sut.AddLineItem(lineItem);
            Assert.AreEqual(1, sut.LineItems.Count());
        }

        [Test]
        public void AddLineItemsMethod_LineItemInput_InvoicePropertyMatchesParent()
        {
            var sut = new Invoice();
            var lineItem = new LineItem { Id = 3522, Item = new Item { Id = 1324, SerialNumber = "MM1234" } };

            sut.AddLineItem(lineItem);

            Assert.AreEqual(lineItem.Invoice, sut);
        }

//        Given an existing LineItem, when I try to add a LineItem without a ProductCode,
//then I am informed that I must provide a ProductCode.
        [Test]
        [ExpectedException(typeof(InvalidLineItemException), ExpectedMessage = "You must provide an Item")]
        public void AddLineItemsMethod_LineItemWithoutProductCode_ThrowsException()
        {
            var sut = new Invoice();
            var lineItem = new LineItem { Id = 3522 };

            sut.AddLineItem(lineItem);
        }

    }
}
