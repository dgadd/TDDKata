using System;
using Gaddzeit.Kata.Domain;
using Kata.Repository;

namespace Kata.Services
{
    public class InvoicingService
    {
        private readonly IUnitOfWorkFactory _unitOfWorkFactory;
        private readonly IInventoryRepository _inventoryRepository;
        private readonly IInvoiceRepository _invoiceRepository;

        public InvoicingService(IUnitOfWorkFactory unitOfWorkFactory, IInventoryRepository inventoryRepository, IInvoiceRepository invoiceRepository)
        {
            _unitOfWorkFactory = unitOfWorkFactory;
            _inventoryRepository = inventoryRepository;
            _invoiceRepository = invoiceRepository;
        }

        public InvoicingService()       
        {
        }

        public Invoice CreateSimpleInvoicePrePersistenceExample(string productCode, Inventory fakeInventory)
        {
            var inventory = fakeInventory;
            var invoice = new Invoice();
            
            // transfer from inventory to invoice
            var item = inventory.PullItemBy(productCode);
            invoice.BillItem(item);

            return invoice;
        }

        public Invoice CreateSimpleInvoice(string productCode, string serialNumber)
        {
            using(IUnitOfWork unitOfWork = _unitOfWorkFactory.Create())
            {
                Inventory inventory = _inventoryRepository.LoadInventoryByProduct(unitOfWork, productCode);
                Item item = inventory.PullItemBy(productCode);
                var invoice = new Invoice();
                invoice.BillItem(item);
                _invoiceRepository.Save(unitOfWork, invoice);
                unitOfWork.Commit();
                return invoice;
            }
        }
    }
}