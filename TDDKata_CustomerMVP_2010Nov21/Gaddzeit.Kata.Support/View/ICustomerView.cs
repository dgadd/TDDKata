using System.Collections.Generic;
using Gaddzeit.Kata.Support.Domain;

namespace Gaddzeit.Kata.Support.View
{
    public interface ICustomerView : ICustomerViewEvents
    {
        List<Customer> Customers { get; set; }
    }
}