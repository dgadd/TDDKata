using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gaddzeit.Kata.Domain;
using NUnit.Framework;

namespace Gaddzeit.Kata.Tests.Unit
{
    [TestFixture]
    public class ProductTests
    {
        [Test]
        public void Constructor_NoINputs_IsInstanceOfDomainEntityBase()
        {
            var sut = new Product();
            Assert.IsInstanceOf(typeof(DomainEntityBase), sut);
        }

        [Test]
        public void ItemsProperty_Getter_IsReadOnlyCollection()
        {
            var sut = new Product();
            Assert.IsInstanceOf(typeof(IEnumerable<Item>), sut.Items);
        }

        [Test]
        public void AddItemsMethod_ItemInput_IncrementItemsCollection()
        {
            var sut = new Product();
            Assert.AreEqual(0, sut.Items.Count());

            sut.AddItem(new Item { SerialNumber = "aaa" });
            Assert.AreEqual(1, sut.Items.Count());
        }

        [Test]
        public void AddItemsMethod_SameItemTwiceInput_DoesNotIncrementItemsCollection()
        {
            var sut = new Product();
            var lineItem = new Item { Id = 3522, SerialNumber = "aaa" };

            sut.AddItem(lineItem);
            Assert.AreEqual(1, sut.Items.Count());
            sut.AddItem(lineItem);
            Assert.AreEqual(1, sut.Items.Count());
        }

        [Test]
        public void AddItemsMethod_ItemInput_ProductPropertyMatchesParent()
        {
            var sut = new Product();
            var lineItem = new Item { Id = 3522, SerialNumber = "aaa" };

            sut.AddItem(lineItem);

            Assert.AreEqual(lineItem.Product, sut);
        }

        //        Given an existing Item, when I try to add a Item without a SerialNumber,
        //then I am informed that I must provide a SerialNumber.
        [Test]
        [ExpectedException(typeof(InvalidItemException), ExpectedMessage = "You must provide a SerialNumber")]
        public void AddItemsMethod_ItemWithoutSerialNumber_ThrowsException()
        {
            var sut = new Product();
            var lineItem = new Item { Id = 3522 };

            sut.AddItem(lineItem);
        }
    }
}
