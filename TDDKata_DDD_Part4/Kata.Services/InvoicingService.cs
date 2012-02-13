using System;
using Gaddzeit.Kata.Domain;

namespace Kata.Services
{
    public class InvoicingService
    {
        public Invoice CreateSimpleInvoicePrePersistenceExample(string productCode, Inventory fakeInventory)
        {
            var inventory = fakeInventory;
            var invoice = new Invoice();
            
            // transfer from inventory to invoice
            var item = inventory.PullItemBy(productCode);
            invoice.BillItem(item);

            return invoice;
        }
    }
}