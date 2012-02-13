using Gaddzeit.Kata.Domain;

namespace Kata.Repository
{
    public interface IInvoiceRepository
    {
        void Save(IUnitOfWork unitOfWork, Invoice invoice);
    }
}