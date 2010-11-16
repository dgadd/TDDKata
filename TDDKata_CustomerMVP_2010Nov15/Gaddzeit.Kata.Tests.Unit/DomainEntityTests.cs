using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gaddzeit.Support.Model;
using NUnit.Framework;

namespace Gaddzeit.Kata.Tests.Unit
{
    [TestFixture]
    public class DomainEntityTests
    {
        [Test]
        public void TwoInstances_SameIdProperty_AreEqual()
        {
            const int tempId = 12351;
            var sut1 = new DomainEntity { Id = tempId };
            var sut2 = new DomainEntity { Id = tempId };

            Assert.AreEqual(sut1, sut2);
        }

        [Test]
        public void TwoInstances_DifferentIdProperty_AreNotEqual()
        {
            var sut1 = new DomainEntity { Id = 1531 };
            var sut2 = new DomainEntity { Id = 24662 };

            Assert.AreNotEqual(sut1, sut2);
        }
    }
}
