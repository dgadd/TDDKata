using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gaddzeit.Kata.Support.Domain;
using Gaddzeit.Kata.Support.Presenter;
using Gaddzeit.Kata.Support.Repository;
using Gaddzeit.Kata.Support.View;
using NUnit.Framework;
using Rhino.Mocks;

namespace Gaddzeit.Kata.Tests.Unit
{
    [TestFixture]
    public class CustomerPresenterTests
    {
        private MockRepository _mockRepository;
        private ICustomerRepository _customerRepository;
        private ICustomerView _customerView;
        private ICustomerViewEvents _customerViewEvents;

        [SetUp]
        public void SetUp()
        {
            _mockRepository = new MockRepository();
            _customerRepository = _mockRepository.StrictMock<ICustomerRepository>();
            _customerView = _mockRepository.StrictMock<ICustomerView>();
            _customerViewEvents = _mockRepository.StrictMock<ICustomerViewEvents>();
        }

        [Test]
        public void FindCustomersViewMethod_CityIdInput_PresenterPushesCustomersToView()
        {
            // set up expectations
            const int cityId = 12345;
            var customers = new List<Customer>
                                {
                                    new Customer { FirstName = "Bob", LastName = "Li" }
                                };

            _customerViewEvents.FindCustomersByCityId(cityId);
            Expect.Call(_customerRepository.FindCustomersByCity(cityId)).Return(customers);
            _customerView.Customers = customers;

            _mockRepository.ReplayAll();

            var sut = new CustomerPresenter(_customerRepository, _customerView);
            _customerView.FindCustomersByCityId(cityId);

            _mockRepository.VerifyAll();
        }
        
    }
}
