using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gaddzeit.Kata.Domain;
using NUnit.Framework;

namespace Kata.Services.Tests.Unit
{
    [TestFixture]
    public class InvoicingServiceTests
    {
        [Test]
        public void CreateSimpleInvoicePrePersistenceExampleMethod_ProductCodeInput_CreatesOneLineInvoice()
        {
            const string productCode = "ABCD1234";
            const string serialNumber = "MM12345";

            var fakeInventoryNonPersisted = CreateFakeInventoryIncludingProductCode(productCode, serialNumber);

            var sut = new InvoicingService();
            Invoice invoice = sut.CreateSimpleInvoicePrePersistenceExample(productCode, fakeInventoryNonPersisted);

            Assert.AreEqual(productCode, invoice.LineItems.First().Item.Product.ProductCode);
            Assert.AreEqual(serialNumber, invoice.LineItems.First().Item.SerialNumber);
        }

        private static Inventory CreateFakeInventoryIncludingProductCode(string productCode, string serialNumber)
        {
            var fakeInventory = new Inventory {Id = 1234};
            fakeInventory.StockItemBy(productCode, serialNumber);
            return fakeInventory;
        }
    }
}
