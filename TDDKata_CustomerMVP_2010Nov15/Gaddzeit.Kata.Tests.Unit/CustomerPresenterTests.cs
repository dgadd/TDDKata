using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gaddzeit.Support.Model;
using Gaddzeit.Support.Presenter;
using Gaddzeit.Support.Repository;
using Gaddzeit.Support.View;
using NUnit.Framework;
using Rhino.Mocks;
using Rhino.Mocks.Interfaces;

namespace Gaddzeit.Kata.Tests.Unit
{
    [TestFixture]
    public class CustomerPresenterTests
    {
        private MockRepository _mockRepository;
        private ICustomerRepository _customerRepository;
        private ICustomerView _customerView;

        [SetUp]
        public void SetUp()
        {
            _mockRepository = new MockRepository();
            _customerRepository = _mockRepository.StrictMock<ICustomerRepository>();
            _customerView = _mockRepository.StrictMock<ICustomerView>();
        }

        [Test]
        public void FindCustomersEvent_CityIdInput_PushesCustomersToViewProperty()
        {
            _customerView.FindCustomers += null;
            IEventRaiser findCustomersEvent = LastCall.IgnoreArguments().GetEventRaiser();

            const int cityId = 200;
            var customers = new List<Customer>
                                {
                                    new Customer { FirstName = "Bob", LastName = "Smith" }
                                };
            Expect.Call(_customerRepository.FindCustomersByCityId(cityId)).Return(customers);
            _customerView.Customers = customers;

            _mockRepository.ReplayAll();

            var sut = new CustomerPresenter(_customerRepository, _customerView);
            findCustomersEvent.Raise(_customerView, new FindCustomerEventArgs{ CityId = cityId } );

            _mockRepository.VerifyAll();
        }
    }
}
