using System.Collections.Generic;
using Iesi.Collections.Generic;

namespace Gaddzeit.Kata.Domain
{
    public class Inventory : DomainEntityBase
    {
        private readonly Iesi.Collections.Generic.ISet<Product> _products;

        public Inventory()
        {
            _products = new HashedSet<Product>();
        }

        public IEnumerable<Product> Products
        {
            get
            {
                return _products;
            }
        }

        public void AddProduct(Product product)
        {
            GuardCondition_ProductMustHaveProductCode(product);
            product.Inventory = this;
            _products.Add(product);
            
        }

        private static void GuardCondition_ProductMustHaveProductCode(Product product)
        {
            if(string.IsNullOrEmpty(product.ProductCode))
                throw new InvalidProductException("You must provide a ProductCode");
        }
    }
}