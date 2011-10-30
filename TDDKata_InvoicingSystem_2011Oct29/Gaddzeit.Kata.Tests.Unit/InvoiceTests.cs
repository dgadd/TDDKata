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
            sut.AddLineItem(new LineItem
                                {
                                    ProductCode = "blah"
                                });
            Assert.AreEqual(1, sut.LineItems.Count());
        }

        [Test]
        public void AddLineItemMethod_SameLineItemByIdInput_DoesNotIncrementCount()
        {
            var sut = new Invoice();
            var lineItem = new LineItem
                               {
                                   Id = 35,
                                   ProductCode = "blah"
                               };
            sut.AddLineItem(lineItem);
            Assert.AreEqual(1, sut.LineItems.Count());
            sut.AddLineItem(lineItem);
            Assert.AreEqual(1, sut.LineItems.Count(), "LineItems should NOT increment for the same identifier");
        }

        [Test]
        [ExpectedException(typeof(LineItemContentException), ExpectedMessage = "When adding a line item to an invoice, the line item must have a product code")]
        public void AddLineItemMethod_LineItemWithNoProductCodeInput_WarningIsGivenRequestingProductCode()
        {
            var sut = new Invoice();
            sut.AddLineItem(new LineItem
                                {
                                    ProductCode = ""
                                });
        }

        [Test]
        public void AddLineItemMethod_LineItemWithSameProductCodeInput_IncrementsQuantityOnExistingItem()
        {
            var sut = new Invoice();
            sut.AddLineItem(new LineItem
            {
                Quantity = 4,
                ProductCode = "ABC123"
            });
            sut.AddLineItem(new LineItem
            {
                Quantity = 1,
                ProductCode = "ABC123"
            });

            Assert.AreEqual(1, sut.LineItems.Count());
            Assert.AreEqual(5, sut.LineItems.First().Quantity);
            
        }

        [Test]
        public void SubTotalProperty_MultipleLineItemsInput_MatchesSumOfQuantityTimesPrice()
        {
            var sut = new Invoice();
            sut.AddLineItem(new LineItem
            {
                Quantity = 4,
                ProductCode = "ABC123",
                Price = 3.5M
            });
            sut.AddLineItem(new LineItem
            {
                Quantity = 1,
                ProductCode = "ABC1234",
                Price = 2.75M
            });

            var expected = (4*3.5 + 1*2.75);
            Assert.AreEqual(expected, sut.SubTotal);

        }
    }
}
