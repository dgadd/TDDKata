using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gaddzeit.Domain;
using NUnit.Framework;

namespace Gaddzeit.Test.Unit.Given_that_I_have_an_inventory_system_of_products
{
    [TestFixture]
    public class When_I_receive_a_qty_from_a_shipment_for_a_product
    {
        [Test]
        public void Then_the_product_count_should_be_incremented_by_that_qty()
        {
            const string brand = "Makita";
            const string model = "ABC123";
            const int qty = 5;

            var sut = new InventorySystem();
            Assert.AreEqual(0, sut.Products.Count());
            sut.ReceiveShipmentOfProduct(brand, model, qty);
            Assert.AreEqual(5, sut.Products.Count());
        }
    }
}
