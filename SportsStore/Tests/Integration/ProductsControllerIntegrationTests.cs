using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DomainModel.Abstract;
using DomainModel.Entities;
using DomainModel.Fakes;
using NUnit.Framework;
using WebUI.Controllers;

namespace Tests.Integration
{
    [TestFixture]
    public class ProductsControllerIntegrationTests
    {
        [Test]
        public void GetProductsMethod_NoInput_ReturnsExpectedQueryable()
        {
            IProductsRepository productsRepository = new FakeProductsRepository();
            var products = new List<Product>
                               {
                                   new Product { Id = 35, Category = "computer"}
                               };
            IQueryable<Product> expected = products.AsQueryable();

            
            var sut = new ProductController(productsRepository);
            var actual = (IQueryable<Product>)sut.GetProducts().ViewData.Model;
            Assert.AreEqual(expected, actual);            
        }
    }
}
