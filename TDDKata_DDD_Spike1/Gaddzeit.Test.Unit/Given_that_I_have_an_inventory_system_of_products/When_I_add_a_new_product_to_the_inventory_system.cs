using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gaddzeit.Domain;
using NUnit.Framework;

namespace Gaddzeit.Test.Unit.Given_that_I_have_an_inventory_system_of_products
{
    [TestFixture]
    public class When_I_add_a_new_product_to_the_inventory_system
    {
        [Test]
        public void Then_that_product_should_be_listed_in_inventory_by_brand_and_model()
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
        public void AddMethod_AnyLengthInput_ReturnsSum()
        {
            var expected = 0;
            var numbersToAdd = "";
            Enumerable.Range(2, new Random().Next(3, 999)).ToList().ForEach(x =>
                                                             {
                                                                 expected += x;
                                                                 numbersToAdd += x + ",";
                                                             });
        }
    }
}
