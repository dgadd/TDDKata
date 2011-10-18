using System;
using System.Collections.Generic;
using Iesi.Collections.Generic;

namespace Gaddzeit.Domain
{
    public class Invoice
    {
        private readonly Iesi.Collections.Generic.ISet<LineItem> _lineItems;

        public Invoice()
        {
            _lineItems = new HashedSet<LineItem>();
        }

        public Iesi.Collections.Generic.ISet<LineItem> LineItems
        {
            get { return _lineItems; }
        }

        public void AddLineItem(Product product)
        {
            _lineItems.Add(new LineItem
                               {
                                   Product = product
                               });
        }
    }
}