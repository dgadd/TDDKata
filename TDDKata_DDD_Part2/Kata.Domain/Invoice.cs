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
            GuardCondition_LineItemMustHaveItem(lineItem);
            lineItem.Invoice = this;
            _lineItems.Add(lineItem);
            
        }

        private static void GuardCondition_LineItemMustHaveItem(LineItem lineItem)
        {
            if (lineItem.Item == null)
                throw new InvalidLineItemException("You must provide an Item");
        }
    }
}