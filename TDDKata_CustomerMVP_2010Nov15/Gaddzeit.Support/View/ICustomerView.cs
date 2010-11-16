using System;
using System.Collections.Generic;
using Gaddzeit.Support.Model;

namespace Gaddzeit.Support.View
{
    public interface ICustomerView
    {
        event EventHandler FindCustomers;
        List<Customer> Customers { get; set; }
    }
}