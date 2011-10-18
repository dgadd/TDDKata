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
        public void WHEN_I_add_a_new_product_to_the_inventory_system_THEN_that_product_name_should_be_listed_in_inventory()
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
    }
}
