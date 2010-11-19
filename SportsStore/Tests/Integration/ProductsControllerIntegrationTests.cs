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
        public void dontknow()
        {
            IProductsRepository productsRepository = new FakeProductsRepository();
            var products = new List<Product>
                               {
                                   new Product { ProductId = 35, Category = "computer"}
                               };
            IQueryable<Product> productsQuery = products.AsQueryable();

            
            var sut = new ProductController(productsRepository);
            Assert.AreEqual(productsQuery, sut.GetProducts().ViewData.Model);            
        }
    }
}
