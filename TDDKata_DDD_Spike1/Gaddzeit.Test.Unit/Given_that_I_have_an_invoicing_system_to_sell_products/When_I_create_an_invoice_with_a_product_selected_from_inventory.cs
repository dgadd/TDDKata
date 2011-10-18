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
        [Test]
        public void Then_the_product_should_be_added_to_the_invoice()
        {
            var sut = new Invoice();
            Assert.That(sut.LineItems.Count() == 0, "Invoice.LineItems should be 0 for new Invoice.");
            sut.AddLineItem(new Product
            {
                Brand = "Makita",
                Model = "ABC123",
                Price = 15.95M
            });
            Assert.That(sut.LineItems.Count() == 1, "Invoice.LineItems should be 1 for new Invoice.");
        }
    }
}
