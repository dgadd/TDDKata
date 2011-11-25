using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gaddzeit.Kata.Domain;
using NUnit.Framework;

namespace Gaddzeit.Kata.Tests.Unit
{
    [TestFixture]
    public class InventoryTests
    {
        [Test]
        public void Constructor_NoINputs_IsInstanceOfDomainEntityBase()
        {
            var sut = new Inventory();
            Assert.IsInstanceOf(typeof(DomainEntityBase), sut);
        }

        [Test]
        public void ProductsProperty_Getter_IsReadOnlyCollection()
        {
            var sut = new Inventory();
            Assert.IsInstanceOf(typeof(IEnumerable<Product>), sut.Products);
        }

        [Test]
        public void AddProductsMethod_ProductInput_IncrementProductsCollection()
        {
            var sut = new Inventory();
            Assert.AreEqual(0, sut.Products.Count());

            sut.AddProduct(new Product { ProductCode = "aaa" });
            Assert.AreEqual(1, sut.Products.Count());
        }

        [Test]
        public void AddProductsMethod_SameProductTwiceInput_DoesNotIncrementProductsCollection()
        {
            var sut = new Inventory();
            var lineItem = new Product { Id = 3522, ProductCode = "aaa" };

            sut.AddProduct(lineItem);
            Assert.AreEqual(1, sut.Products.Count());
            sut.AddProduct(lineItem);
            Assert.AreEqual(1, sut.Products.Count());
        }

        [Test]
        public void AddProductsMethod_ProductInput_InventoryPropertyMatchesParent()
        {
            var sut = new Inventory();
            var lineItem = new Product { Id = 3522, ProductCode = "aaa" };

            sut.AddProduct(lineItem);

            Assert.AreEqual(lineItem.Inventory, sut);
        }

        [Test]
        public void GetNewOrExistingProductBy_ProductCodeInput_ReturnsMatchingProduct()
        {
            const string productCode = "ABCD1234";

            var sut = new Inventory { Id = 132412 };
            Product product = sut.GetNewOrExistingProductBy(productCode);
        }

        [Test]
        public void StockItemBy_ProductCodeAndSerialNumberInput_IncrementsItem()
        {
            const string productCode = "ABCD1234";
            const string serialNumber = "MM1235125";

            var sut = new Inventory { Id = 132412 };
            sut.StockItemBy(productCode, serialNumber);

            Assert.AreEqual(1, sut.Products.Count());
            Assert.AreEqual(productCode, sut.Products.First().ProductCode);
            Assert.AreEqual(1, sut.Products.First().Items.Count());
            Assert.AreEqual(serialNumber, sut.Products.First().Items.First().SerialNumber);
        }

        [Test]
        public void PullItemBy_ProductCodeInput_ReturnsMatchingItem()
        {
            const string productCode = "ABCD1234";
            const string serialNumber = "MM1235125";

            var sut = new Inventory { Id = 132412 };
            sut.StockItemBy(productCode, serialNumber);
            Item item = sut.PullItemBy(productCode);

            Assert.IsNotNull(item);
            Assert.AreEqual(serialNumber, item.SerialNumber);
            Assert.AreEqual(0, sut.Products.First().Items.Count());
        }

    }
}
