using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using DomainModel.Abstract;
using DomainModel.Entities;
using NUnit.Framework;
using Rhino.Mocks;
using WebUI.Controllers;

namespace Tests
{
    [TestFixture]
    public class ProductControllerTests
    {
        private MockRepository _mockRepository;
        private IProductsRepository _productsRepository;
        [SetUp]
        public void SetUp()
        {
            //var mock = new Mock<IProductsRepository>();
            //_productsRepository = mock.Object;

            _mockRepository = new MockRepository();
            _productsRepository = _mockRepository.StrictMock<IProductsRepository>();
        }

        [Test]
        public void GetAllProductsMethod_NoInput_ReturnsProducts()
        {
            // set expectations
            var products = new List<Product>
                               {
                                   new Product { ProductId = 35, Category = "computer"}
                               };
            IQueryable<Product> productsQuery = products.AsQueryable();

            Expect.Call(_productsRepository.Products).Return(productsQuery);

            _mockRepository.ReplayAll();

            var sut = new ProductController(_productsRepository);
            var viewResult = (ViewResult)sut.GetProducts();
            _mockRepository.VerifyAll();

        }
    }
}
