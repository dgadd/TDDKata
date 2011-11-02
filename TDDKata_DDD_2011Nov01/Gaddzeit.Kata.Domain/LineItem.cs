using System;

namespace Gaddzeit.Kata.Domain
{
    public class LineItem : DomainEntityBase
    {
        private Invoice _invoice;

        public Invoice Invoice
        {
            get {
                return _invoice;
            }
            set {
                _invoice = value;
            }
        }
    }
}