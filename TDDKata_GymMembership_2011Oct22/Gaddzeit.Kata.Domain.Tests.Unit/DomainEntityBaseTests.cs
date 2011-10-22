using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;

namespace Gaddzeit.Kata.Domain.Tests.Unit
{
    [TestFixture]
    public class DomainEntityBaseTests
    {
        [Test]
        public void TwoInstances_SameIdProperty_AreEqual()
        {
            const int id = 13515;
            var sut1 = new DomainEntityBase { Id = id };
            var sut2 = new DomainEntityBase { Id = id };

            Assert.AreEqual(sut1, sut2);
        }
    }
}
