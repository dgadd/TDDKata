using System;

namespace Gaddzeit.Kata.Domain
{
    public class LineItem : DomainEntityBase
    {
        private string _productCode;
        private int _quantity;
        private decimal _price;

        public string ProductCode
        {
            get {
                return _productCode;
            }
            set {
                _productCode = value;
            }
        }

        public int Quantity
        {
            get {
                return _quantity;
            }
            set {
                _quantity = value;
            }
        }

        public decimal Price
        {
            get {
                return _price;
            }
            set {
                _price = value;
            }
        }
    }
}