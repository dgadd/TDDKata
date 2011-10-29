using System;
using System.Collections.Generic;

namespace Gaddzeit.Kata.Domain
{
    public class Invoice : DomainEntityBase
    {
        private IList<LineItem> _lineItems;

        public IList<LineItem> LineItems
        {
            get { return _lineItems; }
        }
    }
}