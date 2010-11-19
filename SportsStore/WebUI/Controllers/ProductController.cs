using System;
using System.Web.Mvc;
using DomainModel.Abstract;

namespace WebUI.Controllers
{
    public class ProductController : Controller
    {
        private readonly IProductsRepository _productsRepository;

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