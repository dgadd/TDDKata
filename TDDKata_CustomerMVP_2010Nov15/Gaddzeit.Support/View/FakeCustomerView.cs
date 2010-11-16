using System;
using System.Collections.Generic;
using Gaddzeit.Support.Model;
using Gaddzeit.Support.Presenter;
using Gaddzeit.Support.Repository;

namespace Gaddzeit.Support.View
{
    public class FakeCustomerView : ICustomerView
    {
        private CustomerPresenter _customerPresenter;

        public FakeCustomerView()
        {
            _customerPresenter = new CustomerPresenter(new FakeCustomerRepository(), this);
        }
        public void TriggerFindCustomersByCityIdEvent(int cityId)
        {
            this.FindCustomers(this, new FindCustomerEventArgs {CityId = cityId});
        }

        public event EventHandler FindCustomers;

        public List<Customer> Customers { get; set; }
    }
}