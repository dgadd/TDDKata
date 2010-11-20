using System;
using System.Web.Mvc;
using DomainModel.Abstract;
using DomainModel.Fakes;
using DomainModel.Utilities;

namespace WebUI.Controllers
{
    public class ProductController : Controller
    {
        private readonly IProductsRepository _productsRepository;

        public ProductController()
        {
            InterfaceImplementor.AssignImplementationToInterface<IProductsRepository, FakeProductsRepository>();
            _productsRepository = InterfaceImplementor.Resolve<IProductsRepository>();
        }

        public ProductController(IProductsRepository productsRepository)
        {
            _productsRepository = productsRepository;
        }

        public ViewResult GetProducts()
        {
            var products = _productsRepository.Products;
            return View(products);
        }
    }
}