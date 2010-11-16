using System;
using Gaddzeit.Support.Repository;
using Gaddzeit.Support.View;

namespace Gaddzeit.Support.Presenter
{
    public class CustomerPresenter
    {
        private readonly ICustomerRepository _customerRepository;
        private readonly ICustomerView _customerView;

        public CustomerPresenter(ICustomerRepository customerRepository, ICustomerView customerView)
        {
            _customerRepository = customerRepository;
            _customerView = customerView;

            _customerView.FindCustomers += new EventHandler(_customerView_FindCustomers);
        }

        void _customerView_FindCustomers(object sender, EventArgs e)
        {
            var findCustomerEventArgs = (FindCustomerEventArgs) e;
            var customers = _customerRepository.FindCustomersByCityId(findCustomerEventArgs.CityId);
            _customerView.Customers = customers;
        }
    }
}