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
            GuardCondition_RejectEmptyProductCodes(lineItem);
            if (IncrementQuantityIfNewLineItemIsExisting(lineItem))
                return;
            _lineItems.Add(lineItem);
        }

        private bool IncrementQuantityIfNewLineItemIsExisting(LineItem lineItem)
        {
            bool existingLineItemIncremented = false;
            foreach(var existingLineItem in _lineItems)
            {
                if (existingLineItem.ProductCode.Equals(lineItem.ProductCode))
                {
                    existingLineItem.Quantity += lineItem.Quantity;
                    existingLineItemIncremented = true;
                }
            }
            return existingLineItemIncremented;
        }

        private static void GuardCondition_RejectEmptyProductCodes(LineItem lineItem)
        {
            if (string.IsNullOrEmpty(lineItem.ProductCode))
                throw new LineItemContentException("When adding a line item to an invoice, the line item must have a product code");
        }
    }
}