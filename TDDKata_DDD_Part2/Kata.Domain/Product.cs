using System;
using System.Collections.Generic;
using Iesi.Collections.Generic;

namespace Gaddzeit.Kata.Domain
{
    public class Product : DomainEntityBase
    {
        private Inventory _inventory;
        private string _productCode;
        private readonly Iesi.Collections.Generic.ISet<Item> _items;

        public Product()
        {
            _items = new HashedSet<Item>();
        }

        public Inventory Inventory
        {
            get {
                return _inventory;
            }
            set {
                _inventory = value;
            }
        }

        public string ProductCode
        {
            get {
                return _productCode;
            }
            set {
                _productCode = value;
            }
        }

        public IEnumerable<Item> Items
        {
            get
            {
                return _items;
            }
        }

        public void AddItem(Item item)
        {
            GuardCondition_ItemMustHaveProductCode(item);
            item.Product = this;
            _items.Add(item);
            
        }

        private static void GuardCondition_ItemMustHaveProductCode(Item item)
        {
            if(string.IsNullOrEmpty(item.SerialNumber))
                throw new InvalidItemException("You must provide a SerialNumber");
        }

        public void RemoveItem(Item item)
        {
            _items.Remove(item);
        }
    }
}