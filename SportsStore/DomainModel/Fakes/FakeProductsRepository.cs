using System;
using System.Collections.Generic;
using System.Linq;
using DomainModel.Abstract;
using DomainModel.Entities;

namespace DomainModel.Fakes
{
    public class FakeProductsRepository : IProductsRepository
    {
        public IQueryable<Product> Products
        {
            get
            {
                var products = new List<Product>
                               {
                                   new Product { Id = 35, Category = "computer"}
                               };
                return products.AsQueryable();
            }
        }
    }
}