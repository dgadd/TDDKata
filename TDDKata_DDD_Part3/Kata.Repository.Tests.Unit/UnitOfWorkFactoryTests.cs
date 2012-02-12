using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;

namespace Kata.Repository.Tests.Unit
{
    [TestFixture]
    public class UnitOfWorkFactoryTests
    {
        [Test]
        public void Constructor_NoInputs_IsInstanceOfInterface()
        {
            var sut = new UnitOfWorkFactory();
            Assert.IsInstanceOf(typeof(IUnitOfWorkFactory), sut);
        }

    }
}
