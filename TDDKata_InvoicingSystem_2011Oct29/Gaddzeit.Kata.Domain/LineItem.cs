using System;

namespace Gaddzeit.Kata.Domain
{
    public class LineItem : DomainEntityBase
    {
        private string _productCode;

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