using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gaddzeit.Kata.Domain;
using Kata.Repository;
using NUnit.Framework;
using Rhino.Mocks;

namespace Kata.Services.Tests.Unit
{
    [TestFixture]
    public class InvoicingServiceTests
    {
        private MockRepository _mockRepository;
        private IInvoiceRepository _invoiceRepository;
        private IInventoryRepository _inventoryRepository;
        private IUnitOfWorkFactory _unitOfWorkFactory;
        private IUnitOfWork _unitOfWork;

        [SetUp]
        public void SetUp()
        {
            _mockRepository = new MockRepository();
            _invoiceRepository = _mockRepository.StrictMock<IInvoiceRepository>();
            _inventoryRepository = _mockRepository.StrictMock<IInventoryRepository>();
            _unitOfWorkFactory = _mockRepository.StrictMock<IUnitOfWorkFactory>();
            _unitOfWork = _mockRepository.StrictMock<IUnitOfWork>();
        }

        [Test]
        public void CreateSimpleInvoiceMethod_ProductCodeAndSerialNumberInputs_GenratesSimpleInvoice()
        {
            // declare constants

            // expectations
            
            _mockRepository.ReplayAll();
            // call to new service method
            _mockRepository.VerifyAll();
        }



        [Test]
        public void CreateSimpleInvoicePrePersistenceExampleMethod_ProductCodeInput_CreatesOneLineInvoice()
        {
            const string productCode = "ABCD1234";
            const string serialNumber = "MM12345";

            var fakeInventoryNonPersisted = CreateFakeInventoryIncludingProductCode(productCode, serialNumber);

            var sut = new InvoicingService();
            Invoice invoice = sut.CreateSimpleInvoicePrePersistenceExample(productCode, fakeInventoryNonPersisted);

            Assert.AreEqual(productCode, invoice.LineItems.First().Item.Product.ProductCode);
            Assert.AreEqual(serialNumber, invoice.LineItems.First().Item.SerialNumber);
        }

        private static Inventory CreateFakeInventoryIncludingProductCode(string productCode, string serialNumber)
        {
            var fakeInventory = new Inventory { Id = 1234 };
            fakeInventory.StockItemBy(productCode, serialNumber);
            return fakeInventory;
        }
    }
}
