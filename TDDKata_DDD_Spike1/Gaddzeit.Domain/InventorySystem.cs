using System;
using System.Collections.Generic;
using System.Linq;
using Iesi.Collections.Generic;

namespace Gaddzeit.Domain
{
    public class InventorySystem
    {
        private Iesi.Collections.Generic.ISet<Product> _products;

        public InventorySystem()
        {
            _products = new HashedSet<Product>();
        }

        public IEnumerable<Product> Products
        {
            get { return _products; }
        }

        public void AddProduct(Product product)
        {
            _products.Add(product);
        }

        public void ReceiveShipmentOfProduct(string brand, string model, int qty)
        {
            for (var i = 0; i < qty; i++)
            {
                _products.Add(new Product
                {
                    Brand = brand,
                    Model = model
                });                
            }
        }

        public Product GetProductByBrandAndModel(string brand, string model)
        {
            IEnumerable<Product> products = _products.Where(p => p.Brand == brand && p.Model == model);
            Product retrievedProduct = products.First();
            _products.Remove(retrievedProduct);
            return retrievedProduct;
        }
    }
}