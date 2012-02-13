using System;

namespace Gaddzeit.Kata.Domain
{
    public class LineItem : DomainEntityBase
    {
        private Invoice _invoice;
        private Item _item;

        public Invoice Invoice
        {
            get {
                return _invoice;
            }
            set {
                _invoice = value;
            }
        }

        public Item Item
        {
            get {
                return _item;
            }
            set {
                _item = value;
            }
        }
    }
}