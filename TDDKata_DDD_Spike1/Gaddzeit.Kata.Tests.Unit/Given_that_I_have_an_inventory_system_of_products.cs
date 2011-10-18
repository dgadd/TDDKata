using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gaddzeit.Domain;
using NUnit.Framework;

namespace Gaddzeit.Kata.Tests.Unit
{
    [TestFixture]
    public class Given_that_I_have_an_inventory_system_of_products
    {
        [Test]
        public void WHEN_I_add_a_new_product_to_the_inventory_system_Then_that_product_should_be_listed_in_inventory_by_brand_and_model()
        {
            const string brand = "Makita";
            const string model = "ABC123";
            var sut = new InventorySystem();
            sut.AddProduct(new Product
                                {
                                    Brand = brand,
                                    Model = model,
                                    Price = 15.95M
                                });
            Assert.IsTrue(sut.Products.Any(p => p.Brand == brand && p.Model == model));
        }

        [Test]
        public void When_I_receive_a_qty_from_a_shipment_for_a_product_Then_the_product_count_should_be_incremented_by_that_qty()
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
