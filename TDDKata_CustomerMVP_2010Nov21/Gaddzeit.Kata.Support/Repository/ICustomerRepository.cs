using System.Collections.Generic;
using Gaddzeit.Kata.Support.Domain;

namespace Gaddzeit.Kata.Support.Repository
{
    public interface ICustomerRepository
    {
        List<Customer> FindCustomersByCity(int cityId);
    }
}