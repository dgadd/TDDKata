using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gaddzeit.Support.Model;
using Gaddzeit.Support.Repository;
using Gaddzeit.Support.View;
using NUnit.Framework;

namespace Gaddzeit.Kata.Tests.Integration
{
    [TestFixture]
    public class CuustomerPresenterIntegrationTests
    {
        private ICustomerRepository _customerRepository;
        private ICustomerView _customerView;

        [Test]
        public void FindCustomersByCityEvent_FakeRepositoryAndView_PopulatesView()
        {
            _customerRepository = new FakeCustomerRepository();
            _customerView = new FakeCustomerView();

            const int cityId = 200;
            var customers = new List<Customer>
                                {
                                    new Customer { FirstName = "Bob", LastName = "Smith" }
                                };

            var fakeCustomerView = (FakeCustomerView) _customerView;
            fakeCustomerView.TriggerFindCustomersByCityIdEvent(cityId);

            Assert.AreEqual(customers, fakeCustomerView.Customers);
        }
    }
}
