using System;
using System.Collections.Generic;
using Iesi.Collections.Generic;

namespace Gaddzeit.Kata.Domain
{
    public class Invoice : DomainEntityBase
    {
        private readonly Iesi.Collections.Generic.ISet<LineItem> _lineItems;

        public Invoice()
        {
            _lineItems = new HashedSet<LineItem>();
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
            GuardCondition_LineItemMustHaveProductCode(lineItem);
            lineItem.Invoice = this;
            _lineItems.Add(lineItem);
            
        }

        private static void GuardCondition_LineItemMustHaveProductCode(LineItem lineItem)
        {
            if(string.IsNullOrEmpty(lineItem.ProductCode))
                throw new InvalidLineItemException("You must provide a ProductCode");
        }
    }
}