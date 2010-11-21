using System;
using Gaddzeit.Kata.Support.Repository;
using Gaddzeit.Kata.Support.View;

namespace Gaddzeit.Kata.Support.Presenter
{
    public class CustomerPresenter : ICustomerViewEvents
    {
        private readonly ICustomerRepository _customerRepository;
        private readonly ICustomerView _customerView;

        public CustomerPresenter(ICustomerRepository customerRepository, ICustomerView customerView)
        {
            _customerRepository = customerRepository;
            _customerView = customerView;
        }

        public void FindCustomersByCityId(int cityId)
        {
            var customers = _customerRepository.FindCustomersByCity(cityId);
            _customerView.Customers = customers;
        }
    }
}