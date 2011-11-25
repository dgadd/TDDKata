using System;

namespace Gaddzeit.Kata.Domain
{
    public class Item : DomainEntityBase
    {
        private Product _product;
        private string _serialNumber;

        public Product Product
        {
            get {
                return _product;
            }
            set {
                _product = value;
            }
        }

        public string SerialNumber
        {
            get {
                return _serialNumber;
            }
            set {
                _serialNumber = value;
            }
        }
    }
}