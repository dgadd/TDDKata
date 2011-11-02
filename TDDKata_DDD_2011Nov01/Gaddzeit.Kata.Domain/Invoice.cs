using System;
using System.Collections.Generic;

namespace Gaddzeit.Kata.Domain
{
    public class Invoice : DomainEntityBase
    {
        private IList<LineItem> _lineItems;

        public Invoice()
        {
            _lineItems = new List<LineItem>();
        }

        public IEnumerable<LineItem> LineItems
        {
            get
            {
                return _lineItems;
            }
        }

        public void AddLineItem(LineItem lineItem)
        {
            _lineItems.Add(lineItem);
            
        }
    }
}