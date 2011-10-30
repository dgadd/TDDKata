using System;
using System.Collections.Generic;
using Iesi.Collections.Generic;

namespace Gaddzeit.Kata.Domain
{
    public class Invoice : DomainEntityBase
    {
        private Iesi.Collections.Generic.ISet<LineItem> _lineItems;

        public Invoice()
        {
            _lineItems = new HashedSet<LineItem>();
        }

        public IEnumerable<LineItem> LineItems
        {
            get { return _lineItems; }
        }

        public void AddLineItem(LineItem lineItem)
        {
            _lineItems.Add(lineItem);
        }
    }
}