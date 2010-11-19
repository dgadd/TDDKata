using System.Linq;
using DomainModel.Entities;

namespace DomainModel.Abstract
{
    public interface IProductsRepository
    {
        IQueryable<Product> Products { get; }
    }
}