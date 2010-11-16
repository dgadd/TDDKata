using System.Collections.Generic;
using Gaddzeit.Support.Model;

namespace Gaddzeit.Support.Repository
{
    public interface ICustomerRepository
    {
        List<Customer> FindCustomersByCityId(int cityId);
    }
}