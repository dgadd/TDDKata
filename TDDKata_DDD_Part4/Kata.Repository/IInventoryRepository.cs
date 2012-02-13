using Gaddzeit.Kata.Domain;

namespace Kata.Repository
{
    public interface IInventoryRepository
    {
        Inventory LoadInventoryByProduct(IUnitOfWork unitOfWork, string productCode);
    }
}