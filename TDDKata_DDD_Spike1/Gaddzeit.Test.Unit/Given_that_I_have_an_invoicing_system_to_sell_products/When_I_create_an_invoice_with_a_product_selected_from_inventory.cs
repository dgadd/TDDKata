using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gaddzeit.Domain;
using NUnit.Framework;

namespace Gaddzeit.Test.Unit.Given_that_I_have_an_invoicing_system_to_sell_products
{
    [TestFixture]
    public class When_I_create_an_invoice_with_a_product_selected_from_inventory
    {
        private Invoice _sut;
        private InventorySystem _inventorySystem;

        [SetUp]
        public void SetUp()
        {
            const int productCount = 5;
            _sut = new Invoice();
            _inventorySystem = new InventorySystem();
            SetupInventorySystemWithProductCountOf(productCount);

            Assert.That(_inventorySystem.Products.Count() == 5, string.Format("InvetorySystem.Products count should be {0} for new Invoice.", productCount));
            Assert.That(_sut.LineItems.Count() == 0, "Invoice.LineItems should be 0 for new Invoice.");

            const string brand = "Makita";
            const string model = "ABC123";
            _sut.AddLineItem(_inventorySystem.GetProductByBrandAndModel(brand, model));
        }

        [Test]
        public void Then_the_product_should_be_added_to_the_invoice()
        {
            Assert.That(_sut.LineItems.Count() == 1, "Invoice.LineItems should be 1 for new Invoice.");
        }

        [Test]
        public void And_the_product_item_should_be_decremented_from_inventory()
        {
            Assert.That(_inventorySystem.Products.Count() == 4, "InventorySystem.Products should be decremented by 1.");
        }


        private void SetupInventorySystemWithProductCountOf(int howMany)
        {
            for (int i = 0; i < howMany; i++)
            {
                _inventorySystem.AddProduct(new Product
                {
                    Brand = "Makita",
                    Model = "ABC123",
                    Price = 15.95M
                });
            }
        }
    }
}
