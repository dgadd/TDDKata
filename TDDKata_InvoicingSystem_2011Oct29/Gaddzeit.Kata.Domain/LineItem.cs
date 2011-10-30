using System;

namespace Gaddzeit.Kata.Domain
{
    public class LineItem : DomainEntityBase
    {
        private string _productCode;
        private int _quantity;

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
    }
}