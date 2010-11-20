using System.Collections.Generic;
using System.Linq;
using System.Text;
using DomainModel.Abstract;
using DomainModel.Fakes;
using DomainModel.Utilities;
using NUnit.Framework;

namespace Tests.Unit
{
    [TestFixture]
    public class InterfaceImplementorTests
    {
        [Test]
        public void ResolveMethod_ImplementationAssignedPreviously_IsInstanceOfCorrectImplemenation()
        {
            InterfaceImplementor.AssignImplementationToInterface<IProductsRepository, FakeProductsRepository>();
            var sut = InterfaceImplementor.Resolve<IProductsRepository>();

            Assert.IsInstanceOf(typeof(FakeProductsRepository), sut);
        }
    }
}
