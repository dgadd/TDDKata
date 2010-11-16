using System;
using System.Collections.Generic;
using Gaddzeit.Support.Model;

namespace Gaddzeit.Support.Repository
{
    public class FakeCustomerRepository : ICustomerRepository
    {
        public List<Customer> FindCustomersByCityId(int cityId)
        {
            return new List<Customer>
                                {
                                    new Customer { FirstName = "Bob", LastName = "Smith" }
                                };

        }
    }
}