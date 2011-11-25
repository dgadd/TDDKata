using System;

namespace Gaddzeit.Kata.Domain
{
    public class LineItem : DomainEntityBase
    {
        private Invoice _invoice;
        private string _productCode;

        public Invoice Invoice
        {
            get {
                return _invoice;
            }
            set {
                _invoice = value;
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
    }
}