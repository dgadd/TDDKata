using System;
using System.Collections.Generic;

namespace Gaddzeit.Kata.Domain
{
    public class Invoice :DomainEntityBase
    {
        private IEnumerable<LineItem> _lineItems;

        public IEnumerable<LineItem> LineItems
        {
            get
            {
                _lineItems = new List<LineItem>();
                return _lineItems;
            }
        }
    }
}